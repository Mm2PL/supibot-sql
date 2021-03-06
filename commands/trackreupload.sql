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
		143,
		'trackreupload',
		'[\"tr\"]',
		'Sets a track ID in the list already to have the next track as a reupload. The next track can be an existing ID (if it\'s not a reupload already) or a new link, in which case it gets added to list.',
		10000,
		0,
		0,
		0,
		1,
		' pepeL 
Temporarily disabled because it\'s not fixed yet. Soon though.',
		0,
		0,
		0,
		1,
		1,
		0,
		'async (extra, existingID, reuploadLink) => {
	existingID = Number(existingID);
	if (!sb.Utils.isValidInteger(existingID)) {
		return { reply: \"First argument must be positive finite integer!\" };
	}
	else if (!reuploadLink) {
		return { reply: \"Second argument must either be positive finite integer or a link!\" };
	}

	const reuploadCheck = Number(reuploadLink);
	if (sb.Utils.isValidInteger(reuploadCheck)) {
		const row = await sb.Query.getRecordset(rs => rs
			.select(\"Link\")
			.select(\"Link_Prefix\")
			.from(\"music\", \"Track\")
			.join(\"data\", \"Video_Type\")
			.where(\"Track.ID = %n\", reuploadCheck)
			.single()
		);
		if (!row) {
			return { reply: \"Given reupload ID does not exist!\" };
		}

		reuploadLink = row.Link_Prefix.replace(sb.Config.get(\"VIDEO_TYPE_REPLACE_PREFIX\"), row.Link);
	}
		
	const params = new sb.URLParams()
		.set(\"reuploadLink\", reuploadLink)
		.set(\"existingID\", existingID);

	const url = `https://supinic.com/api/track/reupload?${params.toString()}`;
	const result = JSON.parse(await sb.Utils.request({
		method: \"POST\",
		url: url		
	}));

	return { reply: \"Result: \" + result.data.message + \".\" };		
}',
		NULL,
		NULL
	)

ON DUPLICATE KEY UPDATE
	Code = 'async (extra, existingID, reuploadLink) => {
	existingID = Number(existingID);
	if (!sb.Utils.isValidInteger(existingID)) {
		return { reply: \"First argument must be positive finite integer!\" };
	}
	else if (!reuploadLink) {
		return { reply: \"Second argument must either be positive finite integer or a link!\" };
	}

	const reuploadCheck = Number(reuploadLink);
	if (sb.Utils.isValidInteger(reuploadCheck)) {
		const row = await sb.Query.getRecordset(rs => rs
			.select(\"Link\")
			.select(\"Link_Prefix\")
			.from(\"music\", \"Track\")
			.join(\"data\", \"Video_Type\")
			.where(\"Track.ID = %n\", reuploadCheck)
			.single()
		);
		if (!row) {
			return { reply: \"Given reupload ID does not exist!\" };
		}

		reuploadLink = row.Link_Prefix.replace(sb.Config.get(\"VIDEO_TYPE_REPLACE_PREFIX\"), row.Link);
	}
		
	const params = new sb.URLParams()
		.set(\"reuploadLink\", reuploadLink)
		.set(\"existingID\", existingID);

	const url = `https://supinic.com/api/track/reupload?${params.toString()}`;
	const result = JSON.parse(await sb.Utils.request({
		method: \"POST\",
		url: url		
	}));

	return { reply: \"Result: \" + result.data.message + \".\" };		
}'