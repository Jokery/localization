//=============================================
//
//		demo126[部屋を守るガードマスター]
//
//=============================================
function Update()
{

// ▼変数定義
	local task_cam, task_player, task_ace;
	local efc_ace;
	
// ▼リソース読込
	local player = GetPlayerId_();
	local model_guard = ReadNpc_("m121_00");	// ◆ガードマスターのモデルが未実装なのでキラーマシン２で代用しています。
	local model_ace = ReadNpc_("n002");			// エース
	
	local model_door = ReadGimmick_("o_A03_00");
	
	LoadEffect_("ef712_01_emo_notice01");		// 気づき
	LoadEffect_("ef812_01_off_monoeye");		// モノアイ閉じる
	
// ▼配置
	SetPointPos_(player, "player000");
	
	local guard = ArrangePointNpc_(model_guard, "npc_guard000");
	SetScaleSilhouette(guard, SCALE.M, SILHOUETTE_WIDTH.M);
	SetDir_(guard, 180);
	
	local ace = ArrangePointNpc_(model_ace, "npc_ace000");
	
	local door000 = ArrangePointGimmick_("o_A03_00", model_door, "obj_door000");
	local monoeye_OFF = SetSelectBoneEffect_("ef812_01_off_monoeye", guard, ATTACH_GLOBAL);
	
// ▼非常駐モーション読込
	local player_look_walk_L = ReadMotion_(player, "Player_look_walk_L");		// キョロキョロ歩き
	local player_look_around_L = ReadMotion_(player, "Player_look_around_L");	// キョロキョロL
	local player_battle_L = ReadMotion_(player, "Player_battle_L");				// 戦闘待機
	local guard_stop_L = ReadMotion_(guard, "m121_00_stop_L");					// 静止L
	local ace_surprise = ReadMotion_(ace, "n000_surprise");						// 驚く
	local ace_shock_L = ReadMotion_(ace, "n000_shock_L");						// 驚くL（怯える風）
	local ace_run_L = ReadMotion_(ace, "n001_run_L");							// 走る
	local ace_look_araund02_L = ReadMotion_(ace, "n002_look_araund02_L");		// 辺りを見回す2L
	
// ▼初期のモーション
	SetMotion_(guard, guard_stop_L, BLEND_N);		// ◆ガードマスター静止モーション
	
// ▼カメラ設定
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	
//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	SetMotion_(door000, MOT_GIMMICK_1, BLEND_N);	// 電子ドア(開く);
	PlaySE_("SE_DEM_041");
	
	Wait_(15);
	SetMotion_(ace, ace_run_L, BLEND_M);			// 走る
	Wait_(2);
	task_ace = Task_MoveForward_(ace, 0.6, true);
	
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 10);
	WaitFade_();
	
	Wait_(10);
	SetMotion_(door000, MOT_GIMMICK_2, BLEND_N);	// 電子ドア(開いた状態);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット2
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	
	SetPointPos_(ace, "npc_ace001");
	SetMotion_(ace, ace_look_araund02_L, BLEND_N);	// 辺りを見回す2L
	DeleteTask_(task_ace);
	
	SetPointPos_(player, "player001");
	SetMotion_(player, player_look_walk_L, BLEND_N);// キョロキョロ歩き
	task_player = Task_MoveForward_(player, 1.0, false);
	
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 10);
	
	Wait_(35);
	SetMotion_(player, player_look_around_L, BLEND_L);// キョロキョロL
	DeleteTask_(task_player);
	
	//エース「ようやく　問題の部屋に　入れたぜ。
	OpenMsgWnd_();	
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_126_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット3
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	Wait_(90);
	
	SetAlpha_(ace, ALPHA_CLEAR);		// エース非表示
	SetAlpha_(player, ALPHA_CLEAR);		// 主人公非表示
	
	WaitTask(task_cam);
	DeleteTask_(task_cam);
	
	SetPointPos_(player, "player002");
	SetPointPos_(ace, "npc_ace002");
	
	SetAlpha_(ace, ALPHA_EXIST);		// エース表示
	SetAlpha_(player, ALPHA_EXIST);		// 主人公表示
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット4
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");
	
	SetMotion_(player, player_battle_L, BLEND_M);	// 戦闘待機LOOP
	
	//エース「どわあっ！　なんか　いるぞっ！？
	OpenMsgWnd_();	
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_126_MSG_020");
	
	SetMotion_(ace, ace_surprise, BLEND_M);			// 通常待機→驚く
	efc_ace = SetSelectBoneEffect_("ef712_01_emo_notice01", ace, ATTACH_EFFECT2);	// 気づき
	WaitMotion(ace);
	DeleteEffect_(efc_ace);
	SetMotion_(ace, ace_run_L, BLEND_M);			// 走る
	task_ace = Task_AnimeMove_(ace, "anm_ace000");
	WaitTask(task_ace);
	DeleteTask_(task_ace);
	
	task_ace = Task_RotateToPos_(ace, GetPos_(player), 17.2);
	WaitTask(task_ace);
	SetMotion_(ace, ace_shock_L, BLEND_L);			// 驚くL（怯える風）
	DeleteTask_(task_ace);
	
	KeyInputWait_();
	CloseMsgWnd_();
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■デモ終了
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	
	EndDemo(FADE_COLOR_BLACK);
}
