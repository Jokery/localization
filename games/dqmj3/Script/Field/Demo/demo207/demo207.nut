//=============================================
//
//		demo207[ブンドルド登場]
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
	local task_cam, task_player, task_bundoru;
	local efc_cam, efc_bun;

// ▼フラグ設定
	local bit_ruler = GetEventFlg_("BFG_RULER_ADD_010");			// Bit_210 ルーラ追加フラグ

// ▼リソース読込
	// ギミック
	local model_ruler = ReadGimmick_("o_com_08");	// ルーラポイント
	// キャラクター
	local player = GetPlayerId_();					// 主人公
	local model_bundoru = ReadNpc_("m203_00");		// ブンドルド
	// エフェクト
	LoadEffect_("ef733_01_sym_shuchusen01");		// 集中線
	LoadEffect_("ef730_01_oth_dark_aura01");		// まがまがしいオーラ

// ▼配置
	// 主人公
	SetPointPos_(player, "player000");
	// ブンドルド
	local bundoru = ArrangePointNpc_(model_bundoru, "npc_bundoru000");
	SetScaleSilhouette(bundoru, SCALE.M, SILHOUETTE_WIDTH.M);
	efc_bun = SetSelectBoneEffectSetOffset_("ef730_01_oth_dark_aura01", bundoru, ATTACH_EFFECT2, Vec3(0.0, -5.0, 0.0));		//黒オーラ


// ▼非常駐モーション読込
	// ルーラポイント
	local ruler = ArrangePointGimmick_("o_com_08", model_ruler, "obj_ruler000");
	// ▽ルーラポイントが既に起動していた場合
	if (bit_ruler) { SetMotion_(ruler, MOT_GIMMICK_2, BLEND_N); }
	
	// 主人公
	local player_caution01_L = ReadMotion_(player, "Player_caution01_L");	// 警戒L
	local player_run_battle = ReadMotion_(player, "Player_run_battle");		// 走り→戦闘待機
	local player_battle_L = ReadMotion_(player, "Player_battle_L");			// 戦闘待機L
	
	// ブンドルド
	local bundoru_stand_L = ReadMotion_(bundoru, "m203_00_stand_L");		// デモ用通常待機L
	local bundoru_talk = ReadMotion_(bundoru, "m203_00_talk");				// 会話開始
	local bundoru_talk_L = ReadMotion_(bundoru, "m203_00_talk_L");			// 会話L

// ▼初期モーション設定
	SetMotion_(player, MOT_WALK, BLEND_N);
	task_player = Task_MoveForward_(player, 1.0, false);
	SetMotion_(bundoru, bundoru_stand_L, BLEND_N);
	
// ▼時間設定
	SetTime_(START_TIME_ZONE_NIGHT);
	
// ▼カメラ設定
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");			// 135F

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	// ▼カット１＠主人公カメライン～～～～～～～～～～～～～～
	Wait_(105);
	DeleteTask_(task_player);
	SetMotion_(player, player_caution01_L, BLEND_L);		// 警戒L
	
	WaitTask(task_cam);
	
	// ▼カット２＠ブンドルドあおりアップ～～～～～～～～～～～
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	
	task_bundoru = Task_WalkAroundToDir(bundoru, 0, ROTATE_DEMO_DEF);
	WaitTask(task_bundoru);
	SetMotion_(bundoru, bundoru_talk, BLEND_M);		// 会話
	WaitMotion(bundoru);
	SetMotion_(bundoru, bundoru_talk_L, BLEND_M);	// 会話L
	
	//===============================================
	// *ブンドルド
	// 「キュリリッ！？　誰でスか！
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_207_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetPointPos_(player, "player001");
	SetMotion_(bundoru, bundoru_stand_L, BLEND_L);	// 待機L
	
	// ▼カット３＠主人公カメライン～～～～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");			// 45F
	
	Wait_(10);
	SetMotion_(player, player_run_battle, BLEND_L);	// 走り→戦闘待機
	WaitMotion(player);
	SetMotion_(player, player_battle_L, BLEND_L);	// 戦闘待機L
	
	SetMotion_(bundoru, bundoru_talk, BLEND_M);		// 会話
	WaitMotion(bundoru);
	SetMotion_(bundoru, bundoru_talk_L, BLEND_M);	// 会話L
	
	//===============================================
	// ■ブンドルド
	// 「お……お前が　どうしてここに！？
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BUNDORUDO");
	ShowMsg_("DEMO_207_MSG_020");
	KeyInputWait_();
	
	//-----------------------------------------------
	// ▽
	// 「まさか……ボーショックを倒して
	//-----------------------------------------------
	ShowMsg_("DEMO_207_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	WaitTask(task_cam);
	SetMotion_(bundoru, MOT_WAIT, BLEND_N);	// 待機L
	
	// ▼カット４＠ブンドルドアップ～～～～～～～～～～～～～～
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	
	//===============================================
	// ■ブンドルド
	// 「うむむ……ボーショックの尻ぬぐいを
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BUNDORUDO");
	ShowMsg_("DEMO_207_MSG_040");
	KeyInputWait_();
	
	//-----------------------------------------------
	// ▽
	// 「しかし　楽園を脱出した　お前を
	//-----------------------------------------------
	ShowMsg_("DEMO_207_MSG_050");
	KeyInputWait_();
	
	//-----------------------------------------------
	// ▽
	// 「災いの根は　早めに断つに限る……
	//-----------------------------------------------
	ShowMsg_("DEMO_207_MSG_060");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	StopBgm_(BGM_STOP_DEF);
	SetMotion_(bundoru, MOT_SWORD_ACTUATE, BLEND_M);
	PlaySE_("SE_DEM_106");
	Wait_(36);
	SetMotionSpeed_(bundoru, 0.8);
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", CAMERA_DEF);		// 集中線
	
	EncountEndDemo(ENCOUNT_BOSS);
}
