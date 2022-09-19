--[[SCENE TEMPLATE
scene["name"] = {
    start = function ()
        --on start
end,
     tick = function()
    --this runs every frame
end,
    close = function()
       --when you close
end
}
--]]

scene["start"] = {
    start = function ()
        gfx.setFont(fonty)
        local startMenuOptions = {"Play", "Load", "Gallery", "Credits"}
        startMenu = Menu(startMenuOptions)
        startMenu:draw()
end,
     tick = function()
        if optionSelected == 1 then
            gfx.clear()
            scene_transition("one")
        elseif optionSelected == 2 then
            --load
            gfx.clear()
            scene_transition("load")
        gfx.drawTextAligned("Loaded! Jk!",1,1,kTextAlignment.left)
            playdate.drawFPS()
            --narrator:moveTo(5,5)
            --so this only runs once, when A is pressed
    --[[
            imgtest = gfx.image.new("assets/imgtest")
            spr_img = gfx.sprite.new(imgtest)
            spr_img:moveTo(100,100)
            spr_img:add()
    
    --]]
        elseif optionSelected == 3 then
            --gallery
            gfx.clear()
            scene_transition("gallery")
            gfx.drawTextAligned("Gallery",1,1,kTextAlignment.left)
        elseif optionSelected == 4 then
            --credits
            scene_transition("credits")
        end
        
end,
    close = function()
        gfx.sprite.removeAll()
        print("closing escene")
        playdate.inputHandlers.pop()
        print("popped input")
       
    

end
}

scene["one"] = {
    start = function()
 --   music:play()
    flaggy = 1
    playdate.drawFPS()
-- playdate.graphics.setBackgroundColor(playdate.graphics.kColorBlack)
--this is for the next menu: -- 
--choiceMenuDraw()
--drawdialogueMenu()
--
   local listOptions = {"Char Test","Text Test","3"}
    Menu2 = Menu(listOptions)
    Menu2:draw() -- so this just does the default menu...

    -- hey can't we simplify this shit?


--so now we need to return optionSelected to this shit.

--THIS WORKS... maybe nest again??
 

end, --end scene one init

tick = function()
    
    if optionSelected == 1 then
      
        --might not work
        scene_transition("two")
    elseif optionSelected == 2 then
      scene_transition("three")

      
      else
      end
end,
close = function()
    
    playdate.inputHandlers.pop()
    print("popped input")

    print("close scene 1")
end
}


scene["two"] = { --rewrite to go with the dialogue system.
    start = function ()
    narrator = Spot(150,110,2,2)
    narrator:moveTo(150,150)
   -- narrator.body:setBody(2)
    narrator:add()

    --narrator:setZIndex(layers.character)

end,
     tick = function()    
        function playdate.BButtonUp()
        gfx.clear()
        narrator.face:setEmote(1)
       end --b button funct end
end,
    close = function()
        print("closing escene")
end
}--end scene 2


scene["three"] = {
    start = function ()
    gfx.clear() --NEED TO FIX CHARACTERCOPY.LUA TO MAK IT BETTER.
    --[[ i have no idea how to use this
        gfx.pushContext(patternimg)
    gfx.setPattern({0x5A, 0xA5, 0x5A, 0xA5, 0xA5, 0x5A, 0xA5, 0x5A})
        gfx.popContext()
    patternspr = gfx.sprite.new(patternimg)
    patternspr:add()
--]]
   -- local dx = "@wordy wordy words. i love words. words really get me goin. wordy wordy words. i love words. words really get me goin wordy wordy words. i love words. words really get me goin wordy wordy words. i love words. words really get me goin wordy wordy words. i love words. words really get me goin "
   -- Dx5(dx)


  --  local dxpos = 200
  --  local dx ={"111new math","@neeeww maaaaaath"}
  --      Dx5(dx,dxpos)
  
  local dxpos = 200
  local dx ={"111new math","@neeeww maaaaaath"}
  printer(dx,dxpos)


    end,
         tick = function()
            playdate.drawFPS(10,10)
            --so it doesn't have any dx bc.......... it's up there ^
        Dx5:update() --needs to check if it even needs...
            -- is it initializing it again?
      
          
        if playdate.buttonIsPressed(playdate.kButtonB) then
            Tidy2()
       -- local dxpos = 100
        local dx = {"322electricboogaloo","@aaaaaaaaaaaa","111help"}
        Dx5(dx)
        end



    end,
        close = function()
            print("closing escene")
    end

}



scene["credits"] = {
    start = function ()
        gfx.sprite.removeAll()
         gfx.drawTextAligned("Credits",1,1,kTextAlignment.left)
end,
     tick = function()
        function playdate.AButtonUp()
            gfx.drawTextAligned("me",5,5,kTextAlignment.left)
        end
        function playdate.BButtonUp()
            print("b pushed at credits")
            scene_transition("start")
        end
    --this runs every frame
end,
    close = function()
       --when you close
end
}

if scene[current_scene] == nil then print("NO SCENE") end


function stopMenuInput()
    optionSelected = nil
  --  playdate.inputHandlers.pop()
    --playdate.inputHandlers.push(mainInputHandlers) --if we do this then any scene-specific ones get overridden.
end

function sceneTransitions() --dose this do anything??

local transitionTime = 100
transitionAnimator = gfx.animator.new(transitionTime, 0, 400, playdate.easingFunctions.inQuad)

if transitionAnimator then
    
transitionImage = gfx.image.new(400, 240, playdate.graphics.kColorBlack)

gfx.pushContext(transitionImage)
gfx.fillRect(0, 0, transitionAnimator:currentValue(), 240)
gfx.popContext(transitionImage)
transitionAnimator:setImage(transitionImage)
end

transitionAnimator:add()

transitionAnimator = gfx.animator.new(transitionTime, 400, 0, playdate.easingFunctions.inQuad)

transitionAnimator:update()
end


function scene_transition(new_scene)
stopMenuInput()
scene[current_scene]["close"]()
gfx.clear()
current_scene = new_scene

--sceneTransitions:update()

--if transitionAnimator:ended() then

print(current_scene)
scene[current_scene]["start"]()
--end
end



scene["gallery"] = {
    start = function ()
        print("Gallery!")
end,
     tick = function()
    --this runs every frame
end,
    close = function()
       --when you close
end
}

scene["load"] = {
    start = function ()
        print("load!")
end,
     tick = function()
    --this runs every frame
end,
    close = function()
       --when you close
end
}