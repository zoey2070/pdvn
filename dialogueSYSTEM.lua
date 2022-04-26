local y = 150
local height = 90
function drawTextbox()
    gfx.clear()
    --local textbox = playdate.ui.gridview.new(0, 15)
  --  textbox = playdate.graphics.nineSlice.new("assets/nineslice", 5, 6, 44, 40)

  local textbox = nineslice
    gfx.pushContext(textbox)
     textbox:drawInRect(0,y,400,height)
    gfx.popContext()
    local spritetextbox = gfx.sprite.new(textbox)
    spritetextbox:moveTo(150,150) --0,150
    spritetextbox:add()
    --spritetextbox:setZIndex(50)

    --drawText()
   -- drawNamebox()
end

function drawText()
  txtMaxWidth = 387
    --this is the max dimensions for rly long texts
    gfx.drawTextInRect("\nhello", 6, y+6, txtMaxWidth, height-6, nil, "...", kTextAlignment.center)

end
--[[
function drawNamebox()
   local namebox = gfx.nineSlice.new("assets/nineslice", 5, 6, 44, 40)
    gfx.pushContext(namebox)
     namebox:drawInRect(0,y+3-(height/2.5),50,20)
    gfx.popContext()
    spritenamebox = gfx.sprite.new(namebox)
    spritenamebox:add()
    spritenamebox:setZIndex(60)
    activeName ="longggg"
    gfx.drawTextInRect(activeName,10,y+5-height/3.5,100,50,nil,"...",kTextAlignment.left)
end
--]]

--[[]]



function drawNamebox()
  --local textbox = playdate.ui.gridview.new(0, 15)
--  textbox = playdate.graphics.nineSlice.new("assets/nineslice", 5, 6, 44, 40)

local namebox = playdate.graphics.nineSlice.new("assets/nineslice", 5, 6, 5, 4)
  gfx.pushContext(namebox)
   namebox:drawInRect(0,y,400,height)
  gfx.popContext()
spritenamebox = gfx.sprite.new(namebox)
  spritenamebox:moveTo(50,50)
  spritenamebox:add()
  spritenamebox:setZIndex(60)

  --drawText()
 -- drawNamebox()
end




--[[

class('Namebox').extends(playdate.graphics.sprite)

function Namebox:init(self)
Namebox.super.init(self)

self:add(spritenamebox)
self:setZIndex(60)
self:moveTo(50,50)
end

--active name was in fctn
function Namebox:update()
    nbWidth = 50 --something something maxwidth based on name
    local namebox = gfx.nineSlice.new("assets/nineslice", 5, 6, 44, 40)
    gfx.pushContext(namebox)
     namebox:drawInRect(0,25,nbWidth,20)
    gfx.popContext()
    spritenamebox = gfx.sprite.new(namebox)
    nbY = y-45
    print("draw namebox")
end
--]]

function drawName() --check how to draw text, the 5 before the "..." was nil?
    gfx.drawTextInRect(activeName,10,10,100,50,nil,"...",kTextAlignment.left)
print("draw name")
  end 

--    gfx.drawTextInRect("name",10,nbY,100,nbWidth,5,"...",kTextAlignment.left)
