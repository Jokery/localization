//=============================================
//
//		demo107[電源の復旧_3(起動後)]
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
	local efc00_acc, efc01_srp, efc02, ef0c3, efc04, efc05, efc06, efc07, efc08, efc09;
	local task_cam, task_player, task_npc01, task_npc02, task_npc03;
	
// ▼モデル読込
	// キャラクター
	local player = GetPlayerId_();					// 主人公
	// ギミック
	local model_monitor = ReadGimmick_("o_A02_02");	// モニタ

// ▼配置
	// モニタ
	local monitor = ArrangePointGimmick_("o_A02_02", model_monitor, "obj_monitor000");
	SetMotion_(monitor, MOT_GIMMICK_5, BLEND_N);		// モニタ開錠
	
	// 主人公
	SetPointPos_(player, "player000");

// ▼非常駐モーション読込
	// 主人公
	local player_reactor = ReadMotion_(player, "Player_touch_reactor");			// 顔を少し左向ける→リアクターを触る
	local player_reactor_L = ReadMotion_(player, "Player_touch_reactor_L");		// リアクターを触るL
	local player_stand = ReadMotion_(player, "Player_stand01");					// リアクターを触る→待機に戻る
	
	
// ▼エフェクト読み込み
	LoadEffect_("ef732_09_light_reactor_c");					// リアクター発光
	LoadEffect_("ef712_10_emo_surprise01");			//驚き

// ▼カメラ設定
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	SurpriseDisp(player);		// 主人公　驚き
	Wait_(20);
	
	local light = SetSelectBoneEffect_("ef732_09_light_reactor_c", player, ATTACH_EFFECT1);	//リアクター発光
	
	// コネクティブモードON
	OpenConnectiveWithMotion("connective_ace", player, player_reactor, player_reactor_L);
	
	//===============================================
	// ■エース
	// 「やったぜ　<name_player/>！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_107_MSG_010");
	KeyInputWait_();
	//-----------------------------------------------
	// ▽
	// 「オメーも　早く戻ってこいよ！
	//-----------------------------------------------
	ShowMsg_("DEMO_107_MSG_020");
	KeyInputWait_();
	//-----------------------------------------------
	// ▽
	// 「より道　すんなよだぜ！
	//-----------------------------------------------
	ShowMsg_("DEMO_107_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================	
	
	// コネクティブモードOFF
	CloseConnective();
	
	Wait_(20);
	
	SetMotion_(player, player_stand, BLEND_L);
	
	EndDemo(FADE_COLOR_BLACK);
}
