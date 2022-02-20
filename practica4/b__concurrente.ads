pragma Ada_95;
pragma Warnings (Off);
with System;
package ada_main is

   gnat_argc : Integer;
   gnat_argv : System.Address;
   gnat_envp : System.Address;

   pragma Import (C, gnat_argc);
   pragma Import (C, gnat_argv);
   pragma Import (C, gnat_envp);

   gnat_exit_status : Integer;
   pragma Import (C, gnat_exit_status);

   GNAT_Version : constant String :=
                    "GNAT Version: GPL 2016 (20160515-49)" & ASCII.NUL;
   pragma Export (C, GNAT_Version, "__gnat_version");

   Ada_Main_Program_Name : constant String := "_ada_concurrente" & ASCII.NUL;
   pragma Export (C, Ada_Main_Program_Name, "__gnat_ada_main_program_name");

   procedure adainit;
   pragma Export (C, adainit, "adainit");

   procedure adafinal;
   pragma Export (C, adafinal, "adafinal");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer;
   pragma Export (C, main, "main");

   type Version_32 is mod 2 ** 32;
   u00001 : constant Version_32 := 16#45cf0ea7#;
   pragma Export (C, u00001, "concurrenteB");
   u00002 : constant Version_32 := 16#b6df930e#;
   pragma Export (C, u00002, "system__standard_libraryB");
   u00003 : constant Version_32 := 16#937076cc#;
   pragma Export (C, u00003, "system__standard_libraryS");
   u00004 : constant Version_32 := 16#3ffc8e18#;
   pragma Export (C, u00004, "adaS");
   u00005 : constant Version_32 := 16#e7214354#;
   pragma Export (C, u00005, "ada__exceptionsB");
   u00006 : constant Version_32 := 16#020f9e08#;
   pragma Export (C, u00006, "ada__exceptionsS");
   u00007 : constant Version_32 := 16#e947e6a9#;
   pragma Export (C, u00007, "ada__exceptions__last_chance_handlerB");
   u00008 : constant Version_32 := 16#41e5552e#;
   pragma Export (C, u00008, "ada__exceptions__last_chance_handlerS");
   u00009 : constant Version_32 := 16#6326c08a#;
   pragma Export (C, u00009, "systemS");
   u00010 : constant Version_32 := 16#5f84b5ab#;
   pragma Export (C, u00010, "system__soft_linksB");
   u00011 : constant Version_32 := 16#fda218df#;
   pragma Export (C, u00011, "system__soft_linksS");
   u00012 : constant Version_32 := 16#b01dad17#;
   pragma Export (C, u00012, "system__parametersB");
   u00013 : constant Version_32 := 16#1d0ccdf5#;
   pragma Export (C, u00013, "system__parametersS");
   u00014 : constant Version_32 := 16#0f0cb66d#;
   pragma Export (C, u00014, "system__secondary_stackB");
   u00015 : constant Version_32 := 16#c8470fe3#;
   pragma Export (C, u00015, "system__secondary_stackS");
   u00016 : constant Version_32 := 16#39a03df9#;
   pragma Export (C, u00016, "system__storage_elementsB");
   u00017 : constant Version_32 := 16#4ee58a8e#;
   pragma Export (C, u00017, "system__storage_elementsS");
   u00018 : constant Version_32 := 16#41837d1e#;
   pragma Export (C, u00018, "system__stack_checkingB");
   u00019 : constant Version_32 := 16#ed99ab62#;
   pragma Export (C, u00019, "system__stack_checkingS");
   u00020 : constant Version_32 := 16#87a448ff#;
   pragma Export (C, u00020, "system__exception_tableB");
   u00021 : constant Version_32 := 16#3e88a9c8#;
   pragma Export (C, u00021, "system__exception_tableS");
   u00022 : constant Version_32 := 16#ce4af020#;
   pragma Export (C, u00022, "system__exceptionsB");
   u00023 : constant Version_32 := 16#0b45ad7c#;
   pragma Export (C, u00023, "system__exceptionsS");
   u00024 : constant Version_32 := 16#4c9e814d#;
   pragma Export (C, u00024, "system__exceptions__machineS");
   u00025 : constant Version_32 := 16#aa0563fc#;
   pragma Export (C, u00025, "system__exceptions_debugB");
   u00026 : constant Version_32 := 16#1dac394e#;
   pragma Export (C, u00026, "system__exceptions_debugS");
   u00027 : constant Version_32 := 16#6c2f8802#;
   pragma Export (C, u00027, "system__img_intB");
   u00028 : constant Version_32 := 16#61fd2048#;
   pragma Export (C, u00028, "system__img_intS");
   u00029 : constant Version_32 := 16#39df8c17#;
   pragma Export (C, u00029, "system__tracebackB");
   u00030 : constant Version_32 := 16#3d041e4e#;
   pragma Export (C, u00030, "system__tracebackS");
   u00031 : constant Version_32 := 16#9ed49525#;
   pragma Export (C, u00031, "system__traceback_entriesB");
   u00032 : constant Version_32 := 16#637d36fa#;
   pragma Export (C, u00032, "system__traceback_entriesS");
   u00033 : constant Version_32 := 16#0162f862#;
   pragma Export (C, u00033, "system__traceback__symbolicB");
   u00034 : constant Version_32 := 16#dd19f67a#;
   pragma Export (C, u00034, "system__traceback__symbolicS");
   u00035 : constant Version_32 := 16#701f9d88#;
   pragma Export (C, u00035, "ada__exceptions__tracebackB");
   u00036 : constant Version_32 := 16#20245e75#;
   pragma Export (C, u00036, "ada__exceptions__tracebackS");
   u00037 : constant Version_32 := 16#5ab55268#;
   pragma Export (C, u00037, "interfacesS");
   u00038 : constant Version_32 := 16#769e25e6#;
   pragma Export (C, u00038, "interfaces__cB");
   u00039 : constant Version_32 := 16#70be4e8c#;
   pragma Export (C, u00039, "interfaces__cS");
   u00040 : constant Version_32 := 16#5f72f755#;
   pragma Export (C, u00040, "system__address_operationsB");
   u00041 : constant Version_32 := 16#702a7eb9#;
   pragma Export (C, u00041, "system__address_operationsS");
   u00042 : constant Version_32 := 16#13b71684#;
   pragma Export (C, u00042, "system__crtlS");
   u00043 : constant Version_32 := 16#f82008fb#;
   pragma Export (C, u00043, "system__dwarf_linesB");
   u00044 : constant Version_32 := 16#0aa7ccc7#;
   pragma Export (C, u00044, "system__dwarf_linesS");
   u00045 : constant Version_32 := 16#12c24a43#;
   pragma Export (C, u00045, "ada__charactersS");
   u00046 : constant Version_32 := 16#8f637df8#;
   pragma Export (C, u00046, "ada__characters__handlingB");
   u00047 : constant Version_32 := 16#3b3f6154#;
   pragma Export (C, u00047, "ada__characters__handlingS");
   u00048 : constant Version_32 := 16#4b7bb96a#;
   pragma Export (C, u00048, "ada__characters__latin_1S");
   u00049 : constant Version_32 := 16#af50e98f#;
   pragma Export (C, u00049, "ada__stringsS");
   u00050 : constant Version_32 := 16#e2ea8656#;
   pragma Export (C, u00050, "ada__strings__mapsB");
   u00051 : constant Version_32 := 16#1e526bec#;
   pragma Export (C, u00051, "ada__strings__mapsS");
   u00052 : constant Version_32 := 16#04ec3c16#;
   pragma Export (C, u00052, "system__bit_opsB");
   u00053 : constant Version_32 := 16#0765e3a3#;
   pragma Export (C, u00053, "system__bit_opsS");
   u00054 : constant Version_32 := 16#57a0bc09#;
   pragma Export (C, u00054, "system__unsigned_typesS");
   u00055 : constant Version_32 := 16#92f05f13#;
   pragma Export (C, u00055, "ada__strings__maps__constantsS");
   u00056 : constant Version_32 := 16#57a37a42#;
   pragma Export (C, u00056, "system__address_imageB");
   u00057 : constant Version_32 := 16#c2ca5db0#;
   pragma Export (C, u00057, "system__address_imageS");
   u00058 : constant Version_32 := 16#ec78c2bf#;
   pragma Export (C, u00058, "system__img_unsB");
   u00059 : constant Version_32 := 16#c85480fe#;
   pragma Export (C, u00059, "system__img_unsS");
   u00060 : constant Version_32 := 16#d7aac20c#;
   pragma Export (C, u00060, "system__ioB");
   u00061 : constant Version_32 := 16#fd6437c5#;
   pragma Export (C, u00061, "system__ioS");
   u00062 : constant Version_32 := 16#cf909744#;
   pragma Export (C, u00062, "system__object_readerB");
   u00063 : constant Version_32 := 16#27c18a1d#;
   pragma Export (C, u00063, "system__object_readerS");
   u00064 : constant Version_32 := 16#1a74a354#;
   pragma Export (C, u00064, "system__val_lliB");
   u00065 : constant Version_32 := 16#f902262a#;
   pragma Export (C, u00065, "system__val_lliS");
   u00066 : constant Version_32 := 16#afdbf393#;
   pragma Export (C, u00066, "system__val_lluB");
   u00067 : constant Version_32 := 16#2d52eb7b#;
   pragma Export (C, u00067, "system__val_lluS");
   u00068 : constant Version_32 := 16#27b600b2#;
   pragma Export (C, u00068, "system__val_utilB");
   u00069 : constant Version_32 := 16#cf867674#;
   pragma Export (C, u00069, "system__val_utilS");
   u00070 : constant Version_32 := 16#d1060688#;
   pragma Export (C, u00070, "system__case_utilB");
   u00071 : constant Version_32 := 16#472fa95d#;
   pragma Export (C, u00071, "system__case_utilS");
   u00072 : constant Version_32 := 16#84a27f0d#;
   pragma Export (C, u00072, "interfaces__c_streamsB");
   u00073 : constant Version_32 := 16#b1330297#;
   pragma Export (C, u00073, "interfaces__c_streamsS");
   u00074 : constant Version_32 := 16#931ff6be#;
   pragma Export (C, u00074, "system__exception_tracesB");
   u00075 : constant Version_32 := 16#47f9e010#;
   pragma Export (C, u00075, "system__exception_tracesS");
   u00076 : constant Version_32 := 16#8c33a517#;
   pragma Export (C, u00076, "system__wch_conB");
   u00077 : constant Version_32 := 16#785be258#;
   pragma Export (C, u00077, "system__wch_conS");
   u00078 : constant Version_32 := 16#9721e840#;
   pragma Export (C, u00078, "system__wch_stwB");
   u00079 : constant Version_32 := 16#554ace59#;
   pragma Export (C, u00079, "system__wch_stwS");
   u00080 : constant Version_32 := 16#a831679c#;
   pragma Export (C, u00080, "system__wch_cnvB");
   u00081 : constant Version_32 := 16#77ec58ab#;
   pragma Export (C, u00081, "system__wch_cnvS");
   u00082 : constant Version_32 := 16#ece6fdb6#;
   pragma Export (C, u00082, "system__wch_jisB");
   u00083 : constant Version_32 := 16#f79c418a#;
   pragma Export (C, u00083, "system__wch_jisS");
   u00084 : constant Version_32 := 16#7d70b364#;
   pragma Export (C, u00084, "ada__real_timeB");
   u00085 : constant Version_32 := 16#8a504209#;
   pragma Export (C, u00085, "ada__real_timeS");
   u00086 : constant Version_32 := 16#479d6ec9#;
   pragma Export (C, u00086, "system__taskingB");
   u00087 : constant Version_32 := 16#2f3b52e0#;
   pragma Export (C, u00087, "system__taskingS");
   u00088 : constant Version_32 := 16#e47b6764#;
   pragma Export (C, u00088, "system__task_primitivesS");
   u00089 : constant Version_32 := 16#172fac80#;
   pragma Export (C, u00089, "system__os_interfaceB");
   u00090 : constant Version_32 := 16#cf073c09#;
   pragma Export (C, u00090, "system__os_interfaceS");
   u00091 : constant Version_32 := 16#18ddbbc0#;
   pragma Export (C, u00091, "system__linuxS");
   u00092 : constant Version_32 := 16#7dc03a19#;
   pragma Export (C, u00092, "system__os_constantsS");
   u00093 : constant Version_32 := 16#f1cff9ba#;
   pragma Export (C, u00093, "system__task_primitives__operationsB");
   u00094 : constant Version_32 := 16#e3c3f180#;
   pragma Export (C, u00094, "system__task_primitives__operationsS");
   u00095 : constant Version_32 := 16#66645a25#;
   pragma Export (C, u00095, "system__interrupt_managementB");
   u00096 : constant Version_32 := 16#144b2cd0#;
   pragma Export (C, u00096, "system__interrupt_managementS");
   u00097 : constant Version_32 := 16#f65595cf#;
   pragma Export (C, u00097, "system__multiprocessorsB");
   u00098 : constant Version_32 := 16#5b8a5ff9#;
   pragma Export (C, u00098, "system__multiprocessorsS");
   u00099 : constant Version_32 := 16#d083f760#;
   pragma Export (C, u00099, "system__os_primitivesB");
   u00100 : constant Version_32 := 16#e9a9d1fc#;
   pragma Export (C, u00100, "system__os_primitivesS");
   u00101 : constant Version_32 := 16#d8d909aa#;
   pragma Export (C, u00101, "system__stack_checking__operationsB");
   u00102 : constant Version_32 := 16#64c2cb2b#;
   pragma Export (C, u00102, "system__stack_checking__operationsS");
   u00103 : constant Version_32 := 16#375a3ef7#;
   pragma Export (C, u00103, "system__task_infoB");
   u00104 : constant Version_32 := 16#2cefa11f#;
   pragma Export (C, u00104, "system__task_infoS");
   u00105 : constant Version_32 := 16#67fbf7ba#;
   pragma Export (C, u00105, "system__tasking__debugB");
   u00106 : constant Version_32 := 16#bb5f8631#;
   pragma Export (C, u00106, "system__tasking__debugS");
   u00107 : constant Version_32 := 16#fd83e873#;
   pragma Export (C, u00107, "system__concat_2B");
   u00108 : constant Version_32 := 16#6186175a#;
   pragma Export (C, u00108, "system__concat_2S");
   u00109 : constant Version_32 := 16#2b70b149#;
   pragma Export (C, u00109, "system__concat_3B");
   u00110 : constant Version_32 := 16#68569c2f#;
   pragma Export (C, u00110, "system__concat_3S");
   u00111 : constant Version_32 := 16#d0432c8d#;
   pragma Export (C, u00111, "system__img_enum_newB");
   u00112 : constant Version_32 := 16#026ac64a#;
   pragma Export (C, u00112, "system__img_enum_newS");
   u00113 : constant Version_32 := 16#9dca6636#;
   pragma Export (C, u00113, "system__img_lliB");
   u00114 : constant Version_32 := 16#7269955b#;
   pragma Export (C, u00114, "system__img_lliS");
   u00115 : constant Version_32 := 16#118e865d#;
   pragma Export (C, u00115, "system__stack_usageB");
   u00116 : constant Version_32 := 16#3a3ac346#;
   pragma Export (C, u00116, "system__stack_usageS");
   u00117 : constant Version_32 := 16#920eada5#;
   pragma Export (C, u00117, "ada__tagsB");
   u00118 : constant Version_32 := 16#13ca27f3#;
   pragma Export (C, u00118, "ada__tagsS");
   u00119 : constant Version_32 := 16#c3335bfd#;
   pragma Export (C, u00119, "system__htableB");
   u00120 : constant Version_32 := 16#e7e47360#;
   pragma Export (C, u00120, "system__htableS");
   u00121 : constant Version_32 := 16#089f5cd0#;
   pragma Export (C, u00121, "system__string_hashB");
   u00122 : constant Version_32 := 16#45ba181e#;
   pragma Export (C, u00122, "system__string_hashS");
   u00123 : constant Version_32 := 16#d5bfa9f3#;
   pragma Export (C, u00123, "ada__text_ioB");
   u00124 : constant Version_32 := 16#8d734ca7#;
   pragma Export (C, u00124, "ada__text_ioS");
   u00125 : constant Version_32 := 16#10558b11#;
   pragma Export (C, u00125, "ada__streamsB");
   u00126 : constant Version_32 := 16#2e6701ab#;
   pragma Export (C, u00126, "ada__streamsS");
   u00127 : constant Version_32 := 16#db5c917c#;
   pragma Export (C, u00127, "ada__io_exceptionsS");
   u00128 : constant Version_32 := 16#b29d05bd#;
   pragma Export (C, u00128, "system__file_ioB");
   u00129 : constant Version_32 := 16#c45721ef#;
   pragma Export (C, u00129, "system__file_ioS");
   u00130 : constant Version_32 := 16#cf417de3#;
   pragma Export (C, u00130, "ada__finalizationS");
   u00131 : constant Version_32 := 16#95817ed8#;
   pragma Export (C, u00131, "system__finalization_rootB");
   u00132 : constant Version_32 := 16#2cd4b31a#;
   pragma Export (C, u00132, "system__finalization_rootS");
   u00133 : constant Version_32 := 16#d3560627#;
   pragma Export (C, u00133, "system__os_libB");
   u00134 : constant Version_32 := 16#bf5ce13f#;
   pragma Export (C, u00134, "system__os_libS");
   u00135 : constant Version_32 := 16#1a817b8e#;
   pragma Export (C, u00135, "system__stringsB");
   u00136 : constant Version_32 := 16#1d99d1ec#;
   pragma Export (C, u00136, "system__stringsS");
   u00137 : constant Version_32 := 16#9eb95a22#;
   pragma Export (C, u00137, "system__file_control_blockS");
   u00138 : constant Version_32 := 16#eada5a9f#;
   pragma Export (C, u00138, "sopaB");
   u00139 : constant Version_32 := 16#1604160a#;
   pragma Export (C, u00139, "sopaS");
   u00140 : constant Version_32 := 16#6a86c9a5#;
   pragma Export (C, u00140, "system__storage_pools__subpoolsB");
   u00141 : constant Version_32 := 16#cc5a1856#;
   pragma Export (C, u00141, "system__storage_pools__subpoolsS");
   u00142 : constant Version_32 := 16#6abe5dbe#;
   pragma Export (C, u00142, "system__finalization_mastersB");
   u00143 : constant Version_32 := 16#38daf940#;
   pragma Export (C, u00143, "system__finalization_mastersS");
   u00144 : constant Version_32 := 16#7268f812#;
   pragma Export (C, u00144, "system__img_boolB");
   u00145 : constant Version_32 := 16#96ffb161#;
   pragma Export (C, u00145, "system__img_boolS");
   u00146 : constant Version_32 := 16#6d4d969a#;
   pragma Export (C, u00146, "system__storage_poolsB");
   u00147 : constant Version_32 := 16#40cb5e27#;
   pragma Export (C, u00147, "system__storage_poolsS");
   u00148 : constant Version_32 := 16#9aad1ff1#;
   pragma Export (C, u00148, "system__storage_pools__subpools__finalizationB");
   u00149 : constant Version_32 := 16#fe2f4b3a#;
   pragma Export (C, u00149, "system__storage_pools__subpools__finalizationS");
   u00150 : constant Version_32 := 16#1ae41921#;
   pragma Export (C, u00150, "system__tasking__protected_objectsB");
   u00151 : constant Version_32 := 16#5744f344#;
   pragma Export (C, u00151, "system__tasking__protected_objectsS");
   u00152 : constant Version_32 := 16#0c704ece#;
   pragma Export (C, u00152, "system__soft_links__taskingB");
   u00153 : constant Version_32 := 16#5ae92880#;
   pragma Export (C, u00153, "system__soft_links__taskingS");
   u00154 : constant Version_32 := 16#17d21067#;
   pragma Export (C, u00154, "ada__exceptions__is_null_occurrenceB");
   u00155 : constant Version_32 := 16#e1d7566f#;
   pragma Export (C, u00155, "ada__exceptions__is_null_occurrenceS");
   u00156 : constant Version_32 := 16#ee80728a#;
   pragma Export (C, u00156, "system__tracesB");
   u00157 : constant Version_32 := 16#913ba820#;
   pragma Export (C, u00157, "system__tracesS");
   u00158 : constant Version_32 := 16#5130abd7#;
   pragma Export (C, u00158, "ada__strings__unboundedB");
   u00159 : constant Version_32 := 16#4c956ffe#;
   pragma Export (C, u00159, "ada__strings__unboundedS");
   u00160 : constant Version_32 := 16#45c9251c#;
   pragma Export (C, u00160, "ada__strings__searchB");
   u00161 : constant Version_32 := 16#c1ab8667#;
   pragma Export (C, u00161, "ada__strings__searchS");
   u00162 : constant Version_32 := 16#5b9edcc4#;
   pragma Export (C, u00162, "system__compare_array_unsigned_8B");
   u00163 : constant Version_32 := 16#ca25b107#;
   pragma Export (C, u00163, "system__compare_array_unsigned_8S");
   u00164 : constant Version_32 := 16#020a3f4d#;
   pragma Export (C, u00164, "system__atomic_countersB");
   u00165 : constant Version_32 := 16#d77aed07#;
   pragma Export (C, u00165, "system__atomic_countersS");
   u00166 : constant Version_32 := 16#f4e1c091#;
   pragma Export (C, u00166, "system__stream_attributesB");
   u00167 : constant Version_32 := 16#8bc30a4e#;
   pragma Export (C, u00167, "system__stream_attributesS");
   u00168 : constant Version_32 := 16#1e402d71#;
   pragma Export (C, u00168, "system__tasking__stagesB");
   u00169 : constant Version_32 := 16#8a8c382e#;
   pragma Export (C, u00169, "system__tasking__stagesS");
   u00170 : constant Version_32 := 16#100eaf58#;
   pragma Export (C, u00170, "system__restrictionsB");
   u00171 : constant Version_32 := 16#ca868a2b#;
   pragma Export (C, u00171, "system__restrictionsS");
   u00172 : constant Version_32 := 16#933a3e65#;
   pragma Export (C, u00172, "system__tasking__initializationB");
   u00173 : constant Version_32 := 16#ed62fcff#;
   pragma Export (C, u00173, "system__tasking__initializationS");
   u00174 : constant Version_32 := 16#9b48686e#;
   pragma Export (C, u00174, "system__tasking__task_attributesB");
   u00175 : constant Version_32 := 16#a1da3c09#;
   pragma Export (C, u00175, "system__tasking__task_attributesS");
   u00176 : constant Version_32 := 16#d7130ad0#;
   pragma Export (C, u00176, "system__tasking__queuingB");
   u00177 : constant Version_32 := 16#05e644a6#;
   pragma Export (C, u00177, "system__tasking__queuingS");
   u00178 : constant Version_32 := 16#7d7ec024#;
   pragma Export (C, u00178, "system__tasking__protected_objects__entriesB");
   u00179 : constant Version_32 := 16#a0c7bfc6#;
   pragma Export (C, u00179, "system__tasking__protected_objects__entriesS");
   u00180 : constant Version_32 := 16#7f10ce87#;
   pragma Export (C, u00180, "system__tasking__rendezvousB");
   u00181 : constant Version_32 := 16#3e44c873#;
   pragma Export (C, u00181, "system__tasking__rendezvousS");
   u00182 : constant Version_32 := 16#3104380a#;
   pragma Export (C, u00182, "system__tasking__entry_callsB");
   u00183 : constant Version_32 := 16#ddf2aa0b#;
   pragma Export (C, u00183, "system__tasking__entry_callsS");
   u00184 : constant Version_32 := 16#2c5eeaff#;
   pragma Export (C, u00184, "system__tasking__protected_objects__operationsB");
   u00185 : constant Version_32 := 16#902e29cd#;
   pragma Export (C, u00185, "system__tasking__protected_objects__operationsS");
   u00186 : constant Version_32 := 16#8539b82b#;
   pragma Export (C, u00186, "system__tasking__utilitiesB");
   u00187 : constant Version_32 := 16#51068caf#;
   pragma Export (C, u00187, "system__tasking__utilitiesS");
   u00188 : constant Version_32 := 16#bd6fc52e#;
   pragma Export (C, u00188, "system__traces__taskingB");
   u00189 : constant Version_32 := 16#0b40d4b2#;
   pragma Export (C, u00189, "system__traces__taskingS");
   u00190 : constant Version_32 := 16#a6359005#;
   pragma Export (C, u00190, "system__memoryB");
   u00191 : constant Version_32 := 16#3a5ba6be#;
   pragma Export (C, u00191, "system__memoryS");
   --  BEGIN ELABORATION ORDER
   --  ada%s
   --  ada.characters%s
   --  ada.characters.handling%s
   --  ada.characters.latin_1%s
   --  interfaces%s
   --  system%s
   --  system.address_operations%s
   --  system.address_operations%b
   --  system.atomic_counters%s
   --  system.atomic_counters%b
   --  system.case_util%s
   --  system.case_util%b
   --  system.htable%s
   --  system.img_bool%s
   --  system.img_bool%b
   --  system.img_enum_new%s
   --  system.img_enum_new%b
   --  system.img_int%s
   --  system.img_int%b
   --  system.img_lli%s
   --  system.img_lli%b
   --  system.io%s
   --  system.io%b
   --  system.multiprocessors%s
   --  system.os_primitives%s
   --  system.os_primitives%b
   --  system.parameters%s
   --  system.parameters%b
   --  system.crtl%s
   --  interfaces.c_streams%s
   --  interfaces.c_streams%b
   --  system.restrictions%s
   --  system.restrictions%b
   --  system.standard_library%s
   --  system.exceptions_debug%s
   --  system.exceptions_debug%b
   --  system.storage_elements%s
   --  system.storage_elements%b
   --  system.stack_checking%s
   --  system.stack_checking%b
   --  system.stack_checking.operations%s
   --  system.stack_usage%s
   --  system.stack_usage%b
   --  system.string_hash%s
   --  system.string_hash%b
   --  system.htable%b
   --  system.strings%s
   --  system.strings%b
   --  system.os_lib%s
   --  system.traceback_entries%s
   --  system.traceback_entries%b
   --  ada.exceptions%s
   --  ada.exceptions.is_null_occurrence%s
   --  ada.exceptions.is_null_occurrence%b
   --  system.soft_links%s
   --  system.stack_checking.operations%b
   --  system.traces%s
   --  system.traces%b
   --  system.unsigned_types%s
   --  system.img_uns%s
   --  system.img_uns%b
   --  system.val_lli%s
   --  system.val_llu%s
   --  system.val_util%s
   --  system.val_util%b
   --  system.val_llu%b
   --  system.val_lli%b
   --  system.wch_con%s
   --  system.wch_con%b
   --  system.wch_cnv%s
   --  system.wch_jis%s
   --  system.wch_jis%b
   --  system.wch_cnv%b
   --  system.wch_stw%s
   --  system.wch_stw%b
   --  ada.exceptions.last_chance_handler%s
   --  ada.exceptions.last_chance_handler%b
   --  ada.exceptions.traceback%s
   --  system.address_image%s
   --  system.bit_ops%s
   --  system.bit_ops%b
   --  system.compare_array_unsigned_8%s
   --  system.compare_array_unsigned_8%b
   --  system.concat_2%s
   --  system.concat_2%b
   --  system.concat_3%s
   --  system.concat_3%b
   --  system.exception_table%s
   --  system.exception_table%b
   --  ada.io_exceptions%s
   --  ada.strings%s
   --  ada.strings.maps%s
   --  ada.strings.maps.constants%s
   --  ada.strings.search%s
   --  ada.strings.search%b
   --  ada.tags%s
   --  ada.streams%s
   --  ada.streams%b
   --  interfaces.c%s
   --  system.multiprocessors%b
   --  system.exceptions%s
   --  system.exceptions%b
   --  system.exceptions.machine%s
   --  system.file_control_block%s
   --  system.file_io%s
   --  system.finalization_root%s
   --  system.finalization_root%b
   --  ada.finalization%s
   --  system.linux%s
   --  system.os_constants%s
   --  system.os_interface%s
   --  system.os_interface%b
   --  system.interrupt_management%s
   --  system.storage_pools%s
   --  system.storage_pools%b
   --  system.finalization_masters%s
   --  system.storage_pools.subpools%s
   --  system.storage_pools.subpools.finalization%s
   --  system.storage_pools.subpools.finalization%b
   --  system.stream_attributes%s
   --  system.stream_attributes%b
   --  system.task_info%s
   --  system.task_info%b
   --  system.task_primitives%s
   --  system.interrupt_management%b
   --  system.tasking%s
   --  system.task_primitives.operations%s
   --  system.tasking%b
   --  system.tasking.debug%s
   --  system.tasking.debug%b
   --  system.task_primitives.operations%b
   --  system.traces.tasking%s
   --  system.traces.tasking%b
   --  system.exception_traces%s
   --  system.exception_traces%b
   --  system.memory%s
   --  system.memory%b
   --  system.standard_library%b
   --  system.object_reader%s
   --  system.dwarf_lines%s
   --  system.secondary_stack%s
   --  system.storage_pools.subpools%b
   --  system.finalization_masters%b
   --  system.file_io%b
   --  interfaces.c%b
   --  ada.tags%b
   --  ada.strings.maps%b
   --  system.soft_links%b
   --  system.os_lib%b
   --  ada.characters.handling%b
   --  system.secondary_stack%b
   --  system.dwarf_lines%b
   --  system.object_reader%b
   --  system.address_image%b
   --  ada.exceptions.traceback%b
   --  ada.strings.unbounded%s
   --  ada.strings.unbounded%b
   --  system.soft_links.tasking%s
   --  system.soft_links.tasking%b
   --  system.tasking.entry_calls%s
   --  system.tasking.initialization%s
   --  system.tasking.task_attributes%s
   --  system.tasking.task_attributes%b
   --  system.tasking.utilities%s
   --  system.traceback%s
   --  system.traceback%b
   --  system.traceback.symbolic%s
   --  system.traceback.symbolic%b
   --  ada.exceptions%b
   --  system.tasking.initialization%b
   --  ada.real_time%s
   --  ada.real_time%b
   --  ada.text_io%s
   --  ada.text_io%b
   --  system.tasking.protected_objects%s
   --  system.tasking.protected_objects%b
   --  system.tasking.protected_objects.entries%s
   --  system.tasking.protected_objects.entries%b
   --  system.tasking.queuing%s
   --  system.tasking.queuing%b
   --  system.tasking.utilities%b
   --  system.tasking.rendezvous%s
   --  system.tasking.protected_objects.operations%s
   --  system.tasking.protected_objects.operations%b
   --  system.tasking.rendezvous%b
   --  system.tasking.entry_calls%b
   --  system.tasking.stages%s
   --  system.tasking.stages%b
   --  sopa%s
   --  sopa%b
   --  concurrente%b
   --  END ELABORATION ORDER


end ada_main;
