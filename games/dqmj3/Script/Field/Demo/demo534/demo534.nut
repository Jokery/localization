//=============================================
//
//		demo534[移動装置を打ち上げろ_3(コア)]
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
	local task_cam, task_rocket, task_efc;
	local efc_cam, efc_rocket, efc_smoke, efc_rocket_light;

// ▼リソース読込
	// キャラクター
	local player = GetPlayerId_();					// 主人公
	// ギミック
	local model_rocket = ReadGimmick_("o_V00_04");	// 大きな杭
	local model_core = ReadGimmick_("o_dem_19");	// コア
	// エフェクト
	LoadEffect_("ef853_03_launch03");				// 飛行中エンジンから出る煙
	LoadEffect_("ef853_04_launch04");				// 着弾した際の破片等
	LoadEffect_("ef733_01_sym_shuchusen01");				// 集中線
	LoadEffect_("ef853_05_launch05");				// ビーコン

	local baseResId = ReadGimmick_("o_effect_base");
	local baseObj = ArrangePointGimmick_("o_effect_base", baseResId, "efc_rocket000");
	SetPointPosNoFit_(baseObj, "efc_rocket000");

// ▼配置
	// 主人公
	SetPointPos_(player, "player000");
	SetActive_(player, false);
	
	// 大きな杭
	local rocket = ArrangePointGimmick_("o_V00_04", model_rocket, "obj_rocket000");
	SetPointPosNoFit_(rocket, "obj_rocket000");
	SetScaleSilhouette(rocket, 0.4, 0.6);
	// コア
	local core = ArrangePointGimmick_("o_dem_19", model_core, "obj_core000");
	SetPointPosNoFit_(core, "obj_core000");
	SetScaleSilhouette(core, 0.5, 0.7);

// ▼カメラ設定
	ReadWaitingLod("cameye000", "camtgt000");
	
	efc_rocket_light = SetSelectBoneEffectSetOffset_("ef853_05_launch05", baseObj, ATTACH_GLOBAL, Vec3(0.0, 0.0, 0.0));	//ビーコン
	SetEffectScale_(efc_rocket_light, 0.4);
	efc_rocket = SetSelectBoneEffect_("ef853_03_launch03", baseObj, ATTACH_GLOBAL);
	Wait_(30);
	
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");		// 125F
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", CAMERA_DEF);

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	task_rocket = Task_AnimeMoveNoDir_(rocket, "anm_rocket000");	// 150F
	SetMotion_(rocket, MOT_GIMMICK_1, BLEND_N);

	SetEffectScale_(efc_rocket, 0.4);
	task_efc = Task_AnimeMoveNoDir_(baseObj, "anm_efc000");			// 150F
	
//	PlayLoopSE_("SE_DEM_013");
	PlaySE_("SE_DEM_141");											//■SE:火山・弾頭ロケットがラスダンへ刺さる
	StartDemo(FADE_COLOR_BLACK);
	
	WaitTask(task_cam);
	
	DeleteEffect_(efc_cam);
	
	StopLoopSE_(50);
	DeleteEffect_(efc_rocket_light);
		
	StartDecayEarthQuake_(92, 4, 10)
	
//	PlaySE_("SE_SKL_011");
	
	SetMotion_(rocket, MOT_GIMMICK_2, BLEND_N);	
	
	efc_smoke = SetPointWorldEffect_("ef853_04_launch04", "efc_smoke000");
	SetEffectScale_(efc_smoke, 0.4);
	
	WaitTask(task_rocket);
	WaitTask(task_efc);

	DeleteEffectEmitter_(efc_rocket);	
	Wait_(105);
	
	EndDemo(FADE_COLOR_BLACK);
}
