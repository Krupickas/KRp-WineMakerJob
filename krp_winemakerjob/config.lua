Config = {}

Config.Coords = { --
    vector4(-1944.9678, 1968.5862, 151.0538, 277.7017) -- spawn of car
}

Config.Locale = 'en'

Config.GrapeRandom = {3,10} -- Minimal and Maximum grapes that you can get

Config.esxsociety = true -- esx society turn it off and choose your own if you have wasabi multijob or core utility jobs

Config.CompanyVehicle = 'burrito3' -- company vehicle

Config.BottlePrice = 10 -- for 1 bottle

Config.RedWinePrice = 1200 -- For 1 bottle

Config.WhiteWinePrice = 1000 -- For 1 bottle 

Config.BlipsForEveryone = {
    
    Blip = {
      Pos     = { x = -1900.2844, y = 2089.4929, z = 140.3905 },
      Sprite  = 93,
      Display = 4,
      Scale   = 0.8,
      Colour  = 27,
    },

}

Config.Blips = {
	[1] = {
		Coords = { x = -1908.8029, y = 2111.6997, z = 129.3811 },
		Blip = { name = 'Grapes', sprite = 237, size = 0.68, color = 27 },
		JobsThatSeesIt = {'winemaker'},
	},
  [2] = {
		Coords = { x = -1928.8539, y = 1937.0442, z = 163.7525 },
		Blip = { name = 'White Grapes', sprite = 237, size = 0.68, color = 0 },
		JobsThatSeesIt = {'winemaker'},
	},
  [3] = {
		Coords = { x = -51.5980, y = 1900.4236, z = 195.3613 },
		Blip = { name = 'Process Wine', sprite = 233, size = 0.68, color = 0 },
		JobsThatSeesIt = {'winemaker'},
	},
  [4] = {
		Coords = { x = 135.4251, y = 323.1595, z = 116.6335  },
		Blip = { name = 'Bottles Shop', sprite = 59, size = 0.68, color = 0 },
		JobsThatSeesIt = {'winemaker'},
	},
	[5] = {
		Coords = { x = 222.6112, y = -176.4014, z = 57.9173 },
		Blip = { name = 'Buyer of wine', sprite = 207, size = 0.68, color = 52 },
		JobsThatSeesIt = {'winemaker'},
	},
}
