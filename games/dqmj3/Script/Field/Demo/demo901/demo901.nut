//=============================================
//
//		demo901[過去回想：ルキヤ死亡]
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
	local task_cam, task_player, task_rukiya, task_aroma;
	local efc_player;

// ▼リソース読込
	// キャラクター
	local player = GetPlayerId_();					// 主人公
	local model_rukiya = ReadNpc_("n009");					// ルキヤ	
	local model_aroma = ReadNpc_("n018");					// アロマ
	
// ▼配置
	// 主人公
	SetPointPos_(player, "player000");
	local rukiya = ArrangePointNpc_(model_rukiya, "rukiya000");	//ルキヤ配置
	local aroma = ArrangePointNpc_(model_aroma, "rukiya000");	//アロマ配置
	
	//ギミック
//	local model_red_door = ReadGimmick_("o_U00_05");		// 扉:赤扉
//	local model_center_door = ReadGimmick_("o_U00_06");		// 扉:外扉 中央
//	local model_left_door = ReadGimmick_("o_U00_06");		// 扉:外扉 左
//	local model_right_door = ReadGimmick_("o_U00_06");		// 扉:外扉 右
//	local model_green_door00 = ReadGimmick_("o_U00_09");	// 扉:緑扉
//	local model_green_door01 = ReadGimmick_("o_U00_10");	// 扉:緑扉
	
//	local red_door = ArrangePointGimmick_("o_U00_05", model_red_door, "obj_door000");					//扉:赤扉
//	local center_door = ArrangePointGimmick_("o_U00_06", model_center_door, "obj_door000");				//扉:外扉 中央
//	local left_door = ArrangePointGimmick_("o_U00_06", model_left_door, "obj_door000");					//扉:外扉 左
//	local right_door = ArrangePointGimmick_("o_U00_06", model_right_door, "obj_door000");				//扉:外扉 右
//	local green_door00 = ArrangePointGimmick_("o_U00_09", model_green_door00, "obj_door000");			//扉:緑扉
//	local green_door01 = ArrangePointGimmick_("o_U00_10", model_green_door01, "obj_door000");			//扉:緑扉
	

// ▼非常駐モーション読込
	local n009_kako01 = ReadMotion_(rukiya, "n009_kako01");						// ルキヤ過去回想用（死亡）	
	local n018_kako01 = ReadMotion_(aroma, "n018_kako01");						// アロマ過去回想用（看取る）

// ▼カメラ設定
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット１
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetMotion_(rukiya, n009_kako01, BLEND_L);
	SetMotion_(aroma, n018_kako01, BLEND_L);
	SetFace_(rukiya, "Face_loop_close");
	
//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------
//	SetFace_(rukiya, "Face_loop_close");
		
	StartDemo(FADE_COLOR_BLACK);
	
	Wait_(300);
	
	EndDemo(FADE_COLOR_BLACK);
}
