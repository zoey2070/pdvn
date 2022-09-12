class('Character').extends(playdate.graphics.sprite)
function Character:init(x,y,nbChar,exprEmote,bodyNum)
    Character.super.init(self, face, body)
    --[[
    self.body = CharacterBody()
    self.face = CharacterFace()
    --]]
    self.x = x
    self.y = y
    if self.x == nil then
      self.x=120
    end
    self.nbChar = nbChar
    self.exprEmote = exprEmote
    self.bodyNum = bodyNum


    self.charf = playdate.graphics.image.new(154, 182)
    self.charf:drawCentered(200, 120) --this line fukt UP

    self:getBody()
    self:getFace()

    gfx.pushContext(self.charf)
    self.face:add()
    self.body:add()
    self.face:moveTo(self.x+5,self.y+5)
    self.body:moveTo(self.x, self.y)
    gfx.popContext()
    --self.face:add()
    local charimg = gfx.sprite.new(self.charf)
    charimg:add()
    charimg:setZIndex(100)
    charimg:moveBy(200,-200) --where is he...
    print("fjjefjn")
  end
-- make them subfunctions so it's self.face again....
function Character:getFace()

--  self.exprImgTbl = exprImgTbl
local faceno = tostring(self.nbChar)

local exprImgTbl = playdate.graphics.imagetable.new("assets/defaultface-table-154-182")
--  local exprImgTbl = playdate.graphics.imagetable.new("assets/" .. faceno .. "face-table-154-182")

local Nexpr = tonumber(self.exprEmote)


self.face = gfx.sprite.new(exprImgTbl[Nexpr])
end


function Character:getBody()
        if self.nbChar == nil then
          print(nbChar, "nil?", "in char body")
          self.nbChar = "1"
        end
        print(self.bodyNum, "bodynum in body")
        local temp = tostring(self.nbChar)
        print(temp,"temp value")
        local NbodyNum = tonumber(self.bodyNum) --this needs to be an integer
    
        local bodyImgTbl = playdate.graphics.imagetable.new("assets/2body-table-154-182")
    
        --self.bodyImgTbl = playdate.graphics.imagetable.new("assets/".. temp .. "body-table-154-182")
        print(bodyImgTbl, NbodyNum, "b4 set img")
    
        --new image
    
        self.body = gfx.sprite.new(bodyImgTbl[NbodyNum])
    end
