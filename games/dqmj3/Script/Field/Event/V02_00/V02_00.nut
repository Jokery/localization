//===================== V02_00秘密基地1F(溶岩洞窟) ====================
// 変数定義
main_num	 <- C_NONE_ID;
volcano_num	 <- C_NONE_ID;
player <- C_NONE_ID;

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

	// マップ到達フラグ
	SetEventFlg_("BFG_ARRIVE_AT_V02", true);

	// Demo521[秘密基地へ]が削除されたので以下の進行度の時だけシナリオフラグを進める
	if(main_num == GetFlagID_("CONST_SM_VOLCANO")){
		if(volcano_num == GetFlagID_("CONST_SS_HV_FIND_OUT_AUTHEN_SYSTEM")){		 // Num7 = 24 
			SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_HV_ENTER_THE_ALIAS_ROOM")); // Num7 24 → 25
		}
	}

	//---------------
	// ▼ギミック配置
	//---------------
	// ID初期化
//	g_rulerpoint		 <- C_NONE_ID;
	g_gmk_elevator_door	 <- C_NONE_ID;
	g_gmk_elevator_lift	 <- C_NONE_ID;

	// リソース読み込み
	local id_rulerpoint = ReadGimmick_("o_com_08");	// ルーラポイント
	local id_elevator_door	 = ReadGimmick_("o_V02_06");	// エレベータの扉
	local id_elevator_lift	 = ReadGimmick_("o_V02_03");	// エレベータのリフト

	// ■エレベータの扉
	g_gmk_elevator_door = ArrangePointGimmick_("o_V02_06", id_elevator_door, "gmk_elevator_door");

	// ■エレベータのリフト
	g_gmk_elevator_lift = ArrangePointGimmick_("o_V02_03", id_elevator_lift, "gmk_elevator_lift");

	// ■ルーラポイント(V00_00に移動したのでコメント化)
//	g_rulerpoint = ArrangePointGimmick_("o_com_08", id_rulerpoint, "g_ruler_point");
//	if(GetEventFlg_("BFG_RULER_ADD_022") == true){
//		SetMotion_(g_rulerpoint, MOT_GIMMICK_2, BLEND_N);
//	}

	//----------
	// ▼NPC関連
	//----------

	//-----------
	// ▼地雷配置
	//-----------
	// ID初期化
	g_elevator <- C_NONE_ID;
//	mine_ruler <- C_NONE_ID;	// ルーラポイント( BFG_RULER_ADD_022 )
	mine_phantom_wall <- C_NONE_ID;// 幻の壁

	// ■エレベーター
	// エレベーターのマップチェンジ地雷(α仮対応)
	g_elevator = SetPointBoxEventMine_("g_elevator_01", true);
	// ■ルーラポイント(V00_00に移動したのでコメント化)
//	mine_ruler = SetPointCircleEventMine_("mine_ruler", true);
	// ■幻の壁
	local bit_phantom_wall = GetEventFlg_("BFG_OPEN_SECRET_AREA_V02_00");
	if(bit_phantom_wall == false){
		mine_phantom_wall = SetPointBoxEventMineNoFallWait_("mine_phantom_wall");
	}

	//---------------------
	// ▼リアクターポイント
	//---------------------
	// エレベーター
	local reactorPoint01 = ArrangeMsgReactorPoint("reactorPoint01", GetFlagID_("BFG_REACTER_POINT_085")
		, SHORT_DIST, "REC_POINT_01_01", "REC_POINT_01_02");
	// ルーラポイント(V00_00に移動したのでコメント化)
//	local reactorPoint02 = ArrangeMsgReactorPoint("reactorPoint02", GetFlagID_("BFG_REACTER_POINT_010")
//		, SHORT_DIST, "REC_POINT_02_01", "REC_POINT_02_02");

	EventEnd_();
}	
//------------------------------------------------
//		フィールド操作開始
//------------------------------------------------
function EventStartOperate()
{
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");
	volcano_num	 = GetNumFlg_("NUM_SCENARIO_SUB_VOLCANO");
	
	/*
		処理なし
	*/
	
	EventEnd_();
}

//------------------------------------------------
//		ＮＰＣ接触時
//------------------------------------------------
function TouchNpc()
{
/*
// 現状NPCは配置しないのでコメント化
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");			// Num0
	volcano_num	 = GetNumFlg_("NUM_SCENARIO_SUB_VOLCANO");	// Num6
	
	local target = GetTargetId_();
	
	DebugPrint(" ");
	DebugPrint("ID: " + target + " に接触 [TouchNpc]");
	
	switch (target)
	{
	default :
		DebugPrint("WARNING : NPC_IDが不正です [TouchNpc]");
		break;
	}
*/

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
	case g_elevator :
		local pl_dir = -30;
		CommPlayerTurnAroundDir(pl_dir);
		uMineElevator();
		break;
//	case mine_ruler :
//		uMineRuler();
//		break;
	case mine_phantom_wall:
		local bit_phantom_wall = GetEventFlg_("BFG_OPEN_SECRET_AREA_V02_00");
		if(bit_phantom_wall == false){
			SetEventFlg_("BFG_OPEN_SECRET_AREA_V02_00", true);
			DeleteEventMine_(mine_phantom_wall);
		}
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
//		エレベーターを調べたとき
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineElevator()
{
	OpenMsgWnd_();
	ShowMsg_("VOLCANO_ELEVATOR");
	KeyInputWait_();
	// 【はいの場合：１】
	if (GetQueryResult_() == QUERY2_0){
		CloseMsgWnd_();
		// 地雷削除
		DeleteEventMine_(g_elevator);
		// エレベータで移動SE
		PlaySE_("SE_FLD_061");
		// B1Fへ移動
		ChangeMapPosDir_("V02_01", Vec3(-480.0, 10.0, -0), 90);
	}
	// 【いいえの場合：１】
	else{
		CloseMsgWnd_();
		// 地雷を再設置
		SetPointBoxEventMine_("g_elevator_01", true);
	}
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		ルーラポイントを調べたとき
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineRuler()
{
	CommPlayerTurnAroundObj(g_rulerpoint);
	CommRulerPointEvent(g_rulerpoint, "BFG_RULER_ADD_022", "g_ruler_point");
}

