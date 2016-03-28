//===================== 拠点【ノチョーラキングダム(B2F)】 ====================


//+++++++++++++++++++++++++++++++++++++++++++++++++
// 起動条件：戦闘終了後
//-------------------------------------------------
// 主な用途：戦闘終了後にフラグを操作する時などを行う
//+++++++++++++++++++++++++++++++++++++++++++++++++
function AfterBattle()
{
	// 戦闘から戻ってきた
	// 勝った場合
	if(GetBattleEndType_() == END_TYPE_WIN){
		// 勝利できた状態にする
		SetEventFlg_("BFG_CHALLENGE_BATTLE_CHALLENGE_WIN", true);
	} else {
		// 全回復
		RecoverAll_();
		// 勝利できなかった状態にする（敗北、棄権は同じ）
		SetEventFlg_("BFG_CHALLENGE_BATTLE_CHALLENGE_WIN",false);
		// イベント進行を終了直前にする
		SetNumFlg_("NUM_CHALLENGE_BATTLE_SUB", 3);
		// BGMの頭出しをする
		SetEventFlg_("BFG_RETURN_BATTLE_FIRLD_BGM_HEAD",true);
	}

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
	local main_num = GetNumFlg_("NUM_SCENARIO_MAIN");
	local allclear_num = GetNumFlg_("NUM_SCENARIO_SUB_ALL_CLEAR");   // 完全クリア後

	// BGMの設定
	if(main_num == GetFlagID_("CONST_SM_ALL_CLEAR")){							// NUM0  == 10
		if(allclear_num <= GetFlagID_("CONST_SS_ALL_GO_TO_CENTER_BILL_B2F")){	// NUM11 <=  1
			// Demo833が再生されるまでは無音にする
			SetEventFlg_("BFG_A01_02_EVENT_BGM_NONE", true);
		}else{
			// BGMの無音を解除
			SetEventFlg_("BFG_A01_02_EVENT_BGM_NONE", false);
		}
	}
	
	
	
	// マップ到達フラグ
	//SetEventFlg_("", true);// (仮)対応するフラグが用意されていないのでコメント化

	// 全滅通知のチェック
	if( GetEventFlg_("BFG_DEAD_RETURN") == true ){
		// 全滅通知Bitフラグをfalseに戻す( プログラムで立ててスクリプトで降ろす )
		//ここではその場復帰のため、何もせずにフラグfalse
		SetEventFlg_("BFG_DEAD_RETURN", false);
	}

//--------------------------
// ギミック
	// 初期化
	g_lift <- C_NONE_ID;	// 主人公をリフトの方向に向ける処理があるのでグローバル変数
	
	// リソースの読み込み
	local door_blue_id	 = ReadGimmick_("o_A01_14");// 青の扉
	local door_red_id	 = ReadGimmick_("o_A01_15");// 赤の扉
	local elevator_id	 = ReadGimmick_("o_A01_18");// エレベータの扉
	local lift_id		 = ReadGimmick_("o_A01_17");// エレベータのリフト
	
	
	// ■青の扉
	local door_blue = ArrangePointGimmick_("o_A01_14", door_blue_id, "g_door_blue");
	
	// ■赤の扉
	local door_red = ArrangePointGimmick_("o_A01_15", door_red_id, "g_door_red");
	
	// ■エレベータの扉
	local elevator = ArrangePointGimmick_("o_A01_18", elevator_id, "g_elevator");
	
	// ■エレベータのリフト
	g_lift = ArrangePointGimmick_("o_A01_17", lift_id, "g_elevator_lift");

//----------------------------------------------------------------
// NPC関連を読込み
	// 初期化
	npc_Aroma2go <- C_NONE_ID;
	npc_Renate <- C_NONE_ID;
	npc_Nocho_D <- C_NONE_ID;
	npc_Nocho_C <- C_NONE_ID;
	npc_Citizen_Man_B <- C_NONE_ID;
	npc_Citizen_Chi_B <- C_NONE_ID;
	npc_Citizen_Wom_B <- C_NONE_ID;
	npc_Resist_Man_B <- C_NONE_ID;
	npc_Resist_Wom_B <- C_NONE_ID;
	npc_Yoncho <- C_NONE_ID;
	
	if(main_num == GetFlagID_("CONST_SM_ALL_CLEAR")){					 // NUM0  == 10
		if(allclear_num == GetFlagID_("CONST_SS_ALL_UNLOCK_BATTLE_GP")){ // NUM11 ==  2
			// アロマ２号
			npc_Aroma2go = ReadAndArrangePointNpc("n018", "npc_aroma2go");
			SetTalkCameraType_(npc_Aroma2go, TALK_CAMERA_UP);
			SetReactorMsg_(npc_Aroma2go, "NPC_AROMA2GO_REC");
			// 会話カメラ時に透過されるのでアルファ値を設定する
			SetManualCalcAlpha_(npc_Aroma2go, true);
			SetAlpha_(npc_Aroma2go, 1.0);
			// アナライズのターゲット名を切り替える(アロマ→アロマ２号)
			SetTargetNameKey_(npc_Aroma2go, "NAME_TAG_AROMA_NO2");
			
			// レナーテ
			npc_Renate = ReadAndArrangePointNpc("n007", "npc_renate");
			SetTalkCameraType_(npc_Renate, TALK_CAMERA_UP);
			SetReactorMsg_(npc_Renate, "NPC_RENATE_REC");
			// 会話カメラ時に透過されるのでアルファ値を設定する
			SetManualCalcAlpha_(npc_Renate, true);
			SetAlpha_(npc_Renate, 1.0);
			
			// NPCノチョーラD(オス)
			npc_Nocho_D = ReadAndArrangePointNpc("n000", "npc_nocho_d");
			SetReactorMsg_(npc_Nocho_D, "NPC_NOCHO_MEN_REC");
			
			// NPCノチョーラC(メス)
			npc_Nocho_C = ReadAndArrangePointNpc("n004", "npc_nocho_c");
			SetReactorMsg_(npc_Nocho_C, "NPC_NOCHO_WOMEN_REC");
			
			// 市民男Ｂ
			npc_Citizen_Man_B = ReadAndArrangePointNpc("n015", "npc_city_man_b");
			SetReactorMsg_(npc_Citizen_Man_B, "NPC_CITIZEN_MAN_B_REC");
			
			// 市民子供Ｂ
			npc_Citizen_Chi_B = ReadAndArrangePointNpc("n017", "npc_city_child_b");
			SetReactorMsg_(npc_Citizen_Chi_B, "NPC_CITIZEN_CHILD_B_REC");
			
			// 市民女Ｂ
			npc_Citizen_Wom_B = ReadAndArrangePointNpc("n016", "npc_city_woman_b");
			SetReactorMsg_(npc_Citizen_Wom_B, "CITIZEN_WOMAN_B_REC");
			
			// レジスタンス男Ｂ
			npc_Resist_Man_B = ReadAndArrangePointNpc("n020", "npc_resi_man_b");
			SetReactorMsg_(npc_Resist_Man_B, "RESISTANCE_MAN_B_REC");
			
			// レジスタンス女Ｂ
			npc_Resist_Wom_B = ReadAndArrangePointNpc("n022", "npc_resi_woman_b");
			SetReactorMsg_(npc_Resist_Wom_B, "RESISTANCE_WOMAN_B_REC");
			
			// ヨンチョ
			npc_Yoncho = ReadAndArrangePointNpc("n011", "npc_yoncho");
			SetReactorMsg_(npc_Yoncho, "NPC_YONCHO_REC");
			SetTargetNameKey_(npc_Yoncho, "NAME_TAG_YONCHO"); // アナライズのターゲット名を切り替える(サンチョ→ヨンチョ)
			SetScaleSilhouette(npc_Yoncho, SCALE.SANCHO_EVENT, SILHOUETTE_WIDTH.SANCHO_EVENT); // サンチョのスケール値を設定
			SetTalkCameraType_(npc_Yoncho, TALK_CAMERA_UP);
		}
	}

//-----------------------------
// リアクターポイント
	// 北エレベーター
	local reactorPoint01 = ArrangeMsgReactorPoint("reactor_point_01", GetFlagID_("BFG_REACTER_POINT_105")
		, SHORT_DIST, "REC_POINT_01_01", "REC_POINT_01_02");
	// 北登場口ゲート
	local reactorPoint02 = ArrangeMsgReactorPoint("reactor_point_02", GetFlagID_("BFG_REACTER_POINT_106")
		, SHORT_DIST, "REC_POINT_02_01", "REC_POINT_02_02");
	// 南登場口ゲート
	local reactorPoint03 = ArrangeMsgReactorPoint("reactor_point_03", GetFlagID_("BFG_REACTER_POINT_107")
		, SHORT_DIST, "REC_POINT_03_01", "REC_POINT_03_02");
	// 空中広告装置Ａ
	local reactorPoint04 = ArrangeMsgReactorPoint("reactor_point_04", GetFlagID_("BFG_REACTER_POINT_108")
		, SHORT_DIST, "REC_POINT_04_01", "REC_POINT_04_02");
	// 空中広告装置Ｂ
	local reactorPoint05 = ArrangeMsgReactorPoint("reactor_point_05", GetFlagID_("BFG_REACTER_POINT_108")
		, SHORT_DIST, "REC_POINT_04_01", "REC_POINT_04_02");
	// 空中広告装置Ｃ
	local reactorPoint06 = ArrangeMsgReactorPoint("reactor_point_06", GetFlagID_("BFG_REACTER_POINT_108")
		, SHORT_DIST, "REC_POINT_04_01", "REC_POINT_04_02");
	// 空中広告装置Ｄ
	local reactorPoint07 = ArrangeMsgReactorPoint("reactor_point_07", GetFlagID_("BFG_REACTER_POINT_108")
		, SHORT_DIST, "REC_POINT_04_01", "REC_POINT_04_02");
	// 空中広告装置Ｅ
	local reactorPoint08 = ArrangeMsgReactorPoint("reactor_point_08", GetFlagID_("BFG_REACTER_POINT_108")
		, SHORT_DIST, "REC_POINT_04_01", "REC_POINT_04_02");
	// ライブモニター
	local reactorPoint09 = ArrangeMsgReactorPoint("reactor_point_09", GetFlagID_("BFG_REACTER_POINT_109")
		, SHORT_DIST, "REC_POINT_05_01", "REC_POINT_05_02");

//----------------------------------------------------------------
// イベント地雷を読込み
	// 初期化
	mine_Eleveter <- C_NONE_ID;
	mine_01 <- C_NONE_ID;

	// 北エレベータ
	mine_Eleveter = SetPointBoxEventMine_("mine_eleveter", true);
	// Demo833[アロマの置き土産]再生用地雷
	if(main_num == GetFlagID_("CONST_SM_ALL_CLEAR")){
		if(allclear_num == GetFlagID_("CONST_SS_ALL_GO_TO_CENTER_BILL_B2F")){
			mine_01 = SetPointBoxEventMine_("mine_01", false);
		}
	}


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
	//シナリオメインフラグ
	local main_num = GetNumFlg_("NUM_SCENARIO_MAIN");
	local allclear_num = GetNumFlg_("NUM_SCENARIO_SUB_ALL_CLEAR");   // 完全クリア後


	// ひと通りの処理が終わったら、エレベータ使用時に立てていたフラグを降ろす
	if(GetEventFlg_("BFG_CHECK_USED_ELEVATER_FADE_OFF") == true){
		// エレベータを使用したタイミングでデモを流すタイミングと被った場合フェードの種類を切り替える為のフラグ元に戻す
		SetEventFlg_("BFG_CHECK_USED_ELEVATER_FADE_OFF", false);
	}

	//イベント開始で武舞台入り
	switch ( GetNumFlg_("NUM_CHALLENGE_BATTLE_SUB") ) {
	case 1:
		// 全滅時その場復帰Bitフラグ
		//以下の処理に入る以上、必ず戦闘するのでここで立ててます。
		SetEventFlg_("BFG_DEAD_KEEP_MAP", true);

		//各回戦処理の呼び出し
		switch ( GetNumFlg_("NUM_CHALLENGE_BATTLE_MAIN") ) {
		case 0:
			uChallengeBattle_1_Before();
			break;
		case 1:
			uChallengeBattle_2_Before();
			break;
		case 2:
			uChallengeBattle_3_Before();
			break;
		case 3:
			uChallengeBattle_4_Before();
			break;
		case 4:
			uChallengeBattle_5_Before();
			break;
		default:
			DebugPrint("想定していないチャレンジバトルの回戦です。");
			break;
		}
		break;

	//チャレンジバトルの戦闘復帰後
	case 2:
		//各回戦処理の呼び出し
		switch ( GetNumFlg_("NUM_CHALLENGE_BATTLE_MAIN") ) {
		case 0:
			uChallengeBattle_1_After();
			break;
		case 1:
			uChallengeBattle_2_After();
			break;
		case 2:
			uChallengeBattle_3_After();
			break;
		case 3:
			uChallengeBattle_4_After();
			break;
		case 4:
			uChallengeBattle_5_After();
			break;
		default:
			DebugPrint("想定していないチャレンジバトルの回戦です。");
			break;
		}
		break;

	//チャレンジバトルの挑戦終了で受付前
	case 3:
		// 全滅時その場復帰Bitフラグ
		//チャレンジバトルでは最後はここにくるので、ここでfalse
		SetEventFlg_("BFG_DEAD_KEEP_MAP", false);
		
		// 全回復
		RecoverAll_();
		
		//最後の受付前の会話呼び出し
		uChallengeBattle_ChallengeEnd();
		break;

	default:
		DebugPrint("想定していないチャレンジバトルの進行度です。");
		break;
	}

	//コロシアムメニューで選ばれた項目によって処理分岐
	//※勝ち抜きバトルは、メニュー内で完結しているので分岐無し。
	//チャレンジバトルを選択した
	if ( GetEventFlg_("BFG_COLOSSEUM_CHALLENGE_BATTLE_START") == true ) {
		SetEventFlg_("BFG_COLOSSEUM_CHALLENGE_BATTLE_START", false);
		//１日１回制限の登録
		SetEventDate_();

		// 強制的に会話状態を設定
		SetTalkCameraType_(npc_Aroma2go, TALK_CAMERA_UP);
		SetTalkAction_(npc_Aroma2go);

		// メッセージ
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_AROMA_NO2");
		ShowMsg_("AROMA_2GO_MSG_110");			//「ふふん　いい返事じゃない。
		KeyInputWait_();

		// 会話カメラのままフェードアウトさせる
		FieldBgmStop_(FADE_MAPCHANGE);
		SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_MAPCHANGE);
		SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_MAPCHANGE);
		WaitFade_();
		CloseMsgWnd_();

		//サブフラグ進行
		SetNumFlg_( "NUM_CHALLENGE_BATTLE_SUB", 1 );

		//武舞台にマップチェンジ
		SetReturnDemoMap_("A01_02");
		SetReturnDemoPosDir_(Vec3(0.0, 0.0, -20.0), 0);

		// Demo850[チャレンジバトル戦闘前]
		WeatherTimeChangeDemo(850);

	//やめる・Bキャンセルを選択した
	} else if ( GetEventFlg_("BFG_COLOSSEUM_END") == true ) {
		SetEventFlg_("BFG_COLOSSEUM_END", false);
		uRtnAroma2goMsg();
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
	// 話しかける対象のNPCを条件に
	local target = GetTargetId_();
	switch(target)
	{
	// アロマ２号
	case npc_Aroma2go:
		uTalkAroma2go();
		break;
	// レナーテ
	case npc_Renate:
		uRenateMsg();
		break;
	// ノチョーラＤ
	case npc_Nocho_D:
		uNochoDMsg();
		break;
	// ノチョーラＣ
	case npc_Nocho_C:
		uNochoCMsg();
		break;
	// 市民男
	case npc_Citizen_Man_B:
		uCitizenManMsg();
		break;
	// 市民子供
	case npc_Citizen_Chi_B:
		uCitizenChiMsg();
		break;
	// 市民女
	case npc_Citizen_Wom_B:
		uCitizenWomMsg();
		break;
	// レジスタンス男
	case npc_Resist_Man_B:
		uResistManMsg();
		break;
	// レジスタンス女
	case npc_Resist_Wom_B:
		uResistWomMsg();
		break;
	// ヨンチョ
	case npc_Yoncho:
		uTalkYoncho();
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
	// 調べたり触ったりしたイベント地雷を条件に
	local target    = GetTouchEventMineId_();
	switch(target)
	{
	// 北エレベータ
	case mine_Eleveter:
		CommPlayerTurnAroundObj(g_lift);
		DeleteEventMine_(mine_Eleveter);
		uChoiceMoveEleveter();
		break;
	case mine_01:
		uPlayDemo833();
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
// ローカル関数：北エレベータでどちらの移動を行うのか選択
//---------------------------------------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//===========================================================================
function uChoiceMoveEleveter()
{
	OpenMsgWnd_();
	ShowMsg_("CHOICE_MOVE_UP_OR_DOWN");
	KeyInputWait_();
	if(GetQueryResult_() == QUERY_YES){
		CloseMsgWnd_();
		// エレベータを使用したタイミングでデモを流すタイミングと被った場合フェードの種類を切り替える為のフラグ元に戻す
		SetEventFlg_("BFG_CHECK_USED_ELEVATER_FADE_OFF", true);
		// エレベータで移動SE
		PlaySE_("SE_FLD_061");
		// 地下１階に移動
		ChangeMapPosDir_("A01_01", Vec3(A01_01_RTN_POS_N_X, A01_01_RTN_POS_N_Y, A01_01_RTN_POS_N_Z), RTN_DIR_N);
	}
	else{
		CloseMsgWnd_();
		// 地雷を再設置
		SetPointBoxEventMine_("mine_eleveter", true);
	}
}

//==============================================
// ローカル関数：Demo833[アロマの置き土産]の再生
//----------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//==============================================
function uPlayDemo833()
{
	//シナリオメインフラグ
	local main_num = GetNumFlg_("NUM_SCENARIO_MAIN");
	local allclear_num = GetNumFlg_("NUM_SCENARIO_SUB_ALL_CLEAR");   // 完全クリア後

	if(main_num == GetFlagID_("CONST_SM_ALL_CLEAR")){
		if(allclear_num == GetFlagID_("CONST_SS_ALL_GO_TO_CENTER_BILL_B2F")){
			SetNumFlg_("NUM_SCENARIO_SUB_ALL_CLEAR", GetFlagID_("CONST_SS_ALL_UNLOCK_BATTLE_GP")); // Num11 = 2
			// フェードアウト(昼夜変更を隠すため)
			SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
			SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
			WaitFade_();
			// 時間帯をデモに合わせる
			SetTime_(START_TIME_ZONE_NOON);
			// ルーラポイント解放
			SetEventFlg_("BFG_RULER_ADD_029", true);
			// 勝ち抜きバトル解放フラグを立てる
			SetEventFlg_("BFG_TOURNAMENT_BATTLE_UNLOCK", true);
			//デモ再生後のマップを指定
			SetReturnDemoPosDir_(Vec3(160.35, 0.00, -160.55), -50);
			// Demo833[アロマの置き土産]
			ChangeDemo_(833);
		}
	}
}

//==============================================
// ローカル関数：アロマ２号と会話した時の処理
//----------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//==============================================
function uTalkAroma2go()
{
	//シナリオメインフラグ
	local main_num = GetNumFlg_("NUM_SCENARIO_MAIN");
	local allclear_num = GetNumFlg_("NUM_SCENARIO_SUB_ALL_CLEAR");   // 完全クリア後

	if(main_num == GetFlagID_("CONST_SM_ALL_CLEAR")){					 // Num0  == 10
		if(allclear_num == GetFlagID_("CONST_SS_ALL_UNLOCK_BATTLE_GP")){ // Num11 ==  2
			uMonsterBattleQuestion();
		}
	}
}

//===============================================
// ローカル関数：モンスターバトルＧＰ移行処理
//-----------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//===============================================
function uMonsterBattleQuestion()
{
	local fade_frame = 15;
	
	//まだ未挑戦なら
	if ( GetEventFlg_("BFG_CHALLENGE_BATTLE_FIRSTCHALLENGE") == false ) {
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_AROMA_NO2");
		ShowMsg_("AROMA_2GO_MSG_101");
		KeyInputWait_();
		ShowMsg_("AROMA_2GO_MSG_102");
		KeyInputWait_();
		ShowMsg_("AROMA_2GO_MSG_103");
		KeyInputWait_();
		if(GetQueryResult_() == QUERY_YES){
			// 所持ディスクがMAXでは無い時
			if(CheckDiscMax_() == false){
				// 暗転
				SetFade_(FADE_OUT, FADE_COLOR_BLACK, fade_frame);
				SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, fade_frame);
				WaitFade_();
				CloseMsgWnd_();
				
				// コロシアムメニューの呼び出し
				GotoMenuScene_(MENU_SCENE.VIRTUALCOLOSSEUM);
			}
			// 所持ディスクがMAXの時
			else{
				ShowMsg_("AROMA_2GO_MSG_115");
				KeyInputWait_();
				CloseMsgWnd_();
			}
		} else {
			ShowMsg_("AROMA_2GO_MSG_111");
			KeyInputWait_();
			CloseMsgWnd_();
		}
		
	// １回以上挑戦した
	} else {
		//前のチャレンジバトルから一日経過したか
		if ( CheckEventDate_() == true ) {
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_AROMA_NO2");
			ShowMsg_("AROMA_2GO_MSG_120");
			KeyInputWait_();
			ShowMsg_("AROMA_2GO_MSG_121");
			KeyInputWait_();
			if(GetQueryResult_() == QUERY_YES){
				// 所持ディスクがMAXでは無い時
				if(CheckDiscMax_() == false){
					// 暗転
					SetFade_(FADE_OUT, FADE_COLOR_BLACK, fade_frame);
					SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, fade_frame);
					WaitFade_();
					CloseMsgWnd_();
					
					// コロシアムメニューの呼び出し
					GotoMenuScene_(MENU_SCENE.VIRTUALCOLOSSEUM);
				}
				// 所持ディスクがMAXの時
				else{
					ShowMsg_("AROMA_2GO_MSG_115");
					KeyInputWait_();
					CloseMsgWnd_();
				}
			} else {
				ShowMsg_("AROMA_2GO_MSG_111");
				KeyInputWait_();
				CloseMsgWnd_();
			}
			
		//まだ経過してない
		} else {
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_AROMA_NO2");
			ShowMsg_("AROMA_2GO_MSG_130");
			KeyInputWait_();
			ShowMsg_("AROMA_2GO_MSG_131");
			KeyInputWait_();
			if(GetQueryResult_() == QUERY_YES){
				// 所持ディスクがMAXでは無い時
				if(CheckDiscMax_() == false){
					// 暗転
					SetFade_(FADE_OUT, FADE_COLOR_BLACK, fade_frame);
					SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, fade_frame);
					WaitFade_();
					CloseMsgWnd_();
					
					// コロシアムメニューの呼び出し
					GotoMenuScene_(MENU_SCENE.VIRTUALCOLOSSEUM);
				}
				// 所持ディスクがMAXの時
				else{
					ShowMsg_("AROMA_2GO_MSG_115");
					KeyInputWait_();
					CloseMsgWnd_();
				}
			} else {
				ShowMsg_("AROMA_2GO_MSG_111");
				KeyInputWait_();
				CloseMsgWnd_();
			}
		}
	}

}

//==============================================
// ローカル関数：チャレンジバトル１回戦　戦闘前の一連
//----------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//==============================================
function uChallengeBattle_1_Before()
{
	//サブフラグ進行
	SetNumFlg_( "NUM_CHALLENGE_BATTLE_SUB", 2 );

	// １回戦の相手と戦闘
	ChangeBattleParty_(125);

}

//==============================================
// ローカル関数：チャレンジバトル　１回戦　戦闘後の一連
//----------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//==============================================
function uChallengeBattle_1_After()
{
	//報酬プレゼント
	//初回
	if ( GetEventFlg_("BFG_CHALLENGE_BATTLE_FIRSTREWARD") == false ) {
		// ディスク入手処理
		AddSpecialDisc_(SPECIAL_DISC.SHINE); // 光あふれるディスク
	//２回目以降
	} else {
		// アイテム入手処理
		AddItem_(11, 1);					//天鳥のソーマ×1

	}

	//サブフラグ進行
	SetNumFlg_( "NUM_CHALLENGE_BATTLE_SUB", 3 );

	SetReturnDemoMap_("A01_02");
	SetReturnDemoPosDir_(Vec3(0.0, 0.0, -20.0), 0);
	// Demo851[チャレンジバトル戦闘勝利後]
	SetEventFlg_("BFG_WEATHER_TIME_TAKEOVER_DEMO", true);	// 天候と時間をデモに引き継ぐ
	EventStartChangeDemo(851, FADE_COLOR_BLACK);

}

//==============================================
// ローカル関数：チャレンジバトル２回戦　戦闘前の一連
//----------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//==============================================
function uChallengeBattle_2_Before()
{
	//サブフラグ進行
	SetNumFlg_( "NUM_CHALLENGE_BATTLE_SUB", 2 );

	// ２回戦の相手と戦闘
	ChangeBattleParty_(126);

}

//==============================================
// ローカル関数：チャレンジバトル　２回戦　戦闘後の一連
//----------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//==============================================
function uChallengeBattle_2_After()
{
	//報酬プレゼント
	//初回
	if ( GetEventFlg_("BFG_CHALLENGE_BATTLE_SECONDREWARD") == false ) {
		// アイテム入手処理
		AddItem_(903, 1);				//歓楽の天導石

	//２回目以降
	} else {
		//------------------------------------------------------------------------------
		// アイテムID一覧	/tose_works/data/parameter/10_04_アイテムパラメータ.xlsm参照
		//------------------------------------------------------------------------------
		// 36 -> いのちの木のみ
		// 37 -> ふしぎな木のみ
		// 38 -> ちからのタネ
		// 39 -> すばやさのタネ
		// 40 -> まもりのタネ
		// 41 -> かしこさのタネ
		// 42 -> スキルのタネ
		// 43 -> しあわせのタネ
		//------------------------------------------------------------------------------
		//上記の種全てを5個追加する
		local id;
		for(id = 36; id <= 43; id ++){
			AddItem_(id, 5);
		}

	}

	//サブフラグ進行
	SetNumFlg_( "NUM_CHALLENGE_BATTLE_SUB", 3 );

	//受付前の座標予約
	SetReturnDemoMap_("A01_02");
	SetReturnDemoPosDir_(Vec3(0.0, 0.0, -20.0), 0);
	// Demo851[チャレンジバトル戦闘勝利後]
	SetEventFlg_("BFG_WEATHER_TIME_TAKEOVER_DEMO", true);	// 天候と時間をデモに引き継ぐ
	EventStartChangeDemo(851, FADE_COLOR_BLACK);

}


//==============================================
// ローカル関数：チャレンジバトル３回戦　戦闘前の一連
//----------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//==============================================
function uChallengeBattle_3_Before()
{
	//サブフラグ進行
	SetNumFlg_( "NUM_CHALLENGE_BATTLE_SUB", 2 );

	// ３回戦の相手と戦闘
	ChangeBattleParty_(127);

}

//==============================================
// ローカル関数：チャレンジバトル　３回戦　戦闘後の一連
//----------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//==============================================
function uChallengeBattle_3_After()
{
	//報酬プレゼント
	//初回
	if ( GetEventFlg_("BFG_CHALLENGE_BATTLE_THIRDREWARD") == false ) {
		// アイテム入手処理
		AddItem_(96, 1);				//地獄の遺伝子5×1

	//２回目以降
	} else {
		// アイテム入手処理
		AddItem_(60, 5);				//ちいさなメダル×5

	}

	//サブフラグ進行
	SetNumFlg_( "NUM_CHALLENGE_BATTLE_SUB", 3 );

	//受付前の座標予約
	SetReturnDemoMap_("A01_02");
	SetReturnDemoPosDir_(Vec3(0.0, 0.0, -20.0), 0);
	// Demo851[チャレンジバトル戦闘勝利後]
	SetEventFlg_("BFG_WEATHER_TIME_TAKEOVER_DEMO", true);	// 天候と時間をデモに引き継ぐ
	EventStartChangeDemo(851, FADE_COLOR_BLACK);

}


//==============================================
// ローカル関数：チャレンジバトル４回戦　戦闘前の一連
//----------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//==============================================
function uChallengeBattle_4_Before()
{
	//サブフラグ進行
	SetNumFlg_( "NUM_CHALLENGE_BATTLE_SUB", 2 );

	// ４回戦の相手と戦闘
	ChangeBattleParty_(128);

}

//==============================================
// ローカル関数：チャレンジバトル　４回戦　戦闘後の一連
//----------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//==============================================
function uChallengeBattle_4_After()
{
	//報酬プレゼント
	AddItem_(47, 5);			// しもふりにく×5

	//サブフラグ進行
	SetNumFlg_( "NUM_CHALLENGE_BATTLE_SUB", 3 );

	//受付前の座標予約
	SetReturnDemoMap_("A01_02");
	SetReturnDemoPosDir_(Vec3(0.0, 0.0, -20.0), 0);
	// Demo851[チャレンジバトル戦闘勝利後]
	SetEventFlg_("BFG_WEATHER_TIME_TAKEOVER_DEMO", true);	// 天候と時間をデモに引き継ぐ
	EventStartChangeDemo(851, FADE_COLOR_BLACK);

}


//==============================================
// ローカル関数：チャレンジバトル５回戦　戦闘前の一連
//----------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//==============================================
function uChallengeBattle_5_Before()
{
	//サブフラグ進行
	SetNumFlg_( "NUM_CHALLENGE_BATTLE_SUB", 2 );

	// ５回戦の相手と戦闘
	ChangeBattleParty_(129);

}

//==============================================
// ローカル関数：チャレンジバトル　５回戦　戦闘後の一連
//----------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//==============================================
function uChallengeBattle_5_After()
{
	//報酬がモンスターなので、ここでは仲間加入ができない！（なので加入予約）
	SetEventFlg_( "BFG_CHALLENGE_BATTLE_ADDMONS_RESERV", true );

	//サブフラグ進行
	SetNumFlg_( "NUM_CHALLENGE_BATTLE_SUB", 3 );

	//受付前の座標予約
	SetReturnDemoMap_("A01_02");
	SetReturnDemoPosDir_(Vec3(0.0, 0.0, -20.0), 0);
	// Demo851[チャレンジバトル戦闘勝利後]
	SetEventFlg_("BFG_WEATHER_TIME_TAKEOVER_DEMO", true);	// 天候と時間をデモに引き継ぐ
	EventStartChangeDemo(851, FADE_COLOR_BLACK);

}


//==============================================
// ローカル関数：チャレンジバトル　戦闘後受付前の一連
//----------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//==============================================
function uChallengeBattle_ChallengeEnd()
{
	//話し始めの前に一拍の間
//	Wait_(30);

	// 強制的に会話状態を設定
	SetTalkCameraType_(npc_Aroma2go, TALK_CAMERA_UP);
	EventStartOperateTalkAction(npc_Aroma2go);
	
	//勝っても負けても挑戦済にする
	SetEventFlg_( "BFG_CHALLENGE_BATTLE_FIRSTCHALLENGE", true );	//初めての挑戦済み

	//挑戦終了後のやり取り開始
	//勝った場合
	if( GetEventFlg_("BFG_CHALLENGE_BATTLE_CHALLENGE_WIN") == true ){

		//仲間加入予約が入っているなら加入処理
		if( GetEventFlg_("BFG_CHALLENGE_BATTLE_ADDMONS_RESERV") == true ){
			// 仲間加入予約を解除
			SetEventFlg_("BFG_CHALLENGE_BATTLE_ADDMONS_RESERV", false);
			
			// 預り所の空き状態をチェック
			uDecreaseCloakRoom();
			
			// 名前付け画面へ移行
			local tsk_named_wnd = Task_AddFellow_(1261, false);
			WaitTask(tsk_named_wnd);
			
			// 下画面が暗転し続けないようにする処理
			SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, FADE_SHORT);
			WaitFade_();
		}
		
		// 通信コインの追加
		AddCoin_(COIN_TYPE.BRONZE, 3);
		AddCoin_(COIN_TYPE.SILVER, 2);
		AddCoin_(COIN_TYPE.GOLD,   1);
		
		// Wait_()を挟むとSetTalkAction_()が動作しなくなるので注意
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_AROMA_NO2");
		ShowMsg_("AROMA_2GO_MSG_900");
		KeyInputWait_();
		ShowMsg_("AROMA_2GO_MSG_901");
		KeyInputWait_();
		CloseMsgWnd_();
		
		
		OpenMsgWnd_();
		PlaySE_("SE_SYS_011");			// アイテム入手ＳＥ
		ShowMsg_("AROMA_2GO_MSG_902");
		KeyInputWait_();
		ShowMsg_("AROMA_2GO_MSG_903");
		KeyInputWait_();
		CloseMsgWnd_();
		
		
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_AROMA_NO2");
		ShowMsg_("AROMA_2GO_MSG_904");
		KeyInputWait_();
		ShowMsg_("AROMA_2GO_MSG_905");
		KeyInputWait_();
		CloseMsgWnd_();

		//サブフラグ進行（メインを１つ進行させて、サブは次の回戦用に戻す）
		SetNumFlg_( "NUM_CHALLENGE_BATTLE_MAIN", GetNumFlg_("NUM_CHALLENGE_BATTLE_MAIN")+1 );
		if ( 5 <= GetNumFlg_("NUM_CHALLENGE_BATTLE_MAIN") ) {
			SetNumFlg_( "NUM_CHALLENGE_BATTLE_MAIN", 0 );	//５回戦終わっているなら１回戦に戻る
		}

		//初回(チャレンジバトルの１回戦初回報酬をもらったか？)
		if(GetNumFlg_("NUM_CHALLENGE_BATTLE_MAIN") == 1){
			if ( GetEventFlg_("BFG_CHALLENGE_BATTLE_FIRSTREWARD") == false ) {
				//初回報酬獲得
				SetEventFlg_( "BFG_CHALLENGE_BATTLE_FIRSTREWARD", true );
			}
		}
		//初回(チャレンジバトルの２回戦初回報酬をもらったか？)
		else if(GetNumFlg_("NUM_CHALLENGE_BATTLE_MAIN") == 2){
			if ( GetEventFlg_("BFG_CHALLENGE_BATTLE_SECONDREWARD") == false ) {
				//初回報酬獲得
				SetEventFlg_( "BFG_CHALLENGE_BATTLE_SECONDREWARD", true );
			}
		}
		//初回(チャレンジバトルの３回戦初回報酬をもらったか？)
		else if(GetNumFlg_("NUM_CHALLENGE_BATTLE_MAIN") == 3){
			if ( GetEventFlg_("BFG_CHALLENGE_BATTLE_THIRDREWARD") == false ) {
				//初回報酬獲得
				SetEventFlg_( "BFG_CHALLENGE_BATTLE_THIRDREWARD", true );
			}
		}
		
		//主人公フリーに

	//負けた場合
	} else {
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_AROMA_NO2");
		ShowMsg_("AROMA_2GO_MSG_910");
		KeyInputWait_();
		ShowMsg_("AROMA_2GO_MSG_911");
		KeyInputWait_();
		ShowMsg_("AROMA_2GO_MSG_912");
		KeyInputWait_();
		CloseMsgWnd_();

	}

	//勝敗にかかわらず、サブフラグはもう一度挑戦できるように戻す
	SetNumFlg_( "NUM_CHALLENGE_BATTLE_SUB", 0 );
	SetEventFlg_("BFG_CHALLENGE_BATTLE_CHALLENGE_WIN", false);		//こっちも初期化

	//主人公フリーに
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
	local allclear_num = GetNumFlg_("NUM_SCENARIO_SUB_ALL_CLEAR");   // 完全クリア後

	if(main_num == GetFlagID_("CONST_SM_ALL_CLEAR")){
		if(allclear_num == GetFlagID_("CONST_SS_ALL_UNLOCK_BATTLE_GP")){
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_RENERTE");
			ShowMsg_("NPC_RENATE_MSG");
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
}

//=================================================================
// ローカル関数：ノチョDの会話処理
//-----------------------------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//=================================================================
function uNochoDMsg()
{
	local main_num    = GetNumFlg_("NUM_SCENARIO_MAIN");
	local allclear_num = GetNumFlg_("NUM_SCENARIO_SUB_ALL_CLEAR");   // 完全クリア後

	if(main_num == GetFlagID_("CONST_SM_ALL_CLEAR")){
		if(allclear_num == GetFlagID_("CONST_SS_ALL_UNLOCK_BATTLE_GP")){
			OpenMsgWnd_();
			ShowMsg_("NPC_NOCHO_D_MSG");
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
}

//=================================================================
// ローカル関数：ノチョCの会話処理
//-----------------------------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//=================================================================
function uNochoCMsg()
{
	local main_num    = GetNumFlg_("NUM_SCENARIO_MAIN");
	local allclear_num = GetNumFlg_("NUM_SCENARIO_SUB_ALL_CLEAR");   // 完全クリア後

	if(main_num == GetFlagID_("CONST_SM_ALL_CLEAR")){
		if(allclear_num == GetFlagID_("CONST_SS_ALL_UNLOCK_BATTLE_GP")){
			OpenMsgWnd_();
			ShowMsg_("NPC_NOCHO_C_MSG");
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
}

//=================================================================
// ローカル関数：市民男Ｂの会話処理
//-----------------------------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//=================================================================
function uCitizenManMsg()
{
	local main_num    = GetNumFlg_("NUM_SCENARIO_MAIN");
	local allclear_num = GetNumFlg_("NUM_SCENARIO_SUB_ALL_CLEAR");   // 完全クリア後

	if(main_num == GetFlagID_("CONST_SM_ALL_CLEAR")){
		if(allclear_num == GetFlagID_("CONST_SS_ALL_UNLOCK_BATTLE_GP")){
			OpenMsgWnd_();
			ShowMsg_("NPC_CITIZEN_MAN_B_MSG");
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
}

//=================================================================
// ローカル関数：市民子供Ｂの会話処理
//-----------------------------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//=================================================================
function uCitizenChiMsg()
{
	local main_num    = GetNumFlg_("NUM_SCENARIO_MAIN");
	local allclear_num = GetNumFlg_("NUM_SCENARIO_SUB_ALL_CLEAR");   // 完全クリア後

	if(main_num == GetFlagID_("CONST_SM_ALL_CLEAR")){
		if(allclear_num == GetFlagID_("CONST_SS_ALL_UNLOCK_BATTLE_GP")){
			OpenMsgWnd_();
			ShowMsg_("NPC_CITIZEN_CHILD_B_MSG");
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
}

//=================================================================
// ローカル関数：市民女Ｂの会話処理
//-----------------------------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//=================================================================
function uCitizenWomMsg()
{
	local main_num    = GetNumFlg_("NUM_SCENARIO_MAIN");
	local allclear_num = GetNumFlg_("NUM_SCENARIO_SUB_ALL_CLEAR");   // 完全クリア後

	if(main_num == GetFlagID_("CONST_SM_ALL_CLEAR")){
		if(allclear_num == GetFlagID_("CONST_SS_ALL_UNLOCK_BATTLE_GP")){
			OpenMsgWnd_();
			ShowMsg_("CITIZEN_WOMAN_B_MSG");
			KeyInputWait_();
			CloseMsgWnd_();
		}
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
	local allclear_num = GetNumFlg_("NUM_SCENARIO_SUB_ALL_CLEAR");   // 完全クリア後

	if(main_num == GetFlagID_("CONST_SM_ALL_CLEAR")){
		if(allclear_num == GetFlagID_("CONST_SS_ALL_UNLOCK_BATTLE_GP")){
			OpenMsgWnd_();
			ShowMsg_("RESISTANCE_MAN_B_MSG");
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
	local allclear_num = GetNumFlg_("NUM_SCENARIO_SUB_ALL_CLEAR");   // 完全クリア後

	if(main_num == GetFlagID_("CONST_SM_ALL_CLEAR")){
		if(allclear_num == GetFlagID_("CONST_SS_ALL_UNLOCK_BATTLE_GP")){
			OpenMsgWnd_();
			ShowMsg_("RESISTANCE_WOMAN_B_MSG");
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
}

//==============================================
// ローカル関数：ヨンチョと会話した時の処理
//----------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//==============================================
function uTalkYoncho()
{
	//シナリオメインフラグ
	local main_num = GetNumFlg_("NUM_SCENARIO_MAIN");
	local allclear_num = GetNumFlg_("NUM_SCENARIO_SUB_ALL_CLEAR");   // 完全クリア後

	if(main_num == GetFlagID_("CONST_SM_ALL_CLEAR")){					 // Num0  == 10
		if(allclear_num == GetFlagID_("CONST_SS_ALL_UNLOCK_BATTLE_GP")){ // Num11 ==  2
			// 初回チェック
			if(GetEventFlg_("BFG_FIRST_CONTACT_YONCHO") == false){
				SetEventFlg_( "BFG_FIRST_CONTACT_YONCHO", true );
				// ヨンチョ(名乗る前)
				OpenMsgWnd_();
				ShowMsg_("YONCHO_MSG_001");
				KeyInputWait_();
				// ヨンチョ(初回)
				SetTalkName_("NAME_TAG_YONCHO");
				ShowMsg_("YONCHO_MSG_002");
				KeyInputWait_();
			}
			else{
				// ヨンチョ(２回目以降)
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_YONCHO");
				ShowMsg_("YONCHO_MSG_003");
				KeyInputWait_();
			}
			// チャレンジバトル可能かを判定してメッセージを変更
			// 未挑戦の場合
			if(GetEventFlg_("BFG_CHALLENGE_BATTLE_FIRSTCHALLENGE") == false){
				ShowMsg_("YONCHO_MSG_PLAY_OK");
			}
			// 挑戦済みの場合
			else{
				// 可能(前のチャレンジバトルから一日経過した)
				if(CheckEventDate_() == true){
					ShowMsg_("YONCHO_MSG_PLAY_OK");
				}
				// 不可(前のチャレンジバトルから一日経過していない)
				else{
					ShowMsg_("YONCHO_MSG_PLAY_NG");
				}
			}
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
}

//==========================================================================
// ローカル関数：アロマ２号の戻りメッセージ
//--------------------------------------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//==========================================================================
function uRtnAroma2goMsg()
{
	// 強制的に会話状態を設定
	SetTalkCameraType_(npc_Aroma2go, TALK_CAMERA_UP);
	EventStartOperateTalkAction(npc_Aroma2go);
	// メッセージ
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA_NO2");
	ShowMsg_("AROMA_2GO_MSG_140");
	KeyInputWait_();
	CloseMsgWnd_();
}

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//  ローカル関数 : モンスターの預り所を調べて、空き作らない限りは預り所を延々と呼び出す
//-----------------------------------------------------------------------------------
// 引数   ：なし
// 戻り値 ：なし
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function uDecreaseCloakRoom()
{
	local residue = GetFreeMonsterNum_();
	local empty_num = 0;

	// 空きがない
	if(residue <= empty_num){
		while(true){
			// ナビマップを非表示
			SetNavimapVisible_(false);
			// システムメッセージ
			OpenMsgWnd_();
			ShowMsg_("NOT_EMPTY_CLOAKROOM_MSG");
			KeyInputWait_();
			CloseMsgWnd_();
			// すぐに暗転解除
			SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, FADE_SHORT);
			// 預り所を呼び出す
			GotoMenuFadeOpen(MENU_OPEN.LUGGAGE_OFFICE);
			// 再チェック
			residue = GetFreeMonsterNum_();
			if(residue > empty_num){
				// １体でも空きが出来たら抜ける
				break;
			}
		}
		// すぐに暗転
		SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
		// ナビマップを表示
		SetNavimapVisible_(true);
	}
	// 空きがある
	else{
		// 特に何もしない
	}
}

