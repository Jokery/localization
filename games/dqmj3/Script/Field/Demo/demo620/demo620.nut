//=============================================
//
//		demo620[最後のパワー_4(1回戦勝利)]
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
	local model_fankidorago = ReadNpc_("m019_02");		// ファンキードラゴ
	local model_captendorago = ReadNpc_("m019_03");		// キャプテンドラゴ
	local model_doragonkis = ReadNpc_("m021_00");		// ドラゴンキッズ
	local model_merakthedo = ReadNpc_("m021_01");		// メラリザード
	

// ▼配置
	// 主人公
	SetPointPos_(player, "player000");


	// ▼NPC設置	
	// 設置
	local fankidorago = ArrangePointNpc_(model_fankidorago, "npc_fankidorago000");
	local captendorago = ArrangePointNpc_(model_captendorago, "npc_captendorago000");
	local doragonkis = ArrangePointNpc_(model_doragonkis, "npc_doragonkis000");
	local merakthedo = ArrangePointNpc_(model_merakthedo, "npc_merakthedo000");
	
	//▼モンスターのスケール
	SetScaleSilhouette(fankidorago, SCALE.S, SILHOUETTE_WIDTH.S);	
	SetScaleSilhouette(captendorago, SCALE.S, SILHOUETTE_WIDTH.S);	
	SetScaleSilhouette(doragonkis, SCALE.S, SILHOUETTE_WIDTH.S);	
	SetScaleSilhouette(merakthedo, SCALE.S, SILHOUETTE_WIDTH.S);	
	
	//▼モーションの読み込み
	local battlewait = ReadMotion_(player, "Player_battle_L");		// 戦闘待機

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
	// ■テレジア
	// 「おみごとです　<name_player/>さま。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TEREZIA");
	ShowMsg_("DEMO_620_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	local task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	Wait_(80);
	
	Wait_(2);
	
	DeleteTask_(task_cam);
	
	EncountEndDemo(ENCOUNT_NORMAL);
}