--  --------------------------------------------------------------------------------------
--  SPDX-License-Identifier: Apache-2.0
--  SPDX-Creator: William J. Franck (william.franck@sterna.dev)
--  SPDX-FileCopyrightText: Copyright 2025 STERNA MARINE s.a.s. (william.franck@sterna.dev)
--  --------------------------------------------------------------------------------------
--  Initial creation date : 2025-03-01
--  -------------------------------------------------------------

with Ada.Wide_Wide_Text_IO;

package body List_Crates_Test is

   overriding
   procedure Initialize (T : in out Test) is
   begin
      Set_Name (T, "List Crates Tests");
      UnitTest.Add_Test_Routine (T, Test_1'Access, "Test_List_Crates should output a prompt on Standard console.");
   end Initialize;

   procedure Test_1 is
   begin
      Ada.Wide_Wide_Text_IO.Put_Line ("Hello from Test_List_Crates.");
      UnitTest.Assert (True, "Failed to prompt 'Test_List_Crates' message on Standard console output 😳");
   end Test_1;

end List_Crates_Test;
