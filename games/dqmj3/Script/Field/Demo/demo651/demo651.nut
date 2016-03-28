//=============================================
//
//		demo651[ガルマザード再戦]
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
	local task_cam;
	local efc_cam, efc_gal;

// ▼リソース読込
	// キャラクター
	local player = GetPlayerId_();					// 主人公
	local model_gal = ReadNpc_("m185_00");			// ガルマザード
	// ギミック
	local model_sky = ReadGimmick_("o_dem_25");		// 空
	// エフェクト
	LoadEffect_("ef733_04_sym_pollen_mist");
	LoadEffect_("ef733_01_sym_shuchusen01");
	LoadEffect_("ef730_01_oth_dark_aura01");
	LoadEffect_("ef864_07_galmotherd02");
	LoadEffect_("ef864_08_galmotherd03");

// ▼配置
	// 主人公
	SetPointPos_(player, "player000");
	SetVisible(player, false);
	
	// ガルマザード
	local gal = ArrangePointNpc_(model_gal, "npc_gal000");
	SetScaleSilhouette(gal, 6, 1);
	
	// 空
	local sky = ArrangePointGimmick_("o_dem_25", model_sky, "sky000");
	SetScale_(sky, 0.2);
	
	// エフェクト
	efc_cam = SetCameraEffect_("ef733_04_sym_pollen_mist", CAMERA_DEF);
	efc_gal = SetSelectBoneEffect_("ef730_01_oth_dark_aura01", gal, ATTACH_EFFECT2);
	SetEffectScale_(efc_gal, 0.8);

// ▼モーション設定
	SetMotion_(gal, MOT_SPELL_CHARGE, BLEND_N);

// ▼カメラ設定
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	ChangeColorTone_(-0.2, -0.3, -0.2,1);

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	ChangeColorTone_(0,0,0,30);
	DeleteEffectEmitter_(efc_cam);
	
	PlaySE_("SE_DEM_186");
	SetMotion_(gal, MOT_SPELL_ACTUATE, BLEND_XL);
	StopBgm_(BGM_STOP_DEF);
	Wait_(20);
	
	EncountEndDemo(ENCOUNT_BOSS);
}
