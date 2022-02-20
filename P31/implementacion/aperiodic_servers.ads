with Task_Params, System;
use  Task_Params, System;

package Aperiodic_Servers is

   -----------------------
   -- Direct_Processing --
   -----------------------

   task type Direct_Processing (Id    : User_Task_Id;
                                Prio  : System.Priority) is
      pragma Priority (Prio);
   end Direct_Processing;

   -------------
   -- Polling --
   -------------

   Polling_Period : constant Duration := 10.0;

   task type Polling (Id    : User_Task_Id;
                      Prio  : System.Priority) is
      pragma Priority (Prio);
   end Polling;

   ---------------------
   -- Sporadic_Server --
   ---------------------

   Replenishment_Period : constant Duration := 10.0;
   Initial_Capacity     : constant Duration := 2.0;

   task type Sporadic_Server (Id    : User_Task_Id;
                              Prio  : System.Priority) is
      pragma Priority (Prio);
   end Sporadic_Server;

end Aperiodic_Servers;
