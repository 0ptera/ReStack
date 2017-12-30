-- Get ammo by category and set stack size
local function SetByAmmoCategory(type, stack_size)
  for _, ammo in pairs(data.raw.ammo) do
    if ammo.ammo_type.category == type then
      ammo.stack_size = stack_size
      log("[RS] Setting "..tostring(type).."."..tostring(ammo.name)..".stack_size "..stack_size)
    end
  end
end

SetByAmmoCategory("bullet", settings.startup["ReStack-ammo-bullet"].value)
SetByAmmoCategory("shotgun-shell", settings.startup["ReStack-ammo-shotgun"].value)
SetByAmmoCategory("flamethrower", settings.startup["ReStack-ammo-flamethrower"].value)
SetByAmmoCategory("rocket", settings.startup["ReStack-ammo-rocket"].value)
SetByAmmoCategory("cannon-shell", settings.startup["ReStack-ammo-cannon"].value)
SetByAmmoCategory("artillery-shell", settings.startup["ReStack-ammo-artillery"].value)
