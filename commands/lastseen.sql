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
		40,
		'lastseen',
		'[\"ls\", \"stalk\"]',
		'Posts the target user\'s last chat line in all chats combined (!) and the date they sent it.',
		5000,
		0,
		0,
		0,
		0,
		NULL,
		0,
		1,
		0,
		1,
		1,
		0,
		'(async function lastSeen (context, user) {
	if (!user) {
		return { reply: \"No user provided!\" };
	}

	const targetUser = await sb.Utils.getDiscordUserDataFromMentions(user.toLowerCase(), context.append) || await sb.User.get(user.toLowerCase(), true);
	if (!targetUser) {
		return { reply: \"No such user exists!\" };
	}
	else if (targetUser.ID === context.user.ID) {
		return { reply: \"You\'re right here NaM\" };
	}
	else if (targetUser.Name === sb.Config.get(\"SELF\")) {
		return { reply: \"I\'m right here MrDestructoid\" };
	}

	let liveString = \"\";
	if (context.platform.Name === \"twitch\") {
		const isLive = (await sb.Command.get(\"streaminfo\").execute(context, user)).reply;
		if (isLive && !isLive.includes(\"not exist\") && !isLive.includes(\"offline\")) {
			liveString = \"-- They are currently live! PogChamp\";
		}
	}

	const stalk = await sb.Query.getRecordset(rs => rs
		.select(\"Last_Message_Text AS Text\", \"Last_Message_Posted AS Date\", \"Channel.Name AS Channel\")
		.select(\"Platform.Name AS Platform\")
		.from(\"chat_data\", \"Message_Meta_User_Alias\")
		.join(\"chat_data\", \"Channel\")
		.join({
			toDatabase: \"chat_data\",
			toTable: \"Platform\",
			on: \"Channel.Platform = Platform.ID\"
		})
		.where(\"User_Alias = %n\", targetUser.ID)
		.orderBy(\"Last_Message_Posted DESC\")
		.limit(1)
		.single()
	);

	if (!stalk) {
		return { reply: \"That user is being tracked, but no chat lines have been recorded so far.\" };
	}

	const delta = sb.Utils.timeDelta(stalk.Date);
	const channel = (stalk.Platform === \"Twitch\" || stalk.Platform === \"Mixer\")
		? stalk.Platform.toLowerCase() + \"-\" + stalk.Channel[0] + \"\\u{E0000}\" + stalk.Channel.slice(1)
		: stalk.Platform;

	return {
		meta: {
			skipWhitespaceCheck: true
		},
		partialReplies: [
			{
				bancheck: false,
				message: `That user was last seen in chat ${delta}, (channel: ${channel}) their last message:`
			},
			{
				bancheck: true,
				message: stalk.Text
			},
			{
				bancheck: false,
				message: liveString
			}
		]
	};
})',
		NULL,
		NULL
	)

ON DUPLICATE KEY UPDATE
	Code = '(async function lastSeen (context, user) {
	if (!user) {
		return { reply: \"No user provided!\" };
	}

	const targetUser = await sb.Utils.getDiscordUserDataFromMentions(user.toLowerCase(), context.append) || await sb.User.get(user.toLowerCase(), true);
	if (!targetUser) {
		return { reply: \"No such user exists!\" };
	}
	else if (targetUser.ID === context.user.ID) {
		return { reply: \"You\'re right here NaM\" };
	}
	else if (targetUser.Name === sb.Config.get(\"SELF\")) {
		return { reply: \"I\'m right here MrDestructoid\" };
	}

	let liveString = \"\";
	if (context.platform.Name === \"twitch\") {
		const isLive = (await sb.Command.get(\"streaminfo\").execute(context, user)).reply;
		if (isLive && !isLive.includes(\"not exist\") && !isLive.includes(\"offline\")) {
			liveString = \"-- They are currently live! PogChamp\";
		}
	}

	const stalk = await sb.Query.getRecordset(rs => rs
		.select(\"Last_Message_Text AS Text\", \"Last_Message_Posted AS Date\", \"Channel.Name AS Channel\")
		.select(\"Platform.Name AS Platform\")
		.from(\"chat_data\", \"Message_Meta_User_Alias\")
		.join(\"chat_data\", \"Channel\")
		.join({
			toDatabase: \"chat_data\",
			toTable: \"Platform\",
			on: \"Channel.Platform = Platform.ID\"
		})
		.where(\"User_Alias = %n\", targetUser.ID)
		.orderBy(\"Last_Message_Posted DESC\")
		.limit(1)
		.single()
	);

	if (!stalk) {
		return { reply: \"That user is being tracked, but no chat lines have been recorded so far.\" };
	}

	const delta = sb.Utils.timeDelta(stalk.Date);
	const channel = (stalk.Platform === \"Twitch\" || stalk.Platform === \"Mixer\")
		? stalk.Platform.toLowerCase() + \"-\" + stalk.Channel[0] + \"\\u{E0000}\" + stalk.Channel.slice(1)
		: stalk.Platform;

	return {
		meta: {
			skipWhitespaceCheck: true
		},
		partialReplies: [
			{
				bancheck: false,
				message: `That user was last seen in chat ${delta}, (channel: ${channel}) their last message:`
			},
			{
				bancheck: true,
				message: stalk.Text
			},
			{
				bancheck: false,
				message: liveString
			}
		]
	};
})'