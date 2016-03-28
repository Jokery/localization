//=============================================
//
//		demo127[カードキーBを探せ]
//
//=============================================
function Update()
{
// ▼変数定義
	local task_cam, task_player, task_ace;
	
// ▼フラグ設定
	local bit_ruler = GetEventFlg_("BFG_RULER_ADD_006");				// Bit_206  ルーラ追加フラグ センタービル　上層
	
// ▼リソース読込
	local player = GetPlayerId_();
	local model_ace = ReadNpc_("n002");									// エース
	
	local model_door = ReadGimmick_("o_A03_00");						// 電子ドア
	local model_ruler = ReadGimmick_("o_com_08");						// ルーラポイント
	
// ▼配置
	SetPointPos_(player, "player000");
	local ace = ArrangePointNpc_(model_ace, "npc_ace000");

	local door = ArrangePointGimmick_("o_A03_00", model_door, "obj_door000");	// 電子ドア
	local rura = ArrangePointGimmick_("o_com_08", model_ruler, "obj_rura000");	// ルーラ
	if (bit_ruler) { SetMotion_(rura, MOT_GIMMICK_2, BLEND_N); }				// →ルーラポイントが既に起動していた場合
	
// ▼非常駐モーション読込
	local ace_look_up_L = ReadMotion_(ace, "n002_look_up_L");		// エース怯え歩き
	local ace_feel_down = ReadMotion_(ace, "n000_feel_down");		// エース通常会話→落ち込み
	local ace_feel_down_L = ReadMotion_(ace, "n000_feel_down_L");	// エース落ち込みL
	
// ▼初期のモーション
	SetMotion_(player, MOT_WAIT, BLEND_N);
	SetMotion_(ace, ace_look_up_L, BLEND_N);
	
	SetManualCalcAlpha_(player, true);
	SetAlpha_(player, 1.0);

	SetManualCalcAlpha_(ace, true);
	SetAlpha_(ace, 1.0);
	
// ▼カメラ設定
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------
	
	StartDemo(FADE_COLOR_BLACK);

	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_127_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット2
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	DeleteTask_(task_cam);
	SetDir_(player, 0);

	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	
	SetMotion_(player, MOT_WALK, BLEND_M);
	SetMotion_(ace, MOT_WALK, BLEND_M);
	
	task_player = Task_RotateToPos_(player, GetPos_(ace), ROTATE_DEMO_DEF);
	task_ace = Task_RotateToPos_(ace, GetPos_(player), 17.2);
	
	WaitTask(task_player);
	SetMotion_(player, MOT_WAIT, BLEND_M);
	
	WaitTask(task_ace);
	SetMotion_(ace, MOT_WAIT, BLEND_M);
	
	SetMotion_(ace, ace_feel_down, BLEND_M);
	WaitMotion(ace);
	SetMotion_(ace, ace_feel_down_L, BLEND_M);
	
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_127_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	
	EndDemo(FADE_COLOR_BLACK);
}