local mt = getrawmetatable(game)
setreadonly(mt, false)
local Mouse = game:GetService("Players").LocalPlayer:GetMouse()
getgenv().newIndexFunc = mt.__index
mt.__index = newcclosure(function(self, Index)
    local script = getfenv(2).script
	if not (_G.SaveSettings.AimbotSkill) and
    not (_G.SaveSettings.AutoFarmPlayer) and
    not (_G.SaveSettings.AutoFarmBounty) and
    not UseSkill and
    not USEGUN and
    not (_G.SaveSettings.AutoFarmSeaEvents) and
    not (_G.SaveSettings.AutoFarmSeaEvents) and
    not (_G.SaveSettings.AutoFinishTrail) and
    not (_G.SaveSettings.AutoFarmSeaBeasts) then
		return newIndexFunc(self, Index)
    end
    if Dontaim then
		return newIndexFunc(self, Index)
    end
    if self == Mouse and not checkcaller() then
        if Index == "Target" or Index == "target" then
			local pos
			if _G.SaveSettings.AimbotSkill and _G.TargetPlayerAim ~= nil then
                pos = _G.TargetPlayerAim
            elseif _G.SaveSettings.AutoFarmPlayer and PosCharacter ~= nil then
                pos = PosCharacter
            elseif _G.SaveSettings.AutoFarmBounty and PosCharacterBounty ~= nil then
                pos = PosCharacterBounty
            elseif UseSkill and PosMonMasteryFruit ~= nil and (_G.SaveSettings.AutoFarmFruitsMastery or _G.SaveSettings.AutoFarmBoneMasteryFruits or _G.SaveSettings.AutoFarmCakePiratesMasteryFruits) then
                pos = PosMonMasteryFruit
            elseif USEGUN and PosMonMasteryGun ~= nil and (_G.SaveSettings.AutoFarmGunMastery or _G.SaveSettings.AutoFarmBoneMasteryGun) then
                pos = PosMonMasteryGun
            elseif SeaEventsEnabled and _G.SaveSettings.AutoFarmSeaEvents and SeaEventsPos ~= nil then
                pos = SeaEventsPos
            elseif FindShip and _G.SaveSettings.AutoFarmSeaEvents and ShipPos ~= nil then
                pos = ShipPos
            elseif StartSub and _G.SaveSettings.AutoFinishTrail and SeaBeastPos ~= nil then
                pos = SeaBeastPos
            elseif FindSeabeast and _G.SaveSettings.AutoFarmSeaBeasts and SeaBeastPos ~= nil then
                pos = SeaBeastPos
            end
			return pos
        elseif Index == "Hit" or Index == "hit" then 
			if script.Name == 'Soru' then
				return newIndexFunc(self, Index)
			end
			local pos
			if _G.SaveSettings.AimbotSkill and _G.TargetPlayerAim ~= nil then
                pos = _G.TargetPlayerAim
            elseif _G.SaveSettings.AutoFarmPlayer and PosCharacter ~= nil then
                pos = PosCharacter
            elseif _G.SaveSettings.AutoFarmBounty and PosCharacterBounty ~= nil then
                pos = PosCharacterBounty
            elseif UseSkill and PosMonMasteryFruit ~= nil and (_G.SaveSettings.AutoFarmFruitsMastery or _G.SaveSettings.AutoFarmBoneMasteryFruits or _G.SaveSettings.AutoFarmCakePiratesMasteryFruits) then
                pos = PosMonMasteryFruit
            elseif USEGUN and PosMonMasteryGun ~= nil and (_G.SaveSettings.AutoFarmGunMastery or _G.SaveSettings.AutoFarmBoneMasteryGun) then
                pos = PosMonMasteryGun
            elseif SeaEventsEnabled and _G.SaveSettings.AutoFarmSeaEvents and SeaEventsPos ~= nil then
                pos = SeaEventsPos
            elseif FindShip and _G.SaveSettings.AutoFarmSeaEvents and ShipPos ~= nil then
                pos = ShipPos
            elseif StartSub and _G.SaveSettings.AutoFinishTrail and SeaBeastPos ~= nil then
                pos = SeaBeastPos
            elseif FindSeabeast and _G.SaveSettings.AutoFarmSeaBeasts and SeaBeastPos ~= nil then
                pos = SeaBeastPos
            end
			return pos
        elseif Index == "X" or Index == "x" then 
            return self.X 
        elseif Index == "Y" or Index == "y" then 
            return self.Y 
        elseif Index == "UnitRay" then 
            return Ray.new(self.Origin, (self.Hit - self.Origin).Unit)
        end
    end

    return newIndexFunc(self, Index)
end)
