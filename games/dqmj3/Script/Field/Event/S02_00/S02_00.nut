//===================== S02_00イッタブル監獄 1F ====================

// 変数定義
main_num	 <- C_NONE_ID;
prison_num	 <- C_NONE_ID;

str_num_sub <- "NUM_SCENARIO_SUB_PRISON";

//------------------------------------------------
//		戦闘終了後
//------------------------------------------------
function AfterBattle()
{
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");
	prison_num	 = GetNumFlg_("NUM_SCENARIO_SUB_PRISON");
	
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
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");
	prison_num	 = GetNumFlg_("NUM_SCENARIO_SUB_PRISON");
	
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
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");			// Num0
	prison_num	 = GetNumFlg_("NUM_SCENARIO_SUB_PRISON");	// Num6
	
	DebugPrint("NUM_SCENARIO_MAIN の値は " + main_num + " になりました。");
	DebugPrint("NUM_SCENARIO_SUB_PRISON の値は " + prison_num + " になりました。");
	
	// ■マップ到達フラグ
	SetEventFlg_("BFG_ARRIVE_AT_S02", true);				// Bit_95 到達フラグ イッタブル監獄

	// モンスターを出現させる最小距離を設定(※単位は1=10cm)
	SetMonsterGenPlayerInvasionAreaMin_(-1)	// 制限をデフォルト値に戻す
	
	//----------
	// ▼NPC配置
	//----------
	// ID初期化
	g_npc_prizoner_a	 <- C_NONE_ID;
	g_npc_prizoner_b	 <- C_NONE_ID;
	g_npc_prizoner_c	 <- C_NONE_ID;
	g_npc_prizoner_d	 <- C_NONE_ID;
	g_npc_jailer_a		 <- C_NONE_ID;
	g_npc_jailer_b		 <- C_NONE_ID;
	g_npc_jailer_c		 <- C_NONE_ID;
	g_npc_jailer_d		 <- C_NONE_ID;
	g_npc_rukiya		 <- C_NONE_ID;
	
	// リソース読み込み
	local id_togejobo	 = ReadNpc_("m127_02");		// とげジョボー
	local id_saboten	 = ReadNpc_("m064_00");		// サボテンボール
	local id_dessert	 = ReadNpc_("m132_01");		// デザートタンク
	local id_samayou	 = ReadNpc_("m111_00");		// さまようよろい
	local id_sli_knight	 = ReadNpc_("m008_00");		// スライムナイト
	local id_ookizuchi	 = ReadNpc_("m035_00");		// おおきづち
	local id_gaikotu	 = ReadNpc_("m101_00");		// がいこつ
	local id_rukiya		 = ReadNpc_("n009");		// ルキヤ
	
	// ■囚人Ａ
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_RUKIYA_NEWS")) {					// Num6 < 9
			g_npc_prizoner_a = ArrangePointNpc_(id_togejobo, "npc_prisoner_a000");
			SetScaleSilhouette(g_npc_prizoner_a, SCALE.SABOTENBOUL ,SILHOUETTE_WIDTH.SABOTENBOUL);
			SetReactorMsg_(g_npc_prizoner_a, "REC_NPC_PRIZONER");
			SetTalkTurn_(g_npc_prizoner_a, false);	// 話しかけても振り向かない
			local down = ReadMotion_(g_npc_prizoner_a, "m127_01_down_heavy_L");	//ぐったりL
			SetMotion_(g_npc_prizoner_a, down, BLEND_N);
		}
		else if (prison_num < GetFlagID_("CONST_SS_PR_DEVIL_REMODELING")) {			// Num6 < 11
			g_npc_prizoner_a = ArrangePointNpc_(id_togejobo, "npc_prisoner_a001");
			SetScaleSilhouette(g_npc_prizoner_a, SCALE.SABOTENBOUL ,SILHOUETTE_WIDTH.SABOTENBOUL);
			SetReactorMsg_(g_npc_prizoner_a, "REC_NPC_PRIZONER");
		}
	}
	
	// ■囚人Ｂ
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_BLAST_STRATEGY")) {				// Num6 < 20
			g_npc_prizoner_b = ArrangePointNpc_(id_saboten, "npc_prisoner_b000");
			SetScaleSilhouette(g_npc_prizoner_b, SCALE.SABOTENBOUL ,SILHOUETTE_WIDTH.SABOTENBOUL);
			SetReactorMsg_(g_npc_prizoner_b, "REC_NPC_PRIZONER");
		}
	}
	
	// ■囚人Ｃ
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_BLAST_STRATEGY")) {				// Num6 < 20
			g_npc_prizoner_c = ArrangePointNpc_(id_dessert, "npc_prisoner_c000");
			SetScaleSilhouette(g_npc_prizoner_c, SCALE.DEZATOTANKU ,SILHOUETTE_WIDTH.DEZATOTANKU);
			SetReactorMsg_(g_npc_prizoner_c, "REC_NPC_PRIZONER");
		}
	}
	
	// ■囚人Ｄ
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_BLAST_STRATEGY")) {				// Num6 < 20
			g_npc_prizoner_d = ArrangePointNpc_(id_saboten, "npc_prisoner_d000");
			SetScaleSilhouette(g_npc_prizoner_d, SCALE.SABOTENBOUL ,SILHOUETTE_WIDTH.SABOTENBOUL);
			SetReactorMsg_(g_npc_prizoner_d, "REC_NPC_PRIZONER");
		}
	}
	
	// ■看守Ａ
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_MEETING_01")) {					// Num6 < 12
			g_npc_jailer_a = ArrangePointNpc_(id_samayou, "npc_jailer_a000");
			SetScaleSilhouette(g_npc_jailer_a, SCALE.N ,SILHOUETTE_WIDTH.N);
			SetReactorMsg_(g_npc_jailer_a, "REC_NPC_SAMAYOUYOROI");
		}
	}
	
	// ■看守Ｂ
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_MEETING_01")) {					// Num6 < 12
			g_npc_jailer_b = ArrangePointNpc_(id_sli_knight, "npc_jailer_b000");
			SetScaleSilhouette(g_npc_jailer_b, SCALE.N ,SILHOUETTE_WIDTH.N);
			SetReactorMsg_(g_npc_jailer_b, "REC_NPC_SLYMKNAIGHT");
		}
	}
	
	// ■看守Ｃ
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_MEETING_01")) {					// Num6 < 12
			g_npc_jailer_c = ArrangePointNpc_(id_ookizuchi, "npc_jailer_c000");
			SetScaleSilhouette(g_npc_jailer_c, SCALE.N ,SILHOUETTE_WIDTH.N);
			SetReactorMsg_(g_npc_jailer_c, "REC_NPC_OOKIDUTI");
		}
	}
	
	// ■看守Ｄ
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_MEETING_01")) {					// Num6 < 12
			g_npc_jailer_d = ArrangePointNpc_(id_gaikotu, "npc_jailer_d000");
			SetScaleSilhouette(g_npc_jailer_d, SCALE.N ,SILHOUETTE_WIDTH.N);
			SetReactorMsg_(g_npc_jailer_d, "REC_NPC_GAIKOTU");
		}
	}
	
	// ■ルキヤ
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_ITTABURU_INTERFERENCE")) {			// Num6 < 21
			// 配置しない
		}
		else if (prison_num < GetFlagID_("CONST_SS_PR_REMACHI_ITTABURU")) {			// Num6 < 25
			g_npc_rukiya = ArrangePointNpc_(id_rukiya, "npc_rukiya000");
			SetTalkCameraType_(g_npc_rukiya, TALK_CAMERA_UP);//カメラの設定
			SetReactorMsg_(g_npc_rukiya, "REC_NPC_RUKIYA");
			// 会話カメラ時に透過されるのでアルファ値を設定する
			SetManualCalcAlpha_(g_npc_rukiya, true);
			SetAlpha_(g_npc_rukiya, 1.0);
		}
	}
	
	//-----------
	// ▼地雷配置
	//-----------
	// BitFlag取得
	local bit_get_water			 = GetEventFlg_("BFG_GET_DIRTY_WATER");			// Bit_1201 汚い水を入手
	local bit_show_proof		 = GetEventFlg_("BFG_SHOW_PROOF_OF_JAILER");	// Bit_1203 看守のあかしを見せた
	local bit_get_jail_key		 = GetEventFlg_("BFG_GET_KEY_OF_JAIL");			// Bit_1204 ろうやのカギを入手
	local bit_jail_break_west_1	 = GetEventFlg_("BFG_CHECK_WEST_1");
	local bit_jail_break_west_2	 = GetEventFlg_("BFG_RELEASE_PRISONER_B");		// Bit_1206 囚人Ｂ解放
	local bit_jail_break_west_3	 = GetEventFlg_("BFG_CHECK_WEST_3");
	local bit_jail_break_west_4	 = GetEventFlg_("BFG_RELEASE_PRISONER_C");		// Bit_1207 囚人Ｃ解放
	local bit_jail_break_west_5	 = GetEventFlg_("BFG_CHECK_WEST_5");
	local bit_jail_break_west_6	 = GetEventFlg_("BFG_CHECK_WEST_6");
	local bit_jail_break_est_1	 = GetEventFlg_("BFG_CHECK_EAST_1");
	local bit_jail_break_est_3	 = GetEventFlg_("BFG_CHECK_EAST_3");
	local bit_jail_break_est_4	 = GetEventFlg_("BFG_CHECK_EAST_4");
	local bit_jail_break_est_5	 = GetEventFlg_("BFG_RELEASE_PRISONER_D");		// Bit_1208 囚人Ｄ解放
	local bit_jail_break_est_6	 = GetEventFlg_("BFG_CHECK_EAST_6");
	
	// ID初期化
	g_mine_bed				 <- C_NONE_ID;
	g_mine_ruler_point		 <- C_NONE_ID;
	g_mine_dirty_water		 <- C_NONE_ID;
	g_mine_demo418			 <- C_NONE_ID;
	g_mine_rukiya_doll		 <- C_NONE_ID;
	g_mine_no_entry			 <- C_NONE_ID;
	g_mine_no_entry02		 <- C_NONE_ID;
	g_mine_jail_break_west_1 <- C_NONE_ID;
	g_mine_jail_break_west_2 <- C_NONE_ID;
	g_mine_jail_break_west_3 <- C_NONE_ID;
	g_mine_jail_break_west_4 <- C_NONE_ID;
	g_mine_jail_break_west_5 <- C_NONE_ID;
	g_mine_jail_break_west_6 <- C_NONE_ID;
	g_mine_jail_break_est_1	 <- C_NONE_ID;
	g_mine_jail_break_est_3_0 <- C_NONE_ID;
	g_mine_jail_break_est_3_1 <- C_NONE_ID;
	g_mine_jail_break_est_4	 <- C_NONE_ID;
	g_mine_jail_break_est_5	 <- C_NONE_ID;
	g_mine_jail_break_est_6	 <- C_NONE_ID;
	g_mine_tunnel01			 <- C_NONE_ID;
	g_mine_tunnel02			 <- C_NONE_ID;
	g_mine_elevator			 <- C_NONE_ID;
	g_mine_jail_break_est_2_0 <- C_NONE_ID;
	g_mine_jail_break_est_2_1 <- C_NONE_ID;
	
	// ■ベッド
	g_mine_bed = SetPointCircleEventMine_("mine_bed", true);
		
	// ■汚い水
	if (!bit_get_water) {
		g_mine_dirty_water = SetPointCircleEventMine_("mine_dirty_water", true);
	}
	
	// ■穴
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_RUKIYA_NEWS")) {					// Num6 < 9
			// 設置しない
		} else {
			g_mine_tunnel01 = SetPointBoxEventMine_("mine_tunnel_01", true);
			g_mine_tunnel02 = SetPointBoxEventMine_("mine_tunnel_02", true);
		}
	} else {
		g_mine_tunnel01 = SetPointBoxEventMine_("mine_tunnel_01", true);
		g_mine_tunnel02 = SetPointBoxEventMine_("mine_tunnel_02", true);
	}
	
	// ■Demo418起動地雷
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_BATTLE_ITTABURU_LOSE")) {			// Num6 = 23
			g_mine_demo418 = SetPointBoxEventMine_("mine_demo418", false);
		}
	}
	
	// ■ルキヤ人形
	g_mine_rukiya_doll = SetPointCircleEventMine_("mine_rukiya_doll", true);
		
	// ■看守Ａ付近の進入禁止
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_DEVIL_REMODELING")) {				// Num6 < 11
			if (!bit_show_proof) {
				g_mine_no_entry = SetPointBoxEventMine_("mine_no_entry", false);
			}
		}
	}
	
	// ■看守Ｂ付近の進入禁止
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_MEETING_02")) {					// Num6 < 13
			g_mine_no_entry02 = SetPointBoxEventMine_("mine_no_entry02", false);
		}
	}
	
	// ■牢屋扉 東１
	if (!bit_jail_break_est_1) {
		g_mine_jail_break_est_1 = SetPointCircleEventMine_("mine_jail_break_est_1", true);
	}

	// ■牢屋扉 東２
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_MEETING_01")) {					// Num6 < 12
			g_mine_jail_break_est_2_0 = SetPointBoxEventMine_("mine_jail_break_est_2_0", true);
			g_mine_jail_break_est_2_1 = SetPointBoxEventMine_("mine_jail_break_est_2_1", true);
		}
	}

	// ■牢屋扉 東３（囚人Ａ）
	if (!bit_jail_break_est_3) {
		g_mine_jail_break_est_3_0 = SetPointBoxEventMine_("mine_jail_break_est_3_0", true);
		g_mine_jail_break_est_3_1 = SetPointBoxEventMine_("mine_jail_break_est_3_1", true);
	}

	// ■牢屋扉 東４
	if (!bit_jail_break_est_4) {
		g_mine_jail_break_est_4 = SetPointCircleEventMine_("mine_jail_break_est_4", true);
	}

	// ■牢屋扉 東５（囚人Ｄ）
	if (!bit_jail_break_est_5) {
		g_mine_jail_break_est_5 = SetPointCircleEventMine_("mine_jail_break_est_5", true);
	}

	// ■牢屋扉 東６
	if (!bit_jail_break_est_6) {
		g_mine_jail_break_est_6 = SetPointCircleEventMine_("mine_jail_break_est_6", true);
	}

	// ■牢屋扉 西１
	if (!bit_jail_break_west_1) {
		g_mine_jail_break_west_1 = SetPointCircleEventMine_("mine_jail_break_west_1", true);
	}
	
	// ■牢屋扉 西２（囚人Ｂ）
	if (!bit_jail_break_west_2) {
		g_mine_jail_break_west_2 = SetPointCircleEventMine_("mine_jail_break_west_2", true);
	}
	
	// ■牢屋扉 西３
	if (!bit_jail_break_west_3) {
		g_mine_jail_break_west_3 = SetPointCircleEventMine_("mine_jail_break_west_3", true);
	}
	
	// ■牢屋扉 西４（囚人Ｃ）
	if (!bit_jail_break_west_4) {
		g_mine_jail_break_west_4 = SetPointCircleEventMine_("mine_jail_break_west_4", true);
	}

	// ■牢屋扉 西５
	if (!bit_jail_break_west_5) {
		g_mine_jail_break_west_5 = SetPointCircleEventMine_("mine_jail_break_west_5", true);
	}
	
	// ■牢屋扉 西６
	if (!bit_jail_break_west_6) {
		g_mine_jail_break_west_6 = SetPointCircleEventMine_("mine_jail_break_west_6", true);
	}
	
	// ■エレベーターのマップチェンジ地雷
	g_mine_elevator = SetPointBoxEventMine_("mine_elevator", true);
	
	//---------------
	// ▼ギミック配置
	//---------------
	// ID初期化
	g_rukiya_nukegara		 <- C_NONE_ID;
	g_gmk_elevator_door		 <- C_NONE_ID;
	g_gmk_elevator_lift		 <- C_NONE_ID;
	g_gmk_jail_door_est_1	 <- C_NONE_ID;
	g_gmk_jail_door_est_2	 <- C_NONE_ID;
	g_gmk_jail_door_est_3	 <- C_NONE_ID;
	g_gmk_jail_door_est_4	 <- C_NONE_ID;
	g_gmk_jail_door_est_5	 <- C_NONE_ID;
	g_gmk_jail_door_est_6	 <- C_NONE_ID;
	g_gmk_jail_door_west_1	 <- C_NONE_ID;
	g_gmk_jail_door_west_2	 <- C_NONE_ID;
	g_gmk_jail_door_west_3	 <- C_NONE_ID;
	g_gmk_jail_door_west_4	 <- C_NONE_ID;
	g_gmk_jail_door_west_5	 <- C_NONE_ID;
	g_gmk_jail_door_west_6	 <- C_NONE_ID;
	
	// リソース読み込み
	local id_elevator_door	 = ReadGimmick_("o_S02_01");		// エレベーターの扉
	local id_elevator_lift	 = ReadGimmick_("o_S02_00");		// エレベーターリフト
	local id_jail_door		 = ReadGimmick_("o_S02_02");		// 牢屋扉

	// ■ルキヤの抜殻(スパイクヘッド)
	local id_rukiya_nukegara = ReadGimmick_("o_dem_16");		// ルキヤの抜殻(スパイクヘッド)
	g_rukiya_nukegara = ArrangePointGimmick_("o_dem_16", id_rukiya_nukegara, "gmk_rukiya_doll");
	SetScaleSilhouette(g_rukiya_nukegara, SCALE.M, SILHOUETTE_WIDTH.M);
	
	// ■エレベーターの扉
	g_gmk_elevator_door = ArrangePointGimmick_("o_S02_01", id_elevator_door, "gmk_elevator_door");

	// ■エレベーターリフト
	g_gmk_elevator_lift = ArrangePointGimmick_("o_S02_00", id_elevator_lift, "gmk_elevator_lift");
	
	// ■牢屋扉 東１
	if (!bit_jail_break_est_1) {
		g_gmk_jail_door_est_1 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_est_1");
		SetMotion_(g_gmk_jail_door_est_1, MOT_GIMMICK_0, BLEND_N);
	} else {
		g_gmk_jail_door_est_1 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_est_1");
		SetMotion_(g_gmk_jail_door_est_1, MOT_GIMMICK_2, BLEND_N);
		SetGimmickMapHitEnable_(g_gmk_jail_door_est_1, false); // gimmick のアタリを無効化
	}

	// ■牢屋扉 東２
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_MEETING_01")) {					// Num6 < 12
			g_gmk_jail_door_est_2 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_est_2");
			SetMotion_(g_gmk_jail_door_est_2, MOT_GIMMICK_4, BLEND_N);
		} else {
			g_gmk_jail_door_est_2 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_est_2");
			SetMotion_(g_gmk_jail_door_est_2, MOT_GIMMICK_2, BLEND_N);
			SetGimmickMapHitEnable_(g_gmk_jail_door_est_2, false); // gimmick のアタリを無効化
		}
	} else {
		g_gmk_jail_door_est_2 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_est_2");
		SetMotion_(g_gmk_jail_door_est_2, MOT_GIMMICK_2, BLEND_N);
		SetGimmickMapHitEnable_(g_gmk_jail_door_est_2, false); // gimmick のアタリを無効化
	}

	// ■牢屋扉 東３（囚人Ａ）
	if (!bit_jail_break_est_3) {
		g_gmk_jail_door_est_3 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_est_3");
		SetMotion_(g_gmk_jail_door_est_3, MOT_GIMMICK_0, BLEND_N);
	} else {
		g_gmk_jail_door_est_3 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_est_3");
		SetMotion_(g_gmk_jail_door_est_3, MOT_GIMMICK_2, BLEND_N);
		SetGimmickMapHitEnable_(g_gmk_jail_door_est_3, false); // gimmick のアタリを無効化
	}

	// ■牢屋扉 東４
	if (!bit_jail_break_est_4) {
		g_gmk_jail_door_est_4 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_est_4");
		SetMotion_(g_gmk_jail_door_est_4, MOT_GIMMICK_0, BLEND_N);
	} else {
		g_gmk_jail_door_est_4 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_est_4");
		SetMotion_(g_gmk_jail_door_est_4, MOT_GIMMICK_2, BLEND_N);
		SetGimmickMapHitEnable_(g_gmk_jail_door_est_4, false); // gimmick のアタリを無効化
	}

	// ■牢屋扉 東５（囚人Ｃ）
	if (!bit_jail_break_est_5) {
		g_gmk_jail_door_est_5 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_est_5");
		SetMotion_(g_gmk_jail_door_est_5, MOT_GIMMICK_0, BLEND_N);
	} else {
		g_gmk_jail_door_est_5 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_est_5");
		SetMotion_(g_gmk_jail_door_est_5, MOT_GIMMICK_2, BLEND_N);
		SetGimmickMapHitEnable_(g_gmk_jail_door_est_5, false); // gimmick のアタリを無効化
	}

	// ■牢屋扉 東６
	if (!bit_jail_break_est_6) {
		g_gmk_jail_door_est_6 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_est_6");
		SetMotion_(g_gmk_jail_door_est_6, MOT_GIMMICK_0, BLEND_N);
	} else {
		g_gmk_jail_door_est_6 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_est_6");
		SetMotion_(g_gmk_jail_door_est_6, MOT_GIMMICK_2, BLEND_N);
		SetGimmickMapHitEnable_(g_gmk_jail_door_est_6, false); // gimmick のアタリを無効化
	}

	// ■牢屋扉 西１
	if (!bit_jail_break_west_1) {
		g_gmk_jail_door_west_1 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_west_1");
		SetMotion_(g_gmk_jail_door_west_1, MOT_GIMMICK_0, BLEND_N);
	} else {
		g_gmk_jail_door_west_1 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_west_1");
		SetMotion_(g_gmk_jail_door_west_1, MOT_GIMMICK_2, BLEND_N);
		SetGimmickMapHitEnable_(g_gmk_jail_door_west_1, false); // gimmick のアタリを無効化
	}

	// ■牢屋扉 西２（囚人Ｂ）
	if (!bit_jail_break_west_2) {
		g_gmk_jail_door_west_2 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_west_2");
		SetMotion_(g_gmk_jail_door_west_2, MOT_GIMMICK_0, BLEND_N);
	} else {
		g_gmk_jail_door_west_2 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_west_2");
		SetMotion_(g_gmk_jail_door_west_2, MOT_GIMMICK_2, BLEND_N);
		SetGimmickMapHitEnable_(g_gmk_jail_door_west_2, false); // gimmick のアタリを無効化
	}

	// ■牢屋扉 西３
	if (!bit_jail_break_west_3) {
		g_gmk_jail_door_west_3 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_west_3");
		SetMotion_(g_gmk_jail_door_west_3, MOT_GIMMICK_0, BLEND_N);
	} else {
		g_gmk_jail_door_west_3 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_west_3");
		SetMotion_(g_gmk_jail_door_west_3, MOT_GIMMICK_2, BLEND_N);
		SetGimmickMapHitEnable_(g_gmk_jail_door_west_3, false); // gimmick のアタリを無効化
	}

	// ■牢屋扉 西４（囚人Ｄ）
	if (!bit_jail_break_west_4) {
		g_gmk_jail_door_west_4 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_west_4");
		SetMotion_(g_gmk_jail_door_west_4, MOT_GIMMICK_0, BLEND_N);
	} else {
		g_gmk_jail_door_west_4 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_west_4");
		SetMotion_(g_gmk_jail_door_west_4, MOT_GIMMICK_2, BLEND_N);
		SetGimmickMapHitEnable_(g_gmk_jail_door_west_4, false); // gimmick のアタリを無効化
	}
	
	// ■牢屋扉 西５
	if (!bit_jail_break_west_5) {
		g_gmk_jail_door_west_5 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_west_5");
		SetMotion_(g_gmk_jail_door_west_5, MOT_GIMMICK_0, BLEND_N);
	} else {
		g_gmk_jail_door_west_5 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_west_5");
		SetMotion_(g_gmk_jail_door_west_5, MOT_GIMMICK_2, BLEND_N);
		SetGimmickMapHitEnable_(g_gmk_jail_door_west_5, false); // gimmick のアタリを無効化
	}

	// ■牢屋扉 西６
	if (!bit_jail_break_west_6) {
		g_gmk_jail_door_west_6 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_west_6");
		SetMotion_(g_gmk_jail_door_west_6, MOT_GIMMICK_0, BLEND_N);
	} else {
		g_gmk_jail_door_west_6 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_west_6");
		SetMotion_(g_gmk_jail_door_west_6, MOT_GIMMICK_2, BLEND_N);
		SetGimmickMapHitEnable_(g_gmk_jail_door_west_6, false); // gimmick のアタリを無効化
	}

	//-------------------------
	// ▼リアクターポイント配置
	//-------------------------
	// ■運搬用エレベーター
	local reactorPoint01 = ArrangeMsgReactorPoint("recpoint_01_erevator", GetFlagID_("BFG_REACTER_POINT_075")// Bit_1574 運搬用エレベーター
		, SHORT_DIST, "REC_POINT_01", "REC_POINT_01_2");

	//-------------------------
	// ▼ナビマップアイコン配置
	//-------------------------
	// ID初期化
	g_exclamation01	 <- C_NONE_ID;
	g_exclamation03	 <- C_NONE_ID;
	g_exclamation04	 <- C_NONE_ID;
	g_exclamation06	 <- C_NONE_ID;
	g_exclamation09	 <- C_NONE_ID;
	g_exclamation11	 <- C_NONE_ID;

	// ■「！」
	if (!bit_get_water) {
		g_exclamation03 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "mine_dirty_water");  // 汚い水
	}

	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_RUKIYA_NEWS")) {					// Num6 = 9
			g_exclamation01 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "gmk_rukiya_doll"); // ルキヤの抜け殻
			g_exclamation04 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "navi_icon_ana");  // 穴
		}
	}

	if (bit_get_jail_key == true) {
		if (!bit_jail_break_est_5) {
			g_exclamation06 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "navi_icon_est_5");	// 牢屋扉 東５（囚人Ｃ）
		}
		if (!bit_jail_break_west_2) {
			g_exclamation09 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "navi_icon_west_2");	// 牢屋扉 西２（囚人Ｂ）
		}
		if (!bit_jail_break_west_4) {
			g_exclamation11 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "navi_icon_west_4");	// 牢屋扉 西４（囚人Ｄ）
		}
	}
	
	// ■エレベーターのマップチェンジ線のフラグを立てる
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_INVULNERABILITY_PLAYER")) {		// Num6 < 28
			SetEventFlg_("BFG_LIMIT_3F_CENTER_PATHWAY", false);				// Bit_1226 イッタブル撃破（中央の通路周辺にモンスターを配置）
		} else {
			SetEventFlg_("BFG_LIMIT_3F_CENTER_PATHWAY", true);				// Bit_1226 イッタブル撃破（中央の通路周辺にモンスターを配置）
		}
	} else {
		SetEventFlg_("BFG_LIMIT_3F_CENTER_PATHWAY", true);					// Bit_1226 イッタブル撃破（中央の通路周辺にモンスターを配置）
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
	
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_ITTABURU_PRISON_2ND")) {			// Num6 = 7
			SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_PR_ITTABURU_PRISON_3RD"));	// Num6 <- 8
			SetEventFlg_("BFG_S00_00_EVENT_BGM005_PLAY", true);						// Bit659 : BGM_005 を流すかどうか
			
			//Demo407[イッタブル監獄へ③]（牢屋）再生
			EventStartChangeDemo(407, FADE_COLOR_BLACK);
		}
		else if (prison_num == GetFlagID_("CONST_SS_PR_MEETING_01")) {				// Num6 = 12
			SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_PR_MEETING_02"));			// Num6 <- 13
			SetEventFlg_("BFG_S02_01_EVENT_BGM007_PLAY", true);						// Bit_663 : S02_01 BGM007を流す
			
			// デモの復帰位置をデモの完成後に設定します
			SetReturnDemoMap_("S02_01"); 
			SetReturnDemoPosDir_(Vec3(271.767, 40.0, -333.316), -90);
			// Demo431[イッタブルの集会②（２F）]再生
			EventStartChangeDemo(431, FADE_COLOR_BLACK);
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
	
	DebugPrint("ID: " + target + " に接触 [TouchNpc]");
	
	switch (target) {
	case g_npc_prizoner_a :
		uTalkPrizonerA();
		break;
	case g_npc_prizoner_b :
		uTalkPrizonerB();
		break;
	case g_npc_prizoner_c :
		uTalkPrizonerC();
		break;
	case g_npc_prizoner_d :
		uTalkPrizonerD();
		break;
	case g_npc_jailer_a :
		uTalkJailerA();
		break;
	case g_npc_jailer_b :
		uTalkJailerB();
		break;
	case g_npc_jailer_c :
		uTalkJailerC();
		break;
	case g_npc_jailer_d :
		uTalkJailerD();
		break;
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
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");
	prison_num	 = GetNumFlg_("NUM_SCENARIO_SUB_PRISON");
	
	local target = GetTouchEventMineId_();
	
	DebugPrint("ID: " + target + " に接触 [TouchEventMine]");
	
	switch (target) {
	case g_mine_bed :
		uMineBed();
		break;
	case g_mine_dirty_water :
		uMineDirtyWater();
		break;
	case g_mine_tunnel01 :
		uMineTunnel01();
		break;
	case g_mine_tunnel02 :
		uMineTunnel02();
		break;
	case g_mine_demo418 :
		uMineDemo418Start();
		break;
	case g_mine_rukiya_doll :
		uMineRukiyaDoll();
		break;
	case g_mine_no_entry :
		uMineNoEntry();
		break;
	case g_mine_no_entry02 :
		uMineNoEntry02();
		break;
	case g_mine_jail_break_est_1 :
		uMineJailBreakEst1();
		break;
	case g_mine_jail_break_est_3_0 :
		uMineJailBreakEst3_0();
		break;
	case g_mine_jail_break_est_3_1 :
		uMineJailBreakEst3_1();
		break;
	case g_mine_jail_break_est_4 :
		uMineJailBreakEst4();
		break;
	case g_mine_jail_break_est_5 :
		uMineJailBreakEst5();
		break;
	case g_mine_jail_break_est_6 :
		uMineJailBreakEst6();
		break;
	case g_mine_jail_break_west_1 :
		uMineJailBreakWest1();
		break;
	case g_mine_jail_break_west_2 :
		uMineJailBreakWest2();
		break;
	case g_mine_jail_break_west_3 :
		uMineJailBreakWest3();
		break;
	case g_mine_jail_break_west_4 :
		uMineJailBreakWest4();
		break;
	case g_mine_jail_break_west_5:
		uMineJailBreakWest5();
		break;
	case g_mine_jail_break_west_6 :
		uMineJailBreakWest6();
		break;
	case g_mine_elevator :
		uMineElevator();
		break;
	case g_mine_jail_break_est_2_0 :
		uMineJailBreakEst2_0();
		break;
	case g_mine_jail_break_est_2_1 :
		uMineJailBreakEst2_1();
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
//		囚人Ａ 会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkPrizonerA()
{
	local bit_get_water = GetEventFlg_("BFG_GET_DIRTY_WATER");		// Bit_1201 汚い水を入手
	
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_RUKIYA_NEWS")) {					// Num6 < 9
			// 汚い水を入手している
			if (bit_get_water) {
				SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_PR_RUKIYA_NEWS"));		// Num6 <- 9
				
				SetReturnDemoPosDir_(Vec3(238.1, 0, 215.5), -188);
				// Demo408[ルキヤの消息]再生
				TouchNpcChangeDemo(408);
			}
			// 汚い水を未入手
			else {
				OpenMsgWnd_();
				ShowMsg_("NPC_PRISONER_A_MSG_060");		// 「み……みずをくれ……。
				KeyInputWait_();
				CloseMsgWnd_();
			}
		}
		else {
			OpenMsgWnd_();
			ShowMsg_("NPC_PRISONER_A_MSG_070");		// 「ルキヤは となりの牢に 入れられてたぜ。
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		囚人Ｂ 会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkPrizonerB()
{
	local bit_jail_break_west_2 = GetEventFlg_("BFG_RELEASE_PRISONER_B");	// Bit_1206 囚人Ｂ解放
	
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_MEETING_01")) {					// Num6 < 12
			OpenMsgWnd_();
			ShowMsg_("NPC_PRISONER_B_MSG_070");		// 「おい あんた！ 助けてくれ！
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (prison_num < GetFlagID_("CONST_SS_PR_BLAST_STRATEGY")) {			// Num6 < 20
			// 牢屋を開ける前
			if (!bit_jail_break_west_2) {
				OpenMsgWnd_();
				ShowMsg_("NPC_PRISONER_B_MSG_080");		// 「お前……レジスタンスか！
				KeyInputWait_();
				CloseMsgWnd_();
			}
			// 牢屋を開けた後
			else {
				OpenMsgWnd_();
				ShowMsg_("NPC_PRISONER_B_MSG_110");		// 「出して……くれるのか？
				KeyInputWait_();
				CloseMsgWnd_();
			}
		}
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		囚人Ｃ 会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkPrizonerC()
{
	local bit_jail_break_west_4 = GetEventFlg_("BFG_RELEASE_PRISONER_C");	// Bit_1207 囚人Ｃ解放
	
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_MEETING_01")) {					// Num6 < 12
			OpenMsgWnd_();
			ShowMsg_("NPC_PRISONER_C_MSG_070");		// 「息子は 元気にしているだろうか……。
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (prison_num < GetFlagID_("CONST_SS_PR_BLAST_STRATEGY")) {			// Num6 < 20
			// 牢屋を開ける前
			if (!bit_jail_break_west_4) {
				OpenMsgWnd_();
				ShowMsg_("NPC_PRISONER_C_MSG_080");		// 「なんなんだ あの凶暴な バケモノたちは……？
				KeyInputWait_();
				CloseMsgWnd_();
			}
			// 牢屋を開けた後
			else {
				OpenMsgWnd_();
				ShowMsg_("NPC_PRISONER_C_MSG_110");		// 「あ……ありがたい！
				KeyInputWait_();
				CloseMsgWnd_();
			}
		}
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		囚人Ｄ 会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkPrizonerD()
{
	local bit_jail_break_est_5 = GetEventFlg_("BFG_RELEASE_PRISONER_D");	// Bit_1208 囚人Ｄ解放
	
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_MEETING_01")) {					// Num6 < 12
			OpenMsgWnd_();
			ShowMsg_("NPC_PRISONER_D_MSG_070");		// 「さっき イッタブルが 帰ってきたが
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (prison_num < GetFlagID_("CONST_SS_PR_BLAST_STRATEGY")) {			// Num6 < 20
			// 牢屋を開ける前
			if (!bit_jail_break_est_5) {
				OpenMsgWnd_();
				ShowMsg_("NPC_PRISONER_D_MSG_080");		// 「あんた 追われてるみたいだな？
				KeyInputWait_();
				CloseMsgWnd_();
			}
			// 牢屋を開けた後
			else {
				OpenMsgWnd_();
				ShowMsg_("NPC_PRISONER_D_MSG_110");		// 「逃げられるなら オレも行く。
				KeyInputWait_();
				CloseMsgWnd_();
			}
		}
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		看守Ａ 会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkJailerA()
{
	local bit_get_jailer = GetEventFlg_("BFG_GET_PROOF_OF_JAILER");			// Bit_1202 看守のあかしを入手
	local bit_show_proof = GetEventFlg_("BFG_SHOW_PROOF_OF_JAILER");		// Bit_1203 看守のあかしを見せた
	
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_DEVIL_REMODELING")) {				// Num6 < 11
			// 「看守のあかし」を見せる前
			if(!bit_show_proof) {
				OpenMsgWnd_();
				ShowMsg_("NPC_JAILER_A_MSG_070");		// 「なんだ お前は？ 囚人では ないのか？
				KeyInputWait_();
				
				// 「はい」
				if (GetQueryResult_() == QUERY2_0) {
					// 「看守のあかし」入手前
					if (!bit_get_jailer) {
						ShowMsg_("NPC_JAILER_A_MSG_072");	// 「ウソをつくな！ 看守のあかしを
						KeyInputWait_();
						CloseMsgWnd_();
						
						uReturnStartPoint();
					}
					// 「看守のあかし」入手後
					else {
						SetEventFlg_("BFG_SHOW_PROOF_OF_JAILER", true);		// Bit_1203 看守のあかしを見せた
						DeleteEventMine_(g_mine_no_entry);
						
						OpenMsgWnd_();
						ShowMsg_("NPC_JAILER_A_MSG_073");		// 「だったら 看守のあかしを見せてみろ！
						KeyInputWait_();
						CloseMsgWnd_();
					}
				}
				// 「いいえ」
				else {
					ShowMsg_("NPC_JAILER_A_MSG_071");	// 「だったら 囚人か！
					KeyInputWait_();
					CloseMsgWnd_();
					
					uReturnStartPoint();
				}
			}
			// 「看守のあかし」を見せた後
			else {
				OpenMsgWnd_();
				ShowMsg_("NPC_JAILER_A_MSG_074");		// 「もうすぐ イッタブルさまの命令で
				KeyInputWait_();
				CloseMsgWnd_();
			}
		} else {
			OpenMsgWnd_();
			ShowMsg_("NPC_JAILER_A_MSG_080");			// 「ふむ……心配のしすぎだったか。
			KeyInputWait_();
			CloseMsgWnd_();
			
			SetEventFlg_("BFG_RIDE_INPUT_PROHIBIT", false);		// Bit_435 ライド操作禁止フラグ
			SetEventFlg_("BFG_PLAYERABILITY_PROHIBIT", false);	// Bit_456 プレイヤー特技禁止フラグ
			SetEventFlg_("BFG_OPEN_PARK_TO_PRISON", true);		// Bit_1210 アロイパーク－監獄 扉開通フラグ 
			
			// BitFlag取得
			local bit_kigurumi = GetEventFlg_("BFG_PUT_ON_MONSTER_SUIT");	// Bit_24 キグルミ状態フラグ

			if (bit_kigurumi) {
				// 主人公 キグルミ状態 解除
				SetEventFlg_("BFG_PUT_ON_MONSTER_SUIT", false);		// Bit_24 キグルミ状態フラグ
				SetEventFlg_("BFG_LIMIT_1F_ALL", true);				// Bit_1242 監獄１階にモンスターを配置
				SetEventFlg_("BFG_LIMIT_PRISON_ALL", true);			// Bit_1225 監獄の全ての階にモンスターを配置
				SetEventFlg_("BFG_LIMIT_NPC_PERIPHERAL", false);	// Bit_1231 通路封鎖NPC周りにモンスターを配置
			}
			
			SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_PR_MEETING_01"));			// Num6 <- 12
			// Demo430[イッタブルの集会①（１F）]再生
			StopBgmChangeDemo(430);

		}
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		看守Ｂ 会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkJailerB()
{
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_MEETING_01")) {					// Num6 < 12
			OpenMsgWnd_();
			ShowMsg_("NPC_JAILER_B_MSG_070");		// 「おい 貴様！ 勝手に 持ち場を離れるな！
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		看守Ｃ 会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkJailerC()
{
	local bit_get_jailer = GetEventFlg_("BFG_GET_PROOF_OF_JAILER");		// Bit_1202 看守のあかしを入手
	
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_MEETING_01")) {					// Num6 < 12
			// 「看守のあかし」入手前
			if (!bit_get_jailer) {
				OpenMsgWnd_();
				ShowMsg_("NPC_JAILER_C_MSG_070");		// 「お前……やけに弱そうだが 新入りか？
				KeyInputWait_();
				
				// 「はい」
				if (GetQueryResult_() == QUERY2_0) {
					ShowMsg_("NPC_JAILER_C_MSG_072");	// 「そうか ならばいい。
					KeyInputWait_();
					CloseMsgWnd_();
				}
				// 「いいえ」
				else {
					ShowMsg_("NPC_JAILER_C_MSG_071");	// 「仕方ない奴だな……ほら 受け取れ。
					KeyInputWait_();
					CloseMsgWnd_();
					
					AddItemAndMsg(954, 1, true);		// 看守のあかし入手処理
					SetEventFlg_("BFG_GET_PROOF_OF_JAILER", true);		// Bit_1202 看守のあかしを入手
				}
			}
			// 「看守のあかし」入手後
			else {
				OpenMsgWnd_();
				ShowMsg_("NPC_JAILER_C_MSG_073");		// 「そこの フラフラしている お前。
				KeyInputWait_();
				CloseMsgWnd_();
			}
		}
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		看守Ｄ 会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkJailerD()
{
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_MEETING_01")) {					// Num6 < 12
			OpenMsgWnd_();
			ShowMsg_("NPC_JAILER_D_MSG_070");		// 「まったく……ツイてないぜ。
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		ルキヤ 会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkRukiya()
{
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_BLAST_STRATEGY")) {				// Num6 < 20
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_RUKIYA");	//ルキヤ
			ShowMsg_("NPC_RUKIYA_MSG_110");		// 「囚人は 全員 解放できたみたいだね。
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else {
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_RUKIYA");	//ルキヤ
			ShowMsg_("NPC_RUKIYA_MSG_122");		// 「さあ！　時間が　あんまりないよ！
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		ベッドを調べた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineBed()
{
	local player = GetPlayerId_();
	// 暗転明けの主人公の復帰位置と向きを設定する
	local re_pos = Vec3(181.7, 0.0, 264.5);	// 復帰位置を指定
	local re_dir = 180;					// 向きを指定
	local clear_flag	= GetEventFlg_("BFG_SCENARIO_CLEAR_SAND");		//Bit_44 監獄クリア

	local pos  = Vec3(185.1, 7.5, 295.7);
	uPlayerTurnAroundPos(pos);
	if(clear_flag == true){
		OpenMsgWnd_();
		ShowMsg_("SYSTEM_MSG_997_2");				// ベッドを使って 休めそうだ。<query_3_0/>
		KeyInputWait_();

		switch(GetQueryResult_()){
		case QUERY3_0:
		case QUERY3_1:
		// 泊まる処理
		// 休む処理
			CloseMsgWnd_();
			// 宿屋の共通の回復処理
			CommTaskInn(re_pos, re_dir, clear_flag, g_mine_bed);
			OpenMsgWnd_();
			ShowMsg_("SYSTEM_MSG_997_4");			// ベッドで休んで 元気になった！
			KeyInputWait_();
			CloseMsgWnd_();
			break;
		case QUERY3_2:
		// やめる処理
			ShowMsg_("SYSTEM_MSG_997_3");			// ベッドを 使うことをやめた。
			KeyInputWait_();
			CloseMsgWnd_();
			break;
		}
	}
	else{
		OpenMsgWnd_();
		ShowMsg_("SYSTEM_MSG_997");				// ベッドを使って 休めそうだ。<query_2_1/>
		KeyInputWait_();

		switch(GetQueryResult_()){
		case QUERY2_0:
		// 泊まる処理
			CloseMsgWnd_();
			// 宿屋の共通の回復処理
			CommTaskInn(re_pos, re_dir, clear_flag, g_mine_bed);
			OpenMsgWnd_();
			ShowMsg_("SYSTEM_MSG_997_4");			// ベッドで休んで 元気になった！
			KeyInputWait_();
			CloseMsgWnd_();
			break;
		case QUERY2_1:
		// やめる処理
			ShowMsg_("SYSTEM_MSG_997_3");			// ベッドを 使うことをやめた。
			KeyInputWait_();
			CloseMsgWnd_();
			break;
		}
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		汚い水を調べた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineDirtyWater()
{
	local player = GetPlayerId_();

	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_RUKIYA_NEWS")) {					// Num6 < 9
			local pos  = Vec3(296.7, 7.5, 302.1);
			uPlayerTurnAroundPos(pos);
	
			OpenMsgWnd_();
			ShowMsg_("SYSTEM_MSG_000");		// なんとか 飲めそうな 水が たまっている。
			KeyInputWait_();
			CloseMsgWnd_();
			
			// 「はい」
			if (GetQueryResult_() == QUERY2_0) {
				SetEventFlg_("BFG_GET_DIRTY_WATER", true);		// Bit_1201 汚い水を入手
				DeleteEventMine_(g_mine_dirty_water);
				
				SetNaviMapIconVisible_(g_exclamation03, false);	// 「！」アイコンを消す
				
				OpenMsgWnd_();
				ShowMsg_("SYSTEM_MSG_001");		// 手のひらで きたない飲み水を すくった。
				KeyInputWait_();
				CloseMsgWnd_();
			}
			// 「いいえ」
			else{
				// 処理なし
			}
		}
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		穴から出るを調べた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineTunnel01()
{
	local player = GetPlayerId_();
	local pos  = Vec3(260.0, 0.0, 160.0);

	uPlayerTurnAroundPos(pos);

	OpenMsgWnd_();
	ShowMsg_("SYSTEM_MSG_006");		// くぐり抜けられそうな 穴が開いている。
	KeyInputWait_();
	CloseMsgWnd_();
	
	// 「はい」
	if (GetQueryResult_() == QUERY2_0) {
		SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
		SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
		WaitFade_();
		
		SetPos_(player, Vec3(258, 0, 123));
		SetDir_(player, -178);
		Wait_(10);
		
		SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
		SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
		WaitFade_();
	}
	// 「いいえ」
	else{
		// 処理なし
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		穴から入るを調べた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineTunnel02()
{
	local player = GetPlayerId_();
	local pos  = Vec3(260.0, 0.0, 160.0);

	uPlayerTurnAroundPos(pos);

	OpenMsgWnd_();
	ShowMsg_("SYSTEM_MSG_006");		// くぐり抜けられそうな 穴が開いている。
	KeyInputWait_();
	CloseMsgWnd_();
	
	// 「はい」
	if (GetQueryResult_() == QUERY2_0) {
		SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
		SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
		WaitFade_();
		
		SetPos_(player, Vec3(252, 0, 199));
		SetDir_(player, 1);
		Wait_(10);
		
		SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
		SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
		WaitFade_();
	}
	// 「いいえ」
	else{
		// 処理なし
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		Demo418起動地雷に触れた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineDemo418Start()
{
	// 疑似デモ[イッタブル再戦準備]
	// 暗転
	DeleteEventMine_(g_mine_demo418);
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
	
	local task = Task_RotateToDir_(g_npc_rukiya, -30, ROTATE_EVENT_DEF);
	Wait_(10);
	
	local player = GetPlayerId_();
	SetVisible(player, false);

	SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_PR_PRE_REMACHI_ITTABURU"));		// Num6 <- 24
	
	// カメラを設置
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	Wait_(15);
	
	// 上画面のフェードイン
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();

	SetMotion_(g_npc_rukiya, "TALKLOOP", BLEND_XL);

	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RUKIYA");	//ルキヤ
	ShowMsg_("NPC_RUKIYA_MSG_121");		// 「やっと 戻ってきたね！ 無事でよかった。
	KeyInputWait_();
	CloseMsgWnd_();
	
	SetMotion_(g_npc_rukiya, "WAIT", BLEND_XL);
	Wait_(15);
	
	// モンスターの配置を再び行う
	SetEventFlg_("BFG_LIMIT_1F_ALL", true);	// Bit_1242 監獄１階にモンスターを配置
	//プレイアブルに復帰させる
	uPlayableReset(0.76, 0.0, -130.17, -180);
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		ルキヤ人形を調べた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineRukiyaDoll()
{
	local bit_demo409 = GetEventFlg_("BFG_PLAYED_DEMO409");		// Bit_1236 Demo409[ルキヤのヌケガラ]をみた
	
	CommPlayerTurnAroundObj(g_rukiya_nukegara);
	
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_RUKIYA_NUKEGARA")) {				// Num6 < 10
			if (!bit_demo409){
				SetEventFlg_("BFG_PLAYED_DEMO409", true);		// Bit_1236 Demo409[ルキヤのヌケガラ]をみた
				SetReturnDemoPosDir_(Vec3(263.9, 0, 72.2), -88);
				
				// Demo409[ルキヤのヌケガラ]再生
				TouchNpcChangeDemo(409);
			} else {
				OpenMsgWnd_();
				ShowMsg_("SYSTEM_MSG_002");	// 中身に 何も 入っていない。
				KeyInputWait_();
				CloseMsgWnd_();
			}
		} else {
			OpenMsgWnd_();
			ShowMsg_("SYSTEM_MSG_002");		// 中身に 何も 入っていない。
			KeyInputWait_();
			CloseMsgWnd_();
		}
	} else {
		OpenMsgWnd_();
		ShowMsg_("SYSTEM_MSG_002");			// 中身に 何も 入っていない。
		KeyInputWait_();
		CloseMsgWnd_();
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		看守Ａ付近の進入禁止に触れた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineNoEntry()
{
	local player = GetPlayerId_();
	local dir = GetDir_(g_npc_jailer_a);
	
	FaceToFaceNpc(g_npc_jailer_a);
	
	local rotateTask = Task_RotateToPosSetMotion_(player, GetPos_(g_npc_jailer_a), ROTATE_EVENT_DEF, MOT_WALK, MOT_WAIT);
	WaitTask(rotateTask);
	
	uTalkJailerA();
	
	rotateTask = Task_RotateToDirSetMotion_(g_npc_jailer_a, dir, 5.7, MOT_WALK, MOT_WAIT);
	WaitTask(rotateTask);
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		看守Ｂ付近の進入禁止に触れた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineNoEntry02()
{
	local dir = GetDir_(g_npc_jailer_b);
	
	FaceToFaceNpc(g_npc_jailer_b);
	
	OpenMsgWnd_();
	ShowMsg_("NPC_JAILER_B_MSG_070");		// 「おい 貴様！ 勝手に 持ち場を離れるな！
	KeyInputWait_();
	CloseMsgWnd_();
	
	Task_RotateToDirSetMotion_(g_npc_jailer_b, dir, 5.7, MOT_WALK, MOT_WAIT);
	
	CommPlayerTurnMoveDirWalk(180);
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		牢屋扉 東１を調べた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineJailBreakEst1()
{
	local player = GetPlayerId_();
	local task = Task_RotateToDirSetMotion_(player, 90, ROTATE_EVENT_DEF, MOT_WALK, MOT_WAIT);
	WaitTask(task);
	// 間を持たせる
	Wait_(15);

	uTouchJail("BFG_CHECK_EAST_1" , g_mine_jail_break_est_1 , g_gmk_jail_door_est_1);
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		牢屋扉 東２(牢屋中)を調べた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineJailBreakEst2_0()
{
	local player = GetPlayerId_();
	local task = Task_RotateToDirSetMotion_(player, -90, ROTATE_EVENT_DEF, MOT_WALK, MOT_WAIT);
	WaitTask(task);
	// 間を持たせる
	Wait_(15);

	OpenMsgWnd_();
	ShowMsg_("SYSTEM_MSG_003");		// 電子ロックが 解除されているようだ。
	KeyInputWait_();
	CloseMsgWnd_();

	// 「はい」
	if (GetQueryResult_() == QUERY2_0) {
		SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
		SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
		WaitFade_();
		
		if (prison_num < GetFlagID_("CONST_SS_PR_RUKIYA_NUKEGARA")) {				// Num6 < 10
			SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_PR_RUKIYA_NUKEGARA"));		// Num6 <- 10
			SetNaviMapIconVisible_(g_exclamation01, false);	//ルキヤの抜け殻の「！」アイコンを消す
			SetNaviMapIconVisible_(g_exclamation04, false);	//穴の「！」アイコンを消す
		}
		SetPos_(player, Vec3(123, 0, 49));
		SetDir_(player, -90);
		Wait_(10);
		
		SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
		SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
		WaitFade_();
	}
	// 「いいえ」
	else {
		// 処理なし
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		牢屋扉 東２(牢屋外)を調べた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineJailBreakEst2_1()
{
	local player = GetPlayerId_();
	local task = Task_RotateToDirSetMotion_(player, 90, ROTATE_EVENT_DEF, MOT_WALK, MOT_WAIT);
	WaitTask(task);
	// 間を持たせる
	Wait_(15);

	OpenMsgWnd_();
	ShowMsg_("SYSTEM_MSG_003_2");		// 電子ロックが 解除されているようだ。
	KeyInputWait_();
	CloseMsgWnd_();

	// 「はい」
	if (GetQueryResult_() == QUERY2_0) {
		SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
		SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
		WaitFade_();
		
		SetPos_(player, Vec3(181, 0, 53.3));
		SetDir_(player, 90);
		Wait_(10);
		
		SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
		SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
		WaitFade_();
	}
	// 「いいえ」
	else {
		// 処理なし
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		牢屋扉 東３（囚人Ａ）（牢屋中）を調べた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineJailBreakEst3_0()
{
	local player = GetPlayerId_();
	local task = Task_RotateToDirSetMotion_(player, -90, ROTATE_EVENT_DEF, MOT_WALK, MOT_WAIT);
	WaitTask(task);
	// 間を持たせる
	Wait_(15);

	uTouchJail("BFG_CHECK_EAST_3" , g_mine_jail_break_est_3_0 , g_gmk_jail_door_est_3);
	local bit_get_jail_key = GetEventFlg_("BFG_GET_KEY_OF_JAIL");	// Bit_1204 ろうやのカギを入手
	if (bit_get_jail_key) {
		DeleteEventMine_(g_mine_jail_break_est_3_1);
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		牢屋扉 東３（囚人Ａ）(牢屋外)を調べた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineJailBreakEst3_1()
{
	local player = GetPlayerId_();
	local task = Task_RotateToDirSetMotion_(player, 90, ROTATE_EVENT_DEF, MOT_WALK, MOT_WAIT);
	WaitTask(task);
	// 間を持たせる
	Wait_(15);

	uTouchJail("BFG_CHECK_EAST_3" , g_mine_jail_break_est_3_1 , g_gmk_jail_door_est_3);
	local bit_get_jail_key = GetEventFlg_("BFG_GET_KEY_OF_JAIL");	// Bit_1204 ろうやのカギを入手
	if (bit_get_jail_key) {
		DeleteEventMine_(g_mine_jail_break_est_3_0);
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		牢屋扉 東４を調べた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineJailBreakEst4()
{
	local player = GetPlayerId_();
	local task = Task_RotateToDirSetMotion_(player, 90, ROTATE_EVENT_DEF, MOT_WALK, MOT_WAIT);
	WaitTask(task);
	// 間を持たせる
	Wait_(15);

	uTouchJail("BFG_CHECK_EAST_4" , g_mine_jail_break_est_4 , g_gmk_jail_door_est_4);
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		牢屋扉 東５（囚人Ｄ）を調べた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineJailBreakEst5()
{
	local player = GetPlayerId_();
	local task = Task_RotateToDirSetMotion_(player, 90, ROTATE_EVENT_DEF, MOT_WALK, MOT_WAIT);
	WaitTask(task);
	// 間を持たせる
	Wait_(15);

	uTouchJail("BFG_RELEASE_PRISONER_D" , g_mine_jail_break_est_5 , g_gmk_jail_door_est_5);	// Bit_1208 囚人Ｄ解放
	SetNaviMapIconVisible_(g_exclamation06, false);	// 「！」アイコンを消す
	uNumSetting();
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		牢屋扉 東６を調べた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineJailBreakEst6()
{
	local player = GetPlayerId_();
	local task = Task_RotateToDirSetMotion_(player, 90, ROTATE_EVENT_DEF, MOT_WALK, MOT_WAIT);
	WaitTask(task);
	// 間を持たせる
	Wait_(15);

	uTouchJail("BFG_CHECK_EAST_6" , g_mine_jail_break_est_6 , g_gmk_jail_door_est_6);
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		牢屋扉 西１を調べた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineJailBreakWest1()
{
	local player = GetPlayerId_();
	local task = Task_RotateToDirSetMotion_(player, -90, ROTATE_EVENT_DEF, MOT_WALK, MOT_WAIT);
	WaitTask(task);
	// 間を持たせる
	Wait_(15);

	uTouchJail("BFG_CHECK_WEST_1" , g_mine_jail_break_west_1 , g_gmk_jail_door_west_1);
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		牢屋扉 西２（囚人Ｂ）を調べた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineJailBreakWest2()
{
	local player = GetPlayerId_();
	local task = Task_RotateToDirSetMotion_(player, -90, ROTATE_EVENT_DEF, MOT_WALK, MOT_WAIT);
	WaitTask(task);
	// 間を持たせる
	Wait_(15);

	uTouchJail("BFG_RELEASE_PRISONER_B" , g_mine_jail_break_west_2 , g_gmk_jail_door_west_2);	// Bit_1206 囚人Ｂ解放
	SetNaviMapIconVisible_(g_exclamation09, false);	// 「！」アイコンを消す
	uNumSetting();
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		牢屋扉 西３を調べた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineJailBreakWest3()
{
	local player = GetPlayerId_();
	local task = Task_RotateToDirSetMotion_(player, -90, ROTATE_EVENT_DEF, MOT_WALK, MOT_WAIT);
	WaitTask(task);
	// 間を持たせる
	Wait_(15);

	uTouchJail("BFG_CHECK_WEST_3" , g_mine_jail_break_west_3 , g_gmk_jail_door_west_3);
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		牢屋扉 西４（囚人Ｃ）を調べた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineJailBreakWest4()
{
	local player = GetPlayerId_();
	local task = Task_RotateToDirSetMotion_(player, -90, ROTATE_EVENT_DEF, MOT_WALK, MOT_WAIT);
	WaitTask(task);
	// 間を持たせる
	Wait_(15);

	uTouchJail("BFG_RELEASE_PRISONER_C" , g_mine_jail_break_west_4 , g_gmk_jail_door_west_4);	// Bit_1207 囚人Ｃ解放
	SetNaviMapIconVisible_(g_exclamation11, false);	// 「！」アイコンを消す
	uNumSetting();
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		牢屋扉 西５を調べた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineJailBreakWest5()
{
	local player = GetPlayerId_();
	local task = Task_RotateToDirSetMotion_(player, -90, ROTATE_EVENT_DEF, MOT_WALK, MOT_WAIT);
	WaitTask(task);
	// 間を持たせる
	Wait_(15);

	uTouchJail("BFG_CHECK_WEST_5" , g_mine_jail_break_west_5 , g_gmk_jail_door_west_5);
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		牢屋扉 西６を調べた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineJailBreakWest6()
{
	local player = GetPlayerId_();
	local task = Task_RotateToDirSetMotion_(player, -90, ROTATE_EVENT_DEF, MOT_WALK, MOT_WAIT);
	WaitTask(task);
	// 間を持たせる
	Wait_(15);

	uTouchJail("BFG_CHECK_WEST_6" , g_mine_jail_break_west_6 , g_gmk_jail_door_west_6);
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		牢屋扉 を調べた時
//------------------------------------------------
//	第一引数	: 牢屋を開けたフラグ
//	第二引数	: 地雷ＩＤ
//	第三引数	: ギミックＩＤ
//	戻り値		: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTouchJail(flg , mine , gmk)
{
	local bit_get_jail_key = GetEventFlg_("BFG_GET_KEY_OF_JAIL");	// Bit_1204 ろうやのカギを入手
	
	if (!bit_get_jail_key) {
		PlaySE_("SE_FLD_054");				// 「開かない鉄格子の扉」SE
		OpenMsgWnd_();
		ShowMsg_("SYSTEM_MSG_998");		// カギが かかっている。
		KeyInputWait_();
		CloseMsgWnd_();
	}
	else {
		PlaySE_("SE_FLD_067");				// 電子ロック解除音+牢屋が開くSE
		SetMotion_(gmk, MOT_GIMMICK_1, BLEND_N);
		Wait_(49);
		SetMotion_(gmk, MOT_GIMMICK_2, BLEND_N);
		SetGimmickMapHitEnable_(gmk, false); // gimmick のアタリを無効化
		
		SetEventFlg_(flg, true);		// 牢屋を開けたフラグ
		DeleteEventMine_(mine);
		
		OpenMsgWnd_();
		ShowMsg_("SYSTEM_MSG_999");		// ろうやのカギを使って ろうをあけた。
		KeyInputWait_();
		CloseMsgWnd_();
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		イッタブル監獄スタート地点へ戻す
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uReturnStartPoint()
{
	local player = GetPlayerId_();
	local player_pos = Vec3(232, 0, 244);
	local player_rot = -90;
	
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();

	PlaySE_("SE_FLD_053");				// 仮「鉄格子の扉・重（閉）」SE

	SetPos_(player, player_pos);
	SetDir_(player, player_rot);
	SetCameraDir_(player_rot);
	Wait_(30);
	
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		全囚人救出後のNumフラグ設定
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uNumSetting()
{
	local bit_jail_break_west_2 = GetEventFlg_("BFG_RELEASE_PRISONER_B");	// Bit_1206 囚人Ｂ解放
	local bit_jail_break_west_4 = GetEventFlg_("BFG_RELEASE_PRISONER_C");	// Bit_1207 囚人Ｃ解放
	local bit_jail_break_est_5 = GetEventFlg_("BFG_RELEASE_PRISONER_D");	// Bit_1208 囚人Ｄ解放
	
	if (bit_jail_break_west_2 && bit_jail_break_west_4 && bit_jail_break_est_5) {
		SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_PR_JAIL_OPEN"));	// Num6 <- 19
		
		local player = GetPlayerId_();
		local Player_touch_reactor = ReadMotion_(player, "Player_touch_reactor");		// 主人公顔を少し左向ける→リアクターを触る
		local Player_touch_reactor_L = ReadMotion_(player, "Player_touch_reactor_L");	// 主人公リアクターを触るL

		LoadEffect_("ef732_09_light_reactor_c");								// リアクター発光
		local isRide = IsPlayerRide_();
		if (!isRide) {
			local efc_player = SetSelectBoneEffect_("ef732_09_light_reactor_c", player, ATTACH_EFFECT1);	// リアクター発光	

			PlaySE_("SE_DEM_019");		// ◆汎用・リアクターコネクティブ受信
			Wait_(10);
			SetMotion_(player, Player_touch_reactor, BLEND_L);
			WaitMotion(player);
			SetMotion_(player, Player_touch_reactor_L, BLEND_L);
			Wait_(20);
		} else {
			local efc_player = SetSelectBoneEffectPlayer_("ef732_09_light_reactor_c", PLAYER_MODEL.NORMAL, ATTACH_EFFECT1);
			PlaySE_("SE_DEM_019");		// ◆汎用・リアクターコネクティブ受信
			Wait_(30);
		}
		OpenConnective("connective_rukiya");
		
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_RUKIYA");	//ルキヤ
		ShowMsg_("NPC_RUKIYA_MSG_110");		// 「囚人は 全員 解放できたみたいだね。
		KeyInputWait_();
		CloseMsgWnd_();
		
		CloseConnective();
		// リアクター終了時の共通処理
		CommResetPlayerMotion();
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		エレベーターの地雷を調べた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineElevator()
{
	local player = GetPlayerId_();

	CommPlayerTurnAroundObj(g_gmk_elevator_lift);
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {							// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_ITTABURU_WIN")) {				// Num6 < 27
			OpenMsgWnd_();
			ShowMsg_("SYSTEM_MSG_996");				// （仮）ボタンを押しても 反応がない。
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else {
			OpenMsgWnd_();
			ShowMsg_("SYSTEM_MSG_995");				//（仮）エレベーターが 動いている。
			KeyInputWait_();
			if(GetQueryResult_() == QUERY_YES){
				CloseMsgWnd_();

				DeleteEventMine_(g_mine_elevator);
				// ５階に移動
				ChangeMapPosDir_("S02_04", Vec3(0.7, 30.0, -340.0), 2);
				WaitFade_();
				PlaySE_("SE_FLD_061");	// エレベータで移動
			}else{
				CloseMsgWnd_();
			}
		}
	}
	else if (main_num > GetFlagID_("CONST_SM_PRISON")) {						// Num0 > 5
		OpenMsgWnd_();
		ShowMsg_("SYSTEM_MSG_995");					//（仮）エレベーターが 動いている。
		KeyInputWait_();
		if(GetQueryResult_() == QUERY_YES){
			CloseMsgWnd_();

			DeleteEventMine_(g_mine_elevator);
			// ５階に移動
			ChangeMapPosDir_("S02_04", Vec3(0.7, 30.0, -340.0), 2);
			WaitFade_();
			PlaySE_("SE_FLD_061");	// エレベータで移動
		}else{
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
	SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);// 下画面をフェードイン
	WaitFade_();
}


