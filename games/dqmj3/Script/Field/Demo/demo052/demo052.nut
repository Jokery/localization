//=============================================
//
//		demo052[オープニングデモ_3(監獄)]
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
	local task_cam, task_reactor;
	local efc_kiseki, efc_kasoku;
	local size_reactor = SCALE.REACTOR;

// ▼リソース読込
	local model_reactor = ReadGimmick_("o_dem_11");							// リアクター
	LoadEffect_("ef800_04_flying_reactor01");								// リアクター軌跡
	LoadEffect_("ef800_06_flying_reactor03");								// リアクター加速

// ▼配置
	local reactor = ArrangeGimmick_("o_dem_11", model_reactor, false);		// リアクター
	SetScaleSilhouette(reactor, SCALE.REACTOR, SILHOUETTE_WIDTH.REACTOR);
	efc_kiseki = SetSelectBoneEffect_("ef800_04_flying_reactor01", reactor, ATTACH_GLOBAL);
	SetEffectScale_(efc_kiseki, size_reactor);
	task_reactor = Task_AnimeMoveNoFit_(reactor, "anm_reactor000");			// 300F

// ▼天候・時間
	SetTime_(18000);						//朝方
	SetWeather_(WEATHER.NORMAL); 			//天候晴れ
	
// ▼カメラ設定
	local task = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------	
	StartDemo(FADE_COLOR_BLACK);
	
	Wait_(160);
	efc_kasoku = SetPointWorldEffect_("ef800_06_flying_reactor03", "efc_flying_reactor000");
	SetEffectScale_(efc_kasoku, 2);
	
	Wait_(50);
	
	EndDemo(FADE_COLOR_BLACK);
}
