--  --------------------------------------------------------------------------------------
--  SPDX-License-Identifier: Apache-2.0
--  SPDX-Creator: William J. Franck (william.franck@sterna.dev)
--  SPDX-FileCopyrightText: Copyright 2025 STERNA MARINE s.a.s. (william.franck@sterna.dev)
--  --------------------------------------------------------------------------------------
--  Initial creation date : 2025-03-01
--  -------------------------------------------------------------

--  with Ada.Calendar;
--  with Ada.Unchecked_Deallocation;
--  with Ada.Strings;
--  with AdaForge.DevTools.TestTools.UnitTest_Name_List;
--  with AdaForge.DevTools.TestTools.UnitTest_AStrings;

with AdaForge.Wide_Wide_Directories.Hierarchical_File_Names;

package body WW_Directories_Hierarchical_Tests is
   use AdaForge.DevTools.TestTools.UnitTest;

   overriding
   procedure Initialize (T : in out Test) is
      use AdaForge.DevTools.TestTools;
   begin
      Set_Name (T, "Package AdaForge.Wide_Wide_Directories.Hierarchical_File_Names");

      UnitTest.Add_Test_Routine
        (T, Test_Is_Simple_Name'Access, "Is_Simple_Name");
      UnitTest.Add_Test_Routine
        (T, Test_Is_Root_Directory_Name'Access, "Is_Root_Directory_Name");
      UnitTest.Add_Test_Routine
        (T, Test_Is_Parent_Directory_Name'Access, "Is_Parent_Directory_Name");
      UnitTest.Add_Test_Routine
        (T, Test_Is_Current_Directory_Name'Access, "Is_Current_Directory_Name");
      UnitTest.Add_Test_Routine
        (T, Test_Is_Full_Name'Access, "Is_Full_Name");
      UnitTest.Add_Test_Routine
        (T, Test_Is_Relative_Name'Access, "Is_Relative_Name");
      UnitTest.Add_Test_Routine
        (T, Test_Initial_Directory'Access, "Initial_Directory");
      UnitTest.Add_Test_Routine
        (T, Test_Relative_Name'Access, "Relative_Name");
      UnitTest.Add_Test_Routine
        (T, Test_Compose'Access, "Compose");
      
   end Initialize;

   overriding
   procedure Set_Up (T : in out Test) is
   begin
      T.State := SETUP_DONE;
      -- myTest := T;
   end Set_Up;

   overriding
   procedure Tear_Down (T : in out Test) is
   begin
      T.State := TEARDOWN_DONE;
   end Tear_Down;

   procedure Test_Is_Simple_Name (T : in out UnitTest.Test_Case'Class) is separate;
   procedure Test_Is_Root_Directory_Name (T : in out UnitTest.Test_Case'Class) is separate;
   procedure Test_Is_Parent_Directory_Name (T : in out UnitTest.Test_Case'Class) is separate;
   procedure Test_Is_Current_Directory_Name (T : in out UnitTest.Test_Case'Class) is separate;
   procedure Test_Is_Full_Name (T : in out UnitTest.Test_Case'Class) is separate;
   procedure Test_Is_Relative_Name (T : in out UnitTest.Test_Case'Class) is separate;
   procedure Test_Initial_Directory (T : in out UnitTest.Test_Case'Class) is separate;
   procedure Test_Relative_Name (T : in out UnitTest.Test_Case'Class) is separate;
   procedure Test_Compose (T : in out UnitTest.Test_Case'Class) is separate;

end WW_Directories_Hierarchical_Tests;
