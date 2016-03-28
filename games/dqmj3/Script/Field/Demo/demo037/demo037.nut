//=============================================
//
//		demo037[Œ¯‚µ‚¢ŠR‚ğ‰z‚¦‚Ä]
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
	local task_cam, task_player, task_npc01, task_npc02, task_npc03, task_npc04, task_npc05, task_npc06, task_npc07;
	
// ¥ƒ‚ƒfƒ‹“Ç
	// ƒLƒƒƒ‰ƒNƒ^[
	local player = GetPlayerId_();					// ålŒö
	local model_nocho = ReadNpc_("n000");			// ˆê”Êƒmƒ`ƒ‡[ƒ‰
	local model_jack = ReadNpc_("n001");			// ƒWƒƒƒbƒN
	local model_ace = ReadNpc_("n002");				// ƒG[ƒX
	local model_king = ReadNpc_("n003");			// ƒLƒ“ƒO
	local model_qween = ReadNpc_("n005");			// ƒNƒC[ƒ“
	local model_rin = ReadNpc_("n043");				// ƒmƒ`ƒ‡ƒŠƒ“
	
	// ƒMƒ~ƒbƒN
	local model_maruta = ReadGimmick_("o_H00_04");	// ŠÛ‘¾
	local model_throne = ReadGimmick_("o_com_05");	// ‹ÊÀ

// ¥”z’u
	// ŠÛ‘¾
	local maruta = ArrangePointGimmick_("o_H00_04", model_maruta, "obj_maruta000");
	// ‹ÊÀ
	local throne = ArrangePointGimmick_("o_com_05", model_throne, "obj_throne000");
	
	// ålŒö
	SetPointPos_(player, "player000");
	local task_player = Task_RotateToPos_(player, GetPos_(maruta), 229);
	// ƒmƒ`ƒ‡ƒŠƒ“
	local nocho = ArrangePointNpc_(model_rin, "npc_nocho000");
	// ƒmƒ`ƒ‡[ƒ‰B
	local nocho2 = ArrangePointNpc_(model_nocho, "npc_nocho001");
	// ƒmƒ`ƒ‡[ƒ‰C
	local nocho3 = ArrangePointNpc_(model_nocho, "npc_nocho002");
	// ƒmƒ`ƒ‡[ƒ‰D
	local nocho4 = ArrangePointNpc_(model_nocho, "npc_nocho003");
	// ƒWƒƒƒbƒN
	local jack = ArrangePointNpc_(model_jack, "npc_jack000");
	// ƒG[ƒX
	local ace = ArrangePointNpc_(model_ace, "npc_ace000");
	// ƒLƒ“ƒO
	local king = ArrangePointNpc_(model_king, "npc_king000");
	// ƒNƒC[ƒ“
	local qween = ArrangePointNpc_(model_qween, "npc_qween000");

// ¥”ñí’“ƒ‚[ƒVƒ‡ƒ““Ç
	local kg_talk = ReadMotion_(king, "n003_talk");						// ‘Ò‹@¨‰ï˜b
	local kg_talk_L = ReadMotion_(king, "n003_talk_L");					// ‰ï˜b

// ¥ƒJƒƒ‰İ’è
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

//-------------------------------------------------------------------------
//		‚Í‚¶‚Ü‚è‚Í‚¶‚Ü‚è
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	// ¥ƒJƒƒ‰‚P````````````````````````
	Wait_(45);
	
	//===============================================
	// ¡ƒLƒ“ƒO
	// u‘Ò‚½‚¹‚½‚È@<name_player/>‚æB
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_037_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(player, MOT_WALK, BLEND_M);
	task_player = Task_RotateToPos_(player, GetPos_(king), ROTATE_DEMO_DEF);
	
	//ƒpƒ‰ƒpƒ‰‚Æ•à‚«o‚·
	SetMotion_(jack, MOT_WALK, BLEND_M);
	Wait_(2);
	SetMotion_(ace, MOT_WALK, BLEND_M);
	Wait_(2);
	SetMotion_(qween, MOT_WALK, BLEND_M);
	Wait_(2);
	SetMotion_(nocho, MOT_WALK, BLEND_M);
	Wait_(2);
	SetMotion_(nocho2, MOT_WALK, BLEND_M);
	Wait_(2);
	SetMotion_(nocho3, MOT_WALK, BLEND_M);
	Wait_(2);
	SetMotion_(nocho4, MOT_WALK, BLEND_M);
	
	WaitTask(task_player);
	SetMotion_(player, MOT_WAIT, BLEND_M);
	DeleteTask_(task_player);
	
	task_npc02 = Task_MoveForward_(jack, 1.0, false);
	task_npc04 = Task_MoveForward_(ace, 1.0, false);
	task_npc06 = Task_MoveForward_(qween, 1.0, false);
	task_npc03 = Task_MoveForward_(nocho, 1.0, false);
	task_npc05 = Task_MoveForward_(nocho2, 1.0, false);
	task_npc07 = Task_MoveForward_(nocho3, 1.0, false);
	
	// ¥ƒJƒƒ‰‚P````````````````````````
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	
	Wait_(20);
	
	SetMotion_(ace, MOT_WAIT, BLEND_M);
	SetMotion_(nocho, MOT_WAIT, BLEND_M);
	DeleteTask_(task_npc04);
	DeleteTask_(task_npc03);
	Wait_(20);
	
	SetMotion_(qween, MOT_WAIT, BLEND_M);
	SetMotion_(nocho2, MOT_WAIT, BLEND_M);
	DeleteTask_(task_npc06);
	DeleteTask_(task_npc05);
	Wait_(20);
	
	SetMotion_(jack, MOT_WAIT, BLEND_M);
	SetMotion_(nocho3, MOT_WAIT, BLEND_M);
	SetMotion_(nocho4, MOT_WAIT, BLEND_M);
	DeleteTask_(task_npc02);
	DeleteTask_(task_npc07);
	Wait_(5);
	
	//-----
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 10);
	WaitFade_();
	
	// ¥ƒJƒƒ‰‚Q````````````````````````
	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");
	
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 10);
	WaitFade_();
	//-----
	
	SetMotion_(king, kg_talk, BLEND_XL);				// ‰ï˜b
	WaitMotion(king);
	SetMotion_(king, kg_talk_L, BLEND_M);				// ‰ï˜bLOOP
	
	//===============================================
	// ¡ƒLƒ“ƒO
	// u‚Å‚Í@‚±‚ê‚©‚ç@‚»‚¿‚É
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_037_MSG_020");
	KeyInputWait_();
	
	//-----------------------------------------------
	// ¤
	// uŒ©‚é‚ª‚æ‚¢B‚±‚ÌƒKƒP‚É@‚Í‚Î‚Ü‚ê
	//-----------------------------------------------
	ShowMsg_("DEMO_037_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(king, MOT_WAIT, BLEND_L);
	
	// ¥ƒJƒƒ‰‚R````````````````````````
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	
	SetMotion_(player, MOT_WALK, BLEND_M);
	task_player = Task_RotateToPos_(player, GetPos_(maruta), ROTATE_DEMO_DEF);
	WaitTask(task_player);
	
	SetMotion_(player, MOT_WAIT, BLEND_M);
	DeleteTask_(task_player);
	
	WaitTask(task_cam);
	
	//===============================================
	// ¡ƒLƒ“ƒO
	// u‚µ‚©‚µ@‚»‚¿‚Ì‚Â@‚ ‚Î‚ê‚¤‚µ‚Ç‚è‚È‚ç‚Î
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_037_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	DeleteTask_(task_cam);
	
	// ¥ƒJƒƒ‰‚S````````````````````````
	SetPointCameraEye_("cameye003");
	SetPointCameraTarget_("camtgt003");
	
	//===============================================
	// ¡ƒLƒ“ƒO
	// u‚ ‚ê‚ğŒ©‚æB‚ ‚ÌŠÛ‘¾‚ğ@“]‚ª‚¹‚Î
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_037_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	//-----
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 10);
	WaitFade_();
	
	DeleteTask_(task_cam);
	
	// ¥ƒJƒƒ‰‚T````````````````````````
	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");
	
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 10);
	WaitFade_();
	
	SetMotion_(king, kg_talk, BLEND_XL);		// ‰ï˜b
	WaitMotion(king);
	SetMotion_(king, kg_talk_L, BLEND_M);		// ‰ï˜bLOOP
	//-----
	
	//===============================================
	// ¡ƒLƒ“ƒO
	// u—Š‚ŞB‚»‚¿‚ª@‚ ‚Î‚ê‚¤‚µ‚Ç‚è‚Éæ‚Á‚Ä
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_037_MSG_060");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(king, MOT_WAIT, BLEND_XL);
	
	EndDemo(FADE_COLOR_BLACK);
}
