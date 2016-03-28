//=============================================
//
//		demo831[故郷の星]
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
	local task_cam, task_player, task_rena, task_aroma, task_star;
	local task_aroma_step;
	local efc_player, efc_aroma, efc_star;

// ▼時間設定
	SetTime_(START_TIME_ZONE_NIGHT);

// ▼リソース読込
	// ギミック
	local model_base = ReadGimmick_("o_effect_base");	// エフェクトベース
	local model_reactor = ReadGimmick_("o_dem_07");		// リアクター
	// キャラクター
	local player = GetPlayerId_();						// 主人公
	local model_rena = ReadNpc_("n007");				// レナーテ
	local model_aroma = ReadNpc_("n018");				// アロマ
	// エフェクト
	LoadEffect_("ef712_10_emo_surprise01");				// 「！」
	LoadEffect_("ef712_04_emo_joy01");					// 喜び
	LoadEffect_("ef732_25_star_seed_base01");			// スターシード

// ▼配置
	// リアクター（主人公側）
	local reactor0 = ArrangeGimmick_("o_dem_07", model_reactor, false);
	SetScaleSilhouette(reactor0, 0.7, 0.7);
	SetMotion_(reactor0, MOT_GIMMICK_1, BLEND_N);
	// リアクター（アロマ側）
	local reactor1 = ArrangeGimmick_("o_dem_07", model_reactor, false);
	SetScaleSilhouette(reactor1, 0.7, 0.7);
	SetMotion_(reactor1, MOT_GIMMICK_1, BLEND_N);
	// スターシード（エフェクトベース）
	local star = ArrangePointGimmick_("o_effect_base", model_base, "obj_star000");
	SetPointPosNoFit_(star, "obj_star000");

	// 主人公
	SetPointPos_(player, "player000");
	// レナーテ
	local rena = ArrangePointNpc_(model_rena, "npc_rena000");
	SetStepSe_(rena, "SE_FLD_016");
	// アロマ
	local aroma = ArrangePointNpc_(model_aroma, "npc_aroma000");
	SetStepSe_(aroma, SILENT_STEP_SE);

// ▼非常駐モーション読込
	// 主人公
	local player_look_left_L = ReadMotion_(player, "Player_look_left_L");		// 左を向くL
	local player_look_right_L = ReadMotion_(player, "Player_look_right_L");		// 右を向くL
	local player_nod = ReadMotion_(player, "Player_nod");						// 頷く
	local player_exchange_L = ReadMotion_(player, "Player_exchange_reactor_L");	// リアクターを持つL
	local player_exchange = ReadMotion_(player, "Player_exchange_reactor");		// リアクターを渡す→待機
	// レナーテ
	local rena_look_left_L = ReadMotion_(rena, "n007_look_left_L");				// 左を向くL
	local rena_look_right_L = ReadMotion_(rena, "n007_look_right_L");			// 右を向くL
	local rena_talk01 = ReadMotion_(rena, "n007_talk01");						// 会話（手を胸にあてる）
	local rena_talk01_L = ReadMotion_(rena, "n007_talk01_L");					// 会話L（手を胸にあてる）
	// アロマ
	local aroma_look_up_L = ReadMotion_(aroma, "n018_look_up_L");				// 上を向くL
	local aroma_look_down_L = ReadMotion_(aroma, "n018_look_down_L");			// 下を向くL
	local aroma_look_right_L = ReadMotion_(aroma, "n018_look_right_L");			// 右を向くL
	local aroma_star_L = ReadMotion_(aroma, "n018_star_seed_L");				// スターシードを持つL
	local aroma_star_look_L = ReadMotion_(aroma, "n018_star_seed_look_L");		// スターシード見るL
	local aroma_exchange_L = ReadMotion_(aroma, "n018_exchange_reactor_L");		// リアクターを持つL
	local aroma_exchange = ReadMotion_(aroma, "n018_exchange_reactor");			// リアクターを渡す→待機

// ▼LOD読み込み
	ReadWaitingLod("lodeye000", "lodtgt000");

// ▼カメラ設定
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");		// 180F


//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);

	// ▼カット１＠アロマへズームイン～～～～～～～～～～～～～
	Wait_(35);
	task_aroma = Task_RotateToDir_(aroma, -65, 0.25);

	WaitTask(task_aroma);
	WaitTask(task_cam);
	Wait_(50);

	//---
	SetMotion_(player, MOT_WALK, BLEND_N);
	Wait_(5);
	SetMotion_(rena, MOT_WALK, BLEND_N);

	task_player = Task_MoveToPointSetSpeed_(player, "player001", 0.5);
	task_rena = Task_MoveToPointSetSpeed_(rena, "npc_rena001", 0.5);

	DeleteTask_(task_aroma);
	SetDir_(aroma, -90);
	//---


	// ▼カット２＠主人公とレナーテ、カメライン～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");		// 75F

	WaitTask(task_rena);
	SetMotion_(rena, MOT_WAIT, BLEND_L);
	WaitTask(task_player);
	SetMotion_(player, MOT_WAIT, BLEND_L);

	WaitTask(task_cam);
	Wait_(30);


	// ▼カット３＠アロマ、振り向く～～～～～～～～～～～～～～
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

	SurpriseDispSetOffset(aroma, Vec3(0, 2.1, 0), 0.5);
	Wait_(30);

	SetMotion_(aroma, MOT_WALK, BLEND_L);
	task_aroma = Task_RotateToDir_(aroma, 90, ROTATE_DEMO_DEF);
	task_aroma_step = Task_PlaySe_("SE_FLD_016", 15);
	WaitTask(task_aroma);
	SetMotion_(aroma, MOT_WAIT, BLEND_XL);
	Wait_(6);
	DeleteTask_(task_aroma_step);

	//---
	SetPointPos_(player, "player002");
	SetPointPos_(rena, "npc_rena002");

	SetMotion_(player, MOT_WALK, BLEND_N);
	Wait_(5);
	SetMotion_(rena, MOT_WALK, BLEND_N);

	task_player = Task_MoveToPointSetSpeed_(player, "player003", 0.5);
	Wait_(5);
	task_rena = Task_MoveToPointSetSpeed_(rena, "npc_rena003", 0.5);

	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	//---


	// ▼カット４＠主人公とレナーテ、カメライン～～～～～～～～
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");

	WaitTask(task_player);
	SetMotion_(player, MOT_WAIT, BLEND_L);

	WaitTask(task_rena);
	task_rena = Task_RotateToDir_(rena, -45, ROTATE_DEMO_DEF);
	WaitTask(task_rena);
	SetMotion_(rena, MOT_WAIT, BLEND_L);

	MotionTalk(aroma);

	//===============================================
	// ■アロマ
	// 「おっ！　やっと来たわね　ふたりとも。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_831_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(aroma, MOT_WAIT, 24);
	MotionTalk(rena);

	//===============================================
	// ■レナーテ
	// 「アロマ……何かあったの……？
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_831_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(rena, MOT_WAIT, BLEND_XL);
	Wait_(10);

	SetMotion_(aroma, aroma_look_down_L, BLEND_XL);		// 下を向くL
	Wait_(45);

	SetMotion_(aroma, MOT_WAIT, BLEND_XL);
	Wait_(22);
	SetMotion_(aroma, MOT_TALKLOOP, 14);

	//===============================================
	// ■アロマ
	// 「……移民も　だいぶ落ち着いて　ヒマになったら
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_831_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(aroma, MOT_WALK, BLEND_XL);
	task_aroma_step = Task_PlaySe_("SE_FLD_016", 15);
	Wait_(5);
	task_aroma = Task_RotateToDir_(aroma, -90, 3.25);
	WaitTask(task_aroma);
	SetMotion_(aroma, MOT_WAIT, 12);
	Wait_(14);
	DeleteTask_(task_aroma_step);

	SetVisible(rena, false);


	// ▼カット５＠アロマ、ＰＡＮＵＰ～～～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");		// 180F

	SetMotion_(aroma, aroma_look_up_L, 20);		// 上を向くL

	//===============================================
	// ■アロマ
	// 「かつて……アタシたちは　故郷の星を捨てた。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_831_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetVisible(player, false);
	SetVisible(rena, true);
	DeleteTask_(task_cam);


	// ▼カット６＠レナーテＵＰ～～～～～～～～～～～～～～～～
	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");

	SetMotion_(rena, rena_talk01, BLEND_M);		// 会話
	WaitMotion(rena);
	SetMotion_(rena, rena_talk01_L, BLEND_M);	// 会話L

	//===============================================
	// ■レナーテ
	// 「故郷の星……汚染が　広がっているわ。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_831_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(rena, MOT_WAIT, BLEND_N);
	SetVisible(rena, false);


	// ▼カット７＠アロマＵＰ～～～～～～～～～～～～～～～～～
	SetPointCameraEye_("cameye003");
	SetPointCameraTarget_("camtgt003");

	SetMotion_(aroma, MOT_WALK, BLEND_L);
	task_aroma = Task_RotateToDir_(aroma, 90, 4.5);
	task_aroma_step = Task_PlaySe_("SE_FLD_016", 15);
	WaitTask(task_aroma);
	DeleteTask_(task_aroma_step);
	SetMotion_(aroma, MOT_WAIT, BLEND_XL);

	//===============================================
	// ■アロマ
	// 「そうかもしれない……でも　見つけたのよ。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_831_MSG_060");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================


	// ▼カット８＠アロマＵＰ、スターシードが出現～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");		// 210F

	SetMotion_(aroma, aroma_star_look_L, 24);		// スターシード見るL
	Wait_(32);

	PlaySE_("SE_DEM_229");
	efc_star = SetSelectBoneEffect_("ef732_25_star_seed_base01", star, ATTACH_GLOBAL);
	SetEffectScale_(efc_star, 0.3);
	task_star = Task_AnimeMoveNoFit_(star, "anm_star000");

	//===============================================
	// ■アロマ
	// 「コールドスリープから目覚めた　学者たちと
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_831_MSG_070");
	KeyInputWait_();
	//-----------------------------------------------
	// ▽
	// 「<name_player/>の　戦闘データのおかげで
	//-----------------------------------------------
	ShowMsg_("DEMO_831_MSG_080");
	KeyInputWait_();
	//-----------------------------------------------
	// ▽
	// 「新しい　スターシードさえ　完成できれば
	//-----------------------------------------------
	ShowMsg_("DEMO_831_MSG_090");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	DeleteEffectEmitter_(efc_star);
	Wait_(30);
	SetMotion_(aroma, MOT_WAIT, 20);
	Wait_(28);

	SetVisible(player, true);
	SetVisible(rena, true);
	SetPointPos_(player, "player004");
	SetPointPos_(rena, "npc_rena004");
	DeleteTask_(task_cam);


	// ▼カット９＠主人公とレナーテとアロマ～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");		// 210F

	SetMotion_(aroma, aroma_look_up_L, BLEND_XL);		// 上を向くL
	Wait_(5);

	//===============================================
	// ■アロマ
	// 「そのためには当然……ブレイクワールドを
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_831_MSG_100");
	KeyInputWait_();
	SetMotion_(aroma, MOT_TALKLOOP, BLEND_XL);
	//-----------------------------------------------
	// ▽
	// 「ポイントゼロに　緊急脱出用のポッドが
	//-----------------------------------------------
	ShowMsg_("DEMO_831_MSG_110");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetVisible(player, false);
	SetVisible(rena, false);
	DeleteTask_(task_cam);


	// ▼カット10＠アロマＵＰ～～～～～～～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye005", "anmtgt005");		// 400F

	SetMotion_(aroma, aroma_look_down_L, BLEND_XL);		// 下を向くL
	Wait_(15);

	//===============================================
	// ■アロマ
	// 「それで……旅立つ前に　お願いがあるの。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_831_MSG_120");
	Wait_(20);
	SetMotion_(aroma, MOT_WAIT, BLEND_XL);
	Wait_(20);
	KeyInputWait_();
	SetMotion_(aroma, MOT_TALKLOOP, BLEND_XL);
	//-----------------------------------------------
	// ▽
	// 「センチメンタリズムというか……その……
	//-----------------------------------------------
	ShowMsg_("DEMO_831_MSG_130");
	KeyInputWait_();
	//-----------------------------------------------
	// ▽
	// 「だから……ね？
	//-----------------------------------------------
	ShowMsg_("DEMO_831_MSG_140");
	KeyInputWait_();


	// 【いいえ】を選択した場合
	while(GetQueryResult_() == QUERY2_1)
	{
		SetMotion_(aroma, MOT_WAIT, BLEND_XL);

		//-----------------------------------------------
		// ▽
		// 「あのさ……<name_player/>？
		//-----------------------------------------------
		ShowMsg_("DEMO_831_MSG_150");
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================

		Wait_(5);
		SurpriseDispSetOffset(aroma, Vec3(0, 0, 3.8), 0.4);
		Wait_(30);
		SetMotion_(aroma, MOT_TALKLOOP, BLEND_XL);

		//===============================================
		// ■アロマ
		// 「あっ！　もしかして　リアクターに保存した
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_AROMA");
		ShowMsg_("DEMO_831_MSG_160");
		KeyInputWait_();
		//-----------------------------------------------
		// ▽
		// 「それなら　心配要らないって。
		//-----------------------------------------------
		ShowMsg_("DEMO_831_MSG_170");
		KeyInputWait_();
		//-----------------------------------------------
		// ▽
		// 「だから　お願いよ。
		//-----------------------------------------------
		ShowMsg_("DEMO_831_MSG_180");
		KeyInputWait_();
	}


	//-----------------------------------------------
	// ▽
	// 「ありがとう！　それじゃ　中のデータとか
	//-----------------------------------------------
	ShowMsg_("DEMO_831_MSG_190");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	//----------
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);
	WaitFade_();

	DeleteTask_(task_cam);
	Wait_(10);
	PlaySE_("SE_FLD_054");
	Wait_(30);

	SetVisible(player, true);
	SetVisible(rena, true);

	SetPointPos_(player, "player005");
	SetPointPos_(rena, "npc_rena005");
	SetPointPos_(aroma, "npc_aroma001");

	SetMeshVisible_(player, "reactor_Model", false);
	SetMeshVisible_(aroma, "Model_2", false);

	// 【主人公】左手(EFFECT3)：貰う ／ 右手(EFFECT2)：渡す
	SetMotion_(player, player_exchange_L, BLEND_N);		// リアクターを持つL
	AttachObject_(player, reactor0, ATTACH_EFFECT2);

	// 【アロマ】左手(EFFECT2)：貰う ／ 右手(EFFECT1)：渡す
	SetMotion_(aroma, aroma_exchange_L, BLEND_N);		// リアクターを持つL
	AttachObject_(aroma, reactor1, ATTACH_EFFECT1);


	// ▼カット11＠アロマと主人公リアクター交換～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye006", "anmtgt006");		// 180F

	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);
	WaitFade_();
	//----------

	PlaySE_("SE_DEM_230");
	SetMotion_(player, player_exchange, BLEND_L);		// リアクターを渡す→待機
	SetMotion_(aroma, aroma_exchange, BLEND_L);			// リアクターを渡す→待機
	task_player = Task_ChangeMotion_(player, MOT_WAIT, BLEND_XL);
	task_aroma = Task_ChangeMotion_(aroma, MOT_WAIT, BLEND_XL);
	Wait_(45);

	DetachObject_(player);
	DetachObject_(aroma);
	AttachObject_(player, reactor1, ATTACH_EFFECT3);
	AttachObject_(aroma, reactor0, ATTACH_EFFECT2);
	Wait_(65);

	SetMeshVisible_(player, "reactor_Model", true);
	SetMeshVisible_(aroma, "Model_2", true);
	DetachObject_(player);
	DetachObject_(aroma);
	SetVisible(reactor0, false);
	SetVisible(reactor1, false);

	WaitTask(task_player);
	WaitTask(task_aroma);
	WaitTask(task_cam);
	Wait_(30);

	SetVisible(player, false);
	SetVisible(rena, false);


	// ▼カット12＠アロマＵＰ～～～～～～～～～～～～～～～～～
	SetPointCameraEye_("cameye004");
	SetPointCameraTarget_("camtgt004");
	SetFace_(aroma, "Face_smile");
	MotionTalk(aroma);

	//===============================================
	// ■アロマ
	// 「これ……大事に　するからさ。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_831_MSG_200");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(aroma, MOT_WAIT, BLEND_N);
	SetVisible(player, true);
	SetVisible(aroma, false);


	// ▼カット13＠主人公ＵＰ～～～～～～～～～～～～～～～～～
	SetPointCameraEye_("cameye005");
	SetPointCameraTarget_("camtgt005");

	SetMotion_(player, player_nod, BLEND_M);		// 頷く
	WaitMotion(player);
	SetMotion_(player, MOT_WAIT, BLEND_L);
	Wait_(10);

	SetVisible(player, false);
	SetVisible(aroma, true);


	// ▼カット14＠アロマＵＰ～～～～～～～～～～～～～～～～～
	SetPointCameraEye_("cameye004");
	SetPointCameraTarget_("camtgt004");

	MotionTalk(aroma);

	//===============================================
	// ■アロマ
	// 「よろしい！　それじゃ　行くわね。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_831_MSG_210");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(aroma, MOT_WALK, BLEND_XL);
	task_aroma_step = Task_PlaySe_("SE_FLD_016", 15);
	Wait_(5);

	task_aroma = Task_MoveForward_(aroma, 1.0, false);
	Wait_(30);

	//---
	SetVisible(player, true);
	SetVisible(rena, true);

	SetPointPos_(player, "player006");
	SetPointPos_(rena, "npc_rena006");
	SetPointPos_(aroma, "npc_aroma002");

	DeleteTask_(task_aroma);
	task_aroma = Task_MoveToPointSetSpeed_(aroma, "npc_aroma003", 0.5);

	SetMotion_(player, player_look_left_L, BLEND_N);
	SetMotion_(rena, rena_look_right_L, BLEND_N);
	//---


	// ▼カット15＠アロマ、カメライン～～～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye007", "anmtgt007");		// 120F
	Wait_(30);

	SetMotion_(player, MOT_WAIT, BLEND_XL);
	SetMotion_(rena, MOT_WAIT, BLEND_XL);
	Wait_(15);

	SetMotion_(player, player_look_right_L, BLEND_XL);
	SetMotion_(rena, rena_look_left_L, BLEND_XL);

	WaitTask(task_aroma);
	SetMotion_(aroma, MOT_WAIT, 20);
	Wait_(20);
	DeleteTask_(task_aroma_step);

	//===============================================
	// ■アロマ
	// 「いつか　故郷の星が　復活したら……
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_831_MSG_220");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetVisible(player, false);
	SetVisible(rena, false);
	DeleteTask_(task_cam);


	// ▼カット16＠アロマ、この場から去る～～～～～～～～～～～
	SetPointCameraEye_("cameye006");
	SetPointCameraTarget_("camtgt006");

	SetMotion_(aroma, aroma_look_right_L, BLEND_XL);		// 右を向くL
	Wait_(15);

	//===============================================
	// ■アロマ
	// 「宇宙の果てにある　壊れた世界を救った
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_831_MSG_230");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(aroma, MOT_WAIT, 20);
	Wait_(24);
	SetMotion_(aroma, MOT_WALK, BLEND_XL);
	task_aroma = Task_MoveForward_(aroma, 0.7, false);
	task_aroma_step = Task_PlaySe_("SE_FLD_016", 15);
	Wait_(30);

	EndDemo(FADE_COLOR_BLACK);
}
