//=============================================
//
//		demo024[Cランク試験_2(扉前)]
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
	local task_cam;
	local efc_player;
	//local flg_rematch = GetEventFlg_("BFG_REMATCH_RANK_C");		// Bit_1024 Cランク再戦フラグ

// ▼リソース読込
	// キャラクター
	local player = GetPlayerId_();					// 主人公
	local model_slime = ReadNpc_("m000_00");		// スライム
	local model_alumi = ReadNpc_("m036_00");		// アルミラージ
	local model_onion = ReadNpc_("m065_00");		// オニオーン
	//エフェクト
	LoadEffect_("ef742_01_div_mag_hoimi");			// 回復

// ▼配置
	// 主人公
	SetPointPos_(player, "player000");
	// 敵パーティ
	local enemy00 = ArrangePointNpc_(model_slime, "npc_three000");
	local enemy01 = ArrangePointNpc_(model_alumi, "npc_three100");
	local enemy02 = ArrangePointNpc_(model_onion, "npc_three200");
	SetScaleSilhouette(enemy00, SCALE.S, SILHOUETTE_WIDTH.S);
	SetScaleSilhouette(enemy01, SCALE.S, SILHOUETTE_WIDTH.S);
	SetScaleSilhouette(enemy02, SCALE.N, SILHOUETTE_WIDTH.N);

// ▼非常駐モーション読込
	local player_battle_L = ReadMotion_(player, "Player_battle_L");		// 戦闘待機L

// ▼カメラ設定
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	// ▼カット１＠～～～～～～～～～～～～～～～～～～～～～～
	StartDemo(FADE_COLOR_BLACK);
	
	//===============================================
	// ■テレジア
	// 「試験の前に　仲間モンスターの
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TEREZIA");
	ShowMsg_("DEMO_024_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	PlaySE_("SE_SHA_003");		//回復SE
	efc_player = SetSelectBoneEffect_("ef742_01_div_mag_hoimi", player, ATTACH_GLOBAL);		// 回復エフェクト
	
	//===============================================
	// ◇システムメッセージ
	// 「ＨＰと　ＭＰが　全回復した！
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_024_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	// 初回時
	//if (!flg_rematch) {
		//===============================================
		// ■テレジア
		// 「では　これより　Ｃランクの
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_TEREZIA");
		ShowMsg_("DEMO_024_MSG_030");
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================
	//}
	
	// 再戦時
	/*else {
		//===============================================
		// ■テレジア
		// 「再挑戦を　お待ちしておりました。
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_TEREZIA");
		ShowMsg_("DEMO_024_MSG_004");
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================
	}*/
	
	SetMotion_(player, player_battle_L, BLEND_XL);		// 戦闘待機LOOP
	Wait_(30);
	
	// ▼カット２＠～～～～～～～～～～～～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	
	WaitTask(task_cam);
	DeleteTask_(task_cam);
	
	EncountEndDemo(ENCOUNT_NORMAL);
}