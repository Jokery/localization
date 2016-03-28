//=============================================
//
//		demo316[イエタスの死体]
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
	local task_silver,task_cam;
	local efc_smoke,efc_shuchusen,efc_ice01,efc_ice02;

// ▼リソース読込
	// キャラクター
	local player = GetPlayerId_();													// 主人公
	local model_silver = ReadNpc_("m077_00");										// シルバー 
	local ice_wall = ReadGimmick_("o_I01_01");										// 氷の壁
	local ice_wall_flake = ReadGimmick_("o_I01_02");								// 氷の壁の破片
	local ietasu = ReadGimmick_("o_dem_08");

	//ギミック
	local res_ice = ArrangePointGimmick_("o_I01_01", ice_wall, "obj_ice_wall000");	// 氷の壁
	SetAlpha_(res_ice, 0.3);
	local die_ietasu = ArrangePointGimmick_("o_dem_08", ietasu, "obj_ietasu000");	// 氷漬けのイエタス
	
// ▼配置
	// 主人公
	SetPointPos_(player, "player002");
	
	//シルバー
	local silver = ArrangePointNpc_(model_silver, "npc_silver002");
	SetScaleSilhouette(silver, SCALE.N, 0.5);
	SetStepSePan_(silver, false);

// ▼非常駐モーション読込
	//○主人公
	local look_up = ReadMotion_(player, "Player_look_up_L");			// 上向き待機
	local touch_wall = ReadMotion_(player, "Player_touch_wall_L");		// 壁を触る
	local surprise = ReadMotion_(player, "Player_surprise");			// 驚く
	local surprise_L = ReadMotion_(player, "Player_surprise_L");		// 驚くL
	local look_around = ReadMotion_(player, "Player_look_around_L");	// キョロキョロL
	local caution01 = ReadMotion_(player, "Player_caution01_L");		// 警戒L
	local caution02 = ReadMotion_(player, "Player_caution02_L");		// 警戒して辺りを見回すL
	local guard = ReadMotion_(player, "Player_guard");					// 警戒→身構える
	local guardL = ReadMotion_(player, "Player_guard_L");				// 身構えるL
	local caution = ReadMotion_(player, "Player_caution");				// 身構える→警戒
	local look_right = ReadMotion_(player, "Player_look_right_L");		// 主人公右を向く
	local nod_player = ReadMotion_(player, "Player_nod");				// 主人公頷く
	
	//○シルバー
	local sil_talk_L = ReadMotion_(silver, "m077_00_talk_L");			// 話す
	local sil_left_L = ReadMotion_(silver, "m077_00_wait_left_L");		// 右向き待機
	local sil_fist_L = ReadMotion_(silver, "m077_00_hold_fist01_L");	// 拳を作るL	
	local sil_look_walk_L = ReadMotion_(silver, "m077_00_look_walk_L");	// キョロキョロ歩きL	
	local sil_right_L = ReadMotion_(silver, "m077_00_wait_right_L");	// 顔を右向けるL	
	local sil_above_L = ReadMotion_(silver, "m077_00_wait_above_L");	// 上向き待機L	
	local sil_touch_ice = ReadMotion_(silver, "m077_00_touch_ice_L");	// 氷に触るL	
	local sil_hold_fist = ReadMotion_(silver, "m077_00_hold_fist02_L");	// 拳を作る2L	
	local sil_wait_L = ReadMotion_(silver, "m077_00_wait_L");			// 待機02L	
	

// ▼エフェクト設定
	LoadEffect_("ef721_03_nat_smoke_n03");								// 煙
	LoadEffect_("ef831_03_ice_break_s");								// 氷の壁ヒビが入った時に使用
	LoadEffect_("ef831_04_ice_break_l");								// 氷の壁が割れた時に使用
	LoadEffect_("ef733_01_sym_shuchusen01");									// 集中線

// ▼主人公初期モーション
	SetMotion_(player, look_up, BLEND_N);								// 主人公　上向き待機
	SetMotion_(silver, sil_wait_L, BLEND_N);							// シルバー待機

// ▼カメラ設定
	task_cam = Task_AnimeMoveCamera_("anmeye007", "anmtgt007");										// 80F
	
//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット1　氷の壁崩れる
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	StartDemo(FADE_COLOR_BLACK);
	PlaySE_("SE_DEM_116");
	efc_ice01 = SetPointWorldEffect_("ef831_03_ice_break_s", "efc_ice_flake000");					// 氷のかけらEF
	SetEffectScale_(efc_ice01, 1.0);
	Wait_(30);
	
	StartEarthQuake_(-1, 3, 0.1)																	// 地震

	efc_ice01 = SetPointWorldEffect_("ef831_03_ice_break_s", "efc_ice_flake000");					// 氷のかけらEF
	SetEffectScale_(efc_ice01, 1.3);
	SetMotion_(player, surprise, BLEND_L);															// 主人公　驚く
	WaitMotion(player);
	SetMotion_(player, surprise_L, BLEND_L);														// 主人公　驚L
	
	Wait_(25);
	
	efc_ice01 = SetPointWorldEffect_("ef831_03_ice_break_s", "efc_ice_flake000");					// 氷のかけらEF
	SetEffectScale_(efc_ice01, 0.8);
	Wait_(20);
	
	efc_ice01 = SetPointWorldEffect_("ef831_03_ice_break_s", "efc_ice_flake000");					// 氷のかけらEF
	SetEffectScale_(efc_ice01, 1.6);
	Wait_(15);
	
	efc_ice01 = SetPointWorldEffect_("ef831_03_ice_break_s", "efc_ice_flake001");					// 氷のかけらEF
	SetEffectScale_(efc_ice01, 1.0);
	
	//壁のヒビが全体に広がる
	efc_ice01 = SetPointWorldEffect_("ef831_03_ice_break_s", "efc_ice_flake002");					// 氷のかけらEF
	SetEffectScale_(efc_ice01, 1.0);
	Wait_(10);
	
	//壁のヒビが全体に広がる
	efc_ice01 = SetPointWorldEffect_("ef831_03_ice_break_s", "efc_ice_flake003");					// 氷のかけらEF
	SetEffectScale_(efc_ice01, 1.3);
	Wait_(7);
	
	efc_ice01 = SetPointWorldEffect_("ef831_03_ice_break_s", "efc_ice_flake001");					// 氷のかけらEF
	SetEffectScale_(efc_ice01, 1.5);
	Wait_(5);
	
	efc_ice01 = SetPointWorldEffect_("ef831_03_ice_break_s", "efc_ice_flake002");					// 氷のかけらEF
	SetEffectScale_(efc_ice01, 1.7);
	Wait_(3);
	
	StopEarthQuake_();
	DeleteTask_(task_cam);
	StartEarthQuake_(-1, 3, 0.8);																	// 地震	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット2　ズームアウト
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");										// 35F
	
	Wait_(3);
	
	efc_ice01 = SetPointWorldEffect_("ef831_03_ice_break_s", "efc_ice_flake003");					// 氷のかけらEF
	SetEffectScale_(efc_ice01, 1.9);
	Wait_(3);
	SetMotion_(player,guard, BLEND_M);																// 主人公　身構える
	WaitMotion(player);
	SetMotion_(player,guardL, BLEND_L);
	
	efc_ice01 = SetPointWorldEffect_("ef831_03_ice_break_s", "efc_ice_flake002");					// 氷のかけらEF
	SetEffectScale_(efc_ice01, 3.0);
	
	//氷の壁割れる
	
	//===============================================
	//白フラッシュのようなフェードアウト
	SetFade_(FADE_OUT, FADE_COLOR_WHITE, 10);

	Wait_(20);
	SetVisible(res_ice, false);																		// 氷壁の消失
	WaitTask(task_cam);
	StopEarthQuake_();
	local res_ice02 = ArrangePointGimmick_("o_I01_02", ice_wall_flake, "obj_ice_wall000");			// 氷の壁の破片
	SetFade_(FADE_IN, FADE_COLOR_WHITE, 30);
	//===============================================
	
	efc_smoke = SetPointWorldEffect_("ef721_03_nat_smoke_n03", "player000");						// 煙
	efc_ice02 = SetPointWorldEffect_("ef831_04_ice_break_l", "efc_ice_brake000");					// 氷われるEF
	SetEffectScale_(efc_ice02, 1.5);
	
	SetEffectScale_(efc_smoke, 2.5);
	Wait_(90);	
		
	SetMotion_(player, caution02, BLEND_L);															// 主人公ガード→キョロキョロ
	DeleteTask_(task_cam);

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット3　シルバーアップ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetPointPos_(silver, "npc_silver000");
	InitSilhouetteWidth_(silver, 0.6);
	task_cam = Task_AnimeMoveCamera_("anmeye006", "anmtgt006");
	//===============================================
	//*シルバー
	// 	「これは……隠し部屋か！？
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_SILVER");
	ShowMsg_("DEMO_316_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	DeleteTask_(task_cam);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット4　イエタス死す
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetMotion_(player, MOT_WAIT, BLEND_M);															// 主人公待機
	
	// ▼カメラ設定 パンアップ→ズームイン（早く）
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	
	Wait_(75);	
	
//	PlaySE_("SE_DEM_001");																			// 集中線
	PlaySE_("SE_DEM_026");	// ■SE:集中線
	efc_shuchusen = SetCameraEffect_("ef733_01_sym_shuchusen01", 100);
	
	//===============================================
	//*シルバー
	// 	「こ…こいつはイエタスッ！？
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_SILVER");
	ShowMsg_("DEMO_316_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	DeleteEffect_(efc_shuchusen);	
	
	SetAlpha_(player, ALPHA_CLEAR);																	// α値設定 主人公消す
	
	DeleteTask_(task_cam);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット5　シルバー死体に近づく
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	// ▼カメラ設定
	InitSilhouetteWidth_(silver, 1.4);
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");
	
	//シルバー移動
	SetPointPos_(silver, "npc_silver001");
	
	//シルバー 2、3歩イエタスに近づく
	SetMotion_(silver, MOT_WALK, BLEND_N);									// シルバー歩き
	task_silver = Task_MoveForward_(silver, 1.0, false);
	
	Wait_(50);	
	
	DeleteTask_(task_silver);
	SetMotion_(silver, sil_above_L, BLEND_L);								// シルバー上向き待機
	
	//===============================================
	//*シルバー
	// 「ここに　イエタスの死体がある以上
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_SILVER");
	ShowMsg_("DEMO_316_MSG_030");
	KeyInputWait_();
	//===============================================
	SetMotion_(silver, sil_touch_ice, BLEND_XL);							// 氷漬けイエタスに触る
	WaitTask(task_cam);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット6　シルバー　ズームイン
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	
	// ▼カメラ設定
	InitSilhouetteWidth_(silver, 0.9);
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");
	
	//===============================================
	//*シルバー
	// 「つまり　すべては　イエタスに
	//-----------------------------------------------
	ShowMsg_("DEMO_316_MSG_040");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	//*シルバー
	//「私を襲った目的は　オサの証を奪うため……。
	//-----------------------------------------------
	ShowMsg_("DEMO_316_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	WaitTask(task_cam);

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット7　シルバー　主人公
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	// ▼カメラ設定
	InitSilhouetteWidth_(silver, 1.2);
	SetPointCameraEye_("cameye003");
	SetPointCameraTarget_("camtgt003");

	//主人公表示
	SetAlpha_(player, ALPHA_EXIST);
	
	//主人公移動
	SetPointPos_(player, "player001");
	
	//主人公待機
	SetMotion_(player, look_right, BLEND_N);								// 主人公右向き待機
	
	//シルバー主人公の方を向く
	SetMotion_(silver, MOT_WALK, BLEND_M);									// シルバー歩き
	task_silver = Task_RotateToPos_(silver,Vec3(-186,52,-115), 4);
	WaitTask(task_silver);
	DeleteTask_(task_silver);
	SetMotion_(silver, sil_hold_fist, BLEND_M);								// シルバーこぶしを作る	
	
	//===============================================
	//*シルバー
	// 「オサの証は　ふたつある。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_SILVER");
	ShowMsg_("DEMO_316_MSG_060");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(15);
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット8　シルバーアップ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	InitSilhouetteWidth_(silver, 0.8);
	SetAlpha_(player, ALPHA_CLEAR);											// α値設定 主人公消す
//	SetMotion_(silver, sil_fist_L, BLEND_N);								// シルバーこぶしL
	task_cam = Task_AnimeMoveCamera_("anmeye005", "anmtgt005");
	
	WaitTask(task_cam);
	
	//===============================================
	//*シルバー
	// 「<name_player/>　頼む！　アイスパークに戻り
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_SILVER");
	ShowMsg_("DEMO_316_MSG_070");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	
	EndDemo(FADE_COLOR_BLACK);
}
