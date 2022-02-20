with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO;
with Event_Monitor;
with Pantalla_Ansi;
with Ada.Exceptions; use Ada;
use type Event_Monitor.Event_Kinds;
with Ada.Real_Time; use Ada.Real_Time;

package body Reporter is

   task body Reporter_Task is
      --  Reporter (v.2014)
      package Fix_IO is new Fixed_IO(Duration);
      package Int_IO renames Ada.Integer_Text_IO;

      procedure Header is

      begin
         Pantalla_Ansi.Borra_Pantalla;
         Pantalla_Ansi.Mueve_Cursor((1,31));
         Text_IO.Put("TASK SIMULATOR"); New_Line;
         Pantalla_Ansi.Mueve_Cursor((3,1));
         Put("TASK ID   EVENTS      INSTANT     RESPONSE");
         Put("    WORST CASE  AVG CASE  DEADLINES");
         New_Line;
         Put("                                    TIME  ");
         Put("     OBSERVED   OBSERVED    MISSED");
         New_Line;
      end Header;

      procedure Paint_Event (Rec : in Event_Monitor.Record_Type) is

      begin
         case Rec.Event_Kind is
            when Event_Monitor.Send_Event =>
               Pantalla_Ansi.Mueve_Cursor
                 ((Fila    => 4+2*Integer(Rec.The_Task),
                   Columna => 2));
               Put ("Task "); Int_IO.Put(Integer(Rec.The_Task),2);
               Put(": ");
               Int_IO.Put (Integer(Rec.State.Num_Events),3);
               Put("       ");
               Fix_IO.Put(Rec.Instant,5,3);
               New_Line;

            when Event_Monitor.End_Of_Job =>
               Pantalla_Ansi.Mueve_Cursor
                 ((Fila    => 4+2*Integer(Rec.The_Task),
                   Columna => 2));
               Put ("Task "); Int_IO.Put(Integer(Rec.The_Task),2);
               Put(": ");
               Int_IO.Put (Integer(Rec.State.Num_Events),3);
               Put("       ");
               Fix_IO.Put(Rec.Instant,5,3);
               Put("   ");
               Fix_IO.Put(Rec.Response_Time,4,4);
               Put("    ");
               Fix_IO.Put(Rec.State.Worst,4,4);
               Put("  ");
               Fix_IO.Put((Rec.State.Sum_Of_Resp/
                           Rec.State.Num_Processed),5,4);
               Put("   ");
               Int_IO.Put(Rec.State.Missed_Deadlines,4);
               New_Line;
            when Event_Monitor.Message_Inserted  => null;
         end case;
      end Paint_Event;

      procedure Paint_Message(Mens : String) is
      begin
         Pantalla_Ansi.Mueve_Cursor ((Fila    => 22, Columna => 6));
         Put_Line (Mens);
      end Paint_Message;


      Rec : Event_Monitor.Record_Type;
      Available : Boolean;
      Msg : Event_Monitor.Message;
      Init_Time : Time;

   begin
      Header;
      Event_Monitor.Monitor.Start (Init_Time => Clock);
      Event_Monitor.Monitor.Start_Completed (Init_Time);
      loop
         Event_Monitor.Monitor.Update_Event_List;
         --select
            Event_Monitor.Monitor.Get_Record (Rec);
            if Rec.Event_Kind /= Event_Monitor.Message_Inserted then
               Paint_Event (Rec);
            else
               Event_Monitor.Monitor.Get_Message (Msg, Available);
               if Available then
                  Paint_Message (Msg);
               end if;
         end if;
         --or delay 0.01;
         --end select;
      end loop;
   exception
      when Error : others =>
         Paint_Message ("Error : " &
                        Exceptions.Exception_Information(Error));
   end Reporter_Task;

end Reporter;
