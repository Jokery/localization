//===================== G01_00ネオンパーク ====================


//------------------------------------------------
//		戦闘終了後
//------------------------------------------------
function AfterBattle()
{
	// フラグの状態を取得
	local main_num  = GetNumFlg_("NUM_SCENARIO_MAIN");			// Num0
	local grave_num = GetNumFlg_("NUM_SCENARIO_SUB_GRAVE");		// Num4
	
	/*
		処理なし
	*/
	
	EventEnd_();
}


//------------------------------------------------
//		フェードイン
//------------------------------------------------
function FadeIn()
{
	//マップ到達フラグ
	SetEventFlg_("BFG_ARRIVE_AT_G01", true);
	// ルーラポイント
	SetEventFlg_("BFG_RULER_ADD_007", true);//ネオンパーク南口

	// フラグの状態を取得
	local main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");						// Num0
	local grave_num	 = GetNumFlg_("NUM_SCENARIO_SUB_GRAVE");				// Num4
	local gost_a_num = GetNumFlg_("NUM_FLG_TRACKING_GHOST_STATE");			// Num127

	//-------------------------
	// ▼マップチェンジNULL操作
	//-------------------------
	// ■北口のマップチェンジNULL
	if(grave_num == GetFlagID_("CONST_SS_CC_GO_TO_THE_NEON_PARK")){			// Num4 = 1
		SetHitEnableMapChangeNull_("w_G00_00BLdr_005", false);
	}else{
		SetHitEnableMapChangeNull_("w_G00_00BLdr_005", true);
	}
	
	//-------------
	// ▼時間の設定
	//-------------
	if(main_num == GetFlagID_("CONST_SM_CEMETERY")){						// Num0 = 3
		if(grave_num <= GetFlagID_("CONST_SS_CC_GET_RACE_PROGRAM")){		// Num4 = 17 以下
			// シナリオ進行中は夜（瘴気）に設定
			SetTime_(8700);
		}
	}
	
	DebugPrint(" ");
	DebugPrint("NUM_SCENARIO_MAIN の値は " + main_num + " になりました。");


	//----------
	// ▼NPC配置
	//----------
	// ID初期化
	g_inn		 <- C_NONE_ID;
	g_item		 <- C_NONE_ID;
	g_neon_a	 <- C_NONE_ID;
	g_neon_b	 <- C_NONE_ID;
	g_neon_c	 <- C_NONE_ID;
	g_neon_d	 <- C_NONE_ID;
	g_gost_a	 <- C_NONE_ID;
	g_gost_g	 <- C_NONE_ID;
	g_ice		 <- C_NONE_ID;

	// リソース読み込み
	local id_neon1 = ReadNpc_("m047_01");	// ネオンパーク住民1(インキュバス)
	local id_neon2 = ReadNpc_("m013_01");	// ネオンパーク住民2(ドラゴンバケージ)
	local id_gost  = ReadNpc_("m100_01");	// モンスターの幽霊
	local id_ice   = ReadNpc_("m035_00");	// 西ポーラパーク住民

	// ■ネオンパーク住民A(ドラゴンバケージ)
	g_neon_a  = ArrangePointNpc_(id_neon2,  "npc_neon_A");
	SetScaleSilhouette(g_neon_a, SCALE.N, SILHOUETTE_WIDTH.N);	// サイズの設定
	SetReactorMsg_(g_neon_a, "GRAVE_NPC_02_REC");
	
	// ■ネオンパーク住民B(インキュバス)
	g_neon_b  = ArrangePointNpc_(id_neon1,  "npc_neon_B");
	SetSearchableAngle_(g_neon_b, SEARCHABLE_ANGLE_WIDE);		// 会話可能角度を設定
	SetReactorMsg_(g_neon_b, "GRAVE_NPC_01_REC");
	SetScaleSilhouette(g_neon_b, SCALE.N, SILHOUETTE_WIDTH.N);
	
	// ■ネオンパーク住民C(インキュバス)
	g_neon_c  = ArrangePointNpc_(id_neon1,  "npc_neon_C");
	SetSearchableAngle_(g_neon_c, SEARCHABLE_ANGLE_WIDE);		// 会話可能角度を設定
	SetReactorMsg_(g_neon_c, "GRAVE_NPC_01_REC");
	SetScaleSilhouette(g_neon_c, SCALE.N, SILHOUETTE_WIDTH.N);
	
	// ■ネオンパーク住民D(ドラゴンバケージ)
	g_neon_d  = ArrangePointNpc_(id_neon2,  "npc_neon_D");
	SetScaleSilhouette(g_neon_d, SCALE.N, SILHOUETTE_WIDTH.N);
	SetReactorMsg_(g_neon_d, "GRAVE_NPC_02_REC");
	
	// ■宿屋(インキュバス)
	g_inn  = ArrangePointNpc_(id_neon1,  "npc_neon_inn");
	SetSearchableAngle_(g_inn, SEARCHABLE_ANGLE_MINIMUM);		// 正面30度から 話しかけ可能
	SetScaleSilhouette(g_inn, SCALE.N, SILHOUETTE_WIDTH.N);
	SetReactorMsg_(g_inn, "GRAVE_NPC_01_REC");
	SetTalkCameraType_(g_inn, TALK_CAMERA_UP);					// カメラの設定
	
	// ■道具屋(ドラゴンバケージ)
	g_item  = ArrangePointNpc_(id_neon2,  "npc_neon_item");
	SetSearchableAngle_(g_item, SEARCHABLE_ANGLE_MINIMUM);		// 正面30度から 話しかけ可能
	SetReactorMsg_(g_item, "GRAVE_NPC_02_REC");
	SetScaleSilhouette(g_item, SCALE.N, SILHOUETTE_WIDTH.N);
	SetTalkCameraType_(g_item, TALK_CAMERA_UP);					// カメラの設定
	SetTalkCameraEyeOffset_(g_item, 3.0, 0.0);					// カメラの位置の調整
	
	// ■西ポーラパーク住民
	g_ice  = ArrangePointNpc_(id_ice,  "npc_ice_01");				// 西ポーラパーク住民D
	SetScaleSilhouette(g_ice, SCALE.S, SILHOUETTE_WIDTH.S);			// サイズの設定
	SetReactorMsg_(g_ice, "GRAVE_NPC_ICE_REC");
	
	
	// ■幽霊(霊道シナリオクリア前)
	if(main_num == GetFlagID_("CONST_SM_CEMETERY")){						// Num0 = 3
		if(grave_num == GetFlagID_("CONST_SS_CC_GO_TO_THE_NEON_PARK")){		// Num4 = 1
			if(gost_a_num <= 2){
				g_gost_a  = ArrangePointNpc_(id_gost, "npc_neon_gost_01");	// モンスターの幽霊A
				SetScaleSilhouette(g_gost_a, SCALE.S, SILHOUETTE_WIDTH.S);
				//見えないように地面に埋める
				SetPosNoFit_(g_gost_a, Vec3(14.0, -50.0, -49.0));
			}
			if(gost_a_num == 3){
				g_gost_a  = ArrangePointNpc_(id_gost, "npc_neon_gost_A");	// モンスターの幽霊A
				SetScaleSilhouette(g_gost_a, SCALE.S, SILHOUETTE_WIDTH.S);
			}
		}
		//暗証番号を知った後、西ポーラパーク住民は居なくなる
//		if(grave_num <= GetFlagID_("CONST_SS_CC_TAKE_OVER_VOLITION_2")){	// Num4 = 15 以下
//			g_ice  = ArrangePointNpc_(id_ice,  "npc_ice_01");				// 西ポーラパーク住民D
//			SetScaleSilhouette(g_ice, SCALE.S, SILHOUETTE_WIDTH.S);			// サイズの設定
//			SetReactorMsg_(g_ice, "GRAVE_NPC_ICE_REC");
//		}
		//モンスターの幽霊Aと会話した後、暗証番号を知るまでモンスターの幽霊Aの配置
		if(grave_num >= GetFlagID_("CONST_SS_CC_FIND_THE_GHOST")			// Num4 = 2  以上
		&& grave_num <= GetFlagID_("CONST_SS_CC_TAKE_OVER_VOLITION_2")){	// Num4 = 15 以下
			g_gost_a  = ArrangePointNpc_(id_gost,  "npc_neon_gost_A");		// モンスターの幽霊A
			SetScaleSilhouette(g_gost_a, SCALE.S, SILHOUETTE_WIDTH.S);
			SetReactorMsg_(g_gost_a, "GRAVE_NPC_GOST_REC");
		}
		//暗証番号を知った後、モンスターの幽霊Gの配置
		if(grave_num >= GetFlagID_("CONST_SS_CC_GET_RACE_PROGRAM")){		// Num4 = 17 以上
			g_gost_g  = ArrangePointNpc_(id_gost,  "npc_neon_gost_A");		// モンスターの幽霊G
			SetScaleSilhouette(g_gost_g, SCALE.S, SILHOUETTE_WIDTH.S);
			SetReactorMsg_(g_gost_g, "GRAVE_NPC_GOST_REC");
		}
	}
	// 幽霊(霊道シナリオクリア後)
	if(main_num >= GetFlagID_("CONST_SM_ICE_FIELD")){						// Num0 = 4 以上
		g_gost_g  = ArrangePointNpc_(id_gost,  "npc_neon_gost_A");			// モンスターの幽霊G
		SetScaleSilhouette(g_gost_g, SCALE.S, SILHOUETTE_WIDTH.S);
		SetReactorMsg_(g_gost_g, "GRAVE_NPC_GOST_REC");
	}

	//-----------
	// ▼地雷配置
	//-----------
	// ID初期化
	g_mine_gost_event	 <- C_NONE_ID;
	g_mine_dont_exit	 <- C_NONE_ID;
	
	// ■幽霊イベント開始用地雷
	if(main_num == GetFlagID_("CONST_SM_CEMETERY")){						// Num0 = 3
		if(gost_a_num == 0){
			g_mine_gost_event = SetPointBoxEventMine_("mine_gost_event", false);
		}
	}
	
	// ■幽霊イベント終了まで外に出られない地雷
	if(main_num == GetFlagID_("CONST_SM_CEMETERY")){						// Num0 = 3
		if(grave_num <= GetFlagID_("CONST_SS_CC_GO_TO_THE_NEON_PARK")){		// Num4 = 1以下
			g_mine_dont_exit = SetPointBoxEventMine_("mine_dont_exit", false);
		}
	}
	
	DebugPrint("イベント地雷の読込");


	//---------------------
	// ▼リアクターポイント
	//---------------------
	// ID初期化
	g_reactor_point_a_1 <- C_NONE_ID;
	g_reactor_point_a_2 <- C_NONE_ID;
	g_reactor_point_a_3 <- C_NONE_ID;
	
	if(main_num == GetFlagID_("CONST_SM_CEMETERY")){						// Num0 = 3
		// ■モンスターの幽霊A（1回目）
		if(gost_a_num == 1){
			g_reactor_point_a_1 = ArrangePointReactorPoint_("reactorPoint_a_1", SHORT_DIST);
			SetReactorMarkerTypeHide_(g_reactor_point_a_1, true);// リアクターのマーカータイプを変更
			SetReactorEvent_(g_reactor_point_a_1);
		}
		// ■モンスターの幽霊A（2回目）
		if(gost_a_num == 2){
			g_reactor_point_a_2 = ArrangePointReactorPoint_("reactorPoint_a_2", SHORT_DIST);
			SetReactorEvent_(g_reactor_point_a_2);
		}
		// ■モンスターの幽霊A（3回目）
		if(gost_a_num == 3){
			g_reactor_point_a_3 = ArrangePointReactorPoint_("reactorPoint_a_3", SHORT_DIST);
			SetReactorEvent_(g_reactor_point_a_3);
		}
	}
	
	// ネオンアート
	local rec_point_art = ArrangeMsgReactorPoint("rec_point_art", GetFlagID_("BFG_REACTER_POINT_065")// Bit_1564
		, SHORT_DIST, "REC_POINT_NEON_010", "REC_POINT_NEON_011");
	
	// 道具屋
	local rec_point_item = ArrangeMsgReactorPoint("rec_point_item", GetFlagID_("BFG_REACTER_POINT_066")// Bit_1565
		, SHORT_DIST, "REC_POINT_ITEM_010", "REC_POINT_ITEM_011");
	
	// 宿屋
	local rec_point_inn = ArrangeMsgReactorPoint("rec_point_inn", GetFlagID_("BFG_REACTER_POINT_067")// Bit_1566
		, SHORT_DIST, "REC_POINT_INN_010", "REC_POINT_INN_011");
	
	// 正門扉
	local rec_point_seimon = ArrangeMsgReactorPoint("rec_point_seimon", GetFlagID_("BFG_REACTER_POINT_068")// Bit_1567
		, SHORT_DIST, "REC_POINT_SEIMON_010", "REC_POINT_SEIMON_011");
	
	// 裏門扉
	local rec_point_uramon = ArrangeMsgReactorPoint("rec_point_uramon", GetFlagID_("BFG_REACTER_POINT_069")// Bit_1568
		, SHORT_DIST, "REC_POINT_URAMON_010", "REC_POINT_URAMON_011");
	
	
	
	EventEnd_();
}


//------------------------------------------------
//		イベントスタート
//------------------------------------------------
function EventStartOperate()
{
	// フラグの状態を取得
	local main_num  = GetNumFlg_("NUM_SCENARIO_MAIN");				// Num0
	local grave_num = GetNumFlg_("NUM_SCENARIO_SUB_GRAVE");			// Num4
	//モンスターの幽霊Aフラグ
	local gost_a_num = GetNumFlg_("NUM_FLG_TRACKING_GHOST_STATE");	// Num127
	
	// ■モンスターの幽霊A
	if(main_num == GetFlagID_("CONST_SM_CEMETERY")){						// Num0 = 3
		if(grave_num >= GetFlagID_("CONST_SS_CC_GO_TO_THE_NEON_PARK")		// Num4 = 1  以上
		&& grave_num <= GetFlagID_("CONST_SS_CC_TAKE_OVER_VOLITION_2")){	// Num4 = 15 以下
			//モンスターの幽霊Aを半透明にする
			SetManualCalcAlpha_(g_gost_a, true);
			SetAlpha_(g_gost_a, 0.3);
		}
	}
	// ■モンスターの幽霊G
	// 霊道シナリオクリア前
	if(main_num >= GetFlagID_("CONST_SM_CEMETERY")){						// Num0 = 3
		if(grave_num >= GetFlagID_("CONST_SS_CC_GET_RACE_PROGRAM")){		// Num4 = 17 以上
			//モンスターの幽霊Gを半透明にする
			SetManualCalcAlpha_(g_gost_g, true);
			SetAlpha_(g_gost_g, 0.3);
		}
	}
	// 霊道シナリオクリア後
	if(main_num >= GetFlagID_("CONST_SM_ICE_FIELD")){						// Num0 = 4 以上
		//モンスターの幽霊Gを半透明にする
		SetManualCalcAlpha_(g_gost_g, true);
		SetAlpha_(g_gost_g, 0.3);
	}
	//-------------
	// ▼デモの再生
	//-------------
	if(main_num == GetFlagID_("CONST_SM_CEMETERY")){						// Num0 = 3
		//はじめてネオンパークに入った時のデモ
		if(grave_num == 0){																		// Num4 = 0
			SetNumFlg_("NUM_SCENARIO_SUB_GRAVE", GetFlagID_("CONST_SS_CC_GO_TO_THE_NEON_PARK"));// Num4 = 1
			// デモの復帰位置をデモの完成後に設定します
			SetReturnDemoPosDir_(Vec3(10.091, -1.125, 153.404), -179);
			//201[ネオンパークの裏路地より]
			EventStartChangeDemo(201, FADE_COLOR_BLACK);
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
	local main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");				//Num0
	local grave_num	 = GetNumFlg_("NUM_SCENARIO_SUB_GRAVE");		//Num4
	local gost_a_num = GetNumFlg_("NUM_FLG_TRACKING_GHOST_STATE");	//Num127
	local target	 = GetTargetId_();

	DebugPrint("ID: " + target + " に接触 [TouchNpc]");
	
	switch(target){
	case g_neon_a :		// ネオンパーク住民A(ドラゴンバケージ)
		uTalkNeonA();
		break;
	case g_neon_b :		// ネオンパーク住民B(インキュバス)
		uTalkNeonB();
		break;
	case g_neon_c :		// ネオンパーク住民C(インキュバス)
		uTalkNeonC();
		break;
	case g_neon_d :		// ネオンパーク住民D(ドラゴンバケージ)
		uTalkNeonD();
		break;
	case g_ice :		// 西ポーラパーク住民
		uTalkIce();
		break;
	case g_item :		// 道具屋
		uTalkItem();
		break;
	case g_inn :		// 宿屋
		uTalkInn();
		break;
	case g_gost_a :		// モンスターの幽霊A
		uTalkMonsterA();
		break;
	case g_gost_g :		// モンスターの幽霊G
		uTalkMonsterG();
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
function TouchEventMine(){
	local main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");				//Num0
	local grave_num	 = GetNumFlg_("NUM_SCENARIO_SUB_GRAVE");		//Num4
	local target	 = GetTouchEventMineId_();
	local player	 = GetPlayerId_();
	//モンスターの幽霊Aフラグ
	local gost_a_num = GetNumFlg_("NUM_FLG_TRACKING_GHOST_STATE");	//Num127

	switch (target) {
	case g_mine_gost_event :	//リアクターで幽霊を探知する地雷
		uMineGost();
		break;
	case g_mine_dont_exit :		//幽霊探しイベント終了まで街から出られないようにする地雷
		uMineDontExit();
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
// フラグの状態を取得
	local main_num  = GetNumFlg_("NUM_SCENARIO_MAIN");				//Num0
	local grave_num = GetNumFlg_("NUM_SCENARIO_SUB_GRAVE");			//Num4

	// NPCの種類を取得
	local target = GetTargetId_();
	//モンスターの幽霊Aフラグ
	local gost_a_num = GetNumFlg_("NUM_FLG_TRACKING_GHOST_STATE");	//Num127
	
	// モンスターの幽霊Aを追いかけるイベント
	switch (target) {
	case g_reactor_point_a_1 :	// 1回目
		uGostEvent(gost_a_num);
		break;
	case g_reactor_point_a_2 :	// 2回目
		uGostEvent(gost_a_num);
		break;
	case g_reactor_point_a_3 :	// 3回目
		uGostEvent(gost_a_num);
		break;
	default :
		break;
	}
	
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
//		宿屋のメッセージ処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uInnMessage()
{
	// 暗転明けの主人公の復帰位置と向きを設定する
	local re_pos = Vec3(-15.484, 0.000, -73.408);	// 復帰位置を指定
	local re_dir = -90;								// 向きを指定
	// メッセージキーの初期化
	local message_key_1 = 0;	// メッセージキー(選択肢を表示するメッセージ)
	local message_key_2 = 0;	// メッセージキー(やめる場合のメッセージ)
	local message_key_3 = 0;	// メッセージキー(利用した場合のメッセージ)
	// 霊道のクリアフラグ
	local clear_flag	= GetEventFlg_("BFG_SCENARIO_CLEAR_GRAVE");

	if(clear_flag == true){
		if(GetEventFlg_("BFG_CHECK_INN_FIRST_MSG_ALL") == false){
			// 霊道クリア後の宿屋で表示するメッセージを指定(初回)
			message_key_1 = "INN_MSG_001";
			message_key_2 = "INN_MSG_002";
			message_key_3 = "INN_MSG_003";
		}
		else{
			// 霊道クリア後の宿屋で表示するメッセージを指定(２回目以降)
			message_key_1 = "INN_MSG_004";
			message_key_2 = "INN_MSG_005";
			message_key_3 = "INN_MSG_006";
		}
		SetEventFlg_("BFG_CHECK_INN_FIRST_MSG_ALL", true);
		// メッセージの表示「やぁ いらっしゃい…
		OpenMsgWnd_();
		ShowMsg_(message_key_1);
		KeyInputWait_();
		switch(GetQueryResult_())
		{
		case QUERY3_0:
		case QUERY3_1:
		// 泊まる処理
		// 休む処理
			CloseMsgWnd_();
			// 宿屋の共通の回復処理
			CommTaskInn(re_pos, re_dir, clear_flag, g_inn);
			// メッセージの表示「おはよーだっちょ…
			OpenMsgWnd_();
			ShowMsg_(message_key_3);
			KeyInputWait_();
			CloseMsgWnd_();
			break;
		case QUERY3_2:
		// やめる処理
			// メッセージの表示「わかったっちょ…
			ShowMsg_(message_key_2);
			KeyInputWait_();
			CloseMsgWnd_();
			break;
		}
	}
	else{
		// 霊道クリア前の宿屋で表示するメッセージを指定
		message_key_1 = "INN_MSG_1ST_001";
		message_key_2 = "INN_MSG_1ST_002";
		message_key_3 = "INN_MSG_1ST_003";

		// メッセージの表示「やぁ いらっしゃい…
		OpenMsgWnd_();
		ShowMsg_(message_key_1);
		KeyInputWait_();
		CloseMsgWnd_();

		switch(GetQueryResult_()){
		case QUERY2_0:
		// 泊まる処理
			// 宿屋の共通の回復処理
			CommTaskInn(re_pos, re_dir, clear_flag, g_inn);
			// メッセージの表示「おはよーだっちょ…
			OpenMsgWnd_();
			ShowMsg_(message_key_3);
			KeyInputWait_();
			CloseMsgWnd_();
			break;
		case QUERY2_1:
		// やめる処理
			// メッセージの表示「わかったっちょ…
			OpenMsgWnd_();
			ShowMsg_(message_key_2);
			KeyInputWait_();
			CloseMsgWnd_();
			break;
		}
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		ネオンパーク住民A（g_neon_a）の話す内容
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkNeonA()
{
	local main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");				//Num0
	local grave_num	 = GetNumFlg_("NUM_SCENARIO_SUB_GRAVE");		//Num4
	local sky_num	 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");			//Num9
	
	// 霊道シナリオ開始～ブンドルド撃破まで
	if(main_num == GetFlagID_("CONST_SM_CEMETERY")){								// Num0 = 3
		if(grave_num <= GetFlagID_("CONST_SS_CC_GO_TO_THE_NEON_PARK")){				// Num4 = 1 以下
			uMessage("DEMO_201_AFT_NPC_A");			//「その格好……あんた　レジスタンスだな？
		}
		// 幽霊と出会ってからブンドルド撃破後まで
		else if(grave_num <= GetFlagID_("CONST_SS_CC_GO_TO_THE_NEXT_TRANSFER")){	// Num4 = 16 以下
			uMessage("DEMO_202_AFT_NPC_A");			//「北にある　アンデッドガーデンはね
		}
		// ブンドルド撃破後
		else if(grave_num <= GetFlagID_("CONST_SS_CC_CLEAR_CEMETERY")){				// Num4 = 18 以下
			uMessage("DEMO_213_AFT_NPC_A");			//「止まっていた移動装置が　動きだしたんだ。
		}
	}
	// 霊道シナリオクリア後～ガルビルス撃破前まで
	else if(main_num <= GetFlagID_("CONST_SM_CORE")){								// Num0 = 7 以下
		uMessage("DEMO_213_AFT_NPC_A");				//「止まっていた移動装置が　動きだしたんだ。
	}
	// ガルビルス撃破後～巨大ブンドルド撃破前まで
	else if(main_num == GetFlagID_("CONST_SM_SKY")){								// Num0 = 8
		if(sky_num <= GetFlagID_("CONST_SS_SK_JDG_REMATCH_G_BUNDORUDO")){			// Num9 = 23 以下
			uMessage("NPC_A_GARUBIRUSU_WIN_010");	//「まるで　呪われてるみたいな　空の色だ。
		}
		// 巨大ブンドルド撃破後～表シナリオクリアまで
		else if(sky_num <= GetFlagID_("CONST_SS_SK_DATA_SAVED")){					// Num9 = 58 以下
			uMessage("NPC_A_BIG_BUNDORUDO_WIN_010");//「でかいブンドルドが　空の上に　いたとはね。
		}
	}
	// 表シナリオクリア後
	else if(main_num >= GetFlagID_("CONST_SM_INSIDE_CLEAR")){						// Num0 = 9 以上
		uMessage("NPC_A_ALL_CLEAR_010");			//「おっ　モンスターマスターの　兄ちゃんか。
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		ネオンパーク住民B（g_neon_b）の話す内容
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkNeonB()
{
	local main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");				//Num0
	local grave_num	 = GetNumFlg_("NUM_SCENARIO_SUB_GRAVE");		//Num4
	local sky_num	 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");			//Num9
	
	// 霊道シナリオ開始～ブンドルド撃破まで
	if(main_num == GetFlagID_("CONST_SM_CEMETERY")){								// Num0 = 3
		if(grave_num <= GetFlagID_("CONST_SS_CC_GO_TO_THE_NEXT_TRANSFER")){			// Num4 = 16 以下
			uMessage("DEMO_201_AFT_NPC_B");			//「レジスタンスに　ルキヤって技術者がいてよ？
		// ブンドルド撃破後
		}else if(grave_num <= GetFlagID_("CONST_SS_CC_CLEAR_CEMETERY")){			// Num4 = 18 以下
			uMessage("DEMO_213_AFT_NPC_B");			//「移動装置が　動くようになったのか。
		}
	}
	// 霊道シナリオクリア後～ガルビルス撃破前まで
	else if(main_num <= GetFlagID_("CONST_SM_CORE")){								// Num0 = 7 以下
		uMessage("DEMO_213_AFT_NPC_B");				//「移動装置が　動くようになったのか。
	}
	// ガルビルス撃破後～巨大ブンドルド撃破前まで
	else if(main_num == GetFlagID_("CONST_SM_SKY")){								// Num0 = 8
		if(sky_num <= GetFlagID_("CONST_SS_SK_JDG_REMATCH_G_BUNDORUDO")){			// Num9 = 23 以下
			uMessage("NPC_B_GARUBIRUSU_WIN_010");	//「移動装置が　また止まっちまったんだ。
		}
		// 巨大ブンドルド撃破後～表シナリオクリアまで
		else if(sky_num <= GetFlagID_("CONST_SS_SK_DATA_SAVED")){					// Num9 = 58 以下
			uMessage("NPC_B_BIG_BUNDORUDO_WIN_010");//「歓楽の霊道を覆っていた　黒い花粉は消えたか。
		}
	}
	// 表シナリオクリア後
	else if(main_num >= GetFlagID_("CONST_SM_INSIDE_CLEAR")){						// Num0 = 9 以上
		uMessage("NPC_B_ALL_CLEAR_010");			//「こうも平和が続くと　ちょっと退屈だな。
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		ネオンパーク住民C（g_neon_c）の話す内容
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkNeonC()
{
	local main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");				//Num0
	local grave_num	 = GetNumFlg_("NUM_SCENARIO_SUB_GRAVE");		//Num4
	local sky_num	 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");			//Num9
	
	// 霊道シナリオ開始～ブンドルド撃破まで
	if(main_num == GetFlagID_("CONST_SM_CEMETERY")){								// Num0 = 3
		if(grave_num <= GetFlagID_("CONST_SS_CC_GO_TO_THE_NEON_PARK")){				// Num4 = 1 以下
			uMessage("DEMO_201_AFT_NPC_C");			//「ここは　ネオンパーク。
		}
		// 幽霊と出会ってからブンドルド撃破後まで
		else if(grave_num <= GetFlagID_("CONST_SS_CC_GO_TO_THE_NEXT_TRANSFER")){	// Num4 = 16 以下
			uMessage("DEMO_202_AFT_NPC_C");			//「ブンドルドは　すごい　強い魔物なのに
		}
		// ブンドルド撃破後
		else if(grave_num <= GetFlagID_("CONST_SS_CC_CLEAR_CEMETERY")){			// Num4 = 18 以下
			uMessage("DEMO_213_AFT_NPC_C");			//「ブンドルドの奴が　いなくなったおかげで
		}
	}
	// 霊道シナリオクリア後～ガルビルス撃破前まで
	else if(main_num <= GetFlagID_("CONST_SM_CORE")){								// Num0 = 7 以下
		uMessage("DEMO_213_AFT_NPC_C");				//「ブンドルドの奴が　いなくなったおかげで
	}
	// ガルビルス撃破後～巨大ブンドルド撃破前まで
	else if(main_num == GetFlagID_("CONST_SM_SKY")){								// Num0 = 8
		if(sky_num <= GetFlagID_("CONST_SS_SK_JDG_REMATCH_G_BUNDORUDO")){			// Num9 = 23 以下
			uMessage("NPC_C_GARUBIRUSU_WIN_010");	//「せっかく　ブンドルドがいなくなって
		}
		// 巨大ブンドルド撃破後～表シナリオクリアまで
		else if(sky_num <= GetFlagID_("CONST_SS_SK_DATA_SAVED")){					// Num9 = 58 以下
			uMessage("NPC_C_BIG_BUNDORUDO_WIN_010");//「やあ　あんたのおかげで
		}
	}
	// 表シナリオクリア後
	else if(main_num >= GetFlagID_("CONST_SM_INSIDE_CLEAR")){						// Num0 = 9 以上
		uMessage("NPC_C_ALL_CLEAR_010");			//「空に　浮かんでいるコアを
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		ネオンパーク住民D（g_neon_d）の話す内容
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkNeonD()
{
	local main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");				//Num0
	local grave_num	 = GetNumFlg_("NUM_SCENARIO_SUB_GRAVE");		//Num4
	local sky_num	 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");			//Num9
	
	// 霊道シナリオ開始～ブンドルド撃破まで
	if(main_num == GetFlagID_("CONST_SM_CEMETERY")){								// Num0 = 3
		if(grave_num <= GetFlagID_("CONST_SS_CC_GO_TO_THE_NEXT_TRANSFER")){			// Num4 = 16 以下
			uMessage("DEMO_201_AFT_NPC_D");			//「最近……どーも妙なことが　起こるんだよな。
		// ブンドルド撃破後
		}else if(grave_num <= GetFlagID_("CONST_SS_CC_CLEAR_CEMETERY")){			// Num4 = 18 以下
			uMessage("DEMO_213_AFT_NPC_D");			//「ブンドルドが　いなくなってから
		}
	}
	// 霊道シナリオクリア後～ガルビルス撃破前まで
	else if(main_num <= GetFlagID_("CONST_SM_CORE")){								// Num0 = 7 以下
		uMessage("DEMO_213_AFT_NPC_D");				//「ブンドルドが　いなくなってから
	}
	// ガルビルス撃破後～巨大ブンドルド撃破前まで
	else if(main_num == GetFlagID_("CONST_SM_SKY")){								// Num0 = 8
		if(sky_num <= GetFlagID_("CONST_SS_SK_JDG_REMATCH_G_BUNDORUDO")){			// Num9 = 23 以下
			uMessage("NPC_D_GARUBIRUSU_WIN_010");	//「よその土地も　あの黒い花粉で
		}
		// 巨大ブンドルド撃破後～表シナリオクリアまで
		else if(sky_num <= GetFlagID_("CONST_SS_SK_DATA_SAVED")){					// Num9 = 58 以下
			uMessage("NPC_D_BIG_BUNDORUDO_WIN_010");//「黒い花粉は　消えけど
		}
	}
	// 表シナリオクリア後
	else if(main_num >= GetFlagID_("CONST_SM_INSIDE_CLEAR")){						// Num0 = 9 以上
		uMessage("NPC_D_ALL_CLEAR_010");			//「最近になって　はじめて　アンデッドガーデンが
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		西ポーラパーク住民D（g_ice）の話す内容
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkIce()
{
	local main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");				//Num0
	local grave_num	 = GetNumFlg_("NUM_SCENARIO_SUB_GRAVE");		//Num4
	local sky_num	 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");			//Num9
	
	// 霊道シナリオ開始～ブンドルド撃破まで
	if(main_num == GetFlagID_("CONST_SM_CEMETERY")){								// Num0 = 3
		if(grave_num <= GetFlagID_("CONST_SS_CC_GO_TO_THE_NEXT_TRANSFER")){			// Num4 = 16 以下
			uMessage("DEMO_201_AFT_NPC_E");			//「ワシは　北の移動装置から　来たんだべが
		// ブンドルド撃破後
		}else if(grave_num <= GetFlagID_("CONST_SS_CC_CLEAR_CEMETERY")){			// Num4 = 18 以下
			uMessage("DEMO_213_AFT_NPC_E");			//「移動装置が直ったって聞いたべ。
		}
	}
	// 霊道シナリオクリア後～ガルビルス撃破前まで
	else if(main_num <= GetFlagID_("CONST_SM_CORE")){								// Num0 = 7 以下
		uMessage("DEMO_213_AFT_NPC_E");				//「移動装置が直ったって聞いたべ。
	}
	// ガルビルス撃破後～巨大ブンドルド撃破前まで
	else if(main_num == GetFlagID_("CONST_SM_SKY")){								// Num0 = 8
		if(sky_num <= GetFlagID_("CONST_SS_SK_JDG_REMATCH_G_BUNDORUDO")){			// Num9 = 23 以下
			uMessage("NPC_E_GARUBIRUSU_WIN_010");	//「なんだか　モタモタしてたら
		}
		// 巨大ブンドルド撃破後～表シナリオクリアまで
		else if(sky_num <= GetFlagID_("CONST_SS_SK_DATA_SAVED")){					// Num9 = 58 以下
			uMessage("NPC_E_BIG_BUNDORUDO_WIN_010");//「おおっ！　空が　元に戻ってるべ！
		}
	}
	// 表シナリオクリア後
	else if(main_num >= GetFlagID_("CONST_SM_INSIDE_CLEAR")){						// Num0 = 9 以上
		uMessage("NPC_E_ALL_CLEAR_010");			//「平和になったら　また　帰りそびれちまっただ。
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		道具屋
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkItem()
{
	//道具屋のメッセージ
	OpenMsgWnd_();
	ShowMsg_("ITEM_MSG_01");
	KeyInputWait_();
	CloseMsgWnd_();
	//道具屋フローに移行
	GotoMenuFadeOpen(MENU_OPEN.G01_00_ITEM);
	//道具屋フロー終了後
	OpenMsgWnd_();
	ShowMsg_("ITEM_MSG_02");
	KeyInputWait_();
	CloseMsgWnd_();

}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		宿屋
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkInn()
{
	uInnMessage();
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		モンスターの幽霊A
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkMonsterA()
{
// フラグの状態を取得
	local main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");				//Num0
	local grave_num	 = GetNumFlg_("NUM_SCENARIO_SUB_GRAVE");		//Num4
	local gost_a_num = GetNumFlg_("NUM_FLG_TRACKING_GHOST_STATE");	//Num127
	
	if(main_num == GetFlagID_("CONST_SM_CEMETERY")){				// Num0 = 3
		//モンスターの幽霊Aに話しかけてデモ202[モンスターの幽霊Ａとの出会い]再生
		if(grave_num == GetFlagID_("CONST_SS_CC_GO_TO_THE_NEON_PARK")){							//Num4 = 1
			if(gost_a_num == 3){																//Num127 = 3
				//モンスターの幽霊Aフラグ
				SetNumFlg_("NUM_FLG_TRACKING_GHOST_STATE", 4);									//Num127 = 4
				SetNumFlg_("NUM_SCENARIO_SUB_GRAVE",GetFlagID_("CONST_SS_CC_FIND_THE_GHOST"));	//Num4 = 2
				
				// デモの復帰位置をデモの完成後に設定します
				SetReturnDemoPosDir_(Vec3(142.068, -1.124, -28.883), 180);
				// 話しかけたらすぐにフェード ＋ Demo202[モンスターの幽霊Ａとの出会い]再生
				TouchNpcChangeDemo(202);
			}
		}
		//モンスターの幽霊Aと会話デモの後
		if(grave_num >= GetFlagID_("CONST_SS_CC_FIND_THE_GHOST")								//Num4 = 2  以上
		&& grave_num <= GetFlagID_("CONST_SS_CC_TAKE_OVER_VOLITION_2")){						//Num4 = 15 以下
				//モンスターの幽霊Aのメッセージ
				OpenMsgWnd_();
				ShowMsg_("DEMO_202_AFT_NPC_GOST_A");
				KeyInputWait_();
				CloseMsgWnd_();
		}
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		モンスターの幽霊G
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkMonsterG()
{
// フラグの状態を取得
	local main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");						// Num0
	local grave_num	 = GetNumFlg_("NUM_SCENARIO_SUB_GRAVE");				// Num4
	local sky_num	 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");					// Num9

	// 霊道シナリオクリア前
	if(main_num == GetFlagID_("CONST_SM_CEMETERY")){						// Num0 = 3
		// ブンドルド撃破後
		if(grave_num <= GetFlagID_("CONST_SS_CC_CLEAR_CEMETERY")){			// Num4 = 18 以下
			uMessage("DEMO_213_AFT_NPC_GOST_G");			//「あんたと入れ違いに　モンスターの幽霊が
		}
	}
	// 霊道シナリオクリア後～ガルビルス撃破前まで
	else if(main_num <= GetFlagID_("CONST_SM_CORE")){						// Num0 = 7 以下
		uMessage("DEMO_213_AFT_NPC_GOST_G");				//「あんたと入れ違いに　モンスターの幽霊が
	}
	// ガルビルス撃破後～巨大ブンドルド撃破前まで
	else if(main_num == GetFlagID_("CONST_SM_SKY")){						// Num0 = 8
		if(sky_num <= GetFlagID_("CONST_SS_SK_JDG_REMATCH_G_BUNDORUDO")){	// Num9 = 23 以下
			uMessage("NPC_GOST_G_GARUBIRUSU_WIN_010");		//「長いこと　幽霊やってるけど
		}
		// 巨大ブンドルド撃破後～表シナリオクリアまで
		else if(sky_num <= GetFlagID_("CONST_SS_SK_DATA_SAVED")){			// Num9 = 58 以下
			uMessage("NPC_GOST_G_BIG_BUNDORUDO_WIN_010");	//「あんたが　あの黒い花粉を　消してくれたのか。
		}
	}
	// 表シナリオクリア後
	else if(main_num >= GetFlagID_("CONST_SM_INSIDE_CLEAR")){				// Num0 = 9 以上
		uMessage("NPC_GOST_G_ALL_CLEAR_010");				//「よう　元気そうだな。
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		リアクターで幽霊を探知する地雷
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineGost()
{
	//モンスターの幽霊Aフラグ
	local gost_a_num = GetNumFlg_("NUM_FLG_TRACKING_GHOST_STATE");	//Num127
	
	if(gost_a_num == 0){											//Num127 = 0
		DeleteEventMine_(g_mine_gost_event);
		//モンスターの幽霊Aフラグ
		SetNumFlg_("NUM_FLG_TRACKING_GHOST_STATE", 1);				//Num127 = 1

		SetReturnDemoPosDir_(Vec3(7.591, -1.125, -157.978), -90);
		//219[モンスターの幽霊Ａに反応するリアクター]
		TouchNpcChangeDemo(219);
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//	幽霊探しイベント終了まで街から出られなくする地雷
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineDontExit()
{
	//リアクターメッセージ
	CommReactorActionNotice();		// リアクター反応があった時の共通処理
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_REACTOR");
	ShowMsg_("MINE_DONT_EXIT_MSG_01");
	KeyInputWait_();
	CloseMsgWnd_();
	CommResetPlayerMotion();		// モーションを待機状態に戻す共通処理
	Wait_(5);
	
	// バックして移動
	CommPlayerTurnMoveDirWalk(0);
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		幽霊Aを追いかけるイベント
//------------------------------------------------
//	引数	: gost_a_num	Num127の進行度
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uGostEvent(gost_a_num)
{
	
	local gost_a_num = GetNumFlg_("NUM_FLG_TRACKING_GHOST_STATE");				//Num127
	
	if(gost_a_num != 3){
		if(gost_a_num == 1){		// 1回目
			SetNumFlg_("NUM_FLG_TRACKING_GHOST_STATE", 2);
			SetReactorMarkerTypeHide_(g_reactor_point_a_1, false);	//リアクターのマーカータイプを戻す
			SetActive_(g_reactor_point_a_1, false);					//リアクターポイントを表示させない
			SetPointPosNoFit_(g_gost_a, "npc_neon_gost_02");		//モンスターの幽霊Aを配置
		}
		else if(gost_a_num == 2){	// 2回目
			SetNumFlg_("NUM_FLG_TRACKING_GHOST_STATE", 3);
			SetReactorMarkerTypeHide_(g_reactor_point_a_2, false);
			SetActive_(g_reactor_point_a_2, false);
			SetPointPosNoFit_(g_gost_a, "npc_neon_gost_03");
		}
		
		SetAlpha_(g_gost_a, 0.0);									//モンスターの幽霊Aを非表示にする
		SetDirToPlayer_(g_gost_a);									//プレイヤーの方に向かせる
		
		//モンスターの幽霊Aフェードイン
		uAlphaFadeIn(g_gost_a);
		
		//モンスターの幽霊A会話シーン
		if(gost_a_num == 1){		// 1回目
			uMessage("DEMO_201_AFT_NPC_GOST_01");
			Task_AnimeMove_(g_gost_a, "gost_ani2");					//次の方向へ移動するタスク
		}
		else if(gost_a_num == 2){	// 2回目
			uMessage("DEMO_201_AFT_NPC_GOST_02");
			Task_AnimeMove_(g_gost_a, "gost_ani3");
		}	
		
		//モンスターの幽霊Aを移動させながらフェードアウト
		uAlphaFadeOut(g_gost_a);
		DeleteAllTask_();											//タスクを消す
		
		//システムメッセージ
		if(gost_a_num == 1){		// 1回目
			uMessage("DEMO_201_AFT_SYS_01");
		}
		else if(gost_a_num == 2){	// 2回目
			uMessage("DEMO_201_AFT_SYS_02");
		}
		
		//リアクターを強制的に終了させる
		ReactorPowerOff_();
		
		if(gost_a_num == 1){		// 1回目
			//見えないように地面に埋める
			SetPosNoFit_(g_gost_a, Vec3(14.0, -50.0, -49.0));
			//2回目のリアクターポイントを設置
			g_reactor_point_a_2 = ArrangePointReactorPoint_("reactorPoint_a_2", SHORT_DIST);//モンスターの幽霊A（2回目）
			SetReactorMarkerTypeHide_(g_reactor_point_a_2, true);	// リアクターのマーカータイプを変更
			SetReactorEvent_(g_reactor_point_a_2);
		}
		else if(gost_a_num == 2){	// 2回目
			//3回目のモンスターの幽霊Aとリアクターポイントを設置
			SetPointPosNoFit_(g_gost_a, "npc_neon_gost_A");			//モンスターの幽霊Aを設置
			SetDir_(g_gost_a, 0);
			SetAlpha_(g_gost_a, 0.3);
			g_reactor_point_a_3 = ArrangePointReactorPoint_("reactorPoint_a_3", SHORT_DIST);//モンスターの幽霊A（3回目）
			SetReactorEvent_(g_reactor_point_a_3);
		}
	}else{
		//3回目
		//システムメッセージ
		uMessage("DEMO_201_AFT_NPC_GOST_04");
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		幽霊Aをフェードインさせる
//------------------------------------------------
//	引数	: id	NPCID
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uAlphaFadeIn(id)
{
	local alpha = 0.0;// α値の設定
	for(alpha = 0.0; alpha <= 0.3; alpha = alpha + 0.03){
		SetAlpha_(id, alpha);
		Wait_(2);
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		幽霊Aをフェードアウトする
//------------------------------------------------
//	引数	: id	NPCID
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uAlphaFadeOut(id)
{
	local alpha = 0.0;// α値の設定
	for(alpha = 0.3; alpha >= 0.0; alpha = alpha - 0.03){
		SetAlpha_(id, alpha);
		Wait_(4);
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		メッセージ関数
//------------------------------------------------
//	引数	: msg	メッセージID
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMessage(msg)
{
	OpenMsgWnd_();
	ShowMsg_(msg);
	KeyInputWait_();
	CloseMsgWnd_();
}





