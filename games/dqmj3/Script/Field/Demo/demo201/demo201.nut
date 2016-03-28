//=============================================
//
//		demo201[ネオンパークの裏路地より]
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
	local task_cam, task_player, task_okiduti;
	local efc_player;

// ▼リソース読込
	// キャラクター
	local player = GetPlayerId_();					// 主人公
	local model_dragon = ReadNpc_("m013_01");		// ドラゴンバケージ
	local model_incubus = ReadNpc_("m047_01");		// インキュバス
	local model_okiduti = ReadNpc_("m035_00");		// おおきづち
	
// ▼配置
	// 主人公
	SetPointPos_(player, "player001");
	
	// ネオンパーク住民
	local dragon00 = ArrangePointNpc_(model_dragon, "npc_dragon000");		// ドラゴンバケージA
	local dragon01 = ArrangePointNpc_(model_dragon, "npc_dragon100");		// ドラゴンバケージB
	local dragon02 = ArrangePointNpc_(model_dragon, "npc_dragon200");		// ドラゴンバケージC

	local incubus00 = ArrangePointNpc_(model_okiduti, "npc_incubus000");	// おおきづち(インキュバスAと位置変更　チケット#6704）
	local incubus01 = ArrangePointNpc_(model_incubus, "npc_incubus100");	// インキュバスB
	local incubus02 = ArrangePointNpc_(model_incubus, "npc_incubus200");	// インキュバスC
	
	local okiduti00 = ArrangePointNpc_(model_incubus, "npc_okiduti000");	// インキュバスA（おおきづちと位置変更　チケット#6704）

// ▼サイズ設定
	SetScaleSilhouette(dragon00, SCALE.N, SILHOUETTE_WIDTH.N);				// ドラゴンバケージNサイズ
	SetScaleSilhouette(dragon01, SCALE.N, SILHOUETTE_WIDTH.N);
	SetScaleSilhouette(dragon02, SCALE.N, SILHOUETTE_WIDTH.N);
	
	SetScaleSilhouette(incubus00, SCALE.N, SILHOUETTE_WIDTH.N);				// インキュバスNサイズ
	SetScaleSilhouette(incubus01, SCALE.N, SILHOUETTE_WIDTH.N);
	SetScaleSilhouette(incubus02, SCALE.N, SILHOUETTE_WIDTH.N);
	
	SetScaleSilhouette(okiduti00, SCALE.N, SILHOUETTE_WIDTH.N);				// おおきづちNサイズ

// ▼カメラ設定
	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------
	//===============================================
	// カット①　～路地を曲がる～
	//===============================================
	//主人公歩く
	SetMotion_(player, MOT_WALK, BLEND_N);
	task_player = Task_MoveForward_(player, 1.0, false);
	
	StartDemo(FADE_COLOR_BLACK);
	
	Wait_(60);
	
	//白フェード
	SetFade_(FADE_OUT, FADE_COLOR_WHITE, 30);
	WaitFade_();
	
	DeleteTask_(task_cam);
	DeleteTask_(task_player);
	SetMotion_(player, MOT_WAIT, BLEND_N);
	SetVisible(player, false);								//主人公非表示
	
	Wait_(30);
	
	//===============================================
	// カット②　～ネオン街を見せる1～
	//===============================================
	
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");
	WaitLod_();
	Wait_(15);
	
	//フェードイン
	SetFade_(FADE_IN, FADE_COLOR_WHITE, 30);
	WaitFade_();

	WaitTask(task_cam);
	Wait_(20);
	DeleteTask_(task_cam);
	
	//===============================================
	// カット③　～ネオン街を見せる2～
	//===============================================
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");
	
	Wait_(70);
	
	//おおきづち方向転換→歩く
	SetStepSe_(okiduti00, SILENT_STEP_SE);
	SetMotion_(okiduti00, MOT_WALK, BLEND_M);
	task_okiduti = Task_RotateToDir_(okiduti00, 0, ROTATE_DEMO_DEF);
	WaitTask(task_okiduti);
	DeleteTask_(task_okiduti);
	
	task_okiduti = Task_MoveForward_(okiduti00, 0.7, false);
	
	WaitTask(task_cam);
	Wait_(10);
	
	DeleteTask_(task_okiduti);
	SetVisible(okiduti00, false);
	
	//===============================================
	// カット④　～主人公をカメラに入れる～
	//===============================================
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	
	WaitLod_();

	// 主人公表示
	SetVisible(player, true);
	SetPointPos_(player, "player000");
	
	Wait_(150);
	
	EndDemo(FADE_COLOR_BLACK);
}
