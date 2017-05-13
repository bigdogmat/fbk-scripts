local function createDescription(sig, description)
  E2Helper.Descriptions[sig] = description
end

--[[---------------------------------------------------------------------------
Function descriptions
-----------------------------------------------------------------------------]]
createDescription("uTimeTotalTime(e:)", "Returns the players total utime second count")
createDescription("suppressChat()" , "Suppresses the last chat message")
createDescription("getPlayerColor(e:)", "Returns the players color")
createDescription("getWeaponColor(e:)", "Returns the players weapon color")
