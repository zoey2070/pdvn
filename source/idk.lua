

textbox = gfx.sprite.new()
textbox:setSize(220, 180)
textbox:moveTo(200, 120)
textbox:setZIndex(900)
textbox.text = "" -- this is blank for now; we can set it at any point
textbox.currentChar = 1 -- we'll use these for the animation
textbox.currentText = ""
textbox.typing = true



function textbox:update()
	
	self.currentChar = self.currentChar + 1
	if self.currentChar > #self.text then
		self.currentChar = #self.text
	end
	
	if self.typing and self.currentChar <= #self.text then
		textbox.currentText = string.sub(self.text, 1, self.currentChar)		
		self:markDirty() -- this tells the sprite that it needs to redraw
	end
	
	-- end typing
	if self.currentChar == #self.text then
		self.currentChar = 1
		self.typing = false		
	end	
end


function textbox:draw()
	
	-- pushing context means, limit all the drawing config to JUST this block
	-- that way, the colors we set etc. won't be stuck
	gfx.pushContext()
		-- draw the text!
		gfx.drawTextInRect(self.currentText, 10, 10, 200, 160)
		print("drawing")
	
	gfx.popContext()
	
end