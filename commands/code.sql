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
		173,
		'code',
		NULL,
		'Posts a link to a specific command\'s code definition on supinic.com website.',
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
		'(async function code (context, commandString) {
	if (!commandString) {
		return {
			reply: \"No command provided!\"
		};
	}

	const command = sb.Command.get(commandString);
	if (!command) {
		return {
			reply: \"Provided command does not exist!\"
		};
	}

	return {
		reply: \"https://supinic.com/bot/command/\" + command.ID + \"/code\"
	};	
})',
		NULL,
		NULL
	)

ON DUPLICATE KEY UPDATE
	Code = '(async function code (context, commandString) {
	if (!commandString) {
		return {
			reply: \"No command provided!\"
		};
	}

	const command = sb.Command.get(commandString);
	if (!command) {
		return {
			reply: \"Provided command does not exist!\"
		};
	}

	return {
		reply: \"https://supinic.com/bot/command/\" + command.ID + \"/code\"
	};	
})'