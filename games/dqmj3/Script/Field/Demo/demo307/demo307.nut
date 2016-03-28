//=============================================
//
//		demo307[Bランク試験_4(1回戦勝利)]
//
//=============================================

//-------------------------------------------------------------------------
//
//		読み込み・配置
//
//-------------------------------------------------------------------------
function Update()
{

// ▼ローカル変数の設定
	// フラグ取得
	local regen;
	
// ▼プレイヤー設置
	//IDの取得
	local player = GetPlayerId_();
	
	//設置
	SetPointPos_(player, "player000");
	
// ▼リソースの読み込み

	//モデルの読み込み
	local model_aiantrtle = ReadNpc_("m144_00");			// アイアンタートル
	local model_putianon = ReadNpc_("m133_00");				// プチアーノン
	local model_puristnight = ReadNpc_("m084_00");			// プリーストナイト
	local model_bikkurimarion = ReadNpc_("m147_01");		// ピッグマリオン

	//モーションの読み込み
	local battlewait = ReadMotion_(player, "Player_battle_L");		//戦闘待機
	local player_battle_L = ReadMotion_(player, "Player_battle_L");
	
	//エフェクトの読み込み
	LoadEffect_("ef742_01_div_mag_hoimi");// 回復エフェクト
	
// ▼NPC設置	
	//設置
	local aiantrtle = ArrangePointNpc_(model_aiantrtle, "npc_aiantrtle000");
	local putianon = ArrangePointNpc_(model_putianon, "npc_putianon000");
	local puristnight = ArrangePointNpc_(model_puristnight, "npc_spuristnight000");
	local bikkurimarion = ArrangePointNpc_(model_bikkurimarion, "npc__bikkurimarion000");
	
	//モンスターのスケール
	SetScaleSilhouette(aiantrtle, SCALE.N, SILHOUETTE_WIDTH.S);	
	SetScaleSilhouette(putianon, SCALE.S, SILHOUETTE_WIDTH.S);	
	SetScaleSilhouette(puristnight, SCALE.N, SILHOUETTE_WIDTH.S);	
	SetScaleSilhouette(bikkurimarion, SCALE.S, SILHOUETTE_WIDTH.S);	
	
	//初期の向き
	SetDir_(player, 270);
	
	SetDir_(aiantrtle, 110);
	SetDir_(putianon, 430);
	SetDir_(puristnight, 445);
	SetDir_(bikkurimarion, 95);
	
// ▼モーション設定
	SetMotion_(player, player_battle_L, BLEND_N);

	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット１
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	
	SetMotion_(player, battlewait, 15);	
	Wait_(30);
	
	// ▼カメラ視点設定
	SetPointCameraEye_("cameye000");
	
	// ▼カメラ注視点設定
	SetPointCameraTarget_("camtgt000");
		
	StartDemo(FADE_COLOR_BLACK);
	StartDemo(FADE_COLOR_BLACK);
	
	//===============================================
	//■テレジア
	// 「おみごとです　<name_player/>さま。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TEREZIA");
	ShowMsg_("DEMO_307_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
		
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット2
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	
	// BGM停止
	StopBgm_(30);
	
	local task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");		//◆戦闘用のカメラが丸コピできていないので、使えるようになったら変更してください。
	
	Wait_(80);
	
	Wait_(2);
	
	DeleteTask_(task_cam);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■デモ終了
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	
	EncountEndDemo(ENCOUNT_NORMAL);
}