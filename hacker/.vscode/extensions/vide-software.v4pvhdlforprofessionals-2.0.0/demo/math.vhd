library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

package math is

  constant PI: real := 3.141592654;
  constant E: real := 2.718281828;

  -- (Todo) Expression Evaluation: Hover the mouse over the constant to see it's evaluated value
  constant E_POW_PI: real := E ** PI;

  type ComplexT is record
    re: real;
    im: real;
  end record;

  type ComplexPT is protected
    procedure Set(val: ComplexT);
    -- (Todo) use 'Goto Definition' [F12] and 'Goto Declaration' to jump back and forth between head and hody
    impure function Magnitude return real;
    impure function Multiply(other: ComplexT) return ComplexT;
    impure function Add(other: ComplexT) return ComplexT;
    procedure Normalize;
  end protected;

  -- (Todo) Jump to the instances of this component using [F12] (place the curson on the name 'Adder'). A list will be provided if there are multiple targets
  component Adder is
    generic (
      WIDTH: integer := 8
    );
    port (
      op1, op2, op3 : in  std_logic_vector(WIDTH - 1 downto 0);
      result        : out std_logic_vector(WIDTH - 1 downto 0);
      carry         : out std_logic
    );
  end component;

  component Multiplier is
    generic (
      WIDTH: integer := 8
    );
    port (
      op1, op2, op3 : in  std_logic_vector(WIDTH - 1 downto 0);
      result        : out std_logic_vector(WIDTH * 2 - 1 downto 0)
    );
  end component;
  
end package;

package body math is

  type ComplexPT is protected body
    variable value: ComplexT;

    -- (Todo) use 'Goto Definition' [F12] and 'Goto Declaration' to jump back and forth between head and hody
    impure function Magnitude return real is
    begin
      return (value.re * value.re + value.im + value.im) ** 0.5;
    end function;

    impure function Multiply(other: ComplexT) return ComplexT is 
    begin
      -- (Todo) Hove the mouse over the various elements to see how V4P resolves and presents them
      return (re => value.re * other.re - value.im * other.im, im => value.re * other.im + value.im * other.re);
    end function;

    impure function Add(other: ComplexT) return ComplexT is 
      -- (Note) Notice that V4p detects unused variables/signals
      variable unused: integer;
    begin
      return (value.re + other.re, value.im + other.im);
    end function;

    procedure Normalize is 
    begin
      value := (value.re / Magnitude, value.im / Magnitude);
    end procedure;

    procedure Set(val: ComplexT) is
    begin
      value := val;
    end procedure;

  end protected body;
  
end package body;