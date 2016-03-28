//=============================================
//
//		demo034[ノチョーラの移民計画]
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
	local task_cam, task_king;
	local efc_cam;
	local abare_kind = 157;			// 種族ＩＤ:あばれうしどり
	
// ▼リソース読込
	// キャラクター
	local player = GetPlayerId_();				// 主人公
	local model_nocho_m = ReadNpc_("n000");		// ノチョーラ　汎用　男
	local model_jack = ReadNpc_("n001");		// ジャック
	local model_king = ReadNpc_("n003");		// キング
	local model_nocho_f = ReadNpc_("n004");		// ノチョーラ　汎用　女
	local model_queen = ReadNpc_("n005");		// クイーン
	local model_abare = ReadNpc_("m051_00");	// あばれうしどり
	local model_rin = ReadNpc_("n043");			// ノチョリン

	// エフェクト
	LoadEffect_("ef712_04_emo_joy01");			// 「♪」
	LoadEffect_("ef733_01_sym_shuchusen01");			// 集中線
	
// ▼配置
	// 主人公
	SetPointPos_(player, "player000");
	SetFace_(player, "Face_eyes_close");
	// ジャック
	local jack = ArrangePointNpc_(model_jack, "npc_jack000");
	// キング
	local king = ArrangePointNpc_(model_king, "npc_king000");
	// クイーン
	local queen = ArrangePointNpc_(model_queen, "npc_queen000");
	// ノチョーラ
	local nocho00 = ArrangePointNpc_(model_nocho_m, "npc_nocho000");
	local nocho01 = ArrangePointNpc_(model_rin, "npc_nocho100");
	local nocho02 = ArrangePointNpc_(model_nocho_m, "npc_nocho200");
	local nocho03 = ArrangePointNpc_(model_nocho_f, "npc_nocho300");
	local nocho04 = ArrangePointNpc_(model_nocho_m, "npc_nocho400");
	local nocho05 = ArrangePointNpc_(model_nocho_m, "npc_nocho500");
	// あばれうしどり
	local abare = ArrangePointNpc_(model_abare, "npc_abare000");
	SetScaleSilhouette(abare, SCALE.N, SILHOUETTE_WIDTH.N);
	
// ▼非常駐モーション読込
	local nocho00_jump_L = ReadMotion_(nocho00, "n000_jump_L");			// ノチョーラ１飛び跳ね
	local nocho01_jump_L = ReadMotion_(nocho01, "n000_jump_L");			// ノチョーラ２飛び跳ね
	local nocho02_jump_L = ReadMotion_(nocho02, "n000_jump_L");			// ノチョーラ３飛び跳ね
	local nocho03_jump_L = ReadMotion_(nocho03, "n000_jump_L");			// ノチョーラ４飛び跳ね
	local nocho04_jump_L = ReadMotion_(nocho04, "n000_jump_L");			// ノチョーラ５飛び跳ね
	local nocho05_jump_L = ReadMotion_(nocho05, "n000_jump_L");			// ノチョーラ６飛び跳ね
	local king_talk = ReadMotion_(king, "n003_talk");					// キング待機→会話
	local king_talk_L = ReadMotion_(king, "n003_talk_L");				// キング会話
	local king_think = ReadMotion_(king, "n003_think");					// キング待機→考える
	local king_think_L = ReadMotion_(king, "n003_think_L");				// キング考える
	local king_stick_up = ReadMotion_(king, "n003_stick_up");			// キング待機→杖掲げ
	local king_stick_up_L = ReadMotion_(king, "n003_stick_up_L");		// キング杖掲げ
	local king_nod = ReadMotion_(king, "n003_nod");						// キングうなづく
	local king_feeldown_L = ReadMotion_(king, "n003_feeldown_L");		// キング落ち込み
	
// ▼エフェクト設定


// ▼モーション設定
	RideOn_(player, abare, abare_kind, SIZE_N);
	Wait_(15);//ライド完了待ち
	SetMotion_(king, king_talk_L, BLEND_N);

// ▼カメラ設定
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");		// 150F

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	// ▼カット１＠～～～～～～～～～～～～～～～～～～～～～～
	
	//===============================================
	// ■キング
	// 「ふむ。じつに見事な　あばれうしどりである。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_034_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(king, king_nod, BLEND_XL);
	Wait_(50);
	
	SetMotion_(king, king_talk, BLEND_M);
	task_king = Task_ChangeMotion_(king, king_talk_L, BLEND_M);
	
	DeleteTask_(task_cam);
	
	// ▼カット２＠キングへＰＡＮ～～～～～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");		// 300F
	
	//===============================================
	// ■キング
	// 「時は　来たれり……。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_034_MSG_020");
	KeyInputWait_();
	
	//-----------------------------------------------
	// ▽
	// 「<name_player/>よ。我らノチョーラは
	//-----------------------------------------------
	ShowMsg_("DEMO_034_MSG_030");
	KeyInputWait_();
	
	SetMotion_(king, king_feeldown_L, BLEND_XL);		// 落ち込み
	
	//-----------------------------------------------
	// ▽
	// 「されど　ブレイクモンスターが出現してから
	//-----------------------------------------------
	ShowMsg_("DEMO_034_MSG_040");
	KeyInputWait_();
	
	//-----------------------------------------------
	// ▽
	// 「奴らがガケを崩し　人間の都市へ行くための
	//-----------------------------------------------
	ShowMsg_("DEMO_034_MSG_050");
	KeyInputWait_();
	
	//-----------------------------------------------
	// ▽
	// 「それゆえ　余は　人間たちの住んでいた都市が
	//-----------------------------------------------
	ShowMsg_("DEMO_034_MSG_060");
	KeyInputWait_();
	
	//-----------------------------------------------
	// ▽
	// 「だが……今や　この地は　空の孤島。ガケを越え
	//-----------------------------------------------
	ShowMsg_("DEMO_034_MSG_070");
	KeyInputWait_();
	CloseMsgWnd_();
	
	Wait_(20);
	
	DeleteTask_(task_king);
	SetMotion_(king, king_talk, BLEND_XL);				// 会話
	task_king = Task_ChangeMotion_(king, king_talk_L, BLEND_M);
	
	DeleteTask_(task_cam);
	SetAlpha_(queen, ALPHA_CLEAR);
	
	// ▼カット３＠あばれうしどりを映す～～～～～～～～～～～～
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	
	//-----------------------------------------------
	// ▽
	// 「そう思っていた　ある日……余は見たのだ。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_034_MSG_080");
	KeyInputWait_();
	
	//-----------------------------------------------
	// ▽
	// 「そして　余は思ったのだ！　そちならば
	//-----------------------------------------------
	ShowMsg_("DEMO_034_MSG_090");
	KeyInputWait_();
	CloseMsgWnd_();
	Wait_(20);
	
	SetAlpha_(queen, ALPHA_EXIST);
	
	// ▼カット４＠キングをを映す～～～～～～～～～～～～～～～
	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");
	
	local joy_nocho00 = SetSelectBoneEffect_("ef712_04_emo_joy01", nocho00, ATTACH_EFFECT2);
	local joy_nocho01 = SetSelectBoneEffect_("ef712_04_emo_joy01", nocho01, ATTACH_EFFECT2);
	local joy_nocho02 = SetSelectBoneEffect_("ef712_04_emo_joy01", nocho02, ATTACH_EFFECT2);
	local joy_nocho03 = SetSelectBoneEffect_("ef712_04_emo_joy01", nocho03, ATTACH_EFFECT2);
	local joy_nocho04 = SetSelectBoneEffect_("ef712_04_emo_joy01", nocho04, ATTACH_EFFECT2);
	local joy_nocho05 = SetSelectBoneEffect_("ef712_04_emo_joy01", nocho05, ATTACH_EFFECT2);
	
	SetMotion_(king, king_stick_up, BLEND_M);
	WaitMotion(king);
	SetMotion_(king, king_stick_up_L, BLEND_M);
	
	//-----------------------------------------------
	// ▽
	// 「<name_player/>よ！　そのあばれうしどりで
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_034_MSG_100");
	KeyInputWait_();
	
	//-----------------------------------------------
	// ▽
	// 「ノチョーラの　一族たちよ！
	//-----------------------------------------------
	ShowMsg_("DEMO_034_MSG_110");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	DeleteTask_(task_cam);
	
	// ▼カット５＠ズームアウト～～～～～～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");		// 60F
	
	PlaySE_("SE_DEM_027");											//ノチョーラ喜びSE
	
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", CAMERA_DEF);	// 集中線
	
	// モーション再生タイミングをバラバラにする
	SetMotion_(nocho00, nocho00_jump_L, BLEND_M);
	Wait_(3);
	SetMotion_(nocho01, nocho01_jump_L, BLEND_M);
	Wait_(3);
	SetMotion_(nocho02, nocho02_jump_L, BLEND_M);
	Wait_(3);
	SetMotion_(nocho03, nocho03_jump_L, BLEND_M);
	Wait_(3);
	SetMotion_(nocho04, nocho04_jump_L, BLEND_M);
	Wait_(3);
	SetMotion_(nocho05, nocho05_jump_L, BLEND_M);
	
	//===============================================
	// ■キング
	// 「最初に目指すは　ウッドパークの北のガケだ！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_034_MSG_120");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	DeleteEffect_(efc_cam);
	
	EndDemo(FADE_COLOR_BLACK);
}
