# Change Log: VHDL for Professionals #


## V2.0.0 (2025-12-18) ##

#### Features ####
* VHDL2019: Code Formatting, Smart Indentation
* VHDL2019: Conditional Analysis
* VHDL2019: config.v4p (defines, settings)
* VHDL2019: Grammar / Syntax support
* Syntax Check: Option for accepting physical units without whitespace (eg., 10ns; V4p.Settings.ErrorChecker.PhysicalLiteral)

#### Enhancements ####
* Snippets: Entity-to-Component (c-) conversion follows the style defined in V4p.Settings.Formatting.EndIdentifiers

#### Bugs ####
* Code Formatting: "end identifiers" of procedures and function not handled correctly
* Code Formatting: report-severity (without assert) not formatted correctly
* Parsing: "External" files erroneoulsy removed from parse-tree when closing the file-tab
* Symbol Resolution: Packages can directly be referenced (without use clause)
* Symbol Resolution: Targets of association are not marked as "unknown" if a local signal with the same name exists



## V1.9.1 (2025-03-29) ##

#### Features ####
* Commands: Export of design hierarchy to QuestaSim/Quartus/Json/Text format

#### Bugs ####
* Code Formatting: Wrong newline between comment and  process
* Hierarchy View: Entities of component declarations in different libraries not found
* Snippets: ap- and sp- exchanged
* Snippets: Removed 'reset' from "sp-" snippet
* Symbol Resolution: Stack Overflow in rare cases
* Symbol Resolution: Symbols of used generic packages not found
* Symbol Resolution: Type Qualification of record inside a subroutine call is not recognized



## V1.9.0 (2024-12-11) ##

#### Features ####
* Config files allow substitution of environment variables, e.g. ${HOME}
* Config: Add [external] section to define external files (for vendor libs only)
* Error Checker: Symbols read in 'assert' statement shall be ignored (configurable via ErrorChecker.SymbolUnused.IgnoreAssert in config.v4p)
* Instance-Snippets: Added setting for defining a prefix to avoid naming collisions (Snippets.SignalNamePrefix)
* Parameter Help: Include source code comments as hint for parameter selection
* Quickinfo: Include comments in hover info
* Settings: Added HoverInfo.EnableComments setting
* Snippets: Add snippets to insert an entity as component (with c-), optimally with comments
* Snippets: Added synchronous and asynchronous processes as snippets

#### Enhancements ####
* Clarifications in Online-Documentation (cheatsheet)
* Config: Updated syntax highlighting and snippets for newest settings
* Migration to .NET 9.0

#### Bugs ####
* Code Statistics: Misalignment in report fixed
* Config: "Show/Create Local Config" fails if no (valid) project file is open in the editor
* Config: Default setting for "Formatting.EndIdentifiers" was not shown in the created config.v4p
* Error Checker: Significant performance regression fixed
* Formatter: Erroneous output if strings are not separated by a delimiter
* Grammar: Entity/Component instances without port and generic maps falsely flagged as syntax error
* Lexer: String following a keyword without a delimiter is not correctly parsed
* Parsing Filenames: Exception might occur if the string is ill-formatted



## V1.8.1 (2024-08-09) ##

#### Hotfix ####
* Fixed broken VSIX package, a binary was corrupted


## V1.8.0 (2024-08-09) ##

#### Features ####
* Command: Create or show local config.v4p
* Symbol Resolution: Resolve generic types (basic functionality only)

#### Enhancements ####
* "Reload Workspace" command triggers Error-Checker and updates colorization
* Commands: Added file size to "detailed file info" command
* Error Checker: Warning for "alias is defined but never used"
* Excludes: Don't add Verilog/SystemVerilog files to the project
* Excludes: Ignore subfolders as soon as possible to improve performance
* Expression Evaluator: Ignore comments that are part of the expression
* Expression Evaluator: Performance improvement for very long expressions
* Memory Consumption: Optimize Standard Libraries and Vendor Libraries
* Symbol Resolution: Improve ambiguity resolution 

#### Bugs ####
* Code Formatter: Comments before "when" clauses inside case-statements are incorrectly indented
* Code Formatter: Regression, improved performance
* Lexer: Based Literals now support underscores in base and exponent
* Lexer: Whitespaces before and after the attribute tick (') are allowed
* Outline Viewer: Possible problem with wrong selectionRange fixed
* SymbolResultion: Nullpointer-Exception for non-existing component instances
* VSCode Error: configuration.semanticTokenType.description



## V1.7.3 (2024-04-15) ##

#### Features ####
* Code Formatter: Add metacomment / pragmas to exclude code sections from being formatted

#### Enhancements ####
* Expression Evaluator: Process based literals (16#123A#) and bitstrings (sb"1001")
* Semantic Highlighting: Allow In/Out ports to have different colors  
  (use edit.tokenColorCustomizations, see https://code.visualstudio.com/docs/getstarted/themes)  
  (use <tt>variable.parameter.in.v4p.vhdl</tt>, <tt>variable.parameter.out.v4p.vhdl</tt> and <tt>variable.parameter.inout.v4p.vhdl</tt>)

#### Bugs ####
* Code Actions: For unknown instances, an invalid code action is shown
* Code Actions: Possible NullReferenceException
* Code Formatter: Conditional variable assignments inside processes formatted incorrectly
* Code Formatter: Missing spaces in combination with braces
* Code Formatter: Parameter Lists of subroutines sometimes have wrong indentation
* Code Formatter: Problems with braces in more complex multiline expressions
* Code Formatter: Problems with complex record/array initializers
* Code Formatter: Wrong Indentation for assignments before an entity instance
* Document Outline sometimes fails with error
* Licensing: Leading spaces can render a license invalid



## V1.7.2 (13-02-2024) ##

#### Bugs ####
* Code Formatter: Aggregate association in subprograms/instances not formatted correctly
* Error Checker: "Symbol never assigned" not correctly working with "out" records
* Error Checker: "Symbol never assigned" not correctly working with 'inout' and certain data types
* Symbol Resolution: Alias of records: Aggregate assignment does not work
* Symbol Resolution: Problems with contexts defined in different libraries



## V1.7.1 (2024-01-05) ##

#### Features ####
* Code Action: Insert signal definitions (with types) for yet undefined port-associations of instances
* Code Formatter: Formatting of a selected range
* Migrate to .NET 8 for improved performance

#### Enhancements ####
* Code Action: Add symbol/hierarchy to action-name in case of multiple entries with same name

#### Bugs ####
* Code Action: Location for inserting signal definitions sometimes not correct
* Code Formatter: Consecutive comments as part of some statements are incorrectly formatted
* Code Formatter: Sometimes empty lines are not preserved
* Error Checker: Selected names as part of association not always resolved correctly
* V4pServer keeps running and consuming CPU if vscode is closed forcefully



## V1.7.0 (2023-11-01) ##

#### Features ####
* Code Formatter with configurable settings
* Ignore Warnings: Support to specify ignores in config.v4p (in addition to Meta-Comments)

#### Enhancements ####
* Allow one symlink to be part of a path, don't follow subsequent symlinks to avoid recursion
* Code Completion: Significantly better support for external path names (absolute, relative and library)
* External Names: Absolute path-names now support multiple top-level-entities as defined in config.v4p

#### Bugs ####
* Code Completion: Reduced commit character to tab and newline, as other characters might lead to unintended completions
* Error Checker: Architecture and Entity can have the same name
* Error Checker: Non-existing signal on the left side of Instantiations are not marked as "Symbol not found"
* Error Checker: SymbolNeverRead not working if symbols with same name exist
* Error Checker: Symbols on the left side of an association are not marked as 'read'
* External names could not be resolved if inside if/case generate statements
* External path names: Symbols inside package bodies not correctly resolved
* Licensing: CentOS 9 does not support SHA1 (Authentication fails), added log-entry for workaround



## V1.6.6 (2023-06-15) ##

#### Enhancements ####
* Design Hierarchy: Added button to toggle onClick action (jump to instance vs. jump to entity/architecture)
* File Info / Code Statistics: Improved readability by removing information, handling Vendor Libs
* Licensing: Add HOME environment variable to the locations where to look for licenses
* Meta Comments: Adding 'ignore' modifier for one-time only usage
* Vendor Libraries: Improve performance

#### Bugs ####
* Error Check: Missing-Association produces false positive if target is indexed (slice)
* Error Checker / Symbol Resolution: Variable inside a process/function does not hide a signal with same name
* Error Checker: For unknown instances, record-fields of target signals shall not be marked as "not defined"
* Symbol Resultion: Aggregate assignments to record types not working for subtypes
* Syntax Check: Missing semicolon after assignment does not always show a syntax error



## V1.6.5 (2023-04-27) ##
* Fixed problem with V4P Startup on Windows-Machines


## V1.6.4 (2023-04-26) ##

#### Enhancements ####
* Alias declarations of record fields: Bugfixes and Enhancements
* Meta-Comments: Also allow 'symbol not found error' to be disabled
* Meta-Comments: Enhancing capabilities for entity/component instances
* Switch to .NET 7

#### Bugs ####
* Error Check: Missing-Association produces false positive if record fields are assigned separately
* Error Checks: Missing Associations not working when target of association is type-cast
* Glob-Patterns: Single asterisk does not match empty string
* MAC-OS: V4pServer is not marked as 'executable'
* MasterConfig: Automatically created MasterConfig was invalid
* Signature Help: Fixed possible NullReferenceException



## V1.6.3 (2023-03-15) ##
* Fixed Broken Package. Something went wrong when uploading.



## V1.6.2 (2023-03-15) ##

#### Bugs ####
* File Handling: Opening and closing an IEEE file removed it from the workspace
* Symbol Resolution: Record fields of nested records are sometimes wrongly resolved



## V1.6.1 (2023-03-10) ##

#### Features ####
* Add ieee_context as defined in VHDL 2008 standard
* Error Check: Support meta comment for disabling certain checks

#### Enhancements ####
* Snippets: Use "work" as library whenever possible
* Symbol Resolution: Generic recursion detection
* Syntax Errors: Improve hints to what is expected

#### Bugs ####
* Error Check: Split up constant declaration/definition issues error "already defined"
* Parsing: Opening separate files in addition to a workspace does not (always) parse the file
* Symbol Resolution: Wrong name resultion when a symbol is named 'std'



## V1.6.0 (2023-01-02) ##

#### Features ####
* Design Hierarchy: Allow sorting by entity, instance-name, position
* Error Check: Add setting to consider specific attributes as "read access"
* Error Check: Regularly re-check all opened files 
* Parameter Help: Add setting so that parameter help for instances can be disabled

#### Enhancements ####
* Code Completion: Removed colon from list of commit-chars - it's quite annoying wrt. labels
* Commands: "Show Settings" command shall only show entries that differ from default
* Commands: Remove "Refresh Token Colors" - it is of no use
* Config: Allow config.v4p to be located in the .vscode subfolder of a root-folder if it exists
* Error Check: Add setting to ignore loop variables from "read/write access" checks
* Major improvements wrt. memory consumption (~50%)
* Performance improvement for SymbolResolution and ErrorChecker (~50%)
* Rearrange commands in activity bar so that unimportant commands are located at the bottom
* Settings: Adding another level to the V4p.Settings.ErrorChecker hierarchy for the different semantic checks
* Updating/Renewing MACs: Showing warnings if there is no appropriate license

#### Bugs ####
* Error Check: "Value defined but never read" incorrect for parameters of overloaded subroutines
* Error Check: "Value defined but never read" not correctly working when referenced in multidimensional arrays
* Error Check: Exclude record fields of generic types from checking for read/write access
* Error Check: Symbols of kind 'file' shall be excluded from 'have not been assigned' checks
* Hierarchy View: Clicking on top-level elements doesn't jump to the respective location
* License file not found if path enclosed in double-quotes
* LiveShare Issue: Ignore "vsls:/" URIs as rootfolder
* Opening single files (outside of workspace, or when no workspace is active) does not work
* Symbol Resolution: On the right side of associations, the instance's use clauses are erroneously imported
* Symbol Resolution: Resolving symbols from generic package instances does not always work
* Updating/Renewing MACs: Transmitting serial number to webserver did not work



## V1.5.1 (2022-11-07) ##

#### Enhancements ####
* License Info: Explicitly add Environment Variable Path and Home Folder Path

#### Bugs ####
* CodeAction: Inserting local signals not working if there are subroutine bodies in the declaration area
* Disabled progress indicator during parsing because it's not working as intended
* Parsing: Sometimes not all files are parsed upon startup (regression)



## V1.5.0 (2022-10-28) ##

#### Features ####
* Activity Bar: Add Hierarchy View
* Code Navigation: Jump to entity from component ("goto type definition")
* CodeAction: Auto-Create missing signals for instance-associations
* CodeAction: Auto-Insert missing associations for instances
* Command: Demo project
* Command: Find source of signal
* Commands: Add 'Licensing' Section with commands for 'Change MAC' and "Prolong' and 'Buy'

#### Enhancements ####
* Code Statistics: Improved output table format
* Colorizing output of v4p.settings, v4p.eula, v4p.thirdparty
* Config: JSON config.v4p now allows upper-case True/False literals to be more flexible
* Error Check: Instance-Associations: Output port are now checked by default
* Find all Referfences: Entities and their respective components are treated as references
* Improved colorization of ini-based .v4p files
* Improved logging upon startup
* Parsing: Show parsing progress in GUI



## V1.4.1 (2022-10-03) ##

#### Bugs ####
* Config: Library assignments are not handled separately for each root folder
* Error Check: "Cannot be target of assignment": Forcing a signal is also possible for inputs
* Error Check: Datatype in external name is erroneously identified as assignment-target
* Library Handling: Bugfix wrt. to case sensitivity (and Extended Identifiers)
* Rollback to .NET 6.0 because of problems with WSL and NetworkInterfaces
* Symbol Resolution: Possible Stackoverflow wrt. unknown instances



## V1.4.0 (2022-09-16) ##

#### Features ####
* Command: Code Statistics as part of V4P specific Activity Bar entry
* Command: Open cheatsheet in webbrowser
* Create Welcome screen with infos whenever a new version is installed
* Smart Indentation: Make "port" and "generic" declarations configurable wrt. indentation
* Switch to .NET 7

#### Enhancements ####
* Added snippet-support for V4p.Settings.ErrorChecker in config.v4p

#### Bugs ####
* Config: Absolute Windows-based GLOB patterns are not always detected correctly
* Error Check: Selected names are sometimes identified as instances
* Excludes: Bugfix in GLOB pattern wrt. to '**' wildcard
* Excludes: Bugfixes in GLOB patterns wrt. relative paths
* NullReferenceException wrt. SignatureHelp
* Smart Indentation: Instances are not correctly identified if written in a single line
* Smart Indentation: No indent for port/generic declaration signals in certain cases
* SymbolNotRead: Not working with aggregate-based assignments
* SymbolNotRead: Problems in regular assignments if there are paranthesis
* SymbolNotRead: Special case wrt. output ports of instances
* SymbolNotRead: Symbols used in wait statements are not always flagged correctly
* SymbolNotWritten: Assigning out-port to output of component is not marked as "assigned"



## V1.3.4 (2022-08-02) ##
(The VSIX container was incomplete)



## V1.3.3 (2022-08-02) ##

#### Bugs ####
* SymbolNotRead: Bug in combination with "when" statements




## V1.3.2 (2022-08-01) ##

#### Bugs ####
* SymbolNotRead: Bug wrt. to assigning to output signals
* SymbolNotRead: Bugfix for named associations
* SymbolNotRead: Targets of named associats are erroneously marked as "read"



## V1.3.1 (2022-08-01) ##
(Accidentially deployed wrong binary)



## V1.3.0 (2022-07-28) ##

#### Features ####
* Activity Bar: Add Library View
* Error Check: Check for symbols that are never assigned/written
* Error Check: Mark symbols that are not read
* Make warnings for unsused port signals configurable
* Outline: Provide per-file outline (symbols, hierarchy)

#### Enhancements ####
* Goto Definition: When cursor is placed directly after an identifier, it is not correctly recognized

#### Bugs ####
* Config: Excluding files is not working properly
* LogSeverity Setting in config.v4p is not working correctly - most verbose setting shall win
* Parameter Help: Code is sometimes interpreted as function call, when it's actually a procedure call
* Renaming files causes Error to pop up
* Symbol Resolution: Fixed possible Infinite Recursion
* Symbol Resolution: Relative external pathnames take long to resolve



## V1.2.5 (2022-05-25) ##

#### Bugs ####
* Quickinfo: Help for attributes is ill-formatted



## V1.2.4 (2022-05-25) ##

#### Features ####
* Quickinfo: Show help/description for predefined attributes

#### Enhancements ####
* Commands: 'Reload Workspace' better handles files that are excluded after reload
* Commands: 'Show Settings' shows the path of the corresponding root folder
* Error Check: 'Cannot be target of assignment' shall support functions that return access types

#### Bugs ####
* Error Check: 'Cannot be target of assignment' not properly working for fully qualified names
* Semantic Highlighting: Fully qualified names are sometimes highlighted incorrectly
* Smart Indentation: Not working after subtype
* Smart Indentation: Not working well for physical type declarations
* Symbol Resolution: Possible StackOverflow Exception if signal & type have the same name
* Syntax Error: Checking bitstring pattern improved



## V1.2.3 (2022-05-10) ##

#### Features ####
* Command: FileInfo for showing detailed information about each file in the workspace, including statistics

#### Bugs ####
* Error Check: "Invalid assignment operator" not working with aliases
* Error Check: "no valid target for assignment" issues error with aliases



## V1.2.2 (2022-05-03) ##

#### Features ####
* Error Check: Check "Invalid assignment:  cannot be target of assignment"

#### Enhancements ####
* Code Completion: Type suggestions have been improved for parameter lists

#### Bugs ####
* Trial License: Bugfix wrt. trial expiration date



## V1.2.1 (2022-04-04) ##

#### Enhancements ####
* Command: Settings-Command shows changed settings and is better formatted
* Commands: Show dialog for Refresh Tokens and Reload Project

#### Bugs ####
* Instances / port assignments inside "else generate" are not resolved correctly
* Licensing: Preinstalled 30-day Trial License not working
* Smart Indentation: After attribute specifications not always working correctly



## V1.2.0 (2022-02-19) ##

#### Features ####
* Activity Bar: Add Command View
* Add V4P Specific View to Activity Bar
* Command: Add "Open MasterConfig" / "Create MasterConfig" command
* Command: Add 'EULA' command for showing license agreement
* Command: Print Settings
* Config: Support a global "master" config file
* Error Check: Check if end-label/end-id matches original id
* Error Check: Check if instance has association for all interface signals
* Quickinfo: Show library names if hovering over 'work'

#### Enhancements ####
* Command: Licensing shall contain user-friendly information about WHY the license is not valid (or authentic)
* Config: Glob-patterns (eg of MasterConfig) can now match any path independenlty of any root-folders
* License File: Make similar to Master-Config (possible locations)
* Smart Indentation: Support for Configurations
* Various Performance Improvements

#### Bugs ####
* Code Completion: No suggestions inside concatenations
* Code Completion: Snippets not showing inside 'generate' blocks
* Commands: Remove the Dump-Command
* Config: Glob patterns did not work correctly with Windows paths
* Expression Evaluator: Default values, if not evaluable as number, are sometime displayed wrongly
* Opening single files doesn't always work correctly
* Quickinfo: Character symbols and attributes are sometimes displayed wrongly
* Smart Indentation: Handle case when 'then' is on separate line
* Smart Indentation: Not working correctly for record types



## V1.1.2 (2021-11-10) ##

#### Features ####
* Add IEEE vital timing and primitive libraries

#### Enhancements ####
* Migrate to .NET6
* Quickinfo: Ports/Generics of instances/components/entites are displayed one-per-line
* Stutter Mode: Disable in comments and strings

#### Bugs ####
* Code Completion: Not working correctly inside instances
* Code Completion: Under certain circumstances, no suggestions are presented
* Error Check: 'Already Defined' also occurs for attribute specifications
* Inconsistent Source: VSC and V4P can have inconsistent view of source code
* Stackoverflow Exception when parsing certain code construct



## V1.1.1 (2021-10-17) ##

#### Bugs ####
* Improvements/Bugfixes of Stutter-Mode



## V1.1.0 (2021-10-16) ##

#### Features ####
* Commands: Add 'thirdparty' command and show 3rd party licenses
* Editor: Implement Stutter-Mode (like in emacs)
* Error Check: Add support for 'Signal vs. Variable assignment operator' Error
* Error Check: Add support for 'Symbol already defined' Error
* Quickinfo: Expression Evaluator
* Snippets: Add support for ulogic (sul- sulv- sulvr-)

#### Enhancements ####
* Code Completion: Improve NewName context check
* Commands: Improve licensing information, provide detailed info of locations etc
* Error Check: Avoid errors if underlying type is a generic type
* Inconsistent Source [Workaround]: Resynchronize upon saving a file
* Parameter Help: Reduced filtering for procedure/function calls to show more results
* Snippets: Don't align the "=>" delimiter in the "when" clauses
* Symbol Resolution: Remember last scope of "old" scopetree to provide more accurate intellisense

#### Bugs ####
* Integer literals larger than 32bits result in a syntax error
* Multidimensional array definitions not parsed correctly under certain conditions
* Parameter Help: Filter out duplicate entries in package body
* Semantic Highlighting: Ending label of blocks are not colorized correctly
* Smart Indentation: Selecting (keywords) from completion list does not trigger smart indent
* Smart Indentation: Wrong indent after certain blocks if they specify their end-label
* Snippets: "Variable" snippet inserts signal
* String literals erroneously interpreted backslash as escape character
* Symbol Resolution: Generic Package's generic map is not resolved when inside an entity or generic declaration
* Symbol Resolution: Subroutines after a label are not recognized
* Symbol Resolution: Undefined symbols that have the same name as a field of a called subroutine argument are identified as valid
* Workspace: Renaming a file keeps the old file as part of the scopetree



## V1.0.2 (2021-08-15) ##
* MacOS Support



## V1.0.1 (2021-07-27) ##
* Updated README.md



## V1.0.0 (2021-07-27) ##



#### Features ####
* Quickinfo: Number Conversion

#### Enhancements ####
* Command: Removed CheckAll and CheckOpen commands
* Quickinfo: Use VHDL code blocks to provide colored hover info

#### Bugs ####
* Lexer: Race condition fixed that could lead to inconsistency of source-code
* Smart Indentation: Bugfix regarding "assert" statements 
* TextMate Grammar: Bugfix related to based literals and bitstrings
* TextMate Grammar: Bugfix related to qualified chars



## V0.8.0 Beta (2021-05-27) ##

#### Features ####
* Command: v4p.logfile for opening the logfile in the editor
* Parameter Help: Provide parameter help for (overloaded) subroutines and instances

#### Enhancements ####
* Parsing: Major Performance Improvements
* Quickinfo: Added support for context
* Quickinfo: Added support for packages and generic packages
* Semantic Highlighting: Better resolution in case of ambiguities

#### Bugs ####
* Exception when package instance declaration is incomplete
* Find References / Renaming: Search index could be outdated
* Parameter Help: Generic maps with types/subroutines handled incorrectly
* Parameter Help: Instantiated subroutine parameters not resolved correctly
* Smart Indentation: Bugfix wrt. indentation for case/when statements and use/context clauses
* Smart Indentation: Component was handled incorrectly
* Smart Indentation: Irregular structures in combination with conditional assignments not working
* Symbol Resolution: Labels in Generate-Statements where not recognized correctly



## V0.7.0 Beta (2021-03-26) ##

#### Features ####
* Command: v4p.checkAll to perform error-check of all files
* Command: v4p.checkOpen to perform error-check of all files that are visible/open in the editor
* Command: v4p.refresh to refresh semantic token colors
* Command: v4p.reload to Reload config-files / settings / project
* Error Check: Add support for 'Symbol not defined' Error
* Error Check: Auto-check file if opened in editor
* Semantic Highlighting
* Symbol Resolution: Support Configurations

#### Enhancements ####
* Snippets: Minor improvements, added new snippets
* Symbol Resolution: Better support in case of syntax errors
* Symbol Resolution: Gracefully handle generic types (packages, functions)
* Type Resolution: Better support for signals with type declaration "sym'subtype" 

#### Bugs ####
* Code Completion: Bugfix wrt. selected names and loop/if statements
* Config: Excludes did not work properly
* Config: Json-based files were converted to lower-case which invalidates GLOB patterns
* Goto Definition: Jumping to a package which has no body resulted in Exception
* Goto Definition: Jumping to an undefined entity/component threw exception
* Lexer: Bugfix when updating empty files
* Lexer: Multiline comments were not updated correctly
* Lexer: Range <> symbol was classified wrongly
* Package instances consume useclauses
* Parsing: Nested loops not always recognized correctly
* Smart Indentation: Instantiated packages/subroutines were not handled correctly
* Symbol Resolution: Explicitly declared library 'work' resulted in erroneous symbol resolution
* Symbol Resolution: Generic parameters in generic function instances were not recognized
* Symbol Resolution: Library definitions are also inherited (similar to use-clauses)
* Symbol Resolution: Locally instantiated packages were not found in fully qualified names
* Symbol Resolution: Non-lowercase 'work' in selected names not recognized correctly
* Symbol Resolution: Record association assignment for positional parameters in instances not working
* Symbol Resolution: Record association assignment for positional parameters in subroutines not working
* Symbol Resolution: Record association-list assignment for variables not working correctly
* TextDocument: Inconsistencies when removing text from EOF possible
* TextMate Grammar: Bugfix related to (double-quoted) string recognition
* TextMate Grammar: Bugfix related to qualified chars
* Type Resolution: Fully qualified basetypes were not resolved correctly



## V0.6.1 Beta (2021-02-01) ##

#### Features ####
* Prolongued the free beta license until 2021-06-30
* Code Completion: Keyword style + StdLib Style
* Config: Each WorkspaceFolder can contain a config.v4p with librariy mapping, exludes and folder-specific settings.
* Config: Make config.v4p with settings and libraries combined
* Config: Show message when library.v4p is used, or config.v4p is of old format
* Provide Syntax Coloring and Snippet support for ini-based config.v4p

#### Enhancements ####
* Load V4P upon loading a workspace that contains v4p, vhd or vho files
* Logging: Don't log DEBUG message in RELEASE mode
* Logging: Max Log-Severity can be configured config.v4p
* Minor improvements and enhancements
* Snippets: Format keywords and standard-lib data types according to preferences
* Use Clause handling must be improved

#### Bugs ####
* Code Completion: Typing a dot inside a comment opened the code-completion
* Symbol Resolution: 'use work.pkg' not correctly supported



## V0.6.0 Beta (2020-12-24) ##

#### Features ####
* Code Completion: Context sensitive suggestions for Snippets, Keywords, Symbols, Records
* Code Completion: Snippets (esp. Instances and Case/When)

#### Enhancements ####
* Logging: Make sure logfiles don't get too big
* Smart Indentation: Case-when blocks greatly improved
* Type Resolution: Resolve sig'subtype, follow up aliases etc.



## V0.5.4 Beta (2020-11-10) ##

#### Bugfixes ####
* Grammar: Conditional variable_assignents with 'else' did not work
* Quickinfo: Erroneous Markdown output wrt. underscores and generics
* Type Resolution regarding records with aliases and subtypes did not work correctly



## V0.5.3 Beta (2020-11-04) ##

#### Bugfixes ####
* Goto / Find References: Invalid cursor position requires zero results
* Grammar: subtypes with attributes in dicrete range resulted in syntax error
* Quickinfo: Subroutines without parameters/generics are not displayed
* Workspace: Files outside of Workspace Folders are not parsed



## V0.5.2 Beta (2020-10-20) ##

#### General ####
* Initial release (beta version)

#### Features ####
* VHDL 2008 support
  * Syntax Highlighting
  * Syntax Errors
* Find all References
* Refactoring (Rename)
* Code Navigation
  * Goto Definition
  * Goto Declaration
  * Goto Type Definition
* Hover Info / Quickinfo
  * Symbol Information, Type Information
  * Recursive Type Resolution 
  * Recursive Alias Resolution
* Smart Indentation when typing
* VHDL specific Outlining / Code Folding
* Multiple VHDL libraries per Design File
