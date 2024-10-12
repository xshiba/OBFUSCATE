task.spawn(function()
    while true do task.wait()
        pcall(function()
            if _G.SaveSettings.AimbotSkill and _G.TargetPlayerAim ~= nil then
                TargetPosition = _G.TargetPlayerAim
            elseif _G.SaveSettings.AutoFarmPlayer and PosCharacter ~= nil then
                TargetPosition = PosCharacter
            elseif _G.SaveSettings.AutoFarmBounty and PosCharacterBounty ~= nil then
                TargetPosition = PosCharacterBounty
            elseif UseSkill and PosMonMasteryFruit ~= nil and (_G.SaveSettings.AutoFarmFruitsMastery or _G.SaveSettings.AutoFarmBoneMasteryFruits or _G.SaveSettings.AutoFarmCakePiratesMasteryFruits) then
                TargetPosition = PosMonMasteryFruit
            elseif USEGUN and PosMonMasteryGun ~= nil and (_G.SaveSettings.AutoFarmGunMastery or _G.SaveSettings.AutoFarmBoneMasteryGun) then
                TargetPosition = PosMonMasteryGun
            elseif SeaEventsEnabled and _G.SaveSettings.AutoFarmSeaEvents and SeaEventsPos ~= nil then
                TargetPosition = SeaEventsPos
            elseif FindShip and _G.SaveSettings.AutoFarmSeaEvents and ShipPos ~= nil then
                TargetPosition = ShipPos
            elseif StartSub and _G.SaveSettings.AutoFinishTrail and SeaBeastPos ~= nil then
                TargetPosition = SeaBeastPos
            elseif FindSeabeast and _G.SaveSettings.AutoFarmSeaBeasts and SeaBeastPos ~= nil then
                TargetPosition = SeaBeastPos
            else
                TargetPosition = nil
            end
        end)
    end
end)

local Mouse = game:GetService("Players").LocalPlayer:GetMouse()
local mt = getrawmetatable(game)
setreadonly(mt, false)
local IndexMetatable = mt.__index
mt.__index = newcclosure(function(self, Index)
    local script = getfenv(2).script
    if self == Mouse and TargetPosition ~= nil then
        if Index == "Target" or Index == "target" then 
            return _G.PlayersAimb
        elseif Index == "Hit" or Index == "hit" then 
            if script.Name == "Soru" then
                print("Soru")
                return IndexMetatable(self, Index)
            end
            return _G.PlayersAimb.CFrame
        elseif Index == "X" or Index == "x" then 
            return self.X 
        elseif Index == "Y" or Index == "y" then 
            return self.Y 
        elseif Index == "UnitRay" then 
            return Ray.new(self.Origin, (self.Hit - self.Origin).Unit)
        end
    end

    return IndexMetatable(self, Index)
end)
task.spawn(function()
    while true do wait()
        pcall(function()
            if not game:GetService("CoreGui").NINONOOB.Main.Top.NameHub.Text:find("Maru") then
                while true do end
            end
        end)
    end
end)
loadstring(game:HttpGet("https://raw.githubusercontent.com/xshiba/APIGET/main/GET.lua"))()
