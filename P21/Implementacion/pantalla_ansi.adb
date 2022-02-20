with Text_IO; use Text_IO;

package body Pantalla_ANSI is

   function A_String( Int : in Integer ) return String is
      Str : constant String := Integer'Image(Int);
   begin
      return Str(2..Str'Length);
   end A_String;

   procedure Borra_Pantalla is
   begin
      Put( ASCII.Esc & "[2J" );
   end Borra_Pantalla;

   procedure Mueve_Cursor (A : in Posicion ) is
   begin
      Put( ASCII.Esc & "[" & A_String(A.Fila) & ";");
      Put( A_String(A.Columna) & "f");
   end Mueve_Cursor;

   procedure Guarda_Posicion_Cursor is
   begin
      Put (ASCII.Esc & "[s");
   end Guarda_Posicion_Cursor;

   procedure Recupera_Posicion_Cursor is
   begin
      Put (ASCII.Esc & "[u");
   end Recupera_Posicion_Cursor;

   procedure Sube_Cursor (Lineas : in Filas := 1 ) is
   begin
      Put( ASCII.Esc & '[' & A_String(Lineas) & 'A' );
           end Sube_Cursor;

           procedure Baja_Cursor (Lineas : in Filas := 1 ) is
           begin
        Put( ASCII.Esc & '[' & A_String(Lineas) & 'B' );
             end Baja_Cursor;

             procedure Adelanta_Cursor (Espacios : in Columnas := 1 ) is
             begin
          Put( ASCII.Esc & '[' & A_String(Espacios) & 'C' );
               end Adelanta_Cursor;

               procedure Atrasa_Cursor (Espacios : in Columnas := 1 ) is
               begin
            Put( ASCII.Esc & '[' & A_String(Espacios) & 'D' );
                 end Atrasa_Cursor;

                 procedure Borra_Linea is
                 begin
              Put (ASCII.Esc & "[K");
                 end Borra_Linea;

                 procedure Video_Inverso is
                 begin
                    Put (ASCII.Esc & "[7m");
                 end Video_Inverso;

                 procedure Video_Normal is
                 begin
                    Put(ASCII.Esc & "[0m");
                 end Video_Normal;

                 procedure Activa_Parpadeo is
                 begin
                    Put (ASCII.Esc & "[5m");
                 end Activa_Parpadeo;

                 procedure Desactiva_Parpadeo is
                 begin
                    Put(ASCII.Esc & "[0m");
                 end Desactiva_Parpadeo;

                 procedure Activa_Negrilla is
                 begin
                    Put (ASCII.Esc & "[1m");
                 end Activa_Negrilla;

                 procedure Desactiva_Negrilla is
                 begin
                    Put(ASCII.Esc & "[0m");
                 end Desactiva_Negrilla;

end Pantalla_ANSI;
