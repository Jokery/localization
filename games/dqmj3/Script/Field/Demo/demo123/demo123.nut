//=============================================
//
//		demo123[配合装置、試運転]
//
//=============================================
function Update()
{
// ▼変数定義
	local task_cam, task_player, task_ace;

// ▼リソース読込
	local model_mix = ReadGimmick_("o_A01_02");
	local model_lift = ReadGimmick_("o_A01_00");			// エレベータ扉
	local player = GetPlayerId_();
	local model_nocho = ReadNpc_("n043");		// ノチョリン
	local model_jack = ReadNpc_("n001");		// ジャック
	local model_ace = ReadNpc_("n002");			// エース
	local model_king = ReadNpc_("n003");		// キング
	LoadEffect_("ef712_10_emo_surprise01");		// 「！」

// ▼配置
	//エレベータ扉
	local lift01 = ArrangeGimmick_("o_A01_00", model_lift, Vec3(230.0, 2.0, 0.0));
	SetDir_(lift01, -90);
	SetMotion_(lift01, MOT_GIMMICK_0, BLEND_M);	

	local lift02 = ArrangeGimmick_("o_A01_00", model_lift, Vec3(-230.153, 2.0, 0.0));
	SetDir_(lift02, 90);
	SetMotion_(lift02, MOT_GIMMICK_0, BLEND_M);


	local mix = ArrangePointGimmick_("o_A01_02", model_mix, "obj_mix000");
	SetMotion_(mix, MOT_GIMMICK_0, BLEND_N);
	SetPointPos_(player, "player000");
	SetDir_(player, 180);
	local nocho = ArrangePointNpc_(model_nocho, "npc_nocho000");
	local jack = ArrangePointNpc_(model_jack, "npc_jack000");
	local ace = ArrangePointNpc_(model_ace, "npc_ace000");
	local king = ArrangePointNpc_(model_king, "npc_king000");

// ▼非常駐モーション読込
	local player_cage_look_L = ReadMotion_(player, "Player_cage_look_L");	// ケージの方を向く
	local player_nod = ReadMotion_(player, "Player_nod");					// 待機→うなづく→待機
	local ace_hand_up = ReadMotion_(ace, "n002_hand_up");					// 会話→手をあげる
	local ace_hand_up_L = ReadMotion_(ace, "n002_hand_up_L");				// 手をあげるL
	local ace_operate_L = ReadMotion_(ace, "n002_operate_L");				// 操作するL
	local king_think = ReadMotion_(king, "n003_think");						// キング待機→考える
	local king_think_L = ReadMotion_(king, "n003_think_L");					// キング考える
	local king_nod = ReadMotion_(king, "n003_nod");							// キング頷く
	local king_look_jack = ReadMotion_(king, "n003_look_jack");				// うなづく→ジャックの方を見る
	local king_look_jack_L = ReadMotion_(king, "n003_look_jack_L");			// ジャンクの方を見るL
	local king_stick_up = ReadMotion_(king, "n003_stick_up");				// キング待機→杖掲げ
	local king_stick_up_L = ReadMotion_(king, "n003_stick_up_L");			// キング杖掲げ
	local king_look_bldg = ReadMotion_(king, "n003_look_bldg");				// キング遠くを見る（センタービルを見るで代用）
	local king_look_bldg_L = ReadMotion_(king, "n003_look_bldg_L");			// キング遠くを見るL
	local king_surprise = ReadMotion_(king, "n003_surprise");				// キング驚き
	local king_surprise_L = ReadMotion_(king, "n003_surprise_L");			// キング驚き
	local king_talk = ReadMotion_(king, "n003_talk");						// 待機→会話
	local king_talk_L = ReadMotion_(king, "n003_talk_L");					// 会話L

// ▼初期のモーション
	SetMotion_(player, MOT_WALK, BLEND_N);
	SetManualCalcAlpha_(player, true);
	SetAlpha_(player, 1.0);
	SetMotion_(ace, MOT_WAIT, BLEND_N);
	SetManualCalcAlpha_(ace, true);
	SetAlpha_(ace, 1.0);
	SetMotion_(king, MOT_WAIT, BLEND_N);
	task_player = Task_MoveForward_(player, 1.0, false);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット1＠配合装置周辺をうつす
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");		// 400F

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);

	Wait_(60);
	DeleteTask_(task_player);
	SetMotion_(player, MOT_WAIT, BLEND_M);
	SurpriseDisp(ace);
	Wait_(30);
	SetMotion_(ace, MOT_WALK, BLEND_M);
	task_ace = Task_RotateToPos_(ace, GetPos_(player), ROTATE_DEMO_DEF);
	WaitTask(task_ace);
	DeleteTask_(task_ace);
	MotionTalk(ace);

	//===============================================
	// ■エース
	// 「どうやら　そろったみたいだな
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_123_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(ace, MOT_WALK, BLEND_M);
	task_ace = Task_RotateToPos_(ace, Vec3(-52.93951, 22.6533, -253.72496), ROTATE_DEMO_DEF);		// Dir = -140
	WaitTask(task_ace);
	SetMotion_(ace, ace_operate_L, BLEND_L);
	DeleteTask_(task_ace);
	Wait_(10);
	DeleteTask_(task_cam);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット2＠配合装置ズーム
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");		// 300F

	StartEarthQuake_(30, 3, 1);
	PlaySE_("SE_DEM_045");											//装置起動の画面揺れ	
	Wait_(30);
	SetMotion_(mix, MOT_GIMMICK_1, BLEND_M);
	Wait_(50);
	StartEarthQuake_(10, 5, 3);
	Wait_(129);
	SetMotion_(mix, MOT_GIMMICK_2, BLEND_M);
	Wait_(45);
	DeleteTask_(task_cam);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット3＠エースズーム
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");		// 300F

	SetMotion_(ace, MOT_WALK, BLEND_M);
	task_ace = Task_RotateToPos_(ace, Vec3(-13.0, 33.0, -323.0), ROTATE_DEMO_DEF);
	WaitTask(task_ace);
	DeleteTask_(task_ace);
	MotionTalk(ace);

	//===============================================
	// ■エース
	// 「よし……もう　いつでも配合できるぜ。
	// 　配合したくなったら　オレに　話しかけろよ。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_123_MSG_020");
	KeyInputWait_();
	task_ace = Task_WalkAroundToPos(ace, GetPos_(player), ROTATE_DEMO_DEF);		// エース主人公へ向く
	//-----------------------------------------------
	// ▽
	// 「それからな　配合した魔物は
	//　レベル１で生まれるってことを　覚えておけ。
	//-----------------------------------------------
	ShowMsg_("DEMO_123_MSG_030");
	WaitTask(task_ace);
	DeleteTask_(task_ace);
	MotionTalk(ace);
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(ace, MOT_WAIT, BLEND_L);				// エース待機
	Wait_(20);
	SetDir_(king, -100);
	SetDirToPos_(player, GetPos_(king));
	SetAlpha_(jack, ALPHA_CLEAR);
	SetAlpha_(nocho, ALPHA_CLEAR);
	DeleteTask_(task_cam);
	SetAlpha_(mix, 0.0);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット4＠キングと主人公の２ショット
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");		// 450F

	SetMotion_(king, king_nod, BLEND_N);							// キング頷く
	WaitMotion(king);
	SetMotion_(king, king_look_jack_L, BLEND_XL);					// ジャックの方を見るL

	//===============================================
	// ■キング
	// 「うむ……配合した直後は　まだ弱いのである。
	// 　場合によっては　苦戦しかねんのだ。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_123_MSG_040");
	KeyInputWait_();
	//-----------------------------------------------
	// ▽
	// 「きちんと　パーティ全体の　バランスを考えて
	// 　配合の計画を　立てねばいかんのである。
	//-----------------------------------------------
	ShowMsg_("DEMO_123_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(king, MOT_WAIT, BLEND_N);			// キング待機
	SetMotion_(ace, MOT_WAIT, BLEND_N);				// エース待機
	DeleteTask_(task_cam);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット5＠エースから主人公へ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");		// 300F

	MotionTalk(ace);								// エース会話

	//===============================================
	// ■エース
	// 「そういや　オメー　歓楽の霊道へ行くのか？
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_123_MSG_060");
	KeyInputWait_();
	//-----------------------------------------------
	// ▽
	// 「歓楽の霊道へは　西の移動装置から行ける。
	//-----------------------------------------------
	ShowMsg_("DEMO_123_MSG_070");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(ace, MOT_WAIT, BLEND_M);				// エース待機
	DeleteTask_(task_cam);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット6＠キングＵＰ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	task_cam = Task_AnimeMoveCamera_("anmeye005", "anmtgt005");		// 200F

	SetDirToObject_(king, player);
	SetMotion_(king, king_surprise, BLEND_M);			// 驚き
	WaitMotion(king);
	SetMotion_(king, king_surprise_L, BLEND_M);			// 驚きL

	//===============================================
	// ■キング
	// 「なんと！　エースよ！　それはレジスタンスの
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_123_MSG_080");
	KeyInputWait_();
	CloseMsgWnd_();	
	//===============================================

	DeleteTask_(task_cam);
	SetMotion_(ace, MOT_TALKLOOP, BLEND_N);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット7＠エースから主人公へ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");		// 300F

	//===============================================
	// ■エース
	// 「たぶんな。そいつが　<name_player/>の
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_123_MSG_090");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	DeleteTask_(task_cam);
	SetMotion_(king, king_talk_L, BLEND_N);			// 会話


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット8 キングと主人公
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");		// 450F	

	//===============================================
	// ■キング
	// 「ふむ……ルキヤは　生きているわけか……。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_123_MSG_100");
	KeyInputWait_();
	CloseMsgWnd_();	
	//===============================================

	SetMotion_(king, king_look_bldg_L, 20);		// 遠くを見るL
	Wait_(15);

	//===============================================
	// ■キング
	// 「<name_player/>よ……旅の空の下で……
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_123_MSG_110");
	KeyInputWait_();
	SetMotion_(king, king_talk, BLEND_XL);			// キング会話
	WaitMotion(king);
	SetMotion_(king, king_talk_L, BLEND_M);			// キング会話L
	//-----------------------------------------------
	// ▽
	// 「センタービルで　我ら　ノチョーラは
	//-----------------------------------------------
	ShowMsg_("DEMO_123_MSG_120");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(king, MOT_WAIT, BLEND_XL);
	DeleteTask_(task_cam);

	EndDemo(FADE_COLOR_BLACK);
}