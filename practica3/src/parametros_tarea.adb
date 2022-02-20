with Ada.Text_IO, parametros_tarea;
use Ada.Text_IO, parametros_tarea;

package body parametros_tarea is

   --inicializamos lista de tareas
   Lista_Tareas(1) := (Prioridad_Ejec => 5, Plazo => 5.5);
   Lista_Tareas(2) := (Prioridad_Ejec => 13, Plazo => 4.9);
   Lista_Tareas(3) := (Prioridad_Ejec => 3, Plazo => 12.3);
   Lista_Tareas(4) := (Prioridad_Ejec => 18, Plazo => 2.1);
   Lista_Tareas(5) := (Prioridad_Ejec => 9, Plazo => 3.5);

   function Get_Tarea (Id: Integer) return Datos_Tarea is
   begin
      if Id < 1 or Id > 5 then
         return null;
      end if;

      return Lista_Tareas (Id);
   end Get_Tarea;

   function Get_Priority_Tarea (Tarea : Datos_Tarea) return Prioridad_Ejec is
   begin
      return Tarea.Prioridad_Ejec;
   end Get_Priority_Tarea;

   function Return_Info_Tarea (Tarea: Datos_Tarea) return String is
   begin
      return Put_Line ("Prioridad : "&Tarea.Prioridad'Img &", Plazo: "&Tarea.Plazo'Img);
   end Return_Info_Tarea;

end parametros_tarea;
