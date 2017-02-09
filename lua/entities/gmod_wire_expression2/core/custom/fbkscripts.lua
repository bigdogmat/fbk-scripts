--[[---------------------------------------------------------------------------
Register extension
-----------------------------------------------------------------------------]]
E2Lib.RegisterExtension("fbkscripts", true)

--[[---------------------------------------------------------------------------
Utility function cost
-----------------------------------------------------------------------------]]
__e2setcost(10)

--[[---------------------------------------------------------------------------
Name:   uTimeTotalTime
Type:   method - entity
Return: number
-----------------------------------------------------------------------------]]
e2function number entity:uTimeTotalTime()
  if not IsValid(this) then return 0 end
  if not this:IsPlayer() then return 0 end

  return this:GetUTimeTotalTime()
end

--[[---------------------------------------------------------------------------
Try to hack together a hideChat that works on other players into the default system
-----------------------------------------------------------------------------]]
do
  local chipHideChat, hidePly

  __e2setcost(3) -- Not much here

  e2function void suppressChat()
    if not IsValid(self.player) then return end -- If they left and E2 is still running

    -- They aren't mod and aren't the player who triggered the chat event
    if not self.player:CheckGroup "moderator" and self.player ~= hidePly then return end

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
