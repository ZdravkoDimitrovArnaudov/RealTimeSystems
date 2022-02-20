with Ada.Text_IO;
use Ada.Text_IO;

procedure Suma_Pares is
   Suma : Integer;
begin

   Suma:=0;
   for Index in 1..1000 loop
      if index mod 2 = 0 then
         Suma:= Suma + Index;
      end if;
   end loop;

   Put_Line ("El resultado es: "&Suma'img);
end Suma_Pares;
