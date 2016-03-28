//=============================================
//
//		demo118[動く大地_2(崩落移動)]
//
//=============================================

//-------------------------------------------------------------------------
//
//		読み込み・配置
//
//-------------------------------------------------------------------------
function Update()
{

	SetTime_(8700);		// 夜

// ▼変数定義
	local task_cam;
	local efc_cloud, efc_transfer;

// ▼リソース読込
	// ギミック
	local model_transfer = ReadGimmick_("o_dem_00");	// 転送装置
	local model_map = ReadGimmick_("o_dem_06");			// 崩落都市（小）
	local model_window = ReadGimmick_("o_A00_04");		// センタービルの窓
	// エフェクト
	LoadEffect_("ef732_02_tec_device_travel02");		// 移動装置、土台
	LoadEffect_("ef811_03_move_city01");				// 雲
	LoadEffect_("ef811_04_move_city02");				// 大地パラパラ

// ▼配置
	// 転送装置
	local transfer00 = ArrangePointGimmick_("o_dem_00", model_transfer, "obj_transfer000");
	local transfer01 = ArrangePointGimmick_("o_dem_00", model_transfer, "obj_transfer001");
	// 崩落都市（小）
	local res_map = ArrangePointGimmick_("o_dem_06", model_map, "obj_map000");
	// センタービルの窓
	local window = ArrangePointGimmick_("o_A00_04", model_window, "obj_window000");
	SetMotion_(window, MOT_GIMMICK_1, BLEND_N);

// ▼カメラ設定
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット1　地震発生
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	
	Wait_(10);
//	PlayLoopSE_("SE_DEM_013");
	StartEarthQuake_(10, 3, 2);
	Wait_(10);
	StartEarthQuake_(10, 4, 3);
	Wait_(10);
	StartEarthQuake_(20, 4, 3);
	Wait_(20);
	StartEarthQuake_(20, 5, 5);
	Wait_(20);
	StartEarthQuake_(50, 5, 6);
	Wait_(50);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット2　大地のアップ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");
	
	//大地パラパラ
	StartEarthQuake_(30, 5, 5);
	uSetMultiEffect(30);
	
	StartEarthQuake_(60, 4, 6);
	uSetMultiEffect(60);
	
	StartEarthQuake_(60, 4, 7);
	uSetMultiEffect(60);
	
	StartEarthQuake_(60, 5, 8);
	uSetMultiEffect(60);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット3　大陸全体が動く描写
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	efc_cloud = SetPointWorldEffect_("ef811_03_move_city01", "efc_cloud000");		// 雲
	
	StartEarthQuake_(60, 4, 4);
	Wait_(60);
	
	StartEarthQuake_(40, 4, 3);
	Wait_(40);
	
	StartEarthQuake_(60, 4, 3);
	Wait_(50);
	StopBgm_(BGM_STOP_DEF);
	Wait_(10);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット4　転送装置起動
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");

	StartEarthQuake_(10, 3, 2);
	Wait_(10);
//	StopLoopSE_(10);	
	StartEarthQuake_(10, 4, 1);
	Wait_(40);
	
	efc_transfer = SetPointWorldEffect_("ef732_02_tec_device_travel02", "obj_transfer000");
	PlaySE_("SE_DEM_023");
	Wait_(100);
	
	EndDemo(FADE_COLOR_BLACK);
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		複数のエフェクト配置
//------------------------------------------------
//	引数	: wait	待ち時間
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uSetMultiEffect(wait)
{
	SetPointWorldEffect_("ef811_04_move_city02", "efc_rock000");
	SetPointWorldEffect_("ef811_04_move_city02", "efc_rock001");
	SetPointWorldEffect_("ef811_04_move_city02", "efc_rock002");
	SetPointWorldEffect_("ef811_04_move_city02", "efc_rock003");
	SetPointWorldEffect_("ef811_04_move_city02", "efc_rock004");
	SetPointWorldEffect_("ef811_04_move_city02", "efc_rock005");
}
