//=============================================
//
//		demo528[移動装置を打ち上げろ_1]
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
	SetStepSePan_(rena, false);

// ▼非常駐モーション読込
	local player_look_up_L = ReadMotion_(player, "Player_look_up_L");	// 上向き待機L

	local rena_look_down_L = ReadMotion_(rena, "n007_look_down_L");		// うつむき待機L
	local rena_typing_L = ReadMotion_(rena, "n007_typing_L");			// コンソールを操作するL

//足音
	SetStepSe_(rena, "SE_FLD_016");

// ▼カメラ設定
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");			// 110F

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	Wait_(25);
	
	SetMotion_(rena, rena_look_down_L, 12);
	
	//===============================================
	//*レナーテ
	// 	「そう……決めたの……。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_528_MSG_010");
	KeyInputWait_();
	
	SetMotion_(rena, MOT_WAIT, 12);
	
	//===============================================
	//*レナーテ
	// 	「なら……私から言うことは　何もないわ。
	//-----------------------------------------------
	ShowMsg_("DEMO_528_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	WaitTask(task_cam);
	
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");			// 70F
	
	Wait_(30);
	
	task_rena = Task_RotateToDirSetMotion_(rena, 120, ROTATE_DEMO_DEF, MOT_WALK, MOT_WAIT);
	
	Wait_(55);
	PlayLoopSE_("SE_DEM_121");
	SetMotion_(rena, rena_typing_L, 12);
	
	Wait_(2);
	
	SetMotion_(player, player_look_up_L, 10);
	
	Wait_(23);

	//===============================================
	//*レナーテ
	// 	「敵の本拠地……コアへは　通常の手段で
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_528_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	Wait_(30);
	StopLoopSE_(30);
	EndDemo(FADE_COLOR_BLACK);
}
