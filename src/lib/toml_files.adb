--  --------------------------------------------------------------------------------------
--  SPDX-License-Identifier: Apache-2.0
--  SPDX-Creator: William J. Franck (william.franck@sterna.dev)
--  SPDX-FileCopyrightText: Copyright 2025 STERNA MARINE s.a.s. (william.franck@sterna.dev)
--  --------------------------------------------------------------------------------------
--  Initial creation date : 2025-03-01
--  -------------------------------------------------------------

with AdaForge.Wide_Wide_Directories;
with Ada.Wide_Wide_Characters.Handling;
-- with Ada.Directories;

use AdaForge.Wide_Wide_Directories;
use Ada.Wide_Wide_Characters.Handling;
-- use Ada.Directories;

package body TOML_Files is

   procedure Find (Start_at_Dir_Name : Wide_Wide_String; TOML_File_list : in out Files.File_List) is

      procedure Get_Filename (Directory_Entry : in Directory_Entry_Type) is
         use Files;
      begin
         case Kind (Directory_Entry) is
            when Directory => 
               Find (Full_Name (Directory_Entry), TOML_File_list);

            when Ordinary_File =>
               declare
                  Some_File : Wide_Wide_String := Full_Name (Directory_Entry);
               begin
                  if To_Upper (Extension (Some_File)) 
                  = To_Upper (FileSystem_Extension) then
                     TOML_File_list.Append (Files.System_File_Names.To_Bounded_Wide_Wide_String (Some_File));
                  end if;
               end;

            when others =>
               null;
         end case;
      end Get_Filename;

   begin
      Search (
         Directory => Start_at_Dir_Name,
         Pattern => "",
         Process => Get_Filename'Access);
   end Find;

end TOML_Files;