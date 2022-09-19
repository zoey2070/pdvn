class('Character').extends(playdate.graphics.sprite)
function Character:init(x,y,charImg)
    --Character.super.init(self, face, body)
    --[[
    self.body = CharacterBody()
    self.face = CharacterFace()
    --]]
    self.x = x
    self.y = y
    if self.x == nil then
      self.x=120
    end

    --self.nbChar = nbChar
    --self.exprEmote = exprEmote
    --self.bodyNum = bodyNum


    --self.charf:drawCentered(200, 120) --this line fukt UP

    --self.face:add()
    local charspr = gfx.sprite.new(charImg)
    charspr:add()
    charspr:setZIndex(100)
    --charspr:moveBy(200,-200) --where is he...
    print("fjjefjn5555555555555555555555")
  end

class('CharTemplate').extends('Character')
function CharTemplate:init(x, y, exprEmote,bodyNum, chname)
self.name = chname


self.x = x
self.y = y

self.bodyImgTbl = playdate.graphics.imagetable.new("assets/".. self.name .. "body-table-154-182")
local body = gfx.sprite.new(self.bodyImgTbl[bodyNum])

self.exprImgTbl = playdate.graphics.imagetable.new("assets/" .. self.name .. "face-table-154-182")
local face = gfx.sprite.new(self.exprImgTbl[exprEmote])


local charImg = playdate.graphics.image.new(154, 182)

gfx.pushContext(charImg)
    face:add()
    body:add()
    face:moveTo(self.x+5,self.y+5)
    body:moveTo(self.x, self.y)
gfx.popContext()
CharTemplate.super.init(self, x, y, charImg)
end
