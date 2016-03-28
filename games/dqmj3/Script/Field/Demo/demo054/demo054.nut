//=============================================
//
//		demo054[オープニングデモ_5(霊道)]
//
//=============================================

//-------------------------------------------------------------------------
//
//		読み込み・配置
//
//-------------------------------------------------------------------------
function Update()
{
// ▼時間設定
	SetTime_(15120);													// 夜	
	
// ▼変数定義
	local task_cam, task_player, task_reactor;
	local efc_kiseki, efc_kasoku, efc_flash, efc_shitai00, efc_shitai01, efc_shitai02;
	local size_reactor = SCALE.REACTOR;
	
// ▼リソース読込
	// キャラクター
	local model_reactor = ReadGimmick_("o_dem_11");						// リアクター
	local model_shitai = ReadNpc_("m102_00");							// くさった死体
	local model_bat = ReadNpc_("m097_00");								// ボーンバット
	
// ▼エフェクト読込
	LoadEffect_("ef800_04_flying_reactor01");							// 軌跡
	LoadEffect_("ef800_06_flying_reactor03");							// 加速
	LoadEffect_("ef800_07_flying_reactor04");							// リアクターのまぶしい光
	LoadEffect_("ef726_02_nat_zombie");									// ゾンビ系が土から出てくるところ
	
// ▼配置
	//リアクター
	local reactor = ArrangeGimmick_("o_dem_11", model_reactor, false);
//	SetScaleSilhouette(reactor, SCALE.REACTOR, SILHOUETTE_WIDTH.REACTOR);
	task_reactor = Task_AnimeMoveNoFit_(reactor, "anm_reactor001");
	efc_kiseki = SetSelectBoneEffect_("ef800_04_flying_reactor01", reactor, ATTACH_GLOBAL);
	SetEffectScale_(efc_kiseki, 2.0);	
	
	//くさった死体
	local shitai00 = ArrangePointNpc_(model_shitai, "npc_shitai000");
	SetScaleSilhouette(shitai00, SCALE.N, SILHOUETTE_WIDTH.N);			//Nサイズ
	local shitai01 = ArrangePointNpc_(model_shitai, "npc_shitai001");
	SetScaleSilhouette(shitai01, SCALE.N, SILHOUETTE_WIDTH.N);			//Nサイズ
	local shitai02 = ArrangePointNpc_(model_shitai, "npc_shitai002");
	SetScaleSilhouette(shitai02, SCALE.M, SILHOUETTE_WIDTH.M);			//Mサイズ
	
	//ボーンバット
	local bat00 = ArrangePointNpc_(model_bat, "npc_bat000");
	SetScaleSilhouette(bat00, SCALE.N, SILHOUETTE_WIDTH.N);				//Nサイズ
	SetMotion_(bat00, MOT_WALK, BLEND_M);								//初期モーション
	task_reactor = Task_AnimeMoveNoFit_(bat00, "anm_bat000");
	
// ▼初期表示設定
	SetVisible(shitai00, false);										//非表示な死体A
	SetVisible(shitai01, false);										//非表示な死体B
	SetVisible(shitai02, false);										//非表示な死体C	

// ▼カメラ設定
	local task = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);

	Wait_(10);

	efc_flash = SetSelectBoneEffect_("ef800_07_flying_reactor04", reactor, ATTACH_GLOBAL);
	SetEffectScale_(efc_flash, 7.0);															//リアクターのまぶしい光1
	Wait_(10);
	DeleteEffectEmitter_(efc_flash);	
	
	Wait_(5);
	SetMotion_(shitai00, MOT_LIFE_SPECIAL_1, BLEND_N);											//這い出る死体A
	SetVisible(shitai00, true);																	//表示される死体A
	efc_shitai00 = SetSelectBoneEffect_("ef726_02_nat_zombie", shitai00, ATTACH_GLOBAL);		//土エフェクト

	Wait_(35);
	
	efc_flash = SetSelectBoneEffect_("ef800_07_flying_reactor04", reactor, ATTACH_GLOBAL);
	SetEffectScale_(efc_flash, 5.0);															//リアクターのまぶしい光2
	Wait_(10);
	DeleteEffectEmitter_(efc_flash);	
	
	Wait_(20);
	
	SetMotion_(shitai01, MOT_LIFE_SPECIAL_1, BLEND_N);											//這い出る死体B	
	SetVisible(shitai01, true);																	//表示される死体B
	efc_shitai01 = SetSelectBoneEffect_("ef726_02_nat_zombie", shitai01, ATTACH_GLOBAL);		//土エフェクト
	
	WaitMotion(shitai00);
	SetMotion_(shitai00, MOT_WAIT, BLEND_M);													//死体A待機	
	
	WaitMotion(shitai01);
	SetMotion_(shitai01, MOT_WAIT, BLEND_M);													//死体B待機
	
	Wait_(23);
	
	efc_kasoku = SetSelectBoneEffect_("ef800_06_flying_reactor03", reactor, ATTACH_GLOBAL);		//リアクター加速
	SetEffectScale_(efc_kasoku, 1.3);
	efc_flash = SetSelectBoneEffect_("ef800_07_flying_reactor04", reactor, ATTACH_GLOBAL);
	SetEffectScale_(efc_flash, 2.0);															//リアクターのまぶしい光3
	Wait_(10);
	DeleteEffectEmitter_(efc_flash);		
	
	SetMotion_(shitai02, MOT_LIFE_SPECIAL_1, BLEND_N);											//這い出る死体C
	SetVisible(shitai02, true);																	//表示される死体C
	efc_shitai02 = SetSelectBoneEffect_("ef726_02_nat_zombie", shitai02, ATTACH_GLOBAL);		//土エフェクト
	
	WaitMotion(shitai02);
	SetMotion_(shitai02, MOT_WAIT, BLEND_M);													//死体C待機
	
	Wait_(5);
	
	EndDemo(FADE_COLOR_BLACK);
}
