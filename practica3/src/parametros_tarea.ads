package parametros_tarea is
   --definici�n de cabeceras, datos y tipos
   type Datos_Tarea is private;
   type Prioridad_Ejec is new Integer range 1..32;
   subtype Plazo_Ejec is Duration range 0.0..Duration'Last;



   --devuelve programa
   function Get_Tarea (Id: Integer) return Datos_Tarea;
   --devuleve prioridad de una tarea pasada por par�metro
   function Get_Priority_Tarea (Tarea : Datos_Tarea) return Prioridad_Ejec;
   --Muestra informaci�n de una tarea
   function Return_Info_Tarea (Tarea: in Datos_Tarea) return String;

   --definici�n lista de Tareas
   type Lista_Tareas is array (1..5) of Datos_Tarea;


private

    --definici�n registro de una tarea
   type Datos_Tarea is record
      Plazo: Plazo_Ejec;
      Prioridad: Prioridad_Ejec;

   end record;


end parametros_tarea;
