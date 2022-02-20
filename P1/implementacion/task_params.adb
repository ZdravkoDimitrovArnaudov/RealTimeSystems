package body Task_Params is

   --  Set this variable to specify the number of user tasks
   Num_Of_Tasks : constant Task_Count := 4;

   --  Set the array values for the user tasks
   Param : constant array (User_Task_Id range User_Task_Id'First .. Num_Of_Tasks) of Task_Parameters :=
     (1      =>
        (Period           => 6.0,
         Exec_Time        => 1.5,
         Deadline         => 6.0,
         Activation       => Periodic),
     2      =>
        (Period           => 9.0,
         Exec_Time        => 1.5,
         Deadline         => 9.0,
         Activation       => Periodic),
     3     =>
        (
         Period           => 10.0,
         Exec_Time        => 3.0,
         Deadline         => 7.0,
         Activation       => Periodic),

      4     =>
        (
         Period           => 20.0,
         Exec_Time        => 1.5,
         Deadline         => 20.0,
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
