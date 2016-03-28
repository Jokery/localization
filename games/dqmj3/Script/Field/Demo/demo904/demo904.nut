//=============================================
//
//		demo904[過去回想：レナーテとマザーをみる]
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
	local task_cam, task_player, task_boy, task_rena;
	local efc_player;

// ▼リソース読込
	// キャラクター
	local player = GetPlayerId_();					// 主人公
	local model_rena = ReadNpc_("n007");					// レナーテ
	local model_boy = ReadNpc_("n010");					// 少年	

	// ギミック
	local model_window = ReadGimmick_("o_A00_04");		// センタービルの窓
	
// ▼配置
	// 主人公
	SetPointPos_(player, "player000");
	local rena = ArrangePointNpc_(model_rena, "rena000");	//レナーテ配置
	local boy = ArrangePointNpc_(model_boy, "boy000");	//少年配置	

	
	local window = ArrangePointGimmick_("o_A00_04", model_window, "obj_000");	
	SetMotion_(window, MOT_GIMMICK_0, BLEND_N);

// ▼非常駐モーション読込
	local n007_kako02 = ReadMotion_(rena, "n007_kako02");						// レナーテ過去回想用（見上げる）	
	local n010_kako02 = ReadMotion_(boy, "n010_kako02");						// 少年過去回想用（見上げる）


// ▼カメラ設定
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	ReadWaitingLod("cameye000", "camtgt000");	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット１
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetMotion_(rena, n007_kako02, BLEND_L);
	SetMotion_(boy, n010_kako02, BLEND_L);
	
//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

		
	StartDemo(FADE_COLOR_BLACK);
	
	Wait_(300);
	
	EndDemo(FADE_COLOR_BLACK);
}
