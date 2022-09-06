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
    print("close scene 1")
end
}


scene["two"] = {
    start = function ()
    narrator = Character()
    narrator:moveTo(150,150)
    narrator:add()
    --narrator:setZIndex(layers.character)

end,
     tick = function()    
        function playdate.BButtonUp()
        gfx.clear()
        narrator.face:setEmote(exprEmote["Happy"])
       end --b button funct end
end,
    close = function()
        print("closing escene")
end
}--end scene 2


scene["three"] = {
    start = function ()
    gfx.clear() --NEED TO FIX CHARACTERCOPY.LUA TO MAK IT BETTER.
    -- drawOutgoing()
     local dx2 = {"hello","goodbye"}
    --Namebox:add() --it wants an argument here tho??
    --TestText = Textboxes(activeName,) -- i don't think this 1 is used
    --textyy = Dialogues(activeName,dx)
    --TestText:draw()
    --textyy:draw()


    --[[
    drawTextbox() --Works.
     drawText()
     drawName() --so this one works
     --]]


     
     -- so this works both if no one is speaking or if someone is speaking
    local dx = "wordy wordy words. i love words. words really get me goin. wordy wordy words. i love words. words really get me goin wordy wordy words. i love words. words really get me goin wordy wordy words. i love words. words really get me goin wordy wordy words. i love words. words really get me goin "

    -- LOOK AT THE CHAR FACE CHANGER FOR TEXT CHANGING
 --   textyy:draw() --this draws the boxes
   -- for boxes
   
 
   --actualtext = Dialogues(activeName, dx)
   --actualtext:print()
  
   
   --[[local dialogue {"yp","ipp"}
    local prompts {"in","visible"}
    local answers {"test", "test2"}
    --]]
    -- thisScene = Dialogue(dialogue, prompts, answers)
    local activeName = "somethiaaa"

    local activeName = "yeah"
    --local dx = {"yeeeeeeeaaaaaaaaa", "jeeeeeeeeee"}
    local dx = "@beep"
    Dx5:Pr1(dx)
    -- combine(dx) --so now the namebox is broke


    end,
         tick = function()
         
        if playdate.buttonIsPressed(playdate.kButtonA) then
         --  Dialogues:update()
           print("a press")
           gfx.clear() -- this works but tidy does not...
        Dx5:tidy() --so this should remove em all...
        local dx ="111new math"
            Dx5:Pr1(dx) -- this is sending it to the first prefixinator


        --  combine(dx) -- so this works.
          print("ran dx5 with", dx)
      --  combine(dx) --this WORKS
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