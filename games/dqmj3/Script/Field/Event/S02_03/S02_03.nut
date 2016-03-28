//===================== S02_03イッタブル監獄 4F ====================

// 変数定義
main_num	 <- C_NONE_ID;
prison_num	 <- C_NONE_ID;

str_num_sub <- "NUM_SCENARIO_SUB_PRISON";

//------------------------------------------------
//		戦闘終了後
//------------------------------------------------
function AfterBattle()
{
	/*
		処理なし
	*/
	
	EventEnd_();
}


//------------------------------------------------
//		マップに入る前
//------------------------------------------------
function BeforeInitMap()
{
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");						// Num0
	prison_num	 = GetNumFlg_("NUM_SCENARIO_SUB_PRISON");				// Num6
	local bit_demo = GetEventFlg_("BFG_PLAYED_BATTLE_RIDE_DEMO");		// Bit_1223 疑似デモ[戦闘ライドチュートリアル終了]を見た
	
	//ライド強制解除
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {					// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_BLAST_STRATEGY")) {	// Num6 = 20
			// ■疑似デモ[戦闘ライドチュートリアル終了]
			if (!bit_demo){
				SetRideOffStart_();
			}
		}
	}
	
	EventEnd_();
}


//------------------------------------------------
//		フェードアウト中
//------------------------------------------------
function FadeIn()
{
	// フラグを取得
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");									// Num0
	prison_num	 = GetNumFlg_("NUM_SCENARIO_SUB_PRISON");							// Num6
	local bit_get_jail_key = GetEventFlg_("BFG_GET_KEY_OF_JAIL");					// Bit_1204 ろうやのカギを入手
	
	DebugPrint("NUM_SCENARIO_MAIN の値は " + main_num + " になりました。");
	DebugPrint("NUM_SCENARIO_SUB_PRISON の値は " + prison_num + " になりました。");
	
	// ■マップチェンジNULL設定
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_RESISTANCE_RUKIYA")) {				// Num6 < 15
			SetHitEnableMapChangeNull_("w_S00_00ALdr_001", false);	// マップ左の扉
		}
	}

	// ■イッタブル撃破までルキヤのいる部屋にモンスターを配置しない
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_INVULNERABILITY_PLAYER")) {		// Num6 < 28
			SetEventFlg_("BFG_LIMIT_4F_UPPER_RIGHT_ROOM", false);					// Bit_1227 右上の部屋にモンスターを配置
		} else {
			SetEventFlg_("BFG_LIMIT_4F_UPPER_RIGHT_ROOM", true);					// Bit_1227 右上の部屋にモンスターを配置
		}
	} else {
		SetEventFlg_("BFG_LIMIT_4F_UPPER_RIGHT_ROOM", true);						// Bit_1227 右上の部屋にモンスターを配置
	}
	
	//---------------
	// ▼ギミック配置
	//---------------
	// ID初期化
	g_gmk_door01		 <- C_NONE_ID;
	g_gmk_door02		 <- C_NONE_ID;
	g_gmk_door03		 <- C_NONE_ID;
	g_gmk_door04		 <- C_NONE_ID;
	g_gmk_door05		 <- C_NONE_ID;
	
	// ■共通扉
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_RESISTANCE_RUKIYA")) {				// Num6 < 15
			local id_door	= ReadGimmick_("o_S02_11");				// 共通扉
			g_gmk_door01	= ArrangePointGimmick_("o_S02_11", id_door, "gmk_door01");
			g_gmk_door02	= ArrangePointGimmick_("o_S02_11", id_door, "gmk_door02");
			g_gmk_door03	= ArrangePointGimmick_("o_S02_11", id_door, "gmk_door03");
			g_gmk_door04	= ArrangePointGimmick_("o_S02_11", id_door, "gmk_door04");
			g_gmk_door05	= ArrangePointGimmick_("o_S02_11", id_door, "gmk_door05");
		}
	}

	
	//----------
	// ▼NPC配置
	//----------
	// ID初期化
	g_npc_rukiya		 <- C_NONE_ID;
	
	// ■ルキヤ
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_BLAST_EXPLANATION_2ND")) {			// Num6 < 17
			// 配置しない
		}
		else if (prison_num < GetFlagID_("CONST_SS_PR_JAIL_OPEN")){					// Num6 < 19
			local id_rukiya	 = ReadNpc_("n009");		// ルキヤ
			g_npc_rukiya	 = ArrangePointNpc_(id_rukiya, "npc_rukiya001");
			SetTalkCameraType_(g_npc_rukiya, TALK_CAMERA_UP);//カメラの設定
			SetReactorMsg_(g_npc_rukiya, "REC_NPC_RUKIYA");
			// 会話カメラ時に透過されるのでアルファ値を設定する
			SetManualCalcAlpha_(g_npc_rukiya, true);
			SetAlpha_(g_npc_rukiya, 1.0);
		}
		else if (prison_num == GetFlagID_("CONST_SS_PR_JAIL_OPEN")){				// Num6 = 19
			local id_rukiya	 = ReadNpc_("n009");		// ルキヤ
			g_npc_rukiya	 = ArrangePointNpc_(id_rukiya, "npc_rukiya000");
			SetTalkCameraType_(g_npc_rukiya, TALK_CAMERA_DEF);//カメラの設定
			SetTalkTurn_(g_npc_rukiya, false);// 話しかけても振り向かない
			SetReactorMsg_(g_npc_rukiya, "REC_NPC_RUKIYA");
		}
		else if (prison_num < GetFlagID_("CONST_SS_PR_ITTABURU_INTERFERENCE")) {	// Num6 < 21
			local id_rukiya	 = ReadNpc_("n009");		// ルキヤ
			g_npc_rukiya	 = ArrangePointNpc_(id_rukiya, "npc_rukiya000");
			SetTalkCameraType_(g_npc_rukiya, TALK_CAMERA_UP);//カメラの設定
			SetReactorMsg_(g_npc_rukiya, "REC_NPC_RUKIYA");
			// 会話カメラ時に透過されるのでアルファ値を設定する
			SetManualCalcAlpha_(g_npc_rukiya, true);
			SetAlpha_(g_npc_rukiya, 1.0);
		}
	}
	
	//-----------------
	// ▼エフェクト配置
	//-----------------
	// ID初期化
	g_efc_item_sign	 <- C_NONE_ID;
	
	// ■アイテムサイン(ろうやのカギ)
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {									// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_BLAST_EXPLANATION_3RD")) {			// Num6 = 18
			if (!bit_get_jail_key) {
				LoadEffect_("EF300_40_ITEM_SIGN");
				g_efc_item_sign = SetPointWorldEffect_("EF300_40_ITEM_SIGN", "mine_jail_key");
			}
		}
	}
	
	//-----------
	// ▼地雷配置
	//-----------
	// ID初期化
	g_mine_demo413		 <- C_NONE_ID;
	g_mine_jail_key		 <- C_NONE_ID;
	g_mine_door01		 <- C_NONE_ID;
	g_mine_door02		 <- C_NONE_ID;
	g_mine_door03		 <- C_NONE_ID;
	g_mine_door04		 <- C_NONE_ID;
	g_mine_door05		 <- C_NONE_ID;
	g_mine_door06		 <- C_NONE_ID;
	g_mine_jailer02		 <- C_NONE_ID;
	g_mine_jailer04		 <- C_NONE_ID;
	g_mine_jailer05		 <- C_NONE_ID;
	g_mine_jailer06		 <- C_NONE_ID;
	g_rec_point_02		 <- C_NONE_ID;
	g_exclamation07		 <- C_NONE_ID;
	
	// ■Demo413起動地雷
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {									// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_RESISTANCE_RUKIYA")) {				// Num6 = 15
			g_mine_demo413 = SetPointBoxEventMine_("mine_demo413", false);
		}
	}
	
	// ■ろうやのカギ
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {									// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_BLAST_EXPLANATION_3RD")) {			// Num6 = 18
			if (!bit_get_jail_key) {
				g_mine_jail_key = SetPointCircleEventMine_("mine_jail_key", false);
			}
		}
	}
	
	// ■共通扉地雷
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {									// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_RESISTANCE_RUKIYA")) {					// Num6 < 15
			g_mine_door01 = SetPointCircleEventMine_("mine_door01", true);
			g_mine_door02 = SetPointCircleEventMine_("mine_door02", true);
			g_mine_door03 = SetPointCircleEventMine_("mine_door03", true);
			g_mine_door04 = SetPointCircleEventMine_("mine_door04", true);
			g_mine_door05 = SetPointCircleEventMine_("mine_door05", true);
			g_mine_door06 = SetPointCircleEventMine_("mine_door06", true);				// 外へ出る扉
		}
	}
	
	// ■リアクター警告メッセージ地雷
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {									// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_MEETING_02")) {						// Num6 = 13
			g_mine_jailer02 = SetPointBoxEventMine_("mine_jailer02", false);
			g_mine_jailer04 = SetPointBoxEventMine_("mine_jailer04", false);
			g_mine_jailer05 = SetPointBoxEventMine_("mine_jailer05", false);
		}
		if (prison_num == GetFlagID_("CONST_SS_PR_RESISTANCE_RUKIYA")) {				// Num6 = 15
			g_mine_jailer06 = SetPointBoxEventMine_("mine_jailer06", false);
		}
	}
	
	//-------------------------
	// ▼リアクターポイント配置
	//-------------------------
	// ■ろうやのカギ
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {									// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_BLAST_EXPLANATION_3RD")) {			// Num6 = 18
			if (!bit_get_jail_key) {
				g_rec_point_02 = ArrangeMsgReactorPoint("rec_point_02", GetFlagID_("BFG_REACTER_POINT_179")// Bit_1678 ろうやのカギ
					, SHORT_DIST, "REC_POINT_01", "REC_POINT_02");
			}
		}
	}
	
	//---------------------
	// ▼ナビマップアイコン
	//---------------------
	// ■４階 扉アイコン・エリアチェンジの表示切替
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {									// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_RESISTANCE_RUKIYA")) {					// Num6 < 15
			//
		} else {
			SetEventFlg_("BFG_OPEN_PRISON_4F", true);		// Bit_1211 監獄４階 扉開通フラグ
		}
	} else {
		SetEventFlg_("BFG_OPEN_PRISON_4F", true);			// Bit_1211 監獄４階 扉開通フラグ
	}
	
	
	// ■２・３階 扉アイコンの表示切替
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {									// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_BLAST_STRATEGY")) {					// Num6 < 20
			//
		} else {
			SetEventFlg_("BFG_OPEN_PRISON_2F_TO_3F", true);	// Bit_1220 監獄２・３階 扉開通フラグ
		}
	} else {
		SetEventFlg_("BFG_OPEN_PRISON_2F_TO_3F", true);		// Bit_1220 監獄２・３階 扉開通フラグ
	}
	
	
	// ■「！」
	// ルキヤとの待ち合わせ場所
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {									// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_RESISTANCE_RUKIYA")) {				// Num6 = 15
			g_exclamation07 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "npc_rukiya000");
		}
		else{
			// 「！」アイコンを消す
			SetNaviMapIconVisible_(g_exclamation07, false);
		}
	}
	// ろうやのカギ
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {									// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_BLAST_EXPLANATION_3RD")) {			// Num6 = 18
			if (!bit_get_jail_key) {
				g_exclamation06 <- ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "mine_jail_key");
			}
		}
	}
	
	
	
	

	EventEnd_();
}


//------------------------------------------------
//		フィールド操作開始
//------------------------------------------------
function EventStartOperate()
{
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");			// Num0
	prison_num	 = GetNumFlg_("NUM_SCENARIO_SUB_PRISON");	// Num6
	local player = GetPlayerId_();
	
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {									// Num0 = 5
		// ■５階の広間を目指している時のリアクターメッセージ
		if (prison_num == GetFlagID_("CONST_SS_PR_MEETING_02")) {						// Num6 = 13
			local bit_rec_msg = GetEventFlg_("BFG_DISPLAYED_LEADING_5F_MSG_4F");		// Bit_1235 リアクターの誘導MSGを再生した
			if (!bit_rec_msg){
				SetEventFlg_("BFG_DISPLAYED_LEADING_5F_MSG_4F", true);					// Bit_1235 リアクターの誘導MSGを再生した
				
				// 階段を登りきるまで待つ
				Wait_(25);
				SetMotion_(player, MOT_WAIT, BLEND_XL);
				Wait_(BLEND_XL);
				
				// リアクター反応付きメッセージ
				CommReactorActionNotice();	// リアクター反応があった時の共通処理
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_REACTOR");
				ShowMsg_("REACTER_MSG_000");		// 「５階にて　友好的な　リアクター反応あり。
				KeyInputWait_();
				CloseMsgWnd_();
				CommResetPlayerMotion();	// モーションを待機状態に戻す共通処理
				//WaitFade_();
			}
		}
		// ■Demo414[爆破作戦の説明②]（マザーを映す）再生
		if (prison_num == GetFlagID_("CONST_SS_PR_BLAST_EXPLANATION_1ST")) {			// Num6 = 16
			SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_PR_BLAST_EXPLANATION_2ND"));	// Num6 <- 17
			EventStartChangeDemo(414, FADE_COLOR_BLACK); // 414[爆破作戦の説明②]（マザーを映す）
		}
		// ■Demo415[爆破作戦の説明③]（ルキヤの部屋）再生
		else if (prison_num == GetFlagID_("CONST_SS_PR_BLAST_EXPLANATION_2ND")) {		// Num6 = 17
			SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_PR_BLAST_EXPLANATION_3RD"));	// Num6 <- 18
			// デモ再生後の復帰位置
			SetReturnDemoPosDir_(Vec3(476.6, 0, -321.2), -88);
			EventStartChangeDemo(415, FADE_COLOR_BLACK);// 415[爆破作戦の説明③]（ルキヤの部屋）
		}
		
		// ■イベント戦[戦闘ライドチュートリアル戦]
		else if (prison_num == GetFlagID_("CONST_SS_PR_BLAST_STRATEGY")) {				// Num6 = 20
			local bit_tutorial_ride_saw = GetEventFlg_("BFG_WATCHED_BATTLE_RIDE_DEMO");	// Bit_1224 戦闘ライドチュートリアルを見た
			if (!bit_tutorial_ride_saw){
				local bit_tutorial_ride = GetEventFlg_("BFG_TUTORIAL_RIDE");			// Bit_50 戦闘ライドチュートリアル中
				if (!bit_tutorial_ride){
					SetEventFlg_("BFG_RIDE_LICENSE_BATTLE", true);						// Bit_60 戦闘ライドライセンス
					
					SetEventFlg_("BFG_TUTORIAL_RIDE", true);							// Bit_50 戦闘ライドチュートリアル中
					
					SetEventFlg_("BFG_WATCHED_BATTLE_RIDE_DEMO", true);					// Bit_1224 戦闘ライドチュートリアルを見た
					
					SetEventFlg_("BFG_TRAVEL_INFO_SHOW_032", true);						// Bit_532 旅の心得	【戦闘】戦闘ライド
					// ライドチュートリアル戦
					ChangeBattleParty_(2);
				}
			}
			else{
				// ■疑似デモ[戦闘ライドチュートリアル終了]
				local bit_demo = GetEventFlg_("BFG_PLAYED_BATTLE_RIDE_DEMO");			// Bit_1223 疑似デモ[戦闘ライドチュートリアル終了]を見た
				if (!bit_demo){
					// 疑似デモのBGMを頭打ちにするフラグ
					SetEventFlg_("BFG_RETURN_BATTLE_FIRLD_BGM_HEAD", true);
					// 画面を1フレで暗転
					CommChangeMomentFadeOut(FADE_COLOR_BLACK)
					// カメラを設置
					SetPointCameraEye_("cameye_001");
					SetPointCameraTarget_("camtgt_001");
					Wait_(15);
					
					// 暗転中の仕込み
					SetEventFlg_("BFG_PLAYED_BATTLE_RIDE_DEMO", true);					// Bit_1223 疑似デモ[戦闘ライドチュートリアル終了]を見た
					local player = GetPlayerId_();
					local nod_p = ReadMotion_(player, "Player_nod");					// 待機→頭を下げる→待機
					SetVisible(player, true);
					
					// 上画面のフェードイン
					SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
					WaitFade_();
					
					// ルキヤ会話モーション
					SetMotion_(g_npc_rukiya, MOT_TALKLOOP, BLEND_XL);
					// メッセージ
					OpenMsgWnd_();
					SetTalkName_("NAME_TAG_RUKIYA");
					ShowMsg_("NPC_RUKIYA_MSG_120");		// 「チュートリアルが　終わったかい。
					KeyInputWait_();
					CloseMsgWnd_();
					// ルキヤ待機モーション
					SetMotion_(g_npc_rukiya, MOT_WAIT, BLEND_XL);
					Wait_(10);
					
					// 主人公うなずきモーション→待機モーション
					SetMotion_(player, nod_p, BLEND_L);	// うなづく主人公
					WaitMotion(player);					// うなづき待ち
					SetMotion_(player, MOT_WAIT, BLEND_L);
					Wait_(10);
					
					// ルキヤ会話モーション
					SetMotion_(g_npc_rukiya, MOT_TALKLOOP, BLEND_XL);
					// メッセージ
					OpenMsgWnd_();
					SetTalkName_("NAME_TAG_RUKIYA");
					ShowMsg_("NPC_RUKIYA_MSG_121");		// 「うんうん　それでいい。
					KeyInputWait_();
					CloseMsgWnd_();
					Wait_(5);
					
					// カメラを設置
					SetPointCameraEye_("cameye_002");
					SetPointCameraTarget_("camtgt_002");
					
					Wait_(5);
					// メッセージ
					OpenMsgWnd_();
					SetTalkName_("NAME_TAG_RUKIYA");
					ShowMsg_("NPC_RUKIYA_MSG_122");		// 「ブレイク化改造装置を　爆破するために
					KeyInputWait_();
					CloseMsgWnd_();
					// ルキヤ待機モーション
					SetMotion_(g_npc_rukiya, MOT_WAIT, BLEND_XL);
					//プレイアブルに復帰させる
					uPlayableReset(451.87, 0.0, -319.5, 75);
				}
			}
		}
	}
	
	// ■イベント戦[戦闘ライドチュートリアル戦]勝利後
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {						// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_BLAST_STRATEGY")) {		// Num6 = 20
			local bit_tutorial_ride = GetEventFlg_("BFG_TUTORIAL_RIDE");	// Bit_50 戦闘ライドチュートリアル中
			if (bit_tutorial_ride){
				if (GetBattleEndType_() == BATTLE_END_TYPE_WIN){
					SetEventFlg_("BFG_TUTORIAL_RIDE", false);				// Bit_50 戦闘ライドチュートリアル中
				}
			}
		}
	}
	
	EventEnd_();
}


//------------------------------------------------
//		ＮＰＣ会話直前
//------------------------------------------------
function BeforeTalkNpc()
{
	local target = GetTargetId_();
	
	//------------------------------------
	// ライド中の会話カメラオフセット設定
	//------------------------------------
	// ■ルキヤ
	if(target == g_npc_rukiya){
		SetRideTalkCamOffset(OFFSET_RUKIYA);
	}
	
	EventEnd_();
}


//------------------------------------------------
//		ＮＰＣ接触時
//------------------------------------------------
function TouchNpc()
{
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");			// Num0
	prison_num	 = GetNumFlg_("NUM_SCENARIO_SUB_PRISON");	// Num6
	
	local target = GetTargetId_();
	
	DebugPrint(" ");
	DebugPrint("ID: " + target + " に接触 [TouchNpc]");
	
	switch (target) {
	case g_npc_rukiya :
		uTalkRukiya();
		break;
	default :
		DebugPrint("WARNING : NPC_IDが不正です [TouchNpc]");
		break;
	}
	
	
	EventEnd_();
}

//------------------------------------------------
//		地雷接触時
//------------------------------------------------
function TouchEventMine()
{
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");			// Num0
	prison_num	 = GetNumFlg_("NUM_SCENARIO_SUB_PRISON");	// Num6
	
	local target = GetTouchEventMineId_();
	
	DebugPrint(" ");
	DebugPrint("ID: " + target + " に接触 [TouchEventMine]");
	
	switch (target) {
	case g_mine_demo413 :
		uMineDemo413Start();
		break;
	case g_mine_jail_key :
		uMineJailKey();
		break;
	case g_mine_door01 :
		uMineDoor01();
		break;
	case g_mine_door02 :
		uMineDoor02();
		break;
	case g_mine_door03 :
		uMineDoor03();
		break;
	case g_mine_door04 :
		uMineDoor04();
		break;
	case g_mine_door05 :
		uMineDoor05();
		break;
	case g_mine_door06 :
		uMineDoor06();
		break;
	case g_mine_jailer02 :
		uMineJailer02();
		break;
	case g_mine_jailer04 :
		uMineJailer04();
		break;
	case g_mine_jailer05 :
		uMineJailer05();
		break;
	case g_mine_jailer06 :
		uMineJailer06();
		break;
	default :
		DebugPrint("WARNING : MINE_IDが不正です [TouchEventMine]");
		break;
	}
	
	EventEnd_();
}


//------------------------------------------------
//		リアクター起動時
//------------------------------------------------
function ReactorOn()
{
	/*
		処理なし
	*/
	
	EventEnd_();
}


//------------------------------------------------
//		リアクターで調べた時
//------------------------------------------------
function ReactorAnalyze()
{
	/*
		処理なし
	*/
	
	EventEnd_();
}


//------------------------------------------------
//		リアクター終了時
//------------------------------------------------
function ReactorOff()
{
	/*
		処理なし
	*/
	
	EventEnd_();
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		ルキヤ 会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkRukiya()
{
	local bit_talk_rukiya = GetEventFlg_("BFG_TALK_RUKIYA_FIRST");				// Bit_1205 ルキヤに話しかけた
	
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {							// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_JAIL_OPEN")) {					// Num6 < 19
			local bit_get_jail_key = GetEventFlg_("BFG_GET_KEY_OF_JAIL");		// Bit_1204 ろうやのカギを入手
			// ろうやのカギを持っていない場合
			if (!bit_get_jail_key) {
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_RUKIYA");
				ShowMsg_("NPC_RUKIYA_MSG_110");			// 「コラッ！　なーにチンタラやってんだい！
				KeyInputWait_();
				CloseMsgWnd_();
			}
			// ろうやのカギを持っている場合
			else {
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_RUKIYA");
				ShowMsg_("NPC_RUKIYA_MSG_110_2");		// 「ああっ！　もう　あんたって子は！
				KeyInputWait_();
				CloseMsgWnd_();
			}
		}
		else if (prison_num == GetFlagID_("CONST_SS_PR_JAIL_OPEN")) {			// Num6 = 19
			SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_PR_BLAST_STRATEGY"));	// Num6 <- 20
			// ルーラ禁止解除
			SetEventFlg_("BFG_PLAYERABILITY_RULER_PROHIBIT", false);			// Bit_440 ルーラ禁止
			// デモ再生後の主人公の復帰位置
			SetReturnDemoPosDir_(Vec3(471.251, 0.0, -318.693), 90);
			// Demo416[改造装置爆破作戦]再生
			TouchNpcChangeDemo(416);
		}
		else if (prison_num == GetFlagID_("CONST_SS_PR_BLAST_STRATEGY")) {		// Num6 = 20
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_RUKIYA");
			ShowMsg_("NPC_RUKIYA_MSG_125");				// 「ブレイク化改造装置を　爆破するために
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		Demo413起動地雷に触れた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineDemo413Start()
{
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {									// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_RESISTANCE_RUKIYA")) {				// Num6 = 15
			SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_PR_BLAST_EXPLANATION_1ST"));	// Num6 <- 16
			// デモ再生後の復帰位置
			SetReturnDemoPosDir_(Vec3(459.6, 0, -313), 83);
			// Demo413[爆破作戦の説明①]（ルキヤの部屋）再生
			TouchNpcChangeDemo(413);
		}
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		ろうやのカギの地雷に触れた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineJailKey()
{
	local player = GetPlayerId_();

	local pos  = Vec3(-222.0, 0.0, 402.7);
	uPlayerTurnAroundPos(pos);
	
	SetEventFlg_("BFG_GET_KEY_OF_JAIL", true);		// Bit_1204 ろうやのカギを入手
	DeleteEventMine_(g_mine_jail_key);				// 地雷を削除
	DeleteEffect_(g_efc_item_sign);					// エフェクトを削除
	SetVisible(g_rec_point_02, false);				// リアクターポイントを非表示
	
	SetNaviMapIconVisible_(g_exclamation06, false);	// 「！」アイコンを消す
	
	AddItemAndMsg(955, 1, true);					// ろうやのカギ
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		共通扉地雷①に触れた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineDoor01()
{
	uTouchDoorMsg(g_gmk_door01);
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		共通扉地雷②に触れた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineDoor02()
{
	uTouchDoorMsg(g_gmk_door02);
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		共通扉地雷③に触れた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineDoor03()
{
	uTouchDoorMsg(g_gmk_door03);
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		共通扉地雷④に触れた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineDoor04()
{
	uTouchDoorMsg(g_gmk_door04);
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		共通扉地雷⑤に触れた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineDoor05()
{
	uTouchDoorMsg(g_gmk_door05);
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		外へ出る扉の地雷に触れた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineDoor06()
{
	local pos  = Vec3(-523.3, 5.0, 0.0);
	uPlayerTurnAroundPos(pos);
	OpenMsgWnd_();
	ShowMsg_("SYSTEM_MSG_999");		// 扉は　かたく　閉ざされている。
	KeyInputWait_();
	CloseMsgWnd_();
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//	ローカル関数 共通扉のロック中のメッセージ
//------------------------------------------------
//	引数	: ギミックＩＤ
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTouchDoorMsg(gmk_id)
{
	CommPlayerTurnAroundObj(gmk_id);
	OpenMsgWnd_();
	ShowMsg_("SYSTEM_MSG_999");		// 扉は　かたく　閉ざされている。
	KeyInputWait_();
	CloseMsgWnd_();
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		リアクター警告メッセージ地雷②に触れた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineJailer02()
{
	//リアクターメッセージ
	CommReactorActionNotice();			// リアクター反応があった時の共通処理
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_REACTOR");	// リアクター
	ShowMsg_("REACTER_MSG_001");		// 「危険度の高い　モンスターの反応が　あります。
	KeyInputWait_();
	CloseMsgWnd_();
	CommResetPlayerMotion();			// モーションを待機状態に戻す共通処理
	Wait_(5);
	
	// バックして移動
	CommPlayerTurnMoveDirWalk(180);
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		リアクター警告メッセージ地雷④に触れた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineJailer04()
{
	//リアクターメッセージ
	CommReactorActionNotice();			// リアクター反応があった時の共通処理
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_REACTOR");	// リアクター
	ShowMsg_("REACTER_MSG_001");		// 「危険度の高い　モンスターの反応が　あります。
	KeyInputWait_();
	CloseMsgWnd_();
	CommResetPlayerMotion();			// モーションを待機状態に戻す共通処理
	Wait_(5);
	
	// バックして移動
	CommPlayerTurnMoveDirWalk(180);
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		リアクター警告メッセージ地雷⑤に触れた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineJailer05()
{
	//リアクターメッセージ
	CommReactorActionNotice();			// リアクター反応があった時の共通処理
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_REACTOR");	// リアクター
	ShowMsg_("REACTER_MSG_001");		// 「危険度の高い　モンスターの反応が　あります。
	KeyInputWait_();
	CloseMsgWnd_();
	CommResetPlayerMotion();			// モーションを待機状態に戻す共通処理
	Wait_(5);
	
	// バックして移動
	CommPlayerTurnMoveDirWalk(0);
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		リアクター警告メッセージ地雷⑥に触れた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineJailer06()
{
	// コネクティブモード開始
//	OpenConnective("connective_rukiya");
//	Wait_(30);
	
	//リアクターメッセージ
	CommReactorActionNotice();			// リアクター反応があった時の共通処理
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_REACTOR");
	ShowMsg_("REACTER_MSG_004");		// 「敵対モンスターの　反応があります。
	KeyInputWait_();
	CloseMsgWnd_();
	CommResetPlayerMotion();			// モーションを待機状態に戻す共通処理
	Wait_(5);
	
	// コネクティブモード終了
//	CloseConnective();
	
	// バックして移動
	CommPlayerTurnMoveDirWalk(-90);
}

//++++++++++++++++++++++++++++++++++++++++++++++++++++++
// 進入禁止地雷に触れた時、引き返す処理
//------------------------------------------------------
// 第一引数：離れたい配置物の座標
// 第二引数：移動フレーム数(デフォルト引数:30F)
// 戻り値  ：なし
//++++++++++++++++++++++++++++++++++++++++++++++++++++++
function uPlayerTurnMoveDirWalk(npc, move_frame = 30)
{
	local player	 = GetPlayerId_();
	local task_walk	 = Task_MoveForward_(player, 1.0, false);

	SetDirToPos_(player, GetPos_(npc));
	local dir = GetDir_(player);
	SetMotion_(player, MOT_WALK, BLEND_N);
	SetDir_(player, dir+180);
	Wait_(move_frame);
	DeleteTask_(task_walk);
}


//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//		指定した座標に歩きながら振り向く処理
//---------------------------------------------------------------------------
// 第一引数：指定した座標(Vec3)
// 戻り値  ：なし
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function uPlayerTurnAroundPos(pos)
{
	local player    = GetPlayerId_();
	// 対象物の方向に回転(1Fで11.4°ずつ回転)
	local rotateTask = Task_RotateToPosSetMotion_(player, Vec3(pos.x, pos.y, pos.z), ROTATE_EVENT_DEF MOT_WALK, MOT_WAIT);
	WaitTask(rotateTask);
	// 間を持たせる
	Wait_(15);
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		プレイヤーを指定の位置に復帰させる
//------------------------------------------------
//	引数	: xpos	X座標
//			: ypos	Y座標
//			: zpos	Z座標
//			: dir	回転値
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uPlayableReset(xpos, ypos, zpos, dir)
{
	local player;
	player = GetPlayerId_();	// プレイヤーID取得
	
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
	
	SetVisible(player, true);
	SetPos_(player, Vec3(xpos, ypos, zpos));
	SetDir_(player, dir);
	
	SetPlayableCamera_();
	SetCameraDir_(dir);
	Wait_(10);
	
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
}


