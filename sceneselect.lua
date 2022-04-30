local music = playdate.sound.fileplayer.new("assets/8bitlovestory")
function sceneSelect(scene)
  gfx.sprite.removeAll()
    if scene == "start" then
      gfx.setFont(fonty)
     startMenuDraw()
    drawMenu()
    elseif scene == "one" then
        music:play()
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
      if optionSelected == 1 then --so scene one AND next option is 1
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

        --gfx.clear()
      ----  playdate.timer.new(50)
        --fast_fade.lua? need transitions
      --  playdate.graphics.setBackgroundColor(playdate.graphics.kColorBlack)
    elseif scene == "two" then
      narrator = Character()
      narrator:moveTo(150,150)
      narrator:add()
      --narrator:setZIndex(layers.character)
      function playdate.BButtonUp()
       gfx.clear()
       narrator.face:setEmote(exprEmote["Happy"])
      end --b button funct end
    elseif scene == "three" then
      gfx.clear() --NEED TO FIX CHARACTERCOPY.LUA TO MAK IT BETTER.
     -- drawOutgoing()
    --  drawIncoming()
    --  drawTextbox()
    --  drawText()
    --  spritetextbox:add()
    --  drawNamebox()
      activeName = "lonngg"
     --Namebox:add() --it wants an argument here tho??
      drawText()
   
      drawName() --so this one works
    else
      print("What scene??")
   -- playdate.inputHandlers.pop() --ok this is literally useless
    end --if end
end -- scene switch funct end

