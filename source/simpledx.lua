--this should go in pdsnippets

local name = "Name"
local string = "string string lorem ipsum"

class('Dialogues').extends(playdate.graphics.sprite)
function Dialogues:init(name, string)
    Dialogues.super.init(self)
    self.charname = name
    self.Dx = string
    self.dximg = gfx.image.new(self.maxWidth, 800) --???
    self.charimg = gfx.image.new(self.maxWidth, 800)
end

class('Nametext').extends('Dialogues')
function Nametext:init(name)
Nametext.super.init(self, name)
self.charname = name --??
    if self.charname ~= nil then
     gfx.drawText(name, x, y)
    end
end