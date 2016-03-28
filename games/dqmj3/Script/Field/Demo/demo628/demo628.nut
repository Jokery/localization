//=============================================
//
//		demo628[巨大ブンドルド]
//
//=============================================

function Update()
{
// ▼変数定義
	local task_cam, task_player, task_rena, task_neo;
	local efc_cam, efc_neo;

// ▼リソース読込
	// ギミック
	local model_island = ReadGimmick_("o_com_10");	// 浮島
	// キャラクター
	local player = GetPlayerId_();					// 主人公
	local model_rena = ReadNpc_("n007");			// レナーテ
	local model_neo = ReadNpc_("m203_00");			// ブンドルド
	// エフェクト
	LoadEffect_("ef733_02_sym_black_mist01");		// 黒い靄
	LoadEffect_("ef731_03_mag_boss_pollen01");		// 黒い花粉(小)
	LoadEffect_("ef731_04_mag_boss_pollen02");		// 黒い花粉(中)
	LoadEffect_("ef731_05_mag_boss_pollen03");		// 黒い花粉(大)
	LoadEffect_("ef733_01_sym_shuchusen01");				// 集中線
	LoadEffect_("ef730_01_oth_dark_aura01");		// 禍々しいオーラ

// ▼配置
	// 浮島
	local island = ArrangePointGimmick_("o_com_10", model_island, "obj_island000");
	// 主人公
	SetPointPos_(player, "player000");
	// レナーテ
	local rena = ArrangePointNpc_(model_rena, "npc_rena000");
	// ブンドルド
	local neo = ArrangePointNpc_(model_neo, "npc_bndr000");
	SetPointPosNoFit_(neo, "npc_bndr000");
	SetScaleSilhouette(neo, SCALE.T, SILHOUETTE_WIDTH.T);
	SetSilhouetteHideIfFar_(neo, false);

// ▼非常駐モーション読込
	// 主人公
	local player_run_battle = ReadMotion_(player, "Player_run_battle");		// 走り→戦闘待機
	local player_battle01_L = ReadMotion_(player, "Player_battle01_L");		// 戦闘待機（顔上向き）L
	// レナーテ
	local rena_run_L = ReadMotion_(rena, "n007_run_L");						// 走るL
	local rena_look_up_L = ReadMotion_(rena, "n007_look_up_L");				// 上を向くL
	// ブンドルド
	local neo_talk_L = ReadMotion_(neo, "m203_00_talk_L");					// 会話L

// ▼エフェクト設定
	efc_cam = SetCameraEffect_("ef733_02_sym_black_mist01", CAMERA_DEF);
	efc_neo = SetBoneEffect_("ef730_01_oth_dark_aura01", neo);

	SetSelectBoneEffectSetBoneName_("ef731_05_mag_boss_pollen03", neo, "Chest", Vec3(0.0, 0.0, 0.0));
	SetSelectBoneEffectSetBoneName_("ef731_03_mag_boss_pollen01", neo, "LBicep", Vec3(0.0, 0.0, 0.0));
	SetSelectBoneEffectSetBoneName_("ef731_03_mag_boss_pollen01", neo, "LForearm", Vec3(0.0, 0.0, 0.0));
	SetSelectBoneEffectSetBoneName_("ef731_03_mag_boss_pollen01", neo, "LHand", Vec3(0.0, 0.0, 0.0));
	SetSelectBoneEffectSetBoneName_("ef731_03_mag_boss_pollen01", neo, "RBicep", Vec3(0.0, 0.0, 0.0));
	SetSelectBoneEffectSetBoneName_("ef731_03_mag_boss_pollen01", neo, "RForearm", Vec3(0.0, 0.0, 0.0));
	SetSelectBoneEffectSetBoneName_("ef731_03_mag_boss_pollen01", neo, "RHand", Vec3(0.0, 0.0, 0.0));

// ▼モーション設定
	SetMotion_(player, player_run_battle, BLEND_N);
	task_player = Task_AnimeMoveNoDir_(player, "anm_player000");

	SetMotion_(rena, rena_run_L, BLEND_N);
	task_rena = Task_MoveToPointSetSpeed_(rena, "npc_rena001", 1.5);

	SetMotion_(neo, MOT_SPECIAL_WAIT, BLEND_N);
	SetMotionSpeed_(neo, 0.5);

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
	// *ブンドルド
	// 「この恨み……
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_628_MSG_010");
	KeyInputWait_();
	//===============================================
	// ▽
	// 「忘れたとは　言わせません！
	//-----------------------------------------------
	ShowMsg_("DEMO_628_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(neo, neo_talk_L, BLEND_N);		// 会話L
	SetMotionSpeed_(neo, 1);


	// ▼カット２＠ブンドルド、ズームイン～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");		// 120F

	//-----------------------------------------------
	// ■ブンドルド
	// 「復讐のため　ガルビルスさまの　おチカラで
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BUNDORUDO");
	ShowMsg_("DEMO_628_MSG_030");
	KeyInputWait_();
	//-----------------------------------------------
	// ▽
	// 「さあ！　あなたも　送ってあげましょう！
	//-----------------------------------------------
	ShowMsg_("DEMO_628_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	WaitTask(task_cam);


	// ▼カット３＠戦闘開始～～～～～～～～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye_2bndr", "anmtgt_2bndr");		// 10F

	SetMotion_(neo, MOT_SWORD_START, BLEND_L);
	PlaySE_("SE_DEM_163");													//ブンドルド（T）戦闘直前
	WaitMotion(neo);
	SetMotion_(neo, MOT_SWORD_ACTUATE, BLEND_L);
	Wait_(36);
	SetMotionSpeed_(neo, 0.01);
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", CAMERA_DEF);		// 集中線
	StopBgm_(BGM_STOP_DEF);
	local task = Task_EncountEffect_(ENCOUNT_BOSS);
	WaitTask(task);
	DeleteAllTask_();

	End_();
}
