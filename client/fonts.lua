--[[
    Resource: MultiRPG
    Type: Clientside
    Developers: Inder00 <admin@multirpg.pl>
    (©) 2022 <admin@multirpg.p>. All rights reserved.
]]--

-- List of font types
local fontTypes = {

}

-- Default font used when failed to create specified font
local defaultFont = "default-bold"

-- List of cached fonts
local cachedFonts = {}

-- Fonts table
FONTS = {

    -- delete all fonts from memory
    deleteAllFonts = function()

        -- loop cached fonts
        for _, cachedFont in pairs( cachedFonts ) do
            for _, font in pairs( cachedFont.data ) do
                destroyElement( font )
            end
        end

        -- clear table
        cachedFonts = {}

    end

}

-- Metatable
setmetatable( FONTS, {

    -- index
    __index = function( self, key )
        
        -- check key type
        if type(key) ~= "number" then return nil end

        -- check is font already exists
        if type(cachedFonts[ key ]) == "nil" then

            -- create font
            cachedFonts[ key ] = { size = key, data = {} }
            setmetatable( cachedFonts[ key ], {
                __index = function( font, fontkey )
                    local fontType = fontTypes[ fontkey ]
                    if type(fontType) == "string" then
                        if type(font.data[ fontType ]) == "nil" then
                            font.data[ fontType ] = dxCreateFont( fontType, font.size ) or defaultFont
                        end
                        return font.data[ fontType ]
                    else
                        return nil
                    end
                end,
            } )

        end
        return cachedFonts[ key ]

    end,

} )