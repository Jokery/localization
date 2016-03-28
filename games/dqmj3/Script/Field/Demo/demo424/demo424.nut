//=============================================
//
//		demo424[アンセスの最後_2(過去映像-霊道)]
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
	local task_cam, task_player, task_birdy, task_ansesu, task_rena;
	local task_archbreak, task_nagekibreak00, task_nagekibreak01
	local task_chimerabreak00, task_chimerabreak01, task_chimerabreak02;
	local efc_player, efc_cam;

// ▼リソース読込
	// キャラクター
	local ansesu = GetPlayerId_();							// 主人公？(アンセス)
	local model_rena = ReadNpc_("n007");					// なぞの少女(レナーテ)
	local model_birdy = ReadNpc_("n019");					// なぞの鳥（バーディ）
	local model_archbreak = ReadNpc_("m202_00");			// アークブレイク
	local model_nagekibreak = ReadNpc_("m197_00");			// なげきのブレイク
	local model_chimerabreak = ReadNpc_("m188_00");			// ブレイクキメラ
	// エフェクト
	LoadEffect_("ef733_01_sym_shuchusen01");				// 集中線
	// レイアウト
	LoadLayout_("noise");									// ノイズ

// ▼配置
	// 主人公？(アンセス)
	SetPointPos_(ansesu, "npc_ansesu000");
	// なぞの少女(レナーテ)
	local rena = ArrangePointNpc_(model_rena, "npc_birdy000");
	// なぞの鳥（バーディ）
	local birdy = ArrangePointNpc_(model_birdy, "npc_birdy000");
	SetScaleSilhouette(birdy, SCALE.N, SILHOUETTE_WIDTH.N);
	// アークブレイク
	local archbreak = ArrangePointNpc_(model_archbreak, "npc_ansesu000");
	SetScaleSilhouette(archbreak, SCALE.M, SILHOUETTE_WIDTH.M);
	// なげきのブレイク１
	local nagekibreak00 = ArrangePointNpc_(model_nagekibreak, "npc_ansesu000");
	SetScaleSilhouette(nagekibreak00, SCALE.N, SILHOUETTE_WIDTH.N);
	// なげきのブレイク２
	local nagekibreak01 = ArrangePointNpc_(model_nagekibreak, "npc_ansesu000");
	SetScaleSilhouette(nagekibreak00, SCALE.N, SILHOUETTE_WIDTH.N);
	// ブレイクキメラ１
	local chimerabreak00 = ArrangePointNpc_(model_chimerabreak, "npc_ansesu000");
	SetScaleSilhouette(chimerabreak00, SCALE.N, SILHOUETTE_WIDTH.N);
	// ブレイクキメラ２
	local chimerabreak01 = ArrangePointNpc_(model_chimerabreak, "npc_ansesu000");
	SetScaleSilhouette(chimerabreak01, SCALE.N, SILHOUETTE_WIDTH.N);
	// ブレイクキメラ３
	local chimerabreak02 = ArrangePointNpc_(model_chimerabreak, "npc_ansesu000");
	SetScaleSilhouette(chimerabreak02, SCALE.N, SILHOUETTE_WIDTH.N);

// ▼足音設定
	SetStepSe_(ansesu, SILENT_STEP_SE);
	SetStepSe_(rena, SILENT_STEP_SE);
	SetStepSe_(birdy, SILENT_STEP_SE);
	SetStepSe_(archbreak, SILENT_STEP_SE);
	SetStepSe_(nagekibreak00, SILENT_STEP_SE);
	SetStepSe_(nagekibreak00, SILENT_STEP_SE);
	SetStepSe_(chimerabreak00, SILENT_STEP_SE);
	SetStepSe_(chimerabreak01, SILENT_STEP_SE);
	SetStepSe_(chimerabreak02, SILENT_STEP_SE);

// ▼非常駐モーション読込
	// 主人公？(アンセス)
	local anse_ride_on = ReadMotion_(ansesu, "Player_ride_on");// ライドオン
	local anse_flight_glide_L = ReadMotion_(ansesu, "Player_flight_glide_L");// 滑空L
	local anse_flight_Hovering_L = ReadMotion_(ansesu, "Player_flight_Hovering_L");// 飛行(ホバリング)L
	local anse_turn_L = ReadMotion_(ansesu, "Player_turn_L")// 振り返りL

	// なぞの少女(レナーテ)
	local rena_ride_hover_L = ReadMotion_(rena, "n007_ride_hovering_L");// ホバリング時のバーディに乗る(アンセスにアタッチが必要)
	local rena_ride_L = ReadMotion_(rena, "n007_ride_L");	// 滑空時のバーディに乗る(アンセスにアタッチが必要)

	// なぞの鳥（バーディ）
	local birdy_flight_Hovering_L = ReadMotion_(birdy, "n019_flight_Hovering_L");// 飛行(ホバリング)L
	local birdy_glide_L = ReadMotion_(birdy, "n019_flight_glide_L");// 滑空

// ▼時間設定
	SetTime_(START_TIME_ZONE_NIGHT);

// ▼色調設定
	ChangeColorSepia();

	ReadWaitingLod("lodeye000", "lodtgt000");

// ▼初期モーション
	SetMotion_(birdy, birdy_glide_L, BLEND_N);				// バーディ　滑空L
	SetMotion_(ansesu, anse_flight_glide_L, BLEND_N);		// アンセス　滑空L
	SetMotion_(rena, rena_ride_L, BLEND_N);					// レナーテ　ライドモーション

	AttachObject_(birdy, ansesu, ATTACH_EFFECT2);			//アンセス⇒バーディにアタッチ
	AttachObject_(ansesu, rena, ATTACH_GLOBAL);				//レナーテ⇒アンセスにアタッチ

	SetMotionSpeed_(archbreak, 2.5);

	//一律揃ってしまうモーションをバラつかせておく
	Wait_(2);
	SetMotion_(chimerabreak02, MOT_WALK, BLEND_N);			// ブレイクキメラ３　歩き
	Wait_(1);
	SetMotion_(chimerabreak02, MOT_WAIT, BLEND_N);			// ブレイクキメラ３　待機
	Wait_(2);
	SetMotion_(chimerabreak01, MOT_WALK, BLEND_N);			// ブレイクキメラ２　歩き
	SetMotion_(nagekibreak01, MOT_WALK, BLEND_N);			// なげきのブレイク２　歩き
	Wait_(1);
	SetMotion_(chimerabreak01, MOT_WAIT, BLEND_N);			// ブレイクキメラ２　待機
	SetMotion_(nagekibreak01, MOT_WAIT, BLEND_N);			// なげきのブレイク２　待機

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット1　アンセスとレナーテとバーディと敵群　アンセス達高飛び→敵群追撃　横から
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

// ▼カメラ設定
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_WHITE);

	SetLayoutAnime_("noise_in", false);													//ノイズ　イン
	PlayBgm_("BG_AMBI_016");															//ノイズが始まったら環境音ＢＧＭ再生
	WaitLayoutAnime();
	SetLayoutAnime_("noise_out", false);												//ノイズ　アウト
	WaitLayoutAnime(); 
	
	task_birdy = Task_AnimeMoveNoFit_(birdy, "anm_birdy000");
	task_rena = Task_AnimeMoveNoFit_(rena, "anm_birdy000");
	WaitTask(task_birdy);
	DeleteTask_(task_birdy);
	Wait_(8);
	SetPointPos_(archbreak, "npc_archbreak000");//予め前傾させておく
	task_archbreak = Task_AnimeMoveNoFit_(archbreak, "anm_archbreak000");
	Wait_(3);
	task_nagekibreak00 = Task_AnimeMoveNoFit_(nagekibreak00, "anm_nagekibreak000");
	Wait_(4);
	task_chimerabreak00 = Task_AnimeMoveNoFit_(chimerabreak00, "anm_chimerabreak000");
	Wait_(3);
	task_chimerabreak01 = Task_AnimeMoveNoFit_(chimerabreak01, "anm_chimerabreak100");
	task_chimerabreak02 = Task_AnimeMoveNoFit_(chimerabreak02, "anm_chimerabreak200");
	Wait_(7);
	task_nagekibreak01 = Task_AnimeMoveNoFit_(nagekibreak01, "anm_nagekibreak100");
	WaitTask(task_nagekibreak01);
	DeleteTask_(task_archbreak);
	DeleteTask_(task_nagekibreak00);
	DeleteTask_(task_nagekibreak01);
	DeleteTask_(task_chimerabreak00);
	DeleteTask_(task_chimerabreak01);
	DeleteTask_(task_chimerabreak02);
	Wait_(2);

	//チラ映りすることがあるので先に配置しておく
	task_birdy = Task_AnimeMoveNoFit_(birdy, "anm_birdy001");
	DeleteTask_(task_rena);
	task_rena = Task_AnimeMoveNoFit_(rena, "anm_birdy001");
	SetPointPos_(archbreak, "npc_archbreak001");//予め前傾させておく
	task_archbreak = Task_AnimeMoveNoFit_(archbreak, "anm_archbreak001");
	task_nagekibreak00 = Task_AnimeMoveNoFit_(nagekibreak00, "anm_nagekibreak001");
	task_nagekibreak01 = Task_AnimeMoveNoFit_(nagekibreak01, "anm_nagekibreak101");
	task_chimerabreak00 = Task_AnimeMoveNoFit_(chimerabreak00, "anm_chimerabreak001");
	task_chimerabreak01 = Task_AnimeMoveNoFit_(chimerabreak01, "anm_chimerabreak101");
	task_chimerabreak02 = Task_AnimeMoveNoFit_(chimerabreak02, "anm_chimerabreak201");
	Wait_(1);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット2　アンセスとレナーテとバーディと敵群　上と同じ　斜めから(バーディ通過時カメラ揺れ)
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");

	Wait_(65);
	StartDecayEarthQuake_(36, 6, 4.0);
	Wait_(36);
	StopEarthQuake_();
	DeleteTask_(task_birdy);
	Wait_(5);

	task_birdy = Task_AnimeMoveNoFit_(birdy, "anm_birdy002");//チラ映りすることがあるので先に配置しておく
	DeleteTask_(task_rena);
	task_rena = Task_AnimeMoveNoFit_(rena, "anm_birdy002");
	Wait_(1);
	DeleteTask_(task_archbreak);
	DeleteTask_(task_nagekibreak00);
	DeleteTask_(task_nagekibreak01);
	DeleteTask_(task_chimerabreak00);
	DeleteTask_(task_chimerabreak01);
	DeleteTask_(task_chimerabreak02);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット3　アンセスとレナーテとバーディ　斜め下から滑空でカメライン→滞空　左寄りにズームイン
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");

	Wait_(16);
	SetMotion_(ansesu, anse_flight_Hovering_L, BLEND_L);	// アンセス　飛行(ホバリング)L
	SetMotion_(rena, rena_ride_hover_L, BLEND_L);			// レナーテ　ホバリングL
	SetMotion_(birdy, birdy_flight_Hovering_L, BLEND_L);	// バーディ　飛行(ホバリング)L
	WaitTask(task_birdy);
	DeleteTask_(task_birdy);
	task_birdy = Task_RotateToDir_(birdy, -15, 10);
	WaitTask(task_birdy);
	DeleteTask_(task_birdy);
	DeleteTask_(task_cam);

	//===============================================
	//*アンセス
	//「くそっ！　しつこい奴らだ！
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_424_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(10);

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット4　アンセスとレナーテ　会話　斜め→アンセスにズームイン
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");

	Wait_(10);

	//===============================================
	//■なぞの少女
	//「このままだと　いずれ追いつかれる……！
	//　どうするの……？
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MYSTERYGIRL");
	ShowMsg_("DEMO_424_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(10);
	SetFace_(ansesu, "Face_loop_close");					// アンセス　目閉じ
	Wait_(10);
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	WaitTask(task_cam);
	DeleteTask_(task_cam);
	Wait_(5);
	SetFace_(ansesu, "Face_default");						// アンセス　目開け
	Wait_(30);

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット5　アンセスとレナーテ　アンセス飛び降り　カメラ下側斜めから
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	SetPointCameraEye_("cameye003");
	SetPointCameraTarget_("camtgt003");

	DetachObject_(birdy);
	DetachObject_(ansesu);
	AttachObject_(birdy, rena, ATTACH_EFFECT2);				//レナーテ⇒バーディにアタッチ
	task_ansesu = Task_AnimeMoveNoFit_(ansesu, "anm_ansesu000");
	SetMotion_(ansesu, anse_ride_on, BLEND_N);
	Wait_(40);
	DeleteTask_(task_ansesu);

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット6　アンセスと敵群　アンセス待機→振り向き　背後遠め→背中ズームイン
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");

	SetPointPosNoFit_(ansesu, "npc_ansesu001");
	SetPointPosNoFit_(archbreak, "npc_archbreak002");
	SetPointPosNoFit_(nagekibreak00, "npc_nagekibreak000");
	SetPointPosNoFit_(nagekibreak01, "npc_nagekibreak100");
	SetPointPosNoFit_(chimerabreak00, "npc_chimerabreak000");
	SetPointPosNoFit_(chimerabreak01, "npc_chimerabreak100");
	SetPointPosNoFit_(chimerabreak02, "npc_chimerabreak200");
	SetMotion_(ansesu, MOT_WAIT, BLEND_N);					// アンセス　待機
	Wait_(100);
	SetMotion_(ansesu, anse_turn_L, BLEND_L);				// アンセス　振り返りL
	SetFace_(ansesu, "Face_left");
	Wait_(5);
	DeleteTask_(task_cam);

	//===============================================
	//*アンセス
	//「オレが　おとりになる。
	//　その間に　お前たちは　逃げるんだ。
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_424_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(4);
	//チラ映りするので先に配置しておく
	SetMotion_(birdy, birdy_glide_L, BLEND_N);				// バーディ　滑空
	SetMotion_(rena, rena_ride_L, BLEND_N);					// レナーテ　ライドモーション
	SetMotionSpeed_(birdy, 0.75);
	SetMotionSpeed_(rena, 0.75);
//	SetFace_(rena, "Face_sad");								// レナーテ　悲しい
	Wait_(1);

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット7　レナーテ　ホバリング　斜め正面→ズームイン
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");

	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", CAMERA_DEF);// 集中線
	Wait_(10);
	DeleteEffectEmitter_(efc_cam);
	DeleteTask_(task_cam);

	//===============================================
	//■なぞの少女
	//「それは　ダメ……！
	//　あなたが　いないと……！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MYSTERYGIRL");
	ShowMsg_("DEMO_424_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(10);

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット8　アンセス　振り向き→走り　背後斜め
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	SetPointCameraEye_("cameye004");
	SetPointCameraTarget_("camtgt004");

	SetVisible(nagekibreak01, false);
	SetVisible(chimerabreak02, false);
	Wait_(5);

	//===============================================
	//*アンセス
	//「大丈夫だ……問題ない。
	//　オレは　不死身の■■■■だぞ？　▽
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_424_MSG_050");
	KeyInputWait_();
	//===============================================
	SetFace_(ansesu, "Face_default");
	SetMotion_(ansesu, MOT_WAIT, 10);						// アンセス　待機

//	//===============================================
//	//*アンセス
//	//「だから！
//	//-----------------------------------------------

	CloseMsgWnd_();
	
	//===============================================

	Wait_(8);
	SetMotion_(ansesu, MOT_RUN, 6);							// アンセス　走り
	task_ansesu = Task_AnimeMoveNoFit_(ansesu, "anm_ansesu001");
	Wait_(23);
	DeleteTask_(task_ansesu);
	SetMotion_(ansesu, MOT_WAIT, BLEND_N);					// アンセス　待機
	
	StopBgm_(3);
	PlaySE_("SE_DEM_126");
	SetLayoutAnime_("noise_in", false);						// ノイズ　イン
	WaitLayoutAnime();
	SetLayoutAnime_("noise_loop", true);					// ノイズ　ループ	

	EndDemo(FADE_COLOR_WHITE);
}
