//===================== S02_04イッタブル監獄 5F ====================

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
	
	DebugPrint(" ");
	DebugPrint("NUM_SCENARIO_MAIN の値は " + main_num + " になりました。");
	DebugPrint("NUM_SCENARIO_SUB_PRISON の値は " + prison_num + " になりました。");
	
	// ■ ルーラ禁止
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_SALVATION_VOICE")) {				// Num6 = 14
			SetEventFlg_("BFG_PLAYERABILITY_RULER_PROHIBIT", true);					// Bit_440 ルーラ禁止
		}
	}
	
	// ■玉座の間にモンスターを配置しない
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_BLAST_EXPLANATION_1ST")) {			// Num6 < 16
			SetEventFlg_("BFG_LIMIT_5F_THRONE_ROOM", false);					// Bit_1230 玉座の間にモンスターを配置
		} else {
			SetEventFlg_("BFG_LIMIT_5F_THRONE_ROOM", true);				// Bit_1230 玉座の間にモンスターを配置
		}
	} else {
		SetEventFlg_("BFG_LIMIT_5F_THRONE_ROOM", true);					// Bit_1230 玉座の間にモンスターを配置
	}
	
	// ■ダクトから抜けたところのルキヤ周辺にモンスターを配置しない
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_RESISTANCE_RUKIYA")) {			// Num6 = 15
			SetEventFlg_("BFG_LIMIT_5F_DUCT", false);						// Bit_1229 ルキヤ周辺にモンスターを配置
		} else {
			SetEventFlg_("BFG_LIMIT_5F_DUCT", true);						// Bit_1229 ルキヤ周辺にモンスターを配置
		}
	} else {
		SetEventFlg_("BFG_LIMIT_5F_DUCT", true);							// Bit_1229 ルキヤ周辺にモンスターを配置
	}
	
	// ■幻の壁の前にモンスターを配置しない
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_RUKIYA_SIGNPOST")) {				// Num6 = 29
			SetEventFlg_("BFG_LIMIT_5F_PHANTOM_WALL", false);				// Bit_1228 幻の壁の前にモンスターを配置
		} else {
			SetEventFlg_("BFG_LIMIT_5F_PHANTOM_WALL", true);				// Bit_1228 幻の壁の前にモンスターを配置
		}
	} else {
		SetEventFlg_("BFG_LIMIT_5F_PHANTOM_WALL", true);					// Bit_1228 幻の壁の前にモンスターを配置
	}
	
	//----------
	// ▼NPC配置
	//----------
	// ID初期化
	g_npc_rukiya		 <- C_NONE_ID;
	
	// ■ルキヤ
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_RESISTANCE_RUKIYA")) {			// Num6 = 15
			local id_rukiya	 = ReadNpc_("n009");		// ルキヤ
			g_npc_rukiya	 = ArrangePointNpc_(id_rukiya, "npc_rukiya000");
			SetReactorMsg_(g_npc_rukiya, "REC_NPC_RUKIYA");
		}
	}
	
	//-----------
	// ▼地雷配置
	//-----------
	// BitFlag取得
	local bit_pass_secret	 = GetEventFlg_("BFG_SECRET_PRISON_ROOM");		// Bit_1209 隠し部屋オープン
	local bit_open_door		 = GetEventFlg_("BFG_OPEN_PRISON_CONTROL_ROOM");// Bit_1221 制御部屋扉オープン
	
	// ID初期化
	g_mine_demo411		 <- C_NONE_ID;
	g_mine_demo412		 <- C_NONE_ID;
	g_mine_demo423		 <- C_NONE_ID;
	g_mine_duct			 <- C_NONE_ID;
	g_mine_no_entry		 <- C_NONE_ID;
	g_mine_no_entry02	 <- C_NONE_ID;
	g_mine_secret_near	 <- C_NONE_ID;
	g_mine_secret_enter	 <- C_NONE_ID;
	g_mine_control_room	 <- C_NONE_ID;
	g_mine_elevator		 <- C_NONE_ID;
	g_mine_jailer01		 <- C_NONE_ID;
	g_mine_jailer02		 <- C_NONE_ID;
	
	// ■Demo411起動地雷
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_MEETING_02")) {					// Num6 = 13
			g_mine_demo411 = SetPointBoxEventMine_("mine_demo411", false);
		}
	}
	
	// ■Demo412起動地雷
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_SALVATION_VOICE")) {				// Num6 = 14
			g_mine_demo412 = SetPointCircleEventMine_("mine_demo412", true);
		}
	}
	
	// ■Demo423起動地雷
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_RUKIYA_SIGNPOST")) {				// Num6 = 29
			g_mine_demo423 = SetPointCircleEventMine_("mine_demo423", true);
		}
	}
	
	// ■ダクト
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num > GetFlagID_("CONST_SS_PR_SALVATION_VOICE")) {				// Num6 > 14
			g_mine_duct = SetPointCircleEventMine_("mine_duct", true);
		}
	}
	else if (main_num > GetFlagID_("CONST_SM_PRISON")) {							// Num0 > 5
		g_mine_duct = SetPointCircleEventMine_("mine_duct", true);
	}
	
	// ■玉座の間の出口付近の進入禁止
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_SALVATION_VOICE")) {				// Num6 = 14
			g_mine_no_entry = SetPointBoxEventMine_("mine_no_entry", false);
		}
	}
	
	// ■玉座の間側の通路の進入禁止
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_RESISTANCE_RUKIYA")) {			// Num6 = 15
			g_mine_no_entry02 = SetPointBoxEventMine_("mine_no_entry02", false);
		}
	}
	
	// ■隠し部屋入口付近の地雷
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_RUKIYA_SIGNPOST")) {				// Num6 = 29
			if (!bit_pass_secret) {		// Bit_1209 隠し部屋オープン
				g_mine_secret_near = SetPointBoxEventMine_("mine_secret_near", false);
			}
		}
	}
	
	// ■隠し部屋 入口
	if (!bit_pass_secret){
		g_mine_secret_enter = SetPointBoxEventMineNoFallWait_("mine_secret_enter");
	}
	
	// ■制御部屋扉の地雷
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num <= GetFlagID_("CONST_SS_PR_RUKIYA_SIGNPOST")) {				// Num6 =< 29
			if (!bit_open_door) {		// Bit_制御部屋扉オープン
				g_mine_control_room = SetPointCircleEventMine_("mine_control_room", true);
			}
		}
	}
	
	// ■エレベーターのマップチェンジ地雷
	g_mine_elevator = SetPointBoxEventMine_("mine_elevator", true);

	// ■リアクター警告メッセージ1地雷
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_RESISTANCE_RUKIYA")) {			// Num6 = 15
			g_mine_jailer01 = SetPointBoxEventMine_("mine_jailer01", false);
		}
	}

	// ■リアクター警告メッセージ②地雷
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_MEETING_02")) {					// Num6 = 13
			g_mine_jailer02 = SetPointBoxEventMine_("mine_jailer02", false);
		}
	}

	//---------------
	// ▼ギミック配置
	//---------------
	// ID初期化
	g_gmk_elevator_door		 <- C_NONE_ID;
	g_gmk_elevator_lift		 <- C_NONE_ID;
	g_gmk_door				 <- C_NONE_ID;
	g_gmk_door02			 <- C_NONE_ID;
	
	// リソース読み込み
	local id_elevator_door	 = ReadGimmick_("o_S02_01");		// エレベーターの扉
	local id_elevator_lift	 = ReadGimmick_("o_S02_00");		// エレベーターリフト
	
	// ■エレベーターの扉
	g_gmk_elevator_door = ArrangePointGimmick_("o_S02_01", id_elevator_door, "gmk_elevator_door");

	// ■エレベーターリフト
	g_gmk_elevator_lift = ArrangePointGimmick_("o_S02_00", id_elevator_lift, "gmk_elevator_lift");

	// ■共通扉
	if(!bit_open_door){
		local id_door	 = ReadGimmick_("o_S02_11");		// 共通扉
		g_gmk_door		 = ArrangePointGimmick_("o_S02_11", id_door, "gmk_door");
	}
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_BLAST_EXPLANATION_1ST")) {		// Num6 < 16
			local id_door	 = ReadGimmick_("o_S02_11");	// 共通扉
			g_gmk_door02	 = ArrangePointGimmick_("o_S02_11", id_door, "gmk_door02");
			SetMotion_(g_gmk_door02, MOT_GIMMICK_4, BLEND_N);
		}
	}
	// ■コントロールパネル電源（明滅）
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_RUKIYA_SIGNPOST")) {				// Num6 = 29
			local id_panel = ReadGimmick_("o_S02_24");
			local gmk_panel = ArrangePointGimmick_("o_S02_24", id_panel, "gmk_panel");
		}
	}

	//-------------------------
	// ▼リアクターポイント配置
	//-------------------------
	// ■運搬用エレベーター
	local reactorPoint01 = ArrangeMsgReactorPoint("recpoint_01_erevator", GetFlagID_("BFG_REACTER_POINT_075")// Bit_1574 運搬用エレベーター
		, SHORT_DIST, "REC_POINT_01", "REC_POINT_01_2");
	
	// ■フタが外れた通気口１－２
	local reactorPoint02 = ArrangeMsgReactorPoint("recpoint_02_duct01", GetFlagID_("BFG_REACTER_POINT_079")// Bit_1578 フタが外れた通気口
		, SHORT_DIST, "REC_POINT_02", "REC_POINT_02_2");
	
	local reactorPoint02_2 = ArrangeMsgReactorPoint("recpoint_02_duct02", GetFlagID_("BFG_REACTER_POINT_079")// Bit_1578 フタが外れた通気口
		, SHORT_DIST, "REC_POINT_02", "REC_POINT_02_2");
	
	// ■暗証扉
	if (bit_pass_secret) {		// Bit_1209 隠し部屋オープン
		if(!bit_open_door){
			g_reactorPoint03 <- ArrangeMsgReactorPoint("recpoint_03_door", GetFlagID_("BFG_REACTER_POINT_080")// Bit_1579 暗証扉
				, SHORT_DIST, "REC_POINT_03", "REC_POINT_03_2");
		}
	}
	
	//-------------------------
	// ▼ナビマップアイコン配置
	//-------------------------
	// ■「！」
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_SALVATION_VOICE")) {				// Num6 = 14
			local exclamation01 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "mine_duct");  // ダクト
		}
	}

	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_RUKIYA_SIGNPOST")) {				// Num6 = 29
			if (bit_pass_secret) {		// Bit_1209 隠し部屋オープン
				if (!bit_open_door) {		// Bit_制御部屋扉オープン
					g_exclamation03 <- ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "gmk_door");  // 共通扉
				}
			}
		}
	}

	// ■Demo423起動地雷
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_RUKIYA_SIGNPOST")) {				// Num6 = 29
			if (bit_pass_secret) {		// Bit_1209 隠し部屋オープン
				g_exclamation04 <- ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "mine_demo423");  // Demo423起動地雷
			}
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
	
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {									// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_LAST_ANSESU_1ST")) {					// Num6 = 30
			SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_PR_LAST_ANSESU_2ND"));			// Num6 <- 31
			
			// Demo424[アンセスの最後②]（過去映像）再生
			SetFade_(FADE_OUT, FADE_COLOR_WHITE, FADE_SHORT);
			SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
			WaitFade_();

			ChangeDemo_(424); 
		}
		else if (prison_num == GetFlagID_("CONST_SS_PR_LAST_ANSESU_2ND")) {				// Num6 = 31
			SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_PR_LAST_ANSESU_6TH"));			// Num6 <- 35
			
			SetReturnDemoPosDir_(Vec3(240.802, 0.0, -430.995), 180);
			// Demo425[アンセスの最後③]（制御装置の部屋）再生
			SetFade_(FADE_OUT, FADE_COLOR_WHITE, FADE_SHORT);
			SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
			WaitFade_();

			ChangeDemo_(425); 
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
	case g_mine_demo411 :
		uMineDemo411Start();
		break;
	case g_mine_demo412 :
		uMineDemo412Start();
		break;
	case g_mine_demo423 :
		uMineDemo423Start();
		break;
	case g_mine_duct :
		uMineDuct();
		break;
	case g_mine_no_entry :
		uMineNoEntry();
		break;
	case g_mine_no_entry02 :
		uMineNoEntry02();
		break;
	case g_mine_secret_near :
		uMineSecretNear();
		break;
	case g_mine_secret_enter :
		uMineSecretEntrance();
		break;
	case g_mine_control_room :
		uMineControlRoom();
		break;
	case g_mine_elevator :
		uMineElevator();
		break;
	case g_mine_jailer01 :
		uMineJailer01();
		break;
	case g_mine_jailer02 :
		uMineJailer02();
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
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_RESISTANCE_RUKIYA")) {			// Num6 = 15
			SetTalkCameraType_(g_npc_rukiya, TALK_CAMERA_UP);//カメラの設定
			// 会話カメラ時に透過されるのでアルファ値を設定する
			SetManualCalcAlpha_(g_npc_rukiya, true);
			SetAlpha_(g_npc_rukiya, 1.0);
			
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_RUKIYA");	//ルキヤ
			ShowMsg_("NPC_RUKIYA_MSG_100");		// 「４階の右上に 空き部屋がある。
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		Demo411起動地雷に触れた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineDemo411Start()
{
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_MEETING_02")) {					// Num6 = 13
			SetEventFlg_("BFG_LIMIT_NPC_PERIPHERAL", true);		// Bit_1231 通路封鎖NPC周りにモンスターを配置
			// ルーラ禁止
			SetEventFlg_("BFG_PLAYERABILITY_RULER_PROHIBIT", true);			// Bit_440 ルーラ禁止
			SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_PR_SALVATION_VOICE"));		// Num6 <- 14
			
			// デモ再生後の復帰位置
			SetReturnDemoPosDir_(Vec3(-53.56, 60.0,-23.94), -10);
			
			// Demo411[救いの声]再生
			TouchNpcChangeDemo(411);
		}
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		Demo412起動地雷に触れた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineDemo412Start()
{
	local player = GetPlayerId_();

	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_SALVATION_VOICE")) {				// Num6 = 14
			local pos  = Vec3(-131.0, 60.0, 133.0);
			uPlayerTurnAroundPos(pos);

			OpenMsgWnd_();
			ShowMsg_("SYSTEM_MSG_000");		// ダクトの中に 入りますか？
			KeyInputWait_();
			CloseMsgWnd_();
			
			// 「はい」
			if (GetQueryResult_() == QUERY2_0) {
				// ルーラ禁止を解除する
				SetEventFlg_("BFG_PLAYERABILITY_RULER_PROHIBIT", false);				// Bit_440 ルーラ禁止
				SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_PR_RESISTANCE_RUKIYA"));	// Num6 <- 15
				
				SetReturnDemoPosDir_(Vec3(-403.484, 0, -199.605), 0);
				
				// Demo412[レジスタンスのルキヤ]再生
				TouchNpcChangeDemo(412);
			}
			// 「いいえ」
			else{
				// 処理なし
			}
			
		}
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		Demo423起動地雷に触れた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineDemo423Start()
{
	SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_PR_LAST_ANSESU_1ST"));	// Num6 <- 28
	
	// Demo423[アンセスの最後①]（立体映像）再生
	TouchNpcChangeDemo(423);
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		ダクトを調べた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineDuct()
{
	local player = GetPlayerId_();
	local pos  = Vec3(-131.0, 60.0, 133.0);
	
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num > GetFlagID_("CONST_SS_PR_SALVATION_VOICE")) {				// Num6 > 14
			uPlayerTurnAroundPos(pos);

			OpenMsgWnd_();
			ShowMsg_("SYSTEM_MSG_000");		// ダクトの中に 入りますか？
			KeyInputWait_();
			CloseMsgWnd_();
			
			// 「はい」
			if (GetQueryResult_() == QUERY2_0) {
				SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
				SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
				WaitFade_();
				
				SetPos_(player, Vec3(-242, 0, -197));
				SetDir_(player, -142);
				Wait_(17);
				
				SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
				SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
				WaitFade_();
			}
			// 「いいえ」
			else {
				// 処理なし
			}
		}
	}
	else if (main_num > GetFlagID_("CONST_SM_PRISON")) {							// Num0 > 5
		uPlayerTurnAroundPos(pos);

		OpenMsgWnd_();
		ShowMsg_("SYSTEM_MSG_000");		// ダクトの中に 入りますか？
		KeyInputWait_();
		CloseMsgWnd_();
		
		// 「はい」
		if (GetQueryResult_() == QUERY2_0) {
			SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
			SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
			WaitFade_();
			
			SetPos_(player, Vec3(-242, 0, -197));
			SetDir_(player, -142);
			Wait_(17);
			
			SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
			SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
			WaitFade_();
		}
		// 「いいえ」
		else {
			// 処理なし
		}
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		玉座の間の出口付近の進入禁止
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineNoEntry()
{
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ITABURU");	//イッタブル
	ShowMsg_("NPC_ITTABURU_MSG_090");	// 「絶対に 追い詰めよ！
	KeyInputWait_();
	CloseMsgWnd_();
	
	OpenMsgWnd_();
	ShowMsg_("SYSTEM_MSG_001");			// 外に 出るのは 危険のようだ。
	KeyInputWait_();
	CloseMsgWnd_();

	CommPlayerTurnMoveDirWalk(0);
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		玉座の間側の通路の進入禁止
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineNoEntry02()
{
	SetBoneEffect_("ef300_20_target_icon", g_npc_rukiya);	// 発見エフェクト
	PlaySE_("SE_DEM_053");				//「ピン！」
	Wait_(15);

	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RUKIYA");	//ルキヤ
	ShowMsg_("NPC_RUKIYA_MSG_101");		// 「（仮）「どこ行くんだい！
	KeyInputWait_();
	CloseMsgWnd_();
	
	CommPlayerTurnMoveDirWalk(-90);
	
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		隠し部屋付近の地雷に触れた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineSecretNear()
{
	// 地雷削除
	DeleteEventMine_(g_mine_secret_near);
	// リアクター反応があった時の共通処理
	CommReactorActionDiscover();
	// システムメッセージ
	OpenMsgWnd_();
	ShowMsg_("SYSTEM_MSG_999");		// リアクターが　反応している。
	KeyInputWait_();
	CloseMsgWnd_();
	// モーションを待機状態に戻す共通処理
	CommResetPlayerMotion();
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		隠し部屋 入り口
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineSecretEntrance()
{
	local bit_open_door		 = GetEventFlg_("BFG_OPEN_PRISON_CONTROL_ROOM");// Bit_1221 制御部屋扉オープン

	SetEventFlg_("BFG_SECRET_PRISON_ROOM", true);		// Bit_1209 隠し部屋オープン
	DeleteEventMine_(g_mine_secret_enter);
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_RUKIYA_SIGNPOST")) {				// Num6 = 29
			g_exclamation03 <- ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "gmk_door");  // 「！」共通扉
			g_exclamation04 <- ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "mine_demo423");  // 「！」Demo423起動地雷
		}
	}
	if(!bit_open_door){
		g_reactorPoint03 <- ArrangeMsgReactorPoint("recpoint_03_door", GetFlagID_("BFG_REACTER_POINT_080")// Bit_1579 暗証扉
		, SHORT_DIST, "REC_POINT_03", "REC_POINT_03_2");
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		制御部屋の扉を調べた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineControlRoom()
{
	local player = GetPlayerId_();

	local pos  = Vec3(240.0, 0.0, -338.0);
	uPlayerTurnAroundPos(pos);
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_RUKIYA_SIGNPOST")) {				// Num6 = 29
			OpenMsgWnd_();
			ShowMsg_("SYSTEM_MSG_002");		// 「マスターキー ヲ 確認シマシタ。
			KeyInputWait_();
			CloseMsgWnd_();
			
			// 暗転
			SetFadePlane_(FADE_PLANE.PLANE_3D);//メッセージより下にフェードをかける
			SetFade_(FADE_OUT , FADE_COLOR_BLACK, 30);
			SetFadeSub_(FADE_OUT , FADE_COLOR_BLACK, 30);
			WaitFade_();
			WaitFadeSub_();

			PlaySE_("SE_FLD_005");	// 扉（小さな電子扉）
			
			OpenMsgWnd_();
			ShowMsg_("SYSTEM_MSG_003");		// トビラのカギが 開いた！
			KeyInputWait_();
			CloseMsgWnd_();
			
			SetEventFlg_("BFG_OPEN_PRISON_CONTROL_ROOM", true);		// Bit_1221 制御部屋扉オープン
			DeleteEventMine_(g_mine_control_room);
			
			SetActive_(g_gmk_door, false);	// 暗転中に制御部屋扉を消す
			SetActive_(g_reactorPoint03, false);	// リアクターポイントを消す
			SetNaviMapIconVisible_(g_exclamation03, false);	// 「！」アイコンを消す
			//暗転を開ける
			SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);
			SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, 30);
			WaitFade_();
			WaitFadeSub_();
		} else {
			OpenMsgWnd_();
			ShowMsg_("SYSTEM_MSG_996");		// （仮）扉には ロックがかかっている。
			KeyInputWait_();
			CloseMsgWnd_();
		}
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
			ShowMsg_("SYSTEM_MSG_998");				// （仮）ボタンを押しても 反応がない。
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else {
			OpenMsgWnd_();
			ShowMsg_("SYSTEM_MSG_997");		//（仮）エレベーターが 動いている。
			KeyInputWait_();
			if(GetQueryResult_() == QUERY_YES){
				CloseMsgWnd_();

				DeleteEventMine_(g_mine_elevator);
				// １階に移動
				ChangeMapPosDir_("S02_00", Vec3(0.7, 30.0, -340.0), 2);
				WaitFade_();
				PlaySE_("SE_FLD_061");	// エレベータで移動
			}else{
				CloseMsgWnd_();
			}
		}
	}
	else if (main_num > GetFlagID_("CONST_SM_PRISON")) {						// Num0 > 5
		OpenMsgWnd_();
		ShowMsg_("SYSTEM_MSG_997");			//（仮）エレベーターが 動いている。
		KeyInputWait_();
		if(GetQueryResult_() == QUERY_YES){
			CloseMsgWnd_();

			DeleteEventMine_(g_mine_elevator);
			// １階に移動
			ChangeMapPosDir_("S02_00", Vec3(0.7, 30.0, -340.0), 2);
			WaitFade_();
			PlaySE_("SE_FLD_061");	// エレベータで移動
		}else{
			CloseMsgWnd_();
		}
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		リアクター警告メッセージ地雷①に触れた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineJailer01()
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
	CommPlayerTurnMoveDirWalk(-90);
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
	CommPlayerTurnMoveDirWalk(90);
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


