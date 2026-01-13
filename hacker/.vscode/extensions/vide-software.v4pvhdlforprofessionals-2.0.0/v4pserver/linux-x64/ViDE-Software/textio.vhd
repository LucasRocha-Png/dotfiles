---------------------------------------------------------------------------
-- package textio as defined in chapter 14 of the ieee standard vhdl
--   language reference manual (ieee std. 1076-1987), as modified
--   by the issues screening and analysis committee (isac), a subcommittee
--   of the vhdl analysis and standardization group (vasg) on 
--   10 november, 1988.  see "the sense of the vasg", october, 1989.
---------------------------------------------------------------------------
-- version information: %w% %g%
---------------------------------------------------------------------------

package textio is
    type LINE is access STRING;
    type TEXT is file of STRING;
    type SIDE is (RIGHT, LEFT);
    subtype WIDTH is natural;
    
    procedure DEALLOCATE(p: inout LINE);
    procedure FILE_OPEN (file f: TEXT; external_name: in STRING; open_kind: in file_open_kind := read_mode);
    procedure FILE_OPEN (status: out file_open_status; file f: TEXT; external_name: in STRING; open_kind: in file_open_kind := read_mode);
    procedure FILE_CLOSE (file f: TEXT);
    procedure READ (file f: TEXT; value: out STRING);
    procedure WRITE (file f: TEXT; value: in STRING);
    procedure FLUSH (file f: TEXT);
    function ENDFILE (file f: TEXT) return BOOLEAN;
    function MINIMUM (l, r: SIDE) return SIDE;
    function MAXIMUM (l, r: SIDE) return SIDE;
    function TO_STRING (value: SIDE) return STRING;
    
    function JUSTIFY (value: STRING; justified: SIDE := right; field: WIDTH := 0 ) return STRING;

    -- changed for vhdl92 syntax:
    file INPUT : TEXT open read_mode is "std_input";
    file OUTPUT : TEXT open write_mode is "std_output";

    -- changed for vhdl92 syntax (and now a built-in):
    procedure READLINE(file f: TEXT; l: out LINE);

    procedure READ(l:inout LINE; value: out BIT; good : out BOOLEAN);
    procedure READ(l:inout LINE; value: out BIT);

    procedure READ(l:inout LINE; value: out BIT_VECTOR; good : out BOOLEAN);
    procedure READ(l:inout LINE; value: out BIT_VECTOR);

    procedure READ(l:inout LINE; value: out BOOLEAN; good : out BOOLEAN);
    procedure READ(l:inout LINE; value: out BOOLEAN);

    procedure READ(l:inout LINE; value: out CHARACTER; good : out BOOLEAN);
    procedure READ(l:inout LINE; value: out CHARACTER);

    procedure READ(l:inout LINE; value: out INTEGER; good : out BOOLEAN);
    procedure READ(l:inout LINE; value: out INTEGER);

    procedure READ(l:inout LINE; value: out REAL; good : out BOOLEAN);
    procedure READ(l:inout LINE; value: out REAL);

    procedure READ(l:inout LINE; value: out STRING; good : out BOOLEAN);
    procedure READ(l:inout LINE; value: out STRING);

    procedure READ(l:inout LINE; value: out TIME; good : out BOOLEAN);
    procedure READ(l:inout LINE; value: out TIME);
    
    procedure SREAD (l: inout LINE; value: out STRING; strlen: out natural);
    alias STRING_READ is SREAD [LINE, STRING, natural];
    alias BREAD is READ [LINE, BIT_VECTOR, BOOLEAN];
    alias BREAD is READ [LINE, BIT_VECTOR];
    alias BINARY_READ is READ [LINE, BIT_VECTOR, BOOLEAN];
    alias BINARY_READ is READ [LINE, BIT_VECTOR];
    procedure OREAD (l: inout LINE; value: out BIT_VECTOR; good: out BOOLEAN);
    procedure OREAD (l: inout LINE; value: out BIT_VECTOR);
    alias OCTAL_READ is OREAD [LINE, BIT_VECTOR, BOOLEAN]; 
    alias OCTAL_READ is OREAD [LINE, BIT_VECTOR];
    procedure HREAD (l: inout LINE; value: out BIT_VECTOR; good: out BOOLEAN);
    procedure HREAD (l: inout LINE; value: out BIT_VECTOR); 
    alias HEX_READ is HREAD [LINE, BIT_VECTOR, BOOLEAN]; 
    alias HEX_READ is HREAD [LINE, BIT_VECTOR];

    -- changed for vhdl92 syntax (and now a built-in):
    procedure WRITELINE(file f : TEXT; l : inout LINE);
    procedure TEE(file f: TEXT; L: inout LINE);

    procedure WRITE(l : inout LINE; value : in BIT;
          justified: in SIDE := right;
          field: in WIDTH := 0);

    procedure WRITE(l : inout LINE; value : in BIT_VECTOR;
          justified: in SIDE := right;
          field: in WIDTH := 0);

    procedure WRITE(l : inout LINE; value : in BOOLEAN;
          justified: in SIDE := right;
          field: in WIDTH := 0);

    procedure WRITE(l : inout LINE; value : in CHARACTER;
          justified: in SIDE := right;
          field: in WIDTH := 0);

    procedure WRITE(l : inout LINE; value : in INTEGER;
          justified: in SIDE := right;
          field: in WIDTH := 0);

    procedure WRITE(l : inout LINE; value : in REAL;
          justified: in SIDE := right;
          field: in WIDTH := 0;
          digits: in natural := 0);

    procedure WRITE(l : inout LINE; value : in STRING;
          justified: in SIDE := right;
          field: in WIDTH := 0);

    procedure WRITE(l : inout LINE; value : in TIME;
          justified: in SIDE := right;
          field: in WIDTH := 0;
          unit: in TIME := ns);
        
    alias SWRITE is WRITE [LINE, STRING, SIDE, WIDTH];
    alias STRING_WRITE is WRITE [LINE, STRING, SIDE, WIDTH];
    alias BWRITE is WRITE [LINE, BIT_VECTOR, SIDE, WIDTH];
    alias BINARY_WRITE is WRITE [LINE, BIT_VECTOR, SIDE, WIDTH];
    procedure OWRITE (l: inout LINE; value: in BIT_VECTOR; justified: in SIDE := right; field: in WIDTH := 0);
    alias OCTAL_WRITE is OWRITE [LINE, BIT_VECTOR, SIDE, WIDTH];
    procedure HWRITE (l: inout LINE; value: in BIT_VECTOR; justified: in SIDE := right; field: in WIDTH := 0);
    alias HEX_WRITE is HWRITE [LINE, BIT_VECTOR, SIDE, WIDTH];

    -- is implicit built-in:
    -- function endfile(file f : TEXT) return BOOLEAN;

    -- function endline(variable l : in LINE) return BOOLEAN;
    --
    -- function endline as declared cannot be legal vhdl, and
    --   the entire function was deleted from the definition
    --   by the issues screening and analysis committee (isac),
    --   a subcommittee of the vhdl analysis and standardization
    --   group (vasg) on 10 november, 1988.  see "the sense of
    --   the vasg", october, 1989, vhdl issue number 0032.
end;



