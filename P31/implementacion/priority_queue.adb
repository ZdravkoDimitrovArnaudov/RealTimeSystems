-------------------------------------------------------------------------------
--                        PACKAGE BODY PRIORITY_QUEUE
--                        ===========================
--
--  The implementation of the priority queue is a heapform heap
--  [W. AMSBURY, "Data Structures. From Arrays to Priority Queues",
--  Wadsworth, 1985.
--
--  This implementation has the following characteristics:
--
--      Insertion : O(log n)
--      Highest_priority extraction : O(log n)
--      Read highest priority : O(1)
--      Deletion : O(n) (Change is Deletion + Insertion = O(n)).
-------------------------------------------------------------------------------

package body Priority_Queue is


   type Cell;

   subtype Index is Integer range 1..Size;
   subtype Size_Type is Integer range 0..Size;

   type Cell is record
      E : Element;
      Pri : Priority;
   end record;

   Q : array (Index) of Cell;
   Length : Size_Type := 0;

   ------------
   -- UpHeap --
   ------------

   procedure UpHeap (N : in Index) is

      P : Index;
      K : Index := N;
      Temp : Cell;

   begin
      while K >= 2 loop
         P:= K/2;
         if Q(K).Pri > Q(P).Pri then
            Temp:=Q(K);
            Q(K):=Q(P);
            Q(P):=Temp;
            K:=P;
         else
            exit;
         end if;
      end loop;
   end UpHeap;


   -----------
   -- Empty --
   -----------

   function Empty return Boolean is

   begin
      return Length=0;
   end Empty;


   ----------
   -- Full --
   ----------

   function Full return Boolean is

   begin
      return Length>=Size;
   end Full;


   -------------
   -- Enqueue --
   -------------

   procedure Enqueue (E : in Element; P : in Priority) is

   begin
      if Length>=Size then
         raise Full_Queue;
      end if;
      Length:=Length+1;
      Q(Length):=(E,P);
      UpHeap(Length);
   end Enqueue;


   --------------
   -- DownHeap --
   --------------

   procedure DownHeap (K : in Index; N : in Size_Type) is

      J : Integer:=2*K;
      Half : Index:=K;
      Temp : constant Cell:= Q(K);

   begin
      while J<=N loop
         if (J<N) and then (Q(J+1).Pri>Q(J).Pri) then
            J:=J+1;
         end if;
         if not (Q(J).Pri > Temp.Pri) then
            Q(Half):=Temp;
            return;
         end if;
         Q(Half):=Q(J);
         Half:=J;
         J:=2*J;
      end loop;
      Q(Half):=Temp;
   end DownHeap;


   -------------
   -- Dequeue --
   -------------

   procedure Dequeue (E : out Element; P : out Priority) is

   begin
      if Length=0 then
         raise Empty_Queue;
      end if;
      E:=Q(1).E;
      P:=Q(1).Pri;
      Q(1):=Q(Length);
      Length:=Length-1;
      DownHeap(1,Length);
   end Dequeue;

   --------------------
   -- Dequeue_Middle --
   --------------------

   procedure Dequeue_Middle (E : in out Element; P : out Priority;
                                                Found : out Boolean) is

      I : Integer :=0;
      Parent : Integer;

   begin
      Found:=False;
      while I<Length loop
         I:=I+1;
         if E=Q(I).E then
            Found:=True;
            E:=Q(I).E;
            P:=Q(I).Pri;
            Q(I):=Q(Length);
            Length:=Length-1;
            Parent:=I/2;
            if Parent=0 or else Q(Parent).Pri>Q(I).Pri then
               DownHeap(I,Length);
            else
               Upheap(I);
            end if;
            exit;
         end if;
      end loop;
   end Dequeue_Middle;


   ----------------
   -- Read_First --
   ----------------

   procedure Read_First (E : out Element; P : out Priority) is

   begin
      if Length=0 then
         raise Empty_Queue;
      else
         E:=Q(1).E;
         P:=Q(1).Pri;
      end if;
   end Read_First;

end Priority_Queue;
