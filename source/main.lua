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

import 'scenes/one'
import 'character'
import 'dialoguesystem'
import 'dialogueTWITTER'
import 'sceneselect'
import 'menu'
gfx = playdate.graphics


nineslice = playdate.graphics.nineSlice.new("assets/nineslice", 5, 6, 5, 4)


fonty = gfx.font.new('assets/monogram-21')
gfx.setFont(fonty)
local fontFamily = {
    [playdate.graphics.font.kVariantNormal] = fonty
   }

function startup()
    current_scene = "start"
    scene[current_scene]["start"]()
    print("screm4")
end

startup()
--sceneSelect(current_scene)


function playdate.update()
    gfx.sprite.update()
    scene[current_scene]["tick"]()
    playdate.timer.updateTimers()
end

function combine(dx) --shouldn't even need this
    gfx.sprite.removeAll()
    local boxes = Textboxes(dx)
    local text = Dialogues(dx)
    boxes:draw()
  --  boxes:setZIndex(61)
    text:print()
  --  text:setZIndex(60)
    end

mainInputHandlers = {
    upButtonUp = function()
        print("up!")
    end,
    BButtonUp = function()
        print("b")
    end,
    AButtonUp = function()
        print("a up main input")
        -- is this where it'd go? check the scene every "a" release
		--sceneSelect(scene)
        activestring = "hewwo"
 
        -- swap this with whatever... then call it in the text.
    end,
    downButtonUp = function()
        print("down!")
    end,

}