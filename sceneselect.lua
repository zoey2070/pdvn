local music = playdate.sound.fileplayer.new("assets/8bitlovestory")
function sceneSelect(scene)
    if scene == "start" then
     startMenuDraw()
     drawMenu()
    elseif scene == "one" then
        music:play()
        flaggy = 1
    playdate.drawFPS()
   -- playdate.graphics.setBackgroundColor(playdate.graphics.kColorBlack)
    choiceMenuDraw()
    drawdialogueMenu()
        --gfx.clear()
      ----  playdate.timer.new(50)
        --fast_fade.lua? need transitions
      --  playdate.graphics.setBackgroundColor(playdate.graphics.kColorBlack)
    elseif scene == "two" then
      narrator = Character()
      narrator:moveTo(150,150)
      narrator:add()
      function playdate.BButtonUp()
       gfx.clear()
       narrator.face:setEmote(exprEmote["Happy"])
      end --b button funct end
    elseif scene == "three" then
      drawTextbox()
     -- spritetextbox:add()
      drawNamebox()
      activeName = "lonngg"
     --Namebox:add() --it wants an argument here tho??
      --drawText()
   --   drawName() --so this one works
    else
    playdate.inputHandlers.pop()
    end --if end
end -- scene switch funct end

