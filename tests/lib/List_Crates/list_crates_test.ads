--  --------------------------------------------------------------------------------------
--  SPDX-License-Identifier: Apache-2.0
--  SPDX-Creator: William J. Franck (william.franck@sterna.dev)
--  SPDX-FileCopyrightText: Copyright 2025 STERNA MARINE s.a.s. (william.franck@sterna.dev)
--  --------------------------------------------------------------------------------------
--  Initial creation date : 2025-03-01
--  -------------------------------------------------------------

with AdaForge.DevTools.TestTools.UnitTest;
use AdaForge.DevTools.TestTools;

package List_Crates_Test is

   type Test is new UnitTest.Test_Case with null record;

   overriding
   procedure Initialize (T : in out Test);

private
   procedure Test_1;

end List_Crates_Test;