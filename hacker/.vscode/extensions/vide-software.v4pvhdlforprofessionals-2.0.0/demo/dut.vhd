library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

-- (Todo) The library assignments can be done in a config.v4p file. Open the existing one and review its contents.
library lib_math;
  use lib_math.math.all;

library lib_common;
  -- (Todo) Remove the below use clause and see which errors pop up
  -- (Todo) Start typing 'use lib_common.common.all;' and see how V4P makes suggestions for code completion, esp. if you type a dot
  use lib_common.common.all;
  
library lib_user;
  -- (Note) Notice that the 'user' package does not exist, thus V4P issues an error.
  use lib_user.user.all;

entity dut is
end entity;

architecture rtl of dut is

  -- (Note) Notice that V4P realizes that 'VALUE' is not used in your design.
  constant VALUE: integer := CalculateSomeValue;
  -- (Todo) Place the cursor over the constant at the end of the line to bring up the number conversion toolip
  constant INIT: std_logic_vector(7 downto 0) := x"FA";
  -- (Todo) Place the cursor over the constant's name to see the expression evaluator in the tooltip
  constant EVAL: real := PI + E * E_POW_PI * 2;

  signal val1, val2, val3, res1: std_logic_vector(31 downto 0);
  signal carry1: std_logic;

begin

  -- (Todo) Create a new instace of an existing component using snippets. Just type 'i-' to see a list of available targets. Choose one and see what happens

  process is
    -- (Todo) Hover of the type or variable name and see what V4P presents in the tooltip
    variable c1: ComplexPT;
    variable c2, c3: ComplexT;
    variable col: ColorT := Red;
  begin
    -- (Todo) Place the cursor inside the procedure's argument list and bring up the (overloaded) parameter help with [ctrl]+[shift]+[space]. 
    DoWork(1, 2);
    -- (Todo) Place the cursor inside the name 'Set' and rename it with [F2]. Type a new name and confirm with [sift]+[enter] to get a preview of the planned refactoring
    c1.Set(1, 2);
    c2 := (re => 2, im => 3);
    c3 := c1.Multiply(c2);
    -- (Todo) All the 'Add' function of c1 instead of 'Multiply'. See how V4P supports you with context sensitive suggestions 

    -- (Todo) Use another snippet to insert a case statement for the 'col' variable. Just type 'cs-col'. You'll get a list of suggestions as you go.
  end process;

  -- (Todo) Hover the mouse over the port / actual elements to see how V4P resolves and presents the values
  -- (Todo) Jump to the component declaration with [F12] (place the curson on the name 'Adder')
  adder1_inst: Adder
    generic map (
      WIDTH => 32
    )
    port map (
      op1    => val1,
      op2    => val2,
      op3    => val3,
      result => res1,
      carry  => carry1
    );

  -- (Todo) Quick Fixes: The following instance has missing associations. Use the provided Quick-fixes to insert them, 
  --        optinally with local signal definitions for the target signals.
  adder2_inst: Adder
    generic map (
      WIDTH => 32
    )
    port map (
      op1    => val1,
      result => res1
    );
  
end architecture;
