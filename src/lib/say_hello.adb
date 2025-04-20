--  --------------------------------------------------------------------------------------
--  SPDX-License-Identifier: Apache-2.0
--  SPDX-Creator: William J. Franck (william.franck@sterna.dev)
--  SPDX-FileCopyrightText: Copyright 2025 STERNA MARINE s.a.s. (william.franck@sterna.dev)
--  --------------------------------------------------------------------------------------
--  Initial creation date : 2025-03-01
--  -------------------------------------------------------------

with List_Crates_Config;
with Ada.Wide_Wide_Text_IO;
with Ada.Characters.Conversions;

use Ada;
use Ada.Characters;

package body Say_Hello is
   
   procedure Put_Line (Phrase : Wide_Wide_String) is
   begin
      Wide_Wide_Text_IO.Put_Line (Conversions.To_Wide_Wide_String (
         "[" & List_Crates_Config.Crate_Name & '-'
         & List_Crates_Config.Crate_Version & "] ")
         & Phrase);
   end Put_Line;

end Say_Hello;