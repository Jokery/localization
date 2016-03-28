//=============================================
//
//		demo021[キングの帰還]
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
	local task_cam, task_player, task_jack, task_king, task_foot;
	local efc_nocho100, efc_nocho200, efc_nocho400;
	local pos_jack = Vec3(-27.14326, 4.48512, -29.71423);		// 130°に向く

// ▼モデル読込
	// ギミック
	local model_monolith = ReadGimmick_("o_com_02");
	local monolith = ArrangePointGimmick_("o_com_02", model_monolith, "obj_monolith000");
	// キャラクター
	local player = GetPlayerId_();					// 主人公
	local model_jack = ReadNpc_("n001");			// ジャック
	local model_king = ReadNpc_("n003");			// キング
	local model_queen = ReadNpc_("n005");			// クイーン
	local model_ace = ReadNpc_("n002");				// エース
	local model_nocho = ReadNpc_("n000");			// ノチョ
	local model_nocho_f = ReadNpc_("n004");			// ノチョ♀
	local model_rin = ReadNpc_("n043");				// ノチョリン
	//エフェクト
	LoadEffect_("ef712_10_emo_surprise01");
	LoadEffect_("ef712_04_emo_joy01");

// ▼配置
	// 主人公
	SetPointPos_(player, "player000");
	// ジャック
	local jack = ArrangePointNpc_(model_jack, "npc_jack000");
	// キング
	local king = ArrangePointNpc_(model_king, "npc_king000");
	// クイーン
	local queen = ArrangePointNpc_(model_queen, "npc_queen000");
	// エース
	local ace = ArrangePointNpc_(model_ace, "npc_ace000");
	// ノチョーラ１
	local nocho000 = ArrangePointNpc_(model_rin, "npc_nocho000");
	// ノチョーラ２
	local nocho100 = ArrangePointNpc_(model_nocho, "npc_nocho100");
	// ノチョーラ３
	local nocho200 = ArrangePointNpc_(model_nocho_f, "npc_nocho200");
	// ノチョーラ４
	local nocho300 = ArrangePointNpc_(model_nocho_f, "npc_nocho300");
	// ノチョーラ５
	local nocho400 = ArrangePointNpc_(model_nocho, "npc_nocho400");

// ▼非常駐モーション読込
	// 主人公
	local player_look_walk_L = ReadMotion_(player, "Player_look_walk_L");	// キョロ
	// ジャック
	local jack_bow_talk = ReadMotion_(jack, "n001_talk01");			// ジャック頭を下げる→通常会話
	local jack_nod = ReadMotion_(jack, "n001_nod");					// ジャックうなづく
	// キング
	local king_look_jack = ReadMotion_(king, "n003_look_jack");		// キングジャック見つめる
	local king_look_jack_L = ReadMotion_(king, "n003_look_jack_L");	// キングジャック見つめる
	local king_think01 = ReadMotion_(king, "n003_think01");			// キング驚き→考える
	local king_think_L = ReadMotion_(king, "n003_think_L");			// キング考える
	local king_stand = ReadMotion_(king, "n003_stand01");			// キング考える→通常待機
	local king_talk = ReadMotion_(king, "n003_talk");				// キング待機→会話
	local king_talk_L = ReadMotion_(king, "n003_talk_L");			// キング会話L
	local king_stick_up = ReadMotion_(king, "n003_stick_up");		// キング待機→杖掲げ
	local king_stick_up_L = ReadMotion_(king, "n003_stick_up_L");	// キング杖掲げ
	local king_feeldown_L = ReadMotion_(king, "n003_feeldown_L");	// キング落ち込み
	// ノチョーラ
	local nocho100_talk_joy_L = ReadMotion_(nocho100, "n000_talk_joy_L");	// 会話（嬉しそう）L
	local nocho200_talk_joy_L = ReadMotion_(nocho200, "n000_talk_joy_L");	// 会話（嬉しそう）L
	local nocho400_talk_joy_L = ReadMotion_(nocho400, "n000_talk_joy_L");	// 会話（嬉しそう）L

// ▼初期モーション設定
	SetMotion_(king, king_look_jack_L, BLEND_N);
	SetMotion_(player, player_look_walk_L, BLEND_N);
	SetMotion_(nocho000, MOT_TALKLOOP, BLEND_N);
	SetMotion_(nocho100, nocho100_talk_joy_L, BLEND_N);
	SetMotion_(nocho200, nocho200_talk_joy_L, BLEND_N);
	SetMotion_(nocho300, MOT_TALKLOOP, BLEND_N);
	SetMotion_(nocho400, nocho400_talk_joy_L, BLEND_N);
	
	task_player = Task_MoveForward_(player, 1.0, false);
	task_foot = Task_PlaySe_("SE_FLD_015", 16);
	
// ▼エフェクト設定
	local efc_nocho200 = SetSelectBoneEffect_("ef712_04_emo_joy01", nocho200, ATTACH_EFFECT2);
	local efc_nocho100 = SetSelectBoneEffect_("ef712_04_emo_joy01", nocho100, ATTACH_EFFECT2);
	local efc_nocho400 = SetSelectBoneEffect_("ef712_04_emo_joy01", nocho400, ATTACH_EFFECT2);

// ▼カメラ設定
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------	
	
	// ▼カット１＠主人公キョロキョロ～～～～～～～～～～～～～
	StartDemo(FADE_COLOR_BLACK);
	Wait_(15);
	
	//++++++++++++++++++++++++++++++++++++++
	//◆クロスフェード
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 15);
	WaitFade_();
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 15);
	//++++++++++++++++++++++++++++++++++++++
	SetMotionSpeed_(player, 1.0);	
	SetMotion_(player, MOT_WAIT, BLEND_M);
	DeleteTask_(task_player);
	DeleteTask_(task_foot);
	
	// ▼カット２＠周りをぐるっと見渡す～～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");		// 210F
	WaitTask(task_cam);
	
	//++++++++++++++++++++++++++++++++++++++
	//◆クロスフェード
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 15);
	WaitFade_();
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 15);
	//++++++++++++++++++++++++++++++++++++++
	
	DeleteEffect_(efc_nocho100);
	DeleteEffect_(efc_nocho200);
	DeleteEffect_(efc_nocho400);
	
	DeleteTask_(task_cam);
	SetPointPos_(player, "player001");
	
	// ▼カット３＠主人公、キングの前へ歩く～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");		// 400F
	
	SetMotion_(player, MOT_WALK, BLEND_M);
	task_player = Task_MoveForward_(player, 1.0, false);
	Wait_(60);
	
	SetMotion_(player, MOT_WAIT, BLEND_M);
	DeleteTask_(task_player);
	
	MotionTalk(jack);
	
	SetMotion_(king, MOT_WAIT, BLEND_XL);
	
	task_jack = Task_WalkAroundToPos(jack, GetPos_(player), ROTATE_DEMO_DEF);
	WaitTask(task_jack);
	
	SetMotion_(jack, jack_bow_talk, BLEND_L);		// 頭を下げる→通常会話
	WaitMotion(jack);
	
	SetMotion_(jack, MOT_TALKLOOP, BLEND_M);
	
	//===============================================
	// ■ジャック
	// 「おお　<name_player/>どの！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_JACK");
	ShowMsg_("DEMO_021_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(jack, MOT_WAIT, BLEND_M);
	Wait_(20);
	DeleteTask_(task_cam);
	
	DeleteTask_(task_jack);
	
	// ▼カット４＠キングズームアップ～～～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");		// 400F
	
	SetMotion_(king, king_talk, BLEND_M);
	WaitMotion(king);
	SetMotion_(king, king_talk_L, BLEND_M);
	
	//===============================================
	// ■キング
	// 「では　<name_player/>よ。約束通り
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_021_MSG_020");
	KeyInputWait_();
	
	SetMotion_(king, king_think01, BLEND_L);
	task_king = Task_ChangeMotion_(king, king_think_L, BLEND_M);
	
	//-----------------------------------------------
	// ▽
	// 「かつて……余たち　ノチョーラ族は
	//-----------------------------------------------
	ShowMsg_("DEMO_021_MSG_030");
	KeyInputWait_();
	
	DeleteTask_(task_king);
	SetMotion_(king, king_stand, BLEND_L);
	SetMotionSpeed_(king, 2.5);	// モーションが早くなる
	WaitMotion(king);
	SetMotion_(king, king_talk, BLEND_L);
	SetMotionSpeed_(king, 1);	// モーションを元に戻す
	task_king = Task_ChangeMotion_(king, king_talk_L, BLEND_L);

	//-----------------------------------------------
	// ▽
	// 「しかし　ある時　闇に染まりし異形の魔物……
	//-----------------------------------------------
	ShowMsg_("DEMO_021_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	
	Wait_(20);
	DeleteTask_(task_cam);
	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");		// 120F
	
	//キング杖を上げる
	SetMotion_(king, king_stick_up, BLEND_N);
	WaitMotion(king);
	SetMotion_(king, king_stick_up_L, BLEND_L);
	
	//-----------------------------------------------
	// ▽
	// 「されど　闇あるところ　光あり。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_021_MSG_050");
	KeyInputWait_();
	
	SetMotion_(king, king_talk_L, BLEND_L);
	
	//-----------------------------------------------
	// ▽
	// 「リアクターを身に着け　ブレイクモンスターに
	//-----------------------------------------------
	ShowMsg_("DEMO_021_MSG_060");
	KeyInputWait_();
	
	//-----------------------------------------------
	// ▽
	// 「そして　そのレジスタンスの中には
	//-----------------------------------------------
	ShowMsg_("DEMO_021_MSG_070");
	KeyInputWait_();

	//-----------------------------------------------
	// ▽
	// 「ブレイクモンスターに　立ち向かった
	//-----------------------------------------------	
	ShowMsg_("DEMO_021_MSG_080");
	KeyInputWait_();
	
	SetMotion_(king, king_feeldown_L, BLEND_XL);
	//-----------------------------------------------
	// ▽
	// 「しかし……多勢に無勢。レジスタンスはついに
	//-----------------------------------------------
	ShowMsg_("DEMO_021_MSG_090");
	KeyInputWait_();
	
	//-----------------------------------------------
	// ▽
	// 「我らもまた　ブレイクモンスターに支配され
	//-----------------------------------------------
	ShowMsg_("DEMO_021_MSG_100");
	KeyInputWait_();
	CloseMsgWnd_();

	Wait_(20);

	SetAlpha_(nocho000, ALPHA_CLEAR);
	SetAlpha_(nocho100, ALPHA_CLEAR);
	SetAlpha_(nocho200, ALPHA_CLEAR);
	SetAlpha_(nocho300, ALPHA_CLEAR);
	SetAlpha_(nocho400, ALPHA_CLEAR);
	DeleteTask_(task_cam);
		
	// ▼カット５＠主人公アップ～～～～～～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye005", "anmtgt005");		// 80F
	
	//-----------------------------------------------
	// ▽
	// 「だが　まだ希望は残っていた！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_021_MSG_110");
	KeyInputWait_();

	//===============================================
	// ■キング
	// 「そちこそ　ブレイクモンスターを打ち滅ぼし
	//-----------------------------------------------
	ShowMsg_("DEMO_021_MSG_120");
	KeyInputWait_();
	CloseMsgWnd_();

	Wait_(20);
	DeleteTask_(task_cam);
	
	SetMotion_(king, king_talk_L, BLEND_N);
	
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");		// 400F
	
	//===============================================
	// ■キング
	// 「よいか　<name_player/>よ。これからも
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_021_MSG_130");
	KeyInputWait_();
	
	//-----------------------------------------------
	// ▽
	// 「そちの　秘めたるチカラの解放こそが
	//-----------------------------------------------
	ShowMsg_("DEMO_021_MSG_140");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	Wait_(20);
	DeleteTask_(task_cam);
	DeleteTask_(task_king);
	SetMotion_(king, king_look_jack, BLEND_L);
	task_king = Task_ChangeMotion_(king, king_look_jack_L, BLEND_M);
	
	// ▼カット８＠キング、ジャックに命令～～～～～～～～～～～
	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");

	task_jack = Task_WalkAroundToPos(jack, GetPos_(king), ROTATE_DEMO_DEF);
	WaitTask(task_jack);
	SetMotion_(jack, MOT_WAIT, BLEND_M);
	DeleteTask_(task_jack);
	Wait_(15);
	
	SurpriseDisp(jack);
	
	SetMotion_(jack, jack_nod, BLEND_M);
	WaitMotion(jack);
	
	SetMotion_(king, MOT_WAIT, BLEND_XL);
	
	task_jack = Task_WalkAroundToPos(jack, pos_jack, ROTATE_DEMO_DEF);
	WaitTask(task_jack);
	DeleteTask_(task_jack);
	
	task_jack = Task_MoveForward_(jack, 1.0, false);
	
	//フェードアウト===================================
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
	DeleteTask_(task_jack);
	SetMotion_(jack, MOT_WAIT, BLEND_M);
	SetMotion_(king, king_talk_L, BLEND_N);
	//=================================================
	
	// ▼カット９＠～～～～～～～～～～～～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");		// 180F
	
	SetPointPos_(jack, "npc_jack001");		//ジャック　モノリスの前へ移動
	//フェードイン===================================
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
	//=================================================
	
	//===============================================
	// ■キング
	// 「その手始めに　このウッドパークにある
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_021_MSG_150");
	KeyInputWait_();
	//-----------------------------------------------
	// ▽
	// 「聖地の名は　バーチャルコロシアム。
	//-----------------------------------------------
	ShowMsg_("DEMO_021_MSG_160");
	KeyInputWait_();

	//-----------------------------------------------
	// ▽
	// 「準備を整えたら　モノリスを調べるがよい。
	//-----------------------------------------------
	ShowMsg_("DEMO_021_MSG_170");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	WaitTask(task_cam);
	
	EndDemo(FADE_COLOR_BLACK);
}