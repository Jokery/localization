//=============================================
//
//		demo006[オープニングデモ_9(主人公登場)]
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
	local task_cam, task_sancho;

// ▼リソース読込
	// キャラクター
	local player = GetPlayerId_();					// 主人公
	local model_sancho = ReadNpc_("n011");			// サンチョ

// ▼配置
	// 主人公
	SetPointPos_(player, "player000");
	// サンチョ
	local sancho = ArrangePointNpc_(model_sancho, "npc_sancho000");
	SetScaleSilhouette(sancho, SCALE.SANCHO, SILHOUETTE_WIDTH.SANCHO);
	SetStepSe_(sancho, SILENT_STEP_SE);									// 足音を 無音にする
	
// ▼非常駐モーション読込
	// 主人公
	local pl_sleep_L = ReadMotion_(player, "Player_sleep_L");			// 寝ころぶL
	local pl_up02 = ReadMotion_(player, "Player_up02");					// 寝ころぶ→起き上がる
	local pl_up02_L = ReadMotion_(player, "Player_up02_L");				// 起き上がるL
	
	// サンチョ
	local sancho_bow = ReadMotion_(sancho, "n011_bow");					// おじぎ

// ▼モーション設定
	SetMotion_(player, pl_sleep_L, BLEND_N);
	SetFace_(player, "Face_loop_close");

// ▼カメラ設定
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");		// 120F

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	// ▼カット１＠楽園（室内）外観①～～～～～～～～～～～～～
	WaitTask(task_cam);
	DeleteTask_(task_cam);
	
	// ▼カット２＠楽園（室内）外観②～～～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");		// 120F
	WaitTask(task_cam);
	DeleteTask_(task_cam);
	
	// ▼カット３＠主人公寝ころび～～～～～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");		// 150F
	WaitTask(task_cam);
	DeleteTask_(task_cam);
	
	task_sancho = Task_AnimeMove_(sancho, "anm_sancho000");			// 45F
	SetMotion_(sancho, MOT_WALK, BLEND_N);
	
	// ▼カット４＠サンチョ、主人公に近付く～～～～～～～～～～
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	PlaySE_("SE_FLD_040");											//■SE:サンチョ足音（浮遊モンスターの足音）
	Wait_(20);
	PlaySE_("SE_FLD_040");											//■SE:サンチョ足音（浮遊モンスターの足音）

	WaitTask(task_sancho);
	SetPointPos_(sancho, "npc_sancho001");
	
	SetDir_(sancho, 180);
	
	// ▼カット５＠サンチョアップ～～～～～～～～～～～～～～～
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	
	SetMotion_(sancho, sancho_bow, BLEND_N);		// おじぎ
	WaitMotion(sancho);
	SetMotion_(sancho, MOT_TALK, BLEND_M);
	Wait_(28);
	SetMotion_(sancho, MOT_TALKLOOP, BLEND_M);
	
	//===============================================
	// *サンチョ
	// 「ピピッ！　おはようございマス！
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_006_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetPointPos_(sancho, "npc_sancho002");
	SetMotion_(sancho, MOT_WAIT, BLEND_N);
	
	SetFace_(player, "Face_default");
	
	// ▼カット６＠主人公起き上がる～～～～～～～～～～～～～～
	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");
	
	SetMotion_(player, pl_up02, BLEND_M);		// 寝ころぶ→起き上がる
	Wait_(11);
	SetMotion_(sancho, MOT_TALK, BLEND_XL);
	Wait_(10);
	SetMotion_(player, pl_up02_L, BLEND_M);		// 起き上がるL
	Wait_(18);
	SetMotion_(sancho, MOT_TALKLOOP, BLEND_M);
	
	//===============================================
	// ■サンチョ
	// 「朝食の支度が　できておりマス。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_SANCHO");
	ShowMsg_("DEMO_006_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(sancho, sancho_bow, BLEND_XL);		// おじぎ
	WaitMotion(sancho);
	SetMotion_(sancho, MOT_WAIT, BLEND_M);
	
	task_sancho = Task_RotateToDir_(sancho, -5, 5.7);
	WaitTask(task_sancho);
	task_sancho = Task_MoveForward_(sancho, 1.0, false);
	PlaySE_("SE_FLD_040");											//■SE:サンチョ足音（浮遊モンスターの足音）
	Wait_(20);
	PlaySE_("SE_FLD_040");											//■SE:サンチョ足音（浮遊モンスターの足音）
	Wait_(15);
	
	EndDemo(FADE_COLOR_BLACK);
}
