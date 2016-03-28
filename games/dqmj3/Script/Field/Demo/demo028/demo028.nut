//=============================================
//
//		demo028[Cランク試験_5(2回戦勝利)]
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
	local model_hoippu = ReadNpc_("m100_00");		// ホイップゴースト
	local model_abare = ReadNpc_("m051_00");		// あばれうしどり

// ▼配置
	// 主人公
	SetPointPos_(player, "player000");
	// 敵パーティ
	local enemy00 = ArrangePointNpc_(model_hoippu, "npc_four000");
	local enemy01 = ArrangePointNpc_(model_abare, "npc_four100");
	local enemy02 = ArrangePointNpc_(model_abare, "npc_four200");
	local enemy03 = ArrangePointNpc_(model_hoippu, "npc_four300");
	SetScaleSilhouette(enemy00, SCALE.S, SILHOUETTE_WIDTH.S);
	SetScaleSilhouette(enemy01, SCALE.N, SILHOUETTE_WIDTH.N);
	SetScaleSilhouette(enemy02, SCALE.N, SILHOUETTE_WIDTH.N);
	SetScaleSilhouette(enemy03, SCALE.S, SILHOUETTE_WIDTH.S);

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

	// ▼カット１＠〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜
	StartDemo(FADE_COLOR_BLACK);
	
	//===============================================
	//■テレジア
	// 「２戦目の勝利　おめでとうございます。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TEREZIA");
	ShowMsg_("DEMO_028_MSG_010");
	KeyInputWait_();
	
	//-----------------------------------------------
	// ▽
	// 「油断されることなく
	//-----------------------------------------------
	ShowMsg_("DEMO_028_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	// ▼カット２＠〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	
	WaitTask(task_cam);
	DeleteTask_(task_cam);
	
	EncountEndDemo(ENCOUNT_NORMAL);
}