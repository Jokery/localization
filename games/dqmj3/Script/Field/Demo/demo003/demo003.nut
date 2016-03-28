//=============================================
//
//		demo003[オープニングデモ_6(崩落)）]
//
//=============================================

//-------------------------------------------------------------------------
//
//		読み込み・配置
//
//-------------------------------------------------------------------------
function Update()
{
	SetTime_(15120);		// 夜
	ChangeColorTone_(0.0, 0.0, 0.0, 0);
	
// ▼変数定義
	local task_cam, task_reactor;
	local efc_ractor00, efc_ractor01, efc_ractor02;
	local size_reactor = SCALE.REACTOR;

// ▼リソース読込
	// ギミック
	local model_reactor = ReadGimmick_("o_dem_11");						// リアクター
	local model_shelter = ReadGimmick_("o_A00_03");	//シェルター
	local model_door = ReadGimmick_("o_A00_01");	//扉
	local model_window = ReadGimmick_("o_A00_04");	//センタービルの窓ギミック
	// エフェクト
	LoadEffect_("ef800_04_flying_reactor01");							// リアクターの軌跡
	LoadEffect_("ef800_06_flying_reactor03");							// リアクター加速
	LoadEffect_("ef800_07_flying_reactor04");							// リアクターのまぶしい光
	// レイアウト
	LoadLayout_("op_credit");

// ▼配置
	local shelter000 = ArrangePointGimmick_("o_A00_03", model_shelter, "obj_shelter000");
	local shelter001 = ArrangePointGimmick_("o_A00_03", model_shelter, "obj_shelter001");
	local shelter002 = ArrangePointGimmick_("o_A00_03", model_shelter, "obj_shelter002");
	local door000 = ArrangePointGimmick_("o_A00_01", model_door, "obj_door000");
	local door001 = ArrangePointGimmick_("o_A00_01", model_door, "obj_door001");
	local window = ArrangePointGimmick_("o_A00_04", model_window, "obj_window000");
	// リアクター
	local reactor = ArrangeGimmick_("o_dem_11", model_reactor, false);
	SetScaleSilhouette(reactor, SCALE.REACTOR, SILHOUETTE_WIDTH.REACTOR);
	efc_ractor00 = SetSelectBoneEffect_("ef800_04_flying_reactor01", reactor, ATTACH_GLOBAL);
	SetEffectScale_(efc_ractor00, size_reactor);
	task_reactor = Task_AnimeMoveNoFit_(reactor, "anm_reactor000");		// 300F

// ▼カメラ設定
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");			// 300F

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	efc_ractor01 = SetSelectBoneEffect_("ef800_06_flying_reactor03", reactor, ATTACH_GLOBAL);
	SetEffectScale_(efc_ractor01, size_reactor);
	
	//=========Waitの合計が計280フレームになるよう調整============
	Wait_(80);		// 80F
	
	SetLayoutAnime_("koichi_sugiyama", false);		// 「すぎやまこういち」
	
	Wait_(50);		// 130F
	
	//まぶしい光その１
	efc_ractor02 = SetSelectBoneEffect_("ef800_07_flying_reactor04", reactor, ATTACH_GLOBAL);
	SetEffectScale_(efc_ractor02, size_reactor);
	Wait_(10);		// 140F
	
	DeleteEffectEmitter_(efc_ractor02);
	
	Wait_(50);		// 190F
	
	//まぶしい光その2
	efc_ractor02 = SetSelectBoneEffect_("ef800_07_flying_reactor04", reactor, ATTACH_GLOBAL);
	SetEffectScale_(efc_ractor02, size_reactor);
	Wait_(10);		// 200F
	DeleteEffectEmitter_(efc_ractor02);
	
	Wait_(80);		// 280F
	//=============================================================
	
	EndDemo(FADE_COLOR_BLACK);
}
