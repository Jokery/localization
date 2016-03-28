//=============================================
//
//		demo119[動く大地_3(霊道移動)]
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
	SetFogDensity_(3.0);
	SetFogDistMax_(10000.0);

// ▼変数定義
	local task_cam, task_player;
	local efc_player, efc_transfer;

// ▼リソース読込
	local player = GetPlayerId_();						// 主人公
	// ギミック
	local model_transfer = ReadGimmick_("o_dem_00");	// 転送装置
	// エフェクト
	LoadEffect_("ef732_02_tec_device_travel02");		// 移動装置　起動

// ▼配置
	// 転送装置
	local transfer = ArrangePointGimmick_("o_dem_00", model_transfer, "obj_transfer000");

// ▼カメラ設定
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");

	SetMotion_(transfer, MOT_GIMMICK_0, BLEND_N);		// 転送装置　待機
	SetAlpha_(player, ALPHA_CLEAR);						// 主人公　非表示



//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);

	Wait_(180);
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 20);			//フェードアウト
	WaitFade_();
	DeleteTask_(task_cam);

	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 10);			//フェードイン

	Wait_(120);
	DeleteTask_(task_cam);
	PlaySE_("SE_DEM_023");
	efc_transfer = SetPointWorldEffect_("ef732_02_tec_device_travel02", "obj_transfer000");
	Wait_(100);

	EndDemo(FADE_COLOR_BLACK);
}
