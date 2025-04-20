with Ada.Characters.Conversions;
with Ada.Characters.Latin_1;
with Ada.Characters.Wide_Wide_Latin_1;
With Ada.Strings.UTF_Encoding;
with Ada.Strings.UTF_Encoding.Strings;
with Ada.Strings.UTF_Encoding.Wide_Wide_Strings;
with Ada.Strings.Wide_Wide_Bounded;
with Files;

use Ada.Strings.UTF_Encoding;

package Extended_Testing is

   type String_Kind is (AlphaNum, ASCII, Latin1, Extra, Emoji);

   AlphaNum_WW_String : constant Wide_Wide_String := "Test_1_0-9A-Za-z";
   ASCII_WW_String    : constant Wide_Wide_String := "Test_2_! -}";

   --GOOD output on UTF8 console : "Test_L1_ÀÏ-Ð-ß_à-ï_ð-þÿ,Ð..ß_à..ï_ð..þÿ"
   Latin_String : constant String :=
            Ada.Characters.Latin_1.UC_Icelandic_Eth
            & ".." & Ada.Characters.Latin_1.LC_German_Sharp_S
            & '_'  & Ada.Characters.Latin_1.LC_A_Grave
            & ".." & Ada.Characters.Latin_1.LC_I_Diaeresis
            & '_'  & Ada.Characters.Latin_1.LC_Icelandic_Eth
            & ".." & Ada.Characters.Latin_1.LC_Icelandic_Thorn
            & Ada.Characters.Latin_1.LC_Y_Diaeresis;

   Latin_WW_String : constant Wide_Wide_String :=
            Ada.Characters.Wide_Wide_Latin_1.UC_Icelandic_Eth
            & ".." & Ada.Characters.Wide_Wide_Latin_1.LC_German_Sharp_S
            & '_'  & Ada.Characters.Wide_Wide_Latin_1.LC_A_Grave
            & ".." & Ada.Characters.Wide_Wide_Latin_1.LC_I_Diaeresis
            & '_'  & Ada.Characters.Wide_Wide_Latin_1.LC_Icelandic_Eth
            & ".." & Ada.Characters.Wide_Wide_Latin_1.LC_Icelandic_Thorn
            & Ada.Characters.Wide_Wide_Latin_1.LC_Y_Diaeresis;

   Latin1_WW_String   : constant Wide_Wide_String :=
            "Test_31_ÀÏ-Ð-ß_à-ï_ð-þÿ,"
            & Ada.Characters.Conversions.To_Wide_Wide_String (
               Ada.Strings.UTF_Encoding.Strings.Encode (
                  Latin_String, UTF_8));
   Latin1_String      : constant String :=
            Ada.Characters.Conversions.To_String (Latin1_WW_String);
   Latin2_UTF8_String : constant Ada.Strings.UTF_Encoding.UTF_8_String :=
            "Test_32_ÀÏ-Ð-ß_à-ï_ð-þÿ,"
            & Ada.Strings.UTF_Encoding.Wide_Wide_Strings.Encode (
               Ada.Characters.Conversions.To_Wide_Wide_String (Latin_String),
               UTF_8);
   Latin3_UTF8_String : constant Ada.Strings.UTF_Encoding.UTF_8_String := 
            "Test_33_ÀÏ-Ð-ß_à-ï_ð-þÿ," 
            & Ada.Strings.UTF_Encoding.Wide_Wide_Strings.Encode (Latin_WW_String, UTF_8);
   -- BAD Latin2_String      : constant String := Ada.Characters.Conversions.To_String (Latin2_WW_String);

   -- GOOD output on UTF8 console : "Test_4_©™☢0¼½¾1♥︎"
   Extra_WW_String    : constant Wide_Wide_String := "Test_4_©™☢0¼½¾1♥︎";
   Extra_String       : constant String := Ada.Characters.Conversions.To_String (Extra_WW_String);

   -- GOOD output on UTF8 console :"Test_5_😎"
   Emoji_WW_String    : constant Wide_Wide_String := "Test_5_😎";
   Emoji_String       : constant String := Ada.Characters.Conversions.To_String (Emoji_WW_String);

   --  Latin3_String      : constant String := Ada.Characters.Conversions.To_String (Latin3_WW_String);

   --  Latin0_UTF8_String : constant Ada.Strings.UTF_Encoding.UTF_8_String := Ada.Strings.UTF_Encoding.Strings.Encode (Latin0_String, UTF_8);
   --  Latin1_UTF8_String : constant Ada.Strings.UTF_Encoding.UTF_8_String := Ada.Strings.UTF_Encoding.Strings.Encode (Ada.Characters.Conversions.To_String (Latin1_WW_String), UTF_8);
   --  Extra_UTF8_String  : constant Ada.Strings.UTF_Encoding.UTF_8_String := Ada.Strings.UTF_Encoding.Wide_Wide_Strings.Encode (Extra_WW_String, UTF_8);
   --  Emoji_UTF8_String  : constant Ada.Strings.UTF_Encoding.UTF_8_String := Ada.Strings.UTF_Encoding.Wide_Wide_Strings.Encode (Emoji_WW_String, UTF_8);
   --  Latin0_String   : constant String := Ada.Strings.UTF_Encoding.Strings.Encode ("Test_L0_ÀÏ-Ð-ß_à-ï_ð-þÿ,",UTF_8) 
   --              & Ada.Characters.Latin_1.UC_Icelandic_Eth
   --              & ".." & Ada.Characters.Latin_1.LC_German_Sharp_S
   --              & '_'  & Ada.Characters.Latin_1.LC_A_Grave
   --              & ".." & Ada.Characters.Latin_1.LC_I_Diaeresis
   --              & '_'  & Ada.Characters.Latin_1.LC_Icelandic_Eth
   --              & ".." & Ada.Characters.Latin_1.LC_Icelandic_Thorn
   --              & Ada.Characters.Latin_1.LC_Y_Diaeresis;
   --  Latin0_WW_String   : constant Wide_Wide_String := Ada.Characters.Conversions.To_Wide_Wide_String (Latin0_String);


   FileSystem_Names_Max_Length : constant Positive := 4_096;
   package FileSystem_Names is new Ada.Strings.Wide_Wide_Bounded.Generic_Bounded_Length (FileSystem_Names_Max_Length);
   subtype FileSystem_Name_String is FileSystem_Names.Bounded_Wide_Wide_String;

   -- type String_Kind is (AlphaNum, ASCII, Latin1, Extra, Emoji);

   type File_Name_List is array (String_Kind) of Files.System_File_Name_String;
   File_Names :  constant File_Name_List := (
         AlphaNum => Files.System_File_Names.To_Bounded_Wide_Wide_String (AlphaNum_WW_String),
         Extended_Testing.ASCII    => Files.System_File_Names.To_Bounded_Wide_Wide_String (ASCII_WW_String),
         Latin1   => Files.System_File_Names.To_Bounded_Wide_Wide_String (Latin1_WW_String),
         Extra    => Files.System_File_Names.To_Bounded_Wide_Wide_String (Extra_WW_String),
         Emoji    => Files.System_File_Names.To_Bounded_Wide_Wide_String (Emoji_WW_String));

   type Name_and_File_Data is record
      Base_Name : Files.System_File_Name_String;
      File_Name : FileSystem_Name_String;
   end record;


end Extended_Testing;