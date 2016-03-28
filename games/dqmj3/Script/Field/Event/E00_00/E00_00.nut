//===================== 拠点【楽園(外観)】 ====================

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
	// フラグの状態を取得
	main_num = GetNumFlg_("NUM_SCENARIO_MAIN");		// Num0
	op_num	 = GetNumFlg_("NUM_SCENARIO_SUB_OP");	// Num1
	core_num = GetNumFlg_("NUM_SCENARIO_SUB_CORE");	// Num8
	
	// ライド強制解除
	SetRideOffStart_();
	
	// 主人公を少年状態にする
	if(main_num == GetFlagID_("CONST_SM_CORE")){	// Num0 = 7
		if(core_num <= GetFlagID_("CONST_SS_CO_TALK_ANSESU_4")){					// Num8 = 5 以下
			SetPlayerBoy(true);		// 少年（主人公）状態
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
		SetEventFlg_("BFG_PLAYERABILITY_MANTAN_PROHIBIT", true);	// まんたん禁止(Bit444)
	}else{
		SetEventFlg_("BFG_RIDE_INPUT_PROHIBIT", false);
		SetEventFlg_("BFG_PLAYERABILITY_RULER_PROHIBIT", false);
		SetEventFlg_("BFG_PLAYERABILITY_MANTAN_PROHIBIT", false);
	}
	
	//---------------
	// ▼ギミック配置
	//---------------
	//■ リアクター(ポッド)
	// リソース読み込み
	local id_reactor = ReadGimmick_("o_dem_11");
	// ID初期化
	g_reactor <- C_NONE_ID;
	if(main_num == GetFlagID_("CONST_SM_OPENING")){
		if(op_num == GetFlagID_("CONST_SS_OP_SELECT_MONSTER")){
			g_reactor = ArrangePointGimmick_("o_dem_11", id_reactor, "g_reactor");
			SetMotion_(g_reactor, MOT_GIMMICK_1, BLEND_N); // ポッドが開いている状態に設定
			// 「！」アイコン(マップ用)
			local exclamation = ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "g_reactor");
			SetNaviMapIconVisible_(exclamation, true);
		}
	}

	// ■裂け目と光
	local id_rip_light = ReadGimmick_("o_E00_02");
	g_rip_light <- C_NONE_ID; // ID初期化
	g_rip_light =  ArrangePointGimmick_("o_E00_02", id_rip_light, "g_rip_light");

	//----------
	// ▼NPC配置
	//----------
	// ■サンチョ(オープニング・コア両方)
	// オープニングシナリオ
	g_sancho <- C_NONE_ID;
	g_sancho_eff <- C_NONE_ID;
	if(main_num == GetFlagID_("CONST_SM_OPENING")){
		if(op_num == GetFlagID_("CONST_SS_OP_SELECT_MONSTER")){
			local id_sancho = ReadNpc_("n011");
			g_sancho = ArrangePointNpc_(id_sancho, "npc_sancho01");
			SetWalkRadius_(g_sancho, 35);
			SetComMode_(g_sancho, 1);
			SetScaleSilhouette(g_sancho, SCALE.SANCHO_EVENT, SILHOUETTE_WIDTH.SANCHO_EVENT); // サンチョのスケール値を設定
			SetTalkCameraType_(g_sancho, TALK_CAMERA_UP);
			// サンチョを目立たせるエフェクト
			LoadEffect_("ef732_11_sancho_eff");
			g_sancho_eff = SetSelectBoneEffect_("ef732_11_sancho_eff", g_sancho, ATTACH_GLOBAL);
		}
	}
	// コアシナリオ
	if(main_num == GetFlagID_("CONST_SM_CORE")){								// Num0 = 7
		if(core_num <= GetFlagID_("CONST_SS_CO_TALK_ANSESU_4")){				// Num8 = 5 以下
			local id_sancho = ReadNpc_("n011");
			g_sancho = ArrangePointNpc_(id_sancho, "npc_sancho01");
			SetWalkRadius_(g_sancho, 35);
			SetComMode_(g_sancho, 1);
			SetScaleSilhouette(g_sancho, SCALE.SANCHO_EVENT, SILHOUETTE_WIDTH.SANCHO_EVENT); // サンチョのスケール値を設定
			SetTalkCameraType_(g_sancho, TALK_CAMERA_UP);
			SetReactorMsg_(g_sancho, "NPC_SANCYO_CORE_REC_060");
		}
	}
	if(main_num == GetFlagID_("CONST_SM_CORE")){								// Num0 = 7
		if(core_num >= GetFlagID_("CONST_SS_CO_CHECK_UP_ANSESU")){				// Num8 = 6 以上
			local id_sancho = ReadNpc_("n011");
			g_sancho = ArrangePointNpc_(id_sancho, "npc_sancho02");
			SetScaleSilhouette(g_sancho, SCALE.SANCHO_EVENT, SILHOUETTE_WIDTH.SANCHO_EVENT); // サンチョのスケール値を設定
			SetTalkCameraType_(g_sancho, TALK_CAMERA_UP);
			SetReactorMsg_(g_sancho, "NPC_SANCYO_CORE_REC_060");
		}
	}

	// ■ＯＰ用モンスターＮＰＣ(スライム・ピンクモーモン)
	g_slime_op <- C_NONE_ID;
	g_pnkmo_op <- C_NONE_ID;
	if(main_num == GetFlagID_("CONST_SM_OPENING")){
		if(op_num == GetFlagID_("CONST_SS_OP_SELECT_MONSTER")){
			// スライム
			g_slime_op = ReadAndArrangePointNpc("n051", "npc_op_slime");
			SetScaleSilhouette(g_slime_op, SCALE.OP_MONS_NPC, SILHOUETTE_WIDTH.OP_MONS_NPC);
			// ピンクモーモン
			g_pnkmo_op = ReadAndArrangePointNpc("n052", "npc_op_pinkmomon");
			SetScaleSilhouette(g_pnkmo_op, SCALE.OP_MONS_NPC, SILHOUETTE_WIDTH.OP_MONS_NPC);
		}
	}
	
	// ■アンセス(コアシナリオ用)
	// ID初期化
	g_npc_ansesu <- C_NONE_ID;
	// リソース読み込み
	local id_ansesu	 = ReadNpc_("n036");	// アンセス
	if(main_num == GetFlagID_("CONST_SM_CORE")){								// Num0 = 7
		if(core_num == GetFlagID_("CONST_SS_CO_TALK_ANSESU_1")){				// Num8 = 2
			g_npc_ansesu = ArrangePointNpc_(id_ansesu, "npc_ansesu_01");
			SetTalkTurn_(g_npc_ansesu, false);									// 話しかけても振り向かない
			SetReactorMsg_(g_npc_ansesu, "NPC_ANSESU_CORE_REC_060");
		}
		else if(core_num == GetFlagID_("CONST_SS_CO_TALK_ANSESU_2")){			// Num8 = 3
			g_npc_ansesu = ArrangePointNpc_(id_ansesu, "npc_ansesu_01");
			SetTalkCameraType_(g_npc_ansesu, TALK_CAMERA_UP);
			SetTalkCameraEyeOffset_(g_npc_ansesu, 5.0, 0.0);
			SetDir_(g_npc_ansesu, -150);
			SetReactorMsg_(g_npc_ansesu, "NPC_ANSESU_CORE_REC_060");
		}
		else if(core_num == GetFlagID_("CONST_SS_CO_TALK_ANSESU_4")){			// Num8 = 5
			g_npc_ansesu = ArrangePointNpc_(id_ansesu, "npc_ansesu_02");
			SetTalkEnable_(g_npc_ansesu, false);								//会話アイコン非表示
			SetReactorMsg_(g_npc_ansesu, "NPC_ANSESU_CORE_REC_060");
		}
		else if(core_num >= GetFlagID_("CONST_SS_CO_CHECK_UP_ANSESU")){			// Num8 = 6 以上
			g_npc_ansesu = ArrangePointNpc_(id_ansesu, "npc_ansesu_02");
			SetTalkCameraType_(g_npc_ansesu, TALK_CAMERA_UP);
			SetTalkCameraEyeOffset_(g_npc_ansesu, -5.0, 0.0);
			SetDir_(g_npc_ansesu, 160);
//			SetReactorMsg_(g_npc_ansesu, "NPC_ANSESU_CORE_REC_060");
		}
	}
	
	// ■コアシナリオ用モンスターＮＰＣ
	g_core_angel_a	 <- C_NONE_ID;
	g_core_angel_b	 <- C_NONE_ID;
	g_core_jobo_a	 <- C_NONE_ID;
	g_core_jobo_b	 <- C_NONE_ID;
	g_core_pink_a	 <- C_NONE_ID;
	g_core_pink_b	 <- C_NONE_ID;
	g_core_slime_a	 <- C_NONE_ID;
	g_core_slime_b	 <- C_NONE_ID;
	
	// ■ゴールドエンゼルA
	if(main_num == GetFlagID_("CONST_SM_CORE")){								// Num0 = 7
		if(core_num <= GetFlagID_("CONST_SS_CO_CHECK_UP_ANSESU")){				// Num8 = 6 以下
			g_core_angel_a = ReadAndArrangePointNpc("m002_02", "npc_core_angelA");
			SetScaleSilhouette(g_core_angel_a, SCALE.S, SILHOUETTE_WIDTH.S);
			SetReactorMsg_(g_core_angel_a, "NPC_RAKUEN03_CORE_REC");
			
		}
	}
	
	// ■ゴールドエンゼルB
	if(main_num == GetFlagID_("CONST_SM_CORE")){								// Num0 = 7
		if(core_num <= GetFlagID_("CONST_SS_CO_CHECK_UP_ANSESU")){				// Num8 = 6 以下
			g_core_angel_b = ReadAndArrangePointNpc("m002_02", "npc_core_angelB");
			SetScaleSilhouette(g_core_angel_b, SCALE.S, SILHOUETTE_WIDTH.S);
			SetReactorMsg_(g_core_angel_b, "NPC_RAKUEN03_CORE_REC");
		}
	}
	
	// ■とげジョボーA
	if(main_num == GetFlagID_("CONST_SM_CORE")){								// Num0 = 7
		if(core_num <= GetFlagID_("CONST_SS_CO_TALK_ANSESU_4")){				// Num8 = 5 以下
			g_core_jobo_a = ReadAndArrangePointNpc("m127_02", "npc_core_joboA");
			SetScaleSilhouette(g_core_jobo_a, 0.5, 0.4);	// デモと同じサイズにする
			SetReactorMsg_(g_core_jobo_a, "NPC_RAKUEN04_CORE_REC");
		}
		if(core_num == GetFlagID_("CONST_SS_CO_CHECK_UP_ANSESU")){				// Num8 = 6
			g_core_jobo_a = ReadAndArrangePointNpc("m127_02", "npc_core_joboA2");
			SetScaleSilhouette(g_core_jobo_a, 0.5, 0.4);	// デモと同じサイズにする
			SetReactorMsg_(g_core_jobo_a, "NPC_RAKUEN04_CORE_REC");
		}
	}
	
	// ■とげジョボーB
	if(main_num == GetFlagID_("CONST_SM_CORE")){								// Num0 = 7
		if(core_num <= GetFlagID_("CONST_SS_CO_CHECK_UP_ANSESU")){				// Num8 = 6 以下
			g_core_jobo_b = ReadAndArrangePointNpc("m127_02", "npc_core_joboB");
			SetScaleSilhouette(g_core_jobo_b, 0.5, 0.4);	// デモと同じサイズにする
			SetReactorMsg_(g_core_jobo_b, "NPC_RAKUEN04_CORE_REC");
		}
	}
	
	// ■ピンクモーモンA
	if(main_num == GetFlagID_("CONST_SM_CORE")){								// Num0 = 7
		if(core_num <= GetFlagID_("CONST_SS_CO_TALK_ANSESU_4")){				// Num8 = 5 以下
			g_core_pink_a = ReadAndArrangePointNpc("m083_01", "npc_core_pinkA");
			SetScaleSilhouette(g_core_pink_a, SCALE.S, SILHOUETTE_WIDTH.S);
			SetReactorMsg_(g_core_pink_a, "NPC_RAKUEN02_CORE_REC");
		}
		if(core_num == GetFlagID_("CONST_SS_CO_CHECK_UP_ANSESU")){				// Num8 = 6
			g_core_pink_a = ReadAndArrangePointNpc("m083_01", "npc_core_pinkA2");
			SetScaleSilhouette(g_core_pink_a, SCALE.S, SILHOUETTE_WIDTH.S);
			SetReactorMsg_(g_core_pink_a, "NPC_RAKUEN02_CORE_REC");
		}
	}
	
	// ■ピンクモーモンB
	if(main_num == GetFlagID_("CONST_SM_CORE")){								// Num0 = 7
		if(core_num <= GetFlagID_("CONST_SS_CO_CHECK_UP_ANSESU")){				// Num8 = 6 以下
			g_core_pink_b = ReadAndArrangePointNpc("m083_01", "npc_core_pinkB");
			SetScaleSilhouette(g_core_pink_b, SCALE.S, SILHOUETTE_WIDTH.S);
			SetReactorMsg_(g_core_pink_b, "NPC_RAKUEN02_CORE_REC");
		}
	}
	
	// ■スライムA
	if(main_num == GetFlagID_("CONST_SM_CORE")){								// Num0 = 7
		if(core_num <= GetFlagID_("CONST_SS_CO_TALK_ANSESU_4")){				// Num8 = 5 以下
			g_core_slime_a = ReadAndArrangePointNpc("m000_00", "npc_core_slimeA");
			SetScaleSilhouette(g_core_slime_a, SCALE.S, SILHOUETTE_WIDTH.S);
			SetReactorMsg_(g_core_slime_a, "NPC_RAKUEN01_CORE_REC");
		}
		if(core_num == GetFlagID_("CONST_SS_CO_CHECK_UP_ANSESU")){				// Num8 = 6
			g_core_slime_a = ReadAndArrangePointNpc("m000_00", "npc_core_slimeA2");
			SetScaleSilhouette(g_core_slime_a, SCALE.S, SILHOUETTE_WIDTH.S);
			SetReactorMsg_(g_core_slime_a, "NPC_RAKUEN01_CORE_REC");
		}
	}
	
	// ■スライムB
	if(main_num == GetFlagID_("CONST_SM_CORE")){								// Num0 = 7
		if(core_num <= GetFlagID_("CONST_SS_CO_CHECK_UP_ANSESU")){				// Num8 = 6 以下
			g_core_slime_b = ReadAndArrangePointNpc("m000_00", "npc_core_slimeB");
			SetScaleSilhouette(g_core_slime_b, SCALE.S, SILHOUETTE_WIDTH.S);
			SetReactorMsg_(g_core_slime_b, "NPC_RAKUEN01_CORE_REC");
		}
	}
	
	
	//-----------
	// ▼地雷配置
	//-----------
	// ID初期化
	g_mine_reactor		<- C_NONE_ID;
	g_mine_ansesu		<- C_NONE_ID;
	
	// ■リアクター用地雷
	if(main_num == GetFlagID_("CONST_SM_OPENING")){
		if(op_num == GetFlagID_("CONST_SS_OP_SELECT_MONSTER")){
			g_mine_reactor = SetPointCircleEventMine_("mine_reactor", true);
		}
	}
	
	// ■アンセス用地雷
	if(main_num == GetFlagID_("CONST_SM_CORE")){								// Num0 = 7
		if(core_num == GetFlagID_("CONST_SS_CO_TALK_ANSESU_4")){				// Num8 = 5
			g_mine_ansesu = SetPointBoxEventMine_("mine_ansesu", false);
		}
	}
	
	
	//---------------------
	// ▼リアクターポイント
	//---------------------
	// ID初期化
	g_reactor_ansesu_02 <- C_NONE_ID;
	
	// ■アンセス
	if(main_num == GetFlagID_("CONST_SM_CORE")){								// Num0 = 7
		if(core_num == GetFlagID_("CONST_SS_CO_CHECK_UP_ANSESU")){				// Num8 = 6
			g_reactor_ansesu_02 = ArrangePointReactorPoint_("reactor_ansesu_02", SHORT_DIST);
			SetReactorEvent_(g_reactor_ansesu_02);
		}
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
	
	//-------------
	// ▼デモの再生
	//-------------
	if(main_num == GetFlagID_("CONST_SM_CORE")){								// Num0 = 7
		if(core_num == GetFlagID_("CONST_SS_CO_GO_MOTHER_ROOM")){				// Num8 = 1
			// シナリオ変更の為NUM8の2～4のイベントをカットして一気に5まで飛ばす
//			SetNumFlg_(core_num_sub, GetFlagID_("CONST_SS_CO_TALK_ANSESU_1"));	// Num8 = 2
			SetNumFlg_(core_num_sub, GetFlagID_("CONST_SS_CO_TALK_ANSESU_4"));	// Num8 = 5
			SetPlayerBoy(false);								// 少年（主人公）状態
			// デモ再生後のマップと配置座標を指定
			SetReturnDemoPosDir_(Vec3(-25.0, -25.0, 350.0), 28);
			// Demo602[楽園ふたたび①：楽園Map]
			EventStartChangeDemo(602, FADE_COLOR_BLACK);
		}
	}
	
	
	EventEnd_();
}
//------------------------------------------------
//		ＮＰＣ接触時
//------------------------------------------------
function TouchNpc()
{
	// シナリオのフラグを取得する
	main_num = GetNumFlg_("NUM_SCENARIO_MAIN");		// Num0
	op_num	 = GetNumFlg_("NUM_SCENARIO_SUB_OP");	// Num1
	core_num = GetNumFlg_("NUM_SCENARIO_SUB_CORE");	// Num8
	
	local target = GetTargetId_();
	local player = GetPlayerId_();
	
	DebugPrint("ID: " + target + " に接触 [TouchNpc]");
	
	switch (target) {
	case g_sancho :
		uTalkSancho();
		break;
	case g_npc_ansesu :
		uTalkAnsesu();
		break;
	case g_slime_op :
		uTalkSlimeOP();
		break;
	case g_pnkmo_op :
		uTalkPinkMomonOP();
		break;
	case g_core_angel_a :
		uTalkCoreAngelA();
		break;
	case g_core_angel_b :
		uTalkCoreAngelB();
		break;
	case g_core_jobo_a :
		uTalkCoreJoboA();
		break;
	case g_core_jobo_b :
		uTalkCoreJoboB();
		break;
	case g_core_pink_a :
		uTalkCorePinkA();
		break;
	case g_core_pink_b :
		uTalkCorePinkB();
		break;
	case g_core_slime_a :
		uTalkCoreSlimeA();
		break;
	case g_core_slime_b :
		uTalkCoreSlimeB();
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
	main_num = GetNumFlg_("NUM_SCENARIO_MAIN");		// Num0
	op_num	 = GetNumFlg_("NUM_SCENARIO_SUB_OP");	// Num1
	core_num = GetNumFlg_("NUM_SCENARIO_SUB_CORE");	// Num8
	
	local target = GetTouchEventMineId_();
	
	switch(target){
	case g_mine_reactor :
		uMineReactorGet();		// リアクターが落ちている付近に設置した地雷
		break;
	case g_mine_ansesu :
		uMineAnsesu();
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
	// シナリオのフラグを取得する
	main_num = GetNumFlg_("NUM_SCENARIO_MAIN");		// Num0
	op_num	 = GetNumFlg_("NUM_SCENARIO_SUB_OP");	// Num1
	core_num = GetNumFlg_("NUM_SCENARIO_SUB_CORE");	// Num8
	
	local target = GetTargetId_();
	
	switch(target){
	case g_reactor_ansesu_02 :
		uReactorPointAnsesu02();		// リアクターが落ちている付近にいるアンセス
		break;
	default:
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
//		サンチョ  会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkSancho()
{
	if(main_num == GetFlagID_("CONST_SM_OPENING")){										// Num0 = 0
		//  6/19ROM対応
		DeleteEffectEmitter_(g_sancho_eff); // 目立たせるエフェクトを一旦削除
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_SANCHO");
		ShowMsg_("SANCHO_001");				// 仮メッセージ
		KeyInputWait_();
		CloseMsgWnd_();
		g_sancho_eff = SetSelectBoneEffect_("ef732_11_sancho_eff", g_sancho, ATTACH_GLOBAL); // 会話終わりにエフェクトを再設置
	}
	if(main_num == GetFlagID_("CONST_SM_CORE")){										// Num0 = 7
		if(core_num == GetFlagID_("CONST_SS_CO_TALK_ANSESU_4")){						// Num8 = 5
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_SANCHO");
			ShowMsg_("NPC_SANCHO_CORE_010");
			KeyInputWait_();
			CloseMsgWnd_();
		}
		if(core_num >= GetFlagID_("CONST_SS_CO_CHECK_UP_ANSESU")){						// Num8 = 6 以上
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_SANCHO");
			ShowMsg_("NPC_SANCHO_CORE_020");
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		アンセス  会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkAnsesu()
{
	if(main_num == GetFlagID_("CONST_SM_CORE")){										// Num0 = 7
		if(core_num == GetFlagID_("CONST_SS_CO_TALK_ANSESU_1")){						// Num8 = 2
			SetNumFlg_(core_num_sub, GetFlagID_("CONST_SS_CO_TALK_ANSESU_2"));			// Num8 = 3
			SetPlayerBoy(false);														// 少年（主人公）状態
			// Demo603[楽園ふたたび②]再生
			TouchNpcChangeDemo(603);
		}
		else if(core_num == GetFlagID_("CONST_SS_CO_TALK_ANSESU_2")){					// Num8 = 3
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_ANSESU");
			ShowMsg_("NPC_ANSESU_CORE_020");			//「どうした <name_player/>？
			KeyInputWait_();
			
			// 「はい」
			if (GetQueryResult_() == QUERY2_0) {
				CloseMsgWnd_();
				SetNumFlg_(core_num_sub, GetFlagID_("CONST_SS_CO_TALK_ANSESU_3"));		// Num8 = 4
				SetPlayerBoy(false);													// 少年（主人公）状態
				// Demo604[アンセスとの問答①]再生
				SetReturnDemoPosDir_(Vec3(39.7, -26.8, 433.2), -146);
				TouchNpcChangeDemo(604);
			}
			// 「いいえ」
			else {
				ShowMsg_("NPC_ANSESU_CORE_021");		//「そうか。なら そんな顔は するもんじゃない。
				KeyInputWait_();
				CloseMsgWnd_();
			}
		}
		else if(core_num == GetFlagID_("CONST_SS_CO_TALK_ANSESU_4")){					// Num8 = 5
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_ANSESU");
			ShowMsg_("NPC_ANSESU_CORE_050");			//「……なんだ <name_player/>。今日は
			KeyInputWait_();
			// 「はい」
			if(GetQueryResult_() == QUERY2_0){
				ShowMsg_("NPC_ANSESU_CORE_051");		//「わかってくれれば いい。
				KeyInputWait_();
				CloseMsgWnd_();
			}
			// 「いいえ」
			else{
				CloseMsgWnd_();
				SetNumFlg_(core_num_sub, GetFlagID_("CONST_SS_CO_CHECK_UP_ANSESU"));	// Num8 = 6
				SetPlayerBoy(false);													// 少年（主人公）状態
				// Demo606[アンセスとの問答③]
				SetReturnDemoPosDir_(Vec3(-1048.9, 4.5, 208.6), 11);
				TouchNpcChangeDemo(606);
			}
		}
		else if(core_num == GetFlagID_("CONST_SS_CO_CHECK_UP_ANSESU")){					// Num8 = 6
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_ANSESU");
			ShowMsg_("NPC_ANSESU_CORE_060");			//「お おい ○主人公の名前○……？
			KeyInputWait_();
			CloseMsgWnd_();
			
			//リアクターSEを再生
			PlaySE_("SE_FLD_135");						//【リアクター反応あり】表示
			Wait_(30);
			
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_REACTOR");
			ShowMsg_("SYS_REACTOR_CORE_060");			//「くり返します。
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		オープニングのスライム  会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkSlimeOP()
{
	OpenMsgWnd_();
	ShowMsg_("OP_NPC_MSG_001");
	KeyInputWait_();
	CloseMsgWnd_();
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		オープニングのピンクモーモン  会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkPinkMomonOP()
{
	OpenMsgWnd_();
	ShowMsg_("OP_NPC_MSG_002");
	KeyInputWait_();
	CloseMsgWnd_();
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		コアシナリオのゴールドエンゼルA  会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkCoreAngelA()
{
	if(main_num == GetFlagID_("CONST_SM_CORE")){								// Num0 = 7
		if(core_num <= GetFlagID_("CONST_SS_CO_TALK_ANSESU_4")){				// Num8 = 5 以下
			OpenMsgWnd_();
			ShowMsg_("NPC_CORE_ANGEL_A_010");
			KeyInputWait_();
			CloseMsgWnd_();
		}
		if(core_num == GetFlagID_("CONST_SS_CO_CHECK_UP_ANSESU")){				// Num8 = 6
			OpenMsgWnd_();
			ShowMsg_("NPC_CORE_ANGEL_A_020");
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		コアシナリオのゴールドエンゼルB  会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkCoreAngelB()
{
	OpenMsgWnd_();
	ShowMsg_("NPC_CORE_ANGEL_B_010");
	KeyInputWait_();
	CloseMsgWnd_();
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		コアシナリオのとげジョボーA  会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkCoreJoboA()
{
	if(main_num == GetFlagID_("CONST_SM_CORE")){								// Num0 = 7
		if(core_num <= GetFlagID_("CONST_SS_CO_TALK_ANSESU_4")){				// Num8 = 5 以下
			OpenMsgWnd_();
			ShowMsg_("NPC_CORE_JOBO_A_010");
			KeyInputWait_();
			CloseMsgWnd_();
		}
		if(core_num == GetFlagID_("CONST_SS_CO_CHECK_UP_ANSESU")){				// Num8 = 6
			OpenMsgWnd_();
			ShowMsg_("NPC_CORE_JOBO_A_020");
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		コアシナリオのとげジョボーB  会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkCoreJoboB()
{
	OpenMsgWnd_();
	ShowMsg_("NPC_CORE_JOBO_B_010");
	KeyInputWait_();
	CloseMsgWnd_();
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		コアシナリオのピンクモーモンA  会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkCorePinkA()
{
	if(main_num == GetFlagID_("CONST_SM_CORE")){								// Num0 = 7
		if(core_num <= GetFlagID_("CONST_SS_CO_TALK_ANSESU_4")){				// Num8 = 5 以下
			OpenMsgWnd_();
			ShowMsg_("NPC_CORE_PINK_A_010");
			KeyInputWait_();
			CloseMsgWnd_();
		}
		if(core_num == GetFlagID_("CONST_SS_CO_CHECK_UP_ANSESU")){				// Num8 = 6
			OpenMsgWnd_();
			ShowMsg_("NPC_CORE_PINK_A_020");
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		コアシナリオのピンクモーモンB  会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkCorePinkB()
{
	OpenMsgWnd_();
	ShowMsg_("NPC_CORE_PINK_B_010");
	KeyInputWait_();
	CloseMsgWnd_();
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		コアシナリオのスライムA  会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkCoreSlimeA()
{
	if(main_num == GetFlagID_("CONST_SM_CORE")){								// Num0 = 7
		if(core_num <= GetFlagID_("CONST_SS_CO_TALK_ANSESU_4")){				// Num8 = 5 以下
			OpenMsgWnd_();
			ShowMsg_("NPC_CORE_SLIME_A_010");
			KeyInputWait_();
			CloseMsgWnd_();
		}
		if(core_num == GetFlagID_("CONST_SS_CO_CHECK_UP_ANSESU")){				// Num8 = 6
			OpenMsgWnd_();
			ShowMsg_("NPC_CORE_SLIME_A_020");
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		コアシナリオのスライムB  会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkCoreSlimeB()
{
	OpenMsgWnd_();
	ShowMsg_("NPC_CORE_SLIME_B_010");
	KeyInputWait_();
	CloseMsgWnd_();
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		庭に落ちているリアクターを調べた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineReactorGet()
{
	local player = GetPlayerId_();
	// 洞くつ(H02_00)で復帰した際の座標と向き
	local rtn_demo_pos = Vec3(-105.17, 0.0, -24.299);
	local rtn_demo_dir = 0;
	// 非常駐モーション読込
	local hirou_kaishi = ReadMotion_(player, "Player_hirou_kaishi"); // リアクターを拾い始め
	local hirou_owari  = ReadMotion_(player, "Player_hirou_owari");  // リアクターを拾い終わり

	// Demo005[モンスター選択用の質問]の再生後
	if(main_num == GetFlagID_("CONST_SM_OPENING")){
		if(op_num == GetFlagID_("CONST_SS_OP_SELECT_MONSTER")){
		// 主人公をリアクターに向け拾う
			CommPlayerTurnAroundObj(g_reactor);
			SetMotion_(player, hirou_kaishi, BLEND_M);
			Wait_(15);
		// リアクターを拾うかどうかの選択肢メッセージ
			OpenMsgWnd_();
			ShowMsg_("DEMO_005_AFT_SYS_001");			//見たことのない 機械が落ちている。
			KeyInputWait_();
			CloseMsgWnd_();
		// リアクターを拾わない
			if(GetQueryResult_() == MES_QUERY_NO){
				SetMotion_(player, hirou_owari, BLEND_M);
				Wait_(20);
				SetMotion_(player, MOT_WAIT, BLEND_M);
				OpenMsgWnd_();
				ShowMsg_("DEMO_005_AFT_SYS_002");		//機械を 地面にもどした。
				KeyInputWait_();
				CloseMsgWnd_();
			}
		// リアクターを拾う
			else{
				// フェードアウト
				SetFade_(FADE_OUT, FADE_COLOR_BLACK, 15);
				SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, 15);
				WaitFade_();
				
				// デモに移行する前に必ず待機に戻す
				SetMotion_(player, MOT_WAIT, BLEND_N);
				
				// 所持品にアイテムを追加(リアクター)
				AddItem_(63, 1);
				
				// Demo048[レナーテ登場①]とDemo049[レナーテ登場②]を連続再生するため
				// シナリオのサブフラグを進めない（要注意）
				//SetNumFlg_("NUM_SCENARIO_SUB_OP", GetFlagID_("CONST_SS_OP_APPEAR_RENATE"));
				
				// イベント地雷を削除
				DeleteEventMine_(g_mine_reactor);
				
				// 主人公がリアクターをつけた状態にする
				SetEventFlg_("BFG_PUT_OUT_REACTOR", false);
				// リアクター装備したかどうか
				SetEventFlg_("BFG_EQUIP_REACTOR", true);
				
				// 洞くつ(楽園)へ飛ぶ
				SetReturnDemoMap_("H02_00");
				SetReturnDemoPosDir_(rtn_demo_pos, rtn_demo_dir);
				
				// Demo048[レナーテ登場①]が再生される
				ChangeDemo_(48);
			}
		}
	}
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		アンセスに近づいた時にデモを再生する地雷
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineAnsesu()
{
	// イベント地雷を削除
	DeleteEventMine_(g_mine_ansesu);
	SetNumFlg_(core_num_sub, GetFlagID_("CONST_SS_CO_CHECK_UP_ANSESU"));	// Num8 = 6
	// フェードアウト
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
	SetPlayerBoy(false);													// 少年（主人公）状態
	// Demo606[兄・アンセス]が再生される
	SetReturnDemoPosDir_(Vec3(-1041.296, 4.94, 206.251), -11);
	ChangeDemo_(606);
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		アンセス  アナライズ処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uReactorPointAnsesu02()
{
	if(main_num == GetFlagID_("CONST_SM_CORE")){									// Num0 = 7
		if(core_num == GetFlagID_("CONST_SS_CO_CHECK_UP_ANSESU")){					// Num8 = 6
			SetActive_(g_reactor_ansesu_02, false);		//リアクターポイントを表示させない
			//リアクターを強制的に終了させる
			SetFade_(FADE_OUT, FADE_COLOR_BLACK, 15);
			SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, 15);
			WaitFade_();
			ReactorPowerOff_();
			//デモ再生後のマップを指定
			SetReturnDemoMap_("C00_03");
			SetReturnDemoPosDir_(Vec3(-4.5, 188.8, -688.1), 0);
			// Demo607[いつわりの兄の正体：楽園Map]
			ChangeDemo_(607);
		}
	}
}

