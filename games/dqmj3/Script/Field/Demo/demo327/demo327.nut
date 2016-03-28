//=============================================
//
//		demo327[世界移動が可能に]
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
	local efc_player;

// ▼リソース読込
	// キャラクター
	local player = GetPlayerId_();					// 主人公

// ▼配置
	// 主人公
	SetPointPos_(player, "player000");
	
// ▼ギミック設置
	local obj_PC = ReadGimmick_("o_I02_18");					// ノートPC
	local PC = ArrangePointGimmick_("o_I02_18", obj_PC, "obj_pc000");

// ▼非常駐モーション読込
	
// ▼カメラ設定
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");			
//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	Wait_(90);
	
	StartEarthQuake_(60, 3, 0.15)
	PlayLoopSE_("SE_DEM_013");
	Wait_(30);
	StopLoopSE_(30);
	//...........................................................................
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);					// フェードアウト
	WaitFade_();
	Wait_(10);
	LoadLayout_("w_map");										// レイアウト読み込み
	SetLayoutAnime_("move_03", false);
	Wait_(30);
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);					// フェードイン
	//...........................................................................
	Wait_(50);
	PlaySE_("SE_DEM_180");
	Wait_(100);
	PlaySE_("SE_DEM_178");
	Wait_(155);
//	WaitLayoutAnime();
	EndDemo(FADE_COLOR_BLACK);
}
