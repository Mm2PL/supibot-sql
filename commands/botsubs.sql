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
		126,
		'botsubs',
		NULL,
		'Checks the channels supibot is currently subscribed to on Twitch.',
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
		'(async function botSubs () {
	const sampleEmotes = Object.values(sb.Master.clients.twitch.availableEmotes).map(emotes => sb.Utils.randArray(emotes).id);
	const data = JSON.parse(await sb.Utils.request({
		url: \"https://api.twitchemotes.com/api/v4/emotes?id=\" + sampleEmotes.join(\",\"),
		headers: {
			Accept: \"application/json\"
		}
	})).filter(i => i.channel_id && i.channel_name !== \"Twitch\").sort((a, b) => a.channel_name.localeCompare(b.channel_name));

	const subbedChannels = data.map(i => i.channel_name).join(\", \");
	const emotes = data.map(i => i.code).join(\" \");
	
	return {
		reply: \"Supibot is currently subbed to: \" + subbedChannels + \" \" + emotes
	};	
})',
		NULL,
		NULL
	)

ON DUPLICATE KEY UPDATE
	Code = '(async function botSubs () {
	const sampleEmotes = Object.values(sb.Master.clients.twitch.availableEmotes).map(emotes => sb.Utils.randArray(emotes).id);
	const data = JSON.parse(await sb.Utils.request({
		url: \"https://api.twitchemotes.com/api/v4/emotes?id=\" + sampleEmotes.join(\",\"),
		headers: {
			Accept: \"application/json\"
		}
	})).filter(i => i.channel_id && i.channel_name !== \"Twitch\").sort((a, b) => a.channel_name.localeCompare(b.channel_name));

	const subbedChannels = data.map(i => i.channel_name).join(\", \");
	const emotes = data.map(i => i.code).join(\" \");
	
	return {
		reply: \"Supibot is currently subbed to: \" + subbedChannels + \" \" + emotes
	};	
})'