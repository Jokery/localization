//=============================================
//
//		demo701[タイトルデモ（崩落）]
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
	/* なし */
	
	//ギミック
	local model_biru = ReadGimmick_("o_A00_04");									//センタービル
	local model_door = ReadGimmick_("o_A00_01");									//扉（閉じる）
	local model_ruler = ReadGimmick_("o_com_08");									//ルーラポイント
	local model_stel = ReadGimmick_("o_com_07");									//特技石碑

// ▼配置
	/* なし */
	
	local biru = ArrangePointGimmick_("o_A00_04", model_biru, "obj_biru000");		//センタービル(点灯)
	local door = ArrangePointGimmick_("o_A00_01", model_door, "obj_door000");		//扉
	local ruler = ArrangePointGimmick_("o_com_08", model_ruler, "obj_ruler000");	//ルーラポイント
	local stel = ArrangePointGimmick_("o_com_07", model_stel, "obj_stele000");		//特技石碑

	SetMotion_(biru, MOT_GIMMICK_1, BLEND_N);										//センタービル(点灯)
	SetMotion_(door, MOT_GIMMICK_0, BLEND_N);										//扉（閉じる）

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 10);
	
	while(true)
	{

		// ▼カット１＠～～～～～～～～～～～～～～～～～～～～～～
		SetTime_(START_TIME_ZONE_NOON);		
		SetFogDensity_(2.0);
		SetFogDistMax_(10000.0);
		task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");

		
		WaitTask(task_cam);

		

		DeleteTask_(task_cam);

	}
	
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 20);
	WaitFade_();
}
