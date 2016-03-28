//=============================================
//
//		demo707[船の墓場 タイトルデモ]
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
	// ギミック
	local model_base = ReadGimmick_("o_effect_base");		// エフェクトベース
	local model_pod = ReadGimmick_("o_U00_02");				// 脱出ポッド
	local model_red_door = ReadGimmick_("o_U00_05");		// 扉:赤扉
	local model_center_door = ReadGimmick_("o_U00_06");		// 扉:外扉 中央
	local model_left_door = ReadGimmick_("o_U00_06");		// 扉:外扉 左
	local model_right_door = ReadGimmick_("o_U00_06");		// 扉:外扉 右
	local model_green_door00 = ReadGimmick_("o_U00_09");	// 扉:緑扉
	local model_green_door01 = ReadGimmick_("o_U00_10");	// 扉:緑扉
	// キャラクター

	// エフェクト

// ▼配置
	// ポッド
	local pod00 = ArrangePointGimmick_("o_U00_02", model_pod, "obj_pod000");
	local pod01 = ArrangePointGimmick_("o_U00_02", model_pod, "obj_pod001");
	local pod02 = ArrangePointGimmick_("o_U00_02", model_pod, "obj_pod002");
	
	
	local red_door = ArrangePointGimmick_("o_U00_05", model_red_door, "obj_U00_05");					//扉:赤扉
	local center_door = ArrangePointGimmick_("o_U00_06", model_center_door, "obj_center");				//扉:外扉 中央
	local left_door = ArrangePointGimmick_("o_U00_06", model_left_door, "obj_left");					//扉:外扉 左
	local right_door = ArrangePointGimmick_("o_U00_06", model_right_door, "obj_right");				//扉:外扉 右
	local green_door00 = ArrangePointGimmick_("o_U00_09", model_green_door00, "obj_U00_09");			//扉:緑扉
	local green_door01 = ArrangePointGimmick_("o_U00_10", model_green_door01, "obj_U00_10");			//扉:緑扉

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 10);
	
	while(true)
	{
		// ▼カット１＠～～～～～～～～～～～～～～～～～～～～～～
		SetFogDensity_(2.0);
		SetFogDistMax_(10000.0);
		
		task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	
		
		WaitTask(task_cam);


		DeleteTask_(task_cam);
	}
	
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 20);
	WaitFade_();
}
