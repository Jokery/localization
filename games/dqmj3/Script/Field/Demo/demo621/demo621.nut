//=============================================
//
//		demo621[最後のパワー_5(2回戦勝利)]
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
	local player = GetPlayerId_();					// 主人公

	local model_bebynewto = ReadNpc_("m021_02");		// ベビーニュート
	local model_ltiyraiban = ReadNpc_("m021_03");		// リトルライバーン
	local model_kireapansaer = ReadNpc_("m032_00");		// キラーパンサー
	local model_kireataiger = ReadNpc_("m032_01");		// キラータイガー

// ▼配置
	// 主人公
	SetPointPos_(player, "player000");

	local bebynewto = ArrangePointNpc_(model_bebynewto, "npc_bebynewto000");
	local ltiyraiban = ArrangePointNpc_(model_ltiyraiban, "npc_ltiyraiban000");
	local kireapansaer = ArrangePointNpc_(model_kireapansaer, "npc_nizikujac000");
	local kireataiger = ArrangePointNpc_(model_kireataiger, "npc_kireataiger000");

//▼モンスターのスケール
	SetScaleSilhouette(bebynewto, SCALE.S, SILHOUETTE_WIDTH.S);	
	SetScaleSilhouette(ltiyraiban, SCALE.S, SILHOUETTE_WIDTH.S);	
	SetScaleSilhouette(kireapansaer, SCALE.N, SILHOUETTE_WIDTH.N);
	SetScaleSilhouette(kireataiger, SCALE.N, SILHOUETTE_WIDTH.N);
		
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
	// ■テレジア
	// 「２戦目の勝利　おめでとうございます。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TEREZIA");
	ShowMsg_("DEMO_621_MSG_010");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	// ■テレジア
	// 「油断されることなく
	//-----------------------------------------------
	ShowMsg_("DEMO_621_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	
	WaitTask(task_cam);
	DeleteTask_(task_cam);
	
	EncountEndDemo(ENCOUNT_NORMAL);
}
