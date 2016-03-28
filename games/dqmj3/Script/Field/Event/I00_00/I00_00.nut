//===================== I00_00凍骨の氷原 ====================
//---------------------------------
// ▼空間の遊びで使用する定数
//---------------------------------
// ギミックの起動とクリアフラグ
const GIMMICK_FLG			 = "BFG_SPACE_GIMMICK_ICE";
const GIMMICK_CLEAR_FLG		 = "BFG_SPACE_GIMMICK_ICE_1ST_CLEAR";

// 主人公の復帰位置と向き
const XPOS_1				 = 2660.576;	// 遺跡スイッチ付近
const YPOS_1				 = 1202.927;
const ZPOS_1				 = 1574.711;
const DIR_1					 = 180;

const XPOS_2				 = 2978.0;		// ゴールボスの手前
const YPOS_2				 = 1690.0;
const ZPOS_2				 = -1888.0;
const DIR_2					 = 120;

// 擬似デモで使用するカメラのノード名
const CAMERA_EYE			 = "cameye_001";
const CAMERA_TGT			 = "camtgt_001";

// 遺跡スイッチを起動させる為の鍵ID
const GIMMICK_KEY_ID		 = 904;

// 遺跡スイッチを起動させた時のメッセージID
const GIMMICK_MSG_ID		 = "MASTERS_LOAD_REACTOR_MSG_012";

// 遺跡スイッチ起動後の再生デモナンバー
const DEMO_NUM				 = 333;

// ボスモンスターのID (1=初回, 2=2回目以降)
const BOSS_ID_1				 = "m016_00";	// バトルレックス
const BOSS_ID_2				 = "m016_00";	// バトルレックス

// ボスモンスターのExchange用ID
const BOSS_EXCHANGE_ID		 = 55;			// バトルレックス

// ボスモンスターのスケールと輪郭幅の設定 (1=初回, 2=2回目以降)
//【Nサイズ】スケール=0.6, シルエット幅=0.8
//【Mサイズ】スケール=1.0, シルエット幅=1.0
//【Gサイズ】スケール=2.5, シルエット幅=1.0
//【Tサイズ】スケール=6.0, シルエット幅=1.0
const BOSS_SCALE_1			 = 1.0;
const BOSS_SILHOUETTE_1		 = 1.0;
const BOSS_SCALE_2			 = 1.0;
const BOSS_SILHOUETTE_2		 = 1.0;

// ボス戦の敵パーティテーブル (1=初回, 2=2回目以降)
const BOSS_PARTY_TABLE_1	 = 159;
const BOSS_PARTY_TABLE_2	 = 159;

// ボスを仲間にする際のモンスターパラメータ (1=初回, 2=2回目以降)
const BOSS_PARAMETER_1		 = 1807;
const BOSS_PARAMETER_2		 = 1807;

// ボス仲間後のマップチェンジID
const MAP_ID				 = "I00_00";



//------------------------------------------------
//		戦闘終了後
//------------------------------------------------
function AfterBattle()
{
	local main_num			= GetNumFlg_("NUM_SCENARIO_MAIN");						// Num0
	local ice_event_num		= GetNumFlg_("NUM_SCENARIO_SUB_ICE");					// Num5

	//---------------------------------
	// ▼空間の遊びイベント用のフラグ
	//---------------------------------
	local info = {
		GIMMICK_FLG			 = GIMMICK_FLG,
	};
	
	MastersLoad_AfterBattle(info);


	EventEnd_();
}


//------------------------------------------------
//		マップに入る前
//------------------------------------------------
function BeforeInitMap()
{
	// フラグの状態を取得
	local main_num   = GetNumFlg_("NUM_SCENARIO_MAIN");							// Num0
	local ice_event_num		 = GetNumFlg_("NUM_SCENARIO_SUB_ICE");				// Num5
	local sky_num	 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");						// Num9
	
	// ライドしたまま移動装置を使って来たらライド強制解除
	if(GetEventFlg_("BFG_RIDE_OFF_USED_TRANSFER") == true){
		//ライド強制解除
		SetRideOffStart_();
	}
	
	//-----------------------------------
	// ▼空間の遊びイベント用のフラグ設定
	//-----------------------------------
	local info = {
		GIMMICK_FLG			 = GIMMICK_FLG,
		GIMMICK_CLEAR_FLG	 = GIMMICK_CLEAR_FLG,
	};
	
	MastersLoad_SetFlag(info);
	
	
	EventEnd_();
}


//------------------------------------------------
//		フェードアウト中
//------------------------------------------------
function FadeIn()
{
	local main_num			= GetNumFlg_("NUM_SCENARIO_MAIN");						// Num0
	local ice_event_num		= GetNumFlg_("NUM_SCENARIO_SUB_ICE");					// Num5

	//local bit_ruler_north	= GetNumFlg_("BFG_RULER_ADD_013");						// Bit_213 ルーラ追加 北口[ 削除 : 2次DB #4894 ]

	// ■マップ到達フラグ
	SetEventFlg_("BFG_ARRIVE_AT_I00", true);										// Bit_90 到達フラグ 氷フィールドマップ
	// ■セーブ禁止を解除(セーブ禁止マップから帰ってきた時用)
	SetEventFlg_("BFG_SAVE_PROHIBIT", false);		// セーブ禁止(Bit451)

	// ■時間の設定
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){								// Num0 = 4
		if(GetEventFlg_("BFG_SCENARIO_CLEAR_ICE") == false){		// Bit_43 クリア 氷
			SetTime_(START_TIME_ZONE_NOON);		// 昼に設定
			SetWeather_(WEATHER.NORMAL);		// 天候通常(晴天)に設定
		}
	}

	// ■環境音の再生
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){								// Num0 = 4
		if (ice_event_num <= GetFlagID_("CONST_SS_IF_ARRIVE_ICE_FIELD")) {			// Num5 <= 1
			// 全景デモをまだ見ていない場合は環境音を再生させる
			SetEventFlg_("BFG_I00_00_ENVIRONMENT_BGM_PLAY", true);
		}else{
			// 全景デモを見た後は環境音を再生させない
			SetEventFlg_("BFG_I00_00_ENVIRONMENT_BGM_PLAY", false);
		}
	}
	
	// ■マップチェンジNULL設定
	if (main_num == GetFlagID_("CONST_SM_ICE_FIELD")) {								// Num0 = 4
		if (ice_event_num < GetFlagID_("CONST_SS_IF_GO_TO_THE_ICE_RUINS")) {		// Num5 < 20
			SetHitEnableMapChangeNull_("w_I02_00ALdr_006", false);	// 氷の遺跡
		} else {
			SetEventFlg_("BFG_CHANGE_ICON_ICE_FIELD", true);				// Bit_1155 遺跡の扉 アイコン表示切替
		}
	}

	DebugPrint(" ");
	DebugPrint("NUM_SCENARIO_MAIN の値は " + main_num + " になりました。");
	DebugPrint("NUM_SCENARIO_SUB_ICE の値は " + ice_event_num + " になりました。");

	//---------------
	// ▼ギミック配置
	//---------------
	// ID初期化
	g_gmk_monolith			<- C_NONE_ID;
	g_gim_rulerpoint01		<- C_NONE_ID;
	g_gim_rulerpoint02		<- C_NONE_ID;
	
	// リソース読み込み
	local id_monolith		= ReadGimmick_("o_com_02");		// モノリス
	local id_transfer		= ReadGimmick_("o_com_01");		// 転送装置
	local id_rulerpoint		= ReadGimmick_("o_com_08");		// ルーラポイント

	// ■モノリス
	g_gmk_monolith = ArrangePointGimmick_("o_com_02", id_monolith, "g_monolith");

	// ■移動装置（歓楽の霊道）
	local gmk_enter_transfer = ArrangePointGimmick_("o_com_01", id_transfer, "g_transfer01");

	// ■移動装置（黒鉄の監獄塔）
	local gmk_exit_transfer = ArrangePointGimmick_("o_com_01", id_transfer, "g_transfer03");

	// ■ルーラポイント(モノリス前)※仮の位置に置いています
	g_gim_rulerpoint01 = ArrangePointGimmick_("o_com_08", id_rulerpoint, "g_rulerpoint01");
	SetMotion_(g_gim_rulerpoint01, MOT_GIMMICK_0, BLEND_N);
	if(GetEventFlg_("BFG_RULER_ADD_014") == true){									// Bit_214 ルーラ追加 試練の間
		SetMotion_(g_gim_rulerpoint01, MOT_GIMMICK_2, BLEND_N);
	}

	// ■ルーラポイント(氷の遺跡前)※仮の位置に置いています
	g_gim_rulerpoint02 = ArrangePointGimmick_("o_com_08", id_rulerpoint, "g_rulerpoint02");
	SetMotion_(g_gim_rulerpoint02, MOT_GIMMICK_0, BLEND_N);
	if(GetEventFlg_("BFG_RULER_ADD_015") == true){									// Bit_215 ルーラ追加 氷の遺跡
		SetMotion_(g_gim_rulerpoint02, MOT_GIMMICK_2, BLEND_N);
	}

	//----------
	// ▼NPC配置
	//----------
	// ID初期化
	g_npc_gatekeeper <- C_NONE_ID;
	g_npc_children_d <- C_NONE_ID;

	// リソース読み込み
	local id_gatekeeper = ReadNpc_("m035_00");	// モノリス前の門番()

	// ■モノリス前の門番
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){								// Num0 = 4
		if(ice_event_num < GetFlagID_("CONST_SS_IF_GO_TO_SEE_GATEKEEPER")){		// Num5 < 6
			g_npc_gatekeeper  = ArrangePointNpc_(id_gatekeeper,  "NPC_01");
			SetReactorMsg_(g_npc_gatekeeper, "ICE_NPC_REC");
			SetScaleSilhouette(g_npc_gatekeeper, SCALE.N ,SILHOUETTE_WIDTH.N);//サイズの設定
		}
		else if(ice_event_num > GetFlagID_("CONST_SS_IF_ASKED_TODO")){				// Num5 > 5
			g_npc_gatekeeper  = ArrangePointNpc_(id_gatekeeper,  "NPC_01_2");
			SetReactorMsg_(g_npc_gatekeeper, "ICE_NPC_REC");
			SetScaleSilhouette(g_npc_gatekeeper, SCALE.N ,SILHOUETTE_WIDTH.N);//サイズの設定
		}
	}
	else {
		g_npc_gatekeeper  = ArrangePointNpc_(id_gatekeeper,  "NPC_01_2");
		SetReactorMsg_(g_npc_gatekeeper, "ICE_NPC_REC");
		SetScaleSilhouette(g_npc_gatekeeper, SCALE.N ,SILHOUETTE_WIDTH.N);//サイズの設定
	}

	// ■トードーの子分Ｄ(Redmine#3895 → モノリスから帰ってきたタイミングのみ配置)
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){								// Num0 ==  4
		if(ice_event_num == GetFlagID_("CONST_SS_IF_GO_TO_THE_EAST_ICE_PARK")){		// Num5 == 14
			g_npc_children_d = ReadAndArrangePointNpc("m035_00", "NPC_02");
			SetReactorMsg_(g_npc_children_d, "NPC_TODO_CHILD_REC");
			SetScaleSilhouette(g_npc_children_d, SCALE.N ,SILHOUETTE_WIDTH.N);//サイズの設定
		}
	}

	//-----------
	// ▼地雷配置
	//-----------
	// ID初期化
	g_mine_board_01_inside	 <- C_NONE_ID;
	g_mine_board_02_inside	 <- C_NONE_ID;
	g_mine_board_03_inside	 <- C_NONE_ID;
	g_mine_board_04_inside	 <- C_NONE_ID;
	g_mine_board_05_inside	 <- C_NONE_ID;
	g_mine_board_01_outside	 <- C_NONE_ID;
	g_mine_board_02_outside	 <- C_NONE_ID;
	g_mine_board_03_outside	 <- C_NONE_ID;
	g_mine_board_04_outside	 <- C_NONE_ID;
	g_mine_board_05_outside	 <- C_NONE_ID;
	g_mine_enter_transfer	 <- C_NONE_ID;
	g_mine_exit_transfer	 <- C_NONE_ID;
	g_mine_monolith			 <- C_NONE_ID;
	g_mine_exit_01			 <- C_NONE_ID;
	g_mine_exit_02			 <- C_NONE_ID;
	g_mine_exit_03			 <- C_NONE_ID;
	g_mine_ruler_01			 <- C_NONE_ID;
	g_mine_ruler_02			 <- C_NONE_ID;
	g_mine_01				 <- C_NONE_ID;
	g_mine_01_b				 <- C_NONE_ID;
	g_mine_01_c				 <- C_NONE_ID;
	g_mine_01_d				 <- C_NONE_ID;
	g_mine_door				 <- C_NONE_ID;
	//g_mine_north_park		 <- C_NONE_ID; // [ 削除 : 2次DB #4894 ]
	g_mine_change_bgm_0		 <- C_NONE_ID;
	g_mine_change_bgm_1		 <- C_NONE_ID;
	g_mine_change_bgm_2		 <- C_NONE_ID;

	// ■看板１つ目(表)
	g_mine_board_01_inside = SetPointCircleEventMine_("mine_board01_inside", true);
	// ■看板２つ目(表)
	g_mine_board_02_inside = SetPointCircleEventMine_("mine_board02_inside", true);
	// ■看板３つ目(表)
	g_mine_board_03_inside = SetPointCircleEventMine_("mine_board03_inside", true);
	// ■看板４つ目(表)
	g_mine_board_04_inside = SetPointCircleEventMine_("mine_board04_inside", true);
	// ■看板５つ目(表)
	g_mine_board_05_inside = SetPointCircleEventMine_("mine_board05_inside", true);
	// ■看板１つ目(裏)
	g_mine_board_01_outside = SetPointCircleEventMine_("mine_board01_outside", true);
	// ■看板２つ目(裏)
	g_mine_board_02_outside = SetPointCircleEventMine_("mine_board02_outside", true);
	// ■看板３つ目(裏)
	g_mine_board_03_outside = SetPointCircleEventMine_("mine_board03_outside", true);
	// ■看板４つ目(裏)
	g_mine_board_04_outside = SetPointCircleEventMine_("mine_board04_outside", true);
	// ■看板５つ目(裏)
	g_mine_board_05_outside = SetPointCircleEventMine_("mine_board05_outside", true);

	// ■大陸移動装置(歓楽の霊道行)
	g_mine_enter_transfer = SetPointCircleEventMine_("mine02", true);

	// ■大陸移動装置(黒鉄の監獄塔行)
	if(main_num >= GetFlagID_("CONST_SM_ICE_FIELD")){								// Num0 >= 4
		g_mine_exit_transfer = SetPointCircleEventMine_("mine04", true);
	}

	// ■モノリス
	g_mine_monolith = SetPointCircleEventMine_("mine01", true);

	// ■バーチャルコロシアムの入口を塞ぐ地雷
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){								// Num0 = 4
		if(ice_event_num >= GetFlagID_("CONST_SS_IF_GO_TO_THE_WEST_ICE_PARK")		// Num5 >= 2
		&& ice_event_num < GetFlagID_("CONST_SS_IF_GO_TO_SEE_GATEKEEPER")){		// Num5 < 4
			g_mine_exit_01 = SetPointBoxEventMine_("Mine_Exit_01", false);
			g_mine_exit_02 = SetPointBoxEventMine_("Mine_Exit_02", false);
			g_mine_exit_03 = SetPointBoxEventMine_("Mine_Exit_03", false);
		}
	}

	// ■はじめて凍骨の氷原にきて、最初のトンネルを抜けた時のデモを再生する地雷
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){								// Num0 = 4
		if(ice_event_num == GetFlagID_("CONST_SS_IF_ARRIVE_ICE_FIELD")){			// Num5 = 1
			g_mine_01 = SetPointBoxEventMine_("mine03", false);
			g_mine_01_b = SetPointBoxEventMine_("mine03_b", false);
			g_mine_01_c = SetPointBoxEventMine_("mine03_c", false);
			g_mine_01_d = SetPointBoxEventMine_("mine03_d", false);
		}
	}

	// ■ルーラポイント(モノリス前)
	g_mine_ruler_01 = SetPointCircleEventMine_("mine_ruler_01", true);

	// ■ルーラポイント(氷の遺跡前)
	g_mine_ruler_02 = SetPointCircleEventMine_("mine_ruler_02", true);

	// ■ 氷の遺跡の扉
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){								// Num0 = 4
		if (ice_event_num < GetFlagID_("CONST_SS_IF_GO_TO_THE_ICE_RUINS")) {		// Num5 < 20
			g_mine_door = SetPointCircleEventMine_("mine_door", true);
		}
	}

	// ■ ルーラのとび先追加地雷（北口） [ 削除 : 2次DB #4894 ]
	//if(!bit_ruler_north){					// Bit_213 ルーラ追加 北口
	//	g_mine_north_park = SetPointBoxEventMine_("mine_north_park", false);
	//}

	// ■ ポーラパークのBGMを変更するための地雷
	if(GetEventFlg_("BFG_SET_CHANGE_BGM_MINE")){
		g_mine_change_bgm_0 = SetPointBoxEventMineNoFallWait_("mine_change_bgm_00");
		g_mine_change_bgm_1 = SetPointBoxEventMineNoFallWait_("mine_change_bgm_01");
		g_mine_change_bgm_2 = SetPointBoxEventMineNoFallWait_("mine_change_bgm_02");
		SetMinePlayerStop_(g_mine_change_bgm_0, false);
		SetMinePlayerStop_(g_mine_change_bgm_1, false);
		SetMinePlayerStop_(g_mine_change_bgm_2, false);
	}

	//-------------------------
	// ▼リアクターポイント配置
	//-------------------------
	// ■移動装置（歓楽の霊道）
	local reactorPoint01 = ArrangeMsgReactorPoint("recpoint_01_transfer", GetFlagID_("BFG_REACTER_POINT_015")// Bit_1514 リアクター 移動装置
		, SHORT_DIST, "REC_POINT_ICE_03", "REC_POINT_ICE_03_2");

	// ■移動装置（黒鉄の監獄塔）
	local reactorPoint02 = ArrangeMsgReactorPoint("recpoint_02_transfer", GetFlagID_("BFG_REACTER_POINT_015")// Bit_1514 リアクター 移動装置
		, SHORT_DIST, "REC_POINT_ICE_05", "REC_POINT_ICE_05_2");

	// ■モノリス
	local reactorPoint09 = ArrangeMsgReactorPoint("recpoint_09_monolith", GetFlagID_("BFG_REACTER_POINT_013")// Bit_1512 リアクター モノリス
		, SHORT_DIST, "REC_POINT_ICE_02", "REC_POINT_ICE_02_2");

	// ■ストレンジャー号
	local reactorPoint03 = ArrangeMsgReactorPoint("recpoint_03_iminsen", GetFlagID_("BFG_REACTER_POINT_047")// Bit_1546
		, ENDLESS_DIST, "REC_POINT_ICE_06", "REC_POINT_ICE_06_2");

	// ■巨竜のむくろ
	local reactorPoint04 = ArrangeMsgReactorPoint("recpoint_04_maou", GetFlagID_("BFG_REACTER_POINT_048")// Bit_1547
		, LONG_DIST, "REC_POINT_ICE_07", "REC_POINT_ICE_07_2");

	// ■ポーラパーク１
	local reactorPoint05_1 = ArrangeMsgReactorPoint("recpoint_05_pora01", GetFlagID_("BFG_REACTER_POINT_049")// Bit1548_
		, SHORT_DIST, "REC_POINT_ICE_08", "REC_POINT_ICE_08_2");

	// ■ポーラパーク２
	local reactorPoint05_2 = ArrangeMsgReactorPoint("recpoint_05_pora02", GetFlagID_("BFG_REACTER_POINT_049")// Bit_1548
		, SHORT_DIST, "REC_POINT_ICE_08", "REC_POINT_ICE_08_2");

	// ■鉄の箱舟
	local reactorPoint06 = ArrangeMsgReactorPoint("recpoint_06_iseki", GetFlagID_("BFG_REACTER_POINT_050")// Bit_1549
		, LONG_DIST, "REC_POINT_ICE_09", "REC_POINT_ICE_09_2");

	// ■試練の岬
	local reactorPoint07 = ArrangeMsgReactorPoint("recpoint_07_misaki", GetFlagID_("BFG_REACTER_POINT_051")// Bit_1550
		, LONG_DIST, "REC_POINT_ICE_10", "REC_POINT_ICE_10_2");

	// ■氷の休息所
	local reactorPoint08 = ArrangeMsgReactorPoint("recpoint_08_kyusoujo", GetFlagID_("BFG_REACTER_POINT_052")// Bit_1551
		, SHORT_DIST, "REC_POINT_ICE_11", "REC_POINT_ICE_11_2");

	// ■大氷湖
	local reactorPoint10 = ArrangeMsgReactorPoint("recpoint_10_hyokai", GetFlagID_("BFG_REACTER_POINT_053")// Bit_1552
		, LONG_DIST, "REC_POINT_ICE_12", "REC_POINT_ICE_12_2");

	// ■コア
	local reactorPoint11 = ArrangeMsgReactorPoint("recpoint_11_core", GetFlagID_("BFG_REACTER_POINT_001")// Bit_1500 リアクター コア
		, ENDLESS_DIST, "REC_POINT_ICE_04", "REC_POINT_ICE_04_2");

	// ■氷精の泉
	local reactorPoint12 = ArrangeMsgReactorPoint("recpoint_12_irie", GetFlagID_("BFG_REACTER_POINT_054")// Bit_1553
		, LONG_DIST, "REC_POINT_ICE_13", "REC_POINT_ICE_13_2");

	// ■海賊の洞窟
	local reactorPoint13 = ArrangeMsgReactorPoint("recpoint_13_doukutu", GetFlagID_("BFG_REACTER_POINT_055")// Bit_1554
		, SHORT_DIST, "REC_POINT_ICE_14", "REC_POINT_ICE_14_2");

	// ■ルーラポイント(モノリス前)
	local reactorPoint_ruler01 = ArrangeMsgReactorPoint("recpoint_ruler_monolith", GetFlagID_("BFG_REACTER_POINT_010")// Bit_1520 リアクター ルーラポイント
		, SHORT_DIST, "REC_POINT_ICE_01", "REC_POINT_ICE_01_2");
	
	// ■ルーラポイント(氷の遺跡前)
	local reactorPoint_ruler02 = ArrangeMsgReactorPoint("recpoint_ruler_iseki", GetFlagID_("BFG_REACTER_POINT_010")// Bit_1520 リアクター ルーラポイント
		, SHORT_DIST, "REC_POINT_ICE_01", "REC_POINT_ICE_01_2");

	// ■看板
	local reactorPoint14_1 = ArrangeMsgReactorPoint("recpoint_14_board1", GetFlagID_("BFG_REACTER_POINT_180")// Bit_1679 看板のリアクターポイント
		, SHORT_DIST, "REC_POINT_ICE_15", "REC_POINT_ICE_15_2");
	local reactorPoint14_2 = ArrangeMsgReactorPoint("recpoint_14_board2", GetFlagID_("BFG_REACTER_POINT_180")// Bit_1679 看板のリアクターポイント
		, SHORT_DIST, "REC_POINT_ICE_15", "REC_POINT_ICE_15_2");
	local reactorPoint14_3 = ArrangeMsgReactorPoint("recpoint_14_board3", GetFlagID_("BFG_REACTER_POINT_180")// Bit_1679 看板のリアクターポイント
		, SHORT_DIST, "REC_POINT_ICE_15", "REC_POINT_ICE_15_2");
	local reactorPoint14_4 = ArrangeMsgReactorPoint("recpoint_14_board4", GetFlagID_("BFG_REACTER_POINT_180")// Bit_1679 看板のリアクターポイント
		, SHORT_DIST, "REC_POINT_ICE_15", "REC_POINT_ICE_15_2");
	local reactorPoint14_5 = ArrangeMsgReactorPoint("recpoint_14_board5", GetFlagID_("BFG_REACTER_POINT_180")// Bit_1679 看板のリアクターポイント
		, SHORT_DIST, "REC_POINT_ICE_15", "REC_POINT_ICE_15_2");

	// ■天導の柱
	local reactorPoint15 = ArrangeMsgReactorPoint("recpoint_15_keyhole", GetFlagID_("BFG_REACTER_POINT_176")
		, SHORT_DIST, "REC_POINT_ICE_16", "REC_POINT_ICE_16_2");

	//-----------------
	// ▼マップナビ配置
	//-----------------
	// ■目的地
	local navi_park_west	= ArrangePointNaviMapIcon_(NAVIMAP_ICON.DESTINATION, "map_navi_park_west");	// 西ポーラパーク
	local navi_park_est	 	= ArrangePointNaviMapIcon_(NAVIMAP_ICON.DESTINATION, "map_navi_park_est");		// 東ポーラパーク
	local navi_monolith	 	= ArrangePointNaviMapIcon_(NAVIMAP_ICON.DESTINATION, "map_navi_monolith");		// モノリス
	local navi_transfer	 	= ArrangePointNaviMapIcon_(NAVIMAP_ICON.DESTINATION, "map_navi_transfer");		// 監獄塔行の移動装置
	local navi_iseki		= ArrangePointNaviMapIcon_(NAVIMAP_ICON.DESTINATION, "map_navi_iseki");		// 氷の遺跡
	SetNaviMapIconVisible_(navi_park_west, false);
	SetNaviMapIconVisible_(navi_park_est, false);
	SetNaviMapIconVisible_(navi_monolith, false);
	SetNaviMapIconVisible_(navi_transfer, false);
	SetNaviMapIconVisible_(navi_iseki, false);

	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){								// Num0 = 4
		if(ice_event_num < GetFlagID_("CONST_SS_IF_GO_TO_SEE_GATEKEEPER")){			// Num5 < 6
			SetNaviMapIconVisible_(navi_park_west, true);
		}
		else if(ice_event_num < GetFlagID_("CONST_SS_IF_GO_TO_THE_EAST_ICE_PARK")){	// Num5 < 14
			SetNaviMapIconVisible_(navi_monolith, true);
		}
		else if(ice_event_num < GetFlagID_("CONST_SS_IF_GO_BACK_WEST_ICE_PARK")){	// Num5 < 15
			SetNaviMapIconVisible_(navi_park_est, true);
		}
		else if(ice_event_num < GetFlagID_("CONST_SS_IF_GO_TO_THE_ICE_CEMETERY")){	// Num5 < 17
			SetNaviMapIconVisible_(navi_park_west, true);
		}
		else if(ice_event_num < GetFlagID_("CONST_SS_IF_SECOND_ATTACK")){			// Num5 < 19
			SetNaviMapIconVisible_(navi_park_est, true);
		}
		else if(ice_event_num < GetFlagID_("CONST_SS_IF_GO_TO_THE_ICE_RUINS")){		// Num5 < 20
			SetNaviMapIconVisible_(navi_park_west, true);
		}
		else if(ice_event_num < GetFlagID_("CONST_SS_IF_CLEAR_ICE_FIELD")){			// Num5 < 36
			SetNaviMapIconVisible_(navi_iseki, true);
		}
		else {
			SetNaviMapIconVisible_(navi_transfer, true);
		}
	}

	// ■「！」
	local exclamation01 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "g_monolith");  // モノリス

	// ■ルーラポイントアイコン
	if(GetEventFlg_("BFG_RULER_ADD_014") == true){									// Bit_214 ルーラ追加 試練の間
		local icon01 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.RULER_POINT , "g_rulerpoint01");
		SetNaviMapIconVisible_(icon01, true);
	}

	// ■ルーラポイントアイコン
	if(GetEventFlg_("BFG_RULER_ADD_015") == true){									// Bit_215 ルーラ追加 氷の遺跡
		local icon02 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.RULER_POINT , "g_rulerpoint02");
		SetNaviMapIconVisible_(icon02, true);
	}


	//-----------------------------
	// ▼空間の遊びイベント用の配置
	//-----------------------------
	// ID初期化
	g_keyhole			 <- C_NONE_ID;
	g_keyhole_goal_point <- C_NONE_ID;
	
	g_keyhole_npc		 <- C_NONE_ID;
	
	g_keyhole_mine		 <- C_NONE_ID;
	g_keyhole_goal_mine	 <- C_NONE_ID;
	
	local info = {
		GIMMICK_FLG			 = GIMMICK_FLG,
		GIMMICK_CLEAR_FLG	 = GIMMICK_CLEAR_FLG,
		BOSS_ID_1			 = BOSS_ID_1,
		BOSS_ID_2			 = BOSS_ID_2,
		BOSS_SCALE_1		 = BOSS_SCALE_1,
		BOSS_SILHOUETTE_1	 = BOSS_SILHOUETTE_1,
		BOSS_SCALE_2		 = BOSS_SCALE_2,
		BOSS_SILHOUETTE_2	 = BOSS_SILHOUETTE_2,
	};
	
	MastersLoad_Setting(info);
	
	
	EventEnd_();
}


//------------------------------------------------
//		フィールド操作開始
//------------------------------------------------
function EventStartOperate()
{
	local main_num		 = GetNumFlg_("NUM_SCENARIO_MAIN");						// Num0
	local ice_event_num	 = GetNumFlg_("NUM_SCENARIO_SUB_ICE");					// Num5
	
	// ■ライドフィルタ解除
	if(GetEventFlg_("BFG_RIDE_LICENSE_DIVE") == true){		// Bit_62 Ｂランクライドライセンス 水中
		if(!IsOpenNaviMapRideFilter_(RIDE_FILTER.DIVE)){
			local player = GetPlayerId_();
			Wait_(35);
			SetMotion_(player, MOT_WAIT, BLEND_M);
			// リアクターからのお知らせの挙動
			CommReactorActionNotice();
			// メッセージ
			OpenMsgWnd_();
		    SetTalkName_("NAME_TAG_REACTOR");
		    ShowMsg_("RIDE_FILTER_MSG_01");
		    KeyInputWait_();
		    CloseMsgWnd_();
			OpenNaviMapRideFilter_(RIDE_FILTER.DIVE);
			// プレイヤーのモーションを待機状態に戻す
			CommResetPlayerMotion();
		}
	}
	
	// ■子分Ｄの強制会話
	if(GetEventFlg_("BFG_DISPLAYED_CHILDREN_D_MSG") == false){
		if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){								// Num0 ==  4
			if(ice_event_num == GetFlagID_("CONST_SS_IF_GO_TO_THE_EAST_ICE_PARK")){		// Num5 == 14
				SetEventFlg_("BFG_DISPLAYED_CHILDREN_D_MSG", true);
				Wait_(15);
				// メッセージ
				OpenMsgWnd_();
				ShowMsg_("CHILDREN_D_MSG_001"); // 「親分に言われて あんたの様子を 見に来たが
				KeyInputWait_();
				ShowMsg_("CHILDREN_D_MSG_002"); // 「カンバンの近くから 水中トンネルに
				KeyInputWait_();
			    CloseMsgWnd_();
			}
		}
	}
	
	//-----------------
	// ▼アニメーション
	//-----------------
	// モノリス(「起動前待機」のアニメを設定)
	SetMotion_(g_gmk_monolith, MOT_GIMMICK_0, BLEND_N);
	if(GetEventFlg_("BFG_START_B_MONOLITH") == true){		// Bit_1014 Ｂランクモノリス起動フラグ
		// モノリスの起動後待機アニメを再生
		SetMotion_(g_gmk_monolith, MOT_GIMMICK_2, BLEND_N);
	}

	//-----------------------
	// ▼移動装置を使用した時
	//-----------------------
	if(GetEventFlg_("BFG_RIDE_OFF_USED_TRANSFER") == true){
		UsingTransfer();
		
		// はじめて凍骨の氷原に来たとき
		if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){
			if(ice_event_num == GetFlagID_("CONST_SS_IF_ARRIVE_ICE_FIELD")){
				local shop_lv = 1;
				CommShopLevelChange(shop_lv);
				CommSavedAfterTransferDemo("BFG_SCENARIO_CLEAR_GRAVE");
			}
		}
		
		SetEventFlg_("BFG_RIDE_OFF_USED_TRANSFER", false);
	}

	//-------------------------------------------
	// ▼空間の遊びイベント用のカウントダウン表示
	//-------------------------------------------
	local info = {
		GIMMICK_FLG			 = GIMMICK_FLG,
	};
	
	MastersLoad_CountDown(info);
	
	//--------------------------------
	// ▼空間の遊びイベント用の戦闘判定
	//--------------------------------
	local info = {
		GIMMICK_FLG			 = GIMMICK_FLG,
		GIMMICK_CLEAR_FLG	 = GIMMICK_CLEAR_FLG,
		XPOS_1				 = XPOS_1,
		YPOS_1				 = YPOS_1,
		ZPOS_1				 = ZPOS_1,
		DIR_1				 = DIR_1,
		CAMERA_EYE			 = CAMERA_EYE,
		CAMERA_TGT			 = CAMERA_TGT,
		BOSS_EXCHANGE_ID	 = BOSS_EXCHANGE_ID,
		BOSS_PARAMETER_1	 = BOSS_PARAMETER_1,
		BOSS_PARAMETER_2	 = BOSS_PARAMETER_2,
		MAP_ID				 = MAP_ID,
	};
	
	MastersLoad_BattleJudgment(info);

	EventEnd_();
}


//------------------------------------------------
//		ＮＰＣ接触時
//------------------------------------------------
function TouchNpc()
{
	local main_num			= GetNumFlg_("NUM_SCENARIO_MAIN");						// Num0
	local ice_event_num		= GetNumFlg_("NUM_SCENARIO_SUB_ICE");					// Num5

	local target = GetTargetId_();

	DebugPrint("ID: " + target + " に接触 [TouchNpc]");

	switch (target) {
	case g_npc_gatekeeper :
		uTalkGatekeeper();
		break;
	case g_npc_children_d :
		uTalkChildrenD();
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
	local main_num			= GetNumFlg_("NUM_SCENARIO_MAIN");						// Num0
	local ice_event_num		= GetNumFlg_("NUM_SCENARIO_SUB_ICE");					// Num5
	local dont_use_transfer1 = GetEventFlg_("BFG_DONT_TRANSFER_GRAVE_TO_ICE");		// 霊道-氷原間の大陸移動装置の使用を禁止するフラグ
	local dont_use_transfer2 = GetEventFlg_("BFG_DONT_TRANSFER_ICE_TO_SAND");		// 氷原-砂漠間の大陸移動装置の使用を禁止するフラグ

	local target = GetTouchEventMineId_();
	local player = GetPlayerId_();

	switch ( target ) {
	// 看板１つ目(表)
	case g_mine_board_01_inside:
		CommTurnAroundAndSetPlayableCamera(-65);
		OpenMsgWnd_();
		ShowMsg_("INSIDE_GUIDE_MSG_01");
		KeyInputWait_();
		CloseMsgWnd_();
		break;
	// 看板１つ目(裏)
	case g_mine_board_01_outside:
		CommPlayerTurnAroundDir(115);
		OpenMsgWnd_();
		ShowMsg_("OUTSIDE_GUIDE_MSG_01");
		KeyInputWait_();
		CloseMsgWnd_();
		break;
	// 看板２つ目(表)
	case g_mine_board_02_inside:
		CommTurnAroundAndSetPlayableCamera(-25);
		OpenMsgWnd_();
		ShowMsg_("INSIDE_GUIDE_MSG_02");
		KeyInputWait_();
		CloseMsgWnd_();
		break;
	// 看板２つ目(裏)
	case g_mine_board_02_outside:
		CommPlayerTurnAroundDir(145);
		OpenMsgWnd_();
		ShowMsg_("OUTSIDE_GUIDE_MSG_02");
		KeyInputWait_();
		CloseMsgWnd_();
		break;
	// 看板３つ目(表)
	case g_mine_board_03_inside:
		CommTurnAroundAndSetPlayableCamera(150);
		OpenMsgWnd_();
		ShowMsg_("INSIDE_GUIDE_MSG_03");
		KeyInputWait_();
		CloseMsgWnd_();
		break;
	// 看板３つ目(裏)
	case g_mine_board_03_outside:
		CommPlayerTurnAroundDir(-10);
		OpenMsgWnd_();
		ShowMsg_("OUTSIDE_GUIDE_MSG_03");
		KeyInputWait_();
		CloseMsgWnd_();
		break;
	// 看板４つ目(表)
	case g_mine_board_04_inside:
		CommTurnAroundAndSetPlayableCamera(75);
		OpenMsgWnd_();
		ShowMsg_("INSIDE_GUIDE_MSG_04");
		KeyInputWait_();
		CloseMsgWnd_();
		break;
	// 看板４つ目(裏)
	case g_mine_board_04_outside:
		CommPlayerTurnAroundDir(-100);
		OpenMsgWnd_();
		ShowMsg_("OUTSIDE_GUIDE_MSG_04");
		KeyInputWait_();
		CloseMsgWnd_();
		break;
	// 看板５つ目(表)
	case g_mine_board_05_inside:
		CommTurnAroundAndSetPlayableCamera(40);
		OpenMsgWnd_();
		ShowMsg_("INSIDE_GUIDE_MSG_05");
		KeyInputWait_();
		CloseMsgWnd_();
		break;
	// 看板５つ目(裏)
	case g_mine_board_05_outside:
		CommPlayerTurnAroundDir(-140);
		OpenMsgWnd_();
		ShowMsg_("OUTSIDE_GUIDE_MSG_05");
		KeyInputWait_();
		CloseMsgWnd_();
		break;
	//大陸移動装置(霊道行)
	case g_mine_enter_transfer:
		if(dont_use_transfer1 == false){
			// 選択肢メッセージ
			OpenMsgWnd_();
			ShowMsg_("MINE_02_MSG");
			KeyInputWait_();
			//はい
			if(GetQueryResult_() == QUERY_YES){
				CloseMsgWnd_();
				// ライド状態で大陸移動した場合、ライドを解除するフラグ
				SetEventFlg_("BFG_RIDE_OFF_USED_TRANSFER", true);
				// 歓楽の霊道へ
				ChangeMapPosDir_("G00_00", Vec3(-610.881, 455.082,-1766. 084), 46);
			}
			//いいえ
			else{
				CloseMsgWnd_();
			}
		}
		// 移動装置の使用禁止中だった場合
		else{
			// システムメッセージ
			OpenMsgWnd_();
			ShowMsg_("DONT_USE_TRANSFER_010");		// 移動装置は　動いていない。
			KeyInputWait_();
			CloseMsgWnd_();
		}
		break;

	//大陸移動装置(黒鉄の監獄塔行)
	case g_mine_exit_transfer:
		if(dont_use_transfer2 == false){
			//クリア後
			if(main_num >= GetFlagID_("CONST_SM_PRISON")){								// Num0 >= 5
				// 選択肢メッセージ
				OpenMsgWnd_();
				ShowMsg_("MINE_04_MSG");
				KeyInputWait_();
				//はい
				if(GetQueryResult_() == QUERY_YES){
					CloseMsgWnd_();
					// ライド状態で大陸移動した場合、ライドを解除するフラグ
					SetEventFlg_("BFG_RIDE_OFF_USED_TRANSFER", true);
					// 黒鉄の監獄塔へ
					ChangeMapPosDir_("S00_00", Vec3(-0.944, -357.0, 1362.843), 180);
				}
				//いいえ
				else{
					CloseMsgWnd_();
				}
			}
			if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){							// Num0 = 4
				//起動後
				if(ice_event_num == GetFlagID_("CONST_SS_IF_CLEAR_ICE_FIELD")){			// Num5 = 36
					DeleteEventMine_(g_mine_exit_transfer);
					
					// Numフラグ設定
					SetNumFlg_("NUM_SCENARIO_MAIN", GetFlagID_("CONST_SM_PRISON"));		// Num0 <- 5
					
					// Bitフラグ設定
					SetEventFlg_("BFG_SAVE_POINT_FLAG", true);			// Bit_1033 セーブポイントを挟む
					SetEventFlg_("BFG_RIDE_OFF_USED_TRANSFER", true);	// ライド状態で大陸移動した場合、ライドを解除するフラグ
					
					// デモ再生後の復帰位置
					SetReturnDemoMap_("S00_00"); 
					SetReturnDemoPosDir_(Vec3(-0.944, -357.0, 1362.843), 180);
					
					TouchNpcChangeDemo(331);	//331[移動装置使用]
				}
				//起動前
				if(ice_event_num <= GetFlagID_("CONST_SS_IF_MOVE_THE_WORLD_4")){		// Num5 <= 35
					//システムメッセージ
					OpenMsgWnd_();
					ShowMsg_("MINE_04_MSG_2");
					KeyInputWait_();
					CloseMsgWnd_();
				}
			}
		}
		// 移動装置の使用禁止中だった場合
		else{
			// システムメッセージ
			OpenMsgWnd_();
			ShowMsg_("DONT_USE_TRANSFER_010");		// 移動装置は　動いていない。
			KeyInputWait_();
			CloseMsgWnd_();
		}
		break;

	//モノリス
	case g_mine_monolith:
		CommPlayerTurnAroundObj(g_gmk_monolith);
		// モノリスのアニメを再生(EventCommon)
		MonolithAnime(g_gmk_monolith, "BFG_START_B_MONOLITH", "g_monolith");
		// マップをバーチャルコロシアムに変更する
		ChangeMapPosDir_("O01_00", Vec3(1260.0, 10.0, 0.0), -90);
		break;

	//はじめて凍骨の氷原にきて、最初のトンネルを抜けた時のデモを再生する地雷
	case g_mine_01:
	case g_mine_01_b:
	case g_mine_01_c:
	case g_mine_01_d:
		if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){							// Num0 = 4
			if(ice_event_num == GetFlagID_("CONST_SS_IF_ARRIVE_ICE_FIELD")){		// Num5 = 1
				DeleteEventMine_(g_mine_01);
				DeleteEventMine_(g_mine_01_b);
				DeleteEventMine_(g_mine_01_c);
				DeleteEventMine_(g_mine_01_d);
				SetNumFlg_("NUM_SCENARIO_SUB_ICE", GetFlagID_("CONST_SS_IF_GO_TO_THE_WEST_ICE_PARK"));// Num5 <- 2
				// デモ後の復帰位置の設定
				SetReturnDemoPosDir_(Vec3(-602.2, 683.0, -1397.9), 87);
				
				//300[凍骨の氷原・全景]
				ChangeDemo_(300);
			}
		}
		break;

	//バーチャルコロシアムの入口を塞ぐ地雷
	case g_mine_exit_01:
	case g_mine_exit_02:
	case g_mine_exit_03:
		if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){							// Num0 = 4
			//[凍骨の氷原・全景]後
			if(ice_event_num >= GetFlagID_("CONST_SS_IF_GO_TO_THE_WEST_ICE_PARK")	// Num5 >= 2
			&& ice_event_num < GetFlagID_("CONST_SS_IF_GO_TO_SEE_GATEKEEPER")){	// Num5 < 6
				
				local dir = GetDir_(g_npc_gatekeeper);
				
				FaceToFaceNpc(g_npc_gatekeeper);
				
				OpenMsgWnd_();
				ShowMsg_("DEMO_001_AFT_BC");
				KeyInputWait_();
				CloseMsgWnd_();
				
				Task_RotateToDirSetMotion_(g_npc_gatekeeper, dir, 5.7, MOT_WALK, MOT_WAIT);
				
				if(target == g_mine_exit_01){
					CommPlayerTurnMoveDirWalk(0);
				}
				if(target == g_mine_exit_02){
					CommPlayerTurnMoveDirWalk(90);
				}
			}
		}
		break;

	//ルーラポイント(モノリス前)
	case g_mine_ruler_01:
		CommPlayerTurnAroundObj(g_gim_rulerpoint01);
		CommRulerPointEvent(g_gim_rulerpoint01, "BFG_RULER_ADD_014", "g_rulerpoint01"); 
		break;

	//ルーラポイント(氷の遺跡前)
	case g_mine_ruler_02:
		CommPlayerTurnAroundObj(g_gim_rulerpoint02);
		CommRulerPointEvent(g_gim_rulerpoint02, "BFG_RULER_ADD_015", "g_rulerpoint02"); 
		break;

	// 氷の遺跡の扉
	case g_mine_door:
		if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){								// Num0 = 4
			if (ice_event_num < GetFlagID_("CONST_SS_IF_GO_TO_THE_ICE_RUINS")) {		// Num5 < 20
				local pos  = Vec3(2344.3, 600.0, 1993.0);
				uPlayerTurnAroundPos(pos);
				
				OpenMsgWnd_();
			    SetTalkName_("NAME_TAG_DOORLOCK");	// ドアロック 仮
				ShowMsg_("DOOR_MSG_000");		// 「あなたのリアクターには このドアを
				KeyInputWait_();
				CloseMsgWnd_();
				
				OpenMsgWnd_();
				ShowMsg_("SYSTEM_MSG_000");		// 扉は 開かないようだ……。
				KeyInputWait_();
				CloseMsgWnd_();
			}
		}
		break;

	// ルーラのとび先追加地雷（北口）[ 削除 : 2次DB #4894 ]
	//case g_mine_north_park:
	//		DeleteEventMine_(g_mine_north_park);
	//		SetEventFlg_("BFG_RULER_ADD_013", true);	// Bit_213 ルーラ追加 北口
	//	break;

	// ポーラパークのBGMを変更するための地雷
	case g_mine_change_bgm_0:
		uSetFlagChangeBgm(true);
		break;
	case g_mine_change_bgm_1:
		uSetFlagChangeBgm(false);
		break;
	case g_mine_change_bgm_2:
		uSetFlagChangeBgm(true);
		break;

	// 空間の遊び 遺跡スイッチを調べた時
	case g_keyhole_mine :
		local info = {
			GIMMICK_FLG			 = GIMMICK_FLG,
			GIMMICK_CLEAR_FLG	 = GIMMICK_CLEAR_FLG,
			GIMMICK_KEY_ID		 = GIMMICK_KEY_ID,
			GIMMICK_MSG_ID		 = GIMMICK_MSG_ID,
			XPOS_1				 = XPOS_1,
			YPOS_1				 = YPOS_1,
			ZPOS_1				 = ZPOS_1,
			DIR_1				 = DIR_1,
			BOSS_ID_1			 = BOSS_ID_1,
			BOSS_ID_2			 = BOSS_ID_2,
			BOSS_SCALE_1		 = BOSS_SCALE_1,
			BOSS_SILHOUETTE_1	 = BOSS_SILHOUETTE_1,
			BOSS_SCALE_1		 = BOSS_SCALE_2,
			BOSS_SILHOUETTE_1	 = BOSS_SILHOUETTE_2,
			DEMO_NUM			 = DEMO_NUM,
			MAP_ID				 = MAP_ID,
		};
		
		MastersLoad_MineStart(info);
		break;
	// 空間の遊び ゴール地雷
	case g_keyhole_goal_mine :
		local info = {
			GIMMICK_FLG			 = GIMMICK_FLG,
			GIMMICK_CLEAR_FLG	 = GIMMICK_CLEAR_FLG,
			XPOS_2				 = XPOS_2,
			YPOS_2				 = YPOS_2,
			ZPOS_2				 = ZPOS_2,
			DIR_2				 = DIR_2,
			CAMERA_EYE			 = CAMERA_EYE,
			CAMERA_TGT			 = CAMERA_TGT,
			BOSS_EXCHANGE_ID	 = BOSS_EXCHANGE_ID,
			BOSS_PARTY_TABLE_1	 = BOSS_PARTY_TABLE_1,
			BOSS_PARTY_TABLE_2	 = BOSS_PARTY_TABLE_2,
		};
		
		MastersLoad_MineGoal(info);
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
	local main_num			= GetNumFlg_("NUM_SCENARIO_MAIN");						// Num0
	local ice_event_num		= GetNumFlg_("NUM_SCENARIO_SUB_ICE");					// Num5

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
//		モノリス前の門番 会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkGatekeeper()
{
	local main_num			= GetNumFlg_("NUM_SCENARIO_MAIN");						// Num0
	local ice_event_num		= GetNumFlg_("NUM_SCENARIO_SUB_ICE");					// Num5
	
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){								// Num0 = 4
		if (ice_event_num < GetFlagID_("CONST_SS_IF_GO_TO_SEE_GATEKEEPER")) {		// Num5 < 6
			OpenMsgWnd_();
			ShowMsg_("DEMO_001_AFT_BC");	// 「コラコラ ダメだべ！ こいつは
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if(ice_event_num >= GetFlagID_("CONST_SS_IF_GO_TO_SEE_GATEKEEPER")		// Num5 >=  6
		&& ice_event_num <= GetFlagID_("CONST_SS_VC_JDG_THIRD_BATTLE_B")){			// Num5 <= 13
			OpenMsgWnd_();
			ShowMsg_("DEMO_004_AFT_BC");	// 「親分から話は聞いてるべ。なるほど ここは
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else{
			OpenMsgWnd_();
			ShowMsg_("DEMO_005_AFT_BC");	// 「氷原の 水中には 光る石が置いてあるんだべ。
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else {
		OpenMsgWnd_();
		ShowMsg_("DEMO_005_AFT_BC");		// 「氷原の 水中には 光る石が置いてあるんだべ。
		KeyInputWait_();
		CloseMsgWnd_();
	}
}

//++++++++++++++++++++++++++++++++++++++++++++++
// 子分Ｄ 会話処理
//----------------------------------------------
// 引数  : なし
// 戻り値: なし
//++++++++++++++++++++++++++++++++++++++++++++++
function uTalkChildrenD()
{
	local main_num			= GetNumFlg_("NUM_SCENARIO_MAIN");						// Num0
	local ice_event_num		= GetNumFlg_("NUM_SCENARIO_SUB_ICE");					// Num5

	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){								// Num0 ==  4
		if(ice_event_num == GetFlagID_("CONST_SS_IF_GO_TO_THE_EAST_ICE_PARK")){		// Num5 == 14
			OpenMsgWnd_();
			ShowMsg_("CHILDREN_D_MSG_001"); // 「親分に言われて あんたの様子を 見に来たが
			KeyInputWait_();
			ShowMsg_("CHILDREN_D_MSG_002"); // 「カンバンの近くから 水中トンネルに
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
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

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//		ポーラパークのBGM変更用フラグの設定
//---------------------------------------------------------------------------
// 引数		：なし
// 戻り値	：なし
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function uSetFlagChangeBgm(isChange)
{
	SetEventFlg_("BFG_I01_00_EVENT_BGM021_PLAY", isChange);
}
