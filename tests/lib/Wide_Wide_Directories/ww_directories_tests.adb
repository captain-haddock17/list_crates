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

with Ada.Exceptions;
with Ada.Characters.Conversions;
with Ada.Directories;
with Ada.Strings.UTF_Encoding;
with Ada.Strings.UTF_Encoding.Strings;
with Ada.Strings.UTF_Encoding.Wide_Wide_Strings;
with Ada.Text_IO;
with Ada.Wide_Wide_Text_IO;
with GNAT.Encode_String;
with System.WCh_Con;

use Ada.Characters.Conversions;
with WW_Directories_Tests;

package body WW_Directories_Tests is

   use AdaForge.DevTools.TestTools.UnitTest;

   package Encode_WW_String is new GNAT.Encode_String (System.WCh_Con.WCEM_UTF8);

   Some_Kind_of_Test_Name : Extended_Testing.String_Kind := Extended_Testing.String_Kind'First;

   -- Encode_WW_String.Encode_Wide_Wide_String
   overriding
   procedure Initialize (T : in out Test) is
      use AdaForge.DevTools.TestTools;
   begin
      Ada.Text_IO.Put_Line ("Initializing...");
      T.State := INITIALIZED;
      Ada.Text_IO.Put_Line ("Initialized");

      -- Test (T).Actual_String_Kind := Kind_Of_Test;

      Set_Name (T, "Package AdaForge.Wide_Wide_Directories with " & T.Actual_String_Kind'Wide_Wide_Image);
      -----------------------------------
      --  UnitTest.Add_Test_Routine (T, Test_Set_Up0'Access, "Test_Case: Set_Up");

      --  UnitTest.Add_Test_Routine
      --    (T, Show_WW_Strings'Access, "Show_WW_Strings");

      -----------------------------------
      -- Directory and File Operations --
      -----------------------------------
      -- Create_Directory_Test_Name : UnitTest_Astrings.Bounded_Wide_Wide_String := Create_Directory;
      UnitTest.Add_Test_Routine (
         T, 
         Test_Create_Directory'Access,
         "Create_Directory");
      -- "Create_Directory with " & Kind_Of_Test'Wide_Wide_Image & " WW_String");

      UnitTest.Add_Test_Routine
        (T, Test_Current_Directory'Access, "Current_Directory");
      UnitTest.Add_Test_Routine
        (T, Test_Set_Directory'Access, "Set_Directory");

      UnitTest.Add_Test_Routine
        (T, Test_Rename'Access, "Rename");
      UnitTest.Add_Test_Routine
        (T, Test_Delete_Directory'Access, "Delete_Directory");

      UnitTest.Add_Test_Routine
        (T, Test_Create_Path'Access, "Create_Path");
      UnitTest.Add_Test_Routine
        (T, Test_Delete_Tree'Access, "Delete_Tree");
      UnitTest.Add_Test_Routine
        (T, Test_Delete_File'Access, "Delete_File");
      UnitTest.Add_Test_Routine
        (T, Test_Copy_File'Access, "Copy_File");

      ----------------------------------------
      -- File and directory name operations --
      ----------------------------------------
      UnitTest.Add_Test_Routine
        (T, Test_Full_Name'Access, "Full_Name");
      UnitTest.Add_Test_Routine
        (T, Test_Simple_Name'Access, "Simple_Name");
      UnitTest.Add_Test_Routine
        (T, Test_Containing_Directory'Access, "Containing_Directory");
      UnitTest.Add_Test_Routine
        (T, Test_Extension'Access, "Extension");
      UnitTest.Add_Test_Routine
        (T, Test_Extension'Access, "Extension");
      UnitTest.Add_Test_Routine
        (T, Test_Base_Name'Access, "Base_Name");
      UnitTest.Add_Test_Routine
        (T, Test_Compose'Access, "Compose");
      UnitTest.Add_Test_Routine
        (T, Test_Name_Case_Equivalence'Access, "Name_Case_Equivalence");

      --------------------------------
      -- File and directory queries --
      --------------------------------
      UnitTest.Add_Test_Routine
        (T, Test_Exists'Access, "Exists");
      UnitTest.Add_Test_Routine
        (T, Test_Kind'Access, "Kind");
      UnitTest.Add_Test_Routine
        (T, Test_Size'Access, "Size");
      UnitTest.Add_Test_Routine
        (T, Test_Modification_Time'Access, "Modification_Time");

      -------------------------
      -- Directory Searching --
      -------------------------
      UnitTest.Add_Test_Routine
        (T, Test_Start_Search'Access, "Start_Search");
      UnitTest.Add_Test_Routine
        (T, Test_End_Search'Access, "End_Search");
      UnitTest.Add_Test_Routine
        (T, Test_More_Entries'Access, "More_Entries");
      UnitTest.Add_Test_Routine
        (T, Test_Get_Next_Entry'Access, "Get_Next_Entry");
      UnitTest.Add_Test_Routine
        (T, Test_Search'Access, "Search");

   end Initialize;

   procedure Test_Set_Up0 is
   begin
      null;
      Some_Kind_of_Test_Name := String_Kind'First;
      -- Set_Up (myTest);
   end Test_Set_Up0;

   overriding
   procedure Set_Up (T : in out Test) is
   begin
      null;
      Ada.Wide_Wide_Text_IO.Put_Line ("Set_Up '" & Get_Name (T) & "'");
      Some_Kind_of_Test_Name := Extended_Testing.String_Kind'First;
      T.Actual_String_Kind := Extended_Testing.String_Kind'First;
--       Ada.Text_IO.Put_Line ("Set_Up " & Some_Kind_of_Test_Name'Image);
      Ada.Text_IO.Put_Line ("Set_Up " & T.Actual_String_Kind'Image);

      --  T.Name_and_File.Base_Name := File_Names (Some_Kind_of_Test_Name);
      --  Ada.Wide_Wide_Text_IO.Put_Line ("  File name : '" & Files.System_File_Names.To_Wide_Wide_String (T.Name_and_File.Base_Name) & "'");
      T.State := SETUP_DONE;
   end Set_Up;

   overriding
   procedure Tear_Down (T : in out Test) is
   begin
      null;
      --  Ada.Text_IO.Put_Line ("Tear_Down");
      --  if Some_Kind_of_Test_Name = String_Kind'Last then
      --     Some_Kind_of_Test_Name := String_Kind'First;
      --  else 
      --     Some_Kind_of_Test_Name := String_Kind'Succ (Some_Kind_of_Test_Name);
      --  end if; 
      T.State := TEARDOWN_DONE;
   end Tear_Down;

   procedure Show_WW_Strings is separate;
   -----------------------------------
   -- Directory and File Operations --
   -----------------------------------
   procedure Test_Copy_File (T : in out UnitTest.Test_Case'Class) is separate;
   procedure Test_Create_Directory (T : in out UnitTest.Test_Case'Class) is separate;
   procedure Test_Create_Path (T : in out UnitTest.Test_Case'Class) is separate;
   procedure Test_Current_Directory (T : in out UnitTest.Test_Case'Class) is separate;
   procedure Test_Delete_Directory (T : in out UnitTest.Test_Case'Class) is separate;
   procedure Test_Delete_File (T : in out UnitTest.Test_Case'Class) is separate;
   procedure Test_Delete_Tree (T : in out UnitTest.Test_Case'Class) is separate;
   procedure Test_Rename (T : in out UnitTest.Test_Case'Class) is separate;
   procedure Test_Set_Directory (T : in out UnitTest.Test_Case'Class) is separate;

   ----------------------------------------
   -- File and directory name operations --
   ----------------------------------------
   procedure Test_Base_Name (T : in out UnitTest.Test_Case'Class) is separate;
   procedure Test_Compose (T : in out UnitTest.Test_Case'Class) is separate;
   procedure Test_Containing_Directory (T : in out UnitTest.Test_Case'Class) is separate;
   procedure Test_Extension (T : in out UnitTest.Test_Case'Class) is separate;
   procedure Test_Full_Name (T : in out UnitTest.Test_Case'Class) is separate;
   procedure Test_Name_Case_Equivalence (T : in out UnitTest.Test_Case'Class) is separate;
   procedure Test_Simple_Name (T : in out UnitTest.Test_Case'Class) is separate;

   --------------------------------
   -- File and directory queries --
   --------------------------------
   procedure Test_Exists (T : in out UnitTest.Test_Case'Class) is separate;
   procedure Test_Kind (T : in out UnitTest.Test_Case'Class) is separate;
   procedure Test_Modification_Time (T : in out UnitTest.Test_Case'Class) is separate;
   procedure Test_Size (T : in out UnitTest.Test_Case'Class) is separate;

   -------------------------
   -- Directory Searching --
   -------------------------
   procedure Test_End_Search (T : in out UnitTest.Test_Case'Class) is separate;
   procedure Test_Get_Next_Entry (T : in out UnitTest.Test_Case'Class) is separate;
   procedure Test_More_Entries (T : in out UnitTest.Test_Case'Class) is separate;
   procedure Test_Search (T : in out UnitTest.Test_Case'Class) is separate;
   procedure Test_Start_Search (T : in out UnitTest.Test_Case'Class) is separate;

end WW_Directories_Tests;
