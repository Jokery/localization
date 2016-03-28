//===================== 拠点【ポイントゼロ(U00_00)】 ====================

// ▼定数定義
const DEMO_NONE		 = 0;
const DEMO_YATIHOKO	 = 1;
const DEMO_WADATUMI	 = 2;
const DEMO_HOAKARI	 = 3;

//------------------------------------------------
//		戦闘終了後
//------------------------------------------------
function AfterBattle()
{
	EventEnd_();
}

//------------------------------------------------
//		マップに入る前
//------------------------------------------------
function BeforeInitMap()
{
	// 陸海空のスターピースの組み込みデモ(Demo819～821)の後に連続してデモを流すため用のフラグ
	if(GetEventFlg_("BFG_CONTINUED_STAR_PIECE_DEMO") == true){
		//ライド強制解除
		SetRideOffStart_();
	}
	
	// 特技石碑の擬似デモ再生前にライドを解除する
	if(GetEventFlg_("BFG_RIDE_OFF_FLAG_BEFORE_STELE") == true){
		//ライド強制解除
		SetRideOffStart_();
	}
	
	EventEnd_();
}

//------------------------------------------------
//		フェードイン
//------------------------------------------------
function FadeIn()
{
	// 進行フラグの状態を取得
	local main_num    = GetNumFlg_("NUM_SCENARIO_MAIN");
	local outside_num = GetNumFlg_("NUM_SCENARIO_SUB_INSIDE_CLEAR");
	DebugPrint(" ");
	DebugPrint("NUM_SCENARIO_MAIN の値は " + main_num + " になりました。");
	//DebugPrint("NUM_SCENARIO_SUB_OP の値は " + event_num + " になりました。");

	//---------------
	// ▼フラグ設定
	//---------------
	SetEventFlg_("BFG_ARRIVE_AT_U00", true);		// Bit101 : 到達フラグ ポイントゼロ
	SetEventFlg_("BFG_RULER_ADD_027", true);		// Bit227 : ルーラ追加フラグ ポイントゼロ
	
	// demo801[ルキヤとの再会]再生後にポイントゼロに到達したか
	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){ 				// NUM000 = 9
		if(outside_num == GetFlagID_("CONST_SS_OS_GO_POINT_ZERO")){		// NUM010 = 2
			SetEventFlg_("BFG_DEMO801_AFTER_U00_00", true);				// Bit1386
		}
	}

	//---------------
	// ▼ギミック配置
	//---------------
	// ID初期化
	g_door_red      <- C_NONE_ID;
	g_door_green    <- C_NONE_ID;
	g_door_blue     <- C_NONE_ID;
	g_room_door_01  <- C_NONE_ID;
	g_room_door_02  <- C_NONE_ID;

	// ■脱出ポッド
	if(main_num <= GetFlagID_("CONST_SM_INSIDE_CLEAR")){				// NUM000 <= 9
		local escape_pod_id = ReadGimmick_("o_U00_02");
		local g_escape_pod_01 = ArrangePointGimmick_("o_U00_02", escape_pod_id, "g_escape_pod_01");
		local g_escape_pod_02 = ArrangePointGimmick_("o_U00_02", escape_pod_id, "g_escape_pod_02");
		local g_escape_pod_03 = ArrangePointGimmick_("o_U00_02", escape_pod_id, "g_escape_pod_03");
	}

	// ■赤扉
	if(GetEventFlg_("BFG_PLAYED_HOAKARI_SEALED_DEMO") == false){
		local red_door_id = ReadGimmick_("o_U00_05");
		g_door_red = ArrangePointGimmick_("o_U00_05", red_door_id, "g_door_red");
		// 外扉(中央) -> 開いたら宇宙のゴミになる設定なので、開待機のアニメはなし
		local out_door_c_id = ReadGimmick_("o_U00_06");
		local g_out_door_c  = ArrangePointGimmick_("o_U00_06", out_door_c_id, "g_out_door_01");
	}
	else{
		// マップの扉アイコンを非表示にする
		SetEventFlg_("BFG_MAP_ICON_050", true);
	}
	// ■緑扉
	if(GetEventFlg_("BFG_PLAYED_YATIHOKO_SEALED_DEMO") == false){
		local green_door_id = ReadGimmick_("o_U00_09");
		g_door_green = ArrangePointGimmick_("o_U00_09", green_door_id, "g_door_green");
		// 外扉(左) -> 開いたら宇宙のゴミになる設定なので、開待機のアニメはなし
		local out_door_l_id = ReadGimmick_("o_U00_06");
		local g_out_door_l  = ArrangePointGimmick_("o_U00_06", out_door_l_id, "g_out_door_02");
	}
	else{
		// マップの扉アイコンを非表示にする
		SetEventFlg_("BFG_MAP_ICON_048", true);
	}
	// ■青扉
	if(GetEventFlg_("BFG_PLAYED_WADATUMI_SEALED_DEMO") == false){
		local blue_door_id = ReadGimmick_("o_U00_10");
		g_door_blue = ArrangePointGimmick_("o_U00_10", blue_door_id, "g_door_blue");
		// 外扉(右) -> 開いたら宇宙のゴミになる設定なので、開待機のアニメはなし
		local out_door_r_id = ReadGimmick_("o_U00_06");
		local g_out_door_r  = ArrangePointGimmick_("o_U00_06", out_door_r_id, "g_out_door_03");
	}
	else{
		// マップの扉アイコンを非表示にする
		SetEventFlg_("BFG_MAP_ICON_049", true);
	}

	// ■特技石碑(ラナルータ)
	local g_stele = ReadGimmick_("o_com_07");
	g_ranaruta_stele <- ArrangePointGimmick_("o_com_07", g_stele, "g_stele_01");
	SetMotion_(g_ranaruta_stele, "GIMMICK_0", 0);
	if(GetEventFlg_("BFG_EXAMINE_RANARUTA_STELE") == true){
		SetMotion_(g_ranaruta_stele, "GIMMICK_2", 0);
	}
	// ■特技石碑(ラナリオン)
	g_ranarion_stele <- ArrangePointGimmick_("o_com_07", g_stele, "g_stele_02");
	SetMotion_(g_ranarion_stele, "GIMMICK_0", 0);
	if(GetEventFlg_("BFG_EXAMINE_RANARION_STELE") == true){
		SetMotion_(g_ranarion_stele, "GIMMICK_2", 0);
	}
	// ■特技石碑(イメージチェンジ)
	g_makeup_stele <- ArrangePointGimmick_("o_com_07", g_stele, "g_stele_03");
	SetMotion_(g_makeup_stele, "GIMMICK_0", 0);
	if(GetEventFlg_("BFG_EXAMINE_MAKE_UP_STELE") == true){
		SetMotion_(g_makeup_stele, "GIMMICK_2", 0);
	}
	// ■部屋の扉
	local room_door_id = ReadGimmick_("o_U00_14");
	if(GetEventFlg_("BFG_CHECK_ROOM_DOOR_1") == false){
		g_room_door_01 = ArrangePointGimmick_("o_U00_14", room_door_id, "g_room_door_01");
		SetMotion_(g_room_door_01, MOT_GIMMICK_0, BLEND_N);
	}
	if(GetEventFlg_("BFG_CHECK_ROOM_DOOR_2") == false){
		g_room_door_02 = ArrangePointGimmick_("o_U00_14", room_door_id, "g_room_door_02");
		SetMotion_(g_room_door_02, MOT_GIMMICK_0, BLEND_N);
	}

	//---------------
	// ▼エフェクト配置
	//---------------
	// スターシード
	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){					// NUM0 = 9
		// スターシードベースのエフェクト(完成前)
		if(outside_num <= GetFlagID_("CONST_SS_OS_COLLECT_STAR_PIECE_2")){	// NUM010 <= 11
			LoadEffect_("ef732_25_star_seed_base01");	// スターシードベース
			LoadEffect_("ef340_06_star_seed_case");		// 球体エフェクト
			LoadEffect_("ef340_07_star_seed_shaton_u");	// 電気エフェクト(上)
			LoadEffect_("ef340_08_star_seed_shaton_d");	// 電気エフェクト(下)
			// スターシードベース
			local model_base = ReadGimmick_("o_effect_base");
			local seed = ArrangePointGimmick_("o_effect_base", model_base, "ef_seed"); //スターシード（エフェクトベース）
			SetPointPosNoFit_(seed, "ef_seed");
			local efc_seed = SetSelectBoneEffect_("ef732_25_star_seed_base01", seed, ATTACH_GLOBAL);
			SetEffectScale_(efc_seed, 0.5);
			// 球体エフェクト
			local efc_case    = SetPointWorldEffect_("ef340_06_star_seed_case", "ef_seed_case");
			// 電気エフェクト(上)
			local efc_elec_01 = SetPointWorldEffect_("ef340_07_star_seed_shaton_u", "ef_seed_case_shaton_01");
			// 電気エフェクト(下)
			local efc_elec_02 = SetPointWorldEffect_("ef340_08_star_seed_shaton_d", "ef_seed_case_shaton_02");
			// スターピースのエフェクト
			if(GetEventFlg_("BFG_STAR_PIECE_EFFECT_ON_GREEN") == true){
				// 陸のスターピース[軌道 : 緑]
				LoadEffect_("ef732_22_star_seed_m_g");
				local ef_green = SetPointWorldEffect_("ef732_22_star_seed_m_g", "ef_seed");
			}
			if(GetEventFlg_("BFG_STAR_PIECE_EFFECT_ON_BLUE") == true){
				// 海のスターピース[軌道 : 青]
				LoadEffect_("ef732_23_star_seed_m_b");
				local ef_blue = SetPointWorldEffect_("ef732_23_star_seed_m_b", "ef_seed");
			}
			if(GetEventFlg_("BFG_STAR_PIECE_EFFECT_ON_RED") == true){
				// 空のスターピース[軌道 : 赤]
				LoadEffect_("ef732_24_star_seed_m_r");
				local ef_red = SetPointWorldEffect_("ef732_24_star_seed_m_r", "ef_seed");
			}
		}
		// それ以外 : NUM010 が 12 以降は配置しない(コアに持っていくため)
		else{
		}
	}

	// 時空の裂け目
	LoadEffect_("ef300_25_wormhole");
	wormhole_01 <- SetPointWorldEffect_("ef300_25_wormhole", "ef_wormhole_01");
	wormhole_02 <- SetPointWorldEffect_("ef300_25_wormhole", "ef_wormhole_02");
	wormhole_03 <- SetPointWorldEffect_("ef300_25_wormhole", "ef_wormhole_03");

	//----------
	// ▼NPC配置
	//----------
	// ID初期化
	npc_Rukiya <- C_NONE_ID;
	npc_Aroma <- C_NONE_ID;

	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){							// NUM0  = 9
		if(outside_num == GetFlagID_("CONST_SS_OS_GO_POINT_ZERO")){					// NUM10 = 2
			npc_Rukiya = ReadAndArrangePointNpc("n009", "npc_rukiya");
			SetTalkCameraType_(npc_Rukiya, TALK_CAMERA_UP);
			SetReactorMsg_(npc_Rukiya, "NPC_RUKIYA_REC");
			// 会話カメラ時に透過されるのでアルファ値を設定する
			SetManualCalcAlpha_(npc_Rukiya, true);
			SetAlpha_(npc_Rukiya, 1.0);
		}
		else if(outside_num == GetFlagID_("CONST_SS_OS_GO_POINT_ZERO_LAB_1")){		// NUM10 = 3
			npc_Aroma = ReadAndArrangePointNpc("n018", "npc_aroma_01");
			SetTalkCameraType_(npc_Aroma, TALK_CAMERA_UP);
			SetReactorMsg_(npc_Aroma, "NPC_AROMA_REC");
			// 会話カメラ時に透過されるのでアルファ値を設定する
			SetManualCalcAlpha_(npc_Aroma, true);
			SetAlpha_(npc_Aroma, 1.0);
		}
		else if(outside_num == GetFlagID_("CONST_SS_OS_GO_CENTER_BILL_1F")){		// NUM10 = 4
			npc_Aroma = ReadAndArrangePointNpc("n018", "npc_aroma_02");
			SetTalkCameraType_(npc_Aroma, TALK_CAMERA_UP);
			SetReactorMsg_(npc_Aroma, "NPC_AROMA_REC");
			// 会話カメラ時に透過されるのでアルファ値を設定する
			SetManualCalcAlpha_(npc_Aroma, true);
			SetAlpha_(npc_Aroma, 1.0);
		}
		else if(outside_num >= GetFlagID_("CONST_SS_OS_COLLECT_STAR_PIECE")			// NUM10 >= 10
			&&  outside_num <= GetFlagID_("CONST_SS_OS_GO_TO_CORE") ){				// NUM10 <= 12
			npc_Aroma = ReadAndArrangePointNpc("n018", "npc_aroma_02");
			SetTalkCameraType_(npc_Aroma, TALK_CAMERA_UP);
			SetReactorMsg_(npc_Aroma, "NPC_AROMA_REC");
			// 会話カメラ時に透過されるのでアルファ値を設定する
			SetManualCalcAlpha_(npc_Aroma, true);
			SetAlpha_(npc_Aroma, 1.0);
		}
	}

	//-------------------------
	// ▼リアクターポイント配置
	//-------------------------
	// ■ふしぎな石碑
	local reactorPoint02 = ArrangeMsgReactorPoint("ReactorPoint_02", GetFlagID_("BFG_REACTER_POINT_125")
		, SHORT_DIST, "REC_POINT_NOC_02_01", "REC_POINT_NOC_02_02");
	local reactorPoint03 = ArrangeMsgReactorPoint("ReactorPoint_03", GetFlagID_("BFG_REACTER_POINT_126")
		, SHORT_DIST, "REC_POINT_NOC_03_01", "REC_POINT_NOC_03_02");
	local reactorPoint15 = ArrangeMsgReactorPoint("ReactorPoint_15", GetFlagID_("BFG_REACTER_POINT_171")
		, SHORT_DIST, "REC_POINT_NOC_04_01", "REC_POINT_NOC_04_02");
	// ■エイリアス装置
	local reactorPoint04_1 = ArrangeMsgReactorPoint("ReactorPoint_04_1", GetFlagID_("BFG_REACTER_POINT_160")
		, SHORT_DIST, "REC_POINT_04_01", "REC_POINT_04_02");
	local reactorPoint04_2 = ArrangeMsgReactorPoint("ReactorPoint_04_2", GetFlagID_("BFG_REACTER_POINT_160")
		, SHORT_DIST, "REC_POINT_04_01", "REC_POINT_04_02");
	local reactorPoint04_3 = ArrangeMsgReactorPoint("ReactorPoint_04_3", GetFlagID_("BFG_REACTER_POINT_160")
		, SHORT_DIST, "REC_POINT_04_01", "REC_POINT_04_02");
	// ■脱出ポッド
	if(main_num <= GetFlagID_("CONST_SM_INSIDE_CLEAR")){				   // NUM000 <= 9
		local reactorPoint05_1 = ArrangeMsgReactorPoint("ReactorPoint_05_1", GetFlagID_("BFG_REACTER_POINT_161")
			, SHORT_DIST, "REC_POINT_05_01", "REC_POINT_05_02");
		local reactorPoint05_2 = ArrangeMsgReactorPoint("ReactorPoint_05_2", GetFlagID_("BFG_REACTER_POINT_161")
			, SHORT_DIST, "REC_POINT_05_01", "REC_POINT_05_02");
		local reactorPoint05_3 = ArrangeMsgReactorPoint("ReactorPoint_05_3", GetFlagID_("BFG_REACTER_POINT_161")
			, SHORT_DIST, "REC_POINT_05_01", "REC_POINT_05_02");
	}
	// ■スターシード
	local reactorPoint06 = C_NONE_ID;
	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){					// NUM000 == 9
		if(outside_num <= GetFlagID_("CONST_SS_OS_COLLECT_STAR_PIECE_2")){	// NUM010 が 11 以下
			reactorPoint06 = ArrangeMsgReactorPoint("ReactorPoint_06", GetFlagID_("BFG_REACTER_POINT_162")
				, SHORT_DIST, "REC_POINT_06_01", "REC_POINT_06_02");
		}
		else{
			// 配置しない(コアに持っていくため)
		}
	}
	// ■地の扉－超飛行装置
	local reactorPoint07	 = C_NONE_ID;
	local reactorPoint10_2	 = C_NONE_ID;
	if(GetEventFlg_("BFG_PLAYED_YATIHOKO_SEALED_DEMO") == false){
		reactorPoint07 = ArrangeMsgReactorPoint("ReactorPoint_07", GetFlagID_("BFG_REACTER_POINT_163")
			, SHORT_DIST, "REC_POINT_07_01", "REC_POINT_07_02");
	} else {
		reactorPoint10_2 = ArrangeMsgReactorPoint("ReactorPoint_10_2", GetFlagID_("BFG_REACTER_POINT_166")
		, RING_DIST, "REC_POINT_10_01", "REC_POINT_10_02");
	}
	// ■水の扉－超飛行装置
	local reactorPoint08	 = C_NONE_ID;
	local reactorPoint10_3	 = C_NONE_ID;
	if(GetEventFlg_("BFG_PLAYED_WADATUMI_SEALED_DEMO") == false){
		reactorPoint08 = ArrangeMsgReactorPoint("ReactorPoint_08", GetFlagID_("BFG_REACTER_POINT_164")
			, SHORT_DIST, "REC_POINT_08_01", "REC_POINT_08_02");
	} else {
		reactorPoint10_3 = ArrangeMsgReactorPoint("ReactorPoint_10_3", GetFlagID_("BFG_REACTER_POINT_166")
		, RING_DIST, "REC_POINT_10_01", "REC_POINT_10_02");
	}
	// ■天の扉－超飛行装置
	local reactorPoint09	 = C_NONE_ID;
	local reactorPoint10_1	 = C_NONE_ID;
	if(GetEventFlg_("BFG_PLAYED_HOAKARI_SEALED_DEMO") == false){
		reactorPoint09 = ArrangeMsgReactorPoint("ReactorPoint_09", GetFlagID_("BFG_REACTER_POINT_165")
			, SHORT_DIST, "REC_POINT_09_01", "REC_POINT_09_02");
	} else {
		reactorPoint10_1 = ArrangeMsgReactorPoint("ReactorPoint_10_1", GetFlagID_("BFG_REACTER_POINT_166")
		, RING_DIST, "REC_POINT_10_01", "REC_POINT_10_02");
	}
	// ■超飛行装置
	local reactorPoint10_4 = ArrangeMsgReactorPoint("ReactorPoint_10_4", GetFlagID_("BFG_REACTER_POINT_166")
		, RING_DIST, "REC_POINT_10_01", "REC_POINT_10_02");
	local reactorPoint10_5 = ArrangeMsgReactorPoint("ReactorPoint_10_5", GetFlagID_("BFG_REACTER_POINT_166")
		, RING_DIST, "REC_POINT_10_01", "REC_POINT_10_02");
	local reactorPoint10_6 = ArrangeMsgReactorPoint("ReactorPoint_10_6", GetFlagID_("BFG_REACTER_POINT_166")
		, RING_DIST, "REC_POINT_10_01", "REC_POINT_10_02");
	// ■暗礁の海
	local reactorPoint11 = ArrangeMsgReactorPoint("ReactorPoint_11", GetFlagID_("BFG_REACTER_POINT_167")
		, ENDLESS_DIST, "REC_POINT_11_01", "REC_POINT_11_02");
	// ■地の裂け目
	local y_status_num = GetNumFlg_("NUM_YATIHOKO_PHASE");
	local reactorPoint12 = C_NONE_ID;
	if(y_status_num <= 6){
		reactorPoint12 = ArrangeMsgReactorPoint("ReactorPoint_12", GetFlagID_("BFG_REACTER_POINT_168")
			, SHORT_DIST, "REC_POINT_12_01", "REC_POINT_12_02");
	}
	// ■水の裂け目
	local w_status_num = GetNumFlg_("NUM_WADATUMI_PHASE");
	local reactorPoint13 = C_NONE_ID;
	if(w_status_num <= 6){
		reactorPoint13 = ArrangeMsgReactorPoint("ReactorPoint_13", GetFlagID_("BFG_REACTER_POINT_169")
			, SHORT_DIST, "REC_POINT_13_01", "REC_POINT_13_02");
	}
	// ■天の裂け目
	local h_status_num = GetNumFlg_("NUM_HOAKARI_PHASE");
	local reactorPoint14 = C_NONE_ID;
	if(h_status_num <= 6){
		reactorPoint14 = ArrangeMsgReactorPoint("ReactorPoint_14", GetFlagID_("BFG_REACTER_POINT_170")
			, SHORT_DIST, "REC_POINT_14_01", "REC_POINT_14_02");
	}
	// ■コア
	local reactorPoint16 = ArrangeMsgReactorPoint("ReactorPoint_16", GetFlagID_("BFG_REACTER_POINT_001")
		, ENDLESS_DIST, "REC_POINT_15_01", "REC_POINT_15_02");

	//-----------
	// ▼地雷配置
	//-----------
	// ID初期化
	mine_wormhole_01 <- C_NONE_ID; // 陸
	mine_wormhole_02 <- C_NONE_ID; // 海
	mine_wormhole_03 <- C_NONE_ID; // 空
	mine_00 <- C_NONE_ID;
	mine_01 <- C_NONE_ID;
	mine_02 <- C_NONE_ID;
	mine_03 <- C_NONE_ID;
	mine_04 <- C_NONE_ID;
	mine_05 <- C_NONE_ID;
	mine_06 <- C_NONE_ID;
	mine_07 <- C_NONE_ID;
	mine_08 <- C_NONE_ID;
	mine_room_door_01 <- C_NONE_ID;
	mine_room_door_02 <- C_NONE_ID;
	mine_09 <- C_NONE_ID;

// ユニークIDの関係で以下の順に地雷を設置する(Redmine#2395)
// 1.時空の裂け目の地雷
	mine_wormhole_01 = SetPointCircleEventMine_("mine_wormhole_01", true);
	mine_wormhole_02 = SetPointCircleEventMine_("mine_wormhole_02", true);
	mine_wormhole_03 = SetPointCircleEventMine_("mine_wormhole_03", true);

// 2.石碑を調べた時の地雷
	// ■ラナルータ
	if(GetEventFlg_("BFG_EXAMINE_RANARUTA_STELE") == false){
		mine_02 = SetPointCircleEventMine_("mine_02", true);
	}
	// ■ラナリオン
	if(GetEventFlg_("BFG_EXAMINE_RANARION_STELE") == false){
		mine_03 = SetPointCircleEventMine_("mine_03", true);
	}
	// ■イメージチェンジ
	if(GetEventFlg_("BFG_EXAMINE_MAKE_UP_STELE") == false){
		mine_06 = SetPointCircleEventMine_("mine_06", true);
	}
	// ■ルーラポイント
	//mine_RulerPoint = SetPointCircleEventMine_("mine_RulerPoint", true);

// 3.石碑に近づいた時にリアクターが反応する地雷
	// ■ラナルータの石碑にリアクターが反応したかどうか
	if(GetEventFlg_("BFG_NEAR_RANARUTA_STELE") == false){
		mine_04 = SetPointCircleEventMine_("mine_04", false);
	}
	// ■ラナリオンの石碑にリアクターが反応したかどうか
	if(GetEventFlg_("BFG_NEAR_RANARION_STELE") == false){
		mine_05 = SetPointCircleEventMine_("mine_05", false);
	}
	// ■イメージチェンジの石碑にリアクターが反応したかどうか
	if(GetEventFlg_("BFG_NEAR_MAKE_UP_STELE") == false){
		mine_07 = SetPointCircleEventMine_("mine_07", false);
	}

// 4.デモ再生用の地雷
	// ■Demo802[ルキヤとアロマ]の再生地雷
	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){
		if(outside_num == GetFlagID_("CONST_SS_OS_GO_POINT_ZERO")){
			mine_00 = SetPointBoxEventMine_("mine_00", false);
		}
	}
	// ■Demo803[秘策はスターシード]の再生地雷
	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){
		if(outside_num == GetFlagID_("CONST_SS_OS_GO_POINT_ZERO_LAB_1")){
			mine_01 = SetPointBoxEventMine_("mine_01", false);
		}
	}
	// ■Demo809[封印の解放]の再生地雷
	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){
		if(outside_num == GetFlagID_("CONST_SS_OS_GO_POINT_ZERO_LAB_2")){
			mine_08 = SetPointBoxEventMine_("mine_01", false);
		}
	}

// 5.自動ドア再生用の地雷
	// ■自動ドア１
	if(GetEventFlg_("BFG_CHECK_ROOM_DOOR_1") == false){
		if(main_num >= GetFlagID_("CONST_SM_INSIDE_CLEAR")){
			if(outside_num >= GetFlagID_("CONST_SS_OS_GO_POINT_ZERO")){
				mine_room_door_01 = SetPointCircleEventMine_("mine_room_door_01", true);
			}
		}
	}
	// ■自動ドア２
	if(GetEventFlg_("BFG_CHECK_ROOM_DOOR_2") == false){
		if(main_num >= GetFlagID_("CONST_SM_INSIDE_CLEAR")){
			if(outside_num >= GetFlagID_("CONST_SS_OS_GO_POINT_ZERO")){
				mine_room_door_02 = SetPointCircleEventMine_("mine_room_door_02", true);
			}
		}
	}
// 6.外に出られない地雷
	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){
		if(outside_num <= GetFlagID_("CONST_SS_OS_GO_POINT_ZERO_LAB_1")){
			mine_09 = SetPointBoxEventMine_("mine_09", false);
		}
	}

	//-------------------------
	// ▼ナビマップアイコン配置
	//-------------------------
	// ■石碑アイコン
	icon_stone_01 <- C_NONE_ID;
	icon_stone_02 <- C_NONE_ID;
	icon_stone_03 <- C_NONE_ID;
	
	if(GetEventFlg_("BFG_EXAMINE_RANARUTA_STELE") == false){
		icon_stone_01 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.STONE , "g_stele_01");
	}
	if(GetEventFlg_("BFG_EXAMINE_RANARION_STELE") == false){
		icon_stone_02 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.STONE , "g_stele_02");
	}
	if(GetEventFlg_("BFG_EXAMINE_MAKE_UP_STELE") == false){
		icon_stone_03 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.STONE , "g_stele_03");
	}

	EventEnd_();
}

//------------------------------------------------
//		イベントスタート
//------------------------------------------------
function EventStartOperate()
{
	// 進行フラグの状態を取得
	local main_num    = GetNumFlg_("NUM_SCENARIO_MAIN");
	local outside_num = GetNumFlg_("NUM_SCENARIO_SUB_INSIDE_CLEAR");

//---------------------------------------------------------------------------------------
// デモの再生
	// 
	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){
		if(outside_num == GetFlagID_("CONST_SS_OS_COLLECT_STAR_PIECE")){ // NUM010 = 10
			SetNumFlg_("NUM_SCENARIO_SUB_INSIDE_CLEAR", GetFlagID_("CONST_SS_OS_COLLECT_STAR_PIECE_2"));
			// 陸海空のアクセサリを１つでも持っているとき, Demo810[陸神の封印]/Demo811[海神の封印]/Demo812[空神の封印]のいずれかを再生する
			if(CommAccessoryCheck() == true){
				if(GetAccessoryNum_(YATIHOKO_ACCE_ID) >= 1){
					CommChangeMomentFadeOut(FADE_COLOR_BLACK);
					uPlayDemo_SealedGod(DEMO_YATIHOKO);
				}
				else{
					if(GetAccessoryNum_(WADATUMI_ACCE_ID) >= 1){
						CommChangeMomentFadeOut(FADE_COLOR_BLACK);
						uPlayDemo_SealedGod(DEMO_WADATUMI);
					}
					else{
						if(GetAccessoryNum_(HOAKARI_ACCE_ID) >= 1){
							CommChangeMomentFadeOut(FADE_COLOR_BLACK);
							uPlayDemo_SealedGod(DEMO_HOAKARI);
						}
					}
				}
			}
			// アクセサリを捨てたり、分解した場合(イレギュラー対処)
			else{
				// どのアクセサリを捨てたり分解したりしたかをチェック
				local lost_accessory_num = GetNumFlg_("NUM_RELEASE_AND_DECOMPOSE_ACCESSORY");
				if(lost_accessory_num == 1){
					CommChangeMomentFadeOut(FADE_COLOR_BLACK);
					uPlayDemo_SealedGod(DEMO_YATIHOKO);
				}
				else if(lost_accessory_num == 2){
					CommChangeMomentFadeOut(FADE_COLOR_BLACK);
					uPlayDemo_SealedGod(DEMO_WADATUMI);
				}
				else if(lost_accessory_num == 3){
					CommChangeMomentFadeOut(FADE_COLOR_BLACK);
					uPlayDemo_SealedGod(DEMO_HOAKARI);
				}
				else{
					// 何も再生しない
					DebugPrint(" ");
					DebugPrint("進行異常です。[Demo809]イベントスクリプト班に連絡をお願いします");
					DebugPrint(" ");
				}
			}
		}
		else if(outside_num == GetFlagID_("CONST_SS_OS_COLLECT_STAR_PIECE_2")){ // NUM010 = 11
			// スターピースを組み込みフラグを立てる(注:ここでやらないとデモのエフェクトに矛盾が生じるので)
			local demo_num = GetNumFlg_("NUM_CHECK_STAR_PIECE_DEMO_TYPE");
			if(demo_num == 0){
				// 何もしない
			}
			// 再生されたデモフラグをチェック
			else{
				// Demo819[陸のスターピース組み込み]が再生された -> 1
				if(demo_num == 1){
					SetEventFlg_("BFG_STAR_PIECE_EFFECT_ON_GREEN", true);
					SetNumFlg_("NUM_CHECK_STAR_PIECE_DEMO_TYPE", 0); // 元に戻しておく
				}
				// Demo820[海のスターピース組み込み]が再生された -> 2
				else if(demo_num == 2){
					SetEventFlg_("BFG_STAR_PIECE_EFFECT_ON_BLUE", true);
					SetNumFlg_("NUM_CHECK_STAR_PIECE_DEMO_TYPE", 0); // 元に戻しておく
				}
				// Demo821[空のスターピース組み込み]が再生された -> 3
				else if(demo_num == 3){
					SetEventFlg_("BFG_STAR_PIECE_EFFECT_ON_RED", true);
					SetNumFlg_("NUM_CHECK_STAR_PIECE_DEMO_TYPE", 0); // 元に戻しておく
				}
				// 例外
				else{
					SetNumFlg_("NUM_CHECK_STAR_PIECE_DEMO_TYPE", 0); // 元に戻しておく
				}
			}

			// スターピースのエフェクト
			if(GetEventFlg_("BFG_STAR_PIECE_EFFECT_ON_GREEN") == true){
				// 陸のスターピース[軌道 : 緑]
				LoadEffect_("ef732_22_star_seed_m_g");
				local ef_green = SetPointWorldEffect_("ef732_22_star_seed_m_g", "ef_seed");
			}
			if(GetEventFlg_("BFG_STAR_PIECE_EFFECT_ON_BLUE") == true){
				// 海のスターピース[軌道 : 青]
				LoadEffect_("ef732_23_star_seed_m_b");
				local ef_blue = SetPointWorldEffect_("ef732_23_star_seed_m_b", "ef_seed");
			}
			if(GetEventFlg_("BFG_STAR_PIECE_EFFECT_ON_RED") == true){
				// 空のスターピース[軌道 : 赤]
				LoadEffect_("ef732_24_star_seed_m_r");
				local ef_red = SetPointWorldEffect_("ef732_24_star_seed_m_r", "ef_seed");
			}

			// 陸海空のスターピースの組み込みデモ(Demo819～821)の後に連続してデモを流すため用のフラグが立てられているかチェック
			if(GetEventFlg_("BFG_CONTINUED_STAR_PIECE_DEMO") == true){
				// スターピースを何個組み込んだかチェック
				local num = uCountBuiltInStarPiece();

				DebugPrint(" ");
				DebugPrint("スターピースを " + num + " 個組み込んでいます");
				DebugPrint(" ");

				if(num == 3){
					// シナリオの進行
					SetNumFlg_("NUM_SCENARIO_SUB_INSIDE_CLEAR", GetFlagID_("CONST_SS_OS_GO_TO_CORE")); // NUM010 = 12
					// デモの連続再生フラグを降ろす
					SetEventFlg_("BFG_CONTINUED_STAR_PIECE_DEMO", false);
					// 復帰位置
					SetReturnDemoPosDir_(Vec3(1.300, 0.000, 22.002), 180);
					EventStartChangeDemo(824, FADE_COLOR_BLACK);
				}
				else{
					if(num == 1){
						// デモの連続再生フラグを降ろす
						SetEventFlg_("BFG_CONTINUED_STAR_PIECE_DEMO", false);
						// 擬似デモ[スターピースは残り２個]
						uStarPieceDemo1();
					}
					else if(num == 2){
						// デモの連続再生フラグを降ろす
						SetEventFlg_("BFG_CONTINUED_STAR_PIECE_DEMO", false);
						// 擬似デモ[スターピースは残り１個]
						uStarPieceDemo2();
					}
					else{
						// 例外()
					}
				}
			}
		}
	}

//------------------------------
// 擬似デモ再生
	if(GetEventFlg_("BFG_RIDE_OFF_FLAG_BEFORE_STELE") == true){
		// 再生する擬似デモをチェック
		local g_check_skill_stele = GetNumFlg_("NUM_CHECK_KIND_BEFORE_STELE");
		switch(g_check_skill_stele)
		{
		// ラナルータ
		case 1:
			CommChangeMomentFadeOut(FADE_COLOR_BLACK);
			SetEventFlg_("BFG_RIDE_OFF_FLAG_BEFORE_STELE", false);
			uPlayableDemoRanarutaStele();
			SetNumFlg_("NUM_CHECK_KIND_BEFORE_STELE", 0);
			break;
		// ラナリオン
		case 2:
			CommChangeMomentFadeOut(FADE_COLOR_BLACK);
			SetEventFlg_("BFG_RIDE_OFF_FLAG_BEFORE_STELE", false);
			uPlayableDemoRanarionStele();
			SetNumFlg_("NUM_CHECK_KIND_BEFORE_STELE", 0);
			break;
		// イメージチェンジ
		case 3:
			CommChangeMomentFadeOut(FADE_COLOR_BLACK);
			SetEventFlg_("BFG_RIDE_OFF_FLAG_BEFORE_STELE", false);
			uPlayableDemoColorChangeStele();
			SetNumFlg_("NUM_CHECK_KIND_BEFORE_STELE", 0);
			break;
		// それ以外
		default:
			DebugPrint("再生する擬似デモが値がありません [U00_00 EventStartOperate()]");
			SetNumFlg_("NUM_CHECK_KIND_BEFORE_STELE", 0);
			break;
		}
	}

	EventEnd_();
}

//------------------------------------------------
//		ＮＰＣ会話直前
//------------------------------------------------
function BeforeTalkNpc()
{
	// 進行フラグの状態を取得
	local main_num    = GetNumFlg_("NUM_SCENARIO_MAIN");
	local outside_num = GetNumFlg_("NUM_SCENARIO_SUB_INSIDE_CLEAR");
	
	// 話しかけられているNPCのIDを取得
	local target = GetTargetId_();
	
	// ■アロマ
	if(target == npc_Aroma){
		// １つでもスターピースをもっている場合
		if(CommStarPieceCheck() == true){
			// ２つ目以降のスターピースを見せるとき
			if(GetEventFlg_("BFG_GET_STER_PIECE_TALK_AROMA") == true){		// Bit1387
				SetTalkCameraType_(target, TALK_CAMERA_DEF);
				SetTalkTurn_(target, false);
			}
		}
		else{
			SetTalkCameraType_(target, TALK_CAMERA_UP);
		}
	}
	
	// ■ルキヤ
	if(target == npc_Rukiya){
		SetRideTalkCamOffset(OFFSET_RUKIYA);
	}
	
	
	EventEnd_();
}


//------------------------------------------------
//		ＮＰＣ接触時
//------------------------------------------------
function TouchNpc()
{
	// 話しかける対象のNPCを条件に
	local target    = GetTargetId_();
	switch(target)
	{
	case npc_Rukiya:
		uTalkRukiya();
		break;
	case npc_Aroma:
		uTalkAroma();
		break;
	default:
		DebugPrint("設置していないNPCに話しかけています。");
		break;
	}

	EventEnd_();
}

//------------------------------------------------
//		地雷接触時
//------------------------------------------------
function TouchEventMine()
{
	local player = GetPlayerId_();
	local target = GetTouchEventMineId_();

	switch(target)
	{
	// 陸神
	case mine_wormhole_01:
		// 地雷を削除
		DeleteEventMine_(mine_wormhole_01);
		mine_wormhole_01 <- C_NONE_ID;
		OpenMsgWnd_();
		ShowMsg_("SYSTEM_MSG_001");
		KeyInputWait_();
		if(GetQueryResult_() == QUERY_YES){
			CloseMsgWnd_();
			// ルーラとフライトシグナルの禁止
			SetEventFlg_("BFG_PLAYERABILITY_RULER_PROHIBIT", true);
			SetEventFlg_("BFG_FLIGHT_PROHIBIT", true);
			// 時空の裂け目の共通処理
			CommDisplayedWormholeEffect();
			// 指定したマップに移動
			ChangeMapPosDir_("O00_10", Vec3(0.000, 0.000, -300.000), 0);
		}
		else{
			CloseMsgWnd_();
			// 地雷を再設置
			mine_wormhole_01 = SetPointCircleEventMine_("mine_wormhole_01", true);
		}

		break;
	// 海神
	case mine_wormhole_02:
		// 地雷を削除
		DeleteEventMine_(mine_wormhole_02);
		mine_wormhole_02 <- C_NONE_ID;
		OpenMsgWnd_();
		ShowMsg_("SYSTEM_MSG_001");
		KeyInputWait_();
		if(GetQueryResult_() == QUERY_YES){
			CloseMsgWnd_();
			// ルーラとフライトシグナルの禁止
			SetEventFlg_("BFG_PLAYERABILITY_RULER_PROHIBIT", true);
			SetEventFlg_("BFG_FLIGHT_PROHIBIT", true);
			// 時空の裂け目の共通処理
			CommDisplayedWormholeEffect();
			// 指定したマップに移動
			ChangeMapPosDir_("O00_11", Vec3(0.000, 0.000, -300.000), 0);
		}
		else{
			CloseMsgWnd_();
			// 地雷を再設置
			mine_wormhole_02 = SetPointCircleEventMine_("mine_wormhole_02", true);
		}

		break;
	// 空神
	case mine_wormhole_03:
		// 地雷を削除
		DeleteEventMine_(mine_wormhole_03);
		mine_wormhole_03 <- C_NONE_ID;
		OpenMsgWnd_();
		ShowMsg_("SYSTEM_MSG_001");
		KeyInputWait_();
		if(GetQueryResult_() == QUERY_YES){
			CloseMsgWnd_();
			// ルーラとフライトシグナルの禁止
			SetEventFlg_("BFG_PLAYERABILITY_RULER_PROHIBIT", true);
			SetEventFlg_("BFG_FLIGHT_PROHIBIT", true);
			// 時空の裂け目の共通処理
			CommDisplayedWormholeEffect();
			// 指定したマップに移動
			ChangeMapPosDir_("O00_12", Vec3(0.000, 0.000, -300.000), 0);
		}
		else{
			CloseMsgWnd_();
			// 地雷を再設置
			mine_wormhole_03 = SetPointCircleEventMine_("mine_wormhole_03", true);
		}

		break;
	// ラナルータ(ライド解除後擬似デモ再生 2次DB #3442)
	case mine_02:
		CommPlayerTurnAroundObj(g_ranaruta_stele);
		SetEventFlg_("BFG_RIDE_OFF_FLAG_BEFORE_STELE", true);
		SetNumFlg_("NUM_CHECK_KIND_BEFORE_STELE", 1); // ラナルータ用に設定
		ChangeMapPosDir_("U00_00", Vec3(-2378.438, 278.264, -1488.885), -117);
		break;
	// ラナリオン
	case mine_03:
		CommPlayerTurnAroundObj(g_ranarion_stele);
		SetEventFlg_("BFG_RIDE_OFF_FLAG_BEFORE_STELE", true);
		SetNumFlg_("NUM_CHECK_KIND_BEFORE_STELE", 2); // ラナリオン用に設定
		ChangeMapPosDir_("U00_00", Vec3(2072.970, 109.526, -2109.259), 148);
		break;
	// イメージチェンジ
	case mine_06:
		CommPlayerTurnAroundObj(g_makeup_stele);
		SetEventFlg_("BFG_RIDE_OFF_FLAG_BEFORE_STELE", true);
		SetNumFlg_("NUM_CHECK_KIND_BEFORE_STELE", 3); // イメージチェンジ用に設定
		ChangeMapPosDir_("U00_00", Vec3(-47.072, 43.835, -2608.173), -120);
		break;
	// ラナルータの石碑に近づいた時
	case mine_04:
		DeleteEventMine_(mine_04);
		mine_04 <- C_NONE_ID; // 消したタイミングで初期化
		SetEventFlg_("BFG_NEAR_RANARUTA_STELE", true);
		uReactorDemo(g_ranaruta_stele);
		break;
	// ラナリオンの石碑に近づいた時
	case mine_05:
		DeleteEventMine_(mine_05);
		mine_05 <- C_NONE_ID; // 消したタイミングで初期化
		SetEventFlg_("BFG_NEAR_RANARION_STELE", true);
		uReactorDemo(g_ranarion_stele);
		break;
	// イメージチェンジの石碑に近づいた時
	case mine_07:
		DeleteEventMine_(mine_07);
		mine_07 <- C_NONE_ID; // 消したタイミングで初期化
		SetEventFlg_("BFG_NEAR_MAKE_UP_STELE", true);
		uReactorDemo(g_makeup_stele);
		break;
	// Demo802[ルキヤとアロマ]の再生地雷
	case mine_00:
		DeleteEventMine_(mine_00);
		mine_00 <- C_NONE_ID; // 消したタイミングで初期化
		// シナリオ進行フラグを進める
		SetNumFlg_("NUM_SCENARIO_SUB_INSIDE_CLEAR", GetFlagID_("CONST_SS_OS_GO_POINT_ZERO_LAB_1"));
		// ディスクの最大容量の増加フラグ(その１)
		SetEventFlg_("BFG_AROMA_WAKEUP", true);
		// デモ後の復帰位置と向きの設定
		local player_pos = Vec3(-37.646, 0.000, 296.434);
		local player_dir = 168;
		SetReturnDemoPosDir_(player_pos, player_dir);
		// Demo802[ルキヤとアロマ]再生
		ChangeDemo_(802);
		break;
	// Demo803[秘策はスターシード]の再生地雷
	case mine_01:
		DeleteEventMine_(mine_01);
		mine_01 <- C_NONE_ID; // 消したタイミングで初期化
		// シナリオ進行フラグを進める
		SetNumFlg_("NUM_SCENARIO_SUB_INSIDE_CLEAR", GetFlagID_("CONST_SS_OS_GO_CENTER_BILL_1F"));
		// デモ後の復帰位置と向きの設定
		local player_pos = Vec3(-7.000, 0.000, 0.000);
		local player_dir = 58;
		SetReturnDemoPosDir_(player_pos, player_dir);
		// Demo803[秘策はスターシード]の再生
		ChangeDemo_(803);
		break;
	// Demo809[封印の解放]の再生地雷
	case mine_08:
		DeleteEventMine_(mine_08);
		mine_08 <- C_NONE_ID; // 消したタイミングで初期化
		// シナリオ進行フラグを進める
		SetNumFlg_("NUM_SCENARIO_SUB_INSIDE_CLEAR", GetFlagID_("CONST_SS_OS_COLLECT_STAR_PIECE"));
		// デモ後の復帰位置と向きの設定
		local player_pos = Vec3(-7.000, 0.000, 0.000);
		local player_dir = 58;
		SetReturnDemoPosDir_(player_pos, player_dir);
		// Demo809[封印の解放]の再生
		ChangeDemo_(809);
		break;
	// 自動ドア１
	case mine_room_door_01:
		DeleteEventMine_(mine_room_door_01);
		mine_room_door_01 <- C_NONE_ID; // 消したタイミングで初期化
		CommPlayerTurnAroundDir(180);
		SetMotion_(g_room_door_01, MOT_GIMMICK_1, BLEND_N);
		Wait_(35);
		PlaySE_("SE_FLD_005"); // すぐに鳴らさないようにする
		Wait_(52);
		SetActive_(g_room_door_01, false);
		SetEventFlg_("BFG_CHECK_ROOM_DOOR_1", true);
		Wait_(5);
		break;
	// 自動ドア２
	case mine_room_door_02:
		DeleteEventMine_(mine_room_door_02);
		mine_room_door_02 <- C_NONE_ID; // 消したタイミングで初期化
		CommPlayerTurnAroundDir(180);
		SetMotion_(g_room_door_02, MOT_GIMMICK_1, BLEND_N);
		Wait_(35);
		PlaySE_("SE_FLD_005"); // すぐに鳴らさないようにする
		Wait_(52);
		SetActive_(g_room_door_02, false);
		SetEventFlg_("BFG_CHECK_ROOM_DOOR_2", true);
		Wait_(5);
		break;
	// 進行不可地雷
	case mine_09:
		local outside_num = GetNumFlg_("NUM_SCENARIO_SUB_INSIDE_CLEAR");
		if(outside_num <= GetFlagID_("CONST_SS_OS_GO_WOOD_PARK")){
			// ルキヤからの通信とメッセージ
			OpenConnective("connective_rukiya");
			Wait_(5);
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_RUKIYA");
			ShowMsg_("GO_OUT_ROOM_MSG_CONECTIVE");
			KeyInputWait_();
			CloseMsgWnd_();
			Wait_(5);
			CloseConnective();
		}
		else if(outside_num == GetFlagID_("CONST_SS_OS_GO_POINT_ZERO")){
			// ルキヤ
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_RUKIYA");
			ShowMsg_("GO_OUT_ROOM_MSG");
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else{
			// アロマ
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_AROMA");
			ShowMsg_("GO_OUT_ROOM_MSG_AROMA");
			KeyInputWait_();
			CloseMsgWnd_();
		}
		Wait_(5);
		CommPlayerTurnMoveDirWalk(180);
		break;
	// 設置していない地雷に接触
	default:
		DebugPrint("設置していない地雷に触れています。");
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


//=========================================================================================================
//									▼▼▼ここから下はローカル関数▼▼▼
//=========================================================================================================

//++++++++++++++++++++++++++++++++++++++++++++++++
//		スターピース組み込み数をチェック
//------------------------------------------------
//	引数	: なし
//	戻り値	: 組み込んだスターピースの数
//++++++++++++++++++++++++++++++++++++++++++++++++
function uCountBuiltInStarPiece()
{
	local star_num = 0;
	
	// 陸のスターピースが組みまれていた場合
	if(GetEventFlg_("BFG_STAR_PIECE_EFFECT_ON_GREEN") == true){
		star_num = star_num + 1;
	}
	// 海のスターピースが組みまれていた場合
	if(GetEventFlg_("BFG_STAR_PIECE_EFFECT_ON_BLUE") == true){
		star_num = star_num + 1;
	}
	// 空のスターピースが組みまれていた場合
	if(GetEventFlg_("BFG_STAR_PIECE_EFFECT_ON_RED") == true){
		star_num = star_num + 1;
	}
	return star_num;
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		Demo[●神の封印]がいくつ再生されたか
//------------------------------------------------
//	引数	: なし
//	戻り値	: 再生された数
//++++++++++++++++++++++++++++++++++++++++++++++++
function uCountUnlockDemo()
{
	local played_num = 0;
	
	// Demo810[陸神の封印]の再生されていた場合
	if(GetEventFlg_("BFG_PLAYED_YATIHOKO_SEALED_DEMO") == true){
		played_num = played_num + 1;
	}
	// Demo811[海神の封印]の再生されていた場合
	if(GetEventFlg_("BFG_PLAYED_WADATUMI_SEALED_DEMO") == true){
		played_num = played_num + 1;
	}
	// Demo812[空神の封印]の再生されていた場合
	if(GetEventFlg_("BFG_PLAYED_HOAKARI_SEALED_DEMO") == true){
		played_num = played_num + 1;
	}
	return played_num;
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		ルキヤの会話内容
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkRukiya()
{
	// 進行フラグの状態を取得
	local main_num    = GetNumFlg_("NUM_SCENARIO_MAIN");
	local outside_num = GetNumFlg_("NUM_SCENARIO_SUB_INSIDE_CLEAR");

	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){ // NUM000 = 9
		if(outside_num == GetFlagID_("CONST_SS_OS_GO_POINT_ZERO")){ // NUM010 = 2
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_RUKIYA");
			ShowMsg_("RUKIYA_MSG_001");
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		アロマの会話内容
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkAroma()
{
	// 進行フラグの状態を取得
	local main_num    = GetNumFlg_("NUM_SCENARIO_MAIN");
	local outside_num = GetNumFlg_("NUM_SCENARIO_SUB_INSIDE_CLEAR");

	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){ // NUM000 = 9
		if(outside_num == GetFlagID_("CONST_SS_OS_GO_POINT_ZERO_LAB_1")){ // NUM010 = 3
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_AROMA");
			ShowMsg_("AROMA_MSG_001");
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if(outside_num == GetFlagID_("CONST_SS_OS_GO_CENTER_BILL_1F")){ // NUM010 = 4
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_AROMA");
			ShowMsg_("AROMA_MSG_002");
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if(outside_num == GetFlagID_("CONST_SS_OS_COLLECT_STAR_PIECE")){ // NUM010 = 10
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_AROMA");
			ShowMsg_("MSG_000");
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if(outside_num == GetFlagID_("CONST_SS_OS_COLLECT_STAR_PIECE_2")){ // NUM010 = 11
			// スターピースをもっている
			if(CommStarPieceCheck() == true){
				// 各スターピースの所持数をチェック
				local land_num = GetItemNum_(LAND_STAR_PIECE_ID); // 陸
				local sea_num  = GetItemNum_(SEA_STAR_PIECE_ID);  // 海
				local sky_num  = GetItemNum_(SKY_STAR_PIECE_ID);  // 空
				
				// 初めて話しかけるとき
				if(GetEventFlg_("BFG_GET_STER_PIECE_TALK_AROMA") == false){		// Bit1387
					SetEventFlg_("BFG_GET_STER_PIECE_TALK_AROMA", true);
					
					OpenMsgWnd_();
					SetTalkName_("NAME_TAG_AROMA");
					ShowMsg_("AROMA_MSG_007");
					KeyInputWait_();
					CloseMsgWnd_();
				}
				
				if(land_num >= 1){
					// スターピースを減らす
					AddItem_(LAND_STAR_PIECE_ID, -1);
					// スターピースの組み込みデモの後に連続してデモを流すため用のフラグ
					SetEventFlg_("BFG_CONTINUED_STAR_PIECE_DEMO", true);
					// スターピースの組み込みデモの種類を設定
					SetNumFlg_("NUM_CHECK_STAR_PIECE_DEMO_TYPE", 1);
					// Demo819[陸のスターピース組み込み]を再生
					TouchNpcChangeDemo(819);
				}
				else{
					if(sea_num >= 1){
						// スターピースを減らす
						AddItem_(SEA_STAR_PIECE_ID, -1);
						// スターピースの組み込みデモの後に連続してデモを流すため用のフラグ
						SetEventFlg_("BFG_CONTINUED_STAR_PIECE_DEMO", true);
						// スターピースの組み込みデモの種類を設定
						SetNumFlg_("NUM_CHECK_STAR_PIECE_DEMO_TYPE", 2);
						// Demo820[海のスターピース組み込み]を再生
						TouchNpcChangeDemo(820);
					}
					else{
						if(sky_num >= 1){
							// スターピースを減らす
							AddItem_(SKY_STAR_PIECE_ID, -1);
							// スターピースの組み込みデモの後に連続してデモを流すため用のフラグ
							SetEventFlg_("BFG_CONTINUED_STAR_PIECE_DEMO", true);
							// スターピースの組み込みデモの種類を設定
							SetNumFlg_("NUM_CHECK_STAR_PIECE_DEMO_TYPE", 3);
							// Demo821[空のスターピース組み込み]を再生
							TouchNpcChangeDemo(821);
						}
						else{
							// フロー的にありえないので特に何もしない
						}
					}
				}
			}
			// スターピースをもっていない
			else{
				local demo_id = uCheckDemo_SealedGod();
				
				// Demo[○神の封印] を再生しない場合
				if (demo_id == DEMO_NONE) {
					uCheckNoRingMsg();
				}
				// Demo[○神の封印] を再生する場合
				else {
					uChangeAromaMsg();
					uFadeOutDefault();
					uPlayDemo_SealedGod(demo_id);
				}
			}
		}
		else if(outside_num == GetFlagID_("CONST_SS_OS_GO_TO_CORE")){ // NUM010 = 12
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_AROMA");
			ShowMsg_("AROMA_MSG_010");
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		擬似デモ(リアクター反応)
//------------------------------------------------
//	引数	: 石碑ID
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uReactorDemo(stele_id)
{
	local task_player;
	local efc_player;
	local player = GetPlayerId_();
	local g_stele_pos = GetPos_(stele_id);

	CommReactorActionDiscover();		// リアクター反応があった時の共通処理
	
	// 特技石碑に近づいた時のメッセージ表示
	if(stele_id == g_ranaruta_stele){ CommApproachStatueMsg(ABILITY_RANARUTA); }// ラナルータ
	if(stele_id == g_ranarion_stele){ CommApproachStatueMsg(ABILITY_RANARION); }// ラナリオン
	if(stele_id == g_makeup_stele)  { CommApproachStatueMsg(ABILITY_MAKE_UP);  }// イメージチェンジ
	
	CommResetPlayerMotion();		// モーションを待機状態に戻す共通処理
	
	// 石碑の方を向く
	if(!IsPlayerRide_()){
		SetMotion_(player, MOT_WALK, BLEND_XL);
	}
	local rotateTask = Task_RotateToPos_(player, g_stele_pos, ROTATE_EVENT_DEF);
	WaitTask(rotateTask);
	// 間を持たせる
	Wait_(15);
	SetMotion_(player, MOT_WAIT, BLEND_XL);
	Wait_(5);
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		擬似デモ[スターピースは残り２個]
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uStarPieceDemo1()
{
// 暗転
	CommChangeMomentFadeOut(FADE_COLOR_BLACK);
// 準備
	// 主人公の位置
	local player_pos = Vec3(0.00, 0.00, 5.67);
	local player_dir = 90;
	// 擬似デモ後の復帰位置
	local player_rtn_pos = Vec3(-3.13, 0.00, 24.50);
	local player_rtn_dir = 180;
	// ウェイト
	local wait_speed     = 15;
	local wait_speed_def = 30;
	// プレイヤーID
	local player = GetPlayerId_();
	// カメラの角度
	local cam_dir = 145;
	local cam_rtn_dir = 180;
	// 非常駐モーション読込(主人公うなずき)
	local nod = ReadMotion_(player, "Player_nod");
	// 定義した数値をセット
	Wait_(wait_speed);
	SetPos_(player, player_pos);
	SetDir_(player, player_dir);
	SetCameraDir_(cam_dir);
	SetDirToPlayer_(npc_Aroma);
	// アロマ(待機モーション→会話モーション)
	SetMotion_(npc_Aroma, "TALKLOOP", BLEND_N);
// 暗転明け
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	Wait_(FADE_DEF);
	// メッセージ表示
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("AROMA_MSG_008");
	KeyInputWait_();
	CloseMsgWnd_();
	// アロマ(会話モーション→待機モーション)
	SetMotion_(npc_Aroma, "WAIT", BLEND_L);
	Wait_(wait_speed);
	// 主人公がうなずく
	SetMotion_(player, nod, BLEND_M);
	Wait_(wait_speed_def);
// 暗転
	uWaitNpcFade();
	SetPos_(player, player_rtn_pos);
	SetDir_(player, player_rtn_dir);
	// カメラを再設定
	SetCameraDir_(cam_rtn_dir);
// 暗転明け
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	Wait_(FADE_DEF);
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		擬似デモ[スターピースは残り１個]
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uStarPieceDemo2()
{
// 暗転
	CommChangeMomentFadeOut(FADE_COLOR_BLACK);
// 準備
	// 主人公の位置
	local player_pos = Vec3(0.00, 0.00, 5.67);
	local player_dir = 90;
	// 擬似デモ後の復帰位置
	local player_rtn_pos = Vec3(-3.13, 0.00, 24.50);
	local player_rtn_dir = 180;
	// ウェイト
	local wait_speed     = 15;
	local wait_speed_def = 30;
	// プレイヤーID
	local player = GetPlayerId_();
	// カメラの角度
	local cam_dir = 145;
	local cam_rtn_dir = 180;
	// 非常駐モーション読込(主人公うなずき)
	local nod = ReadMotion_(player, "Player_nod");
	// 定義した数値をセット
	Wait_(wait_speed);
	SetPos_(player, player_pos);
	SetDir_(player, player_dir);
	SetCameraDir_(cam_dir);
	SetDirToPlayer_(npc_Aroma);
	// アロマ(待機モーション→会話モーション)
	SetMotion_(npc_Aroma, "TALKLOOP", BLEND_N);
// 暗転明け
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	Wait_(FADE_DEF);
	// メッセージ表示
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("AROMA_MSG_009");
	KeyInputWait_();
	CloseMsgWnd_();
	// アロマ(会話モーション→待機モーション)
	SetMotion_(npc_Aroma, "WAIT", BLEND_L);
	Wait_(wait_speed);
	// 主人公がうなずく
	SetMotion_(player, nod, BLEND_M);
	Wait_(wait_speed_def);
// 暗転
	uWaitNpcFade();
	SetPos_(player, player_rtn_pos);
	SetDir_(player, player_rtn_dir);
	// カメラを再設定
	SetCameraDir_(cam_rtn_dir);
// 暗転明け
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	Wait_(FADE_DEF);
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		フェードアウト処理(15F)
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uWaitNpcFade()
{
	// 話しかけたらすぐにフェードが始まるようにする
	local fade_spd = 15;
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, fade_spd);
	SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, fade_spd);
	WaitFade_();
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		フェードアウト処理(30F)
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uFadeOutDefault()
{
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		Demo[○神の封印]再生判定処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: どのデモを再生するか
//++++++++++++++++++++++++++++++++++++++++++++++++
function uCheckDemo_SealedGod()
{
	local ring_y_num = GetAccessoryNum_(YATIHOKO_ACCE_ID);		// ID_216 ヤチホコのゆびわ
	local ring_w_num = GetAccessoryNum_(WADATUMI_ACCE_ID);		// ID_218 ワダツミのゆびわ
	local ring_h_num = GetAccessoryNum_(HOAKARI_ACCE_ID);		// ID_217 ホアカリのゆびわ

	// 優先順位（ ヤチホコ > ワダツミ > ホアカリ ）
	if(GetNumFlg_("NUM_YATIHOKO_PHASE") == 0 && ring_y_num >= 1){	return DEMO_YATIHOKO;	}
	if(GetNumFlg_("NUM_WADATUMI_PHASE") == 0 && ring_w_num >= 1){	return DEMO_WADATUMI;	}
	if(GetNumFlg_("NUM_HOAKARI_PHASE") == 0 && ring_h_num >= 1){	return DEMO_HOAKARI;	}
	
	return DEMO_NONE;
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		Demo[○神の封印]再生処理
//------------------------------------------------
//	引数	: id	どのデモを再生するか
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uPlayDemo_SealedGod(id)
{
	switch(id){
	// 「ヤチホコ」
	case DEMO_YATIHOKO :
		SetNumFlg_("NUM_YATIHOKO_PHASE", 1);
		SetEventFlg_("BFG_PLAYED_YATIHOKO_SEALED_DEMO", true);
		SetReturnDemoPosDir_(Vec3(-98.440, 0.000, -199.085), -135);
		
		// Demo810[陸神の封印]を再生
		ChangeDemo_(810);
		break;
		
	// 「ワダツミ」
	case DEMO_WADATUMI :
		SetNumFlg_("NUM_WADATUMI_PHASE", 1);
		SetEventFlg_("BFG_PLAYED_WADATUMI_SEALED_DEMO", true);
		SetReturnDemoPosDir_(Vec3(99.505, 0.000, -196.311), 135);
		
		// Demo811[海神の封印]を再生
		ChangeDemo_(811);
		break;
		
	// 「ホアカリ」
	case DEMO_HOAKARI :
		SetNumFlg_("NUM_HOAKARI_PHASE", 1);
		SetEventFlg_("BFG_PLAYED_HOAKARI_SEALED_DEMO", true);
		SetReturnDemoPosDir_(Vec3(0.000, 0.000, -235.000), 180);
		
		// Demo812[空神の封印]を再生
		ChangeDemo_(812);
		break;
		
	default :
		DebugPrint("WARNING : 想定していないid(" + id + ")です [uPlayDemo_SealedGod]");
		break;
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//	Demo[○神の封印]を再生する場合のセリフ
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uChangeAromaMsg()
{
	// 封印を解いた数(●神の封印のデモを見た数)でメッセージが変化
	local unlock_num = uCountUnlockDemo();
	switch(unlock_num)
	{
	case 1:
		// 一度しか表示しない
		if(GetEventFlg_("BFG_DISPLAY_U00_00_ACCESSORY_MSG_1") == false){
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_AROMA");
			ShowMsg_("AROMA_MSG_004");
			KeyInputWait_();
			CloseMsgWnd_();
			SetEventFlg_("BFG_DISPLAY_U00_00_ACCESSORY_MSG_1", true);
		}
		break;
	case 2:
		// 一度しか表示しない
		if(GetEventFlg_("BFG_DISPLAY_U00_00_ACCESSORY_MSG_2") == false){
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_AROMA");
			ShowMsg_("AROMA_MSG_006");
			KeyInputWait_();
			CloseMsgWnd_();
			SetEventFlg_("BFG_DISPLAY_U00_00_ACCESSORY_MSG_2", true);
		}
		break;
	}
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//	対応するゆびわを持っていない時のセリフ
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uCheckNoRingMsg()
{
	local msg_key;
	// 解除された封印が１つの時
	if(uCountUnlockDemo() == 1){
		local check_num = GetNumFlg_("NUM_RELEASE_AND_DECOMPOSE_ACCESSORY"); // 最初に封印を解いたデモが何だったかをチェック
		// ヤチホコの封印を解いている場合
		if(check_num == 1){
			msg_key = "AROMA_MSG_003_A";
		}
		// ワダツミの封印を解いている場合
		else if(check_num == 2){
			msg_key = "AROMA_MSG_003_B";
		}
		// ホアカリの封印を解いている場合
		else if(check_num == 3){
			msg_key = "AROMA_MSG_003_C";
		}
		else{
			// 例外
		}
	}
	// 解除された封印が２つの時
	else if(uCountUnlockDemo() == 2){
		// ヤチホコの封印を解いてない場合
		if(GetEventFlg_("BFG_PLAYED_YATIHOKO_SEALED_DEMO") == false){
			msg_key = "AROMA_MSG_005_A";
		}
		else{
			// ワダツミの封印を解いてない場合
			if(GetEventFlg_("BFG_PLAYED_WADATUMI_SEALED_DEMO") == false){
				msg_key = "AROMA_MSG_005_B";
			}
			else{
				// ホアカリの封印を解いてない場合
				if(GetEventFlg_("BFG_PLAYED_HOAKARI_SEALED_DEMO") == false){
					msg_key = "AROMA_MSG_005_C";
				}
				else{
					// 例外
				}
			}
		}
	}
	// 解除された封印が３つ全ての場合
	else if(uCountUnlockDemo() == 3){
		msg_key = "AROMA_MSG_011";
	}
	else{
		// 例外
	}
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_(msg_key);
	KeyInputWait_();
	CloseMsgWnd_();
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		特技取得デモ( ラナルータ )
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uPlayableDemoRanarutaStele()
{
	// プレイヤーID
	local player = GetPlayerId_();
	
	DeleteEventMine_(mine_02);
	mine_02 <- C_NONE_ID; // 消したタイミングで初期化
	
	//主人公の位置を石碑の前に置く
	SetPos_(player, Vec3(-2378.438, 278.264, -1488.885));
	SetDir_(player, -117);
	//カメラを設置
	SetPointCameraEye_("cameye_002");
	SetPointCameraTarget_("camtgt_002");
	Wait_(10);
	
	//スキル取得共通処理
	SkillStelePerformance(g_ranaruta_stele, ABILITY_RANARUTA);
	
	SetEventFlg_("BFG_EXAMINE_RANARUTA_STELE", true);
	// 石碑アイコンを見えなくする
	SetNaviMapIconVisible_(icon_stone_01, false);
	// プレイヤー特技の解禁
	AddPlayerAbility_(PLAYERABILITYID.RANARUTA);
	
	//フェードイン
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		特技取得デモ( ラナリオン )
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uPlayableDemoRanarionStele()
{
	// プレイヤーID
	local player = GetPlayerId_();
	
	DeleteEventMine_(mine_03);
	mine_03 <- C_NONE_ID; // 消したタイミングで初期化
	
	//主人公の位置を石碑の前に置く
	SetPos_(player, Vec3(2072.970, 109.526, -2109.259));
	SetDir_(player, 148);
	//カメラを設置
	SetPointCameraEye_("cameye_003");
	SetPointCameraTarget_("camtgt_003");
	Wait_(10);
	
	//スキル取得共通処理
	SkillStelePerformance(g_ranarion_stele, ABILITY_RANARION);
	
	SetEventFlg_("BFG_EXAMINE_RANARION_STELE", true);
	// 石碑アイコンを見えなくする
	SetNaviMapIconVisible_(icon_stone_02, false);
	// プレイヤー特技の解禁
	AddPlayerAbility_(PLAYERABILITYID.RANARION);
	
	//フェードイン
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		特技取得デモ( イメージチェンジ )
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uPlayableDemoColorChangeStele()
{
	// プレイヤーID
	local player = GetPlayerId_();
	
	DeleteEventMine_(mine_06);
	mine_06 <- C_NONE_ID; // 消したタイミングで初期化
	
	//主人公の位置を石碑の前に置く
	SetPos_(player, Vec3(-34.566, 42.413, -2615.786));
	SetDir_(player, -135);
	//カメラを設置
	SetPointCameraEye_("cameye_001");
	SetPointCameraTarget_("camtgt_001");
	Wait_(10);
	
	//スキル取得共通処理
	SkillStelePerformance(g_makeup_stele, ABILITY_MAKE_UP);
	
	SetEventFlg_("BFG_EXAMINE_MAKE_UP_STELE", true);
	// 石碑アイコンを見えなくする
	SetNaviMapIconVisible_(icon_stone_03, false);
	// プレイヤー特技の解禁
	AddPlayerAbility_(PLAYERABILITYID.COLOR_CHANGE);
	
	//フェードイン
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
}

