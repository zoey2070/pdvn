


local selectedGrid = 0

-- right list view --

--local listFont = gfx.font.new('Roobert-11-Mono-Condensed')
--listFont:setTracking(1)

local listviewHeight = 36

local menuOptions = {"Sex","Steamy Sex","Why","isn't","this","working",}

local listview = playdate.ui.gridview.new(0, 10)
listview.backgroundImage = playdate.graphics.nineSlice.new("nineslice", 5, 6, 44, 40)
listview:setNumberOfRows(#menuOptions)
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
	gfx.setFont(listFont)
	gfx.drawTextInRect(menuOptions[row], x, y+6, width, height+2, nil, "...", kTextAlignment.center)
	
end
-- list view animation --

-- all that needs to be done is to animate the height at which the listview is drawn
-- because its background image is a nineslice, it redraws correctly at different sizes

local listviewTimer = nil


local function animateListviewOpen()
	
	listviewTimer = playdate.timer.new(300, listviewHeight, 200, playdate.easingFunctions.outCubic)
	
	listviewTimer.updateCallback = function(timer)
		listviewHeight = timer.value
	end
	
	listviewTimer.timerEndedCallback = function(timer)
		listviewHeight = timer.value
		listviewTimer = nil
	end
end


local function animateListviewClosed()

	listviewTimer = playdate.timer.new(300, listviewHeight, 36, playdate.easingFunctions.outCubic)
	
	listviewTimer.updateCallback = function(timer)
		listviewHeight = timer.value
	end
	
	listviewTimer.timerEndedCallback = function(timer)
		listviewHeight = timer.value
		listviewTimer = nil
	end
end


local function toggleSelection()
	
	if selectedGrid == 0 then
		selectedGrid = 1
		animateListviewOpen()
	else
		selectedGrid = 0
		animateListviewClosed()
	end
end



-- buttons --

function playdate.AButtonUp()
	toggleSelection()
end

function playdate.BButtonUp()
	toggleSelection()
end


function playdate.upButtonUp()

	if selectedGrid == 0 then
		gridview:selectPreviousRow(true)
	else
		listview:selectPreviousRow(false)
	end

end

function playdate.downButtonUp()

	if selectedGrid == 0 then
		gridview:selectNextRow(true)
	else
		listview:selectNextRow(false)
	end
	
end

function playdate.leftButtonUp()

	if selectedGrid == 0 then
		gridview:selectPreviousColumn(true)
	end

end

function playdate.rightButtonUp()

	if selectedGrid == 0 then
		gridview:selectNextColumn(true)
	end
end



-- main update function --

function playdate.update()
	
	playdate.timer.updateTimers()
	
	-- draw the right side list view (clear the area first to avoid animation smudges)
	gfx.setColor(gfx.kColorWhite)
	gfx.fillRect(220, 20, 160, 200)
	listview:drawInRect(220, 20, 160, listviewHeight)
	end

gurgle = {
	var1,
	var2,
	var3
}

playdate.datastore.write( gurgle, "highscore" )

gurgle[1] = opt

printTable(gurgle)
playdate.datastore.read( "highscore" )


opt = playdate.ui.gridview:setSelection()
