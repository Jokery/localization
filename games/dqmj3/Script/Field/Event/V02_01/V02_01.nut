//===================== V02_01秘密基地B1F(エイリアスルーム) ====================
// 変数定義
main_num	 <- C_NONE_ID;
volcano_num	 <- C_NONE_ID;
player <- C_NONE_ID;

str_num_sub <- "NUM_SCENARIO_SUB_VOLCANO";

//------------------------------------------------
//		戦闘終了後
//------------------------------------------------
function AfterBattle()
{
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");
	volcano_num	 = GetNumFlg_("NUM_SCENARIO_SUB_VOLCANO");

	if (main_num == GetFlagID_("CONST_SM_VOLCANO"))										// Num0 = 6 
	{
		if (volcano_num == GetFlagID_("CONST_SS_HV_JDG_BATTLE_PROMETHEUS")) 			// Num7 = 27
		{
			// プロメテウスに敗北
			if(GetBattleEndType_() == END_TYPE_LOSE)
			{
				SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_HV_CONTACT_PROMETHEUS"));	// Num7 <- 28
			}
		}
		//再戦時
		if (volcano_num == GetFlagID_("CONST_SS_HV_JDG_REMATCH_PROMETHEUS")) 			// Num7 = 30
		{
			// プロメテウスに敗北
			if(GetBattleEndType_() == END_TYPE_LOSE)
			{
				SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_HV_CONTACT_PROMETHEUS"));	// Num7 <- 28
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
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");
	volcano_num	 = GetNumFlg_("NUM_SCENARIO_SUB_VOLCANO");
	
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
	//マップ到達フラグ
	SetEventFlg_("BFG_ARRIVE_AT_V00", true);

	local check_dead	= GetEventFlg_("BFG_DEAD_RETURN");
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");
	volcano_num	 = GetNumFlg_("NUM_SCENARIO_SUB_VOLCANO");
	
	DebugPrint(" ");
	DebugPrint("NUM_SCENARIO_MAIN の値は " + main_num + " になりました。");
	DebugPrint("NUM_SCENARIO_SUB_VOLCANO の値は " + volcano_num + " になりました。");

	//---------------
	// ▼ギミック配置
	//---------------
	// ID初期化
	g_gmk_elevator_door <- C_NONE_ID;
	g_gmk_elevator_lift <- C_NONE_ID;
	g_gmk_door01 <- C_NONE_ID;
	g_gmk_door02 <- C_NONE_ID;
	g_gmk_door03 <- C_NONE_ID;
//	g_gmk_case01 <- C_NONE_ID;
//	g_gmk_case02 <- C_NONE_ID;
//	g_gmk_case03 <- C_NONE_ID;
//	g_gmk_case04 <- C_NONE_ID;
//	g_gmk_case05 <- C_NONE_ID;
//	g_gmk_case06 <- C_NONE_ID;
//	g_gmk_case07 <- C_NONE_ID;
//	g_gmk_case08 <- C_NONE_ID;
//	g_gmk_case09 <- C_NONE_ID;
//	g_gmk_case10 <- C_NONE_ID;
//	g_gmk_case11 <- C_NONE_ID;
//	g_gmk_case12 <- C_NONE_ID;
//	g_gmk_case13 <- C_NONE_ID;
//	g_gmk_case14 <- C_NONE_ID;
	g_gmk_monitor <- C_NONE_ID;
	g_gmk_ruler_point <- C_NONE_ID;
	
	// リソース読み込み
	local id_elevator_door = ReadGimmick_("o_V02_02");	// エレベータの扉
	local id_elevator_lift = ReadGimmick_("o_V02_03");	// エレベータのリフト
	local id_door = ReadGimmick_("o_V02_09");	// 扉
	local id_case = ReadGimmick_("o_V02_10");	// コールドスリープのケース
	local id_monitor = ReadGimmick_("o_V02_11");	// コンピュータの明滅
	local id_cold_sleeper = ReadGimmick_("o_V02_12");	// コールドスリープ(主人公用)
	local id_case_flashing = ReadGimmick_("o_V02_13");	// コールドスリープの明滅
	local id_rulerpoint = ReadGimmick_("o_com_08");	// ルーラポイント
	
	// ■エレベータの扉
	g_gmk_elevator_door = ArrangePointGimmick_("o_V02_02", id_elevator_door, "gmk_elevator_door");
	
	// ■エレベータのリフト
	g_gmk_elevator_lift = ArrangePointGimmick_("o_V02_03", id_elevator_lift, "gmk_elevator_lift");
	
	// ■扉①－③(調べると開く・マップ切り替え毎に閉じた状態から始まる)
	if(GetEventFlg_("BFG_CHECK_AUTO_DOOR_1") == false){
		g_gmk_door01 = ArrangePointGimmick_("o_V02_09", id_door, "gmk_door01");
		SetMotion_(g_gmk_door01, MOT_GIMMICK_0, BLEND_N);
	}
	if(GetEventFlg_("BFG_CHECK_AUTO_DOOR_2") == false){
		g_gmk_door02 = ArrangePointGimmick_("o_V02_09", id_door, "gmk_door02");
		SetMotion_(g_gmk_door02, MOT_GIMMICK_0, BLEND_N);
	}
	if(GetEventFlg_("BFG_CHECK_AUTO_DOOR_3") == false){
		g_gmk_door03 = ArrangePointGimmick_("o_V02_09", id_door, "gmk_door03");
		SetMotion_(g_gmk_door03, MOT_GIMMICK_0, BLEND_N);
	}
	
	// ■コールドスリープのケース(デザイン配置になったのでコメント化 < Redmine#3785 >)
//	g_gmk_case01 = ArrangePointGimmick_("o_V02_10", id_case, "gmk_case01");
//	g_gmk_case02 = ArrangePointGimmick_("o_V02_10", id_case, "gmk_case02");
//	g_gmk_case03 = ArrangePointGimmick_("o_V02_10", id_case, "gmk_case03");
//	g_gmk_case04 = ArrangePointGimmick_("o_V02_10", id_case, "gmk_case04");
//	g_gmk_case05 = ArrangePointGimmick_("o_V02_10", id_case, "gmk_case05");
//	g_gmk_case06 = ArrangePointGimmick_("o_V02_10", id_case, "gmk_case06");
//	g_gmk_case07 = ArrangePointGimmick_("o_V02_10", id_case, "gmk_case07");
//	g_gmk_case08 = ArrangePointGimmick_("o_V02_10", id_case, "gmk_case08");
//	g_gmk_case09 = ArrangePointGimmick_("o_V02_10", id_case, "gmk_case09");
//	g_gmk_case10 = ArrangePointGimmick_("o_V02_10", id_case, "gmk_case10");
//	g_gmk_case11 = ArrangePointGimmick_("o_V02_10", id_case, "gmk_case11");
//	g_gmk_case12 = ArrangePointGimmick_("o_V02_10", id_case, "gmk_case12");
//	g_gmk_case13 = ArrangePointGimmick_("o_V02_10", id_case, "gmk_case13");
//	g_gmk_case14 = ArrangePointGimmick_("o_V02_10", id_case, "gmk_case14");
	
	// ■コンピュータの明滅
	g_gmk_monitor = ArrangePointGimmick_("o_V02_11", id_monitor, "gmk_monitor");
	
	// ■コールドスリープ(主人公用)gmk_cold_sleeper
	local g_gmk_cold_sleeper = ArrangePointGimmick_("o_V02_12", id_cold_sleeper, "gmk_cold_sleeper");
	
	// ■コールドスリープのケースの明滅
	local g_gmk_case_flashing = ArrangePointGimmick_("o_V02_13", id_case_flashing, "gmk_case_flashing");

	// ■ルーラポイント
	g_gmk_ruler_point = ArrangePointGimmick_("o_com_08", id_rulerpoint, "gmk_ruler_point");
	SetMotion_(g_gmk_ruler_point, MOT_GIMMICK_0, BLEND_N);
	if(GetEventFlg_("BFG_RULER_ADD_023") == true){
		SetMotion_(g_gmk_ruler_point, MOT_GIMMICK_2, BLEND_N);
	}

	//-----------
	// ▼NPC配置
	//-----------
	// ID初期化
	g_birdy		 <- C_NONE_ID;
	g_renerte	 <- C_NONE_ID;
	g_darkmaster <- C_NONE_ID;
	g_prometheus <- C_NONE_ID;
	
	// ■コールドスリープ状態の主人公
	local cold_sleeper = ReadAndArrangePointNpc("n040", "npc_cold_sleeper");
	local sleep_motion = ReadMotion_(cold_sleeper, "n010_cold_sleep_L"); // 非常駐モーション(装置内浮遊)
	SetMotion_(cold_sleeper, sleep_motion, BLEND_N);
	SetFace_(cold_sleeper, "Face_loop_close02");
	SetTalkEnable_(cold_sleeper, false);
	
	// ■バーディ
	if (main_num == GetFlagID_("CONST_SM_VOLCANO")){						// Num0 = 6
		//プロメテウス再戦時
		if (volcano_num == GetFlagID_("CONST_SS_HV_CONTACT_PROMETHEUS")){	// Num7 = 28
			local id_birdy = ReadNpc_("n019");
			g_birdy = ArrangePointNpc_(id_birdy, "birdy01");
			SetReactorMsg_(g_birdy, "VOLCANO_BIRDY_REC");
			SetTalkEnable_(g_birdy, false);
			SetScaleSilhouette(g_birdy, SCALE.N, SILHOUETTE_WIDTH.N);
		}
		//プロメテウス勝利～Demo534[コアに弾頭が刺さる]の再生後まで
		if (volcano_num >= GetFlagID_("CONST_SS_HV_TALK_GIRL_1")				// Num7 >= 31
		&& volcano_num <= GetFlagID_("CONST_SS_HV_PRE_LAUNCH_PAD_DEMO_5")){		// Num7 <= 39
			local id_birdy = ReadNpc_("n019");
			g_birdy = ArrangePointNpc_(id_birdy, "birdy02");
			SetReactorMsg_(g_birdy, "VOLCANO_BIRDY_REC");
			SetTalkCameraType_(g_birdy, TALK_CAMERA_UP);				//カメラの設定
			SetScaleSilhouette(g_birdy, SCALE.N, SILHOUETTE_WIDTH.N);	//サイズの設定
		}
		if(volcano_num >= GetFlagID_("CONST_SS_HV_GO_TO_THE_TOEWR")){		// Num7 >= 40
			local id_birdy = ReadNpc_("n019");
			g_birdy = ArrangePointNpc_(id_birdy, "birdy01");
			SetReactorMsg_(g_birdy, "VOLCANO_BIRDY_REC");
			SetTalkCameraType_(g_birdy, TALK_CAMERA_UP);
			SetScaleSilhouette(g_birdy, SCALE.N, SILHOUETTE_WIDTH.N);
		}
	}
	// 火山クリア後
	if (main_num >= GetFlagID_("CONST_SM_CORE")){
		local id_birdy = ReadNpc_("n019");
		g_birdy = ArrangePointNpc_(id_birdy, "birdy01");
		SetReactorMsg_(g_birdy, "VOLCANO_BIRDY_REC");
		SetTalkCameraType_(g_birdy, TALK_CAMERA_UP);				//カメラの設定
		SetScaleSilhouette(g_birdy, SCALE.N, SILHOUETTE_WIDTH.N);	//サイズの設定
	}
	
	// ■レナーテ
	if (main_num == GetFlagID_("CONST_SM_VOLCANO")){						// Num0 = 6
		//プロメテウス再戦時
		if (volcano_num == GetFlagID_("CONST_SS_HV_CONTACT_PROMETHEUS")){	// Num7 = 28
			local id_renerte = ReadNpc_("n007");
			g_renerte = ArrangePointNpc_(id_renerte, "renerte01");
			SetReactorMsg_(g_renerte, "VOLCANO_RENERTE_REC");
			SetTalkEnable_(g_renerte, false);
			// 会話カメラ時に透過されるのでアルファ値を設定する
			SetManualCalcAlpha_(g_renerte, true);
			SetAlpha_(g_renerte, 1.0);
		}
		//プロメテウス勝利～Demo533[移動装置 コア侵入]の再生後まで
		if (volcano_num >= GetFlagID_("CONST_SS_HV_TALK_GIRL_1")			// Num7 31～40まで
		&& volcano_num < GetFlagID_("CONST_SS_HV_CLEAR_HEAT_VOLCANO")){
			// NPCの配置
			local id_renerte = ReadNpc_("n007");
			if(volcano_num <= GetFlagID_("CONST_SS_HV_TALK_GIRL_2")){ // Num7 31～33
				// エイリアスルーム
				if(volcano_num == GetFlagID_("CONST_SS_HV_TALK_GIRL_1")){ // Num7 31
					g_renerte = ArrangePointNpc_(id_renerte, "renerte02");
				}
				else if(volcano_num == GetFlagID_("CONST_SS_HV_TALK_GIRL_2")){ // Num7 33
					g_renerte = ArrangePointNpc_(id_renerte, "renerte03");
				}
				else{
					g_renerte = ArrangePointNpc_(id_renerte, "renerte02");
				}
			}
			else{
				// 奥の部屋
				g_renerte = ArrangePointNpc_(id_renerte, "renerte04");
			}
			
			// NPCの設定
			SetReactorMsg_(g_renerte, "VOLCANO_RENERTE_REC");
			if(volcano_num == GetFlagID_("CONST_SS_HV_TALK_GIRL_1")){ // Num7 >= 31
				SetTalkTurn_ (g_renerte, false);
			}
			else if(volcano_num == GetFlagID_("CONST_SS_HV_TALK_GIRL_2")){ // Num7 >= 33
				SetDir_(g_renerte, -100);
				SetTalkTurn_ (g_renerte, false);
			}
			else{
				SetTalkCameraType_(g_renerte, TALK_CAMERA_UP); //カメラの設定
			}
			// 会話カメラ時に透過されるのでアルファ値を設定する
			SetManualCalcAlpha_(g_renerte, true);
			SetAlpha_(g_renerte, 1.0);
		}
	}
	
	// ■ダークマスター・プロメテウス
	if (main_num == GetFlagID_("CONST_SM_VOLCANO")){						// Num0 = 6
		//プロメテウス再戦時
		if (volcano_num == GetFlagID_("CONST_SS_HV_CONTACT_PROMETHEUS")){	// Num7 = 28
			// ■ダークマスター
			local g_id_darkmaster = ReadNpc_("n008");//ダークマスター
			g_darkmaster = ArrangePointNpc_(g_id_darkmaster, "darkmaster01");
			SetReactorMsg_(g_darkmaster, "VOLCANO_DARKMASTER_REC");
			SetTalkEnable_(g_darkmaster, false);
			// ■プロメテウス
			local g_id_prometheus = ReadNpc_("m190_00");//プロメテウス
			g_prometheus = ArrangePointNpc_(g_id_prometheus, "prometheus01");
			SetScaleSilhouette(g_prometheus, SCALE.M, SILHOUETTE_WIDTH.M);
			SetReactorMsg_(g_prometheus, "VOLCANO_PROMETHEUS_REC");
			SetTalkEnable_(g_prometheus, false);
			// プロメテウスのオーラ
			LoadEffect_("ef730_01_oth_dark_aura01");
			local efect = SetBoneEffect_("ef730_01_oth_dark_aura01", g_prometheus);
		}
	}
	
	//-----------
	// ▼地雷配置
	//-----------
	// ID初期化
	g_mine_sleep       <- C_NONE_ID;
	g_mine_elevator    <- C_NONE_ID;
	g_mine01           <- C_NONE_ID;
	g_mine_door01      <- C_NONE_ID;
	g_mine_door02      <- C_NONE_ID;
	g_mine_door03      <- C_NONE_ID;
	g_mine_ruler_point <- C_NONE_ID;
	
	// ■コールドスリープ状態の主人公
	g_mine_sleep = SetPointCircleEventMine_("mine_sleep", true);
	
	// ■エレベーターのマップチェンジ地雷
	g_mine_elevator = SetPointBoxEventMine_("mine_elevator", true);
	
	// ■自動扉
	if(GetEventFlg_("BFG_CHECK_AUTO_DOOR_1") == false){
		g_mine_door01 = SetPointCircleEventMine_("mine_door01", true);
	}
	if(GetEventFlg_("BFG_CHECK_AUTO_DOOR_2") == false){
		g_mine_door02 = SetPointCircleEventMine_("mine_door02", true);
	}
	if(GetEventFlg_("BFG_CHECK_AUTO_DOOR_3") == false){
		g_mine_door03 = SetPointCircleEventMine_("mine_door03", true);
	}
	
	// ■イベント地雷
	if (main_num == GetFlagID_("CONST_SM_VOLCANO")){							// Num0 = 6
		if (volcano_num == GetFlagID_("CONST_SS_HV_ENTER_THE_ALIAS_ROOM")){		// Num7 = 25
			// デモ522[エイリアス]を再生する地雷
			g_mine01 = SetPointBoxEventMine_("mine01", false);
		}
		else if(volcano_num == GetFlagID_("CONST_SS_HV_CONTACT_PROMETHEUS")){	// Num7 = 28
			// デモ523[プロメテウス再戦]を再生する地雷
			g_mine01 = SetPointBoxEventMine_("mine01", false);
		}
	}
	// ■ルーラポイント
	g_mine_ruler_point = SetPointCircleEventMine_("mine_ruler_point", true);

	//------------
	//▼マップナビ
	//------------
	// ルーラポイント
	if(GetEventFlg_("BFG_RULER_ADD_023") == true){
		local icon01 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.RULER_POINT , "gmk_ruler_point");
		SetNaviMapIconVisible_(icon01, true);
	}
	// 扉(！マークアイコン)
	if(GetEventFlg_("BFG_CHECK_AUTO_DOOR_1") == false){
		icon02 <- ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION , "icon_door_01");
		SetNaviMapIconVisible_(icon02, true);
	}
	// 扉(！マークアイコン)
	if(GetEventFlg_("BFG_CHECK_AUTO_DOOR_2") == false){
		icon03 <- ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION , "icon_door_02");
		SetNaviMapIconVisible_(icon03, true);
	}
	// 扉(！マークアイコン)
	if(GetEventFlg_("BFG_CHECK_AUTO_DOOR_3") == false){
		icon04 <- ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION , "icon_door_03");
		SetNaviMapIconVisible_(icon04, true);
	}

	//--------------------
	//▼リアクターポイント
	//--------------------
	// エレベータ
	local reactorPoint01 = ArrangeMsgReactorPoint("reactorpoint01", GetFlagID_("BFG_REACTER_POINT_085")
		, SHORT_DIST, "REC_POINT_01_01", "REC_POINT_01_02");
	// コールドスリープ
	local reactorPoint02_a = ArrangeMsgReactorPoint("reactorpoint02_01", GetFlagID_("BFG_REACTER_POINT_086")
		, SHORT_DIST, "REC_POINT_02_01", "REC_POINT_02_02");
	local reactorPoint02_b = ArrangeMsgReactorPoint("reactorpoint02_02", GetFlagID_("BFG_REACTER_POINT_086")
		, SHORT_DIST, "REC_POINT_02_01", "REC_POINT_02_02");
	local reactorPoint02_c = ArrangeMsgReactorPoint("reactorpoint02_03", GetFlagID_("BFG_REACTER_POINT_086")
		, SHORT_DIST, "REC_POINT_02_01", "REC_POINT_02_02");
	local reactorPoint02_d = ArrangeMsgReactorPoint("reactorpoint02_04", GetFlagID_("BFG_REACTER_POINT_086")
		, SHORT_DIST, "REC_POINT_02_01", "REC_POINT_02_02");
	local reactorPoint02_e = ArrangeMsgReactorPoint("reactorpoint02_05", GetFlagID_("BFG_REACTER_POINT_086")
		, SHORT_DIST, "REC_POINT_02_01", "REC_POINT_02_02");
	local reactorPoint02_f = ArrangeMsgReactorPoint("reactorpoint02_06", GetFlagID_("BFG_REACTER_POINT_086")
		, SHORT_DIST, "REC_POINT_02_01", "REC_POINT_02_02");
	local reactorPoint02_g = ArrangeMsgReactorPoint("reactorpoint02_07", GetFlagID_("BFG_REACTER_POINT_086")
		, SHORT_DIST, "REC_POINT_02_01", "REC_POINT_02_02");
	local reactorPoint02_h = ArrangeMsgReactorPoint("reactorpoint02_08", GetFlagID_("BFG_REACTER_POINT_086")
		, SHORT_DIST, "REC_POINT_02_01", "REC_POINT_02_02");
	// エイリアス装置
	local reactorPoint03 = ArrangeMsgReactorPoint("reactorpoint03", GetFlagID_("BFG_REACTER_POINT_087")
		, SHORT_DIST, "REC_POINT_03_01", "REC_POINT_03_02");
	// ルーラポイント
	local reactorPoint04 = ArrangeMsgReactorPoint("reactorpoint04", GetFlagID_("BFG_REACTER_POINT_010")
		, SHORT_DIST, "REC_POINT_04_01", "REC_POINT_04_02");

	//------------------------------------------
	// demo527[ジョーカー計画]再生後のカメラ設定
	//------------------------------------------
	if(main_num == GetFlagID_("CONST_SM_VOLCANO")){ // Num0 = 6
		if(volcano_num == GetFlagID_("CONST_SS_HV_GO_TO_THE_TOEWR")){ // Num7 = 40
			if(GetEventFlg_("BFG_CAMERA_DIR_FIX") == true){
				SetEventFlg_("BFG_CAMERA_DIR_FIX", false);
				SetCameraDir_(90);
			}
		}
	}

	//---------------------
	// ▼ＢＧＭを設定
	//---------------------
	if(main_num == GetFlagID_("CONST_SM_VOLCANO")){					// Num 0 == 6
		if(volcano_num == GetFlagID_("CONST_SS_HV_TALK_GIRL_1")){	// Num10 == 31
			// 無音にする
			SetEventFlg_("BFG_V02_01_EVENT_BGM_NONE", true);
			// 【BGM_009】を鳴らさない
			SetEventFlg_("BFG_V02_01_EVENT_BGM009_PLAY", false);
		}
		else if(volcano_num == GetFlagID_("CONST_SS_HV_TALK_GIRL_2")// Num10 == 33
		|| volcano_num == GetFlagID_("CONST_SS_HV_TALK_GIRL_3")){	// Num10 == 34
			// 無音にしない
			SetEventFlg_("BFG_V02_01_EVENT_BGM_NONE", false);
			// 【BGM_009】を鳴らす
			SetEventFlg_("BFG_V02_01_EVENT_BGM009_PLAY", true);
		}
		else{
			// 無音にしない
			SetEventFlg_("BFG_V02_01_EVENT_BGM_NONE", false);
			// 【BGM_009】を鳴らさない
			SetEventFlg_("BFG_V02_01_EVENT_BGM009_PLAY", false);
		}
	}
	else{
		// 無音にしない
		SetEventFlg_("BFG_V02_01_EVENT_BGM_NONE", false);
		// 【BGM_009】を鳴らさない
		SetEventFlg_("BFG_V02_01_EVENT_BGM009_PLAY", false);
	}

	EventEnd_();
}	

//--------------------------------------------------
//		ＮＰＣ接触する直前( TouchNpc()の直前に起動 )
//--------------------------------------------------
function BeforeTalkNpc()
{
	local target = GetTargetId_();
	
	// ライド中にレナーテに話しかけた時は視点のオフセット値のY軸のみを変更する
	// 【備忘録】「npc_info.nut」で視点と注視点のオフセット値を原点の調整しています。
	//            なので、ココで行う視点のオフセット値変更は「npc_info.nut」で原点調整した値から
	//            さらに調整することになるので変更する時は要注意。
	if(target == g_renerte){
		SetRideTalkCamOffset(OFFSET_RENATE);
	}

	EventEnd_();
}

//------------------------------------------------
//		ＮＰＣ接触時
//------------------------------------------------
function TouchNpc()
{
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");			// Num0
	volcano_num	 = GetNumFlg_("NUM_SCENARIO_SUB_VOLCANO");	// Num6
	
	local target = GetTargetId_();
	
	DebugPrint(" ");
	DebugPrint("ID: " + target + " に接触 [TouchNpc]");
	
	switch (target)
	{
	case g_birdy:						//バーディ
		uTalkbirdy();
		break;
	case g_renerte:						//レナーテ
		uTalkrenerte();
		break;	
//	case g_darkmaster:					//ダークマスター
//		uTalkdarkmaster();
//		break;
//	case g_prometheus:					//プロメテウス
//		uTalkprometheus();
//		break;
	default :
		DebugPrint("WARNING : NPC_IDが不正です [TouchNpc]");
		break;
	}
	
	EventEnd_();
}

//------------------------------------------------
//	イベント地雷接触時
//------------------------------------------------
function TouchEventMine()
{
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");
	volcano_num	 = GetNumFlg_("NUM_SCENARIO_SUB_VOLCANO");
	
	local target = GetTouchEventMineId_();
	
	DebugPrint(" ");
	DebugPrint("ID: " + target + " に接触 [TouchEventMine]");
	
	switch (target) {
	case g_mine_sleep :					//コールドスリープ状態の主人公
		uMineSleep();
		break;
	case g_mine_elevator :				//エレベーターを調べたとき
		local pl_dir = -90;
		CommPlayerTurnAroundDir(pl_dir);
		uMineElevator();
		break;
	case g_mine_door01 :
		local pl_dir = 90;
		CommPlayerTurnAroundDir(pl_dir);
		SetEventFlg_("BFG_CHECK_AUTO_DOOR_1", true);
		uMineDoor01();
		break;
	case g_mine_door02 :
		local pl_dir = 90;
		CommPlayerTurnAroundDir(pl_dir);
		SetEventFlg_("BFG_CHECK_AUTO_DOOR_2", true);
		uMineDoor02();
		break;
	case g_mine_door03 :
		local pl_dir = 90;
		CommPlayerTurnAroundDir(pl_dir);
		SetEventFlg_("BFG_CHECK_AUTO_DOOR_3", true);
		uMineDoor03();
		break;
	case g_mine01 :						//デモ522[エイリアス]を再生する地雷
		uMine01();
		break;	
	case g_mine_ruler_point:
		// ルーラポイントの共通処理
		CommPlayerTurnAroundObj(g_gmk_ruler_point);
		CommRulerPointEvent(g_gmk_ruler_point, "BFG_RULER_ADD_023", "gmk_ruler_point");
	default :
		DebugPrint("WARNING : MINE_IDが不正です [TouchEventMine]");
		break;
	}
	EventEnd_();
}

//------------------------------------------------
//		フィールド操作開始
//------------------------------------------------
function EventStartOperate()
{
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");
	volcano_num	 = GetNumFlg_("NUM_SCENARIO_SUB_VOLCANO");
	
	//-------------
	// ▼デモ再生
	//-------------
	//	<!-- ■demo526[アンセスからの伝言]■ -->
	//demo525の直後に発生 ※function uTalkrenerteを参照
	if (main_num == GetFlagID_("CONST_SM_VOLCANO")){	// Num7 = 32
		if (volcano_num  ==  GetFlagID_("CONST_SS_HV_PRE_ANSESU_DEMO")){
			SetFade_(FADE_OUT, FADE_COLOR_WHITE, FADE_SHORT);    // 上画面は白暗転(回想デモの為)
			SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT); // 下画面は黒暗転
			SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_HV_TALK_GIRL_2"));
			SetReturnDemoPosDir_(Vec3(25.605, 4.401, -26.526), 108);
			ChangeDemo_(526);
		}
	}
	//	<!-- ■demo529[移動装置発射台が登場]■ -->
	//demo528の直後に発生 ※function uTalkrenerteを参照
	if (main_num == GetFlagID_("CONST_SM_VOLCANO")){	// Num7 = 36
		if (volcano_num  ==  GetFlagID_("CONST_SS_HV_PRE_LAUNCH_PAD_DEMO_1")){
			SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_HV_PRE_LAUNCH_PAD_DEMO_4"));
			EventStartChangeDemo(529, FADE_COLOR_BLACK);
		}
	}
/*
//*************************************
// シナリオブックの変更で削除(2015/8/6)
//*************************************
	//	<!-- ■demo530[秘密基地 発射スイッチＯＮ]■ -->
	//demo529の直後に発生
	if (main_num == GetFlagID_("CONST_SM_VOLCANO")){	// Num7 = 37
		if (volcano_num  ==  GetFlagID_("CONST_SS_HV_PRE_LAUNCH_PAD_DEMO_2")){
			SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_HV_PRE_LAUNCH_PAD_DEMO_3"));
			EventStartChangeDemo(530, FADE_COLOR_BLACK);
		}
	}
	//	<!-- ■demo531[秘密基地 発射スイッチＯＮ]■ -->
	//demo530の直後に発生
	if (main_num == GetFlagID_("CONST_SM_VOLCANO")){	// Num7 = 38
		if (volcano_num  ==  GetFlagID_("CONST_SS_HV_PRE_LAUNCH_PAD_DEMO_3")){
			SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_HV_PRE_LAUNCH_PAD_DEMO_4"));
			EventStartChangeDemo(531, FADE_COLOR_BLACK);
		}
	}
*/
	//	<!-- ■demo534[コアに弾頭が刺さる]■ -->
	//demo531の直後に発生
	if (main_num == GetFlagID_("CONST_SM_VOLCANO")){	// Num7 = 39
		if (volcano_num  ==  GetFlagID_("CONST_SS_HV_PRE_LAUNCH_PAD_DEMO_4")){
			SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_HV_PRE_LAUNCH_PAD_DEMO_5"));
			EventStartChangeDemo(534, FADE_COLOR_BLACK);
		}
	}
	//	<!-- ■demo532[秘密基地 さあ行こう！]■ -->
	//demo534の直後に発生
	if (main_num == GetFlagID_("CONST_SM_VOLCANO")){	// Num7 = 40
		if (volcano_num  ==  GetFlagID_("CONST_SS_HV_PRE_LAUNCH_PAD_DEMO_5")){
			SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_HV_GO_TO_THE_TOEWR"));
			SetReturnDemoPosDir_(Vec3(553.288, 0.000, -33.215), 120);
			EventStartChangeDemo(532, FADE_COLOR_BLACK);
		}
	}

	//-------------
	// ▼戦闘開始
	//-------------
	// イベント戦[プロメテウス戦]
	if (main_num == GetFlagID_("CONST_SM_VOLCANO")){							// Num0 = 6
		if (volcano_num == GetFlagID_("CONST_SS_HV_PRE_BATTLE_PROMETHEUS")){	// Num7 = 26
			SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_HV_JDG_BATTLE_PROMETHEUS")); // Num7 26→27
			// プロメテウス戦
			ChangeBattleParty_(19);
		}
	}
	// イベント戦[プロメテウス再戦]
	if (main_num == GetFlagID_("CONST_SM_VOLCANO")){							// Num0 = 6
		if (volcano_num == GetFlagID_("CONST_SS_HV_PRE_REMATCH_PROMETHEUS")){	// Num7 = 29
			SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_HV_JDG_REMATCH_PROMETHEUS")); // Num7 29→30
			// プロメテウス戦
			ChangeBattleParty_(19);
		}
	}

	//-------------
	// ▼戦闘結果
	//-------------
	if (main_num == GetFlagID_("CONST_SM_VOLCANO")){							// Num0 = 6
		// 初回時
		if(volcano_num == GetFlagID_("CONST_SS_HV_JDG_BATTLE_PROMETHEUS")){		// Num7 = 27
			if(GetBattleEndType_() == BATTLE_END_TYPE_WIN){
				// プロメテウスに勝利
				uWinPrometheus();
			}
			else{
				// プロメテウスに敗北
				// ここではプロメテウス戦の敗北判定ができないので
				// イベントブロックのAfterBattle()で敗北の判定とフラグ変更を行う。
			}
		}
		//再戦時
		else if(volcano_num == GetFlagID_("CONST_SS_HV_JDG_REMATCH_PROMETHEUS")){ // Num7 = 30
			if(GetBattleEndType_() == BATTLE_END_TYPE_WIN){
				// プロメテウスに勝利
				uWinPrometheus();
			}
			else{
				// プロメテウスに敗北
				// ここではプロメテウス戦の敗北判定ができないので
				// イベントブロックのAfterBattle()で敗北の判定とフラグ変更を行う。
			}
		}
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
//		バーディ 会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkbirdy()
{
	main_num		 = GetNumFlg_("NUM_SCENARIO_MAIN");
	volcano_num		 = GetNumFlg_("NUM_SCENARIO_SUB_VOLCANO");
	local sky_num	 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");			//Num9
	local bit_sinario_clesr		 = GetEventFlg_("BFG_SCENARIO_CLEAR_ALL");		// Bit_46 シナリオクリア
	local bit_sinario_all_clesr	 = GetEventFlg_("BFG_SCENARIO_CLEAR_EXTRA");	// Bit_47 裏シナリオクリア
	
	if(bit_sinario_all_clesr == true){							// Bit_47 裏シナリオクリア
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_BIRDY");
		ShowMsg_("18_NPC_BIRDY");				//「ヘルプされた レナーテから 連絡が来たネー。
		KeyInputWait_();
		CloseMsgWnd_();
	}
	else if(bit_sinario_clesr == true){							// Bit_46 シナリオクリア
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_BIRDY");
		ShowMsg_("17_NPC_BIRDY");				//「……言わなくていいデース。
		KeyInputWait_();
		CloseMsgWnd_();
	}
	else if (main_num == GetFlagID_("CONST_SM_VOLCANO")){ // Num0 = 6
		// ■demo524プロメテウス戦勝利後のメッセージ■
		if (volcano_num == GetFlagID_("CONST_SS_HV_TALK_GIRL_1")){ // Num7 = 31
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_BIRDY");
			ShowMsg_("DEMO_524_AFT_BIRDY");		// 「レナーテの 見せたいものってなんデース？
			KeyInputWait_();
			CloseMsgWnd_();
		}
		// ■demo526[アンセスからの伝言]のメッセージ■
		else if (volcano_num == GetFlagID_("CONST_SS_HV_TALK_GIRL_2")){ // Num7 = 33
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_BIRDY");
			ShowMsg_("DEMO_526_AFT_BIRDY");		// 「サプラーイズデース……。
			KeyInputWait_();
			CloseMsgWnd_();
		}
		// ■demo527[ジョーカー計画]後のメッセージ■
		else if (volcano_num == GetFlagID_("CONST_SS_HV_TALK_GIRL_3")){ // Num7 = 34
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_BIRDY");
			ShowMsg_("DEMO_527_AFT_BIRDY");		// 「 マウスを はさむ話では なさそうデース。
			KeyInputWait_();
			CloseMsgWnd_();
		}
		// ■demo532[秘密基地 さあ行こう！]後のメッセージ■
		else if (volcano_num >= GetFlagID_("CONST_SS_HV_GO_TO_THE_TOEWR")){ // Num7 >= 40
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_BIRDY");
			ShowMsg_("DEMO_532_AFT_BIRDY");		// 「 グッドラック！ ゴッドスピード！
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	// ■火山シナリオクリア後～ガルビルス撃破前まで■
	else if (main_num == GetFlagID_("CONST_SM_CORE")) // Num0 = 7
	{
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_BIRDY");
		ShowMsg_("CLEAR_AFT_BIRDY");		// 「秘密基地は ノープロブレムネー！
		KeyInputWait_();
		CloseMsgWnd_();
	}
	// ■ガルビルス撃破後～巨大プロメテウス＆デスバーン撃破前まで■
	else if (main_num == GetFlagID_("CONST_SM_SKY")) {			// Num0 = 8
		if(sky_num < GetFlagID_("CONST_SS_SK_GO_CORE_SKY")){	// Num9 < 42
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_BIRDY");
			ShowMsg_("13_NPC_BIRDY");		// 「オー！ <name_player/>！
			KeyInputWait_();
			CloseMsgWnd_();
		}
		// ■巨大プロメテウス＆デスバーン撃破後から表シナリオクリア前まで■
		else {
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_BIRDY");
			ShowMsg_("14_NPC_BIRDY");		// 「とうとう ここまで来ましたデース。
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		レナーテ 会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkrenerte()
{
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");
	volcano_num	 = GetNumFlg_("NUM_SCENARIO_SUB_VOLCANO");
	
	if (main_num == GetFlagID_("CONST_SM_VOLCANO")){
		// ■demo524プロメテウス戦勝利後のメッセージ■
		if(volcano_num  ==  GetFlagID_("CONST_SS_HV_TALK_GIRL_1")){ // Num7 = 31
			SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_HV_PRE_ANSESU_DEMO"));
			//Demo525[レナーテが見せるもの]再生
			TouchNpcChangeDemo(525);
		}
		// ■demo526[アンセスからの伝言]のメッセージ■
		else if(volcano_num == GetFlagID_("CONST_SS_HV_TALK_GIRL_2")){ // Num7 = 33
			SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_HV_TALK_GIRL_3"));
			//Demo527[ジョーカー計画]再生
			SetReturnDemoPosDir_(Vec3(5.405, 4.401, 0.814), 90);
			TouchNpcChangeDemo(527);
		}
		// ■demo527[ジョーカー計画]後のメッセージ■
		else if(volcano_num == GetFlagID_("CONST_SS_HV_TALK_GIRL_3")){ // Num7 = 34
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_RENERTE");
			ShowMsg_("DEMO_527_AFT_RENERTE_1"); // 「私たちと 一緒に戦ってくれる？
			KeyInputWait_();
			// 【はいの場合：１】
			if (GetQueryResult_() == QUERY2_0){
				CloseMsgWnd_();
				//Demo528[移動装置を打ち上げろ]再生
				SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_HV_PRE_LAUNCH_PAD_DEMO_1"));
				SetEventFlg_("BFG_CAMERA_DIR_FIX", true);
				StopBgmChangeDemo(528);
			}
			// 【いいえの場合：１】
			else{
				ShowMsg_("DEMO_527_AFT_RENERTE_2"); // 「そう……。
				KeyInputWait_();
				CloseMsgWnd_();
			}
		}
		// ■demo532[秘密基地 さあ行こう！]後のメッセージ■
		else if (volcano_num >= GetFlagID_("CONST_SS_HV_GO_TO_THE_TOEWR")){ // Num7 40,41
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_RENERTE");
			ShowMsg_("DEMO_532_AFT_RENERTE"); // 「塔には 移動装置があるの
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		コールドスリープ状態の主人公を調べた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineSleep()
{
	// 指定した座標にプレイヤーを向かせる
	local pos = Vec3(45.0, 0.0, 0.0);
	uPlayerTurnAroundPos(pos);
	
	// システムメッセージ
	OpenMsgWnd_();
	ShowMsg_("SYSTEM_MES_010");		// 返事がない。深く眠っているようだ。
	KeyInputWait_();
	CloseMsgWnd_();
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		エレベーターの地雷を調べた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineElevator()
{
	OpenMsgWnd_();
	ShowMsg_("VOLCANO_ELEVATOR");
	KeyInputWait_();
	// 【はいの場合：１】
	if (GetQueryResult_() == QUERY2_0){
		CloseMsgWnd_();
		// 地雷削除
		DeleteEventMine_(g_mine_elevator);
		// エレベータで移動SE
		PlaySE_("SE_FLD_061");
		// B1Fへ移動
		ChangeMapPosDir_("V02_00", Vec3(-525.0, -87.0, 1055), 150);
	}
	// 【いいえの場合：１】
	else{
		CloseMsgWnd_();
		// 地雷を再設置
		SetPointBoxEventMine_("mine_elevator", true);
	}
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		自動扉①（手前）を調べた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineDoor01()
{
	
	DeleteEventMine_(g_mine_door01);
	SetMotion_(g_gmk_door01, MOT_GIMMICK_1, BLEND_N);
	PlaySE_("SE_FLD_005");
	Wait_(29);
	SetMotion_(g_gmk_door01, MOT_GIMMICK_2, BLEND_N);
	SetActive_(g_gmk_door01, false);
	SetNaviMapIconVisible_(icon02, false);
	
	Wait_(10);
	DeleteEventMine_(g_mine01);
	// Demo522[エイリアス]の再生
	SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_HV_PRE_BATTLE_PROMETHEUS"));	// Num7 = 26
	TouchNpcChangeDemo(522);
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		自動扉②（真ん中）を調べた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineDoor02()
{
	DeleteEventMine_(g_mine_door02);
	SetMotion_(g_gmk_door02, MOT_GIMMICK_1, BLEND_N);
	PlaySE_("SE_FLD_005");
	Wait_(29);
	SetMotion_(g_gmk_door02, MOT_GIMMICK_2, BLEND_N);
	SetActive_(g_gmk_door02, false);
	SetNaviMapIconVisible_(icon03, false);
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		自動扉③（最奥）を調べた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineDoor03()
{
	DeleteEventMine_(g_mine_door03);
	SetMotion_(g_gmk_door03, MOT_GIMMICK_1, BLEND_N);
	PlaySE_("SE_FLD_005");
	Wait_(29);
	SetMotion_(g_gmk_door03, MOT_GIMMICK_2, BLEND_N);
	SetActive_(g_gmk_door03, false);
	SetNaviMapIconVisible_(icon04, false);
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//デモ522「エイリアス」デモ523「プロメテウス再戦」再生地雷に触れた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMine01()
{
	main_num    = GetNumFlg_("NUM_SCENARIO_MAIN");
	volcano_num = GetNumFlg_("NUM_SCENARIO_SUB_VOLCANO");
	
	if (main_num == GetFlagID_("CONST_SM_VOLCANO")){
		if(volcano_num == GetFlagID_("CONST_SS_HV_CONTACT_PROMETHEUS")){ // Num7 = 27
			SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_HV_PRE_REMATCH_PROMETHEUS"));	// Num7 = 28
			DeleteEventMine_(g_mine01);
			// Demo523[プロメテウス再戦]の再生
			StopBgmChangeDemo(523);
		}
	}
}

//+++++++++++++++++++++++++++++++++++++++++
// プロメテウス戦(再戦)に勝利した後の処理
//-----------------------------------------
// 引数  : なし
// 戻り値: なし
//+++++++++++++++++++++++++++++++++++++++++
function uWinPrometheus()
{
	SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_HV_TALK_GIRL_1")); // Num7 27→31
	// デモ後に設定される主人公の位置と向き
	local rtn_pos = Vec3(-24.962, 4.401, -5.582);
	local rtn_dir = 79;
	SetReturnDemoPosDir_(rtn_pos, rtn_dir);
	EventStartChangeDemo(524, FADE_COLOR_BLACK);
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


