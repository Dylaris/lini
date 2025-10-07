local lini = require("lini")

local sections = {}

local profile = {}
profile.name = "jack"
profile.age = 30
profile.flag = false

local server = {}
server.host = "127.0.0.1"
server.port = 5050
server.error = true

sections.profile = profile
sections.server = server

local file = assert(io.open("config.ini", "w"))
lini.dump(sections, file)
io.close(file)
