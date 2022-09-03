--IT'S PERFECT DON'T TOUCH!!!
-- displays the text and name boxes

class('Textboxes').extends(playdate.graphics.sprite)
function Textboxes:init(name, kind)
    Textboxes.super.init(self)
    self.name = name
    self.kind = kind
    self.maxWidth = 387 -- this might be for dialogue max width
    self.y = 150
    self.height = 90
end

--draws the dialogue box
class('Dxbox').extends('Textboxes')
function Dxbox:init(kind)
Dxbox.super.init(self, kind)
self.kind = kind
    if self.kind == "nvl" then -- this would be for a longer box...
      self.x = 5
      self.nvly = 5
      self.nvlheight = 225 --??
      local nvl = nineslice
      gfx.pushContext(nvl)
        nvl:drawInRect(self.x,self.nvly,390,self.nvlheight)
      gfx.popContext()
      local spritenvlbox= gfx.sprite.new(nvl)
--[[ size changes
      local minimumheight = 80
      local maximumheight = 750
        if self.nvlheight < minimumheight then
            self.nvlheight = minimumheight
         elseif self.nvlheight > maximumheight then
            self.nvlheight = maximumheight
      end
      --]]
      spritenvlbox:moveTo(0,150)
      spritenvlbox:add()

    else -- not nvl
      local textbox = nineslice
      gfx.pushContext(textbox)
       textbox:drawInRect(0,self.y,400,self.height)
      gfx.popContext()
      local spritetextbox = gfx.sprite.new(textbox)
      spritetextbox:moveTo(150,150) --0,150
      spritetextbox:setZIndex(59)
      --spritetextbox:add()
    end

end

-- draws both the namebox and the name
class('Namebox').extends('Textboxes')
function Namebox:init(name, kind)
 Namebox.super.init(self, name, kind)
 self.name = name
 self.kind = kind
 if self.kind ~= "nvl" and self.name ~= nil then
          local namebox = nineslice
          local nameLength = fonty:getTextWidth(self.name)
          local nbWidth = nameLength + 20 -- ???
          if nbWidth < 100 then
             nbWidth = 100
          elseif nbWidth > self.maxWidth then
              nbWidth = self.maxWidth
          end
        local nbHeight = 35
        gfx.pushContext(namebox)
          namebox:drawInRect(0,self.height+nbHeight,nbWidth,nbHeight)
          gfx.drawTextInRect(self.name,10,self.y-15,self.maxWidth-5,25,nil,"...",kTextAlignment.left)
        gfx.popContext()
        local spritenamebox = gfx.sprite.new(namebox)
        spritenamebox:moveTo(50,50) --50,50
        spritenamebox:setZIndex(60)
        elseif self.name == nil or self.kind == "nvl" then
          print("no box pls")
        else
          print("error")
        end
        --if kind is nvl OR there is no name
  end



function Textboxes:draw()
    gfx.pushContext(TB)
    Dxbox(self.kind)
    Namebox(self.name, self.kind)
    gfx.popContext()
  local spritebox = gfx.sprite.new(TB)
  spritebox:add()
  spritebox = playdate.graphics.image:vcrPauseFilterImage()
  --self:setImage(spritebox)
  --self:add()
  -- idk the difference
end