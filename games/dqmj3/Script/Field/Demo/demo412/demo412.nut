//=============================================
//
//		demo412[レジスタンスのルキヤ]
//
//=============================================
function Task_Rot3(chr, rot, frm)
{

//半時計回り　加算
//時計回り　減算

	local dir = GetDir_(chr);
	
	local sita = dir+rot;
	
	local sita2 = sita-dir;

	if( sita2 <= 0 ){
		sita2 = sita2*-1;
	}
	
	local frm2 = sita2/frm;
	
	local task = Task_RotateToDir_(chr, sita, frm2);
	
	return task;
}
//-------------------------------------------------------------------------
//
//		読み込み・配置
//
//-------------------------------------------------------------------------
function Update()
{
	
// ▼変数定義
	local task_cam, task_player, task_ittaburu, task_kansyuA, task_kansyuB, task_rukiya;
	local efc_player, efc_kansyuA, efc_kansyuB;

// ▼リソース読込
	// キャラクター
	local player		 = GetPlayerId_();			// 主人公
	local id_rukiya		 = ReadNpc_("n009");		// ルキヤ

	local id_ittaburu	 = ReadNpc_("m205_00");		// イッタブル
	local id_sli_k		 = ReadNpc_("m035_00");		// 看守C：おおきづち
	local id_ookizuchi	 = ReadNpc_("m008_00");		// 看守B：スライムナイト

	local g_door		 = ReadGimmick_("o_S02_01");
	local g_lift		 = ReadGimmick_("o_S02_00");

// ▼配置
	// 主人公
	SetPointPos_(player, "player");

	// ルキヤ
	local rukiya	 = ArrangePointNpc_(id_rukiya,		 "rukiya");
	SetStepSe_(rukiya, SILENT_STEP_SE);

	// イッタブル
	local ittaburu	 = ArrangePointNpc_(id_ittaburu,	 "ittaburu");
	SetMotion_(ittaburu, MOT_WAIT, 1);
	SetStepSe_(ittaburu, "SILENT_STEP_SE");

	// 看守A
	local kansyuA	 = ArrangePointNpc_(id_sli_k,		 "kansyuA");
	SetScaleSilhouette(kansyuA, 0.6, 0.8);
	SetStepSe_(kansyuA, "SILENT_STEP_SE");

	// 看守B
	local kansyuB	 = ArrangePointNpc_(id_ookizuchi,	 "kansyuB");
	SetScaleSilhouette(kansyuB, 0.6, 0.8);
	SetStepSe_(kansyuB, "SILENT_STEP_SE");

	local door	 = ArrangePointGimmick_("o_S02_01", g_door, "door");
	local lift	 = ArrangePointGimmick_("o_S02_00", g_lift, "lift");
	
	SetMotion_(door, MOT_GIMMICK_0, 1);
	
	// ▼エフェクト
	LoadEffect_("ef712_13_emo_sweat01");			// 汗
	
	local pos = Vec3(0, 0, 0);
	LoadEffect_("ef712_10_emo_surprise01");			// 「！」エフェクト

// ▼非常駐モーション読込
	local r_kubi	= ReadMotion_(rukiya,	"n009_look_left_L");	// ルキヤ、左向く
	local p_unn		= ReadMotion_(player,	"Player_nod");			// 頷く
	local p_kyoro	= ReadMotion_(player,	"Player_caution02_L");	// きょろきょろ
	local p_look	= ReadMotion_(player,	"Player_cage_look_L");	// みる
	local p_turn	= ReadMotion_(player,	"Player_look_right_L");	// 振り向きL
	local p_tateL	= ReadMotion_(player,	"Player_one_knee_L");	// 立膝L
	local p_tatu	= ReadMotion_(player,	"Player_battle01");		// 立膝L→戦闘待機
	local p_wait	= ReadMotion_(player,	"Player_caution01_L");	// 警戒L
	SetMotion_(player, p_tateL, 1);

// ▼カメラ設定
	SetPointCameraEye_("001_cameye");
	SetPointCameraTarget_("001_camtgt");

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	SetMotion_(player, p_wait, 16);

	Wait_(30);
	//===============================================
	// *なぞの老婆
	// 「コラッ！　ぼやぼやしてんじゃない！
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_412_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	SurpriseDisp(player);
	SetMotion_(player, p_kyoro, 8);

	Wait_(60);

	//===============================================
	// *なぞの老婆
	// 「なーに　キョロキョロしてるんだい。
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_412_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	Task_Rot3(rukiya, 95, 1)
	SetMotion_(rukiya, MOT_WAIT, 1);
	task_cam = Task_AnimeMoveCamera_("002_anmeye", "002_anmtgt");
	task_rukiya = Task_AnimeMoveNoDirNoFit_(rukiya, "rukiya_anm001");
	task_player = Task_AnimeMoveSetMotion_(player, "player_anm001", MOT_WALK, MOT_WAIT);
	SetStepSe_(player, SILENT_STEP_SE);										// 足音を 無音にする
	Wait_(140);
	ResetStepSe_(player);
	WaitTask(task_rukiya);
	SetMotion_(rukiya, MOT_TALKLOOP, 8);
	WaitTask(task_player);
	DeleteTask_(task_cam);
	task_cam = Task_AnimeMoveCamera_("004_anmeye", "004_anmtgt");
	//===============================================
	// *なぞの老婆
	// 「やれやれ……まったく本当に
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MYSTERY_OLD_WOMAN");
	ShowMsg_("DEMO_412_MSG_030");
	KeyInputWait_();
	
	//===============================================
	
	//===============================================
	// *なぞの老婆
	// 「やっと　会えたね　○主人公の名前○。
	//-----------------------------------------------
	ShowMsg_("DEMO_412_MSG_040");
	KeyInputWait_();
	//===============================================

	//===============================================
	// *なぞの老婆
	// 「……って　どうしたんだい？
	//-----------------------------------------------
	ShowMsg_("DEMO_412_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	SetMotion_(rukiya, MOT_WAIT, BLEND_XL);

	WaitTask(task_cam);	
	efc_player = SurpriseDispSetOffset(rukiya, pos, 0.7);
	DeleteTask_(task_cam);
	Wait_(30);
	//===============================================
	// *なぞの老婆
	// 「そういえば　あんた　記憶がないんだったね。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MYSTERY_OLD_WOMAN");
	ShowMsg_("DEMO_412_MSG_060");

	SetMotion_(rukiya, MOT_TALK, 8);
	WaitMotion(rukiya);
	SetMotion_(rukiya, MOT_TALKLOOP, 8);

	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	task_cam = Task_AnimeMoveCamera_("003_anmeye", "003_anmtgt");					//
	//===============================================
	// *なぞの老婆
	// 「あたしは　レジスタンスの　ルキヤ。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MYSTERY_OLD_WOMAN");
	ShowMsg_("DEMO_412_MSG_070");
	KeyInputWait_();
	CloseMsgWnd_();
	SetMotion_(rukiya, MOT_WAIT, BLEND_XL);
	WaitTask(task_cam);
	//===============================================
	SetPointCameraEye_("0024_cameye");
	SetPointCameraTarget_("0024_camtgt");

	// エレベータのあがってくる音を鳴らす
	PlaySE_("SE_DEM_087");
	Wait_(12);
	SurpriseDisp(player);
	SurpriseDisp(rukiya);
	SetMotion_(player, p_turn, 4);
	SetMotion_(rukiya, r_kubi, 4);
	Wait_(15);
	SetMotion_(rukiya, MOT_WALK, BLEND_XL);
	Task_Rot3(rukiya, -120, 30)
	Wait_(30);
	task_player		 = Task_AnimeMove_(player,		 "player_anm002");
	task_rukiya		 = Task_AnimeMove_(rukiya,		 "rukiya_anm002");
	SetMotion_(player, MOT_RUN, 8);
	WaitTask(task_player);
	SetMotion_(player, MOT_WAIT, 8);
	SetMotion_(rukiya, MOT_WAIT, BLEND_XL);
	task_ittaburu		 = Task_AnimeMove_(ittaburu,	"ittaburu_anm001");
	DeleteTask_(task_ittaburu);
	Task_Rot3(ittaburu, -90, 1)
	task_cam		 = Task_AnimeMoveCamera_	("005_anmeye",	 "005_anmtgt");
	task_ittaburu		 = Task_AnimeMove_(ittaburu,	"ittaburu_anm001");
	task_kansyuA		 = Task_AnimeMove_(kansyuA,		 "kansyuA_anm001");
	task_kansyuB		 = Task_AnimeMove_(kansyuB,		 "kansyuB_anm001");
	SetMotionSpeed_(ittaburu, 1);
	SetMotion_(door, MOT_GIMMICK_1, 1);
	Wait_(30)
	SetMotion_(door, MOT_GIMMICK_2, 1);
	SetMotion_(kansyuB, MOT_RUN, BLEND_M);
	SetMotion_(ittaburu, MOT_WALK, BLEND_L);
	local Istep = Task_PlaySe_("SE_FLD_052", 15);
	Wait_(15);
	StartEarthQuake_(10, 3, 0.7);

	Wait_(15);
	StartEarthQuake_(10, 3, 0.7);
	SetMotion_(kansyuB, MOT_WAIT, BLEND_M);
	Wait_(15);
	StartEarthQuake_(10, 3, 0.7);
	Wait_(5);

	SetMotion_(ittaburu, MOT_WAIT, BLEND_L);
	SetMotion_(kansyuB, MOT_RUN, BLEND_M);
	SetMotion_(kansyuA, MOT_RUN, BLEND_M);
	DeleteTask_(Istep);
	Wait_(20);
	SetMotion_(door, MOT_GIMMICK_3, 1);
	PlaySE_("SE_DEM_088");
	Wait_(20);
	WaitTask(task_kansyuB);
	task_kansyuB = Task_RotateToPos_(kansyuB, GetPos_(ittaburu), 10.0);
	WaitTask(task_kansyuB);
	SetMotion_(kansyuB, MOT_WAIT, BLEND_M);
	WaitTask(task_kansyuA);
	task_kansyuA = Task_RotateToPos_(kansyuA, GetPos_(ittaburu), 10.0);
	WaitTask(task_kansyuA);
	SetMotion_(kansyuA, MOT_WAIT, BLEND_M);
	Wait_(10);
	SetMotion_(door, MOT_GIMMICK_0, 1);
	//===============================================
	// ■イッタブル
	// 「マザーと　ダークマスターさまに
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ITABURU");
	ShowMsg_("DEMO_412_MSG_080");
	
	KeyInputWait_();
	//===============================================
	
	task_player = Task_WalkAroundToDir(player, -90, 100);
	task_rukiya = Task_WalkAroundToDir(rukiya, -90, 100);
	WaitTask(task_player);
	SetMotion_(player, MOT_WAIT, BLEND_L);
	
	//===============================================
	// ■イッタブル
	// 「絶対に　追い詰めよ！
	//-----------------------------------------------
	ShowMsg_("DEMO_412_MSG_090");
	KeyInputWait_();
	WaitTask(task_player);
	CloseMsgWnd_();
	//===============================================
	SetMotionSpeed_(ittaburu, 0.8);
	efc_kansyuA = SetSelectBoneEffect_("ef712_13_emo_sweat01", kansyuA, ATTACH_EFFECT1);
	efc_kansyuB = SetSelectBoneEffect_("ef712_13_emo_sweat01", kansyuB, ATTACH_EFFECT1);
	SetEffectScale_(efc_kansyuA, 3.0);
	SetEffectScale_(efc_kansyuB, 3.0);

	task_kansyuA = Task_WalkAroundToDir(kansyuA, 90, 5);
	task_kansyuB = Task_WalkAroundToDir(kansyuB, 90, 10);
	SetMotion_(kansyuA, MOT_RUN, 8);
	SetMotion_(kansyuB, MOT_RUN, 8);
	WaitTask(task_kansyuB);
	task_cam		 = Task_AnimeMoveCamera_	("006_anmeye",	 "006_anmtgt");
	task_kansyuA	 = Task_AnimeMove_			(kansyuA,		 "kansyuA_anm002");
	
	task_kansyuB	 = Task_AnimeMove_			(kansyuB,		 "kansyuB_anm002");
	
	task_ittaburu	 = Task_AnimeMove_			(ittaburu,		 "ittaburu_anm002");
	Wait_(66);
	SetMotion_(ittaburu, MOT_WALK, 8);
	local Istep = Task_PlaySe_("SE_FLD_052", 20);
	Wait_(20);
	StartEarthQuake_(10, 3, 0.7);

	Wait_(20);

	WaitTask(task_cam);
	task_cam		 = Task_AnimeMoveCamera_	("007_anmeye",	 "007_anmtgt");
	task_rukiya = Task_RotateToPos_(rukiya, GetPos_(player), 10.0);
	task_player = Task_RotateToPos_(player, GetPos_(rukiya), 10.0);
	SetMotion_(player, MOT_WALK, BLEND_M);

	WaitTask(task_player);
	SetMotion_(player, MOT_WAIT, BLEND_M);
	WaitTask(task_rukiya);

	WaitTask(task_cam);
	DeleteTask_(Istep);
	SetMotion_(rukiya, MOT_TALK, BLEND_XL);
	Wait_(20);
	//===============================================
	// ■ルキヤ
	// 「こんな所にいたら　すぐ見つかっちまう。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RUKIYA");
	ShowMsg_("DEMO_412_MSG_100");

	WaitMotion(rukiya);
	SetMotion_(rukiya, MOT_TALKLOOP, BLEND_XL);

	KeyInputWait_();
	//===============================================
	
	//===============================================
	// ■ルキヤ
	// 「４階の北東に　空き部屋がある。
	//-----------------------------------------------
	ShowMsg_("DEMO_412_MSG_110");
	KeyInputWait_();
	// 「下り階段を使うのは　まずい。
	ShowMsg_("DEMO_412_MSG_120");
	KeyInputWait_();
	
	CloseMsgWnd_();
	//===============================================
	SetMotion_(rukiya, MOT_WAIT, BLEND_XL);
	Wait_(10);
	SetMotion_(player, p_unn, BLEND_XL);

	WaitMotion(player);
	SetMotion_(player, MOT_WAIT, 8);
	
	EndDemo(FADE_COLOR_BLACK);
}
