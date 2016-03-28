//=============================================
//
//		demo130[その名は配合装置]
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
	local task_cam, task_player, task_ace;
	local efc_ace;

// ▼フラグ設定
	local bit_check_mix = GetEventFlg_("BFG_REACTER_POINT_021");		// Bit_1520 配合装置を調べたか

// ▼リソース読込
	// ギミック
	local model_mixture = ReadGimmick_("o_A01_02");	// 配合装置
	// キャラクター
	local player = GetPlayerId_();					// 主人公
	local model_ace = ReadNpc_("n002");				// エース
	// エフェクト
	LoadEffect_("ef712_01_emo_notice01");			// 気づき

// ▼配置
	// 配合装置
	local mixture = ArrangePointGimmick_("o_A01_02", model_mixture, "obj_mixture000");
	// 主人公
	SetPointPos_(player, "player000");
	// エース
	local ace = ArrangePointNpc_(model_ace, "npc_ace000");

// ▼非常駐モーション読込
	// 主人公
	local player_nod = ReadMotion_(player, "Player_nod");				// 待機→うなづく→待機
	local player_surprise = ReadMotion_(player, "Player_surprise");		// 通常待機→驚く
	local player_surprise_L = ReadMotion_(player, "Player_surprise_L");	// 驚くL
	// エース
	local ace_operate_L = ReadMotion_(ace, "n002_operate_L");			// 操作するL
	local ace_talk_joy_L = ReadMotion_(ace, "n002_talk_joy_L");			// 会話　嬉しそう
	local ace_jump = ReadMotion_(ace, "n002_jump");						// ジャンプ→待機
	local ace_hand_up = ReadMotion_(ace, "n002_hand_up");				// 会話→手をあげる
	local ace_hand_up_L = ReadMotion_(ace, "n002_hand_up_L");			// 手ををあげるL
	local ace_feel_down = ReadMotion_(ace, "n000_feel_down");			// 落ち込む
	local ace_feel_down_L = ReadMotion_(ace, "n000_feel_down_L");		// 落ち込むL
	local ace_impatience_L = ReadMotion_(ace, "n002_impatience_L");		// 焦るL

// ▼初期モーション設定
	SetMotion_(mixture, MOT_GIMMICK_0, BLEND_N);
	SetMotion_(player, MOT_WALK, BLEND_N);
	SetMotion_(ace, ace_operate_L, BLEND_N);							// 操作中

// ▼カメラ設定
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");			// 60F
	
	task_player = Task_MoveForward_(player, 1.0, false);

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	// ▼カット１＠主人公カットイン～～～～～～～～～～～～～
	WaitTask(task_cam);
	DeleteTask_(task_cam);
	
	SetMotion_(player, MOT_WAIT, BLEND_L);
	SetDirToObject_(player, ace);
	DeleteTask_(task_player);
	
	// ▼カット２＠主人公とエース～～～～～～～～～～～～～～
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	
	//===============================================
	// ■エース
	// 「ふむふむ……なるほどなるほど……。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_130_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(ace, ace_jump, BLEND_N);		// ジャンプ→待機
	task_ace = Task_RotateToPos_(ace, GetPos_(player), 22.9);
	WaitTask(task_ace);
	
	SetMotion_(ace, MOT_WAIT, BLEND_M);
	DeleteTask_(task_ace);
	
	//===============================================
	// ■エース
	// 「ってことはだ……！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_130_MSG_020");
	
	SetMotion_(player, player_surprise, BLEND_M);				// 待機→驚く
	WaitMotion(player);
	SetMotion_(player, player_surprise_L, BLEND_M);				// 驚くLOOP
	
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(ace, MOT_TALKLOOP, BLEND_N);
	SetMotion_(player, MOT_WAIT, BLEND_N);
	SetAlpha_(player, ALPHA_CLEAR);
	
	// ▼カット３＠エースズーム～～～～～～～～～～～～～～～
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
		
	//===============================================
	// ■エース
	// 「よろこべ　<name_player/>！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_130_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	// ▼カット４＠配合装置ＰＡＮ～～～～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");			// 120F
	
	// 【リアクターで配合装置を調べている場合】
	if(bit_check_mix)
	{
		//===============================================
		// ■エース
		// 「こいつは　モンスターマスターが　使っていた
		// （ページ送りなし）
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_ACE");
		ShowMsg_("DEMO_130_MSG_040");
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================
	}
	// 【リアクターで配合装置を調べていない場合】
	else
	{
		//===============================================
		// ■エース
		// 「こいつは　モンスターマスターが　使っていた
		// （ページ送りあり）
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_ACE");
		ShowMsg_("DEMO_130_MSG_080");
		KeyInputWait_();
		
		//-----------------------------------------------
		// ▽
		// 「この装置は　魔物と魔物を　配合して
		//-----------------------------------------------
		ShowMsg_("DEMO_130_MSG_090");
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================
		
		SetMotion_(ace, ace_talk_joy_L, BLEND_N);			// 会話　嬉しそう
	}
	
	
	DeleteTask_(task_cam);
	
	// ▼カット５＠エースＵＰ～～～～～～～～～～～～～～～～
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	
	// 【リアクターで配合装置を調べている場合】
	if(bit_check_mix)
	{
		efc_ace = SetSelectBoneEffect_("ef712_01_emo_notice01", ace, ATTACH_EFFECT1);	// 気づき
		SetMotion_(ace, ace_impatience_L, BLEND_XL);		// 焦るL
		Wait_(20);
		
		//===============================================
		// ■エース
		// 「えっ　知ってたって？
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_ACE");
		ShowMsg_("DEMO_130_MSG_050");
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================
		
		SetMotion_(ace, ace_feel_down, BLEND_M);		// 落ち込む
		WaitMotion(ace);
		SetMotion_(ace, ace_feel_down_L, BLEND_M);		// 落ち込むL
		
		//===============================================
		// ■エース
		// 「そ　そうか……知ってたか……。
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_ACE");
		ShowMsg_("DEMO_130_MSG_060");
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================
		
		Wait_(10);
		SetMotion_(ace, MOT_TALKLOOP, BLEND_XL);
		Wait_(10);
		
		//===============================================
		// ■エース
		// 「……ともかくだ。
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_ACE");
		ShowMsg_("DEMO_130_MSG_070");
		KeyInputWait_();
	}
	// 【リアクターで配合装置を調べていない場合】
	else
	{
		//===============================================
		// ■エース
		// 「うまく使えば　オメーの仲間を
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_ACE");
		ShowMsg_("DEMO_130_MSG_100");
		KeyInputWait_();
		
		SetMotion_(ace, ace_hand_up, BLEND_M);						// 会話→手をあげる
		WaitMotion(ace);
		SetMotion_(ace, ace_hand_up_L, BLEND_M);					// 手ををあげるL
	}
	
	//-----------------------------------------------
	// ▽
	// 「さっそく　動かしてみようぜ。
	//-----------------------------------------------
	ShowMsg_("DEMO_130_MSG_110");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetAlpha_(player, ALPHA_EXIST);
	SetMotion_(ace, MOT_TALKLOOP, BLEND_N);
	
	// ▼カット６＠主人公とエース～～～～～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");			// 200F
	
	//===============================================
	// ■エース
	// 「オメーは　その間に　キングから
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_130_MSG_120");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(ace, MOT_WAIT, BLEND_M);
	Wait_(10);
	
	SetMotion_(player, player_nod, BLEND_L);		// 待機→うなづく→待機
	Wait_(30);
	SetMotion_(player, MOT_WAIT, BLEND_L);
	
	EndDemo(FADE_COLOR_BLACK);
}
