//===================== A03_01センタービル3F ====================

// カードキーのアイテムＩＤ
const CARDKEY_B_ID = 98; // カードキーβ

//-------------------- 初期化 --------------------
// 起動条件：バトル終了後に呼ばれます
// (バトルの勝敗判定やイベントフラグの設定はココ)
//-------------------- 初期化 --------------------
function AfterBattle()
{
//------------------------------------------------------------------
// フラグの状態を取得
	local main_num = GetNumFlg_("NUM_SCENARIO_MAIN");
	local city_num = GetNumFlg_("NUM_SCENARIO_SUB_CITY");

	// ガードマスターに負けた時にNUMフラグを変更する処理（要注意）
	// イベントブロックのEventStartOperate()では敗北を判定できないので
	// ここで敗北の判定とフラグ変更を行う。( 16 -> 15 )
	if(main_num == GetFlagID_("CONST_SM_CITY")){
		if(city_num == GetFlagID_("CONST_SS_CI_BATTLE_OF_GUARDMASTER")){
			// ガードマスターに敗北
			if(GetBattleEndType_() == END_TYPE_LOSE){
				SetNumFlg_("NUM_SCENARIO_SUB_CITY", GetFlagID_("CONST_SS_CI_REMATCH_GUARDMASTER"));
			}
		}
	}

	EventEnd_();
}
//-------------------- 初期化 --------------------
// 起動条件：画面切り替えのフェードイン中
// (NPCと地雷の設置/マップ到達フラグはココ)
//-------------------- 初期化 --------------------
function FadeIn()
{
	// マップ到達フラグ
	SetEventFlg_("BFG_ARRIVE_AT_A03", true);

	// フラグの状態を取得
	local main_num = GetNumFlg_("NUM_SCENARIO_MAIN");
	local city_num = GetNumFlg_("NUM_SCENARIO_SUB_CITY");

	local check_dead = GetEventFlg_("BFG_DEAD_RETURN");

	local bit_phantom_wall = GetEventFlg_("BFG_OPEN_SECRET_AREA_A03_01");

	// 復帰位置のチェック
	if(check_dead == true){
		if(main_num == GetFlagID_("CONST_SM_CITY")){
			if(city_num >= GetFlagID_("CONST_SS_CI_ESTABLISH_KINGDOM")){
				ChangeMap_("A01_00");
			}
		}
	}

	DebugPrint(" ");
	DebugPrint("NUM_SCENARIO_MAIN の値は " + main_num + " になりました。");
	DebugPrint("NUM_SCENARIO_SUB_CITY の値は " + city_num + " になりました。");

	local door_key_02 = GetEventFlg_("BFG_ELECTRONIC_DOOR_SECOND_GETKEY");
	local door_open_02 = GetEventFlg_("BFG_ELECTRONIC_DOOR_SECOND_OPEN");
	DebugPrint("door_key_02 の値は " + door_key_02 + " になりました。");

	// 屋上のマップチェンジNULLを設定
	if(main_num == GetFlagID_("CONST_SM_CITY")){
		if(city_num == GetFlagID_("CONST_SS_CI_REPORT_TO_KING")
		|| city_num == GetFlagID_("CONST_SS_CI_TEST_RUN_HAIGOU")){
			SetHitEnableMapChangeNull_("w_A00_00ALdr_001", false);
		}
		else{
			SetHitEnableMapChangeNull_("w_A00_00ALdr_001", true);
		}
	}
	else{
		SetHitEnableMapChangeNull_("w_A00_00ALdr_001", true);
	}

//-----------------------------------------------------------------
// NPC
	//初期化
	guard_master <- C_NONE_ID;
	g_ace        <- C_NONE_ID;

	// ガードマスターがいないのでキラーマシン２で仮対応
	if(main_num == GetFlagID_("CONST_SM_CITY")){
		if(city_num == GetFlagID_("CONST_SS_CI_UNLOCK_THE_DOOR_2")
		|| city_num == GetFlagID_("CONST_SS_CI_REMATCH_GUARDMASTER")){
			local boss = ReadNpc_("m121_00");
			guard_master = ArrangePointNpc_(boss, "Boss");
			// 非常駐モーション
			if(city_num == GetFlagID_("CONST_SS_CI_UNLOCK_THE_DOOR_2")){
				// 非常駐モーション(静止)
				local gur_stop_L = ReadMotion_(guard_master, "m121_00_stop_L");
				SetMotion_(guard_master , gur_stop_L, 0);
				// モノアイ隠し
				LoadEffect_("ef812_01_off_monoeye");
				SetSelectBoneEffect_("ef812_01_off_monoeye", guard_master, ATTACH_GLOBAL);
			}
			// 会話させない
			SetTalkEnable_(guard_master , false);
			//アナライズ
			SetReactorMsg_(guard_master, "GARD_MASTER_REC");
			//SetMotion_(boss, ReadMotion_(boss, "m121_00_stand"), 4);
		}
		// ボス戦後エースモデルを配置
		if(city_num >= GetFlagID_("CONST_SS_CI_EXPLORE_THE_ROOM")
		&& city_num <= GetFlagID_("CONST_SS_CI_REPORT_TO_KING")){
			if(city_num >= GetFlagID_("CONST_SS_CI_EXPLORE_THE_ROOM")
			&& city_num <= GetFlagID_("CONST_SS_CI_REQUEST_ACE")){
				local id_ace = ReadNpc_("n002");
				g_ace = ArrangePointNpc_(id_ace, "Ace");
			}
			else if(city_num >= GetFlagID_("CONST_SS_CI_EXAMINE_MACHINE")
			&& city_num <= GetFlagID_("CONST_SS_CI_TALK_ACE")){
				local id_ace = ReadNpc_("n002");
				g_ace = ArrangePointNpc_(id_ace, "Ace_02");
			}
			else{
				local id_ace = ReadNpc_("n002");
				g_ace = ArrangePointNpc_(id_ace, "Ace_03");
			}
			// 会話時カメラの設定
			SetTalkCameraType_(g_ace, TALK_CAMERA_UP);
			// アナライズ
			SetReactorMsg_(g_ace, "NPC_ACE_REC");
		}
	}

//-------------------------------------------------------------------------------------
// イベント地雷
	// 初期化
	east_elevator     <- C_NONE_ID;
	door_lock         <- C_NONE_ID;
	guard_master_mine <- C_NONE_ID;
	screen            <- C_NONE_ID;
	machine           <- C_NONE_ID;
	mine_escape_room  <- C_NONE_ID;
	mine_start_demo   <- C_NONE_ID;
	mineid_phantom    <- C_NONE_ID;
	mine_ruler_01     <- C_NONE_ID;

	// 東エレベーターのマップチェンジ地雷
	east_elevator = SetPointBoxEventMine_("Mine_Door_02", true);

	// ガードマスターとのバトル移行用地雷
	if(main_num == GetFlagID_("CONST_SM_CITY")){
		if(city_num == GetFlagID_("CONST_SS_CI_UNLOCK_THE_DOOR_2")
		|| city_num == GetFlagID_("CONST_SS_CI_REMATCH_GUARDMASTER")){
			guard_master_mine = SetPointBoxEventMine_("Mine_Boss", false);
		}
	}

	// ドア２の地雷
	if(main_num == GetFlagID_("CONST_SM_CITY")){
		// ボス戦後モニターのイベント地雷を配置
		if(city_num == GetFlagID_("CONST_SS_CI_EXPLORE_THE_ROOM")){
			screen = SetPointCircleEventMine_("Mine_Screen", true);
		}
		// エースの方に機械があるので地雷を設置
		if(city_num == GetFlagID_("CONST_SS_CI_EXAMINE_MACHINE")){
			machine = SetPointCircleEventMine_("Mine_Machine", true);
			mine_escape_room = SetPointBoxEventMine_("Mine_Escape_Room", false);
		}
		// ガードマスターの部屋の前を通ると発生するデモ
		if(city_num == GetFlagID_("CONST_SS_CI_UNLOCK_THE_DOOR_1")){
			mine_start_demo = SetPointBoxEventMine_("Mine_Seek_the_key_02", false);
		}
	}

	// ガードマスターの部屋のドアロックの地雷
	if(door_key_02 == false || door_open_02 == false){
		door_lock = SetPointBoxEventMine_("Mine_Door_01", true);
	}

	//幻の壁
	if(bit_phantom_wall == false){
		mineid_phantom = SetPointBoxEventMineNoFallWait_("Mine_Phantom_Wall_01");
	}

	// ルーラポイント(ボス戦前)
	mine_ruler_01 = SetPointCircleEventMine_("mine_ruler_01", true);

	DebugPrint("イベント地雷の読込");
	
//------------------------------------------------------
// ギミック
	// 電子ドア２のカギを開けるまで配置（α対応の仮処理）
	if(door_open_02 == false){
		local g_door01 = ReadGimmick_("o_A03_00");
		local door01 = ArrangePointGimmick_("o_A03_00", g_door01, "g_door_01");
	}
	else{
		//ドアが開いたら消してしまうため配置しません。
	}

	// 7/17進捗ROMでコメント化
//	//ガードマスターが守っているドア（カードキーは無く、デモ再生のみで開く）
//	if(main_num == GetFlagID_("CONST_SM_CITY")){
//		if(city_num <= GetFlagID_("CONST_SS_CI_BATTLE_OF_GUARDMASTER")){
//			local g_door02 = ReadGimmick_("o_A03_00");
//			local door02 = ArrangePointGimmick_("o_A03_00", g_door02, "g_door_02");
//		}
//	}

	// 管制室メインモニター
	local g_main_screen = ReadGimmick_("o_A03_04");
	local main_screen = ArrangePointGimmick_("o_A03_04", g_main_screen, "g_main_screen");

	// 点滅する赤モニター
	if(main_num == GetFlagID_("CONST_SM_CITY")){
		if(city_num == GetFlagID_("CONST_SS_CI_EXPLORE_THE_ROOM")){
			// 点滅する赤モニター(左)
			local g_flashing_screen_l = ReadGimmick_("o_A03_06");
			local flashing_screen_l = ArrangePointGimmick_("o_A03_06", g_flashing_screen_l, "g_flashing_screen_l");
			//「！」アイコン
			local exclamation02 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "exclamation02");
			SetNaviMapIconVisible_(exclamation02, true);
		}
		else if(city_num == GetFlagID_("CONST_SS_CI_EXAMINE_MACHINE")){
			// 点滅する赤モニター(右)
			local g_flashing_screen_r = ReadGimmick_("o_A03_05");
			local flashing_screen_r = ArrangePointGimmick_("o_A03_05", g_flashing_screen_r, "g_flashing_screen_r");
			//「！」アイコン
			local exclamation03 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "exclamation03");
			SetNaviMapIconVisible_(exclamation03, true);
		}
	}	

	// 東エレベータの扉
	local g_e_elevator = ReadGimmick_("o_A03_01");
	local e_elevator = ArrangePointGimmick_("o_A03_01", g_e_elevator, "g_elevator");

	// 東エレベータのリフト
	local g_e_lift = ReadGimmick_("o_A01_01");
	local e_lift = ArrangePointGimmick_("o_A01_01", g_e_lift, "g_elevator_lift");

	// ルーラポイント(ボス戦前)
	local g_rulerpoint = ReadGimmick_("o_com_08");
	rulerpoint01 <- ArrangePointGimmick_("o_com_08", g_rulerpoint, "g_rulerpoint");
	SetMotion_(rulerpoint01, "GIMMICK_0", 0);
	if(GetEventFlg_("BFG_RULER_ADD_006") == true){
		SetMotion_(rulerpoint01, "GIMMICK_2", 0);
		//ルーラポイントが起動後にルーラポイントアイコン表示
		icon01 <- ArrangePointNaviMapIcon_(NAVIMAP_ICON.RULER_POINT , "g_rulerpoint");
		SetNaviMapIconVisible_(icon01, true);
	}

//-------------------------------------------------------------------------------
//リアクターポイント
	// 係員専用エレベータ
	reactor_point01 <- ArrangeMsgReactorPoint("reactorPoint_01", GetFlagID_("BFG_REACTER_POINT_023")
		, SHORT_DIST, "REC_POINT_NOC_01_01", "REC_POINT_NOC_01_02");
	// 屋上扉
	local reactor_point02 = ArrangeMsgReactorPoint("reactorPoint_02", GetFlagID_("BFG_REACTER_POINT_029")
		, SHORT_DIST, "REC_POINT_NOC_02_01", "REC_POINT_NOC_02_02");
	// セキュリティロック扉
	if(door_open_02 == false){
		local reactor_point03 = ArrangeMsgReactorPoint("reactorPoint_03", GetFlagID_("BFG_REACTER_POINT_026")
			, SHORT_DIST, "REC_POINT_NOC_03_01", "REC_POINT_NOC_03_02");
	}
	// モニター制御装置
	local reactor_point04 = ArrangeMsgReactorPoint("reactorPoint_04", GetFlagID_("BFG_REACTER_POINT_028")
		, SHORT_DIST, "REC_POINT_NOC_04_01", "REC_POINT_NOC_04_02");
	// ルーラポイント
	local reactor_point05 = ArrangeMsgReactorPoint("reactorPoint_05", GetFlagID_("BFG_REACTER_POINT_010")
		, SHORT_DIST, "REC_POINT_NOC_05_01", "REC_POINT_NOC_05_02");

//----------------------------------------------------------------------
// 特技ルーラを禁止
//（Demo116[エースの頼み事]再生後～Demo123[配合装置の試運転]再生後まで禁止するがここでは禁止にするだけで禁止を解除するのはA00_00.nutで行っている）
	if(main_num == GetFlagID_("CONST_SM_CITY")){
		if(city_num == GetFlagID_("CONST_SS_CI_EXAMINE_MACHINE")){
			// ルーラを禁止するフラグを設定
			SetEventFlg_("BFG_PLAYERABILITY_RULER_PROHIBIT", true);
		}
	}

	EventEnd_();
}

//-------------------- 初期化 --------------------
// 起動条件：フィールド操作開始時
// ( マップ切り替え直後のデモ再生・バトル開始命令・戦闘終了時のメッセージの表示
// ( 設置物をWaitを挟みながら操作するのはココ
//-------------------- 初期化 --------------------
function EventStartOperate()
{
// フラグの状態を取得
	local main_num     = GetNumFlg_("NUM_SCENARIO_MAIN");
	local city_num     = GetNumFlg_("NUM_SCENARIO_SUB_CITY");
	local door_key_02  = GetEventFlg_("BFG_ELECTRONIC_DOOR_SECOND_GETKEY");
	local door_open_02 = GetEventFlg_("BFG_ELECTRONIC_DOOR_SECOND_OPEN");

//---------------------------------------------------------------------------------------
// 戦闘開始( 14 -> 16 )
	// イベント戦[ガードマスター戦]・[ガードマスター再戦]
	if(main_num == GetFlagID_("CONST_SM_CITY")){
		if(city_num == GetFlagID_("CONST_SS_CI_PROTECT_THE_ROOM")){
			// ガードマスター戦中のフラグ
			SetNumFlg_("NUM_SCENARIO_SUB_CITY", GetFlagID_("CONST_SS_CI_BATTLE_OF_GUARDMASTER"));
			// ガードマスター戦
			ChangeBattleParty_(6); // 仮処理
		}
	}

//---------------------------------------------------------------------------------------
// 戦闘結果( 16 -> 17 )
	if(main_num == GetFlagID_("CONST_SM_CITY")){
		if(city_num == GetFlagID_("CONST_SS_CI_BATTLE_OF_GUARDMASTER")){
			if (GetBattleEndType_() == BATTLE_END_TYPE_WIN){
				// デモ再生前にフィールドが映らないための対応
				SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				WaitFade_();
				// ガードマスターに勝利
				SetNumFlg_("NUM_SCENARIO_SUB_CITY", GetFlagID_("CONST_SS_CI_EXPLORE_THE_ROOM"));
				// ガードマスター撃破フラグ(扉アイコン表示フラグ)
				SetEventFlg_("BFG_MAP_ICON_020", true);
				// デモ後に設定される主人公の位置と向き
				//SetReturnDemoPosDir_(Vec3(510.0, 342.65, 973.96), -70);
				// デモ後の復帰座標と向きを指定
				SetReturnDemoPosDir_(Vec3(0.0, 0.4, 270.0), 0);
				// Demo113[ガードマスター撃破]が再生される
				ChangeDemo_(113);
			}
			else{
				// ガードマスターに敗北（備忘録）
				// ここではガードマスター戦の敗北判定ができないので
				// イベントブロックのAfterBattle()で敗北の判定とフラグ変更を行う。
			}
		}
	}

//---------------------------------------------------------------------------------------
// デモ再生
	if(main_num == GetFlagID_("CONST_SM_CITY")){
		switch(city_num){
		// Demo115[過去の録画映像]の再生処理
		case GetFlagID_("CONST_SS_CI_PAST_OF_THE_VIDEO"):
			// デモ再生前にフィールドが映らないための対応
			SetFade_(FADE_OUT, FADE_COLOR_WHITE, FADE_SHORT);
			SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
			WaitFade_();
			// サブフラグを進める
			SetNumFlg_("NUM_SCENARIO_SUB_CITY", GetFlagID_("CONST_SS_CI_REQUEST_ACE"));
			ChangeDemo_(115);
			break;
		// Demo116[エースの頼み事]の再生処理
		case GetFlagID_("CONST_SS_CI_REQUEST_ACE"):
			// デモ再生前にフィールドが映らないための対応
			SetFade_(FADE_OUT, FADE_COLOR_WHITE, FADE_SHORT);
			SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
			WaitFade_();
			// サブフラグを進める
			SetNumFlg_("NUM_SCENARIO_SUB_CITY", GetFlagID_("CONST_SS_CI_EXAMINE_MACHINE"));
			// デモ後の復帰位置と向き
			SetReturnDemoPosDir_(Vec3(-0.812, 0.400, 370.429), -64);
			ChangeDemo_(116);
			break;
		}
	}

	if(main_num == GetFlagID_("CONST_SM_CITY")){
		switch(city_num){
		// Demo118[動く大地② 崩落都市移動]再生処理
		case GetFlagID_("CONST_SS_CI_MOVE_CITY"):
			// デモ再生前にフィールドが映らないための対応
			SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
			SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
			WaitFade_();
			// サブフラグを進める
			SetNumFlg_("NUM_SCENARIO_SUB_CITY", GetFlagID_("CONST_SS_CI_MOVE_GRAVE"));
			ChangeDemo_(118);
			break;
		// Demo119[動く大地③ 歓楽の霊道移動]再生処理
		case GetFlagID_("CONST_SS_CI_MOVE_GRAVE"):
			// デモ再生前にフィールドが映らないための対応
			SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
			SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
			WaitFade_();
			// サブフラグを進める
			SetNumFlg_("NUM_SCENARIO_SUB_CITY", GetFlagID_("CONST_SS_CI_COMMENTARY_PANEL"));
			ChangeDemo_(119);
			break;
		// Demo120[動く大地④ モニタ解説]
		case GetFlagID_("CONST_SS_CI_COMMENTARY_PANEL"):
			// デモ再生前にフィールドが映らないための対応
			SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
			SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
			WaitFade_();
			// 120と121が統合されたので「"CONST_SS_CI_TALK_ACE"」→「"CONST_SS_CI_REPORT_TO_KING"」へ変更
			SetNumFlg_("NUM_SCENARIO_SUB_CITY", GetFlagID_("CONST_SS_CI_REPORT_TO_KING"));
			// デモ後の復帰位置と向き
			SetReturnDemoPosDir_(Vec3(1.194, 0.400, 374.008), 0);
			ChangeDemo_(120);
			break;
		// 120と121が統合されたのでコメント化(備忘録)
		//Demo121[動く大地⑤ エースと会話]
		//case GetFlagID_("CONST_SS_CI_TALK_ACE"):
		//	SetNumFlg_("NUM_SCENARIO_SUB_CITY", GetFlagID_("CONST_SS_CI_REPORT_TO_KING"));
		//	ChangeDemo_(121);
		//	break; 
		}
	}

	// ひと通りの処理が終わったら、エレベータ使用時に立てていたフラグを降ろす
	if(GetEventFlg_("BFG_CHECK_USED_ELEVATER_FADE_OFF") == true){
		// エレベータを使用したタイミングでデモを流すタイミングと被った場合フェードの種類を切り替える為のフラグ元に戻す
		SetEventFlg_("BFG_CHECK_USED_ELEVATER_FADE_OFF", false);
	}

	EventEnd_();
}

//-------------------- NPC --------------------
//起動条件：NPCに向かってAボタンが押された時
//OpenMsgWnd_() -> ShowMsg_() -> KeyInputWait_() の順に呼び出すこと
//-------------------- NPC --------------------
function TouchNpc()
{
// フラグの状態を取得
	local main_num = GetNumFlg_("NUM_SCENARIO_MAIN");
	local city_num = GetNumFlg_("NUM_SCENARIO_SUB_CITY");
	local target = GetTargetId_();
	local player = GetPlayerId_();

	switch(target)
	{
	case g_ace:
		if(main_num == GetFlagID_("CONST_SM_CITY")){
			switch(city_num)
			{
			case GetFlagID_("CONST_SS_CI_EXPLORE_THE_ROOM"):
				CommonMessageT("NAME_TAG_ACE","MSG_ACE_001");
				break;
			case GetFlagID_("CONST_SS_CI_EXAMINE_MACHINE"):
				CommonMessageT("NAME_TAG_ACE","MSG_ACE_002");
				break;
			case GetFlagID_("CONST_SS_CI_REPORT_TO_KING"):
				CommonMessageT("NAME_TAG_ACE","MSG_ACE_003");
				break;
			default:
				DebugPrint("対応するエースの会話がありません");
				break;
			}
		}
		break;
	default:
		DebugPrint("対応しているNPCがいません");
		break;
	}

	EventEnd_();
}
//-------------------- NPC --------------------
//起動条件：リアクターで調べられたときのアナライズ
//-------------------- NPC --------------------
function ReactorAnalyze()
{
	EventEnd_();
}

//-------------------- イベント地雷 --------------------
//起動条件：マップに配置したメッシュに触れたとき
//-------------------- イベント地雷 --------------------
function TouchEventMine()
{
	local target = GetTouchEventMineId_();
	local player = GetPlayerId_();
	local door_key_02 = GetEventFlg_("BFG_ELECTRONIC_DOOR_SECOND_GETKEY");
	local door_open_02 = GetEventFlg_("BFG_ELECTRONIC_DOOR_SECOND_OPEN");
	// 幻の壁
	local bit_phantom_wall = GetEventFlg_("BFG_OPEN_SECRET_AREA_A03_01");
	// 東エレベーター解禁フラグ
	local unlock_east_elevator = GetEventFlg_("BFG_UNLOCK_EAST_ELEVATOR");
	// フラグの状態を取得
	local main_num = GetNumFlg_("NUM_SCENARIO_MAIN");
	local city_num = GetNumFlg_("NUM_SCENARIO_SUB_CITY");

	switch(target)
	{
	// ルーラポイント(ガードマスターの部屋の前)
	case mine_ruler_01:
		CommPlayerTurnAroundObj(rulerpoint01);
		CommRulerPointEvent(rulerpoint01, "BFG_RULER_ADD_006", "g_rulerpoint");
		break;
	// 東エレベータ
	case east_elevator:
		// 主人公をリアクターポイント01に向ける
		CommPlayerTurnAroundObj(reactor_point01);
		if(unlock_east_elevator == false){
			SetEventFlg_("BFG_UNLOCK_EAST_ELEVATOR", true);
			PlaySE_("SE_FLD_062");
			Wait_(70);
			CommonMessage("UNLOCK_ELEVATOR");
		}
		uChoiceMoveEastEleveter();
		break;
	// ガードマスターの部屋の前を通ると発生するデモ
	case mine_start_demo:
		if(main_num == GetFlagID_("CONST_SM_CITY")){
			if(city_num == GetFlagID_("CONST_SS_CI_UNLOCK_THE_DOOR_1")){
				// 地雷削除
				DeleteEventMine_(mine_start_demo);
				// サブフラグを進める( 11 -> 12 )
				SetNumFlg_("NUM_SCENARIO_SUB_CITY", GetFlagID_("CONST_SS_CI_SEEK_THE_DOOR_2_KEY"));
				// デモ終了後の位置を修正(仮)
				//SetReturnDemoPosDir_(Vec3(-8.605, 0.59, 193.467), 0);
				// Demo127[カードキーＢを探せ]再生
				ChangeDemo_(127);
			}
		}
		break;
	// ガードマスターの部屋の扉
	case door_lock:
		if(main_num == GetFlagID_("CONST_SM_CITY")){
			if(city_num == GetFlagID_("CONST_SS_CI_UNLOCK_THE_DOOR_1")
			|| city_num == GetFlagID_("CONST_SS_CI_SEEK_THE_DOOR_2_KEY")){
				if(door_key_02 == true){
					// ドアロックの地雷を削除
					DeleteEventMine_(door_lock);
					// 主人公を扉の方に向ける
					CommPlayerTurnAroundDir(0);
					// ドアロック解除のSE（仮）
					//PlaySE_("SE_DEM_044");
					// ドアロック解除のメッセージを表示
					OpenMsgWnd_();
					//  メッセージの置き換え
					SetExchangeItemName_(CARDKEY_B_ID);
					ShowMsg_("UNLOCK_DOOR_MESSAGE");
					KeyInputWait_();
					CloseMsgWnd_();
					// サブフラグを進める( 11 -> 12 )
					SetNumFlg_("NUM_SCENARIO_SUB_CITY", GetFlagID_("CONST_SS_CI_UNLOCK_THE_DOOR_2"));
					SetEventFlg_("BFG_ELECTRONIC_DOOR_SECOND_OPEN", true);
					// デモ終了後の位置を修正
					SetReturnDemoPosDir_(Vec3(0.0, 0.4, 240.0), 0);
					// Demo(仮)126[電子ドアの解除２]再生
					ChangeDemo_(126);
				}else{
					if(door_open_02 == false){
						// 主人公を扉の方に向ける(アルファ仮対応:詳細はTaskNo.540)
						CommPlayerTurnAroundDir(0);
						//  メッセージの置き換え
						SetExchangeItemName_(CARDKEY_B_ID);
						// 扉にロックがかかっているメッセージ
						CommonMessage("LOCK_MESSAGE");
					}
				}
			}
		}
		break;
	// ガードマスターとのバトル移行用地雷(13 or 15)
	case guard_master_mine:
		if(main_num == GetFlagID_("CONST_SM_CITY")){
			if(city_num == GetFlagID_("CONST_SS_CI_UNLOCK_THE_DOOR_2")){
				// サブフラグを進める( 13 -> 14 )
				SetNumFlg_("NUM_SCENARIO_SUB_CITY", GetFlagID_("CONST_SS_CI_PROTECT_THE_ROOM"));
				// Demo111[部屋を守るガードマスター]再生
				ChangeDemo_(111); // イベント戦[ガードマスター戦]へ
			}else{
				if(city_num == GetFlagID_("CONST_SS_CI_REMATCH_GUARDMASTER")){
					// サブフラグを進める( 15 -> 14 )
					SetNumFlg_("NUM_SCENARIO_SUB_CITY", GetFlagID_("CONST_SS_CI_PROTECT_THE_ROOM"));
					// Demo112[ガードマスター再戦]再生
					ChangeDemo_(112); // イベント戦[ガードマスター戦]へ
				}
			}
		}
		break;
	// 管理室のモニター
	case screen:
		if(main_num == GetFlagID_("CONST_SM_CITY")){
			if(city_num == GetFlagID_("CONST_SS_CI_EXPLORE_THE_ROOM")){
				// 地雷削除
				DeleteEventMine_(screen);
				// スクリーン下の赤いランプの方向に主人公を回転させる
				CommPlayerTurnAroundDir(0);
				// サブフラグを進める( 16 -> 17 )
				SetNumFlg_("NUM_SCENARIO_SUB_CITY", GetFlagID_("CONST_SS_CI_PAST_OF_THE_VIDEO"));
				// Demo114[映像のレナーテ]再生
				ChangeDemo_(114);
			}
		}
		break;
	// 管理室の機械
	case machine:
		if(main_num == GetFlagID_("CONST_SM_CITY")){
			if(city_num == GetFlagID_("CONST_SS_CI_EXAMINE_MACHINE")){
				// 地雷削除
				DeleteEventMine_(machine);
				// サブスクリーン下の赤いランプの方向に主人公を回転させる
				CommPlayerTurnAroundDir(-90);
				// サブフラグを進める( 19 -> 20 )
				SetNumFlg_("NUM_SCENARIO_SUB_CITY", GetFlagID_("CONST_SS_CI_MOVE_CITY"));
				// Demo117[動く大地① パネル操作]再生
				ChangeDemo_(117);
			}
		}
		break;
	// 管理室から出れないようにする
	case mine_escape_room:
		if(main_num == GetFlagID_("CONST_SM_CITY")){
			if(city_num == GetFlagID_("CONST_SS_CI_EXAMINE_MACHINE")){
				// 侵入禁止のイベント地雷に触れた際の移動処理
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_ACE");
				ShowMsg_("CALL");
				KeyInputWait_();
				CloseMsgWnd_();
				CommPlayerTurnMoveDirWalk(0);
			}
		}
		break;
	// 幻の壁
	case mineid_phantom:
		if( bit_phantom_wall  == false){
			SetEventFlg_("BFG_OPEN_SECRET_AREA_A03_01", true);
			DeleteEventMine_(mineid_phantom);
		}
		break;
	default:
		DebugPrint("対応している地雷がありません");
		break;
	}

	EventEnd_();
}

//--------------------------
//  メッセージの表示関数（名前なし）
//--------------------------
function CommonMessage(message_key){
	OpenMsgWnd_();
	ShowMsg_(message_key);
	KeyInputWait_();
	CloseMsgWnd_();
}
//----------------------------------------
// メッセージ表示関数
//--------------------------------------
function CommonMessageT(name_tag, message){
	OpenMsgWnd_();
	SetTalkName_(name_tag);
	ShowMsg_(message);
	KeyInputWait_();
	CloseMsgWnd_();
}

//===========================================================================
// ローカル関数：東エレベータの移動処理
//---------------------------------------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//===========================================================================
function uChoiceMoveEastEleveter()
{
	// 地下１階解禁フラグをチェック
	if(GetEventFlg_("BFG_UNLOCKED_EAST_ELEVETER_UNDER") == false){
		uMoveUpEastEleveter();
	}
	else{
		uMoveUpDownEastEleveter();
	}
}

//===========================================================================
// ローカル関数：東エレベータの移動処理(解放前)
//---------------------------------------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//===========================================================================
function uMoveUpEastEleveter()
{
	OpenMsgWnd_();
	ShowMsg_("MOVE_EAST_ELEVATOR");
	KeyInputWait_();
	switch(GetQueryResult_()){
	// ２９階
	case QUERY3_0:
		CloseMsgWnd_();
		// 地雷削除
		DeleteEventMine_(east_elevator);
		// エレベータを使用したタイミングでデモを流すタイミングと被った場合フェードの種類を切り替える為のフラグ
		SetEventFlg_("BFG_CHECK_USED_ELEVATER_FADE_OFF", true);
		// エレベータで移動SE
		PlaySE_("SE_FLD_061");
		// ２９階に移動
		ChangeMapPosDir_("A03_00", Vec3(A03_00_RTN_POS_E_X, A03_00_RTN_POS_E_Y, A03_00_RTN_POS_E_Z), RTN_DIR_E);
		break;
	// １階(キングダム)
	case QUERY3_1:
		CloseMsgWnd_();
		// 地雷削除
		DeleteEventMine_(east_elevator);
		// エレベータを使用したタイミングでデモを流すタイミングと被った場合フェードの種類を切り替える為のフラグ
		SetEventFlg_("BFG_CHECK_USED_ELEVATER_FADE_OFF", true);
		// エレベータで移動SE
		PlaySE_("SE_FLD_061");
		// １階に移動
		ChangeMapPosDir_("A01_00", Vec3(A01_00_RTN_POS_E_X, A01_00_RTN_POS_E_Y, A01_00_RTN_POS_E_Z), RTN_DIR_E);
		break;
	// そのまま(３階)
	case QUERY3_2:
		CloseMsgWnd_();
		break;
	}
}

//===========================================================================
// ローカル関数：東エレベータの移動処理(解放後)
//---------------------------------------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//===========================================================================
function uMoveUpDownEastEleveter()
{
	OpenMsgWnd_();
	ShowMsg_("MOVE_EAST_ELEVATOR_02");
	KeyInputWait_();
	switch(GetQueryResult_()){
	// ２９階
	case QUERY_0:
		CloseMsgWnd_();
		// 地雷削除
		DeleteEventMine_(east_elevator);
		// エレベータを使用したタイミングでデモを流すタイミングと被った場合フェードの種類を切り替える為のフラグ
		SetEventFlg_("BFG_CHECK_USED_ELEVATER_FADE_OFF", true);
		// エレベータで移動SE
		PlaySE_("SE_FLD_061");
		// ２９階に移動
		ChangeMapPosDir_("A03_00", Vec3(A03_00_RTN_POS_E_X, A03_00_RTN_POS_E_Y, A03_00_RTN_POS_E_Z), RTN_DIR_E);
		break;
	// １階
	case QUERY_1:
		CloseMsgWnd_();
		// 地雷削除
		DeleteEventMine_(east_elevator);
		// エレベータを使用したタイミングでデモを流すタイミングと被った場合フェードの種類を切り替える為のフラグ
		SetEventFlg_("BFG_CHECK_USED_ELEVATER_FADE_OFF", true);
		// エレベータで移動SE
		PlaySE_("SE_FLD_061");
		// １階に移動
		ChangeMapPosDir_("A01_00", Vec3(A01_00_RTN_POS_E_X, A01_00_RTN_POS_E_Y, A01_00_RTN_POS_E_Z), RTN_DIR_E);
		break;
	// 地下１階
	case QUERY_2:
		CloseMsgWnd_();
		// 地雷削除
		DeleteEventMine_(east_elevator);
		// エレベータを使用したタイミングでデモを流すタイミングと被った場合フェードの種類を切り替える為のフラグ
		SetEventFlg_("BFG_CHECK_USED_ELEVATER_FADE_OFF", true);
		// エレベータで移動SE
		PlaySE_("SE_FLD_061");
		// 地下１階に移動
		ChangeMapPosDir_("A01_01", Vec3(A01_01_RTN_POS_E_X, A01_01_RTN_POS_E_Y, A01_01_RTN_POS_E_Z), RTN_DIR_E);
		break;
	// やめる
	case QUERY_3:
		CloseMsgWnd_();
		break;
	}
}

