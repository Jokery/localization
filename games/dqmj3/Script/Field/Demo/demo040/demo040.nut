//=============================================
//
//		demo040[エースからの通信・ロック解除前_2]
//
//=============================================

function Update()
{

// ▼変数定義
	local efc_player;

// ▼リソース読込
	//プレイヤー
	local player = GetPlayerId_();
	//ギミック
	local model_switch000 = ReadGimmick_("o_H00_06");								// ウィンチ制御装置
	//エフェクト
	LoadEffect_("ef732_09_light_reactor_c");										// リアクター発光
	
// ▼配置
	SetPointPos_(player, "player000");
	
	local switch000 = ArrangePointGimmick_("o_H00_06", model_switch000, "obj_switch000");
	
// ▼非常駐モーション読込
	local Player_touch_reactor = ReadMotion_(player, "Player_touch_reactor");		// 主人公顔を少し左向ける→リアクターを触る
	local Player_touch_reactor_L = ReadMotion_(player, "Player_touch_reactor_L");	// 主人公リアクターを触るL
	local Player_panel02 = ReadMotion_(player, "Player_panel01");					// 主人公パネル操作
	
// ▼カメラ設定
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	
	SetDirToObject_(player, switch000);

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	efc_player = SetSelectBoneEffect_("ef732_09_light_reactor_c", player, ATTACH_EFFECT1);				// リアクター発光
	OpenConnectiveWithMotion("connective_ace", player, Player_touch_reactor, Player_touch_reactor_L);	// リアクターを触る→メッセージ表示
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_ACE");
		//お！そいつが籠を下すスイッチか
		ShowMsg_("DEMO_040_MSG_010");
		KeyInputWait_();
		CloseMsgWnd_();
	CloseConnective();
	Wait_(5);
	
	SetMotion_(player, MOT_WAIT, BLEND_L);
	Wait_(30);
	
	SetMotion_(player, Player_panel02, BLEND_L);														// 主人公パネル操作
	Wait_(20);
	PlaySE_("SE_DEM_029");																				// ■:SEスイッチ
	SetMotion_(player, MOT_WAIT, BLEND_L);
	Wait_(50);
	
	PlaySE_("SE_DEM_030");																				// ■:SE檻が床に降りる
	StartEarthQuake_(15, 3, 1);																			// 地震
	Wait_(70);
	
	DeleteEffect_(efc_player);
	
	efc_player = SetSelectBoneEffect_("ef732_09_light_reactor_c", player, ATTACH_EFFECT1);				// リアクター発光
	OpenConnectiveWithMotion("connective_ace", player, Player_touch_reactor, Player_touch_reactor_L);	// リアクターを触る→メッセージ表示
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_ACE");
		//これでカゴを下せたはずだ！
		ShowMsg_("DEMO_040_MSG_020");
		KeyInputWait_();
		CloseMsgWnd_();
	CloseConnective();
	
	SetMotion_(player, MOT_WAIT, BLEND_L);	
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■デモ終了
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	
	EndDemo(FADE_COLOR_BLACK);
	
}