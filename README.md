# Lini

A lightweight Lua library for parsing and generating INI configuration files.

## Features

- **Load** INI files into Lua tables.
- **Generate** INI files from Lua tables.

## Quick Start

### Installation

Copy `lini.lua` into your project and require it:

```lua
local lini = require("lini")
```

### Usage

**Load an INI file:**

```lua
local sections = lini.load("config.ini")
print(sections.profile.name)
```

**Generate an INI file:**

```lua
local sections = {
    server = {
        host = "127.0.0.1",
        port = "5050"
    }
}

local file = io.open("config.ini", "w")
lini.dump(sections, file)
file:close()
```

## License

MIT © Dylaris
