--  --------------------------------------------------------------------------------------
--  SPDX-License-Identifier: Apache-2.0
--  SPDX-Creator: William J. Franck (william.franck@sterna.dev)
--  SPDX-FileCopyrightText: Copyright 2025 STERNA MARINE s.a.s. (william.franck@sterna.dev)
--  --------------------------------------------------------------------------------------
--  Initial creation date : 2025-03-01
--  -------------------------------------------------------------

with AdaForge.DevTools.TestTools.UnitTest;
--  with AdaForge.DevTools.TestTools.UnitTest.Tap_Runner;
with AdaForge.DevTools.TestTools.UnitTest.Text_Runner;
with Directory_Testsuite;
with List_Crates_Testsuite;

use AdaForge.DevTools.TestTools;

procedure List_Crates_Tests is

   Directory_Suite   : UnitTest.Test_Suite := Directory_Testsuite.Get_Test_Suite;
   List_Crates_Suite : UnitTest.Test_Suite := List_Crates_Testsuite.Get_Test_Suite;

begin

   --  UnitTest.Tap_Runner.Run (Directory_Suite);
   --  UnitTest.Tap_Runner.Run (List_Crates_Suite);

   UnitTest.Text_Runner.Run (Directory_Suite);
   UnitTest.Text_Runner.Run (List_Crates_Suite);

end List_Crates_Tests;
