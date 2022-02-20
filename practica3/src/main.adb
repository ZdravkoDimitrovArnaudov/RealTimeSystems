with Ada.Text_IO, parametros_tarea;
use Ada.Text_IO, parametros_tarea;
procedure Main is

   Prioridad_Max: Prioridad_Ejec := 0.0;
   Prioridad_Actual: Prioridad_Ejec;
   Identificador: Integer;


begin

   --recorremos la lista de tareas y devolvemos la de mayor prioridad
   Identificador := Lista_Tareas(1);
   Prioridad_Max := Get_Priority_Tarea(1);

   for I in Lista_Tareas'Range loop
      Prioridad_Actual := Lista_Tareas(I).Prioridad;
      if Prioridad_Actual > Prioridad_Max then
         Prioridad_Max := Prioridad_Actual;
         Identificador := I;
      end if;
   end loop;

   --devolvemos información sobre la tarea con más prioridad
   Return_Info_Tarea(Identificador);
end Main;
