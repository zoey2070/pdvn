--this one is for displaying the text

if activeSpeaking == true then
    menuselecting = false
else
    menuselecting = true
end

class('Dialogues').extends()
function Dialogues:init(name, strings)
    Dialogues.super.init(self)
    self.charname = name
    self.Dx = strings
    self.maxWidth = 385
    self.y = 150 -- i think this puts it inside the box, so this should change if we do something like a NVL
    self.height = 90
    self.dximg = gfx.image.new(self.maxWidth, 800) --???
    self.charimg = gfx.image.new(self.maxWidth, 800)
end

class('DxName').extends('Dialogues')
class('DxDx').extends('Dialogues')

local y = 150
local height = 90
local maxWidth = 385

function DxDx(strings)
    --make the dialogues a sprite.
    
  gfx.pushContext(dximg)
      gfx.drawTextInRect(strings, 13, y+10, maxWidth, height-6, nil, "...", kTextAlignment.center)
  gfx.popContext()
  local spritedx = gfx.sprite.new(dximg)
end

function DxName(name) ---??
 --DxName.super.init(self)

-- make each one a function, then call function in dx init
  if name ~= nil then -- and this is for the name.
    gfx.pushContext(nameimg)
       gfx.drawTextInRect(name,10,y-15,maxWidth-5,25,nil,"...",kTextAlignment.left)
    gfx.popContext()
    local spritename = gfx.sprite.new(nameimg)
    print("draw name")
      end
end

function Dialogues:print()
    gfx.pushContext(txtimg)
        DxName(self.charname)
        DxDx(self.Dx)
    gfx.popContext()
    self.txtspr = gfx.sprite.new(txtimg)
end
