if mods["se-space-trains"] then
  if data.raw["technology"]["tech-space-trains"] then
    table.insert(data.raw["technology"]["tech-space-trains"].prerequisites, "moshine-tech-magnet")
  end
  if data.raw["recipe"]["space-locomotive"] then
    table.insert(data.raw["recipe"]["space-locomotive"].ingredients, {type = "item", name = "magnet", amount = 5})
  end
  if data.raw["recipe"]["space-fluid-wagon"] then
    table.insert(data.raw["recipe"]["space-fluid-wagon"].ingredients, {type = "item", name = "magnet", amount = 5})
  end
  if data.raw["recipe"]["space-cargo-wagon"] then
    table.insert(data.raw["recipe"]["space-cargo-wagon"].ingredients, {type = "item", name = "magnet", amount = 5})
  end
end