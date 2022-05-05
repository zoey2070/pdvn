

playdate.sound.sample.new(2)
local beep = playdate.sound.sampleplayer.new("assets/sound")
local blip = playdate.sound.sampleplayer.new("assets/blip2")

class('Menu').extends()
function Menu:init(listOptions)
    Menu.super.init(self)
    self.options = listOptions
    self.menuMax = #self.options
    self.selectedMenu = 1
    self.choiceWidth = 300
    self.listview = playdate.ui.gridview.new(0,15)
    self.menuInputHandler = {
        AButtonUp = function()
            blip:play(1)
            print("selectmenu", self.selectedMenu)
            optionSelected = self.selectedMenu
           playdate.inputHandlers.pop()
            return optionSelected
        end,
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

    }
    playdate.inputHandlers.push(self.menuInputHandler)

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
        else
            gfx.setImageDrawMode(gfx.kDrawModeCopy)
        end
        gfx.drawTextInRect(self.options[row], x, y+5, width, height+5, nil, "...", kTextAlignment.center)
 
       -- gfx.drawTextInRect(self.listview.options[row], x, y+5, width, height+5, nil, "...", kTextAlignment.center)
        
    end

     --THIS IS DIFF FROM MAIN MENU. decides Y location + height
   
    
      
end


function Menu:draw()

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
    if current_scene == "start" then
        self.choiceWidth = 200
        choiceY = 40
    end



        self.listview:drawInRect(50, choiceY, self.choiceWidth, choiceHeight)
        playdate.timer:updateTimers()


        
 end --draw menu end
