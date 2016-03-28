//=============================================
//
//		demo037[険しい崖を越えて]
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
	local task_cam, task_player, task_npc01, task_npc02, task_npc03, task_npc04, task_npc05, task_npc06, task_npc07;
	
// ▼モデル読込
	// キャラクター
	local player = GetPlayerId_();					// 主人公
	local model_nocho = ReadNpc_("n000");			// 一般ノチョーラ
	local model_jack = ReadNpc_("n001");			// ジャック
	local model_ace = ReadNpc_("n002");				// エース
	local model_king = ReadNpc_("n003");			// キング
	local model_qween = ReadNpc_("n005");			// クイーン
	local model_rin = ReadNpc_("n043");				// ノチョリン
	
	// ギミック
	local model_maruta = ReadGimmick_("o_H00_04");	// 丸太
	local model_throne = ReadGimmick_("o_com_05");	// 玉座

// ▼配置
	// 丸太
	local maruta = ArrangePointGimmick_("o_H00_04", model_maruta, "obj_maruta000");
	// 玉座
	local throne = ArrangePointGimmick_("o_com_05", model_throne, "obj_throne000");
	
	// 主人公
	SetPointPos_(player, "player000");
	local task_player = Task_RotateToPos_(player, GetPos_(maruta), 229);
	// ノチョリン
	local nocho = ArrangePointNpc_(model_rin, "npc_nocho000");
	// ノチョーラB
	local nocho2 = ArrangePointNpc_(model_nocho, "npc_nocho001");
	// ノチョーラC
	local nocho3 = ArrangePointNpc_(model_nocho, "npc_nocho002");
	// ノチョーラD
	local nocho4 = ArrangePointNpc_(model_nocho, "npc_nocho003");
	// ジャック
	local jack = ArrangePointNpc_(model_jack, "npc_jack000");
	// エース
	local ace = ArrangePointNpc_(model_ace, "npc_ace000");
	// キング
	local king = ArrangePointNpc_(model_king, "npc_king000");
	// クイーン
	local qween = ArrangePointNpc_(model_qween, "npc_qween000");

// ▼非常駐モーション読込
	local kg_talk = ReadMotion_(king, "n003_talk");						// 待機→会話
	local kg_talk_L = ReadMotion_(king, "n003_talk_L");					// 会話

// ▼カメラ設定
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	// ▼カメラ１〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜
	Wait_(45);
	
	//===============================================
	// ■キング
	// 「待たせたな　<name_player/>よ。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_037_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(player, MOT_WALK, BLEND_M);
	task_player = Task_RotateToPos_(player, GetPos_(king), ROTATE_DEMO_DEF);
	
	//パラパラと歩き出す
	SetMotion_(jack, MOT_WALK, BLEND_M);
	Wait_(2);
	SetMotion_(ace, MOT_WALK, BLEND_M);
	Wait_(2);
	SetMotion_(qween, MOT_WALK, BLEND_M);
	Wait_(2);
	SetMotion_(nocho, MOT_WALK, BLEND_M);
	Wait_(2);
	SetMotion_(nocho2, MOT_WALK, BLEND_M);
	Wait_(2);
	SetMotion_(nocho3, MOT_WALK, BLEND_M);
	Wait_(2);
	SetMotion_(nocho4, MOT_WALK, BLEND_M);
	
	WaitTask(task_player);
	SetMotion_(player, MOT_WAIT, BLEND_M);
	DeleteTask_(task_player);
	
	task_npc02 = Task_MoveForward_(jack, 1.0, false);
	task_npc04 = Task_MoveForward_(ace, 1.0, false);
	task_npc06 = Task_MoveForward_(qween, 1.0, false);
	task_npc03 = Task_MoveForward_(nocho, 1.0, false);
	task_npc05 = Task_MoveForward_(nocho2, 1.0, false);
	task_npc07 = Task_MoveForward_(nocho3, 1.0, false);
	
	// ▼カメラ１〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	
	Wait_(20);
	
	SetMotion_(ace, MOT_WAIT, BLEND_M);
	SetMotion_(nocho, MOT_WAIT, BLEND_M);
	DeleteTask_(task_npc04);
	DeleteTask_(task_npc03);
	Wait_(20);
	
	SetMotion_(qween, MOT_WAIT, BLEND_M);
	SetMotion_(nocho2, MOT_WAIT, BLEND_M);
	DeleteTask_(task_npc06);
	DeleteTask_(task_npc05);
	Wait_(20);
	
	SetMotion_(jack, MOT_WAIT, BLEND_M);
	SetMotion_(nocho3, MOT_WAIT, BLEND_M);
	SetMotion_(nocho4, MOT_WAIT, BLEND_M);
	DeleteTask_(task_npc02);
	DeleteTask_(task_npc07);
	Wait_(5);
	
	//-----
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 10);
	WaitFade_();
	
	// ▼カメラ２〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜
	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");
	
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 10);
	WaitFade_();
	//-----
	
	SetMotion_(king, kg_talk, BLEND_XL);				// 会話
	WaitMotion(king);
	SetMotion_(king, kg_talk_L, BLEND_M);				// 会話LOOP
	
	//===============================================
	// ■キング
	// 「では　これから　そちに
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_037_MSG_020");
	KeyInputWait_();
	
	//-----------------------------------------------
	// ▽
	// 「見るがよい。このガケに　はばまれ
	//-----------------------------------------------
	ShowMsg_("DEMO_037_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(king, MOT_WAIT, BLEND_L);
	
	// ▼カメラ３〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	
	SetMotion_(player, MOT_WALK, BLEND_M);
	task_player = Task_RotateToPos_(player, GetPos_(maruta), ROTATE_DEMO_DEF);
	WaitTask(task_player);
	
	SetMotion_(player, MOT_WAIT, BLEND_M);
	DeleteTask_(task_player);
	
	WaitTask(task_cam);
	
	//===============================================
	// ■キング
	// 「しかし　そちの持つ　あばれうしどりならば
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_037_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	DeleteTask_(task_cam);
	
	// ▼カメラ４〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜
	SetPointCameraEye_("cameye003");
	SetPointCameraTarget_("camtgt003");
	
	//===============================================
	// ■キング
	// 「あれを見よ。あの丸太を　転がせば
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_037_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	//-----
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 10);
	WaitFade_();
	
	DeleteTask_(task_cam);
	
	// ▼カメラ５〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜
	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");
	
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 10);
	WaitFade_();
	
	SetMotion_(king, kg_talk, BLEND_XL);		// 会話
	WaitMotion(king);
	SetMotion_(king, kg_talk_L, BLEND_M);		// 会話LOOP
	//-----
	
	//===============================================
	// ■キング
	// 「頼む。そちが　あばれうしどりに乗って
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_037_MSG_060");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(king, MOT_WAIT, BLEND_XL);
	
	EndDemo(FADE_COLOR_BLACK);
}
