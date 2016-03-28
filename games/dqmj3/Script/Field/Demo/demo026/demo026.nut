//=============================================
//
//		demo026[Cランク試験_4(1回戦勝利)]
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

// ▼リソース読込
	// キャラクター
	local player = GetPlayerId_();					// 主人公
	local model_bighat = ReadNpc_("m048_00");		// ビッグハット
	local model_acorn = ReadNpc_("m067_00");		// どんぐりベビー
	local model_smile = ReadNpc_("m019_00");		// スマイルリザード

// ▼配置
	// 主人公
	SetPointPos_(player, "player000");
	// 敵パーティ
	local enemy00 = ArrangePointNpc_(model_bighat, "npc_three000");
	local enemy01 = ArrangePointNpc_(model_acorn, "npc_three100");
	local enemy02 = ArrangePointNpc_(model_smile, "npc_three200");
	SetScaleSilhouette(enemy00, SCALE.S, SILHOUETTE_WIDTH.S);
	SetScaleSilhouette(enemy01, SCALE.S, SILHOUETTE_WIDTH.S);
	SetScaleSilhouette(enemy02, SCALE.S, SILHOUETTE_WIDTH.S);

// ▼非常駐モーション読込
	local player_battle_L = ReadMotion_(player, "Player_battle_L");

// ▼モーション設定
	SetMotion_(player, player_battle_L, BLEND_N);

// ▼カメラ設定
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	// ▼カット１＠～～～～～～～～～～～～～～～～～～～～～～
	StartDemo(FADE_COLOR_BLACK);
	
	//===============================================
	//■テレジア
	// 「おみごとです　<name_player/>さま。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TEREZIA");
	ShowMsg_("DEMO_026_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	// ▼カット２＠～～～～～～～～～～～～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	
	WaitTask(task_cam);
	DeleteTask_(task_cam);
	
	EncountEndDemo(ENCOUNT_NORMAL);
}