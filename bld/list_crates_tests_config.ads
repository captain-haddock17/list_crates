--  Configuration for list_crates_tests generated by Alire
pragma Restrictions (No_Elaboration_Code);
pragma Style_Checks (Off);

package List_Crates_Tests_Config is
   pragma Pure;

   Crate_Version : constant String := "0.1.0-dev";
   Crate_Name : constant String := "list_crates_tests";

   Alire_Host_OS : constant String := "macos";

   Alire_Host_Arch : constant String := "x86_64";

   Alire_Host_Distro : constant String := "macports";

   type Trace_Level_Kind is (Info, Details, Debug);
   Trace_Level : constant Trace_Level_Kind := Info;

   type Build_Profile_Kind is (release, validation, development);
   Build_Profile : constant Build_Profile_Kind := development;

end List_Crates_Tests_Config;
