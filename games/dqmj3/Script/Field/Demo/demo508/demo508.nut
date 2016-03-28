//=============================================
//
//		[Ａランク試験_2(扉前)]
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
	local regen;

// ▼リソース読込
	// キャラクター
	local player = GetPlayerId_();						// 主人公
	local model_lejendhoon = ReadNpc_("m043_01");		// レジェンドホーン
	local model_seto = ReadNpc_("m017_03");				// まかいファイター
	local model_behomasuraimu = ReadNpc_("m005_02");	// ベホマスライム
	local model_zigokunoyoroi = ReadNpc_("m111_01");	// じごくのよろい
	// エフェクト
	LoadEffect_("ef742_01_div_mag_hoimi");				// 回復

// ▼配置
	// 主人公
	SetPointPos_(player, "player000");
	// 敵パーティ
	local lejendhoon = ArrangePointNpc_(model_lejendhoon, "npc_lejendhoon000");
	local seto = ArrangePointNpc_(model_seto, "npc_zigokunoyoroi000");				//位置が間違っているため、じごくよろいと入れ替え
	local behomasuraimu = ArrangePointNpc_(model_behomasuraimu, "npc_behomasuraimu000");
	local zigokunoyoroi = ArrangePointNpc_(model_zigokunoyoroi, "npc_seto000");		//位置が間違っているため、まかいファイターと入れ替え
	SetScaleSilhouette(lejendhoon, SCALE.N, SILHOUETTE_WIDTH.N);
	SetScaleSilhouette(seto, SCALE.N, SILHOUETTE_WIDTH.N);
	SetScaleSilhouette(behomasuraimu, SCALE.S, SILHOUETTE_WIDTH.S);
	SetScaleSilhouette(zigokunoyoroi, SCALE.N, SILHOUETTE_WIDTH.N);

// ▼非常駐モーション読込
	local battlewait = ReadMotion_(player, "Player_battle_L");		// 戦闘待機L

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
	ShowMsg_("DEMO_508_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	PlaySE_("SE_SHA_003");		//回復SE
	regen = SetSelectBoneEffect_("ef742_01_div_mag_hoimi", player, ATTACH_GLOBAL);		// 回復エフェクト
	
	//===============================================
	// ◇システムメッセージ
	// ＨＰと　ＭＰが　全回復した！
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_508_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	//===============================================
	// ■テレジア
	// 「では　これより　Ａランクの
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TEREZIA");
	ShowMsg_("DEMO_508_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(player, battlewait, 15);
	Wait_(30);
	
	// ▼カット２＠～～～～～～～～～～～～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	WaitTask(task_cam);
	
	EncountEndDemo(ENCOUNT_NORMAL);
}