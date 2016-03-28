//=============================================
//
//		demo221[移動装置使用_3(霊道)]
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
	local efc_player, efc_transfer00, efc_transfer01;

// ▼リソース読込
	// ギミック
	local model_transfer = ReadGimmick_("o_dem_00");	// 転送装置
	// キャラクター
	local player = GetPlayerId_();						// 主人公
	// エフェクト
	LoadEffect_("ef732_01_tec_device_travel01");		// 移動装置、起動
	LoadEffect_("ef732_02_tec_device_travel02");		// 移動装置、土台
	LoadEffect_("ef732_03_tec_device_travel03");		// 移動装置、射出

// ▼配置
	// 転送装置
	local transfer = ArrangePointGimmick_("o_dem_00", model_transfer, "obj_transfer000");
	
	// 主人公
	SetPointPos_(player, "player000");
	
// ▼時間設定
	SetTime_(START_TIME_ZONE_NIGHT);

// ▼カメラ設定
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	Wait_(30);
	
	PlaySE_("SE_DEM_022");		//移動装置起動SE
	SetMotion_(transfer, MOT_GIMMICK_1, BLEND_M);
	Wait_(190);
	SetMotion_(transfer, MOT_GIMMICK_2, BLEND_M);
	Wait_(5);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット2
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	
	Wait_(5);
	
	SetMotion_(player, MOT_JUMP_UP, BLEND_XL);
	task_player = Task_AnimeMoveNoFit_(player, "anm_player001");
	efc_transfer00 = SetPointWorldEffect_("ef732_02_tec_device_travel02", "obj_transfer000");
	PlaySE_("SE_DEM_023");							//■SE：床が光る
	Wait_(30);
	DeleteTask_(task_player);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット3
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	
	PlaySE_("SE_DEM_024");	
	task_player = Task_AnimeMoveNoFit_(player, "anm_player000");
	efc_player = SetSelectBoneEffect_("ef732_03_tec_device_travel03", player, ATTACH_GLOBAL);
	Wait_(15);
	
	SetMotion_(player, MOT_SPECIAL_WAIT, BLEND_L);
	Wait_(25);
	
	efc_transfer01 = SetPointWorldEffect_("ef732_01_tec_device_travel01", "obj_transfer000");
	Wait_(15);
	
	SetMotion_(player, MOT_SPECIAL_RUN, BLEND_L);
	Wait_(40);
	
	EndDemo(FADE_COLOR_BLACK);
}
