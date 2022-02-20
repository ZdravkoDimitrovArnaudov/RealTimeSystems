pragma Task_Dispatching_Policy (FIFO_Within_Priorities);
pragma Locking_Policy (Inheritance_Locking);
pragma Queuing_Policy (Priority_Queuing);

with Ada.Text_IO, System, Event_Monitor, Reporter, Ada.Real_Time, Task_Params, Execution_Load;

procedure Practica1b is


   --Creamos los objetos protegidos

     --Recurso 1
   protected Recurso_1 is
      --asginamos techo de prioridad
      pragma Priority(4);

      --declaración de procedimientos y entry
      procedure Seccion_Critica (T_seg : in Duration);


   private
      --datos privados:

   end Recurso_1;


   protected body Recurso_1 is

      procedure Seccion_Critica (T_seg : in Duration) is
      begin
        --come tiempos
        Execution_Load.Eat (T_seg);

      end Seccion_Critica;
   end Recurso_1;


   ---------------------------------


   --Recurso 2
   protected Recurso_2 is
       --asginamos techo de prioridad
      pragma Priority(4);

      --declaración de procedimientos y entry
      procedure Seccion_Critica (T_seg : in Duration);

   private
      --datos privados:

   end Recurso_2;


   protected body Recurso_2 is

      procedure Seccion_Critica (T_seg : in Duration) is
      begin
        --come tiempos
        Execution_Load.Eat (T_seg);

      end Seccion_Critica;
   end Recurso_2;

   --------------------------------------

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
      Ejecucion_neta : Duration := Params.Exec_Time / 2.0;
      Phase : Duration := Params.Phase;

   begin
      Event_Monitor.Monitor.Register (Id, Next_Activation, Phase); --Registro de la tarea
      -- ...
      loop
         delay until Next_Activation;
         Event_Monitor.Monitor.Start_Job(Id); --Instante activacion

         -- accion a ejecutar, cometiempo a la mitad
         Execution_Load.Eat (Ejecucion_neta);

         --tomamos los recursos si los hay
         if Params.TRecurso_1 > 0.0 then
            Recurso_1.Seccion_Critica(Params.TRecurso_1);
         end if;

         if Params.TRecurso_2 > 0.0 then
            Recurso_2.Seccion_Critica(Params.TRecurso_2);
         end if;

          -- accion a ejecutar, cometiempo a la mitad
         Execution_Load.Eat (Ejecucion_neta);


         -- Con el operador suma de real time, debemos convertirlo a TimeSpan el periodo
         Event_Monitor.Monitor.End_Of_Job(Id); -- Instante finalización

         -- Con el operador suma de real time, debemos convertirlo a TimeSpan el periodo
         Next_Activation := Ada.Real_Time."+"(Next_Activation,  Ada.Real_Time.To_Time_Span (Periodo));

         --- ...
      end loop;
   end Periodica;


   T1 : Periodica (Id => 1, Prioridad => 5);
   T2 : Periodica (Id => 2, Prioridad => 4);
   T3 : Periodica (Id => 3, Prioridad => 3);
   T4 : Periodica (Id => 4, Prioridad => 2);
   T5 : Periodica (Id => 5, Prioridad => 1);


begin
   null;
end Practica1b;
