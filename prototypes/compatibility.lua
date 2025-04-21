if mods["minimalist-rails"] then

  if data.raw["recipe"]["rail-minimal"] then
    data.raw["recipe"]["rail-minimal"].ingredients = {
      {type = "item", name = "silicon-carbide", amount = 1},
      {type = "item", name = "neodymium", amount = 1},
    }
  end

  if data.raw["item"]["rail-minimal"] then
    data.raw["item"]["rail-minimal"].default_import_location = "moshine"
  end

  data.raw["curved-rail-b"]["curved-rail-b-minimal"].max_health = 3000
  data.raw["curved-rail-a"]["curved-rail-a-minimal"].max_health = 3000
  data.raw["half-diagonal-rail"]["half-diagonal-rail-minimal"].max_health = 2000
  data.raw["straight-rail"]["straight-rail-minimal"].max_health = 1000

  data.raw["curved-rail-b"]["curved-rail-b-minimal"].fast_replaceable_group = "curved-rail-b"
  data.raw["curved-rail-a"]["curved-rail-a-minimal"].fast_replaceable_group = "curved-rail-a"
  data.raw["half-diagonal-rail"]["half-diagonal-rail-minimal"].fast_replaceable_group = "half-diagonal-rail"
  data.raw["straight-rail"]["straight-rail-minimal"].fast_replaceable_group = "straight-rail"

  data.raw["curved-rail-b"]["curved-rail-b-minimal"].minable.mining_time = 3
  data.raw["curved-rail-a"]["curved-rail-a-minimal"].minable.mining_time = 3
  data.raw["half-diagonal-rail"]["half-diagonal-rail-minimal"].minable.mining_time = 2
  data.raw["straight-rail"]["straight-rail-minimal"].minable.mining_time = 1

  data.raw["curved-rail-b"]["curved-rail-b"].fast_replaceable_group = "curved-rail-b"
  data.raw["curved-rail-a"]["curved-rail-a"].fast_replaceable_group = "curved-rail-a"
  data.raw["half-diagonal-rail"]["half-diagonal-rail"].fast_replaceable_group = "half-diagonal-rail"
  data.raw["straight-rail"]["straight-rail"].fast_replaceable_group = "straight-rail"

  data.raw["curved-rail-b"]["curved-rail-b"].next_upgrade = "curved-rail-b-minimal"
  data.raw["curved-rail-a"]["curved-rail-a"].next_upgrade = "curved-rail-a-minimal"
  data.raw["half-diagonal-rail"]["half-diagonal-rail"].next_upgrade = "half-diagonal-rail-minimal"
  data.raw["straight-rail"]["straight-rail"].next_upgrade = "straight-rail-minimal"

  if data.raw["technology"]["minimalist-rails"] then
    table.insert(data.raw["technology"]["minimalist-rails"].prerequisites, "moshine-tech-silicon-carbide")
    table.insert(data.raw["technology"]["minimalist-rails"].unit.ingredients, {"utility-science-pack", 1})
    table.insert(data.raw["technology"]["minimalist-rails"].unit.ingredients, {"space-science-pack", 1})
  end
end

if mods["Glass"] then
  if data.raw["recipe"]["glass-plate"] then
    data.raw["recipe"]["glass-plate"].category = "crafting"
  end
end

if mods["snouz-big-solar-panel"] then
  table.insert(data.raw["recipe"]["big-solar-panel"].ingredients, {type = "item", name = "silicon-cell", amount = 10})
  data.raw["item"]["big-solar-panel"].weight = 200*kg
  table.insert(data.raw["technology"]["big-solar-energy"].prerequisites, "moshine-tech-ai-tier-2")
end

if mods["snouz-big-accumulator"] then
  table.insert(data.raw["recipe"]["big-accumulator"].ingredients, {type = "item", name = "magnet", amount = 10})
  data.raw["item"]["big-accumulator"].weight = 200*kg
  table.insert(data.raw["technology"]["electric-energy-big-accumulators"].prerequisites, "moshine-tech-ai-tier-6")
end

-- disable ai-speed module from everything where it's not manually added
local moduled_building_types = { "beacon", "assembling-machine", "rocket-silo", "furnace", "lab", "mining-drill" }

for _, moduled_building_type in pairs(moduled_building_types) do
  for _,moduled_building in pairs(data.raw[moduled_building_type]) do
    if moduled_building then
      if not moduled_building.allowed_module_categories then
        moduled_building.allowed_module_categories = {}
        for _, module_cat in pairs(data.raw["module-category"]) do
          --log(moduled_building.name .. " - " .. module_cat.name)
          if not (module_cat.name == "ai-speed") then
            table.insert(moduled_building.allowed_module_categories, module_cat.name)
            --log(moduled_building.name .. " - " .. module_cat.name)
          end
        end
      end
    end
  end
end
