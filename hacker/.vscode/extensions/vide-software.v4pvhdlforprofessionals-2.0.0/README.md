# V4P - VHDL for Professionals

This extension provides **full** VHDL (2008) programming language support for Visual Studio Code. It is intended for professional VHDL developers who need sophisticated IDE support for their daily work, but of course every VHDL engineer - whether student or hobbyist - will benefit greatly from the rich feature-set: Renaming, code navigation capabilities, syntax checks, etc. are only some examples of V4P's capabilities.

Take a look at the [CheatSheet](http://www.vide-software.at/cheatsheet_v4p.php) for a complete list of features.

## Contents
[List of Features](#features) \
[Highlights](#highlights) \
[Upcoming Features](#upcoming) \
[Config Files](#config) \
[Commands](#commands) \
[Visual Studio Settings](#vssettings) \
[Limitations](#limitations) \
[Licensing](#license)


## Features
<a name="features" ></a>
* VHDL 2019 Support
  * **Full** Syntax Support, **no limitations**: Conditional Analysis, Views, Enhanced Generics, Incomplete Types, ...
* VHDL 2008 support
  * **Full** Syntax Support, **no limitations**: Generic Packages, Generic Subroutines, External/Hierarchical Names, Enhanced Bit String Literals, Protected Types, Contexts, Vector Aggregates, Conditional Statements, ...
* VHDL (General)
  * Syntax Highlighting
  * Syntax Errors
  * Built-In Standard IEEE libraries  
  * Code Statistics (Lines of code, comments, empty lines)
* Semantic Highlighting (Signals, Variables, Constants, Generics, Types, Ports, ...)
* Type-Time Checks, LINTing
  * Syntax Errors
  * Symbol not found
  * Signal vs. variable assignment operator
  * Symbol already defined
  * End-labels mismatch
  * Unassociated port signals for instances
  * Symbol cannot be target of assignment
  * Symbol is never written
  * Symbol is never read
  * Meta-Comments (pragmas) and configuration settings to disable warnings
* Stutter Mode
* Code Assist
  * Refactoring: Renaming
  * Insert missing instance associations (and create local signals)
  * Create signal declarations for unknown instance associations
* Code Formatter
  * Full Document / Selected Range
  * Highly configurable
  * Meta-Comments (pragmas) for in-file control
* Code Navigation
  * Goto Definition
  * Goto Declaration
  * Goto Type Definition
  * Find all References
  * Find all (signal-) sources
* Hover Info / Quickinfo (colorized &#128521; )
  * Symbol Information, Type Information
  * Expression Evaluator
  * Number Conversion
  * Alias/Type Resolution 
  * Generic Type Resolution
* Code Completion (context sensitive)
  * Snippets (Instances, Case, Processes, Entities/Architectures, ...)
  * Symbols (Variables, Signals, Constants, Types, ...)
  * Hierarchy/Record/Protected Type Name Resolution
* Side-Panel Views
  * Access all commands (HDL Panel)
  * Library View (HDL Panel)
  * Hierarchy View (HDL Panel)
  * Document outline (Explorer Panel)
* Parameter Help for (overloaded) functions/procedures/components/instances
* Smart Indentation when typing
* VHDL specific Outlining / Code Folding
* Multiple VHDL libraries per Design File
* Export project (files/libs) as JSON/Quartus/Questa/Text files
* Per-Folder / Project-Wide Preferences 
  * Indentation
  * Formatting (Keyword-style, Capitalization of Standard-Libs, ...)
  * Code Completion
  * Hover Info



## Highlights

<a href="https://youtu.be/yHVYXE8ewlg">Overview Video</a><br/>
<br/>

<a name="highlights" ></a>

Semantic Highlighting and Error Checking  
<img src="https://bitbucket.org/ferringer/v4p_public/raw/master/highlight-error-semantic.png" width="75%" title="Semantic Highlighting and Error Checking" />

Snippets: Instantiate Entites and Components  
<img src="https://bitbucket.org/ferringer/v4p_public/raw/master/anim-snippet-instance.gif" width="60%" title="Snippet: Instantiate an Entity" />

Insert missing instance associations and create corresponding local signals  
<img src="https://bitbucket.org/ferringer/v4p_public/raw/master/codeassist-instances.gif" width="350px" title="Insert missing associations and local signals" />

Code Completion: Record Field Resultion  
<img src="https://bitbucket.org/ferringer/v4p_public/raw/master/anim-record-resolution.gif" width="60%" title="Code Completion: Record Resolution" />

## Config Files
<a name="config" ></a>

A detailed description of the config files can be found in the [CheatSheet](http://www.vide-software.at/cheatsheet_v4p.php).

 * Create a file named `config.v4p` in one (or more) of your workspace / root folders
 * _Optional:_ You can also create a `MasterConfig`, eg. in your home directory, for global settings
 * Add JSON-based or INI-based (recommended) settings as shown in the example snippets below.
   * *external*: Define external files (eg. vendor libraries) and assign a libary mapping.
   * *libraries*: Define the file(s) as glob pattern and assign a comma-separated list of VHDL library names. **No files** are added to the project! This is just a mapping of filenames to library names!
   * *excludes*: Define the file(s) as glob pattern and enable (true) or disable (false) exclusion from parsing etc.
   * *settings*: Various aspects can be configured, please refer to the [CheatSheet](http://www.vide-software.at/cheatsheet_v4p.php) for details
   * *ignores*: Warnings and errors can be deactivated for files/symbols/scopes inside this section
   * *defines*: Symbol definitions for VHDL2019 conditional analysis
 * In your `Master Config` you should only use patterns starting with `**` (to match anything, no matter where it's located)
 * In your folder-specific configs, you should use relative patterns (like in the `libraries` section below), they are always relative to the current root-folder


```json
{
  "external": {
    "/home/user/vhdl/intel/altera_components.vhd": "altera_mf"
  },
  "defines": {
    "TOOL_VENDOR": "GHDL",
    "MY_SYMBOL": "my value"
  },
  "libraries": {
    "spi_pkg.vhd": "spi_lib, spi_test_lib",
    "libs/math/*.vhd": "math_lib",
    "libs/**/string*.vhd": "string_lib"
  },
  "excludes": {
    "**/out/*.vhd": true
  },
  "settings": {
    "V4p.Settings.Formatting.Indentation.TabWidth": 4,
    "V4p.Settings.Formatting.Indentation.UseTabs": true 
  },
  "ignores": {
    "**/_dbg.vhd @ signal_*_dbg_s": "never-read, never-written",
    "duts/dut*.vhd @ dut_inst.*_dbg_o": "missing-association"
  }
}
```

```ini
[external]
  /home/user/vhdl/intel/altera_components.vhd = "altera_mf"
[defines]
  TOOL_VENDOR = "GHDL"
  MY_SYMBOL = "my value"
[libraries]
  spi_pkg.vhd = "spi_lib, spi_test_lib"
  libs/math/*.vhd =  "math_lib"
  libs/**/string*.vhd = "string_lib"
[excludes]
  **/out/*.vhd = true
  bin/** = true
[settings]
  V4p.Settings.Formatting.Indentation.TabWidth = 4
  V4p.Settings.Formatting.Indentation.UseTabs = true
[ignores]
  **/_dbg.vhd @ signal_*_dbg_s = "never-read, never-written"
  duts/dut*.vhd @ dut_inst.*_dbg_o = missing-association
```

## Commands
<a name="commands" ></a>
The command input prompt can be activated by pressing `ctrl`+`shift`+`P`, or by navigating V4P's activity bar panel. The following table is not complete, please refer to the [CheatSheet](http://www.vide-software.at/cheatsheet_v4p.php).

| Name               |  Description                                                             |
|--------------------|--------------------------------------------------------------------------|
|`v4p.version`       | Displays the current version and build date                              |
|`v4p.license`       | Displays information about all found licenses                            |
|`v4p.license.renew` | Opens the webpage to renew your curront license                          |
|`v4p.license.mac`   | Opens the webpage to change your MAC addresses                           |
|`v4p.logfile`       | Opens the logfile in the editor                                          |
|`v4p.reload`        | Reloads the the config.v4p files                                         |
|`v4p.thirdparty`    | Shows licensing information of all used Third Party Software / Tools     |
|`v4p.settings`      | Shows a detailed map of V4P's settings (MasterConfig, FolderConfig)      |
|`v4p.masterconfig`  | Shows the existing or creates a new masterconfig                         |
|`v4p.localconfig`   | Shows or creates a new local config for the active rootfolder            |
|`v4p.eula`          | Show End User License Agreement                                          |
|`v4p.fileinfo`      | Show detailed information about all files in the workspace               |
|`v4p.stats`         | Shows code statistics (lines of code, comments, empty lines) in a table  |
|`v4p.cheatsheet`    | Opens the cheatsheet in a browser window                                 |
|`v4p.demo`          | Opens the demo project                                                   |

## Required Visual Studio Code Settings
<a name="vssettings" ></a>
There are a couple of useful Visual Studio Code related settings which one should take a look at. Some settings need to be changed in order to enable the VHDL specific functions provided by V4P, other settings are just useful to know as they greatly influence the editor's appearance.

| Description                                | Shortcut                                                      | Recommendation                                               |
|--------------------------------------------|---------------------------------------------------------------|--------------------------------------------------------------|
| Auto Indentation                           | `ctrl`+`,` &nbsp;&nbsp; `editor.formatOnType`                 | `Enable` ( **required** for smart indentation and stutter)   |
| Code Folding (Enable)                      | `ctrl`+`,` &nbsp;&nbsp; `editor.folding`                      | `Enable` ( **required** to use VHDL specific code folding)   |
| Code Folding (Strategy)                    | `ctrl`+`,` &nbsp;&nbsp; `editor.foldingStrategy`              | `Auto` ( **required** to use VHDL specific code folding)     |
| Snippets (Enable)                          | `ctrl`+`,` &nbsp;&nbsp; `editor.suggest.showSnippets`         | `Enable` snippets (**required**)                             |
| Enable Semantic Highlighting               | `ctrl`+`,` &nbsp;&nbsp; `editor.semanticHighlighting.enabled` | `True` or `ConfiguredByTheme`. Theme must support semantic highlighting |
| Code Completion (Auto Suggestions)         | `ctrl`+`,` &nbsp;&nbsp; `editor.wordBasedSuggestions`         | `Disable` (optional)                                         |


## Limitations
<a name="limitations" ></a>
No software is without bugs, and V4P is no exception. Should you find any bugs, or have special feature requests, please just contact me per email: info@vide-software.at. I kindly ask you to give me the chance to improve V4P before you give it a bad rating.

## License
<a name="license" ></a>
V4P comes with a pre-installed, fully-featured 30-day trial license. Once the trial period has expired, V4P continues to work with a _very_ reduced feature set. 
A paid license can be obtained via the official website [http://www.vide-software.at](http://www.vide-software.at) in order to get all the handy features working again &#128522;. 
There are [various options how to install](http://www.vide-software.at/cheatsheet_v4p.php#license) the license. 

Please notice that V4P is not intended to be used without a license. The reduced feature set has no sophisticated functions whatsoever.

