--  Ejercicios de la serie "Sopa de Letras".
--  Dependencias
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

package Sopa is
   -- PathName del fichero que contiene la matriz de letras
   Fichero_Letras: constant String:= "Letras_Linux";  -- Modificar si se utiliza con windows a "Letras_Windows"
   
   subtype Palabra is Unbounded_String;
   Palabra_Nula : constant Palabra := Null_Unbounded_String;
   
   Num_Max_Palabras : constant Natural := 10;
   subtype Rango_Palabras is Natural range 1 .. Num_Max_Palabras;
   subtype Numero_Palabras is Natural range 0 .. Num_Max_Palabras;
   type Lista_Palabras is array (Rango_Palabras) of Palabra;
    
   -------------------
   -- Nueva_Palabra --
   -------------------
   -- Crea una nueva palabra a partir de un String
   function Nueva_Palabra (Texto : String) return Palabra;
   
   -----------
   -- Busca --
   -----------
   type Proc_Accion is access procedure (Mensaje: Unbounded_String);

   -- Busca en la matriz la palabra y ejecuta un procedimiento accion
   -- por cada  palabra localizada, pasandole en cada invocacion un mensaje
   -- conteniendo: palabra encontrada, fila, columna y direccion.
   procedure Busca (La_Palabra: Palabra; Accion: Proc_Accion);

   ----------------
   -- Pide_Datos --
   ----------------
   -- Saca un texto de requerimiento en la pantalla. Recibe un texto
   -- con palabras a ser buscadas en la Sopa, separadas por espacios.
   -- Retorna en NumPal el número de palabras y en Palabras la lista
   -- de palabras introducidas.
   procedure Pide_Datos (NumPal: out Numero_Palabras; Palabras: out Lista_Palabras);

   -------------
   -- Escribe --
   -------------
   -- Escribe el mensaje en una linea de la pantalla.
   procedure Escribe (Mensaje: Unbounded_String);

   -- Escribe el mensaje en una linea de la pantalla
   -- conservando la exclusion mutua.
   procedure Escribe_Con_Mutex (Mensaje: Unbounded_String);

end Sopa;
