-- PLAYDATE DATING SIM --
import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"
import "CoreLibs/animator"
import "CoreLibs/easing"
import 'CoreLibs/nineslice'
import 'CoreLibs/ui'

import 'scenes/start'
import 'scenes/one'
import 'character'
import 'dialoguesystem'
import 'dialoguemeny'
import 'sceneselect'
import 'dialogueTWITTER'
import 'menu'
gfx = playdate.graphics
scene = nil

nineslice = playdate.graphics.nineSlice.new("assets/nineslice", 5, 6, 5, 4)


local fonty = gfx.font.new('assets/monogram-21')
gfx.setFont(fonty)
local fontFamily = {
    [playdate.graphics.font.kVariantNormal] = fonty
   }

function startup()
    scene = "start"
end

startup()
sceneSelect(scene)

function playdate.update()
    gfx.sprite.update()
    playdate.timer.updateTimers()
end


local mainInputHandlers = {

    AButtonUp = function()
        -- is this where it'd go? check the scene every "a" release
		--sceneSelect(scene)
    end,
}
