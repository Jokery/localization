//===================== S01_00アロイパーク ====================

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
	
	//ライド強制解除
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_INVULNERABILITY_PLAYER")) {		// Num6 = 28
			// イッタブル勝利後に1回だけしか通らないようにする
			if(GetEventFlg_("BFG_ITTABURU_WINS_AFTER") == false){					// Bit_1241
				SetEventFlg_("BFG_ITTABURU_WINS_AFTER", true);
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
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");			// Num0
	prison_num	 = GetNumFlg_("NUM_SCENARIO_SUB_PRISON");	// Num6
	
	DebugPrint("NUM_SCENARIO_MAIN の値は " + main_num + " になりました。");
	DebugPrint("NUM_SCENARIO_SUB_PRISON の値は " + prison_num + " になりました。");
	
	// ■マップ到達フラグ
	SetEventFlg_("BFG_ARRIVE_AT_S01", true);				// Bit_94 到達フラグ アロイパーク

	// ■ルーラポイント(アロイパーク)
	SetEventFlg_("BFG_RULER_ADD_017", true);				// Bit_217 ルーラ追加 アロイパーク
	
	// ■マップチェンジNULL設定（アロイパーク－監獄間）
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {						// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_ITTABURU_PRISON_1ST")) {	// Num6 < 6
			SetHitEnableMapChangeNull_("w_S02_00ALdr_001", false);	
		}
	}

	// ■マップチェンジNULL設定（アロイパーク－フィールド間）
	local bit_kigurumi = GetEventFlg_("BFG_PUT_ON_MONSTER_SUIT");	// Bit_24 キグルミ状態フラグ
	if (bit_kigurumi == true) {
		SetHitEnableMapChangeNull_("w_S00_00ALdr_001", false);	
	}

	
	// ■デモ431再生後、アロイパークに入った
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {				// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_MEETING_02")) {	// Num6 = 13
			SetEventFlg_("BFG_PLAYED_DEMO431_AFTER_PARK", true);	// Bit_1232 デモ431再生後、アロイパークに入った
			SetEventFlg_("BFG_S02_01_EVENT_BGM007_PLAY", false);	// Bit_663  S02_01 BGMを元に戻す
		}
	}
	
	//---------------
	// ▼ギミック配置
	//---------------
	// ID初期化
	g_gmk_itta_box		 <- C_NONE_ID;
	g_gmk_reactor		 <- C_NONE_ID;
	
	// ■イッタブルの箱
	if (prison_num < GetFlagID_("CONST_SS_PR_ITTABURU_BOX")) {					// Num6 < 3
		// 配置しない
	}
	else if (prison_num < GetFlagID_("CONST_SS_PR_ITTABURU_PRISON_1ST")) {		// Num6 < 6
		local id_itta_box	 = ReadGimmick_("o_S01_02");		// 鉄の箱
		g_gmk_itta_box = ArrangePointGimmick_("o_S01_02", id_itta_box, "gmk_ittaburu_box");
		SetMotion_(g_gmk_itta_box, MOT_GIMMICK_0, BLEND_N);
	}

	// ■ルキヤのリアクター
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_INVULNERABILITY_PLAYER")) {		// Num6 = 28
			local id_reactor	 = ReadGimmick_("o_dem_23");		// ルキヤのリアクター
			g_gmk_reactor = ArrangePointGimmick_("o_dem_23", id_reactor, "mine_reactor");
			SetScale_(g_gmk_reactor, 1.5);	// 見えにくいので、1.5倍にする
			SetMotion_(g_gmk_reactor, MOT_GIMMICK_2, BLEND_N);
		}
	}

	//----------
	// ▼NPC配置
	//----------
	// ID初期化
	g_npc_mother		 <- C_NONE_ID;
	g_npc_boy			 <- C_NONE_ID;
	g_npc_aroi_a		 <- C_NONE_ID;
	g_npc_aroi_b		 <- C_NONE_ID;
	g_npc_aroi_c		 <- C_NONE_ID;
	g_npc_aroi_d		 <- C_NONE_ID;
	g_npc_item			 <- C_NONE_ID;
	g_npc_inn			 <- C_NONE_ID;
	g_npc_prizoner_b	 <- C_NONE_ID;
	g_npc_prizoner_c	 <- C_NONE_ID;
	g_npc_prizoner_d	 <- C_NONE_ID;
	
	// リソース読み込み
	local id_togejobo	 = ReadNpc_("m127_01");		// とげジョボー
	local id_saboten	 = ReadNpc_("m064_00");		// サボテンボール
	local id_dessert	 = ReadNpc_("m132_01");		// デザートタンク
	local id_samayou	 = ReadNpc_("m111_00");		// さまようよろい
	
	// ■母親
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
 		if (prison_num < GetFlagID_("CONST_SS_PR_ITTABURU_BOX")) {				// Num6 < 3
			g_npc_mother = ArrangePointNpc_(id_togejobo, "npc_mother000");
			SetScaleSilhouette(g_npc_mother, SCALE.N ,SILHOUETTE_WIDTH.N);
			SetReactorMsg_(g_npc_mother, "REC_NPC_MOTHER");
		}
		else if (prison_num < GetFlagID_("CONST_SS_PR_BOY_WILL_MOTHER_GRIEF")) {	// Num6 < 4
			g_npc_mother = ArrangePointNpc_(id_togejobo, "npc_mother001");
			SetScaleSilhouette(g_npc_mother, SCALE.N ,SILHOUETTE_WIDTH.N);
			SetReactorMsg_(g_npc_mother, "REC_NPC_MOTHER");
			local feel_down = ReadMotion_(g_npc_mother, "m127_01_feel_down_L");// 母親　落ち込むL
			SetMotion_(g_npc_mother, feel_down, BLEND_N);			// 母親　落ち込むL
			SetTalkTurn_(g_npc_mother, false);	// 話しかけても振り向かない
		}
		else if (prison_num < GetFlagID_("CONST_SS_PR_ITTABURU_PRISON_1ST")) {		// Num6 < 6
			g_npc_mother = ArrangePointNpc_(id_togejobo, "npc_mother001_b");
			SetScaleSilhouette(g_npc_mother, SCALE.N ,SILHOUETTE_WIDTH.N);
			SetReactorMsg_(g_npc_mother, "REC_NPC_MOTHER");
			if (prison_num == GetFlagID_("CONST_SS_PR_BOY_WILL_MOTHER_GRIEF")) {	// Num6 == 4
				local feel_down = ReadMotion_(g_npc_mother, "m127_01_feel_down_L");// 母親　落ち込むL
				SetMotion_(g_npc_mother, feel_down, BLEND_N);			// 母親　落ち込むL
			}
		}
		else {
			g_npc_mother = ArrangePointNpc_(id_togejobo, "npc_mother002");
			SetScaleSilhouette(g_npc_mother, SCALE.N ,SILHOUETTE_WIDTH.N);
			SetReactorMsg_(g_npc_mother, "REC_NPC_MOTHER");
		}
	}
	else {
		g_npc_mother = ArrangePointNpc_(id_togejobo, "npc_mother002");
		SetScaleSilhouette(g_npc_mother, SCALE.N ,SILHOUETTE_WIDTH.N);
		SetReactorMsg_(g_npc_mother, "REC_NPC_MOTHER");
	}
	
	// ■少年
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_ITTABURU_BOX")) {					// Num6 < 3
			g_npc_boy = ArrangePointNpc_(id_togejobo, "npc_boy000");
			SetScaleSilhouette(g_npc_boy, SCALE.S ,SILHOUETTE_WIDTH.S);
			SetReactorMsg_(g_npc_boy, "REC_NPC_BOY");
		}
		else if (prison_num < GetFlagID_("CONST_SS_PR_SUBSTITUTE_PLAYER")) {		// Num6 < 5
			g_npc_boy = ArrangePointNpc_(id_togejobo, "npc_boy001");
			SetScaleSilhouette(g_npc_boy, SCALE.S ,SILHOUETTE_WIDTH.S);
			SetReactorMsg_(g_npc_boy, "REC_NPC_BOY");
			local feel_down = ReadMotion_(g_npc_boy, "m127_01_feel_down_L");// 少年　落ち込むL
			SetMotion_(g_npc_boy, feel_down, BLEND_N);			// 少年　落ち込むL
			SetTalkTurn_(g_npc_boy, false);	// 話しかけても振り向かない
		}
		else if (prison_num < GetFlagID_("CONST_SS_PR_ITTABURU_PRISON_1ST")) {		// Num6 < 6
			g_npc_boy = ArrangePointNpc_(id_togejobo, "npc_boy001_b");
			SetScaleSilhouette(g_npc_boy, SCALE.S ,SILHOUETTE_WIDTH.S);
			SetReactorMsg_(g_npc_boy, "REC_NPC_BOY");
		}
		else {
			g_npc_boy = ArrangePointNpc_(id_togejobo, "npc_boy002");
			SetScaleSilhouette(g_npc_boy, SCALE.S ,SILHOUETTE_WIDTH.S);
			SetReactorMsg_(g_npc_boy, "REC_NPC_BOY");
		}
	}
	else {
		g_npc_boy = ArrangePointNpc_(id_togejobo, "npc_boy002");
		SetScaleSilhouette(g_npc_boy, SCALE.S ,SILHOUETTE_WIDTH.S);
		SetReactorMsg_(g_npc_boy, "REC_NPC_BOY");
	}
	
	// ■アロイパーク住人Ａ－Ｄ
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num > GetFlagID_("CONST_SS_PR_ALLOY_PARK_RESIDENT")				// Num6 > 2
		&& prison_num < GetFlagID_("CONST_SS_PR_ITTABURU_PRISON_1ST")) {			// Num6 < 6
			g_npc_aroi_a = ArrangePointNpc_(id_saboten, "npc_aroi_a002");
			SetScaleSilhouette(g_npc_aroi_a, SCALE.SABOTENBOUL,SILHOUETTE_WIDTH.SABOTENBOUL);
			SetReactorMsg_(g_npc_aroi_a, "REC_NPC_SABOTENBOUL");
			
			g_npc_aroi_b = ArrangePointNpc_(id_dessert, "npc_aroi_b002");
			SetScaleSilhouette(g_npc_aroi_b, SCALE.DEZATOTANKU,SILHOUETTE_WIDTH.DEZATOTANKU);
			SetReactorMsg_(g_npc_aroi_b, "REC_NPC_DEZATOTANKU");
			
			g_npc_aroi_c = ArrangePointNpc_(id_saboten, "npc_aroi_c002");
			SetScaleSilhouette(g_npc_aroi_c, SCALE.SABOTENBOUL,SILHOUETTE_WIDTH.SABOTENBOUL);
			SetReactorMsg_(g_npc_aroi_c, "REC_NPC_SABOTENBOUL");
			
			g_npc_aroi_d = ArrangePointNpc_(id_dessert, "npc_aroi_d002");
			SetScaleSilhouette(g_npc_aroi_d, SCALE.DEZATOTANKU,SILHOUETTE_WIDTH.DEZATOTANKU);
			SetReactorMsg_(g_npc_aroi_d, "REC_NPC_DEZATOTANKU");
		}
		else {
			g_npc_aroi_a = ArrangePointNpc_(id_saboten, "npc_aroi_a000");
			SetScaleSilhouette(g_npc_aroi_a, SCALE.SABOTENBOUL,SILHOUETTE_WIDTH.SABOTENBOUL);
			SetReactorMsg_(g_npc_aroi_a, "REC_NPC_SABOTENBOUL");
			
			g_npc_aroi_b = ArrangePointNpc_(id_dessert, "npc_aroi_b000");
			SetScaleSilhouette(g_npc_aroi_b, SCALE.DEZATOTANKU,SILHOUETTE_WIDTH.DEZATOTANKU);
			SetReactorMsg_(g_npc_aroi_b, "REC_NPC_DEZATOTANKU");
			
			g_npc_aroi_c = ArrangePointNpc_(id_saboten, "npc_aroi_c000");
			SetScaleSilhouette(g_npc_aroi_c, SCALE.SABOTENBOUL,SILHOUETTE_WIDTH.SABOTENBOUL);
			SetReactorMsg_(g_npc_aroi_c, "REC_NPC_SABOTENBOUL");
			
			g_npc_aroi_d = ArrangePointNpc_(id_dessert, "npc_aroi_d000");
			SetScaleSilhouette(g_npc_aroi_d, SCALE.DEZATOTANKU,SILHOUETTE_WIDTH.DEZATOTANKU);
			SetReactorMsg_(g_npc_aroi_d, "REC_NPC_DEZATOTANKU");
		}
	}
	else {
		g_npc_aroi_a = ArrangePointNpc_(id_saboten, "npc_aroi_a000");
			SetScaleSilhouette(g_npc_aroi_a, SCALE.SABOTENBOUL,SILHOUETTE_WIDTH.SABOTENBOUL);
		SetReactorMsg_(g_npc_aroi_a, "REC_NPC_SABOTENBOUL");
		
		g_npc_aroi_b = ArrangePointNpc_(id_dessert, "npc_aroi_b000");
			SetScaleSilhouette(g_npc_aroi_b, SCALE.DEZATOTANKU,SILHOUETTE_WIDTH.DEZATOTANKU);
		SetReactorMsg_(g_npc_aroi_b, "REC_NPC_DEZATOTANKU");
		
		g_npc_aroi_c = ArrangePointNpc_(id_saboten, "npc_aroi_c000");
			SetScaleSilhouette(g_npc_aroi_c, SCALE.SABOTENBOUL,SILHOUETTE_WIDTH.SABOTENBOUL);
		SetReactorMsg_(g_npc_aroi_c, "REC_NPC_SABOTENBOUL");
		
		g_npc_aroi_d = ArrangePointNpc_(id_dessert, "npc_aroi_d000");
			SetScaleSilhouette(g_npc_aroi_d, SCALE.DEZATOTANKU,SILHOUETTE_WIDTH.DEZATOTANKU);
		SetReactorMsg_(g_npc_aroi_d, "REC_NPC_DEZATOTANKU");
	}
	
	// ■道具屋
	g_npc_item = ArrangePointNpc_(id_dessert, "npc_item000");
	SetSearchableAngle_(g_npc_item, SEARCHABLE_ANGLE_MINIMUM);		// 正面30度から 話しかけ可能
	SetScaleSilhouette(g_npc_item, SCALE.DEZATOTANKU,SILHOUETTE_WIDTH.DEZATOTANKU);
	SetReactorMsg_(g_npc_item, "REC_NPC_DEZATOTANKU");
	SetTalkCameraType_(g_npc_item, TALK_CAMERA_UP);		//カメラの設定
	SetTalkCameraEyeOffset_(g_npc_item, 0.0, -20.0);	//カメラの位置の調整
	
	// ■宿屋
	g_npc_inn = ArrangePointNpc_(id_saboten, "npc_inn000");
	SetSearchableAngle_(g_npc_inn, SEARCHABLE_ANGLE_MINIMUM);		// 正面30度から 話しかけ可能
	SetScaleSilhouette(g_npc_inn, SCALE.SABOTENBOUL,SILHOUETTE_WIDTH.SABOTENBOUL);
	SetReactorMsg_(g_npc_inn, "REC_NPC_SABOTENBOUL");
	SetTalkCameraType_(g_npc_inn, TALK_CAMERA_UP);		//カメラの設定
	SetTalkCameraEyeOffset_(g_npc_inn, -3.0, -5.0);		//カメラの位置の調整
//	SetTalkCameraTargetOffset_(g_npc_inn, -5.0, 0.0);	//カメラの位置の調整
	
	// ■囚人Ｂ－Ｄ
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_ITTABURU_WIN")) {					// Num6 < 27
			// 配置しない
		}
		else {
			g_npc_prizoner_b = ArrangePointNpc_(id_saboten, "npc_prisoner_b000");
			SetScaleSilhouette(g_npc_prizoner_b, SCALE.SABOTENBOUL,SILHOUETTE_WIDTH.SABOTENBOUL);
			SetReactorMsg_(g_npc_prizoner_b, "REC_NPC_SABOTENBOUL");

			g_npc_prizoner_c = ArrangePointNpc_(id_dessert, "npc_prisoner_c000");
			SetScaleSilhouette(g_npc_prizoner_c, SCALE.DEZATOTANKU,SILHOUETTE_WIDTH.DEZATOTANKU);
			SetReactorMsg_(g_npc_prizoner_c, "REC_NPC_DEZATOTANKU");

			g_npc_prizoner_d = ArrangePointNpc_(id_saboten, "npc_prisoner_d000");
			SetScaleSilhouette(g_npc_prizoner_d, SCALE.SABOTENBOUL,SILHOUETTE_WIDTH.SABOTENBOUL);
			SetReactorMsg_(g_npc_prizoner_d, "REC_NPC_SABOTENBOUL");
		}
	}
	else {
		g_npc_prizoner_b = ArrangePointNpc_(id_saboten, "npc_prisoner_b000");
		SetScaleSilhouette(g_npc_prizoner_b, SCALE.SABOTENBOUL,SILHOUETTE_WIDTH.SABOTENBOUL);
		SetReactorMsg_(g_npc_prizoner_b, "REC_NPC_SABOTENBOUL");

		g_npc_prizoner_c = ArrangePointNpc_(id_dessert, "npc_prisoner_c000");
		SetScaleSilhouette(g_npc_prizoner_c, SCALE.DEZATOTANKU,SILHOUETTE_WIDTH.DEZATOTANKU);
		SetReactorMsg_(g_npc_prizoner_c, "REC_NPC_DEZATOTANKU");

		g_npc_prizoner_d = ArrangePointNpc_(id_saboten, "npc_prisoner_d000");
		SetScaleSilhouette(g_npc_prizoner_d, SCALE.SABOTENBOUL,SILHOUETTE_WIDTH.SABOTENBOUL);
		SetReactorMsg_(g_npc_prizoner_d, "REC_NPC_SABOTENBOUL");
	}
	
	//-----------
	// ▼地雷配置
	//-----------
	// ID初期化
	g_mine_itta_box		 <- C_NONE_ID;
	g_mine_reactor		 <- C_NONE_ID;
	g_mine_gate			 <- C_NONE_ID;
	g_mine_gate_exit	 <- C_NONE_ID;
	
	// ■イッタブルの箱
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_ITTABURU_BOX")) {					// Num6 < 3
			// 配置しない
		}
		else if (prison_num < GetFlagID_("CONST_SS_PR_ITTABURU_PRISON_1ST")) {		// Num6 < 6
			g_mine_itta_box = SetPointCircleEventMine_("mine_ittaburu_box", true);
		}
	}
	
	// ■ルキヤのリアクター
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_INVULNERABILITY_PLAYER")) {		// Num6 = 28
			g_mine_reactor = SetPointCircleEventMine_("mine_reactor", true);
		}
	}
	
	// ■監獄塔の門
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_ITTABURU_PRISON_1ST")) {			// Num6 < 6
			g_mine_gate = SetPointBoxEventMine_("mine_gate", true);
		}
	}

	// ■フィールドへの門
	local bit_kigurumi = GetEventFlg_("BFG_PUT_ON_MONSTER_SUIT");	// Bit_24 キグルミ状態フラグ
	if (bit_kigurumi == true) {
		g_mine_gate_exit = SetPointBoxEventMine_("mine_gate_exit", true);
	}

	//-------------------------
	// ▼ナビマップアイコン配置
	//-------------------------
	// ■「！」
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_SUBSTITUTE_PLAYER")) {			// Num6 = 5
			local exclamation01 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "gmk_ittaburu_box");  // イッタブルの箱
		}
	}

	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_INVULNERABILITY_PLAYER")) {		// Num6 = 28
			local exclamation02 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "mine_reactor");  // ルキヤのリアクター
		}
	}

	//-------------------------
	// ▼リアクターポイント配置
	//-------------------------
	// ■鉄の箱
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_ITTABURU_BOX")) {					// Num6 < 3
			// 配置しない
		}
		else if (prison_num < GetFlagID_("CONST_SS_PR_ITTABURU_PRISON_1ST")) {		// Num6 < 6
			local reactorPoint01 = ArrangeMsgReactorPoint("recPoint_01_box", GetFlagID_("BFG_REACTER_POINT_072")// Bit_1571 鉄の箱
				, SHORT_DIST, "REC_POINT_01", "REC_POINT_01_2");
		}
	}

	// ■監獄扉
	local reactorPoint02 = ArrangeMsgReactorPoint("recPoint_02_door", GetFlagID_("BFG_REACTER_POINT_073")// Bit_1572 監獄扉
		, SHORT_DIST, "REC_POINT_02", "REC_POINT_02_2");

	// ■燃料タンク （２と３は削除されたのでコメント化）
	local reactorPoint03_1 = ArrangeMsgReactorPoint("recPoint_03_tank01", GetFlagID_("BFG_REACTER_POINT_074")// Bit_1573 燃料タンク
		, SHORT_DIST, "REC_POINT_03", "REC_POINT_03_2");

	EventEnd_();
}


//------------------------------------------------
//		フィールド操作開始
//------------------------------------------------
function EventStartOperate()
{
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");			// Num0
	prison_num	 = GetNumFlg_("NUM_SCENARIO_SUB_PRISON");	// Num6
		
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {									// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_GO_TO_THE_PRISON")) {					// Num6 = 1
			SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_PR_ALLOY_PARK_RESIDENT"));		// Num6 <- 2
			
			// Demo401[アロイパークの住人たち]再生
			EventStartChangeDemo(401, FADE_COLOR_BLACK);
		}
		else if (prison_num == GetFlagID_("CONST_SS_PR_ITTABURU_WIN")) {				// Num6 = 27
			SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_PR_INVULNERABILITY_PLAYER"));	// Num6 <- 28
			
			SetReturnDemoPosDir_(Vec3(-79.189, 0, 25.519), -33);

			// Demo421[不死身の主人公]再生
			EventStartChangeDemo(421, FADE_COLOR_BLACK);
		}
	}

	// ■キグルミの着せ替え直後の母親のメッセージ
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_MEETING_02")) {				// Num6 < 13
			// BitFlag取得
			local bit_kigurumi_after = GetEventFlg_("BFG_DISPLAYED_MONSTER_MOTHER_MSG");// Bit_1240 キグルミ直後フラグ
			if (bit_kigurumi_after) {
				WaitFade_();
				local bit_kigurumi = GetEventFlg_("BFG_PUT_ON_MONSTER_SUIT");		// Bit_24 キグルミ状態フラグ
				if (!bit_kigurumi) {
					SetTalkAction_(g_npc_mother);
					OpenMsgWnd_();
					SetTalkName_("NAME_TAG_BOYS_MOTHER");
					ShowMsg_("NPC_MOTHER_MSG_052");		// 「では キグルミは おあずかりしておきます。
					KeyInputWait_();
					CloseMsgWnd_();

					SetEventFlg_("BFG_DISPLAYED_MONSTER_MOTHER_MSG", false);	// Bit_1240 キグルミ直後フラグ
				}
				else {
					SetTalkAction_(g_npc_mother);
					OpenMsgWnd_();
					SetTalkName_("NAME_TAG_BOYS_MOTHER");
					ShowMsg_("NPC_MOTHER_MSG_056");		// 「では……その格好で
					KeyInputWait_();
					CloseMsgWnd_();

					SetEventFlg_("BFG_DISPLAYED_MONSTER_MOTHER_MSG", false);	// Bit_1240 キグルミ直後フラグ
				}
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
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");			// Num0
	prison_num	 = GetNumFlg_("NUM_SCENARIO_SUB_PRISON");	// Num6
	
	local target = GetTargetId_();
	
	DebugPrint("ID: " + target + " に接触 [TouchNpc]");
	
	switch (target) {
	case g_npc_mother :
		uTalkMother();
		break;
	case g_npc_boy :
		uTalkBoy();
		break;
	case g_npc_aroi_a :
		uTalkAroiA();
		break;
	case g_npc_aroi_b :
		uTalkAroiB();
		break;
	case g_npc_aroi_c :
		uTalkAroiC();
		break;
	case g_npc_aroi_d :
		uTalkAroiD();
		break;
	case g_npc_item :
		uTalkItem();
		break;
	case g_npc_inn :
		uTalkInn();
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
	case g_mine_itta_box :
		uMineIttaburuBox();
		break;
	case g_mine_gate :
		uMineGate();
		break;
	case g_mine_gate_exit :
		uMineGateExit();
		break;
	case g_mine_reactor :
		uMineReactor();
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
//		母親 会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkMother()
{
	local sky_num		 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");					// Num9
	local bit_sinario_clesr	 = GetEventFlg_("BFG_SCENARIO_CLEAR_ALL");				// Bit_46 シナリオクリア
	
	if(bit_sinario_clesr == true){							// Bit_46 シナリオクリア
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_BOYS_MOTHER");
		ShowMsg_("NPC_MOTHER_MSG_180");				// 「まぁ！ よく 来てくださいました。
		KeyInputWait_();
		CloseMsgWnd_();
	}
	else if (main_num == GetFlagID_("CONST_SM_PRISON")) {							// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_ITTABURU_BOX")) {					// Num6 < 3
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_BOYS_MOTHER");
			ShowMsg_("NPC_MOTHER_MSG_010");			// 「イッタブルは 定期的に
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (prison_num < GetFlagID_("CONST_SS_PR_BOY_WILL_MOTHER_GRIEF")) {	// Num6 < 4
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_BOYS_MOTHER");
			ShowMsg_("NPC_MOTHER_MSG_020");			// 「どうして……ウチの子ばかり……！
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (prison_num < GetFlagID_("CONST_SS_PR_SUBSTITUTE_PLAYER")) {		// Num6 < 5
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_BOYS_MOTHER");
			ShowMsg_("NPC_MOTHER_MSG_030");			// 「……えっ？ あなたが 息子の代わりに
			KeyInputWait_();
			
			// 「はい」
			if (GetQueryResult_() == QUERY2_0) {
				CloseMsgWnd_();
				
				SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_PR_SUBSTITUTE_PLAYER"));	// Num6 <- 5
				SetEventFlg_("BFG_RIDE_INPUT_PROHIBIT", true);			// BIT_435 ライド操作禁止フラグ
				SetEventFlg_("BFG_PLAYERABILITY_PROHIBIT", true);		// BIT_456 プレイヤー特技禁止フラグ
				
				// BitFlag取得
				local bit_kigurumi = GetEventFlg_("BFG_PUT_ON_MONSTER_SUIT");		// Bit_24 キグルミ状態フラグ

				if (!bit_kigurumi) {
					// 主人公 キグルミ状態 開始
					SetEventFlg_("BFG_PUT_ON_MONSTER_SUIT", true);		// Bit_24 キグルミ状態フラグ
				}
				SetReturnDemoPosDir_(Vec3(-54.38, 0.0, 230.9), 172);
				// Demo404[みがわりは主人公]再生
				TouchNpcChangeDemo(404);
			}
			// 「いいえ」
			else {
				ShowMsg_("NPC_MOTHER_MSG_031");		// 「……空耳だったようですね。ごめんなさい。
				KeyInputWait_();
				CloseMsgWnd_();
			}
		}
		else if (prison_num < GetFlagID_("CONST_SS_PR_MEETING_02")) {				// Num6 < 13
			// BitFlag取得
			local bit_kigurumi = GetEventFlg_("BFG_PUT_ON_MONSTER_SUIT");		// Bit_24 キグルミ状態フラグ

			if (bit_kigurumi) {
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_BOYS_MOTHER");
				ShowMsg_("NPC_MOTHER_MSG_050");		// 「今なら まだ 時間があります。
				KeyInputWait_();
			
				// 「はい」
				if (GetQueryResult_() == QUERY2_0) {
					ShowMsg_("NPC_MOTHER_MSG_051");		// 「そうですか……わかりました。
					KeyInputWait_();
					CloseMsgWnd_();
					
					// 暗転
					SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
					SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
					WaitFade_();

					// BitFlag設定
					SetEventFlg_("BFG_RIDE_INPUT_PROHIBIT", false);			// BIT_435 ライド操作禁止フラグ
					SetEventFlg_("BFG_PLAYERABILITY_PROHIBIT", false);		// BIT_456 プレイヤー特技禁止フラグ
					SetEventFlg_("BFG_PUT_ON_MONSTER_SUIT", false);			// Bit_24 キグルミ状態フラグ
					SetEventFlg_("BFG_DISPLAYED_MONSTER_MOTHER_MSG", true);	// Bit_1240 キグルミ直後フラグ

					PlaySE_("SE_DEM_076");

					ChangeMapPosDir_("S01_00", Vec3(-29.14, 0.0, 233.95), 138);
				}
				// 「いいえ」
				else {
					ShowMsg_("NPC_MOTHER_MSG_053");		// 「その……こんなことを 私が言うのは
					KeyInputWait_();
					CloseMsgWnd_();
				}
			}
			else {
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_BOYS_MOTHER");
				ShowMsg_("NPC_MOTHER_MSG_054");		// 「<name_player/>さん……
				KeyInputWait_();
			
				// 「はい」
				if (GetQueryResult_() == QUERY2_0) {
					ShowMsg_("NPC_MOTHER_MSG_055");		// 「わかりました。
					KeyInputWait_();
					CloseMsgWnd_();
					
					// 暗転
					SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
					SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
					WaitFade_();

					// BitFlag設定
					SetEventFlg_("BFG_RIDE_INPUT_PROHIBIT", true);			// BIT_435 ライド操作禁止フラグ
					SetEventFlg_("BFG_PLAYERABILITY_PROHIBIT", true);		// BIT_456 プレイヤー特技禁止フラグ
					SetEventFlg_("BFG_PUT_ON_MONSTER_SUIT", true);			// Bit_24 キグルミ状態フラグ
					SetEventFlg_("BFG_DISPLAYED_MONSTER_MOTHER_MSG", true);	// Bit_1240 キグルミ直後フラグ

					PlaySE_("SE_DEM_076");

					ChangeMapPosDir_("S01_00", Vec3(-29.14, 0.0, 233.95), 138);
				}
				// 「いいえ」
				else {
					ShowMsg_("NPC_MOTHER_MSG_057");		// 「そうですか……。
					KeyInputWait_();
					CloseMsgWnd_();
				}
			}
		}
		else if (prison_num < GetFlagID_("CONST_SS_PR_INVULNERABILITY_PLAYER")) {	// Num6 < 28
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_BOYS_MOTHER");
			ShowMsg_("NPC_MOTHER_MSG_080");		// 「ああ どうしましょう。
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (prison_num < GetFlagID_("CONST_SS_PR_RUKIYA_SIGNPOST")) {			// Num6 < 29
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_BOYS_MOTHER");
			ShowMsg_("NPC_MOTHER_MSG_130");		// 「ルキヤさんの　リアクターが　光っている？
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else {
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_BOYS_MOTHER");
			ShowMsg_("NPC_MOTHER_MSG_140");		// 「ルキヤさんは 本当に あなたを心配し……
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else if (main_num == GetFlagID_("CONST_SM_SKY")){								// Num0 = 8
		if(sky_num < GetFlagID_("CONST_SS_SK_GO_VOLCANO_SKY")){					// Num9 < 36
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_BOYS_MOTHER");
			ShowMsg_("NPC_MOTHER_MSG_160");			// 「ああ <name_player/>さん！
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else {
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_BOYS_MOTHER");
			ShowMsg_("NPC_MOTHER_MSG_170");			// 「あの子が 言っておりました。
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else {
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_BOYS_MOTHER");
		ShowMsg_("NPC_MOTHER_MSG_140");			// 「ルキヤさんは 本当に あなたを心配し……
		KeyInputWait_();
		CloseMsgWnd_();
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		少年 会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkBoy()
{
	local sky_num		 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");					// Num9
	local bit_sinario_clesr	 = GetEventFlg_("BFG_SCENARIO_CLEAR_ALL");				// Bit_46 シナリオクリア
	
	if(bit_sinario_clesr == true){							// Bit_46 シナリオクリア
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_MONSTER_BOY");
		ShowMsg_("NPC_BOY_MSG_180");				// 「お兄さん モンスターマスターって
		KeyInputWait_();
		CloseMsgWnd_();
	}
	else if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_ITTABURU_BOX")) {						// Num6 < 3
			SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_PR_ITTABURU_BOX"));			// Num6 <- 3
			
			// デモ再生後の復帰位置
			SetReturnDemoPosDir_(Vec3(-193.347, 0.114, 208.489), 69);
			
			// Demo402[イッタブルのハコ]再生
			TouchNpcChangeDemo(402);
		}
		else if (prison_num < GetFlagID_("CONST_SS_PR_BOY_WILL_MOTHER_GRIEF")) {		// Num6 < 4
			SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_PR_BOY_WILL_MOTHER_GRIEF"));	// Num6 <- 4
			
			SetReturnDemoPosDir_(Vec3(-47.82, 0.0, 249.92), 137);
			// Demo403[少年の決意と母親のなげき]再生
			TouchNpcChangeDemo(403);
		}
		else if (prison_num < GetFlagID_("CONST_SS_PR_SUBSTITUTE_PLAYER")) {			// Num6 < 5
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_MONSTER_BOY");
			ShowMsg_("NPC_BOY_MSG_030");		// 「もしも 監獄で ルキヤに会ったら
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (prison_num < GetFlagID_("CONST_SS_PR_MEETING_02")) {					// Num6 < 13
			local bit_kigurumi = GetEventFlg_("BFG_PUT_ON_MONSTER_SUIT");		// Bit_24 キグルミ状態フラグ
			if (bit_kigurumi) {
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_MONSTER_BOY");
				ShowMsg_("NPC_BOY_MSG_050");		// 「お兄さん……ありがとう。
				KeyInputWait_();
				CloseMsgWnd_();
			}
			else {
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_MONSTER_BOY");
				ShowMsg_("NPC_BOY_MSG_051");		// 「あれ？ キグルミを 脱いじゃったの？
				KeyInputWait_();
				CloseMsgWnd_();
			}
		}
		else if (prison_num < GetFlagID_("CONST_SS_PR_RESISTANCE_RUKIYA")) {		// Num6 < 15
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_MONSTER_BOY");
			ShowMsg_("NPC_BOY_MSG_080");		// 「お兄さん ルキヤには まだ会えてないの？
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (prison_num < GetFlagID_("CONST_SS_PR_INVULNERABILITY_PLAYER")) {		// Num6 < 28
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_MONSTER_BOY");
			ShowMsg_("NPC_BOY_MSG_100");		// 「えっ！　ルキヤと会えたの！？
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (prison_num < GetFlagID_("CONST_SS_PR_RUKIYA_SIGNPOST")) {				// Num6 < 29
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_MONSTER_BOY");
			ShowMsg_("NPC_BOY_MSG_130");		// 「お……お兄さん！
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else {
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_MONSTER_BOY");
			ShowMsg_("NPC_BOY_MSG_140");		// 「監獄塔の　最上階には　移動装置へと続く
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else if (main_num == GetFlagID_("CONST_SM_SKY")){								// Num0 = 8
		if(sky_num < GetFlagID_("CONST_SS_SK_GO_VOLCANO_SKY")){					// Num9 < 36
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_MONSTER_BOY");
			ShowMsg_("NPC_BOY_MSG_160");			// 「お兄さん！ よかった 無事だったんだね！
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else {
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_MONSTER_BOY");
			ShowMsg_("NPC_BOY_MSG_170");			// 「ここからも見えたよ お兄さん！
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else {
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_MONSTER_BOY");
		ShowMsg_("NPC_BOY_MSG_140");			// 「焦熱の火山にある エルピス山。
		KeyInputWait_();
		CloseMsgWnd_();
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		アロイパーク住人Ａ 会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkAroiA()
{
	local sky_num		 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");					// Num9
	local bit_sinario_clesr	 = GetEventFlg_("BFG_SCENARIO_CLEAR_ALL");				// Bit_46 シナリオクリア
	
	if(bit_sinario_clesr == true){							// Bit_46 シナリオクリア
		OpenMsgWnd_();
		ShowMsg_("NPC_AROI_A_MSG_180");			// 「もう 監獄に 誰も行かなくていいと 思うと
		KeyInputWait_();
		CloseMsgWnd_();
	}
	else if (main_num == GetFlagID_("CONST_SM_PRISON")) {							// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_ITTABURU_BOX")) {					// Num6 < 3
			OpenMsgWnd_();
			ShowMsg_("NPC_AROI_A_MSG_010");		// 「ここは アロイパーク。
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (prison_num < GetFlagID_("CONST_SS_PR_SUBSTITUTE_PLAYER")) {		// Num6 < 5
			OpenMsgWnd_();
			ShowMsg_("NPC_AROI_A_MSG_020");		// 「見ただろう？ あれが イッタブルさ。
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (prison_num < GetFlagID_("CONST_SS_PR_MEETING_02")) {				// Num6 < 13
			local bit_kigurumi = GetEventFlg_("BFG_PUT_ON_MONSTER_SUIT");		// Bit_24 キグルミ状態フラグ
			if (bit_kigurumi) {
				OpenMsgWnd_();
				ShowMsg_("NPC_AROI_A_MSG_050");		// 「ええっと……誰だっけ？
				KeyInputWait_();
				CloseMsgWnd_();
			}
			else {
				OpenMsgWnd_();
				ShowMsg_("NPC_AROI_A_MSG_051");		// 「なぁ……旅の人よ。
				KeyInputWait_();
				CloseMsgWnd_();
			}
		}
		else if (prison_num < GetFlagID_("CONST_SS_PR_INVULNERABILITY_PLAYER")) {	// Num6 < 28
			OpenMsgWnd_();
			ShowMsg_("NPC_AROI_A_MSG_080");		// 「監獄で 何があったんだ？
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else {
			OpenMsgWnd_();
			ShowMsg_("NPC_AROI_A_MSG_130");		// 「聞いたぜ。イッタブルが 死んだらしいな。
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else if (main_num == GetFlagID_("CONST_SM_SKY")){								// Num0 = 8
		if(sky_num < GetFlagID_("CONST_SS_SK_GO_VOLCANO_SKY")){					// Num9 < 36
			OpenMsgWnd_();
			ShowMsg_("NPC_AROI_A_MSG_160");			// 「イッタブルから 自由になったと思ったら
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else {
			OpenMsgWnd_();
			ShowMsg_("NPC_AROI_A_MSG_170");			// 「黒い花粉が 消えてるじゃないか！
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else {
		OpenMsgWnd_();
		ShowMsg_("NPC_AROI_A_MSG_130");			// 「聞いたぜ。イッタブルが 死んだらしいな。
		KeyInputWait_();
		CloseMsgWnd_();
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		アロイパーク住人Ｂ 会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkAroiB()
{
	local sky_num		 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");					// Num9
	local bit_sinario_clesr	 = GetEventFlg_("BFG_SCENARIO_CLEAR_ALL");				// Bit_46 シナリオクリア
	
	if(bit_sinario_clesr == true){							// Bit_46 シナリオクリア
		OpenMsgWnd_();
		ShowMsg_("NPC_AROI_B_MSG_180");			// 「お前には パークの全員が 世話になったけど
		KeyInputWait_();
		CloseMsgWnd_();
	}
	else if (main_num == GetFlagID_("CONST_SM_PRISON")) {							// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_ITTABURU_BOX")) {					// Num6 < 3
			OpenMsgWnd_();
			ShowMsg_("NPC_AROI_B_MSG_010");		// 「お前 イッタブル監獄を見たか？
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (prison_num < GetFlagID_("CONST_SS_PR_SUBSTITUTE_PLAYER")) {		// Num6 < 5
			OpenMsgWnd_();
			ShowMsg_("NPC_AROI_B_MSG_020");		// 「あのハコだけが 監獄とアロイパークを
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (prison_num < GetFlagID_("CONST_SS_PR_MEETING_02")) {				// Num6 < 13
			local bit_kigurumi = GetEventFlg_("BFG_PUT_ON_MONSTER_SUIT");		// Bit_24 キグルミ状態フラグ
			if (bit_kigurumi) {
				OpenMsgWnd_();
				ShowMsg_("NPC_AROI_B_MSG_050");		// 「それって もしかして キグルミか？
				KeyInputWait_();
				CloseMsgWnd_();
			}
			else {
				OpenMsgWnd_();
				ShowMsg_("NPC_AROI_B_MSG_051");		// 「仲間が 監獄の中で どれほど恐ろしい目に
				KeyInputWait_();
				CloseMsgWnd_();
			}
		}
		else if (prison_num < GetFlagID_("CONST_SS_PR_INVULNERABILITY_PLAYER")) {	// Num6 < 28
			OpenMsgWnd_();
			ShowMsg_("NPC_AROI_B_MSG_080");		// 「監獄の門が 開いたってのは
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else {
			OpenMsgWnd_();
			ShowMsg_("NPC_AROI_B_MSG_130");		// 「まだ 監獄の中には イッタブルの手下が
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else if (main_num == GetFlagID_("CONST_SM_SKY")){								// Num0 = 8
		if(sky_num < GetFlagID_("CONST_SS_SK_GO_VOLCANO_SKY")){					// Num9 < 36
			OpenMsgWnd_();
			ShowMsg_("NPC_AROI_B_MSG_160");			// 「空が黒い花粉に 覆われてから
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else {
			OpenMsgWnd_();
			ShowMsg_("NPC_AROI_B_MSG_170");			// 「オレも ここから見てたよ。
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else {
		OpenMsgWnd_();
		ShowMsg_("NPC_AROI_B_MSG_130");			// 「まだ 監獄の中には イッタブルの手下が
		KeyInputWait_();
		CloseMsgWnd_();
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		アロイパーク住人Ｃ 会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkAroiC()
{
	local sky_num		 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");					// Num9
	local bit_sinario_clesr	 = GetEventFlg_("BFG_SCENARIO_CLEAR_ALL");				// Bit_46 シナリオクリア
	
	if(bit_sinario_clesr == true){							// Bit_46 シナリオクリア
		OpenMsgWnd_();
		ShowMsg_("NPC_AROI_C_MSG_180");			// 「実は そのうち旅に出ようと 思ってるんだ。
		KeyInputWait_();
		CloseMsgWnd_();
	}
	else if (main_num == GetFlagID_("CONST_SM_PRISON")) {							// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_ITTABURU_BOX")) {					// Num6 < 3
			OpenMsgWnd_();
			ShowMsg_("NPC_AROI_C_MSG_010");		// 「監獄から ときどき 悲鳴が聞こえるんだ。
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (prison_num < GetFlagID_("CONST_SS_PR_SUBSTITUTE_PLAYER")) {		// Num6 < 5
			OpenMsgWnd_();
			ShowMsg_("NPC_AROI_C_MSG_020");		// 「イッタブルに 逆らうなんてムリさ。
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (prison_num < GetFlagID_("CONST_SS_PR_MEETING_02")) {				// Num6 < 13
			local bit_kigurumi = GetEventFlg_("BFG_PUT_ON_MONSTER_SUIT");		// Bit_24 キグルミ状態フラグ
			if (bit_kigurumi) {
				OpenMsgWnd_();
				ShowMsg_("NPC_AROI_C_MSG_050");		// 「お？ 見かけない顔だな。
				KeyInputWait_();
				CloseMsgWnd_();
			}
			else {
				OpenMsgWnd_();
				ShowMsg_("NPC_AROI_C_MSG_051");		// 「こう言っちゃ なんだけど あの子が
				KeyInputWait_();
				CloseMsgWnd_();
			}
		}
		else if (prison_num < GetFlagID_("CONST_SS_PR_INVULNERABILITY_PLAYER")) {	// Num6 < 28
			OpenMsgWnd_();
			ShowMsg_("NPC_AROI_C_MSG_080");		// 「なんだか知らんが 監獄の奴らが
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (prison_num < GetFlagID_("CONST_SS_PR_LAST_ANSESU_1ST")) {			// Num6 < 30
			OpenMsgWnd_();
			ShowMsg_("NPC_AROI_C_MSG_130");		// 「結局 移動装置は 使えないままなのか？
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else {
			OpenMsgWnd_();
			ShowMsg_("NPC_AROI_C_MSG_150");		// 「移動装置が 使えるように なったのか。
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else if (main_num == GetFlagID_("CONST_SM_SKY")){								// Num0 = 8
		if(sky_num < GetFlagID_("CONST_SS_SK_GO_VOLCANO_SKY")){					// Num9 < 36
			OpenMsgWnd_();
			ShowMsg_("NPC_AROI_C_MSG_160");			// 「また移動装置が 使えなくなってるんだ。
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else {
			OpenMsgWnd_();
			ShowMsg_("NPC_AROI_C_MSG_170");			// 「いまいましい黒い花粉が ようやく消えたな。
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else {
		OpenMsgWnd_();
		ShowMsg_("NPC_AROI_C_MSG_150");			// 「移動装置が 使えるように なったのか。
		KeyInputWait_();
		CloseMsgWnd_();
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		アロイパーク住人Ｄ 会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkAroiD()
{
	local sky_num		 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");					// Num9
	local bit_sinario_clesr	 = GetEventFlg_("BFG_SCENARIO_CLEAR_ALL");				// Bit_46 シナリオクリア
	
	if(bit_sinario_clesr == true){							// Bit_46 シナリオクリア
		OpenMsgWnd_();
		ShowMsg_("NPC_AROI_D_MSG_180");			// 「今日も 元気そうじゃな 勇気ある若者よ。
		KeyInputWait_();
		CloseMsgWnd_();
	}
	else if (main_num == GetFlagID_("CONST_SM_PRISON")) {							// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_ITTABURU_BOX")) {					// Num6 < 3
			OpenMsgWnd_();
			ShowMsg_("NPC_AROI_D_MSG_010");		// 「ルキヤのことを 知らないかじゃと？
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (prison_num < GetFlagID_("CONST_SS_PR_SUBSTITUTE_PLAYER")) {		// Num6 < 5
			OpenMsgWnd_();
			ShowMsg_("NPC_AROI_D_MSG_020");		// 「ルキヤは クチこそ悪いが 世話好きでな。
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (prison_num < GetFlagID_("CONST_SS_PR_MEETING_02")) {				// Num6 < 13
			local bit_kigurumi = GetEventFlg_("BFG_PUT_ON_MONSTER_SUIT");		// Bit_24 キグルミ状態フラグ
			if (bit_kigurumi) {
				OpenMsgWnd_();
				ShowMsg_("NPC_AROI_D_MSG_050");		// 「お前さん もしかして……
				KeyInputWait_();
				CloseMsgWnd_();
			}
			else {
				OpenMsgWnd_();
				ShowMsg_("NPC_AROI_D_MSG_051");		// 「みんな あの子のことを
				KeyInputWait_();
				CloseMsgWnd_();
			}
		}
		else if (prison_num < GetFlagID_("CONST_SS_PR_INVULNERABILITY_PLAYER")) {	// Num6 < 28
			OpenMsgWnd_();
			ShowMsg_("NPC_AROI_D_MSG_080");		// 「この騒ぎ……起こしたのは お前さんか？
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else {
			OpenMsgWnd_();
			ShowMsg_("NPC_AROI_D_MSG_130");		// 「そうか……ルキヤのおかげで
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else if (main_num == GetFlagID_("CONST_SM_SKY")){								// Num0 = 8
		if(sky_num < GetFlagID_("CONST_SS_SK_GO_VOLCANO_SKY")){					// Num9 < 36
			OpenMsgWnd_();
			ShowMsg_("NPC_AROI_D_MSG_160");			// 「アロイパークは……いや 世界は
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else {
			OpenMsgWnd_();
			ShowMsg_("NPC_AROI_D_MSG_170");			// 「……世界は まだ終わらんようじゃな。
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else {
		OpenMsgWnd_();
		ShowMsg_("NPC_AROI_D_MSG_130");			// 「そうか……ルキヤのおかげで
		KeyInputWait_();
		CloseMsgWnd_();
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		道具屋 会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkItem()
{
	local sky_num		 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");					// Num9
	local bit_sinario_clesr	 = GetEventFlg_("BFG_SCENARIO_CLEAR_ALL");				// Bit_46 シナリオクリア
	
	if(bit_sinario_clesr == true){							// Bit_46 シナリオクリア
		OpenMsgWnd_();
		ShowMsg_("NPC_ITEM_MSG_180");			// 「今日も 今日とて 商売繁盛！
		KeyInputWait_();
		CloseMsgWnd_();
	}
	else if (main_num == GetFlagID_("CONST_SM_PRISON")) {							// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_INVULNERABILITY_PLAYER")) {		// Num6 < 28
			OpenMsgWnd_();
			ShowMsg_("NPC_ITEM_MSG_010");		// 「ここは 道具屋だよ。
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else {
			OpenMsgWnd_();
			ShowMsg_("NPC_ITEM_MSG_130");		// 「イッタブルが いなくなっって
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else if (main_num == GetFlagID_("CONST_SM_SKY")){								// Num0 = 8
		if(sky_num < GetFlagID_("CONST_SS_SK_GO_VOLCANO_SKY")){					// Num9 < 36
			OpenMsgWnd_();
			ShowMsg_("NPC_ITEM_MSG_160");			// 「こんな時だからこそ 道具が必要だろ？
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else {
			OpenMsgWnd_();
			ShowMsg_("NPC_ITEM_MSG_170");			// 「商売人は 動じないのが大事なのさ。
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else {
		OpenMsgWnd_();
		ShowMsg_("NPC_ITEM_MSG_130");			// 「イッタブルが いなくなっって
		KeyInputWait_();
		CloseMsgWnd_();
	}
	GotoMenuFadeOpen(MENU_OPEN.S01_00_ITEM);
	//道具屋フロー終了後
	OpenMsgWnd_();
	ShowMsg_("NPC_ITEM_MSG_190");
	KeyInputWait_();
	CloseMsgWnd_();
	
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		宿屋 会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkInn()
{
	local bit_clear = GetEventFlg_("BFG_SCENARIO_CLEAR_SAND");		// Bit_44
	
	local return_pos = Vec3(190.0, 0.0, 8.0);		// 主人公の復帰位置
	local return_dir = 180;							// 主人公の復帰向き
	
	if (main_num <= GetFlagID_("CONST_SM_PRISON")) {								// Num0 <= 5
		if (prison_num < GetFlagID_("CONST_SS_PR_INVULNERABILITY_PLAYER")) {		// Num6 < 28
			OpenMsgWnd_();
			ShowMsg_("NPC_INN_MSG_010");		// 「うちに 泊まりたいのかい？
			KeyInputWait_();
			
			switch (GetQueryResult_()) {
			// 「泊まる」
			case QUERY2_0 :
				CloseMsgWnd_();
				CommTaskInn(return_pos, return_dir, bit_clear, g_npc_inn);
				
				OpenMsgWnd_();
				ShowMsg_("NPC_INN_MSG_012");	// 「早く ここから 立ち去ることだ。
				KeyInputWait_();
				CloseMsgWnd_();
				
				break;
				
			// 「やめる」
			case QUERY2_1 :
				ShowMsg_("NPC_INN_MSG_011");	// 「ああ。そうしたほうがいい。
				KeyInputWait_();
				CloseMsgWnd_();
				
				break;
			default :
				break;
			}
		}
		else {
			OpenMsgWnd_();
			ShowMsg_("NPC_INN_MSG_130");		// 「お客さん！ うちで 休んでいくかい？
			KeyInputWait_();
			
			switch (GetQueryResult_()) {
			// 「泊まる」
			case QUERY2_0 :
				CloseMsgWnd_();
				CommTaskInn(return_pos, return_dir, bit_clear, g_npc_inn);
				
				OpenMsgWnd_();
				ShowMsg_("NPC_INN_MSG_132");	// 「どうだい？ よく 眠れたかい？
				KeyInputWait_();
				CloseMsgWnd_();
				
				break;
				
			// 「やめる」
			case QUERY2_1 :
				ShowMsg_("NPC_INN_MSG_131");	// 「そうかい。無理は するなよ。
				KeyInputWait_();
				CloseMsgWnd_();
				
				break;
			default :
				break;
			}
		}
	}
	else {
		local message_key_1;
		local message_key_2;
		local message_key_3;
		if(GetEventFlg_("BFG_CHECK_INN_FIRST_MSG_ALL") == false){
			// 監獄塔クリア後の宿屋で表示するメッセージを指定(初回)
			message_key_1 = "NPC_INN_MSG_CLEAR_000";
			message_key_2 = "NPC_INN_MSG_CLEAR_001";
			message_key_3 = "NPC_INN_MSG_CLEAR_002";
		}
		else{
			// 監獄塔クリア後の宿屋で表示するメッセージを指定(２回目以降)
			message_key_1 = "NPC_INN_MSG_CLEAR_003";
			message_key_2 = "NPC_INN_MSG_CLEAR_004";
			message_key_3 = "NPC_INN_MSG_CLEAR_005";
		}
		SetEventFlg_("BFG_CHECK_INN_FIRST_MSG_ALL", true);
		OpenMsgWnd_();
		ShowMsg_(message_key_1);		// 「お客さん！ うちで 休んでいくかい？
		KeyInputWait_();
		
		switch (GetQueryResult_())
		{
		// 「泊まる」
		// 「やすむ」
		case QUERY3_0 :
		case QUERY3_1 :
			CloseMsgWnd_();
			CommTaskInn(return_pos, return_dir, bit_clear, g_npc_inn);
			
			OpenMsgWnd_();
			ShowMsg_(message_key_3);	// 「どうだい？ よく 眠れたかい？
			KeyInputWait_();
			CloseMsgWnd_();
			
			break;
			
		// 「やめる」
		case QUERY3_2 :
			ShowMsg_(message_key_2);	// 「そうかい。無理は するなよ。
			KeyInputWait_();
			CloseMsgWnd_();
			
			break;
		default :
			break;
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
	local sky_num		 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");					// Num9
	local bit_sinario_clesr	 = GetEventFlg_("BFG_SCENARIO_CLEAR_ALL");				// Bit_46 シナリオクリア
	
	if(bit_sinario_clesr == true){							// Bit_46 シナリオクリア
		OpenMsgWnd_();
		ShowMsg_("NPC_PRISONER_B_MSG_180");			// 「あの監獄 何かに 使えないか？
		KeyInputWait_();
		CloseMsgWnd_();
	}
	else if (main_num == GetFlagID_("CONST_SM_PRISON")) {							// Num0 = 5
		OpenMsgWnd_();
		ShowMsg_("NPC_PRISONER_B_MSG_130");		// 「監獄の　移動装置を探しているのか？
		KeyInputWait_();
		CloseMsgWnd_();
	}
	else if (main_num == GetFlagID_("CONST_SM_SKY")){								// Num0 = 8
		if(sky_num < GetFlagID_("CONST_SS_SK_GO_VOLCANO_SKY")){					// Num9 < 36
			OpenMsgWnd_();
			ShowMsg_("NPC_PRISONER_B_MSG_160");			// 「せっかくの青い空も あの黒い花粉で台無しだ。
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else {
			OpenMsgWnd_();
			ShowMsg_("NPC_PRISONER_B_MSG_170");			// 「でっかいイッタブルを 倒したのは
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else {
		OpenMsgWnd_();
		ShowMsg_("NPC_PRISONER_B_MSG_130");		// 「監獄の　移動装置を探しているのか？
		KeyInputWait_();
		CloseMsgWnd_();
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
	local sky_num		 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");					// Num9
	local bit_sinario_clesr	 = GetEventFlg_("BFG_SCENARIO_CLEAR_ALL");				// Bit_46 シナリオクリア
	
	if(bit_sinario_clesr == true){							// Bit_46 シナリオクリア
		OpenMsgWnd_();
		ShowMsg_("NPC_PRISONER_C_MSG_180");			// 「これから 息子に 会いに行くんです。
		KeyInputWait_();
		CloseMsgWnd_();
	}
	else if (main_num == GetFlagID_("CONST_SM_PRISON")) {							// Num0 = 5
		OpenMsgWnd_();
		ShowMsg_("NPC_PRISONER_C_MSG_130");		// 「無事で よかった！
		KeyInputWait_();
		CloseMsgWnd_();
	}
	else if (main_num == GetFlagID_("CONST_SM_SKY")){								// Num0 = 8
		if(sky_num < GetFlagID_("CONST_SS_SK_GO_VOLCANO_SKY")){					// Num9 < 36
			OpenMsgWnd_();
			ShowMsg_("NPC_PRISONER_C_MSG_160");			// 「今……世界に 何が起きてるんです？
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else {
			OpenMsgWnd_();
			ShowMsg_("NPC_PRISONER_C_MSG_170");			// 「あの巨大な イッタブルの姿を見ていたら
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else {
		OpenMsgWnd_();
		ShowMsg_("NPC_PRISONER_C_MSG_130");		// 「無事で よかった！
		KeyInputWait_();
		CloseMsgWnd_();
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
	local sky_num		 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");					// Num9
	local bit_sinario_clesr	 = GetEventFlg_("BFG_SCENARIO_CLEAR_ALL");				// Bit_46 シナリオクリア
	
	if(bit_sinario_clesr == true){							// Bit_46 シナリオクリア
		OpenMsgWnd_();
		ShowMsg_("NPC_PRISONER_D_MSG_180");			// 「もしも またイッタブルみたいな奴が 現れたら
		KeyInputWait_();
		CloseMsgWnd_();
	}
	else if (main_num == GetFlagID_("CONST_SM_PRISON")) {							// Num0 = 5
		OpenMsgWnd_();
		ShowMsg_("NPC_PRISONER_D_MSG_130");		// 「あのバケモノは イッタブルに改造された
		KeyInputWait_();
		CloseMsgWnd_();
	}
	else if (main_num == GetFlagID_("CONST_SM_SKY")){								// Num0 = 8
		if(sky_num < GetFlagID_("CONST_SS_SK_GO_VOLCANO_SKY")){					// Num9 < 36
			OpenMsgWnd_();
			ShowMsg_("NPC_PRISONER_D_MSG_160");			// 「あの黒い花粉……ブレイクモンスターと
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else {
			OpenMsgWnd_();
			ShowMsg_("NPC_PRISONER_D_MSG_170");			// 「イッタブルが 黒い花粉を 呼び集めてたのか？
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else {
		OpenMsgWnd_();
		ShowMsg_("NPC_PRISONER_D_MSG_130");		// 「あのバケモノは イッタブルに改造された
		KeyInputWait_();
		CloseMsgWnd_();
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		イッタブルの箱を調べた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineIttaburuBox()
{
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_SUBSTITUTE_PLAYER")) {				// Num6 < 5
			CommPlayerTurnAroundObj(g_gmk_itta_box);
			OpenMsgWnd_();
			ShowMsg_("SYSTEM_MSG_000");		// イッタブルの 置いていった ハコがある。
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (prison_num < GetFlagID_("CONST_SS_PR_ITTABURU_PRISON_1ST")) {		// Num6 < 6
			local bit_kigurumi = GetEventFlg_("BFG_PUT_ON_MONSTER_SUIT");		// Bit_24 キグルミ状態フラグ
			if (bit_kigurumi) {
				CommPlayerTurnAroundObj(g_gmk_itta_box);
				OpenMsgWnd_();
				ShowMsg_("SYSTEM_MSG_003");		// イッタブルの 置いていった ハコがある。
				KeyInputWait_();
				// 「はい」
				if (GetQueryResult_() == QUERY2_0) {
					CloseMsgWnd_();
					SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_PR_ITTABURU_PRISON_2ND"));	// Num6 <- 7
					
					// デモ再生後の復帰位置
					SetReturnDemoMap_("S02_00");
					SetReturnDemoPosDir_(Vec3(232, 0, 244), -176);
					
					// Demo405[イッタブル監獄へ①]（アロイパーク）再生
					StopBgmChangeDemo(405);
				}
				// 「いいえ」
				else {
					CloseMsgWnd_();
				}
			}
			else {
				CommPlayerTurnAroundObj(g_gmk_itta_box);
				OpenMsgWnd_();
				ShowMsg_("SYSTEM_MSG_004");		// イッタブルの 置いていった ハコがある。
				KeyInputWait_();
				CloseMsgWnd_();
			}
		}
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		監獄塔の門 を調べた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineGate()
{
	local player = GetPlayerId_();

	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_ITTABURU_PRISON_1ST")) {			// Num6 < 6
			local pos  = Vec3(-98.3, 0.0, -281.6);
			uPlayerTurnAroundPos(pos);
	
			OpenMsgWnd_();
			ShowMsg_("SYSTEM_MSG_002");		// 扉は かたく閉ざされている……。
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		フィールドへの門 を調べた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineGateExit()
{
	local player = GetPlayerId_();

	local bit_kigurumi = GetEventFlg_("BFG_PUT_ON_MONSTER_SUIT");	// Bit_24 キグルミ状態フラグ
	if (bit_kigurumi == true) {
		local pos  = Vec3(191.0, 0.0, 358.2);
		uPlayerTurnAroundPos(pos);

		PlaySE_("SE_FLD_135");	//【リアクター反応あり】表示
		Wait_(30);
	
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_REACTOR");	// リアクター
		ShowMsg_("REC_MSG_000");			// 仮「今の姿では 自由な行動は できません。
		KeyInputWait_();
		CloseMsgWnd_();
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		ルキヤのリアクターを調べた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineReactor()
{
	local player = GetPlayerId_();

	local pos  = Vec3(-104.6, 0.0, 45.0);
	uPlayerTurnAroundPos(pos);
	
	OpenMsgWnd_();
	ShowMsg_("SYSTEM_MSG_001");			// ルキヤのリアクターが 光っている。
	KeyInputWait_();
	
	// 「はい」
	if (GetQueryResult_() == QUERY2_0) {
		CloseMsgWnd_();
		
		SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_PR_RUKIYA_SIGNPOST"));	// Num6 <- 29
		
		SetReturnDemoPosDir_(Vec3(-85.9, 0, 39.8), -24);
		// Demo422[ルキヤが遺した道しるべ]再生
		TouchNpcChangeDemo(422);
	}
	// 「いいえ」
	else {
		CloseMsgWnd_();
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


