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

if data.raw["technology"]["moshine-tech-ai-tier-2"] then
  data.raw["technology"]["moshine-tech-ai-tier-2"].unit =
    {
      count = 10,
      ingredients =
      {
        {"datacell-raw-data", 1},
        {"model-stable", 1},
      }, -- 20
      time = 2000
    }
end
if data.raw["technology"]["moshine-tech-ai-tier-3"] then
  data.raw["technology"]["moshine-tech-ai-tier-3"].unit =
    {
      count = 15,
      ingredients =
      {
        {"datacell-raw-data", 1},
        {"model-stable", 1},
      }, -- 160
      time = 16000
    }
end
if data.raw["technology"]["moshine-tech-ai-tier-4"] then
  data.raw["technology"]["moshine-tech-ai-tier-4"].unit =
    {
      count = 20,
      ingredients =
      {
        {"datacell-raw-data", 1},
        {"model-stable", 1},
      }, --540
      time = 54000
    }
end
if data.raw["technology"]["moshine-tech-ai-tier-5"] then
  data.raw["technology"]["moshine-tech-ai-tier-5"].unit =
    {
      count = 25,
      ingredients =
      {
        {"datacell-raw-data", 1},
        {"model-stable", 1},
      }, --1280
      time = 128000
    }
end
if data.raw["technology"]["moshine-tech-ai-tier-6"] then
  data.raw["technology"]["moshine-tech-ai-tier-6"].unit =
    {
      count = 30,
      ingredients =
      {
        {"datacell-raw-data", 1},
        {"model-stable", 1},
      }, --2500
      time = 250000
    }
end
if data.raw["technology"]["moshine-tech-ai-tier-7"] then
  data.raw["technology"]["moshine-tech-ai-tier-7"].unit =
    {
      count = 35,
      ingredients =
      {
        {"datacell-raw-data", 1},
        {"model-stable", 1},
      }, --4320
      time = 432000
    }
end
if data.raw["technology"]["moshine-tech-ai-tier-8"] then
  data.raw["technology"]["moshine-tech-ai-tier-8"].unit =
    {
      count = 40,
      ingredients =
      {
        {"datacell-raw-data", 1},
        {"model-stable", 1},
      }, --6860
      time = 686000
    }
end
if data.raw["technology"]["moshine-tech-ai-tier-9"] then
  data.raw["technology"]["moshine-tech-ai-tier-9"].unit =
    {
      count = 45,
      ingredients =
      {
        {"datacell-raw-data", 1},
        {"model-stable", 1},
      }, --10240
      time = 1024000
    }
end
if data.raw["technology"]["moshine-tech-ai-tier-10"] then
  data.raw["technology"]["moshine-tech-ai-tier-10"].unit =
    {
      count = 50,
      ingredients =
      {
        {"datacell-raw-data", 1},
        {"model-stable", 1},
      }, --14580
      time = 1458000
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
      time = 145800
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
      time = 245800
    }
end

-- compat omnimatter_compression
if data.raw["technology"]["omnipressed-moshine-tech-quantum-processor-productivity"] then
  data.raw["technology"]["omnipressed-moshine-tech-quantum-processor-productivity"] = nil
end