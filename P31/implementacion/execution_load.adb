with Ada.Execution_Time;
with Ada.Real_Time;

package body Execution_Load is

   use type Ada.Execution_Time.CPU_Time;

   ---------
   -- Eat --
   ---------
   --  This version reads the execution-time clock of
   --  the current task until the value exceeds the initial time plus
   --  the specified interval.

   --  The clock used is the TSC. On modern architectures this version
   --  works correctly even if the CPU frequency varies. The behavior
   --  can be checked in Linux by verifying that the constant_tsc and
   --  nonstop_tsc flags are set in /proc/cpuinfo

   procedure Eat (For_Seconds : Duration) is
      Final_Time : constant Ada.Execution_Time.CPU_Time:=
        Ada.Execution_Time.Clock+Ada.Real_Time.To_Time_Span(For_Seconds);
   begin
      loop
         exit when Ada.Execution_Time.Clock>Final_Time;
      end loop;
   end Eat;

end Execution_Load;
