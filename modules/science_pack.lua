-- Science Packs
local sci_stack_size = 200

-- Build list of everything used as ingredient for technologies
for _, tech in pairs(data.raw.technology) do
  if tech.unit and tech.unit.ingredients then
    for _, item in pairs(tech.unit.ingredients) do
      ReStack_Items[item[1]] = {stack_size = sci_stack_size, type = "science-pack"}
    end
  end
end





