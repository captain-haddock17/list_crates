--  --------------------------------------------------------------------------------------
--  SPDX-License-Identifier: Apache-2.0
--  SPDX-Creator: William J. Franck (william.franck@sterna.dev)
--  SPDX-FileCopyrightText: Copyright 2025 STERNA MARINE s.a.s. (william.franck@sterna.dev)
--  --------------------------------------------------------------------------------------
--  Initial creation date : 2025-03-01
--  -------------------------------------------------------------

with List_Crates_Test;

package body List_Crates_Testsuite is

   function Get_Test_Suite return UnitTest.Test_Suite is

      S : UnitTest.Test_Suite := UnitTest.Create_Suite ("List Crates tests");

      Some_Test : List_Crates_Test.Test;

   begin
      UnitTest.Add_Static_Test (S, Some_Test);
      return S;
   end Get_Test_Suite;

end List_Crates_Testsuite;
