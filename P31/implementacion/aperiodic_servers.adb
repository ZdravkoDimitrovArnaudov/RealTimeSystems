with Aperiodics;
with Event_Monitor, Ada.Real_Time, Execution_Load; use  Event_Monitor, Ada.Real_Time;

with Ada.Exceptions; use Ada;
with Ada.Text_IO; use Ada.Text_IO;

package body Aperiodic_Servers is

   -----------------------
   -- Direct_Processing --
   -----------------------

   task body Direct_Processing  is
      Params : Task_Params.Task_Parameters := Task_Params.Get_Parameters (Id);
      Activation: Time;
      Initial_Time: TIme;

   begin
      Monitor.Register (Id, Initial_Time);
      loop
         Aperiodics.Event_Generator.Wait_For_Event (Activation);
         Monitor.Start_Job (Id);
         Execution_Load.Eat (Params.Exec_Time);
         Monitor.End_Of_Job (Id);
      end loop;
      --null;
   exception
      when Error : others =>
         Put_Line ("Error : " & Exceptions.Exception_Information (Error));
   end Direct_Processing;

   -------------
   -- Polling --
   -------------

   task body Polling is
      Next_Activation : Time := Clock;
      Params : Task_Params.Task_Parameters := Task_Params.Get_Parameters (Id);
      Activation: Time;
      Initial_Time: Time;

   begin
      Monitor.Register (Id, Initial_Time);
      loop
         select
            Aperiodics.Event_Generator.Wait_For_Event (Activation);
            Monitor.Start_Job (Id);
            Execution_Load.Eat (Params.Exec_Time);
            Monitor.End_Of_Job (Id);
         else
            null;
         end select;

         Next_Activation := Ada.Real_Time."+"(Next_Activation,  Ada.Real_Time.To_Time_Span (Polling_Period));
         delay until Next_Activation;
      end loop;
   exception
      when Error : others =>
         Put_Line ("Error : " & Exceptions.Exception_Information (Error));
   end Polling;

   ---------------------
   -- Sporadic_Server --
   ---------------------

  task body Sporadic_Server is
      Capacity : Duration := Initial_Capacity;
      Initial_Time: Time ; --Clock;
      Event_Arrival : Time;
      Next_Activation : Time := Clock;
      Activation_Time: Time;
      Params : Task_Params.Task_Parameters := Task_Params.Get_Parameters (Id);


       --Function to calculate the activation time
      function Maximum (Event_Arrival : Time; Next_Activation : Time) return Time is
      begin
         if Event_Arrival > Next_Activation then
            return Event_Arrival;
         else
            return Next_Activation;
         end if;
     end Maximum;

   begin
      Monitor.Register (Id, Initial_Time);
      loop
         Aperiodics.Event_Generator.Wait_For_Event (Event_Arrival);
         Activation_Time := Maximum (Event_Arrival, Next_Activation);
         Monitor.Start_Job (Id);
         Execution_Load.Eat (Params.Exec_Time);
         Monitor.End_Of_Job (Id);
         Capacity := Capacity-Params.Exec_Time;
         if
           Capacity < Params.Exec_Time
         then

            Next_Activation := Ada.Real_Time."+"(Activation_Time,  Ada.Real_Time.To_Time_Span (Replenishment_Period));
            delay until
              Next_Activation;
            Capacity := Initial_Capacity;
         end if;
      end loop;
   exception
      when Error : others =>
        Put_Line ("Error : " & Exceptions.Exception_Information (Error));
   end Sporadic_Server;

end Aperiodic_Servers;
