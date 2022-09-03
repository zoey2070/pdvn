--this one is for displaying the text

class('Dialogues').extends(playdate.graphics.sprite)
function Dialogues:init(name, strings, kind)
    Dialogues.super.init(self)
    self.charname = name
    self.Dx = strings
    self.maxWidth = 385
    self.y = 150 -- i think this puts it inside the box, so this should change if we do something like a NVL
    self.height = 90
    self.dximg = gfx.image.new(self.maxWidth, 800) --???
    self.charimg = gfx.image.new(self.maxWidth, 800)
    self.kind = kind



    self.linePos = 1
    self.printMeter = 1

local leftIndent        = 20
local lineIndent        = 25
local rightIndent       = 350

self.charPos           = leftIndent
self.printLine         = lineIndent
self.finalLineLoc      = lineIndent
self.nextWordSize      = 0
self.randOffset        = 0
self.activeSpeaking = true
self.menuselecting = false
end

--class('DxName').extends('Dialogues')
class('DxDx').extends('Dialogues')

-- this calls the dialogue
function DxDx:init(strings, kind)
    DxDx.super.init(self, kind)
    self.kind = kind
    if self.kind == "nvl" then -- this would be for a longer box...
        self.x = 10
        self.nvly = 15
        self.height = 250
        self.maxWidth = 380
    gfx.pushContext(dximg)
    -- for multiple strings, need to change this... but then how to add on to sprite so first string doesn't disappear?
        gfx.drawTextInRect(strings, self.x, self.nvly, self.maxWidth, self.height, nil, "...", kTextAlignment.center)
    gfx.popContext()

    elseif self.kind == "types" then
 print("tpye")
 local char = string.sub(strings, 1, 1)
 print(char)

    else --dialogue box by default
    gfx.pushContext(dximg)
        gfx.drawTextInRect(strings, 13, self.y+10, 340, 400, nil, "...", kTextAlignment.center)
    gfx.popContext()
    end -- put more kinds here


local spritedx = gfx.sprite.new(dximg)
spritedx:add()
end

-- this is for the names

--[[
function DxName:init(name) ---??
 DxName.super.init(self)
  if name ~= nil and self.kind ~= "nvl" then -- and this is for the name.
    gfx.pushContext(nameimg)
       gfx.drawTextInRect(name,10,self.y-15,self.maxWidth-5,25,nil,"...",kTextAlignment.left)
    gfx.popContext()
      end
end
--]]
--prints both

-- maybe separate name and dialogue since name is mostly static?
function Dialogues:print()
    gfx.pushContext(txtimg)
        DxDx(self.Dx, self.kind)
    gfx.popContext()
    self.txtspr = gfx.sprite.new(txtimg)
    self.txtspr:add()
end

--[[

function Dialogues:update()

    if self.activeSpeaking == true then
        self.menuselecting = false
    else
        self.menuselecting = true
    end
    
    if self.menuselecting == true then
        if playdate.buttonJustPressed(playdate.kButtonA) then
            print(self.linePos)
            --self.linePos += 1 -- why is this nil??

            if self.linePos > #self.Dx then
                self.printMeter = 1
                Dialogues:print()
                self.activeSpeaking = true
            end
        end
    end
    end

    -]]
