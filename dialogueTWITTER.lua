local outgoing = playdate.graphics.nineSlice.new("assets/9sl_outgoing",13,8,4,8)
local incoming = playdate.graphics.nineSlice.new("assets/9sl_incoming",13,8,4,8)
--use a gridview with two columns!!!

function drawOutgoing()
gfx.pushContext(outgoing)
outgoing:drawInRect(100,1,200,5)
gfx.popContext()
localspriteoutgoing = gfx.sprite.new(outgoing)
spriteoutgoing:moveTo(0,0)
spriteoutgoing:add()
end

function drawIncoming()
    gfx.pushContext(incoming)
    incoming:drawInRect(100,1,200,1)
    gfx.popContext()
    local spriteincoming = gfx.sprite.new(incoming)
    spriteincoming:moveTo(50,50)
    spriteincoming:add()
end