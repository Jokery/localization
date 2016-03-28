//=============================================
//
//		demo638[デスバーン＆プロメテウス]
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
	local task_cam, task_player, task_rena, task_neo;
	local efc_cam, efc_dsbn;

// ▼リソース読込
	// ギミック
	local model_island = ReadGimmick_("o_com_10");	// 浮島
	// キャラクター
	local player = GetPlayerId_();					// 主人公
	local model_rena = ReadNpc_("n007");			// レナーテ
	local model_prmt = ReadNpc_("n026");			// プロメテウス
	local model_dsbn = ReadNpc_("m206_00");			// デスバーン
	// エフェクト
	LoadEffect_("ef733_02_sym_black_mist01");		// 黒い靄
	LoadEffect_("ef731_03_mag_boss_pollen01");		// 黒い花粉(小)
	LoadEffect_("ef731_04_mag_boss_pollen02");		// 黒い花粉(中)
	LoadEffect_("ef731_05_mag_boss_pollen03");		// 黒い花粉(大)
	LoadEffect_("ef730_01_oth_dark_aura01");		// 禍々しいオーラ

// ▼配置
	// 浮島
	local island = ArrangePointGimmick_("o_com_10", model_island, "obj_island000");
	
	// 主人公
	SetPointPos_(player, "player000");
	// レナーテ
	local rena = ArrangePointNpc_(model_rena, "npc_rena000");
	// プロメテウス
	local prmt = ArrangePointNpc_(model_prmt, "npc_dsbn000");
	SetPointPosNoFit_(prmt, "npc_dsbn000");
	SetSilhouetteHideIfFar_(prmt, false);
	// デスバーン
	local dsbn = ArrangePointNpc_(model_dsbn, "npc_dsbn000");
	SetPointPosNoFit_(dsbn, "npc_dsbn000");
	SetScaleSilhouette(dsbn, SCALE.T, SILHOUETTE_WIDTH.T);
	SetSilhouetteHideIfFar_(dsbn, false);

// ▼非常駐モーション読込
	// 主人公
	local player_run_battle = ReadMotion_(player, "Player_run_battle");		// 走り→戦闘待機
	local player_battle01_L = ReadMotion_(player, "Player_battle01_L");		// 戦闘待機（顔上向き）L
	// レナーテ
	local rena_run_L = ReadMotion_(rena, "n007_run_L");						// 走るL
	local rena_look_up_L = ReadMotion_(rena, "n007_look_up_L");				// 上を向くL
	// プロメテウス
	local prmt_attack = ReadMotion_(prmt, "n026_attack");					// 攻撃
	local prmt_ride = ReadMotion_(prmt, "n026_ride_L");					// 攻撃	
	// デスバーン
	local dsbn_Hovering_L = ReadMotion_(dsbn, "m206_00_flight_Hovering_L");	// ホバリングL

// ▼エフェクト設定
	efc_cam = SetCameraEffect_("ef733_02_sym_black_mist01", CAMERA_DEF);
	efc_dsbn = SetBoneEffect_("ef730_01_oth_dark_aura01", dsbn);
	
	local effectId = SetPointWorldEffect_("ef731_03_mag_boss_pollen01", "1");
	local effectId2 = SetPointWorldEffect_("ef731_03_mag_boss_pollen01", "2");
	local effectId1 = SetPointWorldEffect_("ef731_03_mag_boss_pollen01", "3");
	SetEffectScale_(effectId, 10.0);
	SetEffectScale_(effectId2, 10.0);
	SetEffectScale_(effectId1, 10.0);

// ▼モーション設定
	SetMotion_(player, player_run_battle, BLEND_N);
	task_player = Task_AnimeMoveNoDir_(player, "anm_player000");
	
	SetMotion_(rena, rena_run_L, BLEND_N);
	task_rena = Task_MoveToPointSetSpeed_(rena, "npc_rena001", 1.5);
	
	SetMotion_(dsbn, dsbn_Hovering_L, BLEND_N);

	RideOn_(prmt, dsbn, 606, SIZE_T);
	Wait_(1);	// ライドモーションにさせるため、1F待つ
	SetMotion_(prmt, prmt_ride, BLEND_N);	

// ▼カメラ設定
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	StartDemoNoFade(FADE_COLOR_BLACK);
	
	// ▼カット１＠主人公達カメライン～～～～～～～～～～～～～
	WaitTask(task_rena);
	SetMotion_(rena, rena_look_up_L, BLEND_L);
	WaitTask(task_player);
	SetMotion_(player, player_battle01_L, BLEND_M);
	
	//===============================================
	// *プロメテウス
	// 「グロロロ……見ツケタゾ　がるびるすサマノ
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_638_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	
	// ▼カット２＠デスバーン、ズームイン～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");		// 70F
	
	//-----------------------------------------------
	// ▽
	// 「グロロロロ！　ヨミガエッタ　ぷろめてうすト
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_638_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	WaitTask(task_cam);
	
	
	// ▼カット３＠戦闘開始～～～～～～～～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye_5dsbn", "anmtgt_5dsbn");		// 10F
		
	PlaySE_("SE_DEM_169");													//プロメテウス&メカバーン（T）戦闘直前

	SetPointPos_(island, "obj_island001");
	SetVisible(player, false);
	SetVisible(rena, false);
	Wait_(10);
	SetMotionSpeed_(prmt, 0.5);
	SetMotion_(prmt, prmt_attack, BLEND_M);
	SetMotionSpeed_(dsbn, 0.58);
	SetMotion_(dsbn, MOT_SPELL_ACTUATE, BLEND_XL);
	Wait_(55);
	
	EncountEndDemo(ENCOUNT_BOSS);
}
