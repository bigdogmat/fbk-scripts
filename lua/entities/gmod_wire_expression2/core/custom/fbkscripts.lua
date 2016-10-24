--[[------------------------------------------------------------------------------------------------
Register extension
--------------------------------------------------------------------------------------------------]]
E2Lib.RegisterExtension("fbkscripts", true)

--[[------------------------------------------------------------------------------------------------
Utility function cost
--------------------------------------------------------------------------------------------------]]
__e2setcost(10)

--[[------------------------------------------------------------------------------------------------
Name:   uTimeTotalTime
Type:   method - entity
Return: number
--------------------------------------------------------------------------------------------------]]
e2function number entity:uTimeTotalTime()
  if not IsValid(this) then return 0 end
  if not this:IsPlayer() then return 0 end

  return this:GetUTimeTotalTime()
end