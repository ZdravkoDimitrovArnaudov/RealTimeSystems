pragma Task_Dispatching_Policy (FIFO_Within_Priorities);
pragma Locking_Policy (Ceiling_Locking);
pragma Queuing_Policy (Priority_Queuing);

with Ada.Text_IO, System, Event_Monitor, Reporter, Ada.Real_Time, Task_Params, Execution_Load, Aperiodic_Servers;


procedure Practica1b is

   --creamos las tareas de usuario
   task type Periodica (Id : Task_Params.User_Task_Id;
                        Prioridad: System.Priority) is
      pragma Priority(Prioridad);
   end Periodica;

   task body Periodica is

      --declaramos aquellas variables que vayamos a utilizar
      Params : Task_Params.Task_Parameters := Task_Params.Get_Parameters (Id);
      Periodo : constant Duration := Params.Period;
      Next_Activation: Ada.Real_Time.Time;

   begin
      Event_Monitor.Monitor.Register (Id, Next_Activation); --Registro de la tarea
      -- ...
      loop
         delay until Next_Activation;
         Event_Monitor.Monitor.Start_Job(Id); --Instante activacion

         -- accion a ejecutar, cometiempo
         Execution_Load.Eat (Params.Exec_Time);

         -- Con el operador suma de real time, debemos convertirlo a TimeSpan el periodo
         Event_Monitor.Monitor.End_Of_Job(Id); -- Instante finalización

         -- Con el operador suma de real time, debemos convertirlo a TimeSpan el periodo
         Next_Activation := Ada.Real_Time."+"(Next_Activation,  Ada.Real_Time.To_Time_Span (Periodo));

         --- ...
      end loop;
   end Periodica;


   T1 : Periodica (Id => 1, Prioridad => 4);
   T2 : Aperiodic_Servers.Sporadic_Server (Id => 2, Prio => 3);
   T3 : Periodica (Id => 3, Prioridad => 2);
   T4 : Periodica (Id => 4, Prioridad => 1);


begin
   null;
end Practica1b;
