--------------------------------------------------------------------------
--                                                                      --
-- copyright (c) 1990,1991,1992 by synopsys, inc.  all rights reserved. --
--                                                                      --
-- this source file may be used and distributed without restriction     --
-- provided that this copyright statement is not removed from the file  --
-- and that any derivative work contains this copyright notice.         --
--                                                                      --
--  package name: std_logic_arith                   --
--                                  --
--  purpose:                            --
--   a set of arithemtic, conversion, and comparison functions  --
--   for signed, unsigned, small_int, integer,          --
--   std_ulogic, std_logic, and std_logic_vector.           --
--                                  --
--------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

package std_logic_arith is

    type unsigned is array (natural range <>) of std_logic;
    type signed is array (natural range <>) of std_logic;
    subtype small_int is integer range 0 to 1;

    function "+"(l: unsigned; r: unsigned) return unsigned;
    function "+"(l: signed; r: signed) return signed;
    function "+"(l: unsigned; r: signed) return signed;
    function "+"(l: signed; r: unsigned) return signed;
    function "+"(l: unsigned; r: integer) return unsigned;
    function "+"(l: integer; r: unsigned) return unsigned;
    function "+"(l: signed; r: integer) return signed;
    function "+"(l: integer; r: signed) return signed;
    function "+"(l: unsigned; r: std_ulogic) return unsigned;
    function "+"(l: std_ulogic; r: unsigned) return unsigned;
    function "+"(l: signed; r: std_ulogic) return signed;
    function "+"(l: std_ulogic; r: signed) return signed;

    function "+"(l: unsigned; r: unsigned) return std_logic_vector;
    function "+"(l: signed; r: signed) return std_logic_vector;
    function "+"(l: unsigned; r: signed) return std_logic_vector;
    function "+"(l: signed; r: unsigned) return std_logic_vector;
    function "+"(l: unsigned; r: integer) return std_logic_vector;
    function "+"(l: integer; r: unsigned) return std_logic_vector;
    function "+"(l: signed; r: integer) return std_logic_vector;
    function "+"(l: integer; r: signed) return std_logic_vector;
    function "+"(l: unsigned; r: std_ulogic) return std_logic_vector;
    function "+"(l: std_ulogic; r: unsigned) return std_logic_vector;
    function "+"(l: signed; r: std_ulogic) return std_logic_vector;
    function "+"(l: std_ulogic; r: signed) return std_logic_vector;

    function "-"(l: unsigned; r: unsigned) return unsigned;
    function "-"(l: signed; r: signed) return signed;
    function "-"(l: unsigned; r: signed) return signed;
    function "-"(l: signed; r: unsigned) return signed;
    function "-"(l: unsigned; r: integer) return unsigned;
    function "-"(l: integer; r: unsigned) return unsigned;
    function "-"(l: signed; r: integer) return signed;
    function "-"(l: integer; r: signed) return signed;
    function "-"(l: unsigned; r: std_ulogic) return unsigned;
    function "-"(l: std_ulogic; r: unsigned) return unsigned;
    function "-"(l: signed; r: std_ulogic) return signed;
    function "-"(l: std_ulogic; r: signed) return signed;

    function "-"(l: unsigned; r: unsigned) return std_logic_vector;
    function "-"(l: signed; r: signed) return std_logic_vector;
    function "-"(l: unsigned; r: signed) return std_logic_vector;
    function "-"(l: signed; r: unsigned) return std_logic_vector;
    function "-"(l: unsigned; r: integer) return std_logic_vector;
    function "-"(l: integer; r: unsigned) return std_logic_vector;
    function "-"(l: signed; r: integer) return std_logic_vector;
    function "-"(l: integer; r: signed) return std_logic_vector;
    function "-"(l: unsigned; r: std_ulogic) return std_logic_vector;
    function "-"(l: std_ulogic; r: unsigned) return std_logic_vector;
    function "-"(l: signed; r: std_ulogic) return std_logic_vector;
    function "-"(l: std_ulogic; r: signed) return std_logic_vector;

    function "+"(l: unsigned) return unsigned;
    function "+"(l: signed) return signed;
    function "-"(l: signed) return signed;
    function "abs"(l: signed) return signed;

    function "+"(l: unsigned) return std_logic_vector;
    function "+"(l: signed) return std_logic_vector;
    function "-"(l: signed) return std_logic_vector;
    function "abs"(l: signed) return std_logic_vector;

    function "*"(l: unsigned; r: unsigned) return unsigned;
    function "*"(l: signed; r: signed) return signed;
    function "*"(l: signed; r: unsigned) return signed;
    function "*"(l: unsigned; r: signed) return signed;

    function "*"(l: unsigned; r: unsigned) return std_logic_vector;
    function "*"(l: signed; r: signed) return std_logic_vector;
    function "*"(l: signed; r: unsigned) return std_logic_vector;
    function "*"(l: unsigned; r: signed) return std_logic_vector;

    function "<"(l: unsigned; r: unsigned) return boolean;
    function "<"(l: signed; r: signed) return boolean;
    function "<"(l: unsigned; r: signed) return boolean;
    function "<"(l: signed; r: unsigned) return boolean;
    function "<"(l: unsigned; r: integer) return boolean;
    function "<"(l: integer; r: unsigned) return boolean;
    function "<"(l: signed; r: integer) return boolean;
    function "<"(l: integer; r: signed) return boolean;

    function "<="(l: unsigned; r: unsigned) return boolean;
    function "<="(l: signed; r: signed) return boolean;
    function "<="(l: unsigned; r: signed) return boolean;
    function "<="(l: signed; r: unsigned) return boolean;
    function "<="(l: unsigned; r: integer) return boolean;
    function "<="(l: integer; r: unsigned) return boolean;
    function "<="(l: signed; r: integer) return boolean;
    function "<="(l: integer; r: signed) return boolean;

    function ">"(l: unsigned; r: unsigned) return boolean;
    function ">"(l: signed; r: signed) return boolean;
    function ">"(l: unsigned; r: signed) return boolean;
    function ">"(l: signed; r: unsigned) return boolean;
    function ">"(l: unsigned; r: integer) return boolean;
    function ">"(l: integer; r: unsigned) return boolean;
    function ">"(l: signed; r: integer) return boolean;
    function ">"(l: integer; r: signed) return boolean;

    function ">="(l: unsigned; r: unsigned) return boolean;
    function ">="(l: signed; r: signed) return boolean;
    function ">="(l: unsigned; r: signed) return boolean;
    function ">="(l: signed; r: unsigned) return boolean;
    function ">="(l: unsigned; r: integer) return boolean;
    function ">="(l: integer; r: unsigned) return boolean;
    function ">="(l: signed; r: integer) return boolean;
    function ">="(l: integer; r: signed) return boolean;

    function "="(l: unsigned; r: unsigned) return boolean;
    function "="(l: signed; r: signed) return boolean;
    function "="(l: unsigned; r: signed) return boolean;
    function "="(l: signed; r: unsigned) return boolean;
    function "="(l: unsigned; r: integer) return boolean;
    function "="(l: integer; r: unsigned) return boolean;
    function "="(l: signed; r: integer) return boolean;
    function "="(l: integer; r: signed) return boolean;

    function "/="(l: unsigned; r: unsigned) return boolean;
    function "/="(l: signed; r: signed) return boolean;
    function "/="(l: unsigned; r: signed) return boolean;
    function "/="(l: signed; r: unsigned) return boolean;
    function "/="(l: unsigned; r: integer) return boolean;
    function "/="(l: integer; r: unsigned) return boolean;
    function "/="(l: signed; r: integer) return boolean;
    function "/="(l: integer; r: signed) return boolean;

    function shl(arg: unsigned; count: unsigned) return unsigned;
    function shl(arg: signed; count: unsigned) return signed;
    function shr(arg: unsigned; count: unsigned) return unsigned;
    function shr(arg: signed; count: unsigned) return signed;

    function conv_integer(arg: integer) return integer;
    function conv_integer(arg: unsigned) return integer;
    function conv_integer(arg: signed) return integer;
    function conv_integer(arg: std_ulogic) return small_int;

    function conv_unsigned(arg: integer; size: integer) return unsigned;
    function conv_unsigned(arg: unsigned; size: integer) return unsigned;
    function conv_unsigned(arg: signed; size: integer) return unsigned;
    function conv_unsigned(arg: std_ulogic; size: integer) return unsigned;

    function conv_signed(arg: integer; size: integer) return signed;
    function conv_signed(arg: unsigned; size: integer) return signed;
    function conv_signed(arg: signed; size: integer) return signed;
    function conv_signed(arg: std_ulogic; size: integer) return signed;

    function conv_std_logic_vector(arg: integer; size: integer) 
                               return std_logic_vector;
    function conv_std_logic_vector(arg: unsigned; size: integer) 
                               return std_logic_vector;
    function conv_std_logic_vector(arg: signed; size: integer) 
                               return std_logic_vector;
    function conv_std_logic_vector(arg: std_ulogic; size: integer) 
                               return std_logic_vector;
    -- zero extend std_logic_vector (arg) to size, 
    -- size < 0 is same as size = 0
    -- returns std_logic_vector(size-1 downto 0)
    function ext(arg: std_logic_vector; size: integer) return std_logic_vector;

    -- sign extend std_logic_vector (arg) to size, 
    -- size < 0 is same as size = 0
    -- return std_logic_vector(size-1 downto 0)
    function sxt(arg: std_logic_vector; size: integer) return std_logic_vector;

end std_logic_arith;

