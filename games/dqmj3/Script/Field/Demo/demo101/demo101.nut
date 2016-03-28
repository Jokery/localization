//=============================================
//
//		demo101[目的地はセンタービル]
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
	local task_cam, task_player, task_nocho00, task_nocho01, task_nocho02, task_nocho03, task_jack;

// ▼モデル読込
	// ギミック
	local model_throne = ReadGimmick_("o_com_05");	// 玉座
	local model_shelter = ReadGimmick_("o_A00_03");	//シェルター
	local model_door = ReadGimmick_("o_A00_01");	// 扉
	local model_window = ReadGimmick_("o_A00_04");	// センタービルの窓ギミック
	local model_stele = ReadGimmick_("o_com_07");	// 特技石碑
	local model_ruler = ReadGimmick_("o_com_08");	// ルーラポイント
	
	// キャラクター
	local player = GetPlayerId_();					// 主人公
	local model_nocho = ReadNpc_("n000");			// 一般ノチョーラ
	local model_jack = ReadNpc_("n001");			// ジャック
	local model_king = ReadNpc_("n003");			// キング
	local model_queen = ReadNpc_("n005");			// クイーン
	local model_ace = ReadNpc_("n002");				// エース

// ▼配置
	// 玉座
	local throne = ArrangePointGimmick_("o_com_05", model_throne, "obj_throne000");
	// シェルター
	local shelter000 = ArrangePointGimmick_("o_A00_03", model_shelter, "obj_shelter000");
	local shelter001 = ArrangePointGimmick_("o_A00_03", model_shelter, "obj_shelter001");
	local shelter002 = ArrangePointGimmick_("o_A00_03", model_shelter, "obj_shelter002");
	local door000 = ArrangePointGimmick_("o_A00_01", model_door, "obj_door000");
	local door001 = ArrangePointGimmick_("o_A00_01", model_door, "obj_door001");
	// 窓
	local res_tele = ArrangePointGimmick_("o_A00_04", model_window, "gimmick000");
	SetMotion_(res_tele, MOT_GIMMICK_0, BLEND_N);	
	// 特技石碑
	local stele = ArrangePointGimmick_("o_com_07", model_stele, "obj_stele000");
	// ルーラポイント
	local ruler = ArrangePointGimmick_("o_com_08", model_ruler, "obj_ruler000");
	
	// 主人公
	SetPointPos_(player, "player000");
	// クイーン
	local nocho00 = ArrangePointNpc_(model_queen, "npc_nocho000");
	// エース
	local nocho03 = ArrangePointNpc_(model_ace, "npc_nocho003");
	// ジャック
	local jack = ArrangePointNpc_(model_jack, "npc_jack000");
	// キング
	local king = ArrangePointNpc_(model_king, "npc_king000");
	// ノチョーラ２
	local nocho01 = ArrangePointNpc_(model_nocho, "npc_nocho001");
	// ノチョーラ３
	local nocho02 = ArrangePointNpc_(model_nocho, "npc_nocho002");

// ▼非常駐モーション読込
	local player_look_right = ReadMotion_(player, "Player_look_right_L");			// 待機→センタービルを見る	

	
	// キング
	local kng_look_bldg = ReadMotion_(king, "n003_look_bldg");			// 待機→センタービルを見る
	local kng_look_bldg_L = ReadMotion_(king, "n003_look_bldg_L");		// センタービルを見るL
	local kng_talk = ReadMotion_(king, "n003_talk");					// 待機→会話
	local kng_talkL = ReadMotion_(king, "n003_talk_L");					// 会話L

// ▼カメラ設定
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");			// 210F

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	// ▼カット１～２＠崩落都市全景～～～～～～～～～～～～～～
	Wait_(170);
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 10);
	WaitFade_();
	DeleteTask_(task_cam);
	
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");			// 210F
	
	// クロスフェード
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 10);
	
	Wait_(180);
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);
	WaitFade_();
	DeleteTask_(task_cam);
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);
	
	// ▼カット４＠主人公カメライン～～～～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");			// 90F
	
	SetMotion_(player, MOT_WALK, BLEND_N);
	task_player = Task_MoveForward_(player, 1.0, false);
	Wait_(70);
	
	SetMotion_(player, MOT_WAIT, BLEND_M);
	DeleteTask_(task_player);
	
	Wait_(10);
	
	SetMotion_(king, kng_talk, BLEND_M);
	WaitMotion(king);
	SetMotion_(king, kng_talkL, BLEND_M);
	
	//===============================================
	// ■キング
	// 「来たであるか　<name_player/>。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_101_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	// クロスフェード
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 10);
	WaitFade_();
	
	DeleteTask_(task_cam);
	
	// ▼カット４＠センタービル写す～～～～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");		// 520F
	
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 10);
	
	// 全員センタービルの方を見る
	SetMotion_(king, kng_look_bldg, BLEND_M);						// 待機→センタービルを見る
	Wait_(5);
	
	SetMotion_(player, MOT_WALK, BLEND_M);
	task_player = Task_RotateToPos_(player, GetPos_(res_tele), ROTATE_DEMO_DEF);
	Wait_(3);
	task_jack = Task_RotateToPos_(jack, GetPos_(res_tele), ROTATE_DEMO_DEF);
	Wait_(3);
	
	SetMotion_(nocho00, MOT_WALK, BLEND_M);							//クイーン振り向き
	task_nocho00 = Task_RotateToPos_(nocho00, GetPos_(res_tele), ROTATE_DEMO_DEF);
	WaitTask(task_nocho00);
	SetMotion_(nocho00, MOT_WAIT, BLEND_M);

	WaitTask(task_player);
	SetMotion_(player, MOT_WAIT, BLEND_M);
	
	WaitMotion(king);
	SetMotion_(king, kng_look_bldg_L, BLEND_M);						// センタービルを見るLOOP
	
	//===============================================
	// ■キング
	// 「あれは　センタービルという。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_101_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	//===============================================
	// ■ジャック
	// 「ううむ……人の気配が　しませんな。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_JACK");
	ShowMsg_("DEMO_101_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	Wait_(10);
	
	//===============================================
	// ■キング
	// 「……だとしても　この目で　たしかめたい。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_101_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	//-----------------------------------------------

	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);
	WaitFade_();
	DeleteTask_(task_cam);
	
	SetMotion_(king, kng_talk, BLEND_M);
	WaitMotion(king);
	SetMotion_(king, kng_talkL, BLEND_M);
	
	// ▼カメラ設定 キングアップ
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);
	
	Wait_(10);	
	
	//===============================================
	// ■キング
	// 「そちも　来てくれぬか？
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_101_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	EndDemo(FADE_COLOR_BLACK);
}
