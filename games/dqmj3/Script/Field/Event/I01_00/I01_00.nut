//===================== I01_00ポーラパーク ====================


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
	// マップ到達フラグ
	SetEventFlg_("BFG_ARRIVE_AT_I01", true);											// Bit_91 到達フラグ ポーラパーク

	local main_num			= GetNumFlg_("NUM_SCENARIO_MAIN");							// Num0
	local ice_event_num		= GetNumFlg_("NUM_SCENARIO_SUB_ICE");						// Num5

	local bit_ruler_est		= GetNumFlg_("BFG_RULER_ADD_012");						// Bit_212 ルーラ追加 東口

	// ■ルーラポイント(西口)
	SetEventFlg_("BFG_RULER_ADD_011", true);											// Bit_211 ルーラ追加 西口

	// ■ルーラ禁止
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){									// Num0 = 4
		if(ice_event_num == GetFlagID_("CONST_SS_IF_GET_OUT_OF_THE_HOUSE")				// Num5 = 4
		||ice_event_num == GetFlagID_("CONST_SS_IF_FIRST_ATTACK")){						// Num5 = 16
			// ルーラを禁止するフラグを設定
			SetEventFlg_("BFG_PLAYERABILITY_RULER_PROHIBIT", true);						// Bit_440 ルーラ禁止
		}
	}

	// ■大氷壁がなくなったフラグ
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){									// Num0 = 4
		if(ice_event_num < GetFlagID_("CONST_SS_IF_CLEAR_ICE_FIELD")){					// Num5 < 36
			//
		} else {
			SetEventFlg_("BFG_REMOVE_ICE_WALL", true);									// Bit_1157 大氷壁がなくなった
		}
	} else {
		SetEventFlg_("BFG_REMOVE_ICE_WALL", true);										// Bit_1157 大氷壁がなくなった
	}

	//----------
	// ▼NPC配置
	//----------
	// ID初期化
	g_npc_item		 <- C_NONE_ID;
	g_npc_inn		 <- C_NONE_ID;
	g_npc_west1 	 <- C_NONE_ID;
	g_npc_west2		 <- C_NONE_ID;
	g_npc_west3		 <- C_NONE_ID;
	g_npc_west4		 <- C_NONE_ID;
	g_todo_child1	 <- C_NONE_ID;
	g_todo_child2	 <- C_NONE_ID;
	g_todo_child3	 <- C_NONE_ID;
	g_todo			 <- C_NONE_ID;
	g_npc_est1		 <- C_NONE_ID;
	g_npc_est2		 <- C_NONE_ID;
	g_npc_est3		 <- C_NONE_ID;
	g_npc_est4		 <- C_NONE_ID;
	g_silver		 <- C_NONE_ID;
	g_npc_gardman	 <- C_NONE_ID;
	g_yetas		 	 <- C_NONE_ID;
	g_npc_est_sibou	 <- C_NONE_ID;

	// リソース読み込み
	local id_silver			= ReadNpc_("m077_00");	// シルバーモデル
	local id_todo			= ReadNpc_("n039");		// トードーモデル
	local id_yetas			= ReadNpc_("n041");		// イエタスモデル
	local id_meijimomonja	= ReadNpc_("m041_02");	// メイジももんじゃ
	local id_okiduti		= ReadNpc_("m035_00");	// おおきづち
	local id_todo_child		= ReadNpc_("m035_00");	// トードー子分モデル
	local id_darkmmn		= ReadNpc_("m083_04");	// ダークモーモン
	local id_arakurechappy	= ReadNpc_("m045_01");	// あらくれチャッピー
	
	// ■道具屋
	g_npc_item        = ArrangePointNpc_(id_darkmmn, "npc_item");
	SetSearchableAngle_(g_npc_item, SEARCHABLE_ANGLE_MINIMUM);	// 正面30度から 話しかけ可能
	SetReactorMsg_(g_npc_item, "NPC_WEST_B_REC");
	SetTalkCameraType_(g_npc_item, TALK_CAMERA_UP);				//カメラの設定
	SetTalkCameraEyeOffset_(g_npc_item, -2.0, -10.0);			//カメラの位置の調整
	SetScaleSilhouette(g_npc_item, SCALE.S ,SILHOUETTE_WIDTH.S);

	// ■宿屋
	g_npc_inn         = ArrangePointNpc_(id_okiduti, "npc_inn");
	SetSearchableAngle_(g_npc_inn, SEARCHABLE_ANGLE_MINIMUM);	// 正面30度から 話しかけ可能
	SetReactorMsg_(g_npc_inn, "NPC_WEST_A_REC");
	SetTalkCameraType_(g_npc_inn,TALK_CAMERA_UP);				//カメラの設定
	SetTalkCameraEyeOffset_(g_npc_inn, -2.0, -10.0);			//カメラの位置の調整
	SetScaleSilhouette(g_npc_inn, SCALE.N ,SILHOUETTE_WIDTH.N);

	// ■西ポーラパーク住民Ａ
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){									// Num0 = 4
		if(ice_event_num >= GetFlagID_("CONST_SS_IF_FIRST_ATTACK")						// Num5 >= 16
		&& ice_event_num <= GetFlagID_("CONST_SS_IF_MOVE_THE_WORLD_4"))					// Num5 <= 35
		{
			g_npc_west1= ArrangePointNpc_(id_okiduti, "npc_west_a_2");
			SetReactorMsg_(g_npc_west1, "NPC_WEST_A_REC");
			SetScaleSilhouette(g_npc_west1, SCALE.N ,SILHOUETTE_WIDTH.N);
		}
		else if(ice_event_num == GetFlagID_("CONST_SS_IF_GO_TO_SEE_TODO")){				// Num5 = 3
			g_npc_west1= ArrangePointNpc_(id_okiduti, "npc_west_a_3");
			SetReactorMsg_(g_npc_west1, "NPC_WEST_A_REC");
			SetScaleSilhouette(g_npc_west1, SCALE.N ,SILHOUETTE_WIDTH.N);
		}
		else{
			g_npc_west1= ArrangePointNpc_(id_okiduti, "npc_west_a");
			SetReactorMsg_(g_npc_west1, "NPC_WEST_A_REC");
			SetScaleSilhouette(g_npc_west1, SCALE.N ,SILHOUETTE_WIDTH.N);
		}
	}
	else{
		g_npc_west1= ArrangePointNpc_(id_okiduti, "npc_west_a");
		SetReactorMsg_(g_npc_west1, "NPC_WEST_A_REC");
		SetScaleSilhouette(g_npc_west1, SCALE.N ,SILHOUETTE_WIDTH.N);
	}

	// ■西ポーラパーク住民Ｂ-Ｃ
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){									// Num0 = 4
		if(ice_event_num >= GetFlagID_("CONST_SS_IF_FIRST_ATTACK")						// Num5 >= 16
		&& ice_event_num <= GetFlagID_("CONST_SS_IF_MOVE_THE_WORLD_4"))					// Num5 <= 35
		{
			g_npc_west2   = ArrangePointNpc_(id_okiduti, "npc_west_b_2");
			SetReactorMsg_(g_npc_west2, "NPC_WEST_A_REC");
			SetScaleSilhouette(g_npc_west2, SCALE.N ,SILHOUETTE_WIDTH.N);

			g_npc_west3   = ArrangePointNpc_(id_okiduti, "npc_west_c_2");
			SetReactorMsg_(g_npc_west3, "NPC_WEST_A_REC");
			SetScaleSilhouette(g_npc_west3, SCALE.N ,SILHOUETTE_WIDTH.N);
		}
		else{
			g_npc_west2   = ArrangePointNpc_(id_okiduti, "npc_west_b");
			SetReactorMsg_(g_npc_west2, "NPC_WEST_A_REC");
			SetSearchableAngle_(g_npc_west2, SEARCHABLE_ANGLE_MINIMUM);
			SetScaleSilhouette(g_npc_west2, SCALE.N ,SILHOUETTE_WIDTH.N);

			g_npc_west3   = ArrangePointNpc_(id_okiduti, "npc_west_c");
			SetReactorMsg_(g_npc_west3, "NPC_WEST_A_REC");
			SetSearchableAngle_(g_npc_west3, SEARCHABLE_ANGLE_MINIMUM);
			SetScaleSilhouette(g_npc_west3, SCALE.N ,SILHOUETTE_WIDTH.N);
		}
	}
	else{
		g_npc_west2   = ArrangePointNpc_(id_okiduti, "npc_west_b");
		SetReactorMsg_(g_npc_west2, "NPC_WEST_A_REC");
		SetSearchableAngle_(g_npc_west2, SEARCHABLE_ANGLE_MINIMUM);
		SetScaleSilhouette(g_npc_west2, SCALE.N ,SILHOUETTE_WIDTH.N);

		g_npc_west3   = ArrangePointNpc_(id_okiduti, "npc_west_c");
		SetReactorMsg_(g_npc_west3, "NPC_WEST_A_REC");
		SetSearchableAngle_(g_npc_west3, SEARCHABLE_ANGLE_MINIMUM);
		SetScaleSilhouette(g_npc_west3, SCALE.N ,SILHOUETTE_WIDTH.N);
	}

	// ■西ポーラパーク住民Ｄ
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){									// Num0 = 4
		if(ice_event_num == GetFlagID_("CONST_SS_IF_GO_TO_SEE_TODO")){					// Num5 = 3
			g_npc_west4   = ArrangePointNpc_(id_darkmmn, "npc_west_d_2");
			SetReactorMsg_(g_npc_west4, "NPC_WEST_B_REC");
			SetScaleSilhouette(g_npc_west4, SCALE.S ,SILHOUETTE_WIDTH.S);
		}
		else {
			g_npc_west4   = ArrangePointNpc_(id_darkmmn, "npc_west_d");
			SetReactorMsg_(g_npc_west4, "NPC_WEST_B_REC");
			SetScaleSilhouette(g_npc_west4, SCALE.S ,SILHOUETTE_WIDTH.S);
		}
	}
	else {
		g_npc_west4   = ArrangePointNpc_(id_darkmmn, "npc_west_d");
		SetReactorMsg_(g_npc_west4, "NPC_WEST_B_REC");
		SetScaleSilhouette(g_npc_west4, SCALE.S ,SILHOUETTE_WIDTH.S);
	}
	// ■トードー子分Ａ
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){									// Num0 = 4
		if(ice_event_num == GetFlagID_("CONST_SS_IF_GO_TO_SEE_TODO"))					// Num5 = 3
		{
			g_todo_child1= ArrangePointNpc_(id_todo_child, "npc_todo_child_a_3");
			SetReactorMsg_(g_todo_child1, "NPC_TODO_CHILD_REC");
			SetScaleSilhouette(g_todo_child1, SCALE.N ,SILHOUETTE_WIDTH.N);
		}
		else if(ice_event_num >= GetFlagID_("CONST_SS_IF_FIRST_ATTACK")					// Num5 >= 16
		&& ice_event_num <= GetFlagID_("CONST_SS_IF_MOVE_THE_WORLD_4"))					// Num5 <= 35
		{
			g_todo_child1= ArrangePointNpc_(id_todo_child, "npc_todo_child_a_2");
			SetReactorMsg_(g_todo_child1, "NPC_TODO_CHILD_REC");
			SetScaleSilhouette(g_todo_child1, SCALE.N ,SILHOUETTE_WIDTH.N);
			if(ice_event_num < GetFlagID_("CONST_SS_IF_GO_TO_THE_ICE_RUINS")){			// Num5 < 20
				SetTalkTurn_(g_todo_child1, false);	// 話しかけても振り向かない
			}
		}
		else{
			g_todo_child1= ArrangePointNpc_(id_todo_child, "npc_todo_child_a");
			SetReactorMsg_(g_todo_child1, "NPC_TODO_CHILD_REC");
			SetScaleSilhouette(g_todo_child1, SCALE.N ,SILHOUETTE_WIDTH.N);
		}
	}
	else{
		g_todo_child1= ArrangePointNpc_(id_todo_child, "npc_todo_child_a");
		SetReactorMsg_(g_todo_child1, "NPC_TODO_CHILD_REC");
		SetScaleSilhouette(g_todo_child1, SCALE.N ,SILHOUETTE_WIDTH.N);
	}

	// ■トードー子分Ｂ-Ｃ
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){									// Num0 = 4
		if(ice_event_num >= GetFlagID_("CONST_SS_IF_FIRST_ATTACK")						// Num5 >= 16
		&& ice_event_num <= GetFlagID_("CONST_SS_IF_MOVE_THE_WORLD_4"))					// Num5 <= 35
		{
			g_todo_child2= ArrangePointNpc_(id_todo_child, "npc_todo_child_b_2");//東ポーラパーク住人と対峙中
			SetReactorMsg_(g_todo_child2, "NPC_TODO_CHILD_REC");
			SetScaleSilhouette(g_todo_child2, SCALE.N ,SILHOUETTE_WIDTH.N);

			g_todo_child3= ArrangePointNpc_(id_darkmmn, "npc_todo_child_c_2"); //東ポーラパーク住人と対峙中
			SetReactorMsg_(g_todo_child3, "NPC_TODO_CHILD_REC");
			SetScaleSilhouette(g_todo_child3, SCALE.S ,SILHOUETTE_WIDTH.S);

			if(ice_event_num < GetFlagID_("CONST_SS_IF_GO_TO_THE_ICE_RUINS")){				// Num5 < 20
				SetTalkTurn_(g_todo_child2, false);	// 話しかけても振り向かない
				SetTalkTurn_(g_todo_child3, false);	// 話しかけても振り向かない
			}
		}
		else{
			g_todo_child2= ArrangePointNpc_(id_todo_child, "npc_todo_child_b");
			SetReactorMsg_(g_todo_child2, "NPC_TODO_CHILD_REC");
			SetScaleSilhouette(g_todo_child2, SCALE.N ,SILHOUETTE_WIDTH.N);

			g_todo_child3= ArrangePointNpc_(id_darkmmn, "npc_todo_child_c");
			SetReactorMsg_(g_todo_child3, "NPC_TODO_CHILD_REC");
			SetScaleSilhouette(g_todo_child3, SCALE.S ,SILHOUETTE_WIDTH.S);
		}
	}
	else{
		g_todo_child2= ArrangePointNpc_(id_todo_child, "npc_todo_child_b");
		SetReactorMsg_(g_todo_child2, "NPC_TODO_CHILD_REC");
		SetScaleSilhouette(g_todo_child2, SCALE.N ,SILHOUETTE_WIDTH.N);

		g_todo_child3= ArrangePointNpc_(id_darkmmn, "npc_todo_child_c");
		SetReactorMsg_(g_todo_child3, "NPC_TODO_CHILD_REC");
		SetScaleSilhouette(g_todo_child3, SCALE.S ,SILHOUETTE_WIDTH.S);
	}

	// ■東ポーラパーク住人Ａ・Ｂ・Ｄ・やられ役
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){									// Num0 = 4
		if(ice_event_num < GetFlagID_("CONST_SS_IF_FIRST_ATTACK"))						// Num5 < 16
		{
			g_npc_est1    = ArrangePointNpc_(id_arakurechappy, "npc_est_a");
			SetReactorMsg_(g_npc_est1, "NPC_EST_A_REC");
			SetScaleSilhouette(g_npc_est1, SCALE.N ,SILHOUETTE_WIDTH.N);

			g_npc_est2    = ArrangePointNpc_(id_meijimomonja, "npc_est_b");
			SetReactorMsg_(g_npc_est2, "NPC_EST_B_REC");
			SetScaleSilhouette(g_npc_est2, SCALE.N ,SILHOUETTE_WIDTH.N);

			if(ice_event_num < GetFlagID_("CONST_SS_IF_GO_BACK_WEST_ICE_PARK"))			// Num5 < 15
			{
				g_npc_est4    = ArrangePointNpc_(id_meijimomonja, "npc_est_d_4");
				SetReactorMsg_(g_npc_est4, "NPC_EST_B_REC");
				SetScaleSilhouette(g_npc_est4, SCALE.N ,SILHOUETTE_WIDTH.N);
				
				g_npc_est_sibou    = ArrangePointNpc_(id_meijimomonja, "npc_est_sibou");
				SetReactorMsg_(g_npc_est_sibou, "NPC_EST_B_REC");
				SetScaleSilhouette(g_npc_est_sibou, SCALE.N ,SILHOUETTE_WIDTH.N);
			}
			else {
				g_npc_est4    = ArrangePointNpc_(id_meijimomonja, "npc_est_d");
				SetReactorMsg_(g_npc_est4, "NPC_EST_B_REC");
				SetScaleSilhouette(g_npc_est4, SCALE.N ,SILHOUETTE_WIDTH.N);
			}
		}
		else if(ice_event_num < GetFlagID_("CONST_SS_IF_CLEAR_ICE_FIELD"))					// Num5 < 36
		{
			g_npc_est1    = ArrangePointNpc_(id_arakurechappy, "npc_est_a_2"); //西ポーラパーク住人と対峙中
			SetReactorMsg_(g_npc_est1, "NPC_EST_A_REC");
			SetScaleSilhouette(g_npc_est1, SCALE.N ,SILHOUETTE_WIDTH.N);
			if(ice_event_num < GetFlagID_("CONST_SS_IF_GO_TO_THE_ICE_RUINS")){				// Num5 < 20
				SetTalkTurn_(g_npc_est1, false);	// 話しかけても振り向かない
			}

			g_npc_est2    = ArrangePointNpc_(id_meijimomonja, "npc_est_b_2"); //西ポーラパーク住人と対峙中
			SetReactorMsg_(g_npc_est2, "NPC_EST_B_REC");
			SetScaleSilhouette(g_npc_est2, SCALE.N ,SILHOUETTE_WIDTH.N);
			if(ice_event_num < GetFlagID_("CONST_SS_IF_GO_TO_THE_ICE_RUINS")){				// Num5 < 20
				SetTalkTurn_(g_npc_est2, false);	// 話しかけても振り向かない
			}

			g_npc_est4    = ArrangePointNpc_(id_meijimomonja, "npc_est_d_2"); //西ポーラパーク住人と対峙中
			SetReactorMsg_(g_npc_est4, "NPC_EST_B_REC");
			SetScaleSilhouette(g_npc_est4, SCALE.N ,SILHOUETTE_WIDTH.N);
			if(ice_event_num < GetFlagID_("CONST_SS_IF_GO_TO_THE_ICE_RUINS")){				// Num5 < 20
				SetTalkTurn_(g_npc_est4, false);	// 話しかけても振り向かない
			}
		}
		else{
			g_npc_est1    = ArrangePointNpc_(id_arakurechappy, "npc_est_a");
			SetReactorMsg_(g_npc_est1, "NPC_EST_A_REC");
			SetScaleSilhouette(g_npc_est1, SCALE.N ,SILHOUETTE_WIDTH.N);

			g_npc_est2    = ArrangePointNpc_(id_meijimomonja, "npc_est_b");
			SetReactorMsg_(g_npc_est2, "NPC_EST_B_REC");
			SetScaleSilhouette(g_npc_est2, SCALE.N ,SILHOUETTE_WIDTH.N);

			g_npc_est4    = ArrangePointNpc_(id_meijimomonja, "npc_est_d_3");
			SetReactorMsg_(g_npc_est4, "NPC_EST_B_REC");
			SetScaleSilhouette(g_npc_est4, SCALE.N ,SILHOUETTE_WIDTH.N);
		}
	}
	else{
		g_npc_est1    = ArrangePointNpc_(id_arakurechappy, "npc_est_a");
		SetReactorMsg_(g_npc_est1, "NPC_EST_A_REC");
		SetScaleSilhouette(g_npc_est1, SCALE.N ,SILHOUETTE_WIDTH.N);

		g_npc_est2    = ArrangePointNpc_(id_meijimomonja, "npc_est_b");
		SetReactorMsg_(g_npc_est2, "NPC_EST_B_REC");
		SetScaleSilhouette(g_npc_est2, SCALE.N ,SILHOUETTE_WIDTH.N);

		g_npc_est4    = ArrangePointNpc_(id_meijimomonja, "npc_est_d_3");
		SetReactorMsg_(g_npc_est4, "NPC_EST_B_REC");
		SetScaleSilhouette(g_npc_est4, SCALE.N ,SILHOUETTE_WIDTH.N);
	}

	// ■東ポーラパーク住人Ｃ
	g_npc_est3    = ArrangePointNpc_(id_meijimomonja, "npc_est_c");
	SetReactorMsg_(g_npc_est3, "NPC_EST_B_REC");
	SetSearchableAngle_(g_npc_est3, SEARCHABLE_ANGLE_MINIMUM);
	SetScaleSilhouette(g_npc_est3, SCALE.N ,SILHOUETTE_WIDTH.N);

	// ■霊園門番
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){									// Num0 = 4
		if(ice_event_num <= GetFlagID_("CONST_SS_IF_GO_BACK_WEST_ICE_PARK"))			// Num5 <= 15
		{
			g_npc_gardman     = ArrangePointNpc_(id_arakurechappy, "npc_monban");
			SetReactorMsg_(g_npc_gardman, "NPC_EST_A_REC");
			SetScaleSilhouette(g_npc_gardman, SCALE.N ,SILHOUETTE_WIDTH.N);
		}
	}

	// ■トードー
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){									// Num0 = 4
		if(ice_event_num <=  GetFlagID_("CONST_SS_IF_GO_BACK_WEST_ICE_PARK"))			// Num5 <= 15
		{
			g_todo        = ArrangePointNpc_(id_todo,  "npc_todo");//トードー
			SetReactorMsg_(g_todo, "NPC_TODO_REC");
			SetTalkCameraType_(g_todo,TALK_CAMERA_UP);//カメラの設定
			SetScaleSilhouette(g_todo , SCALE.TODO ,SILHOUETTE_WIDTH.TODO);

			if(ice_event_num == GetFlagID_("CONST_SS_IF_GET_OUT_OF_THE_HOUSE")){		// Num5 = 4
				local todo_arm_folde_L = ReadMotion_(g_todo, "n039_arm_folde01_L");		// 待機→腕組み
				SetMotion_(g_todo, todo_arm_folde_L, BLEND_N);
				SetTalkTurn_(g_todo, false);//話しかけても振り向かない
			}
		}
		else if(ice_event_num == GetFlagID_("CONST_SS_IF_FIRST_ATTACK"))				// Num5 = 16
		{
			g_todo        = ArrangePointNpc_(id_todo,  "npc_todo_2");
			SetReactorMsg_(g_todo, "NPC_TODO_REC");
			SetTalkEnable_(g_todo, false);		// 会話できない
			SetScaleSilhouette(g_todo, SCALE.TODO ,SILHOUETTE_WIDTH.TODO);
		}
		else if(ice_event_num <= GetFlagID_("CONST_SS_IF_EXAMINE_THE_ICE_WALL"))		// Num5 <= 18
		{
			g_todo        = ArrangePointNpc_(id_todo,  "npc_todo_2_2");
			SetDirToPoint_(g_todo, "npc_yetas");
			SetReactorMsg_(g_todo, "NPC_TODO_REC");
			SetTalkEnable_(g_todo, false);		// 会話できない
			SetTalkTurn_(g_todo, false);		// 話しかけても振り向かない(東ポーラパーク住人と対峙中)
			local todo_sword = ReadMotion_(g_todo, "n039_push");		// 押さえつける
			SetMotion_(g_todo, todo_sword, BLEND_N);
			SetScaleSilhouette(g_todo, SCALE.TODO ,SILHOUETTE_WIDTH.TODO);
		}
		else if(ice_event_num <= GetFlagID_("CONST_SS_IF_MOVE_THE_WORLD_4"))			// Num5 <= 35
		{
			g_todo        = ArrangePointNpc_(id_todo,  "npc_todo_3");
			SetMeshVisible_(g_todo, "Model_2", false);	// オサの証
			SetReactorMsg_(g_todo, "NPC_TODO_REC");
			SetTalkCameraType_(g_todo,TALK_CAMERA_UP);	//カメラの設定
			SetScaleSilhouette(g_todo, SCALE.TODO ,SILHOUETTE_WIDTH.TODO);
		}
	}
	else{
		g_todo        = ArrangePointNpc_(id_todo,  "npc_todo");
		SetMeshVisible_(g_todo, "Model_2", false);	// オサの証
		SetReactorMsg_(g_todo, "NPC_TODO_REC");
		SetTalkCameraType_(g_todo,TALK_CAMERA_UP);	//カメラの設定
		SetScaleSilhouette(g_todo, SCALE.TODO ,SILHOUETTE_WIDTH.TODO);
	}

	// ■シルバー
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){									// Num0 = 4
		if(ice_event_num >= GetFlagID_("CONST_SS_IF_CLEAR_ICE_FIELD"))					// Num5 >= 36
		{
			// 配置しない
		}
		else if(ice_event_num >= GetFlagID_("CONST_SS_IF_GO_TO_THE_ICE_RUINS"))			// Num5 >= 20
		{
			g_silver      = ArrangePointNpc_(id_silver,  "npc_silver");
			SetReactorMsg_(g_silver, "NPC_SILVER_REC");
			SetTalkCameraType_(g_silver,TALK_CAMERA_UP);//カメラの設定
			SetScaleSilhouette(g_silver, SCALE.N ,SILHOUETTE_WIDTH.N);
		}
	}
	else{
		g_silver      = ArrangePointNpc_(id_silver,  "npc_silver_or_yetas");
		SetReactorMsg_(g_silver, "NPC_SILVER_REC");
		SetTalkCameraType_(g_silver,TALK_CAMERA_UP);//カメラの設定
		SetScaleSilhouette(g_silver, SCALE.N ,SILHOUETTE_WIDTH.N);
	}

	// ■イエタス
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){									// Num0 = 4
		if(ice_event_num < GetFlagID_("CONST_SS_IF_FIRST_ATTACK"))						// Num5 < 16
		{
			g_yetas       = ArrangePointNpc_(id_yetas, "npc_silver_or_yetas");
			SetReactorMsg_(g_yetas, "NPC_YETAS_REC");
			SetScaleSilhouette(g_yetas, SCALE.N ,SILHOUETTE_WIDTH.N);
		}
		else if(ice_event_num == GetFlagID_("CONST_SS_IF_FIRST_ATTACK")){				// Num5 = 16
			g_yetas       = ArrangePointNpc_(id_yetas, "npc_yetas");
			SetReactorMsg_(g_yetas, "NPC_YETAS_REC");
			SetScaleSilhouette(g_yetas, SCALE.N ,SILHOUETTE_WIDTH.N);
			SetTalkEnable_(g_yetas, false);		// 会話できない
		}
		else if(ice_event_num < GetFlagID_("CONST_SS_IF_GO_TO_THE_ICE_RUINS")){			// Num5 < 20
			g_yetas      = ArrangePointNpc_(id_yetas, "npc_yetas");
			local retreat = ReadMotion_(g_yetas, "n041_push");	// 非常駐モーション読み込み
			SetMotion_(g_yetas, retreat, BLEND_N);
			SetDirToPoint_(g_yetas, "npc_todo_2_2");
			SetReactorMsg_(g_yetas, "NPC_YETAS_REC");
			SetScaleSilhouette(g_yetas, SCALE.N ,SILHOUETTE_WIDTH.N);
			SetTalkTurn_(g_yetas, false);		// 話しかけても振り向かない(西ポーラパーク住人と対峙中)
			SetTalkEnable_(g_yetas, false);		// 会話できない
		}
	}

	//-----------
	// ▼地雷配置
	//-----------
	// ID初期化
	g_mine01 		<- C_NONE_ID;
	g_mine02 		<- C_NONE_ID;
	g_mine03 		<- C_NONE_ID;
	g_mine_exit 	<- C_NONE_ID;
	g_mine_exit02 	<- C_NONE_ID;
	g_mine_exit03 	<- C_NONE_ID;
	g_mine04	 	<- C_NONE_ID;
	g_mine_est_park	<- C_NONE_ID;

	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){									// Num0 = 4
		// ■トードーの部屋に入った時のデモ用地雷
		if(ice_event_num == GetFlagID_("CONST_SS_IF_GO_TO_SEE_TODO")){					// Num5 = 3
			g_mine01 = SetPointBoxEventMine_("mine01", false);
		}
		// ■トードーの部屋から出た時のデモ用地雷
		if(ice_event_num == GetFlagID_("CONST_SS_IF_GET_OUT_OF_THE_HOUSE")){			// Num5 = 4
			g_mine02 = SetPointBoxEventMine_("mine02", false);
		}
		// ■イエタスの部屋に入った時のデモ用地雷
		if(ice_event_num == GetFlagID_("CONST_SS_IF_GO_TO_THE_EAST_ICE_PARK")){			// Num5 = 14
			g_mine03 = SetPointBoxEventMine_("mine03", false);
		}
		// ■東ポーラパーク住人Ｄがイエタスの屋敷の入口を塞ぐ地雷
		if(ice_event_num >= GetFlagID_("CONST_SS_IF_GO_BACK_WEST_ICE_PARK")				// Num5 >= 15
		&& ice_event_num <= GetFlagID_("CONST_SS_IF_FIRST_ATTACK")){					// Num5 <= 16
			g_mine_exit = SetPointBoxEventMine_("Mine_Exit", false);
		}
		// ■霊園門番が入口を塞ぐ地雷
		if(ice_event_num >= GetFlagID_("CONST_SS_IF_GO_TO_THE_EAST_ICE_PARK")			// Num5 >= 14
		&& ice_event_num <= GetFlagID_("CONST_SS_IF_FIRST_ATTACK")){					// Num5 <= 16
			g_mine_exit02 = SetPointBoxEventMine_("Mine_Exit_02", false);
		}
		// ■東ポーラパーク住人に近づいた時デモ[トードーの頼み②]を再生する地雷
		if(ice_event_num == GetFlagID_("CONST_SS_IF_FIRST_ATTACK")){					// Num5 = 16
			g_mine04 = SetPointBoxEventMine_("mine04", false);
		}
		// ■イエタスを抑えるトードーに近づくと押し戻される地雷
		if(ice_event_num > GetFlagID_("CONST_SS_IF_FIRST_ATTACK")						// Num5 > 16
		&& ice_event_num < GetFlagID_("CONST_SS_IF_GO_TO_THE_ICE_RUINS")){				// Num5 < 20
			g_mine_exit03 = SetPointBoxEventMine_("Mine_Exit_03", false);
		}
		// ■ ルーラのとび先追加地雷（東口） 
		if(!bit_ruler_est){						// Bit_212 ルーラ追加 東口
			g_mine_est_park = SetPointBoxEventMine_("mine_est_park", false);
		}
	}

	//---------------
	// ▼ギミック配置
	//---------------
	// ■大氷壁
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){									// Num0 = 4
		if(ice_event_num < GetFlagID_("CONST_SS_IF_CLEAR_ICE_FIELD")){					// Num5 < 36
			local id_icewall	 = ReadGimmick_("o_I01_00");
			local icewall		 = ArrangePointGimmick_("o_I01_00", id_icewall, "gmk_icewall");
		}
	}
	
	//------------------
	// ▼リアクターポイント配置
	//------------------
	// ■大氷壁 西－東
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){									// Num0 = 4
		if(ice_event_num < GetFlagID_("CONST_SS_IF_CLEAR_ICE_FIELD")){					// Num5 < 36
			local reactorPoint01 = ArrangeMsgReactorPoint("recpoint_01_daihyoheki01", GetFlagID_("BFG_REACTER_POINT_056")// Bit_1555
				, SHORT_DIST, "REC_POINT_ICE_01", "REC_POINT_ICE_01_2");

			local reactorPoint01_2 = ArrangeMsgReactorPoint("recpoint_01_daihyoheki02", GetFlagID_("BFG_REACTER_POINT_056")// Bit_1555
				, SHORT_DIST, "REC_POINT_ICE_01", "REC_POINT_ICE_01_2");
		}
	}

	// ■移民船 西－東
	local reactorPoint02 = ArrangeMsgReactorPoint("recpoint_02_iminsen01", GetFlagID_("BFG_REACTER_POINT_057")// Bit_1556
		, SHORT_DIST, "REC_POINT_ICE_02", "REC_POINT_ICE_02_2");

	local reactorPoint02_2 = ArrangeMsgReactorPoint("recpoint_02_iminsen02", GetFlagID_("BFG_REACTER_POINT_057")// Bit_1556
		, SHORT_DIST, "REC_POINT_ICE_02", "REC_POINT_ICE_02_2");

	// ■氷の木
	local reactorPoint03 = ArrangeMsgReactorPoint("recpoint_03_ki", GetFlagID_("BFG_REACTER_POINT_058")// Bit_1557
		, SHORT_DIST, "REC_POINT_ICE_03", "REC_POINT_ICE_03_2");

	// ■貯蔵箱１－５
	local reactorPoint04 = ArrangeMsgReactorPoint("recpoint_04_tyozobako01", GetFlagID_("BFG_REACTER_POINT_059")// Bit_1558
		, SHORT_DIST, "REC_POINT_ICE_04", "REC_POINT_ICE_04_2");

	local reactorPoint04_2 = ArrangeMsgReactorPoint("recpoint_04_tyozobako02", GetFlagID_("BFG_REACTER_POINT_059")// Bit_1558
		, SHORT_DIST, "REC_POINT_ICE_04", "REC_POINT_ICE_04_2");

	local reactorPoint04_3 = ArrangeMsgReactorPoint("recpoint_04_tyozobako03", GetFlagID_("BFG_REACTER_POINT_059")// Bit_1558
		, SHORT_DIST, "REC_POINT_ICE_04", "REC_POINT_ICE_04_2");

	local reactorPoint04_4 = ArrangeMsgReactorPoint("recpoint_04_tyozobako04", GetFlagID_("BFG_REACTER_POINT_059")// Bit_1558
		, SHORT_DIST, "REC_POINT_ICE_04", "REC_POINT_ICE_04_2");

	local reactorPoint04_5 = ArrangeMsgReactorPoint("recpoint_04_tyozobako05", GetFlagID_("BFG_REACTER_POINT_059")// Bit_1558
		, SHORT_DIST, "REC_POINT_ICE_04", "REC_POINT_ICE_04_2");

	// Demo313 以降 Demo317 までフィールドBGMを変更
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){
		if(ice_event_num == GetFlagID_("CONST_SS_IF_FIRST_ATTACK")){
			SetEventFlg_("BFG_I01_00_EVENT_BGM021_PLAY", true);
		}
		else if(ice_event_num == GetFlagID_("CONST_SS_IF_GO_TO_THE_ICE_RUINS")){
			SetEventFlg_("BFG_I01_00_EVENT_BGM021_PLAY", false);
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

	//-------------
	// ▼デモの再生
	//-------------
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){									// Num0 = 4
		//■はじめてポーラパークに入った時のデモ
		if(ice_event_num == GetFlagID_("CONST_SS_IF_GO_TO_THE_WEST_ICE_PARK")){			// Num5 = 2
			SetNumFlg_("NUM_SCENARIO_SUB_ICE", GetFlagID_("CONST_SS_IF_GO_TO_SEE_TODO"));// Num5 <- 3

			SetReturnDemoPosDir_(Vec3(-214.634, 31.180, 166.685), 158);
			//301[鉄砲玉との遭遇]
			EventStartChangeDemo(301, FADE_COLOR_BLACK);
		}
		//■316[イエタスの死体]後、西ポーラパークに入った時のデモ
		if(ice_event_num == GetFlagID_("CONST_SS_IF_SECOND_ATTACK")){					// Num5 = 19
			//どのマップ切り替えポイントを通ったか
			if(GetEnteredMapChangeNullName_() == "w_I00_00ALru_000"			//西口
				|| GetEnteredMapChangeNullName_() == "w_I00_00CLru_000"){	//北口
				SetNumFlg_("NUM_SCENARIO_SUB_ICE", GetFlagID_("CONST_SS_IF_GO_TO_THE_ICE_RUINS"));	// Num5 <- 20

				SetReturnDemoPosDir_(Vec3(-199.6, 31.1, 101.2), -17);
				//317[黒幕アーザムーク登場]
				EventStartChangeDemo(317, FADE_COLOR_BLACK);
				// ポーラパークのBGMを変更するための地雷設置をしないようにする
				SetEventFlg_("BFG_SET_CHANGE_BGM_MINE", false);
			}
		}
	}
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

	DebugPrint("ID: " + target + " に接触 [TouchNpc]");

	switch (target) {
	case g_npc_item:
		uTalkNpc_item();
		break;
	case g_npc_inn:
		uTalkNpc_inn();
		break;
	case g_npc_west1:
		uTalkNpc_west1();
		break;
	case g_npc_west2:
		uTalkNpc_west2();
		break;
	case g_npc_west3:
		uTalkNpc_west3();
		break;
	case g_npc_west4:
		uTalkNpc_west4();
		break;
	case g_todo_child1:
		uTalkTodo_child1();
		break;
	case g_todo_child2:
		uTalkTodo_child2();
		break;
	case g_todo_child3:
		uTalkTodo_child3();
		break;
	case g_todo:
		uTalkTodo();
		break;
	case g_npc_est1:
		uTalkNpc_est1();
		break;
	case g_npc_est2:
		uTalkNpc_est2();
		break;
	case g_npc_est3:
		uTalkNpc_est3();
		break;
	case g_npc_est4:
		uTalkNpc_est4();
		break;
	case g_silver:
		uTalkSilver();
		break;
	case g_npc_gardman:
		uTalkNpc_gardman();
		break;
	case g_yetas:
		uTalkYetas();
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
	local main_num			= GetNumFlg_("NUM_SCENARIO_MAIN");							// Num0
	local ice_event_num		= GetNumFlg_("NUM_SCENARIO_SUB_ICE");						// Num5

	local target = GetTouchEventMineId_();
	local player = GetPlayerId_();

	switch ( target ) {
	// イエタスを抑えるトードーに近づくと押し戻される地雷
	case g_mine_exit03:
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_TODO");
		ShowMsg_("DEMO_009_AFT_TODO");				// 「イエタスは ここでワシが抑えておく！
		KeyInputWait_();
		CloseMsgWnd_();
		
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_IETASU");
		ShowMsg_("DEMO_009_AFT_YETAS");				// 「ぬううっ！！
		KeyInputWait_();
		CloseMsgWnd_();
		
		uPlayerTurnMoveDirWalk(-214.1, 31.0, 114.8);
		break;

	// トードーに近づいた時デモ[トードーの頼み②]を再生する地雷
	case g_mine04:
		if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){								// Num0 = 4
			if(ice_event_num == GetFlagID_("CONST_SS_IF_FIRST_ATTACK")){				// Num5 = 16
				// ルーラ禁止を解除する
				SetEventFlg_("BFG_PLAYERABILITY_RULER_PROHIBIT", false);				// Bit_440 ルーラ禁止
				SetNumFlg_("NUM_SCENARIO_SUB_ICE",GetFlagID_("CONST_SS_IF_GO_TO_THE_ICE_CEMETERY"));	// Num5 <- 17
				DeleteEventMine_(g_mine04);
				// デモの復帰位置をデモの完成後に設定します
				SetReturnDemoPosDir_(Vec3(-147.580, 30.979, 33.82), -0);
				//314[トードーの頼み②]
				TouchNpcChangeDemo(314);//※トードーに話しかけた時に再生する場合もあるので注意する
			}
		}
		break;

	//東ポーラパーク住人Ｄがイエタスの屋敷の入口を塞ぐ地雷
	case g_mine_exit:
		if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){								// Num0 = 4
			if(ice_event_num >= GetFlagID_("CONST_SS_IF_GO_BACK_WEST_ICE_PARK")			// Num5 >= 15
			&& ice_event_num <= GetFlagID_("CONST_SS_IF_FIRST_ATTACK")){				// Num5 <= 16
				local dir = GetDir_(g_npc_est4);
				
				FaceToFaceNpc(g_npc_est4);
				
				OpenMsgWnd_();
				ShowMsg_("DEMO_007_AFT_EST_NPC_D");
				KeyInputWait_();
				CloseMsgWnd_();
				
				Task_RotateToDirSetMotion_(g_npc_est4, dir, 5.7, MOT_WALK, MOT_WAIT);
				
				CommPlayerTurnMoveDirWalk(-20);
			}
		}
		break;

	//霊園門番が入口を塞ぐ地雷
	case g_mine_exit02:
		if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){								// Num0 = 4
			if(ice_event_num >= GetFlagID_("CONST_SS_IF_GO_TO_THE_EAST_ICE_PARK")		// Num5 >= 14
			&& ice_event_num <= GetFlagID_("CONST_SS_IF_FIRST_ATTACK")){				// Num5 <= 16
				local dir = GetDir_(g_npc_gardman);
				
				FaceToFaceNpc(g_npc_gardman);
				
				OpenMsgWnd_();
				ShowMsg_("DEMO_006_AFT_EST_NPC_GARD");
				KeyInputWait_();
				CloseMsgWnd_();
				
				Task_RotateToDirSetMotion_(g_npc_gardman, dir, 5.7, MOT_WALK, MOT_WAIT);
				
				CommPlayerTurnMoveDirWalk(-90);
			}
		}
		break;

	//イエタスの部屋に入った時のデモの地雷
	case g_mine03:
		if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){								// Num0 = 4
			if(ice_event_num == GetFlagID_("CONST_SS_IF_GO_TO_THE_EAST_ICE_PARK")){		// Num5 = 14
				SetNumFlg_("NUM_SCENARIO_SUB_ICE",GetFlagID_("CONST_SS_IF_GO_BACK_WEST_ICE_PARK"));	// Num5 <- 15
				DeleteEventMine_(g_mine03);
				// デモの復帰位置をデモの完成後に設定します
				SetReturnDemoPosDir_(Vec3(281.795, 75.135, -178.661), -20);
				//312[イエタスとの会見]
				TouchNpcChangeDemo(312);
			}
		}
		break;
		
	//はじめてトードーの部屋に入った時のデモの地雷
	case g_mine01:
		if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){								// Num0 = 4
			if(ice_event_num == GetFlagID_("CONST_SS_IF_GO_TO_SEE_TODO")){				// Num5 = 3(CONST_SS_IF_GO_TO_SEE_TODO -> )
				// ルーラを禁止するフラグを設定 < SQEX要望でデモを統合するためコメント化 (Redmine#3818) >
				//SetEventFlg_("BFG_PLAYERABILITY_RULER_PROHIBIT", true);					// Bit_440 ルーラ禁止
				SetNumFlg_("NUM_SCENARIO_SUB_ICE",GetFlagID_("CONST_SS_IF_GO_TO_SEE_GATEKEEPER"));	// Num5 <- 6
				DeleteEventMine_(g_mine01);
				// デモの復帰位置をデモの完成後に設定します
				SetReturnDemoPosDir_(Vec3(-22.522, 75.135, -508.036), 161);
				//302[大親分のトードー]
				TouchNpcChangeDemo(302);
			}
		}
		break;

	// ルーラのとび先追加地雷（東口）
	case g_mine_est_park:
			DeleteEventMine_(g_mine_est_park);
			SetEventFlg_("BFG_RULER_ADD_012", true);	// Bit_212 ルーラ追加 東口
		break;

	default:
		DebugPrint("設置されていない地雷に接触判定しています！");
		break;
	}

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


//++++++++++++++++++++++++++++++++++++++++++++++++
//		宿屋 会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkNpc_inn()
{
	// 暗転明けの主人公の復帰位置と向きを設定する
	local re_pos = Vec3(-239.782, 44.741, -3.216);	// 復帰位置を指定
	local re_dir = -118;							// 向きを指定
	// メッセージキーの初期化
	local message_key_1 = 0;	// メッセージキー(選択肢を表示するメッセージ)
	local message_key_2 = 0;	// メッセージキー(やめる場合のメッセージ)
	local message_key_3 = 0;	// メッセージキー(利用した場合のメッセージ)
	// 氷原のクリアフラグ
	local clear_flag	= GetEventFlg_("BFG_SCENARIO_CLEAR_ICE");						//Bit_43 氷クリア

	if(clear_flag == true){
		if(GetEventFlg_("BFG_CHECK_INN_FIRST_MSG_ALL") == false){
			// 氷原クリア後の宿屋で表示するメッセージを指定(初回)
			message_key_1 = "INN_MSG_001";
			message_key_2 = "INN_MSG_002";
			message_key_3 = "INN_MSG_003";
		}
		else{
			// 氷原クリア後の宿屋で表示するメッセージを指定(２回目以降)
			message_key_1 = "INN_MSG_004";
			message_key_2 = "INN_MSG_005";
			message_key_3 = "INN_MSG_006";
		}
		SetEventFlg_("BFG_CHECK_INN_FIRST_MSG_ALL", true);
		// メッセージの表示（「やぁ いらっしゃい…
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
			CommTaskInn(re_pos, re_dir, clear_flag, g_npc_inn);
			// メッセージの表示(「おはよーだっちょ…
			OpenMsgWnd_();
			ShowMsg_(message_key_3);
			KeyInputWait_();
			CloseMsgWnd_();
			break;
		case QUERY3_2:
		// やめる処理
			// メッセージの表示(「わかったっちょ…
			ShowMsg_(message_key_2);
			KeyInputWait_();
			CloseMsgWnd_();
			break;
		}
	}
	else{
		// 氷原クリア前の宿屋で表示するメッセージを指定
		local ice_event_num = GetNumFlg_("NUM_SCENARIO_SUB_ICE");
		if(ice_event_num <= GetFlagID_("CONST_SS_IF_FIRST_ATTACK")){ // Num5 <= 16
			message_key_1 = "INN_MSG_1ST_001";
			message_key_2 = "INN_MSG_1ST_002";
			message_key_3 = "INN_MSG_1ST_003";
		}
		// Demo314[トードーの頼み②]再生後
		else if(ice_event_num >= GetFlagID_("CONST_SS_IF_GO_TO_THE_ICE_CEMETERY")
		&& ice_event_num <= GetFlagID_("CONST_SS_IF_SECOND_ATTACK")){ // Num5 >= 17 && Num5 <= 19
			message_key_1 = "INN_MSG_1ST_004";
			message_key_2 = "INN_MSG_1ST_005";
			message_key_3 = "INN_MSG_1ST_006";
		}
		// Demo317[黒幕アーザムーク登場]再生後
		else if(ice_event_num >= GetFlagID_("CONST_SS_IF_GO_TO_THE_ICE_RUINS")
		&& ice_event_num <= GetFlagID_("CONST_SS_IF_MOVE_THE_WORLD_4")){ // Num5 >= 19 && Num5 <= 35
			message_key_1 = "INN_MSG_1ST_007";
			message_key_2 = "INN_MSG_1ST_008";
			message_key_3 = "INN_MSG_1ST_009";
		}
		// Demo330[嵐の砂漠へ]再生後(アザームークを倒してから黒鉄の監獄塔行きの移動装置に乗るまで)
		else{ // Num5 >= 36
			message_key_1 = "INN_MSG_1ST_010";
			message_key_2 = "INN_MSG_1ST_011";
			message_key_3 = "INN_MSG_1ST_012";
		}

		// メッセージの表示（「やぁ いらっしゃい…
		OpenMsgWnd_();
		ShowMsg_(message_key_1);
		KeyInputWait_();
		switch(GetQueryResult_())
		{
		case QUERY2_0:
		// 泊まる処理
			CloseMsgWnd_();
			// 宿屋の共通の回復処理
			CommTaskInn(re_pos, re_dir, clear_flag, g_npc_inn);
			// メッセージの表示(「おはよーだっちょ…
			OpenMsgWnd_();
			ShowMsg_(message_key_3);
			KeyInputWait_();
			CloseMsgWnd_();
			break;
		case QUERY2_1:
		// やめる処理
			// メッセージの表示(「わかったっちょ…
			ShowMsg_(message_key_2);
			KeyInputWait_();
			CloseMsgWnd_();
			break;
		}
	}
}
//++++++++++++++++++++++++++++++++++++++++++++++++
//		道具屋 会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkNpc_item()
{
	// イベントフラグ
	local main_num      = GetNumFlg_("NUM_SCENARIO_MAIN");    // Num0
	local ice_event_num = GetNumFlg_("NUM_SCENARIO_SUB_ICE"); // Num5
	// メッセージキーの初期化
	local msg_key_1 = 0; // メッセージキー(開始メッセージ)
	local msg_key_2 = 0; // メッセージキー(戻りメッセージ)
	
	// 凍骨の氷原のシナリオ中
	if(main_num <= GetFlagID_("CONST_SM_ICE_FIELD")){
		// 氷原開始～Demo313[希望とはなんぞや]の再生後
		if(ice_event_num <= GetFlagID_("CONST_SS_IF_FIRST_ATTACK")){
			msg_key_1 = "ITM_MSG_001";
			msg_key_2 = "ITM_MSG_002";
		}
		// Demo314[トードーの頼み②]再生後～Demo316[イエタスの死体]の再生後
		else if(ice_event_num >= GetFlagID_("CONST_SS_IF_GO_TO_THE_ICE_CEMETERY")
		&& ice_event_num <= GetFlagID_("CONST_SS_IF_SECOND_ATTACK")){
			msg_key_1 = "ITM_MSG_003";
			msg_key_2 = "ITM_MSG_004";
		}
		// Demo317[黒幕アーザムーク登場]再生後～Demo329[世界移動が可能に④]（制御室）の再生後
		else if(ice_event_num >= GetFlagID_("CONST_SS_IF_GO_TO_THE_ICE_RUINS")
		&& ice_event_num <= GetFlagID_("CONST_SS_IF_MOVE_THE_WORLD_4")){
			msg_key_1 = "ITM_MSG_005";
			msg_key_2 = "ITM_MSG_006";
		}
		// Demo330[嵐の砂漠へ]の再生後
		else{
			msg_key_1 = "ITM_MSG_007";
			msg_key_2 = "ITM_MSG_008";
		}
	}
	// 黒鉄の監獄塔～完全クリア
	else{
		msg_key_1 = "ITM_MSG_007";
		msg_key_2 = "ITM_MSG_008";
	}
	
	OpenMsgWnd_();
	ShowMsg_(msg_key_1);
	KeyInputWait_();
	CloseMsgWnd_();
	//道具屋フローに移行
	GotoMenuFadeOpen(MENU_OPEN.I01_00_ITEM);
	//道具屋フロー終了後
	OpenMsgWnd_();
	ShowMsg_(msg_key_2);
	KeyInputWait_();
	CloseMsgWnd_();
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		西ポーラパーク住民Ａ 会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkNpc_west1()
{
	local main_num			 = GetNumFlg_("NUM_SCENARIO_MAIN");							// Num0
	local ice_event_num		 = GetNumFlg_("NUM_SCENARIO_SUB_ICE");						// Num5
	local sky_num			 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");						// Num9
	local bit_sinario_clesr	 = GetEventFlg_("BFG_SCENARIO_CLEAR_ALL");					// Bit_46 シナリオクリア
	
	if(bit_sinario_clesr == true){							// Bit_46 シナリオクリア
		OpenMsgWnd_();
		ShowMsg_("SINARIO_CLEAR_AFT_WST_NPC_A");	// 「よう来たのう <name_player/>さんや。
		KeyInputWait_();
		CloseMsgWnd_();
	}
	else if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){								// Num0 = 4
		if (ice_event_num < GetFlagID_("CONST_SS_IF_FIRST_ATTACK")) {					// Num5 < 16
			OpenMsgWnd_();
			ShowMsg_("DEMO_002_AFT_WST_NPC_A");		// 「ここは ポーラパークっちゅう
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (ice_event_num < GetFlagID_("CONST_SS_IF_GO_TO_THE_ICE_RUINS")) {		// Num5 < 20
			OpenMsgWnd_();
			ShowMsg_("DEMO_008_AFT_WST_NPC_A");		// 「大変だべ！ イエタスと手下たちが
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (ice_event_num < GetFlagID_("CONST_SS_IF_CLEAR_ICE_FIELD")) {			// Num5 < 36
			OpenMsgWnd_();
			ShowMsg_("DEMO_012_AFT_WST_NPC_A");		// 「な…なんだべ！？ 誰かが今 空を……！
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else {
			OpenMsgWnd_();
			ShowMsg_("DEMO_019_AFT_WST_NPC_A");		// 「いろいろと世話になったべ。
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else if(main_num == GetFlagID_("CONST_SM_SKY")){								// Num0 = 8
		if(sky_num < GetFlagID_("CONST_SS_SK_GO_PRISON_SKY")) {			// Num9 < 30
			OpenMsgWnd_();
			ShowMsg_("GARUBIRUSU_AFT_WST_NPC_A");			// 「せっかく 来てくれたのに あんな空ではなぁ。
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else {
			OpenMsgWnd_();
			ShowMsg_("BIG_AZAMUKU_AFT_WST_NPC_A");			// 「よう来てくれた！ 黒い花粉がなくなって
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else {
		OpenMsgWnd_();
		ShowMsg_("DEMO_019_AFT_WST_NPC_A");				// 「いろいろと世話になったべ。
		KeyInputWait_();
		CloseMsgWnd_();
	}
}
//++++++++++++++++++++++++++++++++++++++++++++++++
//		西ポーラパーク住民Ｂ 会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkNpc_west2()
{
	local main_num = GetNumFlg_("NUM_SCENARIO_MAIN");									// Num0
	local ice_event_num   = GetNumFlg_("NUM_SCENARIO_SUB_ICE");							// Num5
	local sky_num		 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");							// Num9
	local bit_sinario_clesr	 = GetEventFlg_("BFG_SCENARIO_CLEAR_ALL");					// Bit_46 シナリオクリア
	
	if(bit_sinario_clesr == true){							// Bit_46 シナリオクリア
		OpenMsgWnd_();
		ShowMsg_("SINARIO_CLEAR_AFT_WST_NPC_B");	// 「何かあったとき あんたがいなくても
		KeyInputWait_();
		CloseMsgWnd_();
	}
	else if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){								// Num0 = 4
		if (ice_event_num < GetFlagID_("CONST_SS_IF_FIRST_ATTACK")) {					// Num5 < 16
			OpenMsgWnd_();
			ShowMsg_("DEMO_002_AFT_WST_NPC_B");		// 「昔は シルバーさんっていう
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (ice_event_num < GetFlagID_("CONST_SS_IF_GO_TO_THE_ICE_RUINS")) {		// Num5 < 20
			OpenMsgWnd_();
			ShowMsg_("DEMO_008_AFT_WST_NPC_B");		// 「イエタスめが 調子に乗りすぎじゃ！
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (ice_event_num < GetFlagID_("CONST_SS_IF_CLEAR_ICE_FIELD")) {			// Num5 < 36
			OpenMsgWnd_();
			ShowMsg_("DEMO_012_AFT_WST_NPC_B");		// 「アーザムークなんて奴 ファミリーで
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else {
			OpenMsgWnd_();
			ShowMsg_("DEMO_019_AFT_WST_NPC_B");		// 「シルバー親分が 生きとったなら
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else if(main_num == GetFlagID_("CONST_SM_SKY")){								// Num0 = 8
		if(sky_num < GetFlagID_("CONST_SS_SK_GO_PRISON_SKY")) {			// Num9 < 30
			OpenMsgWnd_();
			ShowMsg_("GARUBIRUSU_AFT_WST_NPC_B");			// 「まさに 天変地異だべ。
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else {
			OpenMsgWnd_();
			ShowMsg_("BIG_AZAMUKU_AFT_WST_NPC_B");			// 「ようやく 明るい空が 見れるようになったべ。
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else {
		OpenMsgWnd_();
		ShowMsg_("DEMO_019_AFT_WST_NPC_B");				// 「シルバー親分が 生きとったなら
		KeyInputWait_();
		CloseMsgWnd_();
	}
}
//++++++++++++++++++++++++++++++++++++++++++++++++
//		西ポーラパーク住民Ｃ 会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkNpc_west3()
{
	local main_num = GetNumFlg_("NUM_SCENARIO_MAIN");									// Num0
	local ice_event_num   = GetNumFlg_("NUM_SCENARIO_SUB_ICE");							// Num5
	local sky_num		 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");							// Num9
	local bit_sinario_clesr	 = GetEventFlg_("BFG_SCENARIO_CLEAR_ALL");					// Bit_46 シナリオクリア
	
	if(bit_sinario_clesr == true){							// Bit_46 シナリオクリア
		OpenMsgWnd_();
		ShowMsg_("SINARIO_CLEAR_AFT_WST_NPC_C");	// 「うーん……あんたにゃ いつか
		KeyInputWait_();
		CloseMsgWnd_();
	}
	else if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){								// Num0 = 4
		if (ice_event_num < GetFlagID_("CONST_SS_IF_FIRST_ATTACK")) {					// Num5 < 16
			OpenMsgWnd_();
			ShowMsg_("DEMO_002_AFT_WST_NPC_C");		// 「あんた レジスタンスか？
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (ice_event_num < GetFlagID_("CONST_SS_IF_GO_TO_THE_ICE_RUINS")) {		// Num5 < 20
			OpenMsgWnd_();
			ShowMsg_("DEMO_008_AFT_WST_NPC_C");		// 「出入りか。ずっと昔を 思いだすのう。
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (ice_event_num < GetFlagID_("CONST_SS_IF_CLEAR_ICE_FIELD")) {			// Num5 < 36
			OpenMsgWnd_();
			ShowMsg_("DEMO_012_AFT_WST_NPC_C");		// 「ドン・シルバーとトードー親分の そろい踏み。
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else {
			OpenMsgWnd_();
			ShowMsg_("DEMO_019_AFT_WST_NPC_C");		// 「あんたら レジスタンスには
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else if(main_num == GetFlagID_("CONST_SM_SKY")){								// Num0 = 8
		if(sky_num < GetFlagID_("CONST_SS_SK_GO_PRISON_SKY")) {			// Num9 < 30
			OpenMsgWnd_();
			ShowMsg_("GARUBIRUSU_AFT_WST_NPC_C");			// 「きっと トードー親分でも
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else {
			OpenMsgWnd_();
			ShowMsg_("BIG_AZAMUKU_AFT_WST_NPC_C");			// 「黒い花粉が 消えてから
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else {
		OpenMsgWnd_();
		ShowMsg_("DEMO_019_AFT_WST_NPC_C");				// 「あんたら レジスタンスには
		KeyInputWait_();
		CloseMsgWnd_();
	}
}
//++++++++++++++++++++++++++++++++++++++++++++++++
//		西ポーラパーク住民Ｄ 会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkNpc_west4()
{
	local main_num = GetNumFlg_("NUM_SCENARIO_MAIN");									// Num0
	local ice_event_num   = GetNumFlg_("NUM_SCENARIO_SUB_ICE");							// Num5
	local sky_num		 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");							// Num9
	local bit_sinario_clesr	 = GetEventFlg_("BFG_SCENARIO_CLEAR_ALL");					// Bit_46 シナリオクリア
	
	if(bit_sinario_clesr == true){							// Bit_46 シナリオクリア
		OpenMsgWnd_();
		ShowMsg_("SINARIO_CLEAR_AFT_WST_NPC_D");	// 「よう 来られたべ。
		KeyInputWait_();
		CloseMsgWnd_();
	}
	else if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){								// Num0 = 4
		if (ice_event_num < GetFlagID_("CONST_SS_IF_GO_TO_SEE_GATEKEEPER")) {			// Num5 < 6
			OpenMsgWnd_();
			ShowMsg_("DEMO_002_AFT_WST_NPC_D");		// 「町の奥に トードー親分の屋敷があるべ。
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (ice_event_num < GetFlagID_("CONST_SS_IF_FIRST_ATTACK")) {				// Num5 < 16
			OpenMsgWnd_();
			ShowMsg_("DEMO_004_AFT_WST_NPC_D");		// 「あんた トードー親分の客人だったか。
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (ice_event_num < GetFlagID_("CONST_SS_IF_GO_TO_THE_ICE_RUINS")) {		// Num5 < 20
			OpenMsgWnd_();
			ShowMsg_("DEMO_008_AFT_WST_NPC_D");		// 「トードー親分の留守は このワシが守る！
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (ice_event_num < GetFlagID_("CONST_SS_IF_CLEAR_ICE_FIELD")) {			// Num5 < 36
			OpenMsgWnd_();
			ShowMsg_("DEMO_012_AFT_WST_NPC_D");		// 「どんな奴だろうと 親分の屋敷には入れないべ！
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else {
			OpenMsgWnd_();
			ShowMsg_("DEMO_019_AFT_WST_NPC_D");		// 「おっと客人 お戻りだべか。
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else if(main_num == GetFlagID_("CONST_SM_SKY")){								// Num0 = 8
		if(sky_num < GetFlagID_("CONST_SS_SK_GO_PRISON_SKY")) {			// Num9 < 30
			OpenMsgWnd_();
			ShowMsg_("GARUBIRUSU_AFT_WST_NPC_D");			// 「ああ こんな時に よく来てくれただな。
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else {
			OpenMsgWnd_();
			ShowMsg_("BIG_AZAMUKU_AFT_WST_NPC_D");			// 「ワシに あんたを行かせない 理由はないべ。
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else {
		OpenMsgWnd_();
		ShowMsg_("ICE_CLEAR_AFT_WST_NPC_D");			// 「あんたか。トードー親分に 用事だべか？
		KeyInputWait_();
		CloseMsgWnd_();
	}
}
//++++++++++++++++++++++++++++++++++++++++++++++++
//		トードー子分Ａ 会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkTodo_child1()
{
	local main_num = GetNumFlg_("NUM_SCENARIO_MAIN");									// Num0
	local ice_event_num   = GetNumFlg_("NUM_SCENARIO_SUB_ICE");							// Num5
	local sky_num		 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");							// Num9
	local bit_sinario_clesr	 = GetEventFlg_("BFG_SCENARIO_CLEAR_ALL");					// Bit_46 シナリオクリア
	
	if(bit_sinario_clesr == true){							// Bit_46 シナリオクリア
		OpenMsgWnd_();
		ShowMsg_("SINARIO_CLEAR_AFT_CHILD_A");		// 「よう 顔を見せに来て くれたべ。
		KeyInputWait_();
		CloseMsgWnd_();
	}
	else if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){								// Num0 = 4
		if (ice_event_num < GetFlagID_("CONST_SS_IF_GO_TO_THE_EAST_ICE_PARK")) {		// Num5 < 14
			OpenMsgWnd_();
			ShowMsg_("DEMO_003_AFT_CHILD_A");		// 「オラからも頼むべ　<name_player/>さん！
			KeyInputWait_();
			CloseMsgWnd_();
		}
		
		else if (ice_event_num < GetFlagID_("CONST_SS_IF_FIRST_ATTACK")) {				// Num5 < 16
			OpenMsgWnd_();
			ShowMsg_("DEMO_006_AFT_CHILD_A");		// 「もともと　ポーラパークは　ひとつの村だった。
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (ice_event_num < GetFlagID_("CONST_SS_IF_GO_TO_THE_ICE_RUINS")) {		// Num5 < 20
			// トードーの子分Ａ
			OpenMsgWnd_();
			ShowMsg_("DEMO_008_AFT_CHILD_A");		// 「おめたち！　どうして　トードー親分を
			KeyInputWait_();
			CloseMsgWnd_();
			// 東ポーラパーク住人Ａ
			OpenMsgWnd_();
			ShowMsg_("DEMO_008_AFT_EST_NPC_A");		// 「じゃあ　誰が　ドン・シルバーを
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (ice_event_num < GetFlagID_("CONST_SS_IF_CLEAR_ICE_FIELD")) {			// Num5 < 36
			OpenMsgWnd_();
			ShowMsg_("DEMO_012_AFT_CHILD_A");		// 「イエタスが化けた！？
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else {
			OpenMsgWnd_();
			ShowMsg_("DEMO_019_AFT_CHILD_A");		// 「アーザムークを 倒したと？
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else if(main_num == GetFlagID_("CONST_SM_SKY")){								// Num0 = 8
		if(sky_num < GetFlagID_("CONST_SS_SK_GO_PRISON_SKY")) {			// Num9 < 30
			OpenMsgWnd_();
			ShowMsg_("GARUBIRUSU_AFT_CHILD_A");			// 「誰が ワシらの空を 奪ったんだべか。
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else {
			OpenMsgWnd_();
			ShowMsg_("BIG_AZAMUKU_AFT_CHILD_A");		// 「おお！ 空が広くなったべ！
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else {
		OpenMsgWnd_();
		ShowMsg_("ICE_CLEAR_AFT_CHILD_A");			// 「客人……旅が辛くなったら
		KeyInputWait_();
		CloseMsgWnd_();
	}
}
//++++++++++++++++++++++++++++++++++++++++++++++++
//		トードー子分Ｂ 会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkTodo_child2()
{
	local main_num = GetNumFlg_("NUM_SCENARIO_MAIN");									// Num0
	local ice_event_num   = GetNumFlg_("NUM_SCENARIO_SUB_ICE");							// Num5
	local sky_num		 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");							// Num9
	local bit_sinario_clesr	 = GetEventFlg_("BFG_SCENARIO_CLEAR_ALL");					// Bit_46 シナリオクリア
	
	if(bit_sinario_clesr == true){							// Bit_46 シナリオクリア
		OpenMsgWnd_();
		ShowMsg_("SINARIO_CLEAR_AFT_CHILD_B");		// 「あんた 旅ぐらしは 辛くないのか？
		KeyInputWait_();
		CloseMsgWnd_();
	}
	else if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){								// Num0 = 4
		if (ice_event_num < GetFlagID_("CONST_SS_IF_GO_TO_THE_EAST_ICE_PARK")) {		// Num5 < 14
			OpenMsgWnd_();
			ShowMsg_("DEMO_003_AFT_CHILD_B");		// 「東の奴らも　元は　仲間なんだべ。
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (ice_event_num < GetFlagID_("CONST_SS_IF_FIRST_ATTACK")) {				// Num5 < 16
			OpenMsgWnd_();
			ShowMsg_("DEMO_006_AFT_CHILD_B");		// 「水中ライドしている最中に　Bボタンを押せば
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (ice_event_num < GetFlagID_("CONST_SS_IF_GO_TO_THE_ICE_RUINS")) {		// Num5 < 20
			// トードーの子分Ｂ
			OpenMsgWnd_();
			ShowMsg_("DEMO_008_AFT_CHILD_B");		// 「ここらが　ガマンの限界だべ！
			KeyInputWait_();
			CloseMsgWnd_();
			// 東ポーラパーク住人Ｂ
			OpenMsgWnd_();
			ShowMsg_("DEMO_008_AFT_EST_NPC_B");		// 「てめぇ！　言いやがったな！
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (ice_event_num < GetFlagID_("CONST_SS_IF_CLEAR_ICE_FIELD")) {			// Num5 < 36
			OpenMsgWnd_();
			ShowMsg_("DEMO_012_AFT_CHILD_B");		// 「東の奴らを 追い払ったと思ったのによ。
			KeyInputWait_();
			CloseMsgWnd_();
		} else {
			OpenMsgWnd_();
			ShowMsg_("DEMO_019_AFT_CHILD_B");		// 「客人よ ここを旅立つんか？
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else if(main_num == GetFlagID_("CONST_SM_SKY")){								// Num0 = 8
		if(sky_num < GetFlagID_("CONST_SS_SK_GO_PRISON_SKY")) {			// Num9 < 30
			OpenMsgWnd_();
			ShowMsg_("GARUBIRUSU_AFT_CHILD_B");			// 「たとえ この世がどうなろうと
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else {
			OpenMsgWnd_();
			ShowMsg_("BIG_AZAMUKU_AFT_CHILD_B");		// 「ようやく 黒い花粉がなくなったべな。
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else {
		OpenMsgWnd_();
		ShowMsg_("ICE_CLEAR_AFT_CHILD_B");			// 「トードー親分は あんたを頼りにしてる。
		KeyInputWait_();
		CloseMsgWnd_();
	}
}
//++++++++++++++++++++++++++++++++++++++++++++++++
//		トードー子分Ｃ 会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkTodo_child3()
{
	local main_num = GetNumFlg_("NUM_SCENARIO_MAIN");									// Num0
	local ice_event_num   = GetNumFlg_("NUM_SCENARIO_SUB_ICE");							// Num5
	local sky_num		 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");							// Num9
	local bit_sinario_clesr	 = GetEventFlg_("BFG_SCENARIO_CLEAR_ALL");					// Bit_46 シナリオクリア
	
	if(bit_sinario_clesr == true){							// Bit_46 シナリオクリア
		OpenMsgWnd_();
		ShowMsg_("SINARIO_CLEAR_AFT_CHILD_C");		//「トードー親分や シルバー親分も いいトシだ。
		KeyInputWait_();
		CloseMsgWnd_();
	}
	else if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){								// Num0 = 4
		if (ice_event_num < GetFlagID_("CONST_SS_IF_GO_TO_THE_EAST_ICE_PARK")) {		// Num5 < 14
			OpenMsgWnd_();
			ShowMsg_("DEMO_003_AFT_CHILD_C");		// 「やられたら　やり返すのが　トードー組だべ。
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (ice_event_num < GetFlagID_("CONST_SS_IF_FIRST_ATTACK")) {				// Num5 < 16
			OpenMsgWnd_();
			ShowMsg_("DEMO_006_AFT_CHILD_C");		// 「この凍骨の氷原以外でも　水中ライドを
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (ice_event_num < GetFlagID_("CONST_SS_IF_GO_TO_THE_ICE_RUINS")) {		// Num5 < 20
			// 東ポーラパーク住人Ｄ
			OpenMsgWnd_();
			ShowMsg_("DEMO_008_AFT_EST_NPC_D");		// 「こっちも　大将の命令なんでな……。
			KeyInputWait_();
			CloseMsgWnd_();
			// トードーの子分Ｃ
			OpenMsgWnd_();
			ShowMsg_("DEMO_008_AFT_CHILD_C");		// 「ずいぶん　勝手なことを　言うべ！
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (ice_event_num < GetFlagID_("CONST_SS_IF_CLEAR_ICE_FIELD")) {			// Num5 < 36
			OpenMsgWnd_();
			ShowMsg_("DEMO_012_AFT_CHILD_C");		// 「どうやら あいつのせいで
			KeyInputWait_();
			CloseMsgWnd_();
		} else {
			OpenMsgWnd_();
			ShowMsg_("DEMO_019_AFT_CHILD_C");		// 「<name_player/>が いてくれてよかった。
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else if(main_num == GetFlagID_("CONST_SM_SKY")){								// Num0 = 8
		if(sky_num < GetFlagID_("CONST_SS_SK_GO_PRISON_SKY")) {			// Num9 < 30
			OpenMsgWnd_();
			ShowMsg_("GARUBIRUSU_AFT_CHILD_C");			// 「黒い花粉が ワシらの敵なのは わかるんだ。
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else {
			OpenMsgWnd_();
			ShowMsg_("BIG_AZAMUKU_AFT_CHILD_C");		// 「ううむ 何もせんうちに
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else {
		OpenMsgWnd_();
		ShowMsg_("ICE_CLEAR_AFT_CHILD_C");			// 「親分を……そしてポーラパークを救ってくれた
		KeyInputWait_();
		CloseMsgWnd_();
	}
}
//++++++++++++++++++++++++++++++++++++++++++++++++
//		東ポーラパーク住人Ａ 会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkNpc_est1()
{
	local main_num = GetNumFlg_("NUM_SCENARIO_MAIN");									// Num0
	local ice_event_num   = GetNumFlg_("NUM_SCENARIO_SUB_ICE");							// Num5
	local sky_num		 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");							// Num9
	local bit_sinario_clesr	 = GetEventFlg_("BFG_SCENARIO_CLEAR_ALL");					// Bit_46 シナリオクリア
	
	if(bit_sinario_clesr == true){							// Bit_46 シナリオクリア
		OpenMsgWnd_();
		ShowMsg_("SINARIO_CLEAR_AFT_EST_NPC_A");	//「あんたの顔を見ると なぜだか安心するよ。
		KeyInputWait_();
		CloseMsgWnd_();
	}
	else if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){								// Num0 = 4
		if (ice_event_num < GetFlagID_("CONST_SS_IF_FIRST_ATTACK")) {				// Num5 < 16
			OpenMsgWnd_();
			ShowMsg_("DEMO_006_AFT_EST_NPC_A");		// 「レジスタンス……？ まだ生き残りがいたか。
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (ice_event_num < GetFlagID_("CONST_SS_IF_GO_TO_THE_ICE_RUINS")) {		// Num5 < 20
			// トードーの子分Ａ
			OpenMsgWnd_();
			ShowMsg_("DEMO_008_AFT_CHILD_A");		// 「おめたち！　どうして　トードー親分を
			KeyInputWait_();
			CloseMsgWnd_();
			//東ポーラパーク住人Ａ
			OpenMsgWnd_();
			ShowMsg_("DEMO_008_AFT_EST_NPC_A");		// 「じゃあ　誰が　ドン・シルバーを
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (ice_event_num < GetFlagID_("CONST_SS_IF_CLEAR_ICE_FIELD")) {			// Num5 < 36
			OpenMsgWnd_();
			ShowMsg_("DEMO_012_AFT_EST_NPC_A");		// （仮）「イエタスさまが ニセモノ？
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else {
			OpenMsgWnd_();
			ShowMsg_("DEMO_019_AFT_EST_NPC_A");		// 「俺たち すっかり ダマされたんだなぁ。
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else if(main_num == GetFlagID_("CONST_SM_SKY")){								// Num0 = 8
		if(sky_num < GetFlagID_("CONST_SS_SK_GO_PRISON_SKY")) {			// Num9 < 30
			OpenMsgWnd_();
			ShowMsg_("GARUBIRUSU_AFT_EST_NPC_A");			// 「こんな時こそ 東と西が ひとつになって
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else {
			OpenMsgWnd_();
			ShowMsg_("BIG_AZAMUKU_AFT_EST_NPC_A");			// 「黒い花粉が 空から消えたんだって？
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else {
		OpenMsgWnd_();
		ShowMsg_("ICE_CLEAR_AFT_EST_NPC_A");			// 「おおお……アゴが痛え……。
		KeyInputWait_();
		CloseMsgWnd_();
	}
}
//++++++++++++++++++++++++++++++++++++++++++++++++
//		東ポーラパーク住人Ｂ 会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkNpc_est2()
{
	local main_num = GetNumFlg_("NUM_SCENARIO_MAIN");									// Num0
	local ice_event_num   = GetNumFlg_("NUM_SCENARIO_SUB_ICE");							// Num5
	local sky_num		 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");							// Num9
	local bit_sinario_clesr	 = GetEventFlg_("BFG_SCENARIO_CLEAR_ALL");					// Bit_46 シナリオクリア
	
	if(bit_sinario_clesr == true){							// Bit_46 シナリオクリア
		OpenMsgWnd_();
		ShowMsg_("SINARIO_CLEAR_AFT_EST_NPC_B");	//「前に オレは お前のことを
		KeyInputWait_();
		CloseMsgWnd_();
	}
	else if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){								// Num0 = 4
		if (ice_event_num < GetFlagID_("CONST_SS_IF_FIRST_ATTACK")) {					// Num5 < 16
			OpenMsgWnd_();
			ShowMsg_("DEMO_006_AFT_EST_NPC_B");		// 「オレたちは イエタスファミリー。
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (ice_event_num < GetFlagID_("CONST_SS_IF_GO_TO_THE_ICE_RUINS")) {		// Num5 < 20
			// トードーの子分Ｂ
			OpenMsgWnd_();
			ShowMsg_("DEMO_008_AFT_CHILD_B");		// 「ここらが　ガマンの限界だべ！
			KeyInputWait_();
			CloseMsgWnd_();
			// 東ポーラパーク住人Ｂ
			OpenMsgWnd_();
			ShowMsg_("DEMO_008_AFT_EST_NPC_B");		// 「てめぇ！　言いやがったな！
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (ice_event_num < GetFlagID_("CONST_SS_IF_CLEAR_ICE_FIELD")) {			// Num5 < 36
			OpenMsgWnd_();
			ShowMsg_("DEMO_012_AFT_EST_NPC_B");		// （仮）「どーなってるんだ・・。
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else {
			OpenMsgWnd_();
			ShowMsg_("DEMO_019_AFT_EST_NPC_B");		// 「オレたちは シルバーファミリー。
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else if(main_num == GetFlagID_("CONST_SM_SKY")){								// Num0 = 8
		if(sky_num < GetFlagID_("CONST_SS_SK_GO_PRISON_SKY")) {			// Num9 < 30
			OpenMsgWnd_();
			ShowMsg_("GARUBIRUSU_AFT_EST_NPC_B");			// 「こうなったら 腹をくくらねぇとな。
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else {
			OpenMsgWnd_();
			ShowMsg_("BIG_AZAMUKU_AFT_EST_NPC_B");			// 「黒い花粉から 氷原を解放したのは お前だ。
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else {
		OpenMsgWnd_();
		ShowMsg_("ICE_CLEAR_AFT_EST_NPC_B");			// 「今回の一件で ドン・シルバーにも
		KeyInputWait_();
		CloseMsgWnd_();
	}
}
//++++++++++++++++++++++++++++++++++++++++++++++++
//		東ポーラパーク住人Ｃ 会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkNpc_est3()
{
	local main_num = GetNumFlg_("NUM_SCENARIO_MAIN");									// Num0
	local ice_event_num   = GetNumFlg_("NUM_SCENARIO_SUB_ICE");							// Num5
	local sky_num		 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");							// Num9
	local bit_sinario_clesr	 = GetEventFlg_("BFG_SCENARIO_CLEAR_ALL");					// Bit_46 シナリオクリア
	
	if(bit_sinario_clesr == true){							// Bit_46 シナリオクリア
		OpenMsgWnd_();
		ShowMsg_("SINARIO_CLEAR_AFT_EST_NPC_C");	//「どんな問題を 抱えていたとしても
		KeyInputWait_();
		CloseMsgWnd_();
	}
	else if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){								// Num0 = 4
		if (ice_event_num < GetFlagID_("CONST_SS_IF_GO_TO_THE_ICE_CEMETERY")) {			// Num5 < 17
			OpenMsgWnd_();
			ShowMsg_("DEMO_006_AFT_EST_NPC_C");		// 「シルバーのだんなが 生きていた時とは
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (ice_event_num < GetFlagID_("CONST_SS_IF_CLEAR_ICE_FIELD")) {			// Num5 < 36
			OpenMsgWnd_();
			ShowMsg_("DEMO_009_AFT_EST_NPC_C");		// 「ああ……みんな出入りで 行っちまったよ。
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else {
			OpenMsgWnd_();
			ShowMsg_("DEMO_019_AFT_EST_NPC_C");		// 「やれやれ……大騒ぎだったが
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else if(main_num == GetFlagID_("CONST_SM_SKY")){								// Num0 = 8
		if(sky_num < GetFlagID_("CONST_SS_SK_GO_PRISON_SKY")) {			// Num9 < 30
			OpenMsgWnd_();
			ShowMsg_("GARUBIRUSU_AFT_EST_NPC_C");			// 「心配ない きっとあの空も なんとかなるさ。
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else {
			OpenMsgWnd_();
			ShowMsg_("BIG_AZAMUKU_AFT_EST_NPC_C");			// 「あんたが 氷原を救ってくれる。
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else {
		OpenMsgWnd_();
		ShowMsg_("ICE_CLEAR_AFT_EST_NPC_C");			// 「おかげさまで あれからは平和そのものさ。
		KeyInputWait_();
		CloseMsgWnd_();
	}
}
//++++++++++++++++++++++++++++++++++++++++++++++++
//		東ポーラパーク住人Ｄ 会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkNpc_est4()
{
	local main_num = GetNumFlg_("NUM_SCENARIO_MAIN");									// Num0
	local ice_event_num   = GetNumFlg_("NUM_SCENARIO_SUB_ICE");							// Num5
	local sky_num		 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");							// Num9
	local bit_sinario_clesr	 = GetEventFlg_("BFG_SCENARIO_CLEAR_ALL");					// Bit_46 シナリオクリア
	
	if(bit_sinario_clesr == true){							// Bit_46 シナリオクリア
		OpenMsgWnd_();
		ShowMsg_("SINARIO_CLEAR_AFT_EST_NPC_D");	//「大したもてなしもできず すまないが
		KeyInputWait_();
		CloseMsgWnd_();
	}
	else if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){								// Num0 = 4
		if (ice_event_num < GetFlagID_("CONST_SS_IF_FIRST_ATTACK")) {					// Num5 < 16
			OpenMsgWnd_();
			ShowMsg_("DEMO_007_AFT_EST_NPC_D");		// 「イエタスさまは貴様などとは もう会わん！
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (ice_event_num < GetFlagID_("CONST_SS_IF_GO_TO_THE_ICE_RUINS")) {		// Num5 < 20
			// 東ポーラパーク住人Ｄ
			OpenMsgWnd_();
			ShowMsg_("DEMO_008_AFT_EST_NPC_D");		// 「こっちも　大将の命令なんでな……。
			KeyInputWait_();
			CloseMsgWnd_();
			// トードーの子分Ｃ
			OpenMsgWnd_();
			ShowMsg_("DEMO_008_AFT_CHILD_C");		// 「ずいぶん　勝手なことを　言うべ！
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (ice_event_num < GetFlagID_("CONST_SS_IF_CLEAR_ICE_FIELD")) {			// Num5 < 36
			OpenMsgWnd_();
			ShowMsg_("DEMO_012_AFT_EST_NPC_D");		// （仮）「シルバー親分が 生きていただなんて！
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else {
			OpenMsgWnd_();
			ShowMsg_("DEMO_019_AFT_EST_NPC_D");		// 「ドン・シルバーは どうなさっている？
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else if(main_num == GetFlagID_("CONST_SM_SKY")){								// Num0 = 8
		if(sky_num < GetFlagID_("CONST_SS_SK_GO_PRISON_SKY")) {			// Num9 < 30
			OpenMsgWnd_();
			ShowMsg_("GARUBIRUSU_AFT_EST_NPC_D");			// 「……ドン・シルバーに 会ってやってくれ。
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else {
			OpenMsgWnd_();
			ShowMsg_("BIG_AZAMUKU_AFT_EST_NPC_D");			// 「ドン・シルバーから お前のことを
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else {
		OpenMsgWnd_();
		ShowMsg_("ICE_CLEAR_AFT_EST_NPC_D");			// 「お前 ドン・シルバーに用事か？
		KeyInputWait_();
		CloseMsgWnd_();
	}
}
//++++++++++++++++++++++++++++++++++++++++++++++++
//		霊園門番 会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkNpc_gardman()
{
	local main_num = GetNumFlg_("NUM_SCENARIO_MAIN");									// Num0
	local ice_event_num   = GetNumFlg_("NUM_SCENARIO_SUB_ICE");							// Num5
	
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){									// Num0 = 4
		if (ice_event_num < GetFlagID_("CONST_SS_IF_GO_TO_THE_ICE_CEMETERY")) {			// Num5 < 17
			OpenMsgWnd_();
			ShowMsg_("DEMO_006_AFT_EST_NPC_GARD");		// 「イエタスさまの命令だ！
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
}
//++++++++++++++++++++++++++++++++++++++++++++++++
//		トードー 会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkTodo()
{
	local main_num = GetNumFlg_("NUM_SCENARIO_MAIN");									// Num0
	local ice_event_num   = GetNumFlg_("NUM_SCENARIO_SUB_ICE");							// Num5
	local sky_num		 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");							// Num9
	local bit_sinario_clesr	 = GetEventFlg_("BFG_SCENARIO_CLEAR_ALL");					// Bit_46 シナリオクリア
	
	if(bit_sinario_clesr == true){							// Bit_46 シナリオクリア
		OpenMsgWnd_();
		ShowMsg_("SINARIO_CLEAR_AFT_TODO");				//「よう来たな <name_player/>。
		KeyInputWait_();
		CloseMsgWnd_();
	}
	else if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){								// Num0 = 4
		if (ice_event_num < GetFlagID_("CONST_SS_IF_GO_TO_THE_EAST_ICE_PARK")) {		// Num5 < 14
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_TODO");
			ShowMsg_("DEMO_003_AFT_TODO");				// 「<name_player/>よ　まずは
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (ice_event_num < GetFlagID_("CONST_SS_IF_GO_BACK_WEST_ICE_PARK")) {		// Num5 < 15
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_TODO");
			ShowMsg_("DEMO_006_AFT_TODO");				// 「おおっ！ さすがは ルキヤの見込んだ男じゃ！
			KeyInputWait_();
			CloseMsgWnd_();
		}
		//[イエタスとの会見]後のメッセージ
		else if(ice_event_num == GetFlagID_("CONST_SS_IF_GO_BACK_WEST_ICE_PARK")){		// Num5 = 15
			// ルーラを禁止するフラグを設定
			SetEventFlg_("BFG_PLAYERABILITY_RULER_PROHIBIT", true);						// Bit_440 ルーラ禁止
			// メッセージを表示後、デモの再生をする
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_TODO");
			ShowMsg_("DEMO_007_AFT_TODO");				// 「おう……戻ったか。
			KeyInputWait_();
			CloseMsgWnd_();
			SetNumFlg_("NUM_SCENARIO_SUB_ICE",GetFlagID_("CONST_SS_IF_FIRST_ATTACK"));	// Num5 <- 16
			// デモの復帰位置をデモの完成後に設定します
			SetReturnDemoPosDir_(Vec3(-29.876, 75.135, -542.234), -17);
			// Demo313[希望とはなんぞや]再生
			TouchNpcChangeDemo(313);
			SetEventFlg_("BFG_SET_CHANGE_BGM_MINE", true);						// Bit_1390 ポーラパークのBGMを変更するフラグ
		}
		else if (ice_event_num < GetFlagID_("CONST_SS_IF_GO_TO_THE_ICE_RUINS")) {		// Num5 < 20
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_TODO");
			ShowMsg_("DEMO_009_AFT_TODO");				// 「イエタスは ここでワシが抑えておく！
			KeyInputWait_();
			CloseMsgWnd_();
		
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_IETASU");
			ShowMsg_("DEMO_009_AFT_YETAS");				// 「ぬううっ！！
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else {
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_TODO");
			ShowMsg_("DEMO_012_AFT_TODO");				// 「ワシらもすぐ後を追う。ヌシは先行して
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else if(main_num == GetFlagID_("CONST_SM_SKY")){								// Num0 = 8
		if(sky_num < GetFlagID_("CONST_SS_SK_GO_PRISON_SKY")) {			// Num9 < 30
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_TODO");
			ShowMsg_("GARUBIRUSU_AFT_TODO");			// 「おお <name_player/>か！
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else {
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_TODO");
			ShowMsg_("BIG_AZAMUKU_AFT_TODO");			// 「おんし……あの黒い花粉を 片付けたんじゃな。
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else {
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_TODO");
		ShowMsg_("ICE_CLEAR_AFT_TODO");				// 「おんし よう来たのう。
		KeyInputWait_();
		CloseMsgWnd_();
	}
}
//++++++++++++++++++++++++++++++++++++++++++++++++
//		シルバー 会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkSilver()
{
	local main_num		 = GetNumFlg_("NUM_SCENARIO_MAIN");								// Num0
	local ice_event_num	 = GetNumFlg_("NUM_SCENARIO_SUB_ICE");							// Num5
	local sky_num		 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");							// Num9
	local bit_sinario_clesr	 = GetEventFlg_("BFG_SCENARIO_CLEAR_ALL");					// Bit_46 シナリオクリア
	
	if(bit_sinario_clesr == true){							// Bit_46 シナリオクリア
		OpenMsgWnd_();
		ShowMsg_("SINARIO_CLEAR_AFT_EST_SILV");		//「今日は どうしたんだ？
		KeyInputWait_();
		CloseMsgWnd_();
	}
	else if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){								// Num0 = 4
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_SILVER");
		ShowMsg_("DEMO_012_AFT_EST_SILV");			// 「奴は なぜ ルキヤの希望を欲する？
		KeyInputWait_();
		CloseMsgWnd_();
	}
	else if(main_num == GetFlagID_("CONST_SM_SKY")){								// Num0 = 8
		if(sky_num < GetFlagID_("CONST_SS_SK_GO_PRISON_SKY")) {			// Num9 < 30
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_SILVER");
			ShowMsg_("GARUBIRUSU_AFT_EST_SILV");			// 「……あの黒い花粉が 出てきて以来
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else {
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_SILVER");
			ShowMsg_("BIG_AZAMUKU_AFT_EST_SILV");			// 「ハハハ……黒い花粉が 消えたと思えば
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else {
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_SILVER");
		ShowMsg_("ICE_CLEAR_AFT_EST_SILV");			// 「ここのところ ポーラパークの立て直しで
		KeyInputWait_();
		CloseMsgWnd_();
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		イエタス 会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkYetas()
{
	local main_num		 = GetNumFlg_("NUM_SCENARIO_MAIN");								// Num0
	local ice_event_num	 = GetNumFlg_("NUM_SCENARIO_SUB_ICE");							// Num5

	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){								// Num0 = 4
		if (ice_event_num < GetFlagID_("CONST_SS_IF_GO_TO_THE_ICE_RUINS")) {		// Num5 < 20
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_TODO");
			ShowMsg_("DEMO_009_AFT_TODO");				// 「イエタスは ここでワシが抑えておく！
			KeyInputWait_();
			CloseMsgWnd_();

			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_IETASU");
			ShowMsg_("DEMO_009_AFT_YETAS");				// 「ぬううっ！！
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++++++++
// 進入禁止地雷に触れた時、引き返す処理
//------------------------------------------------------
// 第一引数：離れたい座標
// 第二引数：移動フレーム数(デフォルト引数:30F)
// 戻り値  ：なし
//++++++++++++++++++++++++++++++++++++++++++++++++++++++
function uPlayerTurnMoveDirWalk( pos_x, pos_y, pos_z, move_frame = 30)
{
	local player	 = GetPlayerId_();
	local task_walk	 = Task_MoveForward_(player, 1.0, false);

	SetDirToPos_(player, Vec3(pos_x, pos_y, pos_z));
	local dir = GetDir_(player);
	SetMotion_(player, MOT_WALK, BLEND_N);
	SetDir_(player, dir+180);
	Wait_(move_frame);
	DeleteTask_(task_walk);
}


