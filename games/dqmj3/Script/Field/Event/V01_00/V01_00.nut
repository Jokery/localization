//===================== V01_00マグマパーク ====================
// 変数定義
main_num	 <- C_NONE_ID;
volcano_num	 <- C_NONE_ID;

str_num_sub <- "NUM_SCENARIO_SUB_VOLCANO";

//------------------------------------------------
//		戦闘終了後
//------------------------------------------------
function AfterBattle()
{
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");
	volcano_num	 = GetNumFlg_("NUM_SCENARIO_SUB_VOLCANO");
	
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
	volcano_num	 = GetNumFlg_("NUM_SCENARIO_SUB_VOLCANO");
	
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
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");
	volcano_num	 = GetNumFlg_("NUM_SCENARIO_SUB_VOLCANO");
	
	DebugPrint(" ");
	DebugPrint("NUM_SCENARIO_MAIN の値は " + main_num + " になりました。");
	DebugPrint("NUM_SCENARIO_SUB_VOLCANO の値は " + volcano_num + " になりました。");

	//マップ到達フラグ
	SetEventFlg_("BFG_ARRIVE_AT_V01", true);
	// ルーラポイント
	SetEventFlg_("BFG_RULER_ADD_020", true);//マグマパーク

	// マップチェンジNULLの設定(焦熱の火山(V00_00)行き)
	if(main_num == GetFlagID_("CONST_SM_VOLCANO")){							// Num0 = 6
		if(volcano_num == GetFlagID_("CONST_SS_HV_TALK_MAGMA_PARK_ELDER")
		|| volcano_num == GetFlagID_("CONST_SS_HV_GO_TO_THE_BIRDY_HOUSE")){	// NUM7 = 3～4
			// イベント中は封鎖する
			SetHitEnableMapChangeNull_("w_V00_00ALdr_001", false);
			// ルーラを禁止するフラグを設定
			SetEventFlg_("BFG_PLAYERABILITY_RULER_PROHIBIT", true);
		}
		else{
			SetHitEnableMapChangeNull_("w_V00_00ALdr_001", true);
			SetEventFlg_("BFG_PLAYERABILITY_RULER_PROHIBIT", false);
		}
	}

	//---------------
	// ▼ギミック配置
	//---------------


	//---------------
	// ▼NPC関連
	//---------------
	// ID初期化
	npc0		 <- C_NONE_ID;
	npc1		 <- C_NONE_ID;
	npc2		 <- C_NONE_ID;
	npc3		 <- C_NONE_ID;
	npc_ELDER	 <- C_NONE_ID;
	npc_AIDE	 <- C_NONE_ID;
	npc_IMP	 <- C_NONE_ID;
	npc_INN	 <- C_NONE_ID;

	// NPCのモデル
	local n000ResId = ReadNpc_("m076_02");	//◆ げんじゅつし
	local n002ResId = ReadNpc_("m082_01");	//◆ べビル
	local n003ResId = ReadNpc_("m107_01");	//◆ メガザルロック
	local n004ResId = ReadNpc_("m006_03");	//◆ ベスキング

	//npc配置
	npc0 = ArrangePointNpc_(n002ResId, "000");				//マグマパーク住人A
	SetScaleSilhouette(npc0, SCALE.S, SILHOUETTE_WIDTH.S);	//サイズの設定
	SetReactorMsg_(npc0, "VOLCANO_NPC_A_REC");
	
	npc1 = ArrangePointNpc_(n004ResId, "001");				//マグマパーク住人B
	SetScaleSilhouette(npc1, SCALE.S, SILHOUETTE_WIDTH.S);	//サイズの設定
	SetReactorMsg_(npc1, "VOLCANO_NPC_C_REC");
	
	npc2 = ArrangePointNpc_(n004ResId, "002");				//マグマパーク住人C
	SetScaleSilhouette(npc2, SCALE.S, SILHOUETTE_WIDTH.S);	//サイズの設定
	SetReactorMsg_(npc2, "VOLCANO_NPC_C_REC");
	
	npc3 = ArrangePointNpc_(n002ResId, "003");				//マグマパーク住人D
	SetScaleSilhouette(npc3, SCALE.S, SILHOUETTE_WIDTH.S);	//サイズの設定
	SetReactorMsg_(npc3, "VOLCANO_NPC_A_REC");
	
	npc_ELDER = ArrangePointNpc_(n000ResId, "005");				//マグマパーク長老
	SetScaleSilhouette(npc_ELDER, SCALE.S, SILHOUETTE_WIDTH.S);	//サイズの設定
	SetTalkCameraType_(npc_ELDER, TALK_CAMERA_UP);				//カメラの設定
	SetSearchableAngle_(npc_ELDER, SEARCHABLE_ANGLE_NORMAL);	//会話可能角度の設定
	SetReactorMsg_(npc_ELDER, "VOLCANO_ELDE_REC");
	
	npc_AIDE = ArrangePointNpc_(n003ResId, "004");				//長老側近
	SetScaleSilhouette(npc_AIDE, SCALE.N, SILHOUETTE_WIDTH.N);	//サイズの設定
	SetReactorMsg_(npc_AIDE, "VOLCANO_AIDE_REC");
	
	npc_IMP = ArrangePointNpc_(n002ResId, "006");				//道具屋
	SetScaleSilhouette(npc_IMP, SCALE.S, SILHOUETTE_WIDTH.S);	//サイズの設定
	SetTalkCameraType_(npc_IMP, TALK_CAMERA_UP);				//カメラの設定
	SetSearchableAngle_(npc_IMP, SEARCHABLE_ANGLE_MINIMUM);		//会話可能角度の設定
	SetReactorMsg_(npc_IMP, "VOLCANO_NPC_A_REC");
	
	npc_INN = ArrangePointNpc_(n003ResId, "007");				//宿屋
	SetScaleSilhouette(npc_INN, SCALE.N, SILHOUETTE_WIDTH.N);	//サイズの設定
	SetTalkCameraType_(npc_INN, TALK_CAMERA_UP);				//カメラの設定
	SetSearchableAngle_(npc_INN, SEARCHABLE_ANGLE_MINIMUM);		//会話可能角度の設定
	SetReactorMsg_(npc_INN, "VOLCANO_NPC_B_REC");

	//-----------
	// ▼地雷配置
	//-----------
	// ID初期化
	g_mine_keepout    <- C_NONE_ID;
	g_mine_bird_house <- C_NONE_ID;
	
	// ■マグマパーク封鎖用地雷()
	if (main_num == GetFlagID_("CONST_SM_VOLCANO")) {							// Num0 = 6
		if(volcano_num == GetFlagID_("CONST_SS_HV_TALK_MAGMA_PARK_ELDER")
		|| volcano_num == GetFlagID_("CONST_SS_HV_GO_TO_THE_BIRDY_HOUSE")){		// NUM7 = 3～4
			g_mine_keepout = SetPointCircleEventMine_("mine_keepout", false);
		}
	}
	// ■バーディの家に入った際のデモ用地雷
	if (main_num == GetFlagID_("CONST_SM_VOLCANO")) {							// Num0 = 6
		if(volcano_num == GetFlagID_("CONST_SS_HV_GO_TO_THE_BIRDY_HOUSE")){		// NUM7 = 4
			g_mine_bird_house = SetPointBoxEventMine_("mine_birdy_house", false);
		}
	}

	//--------------------
	//▼リアクターポイント
	//--------------------
	// 天然の温水
	local reactorPoint01 = ArrangeMsgReactorPoint("reactorPoint01", GetFlagID_("BFG_REACTER_POINT_084")
		, SHORT_DIST, "REC_POINT_01_01", "REC_POINT_01_02");

	EventEnd_();
}	

//------------------------------------------------
//		フィールド操作開始
//------------------------------------------------
function EventStartOperate()
{

	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");
	volcano_num	 = GetNumFlg_("NUM_SCENARIO_SUB_VOLCANO");

	if (main_num == GetFlagID_("CONST_SM_VOLCANO")) {
		if (volcano_num == GetFlagID_("CONST_SS_HV_PRE_MAGMA_PARK_DEMO")) {
			SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_HV_TALK_MAGMA_PARK_ELDER"));
			
			// デモの復帰位置をデモの完成後に設定します
			SetReturnDemoPosDir_(Vec3(47.092, 0.000, -300.000), 0);
			
			// Demo502[地下のシェルターの町(マグマパーク)]再生
			EventStartChangeDemo(502, FADE_COLOR_BLACK);
		}
	}

	EventEnd_();
}

//------------------------------------------------
// NPCに話しかける直前で起動するイベントブロック
//------------------------------------------------
function BeforeTalkNpc()
{
	// フラグを取得する
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");
	volcano_num	 = GetNumFlg_("NUM_SCENARIO_SUB_VOLCANO");

	// 話しかけられているNPCのIDを取得
	local target = GetTargetId_();
	
	// このタイミングで長老に話しかけた場合デモに移行するので会話時カメラは通常のものにしておく
	if(target == npc_ELDER){
		if(volcano_num == GetFlagID_("CONST_SS_HV_TALK_MAGMA_PARK_ELDER")){
			SetTalkCameraType_(target, TALK_CAMERA_DEF);
		}
	}
	
    EventEnd_();
}

//------------------------------------------------
//		ＮＰＣ接触時
//------------------------------------------------
function TouchNpc()
{
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");			// Num0
	volcano_num	 = GetNumFlg_("NUM_SCENARIO_SUB_VOLCANO");	// Num6
	
	local target = GetTargetId_();
	
	DebugPrint(" ");
	DebugPrint("ID: " + target + " に接触 [TouchNpc]");
	
	switch (target) {
	case npc0:
		uTalknpc0();
		break;
	case npc1:
		uTalknpc1();
		break;
	case npc2:
		uTalknpc2();
		break;
	case npc3:
		uTalknpc3();
		break;
	case npc_ELDER:
		uTalknpc_ELDER();
		break;
	case npc_AIDE:
		uTalknpc_AIDE();
		break;
	case npc_IMP:
		uTalknpc_IMP();
		break;
	case npc_INN:
		uTalknpc_Inn();
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
	volcano_num	 = GetNumFlg_("NUM_SCENARIO_SUB_VOLCANO");
	
	local target = GetTouchEventMineId_();
	
	DebugPrint(" ");
	DebugPrint("ID: " + target + " に接触 [TouchEventMine]");
	
	switch (target) {
	case g_mine_keepout:
		uMineKeepout();
		break;
	case g_mine_bird_house :
		uMineBirdyHouse();
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
//		マグマパーク住人Ａ 会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalknpc0()
{
	main_num		 = GetNumFlg_("NUM_SCENARIO_MAIN");
	volcano_num		 = GetNumFlg_("NUM_SCENARIO_SUB_VOLCANO");
	local sky_num	 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");			//Num9
	
	// 火山シナリオ
	if (main_num == GetFlagID_("CONST_SM_VOLCANO")) {
		if (volcano_num < GetFlagID_("CONST_SS_HV_GO_TO_THE_BIRDY_HOUSE")) {
			OpenMsgWnd_();
			ShowMsg_("DEMO_502_AFT_NPC_A");		// 「まずは 長老のところに！
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (volcano_num < GetFlagID_("CONST_SS_HV_CLIMBING_THE_VOLCANO")) {
			OpenMsgWnd_();
			ShowMsg_("DEMO_503_AFT_NPC_A");		// 「バーディと会うんだって？
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (volcano_num < GetFlagID_("CONST_SS_HV_GO_TO_THE_TOEWR")) {
			OpenMsgWnd_();
			ShowMsg_("DEMO_504_AFT_NPC_A");		// 「バーディが 山に向かったようだが……？
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (volcano_num >= GetFlagID_("CONST_SS_HV_GO_TO_THE_TOEWR")) {
			OpenMsgWnd_();
			ShowMsg_("12_NPC_A");		// 「そうか……ついに コアを攻めるのか。
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	// 火山シナリオクリア後～ガルビルス撃破前まで
	else if (main_num == GetFlagID_("CONST_SM_CORE")) {
			OpenMsgWnd_();
			ShowMsg_("12_NPC_A");		// 「そうか……ついに コアを攻めるのか。
			KeyInputWait_();
			CloseMsgWnd_();
	}
	// ガルビルス撃破後～巨大プロメテウス＆デスバーン撃破前まで
	else if (main_num == GetFlagID_("CONST_SM_SKY")) {			// Num0 = 8
		if(sky_num < GetFlagID_("CONST_SS_SK_GO_CORE_SKY")){	// Num9 < 42
			OpenMsgWnd_();
			ShowMsg_("13_NPC_A");		// 「この黒い花粉は 不気味だな……。
			KeyInputWait_();
			CloseMsgWnd_();
		}
		// 巨大プロメテウス＆デスバーン撃破後から表シナリオクリア前まで
		else {
			OpenMsgWnd_();
			ShowMsg_("14_NPC_A");		// 「コアに 黒い花粉が 集まっているな。
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	// 表シナリオクリア後
	else if (main_num > GetFlagID_("CONST_SM_SKY")) {			// Num0 > 8
		OpenMsgWnd_();
		ShowMsg_("17_NPC_A");		// 「せっかく 平和になったんだ。
		KeyInputWait_();
		CloseMsgWnd_();
	}
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		マグマパーク住人Ｂ 会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalknpc1()
{
	main_num		 = GetNumFlg_("NUM_SCENARIO_MAIN");
	volcano_num		 = GetNumFlg_("NUM_SCENARIO_SUB_VOLCANO");
	local sky_num	 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");			//Num9
	
	// 火山シナリオ
	if (main_num == GetFlagID_("CONST_SM_VOLCANO")) {
		if (volcano_num < GetFlagID_("CONST_SS_HV_GO_TO_THE_BIRDY_HOUSE")) {
			OpenMsgWnd_();
			ShowMsg_("DEMO_502_AFT_NPC_B");		// 「もう すっかり慣れっこだよ。
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (volcano_num < GetFlagID_("CONST_SS_HV_CLIMBING_THE_VOLCANO")) {
			OpenMsgWnd_();
			ShowMsg_("DEMO_503_AFT_NPC_B");		// 「バーディは あわてんぼうでさ。
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (volcano_num < GetFlagID_("CONST_SS_HV_GO_TO_THE_TOEWR")) {
			OpenMsgWnd_();
			ShowMsg_("DEMO_504_AFT_NPC_B");		// 「バーディが言ってたぜ。山に行くんだろう？
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (volcano_num >= GetFlagID_("CONST_SS_HV_GO_TO_THE_TOEWR")) {
			OpenMsgWnd_();
			ShowMsg_("12_NPC_B");		// 「ブレイクモンスター打倒は バアさんの悲願。
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	// 火山シナリオクリア後～ガルビルス撃破前まで
	else if (main_num == GetFlagID_("CONST_SM_CORE")) {
			OpenMsgWnd_();
			ShowMsg_("12_NPC_B");		// 「ブレイクモンスター打倒は バアさんの悲願。
			KeyInputWait_();
			CloseMsgWnd_();
	}
	// ガルビルス撃破後～巨大プロメテウス＆デスバーン撃破前まで
	else if (main_num == GetFlagID_("CONST_SM_SKY")) {			// Num0 = 8
		if(sky_num < GetFlagID_("CONST_SS_SK_GO_CORE_SKY")){	// Num9 < 42
			OpenMsgWnd_();
			ShowMsg_("13_NPC_B");		// 「黒い花粉がなんなのか さっぱりわからん。
			KeyInputWait_();
			CloseMsgWnd_();
		}
		// 巨大プロメテウス＆デスバーン撃破後から表シナリオクリア前まで
		else {
			OpenMsgWnd_();
			ShowMsg_("14_NPC_B");		// 「いよいよ 本当に最後の決戦ってわけか。
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	// 表シナリオクリア後
	else if (main_num > GetFlagID_("CONST_SM_SKY")) {			// Num0 > 8
		OpenMsgWnd_();
		ShowMsg_("17_NPC_B");		// 「ルキヤのバアさんの墓参り 行かなきゃなぁ。
		KeyInputWait_();
		CloseMsgWnd_();
	}
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		マグマパーク住人Ｃ 会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalknpc2()
{
	main_num		 = GetNumFlg_("NUM_SCENARIO_MAIN");
	volcano_num		 = GetNumFlg_("NUM_SCENARIO_SUB_VOLCANO");
	local sky_num	 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");			//Num9
	
	// 火山シナリオ
	if (main_num == GetFlagID_("CONST_SM_VOLCANO")) {
		if (volcano_num < GetFlagID_("CONST_SS_HV_GO_TO_THE_BIRDY_HOUSE")) {
			OpenMsgWnd_();
			ShowMsg_("DEMO_502_AFT_NPC_C");		// 「このマグマパークは あなたが以前に
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (volcano_num < GetFlagID_("CONST_SS_HV_CLIMBING_THE_VOLCANO")) {
			OpenMsgWnd_();
			ShowMsg_("DEMO_503_AFT_NPC_C");		// 「あなたが 戻ってくるのを
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (volcano_num < GetFlagID_("CONST_SS_HV_GO_TO_THE_TOEWR")) {
			OpenMsgWnd_();
			ShowMsg_("DEMO_504_AFT_NPC_C");		// 「エルピス山は 世界でいちばん高い山。
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (volcano_num >= GetFlagID_("CONST_SS_HV_GO_TO_THE_TOEWR")) {
			OpenMsgWnd_();
			ShowMsg_("12_NPC_C");		// 「覚えておいて……あなたは１人じゃない。
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	// 火山シナリオクリア後～ガルビルス撃破前まで
	else if (main_num == GetFlagID_("CONST_SM_CORE")) {
		OpenMsgWnd_();
		ShowMsg_("12_NPC_C");		// 「覚えておいて……あなたは１人じゃない。
		KeyInputWait_();
		CloseMsgWnd_();
	}
	// ガルビルス撃破後～巨大プロメテウス＆デスバーン撃破前まで
	else if (main_num == GetFlagID_("CONST_SM_SKY")) {			// Num0 = 8
		if(sky_num < GetFlagID_("CONST_SS_SK_GO_CORE_SKY")){	// Num9 < 42
			OpenMsgWnd_();
			ShowMsg_("13_NPC_C");		// 「今こそ みんなでチカラを
			KeyInputWait_();
			CloseMsgWnd_();
		}
		// 巨大プロメテウス＆デスバーン撃破後から表シナリオクリア前まで
		else {
			OpenMsgWnd_();
			ShowMsg_("14_NPC_C");		// 「いよいよ 最後の戦いなのでしょう？
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	// 表シナリオクリア後
	else if (main_num > GetFlagID_("CONST_SM_SKY")) {			// Num0 > 8
		OpenMsgWnd_();
		ShowMsg_("17_NPC_C");		// 「あなた ここに定住する気は ないの？
		KeyInputWait_();
		CloseMsgWnd_();
	}
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		マグマパーク住人Ｄ 会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalknpc3()
{
	main_num		 = GetNumFlg_("NUM_SCENARIO_MAIN");
	volcano_num		 = GetNumFlg_("NUM_SCENARIO_SUB_VOLCANO");
	local sky_num	 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");			//Num9
	
	// 火山シナリオ
	if (main_num == GetFlagID_("CONST_SM_VOLCANO")) {
		if (volcano_num < GetFlagID_("CONST_SS_HV_GO_TO_THE_BIRDY_HOUSE")) {
			OpenMsgWnd_();
			ShowMsg_("DEMO_502_AFT_NPC_D");		// 「あんたが ここに戻ってきたからには
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (volcano_num < GetFlagID_("CONST_SS_HV_CLIMBING_THE_VOLCANO")) {
			OpenMsgWnd_();
			ShowMsg_("DEMO_503_AFT_NPC_D");		// 「またバーディに またがって
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (volcano_num < GetFlagID_("CONST_SS_HV_GO_TO_THE_TOEWR")) {
			OpenMsgWnd_();
			ShowMsg_("DEMO_504_AFT_NPC_D");		// 「山では デスバーンに気をつけなよ。
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (volcano_num >= GetFlagID_("CONST_SS_HV_GO_TO_THE_TOEWR")) {
			OpenMsgWnd_();
			ShowMsg_("12_NPC_D");		// 「ダークマスターの奴が
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	// 火山シナリオクリア後～ガルビルス撃破前まで
	else if (main_num == GetFlagID_("CONST_SM_CORE")) {
		OpenMsgWnd_();
		ShowMsg_("12_NPC_D");		// 「ダークマスターの奴が
		KeyInputWait_();
		CloseMsgWnd_();
	}
	// ガルビルス撃破後～巨大プロメテウス＆デスバーン撃破前まで
	else if (main_num == GetFlagID_("CONST_SM_SKY")) {			// Num0 = 8
		if(sky_num < GetFlagID_("CONST_SS_SK_GO_CORE_SKY")){	// Num9 < 42
			OpenMsgWnd_();
			ShowMsg_("13_NPC_D");		// 「ダークマスターは 倒したんだろう？
			KeyInputWait_();
			CloseMsgWnd_();
		}
		// 巨大プロメテウス＆デスバーン撃破後から表シナリオクリア前まで
		else {
			OpenMsgWnd_();
			ShowMsg_("14_NPC_D");		// 「ガルビルスっていうのか？
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	// 表シナリオクリア後
	else if (main_num > GetFlagID_("CONST_SM_SKY")) {			// Num0 > 8
		OpenMsgWnd_();
		ShowMsg_("17_NPC_D");		// 「ガルビルス……いや ガルマザードだったか。
		KeyInputWait_();
		CloseMsgWnd_();
	}
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		マグマパーク長老側近 会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalknpc_AIDE()
{
	main_num		 = GetNumFlg_("NUM_SCENARIO_MAIN");
	volcano_num		 = GetNumFlg_("NUM_SCENARIO_SUB_VOLCANO");
	local sky_num	 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");			//Num9
	
	// 火山シナリオ
	if (main_num == GetFlagID_("CONST_SM_VOLCANO")) {
		if (volcano_num < GetFlagID_("CONST_SS_HV_GO_TO_THE_BIRDY_HOUSE")) {
			OpenMsgWnd_();
			ShowMsg_("DEMO_502_AFT_AIDE");		// 「長老が お待ちだ。
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (volcano_num < GetFlagID_("CONST_SS_HV_CLIMBING_THE_VOLCANO")) {
			OpenMsgWnd_();
			ShowMsg_("DEMO_503_AFT_AIDE");		// 「バーディ ルキヤ ……そしてレナーテ。
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (volcano_num < GetFlagID_("CONST_SS_HV_GO_TO_THE_TOEWR")) {	
			OpenMsgWnd_();
			ShowMsg_("DEMO_504_AFT_AIDE");		// 「町の守りは 我らに 任せておけ。
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (volcano_num >= GetFlagID_("CONST_SS_HV_GO_TO_THE_TOEWR")) {
			OpenMsgWnd_();
			ShowMsg_("12_AIDE");		// 「レナーテも 生きていたって！？
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	// 火山シナリオクリア後～ガルビルス撃破前まで
	else if (main_num == GetFlagID_("CONST_SM_CORE")) {
		OpenMsgWnd_();
		ShowMsg_("12_AIDE");		// 「レナーテも 生きていたって！？
		KeyInputWait_();
		CloseMsgWnd_();
	}
	// ガルビルス撃破後～巨大プロメテウス＆デスバーン撃破前まで
	else if (main_num == GetFlagID_("CONST_SM_SKY")) {			// Num0 = 8
		if(sky_num < GetFlagID_("CONST_SS_SK_GO_CORE_SKY")){	// Num9 < 42
			OpenMsgWnd_();
			ShowMsg_("13_AIDE");		// 「今のところ 直接の被害は ない。
			KeyInputWait_();
			CloseMsgWnd_();
		}
		// 巨大プロメテウス＆デスバーン撃破後から表シナリオクリア前まで
		else {
			OpenMsgWnd_();
			ShowMsg_("14_AIDE");		// 「くじけそうになったら いつでも戻ってこい。
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	// 表シナリオクリア後
	else if (main_num > GetFlagID_("CONST_SM_SKY")) {			// Num0 > 8
		OpenMsgWnd_();
		ShowMsg_("17_AIDE");		// 「今までも これからも
		KeyInputWait_();
		CloseMsgWnd_();
	}
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		マグマパーク長老 会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalknpc_ELDER()
{
	main_num		 = GetNumFlg_("NUM_SCENARIO_MAIN");
	volcano_num		 = GetNumFlg_("NUM_SCENARIO_SUB_VOLCANO");
	local sky_num	 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");			//Num9
	
	// 火山シナリオ
	if (main_num == GetFlagID_("CONST_SM_VOLCANO")) {
		if (volcano_num  <  GetFlagID_("CONST_SS_HV_GO_TO_THE_BIRDY_HOUSE")) {
			SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_HV_GO_TO_THE_BIRDY_HOUSE"));
			// デモ後の復帰位置と向きの設定
			local player_pos = Vec3(57.959, 39.270, 123.246);
			local player_dir = -119;
			SetReturnDemoPosDir_(player_pos, player_dir);
			// Demo503[長老との面会]の再生
			TouchNpcChangeDemo(503);
		}
		else if (volcano_num < GetFlagID_("CONST_SS_HV_CLIMBING_THE_VOLCANO")) {
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_ELDER");
			ShowMsg_("DEMO_503_AFT_ELDE");		// 「バーディは 町はずれに住んでおる。
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (volcano_num < GetFlagID_("CONST_SS_HV_GO_TO_THE_TOEWR")) {
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_ELDER");
			ShowMsg_("DEMO_504_AFT_ELDE");		// 「バーディが エルピス山に 行ったようじゃな。
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (volcano_num >= GetFlagID_("CONST_SS_HV_GO_TO_THE_TOEWR")) {
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_ELDER");
			ShowMsg_("12_ELDE");		// 「コアを 攻めに行くとな？
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	// 火山シナリオクリア後～ガルビルス撃破前まで
	else if (main_num == GetFlagID_("CONST_SM_CORE")) {
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_ELDER");
		ShowMsg_("12_ELDE");		// 「コアを 攻めに行くとな？
		KeyInputWait_();
		CloseMsgWnd_();
	}
	// ガルビルス撃破後～巨大プロメテウス＆デスバーン撃破前まで
	else if (main_num == GetFlagID_("CONST_SM_SKY")) {			// Num0 = 8
		if(sky_num < GetFlagID_("CONST_SS_SK_GO_CORE_SKY")){	// Num9 < 42
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_ELDER");
			ShowMsg_("13_ELDE");		// 「あの黒い花粉は コアから吹き出し
			KeyInputWait_();
			CloseMsgWnd_();
		}
		// 巨大プロメテウス＆デスバーン撃破後から表シナリオクリア前まで
		else {
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_ELDER");
			ShowMsg_("14_ELDE");		// 「さあ いよいよ 最後の戦いじゃろう？
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	// 表シナリオクリア後
	else if (main_num > GetFlagID_("CONST_SM_SKY")) {			// Num0 > 8
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_ELDER");
		ShowMsg_("17_ELDE");		// 「おぬしか……よう来てくれた。
		KeyInputWait_();
		CloseMsgWnd_();
	}
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		道具屋 会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalknpc_IMP()
{
	// 火山のクリアフラグ
	local clear_flag = GetEventFlg_("BFG_SCENARIO_CLEAR_VOLCANO");
	local msg;

	if(clear_flag == true){
		msg = "ITM_MSG_002"; // 火山クリア後メッセージ
	}
	else{
		if(main_num == GetFlagID_("CONST_SM_VOLCANO")
		&& volcano_num <= GetFlagID_("CONST_SS_HV_PRE_LAUNCH_PAD_DEMO_5")){
			msg = "ITM_MSG_001"; // 火山クリア前メッセージ
		}
		else{
			msg = "ITM_MSG_002"; // 火山クリア後メッセージ
		}
	}

	OpenMsgWnd_();
	ShowMsg_(msg);
	KeyInputWait_();
	CloseMsgWnd_();

	// 道具屋フローへ移行
	GotoMenuFadeOpen(MENU_OPEN.V01_00_ITEM);
	//道具屋フロー終了後
	OpenMsgWnd_();
	ShowMsg_("ITM_MSG_003");
	KeyInputWait_();
	CloseMsgWnd_();
}

//---------------------------------------
// 宿屋のメッセージ処理
//---------------------------------------
function uTalknpc_Inn()
{
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");
	volcano_num	 = GetNumFlg_("NUM_SCENARIO_SUB_VOLCANO");
	
	// 暗転明けの主人公の復帰位置と向きを設定する
	local re_pos = Vec3(43, 0, -167);	// 復帰位置を指定
	local re_dir = -70;					// 向きを指定	
	
	// メッセージキーの初期化
	local message_key_1 = 0;	// メッセージキー(選択肢を表示するメッセージ)
	local message_key_2 = 0;	// メッセージキー(やめる場合のメッセージ)
	local message_key_3 = 0;	// メッセージキー(利用した場合のメッセージ)
	// 火山のクリアフラグ
	local clear_flag = GetEventFlg_("BFG_SCENARIO_CLEAR_VOLCANO");

	if(clear_flag == true){
		if(GetEventFlg_("BFG_CHECK_INN_FIRST_MSG_ALL") == false){
			// 火山クリア後の宿屋で表示するメッセージを指定(初回)
			message_key_1 = "INN_MSG_001";
			message_key_2 = "INN_MSG_002";
			message_key_3 = "INN_MSG_003";
		}
		else{
			// 火山クリア後の宿屋で表示するメッセージを指定(２回目以降)
			message_key_1 = "INN_MSG_004";
			message_key_2 = "INN_MSG_005";
			message_key_3 = "INN_MSG_006";
		}
		SetEventFlg_("BFG_CHECK_INN_FIRST_MSG_ALL", true);
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
			CommTaskInn(re_pos, re_dir, clear_flag, npc_INN);
			// メッセージの表示(「おはよう！
			OpenMsgWnd_();
			ShowMsg_(message_key_3);
			KeyInputWait_();
			CloseMsgWnd_();
			break;
		case QUERY3_2:
		// やめる処理
			// メッセージの表示(「……おいおい 無理はするなよ？
			ShowMsg_(message_key_2);
			KeyInputWait_();
			CloseMsgWnd_();
			break;
		}
	}
	else{
		// Demo532[秘密基地 さあ行こう！]の再生前まで
		if(main_num == GetFlagID_("CONST_SM_VOLCANO")
		&& volcano_num <= GetFlagID_("CONST_SS_HV_PRE_LAUNCH_PAD_DEMO_5")){
			// 火山クリア前の宿屋で表示するメッセージを指定
			message_key_1 = "INN_MSG_1ST_001";
			message_key_2 = "INN_MSG_1ST_002";
			message_key_3 = "INN_MSG_1ST_003";
		}
		// Demo532[秘密基地 さあ行こう！]の再生後
		else{
			message_key_1 = "INN_MSG_1ST_004";
			message_key_2 = "INN_MSG_1ST_005";
			message_key_3 = "INN_MSG_1ST_006";
		}
		// メッセージの表示（「アンタから 金は取れないな。
		OpenMsgWnd_();
		ShowMsg_(message_key_1);
		KeyInputWait_();
		switch(GetQueryResult_())
		{
		case QUERY2_0:
		// 泊まる処理
			CloseMsgWnd_();
			// 宿屋の共通の回復処理
			CommTaskInn(re_pos, re_dir, clear_flag, npc_INN);
			// メッセージの表示(「起きてきたか アンセス。
			OpenMsgWnd_();
			ShowMsg_(message_key_3);
			KeyInputWait_();
			CloseMsgWnd_();
			break;
		case QUERY2_1:
		// やめる処理
			// メッセージの表示(「……そうかい。無理は するなよ？
			ShowMsg_(message_key_2);
			KeyInputWait_();
			CloseMsgWnd_();
			break;
		}
	}
}

//++++++++++++++++++++++++++++++++++++++++++++++++
// マグマパーク封鎖用地雷に触れた時の処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineKeepout()
{
	main_num    = GetNumFlg_("NUM_SCENARIO_MAIN");
	volcano_num = GetNumFlg_("NUM_SCENARIO_SUB_VOLCANO");

	// 封鎖用メッセージの設定
	local msg_keepout;
	if(main_num == GetFlagID_("CONST_SM_VOLCANO")){							// Num0 = 6
		if(volcano_num == GetFlagID_("CONST_SS_HV_TALK_MAGMA_PARK_ELDER")){	// NUM7 = 3
			// 仮メッセージ(Redmine #1625参照)
			msg_keepout = "KEEPOUT_MSG_01";
		}
		else if(volcano_num == GetFlagID_("CONST_SS_HV_GO_TO_THE_BIRDY_HOUSE")){ // NUM7 = 4
			// 仮メッセージ(Redmine #1625参照)
			msg_keepout = "KEEPOUT_MSG_02";
		}
	}

	// メッセージの表示
	OpenMsgWnd_();
	ShowMsg_(msg_keepout);
	KeyInputWait_();
	CloseMsgWnd_();

	// 進入禁止処理
	CommPlayerTurnMoveDirWalk(0);
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		バーディの家に入った時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineBirdyHouse()
{
	main_num    = GetNumFlg_("NUM_SCENARIO_MAIN");
	volcano_num = GetNumFlg_("NUM_SCENARIO_SUB_VOLCANO");

	if(main_num == GetFlagID_("CONST_SM_VOLCANO")){
		if (volcano_num < GetFlagID_("CONST_SS_HV_CLIMBING_THE_VOLCANO")) {
			// シナリオ進行フラグを進める
			SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_HV_CLIMBING_THE_VOLCANO"));
			// デモ後の復帰位置と向きの設定
			local player_pos = Vec3(-252.601, 11.500, 50.410);
			local player_dir = 90;
			SetReturnDemoPosDir_(player_pos, player_dir);
			// Demo504[サイレスのバーディ]の再生
			ChangeDemo_(504);
		}
	}
}


