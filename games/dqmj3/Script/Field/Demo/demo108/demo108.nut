//=============================================
//
//		demo108[センタービル入館]
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
	local efc_cam, efc_player, efc_ace;
	local task_cam, task_player, task_ace, task_jack, task_npc01, task_npc02, task_npc03;
	
// ▼エフェクト読み込み
	LoadEffect_("ef712_10_emo_surprise01");
	LoadEffect_("ef810_03_power_on");
	
// ▼ギミック設置	
	local window = ReadGimmick_("o_A00_04");								//センタービルの窓ギミック
	local res_tele = ArrangePointGimmick_("o_A00_04", window, "gimmick000");
	SetMotion_(res_tele, MOT_GIMMICK_1, 1);	
	local model_throne = ReadGimmick_("o_com_05");							// 玉座
	local throne = ArrangePointGimmick_("o_com_05", model_throne, "obj000");// 玉座
	
// ▼モデル読込
	// キャラクター
	local player = GetPlayerId_();					// 主人公
	local model_nocho = ReadNpc_("n000");			// 一般ノチョーラ
	local model_nocho_female = ReadNpc_("n004");	// 一般ノチョーラ（♀）
	local model_jack = ReadNpc_("n001");			// ジャック
	local model_ace = ReadNpc_("n002");				// エース
	local model_king = ReadNpc_("n003");			// キング
	local model_queen = ReadNpc_("n005");			// クイーン

// ▼配置
	// 主人公
	SetPointPos_(player, "player");
	// ジャック
	local jack = ArrangePointNpc_(model_jack, "npc_jack000");
	// エース
	local ace = ArrangePointNpc_(model_ace, "npc_ace002");
	// キング
	local king = ArrangePointNpc_(model_king, "npc_king000");
	// クイーン
	local qween = ArrangePointNpc_(model_queen, "npc_queen000");
	// dammy
	local dammy = ArrangePointNpc_(model_nocho, "center");
	
// ▼非常駐モーション読込
	// キング
	local stick_king = ReadMotion_(king, "n003_stick_up");					//キング待機→杖掲げ
	local stickL_king = ReadMotion_(king, "n003_stick_up_L");				//キング杖掲げ
	local ki_talk_think = ReadMotion_(king, "n003_talk_think");				// キング　会話→考える
	local ki_think_L = ReadMotion_(king, "n003_think_L");					// キング　考えるL
	local ki_look_right_L = ReadMotion_(king, "n003_look_right_L");			// キング　右を向くL
	local ki_nod = ReadMotion_(king, "n003_nod");							// キング　うなづく	
	// エース
	local ac_talk_joy_L = ReadMotion_(ace, "n002_talk_joy_L");				// エース　会話（嬉しそう）L
	local ac_look_bldg_L = ReadMotion_(ace, "n000_look_bldg_L");			// エース　センタービルを見るL
	local ac_hand_up = ReadMotion_(ace, "n002_hand_up");					// エース　会話→手をあげる
	local ac_hand_up_L = ReadMotion_(ace, "n002_hand_up_L");				// エース　手をあげるL
	local ac_rejoice_L = ReadMotion_(ace, "n000_rejoice_L");				// エース　ジャンプ（喜び）L
	//ジャック
	local ja_rejoice_L = ReadMotion_(jack, "n000_rejoice_L");				// ジャック　ジャンプ（喜び）L
//	
// ▼初期のモーション
	//主人公
	SetMotion_(player, MOT_WALK, BLEND_N);
	
// ▼初期の向き
	SetDir_(player, 180);
	
	local task_forward = Task_MoveForward_(player, 1.0, false);
// ▼カメラ設定
	SetTime_(10000);		// 夜
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");	
	local pwr_on = SetPointWorldEffect_("ef810_03_power_on", "gimmick000");
//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット1　ノチョーラだらけのセンタービル
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	StartDemo(FADE_COLOR_BLACK);
	Wait_(15);
	efc_ace = SurpriseDisp(ace);
	Wait_(45);
	DeleteTask_(task_forward);
	SetMotion_(player, MOT_WAIT, BLEND_M);
	
	//主要ノチョーラ主人公の方に向く
	local task_ace = Task_WalkAroundToPos(ace, GetPos_(player), ROTATE_DEMO_DEF);
	Wait_(10);
	local task_jack = Task_WalkAroundToPos(jack, GetPos_(player), ROTATE_DEMO_DEF);
	Wait_(10);
	
	SetMotion_(ace, MOT_WAIT, BLEND_M);
	Wait_(10);
	SetMotion_(jack, MOT_WAIT, BLEND_M);
	Wait_(5);
	// 主人公歩き開始カメライン→扉の前で止まる
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット2　エースアップ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetPointPos_(ace, "npc_ace000");						//エース瞬間移動
	SetDirToObject_(ace, player);
	
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	
	//===============================================
	// ■エース
	// 「おおっ　<name_player/>！
	//-----------------------------------------------
	SetMotion_(ace, ac_talk_joy_L, BLEND_M);								// エース　会話（嬉しそう）L
	
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_108_MSG_010");
	KeyInputWait_();
	
	//===============================================
	// ■エース
	//「見てくれ。オメーのおかげで
	//-----------------------------------------------
	
	ShowMsg_("DEMO_108_MSG_020");
	SetMotion_(ace, ac_look_bldg_L, BLEND_L);								// エース　センタービルを見るL
	
	KeyInputWait_();
	CloseMsgWnd_();
	
	Wait_(30);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット3　送電施設アップ→送電施設全景
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");
	WaitTask(task_cam);
	
	//フェードアウト
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 60);
	WaitFade_();
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット4 キング、エース、主人公
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_player = Task_RotateToPos_(player, GetPos_(king), 287);
	task_ace = Task_RotateToPos_(ace, GetPos_(king), 287);
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");

	//フェードイン
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);
	WaitFade_();
	
	//===============================================
	// ■キング
	// 「うむうむ。<name_player/>もエースも
	//-----------------------------------------------
	Wait_(20);	
	SetMotion_(king, ki_look_right_L, BLEND_XL);					// キング　右を向くL
	SetMotion_(ace, MOT_WAIT, 30);									// エース　待機
	
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_108_MSG_030");
	KeyInputWait_();

	// ■キング
	//「しかし……電力が止まっていた　ということは
	ShowMsg_("DEMO_108_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	
	SetMotion_(king, MOT_WAIT, BLEND_N);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット5 エースアップ再び
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	DeleteTask_(task_cam);
	
	SetPointCameraEye_("cameye003");
	SetPointCameraTarget_("camtgt003");
	
	//===============================================
	// ■エース
	// 「キング！　まずは中を　たしかめてみようぜ。
	//-----------------------------------------------
	
	SetMotion_(ace, ac_talk_joy_L, BLEND_M);	// エース　会話（嬉しそう）L
	
	Wait_(5);
	
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_108_MSG_050");
	KeyInputWait_();
	
	CloseMsgWnd_();
	SetMotion_(ace, MOT_WAIT, 30);				// エース　待機
	SetDirToObject_(king, player);
	
	//ノチョーラどもキング凝視
	SetDirToObject_(jack, king);
	SetDirToObject_(qween, king);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット6　ノチョーラ移動
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetPointPos_(ace, "npc_ace002");						//エース瞬間移動
	SetDirToObject_(ace, king);

	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	
	//ノチョーラたち移動開始
	SetMotion_(ace, MOT_WALK, BLEND_M);	
	local task_rotate = Task_RotateToPos_(ace, GetPos_(dammy), 11.5);	
	Wait_(3);
	SetMotion_(jack, MOT_WALK, BLEND_M);	
	local task_rotate2 = Task_RotateToPos_(jack, GetPos_(dammy), 11.5);	
	Wait_(2);
	SetMotion_(qween, MOT_WAIT, BLEND_M);	
	local task_rotate3 = Task_RotateToPos_(qween, GetPos_(dammy), 11.5);	
	WaitTask(task_rotate);
	local task_forward = Task_MoveForward_(ace, 1.0, false);
	WaitTask(task_rotate2);
	local task_forward = Task_MoveForward_(jack, 1.0, false);
	WaitTask(task_rotate3);
	
	Wait_(40);
	
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	EndDemoBgmFade_(FADE_DEF);
	Wait_(15);
	
	SetStepSe_(ace, SILENT_STEP_SE);
	SetStepSe_(jack, SILENT_STEP_SE);
	
	WaitFade_();
	DeleteAllTask_();
	SetSepiaColor_(false);
	End_();
	
//	EndDemo(FADE_COLOR_BLACK);		// 足音SEをフェード途中で消すため
}
