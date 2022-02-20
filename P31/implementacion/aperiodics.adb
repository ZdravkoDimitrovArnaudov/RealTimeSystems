with Task_Params; use Task_Params;
with Priority_Queue;
with Event_Monitor; use Event_Monitor;

with Ada.Numerics.Float_Random; use Ada.Numerics;

package body Aperiodics is

   --  Random number generator
   Gen                      : Float_Random.Generator;

   Initial_Time             : Time;
   Aperiodic_Id             : User_Task_Id;
   Iteration                : Natural := 0;
   Event                    : Activation_Kinds;

   --  Relative time
   Aperiodic_Activation     : Duration := 0.0;

   package Activation_Queue is new Priority_Queue
     (Size       => 50,
      Element    => Positive,
      Priority   => Duration,
      ">"        => "<",
      "="        => "=");

   protected body Event_Generator is
      procedure New_Event is
      begin
         Index := Index + 1;
      end New_Event;

      entry Wait_For_Event (Activation_Time : out Time) when (Index > 0) is
         The_Activation    : Duration;
         Activation_Number : Positive;
      begin
         Activation_Queue.Dequeue (Activation_Number, The_Activation);
         Activation_Time := Initial_Time + To_Time_Span (The_Activation);
         Index := Index - 1;
      end Wait_For_Event;
   end Event_Generator;

   ----------------
   -- Next_Event --
   ----------------

   function Next_Event return Duration is
      --  Data mapping
      Min       : constant Duration := Min_Interarrival_Time;
      Max       : constant Duration := Max_Interarrival_Time;
      The_Event : Duration := 0.0;
   begin
      -- A random number between [Min_Interarrival, Max_Interarrival]
      -- Float_Random.Random(Gen) -> Random number between 0 and 1;
      case (Event) is
         when Bursty =>
            The_Event := Duration (Float_Random.Random (Gen)) * (Bound_Interval);
         when Sporadic =>
            The_Event := Min + (Duration (Float_Random.Random (Gen)) * (Max - Min));
         when Periodic =>
            raise Program_Error with "Aperiodic task is not working properly";
      end case;
      return The_Event;
   end Next_Event;

   --------------------
   -- Get_Next_Event --
   --------------------

   procedure Get_Next_Event (Activation_Time : out Duration; Number_Of_Activations : out Positive) is
   begin
      case (Event) is
         when Bursty =>
            --  Simplistic implementation: No more than max activations within the bound interval
            --  It is assumed that the number of activations is max.
            Aperiodic_Activation := Aperiodic_Activation +
              (Duration (Iteration) * Bound_Interval) + Next_Event;
            Iteration := 1; --  This parameters is used to allow the first activation

            Number_Of_Activations :=
              Natural (Float'Ceiling (Float (Float_Random.Random (Gen)) * Float (Max_Arrivals)));

            --  Enqueue to recover the event arrival timestamp
            for Index in 1 .. Number_Of_Activations loop
               Activation_Queue.Enqueue (E => Index,
                                         P => Aperiodic_Activation);
            end loop;

         when Sporadic =>
            Aperiodic_Activation  := Aperiodic_Activation + Next_Event;
            Number_Of_Activations := 1;
            Activation_Queue.Enqueue (E => Number_Of_Activations,
                                      P => Aperiodic_Activation);
         when Periodic =>
            raise Program_Error with "Aperiodic task is not working properly";
      end case;
      Activation_Time := Aperiodic_Activation;

   end Get_Next_Event;

   ----------------------
   -- Get_Aperiodic_Id --
   ----------------------

   function Get_Aperiodic_Id return User_Task_Id is
      Id         : User_Task_Id;
      Found      : Boolean := False;
      Activation : Activation_Kinds;
   begin
      for T in Task_Params.User_Task_Id range 1 .. Task_Params.Number_Of_Tasks loop
         Activation := Task_Params.Get_Parameters (T).Activation;
         case Activation is
            when Periodic =>
               null;
            when Bursty | Sporadic =>
               if Found then
                  raise Program_Error with "only one aperiodic task is supported";
               else
                  Id := T;
                  Event := Activation;
                  Found := True;
               end if;
         end case;
      end loop;
      if Found then
         return Id;
      else
         raise Program_Error with "Aperiodic task is not set up properly";
      end if;
   end Get_Aperiodic_Id;

   -------------------------
   -- Aperiodic_Generator --
   -------------------------

   task body Aperiodic_Generator is

      Next_Activation : Time;
      The_Activation  : Duration;
      Activations     : Natural;
   begin
      Monitor.Start_Completed (Initial_Time);
      Aperiodic_Id := Get_Aperiodic_Id;
      Next_Activation := Initial_Time;
      loop
         Aperiodics.Get_Next_Event (The_Activation, Activations);
         for Index in 1 .. Activations loop
            Monitor.Send_Event (Aperiodic_Id, The_Activation);
         end loop;

         Next_Activation := Initial_Time + To_Time_Span (The_Activation);
         delay until Next_Activation;

         for Index in 1 .. Activations loop
            Event_Generator.New_Event;
         end loop;
      end loop;
   end Aperiodic_Generator;

begin
   --  Reset the random generator
   Float_Random.Reset (Gen => Gen);

end Aperiodics;
