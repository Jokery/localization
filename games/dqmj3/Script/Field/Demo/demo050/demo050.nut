//=============================================
//
//		demo050[楽園からの脱出_1(残骸)]
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
	local task_cam, task_player, task_rena;
	local efc_player, efc_rena;

// ▼リソース読込
	// キャラクター
	local player = GetPlayerId_();												// 主人公
	local npc_rena = ReadNpc_("n007");											// レナーテ
	local model_rena = ReadNpc_("n034");										// ホログラムレナーテ

// ▼配置
	// 主人公
	SetPointPos_(player, "player000");
	// レナーテ
	local rena = ArrangePointNpc_(npc_rena, "npc_renerte000");
	// ホログラムレナーテ
	local holo_rena = ArrangePointNpc_(model_rena, "npc_renerte000");
	SetStepSe_(holo_rena, SILENT_STEP_SE);										// 足音を無音にする
	SetAlpha_(holo_rena, ALPHA_CLEAR);
	
// ▼非常駐モーション読込
	//主人公
	local player_look_up_L = ReadMotion_(player, "Player_look_up_L");			// 主人公　上向き待機
	local player_battle_L = ReadMotion_(player, "Player_battle_L");				// 主人公　戦闘待機
	local player_surprise = ReadMotion_(player, "Player_surprise");				// 主人公　驚く
	local player_surprise_L = ReadMotion_(player, "Player_surprise_L");			// 主人公　驚くL

	//レナーテ
	local rena_look_down = ReadMotion_(rena, "n007_look_down_L");				// レナーテ　うつむき待機
	local rena_walk = ReadMotion_(rena, "n007_walk01_L");						// レナーテ　目をつむって歩く
	local rena_turn = ReadMotion_(rena, "n007_turn_left");						// レナーテ　振り向く
	local rena_turn_L = ReadMotion_(rena, "n007_turn_left_L");					// レナーテ　ふりむくL
	local rena_touch_reactor = ReadMotion_(rena, "n007_touch_reactor");			// レナーテ　リアクターに触る
	local rena_touch_reactor_L = ReadMotion_(rena, "n007_touch_reactor_L");		// レナーテ　リアクターに触るL
	
// ▼エフェクト読込
	LoadEffect_("ef732_15_holography02");										// ホログラム表現　出現
	LoadEffect_("ef732_16_holography01");										// ホログラム表現　消失


//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット1 レナーテと洞窟出口
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

// ▼カメラ設定
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");					// 80F

	StartDemo(FADE_COLOR_BLACK);
	SetMotion_(rena, rena_turn, BLEND_XL);										// レナーテ振り向く
	SetFace_(rena, "Face_left");
	SetMotionSpeed_(rena, 0.5);													// モーションがゆっくりになる
	task_rena = Task_RotateToPos_(rena, GetPos_(player), 3.0);
	Wait_(6);
	DeleteTask_(task_rena);
	
	SetMotion_(rena, rena_turn_L, BLEND_XL);
	Wait_(20);

	//===============================================
	// ■なぞの少女
	// 「この先に見える世界こそ
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MYSTERYGIRL");
	ShowMsg_("DEMO_050_MSG_010");	
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotionSpeed_(rena, 1.0);											// モーション速度
	PlaySE_("SE_DEM_068");
	local efc = SetBoneEffect_("ef732_15_holography02", rena);			//ホログラム出現
	SetAlpha_(rena, ALPHA_HALF);
	Wait_(3);
	SetAlpha_(rena, ALPHA_EXIST);
	Wait_(15);
	
	PlaySE_("SE_DEM_068");
	local efc = SetBoneEffect_("ef732_15_holography02", rena);			//ホログラム出現
	SetAlpha_(rena, ALPHA_HALF);
	Wait_(3);
	SetAlpha_(rena, ALPHA_EXIST);
	Wait_(15);

	//===============================================
	// ■なぞの少女
	// 「……ごめんなさい。すべてを　伝えるには
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MYSTERYGIRL");
	ShowMsg_("DEMO_050_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	Wait_(18);
	
	SetFace_(rena, "Face_default");
	SetMotion_(player, player_look_up_L, BLEND_N);								// 主人公上向き待機
	DeleteTask_(task_cam);

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット2 こっちにくるレナーテ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetMotionSpeed_(player, 0.5);													// 主 モーションがゆっくりになる

	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");					// 180F

	SetPointPos_(rena, "npc_renerte001");										// レナーテ移動
	SetPointPos_(holo_rena, "npc_renerte001");									// ホロレナ移動

	SetDirToPos_(rena, GetPos_(player));										// レナーテ方向転換
	SetDirToPos_(holo_rena, GetPos_(player));

	SetMotion_(rena, MOT_WALK, BLEND_M);										// レナーテ歩く
	SetMotion_(holo_rena, MOT_WALK, BLEND_M);

	task_rena = Task_MoveForward_(rena, 0.8, false);
	local task_holo_rena = Task_MoveForward_(holo_rena, 0.8, false);

	Wait_(40.5);																	//計87wait
	SetAlphaFade(holo_rena, 1, 1);
	SetAlpha_(rena, ALPHA_CLEAR);
	PlaySE_("SE_DEM_068");
	local efc = SetBoneEffect_("ef732_15_holography01", holo_rena);
	Wait_(14);
//	SetAlphaFade(rena, 0, 1);
//	SetAlpha_(rena, ALPHA_EXIST);
//	Wait_(8);
//	SetAlphaFade(holo_rena, 1, 1);
//	SetAlpha_(rena, ALPHA_CLEAR);
//	Wait_(3);
	local efc = SetBoneEffect_("ef732_15_holography01", holo_rena);
	SetAlphaFade(holo_rena, 0, 1);
	SetAlpha_(rena, ALPHA_EXIST);
	Wait_(31);
	
	DeleteTask_(task_rena);
	DeleteTask_(task_holo_rena);
	SetMotionSpeed_(rena, 0.5);													// レナーテ モーションがゆっくりになる
	SetMotion_(rena, rena_touch_reactor, BLEND_XL);								// レナーテ・タッチ・リアクター
	Wait_(30);
	DeleteTask_(task_cam);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット3 レナーテ、主人公アップ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetMotionSpeed_(player, 0.2);												// さらにモーションがゆっくりになる

	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");
	Wait_(2);
	SetMotionSpeed_(rena, 0.3);
	WaitMotion(rena);
	SetMotion_(rena, rena_touch_reactor_L, BLEND_XL);							// レナーテ・タッチ・リアクターL
	Wait_(3);
	SetMotionSpeed_(rena, 0.2);
	//===============================================
	// ▽
	// 「そのリアクターは　道しるべ。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MYSTERYGIRL");
	ShowMsg_("DEMO_050_MSG_030");
	KeyInputWait_();
	WaitTask(task_cam);
	CloseMsgWnd_();
	//===============================================

	Wait_(20);

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■レナーテ、主人公さらにアップ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetMotionSpeed_(rena, 0.4);
	SetMotionSpeed_(player, 0.3);
	
	task_cam = Task_AnimeMoveCamera_("anmeye005", "anmtgt005");

	//===============================================
	// ■なぞの少女
	// 「旅立ちなさい……<name_player/>。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MYSTERYGIRL");
	ShowMsg_("DEMO_050_MSG_040");
	KeyInputWait_();
	//===============================================
	// ■なぞの少女
	// 「そして　あなたが　すべてを知ったとき……
	//-----------------------------------------------
	ShowMsg_("DEMO_050_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	PlaySE_("SE_DEM_068");														// レナーテ消える
	efc_rena = SetSelectBoneEffectSetOffset_("ef732_15_holography02", rena, ATTACH_GLOBAL, Vec3(0.0, 0.0, 3.0));	// レナーテ消失
	SetAlpha_(rena, ALPHA_HALF);
	Wait_(3);
	SetAlpha_(rena, ALPHA_EXIST);
	Wait_(30);

	PlaySE_("SE_DEM_048");														// レナーテ消える
	efc_rena = SetSelectBoneEffectSetOffset_("ef732_16_holography01", rena, ATTACH_GLOBAL, Vec3(0.0, 0.0, 3.0));	// レナーテ消失
	SetVisible(rena, false);
	Wait_(5);
	
	SetMotionSpeed_(player, 1.0);
	SetMotion_(player, player_surprise, BLEND_L);								// 主人公びっくり
	WaitMotion(player);
	SetMotion_(player, player_surprise_L, BLEND_M);								// 主人公びっくりL
	Wait_(60);

	WaitTask(task_cam);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット4 レナーテの消失
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");

	WaitTask(task_cam);
	Wait_(60);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット5 出口に向かってダッシュ！
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetStepSe_(player, SILENT_STEP_SE);	// 足音を 無音にする
	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");

	SetMotion_(player, MOT_WAIT, BLEND_L);										// 主人公待機
	Wait_(10);
	SetMotion_(player, MOT_WALK, BLEND_L);										// 主人公歩き出す
	task_player = Task_MoveForward_(player, 1.2, false);
	
	Wait_(16);
	PlaySE_("SE_FLD_015");
	Wait_(16);
	PlaySE_("SE_FLD_015");
	Wait_(16);
	PlaySE_("SE_FLD_015");	
	
	DeleteTask_(task_player);
	SetMotion_(player, MOT_RUN, BLEND_M);										// 主人公走り出す
	task_player = Task_MoveForward_(player, 1.2, true);
	Wait_(3);	
	Task_PlaySe_("SE_FLD_015", 8);	//
	Wait_(57);
	
	DeleteTask_(task_cam);

	EndDemo(FADE_COLOR_WHITE);

}
