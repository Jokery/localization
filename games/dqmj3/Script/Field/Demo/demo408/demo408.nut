//=============================================
//
//		demo408[ルキヤの消息]
//
//=============================================

//-------------------------------------------------------------------------
//
//		読み込み・配置
//
//-------------------------------------------------------------------------
function Update()
{
	
// ▼変数定義
	local task_cam, task_npc_player0, task_npc_player1, task_spike1,task_efc_player0;	
	
// ▼リソース読込
	// キャラクター
	local n_npc_player = ReadNpc_("n027");				// 主人公
	local n_spike = ReadNpc_("m127_02");				// トゲジョボー（囚人）
	local model_o_S02_02 = ReadGimmick_("o_S02_02");
	
	//エフェクト
	LoadEffect_("ef712_10_emo_surprise01");					// 「！」
	local pos = Vec3(-6, 2, 0);

// ▼配置

	// 主人公
	local npc_player1 = ArrangePointNpc_(n_npc_player, "npc_player001");
	SetScaleSilhouette(npc_player1, 0.6, 0.4);

	// トゲジョボー（囚人）
	local spike1 = ArrangePointNpc_(n_spike, "npc_spike001");
	SetScaleSilhouette(spike1, 0.8, 0.5);
	
	//ギミック
	local gmc_o_S02_02 = ArrangePointGimmick_("o_S02_02", model_o_S02_02, "obj_tobira000");	
	
// ▼非常駐モーション読込
	//囚人とげジョボー
	local spike1_down_light = ReadMotion_(spike1, "m127_01_down_light_L");
	local spike1_down_light_look_left_L = ReadMotion_(spike1, "m127_01_down_light_look_left_L");
	local spike1_standup = ReadMotion_(spike1, "m127_01_standup");	
	local spike1_stand_L = ReadMotion_(spike1, "m127_01_hero_wait_L");
	local spike1_surprise = ReadMotion_(spike1, "m127_01_surprise");		//驚く
	local spike1_surprise_L = ReadMotion_(spike1, "m127_01_surprise_L");	//驚くL
	local spike1_sit_talk_L = ReadMotion_(spike1, "m127_01_sit_talk_L");	//座り会話
	local spike1_talk_L = ReadMotion_(spike1, "m127_01_talk_L");	
	local spike1_what_L = ReadMotion_(spike1, "m127_01_what_L");	
	

	//主人公
	local npc_player_stand_L = ReadMotion_(npc_player1, "m127_01_hero_wait_L");
	local npc_player_talk_L = ReadMotion_(npc_player1, "m127_01_talk_L");
	local npc_player_surprise = ReadMotion_(npc_player1, "m127_01_surprise");		//驚く
	local npc_player_surprise_L = ReadMotion_(npc_player1, "m127_01_surprise_L");	//驚くL
		
//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------
	SetMotion_(npc_player1, spike1_down_light, BLEND_N);
	SetMotion_(spike1, npc_player_stand_L, BLEND_N);
	SetDirToPos_(spike1 GetPos_(npc_player1));

	Wait_(15);
	
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	StartDemo(FADE_COLOR_BLACK);
	
	//===============================================
	// *囚人Ａ
	// 「ありがとよ……新人さん。
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_408_MSG_010");
	KeyInputWait_();
	//===============================================
	
	SetMotion_(spike1, spike1_sit_talk_L, 20);	
	SetMotionSpeed_(spike1, 0.8);		
	//===============================================
	// *囚人Ａ
	// 「……右も左も　わからねぇって　顔してるな。
	//-----------------------------------------------
	ShowMsg_("DEMO_408_MSG_020");	
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================	
	Wait_(20);
	SetMotion_(spike1, spike1_down_light, 20);	
	SetMotionSpeed_(spike1, 1.0);
	Wait_(20);	
	DeleteTask_(task_cam);
		
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	InitSilhouetteWidth_(spike1, 1.2);
	Wait_(20);		
	SetMotion_(spike1, spike1_standup, BLEND_L);
	SetMotionSpeed_(spike1, 1.3);	
	WaitMotion(spike1);
	SetMotion_(spike1, spike1_stand_L, BLEND_L);
	SetMotionSpeed_(spike1, 0.8);	
	//===============================================
	// *囚人Ａ
	// 「お前　パークのモンじゃねぇな？
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_408_MSG_030");
	KeyInputWait_();
	//===============================================	
	
	SetMotion_(npc_player1, npc_player_surprise, BLEND_N);
	task_efc_player0 = SurpriseDispSetOffset(npc_player1, pos, 2.0);
	Wait_(15);
	SetMotion_(npc_player1, npc_player_surprise_L, BLEND_L);
	
	Wait_(20);		
	SetMotion_(spike1, spike1_talk_L, 20);	
	//===============================================
	// *囚人Ａ
	// 「心配すんな。イッタブルに　チクろうとか
	//-----------------------------------------------
	ShowMsg_("DEMO_408_MSG_040");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	// *囚人Ａ
	// 「だが……なんのために　ここに来た？
	//-----------------------------------------------
	ShowMsg_("DEMO_408_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================	
	SetMotion_(spike1, spike1_stand_L, 20);	
	
	WaitTask(task_cam);
	Wait_(30);
	SetMotion_(npc_player1, npc_player_talk_L, BLEND_XL);
	Wait_(60);
	
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 15);
	WaitFade_();
	SetVisible(npc_player1, false);
	Wait_(15);
	DeleteTask_(task_cam);	
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);	
	
	
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");
	InitSilhouetteWidth_(spike1, 0.8);
	SetMotionSpeed_(spike1, 1.0);	
	SetMotion_(spike1, spike1_surprise, BLEND_N);
	Wait_(15);
	SetMotion_(spike1, spike1_surprise_L, BLEND_L);
	
	//===============================================
	// *囚人Ａ
	// 「なんだと？　ルキヤと会いに来ただって？
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_408_MSG_060");
	Wait_(20);	
	SetMotion_(spike1, spike1_what_L, 25);	
	KeyInputWait_();
	//===============================================

	//===============================================
	// *囚人Ａ
	// 「隣の牢に　ルキヤって奴は　いたさ。
	//-----------------------------------------------
	ShowMsg_("DEMO_408_MSG_070");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	Wait_(20);	
	DeleteTask_(task_cam);	

	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");
	InitSilhouetteWidth_(spike1, 1.4);
	SetVisible(npc_player1, true);
	
	SetMotion_(npc_player1, MOT_WAIT, BLEND_N);
	SetMotion_(spike1, spike1_stand_L, 20);
	SetMotionSpeed_(spike1, 0.7);	
	local npc_pleyer01 = Task_RotateToDir_(spike1, 30, 1);	
	local npc_pleyer01 = Task_RotateToDir_(npc_player1, 145, 1);	

	//===============================================
	// *囚人Ａ
	// 「ずっと　物音ひとつ　しねぇんだもの。
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_408_MSG_080");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================	
	WaitTask(task_cam);
	
	Wait_(20);
	EndDemo(FADE_COLOR_BLACK);
}
