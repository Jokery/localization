//=============================================
//
//		demo419[イッタブル再戦]
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
	local player = GetPlayerId_();						// 主人公
	local model_ittabule = ReadNpc_("m205_00");			// イッタブル
	local model_control = ReadGimmick_("o_S02_09");		// コントロールパネル電源

// ▼配置
	// 主人公
	local ittabule = ArrangePointNpc_(model_ittabule, "monster_ittabule000");
	local m_control = ArrangePointGimmick_("o_S02_09", model_control, "modele_control000");

	LoadEffect_("ef730_01_oth_dark_aura01");
	local efc_azamuku = SetSelectBoneEffectSetOffset_("ef730_01_oth_dark_aura01", ittabule, ATTACH_EFFECT2, Vec3(0.0, -10.0, 0.0));

// ▼カメラ設定
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------
	
	StartDemo(FADE_COLOR_BLACK);
	
	//===============================================
	// ■イッタブル
	// 「ワーハッハッハッ！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ITABURU");
	ShowMsg_("DEMO_419_MSG_001");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	// ■イッタブル
	// 「不死身のアンセスとは
	//-----------------------------------------------
	ShowMsg_("DEMO_419_MSG_002");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	// ■イッタブル
	// 「しかし何度　来ようと　無駄なのである！
	//-----------------------------------------------
	ShowMsg_("DEMO_419_MSG_003");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(ittabule, MOT_SPELL_ACTUATE, BLEND_L);		// イッタブル 攻撃
	PlaySE_("SE_DEM_091");

	Wait_(30);
		
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
		
	EncountEndDemo(ENCOUNT_BOSS);
}
