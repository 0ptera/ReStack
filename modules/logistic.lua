require("lib")

SelectItemByEntity("transport-belt", settings.startup["ReStack-belt"].value)
SelectItemByEntity("underground-belt", settings.startup["ReStack-belt"].value)
SelectItemByEntity("splitter", settings.startup["ReStack-belt"].value)
SelectItemByEntity("loader", settings.startup["ReStack-belt"].value)

SelectItemByEntity("pipe", settings.startup["ReStack-pipe"].value)
SelectItemByEntity("pipe-to-ground", settings.startup["ReStack-pipe"].value)

SelectItemByEntity("inserter", settings.startup["ReStack-inserter"].value)

SelectItemByEntity("roboport", settings.startup["ReStack-roboport"].value)

for _, rail in pairs(data.raw["rail-planner"]) do
  ReStack_Items[rail.name] = {stack_size = settings.startup["ReStack-rail"].value, type = "rail"} -- inefficient but looks better in log
end
