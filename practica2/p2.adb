with Ada.Text_IO;
use Ada.Text_IO;

procedure P2 is
   --definición de tipos de datos
   type Prioridad_Ejec is new Integer range 1..32;
   subtype Plazo_Ejec is Duration range 0.0..Duration'Last;

   --definición registro de una tarea
   type Datos_Tarea is record
      Plazo: Plazo_Ejec;
      Prioridad: Prioridad_Ejec;

   end record;

   --declaración tareas
   Tarea1: Datos_Tarea := (Plazo => 5.7, Prioridad => 6);
   Tarea2: Datos_Tarea := (Plazo => 13.8, Prioridad => 11);
   Tarea3: Datos_Tarea := (Plazo => 18.2, Prioridad => 4);

   Media_Plazo: Plazo_Ejec := 0.0;
   Media_Prioridad: Prioridad_Ejec := 1;

begin
   --cuerpo del procedimiento
   Media_Plazo := (Tarea1.Plazo +Tarea2.Plazo + Tarea3.Plazo) / 3;
   Media_Prioridad := (Tarea1.Prioridad + Tarea2.Prioridad + Tarea3.Prioridad) / 3;

   Put_Line("La media de los Plazos es: "& Media_Plazo'Img);
   Put_Line("La media de prioridad es: "& Media_Prioridad'Img);

end P2;
