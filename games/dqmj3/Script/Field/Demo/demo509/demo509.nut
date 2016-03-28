//=============================================
//
//		demo509[Ａランク試験_3(敗北)]
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
	local task_cam, task_player;
	local efc_player;

// ▼リソース読込
	// キャラクター
	local player = GetPlayerId_();					// 主人公

// ▼配置
	// 主人公
	SetPointPos_(player, "player000");

// ▼非常駐モーション読込
	local slideloop = ReadMotion_(player, "Player_zusa_L");	

// ▼カメラ設定

	local task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------
	SetMotion_(player, slideloop, BLEND_N);
	StartDemo(FADE_COLOR_BLACK);
	
	//===============================================
	//テレジア
	// 	「負けてしまわれましたね……。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TEREZIA");
	ShowMsg_("DEMO_509_MSG_010");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	//テレジア
	// 	「再度　挑戦されるのを　お待ちしています。
	//-----------------------------------------------
	ShowMsg_("DEMO_509_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	Wait_(35);
	
	EndDemo(FADE_COLOR_BLACK);
}
