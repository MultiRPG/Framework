--[[
    Resource: MultiRPG
    Type: Clientside
    Developers: Inder00 <admin@multirpg.pl>
    (©) 2022 <admin@multirpg.p>. All rights reserved.
]]--

-- List of cached textures
local cachedTextures = {}

-- Textures table
TEXTURES = {

    -- delete all textures from memory
    deleteAllTextures = function()

        -- loop cached textures
        for _, cachedTexture in pairs( cachedTextures ) do
            destroyElement( cachedTexture.texture )
        end

        -- clear table
        cachedTextures = {}

    end

}

-- Metatable
setmetatable( TEXTURES, {

    -- index
    __index = function( self, key )
        
        -- check key type
        if type(key) ~= "string" then return nil end

        -- check is texture already exists
        if type(cachedTextures[ key ]) == "nil" then

            -- create texture
            local cachedTexture = dxCreateTexture( key )
            if cachedTexture then

                -- log
                outputDebugString( "[" .. getResourceName( resource ) .. "] Cached new texture: " .. key )

                -- cache texture
                cachedTextures[ key ] = { texture = cachedTexture, lastUsage = 0 }
            
            end

        end

        -- check does texture exists
        if type(cachedTextures[ key ]) ~= "table" then return nil end
        if not cachedTextures[ key ].texture or not isElement(cachedTextures[ key ].texture) then

            -- remove texture from cache
            cachedTextures[ key ] = nil

            -- return nil
            return nil
            
        end

        -- update last usage
        cachedTextures[ key ].lastUsage = getTickCount()

        -- return texture
        return cachedTextures[ key ].texture

    end,

} )

-- Remove all unused textures
setTimer(function()

    -- current tick
    local currentTick = getTickCount()

    -- loop all cached textures
    for key, cachedTexture in pairs( cachedTextures ) do
        if currentTick - cachedTexture.lastUsage > 10000 then
            
            -- log
            outputDebugString( "[" .. getResourceName( resource ) .. "] Removed texture: " .. key )

            -- destroy
            destroyElement( cachedTexture.texture )
            cachedTextures[ key ] = nil

        end
    end

end, 10000, 0)