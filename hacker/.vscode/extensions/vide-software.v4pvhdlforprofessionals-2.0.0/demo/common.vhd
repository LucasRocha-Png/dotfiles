library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

package common is

  type ColorT is (Red, Green, Yellow, Blue, Magenta, Cyan, Orange, Brown);

  function CalculateSomeValue return integer;
  procedure DoWork;
  procedure DoWork(op1, op2: integer);
  procedure DoWork(signal clk: in std_logic; op1, op2: integer := 0);
  
end package;

package body common is

  function CalculateSomeValue return integer is
  begin
    return 0;
  end function;
  
end package body;