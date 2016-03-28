//=============================================
//
//		demo011[戦闘チュートリアル導入_2(敗北)]
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
	local efc_player, efc_nochoman;

// ▼モデル読込
	// キャラクター
	local player = GetPlayerId_();					// 主人公
	local model_nochoman = ReadNpc_("n043");		// ノチョリン
	// エフェクト
	LoadEffect_("ef742_01_div_mag_hoimi");			// 回復エフェクト
	LoadEffect_("ef712_13_emo_sweat01");			// 汗エフェクト読み込み

// ▼配置
	// 主人公
	SetPointPos_(player, "player000");
	SetFace_(player, "Face_grimace_close");
	// ノチョーラ
	local nochoman = ArrangePointNpc_(model_nochoman, "npc_nochoman000");
	
// ▼非常駐モーション読込
	local Player_down_L = ReadMotion_(player, "Player_down_L");	
	local n000_impatience_L = ReadMotion_(nochoman, "n000_impatience_L");					// 焦り

// ▼初期のモーション
	SetMotion_(player, Player_down_L, BLEND_N);
	SetMotion_(nochoman, n000_impatience_L, BLEND_N);

	efc_player = SetSelectBoneEffect_("ef712_13_emo_sweat01", nochoman, ATTACH_EFFECT2);	// 汗エフェクト
	
// ▼カメラ設定
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	//===============================================
	// *ノチョーラ
	// 「はわわ！　なんで負けてるっちょ！？
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_011_MSG_010");
	KeyInputWait_();
	//「回復するから　もう１回　がんばるっちょ！
	ShowMsg_("DEMO_011_MSG_020");
	KeyInputWait_();
	//「お前なら　仲間にした魔物と　一緒に
	ShowMsg_("DEMO_011_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(20);
	
	//===============================================
	//システムメッセージ「全回復した
	//-----------------------------------------------	
	PlaySE_("SE_SHA_003");																// 回復SE
	efc_player = SetSelectBoneEffect_("ef742_01_div_mag_hoimi", player, ATTACH_GLOBAL);	// 回復エフェクト

	OpenMsgWnd_();
	ShowMsg_("DEMO_011_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	EndDemo(FADE_COLOR_BLACK);
}
