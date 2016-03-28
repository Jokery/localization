//=============================================
//
//		demo626[巨大ボーショック戦勝利]
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
	local efc_cam, efc_neo0, efc_neo1, efc_mag_boss_die01, efc_mag_boss_die02, efc_mag_boss_die03, efc_mag_boss_die04;
	local efc_bone0, efc_bone1, efc_bone2, efc_bone3, efc_bone4, efc_bone5, efc_bone6, efc_bone7;

// ▼LOD読み込み
	ReadWaitingLod("lodeye000", "lodtgt000");//都市表示が間に合っていなかったので設定

// ▼リソース読込
	// ギミック
	local model_island = ReadGimmick_("o_com_10");	// 浮島
	// キャラクター
	local player = GetPlayerId_();					// 主人公
	local model_rena = ReadNpc_("n007");			// レナーテ
	local model_neo = ReadNpc_("m207_00");			// ボーショック
	// エフェクト
	LoadEffect_("ef733_02_sym_black_mist01");		// 黒い靄
	LoadEffect_("ef731_06_mag_boss_die01");			// 巨大ボスの消滅エフェクト(小)
	LoadEffect_("ef731_08_mag_boss_die03");			// 巨大ボスの消滅エフェクト(大)
	LoadEffect_("ef731_09_mag_boss_die04");			// 巨大ボスの消滅エフェクト(爆破)

// ▼配置
	// 浮島
	local island = ArrangePointGimmick_("o_com_10", model_island, "obj_island000");
	// 主人公
	SetPointPos_(player, "player000");
	// レナーテ
	local rena = ArrangePointNpc_(model_rena, "npc_rena000");
	// ボーショック
	local neo = ArrangePointNpc_(model_neo, "npc_bor000");
	SetPointPosNoFit_(neo, "npc_bor000");
	SetScaleSilhouette(neo, SCALE.T, SILHOUETTE_WIDTH.T);
	SetSilhouetteHideIfFar_(neo, false);

// ▼非常駐モーション読込
	// 主人公
	local player_look_right_L = ReadMotion_(player, "Player_look_right_L");	// 右を向くL
	// レナーテ
	local rena_look_left_L = ReadMotion_(rena, "n007_look_left_L");			// 左を向くL
	// ボーショック
	local neo_die = ReadMotion_(neo, "m207_00_die");						// やられ

// ▼エフェクト設定
	efc_cam = SetCameraEffect_("ef733_02_sym_black_mist01", CAMERA_DEF);
	efc_bone0 = SetSelectBoneEffectSetBoneName_("ef731_08_mag_boss_die03", neo, "Hip_root", Vec3(0.0, 5.0, 0.0));
	efc_bone1 = SetSelectBoneEffectSetBoneName_("ef731_06_mag_boss_die01", neo, "j_ude_a_l", Vec3(0.0, 0.0, 0.0));
	efc_bone2 = SetSelectBoneEffectSetBoneName_("ef731_06_mag_boss_die01", neo, "j_ude_b_l", Vec3(0.0, 0.0, 0.0));
	efc_bone3 = SetSelectBoneEffectSetBoneName_("ef731_06_mag_boss_die01", neo, "j_te_l", Vec3(0.0, 0.0, 0.0));
	efc_bone4 = SetSelectBoneEffectSetBoneName_("ef731_06_mag_boss_die01", neo, "j_ude_a_r", Vec3(0.0, 0.0, 0.0));
	efc_bone5 = SetSelectBoneEffectSetBoneName_("ef731_06_mag_boss_die01", neo, "j_ude_b_r", Vec3(0.0, 0.0, 0.0));
	efc_bone6 = SetSelectBoneEffectSetBoneName_("ef731_06_mag_boss_die01", neo, "j_te_r", Vec3(0.0, 0.0, 0.0));
	efc_bone7 = SetSelectBoneEffectSetBoneName_("ef731_06_mag_boss_die01", neo, "j_kubi", Vec3(0.0, 0.0, 0.0));

// ▼モーション設定
	SetMotion_(neo, MOT_SPECIAL_WAIT, BLEND_N);
	SetMotionSpeed_(neo, 0.5);

	ChangeColorTone_(-0.3, -0.5, -0.2, 0);

	SetVisible(player, false);
	SetVisible(rena, false);
	SetVisible(island, false);
	WaitLod_();
	Wait_(120);// 都市表示待ち

//足音
	SetStepSe_(rena, "SE_FLD_016");

	// ▼カメラ設定
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");		// 90F


//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);

	Wait_(60);
	DeleteTask_(task_cam);
	StartEarthQuake_(-1, 3, 1);

	// ▼カット１＠ボーショックＵＰ～～～～～～～～～～～～～～

	//===============================================
	// ■ボーショック
	// 「せっかく　よみがえったのに……
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BORSHOCK");
	ShowMsg_("DEMO_626_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	// ▼カット２＠ボーショックズームアウト～～～～～～～～～～
	PlaySE_("SE_DEM_162");											//ボーショック（T）消滅
	
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");		// 65F

	StartBlurEffect_();

	SetMotion_(neo, neo_die, BLEND_M);
	SetMotionSpeed_(neo, 0.5); //死ぬときのモーションスピードをゆっくりに。
	efc_mag_boss_die04 = SetSelectBoneEffect_("ef731_09_mag_boss_die04", neo, ATTACH_EFFECT2);
	DeleteEffectEmitter_(efc_cam);	
	ChangeColorTone_(0.3, 0.3, 0.3, 60);
	Wait_(40);

	//同時に消すと画像が乱れるのでタイミングをずらす
	DeleteEffectEmitter_(efc_bone0);
	Wait_(1);
	DeleteEffectEmitter_(efc_bone1);
	Wait_(1);
	DeleteEffectEmitter_(efc_bone2);
	Wait_(1);
	DeleteEffectEmitter_(efc_bone3);
	Wait_(1);
	DeleteEffectEmitter_(efc_bone4);
	Wait_(1);
	DeleteEffectEmitter_(efc_bone5);
	Wait_(1);
	DeleteEffectEmitter_(efc_bone6);
	Wait_(1);
	DeleteEffectEmitter_(efc_bone7);
	Wait_(33);

	StopEarthQuake_();
	Wait_(15);

	StartEarthQuake_(-1, 3, 30);
	Wait_(45);

	task_neo = Task_ObjectFadeOut_(neo, 15);
	Wait_(30);

	ChangeColorTone_(-0.3, -0.5, -0.2, 60);
	Wait_(39);

	StartEarthQuake_(60, 3, 30);
	Wait_(105);

	StopEarthQuake_();
	DeleteEffectEmitter_(efc_mag_boss_die04);
	EndBlurEffect_();
	DeleteTask_(task_cam);

	// ▼カット３＠主人公とレナーテズームアウト～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");		// 180F

	SetVisible(player, true);
	SetVisible(rena, true);
	SetVisible(island, true);

	Wait_(60);
	ChangeColorTone_(0.1, 0.1, 0.1, 60);

	WaitTask(task_cam);

	// ▼カット４＠主人公とレナーテ～～～～～～～～～～～～～～
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");

	task_rena = Task_WalkAroundToDir(rena,GetDir_(rena)+65, ROTATE_DEMO_DEF/2);
	Wait_(15);
	task_player = Task_WalkAroundToDir(player, GetDir_(player)-55, ROTATE_DEMO_DEF/2);
	WaitTask(task_player);
	SetMotion_(player, player_look_right_L, BLEND_L);
	WaitTask(task_rena);
	SetMotion_(rena, MOT_WAIT, BLEND_M);
	Wait_(5);

	MotionTalk(rena);

	//===============================================
	// ■レナーテ
	// 「なるほど……今　倒した魔物が
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_626_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	SetVisible(player, false);

	// ▼カット５＠レナーテＵＰ～～～～～～～～～～～～～～～～
	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");

	//-----------------------------------------------
	// ■レナーテ
	// 「<name_player/>。きっと　この先も
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_626_MSG_030");
	KeyInputWait_();

	//-----------------------------------------------
	// ■レナーテ
	// 「次は共同墓地……油断はしないで……。
	//-----------------------------------------------
	ShowMsg_("DEMO_626_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(rena, MOT_WAIT, 20);
	Wait_(30);

	EndDemo(FADE_COLOR_BLACK);
}
