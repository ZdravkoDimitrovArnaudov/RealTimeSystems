--  Dependencias
with Sopa;

procedure Secuencial is

   Num_Palabras : Sopa.Numero_Palabras := 4;
   --  Por sencillez, introducimos las palabras a buscar como literales
   Palabra_1    : Sopa.Palabra := Sopa.Nueva_Palabra ("LAURA");
   Palabra_2    : Sopa.Palabra := Sopa.Nueva_Palabra ("FELIPE");
   Palabra_3    : Sopa.Palabra := Sopa.Nueva_Palabra ("INES");
   Palabra_4    : Sopa.Palabra := Sopa.Nueva_Palabra ("CARMEN");

   Palabras     : Sopa.Lista_Palabras := (1 => Palabra_1, 2 => Palabra_2, 3 => Palabra_3, 4 => Palabra_4, others => Sopa.Palabra_Nula);


begin
   --  El subprograma Pide_Datos permite solicitar las palabras al usuario
   --  Sopa.Pide_Datos (Num_Palabras, Palabras);
   for p in 1..Num_Palabras loop
      Sopa.Busca (Palabras(p), Sopa.Escribe'Access);
   end loop;

end Secuencial;
