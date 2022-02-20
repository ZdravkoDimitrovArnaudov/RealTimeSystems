package Task_Params is

   type Task_Count is range 0..10;
   subtype User_Task_Id is Task_Count range 1..Task_Count'Last;

   type Activation_Kinds is (Periodic, Sporadic, Bursty);

   type Task_Parameters is record
      Period, Exec_Time, Deadline, TRecurso_1, TRecurso_2 : Duration; Phase : Duration;
      Activation                  : Activation_Kinds;
   end record;

   --------------------
   -- Get_Parameters --
   --------------------

   function Get_Parameters (Of_Task : User_Task_Id) return Task_Parameters;

   ---------------------
   -- Number_Of_Tasks --
   ---------------------

   function Number_Of_Tasks return Task_Count;

   Wrong_Task_Id : exception;

   Default_Value : constant := 1.0;

end Task_Params;
