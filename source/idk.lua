class('printer').extends()
function printer:init()
printer.super.init(self)





self.printMeter = 1
self.linePos = 1
self.kind = ""



self.nvlimg = playdate.graphics.image.new(400, 240)

end


class('Dx5').extends('printer')
function Dx5:init(strings, names, expr, body, position)
    Dx5.super.init(self)
    
    self.y = 150
    self.pos = position
    self.strings = strings
	self.names = names
	self.expressions = expr
	self.body = body
    self.aAllowed = false
    self.printing = true
    self.initprint = false



    print(self.strings, "print self.string")
    print("print str", self.strings[1], "lines:", #self.strings)

    self.nboximg = playdate.graphics.image.new(400, 240)
    self.tboximg = playdate.graphics.image.new(400,240)
    if strings == nil then
        print("bruh something's broke")
        self.dx = "force"
    else
        
    printer:continue()

    end
   
    
end




function printer:continue()-- gets current dialogue

    print(self.strings, "da strings") --why is this nil????

    self.dx = self.strings[self.linePos]
	self.currname = self.names[self.linePos]
	self.currexpr = self.expr[self.linePos]
	self.currbody = self.body[self.linePos]
	self.currpos = self.pos[self.linePos]

    print(self.aAllowed, "a.allowed in continue") ---- !!!!!!!!
    print(self.printMeter, "print meter in main ctn") 


    if self.printMeter == 4 then --then it is done printing.
        self.aAllowed = true
        self.linePos += 1
        self.dx = self.strings[self.linePos]
        print(self.linePos)
        self.printMeter = 1 --resets....
        self.printing = false --??? 

        --if self.aAllowed == true and playdate.buttonIsPressed(playdate.kButtonA) then 
            --why is this in here if it's in update? 
        self:Pr1() --shouldn't need da strings if we got self.dx
       -- end
    end

end
