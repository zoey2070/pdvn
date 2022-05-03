--SCENE TEMPLATE
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
--
scene["start"] = {
    start = function ()
        gfx.setFont(fonty)
        startMenuDraw()
        drawMenu()
end,
     tick = function()
--this runs every frame
end,
    close = function()
        print("closing escene")
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
print(optionSelected)
    if optionSelected == 1 then
      
        --might not work
      --  scene = "two"
     --   print("progress")
     local listOptions = {"hell","yeah"}
     Menu3 = Menu(listOptions)
     Menu3:draw()
      elseif optionSelected == 2 then
      scene_transition("two")

      
      else
       -- scene = "three"
        print("fard")
        --sceneSelect(scene)
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
    function playdate.BButtonUp()
     gfx.clear()
     narrator.face:setEmote(exprEmote["Happy"])
    end --b button funct end
end,
     tick = function()
--this runs every frame
end,
    close = function()
        print("closing escene")
end
}--end scene 2


scene["three"] = {
    start = function ()
    gfx.clear() --NEED TO FIX CHARACTERCOPY.LUA TO MAK IT BETTER.
    -- drawOutgoing()
     activeName = "lonngg"
    --Namebox:add() --it wants an argument here tho??
     drawText()
     drawName() --so this one works
    end,
         tick = function()
    --this runs every frame
    end,
        close = function()
            print("closing escene")
    end

}



if scene[current_scene] == nil then print("NO SCENE") end


function scene_transition(new_scene)
scene[current_scene]["close"]()
current_scene = new_scene
print(current_scene)
scene[current_scene]["start"]()
end
