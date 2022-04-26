--[[if scene == "one" then
    --playdate.graphics.fillRect(0, 0, 400, 240)
    playdate.drawFPS()
   -- playdate.graphics.setBackgroundColor(playdate.graphics.kColorBlack)
    --addChar()
    print("scene one")
    choiceMenuDraw()
    drawdialogueMenu()
elseif scene == "two" then
    drawTextbox()
    drawNamebox()
    spritetextbox:add()
    --spritenamebox:add()
    Namebox:add()
    drawText()
    drawName()
end --]]
--so nothing in here runs for whampterever reason