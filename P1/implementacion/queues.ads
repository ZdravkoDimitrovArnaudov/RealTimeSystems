-------------------------------------------------------------------------------
--                            PACKAGE QUEUES
--                            ==============
--
-- This package defines a queue type and the operations that can be
-- performed on this type:
--
--     empty and full queue functions.
--     enqueue : insert in the queue
--     dequeue : extract the first element from the queue.
--     read_first : return the value of the first element in the
--                  queue, without extracting it from the queue.
--
-- It is written as a generic package, in which the generic parameters are:
--
--     queue_size : queue_size-1 is the maximum number of elements in the queue
--     element    : type of the queue elements
-------------------------------------------------------------------------------

generic
   Queue_Size : in Positive;
   type Element is private;

package Queues is

   type Queue is private;

   Empty_Queue, Full_Queue : exception;

   function Empty (The_Queue : in Queue)  return Boolean;
   function Full  (The_Queue : in Queue)  return Boolean;

   procedure Enqueue    (The_Element   : in Element;
                         In_The_Queue  : in out Queue);
   procedure Dequeue    (An_Element    : out Element;
                         From_The_Queue: in out Queue);
   procedure Read_First (An_Element    : out Element;
                         From_The_Queue: in Queue);

private
   subtype Index is Integer range 0..Queue_Size-1;

   type Contents_Type is array(Index) of Element;

   type Queue is record
      Contents : Contents_Type;
      Head     : Index :=0;
      Tail     : Index :=Queue_Size-1;
   end record;

end Queues;
