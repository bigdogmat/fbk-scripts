AddCSLuaFile()

--[[---------------------------------------------------------------------------
Create table and version
-----------------------------------------------------------------------------]]
if FBK then return end
FBK = {}
FBK.Version = "1.0.1"

--[[---------------------------------------------------------------------------
Get the current version
-----------------------------------------------------------------------------]]
if CLIENT then
  concommand.Add("fbk_scripts_version", function()
    print("Running version: " .. FBK.Version)
  end)
end
