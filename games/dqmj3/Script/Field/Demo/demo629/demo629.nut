//=============================================
//
//		demo629[巨大ブンドルド戦勝利]
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
	local efc_bone0, efc_bone1, efc_bone2, efc_bone3, efc_bone4, efc_bone5, efc_bone6;

// ▼リソース読込
	// ギミック
	local model_island = ReadGimmick_("o_com_10");	// 浮島
	// キャラクター
	local player = GetPlayerId_();					// 主人公
	local model_rena = ReadNpc_("n007");			// レナーテ
	local model_neo = ReadNpc_("m203_00");			// ブンドルド
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
	// ブンドルド
	local neo = ArrangePointNpc_(model_neo, "npc_bndr000");
	SetPointPosNoFit_(neo, "npc_bndr000");
	SetScaleSilhouette(neo, SCALE.T, SILHOUETTE_WIDTH.T);
	SetSilhouetteHideIfFar_(neo, false);

// ▼非常駐モーション読込
	// 主人公
	//local player_look_right_L = ReadMotion_(player, "Player_look_right_L");	// 右を向くL
	// レナーテ
	//local rena_look_left_L = ReadMotion_(rena, "n007_look_left_L");			// 左を向くL
	// ブンドルド
	local neo_die = ReadMotion_(neo, "m203_00_die");						// やられ

// ▼エフェクト設定
	efc_cam = SetCameraEffect_("ef733_02_sym_black_mist01", CAMERA_DEF);
	efc_bone0 = SetSelectBoneEffectSetBoneName_("ef731_08_mag_boss_die03", neo, "Chest", Vec3(0.0, 0.0, 0.0));
	efc_bone1 = SetSelectBoneEffectSetBoneName_("ef731_06_mag_boss_die01", neo, "LBicep", Vec3(0.0, 0.0, 0.0));
	efc_bone2 = SetSelectBoneEffectSetBoneName_("ef731_06_mag_boss_die01", neo, "LForearm", Vec3(0.0, 0.0, 0.0));
	efc_bone3 = SetSelectBoneEffectSetBoneName_("ef731_06_mag_boss_die01", neo, "LHand", Vec3(0.0, 0.0, 0.0));
	efc_bone4 = SetSelectBoneEffectSetBoneName_("ef731_06_mag_boss_die01", neo, "RBicep", Vec3(0.0, 0.0, 0.0));
	efc_bone5 = SetSelectBoneEffectSetBoneName_("ef731_06_mag_boss_die01", neo, "RForearm", Vec3(0.0, 0.0, 0.0));
	efc_bone6 = SetSelectBoneEffectSetBoneName_("ef731_06_mag_boss_die01", neo, "RHand", Vec3(0.0, 0.0, 0.0));
	SetEffectScale_(efc_bone0, 1.6);
	SetEffectScale_(efc_bone1, 1.6);
	SetEffectScale_(efc_bone2, 1.6);
	SetEffectScale_(efc_bone3, 1.6);
	SetEffectScale_(efc_bone4, 1.6);
	SetEffectScale_(efc_bone5, 1.6);
	SetEffectScale_(efc_bone6, 1.6);

// ▼モーション設定
	SetMotion_(neo, MOT_SPECIAL_WAIT, BLEND_N);
	SetMotionSpeed_(neo, 0.5);

	ChangeColorTone_(-0.3, -0.5, -0.2, 0);

	SetVisible(player, false);
	SetVisible(rena, false);
	SetVisible(island, false);

// ▼カメラ設定
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");		// 90F


//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);

	Wait_(60);
	DeleteTask_(task_cam);
	StartEarthQuake_(-1, 3, 1);

	// ▼カット１＠ブンドルドＵＰ～～～～～～～～～～～～～～

	//===============================================
	// ■ブンドルド
	// 「キュルルルル……結局　あの世に逆戻り～！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BUNDORUDO");
	ShowMsg_("DEMO_629_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	// ▼カット２＠ブンドルドズームアウト～～～～～～～～～～
	PlaySE_("SE_DEM_164");											//ブンドルド（T）消滅
	
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");		// 65F
	StartBlurEffect_();

	SetMotion_(neo, neo_die, BLEND_L);
	SetMotionSpeed_(neo, 0.65); //死ぬときのモーションスピードをゆっくりに。
	efc_mag_boss_die04 = SetSelectBoneEffect_("ef731_09_mag_boss_die04", neo, ATTACH_EFFECT2);
	DeleteEffectEmitter_(efc_cam);
	ChangeColorTone_(0.3, 0.3, 0.3, 60);
	Wait_(40);

	DeleteEffectEmitter_(efc_bone0);
	DeleteEffectEmitter_(efc_bone1);
	DeleteEffectEmitter_(efc_bone2);
	DeleteEffectEmitter_(efc_bone3);
	DeleteEffectEmitter_(efc_bone4);
	DeleteEffectEmitter_(efc_bone5);
	DeleteEffectEmitter_(efc_bone6);
	Wait_(40);

	StopEarthQuake_();
	Wait_(15);

	StartEarthQuake_(-1, 3, 30);
	Wait_(45);

	task_neo = Task_ObjectFadeOut_(neo, 15);
	Wait_(30);

	ChangeColorTone_(-0.3, -0.5, -0.2, 30);
	Wait_(39);

	StartEarthQuake_(60, 3, 30);
	ChangeColorTone_(0.3, 0.3, 0.3, 50);
	Wait_(105);
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);
	Wait_(30);

	StopEarthQuake_();
	DeleteEffectEmitter_(efc_mag_boss_die04);
	EndBlurEffect_();
	DeleteTask_(task_cam);

//	// ▼カット３＠主人公とレナーテズームアウト～～～～～～～～		//スクエニ要望によりCO
//	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");		// 180F

//	SetVisible(player, true);
//	SetVisible(rena, true);
//	SetVisible(island, true);

//	Wait_(60);
//	ChangeColorTone_(0.1, 0.1, 0.1, 60);

//	WaitTask(task_cam);

	EndDemo(FADE_COLOR_BLACK);
}
