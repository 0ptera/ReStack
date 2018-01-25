
-- sets stacks for items asociated with an entity or resource
function SelectItemByEntity(ent_type, stack_size, category)
  category = category or ent_type
  for _, entity in pairs(data.raw[ent_type]) do
    if entity.minable then
      if entity.minable.result then
        ReStack_Items[entity.minable.result] = {stack_size = stack_size, type = category}
      elseif entity.minable.results then
        for _, result in pairs(entity.minable.results) do
          ReStack_Items[result.name] = {stack_size = stack_size, type = category}
        end
      end
    end
  end
end

-- set stacks for items by recipe
function SelectItemsByRecipeResult(recipe, stack_size, category)
  if recipe.result or (recipe.normal and recipe.normal.result) then
    local item = recipe.result or recipe.normal.result
    ReStack_Items[item] = {stack_size = stack_size, type = category}
  elseif recipe.results or (recipe.normal and recipe.normal.results) then
    local results = recipe.results or recipe.normal.results -- is normal.results even possible?
    for _, result in pairs(results) do
      ReStack_Items[result.name] = {stack_size = stack_size, type = category}
    end
  end
end

function SelectItemsByRecipeInput(recipe, stack_size, category)
  if recipe.ingredients then
    for _, ingredient in pairs(recipe.ingredients) do      
      ReStack_Items[ingredient[1]] = {stack_size = stack_size, type = category}
    end
  end
end
