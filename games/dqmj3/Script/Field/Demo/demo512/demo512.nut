//=============================================
//
//		demo512[Ａランク試験_5(2回戦勝利)]
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

	local model_kimendousi = ReadNpc_("m076_01");		//きめんどうし
	local model_gamegonlood = ReadNpc_("m024_01");		//ガメゴンロード
	local model_nizikujac = ReadNpc_("m061_00");		//にじくじゃく


// ▼配置
	// 主人公
	SetPointPos_(player, "player000");

	local kimendousi = ArrangePointNpc_(model_kimendousi, "npc_nizikujac000");					//位置が間違っているため、にじくじゃくと入れ替え
	local gamegonlood = ArrangePointNpc_(model_gamegonlood, "npc_gamegonlood000");
	local nizikujac = ArrangePointNpc_(model_nizikujac, "npc_kimendousi000");					//位置が間違っているため、きめんどうしと入れ替え

	//▼モンスターのスケール
	SetScaleSilhouette(kimendousi, SCALE.N, SILHOUETTE_WIDTH.N);	
	SetScaleSilhouette(gamegonlood, SCALE.M, SILHOUETTE_WIDTH.M);	
	SetScaleSilhouette(nizikujac, SCALE.N, SILHOUETTE_WIDTH.N);	
	
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
	//*テレジア
	// 	「２戦目の勝利　おめでとうございます。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TEREZIA");
	ShowMsg_("DEMO_512_MSG_010");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	//*テレジア
	// 	「最後まで　ご健闘くださいませ。
	//-----------------------------------------------
	ShowMsg_("DEMO_512_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	
	WaitTask(task_cam);
	DeleteTask_(task_cam);
	
	EncountEndDemo(ENCOUNT_NORMAL);
}
