class('Textboxes').extends()
function Textboxes:init()
    Textboxes.super.init(self)
    self.dialogue = dialogue()
    self.name = name()
end

function Textboxes:add()
self.dialogue:add()
if activeName ~= nil then
self.name:add(activeName)
end
end

function Textboxes:moveTo()
self.dialogue:moveTo(0,150)
self.name:moveTo(x,y-50)
end

------------fix below-------
class('dialogue').extends(playdate.graphics.sprite)
function dialogue:init()
    dialogue.super.init(self)
    self:setImage(nineslice)
end

class('name').extends(playdate.graphics.sprite)
function name:init()
    name.super.init(self)
  self:setImage(nineslice)
end

-- ????
function name:setName(CharName)
  self:setImage(exprImgTbl[exprEmote])
end