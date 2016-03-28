//=============================================
//
//		demo129[エースが目を付けた機械]
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
	local efc_player;
	local rot_ace = Vec3(0, 0, -252.53227);

// ▼リソース読込
	// ギミック
	local model_mixture = ReadGimmick_("o_A01_02");			// 配合装置
	local model_lift = ReadGimmick_("o_A01_00");			// 配合装置
	// キャラクター
	local player = GetPlayerId_();					// 主人公
	local model_nocho = ReadNpc_("n000");			// 一般ノチョーラ
	local model_nocho_fe = ReadNpc_("n004");		// 一般ノチョーラ♀
	local model_jack = ReadNpc_("n001");			// ジャック
	local model_ace = ReadNpc_("n002");				// エース
	local model_king = ReadNpc_("n003");			// キング
	local model_queen = ReadNpc_("n005");			// クイーン
	local model_rin = ReadNpc_("n043");				// ノチョリン
	// エフェクト
	LoadEffect_("ef712_10_emo_surprise01");			// 「！」
	LoadEffect_("ef712_04_emo_joy01");				// 喜び「♪」


// ▼配置
	// 配合装置
	local mixture = ArrangePointGimmick_("o_A01_02", model_mixture, "obj000");
	SetMotion_(mixture, MOT_GIMMICK_0, BLEND_M);
	//エレベータ扉
	local lift01 = ArrangeGimmick_("o_A01_00", model_lift, Vec3(230.0, 2.0, 0.0));
	SetDir_(lift01, -90);
	SetMotion_(lift01, MOT_GIMMICK_0, BLEND_M);	

	local lift02 = ArrangeGimmick_("o_A01_00", model_lift, Vec3(-230.153, 2.0, 0.0));
	SetDir_(lift02, 90);
	SetMotion_(lift02, MOT_GIMMICK_0, BLEND_M);
	
	// 主人公
	SetPointPos_(player, "player000");
	// ノチョリン
	local nocho00 = ArrangePointNpc_(model_rin, "npc_nocho000");
	// ノチョーラ１♀
	local nocho01 = ArrangePointNpc_(model_nocho_fe, "npc_nocho001");
	// ノチョーラ２
	local nocho02 = ArrangePointNpc_(model_nocho, "npc_nocho002");
	// ノチョーラ３
	local nocho03 = ArrangePointNpc_(model_nocho, "npc_nocho003");
	// ノチョーラ４
	local nocho04 = ArrangePointNpc_(model_nocho, "npc_nocho004");
	// ノチョーラ５
	local nocho05 = ArrangePointNpc_(model_nocho, "npc_nocho005");
	// ノチョーラ６
	local nocho06 = ArrangePointNpc_(model_nocho, "npc_nocho006");
	// ノチョーラ７♀
	local nocho_fe = ArrangePointNpc_(model_nocho_fe, "npc_nocho_fe000");
	
	// ジャック
	local jack = ArrangePointNpc_(model_jack, "npc_jack000");
	// エース
	local ace = ArrangePointNpc_(model_ace, "npc_ace000");
	// キング
	local king = ArrangePointNpc_(model_king, "npc_king000");
	// クイーン
	local queen = ArrangePointNpc_(model_queen, "npc_queen000");

// ▼非常駐モーション読込
	// 主人公
	local pl_look_down = ReadMotion_(player, "Player_look_down_L");		// ノチョーラを見る
	local pl_nod = ReadMotion_(player, "Player_nod");					// 待機→うなづく→待機
	// エース
	local ac_talk_joy_L = ReadMotion_(ace, "n002_talk_joy_L");			// 会話　嬉しそう
	local ac_run_L = ReadMotion_(ace, "n001_run_L");					// エース　走る
	local ace_think = ReadMotion_(ace, "n002_think");					// エース考える
	local ace_think_L = ReadMotion_(ace, "n002_think_L");				// エース考えるL
	local ace_arm = ReadMotion_(ace, "n002_arm_folde");					// エース考える→腕組み
	local ace_arm_L = ReadMotion_(ace, "n002_arm_folde_L");				// エース腕組みL	
	local ac_joy = ReadMotion_(ace, "n000_jump_L");						// エース 飛び跳ね（喜び）
	// キング
	local kg_look_bldg_L = ReadMotion_(king, "n003_look_bldg_L");		// センタ－ビルを見るL
	local kg_look_jack_L = ReadMotion_(king, "n003_look_jack_L");		// ジャンクの方を見るL
	local kg_look_right_L = ReadMotion_(king, "n003_look_right_L");		// 右を向くL
	local kg_talk = ReadMotion_(king, "n003_talk");						// 待機→会話
	local kg_talk_L = ReadMotion_(king, "n003_talk_L");					// 会話
	local kg_think = ReadMotion_(king, "n003_think");					// 待機→考える
	local kg_think_L = ReadMotion_(king, "n003_think_L");				// 考えるL

	local nc02_joy = ReadMotion_(nocho02, "n002_talk_joy_L");			// モブノチョ2 喜び会話
	local nc03_joy = ReadMotion_(nocho03, "n002_talk_joy_L");			// モブノチョ3 喜び会話
	local ncfe_joy = ReadMotion_(nocho_fe, "n002_talk_joy_L");			// モブノチョ♀ 喜び会話

	local nc05_joy = ReadMotion_(nocho05, "n002_talk_joy_L");			// モブノチョ5 喜び会話
	local nc06_joy = ReadMotion_(nocho06, "n002_talk_joy_L");			// モブノチョ6 喜び会話

	
// ▼初期エフェクト
	//喜びエフェクト
	local nc02_ef_joy = SetSelectBoneEffect_("ef712_04_emo_joy01", nocho02, ATTACH_EFFECT1);
	local nc03_ef_joy = SetSelectBoneEffect_("ef712_04_emo_joy01", nocho03, ATTACH_EFFECT1);
	local ncfe_ef_joy = SetSelectBoneEffect_("ef712_04_emo_joy01", nocho_fe, ATTACH_EFFECT1);
	
	local nc05_ef_joy = SetSelectBoneEffect_("ef712_04_emo_joy01", nocho05, ATTACH_EFFECT1);
	local nc06_ef_joy = SetSelectBoneEffect_("ef712_04_emo_joy01", nocho06, ATTACH_EFFECT1);

// ▼初期モーション
	SetDirToObject_(nocho02, nocho_fe);										// モブ2メスの方へ
	SetMotion_(nocho02, MOT_TALKLOOP, BLEND_M);								// モブ2ふつう会話
	
	SetDirToObject_(nocho03, nocho_fe);										// モブ3メスの方へ
	SetMotion_(nocho03, MOT_TALKLOOP, BLEND_M);								// モブ3ふつう会話
	SetMotion_(nocho_fe, ncfe_joy, BLEND_M);								// モブ♀よろこび会話
	
	SetMotion_(nocho05, nc05_joy, BLEND_M);									// モブ5よろこび
	SetMotion_(nocho06, nc06_joy, BLEND_M);									// モブ6よろこび

// ▼カメラ設定
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");				// 100F

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	// ▼カット１～２＠キングダム全景～～～～～～～～～～～～～
	Wait_(60);
	
	//-----
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 10);
	WaitFade_();
	
	DeleteTask_(task_cam);
	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");			// 90F
	
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 10);
	//-----
	
	Wait_(80);
	
	//-----
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 10);
	WaitFade_();
	
	DeleteTask_(task_cam);
	
	//ノチョたち非表示
	SetVisible(nocho01, false);
	SetVisible(nocho02, false);
	SetVisible(nocho03, false);
	SetVisible(nocho04, false);
	SetVisible(nocho05, false);
	SetVisible(nocho06, false);
	SetVisible(nocho_fe, false);
	
	//エフェクト消去
	DeleteEffect_(nc02_ef_joy);
	DeleteEffect_(nc03_ef_joy);
	DeleteEffect_(ncfe_ef_joy);
	DeleteEffect_(nc05_ef_joy);
	DeleteEffect_(nc06_ef_joy);
	
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 10);
	//-----
	
	// ▼カット３＠キングの前に全員集合～～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");			// 100F
	
	SetMotion_(king, kg_look_bldg_L, 30);								// 左を向く
	Wait_(45);
	SetMotion_(king, kg_look_right_L, 30);								// 右を向く
	Wait_(45);
	SetMotion_(king, kg_talk, BLEND_XL);								// 会話
	WaitMotion(king);
	SetMotion_(king, kg_talk_L, BLEND_M);								// 会話LOOP
	
	//===============================================
	// ■キング
	// 「ビルの中に　人間の姿は　なかったらしい。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_129_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(king, MOT_WAIT, BLEND_XL);
	Wait_(10);
	
	task_ace = Task_WalkAroundToPos(ace, rot_ace, 3.0);
	WaitTask(task_ace);
	SetMotion_(ace, MOT_WAIT, BLEND_M);	
	DeleteTask_(task_ace);
	
	Wait_(20);
	
	// ▼カット４＠エースＵＰ～～～～～～～～～～～～～～～～～
	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");
	
	SetAlpha_(player, ALPHA_CLEAR);
	
	SetMotion_(ace, ace_think, BLEND_M);						// エース考える
	WaitMotion(ace);
	SetMotion_(ace, ace_think_L, BLEND_M);						// 考えるL
	
	//===============================================
	// ■エース
	// 「ビルの機能が　まだ生きていたことから　考えて
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_129_MSG_020");
	KeyInputWait_();
	
	SetMotion_(ace, ace_arm, BLEND_M);							// エース考える→腕組み
	WaitMotion(ace);
	SetMotion_(ace, ace_arm_L, BLEND_M);						// 腕組みL
	
	//-----------------------------------------------
	// ▽
	// 「じゃなきゃ　ここは　もっとボロボロのはずだ。
	//-----------------------------------------------
	ShowMsg_("DEMO_129_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	// ▼カット５＠配合装置ズームイン～～～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");		// 90F
	WaitTask(task_cam);
	
	DeleteTask_(task_cam);
	
	SetAlpha_(player, ALPHA_EXIST);
	SetDirToObject_(player, ace);
	
	// ▼カット６＠エースと主人公～～～～～～～～～～～～～～～
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	
	SetMotion_(player, pl_look_down, BLEND_M);						// ノチョーラを見る
	SetMotion_(ace, ac_talk_joy_L, BLEND_M);						// エース会話　嬉しそう
	
	//===============================================
	// ■エース
	//「ちょっと　調べてくるぜ。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_129_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(ace, ac_run_L, BLEND_M);								// 走る
	task_ace = Task_MoveForward_(ace, 0.8, true);
	Wait_(10);
	DeleteTask_(task_ace);
	
	task_ace = Task_AnimeMove_(ace, "npc_ace_move000");				// 90F
	
	// ▼カット７＠キングアップ～～～～～～～～～～～～～～～～
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	
	SetMotion_(king, kg_think, BLEND_M);							// 待機→考える
	WaitMotion(king);
	SetMotion_(king, kg_think_L, BLEND_M);							// 考えるLOOP
	
	//===============================================
	// ■キング
	// 「やれやれ……仕方のない奴だ。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_129_MSG_050");
	
	WaitTask(task_ace);
	SetDirToObject_(player, king);
	
	SetMotion_(ace, ac_joy, BLEND_M);								// エースよろこび
	DeleteTask_(task_ace);
	
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	// ▼カット８＠キングと主人公とノチョーラ～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");		// 300F
	
	SetMotion_(king, kg_talk, BLEND_XL);							// 会話
	WaitMotion(king);
	SetMotion_(king, kg_talk_L, BLEND_M);							// 会話LOOP
	
	//===============================================
	// ■キング
	// 「すまぬが　<name_player/>よ。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_129_MSG_060");
	KeyInputWait_();
//	CloseMsgWnd_();	
	//===============================================
	
	SetMotion_(king, kg_look_jack_L, BLEND_XL);						// ジャンクの方を見るL
	Wait_(10);
	
	//===============================================
	// ■キング
	// 「余たちは　他の場所を　調べてみよう。
	//-----------------------------------------------
//	OpenMsgWnd_();
//	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_129_MSG_070");
	KeyInputWait_();
	CloseMsgWnd_();	
	//===============================================
	
	SetMotion_(king, MOT_WAIT, BLEND_XL);
	Wait_(10);
	
	SetMotion_(player, pl_nod, BLEND_L);							// 待機→うなづく→待機
	WaitMotion(player);
	SetMotion_(player, MOT_WAIT, BLEND_L);
	
	EndDemo(FADE_COLOR_BLACK);
}
