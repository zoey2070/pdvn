class('Character').extends()
function Character:init()
    Character.super.init(self)
    self.body = CharacterBody()
    self.face = CharacterFace()
end

function Character:add()
self.body:add()
self.face:add()



--self.face:setZIndex(45)
--self.body:setZIndex(40)
end

function Character:moveTo(x,y)
self.body:moveTo(x,y)

--THIS is the face offset
self.face:moveTo(x+5,y+5)
end


exprEmote = {Neutral = 1, Happy = 2, Sad = 3, Cummy = 4}

local bodyImg = playdate.graphics.image.new("assets/defaultbody")
--local exprImg = playdate.graphics.image.new("assets/defaultface")


--shouldn't these extend Character?
--no, because they're initialized IN Character
class('CharacterBody').extends(playdate.graphics.sprite)
function CharacterBody:init()
    CharacterBody.super.init(self)
    self:setImage(bodyImg)
end

class('CharacterFace').extends(playdate.graphics.sprite)
function CharacterFace:init()
    CharacterFace.super.init(self)
  self:setEmote(exprEmote.Neutral)
end

exprImgTbl = playdate.graphics.imagetable.new("assets/defaultface-table-154-182")

function CharacterFace:setEmote(exprEmote)
  self:setImage(exprImgTbl[exprEmote])
end