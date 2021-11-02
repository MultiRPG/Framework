--[[
    Resource: MultiRPG
    Type: Clientside
    Developers: Inder00 <admin@multirpg.pl>
    (©) 2021 <admin@multirpg.p>. All rights reserved.
]]--

-- screen size (constants for whole project)
sx,sy = guiGetScreenSize()
sxh, syh = (sx/2), (sy/2)
scale = sx <= 1920 and sx / 1920 or sy / 1080