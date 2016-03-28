//=============================================
//
//		demo642[ガルマザード戦勝利_1(コア)]
//
//=============================================

//-------------------------------------------------------------------------
//
//		読み込み・配置
//
//-------------------------------------------------------------------------
function Update()
{
	local task_cam, task_player, task_mother;
	local efc_player, efc_reacter, efc_mother00, efc_mother01, efc_light;
	local efc_bone0, efc_bone1, efc_bone2, efc_bone3, efc_bone4, efc_hourai;

// ▼リソース読込
	// キャラクター
	local player	 = GetPlayerId_();					// 主人公
	local model_gal	 = ReadNpc_("m185_00");				// ガルマザード
	local model_rena	 = ReadNpc_("n007");			// レナーテ
	local model_ukisima = ReadGimmick_("o_V00_10");		// 浮島
	local model_MOTHER	 = ReadGimmick_("o_C03_02");	// マザー
	local model_base = ReadGimmick_("o_effect_base");	// エフェクトベース
	local model_sky = ReadGimmick_("o_dem_25");

	LoadEffect_("ef732_17_antibody_m");					// Ｍ抗体の代用
	LoadEffect_("ef864_11_galmotherd06");				// 紫の光
	LoadEffect_("ef861_03_m_draw");						// M抗体吸い込まれる
	LoadEffect_("ef864_02_galmotherd_die01");			// 崩壊エフェクト
	LoadEffect_("ef864_03_galmotherd_die02");			// 消滅エフェクト
	LoadEffect_("ef864_09_galmotherd04");				// マザーのもやもや
	LoadEffect_("ef864_10_galmotherd05");				// 光

// ▼配置
	// 主人公
	SetPointPos_(player, "player");
	local rena	 = ArrangePointNpc_(model_rena, "rena");
	local gal	 = ArrangePointNpc_(model_gal, "gal");
	local ukisima	 = ArrangePointGimmick_("o_V00_10", model_ukisima, "ukisima");
	SetScaleSilhouette(gal, 6, 1);

	local MOTHER	 = ArrangePointGimmick_("o_C03_02", model_MOTHER, "MOTHER2");
	SetScale_(MOTHER, 0.2);
	SetMotion_(MOTHER, MOT_GIMMICK_1, 1);
	SetVisible(MOTHER, false);

	local Mkoutai = ArrangePointGimmick_("o_effect_base", model_base, "Mkoutai");
	local base_mother = ArrangeGimmick_("o_effect_base", model_base, false);

	local sky	 = ArrangePointGimmick_("o_dem_25", model_sky, "sky000");
	SetScale_(sky, 0.2);

	// ▼非常駐モーション読込
	local p_ue		 = ReadMotion_(player, "Player_battle01_L");	// 主人公戦闘待機（顔上向き）
	local g_kega	 = ReadMotion_(gal, "m185_00_injury");			// 待機→負傷
	local g_kegaL	 = ReadMotion_(gal, "m185_00_injury_L");		// 負傷L
	local g_wara	 = ReadMotion_(gal, "m185_00_laugh");			// 負傷→笑い
	local g_waraL	 = ReadMotion_(gal, "m185_00_laugh_L");			// 笑いL
	local r_show1	 = ReadMotion_(rena, "n007_show01");			// 待機→M抗体見せ
	local r_showL	 = ReadMotion_(rena, "n007_show_L");			// M抗体見せL
	local r_showsL	 = ReadMotion_(rena, "n007_show_send_L");		// 手を胸の高さ位まで上げ前へ出すL
	local r_talk	 = ReadMotion_(rena, "n007_talk01");			// 会話
	local r_talkL	 = ReadMotion_(rena, "n007_talk01_L");			// 会話L
	SetMotion_(player, p_ue, 1);

// ▼カメラ設定
	task_cam	 = Task_AnimeMoveCamera_("001_anmeye", "001_anmtgt");
	StartBlurEffect_();


//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------
	StartDecayEarthQuake_(15, 3, 0.2)
	local efc_houkai = SetPointWorldEffect_("ef864_02_galmotherd_die01", "gal");
	SetEffectScale_(efc_houkai,6);

	// ▼瀕死エフェクト
	efc_bone0 = SetSelectBoneEffectSetBoneName_("ef864_02_galmotherd_die01", gal, "j_head", Vec3(0.0, 0.0, 0.0));
	efc_bone1 = SetSelectBoneEffectSetBoneName_("ef864_02_galmotherd_die01", gal, "j_head_u", Vec3(0.0, 2.0, 15.0));
	efc_bone2 = SetSelectBoneEffectSetBoneName_("ef864_02_galmotherd_die01", gal, "j_head_u_ear_l", Vec3(0.0, 0.0, 10.0));
	efc_bone3 = SetSelectBoneEffectSetBoneName_("ef864_02_galmotherd_die01", gal, "j_head_u_ear_r", Vec3(0.0, 0.0, 10.0));

	SetMotion_(gal, g_kega, 8);
	PlaySE_("SE_DEM_172");								//■SE:ガルマザード倒れる


	StartDemo(FADE_COLOR_BLACK);

	Wait_(20);
	EndBlurEffect_();
	Wait_(49);
	SetMotionSpeed_(gal, 0.2);
	WaitMotion(gal);
	SetMotion_(gal, g_kegaL, BLEND_N);
	SetMotionSpeed_(gal, 1.0);

	//===============================================
	// ■ガルマザード
	// 「ガルマザードが……このボクが　負ける？
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_GARUMAZADO");
	ShowMsg_("DEMO_642_MSG_010");
	KeyInputWait_();
	//===============================================
	// ■ガルマザード
	// 「おかしい……こんなの　何かの間違いだ。
	//-----------------------------------------------
	ShowMsg_("DEMO_642_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	WaitTask(task_cam);
	DeleteTask_(task_cam);


	SetPointCameraEye_("000_cameye");
	SetPointCameraTarget_("000_camtgt");

	SetMotion_(rena, r_show1, BLEND_L);
	WaitMotion(rena);
	SetMotion_(rena, r_showL, BLEND_L);
	Wait_(3);
	PlaySE_("SE_DEM_142");
	local efc_anti = SetSelectBoneEffect_("ef732_17_antibody_m", Mkoutai, ATTACH_GLOBAL);
	Wait_(30);

	//===============================================
	// ■レナーテ
	// 「今度こそ　浄化を……
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_642_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	efc_light = SetPointWorldEffect_("ef864_10_galmotherd05", "M_light");
	PlaySE_("SE_DEM_187");									//■SE:
	SetEffectScale_(efc_light, 0.5);
	Wait_(30);
	DeleteEffect_(efc_light);
	SetEffectScale_(efc_anti, 0.01);
	SetVisible(rena, false);
	SetVisible(player, false);
	SetVisible(ukisima, false);


	task_cam	 = Task_AnimeMoveCamera_("003_anmeye", "003_anmtgt");

	DeleteTask_(task_cam);

	//-----
	SetFade_(FADE_OUT, FADE_COLOR_WHITE, 5);
	Wait_(10);
	SetFade_(FADE_IN, FADE_COLOR_WHITE, 50);
	//-----

	task_mother = Task_AnimeMoveNoFit_(base_mother, "anm_base_mother000");
	efc_mother00 = SetSelectBoneEffect_("ef864_11_galmotherd06", base_mother, ATTACH_GLOBAL);
	efc_mother01 = SetPointWorldEffect_("ef864_09_galmotherd04", "MOTHER2");
	uChangeEffectScale2(efc_mother00, 0.1, 1.0, efc_mother01, 0.1, 0.7, 90);		// エフェクトを徐々に大きくする
	DeleteEffectEmitter_(efc_mother00);
	SetVisible(MOTHER, true);
	Wait_(30);
	uChangeEffectScale(efc_mother01, 0.7, 0.2, 30);									// エフェクトを徐々に小さくする
	Wait_(60);
	SetEffectScale_(efc_anti, 1.0);
	SetVisible(rena, true);
	SetVisible(player, true);
	SetVisible(ukisima, true);


	SetPointCameraEye_("001_cameye");
	SetPointCameraTarget_("001_camtgt");

	Wait_(30);
	task_player	 = Task_AnimeMoveNoFit_(Mkoutai, "Mkoutai2");
	PlaySE_("SE_DEM_173");									//■SE:大空マップ・M抗体が飛んでいく
	SetMotion_(rena, r_showsL, BLEND_L);
	Wait_(38);
	SetMotion_(rena, MOT_WAIT, BLEND_N);


	task_cam	 = Task_AnimeMoveCamera_("008_anmeye", "008_anmtgt");

	Wait_(100);
	PlaySE_("SE_DEM_185");									//■SE:コア心臓部が光り輝く
	local efc_draw = SetPointWorldEffect_("ef861_03_m_draw", "MOTHER2");
	DeleteEffectEmitter_(efc_anti);
	Wait_(20);
	DeleteEffectEmitter_(efc_light);
	efc_reacter = SetPointWorldEffect_("ef864_10_galmotherd05", "flash");
	Wait_(60);
	SetEffectScale_(efc_reacter, 3.0);
	SetFade_(FADE_OUT, FADE_COLOR_WHITE, 5)
	Wait_(5);
	DeleteEffectEmitter_(efc_reacter);
	Wait_(30);
	SetFade_(FADE_IN, FADE_COLOR_WHITE, 60);
	Wait_(60);
	DeleteTask_(task_cam);
	SetMotion_(rena, r_talk, BLEND_N);


	task_cam	 = Task_AnimeMoveCamera_("004_anmeye", "004_anmtgt");

	local task = Task_ChangeMotion_(rena, r_talkL, 4);
	Wait_(5);

	//===============================================
	// ■レナーテ
	// 「そんな！　どうしてっ！？
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_642_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	DeleteTask_(task_cam);


	task_cam	 = Task_AnimeMoveCamera_("005_anmeye", "005_anmtgt");

	//===============================================
	// ■ガルマザード
	// 「ひとりで……消えるもんか……！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_GARUMAZADO");
	ShowMsg_("DEMO_642_MSG_050");
	KeyInputWait_();
	//===============================================
	// ■ガルマザード
	// 「もうマザーはボロボロだよ……直らない。
	//-----------------------------------------------
	ShowMsg_("DEMO_642_MSG_060");
	KeyInputWait_();
	//===============================================
	// ■ガルマザード
	// 「マザーを失った　ブレイクワールドは崩壊する！
	//-----------------------------------------------
	ShowMsg_("DEMO_642_MSG_070");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	WaitTask(task_cam);
	DeleteTask_(task_cam);
	StartBlurEffect_();


	local task_cam2	 = Task_AnimeMoveCamera_("006_anmeye", "006_anmtgt");

	StartEarthQuake_(-1, 3, 3.0)
	SetMotion_(gal, g_wara, 8);

	//===============================================
	// ■ガルマザード
	// 「アハハハハハハ！！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_GARUMAZADO");
	ShowMsg_("DEMO_642_MSG_080");
	WaitMotion(gal);
	SetMotion_(gal, g_waraL, 4);
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	WaitTask(task_cam2);
	StopEarthQuake_();
	StartEarthQuake_(-1, 6, 3.0);
	DeleteEffectEmitter_(efc_bone0);
	DeleteEffectEmitter_(efc_bone1);
	DeleteEffectEmitter_(efc_bone2);
	DeleteEffectEmitter_(efc_bone3);

	// ▼爆死エフェクト
	PlaySE_("SE_DEM_234");		// ガルマザード消滅
	local efc_hourai = SetSelectBoneEffect_("ef864_03_galmotherd_die02", gal, ATTACH_EFFECT2);
	SetEffectScale_(efc_hourai,1);
	Wait_(115);

	DeleteEffectEmitter_(efc_houkai);
	SetVisible(gal, false);
	Wait_(90);

	SetPointPos_(rena, "rena001");
	SetEffectScale_(efc_mother01, 0.4);
	SetScale_(MOTHER, 0.4);
	DeleteTask_(task_cam);
	DeleteTask_(task_player);
	StopEarthQuake_();
	SetPointPos_(rena, "rena001");
	SetPointPos_(player, "player001");
	SetPointPos_(ukisima, "ukisima001");
	EndBlurEffect_();


	task_cam = Task_AnimeMoveCamera_("007_anmeye", "007_anmtgt");

	Wait_(120);
	EndDemo(FADE_COLOR_BLACK);
}


//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//		２つのエフェクトサイズを徐々に変更
//
//----------------------------------------------------------------------------
//	引数	: efc0			１つ目のエフェクトＩＤ
//			: start_size0	１つ目の初期エフェクトサイズ
//			: end_size0		１つ目の最終エフェクトサイズ
//			: efc1			２つ目のエフェクトＩＤ
//			: start_size1	２つ目の初期エフェクトサイズ
//			: end_size1		２つ目の最終エフェクトサイズ
//			: frm			フレーム数
//
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function uChangeEffectScale2(efc0, start_size0, end_size0, efc1, start_size1, end_size1, frm)
{
	local change_size0, change_size1;		// １フレームで変更するサイズ

	change_size0 = (end_size0 - start_size0) / frm;		// (最終サイズ － 初期サイズ) ÷ フレーム数
	change_size1 = (end_size1 - start_size1) / frm;		// (最終サイズ － 初期サイズ) ÷ フレーム数

	for (local i=1; i<=frm; i++) {
		SetEffectScale_(efc0, start_size0 + (change_size0 * i));
		SetEffectScale_(efc1, start_size1 + (change_size1 * i));
		Wait_(1);
	}

	SetEffectScale_(efc0, end_size0);
	SetEffectScale_(efc1, end_size1);
}

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//		エフェクトサイズを徐々に変更
//
//----------------------------------------------------------------------------
//	引数	: efc			エフェクトＩＤ
//			: start_size	初期エフェクトサイズ
//			: end_size		最終エフェクトサイズ
//			: frm			フレーム数
//
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function uChangeEffectScale(efc, start_size, end_size, frm)
{
	local change_size;		// １フレームで変更するサイズ

	change_size = (end_size - start_size) / frm;		// (最終サイズ － 初期サイズ) ÷ フレーム数

	for (local i=1; i<=frm; i++) {
		SetEffectScale_(efc, start_size + (change_size * i));
		Wait_(1);
	}

	SetEffectScale_(efc, end_size);
}
