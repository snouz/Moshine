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

if data.raw["technology"]["moshine-tech-data-extractor"] then
  data.raw["technology"]["moshine-tech-data-extractor"].unit =
    {
      count = 40,
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
        {"datacell-raw-data", 1},
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
        {"datacell-raw-data", 1},
      },
      time = 10
    }
end
if data.raw["technology"]["moshine-tech-ai-trainer"] then
  data.raw["technology"]["moshine-tech-ai-trainer"].unit =
    {
      count = 50,
      ingredients =
      {
        {"datacell-raw-data", 1},
        {"model-stable", 1},
      },
      time = 80
    }
end

if data.raw["technology"]["moshine-tech-processing-grid"] then
  data.raw["technology"]["moshine-tech-processing-grid"].unit =
    {
      count = 10,
      ingredients =
      {
        {"datacell-raw-data", 10},
        {"model-stable", 1},
      },
      time = 20000
    }
end
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


if data.raw["technology"]["long-stack-inserter"] then
  data.raw["technology"]["long-stack-inserter"].unit =
    {
      count = 10,
      ingredients =
      {
        {"datacell-raw-data", 1},
        {"datacell-solved-equation", 1},
      },
      time = 2000
    }
end

-- compat omnimatter_compression
if data.raw["technology"]["omnipressed-moshine-tech-quantum-processor-productivity"] then
  data.raw["technology"]["omnipressed-moshine-tech-quantum-processor-productivity"] = nil
end