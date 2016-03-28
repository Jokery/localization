//=============================================
//
//		demo648[ガルマザード戦勝利_7(回復-崩落)]
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
	local task_cam, task_player, task_ace, task_jack, task_king, task_hunter, task_nocho;
	local efc_player, efc_cam, efc_catastrophe000;

// ▼時間設定
	SetTime_(8700);								//夜

// ▼リソース読込
	// キャラクター
	local player = GetPlayerId_();													// 主人公
	local model_nocho = ReadNpc_("n043");			// ノチョリン
	local model_nocho_female = ReadNpc_("n004");	// 一般ノチョーラ（♀）
	local model_jack = ReadNpc_("n001");			// ジャック
	local model_ace = ReadNpc_("n002");				// エース
	local model_king = ReadNpc_("n003");			// キング
	local model_queen = ReadNpc_("n005");			// クイーン
	local model_hunter = ReadNpc_("n006");			// リアクターハンター
	// ギミック読み込み
	local obj_center = ReadGimmick_("o_A00_04");									// センタービルの明かり
	// エフェクト読み込み
	LoadEffect_("ef864_04_catastrophe01");											// 瘴気
	LoadEffect_("ef864_05_catastrophe02");											// 天使のはしご
	LoadEffect_("ef220_08_hikarinohadou");											// ひかりの波動

// ▼配置
	//ノチョーラ
	local nochorin = ArrangePointNpc_(model_nocho, "npc_nocho000");				// ノチョリン
	local nocho = ArrangePointNpc_(model_nocho_female, "npc_nocho100");			// ノチョ♀
	local jack = ArrangePointNpc_(model_jack, "npc_jack000");					// ジャック
	local ace = ArrangePointNpc_(model_ace, "npc_ace000");						// エース
	local king = ArrangePointNpc_(model_king, "npc_king000");					// キング
	local queen = ArrangePointNpc_(model_queen, "npc_queen000");				// クイーン
	SetStepSe_(queen, SILENT_STEP_SE);
	local hunter = ArrangePointNpc_(model_hunter, "npc_hunter000");				// ハンター
	//ギミック
	local center = ArrangePointGimmick_("o_A00_04",obj_center, "obj_center000");
	SetMotion_(center, MOT_GIMMICK_1, BLEND_M);										// センタービルの明かり　点灯

// ▼非常駐モーション読込
	//ノチョーラ
	local ace_joy = ReadMotion_(ace, "n002_talk_joy_L");			// エース　嬉しそう
	local ace_run = ReadMotion_(ace, "n001_run_L");					// エース 走るL
	local jack_joy = ReadMotion_(jack, "n001_rejoice_L");			// ジャック　嬉しそう
	local hunter_run = ReadMotion_(hunter, "n001_run_L");			// ハンター 走るL
	local nocho_jump = ReadMotion_(nochorin, "n002_talk_joy_L");	// ノチョリン 飛び跳ねるL
	local nocho_look_up = ReadMotion_(nocho, "n002_look_up_L");		// ノチョ♀上向き待機L
	local queen_look_up = ReadMotion_(queen, "n002_look_up_L");		// クイーン上向き待機L
	local queen_nod = ReadMotion_(queen, "n001_nod");				// クイーンうなづく	

	//キング
	local king_stick = ReadMotion_(king, "n003_stick_up");		// 通常待機→杖をかかげる
	local king_stick_L = ReadMotion_(king, "n003_stick_up_L");	// 杖をかかげるL

//	▼初期モーション
	SetMotion_(jack, jack_joy, BLEND_N); 
	SetMotion_(nochorin, nocho_jump, BLEND_N);
	SetMotion_(nocho, nocho_look_up, BLEND_N);
	SetMotion_(queen, queen_look_up, BLEND_N);

//	▼初期エフェクト
	efc_catastrophe000 = SetCameraEffect_("ef864_04_catastrophe01", 100);			// 瘴気

//	▼カメラ設定
	ReadWaitingLod("cameye000", "camtgt000");										//Lod読込
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");


//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット1 崩落全景
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	StartDemoNoFade(FADE_COLOR_WHITE);

	efc_cam = SetCameraEffect_("ef220_08_hikarinohadou", 100);					//波動
	SetEffectScale_(efc_cam, 4.0);
	PlaySE_("SE_DEM_192");
	DeleteEffectEmitter_(efc_catastrophe000);									//瘴気消滅
	ChangeTime(0, 30, 8700);													//夜から昼に

	// 天使のはしご
	local efc_catastrophe000 = SetPointWorldEffect_("ef864_05_catastrophe02", "efc_catastrophe000");
	local efc_catastrophe001 = SetPointWorldEffect_("ef864_05_catastrophe02", "efc_catastrophe001");
	local efc_catastrophe002 = SetPointWorldEffect_("ef864_05_catastrophe02", "efc_catastrophe002");
	local efc_catastrophe005 = SetPointWorldEffect_("ef864_05_catastrophe02", "efc_catastrophe005");

	SetEffectScale_(efc_catastrophe000, 4.5);
	SetEffectScale_(efc_catastrophe001, 4.5);
	SetEffectScale_(efc_catastrophe002, 3.8);
	SetEffectScale_(efc_catastrophe005, 5.5);

	WaitTask(task_cam);
	//........................................................................................................

	SetFade_(FADE_OUT, FADE_COLOR_WHITE, 30);													//フェードアウト
	DeleteEffectEmitter_(efc_catastrophe000);									//天使の柱消滅
	DeleteEffectEmitter_(efc_catastrophe001);									//天使の柱消滅
	DeleteEffectEmitter_(efc_catastrophe002);									//天使の柱消滅
	DeleteEffectEmitter_(efc_catastrophe005);									//天使の柱消滅

	local efc_catastrophe003 = SetPointWorldEffect_("ef864_05_catastrophe02", "efc_catastrophe003");
	local efc_catastrophe004 = SetPointWorldEffect_("ef864_05_catastrophe02", "efc_catastrophe004");
	local efc_catastrophe006 = SetPointWorldEffect_("ef864_05_catastrophe02", "efc_catastrophe006");
	local efc_catastrophe007 = SetPointWorldEffect_("ef864_05_catastrophe02", "efc_catastrophe007");

	SetEffectScale_(efc_catastrophe003, 3.5);
	SetEffectScale_(efc_catastrophe004, 3.5);
	SetEffectScale_(efc_catastrophe006, 3.5);
	SetEffectScale_(efc_catastrophe007, 4.0);

	WaitFade_();
	ReadWaitingLod("cameye001", "camtgt001");										//Lod読込
	SetMotion_(hunter, hunter_run, BLEND_N); 	
	task_hunter = Task_MoveForward_(hunter, 0.8, true);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット2　ノチョーラたち
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");

	SetFade_(FADE_IN, FADE_COLOR_WHITE, 30);													//フェードイン
	//........................................................................................................
	Wait_(20);
	SetMotion_(hunter, MOT_WAIT, BLEND_M); 										//ハンター走る
	DeleteTask_(task_hunter);

	WaitTask(task_cam);
	task_nocho = Task_WalkAroundToPos(queen, GetPos_(king), 5.7);				//クイーン　キングに向きうなづく
	WaitTask(task_nocho);
	SetMotion_(queen, MOT_WAIT, BLEND_L);

	SetMotion_(king, king_stick, BLEND_XL);										//キング杖
	WaitMotion(king);
	SetMotion_(king, king_stick_L, BLEND_M);

	Wait_(50);
	SetEffectScale_(efc_catastrophe004, 3.0);
	SetEffectScale_(efc_catastrophe006, 2.0);
	SetEffectScale_(efc_catastrophe007, 3.0);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット3　エース、ノチョリン
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");

	SetMotion_(ace, ace_joy, BLEND_L);
	Wait_(180);

	EndDemo(FADE_COLOR_WHITE);
}
