//=============================================
//
//		demo128[電源の復旧_1(起動)]
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
	local efc_light;
	local task_cam, task_player, task_npc01, task_npc02, task_npc03;
	
// ▼モデル読込
	// キャラクター
	local player = GetPlayerId_();					// 主人公
	// ギミック
	local model_monitor = ReadGimmick_("o_A02_02");	// モニタ
	// エフェクト
	LoadEffect_("ef732_09_light_reactor_c");		// リアクター発光
	LoadEffect_("ef712_10_emo_surprise01");			//驚き

// ▼配置
	// モニタ
	local monitor = ArrangePointGimmick_("o_A02_02", model_monitor, "obj_monitor000");
	SetMotion_(monitor, MOT_GIMMICK_4, BLEND_N);		// モニタ赤　蓄電器両点灯
	
	// 主人公
	SetPointPos_(player, "player000");

// ▼非常駐モーション読込
	// 主人公
	local player_reactor = ReadMotion_(player, "Player_touch_reactor");			// 顔を少し左向ける→リアクターを触る
	local player_reactor_L = ReadMotion_(player, "Player_touch_reactor_L");		// リアクターを触るL
	local player_stand = ReadMotion_(player, "Player_stand01");					// リアクターを触る→待機に戻る	
	local panel = ReadMotion_(player, "Player_panel01");						// 主人公パネル操作
	
// ▼カメラ設定
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	// ▼カメラ１～～～～～～～～～～～～～～～～～～～～～～～～
	SurpriseDisp(player);
	Wait_(20);
	
	efc_light = SetSelectBoneEffect_("ef732_09_light_reactor_c", player, ATTACH_EFFECT1);	//リアクター発光
	
	OpenConnectiveWithMotion("connective_ace", player, player_reactor, player_reactor_L);
	
	//===============================================
	// ■エース
	// 「それじゃあ　仕上げだぜ。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_128_MSG_010");
	KeyInputWait_();
	
	//-----------------------------------------------
	// ▽
	// 「そいつを操作して
	//-----------------------------------------------
	ShowMsg_("DEMO_128_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();	
	CloseConnective();
	
	Wait_(15);
	SetMotion_(player, player_stand, BLEND_L);
	Wait_(25);
	SetMotion_(player, panel, BLEND_L);					//主人公パネル操作
	WaitMotion(player);
	SetMotion_(player, MOT_WAIT, BLEND_L);
	PlaySE_("SE_DEM_033");								//蓄電器起動音SE
	
	DeleteTask_(task_cam);
	
	// カメラ　モニタアップ	
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

	Wait_(45);

	SetMotion_(monitor, MOT_GIMMICK_5, BLEND_M);		// モニタ青　開錠
	
	Wait_(70);
	
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000")
	
	//-----------------------------------------------
	// ▽
	// 「いいぞ……うまく　いってるみたいだ。
	//-----------------------------------------------
	OpenConnectiveWithMotion("connective_ace", player, player_reactor, player_reactor_L);
	
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_128_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================	
	
	CloseConnective();
	Wait_(30);
	
	SetMotion_(player, player_stand, BLEND_L);

	EndDemo(FADE_COLOR_BLACK);
}
