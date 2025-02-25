if data.raw["lab"]["supercomputer"] then
  data.raw["lab"]["supercomputer"].inputs =
  {
    "hard-drive",
    "model-stable",
    "datacell-solved-equation"
  }
end

-- fix for potential other mods adding ingredients to all techs

if data.raw["technology"]["moshine-tech-data-extractor"] then
  data.raw["technology"]["moshine-tech-data-extractor"].unit =
    {
      count = 10,
      ingredients =
      {
        {"hard-drive", 1},
      },
      time = 60
    }
end
if data.raw["technology"]["moshine-tech-3d-data-storage"] then
  data.raw["technology"]["moshine-tech-3d-data-storage"].unit =
    {
      count = 200,
      ingredients =
      {
        {"hard-drive", 1},
      },
      time = 60
    }
end
if data.raw["technology"]["moshine-tech-data-processor"] then
  data.raw["technology"]["moshine-tech-data-processor"].unit =
    {
      count = 1000,
      ingredients =
      {
        {"hard-drive", 1},
      },
      time = 60
    }
end
if data.raw["technology"]["moshine-tech-quantum-processor-productivity"] then
  data.raw["technology"]["moshine-tech-quantum-processor-productivity"].unit =
    {
      count_formula = "1.4^L*200",
      ingredients =
      {
        {"model-stable", 1},
      },
      time = 60
    }
end
