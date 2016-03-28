//=============================================
//
//		demo422[ルキヤが遺した道しるべ]
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
	local task_cam, task_player, task_spike;
	local efc_player;

// ▼リソース読込
	// キャラクター
	local player = GetPlayerId_();						// 主人公
	local n_spike = ReadNpc_("m127_01");				// 少年
	local model_o_dem_07 = ReadGimmick_("o_dem_23");	// リアクター

// ▼配置
	// 主人公
	SetPointPos_(player, "player000");
	
	// 少年
	local spike = ArrangePointNpc_(n_spike, "npc_spike000");
	SetScaleSilhouette(spike, SCALE.S, 0.25);
	
	// リアクター
	local gmc_o_dem_07 = ArrangePointGimmick_("o_dem_07", model_o_dem_07, "obj_reactor000");

// ▼非常駐モーション読込
	local spike_m127_01_talk_L = ReadMotion_(spike, "m127_01_talk_L");
	local spike_m127_01kyorokyoro_L = ReadMotion_(spike, "m127_01_kyorokyoro_L");
	local player_Player_hold_L = ReadMotion_(player, "Player_hold_L");

// ▼カメラ設定
	SetPointCameraEye_("001_cameye");
	SetPointCameraTarget_("001_camtgt");

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	SetVisible(spike, false);
	SetMotion_(gmc_o_dem_07, MOT_GIMMICK_2, BLEND_XL);
	SetMotion_(player, player_Player_hold_L, BLEND_N);
	AttachObject_(player, gmc_o_dem_07, ATTACH_EFFECT3);
	StartDemo(FADE_COLOR_BLACK);
	
	//===============================================
	// *ルキヤの声かい
	// 「……聞こえるかい　○主人公の名前○。
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_422_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetVisible(spike, true);
	task_cam = Task_AnimeMoveCamera_("001_anmeye", "001_anmtgt");
	SetMotion_(spike, spike_m127_01_talk_L, BLEND_L);
	
	//===============================================
	// *少年
	// 「ええっ！？　ルキヤっ！？
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MONSTER_BOY");
	ShowMsg_("DEMO_422_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	InitSilhouetteWidth_(spike, 1.6);
	SetPointPos_(player, "player001");
	SetPointPos_(spike, "npc_spike001");

	SetDirToObject_(player, spike);
	SetMotion_(spike, spike_m127_01kyorokyoro_L, BLEND_L);
	task_cam = Task_AnimeMoveCamera_("002_anmeye", "002_anmtgt");
	
	//===============================================
	// ■ルキヤの声
	// 「あたしが　死んだときに備えて
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RUKIYA_VOICE");
	ShowMsg_("DEMO_422_MSG_030");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	// ■ルキヤの声
	// 「いいかい？　このリアクターの中には
	//-----------------------------------------------
	ShowMsg_("DEMO_422_MSG_040");
	KeyInputWait_();

	//===============================================
	// ■ルキヤの声
	// 「どんなトビラでも開ける　魔法のカギさ。
	//-----------------------------------------------
	ShowMsg_("DEMO_422_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetPointPos_(player, "player000");
	SetMotion_(spike, MOT_WAIT, BLEND_L);
	task_cam = Task_AnimeMoveCamera_("003_anmeye", "003_anmtgt");
	SetVisible(spike, false);

	//===============================================
	// ■ルキヤの声
	// 「そのマスターキーで　監獄の最上階にある
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RUKIYA_VOICE");
	ShowMsg_("DEMO_422_MSG_060");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	// ■ルキヤの声
	// 「中には　移動装置を使うための　機械がある。
	//-----------------------------------------------
	ShowMsg_("DEMO_422_MSG_070");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	// ■ルキヤの声
	// 「その機械を使えば　焦熱の火山への
	//-----------------------------------------------
	ShowMsg_("DEMO_422_MSG_080");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	// ■ルキヤの声
	// 「そうしたら移動装置で　焦熱の火山に行くんだ。
	//-----------------------------------------------
	ShowMsg_("DEMO_422_MSG_090");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	task_cam = Task_AnimeMoveCamera_("004_anmeye", "004_anmtgt");
	
	//===============================================
	// ■ルキヤの声
	// 「すまないね。本当なら　一緒に
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RUKIYA_VOICE");
	ShowMsg_("DEMO_422_MSG_100");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	// ■ルキヤの声
	// 「悪いけど　今は　これが精一杯。
	//-----------------------------------------------

	ShowMsg_("DEMO_422_MSG_110");
	KeyInputWait_();

	//===============================================
	
	//===============================================
	// ■ルキヤの声
	// 「頼んだよ　○主人公の名前○。
	//-----------------------------------------------
	ShowMsg_("DEMO_422_MSG_120");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(gmc_o_dem_07, MOT_GIMMICK_1, BLEND_XL);
	Wait_(5);
	WaitTask(task_cam);
	DeleteTask_(task_cam);
	
	task_cam = Task_AnimeMoveCamera_("005_anmeye", "005_anmtgt");	
	
	DeleteTask_(task_cam);
	Wait_(50);
	SetMotion_(gmc_o_dem_07, MOT_GIMMICK_7, BLEND_L);
	task_cam = Task_AnimeMoveCamera_("005_anmeye", "005_anmtgt");	
	WaitTask(task_cam);
	//===============================================
	// *システムメッセージ
	// マスターキーを　手に入れた。
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_422_MSG_130");
	PlayMe_("ME_010");
	WaitMe_();
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(20);
	
	EndDemo(FADE_COLOR_BLACK);
}
