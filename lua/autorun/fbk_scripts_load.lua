AddCSLuaFile()

--[[---------------------------------------------------------------------------
Create table and version
-----------------------------------------------------------------------------]]
FBK = FBK or {
  Version = "1.0.3",
}

--[[---------------------------------------------------------------------------
Include files
-----------------------------------------------------------------------------]]
include "fbk_scripts/sv_init.lua"

--[[---------------------------------------------------------------------------
Get the current version
-----------------------------------------------------------------------------]]
if CLIENT then
  concommand.Add("fbk_scripts_version", function()
    print("Running version: " .. FBK.Version)
  end)
end
