//===================== I01_01氷の霊園 ====================


//------------------------------------------------
//		戦闘終了後
//------------------------------------------------
function AfterBattle()
{
	local main_num			= GetNumFlg_("NUM_SCENARIO_MAIN");							// Num0
	local ice_event_num		= GetNumFlg_("NUM_SCENARIO_SUB_ICE");						// Num5

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
	local main_num			 = GetNumFlg_("NUM_SCENARIO_MAIN");							// Num0
	local ice_event_num		 = GetNumFlg_("NUM_SCENARIO_SUB_ICE");						// Num5
	
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
	local main_num			 = GetNumFlg_("NUM_SCENARIO_MAIN");							// Num0
	local ice_event_num		 = GetNumFlg_("NUM_SCENARIO_SUB_ICE");						// Num5

	DebugPrint(" ");
	DebugPrint("NUM_SCENARIO_MAIN の値は " + main_num + " になりました。");
	//----------
	// ▼NPC配置
	//----------
	// ID初期化
	g_gost		 <- C_NONE_ID;
	g_silver	 <- C_NONE_ID;

	// リソース読み込み
	local id_silver   = ReadNpc_("m077_00");	// シルバーモデル
	local id_gost     = ReadNpc_("m041_02");	// 幽霊モデル(※メイジももんじゃ)

	// ■幽霊
	// 氷原シナリオ中
	if(main_num <= GetFlagID_("CONST_SM_ICE_FIELD")){									// Num0 = 4
		g_gost  = ArrangePointNpc_(id_gost,  "NPC_02");
		SetReactorMsg_(g_gost, "NPC_GOST_REC");
		SetTalkCameraType_(g_gost, TALK_CAMERA_UP);//カメラの設定
		SetScaleSilhouette(g_gost, SCALE.N , SILHOUETTE_WIDTH.N);//サイズの設定
	}
	// 監獄シナリオ以降
	else{
		g_gost  = ArrangePointNpc_(id_gost,  "NPC_01_2");
		SetDir_(g_gost, -154);
		SetReactorMsg_(g_gost, "NPC_GOST_REC");
		SetTalkCameraType_(g_gost, TALK_CAMERA_UP);//カメラの設定
		SetScaleSilhouette(g_gost, SCALE.N , SILHOUETTE_WIDTH.N);//サイズの設定
	}

	// ■シルバー
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){									// Num0 = 4
		//[生きていたシルバー]の再生後から[イエタスの死体]の再生後
		if(ice_event_num == GetFlagID_("CONST_SS_IF_EXAMINE_THE_ICE_WALL"))				// Num5 = 18
		{
			g_silver  = ArrangePointNpc_(id_silver,  "NPC_01");
			SetReactorMsg_(g_silver, "NPC_SILVER_REC");
			SetTalkCameraType_(g_silver, TALK_CAMERA_UP);//カメラの設定
			SetScaleSilhouette(g_silver, SCALE.N ,SILHOUETTE_WIDTH.N);//サイズの設定
		}
		if( ice_event_num == GetFlagID_("CONST_SS_IF_SECOND_ATTACK"))					// Num5 = 19
		{
			g_silver  = ArrangePointNpc_(id_silver,  "NPC_01_2");
			SetReactorMsg_(g_silver, "NPC_SILVER_REC");
			SetTalkCameraType_(g_silver, TALK_CAMERA_UP);//カメラの設定
			SetScaleSilhouette(g_silver, SCALE.N ,SILHOUETTE_WIDTH.N);//サイズの設定
		}
	}
	//-----------
	// ▼地雷配置
	//-----------
	// ID初期化
	g_mine01	 <- C_NONE_ID;
	g_mine02	 <- C_NONE_ID;
	g_mine_disc	 <- C_NONE_ID;

	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){									// Num0 = 4
		// ■氷の霊園の中にある、シルバーの棺の地雷
		if(ice_event_num == GetFlagID_("CONST_SS_IF_GO_TO_THE_ICE_CEMETERY")){			// Num5 = 17
			g_mine01 = SetPointCircleEventMine_("mine01", true);
		}
		// ■氷の霊園の中にある、人口氷壁の地雷
		if(ice_event_num == GetFlagID_("CONST_SS_IF_EXAMINE_THE_ICE_WALL")){			// Num5 = 18
			g_mine02 = SetPointCircleEventMine_("mine02", true);
		}
	}
	
	// ■メタルディスク
	if(GetEventFlg_("BFG_PLAYED_METAL_DISC_MSG") == false){	// メタルディスク入手メッセージを見たか？
		if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){									// Num0 = 4
			if(ice_event_num >= GetFlagID_("CONST_SS_IF_EXAMINE_THE_ICE_WALL")){			// Num5 = 18
				g_mine_disc = SetPointCircleEventMine_("mine_disc", false);
			}
		}
		else if(main_num >= GetFlagID_("CONST_SM_PRISON")){									// Num0 = 5
			g_mine_disc = SetPointCircleEventMine_("mine_disc", false);
		}
	}
	
	//-----------------
	// ▼エフェクト配置
	//-----------------
	// ID初期化
	g_efc_disc <- C_NONE_ID;
	
	// ■メタルディスク
	if(GetEventFlg_("BFG_PLAYED_METAL_DISC_MSG") == false){	// メタルディスク入手メッセージを見たか？
		if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){									// Num0 = 4
			if(ice_event_num >= GetFlagID_("CONST_SS_IF_EXAMINE_THE_ICE_WALL")){			// Num5 = 18
				LoadEffect_("EF300_40_ITEM_SIGN");
				g_efc_disc = SetPointWorldEffect_("EF300_40_ITEM_SIGN", "efc_disc");
			}
		}
		else if(main_num >= GetFlagID_("CONST_SM_PRISON")){									// Num0 = 5
			LoadEffect_("EF300_40_ITEM_SIGN");
			g_efc_disc = SetPointWorldEffect_("EF300_40_ITEM_SIGN", "efc_disc");
		}
	}
	
	//---------------
	// ▼ギミック配置
	//---------------
	// リソース読み込み
	local id_yetas			 = ReadGimmick_("o_dem_08");
	local id_hitugi_futa	 = ReadGimmick_("o_I01_03");
	local id_hitugi			 = ReadGimmick_("o_I01_04");
	local id_hitugi_open	 = ReadGimmick_("o_I01_05");
	
	// ■イエタスの死体
	local yetas = ArrangePointGimmick_("o_dem_08", id_yetas, "g_yetas");

	// ■人口氷壁
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){									// Num0 = 4
		if(ice_event_num <= GetFlagID_("CONST_SS_IF_EXAMINE_THE_ICE_WALL")){			// Num5 <= 18
			local id_aice_wall	 = ReadGimmick_("o_I01_01");
			local aice_wall		 = ArrangePointGimmick_("o_I01_01", id_aice_wall, "g_aice_wall");
		} else {
			local id_break_aice_wall = ReadGimmick_("o_I01_02");
			local break_aice_wall	 = ArrangePointGimmick_("o_I01_02", id_break_aice_wall, "g_aice_wall");
		}
	} else {
		local id_break_aice_wall = ReadGimmick_("o_I01_02");
		local break_aice_wall	 = ArrangePointGimmick_("o_I01_02", id_break_aice_wall, "g_aice_wall");
	}
	
	// ■棺桶
	local hitugi = ArrangePointGimmick_("o_I01_04", id_hitugi, "g_hitugi");

	// ■棺桶の蓋（閉じた状態）
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){									// Num0 = 4
		if(ice_event_num < GetFlagID_("CONST_SS_IF_EXAMINE_THE_ICE_WALL")){				// Num5 < 18
			local hitugi_futa = ArrangePointGimmick_("o_I01_03", id_hitugi_futa, "g_hitugi_futa");
		}
	}
	
	// ■棺桶の蓋（開いた状態）
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){									// Num0 = 4
		if(ice_event_num >= GetFlagID_("CONST_SS_IF_EXAMINE_THE_ICE_WALL")){			// Num5 >= 18
			local hitugi_open = ArrangePointGimmick_("o_I01_05", id_hitugi_open, "g_hitugi_open");
		}
	} else {
		local hitugi_open = ArrangePointGimmick_("o_I01_05", id_hitugi_open, "g_hitugi_open");
	}

	//-------------------------
	// ▼リアクターポイント配置
	//-------------------------
	// ■人口氷壁
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){									// Num0 = 4
		if(ice_event_num <= GetFlagID_("CONST_SS_IF_EXAMINE_THE_ICE_WALL")){			// Num5 <= 18
			local reactorPoint01 = ArrangeMsgReactorPoint("recpoint_01_kabe", GetFlagID_("BFG_REACTER_POINT_060")// Bit_1559
				, SHORT_DIST, "REC_POINT_ICE_01", "REC_POINT_ICE_01_2");
		}
	}

	// ■氷の棺桶 １－８
	local reactorPoint02_1 = ArrangeMsgReactorPoint("recpoint_02_kanoke01", GetFlagID_("BFG_REACTER_POINT_061")// Bit_1560
		, SHORT_DIST, "REC_POINT_ICE_02", "REC_POINT_ICE_02_2");

	local reactorPoint02_2 = ArrangeMsgReactorPoint("recpoint_02_kanoke02", GetFlagID_("BFG_REACTER_POINT_061")// Bit_1560
		, SHORT_DIST, "REC_POINT_ICE_02", "REC_POINT_ICE_02_2");

	local reactorPoint02_3 = ArrangeMsgReactorPoint("recpoint_02_kanoke03", GetFlagID_("BFG_REACTER_POINT_061")// Bit_1560
		, SHORT_DIST, "REC_POINT_ICE_02", "REC_POINT_ICE_02_2");

	local reactorPoint02_4 = ArrangeMsgReactorPoint("recpoint_02_kanoke04", GetFlagID_("BFG_REACTER_POINT_061")// Bit_1560
		, SHORT_DIST, "REC_POINT_ICE_02", "REC_POINT_ICE_02_2");

	local reactorPoint02_5 = ArrangeMsgReactorPoint("recpoint_02_kanoke05", GetFlagID_("BFG_REACTER_POINT_061")// Bit_1560
		, SHORT_DIST, "REC_POINT_ICE_02", "REC_POINT_ICE_02_2");

	local reactorPoint02_6 = ArrangeMsgReactorPoint("recpoint_02_kanoke06", GetFlagID_("BFG_REACTER_POINT_061")// Bit_1560
		, SHORT_DIST, "REC_POINT_ICE_02", "REC_POINT_ICE_02_2");

	local reactorPoint02_7 = ArrangeMsgReactorPoint("recpoint_02_kanoke07", GetFlagID_("BFG_REACTER_POINT_061")// Bit_1560
		, SHORT_DIST, "REC_POINT_ICE_02", "REC_POINT_ICE_02_2");

	local reactorPoint02_8 = ArrangeMsgReactorPoint("recpoint_02_kanoke08", GetFlagID_("BFG_REACTER_POINT_061")// Bit_1560
		, SHORT_DIST, "REC_POINT_ICE_02", "REC_POINT_ICE_02_2");

	//-------------------------
	// ▼ナビマップアイコン配置
	//-------------------------
	// ID初期化
	exclamation03 <- C_NONE_ID;
	
	// ■シルバーの棺
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){								// Num0 = 4
		if(ice_event_num < GetFlagID_("CONST_SS_IF_EXAMINE_THE_ICE_WALL")){			// Num5 < 18
			local exclamation01 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "mine01");
		}
	}
	// ■新しい壁
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){								// Num0 = 4
		if(ice_event_num == GetFlagID_("CONST_SS_IF_EXAMINE_THE_ICE_WALL")){		// Num5 = 18
			local exclamation02 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "mine02");
		}
	}
	
	// ■メタルディスク
	if(GetEventFlg_("BFG_PLAYED_METAL_DISC_MSG") == false){	// メタルディスク入手メッセージを見たか？
		if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){									// Num0 = 4
			if(ice_event_num >= GetFlagID_("CONST_SS_IF_EXAMINE_THE_ICE_WALL")){			// Num5 = 18
				exclamation03 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "mine_disc");
			}
		}
		else if(main_num >= GetFlagID_("CONST_SM_PRISON")){									// Num0 = 5
			exclamation03 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "mine_disc");
		}
	}
	
	EventEnd_();
}


//------------------------------------------------
//		フィールド操作開始
//------------------------------------------------
function EventStartOperate()
{
	local main_num			= GetNumFlg_("NUM_SCENARIO_MAIN");							// Num0
	local ice_event_num		= GetNumFlg_("NUM_SCENARIO_SUB_ICE");						// Num5

	// ■幽霊を半透明にする
	SetManualCalcAlpha_(g_gost, true);
	SetAlpha_(g_gost, 0.3);

	EventEnd_();
}


//------------------------------------------------
//		ＮＰＣ接触時
//------------------------------------------------
function TouchNpc()
{
	local main_num			= GetNumFlg_("NUM_SCENARIO_MAIN");							// Num0
	local ice_event_num		= GetNumFlg_("NUM_SCENARIO_SUB_ICE");						// Num5

	local target = GetTargetId_();
	
	// ■幽霊
	if(target == g_gost){
		// 氷原シナリオ中
		if(main_num <= GetFlagID_("CONST_SM_ICE_FIELD")){									// Num0 = 4
			OpenMsgWnd_();
			ShowMsg_("DEMO_009_AFT_EST_GOST");		//「ここで　魔物が殺されたのを　見たよ。
			KeyInputWait_();
			CloseMsgWnd_();
		}
		// 監獄シナリオ以降
		else{
			OpenMsgWnd_();
			ShowMsg_("NPC_GOST_010");				//「この人を　包んでいる氷が
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	// ■シルバー
	if(target == g_silver){
		if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){								// Num0 = 4
			//シルバーとの出会い後
			if(ice_event_num == GetFlagID_("CONST_SS_IF_EXAMINE_THE_ICE_WALL")){		// Num5 = 18
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_SILVER");
				ShowMsg_("DEMO_010_AFT_EST_SILV");	//「これを　見ろ。氷の中に　向かって
				KeyInputWait_();
				CloseMsgWnd_();
			}
			//偽イエタス発覚後
			if(ice_event_num == GetFlagID_("CONST_SS_IF_SECOND_ATTACK")){				// Num5 = 19
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_SILVER");
				ShowMsg_("DEMO_011_AFT_EST_SILV");	//「急いで　西ポーラパークに戻り
				KeyInputWait_();
				CloseMsgWnd_();
			}
		}
	}

	EventEnd_();
}


//------------------------------------------------
//		地雷接触時
//------------------------------------------------
function TouchEventMine()
{
	local main_num			= GetNumFlg_("NUM_SCENARIO_MAIN");							// Num0
	local ice_event_num		= GetNumFlg_("NUM_SCENARIO_SUB_ICE");						// Num5

	local target = GetTouchEventMineId_();
	local player = GetPlayerId_();

	switch ( target ) {
	//シルバーの棺を調べるとデモ315[生きていたシルバー]を再生
	case g_mine01:
		if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){								// Num0 = 4
			if(ice_event_num == GetFlagID_("CONST_SS_IF_GO_TO_THE_ICE_CEMETERY")){		// Num5 = 17
				SetNumFlg_("NUM_SCENARIO_SUB_ICE",GetFlagID_("CONST_SS_IF_EXAMINE_THE_ICE_WALL"));// Num5 <- 18
				DeleteEventMine_(g_mine01);

				SetReturnDemoPosDir_(Vec3(216.185, -2.677, -106.534), -57);
				//315[生きていたシルバー]
				TouchNpcChangeDemo(315);
			}
		}
		break;

	//人口氷壁を調べるとデモ316[イエタスの死体]を再生
	case g_mine02:
		if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){								// Num0 = 4
			if(ice_event_num == GetFlagID_("CONST_SS_IF_EXAMINE_THE_ICE_WALL")){		// Num5 = 18
				SetNumFlg_("NUM_SCENARIO_SUB_ICE",GetFlagID_("CONST_SS_IF_SECOND_ATTACK"));// Num5 <- 19
				DeleteEventMine_(g_mine02);

				SetReturnDemoPosDir_(Vec3(-175.540, -44.778, -72.604), -176);

				SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
				SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
				WaitFade_();

				SetEventFlg_("BFG_MAP_ICON_028", true);

				ChangeDemo_(316);	//316[イエタスの死体]
			}
		}
		break;
	case g_mine_disc:
		if(GetEventFlg_("BFG_PLAYED_METAL_DISC_MSG") == false){
			uPlayerTurnAroundPos(197.5, -4.5, -116.5);
			// 所持ディスクがMAXでは無い時
			if(CheckDiscMax_() == false){
				// メッセージ表示フラグ
				SetEventFlg_("BFG_PLAYED_METAL_DISC_MSG", true);
				// メッセージ
				OpenMsgWnd_();
				ShowMsg_("GET_METAL_DISC_MSG_1");
				PlayMe_("ME_010");  // 重要アイテム入手ME
				WaitMe_();
				AddSpecialDisc_(SPECIAL_DISC.METAL); // メタルエリアディスク
				KeyInputWait_();
				CloseMsgWnd_();
				// アイテム地雷、リアクターポイント, 配置したエフェクトの削除
				DeleteEventMine_(g_mine_disc);
				DeleteEffect_(g_efc_disc);
				SetNaviMapIconVisible_(exclamation03, false);
			}
			// 所持ディスクがMAXの時
			else{
				// メッセージ
				OpenMsgWnd_();
				ShowMsg_("GET_METAL_DISC_MSG_2");
				KeyInputWait_();
				CloseMsgWnd_();
				// 指定方向へ歩かせる
				CommPlayerTurnMoveDirWalk(0, 40);
			}
		}
		
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
	local main_num			= GetNumFlg_("NUM_SCENARIO_MAIN");							// Num0
	local ice_event_num		= GetNumFlg_("NUM_SCENARIO_SUB_ICE");						// Num5

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

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//		指定した座標に歩きながら振り向く処理
//
//---------------------------------------------------------------------------
// 第一引数：指定した座標(Vec3)
// 戻り値  ：なし
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function uPlayerTurnAroundPos(posx, posy, posz)
{
	local player    = GetPlayerId_();
	// 対象物の方向に回転(1Fで11.4°ずつ回転)
	local rotateTask = Task_RotateToPosSetMotion_(player, Vec3(posx, posy, posz), ROTATE_EVENT_DEF MOT_WALK, MOT_WAIT);
	WaitTask(rotateTask);
	// 間を持たせる
	Wait_(15);
}

