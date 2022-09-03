local leftIndent        = 20
local lineIndent        = 25
local rightIndent       = 350

class('Printer').extends()

function Printer:init()
    Printer.super.init(self)
    --master image and sprite for all existing dialogue, initialize sprite
    self.dialogueImage   = gfx.image.new(400,800)
    self.dialogueSprite  = gfx.sprite.new(dialogueImage)
    self.dialogueSprite:moveTo(200, 390)
    self.dialogueSprite:add()
    self.dialogueSprite:setZIndex(1)

    --local variables used in basic print functions
    self.printMeter        = 1
    self.charPos           = leftIndent
    self.printLine         = lineIndent
    self.finalLineLoc      = lineIndent
    self.nextWordSize      = 0
    self.randOffset        = 0
    self.style = "regular"

    --shared variables used to communicate with overall dialogue printer and continuing
    --with player input
    self.linePos = 1
    self.queryContinue = true
    self.playerInput = false
end

function Printer:drawToImage(char)
    gfx.pushContext(self.dialogueImage)
        gfx.drawText(char, self.charPos, self.printLine + self.randOffset)
    gfx.popContext()
    self.dialogueSprite:setImage(self.dialogueImage)
end

function Printer:resetPrintVar()
    --reset variables
    self.charPos = leftIndent
    self.printMeter += 1
end

function Printer:getNextWordSize(text)
    local pos1 = self.printMeter
    local pos2 = self.printMeter + 1
    local currentChar = string.sub(text, pos2, pos2)
    while currentChar ~= " " and pos2 <= #text do
        pos2 += 1
        currentChar = string.sub(text, pos2, pos2)
    end
    local nextWord = string.sub(text, pos1, pos2)
    local nextWordSize = #nextWord
    return nextWordSize
end


function Printer:printChar(char, text)
    local nextChar = string.sub(text, self.printMeter + 1, self.printMeter + 1)
    --first guages if we can go to new line at a " " opportunity
    if char == " " then
        self.nextWordSize = self:getNextWordSize(text) + 5
    end
    if char == " " and (self.charPos + self.nextWordSize) > (rightIndent) then
        self:drawToImage(char)
        --self.printMeter += 1
        self:resetPrintVar()
        --calc final line
        self.finalLineLoc += lineIndent
        self.printLine += lineIndent
    else
        self:drawToImage(char)
        --queries if we have come to the end of the text, reseting and preparing for next print
        if self.printMeter > #text then
            self:resetPrintVar()
            self.style = "regular"
            self.printMeter = 1
            --calc final line
            self.finalLineLoc += lineIndent
            self.printLine += lineIndent
            --head to next print, pausing before input
            self.linePos += 1
            self.queryContinue = false
            self.playerInput = true
            --add button prompt
            --[[
            glyphSprite:add()
            glyphSprite:moveTo(rightIndent + lineIndent, self.finalLineLoc)
            glyphSprite:setZIndex(10)
            --]]
        else
            --move on to next character in text string
            self.printMeter += 1
            self.charPos += gfx.getTextSize(char) + 1
        end
    end
end

function Printer:printText(text)
    --move dialogue sprite if at the bottom of the screen
    if self.finalLineLoc >= 200 and self.queryContinue == true then
        self.dialogueSprite:moveBy(0, -25)
        self.finalLineLoc -= 25
    end
    --initialize character in text sequence
    local char = string.sub(text, self.printMeter, self.printMeter)
    --determine style by prefix
    if char == "#" then
        self.style = "evil"
        self.printMeter += 1
        char = string.sub(text, self.printMeter, self.printMeter)
    elseif char == "@" then
        self.style = "shout"
        self.printMeter += 1
        char = string.sub(text, self.printMeter, self.printMeter)
    end
    --print character in specific style
    if self.style == "evil" then
        self:printEvil(char,text)
    elseif self.style == "shout" then
        local newText = string.sub(text, 2, #text)
        self:printShout(newText)
    else 
        self:printNormal(char, text)
    end
    --speed up print with B button press/hold
    if pd.buttonIsPressed(pd.kButtonB) and self.printMeter < #text - 1 and self.printMeter ~= 1 then
		    char = string.sub(text, self.printMeter, self.printMeter)
            --print character in specific style
            if self.style == "evil" then
                self:printEvil(char,text)
            elseif self.style == "shout" then
                local newText = string.sub(text, 2, #text)
                self:printShout(newText)
            else 
                self:printNormal(char, text)
            end
	end
end