--  --------------------------------------------------------------------------------------
--  SPDX-License-Identifier: Apache-2.0
--  SPDX-Creator: William J. Franck (william.franck@sterna.dev)
--  SPDX-FileCopyrightText: Copyright 2025 STERNA MARINE s.a.s. (william.franck@sterna.dev)
--  --------------------------------------------------------------------------------------
--  Initial creation date : 2025-03-01
--  -------------------------------------------------------------

-- pragma Wide_Character_Encoding (UTF8);

with Ada.Characters.Conversions;
with Ada.Characters.Latin_1;
with Ada.Characters.Wide_Wide_Latin_1;
With Ada.Strings.UTF_Encoding;
with Ada.Strings.UTF_Encoding.Strings;
with Ada.Strings.UTF_Encoding.Wide_Wide_Strings;
with Ada.Strings.Wide_Wide_Bounded;
with AdaForge.DevTools.TestTools.UnitTest;
with AdaForge.Wide_Wide_Directories;
with Extended_Testing;
with Files;

use AdaForge.DevTools.TestTools;
use Extended_Testing;

package WW_Directories_Tests is
   pragma Elaborate_Body;  -- due to myTest object initialization (?)
   use Ada.Strings.UTF_Encoding;
use Ada.Characters.Conversions;

   type Test_State is (UNINITIALIZED, INITIALIZED, SETUP_DONE, TEARDOWN_DONE);

   type Test is new UnitTest.Test_Case with record
      State : Test_State := UNINITIALIZED;
      Actual_String_Kind : Extended_Testing.String_Kind := Extra;
      Name_and_File : Extended_Testing.Name_and_File_Data;
      -- Search    : AdaForge.Wide_Wide_Directories.Search_Type;
      Name_Case : AdaForge.Wide_Wide_Directories.Name_Case_Kind;
      File_Kind : AdaForge.Wide_Wide_Directories.File_Kind;
      File_Size : AdaForge.Wide_Wide_Directories.File_Size;
      Filter    : AdaForge.Wide_Wide_Directories.Filter_Type;
   end record;

   overriding
   procedure Initialize (T : in out Test);

   overriding
   procedure Set_Up (T : in out Test);
   procedure Test_Set_Up0; -- helper for Test_Set_Up()

   overriding
   procedure Tear_Down (T : in out Test);

private
   procedure Show_WW_Strings;
   -----------------------------------
   -- Directory and File Operations --
   -----------------------------------
   procedure Test_Copy_File (T : in out UnitTest.Test_Case'Class);
   procedure Test_Create_Directory (T : in out UnitTest.Test_Case'Class);
   procedure Test_Create_Path (T : in out UnitTest.Test_Case'Class);
   procedure Test_Current_Directory (T : in out UnitTest.Test_Case'Class);
   procedure Test_Delete_Directory (T : in out UnitTest.Test_Case'Class);
   procedure Test_Delete_File (T : in out UnitTest.Test_Case'Class);
   procedure Test_Delete_Tree (T : in out UnitTest.Test_Case'Class);
   procedure Test_Rename (T : in out UnitTest.Test_Case'Class);
   procedure Test_Set_Directory (T : in out UnitTest.Test_Case'Class);

   ----------------------------------------
   -- File and directory name operations --
   ----------------------------------------
   procedure Test_Base_Name (T : in out UnitTest.Test_Case'Class);
   procedure Test_Compose (T : in out UnitTest.Test_Case'Class);
   procedure Test_Containing_Directory (T : in out UnitTest.Test_Case'Class);
   procedure Test_Extension (T : in out UnitTest.Test_Case'Class);
   procedure Test_Full_Name (T : in out UnitTest.Test_Case'Class);
   procedure Test_Name_Case_Equivalence (T : in out UnitTest.Test_Case'Class);
   procedure Test_Simple_Name (T : in out UnitTest.Test_Case'Class);

   --------------------------------
   -- File and directory queries --
   --------------------------------
   procedure Test_Exists (T : in out UnitTest.Test_Case'Class);
   procedure Test_Kind (T : in out UnitTest.Test_Case'Class);
   procedure Test_Modification_Time (T : in out UnitTest.Test_Case'Class);
   procedure Test_Size (T : in out UnitTest.Test_Case'Class);

   -------------------------
   -- Directory Searching --
   -------------------------
   procedure Test_End_Search (T : in out UnitTest.Test_Case'Class);
   procedure Test_Get_Next_Entry (T : in out UnitTest.Test_Case'Class);
   procedure Test_More_Entries (T : in out UnitTest.Test_Case'Class);
   procedure Test_Search (T : in out UnitTest.Test_Case'Class);
   procedure Test_Start_Search (T : in out UnitTest.Test_Case'Class);

end WW_Directories_Tests;