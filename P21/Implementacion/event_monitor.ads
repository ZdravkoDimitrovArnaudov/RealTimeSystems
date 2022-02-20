with Ada.Real_Time; use Ada.Real_Time;
with Task_Params;
with System;

package Event_Monitor is

   subtype Message is String (1..30);

   type Event_Kinds is (Send_Event,End_Of_Job,Message_Inserted);

   type Task_State is record
      Num_Events          : Natural  := 0;
      Missed_Deadlines    : Natural  := 0;
      Worst               : Duration := 0.0;
      Sum_Of_Resp         : Duration := 0.0;
      Num_Processed       : Natural  := 0;
   end record;

   type States is array (Task_Params.User_Task_Id) of Task_State;

   type Record_Type is record
      Event_Kind    : Event_Kinds;
      The_Task      : Task_Params.User_Task_Id;
      Instant       : Duration;
      Response_Time : Duration:=0.0;
      State         : Task_State;
   end record;

   Last_Time : constant Time;

   -------------
   -- Monitor --
   -------------

   protected Monitor is
      --  Ceiling priority
      pragma Priority(System.Max_Priority);

      --  User task interface
      --  Init_Time returns the first activation time used as a reference. This parameter
      --  also considers the Phase if it is specified.
      entry Register (The_Task  : in Task_Params.User_Task_Id;
                      Init_Time : out Time;
                      Phase     : in Duration := 0.0);

      procedure Start_Job
        (The_Task        : in Task_Params.User_Task_Id);

      procedure End_Of_Job
        (The_Task : in Task_Params.User_Task_Id);

      --  Aperiodic task interface
      procedure Send_Event (The_Task        : in Task_Params.User_Task_Id;
                            Activation_Time : in Duration);

      --  Reporter task interface
      procedure Start
        (Init_Time : in Time);

      entry Start_Completed (Init_Time : out Time);

      procedure Update_Event_List;

      entry Get_Record
        (Rec : out Record_Type);

      procedure Put_Message
        (Msg  : in String);

      procedure Get_Message
        (Msg : out Message;
         Available : out Boolean);
   private
      Current_State      : States;
      Initial_Time       : Time;
      Initialized        : Boolean := False;
      First_Task_Running : Boolean := False;
   end Monitor;

private
   Last_Time : constant Time := Ada.Real_Time.Time_Last;

end Event_Monitor;
