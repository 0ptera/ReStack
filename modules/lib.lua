
-- sets stacks for items asociated with an entity or resource
function SelectItemByEntity(ent_type, stack_size, category)
  category = category or ent_type
  for _, entity in pairs(data.raw[ent_type]) do
    if entity.minable then
      if entity.minable.result then
        ReStack_Items[entity.minable.result] = {stack_size = stack_size, type = category}
      elseif entity.minable.results then
        for _, result in pairs(entity.minable.results) do
          if result.name then
            ReStack_Items[result.name] = {stack_size = stack_size, type = category}
          elseif result[1] then
            ReStack_Items[result[1]] = {stack_size = stack_size, type = category}
          end
        end
      end
    end
  end
end

-- set stacks for items by recipe
function SelectItemsByRecipeResult(recipe, stack_size, category)

  local item
  if recipe.result then
    item = recipe.result
  elseif recipe.normal and recipe.normal.result then
    item = recipe.normal.result
  elseif recipe.expensive and recipe.expensive.result then
    item = recipe.normal.result
  end
  if item then
    ReStack_Items[item] = {stack_size = stack_size, type = category}
    return
  end

  local items
  if recipe.results then
    items = recipe.results
  elseif recipe.normal and recipe.normal.results then
    items = recipe.normal.results
  elseif recipe.expensive and recipe.expensive.results then
    items = recipe.expensive.results
  end
  if items then
    for _, result in pairs(items) do
      if result.name then
        ReStack_Items[result.name] = {stack_size = stack_size, type = category}
      elseif result[1] then
        ReStack_Items[result[1]] = {stack_size = stack_size, type = category}
      end
    end
  end
end

function SelectItemsByRecipeInput(recipe, stack_size, category)
  if recipe.ingredients then
    for n, ingredient in pairs(recipe.ingredients) do
      if ingredient.name then
        ReStack_Items[ingredient.name] = {stack_size = stack_size, type = category}
      elseif ingredient[1] then
        ReStack_Items[ingredient[1]] = {stack_size = stack_size, type = category}
      end
    end
  end
end
