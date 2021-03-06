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
		11,
		'tuck',
		'[\"gnkiss\", \"headpat\"]',
		'Tucks target user to bed',
		20000,
		0,
		0,
		0,
		0,
		NULL,
		0,
		1,
		0,
		0,
		1,
		0,
		'(async function tuck (context, user, emote) {
	user = (user || \"\").toLowerCase().replace(/^@/, \"\");

	if (context.invocation === \"tuck\") {
		if (!user || user === context.user.Name) {
			return { 
				reply: \"You had nobody to tuck you in, so you tucked yourself in PepeHands\" 
			};
		}
		else if (user === sb.Config.get(\"SELF\")) {
			return { 
				reply: \"Thanks for the kind gesture, but I gotta stay up :)\" 
			};
		}
		else {
			return { 
				reply: `You tucked ${user} to bed ${emote || \"FeelsOkayMan\"} 👉 🛏`
			};
		}
	}
	else if (context.invocation === \"gnkiss\") {
		if (!user || user === context.user.Name) {
			return { 
				reply: \"You had nobody to kiss you good night, so you cry yourself to sleep PepeHands\" 
			};
		}
		else if (user === sb.Config.get(\"SELF\")) {
			return { 
				reply: \"Thanks for the kiss, but I gotta stay up :)\"
			};
		}
		else {
			const forehead = (emote && emote.toLowerCase().includes(\"head\"))
				? emote
				: \"4Head\";

			return { 
				reply: `You bid ${user} good night and gently kiss their ${forehead}`
			};
		}
	}
	else if (context.invocation === \"headpat\") {
		if (!user || user === context.user.Name) {
			return { 
				reply: \"You pat yourself on the head... okay?\" 
			};
		}
		else if (user === sb.Config.get(\"SELF\")) {
			return { 
				reply: \"Thank you 😳\"
			};
		}
		else {
			return { 
				reply: `You gently pat ${user} on the head 🙂`
			};
		}
	}
})',
		NULL,
		NULL
	)

ON DUPLICATE KEY UPDATE
	Code = '(async function tuck (context, user, emote) {
	user = (user || \"\").toLowerCase().replace(/^@/, \"\");

	if (context.invocation === \"tuck\") {
		if (!user || user === context.user.Name) {
			return { 
				reply: \"You had nobody to tuck you in, so you tucked yourself in PepeHands\" 
			};
		}
		else if (user === sb.Config.get(\"SELF\")) {
			return { 
				reply: \"Thanks for the kind gesture, but I gotta stay up :)\" 
			};
		}
		else {
			return { 
				reply: `You tucked ${user} to bed ${emote || \"FeelsOkayMan\"} 👉 🛏`
			};
		}
	}
	else if (context.invocation === \"gnkiss\") {
		if (!user || user === context.user.Name) {
			return { 
				reply: \"You had nobody to kiss you good night, so you cry yourself to sleep PepeHands\" 
			};
		}
		else if (user === sb.Config.get(\"SELF\")) {
			return { 
				reply: \"Thanks for the kiss, but I gotta stay up :)\"
			};
		}
		else {
			const forehead = (emote && emote.toLowerCase().includes(\"head\"))
				? emote
				: \"4Head\";

			return { 
				reply: `You bid ${user} good night and gently kiss their ${forehead}`
			};
		}
	}
	else if (context.invocation === \"headpat\") {
		if (!user || user === context.user.Name) {
			return { 
				reply: \"You pat yourself on the head... okay?\" 
			};
		}
		else if (user === sb.Config.get(\"SELF\")) {
			return { 
				reply: \"Thank you 😳\"
			};
		}
		else {
			return { 
				reply: `You gently pat ${user} on the head 🙂`
			};
		}
	}
})'