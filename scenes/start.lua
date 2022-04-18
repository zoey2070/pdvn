
local startMenu = {"Play", "Load", "Gallery", "Credits"}
local selectedMenu = 1
local listview = playdate.ui.gridview.new(0, 15)
local menuMax = #startMenu


playdate.sound.sample.new(2)
beep = playdate.sound.sampleplayer.new("assets/sound")
blip = playdate.sound.sampleplayer.new("assets/blip2")
local voice = playdate.sound.sampleplayer.new("assets/voicetest")


local geo = playdate.geometry
local Animator = playdate.graphics.animator





function startMenuDraw()
local menuInputHandler = {
    downButtonUp = function()
		listview:selectNextRow(true)
		selectedMenu +=1
		if selectedMenu > menuMax then
			selectedMenu = 1
		end
		drawMenu()
		beep:play(1)
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
		beep:play(1)

	end,
}

listview.backgroundImage = playdate.graphics.nineSlice.new("assets/nineslice", 5, 6, 44, 40)
listview:setNumberOfRows(#startMenu)
listview:setCellPadding(0, 0, 5, 5)
listview:setContentInset(24, 24, 13, 13)

function listview:drawCell(section, row, column, selected, x, y, width, height)

	if selected then
		gfx.setColor(gfx.kColorBlack)
		--change 25 when u change the font!!!
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
		scene = "one"
		gfx.clear()
		--voice:play(5,4)
		playdate.inputHandlers.pop(menuInputHandler)
		sceneSelect(scene)
	elseif selectedMenu == 2 then
		--load
		gfx.clear()
	gfx.drawTextAligned("Loaded! Jk!",1,1,kTextAlignment.left)
		playdate.drawFPS()
		--narrator:moveTo(5,5)
		--so this only runs once, when A is pressed
--[[
		imgtest = gfx.image.new("assets/imgtest")
		spr_img = gfx.sprite.new(imgtest)
		spr_img:moveTo(100,100)
		spr_img:add()

--]]
	elseif selectedMenu == 3 then
		--gallery
		gfx.clear()
		gfx.drawTextAligned("Gallery",1,1,kTextAlignment.left)
		--yeah this still doesn't work
		--addChar()
	elseif selectedMenu == 4 then
		--credits
		gfx.clear()
		gfx.drawTextAligned("Creidts",1,1,kTextAlignment.left)
	else
		--shouldn't ever get here in this menu...
		playdate.simulator.exit()
	end
	blip:play(1)
	function playdate.BButtonUp()
		gfx.clear()
		scene = "start"
		sceneSelect(scene)


	end

end
end

