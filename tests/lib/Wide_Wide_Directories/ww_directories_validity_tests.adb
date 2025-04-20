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

with AdaForge.Wide_Wide_Directories;

package body WW_Directories_Validity_Tests is

   use AdaForge.DevTools.TestTools.UnitTest;

   overriding
   procedure Initialize (T : in out Test) is
      use AdaForge.DevTools.TestTools;
   begin
      Set_Name (T, "Package AdaForge.Wide_Wide_Directories.Validity");

      UnitTest.Add_Test_Routine
        (T, Test_Is_Valid_Simple_Name'Access, "Is_Valid_Simple_Name");
      UnitTest.Add_Test_Routine
        (T, Test_Is_Valid_Path_Name'Access, "Is_Valid_Path_Name");
      UnitTest.Add_Test_Routine
        (T, Test_Is_Path_Name_Case_Sensitive'Access, "Is_Path_Name_Case_Sensitive");
      UnitTest.Add_Test_Routine
        (T, Test_Windows'Access, "Windows");

   end Initialize;

   overriding
   procedure Set_Up (T : in out Test) is
   begin
      T.State := SETUP_DONE;
   end Set_Up;

   overriding
   procedure Tear_Down (T : in out Test) is
   begin
      T.State := TEARDOWN_DONE;
   end Tear_Down;

   procedure Test_Is_Valid_Simple_Name (T : in out UnitTest.Test_Case'Class) is separate;
   procedure Test_Is_Valid_Path_Name (T : in out UnitTest.Test_Case'Class) is separate;
   procedure Test_Is_Path_Name_Case_Sensitive (T : in out UnitTest.Test_Case'Class) is separate;
   procedure Test_Windows (T : in out UnitTest.Test_Case'Class) is separate;

end WW_Directories_Validity_Tests;
