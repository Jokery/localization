//===================== 拠点【ノチョーラキングダム(B1F)】 ====================

//+++++++++++++++++++++++++++++++++++++++++++++++++
// 起動条件：戦闘終了後
//-------------------------------------------------
// 主な用途：戦闘終了後にフラグを操作する時などを行う
//+++++++++++++++++++++++++++++++++++++++++++++++++
function AfterBattle()
{
	EventEnd_();
}

//+++++++++++++++++++++++++++++++++++++++++++++++++
// 起動条件：FadeIn()より前に呼ばれる
//-------------------------------------------------
// 主な用途：デモ後にライド状態の強制解除や
//           例外的なイベントフラグの設定などを行う
//+++++++++++++++++++++++++++++++++++++++++++++++++
function BeforeInitMap()
{
	// 進行フラグの状態を取得
	local main_num  = GetNumFlg_("NUM_SCENARIO_MAIN");
	local outside_num = GetNumFlg_("NUM_SCENARIO_SUB_INSIDE_CLEAR"); // 表シナリオクリア後

	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){
		if(outside_num == GetFlagID_("CONST_SS_OS_GO_POINT_ZERO_LAB_2")){
			if(GetEventFlg_("BFG_PLAY_PSEUDO_DEMO_A01_01") == true){
				//ライド強制解除
				SetRideOffStart_();
			}
		}
	}

	EventEnd_();
}

//+++++++++++++++++++++++++++++++++++++++++++++++++
// 起動条件：画面切り替えフェードイン中
//-------------------------------------------------
// 主な用途：NPC、地雷等の読み込みと設置などを行う
//+++++++++++++++++++++++++++++++++++++++++++++++++
function FadeIn()
{
	// 進行フラグの状態を取得
	local main_num  = GetNumFlg_("NUM_SCENARIO_MAIN");
	local outside_num = GetNumFlg_("NUM_SCENARIO_SUB_INSIDE_CLEAR"); // 表シナリオクリア後
	local allclear_num = GetNumFlg_("NUM_SCENARIO_SUB_ALL_CLEAR");   // 完全クリア後
	DebugPrint(" ");
	DebugPrint("NUM_SCENARIO_MAIN の値は " + main_num + " になりました。");

	// マップ到達フラグ
	//SetEventFlg_("", true);// (仮)対応するフラグが用意されていないのでコメント化
	// ルーラポイント解放
	SetEventFlg_("BFG_RULER_ADD_028", true);

//--------------------------
// ギミック
	// 初期化
	g_DiscDevice <- C_NONE_ID;
	g_lift_e <- C_NONE_ID;
	g_lift_n <- C_NONE_ID;

	// エレベータの扉
	local elevator_id = ReadGimmick_("o_A01_16");
	local g_elevator_e = ArrangePointGimmick_("o_A01_16", elevator_id, "g_elevator");
	local g_elevator_n = ArrangePointGimmick_("o_A01_16", elevator_id, "g_elevator02");
	// エレベータのリフト
	local lift_id = ReadGimmick_("o_A01_17");
	g_lift_e = ArrangePointGimmick_("o_A01_17", lift_id, "g_elevator_lift");
	g_lift_n = ArrangePointGimmick_("o_A01_17", lift_id, "g_elevator_lift02");
	//ディスク装置
	local DiscDeviceID = ReadGimmick_("o_com_18");
	g_DiscDevice = ArrangePointGimmick_("o_com_18", DiscDeviceID, "g_disc_device");
	// ディスク装置のアニメを設定
	SetMotion_(g_DiscDevice, MOT_GIMMICK_2, BLEND_M);
	// 草原パネル
	local gr_panel_id = ReadGimmick_("o_A01_05");
	local g_gr_panel = ArrangePointGimmick_("o_A01_05", gr_panel_id, "g_panel");
	if(GetEventFlg_("BFG_SCENARIO_CLEAR_GRASS") == false){
		SetMotion_(g_gr_panel, MOT_GIMMICK_0, BLEND_M);
	}
	else{
		SetMotion_(g_gr_panel, MOT_GIMMICK_1, BLEND_M);
	}
	// 崩落パネル
	local ci_panel_id = ReadGimmick_("o_A01_06");
	local g_ci_panel = ArrangePointGimmick_("o_A01_06", ci_panel_id, "g_panel");
	if(GetEventFlg_("BFG_SCENARIO_CLEAR_CITY") == false){
		SetMotion_(g_ci_panel, MOT_GIMMICK_0, BLEND_M);
	}
	else{
		SetMotion_(g_ci_panel, MOT_GIMMICK_1, BLEND_M);
	}
	// 霊道パネル
	local ce_panel_id = ReadGimmick_("o_A01_07");
	local g_ce_panel = ArrangePointGimmick_("o_A01_07", ce_panel_id, "g_panel");
	if(GetEventFlg_("BFG_SCENARIO_CLEAR_GRAVE") == false){
		SetMotion_(g_ce_panel, MOT_GIMMICK_0, BLEND_M);
	}
	else{
		SetMotion_(g_ce_panel, MOT_GIMMICK_1, BLEND_M);
	}
	// 氷原パネル
	local ic_panel_id = ReadGimmick_("o_A01_08");
	local g_ic_panel = ArrangePointGimmick_("o_A01_08", ic_panel_id, "g_panel");
	if(GetEventFlg_("BFG_SCENARIO_CLEAR_ICE") == false){
		SetMotion_(g_ic_panel, MOT_GIMMICK_0, BLEND_M);
	}
	else{
		SetMotion_(g_ic_panel, MOT_GIMMICK_1, BLEND_M);
	}
	// 監獄パネル
	local pr_panel_id = ReadGimmick_("o_A01_09");
	local g_pr_panel = ArrangePointGimmick_("o_A01_09", pr_panel_id, "g_panel");
	if(GetEventFlg_("BFG_SCENARIO_CLEAR_SAND") == false){
		SetMotion_(g_pr_panel, MOT_GIMMICK_0, BLEND_M);
	}
	else{
		SetMotion_(g_pr_panel, MOT_GIMMICK_1, BLEND_M);
	}
	// 火山パネル
	local vo_panel_id = ReadGimmick_("o_A01_10");
	local g_vo_panel = ArrangePointGimmick_("o_A01_10", vo_panel_id, "g_panel");
	if(GetEventFlg_("BFG_SCENARIO_CLEAR_VOLCANO") == false){
		SetMotion_(g_vo_panel, MOT_GIMMICK_0, BLEND_M);
	}
	else{
		SetMotion_(g_vo_panel, MOT_GIMMICK_1, BLEND_M);
	}

//----------------------------------------------------------------
// NPC関連を読込み
	npc_Aroma <- C_NONE_ID;
	npc_Renate <- C_NONE_ID;
	npc_RecShop <- C_NONE_ID;
	npc_Nocho_B <- C_NONE_ID;
	npc_Citizen_Wom_A <- C_NONE_ID;
	npc_Resistance_Man <- C_NONE_ID;
	npc_Resistance_Wom <- C_NONE_ID;

	// 表シナリオクリア後
	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){
		if(outside_num == GetFlagID_("CONST_SS_OS_MAKE_DISC_TALK_AROMA")){
			// アロマ(NUM000 == 9 かつ NUM010 == 6 の時)
			npc_Aroma = ReadAndArrangePointNpc("n018", "npc_aroma_01");
			SetTalkCameraType_(npc_Aroma, TALK_CAMERA_UP);
			SetReactorMsg_(npc_Aroma, "NPC_AROMA_REC");
			// 会話カメラ時に透過されるのでアルファ値を設定する
			SetManualCalcAlpha_(npc_Aroma, true);
			SetAlpha_(npc_Aroma, 1.0);
		}
		else if(outside_num == GetFlagID_("CONST_SS_OS_GET_DISC_ACCESSORY")){
			// アロマ(NUM000 == 9 かつ NUM010 == 8 の時)
			npc_Aroma = ReadAndArrangePointNpc("n018", "npc_aroma_02");
			SetTalkCameraType_(npc_Aroma, TALK_CAMERA_UP);
			SetReactorMsg_(npc_Aroma, "NPC_AROMA_REC");
			// 会話カメラ時に透過されるのでアルファ値を設定する
			SetManualCalcAlpha_(npc_Aroma, true);
			SetAlpha_(npc_Aroma, 1.0);
		}
		else if(outside_num == GetFlagID_("CONST_SS_OS_GO_POINT_ZERO_LAB_2")){
			// アロマ(NUM000 == 9 かつ NUM010 == 9 の時)
			npc_Aroma = ReadAndArrangePointNpc("n018", "npc_aroma_02");
			SetTalkCameraType_(npc_Aroma, TALK_CAMERA_UP);
			SetReactorMsg_(npc_Aroma, "NPC_AROMA_REC");
			// 会話カメラ時に透過されるのでアルファ値を設定する
			SetManualCalcAlpha_(npc_Aroma, true);
			SetAlpha_(npc_Aroma, 1.0);
		}
		else if(outside_num >= GetFlagID_("CONST_SS_OS_COLLECT_STAR_PIECE")
		&& outside_num <= GetFlagID_("CONST_SS_OS_EXAMINE_STAR_SEED_2")){
			// リアクター屋(NUM000 == 9 かつ NUM010 が 10～35 の時)
			npc_RecShop = ReadAndArrangePointNpc("n000", "npc_Def_reactor");
			SetReactorMsg_(npc_RecShop, "NPC_NOCHO_MEN_REC");
		}
		else if(outside_num == GetFlagID_("CONST_SS_OS_TALKED_AROMA")){
			// アロマ(NUM000 == 9 かつ NUM010 == 36 の時)
			npc_Aroma = ReadAndArrangePointNpc("n018", "npc_aroma_03");
			SetTalkCameraType_(npc_Aroma, TALK_CAMERA_UP);
			SetReactorMsg_(npc_Aroma, "NPC_AROMA_REC");
			// 会話カメラ時に透過されるのでアルファ値を設定する
			SetManualCalcAlpha_(npc_Aroma, true);
			SetAlpha_(npc_Aroma, 1.0);
			// 市民女Ａ
			npc_Citizen_Wom_A = ReadAndArrangePointNpc("n016", "npc_Def_citizen_woman");
			SetReactorMsg_(npc_Citizen_Wom_A, "CITIZEN_WOMAN_REC");
			// ノチョＢ
			npc_Nocho_B = ReadAndArrangePointNpc("n000", "npc_Def_nocho_b");
			SetReactorMsg_(npc_Nocho_B, "NPC_NOCHO_MEN_REC");
			SetComMode_(npc_Nocho_B, 1);
			SetWalkRadius_(npc_Nocho_B, 10);
			// リアクター屋
			npc_RecShop = ReadAndArrangePointNpc("n000", "npc_Def_reactor");
			SetReactorMsg_(npc_RecShop, "NPC_NOCHO_MEN_REC");
			SetComMode_(npc_RecShop, 1);
			SetWalkRadius_(npc_RecShop, 15);
			// レジスタンス男Ａ
			npc_Resistance_Man = ReadAndArrangePointNpc("n012", "npc_Def_resist_man");
			SetReactorMsg_(npc_Resistance_Man, "RESISTANCE_MAN_A_REC");
			// レジスタンス女Ａ
			npc_Resistance_Wom = ReadAndArrangePointNpc("n013", "npc_Def_resist_woman");
			SetReactorMsg_(npc_Resistance_Wom, "RESISTANCE_WOMAN_A_REC");
		}
	}

	// 完全クリア後
	else if(main_num == GetFlagID_("CONST_SM_ALL_CLEAR")){
		// レナーテ
		if(allclear_num == GetFlagID_("CONST_SS_ALL_GO_TO_CENTER_BILL_B2F")){
			npc_Renate = ReadAndArrangePointNpc("n007", "npc_Def_renate");
			SetTalkCameraType_(npc_Renate, TALK_CAMERA_UP);
			SetReactorMsg_(npc_Renate, "NPC_RENATE_REC");
			// 会話カメラ時に透過されるのでアルファ値を設定する
			SetManualCalcAlpha_(npc_Renate, true);
			SetAlpha_(npc_Renate, 1.0);
		}
		// 市民女Ａ(常駐)
		npc_Citizen_Wom_A = ReadAndArrangePointNpc("n016", "npc_Def_citizen_woman");
		SetReactorMsg_(npc_Citizen_Wom_A, "CITIZEN_WOMAN_REC");
		SetComMode_(npc_Citizen_Wom_A, 1);
		SetWalkRadius_(npc_Citizen_Wom_A, 15);
		// ノチョＢ(常駐)
		npc_Nocho_B = ReadAndArrangePointNpc("n000", "npc_Def_nocho_b");
		SetReactorMsg_(npc_Nocho_B, "NPC_NOCHO_MEN_REC");
		SetComMode_(npc_Nocho_B, 1);
		SetWalkRadius_(npc_Nocho_B, 10);
		SetComMode_(npc_Nocho_B, 1);
		SetWalkRadius_(npc_Nocho_B, 15);
		// リアクター屋(常駐)
		npc_RecShop = ReadAndArrangePointNpc("n000", "npc_Def_reactor");
		SetReactorMsg_(npc_RecShop, "NPC_NOCHO_MEN_REC");
		SetComMode_(npc_RecShop, 1);
		SetWalkRadius_(npc_RecShop, 15);
		// レジスタンス男Ａ(常駐)
		npc_Resistance_Man = ReadAndArrangePointNpc("n012", "npc_Def_resist_man");
		SetReactorMsg_(npc_Resistance_Man, "RESISTANCE_MAN_A_REC");
		// レジスタンス女Ａ(常駐)
		npc_Resistance_Wom = ReadAndArrangePointNpc("n013", "npc_Def_resist_woman");
		SetReactorMsg_(npc_Resistance_Wom, "RESISTANCE_WOMAN_A_REC");
	}


//-----------------------------
// リアクターポイント
	local reactorPoint01 = ArrangeMsgReactorPoint("reactor_point_01", GetFlagID_("BFG_REACTER_POINT_040")
		, LONG_DIST, "REC_POINT_01_01", "REC_POINT_01_02");
	local reactorPoint02 = ArrangeMsgReactorPoint("reactor_point_02", GetFlagID_("BFG_REACTER_POINT_041")
		, SHORT_DIST, "REC_POINT_02_01", "REC_POINT_02_02");
	local reactorPoint03 = ArrangeMsgReactorPoint("reactor_point_03", GetFlagID_("BFG_REACTER_POINT_042")
		, SHORT_DIST, "REC_POINT_03_01", "REC_POINT_03_02");
	local reactorPoint05 = ArrangeMsgReactorPoint("reactor_point_05", GetFlagID_("BFG_REACTER_POINT_043")
		, LONG_DIST, "REC_POINT_04_01", "REC_POINT_04_02");

//----------------------------------------------------------------
// イベント地雷を読込み
	// ディスク装置
	mine_DiscDevice <- C_NONE_ID;
	mine_DiscDevice = SetPointCircleEventMine_("mine_disc_device", true);
	// 東エレベータ
	mine_EastEleveter <- C_NONE_ID;
	mine_EastEleveter = SetPointBoxEventMine_("mine_east_eleveter", true);
	// 北エレベータ
	mine_NorthEleveter <- C_NONE_ID;
	mine_NorthEleveter = SetPointBoxEventMine_("mine_eleveter", true);
	//モニタのコンソール部分
	g_mine_endrole <- C_NONE_ID;
	g_mine_endrole = SetPointBoxEventMine_("mine_endrole", true);


	EventEnd_();
}

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// 起動条件：フィールド操作開始時
//------------------------------------------------------------------------------
// 主な用途：マップ切り替え直後のデモ再生・バトル開始命令
//           ・戦闘終了時のメッセージの表示・Waitを挟みながら操作するなどを行う
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function EventStartOperate()
{
	// 進行フラグの状態を取得
	local main_num  = GetNumFlg_("NUM_SCENARIO_MAIN");
	local outside_num = GetNumFlg_("NUM_SCENARIO_SUB_INSIDE_CLEAR"); // 表シナリオクリア後
	DebugPrint(" ");

//---------------------------------------------------------------------------------------
// デモの再生
	// 歓楽の霊道クリア後
	if(main_num >= GetFlagID_("CONST_SM_ICE_FIELD")){
		if(main_num <= GetFlagID_("CONST_SM_SKY")){
			if(GetEventFlg_("BFG_PLAYED_BASEMENT_DEMO") == false){
				// デモ再生前にフィールドが映らないための対応
				CommChangeMomentFadeOut(FADE_COLOR_BLACK);
				// ２回再生されないようにする
				SetEventFlg_("BFG_PLAYED_BASEMENT_DEMO", true);
				// ディスク装置から帰ってきたときのメッセージと被らないようにする
				SetEventFlg_("BFG_CHECK_DISC_MACHINE_RTNMSG", true);
				// デモ後の主人公の位置を修正
				SetReturnDemoPosDir_(Vec3(123.0, 0.0, 0.0), -90);
				// Demo133[地下室にて]
				ChangeDemo_(133);
			}
		}
		else{
			// 表シナリオクリア以降
			// 表シナリオクリア後にDemo133[地下室にて]とDemo805[ディスクシステムの秘密]が同時に再生されないようにする
			if(outside_num <= GetFlagID_("CONST_SS_OS_GO_POINT_ZERO_LAB_1")){
				if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){
					if(GetEventFlg_("BFG_PLAYED_BASEMENT_DEMO") == false){
						// デモ再生前にフィールドが映らないための対応
						CommChangeMomentFadeOut(FADE_COLOR_BLACK);
						// ２回再生されないようにする
						SetEventFlg_("BFG_PLAYED_BASEMENT_DEMO", true);
						// ディスク装置から帰ってきたときのメッセージと被らないようにする
						SetEventFlg_("BFG_CHECK_DISC_MACHINE_RTNMSG", true);
						// デモ後の主人公の位置を修正
						SetReturnDemoPosDir_(Vec3(123.0, 0.0, 0.0), -90);
						// Demo133[地下室にて]
						ChangeDemo_(133);
					}
				}
			}
			else if(outside_num == GetFlagID_("CONST_SS_OS_GO_CENTER_BILL_B1F")){
				// デモ再生前にフィールドが映らないための対応
				CommChangeMomentFadeOut(FADE_COLOR_BLACK);
				// Demo133[地下室にて]が再生されないようにする
				SetEventFlg_("BFG_PLAYED_BASEMENT_DEMO", true);
				// ディスク作成機能追加
				SetEventFlg_("BFG_UNLOCK_DISC_CREATE_MENU", true);
				SetEventFlg_("BFG_TRAVEL_INFO_SHOW_045", true); // 旅の心得の項目解放フラグ	【ディスク】ディスクの作成
				// ヤチホコ用のキーワード追加
				SetEventFlg_("BFG_TROPHY_GET_GOD_OF_THE_LAND", true);
				// ディスク装置から帰ってきたときのメッセージと被らないようにする
				SetEventFlg_("BFG_CHECK_DISC_MACHINE_RTNMSG", true);
				// サブフラグを進める
				SetNumFlg_("NUM_SCENARIO_SUB_INSIDE_CLEAR", GetFlagID_("CONST_SS_OS_MAKE_DISC_TALK_AROMA"));
				// デモ後の主人公の位置を修正
				SetReturnDemoPosDir_(Vec3(60.0, 0.0, 0.0), -90);
				// Demo805[ディスクシステムの秘密]
				ChangeDemo_(805);
			}
			// NUM000 == 9 かつ NUM010 == 6 の時
			else if(outside_num == GetFlagID_("CONST_SS_OS_MAKE_DISC_TALK_AROMA")){
				// ディスク作成のチュートリアル用フラグ
				SetEventFlg_("BFG_TUTORIAL_DISC_CREATE", true);
				// 所持金を32000G追加
				AddGold_(32000);
				// FadeInでの配置を反映するため1F待つ( 2次DB #6284 )
				Wait_(1);
				// ディスク施設呼び出し
				GotoMenuFadeOpen(MENU_OPEN.DISC_FACILITY);
				// ディスク作成のチュートリアル用フラグ
				SetEventFlg_("BFG_TUTORIAL_DISC_CREATE", false);
				// サブフラグを進める
				SetNumFlg_("NUM_SCENARIO_SUB_INSIDE_CLEAR", GetFlagID_("CONST_SS_OS_GET_DISC_ACCESSORY"));
				// ディスクシステムの初回メッセージを表示したか？
				SetEventFlg_("BFG_DISPLAYED_DISC_SYSTEM_MSG", true);
				// ワダツミ用のキーワード追加
				SetEventFlg_("BFG_TROPHY_GET_GOD_OF_THE_SEA", true);
				// ホアカリ用のキーワード追加
				SetEventFlg_("BFG_TROPHY_GET_GOD_OF_THE_SKY", true);
				// Demo807[３つの言葉と３枚のディスク]再生フラグを立てる
				SetEventFlg_("BFG_PLAY_PSEUDO_DEMO_A01_01", true);
				// ディスク装置から帰ってきたときのメッセージと被らないようにする
				SetEventFlg_("BFG_CHECK_DISC_MACHINE_RTNMSG", true);
				// デモ後の主人公の位置を修正
				SetReturnDemoPosDir_(Vec3(72.00, 0.00, 11.625), 180);
				// Demo807[３つの言葉と３枚のディスク]
				ChangeDemo_(807);
			}
			else if(outside_num == GetFlagID_("CONST_SS_OS_GET_DISC_ACCESSORY")){
				if(GetEventFlg_("BFG_PLAY_PSEUDO_DEMO_A01_01") == true){
					// Demo807[３つの言葉と３枚のディスク]再生フラグを降ろす
					SetEventFlg_("BFG_PLAY_PSEUDO_DEMO_A01_01", false);
					// カメラを再設定
					SetCameraDir_(-90);
				}
			}
			else if(outside_num == GetFlagID_("CONST_SS_OS_GO_POINT_ZERO_LAB_2")){
				if(GetEventFlg_("BFG_PLAY_PSEUDO_DEMO_A01_01") == true){
					// 擬似デモ[封印解除への案内]再生フラグを降ろす
					SetEventFlg_("BFG_PLAY_PSEUDO_DEMO_A01_01", false);
					// ディスク装置から帰ってきたときのメッセージと被らないようにする
					SetEventFlg_("BFG_CHECK_DISC_MACHINE_RTNMSG", true);
					// 擬似デモ[封印解除への案内]
					uPlayableDemo();
				}
			}
			else if(outside_num == GetFlagID_("CONST_SS_OS_TALKED_AROMA_2")){
				// デモ再生前にフィールドが映らないための対応
				CommChangeMomentFadeOut(FADE_COLOR_BLACK);
				// サブフラグを進める
				SetNumFlg_("NUM_SCENARIO_SUB_INSIDE_CLEAR", GetFlagID_("CONST_SS_OS_DATA_SAVED"));
				// セーブポイントを挟むためのフラグ
				SetEventFlg_("BFG_SAVE_POINT_FLAG", true);
				// ディスク装置から帰ってきたときのメッセージと被らないようにする
				SetEventFlg_("BFG_CHECK_DISC_MACHINE_RTNMSG", true);
				// デモ後の主人公の位置を修正
				SetReturnDemoMap_("A01_00");
				SetReturnDemoPosDir_(Vec3(0.00, 2.50, 235.50), 180);
				// Demo832[アロマとの別れ]
				ChangeDemo_(832);
			}
		}
	}

//-------------------------------------------------------
// ディスク装置から帰ってきたときのメッセージを表示
	if(GetEventFlg_("BFG_CHECK_DISC_MACHINE_RTNMSG") == false){ // ディスク装置から帰ってきたときのメッセージがデモと被らないかチェック
		if(GetEventFlg_("BFG_DISC_MACHINE_RETURN_MESSAGE") == true){ // ディスク装置の戻りメッセージを表示するためのフラグ
			// フラグを戻しておく
			SetEventFlg_("BFG_DISC_MACHINE_RETURN_MESSAGE", false);
			if(GetEventFlg_("BFG_DISPLAYED_DISC_MACHINE_RTNMSG") == false){ // ディスク装置から初めて帰ってきたときのメッセージを表示したかどうか？
				// フラグ
				SetEventFlg_("BFG_DISPLAYED_DISC_MACHINE_RTNMSG", true);
				// 間を持たせる
				Wait_(20);
				// メッセージ表示
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_DISC_SYSTEM");
				ShowMsg_("DISC_SYSTEM_END_MSG");
				KeyInputWait_();
				CloseMsgWnd_();
			}
			else{
				// 間を持たせる
				Wait_(20);
				// メッセージ表示
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_DISC_SYSTEM");
				ShowMsg_("DISC_SYSTEM_MSG_002_NO");
				KeyInputWait_();
				CloseMsgWnd_();
			}
		}
	}

//-------------------------------
// アクセサリ入手メッセージの表示
	// ヤチホコのゆびわ
	if(GetEventFlg_("BFG_GET_ACCESSORY_YATIHOKO") == false){
		// 個数チェック
		local get_num_y = GetAccessoryNum_(YATIHOKO_ACCE_ID);
		if(get_num_y >= 1){
			// Demo809[封印の解放]の再生前(NUM9 が 8 ～ 9 )
			if(outside_num == GetFlagID_("CONST_SS_OS_GO_POINT_ZERO_LAB_2")
			|| outside_num == GetFlagID_("CONST_SS_OS_GET_DISC_ACCESSORY")){
				Wait_(FADE_DEF);
				local msg = "SYSTEM_MSG_001_01"; // アロマは地下室
				OpenMsgWnd_();
				ShowMsg_(msg);
				KeyInputWait_();
				CloseMsgWnd_();
				// 2度表示しないようにする
				SetEventFlg_("BFG_GET_ACCESSORY_YATIHOKO", true);
			}
			// Demo809[封印の解放]の再生後(NUM9 が 10 ～ 11 )
			if(outside_num == GetFlagID_("CONST_SS_OS_COLLECT_STAR_PIECE")
			|| outside_num == GetFlagID_("CONST_SS_OS_COLLECT_STAR_PIECE_2")){
				Wait_(FADE_DEF);
				local msg = "SYSTEM_MSG_001_04"; // アロマはポイントゼロ
				OpenMsgWnd_();
				ShowMsg_(msg);
				KeyInputWait_();
				CloseMsgWnd_();
				// 2度表示しないようにする
				SetEventFlg_("BFG_GET_ACCESSORY_YATIHOKO", true);
			}
		}
	}
	// ワダツミのゆびわ
	if(GetEventFlg_("BFG_GET_ACCESSORY_WADATUMI") == false){
		// 個数チェック
		local get_num_w = GetAccessoryNum_(WADATUMI_ACCE_ID);
		if(get_num_w >= 1){
			// Demo809[封印の解放]の再生前(NUM9 が 8 ～ 9 )
			if(outside_num == GetFlagID_("CONST_SS_OS_GO_POINT_ZERO_LAB_2")
			|| outside_num == GetFlagID_("CONST_SS_OS_GET_DISC_ACCESSORY")){
				Wait_(FADE_DEF);
				local msg = "SYSTEM_MSG_001_02"; // アロマは地下室
				OpenMsgWnd_();
				ShowMsg_(msg);
				KeyInputWait_();
				CloseMsgWnd_();
				// 2度表示しないようにする
				SetEventFlg_("BFG_GET_ACCESSORY_WADATUMI", true);
			}
			// Demo809[封印の解放]の再生後(NUM9 が 10 ～ 11 )
			if(outside_num == GetFlagID_("CONST_SS_OS_COLLECT_STAR_PIECE")
			|| outside_num == GetFlagID_("CONST_SS_OS_COLLECT_STAR_PIECE_2")){
				Wait_(FADE_DEF);
				local msg = "SYSTEM_MSG_001_05"; // アロマはポイントゼロ
				OpenMsgWnd_();
				ShowMsg_(msg);
				KeyInputWait_();
				CloseMsgWnd_();
				// 2度表示しないようにする
				SetEventFlg_("BFG_GET_ACCESSORY_WADATUMI", true);
			}
		}
	}
	// ホアカリのゆびわ
	if(GetEventFlg_("BFG_GET_ACCESSORY_HOAKARI") == false){
		// 個数チェック
		local get_num_h = GetAccessoryNum_(HOAKARI_ACCE_ID);
		if(get_num_h >= 1){
			// Demo809[封印の解放]の再生前(NUM9 が 8 ～ 9 )
			if(outside_num == GetFlagID_("CONST_SS_OS_GO_POINT_ZERO_LAB_2")
			|| outside_num == GetFlagID_("CONST_SS_OS_GET_DISC_ACCESSORY")){
				Wait_(FADE_DEF);
				local msg = "SYSTEM_MSG_001_03"; // アロマは地下室
				OpenMsgWnd_();
				ShowMsg_(msg);
				KeyInputWait_();
				CloseMsgWnd_();
				// 2度表示しないようにする
				SetEventFlg_("BFG_GET_ACCESSORY_HOAKARI", true);
			}
			// Demo809[封印の解放]の再生後(NUM9 が 10 ～ 11 )
			if(outside_num == GetFlagID_("CONST_SS_OS_COLLECT_STAR_PIECE")
			|| outside_num == GetFlagID_("CONST_SS_OS_COLLECT_STAR_PIECE_2")){
				Wait_(FADE_DEF);
				local msg = "SYSTEM_MSG_001_06"; // アロマはポイントゼロ
				OpenMsgWnd_();
				ShowMsg_(msg);
				KeyInputWait_();
				CloseMsgWnd_();
				// 2度表示しないようにする
				SetEventFlg_("BFG_GET_ACCESSORY_HOAKARI", true);
			}
		}
	}

//----------------------------------------------
// エンドロール再生後のフェード処理(2次DB #4739)
	if(GetEventFlg_("BFG_RETURN_ENDROLL_FADE") == true){
		SetEventFlg_("BFG_RETURN_ENDROLL_FADE", false);
		CommChangeMomentFadeOut(FADE_COLOR_BLACK);
		SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
		SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
		WaitFade_();
	}

	// ひと通りの処理が終わったら、エレベータ使用時に立てていたフラグを降ろす
	if(GetEventFlg_("BFG_CHECK_USED_ELEVATER_FADE_OFF") == true){
		// エレベータを使用したタイミングでデモを流すタイミングと被った場合フェードの種類を切り替える為のフラグ元に戻す
		SetEventFlg_("BFG_CHECK_USED_ELEVATER_FADE_OFF", false);
	}

	// ディスク装置から初めて帰ってきたときのメッセージがデモと被らないかチェックするフラグを元に戻す
	if(GetEventFlg_("BFG_CHECK_DISC_MACHINE_RTNMSG") == true){
		SetEventFlg_("BFG_CHECK_DISC_MACHINE_RTNMSG", false);
	}

	EventEnd_();
}

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// 起動条件：FadeIn()などのイベントブロックでArrangePointNpc_()を行ったとき
//------------------------------------------------------------------------------
// 主な用途：FaadIn()のイベントブロックで設定できないことをTouchNpc()の直前で行うイベントブロック
// 注意点  ：必ず「target」を条件に設定すること
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function BeforeTalkNpc()
{
	local target = GetTargetId_();
	
	// ライド中にレナーテに話しかけた時は視点のオフセット値のY軸のみを変更する
	// 【備忘録】「npc_info.nut」で視点と注視点のオフセット値を原点の調整しています。
	//            なので、ココで行う視点のオフセット値変更は「npc_info.nut」で原点調整した値から
	//            さらに調整することになるので変更する時は要注意。
	if(target == npc_Renate){
		SetRideTalkCamOffset(OFFSET_RENATE);
	}

	EventEnd_();
}

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// 起動条件：FadeIn()などのイベントブロックでArrangePointNpc_()を行ったとき
//------------------------------------------------------------------------------
// 主な用途：NPCに話しかけ行動をした時
// 注意点  ：必ず「target」を条件に設定すること
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function TouchNpc()
{
	// 進行フラグの状態を取得
	local main_num  = GetNumFlg_("NUM_SCENARIO_MAIN");

	// 話しかける対象のNPCを条件に
	local target    = GetTargetId_();
	switch(target)
	{
	case npc_Aroma:
		uAromaMsg();
		break;
	case npc_Renate:
		uRenateMsg();
		break;
	case npc_RecShop:
		uRecShopMsg();
		break;
	case npc_Nocho_B:
		uNochoBMsg();
		break;
	case npc_Citizen_Wom_A:
		uCitizenWomMsg();
		break;
	case npc_Resistance_Man:
		uResistManMsg();
		break;
	case npc_Resistance_Wom:
		uResistWomMsg();
		break;
	default:
		DebugPrint("設置していないNPCに話しかけています。");
		break;
	}

	EventEnd_();
}

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// 起動条件：マップに配置したメッシュに触れた時
//------------------------------------------------------------------------------
// 主な用途：マップに配置したメッシュに触れたときなど
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function TouchEventMine()
{
	local player    = GetPlayerId_();
	local main_num  = GetNumFlg_("NUM_SCENARIO_MAIN");

	// 調べたり触ったりしたイベント地雷を条件に
	local target    = GetTouchEventMineId_();
	switch(target)
	{
	// ディスク
	case mine_DiscDevice:
		uDiscDeviceMine();
		break;
	// 東エレベータ
	case mine_EastEleveter:
		// エレベータの方向に向く
		CommPlayerTurnAroundObj(g_lift_e);
		// 地雷削除
		DeleteEventMine_(mine_EastEleveter);
		uChoiceMoveEastEleveter();
		break;
	// 北エレベータ
	case mine_NorthEleveter:
		// エレベータの方向に向く
		CommPlayerTurnAroundObj(g_lift_n);
		// 地雷削除
		DeleteEventMine_(mine_NorthEleveter);
		uChoiceMoveNorthEleveter();
		break;
	// モニタのコンソール部分
	case g_mine_endrole:
		// モニタの方向に向く
		CommPlayerTurnAroundDir(270);
		// 地雷削除
		//表シナリオクリア後
		if (GetFlagID_("CONST_SM_INSIDE_CLEAR") <= GetNumFlg_("NUM_SCENARIO_MAIN")) {
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_REACTOR");		//「この装置には　映像データが
			ShowMsg_("ENDROLE_SELECT");
			KeyInputWait_();
			if (GetQueryResult_() == QUERY2_0) {
				ShowMsg_("ENDROLE_SELECT_HELP");	//「映像を　終了するときは
				KeyInputWait_();
				CloseMsgWnd_();
				// エンドロール再生フラグ
				SetEventFlg_("BFG_RETURN_ENDROLL_FADE", true);
				// スタッフロール（モンスターロール）再生
				ChangeEndRoll_();
			} else {
				CloseMsgWnd_();

			}

		//表クリア前
		} else {
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_REACTOR");
			ShowMsg_("ENDROLE_NOT_SELECT");
			KeyInputWait_();
			CloseMsgWnd_();
		}
		break;

	// 設置していない地雷に接触
	default:
		DebugPrint("設置していない地雷に触れています。");
		break;
	}

	EventEnd_();
}

//+++++++++++++++++++++++++++++++++++++++++++++++++
// 起動条件：リアクターを起動した時
//-------------------------------------------------
// 主な用途：リアクター起動後のフラグ設定や
//           設置物の操作などを行う
//+++++++++++++++++++++++++++++++++++++++++++++++++
function ReactorOn()
{
	EventEnd_();
}

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// 起動条件：リアクターポイントなどを調べた時
//----------------------------------------------------------
// 主な用途：スクリプト設置のリアクターポイントを調べた時
// 注意点  ：使用する際は、FadeIn()などのイベントブロックで
//           SetReactorEvent_()の命令を追加する必要がある
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function ReactorAnalyze()
{
	EventEnd_();
}

//+++++++++++++++++++++++++++++++++++++++++++++++++++
// 起動条件：リアクターを終了した時
//---------------------------------------------------
// 主な用途：リアクター機能をＯＦＦにするタイミングで
//           フラグ設定や設置物の操作などを行う
//+++++++++++++++++++++++++++++++++++++++++++++++++++
function ReactorOff()
{
	EventEnd_();
}

//===========================================================================
// ローカル関数：北エレベータの起動状態の判定
//---------------------------------------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//===========================================================================
function uChoiceMoveNorthEleveter()
{
	// 地下２階解禁フラグをチェック
	if(GetEventFlg_("BFG_RELEASE_CENTER_BILL_B2F") == true){
		uNorthEleveterDown();
	}
	else{
		// 使用不可メッセージ
		OpenMsgWnd_();
		ShowMsg_("NOT_MOVE_ELEVATOR");
		KeyInputWait_();
		CloseMsgWnd_();
		// 地雷を再設置
		SetPointBoxEventMine_("mine_eleveter", true);
	}
}

//===========================================================================
// ローカル関数：北エレベータの移動処理
//---------------------------------------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//===========================================================================
function uNorthEleveterDown()
{
	OpenMsgWnd_();
	ShowMsg_("MOVE_NORTH_ELEVATOR");
	KeyInputWait_();
	if(GetQueryResult_() == QUERY_YES){
		CloseMsgWnd_();
		// エレベータを使用したタイミングでデモを流すタイミングと被った場合フェードの種類を切り替える為のフラグ
		SetEventFlg_("BFG_CHECK_USED_ELEVATER_FADE_OFF", true);
		// エレベータで移動SE
		PlaySE_("SE_FLD_061");
		// 地下２階に移動
		ChangeMapPosDir_("A01_02", Vec3(A01_02_RTN_POS_N_X, A01_02_RTN_POS_N_Y, A01_02_RTN_POS_N_Z), RTN_DIR_N);
	}
	else{
		CloseMsgWnd_();
		// 地雷を再設置
		SetPointBoxEventMine_("mine_eleveter", true);
	}
}

//===========================================================================
// ローカル関数：東エレベータの移動処理
//---------------------------------------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//===========================================================================
function uChoiceMoveEastEleveter()
{
	// カーソルの位置を１階にする( 2次DB #6698 )
	SetQueryDefault_(QUERY_2);
	
	OpenMsgWnd_();
	ShowMsg_("CHOICE_MOVE_UP_OR_DOWN");
	KeyInputWait_();
	switch(GetQueryResult_()){
	// ３０階
	case QUERY_0:
		CloseMsgWnd_();
		// エレベータを使用したタイミングでデモを流すタイミングと被った場合フェードの種類を切り替える為のフラグ
		SetEventFlg_("BFG_CHECK_USED_ELEVATER_FADE_OFF", true);
		// エレベータで移動SE
		PlaySE_("SE_FLD_061");
		// ３０階に移動
		ChangeMapPosDir_("A03_01", Vec3(A03_01_RTN_POS_E_X, A03_01_RTN_POS_E_Y, A03_01_RTN_POS_E_Z), RTN_DIR_E);
		break;
	// ２９階
	case QUERY_1:
		CloseMsgWnd_();
		// エレベータを使用したタイミングでデモを流すタイミングと被った場合フェードの種類を切り替える為のフラグ
		SetEventFlg_("BFG_CHECK_USED_ELEVATER_FADE_OFF", true);
		// エレベータで移動SE
		PlaySE_("SE_FLD_061");
		// ２９階に移動
		ChangeMapPosDir_("A03_00", Vec3(A03_00_RTN_POS_E_X, A03_00_RTN_POS_E_Y, A03_00_RTN_POS_E_Z), RTN_DIR_E);
		break;
	// １階
	case QUERY_2:
		CloseMsgWnd_();
		// エレベータを使用したタイミングでデモを流すタイミングと被った場合フェードの種類を切り替える為のフラグ
		SetEventFlg_("BFG_CHECK_USED_ELEVATER_FADE_OFF", true);
		// エレベータで移動SE
		PlaySE_("SE_FLD_061");
		// １階に移動
		ChangeMapPosDir_("A01_00", Vec3(A01_00_RTN_POS_E_X, A01_00_RTN_POS_E_Y, A01_00_RTN_POS_E_Z), RTN_DIR_E);
		break;
	// やめる
	case QUERY_3:
		CloseMsgWnd_();
		// 地雷を再設置
		SetPointBoxEventMine_("mine_east_eleveter", true);
		break;
	}
}

//=================================================================
// ローカル関数：ディスクシステムの処理
//-----------------------------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//=================================================================
function uDiscDeviceMine()
{
	DeleteEventMine_(mine_DiscDevice);
	CommPlayerTurnAroundObj(g_DiscDevice);
	// 会話処理
	if(GetEventFlg_("BFG_DISPLAYED_DISC_SYSTEM_MSG") == false){
		SetEventFlg_("BFG_DISPLAYED_DISC_SYSTEM_MSG", true);
		// 初回メッセージ
		OpenMsgWnd_();
		ShowMsg_("DISC_SYSTEM_MSG_001");
		KeyInputWait_();
		CloseMsgWnd_();
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_DISC_SYSTEM");
		ShowMsg_("DISC_SYSTEM_MSG_002");
	}
	else{
		// 通常メッセージ
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_DISC_SYSTEM");
		ShowMsg_("DISC_SYSTEM_MSG_003");
	}
	KeyInputWait_();
	switch(GetQueryResult_()){
	// はい
	case QUERY2_0:
		CloseMsgWnd_();
		GotoMenuFadeOpen(MENU_OPEN.DISC_FACILITY);
		break;
	// いいえ
	case QUERY2_1:
		local msg;
		if(GetEventFlg_("BFG_DISPLAYED_DISC_SYSTEM_MSG") == false){
			msg = "DISC_SYSTEM_MSG_002_NO";
		}
		else{
			msg = "DISC_SYSTEM_MSG_003_NO";
		}
		ShowMsg_(msg);
		KeyInputWait_();
		CloseMsgWnd_();
		break;
	}
	Wait_(15);
	// 地雷の再配置
	SetPointCircleEventMine_("mine_disc_device", true);
}

//=================================================================
// ローカル関数：アロマの会話処理
//-----------------------------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//=================================================================
function uAromaMsg()
{
	local main_num    = GetNumFlg_("NUM_SCENARIO_MAIN");
	local outside_num = GetNumFlg_("NUM_SCENARIO_SUB_INSIDE_CLEAR"); // 表シナリオクリア後
	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){
		// NUM000 == 9 かつ NUM010 == 8 の時
		if(outside_num == GetFlagID_("CONST_SS_OS_GET_DISC_ACCESSORY")){
			// ディスク世界で1つでもキーアイテムを取得している
			if(CommAccessoryCheck() == true){
				CommLostAccessoryCheck();
				uWaitNpcFade();
				// サブフラグを進める
				SetNumFlg_("NUM_SCENARIO_SUB_INSIDE_CLEAR", GetFlagID_("CONST_SS_OS_GO_POINT_ZERO_LAB_2"));
				// 擬似デモ[封印解除への案内]再生フラグを立てる
				SetEventFlg_("BFG_PLAY_PSEUDO_DEMO_A01_01", true);
				ChangeMap_("A01_01");
			}
			// それ以外
			else{
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_AROMA");
				ShowMsg_("AROMA_MSG_002");
				KeyInputWait_();
				CloseMsgWnd_();
			}
		}
		// NUM000 == 9 かつ NUM010 == 9 の時
		else if(outside_num == GetFlagID_("CONST_SS_OS_GO_POINT_ZERO_LAB_2")){
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_AROMA");
			ShowMsg_("AROMA_MSG_004"); // ポイントゼロにある研究室に行きなさい。
			KeyInputWait_();
			switch(GetQueryResult_()){
			// はい
			case QUERY2_0:
				ShowMsg_("AROMA_MSG_004_YES");
				KeyInputWait_();
				CloseMsgWnd_();
				break;
			// いいえ
			case QUERY2_1:
				ShowMsg_("AROMA_MSG_004_NO");
				KeyInputWait_();
				CloseMsgWnd_();
				break;
			}
		}
		// NUM000 == 9 かつ NUM010 == 36 の時
		else if(outside_num == GetFlagID_("CONST_SS_OS_TALKED_AROMA")){
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_AROMA");
			ShowMsg_("AROMA_MSG_005"); // 主人公……話があるの。
			KeyInputWait_();
			switch(GetQueryResult_()){
			// はい
			case QUERY2_0:
				ShowMsg_("AROMA_MSG_005_YES");
				KeyInputWait_();
				CloseMsgWnd_();
				// サブフラグを進める
				SetNumFlg_("NUM_SCENARIO_SUB_INSIDE_CLEAR", GetFlagID_("CONST_SS_OS_TALKED_AROMA_2"));
				
				// F.Oと同時に足音を消す
				SetStepSe_(npc_Nocho_B, SILENT_STEP_SE);
				SetStepSe_(npc_RecShop, SILENT_STEP_SE);
				
				// Demo831[故郷の星]の再生
				StopBgmChangeDemo(831);
				break;
			// いいえ
			case QUERY2_1:
				ShowMsg_("AROMA_MSG_005_NO");
				KeyInputWait_();
				CloseMsgWnd_();
				break;
			}
		}
	}
}

//=================================================================
// ローカル関数：レナーテの会話処理
//-----------------------------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//=================================================================
function uRenateMsg()
{
	local main_num    = GetNumFlg_("NUM_SCENARIO_MAIN");
	local outside_num = GetNumFlg_("NUM_SCENARIO_SUB_INSIDE_CLEAR"); // 表シナリオクリア後
	local allclear_num = GetNumFlg_("NUM_SCENARIO_SUB_ALL_CLEAR");   // 完全クリア後
	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){
		// NUM000 == 9 かつ NUM010 == 36 の時
		if(outside_num == GetFlagID_("CONST_SS_OS_TALKED_AROMA")){
//			OpenMsgWnd_();
//			SetTalkName_("NAME_TAG_RENERTE");
//			ShowMsg_("RENATE_MSG_001");
//			KeyInputWait_();
//			CloseMsgWnd_();
		}
	}
	else if(main_num == GetFlagID_("CONST_SM_ALL_CLEAR")){
		if(allclear_num == GetFlagID_("CONST_SS_ALL_GO_TO_CENTER_BILL_B2F")){
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_RENERTE");
			ShowMsg_("RENATE_MSG_002");
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
}

//=================================================================
// ローカル関数：ノチョＢの会話処理
//-----------------------------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//=================================================================
function uNochoBMsg()
{
	local main_num    = GetNumFlg_("NUM_SCENARIO_MAIN");
	local outside_num = GetNumFlg_("NUM_SCENARIO_SUB_INSIDE_CLEAR"); // 表シナリオクリア後
	local allclear_num = GetNumFlg_("NUM_SCENARIO_SUB_ALL_CLEAR");   // 完全クリア後
	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){
		// NUM000 == 9 かつ NUM010 == 36 の時
		if(outside_num == GetFlagID_("CONST_SS_OS_TALKED_AROMA")){
			OpenMsgWnd_();
			ShowMsg_("NOCHO_B_MSG_001");
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else if(main_num == GetFlagID_("CONST_SM_ALL_CLEAR")){
		if(allclear_num == GetFlagID_("CONST_SS_ALL_GO_TO_CENTER_BILL_B2F")){
			OpenMsgWnd_();
			ShowMsg_("NOCHO_B_MSG_002");
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if(allclear_num >= GetFlagID_("CONST_SS_ALL_UNLOCK_BATTLE_GP")){
			OpenMsgWnd_();
			ShowMsg_("NOCHO_B_MSG_003");
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
}

//=================================================================
// ローカル関数：市民女Ａの会話処理
//-----------------------------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//=================================================================
function uCitizenWomMsg()
{
	local main_num    = GetNumFlg_("NUM_SCENARIO_MAIN");
	local outside_num = GetNumFlg_("NUM_SCENARIO_SUB_INSIDE_CLEAR"); // 表シナリオクリア後
	local allclear_num = GetNumFlg_("NUM_SCENARIO_SUB_ALL_CLEAR");   // 完全クリア後
	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){
		// NUM000 == 9 かつ NUM010 == 36 の時
		if(outside_num == GetFlagID_("CONST_SS_OS_TALKED_AROMA")){
			OpenMsgWnd_();
			ShowMsg_("CITIZEN_WOMAN_MSG_001");
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else if(main_num == GetFlagID_("CONST_SM_ALL_CLEAR")){
		if(allclear_num == GetFlagID_("CONST_SS_ALL_GO_TO_CENTER_BILL_B2F")){
			OpenMsgWnd_();
			ShowMsg_("CITIZEN_WOMAN_MSG_002");
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if(allclear_num >= GetFlagID_("CONST_SS_ALL_UNLOCK_BATTLE_GP")){
			OpenMsgWnd_();
			ShowMsg_("CITIZEN_WOMAN_MSG_003");
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
}

//=================================================================
// ローカル関数：リアクター屋の会話処理
//-----------------------------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//=================================================================
function uRecShopMsg()
{
	local main_num    = GetNumFlg_("NUM_SCENARIO_MAIN");
	local outside_num = GetNumFlg_("NUM_SCENARIO_SUB_INSIDE_CLEAR"); // 表シナリオクリア後
	// 裏シナリオ中
	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){
		// NUM010 が 10～11の時
		if(outside_num >= GetFlagID_("CONST_SS_OS_COLLECT_STAR_PIECE")
		&& outside_num <= GetFlagID_("CONST_SS_OS_COLLECT_STAR_PIECE_2")){
			local msg;
			if(GetEventFlg_("BFG_TALKED_RECSHOP_A01_01") == false){
				// 初回
				msg = "REC_SHOP_MSG_001";
				SetEventFlg_("BFG_TALKED_RECSHOP_A01_01", true);
			}
			else{
				// 通常
				msg = "REC_SHOP_MSG_002";
			}
			OpenMsgWnd_();
			ShowMsg_(msg);
			KeyInputWait_();
			switch(GetQueryResult_()){
			// はい
			case QUERY2_0:
				ShowMsg_("REC_SHOP_MSG_YES");
				KeyInputWait_();
				CloseMsgWnd_();
				break;
			// いいえ
			case QUERY2_1:
				ShowMsg_("REC_SHOP_MSG_NO");
				KeyInputWait_();
				CloseMsgWnd_();
				break;
			}
		}
		// NUM010 が 12 ～ 35 の時
		else if(outside_num >= GetFlagID_("CONST_SS_OS_GO_TO_CORE")
		&& outside_num <= GetFlagID_("CONST_SS_OS_EXAMINE_STAR_SEED_2")){
			OpenMsgWnd_();
			ShowMsg_("REC_SHOP_MSG_003");
			KeyInputWait_();
			CloseMsgWnd_();
		}
		// レナーテ救出後
		else if(outside_num == GetFlagID_("CONST_SS_OS_TALKED_AROMA")){
			OpenMsgWnd_();
			ShowMsg_("REC_SHOP_MSG_004");
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	// 完全クリア後
	else if(main_num == GetFlagID_("CONST_SM_ALL_CLEAR")){
		OpenMsgWnd_();
		ShowMsg_("REC_SHOP_MSG_004");
		KeyInputWait_();
		CloseMsgWnd_();
	}
}

//=================================================================
// ローカル関数：レジスタンス男の会話処理
//-----------------------------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//=================================================================
function uResistManMsg()
{
	local main_num    = GetNumFlg_("NUM_SCENARIO_MAIN");
	local outside_num = GetNumFlg_("NUM_SCENARIO_SUB_INSIDE_CLEAR"); // 表シナリオクリア後
	local allclear_num = GetNumFlg_("NUM_SCENARIO_SUB_ALL_CLEAR");   // 完全クリア後
	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){
		// NUM000 == 9 かつ NUM010 == 36 の時
		if(outside_num == GetFlagID_("CONST_SS_OS_TALKED_AROMA")){
			OpenMsgWnd_();
			ShowMsg_("RESISTANCE_MAN_A_MSG_001");
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else if(main_num == GetFlagID_("CONST_SM_ALL_CLEAR")){
		if(allclear_num == GetFlagID_("CONST_SS_ALL_GO_TO_CENTER_BILL_B2F")){
			OpenMsgWnd_();
			ShowMsg_("RESISTANCE_MAN_A_MSG_002");
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if(allclear_num >= GetFlagID_("CONST_SS_ALL_UNLOCK_BATTLE_GP")){
			OpenMsgWnd_();
			ShowMsg_("RESISTANCE_MAN_A_MSG_003");
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
}

//=================================================================
// ローカル関数：レジスタンス女の会話処理
//-----------------------------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//=================================================================
function uResistWomMsg()
{
	local main_num    = GetNumFlg_("NUM_SCENARIO_MAIN");
	local outside_num = GetNumFlg_("NUM_SCENARIO_SUB_INSIDE_CLEAR"); // 表シナリオクリア後
	local allclear_num = GetNumFlg_("NUM_SCENARIO_SUB_ALL_CLEAR");   // 完全クリア後
	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){
		// NUM000 == 9 かつ NUM010 == 36 の時
		if(outside_num == GetFlagID_("CONST_SS_OS_TALKED_AROMA")){
			OpenMsgWnd_();
			ShowMsg_("RESISTANCE_WOMAN_A_MSG_001");
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else if(main_num == GetFlagID_("CONST_SM_ALL_CLEAR")){
		if(allclear_num == GetFlagID_("CONST_SS_ALL_GO_TO_CENTER_BILL_B2F")){
			OpenMsgWnd_();
			ShowMsg_("RESISTANCE_WOMAN_A_MSG_002");
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if(allclear_num >= GetFlagID_("CONST_SS_ALL_UNLOCK_BATTLE_GP")){
			OpenMsgWnd_();
			ShowMsg_("RESISTANCE_WOMAN_A_MSG_003");
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
}

//=================================================================
// ローカル関数：擬似デモ[封印解除への案内]
//-----------------------------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//=================================================================
function uPlayableDemo()
{
// 暗転
	uWaitNpcFade();
// 準備
	// 主人公の位置
	local player_pos = Vec3(72.00, 0.00, 11.625);
	local player_dir = 180;
	// ウェイト
	local wait_speed     = 15;
	local wait_speed_def = 30;
	// プレイヤーID
	local player = GetPlayerId_();
	// カメラの角度
	local cam_dir = 130;
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
	ShowMsg_("AROMA_MSG_003");
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
	// カメラを再設定
	SetCameraDir_(-135);
// 暗転明け
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	Wait_(FADE_DEF);
}

//============================================================================
// ローカル関数：話しかけたらすぐにフェードが始まるようにする関数
//----------------------------------------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//============================================================================
function uWaitNpcFade()
{
	// 話しかけたらすぐにフェードが始まるようにする
	local fade_spd = 15;
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, fade_spd);
	SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, fade_spd);
	WaitFade_();
}

