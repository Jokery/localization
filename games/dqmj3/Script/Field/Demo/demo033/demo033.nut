//=============================================
//
//		demo033[あばれうしどりを探しに]
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
	local task_cam, task_player;

// ▼リソース読込
	// キャラクター
	local player = GetPlayerId_();
	local model_jack = ReadNpc_("n001");		// ジャック
	local model_king = ReadNpc_("n003");		// キング
	local model_queen = ReadNpc_("n005");		// クイーン
	// エフェクト
	LoadEffect_("ef712_10_emo_surprise01");

// ▼配置
	// 主人公
	SetPointPos_(player, "player000");
	// キング
	local king = ArrangePointNpc_(model_king, "npc_king000");
	// ジャック
	local jack = ArrangePointNpc_(model_jack, "npc_jack000");
	// クイーン
	local queen = ArrangePointNpc_(model_queen, "npc_queen000");

// ▼非常駐モーション読込
	local pl_talk = ReadMotion_(player, "Player_talk");				// 会話
	local pl_talk_L = ReadMotion_(player, "Player_talk_L");			// 会話L
	local king_talk = ReadMotion_(king, "n003_talk");				// キング　待機→会話
	local king_talk_L = ReadMotion_(king, "n003_talk_L");			// キング　会話
	local king_stick = ReadMotion_(king, "n003_stick_up");			// キング　待機→杖掲げ
	local king_stick_L = ReadMotion_(king, "n003_stick_up_L");		// キング　杖掲げ
	local king_think = ReadMotion_(king, "n003_think");				// キング　待機→考える
	local king_think_L = ReadMotion_(king, "n003_think_L");			// キング　考える
	local king_surprise = ReadMotion_(king, "n003_surprise");		// キング　通常待機→驚き
	local king_surprise_L = ReadMotion_(king, "n003_surprise_L");	// キング　驚きL

// ▼カメラ設定
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	SetMotion_(king, king_talk_L, BLEND_XL);
	
	//===============================================
	// ■キング
	// 「おお　戻ったか　<name_player/>よ。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_033_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(king, MOT_WAIT, BLEND_XL);
	
	SetMotion_(player, pl_talk, BLEND_M);		// 会話
	WaitMotion(player);
	SetMotion_(player, pl_talk_L, BLEND_M);		// 会話LOOP
	Wait_(60);
	SetMotion_(player, MOT_WAIT, BLEND_L);
	
	SetMotion_(king, king_think, BLEND_M);		// 考える
	WaitMotion(king);
	SetMotion_(king, king_think_L, BLEND_M);	// 考えるLOOP
	
	//===============================================
	// ■キング
	// 「なるほど……フィールドライドという
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_033_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	Wait_(20);
	
	DeleteTask_(task_cam);
	SetAlpha_(player, ALPHA_CLEAR);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット２
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	
	//-----------------------------------------------
	// ▽
	// 「やはり　そちには　秘めたるチカラが
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_033_MSG_030");
	KeyInputWait_();
	
	SetMotion_(king, king_talk_L, BLEND_XL);
	
	//-----------------------------------------------
	// ▽
	// 「……時に　<name_player/>よ。
	//-----------------------------------------------
	ShowMsg_("DEMO_033_MSG_040");
	KeyInputWait_();
	
	//-----------------------------------------------
	// ▽
	// 「あばれうしどりという魔物を
	//-----------------------------------------------
	ShowMsg_("DEMO_033_MSG_050");
	KeyInputWait_();
	
	SetMotion_(king, king_stick, BLEND_M);
	WaitMotion(king);
	SetMotion_(king, king_stick_L, BLEND_M);
	
	//-----------------------------------------------
	// ▽
	// 「あばれうしどりは　ここからまず東に
	//-----------------------------------------------
	ShowMsg_("DEMO_033_MSG_060");
	KeyInputWait_();
	//-----------------------------------------------
	// ▽
	// 「仲間にしたら　あばれうしどりに乗ったまま
	//-----------------------------------------------
	
	ShowMsg_("DEMO_033_MSG_070");
	KeyInputWait_();
	CloseMsgWnd_()
	
	EndDemo(FADE_COLOR_BLACK);
}
