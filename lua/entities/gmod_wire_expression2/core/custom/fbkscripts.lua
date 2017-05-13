--[[---------------------------------------------------------------------------
Register extension
-----------------------------------------------------------------------------]]
E2Lib.RegisterExtension("fbkscripts", true)

-- Seems good
__e2setcost(10)

-- Is entity valid and is it a player
local function validPlayer(ply)
  return IsValid(ply) and ply:IsPlayer()
end

--[[---------------------------------------------------------------------------
Returns the players total play time
-----------------------------------------------------------------------------]]
e2function number entity:uTimeTotalTime()
  if not validPlayer(this) then return 0 end
  return this:GetUTimeTotalTime()
end

--[[---------------------------------------------------------------------------
Color functions
-----------------------------------------------------------------------------]]
do
  local function normalizedColorToE2Color(col)
    return {col.r * 255, col.g * 255, col.b * 255}
  end

  --[[---------------------------------------------------------------------------
  Returns the players color
  -----------------------------------------------------------------------------]]
  e2function vector entity:getPlayerColor()
    if not validPlayer(this) then return {0, 0, 0} end
    return normalizedColorToE2Color(this:GetPlayerColor())
  end

  --[[---------------------------------------------------------------------------
  Returns the players weapon color
  -----------------------------------------------------------------------------]]
  e2function vector entity:getWeaponColor()
    if not validPlayer(this) then return {0, 0, 0} end
    return normalizedColorToE2Color(this:GetWeaponColor())
  end
end

--[[---------------------------------------------------------------------------
Try to hack together a hideChat that works on other players into the default system
-----------------------------------------------------------------------------]]
do
  local chipHideChat, hidePly

  __e2setcost(3)
  e2function void suppressChat()
    if not IsValid(self.player) then return end -- If they left and E2 is still running

    -- They aren't mod and aren't the player who triggered the chat event
    if not self.player:CheckGroup "moderator" and not self.player:CheckGroup "admin" and self.player ~= hidePly then return end

    chipHideChat = true
  end

  registerCallback("postinit", function()
    local default = hook.GetTable().PlayerSay.Exp2TextReceiving

    -- Something went wrong (e.g. wiremod updated and changed hook id)
    if not default then return end

    hook.Add("PlayerSay", "Exp2TextReceiving", function(ply, text, teamchat)
      chipHideChat = false
      hidePly = ply

      local result = default(ply, text, teamchat)
      if result ~= nil then return result end

      if chipHideChat then
        return ''
      end
    end)
  end)
end
