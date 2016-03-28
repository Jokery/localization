//=============================================
//
//		demo634[巨大イッタブル]
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
	local efc_cam, efc_neo;

// ▼リソース読込
	// ギミック
	local model_island = ReadGimmick_("o_com_10");	// 浮島
	// キャラクター
	local player = GetPlayerId_();					// 主人公
	local model_rena = ReadNpc_("n007");			// レナーテ
	local model_neo = ReadNpc_("m205_00");			// イッタブル
	// エフェクト
	LoadEffect_("ef733_02_sym_black_mist01");		// 黒い靄
	LoadEffect_("ef731_03_mag_boss_pollen01");		// 黒い花粉(小)
	LoadEffect_("ef731_04_mag_boss_pollen02");		// 黒い花粉(中)
	LoadEffect_("ef731_05_mag_boss_pollen03");		// 黒い花粉(大)
	LoadEffect_("ef730_01_oth_dark_aura01");		// 禍々しいオーラ

// ▼配置
	// 浮島
	local ukisima = ArrangePointGimmick_("o_com_10", model_island, "ukisima");
	// 主人公
	SetPointPos_(player, "player000");
	// レナーテ
	local rena = ArrangePointNpc_(model_rena, "npc_rena000");
	// イッタブル
	local neo = ArrangePointNpc_(model_neo, "npc_itbr000");
	SetPointPosNoFit_(neo, "npc_itbr000");
	SetScaleSilhouette(neo, 7, SILHOUETTE_WIDTH.T);
	SetSilhouetteHideIfFar_(neo, false);

// ▼非常駐モーション読込
	// 主人公
	local player_run_battle = ReadMotion_(player, "Player_run_battle");		// 走り→戦闘待機
	local player_battle01_L = ReadMotion_(player, "Player_battle01_L");		// 戦闘待機（顔上向き）L
	// レナーテ
	local rena_run_L = ReadMotion_(rena, "n007_run_L");						// 走るL
	local rena_look_up_L = ReadMotion_(rena, "n007_look_up_L");				// 上を向くL

// ▼エフェクト設定
	efc_cam = SetCameraEffect_("ef733_02_sym_black_mist01", CAMERA_DEF);
	efc_neo = SetBoneEffect_("ef730_01_oth_dark_aura01", neo);

	SetSelectBoneEffectSetBoneName_("ef731_05_mag_boss_pollen03", neo, "Waist", Vec3(0.0, 0.0, 0.0));
	SetSelectBoneEffectSetBoneName_("ef731_03_mag_boss_pollen01", neo, "Neck", Vec3(0.0, 0.0, 0.0));
	SetSelectBoneEffectSetBoneName_("ef731_03_mag_boss_pollen01", neo, "L_Bicep", Vec3(0.0, 0.0, 0.0));
	SetSelectBoneEffectSetBoneName_("ef731_03_mag_boss_pollen01", neo, "LForearm", Vec3(0.0, 0.0, 0.0));
	SetSelectBoneEffectSetBoneName_("ef731_03_mag_boss_pollen01", neo, "LWrist", Vec3(0.0, 0.0, 0.0));
	SetSelectBoneEffectSetBoneName_("ef731_03_mag_boss_pollen01", neo, "R_Bicep", Vec3(0.0, 0.0, 0.0));
	SetSelectBoneEffectSetBoneName_("ef731_03_mag_boss_pollen01", neo, "RForearm", Vec3(0.0, 0.0, 0.0));
	SetSelectBoneEffectSetBoneName_("ef731_03_mag_boss_pollen01", neo, "RWrist", Vec3(0.0, 0.0, 0.0));

// ▼カメラ設定
	SetPointCameraEye_("0_eye");
	SetPointCameraTarget_("0_tgt");
	Wait_(15);		// 大陸のチラつき防止

// ▼モーション設定
	SetMotion_(player, player_run_battle, BLEND_N);
	task_player = Task_MoveToPointSetSpeed_(player, "player001", 1.5);

	SetMotion_(rena, rena_run_L, BLEND_N);
	task_rena = Task_AnimeMove_(rena, "rena_anm");

	SetMotion_(neo, MOT_WAIT, BLEND_N);
	SetMotionSpeed_(neo, 0.5);

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);

	// ▼カット１＠主人公達カメライン～～～～～～～～～～～～～
	WaitTask(task_rena);
	SetMotion_(rena, rena_look_up_L, BLEND_M);
	WaitTask(task_player);
	SetMotion_(player, player_battle01_L, BLEND_M);

	//===============================================
	// *イッタブル
	// 「待つのである！
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_634_MSG_010");
	KeyInputWait_();
	//-----------------------------------------------
	// ▽
	// 「このイッタブル　ガルビルスさまのおチカラで
	//-----------------------------------------------
	ShowMsg_("DEMO_634_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(neo, MOT_WAIT, BLEND_N);
	SetMotionSpeed_(neo, 1);
	SetPointPos_(neo, "npc_itbr001");


	// ▼カット２＠イッタブル、ズームイン～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("1_eye", "1_tgt");		// 10F

	//-----------------------------------------------
	// ■イッタブル
	// 「ガルビルスさまに　仇なすモンスターマスター！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ITABURU");
	ShowMsg_("DEMO_634_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	WaitTask(task_cam);


	// ▼カット３＠戦闘開始～～～～～～～～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("2_eye", "2_tgt");		// 10F

	SetVisible(player, false);
	SetVisible(rena, false);
	SetVisible(ukisima, false);
	SetMotion_(neo, MOT_SPELL_START, BLEND_M);
	PlaySE_("SE_DEM_167");									//イッタブル（T）戦闘直前
	SetMotionSpeed_(neo, 0.6);	// 0.5だと早いとの事なので0.45に
	WaitMotion(neo);
	SetMotion_(neo, MOT_SPELL_ACTUATE, BLEND_M);
	Wait_(36/0.6);			// 36:デフォルト時のタイミング/0.6:モーションスピード
	Wait_(15);
	StopBgm_(BGM_STOP_DEF);
	local task_boss = Task_EncountEffect_(ENCOUNT_BOSS);
	WaitTask(task_boss);
	DeleteAllTask_();

	End_();
}