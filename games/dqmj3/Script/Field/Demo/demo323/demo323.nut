//=============================================
//
//		demo323[ダークマスターの挑戦_2]
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
	local task_cam, task_anse, task_rena, task_dark, task_birdy, task_snow00, task_snow01, task_snow02;
	local efc_player,efc_anse, efc_rena, efc_dark, efc_birdy, efc_mon, efc_cam, efc_fire;

// ▼リソース読込
	// キャラクター
	local ansesu = GetPlayerId_();						// 主人公？(アンセス)
	local model_rena = ReadNpc_("n007");				// なぞの少女(レナーテ)
	local model_birdy = ReadNpc_("n019");				// なぞの鳥（バーディ）
	local model_dark = ReadNpc_("n008"); 				// ダークマスター
	
	// モンスター
	local model_snowdragon = ReadNpc_("m015_01");		// せつげんりゅう
	
	// エフェクト設定
	LoadEffect_("ef733_01_sym_shuchusen01");					// 集中線
	LoadEffect_("ef721_03_nat_smoke_n03");				// 煙
	LoadEffect_("ef832_01_fire");						// たき火
	
// ▼配置
	// npc
	SetPointPos_(ansesu, "npc_ansesu000");								// 主人公（アンセス）
	SetStepSe_(ansesu, SILENT_STEP_SE);
	
	local rena = ArrangePointNpc_(model_rena, "npc_renerte000");		// なぞの少女(レナーテ)
	SetStepSe_(rena, SILENT_STEP_SE);
	
	local birdy = ArrangePointNpc_(model_birdy, "npc_birdy000");		// なぞの鳥（バーディ）
	SetScaleSilhouette(birdy, SCALE.N, SILHOUETTE_WIDTH.N);				// サイズN
	SetStepSe_(birdy, SILENT_STEP_SE);
	
	local dark = ArrangePointNpc_(model_dark, "npc_dark000");			// ダークマスター
	SetStepSe_(dark, SILENT_STEP_SE);
	
	// モンスター
	local snow00 = ArrangePointNpc_(model_snowdragon, "npc_monster000");	// せつげんりゅう前列・左
	SetStepSe_(snow00, SILENT_STEP_SE);
	SetScaleSilhouette(snow00, 0.8, 0.8);
	
	local snow01 = ArrangePointNpc_(model_snowdragon, "npc_monster100");	// でかいせつげんりゅう・真ん中
	SetStepSe_(snow01, SILENT_STEP_SE);
	SetScaleSilhouette(snow01, 2.0, 2.0);
	
	local snow02 = ArrangePointNpc_(model_snowdragon, "npc_monster200");	// せつげんりゅう前列・右
	SetStepSe_(snow02, SILENT_STEP_SE);
	SetScaleSilhouette(snow02, 0.8, 0.8);
	
	local snow03 = ArrangePointNpc_(model_snowdragon, "npc_monster300");	// せつげんりゅう後列・右
	SetStepSe_(snow03, SILENT_STEP_SE);
	SetScaleSilhouette(snow03, 1.0, 1.0);

	local snow04 = ArrangePointNpc_(model_snowdragon, "npc_monster400");	// せつげんりゅう後列・左
	SetStepSe_(snow04, SILENT_STEP_SE);
	SetScaleSilhouette(snow04, 1.0, 1.0);
	
	// エフェクト
	efc_fire = SetPointWorldEffect_("ef832_01_fire", "efc_fire000");

// ▼非常駐モーション読込
	// ○主人公？(アンセス)
	local anse_talk = ReadMotion_(ansesu, "Player_talk");												// 話す
	local anse_talk_L = ReadMotion_(ansesu, "Player_talk_L");											// 話すL
	local anse_wood_look_down = ReadMotion_(ansesu, "Player_wood_look_down_L");							// 木にもたれる（うつむく）L
	local anse_wood_look_flont = ReadMotion_(ansesu, "Player_wood_look_front_L");						// 木にもたれる（顔を正面に）L
	local anse_hand_shoulder_L = ReadMotion_(ansesu, "Player_hand_shoulder_L");							// レナーテの肩に手を置くL
	local anse_hand_shoulder_look_right_L = ReadMotion_(ansesu, "Player_hand_shoulder_look_right_L");	// レナーテの肩に手を置く（右向き）L
	local anse_caution01 = ReadMotion_(ansesu, "Player_caution01_L");									// 警戒
	local anse_battle_L = ReadMotion_(ansesu, "Player_battle_L");										// 戦闘待機
	local anse_battle_look_up_L = ReadMotion_(ansesu, "Player_battle01_L");								// 戦闘待機（顔上向き）
	local anse_ride_on = ReadMotion_(ansesu, "Player_ride_on");											// ライドオン
	local anse_ride_L = ReadMotion_(ansesu, "Player_ride00_L");											// ライドL
	local anse_look_up_L = ReadMotion_(ansesu, "Player_look_up_L");										// 上向き待機L
	local anses_Player_flight_glide_L = ReadMotion_(ansesu, "Player_flight_glide_L");					// グライドL
	local anses_glide_right_L = ReadMotion_(ansesu, "Player_flight_glide_right_L");						// 飛行（滑空）右向き

	// ○なぞの少女(レナーテ)
	local rena_right = ReadMotion_(rena, "n007_look_right_L");									// 右を向く
	local rena_left = ReadMotion_(rena, "n007_look_left_L");									// 左を向く
	local rena_sit_look_down_L = ReadMotion_(rena, "n007_sit_look_down_L");						// 丸太に座る（うつむく）L	
	local rena_sit_look_up_L = ReadMotion_(rena, "n007_sit_look_up_L");							// 丸太に座る（上を向く）L	
	local rena_sit_look_left_L = ReadMotion_(rena, "n007_sit_look_left_L");						// 丸太に座る（左を向く）L	
	local rena_ride_hover = ReadMotion_(rena, "n007_ride_hovering_L");							// ホバリング時のバーディに乗る(アンセスにアタッチが必要)
	local rena_ride = ReadMotion_(rena, "n007_ride_L");											// 滑空時のバーディに乗る(アンセスにアタッチが必要)
	local rena_look_up_L = ReadMotion_(rena, "n007_look_up_L");									// レナーテ上向き待機

	
	// ○なぞの鳥（バーディ）
	local birdy_idol = ReadMotion_(birdy, "n019_idol");										// 待機L
	local birdy_before_flight = ReadMotion_(birdy, "n019_before_flight");					// 待機→飛行前
	local birdy_before_flight_L = ReadMotion_(birdy, "n019_before_flight_L");				// 飛行前L
	local birdy_flight_Hovering = ReadMotion_(birdy, "n019_flight_Hovering");				// 待機→飛行(ホバリング)
	local birdy_flight_Hovering_L = ReadMotion_(birdy, "n019_flight_Hovering_L");			// 飛行(ホバリング)L
	local birdy_glide_L = ReadMotion_(birdy, "n019_flight_glide_L");						// 滑空
	
	// ○ダークマスター
	local dark_laugh = ReadMotion_(dark, "n008_laugh_L");							// 笑うL

// ▼時間設定
	SetTime_(START_TIME_ZONE_NIGHT);
	
// ▼色調設定
	ChangeColorSepia();

// ▼レイアウト
	LoadLayout_("noise");															// ノイズ
	
// ▼初期モーション
	SetMotion_(ansesu, anse_wood_look_down, BLEND_N);								// アンセス木にもたれる
	SetMotion_(rena, rena_sit_look_down_L, BLEND_N);								// レナーテ座る
	SetMotion_(birdy, birdy_glide_L, BLEND_N);										// バーディ滑空
	SetVisible(birdy, false);														// バーディ非表示
	SetFace_(ansesu, "Face_loop_close");
//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------
//	ReadWaitingLod("lodeye000", "lodtgt000");
	SetPointCameraEye_("lodeye000");
	SetPointCameraTarget_("lodtgt000");
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット1 たき火⇒ズームアウト
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	StartDemo(FADE_COLOR_WHITE);
	
	PlayBgm_("BG_AMBI_016");
	SetLayoutAnime_("noise_in", false);												// ノイズ
	WaitLayoutAnime();
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	SetLayoutAnime_("noise_out", false);											// ノイズアウト
	
	WaitTask(task_cam);
	Wait_(80);
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット2 アンセスアップ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	
	SetMotion_(ansesu, anse_wood_look_flont, BLEND_L);								// アンセス顔を上げる
	SetFace_(ansesu, "Face_default");
	Wait_(20);
	//===============================================
	//*アンセス
	//「疲れたか？
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_323_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	Wait_(40);
		
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット3 レナアップ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");

	SetMotion_(rena, rena_sit_look_up_L, BLEND_L);							// レナーテ顔を上げる
	Wait_(20);
	//===============================================
	//■なぞの少女
	//「……いいえ。
	//　そんなことは……ないけど……。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MYSTERYGIRL"); 
	ShowMsg_("DEMO_323_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	Wait_(40);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット4 アンセス、レナに接近
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");
	
	SetMotion_(ansesu, MOT_WAIT, BLEND_XL);										// アンセス待機
	
	Wait_(30);
	SetMotion_(ansesu, MOT_WALK, BLEND_M);										// アンセス歩く
	task_anse = Task_MoveForward_(ansesu, 1.0, false);
	
	Wait_(30);
	DeleteTask_(task_anse);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット5 アンセス口説きシーン
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetPointPos_(ansesu, "npc_ansesu001");										// アンセス移動
	task_anse = Task_MoveForward_(ansesu, 1.0, false);
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	
	Wait_(25);
	DeleteTask_(task_anse);
	SetMotion_(ansesu, anse_hand_shoulder_L, BLEND_XL);							// アンセス肩ポン

	Wait_(40);
	//===============================================
	//*アンセス
	//「無理は　しなくていい。
	//　肝心なときに　倒れられたら困る。
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_323_MSG_030");
	KeyInputWait_();

	
	//-----------------------------------------------
	//「オレと　お前の　ふたりがそろってなきゃ
	//　マザーを　どうにかすることは　無理だからな。
	//-----------------------------------------------
	ShowMsg_("DEMO_323_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	WaitTask(task_cam);
	Wait_(30);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット6 疲れたアンセス
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	task_cam = Task_AnimeMoveCamera_("anmeye009", "anmtgt009");

	Wait_(30);
	SetFace_(ansesu, "Face_loop_close");										// アンセス目閉じ
	//===============================================
	//*アンセス	
	//「それに……オレも　少し疲れた。
	//　ここのところ　戦いっぱなしだったからな。
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_323_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	WaitTask(task_cam);

	StartDecayEarthQuake_(20, 3, 1)												// 地震

	Wait_(25);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット7 ズームアウト＋地震
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetFace_(ansesu, "Face_default");											// アンセス目開け
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");
	SetMotion_(ansesu, anse_hand_shoulder_look_right_L, BLEND_L);				// アンセス右を見る
	SetMotion_(rena, rena_sit_look_left_L, BLEND_L);							// レナーテ左を見る

	WaitTask(task_cam);
	Wait_(10);
	StartDecayEarthQuake_(20, 3, 1)												// 地震

	Wait_(40);
	StartDecayEarthQuake_(20, 3, 1)												// 地震
	Wait_(40);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット8 ブレイクモンスターの集団
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetPointPos_(ansesu, "npc_ansesu002");										// アンセス移動
	SetPointPos_(rena, "npc_renerte001");										// レナーテ移動
	SetMotion_(ansesu, MOT_WAIT, BLEND_N);										// アンセス待機
	SetMotion_(rena, MOT_WAIT, BLEND_N);										// レナ待機

	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");
	
	Wait_(20);
	SetMotion_(snow01, MOT_LIFE_SPECIAL_2, BLEND_XL);							// 雪原竜　真ん中　吠える

	SetMotion_(snow00, MOT_WALK, BLEND_M);										// 雪原竜　左右　歩く
	SetMotion_(snow02, MOT_WALK, BLEND_M);
	task_snow00 = Task_MoveForward_(snow00, 1.5, false);
	task_snow02 = Task_MoveForward_(snow02, 1.3, false);
	
	Wait_(30);
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", 100);						// 集中線
	WaitMotion(snow01);
	SetMotion_(snow01, MOT_WAIT, BLEND_L);
	DeleteEffectEmitter_(efc_cam);
	
	WaitTask(task_cam);

	Wait_(5);
	DeleteTask_(task_snow02);
	SetMotion_(snow02, MOT_WAIT, BLEND_L);
	
	Wait_(20);
	DeleteTask_(task_snow00);
	SetMotion_(snow00, MOT_WAIT, BLEND_L);

	Wait_(30);	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット9 アンセス、レナーテ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetPointPos_(rena, "npc_renerte002");											// レナーテ移動
	SetPointCameraEye_("cameye004");
	SetPointCameraTarget_("camtgt004");

	//===============================================
	//*アンセス
	//「こんなところにまで……！
	//　まったく　しつこい奴らだぜ！
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_323_MSG_060");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	SetMotion_(ansesu, anse_look_up_L, BLEND_L);								// アンセス上向き待機
	SetMotion_(rena, rena_look_up_L, BLEND_L);										// レナ上向き
	
	SetVisible(birdy, true);														// バーディ表示
	task_birdy = Task_AnimeMoveNoFit_(birdy, "anm_birdy000");						// バーディアニメ（影のみ表示）
	
	WaitTask(task_birdy);
	Wait_(50);	
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット10 バーディの登場シーン
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetMotion_(ansesu, MOT_WAIT, BLEND_N);											// アンセス待機
	SetMotion_(rena, MOT_WAIT, BLEND_N);											// レナ待機

	SetPointPosNoFit_(birdy, "npc_birdy001");										// 鳥移動
	task_birdy = Task_AnimeMoveNoFit_(birdy, "anm_birdy001");						// バーディ降下
	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");

	Wait_(5);
	
	SetMotion_(birdy, birdy_flight_Hovering, BLEND_L);								// バーディホバリング
	WaitMotion(birdy);
	SetMotion_(birdy, birdy_flight_Hovering_L, BLEND_L);							// バーディホバリングL
	
	WaitTask(task_cam);
	efc_birdy = SetSelectBoneEffect_("ef721_03_nat_smoke_n03", birdy, ATTACH_GLOBAL);		// 煙
	SetEffectScale_(efc_birdy, 2.0);

	Wait_(15);
	DeleteTask_(task_birdy);
	SetMotion_(birdy, birdy_idol, BLEND_XL);										// バーディ待機
	
	Wait_(50);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット11 アンセスアップ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetVisible(birdy, false);														// バーディ非表示
	SetMotion_(ansesu, anse_caution01, BLEND_N);									// アンセス警戒
	task_cam = Task_AnimeMoveCamera_("anmeye005", "anmtgt005");
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", 100);							// 集中線

	//===============================================
	//*アンセス
	//「上だ！　飛べ　バーディ！
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_323_MSG_070");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	WaitTask(task_cam);
	DeleteEffectEmitter_(efc_cam);

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット12 上空にて
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 50);										// フェードイン・アウト
	//-------------------------------------------------------------------------------------------------------------
	WaitFade_();
	Wait_(20);
	
	SetPointPosNoFit_(birdy, "npc_birdy002");										// 鳥移動
	SetPointPosNoFit_(rena, "npc_birdy002");										// 鳥移動
	SetVisible(birdy, true);														// バーディ表示
	
	SetMotion_(birdy, birdy_glide_L, BLEND_N);										// バーディグライドL
	SetMotion_(ansesu, anses_Player_flight_glide_L, BLEND_N);										// アン・レナ　ライドモーション
	SetMotion_(rena, rena_ride, BLEND_N);

	AttachObject_(birdy, ansesu, ATTACH_EFFECT2);									// アン⇒バーディにアタッチ
	AttachObject_(ansesu, rena, ATTACH_GLOBAL);										// レナ⇒アンセスにアタッチ
	
	task_birdy = Task_AnimeMoveNoFit_(birdy, "anm_birdy002");						// バーディアニメ
	task_rena = Task_AnimeMoveNoFit_(rena, "anm_birdy002");

	task_cam = Task_AnimeMoveCamera_("anmeye006", "anmtgt006");
	//-------------------------------------------------------------------------------------------------------------
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);

	Wait_(130);
	
	//===============================================
	//■なぞの少女
	//「……敵の　行動範囲が　最近はやけに
	//　広がっている　気がするわ……。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MYSTERYGIRL"); 
	ShowMsg_("DEMO_323_MSG_080");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	Wait_(10);
	SetMotion_(ansesu, anses_glide_right_L, BLEND_XL);
	SetFace_(ansesu, "Face_right");
	Wait_(10);
	//===============================================
	//*アンセス
	//「それだけ　敵の……マザーとダ
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_323_MSG_090");
	Wait_(30);
	CloseMsgWnd_();
	//===============================================
	StopBgm_(3);
	PlaySE_("SE_DEM_126");
	SetLayoutAnime_("noise_in", false);												// ノイズ
	WaitLayoutAnime();
	SetLayoutAnime_("noise_loop", false);											// ノイズループ

	DeleteTask_(task_cam);
	DeleteTask_(task_birdy);

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット13 ダークマスター
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetSepiaColor_(false);															// セピア解除
	SetBgBlack_(true);																// 画面背景を消します
	PlayBgm_("BGM_008");
	task_cam = Task_AnimeMoveCamera_("anmeye007", "anmtgt007");

	SetMotion_(dark, dark_laugh, BLEND_N);											// ダクマス笑う
	
	//===============================================
	//*ダークマスター
	//「……くくく。
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_323_MSG_100");
	SetLayoutAnime_("noise_out", false);							// ノイズアウト
	KeyInputWait_();

	//「久しぶりだな……。	
	ShowMsg_("DEMO_323_MSG_110");
	SetMotion_(dark, MOT_WAIT, BLEND_XL);											// ダクマス待機
	KeyInputWait_();
	
	//「我が名は　ダークマスター。
	SetMotion_(dark, MOT_TALK, BLEND_L);												// ダクマス話す
	WaitMotion(dark);
	SetMotion_(dark, MOT_TALKLOOP, BLEND_M);											// ダクマス話す
	ShowMsg_("DEMO_323_MSG_120");
	KeyInputWait_();

	//「どうやら……あの楽園は　不満だったようだな。
	SetMotion_(dark, MOT_WAIT, BLEND_XL);											// ダクマス待機
	SetTalkName_("NAME_TAG_DARKMASTER"); 
	ShowMsg_("DEMO_323_MSG_130");
	KeyInputWait_();

	//「どうせ　連れだしたのは　あの女だろうが……
	SetMotion_(dark, dark_laugh, BLEND_L);											// ダクマス笑う
	ShowMsg_("DEMO_323_MSG_140");
	KeyInputWait_();
	WaitLayoutAnime();
	
	//「そう……これで　逃げおおせたと思うな。
	SetMotion_(dark, MOT_WAIT, BLEND_XL);											// ダクマス待機
	ShowMsg_("DEMO_323_MSG_150");
	KeyInputWait_();

	//「首を　洗って　待っているがいい。
	SetMotion_(dark, dark_laugh, BLEND_L);											// ダクマス笑う
	ShowMsg_("DEMO_323_MSG_160");	
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	PlaySE_("SE_DEM_126");
	SetLayoutAnime_("noise_in", false);												// ノイズ
	WaitLayoutAnime();
	SetLayoutAnime_("noise_loop", true);											// ノイズループ	
	
	Wait_(15);

	EndDemo(FADE_COLOR_WHITE);
}
