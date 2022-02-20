--  This package is just intended for one aperiodic event.
with Ada.Real_Time; use Ada.Real_Time;
with System;

----------------
-- Aperiodics --
----------------

package Aperiodics is

   --  Sporadic events
   Min_Interarrival_Time : constant Duration := 5.0;
   Max_Interarrival_Time : constant Duration := 10.0;
   --  Bursty events
   Bound_Interval        : constant Duration := 10.0;
   Max_Arrivals          : constant Positive := 4;

   protected Event_Generator is
      pragma Priority (System.Max_Priority);
      procedure New_Event;
      entry Wait_For_Event (Activation_Time : out Time);
   private
      Index : Natural := 0;
   end Event_Generator;

   task Aperiodic_Generator is
      pragma Priority (20);
   end Aperiodic_Generator;
end Aperiodics;
