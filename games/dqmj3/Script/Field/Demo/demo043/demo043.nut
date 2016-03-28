//=============================================
//
//		demo043[ふしぎな石碑]
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
	local efc_player;
	local task_cam, task_player;

// ▼モデル読込
	// ギミック
	local model_stele = ReadGimmick_("o_com_07");	// 特技石碑
	// キャラクター
	local player = GetPlayerId_();					// 主人公
	// エフェクト
	LoadEffect_("ef712_10_emo_surprise01");			// 「！」
	LoadEffect_("ef732_09_light_reactor_c");		// リアクターの光
	
// ▼配置
	// 特技石碑
	local stele = ArrangePointGimmick_("o_com_07", model_stele, "obj_stele000");
	SetMotion_(stele, MOT_GIMMICK_0, BLEND_N);
	
	// 主人公
	SetPointPos_(player, "player000");
	SetFace_(player, "Face_eyes_close");

// ▼非常駐モーション読込
	// 主人公
	local reactor = ReadMotion_(player, "Player_touch_reactor");		// 顔を少し左向ける→リアクターを触る
	local reactor_L = ReadMotion_(player, "Player_touch_reactor_L");	// リアクターを触るL

// ▼カメラ設定
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

// ▼初期モーション設定
	SetMotion_(player, MOT_WALK, BLEND_N);
	task_player = Task_MoveForward_(player, 1.0, false);

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	// ▼カット１＠道を歩いている～～～～～～～～～～～～～～～
	Wait_(15);
	
	efc_player = SetBoneEffect_("ef732_09_light_reactor_c", player);
	PlaySE_("SE_FLD_135");		// リアクター反応音
	Wait_(15);
	
	SetMotion_(player, MOT_WAIT, BLEND_M);
	DeleteTask_(task_player);
	
	SurpriseDisp(player);
	Wait_(5);
	SetMotion_(player, reactor, BLEND_M);
	WaitMotion(player);
	SetMotion_(player, reactor_L, BLEND_M);
	Wait_(30);
	
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 10);
	WaitFade_();
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 10);
	
	// ▼カット２＠石碑ズームイン～～～～～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");		// 90F
	WaitTask(task_cam);
	
	EndDemo(FADE_COLOR_BLACK);
}
