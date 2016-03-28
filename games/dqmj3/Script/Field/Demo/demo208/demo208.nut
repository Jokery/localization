//=============================================
//
//		demo208[ブンドルド再戦]
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
	local player, bundorudo;
	local model_bundorudo;
	local Player_battle_L, Player_run_battle;
	local task_player, task_cam;
	local efc_cam, efc_bun;

// ▼リソース読込
	// キャラクター
	player = GetPlayerId_();					// 主人公
	model_bundorudo = ReadNpc_("m203_00");		// ブンドルド
	// エフェクト
	LoadEffect_("ef733_01_sym_shuchusen01");	// 集中線
	LoadEffect_("ef730_01_oth_dark_aura01");	// まがまがしいオーラ

// ▼配置
	// 主人公
	SetPointPos_(player, "player000");
	// ブンドルド
	bundorudo = ArrangePointNpc_(model_bundorudo, "npc_bundorudo000");
	SetScaleSilhouette(bundorudo, SCALE.M, SILHOUETTE_WIDTH.M);
	efc_bun = SetSelectBoneEffectSetOffset_("ef730_01_oth_dark_aura01", bundorudo, ATTACH_EFFECT2, Vec3(0.0, -5.0, 0.0));		//黒オーラ

// ▼非常駐モーション読込
	Player_battle_L = ReadMotion_(player, "Player_battle_L");		//戦闘待機
	Player_run_battle = ReadMotion_(player, "Player_run_battle");	//戦闘待機
	
	//初期のモーション
	SetMotion_(bundorudo, MOT_WAIT, BLEND_M);

// ▼時間設定
	SetTime_(START_TIME_ZONE_NIGHT);
	
// ▼カメラ設定
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	SetMotion_(player, Player_run_battle, BLEND_L);	// 走り→戦闘待機
	
	task_player = Task_MoveForward_(player, 0.5, true);
	
	Wait_(20);
	
	DeleteTask_(task_player);
	
	SetMotion_(player, Player_battle_L, BLEND_M);
	
	Wait_(40);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット2
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");

	//===============================================
	//*ブンドルド
	//「キュルルル……部下を使って探し出す手間が　はぶけたようでス。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BUNDORUDO");
	ShowMsg_("DEMO_208_MSG_010");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	//*ブンドルド
	// 「さあ！　今度こそ　おとなしく　死になサイ！

	//-----------------------------------------------
	ShowMsg_("DEMO_208_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	WaitTask(task_cam);
	SetMotion_(bundorudo, MOT_SWORD_ACTUATE, BLEND_L);			//戦闘開始モーション候補１
	PlaySE_("SE_DEM_106");
	Wait_(36);	
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	
	SetMotionSpeed_(bundorudo, 0.8);
	
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", 100);		// 集中線
	
	
	//=====================================
	//◆戦闘ブラー
	//=====================================
	EncountEndDemo(ENCOUNT_BOSS);
	
}
