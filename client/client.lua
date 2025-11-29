
local peds = {}

local function spawn()
    RequestModel("a_f_y_juggalo_01")
    while not HasModelLoaded("a_f_y_juggalo_01") do
        Wait(1)
    end
    RequestModel("a_m_y_juggalo_01")
    while not HasModelLoaded("a_m_y_juggalo_01") do
        Wait(1)
    end
    RequestAnimDict("anim@amb@nightclub@dancers@podium_dancers@")
    while not HasAnimDictLoaded("anim@amb@nightclub@dancers@podium_dancers@") do
        Wait(1)
    end
    for k, v in pairs (Config.locs) do
        local model = nil
        if k % 2 == 0 then
            model = "a_f_y_juggalo_01"
        else
            model = "a_m_y_juggalo_01"
        end
        peds[#peds + 1] = CreatePed(0, model, v.x, v.y, v.z, false, true)
        SetEntityHeading(peds[#peds], v.w)
        FreezeEntityPosition(peds[#peds], true)
        SetEntityInvincible(peds[#peds], true)
        SetBlockingOfNonTemporaryEvents(peds[#peds], true)
        TaskPlayAnim(peds[#peds], "anim@amb@nightclub@dancers@podium_dancers@", "hi_dance_facedj_17_v2_male^5", 8.0, -8.0, -1, 1, 0, false, false, false)
    end
    RequestAnimDict("anim@amb@nightclub@mini@dance@dance_solo@male@var_b@")
    while not HasAnimDictLoaded("anim@amb@nightclub@mini@dance@dance_solo@male@var_b@") do
        Wait(1)
    end
    for k, v in pairs (Config.Performers) do
        local model = 'a_m_y_juggalo_01'
        peds[#peds + 1] = CreatePed(0, model, v.x, v.y, v.z, false, true)
        SetEntityHeading(peds[#peds], v.w)
        FreezeEntityPosition(peds[#peds], true)
        SetEntityInvincible(peds[#peds], true)
        SetBlockingOfNonTemporaryEvents(peds[#peds], true)
        TaskPlayAnim(peds[#peds], "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@", "high_center_up", 8.0, -8.0, -1, 1, 0, false, false, false)
    end
end


CreateThread(function()
    spawn()
end)

AddEventHandler('onResourceStop', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        for k, v in pairs (peds) do
            DeleteEntity(v)
        end
    end
end)
CreateThread(function()
    while true do
      AddExplosion(671.33, 576.01, 129.46, 12, 1.0,true, false, true, 1)
      AddExplosion(692.33, 568.01, 129.46, 12, 1.0,true, false, true, 1)
      AddExplosion(697.71, 566.93, 129.46, 12, 1.0,true, false, true, 1)
      AddExplosion(677.12, 573.12, 129.46, 12, 1.0,true, false, true, 1)
      Wait(8000)
    end
end)