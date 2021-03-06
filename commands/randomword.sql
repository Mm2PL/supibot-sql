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
		80,
		'randomword',
		'[\"rw\"]',
		'Fetches a random word. If a number is provided, rolls that many words.',
		5000,
		0,
		0,
		0,
		0,
		NULL,
		0,
		0,
		0,
		0,
		1,
		0,
		'(async function randomWord (context, number = 1) {
	const repeats = Number(number);
	if (!repeats || repeats > 10 || repeats < 1 || Math.trunc(repeats) !== repeats) {
		return { reply: \"Invalid or too high amount of words!\" };
	}

	return {
		reply: [...Array(repeats)].map(() => sb.Utils.randArray(sb.Config.get(\"WORD_LIST\"))).join(\" \")
	};
})',
		NULL,
		'async (prefix) => {
	const list = sb.Config.get(\"WORD_LIST\");
	return [
		\"Returns a random word from a list of \" + list.length + \" pre-determined words.\",
		\"Highly recommended for its usage in pipe, for example into urban or translate...\",
		\"\",
		prefix + \"rw => (one random word)\",
		prefix + \"rw 10 => (ten random words)\",
		\"\",
		\"Word list: <br>\" + list.join(\"<br>\")
	];
}'
	)

ON DUPLICATE KEY UPDATE
	Code = '(async function randomWord (context, number = 1) {
	const repeats = Number(number);
	if (!repeats || repeats > 10 || repeats < 1 || Math.trunc(repeats) !== repeats) {
		return { reply: \"Invalid or too high amount of words!\" };
	}

	return {
		reply: [...Array(repeats)].map(() => sb.Utils.randArray(sb.Config.get(\"WORD_LIST\"))).join(\" \")
	};
})'