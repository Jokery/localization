//=============================================
//
//		demo533[移動装置使用_6(火山)]
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
	local task_cam, task_player;
	local efc_player, efc_monolith, efc_transfer00, efc_player, efc_transfer01, efc_transfer;

	local player_on1 = [1, 0.9, 0.8,0.7, 0.6,0.5, 0.4, 0.3, 0.2, 0.1, 0];
	local player_on2 = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1];
	
// ▼リソース読込
	// キャラクター
	local player = GetPlayerId_();						// 主人公
	
	LoadEffect_("ef732_02_tec_device_travel02");		// 移動装置、土台
	LoadEffect_("ef732_03_tec_device_travel03");		// 移動装置、射出
	LoadEffect_("ef732_04_tec_device_travel04");		// 移動装置、起動(火山用)

	// ギミック 読み込み
	local  model_transfer = ReadGimmick_("o_dem_24");	// 発射台のリフト(上待機)

// ▼配置
	local transfer = ArrangePointGimmick_("o_dem_00", model_transfer, "obj_transfer000");		// 発射台のリフト(上待機)

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------
//cut01
	SetMotion_(transfer, MOT_GIMMICK_2, BLEND_N);							// 発射台のリフト(上待機)
	SetMotion_(player, MOT_WALK, BLEND_L);
	
// ▼カメラ設定
	local task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	WaitLod_();
	local task_player = Task_AnimeMoveNoFit_(player, "anmplayer000");		// 主人公 歩きアニメ

	StartDemo(FADE_COLOR_BLACK);
	
	Wait_(70);
	
	SetMotion_(player, MOT_WAIT, BLEND_L);
	Wait_(30);
	PlaySE_("SE_DEM_023");													//移動装置の床が光る
	
	efc_transfer01 = SetPointWorldEffect_("ef732_02_tec_device_travel02", "efc_transfer000");

	WaitTask(task_player);
	WaitTask(task_cam);
	Wait_(60);
	DeleteTask_(task_player);
	DeleteTask_(task_cam);

//cut02
	SetMotion_(player, MOT_JUMP_UP, BLEND_XL);
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	
	task_player = Task_AnimeMoveNoFit_(player, "anm_player001");
	PlaySE_("SE_DEM_108");
	efc_player = SetSelectBoneEffect_("ef732_03_tec_device_travel03", player, ATTACH_GLOBAL);
	Wait_(50);
	efc_transfer = SetPointWorldEffect_("ef732_04_tec_device_travel04", "efc_transfer000");
	
	Wait_(40);

	SetAlpha_(player, 0);													// 主人公α値
	DeleteEffectEmitter_(efc_player);
	
	Wait_(30);
	EndDemo(FADE_COLOR_BLACK);
}
