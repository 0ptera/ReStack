require("lib")

SelectItemByEntity("reactor", settings.startup["ReStack-reactor"].value)

SelectItemByEntity("assembling-machine", settings.startup["ReStack-crafting-machine"].value)

SelectItemByEntity("furnace", settings.startup["ReStack-furnace"].value)

SelectItemByEntity("beacon", settings.startup["ReStack-beacon"].value)

for _, item in pairs(data.raw["module"]) do
  ReStack_Items[item.name] = {stack_size = settings.startup["ReStack-modules"].value, type = "module"}
end