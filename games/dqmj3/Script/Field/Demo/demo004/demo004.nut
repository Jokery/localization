//=============================================
//
//		demo004[オープニングデモ_7(草原)]
//
//=============================================

//-------------------------------------------------------------------------
//
//		読み込み・配置
//
//-------------------------------------------------------------------------
function Update()
{
// ▼天候設定
	SetWeather_(WEATHER.BAD);						// 悪天候
	SetTime_(15120);								// 夜
	
// ▼変数定義
	local task_cam, task_player, task_reactor;
	local efc_player, efc_ractor00, efc_ractor01, efc_ractor02, efc_ractor03, efc_ractor04;
	local efc_thunder00, efc_thunder01,efc_thunder02 ,efc_thunder03 ,efc_thunder04 ,efc_thunder05;
	local size_reactor = SCALE.REACTOR;	

// ▼リソース読込
	// キャラクター
	local player = GetPlayerId_();					// 主人公
	// ギミック
	local model_reactor = ReadGimmick_("o_dem_11");	// リアクター
	// エフェクト
	LoadEffect_("ef800_04_flying_reactor01");		// リアクターの軌跡
	LoadEffect_("ef800_06_flying_reactor03");		// リアクター加速
	LoadEffect_("ef800_10_crash_reactor01");		// 煙（リアクターの落雷時の火花）
	LoadEffect_("ef800_09_crash_reactor02");		// 雷（リアクターに落ちる）
	LoadEffect_("ef721_04_nat_smoke_psps");			// 煙（ぷすぷす）	
	LoadEffect_("ef800_11_crash_reactor03");		// 煙（リアクターの落雷後の煙）	
	
	//天候エフェクト
	LoadEffect_("ef725_01_nat_rain_hard");			// 大雨
	LoadEffect_("ef725_02_nat_thunder");			// 雷（雨とセット）
	

// ▼配置
	
	//リアクター
	local reactor = ArrangePointGimmick_("o_com_07", model_reactor, "obj_reactor000");
	SetScaleSilhouette(reactor, 5.0, 0.5);														//リアクター大きさ変更
	efc_ractor00 = SetSelectBoneEffect_("ef800_04_flying_reactor01", reactor, ATTACH_GLOBAL);	//リアクターの軌跡
	SetEffectScale_(efc_ractor00, 5.0);
	
	//天候
	SetCameraEffect_("ef725_01_nat_rain_hard", 100);											//大雨
//	PlayBgm_("BGM_028");//デバッグ用BGM
//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット1　雨が降っている光景→//■カット2　アーチの前（統合）
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	// ▼カメラ設定
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");									// 80F
	WaitLod_();
	
	StartDemo(FADE_COLOR_BLACK);
	Wait_(10);
	
	efc_thunder00 = SetPointWorldEffect_("ef725_02_nat_thunder", "efc_thunder000");				// 3連サンダー
	SetEffectScale_(efc_thunder00, 1.5);
	Wait_(40);
	efc_thunder01 = SetPointWorldEffect_("ef725_02_nat_thunder", "efc_thunder001");
	SetEffectScale_(efc_thunder01, 2.5);
	Wait_(60);	
	efc_thunder02 = SetPointWorldEffect_("ef725_02_nat_thunder", "efc_thunder002");
	SetEffectScale_(efc_thunder02, 1.5);

	Wait_(30);	
	efc_thunder03 = SetPointWorldEffect_("ef725_02_nat_thunder", "efc_thunder003");				// サンダー
	SetEffectScale_(efc_thunder03, 0.7);
	
	WaitTask(task_cam);
	
	task_reactor = Task_AnimeMove_(reactor, "anm_reactor000");									//リアクターアニメーション	

	Wait_(80);

	DeleteTask_(task_cam);

	DeleteTask_(task_reactor);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット3　雷に打たれる
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetBgmVolume_(0.0, 140);		// 140フレームかけて、BGM音量を消します
	//アニメカメラ設定
	SetScaleSilhouette(reactor, 10.0, 5.0);														//リアクターの大きさ変更
	SetEffectScale_(efc_ractor00, 10.0);														//奇跡の大きさ変更
	
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");									// 110F
	PlaySE_("SE_DEM_069");																		//■SE ポッド雷に打たれる前の浮遊
	task_reactor = Task_AnimeMove_(reactor, "anm_reactor001");									//リアクターアニメーション
	
	Wait_(140);
	PlaySE_("SE_DEM_059");																		//■SE ポッド雷に打たれて落ちる
	efc_ractor03 = SetSelectBoneEffect_("ef800_09_crash_reactor02", reactor, ATTACH_GLOBAL);	//リアクターに雷
	SetEffectScale_(efc_ractor03, 4.0);
	DeleteEffect_(efc_ractor00);																//リアクターのオーラを消す
	
	Wait_(5);
	efc_ractor02 = SetSelectBoneEffect_("ef800_10_crash_reactor01", reactor, ATTACH_GLOBAL);	//リアクターから火花
	SetEffectScale_(efc_ractor02, 3.0);	
	
	efc_ractor03 = SetSelectBoneEffect_("ef800_11_crash_reactor03", reactor, ATTACH_GLOBAL);	//リアクターから煙
	SetEffectScale_(efc_ractor03, 5.0);		
	
	Wait_(25);
	SetBgmVolume_(1.0, 1);
	PlayBgm_("BG_AMBI_006");													//BGM切り替え
	
	WaitTask(task_cam);
	
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 20);													//フェードアウト
	WaitFade_();	

	DeleteTask_(task_reactor);	
	DeleteTask_(task_cam);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット4　楽園へ墜落
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	PlaySE_("SE_DEM_060");																		//■SE ポッド墜落中

	WaitLod_();
	SetScaleSilhouette(reactor, 2.0, 0.5);														//リアクター大きさ変更
	
//	efc_ractor03 = SetSelectBoneEffect_("ef800_10_crash_reactor01", reactor, ATTACH_GLOBAL);	//リアクターから煙
	SetEffectScale_(efc_ractor03, 1.0);
	
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 10);													//フェードイン
	WaitFade_();

	task_reactor = Task_AnimeMove_(reactor, "anm_reactor002");									//リアクターアニメーション

	Wait_(75);
	efc_thunder04 = SetPointWorldEffect_("ef725_02_nat_thunder", "efc_thunder004");				// サンダー
	SetEffectScale_(efc_thunder04, 2.0);

	Wait_(55);

	
	EndDemo(FADE_COLOR_BLACK);
}
