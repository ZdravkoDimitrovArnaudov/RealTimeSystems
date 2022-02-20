pragma Ada_95;
pragma Warnings (Off);
pragma Source_File_Name (ada_main, Spec_File_Name => "b__concurrente.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__concurrente.adb");
pragma Suppress (Overflow_Check);

with System.Restrictions;
with Ada.Exceptions;

package body ada_main is

   E134 : Short_Integer; pragma Import (Ada, E134, "system__os_lib_E");
   E011 : Short_Integer; pragma Import (Ada, E011, "system__soft_links_E");
   E021 : Short_Integer; pragma Import (Ada, E021, "system__exception_table_E");
   E127 : Short_Integer; pragma Import (Ada, E127, "ada__io_exceptions_E");
   E049 : Short_Integer; pragma Import (Ada, E049, "ada__strings_E");
   E051 : Short_Integer; pragma Import (Ada, E051, "ada__strings__maps_E");
   E055 : Short_Integer; pragma Import (Ada, E055, "ada__strings__maps__constants_E");
   E118 : Short_Integer; pragma Import (Ada, E118, "ada__tags_E");
   E126 : Short_Integer; pragma Import (Ada, E126, "ada__streams_E");
   E039 : Short_Integer; pragma Import (Ada, E039, "interfaces__c_E");
   E023 : Short_Integer; pragma Import (Ada, E023, "system__exceptions_E");
   E137 : Short_Integer; pragma Import (Ada, E137, "system__file_control_block_E");
   E129 : Short_Integer; pragma Import (Ada, E129, "system__file_io_E");
   E132 : Short_Integer; pragma Import (Ada, E132, "system__finalization_root_E");
   E130 : Short_Integer; pragma Import (Ada, E130, "ada__finalization_E");
   E147 : Short_Integer; pragma Import (Ada, E147, "system__storage_pools_E");
   E143 : Short_Integer; pragma Import (Ada, E143, "system__finalization_masters_E");
   E141 : Short_Integer; pragma Import (Ada, E141, "system__storage_pools__subpools_E");
   E104 : Short_Integer; pragma Import (Ada, E104, "system__task_info_E");
   E063 : Short_Integer; pragma Import (Ada, E063, "system__object_reader_E");
   E044 : Short_Integer; pragma Import (Ada, E044, "system__dwarf_lines_E");
   E015 : Short_Integer; pragma Import (Ada, E015, "system__secondary_stack_E");
   E159 : Short_Integer; pragma Import (Ada, E159, "ada__strings__unbounded_E");
   E173 : Short_Integer; pragma Import (Ada, E173, "system__tasking__initialization_E");
   E034 : Short_Integer; pragma Import (Ada, E034, "system__traceback__symbolic_E");
   E085 : Short_Integer; pragma Import (Ada, E085, "ada__real_time_E");
   E124 : Short_Integer; pragma Import (Ada, E124, "ada__text_io_E");
   E151 : Short_Integer; pragma Import (Ada, E151, "system__tasking__protected_objects_E");
   E179 : Short_Integer; pragma Import (Ada, E179, "system__tasking__protected_objects__entries_E");
   E177 : Short_Integer; pragma Import (Ada, E177, "system__tasking__queuing_E");
   E169 : Short_Integer; pragma Import (Ada, E169, "system__tasking__stages_E");
   E139 : Short_Integer; pragma Import (Ada, E139, "sopa_E");

   Local_Priority_Specific_Dispatching : constant String := "";
   Local_Interrupt_States : constant String := "";

   Is_Elaborated : Boolean := False;

   procedure finalize_library is
   begin
      E179 := E179 - 1;
      declare
         procedure F1;
         pragma Import (Ada, F1, "system__tasking__protected_objects__entries__finalize_spec");
      begin
         F1;
      end;
      E124 := E124 - 1;
      declare
         procedure F2;
         pragma Import (Ada, F2, "ada__text_io__finalize_spec");
      begin
         F2;
      end;
      E159 := E159 - 1;
      declare
         procedure F3;
         pragma Import (Ada, F3, "ada__strings__unbounded__finalize_spec");
      begin
         F3;
      end;
      declare
         procedure F4;
         pragma Import (Ada, F4, "system__file_io__finalize_body");
      begin
         E129 := E129 - 1;
         F4;
      end;
      E143 := E143 - 1;
      E141 := E141 - 1;
      declare
         procedure F5;
         pragma Import (Ada, F5, "system__storage_pools__subpools__finalize_spec");
      begin
         F5;
      end;
      declare
         procedure F6;
         pragma Import (Ada, F6, "system__finalization_masters__finalize_spec");
      begin
         F6;
      end;
      declare
         procedure Reraise_Library_Exception_If_Any;
            pragma Import (Ada, Reraise_Library_Exception_If_Any, "__gnat_reraise_library_exception_if_any");
      begin
         Reraise_Library_Exception_If_Any;
      end;
   end finalize_library;

   procedure adafinal is
      procedure s_stalib_adafinal;
      pragma Import (C, s_stalib_adafinal, "system__standard_library__adafinal");

      procedure Runtime_Finalize;
      pragma Import (C, Runtime_Finalize, "__gnat_runtime_finalize");

   begin
      if not Is_Elaborated then
         return;
      end if;
      Is_Elaborated := False;
      Runtime_Finalize;
      s_stalib_adafinal;
   end adafinal;

   type No_Param_Proc is access procedure;

   procedure adainit is
      Main_Priority : Integer;
      pragma Import (C, Main_Priority, "__gl_main_priority");
      Time_Slice_Value : Integer;
      pragma Import (C, Time_Slice_Value, "__gl_time_slice_val");
      WC_Encoding : Character;
      pragma Import (C, WC_Encoding, "__gl_wc_encoding");
      Locking_Policy : Character;
      pragma Import (C, Locking_Policy, "__gl_locking_policy");
      Queuing_Policy : Character;
      pragma Import (C, Queuing_Policy, "__gl_queuing_policy");
      Task_Dispatching_Policy : Character;
      pragma Import (C, Task_Dispatching_Policy, "__gl_task_dispatching_policy");
      Priority_Specific_Dispatching : System.Address;
      pragma Import (C, Priority_Specific_Dispatching, "__gl_priority_specific_dispatching");
      Num_Specific_Dispatching : Integer;
      pragma Import (C, Num_Specific_Dispatching, "__gl_num_specific_dispatching");
      Main_CPU : Integer;
      pragma Import (C, Main_CPU, "__gl_main_cpu");
      Interrupt_States : System.Address;
      pragma Import (C, Interrupt_States, "__gl_interrupt_states");
      Num_Interrupt_States : Integer;
      pragma Import (C, Num_Interrupt_States, "__gl_num_interrupt_states");
      Unreserve_All_Interrupts : Integer;
      pragma Import (C, Unreserve_All_Interrupts, "__gl_unreserve_all_interrupts");
      Detect_Blocking : Integer;
      pragma Import (C, Detect_Blocking, "__gl_detect_blocking");
      Default_Stack_Size : Integer;
      pragma Import (C, Default_Stack_Size, "__gl_default_stack_size");
      Leap_Seconds_Support : Integer;
      pragma Import (C, Leap_Seconds_Support, "__gl_leap_seconds_support");
      Bind_Env_Addr : System.Address;
      pragma Import (C, Bind_Env_Addr, "__gl_bind_env_addr");

      procedure Runtime_Initialize (Install_Handler : Integer);
      pragma Import (C, Runtime_Initialize, "__gnat_runtime_initialize");

      Finalize_Library_Objects : No_Param_Proc;
      pragma Import (C, Finalize_Library_Objects, "__gnat_finalize_library_objects");
   begin
      if Is_Elaborated then
         return;
      end if;
      Is_Elaborated := True;
      Main_Priority := -1;
      Time_Slice_Value := -1;
      WC_Encoding := 'b';
      Locking_Policy := ' ';
      Queuing_Policy := ' ';
      Task_Dispatching_Policy := ' ';
      System.Restrictions.Run_Time_Restrictions :=
        (Set =>
          (False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, True, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False),
         Value => (0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
         Violated =>
          (False, False, False, True, True, False, False, False, 
           False, False, False, True, True, True, False, False, 
           True, False, False, True, True, False, True, True, 
           False, True, True, True, True, False, False, False, 
           False, False, True, False, False, True, False, True, 
           False, True, True, False, False, False, True, False, 
           False, False, True, False, False, False, False, False, 
           True, False, True, False, True, True, True, False, 
           False, True, False, True, True, True, False, True, 
           True, False, True, True, True, True, False, False, 
           True, False, False, False, False, False, False, True, 
           False, True, False),
         Count => (0, 0, 0, 0, 0, 0, 1, 0, 1, 0),
         Unknown => (False, False, False, False, False, False, True, False, True, False));
      Priority_Specific_Dispatching :=
        Local_Priority_Specific_Dispatching'Address;
      Num_Specific_Dispatching := 0;
      Main_CPU := -1;
      Interrupt_States := Local_Interrupt_States'Address;
      Num_Interrupt_States := 0;
      Unreserve_All_Interrupts := 0;
      Detect_Blocking := 0;
      Default_Stack_Size := -1;
      Leap_Seconds_Support := 0;

      Runtime_Initialize (1);

      Finalize_Library_Objects := finalize_library'access;

      System.Soft_Links'Elab_Spec;
      System.Exception_Table'Elab_Body;
      E021 := E021 + 1;
      Ada.Io_Exceptions'Elab_Spec;
      E127 := E127 + 1;
      Ada.Strings'Elab_Spec;
      E049 := E049 + 1;
      Ada.Strings.Maps'Elab_Spec;
      Ada.Strings.Maps.Constants'Elab_Spec;
      E055 := E055 + 1;
      Ada.Tags'Elab_Spec;
      Ada.Streams'Elab_Spec;
      E126 := E126 + 1;
      Interfaces.C'Elab_Spec;
      System.Exceptions'Elab_Spec;
      E023 := E023 + 1;
      System.File_Control_Block'Elab_Spec;
      E137 := E137 + 1;
      System.Finalization_Root'Elab_Spec;
      E132 := E132 + 1;
      Ada.Finalization'Elab_Spec;
      E130 := E130 + 1;
      System.Storage_Pools'Elab_Spec;
      E147 := E147 + 1;
      System.Finalization_Masters'Elab_Spec;
      System.Storage_Pools.Subpools'Elab_Spec;
      System.Task_Info'Elab_Spec;
      E104 := E104 + 1;
      System.Object_Reader'Elab_Spec;
      System.Dwarf_Lines'Elab_Spec;
      E141 := E141 + 1;
      System.Finalization_Masters'Elab_Body;
      E143 := E143 + 1;
      System.File_Io'Elab_Body;
      E129 := E129 + 1;
      E039 := E039 + 1;
      Ada.Tags'Elab_Body;
      E118 := E118 + 1;
      E051 := E051 + 1;
      System.Soft_Links'Elab_Body;
      E011 := E011 + 1;
      System.Os_Lib'Elab_Body;
      E134 := E134 + 1;
      System.Secondary_Stack'Elab_Body;
      E015 := E015 + 1;
      E044 := E044 + 1;
      E063 := E063 + 1;
      Ada.Strings.Unbounded'Elab_Spec;
      E159 := E159 + 1;
      System.Traceback.Symbolic'Elab_Body;
      E034 := E034 + 1;
      System.Tasking.Initialization'Elab_Body;
      E173 := E173 + 1;
      Ada.Real_Time'Elab_Spec;
      Ada.Real_Time'Elab_Body;
      E085 := E085 + 1;
      Ada.Text_Io'Elab_Spec;
      Ada.Text_Io'Elab_Body;
      E124 := E124 + 1;
      System.Tasking.Protected_Objects'Elab_Body;
      E151 := E151 + 1;
      System.Tasking.Protected_Objects.Entries'Elab_Spec;
      E179 := E179 + 1;
      System.Tasking.Queuing'Elab_Body;
      E177 := E177 + 1;
      System.Tasking.Stages'Elab_Body;
      E169 := E169 + 1;
      Sopa'Elab_Spec;
      Sopa'Elab_Body;
      E139 := E139 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_concurrente");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer
   is
      procedure Initialize (Addr : System.Address);
      pragma Import (C, Initialize, "__gnat_initialize");

      procedure Finalize;
      pragma Import (C, Finalize, "__gnat_finalize");
      SEH : aliased array (1 .. 2) of Integer;

      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      gnat_argc := argc;
      gnat_argv := argv;
      gnat_envp := envp;

      Initialize (SEH'Address);
      adainit;
      Ada_Main_Program;
      adafinal;
      Finalize;
      return (gnat_exit_status);
   end;

--  BEGIN Object file/option list
   --   /remotehome/dimitroz/Documentos/TiempoReal/Laboratorio/practica4/sopa.o
   --   /remotehome/dimitroz/Documentos/TiempoReal/Laboratorio/practica4/concurrente.o
   --   -L/remotehome/dimitroz/Documentos/TiempoReal/Laboratorio/practica4/
   --   -L/remotehome/dimitroz/Documentos/TiempoReal/Laboratorio/practica4/
   --   -L/usr/local/gnat-2016/lib/gcc/x86_64-pc-linux-gnu/4.9.4/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
   --   -ldl
   --   -lpthread
   --   -lrt
--  END Object file/option list   

end ada_main;
