//=============================================
//
//		demo504[サイレスのバーディ]
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
	local task_cam, task_player, task_birdy;
	local task_player_step;
	local efc_cam, efc_player, efc_birdy;

// ▼リソース読込
	// キャラクター
	local player = GetPlayerId_();										// 主人公
	local model_birdy = ReadNpc_("n019");								// バーディ
	// エフェクト
	LoadEffect_("ef733_01_sym_shuchusen01");									// 集中線
	LoadEffect_("ef721_03_nat_smoke_n03");								// 煙
	LoadEffect_("ef712_10_emo_surprise01");								// 驚き「！」
	LoadEffect_("ef712_04_emo_joy01");									// 喜び「♪」

// ▼配置
	SetPointPos_(player, "player000");									// 主人公
	local birdy = ArrangePointNpc_(model_birdy, "npc_birdy000");		// バーディ
	SetPointPosNoFit_(birdy, "npc_birdy000");
	SetScaleSilhouette(birdy, SCALE.N, SILHOUETTE_WIDTH.N);				// サイズN
	SetVisible(birdy, false);											// バーディ非表示

// ▼非常駐モーション読込
	//主人公
	local player_talk = ReadMotion_(player, "Player_talk");									// 話す
	local player_talk_L = ReadMotion_(player, "Player_talk_L");								// 話すL
	local player_look_walk = ReadMotion_(player, "Player_look_walk_L");						// キョロキョロ歩き
	local player_turn = ReadMotion_(player, "Player_turn_L");								// 振り返り
	local player_sup = ReadMotion_(player, "Player_surprise");								// 驚く
	local player_sup_L = ReadMotion_(player, "Player_surprise_L");							// 驚くL

	//バーディ
	local birdy_idol = ReadMotion_(birdy, "n019_idol");										// 待機L
	local birdy_flight_Hovering = ReadMotion_(birdy, "n019_flight_Hovering");				// 待機→飛行(ホバリング)
	local birdy_flight_Hovering_L = ReadMotion_(birdy, "n019_flight_Hovering_L");			// 飛行(ホバリング)L
	local birdy_glide_L = ReadMotion_(birdy, "n019_flight_glide_L");						// 滑空
	local birdy_run_L = ReadMotion_(birdy, "n019_run_L");									// 走る
	local birdy_talk = ReadMotion_(birdy, "n019_talk");										// 話す
	local birdy_why = ReadMotion_(birdy, "n019_why");										// 首をかしげる
	local birdy_wing_Appeal = ReadMotion_(birdy, "n019_wing_Appeal");						// 決めポーズ
	local birdy_wing_Appeal_L = ReadMotion_(birdy, "n019_wing_Appeal_L");					// 決めポーズL
	local birdy_angry = ReadMotion_(birdy, "n019_angry");									// 怒る
	local birdy_angry_L = ReadMotion_(birdy, "n019_angry_L");								// 怒るL

	//初期モーション
	SetMotion_(player, player_look_walk, BLEND_N);											// 主　キョロ歩き
	SetMotion_(birdy, birdy_glide_L, BLEND_N);												// 鳥　滑空

// ▼カメラ設定
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");


//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット1 主人公「おじゃまします」
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	StartDemo(FADE_COLOR_BLACK);
	Wait_(55);
	
	task_player = Task_MoveForward_(player, 1.0, false);
	task_player_step = Task_ChangeStepSe(player, "SE_FLD_015", 20);
	Wait_(120);
	
	SetMotion_(player, MOT_WAIT, BLEND_L);													// 主　待機
	DeleteTask_(task_player);
	DeleteTaskStepSe(player, task_player_step);

	Wait_(30);
	SetVisible(birdy, true);																// バーディ表示
	task_birdy = Task_AnimeMoveNoFit_(birdy, "anm_birdy000");								// バーディアニメ（影のみ表示）
	local task_fly = Task_PlaySe_("SE_FLD_036", 26);
	WaitTask(task_birdy);

	SetMotion_(birdy, birdy_flight_Hovering, BLEND_L);										// バーディホバリング
	WaitMotion(birdy);
	SetMotion_(birdy, birdy_flight_Hovering_L, BLEND_L);									// バーディホバリングL

	task_birdy = Task_AnimeMoveNoFit_(birdy, "anm_birdy001");								// バーディアニメ
	Wait_(65);
	WaitTask(task_birdy);
	Wait_(15);
	DeleteTask_(task_birdy);

	//===============================================
	//*バーディ
	// 	マイホームにいる　ユーは誰デース？
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_504_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(5);
	SetPointPos_(player, "player001");														// 主人公移動


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット2 主人公アップ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");

	Wait_(10);
	local pos_pl = Vec3(-0.8, 2.6, 0.0);													//player「！」の位置
	efc_player = SurpriseDispSetOffset(player, pos_pl, 0.4);								// 「！」
	Wait_(10);
	SetMotion_(player, player_turn, BLEND_L);												// 主　振り返り
	SetPointPos_(birdy, "npc_birdy001");													// 鳥移動
	Wait_(50);
	SetPointPos_(player, "player002");														// 主人公移動


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット3 バーディ登場
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");								//140Fでズームアウト

	SetMotion_(birdy, birdy_idol, BLEND_XL);												//バーディ待機
	DeleteTask_(task_fly);
	Wait_(15);

	StartDecayEarthQuake_(20, 3, 1)															//地震
	PlaySE_("SE_DEM_014");
	efc_birdy = SetSelectBoneEffect_("ef721_03_nat_smoke_n03", birdy, ATTACH_GLOBAL);		//煙
	SetEffectScale_(efc_birdy, 0.8);
	Wait_(125);
	PlaySE_("SE_DEM_026");	// ■SE:集中線
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", 100);									//集中線
	WaitTask(task_cam);

	//===============================================
	//*バーディ
	// 	「マイフレーーーンドッ！！
	//-----------------------------------------------
	SetMotion_(birdy, birdy_wing_Appeal, BLEND_L)												//鳥　決めポーズ
	WaitMotion(birdy); 
	OpenMsgWnd_();
	ShowMsg_("DEMO_504_MSG_020");
	SetMotion_(birdy, birdy_wing_Appeal_L, BLEND_N)												//鳥　決めポーズ
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(20);
	DeleteEffectEmitter_(efc_cam);

	SetMotion_(birdy, birdy_run_L, BLEND_M);												// 鳥走る
	task_birdy = Task_MoveForward_(birdy, 1.0, true);

	local task_birdy_step = Task_ChangeStepSe(birdy, "SE_FLD_032", 10);						//バーディ足音
	Wait_(20);
	DeleteTaskStepSe(birdy, task_birdy_step);

	DeleteEffect_(efc_cam);
	DeleteTask_(task_birdy);
	SetMotion_(player, MOT_WAIT, BLEND_N);													// 主　待機
	SetDir_(player, 90);
	SetPointPos_(birdy, "npc_birdy001");													// 鳥移動


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット4 バーディと主人公
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");

	task_birdy = Task_MoveForward_(birdy, 1.0, true);	
	local task_birdy_step = Task_ChangeStepSe(birdy, "SE_FLD_032", 10);						//バーディ足音
	Wait_(15);
	DeleteTask_(task_birdy);
	DeleteTaskStepSe(birdy, task_birdy_step);

	SetMotion_(birdy, birdy_idol, BLEND_L);													//バーディ待機
	SetMotion_(player, player_sup, BLEND_M)													//主　驚く
	WaitMotion(player); 
	SetMotion_(player, player_sup_L, BLEND_M)
	Wait_(10);
	SetMotion_(birdy, birdy_talk, BLEND_XL);												//バーディ話す

	//===============================================
	//*バーディ
	// 	「やーっと戻ってきたネー！
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_504_MSG_030");
	KeyInputWait_();
	//===============================================
	//*バーディ
	// 	「リベンジの準備は　いつでもオーケィ！
	//-----------------------------------------------
	SetTalkName_("NAME_TAG_BIRDY");
	ShowMsg_("DEMO_504_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(10);
	SetMotion_(player, player_talk, BLEND_XL)												//主　話すL
	SetMotion_(birdy, birdy_idol, BLEND_XL);												//バーディ待機
	WaitMotion(player); 
	Wait_(1);
	SetMotion_(player, player_talk_L, BLEND_M)
	Wait_(60);
	SetVisible(player, false);																// 主　非表示
	SetPointPos_(birdy, "npc_birdy002");													// 鳥移動


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット5 バーディ問答
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	SetPointCameraEye_("cameye003");
	SetPointCameraTarget_("camtgt003");

	Wait_(20);
	SetMotion_(birdy, birdy_why, BLEND_L);													//バーディ「？」
	WaitMotion(birdy);
	SetMotion_(birdy, birdy_talk, BLEND_L);													//バーディ話す
	SetMotion_(player, MOT_WAIT, BLEND_N);													// 主　待機

	//===============================================
	//*バーディ
	// 	オー！　変なこと　言いますネー。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BIRDY");
	ShowMsg_("DEMO_504_MSG_050");
	KeyInputWait_();
	//===============================================


		// 【はいの場合：１】
		if (GetQueryResult_() == QUERY2_0) {

			//===============================================
			//*バーディ
			// 	「オーノー！　でもノープロブレム！
			//-----------------------------------------------
			ShowMsg_("DEMO_504_MSG_060");
			SetMotion_(birdy, birdy_angry, BLEND_L)													//鳥　怒る
			WaitMotion(birdy); 
			SetMotion_(birdy, birdy_angry_L, BLEND_M)												//鳥　怒る
			KeyInputWait_();
			//===============================================
			//*バーディ
			// 	「ミーに乗って　空をフライすれば
			//-----------------------------------------------
			ShowMsg_("DEMO_504_MSG_070");
			SetMotion_(birdy, birdy_wing_Appeal, BLEND_L)											//鳥　決めポーズ
			WaitMotion(birdy); 
			SetMotion_(birdy, birdy_wing_Appeal_L, BLEND_N)											//鳥　決めポーズ
			KeyInputWait_();
			CloseMsgWnd_();
			//===============================================
			Wait_(30);
		}

		// 【いいえの場合：１】
		else {
			//===============================================
			//*バーディ
			// 	「それでこそ　ミーの親友ネー！
			//-----------------------------------------------
			SetMotion_(birdy, birdy_talk, BLEND_L);													//バーディ話す
			efc_birdy = SetSelectBoneEffectSetOffset_("ef712_04_emo_joy01", birdy, ATTACH_EFFECT1, Vec3(0.0, 2.0, 0.0));	//喜びエフェクト
			SetEffectScale_(efc_birdy, 2.5);

			ShowMsg_("DEMO_504_MSG_080");
			KeyInputWait_();
			//===============================================
			//*バーディ
			// 	「その様子なら　いつでも　フライトして
			//-----------------------------------------------
			ShowMsg_("DEMO_504_MSG_090");
			DeleteEffectEmitter_(efc_birdy); 
			SetMotion_(birdy, birdy_wing_Appeal, BLEND_L)											//鳥　決めポーズ
			WaitMotion(birdy); 
			SetMotion_(birdy, birdy_wing_Appeal_L, BLEND_N)											//鳥　決めポーズ
			KeyInputWait_();
			CloseMsgWnd_();
			//===============================================

			Wait_(30);

		}

	SetVisible(player, true);																	// 主　表示


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット6 バーディ離脱
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");

	SetMotion_(birdy, birdy_talk, BLEND_XL);													//バーディ話す

	//===============================================
	//*バーディ
	// 	「そういうことなら　ゼンはハリー！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BIRDY");
	ShowMsg_("DEMO_504_MSG_100");
	KeyInputWait_();
	//===============================================
	//*バーディ
	// 	「コアにフライトするなら　エルピス山ネー！
	//-----------------------------------------------
	ShowMsg_("DEMO_504_MSG_110");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	local task_birdy_step = Task_ChangeStepSe(birdy, "SE_FLD_032", 10);							//バーディ足音
	Wait_(12);
	DeleteTaskStepSe(birdy, task_birdy_step);
	SetMotion_(birdy, birdy_run_L, BLEND_M);													// 鳥走る
	task_birdy = Task_RotateToDir_(birdy, 90, 10);												// 回転
	DeleteTaskStepSe(birdy, task_birdy_step);
	WaitTask(task_birdy);

	task_birdy = Task_MoveForward_(birdy, 1.0, true);
	local task_birdy_step = Task_ChangeStepSe(birdy, "SE_FLD_032", 10);							//バーディ足音
	Wait_(70);
	DeleteTaskStepSe(birdy, task_birdy_step);
	WaitTask(task_cam);
	Wait_(40);

	EndDemo(FADE_COLOR_BLACK);
}
