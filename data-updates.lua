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


--fix for AAI industries sand -> glass, makes silicon a normal craft then
for _, rec in pairs(data.raw.recipe) do
  if rec.name ~= "silicon" then
    if rec.category and rec.category == "smelting" then
      if rec.ingredients and rec.ingredients[1] and rec.ingredients[1].name == "sand" then
        data.raw["recipe"]["silicon"].category = "crafting"
      end
    end
  end
end