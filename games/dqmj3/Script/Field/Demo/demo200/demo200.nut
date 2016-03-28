//========================================================
//
//              イベントNo.200 共同墓地全景
//
//========================================================

function Update()
{	
	//=====================================
	//ローカル変数の設定
	//=====================================
	local task_cam, task_dead, task_gaikotu, task_bat;					//タスク関係の変数
	local efc_player, efc_dead00, efc_dead01, efc_dead02;				//エフェクト関係の変数
	local player;														//キャラクターの変数
	
	//=====================================
	//リソース読み込み
	//=====================================
	// ▼モデル読込
	local model_dead = ReadNpc_("m102_00");								// くさった死体
	local model_gaikotu = ReadNpc_("m101_00");							// がいこつ
	local model_bat00 = ReadNpc_("m097_00");							// ボーンバット
	local model_bat01 = ReadNpc_("m097_02");							// ほねこうもり
	local model_rezard = ReadNpc_("m017_00");							// リザードマン

	// ▼ギミック読込
	local model_reddoor = ReadGimmick_("o_G00_00");						// アンデッドガーデンの扉(赤)
	local model_ruler = ReadGimmick_("o_com_08");						// ルーラポイント

	// ▼エフェクト読込
	LoadEffect_("ef726_02_nat_zombie");									// ゾンビ系が土から出てくるところ

	//=====================================
	//設置
	//=====================================
	//▼くさった死体
	local dead00 = ArrangePointNpc_(model_dead, "npc_dead000");
	SetScaleSilhouette(dead00, SCALE.M, SILHOUETTE_WIDTH.M);			//Mサイズ
	SetStepSe_(dead00, SILENT_STEP_SE);
	local dead01 = ArrangePointNpc_(model_dead, "npc_dead001");
	SetScaleSilhouette(dead01, SCALE.M, SILHOUETTE_WIDTH.M);			//Nサイズ
	SetStepSe_(dead01, SILENT_STEP_SE);

	//▼リザードマン
	local dead02 = ArrangePointNpc_(model_rezard, "npc_dead002");
	SetScaleSilhouette(dead02, SCALE.M, SILHOUETTE_WIDTH.M);			//Mサイズ
	SetStepSe_(dead02, SILENT_STEP_SE);

	//▼がいこつ
	local gaikotu00 = ArrangePointNpc_(model_gaikotu, "npc_gaikotu000");
	SetScaleSilhouette(gaikotu00, SCALE.M, SILHOUETTE_WIDTH.M);			//Mサイズ
	SetStepSe_(gaikotu00, SILENT_STEP_SE);

	//▼ほねこうもり
	local bat00 = ArrangePointNpc_(model_bat01, "npc_bat000");
	SetScaleSilhouette(bat00, SCALE.N, SILHOUETTE_WIDTH.N);				//Nサイズ
	SetStepSe_(bat00, SILENT_STEP_SE);

	//▼アンデッドガーデンの扉(赤)
	local reddoor = ArrangePointGimmick_("o_G00_00", model_reddoor, "obj_reddoor000");
	
	//▼ルーラポイント
	local ruler = ArrangePointGimmick_("o_com_08", model_ruler, "obj_ruler000");

	// ▼初期表示設定
	SetVisible(dead00, false);										//非表示な死体A
	SetVisible(dead01, false);										//非表示な死体B

	// ▼時間設定
	SetTime_(START_TIME_ZONE_NIGHT);
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット１
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	
	//～～～～～～～～～カメラ～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");

	
	StartDemo(FADE_COLOR_BLACK);
	
	SetMotion_(gaikotu00, MOT_WALK, BLEND_M);
	task_gaikotu = Task_MoveForward_(gaikotu00, 2.0, false);		//骸骨歩く
	
	Wait_(105);
	
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 15);						//フェードアウト
	WaitFade_();
	DeleteTask_(task_gaikotu);
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット2
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//～～～～～～～～～カメラ～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");


	SetFade_(FADE_IN, FADE_COLOR_BLACK, 15);						//フェードイン
	WaitFade_();
	
	SetMotion_(dead02, MOT_RUN, BLEND_N);													//走るリザードマン
	task_dead = Task_MoveForward_(dead02, 0.9, true);
	
	SetMotion_(dead00, MOT_LIFE_SPECIAL_1, BLEND_N);										//這い出る死体A
	SetVisible(dead00, true);																//表示される死体A
	efc_dead00 = SetSelectBoneEffect_("ef726_02_nat_zombie", dead00, ATTACH_GLOBAL);		//土エフェクト
	WaitMotion(dead00);
	SetMotion_(dead00, MOT_WAIT, BLEND_M);													//死体A待機
	
	SetMotion_(dead01, MOT_LIFE_SPECIAL_1, BLEND_N);										//這い出る死体B	
	SetVisible(dead01, true);																//表示される死体B
	efc_dead01 = SetSelectBoneEffect_("ef726_02_nat_zombie", dead01, ATTACH_GLOBAL);		//土エフェクト
	WaitMotion(dead01);
	SetMotion_(dead01, MOT_WAIT, BLEND_M);													//死体B待機
	
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 15);						//フェードアウト
	WaitFade_();
	DeleteTask_(task_dead);
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット3
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//～～～～～～～～～カメラ～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");

	SetFade_(FADE_IN, FADE_COLOR_BLACK, 15);						//フェードイン
	WaitFade_();
	
	WaitTask(task_cam);
	Wait_(15);
	
	EndDemo(FADE_COLOR_BLACK);
}
