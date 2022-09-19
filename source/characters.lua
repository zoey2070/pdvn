class('Spot').extends('CharTemplate')
function Spot:init(x,y,expr,body)
local chname = "Spot"
Spot.super.init(self,x,y,expr,body,chname)
end