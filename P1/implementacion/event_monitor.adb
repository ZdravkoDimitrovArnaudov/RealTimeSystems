with Queues;
with Task_Params; use Task_Params;
with Priority_Queue;

package body Event_Monitor is

   type Task_Time_Parameters is array (Task_Params.User_Task_Id) of Duration;
   type Task_Activation_Parameters is array (Task_Params.User_Task_Id) of Activation_Kinds;

   Deadlines       : Task_Time_Parameters;
   Periods         : Task_Time_Parameters;
   Activations     : Task_Activation_Parameters;

   package Start_Times is new Queues
     (Queue_Size => 50,
      Element    => Duration);
   Task_Start : array (Task_Params.User_Task_Id) of Start_Times.Queue;

   package Records is new Queues
     (Queue_Size => 1000,
      Element    => Record_Type);
   Recs : Records.Queue;

   package Messages is new Queues
     (Queue_Size => 1000,
      Element    => Message);
   Msgs : Messages.Queue;

   package Activation_Queue is new Priority_Queue
        (Size       => 50,
         Element    => Task_Params.User_Task_Id,
         Priority   => Time_Span,
         ">"        => "<",
         "="        => "=");

   protected body Monitor is

      procedure Start (Init_Time   : in Time) is
      begin
         Initial_Time := Init_Time;
         Initialized  := True;
      end Start;

      entry Register (The_Task  : in Task_Params.User_Task_Id;
                      Init_Time : out Time;
                      Phase     : in Duration := 0.0)
        when Initialized is

      begin
         case (Activations (The_Task)) is
            when Periodic =>

               Init_Time := Initial_Time + To_Time_Span (Phase);
               Activation_Queue.Enqueue (E => The_Task,
                                         P => To_Time_Span (Phase));
            when Bursty | Sporadic =>
               --  Aperiodic requires a event generator that enqueues the activations
               Init_Time := Initial_Time;
               Activation_Queue.Enqueue (E => The_Task,
                                         P => To_Time_Span (Duration'Last));
         end case;

         First_Task_Running := True;
      end Register;

      entry Start_Completed (Init_Time : out Time) when First_Task_Running is
      begin
         Init_Time := Initial_Time;
      end Start_Completed;

      procedure Update_Event_List is
         The_Task         : Task_Params.User_Task_Id;
         Next_Activation  : Time_Span;
         Now              : constant Time_Span := Clock - Initial_Time;
         Rec              : Record_Type;
      begin
         Activation_Queue.Dequeue (The_Task, Next_Activation);
         if (Now > Next_Activation) then

            --  Update current activation info
            Start_Times.Enqueue (To_Duration (Next_Activation), Task_Start (The_Task));
            Current_State (The_Task).Num_Events :=
              Current_State (The_Task).Num_Events + 1;

            Rec.Event_Kind := Send_Event;
            Rec.The_Task := The_Task;
            Rec.Instant := To_Duration (Next_Activation);
            Rec.State := Current_State (The_Task);
            Records.Enqueue (Rec, Recs);

            case (Activations (The_Task)) is
               when Periodic =>
                  Next_Activation := Next_Activation + To_Time_Span (Periods (The_Task));
                  Activation_Queue.Enqueue (The_Task, Next_Activation);
               when Bursty | Sporadic =>
                  --  Aperiodic will be enqueued later from event generator
                  null;
            end case;
         else
            Activation_Queue.Enqueue (The_Task, Next_Activation);
         end if;
      end Update_Event_List;

      procedure Start_Job (The_Task        : in Task_Params.User_Task_Id) is
         Now : constant Time_Span := Clock - Initial_Time;
         Rec  : Record_Type;
      begin
         --  Update current execution info
         Rec.Event_Kind := Send_Event;
         Rec.The_Task := The_Task;
         Rec.Instant := To_Duration (Now);
         Rec.State := Current_State(The_Task);
         Records.Enqueue (Rec,Recs);
      end Start_Job;

      procedure End_Of_Job(The_Task : in Task_Params.User_Task_Id) is

         Now             : constant Time_Span := Clock - Initial_Time;
         Activation_Time : Duration;
         Rec             : Record_Type;
      begin
         Current_State(The_Task).Num_Events:=
           Current_State(The_Task).Num_Events-1;
         Current_State(The_Task).Num_Processed:=
           Current_State(The_Task).Num_Processed+1;
         Rec.Event_Kind:=End_Of_Job;
         Rec.The_Task:=The_Task;
         Rec.Instant:= To_Duration (Now);
         Start_Times.Dequeue(Activation_Time,Task_Start(The_Task));
         Rec.Response_Time:=To_Duration (Now-To_Time_Span(Activation_Time));
         if Rec.Response_Time>Current_State(The_Task).Worst then
            Current_State(The_Task).Worst:=Rec.Response_Time;
         end if;
         Current_State(The_Task).Sum_Of_Resp:=
           Current_State(The_Task).Sum_Of_Resp+Rec.Response_Time;

         if Rec.Response_Time>Deadlines(The_Task) then
            Current_State(The_Task).Missed_Deadlines:=
              Current_State(The_Task).Missed_Deadlines+1;
         end if;
         Rec.State:=Current_State(The_Task);
         Records.Enqueue(Rec,Recs);
      end End_Of_Job;

      procedure Send_Event (The_Task : in Task_Params.User_Task_Id; Activation_Time : in Duration) is
      begin
         Activation_Queue.Enqueue (The_Task, To_Time_Span (Activation_Time));
      end Send_Event;


      entry Get_Record (Rec : out Record_Type)
      when not Records.Empty(Recs) is
      begin
         Records.Dequeue(Rec,Recs);
      end Get_Record;


      procedure Put_Message (Msg : in String) is
         The_Msg : Message:="                              ";
         Now : constant Time_Span := Clock - Initial_Time;
         Rec : Record_Type;
      begin
         if Msg'Length>=The_Msg'Length then
            The_Msg:=Msg
              (Msg'First..Msg'First+The_Msg'Length-1);
         else
            The_Msg(1..Msg'Length):=Msg;
         end if;
         Messages.Enqueue(The_Msg,Msgs);
         Rec.Event_Kind:=Message_Inserted;
         Rec.Instant:=To_Duration (Now);
         Records.Enqueue(Rec,Recs);
      exception
         when Messages.Full_Queue =>
            null;
      end Put_Message;

      procedure Get_Message (Msg : out Message;
                                Available : out Boolean) is
      begin
         Available:=not Messages.Empty(Msgs);
         if Available then
            Messages.Dequeue(Msg,Msgs);
         end if;
      end Get_Message;

   end Monitor;

begin

   for T in Task_Params.User_Task_Id range 1..Task_Params.Number_Of_Tasks loop
      Deadlines (T)   := Task_Params.Get_Parameters (T).Deadline;
      Periods   (T)   := Task_Params.Get_Parameters (T).Period;
      Activations (T) := Task_Params.Get_Parameters (T).Activation;
   end loop;

end Event_Monitor;
