//=============================================
//
//		demo618[最後のパワー_1(入口)]
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
	local task_cam, task_player, task_rena;

// ▼リソース読込
	// キャラクター
	local player = GetPlayerId_();					// 主人公
	local n_rena = ReadNpc_("n007");				// レナーテ
	local model_o_com_02 = ReadGimmick_("o_com_02");		// モノリス
	local model_door = ReadGimmick_("o_O01_02");			// 扉（ランクＳ）

// ▼配置
	// 主人公
	SetPointPos_(player, "player001");
	SetAlpha_(player, 0.0);
	
	// レナーテ
	local rena = ArrangePointNpc_(n_rena, "rena000");
	SetPointPos_(rena, "rena001");
	SetAlpha_(rena, 0.0);
	
	// モノリス
	local gmc_o_com_02 = ArrangePointGimmick_("o_com_02", model_o_com_02, "monoris");	// モノリス
	SetMotion_(gmc_o_com_02, MOT_GIMMICK_2, BLEND_N);
	
	// 扉（ランクＳ）
	local door = ArrangePointGimmick_("o_O01_02", model_door, "obj_door000");

// ▼非常駐モーション読込
	local r_n007_look_left_L	= ReadMotion_(rena, "n007_look_left_L");
	local r_n007_look_up_L	= ReadMotion_(rena, "n007_look_up_L");
	local p_Player_look_up_L	= ReadMotion_(player, "Player_look_up_L");
	
//足音
	SetStepSe_(rena, "SE_FLD_016");

// ▼カメラ設定
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	
// ▼エフェクト
	LoadEffect_("ef732_07_teleport_monolith");

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------
//cut01
	StartDemo(FADE_COLOR_BLACK);
	PlaySE_("SE_DEM_017");
	local efc_mono = SetSelectBoneEffect_("ef732_07_teleport_monolith", player, ATTACH_GLOBAL);
	local efc_mono_r = SetSelectBoneEffect_("ef732_07_teleport_monolith", rena, ATTACH_GLOBAL);
	Wait_(1);
	SetAlpha_(player, 0.1);
	SetAlpha_(rena, 0.1);
	Wait_(1);
	SetAlpha_(player, 0.2);
	SetAlpha_(rena, 0.2);
	Wait_(1);
	SetAlpha_(player, 0.3);
	SetAlpha_(rena, 0.3);
	Wait_(1);
	SetAlpha_(player, 0.4);
	SetAlpha_(rena, 0.4);
	Wait_(1);
	SetAlpha_(player, 0.5);
	SetAlpha_(rena, 0.5);
	Wait_(1);
	SetAlpha_(player, 0.6);
	SetAlpha_(rena, 0.6);
	Wait_(1);
	SetAlpha_(player, 0.7);
	SetAlpha_(rena, 0.7);
	Wait_(1);
	SetAlpha_(player, 0.8);
	SetAlpha_(rena, 0.8);
	Wait_(1);
	SetAlpha_(player, 0.9);
	SetAlpha_(rena, 0.9);
	Wait_(1);
	SetAlpha_(player, 1.0);
	SetAlpha_(rena, 1.0);
	Wait_(60);
	SetMotion_(player, MOT_WALK, BLEND_M);
	SetMotion_(rena, MOT_WALK, BLEND_M);
	task_player = Task_AnimeMove_(player, "anm_player000");
	task_rena = Task_AnimeMove_(rena, "anm_rena000");
	
	Wait_(65);
	DeleteTask_(task_player);
	DeleteTask_(task_rena);

//cut02
	task_player = Task_AnimeMove_(player, "anm_player001");
	task_rena = Task_AnimeMove_(rena, "anm_rena001");
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	WaitTask(task_player);
	DeleteTask_(task_player);
	WaitTask(task_rena);
	
	SetMotion_(rena, MOT_WAIT, BLEND_L);
	task_player = Task_WalkAroundToDir(player, 340, 5.7);
	
	SetMotion_(player, MOT_WAIT, BLEND_L);
	Wait_(8);
	
	//===============================================
	// ■テレジア
	// 「ようこそ　<name_player/>さま。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TEREZIA");
	SetMotion_(player, p_Player_look_up_L, BLEND_L);
	SetMotion_(rena, r_n007_look_up_L, BLEND_XL);
	ShowMsg_("DEMO_618_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	//===============================================
	// ■レナーテ
	// 「久しぶりね　テレジア。ここまでずっと
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_618_MSG_020");
	
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================	
	
//cut03
	
	SetVisible(player, false);
	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");
	
	//===============================================
	// ■テレジア
	// 「私は　マザー……あなたに　作られた存在です。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TEREZIA");
	ShowMsg_("DEMO_618_MSG_030");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	// ■テレジア
	// 「マザー・レナーテ。状況は　理解しています。
	//-----------------------------------------------
	ShowMsg_("DEMO_618_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
//cut04
	SetVisible(player, true);
	SetPointPos_(player, "player000");
	SetPointPos_(rena, "rena000");
	SetPointCameraEye_("cameye003");
	SetPointCameraTarget_("camtgt003");
	
	//===============================================
	// ■レナーテ
	// 「そう。<name_player/>に　最後の試験を。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_618_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	//===============================================
	// ■テレジア
	// 「星空を渡るためのチカラ　高空ライドですね。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TEREZIA");
	ShowMsg_("DEMO_618_MSG_060");
	KeyInputWait_();
	//===============================================
	
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	
	//===============================================
	// ■テレジア
	// 「<name_player/>さま　奥の扉にどうぞ。
	//-----------------------------------------------
	ShowMsg_("DEMO_618_MSG_070");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	SetMotion_(player, MOT_WAIT, BLEND_L);
	SetMotion_(rena, MOT_WAIT, BLEND_L);
	WaitTask(task_cam);
	Wait_(30);
	
	EndDemo(FADE_COLOR_BLACK);
}
