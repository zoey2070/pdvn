-- PLAYDATE DATING SIM --
import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"
import "CoreLibs/animator"
import "CoreLibs/easing"
import 'CoreLibs/nineslice'
import 'CoreLibs/ui'

scene = {}

import 'scenes/start'
import 'scenes/one'
import 'character'
import 'dialoguesystem'
--import 'sceneselect'
import 'dialogueTWITTER'
import 'sceneselect2'
import 'menu'
gfx = playdate.graphics


nineslice = playdate.graphics.nineSlice.new("assets/nineslice", 5, 6, 5, 4)


local fonty = gfx.font.new('assets/monogram-21')
gfx.setFont(fonty)
local fontFamily = {
    [playdate.graphics.font.kVariantNormal] = fonty
   }

function startup()
    current_scene = "start"
    scene[current_scene]["start"]()
end

startup()
--sceneSelect(current_scene)

function playdate.update()
    gfx.sprite.update()
    scene[current_scene]["tick"]()
    playdate.timer.updateTimers()
end


local mainInputHandlers = {
    AButtonUp = function()
        print("a up main input")
        -- is this where it'd go? check the scene every "a" release
		--sceneSelect(scene)
    end,
}