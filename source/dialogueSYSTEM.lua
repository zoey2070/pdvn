import 'sceneselect'
class('Dx5').extends()
function Dx5:init(strings,dxpos)
    Dx5.super.init(self, strings)
    self.linePos = 1
    self.y = 150
    self.pos = dxpos
    self.printMeter = 1
    self.kind = ""


    self.aAllowed = false
    self.printing = true
    self.initprint = false



    
    print("print str", strings[1], "lines:", #strings)

    self.nvlimg = playdate.graphics.image.new(400, 240)
    self.nboximg = playdate.graphics.image.new(400, 240)
    self.tboximg = playdate.graphics.image.new(400,240)
    if strings == nil then
        print("bruh something's broke")
        self.dx = "force"
    else
        print("wya")
    self:continue(strings)

    end
   
    
end

function Dx5:Pr1()
    --self.printMeter = 1
   -- print("pr1", strings[self.linePos])
   print(self.dx)
    local char = string.sub(self.dx,1,1)
    if char == "@" then
        print("kind to nvl")
    self.kind = "nvl"
    self:printNovel(self.dx)
    else
        self.kind = nil
        print("kind is nil")
        local nbChar = char
        self:Namebox(char)
        self.printMeter += 1
        print(self.printMeter, "Pr1")
        local nchar = string.sub(self.dx,self.printMeter,self.printMeter)
        self:Pr2(nchar, nbChar)
     -- go to another function to get the numbers for the
     -- image tables....
    end
    
end

function Dx5:Pr2(char, nbChar)
    print("nbchar", nbChar) --this returns 3.
--if nbChar == "1" then --so this would just be equal to the name....
    --if we just concactenate do we even need this if statement?
      local bodyName = tostring(nbChar) --THIS NEEDS TO BE A STRING, NOT A #
      print(bodyName, "bodyname before stringed")

        --if this works it's ogre.



        print(char, "char body")
        print(bodyName, "bodyname")

    self.printMeter += 1
    local char3 = string.sub(self.dx, self.printMeter, self.printMeter)

        if self.pos ~= nil then
self.pos = 120
end
local narrator = Character(self.pos,-60,nbChar, char3, char)
narrator:setZIndex(65)
narrator:add()
self.printMeter += 1
local finalStr = string.sub(self.dx, self.printMeter, #self.dx)
self:Textprint(finalStr)

end
--[[
function Dx5:Pr3(char, nbChar)
    print("nbchar PR3", nbChar)
    local exprName = nbChar
    print(exprName, "exprName")

--WHYYYYYYYYY DOES THIS WORK
    narratorF = CharacterFace(exprName, char) -- ??
    --if self.pos ~= nil then
    --Character:moveTo(self.pos,120)
--else
    Character:moveTo(120,120) --defaults if no pos.
--end
   Character:add() --narrator()


    self.printMeter += 1
    local finalStr = string.sub(self.dx, self.printMeter, #self.dx)
    self:Textprint(finalStr)
end
--]]

function Dx5:Textprint(finalStr)
    -- the box
    self.maxWidth = 387 -- this might be for dialogue max width
    self.y = 150
    self.height = 90
    local textbox = nineslice
    self.tboximg:drawCentered(200, 120)
    gfx.pushContext(self.tboximg)
     textbox:drawInRect(0,self.y,400,self.height)
     gfx.drawTextInRect(finalStr, 13, self.y+10, 340, 400, nil, "...", kTextAlignment.center)
    gfx.popContext()
    self.spritetextbox = gfx.sprite.new(self.tboximg)
    self.spritetextbox:moveTo(200,120) --0,150
    self.spritetextbox:add()
    self.spritetextbox:setZIndex(59)
    self.kind = ""

    print("printmeter", self.printMeter)
    --this should be where it ends for each dx.
end

function Dx5:Namebox(char)
if char == "@" then
    print("logic error...")
else
    print("namebox char is", char)
    local index = tonumber(char)

    local activeName = {"argh", "blargh", "HAAAAAAAAAARGH", "darg"}
    print(activeName[index])
    local name = activeName[index] --diff datstypes
    print("name", name)
    self.maxWidth = 380

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

 self.nboximg:drawCentered(200, 120)
 gfx.pushContext(self.nboximg)
   namebox:drawInRect(0,self.height+nbHeight,nbWidth,nbHeight)
   gfx.drawTextInRect(name,10,self.y-15,self.maxWidth-5,25,nil,"...",kTextAlignment.left)
 gfx.popContext()
 self.spritenamebox = gfx.sprite.new(self.nboximg)
 self.spritenamebox:moveTo(200,121) --50,50
 self.spritenamebox:setZIndex(60)
 self.spritenamebox:add()

end
end

function Dx5:printNovel()
    --vars for box
    self.x = 5
    self.nvly = 5
    self.nvlheight = 225 --??
    -- vars for text
    self.txtx = 10
    self.nvltxty = 15
    self.height = 250
    self.maxWidth = 380
    self.nvlimg:drawCentered(200, 120)
    
    local nvlString = string.sub(self.dx, 2, #self.dx) -- to skip the one that calls it a nvl

    local nvl9 = nineslice
    gfx.pushContext(self.nvlimg)
      nvl9:drawInRect(self.x,self.nvly,390,self.nvlheight)
      gfx.drawTextInRect(nvlString, self.txtx, self.nvltxty, self.maxWidth, self.height, nil, "...", kTextAlignment.center)
    gfx.popContext()

self.spritenvl = gfx.sprite.new(self.nvlimg)
self.spritenvl:moveTo(200,120)
self.spritenvl:add()
self.printMeter += 1

end

function Dx5:tidy()
    print("tidy...")
    print("n sprites:" .. gfx.sprite.spriteCount())
    if self.kind == "nvl" then
self.spritenvldx:remove()
self.spritenvlbox:remove()
print("tidy nvl")
playdate.graphics.sprite:removeAll()
    elseif self.kind ~= "nvl" then
self.spritenamebox:remove()
self.spritedx:remove()
self.spritetextbox:remove()
playdate.graphics.sprite.removeSprite(self.spritenamebox)
print("tidy reg")
end
print("n sprites:" .. gfx.sprite.spriteCount())

end

function Tidy2()
    playdate.graphics.sprite:getAllSprites()

playdate.graphics.sprite:removeAll()
end



function Dx5:continue(strings)-- gets current dialogue

    self.dx = strings[self.linePos]

    if  self.initprint ~= true then
        self:Pr1()
        self.initprint = true
    end

    if self.aAllowed == true then --need more logik
      print("press A pls")

        
    end


    if self.printing == true and self.initprint == true then

        self.linePos += 1
        self.dx = strings[self.linePos]
        print(self.linePos)
        self:Pr1() --shouldn't need da strings if we got self.dx
        self.printing = false
        
    end
--
    if self.printMeter >= 4 then --it should just stop AT 4...
        self.aAllowed = true
print(self.printMeter)
--        self.printMeter = 1
    end
        -- prints current dialogue
        --self.printMeter = 1 -- so this should just reset it and do initial print forever??
      --bro this'll just keep GOING
   --[[elseif self.initprint == false and self.printMeter == 1 then --maybe add another var...
        print("initial print")
        self.initprint = true
        self:update(strings)
    else
        self:new(strings)
    end--]]



    if self.linePos <= #strings then
        self.printing = true
    elseif self.linePos > #strings then --check logic here
        self.aAllowed = false
        self.linePos = 1
        --reset...
    print("we outta lines...")
    else
        print("bro i'm so lost")
        end


end

function Dx5:update()
  --  self.dx = strings[self.linePos] 
if self.initprint == true then --bro this just loops. we found it
    self:continue()
end
Tidy2()
print("running update", self.aAllowed) --why is this returning nil?

        if self.aAllowed == true and playdate.buttonIsPressed(playdate.kButtonA) then
                print("pressed A")
                self.printing = true
                self.aAllowed = false
        end
end