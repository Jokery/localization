//=============================================
//
//		demo643[ガルマザード戦勝利_2(天変地異-火山)]
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
	local task_cam, task_player, task_birdy, task_kimera1, task_kimera2, task_kimera3;
	local efc_player, efc_catastrophe000;

// ▼リソース読込
	// キャラクター
	local player = GetPlayerId_();					// 主人公
	local model_birdy = ReadNpc_("n019");			// バーディ

	//エフェクト
	local model_base = ReadGimmick_("o_effect_base");	// エフェクトベース
	LoadEffect_("ef864_04_catastrophe01");				// 瘴気
	LoadEffect_("ef800_11_crash_reactor03");			// 火花
	LoadEffect_("ef800_10_crash_reactor01");			// 火花（リアクターの落雷時）
	LoadEffect_("ef723_01_nat_explosion_n01");			// 爆発

// ▼配置
	// 隕石（エフェクトベース）
	local mateor1 = ArrangePointGimmick_("o_effect_base", model_base, "obj_mateor000");
	local mateor2 = ArrangePointGimmick_("o_effect_base", model_base, "obj_mateor001");
	local mateor3 = ArrangePointGimmick_("o_effect_base", model_base, "obj_mateor002");

// ▼天候・時間設定
	SetTime_(7000);														//夕焼け

// ▼カメラ設定
	ReadWaitingLod("cameye000", "camtgt000");

	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");


//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------
	StartDemo(FADE_COLOR_BLACK);

	Wait_(10);
	StartEarthQuake_(-1, 3, 1.5);											//地震
	PlayBgm_("BG_AMBI_020");
	Wait_(30);
	efc_catastrophe000 = SetCameraEffect_("ef864_04_catastrophe01", 100);	// 瘴気
	ChangeTime(8000, 30, 7000);												//夕から夜に
	ChangeColorTone_(0.5, 0.5, 0.5, 30);
	Wait_(30);
	StopEarthQuake_();
	StartEarthQuake_(-1, 3, 3);											//地震
	Wait_(30);

	//...........................................................................
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);					//フェードアウト
	WaitFade_();
	StopEarthQuake_();
	ReadWaitingLod("cameye001", "camtgt001");


	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");

	StartEarthQuake_(-1, 3, 0.8);											//地震
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);					//フェードイン
	PlaySE_("SE_DEM_188");
	//...........................................................................
	Wait_(10);

	//隕石
	local efc_mateor1 = SetSelectBoneEffect_("ef800_11_crash_reactor03", mateor1, ATTACH_GLOBAL);	//メテオ１
	SetEffectScale_(efc_mateor1, 6.0);
	task_kimera3 = Task_AnimeMoveNoFit_(mateor1, "anm_mateor000");
	Wait_(30);
	StartEarthQuake_(9, 3, 10.0);											//大きい地震
	local efc_bomb = SetSelectBoneEffect_("ef723_01_nat_explosion_n01", mateor1, ATTACH_GLOBAL);	//メテオ１爆発
	SetEffectScale_(efc_bomb, 2.0);
	Wait_(9);
	StartEarthQuake_(-1, 3, 0.8);							//地震
	local efc_mateor2 = SetSelectBoneEffect_("ef800_11_crash_reactor03", mateor2, ATTACH_GLOBAL);	//メテオ２
	SetEffectScale_(efc_mateor2, 1.0);
	task_kimera2 = Task_AnimeMoveNoFit_(mateor2, "anm_mateor001");
	Wait_(16);
	local efc_mateor3 = SetSelectBoneEffect_("ef800_11_crash_reactor03", mateor3, ATTACH_GLOBAL);	//メテオ３
	SetEffectScale_(efc_mateor3, 5.0);	
	task_kimera1 = Task_AnimeMoveNoFit_(mateor3, "anm_mateor002");
	Wait_(13);
	StartEarthQuake_(6, 3, 8.0);											//大きい地震
	local efc_bomb = SetSelectBoneEffect_("ef723_01_nat_explosion_n01", mateor2, ATTACH_GLOBAL);	//メテオ２爆発
	SetEffectScale_(efc_bomb, 1.5);
	Wait_(6);
	StartEarthQuake_(-1, 3, 1.0);							//地震
	Wait_(10);
	StartEarthQuake_(12, 3, 15);											//大きい地震
	local efc_bomb = SetSelectBoneEffect_("ef723_01_nat_explosion_n01", mateor3, ATTACH_GLOBAL);	//メテオ３爆発
	SetEffectScale_(efc_bomb, 2.5);
	Wait_(12);
	StartEarthQuake_(-1, 3, 1.5);							//地震
	Wait_(50);

	EndDemo(FADE_COLOR_BLACK);
}
