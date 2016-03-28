//=============================================
//
//		demo330[嵐の砂漠へ]
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
	local task_cam, task_player, task_silver, task_todo;
	local task_silver_step, task_todo_step;

// ▼リソース読込
	// キャラクター
	local player = GetPlayerId_();					// 主人公
	local model_silver = ReadNpc_("m077_00");		// シルバー
	local model_todo = ReadNpc_("n039");			// トードー親分
	// エフェクト
	LoadEffect_("ef712_10_emo_surprise01");			// 「！」
	
//	▼ギミック
	
	local model_daiza = ReadGimmick_("o_I02_19");										// リアクター台座
	local daiza = ArrangePointGimmick_("o_I02_19", model_daiza, "obj_daiza000");		// リアクター台座
	SetMotion_(daiza, MOT_GIMMICK_0, BLEND_N);
	
	local model_reactor = ReadGimmick_("o_dem_15");					//ルキヤのリアクター
	local reactor = ArrangePointGimmick_("o_dem_15", model_reactor, "obj_reactor000");
	
// ▼配置
	// 主人公
	SetPointPos_(player, "player000");
	// シルバー
	local silver = ArrangePointNpc_(model_silver, "npc_silver000");
	SetScaleSilhouette(silver, SCALE.N, SILHOUETTE_WIDTH.S);
	SetStepSePan_(silver, false);
	// トードー
	local todo = ArrangePointNpc_(model_todo, "npc_todo000");
	SetScaleSilhouette(todo, SCALE.TODO, 0.8);
	SetMeshVisible_(todo, "Model_2", false);									// オサの証
	SetStepSePan_(todo, false);
	
// ▼非常駐モーション読込
	local player_nod = ReadMotion_(player, "Player_nod");						// 主人公頷く
	local player_look_right_L = ReadMotion_(player, "Player_look_right_L");		// 右を向くL
	
	local silver_wait_L = ReadMotion_(silver, "m077_00_wait_L");				// 待機02L
	local silver_wait_above_L = ReadMotion_(silver, "m077_00_wait_above_L");	// 上向き待機L
	
	local todo_arm_folde02_L = ReadMotion_(todo, "m141_00_arm_folde02_L");		// 腕組み2L
	local todo_arm_folde01_L = ReadMotion_(todo, "m141_00_arm_folde01_L");		// 腕組み1L
	local todo_arm_folde01 = ReadMotion_(todo, "m141_00_arm_folde01");			// 待機→腕組み
	local todo_talk_L = ReadMotion_(todo, "m141_00_talk_L");					// 怒り会話L
	local todooyabun_run = ReadMotion_(todo, "n039_run");						// 走り（トードー親分用）

// ▼カメラ設定
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	
//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	SetMotion_(silver, MOT_RUN, BLEND_N);
	SetMotion_(todo, todooyabun_run, BLEND_N);

	task_silver = Task_MoveForward_(silver, 0.65, true);
	task_todo = Task_MoveForward_(todo, 0.65, true);
	
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	
	task_todo_step = Task_ChangeStepSe(todo, "SE_FLD_033", 11);
	task_silver_step = Task_ChangeStepSe(silver, "SE_FLD_036", 16);
	
	Wait_(20);
	
	SurpriseDispSetOffset(player, Vec3(0, 1.7, 0), 0.7);
	
	Wait_(20);
	
	SetMotion_(player, MOT_WALK, BLEND_M);
	task_player = Task_RotateToDir_(player, -140, 8.0);
	WaitTask(task_player);
	SetMotion_(player, player_look_right_L, BLEND_L);
	
	Wait_(40);
	DeleteTaskStepSe(silver, task_silver_step);
	Wait_(5);
	
	DeleteTask_(task_silver);
	DeleteTask_(task_todo);
	
	DeleteTask_(task_todo_step);
	SetStepSe_(todo, "SE_FLD_033");
	
	SetPointPos_(player, "player001");
	SetPointPos_(silver, "npc_silver001");
	SetPointPos_(todo, "npc_todo001");
	SetMotion_(player, MOT_WALK, BLEND_N);
	SetMotion_(silver, silver_wait_L, BLEND_N);
	SetMotion_(todo, MOT_WAIT, BLEND_N);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット2
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	
	task_player = Task_AnimeMoveSetMotion_(player, "anm_player000", MOT_WALK, MOT_WAIT);	// 80F
	
	WaitTask(task_player);
	
	SetMotion_(todo, todo_arm_folde01, BLEND_L);
	WaitMotion(todo);
	SetMotion_(todo, todo_arm_folde02_L, BLEND_L);
	
	//===============================================
	//*トードー
	// 「アーザムークを倒したか！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TODO");
	ShowMsg_("DEMO_330_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(silver, silver_wait_above_L, BLEND_L);
	Wait_(5);
	
	//===============================================
	//*シルバー
	// 	「ルキヤの研究室か……。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_SILVER");
	ShowMsg_("DEMO_330_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	Wait_(10);
	
	SetActive_(silver, false);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット3
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");		// 100F
	SetScaleSilhouette(todo, SCALE.TODO, 0.7);

	//===============================================
	//*トードー
	// 「懐かしいのう。ワシらとルキヤの３人で
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TODO");
	ShowMsg_("DEMO_330_MSG_030");
	KeyInputWait_();
	
	SetMotion_(todo, todo_arm_folde01_L, BLEND_L);
	
	//===============================================
	//*トードー
	// 「この地に緑をもたらす……ルキヤの
	//-----------------------------------------------
	ShowMsg_("DEMO_330_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	WaitTask(task_cam);
	
	Wait_(10);
	DeleteTask_(task_cam);
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット4
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetScaleSilhouette(todo, SCALE.TODO, 1.4);	
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");		// 200F
	
	SetPointPos_(silver, "npc_silver002");
	SetPointPos_(todo, "npc_todo002");
	SetMotion_(silver, MOT_WALK, BLEND_N);
	SetMotion_(todo, MOT_WALK, BLEND_N);
	SetActive_(todo, false);
	
	Wait_(145);
	
	SetActive_(silver, true);
	SetActive_(todo, true);
	task_silver = Task_AnimeMove_(silver, "anm_silver000");	// 35F
	task_todo = Task_AnimeMove_(todo, "anm_todo000");		// 35F
	
	WaitTask(task_silver);
	WaitTask(task_todo);
	
	SetMotion_(silver, silver_wait_above_L, BLEND_L);
	SetMotion_(todo, todo_arm_folde01, BLEND_L);
	WaitMotion(todo);
	SetMotion_(todo, todo_arm_folde02_L, BLEND_L);
	
	WaitTask(task_cam);
	
	//===============================================
	//*シルバー
	// 「うむ……見ろトードー　この植物を！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_SILVER");
	ShowMsg_("DEMO_330_MSG_050");
	KeyInputWait_();

	//===============================================
	//*シルバー
	// 	「これこそ　我らの希望なのだな。
	//-----------------------------------------------
	ShowMsg_("DEMO_330_MSG_060");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	Wait_(10);
	DeleteTask_(task_cam);	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット5
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");	// 120F
	
	SetPointPos_(silver, "npc_silver003");
	SetPointPos_(todo, "npc_todo003");
	SetFace_(todo, "Face_look_up");
	
	SetActive_(player, false);
	
	//===============================================
	//*トードー
	// 	「しかし　まだ頼りない木じゃのう。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TODO");
	ShowMsg_("DEMO_330_MSG_070");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	//===============================================
	//*シルバー
	// 「まだ　時は来ていないのだろう。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_SILVER");
	ShowMsg_("DEMO_330_MSG_080");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	WaitTask(task_cam);
	
	Wait_(10);
	DeleteTask_(task_cam);	
	SetActive_(player, true);
	SetPointPos_(player, "player002");
	SetPointPos_(silver, "npc_silver004");
	SetPointPos_(todo, "npc_todo004");
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット6
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");
	
	task_player = Task_AnimeMoveSetMotion_(player, "anm_player001", MOT_WALK, MOT_WAIT);	// 60F
	DeleteTask_(task_player);
	
	Wait_(10);
	
	task_player = Task_AnimeMoveSetMotion_(player, "anm_player001", MOT_WALK, MOT_WAIT);	// 60F
	
	Wait_(40);
	
	task_silver = Task_RotateToDirSetMotion_(silver, 275, ROTATE_DEMO_DEF, MOT_WALK, silver_wait_above_L);
	task_todo = Task_RotateToDirSetMotion_(todo, 195, ROTATE_DEMO_DEF, MOT_WALK, MOT_WAIT);
	SetFace_(todo, "Face_default");
	
	WaitTask(task_player);
	WaitTask(task_silver);
	WaitTask(task_todo);

	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");	// 180F
	
	//===============================================
	//*シルバー
	// 「機械が動いている……。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_SILVER");
	ShowMsg_("DEMO_330_MSG_090");
	KeyInputWait_();
	
	//===============================================
	//*シルバー
	// 「もしも　旅先でルキヤと会ったら
	//-----------------------------------------------
	ShowMsg_("DEMO_330_MSG_100");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(todo, todo_arm_folde01, BLEND_L);
	WaitMotion(todo);
	SetMotion_(todo, todo_talk_L, BLEND_L);
	
	//===============================================	
	//*トードー
	// 	「黒鉄の監獄塔への　移動装置に向かうにゃ
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TODO");
	ShowMsg_("DEMO_330_MSG_110");
	KeyInputWait_();
	
	//===============================================
	//*トードー
	// 	「いろいろ　世話になってばかりじゃったが　よかったら　またウチを訪ねてくれい。
	//-----------------------------------------------
	ShowMsg_("DEMO_330_MSG_120");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(todo, todo_arm_folde02_L, BLEND_L);
	
	Wait_(5);
	
	SetMotion_(player, player_nod, BLEND_M);
	WaitMotion(player);
	SetMotion_(player, MOT_WALK, BLEND_M);
	
	task_player = Task_RotateToDir_(player, 270, ROTATE_DEMO_DEF);
	WaitTask(task_player);
	task_player = Task_MoveForward_(player, 1.0, false);
	
	Wait_(45);
	SetStepSe_(player, SILENT_STEP_SE);
	
	EndDemo(FADE_COLOR_BLACK);
}
