
--https://stackoverflow.com/questions/17139371/lua-execute-a-function-stored-in-a-table
scene["start"] = {
    start = function ()
        gfx.setFont(fonty)
        startMenuDraw()
        drawMenu()
end,
     tick = function()
 --        print("tickking")
end,
    close = function()
        print("closing escene")
end
}
scene["one"] = function ()
    
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
  if optionSelected == 1 then
      
    --might not work
  --  scene = "two"
 --   print("progress")
 --   sceneSelect(scene)
 local listOptions = {"hell","yeah"}
 Menu3 = Menu(listOptions)
 Menu3:draw()
  elseif optionSelected == 2 then
    print("cry")
  
  else
   -- scene = "three"
    print("fard")
    --sceneSelect(scene)
  end

end --end scene one

scene["two"] = function()
    narrator = Character()
    narrator:moveTo(150,150)
    narrator:add()
    --narrator:setZIndex(layers.character)
    function playdate.BButtonUp()
     gfx.clear()
     narrator.face:setEmote(exprEmote["Happy"])
    end --b button funct end
end --end scene 2


scene["three"] = function()
    gfx.clear() --NEED TO FIX CHARACTERCOPY.LUA TO MAK IT BETTER.
    -- drawOutgoing()
     activeName = "lonngg"
    --Namebox:add() --it wants an argument here tho??
     drawText()
  
     drawName() --so this one works
end --end scene 3






function scene_transition(scene)

end













--[[
game_level_hints = game_level_hints or {}
game_level_hints.levels = {}
game_level_hints.levels["level0"] = function()
    return
    {
        [on_scene("scene0")] =
        {
            talk("hint0"),
            talk("hint1"),
            talk("hint2")
        },
        [on_scene("scene1")] =
        {
            talk("hint0"),
            talk("hint1"),
            talk("hint2")
        }
    }
end

function on_scene(sceneId)
    -- some code
    return sceneId
end

function talk(areaId)
    -- some code
    return areaId
end

asd = game_level_hints.levels["level0"]()
asd["scene0"][1]

--]]