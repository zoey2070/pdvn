
class('Menu').extends()
function Menu:init(listOptions)
    Menu.super.init(self)
    self.options = listOptions
    self.menuMax = #self.options
    self.selectedMenu = 1
    self.listview = playdate.ui.gridview.new(0,15)
    self.menuInputHandler = {

        downButtonUp = function()
            self.listview:selectNextRow(true)
            self.selectedMenu +=1
            if self.selectedMenu > self.menuMax then
                self.selectedMenu = 1
            end
            self:draw()
            beep:play(1)
        end,
    
        upButtonUp = function()
            self.listview:selectPreviousRow(true)
            self.selectedMenu -=1
            if self.selectedMenu < 1 then
                self.selectedMenu = self.menuMax
            end
            --debuggy
            print(self.selectedMenu)
            self:draw()
            beep:play(1)
        end,
        AButtonUp = function()
            blip:play(1)
            print("selectmenu", self.selectedMenu)
            optionSelected = self.selectedMenu
            sceneSelect(scene) --this might need to go elsewhere
           -- playdate.inputHandlers.pop()
        end
    }
end



local function getSelection(selectedMenu)
    optionSelected = selectedMenu
    print("optionSelected is ", optionSelected)
    return optionSelected
end


function Menu:draw()
    self.listview.options = self.options
    self.listview.backgroundImage = nineslice
    self.listview:setNumberOfRows(self.menuMax)
    self.listview:setCellPadding(0, 0, 5, 5)
    self.listview:setContentInset(24, 24, 10, 13) --24/24/13/13
    
    function self.listview:drawCell(section, row, column, selected, x, y, width, height)
    
        if selected then --when it is selekt
            gfx.setColor(gfx.kColorBlack)
            --change 22 when u change the font!!!
            gfx.drawRoundRect(x, y, width, 25, 10)
           -- gfx.setImageDrawMode(gfx.kDrawModeFillWhite)
        else
            gfx.setImageDrawMode(gfx.kDrawModeCopy)
        end
        gfx.drawTextInRect(self.options[row], x, y+5, width, height+5, nil, "...", kTextAlignment.center)
       -- gfx.drawTextInRect(self.listview.options[row], x, y+5, width, height+5, nil, "...", kTextAlignment.center)
        
    end

      
--THIS IS DIFF FROM MAIN MENU. decides Y location + height
        local choiceHeight = self.menuMax*35 --for 2 this would be 70 SO...
        local minimumheight = 80
        local maximumheight = 150 -- wiggle room so u can still see the normal textbox below it
        if choiceHeight < minimumheight then
            choiceHeight = minimumheight
        elseif choiceHeight > maximumheight then
            choiceHeight = maximumheight
        end
        
        local choiceY =  self.menuMax*25
        if choiceY >= 100 then
            choiceY = 15
        end

        if choiceY + choiceHeight > 310 then --310 = 400 - [textbox height]
            print("y:",choiceY,"h",choiceHeight, self.menuMax)
        end
        
        self.listview:drawInRect(50, choiceY, 300, choiceHeight)
        playdate.timer:updateTimers()
        playdate.inputHandlers.push(self.menuInputHandler)
    end --draw menu end