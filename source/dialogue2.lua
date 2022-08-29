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
    self.dximg = gfx.image.new(self.maxWidth, 800)

end

function Dialogues:draw()
    --make the dialogues a sprite.
    
  gfx.pushContext(dximg)
      gfx.drawTextInRect(self.Dx, 13, self.y+10, self.maxWidth, self.height-6, nil, "...", kTextAlignment.center)
  gfx.popContext()
  self.spritedx = gfx.sprite.new(dximg)


  if self.charname ~= nil then -- and this is for the name.
    gfx.pushContext(nameimg)
       gfx.drawTextInRect(self.charname,10,self.y-15,self.maxWidth-5,25,nil,"...",kTextAlignment.left)
    gfx.popContext()
    self.spritename = gfx.sprite.new(nameimg)
    print("draw name")
      end
end
