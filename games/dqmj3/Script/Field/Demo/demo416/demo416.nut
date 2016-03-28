//=============================================
//
//		demo416[改造装置爆破作戦]
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
	local task_cam, task_player, task_rukiya;
	local efc_player, efc_rukiya;

// ▼リソース読込
	// キャラクター
	local player = GetPlayerId_();					// 主人公
	local n_rukiya = ReadNpc_("n009");				// ルキヤ

// ▼配置
	SetPointPos_(player, "player000");							// 主人公
	local rukiya = ArrangePointNpc_(n_rukiya, "npc_rukiya000");	// ルキヤ

// ▼非常駐モーション読込
	local player_touch_reactor = ReadMotion_(player, "Player_touch_reactor");
	local player_touch_reactor_L = ReadMotion_(player, "Player_touch_reactor_L");

// ▼エフェクト読み込み
	LoadEffect_("ef732_09_light_reactor_c");		// リアクター発光

// ▼カメラ設定
	SetPointCameraEye_("2_eye");
	SetPointCameraTarget_("2_tgt");
//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	SetMotion_(rukiya, MOT_TALK, BLEND_XL);
	WaitMotion(rukiya);
	//===============================================
	// ■ルキヤ
	// 「囚人を　逃がしてくれたみたいだね。
	// 　ごくろうさん　よくやってくれた。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RUKIYA");
	ShowMsg_("DEMO_416_MSG_005");
	SetMotion_(rukiya, MOT_TALKLOOP, BLEND_XL);
	KeyInputWait_();
	//-----------------------------------------------
	
	//-----------------------------------------------
	// ■ルキヤ
	// 「さて……ブレイク化改造装置を　ぶっ壊す前に
	//-----------------------------------------------
	ShowMsg_("DEMO_416_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	SetMotion_(rukiya, MOT_WAIT, BLEND_L);
	Wait_(10);	
		
	SetPointCameraEye_("3_eye");
	SetPointCameraTarget_("3_tgt");
		
	Wait_(10);
	PlaySE_("SE_FLD_135");		// リアクター反応音
	efc_rukiya = SetSelectBoneEffect_("ef732_09_light_reactor_c", rukiya, ATTACH_EFFECT1);	// リアクター発光
	SetEffectScale_(efc_rukiya, 0.7);
	Wait_(30);
	PlaySE_("SE_FLD_135");		// リアクター反応音
	efc_player = SetSelectBoneEffect_("ef732_09_light_reactor_c", player, ATTACH_EFFECT1);	// リアクター発光
	SetEffectScale_(efc_player, 0.7);
	Wait_(30);
	SetPointCameraEye_("4_eye");
	SetPointCameraTarget_("4_tgt");
	SetMotion_(player, player_touch_reactor, BLEND_L);
	SetFace_(player, "Face_left");	
	WaitMotion(player);
	SetMotion_(player, player_touch_reactor_L, BLEND_N);

	//===============================================
	// ■リアクター
	// 「……未知のシステムデータを　受信しました。
	// 　戦闘ライドの機能を　利用可能です。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_REACTOR");
	ShowMsg_("DEMO_416_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(rukiya, MOT_TALK, BLEND_XL);
	WaitMotion(rukiya);
	SetMotion_(rukiya, MOT_TALKLOOP, BLEND_XL)
	task_cam = Task_AnimeMoveCamera_("5_eye", "5_tgt");

	//===============================================
	// ■ルキヤ
	// 「戦闘ライドっていうのはね　戦闘中にも
	// 　仲間にした魔物に　乗れるようになる　機能さ。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RUKIYA");
	ShowMsg_("DEMO_416_MSG_030");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	// ■ルキヤ
	// 「戦闘中　あんたが魔物に乗ると
	// 　その魔物は　いつもよりパワーアップする。
	//-----------------------------------------------
	ShowMsg_("DEMO_416_MSG_040");
	KeyInputWait_();
	//===============================================

	//===============================================
	// ■ルキヤ
	// 「ともかく　使ってみるのが早いさ。
	// 　まずは　チュートリアルを　やってみな！
	//-----------------------------------------------
	ShowMsg_("DEMO_416_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(rukiya, MOT_WAIT, BLEND_XL);
	EndDemo(FADE_COLOR_BLACK);
}
