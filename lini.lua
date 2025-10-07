local lini = {}

local function parse_section(line)
    local _, name = line:match("^(%s*)%[(%w+)%]")
    return name
end

local function parse_pair(line)
    local _, key, val = line:match("^(%s*)(%w+)%s*=%s*(.*)")
    return key, val
end

function lini.load(filename)
    local file = io.open(filename, "rb")
    if not file then
        io.stderr:write("ERROR: failed to load file <" .. filename .. ">")
        return
    end

    local sections = {}
    local current_section_name = nil

    for line in file:lines() do
        local section_name = parse_section(line)
        if section_name then
            if not sections[section_name] then
                -- new section
                sections[section_name] = {}
            end
            current_section_name = section_name
        else
            local key, val = parse_pair(line)
            if current_section_name and key and val then
                local section = sections[current_section_name]
                section[key] = val
            end
        end
    end

    io.close(file)
    return sections
end

function lini.dump(sections, file)
    file = file or io.stdout
    for name, kvs in pairs(sections) do
        file:write(string.format("[%s]\n", name))
        for k, v in pairs(kvs) do
            file:write(string.format("  %s = %s\n", k, v))
        end
        file:write("\n")
    end
end

return lini
