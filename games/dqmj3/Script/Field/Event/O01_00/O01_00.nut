//===================== 拠点【バーチャルコロシアム(ロビー)】 ====================

// <注意1>
// ロビーは広いマップにS～Cランクの部屋が個別に用意されており
// モノリスから各ランクの部屋につながっているイメージ

// <注意2>
// 扉のイベント地雷は削除しない
// (ランク戦は一度クリアすると2度と挑戦できないのでイベント地雷には何らかのメッセージを表示)

//-------------------- 初期化 --------------------
// 起動条件：バトル終了後に呼ばれます
// (バトルの勝敗判定やイベントフラグの設定はココ)
//-------------------- 初期化 --------------------
function AfterBattle()
{
// メインシナリオ用のフラグ-----------------------------------------
	// フラグを取得する
	local main_num 			= GetNumFlg_("NUM_SCENARIO_MAIN");
	local green_event_num 	= GetNumFlg_("NUM_SCENARIO_SUB_GREEN");
	local ice_event_num 	= GetNumFlg_("NUM_SCENARIO_SUB_ICE");
	local volcano_event_num = GetNumFlg_("NUM_SCENARIO_SUB_VOLCANO");
	local sky_num 			= GetNumFlg_("NUM_SCENARIO_SUB_SKY");
	
	DebugPrint(" ");
	DebugPrint("NUM_SCENARIO_MAIN の値は " + main_num + " になりました。");
	DebugPrint("NUM_SCENARIO_SUB_GREEN の値は " + green_event_num + " になりました。");

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
	local main_num          = GetNumFlg_("NUM_SCENARIO_MAIN");
	local ice_event_num     = GetNumFlg_("NUM_SCENARIO_SUB_ICE");
	local volcano_event_num = GetNumFlg_("NUM_SCENARIO_SUB_VOLCANO");
	// Demo311[Bランクライセンス獲得]の再生後にライドの解除を行う
	if(GetEventFlg_("BFG_GET_B_RANK_MONOLITH_KEY") == false){
		if(GetEventFlg_("BFG_DUMMY_AQUA_RIDE_TUTORIAL") == false){
			if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){
				if(ice_event_num == GetFlagID_("CONST_SS_IF_GO_TO_THE_EAST_ICE_PARK")){
					//ライド強制解除
					SetRideOffStart_();
				}
			}
		}
	}
	// Demo514[Aランクライセンス獲得]の再生後、低空ライドチュートリアルメッセージを表示するタイミングでライドの解除を行う
	if(GetEventFlg_("BFG_DISPLAY_RIDE_TUTORIAL_MESSAGE") == true){
		if(main_num == GetFlagID_("CONST_SM_VOLCANO")){
			if(volcano_event_num == GetFlagID_("CONST_SS_VC_PRE_SECRET_BASE_DEMO")){
				//ライド強制解除
				SetRideOffStart_();
			}
		}
	}
	// 擬似デモ[テレジアの含み]再生前に解除
	if(GetEventFlg_("BFG_PLAYING_TEREZIA_DEMO") == true){
		SetRideOffStart_();
	}
	// Demo515[テレジアの含み①（バーチャルコロシアム）]の再生後にライドの解除を行う
	if(main_num == GetFlagID_("CONST_SM_VOLCANO")){
		if(volcano_event_num == GetFlagID_("CONST_SS_VC_PRE_HELP_GIRL_DEMO")){
			//ライド強制解除
			SetRideOffStart_();
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
	SetEventFlg_("BFG_ARRIVE_AT_O01", true);

//---------------------------------------------------------------
// シナリオフラグの取得
	// フラグを取得する
	local main_num 			= GetNumFlg_("NUM_SCENARIO_MAIN");
	local green_event_num 	= GetNumFlg_("NUM_SCENARIO_SUB_GREEN");
	local ice_event_num 	= GetNumFlg_("NUM_SCENARIO_SUB_ICE");
	local volcano_event_num = GetNumFlg_("NUM_SCENARIO_SUB_VOLCANO");
	local sky_num 			= GetNumFlg_("NUM_SCENARIO_SUB_SKY");

	DebugPrint(" ");
	DebugPrint("NUM_SCENARIO_MAIN の値は " + main_num + " になりました。");
	DebugPrint("NUM_SCENARIO_SUB_GREEN の値は " + green_event_num + " になりました。");

	// 復帰位置のチェック
	local check_dead = GetEventFlg_("BFG_DEAD_RETURN");
	if(check_dead == true){
		// 全滅通知Bitフラグをfalseに戻す( プログラムで立ててスクリプトで降ろす )
		SetEventFlg_("BFG_DEAD_RETURN", false);
	}

//------------------------------------------------------------------
// ギミック
	//モノリスのモデル読み込み
	local l_monolith = ReadGimmick_("o_com_02");
	// モノリス
	g_monolith_s <- C_NONE_ID;
	g_monolith_a <- C_NONE_ID;
	g_monolith_b <- C_NONE_ID;
	g_monolith_c <- C_NONE_ID;

	// Cモノリス
	g_monolith_c = ArrangePointGimmick_("o_com_02", l_monolith, "obj_C_monolith");
	// Cモノリス(「起動前待機」のモーションを設定)
	SetMotion_(g_monolith_c, MOT_GIMMICK_0, 0);
	if(GetEventFlg_("BFG_START_C_MONOLITH") == true){
		// Cランク取得後の時だけモノリス再起動イベントが発生するので「起動前待機」のアニメを設定
		if(main_num == GetFlagID_("CONST_SM_GRASSLAND")
		&& green_event_num == GetFlagID_("CONST_SS_GR_GET_RIDE_SKILL_JUMP")){
			SetMotion_(g_monolith_c, MOT_GIMMICK_0, 0);
			DebugPrint("モノリスのアニメはGIMMICK_0です");
		}
		else{
			// モノリスの起動後待機アニメを再生
			SetMotion_(g_monolith_c, MOT_GIMMICK_2, BLEND_N);
			DebugPrint("モノリスのアニメはGIMMICK_2です");
		}
	}
	// Bモノリス
	g_monolith_b = ArrangePointGimmick_("o_com_02", l_monolith, "obj_B_monolith");
	// Bモノリス(「起動前待機」のモーションを設定)
	SetMotion_(g_monolith_b, "GIMMICK_0", 0);
	if(GetEventFlg_("BFG_START_B_MONOLITH") == true){
		// Bランク取得後の時だけモノリス再起動イベントが発生するので「起動前待機」のアニメを設定
		if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")
		&& ice_event_num == GetFlagID_("CONST_SS_IF_GO_TO_THE_EAST_ICE_PARK")){
			if(GetEventFlg_("BFG_DUMMY_AQUA_RIDE_TUTORIAL") == false){
				SetMotion_(g_monolith_b, MOT_GIMMICK_0, 0);
				DebugPrint("モノリスのアニメはGIMMICK_0です");
			}
			else{
				SetMotion_(g_monolith_b, MOT_GIMMICK_2, BLEND_N);
				DebugPrint("モノリスのアニメはGIMMICK_2です");
			}
		}
		else{
			// モノリスの起動後待機アニメを再生
			SetMotion_(g_monolith_b, MOT_GIMMICK_2, BLEND_N);
			DebugPrint("モノリスのアニメはGIMMICK_2です");
		}
	}
	// Aモノリス
	g_monolith_a = ArrangePointGimmick_("o_com_02", l_monolith, "obj_A_monolith");
	// Aモノリス(「起動前待機」のモーションを設定)
	SetMotion_(g_monolith_a, "GIMMICK_0", 0);
	if(GetEventFlg_("BFG_START_A_MONOLITH") == true){
		// Aランク取得後の時だけモノリス再起動イベントが発生するので「起動前待機」のアニメを設定
		if(main_num == GetFlagID_("CONST_SM_VOLCANO")
		&& volcano_event_num == GetFlagID_("CONST_SS_VC_PRE_SECRET_BASE_DEMO")){
			SetMotion_(g_monolith_a, MOT_GIMMICK_0, 0);
			DebugPrint("モノリスのアニメはGIMMICK_0です");
		}
		else if(main_num == GetFlagID_("CONST_SM_VOLCANO")
		&& volcano_event_num == GetFlagID_("CONST_SS_VC_PRE_HELP_GIRL_DEMO")){
			SetMotion_(g_monolith_a, MOT_GIMMICK_2, 0);
			DebugPrint("モノリスのアニメはGIMMICK_2です");
		}
		else if(main_num == GetFlagID_("CONST_SM_VOLCANO")
		&& volcano_event_num == GetFlagID_("CONST_SS_HV_GO_BACK_THE_VOLCANO")){
			SetMotion_(g_monolith_a, MOT_GIMMICK_2, 0);
			DebugPrint("モノリスのアニメはGIMMICK_2です");
		}
		else{
			// モノリスの起動後待機アニメを再生
			SetMotion_(g_monolith_a, MOT_GIMMICK_2, BLEND_N);
			DebugPrint("モノリスのアニメはGIMMICK_2です");
		}
	}
	// Sモノリス
	g_monolith_s = ArrangePointGimmick_("o_com_02", l_monolith, "obj_S_monolith");
	// Sモノリス(「起動前待機」のモーションを設定)
	SetMotion_(g_monolith_s, "GIMMICK_0", 0);
	if(GetEventFlg_("BFG_START_S_MONOLITH") == true){
		// モノリスの起動後待機アニメを再生
		SetMotion_(g_monolith_s, MOT_GIMMICK_2, BLEND_N);
		DebugPrint("モノリスのアニメはGIMMICK_2です");
	}

	// ランクの扉
	local door_s = ReadGimmick_("o_O01_02");
	local door_a = ReadGimmick_("o_O01_03");
	local door_b = ReadGimmick_("o_O01_05");
	local door_c = ReadGimmick_("o_O01_04");
	local g_door_s = ArrangePointGimmick_("o_O01_02", door_s, "g_door_s");
	local g_door_a = ArrangePointGimmick_("o_O01_03", door_a, "g_door_a");
	local g_door_b = ArrangePointGimmick_("o_O01_05", door_b, "g_door_b");
	local g_door_c = ArrangePointGimmick_("o_O01_04", door_c, "g_door_c");

	// モノリスのかぎ(仮)<重要アイテムのエフェクト>
	g_key   <- C_NONE_ID; // Ｃランク
	g_key_b <- C_NONE_ID; // Ｂランク
	g_key_a <- C_NONE_ID; // Ａランク
	if(main_num == GetFlagID_("CONST_SM_GRASSLAND")
	&& green_event_num == GetFlagID_("CONST_SS_GR_GET_RIDE_SKILL_JUMP")){
		if(GetEventFlg_("BFG_GET_C_RANK_MONOLITH_KEY") == false){
			LoadEffect_("EF300_40_ITEM_SIGN");
			g_key = SetPointWorldEffect_("EF300_40_ITEM_SIGN", "g_key");
		}
	}
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")
	&& ice_event_num == GetFlagID_("CONST_SS_IF_GO_TO_THE_EAST_ICE_PARK")){
		if(GetEventFlg_("BFG_GET_B_RANK_MONOLITH_KEY") == false){
			LoadEffect_("EF300_40_ITEM_SIGN");
			g_key_b = SetPointWorldEffect_("EF300_40_ITEM_SIGN", "g_key_b");
		}
	}
	if(main_num == GetFlagID_("CONST_SM_VOLCANO")
	&& volcano_event_num == GetFlagID_("CONST_SS_VC_PRE_SECRET_BASE_DEMO")){
		if(GetEventFlg_("BFG_GET_A_RANK_MONOLITH_KEY") == false){
			LoadEffect_("EF300_40_ITEM_SIGN");
			g_key_a = SetPointWorldEffect_("EF300_40_ITEM_SIGN", "g_key_a");
		}
	}

//-------------------------------------------------------------------------------------
// NPC関連
	// レナーテ
	g_npc_renate <- C_NONE_ID;
	if(main_num == GetFlagID_("CONST_SM_SKY")){										// Num0 = 8
		if(sky_num < GetFlagID_("CONST_SS_SK_FIND_OUT_THE_S_DOOR")){				// Num9 < 4
			//
		}
		else if(sky_num < GetFlagID_("CONST_SS_SK_GO_OUT_THE_COLOSSEUM_1")){				// Num9 < 11
			// モデル読込
			local id_renate = ReadNpc_("n007");
			g_npc_renate = ArrangePointNpc_(id_renate, "npc_renate00");
			// NPCの設定
			SetTalkCameraType_(g_npc_renate, TALK_CAMERA_UP);
			SetReactorMsg_(g_npc_renate, "REC_NPC_RENATE");
			// 会話カメラ時に透過されるのでアルファ値を設定する
			SetManualCalcAlpha_(g_npc_renate, true);
			SetAlpha_(g_npc_renate, 1.0);
		}
	}

//-------------------------------------------------------------------------------------------------
// イベント地雷

	//入口
	g_mine_door_c 	<- SetPointCircleEventMine_("mine_C_01", true);// Cの扉
	g_mine_door_b 	<- SetPointCircleEventMine_("mine_B_01", true);// Bの扉
	g_mine_door_a 	<- SetPointCircleEventMine_("mine_A_01", true);// Aの扉
	g_mine_door_s 	<- SetPointCircleEventMine_("mine_S_01", true);// Sの扉
	//出口
	g_exit_c 		<- SetPointCircleEventMine_("mine_C_02", true);// ノチョーラパークへ戻る
	g_exit_b		<- C_NONE_ID;
	if(GetEventFlg_("BFG_PLAYING_TEREZIA_DEMO") == false){
		g_exit_b = SetPointCircleEventMine_("mine_B_02", true);// 凍骨の氷原へ戻る
	}
	g_exit_a 		<- SetPointCircleEventMine_("mine_A_02", true);// 焦熱の火山へ戻る
	g_exit_s 		<- SetPointCircleEventMine_("mine_S_02", true);// ノチョーラパークへ戻る

	// モノリスのかぎ(仮)
	mine_key   <- C_NONE_ID; // Ｃランク
	mine_key_b <- C_NONE_ID; // Ｂランク
	mine_key_a <- C_NONE_ID; // Ａランク
	if(main_num == GetFlagID_("CONST_SM_GRASSLAND")
	&& green_event_num == GetFlagID_("CONST_SS_GR_GET_RIDE_SKILL_JUMP")){
		if(GetEventFlg_("BFG_GET_C_RANK_MONOLITH_KEY") == false){
			mine_key = SetPointCircleEventMine_("mine_key", false);
		}
	}
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")
	&& ice_event_num == GetFlagID_("CONST_SS_IF_GO_TO_THE_EAST_ICE_PARK")){
		if(GetEventFlg_("BFG_GET_B_RANK_MONOLITH_KEY") == false){
			mine_key_b = SetPointCircleEventMine_("mine_key_b", false);
		}
	}
	if(main_num == GetFlagID_("CONST_SM_VOLCANO")
	&& volcano_event_num == GetFlagID_("CONST_SS_VC_PRE_SECRET_BASE_DEMO")){
		if(GetEventFlg_("BFG_GET_A_RANK_MONOLITH_KEY") == false){
			mine_key_a = SetPointCircleEventMine_("mine_key_a", false);
		}
	}

//----------------------------------------------------------------------
// リアクターポイント
	// 下の３つは他のイベントブロックで使用するためグローバル変数
	reactorPoint09 <- C_NONE_ID;
	reactorPoint10 <- C_NONE_ID;
	reactorPoint11 <- C_NONE_ID;

	local reactorPoint01 = ArrangeMsgReactorPoint("reactor_point_01", GetFlagID_("BFG_REACTER_POINT_030")
		, LONG_DIST, "REC_POINT_01_01", "REC_POINT_01_02");
	local reactorPoint02 = ArrangeMsgReactorPoint("reactor_point_02", GetFlagID_("BFG_REACTER_POINT_031")
		, LONG_DIST, "REC_POINT_02_01", "REC_POINT_02_02");
	local reactorPoint03 = ArrangeMsgReactorPoint("reactor_point_03", GetFlagID_("BFG_REACTER_POINT_032")
		, LONG_DIST, "REC_POINT_03_01", "REC_POINT_03_02");
	local reactorPoint04 = ArrangeMsgReactorPoint("reactor_point_04", GetFlagID_("BFG_REACTER_POINT_033")
		, LONG_DIST, "REC_POINT_04_01", "REC_POINT_02_02");
	local reactorPoint05 = ArrangeMsgReactorPoint("reactor_point_05", GetFlagID_("BFG_REACTER_POINT_034")
		, LONG_DIST, "REC_POINT_05_01", "REC_POINT_05_02");
	local reactorPoint06 = ArrangeMsgReactorPoint("reactor_point_06", GetFlagID_("BFG_REACTER_POINT_035")
		, LONG_DIST, "REC_POINT_06_01", "REC_POINT_02_02");
	local reactorPoint07 = ArrangeMsgReactorPoint("reactor_point_07", GetFlagID_("BFG_REACTER_POINT_036")
		, LONG_DIST, "REC_POINT_07_01", "REC_POINT_07_02");
	local reactorPoint08 = ArrangeMsgReactorPoint("reactor_point_08", GetFlagID_("BFG_REACTER_POINT_037")
		, LONG_DIST, "REC_POINT_08_01", "REC_POINT_02_02");
	if(main_num == GetFlagID_("CONST_SM_GRASSLAND")
	&& green_event_num == GetFlagID_("CONST_SS_GR_GET_RIDE_SKILL_JUMP")){
		if(GetEventFlg_("BFG_GET_C_RANK_MONOLITH_KEY") == false){
			reactorPoint09 = ArrangeMsgReactorPoint("reactor_point_09", GetFlagID_("BFG_REACTER_POINT_046")
				, LONG_DIST, "REC_POINT_09_01", "REC_POINT_09_02");
		}
	}
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")
	&& ice_event_num == GetFlagID_("CONST_SS_IF_GO_TO_THE_EAST_ICE_PARK")){
		if(GetEventFlg_("BFG_GET_B_RANK_MONOLITH_KEY") == false){
			reactorPoint10 = ArrangeMsgReactorPoint("reactor_point_10", GetFlagID_("BFG_REACTER_POINT_046")
				, LONG_DIST, "REC_POINT_09_01", "REC_POINT_09_02");
		}
	}
	if(main_num == GetFlagID_("CONST_SM_VOLCANO")
	&& volcano_event_num == GetFlagID_("CONST_SS_VC_PRE_SECRET_BASE_DEMO")){
		if(GetEventFlg_("BFG_GET_A_RANK_MONOLITH_KEY") == false){
			reactorPoint11 = ArrangeMsgReactorPoint("reactor_point_11", GetFlagID_("BFG_REACTER_POINT_046")
				, LONG_DIST, "REC_POINT_09_01", "REC_POINT_09_02");
		}
	}

//----------------------------------------------------------------------
// ルーラ禁止( 各ライドのチュートリアルイベント中はルーラ出来ないようにする )

	if(main_num == GetFlagID_("CONST_SM_GRASSLAND")
	&& green_event_num == GetFlagID_("CONST_SS_GR_GET_RIDE_SKILL_JUMP")){
		SetEventFlg_("BFG_PLAYERABILITY_RULER_PROHIBIT", true);
	}
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")
	&& ice_event_num == GetFlagID_("CONST_SS_IF_GO_TO_THE_EAST_ICE_PARK")){
		if(GetEventFlg_("BFG_DUMMY_AQUA_RIDE_TUTORIAL") == false){
			SetEventFlg_("BFG_PLAYERABILITY_RULER_PROHIBIT", true);
		}
	}
	if(main_num == GetFlagID_("CONST_SM_VOLCANO")
	&& volcano_event_num == GetFlagID_("CONST_SS_VC_PRE_SECRET_BASE_DEMO")){
		SetEventFlg_("BFG_PLAYERABILITY_RULER_PROHIBIT", true);
	}
	// Sランク取得後外に出るまでの間
	if(main_num == GetFlagID_("CONST_SM_SKY")){
		if(sky_num >= GetFlagID_("CONST_SS_SK_GO_OUT_THE_COLOSSEUM_2")){	// Num9 = 99
			SetEventFlg_("BFG_PLAYERABILITY_RULER_PROHIBIT", true);			// ルーラ 禁止
			SetEventFlg_("BFG_FLIGHT_PROHIBIT", true);						// フライトシグナル 禁止
		}
	}

//----------------------------------------------------------------------
// ナビマップ
	//「！」アイコン
	// モノリス(Ｃランク用モノリス)
	local exclamation01 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "obj_C_monolith"); 
	SetNaviMapIconVisible_(exclamation01, true);
	// モノリス(Ｂランク用モノリス)
	local exclamation03 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "obj_B_monolith"); 
	SetNaviMapIconVisible_(exclamation03, true);
	// モノリス(Ａランク用モノリス)
	local exclamation05 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "obj_A_monolith"); 
	SetNaviMapIconVisible_(exclamation05, true);
	// モノリス(Ｓランク用モノリス)
	local exclamation07 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "obj_S_monolith"); 
	SetNaviMapIconVisible_(exclamation07, true);

	// モノリスのかぎ(仮)
	exclamation02 <- C_NONE_ID;
	exclamation04 <- C_NONE_ID;
	exclamation06 <- C_NONE_ID;
	if(main_num == GetFlagID_("CONST_SM_GRASSLAND")
	&& green_event_num == GetFlagID_("CONST_SS_GR_GET_RIDE_SKILL_JUMP")){
		if(GetEventFlg_("BFG_GET_C_RANK_MONOLITH_KEY") == false){
			exclamation02 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "reactor_point_09"); 
			SetNaviMapIconVisible_(exclamation02, true);
		}
	}
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")
	&& ice_event_num == GetFlagID_("CONST_SS_IF_GO_TO_THE_EAST_ICE_PARK")){
		if(GetEventFlg_("BFG_GET_B_RANK_MONOLITH_KEY") == false){
			exclamation04 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "reactor_point_10"); 
			SetNaviMapIconVisible_(exclamation04, true);
		}
	}
	if(main_num == GetFlagID_("CONST_SM_VOLCANO")
	&& volcano_event_num == GetFlagID_("CONST_SS_VC_PRE_SECRET_BASE_DEMO")){
		if(GetEventFlg_("BFG_GET_A_RANK_MONOLITH_KEY") == false){
			exclamation06 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "reactor_point_11"); 
			SetNaviMapIconVisible_(exclamation06, true);
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
// メインシナリオ用のフラグ-----------------------------------------
	// フラグを取得する
	local main_num 			= GetNumFlg_("NUM_SCENARIO_MAIN");
	local green_event_num 	= GetNumFlg_("NUM_SCENARIO_SUB_GREEN");
	local ice_event_num 	= GetNumFlg_("NUM_SCENARIO_SUB_ICE");
	local volcano_event_num = GetNumFlg_("NUM_SCENARIO_SUB_VOLCANO");
	local sky_num 			= GetNumFlg_("NUM_SCENARIO_SUB_SKY");

	local player = GetPlayerId_();	// プレイヤーID取得
	local p_pos	 = GetPos_(player);	// プレイヤーの座標を取得
	
	// 一度Demo022[Cランク試験]が再生されたかどうかチェックする
	local check_demo1 = GetEventFlg_("BFG_EXAM_RANK_C");
	// 一度Demo304[Bランク試験]が再生されたかどうかチェックする
	local check_demo2 = GetEventFlg_("BFG_EXAM_RANK_B");
	// 一度Demo507[Aランク試験]が再生されたかどうかチェックする
	local check_demo3 = GetEventFlg_("BFG_EXAM_RANK_A");
	// 一度Demo618[最後のパワー]が再生されたかどうかチェックする
	local check_demo4 = GetEventFlg_("BFG_EXAM_RANK_S");

//-------------------------------------------------------------------
// 擬似デモ[テレジアの含み]を再生
	if(GetEventFlg_("BFG_PLAYING_TEREZIA_DEMO") == true){
		local change_map_name = "I00_00";
		local change_map_pos  = Vec3(-1803.0, 877.8, -1064.2);
		local change_map_dir  = 3;
		SetMotion_(g_monolith_b, MOT_GIMMICK_2, BLEND_N);
		SetEventFlg_("BFG_PLAYING_TEREZIA_DEMO", false);
		uAquaRideTutorialClearDemo();
		SetEventFlg_("BFG_PLAYERABILITY_RULER_PROHIBIT", false); // ルーラ禁止を解除
		ChangeMapPosDir_(change_map_name, change_map_pos, change_map_dir);
	}


// マップ切替え直後のデモ再生
	// DEMO022[Cランク試験]再生
	if(main_num == GetFlagID_("CONST_SM_GRASSLAND") && green_event_num == GetFlagID_("CONST_SS_VC_TRY_RANK_C")){
		if(check_demo1 == false){
			// プレイヤー座標を見てデモを再生するかどうか決める
			if(p_pos.z >= 1200.0){
				// デモ再生前にフィールドが映らないための対応
				SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				WaitFade_();
				SetEventFlg_("BFG_EXAM_RANK_C",true);
				ChangeDemo_(22);
			}
		}
	}
	// Ｃランク試験クリア後にライドチュートリアルメッセージを表示
	if(main_num == GetFlagID_("CONST_SM_GRASSLAND")
	&& green_event_num == GetFlagID_("CONST_SS_GR_GET_RIDE_SKILL_JUMP")){
		uRideTutorialMessage();
	}
	
	// DEMO304[Bランク試験]再生
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD") && ice_event_num == GetFlagID_("CONST_SS_IF_GO_TO_SEE_GATEKEEPER")){
		if(check_demo2 == false){
			// プレイヤー座標を見てデモを再生するかどうか決める
			if(p_pos.x >= 1200.0){
				// デモ再生前にフィールドが映らないための対応
				SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				WaitFade_();
				SetNumFlg_("NUM_SCENARIO_SUB_ICE", GetFlagID_("CONST_SS_VC_TRY_RANK_B"));
				ChangeDemo_(304);//304[Bランク試験]
			}
		}
	}
	// Bランク試験クリア後にライドチュートリアルメッセージを表示
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")
	&& ice_event_num == GetFlagID_("CONST_SS_IF_GO_TO_THE_EAST_ICE_PARK")){
		uRideTutorialMessage();
	}
	
	// DEMO507[Aランク試験]再生
	if(main_num == GetFlagID_("CONST_SM_VOLCANO") && volcano_event_num == GetFlagID_("CONST_SS_HV_GO_TO_THE_COLOSSEUM")){
		if(check_demo3 == false){
			// プレイヤー座標を見てデモを再生するかどうか決める
			if(p_pos.x <= -1200.0){
				// デモ再生前にフィールドが映らないための対応
				SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				WaitFade_();
				SetNumFlg_("NUM_SCENARIO_SUB_VOLCANO", GetFlagID_("CONST_SS_VC_FIND_OUT_THE_A_DOOR"));
				ChangeDemo_(507);//507[Aランク試験]
			}
		}
	}
	// Aランク試験クリア後にライドチュートリアルメッセージを表示
	if(main_num == GetFlagID_("CONST_SM_VOLCANO")
	&& volcano_event_num == GetFlagID_("CONST_SS_VC_PRE_SECRET_BASE_DEMO")){
		uRideTutorialMessage();
	}

	// Demo516[Ａランクライセンス獲得 テレジア]再生
	if(main_num == GetFlagID_("CONST_SM_VOLCANO")
	&& volcano_event_num == GetFlagID_("CONST_SS_VC_PRE_HELP_GIRL_DEMO")){
		SetNumFlg_("NUM_SCENARIO_SUB_VOLCANO", GetFlagID_("CONST_SS_HV_GO_BACK_THE_VOLCANO"));
		SetReturnDemoPosDir_(Vec3(-1272.979, 10.013, 0.0), -90);
		EventStartChangeDemo(516, FADE_COLOR_BLACK);
	}

	// Demo618[最後のパワー]再生
	if(main_num == GetFlagID_("CONST_SM_SKY")
	&& sky_num == GetFlagID_("CONST_SS_SK_GO_TO_THE_COLOSSEUM")){				// Num9 = 3
		if(check_demo4 == false){
			// プレイヤー座標を見てデモを再生するかどうか決める
			if(p_pos.z <= -1200.0){
				// デモ再生前にフィールドが映らないための対応
				SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				WaitFade_();
				SetReturnDemoPosDir_(Vec3(0.0, 0.0, -1250.0), 0);
				SetNumFlg_("NUM_SCENARIO_SUB_SKY", GetFlagID_("CONST_SS_SK_FIND_OUT_THE_S_DOOR"));	// Num9 = 4
				ChangeDemo_(618);//618[最後のパワー]
			}
		}
	}

	// レティス仲間画面とDemo637[Sランクライセンス獲得②]再生
	if(main_num == GetFlagID_("CONST_SM_SKY")
	&& sky_num == GetFlagID_("CONST_SS_SK_GO_OUT_THE_COLOSSEUM_1")){			// Num9 = 11
		// ナビマップを非表示
		SetNavimapVisible_(false);
		// メッセージボックスより後ろの階層に暗転するように設定
		SetFadePlane_(FADE_PLANE.PLANE_3D);	// 上画面
		// フィールドが映らないための対応
		SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
		WaitFade_();
		// フライトシグナル(大空の証)を追加
		AddItem_(64, 1);
		// 預り所の空き枠チェック
		local residue = GetFreeMonsterNum_();
		if(residue <= 0){
			SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_TEREZIA");
			ShowMsg_("NOT_EMPTY_MSG_001");
			KeyInputWait_();
			CloseMsgWnd_();
			SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, 15);
			// 預り所を呼び出す
			GotoMenuFadeOpen(MENU_OPEN.LUGGAGE_OFFICE);
			// すぐに暗転
			SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
			// ナビマップを表示
			SetNavimapVisible_(true);
			// 空き枠を作らなかった時の処理へ飛ぶ
			SetNumFlg_("NUM_SCENARIO_SUB_SKY", GetFlagID_("CONST_SS_SK_FELLOW_RETHITH"));
			ChangeMap_("O01_00");
		}
		else{
			// レティスを追加(Redmine#1137)
			local task_fellow;
			task_fellow = Task_AddFellow_(1603, false);
			WaitTask(task_fellow);
			// 暗転する階層を元の状態に戻す
			SetFadePlane_(FADE_PLANE.PLANE_NORMAL);
			SetNumFlg_("NUM_SCENARIO_SUB_SKY", GetFlagID_("CONST_SS_SK_GO_OUT_THE_COLOSSEUM_2"));
			// 戻り座標をSランク扉前にする
			SetReturnDemoPosDir_(Vec3(0.0, 0.0, -850.0), 180);
			// Demo637[Sランクライセンス獲得②]再生
			EventStartChangeDemo(637, FADE_COLOR_BLACK);
		}
	}

	// レティスを仲間にする際、空き枠を作らなかった時の処理
	if(main_num == GetFlagID_("CONST_SM_SKY")
	&& sky_num == GetFlagID_("CONST_SS_SK_FELLOW_RETHITH")){
		// ナビマップを非表示
		SetNavimapVisible_(false);
		// メッセージボックスより後ろの階層に暗転するように設定
		SetFadePlane_(FADE_PLANE.PLANE_3D);	// 上画面
		// フィールドが映らないための対応
		SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
		WaitFade_();
		// 預り所の空き枠チェック
		local residue = GetFreeMonsterNum_();
		if(residue <= 0){
			SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_TEREZIA");
			ShowMsg_("NOT_EMPTY_MSG_001");
			KeyInputWait_();
			CloseMsgWnd_();
			SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, 15);
			// 預り所を呼び出す
			GotoMenuFadeOpen(MENU_OPEN.LUGGAGE_OFFICE);
			// すぐに暗転
			SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
			// ナビマップを表示
			SetNavimapVisible_(true);
			// 空き枠を作らなかった時の処理へ飛ぶ
			SetNumFlg_("NUM_SCENARIO_SUB_SKY", GetFlagID_("CONST_SS_SK_FELLOW_RETHITH"));
			ChangeMap_("O01_00");
		}
		else{
			// レティスを追加(Redmine#1137)
			local task_fellow;
			task_fellow = Task_AddFellow_(1603, false);
			WaitTask(task_fellow);
			// 暗転する階層を元の状態に戻す
			SetFadePlane_(FADE_PLANE.PLANE_NORMAL);
			SetNumFlg_("NUM_SCENARIO_SUB_SKY", GetFlagID_("CONST_SS_SK_GO_OUT_THE_COLOSSEUM_2"));
			// 戻り座標をSランク扉前にする
			SetReturnDemoPosDir_(Vec3(0.0, 0.0, -850.0), 180);
			// Demo637[Sランクライセンス獲得②]再生
			EventStartChangeDemo(637, FADE_COLOR_BLACK);
		}
	}

// デモ再生後のバトル( 戦闘終了タイプの後に記入 )------------------------------

	//Cランク試験
	if(main_num == 1){
		// Cランク試験終了後の復帰座標・向きを変数を格納
		local return_pos = Vec3(0.0, 0.0, 870.0);	// 座標
		local return_dir = 0;						// 本対応の向き

		switch (green_event_num) {
		// シナリオの変更でボーショック戦にチュートリアルライド戦を組み込んだのでコメント化( 備忘録用 )
		case GetFlagID_("CONST_SS_VC_START_RANK_C"):	//Cランク開始デモ再生後
			// 草原用NUMフラグ進行
			SetNumFlg_("NUM_SCENARIO_SUB_GREEN", GetFlagID_("CONST_SS_VC_FIRST_BATTLE_WIN"));
			//特殊戦闘準備
			SetEventFlg_("BFG_DEAD_KEEP_MAP", true);			// 全滅時その場復帰Bitフラグ
			SetEventFlg_("BFG_BATTLE_GETUP_DISABLE", true);		// 起き上がらないよフラグ
			// ステータス回復
			RecoverAll_();
			// Cランク１回戦のバトルへ
			ChangeBattleParty_(3);
			break;
		case GetFlagID_("CONST_SS_VC_FIRST_BATTLE_WIN"):	//Cランク１回戦勝利後
			if(GetBattleEndType_() == BATTLE_END_TYPE_WIN){
				// デモ再生前にフィールドが映らないための対応
				SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				WaitFade_();
				// 進行フラグを進める
				SetNumFlg_("NUM_SCENARIO_SUB_GREEN", GetFlagID_("CONST_SS_VC_SECOND_BATTLE"));
				// Demo026[Cランク１回戦勝利]
				ChangeDemo_(26);
			} else {
				// デモ再生前にフィールドが映らないための対応
				SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				WaitFade_();
				// Ｃランク再戦フラグ
				SetEventFlg_("BFG_REMATCH_RANK_C", true);
				// フラグを戻す(後で変更すること)
				SetNumFlg_("NUM_SCENARIO_SUB_GREEN", GetFlagID_("CONST_SS_VC_TRY_RANK_C"));
				// 全滅時その場復帰Bitフラグを戻す
				SetEventFlg_("BFG_DEAD_KEEP_MAP", false);
				// 起き上がらないよフラグ
				SetEventFlg_("BFG_BATTLE_GETUP_DISABLE", false);
				// ステータス回復
				RecoverAll_();
				// 戻り座標をCランク扉前にする
				SetReturnDemoPosDir_(return_pos, return_dir);
				// Demo027[Cランク１回戦敗北] -> デモ番号25に変更
				ChangeDemo_(25);
			}
			break;
		case GetFlagID_("CONST_SS_VC_SECOND_BATTLE"):	//Cランク２回戦開始
			SetNumFlg_("NUM_SCENARIO_SUB_GREEN", GetFlagID_("CONST_SS_VC_SECOND_BATTLE_WIN"));
			// 全滅時その場復帰Bitフラグ
			SetEventFlg_("BFG_DEAD_KEEP_MAP", true);
			// 起き上がらないよフラグ
			SetEventFlg_("BFG_BATTLE_GETUP_DISABLE", true);
			ChangeBattleParty_(4);
			break;
		case GetFlagID_("CONST_SS_VC_SECOND_BATTLE_WIN"):	//Cランク２回戦勝利後
			if(GetBattleEndType_() == BATTLE_END_TYPE_WIN){
				// デモ再生前にフィールドが映らないための対応
				SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				WaitFade_();
				// 進行フラグを進める
				SetNumFlg_("NUM_SCENARIO_SUB_GREEN", GetFlagID_("CONST_SS_VC_THIRD_BATTLE"));
				// Demo028[Cランク２回戦勝利]
				ChangeDemo_(28);
			} else {
				// デモ再生前にフィールドが映らないための対応
				SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				WaitFade_();
				// Ｃランク再戦フラグ
				SetEventFlg_("BFG_REMATCH_RANK_C", true);
				// フラグを戻す(後で変更すること)
				SetNumFlg_("NUM_SCENARIO_SUB_GREEN", GetFlagID_("CONST_SS_VC_TRY_RANK_C"));
				// 全滅時その場復帰Bitフラグを戻す
				SetEventFlg_("BFG_DEAD_KEEP_MAP", false);
				// 起き上がらないよフラグ
				SetEventFlg_("BFG_BATTLE_GETUP_DISABLE", false);
				// ステータス回復
				RecoverAll_();
				// 戻り座標をCランク扉前にする
				SetReturnDemoPosDir_(return_pos, return_dir);
				// Demo029[Cランク２回戦敗北] -> デモ番号25に変更
				ChangeDemo_(25);
			}
			break;
		case GetFlagID_("CONST_SS_VC_THIRD_BATTLE"):	//Cランク３回戦開始
			SetNumFlg_("NUM_SCENARIO_SUB_GREEN", GetFlagID_("CONST_SS_VC_GET_LICENSE_RANK_C"));
			// 全滅時その場復帰Bitフラグ
			SetEventFlg_("BFG_DEAD_KEEP_MAP", true);
			// 起き上がらないよフラグ
			SetEventFlg_("BFG_BATTLE_GETUP_DISABLE", true);
			ChangeBattleParty_(5);
			break;
		case GetFlagID_("CONST_SS_VC_GET_LICENSE_RANK_C"):	//Cランク３回戦勝利後
			if(GetBattleEndType_() == BATTLE_END_TYPE_WIN){
				// デモ再生前にフィールドが映らないための対応
				SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				WaitFade_();
				// 進行フラグを進める
				SetNumFlg_("NUM_SCENARIO_SUB_GREEN", GetFlagID_("CONST_SS_GR_GET_RIDE_SKILL_JUMP"));
				// 全滅時その場復帰Bitフラグを戻す
				SetEventFlg_("BFG_DEAD_KEEP_MAP", false);
				// 起き上がらないよフラグ
				SetEventFlg_("BFG_BATTLE_GETUP_DISABLE", false);
				// ライドライセンスフラグ
				SetEventFlg_("BFG_RIDE_LICENSE_FIELD", true);
				// ランク戦後のライドのチュートリアルメッセージを表示するフラグ
				SetEventFlg_("BFG_DISPLAY_RIDE_TUTORIAL_MESSAGE", true);
				SetEventFlg_("BFG_DISPLAY_AFTER_RIDE_TUTORIAL_MSG", true);
				// フィールドメニューのライドを解禁
				AddFieldMenu_(FIELD_COMMAND.FIELDRIDE);
				// 戦闘の倍速処理解禁
				SetEventFlg_("BFG_BATTLE_SPEED_DOUBLE", true);
				// 旅の心得解放
				SetEventFlg_("BFG_TRAVEL_INFO_SHOW_008", true);	// 旅の心得の項目解放フラグ【基本】フィールドライド
				SetEventFlg_("BFG_TRAVEL_INFO_SHOW_014", true);	// 旅の心得の項目解放フラグ【メニュー】フィールドライド設定
				SetEventFlg_("BFG_TRAVEL_INFO_SHOW_028", true);	// 旅の心得の項目解放フラグ【戦闘】倍速の仕方
				// ライドチュートリアル中は通信とセーブを使用不可(SQEXRedmine 2次DB #3888)
				uBanSave(true);
				
				// ステータス回復
				RecoverAll_();
				
				// 戻り座標をCランク扉前にする
				SetReturnDemoPosDir_(return_pos, return_dir);
				// Demo032[Ｃランクライセンス獲得]を再生する処理を後で記述
				ChangeDemo_(32);
			} else {
				// デモ再生前にフィールドが映らないための対応
				SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				WaitFade_();
				// Ｃランク再戦フラグ
				SetEventFlg_("BFG_REMATCH_RANK_C", true);
				// フラグを戻す(後で変更すること)
				SetNumFlg_("NUM_SCENARIO_SUB_GREEN", GetFlagID_("CONST_SS_VC_TRY_RANK_C"));
				// 全滅時その場復帰Bitフラグを戻す
				SetEventFlg_("BFG_DEAD_KEEP_MAP", false);
				// 起き上がらないよフラグ
				SetEventFlg_("BFG_BATTLE_GETUP_DISABLE", false);
				// ステータス回復
				RecoverAll_();
				// 戻り座標をCランク扉前にする
				SetReturnDemoPosDir_(return_pos, return_dir);
				// Demo031[Cランク３回戦敗北] -> デモ番号25に変更
				ChangeDemo_(25);
			}
			break;
		}
	}
	//Bランク試験
	if(main_num == 4){
		switch (ice_event_num){
		case GetFlagID_("CONST_SS_VC_PRE_FIRST_BATTLE_B"):	//Bランク1回戦開始
				SetNumFlg_("NUM_SCENARIO_SUB_ICE", GetFlagID_("CONST_SS_VC_JDG_FIRST_BATTLE_B"));
				// 全滅時その場復帰Bitフラグ
				SetEventFlg_("BFG_DEAD_KEEP_MAP", true);
				// 起き上がらないよフラグ
				SetEventFlg_("BFG_BATTLE_GETUP_DISABLE", true);
				// ステータス回復
				RecoverAll_();
				ChangeBattleParty_(28);
			break;
		case GetFlagID_("CONST_SS_VC_JDG_FIRST_BATTLE_B"):	//Bランク１回戦勝利後
			if(GetBattleEndType_() == BATTLE_END_TYPE_WIN){
				// デモ再生前にフィールドが映らないための対応
				SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				WaitFade_();
				// 進行フラグを進める
				SetNumFlg_("NUM_SCENARIO_SUB_ICE", GetFlagID_("CONST_SS_VC_PRE_SECOND_BATTLE_B"));
				ChangeDemo_(307);//307[Bランク 1回戦勝利]
			} else {
				// デモ再生前にフィールドが映らないための対応
				SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				WaitFade_();
				// Bランク再戦フラグ
				SetEventFlg_("BFG_REMATCH_RANK_B", true);
				// フラグを戻す(後で変更すること)
				SetNumFlg_("NUM_SCENARIO_SUB_ICE", GetFlagID_("CONST_SS_VC_TRY_RANK_B"));
				// 全滅時その場復帰Bitフラグを戻す
				SetEventFlg_("BFG_DEAD_KEEP_MAP", false);
				// 起き上がらないよフラグ
				SetEventFlg_("BFG_BATTLE_GETUP_DISABLE", false);
				// ステータス回復
				RecoverAll_();
				// 戻り座標をBランク扉前にする
				SetReturnDemoPosDir_(Vec3(845.664, 0.0, -2.550), 90);
				// 敗北デモ
				ChangeDemo_(306);
			}
			break;
		case GetFlagID_("CONST_SS_VC_PRE_SECOND_BATTLE_B"):	//Bランク２回戦開始
			SetNumFlg_("NUM_SCENARIO_SUB_ICE", GetFlagID_("CONST_SS_VC_JDG_SECOND_BATTLE_B"));
			// 全滅時その場復帰Bitフラグ
			SetEventFlg_("BFG_DEAD_KEEP_MAP", true);
			// 起き上がらないよフラグ
			SetEventFlg_("BFG_BATTLE_GETUP_DISABLE", true);
			ChangeBattleParty_(29);
			break;
		case GetFlagID_("CONST_SS_VC_JDG_SECOND_BATTLE_B"):	//Bランク２回戦勝利後
			if(GetBattleEndType_() == BATTLE_END_TYPE_WIN){
				// デモ再生前にフィールドが映らないための対応
				SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				WaitFade_();
				// 進行フラグを進める
				SetNumFlg_("NUM_SCENARIO_SUB_ICE", GetFlagID_("CONST_SS_VC_PRE_THIRD_BATTLE_B"));
				ChangeDemo_(308);//308[Bランク 2回戦勝利]
			} else {
				// デモ再生前にフィールドが映らないための対応
				SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				WaitFade_();
				// Bランク再戦フラグ
				SetEventFlg_("BFG_REMATCH_RANK_B", true);
				// フラグを戻す(後で変更すること)
				SetNumFlg_("NUM_SCENARIO_SUB_ICE", GetFlagID_("CONST_SS_VC_TRY_RANK_B"));
				// 全滅時その場復帰Bitフラグを戻す
				SetEventFlg_("BFG_DEAD_KEEP_MAP", false);
				// 起き上がらないよフラグ
				SetEventFlg_("BFG_BATTLE_GETUP_DISABLE", false);
				// ステータス回復
				RecoverAll_();
				// 戻り座標をBランク扉前にする
				SetReturnDemoPosDir_(Vec3(845.664, 0.0, -2.550), 90);
				// 敗北デモ
				ChangeDemo_(306);
			}
			break;
		case GetFlagID_("CONST_SS_VC_PRE_THIRD_BATTLE_B"):	//Bランク３回戦開始
			SetNumFlg_("NUM_SCENARIO_SUB_ICE", GetFlagID_("CONST_SS_VC_JDG_THIRD_BATTLE_B"));
			// 全滅時その場復帰Bitフラグ
			SetEventFlg_("BFG_DEAD_KEEP_MAP", true);
			// 起き上がらないよフラグ
			SetEventFlg_("BFG_BATTLE_GETUP_DISABLE", true);
			ChangeBattleParty_(30);
			break;
		case GetFlagID_("CONST_SS_VC_JDG_THIRD_BATTLE_B"):	//Bランク３回戦勝利後
			if(GetBattleEndType_() == BATTLE_END_TYPE_WIN){
				// デモ再生前にフィールドが映らないための対応
				SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				WaitFade_();
				// 進行フラグを進める
				SetNumFlg_("NUM_SCENARIO_SUB_ICE", GetFlagID_("CONST_SS_IF_GO_TO_THE_EAST_ICE_PARK"));
				// フィールドで戦闘する時のお供サーチレベルを変更(2次DB #3701)
				SetNumFlg_("NUM_SEARCH_ATTENDANT_LEVEL", 10);
				// 全滅時その場復帰Bitフラグを戻す
				SetEventFlg_("BFG_DEAD_KEEP_MAP", false);
				// 起き上がらないよフラグ
				SetEventFlg_("BFG_BATTLE_GETUP_DISABLE", false);
				// Bライドライセンスフラグ
				SetEventFlg_("BFG_RIDE_LICENSE_DIVE", true);
				// ランク戦後のライドのチュートリアルメッセージを表示するフラグ
				SetEventFlg_("BFG_DISPLAY_RIDE_TUTORIAL_MESSAGE", true);
				SetEventFlg_("BFG_DISPLAY_AFTER_RIDE_TUTORIAL_MSG", true);
				// 旅の心得解放
				SetEventFlg_("BFG_TRAVEL_INFO_SHOW_009", true);	// 旅の心得の項目解放フラグ【基本】海ライド
				// ライドチュートリアル中は通信とセーブを使用不可(SQEXRedmine 2次DB #3888)
				uBanSave(true);
				// ステータス回復 ※α対応
				RecoverAll_();
				// 戻り座標をBランク扉前にする
				SetReturnDemoPosDir_(Vec3(845.664, 0.0, -2.550), 90);
				ChangeDemo_(311);//311[Bランクライセンス獲得]
			} else {
				// デモ再生前にフィールドが映らないための対応
				SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				WaitFade_();
				// Bランク再戦フラグ
				SetEventFlg_("BFG_REMATCH_RANK_B", true);
				// フラグを戻す(後で変更すること)
				SetNumFlg_("NUM_SCENARIO_SUB_ICE", GetFlagID_("CONST_SS_VC_TRY_RANK_B"));
				// 全滅時その場復帰Bitフラグを戻す
				SetEventFlg_("BFG_DEAD_KEEP_MAP", false);
				// 起き上がらないよフラグ
				SetEventFlg_("BFG_BATTLE_GETUP_DISABLE", false);
				// ステータス回復
				RecoverAll_();
				// 戻り座標をBランク扉前にする
				SetReturnDemoPosDir_(Vec3(845.664, 0.0, -2.550), 90);
				// 敗北デモ
				ChangeDemo_(306);
			}
			break;
		}
	}
	//Aランク試験
	if(main_num == 6){
		switch (volcano_event_num){
		case GetFlagID_("CONST_SS_VC_PRE_FIRST_BATTLE_A"):	//Aランク1回戦開始
				SetNumFlg_("NUM_SCENARIO_SUB_VOLCANO", GetFlagID_("CONST_SS_VC_JDG_FIRST_BATTLE_A"));
				// 全滅時その場復帰Bitフラグ
				SetEventFlg_("BFG_DEAD_KEEP_MAP", true);
				// 起き上がらないよフラグ
				SetEventFlg_("BFG_BATTLE_GETUP_DISABLE", true);
				// ステータス回復
				RecoverAll_();
				ChangeBattleParty_(31);
			break;
		case GetFlagID_("CONST_SS_VC_JDG_FIRST_BATTLE_A"):	//Aランク１回戦勝利後
			if(GetBattleEndType_() == BATTLE_END_TYPE_WIN){
				// デモ再生前にフィールドが映らないための対応
				SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				WaitFade_();
				// 進行フラグを進める
				SetNumFlg_("NUM_SCENARIO_SUB_VOLCANO", GetFlagID_("CONST_SS_VC_PRE_SECOND_BATTLE_A"));
				ChangeDemo_(510);//510[Aランク 1回戦勝利]
			} else {
				// デモ再生前にフィールドが映らないための対応
				SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				WaitFade_();
				// Aランク再戦フラグ
				SetEventFlg_("BFG_REMATCH_RANK_A", true);
				// フラグを戻す(後で変更すること)
				SetNumFlg_("NUM_SCENARIO_SUB_VOLCANO", GetFlagID_("CONST_SS_VC_FIND_OUT_THE_A_DOOR"));
				// 全滅時その場復帰Bitフラグを戻す
				SetEventFlg_("BFG_DEAD_KEEP_MAP", false);
				// 起き上がらないよフラグ
				SetEventFlg_("BFG_BATTLE_GETUP_DISABLE", false);
				// ステータス回復
				RecoverAll_();
				// 戻り座標をAランク扉前にする
				SetReturnDemoPosDir_(Vec3(-850.0, 10.0, 0.0), -90);
				// 敗北デモ
				ChangeDemo_(509);
			}
			break;
		case GetFlagID_("CONST_SS_VC_PRE_SECOND_BATTLE_A"):	//Aランク２回戦開始
			SetNumFlg_("NUM_SCENARIO_SUB_VOLCANO", GetFlagID_("CONST_SS_VC_JDG_SECOND_BATTLE_A"));
			// 全滅時その場復帰Bitフラグ
			SetEventFlg_("BFG_DEAD_KEEP_MAP", true);
			// 起き上がらないよフラグ
			SetEventFlg_("BFG_BATTLE_GETUP_DISABLE", true);
			ChangeBattleParty_(32);
			break;
		case GetFlagID_("CONST_SS_VC_JDG_SECOND_BATTLE_A"):	//Aランク２回戦勝利後
			if(GetBattleEndType_() == BATTLE_END_TYPE_WIN){
				// デモ再生前にフィールドが映らないための対応
				SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				WaitFade_();
				// 進行フラグを進める
				SetNumFlg_("NUM_SCENARIO_SUB_VOLCANO", GetFlagID_("CONST_SS_VC_PRE_THIRD_BATTLE_A"));
				ChangeDemo_(512);//512[Aランク 2回戦勝利]
			} else {
				// デモ再生前にフィールドが映らないための対応
				SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				WaitFade_();
				// Aランク再戦フラグ
				SetEventFlg_("BFG_REMATCH_RANK_A", true);
				// フラグを戻す(後で変更すること)
				SetNumFlg_("NUM_SCENARIO_SUB_VOLCANO", GetFlagID_("CONST_SS_VC_FIND_OUT_THE_A_DOOR"));
				// 全滅時その場復帰Bitフラグを戻す
				SetEventFlg_("BFG_DEAD_KEEP_MAP", false);
				// 起き上がらないよフラグ
				SetEventFlg_("BFG_BATTLE_GETUP_DISABLE", false);
				// ステータス回復
				RecoverAll_();
				// 戻り座標をAランク扉前にする
				SetReturnDemoPosDir_(Vec3(-850.0, 10.0, 0.0), -90);
				// 敗北デモ
				ChangeDemo_(509);
			}
			break;
		case GetFlagID_("CONST_SS_VC_PRE_THIRD_BATTLE_A"):	//Aランク３回戦開始
			SetNumFlg_("NUM_SCENARIO_SUB_VOLCANO", GetFlagID_("CONST_SS_VC_JDG_THIRD_BATTLE_A"));
			// 全滅時その場復帰Bitフラグ
			SetEventFlg_("BFG_DEAD_KEEP_MAP", true);
			// 起き上がらないよフラグ
			SetEventFlg_("BFG_BATTLE_GETUP_DISABLE", true);
			ChangeBattleParty_(33);
			break;
		case GetFlagID_("CONST_SS_VC_JDG_THIRD_BATTLE_A"):	//Aランク３回戦勝利後
			if(GetBattleEndType_() == BATTLE_END_TYPE_WIN){
				// デモ再生前にフィールドが映らないための対応
				SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				WaitFade_();
				// 進行フラグを進める
				SetNumFlg_("NUM_SCENARIO_SUB_VOLCANO", GetFlagID_("CONST_SS_VC_PRE_SECRET_BASE_DEMO"));
				// フィールドで戦闘する時のお供サーチレベルを変更(2次DB #3701)
				SetNumFlg_("NUM_SEARCH_ATTENDANT_LEVEL", 20);
				// 全滅時その場復帰Bitフラグを戻す
				SetEventFlg_("BFG_DEAD_KEEP_MAP", false);
				// 起き上がらないよフラグ
				SetEventFlg_("BFG_BATTLE_GETUP_DISABLE", false);
				// Aランクライドライセンス(低空)フラグ
				SetEventFlg_("BFG_RIDE_LICENSE_MULTIJUMP", true);
				// ランク戦後のライドのチュートリアルメッセージを表示するフラグ
				SetEventFlg_("BFG_DISPLAY_RIDE_TUTORIAL_MESSAGE", true);
				SetEventFlg_("BFG_DISPLAY_AFTER_RIDE_TUTORIAL_MSG", true);
				// 旅の心得解放
				SetEventFlg_("BFG_TRAVEL_INFO_SHOW_010", true);	// 旅の心得の項目解放フラグ	【基本】空ライド
				// ライドチュートリアル中は通信とセーブを使用不可(SQEXRedmine 2次DB #3888)
				uBanSave(true);
				// ステータス回復 ※α対応
				RecoverAll_();
				// 戻り座標をAランク扉前にする
				SetReturnDemoPosDir_(Vec3(-850.0, 10.0, 0.0), -90);
				ChangeDemo_(514); // Demo514[Aランクライセンス獲得]
			} else {
				// デモ再生前にフィールドが映らないための対応
				SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				WaitFade_();
				// Aランク再戦フラグ
				SetEventFlg_("BFG_REMATCH_RANK_A", true);
				// フラグを戻す(後で変更すること)
				SetNumFlg_("NUM_SCENARIO_SUB_VOLCANO", GetFlagID_("CONST_SS_VC_FIND_OUT_THE_A_DOOR"));
				// 全滅時その場復帰Bitフラグを戻す
				SetEventFlg_("BFG_DEAD_KEEP_MAP", false);
				// 起き上がらないよフラグ
				SetEventFlg_("BFG_BATTLE_GETUP_DISABLE", false);
				// ステータス回復
				RecoverAll_();
				// 戻り座標をAランク扉前にする
				SetReturnDemoPosDir_(Vec3(-850.0, 10.0, 0.0), -90);
				// 敗北デモ
				ChangeDemo_(509);
			}
			break;
		}
	}

	//Sランク試験
	if(main_num == 8){
		switch (sky_num){
		//Sランク1回戦開始
		case GetFlagID_("CONST_SS_VC_PRE_FIRST_BATTLE_S"):										//Num9 = 5
			SetNumFlg_("NUM_SCENARIO_SUB_SKY", GetFlagID_("CONST_SS_VC_JDG_FIRST_BATTLE_S"));		//Num9 = 6
			// 全滅時その場復帰Bitフラグ
			SetEventFlg_("BFG_DEAD_KEEP_MAP", true);
			// 起き上がらないよフラグ
			SetEventFlg_("BFG_BATTLE_GETUP_DISABLE", true);
			// ステータス回復
			RecoverAll_();
			ChangeBattleParty_(34);
			break;
		//Sランク１回戦勝利後
		case GetFlagID_("CONST_SS_VC_JDG_FIRST_BATTLE_S"):										//Num9 = 6
			if(GetBattleEndType_() == BATTLE_END_TYPE_WIN){
				// デモ再生前にフィールドが映らないための対応
				SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				WaitFade_();
				// 進行フラグを進める
				SetNumFlg_("NUM_SCENARIO_SUB_SKY", GetFlagID_("CONST_SS_VC_PRE_SECOND_BATTLE_S"));	//Num9 = 7
				ChangeDemo_(620);//620[Sランク 1回戦勝利]
			} else {
				// デモ再生前にフィールドが映らないための対応
				SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				WaitFade_();
				// Sランク再戦フラグ
				SetEventFlg_("BFG_REMATCH_RANK_S", true);
				// フラグを戻す(後で変更すること)
				SetNumFlg_("NUM_SCENARIO_SUB_SKY", GetFlagID_("CONST_SS_SK_FIND_OUT_THE_S_DOOR"));	//Num9 = 4
				// 全滅時その場復帰Bitフラグを戻す
				SetEventFlg_("BFG_DEAD_KEEP_MAP", false);
				// 起き上がらないよフラグ
				SetEventFlg_("BFG_BATTLE_GETUP_DISABLE", false);
				// ステータス回復
				RecoverAll_();
				// 戻り座標をSランク扉前にする
				SetReturnDemoPosDir_(Vec3(0.0, 0.0, -850.0), 180);
				// 敗北デモ
				ChangeDemo_(622);
			}
			break;
		//Sランク２回戦開始
		case GetFlagID_("CONST_SS_VC_PRE_SECOND_BATTLE_S"):										//Num9 = 7
			SetNumFlg_("NUM_SCENARIO_SUB_SKY", GetFlagID_("CONST_SS_VC_JDG_SECOND_BATTLE_S"));		//Num9 = 8
			// 全滅時その場復帰Bitフラグ
			SetEventFlg_("BFG_DEAD_KEEP_MAP", true);
			// 起き上がらないよフラグ
			SetEventFlg_("BFG_BATTLE_GETUP_DISABLE", true);
			ChangeBattleParty_(35);
			break;
		//Sランク２回戦勝利後
		case GetFlagID_("CONST_SS_VC_JDG_SECOND_BATTLE_S"):										//Num9 = 8
			if(GetBattleEndType_() == BATTLE_END_TYPE_WIN){
				// デモ再生前にフィールドが映らないための対応
				SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				WaitFade_();
				// 進行フラグを進める
				SetNumFlg_("NUM_SCENARIO_SUB_SKY", GetFlagID_("CONST_SS_VC_PRE_THIRD_BATTLE_S"));	//Num9 = 9
				ChangeDemo_(621);//621[Sランク 2回戦勝利]
			} else {
				// デモ再生前にフィールドが映らないための対応
				SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				WaitFade_();
				// Sランク再戦フラグ
				SetEventFlg_("BFG_REMATCH_RANK_S", true);
				// フラグを戻す(後で変更すること)
				SetNumFlg_("NUM_SCENARIO_SUB_SKY", GetFlagID_("CONST_SS_SK_FIND_OUT_THE_S_DOOR"));	//Num9 = 4
				// 全滅時その場復帰Bitフラグを戻す
				SetEventFlg_("BFG_DEAD_KEEP_MAP", false);
				// 起き上がらないよフラグ
				SetEventFlg_("BFG_BATTLE_GETUP_DISABLE", false);
				// ステータス回復
				RecoverAll_();
				// 戻り座標をSランク扉前にする
				SetReturnDemoPosDir_(Vec3(0.0, 0.0, -850.0), 180);
				// 敗北デモ
				ChangeDemo_(622);
			}
			break;
		//Sランク３回戦開始
		case GetFlagID_("CONST_SS_VC_PRE_THIRD_BATTLE_S"):										//Num9 = 9
			SetNumFlg_("NUM_SCENARIO_SUB_SKY", GetFlagID_("CONST_SS_VC_JDG_THIRD_BATTLE_S"));		//Num9 = 10
			// 全滅時その場復帰Bitフラグ
			SetEventFlg_("BFG_DEAD_KEEP_MAP", true);
			// 起き上がらないよフラグ
			SetEventFlg_("BFG_BATTLE_GETUP_DISABLE", true);
			ChangeBattleParty_(36);
			break;
		//Sランク３回戦勝利後
		case GetFlagID_("CONST_SS_VC_JDG_THIRD_BATTLE_S"):										//Num9 = 10
			if(GetBattleEndType_() == BATTLE_END_TYPE_WIN){
				// デモ再生前にフィールドが映らないための対応
				SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				WaitFade_();
				// 進行フラグを進める
				SetNumFlg_("NUM_SCENARIO_SUB_SKY", GetFlagID_("CONST_SS_SK_GO_OUT_THE_COLOSSEUM_1"));	//Num9 = 11
				// 全滅時その場復帰Bitフラグを戻す
				SetEventFlg_("BFG_DEAD_KEEP_MAP", false);
				// 起き上がらないよフラグ
				SetEventFlg_("BFG_BATTLE_GETUP_DISABLE", false);
				// Sライドライセンスフラグ
				SetEventFlg_("BFG_RIDE_LICENSE_FLIGHT", true);
				// 旅の心得解放
				SetEventFlg_("BFG_TRAVEL_INFO_SHOW_011", true); // 旅の心得の項目解放フラグ【基本】高空ライド
				SetEventFlg_("BFG_TRAVEL_INFO_SHOW_066", true); // 旅の心得の項目解放フラグ【メニュー】ライドモンスター２
				// ステータス回復 ※α対応
				RecoverAll_();
				// 戻り座標をSランク扉前にする
				SetReturnDemoPosDir_(Vec3(0.0, 0.0, -850.0), 180);
				// Demo623[Sランクライセンス獲得①]
				ChangeDemo_(623);
			} else {
				// デモ再生前にフィールドが映らないための対応
				SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				WaitFade_();
				// Sランク再戦フラグ
				SetEventFlg_("BFG_REMATCH_RANK_S", true);
				// フラグを戻す(後で変更すること)
				SetNumFlg_("NUM_SCENARIO_SUB_SKY", GetFlagID_("CONST_SS_SK_FIND_OUT_THE_S_DOOR"));	//Num9 = 4
				// 全滅時その場復帰Bitフラグを戻す
				SetEventFlg_("BFG_DEAD_KEEP_MAP", false);
				// 起き上がらないよフラグ
				SetEventFlg_("BFG_BATTLE_GETUP_DISABLE", false);
				// ステータス回復
				RecoverAll_();
				// 戻り座標をSランク扉前にする
				SetReturnDemoPosDir_(Vec3(0.0, 0.0, -850.0), 180);
				// 敗北デモ
				ChangeDemo_(622);
			}
			break;
		}
	}

	EventEnd_();
}

//-------------------- イベント地雷 --------------------
//起動条件：マップに配置したメッシュに触れたとき
//-------------------- イベント地雷 --------------------
function TouchEventMine(){
	// フラグを取得する
	local main_num 			= GetNumFlg_("NUM_SCENARIO_MAIN");
	local green_event_num 	= GetNumFlg_("NUM_SCENARIO_SUB_GREEN");
	local ice_event_num 	= GetNumFlg_("NUM_SCENARIO_SUB_ICE");
	local volcano_event_num = GetNumFlg_("NUM_SCENARIO_SUB_VOLCANO");
	local sky_num 			= GetNumFlg_("NUM_SCENARIO_SUB_SKY");
	local bit_freebattle	= GetEventFlg_("BFG_FREE_BATTLE_UNLOCK");		// Bit_59 トレーニングバトルの解放
	local bit_race			= GetEventFlg_("BFG_RACE_UNLOCK");				// Bit_57 レースの解放
	// Ｃランク再戦フラグ
	local rematch_bit = false;
	rematch_bit = GetEventFlg_("BFG_REMATCH_RANK_C");
	// Bランク再戦フラグ
	local rematch_bit_02 = false;
	rematch_bit_02 = GetEventFlg_("BFG_REMATCH_RANK_B");
	// Aランク再戦フラグ
	local rematch_bit_03 = false;
	rematch_bit_03 = GetEventFlg_("BFG_REMATCH_RANK_A");
	// Sランク再戦フラグ
	local rematch_bit_04 = false;
	rematch_bit_04 = GetEventFlg_("BFG_REMATCH_RANK_S");	//仮で使用

	local target = GetTouchEventMineId_();
	local player = GetPlayerId_();

	// Cコロシアム出口
	if(target == g_exit_c){
		// 主人公を出口に向ける
		CommPlayerTurnAroundObj(g_monolith_c);
		//Cランククリアの状態の時にライド設定チェックを入れて、設定していない場合は拒否。
		if(main_num == GetFlagID_("CONST_SM_GRASSLAND")
		&& green_event_num == GetFlagID_("CONST_SS_GR_GET_RIDE_SKILL_JUMP")){
			//モノリスの鍵を取得しているかどうか？
			if(uCheckAndUseMonolithKey(true) == false){
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_TEREZIA");
				ShowMsg_("RIDE_TUT_EVENT_002_02");
				KeyInputWait_();
				CloseMsgWnd_();
			}
			else{
				//地雷削除
				DeleteEventMine_(g_exit_c);
				// ライドチュートリアル終了なので通信とセーブを使用可能に戻す(SQEXRedmine 2次DB #3888)
				uBanSave(false);
				// モノリスの再起動アニメを再生(EventCommon)
				MonolithAnime(g_monolith_c, "BFG_DUMMY_FIELDRIDE_TUTORIAL", "obj_C_monolith", true);
				// トレーニングバトル解放の為の設定
				SetEventFlg_("BFG_FREE_BATTLE_C", true);
				// ウッドパークへ
				ChangeMapPosDir_("H01_00", Vec3(-85.0, 63.5, 0.0), 90);
			}
		}
		else{
			//地雷削除
			DeleteEventMine_(g_exit_c);
			// モノリスのアニメを再生(EventCommon)
			MonolithAnime(g_monolith_c, "BFG_START_C_MONOLITH", "obj_C_monolith");
			// ウッドパークへ
			ChangeMapPosDir_("H01_00", Vec3(-85.0, 63.5, 0.0), 90);
		}
	}
	// Bコロシアム出口
	if(target == g_exit_b){
		// 主人公を出口に向ける
		CommPlayerTurnAroundObj(g_monolith_b);
		// Bランククリアの状態の時にライド設定チェックを入れて、設定していない場合は拒否。
		local change_map_name = "I00_00";
		local change_map_pos  = Vec3(-1803.0, 877.8, -1064.2);
		local change_map_dir  = 3;
		if(GetEventFlg_("BFG_DUMMY_AQUA_RIDE_TUTORIAL") == false){
			if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")
			&& ice_event_num == GetFlagID_("CONST_SS_IF_GO_TO_THE_EAST_ICE_PARK")){
				//モノリスの鍵を取得しているかどうか？
				if(uCheckAndUseMonolithKey(true) == false){
					uCheckMonsterTypeAndAddFellow(main_num);
					OpenMsgWnd_();
					SetTalkName_("NAME_TAG_TEREZIA");
					ShowMsg_("RIDE_TUT_EVENT_102_02");
					KeyInputWait_();
					CloseMsgWnd_();
				}
				else{
					//地雷削除
					DeleteEventMine_(g_exit_b);
					// ライドチュートリアル終了なので通信とセーブを使用可能に戻す(SQEXRedmine 2次DB #3888)
					uBanSave(false);
					// トレーニングバトル解放の為の設定
					SetEventFlg_("BFG_FREE_BATTLE_B", true);
					// モノリスのアニメを再生(擬似デモ[テレジアの含み])
					uMonolithOn(g_monolith_b, "obj_B_monolith");
					SetEventFlg_("BFG_PLAYING_TEREZIA_DEMO", true);
					ChangeMapPosDir_("O01_00", Vec3(1283.0, 10.0, 0.0), 90);
				}
			}
			else{
				//地雷削除
				DeleteEventMine_(g_exit_b);
				// モノリスのアニメを再生
				MonolithAnime(g_monolith_b, "BFG_START_B_MONOLITH", "obj_B_monolith");
				ChangeMapPosDir_(change_map_name, change_map_pos, change_map_dir);
			}
		}
		else{
			//地雷削除
			DeleteEventMine_(g_exit_b);
			// モノリスのアニメを再生
			MonolithAnime(g_monolith_b, "BFG_START_B_MONOLITH", "obj_B_monolith");
			ChangeMapPosDir_(change_map_name, change_map_pos, change_map_dir);
		}
	}
	// Aコロシアム出口
	if(target == g_exit_a){
		// 主人公を出口に向ける
		CommPlayerTurnAroundObj(g_monolith_a);
		// Ａランクのモノリスのカギ取得イベント中
		if(main_num == GetFlagID_("CONST_SM_VOLCANO")
		&& volcano_event_num == GetFlagID_("CONST_SS_VC_PRE_SECRET_BASE_DEMO")){
			//モノリスの鍵を取得しているかどうか？
			if(uCheckAndUseMonolithKey(true) == false){
				uCheckMonsterTypeAndAddFellow(main_num);
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_TEREZIA");
				ShowMsg_("RIDE_TUT_EVENT_202_02");
				KeyInputWait_();
				CloseMsgWnd_();
			}
			else{
				// 地雷削除
				DeleteEventMine_(g_exit_a);
				// ライドチュートリアル終了なので通信とセーブを使用可能に戻す(SQEXRedmine 2次DB #3888)
				uBanSave(false);
				// シナリオ進行フラグを進める
				SetNumFlg_("NUM_SCENARIO_SUB_VOLCANO", GetFlagID_("CONST_SS_VC_PRE_HELP_GIRL_DEMO"));
				// モノリスを起動
				uMonolithOn(g_monolith_a, "obj_A_monolith");
				// 出口解放メッセージ
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_TEREZIA");
				ShowMsg_("RIDE_TUT_EVENT_006");
				KeyInputWait_();
				CloseMsgWnd_();
				// Demo515[Ａランクライセンス獲得 秘密基地]の再生
				ChangeDemo_(515);
			}
		}
		// Demo516[Ａランクライセンス獲得　テレジア]の再生後
		else if(main_num == GetFlagID_("CONST_SM_VOLCANO")
		&& volcano_event_num == GetFlagID_("CONST_SS_HV_GO_BACK_THE_VOLCANO")){
			//地雷削除
			DeleteEventMine_(g_exit_a);
			// トレーニングバトル解放の為の設定
			SetEventFlg_("BFG_FREE_BATTLE_A", true);
			// ルーラ禁止を解除
			SetEventFlg_("BFG_PLAYERABILITY_RULER_PROHIBIT", false);
			// シナリオ進行フラグを進める
			SetNumFlg_("NUM_SCENARIO_SUB_VOLCANO", GetFlagID_("CONST_SS_HV_GO_BACK_THE_VOLCANO"));
			// 主人公を消す処理
			LoadEffect_("ef732_07_teleport_monolith");	//モノリス転送エフェクト
			PlaySE_("SE_DEM_017");						// ＳＥ再生
			local effectId = SetSelectBoneEffect_("ef732_07_teleport_monolith", player, ATTACH_GLOBAL);
			Wait_(1);
			// 主人公の姿を段々と消していく
			local alpha_def = 1.0; // α値の設定
			SetManualCalcAlpha_(player, true);
			for(alpha_def = 1.0; alpha_def >= 0.0; alpha_def = alpha_def - 0.1){
				SetAlpha_(player, alpha_def);
				Wait_(1);
			}
			SetAlpha_(player, 0.0);
			// 間を持たせる
			Wait_(30);
			// 暗転させる(主人公が消えたままにならないようにここで暗転させてα値を元に戻す)
			SetFade_(FADE_OUT, FADE_COLOR_BLACK, 15);
			SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, 15);
			WaitFade_();
			// 主人公のα値を元に戻す
			SetAlpha_(player, 1.0);
			// 焦熱の火山へ
			ChangeMap_("V00_00");
		}
		// 上記のイベント以外の対応
		else{
			//地雷削除
			DeleteEventMine_(g_exit_a);
			// モノリスのアニメを再生(EventCommon)
			MonolithAnime(g_monolith_a, "BFG_START_A_MONOLITH", "obj_A_monolith");
			ChangeMapPosDir_("V00_00", Vec3(-305.0, 1292.0, -796.0), -20);
		}
	}
	// Sコロシアム出口
	if(target == g_exit_s){
		// 主人公を出口に向ける
		CommPlayerTurnAroundObj(g_monolith_s);
		// モノリスのアニメを再生(EventCommon)
		MonolithAnime(g_monolith_s, "BFG_START_S_MONOLITH", "obj_S_monolith");
		ChangeMapPosDir_("H02_00", Vec3(20.0, 0.0, -4.5), -50);
		// Ｓランクライセンスを取得してコロシアムから出るタイミング
		if(main_num == GetFlagID_("CONST_SM_SKY")){
			if(sky_num >= GetFlagID_("CONST_SS_SK_GO_OUT_THE_COLOSSEUM_2")){			// Num9 = 99
				// トレーニングバトル解放の為の設定
				SetEventFlg_("BFG_FREE_BATTLE_S", true);
			}
		}
	}

	// DEMO022[Cランク試験]終了後
	if(main_num == 1 && green_event_num == GetFlagID_("CONST_SS_VC_TRY_RANK_C")){
		// Ｃランク戦の扉を調べた時
		if(target==g_mine_door_c){
			// 主人公をＣランク戦の扉に向ける
			CommPlayerTurnAroundDir(180);
			// 初挑戦時(後でif文内を関数化する)
			if(rematch_bit == false){
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_TEREZIA");
				ShowMsg_("DEMO_019_AFT_TLG_001");
				KeyInputWait_();
				if(GetQueryResult_() == MES_QUERY_YES)
				{
					// 仲間が2体以上
					if(GetOwnerMonsterNum_() >= 2){
						// Ｃランクのライセンス試験開始メッセージ
						ShowMsg_("DEMO_019_AFT_TLG_002");
						KeyInputWait_();
						ShowMsg_("DEMO_019_AFT_TLG_002_2");
						KeyInputWait_();
						CloseMsgWnd_();

						// サブフラグを進行
						SetNumFlg_("NUM_SCENARIO_SUB_GREEN", GetFlagID_("CONST_SS_VC_START_RANK_C"));

						// Demo024[戦闘ライドチュートリアル後]が再生される
						SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);
						SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, 30);
						WaitFade_();
						DebugPrint("デモ24再生");
						ChangeDemo_(24);
					}
					// 仲間が1体の時はランク戦は開始されない
					else{
						ShowMsg_("DEMO_019_AFT_TLG_WARNING_001");
						KeyInputWait_();
						CloseMsgWnd_();
					}
				}
				else
				{
					ShowMsg_("DEMO_019_AFT_TLG_003");
					KeyInputWait_();
					CloseMsgWnd_();
				}
			}
			// ２回目以降の再挑戦の時
			else{
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_TEREZIA");
				ShowMsg_("DEMO_019_AFT_TLG_004");
				KeyInputWait_();
				if(GetQueryResult_() == MES_QUERY_YES)
				{
					// 仲間が2体以上
					if(GetOwnerMonsterNum_() >= 2){
						// Ｃランクのライセンス再試験開始メッセージ
						ShowMsg_("DEMO_019_AFT_TLG_005");
						KeyInputWait_();
						CloseMsgWnd_();

						// サブフラグを進行
						SetNumFlg_("NUM_SCENARIO_SUB_GREEN", GetFlagID_("CONST_SS_VC_START_RANK_C"));

						// Demo024[戦闘ライドチュートリアル後]が再生される
						SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);
						SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, 30);
						WaitFade_();
						DebugPrint("デモ24再生");
						ChangeDemo_(24);
					}
					// 仲間が1体の時はランク戦は開始されない
					else{
						ShowMsg_("DEMO_019_AFT_TLG_WARNING_001");
						KeyInputWait_();
						CloseMsgWnd_();
					}
				}
				else
				{
					ShowMsg_("DEMO_019_AFT_TLG_006");
					KeyInputWait_();
					CloseMsgWnd_();
				}
			}
		}
	}
	// Ｃランクライセンス合格後
	if(main_num == 1 && green_event_num >= GetFlagID_("CONST_SS_VC_GET_LICENSE_RANK_C")
	|| main_num >= 2){
		// Ｃランク戦の扉を調べた時
		if(target==g_mine_door_c){
			// 主人公をＣランク戦の扉に向ける
			CommPlayerTurnAroundDir(180);
			if(main_num == GetFlagID_("CONST_SM_GRASSLAND")
			&& green_event_num == GetFlagID_("CONST_SS_GR_GET_RIDE_SKILL_JUMP")){
				if(uCheckAndUseMonolithKey() == false){
						CommonMessageT("RIDE_TUT_EVENT_002_01", "NAME_TAG_TEREZIA");
				}
				else{
					CommonMessageT("DEMO_019_AFT_TLG_009", "NAME_TAG_TEREZIA");
				}
			}
			else{
				CommonMessageT("DEMO_019_AFT_TLG_009", "NAME_TAG_TEREZIA");
				//uFreeBattleOn("BFG_FREE_BATTLE_C");
			}
		}
	}

	// Bランク試験（Demo304[Bランク試験]再生後
	if(main_num == 4 && ice_event_num == GetFlagID_("CONST_SS_VC_TRY_RANK_B")){
		// Bランク戦の扉を調べた時
		if(target==g_mine_door_b){
			// 主人公をＢランク戦の扉に向ける
			CommPlayerTurnAroundDir(-90);
			if(rematch_bit_02 == false){
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_TEREZIA");
				ShowMsg_("DEMO_304_AFT_TLG_001");
				KeyInputWait_();
				if(GetQueryResult_() == MES_QUERY_YES)
				{
					// Bランクのライセンス試験開始メッセージ
					ShowMsg_("DEMO_304_AFT_TLG_002");
					KeyInputWait_();
					CloseMsgWnd_();

					SetNumFlg_("NUM_SCENARIO_SUB_ICE", GetFlagID_("CONST_SS_VC_PRE_FIRST_BATTLE_B"));

					// Demo305[Bランク戦 開始前（1回戦開始）]が再生される
					SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);
					SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, 30);
					WaitFade_();
					ChangeDemo_(305);
				}
				else
				{
					ShowMsg_("DEMO_304_AFT_TLG_003");
					KeyInputWait_();
					CloseMsgWnd_();
				}
			}
			// ２回目以降の再挑戦の時
			else{
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_TEREZIA");
				ShowMsg_("DEMO_304_AFT_TLG_004");
				KeyInputWait_();
				if(GetQueryResult_() == MES_QUERY_YES)
				{
					// Bランクのライセンス再試験開始メッセージ
					ShowMsg_("DEMO_304_AFT_TLG_005");
					KeyInputWait_();
					CloseMsgWnd_();

					SetNumFlg_("NUM_SCENARIO_SUB_ICE", GetFlagID_("CONST_SS_VC_PRE_FIRST_BATTLE_B"));

					// Demo305[Bランク戦 開始前（1回戦開始）]が再生される
					SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);
					SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, 30);
					WaitFade_();
					ChangeDemo_(305);
				}
				else
				{
					ShowMsg_("DEMO_304_AFT_TLG_006");
					KeyInputWait_();
					CloseMsgWnd_();
				}
			}
		}
	}
	// Bランクライセンス合格後
	if(main_num == 4 && ice_event_num >= GetFlagID_("CONST_SS_IF_GO_TO_THE_EAST_ICE_PARK")
	|| main_num >= 5){
		// Bランク戦の扉を調べた時
		if(target==g_mine_door_b){
			// 主人公をBランク戦の扉に向ける
			CommPlayerTurnAroundDir(-90);
			// ランクライセンス取得後に扉を調べた時のメッセージ
			if(GetEventFlg_("BFG_DUMMY_AQUA_RIDE_TUTORIAL") == false){
				if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")
				&& ice_event_num == GetFlagID_("CONST_SS_IF_GO_TO_THE_EAST_ICE_PARK")){
					// 預り所の空き枠チェック
					local residue = GetFreeMonsterNum_();
					DebugPrint("モンスターの所持枠の空き数は " + residue + " 体です");
					if(residue > 0){
						SetEventFlg_("BFG_CHECK_EMPTY_MONSTER", false);
					}
					else{
						SetEventFlg_("BFG_CHECK_EMPTY_MONSTER", true);
					}

					// チュートリアルライドを行うときに預り所に空き枠があるかチェック
					if(GetEventFlg_("BFG_CHECK_EMPTY_MONSTER") == false){
						if(uCheckAndUseMonolithKey() == false){
							uCheckMonsterTypeAndAddFellow(main_num);
							CommonMessageT("RIDE_TUT_EVENT_102_01", "NAME_TAG_TEREZIA");
						}
						else{
							CommonMessageT("DEMO_311_AFT_TLG_001", "NAME_TAG_TEREZIA");
						}
					}
					else{
						uCheckMonsterTypeAndAddFellow(main_num);
					}
				}
				else{
					CommonMessageT("DEMO_311_AFT_TLG_001", "NAME_TAG_TEREZIA");
					//uFreeBattleOn("BFG_FREE_BATTLE_B");
				}
			}
			else{
				CommonMessageT("DEMO_311_AFT_TLG_001", "NAME_TAG_TEREZIA");
				//uFreeBattleOn("BFG_FREE_BATTLE_B");
			}
		}
	}
	
	// Aランク試験（Demo507[Aランク試験]再生後
	if(main_num == 6 && volcano_event_num == GetFlagID_("CONST_SS_VC_FIND_OUT_THE_A_DOOR")){
		// Aランク戦の扉を調べた時
		if(target==g_mine_door_a){
			// 主人公をAランク戦の扉に向ける
			CommPlayerTurnAroundDir(90);
			if(rematch_bit_03 == false){
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_TEREZIA");
				ShowMsg_("DEMO_507_AFT_TLG_001");
				KeyInputWait_();
				if(GetQueryResult_() == MES_QUERY_YES)
				{
					// Aランクのライセンス試験開始メッセージ
					ShowMsg_("DEMO_507_AFT_TLG_002");
					KeyInputWait_();
					CloseMsgWnd_();
					SetNumFlg_("NUM_SCENARIO_SUB_VOLCANO", GetFlagID_("CONST_SS_VC_PRE_FIRST_BATTLE_A"));

					// Demo507[Aランク戦 開始前（1回戦開始）]が再生される
					SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);
					SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, 30);
					WaitFade_();
					ChangeDemo_(508);
				}
				else
				{
					ShowMsg_("DEMO_507_AFT_TLG_003");
					KeyInputWait_();
					CloseMsgWnd_();
				}
			}
			// ２回目以降の再挑戦の時
			else{
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_TEREZIA");
				ShowMsg_("DEMO_507_AFT_TLG_004");
				KeyInputWait_();
				if(GetQueryResult_() == MES_QUERY_YES)
				{
					// Aランクのライセンス再試験開始メッセージ
					ShowMsg_("DEMO_507_AFT_TLG_005");
					KeyInputWait_();
					CloseMsgWnd_();
					SetNumFlg_("NUM_SCENARIO_SUB_VOLCANO", GetFlagID_("CONST_SS_VC_PRE_FIRST_BATTLE_A"));

					// Demo305[Aランク戦 開始前（1回戦開始）]が再生される
					SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);
					SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, 30);
					WaitFade_();
					ChangeDemo_(508);
				}
				else
				{
					ShowMsg_("DEMO_507_AFT_TLG_006");
					KeyInputWait_();
					CloseMsgWnd_();
				}
			}
		}
	}
	// Aランクライセンス合格後
	if(main_num == 6 && volcano_event_num >= GetFlagID_("CONST_SS_VC_PRE_SECRET_BASE_DEMO")
	|| main_num >= 7){
		// Aランク戦の扉を調べた時
		if(target==g_mine_door_a){
			// 主人公をAランク戦の扉に向ける
			CommPlayerTurnAroundDir(90);
			if(main_num == GetFlagID_("CONST_SM_VOLCANO")
			&& volcano_event_num == GetFlagID_("CONST_SS_VC_PRE_SECRET_BASE_DEMO")){
				// 空き枠チェック
				local residue = GetFreeMonsterNum_();
				if(residue > 0){
					SetEventFlg_("BFG_CHECK_EMPTY_MONSTER", false);
				}
				else{
					SetEventFlg_("BFG_CHECK_EMPTY_MONSTER", true);
				}

				// チュートリアルライドを行うときに預り所に空き枠があるかイベント
				if(GetEventFlg_("BFG_CHECK_EMPTY_MONSTER") == false){
					if(uCheckAndUseMonolithKey() == false){
						uCheckMonsterTypeAndAddFellow(main_num);
						CommonMessageT("RIDE_TUT_EVENT_202_01", "NAME_TAG_TEREZIA");
					}
					else{
						CommonMessageT("DEMO_516_AFT_TLG_001", "NAME_TAG_TEREZIA");
					}
				}
				else{
					uCheckMonsterTypeAndAddFellow(main_num);
				}
			}
			else{
				CommonMessageT("DEMO_516_AFT_TLG_001", "NAME_TAG_TEREZIA");
				//uFreeBattleOn("BFG_FREE_BATTLE_A");
			}
		}
	}

	// Sランク試験 Demo618[最後のパワー]再生後
	if(main_num == 8 && sky_num == GetFlagID_("CONST_SS_SK_FIND_OUT_THE_S_DOOR")){						// Num9 = 4
		// Sランク戦の扉を調べた時
		if(target==g_mine_door_s){
			// 主人公をSランク戦の扉に向ける
			CommPlayerTurnAroundDir(0);
			if(rematch_bit_04 == false){
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_TEREZIA");
				ShowMsg_("DEMO_619_AFT_TLG_001");
				KeyInputWait_();
				if(GetQueryResult_() == MES_QUERY_YES)
				{
					// Sランクのライセンス試験開始メッセージ
					ShowMsg_("DEMO_619_AFT_TLG_002");
					KeyInputWait_();
					CloseMsgWnd_();
					SetNumFlg_("NUM_SCENARIO_SUB_SKY", GetFlagID_("CONST_SS_VC_PRE_FIRST_BATTLE_S"));	// Num9 = 5

					// Demo619[Sランク戦闘前（1回戦開始）]が再生される
					SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);
					SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, 30);
					WaitFade_();
					ChangeDemo_(619);
				}
				else
				{
					ShowMsg_("DEMO_619_AFT_TLG_003");
					KeyInputWait_();
					CloseMsgWnd_();
				}
			}
			// ２回目以降の再挑戦の時
			else{
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_TEREZIA");
				ShowMsg_("DEMO_619_AFT_TLG_004");
				KeyInputWait_();
				if(GetQueryResult_() == MES_QUERY_YES)
				{
					// Sランクのライセンス再試験開始メッセージ
					ShowMsg_("DEMO_619_AFT_TLG_005");
					KeyInputWait_();
					CloseMsgWnd_();
					SetNumFlg_("NUM_SCENARIO_SUB_SKY", GetFlagID_("CONST_SS_VC_PRE_FIRST_BATTLE_S"));	// Num9 = 5

					// Demo619[Sランク戦闘前（1回戦開始）]が再生される
					SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);
					SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, 30);
					WaitFade_();
					ChangeDemo_(619);
				}
				else
				{
					ShowMsg_("DEMO_619_AFT_TLG_006");
					KeyInputWait_();
					CloseMsgWnd_();
				}
			}
		}
	}
	// Sランクライセンス合格後
	if(main_num == 8 && sky_num >= GetFlagID_("CONST_SS_SK_GO_OUT_THE_COLOSSEUM_1")		// Num9 = 11
	|| main_num >= 9){																	// Num0 = 9 以上
		// Sランク戦の扉を調べた時
		if(target==g_mine_door_s){
			// 主人公をSランク戦の扉に向ける
			CommPlayerTurnAroundDir(0);
			CommonMessageT("DEMO_623_AFT_TLG_001", "NAME_TAG_TEREZIA");
			//uFreeBattleOn("BFG_FREE_BATTLE_S");
		}
	}

	// モノリスのかぎ(仮)
	if(target == mine_key){
		CommPlayerTurnAroundObj(reactorPoint09);
		uGetMonolithKeyEvent(mine_key, reactorPoint09, g_key, exclamation02);
		SetEventFlg_("BFG_GET_C_RANK_MONOLITH_KEY", true);
	}
	if(target == mine_key_b){
		CommPlayerTurnAroundObj(reactorPoint10);
		uGetMonolithKeyEvent(mine_key_b, reactorPoint10, g_key_b, exclamation04);
		SetEventFlg_("BFG_GET_B_RANK_MONOLITH_KEY", true);
	}
	if(target == mine_key_a){
		CommPlayerTurnAroundObj(reactorPoint11);
		uGetMonolithKeyEvent(mine_key_a, reactorPoint11, g_key_a, exclamation06);
		SetEventFlg_("BFG_GET_A_RANK_MONOLITH_KEY", true);
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
	if(target == g_npc_renate){
		SetRideTalkCamOffset(OFFSET_RENATE);
	}

	EventEnd_();
}

//------------------------------------------------
//		ＮＰＣ接触時
//------------------------------------------------
function TouchNpc()
{
	local main_num 			= GetNumFlg_("NUM_SCENARIO_MAIN");
	local sky_num 			= GetNumFlg_("NUM_SCENARIO_SUB_SKY");
	
	local target = GetTargetId_();
	
	DebugPrint(" ");
	DebugPrint("ID: " + target + " に接触 [TouchNpc]");
	
	switch (target) {
	case g_npc_renate :
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_RENERTE");
			ShowMsg_("DEMO_619_AFT_RENERTE_001");		// 「（仮）Sランクを　クリアできれば
			KeyInputWait_();
			CloseMsgWnd_();
		break;
	default :
		DebugPrint("WARNING : NPC_IDが不正です [TouchNpc]");
		break;
	}
	
	
	EventEnd_();
}

//-------------------- 初期化 --------------------
// 起動条件：モンスターライド時
// (モンスターライド時に行う為のイベントブロック)
//-------------------- 初期化 --------------------
function RideOn()
{
// メインシナリオ用のフラグ-----------------------------------------
	// フラグを取得する
	local main_num 			= GetNumFlg_("NUM_SCENARIO_MAIN");
	local green_event_num 	= GetNumFlg_("NUM_SCENARIO_SUB_GREEN");
	local ice_event_num 	= GetNumFlg_("NUM_SCENARIO_SUB_ICE");
	local volcano_event_num = GetNumFlg_("NUM_SCENARIO_SUB_VOLCANO");

	// ライド中のモンスタータイプを取得
	local ride_type = GetRideMonsterType_();

	// Cランク試験クリア後
	if(main_num == GetFlagID_("CONST_SM_GRASSLAND")
	&& green_event_num == GetFlagID_("CONST_SS_GR_GET_RIDE_SKILL_JUMP")){
		uAfterRideTutorialMessage();
	}
	// Bランク試験クリア後
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")
	&& ice_event_num == GetFlagID_("CONST_SS_IF_GO_TO_THE_EAST_ICE_PARK")){
		if(GetEventFlg_("BFG_DUMMY_AQUA_RIDE_TUTORIAL") == false){
			if(ride_type == MONSTER_TYPE.AQUA){
				uAfterRideTutorialMessage();
			}
		}
	}
	// Aランク試験クリア後
	if(main_num == GetFlagID_("CONST_SM_VOLCANO")
	&& volcano_event_num == GetFlagID_("CONST_SS_VC_PRE_SECRET_BASE_DEMO")){
		if(ride_type == MONSTER_TYPE.AERO){
			uAfterRideTutorialMessage();
		}
	}

	EventEnd_();
}

//++++++++++++++++++++++++++++++++++++++++++++
//  メッセージの表示関数(名前表示なし)
//--------------------------------------------
// 第一引数 : 表示するメッセージ
// 戻り値   : なし
//++++++++++++++++++++++++++++++++++++++++++++
function CommonMessage(message_key)
{
	OpenMsgWnd_();
	ShowMsg_(message_key);
	KeyInputWait_();
	CloseMsgWnd_();
}

//++++++++++++++++++++++++++++++++++++++++++++
//  メッセージの表示関数(名前表示あり)
//--------------------------------------------
// 第一引数 : 表示するメッセージ
// 第二引数 : 名前タグ
// 戻り値   : なし
//++++++++++++++++++++++++++++++++++++++++++++
function CommonMessageT(message_key, name_tag)
{
	OpenMsgWnd_();
	SetTalkName_(name_tag);
	ShowMsg_(message_key);
	KeyInputWait_();
	CloseMsgWnd_();
}

//++++++++++++++++++++++++++++++++++++++++++++
//  アイテム取得 モノリスのかぎ(仮)
//--------------------------------------------
// 引数   : アイテム地雷、リアクターポイント, 配置したエフェクト、NaviMapIconのID
// 戻り値 : なし
//++++++++++++++++++++++++++++++++++++++++++++
function uGetMonolithKeyEvent(mine_id, r_point, ef_key, icon_id)
{
	OpenMsgWnd_();
	ShowMsg_("RIDE_TUT_EVENT_003");
	PlayMe_("ME_010");	// 重要アイテム入手ME
	WaitMe_();
	KeyInputWait_();
	CloseMsgWnd_();

	AddItem_(99, 1);	// アイテム取得 モノリスのかぎ(仮)

	// アイテム地雷、リアクターポイント, 配置したエフェクトの削除
	DeleteEventMine_(mine_id);
	SetActive_(r_point, false);
	DeleteEffect_(ef_key);
	SetNaviMapIconVisible_(icon_id, false);

	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TEREZIA");
	ShowMsg_("RIDE_TUT_EVENT_003_02");
	KeyInputWait_();
	CloseMsgWnd_();
}

//++++++++++++++++++++++++++++++++++++++++++++
//  ライセンス取得後のメッセージ
//--------------------------------------------
// 引数   : 削除する地雷、リアクターポイント, 配置したエフェクト
// 戻り値 : なし
//++++++++++++++++++++++++++++++++++++++++++++
function uReturnVCMessage()
{
	local main_num = GetNumFlg_("NUM_SCENARIO_MAIN");

	Wait_(15);
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TEREZIA");
	switch(main_num)
	{
	// 陸ライド
	case GetFlagID_("CONST_SM_GRASSLAND"):
		ShowMsg_("RIDE_TUT_EVENT_001");
		break;
	// 水ライド
	case GetFlagID_("CONST_SM_ICE_FIELD"):
		ShowMsg_("RIDE_TUT_EVENT_101");
		break;
	// 空ライド
	case GetFlagID_("CONST_SM_VOLCANO"):
		ShowMsg_("RIDE_TUT_EVENT_201");
		break;
	default:
		DebugPrint("対応する main_num はありません");
		break;
	}
	KeyInputWait_();
	CloseMsgWnd_();
}

//++++++++++++++++++++++++++++++++++++++++++++
//  モノリスのかぎ(仮)を取得しているかチェック
//--------------------------------------------
// 引数   : true -> かぎを減らす、false -> かぎを減らさない
// 戻り値 : アイテムある→true、アイテムなし→false
//++++++++++++++++++++++++++++++++++++++++++++
function uCheckAndUseMonolithKey(flg = false)
{
	local get_num = GetItemNum_(99);

	if(get_num >= 1){
		if(flg == true){
			AddItem_(99, -1);
		}
		return true;
	}
	else{
		return false;
	}
}

//++++++++++++++++++++++++++++++++++++++++++++
// ランク戦終了後に表示するメッセージ
//--------------------------------------------
// 引数   : なし
// 戻り値 : なし
//++++++++++++++++++++++++++++++++++++++++++++
function uRideTutorialMessage()
{
	local main_num = GetNumFlg_("NUM_SCENARIO_MAIN");
	local aqua = IsRideTypeMonster_(MONSTER_TYPE.AQUA);
	local aero = IsRideTypeMonster_(MONSTER_TYPE.AERO);

	// ランク戦終了後に表示するメッセージ
	if(GetEventFlg_("BFG_DISPLAY_RIDE_TUTORIAL_MESSAGE") == true){
		SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
		WaitFadeSub_();
		// ライドのチュートリアルメッセージを表示する
		uReturnVCMessage();
		// Ａランク・Ｂランクでのみ使用
		uCheckMonsterTypeAndAddFellow(main_num);
		
		// uCheckMonsterTypeAndAddFellow()を通る前に対応するモンスターがいれば
		// 暗転明け処理を追加(預り所がいっぱいの時は通らない)
		if(main_num == GetFlagID_("CONST_SM_GRASSLAND")){
			uNotFellowCaseFade();
		}
		else if(aqua == true && main_num == GetFlagID_("CONST_SM_ICE_FIELD")){
			uNotFellowCaseFade();
		}
		else if(aero == true && main_num == GetFlagID_("CONST_SM_VOLCANO")){
			uNotFellowCaseFade();
		}
		// 再び表示されないようにフラグを戻す
		SetEventFlg_("BFG_DISPLAY_RIDE_TUTORIAL_MESSAGE", false);
	}
}

//++++++++++++++++++++++++++++++++++++++++++++
// ライドしたら表示するメッセージ
//--------------------------------------------
// 引数   : なし
// 戻り値 : なし
//++++++++++++++++++++++++++++++++++++++++++++
function uAfterRideTutorialMessage()
{
	local main_num = GetNumFlg_("NUM_SCENARIO_MAIN");

	if(GetEventFlg_("BFG_DISPLAY_AFTER_RIDE_TUTORIAL_MSG") == true){
		// ライド中にメッセージが表示されないようにする
		Wait_(15);
		// ライド後のチュートリアルメッセージを表示する
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_TEREZIA");
		switch(main_num)
		{
		// 陸ライド
		case GetFlagID_("CONST_SM_GRASSLAND"):
			ShowMsg_("RIDE_TUT_EVENT_001_02");
			break;
		// 水ライド
		case GetFlagID_("CONST_SM_ICE_FIELD"):
			ShowMsg_("RIDE_TUT_EVENT_101_03");
			break;
		// 空ライド
		case GetFlagID_("CONST_SM_VOLCANO"):
			ShowMsg_("RIDE_TUT_EVENT_201_03");
			break;
		default:
			break;
		}
		KeyInputWait_();
		CloseMsgWnd_();
		SetEventFlg_("BFG_DISPLAY_AFTER_RIDE_TUTORIAL_MSG", false);
	}
}

//++++++++++++++++++++++++++++++++++++++++++++
// イレギュラー操作して対応するライドモンスターがいなくなった時のメッセージ表示
//--------------------------------------------
// 引数   : なし
// 戻り値 : なし
//++++++++++++++++++++++++++++++++++++++++++++
function uRideTutorialErrorMessage()
{
	local main_num = GetNumFlg_("NUM_SCENARIO_MAIN");

	// ライド中にメッセージが表示されないようにする
	Wait_(15);
	// 対応するライドモンスターがいなくなった時のメッセージ表示する
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TEREZIA");
	switch(main_num)
	{
	// 陸ライド
	case GetFlagID_("CONST_SM_GRASSLAND"):
		ShowMsg_("NOT_EMPTY_MSG_002");
		break;
	// 水ライド
	case GetFlagID_("CONST_SM_ICE_FIELD"):
		ShowMsg_("NOT_EMPTY_MSG_002");
		break;
	// 空ライド
	case GetFlagID_("CONST_SM_VOLCANO"):
		ShowMsg_("NOT_EMPTY_MSG_002");
		break;
	default:
		break;
	}
	KeyInputWait_();
	CloseMsgWnd_();
}

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++
// 所持している全モンスターから指定したモンスタータイプの
// 仲間がいるかをチェックしていなければ加入させる関数
//-------------------------------------------------------
// 引数   : メインのシナリオフラグの進行状態を格納した変数
// 戻り値 : なし
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++
function uCheckMonsterTypeAndAddFellow(main_num)
{
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")
	|| main_num == GetFlagID_("CONST_SM_VOLCANO")){
		// 対応するタイプのモンスターがいるのかチェック(Redmine#1154)
		local residue = GetFreeMonsterNum_();
		local aqua = IsRideTypeMonster_(MONSTER_TYPE.AQUA);
		local aero = IsRideTypeMonster_(MONSTER_TYPE.AERO);
		DebugPrint("モンスターの所持枠の空き数は " + residue + " 体です");

		// Ｂランク
		if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){
			// 水中タイプがいないとき
			if(aqua == false){
				// モンスター所持の空き枠をチェック
				if(residue <= 0){
					// 変数の準備
					local fo_speed = 15;
					local fi_speed = 25;
					local task_fellow;
					// 暗転
					SetFadePlane_(FADE_PLANE.PLANE_3D);
					SetFade_(FADE_OUT, FADE_COLOR_BLACK, fo_speed);
					SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, fo_speed);
					WaitFade_();
					Wait_(10);
					// 暗転明け
					SetFade_(FADE_IN, FADE_COLOR_BLACK, fi_speed);
					SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, fi_speed);
					SetFadePlane_(FADE_PLANE.PLANE_NORMAL);
					Wait_(30);
					// 空き枠を作るよう促すメッセージを表示
					OpenMsgWnd_();
					SetTalkName_("NAME_TAG_TEREZIA");
					ShowMsg_("RIDE_TUT_EVENT_101_01");
					KeyInputWait_();
					CloseMsgWnd_();
					Wait_(5);
					OpenMsgWnd_();
					SetTalkName_("NAME_TAG_TEREZIA");
					ShowMsg_("NOT_EMPTY_MSG_001");
					KeyInputWait_();
					CloseMsgWnd_();
					// 預り所を呼び出す
					GotoMenuFadeOpen(MENU_OPEN.LUGGAGE_OFFICE);
					// 再チェック
					residue = GetFreeMonsterNum_();
					if(residue <= 0){
						while(true){
							// 一拍の間
							Wait_(15);
							// 空き枠を作るよう促すメッセージを表示
							OpenMsgWnd_();
							SetTalkName_("NAME_TAG_TEREZIA");
							ShowMsg_("NOT_EMPTY_MSG_001");
							KeyInputWait_();
							CloseMsgWnd_();
							// 預り所を呼び出す
							GotoMenuFadeOpen(MENU_OPEN.LUGGAGE_OFFICE);
							// 再々チェック
							residue = GetFreeMonsterNum_();
							if(residue > 0){
								// １体でも空きが出来たら抜ける
								break;
							}
						}
					}
					// 一拍の間
					Wait_(15);
					// 仲間加入メッセージを表示
					OpenMsgWnd_();
					SetTalkName_("NAME_NONE");
					ShowMsg_("RIDE_TUT_EVENT_101_02");
					Wait_(15);
					// 仲間ME(重要アイテム取得と同じRedmine#2831)
					PlayMe_("ME_010");
					WaitMe_();
					KeyInputWait_();
					CloseMsgWnd_();
					// イルカちょうちん(Redmine#1137)
					task_fellow = Task_AddFellow_(1601, false);
					WaitTask(task_fellow);
					// 下画面の暗転を明ける
					SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, 30);
					WaitFadeSub_();
				}
				else{
					// 変数の準備
					local task_fellow;
					// 暗転＋暗転明け
					uFadeOutAndFadeIn();
					// メッセージを表示
					OpenMsgWnd_();
					SetTalkName_("NAME_TAG_TEREZIA");
					ShowMsg_("RIDE_TUT_EVENT_101_01");
					KeyInputWait_();
					CloseMsgWnd_();
					// 仲間加入メッセージを表示
					OpenMsgWnd_();
					SetTalkName_("NAME_NONE");
					ShowMsg_("RIDE_TUT_EVENT_101_02");
					Wait_(15);
					// 仲間ME(重要アイテム取得と同じRedmine#2831)
					PlayMe_("ME_010");
					WaitMe_();
					KeyInputWait_();
					CloseMsgWnd_();
					// イルカちょうちん(Redmine#1137)
					task_fellow = Task_AddFellow_(1601, false);
					WaitTask(task_fellow);
					// 上画面の暗転を明ける
					SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);
					SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, 30);
					WaitFadeSub_();
					// フェード状態を元に戻す→uFadeOutAndFadeIn()で変更
					SetFadePlane_(FADE_PLANE.PLANE_NORMAL);
				}
			}
		}
		// Ａランク
		else if(main_num == GetFlagID_("CONST_SM_VOLCANO")){
			// 低空タイプがいないとき
			if(aero == false){
				// モンスター所持の空き枠をチェック
				if(residue <= 0){
					local fo_speed = 15;
					local fi_speed = 25;
					local task_fellow;
					// 暗転
					SetFadePlane_(FADE_PLANE.PLANE_3D);
					SetFade_(FADE_OUT, FADE_COLOR_BLACK, fo_speed);
					SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, fo_speed);
					WaitFade_();
					Wait_(10);
					// 暗転明け
					SetFade_(FADE_IN, FADE_COLOR_BLACK, fi_speed);
					SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, fi_speed);
					SetFadePlane_(FADE_PLANE.PLANE_NORMAL);
					Wait_(30);
					// 空き枠を作るよう促すメッセージを表示
					OpenMsgWnd_();
					SetTalkName_("NAME_TAG_TEREZIA");
					ShowMsg_("RIDE_TUT_EVENT_201_01");
					KeyInputWait_();
					CloseMsgWnd_();
					Wait_(5);
					OpenMsgWnd_();
					SetTalkName_("NAME_TAG_TEREZIA");
					ShowMsg_("NOT_EMPTY_MSG_001");
					KeyInputWait_();
					CloseMsgWnd_();
					// 預り所を呼び出す
					GotoMenuFadeOpen(MENU_OPEN.LUGGAGE_OFFICE);
					// 再チェック
					residue = GetFreeMonsterNum_();
					if(residue <= 0){
						while(true){
							// 一拍の間
							Wait_(15);
							// 空き枠を作るよう促すメッセージを表示
							OpenMsgWnd_();
							SetTalkName_("NAME_TAG_TEREZIA");
							ShowMsg_("NOT_EMPTY_MSG_001");
							KeyInputWait_();
							CloseMsgWnd_();
							// 預り所を呼び出す
							GotoMenuFadeOpen(MENU_OPEN.LUGGAGE_OFFICE);
							// 再々チェック
							residue = GetFreeMonsterNum_();
							if(residue > 0){
								// １体でも空きが出来たら抜ける
								break;
							}
						}
					}
					// 一拍の間
					Wait_(15);
					// 仲間加入メッセージを表示
					OpenMsgWnd_();
					SetTalkName_("NAME_NONE");
					ShowMsg_("RIDE_TUT_EVENT_201_02");
					Wait_(15);
					// 仲間ME(重要アイテム取得と同じRedmine#2831)
					PlayMe_("ME_010");
					WaitMe_();
					KeyInputWait_();
					CloseMsgWnd_();
					// スターキメラ(Redmine#1137)
					task_fellow = Task_AddFellow_(1602, false);
					WaitTask(task_fellow);
					// 下画面の暗転を明ける
					SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, 30);
					WaitFadeSub_();
				}
				else{
					// 変数の準備
					local task_fellow;
					// 暗転＋暗転明け
					uFadeOutAndFadeIn();
					// メッセージを表示
					OpenMsgWnd_();
					SetTalkName_("NAME_TAG_TEREZIA");
					ShowMsg_("RIDE_TUT_EVENT_201_01");
					KeyInputWait_();
					CloseMsgWnd_();
					// 仲間加入メッセージを表示
					OpenMsgWnd_();
					SetTalkName_("NAME_NONE");
					ShowMsg_("RIDE_TUT_EVENT_201_02");
					Wait_(15);
					// 仲間ME(重要アイテム取得と同じRedmine#2831)
					PlayMe_("ME_010");
					WaitMe_();
					KeyInputWait_();
					CloseMsgWnd_();
					// スターキメラ(Redmine#1137)
					task_fellow = Task_AddFellow_(1602, false);
					WaitTask(task_fellow);
					// 上画面の暗転を明ける
					SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);
					SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, 30);
					WaitFadeSub_();
					// フェード状態を元に戻す→uFadeOutAndFadeIn()で変更
					SetFadePlane_(FADE_PLANE.PLANE_NORMAL);
				}
			}
		}
	}
}

//++++++++++++++++++++++++++++++++++++++++++++
// 擬似デモ:水中ライドクリアデモ
//--------------------------------------------
// 引数   : なし
// 戻り値 : なし
//++++++++++++++++++++++++++++++++++++++++++++
function uAquaRideTutorialClearDemo()
{
	local player = GetPlayerId_();
	// α値の設定
	local alpha_def = 1.0;
	// α値を変更する前は必ずこの命令を記載
	SetManualCalcAlpha_(player, true);

	// 暗転
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();

	// 主人公が透過状態にならないよう再設定(2次DB #4329)
	SetAlpha_(player, 1.0); // 主人公をカメラ調整などで任意で透過させた場合、この擬似デモで透過が維持されないようにする

	// 主人公の準備
	Wait_(15);
	local p_pos  = Vec3(1283.0, 10.0, 0.0);
	local p_dir  = 90;
	SetPos_(player, p_pos);
	SetDir_(player, p_dir);
	SetPlayableCamera_();
	SetCameraDir_(p_dir);
	// 暗転明け
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();

	// メッセージ
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TEREZIA");
	ShowMsg_("DEMO_MSG_100");
	KeyInputWait_();
	CloseMsgWnd_();
	Wait_(15);
	LoadEffect_("EF712_10_EMO_SURPRISE01");
	local id = SetSelectBoneEffect_("ef712_10_emo_surprise01", player, ATTACH_EFFECT1);		// 「！」
	PlaySE_("SE_DEM_053");
	SetEffectScale_(id, 1.0);
	Wait_(15);
	CommPlayerTurnAroundDir(270);
	Wait_(30);
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TEREZIA");
	ShowMsg_("DEMO_MSG_101");
	KeyInputWait_();
	CloseMsgWnd_();
	Wait_(30);
	CommPlayerTurnAroundDir(p_dir);
	Wait_(30);

	// 主人公にテレポートエフェクトをつける
	// エフェクトの読み込み
	LoadEffect_("ef732_07_teleport_monolith");	//モノリス転送エフェクト
	PlaySE_("SE_DEM_017");						// ＳＥ再生
	local effectId = SetSelectBoneEffect_("ef732_07_teleport_monolith", player, ATTACH_GLOBAL);
	Wait_(1);
	// 主人公の姿を段々と消していく
	for(alpha_def = 1.0; alpha_def >= 0.0; alpha_def = alpha_def - 0.1){
		SetAlpha_(player, alpha_def);
		Wait_(1);
	}
	SetAlpha_(player, 0.0);
	// 間を持たせる
	Wait_(30);
	// 暗転
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
	// バーチャルコロシアムのカギ取得完了判定フラグ
	SetEventFlg_("BFG_DUMMY_AQUA_RIDE_TUTORIAL", true);
	// 主人公のα値を元に戻す
	SetAlpha_(player, 1.0);
	// α値をスクリプトで設定できないように戻しておく(2次DB #4329)
	SetManualCalcAlpha_(player, false);
}

//++++++++++++++++++++++++++++++++++++++++++++
// モノリス起動エフェクト
//--------------------------------------------
// 引数   : なし
// 戻り値 : なし
//++++++++++++++++++++++++++++++++++++++++++++
function uMonolithOn(monolith, node)
{
	// モノリスの起動アニメを再生
	PlaySE_("SE_FLD_101");
	SetMotion_(monolith, MOT_GIMMICK_1, BLEND_N);
	// モノリスの起動エフェクト
	LoadEffect_("ef732_12_monolith_on");
	SetPointWorldEffect_("ef732_12_monolith_on", node);
	Wait_(30);
	// モノリスの起動後待機アニメを再生
	SetMotion_(monolith, MOT_GIMMICK_2, BLEND_N);
	// 間を持たせる
	Wait_(40);
}

//++++++++++++++++++++++++++++++++++++++++++++
// ランククリア後に扉を調べるとコロシアムメニューを呼び出す
//--------------------------------------------
// 引数   : ランクの扉のトレーニングバトル解放フラグ
// 戻り値 : なし
//++++++++++++++++++++++++++++++++++++++++++++
function uFreeBattleOn(flg)
{
	// どこの扉か判定
	local rank_flg_id = false;
	local ok_flg = false;
	if(GetEventFlg_(flg) == true){
		ok_flg = true;
	}

	// Redmine#3001称号確認の命令を追加
	local trophy_id = 2;
	if(CheckTrophy_(trophy_id)){
		// 間を持たせる
		Wait_(15);
		// 初回メッセージの判定
		if(GetEventFlg_("BFG_FREE_BATTLE_TUTORIAL_MSG") == false){
			// メッセージ表示
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_TEREZIA");
			ShowMsg_("FREE_BATTLE_MSG_000");
			KeyInputWait_();
			// トレーニングバトル解放の初回メッセージ表示フラグ
			SetEventFlg_("BFG_FREE_BATTLE_TUTORIAL_MSG", true);
			// コロシアムメニューの呼び出し
			GotoMenuScene_(MENU_SCENE.VIRTUALCOLOSSEUM);
		}
		// 通常
		else{
			if(ok_flg == true){
				if(GetEventFlg_("BFG_FREE_BATTLE_UNLOCK") == true){
					// メッセージ表示
					OpenMsgWnd_();
					SetTalkName_("NAME_TAG_TEREZIA");
					ShowMsg_("FREE_BATTLE_MSG_001_Q");
					KeyInputWait_();
					if(GetQueryResult_() == QUERY2_0){
						CloseMsgWnd_();
						// コロシアムメニューの呼び出し
						GotoMenuScene_(MENU_SCENE.VIRTUALCOLOSSEUM);
					}
					else{
						ShowMsg_("FREE_BATTLE_MSG_001_N");
						CloseMsgWnd_();
					}
				}
			}
		}
	}
}

//++++++++++++++++++++++++++++++++++++++++++++++
// 仲間加入前の暗転と暗転明け処理( 2次DB #2824 )
//----------------------------------------------
// 引数   : なし
// 戻り値 : なし
//++++++++++++++++++++++++++++++++++++++++++++++
function uFadeOutAndFadeIn()
{
	local fo_speed = 15; // 暗転スピード
	local fi_speed = 30; // 暗転明けスピード
	
	// 暗転 < 仲間加入中は上画面は暗転(ただし、テレジアのメッセージは表示される)→東藤さん指示 >
	SetFadePlane_(FADE_PLANE.PLANE_3D);
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, fo_speed);
	SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, fo_speed);
	WaitFade_();
	// 間を持たせる
	Wait_(30);
	SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
	WaitFadeSub_();
	// 間を持たせる
	Wait_(15);
}

//++++++++++++++++++++++++++++++++++++++++++++++
// 仲間加入処理に移行しない場合の暗転を入れて場面を切り替える処理( 2次DB #2824 )
//----------------------------------------------
// 引数   : なし
// 戻り値 : なし
//++++++++++++++++++++++++++++++++++++++++++++++
function uNotFellowCaseFade()
{
	local fo_speed = 30; // 暗転スピード
	local fi_speed = 30; // 暗転明けスピード
	
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, fo_speed);
	WaitFade_();
	SetFade_(FADE_IN, FADE_COLOR_BLACK, fi_speed);
	SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, fi_speed);
	WaitFade_();
	// 間を持たせる
	Wait_(15);
}

//++++++++++++++++++++++++++++++++++++++++++++++
// セーブ禁止
//----------------------------------------------
// 引数   : flg		セーブ禁止にするかどうか
// 戻り値 : なし
//++++++++++++++++++++++++++++++++++++++++++++++
function uBanSave(flg)
{
	SetEventFlg_("BFG_SAVE_PROHIBIT", flg);				// Bit_451
	SetEventFlg_("BFG_LIBRARY_PROHIBIT", flg);			// Bit_455
	SetEventFlg_("BFG_COMMUNICATION_PROHIBIT", flg);	// Bit_460
}
