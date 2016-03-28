//=============================================
//
//		demo850[チャレンジバトル_1(戦闘前)]
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
	local task_cam, task_player_move;
	local player, aroma, efc_cam, efc_ansesu, efc_aroma;

	// ▼リソース読込と配置（この２人は各回戦共通で使用するのでココ）
	//主人公の戦闘前初期位置設定
	player = GetPlayerId_();
	SetPointPos_(player, "player000");
	SetDir_(player, 270);
	SetManualCalcAlpha_(player, true);

	// アロマ２号
	aroma = ArrangePointNpc_(ReadNpc_("n018"), "npc_aroma000");
	SetFace_(aroma, "Face_smile");
	SetDir_(aroma, 0);
	SetManualCalcAlpha_(aroma, true);

	// ▼非常駐モーション読込
	local player_battle_L = ReadMotion_(player, "Player_battle_L");	// 戦闘待機L
	
	// ▼エフェクト読み込み
	LoadEffect_("ef733_01_sym_shuchusen01");						// 集中線
	LoadEffect_("ef721_03_nat_smoke_n03");							// 煙
	LoadEffect_("ef850_01_smoke_fall");								// 砂煙
	LoadEffect_("ef732_15_holography02");							// ホログラム表現　出現
	LoadEffect_("ef732_14_holography01");							// ホログラム表現　常駐

//■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
// ▼チャレンジバトル1回戦 VSノチョリン
//■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
	
	//各回戦処理の呼び出し（１つのデモ内で複数イベントを行うので、大元で分割する）
	switch ( GetNumFlg_("NUM_CHALLENGE_BATTLE_MAIN") ) {

	case 0:
	// ■ノチョリン
		nocho <- ArrangePointNpc_(ReadNpc_("n043"), "npc_VS1_nocho000");							//ノチョリンの読み込みと位置設定
		SetDir_(nocho, 90);
		
		// ▼非常駐モーション読込
		g_ex_motion <- ReadMotion_(nocho, "n002_hand_up");											//会話→手をあげる（エースのモーションの流用）
		g_ex_motion_L <- ReadMotion_(nocho, "n002_hand_up_L");										//手をあげるL（エースのモーションの流用）
		
		SetVisible(nocho, false);																	//演出まで舞台袖（一旦非表示）
		SetManualCalcAlpha_(nocho, true);

	// ★プリズニャン
		g_enemy_monster01 <- ArrangePointNpc_(ReadNpc_("m040_00"), "npc_VS1_priz000");				//敵モンスター1体目の読み込みと位置設定
		SetScaleSilhouette(g_enemy_monster01, SCALE.S, SILHOUETTE_WIDTH.S);							//Sサイズ
		SetVisible(g_enemy_monster01, false);														//演出まで舞台袖（一旦非表示）

	// ★フォンデュ
		g_enemy_monster02 <- ArrangePointNpc_(ReadNpc_("m125_00"), "npc_VS1_fondu000");				//敵モンスター2体目の読み込みと位置設定
		SetScaleSilhouette(g_enemy_monster02, SCALE.N, SILHOUETTE_WIDTH.N);							//Sサイズ
		SetVisible(g_enemy_monster02, false);														//演出まで舞台袖（一旦非表示）

	// ★ドラキー
		g_enemy_monster03 <- ArrangePointNpc_(ReadNpc_("m052_00"), "npc_VS1_doraki000");			//敵モンスター3体目の読み込みと位置設定
		SetScaleSilhouette(g_enemy_monster03, SCALE.S, SILHOUETTE_WIDTH.S);							//Sサイズ
		SetVisible(g_enemy_monster03, false);														//演出まで舞台袖（一旦非表示）

	// ★ナスビナーラ
		g_enemy_monster04 <- ArrangePointNpc_(ReadNpc_("m069_00"), "npc_VS1_nasu000");				//敵モンスター4体目の読み込みと位置設定
		SetScaleSilhouette(g_enemy_monster04, SCALE.S, SILHOUETTE_WIDTH.S);							//Sサイズ
		SetVisible(g_enemy_monster04, false);														//演出まで舞台袖（一旦非表示）

	// ▼カメラ設定
		SetPointCameraEye_("cameye000");															//会場全体を映す
		SetPointCameraTarget_("camtgt000");

	//-------------------------------------------------------------------------
	//		はじまりはじまり（１回戦）
	//-------------------------------------------------------------------------
		//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
		//■カット１ 会場を映す間
		//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
		StartDemoNoFade(FADE_COLOR_BLACK);

		local task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
		WaitTask(task_cam);

		SetFade_(FADE_OUT, FADE_COLOR_BLACK, 5);								//カット切り替え暗転
		WaitFade_();
		
		//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
		//■カット２ アロマ２号を映す
		//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
		SetPointCameraEye_("cameye001");
		SetPointCameraTarget_("camtgt001");

		SetFade_(FADE_IN, FADE_COLOR_BLACK, 5);									//カット切り替え暗転
		WaitFade_();
		
		SetMotion_(aroma, MOT_TALKLOOP, BLEND_XL);								// アロマ２号の会話モーション
		
		//===============================================
		//■アロマ
		//「さあて　みなさん　お待ちかね！
		//　格闘場名物　イベントバトルの　はじまりよ！
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_AROMA_NO2");
		ShowMsg_("DEMO_850_VS1_MSG_010");
		KeyInputWait_();
		//===============================================
		
		//===============================================
		//■アロマ
		//「まずは　みなさん　ご存じ　我らがヒーロー！
		//　モンスターマスター　<name_player/>ーっ！！
		//-----------------------------------------------
		ShowMsg_("DEMO_850_VS1_MSG_020");
		KeyInputWait_();
		CloseMsgWnd_();
		//==============================================
		
		SetMotion_(aroma, MOT_WAIT, BLEND_XL);									// アロマ２号の待機モーション
		Wait_(10);

		SetFade_(FADE_OUT, FADE_COLOR_BLACK, 5);								//カット切り替え暗転
		WaitFade_();
		
		//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
		//■カット３ 主人公入場を映す
		//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
		SetPointCameraEye_("cameye002");
		SetPointCameraTarget_("camtgt002");
		SetMotion_(player, MOT_WALK, BLEND_L);									//暗転中から主人公歩き始め
		task_player_move = Task_MoveForward_(player, 1.0, false);

		SetFade_(FADE_IN, FADE_COLOR_BLACK, 5);									//カット切り替え暗転明け
		WaitFade_();
		PlayLoopSE_("SE_WIFI_001");												//■SE:歓声（ループ）
		Wait_(80);																//主人公が歩く間
		DeleteTask_(task_player_move);
		SetMotion_(player, player_battle_L, BLEND_XL);
		Wait_(5);
		
		//===============================================
		//■アロマ
		//「そして　対するは…
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_AROMA_NO2");
		ShowMsg_("DEMO_850_VS1_MSG_030");
		KeyInputWait_();
		CloseMsgWnd_();
		//==============================================
		StopLoopSE_(15);
		Wait_(5);
		SetFade_(FADE_OUT, FADE_COLOR_BLACK, 5);								//カット切り替え暗転（擬似デモ中なので、上画面のみ）
		WaitFade_();
		
		//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
		//■カット４ ノチョリン登場
		//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
		task_cam = Task_AnimeMoveCamera_("VS1_anmeye001", "VS1_anmtgt01");
		DeleteTask_(task_cam);

		SetVisible(nocho, true);												//ノチョリン表示＆歩き
		SetAlpha_(nocho, ALPHA_EXIST);
		SetMotion_(nocho, MOT_WALK, BLEND_N);
		local task_nocho = Task_MoveForward_(nocho, 1.0, false);				//移動
		SetMotionSpeed_(nocho, 1.0);
		SetFade_(FADE_IN, FADE_COLOR_BLACK, 5);									//カット切り替え暗転明け
		WaitFade_();
		
		//===============================================
		//■アロマ
		//「逃げ足ならば　誰にも負けない！
		//　ボーショックからも　逃げのびたサバイバー……
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_AROMA_NO2");
		ShowMsg_("DEMO_850_VS1_MSG_040");
		
		Wait_(25);
		SetMotion_(nocho, MOT_WAIT, BLEND_L);
		DeleteTask_(task_nocho);
		SetMotionSpeed_(nocho, 1.0);

		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================
		task_cam = Task_AnimeMoveCamera_("VS1_anmeye001", "VS1_anmtgt01");
		StartBlurEffect_();														//ブラー設定
		Wait_(30);
		EndBlurEffect_();
		Wait_(5);
		PlayLoopSE_("SE_WIFI_001");												// ■SE:歓声（ループ）
		efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", CAMERA_DEF);		// 集中線
		WaitTask(task_cam);
		//===============================================
		//■アロマ
		//「ノチョリーンッ！！
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_AROMA_NO2");
		ShowMsg_("DEMO_850_VS1_MSG_050");
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================
		Wait_(10);
		StopLoopSE_(20);
		DeleteEffectEmitter_(efc_cam);
		
		SetMotion_(nocho, MOT_TALKLOOP, BLEND_XL);								//ノチョリンの会話モーション
		//===============================================
		//■ノチョリン
		//「お前を　見ているうちに
		//　オイラも　マスターをやってみたくなって……
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_NOCHORIN");
		ShowMsg_("DEMO_850_VS1_MSG_060");
		KeyInputWait_();
		//===============================================
		
		//===============================================
		//■ノチョリン
		//「ひそかに　修行しまくって
		//　この格闘場に　立つ資格を　得たっちょ！
		//-----------------------------------------------
		ShowMsg_("DEMO_850_VS1_MSG_070");
		KeyInputWait_();
		//===============================================
		
		Wait_(10);
		SetMotion_(nocho, g_ex_motion, BLEND_M);								//ノチョリンの戦闘開始前モーション
		WaitMotion(nocho);
		SetMotion_(nocho, g_ex_motion_L, BLEND_M);
		//===============================================
		//■ノチョリン
		//「さあ　修行の成果を　ぜーんぶ！
		//　お前に　ぶつけさせて　もらうっちょーっ！！
		//-----------------------------------------------
		ShowMsg_("DEMO_850_VS1_MSG_080");
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================
		
		SetFade_(FADE_OUT, FADE_COLOR_BLACK, 5);								//カット切り替え暗転
		WaitFade_();
		
		//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
		//■カット５ 敵モンスターパーティを映す
		//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
		
		SetPointCameraEye_("VS1_cameye003");
		SetPointCameraTarget_("VS1_camtgt003");

 		SetVisible(nocho, false);												//ノチョリンの非表示
		SetVisible(aroma, false);												// レフェリーのアロマを消す
		SetVisible(player, false);												//主人公非表示
		
		//敵モンスターパーティを表示
		SetVisible(g_enemy_monster01, true);
		SetVisible(g_enemy_monster02, true);
		SetVisible(g_enemy_monster03, true);
		SetVisible(g_enemy_monster04, true);

		SetFade_(FADE_IN, FADE_COLOR_BLACK, 5);									//カット切り替え暗転明け
		WaitFade_();
		
		//===============================================
		//■アロマ
		//「それでは　イベントバトル　第1戦
		//　レディー……ゴー！！
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_AROMA_NO2");
		ShowMsg_("DEMO_850_VS1_MSG_090");
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================
		SetMotionSpeed_(g_enemy_monster01, 0.8);
		SetMotion_(g_enemy_monster01, MOT_ATTACK, BLEND_M);
		SetMotion_(g_enemy_monster02, MOT_ATTACK, BLEND_M);
		SetMotion_(g_enemy_monster03, MOT_ATTACK, BLEND_M);
		SetMotion_(g_enemy_monster04, MOT_ATTACK, BLEND_M);

		break;
		
//■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
// ▼チャレンジバトル2回戦 VSキング
//■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
	case 1:
		// ■キング
		king <- ArrangePointNpc_(ReadNpc_("n003"), "npc_VS2_king000");						//キングの読み込みと位置設定
		SetPointPosNoFit_(king, "npc_VS2_king000");
		SetVisible(king, false);															//演出まで舞台袖（一旦非表示）
		SetManualCalcAlpha_(king, true);
		
		local model_throne = ReadGimmick_("o_com_05");										// 玉座
		local throne = ArrangePointGimmick_("o_com_05", model_throne, "obj_throne000");
		SetVisible(throne, false);															//演出まで舞台袖（一旦非表示）
		
		// ▼非常駐モーション読込
		g_ex_talk_motion <- ReadMotion_(king, "n003_talk");									// キング待機→会話
		g_ex_talk_motion_L <- ReadMotion_(king, "n003_talk_L");								// キング会話L
		g_ex_motion <- ReadMotion_(king, "n003_stick_up");									// 待機→杖掲げ
		g_ex_motion_L <- ReadMotion_(king, "n003_stick_up_L");								// 杖掲げ


		// ★メタルキング
		g_enemy_monster01 <- ArrangePointNpc_(ReadNpc_("m006_02"), "npc_VS2_meta000");		//敵モンスター1体目の読み込みと位置設定
		SetScaleSilhouette(g_enemy_monster01, SCALE.N, SILHOUETTE_WIDTH.N);
		SetVisible(g_enemy_monster01, false);

		// ★キングリザード
		g_enemy_monster02 <- ArrangePointNpc_(ReadNpc_("m020_00"), "npc_VS2_riza000");		//敵モンスター2体目の読み込みと位置設定
		SetScaleSilhouette(g_enemy_monster02, SCALE.M, SILHOUETTE_WIDTH.M);
		SetVisible(g_enemy_monster02, false);

		// ★オークキング
		g_enemy_monster03 <- ArrangePointNpc_(ReadNpc_("m039_01"), "npc_VS2_ork000");		//敵モンスター3体目の読み込みと位置設定
		SetScaleSilhouette(g_enemy_monster03, SCALE.N, SILHOUETTE_WIDTH.N);
		SetVisible(g_enemy_monster03, false);

	//-------------------------------------------------------------------------
	//		はじまりはじまり（２回戦）
	//-------------------------------------------------------------------------
		// ▼カメラ設定
		SetPointCameraEye_("cameye000");
		SetPointCameraTarget_("camtgt000");
		
		//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
		//■カット１ 会場を映す間
		//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
		StartDemoNoFade(FADE_COLOR_BLACK);
		local task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");		//会場を映す間
		WaitTask(task_cam);

		SetFade_(FADE_OUT, FADE_COLOR_BLACK, 5);
		WaitFade_();
		
		//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
		//■カット２ アロマ２号を映す
		//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
		SetPointCameraEye_("cameye001");
		SetPointCameraTarget_("camtgt001");
		SetFade_(FADE_IN, FADE_COLOR_BLACK, 5);
		WaitFade_();
		SetMotion_(aroma, MOT_TALKLOOP, BLEND_XL);								// アロマ２号の会話モーション
		
		//===============================================
		//■アロマ
		//「さあて　みなさん　お待ちかね！
		//　格闘場名物　イベントバトルの　はじまりよ！
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_AROMA_NO2");
		ShowMsg_("DEMO_850_VS2_MSG_010");
		KeyInputWait_();
		//===============================================
		//===============================================
		//■アロマ
		//「まずは　みなさん　ご存じ　我らがヒーロー！
		//　モンスターマスター　<name_player/>ーっ！！
		//-----------------------------------------------
		ShowMsg_("DEMO_850_VS2_MSG_020");
		KeyInputWait_();
		CloseMsgWnd_();
		//==============================================

		SetMotion_(aroma, MOT_WAIT, BLEND_XL);									// アロマ２号の待機モーション
		Wait_(10);

		SetFade_(FADE_OUT, FADE_COLOR_BLACK, 5);
		WaitFade_();
		//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
		//■カット３ 主人公入場を映す
		//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
		SetPointCameraEye_("cameye002");
		SetPointCameraTarget_("camtgt002");
		SetMotion_(player, MOT_WALK, BLEND_L);									//暗転中から主人公歩き始め
		task_player_move = Task_MoveForward_(player, 1.0, false);

		SetFade_(FADE_IN, FADE_COLOR_BLACK, 5);									//カット切り替え暗転明け
		WaitFade_();
		PlayLoopSE_("SE_WIFI_001");												//■SE:歓声（ループ）
		Wait_(80);																//主人公が歩く間
		DeleteTask_(task_player_move);
		SetMotion_(player, player_battle_L, BLEND_XL);
		Wait_(5);

		//===============================================
		//■アロマ
		//「そして　対するは…
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_AROMA_NO2");
		ShowMsg_("DEMO_850_VS2_MSG_030");
		KeyInputWait_();
		CloseMsgWnd_();
		//==============================================
		StopLoopSE_(15);
		Wait_(5);
		SetFade_(FADE_OUT, FADE_COLOR_BLACK, 5);
		WaitFade_();
		//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
		//■カット４キング登場
		//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
		task_cam = Task_AnimeMoveCamera_("VS2_anmeye001", "VS2_anmtgt001");
		DeleteTask_(task_cam);
		SetVisible(king, true);													//キング表示
		SetVisible(throne, true);												//玉座表示
		SetAlpha_(king, ALPHA_EXIST);

		SetFade_(FADE_IN, FADE_COLOR_BLACK, 5);
		WaitFade_();

		//===============================================
		//■アロマ
		//「ノチョーラ族に　この人あり！
		//　一族を率いる　えらーい　おかた！！
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_AROMA_NO2");
		ShowMsg_("DEMO_850_VS2_MSG_040");
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================
		task_cam = Task_AnimeMoveCamera_("VS2_anmeye001", "VS2_anmtgt001");
		StartBlurEffect_();														//ブラー設定
		Wait_(30);
		EndBlurEffect_();
		Wait_(5);
		PlayLoopSE_("SE_WIFI_001");												// ■SE:歓声（ループ）
		efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", CAMERA_DEF);		// 集中線
		WaitTask(task_cam);
		//===============================================
		//■アロマ
		//ノチョーラ・キングだーっ！！
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_AROMA_NO2");
		ShowMsg_("DEMO_850_VS2_MSG_050");
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================
		Wait_(10);
		StopLoopSE_(20);
		DeleteEffectEmitter_(efc_cam);
		
		task_cam = Task_AnimeMoveCamera_("VS2_anmeye002", "VS2_anmtgt002");		//杖あげモーションで目が隠れるのでアングル変更
		SetMotion_(king, g_ex_talk_motion, BLEND_XL);							//キングの会話モーション
		WaitMotion(king);
		SetMotion_(king, g_ex_talk_motion_L, BLEND_XL);

		//===============================================
		//■キング
		//「あこがれた……そう　言うべきなのであろうな。
		//　まさしく　そちの姿に　あこがれたのである。
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_KING");
		ShowMsg_("DEMO_850_VS2_MSG_060");
		KeyInputWait_();
		//===============================================

		//===============================================
		//■キング
		//「そのあこがれが　余のことを　突き動かした。
		//　ガラにもなく　血が さわいだのだ。
		//-----------------------------------------------
		ShowMsg_("DEMO_850_VS2_MSG_070");
		KeyInputWait_();
		//===============================================
		Wait_(10);
		
		SetMotion_(king, g_ex_motion, BLEND_M);									//キングの戦闘開始前モーション
		WaitMotion(king);
		SetMotion_(king, g_ex_motion_L, BLEND_M);
		//===============================================
		//■キング
		//「さあ　<name_player/>よ　ひと勝負しようぞ！
		//　えんりょはいらぬぞ　かかってまいれ！
		//-----------------------------------------------
		ShowMsg_("DEMO_850_VS2_MSG_080");
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================
		
		SetFade_(FADE_OUT, FADE_COLOR_BLACK, 5);
		WaitFade_();
		DeleteTask_(task_cam);
		//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
		//■カット５ 敵モンスターパーティを映す
		//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
		SetPointCameraEye_("VS2_cameye003");
		SetPointCameraTarget_("VS2_camtgt003");
		
		SetVisible(king, false);												//キング非表示
		SetVisible(throne, false);												//玉座非表示
		SetVisible(player, false);												//主人公非表示
		SetVisible(aroma, false);												// レフェリーのアロマを消す

		SetVisible(g_enemy_monster01, true);									//敵モンスターパーティを表示
		SetVisible(g_enemy_monster02, true);
		SetVisible(g_enemy_monster03, true);

		SetFade_(FADE_IN, FADE_COLOR_BLACK, 5);
		WaitFade_();

		//===============================================
		//■アロマ
		//「それでは　イベントバトル　第２戦
		//　レディー……ゴー！！
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_AROMA_NO2");
		ShowMsg_("DEMO_850_VS2_MSG_090");
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================
		SetMotionSpeed_(g_enemy_monster02, 0.7);

		SetMotion_(g_enemy_monster01, MOT_ATTACK, BLEND_M);
		SetMotion_(g_enemy_monster02, MOT_ATTACK, BLEND_M);
		SetMotion_(g_enemy_monster03, MOT_ATTACK, BLEND_M);
		break;
		
//■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
// ▼チャレンジバトル3回戦 VSレナーテ
//■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
	case 2:
	// ■レナーテ
		rena <- ArrangePointNpc_(ReadNpc_("n007"), "npc_VS3_rena000");			//レナーテの読み込みと位置設定
		SetDir_(rena, 90);
		SetStepSe_(rena, SILENT_STEP_SE);										// 足音を無音にする

		// ▼非常駐モーション読込
		local g_ex_motion_S = ReadMotion_(rena, "n007_attack_start");			//攻撃開始
		local g_ex_motion_SL = ReadMotion_(rena, "n007_attack_start_L");
		local g_ex_motion = ReadMotion_(rena, "n007_attack");					//攻撃
		local g_ex_motion_L = ReadMotion_(rena, "n007_attack_L");
		local rena_talk = ReadMotion_(rena, "n007_talk01");						// 会話開始（手を胸にあてる）
		local rena_talk_L = ReadMotion_(rena, "n007_talk01_L");					// 会話L（手を胸にあてる）
		local rena_look_down = ReadMotion_(rena, "n007_look_down_L");			// うつむき待機
		local rena_caution = ReadMotion_(rena, "n007_caution_L");				// 警戒L

		SetVisible(rena, false);
		SetManualCalcAlpha_(rena, true);
		
	// ★巨大バーディ
		birdy <- ArrangePointNpc_(ReadNpc_("n019"), "npc_VS3_birdy000");						//敵モンスター1体目の読み込みと位置設定
		SetDir_(birdy, 90);
		SetScaleSilhouette(birdy, SCALE.G, SILHOUETTE_WIDTH.G);
		SetVisible(birdy, false);
		
		// ▼非常駐モーション読込
		local birdy_idol = ReadMotion_(birdy, "n019_idol");										// 待機L
		local birdy_flight_Hovering_L = ReadMotion_(birdy, "n019_flight_Hovering_L");			// 飛行(ホバリング)L
		local birdy_wing_Appeal = ReadMotion_(birdy, "n019_wing_Appeal");						// 決めポーズ
		local birdy_wing_Appeal_L = ReadMotion_(birdy, "n019_wing_Appeal_L");					// 決めポーズL
		
	//-------------------------------------------------------------------------
	//		はじまりはじまり（３回戦）
	//-------------------------------------------------------------------------
	// ▼カメラ設定
		SetPointCameraEye_("cameye000");
		SetPointCameraTarget_("camtgt000");
		
		//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
		//■カット１ 会場を映す間
		//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
		StartDemoNoFade(FADE_COLOR_BLACK);

		local task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
		WaitTask(task_cam);

		SetFade_(FADE_OUT, FADE_COLOR_BLACK, 5);
		WaitFade_();
		//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
		//■カット２ アロマ２号を映す
		//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
		SetPointCameraEye_("cameye001");
		SetPointCameraTarget_("camtgt001");

		SetFade_(FADE_IN, FADE_COLOR_BLACK, 5);
		WaitFade_();

		SetMotion_(aroma, MOT_TALKLOOP, BLEND_XL);								// アロマ２号の会話モーション
		
		//===============================================
		//■アロマ
		//「さあて　みなさん　お待ちかね！
		//　格闘場名物　イベントバトルの　はじまりよ！
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_AROMA_NO2");
		ShowMsg_("DEMO_850_VS3_MSG_010");
		KeyInputWait_();
		//===============================================
		//===============================================
		//■アロマ
		//「まずは　みなさん　ご存じ　我らがヒーロー！
		//　モンスターマスター　<name_player/>ーっ！！
		//-----------------------------------------------
		ShowMsg_("DEMO_850_VS3_MSG_020");
		KeyInputWait_();
		CloseMsgWnd_();
		//==============================================
		
		SetMotion_(aroma, MOT_WAIT, BLEND_XL);									// アロマ２号の待機モーション
		Wait_(10);

		SetFade_(FADE_OUT, FADE_COLOR_BLACK, 5);
		WaitFade_();
		//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
		//■カット３ 主人公入場を映す
		//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
		SetPointCameraEye_("cameye002");
		SetPointCameraTarget_("camtgt002");
		SetMotion_(player, MOT_WALK, BLEND_L);									//暗転中から主人公歩き始め
		task_player_move = Task_MoveForward_(player, 1.0, false);

		SetFade_(FADE_IN, FADE_COLOR_BLACK, 5);									//カット切り替え暗転明け
		WaitFade_();
		PlayLoopSE_("SE_WIFI_001");												//■SE:歓声（ループ）
		Wait_(80);																//主人公が歩く間
		DeleteTask_(task_player_move);
		SetMotion_(player, player_battle_L, BLEND_XL);
		Wait_(5);
		//===============================================
		//■アロマ
		//「そして　対するは…
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_AROMA_NO2");
		ShowMsg_("DEMO_850_VS3_MSG_030");
		KeyInputWait_();
		CloseMsgWnd_();
		//==============================================
		StopLoopSE_(15);
		Wait_(5);
		SetFade_(FADE_OUT, FADE_COLOR_BLACK, 5);
		WaitFade_();
		//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
		//■カット４ レナーテ登場
		//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
		task_cam = Task_AnimeMoveCamera_("VS3_anmeye001", "VS3_anmtgt001");
		DeleteTask_(task_cam);
		SetFace_(rena, "Face_loop_close");									// 目閉じ

		SetVisible(rena, true);												//レナ表示＆歩き
		SetAlpha_(rena, ALPHA_EXIST);
		SetMotion_(rena, MOT_WALK, BLEND_N);
		local task_rena = Task_MoveForward_(rena, 0.85, false);				//移動
		SetMotionSpeed_(rena, 0.95);
		SetFade_(FADE_IN, FADE_COLOR_BLACK, 5);								//カット切り替え暗転明け
		WaitFade_();
		PlaySE_("SE_FLD_015");												// ■SE:足音

		//===============================================
		//■アロマ
		//「このブレイクワールドの　空に浮かんだ
		//　世界の大母……その分身たる　この少女っ！
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_AROMA_NO2");
		ShowMsg_("DEMO_850_VS3_MSG_040");
		
		Wait_(20);
		PlaySE_("SE_FLD_015");												// ■SE:足音
		Wait_(10);
		SetMotion_(rena, MOT_WAIT, BLEND_L);
		DeleteTask_(task_rena);
		SetMotionSpeed_(rena, 1.0);
		
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================
		task_cam = Task_AnimeMoveCamera_("VS3_anmeye001", "VS3_anmtgt001");
		SetMotion_(rena, rena_look_down, BLEND_L);								//レナーテうつむき待機

		StartBlurEffect_();														//ブラー設定
		Wait_(30);
		EndBlurEffect_();
		Wait_(5);	
		PlayLoopSE_("SE_WIFI_001");												// ■SE:歓声（ループ）
		efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", CAMERA_DEF);		// 集中線
		WaitTask(task_cam);

		//===============================================
		//■アロマ
		//「<name_player/>を　導いた者……
		//　レナーテの登場よ！！
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_AROMA_NO2");
		ShowMsg_("DEMO_850_VS3_MSG_050");
		SetMotion_(rena, MOT_WAIT, BLEND_XL);									//レナーテうつむき待機
		SetFace_(rena, "Face_default");											// 目開け
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================
		Wait_(10);
		StopLoopSE_(20);
		DeleteEffectEmitter_(efc_cam);
		
		SetMotion_(rena, rena_talk, BLEND_XL);									// レナ話す
		WaitMotion(rena);
		SetMotion_(rena, rena_talk_L, BLEND_M);

		//===============================================
		//■レナーテ
		//「前の戦いでは　あなたに　頼りきりだった。
		//　けど　それでは　ダメだと思ったの……。
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_RENERTE");
		ShowMsg_("DEMO_850_VS3_MSG_060");
		KeyInputWait_();
		//===============================================

		//===============================================
		//■レナーテ
		//「あなたように　強くなる。
		//　この世界を……これからも　守るために。
		//-----------------------------------------------
		ShowMsg_("DEMO_850_VS3_MSG_070");
		KeyInputWait_();
		//===============================================
		Wait_(10);

		SetMotion_(rena, g_ex_motion_S, BLEND_XL);								//レナーテの戦闘開始前モーション
		WaitMotion(rena);
		SetMotion_(rena, g_ex_motion_SL, BLEND_XL);

		//===============================================
		//■レナーテ
		//「バーディ！　私たちの　今のチカラを
		//　<name_player/>に　見てもらうわ……！
		//-----------------------------------------------
		ShowMsg_("DEMO_850_VS3_MSG_080");
		SetMotion_(rena, g_ex_motion, BLEND_XL);
		WaitMotion(rena);
		SetMotion_(rena, g_ex_motion_L, BLEND_XL);
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================

		SetFade_(FADE_OUT, FADE_COLOR_BLACK, 5);
		WaitFade_();
		
		//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
		//■カット６ 敵モンスターパーティを映す
		//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
		SetVisible(aroma, false);																	// レフェリーのアロマを消す
		SetVisible(player, false);																	//主人公非表示
		SetVisible(rena, false);																	//レナーテ非表示
		SetPointCameraEye_("VS3_cameye003");
		SetPointCameraTarget_("VS3_camtgt003");

		SetVisible(birdy, true);																	//敵モンスターパーティを表示
		SetMotion_(birdy, birdy_flight_Hovering_L, BLEND_N);										//バーディホバリングモーション
		local task_birdy = Task_AnimeMoveNoDirNoFit_(birdy, "anm_VS3_birdy000");
		SetFade_(FADE_IN, FADE_COLOR_BLACK, 5);
		WaitFade_();
		PlaySE_("SE_FLD_219");																		// ■SE:高空ライド羽
		SetMotion_(rena, rena_caution, BLEND_XL);													//レナーテ構えモーション
		Wait_(35);
		PlaySE_("SE_FLD_219");																		// ■SE:高空ライド羽
		Wait_(35);
		SetMotion_(birdy, birdy_idol, BLEND_XL);													//バーディ待機モーション
		Wait_(15);
		
		StartDecayEarthQuake_(20, 3, 3)																//地震
		PlaySE_("SE_DEM_014");
		local efc_birdy = SetSelectBoneEffect_("ef721_03_nat_smoke_n03", birdy, ATTACH_GLOBAL);		//煙
		SetEffectScale_(efc_birdy, 3.0);
		
		//===============================================
		//■アロマ
		//「それでは　イベントバトル　第3戦
		//　レディー……ゴー！！
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_AROMA_NO2");
		ShowMsg_("DEMO_850_VS3_MSG_090");
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================
		SetMotion_(birdy, birdy_wing_Appeal, BLEND_L)												//鳥　決めポーズ
		break;
		
//■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
// ▼チャレンジバトル4回戦 VSアンセス
//■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
	case 3:
		
	// ■アンセス
		ansesu <- ArrangePointNpc_(ReadNpc_("n036"), "npc_VS4_ansesu000");					//アンセスの読み込みと位置設定
		SetVisible(ansesu, false);
		SetManualCalcAlpha_(ansesu, true);

		// ▼非常駐モーション読込
		local ansesu_battle = ReadMotion_(ansesu, "Player_battle_L");
		local ansesu_land = ReadMotion_(ansesu, "Player_hero_landing");						// 着地
		local ansesu_float_L = ReadMotion_(ansesu, "Player_ride_on");					// 浮くL
		local ansesu_one_knee = ReadMotion_(ansesu, "Player_one_knee");						// 上半身を起こす→立膝
		local ansesu_up03_L = ReadMotion_(ansesu, "Player_one_knee_L");						// 片膝
		
	// ★ボーショック
		g_enemy_monster01 <- ArrangePointNpc_(ReadNpc_("m207_00"), "npc_VS4_bosho000");		//敵モンスター1体目の読み込みと位置設定
		SetScaleSilhouette(g_enemy_monster01, 0.8, SILHOUETTE_WIDTH.N);
		SetVisible(g_enemy_monster01, false);
		
	// ★ブンドルド
		g_enemy_monster02 <- ArrangePointNpc_(ReadNpc_("m203_00"), "npc_VS4_bundo000");		//敵モンスター2体目の読み込みと位置設定
		SetScaleSilhouette(g_enemy_monster02, SCALE.N, SILHOUETTE_WIDTH.N);
		SetVisible(g_enemy_monster02, false);

	// ★アーザムーク
		g_enemy_monster03 <- ArrangePointNpc_(ReadNpc_("m204_00"), "npc_VS4_aza000");		//敵モンスター3体目の読み込みと位置設定
		SetScaleSilhouette(g_enemy_monster03, 0.8, SILHOUETTE_WIDTH.N);
		SetVisible(g_enemy_monster03, false);
		
	// ★イッタブル
		g_enemy_monster04 <- ArrangePointNpc_(ReadNpc_("m205_00"), "npc_VS4_itta000");		//敵モンスター4体目の読み込みと位置設定
		SetScaleSilhouette(g_enemy_monster04, SCALE.N, SILHOUETTE_WIDTH.N);
		SetVisible(g_enemy_monster04, false);


	//-------------------------------------------------------------------------
	//		はじまりはじまり（４回戦）
	//-------------------------------------------------------------------------
		// ▼カメラ設定
		SetPointCameraEye_("cameye000");
		SetPointCameraTarget_("camtgt000");
		
		//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
		//■カット１ 会場を映す間
		//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
		StartDemoNoFade(FADE_COLOR_BLACK);
		local task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
		WaitTask(task_cam);

		SetFade_(FADE_OUT, FADE_COLOR_BLACK, 5);
		WaitFade_();
		//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
		//■カット２ アロマ２号を映す
		//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
		SetPointCameraEye_("cameye001");
		SetPointCameraTarget_("camtgt001");
		SetFade_(FADE_IN, FADE_COLOR_BLACK, 5);
		WaitFade_();

		SetMotion_(aroma, MOT_TALKLOOP, BLEND_XL);								// アロマ２号の会話モーション

		//===============================================
		//■アロマ
		//「さあて　みなさん　お待ちかね！
		//　格闘場名物　イベントバトルの　はじまりよ！
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_AROMA_NO2");
		ShowMsg_("DEMO_850_VS4_MSG_010");
		KeyInputWait_();
		//===============================================
		//===============================================
		//■アロマ
		//「まずは　みなさん　ご存じ　我らがヒーロー！
		//　モンスターマスター　<name_player/>ーっ！！
		//-----------------------------------------------
		ShowMsg_("DEMO_850_VS4_MSG_020");
		KeyInputWait_();
		CloseMsgWnd_();
		//==============================================
		
		SetMotion_(aroma, MOT_WAIT, BLEND_XL);									// アロマ２号の待機モーション

		Wait_(10);

		SetFade_(FADE_OUT, FADE_COLOR_BLACK, 5);
		WaitFade_();
		//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
		//■カット３ 主人公入場を映す
		//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
		SetPointCameraEye_("cameye002");
		SetPointCameraTarget_("camtgt002");
		SetMotion_(player, MOT_WALK, BLEND_L);									//暗転中から主人公歩き始め
		task_player_move = Task_MoveForward_(player, 1.0, false);

		SetFade_(FADE_IN, FADE_COLOR_BLACK, 5);									//カット切り替え暗転明け
		WaitFade_();
		PlayLoopSE_("SE_WIFI_001");												//■SE:歓声（ループ）
		Wait_(80);																//主人公が歩く間
		DeleteTask_(task_player_move);
		SetMotion_(player, player_battle_L, BLEND_XL);
		Wait_(5);

		//===============================================
		//■アロマ
		//「そして　対するは…
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_AROMA_NO2");
		ShowMsg_("DEMO_850_VS4_MSG_030");
		KeyInputWait_();
		CloseMsgWnd_();
		//==============================================
		StopLoopSE_(15);
		Wait_(5);
		SetFade_(FADE_OUT, FADE_COLOR_BLACK, 5);
		WaitFade_();
		
		//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
		//■カット４ アンセス登場！！！！！
		//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
		task_cam = Task_AnimeMoveCamera_("VS4_anmeye001", "VS4_anmtgt001");
		DeleteTask_(task_cam);
		
		SetFade_(FADE_IN, FADE_COLOR_BLACK, 5);
		WaitFade_();

		//===============================================
		//■アロマ
		//レジスタンス最強の　モンスターマスターにして
		//　故郷の星の　モンスターバトルＧＰ王者！
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_AROMA_NO2");
		ShowMsg_("DEMO_850_VS4_MSG_040");
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================
		task_cam = Task_AnimeMoveCamera_("VS4_anmeye001", "VS4_anmtgt001");
		SetVisible(ansesu, true);														//アンセス表示
		SetFace_(ansesu, "Face_smile");													//笑顔
		SetAlpha_(ansesu, ALPHA_EXIST);
		SetMotion_(ansesu, ansesu_float_L, BLEND_N);									//浮く（飛び降りる）

		local task_ansesu = Task_AnimeMoveNoDirNoFit_(ansesu, "anm_VS4_ansesu000");		//アンセス 派手な登場
		PlaySE_("SE_DEM_132");															//■SE:着地

		Wait_(18);
		SetMotion_(ansesu, ansesu_land, 14);
		Wait_(8)
		StartDecayEarthQuake_(10.0,3.0,0.8);												//地震
		local efc = SetSelectBoneEffectSetOffset_("ef850_01_smoke_fall", ansesu, ATTACH_GLOBAL, Vec3(0,0,0));		//煙エフェクト
		SetEffectScale_(efc, 0.3);

		Wait_(30);
//		SetMotion_(ansesu, ansesu_one_knee, BLEND_L);									//アンセス立つ
//		Wait_(10);
		SetMotion_(ansesu, MOT_WAIT, BLEND_XL);											//アンセス待機モーション
		Wait_(10);
		efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", CAMERA_DEF);				// 集中線
		
		Wait_(10);
		PlayLoopSE_("SE_WIFI_001");														// ■SE:歓声（ループ）
		WaitTask(task_cam);
		//===============================================
		//■アロマ
		//「アンセスだーっ！！
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_AROMA_NO2");
		ShowMsg_("DEMO_850_VS4_MSG_050");
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================
		task_cam = Task_AnimeMoveCamera_("VS4_anmeye002", "VS4_anmtgt002");
		Wait_(10);
		StopLoopSE_(20);
		DeleteEffectEmitter_(efc_cam);
		SetMotion_(ansesu, MOT_TALKLOOP, BLEND_XL);										//アンセスの会話モーション

		//===============================================
		//■アンセス
		//「へへっ！　おどろいたか？
		//　といっても　オレは　本物じゃない。
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_ANSESU");
		ShowMsg_("DEMO_850_VS4_MSG_060");
		KeyInputWait_();
		//===============================================

		//===============================================
		//■アンセス
		//「テレジアの持っていた　データから
		//　全盛期の姿を　再現された　ホログラムさ。
		//-----------------------------------------------
		ShowMsg_("DEMO_850_VS4_MSG_070");
		
		PlaySE_("SE_DEM_068");
		efc_ansesu = SetBoneEffect_("ef732_15_holography02", ansesu);					//ホログラム出現
		SetAlpha_(ansesu, ALPHA_HALF);
		Wait_(3);
		SetAlpha_(ansesu, ALPHA_EXIST);
		KeyInputWait_();
		//===============================================
		Wait_(10);
		SetMotion_(ansesu, ansesu_battle, BLEND_XL);									//アンセスの戦闘開始前モーション
		//===============================================
		//■アンセス
		//「だが　チカラは　本物と変わりないぞ。
		//　さあ！　かかってこい　<name_player/>！！
		//-----------------------------------------------
		ShowMsg_("DEMO_850_VS4_MSG_080");
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================
		Wait_(10);
		SetFade_(FADE_OUT, FADE_COLOR_BLACK, 5);
		WaitFade_();
		DeleteTask_(task_cam);
		//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
		//■カット６ 敵モンスターパーティを映す
		//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
		SetPointCameraEye_("VS4_cameye003");
		SetPointCameraTarget_("VS4_camtgt003");
		SetVisible(player, false);														//主人公非表示
		SetVisible(ansesu, false);														//アンセス非表示

		SetVisible(g_enemy_monster01, true);											//敵モンスターパーティを表示
		SetVisible(g_enemy_monster02, true);
		SetVisible(g_enemy_monster03, true);
		SetVisible(g_enemy_monster04, true);
		
		SetFade_(FADE_IN, FADE_COLOR_BLACK, 5);
		WaitFade_();

		//===============================================
		//■アロマ
		//「それでは　イベントバトル　第4戦
		//　レディー……ゴー！！
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_AROMA_NO2");
		ShowMsg_("DEMO_850_VS4_MSG_090");
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================
		SetMotionSpeed_(g_enemy_monster04, 1.3);										//イッタブル モーション早く
		SetMotion_(g_enemy_monster01, MOT_SPELL_ACTUATE, BLEND_M);
		SetMotion_(g_enemy_monster02, MOT_SWORD_ACTUATE, BLEND_M);
		SetMotion_(g_enemy_monster03, MOT_SPELL_ACTUATE, BLEND_M);
		SetMotion_(g_enemy_monster04, MOT_SPELL_ACTUATE, BLEND_M);
		
		break;
		
//■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
// ▼チャレンジバトル5回戦 VSアロマ
//■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
	// ■アロマ
	case 4:
		aroma_VS <- ArrangePointNpc_(ReadNpc_("n018"), "npc_VS5_aroma000");				//アロマ2号(対戦)の読み込みと位置設定
		SetStepSe_(aroma_VS, SILENT_STEP_SE);											// 足音を無音にする
		SetVisible(aroma_VS, false);
		SetManualCalcAlpha_(aroma_VS, true);
		
		// ▼非常駐モーション読込
		g_ex_motion <- ReadMotion_(aroma_VS, "n018_angry");								// 怒り
		g_ex_motion_L <- ReadMotion_(aroma_VS, "n018_angry_L");							// 怒りL
		g_ex_motion_L2 <- ReadMotion_(aroma_VS, "n018_guard_L");						// 構えるL

	// ★サンチョ
		sancho <- ArrangePointNpc_(ReadNpc_("m179_00"), "npc_VS5_sancho000");			//敵モンスター1体目の読み込みと位置設定
		SetScaleSilhouette(sancho, 0.8, 0.8);
		SetVisible(sancho, false);
		
	// ★ノチョーラロボ
		robo <- ArrangePointNpc_(ReadNpc_("m174_00"), "npc_VS5_robo000");				//敵モンスター2体目の読み込みと位置設定
		SetScaleSilhouette(robo, 2.0, 2.0);
		SetVisible(robo, false);

	//-------------------------------------------------------------------------
	//		はじまりはじまり（５回戦）
	//-------------------------------------------------------------------------
		SetPointCameraEye_("cameye000");
		SetPointCameraTarget_("camtgt000");
		
		//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
		//■カット１ 会場を映す間
		//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
		StartDemoNoFade(FADE_COLOR_BLACK);
		local task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");		//会場を映す間
		WaitTask(task_cam);

		SetFade_(FADE_OUT, FADE_COLOR_BLACK, 5);
		WaitFade_();

		//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
		//■カット２ アロマ２号を映す
		//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
		SetPointCameraEye_("cameye001");
		SetPointCameraTarget_("camtgt001");
		SetFade_(FADE_IN, FADE_COLOR_BLACK, 5);
		WaitFade_();

		SetMotion_(aroma, MOT_TALKLOOP, BLEND_XL);								// アロマ２号の会話モーション
		
		//===============================================
		//■アロマ
		//「さあて　みなさん　お待ちかね！
		//　格闘場名物　イベントバトルの　はじまりよ！
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_AROMA_NO2");
		ShowMsg_("DEMO_850_VS5_MSG_010");
		KeyInputWait_();
		//===============================================
		//===============================================
		//■アロマ
		//「まずは　みなさん　ご存じ　我らがヒーロー！
		//　モンスターマスター　<name_player/>ーっ！！
		//-----------------------------------------------
		ShowMsg_("DEMO_850_VS5_MSG_020");
		KeyInputWait_();
		CloseMsgWnd_();
		//==============================================
		
		SetMotion_(aroma, MOT_WAIT, BLEND_XL);									// アロマ２号の待機モーション

		Wait_(10);

		SetFade_(FADE_OUT, FADE_COLOR_BLACK, 5);
		WaitFade_();
		//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
		//■カット３ 主人公入場を映す
		//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
		SetPointCameraEye_("cameye002");
		SetPointCameraTarget_("camtgt002");
		SetMotion_(player, MOT_WALK, BLEND_L);									//暗転中から主人公歩き始め
		task_player_move = Task_MoveForward_(player, 1.0, false);

		SetFade_(FADE_IN, FADE_COLOR_BLACK, 5);									//カット切り替え暗転明け
		WaitFade_();
		PlayLoopSE_("SE_WIFI_001");												//■SE:歓声（ループ）
		Wait_(80);																//主人公が歩く間
		DeleteTask_(task_player_move);
		SetMotion_(player, player_battle_L, BLEND_XL);
		Wait_(5);

		//===============================================
		//■アロマ
		//「そして　対するは…
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_AROMA_NO2");
		ShowMsg_("DEMO_850_VS5_MSG_030");
		KeyInputWait_();
		CloseMsgWnd_();
		//==============================================
		StopLoopSE_(15);
		Wait_(5);
		SetFade_(FADE_OUT, FADE_COLOR_BLACK, 5);
		WaitFade_();
		
		//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
		//■カット４ アロマ2号の足元を映す
		//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
		task_cam = Task_AnimeMoveCamera_("VS5_anmeye001", "VS5_anmtgt001");

		SetVisible(aroma_VS, true);												//アロマ2号表示（＆カメラ近くでも透明にならない設定）
		SetAlpha_(aroma_VS, ALPHA_EXIST);
		
		SetMotion_(aroma_VS, MOT_WALK, BLEND_N);
		local task_aroma = Task_AnimeMove_(aroma_VS, "anm_VS5_aroma000");		//移動

		SetFade_(FADE_IN, FADE_COLOR_BLACK, 5);
		WaitFade_();

		PlaySE_("SE_FLD_015");												// ■SE:足音
		Wait_(22);
		PlaySE_("SE_FLD_015");												// ■SE:足音
		Wait_(8);
		PlaySE_("SE_DEM_068");
		efc_aroma = SetBoneEffect_("ef732_15_holography02", aroma_VS);		//ホログラム出現
		SetAlpha_(aroma_VS, ALPHA_HALF);
		Wait_(3);
		SetAlpha_(aroma_VS, ALPHA_EXIST);
		
		Wait_(20);
		PlaySE_("SE_FLD_015");												// ■SE:足音
		Wait_(7);
		PlaySE_("SE_DEM_068");
		efc_aroma = SetBoneEffect_("ef732_15_holography02", aroma_VS);		//ホログラム出現
		SetAlpha_(aroma_VS, ALPHA_HALF);
		Wait_(3);
		SetAlpha_(aroma_VS, ALPHA_EXIST);
		
		WaitTask(task_aroma);
		SetMotion_(aroma_VS, MOT_WAIT, BLEND_L);
		WaitTask(task_cam);
		
		//===============================================
		//■アロマ
		//「あるときは　レジスタンスの指導者……
		//　そして　また　あるときは　あんたの協力者……
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_AROMA_NO2");
		ShowMsg_("DEMO_850_VS5_MSG_040");
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================
		task_cam = Task_AnimeMoveCamera_("VS5_anmeye002", "VS5_anmtgt002");
		
		Wait_(10);
		PlaySE_("SE_DEM_068");
		efc_aroma = SetBoneEffect_("ef732_15_holography02", aroma_VS);			//ホログラム出現
		SetAlpha_(aroma_VS, ALPHA_HALF);
		Wait_(3);
		SetAlpha_(aroma_VS, ALPHA_EXIST);
		Wait_(24);

		PlayLoopSE_("SE_WIFI_001");												// ■SE:歓声（ループ）
		efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", CAMERA_DEF);		// 集中線
		
		SetFace_(aroma_VS, "Face_smile");										//笑顔
		SetMotion_(aroma_VS, g_ex_motion, BLEND_XL);							//アロマ2号の怒り
		WaitMotion(aroma_VS);
		SetMotion_(aroma_VS, g_ex_motion_L, BLEND_XL);							//アロマ2号の怒りL
		WaitTask(task_cam);
		//===============================================
		//■アロマ
		//「そう！　今度の相手は　このあたし！
		//　天才美少女科学者　アロマさまよ！！
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_AROMA_NO2");
		ShowMsg_("DEMO_850_VS5_MSG_050");
		KeyInputWait_();
		//===============================================
		DeleteEffectEmitter_(efc_cam); 
		StopLoopSE_(20);
		Wait_(10);
		SetMotion_(aroma_VS, MOT_TALK, BLEND_XL);								//アロマ2号 話す
		WaitMotion(aroma_VS);
		SetMotion_(aroma_VS, MOT_TALKLOOP, BLEND_M);

		//===============================================
		//■アロマ2号
		//「って……もちろん　私は　オリジナルのコピー。
		//　でも　チカラは　オリジナルと同等だからね。
		//-----------------------------------------------
		ShowMsg_("DEMO_850_VS5_MSG_060");
		KeyInputWait_();
		//===============================================

		//===============================================
		//■アロマ2号
		//「あたしは　科学だけの女じゃない。
		//　マスターとしても　一流だと　教えてあげる！
		//-----------------------------------------------
		ShowMsg_("DEMO_850_VS5_MSG_070");
		KeyInputWait_();
		//===============================================
		Wait_(10);
		
		SetMotion_(aroma_VS, g_ex_motion_L2, BLEND_XL);							//アロマ2号の構えるモーション
		//===============================================
		//■アロマ2号
		//「さあ　かかってきなさい　<name_player/>！
		//　コテンパンに　してあげるわ！
		//-----------------------------------------------
		ShowMsg_("DEMO_850_VS5_MSG_080");
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================

		SetFade_(FADE_OUT, FADE_COLOR_BLACK, 5);
		WaitFade_();
		
		SetVisible(aroma, false);																	// レフェリーのアロマを消す
		SetVisible(player, false);																	//主人公非表示
		SetVisible(aroma_VS, false);																//対戦相手のアロマ非表示
		//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
		//■カット６ 敵モンスターパーティを映す
		//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
		SetPointCameraEye_("VS5_cameye003");
		SetPointCameraTarget_("VS5_camtgt003");

		SetVisible(robo, true);																		//ノチョロボを表示
		SetMotion_(robo, MOT_JUMP_DOWN, BLEND_N);													//ロボホバリングモーション
		SetVisible(sancho, true);																	//サンチョ表示
		SetMotion_(sancho, MOT_JUMP_DOWN, BLEND_N);													//サンチョホバリングモーション
		
		local task_robo = Task_AnimeMoveNoDirNoFit_(robo, "anm_VS5_robo000");
		local task_sancho = Task_AnimeMoveNoDirNoFit_(sancho, "anm_VS5_sancho000");

		SetFade_(FADE_IN, FADE_COLOR_BLACK, 5);
		WaitFade_();
		
		Wait_(35);
		SetMotion_(robo, MOT_WAIT, BLEND_XL);														//ロボ待機モーション
		SetMotion_(sancho, MOT_WAIT, BLEND_XL);														//サンチョ待機モーション
		Wait_(13);
		
		StartDecayEarthQuake_(20, 3, 3)																//地震
		PlaySE_("SE_DEM_014");
		local efc_robo = SetSelectBoneEffect_("ef721_03_nat_smoke_n03", robo, ATTACH_GLOBAL);		//煙
		SetEffectScale_(efc_robo, 2.0);
		local efc_sancho = SetSelectBoneEffect_("ef721_03_nat_smoke_n03", sancho, ATTACH_GLOBAL);		//煙
		SetEffectScale_(efc_sancho, 1.3);
		
		Wait_(30);
		//===============================================
		//■アロマ
		//「それでは　イベントバトル　第5戦
		//　レディー……ゴー！！
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_AROMA_NO2");
		ShowMsg_("DEMO_850_VS5_MSG_090");
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================
		
		SetMotion_(robo, MOT_SPELL_ACTUATE, BLEND_M);												//ロボ攻撃モーション
		SetMotion_(sancho, MOT_SWORD_ACTUATE, BLEND_M);												//サンチョ攻撃モーション

		
//■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■

		break;
	default:
		DebugPrint("想定していないチャレンジバトルの回戦です。");
		break;
	}


	StopBgm_(BGM_STOP_DEF);

	EncountEndDemo(ENCOUNT_NORMAL);

}

