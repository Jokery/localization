//===================== I02_00氷の遺跡 上層 ====================


//------------------------------------------------
//		戦闘終了後
//------------------------------------------------
function AfterBattle()
{
	local main_num			= GetNumFlg_("NUM_SCENARIO_MAIN");			// Num0
	local ice_event_num		= GetNumFlg_("NUM_SCENARIO_SUB_ICE");		// Num5

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
	local main_num			 = GetNumFlg_("NUM_SCENARIO_MAIN");			// Num0
	local ice_event_num		 = GetNumFlg_("NUM_SCENARIO_SUB_ICE");		// Num5
	
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
	SetEventFlg_("BFG_ARRIVE_AT_I02", true);							// Bit_92 到達フラグ 氷の遺跡

	local main_num			 = GetNumFlg_("NUM_SCENARIO_MAIN");			// Num0
	local ice_event_num		 = GetNumFlg_("NUM_SCENARIO_SUB_ICE");		// Num5

	local bit_door_est = GetEventFlg_("BFG_ICE_REMAINS_LOCK_DOOR_SECOND");	// Bit_1151 扉のロック解除
	local bit_door_west = GetEventFlg_("BFG_ICE_REMAINS_LOCK_DOOR_FIRST");	// Bit_1150 扉のロック解除

	DebugPrint(" ");
	DebugPrint("NUM_SCENARIO_MAIN の値は " + main_num + " になりました。");

	//-----------
	// ▼地雷配置
	//-----------
	// ID初期化
	g_mine_west		 <- C_NONE_ID;
	g_mine_est		 <- C_NONE_ID;
	g_mine_west_close	 <- C_NONE_ID;
	g_mine_est_close	 <- C_NONE_ID;

	//■ 隔壁扉のロック地雷
	if(bit_door_est == false){
		g_mine_est = SetPointCircleEventMine_("mine_est_open", true);
		//ロックがかかった状態の扉のメッセージ
		g_mine_est_close = SetPointCircleEventMine_("mine_est_close", true);
	}

	//■ 隔壁扉のロック地雷
	if(bit_door_west == false){
		g_mine_west = SetPointCircleEventMine_("mine_west_open", true);
		//ロックがかかった状態の扉のメッセージ
		g_mine_west_close = SetPointCircleEventMine_("mine_west_close", true);
	}

	DebugPrint("イベント地雷の読込");
	
	//---------------
	// ▼ギミック配置
	//---------------
	// ID初期化
	g_gmk_door_west		 <- C_NONE_ID;
	g_gmk_door_est		 <- C_NONE_ID;

		// リソース読み込み
	local id_door	 = ReadGimmick_("o_I02_01");	// ドア

	// ■自動ドア（ロックを解除するとドアが開きます
	if(bit_door_west == false){
		g_gmk_door_west	 = ArrangePointGimmick_("o_I02_01", id_door, "g_door_west");
		SetMotion_(g_gmk_door_west, MOT_GIMMICK_0, BLEND_N);
	}
	// ■自動ドア（ロックを解除するとドアが開きます
	if(bit_door_est == false){
		g_gmk_door_est	 = ArrangePointGimmick_("o_I02_01", id_door, "g_door_est");
		SetMotion_(g_gmk_door_est, MOT_GIMMICK_0, BLEND_N);
	}

	//-------------------------
	// ▼リアクターポイント配置
	//-------------------------
	// ■自動ドア １－２ ※表と裏から調べられるようにドア１つにつき２か所に配置
	if(bit_door_est == false){
		reactorPoint02 <- ArrangeMsgReactorPoint("reactorPoint_02", GetFlagID_("BFG_REACTER_POINT_062")// Bit_1561
			, SHORT_DIST, "REC_POINT_ICE_01", "REC_POINT_ICE_01_2");
		reactorPoint02_2 <- ArrangeMsgReactorPoint("reactorPoint_02_2", GetFlagID_("BFG_REACTER_POINT_062")// Bit_1561
			, SHORT_DIST, "REC_POINT_ICE_01", "REC_POINT_ICE_01_2");
	}
	
	if(bit_door_west == false){
		reactorPoint01 <- ArrangeMsgReactorPoint("reactorPoint_01", GetFlagID_("BFG_REACTER_POINT_062")// Bit_1561
			, SHORT_DIST, "REC_POINT_ICE_01", "REC_POINT_ICE_01_2");
		reactorPoint01_2 <- ArrangeMsgReactorPoint("reactorPoint_01_2", GetFlagID_("BFG_REACTER_POINT_062")// Bit_1561
			, SHORT_DIST, "REC_POINT_ICE_01", "REC_POINT_ICE_01_2");
	}

	//-------------------------
	// ▼ナビマップアイコン配置
	//-------------------------
	// ■「！」
	if(bit_door_west == false){
		g_exclamation01 <- ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "icon_door01");  // 自動ドア
	}
	
	if(bit_door_est == false){
		g_exclamation02 <- ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "icon_door02");  // 自動ドア
	}

	EventEnd_();
}

//------------------------------------------------
//		フィールド操作開始
//------------------------------------------------
function EventStartOperate()
{
	local main_num			= GetNumFlg_("NUM_SCENARIO_MAIN");			// Num0
	local ice_event_num		= GetNumFlg_("NUM_SCENARIO_SUB_ICE");		// Num5

	/*
		処理なし
	*/

	EventEnd_();
}

//------------------------------------------------
//		ＮＰＣ接触時
//------------------------------------------------
function TouchNpc()
{
	local main_num			= GetNumFlg_("NUM_SCENARIO_MAIN");			// Num0
	local ice_event_num		= GetNumFlg_("NUM_SCENARIO_SUB_ICE");		// Num5

	/*
		処理なし
	*/

	EventEnd_();
}

//------------------------------------------------
//		地雷接触時
//------------------------------------------------
function TouchEventMine()
{
	local main_num			= GetNumFlg_("NUM_SCENARIO_MAIN");			// Num0
	local ice_event_num		= GetNumFlg_("NUM_SCENARIO_SUB_ICE");		// Num5

	local target = GetTouchEventMineId_();

	local bit_door_est = GetEventFlg_("BFG_ICE_REMAINS_LOCK_DOOR_SECOND");	// Bit_1151 扉のロック解除
	local bit_door_west = GetEventFlg_("BFG_ICE_REMAINS_LOCK_DOOR_FIRST");	// Bit_1150 扉のロック解除

	switch ( target ) {
	case g_mine_est_close:
		CommPlayerTurnAroundObj(g_gmk_door_est);
		if( bit_door_est  == false){
			OpenMsgWnd_();
			ShowMsg_("LOCK_MESSAGE");		// （仮）扉には ロックがかかっている。
			KeyInputWait_();
			CloseMsgWnd_();
		}
		break;

	//自動ドア
	case g_mine_west:
		CommPlayerTurnAroundObj(g_gmk_door_west);
		if( bit_door_west  == false){
			OpenMsgWnd_();
			ShowMsg_("SYSTEM_MSG_000");		// （仮）扉のロックを 解除しますか？
			KeyInputWait_();
			CloseMsgWnd_();
			
			// 「はい」
			if (GetQueryResult_() == QUERY2_0) {
				SetNaviMapIconVisible_(g_exclamation01, false);
				SetEventFlg_("BFG_ICE_REMAINS_LOCK_DOOR_FIRST", true);	// Bit_1150 扉のロック解除

				DeleteEventMine_(g_mine_west);
				DeleteEventMine_(g_mine_west_close);
				SetActive_(reactorPoint01, false);
				SetActive_(reactorPoint01_2, false);

				PlaySE_("SE_FLD_005");	// 扉（小さな電子扉）
				SetMotion_(g_gmk_door_west, MOT_GIMMICK_1, BLEND_N);
				Wait_(25);
				SetActive_(g_gmk_door_west, false);
			}
			// 「いいえ」
			else {
				// 処理なし
			}
		}
		break;

	case g_mine_west_close:
		CommPlayerTurnAroundObj(g_gmk_door_west);
		if( bit_door_west  == false){
			OpenMsgWnd_();
			ShowMsg_("LOCK_MESSAGE");		// （仮）扉には ロックがかかっている。
			KeyInputWait_();
			CloseMsgWnd_();
		}
		break;

	//自動ドア
	case g_mine_est:
		CommPlayerTurnAroundObj(g_gmk_door_est);
		if( bit_door_est  == false){
			OpenMsgWnd_();
			ShowMsg_("SYSTEM_MSG_000");		// （仮）扉のロックを 解除しますか？
			KeyInputWait_();
			CloseMsgWnd_();
			
			// 「はい」
			if (GetQueryResult_() == QUERY2_0) {
				SetNaviMapIconVisible_(g_exclamation02, false);
				SetEventFlg_("BFG_ICE_REMAINS_LOCK_DOOR_SECOND", true);	// Bit_1151 扉のロック解除

				DeleteEventMine_(g_mine_est);
				DeleteEventMine_(g_mine_est_close);
				SetActive_(reactorPoint02, false);
				SetActive_(reactorPoint02_2, false);

				PlaySE_("SE_FLD_005");	// 扉（小さな電子扉）
				SetMotion_(g_gmk_door_est, MOT_GIMMICK_1, BLEND_N);
				Wait_(25);
				SetActive_(g_gmk_door_est, false);
			}
			// 「いいえ」
			else {
				// 処理なし
			}
		}
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
	local main_num			= GetNumFlg_("NUM_SCENARIO_MAIN");			// Num0
	local ice_event_num		= GetNumFlg_("NUM_SCENARIO_SUB_ICE");		// Num5

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


