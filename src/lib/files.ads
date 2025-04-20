--  --------------------------------------------------------------------------------------
--  SPDX-License-Identifier: Apache-2.0
--  SPDX-Creator: William J. Franck (william.franck@sterna.dev)
--  SPDX-FileCopyrightText: Copyright 2025 STERNA MARINE s.a.s. (william.franck@sterna.dev)
--  --------------------------------------------------------------------------------------
--  Initial creation date : 2025-03-01
--  -------------------------------------------------------------

with Ada.Containers.Indefinite_Ordered_Sets;
with Ada.Containers.Indefinite_Vectors;
with Ada.Containers.Vectors;
with Ada.Strings.Wide_Wide_Bounded;
with Semantic_Versioning;

use Ada.Containers;
use Ada.Strings;

package Files is

   -- --------------- --
   -- FileSystem_Name --
   -- --------------- --
   Max_FileSystem_Name_Length : constant Positive := 4_096;
   package System_File_Names is new Wide_Wide_Bounded.Generic_Bounded_Length (Max_FileSystem_Name_Length);
   subtype System_File_Name_String is System_File_Names.Bounded_Wide_Wide_String;

   FileSystem_Extension : constant Wide_Wide_String := "toml";

   -- ------------- --
   -- Crate_Version --
   -- ------------- --
   subtype Version is Semantic_Versioning.Version;
   Max_Crate_Version_Length : constant Positive := 127;
   package Crate_Versions is new Wide_Wide_Bounded.Generic_Bounded_Length (Max_Crate_Version_Length);
   subtype Crate_Version_String is Crate_Versions.Bounded_Wide_Wide_String;

   -- ------------ --
   -- Version List --
   -- ------------ --
   function Less_Then (Left, Right : Semantic_Versioning.Version) return Boolean;
   function Equals (Left, Right : Semantic_Versioning.Version) return Boolean;

   package Version_Lists is new Indefinite_Ordered_Sets (
      Element_Type => Semantic_Versioning.Version,
      "<" => Less_Then,
      "=" => Equals);
   subtype Version_List is Version_Lists.Set;

   -- ---------- --
   -- Crate_Name --
   -- ---------- --
   Max_Crate_Name_Length : constant Positive := Max_FileSystem_Name_Length - Max_Crate_Version_Length - FileSystem_Extension'Length;
   package Crate_Names is new Wide_Wide_Bounded.Generic_Bounded_Length (Max_Crate_Name_Length);
   subtype Crate_Name_String is Crate_Names.Bounded_Wide_Wide_String;

   -- --------- --
   -- File_List --
   -- --------- --
   function Equal (Left, Right : System_File_Name_String) return Boolean;

   package File_Lists is new Vectors (
      Index_Type => Natural,
      Element_Type => System_File_Name_String,
      "=" => Equal);
   subtype File_List is File_Lists.Vector;

   -- ---------- --
   -- Crate_List --
   -- ---------- --
   package Lists is new Vectors (
      Index_Type => Natural,
      Element_Type => Crate_Name_String,
      "=" => Crate_Names."=");
   subtype List is Lists.Vector;

end Files;
