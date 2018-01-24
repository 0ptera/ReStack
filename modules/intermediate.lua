require("lib")

-- Wood
ReStack_Items["raw-wood"] = {stack_size = settings.startup["ReStack-wood"].value, type = "wood"}

-- Ore Stack Size
SelectItemByEntity("resource", settings.startup["ReStack-ores"].value)


for _,recipe in pairs(data.raw.recipe) do
  -- Plate stack size
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

  --Rocket Parts
  if recipe.category == "rocket-building" then
    for _, ingredient in pairs(recipe.ingredients) do
      ReStack_Items[ingredient[1]] = {stack_size = settings.startup["ReStack-rocket-parts"].value, type = "rocket-part"}
    end
  end  
end

-- Solid Fuel
ReStack_Items["solid-fuel"] = {stack_size = settings.startup["ReStack-solid-fuel"].value, type = "solid-fuel"}

-- refined Uranium
ReStack_Items["uranium-235"] = {stack_size = settings.startup["ReStack-uranium"].value, type = "uranium"}
ReStack_Items["uranium-238"] = {stack_size = settings.startup["ReStack-uranium"].value, type = "uranium"}

for _,item in pairs(data.raw.item) do
  -- nuclear fuel & waste products
  if item.fuel_category == "nuclear" then    
    ReStack_Items[item.name] = {stack_size = settings.startup["ReStack-nuclear-fuel"].value, type = "nuclear-fuel"}
    if burnt_result then ReStack_Items[burnt_result] = {stack_size = settings.startup["ReStack-nuclear-fuel"].value, type = "nuclear-fuel"} end
  end

  -- Tiles - apply last to potentially overwrite
  if item.place_as_tile and (Tile_Whitelist[item.name] or (settings.startup["ReStack-tiles-priority"].value or not ReStack_Items[item.name])) then
    ReStack_Items[item.name] = {stack_size = settings.startup["ReStack-tiles"].value, type = "tile"}
  end
end

