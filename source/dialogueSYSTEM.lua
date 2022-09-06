import 'sceneselect'

class('Dx5').extends()
function Dx5:init(strings)
    Dx5.super.init(self)
    print(strings)
    self.dx = strings
    self.y = 150
    if strings == nil then
        self.dx = "force"
    end
    
    self.printMeter = 1
    self.kind = ""
   
    
end

function Dx5:Pr1(strings)
    self.printMeter = 1
    local char = string.sub(strings,1,1)
    if char == "@" then
        print("kind to nvl")
    self.kind = "nvl"
    self:printNovel(strings)

    else
        print("kind is default")
        self:Namebox(char)
        
        self.printMeter += 1
    local char = string.sub(strings,self.printMeter,self.printMeter)
        self:Pr2(char, strings)
     -- go to another function to get the numbers for the
     -- image tables....

     -- also rn it prints the prefixes.
    end
end

function Dx5:Pr2(char, strings)
if char == "1" then
    print("body 1")
else
    print("need to finish")
end
self.printMeter += 1
local char = string.sub(strings, self.printMeter, self.printMeter)
self:Pr3(char, strings)
end

function Dx5:Pr3(char, strings)
    if char == "1" then
        print("face 1")
    else
        print("need to finish")
    end
    self.printMeter += 1
    local finalStr = string.sub(strings, self.printMeter, #strings)
    self:Textprint(finalStr)
end


function Dx5:Textprint(strings)
    -- the box
    self.maxWidth = 387 -- this might be for dialogue max width
    self.y = 150
    self.height = 90
    local textbox = nineslice
    gfx.pushContext(textbox)
     textbox:drawInRect(0,self.y,400,self.height)
    gfx.popContext()
    local spritetextbox = gfx.sprite.new(textbox)
    spritetextbox:moveTo(150,150) --0,150
    spritetextbox:add()
    spritetextbox:setZIndex(59)

    -- the text

gfx.pushContext(dximg)
    gfx.drawTextInRect(strings, 13, self.y+10, 340, 400, nil, "...", kTextAlignment.center)
gfx.popContext()

self.spritedx = gfx.sprite.new(dximg)
self.spritedx:add()
self.spritedx:setZIndex(59)

end

function Dx5:Namebox(char)
if char == "@" then
    print("logic error...")
else
    print("namebox char is", char)
    local index = tonumber(char)

    local activeName = {"argh", "blargh", "harg", "darg"}
    print(activeName[index])
    local name = activeName[index] --diff datstypes
    print("name", name)

   -- draw namebox and name.
   local namebox = nineslice
   local nameLength = fonty:getTextWidth(name)
   local nbWidth = nameLength + 20 -- ???
   if nbWidth < 100 then
      nbWidth = 100
   elseif nbWidth > self.maxWidth then
       nbWidth = self.maxWidth
   end
 local nbHeight = 35
 self.height = 90
 self.y = 150
 self.maxWidth = 380


 gfx.pushContext(namebox)
   namebox:drawInRect(0,self.height+nbHeight,nbWidth,nbHeight)
   gfx.drawTextInRect(name,10,self.y-15,self.maxWidth-5,25,nil,"...",kTextAlignment.left)
 gfx.popContext()
 self.spritenamebox = gfx.sprite.new(namebox)
 self.spritenamebox:moveTo(50,50) --50,50
 self.spritenamebox:setZIndex(65)
 self.spritenamebox:add()

end
end

function Dx5:printNovel(strings)
    self.x = 5
    self.nvly = 5
    self.nvlheight = 225 --??
    local nvl = nineslice
    gfx.pushContext(nvl)
      nvl:drawInRect(self.x,self.nvly,390,self.nvlheight)
    gfx.popContext()
    self.spritenvlbox= gfx.sprite.new(nvl)
    self.spritenvlbox:moveTo(0,150)
    self.spritenvlbox:add()

    -- nvl dx

    self.x = 10
    self.nvly = 15
    self.height = 250
    self.maxWidth = 380
    local nvlString = string.sub(strings, 2, #strings) -- to skip the one that calls it a nvl
gfx.pushContext(dximg)
    gfx.drawTextInRect(nvlString, self.x, self.nvly, self.maxWidth, self.height, nil, "...", kTextAlignment.center)
gfx.popContext()
self.spritedx = gfx.sprite.new(dximg)
self.spritedx:add()
self.spritedx:setZIndex(60)

end

function Dx5:tidy()
    print("tidy...")
self.spritedx:remove()
self.spritenvlbox:remove()
playdate.graphics.sprite:removeAll()
if self.kind ~= "nvl" then
self.spritenamebox:remove()
end
end
