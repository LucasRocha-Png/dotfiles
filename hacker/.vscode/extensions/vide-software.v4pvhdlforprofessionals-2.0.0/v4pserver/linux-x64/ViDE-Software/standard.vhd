package standard is
    type bit is ('0', '1');

    type bit_vector is array (natural range <>) of bit;

    type boolean is (false, true);
    
    type file_open_kind is (read_mode, write_mode, append_mode);
    
    type file_open_status is (open_ok, status_error, name_error, mode_error);

    type character is (
        nul, soh, stx, etx, eot, enq, ack, bel, 
        bs,  ht,  lf,  vt,  ff,  cr,  so,  si, 
        dle, dc1, dc2, dc3, dc4, nak, syn, etb, 
        can, em,  sub, esc, fsp, gsp, rsp, usp, 
        
        -- normal characters...

        del,

        -- more normal characters
        
        c128, c129, c130, c131, c132, c133, c134, c135,
        c136, c137, c138, c139, c140, c141, c142, c143,
        c144, c145, c146, c147, c148, c149, c150, c151,
        c152, c153, c154, c155, c156, c157, c158, c159
    );

    type integer is range -2_147_483_647 to 2_147_483_647;
    
    subtype natural is integer range 0 to integer'high;
    
    subtype positive is integer range 1 to integer'high;

    type real is range -1.0E308 to 1.0E308;

    type severity_level is (note, warning, error, failure);

    type string is array (positive range <>) of character;

    type time is range -2_147_483_647 to 2_147_483_647
    units
       fs;
       ps  = 1000 fs;
       ns  = 1000 ps;
       us  = 1000 ns;
       ms  = 1000 us;
       sec = 1000 ms;
       min = 60 sec;
       hr  = 60 min;
    end units;
    
    subtype delay_length is time range 0 fs to time'high;
    
    type boolean_vector is array (natural range <>) of boolean;
    
    type integer_vector is array (natural range <>) of integer;
    
    type real_vector is array (natural range <>) of real;
    
    type time_vector is array (natural range <>) of time;
    
    impure function now return delay_length;
    
    type access_type;
    procedure DEALLOCATE(ptr: inout access_type);
    
    function to_string (value: boolean) return string;
    function to_string (value: bit) return string;
    function to_string (value: character) return string;
    function to_string (value: severity_level) return string;
    function to_string (value: integer) return string;
    function to_string (value: real) return string;
    function to_string (value: time) return string;
    function to_string (value: file_open_kind) return string;
    function to_string (value: file_open_status) return string;
    function to_string (value: real; digits: natural) return string;
    function to_string (value: real; format: string) return string;
    function to_string (value: time; unit: time) return string;
    
    function minimum (l, r: file_open_status) return file_open_status;
    function maximum (l, r: file_open_status) return file_open_status;
    function minimum (l, r: file_open_kind) return file_open_kind;
    function maximum (l, r: file_open_kind) return file_open_kind;
    function minimum (l: time_vector) return time;
    function maximum (l: time_vector) return time;
    function minimum (l, r: time) return time;
    function maximum (l, r: time) return time;
    function minimum (l, r: severity_level) return severity_level;
    function maximum (l, r: severity_level) return severity_level;
    function minimum (l, r: character) return character;
    function maximum (l, r: character) return character;
    function minimum (l, r: integer) return integer;
    function maximum (l, r: integer) return integer;
    function minimum (l: real_vector) return real;
    function maximum (l: real_vector) return real;
    function minimum (l, r: real) return real;
    function maximum (l, r: real) return real;
    function minimum (l, r: integer_vector) return integer_vector;
    function maximum (l, r: integer_vector) return integer_vector;
    function minimum (l: integer_vector) return integer;
    function maximum (l: integer_vector) return integer;
    function minimum (l, r: bit_vector) return bit_vector;
    function maximum (l, r: bit_vector) return bit_vector;
    function minimum (l: bit_vector) return bit;
    function maximum (l: bit_vector) return bit;
    function minimum (l, r: boolean_vector) return boolean_vector;
    function maximum (l, r: boolean_vector) return boolean_vector;
    function minimum (l: boolean_vector) return boolean;
    function maximum (l: boolean_vector) return boolean;
    function minimum (l, r: string) return string;
    function maximum (l, r: string) return string;
    function minimum (l: string) return character;
    function maximum (l: string) return character;
    function minimum (l, r: bit) return bit;
    function maximum (l, r: bit) return bit;
    function rising_edge (signal s: bit) return boolean;
    function falling_edge (signal s: bit) return boolean;
    function minimum (l, r: boolean) return boolean;
    function maximum (l, r: boolean) return boolean;
    function rising_edge (signal s: boolean) return boolean;
    function falling_edge (signal s: boolean) return boolean;
    function to_string (value: bit_vector) return string;
    alias to_bstring is to_string [bit_vector return string];
    alias to_binary_string is to_string [bit_vector return string];
    function to_ostring (value: bit_vector) return string;
    alias to_octal_string is to_ostring [bit_vector return string];
    function to_hstring (value: bit_vector) return string;
    alias to_hex_string is to_hstring [bit_vector return string];
    
    
    attribute active           : boolean; -- S'ACTIVE     is true if signal S is active during current simulation cycle.
    attribute ascending        : boolean; -- T'ASCENDING  is boolean true if range of T defined with to .
                                          -- A'ASCENDING  is boolean true if range of A defined with to .
                                          -- A'ASCENDING(N)  is boolean true if dimension N of array A defined with to .
    attribute base             : string;  -- T'BASE       is the base type of the type T
    attribute delayed          : string;  -- S'DELAYED(t) is the signal value of S at time now - t .
    attribute driving          : boolean; -- S'DRIVING    is false only if the current driver of S is a null transaction.
    attribute driving_value    : string;  -- S'DRIVING_VALUE  is the current driving value of signal S.
    attribute element          : string;  -- S'ELEMENT    returns the element type of an array signal S.
    attribute event            : boolean; -- S'EVENT      is true if signal S has had an event this simulation cycle.
    attribute foreign          : string;  -- A'FOREIGN    string that indicates that the architecture/function/procedure is implemented externally, eg. as C code.
    attribute high             : integer; -- T'HIGH       is the highest value of type T.
                                          -- A'HIGH       is the highest subscript of array A or constrained array type.
                                          -- A'HIGH(N)    is the highest subscript of dimension N of array A.
    attribute image            : string;  -- T'IMAGE(X)   is a string representation of X that is of type T.
    attribute instance_name    : string;  -- E'INSTANCE_NAME  is a string containing the design hierarchy including E.
    attribute last_active      : string;  -- S'LAST_ACTIVE  is the time since signal S was last active.
    attribute last_event       : string;  -- S'LAST_EVENT is the time since the last event on signal S.
    attribute last_value       : string;  -- S'LAST_VALUE is the previous value of signal S.
    attribute left             : integer; -- T'LEFT       is the leftmost value of type T. (Largest if downto)
                                          -- A'LEFT       is the leftmost subscript of array A or constrained array type.
                                          -- A'LEFT(N)    is the leftmost subscript of dimension N of array A.
    attribute leftof           : string;  -- T'LEFTOF(X)  is the value of discrete type T that is left of X.
    attribute length           : integer; -- A'LENGTH     is the integer value of the number of elements in array A.
                                          -- A'LENGTH(N)  is the number of elements of dimension N of array A.
    attribute low              : integer; -- T'LOW        is the lowest value of type T.
                                          -- A'LOW        is the lowest subscript of array A or constrained array type.
                                          -- A'LOW(N)     is the lowest subscript of dimension N of array A.
    attribute path_name        : string;  -- E'PATH_NAME  is a string containing the design hierarchy of E to design root.
    attribute pos              : string;  -- T'POS(X)     is the integer position of X in the discrete type T.
    attribute pred             : string;  -- T'PRED(X)    is the value of discrete type T that is the predecessor of X.
    attribute quiet            : string;  -- S'QUIET      is true if signal S is quiet. (no event this simulation cycle)
                                          -- S'QUIET(t)   is true if signal S has been quiet for t units of time.
    attribute range            : string;  -- A'RANGE      is the range  A'LEFT to A'RIGHT  or  A'LEFT downto A'RIGHT .
                                          -- A'RANGE(N)   is the range of dimension N of A.
    attribute reverse_range    : string;  -- A'REVERSE_RANGE  is the range of A with to and downto reversed.
                                          -- A'REVERSE_RANGE(N)  is the REVERSE_RANGE of dimension N of array A.
    attribute right            : integer; -- T'RIGHT      is the rightmost value of type T. (Smallest if downto)
                                          -- A'RIGHT      is the rightmost subscript of array A or constrained array type.
                                          -- A'RIGHT(N)   is the rightmost subscript of dimension N of array A.
    attribute rightof          : string;  -- T'RIGHTOF(X) is the value of discrete type T that is right of X.
    attribute simple_name      : string;  -- E'SIMPLE_NAME  is a string containing the name of entity E.
    attribute stable           : string;  -- S'STABLE     is true if no event is occurring on signal S.
                                          -- S'STABLE(t)  is true if no even has occurred on signal S for t units of time.
    attribute subtype          : string;  -- S'SUBTYPE    returns the type of the corresponding signal S. Can be used to declare signals of the same type.
    attribute succ             : string;  -- T'SUCC(X)    is the value of discrete type T that is the successor of X.
    attribute transaction      : bit;     -- S'TRANSACTION  is a bit signal, the inverse of previous value each cycle S is active.
    attribute val              : string;  -- T'VAL(X)     is the value of discrete type T at integer position X.
    attribute value            : string;  -- T'VALUE(X)   is a value of type T converted from the string X.
    
    -- Synopsys (for std_logic_misc.vhd)
    attribute CLOSELY_RELATED_TCF: boolean;
    
end package;