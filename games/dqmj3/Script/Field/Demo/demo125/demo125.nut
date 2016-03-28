//=============================================
//
//		demo125[カードキーAを探せ_2(入手後)]
//
//=============================================
function Update()
{

// ▼変数定義
	local task_cam, task_player;
	local rotate_pos = Vec3( -294.9, 0, -100.9);

// ▼リソース読込
	local player = GetPlayerId_();
	local model_door = ReadGimmick_("o_A03_00");

// ▼配置
	SetPointPos_(player, "player000");
	local door = ArrangePointGimmick_("o_A03_00", model_door, "obj_door000");

// ▼初期のモーション
	SetMotion_(player, MOT_WAIT, BLEND_N);
	SetMotion_(door, MOT_GIMMICK_0, BLEND_N);		// 電子ドア(閉じた状態)

// ▼カメラ設定
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");


//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);

	SetMotion_(door, MOT_GIMMICK_1, BLEND_N);		// 電子ドア(開く)
	PlaySE_("SE_DEM_041");
	Wait_(45);

	SetMotion_(door, MOT_GIMMICK_2, BLEND_N);		// 電子ドア(開いた状態)
	Wait_(30);

	EndDemo(FADE_COLOR_BLACK);
}
