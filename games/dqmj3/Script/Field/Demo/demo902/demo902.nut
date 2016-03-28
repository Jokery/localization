//=============================================
//
//		demo902[過去回想：アロマ、エイリアス装置前]
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
	local task_cam, task_player, task_aroma;
	local efc_player;

// ▼リソース読込
	// キャラクター
	local player = GetPlayerId_();					// 主人公
	local model_aroma = ReadNpc_("n018");					// アロマ
	
// ▼配置
	// 主人公
	SetPointPos_(player, "player000");
	local aroma = ArrangePointNpc_(model_aroma, "aroma000");	//アロマ配置
// ▼非常駐モーション読込
	local n018_kako01 = ReadMotion_(aroma, "n018_kako02");						// アロマ過去回想用（看取る）

// ▼カメラ設定
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット１
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	SetMotion_(aroma, n018_kako01, BLEND_L);
	
//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

		
	StartDemo(FADE_COLOR_BLACK);
	
	Wait_(300);
	
	EndDemo(FADE_COLOR_BLACK);
}
