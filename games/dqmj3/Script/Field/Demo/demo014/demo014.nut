//=============================================
//
//		demo014[ノチョリンの頼み]
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
	local task_cam, task_player, task_nochoman;
	local msg_key00, msg_key01;

// ▼フラグ設定
	local bit_scout = GetEventFlg_("BFG_NOT_SUCCESS_SCOUT");		// BIT_1019 初回スカウト失敗フラグ

// ▼モデル読込
	// キャラクター
	local player = GetPlayerId_();					// 主人公
	local model_nochoman = ReadNpc_("n043");		// ノチョリン
	// エフェクト
	LoadEffect_("ef712_01_emo_notice01")			// 気付き01

// ▼配置
	// 主人公
	SetPointPos_(player, "player000");
	SetDir_(player, 160);
	SetFace_(player, "Face_eyes_close");
	// ノチョーラ
	local nochoman = ArrangePointNpc_(model_nochoman, "npc_nochoman000");
	SetDir_(nochoman, -20);

// ▼非常駐モーション読込
	// 主人公
	local Player_look_down_L = ReadMotion_(player, "Player_look_down_L");	// ノチョーラを見る
	// ノチョーラ
	local n000_feel_down = ReadMotion_(nochoman, "n000_feel_down");			// 通常会話→落ち込み
	local n000_feel_down_L = ReadMotion_(nochoman, "n000_feel_down_L");		// 落ち込みLOOP
	local n000_think02_L = ReadMotion_(nochoman, "n000_think02_L");			// 考える（腕組み）L
	local n000_arm_folde = ReadMotion_(nochoman, "n000_arm_folde");			// 考える（腕組み）→腕組み
	local n000_arm_folde_L = ReadMotion_(nochoman, "n000_arm_folde_L");		// 腕組みL
	local n000_talk_joy_L = ReadMotion_(nochoman, "n000_talk_joy_L");		// 軽く飛ぶような動き
	local n001_scary_L = ReadMotion_(nochoman, "n001_scary_L");				// 蹲りおびえる
	
// ▼初期モーション設定
	SetMotion_(player, Player_look_down_L, BLEND_N);

// ▼カメラ設定
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット1
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	StartDemo(FADE_COLOR_BLACK);
	
	SetMotion_(nochoman, MOT_TALK, BLEND_M);
	WaitMotion(nochoman);
	SetMotion_(nochoman, MOT_TALKLOOP, BLEND_M);
	
	// 勝利後にスカウトした場合
	if( bit_scout ) {
		msg_key00 = "DEMO_014_MSG_010";		// 「すごい　のみこみの 早さだっちょ！
		msg_key01 = "DEMO_014_MSG_020";		// 「しかし……オイラ　とんでもない逸材を
	}
	// 初回スカウトした場合
	else {
		msg_key00 = "DEMO_014_MSG_030";		// 「すごいちょ！　まさか　教えなくても
		msg_key01 = "DEMO_014_MSG_040";		// 「これは　とんでもない逸材を
	}
	
	//===============================================
	// *ノチョーラ
	// 分岐１
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_(msg_key00);
	KeyInputWait_();
	
	SetMotion_(nochoman, n000_think02_L, BLEND_L);		// 考える（腕組み）L
	//-----------------------------------------------
	// ▽
	// 分岐２
	//-----------------------------------------------
	ShowMsg_(msg_key01);
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	WaitTask(task_cam);
	Wait_(10);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット２
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetVisible(player, false);									//主人公非表示
	task_cam = Task_AnimeMoveCamera_("anmeye005", "anmtgt005");
	
	SetMotion_(nochoman, n000_arm_folde, BLEND_M);		// 考える（腕組み）→腕組み
	WaitMotion(nochoman);
	SetMotion_(nochoman, n000_arm_folde_L, BLEND_M);	// 腕組みL
	
	//===============================================
	// *ノチョーラ
	// 「オイラたちノチョーラに　そのチカラを　貸してはくれないかちょ？
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_014_MSG_050");
	KeyInputWait_();

	//-----------------------------------------------
	//「オイラたちは　趣味の機械いじりをしながら
	//　平和に暮らしていた　種族だったちょ。
	//-----------------------------------------------
	ShowMsg_("DEMO_014_MSG_060");
	KeyInputWait_();
	
	SetMotion_(nochoman, n000_feel_down, BLEND_M);									// 落ち込み
	task_nochoman = Task_ChangeMotion_(nochoman, n000_feel_down_L, BLEND_M);		// 落ち込みLOOP
	
	//-----------------------------------------------
	//「なのに　大食王ボーショックって魔物が
	//　オイラたちの　ウッドパークに来て……
	//-----------------------------------------------
	ShowMsg_("DEMO_014_MSG_070");
	KeyInputWait_();

	//-----------------------------------------------
	//「オイラたちを　さらって
	//　自分の要塞に　閉じ込めたんだちょ。
	//-----------------------------------------------
	ShowMsg_("DEMO_014_MSG_080");
	KeyInputWait_();
	CloseMsgWnd_();
	
	//===============================================
	
	WaitTask(task_cam);
	SetVisible(player, true);									//主人公非表示

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット３
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	
	//*ノチョリン
	//「なんとか　オイラは　命からがら
	//　逃げることが　できたっちょが……
	OpenMsgWnd_();
	ShowMsg_("DEMO_014_MSG_090");
	KeyInputWait_();
	
	//「まだ　オイラの仲間たちが
	//　大喰らいの要塞に　捕まってるんだっちょ。
	ShowMsg_("DEMO_014_MSG_100");
	KeyInputWait_();

	MotionTalk(nochoman);
	
	//-----------------------------------------------
	// ▽
	// 「オイラみんなを助けてやりたいちょ
	//-----------------------------------------------
	ShowMsg_("DEMO_014_MSG_110");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	DeleteTask_(task_cam);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット４
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");
		
	//===============================================
	// *ノチョーラ
	// 「だからそのためにお前の力を
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_014_MSG_120");
	KeyInputWait_();
	//-----------------------------------------------
	// ▽
	// 「その気になったら　この先にある
	//-----------------------------------------------
	ShowMsg_("DEMO_014_MSG_130");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetPointPos_(player, "player001");
	SetPointPos_(nochoman, "npc_nochoman001");
	
	SetMotion_(nochoman, MOT_WALK, BLEND_L);

	DeleteTask_(task_cam);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット５
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");

	task_nochoman = Task_RotateToPos_(nochoman, Vec3(550, 0, -621.0), 11.5);
	WaitTask(task_nochoman);
	DeleteTask_(task_nochoman);

	task_nochoman = Task_AnimeMove_(nochoman, "anm_nochoman001");

	Wait_(20);
	
	DeleteTask_(task_nochoman);
	
	task_nochoman = Task_RotateToPos_(nochoman, GetPos_(player), 11.5);
	WaitTask(task_nochoman);
	DeleteTask_(task_nochoman);
	
	SetMotion_(nochoman, n000_talk_joy_L, BLEND_L);		// 喜び
	
	//===============================================
	// *ノチョーラ
	// 「待ってるっちょ～
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_014_MSG_140");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(nochoman, MOT_WALK, BLEND_L);
	
	task_nochoman = Task_RotateToPos_(nochoman, Vec3(550, 0, -621.0), 11.5);
	WaitTask(task_nochoman);
	DeleteTask_(task_nochoman);
	
	task_nochoman = Task_MoveForward_(nochoman, 1.2, false);
	
	DeleteTask_(task_cam);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット６
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");
	
	Wait_(90);
	
	EndDemo(FADE_COLOR_BLACK);
}