separate (WW_Directories_Tests)

procedure Test_Delete_Directory (T : in out UnitTest.Test_Case'Class) is

   --     Files.System_File_Names.To_Wide_Wide_String (
   --        Test (T).Dir_Names (Test (T).Actual_String_Kind).Base_Name);

   --  Dir_Name_Str : String :=
   --     Ada.Characters.Conversions.To_String (Dir_Name);


      --  My_Listener : Simple_Listener.Listener_Access :=
      --    new Simple_Listener.Listener;
      --  Child  : UnitTest.Test_Suite_Access;
      --  Parent : UnitTest.Test_Suite;
--    Some_String_Kind : constant String_Kind := Test (T).Actual_String_Kind;

begin
      --  Child := UnitTest.Create_Suite ("Child suite");
      --  UnitTest.Add_Test (Child.all, new Dummy_Tests.Test);

      --  Parent := UnitTest.Create_Suite ("Parent suite");
      --  UnitTest.Add_Test (Parent, Child);

      --  UnitTest.Run (Parent, My_Listener.all);

      --  Assert_Eq_Nat (My_Listener.Passes, Dummy_Passes, "Amount of passes.");
      --  Assert_Eq_Nat (My_Listener.Errors, Dummy_Errors, "Amount of errors.");
      --  Assert_Eq_Nat
      --    (My_Listener.Failures, Dummy_Failures, "Amount of failures.");
      --  Assert_Eq_Nat (My_Listener.Level, 0, "Start_Test /= End_Test");
      --  Assert_Eq_Nat
      --    (My_Listener.Start_Calls, (Dummy_Test_Count + 2), "Start_Test calls");




   for Some_String_Kind in String_Kind'Range loop
      declare
         Base_Dir_Name : constant Wide_Wide_String := 
            Files.System_File_Names.To_Wide_Wide_String (
                  File_Names (Some_String_Kind));
      begin
         --  Test (T).Actual_String_Kind := Some_String_Kind;
         Ada.Wide_Wide_Text_IO.Put_Line ("Loop Delete (" & Some_String_Kind'Wide_Wide_Image & "): " & Base_Dir_Name);

         AdaForge.Wide_Wide_Directories.Delete_Directory (
            Directory => Base_Dir_Name);

         UnitTest.Assert (True, "Failed Delete_Directory (""" 
            & Base_Dir_Name & """)");
      exception
         when others =>
            UnitTest.Fail ("Exception: Failed Delete_Directory !! (""" & Base_Dir_Name & """)");
      end;
   end loop;

      --  Free (My_Listener);

end Test_Delete_Directory;
