//=============================================
//
//		demo028[Cƒ‰ƒ“ƒNŒ±_5(2‰ñíŸ—˜)]
//
//=============================================

//-------------------------------------------------------------------------
//
//		“Ç‚İ‚İE”z’u
//
//-------------------------------------------------------------------------
function Update()
{
// ¥•Ï”’è‹`
	local task_cam;

// ¥ƒŠƒ\[ƒX“Ç
	// ƒLƒƒƒ‰ƒNƒ^[
	local player = GetPlayerId_();					// ålŒö
	local model_hoippu = ReadNpc_("m100_00");		// ƒzƒCƒbƒvƒS[ƒXƒg
	local model_abare = ReadNpc_("m051_00");		// ‚ ‚Î‚ê‚¤‚µ‚Ç‚è

// ¥”z’u
	// ålŒö
	SetPointPos_(player, "player000");
	// “Gƒp[ƒeƒB
	local enemy00 = ArrangePointNpc_(model_hoippu, "npc_four000");
	local enemy01 = ArrangePointNpc_(model_abare, "npc_four100");
	local enemy02 = ArrangePointNpc_(model_abare, "npc_four200");
	local enemy03 = ArrangePointNpc_(model_hoippu, "npc_four300");
	SetScaleSilhouette(enemy00, SCALE.S, SILHOUETTE_WIDTH.S);
	SetScaleSilhouette(enemy01, SCALE.N, SILHOUETTE_WIDTH.N);
	SetScaleSilhouette(enemy02, SCALE.N, SILHOUETTE_WIDTH.N);
	SetScaleSilhouette(enemy03, SCALE.S, SILHOUETTE_WIDTH.S);

// ¥”ñí’“ƒ‚[ƒVƒ‡ƒ““Ç
	local player_battle_L = ReadMotion_(player, "Player_battle_L");
	
// ¥ƒ‚[ƒVƒ‡ƒ“İ’è
	SetMotion_(player, player_battle_L, BLEND_N);
	
// ¥ƒJƒƒ‰İ’è
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

//-------------------------------------------------------------------------
//		‚Í‚¶‚Ü‚è‚Í‚¶‚Ü‚è
//-------------------------------------------------------------------------

	// ¥ƒJƒbƒg‚P—``````````````````````
	StartDemo(FADE_COLOR_BLACK);
	
	//===============================================
	//¡ƒeƒŒƒWƒA
	// u‚Qí–Ú‚ÌŸ—˜@‚¨‚ß‚Å‚Æ‚¤‚²‚´‚¢‚Ü‚·B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TEREZIA");
	ShowMsg_("DEMO_028_MSG_010");
	KeyInputWait_();
	
	//-----------------------------------------------
	// ¤
	// u–û’f‚³‚ê‚é‚±‚Æ‚È‚­
	//-----------------------------------------------
	ShowMsg_("DEMO_028_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	// ¥ƒJƒbƒg‚Q—``````````````````````
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	
	WaitTask(task_cam);
	DeleteTask_(task_cam);
	
	EncountEndDemo(ENCOUNT_NORMAL);
}