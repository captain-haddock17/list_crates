--  --------------------------------------------------------------------------------------
--  SPDX-License-Identifier: Apache-2.0
--  SPDX-Creator: William J. Franck (william.franck@sterna.dev)
--  SPDX-FileCopyrightText: Copyright 2025 STERNA MARINE s.a.s. (william.franck@sterna.dev)
--  --------------------------------------------------------------------------------------
--  Initial creation date : 2025-03-01
--  -------------------------------------------------------------

with Files;

package TOML_Files is

   procedure Find (Start_at_Dir_Name : Wide_Wide_String; TOML_File_list : in out Files.File_List);

end TOML_Files;