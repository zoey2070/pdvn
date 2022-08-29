--wip

function Dialogue:init(stringSeries, promptOptions, promptAnswers)
	Dialogue.super.init(self)
	--initialize animators and animator variables
	self.prompts = promptOptions
	self.strings = stringSeries
	self.answer = promptAnswers
    self.linePos = 1
    self.queryContinue = true
    self.playerInput = false
end

function Dialogue:printDx()
    
	if self.linePos <= #self.strings and self.queryContinue == true then
		self:printText(self.strings[self.linePos]) --this line is from the printer...
	elseif  self.linePos == #self.strings + 1 and self.queryContinue == true then
        self.linePos += 1
    end
end

function Dialogue:update()
    self:printDx()
    
	if self.playerInput == true and playdate.buttonJustPressed(playdate.kButtonA) then
		self.queryContinue = true
		self.playerInput = false
	end
end