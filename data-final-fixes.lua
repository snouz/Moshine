if data.raw["lab"]["supercomputer"] then
  data.raw["lab"]["supercomputer"].inputs =
  {
    "hard-drive",
    "datacell-raw-data",
    "model-stable",
    "datacell-solved-equation"
  }
end

-- fix for potential other mods adding ingredients to all techs

local function add_tech_unit(tech, count, time, ingredients)
  if data.raw["technology"][tech] and count and time and ingredients then
    data.raw["technology"][tech].unit =
    {
      count = count,
      ingredients = ingredients,
      time = time,
    }
  end
end





add_tech_unit("moshine-tech-data-extractor", 40, 60, {{"hard-drive", 1}} )
add_tech_unit("moshine-tech-3d-data-storage", 200, 60,      {{"datacell-raw-data", 1}} )
add_tech_unit("moshine-tech-data-processor", 1000, 10,      {{"datacell-raw-data", 1}} )
add_tech_unit("moshine-tech-ai-trainer", 50, 80,            {{"datacell-raw-data", 1}, {"model-stable", 1}} )
add_tech_unit("moshine-tech-ai-tier-2", 10, 2*1000,         {{"datacell-raw-data", 1}, {"model-stable", 1}} )
add_tech_unit("big-solar-energy", 13, 3*1000,               {{"datacell-raw-data", 1}, {"model-stable", 1}} )
add_tech_unit("moshine-tech-ai-tier-3", 15, 16*1000,        {{"datacell-raw-data", 1}, {"model-stable", 1}} )
add_tech_unit("moshine-tech-ai-tier-4", 20, 54*1000,        {{"datacell-raw-data", 1}, {"model-stable", 1}} )
add_tech_unit("moshine-tech-ai-tier-5", 25, 128*1000,       {{"datacell-raw-data", 1}, {"model-stable", 1}} )
add_tech_unit("moshine-tech-ai-tier-6", 30, 250*1000,       {{"datacell-raw-data", 1}, {"model-stable", 1}} )
add_tech_unit("moshine-tech-ai-tier-7", 35, 432*1000,       {{"datacell-raw-data", 1}, {"model-stable", 1}} )
add_tech_unit("electric-energy-big-accumulators", 36, 437*1000,{{"datacell-raw-data", 1}, {"model-stable", 1}} )
add_tech_unit("moshine-tech-ai-tier-8", 40, 686*1000,       {{"datacell-raw-data", 1}, {"model-stable", 1}} )
add_tech_unit("moshine-tech-ai-tier-9", 45, 1024*1000,      {{"datacell-raw-data", 1}, {"model-stable", 1}} )
add_tech_unit("moshine-tech-ai-tier-10", 50, 1458*1000,     {{"datacell-raw-data", 1}, {"model-stable", 1}} )
add_tech_unit("moshine-tech-processing-grid", 10, 145*1000, {{"datacell-raw-data", 10},{"model-stable", 1}} )
add_tech_unit("long-stack-inserter", 1000, 2.45*1000,       {{"datacell-raw-data", 1}, {"datacell-solved-equation", 1}} )


if data.raw["technology"]["moshine-tech-quantum-processor-productivity"] then
  data.raw["technology"]["moshine-tech-quantum-processor-productivity"].unit =
    {
      count_formula = "1.4^L*700",
      ingredients =
      {
        {"datacell-raw-data", 1},
        {"datacell-solved-equation", 1},
      },
      time = 6000
    }
end

-- compat omnimatter_compression
if data.raw["technology"]["omnipressed-moshine-tech-quantum-processor-productivity"] then
  data.raw["technology"]["omnipressed-moshine-tech-quantum-processor-productivity"] = nil
end