//=============================================
//
//		demo637[Ｓランクライセンス獲得_2(レティス獲得後)]
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
	local efc_player, efc_rena, efc_cam;

// ▼リソース読込
	// キャラクター
	local player = GetPlayerId_();															// 主人公
	local model_rena = ReadNpc_("n007");													// レナーテ
	// エフェクト
	LoadEffect_("ef712_10_emo_surprise01");													// 「！」

// ▼配置
	//キャラクター
	SetPointPos_(player, "player000");														// 主人公
	local rena = ArrangePointNpc_(model_rena, "npc_renerte000");							// レナーテ

// ▼非常駐モーション読込
	//主人公
	local player_look_up_L = ReadMotion_(player, "Player_look_up_L");						// 上向き待機L
	local player_sup = ReadMotion_(player, "Player_surprise");								// 驚く
	local player_sup_L = ReadMotion_(player, "Player_surprise_L");							// 驚くL
	local player_nod = ReadMotion_(player, "Player_nod");									// うなづく

	//レナーテ
	local rena_look_up_L = ReadMotion_(rena, "n007_look_up_L");								// 上向き待機L
	local rena_talk = ReadMotion_(rena, "n007_talk01");										// 会話開始（手を胸にあてる）
	local rena_talk_L = ReadMotion_(rena, "n007_talk01_L");									// 会話L（手を胸にあてる）
	local rena_look_down = ReadMotion_(rena, "n007_look_down_L");							// うつむき待機
	local rena_nod = ReadMotion_(rena, "n007_nod");											// うなづく
	
//足音
	SetStepSe_(rena, "SE_FLD_016");

// ▼カメラ設定
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");


//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット1 レナ　アップ	◆demo623の続き◆
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	SetMotion_(rena, rena_talk, BLEND_L);													// レナ話す
	WaitMotion(rena);
	SetMotion_(rena, rena_talk_L, BLEND_L);

	//===============================================
	// *レナーテ
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_637_MSG_010");	// 「アンセスは　そのレティスで　あなたを
	KeyInputWait_();
	//===============================================
	// *レナーテ
	//-----------------------------------------------
	ShowMsg_("DEMO_637_MSG_020");	// 「アンセスの思い　受け取ってあげて……。
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(rena, MOT_WAIT, BLEND_XL);													// レナ待機
	Wait_(30);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット2 主　レナ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");

	Wait_(10);

	//===============================================
	// *テレジア
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TEREZIA");	
	ShowMsg_("DEMO_637_MSG_030");	// 「大空ライドを使う際には　今まで通り
	Wait_(3);
	SetMotion_(player, player_look_up_L, BLEND_XL);											// 主　上待機
	SetMotion_(rena, rena_look_up_L, BLEND_XL);												// レナ上待機
	KeyInputWait_();
	//===============================================
	// *テレジア
	//-----------------------------------------------
	ShowMsg_("DEMO_637_MSG_040");	// 「そして　フライトシグナルを使えば
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	WaitTask(task_cam);
	Wait_(10);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット3 主　レナにズームイン
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");

	SetMotion_(player, MOT_WAIT, BLEND_XL);													// 主　待機
	SetMotion_(rena, MOT_WAIT, BLEND_XL);													// レナ待機
	Wait_(30);
	SetMotion_(rena, rena_talk, BLEND_L);													// レナ話す
	WaitMotion(rena);
	SetMotion_(rena, rena_talk_L, BLEND_L);

	//===============================================
	// *レナーテ
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_637_MSG_050");	// 「高空ライドを使えば
	KeyInputWait_();
	//===============================================
	// *レナーテ
	//-----------------------------------------------
	ShowMsg_("DEMO_637_MSG_060");	// 「……残された時間は　多くない。
	SetMotion_(rena, rena_look_down, BLEND_XL);												// レナうつむき待機
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(rena, MOT_WAIT, BLEND_XL);													// レナ待機
	WaitTask(task_cam);
	Wait_(20);

	SetMotion_(rena, MOT_WALK, BLEND_L);													// レナ歩く
	task_rena = Task_RotateToDir_(rena, 180, 5.7);	// 回転
	WaitTask(task_rena);
	task_rena = Task_MoveForward_(rena, 0.8, false);

	Wait_(50);
	DeleteTask_(task_rena);
	SetPointPos_(rena, "npc_renerte001");													// レナ移動
	task_rena = Task_MoveForward_(rena, 0.9, false);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット4 レナ　フレームアウト
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");

	Wait_(20);
	SetMotion_(player, MOT_WALK, BLEND_L);													// 主　歩く
	task_player = Task_MoveForward_(player, 0.8, false);
	Wait_(15);
	SetMotion_(rena, MOT_WAIT, BLEND_L);													// レナ停止
	Wait_(23);

	//===============================================
	// *テレジア
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TEREZIA");	
	ShowMsg_("DEMO_637_MSG_070");	// 「……<name_player/>さま。
	Wait_(12);
	DeleteTask_(task_rena);
	SetMotion_(player, player_sup, BLEND_L);												// 主　驚く
	DeleteTask_(task_player);
	WaitMotion(player);
	local pos = Vec3(1, 0.8, 0);
	efc_player = SurpriseDispSetOffset(player, pos, 0.6);									// [!]
	SetMotion_(player, player_sup_L, BLEND_L);												// 主　驚く
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(player, player_look_up_L, BLEND_XL);											// 主　上待機
	Wait_(50);

	//===============================================
	// *テレジア
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TEREZIA");	
	ShowMsg_("DEMO_637_MSG_080");	// 「マザー・レナーテのこと……
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット5 主　ズームイン
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");

	SetMotion_(player, MOT_WAIT, BLEND_XL);										// 主　待機
	WaitTask(task_cam);
	SetMotion_(player, player_nod, BLEND_XL);									// 主　うなづく
	WaitMotion(player);
	SetMotion_(player, MOT_WAIT, BLEND_N);										// 主　待機
	Wait_(30);
	SetMotion_(player, MOT_WALK, BLEND_L);										// 主　歩く
	task_player = Task_MoveForward_(player, 0.8, false);
	Wait_(20);

	EndDemo(FADE_COLOR_BLACK);
}
