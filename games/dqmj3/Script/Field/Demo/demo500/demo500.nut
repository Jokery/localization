//=============================================
//
//		demo500[焦熱の火山・全景]
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
	local task_cam, task_behoma1, task_behoma2, task_bomb1, task_bomb2, task_tenma0, task_tenma1, task_tenma2, task_tenma3;

// ▼リソース読込
	// キャラクター
	local player = GetPlayerId_();											// 主人公
	local model_tenma = ReadNpc_("m033_00");								// れんごく天馬
	local model_bomb = ReadNpc_("m209_00");									// ばくだんいわ(生態用)
	local model_magma = ReadNpc_("m116_03");								// マグマロン
	local model_hikui = ReadNpc_("m053_00");								// ひくいどり
	local model_behoma = ReadNpc_("m005_02");								// ベホマスライム

// ▼配置
	// 主人公
	SetPointPosNoFit_(player, "player000");
	SetVisible(player, false);
	
	//▼ひくいどり
	local hikui00 = ArrangePointNpc_(model_hikui, "npc_hikui000");
	SetScaleSilhouette(hikui00, SCALE.M, SILHOUETTE_WIDTH.M);			//Mサイズ
	SetStepSe_(hikui00, SILENT_STEP_SE);
	SetPointPosNoFit_(hikui00, "npc_hikui000");
	SetMotion_(hikui00, MOT_WALK, BLEND_N);								//初期モーション

	//▼ばくだんいわ
	local bomb02 = ArrangePointNpc_(model_bomb, "npc_bomb002");
	SetScaleSilhouette(bomb02, 1.3, SILHOUETTE_WIDTH.M);
	SetStepSe_(bomb02, SILENT_STEP_SE);
	SetDir_(bomb02, -10);
	
	local bomb03 = ArrangePointNpc_(model_bomb, "npc_bomb003");
	SetScaleSilhouette(bomb03, 1.2, SILHOUETTE_WIDTH.M);
	SetStepSe_(bomb03, SILENT_STEP_SE);
	SetDir_(bomb03, -45);
	
	local bomb04 = ArrangePointNpc_(model_bomb, "npc_bomb004");
	SetScaleSilhouette(bomb04, 1.2, SILHOUETTE_WIDTH.M);
	SetStepSe_(bomb04, SILENT_STEP_SE);
	SetDir_(bomb04, 50);
	
	//▼ベホマスライム
	local behoma00 = ArrangePointNpc_(model_behoma, "npc_behoma000");
	SetScaleSilhouette(behoma00, 1.0, SILHOUETTE_WIDTH.M);
	SetStepSe_(behoma00, SILENT_STEP_SE);
	
	local behoma01 = ArrangePointNpc_(model_behoma, "npc_behoma001");
	SetScaleSilhouette(behoma01, 0.9, SILHOUETTE_WIDTH.M);
	SetStepSe_(behoma01, SILENT_STEP_SE);
	
	local behoma02 = ArrangePointNpc_(model_behoma, "npc_behoma002");
	SetScaleSilhouette(behoma02, 0.9, SILHOUETTE_WIDTH.M);
	SetStepSe_(behoma02, SILENT_STEP_SE);

	//▼れんごく天馬
	local tenma00 = ArrangePointNpc_(model_tenma, "npc_tenma000");
	SetScaleSilhouette(tenma00, 1.3, SILHOUETTE_WIDTH.M);
	SetStepSe_(tenma00, SILENT_STEP_SE);
	
	local tenma01 = ArrangePointNpc_(model_tenma, "npc_tenma001");
	SetScaleSilhouette(tenma01, 1.0, SILHOUETTE_WIDTH.M);
	SetStepSe_(tenma01, SILENT_STEP_SE);
	
	local tenma02 = ArrangePointNpc_(model_tenma, "npc_tenma002");
	SetScaleSilhouette(tenma02, 0.8, SILHOUETTE_WIDTH.M);
	SetStepSe_(tenma02, SILENT_STEP_SE);

	//▼マグマロン
	local magma00 = ArrangePointNpc_(model_magma, "npc_magma000");
	SetScaleSilhouette(magma00, SCALE.M, SILHOUETTE_WIDTH.M);			//Mサイズ
	SetStepSe_(magma00, SILENT_STEP_SE);
	SetPointPosNoFit_(magma00, "npc_magma000");

// ▼カメラ設定
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	
// ▼天候設定
	SetWeather_(WEATHER.BAD);

// ▼初期モーション
	SetMotion_(behoma00, MOT_RUN, BLEND_N);								//ベホマスライム移動
	task_behoma1 = Task_MoveForward_(behoma00, 0.8, true);

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット1
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
//	PlayBgm_("BGM_006");
	WaitFade_();

	WaitTask(task_cam);
	Wait_(15);

	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 20);
	WaitFade_();
	DeleteTask_(task_behoma1);

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット2
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 10);
	WaitFade_();
	
	Wait_(50);

	SetMotion_(tenma00, MOT_RUN, BLEND_N);								//れんごく天馬の行進
	SetMotion_(tenma01, MOT_RUN, BLEND_N);
	SetMotion_(tenma02, MOT_RUN, BLEND_N);
	task_tenma1 = Task_MoveForward_(tenma00, 1.1, true);
	task_tenma2 = Task_MoveForward_(tenma01, 1.1, true);
	task_tenma3 = Task_MoveForward_(tenma02, 1.1, true);
	
	SetMotion_(behoma01, MOT_WALK, BLEND_N);
	task_behoma2 = Task_MoveForward_(behoma01, 1.0, false);
	
	WaitTask(task_cam);
	Wait_(15);

	EndDemo(FADE_COLOR_BLACK);
}
