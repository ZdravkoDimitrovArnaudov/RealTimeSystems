package Pantalla_ANSI is

   subtype Filas is Integer range 1..24;

   subtype Columnas is Integer range 1..80;

   type Posicion is
      record
         Fila    : Filas;
         Columna : Columnas;
      end record;

   procedure Borra_Pantalla;

   procedure Mueve_Cursor (A : in Posicion );

   procedure Guarda_Posicion_Cursor;
   procedure Recupera_Posicion_Cursor;

   procedure Sube_Cursor (Lineas : in Filas := 1 );

   procedure Baja_Cursor (Lineas : in Filas := 1 );

   procedure Adelanta_Cursor (Espacios : in Columnas := 1 );

   procedure Atrasa_Cursor (Espacios : in Columnas := 1 );

   procedure Borra_Linea;

   procedure Video_Inverso;
   procedure Video_Normal;

   procedure Activa_Parpadeo;
   procedure Desactiva_Parpadeo;

   procedure Activa_Negrilla;
   procedure Desactiva_Negrilla;

end Pantalla_ANSI;
