class('Textboxes').extends(playdate.graphics.sprite)
function Textboxes:init(name, string)
    Textboxes.super.init(self)
    self.name = name
    self.dialogue = string
    self.maxWidth = 387 -- this might be for dialogue max width
    self.y = 150
    self.height = 90
end

function Textboxes:draw()
  local textbox = nineslice
    gfx.pushContext(textbox)
     textbox:drawInRect(0,self.y,400,self.height)
    gfx.popContext()
    local spritetextbox = gfx.sprite.new(textbox)
    spritetextbox:moveTo(150,150) --0,150
    spritetextbox:add()
    spritetextbox:setZIndex(59)

print("drew txtbox")
    if self.name ~= nil then
        print("draw namebox??")
  local namebox = nineslice
  local nbWidth = 100
  local nbHeight = 35
  gfx.pushContext(namebox)
  namebox:drawInRect(0,self.height+nbHeight,nbWidth,nbHeight)
  gfx.popContext()
  spritenamebox = gfx.sprite.new(namebox)
  spritenamebox:moveTo(50,50) --50,50
  spritenamebox:add()
  spritenamebox:setZIndex(60)
    end
end

class('Text').extends(Textboxes)
function Text:init(name, string) --what we're inputting would go inside the init()
    Text.super.init(self)
  self.name = name
  self.dialogue = string
    self.maxWidth = 385
    self.y = 150
    self.height = 90
end

function Text:draw()
--this is for Dialogue
gfx.drawTextInRect(self.dialogue, 13, self.y+10, self.maxWidth, self.height-6, nil, "...", kTextAlignment.center)
if self.name ~= nil then -- and this is for the name.
    gfx.drawTextInRect(self.name,10,self.y-15,100,50,nil,"...",kTextAlignment.left)
    print("draw name")
      end
end