INSERT INTO
	`chat_data`.`Command`
	(
		ID,
		Name,
		Aliases,
		Description,
		Cooldown,
		Rollbackable,
		System,
		Skip_Banphrases,
		Whitelisted,
		Whitelist_Response,
		Read_Only,
		Opt_Outable,
		Blockable,
		Ping,
		Pipeable,
		Archived,
		Code,
		Examples,
		Dynamic_Description
	)
VALUES
	(
		124,
		'test',
		NULL,
		'?',
		10000,
		0,
		1,
		0,
		1,
		'For debugging purposes only :)',
		0,
		0,
		0,
		1,
		1,
		0,
		'async (extra) => {
	return {
		reply: {}
	}
}',
		NULL,
		NULL
	)

ON DUPLICATE KEY UPDATE
	Code = 'async (extra) => {
	return {
		reply: {}
	}
}'