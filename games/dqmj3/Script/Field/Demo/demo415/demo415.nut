//=============================================
//
//		demo415[爆破作戦の説明_3]
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
	local task_cam, task_player, task_rukiya;
	local efc_player, efc_anger, efc_rukiya;

// ▼リソース読込
	// キャラクター
	local player = GetPlayerId_();			// 主人公
	local n_rukiya = ReadNpc_("n009");		//ルキヤ

// ▼配置
	// 主人公
	SetPointPos_(player, "player");
	
	// ルキヤ
	local rukiya = ArrangePointNpc_(n_rukiya, "rukiya");

// ▼非常駐モーション読込
	local r_unn = ReadMotion_(rukiya, "n009_look_down_L");							// ルキヤ 下を向く
	local p_unn = ReadMotion_(player, "Player_nod");								// 主人公 頷く
	
	local task_kaiwa = Task_WalkAroundToPos(rukiya, GetPos_(player), 100.0);		// 主人公の方を向く
	local task_kaiwa = Task_WalkAroundToPos(player, GetPos_(rukiya), 100.0);		// 主人公の方を向く
	WaitTask(task_kaiwa);
	SetMotion_(player, MOT_WAIT, 1);
// ▼エフェクト読み込み
	LoadEffect_("ef733_01_sym_shuchusen01");												// 集中線

// ▼カメラ設定
	task_cam = Task_AnimeMoveCamera_("001_anmeye", "001_anmtgt");

	DeleteTask_(task_cam);	
//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------
	SetMotion_(rukiya, r_unn, 1);

	StartDemo(FADE_COLOR_BLACK);
	Wait_(30);

	SetMotion_(rukiya, MOT_WAIT, BLEND_L);
	Wait_(30);
	//===============================================
	// ■ルキヤ
	// 「今は　ちょいと劣勢だけど　あきらめてないよ。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RUKIYA");
	ShowMsg_("DEMO_415_MSG_010");
	Wait_(10);
	KeyInputWait_();
	//===============================================
	
	SetMotion_(rukiya, MOT_TALK, BLEND_M);
	task_cam = Task_AnimeMoveCamera_("001_anmeye", "001_anmtgt");
	SetFace_(rukiya, "Face_anger");
	PlaySE_("SE_DEM_026");	// ■SE:集中線
	efc_player = SetCameraEffect_("ef733_01_sym_shuchusen01", 100);					// 集中線表示
	WaitMotion(rukiya);
	SetMotion_(rukiya, MOT_TALKLOOP, BLEND_M);
	//===============================================
	// ■ルキヤ
	// 「さあ！　まずは　この監獄にある
	//-----------------------------------------------
	ShowMsg_("DEMO_415_MSG_020");
	Wait_(15);
	DeleteEffect_(efc_player);
	KeyInputWait_();
	//===============================================
	
	//===============================================
	// ■ルキヤ
	// 「ブレイクモンスターを生み出す
	//-----------------------------------------------
	ShowMsg_("DEMO_415_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetPointCameraEye_("002_cameye");
	SetPointCameraTarget_("002_camtgt");
	
	SetFace_(rukiya, "Face_default");
	//===============================================
	// ■ルキヤ
	// 「爆破の準備は　あたしがやっておくよ。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RUKIYA");
	ShowMsg_("DEMO_415_MSG_040");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	// ■ルキヤ
	// 「彼らは　この世界に住む仲間だからね。
	//-----------------------------------------------
	ShowMsg_("DEMO_415_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(rukiya, MOT_WAIT, BLEND_L);
	
	SetMotion_(player, p_unn, BLEND_XL)
	WaitMotion(player);
	SetMotion_(player, MOT_WAIT, BLEND_XL)
		Wait_(30);
	SetPointCameraEye_("001_cameye");
	SetPointCameraTarget_("001_camtgt");
	
	SetMotion_(rukiya, MOT_TALK, BLEND_M);
	WaitMotion(rukiya);
	SetMotion_(rukiya, MOT_TALKLOOP, BLEND_M);

	//===============================================
	// ■ルキヤ
	//「牢には　カギが　かかってるよ。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RUKIYA");
	ShowMsg_("DEMO_415_MSG_060");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	// ■ルキヤ
	// 「ろうやのカギなら　この先にある
	//-----------------------------------------------
	ShowMsg_("DEMO_415_MSG_070");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	SetMotion_(rukiya, MOT_WAIT, BLEND_L);
	Wait_(30);
	
	EndDemo(FADE_COLOR_BLACK);
}
