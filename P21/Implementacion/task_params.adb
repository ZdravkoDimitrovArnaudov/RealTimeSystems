package body Task_Params is

   --  Set this variable to specify the number of user tasks
   Num_Of_Tasks : constant Task_Count := 5;

   --  Set the array values for the user tasks
   Param : constant array (User_Task_Id range User_Task_Id'First .. Num_Of_Tasks) of Task_Parameters :=
     (1      =>
        (Period           => 9.0,
         Exec_Time        => 0.4,
         Deadline         => 9.0,
         TRecurso_1       => 0.0,
         TRecurso_2       => 0.0,
         Phase            => 5.0,
         Activation       => Periodic),
     2      =>
        (Period           => 10.0,
         Exec_Time        => 0.4,
         Deadline         => 10.0,
         TRecurso_1       => 0.2,
         TRecurso_2       => 1.0,
         Phase            => 4.2,
         Activation       => Periodic),
     3     =>
        (
         Period           => 15.0,
         Exec_Time        => 4.0,
         Deadline         => 15.0,
         TRecurso_1       => 0.4,
         TRecurso_2       => 0.0,
         Phase            => 2.1,
         Activation       => Periodic),

     4     =>
        (
         Period           => 20.0,
         Exec_Time        => 4.0,
         Deadline         => 20.0,
         TRecurso_1       => 0.0,
         TRecurso_2       => 0.0,
         Phase            => 5.0,
         Activation       => Periodic),

      5     =>
        (
         Period           => 50.0,
         Exec_Time        => 4.0,
         Deadline         => 50.0,
         TRecurso_1       => 0.0,
         TRecurso_2       => 1.0,
         Phase            => 0.0,
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
