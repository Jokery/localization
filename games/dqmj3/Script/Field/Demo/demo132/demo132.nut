//=============================================
//
//		demo132[チョーマッハとの再会]
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
	local task_cam, task_player, task_hunter;
	local efc_hunter;

// ▼リソース読込
	// キャラクター
	local player = GetPlayerId_();					// 主人公
	local model_hunter = ReadNpc_("n006");			// チョーマッハ
	// エフェクト
	LoadEffect_("ef712_10_emo_surprise01");			// 「！」

// ▼配置
	// 主人公
	SetPointPos_(player, "player000");
	// チョーマッハ
	local hunter = ArrangePointNpc_(model_hunter, "npc_hunter000");

// ▼非常駐モーション読込
	local hunter_run_L = ReadMotion_(hunter, "n001_run_L");					// 走るL
	local hunter_talk_joy_L = ReadMotion_(hunter, "n000_talk_joy_L");		// 会話（嬉しそう）L
	local hunter_hand_up = ReadMotion_(hunter, "n002_hand_up");
	local hunter_hand_up_L = ReadMotion_(hunter, "n002_hand_up_L");


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット1
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

// ▼カメラ設定
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");	// 60F

	task_player = Task_AnimeMoveSetMotion_(player, "anm_player000", MOT_WALK, MOT_WAIT);	// 60F

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);

	WaitTask(task_player);
	Wait_(60);
	SetPointPos_(player, "player001");
	DeleteTask_(task_cam);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット2
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");

	Wait_(15);
	efc_hunter = SetSelectBoneEffectSetOffset_("ef712_10_emo_surprise01", hunter, ATTACH_EFFECT1, Vec3(-2.0, -1.9, 0.0));
	PlaySE_("SE_DEM_053");
	Wait_(30);
	task_hunter = Task_AnimeMoveSetMotion_(hunter, "anm_hunter000", hunter_run_L, hunter_talk_joy_L);	// 25F
	WaitTask(task_hunter);

	//===============================================
	// ■チョーマッハ
	//「おおっ　<name_player/>！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_CHOMACH");
	ShowMsg_("DEMO_132_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(5);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット3
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");

	//===============================================
	// ■チョーマッハ
	//「おかげで　グレートライダーズカップっていう
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_CHOMACH");
	ShowMsg_("DEMO_132_MSG_020");
	KeyInputWait_();
	//===============================================
	// ■チョーマッハ
	//「グレートライダーズカップでは　モンスターを
	//-----------------------------------------------
	ShowMsg_("DEMO_132_MSG_030");
	KeyInputWait_();
	//===============================================
	// ■チョーマッハ
	//「くわしい説明は　あとでオイラのところに
	//-----------------------------------------------
	ShowMsg_("DEMO_132_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(5);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット4
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");

	//===============================================
	// ■チョーマッハ
	//「それじゃ　待ってるっちょー！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_CHOMACH");
	ShowMsg_("DEMO_132_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(hunter, hunter_hand_up, BLEND_M);
	WaitMotion(hunter);
	SetMotion_(hunter, hunter_hand_up_L, BLEND_M);
	Wait_(20);
	SetMotion_(hunter, MOT_WALK, BLEND_M);
	task_hunter = Task_RotateToDir_(hunter, 180, 8.55);
	WaitTask(task_hunter);
	task_hunter = Task_MoveForward_(hunter, 0.8, true);
	SetMotion_(hunter, hunter_run_L, BLEND_M);
	Wait_(80);

	EndDemo(FADE_COLOR_BLACK);
}
