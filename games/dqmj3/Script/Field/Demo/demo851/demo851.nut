//=============================================
//
//		demo851[チャレンジバトル_2(戦闘後)]
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
		local task_cam, task_player;
		local player, npc_Aroma2go;

	// ▼主人公
		player = GetPlayerId_();
		SetPointPos_(player, "player000");
		SetManualCalcAlpha_(player, true);

		//非常駐モーション
		local player_battle_L = ReadMotion_(player, "Player_battle_L");							// 戦闘待機L
		local player_hand = ReadMotion_(player, "Player_r_hand_hold01L");						//手を握る1
		local player_hand2 = ReadMotion_(player, "Player_r_hand_hold02L");						//手を握る2
		//初期モーション
		SetMotion_(player, player_battle_L, BLEND_N);											//戦闘待機

	//▼アロマ２号（司会者）
		npc_Aroma2go = ArrangePointNpc_(ReadNpc_("n018"), "npc_aroma000");
		SetManualCalcAlpha_(npc_Aroma2go, true);
		SetVisible(npc_Aroma2go, false);
	
	// ▼エフェクト読み込み
		LoadEffect_("ef732_15_holography02");													// ホログラム表現　出現

//■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
// ▼チャレンジバトル1回戦 VSノチョリン勝利
//■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
	
	//各回戦処理の呼び出し（１つのデモ内で複数イベントを行うので、大元で分割する）
	switch ( GetNumFlg_("NUM_CHALLENGE_BATTLE_MAIN") ) {
	case 0:
	// ■ノチョリン
		local nocho = ArrangePointNpc_(ReadNpc_("n043"), "npc_VS1_nocho000");

		// ▼非常駐モーション読込
		local nocho_hand = ReadMotion_(nocho, "n002_hand_up");					// 会話→手をあげる（エースのモーションの流用）
		local nocho_hand_L = ReadMotion_(nocho, "n002_hand_up_L");				// 手をあげるL（エースのモーションの流用）
		local nocho_down = ReadMotion_(nocho, "n000_feel_down");				// 通常会話→落ち込み
		local nocho_down_L = ReadMotion_(nocho, "n000_feel_down_L");			// 落ち込みLOOP
		local nocho_talk_joy_L = ReadMotion_(nocho, "n002_talk_joy_L");			// 会話　嬉しそう
		
		SetVisible(nocho, false);
		SetManualCalcAlpha_(nocho, true);

		// ▼カメラ設定
		SetPointCameraEye_("cameye000");										//主人公勝利姿を映す
		SetPointCameraTarget_("camtgt000");

		//-------------------------------------------------------------------------
		//		はじまりはじまり（１回戦）
		//-------------------------------------------------------------------------
		//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
		//■カット１ 主人公勝利姿を映す
		//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
		SetFadePlane_(FADE_PLANE.PLANE_3D);
		SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
		
		//===============================================
		//■アロマ
		//「勝負あり！　勝者は……
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_AROMA_NO2");
		ShowMsg_("DEMO_851_VS1_MSG_010");
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================
		task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
		StartDemo(FADE_COLOR_BLACK);
		
		//===============================================
		//■アロマ
		//「<name_player/>！
		//　みなさん　彼に　惜しみない拍手を！
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_AROMA_NO2");
		ShowMsg_("DEMO_851_VS1_MSG_020");
		PlayMe_("ME_006");														// ■ME　ファンファーレ・中
		Wait_(180);
		SetMotion_(player, MOT_WAIT, 20);										//主人公　待機
		WaitMe_();
		PlayBgm_("BG_AMBI_014");												// ■BGM　歓声
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================

		SetFade_(FADE_OUT, FADE_COLOR_BLACK, 5);
		WaitFade_();
		DeleteTask_(task_cam);
		
		//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
		//■カット２ ノチョリンの顔を映す
		//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
		SetPointCameraEye_("VS1_cameye000");
		SetPointCameraTarget_("VS1_camtgt000");

		SetVisible(nocho, true);												//ノチョリン表示
		SetFade_(FADE_IN, FADE_COLOR_BLACK, 5);
		WaitFade_();

		SetMotion_(nocho, nocho_down, BLEND_XL);								//ノチョリン落ち込み
		WaitMotion(nocho);
		SetMotion_(nocho, nocho_down_L, BLEND_XL);								//ノチョリン落ち込み

		//===============================================
		//■ノチョリン
		//「ううむ……負けちゃったっちょ。
		//　まだまだ　お前の背中は　遠いようだっちょ。
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_NOCHORIN");
		ShowMsg_("DEMO_851_VS1_MSG_030");
		KeyInputWait_();
		//===============================================
		SetMotion_(nocho, nocho_talk_joy_L, BLEND_XL);							//喜び会話

		//===============================================
		//■ノチョリン
		//「でも　お前には　オイラの目標として
		//　強くあってほしいから　これでいいっちょ。
		//-----------------------------------------------
		ShowMsg_("DEMO_851_VS1_MSG_040");
		KeyInputWait_();
		//===============================================
		
		//===============================================
		//■ノチョリン
		//「そうだ！　こいつを　お前にやるっちょ。
		//　こいつを使って　もっと強くなってくれっちょ。
		//-----------------------------------------------
		ShowMsg_("DEMO_851_VS1_MSG_050");
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================
		SetMotion_(nocho, nocho_hand, BLEND_XL);								//ノチョリン手上げ
		WaitMotion(nocho);
		SetMotion_(nocho, nocho_hand_L, BLEND_XL);
		Wait_(10);
		
		//報酬プレゼント
		//初回
		if ( GetEventFlg_("BFG_CHALLENGE_BATTLE_FIRSTREWARD") == false ) {		//フラグ：BIT1173
			//===============================================
			//<name_player/>は　ノチョリンから
			//光あふれる地のディスクを　もらった！
			//-----------------------------------------------
			PlaySE_("SE_SYS_011");
			OpenMsgWnd_();
			ShowMsg_("DEMO_851_VS1_MSG_060");
			KeyInputWait_();
			CloseMsgWnd_();
			//===============================================

		//２回目以降
		} else {
			//===============================================
			//<name_player/>は　ノチョリンから
			//天鳥のソーマを　もらった！
			//-----------------------------------------------
			PlaySE_("SE_SYS_011");
			OpenMsgWnd_();
			ShowMsg_("DEMO_851_VS1_MSG_070");
			KeyInputWait_();
			CloseMsgWnd_();
			//===============================================
		}

		SetMotion_(nocho, MOT_TALKLOOP, BLEND_XL);								//ノチョリンの会話モーション
		//===============================================
		//■ノチョリン
		//「オイラ　また修行するっちょ！
		//　また　お前と戦う　その日が来るまで！
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_NOCHORIN");
		ShowMsg_("DEMO_851_VS1_MSG_080");
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================

		SetMotion_(nocho, MOT_WAIT, BLEND_XL);									//ノチョリンの待機モーション
		Wait_(10);
		
		break;
		
//■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
// ▼チャレンジバトル2回戦 VSキング勝利
//■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
	case 1:
		// ■キング
		local king = ArrangePointNpc_(ReadNpc_("n003"), "npc_VS2_king000");
		SetPointPosNoFit_(king, "npc_VS2_king000");

		local model_throne = ReadGimmick_("o_com_05");										// 玉座
		local throne = ArrangePointGimmick_("o_com_05", model_throne, "obj_throne000");

		// ▼非常駐モーション読込
		king_down <- ReadMotion_(king, "n003_feeldown_L");									// キング落ち込み
		king_talk_motion <- ReadMotion_(king, "n003_talk");									// キング待機→会話
		king_talk_motion_L <- ReadMotion_(king, "n003_talk_L");								// キング会話L
		king_motion <- ReadMotion_(king, "n003_stick_up");									// 待機→杖掲げ
		king_motion_L <- ReadMotion_(king, "n003_stick_up_L");								// 杖掲げ
		
		SetVisible(king, false);
		SetVisible(throne, false);
		SetManualCalcAlpha_(king, true);

		// ▼カメラ設定
		SetPointCameraEye_("cameye000");
		SetPointCameraTarget_("camtgt000");

		//-------------------------------------------------------------------------
		//		はじまりはじまり（２回戦）
		//-------------------------------------------------------------------------
		//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
		//■カット１ 主人公勝利姿を映す
		//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
		SetFadePlane_(FADE_PLANE.PLANE_3D);
		SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
		
		//===============================================
		//■アロマ
		//「勝負あり！　勝者は……
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_AROMA_NO2");
		ShowMsg_("DEMO_851_VS2_MSG_010");
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================
		task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
		StartDemo(FADE_COLOR_BLACK);
		
		//===============================================
		//■アロマ
		//「<name_player/>！
		//　みなさん　彼に　惜しみない拍手を！
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_AROMA_NO2");
		ShowMsg_("DEMO_851_VS2_MSG_020");
		PlayMe_("ME_006");														// ■ME　ファンファーレ・中
		Wait_(180);
		SetMotion_(player, MOT_WAIT, 20);										//主人公　待機
		WaitMe_();
		PlayBgm_("BG_AMBI_014");												// ■BGM　歓声
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================

		SetFade_(FADE_OUT, FADE_COLOR_BLACK, 5);
		WaitFade_();
		DeleteTask_(task_cam);
		
		//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
		//■カット２ キングの顔を映す
		//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
		SetPointCameraEye_("VS2_cameye000");
		SetPointCameraTarget_("VS2_camtgt000");

		SetVisible(king, true);													//キング表示
		SetVisible(throne, true);
		SetFade_(FADE_IN, FADE_COLOR_BLACK, 5);
		WaitFade_();

		SetMotion_(king, king_down, 20);										//落ち込み

		//===============================================
		//■キング
		//「負けたか……さすがは　<name_player/>よ。
		//　余では　足下にも　およばぬようだ。
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_KING");
		ShowMsg_("DEMO_851_VS2_MSG_030");
		KeyInputWait_();
		//===============================================
		SetMotion_(king, king_talk_motion, BLEND_XL);							//キングの会話モーション
		WaitMotion(king);
		SetMotion_(king, king_talk_motion_L, BLEND_XL);
		
		//===============================================
		//■キング
		//「「だが　余はうれしいぞ。あこがれの　そちと
		//　こうして　ひと勝負　できたのだからな。
		//-----------------------------------------------
		ShowMsg_("DEMO_851_VS2_MSG_040");
		KeyInputWait_();
		//===============================================
		
		//===============================================
		//■キング
		//「そして　よくぞ　本気で戦ってくれた。
		//　その礼である……これを　受け取るがよい。
		//-----------------------------------------------
		ShowMsg_("DEMO_851_VS2_MSG_050");
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================
		SetMotion_(king, king_motion, BLEND_XL);								//キングの杖モーション
		WaitMotion(king);
		SetMotion_(king, king_motion_L, BLEND_XL);
		Wait_(10);
		
		//報酬プレゼント
		//初回
		if ( GetEventFlg_("BFG_CHALLENGE_BATTLE_SECONDREWARD") == false ) {		//フラグ：BIT1174
			//===============================================
			//<name_player/>は　キングから
			//歓楽の天導石を　もらった！
			//-----------------------------------------------
			PlaySE_("SE_SYS_011");
			OpenMsgWnd_();
			ShowMsg_("DEMO_851_VS2_MSG_060");
			KeyInputWait_();
			CloseMsgWnd_();
			//===============================================

		//２回目以降
		} else {
			//===============================================
			//<name_player/>は　キングから
			//色々な　たねを　もらった！
			//-----------------------------------------------
			PlaySE_("SE_SYS_011");
			OpenMsgWnd_();
			ShowMsg_("DEMO_851_VS2_MSG_070");
			KeyInputWait_();
			CloseMsgWnd_();
			//===============================================
		}

		SetMotion_(king, king_talk_motion, BLEND_XL);							//キングの会話モーション
		WaitMotion(king);
		SetMotion_(king, king_talk_motion_L, BLEND_XL);

		//===============================================
		//■キング
		//「今日のバトルは　まこと　楽しいものであった。
		//　いずれ　また戦おうぞ　<name_player/>よ！
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_KING");
		ShowMsg_("DEMO_851_VS2_MSG_080");
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================

		SetMotion_(king, MOT_WAIT, BLEND_XL);									//キングの待機モーション
		Wait_(10);
		
		break;
		
//■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
// ▼チャレンジバトル3回戦 VSレナーテ勝利
//■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
	case 2:
		//■レナーテ
		rena <- ArrangePointNpc_(ReadNpc_("n007"), "npc_VS3_rena000");

		// ▼非常駐モーション読込
		local rena_weaken = ReadMotion_(rena, "n007_look_down_L");				// うつむき待機
		local rena_send = ReadMotion_(rena, "n007_show_send");					// 送る
		local rena_send_L = ReadMotion_(rena, "n007_show_send_L");				// 送るL
		local rena_talk = ReadMotion_(rena, "n007_talk01");						// 話す
		local rena_talk_L = ReadMotion_(rena, "n007_talk01_L");					// 話すL
		
		SetVisible(rena, false);
		SetManualCalcAlpha_(rena, true);

		// ▼カメラ設定
		SetPointCameraEye_("cameye000");
		SetPointCameraTarget_("camtgt000");

		//-------------------------------------------------------------------------
		//		はじまりはじまり（３回戦）
		//-------------------------------------------------------------------------
		//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
		//■カット１ 主人公勝利姿を映す
		//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
		SetFadePlane_(FADE_PLANE.PLANE_3D);
		SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
		
		//===============================================
		//■アロマ
		//「勝負あり！　勝者は……
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_AROMA_NO2");
		ShowMsg_("DEMO_851_VS3_MSG_010");
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================
		task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
		StartDemo(FADE_COLOR_BLACK);
		
		//===============================================
		//■アロマ
		//「<name_player/>！
		//　みなさん　彼に　惜しみない拍手を！
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_AROMA_NO2");
		ShowMsg_("DEMO_851_VS3_MSG_020");
		PlayMe_("ME_006");														// ■ME　ファンファーレ・中
		Wait_(180);
		SetMotion_(player, MOT_WAIT, 20);										//主人公　待機
		WaitMe_();
		PlayBgm_("BG_AMBI_014");												// ■BGM　歓声
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================

		SetFade_(FADE_OUT, FADE_COLOR_BLACK, 5);
		WaitFade_();
		DeleteTask_(task_cam);

		//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
		//■カット２ レナーテの顔を映す
		//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
		SetPointCameraEye_("VS3_cameye000");
		SetPointCameraTarget_("VS3_camtgt000");
		SetMotion_(rena, rena_weaken, BLEND_N);									//レナーテ弱りモーション
		SetFace_(rena, "Face_loop_close");										// 目閉じ
		SetVisible(rena, true);													//レナーテ表示
		Wait_(10);
		SetFade_(FADE_IN, FADE_COLOR_BLACK, 5);
		WaitFade_();

		//===============================================
		//■レナーテ
		//「やっぱり　私たちは　まだまだのようね。
		//　いい勉強を　させてもらったわ……。
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_RENERTE");
		ShowMsg_("DEMO_851_VS3_MSG_030");
		KeyInputWait_();
		//===============================================
		SetFace_(rena, "Face_default");											// 目開け

		SetMotion_(rena, MOT_WAIT, BLEND_XL);									//レナ会話モーション
		//===============================================
		//■レナーテ
		//「これは　その　お礼といったところよ。
		//　受け取ってくれる……？
		//-----------------------------------------------
		ShowMsg_("DEMO_851_VS3_MSG_040");
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================
		SetMotion_(rena, rena_send, BLEND_XL);									//レナ送るモーション
		WaitMotion(rena);
		SetMotion_(rena, rena_send_L, BLEND_XL);
		Wait_(10);
		
		//報酬プレゼント
		//初回
		if ( GetEventFlg_("BFG_CHALLENGE_BATTLE_THIRDREWARD") == false ) {		//フラグ：BIT1175

			//===============================================
			//<name_player/>は　レナーテから
			//地獄の遺伝子5を　もらった！
			//-----------------------------------------------
			PlaySE_("SE_SYS_011");
			OpenMsgWnd_();
			ShowMsg_("DEMO_851_VS3_MSG_050");
			KeyInputWait_();
			CloseMsgWnd_();
			//===============================================


		//２回目以降
		} else {

			//===============================================
			//<name_player/>は　レナーテから
			//ちいさなメダルを　5個　もらった！
			//-----------------------------------------------
			PlaySE_("SE_SYS_011");
			OpenMsgWnd_();
			ShowMsg_("DEMO_851_VS3_MSG_060");
			KeyInputWait_();
			CloseMsgWnd_();
			//===============================================

		}
		SetMotion_(rena, rena_talk, BLEND_XL);									//レナ会話モーション
		WaitMotion(rena);
		SetMotion_(rena, rena_talk_L, BLEND_XL);
		//===============================================
		//■レナーテ
		//「私たちも　もっと強くなる。
		//　強くなって　また　あなたと戦いたい……。
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_RENERTE");
		ShowMsg_("DEMO_851_VS3_MSG_070");
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================

		SetMotion_(rena, MOT_WAIT, BLEND_XL);									//レナーテの待機モーション
		Wait_(10);

		break;
		
//■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
// ▼チャレンジバトル4回戦 VSアンセス勝利
//■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
	case 3:
		//■アンセス
		ansesu <- ArrangePointNpc_(ReadNpc_("n036"), "npc_VS4_ansesu000");
		
		// ▼非常駐モーション読込
		local ansesu_one_knee = ReadMotion_(ansesu, "Player_one_knee");			// 上半身を起こす→立膝
		local ansesu_up03_L = ReadMotion_(ansesu, "Player_one_knee_L");			// 片膝
		local ansesu_talk = ReadMotion_(ansesu, "Player_talk");					// 話す
		local ansesu_talk_L = ReadMotion_(ansesu, "Player_talk_L");				// 話すL
		local ansesu_adieu = ReadMotion_(ansesu, "Player_get_reactor");			// 手をのばす
		
		SetVisible(ansesu, false);
		SetManualCalcAlpha_(ansesu, true);

		// ▼カメラ設定
		SetPointCameraEye_("cameye000");
		SetPointCameraTarget_("camtgt000");

		//-------------------------------------------------------------------------
		//		はじまりはじまり（４回戦）
		//-------------------------------------------------------------------------
		//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
		//■カット１ 主人公勝利姿を映す
		//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
		SetFadePlane_(FADE_PLANE.PLANE_3D);
		SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);

		//===============================================
		//■アロマ
		//「勝負あり！　勝者は……
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_AROMA_NO2");
		ShowMsg_("DEMO_851_VS4_MSG_010");
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================
		task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");

		StartDemo(FADE_COLOR_BLACK);

		//===============================================
		//■アロマ
		//「<name_player/>！
		//　みなさん　彼に　惜しみない拍手を！
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_AROMA_NO2");
		ShowMsg_("DEMO_851_VS4_MSG_020");
		PlayMe_("ME_006");														// ■ME　ファンファーレ・中
		Wait_(180);
		SetMotion_(player, MOT_WAIT, 20);										//主人公　待機
		WaitMe_();
		PlayBgm_("BG_AMBI_014");												// ■BGM　歓声
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================

		SetFade_(FADE_OUT, FADE_COLOR_BLACK, 5);
		WaitFade_();
		DeleteTask_(task_cam);
		//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
		//■カット２ アンセスの顔を映す
		//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
//		SetPointCameraEye_("VS4_cameye000");
//		SetPointCameraTarget_("VS4_camtgt000");
		task_cam = Task_AnimeMoveCamera_("VS4_anmeye000", "VS4_anmtgt000");
		DeleteTask_(task_cam);
		
		SetVisible(ansesu, true);												//アンセス表示
		SetMotion_(ansesu, ansesu_up03_L, BLEND_N);								//アンセス座りL
		SetFace_(ansesu, "Face_smile");											//笑顔
		Wait_(5);
		SetFade_(FADE_IN, FADE_COLOR_BLACK, 5);
		WaitFade_();
		Wait_(10);
		PlaySE_("SE_DEM_068");
		local efc_ansesu = SetSelectBoneEffectSetOffset_("ef732_15_holography02", ansesu, ATTACH_EFFECT2, Vec3(0.0, -10.0, 0.0));//ホログラム出現
		SetAlpha_(ansesu, ALPHA_HALF);
		Wait_(3);
		SetAlpha_(ansesu, ALPHA_EXIST);
		//===============================================
		//■アンセス
		//「アニキである　オレを　超えたか……。
		//　くやしくもあるが……よろこぶべきことだな。
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_ANSESU");
		ShowMsg_("DEMO_851_VS4_MSG_030");
		KeyInputWait_();
		//===============================================
		Wait_(15);
		task_cam = Task_AnimeMoveCamera_("VS4_anmeye000", "VS4_anmtgt000");
		Wait_(10);
		SetMotion_(ansesu, ansesu_one_knee, BLEND_XL);								//アンセス立つ
		Wait_(10);
		SetMotion_(ansesu, MOT_WAIT, BLEND_L);										//アンセス待機モーション
		Wait_(10);
		SetMotion_(ansesu, ansesu_talk, BLEND_L);									//アンセス会話モーション
		WaitMotion(ansesu);
		SetMotion_(ansesu, ansesu_talk_L, BLEND_XL);
		
		//===============================================
		//■アンセス
		//「最強のモンスターマスターと　呼ばれるのは
		//　これからは　お前こそが　ふさわしい。
		//-----------------------------------------------
		ShowMsg_("DEMO_851_VS4_MSG_040");
		KeyInputWait_();
		//===============================================
		SetMotion_(ansesu, MOT_WAIT, BLEND_XL);
		
		PlaySE_("SE_DEM_068");
		local efc_ansesu = SetBoneEffect_("ef732_15_holography02", ansesu);			//ホログラム出現
		SetAlpha_(ansesu, ALPHA_HALF);
		Wait_(3);
		SetAlpha_(ansesu, ALPHA_EXIST);
		
		//===============================================
		//■アンセス
		//「こいつは　テレジアが用意した　ごほうびだ。
		//　とっておけ　<name_player/>。
		//-----------------------------------------------
		ShowMsg_("DEMO_851_VS4_MSG_050");
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================
		SetMotionSpeed_(ansesu, 0.7);
		SetMotion_(ansesu, ansesu_adieu, BLEND_XL);									//アンセス手を伸ばす
		WaitMotion(ansesu);
		SetMotion_(ansesu, MOT_WAIT, BLEND_XL);
		SetMotionSpeed_(ansesu, 1.0);

		Wait_(10);

		//報酬プレゼント
			//===============================================
			//<name_player/>は　アンセスから
			//しもふりにくを　5個　もらった！
			//-----------------------------------------------
			PlaySE_("SE_SYS_011");
			OpenMsgWnd_();
			ShowMsg_("DEMO_851_VS4_MSG_060");
			KeyInputWait_();
			CloseMsgWnd_();
			//===============================================
		
		SetMotion_(ansesu, MOT_TALKLOOP, BLEND_XL);									//アンセスの会話モーション
		//===============================================
		//■アンセス
		//「今日は　なかなか　楽しいバトルだった。
		//　また　いつか勝負しようぜ！　約束だ！
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_ANSESU");
		ShowMsg_("DEMO_851_VS4_MSG_070");
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================
		SetMotion_(ansesu, MOT_WAIT, BLEND_XL);										//アンセスの待機モーション
		Wait_(20);
		PlaySE_("SE_DEM_068");
		local efc_ansesu = SetBoneEffect_("ef732_15_holography02", ansesu);			//ホログラム出現
		SetAlpha_(ansesu, ALPHA_HALF);
		Wait_(3);
		SetAlpha_(ansesu, ALPHA_EXIST);
		Wait_(10);
		PlaySE_("SE_DEM_068");
		local efc_ansesu = SetBoneEffect_("ef732_15_holography02", ansesu);			//ホログラム出現
		SetAlpha_(ansesu, ALPHA_HALF);
		Wait_(3);
		SetAlpha_(ansesu, ALPHA_CLEAR);
		Wait_(20);
		WaitTask(task_cam);
		
		break;
		
//■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
// ▼チャレンジバトル5回戦 VSアロマ勝利
//■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
	case 4:
		//■アロマ2号
		aroma_VS <- ArrangePointNpc_(ReadNpc_("n018"), "npc_VS5_aroma000");
		
		// ▼非常駐モーション読込
		local aroma_stretch = ReadMotion_(aroma_VS, "n018_stretch");				//伸び
		local aroma_send = ReadMotion_(aroma_VS, "n018_star_seed_send");			//送る
		local aroma_send_L = ReadMotion_(aroma_VS, "n018_star_seed_send_L");
		local aroma_guard_L = ReadMotion_(aroma_VS, "n018_guard_L");				//構え
		
		SetVisible(aroma_VS, false);
		SetManualCalcAlpha_(aroma_VS, true);

		// ▼カメラ設定
		SetPointCameraEye_("cameye000");
		SetPointCameraTarget_("camtgt000");

		//-------------------------------------------------------------------------
		//		はじまりはじまり（５回戦）
		//-------------------------------------------------------------------------
		//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
		//■カット１ 主人公勝利姿を映す
		//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
		SetFadePlane_(FADE_PLANE.PLANE_3D);
		SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);

		//===============================================
		//■アロマ
		//「勝負あり！　勝者は……
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_AROMA_NO2");
		ShowMsg_("DEMO_851_VS5_MSG_010");
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================
		task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
		StartDemo(FADE_COLOR_BLACK);
		
		//===============================================
		//■アロマ
		//「<name_player/>！
		//　みなさん　彼に　惜しみない拍手を！
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_AROMA_NO2");
		ShowMsg_("DEMO_851_VS5_MSG_020");
		PlayMe_("ME_006");														// ■ME　ファンファーレ・中
		Wait_(180);
		SetMotion_(player, MOT_WAIT, 20);										//主人公　待機
		WaitMe_();
		PlayBgm_("BG_AMBI_014");												// ■BGM　歓声
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================

		SetFade_(FADE_OUT, FADE_COLOR_BLACK, 5);
		WaitFade_();
		DeleteTask_(task_cam);
		
		//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
		//■カット２ アロマ2号の顔を映す
		//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
		SetPointCameraEye_("VS5_cameye005");
		SetPointCameraTarget_("VS5_camtgt005");

		SetVisible(aroma_VS, true);												//アロマ2号表示

		SetFade_(FADE_IN, FADE_COLOR_BLACK, 5);
		WaitFade_();
		Wait_(10);
		SetMotion_(aroma_VS, aroma_guard_L, BLEND_L);							//アロマ2号の構え
		PlaySE_("SE_DEM_068");
		local efc_aroma = SetBoneEffect_("ef732_15_holography02", aroma_VS);	//ホログラム出現
		SetAlpha_(aroma_VS, ALPHA_HALF);
		Wait_(3);
		SetAlpha_(aroma_VS, ALPHA_EXIST);
		Wait_(10);
		//===============================================
		//■アロマ2号
		//「まさか　あたしのほうが
		//　コテンパンに　されるなんて……。
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_AROMA_NO2");
		ShowMsg_("DEMO_851_VS5_MSG_030");
		KeyInputWait_();
		//===============================================
		SetFace_(aroma_VS, "Face_smile");											//笑顔

		SetMotion_(aroma_VS, MOT_TALK, BLEND_XL);								//アロマ2号の話すモーション
		WaitMotion(aroma_VS);
		SetMotion_(aroma_VS, MOT_TALKLOOP, BLEND_N);

		//===============================================
		//■アロマ2号
		//「負け惜しみを言わず　素直に　ほめておくわ。
		//　あんたの強さは　あたしの計算以上だった。
		//-----------------------------------------------
		ShowMsg_("DEMO_851_VS5_MSG_040");
		KeyInputWait_();
		//===============================================
		PlaySE_("SE_DEM_068");
		local efc_aroma = SetBoneEffect_("ef732_15_holography02", aroma_VS);	//ホログラム出現
		SetAlpha_(aroma_VS, ALPHA_HALF);
		Wait_(3);
		SetAlpha_(aroma_VS, ALPHA_EXIST);
		//===============================================
		//■アロマ2号
		//「それじゃ　こいつを　あんたにあげる。
		//　あたしに勝った　ごほうびだと思いなさい！
		//-----------------------------------------------
		ShowMsg_("DEMO_851_VS5_MSG_060");
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================

		SetMotion_(aroma_VS, aroma_send, BLEND_XL);								//アロマ2号の送るモーション
		WaitMotion(aroma_VS);
		SetMotion_(aroma_VS, aroma_send_L, BLEND_N);
		Wait_(10);

		//報酬プレゼント
		PlayMe_("ME_010");														// 仲間ME(重要アイテム取得と同じRedmine#2831)
			//===============================================
			//<name_player/>は　アロマ２号から
			//サンチョを　もらった！
			//-----------------------------------------------
			OpenMsgWnd_();
			ShowMsg_("DEMO_851_VS5_MSG_070");
			WaitMe_();
			KeyInputWait_();
			CloseMsgWnd_();
			//===============================================

		SetMotion_(aroma_VS, MOT_TALK, BLEND_XL);								//アロマ2号の話すモーション
		WaitMotion(aroma_VS);
		SetMotion_(aroma_VS, MOT_TALKLOOP, BLEND_N);

		//===============================================
		//■アロマ2号
		//「久しぶりに　ちょっと　はしゃいじゃったわ。
		//　また　やりたいわね　こういうバトルを。
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_AROMA_NO2");
		ShowMsg_("DEMO_851_VS5_MSG_080");
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================
		SetMotion_(aroma_VS, MOT_WAIT, BLEND_XL);								//待機モーション
		PlaySE_("SE_DEM_068");
		local efc_aroma = SetBoneEffect_("ef732_15_holography02", aroma_VS);	//ホログラム出現
		SetAlpha_(aroma_VS, ALPHA_HALF);
		Wait_(3);
		SetAlpha_(aroma_VS, ALPHA_EXIST);
		Wait_(10);
		PlaySE_("SE_DEM_068");
		local efc_aroma = SetBoneEffect_("ef732_15_holography02", aroma_VS);			//ホログラム出現
		SetAlpha_(aroma_VS, ALPHA_HALF);
		Wait_(3);
		SetAlpha_(aroma_VS, ALPHA_CLEAR);
		Wait_(20);
		
		break;
//■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■

	default:
		DebugPrint("想定していないチャレンジバトルの回戦です。");
		break;
	}

	StopBgm_(BGM_STOP_DEF);

	DeleteAllTask_();

	EndDemo(FADE_COLOR_BLACK, FADE_DEF);

}



