-------------------------------------------------------------------------------
--                            PACKAGE PRIORITY_QUEUE
--                            ======================
--
-- This package defines a priority queue object and the operations that can be
-- performed on this object:
--
--     Empty and Full queue functions.
--     Enqueue : insert in the queue, in priority order.
--     Dequeue : extract the highest priority element from the queue. No
--               particular order is imposed on equal priority elements.
--     Dequeue_Middle : extract the queue element that matches the supplied
--                      argument.
--     Read_First : return the value of the highest priority element in the
--                  queue, without extracting it from the queue.
--
-- It is written as a generic package, in which the generic parameters are:
--
--     Size : Maximum number of elements in the queue
--     Element : type of the queue elements
--     Priority : type of the priority used for ordering the queue elements
--     ">" : Function used to order the priorities.
--     "=" : Used by dequeue_middle to compare the queue elements with
--           the element supplied by the caller.
-------------------------------------------------------------------------------

generic
   Size : in Positive;
   type Element is private;
   type Priority is private;
   with function ">" (Left,Right : in Priority) return BOOLEAN;
   with function "=" (Left,Right : in Element) return Boolean;

package Priority_Queue is

   Empty_Queue, Full_Queue : exception;

   -----------
   -- Empty --
   -----------
   function Empty return Boolean;

   ----------
   -- Full --
   ----------
   function Full return Boolean;

   -------------
   -- Enqueue --
   -------------
   procedure Enqueue (E : in Element; P : in Priority);

   -------------
   -- Dequeue --
   -------------
   procedure Dequeue (E : out Element; P : out Priority);

   --------------------
   -- Dequeue_Middle --
   --------------------
   procedure Dequeue_Middle (E : in out Element; P : out Priority;
                                                Found : out Boolean);
   ----------------
   -- Read_First --
   ----------------
   procedure Read_First (E : out Element; P : out Priority);

end Priority_Queue;
