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
		133,
		'8ball',
		NULL,
		'Checks your question against the fortune-telling 8-ball.',
		30000,
		0,
		0,
		0,
		0,
		NULL,
		0,
		0,
		0,
		1,
		1,
		0,
		'(async function _8ball () {
	return {
		reply: sb.Utils.randArray(sb.Config.get(\"8_BALL_RESPONSES\"))
	};
})',
		NULL,
		NULL
	)

ON DUPLICATE KEY UPDATE
	Code = '(async function _8ball () {
	return {
		reply: sb.Utils.randArray(sb.Config.get(\"8_BALL_RESPONSES\"))
	};
})'