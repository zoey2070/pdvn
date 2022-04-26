
local dialoguetest = {"char test","text test"}
local selectedMenu = 1
local listview = playdate.ui.gridview.new(0, 15)
local menuMax = #dialoguetest


function choiceMenuDraw()
    local menuInputHandler = {
        downButtonUp = function()
            listview:selectNextRow(true)
            selectedMenu +=1
            if selectedMenu > menuMax then
                selectedMenu = 1
            end
            drawdialogueMenu()
            beep:play(1)
        end,
    
        upButtonUp = function()
            listview:selectPreviousRow(true)
            selectedMenu -=1
            if selectedMenu < 1 then
                selectedMenu = menuMax
            end
            --debugging:
            print(selectedMenu)
            --end debug
            drawdialogueMenu()
            beep:play(1)
    
        end,
    }
    
    listview.backgroundImage = nineslice
    listview:setNumberOfRows(#dialoguetest)
    listview:setCellPadding(0, 0, 5, 5)
    listview:setContentInset(24, 24, 10, 13) --24/24/13/13
    
    function listview:drawCell(section, row, column, selected, x, y, width, height)
    
        if selected then
            gfx.setColor(gfx.kColorBlack)
            --change 22 when u change the font!!!
            gfx.drawRoundRect(x, y, width, 25, 10)
            --gfx.setImageDrawMode(gfx.kDrawModeFillWhite)
        else
            gfx.setImageDrawMode(gfx.kDrawModeCopy)
        end
    
    
        gfx.drawTextInRect(dialoguetest[row], x, y+5, width, height+5, nil, "...", kTextAlignment.center)
    end
    
    function drawdialogueMenu()
        playdate.inputHandlers.push(menuInputHandler)
--THIS IS DIFF FROM MAIN MENU
        local choiceHeight = #dialoguetest*35 --for 2 this would be 70 SO...
        local minimumheight = 80
        local maximumheight = 150 -- wiggle room so u can still see the normal textbox below it
        if choiceHeight < minimumheight then
            choiceHeight = minimumheight
        elseif choiceHeight >= maximumheight then
            choiceHeight = maximumheight
        end
        
        local choiceY =  #dialoguetest*25
        if choiceY >= 100 then
            choiceY = 15
        end

        if choiceY + choiceHeight > 310 then --310 = 400 - [textbox height]
            print("y:",choiceY,"h",choiceHeight, #dialoguetest)
        end
        
        listview:drawInRect(50, choiceY, 300, choiceHeight)
  
        
        playdate.timer:updateTimers()
    end
    function playdate.AButtonUp()
        if selectedMenu == 1 then
            scene = "two"
            sceneSelect(scene)
            --yk for when we actually get to the vn part
            --flaggy = 1
        elseif selectedMenu == 2 then
            scene = "three"
            sceneSelect(scene)
        else
            --shouldn't ever get here in this menu...
            playdate.simulator.exit()
        end
        blip:play(1)
    
    
    end
    end
