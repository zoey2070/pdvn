class('Menu').extends()
function Menu:init(options)
    Menu.super.init(self, options)
end

local options = {"menu","menu"} -- ...defaults to these
local selectedMenu = 1
local listview = playdate.ui.gridview.new(0, 15)
local menuMax = #options
--idk if this is needed
local menumt = {}
setmetatable(options,menumt)
-- xx
local menuInputHandler = {
    downButtonUp = function()
        listview:selectNextRow(true)
        selectedMenu +=1
        if selectedMenu > menuMax then
            selectedMenu = 1
        end
        Menu:draw()
        beep:play(1)
    end,

    upButtonUp = function()
        listview:selectPreviousRow(true)
        selectedMenu -=1
        if selectedMenu < 1 then
            selectedMenu = menuMax
        end
        Menu:draw()
        beep:play(1)

    end,
    AButtonUp = function()
        print("a is up, selected menu option is ", selectedMenu)
        blip:play(1)
        optionChoice = selectedMenu --optionchoice needs to go back to sceneselect...
        print("optchoice", optionChoice)
        return optionChoice
        --playdate.inputHandlers.pop(menuInputHandler)
    end
}


function Menu:draw()
    listview.backgroundImage = nineslice
    listview:setNumberOfRows(#options)
    listview:setCellPadding(0, 0, 5, 5)
    listview:setContentInset(24, 24, 10, 13) --24/24/13/13
    
    function listview:drawCell(section, row, column, selected, x, y, width, height)
    
        if selected then --when it is selekt
            gfx.setColor(gfx.kColorBlack)
            --change 22 when u change the font!!!
            gfx.drawRoundRect(x, y, width, 25, 10)
           -- gfx.setImageDrawMode(gfx.kDrawModeFillWhite)
        else
            gfx.setImageDrawMode(gfx.kDrawModeCopy)
        end
        gfx.drawTextInRect(options[row], x, y+5, width, height+5, nil, "...", kTextAlignment.center)
        
    end

        playdate.inputHandlers.push(menuInputHandler)
--THIS IS DIFF FROM MAIN MENU
        local choiceHeight = #options*35 --for 2 this would be 70 SO...
        local minimumheight = 80
        local maximumheight = 150 -- wiggle room so u can still see the normal textbox below it
        if choiceHeight < minimumheight then
            choiceHeight = minimumheight
        elseif choiceHeight > maximumheight then
            choiceHeight = maximumheight
        end
        
        local choiceY =  #options*25
        if choiceY >= 100 then
            choiceY = 15
        end

        if choiceY + choiceHeight > 310 then --310 = 400 - [textbox height]
            print("y:",choiceY,"h",choiceHeight, #options)
        end
        
        listview:drawInRect(50, choiceY, 300, choiceHeight)
        playdate.timer:updateTimers()

        
    end --draw menu end

    

-- this probably does nothing... but who knows.
--[[
function Menu:addOptions(options)
    self:options(options)

end
]]