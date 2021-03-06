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
		49,
		'help',
		'[\"commands\"]',
		'Posts either: a short list of all commands, or a description of a specific command if you specify it.',
		5000,
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
		'(async function help (context, commandString) {
	const prefix = sb.Config.get(\"COMMAND_PREFIX\");

	// No specified command - print all available commands in given channel for given user
	if (!commandString || context.invocation === \"commands\") {
		return {
			reply: (!context.channel || context.channel.Links_Allowed)
				? \"Commands available here: https://supinic.com/bot/command/list\"
				: \"Commands available here: supinic dot com/bot/command/list\"
		};
	}
	// Print specific command description
	else {
		const cmdStr = commandString.toLowerCase().replace(new RegExp(\"^\\\\\" + prefix), \"\");
		if (cmdStr === \"me\") {
			return { reply: \"I can\'t directly help you, but maybe if you use one of my commands, you\'ll feel better? :)\" };
		}

		const command = sb.Command.data.find(cmd => cmd.Name.toLowerCase() === cmdStr || cmd.Aliases.includes(cmdStr));
		if (!command) {
			return { reply: \"That command does not exist!\" };
		}

		const filteredResponse = (command.Whitelisted)
			? \"(whitelisted)\"
			: \"\";
		const aliases = (command.Aliases.length === 0) ? \"\" : (\" (\" + command.Aliases.map(i => prefix + i).join(\", \") + \")\");
		const reply = [
			prefix + command.Name + aliases + \":\",
			command.Description || \"(no description)\",
			\"- \" + sb.Utils.round(command.Cooldown / 1000, 1) + \" seconds cooldown.\",
			filteredResponse,
			\"https://supinic.com/bot/command/\" + command.ID
		];

		return { reply: reply.join(\" \") };
	}
})',
		'$help => Posts the link to all commands
$help <command> => Short summary of the command',
		NULL
	)

ON DUPLICATE KEY UPDATE
	Code = '(async function help (context, commandString) {
	const prefix = sb.Config.get(\"COMMAND_PREFIX\");

	// No specified command - print all available commands in given channel for given user
	if (!commandString || context.invocation === \"commands\") {
		return {
			reply: (!context.channel || context.channel.Links_Allowed)
				? \"Commands available here: https://supinic.com/bot/command/list\"
				: \"Commands available here: supinic dot com/bot/command/list\"
		};
	}
	// Print specific command description
	else {
		const cmdStr = commandString.toLowerCase().replace(new RegExp(\"^\\\\\" + prefix), \"\");
		if (cmdStr === \"me\") {
			return { reply: \"I can\'t directly help you, but maybe if you use one of my commands, you\'ll feel better? :)\" };
		}

		const command = sb.Command.data.find(cmd => cmd.Name.toLowerCase() === cmdStr || cmd.Aliases.includes(cmdStr));
		if (!command) {
			return { reply: \"That command does not exist!\" };
		}

		const filteredResponse = (command.Whitelisted)
			? \"(whitelisted)\"
			: \"\";
		const aliases = (command.Aliases.length === 0) ? \"\" : (\" (\" + command.Aliases.map(i => prefix + i).join(\", \") + \")\");
		const reply = [
			prefix + command.Name + aliases + \":\",
			command.Description || \"(no description)\",
			\"- \" + sb.Utils.round(command.Cooldown / 1000, 1) + \" seconds cooldown.\",
			filteredResponse,
			\"https://supinic.com/bot/command/\" + command.ID
		];

		return { reply: reply.join(\" \") };
	}
})'