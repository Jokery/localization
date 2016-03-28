//=============================================
//
//		demo400[黒鉄の監獄塔・全景]
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

// ▼リソース読込
	// キャラクター
	local player = GetPlayerId_();
	// ギミック
	local model_trans = ReadGimmick_("o_com_01");	// 転送装置

// ▼配置
	// 主人公
	SetPointPos_(player, "player000");
	SetActive_(player, false);
	// 転送装置（凍骨の氷原）
	local trans = ArrangePointGimmick_("o_com_01", model_trans, "obj_trans000");
	
// ▼天候
	SetWeather_(WEATHER.BAD);						// 悪天候に設定します
	
// ▼カメラ設定
	local density = GetFogDensity_();
	SetFogDensity_(5.0);
	local distmax = GetFogDistMax_();
	SetFogDistMax_(10000.0);
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");	// 120F

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	WaitTask(task_cam);
	
	Wait_(15);
	
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 20);
	WaitFade_();
//	SetFogDensity_(density);
//	SetFogDistMax_(distmax);
	Wait_(45);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット2
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");	// 350F
	
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);
	WaitFade_();
	
	WaitTask(task_cam);
	
	Wait_(15);
	
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 20);
	WaitFade_();
	
	Wait_(40);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット3
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");	// 120F
	
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 25);
	WaitFade_();
	
	Wait_(100);
	
//	EndDemo(FADE_COLOR_BLACK);
	EndDemoBgmFade_(FADE_DEF);
	
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
	SetFogDensity_(density);
	SetFogDistMax_(distmax);
	DeleteAllTask_();
	SetSepiaColor_(false);
	End_();
}
