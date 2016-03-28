//===================== I02_02氷の遺跡 培養施設 ====================


//------------------------------------------------
//		戦闘終了後
//------------------------------------------------
function AfterBattle()
{
	local main_num			= GetNumFlg_("NUM_SCENARIO_MAIN");							// Num0
	local ice_event_num		= GetNumFlg_("NUM_SCENARIO_SUB_ICE");						// Num5

	// アーザムークに負けた時にNUMフラグを変更する処理（要注意）
	// イベントブロックのEventStartOperate()では敗北を判定できないので
	// ここで敗北の判定とフラグ変更を行う。
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){									// Num0 = 4
		if(ice_event_num == GetFlagID_("CONST_SS_IF_JDG_BATTLE_AZAMUKU")){				// Num5 = 23
			// アーザムークに敗北
			if(GetBattleEndType_() == END_TYPE_LOSE){
				SetNumFlg_("NUM_SCENARIO_SUB_ICE", GetFlagID_("CONST_SS_IF_RE_CONTACT_AZAMUKU"));// Num5 <- 24
			}
		}
		//再戦時
		if(ice_event_num == GetFlagID_("CONST_SS_IF_JDG_REMATCH_AZAMUKU")){				// Num5 = 26
			// アーザムークに敗北
			if(GetBattleEndType_() == END_TYPE_LOSE){
				SetNumFlg_("NUM_SCENARIO_SUB_ICE", GetFlagID_("CONST_SS_IF_RE_CONTACT_AZAMUKU"));// Num5 <- 24
			}
		}
	}

	EventEnd_();
}
//------------------------------------------------
//		マップに入る前
//------------------------------------------------
function BeforeInitMap()
{
	local main_num			 = GetNumFlg_("NUM_SCENARIO_MAIN");							// Num0
	local ice_event_num		 = GetNumFlg_("NUM_SCENARIO_SUB_ICE");						// Num5
	
	/*
		処理なし
	*/
	
	EventEnd_();
}


//------------------------------------------------
//		フェードアウト中
//------------------------------------------------
function FadeIn()
{
	local main_num			 = GetNumFlg_("NUM_SCENARIO_MAIN");							// Num0
	local ice_event_num		 = GetNumFlg_("NUM_SCENARIO_SUB_ICE");						// Num5

	// BGM再生用フラグ
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){									// Num0 = 4
		if(ice_event_num >= GetFlagID_("CONST_SS_IF_CONTACT_AZAMUKU")					// Num5 = 21 以上
		&& ice_event_num <= GetFlagID_("CONST_SS_IF_JDG_REMATCH_AZAMUKU")){				// Num5 = 26 以下
			SetEventFlg_("BFG_I02_02_EVENT_BGM007_PLAY",true);
		}else{
			SetEventFlg_("BFG_I02_02_EVENT_BGM007_PLAY",false);
		}
	}
	
	//----------
	// ▼NPC配置
	//----------
	// ID初期化
	g_azamuku	 <- C_NONE_ID;
	g_todo		 <- C_NONE_ID;
	g_silver	 <- C_NONE_ID;

	// リソース読み込み
	local id_azamuku   = ReadNpc_("m204_00");	// アーザムーク
	local id_todo	   = ReadNpc_("n039");		// トードー
	local id_silver	   = ReadNpc_("m077_00");	// シルバー

	// ■アーザムーク
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){									// Num0 = 4
		// [希望の正体]の再生後
		if(ice_event_num == GetFlagID_("CONST_SS_IF_CONTACT_AZAMUKU")){					// Num5 = 21
			g_azamuku = ArrangePointNpc_(id_azamuku, "Boss");
			local aza_strike = ReadMotion_(g_azamuku, "m204_00_strike_L");			// 装置をたたくL
			SetMotion_(g_azamuku, aza_strike, BLEND_L)								//アザ　装置をたたく
			LoadEffect_("ef730_01_oth_dark_aura01");
			local efc_azamuku = SetSelectBoneEffectSetOffset_("ef730_01_oth_dark_aura01", g_azamuku, ATTACH_EFFECT2, Vec3(0.0, -10.0, 0.0));
			SetTalkTurn_(g_azamuku, false);	// 話しかけても振り向かない
			SetReactorMsg_(g_azamuku, "NPC_AZMK_REC");
		}
		// ■アーザムーク(再戦)
		if(ice_event_num == GetFlagID_("CONST_SS_IF_RE_CONTACT_AZAMUKU")){				// Num5 = 24
			g_azamuku = ArrangePointNpc_(id_azamuku, "Boss");
			local aza_strike = ReadMotion_(g_azamuku, "m204_00_strike_L");			// 装置をたたくL
			SetMotion_(g_azamuku, aza_strike, BLEND_L)								//アザ　装置をたたく
			LoadEffect_("ef730_01_oth_dark_aura01");
			local efc_azamuku = SetSelectBoneEffectSetOffset_("ef730_01_oth_dark_aura01", g_azamuku, ATTACH_EFFECT2, Vec3(0.0, -10.0, 0.0));
			SetReactorMsg_(g_azamuku, "NPC_AZMK_REC");
		}
	}

	// ■トードー、シルバー
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){									// Num0 = 4
		if(ice_event_num > GetFlagID_("CONST_SS_IF_MOVE_THE_WORLD_4")){					// Num5 > 35
			g_todo = ArrangePointNpc_(id_todo, "npc_todo");
			SetMeshVisible_(g_todo, "Model_2", false);	// オサの証
			SetReactorMsg_(g_todo, "NPC_TODO_REC");
			SetTalkCameraType_(g_todo,TALK_CAMERA_UP);//カメラの設定
			SetScaleSilhouette(g_todo, SCALE.TODO ,SILHOUETTE_WIDTH.TODO);//サイズの設定

			g_silver = ArrangePointNpc_(id_silver, "npc_silver");
			SetReactorMsg_(g_silver, "NPC_SILVER_REC");
			SetTalkCameraType_(g_silver,TALK_CAMERA_UP);//カメラの設定
			SetScaleSilhouette(g_silver, SCALE.N ,SILHOUETTE_WIDTH.N);//サイズの設定
		}
	}

	//-----------
	// ▼地雷配置
	//-----------
	// ID初期化
	g_mine01		 <- C_NONE_ID;
	g_mine03		 <- C_NONE_ID;
	g_mine04		 <- C_NONE_ID;
	g_mine05		 <- C_NONE_ID;
	g_mine06		 <- C_NONE_ID;
	g_mine_ruler01	 <- C_NONE_ID;

	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){									// Num0 = 4
		// ■アーザムークに近づくと再戦する地雷
		if(ice_event_num == GetFlagID_("CONST_SS_IF_RE_CONTACT_AZAMUKU")){				// Num5 = 24
			g_mine06 = SetPointBoxEventMine_("mine06", false);
		}
		// ■研究室で台座に乗ったリアクターを調べる地雷
		if(ice_event_num == GetFlagID_("CONST_SS_IF_EXAMINE_THE_PEDESTAL")){			// Num5 = 27
			g_mine01 = SetPointBoxEventMine_("mine01", true);
		}
		// ■研究室で壊れたディスプレイを調べる地雷
		if(ice_event_num > GetFlagID_("CONST_SS_IF_DARK_MASTER_DEMO_3")){				// Num5 > 30
			g_mine03 = SetPointBoxEventMine_("mine03", true);
		}
		// ■ルキヤのリアクターを調べる地雷
		if(ice_event_num == GetFlagID_("CONST_SS_IF_DARK_MASTER_DEMO_3")){				// Num5 = 30
			g_mine04 = SetPointBoxEventMine_("mine04", true);
		}
		// ■サブシステムを調べる地雷
		if(ice_event_num == GetFlagID_("CONST_SS_IF_EXAMINE_BROKEN_SCREEN")){			// Num5 = 31
			g_mine05 = SetPointBoxEventMine_("mine05", true);
		}
	}
	if(main_num >= GetFlagID_("CONST_SM_PRISON")){										// Num0 = 5
		// ■研究室で壊れたディスプレイを調べる地雷
		g_mine03 = SetPointBoxEventMine_("mine03", true);
	}
	// ■ルーラポイント(ボス戦前)
	g_mine_ruler01 = SetPointCircleEventMine_("mine_ruler_01", true);

	DebugPrint("イベント地雷の読込");
	
	//---------------
	// ▼ギミック配置
	//---------------
	// ID初期化
	g_gmk_rukia_rec			<- C_NONE_ID;
	g_gmk_rulerpoint		<- C_NONE_ID;
	
	// ■ルキアのリアクター
	local id_rec	= ReadGimmick_("o_dem_15");		// リアクター
	g_gmk_rukia_rec = ArrangePointGimmick_("o_dem_15", id_rec, "g_rec");

	// ■リアクターの土台
	local id_rec_dodai = ReadGimmick_("o_I02_19");
	local gmk_rec_dodai = ArrangePointGimmick_("o_I02_19", id_rec_dodai, "g_rec_dai");
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){									// Num0 = 4
		if(ice_event_num < GetFlagID_("CONST_SS_IF_DARK_MASTER_DEMO_3")){				// Num5 < 30
			SetMotion_(gmk_rec_dodai, MOT_GIMMICK_2, BLEND_N);
		} else {
			SetMotion_(gmk_rec_dodai, MOT_GIMMICK_0, BLEND_N);
		}
	} else {
		SetMotion_(gmk_rec_dodai, MOT_GIMMICK_0, BLEND_N);
	}

	// ■装置の煙エフェクト
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){									// Num0 = 4
		if(ice_event_num <= GetFlagID_("CONST_SS_IF_EXAMINE_BROKEN_SCREEN")){			// Num5 <= 31
			local  efc_smoke0, efc_smoke1;
			LoadEffect_("ef721_06_nat_smoke_s02");
			efc_smoke0 = SetPointWorldEffect_("ef721_06_nat_smoke_s02", "efc_smoke000");
			SetEffectScale_(efc_smoke0, 2.0);
			efc_smoke1 = SetPointWorldEffect_("ef721_06_nat_smoke_s02", "efc_smoke001");
			SetEffectScale_(efc_smoke1, 2.0);
		}
	}
	
	// ■ディスプレイ画面(通常)
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){									// Num0 = 4
		if(ice_event_num < GetFlagID_("CONST_SS_IF_DARK_MASTER_DEMO_3")){				// Num5 < 30
			local id_screen	 = ReadGimmick_("o_I02_17");		// ディスプレイ画面(通常)
			local gmk_screen = ArrangePointGimmick_("o_I02_17", id_screen, "g_screen");
		}
	}

	// ■サブシステム
	local id_sabsystem	 = ReadGimmick_("o_I02_18");		// サブシステム
	local sabsystem		 = ArrangePointGimmick_("o_I02_18", id_sabsystem, "g_sabsystem");
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){									// Num0 = 4
		if(ice_event_num == GetFlagID_("CONST_SS_IF_EXAMINE_BROKEN_SCREEN")){			// Num5 = 31
			SetMotion_(sabsystem, MOT_GIMMICK_1, BLEND_N);
		} else {
			SetMotion_(sabsystem, MOT_GIMMICK_0, BLEND_N);
		}
	} else {
		SetMotion_(sabsystem, MOT_GIMMICK_0, BLEND_N);
	}

	// ■ルーラポイント
	local id_rulerpoint	 = ReadGimmick_("o_com_08");		// ルーラポイント
	g_gmk_rulerpoint	 = ArrangePointGimmick_("o_com_08", id_rulerpoint, "g_rulerpoint");
	SetMotion_(g_gmk_rulerpoint, MOT_GIMMICK_0, BLEND_N);
	if(GetEventFlg_("BFG_RULER_ADD_016") == true){										// Bit_216 ルーラ追加 培養施設
		SetMotion_(g_gmk_rulerpoint, MOT_GIMMICK_2, BLEND_N);
		//ルーラポイントアイコン
		local icon01 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.RULER_POINT , "g_rulerpoint");
		SetNaviMapIconVisible_(icon01, true);
	}

	//-------------------------
	// ▼リアクターポイント配置
	//-------------------------
	// ■培養制御装置
	local reactorPoint01 = ArrangeMsgReactorPoint("recpoint_01_monitor", GetFlagID_("BFG_REACTER_POINT_063")// Bit_1562
		, SHORT_DIST, "REC_POINT_ICE_01", "REC_POINT_ICE_01_2");

	// ■世界樹の苗
	local reactorPoint02 = ArrangeMsgReactorPoint("recpoint_02_nae", GetFlagID_("BFG_REACTER_POINT_064")// Bit_1563
		, SHORT_DIST, "REC_POINT_ICE_02", "REC_POINT_ICE_02_2");

	// ■ルーラポイント
	local reactorPoint_ruler = ArrangeMsgReactorPoint("recpoint_ruler", GetFlagID_("BFG_REACTER_POINT_010")// Bit_1520 リアクター ルーラポイント
		, SHORT_DIST, "REC_POINT_ICE_RULER", "REC_POINT_ICE_RULER_2");

	//-------------------------
	// ▼ナビマップアイコン配置
	//-------------------------
	// ■「！」
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){									// Num0 = 4
		if(ice_event_num == GetFlagID_("CONST_SS_IF_EXAMINE_THE_PEDESTAL")){			// Num5 = 27
			local exclamation01 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "g_screen");  // モニター
		}
	}

	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){									// Num0 = 4
		if(ice_event_num == GetFlagID_("CONST_SS_IF_DARK_MASTER_DEMO_3")){				// Num5 = 30
			local exclamation02 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "g_rec");  // ルキアのリアクター
		}
	}
	
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){									// Num0 = 4
		if(ice_event_num == GetFlagID_("CONST_SS_IF_EXAMINE_BROKEN_SCREEN")){			// Num5 = 31
			local exclamation03 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "g_sabsystem");  // サブシステム
		}
	}
	
	EventEnd_();
}


//------------------------------------------------
//		フィールド操作開始
//------------------------------------------------
function EventStartOperate()
{
	local main_num			= GetNumFlg_("NUM_SCENARIO_MAIN");							// Num0
	local ice_event_num		= GetNumFlg_("NUM_SCENARIO_SUB_ICE");						// Num5

	//-------------
	// ▼デモの再生
	//-------------
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){									// Num0 = 4
		// ■はじめて培養施設に入った時のデモ
		if(ice_event_num == GetFlagID_("CONST_SS_IF_GO_TO_THE_ICE_RUINS")){				// Num5 = 20
			SetNumFlg_("NUM_SCENARIO_SUB_ICE", GetFlagID_("CONST_SS_IF_CONTACT_AZAMUKU"));// Num5 <- 21
			// デモの復帰位置
			//SetReturnDemoPosDir_(Vec3(-716.604, 125.381, -864.738), 90);
			// 318[希望の正体]
			EventStartChangeDemo(318, FADE_COLOR_BLACK);
		}
		// ■ダークマスターの挑戦 過去映像
		if(ice_event_num == GetFlagID_("CONST_SS_IF_DARK_MASTER_DEMO_1")){				// Num5 = 28
			SetNumFlg_("NUM_SCENARIO_SUB_ICE", GetFlagID_("CONST_SS_IF_DARK_MASTER_DEMO_2"));// Num5 <- 29
			// 323[ダークマスターの挑戦 過去映像]
			SetFade_(FADE_OUT, FADE_COLOR_WHITE, FADE_SHORT);
			SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
			WaitFade_();

			ChangeDemo_(323); 
		}
		// ■ダークマスターの挑戦 モニター壊れ
		if(ice_event_num == GetFlagID_("CONST_SS_IF_DARK_MASTER_DEMO_2")){				// Num5 = 29
			SetNumFlg_("NUM_SCENARIO_SUB_ICE", GetFlagID_("CONST_SS_IF_DARK_MASTER_DEMO_3"));// Num5 <- 30
			// デモの復帰位置
			SetReturnDemoPosDir_(Vec3(188.374, 7.829, -0.574), 91);
			// 324[ダークマスターの挑戦 モニター壊れ]
			SetFade_(FADE_OUT, FADE_COLOR_WHITE, FADE_SHORT);
			SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
			WaitFade_();

			ChangeDemo_(324); 
		}
		// ■嵐の砂漠へ
		if(ice_event_num == GetFlagID_("CONST_SS_IF_MOVE_THE_WORLD_4")){				// Num5 = 35
			SetNumFlg_("NUM_SCENARIO_SUB_ICE",GetFlagID_("CONST_SS_IF_CLEAR_ICE_FIELD"));// Num5 = 36
			// デモの復帰位置
			SetReturnDemoPosDir_(Vec3(62.385, 0.007, -0.574), -89);
			// 330[嵐の砂漠へ]
			EventStartChangeDemo(330, FADE_COLOR_BLACK);
		}
	}
	//-------------
	// ▼戦闘開始
	//-------------
	// ■[アーザムーク戦]
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){									// Num0 = 4
		if(ice_event_num == GetFlagID_("CONST_SS_IF_PRE_BATTLE_AZAMUKU")){				// Num5 = 22
			SetNumFlg_("NUM_SCENARIO_SUB_ICE", GetFlagID_("CONST_SS_IF_JDG_BATTLE_AZAMUKU"));// Num5 <- 23
			ChangeBattleParty_(16);	// アーザムーク戦
		}
	}
	// ■[アーザムーク再戦]
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){									// Num0 = 4
		if(ice_event_num == GetFlagID_("CONST_SS_IF_PRE_REMATCH_AZAMUKU")){				// Num5 = 25
			SetNumFlg_("NUM_SCENARIO_SUB_ICE", GetFlagID_("CONST_SS_IF_JDG_REMATCH_AZAMUKU"));// Num5 <- 26
			ChangeBattleParty_(16);	// アーザムーク戦
		}
	}

	//-------------
	// ▼戦闘結果
	//-------------
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){									// Num0 = 4
		// ■[アーザムーク戦]
		if(ice_event_num == GetFlagID_("CONST_SS_IF_JDG_BATTLE_AZAMUKU")){				// Num5 = 23
			// アーザムークに勝利
			if (GetBattleEndType_() == BATTLE_END_TYPE_WIN){
				SetNumFlg_("NUM_SCENARIO_SUB_ICE", GetFlagID_("CONST_SS_IF_EXAMINE_THE_PEDESTAL"));// Num5 <- 27
				// デモ後に設定される主人公の位置と向き
				SetReturnDemoPosDir_(Vec3(143.990, 7.828, -1.906), 86);
				// 321[アーザムーク戦 勝利]
				EventStartChangeDemo(321, FADE_COLOR_BLACK);
			// アーザムークに敗北
			}else{
				// ここではアーザムーク戦の敗北判定ができないので
				// イベントブロックのAfterBattle()で敗北の判定とフラグ変更を行う。
			}
		}
		// ■[アーザムーク再戦]
		if(ice_event_num == GetFlagID_("CONST_SS_IF_JDG_REMATCH_AZAMUKU")){				// Num5 = 26
			// アーザムークに勝利
			if (GetBattleEndType_() == BATTLE_END_TYPE_WIN){
				SetNumFlg_("NUM_SCENARIO_SUB_ICE", GetFlagID_("CONST_SS_IF_EXAMINE_THE_PEDESTAL"));// Num5 <- 27
				// デモ後に設定される主人公の位置と向き
				SetReturnDemoPosDir_(Vec3(143.990, 7.828, -1.906), 86);
				// 321[アーザムーク戦 勝利]
				EventStartChangeDemo(321, FADE_COLOR_BLACK);
			// アーザムークに敗北
			}else{
				// ここではアーザムーク戦の敗北判定ができないので
				// イベントブロックのAfterBattle()で敗北の判定とフラグ変更を行う。
			}
		}
	}

	EventEnd_();
}

//------------------------------------------------
//		ＮＰＣ接触時
//------------------------------------------------
function TouchNpc()
{
	local main_num			= GetNumFlg_("NUM_SCENARIO_MAIN");							// Num0
	local ice_event_num		= GetNumFlg_("NUM_SCENARIO_SUB_ICE");						// Num5

	local target = GetTargetId_();
	
	// ■アーザムーク
	if(target == g_azamuku){
		if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){								// Num0 = 4
			if(ice_event_num == GetFlagID_("CONST_SS_IF_CONTACT_AZAMUKU")){				// Num5 = 21
				SetNumFlg_("NUM_SCENARIO_SUB_ICE",GetFlagID_("CONST_SS_IF_PRE_BATTLE_AZAMUKU"));// Num5 <- 22
				// Demo319[アーザムーク戦闘前]再生
				TouchNpcChangeDemo(319);
			}
		}
	}

	// ■トードー
	if(target == g_todo){
		if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){									// Num0 = 4
			if(ice_event_num > GetFlagID_("CONST_SS_IF_MOVE_THE_WORLD_4")){					// Num5 > 35
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_TODO");
				ShowMsg_("MSG_NPC_TODO");			// 「黒鉄の監獄塔への 移動装置に向かうにゃ
				KeyInputWait_();
				CloseMsgWnd_();
			}
		}
	}

	// ■シルバー
	if(target == g_silver){
		if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){									// Num0 = 4
			if(ice_event_num > GetFlagID_("CONST_SS_IF_MOVE_THE_WORLD_4")){					// Num5 > 35
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_SILVER");
				ShowMsg_("MSG_NPC_SILV");			// 「もしも 旅先でルキヤと会ったら
				KeyInputWait_();
				CloseMsgWnd_();
			}
		}
	}

	EventEnd_();
}

//------------------------------------------------
//		地雷接触時
//------------------------------------------------
function TouchEventMine()
{
	local main_num			= GetNumFlg_("NUM_SCENARIO_MAIN");							// Num0
	local ice_event_num		= GetNumFlg_("NUM_SCENARIO_SUB_ICE");						// Num5

	local target = GetTouchEventMineId_();

	switch ( target ) {
	//アーザムークに近づくと再戦する地雷
	case g_mine06:
		if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){								// Num0 = 4
			if(ice_event_num == GetFlagID_("CONST_SS_IF_RE_CONTACT_AZAMUKU")){			// Num5 = 24
				DeleteEventMine_(g_mine06);
				SetNumFlg_("NUM_SCENARIO_SUB_ICE",GetFlagID_("CONST_SS_IF_PRE_REMATCH_AZAMUKU"));// Num5 <- 25
				// 320[アーザムーク再戦]
				TouchNpcChangeDemo(320);
			}
		}
		break;

	//研究室で台座に乗ったリアクターを調べる地雷
	case g_mine01:
		if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){								// Num0 = 4
			if(ice_event_num == GetFlagID_("CONST_SS_IF_EXAMINE_THE_PEDESTAL")){		// Num5 = 27
				DeleteEventMine_(g_mine01);
				SetNumFlg_("NUM_SCENARIO_SUB_ICE",GetFlagID_("CONST_SS_IF_DARK_MASTER_DEMO_1"));// Num5 <- 28
				// 322[ダークマスターの挑戦]
				TouchNpcChangeDemo(322);
			}
		}
		break;

	//ルキヤのリアクターを調べる地雷
	case g_mine04:
		if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){								// Num0 = 4
			if(ice_event_num == GetFlagID_("CONST_SS_IF_DARK_MASTER_DEMO_3")){			// Num5 = 30
				DeleteEventMine_(g_mine04);
				SetNumFlg_("NUM_SCENARIO_SUB_ICE",GetFlagID_("CONST_SS_IF_EXAMINE_BROKEN_SCREEN"));// Num5 <- 31
				// デモの復帰位置
				//SetReturnDemoPosDir_(Vec3(-142.133, 81.652, -284.167), 170);
				// 325[ルキヤのメッセージ]
				TouchNpcChangeDemo(325);
			}
		}
		break;

	//サブシステムを調べる地雷
	case g_mine05:
		if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){								// Num0 = 4
			if(ice_event_num == GetFlagID_("CONST_SS_IF_EXAMINE_BROKEN_SCREEN")){				// Num5 = 31
				DeleteEventMine_(g_mine05);
				SetNumFlg_("NUM_SCENARIO_SUB_ICE", GetFlagID_("CONST_SS_IF_MOVE_THE_WORLD_4"));// Num5 <- 35
				// 327[世界移動が可能に②]
				TouchNpcChangeDemo(327);
			}
		}
		break;

	//研究室で壊れたディスプレイを調べる地雷
	case g_mine03:
		if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){								// Num0 = 4
			if(ice_event_num >= GetFlagID_("CONST_SS_IF_DARK_MASTER_DEMO_3")){			// Num5 >= 30
				CommPlayerTurnAroundObj(g_gmk_rukia_rec);
				//システムメッセージ
				OpenMsgWnd_();
				ShowMsg_("MSG_DEMO324_AFTER_SYS");
				KeyInputWait_();
				CloseMsgWnd_();
			}
		}
		else if(main_num >= GetFlagID_("CONST_SM_PRISON")){								// Num0 >= 5
				CommPlayerTurnAroundObj(g_gmk_rukia_rec);
				//システムメッセージ
				OpenMsgWnd_();
				ShowMsg_("MSG_DEMO324_AFTER_SYS");
				KeyInputWait_();
				CloseMsgWnd_();
		}
		break;

	//ルーラポイント(ボス戦前)
	case g_mine_ruler01:
		CommPlayerTurnAroundObj(g_gmk_rulerpoint);
		CommRulerPointEvent(g_gmk_rulerpoint, "BFG_RULER_ADD_016", "g_rulerpoint"); 
		break;

	default:
		DebugPrint("設置されていない地雷に接触判定しています！");
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
	local main_num			= GetNumFlg_("NUM_SCENARIO_MAIN");							// Num0
	local ice_event_num		= GetNumFlg_("NUM_SCENARIO_SUB_ICE");						// Num5

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


