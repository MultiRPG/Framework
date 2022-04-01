--[[
    Resource: MultiRPG
    Type: Clientside
    Developers: Inder00 <admin@multirpg.pl>
    (©) 2022 <admin@multirpg.p>. All rights reserved.
]]--

-- List of remote events
RemoteEvents = {

}

-- resource start
addEventHandler((localPlayer and "onClientResourceStart" or "onResourceStart"), resourceRoot, function()

    -- events
    for key, event in pairs(RemoteEvents) do

        -- asserts
        assert( type( event.name ) == "string", "Invalid field name @ RemoteEvents(" .. key .. ") [string expected, got " .. type( event.name ) .. "]" )
        assert( type( event.exec ) == "function", "Invalid field exec @ RemoteEvents(" .. key .. ") [function expected, got " .. type( event.exec ) .. "]" )
        assert( isElement( (event.attachedTo or resourceRoot) ), "Invalid field attachedTo @ Events(" .. key .. ") [element expected, got " .. type( event.attachedTo ) .. "]" )

        -- add event
        addEvent(event.name, event.allowedRemote or true)
        addEventHandler(event.name, event.attachedTo or resourceRoot, event.exec)

    end

end)