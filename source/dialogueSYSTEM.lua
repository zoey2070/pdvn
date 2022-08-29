--IT'S PERFECT DON'T TOUCH!!!
-- displays the text and name boxes

class('Textboxes').extends(playdate.graphics.sprite)
function Textboxes:init(name)
    Textboxes.super.init(self)
    self.name = name
    self.maxWidth = 387 -- this might be for dialogue max width
    self.y = 150
    self.height = 90
    self.tb = Dxbox()
    self.nb = Namebox(self.name)
end

local y = 150
local height = 90
local maxWidth = 387

class('Dxbox').extends('Textboxes')
function Dxbox:init()
--  Dxbox.super.init(self)
self.y = 150
self.height = 90
    local textbox = nineslice
    gfx.pushContext(textbox)
     textbox:drawInRect(0,self.y,400,self.height)
    gfx.popContext()
    local spritetextbox = gfx.sprite.new(textbox)
    spritetextbox:moveTo(150,150) --0,150
    spritetextbox:setZIndex(59)
    spritetextbox:add()
end


 -- end

 --end was here


class('Namebox').extends('Textboxes')
function Namebox:init(name)
 -- Namebox.super.init(self)
 self.name = name
   if self.name ~= nil then
    print("draw namebox??")
local namebox = nineslice
--local nbWidth = 100 --this needs to change based on name length...

local nameLength = fonty:getTextWidth(self.name)
local nbWidth = nameLength + 20 -- ???
if nbWidth < 100 then
nbWidth = 100
elseif nbWidth > maxWidth then
nbWidth = maxWidth
end

local nbHeight = 35
gfx.pushContext(namebox)
namebox:drawInRect(0,height+nbHeight,nbWidth,nbHeight)
gfx.popContext()
local spritenamebox = gfx.sprite.new(namebox)
spritenamebox:moveTo(50,50) --50,50
spritenamebox:setZIndex(60)
elseif self.name == nil then -- if there IS NOT a name
end
end




function Textboxes:draw()
  --print("txtbox add")

  if self.name ~= nil then
    gfx.pushContext(TB)
    Dxbox()
    Namebox(self.name)
    gfx.popContext()
  else
  gfx.pushContext(TB)
  Dxbox()
  gfx.popContext()
  end
  local spritebox = gfx.sprite.new(TB)
  spritebox:add()
end