require("lib")

-- Wood
ReStack_Items["raw-wood"] = {stack_size = settings.startup["ReStack-wood"].value, type = "wood"}

-- Ore Stack Size
SelectItemByEntity("resource", settings.startup["ReStack-ores"].value)

-- Plate stack size
local plate_stack_size = settings.startup["ReStack-plates"].value
for _,recipe in pairs(data.raw.recipe) do
  if recipe.category == "smelting" then
    if recipe.result or (recipe.normal and recipe.normal.result) then
      local item = recipe.result or recipe.normal.result
      ReStack_Items[item] = {stack_size = settings.startup["ReStack-plates"].value, type = "smelting"}
    elseif recipe.results or (recipe.normal and recipe.normal.results) then
      local results = recipe.results or recipe.normal.results -- is normal.results even possible?
      for _, result in pairs(results) do
        ReStack_Items[result.name] = {stack_size = settings.startup["ReStack-plates"].value, type = "smelting"}
      end
    end
  end
end

-- refined Uranium
ReStack_Items["uranium-235"] = {stack_size = settings.startup["ReStack-uranium"].value, type = "uranium"}
ReStack_Items["uranium-238"] = {stack_size = settings.startup["ReStack-uranium"].value, type = "uranium"}

-- Fuel Cell
ReStack_Items["uranium-fuel-cell"] = {stack_size = settings.startup["ReStack-fuel-cell"].value, type = "fuel-cell"}
ReStack_Items["used-up-uranium-fuel-cell"] = {stack_size = settings.startup["ReStack-fuel-cell"].value, type = "fuel-cell"}

--Rocket Parts
ReStack_Items["rocket-fuel"] = {stack_size = settings.startup["ReStack-rocket-parts"].value, type = "rocket-part"}
ReStack_Items["rocket-control-unit"] = {stack_size = settings.startup["ReStack-rocket-parts"].value, type = "rocket-part"}
ReStack_Items["low-density-structure"] = {stack_size = settings.startup["ReStack-rocket-parts"].value, type = "rocket-part"}

-- Tiles - apply last to potentially overwrite
for _, item in pairs(data.raw.item) do
  if item.place_as_tile and (Tile_Whitelist[item.name] or (settings.startup["ReStack-tiles-priority"].value or not ReStack_Items[item.name])) then
    ReStack_Items[item.name] = {stack_size = settings.startup["ReStack-tiles"].value, type = "tile"}
  end
end
