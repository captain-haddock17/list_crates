--  --------------------------------------------------------------------------------------
--  SPDX-License-Identifier: Apache-2.0
--  SPDX-Creator: William J. Franck (william.franck@sterna.dev)
--  SPDX-FileCopyrightText: Copyright 2025 STERNA MARINE s.a.s. (william.franck@sterna.dev)
--  --------------------------------------------------------------------------------------
--  Initial creation date : 2025-03-01
--  -------------------------------------------------------------
with WW_Directories_Tests;
with WW_Directories_Validity_Tests;
with WW_Directories_Hierarchical_Tests;

package body Directory_Testsuite is

   function Get_Test_Suite return UnitTest.Test_Suite is
      
      S : UnitTest.Test_Suite := UnitTest.Create_Suite ("WW_Directories Tests");

      Test_Directories : WW_Directories_Tests.Test;
      Test_Validity    : WW_Directories_Validity_Tests.Test;
      Test_Hierachical : WW_Directories_Hierarchical_Tests.Test;

   begin
      UnitTest.Add_Static_Test (S, Test_Directories);
      -- UnitTest.Add_Static_Test (S, Test_Validity);
      -- UnitTest.Add_Static_Test (S, Test_Hierachical);
      return S;
   end Get_Test_Suite;

end Directory_Testsuite;
