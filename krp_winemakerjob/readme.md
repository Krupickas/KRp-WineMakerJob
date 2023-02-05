TOS 
Dont sell script
Dont use code without my permission
Enjoy script



ON YOUR END OF CFG PLACE THIS

restart krp_winemakerjob


Hello thank you for downloading my script if you need any help here is discord server

-- discord.gg/Sc86GwsBUh


##Insert this into your database##

INSERT INTO `addon_account` (name, label, shared) VALUES 
	('winemaker','Biker',1)
;

INSERT INTO `datastore` (name, label, shared) VALUES 
	('winemaker','Biker',1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES 
	('winemaker', 'Biker', 1)
;

INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
('winemaker', 'Biker', 1);


INSERT INTO `job_grades` (`job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
('winemaker', 0, 'tempworker', 'Temp Worker', 1500, '{}', '{}'),
('winemaker', 1, 'worker', 'Worker', 1800, '{}', '{}'),
('winemaker', 2, 'manager', 'Manager', 2100, '{}', '{}'),
('winemaker', 3, 'boss', 'Owner', 2700, '{}', '{}');


##Insert This into ox_inventory/data/items##

	['grape'] = {
		label = 'Grape',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['crushed_grape'] = {
		label = 'Crushed Grape',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['red_wine'] = {
		label = 'Red Wine',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},
	['white_wine'] = {
		label = 'White Wine',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['wine_bottle'] = {
		label = 'Wine Bottle',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['white_grape'] = {
		label = 'White Grape',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},
	
	['crushed_white_grape'] = {
		label = 'White Crushed Grape',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},


