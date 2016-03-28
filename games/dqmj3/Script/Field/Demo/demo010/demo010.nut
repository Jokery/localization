//=============================================
//
//		demo010[チュートリアル戦闘その２開始前]
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
	local task_cam;
	local efc_player;

// ▼モデル読込
	// キャラクター
	local player = GetPlayerId_();					// 主人公
	local model_nochoman = ReadNpc_("n043");		// ノチョリン
	// エフェクト
	LoadEffect_("ef742_01_div_mag_hoimi");			// 回復エフェクト
	
// ▼配置
	// 主人公
	SetPointPos_(player, "player000");
	SetDir_(player, 160);
	// ノチョーラ
	local nochoman = ArrangePointNpc_(model_nochoman, "npc_nochoman000");
	SetDir_(nochoman, -20);
	//表情の設定
	SetFace_(player, "Face_eyes_close");
	
// ▼非常駐モーション読込
	// ノチョーラ
	local n000_think_L = ReadMotion_(nochoman, "n000_think_L");			//考える（右向き）L
	local n000_talk_joy_L = ReadMotion_(nochoman, "n000_talk_joy_L");	//会話（嬉しそう）L
	local n000_think02_L = ReadMotion_(nochoman, "n000_think02_L");		//会話（嬉しそう）L
	local n002_hand_up = ReadMotion_(nochoman, "n002_hand_up");			//会話→手をあげる（エースのモーションの流用）
	local n002_hand_up_L = ReadMotion_(nochoman, "n002_hand_up_L");		//手をあげるL（エースのモーションの流用）

// ▼カメラ設定
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------
	SetMotion_(nochoman, n000_talk_joy_L, BLEND_N);		// ノチョーラ　よろこび	
	StartDemo(FADE_COLOR_BLACK);
	
	//===============================================
	// *ノチョーラ
	// 「ふおおお～！　すごいっちょ！
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_010_MSG_010");
	KeyInputWait_();
	SetMotion_(nochoman, n000_think_L, BLEND_L);		// ノチョーラ　考えている
	
	//-----------------------------------------------
	// ▽
	// 「でも　モンスターマスターのチカラってのは
	//-----------------------------------------------
	ShowMsg_("DEMO_010_MSG_020");
	KeyInputWait_();
	
	SetMotion_(nochoman, MOT_TALKLOOP, BLEND_M);
	//-----------------------------------------------
	// ▽
	// 「出会った魔物を　スカウトして
	//-----------------------------------------------
	ShowMsg_("DEMO_010_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();

	Wait_(10);
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット2
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	DeleteTask_(task_cam);

	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");

	SetMotion_(nochoman, n000_think02_L, BLEND_L);

	Wait_(10);

	//-----------------------------------------------
	// ▽
	// 「たしか　戦闘中に　スカウトを選んで
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_010_MSG_040");
	KeyInputWait_();
	
	SetMotion_(nochoman, MOT_TALKLOOP, BLEND_M);
	//-----------------------------------------------
	// ▽
	// 「そうすると　仲間が　こっちの強さを
	//-----------------------------------------------
	ShowMsg_("DEMO_010_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();

	Wait_(10);

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット3
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	DeleteTask_(task_cam);
	
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");
	SetMotion_(nochoman, n000_talk_joy_L, BLEND_M);		// ノチョーラ　楽しそうに会話
	
	//-----------------------------------------------
	// ▽
	// 「相手が強さを　みとめればスカウト成功。
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_010_MSG_060");
	KeyInputWait_();
	//-----------------------------------------------
	// ▽
	// 「うまくいかないで　相手を怒らせちゃったら
	//-----------------------------------------------
	ShowMsg_("DEMO_010_MSG_070");
	KeyInputWait_();
	
	SetMotion_(nochoman, n002_hand_up, BLEND_M);
	WaitMotion(nochoman);
	SetMotion_(nochoman, n002_hand_up_L, BLEND_M);
	//-----------------------------------------------
	// ▽
	// 「ともかく　根気よく　やるのが大事だちょ！
	//-----------------------------------------------
	ShowMsg_("DEMO_010_MSG_080");
	KeyInputWait_();
	CloseMsgWnd_();
		
	SetMotion_(nochoman, MOT_WAIT, BLEND_L);			// ノチョーラ　待機に戻す
	
	Wait_(20);
	
	//===============================================
	//システムメッセージ「全回復した
	//-----------------------------------------------	
	PlaySE_("SE_SHA_003");								//回復SE
	efc_player = SetSelectBoneEffect_("ef742_01_div_mag_hoimi", player, ATTACH_GLOBAL);		// 回復エフェクト

	OpenMsgWnd_();
	ShowMsg_("DEMO_010_MSG_090");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	EndDemo(FADE_COLOR_BLACK);
}