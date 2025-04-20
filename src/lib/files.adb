--  --------------------------------------------------------------------------------------
--  SPDX-License-Identifier: Apache-2.0
--  SPDX-Creator: William J. Franck (william.franck@sterna.dev)
--  SPDX-FileCopyrightText: Copyright 2025 STERNA MARINE s.a.s. (william.franck@sterna.dev)
--  --------------------------------------------------------------------------------------
--  Initial creation date : 2025-03-01
--  -------------------------------------------------------------

with Ada.Strings.UTF_Encoding;
with Ada.Strings.UTF_Encoding.Wide_Wide_Strings;

use Ada.Strings;

package body Files is

   function Equal (Left, Right : System_File_Name_String) return Boolean is
   begin
      return UTF_Encoding.Wide_Wide_Strings.Encode (System_File_Names.To_Wide_Wide_String (Left), UTF_Encoding.UTF_8)
            = UTF_Encoding.Wide_Wide_Strings.Encode (System_File_Names.To_Wide_Wide_String (Right), UTF_Encoding.UTF_8);
   end Equal;

   function Less_Then (Left, Right : Semantic_Versioning.Version) return Boolean is
   begin
      return True;
   end Less_Then;

   function Equals (Left, Right : Semantic_Versioning.Version) return Boolean is
   begin
      return True;
   end Equals;

end Files;
