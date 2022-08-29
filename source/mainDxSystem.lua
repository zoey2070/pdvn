class('Novel').extends()



function Novel:init()
    Novel.super.init(self)
    self.dximg = gfx.image.new(400,800)
    self.dxspr = gfx.sprite.new(dximg)
    self.dxsprite:add() -- these 3 might go in the Boxes

    self.speed = 1
    self.charindent = leftIndent
    self.printindent = lineIndent
    self.wordSizes = 0
    self.linePos = 1
    self.activeSpeaking = true
    self.menuselecting = false
    self.txtX = 1 -- adjust as neccessary
    self.txtY = 1
end

function Novel:drawimg(char)
gfx.pushContext(self.dximg)
    gfx.drawText(char, txtX, txtY)
gfx.popContext()
self.dxspr:setImage(self.dximg)
self.linePos +=1
self.activeSpeaking = false
self.menuselecting = true
end


function Novel:printChar(char,text)
    local nextChar = string.sub(text, self.speed + 1, self.speed + 1)

    if char == " " then
        self.nextWordSize = self:getNextWordSize(text) + 5
    end
    --line 142 printer/printer

end 
