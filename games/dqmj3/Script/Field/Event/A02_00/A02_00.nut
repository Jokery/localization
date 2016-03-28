//===================== A02_00送電施設 ====================


//------------------------------------------------
//		戦闘終了後
//------------------------------------------------
function AfterBattle()
{
	// フラグを取得
	local main_num   = GetNumFlg_("NUM_SCENARIO_MAIN");
	local city_num   = GetNumFlg_("NUM_SCENARIO_SUB_CITY");

	EventEnd_();
}

//------------------------------------------------
//		フェードアウト中
//------------------------------------------------
function FadeIn()
{
	// マップ到達フラグ
	SetEventFlg_("BFG_ARRIVE_AT_A02", true);

	// フラグを取得
	local main_num   = GetNumFlg_("NUM_SCENARIO_MAIN");
	local city_num   = GetNumFlg_("NUM_SCENARIO_SUB_CITY");

	local check_dead = GetEventFlg_("BFG_DEAD_RETURN");
	local bit_phantom_wall = GetEventFlg_("BFG_OPEN_SECRET_AREA_A02_00");

	DebugPrint(" ");
	DebugPrint("NUM_SCENARIO_MAIN の値は " + main_num + " になりました。");
	DebugPrint("NUM_SCENARIO_SUB_CITY の値は " + city_num + " になりました。");

	local bit_battery1 = GetEventFlg_("BFG_BATTERY_FIRST");
	local bit_battery2 = GetEventFlg_("BFG_BATTERY_SECOND");

	//---------------
	// ▼ギミック配置
	//---------------
	// ■蓄電器
	local id_battery = ReadGimmick_("o_A02_01");
	battery01 <- ArrangePointGimmick_("o_A02_01", id_battery, "battery01");
	SetDir_(battery01, -90);
	if(bit_battery2){
		SetMotion_(battery01, "GIMMICK_1", 0);		// ON
	}
	battery02 <- ArrangePointGimmick_("o_A02_01", id_battery, "battery02");
	SetDir_(battery02, 90);
	if(bit_battery1){
		SetMotion_(battery02, "GIMMICK_1", 0);		// ON
	}

	// ■モニタ
	local id_screen = ReadGimmick_("o_A02_02");
	screen <- ArrangePointGimmick_("o_A02_02", id_screen, "screen");
	// モニタ(電源Off)
	SetMotion_(screen, "GIMMICK_0", 0);
	if(main_num <= 2){
		if(city_num == GetFlagID_("CONST_SS_CI_START_UP_POWER_PLANT")){
			// モニタ(電源On)赤
			if(bit_battery1 == false && bit_battery2 == false){
				SetMotion_(screen, "GIMMICK_1", 0);
			}
			// モニタ(蓄電器左点灯)
			if(bit_battery1 == true && bit_battery2 == false){
				SetMotion_(screen, "GIMMICK_2", 0);
			}
			// モニタ(蓄電器右点灯)
			if(bit_battery1 == false && bit_battery2 == true){
				SetMotion_(screen, "GIMMICK_3", 0);
			}
			// モニタ(蓄電器両点灯)
			if(bit_battery1 == true && bit_battery2 == true){
				SetMotion_(screen, "GIMMICK_4", 0);
			}
		}
		// モニタ青
		else if(city_num >= GetFlagID_("CONST_SS_CI_RESTORATION_POWER_PLANT")){
			SetMotion_(screen, "GIMMICK_5", 0);
		}
	}
	else{
		// モニタ青
		SetMotion_(screen, "GIMMICK_5", 0);
	}

	// ■ライト01(左)
	local id_light_01 = ReadGimmick_("o_A02_05");
	local light_01 = ArrangePointGimmick_("o_A02_05", id_light_01, "light01");
	if(bit_battery1 == true){
		SetMotion_(light_01, "GIMMICK_1", 0);	// 青
	}

	// ■ライト02(右)
	local id_light_02 = ReadGimmick_("o_A02_04");
	local light_02 = ArrangePointGimmick_("o_A02_04", id_light_02, "light02");
	if(bit_battery2 == true){
		SetMotion_(light_02, "GIMMICK_1", 0);	// 青
	}

	// ■防災シャッター
	if(bit_battery1 == false || bit_battery2 == false){
		local id_door = ReadGimmick_("o_A02_00");
		door01 <- ArrangePointGimmick_("o_A02_00", id_door, "door01");
		door02 <- ArrangePointGimmick_("o_A02_00", id_door, "door02");
		door03 <- ArrangePointGimmick_("o_A02_00", id_door, "door03");
		door04 <- ArrangePointGimmick_("o_A02_00", id_door, "door04");
	}
	
	
	//-----------
	// ▼地雷配置
	//-----------
	// ID初期化
	mineId_001    <- C_NONE_ID;
	mineId_002    <- C_NONE_ID;
	mineId_003    <- C_NONE_ID;
	mineId_004    <- C_NONE_ID;
	mineId_005    <- C_NONE_ID;
	mine_battery1 <- C_NONE_ID;
	mine_battery2 <- C_NONE_ID;
	mine_door01   <- C_NONE_ID;
	mine_door02   <- C_NONE_ID;
	mine_door03   <- C_NONE_ID;
	mine_door04   <- C_NONE_ID;
	
	if(main_num == GetFlagID_("CONST_SM_CITY")){
		// ■送電管理室の入口付近の地雷
		if(city_num == GetFlagID_("CONST_SS_CI_GO_POWER_PLANT")){
			mineId_001 = SetPointBoxEventMine_("mine01", false);
		}
		if(city_num <= GetFlagID_("CONST_SS_CI_START_UP_POWER_PLANT")){
			// ■蓄電器 左（起動前）
			if(bit_battery1 == false){
				mineId_002 = SetPointCircleEventMine_("mine02", true);
			}
			// ■蓄電器 右（起動前）
			if(bit_battery2 == false){
				mineId_003 = SetPointCircleEventMine_("mine03", true);
			}
			// ■モニター
			if(bit_battery1 == true && bit_battery2 == true){
				mineId_004 = SetPointCircleEventMine_("mine04", false);
			}
			else{
				mineId_004 = SetPointCircleEventMine_("mine04", true);
			}
		}
		// ■モニター
		if(city_num >= GetFlagID_("CONST_SS_CI_RESTORATION_POWER_PLANT")){
			mineId_004 = SetPointCircleEventMine_("mine04", true);
		}
	}
	else {
		// ■モニター
		mineId_004 = SetPointCircleEventMine_("mine04", true);
	}
	// ■蓄電器 左（起動後）
	if(bit_battery1 == true){
		mine_battery1 = SetPointCircleEventMine_("mine09", true);
	}
	// ■蓄電器 右（起動後）
	if(bit_battery2 == true){
		mine_battery2 = SetPointCircleEventMine_("mine10", true);
	}

	// ■防災シャッター
	if(bit_battery1 == false || bit_battery2 == false){
		mine_door01 = SetPointCircleEventMine_("mine05", true);
		mine_door02 = SetPointCircleEventMine_("mine06", true);
		mine_door03 = SetPointCircleEventMine_("mine07", true);
		mine_door04 = SetPointCircleEventMine_("mine08", true);
	}

	// ■幻の壁
	if(bit_phantom_wall == false){
		mineId_005 = SetPointBoxEventMineNoFallWait_("mine_phantom_wall_01");
	}
	
	
	//-------------------------
	// ▼リアクターポイント配置
	//-------------------------
	// ■送電制御装置
	local reactorPoint01 = ArrangeMsgReactorPoint("reactorPoint_01", GetFlagID_("BFG_REACTER_POINT_018")
		, SHORT_DIST, "REC_POINT_NOC_01_01", "REC_POINT_NOC_01_02");
	// ■サブ電源（左側）
	local reactorPoint02 = ArrangeMsgReactorPoint("reactorPoint_02", GetFlagID_("BFG_REACTER_POINT_019")
		, SHORT_DIST, "REC_POINT_NOC_02_01", "REC_POINT_NOC_02_02");
	// ■サブ電源（右側）
	local reactorPoint03 = ArrangeMsgReactorPoint("reactorPoint_03", GetFlagID_("BFG_REACTER_POINT_019")
		, SHORT_DIST, "REC_POINT_NOC_02_01", "REC_POINT_NOC_02_02");
	// ■防災シャッター
	if(bit_battery1 == false || bit_battery2 == false){
		// サブ電源（右側）北
		local reactorPoint04 = ArrangeMsgReactorPoint("reactorPoint_04", GetFlagID_("BFG_REACTER_POINT_016")
			, SHORT_DIST, "REC_POINT_NOC_03_01", "REC_POINT_NOC_03_02");
		// 中央左
		local reactorPoint05 = ArrangeMsgReactorPoint("reactorPoint_05", GetFlagID_("BFG_REACTER_POINT_016")
			, SHORT_DIST, "REC_POINT_NOC_03_01", "REC_POINT_NOC_03_02");
		// 中央右
		local reactorPoint06 = ArrangeMsgReactorPoint("reactorPoint_06", GetFlagID_("BFG_REACTER_POINT_016")
			, SHORT_DIST, "REC_POINT_NOC_03_01", "REC_POINT_NOC_03_02");
		// 入口正面
		local reactorPoint07 = ArrangeMsgReactorPoint("reactorPoint_07", GetFlagID_("BFG_REACTER_POINT_016")
			, SHORT_DIST, "REC_POINT_NOC_03_01", "REC_POINT_NOC_03_02");
	}
	
	
	//-----------------
	// ▼マップナビ配置
	//-----------------
	// ■「！」アイコン
	if(main_num == GetFlagID_("CONST_SM_CITY")){
		if(city_num >= GetFlagID_("CONST_SS_CI_START_UP_POWER_PLANT")
		&& city_num <  GetFlagID_("CONST_SS_CI_GO_BACK_KING")){
			local exclamation01 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "screen");     // モニタ
			local exclamation02 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "battery01");  // 蓄電器
			local exclamation03 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "battery02");  // 蓄電器
			SetNaviMapIconVisible_(exclamation01, true);
			SetNaviMapIconVisible_(exclamation02, true);
			SetNaviMapIconVisible_(exclamation03, true);
		}
	}
	// ■防災シャッター
	if(bit_battery1 == true && bit_battery2 == true){
		SetEventFlg_("BFG_MAP_ICON_011", true);
	}


	EventEnd_();
}

//------------------------------------------------
//		フィールド操作開始
//------------------------------------------------
function EventStartOperate()
{
	// フラグを取得
	local main_num     = GetNumFlg_("NUM_SCENARIO_MAIN");
	local city_num     = GetNumFlg_("NUM_SCENARIO_SUB_CITY");

	//-----------
	// デモの再生
	//-----------
	if (main_num == GetFlagID_("CONST_SM_CITY")) {												// Num0 = 2
		// Demo128[電源の復旧_1(起動)]再生後
		if(city_num == GetFlagID_("CONST_SS_CI_RESTORATION_POWER_PLANT")){						// Num3 = 6
			if(GetEventFlg_("BFG_PLAY_DEMO_RESTORATION")){
				SetEventFlg_("BFG_PLAY_DEMO_RESTORATION", false);
				
				// Demo106[電源の復旧_2(都市全景)]再生
				EventStartChangeDemo(106, FADE_COLOR_BLACK);
			}
			else {
				SetNumFlg_("NUM_SCENARIO_SUB_CITY", GetFlagID_("CONST_SS_CI_GO_BACK_KING"));	// Num3 <- 7
				
				// Demo107[電源の復旧_3(起動後)]再生
				EventStartChangeDemo(107, FADE_COLOR_BLACK);
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
	// フラグを取得
	local main_num   = GetNumFlg_("NUM_SCENARIO_MAIN");
	local city_num   = GetNumFlg_("NUM_SCENARIO_SUB_CITY");

	EventEnd_();
}

//------------------------------------------------
//		地雷接触時
//------------------------------------------------
function TouchEventMine()
{
	// フラグを取得
	local main_num = GetNumFlg_("NUM_SCENARIO_MAIN");						// Num0
	local city_num = GetNumFlg_("NUM_SCENARIO_SUB_CITY");					// Num3

	// メタルハンターの起動
	local bit_machine = GetEventFlg_("BFG_MACHINE_POWERON");				// Bit1043
	// 蓄電器の起動
	local bit_battery1 = GetEventFlg_("BFG_BATTERY_FIRST");					// Bit1044
	local bit_battery2 = GetEventFlg_("BFG_BATTERY_SECOND");				// Bit1045
	// 幻の壁
	local bit_phantom_wall = GetEventFlg_("BFG_OPEN_SECRET_AREA_A02_00");	// Bit1812

	local target = GetTouchEventMineId_();

	switch(target){
	// ■送電管理室の入口付近の地雷
	case mineId_001:
		if (main_num == GetFlagID_("CONST_SM_CITY")) {						// Num0 = 2
			if(city_num == GetFlagID_("CONST_SS_CI_GO_POWER_PLANT")){		// Num3 = 5
				SetNumFlg_("NUM_SCENARIO_SUB_CITY",GetFlagID_("CONST_SS_CI_START_UP_POWER_PLANT"));
				DeleteEventMine_(mineId_001);
				
				SetReturnDemoPosDir_(Vec3(363.6, 16.2, -241.7), -73);
				
				// Demo103[送電施設を起動]再生
				ChangeDemo_(103);
			}
		}
		break;
	// ■蓄電器（起動前）
	case mineId_002:
		if (main_num == GetFlagID_("CONST_SM_CITY")) {						// Num0 = 2
			if(city_num == GetFlagID_("CONST_SS_CI_START_UP_POWER_PLANT")){	// Num3 = 5
				SetEventFlg_("BFG_BATTERY_FIRST", true);
				DeleteEventMine_(mineId_002);
				// バッテリーの方向に向く
				CommPlayerTurnAroundObj(battery02);
				
				// 送電施設のメタルハンターの動いている・動いていない状態切り替えフラグ
				//【蓄電池起動前】BFG_MACHINE_POWEROFF -> ON , BFG_MACHINE_POWERON -> OFF
				//【蓄電池起動後】BFG_MACHINE_POWEROFF -> OFF, BFG_MACHINE_POWERON -> ON
				SetEventFlg_("BFG_MACHINE_POWEROFF", false); //（起動前フラグ）
				SetEventFlg_("BFG_MACHINE_POWERON",true);    //（起動後フラグ）
				
				SetReturnDemoPosDir_(Vec3(-267.292, 16.225, -181.608), -90);
				
				// Demo104[蓄電器スイッチON 1]再生
				ChangeDemo_(104);
			}
			else{
				CommPlayerTurnAroundObj(battery02);
				CommonMessage("NOT_START_UP_MSG");
			}
		}
		break;
	case mineId_003:
		if (main_num == GetFlagID_("CONST_SM_CITY")) {						// Num0 = 2
			if(city_num == GetFlagID_("CONST_SS_CI_START_UP_POWER_PLANT")){
				SetEventFlg_("BFG_BATTERY_SECOND", true);
				DeleteEventMine_(mineId_003);
				// バッテリーの方向に向く
				CommPlayerTurnAroundObj(battery01);
				
				// 送電施設のメタルハンターの動いている・動いていない状態切り替えフラグ
				//【蓄電池起動前】BFG_MACHINE_POWEROFF -> ON , BFG_MACHINE_POWERON -> OFF
				//【蓄電池起動後】BFG_MACHINE_POWEROFF -> OFF, BFG_MACHINE_POWERON -> ON
				SetEventFlg_("BFG_MACHINE_POWEROFF", false); //（起動前フラグ）
				SetEventFlg_("BFG_MACHINE_POWERON",true);    //（起動後フラグ）
				
				SetReturnDemoPosDir_(Vec3(-83.002, 16.225, -179.252), 90);
				
				// Demo105[蓄電器スイッチON 2]を再生
				ChangeDemo_(105);
			}
			else{
				CommPlayerTurnAroundObj(battery01);
				CommonMessage("NOT_START_UP_MSG");
			}
		}
		break;
	// ■蓄電器（起動後）
	case mine_battery1:
		if( bit_battery1 == true){
			CommPlayerTurnAroundObj(battery02);
			CommonMessage("MSG_BATTERY_000");
		}
		break;
	case mine_battery2:
		if( bit_battery2 == true){
			CommPlayerTurnAroundObj(battery01);
			CommonMessage("MSG_BATTERY_000");
		}
		break;
	// モニター付近の地雷
	case mineId_004:
		if (main_num == GetFlagID_("CONST_SM_CITY")) {						// Num0 = 2
			if(city_num == GetFlagID_("CONST_SS_CI_START_UP_POWER_PLANT")){
				if( bit_battery1  == true && bit_battery2  == true){
					SetNumFlg_("NUM_SCENARIO_SUB_CITY",GetFlagID_("CONST_SS_CI_RESTORATION_POWER_PLANT"));
					DeleteEventMine_(mineId_004);
					// スクリーンの方向に向く
					CommPlayerTurnAroundObj(screen);
					// 敵パーティのお供体数を制御フラグ(進行度４)
					SetNumFlg_("NUM_ENEMY_PARTY_STRENGTH", 4);
					// 崩落都市の電源が復旧するフラグ
					SetEventFlg_("BFG_RESTORATION_POWER_PLANT", true);
					// センタービル前の扉が開いたら配置モンスターを解禁する用フラグ
					SetEventFlg_("BFG_LIMIT_ENTRANCE_CITY", true);
					// [電源の復旧①]を再生するフラグ
					SetEventFlg_("BFG_PLAY_DEMO_RESTORATION", true);
					
					SetReturnDemoPosDir_(Vec3(366.433, 16.281, -250.0), -179);
					
					// Demo128[電源の復旧①]再生
					ChangeDemo_(128);
				}
				else{
					uPlayerRotateScreenMsg("MSG_SCREEN_001");
				}
			}
			else if(city_num >= GetFlagID_("CONST_SS_CI_RESTORATION_POWER_PLANT")){
				uPlayerRotateScreenMsg("MSG_SCREEN_000");
			}
			else{
				uPlayerRotateScreenMsg("NOT_START_UP_MSG");
			}
		}
		else {
			uPlayerRotateScreenMsg("MSG_SCREEN_000");
		}
		break;
	// 隠し部屋に仕掛けた地雷
	case mineId_005:
		if(bit_phantom_wall  == false){
			SetEventFlg_("BFG_OPEN_SECRET_AREA_A02_00", true);
			DeleteEventMine_(mineId_005);
		}
		break;
	// 閉まっている自動扉に仕掛けた地雷
	case mine_door01:
		if(bit_battery1 == false || bit_battery2 == false){
			CommPlayerTurnAroundObj(door04);
			CommonMessage("MSG_DOOR_000");
		}
		break;
	case mine_door02:
		if(bit_battery1 == false || bit_battery2 == false){
			CommPlayerTurnAroundObj(door03);
			CommonMessage("MSG_DOOR_000");
		}
		break;
	case mine_door03:
		if(bit_battery1 == false || bit_battery2 == false){
			CommPlayerTurnAroundObj(door02);
			CommonMessage("MSG_DOOR_000");
		}
		break;
	case mine_door04:
		if(bit_battery1 == false || bit_battery2 == false){
			CommPlayerTurnAroundObj(door01);
			CommonMessage("MSG_DOOR_000");
		}
		break;
	default:
		DebugPrint("対象のイベント地雷がありません");
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

//===========================================================
// 自作関数：メッセージの表示関数
//-----------------------------------------------------------
// 引数    ：表示するメッセージキー
// 戻り値  ：なし
//===========================================================
function CommonMessage(msg_key)
{
	OpenMsgWnd_();
	ShowMsg_(msg_key);
	KeyInputWait_();
	CloseMsgWnd_();
}

//===========================================================
// 自作関数：スクリーンの方向に主人公を向けてメッセージを表示
//-----------------------------------------------------------
// 引数    ：表示するメッセージキー
// 戻り値  ：なし
//===========================================================
function uPlayerRotateScreenMsg(msg_key)
{
	CommPlayerTurnAroundObj(screen);
	CommonMessage(msg_key);
}
