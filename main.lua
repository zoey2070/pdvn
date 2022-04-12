-- PLAYDATE DATING SIM --
import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"
import 'CoreLibs/nineslice'
import 'CoreLibs/ui'
import 'scenes/start'
import 'scenes/1'

gfx = playdate.graphics

--local fonty = gfx.font.new('Roobert-11-Mono-Condensed')
--gfx.setFont(fonty)

function startup()
    scene = "start"
end

startup()

function sceneSelect()
    if scene == "start" then
     startMenuDraw()
     drawMenu()
--ok it basically stops working here
    elseif scene == "1" then
     playdate.inputHandlers.pop()
    end
end


function playdate.update()
    playdate.timer.updateTimers()
    sceneSelect()

end
