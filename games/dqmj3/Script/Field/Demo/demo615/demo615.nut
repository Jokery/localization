//=============================================
//
//		demo615[レナーテの告白_1(残骸)]
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
	local player = GetPlayerId_();											// 主人公
	local model_rena = ReadNpc_("n007");									// レナーテ

	// エフェクト
	LoadEffect_("ef712_10_emo_surprise01");									// 「！」

// ▼配置
	SetPointPos_(player, "player000");										// 主人公
	SetStepSe_(player, SILENT_STEP_SE);	// 足音を無音にする
	local rena = ArrangePointNpc_(model_rena, "npc_renerte000");			// レナーテ

// ▼非常駐モーション読込
	//主人公
	local player_sleep2_L = ReadMotion_(player, "Player_sleep2_L");			// 寝る
	local player_sleep2_awake = ReadMotion_(player, "Player_sleep2_awake");	// 寝る→上半身を起こす
	local player_one_knee = ReadMotion_(player, "Player_one_knee");			// 上半身を起こす→立膝
	local player_up01_L = ReadMotion_(player, "Player_up01_L");				// 上半身を起こすL
	local player_turn_L = ReadMotion_(player, "Player_turn_L");				// 振り返る
	local player_nod = ReadMotion_(player, "Player_nod");					// うなづく
	local player_surprise = ReadMotion_(player, "Player_surprise");			// 驚く
	local player_surprise_L = ReadMotion_(player, "Player_surprise_L");		// 驚くL

	//レナーテ
	local rena_sit = ReadMotion_(rena, "n007_sit_L");						// しゃがみ
	local rena_stand = ReadMotion_(rena, "n007_stand01");					// 立つ
	local rena_look_up_L = ReadMotion_(rena, "n007_look_up_L");				// レナーテ上向き待機
	local rena_talk = ReadMotion_(rena, "n007_talk01");						// 会話開始（手を胸にあてる）
	local rena_talk_L = ReadMotion_(rena, "n007_talk01_L");					// 会話L（手を胸にあてる）
	local rena_look_down = ReadMotion_(rena, "n007_look_down_L");			// うつむき待機

// ▼初期モーション
	SetMotion_(player, player_sleep2_L, BLEND_N); 							// 主　寝る
	SetFace_(player, "Face_loop_close");
	SetMotion_(rena, rena_sit, BLEND_N); 									// レナ　しゃがみ

// ▼カメラ設定
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");


//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット1 主　目覚め
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	Wait_(50);
	SetFace_(player, "Face_eyes_close");									// 目パチ
	Wait_(30);

	//===============================================
	// ■レナーテ
	// 「気がついたのね　<name_player/>！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_615_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(30);
	SetFace_(player, "Face_default");										// 通常


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット2 主　起きる
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	SetPointCameraEye_("cameye003");
	SetPointCameraTarget_("camtgt003");

	SetMotionSpeed_(player, 2);
	SetMotion_(player, player_sleep2_awake, BLEND_L);						// 主　起きる→立つ
	Wait_(80);
	SetMotionSpeed_(player, 1.0);
	WaitMotion(player);
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	Wait_(20);
	SetMotion_(player, player_up01_L, BLEND_XL);
	Wait_(15);
	SetMotion_(player, player_one_knee, BLEND_XL);
	Wait_(10);

	SetMotion_(player, MOT_WAIT, BLEND_L);									// 主待機
	Wait_(10);
	SetMotion_(rena, rena_stand, BLEND_XL);									// レナ立つ
	task_rena = Task_RotateToDir_(rena, 20, 3.0);							// 回転

	WaitMotion(rena);
	DeleteTask_(task_rena);
	SetMotion_(rena, MOT_WAIT, BLEND_M);									// レナ待機
	Wait_(30);
	SetMotion_(player, MOT_WALK, BLEND_M);									// 主　歩く
	task_player = Task_MoveForward_(player, 0.8, false);
	Wait_(10);
	PlaySE_("SE_FLD_015");													//■SE:足音
	Wait_(15);

	//===============================================
	// ■レナーテ
	// 「待って……！　あなたに……
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_615_MSG_020");
	SetMotion_(rena, rena_look_down, BLEND_XL);								// レナ　うつむき待機
	SetFace_(rena, "Face_loop_close");										// 目閉じ
	SetMotion_(player, MOT_WAIT, BLEND_L);									// 主　待機
	DeleteTask_(task_player);
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	SetMotion_(player, player_turn_L, BLEND_XL);							// 主　振り向く
	task_player = Task_RotateToDir_(player, 50, 3.0);						// 回転
	Wait_(15);
	DeleteTask_(task_player);

	SetFace_(rena, "Face_default");											// 目開け
	SetMotion_(rena, MOT_WALK, BLEND_M);									// レナ歩く
	local task_rena_step = Task_ChangeStepSe(rena, "SE_FLD_015", 15);
	task_rena = Task_MoveForward_(rena, 1.0, false);
	Wait_(18);
	DeleteTaskStepSe(rena, task_rena_step);
	SetMotion_(rena, MOT_WAIT, BLEND_L);									// レナ待機
	DeleteTask_(task_rena);
	Wait_(15);
	
	SetFace_(rena, "Face_eyes_close");	
	
	SetMotion_(rena, rena_talk, BLEND_L);									// レナ話す
	WaitMotion(rena);
	SetMotion_(rena, rena_talk_L, BLEND_M);

	//===============================================
	// ■レナーテ
	// 「あなたに　話しておきたい。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_615_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(rena, MOT_WAIT, BLEND_XL);									// レナ待機
	Wait_(20);
	SetPointPos_(player, "player001");										// 主人公移動
	SetPointPos_(rena, "npc_renerte001");									// レナ移動
	SetMotion_(player, MOT_WAIT, BLEND_N);									// 主　待機


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット3 レナ昔語り
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	task_cam = Task_AnimeMoveCamera_("anmeye005", "anmtgt005");

	SetMotion_(player, MOT_WALK, BLEND_M);									// 主　向き調整
	task_player = Task_RotateToPos_(player, GetPos_(rena), 5.7);			// 回転
	Wait_(8);
	PlaySE_("SE_FLD_015");													//■SE:足音
	WaitTask(task_player);
	SetMotion_(player, MOT_WAIT, BLEND_L);									// 主　待機
	Wait_(20);

	SetMotion_(rena, rena_talk, BLEND_L);									// レナ話す
	WaitMotion(rena);
	SetMotion_(rena, rena_talk_L, BLEND_M);

	PlayBgm_("BGM_009");

	//===============================================
	// ■レナーテ
	// 「かつて人間たちには
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_615_MSG_040");
	KeyInputWait_();
	//===============================================
	// ■レナーテ
	// 「その星では　マ素の結晶……マデュライトを
	//-----------------------------------------------
	ShowMsg_("DEMO_615_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	WaitTask(task_cam);
	Wait_(10);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット4 レナ　ズームイン
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");

	SetMotion_(rena, rena_look_down, BLEND_XL);								// レナ　うつむき待機

	//===============================================
	// ■レナーテ
	// 「でも　あるとき……大きな戦争によって
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_615_MSG_060");
	KeyInputWait_();
	//===============================================
	// ■レナーテ
	// 「そこで　人間たちは　故郷を捨て
	//-----------------------------------------------
	ShowMsg_("DEMO_615_MSG_070");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	WaitTask(task_cam);
	Wait_(10);
	SetPointPos_(rena, "npc_renerte001");									// レナ移動


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット5 主⇒レナへカメラ回り込み
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");

	local task_rena_step = Task_ChangeStepSe(rena, "SE_FLD_015", 12);
	SetMotion_(rena, MOT_WALK, BLEND_M);									// レナ歩く
	task_rena = Task_RotateToDir_(rena, -55, 5.7);	// 回転
	WaitTask(task_rena);
	task_rena = Task_MoveForward_(rena, 0.8, false);
	Wait_(20);
	SetMotion_(rena, MOT_WAIT, BLEND_L);									// レナ待機
	DeleteTaskStepSe(rena, task_rena_step);
	DeleteTask_(task_rena);
	Wait_(15);
	SetMotion_(player, MOT_WALK, BLEND_M);									// 主　向き調整
	task_player = Task_RotateToPos_(player, GetPos_(rena), 2.0);			// 回転
	WaitTask(task_player);
	SetMotion_(player, MOT_WAIT, BLEND_L);									// 主　待機
	Wait_(15);

	//===============================================
	// ■レナーテ
	// 「だけど……計画は　失敗した。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_615_MSG_080");
	KeyInputWait_();
	//===============================================

	SetMotion_(rena, rena_look_up_L, BLEND_XL);								// レナ上待機
	Wait_(10);

	//===============================================
	// ■レナーテ
	// 「星を作る装置である　マザーが
	//-----------------------------------------------
	ShowMsg_("DEMO_615_MSG_090");
	KeyInputWait_();
	//===============================================
	// ■レナーテ
	// 「ガルビルス……カルマッソ博士の悪意が
	//-----------------------------------------------
	ShowMsg_("DEMO_615_MSG_100");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	WaitTask(task_cam);
	SetMotion_(rena, MOT_WALK, BLEND_M);									// レナ反転
	task_rena = Task_RotateToPos_(rena, GetPos_(player), 5.7);				// 回転
	WaitTask(task_rena);
	SetMotion_(rena, MOT_WAIT, BLEND_M);									// レナ待機
	Wait_(15);

	SetMotion_(rena, rena_talk, BLEND_L);									// レナ話す
	WaitMotion(rena);
	SetMotion_(rena, rena_talk_L, BLEND_M);

	//===============================================
	// ■レナーテ
	// 「でも　マ素に汚染されたマザーは　暴走しつつも
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_615_MSG_110");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(rena, MOT_WAIT, BLEND_XL);									// レナ待機
	Wait_(30);
	SetPointPos_(rena, "npc_renerte001");									// レナ移動
	SetFace_(rena, "Face_loop_close");										// 目閉じ
	SetMotionSpeed_(rena, 0.7);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット6 レナ　足からPANUP
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");

	Wait_(80);
	SetMotion_(rena, rena_look_down, 20);									// レナ　うつむき待機
	WaitTask(task_cam);
	Wait_(10);

	//===============================================
	// ■レナーテ
	// 「そう……私こそが　マザーを浄化するため
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_615_MSG_120");
	SetFace_(rena, "Face_default");											// 目開け
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(15);
	SetMotionSpeed_(rena, 1.0);
	SetVisible(rena, false);
	SetDirToObject_(player, rena);	// player = -125°

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット7 主人公UP
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	SetPointCameraEye_("cameye004");
	SetPointCameraTarget_("camtgt004");

	SetMotion_(player, player_surprise, BLEND_M);		// 主　驚く
	Wait_(2);
	SurpriseDispSetOffset(player, Vec3(1.0, 1.0, 0.0), 0.55);
	WaitMotion(player);
	SetMotion_(player, player_surprise_L, BLEND_M);		// 主　驚くL
	Wait_(45);

	SetVisible(rena, true);
	SetMotion_(player, MOT_WAIT, BLEND_L);

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット8 回転カメラゆっくり
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");

	SetMotion_(rena, rena_talk, BLEND_XL);									// レナ話す
	WaitMotion(rena);
	SetMotion_(rena, rena_talk_L, BLEND_M);	

	//===============================================
	// ■レナーテ
	// 「ガルビルスは　今　マザーのチカラを
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_615_MSG_130");
	KeyInputWait_();
	//===============================================
	// ■レナーテ
	// 「そうなったとき　私も　どうなるかわからない。
	//-----------------------------------------------
	ShowMsg_("DEMO_615_MSG_140");
	KeyInputWait_();
	//===============================================

	SetMotion_(rena, rena_look_down, BLEND_XL);								// レナ　うつむき待機

	//===============================================
	// ■レナーテ
	// 「私が消えれば　マザーを浄化する手段はなくなり
	//-----------------------------------------------
	ShowMsg_("DEMO_615_MSG_150");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	WaitTask(task_cam);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット9 主　アップ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");

	//===============================================
	// ■レナーテ
	// 「それを阻止できるのは　あなたしか　いないの
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_615_MSG_160");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(player, player_nod, BLEND_L);								// 主　うなづく
	WaitMotion(player);
	SetMotion_(player, MOT_WAIT, BLEND_M);
	Wait_(40);

	EndDemo(FADE_COLOR_BLACK);
}
