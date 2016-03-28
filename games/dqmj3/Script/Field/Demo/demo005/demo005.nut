//=============================================
//
//		demo005[オープニングデモ_8(楽園)]
//
//=============================================

//-------------------------------------------------------------------------
//
//		読み込み・配置
//
//-------------------------------------------------------------------------
function Update()
{

	SetTime_(10000);	// 夜
	
// ▼変数定義
	local task_cam, task_reactor;
	local efc_reactor, efc_reactor000, efc_reactor001, efc_butterfly;

// ▼リソース読込
	// ギミック
	local model_reactor = ReadGimmick_("o_dem_11");	// リアクター
	// エフェクト
	LoadEffect_("ef800_11_crash_reactor03");		// リアクターの煙
	LoadEffect_("ef721_04_nat_smoke_psps");
	LoadEffect_("ef720_02_nat_oth_butterfly");
	// キャラクター
	local player = GetPlayerId_();					// 主人公
	
// ▼LOD読み込み
	ReadWaitingLod("cameye001", "camtgt001");

// ▼配置
	// ギミック
	local reactor = ArrangePointGimmick_("o_dem_11", model_reactor, "obj_reactor000");
	// キャラクター
	SetPointPos_(player, "player000");
	SetActive_(player, false);

// ▼カメラ設定
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット1	ポッド地面に墜落
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	efc_reactor = SetSelectBoneEffect_("ef800_11_crash_reactor03", reactor, ATTACH_GLOBAL);
	task_reactor = Task_AnimeMoveNoFit_(reactor, "anm_reactor000");
	Wait_(15);
	PlaySE_("SE_DEM_061");																		//■SE ポッド地面に墜落
	Wait_(5);
	StartDemo(FADE_COLOR_BLACK);

	WaitTask(task_reactor);
	
	StartEarthQuake_(15, 3, 0.8);
	
	Wait_(120);
	
	DeleteTask_(task_reactor);
	
	DeleteEffect_(efc_reactor);
	
	SetPointPosNoFit_(reactor, "obj_reactor000");
	
	efc_reactor000 = SetPointWorldEffect_("ef721_04_nat_smoke_psps", "efc_reactor000");
	SetEffectScale_(efc_reactor000, 0.7);
	
	efc_reactor001 = SetPointWorldEffect_("ef721_04_nat_smoke_psps", "efc_reactor001");
	SetEffectScale_(efc_reactor001, 0.6);
	
	SetScaleSilhouette(reactor, SCALE.REACTOR_CASE, SILHOUETTE_WIDTH.REACTOR_CASE);
	
	SetTime_(9500);	// 夜

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット２ ポッドアップ「JOKER」
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");		// 80F
	PlaySE_("SE_DEM_062");																		//■SE ポッド開く→中身起動

	Wait_(70);
	
	SetMotion_(reactor, MOT_GIMMICK_2, BLEND_N);
	
	Wait_(50);
	
	SetMotion_(reactor, MOT_GIMMICK_4, BLEND_N);
	
	Wait_(230);

	SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
	
	DeleteEffect_(efc_reactor000);
	DeleteEffect_(efc_reactor001);
	
	DeleteTask_(task_cam);
	
	SetTime_(0000);	// 朝

	Wait_(130);

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット３ 楽園全景①
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");		// 110F
	PlayBgm_("BG_AMBI_005");
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();

	WaitTask(task_cam);
	
	Wait_(15);

	DeleteTask_(task_cam);
	
	efc_butterfly = SetPointWorldEffect_("ef720_02_nat_oth_butterfly", "efc_butterfly000");

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット４ 楽園全景②
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");		// 130F
	WaitTask(task_cam);

	Wait_(30);
	
	DeleteTask_(task_cam);
	
	DeleteEffect_(efc_butterfly);

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット５ 楽園全景③
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");		// 120F
	WaitTask(task_cam);

	Wait_(30);

	EndDemo(FADE_COLOR_BLACK);
}
