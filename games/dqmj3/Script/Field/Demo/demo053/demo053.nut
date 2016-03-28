//=============================================
//
//		demo053[オープニングデモ_4(氷原)]
//
//=============================================

//-------------------------------------------------------------------------
//
//		読み込み・配置
//
//-------------------------------------------------------------------------
function Update()
{
	
	SetTime_(15120);				// 夜
	SetWeather_(WEATHER.NORMAL); 	// 天候晴れ
	
// ▼変数定義
	local task_cam, task_reactor, task_snowdragon000, task_snowdragon100, task_snowdragon200;
	local efc_ractor00, efc_ractor01, efc_ractor02;
	local size_reactor = SCALE.REACTOR;

// ▼リソース読込
	// ギミック
	local model_reactor = ReadGimmick_("o_dem_11");	// リアクター
	// エフェクト
	LoadEffect_("ef800_04_flying_reactor01");		// リアクターの軌跡
	LoadEffect_("ef800_06_flying_reactor03");		// リアクター加速
	LoadEffect_("ef800_07_flying_reactor04");		// リアクターのまぶしい光
	// キャラクター
	local model_snowdragon = ReadNpc_("m015_01");	// せつげんりゅう
	// レイアウト
	LoadLayout_("op_credit");
	
	ReadWaitingLod("cameye001", "camtgt001");

// ▼配置
	// せつげんりゅう
	local snowdragon000 = ArrangePointNpc_(model_snowdragon, "npc_snowdragon000");
	local snowdragon100 = ArrangePointNpc_(model_snowdragon, "npc_snowdragon100");
	local snowdragon200 = ArrangePointNpc_(model_snowdragon, "npc_snowdragon200");
	
	SetScaleSilhouette(snowdragon000, SCALE.G, SILHOUETTE_WIDTH.G);
	SetScaleSilhouette(snowdragon100, SCALE.SNOW_DRAGON, SILHOUETTE_WIDTH.SNOW_DRAGON);
	SetScaleSilhouette(snowdragon200, SCALE.SNOW_DRAGON, SILHOUETTE_WIDTH.SNOW_DRAGON);	
	
	SetMotion_(snowdragon000, MOT_WAIT, BLEND_N);
	Wait_(10);
	SetMotion_(snowdragon100, MOT_WAIT, BLEND_N);	
	
	// リアクター
	local reactor = ArrangeGimmick_("o_dem_11", model_reactor, false);
	SetScaleSilhouette(reactor, SCALE.REACTOR, SILHOUETTE_WIDTH.REACTOR);
	efc_ractor00 = SetSelectBoneEffect_("ef800_04_flying_reactor01", reactor, ATTACH_GLOBAL);
	SetEffectScale_(efc_ractor00, size_reactor);
	task_reactor = Task_AnimeMoveNoFit_(reactor, "anm_reactor001");	// 271F

// ▼カメラ設定
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");		// 271F
	
	SetMotion_(snowdragon200, MOT_WALK, BLEND_N);
	task_snowdragon200 = Task_MoveForward_(snowdragon200, 3.0, false);

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

//	StartDemo(FADE_COLOR_BLACK);

	local bgm = "";

	if(bgm != ""){
		PlayBgm_(bgm);
	}

	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	Wait_(30);	// 30F

	Wait_(10);	// 40F

	efc_ractor01 = SetSelectBoneEffect_("ef800_06_flying_reactor03", reactor, ATTACH_GLOBAL);
	SetEffectScale_(efc_ractor01, size_reactor);
	
	Wait_(5);	// 45F
	
	SetMotion_(snowdragon000, MOT_LIFE_SPECIAL_2, BLEND_XL);
	
	Wait_(115);	// 160F
	
	DeleteTask_(task_snowdragon200);
	
	SetLayoutAnime_("akira_toriyama", false);		// 「鳥山明」
	
	efc_ractor02 = SetSelectBoneEffect_("ef800_07_flying_reactor04", reactor, ATTACH_GLOBAL);
	SetEffectScale_(efc_ractor02, size_reactor);
	Wait_(17);	// 177F
	DeleteEffectEmitter_(efc_ractor02);
	
	Wait_(58);	// 235F
	
	DeleteEffect_(efc_ractor01);	
	efc_ractor01 = SetSelectBoneEffect_("ef800_06_flying_reactor03", reactor, ATTACH_GLOBAL);
	SetEffectScale_(efc_ractor01, size_reactor);
	
	Wait_(36);	// 271F

	SetVisible(reactor, false);

	Wait_(5);	// 276F
		
	DeleteEffectEmitter_(efc_ractor00);

	Wait_(35);	// 311F
	
	EndDemo(FADE_COLOR_BLACK);
}
