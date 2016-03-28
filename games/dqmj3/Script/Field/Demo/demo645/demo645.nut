//=============================================
//
//		demo645[ガルマザード戦勝利_4(天変地異-草原)]
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
	local task_cam, task_player;
	local efc_player, efc_catastrophe000;

// ▼リソース読込
	// キャラクター
	local player = GetPlayerId_();						// 主人公
	// エフェクト
	local model_base = ReadGimmick_("o_effect_base");	// エフェクトベース
	LoadEffect_("ef864_04_catastrophe01");				// 瘴気
	LoadEffect_("ef725_01_nat_rain_hard");				// 大雨
	LoadEffect_("ef800_11_crash_reactor03");			// 火花
	LoadEffect_("ef723_01_nat_explosion_n01");			// 爆発

// ▼配置
	// 隕石（エフェクトベース）
	local mateor1 = ArrangePointGimmick_("o_effect_base", model_base, "obj_mateor000");
	local mateor2 = ArrangePointGimmick_("o_effect_base", model_base, "obj_mateor001");
	local mateor3 = ArrangePointGimmick_("o_effect_base", model_base, "obj_mateor002");	

// ▼カメラ設定
	SetWeather_(WEATHER.BAD);												//天候 雨
	SetTime_(8000);															//夜
	ChangeColorTone_(0.5, 0.5, 0.5, 30);
	efc_catastrophe000 = SetCameraEffect_("ef864_04_catastrophe01", 100);	//瘴気
	SetCameraEffect_("ef725_01_nat_rain_hard", 100);						//大雨
	ReadWaitingLod("cameye000", "camtgt000");

	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

	StartEarthQuake_(-1, 3, 0.2);											//地震
	PlayBgm_("BG_AMBI_020");
	PlaySE_("SE_DEM_190");


//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	Wait_(120);

	local efc_mateor1 = SetSelectBoneEffect_("ef800_11_crash_reactor03", mateor1, ATTACH_GLOBAL);	//隕石
	SetEffectScale_(efc_mateor1, 3.0);
	local task_meteor01 = Task_AnimeMoveNoFit_(mateor1, "anm_mateor000");
	Wait_(40);
	local efc_mateor1 = SetSelectBoneEffect_("ef723_01_nat_explosion_n01", mateor1, ATTACH_GLOBAL);	//爆発
	SetEffectScale_(efc_mateor1, 8.0);
	StopEarthQuake_();
	StartEarthQuake_(-1, 3, 5);											//大きく揺らす
	Wait_(3);
	StopEarthQuake_();
	StartEarthQuake_(-1, 3, 0.2);											//地震
	local efc_mateor2 = SetSelectBoneEffect_("ef800_11_crash_reactor03", mateor2, ATTACH_GLOBAL);	//隕石
	SetEffectScale_(efc_mateor2, 6.5);
	local task_meteor02 = Task_AnimeMoveNoFit_(mateor2, "anm_mateor001");
	Wait_(20);
	ChangeColorTone_(1.5, 0.5, 0.5, 30);
	local efc_mateor3 = SetSelectBoneEffect_("ef800_11_crash_reactor03", mateor3, ATTACH_GLOBAL);	//隕石
	SetEffectScale_(efc_mateor3, 15.0);	
	local task_meteor03 = Task_AnimeMoveNoFit_(mateor3, "anm_mateor002");
	Wait_(20);
	local efc_mateor2 = SetSelectBoneEffect_("ef723_01_nat_explosion_n01", mateor2, ATTACH_GLOBAL);	//爆発
	SetEffectScale_(efc_mateor2, 7.0);
	StopEarthQuake_();
	StartEarthQuake_(-1, 3, 3);											//大きく揺らす
	Wait_(9);
	StopEarthQuake_();
	StartEarthQuake_(-1, 3, 0.2);											//地震
	Wait_(11);
	local efc_mateor3 = SetSelectBoneEffect_("ef723_01_nat_explosion_n01", mateor3, ATTACH_GLOBAL);	//爆発
	SetEffectScale_(efc_mateor3, 10.0);
	StopEarthQuake_();
	StartDecayEarthQuake_(100, 3, 1);
	Wait_(80);

	EndDemo(FADE_COLOR_BLACK);
}
