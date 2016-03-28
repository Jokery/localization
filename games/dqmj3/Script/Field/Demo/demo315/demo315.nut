//=============================================
//
//		demo315[生きていたシルバー]
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
	local task_cam, task_player, task_silver;
	local efc_smoke, efc_silver;
	
// ▼リソース読込
	// エフェクト
	LoadEffect_("ef712_10_emo_surprise01");			// 「！」
	LoadEffect_("ef721_03_nat_smoke_n03");			// 煙
	// キャラクター
	local player = GetPlayerId_();					// 主人公
	local model_silver = ReadNpc_("m077_00")		// シルバー
	// ギミック
	local model_huta = ReadGimmick_("o_I01_03");	// 蓋
	local model_hitugi = ReadGimmick_("o_I01_04");	// 棺
	
// ▼配置
	// 主人公
	SetPointPos_(player, "player000");
	// シルバー
	local silver = ArrangePointNpc_(model_silver, "npc_silver000");
	SetScaleSilhouette(silver, SCALE.N, 0.5);
	SetActive_(silver, false);
	// ギミック
	local huta = ArrangePointGimmick_("o_I01_03", model_huta, "obj_huta000");
	local hitugi = ArrangePointGimmick_("o_I01_04", model_hitugi, "obj_hitugi000");

// ▼非常駐モーション読込
	local player_gatagata = ReadMotion_(player, "Player_gatagata");				// 棺の蓋をガタガタさせる
	local player_surprise = ReadMotion_(player, "Player_surprise");				// 主人公驚く
	local player_surprise_L = ReadMotion_(player, "Player_surprise_L");			// 主人公驚くL
	local player_nod = ReadMotion_(player, "Player_nod");						// 待機→頷き→待機
	local player_look_left_L = ReadMotion_(player, "Player_look_left_L");		// 顔を少し左向けるL
	
	local silver_coffin = ReadMotion_(silver, "m077_00_coffin");				// 膝をつく→起き上がる
	local silver_talk_L = ReadMotion_(silver, "m077_00_talk_L");				// 会話L
	local silver_wait_above_L = ReadMotion_(silver, "m077_00_wait_above_L");	// 上向き待機L
	local silver_hold_fist01_L = ReadMotion_(silver, "m077_00_hold_fist01_L");	// 拳を作るL
	local silver_hold_fist02_L = ReadMotion_(silver, "m077_00_hold_fist02_L");	// 拳を作る2L
	local silver_strike = ReadMotion_(silver, "m077_00_strike");				// 待機→地面を打つ→待機
	local silver_wait_L = ReadMotion_(silver, "m077_00_wait_L");				// 待機02L
	
// ▼カメラ設定
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");			// 180F

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------
	
	StartDemo(FADE_COLOR_BLACK);

	Wait_(55);
	
	SetMotion_(player, player_gatagata, BLEND_L);

	Wait_(14);
	
	PlaySE_("SE_FLD_129");
	SetMotion_(huta, MOT_GIMMICK_6, BLEND_N);
	SetMotion_(hitugi, MOT_GIMMICK_2, BLEND_N);
	
	Wait_(21);
	
	SetMotion_(huta, MOT_GIMMICK_0, BLEND_N);
	SetMotion_(hitugi, MOT_GIMMICK_0, BLEND_N);
	
	Wait_(18);
	
	SetMotion_(huta, MOT_GIMMICK_6, BLEND_N);
	SetMotion_(hitugi, MOT_GIMMICK_2, BLEND_N);
	Wait_(7);
	PlaySE_("SE_FLD_129");
	Wait_(51);

	PlaySE_("SE_FLD_129");
	
	Wait_(40);
	
	SetActive_(player, false);
	DeleteTask_(task_cam);
		
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット2
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	
	SetMotion_(huta, MOT_GIMMICK_0, BLEND_N);
	SetMotion_(hitugi, MOT_GIMMICK_0, BLEND_N);
	
	Wait_(45);
	
	PlaySE_("SE_DEM_114");
	SetMotion_(huta, MOT_GIMMICK_2, BLEND_N);
	WaitMotion(huta);
	SetMotion_(huta, MOT_GIMMICK_3, BLEND_N);
	
	Wait_(70);

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット3
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	
	SetActive_(player, true);
	SetMotion_(player, MOT_WAIT, BLEND_N);
	SetPointPos_(player, "player001");
	
	SetActive_(silver, true);
	SetMotion_(silver, silver_coffin, BLEND_N);
	SetMotionSpeed_(silver, 0.4);
	PlaySE_("SE_DEM_115");
	
	SetMotion_(huta, MOT_GIMMICK_4, BLEND_N);
	SetMotionSpeed_(huta, 0.5);
	
	Wait_(50);
	
	SetMotionSpeed_(silver, 0.85);

	SurpriseDisp(player);
	SetMotion_(player, player_surprise, BLEND_M);
	WaitMotion(player);
	SetMotion_(player, player_surprise_L, BLEND_M);	
	
	Wait_(15);
	
	StartDecayEarthQuake_(30, 3, 0.5)
	
	efc_smoke = SetPointWorldEffect_("ef721_03_nat_smoke_n03", "efc_smoke000");
	SetEffectScale_(efc_smoke, 0.55);
	
	WaitMotion(huta);
	SetMotion_(huta, MOT_GIMMICK_5, BLEND_N);

	Wait_(80);
	
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 20);
	WaitFade_();
	
	SetPointPos_(player, "player002");
	SetPointPos_(silver, "npc_silver001");
	SetMotion_(player, MOT_WAIT, BLEND_N);
	SetMotion_(silver, MOT_WAIT, BLEND_N);
	SetMotionSpeed_(silver, 1.0);
	
	Wait_(40);
	
	SetMotion_(silver, silver_talk_L, BLEND_N);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット4
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");			// 240F
	
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 20);
	WaitFade_();
	
	Wait_(30);
	
	//===============================================
	//*シルバー
	// 	「……誰だか知らんが　助かったぞ。
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_315_MSG_010");
	KeyInputWait_();
	
	//===============================================
	//*シルバー
	// 	「ポーラパークの者では　ないようだが……？
	//-----------------------------------------------
	ShowMsg_("DEMO_315_MSG_020");
	
	Wait_(25);
	SetMotion_(silver, silver_wait_above_L, BLEND_L);
	efc_silver = SetSelectBoneEffectSetOffset_("ef712_10_emo_surprise01", silver, ATTACH_EFFECT1, Vec3(0.0, 3.0, 0.0));
	SetEffectScale_(efc_silver, 2.0);
	PlaySE_("SE_DEM_053");
	
	KeyInputWait_();
	
	//===============================================
	//*シルバー
	//「そうか……お前が　ルキヤの言っていた
	//-----------------------------------------------
	ShowMsg_("DEMO_315_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	DeleteTask_(task_cam);
	DeleteEffect_(efc_silver);
	
	SetActive_(player, false);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット5
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");			// 100F
	
	Wait_(5);
	//===============================================
	//*シルバー
	// 「自己紹介が遅れたな。私は　シルバー。
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_315_MSG_040");
	KeyInputWait_();
	
	SetMotion_(silver, silver_hold_fist01_L, BLEND_L);
	
	//===============================================
	//■シルバー
	//「もっとも　腹心のイエタスに裏切られ
	//　殺されかけて　このザマだがな。
	//-----------------------------------------------
	SetTalkName_("NAME_TAG_SILVER");
	ShowMsg_("DEMO_315_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	WaitTask(task_cam);
	
	SetActive_(player, true);
	
	SetMotion_(silver, silver_hold_fist02_L, BLEND_L);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット6
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");

	Wait_(5);
	//===============================================
	//■シルバー
	//「<name_player/>よ　お前は
	//　イエタスに　会ったことはあるか？
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_SILVER");
	ShowMsg_("DEMO_315_MSG_060");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	Wait_(5);
	
	SetMotion_(player, player_nod, BLEND_M);
	WaitMotion(player);
	SetMotion_(player, MOT_WAIT, BLEND_M);
	
	Wait_(10);
	
	//===============================================
	//■シルバー
	//「そうか……やはり　イエタスめ。
	//　私から　オサの証を奪い　跡目を継いでいたか。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_SILVER");
	ShowMsg_("DEMO_315_MSG_070");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetActive_(player, false);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット7
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetPointCameraEye_("cameye003");
	SetPointCameraTarget_("camtgt003");
	
	SetMotion_(silver, silver_strike, BLEND_N);
	
	Wait_(5);
	//===============================================
	//■シルバー
	//「肌身離さず　持っていた　オサの証が
	//　なくなっていたので　もしやとは　思ったが。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_SILVER");
	ShowMsg_("DEMO_315_MSG_080");
	
	WaitMotion(silver);
	SetMotion_(silver, silver_talk_L, BLEND_L);
	
	KeyInputWait_();
	
	//===============================================
	//■シルバー
	//「だが　私を殺せなかったのは失敗だったな。
	//-----------------------------------------------
	ShowMsg_("DEMO_315_MSG_090");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetActive_(player, true);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット8
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetPointCameraEye_("cameye004");
	SetPointCameraTarget_("camtgt004");
	
	SetMotion_(silver, MOT_WALK, BLEND_N);
	task_silver = Task_RotateToDir_(silver, 5, 2.85);
	WaitTask(task_silver);
	task_silver = Task_MoveForward_(silver, 0.65, false);
	Wait_(8);
	task_player = Task_RotateToDirSetMotion_(player, 325, 2.85, MOT_WALK, MOT_WAIT);
	Wait_(31);
	DeleteTask_(task_silver);
	SetMotion_(silver, silver_wait_above_L, BLEND_L);
	Wait_(1);
	efc_silver = SetSelectBoneEffectSetOffset_("ef712_10_emo_surprise01", silver, ATTACH_EFFECT1, Vec3(0.0, 2.2, 0.0));
	SetEffectScale_(efc_silver, 2.2);
	PlaySE_("SE_DEM_053");
	
	Wait_(29);
	
	SetMotion_(silver, silver_wait_L, BLEND_L);
	
	//===============================================
	//*シルバー
	// 「おっ？　なんだ　これは？
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_SILVER");
	ShowMsg_("DEMO_315_MSG_100");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");			// 150F
	WaitTask(task_cam);
	
	Wait_(60);
	
	EndDemo(FADE_COLOR_BLACK);
}
