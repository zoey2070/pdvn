class('Textboxes').extends()
function Textboxes:init()
    Textboxes.super.init(self)
    self.dialogue = dialogue()
    self.name = name()
end

function Textboxes:add()
self.dialogue:add()
self.name:add()

end

function Textboxes:moveTo()
self.dialogue:moveTo(0,150)
self.face:moveTo(x,y-50)
end

class('dialogue').extends(playdate.graphics.sprite)
function dialogue:init()
    dialogue.super.init(self)
    self:setImage(bodyImg)
end

class('name').extends(playdate.graphics.sprite)
function CharacterFace:init()
    CharacterFace.super.init(self)
  self:setEmote(exprEmote.Neutral)
end

function CharacterFace:setName(CharName)
  self:setImage(exprImgTbl[exprEmote])
end