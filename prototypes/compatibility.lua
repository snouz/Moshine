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

  if data.raw["item"]["rail-ramp-minimal"] then
    data.raw["item"]["rail-ramp-minimal"].default_import_location = "moshine"
  end


  if data.raw["technology"]["minimalist-rails"] then
    table.insert(data.raw["technology"]["minimalist-rails"].prerequisites, "moshine-tech-silicon-carbide")
    table.insert(data.raw["technology"]["minimalist-rails"].unit.ingredients, {"utility-science-pack", 1})
    table.insert(data.raw["technology"]["minimalist-rails"].unit.ingredients, {"space-science-pack", 1})
  end

  if data.raw["technology"]["minimalist-elevated-rails"] then
    table.insert(data.raw["technology"]["minimalist-elevated-rails"].unit.ingredients, {"utility-science-pack", 1})
    table.insert(data.raw["technology"]["minimalist-elevated-rails"].unit.ingredients, {"space-science-pack", 1})
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
  data.raw["item"]["big-solar-panel"].default_import_location = "moshine"
  table.insert(data.raw["technology"]["big-solar-energy"].prerequisites, "moshine-tech-ai-tier-2")
end

if mods["snouz-big-accumulator"] then
  table.insert(data.raw["recipe"]["big-accumulator"].ingredients, {type = "item", name = "magnet", amount = 10})
  data.raw["item"]["big-accumulator"].weight = 200*kg
  data.raw["item"]["big-accumulator"].default_import_location = "moshine"
  table.insert(data.raw["technology"]["electric-energy-big-accumulators"].prerequisites, "moshine-tech-ai-tier-6")
end

if mods["snouz_better_substation"] then
  data.raw["recipe"]["snouz_better_substation"].ingredients = {
    
      {type = "item", name = "substation", amount = 4},
      {type = "item", name = "silicon-cell", amount = 15},
      {type = "item", name = "magnet", amount = 4}
  }
  data.raw["item"]["snouz_better_substation"].default_import_location = "moshine"
  data.raw["technology"]["snouz_better_substation_tech"].prerequisites = {"electric-energy-distribution-2", "moshine-tech-ai-tier-4"}
end

data.raw.item["sand"].weight = 1*kg
data.raw.item["neodymium"].weight = 4*kg


--[[
if mods["se-space-trains"] then
  if data.raw.item["space-train-battery-charging-station"] then data.raw.item["space-train-battery-charging-station"].default_import_location = "moshine" end
  if data.raw.item["space-train-battery-pack"] then data.raw.item["space-train-battery-pack"].default_import_location = "moshine" end
  if data.raw.item["space-train-discharged-battery-pack"] then data.raw.item["space-train-discharged-battery-pack"].default_import_location = "moshine" end
end
]]