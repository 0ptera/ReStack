
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

return SelectItemByEntity