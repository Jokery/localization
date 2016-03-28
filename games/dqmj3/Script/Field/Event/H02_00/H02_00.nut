//===================== 拠点【洞くつ(楽園)】====================

// 変数定義
main_num		 <- C_NONE_ID;
op_num			 <- C_NONE_ID;
green_num		 <- C_NONE_ID;
sky_num			 <- C_NONE_ID;

main_num_sub	 <- "NUM_SCENARIO_MAIN";
op_num_sub		 <- "NUM_SCENARIO_SUB_OP";
green_num_sub	 <- "NUM_SCENARIO_SUB_GREEN";
sky_num_sub		 <- "NUM_SCENARIO_SUB_SKY";

//------------------------------------------------
//		戦闘終了後
//------------------------------------------------
function AfterBattle()
{
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");		// Num0
	op_num		 = GetNumFlg_("NUM_SCENARIO_SUB_OP");	// Num1
	green_num	 = GetNumFlg_("NUM_SCENARIO_SUB_GREEN");// Num2
	sky_num		 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");	// Num9
	
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
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");		// Num0
	op_num		 = GetNumFlg_("NUM_SCENARIO_SUB_OP");	// Num1
	green_num	 = GetNumFlg_("NUM_SCENARIO_SUB_GREEN");// Num2
	sky_num		 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");	// Num9
	
	// ガルビル戦後にH02_00に入った時
	if(main_num == GetFlagID_("CONST_SM_SKY")){
		if(sky_num == 0){
			//ライド強制解除
			SetRideOffStart_();
		}
	}
	
	EventEnd_();
}


//------------------------------------------------
//		フェードアウト中
//------------------------------------------------
function FadeIn()
{
	// フラグを取得
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");		// Num0
	op_num		 = GetNumFlg_("NUM_SCENARIO_SUB_OP");	// Num1
	green_num	 = GetNumFlg_("NUM_SCENARIO_SUB_GREEN");// Num2
	sky_num		 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");	// Num9
	DebugPrint(" ");
	DebugPrint("NUM_SCENARIO_MAIN の値は " + main_num + " になりました。");
	DebugPrint("NUM_SCENARIO_SUB_OP の値は " + op_num + " になりました。");
	DebugPrint("NUM_SCENARIO_SUB_SKY の値は " + sky_num + " になりました。");

	//---------------
	// ▼ギミック配置
	//---------------
	// ■サンチョの残骸
	if(main_num <= GetFlagID_("CONST_SM_CORE")){										// Num0 = 7 以下
		local g_Sancho = ReadGimmick_("o_dem_09");	// サンチョの残骸
		gim_sancho <- C_NONE_ID;					// 初期化
		gim_sancho = ArrangePointGimmick_("o_dem_09", g_Sancho, "g_Sancho");
	}

	// ■リアクターポッド<常駐>
	local pod_id = ReadGimmick_("o_dem_26");
	gim_rec_pod <- C_NONE_ID;
	gim_rec_pod = ArrangePointGimmick_("o_dem_26", pod_id, "g_pod");

	// ■Sランク用モノリス
	if(main_num >= GetFlagID_("CONST_SM_SKY")											// Num0 = 8 以上
	&& sky_num  >= GetFlagID_("CONST_SS_SK_GO_TO_THE_COLOSSEUM")						// Num9 = 3 以上
	|| main_num >= GetFlagID_("CONST_SM_INSIDE_CLEAR")){								// Num0 = 9 以上
		local g_monolith = ReadGimmick_("o_com_02");
		monolith_s <- ArrangePointGimmick_("o_com_02", g_monolith, "obj_S_monolith");
		// モノリス(「起動前待機」のアニメを設定)
		SetMotion_(monolith_s, "GIMMICK_0", 0);
		if(GetEventFlg_("BFG_START_S_MONOLITH") == true){
			// モノリスの起動後待機アニメを再生
			SetMotion_(monolith_s, MOT_GIMMICK_2, BLEND_N);
			DebugPrint("モノリスのアニメはGIMMICK_2です");
		}
	}

	//----------
	// ▼NPC配置
	//----------
	// ■レナーテ(オープニングシナリオ)
	if(main_num == GetFlagID_("CONST_SM_OPENING")){										// Num0 = 0
		if(op_num == GetFlagID_("CONST_SS_OP_APPEAR_RENATE")){
			local id_renate01 = ReadNpc_("n007");
			local npc_renate01 = ArrangePointNpc_(id_renate01, "npc_renate01");
			SetTalkEnable_(npc_renate01, false);	// 会話させない
		}
	}
	
	// ■レナーテ(高空シナリオ)
	if(main_num == GetFlagID_("CONST_SM_SKY")){											// Num0 = 8
		if(sky_num < GetFlagID_("CONST_SS_SK_FIND_OUT_THE_S_DOOR")){					// Num9 < 4
			local id_renate02 = ReadNpc_("n007");
			g_npc_renate02 <- C_NONE_ID;
			g_npc_renate02 = ArrangePointNpc_(id_renate02, "npc_renate02");
			SetTalkCameraType_(g_npc_renate02, TALK_CAMERA_UP);
			SetReactorMsg_(g_npc_renate02, "NPC_RENATE_030");
			// 会話カメラ時に透過されるのでアルファ値を設定する
			SetManualCalcAlpha_(g_npc_renate02, true);
			SetAlpha_(g_npc_renate02, 1.0);
		} else if(sky_num < GetFlagID_("CONST_SS_SK_GO_CITY_SKY")){						// Num9 < 12
			// 配置しない
		} else {
			local id_renate02 = ReadNpc_("n007");
			g_npc_renate02 <- C_NONE_ID;
			g_npc_renate02 = ArrangePointNpc_(id_renate02, "npc_renate02");
			SetTalkCameraType_(g_npc_renate02, TALK_CAMERA_UP);
			SetReactorMsg_(g_npc_renate02, "NPC_RENATE_030");
			// 会話カメラ時に透過されるのでアルファ値を設定する
			SetManualCalcAlpha_(g_npc_renate02, true);
			SetAlpha_(g_npc_renate02, 1.0);
		}
	}

	//-----------
	// ▼地雷配置
	//-----------
	// ID初期化
	mine_001 			<- C_NONE_ID;
	mine_002 			<- C_NONE_ID;
	g_mine_s_monolith 	<- C_NONE_ID;
	g_mine_reactor_pod	<- C_NONE_ID;
	
	// ■穴の出口付近に設置した地雷
	if(main_num == GetFlagID_("CONST_SM_OPENING")){										// Num0 = 0
		if(op_num == GetFlagID_("CONST_SS_OP_APPEAR_RENATE")){
			mine_001 = SetPointBoxEventMine_("m_001", false);
		}
	}

	// ■サンチョの残骸
	if(main_num <= GetFlagID_("CONST_SM_CORE")){										// Num0 = 7 以下
		mine_002 = SetPointCircleEventMine_("m_002", true);
	}

	// ■Sランク用モノリス
	if(main_num >= GetFlagID_("CONST_SM_SKY")											// Num0 = 8 以上
	&& sky_num  >= GetFlagID_("CONST_SS_SK_GO_TO_THE_COLOSSEUM")						// Num9 = 3 以上
	|| main_num >= GetFlagID_("CONST_SM_INSIDE_CLEAR")){								// Num0 = 9 以上
		g_mine_s_monolith = SetPointCircleEventMine_("mine_S_monolith", true);
	}

	// ■リアクターポッド用地雷
	g_mine_reactor_pod = SetPointCircleEventMine_("mine_reactor_pod", true);

	//-------------------------
	// ▼リアクターポイント配置
	//-------------------------
	// ■サンチョ
	if(main_num <= GetFlagID_("CONST_SM_CORE")){										// Num0 = 7 以下
		local reactorPoint01 = ArrangeMsgReactorPoint("reactor_point_01", GetFlagID_("BFG_REACTER_POINT_038")
			, SHORT_DIST, "REC_POINT_01_01", "REC_POINT_01_02");
	}
	// ■Sランク用モノリス
	if(main_num >= GetFlagID_("CONST_SM_SKY")											// Num0 = 8 以上
	&& sky_num  >= GetFlagID_("CONST_SS_SK_GO_TO_THE_COLOSSEUM")						// Num9 = 3 以上
	|| main_num >= GetFlagID_("CONST_SM_INSIDE_CLEAR")){								// Num0 = 9 以上
		local reactorPoint02 = ArrangeMsgReactorPoint("reactor_point_02", GetFlagID_("BFG_REACTER_POINT_039")
			, SHORT_DIST, "REC_POINT_02_01", "REC_POINT_02_02");
	}
	// ■リアクターポッド
	local reactorPoint03 = ArrangeMsgReactorPoint("reactor_point_03", GetFlagID_("BFG_REACTER_POINT_130")
	, SHORT_DIST, "REC_POINT_03_01", "REC_POINT_03_02");

	//-----------------
	// ▼マップナビ配置
	//-----------------
	// ■「！」アイコン
	// ■Sランク用モノリス
	if(main_num >= GetFlagID_("CONST_SM_SKY")											// Num0 = 8 以上
	&& sky_num  >= GetFlagID_("CONST_SS_SK_GO_TO_THE_COLOSSEUM")						// Num9 = 3 以上
	|| main_num >= GetFlagID_("CONST_SM_INSIDE_CLEAR")){								// Num0 = 9 以上
		local exclamation01 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "obj_S_monolith"); // 認証装置
		SetNaviMapIconVisible_(exclamation01, true);
	}

	EventEnd_();
}

//------------------------------------------------
//		フィールド操作開始
//------------------------------------------------
function EventStartOperate()
{
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");		// Num0
	op_num		 = GetNumFlg_("NUM_SCENARIO_SUB_OP");	// Num1
	green_num	 = GetNumFlg_("NUM_SCENARIO_SUB_GREEN");// Num2
	sky_num		 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");	// Num9
	DebugPrint(" ");
	DebugPrint("NUM_SCENARIO_MAIN の値は " + main_num + " になりました。");
	DebugPrint("NUM_SCENARIO_SUB_OP の値は " + op_num + " になりました。");
	DebugPrint("NUM_SCENARIO_SUB_GREEN の値は " + green_num + " になりました。");
	DebugPrint("NUM_SCENARIO_SUB_SKY の値は " + sky_num + " になりました。");
	
	// 洞くつ(H02_00)で復帰した際の座標と向き
	local rtn_demo_pos = Vec3(-105.17, 0.0, -24.299);
	local rtn_demo_dir = 0;

	//-----------
	// デモの再生
	//-----------
	// オープニングシナリオ
	if(main_num == GetFlagID_("CONST_SM_OPENING")){										// Num0 = 0
		if(op_num == GetFlagID_("CONST_SS_OP_SELECT_MONSTER")){
			// デモ再生前にフィールドが映らないための対応
			SetFade_(FADE_OUT, FADE_COLOR_WHITE, FADE_SHORT);
			SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
			WaitFade_();
			// 進行フラグを進める
			SetNumFlg_(op_num_sub, GetFlagID_("CONST_SS_OP_APPEAR_RENATE"));
			//道具フィールドコマンドをアクティブにする
			SetEventFlg_("BFG_TOOL_PROHIBIT", false);
			// 主人公の位置を設定
			SetReturnDemoPosDir_(rtn_demo_pos, rtn_demo_dir);
			// Demo049[レナーテ登場②]を再生
			ChangeDemo_(49);
		}
		else if(op_num == GetFlagID_("CONST_SS_OP_COLLAPSE_PARADISE")){
			// デモ再生前にフィールドが映らないための対応
			SetFade_(FADE_OUT, FADE_COLOR_WHITE, FADE_SHORT);
			SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
			WaitFade_();
			// シナリオのフラグを進める
			SetNumFlg_(op_num_sub, GetFlagID_("CONST_SS_OP_ESCAPE_PARADISE"));
			SetNumFlg_(green_num_sub, 0);
			//リアクターの初期機能状態設定
			SetEventFlg_("BFG_TRAVEL_INFO_SHOW_001", true);		// 旅の心得の項目解放フラグ	【基本】話す／しらべる
			// 草原へ飛ぶ
			SetReturnDemoMap_("H00_00");
			SetReturnDemoPosDir_(Vec3(1539.809, 496.073, -764.230), -91);
			// demo008[草原フィールド到着]を再生
			ChangeDemo_(8);
		}
	}
	
	// 高空シナリオ
	if(main_num == GetFlagID_("CONST_SM_SKY")){											// Num0 = 8
		if(sky_num == GetFlagID_("CONST_SS_SK_CONFESSIONS_RENATE_1")){					// Num9 = 0
			SetNumFlg_(sky_num_sub, GetFlagID_("CONST_SS_SK_CONFESSIONS_RENATE_2"));	// Num9 = 1
			// Demo615[レナーテの告白：草原Map]
			EventStartChangeDemo(615, FADE_COLOR_BLACK);
		}
		else if(sky_num == GetFlagID_("CONST_SS_SK_CONFESSIONS_RENATE_2")){				// Num9 = 1
			SetNumFlg_(sky_num_sub, GetFlagID_("CONST_SS_SK_CONFESSIONS_RENATE_3"));	// Num9 = 2
			// Demo616[レナーテの告白：高空ライドMap]
			EventStartChangeDemo(616, FADE_COLOR_BLACK);
		}
		else if(sky_num == GetFlagID_("CONST_SS_SK_CONFESSIONS_RENATE_3")){				// Num9 = 2
			SetNumFlg_(sky_num_sub, GetFlagID_("CONST_SS_SK_GO_TO_THE_COLOSSEUM"));		// Num9 = 3
			//デモ再生後の復帰座標を指定
			SetReturnDemoPosDir_(Vec3(-0.216, 0.0, 2.33), 145);
			// Demo617[レナーテの告白：草原Map]
			EventStartChangeDemo(617, FADE_COLOR_BLACK);
		}
		//バーチャルコロシアムでSランク入手後
		else if(sky_num == GetFlagID_("CONST_SS_SK_GO_OUT_THE_COLOSSEUM_2")){			// Num9 = 99
			SetNumFlg_(sky_num_sub, 12);												// Num9 = 12
			// ルーラ＆フライトシグナル禁止を解除する
			SetEventFlg_("BFG_PLAYERABILITY_RULER_PROHIBIT", false);					// ルーラ 禁止
			SetEventFlg_("BFG_FLIGHT_PROHIBIT", false);									// フライトシグナル 禁止
			// デモ後の復帰位置を指定
			SetReturnDemoPosDir_(Vec3(20.915, 0.0, -1.250), -123);
			//Demo624[テイクオフの前に]
			EventStartChangeDemo(624, FADE_COLOR_BLACK);
		}
	}
	
	
	EventEnd_();
}

//------------------------------------------------
//		ＮＰＣ接触直後
//------------------------------------------------
function BeforeTalkNpc()
{
	local target = GetTargetId_();
	
	// ライド中にレナーテに話しかけた時
	if(target == g_npc_renate02){
		SetRideTalkCamOffset(OFFSET_RENATE);
	}

	EventEnd_();
}

//------------------------------------------------
//		ＮＰＣ接触時
//------------------------------------------------
function TouchNpc()
{
	// シナリオのフラグを取得する
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");		// Num0
	op_num		 = GetNumFlg_("NUM_SCENARIO_SUB_OP");	// Num1
	green_num	 = GetNumFlg_("NUM_SCENARIO_SUB_GREEN");// Num2
	sky_num		 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");	// Num9
	
	// IDを取得
	local target = GetTargetId_();
	local player = GetPlayerId_();
	
	DebugPrint("ID: " + target + " に接触 [TouchEventMine]");
	
	switch (target) {
	case g_npc_renate02 :
		
		if (sky_num <= GetFlagID_("CONST_SS_SK_GO_OUT_THE_COLOSSEUM_1")) {			// Num9 = 11 以下
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_RENERTE");
			ShowMsg_("NPC_RENERTE_010");				//「行きましょう  バーチャルコロシアムへ。
			KeyInputWait_();
			CloseMsgWnd_();
		}
		if (sky_num >= GetFlagID_("CONST_SS_SK_GO_CITY_SKY")) {						// Num9 = 12 以上
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_RENERTE");
			ShowMsg_("NPC_RENERTE_020");				//「○主人公の名前○  フライトシグナルで
			KeyInputWait_();
			CloseMsgWnd_();
		}
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
	// シナリオのフラグを取得する
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");		// Num0
	op_num		 = GetNumFlg_("NUM_SCENARIO_SUB_OP");	// Num1
	green_num	 = GetNumFlg_("NUM_SCENARIO_SUB_GREEN");// Num2
	sky_num		 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");	// Num9

	// IDを取得
	local target = GetTouchEventMineId_();
	local player = GetPlayerId_();

	switch(target){

	// ■穴の出口付近
	case mine_001:
		// イベント地雷を削除
		DeleteEventMine_(mine_001);
		// シナリオのサブフラグを進める
		SetNumFlg_(op_num_sub, GetFlagID_("CONST_SS_OP_COLLAPSE_PARADISE"));
		// 配置修正
		SetReturnDemoPosDir_(Vec3(7.042, 46.696, -75.398), 5);
		// demo050[楽園からの脱出](旧demo008[楽園からの脱出])が再生される
		ChangeDemo_(50);
		break;

	// ■サンチョの残骸
	case mine_002:
		// 残骸の方向に主人公を向ける
		CommPlayerTurnAroundObj(gim_sancho);
		OpenMsgWnd_();
		ShowMsg_("MES_CARCASS_SANCHO");
		KeyInputWait_();
		CloseMsgWnd_();
		break;

	// ■Sランク用モノリス
	case g_mine_s_monolith:
		// 主人公を出口に向ける
		CommPlayerTurnAroundObj(monolith_s);
		// モノリスのアニメを再生(EventCommon)
		MonolithAnime(monolith_s, "BFG_START_S_MONOLITH", "obj_S_monolith");
		ChangeMapPosDir_("O01_00", Vec3(0.0, 10.0, -1260.0), 0);
		break;

	// ■リアクターポッド
	case g_mine_reactor_pod:
		// 主人公をリアクターポッドの座標に向ける< リアクターポッドはデザイン配置なので座標を指定 >
		local pos = Vec3(-23.337, 0.000, 70.084);
		uPlayerTurnAroundPos(pos);
		OpenMsgWnd_();
		ShowMsg_("EXAMINE_POD_MSG");
		KeyInputWait_();
		CloseMsgWnd_();
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

//======================================================
// 自作関数：対象座標に主人公を振り向かせる
//------------------------------------------------------
// 第一引数：主人公を振り向かせる座標
// 戻り値  ：なし
//======================================================
function uPlayerTurnAroundPos(pos)
{
	local player = GetPlayerId_();
	// 対象物の方向に回転(1Fで11.4°ずつ回転)
	local rotateTask = Task_RotateToPosSetMotion_(player, pos, ROTATE_EVENT_DEF, MOT_WALK, MOT_WAIT);
	WaitTask(rotateTask);
	// 間を持たせる
	Wait_(15);
}

