RegisterCommand("vehicle", function(source, args)
    -- /vehicle spawn <car>
    local category = args [1]
    if category == "spawn" then
        local vehicle =args [2]
        local carPaint = colors.metal ["Pure Gold"] -- 158
        local veh =spawnveh (vehicle, true)
        setVehicleColours (veh,carPaint,carPaint)
    elseif category == "customize" then
        local veh = GetVehiclePedIsIn (PlayerPedId(), false)
        SetVehicleModKit (veh, 0)
        for modType = 0, 10, 1 do
            local bestMod = GetNumVehicleMods(veh, modType)-1
            setVehicleMod (veh, modType, bestMod, false)
        end
    elseif category == "extras" then -- /vehicle extras 
        local veh = GetVehiclePedIsIn (PlayerPedId(), false)
         for id=0, 20 do
            if DoesExtraExist (veh, id) then
                SetVehicleExtra(veh, id, 1)
            end
        end
elseif category == "repair" then
    local veh = GetVehiclePedIsIn (PlayerPedId(), false)
    SetVehicleFixed(veh)
    SetVehicleEngineHealth(veh, 1000.0)
elseif category == "doors" then
    local veh = GetVehiclePedIsIn (PlayerPedId(), false)
    local  closed =getVehicleDoorAngleRatio(veh, 0) < 0.1
    if closed then
        for i=0, 7, 1 do
            SetVehicleDoorOpen (veh, i, false, false)
        end
    else
        SetVehicleDoorShut(veh, false)
end
elseif category == "upgrade" then
    local veh = GetVehiclePedIsIn (PlayerPedId(), false)
    local colors = colors.matte ["Red"]
    local ourSelection = {
        ["Armour"] = "Armour Upgrade 100%",
        ["Engine"] = "EMS Upgrade, Level 4 ",
        ["Transmission"] = "Race Transmission",
        ["Suspension"] ="Commpettion Suspension",
        ["Horn"] ="Stock Horn",
        ["Brakes"] ="Race Brakes",
        ["Lights"] = "Xenon lights",
        ["Turbo"] = "Turbo Tuning",
    }
    SetVehicleModKit (veh, 0)
    for K,v in pairs (ourSelection) do
       local modtype = upgrades [k].type
       local mod = upgrades [k].type[v].index
       ApplyVehicleMod(veh, modType, mod)
    end
    setVehicleColours(veh, color, color)
    ToggleVehicleMod(veh, upgrades["Lights"].type, true )
    SetVehicleXenonLightscoolour(veh, upgrades["Lights"].xenonHeadLightColors["Red"].index)
    end
  end
 end)