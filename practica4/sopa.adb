with Ada.Text_IO;
use Ada.Text_IO;

package body Sopa is

   type Sentido is (LR,RL,UD,DU,DR,DL,AR,AL);
   -- LR: De Izquierda a Derecha     RL:De Derecha a Izquierda
   -- UD: De Arriba a Abajo          DU:De Abajo a Arriba
   -- DR: Descendente Derecha        DL:Descendente Izquierda
   -- AR: Ascendente Derecha         AL:Ascendente Izquierda

   Dim_Matriz: constant Integer := 30;
   subtype Rango_Matriz is Integer range 1..Dim_Matriz;
   -- Tipos relacionados con la dimensiones de la matriz de letras.

   type Matriz is array (Rango_Matriz,Rango_Matriz) of character;
   S : Matriz;    -- Variable tipo Matriz en la que se carga la matriz de letras
   F : File_Type; -- Descriptor del fichero del que leer la matriz de letras
   
   -------------------
   -- Nueva_Palabra --
   -------------------
   
   function Nueva_Palabra (Texto : String) return Palabra is
   begin
	  return Palabra(To_Unbounded_String (Texto));
   end Nueva_Palabra;

   -------------
   -- Escribe --
   -------------

   procedure Escribe(Mensaje:Unbounded_String) is
   begin
      Put (To_String(Mensaje));
      New_Line;
   end Escribe;

   --------------
   -- Pantalla --
   --------------
   --  Obj. protegido para escritura concurrente
   protected Pantalla is
      procedure Escribe_Seguro (Mensaje: Unbounded_String);
   end Pantalla;

   protected body Pantalla is
      procedure Escribe_Seguro(Mensaje: Unbounded_String) is
      begin
         Escribe(Mensaje);
      end Escribe_Seguro;
   end Pantalla;

   ---------------------
   -- EscribeConMutex --
   ---------------------

   procedure Escribe_Con_Mutex(Mensaje: Unbounded_String) is
   begin
      Pantalla.Escribe_Seguro(Mensaje);
   end Escribe_Con_Mutex;

   -----------
   -- Busca --
   -----------

   procedure Busca(La_Palabra: Palabra; Accion: Proc_Accion) is

      Conseguida : array (Sentido) of Boolean;
      

   begin
      for Fila in Rango_Matriz loop
         for Columna in Rango_Matriz loop

            for Sen in Sentido loop
               Conseguida(Sen):=True;
            end loop;

            for Letra in 1..Length(La_Palabra) loop
               begin
                  Conseguida(LR):=Conseguida(LR) and (s(Columna+letra-1,Fila)= Element(La_Palabra,Letra));
               exception when Constraint_Error => Conseguida(LR):=False;
               end;
               begin
                  Conseguida(RL):=Conseguida(RL) and (s(Columna-letra+1,Fila)= Element(La_Palabra,Letra));
               exception when Constraint_Error => Conseguida(RL):=False;
               end;
               begin
                  Conseguida(UD):=Conseguida(UD) and (s(Columna,Fila+letra-1)= Element(La_Palabra,Letra));
               exception when  Constraint_Error => Conseguida(UD):=False;
               end;
               begin
                  Conseguida(DU):=Conseguida(DU) and (s(Columna,Fila-letra+1)= Element(La_Palabra,Letra));
               exception when  Constraint_Error => Conseguida(DU):=False;
               end;
               begin
                  Conseguida(DR):=Conseguida(DR) and (s(Columna+letra-1,Fila+letra-1)= Element(La_Palabra,Letra));
               exception when  Constraint_Error => Conseguida(DR):=False;
               end;
               begin
                  Conseguida(DL):=Conseguida(DL) and (s(Columna-letra+1,Fila+letra-1)= Element(La_Palabra,Letra));
               exception when  Constraint_Error => Conseguida(DL):=False;
               end;
               begin
                  Conseguida(AR):=Conseguida(AR) and (s(Columna+letra-1,Fila-letra+1)= Element(La_Palabra,Letra));
               exception when  Constraint_Error => Conseguida(AR):=False;
               end;
               begin
                  Conseguida(AL):=Conseguida(AL) and (s(Columna-letra+1,Fila-letra+1)= Element(La_Palabra,Letra));
               exception when  Constraint_Error => Conseguida(AL):=False;
               end;
            end loop;

            for Sen in Sentido loop
               if Conseguida(Sen) then
                  Accion.all(La_Palabra&"  "& Integer'Image(Fila)&"  " & Integer'Image(Columna)&"  " &Sentido'Image(Sen));
               end if;
            end loop;

         end loop;
      end loop;
   end Busca;

   ----------------
   -- Pide_Datos --
   ----------------

   procedure Pide_Datos (NumPal: out Numero_Palabras; Palabras: out Lista_Palabras) is
      S      : String(1..60);
      SU     : Unbounded_String;
      NC     : Natural;
      NumTrab: Rango_Palabras;

   begin
      for T in Rango_Palabras loop
         Palabras(T) := To_Unbounded_String("");
      end loop;

      NumTrab := 1;

      Escribe_Con_Mutex(To_Unbounded_String("Escribe una linea con los nombres a buscar separados por espacios: "));
      New_Line;
      Get_Line(S,NC);
      if (NC > 0) then
         SU := To_Unbounded_String(S);

         for l in 1..NC loop
            if (Element(SU,1) = ' ') then
               NumTrab := NumTrab+1;
            else
               Palabras(NumTrab) := Palabras(NumTrab) & Element(SU,1);
            end if;
            Delete (SU,1,1);
         end loop;

         NumPal := NumTrab;
      else
         NumPal := 0;
      end if;
   end Pide_Datos;

begin
   --  Cargamos el fichero en la inicialización del paquete
   Open (File => F, Mode => In_File, Name => Fichero_Letras);
   for Fila in Rango_Matriz loop
      for Columna in Rango_Matriz loop
         Get(F,S(columna,fila));
      end loop;
   end loop;
   Close(F);
exception
   when E: others =>
      Put_Line ("Error al abrir el fichero");
end Sopa;
