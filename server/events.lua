--[[
    Resource: MultiRPG
    Type: Serverside
    Developers: Inder00 <admin@multirpg.pl>
    (©) 2022 <admin@multirpg.p>. All rights reserved.
]]--

-- List of events
Events = {

}

-- events
for key, event in pairs(Events) do

    -- asserts
    assert( type( event.name ) == "string", "Invalid field name @ Events(" .. key .. ") [string expected, got " .. type( event.name ) .. "]" )
    assert( type( event.exec ) == "function", "Invalid field exec @ Events(" .. key .. ") [function expected, got " .. type( event.exec ) .. "]" )
    assert( isElement( (event.attachedTo or resourceRoot) ), "Invalid field attachedTo @ Events(" .. key .. ") [element expected, got " .. type( event.attachedTo ) .. "]" )

    -- add event
    addEventHandler(event.name, event.attachedTo or resourceRoot, event.exec)

end