//=============================================
//
//		demo517[バーディの飛翔]
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
	local efc_player, efc_birdy, efc_mono;

// ▼リソース読込
	// キャラクター
	local player = GetPlayerId_();												// 主人公
	local model_birdy = ReadNpc_("n019");										// バーディ
	// ギミック
	local model_mono = ReadGimmick_("o_com_02");								// モノリス
	local model_gate = ReadGimmick_("o_V00_03");								// レジスタンスの扉
	local model_device = ReadGimmick_("o_V00_11");								// 認証装置
	local model_rula = ReadGimmick_("o_com_08");								// ルーラポイント
	//エフェクト
	LoadEffect_("ef732_07_teleport_monolith");									// モノリス転送エフェクト
	LoadEffect_("ef721_03_nat_smoke_n03");										// 煙

// ▼配置
	// 主人公
	SetPointPos_(player, "player000");
	// バーディ
	local birdy = ArrangePointNpc_(model_birdy, "npc_birdy000");
	SetScaleSilhouette(birdy, 0.6, 0.6);
	// モノリス
	local mono = ArrangePointGimmick_("o_com_02", model_mono, "obj_monolith000");
	// レジスタンスの扉
	local gate = ArrangePointGimmick_("o_V00_03",model_gate, "obj_gate000");
	// 認証装置
	local device = ArrangePointGimmick_("o_V00_11",model_device, "obj_device000");
	// ルーラポイント
	local rula = ArrangePointGimmick_("o_com_08",model_rula, "obj_rula000");

// ▼非常駐モーション読込
	//	主人公
	local player_ride_L = ReadMotion_(player, "Player_ride00_L");							// ライドL
	local player_hover = ReadMotion_(player, "Player_flight_Hovering");						// 待機→飛行(ホバリング)	
	local player_hover_L = ReadMotion_(player, "Player_flight_Hovering_L");					// 飛行(ホバリング)
	local player_glide_L = ReadMotion_(player, "Player_flight_glide_L");					// 飛行(滑空)
	local player_nod = ReadMotion_(player, "Player_nod");									// 頷く
	local player_talk = ReadMotion_(player, "Player_talk");									// 話す
	local player_talk_L = ReadMotion_(player, "Player_talk_L");								// 話すL
	local player_look_right_L = ReadMotion_(player, "Player_look_right_L");					// 右向きL

	//	バーディ
	local birdy_idol = ReadMotion_(birdy, "n019_idol");										// 待機L
	local birdy_before_flight = ReadMotion_(birdy, "n019_before_flight");					// 待機→飛行前
	local birdy_before_flight_L = ReadMotion_(birdy, "n019_before_flight_L");				// 飛行前L
	local birdy_flight_Hovering = ReadMotion_(birdy, "n019_flight_Hovering");				// 待機→飛行(ホバリング)
	local birdy_flight_Hovering_L = ReadMotion_(birdy, "n019_flight_Hovering_L");			// 飛行(ホバリング)L
	local birdy_glide_L = ReadMotion_(birdy, "n019_flight_glide_L");						// 滑空
	local birdy_talk = ReadMotion_(birdy, "n019_talk");										// 話すL
	local birdy_run_L = ReadMotion_(birdy, "n019_run_L");									// 走る
	local birdy_why = ReadMotion_(birdy, "n019_why");										// 首をかしげる
	local birdy_wing_Appeal = ReadMotion_(birdy, "n019_wing_Appeal");						// 決めポーズ
	local birdy_wing_Appeal_L = ReadMotion_(birdy, "n019_wing_Appeal_L");					// 決めポーズL

// ▼初期モーション
	SetMotion_(birdy,  birdy_run_L, BLEND_L);
	SetAlpha_(player, ALPHA_CLEAR);									//主　非表示
	SetMotion_(mono, MOT_GIMMICK_2, BLEND_N);

// ▼天候設定
	SetWeather_(WEATHER.BAD);

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット1 モノリスから戻る主人公
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

// ▼カメラ設定
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");


//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);

	//主人公転送
	PlaySE_("SE_DEM_017");
	efc_mono = SetSelectBoneEffect_("ef732_07_teleport_monolith", player, ATTACH_GLOBAL);
	for (local i=1; i <= 10; i++) {
		SetAlpha_(player, ALPHA_CLEAR + (i * 0.1));
		Wait_(3);
	}

	WaitTask(task_cam);
	Wait_(10);
	task_birdy = Task_MoveForward_(birdy, 1.0, true);
	PlaySE_("SE_FLD_036");
	Wait_(28);
	DeleteTask_(task_birdy);
	SetMotion_(birdy, birdy_idol, BLEND_L);													//バーディ待機
	Wait_(15);
	SetMotion_(birdy, birdy_talk, BLEND_L);													//バーディ話す

	//===============================================
	//*バーディ
	// 	「オー！　戻ってきたネー！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BIRDY");
	ShowMsg_("DEMO_517_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(birdy, birdy_idol, BLEND_XL);													//バーディ待機	
	SetMotion_(player, player_nod, BLEND_XL);
	WaitMotion(player);
	SetMotion_(player, player_talk, BLEND_L);
	WaitMotion(player);
	SetMotion_(player, player_talk_L, BLEND_N);
	Wait_(60);

	SetMotion_(birdy, birdy_talk, BLEND_L);	
	SetMotion_(player, MOT_WAIT, BLEND_XL);	

	//===============================================
	//*バーディ
	// 	「先に　レジスタンスの秘密基地へ　行きたい？
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BIRDY");
	ShowMsg_("DEMO_517_MSG_020");
	KeyInputWait_();
	//===============================================


	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");// 秘密基地の山頂を映す

	local task = Task_RotateToDir_(birdy, -130, 3);
	PlaySE_("SE_FLD_036");
	SetMotion_(player, player_look_right_L, BLEND_XL);	

	//-----------------------------------------------
	//*バーディ
	// 	「あっち側の山まで　ユーを乗せて　飛べばいいのネー？
	//-----------------------------------------------
	ShowMsg_("DEMO_517_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	WaitTask(task_cam);
	Wait_(30);	
	SetPointPos_(birdy, "npc_birdy001");


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット2 バーディアップ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");

	//===============================================
	//*バーディ
	// 	「オーケィ！　ミーに乗るデース！　しっかり　つかまっててヨー！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BIRDY");
	ShowMsg_("DEMO_517_MSG_040");
	SetMotion_(birdy, birdy_wing_Appeal, BLEND_XL)									//鳥　決めポーズ
	WaitMotion(birdy); 
	SetMotion_(birdy, birdy_wing_Appeal_L, BLEND_N)									//鳥　決めポーズ
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(10);
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);										//黒フェードを入れる
	WaitFade_();
	SetPointPos_(birdy, "npc_birdy002");
	SetVisible(player, false);
	SetVisible(birdy, false);
	Wait_(1);
	SetVisible(birdy, true);
	Wait_(1);
	SetVisible(player, true);
	Wait_(1);
	AttachObject_(birdy, player, ATTACH_EFFECT2);
	SetMotion_(birdy, birdy_before_flight_L, BLEND_N);
	SetMotion_(player, player_ride_L, BLEND_N);										//主人公ライドモーション（待機）


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット3 主人公バーディにライド→飛翔
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");

	SetFade_(FADE_IN, FADE_COLOR_BLACK, 10);										//黒フェードをから戻る
	WaitTask(task_cam);

	//===============================================
	//*バーディ
	// 	「レッツ……フラーイトッ！！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BIRDY");
	ShowMsg_("DEMO_517_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();	
	//===============================================

	//飛翔アニメに切り替え
	PlaySE_("SE_DEM_133");															//■SE:バーディ再び水平飛行
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");
	task_birdy = Task_AnimeMoveNoFit_(birdy, "anm_birdy000");
	SetMotion_(birdy, birdy_flight_Hovering, BLEND_L);
	SetMotion_(player, player_hover, BLEND_L);										//主人公ライドモーション（ホバリング）
	WaitMotion(birdy);
	WaitMotion(player);
	SetMotion_(birdy, birdy_flight_Hovering_L, BLEND_L);
	SetMotion_(player, player_hover_L, BLEND_L);									//主人公ライドモーション（ホバリング）
	WaitTask(task_cam);
	Wait_(3);
	SetMotion_(birdy, birdy_glide_L, BLEND_L);										//バーディ滑空
	SetMotion_(player, player_glide_L, BLEND_L);									//主人公ライドモーション（滑空）
	Wait_(100);
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);										//黒フェードを入れる
	WaitFade_();
	WaitTask(task_cam);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット4　飛行ライド移動シーン
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");

	task_birdy = Task_AnimeMoveNoFit_(birdy, "anm_birdy001");
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);										//黒フェードをから戻る
	WaitTask(task_cam);
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);										//黒フェードを入れる
	WaitFade_();
	SetPointPos_(birdy, "npc_birdy003");


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット5　着陸シーン
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	task_cam = Task_AnimeMoveCamera_("anmeye005", "anmtgt005");

	task_birdy = Task_AnimeMoveNoFit_(birdy, "anm_birdy002");
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);										//黒フェードをから戻る
	Wait_(30)
	SetMotion_(player, player_hover_L, BLEND_XL);									//主人公ライドモーション（ホバリング）
	SetMotion_(birdy,  birdy_flight_Hovering_L, BLEND_XL);
	local task_fly = Task_PlaySe_("SE_FLD_036", 26);
	Wait_(120)
	DeleteTask_(task_fly);

	SetMotion_(player, player_ride_L, BLEND_XL);									//主人公ライドモーション（待機）
	SetMotion_(birdy,  birdy_before_flight_L, BLEND_XL);							//バーディ飛行前
	Wait_(10);
	
	PlaySE_("SE_FLD_032");
	efc_birdy = SetSelectBoneEffect_("ef721_03_nat_smoke_n03", birdy, ATTACH_GLOBAL);//煙
	SetEffectScale_(efc_birdy, 2.0);
	
	WaitTask(task_cam);
	Wait_(80)


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット6 バーディon主人公　アップ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");

	//===============================================
	//*バーディ
	// 	「さあ　着いたネー！　秘密基地とやらを　探してみるデース！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BIRDY");
	ShowMsg_("DEMO_517_MSG_060");
	KeyInputWait_();
	CloseMsgWnd_();	
	//===============================================

	Wait_(30)

	EndDemo(FADE_COLOR_BLACK);
}
