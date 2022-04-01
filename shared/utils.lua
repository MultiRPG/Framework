--[[
    Resource: MultiRPG
    Type: Shared
    Developers: Inder00 <admin@multirpg.pl>
    (©) 2022 <admin@multirpg.p>. All rights reserved.
]]--

-- check mouse is mouse in specified area
-- Source: https://wiki.multitheftauto.com/wiki/IsMouseInPosition
function isMouseIn( x, y, width, height )
	if ( not isCursorShowing( ) ) then
		return false
	end
    if not sx or not sy then
        sx,sy = guiGetScreenSize( )
    end
	local cx, cy = getCursorPosition ( )
	local cx, cy = ( cx * sx ), ( cy * sy )
	
	return ( ( cx >= x and cx <= x + width ) and ( cy >= y and cy <= y + height ) )
end

-- check does event handler added
-- Source: https://wiki.multitheftauto.com/wiki/IsEventHandlerAdded
function isEventHandlerAdded( sEventName, pElementAttachedTo, func )
    if 
        type( sEventName ) == 'string' and 
        isElement( pElementAttachedTo ) and 
        type( func ) == 'function' 
    then
        local aAttachedFunctions = getEventHandlers( sEventName, pElementAttachedTo )
        if type( aAttachedFunctions ) == 'table' and #aAttachedFunctions > 0 then
            for i, v in ipairs( aAttachedFunctions ) do
                if v == func then
                    return true
                end
            end
        end
    end
 
    return false
end

-- format number
-- Source: https://wiki.multitheftauto.com/wiki/FormatNumber
function formatNumber(amount, spacer)
	if not spacer then
		spacer = ","
	end
	
	amount = math.floor(amount)
	
	local left, num, right = string.match(tostring(amount), "^([^%d]*%d)(%d*)(.-)$")
	return left .. (num:reverse():gsub("(%d%d%d)", "%1" .. spacer):reverse()) .. right
end