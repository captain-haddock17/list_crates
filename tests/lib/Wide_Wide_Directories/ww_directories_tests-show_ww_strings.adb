separate (WW_Directories_Tests)

procedure Show_WW_Strings is
begin
   Ada.Text_IO.New_Line;
   --  Ada.Wide_Wide_Text_IO.Put_Line ("L0 WW_String:   " & Latin0_WW_String);
   --  Ada.Text_IO.Put_Line           ("L0 String:      " & Latin0_String);
   --  Ada.Text_IO.Put_Line           ("L0 UTF8_String: " & Latin0_UTF8_String); -- gives BAD output result
   Ada.Text_IO.New_Line;
   Ada.Wide_Wide_Text_IO.Put_Line ("L1 WW_String:   " & Latin1_WW_String);
   Ada.Text_IO.Put_Line           ("L1 String:      " & Latin1_String);
   --  Ada.Text_IO.Put_Line           ("L1 UTF8_String: " & Latin1_UTF8_String); -- gives BAD output result
   --  Ada.Text_IO.New_Line;
   --  Ada.Wide_Wide_Text_IO.Put_Line ("L2 WW_String#   " & Latin2_WW_String);
   --  Ada.Text_IO.Put_Line           ("L2 String#      " & Latin2_String);
   Ada.Text_IO.Put_Line           ("L2 UTF8_String# " & Latin2_UTF8_String); -- gives BAD output result
   --  Ada.Text_IO.New_Line;
   --  Ada.Wide_Wide_Text_IO.Put_Line ("L3 WW_String#   " & Latin3_WW_String);
   --  Ada.Text_IO.Put_Line           ("L3 String#      " & Latin3_String);
   Ada.Text_IO.Put_Line           ("L3 UTF8_String# " & Latin3_UTF8_String); -- gives BAD output result
   Ada.Text_IO.New_Line;
   Ada.Wide_Wide_Text_IO.Put_Line ("   WW_String:   " & Extra_WW_String);
   Ada.Text_IO.Put_Line           ("   String:      " & Extra_String);
   --  Ada.Text_IO.Put_Line           ("   UTF8_String: " & Extra_UTF8_String); -- gives BAD output result
   Ada.Text_IO.New_Line;
   Ada.Wide_Wide_Text_IO.Put_Line ("   WW_String:   " & Emoji_WW_String);
   Ada.Text_IO.Put_Line           ("   String:      " & Emoji_String);
   --  Ada.Text_IO.Put_Line           ("   UTF8_String: " & Emoji_UTF8_String); -- gives BAD output result
   Ada.Text_IO.New_Line;   

   UnitTest.skip ("Show_WW_Strings");
end Show_WW_Strings;
