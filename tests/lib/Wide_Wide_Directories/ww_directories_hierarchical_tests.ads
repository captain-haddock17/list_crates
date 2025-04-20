--  --------------------------------------------------------------------------------------
--  SPDX-License-Identifier: Apache-2.0
--  SPDX-Creator: William J. Franck (william.franck@sterna.dev)
--  SPDX-FileCopyrightText: Copyright 2025 STERNA MARINE s.a.s. (william.franck@sterna.dev)
--  --------------------------------------------------------------------------------------
--  Initial creation date : 2025-03-01
--  -------------------------------------------------------------

with AdaForge.DevTools.TestTools.UnitTest;

use AdaForge.DevTools.TestTools;

package WW_Directories_Hierarchical_Tests is

   type Test_State is (UNINITIALIZED, INITIALIZED, SETUP_DONE, TEARDOWN_DONE);
   type Test is new UnitTest.Test_Case with record
      State : Test_State := UNINITIALIZED;
   end record;

   overriding
   procedure Initialize (T : in out Test);

   overriding
   procedure Set_Up (T : in out Test);

   overriding
   procedure Tear_Down (T : in out Test);

private
   procedure Test_Is_Simple_Name (T : in out UnitTest.Test_Case'Class);
   procedure Test_Is_Root_Directory_Name (T : in out UnitTest.Test_Case'Class);
   procedure Test_Is_Parent_Directory_Name (T : in out UnitTest.Test_Case'Class);
   procedure Test_Is_Current_Directory_Name (T : in out UnitTest.Test_Case'Class);
   procedure Test_Is_Full_Name (T : in out UnitTest.Test_Case'Class);
   procedure Test_Is_Relative_Name (T : in out UnitTest.Test_Case'Class);
   procedure Test_Initial_Directory (T : in out UnitTest.Test_Case'Class);
   procedure Test_Relative_Name (T : in out UnitTest.Test_Case'Class);
   procedure Test_Compose (T : in out UnitTest.Test_Case'Class);

end WW_Directories_Hierarchical_Tests;