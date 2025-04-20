--  --------------------------------------------------------------------------------------
--  SPDX-License-Identifier: Apache-2.0
--  SPDX-Creator: William J. Franck (william.franck@sterna.dev)
--  SPDX-FileCopyrightText: Copyright 2025 STERNA MARINE s.a.s. (william.franck@sterna.dev)
--  --------------------------------------------------------------------------------------
--  Initial creation date : 2025-03-01
--  -------------------------------------------------------------

with Files;
with TOML_Files;
with Say_Hello;
with Ada.Text_IO;

use Ada;

procedure List_Crates is

   Home_of_Index_Dir : constant Wide_Wide_String := "tests/data/index";

   TOML_File_List : Files.File_List;


   type TOML_File_Info is record
      Home_of_Index_Dir : Files.System_File_Name_String;
      File_Name         : Files.System_File_Name_String;
      Crate_Name        : Files.Crate_Name_String;
      Version_List      : Files.Version_List;
   end record;

begin
   Say_Hello.Put_Line ("Hello !!");
   -- create a list of all '*.TOML' files behind 'index' directory.
   TOML_Files.Find (Home_of_Index_Dir, TOML_File_List);

   -- Transform list into structured info.
   -- Read each structured info and get new list with latest version.
   -- For each latest '*.TOML' file, read the file and store selected data.
   -- printout crate summary. 

end List_Crates;
