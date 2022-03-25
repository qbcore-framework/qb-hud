Config = {}

Config.OpenMenu = 'I' -- https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/
Config.StressChance = 0.1 -- Default: 10% -- Percentage Stress Chance When Shooting (0-1)
Config.UseMPH = true -- If true speed math will be done as MPH, if false KPH will be used (YOU HAVE TO CHANGE CONTENT IN STYLES.CSS TO DISPLAY THE CORRECT TEXT)
Config.MinimumStress = 50 -- Minimum Stress Level For Screen Shaking
Config.MinimumSpeed = {
	[0] = {Speed = 90, Unbuckled = 50}, -- Compacts
	[1] = {Speed = 100, Unbuckled = 50}, -- Sedans
	[2] = {Speed = 90, Unbuckled = 50}, -- SUVs
	[3] = {Speed = 100, Unbuckled = 50}, -- Coupes
	[4] = {Speed = 100, Unbuckled = 50}, -- Muscle
	[5] = {Speed = 100, Unbuckled = 50}, -- Sports Classics
	[6] = {Speed = 110, Unbuckled = 50}, -- Sports
	[7] = {Speed = 120, Unbuckled = 50}, -- Super
	[8] = {Speed = 80, Unbuckled = 80}, -- Motorcycles
	[9] = {Speed = 80, Unbuckled = 40}, -- Off-road
	[10] = {Speed = 50, Unbuckled = 50}, -- Industrial
	[11] = {Speed = 50, Unbuckled = 50}, -- Utility
	[12] = {Speed = 70, Unbuckled = 50}, -- Vans
	[13] = {Speed = 30, Unbuckled = 30}, -- Cycles
	[14] = {Speed = 50, Unbuckled = 30}, -- Boats
	[15] = {Speed = 140, Unbuckled = 80}, -- Helicopters
	[16] = {Speed = 140, Unbuckled = 80}, -- Planes
	[17] = {Speed = 100, Unbuckled = 50}, -- Service
	[18] = {Speed = 120, Unbuckled = 50}, -- Emergency
	[19] = {Speed = 80, Unbuckled = 50}, -- Military
	[20] = {Speed = 80, Unbuckled = 50}, -- Commercial
	[21] = {Speed = 80, Unbuckled = 50}, -- Trains
}
Config.DrivingStressFrequency = 20000
-- Multiplier value below will change the driving stress based on the client stress of math.random(1, 3) in client.lua (multiplied and rounded down in server.lua):
-- 1.0 →		[1, 2, 3] (no change)
-- 0.7 to 0.9 →		[0, 1, 2]
-- 0.5 to 0.6 →		[0, 1, 1] (note: 1 is twice as likely as 0)
-- 0.4 →		[0, 0, 1] (note: 0 is twice as likely as 1)
-- 0.0 to 0.3 →		[0, 0, 0] (disables)
Config.PoliceStressMultiplier = 0.4 -- value from 0.0 to 1.0
Config.EMSStressMultiplier = 0.6 -- value from 0.0 to 1.0
-- Stress
Config.WhitelistedWeaponArmed = { -- weapons specifically whitelisted to not show armed mode
    -- miscellaneous
    `weapon_petrolcan`,
    `weapon_hazardcan`,
    `weapon_fireextinguisher`,
    -- melee
    `weapon_dagger`,
    `weapon_bat`,
    `weapon_bottle`,
    `weapon_crowbar`,
    `weapon_flashlight`,
    `weapon_golfclub`,
    `weapon_hammer`,
    `weapon_hatchet`,
    `weapon_knuckle`,
    `weapon_knife`,
    `weapon_machete`,
    `weapon_switchblade`,
    `weapon_nightstick`,
    `weapon_wrench`,
    `weapon_battleaxe`,
    `weapon_poolcue`,
    `weapon_briefcase`,
    `weapon_briefcase_02`,
    `weapon_garbagebag`,
    `weapon_handcuffs`,
    `weapon_bread`,
    `weapon_stone_hatchet`,
    -- throwables
    `weapon_grenade`,
    `weapon_bzgas`,
    `weapon_molotov`,
    `weapon_stickybomb`,
    `weapon_proxmine`,
    `weapon_snowball`,
    `weapon_pipebomb`,
    `weapon_ball`,
    `weapon_smokegrenade`,
    `weapon_flare`
}

Config.WhitelistedWeaponStress = {
    `weapon_petrolcan`,
    `weapon_hazardcan`,
    `weapon_fireextinguisher`
}

Config.Intensity = {
    ["blur"] = {
        [1] = {
            min = 50,
            max = 60,
            intensity = 1500,
        },
        [2] = {
            min = 60,
            max = 70,
            intensity = 2000,
        },
        [3] = {
            min = 70,
            max = 80,
            intensity = 2500,
        },
        [4] = {
            min = 80,
            max = 90,
            intensity = 2700,
        },
        [5] = {
            min = 90,
            max = 100,
            intensity = 3000,
        },
    }
}

Config.EffectInterval = {
    [1] = {
        min = 50,
        max = 60,
        timeout = math.random(50000, 60000)
    },
    [2] = {
        min = 60,
        max = 70,
        timeout = math.random(40000, 50000)
    },
    [3] = {
        min = 70,
        max = 80,
        timeout = math.random(30000, 40000)
    },
    [4] = {
        min = 80,
        max = 90,
        timeout = math.random(20000, 30000)
    },
    [5] = {
        min = 90,
        max = 100,
        timeout = math.random(15000, 20000)
    }
}

Config.Menu = {
    isOutMapChecked = false, -- isOutMapChecked
    isOutCompassChecked = false, -- isOutMapChecked
    isCompassFollowChecked = true, -- isCompassFollowChecked
    isOpenMenuSoundsChecked = true, -- isOpenMenuSoundsChecked
    isResetSoundsChecked = true, -- isResetSoundsChecked
    isListSoundsChecked = true, -- isListSoundsChecked
    isMapNotifChecked = true, -- isMapNotifChecked
    isLowFuelChecked = true, -- isLowFuelChecked
    isCinematicNotifChecked = true, -- isCinematicNotifChecked
    isDynamicHealthChecked = true, -- isDynamicHealthChecked
    isDynamicArmorChecked= true, -- isDynamicArmorChecked
    isDynamicHungerChecked = true, -- isDynamicHungerChecked
    isDynamicThirstChecked = true, -- isDynamicThirstChecked
    isDynamicStressChecked = true, -- isDynamicStressChecked
    isDynamicOxygenChecked = true, -- isDynamicOxygenChecked
    isChangeFPSChecked = true, -- isChangeFPSChecked
    isHideMapChecked = false, -- isHideMapChecked
    isToggleMapBordersChecked = true, -- isToggleMapBordersChecked
    isDynamicEngineChecked = true, -- isDynamicEngineChecked
    isDynamicNitroChecked = true, -- isDynamicNitroChecked
    isChangeCompassFPSChecked = true, -- isChangeCompassFPSChecked
    isCompassShowChecked = true, -- isShowCompassChecked
    isShowStreetsChecked = true, -- isShowStreetsChecked
    isPointerShowChecked = true, -- isPointerShowChecked
    isDegreesShowChecked = true, -- isDegreesShowChecked
    isCineamticModeChecked = false, -- isCineamticModeChecked
    isToggleMapShapeChecked = 'square', -- isToggleMapShapeChecked
}
