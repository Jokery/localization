//===================== C00_00コア １層目（入口） ====================

// 変数定義
main_num	 <- C_NONE_ID;
core_num	 <- C_NONE_ID;
outside_num	 <- C_NONE_ID;

core_num_sub <- "NUM_SCENARIO_SUB_CORE";
outside_num_sub <- "NUM_SCENARIO_SUB_INSIDE_CLEAR";

//------------------------------------------------
//		戦闘終了後
//------------------------------------------------
function AfterBattle()
{
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");		// Num0
	core_num	 = GetNumFlg_("NUM_SCENARIO_SUB_CORE");	// Num8
	
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
	core_num	 = GetNumFlg_("NUM_SCENARIO_SUB_CORE");	// Num8
	outside_num	 = GetNumFlg_("NUM_SCENARIO_SUB_INSIDE_CLEAR");	// Num10
	
	// 裏シナリオでコアに入ってDemo825[コアの現状]を再生するタイミング
	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){			// Num0  ==  9
		if(outside_num == GetFlagID_("CONST_SS_OS_GO_TO_CORE")){	// Num10 == 12
			//ライド強制解除
			SetRideOffStart_();
		}
	}
	
	// ライドしたまま移動装置を使って来たらライド強制解除
	if(GetEventFlg_("BFG_RIDE_OFF_USED_TRANSFER") == true){
		SetEventFlg_("BFG_RIDE_OFF_USED_TRANSFER", false);
		SetRideOffStart_();
	}
	
	EventEnd_();
}


//------------------------------------------------
//		フェードアウト中
//------------------------------------------------
function FadeIn()
{
	// マップ到達フラグ
	SetEventFlg_("BFG_ARRIVE_AT_C00", true);
	// セーブ禁止を解除(セーブ禁止マップから帰ってきた時用)
	SetEventFlg_("BFG_SAVE_PROHIBIT", false);		// セーブ禁止(Bit451)
	
	//変数定義
	local	player;
	
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");		// Num0
	core_num	 = GetNumFlg_("NUM_SCENARIO_SUB_CORE");	// Num8
	outside_num	 = GetNumFlg_("NUM_SCENARIO_SUB_INSIDE_CLEAR");	// Num10
	
	player		 = GetPlayerId_();
	
	DebugPrint(" ");
	DebugPrint("NUM_SCENARIO_MAIN の値は " + main_num + " になりました。");
	DebugPrint("NUM_SCENARIO_SUB_CORE の値は " + core_num + " になりました。");
	
	//----------
	// ▼PC配置(デバッグ用)
	//----------
	//	SetPos_(player, Vec3(0.0, -11.0, 0.0));
	//	SetDir_(player, 50);
	
	//----------
	// ▼NPC配置
	//----------
	// ID初期化
	g_npc_renate <- C_NONE_ID;
	g_npc_aroma  <- C_NONE_ID;
	
	// レナーテ
	if(main_num == GetFlagID_("CONST_SM_CORE")){					// Num0 == 7
		if(core_num == GetFlagID_("CONST_SS_CO_GO_MOTHER_ROOM")){	// Num8 == 1
			local n000ResId = ReadNpc_("n007");
			g_npc_renate = ArrangePointNpc_(n000ResId, "npc_renate");
			SetReactorMsg_(g_npc_renate, "NPC_RENATE_REC");
			SetTalkCameraType_(g_npc_renate, TALK_CAMERA_UP);
			// 会話カメラ時に透過されるのでアルファ値を設定する
			SetManualCalcAlpha_(g_npc_renate, true);
			SetAlpha_(g_npc_renate, 1.0);
		}
	}
	
	// アロマ
	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){				// Num0  ==  9
		if(outside_num == GetFlagID_("CONST_SS_OS_GO_TO_MOTHER_ROOM")){	// Num10 == 13
			g_npc_aroma = ReadAndArrangePointNpc("n018", "npc_aroma");
			SetTalkCameraType_(g_npc_aroma, TALK_CAMERA_UP);
			SetReactorMsg_(g_npc_aroma, "NPC_AROMA_REC");
			// 会話カメラ時に透過されるのでアルファ値を設定する
			SetManualCalcAlpha_(g_npc_aroma, true);
			SetAlpha_(g_npc_aroma, 1.0);
		}
	}
	
	//-----------------
	// ▼モンスター配置
	//-----------------
	// アロマがいない時だけ配置する
	if(outside_num != GetFlagID_("CONST_SS_OS_GO_TO_MOTHER_ROOM")){	// Num10 != 13
		// コア突入口(C00_00)のモンスター配置を制御するフラグ
		SetEventFlg_("BFG_DISPOSITION_MONSTER_C00_00", true);
	}
	
	//-----------
	// ▼地雷配置
	//-----------
	// ID初期化
	g_mine_enter_transfer	 <- C_NONE_ID;
	g_mine_barrier <- C_NONE_ID;
	g_mine_ruler_point <- C_NONE_ID;
	
	// ■転送装置（焦熱の火山）
	g_mine_enter_transfer 	= SetPointCircleEventMine_("mine_enter_transfer", true);
	
	// ■進入不可(裏シナリオ)
	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){								// Num0  ==  9
		if(outside_num <= GetFlagID_("CONST_SS_OS_GO_TO_CORE")){						// Num10 == 12
			g_mine_barrier = SetPointCircleEventMine_("mine_barrier", false);
		}
	}
	
	// ■ルーラポイント
	g_mine_ruler_point = SetPointCircleEventMine_("mine_ruler_point", true);
	
	//---------------
	// ▼ギミック配置
	//---------------
	// ID初期化
	g_ruler_point <- C_NONE_ID;
	
	// ■バリア(エフェクト)
	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){								// Num0  ==  9
		if(outside_num <= GetFlagID_("CONST_SS_OS_GO_TO_CORE")){						// Num10 == 12
			LoadEffect_("ef882_03_barrier_ren");
			local effectId = SetPointWorldEffect_("ef882_03_barrier_ren", "eff_barrier");
		}
	}
	
	// ■ルーラポイント
	local rulerpoint_id = ReadGimmick_("o_com_08");
	g_ruler_point = ArrangePointGimmick_("o_com_08", rulerpoint_id, "gim_ruler_point");
	SetMotion_(g_ruler_point, MOT_GIMMICK_0, BLEND_N);
	if(GetEventFlg_("BFG_RULER_ADD_024") == true){
		SetMotion_(g_ruler_point, MOT_GIMMICK_2, BLEND_N);
	}
	
	//-------------------------
	// ▼リアクターポイント配置
	//-------------------------
	// ■移動装置扉
	local rec_point_transfer = ArrangeMsgReactorPoint("rec_transfer", GetFlagID_("BFG_REACTER_POINT_115")// Bit_1614 コアの移動装置
		, SHORT_DIST, "REC_POINT_TRANSFER_010", "REC_POINT_TRANSFER_020");
	
	// ■ルーラポイント
	local reactorPoint01  = ArrangeMsgReactorPoint("ReactorPoint_01", GetFlagID_("BFG_REACTER_POINT_010")
		, SHORT_DIST, "REC_POINT_01_01", "REC_POINT_01_02");
	
	
	//-----------------
	// ▼マップナビ配置
	//-----------------
	// ■ルーラポイントアイコン
	if(GetEventFlg_("BFG_RULER_ADD_024") == true){				// Bit_224 ルーラ追加 コア　突入口
		local ruler_icon = ArrangePointNaviMapIcon_(NAVIMAP_ICON.RULER_POINT , "gim_ruler_point");
		SetNaviMapIconVisible_(ruler_icon, true);
	}
	
	EventEnd_();
}


//------------------------------------------------
//		フィールド操作開始
//------------------------------------------------
function EventStartOperate()
{
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");									// Num0
	core_num	 = GetNumFlg_("NUM_SCENARIO_SUB_CORE");								// Num8
	outside_num	 = GetNumFlg_("NUM_SCENARIO_SUB_INSIDE_CLEAR");						// Num10
	
	//---------------------------------------------------------------------------------------
	// ▼セーブ画面の呼び出し(大陸間移動の初回デモ再生前に「SetEventFlg_("BFG_SAVE_POINT_FLAG", true);」を追加して下さい)
	//---------------------------------------------------------------------------------------
	// コアに来て最初のタイミング
	if(main_num == GetFlagID_("CONST_SM_CORE")){
		if(core_num == 0){
			CommSavedAfterTransferDemo("BFG_SCENARIO_CLEAR_VOLCANO");
		}
	}
	
	if (main_num == GetFlagID_("CONST_SM_CORE")) {									// Num0 = 7
		if (core_num == 0) {														// Num8 = 0
			SetNumFlg_(core_num_sub, GetFlagID_("CONST_SS_CO_GO_MOTHER_ROOM"));		// Num8 = 1
			SetReturnDemoPosDir_(Vec3(-150.941, 0.000, -59.218), 70);
			// Demo600[コア・全景]再生
			EventStartChangeDemo(600, FADE_COLOR_BLACK);
		}
	}
	
	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){								// Num0  ==  9
		if(outside_num == GetFlagID_("CONST_SS_OS_GO_TO_CORE")){						// Num10 == 12
			SetNumFlg_(outside_num_sub, GetFlagID_("CONST_SS_OS_GO_TO_MOTHER_ROOM"));	// Num10 == 13
			// アロマ配置中はモンスターを配置しない
			SetEventFlg_("BFG_DISPOSITION_MONSTER_C00_00", false);
			// Demo825[コアの現状]の再生
			SetReturnDemoPosDir_(Vec3(93.720, 0.000, 40.396), 90);
			EventStartChangeDemo(825, FADE_COLOR_BLACK);
		}
	}
	
	EventEnd_();
}


//==============================================================
// NPCに話しかけて会話の直前で起動するイベントブロック
//==============================================================
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
	main_num = GetNumFlg_("NUM_SCENARIO_MAIN");     // Num0
	core_num = GetNumFlg_("NUM_SCENARIO_SUB_CORE"); // Num8
	
	local target = GetTargetId_();
	
	switch (target) {
	case g_npc_renate:
		uRenateMsg();
		break;
	case g_npc_aroma:
		uAromaMsg();
		break;
	default :
		DebugPrint("WARNING : MINE_IDが不正です [TouchEventMine]");
		break;
	}
	
	EventEnd_();
}

//------------------------------------------------
//		地雷接触時
//------------------------------------------------
function TouchEventMine()
{
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");		// Num0
	core_num	 = GetNumFlg_("NUM_SCENARIO_SUB_CORE");	// Num8
	
	local target = GetTouchEventMineId_();
	
	DebugPrint("ID: " + target + " に接触 [TouchEventMine]");
	
	switch (target) {
	case g_mine_ruler_point:
		uMineRulerPoint();
		break;
	case g_mine_enter_transfer :
		uMineEnterTransfer();
		break;
	case g_mine_barrier :
		OpenMsgWnd_();
		ShowMsg_("BARRIER_MSG");
		KeyInputWait_();
		CloseMsgWnd_();
		CommPlayerTurnMoveDirWalk(-110);
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



//=========================================================================================================
//									▼▼▼ここから下はローカル関数▼▼▼
//=========================================================================================================

//++++++++++++++++++++++++++++++++++++++++++++++++
//		ルーラポイントの地雷に触れた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineRulerPoint()
{
	CommPlayerTurnAroundObj(g_ruler_point);
	CommRulerPointEvent(g_ruler_point, "BFG_RULER_ADD_024", "gim_ruler_point");
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		レナーテのメッセージ処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uRenateMsg()
{
	main_num = GetNumFlg_("NUM_SCENARIO_MAIN");		// Num0
	core_num = GetNumFlg_("NUM_SCENARIO_SUB_CORE");	// Num8
	
	if(main_num == GetFlagID_("CONST_SM_CORE")){					// Num0 == 7
		// Demo600[コア・全景]の再生後
		if(core_num == GetFlagID_("CONST_SS_CO_GO_MOTHER_ROOM")){	// Num8 == 1
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_RENERTE");
			ShowMsg_("RENATE_MSG");
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		アロマのメッセージ処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uAromaMsg()
{
	main_num = GetNumFlg_("NUM_SCENARIO_MAIN");					// Num0
	outside_num = GetNumFlg_("NUM_SCENARIO_SUB_INSIDE_CLEAR");	// Num10
	
	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){				// Num0 = 9
		if(outside_num == GetFlagID_("CONST_SS_OS_GO_TO_MOTHER_ROOM")){	// Num10=13
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_AROMA");
			ShowMsg_("AROMA_MSG");
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		転送装置の地雷
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineEnterTransfer()
{
	CommPlayerTurnAroundDir(-135);
	local dont_use_transfer = GetEventFlg_("BFG_DONT_TRANSFER_VOLCANO_TO_CORE");// 火山-コア間の大陸移動装置の使用を禁止するフラグ
	
	if(dont_use_transfer == false){
		// 選択肢メッセージ
		OpenMsgWnd_();
		ShowMsg_("TRANSFER_MSG");
		KeyInputWait_();
		if(GetQueryResult_() == QUERY_YES){
			CloseMsgWnd_();
			DeleteEventMine_(g_mine_enter_transfer);
			
			// 大陸移動装置を使って大陸移動した場合、ライドを解除するために使用するフラグ
			SetEventFlg_("BFG_RIDE_OFF_USED_TRANSFER", true);
			// 主人公にテレポートエフェクトをつける
			//IDの取得
			local player = GetPlayerId_();
			// α値の設定
			local alpha_def = 1.0;
			// α値を変更する前は必ずこの命令を記載
			SetManualCalcAlpha_(player, true);
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
			// 暗転させる(主人公が消えたままにならないようにここで暗転させてα値を元に戻す)
			SetFade_(FADE_OUT, FADE_COLOR_BLACK, 15);
			SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, 15);
			WaitFade_();
			// 主人公のα値を元に戻す
			SetAlpha_(player, 1.0);
			
			// 火山の復帰位置
			ChangeMapPosDir_("V00_00", Vec3(-545.718, 1488.606, -1079.813), 0);
		}
		else{
			CloseMsgWnd_();
		}
	}
	// 転送装置の使用禁止中だった場合
	else{
		// システムメッセージ
		OpenMsgWnd_();
		ShowMsg_("DONT_USE_TELEPORTER_010");		// 転送装置は　動いていない。
		KeyInputWait_();
		CloseMsgWnd_();
	}
}







