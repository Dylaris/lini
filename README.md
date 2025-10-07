# lini

## Brief

Read/Write ini file in lua.

## Usage

- read

```lua
    local lini = require("lini")
    local sections = lini.load("config.ini")
    local profile = sections.profile
    print("[profile] name: " .. profile.name)
```

- write

```lua
    local lini = require("lini")
    local sections = {}
    local server = {}
    server.host = "127.0.0.1"
    server.port = 5050
    sections.server = server

    local file = assert(io.open("config.ini", "w"))
    lini.dump(sections, file)
    io.close(file)
```
