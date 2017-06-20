--[[---------------------------------------------------------------------------
ULX Godmode fix
-----------------------------------------------------------------------------]]
hook.Add("PlayerSpawn", "FBK.GodmodeFix", function(ply)
  if ply.ULXHasGod then
    ply:GodEnable()
  end
end)
