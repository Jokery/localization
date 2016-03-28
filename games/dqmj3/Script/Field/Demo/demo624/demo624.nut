//=============================================
//
//		demo624[テイクオフの前に]
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
	local efc_player;

// ▼リソース読込
	// キャラクター
	local player = GetPlayerId_();									// 主人公
	local model_rena = ReadNpc_("n007");							// レナーテ

// ▼配置
	// 主人公
	SetPointPos_(player, "player000");
	local rena = ArrangePointNpc_(model_rena, "npc_rena000");
	
//	レナーテ
	local rena_walk = ReadMotion_(rena, "n007_walk01_L");			// うつむき
	local rena_look_down = ReadMotion_(rena, "n007_look_down_L");	
	local rena_talk = ReadMotion_(rena, "n007_talk01");
	local rena_talk_L = ReadMotion_(rena, "n007_talk01_L");
	local rena_ue = ReadMotion_(rena, "n007_look_up_L");

// ▼カメラ設定
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------
	SetMotion_(rena, rena_walk, BLEND_N);							// レナーテ歩く
	local task_rena_step = Task_ChangeStepSe(rena, "SE_FLD_015", 12);
	task_rena = Task_MoveForward_(rena, 0.8, false);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット１
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	StartDemo(FADE_COLOR_BLACK);
	
	DeleteTaskStepSe(rena, task_rena_step);
	DeleteTask_(task_rena);
	SetMotion_(rena, rena_look_down, BLEND_L);						// レナーテうつむき待機
	WaitTask(task_rena);
	
	//===============================================
	// ■レナーテ
	// 「……<name_player/>。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_624_MSG_010");
	KeyInputWait_();
	
	//-----------------------------------------------
	// ▽
	// 「私に……ガルビルスを倒す　チカラはない。
	//-----------------------------------------------
	ShowMsg_("DEMO_624_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	task_rena = Task_WalkAroundToPos(rena, GetPos_(player), 5.7);
	local task_rena_step = Task_ChangeStepSe(rena, "SE_FLD_015", 12);
	WaitTask(task_rena);
	
	DeleteTaskStepSe(rena, task_rena_step);
	SetMotion_(rena, MOT_WAIT, BLEND_L);
	Wait_(20);
	
	SetMotion_(rena, rena_talk, BLEND_XL);
	WaitMotion(rena);
	SetMotion_(rena, rena_talk_L, BLEND_M);	
	Wait_(25);
	
	//===============================================
	// ■レナーテ
	// 「……本当に　感謝してる。いちばん危険で
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_624_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	WaitTask(task_cam);
	SetPointPos_(rena, "npc_rena001");
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット２
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	
	//===============================================
	// ■レナーテ
	// 「……この先　何があっても　あなたは
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_624_MSG_040");
	KeyInputWait_();
	
	SetMotion_(rena, rena_ue, BLEND_XL);							// レナーテ上向き
	
	//-----------------------------------------------
	// ▽
	// 「静寂の草原に　行きましょう……。
	//-----------------------------------------------
	ShowMsg_("DEMO_624_MSG_050");
	KeyInputWait_();
	
	SetMotion_(rena, MOT_TALKLOOP, BLEND_XL);						// レナーテ通常会話
	
	//-----------------------------------------------
	// ▽
	// 「あそこなら……フライトシグナルで
	//-----------------------------------------------
	ShowMsg_("DEMO_624_MSG_060");
	KeyInputWait_();
	
	//-----------------------------------------------
	// ▽
	// 「大空ライドで　コアの上空を目指すの……。
	//-----------------------------------------------
	ShowMsg_("DEMO_624_MSG_070");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	WaitTask(task_cam);
	
	EndDemo(FADE_COLOR_BLACK);
}
