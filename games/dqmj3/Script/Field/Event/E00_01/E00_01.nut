//===================== 拠点【楽園(室内)】 ====================

// 変数定義
main_num	 <- C_NONE_ID;
op_num		 <- C_NONE_ID;
core_num	 <- C_NONE_ID;

op_num_sub	 <- "NUM_SCENARIO_SUB_OP";
core_num_sub <- "NUM_SCENARIO_SUB_CORE";

//------------------------------------------------
//		戦闘終了後
//------------------------------------------------
function AfterBattle()
{
	// フラグの状態を取得
	main_num = GetNumFlg_("NUM_SCENARIO_MAIN");		// Num0
	op_num	 = GetNumFlg_("NUM_SCENARIO_SUB_OP");	// Num1
	core_num = GetNumFlg_("NUM_SCENARIO_SUB_CORE");	// Num8
	
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
	// フラグの状態を取得
	main_num = GetNumFlg_("NUM_SCENARIO_MAIN");		// Num0
	op_num	 = GetNumFlg_("NUM_SCENARIO_SUB_OP");	// Num1
	core_num = GetNumFlg_("NUM_SCENARIO_SUB_CORE");	// Num8
	
	// 主人公を少年状態にする
	if(main_num == GetFlagID_("CONST_SM_CORE")){	// Num0 = 7
		if(core_num <= GetFlagID_("CONST_SS_CO_TALK_ANSESU_4")){					// Num8 = 5 以下
			SetPlayerBoy(true);	// 少年（主人公）状態
		}
		if(core_num >= GetFlagID_("CONST_SS_CO_CHECK_UP_ANSESU")){					// Num8 = 6 以上
			SetPlayerBoy(false);	// 少年（主人公）状態
		}
	}
	
	EventEnd_();
}

//------------------------------------------------
//		フェードイン
//------------------------------------------------
function FadeIn()
{
	// フラグの状態を取得
	main_num = GetNumFlg_("NUM_SCENARIO_MAIN");		// Num0
	op_num	 = GetNumFlg_("NUM_SCENARIO_SUB_OP");	// Num1
	core_num = GetNumFlg_("NUM_SCENARIO_SUB_CORE");	// Num8
	DebugPrint(" ");
	DebugPrint("NUM_SCENARIO_MAIN の値は " + main_num + " になりました。");
	DebugPrint("NUM_SCENARIO_SUB_OP の値は " + op_num + " になりました。");

	// コアシナリオでの禁止項目
	if(main_num == GetFlagID_("CONST_SM_CORE")){					// Num0 = 7
		SetEventFlg_("BFG_RIDE_INPUT_PROHIBIT", true);				// ライド禁止(Bit435)
		SetEventFlg_("BFG_PLAYERABILITY_RULER_PROHIBIT", true);		// ルーラ禁止(Bit440)
	}else{
		SetEventFlg_("BFG_RIDE_INPUT_PROHIBIT", false);
		SetEventFlg_("BFG_PLAYERABILITY_RULER_PROHIBIT", false);
	}
	
	//-----------------------------------
	// ▼フィールドコマンド解禁状態の設定
	//-----------------------------------
	if(main_num == 0 && op_num == 0){
		AddFieldMenu_(FIELD_COMMAND.TOOL);					//道具（非アクティブ）
		SetEventFlg_("BFG_TOOL_PROHIBIT", true);
		AddFieldMenu_(FIELD_COMMAND.SAVE);					//セーブ（非アクティブ）
		SetEventFlg_("BFG_SAVE_PROHIBIT", true);
		AddFieldMenu_(FIELD_COMMAND.TACTICS);				//作戦（非アクティブ）
		SetEventFlg_("BFG_TACTICS_PROHIBIT", true);
		AddFieldMenu_(FIELD_COMMAND.LUGGAGEOFFICE);			//預かり所（非アクティブ）
		// 預り所を禁止するかどうかはプログラム側で制御するので、ここで禁止フラグを立てない
		AddFieldMenu_(FIELD_COMMAND.SKILLPOINT);			//スキルポイント（非アクティブ）
		SetEventFlg_("BFG_SKILLPOINT_PROHIBIT", true);
		AddFieldMenu_(FIELD_COMMAND.EQUIPACCESSORY);		//アクセサリー装備（非アクティブ）
		SetEventFlg_("BFG_EQUIPACCESSORY_PROHIBIT", true);
		AddFieldMenu_(FIELD_COMMAND.LIBRARY);				//ライブラリ（非アクティブ）
		SetEventFlg_("BFG_LIBRARY_PROHIBIT", true);
		AddFieldMenu_(FIELD_COMMAND.COMMUNICATION);			//通信（非アクティブ）
		SetEventFlg_("BFG_COMMUNICATION_PROHIBIT", true);
		AddFieldMenu_(FIELD_COMMAND.INFORMATION);			//旅の心得（アクティブ）
		SetEventFlg_("BFG_INFORMATION_PROHIBIT", false);
		SetEventFlg_("BFG_TRAVEL_INFO_SHOW_003", true);		// 旅の心得の項目解放フラグ	【基本】移動中のアクション
	}

	// 主人公がリアクターをつけていない状態にする
	if(main_num == 0 && op_num == 0){
		SetEventFlg_("BFG_PUT_OUT_REACTOR", true);
	}

	//---------------
	// ギミックの配置
	//---------------
	// 朝食
	if(main_num == GetFlagID_("CONST_SM_OPENING")){
		local g_breakfast = ReadGimmick_("o_E00_01");
		local breakfast = ArrangePointGimmick_("o_E00_01", g_breakfast, "g_breakfast");
		// アニメの切替(食前と食後)
		if(op_num == GetFlagID_("CONST_SS_OP_BREAKFAST")){
			// 食べる前(GIMMICK_0)
			SetMotion_(breakfast, "GIMMICK_0", 0);
			DebugPrint("朝食のアニメはGIMMICK_0です");
		}
		else{
			// 食べた後(GIMMICK_1)
			SetMotion_(breakfast, "GIMMICK_1", 0);
			DebugPrint("朝食のアニメはGIMMICK_1です");
		}
	}

	//----------
	// ▼NPC配置
	//----------
	// ID初期化
	g_npc_sancho <- C_NONE_ID;
	
	// リソース読み込み
	local id_npc_sancho  = ReadNpc_("n011");	// サンチョ
	
	// ■サンチョ
	// オープニングシナリオ
	if(main_num == GetFlagID_("CONST_SM_OPENING")){
		if(op_num == GetFlagID_("CONST_SS_OP_BREAKFAST")){
			g_npc_sancho = ArrangePointNpc_(id_npc_sancho, "npc_sancho_01");
			SetDir_(g_npc_sancho, 270);	// 向きの調整
			SetTalkEnable_(g_npc_sancho, true);
			SetScaleSilhouette(g_npc_sancho, SCALE.SANCHO_EVENT, SILHOUETTE_WIDTH.SANCHO_EVENT); // サンチョのスケール値を設定
			SetTalkCameraType_(g_npc_sancho, TALK_CAMERA_UP);
		}
	}
	
	
	
	//-----------
	// ▼地雷配置
	//-----------
	// ID初期化
	g_mine_door		 <- C_NONE_ID;
	g_mine_bookshelf <- C_NONE_ID;
	g_mine_bed		 <- C_NONE_ID;
	
	// ■部屋出口付近
	if(main_num == GetFlagID_("CONST_SM_OPENING")){
		if(op_num == GetFlagID_("CONST_SS_OP_BREAKFAST")){
			g_mine_door = SetPointCircleEventMine_("mine_door", false);
		}
	}
	
	// ■本棚
	g_mine_bookshelf = SetPointCircleEventMine_("mine_bookshelf", true);
	
	// ■ベッド
	if(main_num == GetFlagID_("CONST_SM_CORE")){								// Num0 = 7
		g_mine_bed = SetPointCircleEventMine_("mine_bed", true);
	}
	
	
	EventEnd_();
}

//------------------------------------------------
//		フィールド操作開始
//------------------------------------------------
function EventStartOperate()
{
	// フラグの状態を取得
	main_num = GetNumFlg_("NUM_SCENARIO_MAIN");		// Num0
	op_num	 = GetNumFlg_("NUM_SCENARIO_SUB_OP");	// Num1
	core_num = GetNumFlg_("NUM_SCENARIO_SUB_CORE");	// Num8

	local null_point_on = GetEventFlg_("BFG_PARADISE_NULL_POINT_ON");

	DebugPrint(" ");
	DebugPrint("NUM_SCENARIO_MAIN の値は " + main_num + " になりました。");
	DebugPrint("NUM_SCENARIO_SUB_OP の値は " + op_num + " になりました。");

	// マップチェンジNULLの設定(OFFにする)
	if(null_point_on == false){
		SetHitEnableMapChangeNull_("w_E00_00ALdr_004", false);
	}

	// コアのシナリオで再利用するのでデバッグ用の条件を設定しマップチェンジNULLの設定を強制的にONにする
	if(main_num >= GetFlagID_("CONST_SM_GRASSLAND")){
		SetHitEnableMapChangeNull_("w_E00_00ALdr_004", true);
	}

//---------------------------------------------------------------------------------------
// オープニングデモの再生
	if(main_num == GetFlagID_("CONST_SM_OPENING")){
		switch(op_num){
		// Demo001[オープニングデモ①]の再生処理
		case 0:
			SetNumFlg_("NUM_SCENARIO_SUB_OP", GetFlagID_("CONST_SS_OP_VOLCANO"));		// Num1 = 1
			EventStartChangeDemo(1, FADE_COLOR_BLACK);
			break;
		// 新規追加Demo051[ OP③（火山） ]
		case GetFlagID_("CONST_SS_OP_VOLCANO"):
			SetNumFlg_("NUM_SCENARIO_SUB_OP", GetFlagID_("CONST_SS_OP_PRISON"));		// Num1 = 2
			EventStartChangeDemo(51, FADE_COLOR_BLACK);
			break;
		// 新規追加Demo052[ OP③（監獄） ]
		case GetFlagID_("CONST_SS_OP_PRISON"):
			SetNumFlg_("NUM_SCENARIO_SUB_OP", GetFlagID_("CONST_SS_OP_ICE"));			// Num1 = 3
			EventStartChangeDemo(52, FADE_COLOR_BLACK);
			break;
		// 新規追加Demo053[ OP③（氷原） ]
		case GetFlagID_("CONST_SS_OP_ICE"):
			SetNumFlg_("NUM_SCENARIO_SUB_OP", GetFlagID_("CONST_SS_OP_CEMETERY"));		// Num1 = 4
			EventStartChangeDemo(53, FADE_COLOR_BLACK);
			break;
		// 新規追加Demo054[ OP③（霊道） ]
		case GetFlagID_("CONST_SS_OP_CEMETERY"):
			SetNumFlg_("NUM_SCENARIO_SUB_OP", GetFlagID_("CONST_SS_OP_BEGINNING"));		// Num1 = 5
			EventStartChangeDemo(54, FADE_COLOR_BLACK);
			break;
		// Demo003[ OP③（崩落都市）]( 旧Demo002[オープニングデモ②] )の再生処理
		case GetFlagID_("CONST_SS_OP_BEGINNING"):
			SetNumFlg_("NUM_SCENARIO_SUB_OP", GetFlagID_("CONST_SS_OP_ACCIDENT_REACTOR")); // Num1 = 6
			EventStartChangeDemo(3, FADE_COLOR_BLACK);
			break;
		// 新規追加Demo004[ リアクター故障 ]
		case GetFlagID_("CONST_SS_OP_ACCIDENT_REACTOR"):
			SetNumFlg_("NUM_SCENARIO_SUB_OP", GetFlagID_("CONST_SS_OP_AIM_PARADISE"));	// Num1 = 7
			EventStartChangeDemo(4, FADE_COLOR_BLACK);
			break;
		// Demo005[ OP⑤（楽園Map）]( 旧Demo003[オープニングデモ③] )の再生処理
		case GetFlagID_("CONST_SS_OP_AIM_PARADISE"):
			SetNumFlg_("NUM_SCENARIO_SUB_OP", GetFlagID_("CONST_SS_OP_DISPLAY_JOKER"));	// Num1 = 8
			EventStartChangeDemo(5, FADE_COLOR_BLACK);
			break;
		// Demo006[ OP⑥（主人公の家）]( 旧Demo004[オープニングデモ④] )の再生処理
		case GetFlagID_("CONST_SS_OP_DISPLAY_JOKER"):
			SetNumFlg_("NUM_SCENARIO_SUB_OP", GetFlagID_("CONST_SS_OP_BREAKFAST"));		// Num1 = 9
			// プレイヤーアイコン表示
			SetEventFlg_("BFG_NAVIMAP_REACTOR_PLAYER_UNLOCK", true);
			//デモ再生後の復帰場所を設定
			SetReturnDemoMap_("E00_01");
			SetReturnDemoPosDir_(Vec3(60.0, -0.5, -80.0), 315);
			EventStartChangeDemo(6, FADE_COLOR_BLACK);
			break;
		}
	}

	EventEnd_();
}

//------------------------------------------------
//		ＮＰＣ接触時
//------------------------------------------------
function TouchNpc()
{
	// フラグの状態を取得
	main_num = GetNumFlg_("NUM_SCENARIO_MAIN");		// Num0
	op_num	 = GetNumFlg_("NUM_SCENARIO_SUB_OP");	// Num1
	core_num = GetNumFlg_("NUM_SCENARIO_SUB_CORE");	// Num8
	
	local target = GetTargetId_();

	DebugPrint("ID: " + target + " に接触 [TouchNpc]");
	
	switch(target){
	case g_npc_sancho :
		uTalkSancho();	// サンチョと会話
		break;
	default:
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
	// フラグの状態を取得
	main_num = GetNumFlg_("NUM_SCENARIO_MAIN");		// Num0
	op_num	 = GetNumFlg_("NUM_SCENARIO_SUB_OP");	// Num1
	core_num = GetNumFlg_("NUM_SCENARIO_SUB_CORE");	// Num8
	
	local target = GetTouchEventMineId_();

	switch(target){
	case g_mine_door:
		uMineDoor();	// 部屋の出口付近の地雷(mine_door)
		break;
	case g_mine_bookshelf:
		uMineBookshelf();	// 本棚の地雷
		break;
	case g_mine_bed:
		uMineBed();			// ベッドの地雷
		break;
	default:
		DebugPrint("設置していない地雷に触れています。");
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


//++++++++++++++++++++++++++++++++++++++++++++++++
//		サンチョ  会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkSancho()
{
	//---------------------
	// オープニングシナリオ
	//---------------------
	// Demo005[モンスター選択用の質問]の再生後
	if(main_num == GetFlagID_("CONST_SM_OPENING")){
		if(op_num == GetFlagID_("CONST_SS_OP_BREAKFAST")){
			// マップチェンジNULLの設定(ONにする)
			SetEventFlg_("BFG_PARADISE_NULL_POINT_ON", true);
			SetHitEnableMapChangeNull_("w_E00_00ALdr_004", true);
			// 会話
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_SANCHO");
			ShowMsg_("DEMO_004_AFT_SNC_002");				//「ドウゾ 召シアガッテクダサイ。
			KeyInputWait_();
			CloseMsgWnd_();
			// シナリオのサブフラグを進める
			SetNumFlg_("NUM_SCENARIO_SUB_OP", GetFlagID_("CONST_SS_OP_SELECT_MONSTER"));
			// Demo007再生後の主人公の復帰位置
			SetReturnDemoPosDir_(Vec3(50.0, -0.5, 30.0), 270);
			TouchNpcChangeDemo(7);
		}
		else if(op_num == GetFlagID_("CONST_SS_OP_SELECT_MONSTER")){
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_SANCHO");
			ShowMsg_("DEMO_005_AFT_SNC_001");		//「朝食ノ 支度ガ デキテイマス。
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		ドア付近の地雷
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineDoor()
{
	local player = GetPlayerId_();
	
	// メッセージの表示
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_SANCHO");
	ShowMsg_("DEMO_004_AFT_SNC_001");				//「朝食ノ 後片付ケヲ シテオリマス。
	KeyInputWait_();
	// ウィンドウを閉じる
	CloseMsgWnd_();
	// 出口と逆方向に向ける
	SetDirToPos_(player, Vec3(0.0, 0.0, 65.0));
	CommPlayerTurnMoveDirWalk(180);
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		食堂付近の地雷
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineDining()
{
	local player = GetPlayerId_();
	
	// マップチェンジNULLの設定(ONにする)
	SetEventFlg_("BFG_PARADISE_NULL_POINT_ON", true);
	SetHitEnableMapChangeNull_("w_E00_00ALdr_004", true);
	// 主人公をテーブルに向ける
	Task_RotateToPos_(player, Vec3(39.5, 0.0, 41.5), ROTATE_EVENT_DEF);
	// サンチョを主人公のいる方向に向ける
	Task_RotateToPos_(g_npc_sancho, GetPos_(player), ROTATE_EVENT_DEF);
	// 会話
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_SANCHO");
	ShowMsg_("DEMO_004_AFT_SNC_002");				//「ドウゾ 召シアガッテクダサイ。
	KeyInputWait_();
	CloseMsgWnd_();
	// シナリオのサブフラグを進める
	SetNumFlg_("NUM_SCENARIO_SUB_OP", GetFlagID_("CONST_SS_OP_SELECT_MONSTER"));
	// Demo007再生後の主人公の復帰位置
	SetReturnDemoPosDir_(Vec3(50.0, -0.5, 30.0), 270);
	// Demo007[モンスター選択用の質問]を再生
	ChangeDemo_(7);
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		本棚の地雷
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineBookshelf()
{
	// 主人公を本棚に向ける
	local bookshelf_dir = 180;
	CommPlayerTurnAroundDir(bookshelf_dir);
	// メッセージの表示
	OpenMsgWnd_();
	ShowMsg_("BOOKSHELF_MESSAGE");
	KeyInputWait_();
	CloseMsgWnd_();
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		ベッドの地雷
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineBed()
{
	// 暗転明けの主人公の復帰位置と向きを設定する
	local re_pos = Vec3(71.5, 0.0, -75.6);	// 復帰位置を指定
	local re_dir = 169;						// 向きを指定

	// 主人公を本棚に向ける
	local bed_dir = 175;
	CommPlayerTurnAroundDir(bed_dir);
	
	// メッセージの表示
	OpenMsgWnd_();
	ShowMsg_("MINE_BED_CORE_010");			// ベッドを使って  休めそうだ。
	KeyInputWait_();

	// 休む場合
	if(GetQueryResult_() == QUERY_YES){
		// 休む処理
		CloseMsgWnd_();
		// 宿屋の共通の回復処理
		CommTaskInn(re_pos, re_dir, false, g_mine_bed);
		// メッセージの表示
		OpenMsgWnd_();
		ShowMsg_("MINE_BED_CORE_020");		// ベッドで休んで  元気になった！
		KeyInputWait_();
		CloseMsgWnd_();
	}
	// やめる場合
	else{
		ShowMsg_("MINE_BED_CORE_030");		// ベッドを 使うことをやめた。
		KeyInputWait_();
		CloseMsgWnd_();
	}
}

