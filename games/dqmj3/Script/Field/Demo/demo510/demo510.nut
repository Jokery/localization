//=============================================
//
//		demo510[Ａランク試験_4(1回戦勝利)]
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
	local model_dorodorian = ReadNpc_("m104_03");		//ドロドリアン
	local model_baronnaito = ReadNpc_("m112_02");		//バロンナイト
	local model_ailonkuku = ReadNpc_("m119_02");		//アイアンクック
	local model_togezyobo = ReadNpc_("m127_02");		//とげジョボー

// ▼配置
	// 主人公
	SetPointPos_(player, "player000");

	// ▼NPC設置
	//設置
	local dorodorian = ArrangePointNpc_(model_dorodorian, "npc_dorodorian000");
	local baronnaito = ArrangePointNpc_(model_baronnaito, "npc_baronnaito000");
	local ailonkuku = ArrangePointNpc_(model_ailonkuku, "npc_ailonkuku000");
	local togezyobo = ArrangePointNpc_(model_togezyobo, "npc_togezyobo000");

	//▼モンスターのスケール
	SetScaleSilhouette(dorodorian, SCALE.N, SILHOUETTE_WIDTH.N);	
	SetScaleSilhouette(baronnaito, SCALE.N, SILHOUETTE_WIDTH.N);	
	SetScaleSilhouette(ailonkuku, SCALE.S, SILHOUETTE_WIDTH.S);	
	SetScaleSilhouette(togezyobo, SCALE.S, SILHOUETTE_WIDTH.S);	

//▼モーションの読み込み
	local battlewait = ReadMotion_(player, "Player_battle_L");		//戦闘待機

// ▼非常駐モーション読込
	local player_battle_L = ReadMotion_(player, "Player_battle_L");

//▼モーションの実行
	SetMotion_(player, battlewait, 15);	
	Wait_(30);

// ▼カメラ設定
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");


//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);

	//===============================================
	//■テレジア
	//「おみごとです　<name_player/>さま。
	//　続けて　２戦目を　開始いたします。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TEREZIA");
	ShowMsg_("DEMO_510_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	local task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	Wait_(82);
	DeleteTask_(task_cam);

	EncountEndDemo(ENCOUNT_NORMAL);
}
