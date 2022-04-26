local music = playdate.sound.fileplayer.new("assets/8bitlovestory")
function sceneSelect(scene)
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
    local options = {"Char Test","Text Test","3"}
    Menu2 = Menu(options)

      if selectedMenu == "1" then
        print("progress") 
        scene = "two"
      elseif optionChoice == 2 then
        print("cry")
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
      drawOutgoing()
     drawIncoming()
    --  drawTextbox()
    --  drawText()
    --  spritetextbox:add()
      drawNamebox()
      activeName = "lonngg"
     --Namebox:add() --it wants an argument here tho??
      --drawText()
   --   drawName() --so this one works
    else
    playdate.inputHandlers.pop()
    end --if end
end -- scene switch funct end

