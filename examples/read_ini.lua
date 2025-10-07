local lini = require("lini")

local sections = lini.load("config.ini")
lini.dump(sections)

local profile = sections.profile
print("[profile] name: " .. profile.name)
print("[profile] age: " .. profile.age)
print("[profile] flag: " .. profile.flag)

local server = sections["server"]
print("[server] host: " .. server["host"])
print("[server] port: " .. server["port"])
print("[server] error: " .. server["error"])
