class('Character').extends()
function Character:init()
    Character.super.init(self)
    self.body = CharacterBody(bodyImgTbl, bodyNum)
    self.face = CharacterFace(exprImgTbl, exprEmote)
end


function Character:add()
self.body:add()
self.face:add()

--hey i don't think this is a sprite...

--self.face:setZIndex(45)
--self.body:setZIndex(40)
end
--]]

function Character:moveTo(x,y)
self.body:moveTo(x,y)
--THIS is the face offset
self.face:moveTo(x+5,y+5)
end


-- exprEmote = {Neutral = 1, Happy = 2, Sad = 3, Cummy = 4}

--local exprImg = playdate.graphics.image.new("assets/defaultface")





--bodyImgTbl = playdate.graphics.imagetable.new("assets/defaultbody-table-154-182")

--shouldn't these extend Character?
--no, because they're initialized IN Character

--SO THIS IS ALLLLLLLLLLLLLLLLLLL FUCKED UP.
class('CharacterBody').extends(playdate.graphics.sprite)
function CharacterBody:init(nbChar, bodyNum)
    CharacterBody.super.init(self)
    if nbChar == nil then
      print(nbChar, "nil?")
      nbChar = "1"
    end

    local temp = tostring(nbChar)
    local NbodyNum = tonumber(bodyNum) --this needs to be an integer

    local bodyImgTbl = playdate.graphics.imagetable.new("assets/2body-table-154-182")

    --self.bodyImgTbl = playdate.graphics.imagetable.new("assets/".. temp .. "body-table-154-182")
    self:setBody(bodyImgTbl,NbodyNum)
end

--TODO: put this all together in DX

-- THIS AIN'T WORKING
function CharacterBody:setBody(bodyImgTbl, NbodyNum) --change this to bodyImgTbl / NbodyNum
  print("we in charbody", NbodyNum, "this should be the same as the last Char")
  print(bodyImgTbl)
  --[[
  local NbodyNum = tonumber(bodyNum) --this needs to be an integer
  local bodyImgTbl = playdate.graphics.imagetable.new("assets/".. temp .. "body-table-154-182")--]]
  self:setImage(bodyImgTbl[NbodyNum])
end


--THIS WORKS FINE?
class('CharacterFace').extends(playdate.graphics.sprite)
function CharacterFace:init(exprImgTbl, exprEmote)
    CharacterFace.super.init(self)
    self.exprImgTbl = exprImgTbl
  self:setEmote(exprImgTbl, exprEmote)
end


function CharacterFace:setEmote(nbChar, exprEmote)
  print("we in charface", exprEmote)
  local Nexpr = tonumber(exprEmote)
  local shitfuck = tostring(nbChar)
  
  local exprImgTbl = playdate.graphics.imagetable.new("assets/defaultface-table-154-182")
  --  local exprImgTbl = playdate.graphics.imagetable.new("assets/" .. shitfuck .. "face-table-154-182")


  self:setImage(exprImgTbl[Nexpr])
end

--TODO: try passing on the CHAR to the face/body, and create the image tables in the fucking functions here!! 