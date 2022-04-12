local startMenu = {"Play", "Load", "Gallery"}

local listviewHeight = 36

local listview = playdate.ui.gridview.new(0, 50)
listview.backgroundImage = playdate.graphics.nineSlice.new("nineslice", 5, 6, 44, 40)
listview:setNumberOfRows(#startMenu)
listview:setCellPadding(0, 0, 13, 10)
listview:setContentInset(24, 24, 13, 11)

function listview:drawCell(section, row, column, selected, x, y, width, height)
	
	if selected then
		gfx.setColor(gfx.kColorBlack)
		gfx.drawRoundRect(x, y, width, 20, 4)
		gfx.setImageDrawMode(gfx.kDrawModeFillWhite)
	else
		gfx.setImageDrawMode(gfx.kDrawModeCopy)
	end
	gfx.drawTextInRect(startMenu[row], x, y+6, width, height+2, nil, "...", kTextAlignment.center)
	
end

function help()
    listview:drawInRect(5, 5, 160, 210)
    playdate.timer:updateTimers()
end