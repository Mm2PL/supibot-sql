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
		23,
		'dictionary',
		'[\"define\", \"def\", \"dict\"]',
		'Fetches the dictionary definition of a word. Add a number at the end to access specific definition index if the given word has multiple definitions.',
		10000,
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
		'(async function dictionary (context, ...args) {
	let specificIndex = 0;
	for (let i = 0; i < args.length; i++) {
		const token = args[i];
		if (/^index:\\d+$/.test(token)) {
			specificIndex = Number(token.replace(\"index:\", \"\"));
			args.splice(i, 1);
		}
	}

	let data = null;
	const term = args[0];
	const url = `https://owlbot.info/api/v2/dictionary/${term}?format=json`;

	try {
		data = JSON.parse(await sb.Utils.request(url));
	}
	catch (e) {
		const data = JSON.parse(e.error);
		return {
			reply: e.response.statusCode + \" - \" + data[0].message
		};
	}

	if (data.length === 1 && data[0].message) {
		return {
			reply: data[0].message
		};
	}
	else if (data.length === 0) {
		return {
			reply: \"There is no such defintion!\"
		};
	}
	else if (data.length === 1) {
		return {
			reply: `(${data[0].type}): ${data[0].definition}`
		};
	}
	else {
		const plural  = (data.length - 1 === 1) ? \"\" : \"s\";
		const extraText = (specificIndex === 0)
			? \"(\" + (data.length - 1) + \" more definition\" + plural + \" found\" + \")\"
			: \"\";

		if (specificIndex < 0 || specificIndex >= data.length) {
			return {
				reply: \"Specified ID is out of bounds!\"
			};
		}
		else {
			return {
				reply: `(${data[specificIndex].type}): ${data[specificIndex].definition} ${extraText}`
			};
		}
	}
})',
		'Only supports one word.

$dictionary overlord
$define frog',
		NULL
	)

ON DUPLICATE KEY UPDATE
	Code = '(async function dictionary (context, ...args) {
	let specificIndex = 0;
	for (let i = 0; i < args.length; i++) {
		const token = args[i];
		if (/^index:\\d+$/.test(token)) {
			specificIndex = Number(token.replace(\"index:\", \"\"));
			args.splice(i, 1);
		}
	}

	let data = null;
	const term = args[0];
	const url = `https://owlbot.info/api/v2/dictionary/${term}?format=json`;

	try {
		data = JSON.parse(await sb.Utils.request(url));
	}
	catch (e) {
		const data = JSON.parse(e.error);
		return {
			reply: e.response.statusCode + \" - \" + data[0].message
		};
	}

	if (data.length === 1 && data[0].message) {
		return {
			reply: data[0].message
		};
	}
	else if (data.length === 0) {
		return {
			reply: \"There is no such defintion!\"
		};
	}
	else if (data.length === 1) {
		return {
			reply: `(${data[0].type}): ${data[0].definition}`
		};
	}
	else {
		const plural  = (data.length - 1 === 1) ? \"\" : \"s\";
		const extraText = (specificIndex === 0)
			? \"(\" + (data.length - 1) + \" more definition\" + plural + \" found\" + \")\"
			: \"\";

		if (specificIndex < 0 || specificIndex >= data.length) {
			return {
				reply: \"Specified ID is out of bounds!\"
			};
		}
		else {
			return {
				reply: `(${data[specificIndex].type}): ${data[specificIndex].definition} ${extraText}`
			};
		}
	}
})'