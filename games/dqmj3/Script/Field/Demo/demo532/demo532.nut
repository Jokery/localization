//=============================================
//
//		demo532[移動装置を打ち上げろ_4(基地)]
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
	local task_cam, task_rena;

// ▼リソース読込
	// キャラクター
	local player = GetPlayerId_();			// 主人公
	local model_rena = ReadNpc_("n007");	// レナーテ

// ▼配置
	// 主人公
	SetPointPos_(player, "player000");
	// レナーテ
	local rena = ArrangePointNpc_(model_rena, "npc_rena000");

// ▼非常駐モーション読込
	local player_look_up_L = ReadMotion_(player, "Player_look_up_L");	// 上向き待機L

	local rena_typing_L = ReadMotion_(rena, "n007_typing_L");			// コンソールを操作するL
	
//足音
	SetStepSe_(rena, "SE_FLD_016");

// ▼カメラ設定
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");			// 70F
	DeleteTask_(task_cam);

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	SetMotion_(player, player_look_up_L, BLEND_N);
	SetMotion_(rena, rena_typing_L, BLEND_N);
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	Wait_(5);
	PlayLoopSE_("SE_DEM_121");
	
	Wait_(55);
	
	//===============================================
	//*レナーテ
	// 	「……転送装置の　起動を確認。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_532_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	Wait_(20);
	StopLoopSE_(5);
	SetMotion_(rena, MOT_WAIT, 12);
	Wait_(5);
	SetMotion_(player, MOT_WAIT, BLEND_L);
	
	Wait_(30);
	
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");			// 70F
	
	Wait_(30);
	
	task_rena = Task_RotateToDirSetMotion_(rena, -45, ROTATE_DEMO_DEF, MOT_WALK, MOT_WAIT);
	
	WaitTask(task_cam);
	WaitTask(task_rena);

	Wait_(10);

	//===============================================
	//*レナーテ
	// 	「外に出ましょう……。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_532_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	Wait_(20);
	
	EndDemo(FADE_COLOR_BLACK);
}
