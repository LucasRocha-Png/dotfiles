--------------------------------------------------------------------------
--                                                                      --
-- copyright (c) 1990, 1991, 1992 by synopsys, inc.                     --
--                                             all rights reserved.     --
--                                                                      --
-- this source file may be used and distributed without restriction     --
-- provided that this copyright statement is not removed from the file  --
-- and that any derivative work contains this copyright notice.         --
--                                                                      --
--  package name: std_logic_signed                                  --
--                                                  --
--                                  --
--      date:        09/11/91 kn                                        --
--                   10/08/92 amt change std_ulogic to signed std_logic --
--           10/28/92 amt added signed functions, -, abs    --
--                                  --
--  purpose:                            --
--   a set of signed arithemtic, conversion,                        --
--           and comparision functions for std_logic_vector.            --
--                                  --
--  note:   comparision of same length std_logic_vector is defined  --
--      in the lrm.  the interpretation is for unsigned vectors --
--      this package will "overload" that definition.       --
--                                  --
--------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

package std_logic_signed is

    function "+"(l: std_logic_vector; r: std_logic_vector) return std_logic_vector;
    function "+"(l: std_logic_vector; r: integer) return std_logic_vector;
    function "+"(l: integer; r: std_logic_vector) return std_logic_vector;
    function "+"(l: std_logic_vector; r: std_logic) return std_logic_vector;
    function "+"(l: std_logic; r: std_logic_vector) return std_logic_vector;

    function "-"(l: std_logic_vector; r: std_logic_vector) return std_logic_vector;
    function "-"(l: std_logic_vector; r: integer) return std_logic_vector;
    function "-"(l: integer; r: std_logic_vector) return std_logic_vector;
    function "-"(l: std_logic_vector; r: std_logic) return std_logic_vector;
    function "-"(l: std_logic; r: std_logic_vector) return std_logic_vector;

    function "+"(l: std_logic_vector) return std_logic_vector;
    function "-"(l: std_logic_vector) return std_logic_vector;
    function "abs"(l: std_logic_vector) return std_logic_vector;


    function "*"(l: std_logic_vector; r: std_logic_vector) return std_logic_vector;

    function "<"(l: std_logic_vector; r: std_logic_vector) return boolean;
    function "<"(l: std_logic_vector; r: integer) return boolean;
    function "<"(l: integer; r: std_logic_vector) return boolean;

    function "<="(l: std_logic_vector; r: std_logic_vector) return boolean;
    function "<="(l: std_logic_vector; r: integer) return boolean;
    function "<="(l: integer; r: std_logic_vector) return boolean;

    function ">"(l: std_logic_vector; r: std_logic_vector) return boolean;
    function ">"(l: std_logic_vector; r: integer) return boolean;
    function ">"(l: integer; r: std_logic_vector) return boolean;

    function ">="(l: std_logic_vector; r: std_logic_vector) return boolean;
    function ">="(l: std_logic_vector; r: integer) return boolean;
    function ">="(l: integer; r: std_logic_vector) return boolean;

    function "="(l: std_logic_vector; r: std_logic_vector) return boolean;
    function "="(l: std_logic_vector; r: integer) return boolean;
    function "="(l: integer; r: std_logic_vector) return boolean;

    function "/="(l: std_logic_vector; r: std_logic_vector) return boolean;
    function "/="(l: std_logic_vector; r: integer) return boolean;
    function "/="(l: integer; r: std_logic_vector) return boolean;
    function shl(arg:std_logic_vector;count: std_logic_vector) return std_logic_vector; 
    function shr(arg:std_logic_vector;count: std_logic_vector) return std_logic_vector; 

    function conv_integer(arg: std_logic_vector) return integer;

-- remove this since it is already in std_logic_arith
--    function conv_std_logic_vector(arg: integer; size: integer) return std_logic_vector;

end std_logic_signed;



