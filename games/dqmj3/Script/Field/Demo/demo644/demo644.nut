//=============================================
//
//		demo644[ガルマザード戦勝利_3(天変地異-崩落)]
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
	local task_cam, task_nocho;
	local efc_catastrophe000, efc_para01, efc_para02, efc_para00;
	local efc_thunder00, efc_thunder01,efc_thunder02 ,efc_thunder03 ,efc_thunder04 ,efc_thunder05;

	// ギミック読み込み
	local obj_water = ReadGimmick_("o_A00_02");	
	local obj_center = ReadGimmick_("o_A00_04");			// センタービル　照明

//	▼エフェクト
	LoadEffect_("ef864_04_catastrophe01");					// 天変地異
	LoadEffect_("ef725_02_nat_thunder");					// 雷（雨とセット）
	LoadEffect_("ef800_09_crash_reactor02");				// 雷（リアクターに落ちる）
	LoadEffect_("ef832_01_fire");							// 炎
	LoadEffect_("ef852_03_explosion_db");					// 爆発
	LoadEffect_("ef725_01_nat_rain_hard");					// 大雨

// ▼配置
	local center = ArrangePointGimmick_("o_A00_04",obj_center, "center000");			// センタービル　照明
	SetMotion_(center, MOT_GIMMICK_1, 1);

// ▼カメラ設定
	SetTime_(0);																		// 昼
	ReadWaitingLod("cameye000", "camtgt000");
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

// ▼天候・初期エフェクト設定
	StartEarthQuake_(-1, 3, 3);															// 地震
	SetWeather_(WEATHER.BAD);															// 天候 雨
	SetCameraEffect_("ef725_01_nat_rain_hard", 100);									// 大雨
	efc_catastrophe000 = SetCameraEffect_("ef864_04_catastrophe01", 100);				// 瘴気

	PlayBgm_("BG_AMBI_020");
	PlaySE_("SE_DEM_189");


//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);

	efc_thunder00 = SetPointWorldEffect_("ef725_02_nat_thunder", "efc_thunder000");		// サンダー
	SetEffectScale_(efc_thunder00, 2.5);
	Wait_(40);
	efc_thunder01 = SetPointWorldEffect_("ef725_02_nat_thunder", "efc_thunder001");
	SetEffectScale_(efc_thunder01, 1.5);
	Wait_(30);
	efc_thunder02 = SetPointWorldEffect_("ef725_02_nat_thunder", "efc_thunder002");
	SetEffectScale_(efc_thunder02, 5.0);
	Wait_(10);
	//...........................................................................
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);											//フェードアウト
	WaitFade_();
	StopEarthQuake_();
	ReadWaitingLod("cameye001", "camtgt001");											//Lod読込


	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");

	StartEarthQuake_(-1, 3, 0.3);														//地震
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);											//フェードイン
	//...........................................................................
	Wait_(30);
	local efc_crash = SetPointWorldEffect_("ef800_09_crash_reactor02", "efc_fire002");		//木に雷
	SetEffectScale_(efc_crash, 1.5);
	StartEarthQuake_(12, 3, 15.0);															//大きい地震
	Wait_(12);
	StartEarthQuake_(-1, 3, 1.0);															//地震
	local efc_fire02 = SetPointWorldEffect_("ef832_01_fire", "efc_fire002");				//ファイアー
	SetEffectScale_(efc_fire02, 6.0);
	ChangeColorTone_(1.5, 0.5, 0.5, 30);													//画面赤く
	Wait_(30);
	efc_thunder03 = SetPointWorldEffect_("ef725_02_nat_thunder", "efc_thunder003");
	SetEffectScale_(efc_thunder03, 4.0);
	Wait_(20);
	efc_thunder04 = SetPointWorldEffect_("ef725_02_nat_thunder", "efc_thunder004");
	SetEffectScale_(efc_thunder04, 6.5);
	Wait_(30);

	//...........................................................................
	SetFade_(FADE_OUT, FADE_COLOR_WHITE, 10);												//白フラッシュ　フェードアウト
	Wait_(10);
	SetFade_(FADE_IN, FADE_COLOR_WHITE, 30);												//フェードイン
	local efc_crash = SetPointWorldEffect_("ef800_09_crash_reactor02", "efc_fire001");		//ビルに雷
	//...........................................................................

	local efc_fire01 = SetPointWorldEffect_("ef852_03_explosion_db", "efc_fire001");		//ビルにボンバー
	SetEffectScale_(efc_fire01, 4.0);
	ChangeColorTone_(2.5, 0.5, 0.5, 20);													//画面赤く
	StartEarthQuake_(21, 3, 20.0);															//大きい地震
	Wait_(21);
	StartEarthQuake_(-1, 3, 1.5);															//地震
	local efc_fire01 = SetPointWorldEffect_("ef832_01_fire", "efc_fire001");				//ファイアー
	SetEffectScale_(efc_fire01, 20.0);
	Wait_(80);

	EndDemo(FADE_COLOR_BLACK);
}
