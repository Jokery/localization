//=============================================
//
//		demo051[オープニングデモ_2(火山)]
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
	local efc_kiseki, efc_kasoku ,efc_ractor02;
	local size_reactor = SCALE.REACTOR;

// ▼リソース読込
	// キャラクター
	local model_reactor = ReadGimmick_("o_dem_11");								// リアクター
	LoadEffect_("ef800_04_flying_reactor01");									// リアクター軌跡
	LoadEffect_("ef800_06_flying_reactor03");									// リアクター加速
	LoadEffect_("ef800_07_flying_reactor04");									// リアクターのまぶしい光
	
	// レイアウト
	LoadLayout_("op_credit");

// ▼配置
	local reactor = ArrangeGimmick_("o_dem_11", model_reactor, false);			// リアクター
	SetScaleSilhouette(reactor, SCALE.REACTOR, SILHOUETTE_WIDTH.REACTOR);
	efc_kiseki = SetSelectBoneEffect_("ef800_04_flying_reactor01", reactor, ATTACH_GLOBAL);
	SetEffectScale_(efc_kiseki, size_reactor);
	task_reactor = Task_AnimeMoveNoFit_(reactor, "anm_reactor000");				// 300F

// ▼天候・時間設定
	SetTime_(13000);															// 夜
	SetWeather_(WEATHER.NORMAL); 												// 天候晴れ
	
// ▼カメラ設定
	local task = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);									// エフェクトをだす位置調整のためフェードインを手動で設定しています。

	Wait_(20);																					// 20F
	
	//加速エフェクト1
	efc_kasoku = SetSelectBoneEffect_("ef800_06_flying_reactor03", reactor, ATTACH_GLOBAL);
	SetEffectScale_(efc_kasoku, size_reactor);
	PlayBgm_("BGM_028")
	
	//レンズ効果エフェクト1
	efc_ractor02 = SetSelectBoneEffect_("ef800_07_flying_reactor04", reactor, ATTACH_GLOBAL);
	SetEffectScale_(efc_ractor02, size_reactor);
	Wait_(5);																					// 25F
	DeleteEffectEmitter_(efc_ractor02);
	Wait_(5);																					// 30F
	efc_ractor02 = SetSelectBoneEffect_("ef800_07_flying_reactor04", reactor, ATTACH_GLOBAL);
	SetEffectScale_(efc_ractor02, 3.0);
	Wait_(3);																					// 33F
	DeleteEffectEmitter_(efc_ractor02);
	Wait_(3);																					// 36F
	efc_ractor02 = SetSelectBoneEffect_("ef800_07_flying_reactor04", reactor, ATTACH_GLOBAL);
	SetEffectScale_(efc_ractor02, 3.0);
	Wait_(3);																					// 39F
	DeleteEffectEmitter_(efc_ractor02);
	Wait_(51);																					// 90F
	
	SetLayoutAnime_("yuji_horii", false);														// 「堀井雄二」
	
	//レンズ効果エフェクト2
	Wait_(38);																					// 128F
	efc_ractor02 = SetSelectBoneEffect_("ef800_07_flying_reactor04", reactor, ATTACH_GLOBAL);
	SetEffectScale_(efc_ractor02, 8.0);
	Wait_(5);																					// 133F
	DeleteEffectEmitter_(efc_ractor02);

	//加速エフェクト2
	Wait_(3);																					// 136F
	efc_kasoku = SetSelectBoneEffect_("ef800_06_flying_reactor03", reactor, ATTACH_GLOBAL);
	SetEffectScale_(efc_kasoku, size_reactor);
	
	//レンズ効果エフェクト3
	Wait_(20);																					// 156F
	efc_ractor02 = SetSelectBoneEffect_("ef800_07_flying_reactor04", reactor, ATTACH_GLOBAL);
	SetEffectScale_(efc_ractor02, 8.0);
	Wait_(5);																					// 161F
	DeleteEffectEmitter_(efc_ractor02);	
	
	//加速エフェクト3
	Wait_(55);																					// 216F
	efc_kasoku = SetSelectBoneEffect_("ef800_06_flying_reactor03", reactor, ATTACH_GLOBAL);
	SetEffectScale_(efc_kasoku, size_reactor);
	
	Wait_(25);																					// 241F
	
	EndDemo(FADE_COLOR_BLACK);
}
