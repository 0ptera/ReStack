require("lib")

SelectItemByEntity("transport-belt", settings.startup["ReStack-belt"].value)
SelectItemByEntity("underground-belt", settings.startup["ReStack-belt"].value)
SelectItemByEntity("splitter", settings.startup["ReStack-belt"].value)
SelectItemByEntity("loader", settings.startup["ReStack-belt"].value)

SelectItemByEntity("pipe", settings.startup["ReStack-pipe"].value)
SelectItemByEntity("pipe-to-ground", settings.startup["ReStack-pipe"].value)

SelectItemByEntity("inserter", settings.startup["ReStack-inserter"].value)

SelectItemByEntity("electric-pole", settings.startup["ReStack-electric-pole"].value)

SelectItemByEntity("roboport", settings.startup["ReStack-roboport"].value)

for _, rail in pairs(data.raw["rail-planner"]) do
  ReStack_Items[rail.name] = {stack_size = settings.startup["ReStack-rail"].value, type = "rail"} -- inefficient but looks better in log
end

SelectItemByEntity("arithmetic-combinator", settings.startup["ReStack-combinator"].value)
SelectItemByEntity("decider-combinator", settings.startup["ReStack-combinator"].value)
SelectItemByEntity("constant-combinator", settings.startup["ReStack-combinator"].value)

ReStack_Items["red-wire"] = {stack_size = settings.startup["ReStack-wire"].value, type = "wire"}
ReStack_Items["green-wire"] = {stack_size = settings.startup["ReStack-wire"].value, type = "wire"}