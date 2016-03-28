//===================== A03_00センタービル2F ====================

// カードキーのアイテムＩＤ
const CARDKEY_A_ID = 97; // カードキーα
const CARDKEY_B_ID = 98; // カードキーβ

//-------------------- 初期化 --------------------
// 起動条件：バトル終了後に呼ばれます
// (バトルの勝敗判定やイベントフラグの設定はココ)
//-------------------- 初期化 --------------------
function AfterBattle()
{
//------------------------------------------------------------------
// フラグの状態を取得
	local main_num   = GetNumFlg_("NUM_SCENARIO_MAIN");
	local city_num   = GetNumFlg_("NUM_SCENARIO_SUB_CITY");

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
	local main_num   = GetNumFlg_("NUM_SCENARIO_MAIN");
	local city_num   = GetNumFlg_("NUM_SCENARIO_SUB_CITY");
	local check_dead = GetEventFlg_("BFG_DEAD_RETURN");

	// 復帰位置のチェック
	if(check_dead == true){
		if(main_num == 2){
			if(city_num >= GetFlagID_("CONST_SS_CI_ESTABLISH_KINGDOM")){
				ChangeMap_("A01_00");
			}
		}
	}

	DebugPrint(" ");
	DebugPrint("NUM_SCENARIO_MAIN の値は " + main_num + " になりました。");
	DebugPrint("NUM_SCENARIO_SUB_CITY の値は " + city_num + " になりました。");

	local door_key_01 = GetEventFlg_("BFG_ELECTRONIC_DOOR_FIRST_GETKEY");
	local door_key_02 = GetEventFlg_("BFG_ELECTRONIC_DOOR_SECOND_GETKEY");
	local door_open_01 = GetEventFlg_("BFG_ELECTRONIC_DOOR_FIRST_OPEN");


//-------------------------------------------------------------------------------------
// イベント地雷
	// 初期化
	Key_01        <- C_NONE_ID;
	Key_02        <- C_NONE_ID;
	door_lock     <- C_NONE_ID;
	west_elevator <- C_NONE_ID;
	east_elevator <- C_NONE_ID;

	// イベント地雷の読込
	// 西エレベーターのマップチェンジ地雷(α仮対応)
	west_elevator = SetPointBoxEventMine_("Mine_Door_03", true);
	// 東エレベーターのマップチェンジ地雷(α仮対応)
	east_elevator = SetPointBoxEventMine_("Mine_Door_02", true);

	// カギ1の取得用
	if(door_key_01 == false){
		Key_01 = SetPointCircleEventMine_("Mine_Key_01", false);
	}
	// カギ2の取得用
	if(door_key_02 == false){
		Key_02 = SetPointCircleEventMine_("Mine_Key_02", false);
	}
	// 西エレベータ付近のドアロックの地雷
	if(door_key_01 == false || door_open_01 == false){
		door_lock = SetPointBoxEventMine_("Mine_Door_01", true);
	}

	DebugPrint("イベント地雷の読込");

//------------------------------------------------------
// ギミック
	if(door_open_01 == false){
		local g_door01 = ReadGimmick_("o_A03_00");
		local door01 = ArrangePointGimmick_("o_A03_00", g_door01, "g_door_03");
	}

	// エレベータの扉(開閉アニメをさせる場合はグローバル変数に変更)
	local elevator_id = ReadGimmick_("o_A03_01");
	local w_elevator = ArrangePointGimmick_("o_A03_01", elevator_id, "g_elevator_01"); // 西エレベータの扉
	local e_elevator = ArrangePointGimmick_("o_A03_01", elevator_id, "g_elevator_02"); // 東エレベータの扉

	// エレベータのリフト
	local lift_id = ReadGimmick_("o_A01_01");
	local w_lift = ArrangePointGimmick_("o_A01_01", lift_id, "g_elevator_lift_01"); // 西エレベータのリフト
	local e_lift = ArrangePointGimmick_("o_A01_01", lift_id, "g_elevator_lift_02"); // 東エレベータのリフト

//-------------------------------------------------------------------------------
//リアクターポイント
	//一般用エレベータ
	reactor_point01 <- ArrangeMsgReactorPoint("reactorPoint_01", GetFlagID_("BFG_REACTER_POINT_022")
		, SHORT_DIST, "REC_POINT_GP_01_01", "REC_POINT_GP_01_02");
	//係員専用エレベータ
	reactor_point02 <- ArrangeMsgReactorPoint("reactorPoint_02", GetFlagID_("BFG_REACTER_POINT_023")
		, SHORT_DIST, "REC_POINT_GP_02_01", "REC_POINT_GP_02_02");
	//セキュリティロック扉
	if(door_open_01 == false){
		local reactor_point03 = ArrangeMsgReactorPoint("reactorPoint_03", GetFlagID_("BFG_REACTER_POINT_024")
			, SHORT_DIST, "REC_POINT_GP_03_01", "REC_POINT_GP_03_02");
	}
	if(door_key_01 == false){
		//セキュリティBカード
		reactor_point04 <- ArrangeMsgReactorPoint("reactorPoint_04", GetFlagID_("BFG_REACTER_POINT_025")
			, SHORT_DIST, "REC_POINT_GP_04_01", "REC_POINT_GP_04_02");
		// 「！」アイコン
		exclamation01 <- ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "reactorPoint_04");  // カードキーB
	}
	if(door_key_02 == false){
		//セキュリティAカード
		reactor_point05 <- ArrangeMsgReactorPoint("reactorPoint_05", GetFlagID_("BFG_REACTER_POINT_027")
			, SHORT_DIST, "REC_POINT_GP_05_01", "REC_POINT_GP_05_02");
		// 「！」アイコン
		exclamation02 <- ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "reactorPoint_05");  // カードキーA
	}

//--------------------------------------------------------
// 重要アイテムのエフェクト(FadeIn()で設定し、EventStartOperate()とTouchEventMine()で削除)
	LoadEffect_("EF300_40_ITEM_SIGN");
	effect_key_01 <- SetPointWorldEffect_("EF300_40_ITEM_SIGN", "Effect_Key_01");
	effect_key_02 <- SetPointWorldEffect_("EF300_40_ITEM_SIGN", "Effect_Key_02");

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
	local main_num   = GetNumFlg_("NUM_SCENARIO_MAIN");
	local city_num   = GetNumFlg_("NUM_SCENARIO_SUB_CITY");

	// ドアキーの取得状態
	local door_key_01 = GetEventFlg_("BFG_ELECTRONIC_DOOR_FIRST_GETKEY");
	local door_key_02 = GetEventFlg_("BFG_ELECTRONIC_DOOR_SECOND_GETKEY");

//---------------------------------------------------------------------------------------
// デモの再生
	// Demo110[カードキーＡを探せ]再生
	if(main_num == 2){
		// エレベーターで２Ｆに着いたら流れる
		if(city_num == GetFlagID_("CONST_SS_CI_EARTHQUAKE")){
			// デモ再生前にフィールドが映らないための対応
			SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
			SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
			WaitFade_();
			// サブフラグを進める( 9 -> 10 )
			SetNumFlg_("NUM_SCENARIO_SUB_CITY", GetFlagID_("CONST_SS_CI_FLOOR_ON_THE_KINGDOM"));
			// デモ終了後の位置を修正
			SetReturnDemoPosDir_(Vec3(-300.935, 0.4, -73.908), -2);
			ChangeDemo_(110);
		}
	}

//-------------------------------------------------------------
//アイコン
	if(door_key_01 == false){
		// 「！」アイコン
		SetNaviMapIconVisible_(exclamation01, true);
	}
	if(door_key_02 == false){
		// 「！」アイコン
		SetNaviMapIconVisible_(exclamation02, true);
	}

//--------------------------------------------------------
// 重要アイテムのエフェクトを削除
	if(door_key_01 == true){
		DeleteEffect_(effect_key_01);
	}
	if(door_key_02 == true){
		DeleteEffect_(effect_key_02);
	}

//-----------------------------------------------------------------------
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
	local main_num   = GetNumFlg_("NUM_SCENARIO_MAIN");
	local city_num   = GetNumFlg_("NUM_SCENARIO_SUB_CITY");

	EventEnd_();
}

//-------------------- イベント地雷 --------------------
//起動条件：マップに配置したメッシュに触れたとき
//-------------------- イベント地雷 --------------------
function TouchEventMine(){
	local target = GetTouchEventMineId_();
	local player = GetPlayerId_();

	DebugPrint("イベント地雷のイベントブロック");

	local main_num = GetNumFlg_("NUM_SCENARIO_MAIN");
	local city_num = GetNumFlg_("NUM_SCENARIO_SUB_CITY");

	// 東エレベーター解禁フラグ
	local unlock_east_elevator = GetEventFlg_("BFG_UNLOCK_EAST_ELEVATOR");
	// カードキー取得フラグ(仮)
	local door_key_01 = GetEventFlg_("BFG_ELECTRONIC_DOOR_FIRST_GETKEY");
	local door_key_02 = GetEventFlg_("BFG_ELECTRONIC_DOOR_SECOND_GETKEY");
	local door_open_01 = GetEventFlg_("BFG_ELECTRONIC_DOOR_FIRST_OPEN");

	switch(target)
	{
	// 西エレベータ
	case west_elevator:
		// 主人公をリアクターポイント01に向ける
		CommPlayerTurnAroundObj(reactor_point01);
		// 地雷削除
		DeleteEventMine_(west_elevator);
		uMoveUpWestEleveter();
		break;
	// 東エレベータ
	case east_elevator:
		// 主人公をリアクターポイント02に向ける
		CommPlayerTurnAroundObj(reactor_point02);
		// 地雷削除
		DeleteEventMine_(east_elevator);
		if(unlock_east_elevator == false){
			SetEventFlg_("BFG_UNLOCK_EAST_ELEVATOR", true);
			PlaySE_("SE_FLD_062");
			Wait_(70);
			CommonMessage("UNLOCK_ELEVATOR");
		}
		uChoiceMoveEastEleveter();
		break;
	// カードキーα
	case Key_01:
		if(door_key_01 == false){
			DeleteEventMine_(Key_01);
			// 主人公をリアクターポイント04に向ける
			CommPlayerTurnAroundObj(reactor_point04);
			// ここでリアクターポイント04を削除
			SetActive_(reactor_point04, false);
			//「！」アイコンを消す
			SetNaviMapIconVisible_(exclamation01, false);
			SetEventFlg_("BFG_ELECTRONIC_DOOR_FIRST_GETKEY", true);
			// 重要アイテムエフェクトを削除
			DeleteEffect_(effect_key_01);
			// アイテム入手処理
			AddItemAndMsg(CARDKEY_A_ID, 1, true);
		}
		break;
	// カードキーβ
	case Key_02:
		if(door_key_02 == false){
			DeleteEventMine_(Key_02);
			// 主人公をリアクターポイント05に向ける
			CommPlayerTurnAroundObj(reactor_point05);
			// ここでリアクターポイント05を削除
			SetActive_(reactor_point05, false);
			//「！」アイコンを消す
			SetNaviMapIconVisible_(exclamation02, false);
			SetEventFlg_("BFG_ELECTRONIC_DOOR_SECOND_GETKEY", true);
			// 重要アイテムエフェクトを削除
			DeleteEffect_(effect_key_02);
			// アイテム入手処理
			AddItemAndMsg(CARDKEY_B_ID, 1, true);
		}
		break;
	// 上層へ行くための階段を封鎖している扉
	case door_lock:
		if(main_num == GetFlagID_("CONST_SM_CITY")){
			if(city_num == GetFlagID_("CONST_SS_CI_FLOOR_ON_THE_KINGDOM")){
				if(door_key_01 == true){
					// ドアロックの地雷を削除
					DeleteEventMine_(door_lock);
					// 主人公を扉の方に向ける
					CommPlayerTurnAroundDir(152);
					// ドアロック解除のSE（仮）
					//PlaySE_("SE_DEM_044");
					// ドアロック解除のメッセージを表示
					OpenMsgWnd_();
					//  メッセージの置き換え
					SetExchangeItemName_(CARDKEY_A_ID);
					ShowMsg_("UNLOCK_DOOR_MESSAGE");
					KeyInputWait_();
					CloseMsgWnd_();
					// サブフラグを進める( 10 -> 11 )
					SetNumFlg_("NUM_SCENARIO_SUB_CITY", GetFlagID_("CONST_SS_CI_UNLOCK_THE_DOOR_1"));
					SetEventFlg_("BFG_ELECTRONIC_DOOR_FIRST_OPEN", true);
					// デモ終了後の位置を修正
					SetReturnDemoPosDir_(Vec3(-285.527, 0.4, -96.226), 151);
					// Demo(仮)125[電子ドアの解除１]
					ChangeDemo_(125);
				}else{
					if(door_open_01 == false){
						// 主人公を扉の方に向ける
						CommPlayerTurnAroundDir(152);
						//  メッセージの置き換え
						SetExchangeItemName_(CARDKEY_A_ID);
						// 扉にロックがかかっているメッセージ
						CommonMessage("LOCK_MESSAGE");
					}
				}
			}
		}
		break;
	default:
		DebugPrint("対応している地雷がありません");
		break;
	}

	EventEnd_();
}

//--------------------------
//  メッセージの表示関数
//--------------------------
function CommonMessage(message_key){
	OpenMsgWnd_();
	ShowMsg_(message_key);
	KeyInputWait_();
	CloseMsgWnd_();
}

//--------------------------
//起動条件：リアクターで調べられたときの本音会話(マインドスキャン)
//--------------------------
function ReactorAnalyze()
{
	EventEnd_();
}

//===========================================================================
// ローカル関数：西エレベータの処理
//---------------------------------------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//===========================================================================
function uMoveUpWestEleveter()
{
	OpenMsgWnd_();
	ShowMsg_("MOVE_WEST_ELEVATOR");
	KeyInputWait_();
	if(GetQueryResult_() == QUERY_YES){
		CloseMsgWnd_();
		// 地雷削除
		DeleteEventMine_(west_elevator);
		// 扉の開閉アニメ(テンポが悪くなるので一旦コメント化<後で「w_elevator」をグローバル変数にする>)
		//SetMotion_(w_elevator, "GIMMICK_1", 4);
		//Wait_(6);
		// エレベータを使用したタイミングでデモを流すタイミングと被った場合フェードの種類を切り替える為のフラグ
		SetEventFlg_("BFG_CHECK_USED_ELEVATER_FADE_OFF", true);
		// エレベータで移動SE
		PlaySE_("SE_FLD_061");
		// キングダム西エレベーターに移動
		ChangeMapPosDir_("A01_00", Vec3(A01_00_RTN_POS_W_X, A01_00_RTN_POS_W_Y, A01_00_RTN_POS_W_Z), RTN_DIR_W);
	}
	else{
		CloseMsgWnd_();
		// 地雷を再設置
		SetPointBoxEventMine_("Mine_Door_03", true);
	}
}

//===========================================================================
// ローカル関数：東エレベータの共通処理
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
		uMoveUpDownWestEleveter();
	}
}

//===========================================================================
// ローカル関数：東エレベータの処理
//---------------------------------------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//===========================================================================
function uMoveUpEastEleveter()
{
	OpenMsgWnd_();
	ShowMsg_("MOVE_EAST_ELEVATOR");
	KeyInputWait_();
	switch(GetQueryResult_())
	{
	// ３０階
	case QUERY3_0:
		CloseMsgWnd_();
		// エレベータを使用したタイミングでデモを流すタイミングと被った場合フェードの種類を切り替える為のフラグ
		SetEventFlg_("BFG_CHECK_USED_ELEVATER_FADE_OFF", true);
		// エレベータで移動SE
		PlaySE_("SE_FLD_061");
		// ３０階に移動
		ChangeMapPosDir_("A03_01", Vec3(A03_01_RTN_POS_E_X, A03_01_RTN_POS_E_Y, A03_01_RTN_POS_E_Z), RTN_DIR_E);
		break;
	// １階(キングダム)
	case QUERY3_1:
		CloseMsgWnd_();
		// エレベータを使用したタイミングでデモを流すタイミングと被った場合フェードの種類を切り替える為のフラグ
		SetEventFlg_("BFG_CHECK_USED_ELEVATER_FADE_OFF", true);
		// エレベータで移動SE
		PlaySE_("SE_FLD_061");
		// １階に移動
		ChangeMapPosDir_("A01_00", Vec3(A01_00_RTN_POS_E_X, A01_00_RTN_POS_E_Y, A01_00_RTN_POS_E_Z), RTN_DIR_E);
		break;
	// やめる(そのまま)
	case QUERY3_2:
		CloseMsgWnd_();
		// 地雷を再設置
		SetPointBoxEventMine_("Mine_Door_02", true);
		break;
	}
}

//===========================================================================
// ローカル関数：東エレベータの地下１階解放後処理
//---------------------------------------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//===========================================================================
function uMoveUpDownWestEleveter()
{
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
	// １階
	case QUERY_1:
		CloseMsgWnd_();
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
		// 地雷を再設置
		SetPointBoxEventMine_("Mine_Door_02", true);
		break;
	}
}

