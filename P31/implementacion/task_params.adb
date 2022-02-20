package body Task_Params is

   --  Set this variable to specify the number of user tasks
   Num_Of_Tasks : constant Task_Count := 4;

   --  Set the array values for the user tasks
   Param : constant array (User_Task_Id range User_Task_Id'First .. Num_Of_Tasks) of Task_Parameters :=
     (1      =>
        (Period           => 5.0,
         Exec_Time        => 1.0,
         Deadline         => 5.0,
         Activation       => Periodic),
     2      =>
        (Period           => 200.0,
         Exec_Time        => 1.0,
         Deadline         => 200.0,
         Activation       => Bursty),

     3      =>
        (Period           => 7.0,
         Exec_Time        => 1.5,
         Deadline         => 7.0,
         Activation       => Periodic),

     4     =>
        (
         Period           => 11.0,
         Exec_Time        => 1.0,
         Deadline         => 11.0,
         Activation       => Periodic));

   --------------------
   -- Get_Parameters --
   --------------------

   function Get_Parameters (Of_Task : User_Task_Id) return Task_Parameters is
   begin
      if Of_Task > Num_Of_Tasks then
         raise Wrong_Task_Id with "Task_Id or Num_Of_Tasks is not set up properly";
      end if;

      return Param(Of_Task);
   end Get_Parameters;

   ---------------------
   -- Number_Of_Tasks --
   ---------------------

   function Number_Of_Tasks return Task_Count is
   begin
      return Num_Of_Tasks;
   end;

end Task_Params;
