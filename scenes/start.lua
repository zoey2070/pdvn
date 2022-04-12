
local startMenu = {"Play", "Load", "Gallery", "Credits"}
local selectedMenu = 1
local listview = playdate.ui.gridview.new(0, 15)
local menuMax = #startMenu

function startMenuDraw()


local menuInputHandler = {
    downButtonUp = function()
		listview:selectNextRow(true)
		selectedMenu +=1
		if selectedMenu > menuMax then
			selectedMenu = 1
		end
		drawMenu()
    end,

	upButtonUp = function()
		listview:selectPreviousRow(true)
		selectedMenu -=1
		if selectedMenu < 1 then
			selectedMenu = menuMax
		end
		--debugging:
		print(selectedMenu)
		--end debug
		drawMenu()
	end,
}

listview.backgroundImage = playdate.graphics.nineSlice.new("nineslice", 5, 6, 44, 40)
listview:setNumberOfRows(#startMenu)
listview:setCellPadding(0, 0, 5, 5)
listview:setContentInset(24, 24, 13, 13)

function listview:drawCell(section, row, column, selected, x, y, width, height)

	if selected then
		gfx.setColor(gfx.kColorBlack)
		--change 22 when u change the font!!!
		gfx.drawRoundRect(x, y, width, 25, 10)
		--gfx.setImageDrawMode(gfx.kDrawModeFillWhite)
	else
		gfx.setImageDrawMode(gfx.kDrawModeCopy)
	end


	gfx.drawTextInRect(startMenu[row], x, y+5, width, height+5, nil, "...", kTextAlignment.center)
end

function drawMenu()
	playdate.inputHandlers.push(menuInputHandler)

    listview:drawInRect(50, 50, 200, 150)
	
    playdate.timer:updateTimers()
end

function playdate.AButtonUp()
	if selectedMenu == 1 then
		scene = "1"

	elseif selectedMenu == 2 then
		--load
		playdate.drawFPS()
	elseif selectedMenu == 3 then
		--gallery
		print(YEAH)
	elseif selectedMenu == 4 then
		--credits
		print(NAH)
	else
		--shouldn't ever get here in this menu...
		playdate.simulator.exit()
	end

end
end

