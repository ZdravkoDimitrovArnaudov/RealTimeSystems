pragma Task_Dispatching_Policy (FIFO_Within_Priorities);
with sopa, ADA.Text_IO, ADA.Exceptions, System;
procedure Concurrente is


   Num_Palabras : Sopa.Numero_Palabras := 4;
   --  Por sencillez, introducimos las palabras a buscar como literales
   Palabra_1    : aliased Sopa.Palabra := Sopa.Nueva_Palabra ("LAURA");
   Palabra_2    : aliased Sopa.Palabra := Sopa.Nueva_Palabra ("FELIPE");
   Palabra_3    : aliased Sopa.Palabra := Sopa.Nueva_Palabra ("INES");
   Palabra_4    : aliased Sopa.Palabra := Sopa.Nueva_Palabra ("CARMEN");

   task type Tarea_Obrera  (Palabra_busca : access Sopa.Palabra;  Prioridad :System.Priority) is
      pragma Priority (Prioridad);
   end Tarea_Obrera;

   task body Tarea_Obrera is
   begin
       --Busca una palabra a lo largo de la sopa y la imprime por pantalla
      Sopa.Busca (Palabra_busca.all, Sopa.Escribe'Access);
   exception
         when E:others => Ada.Text_IO.Put_Line("Error: "& Ada.Exceptions.Exception_Information(E));
   end Tarea_Obrera;

   T1: Tarea_Obrera (Palabra_busca => Palabra_1'Access, Prioridad => 20);
   T2: Tarea_Obrera (Palabra_busca => Palabra_2'Access, Prioridad => 15);
   T3: Tarea_Obrera (Palabra_busca => Palabra_3'Access, Prioridad => 10);
   T4: Tarea_Obrera (Palabra_busca => Palabra_4'Access, Prioridad => 5);

begin --activación de las tareas declaradas
   null;
end Concurrente;
