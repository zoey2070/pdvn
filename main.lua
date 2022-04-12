-- PLAYDATE DATING SIM --
import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"
import 'CoreLibs/ui/gridview.lua'
import 'CoreLibs/nineslice'

import 'scenes/start'
import 'scenes/1'

gfx = playdate.graphics
playdate.drawFPS()
--local fonty = gfx.font.new('Roobert-11-Mono-Condensed')
--gfx.setFont(fonty)
playdate.graphics.drawText("pick ur title", 5, 5)


local scene = "start"
if scene == "start" then
    help()
elseif scene == "1" then
    gfx.drawRoundRect(x, y, width, 20, 4)
end

function playdate.update()

    gfx.drawRoundRect(1, 1, 5, 20, 4)

end
