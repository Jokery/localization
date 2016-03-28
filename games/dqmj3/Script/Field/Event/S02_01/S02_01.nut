//===================== S02_01イッタブル監獄 2F ====================

// 変数定義
main_num	 <- C_NONE_ID;
prison_num	 <- C_NONE_ID;

str_num_sub <- "NUM_SCENARIO_SUB_PRISON";

//------------------------------------------------
//		戦闘終了後
//------------------------------------------------
function AfterBattle()
{
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");
	prison_num	 = GetNumFlg_("NUM_SCENARIO_SUB_PRISON");
	
	EventEnd_();
}


//------------------------------------------------
//		マップに入る前
//------------------------------------------------
function BeforeInitMap()
{
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");
	prison_num	 = GetNumFlg_("NUM_SCENARIO_SUB_PRISON");
	
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
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");			// Num0
	prison_num	 = GetNumFlg_("NUM_SCENARIO_SUB_PRISON");	// Num6
	
	DebugPrint(" ");
	DebugPrint("NUM_SCENARIO_MAIN の値は " + main_num + " になりました。");
	DebugPrint("NUM_SCENARIO_SUB_PRISON の値は " + prison_num + " になりました。");
	
	// 監獄にあるポッドの地雷に触れるとモンスター配置を行うフラグを全て初期化
	SetEventFlg_("BFG_SET_MONSTER_TOUCH_POD_01", false);
	SetEventFlg_("BFG_SET_MONSTER_TOUCH_POD_02", false);
	SetEventFlg_("BFG_SET_MONSTER_TOUCH_POD_03", false);
	SetEventFlg_("BFG_SET_MONSTER_TOUCH_POD_04", false);
	SetEventFlg_("BFG_SET_MONSTER_TOUCH_POD_05", false);
	SetEventFlg_("BFG_SET_MONSTER_TOUCH_POD_06", false);
	SetEventFlg_("BFG_SET_MONSTER_TOUCH_POD_07", false);
	SetEventFlg_("BFG_SET_MONSTER_TOUCH_POD_08", false);
	SetEventFlg_("BFG_SET_MONSTER_TOUCH_POD_09", false);
	SetEventFlg_("BFG_SET_MONSTER_TOUCH_POD_10", false);
	SetEventFlg_("BFG_SET_MONSTER_TOUCH_POD_11", false);
	SetEventFlg_("BFG_SET_MONSTER_TOUCH_POD_12", false);
	SetEventFlg_("BFG_SET_MONSTER_TOUCH_POD_13", false);
	SetEventFlg_("BFG_SET_MONSTER_TOUCH_POD_14", false);
	
	//----------
	// ▼NPC配置
	//----------
	// ID初期化
	g_npc_gaikotu		 <- C_NONE_ID;
	g_npc_brake_toge	 <- C_NONE_ID;
	
	// ■ がいこつ
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_DEVIL_REMODELING")) {				// Num6 = 11
			local id_gaikotu	 = ReadNpc_("m101_00");		// がいこつ
			g_npc_gaikotu		 = ArrangePointNpc_(id_gaikotu, "npc_samayou02");
			SetScaleSilhouette(g_npc_gaikotu, SCALE.N ,SILHOUETTE_WIDTH.N);
			SetReactorMsg_(g_npc_gaikotu, "REC_NPC_GAIKOTU");
		}
	}

	// ■ ブレイク化したとげジョボー
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_DEVIL_REMODELING")) {				// Num6 = 11
			local id_brake_toge	 = ReadNpc_("m195_00");
			g_npc_brake_toge	 = ArrangePointNpc_(id_brake_toge, "npc_brake");
			SetTalkTurn_(g_npc_brake_toge, false);	// 話しかけても振り向かない
			local m_break = ReadMotion_(g_npc_brake_toge, "m195_00_after_break");
			SetMotion_(g_npc_brake_toge, m_break, BLEND_N);
			SetScaleSilhouette(g_npc_brake_toge, SCALE.M ,SILHOUETTE_WIDTH.M);
			SetReactorMsg_(g_npc_brake_toge, "REC_NPC_PRIZONER");
		}
	}


	//-----------
	// ▼地雷配置
	//-----------
	// ID初期化
	g_mine_demo410		 <- C_NONE_ID;
	g_mine_stop			 <- C_NONE_ID;
	g_mine_bgm007		 <- C_NONE_ID;
	g_mine_door01		 <- C_NONE_ID;
	g_mine_door02		 <- C_NONE_ID;
	g_mine_exit			 <- C_NONE_ID;
	g_mine_pot01		 <- C_NONE_ID;
	g_mine_pot02		 <- C_NONE_ID;
	g_mine_pot03		 <- C_NONE_ID;
	g_mine_pot04		 <- C_NONE_ID;
	g_mine_pot05		 <- C_NONE_ID;
	g_mine_pot06		 <- C_NONE_ID;
	g_mine_pot07		 <- C_NONE_ID;
	g_mine_pot08		 <- C_NONE_ID;
	g_mine_pot09		 <- C_NONE_ID;
	g_mine_pot10		 <- C_NONE_ID;
	g_mine_pot11		 <- C_NONE_ID;
	g_mine_pot12		 <- C_NONE_ID;
	g_mine_pot13		 <- C_NONE_ID;
	g_mine_pot14		 <- C_NONE_ID;
	
	// ■Demo410起動地雷
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_RUKIYA_NUKEGARA")) {				// Num6 = 10
			g_mine_demo410 = SetPointBoxEventMine_("mine_demo410", false);
		}
	}

	// ■進入禁止地雷
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_DEVIL_REMODELING")) {				// Num6 = 11
			g_mine_stop = SetPointBoxEventMine_("mine_stop", false);
		}
	}

	// ■１階からのイッタブルの声地雷
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_MEETING_02")) {					// Num6 = 13
			local bit_rec_msg = GetEventFlg_("BFG_DISPLAYED_LEADING_5F_MSG_3F");	// Bit_1234 リアクターの誘導MSGを再生した
			local bit_in_park = GetEventFlg_("BFG_PLAYED_DEMO431_AFTER_PARK");		// Bit_1232 デモ431再生後、アロイパークに入った
			if (!bit_rec_msg && !bit_in_park){
				g_mine_exit = SetPointBoxEventMine_("mine_exit", false);
			}
		}
	}
	
	// ■BGM_007 設定地雷
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_MEETING_02")) {					// Num6 = 13
			g_mine_bgm007 = SetPointBoxEventMineNoFallWait_("mine_bgm007");
			SetMinePlayerStop_(g_mine_bgm007, false);	// 地雷に触れてもモーションを止めない
		}
	}
	
	// ■ロック扉地雷
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_BLAST_STRATEGY")) {				// Num6 < 20
			g_mine_door01 = SetPointCircleEventMine_("mine_door01", true);
			g_mine_door02 = SetPointCircleEventMine_("mine_door02", true);
		}
	}
	
	// ■改造ポット起動地雷
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_MEETING_02")) {					// Num6 < 13
			// 配置しない
		} else {
			g_mine_pot01 = SetPointBoxEventMineNoFallWait_("mine_pot01");
			g_mine_pot02 = SetPointBoxEventMineNoFallWait_("mine_pot02");
			g_mine_pot03 = SetPointBoxEventMineNoFallWait_("mine_pot03");
			g_mine_pot04 = SetPointBoxEventMineNoFallWait_("mine_pot04");
			g_mine_pot05 = SetPointBoxEventMineNoFallWait_("mine_pot05");
			g_mine_pot06 = SetPointBoxEventMineNoFallWait_("mine_pot06");
			g_mine_pot07 = SetPointBoxEventMineNoFallWait_("mine_pot07");
			g_mine_pot08 = SetPointBoxEventMineNoFallWait_("mine_pot08");
			g_mine_pot09 = SetPointBoxEventMineNoFallWait_("mine_pot09");
			g_mine_pot10 = SetPointBoxEventMineNoFallWait_("mine_pot10");
			g_mine_pot11 = SetPointBoxEventMineNoFallWait_("mine_pot11");
			g_mine_pot12 = SetPointBoxEventMineNoFallWait_("mine_pot12");
			g_mine_pot13 = SetPointBoxEventMineNoFallWait_("mine_pot13");
			g_mine_pot14 = SetPointBoxEventMineNoFallWait_("mine_pot14");
		}
	} else {
		g_mine_pot01 = SetPointBoxEventMineNoFallWait_("mine_pot01");
		g_mine_pot02 = SetPointBoxEventMineNoFallWait_("mine_pot02");
		g_mine_pot03 = SetPointBoxEventMineNoFallWait_("mine_pot03");
		g_mine_pot04 = SetPointBoxEventMineNoFallWait_("mine_pot04");
		g_mine_pot05 = SetPointBoxEventMineNoFallWait_("mine_pot05");
		g_mine_pot06 = SetPointBoxEventMineNoFallWait_("mine_pot06");
		g_mine_pot07 = SetPointBoxEventMineNoFallWait_("mine_pot07");
		g_mine_pot08 = SetPointBoxEventMineNoFallWait_("mine_pot08");
		g_mine_pot09 = SetPointBoxEventMineNoFallWait_("mine_pot09");
		g_mine_pot10 = SetPointBoxEventMineNoFallWait_("mine_pot10");
		g_mine_pot11 = SetPointBoxEventMineNoFallWait_("mine_pot11");
		g_mine_pot12 = SetPointBoxEventMineNoFallWait_("mine_pot12");
		g_mine_pot13 = SetPointBoxEventMineNoFallWait_("mine_pot13");
		g_mine_pot14 = SetPointBoxEventMineNoFallWait_("mine_pot14");
	}
	//---------------
	// ▼ギミック配置
	//---------------
	// ID初期化
	g_gmk_door01	 <- C_NONE_ID;
	g_gmk_door02	 <- C_NONE_ID;
	g_gmk_pot01		 <- C_NONE_ID;
	g_gmk_pot02		 <- C_NONE_ID;
	g_gmk_pot03		 <- C_NONE_ID;
	g_gmk_pot04		 <- C_NONE_ID;
	g_gmk_pot05		 <- C_NONE_ID;
	g_gmk_pot06		 <- C_NONE_ID;
	g_gmk_pot07		 <- C_NONE_ID;
	g_gmk_pot08		 <- C_NONE_ID;
	g_gmk_pot09		 <- C_NONE_ID;
	g_gmk_pot10		 <- C_NONE_ID;
	g_gmk_pot11		 <- C_NONE_ID;
	g_gmk_pot12		 <- C_NONE_ID;
	g_gmk_pot13		 <- C_NONE_ID;
	g_gmk_pot14		 <- C_NONE_ID;

	// リソース読み込み
	local id_pot 	= ReadGimmick_("o_S02_03");		// 改造ポッドの蓋

	// ■ロック扉
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_BLAST_STRATEGY")) {				// Num6 < 20
			local id_door	 = ReadGimmick_("o_S02_04");		// ロック扉
			g_gmk_door01	 = ArrangePointGimmick_("o_S02_04", id_door, "gmk_door01");
			g_gmk_door02	 = ArrangePointGimmick_("o_S02_04", id_door, "gmk_door02");
		}
	}

	// ■改造ポッドの蓋
	g_gmk_pot01 = ArrangePointGimmick_("o_S02_03", id_pot, "gmk_pot01");
	SetMotion_(g_gmk_pot01, MOT_GIMMICK_1, BLEND_N);

	g_gmk_pot02 = ArrangePointGimmick_("o_S02_03", id_pot, "gmk_pot02");
	SetMotion_(g_gmk_pot02, MOT_GIMMICK_1, BLEND_N);

	g_gmk_pot03 = ArrangePointGimmick_("o_S02_03", id_pot, "gmk_pot03");
	SetMotion_(g_gmk_pot03, MOT_GIMMICK_1, BLEND_N);

	g_gmk_pot04 = ArrangePointGimmick_("o_S02_03", id_pot, "gmk_pot04");
	SetMotion_(g_gmk_pot04, MOT_GIMMICK_1, BLEND_N);

	g_gmk_pot05 = ArrangePointGimmick_("o_S02_03", id_pot, "gmk_pot05");
	SetMotion_(g_gmk_pot05, MOT_GIMMICK_1, BLEND_N);

	g_gmk_pot06 = ArrangePointGimmick_("o_S02_03", id_pot, "gmk_pot06");
	SetMotion_(g_gmk_pot06, MOT_GIMMICK_1, BLEND_N);

	g_gmk_pot07 = ArrangePointGimmick_("o_S02_03", id_pot, "gmk_pot07");
	SetMotion_(g_gmk_pot07, MOT_GIMMICK_1, BLEND_N);
	
	g_gmk_pot08 = ArrangePointGimmick_("o_S02_03", id_pot, "gmk_pot08");
	SetMotion_(g_gmk_pot08, MOT_GIMMICK_1, BLEND_N);

	g_gmk_pot09 = ArrangePointGimmick_("o_S02_03", id_pot, "gmk_pot09");
	SetMotion_(g_gmk_pot09, MOT_GIMMICK_1, BLEND_N);

	g_gmk_pot10 = ArrangePointGimmick_("o_S02_03", id_pot, "gmk_pot10");
	SetMotion_(g_gmk_pot10, MOT_GIMMICK_1, BLEND_N);

	g_gmk_pot11 = ArrangePointGimmick_("o_S02_03", id_pot, "gmk_pot11");
	SetMotion_(g_gmk_pot11, MOT_GIMMICK_1, BLEND_N);

	g_gmk_pot12 = ArrangePointGimmick_("o_S02_03", id_pot, "gmk_pot12");
	SetMotion_(g_gmk_pot12, MOT_GIMMICK_1, BLEND_N);

	g_gmk_pot13 = ArrangePointGimmick_("o_S02_03", id_pot, "gmk_pot13");
	SetMotion_(g_gmk_pot13, MOT_GIMMICK_1, BLEND_N);

	// ■デモに合わせて開けておく
	g_gmk_pot14 = ArrangePointGimmick_("o_S02_03", id_pot, "gmk_pot14");
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_MEETING_01")) {					// Num6 < 12
			SetMotion_(g_gmk_pot14, MOT_GIMMICK_3, BLEND_N);
		    SetGimmickMapHitEnable_(g_gmk_pot14, false); // gimmick のアタリを無効化
		} else {
			SetMotion_(g_gmk_pot14, MOT_GIMMICK_1, BLEND_N);
		}
	} else {
		SetMotion_(g_gmk_pot14, MOT_GIMMICK_1, BLEND_N);
	}

	//-------------------------
	// ▼リアクターポイント配置
	//-------------------------
	// ■ブレイク製造マシーン
	local reactorPoint01 = ArrangeMsgReactorPoint("recpoint_01_break", GetFlagID_("BFG_REACTER_POINT_076")// Bit_1575 ブレイク製造マシーン
		, SHORT_DIST, "REC_POINT_01", "REC_POINT_01_2");

	// ■マ素の結晶
	local reactorPoint02 = ArrangeMsgReactorPoint("recpoint_02_maso", GetFlagID_("BFG_REACTER_POINT_077")// Bit_1576 マ素の結晶
		, SHORT_DIST, "REC_POINT_02", "REC_POINT_02_2");

	//-------------------------
	// ▼ナビマップアイコン配置
	//-------------------------

	EventEnd_();
}


//------------------------------------------------
//		フィールド操作開始
//------------------------------------------------
function EventStartOperate()
{
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");			// Num0
	prison_num	 = GetNumFlg_("NUM_SCENARIO_SUB_PRISON");	// Num6
	local player = GetPlayerId_();
	
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {							// Num0 = 5
		// ■５階の広間を目指している時のリアクターメッセージ
		if (prison_num == GetFlagID_("CONST_SS_PR_MEETING_02")) {				// Num6 = 13
			local bit_rec_msg = GetEventFlg_("BFG_DISPLAYED_LEADING_5F_MSG");	// Bit_1233 リアクターの誘導MSGを再生した
			if (!bit_rec_msg){
				SetEventFlg_("BFG_DISPLAYED_LEADING_5F_MSG", true);				// Bit_1233 リアクターの誘導MSGを再生した
				
				Wait_(20);							// 暗転明けを待つ
				
				// リアクター反応付きメッセージ
				CommReactorActionNotice();			// リアクター反応があった時の共通処理
				// リアクターメッセージ
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_REACTOR");
				ShowMsg_("REACTER_MSG_000");		// 「強制的に　割り込んでくる　通信があります！
				KeyInputWait_();
				CloseMsgWnd_();
				
				// 謎の通信
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_MYSTERY_COMMUNICATION");
				ShowMsg_("REACTER_MSG_010");		// 「ちょっと　聞こえるかい　○主人公の名前○！
				KeyInputWait_();
				CloseMsgWnd_();
				
				PlaySE_("SE_FLD_232");	// リアクター（OFF)
				Wait_(30);
				
				// リアクターメッセージ
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_REACTOR");
				ShowMsg_("REACTER_MSG_020");		// 「通信が切れました。
				KeyInputWait_();
				CloseMsgWnd_();
				CommResetPlayerMotion();			// モーションを待機状態に戻す共通処理
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
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");			// Num0
	prison_num	 = GetNumFlg_("NUM_SCENARIO_SUB_PRISON");	// Num6
	
	local target = GetTargetId_();
	
	DebugPrint("ID: " + target + " に接触 [TouchNpc]");
	
	switch (target) {
	case g_npc_gaikotu :
		uTalkSamayou();
		break;
	case g_npc_brake_toge :
		uTalkBrake_Toge();
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
	prison_num	 = GetNumFlg_("NUM_SCENARIO_SUB_PRISON");
	
	local target = GetTouchEventMineId_();
	
	DebugPrint("ID: " + target + " に接触 [TouchEventMine]");
	
	switch (target) {
	case g_mine_demo410 :
		uMineDemo410Start();
		break;
	case g_mine_stop :
		uMineStop();
		break;
	case g_mine_bgm007 :
		uMineBgm007();
		break;
	case g_mine_exit :
		uMineExit();
		break;
	case g_mine_door01 :
		uMineDoor01();
		break;
	case g_mine_door02 :
		uMineDoor02();
		break;
	case g_mine_pot01 :
		uMinePot01();
		break;
	case g_mine_pot02 :
		uMinePot02();
		break;
	case g_mine_pot03 :
		uMinePot03();
		break;
	case g_mine_pot04 :
		uMinePot04();
		break;
	case g_mine_pot05 :
		uMinePot05();
		break;
	case g_mine_pot06 :
		uMinePot06();
		break;
	case g_mine_pot07 :
		uMinePot07();
		break;
	case g_mine_pot08 :
		uMinePot08();
		break;
	case g_mine_pot09 :
		uMinePot09();
		break;
	case g_mine_pot10 :
		uMinePot10();
		break;
	case g_mine_pot11 :
		uMinePot11();
		break;
	case g_mine_pot12 :
		uMinePot12();
		break;
	case g_mine_pot13 :
		uMinePot13();
		break;
	case g_mine_pot14 :
		uMinePot14();
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
//		看守（さまようよろい） 会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkSamayou()
{
	OpenMsgWnd_();
	ShowMsg_("SAMAYOUYOROI_MSG_000");	// 「魔物を ブレイク化させる
	KeyInputWait_();
	CloseMsgWnd_();

}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		囚人Ａ（ブレイクとげジョボー） 会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkBrake_Toge()
{
	OpenMsgWnd_();
	ShowMsg_("NPC_PRISONER_A_MSG_000");	// 「ギギ……ギギギ……
	KeyInputWait_();
	CloseMsgWnd_();

}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		Demo410起動地雷に触れた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineDemo410Start()
{
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_RUKIYA_NUKEGARA")) {				// Num6 = 10
			SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_PR_DEVIL_REMODELING"));	// Num6 <- 11
			SetReturnDemoPosDir_(Vec3(-365, -20, 174.9), 221);
			// Demo410[悪魔の改造装置]再生
			TouchNpcChangeDemo(410);
		}
	}
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		進入禁止地雷に触れた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineStop()
{
	local dir = GetDir_(g_npc_gaikotu);
	
	FaceToFaceNpc(g_npc_gaikotu);
	
	OpenMsgWnd_();
	ShowMsg_("SAMAYOUYOROI_MSG_000");	// 「魔物を ブレイク化させる
	KeyInputWait_();
	CloseMsgWnd_();
	
	Task_RotateToDirSetMotion_(g_npc_gaikotu, dir, 5.7, MOT_WALK, MOT_WAIT);
	
	CommPlayerTurnMoveDirWalk(180);
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		BGM_007 設定地雷に触れた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineBgm007()
{
	SetEventFlg_("BFG_S02_01_EVENT_BGM007_PLAY", false);	// Bit_663 S02_01 BGMを元に戻す
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		１階からのイッタブルの声地雷に触れた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineExit()
{
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ITABURU");	// イッタブル
	ShowMsg_("ITTABURU_MSG_000");		// 「敵対行動を取る モンスターの反応あり！
	KeyInputWait_();
	CloseMsgWnd_();
	
	OpenMsgWnd_();
	ShowMsg_("SYSTEM_MSG_000");		// １階に 降りるべきでは ないようだ……。
	KeyInputWait_();
	CloseMsgWnd_();
	
	CommPlayerTurnMoveDirWalk(90);
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		ロック扉地雷①に触れた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineDoor01()
{
	CommPlayerTurnAroundObj(g_gmk_door01);
	OpenMsgWnd_();
	ShowMsg_("SYSTEM_MSG_998");		// （仮）扉には ロックがかかっている。
	KeyInputWait_();
	CloseMsgWnd_();
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		ロック扉地雷②に触れた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineDoor02()
{
	CommPlayerTurnAroundObj(g_gmk_door02);
	OpenMsgWnd_();
	ShowMsg_("SYSTEM_MSG_998");		// （仮）扉には ロックがかかっている。
	KeyInputWait_();
	CloseMsgWnd_();
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		改造ポット地雷①に触れた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMinePot01()
{
	// モンスターを強制配置(別途配置されないビットフラグが必要)
	PlacementMonster_(713);
	// 監獄にあるポッド01の地雷に触れるとモンスター配置を行うフラグをON
	SetEventFlg_("BFG_SET_MONSTER_TOUCH_POD_01", true);
	uTouchPot(g_mine_pot01 , g_gmk_pot01 );
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		改造ポット地雷②に触れた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMinePot02()
{
	// モンスターを強制配置(別途配置されないビットフラグが必要)
	PlacementMonster_(711);
	// 監獄にあるポッド02の地雷に触れるとモンスター配置を行うフラグをON
	SetEventFlg_("BFG_SET_MONSTER_TOUCH_POD_02", true);
	uTouchPot(g_mine_pot02 , g_gmk_pot02 );
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		改造ポット地雷③に触れた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMinePot03()
{
	// モンスターを強制配置(別途配置されないビットフラグが必要)
	PlacementMonster_(709);
	// 監獄にあるポッド03の地雷に触れるとモンスター配置を行うフラグをON
	SetEventFlg_("BFG_SET_MONSTER_TOUCH_POD_03", true);
	uTouchPot(g_mine_pot03 , g_gmk_pot03 );
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		改造ポット地雷④に触れた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMinePot04()
{
	// モンスターを強制配置(別途配置されないビットフラグが必要)
	PlacementMonster_(708);
	// 監獄にあるポッド04の地雷に触れるとモンスター配置を行うフラグをON
	SetEventFlg_("BFG_SET_MONSTER_TOUCH_POD_04", true);
	uTouchPot(g_mine_pot04 , g_gmk_pot04 );
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		改造ポット地雷⑤に触れた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMinePot05()
{
	// モンスターを強制配置(別途配置されないビットフラグが必要)
	PlacementMonster_(710);
	// 監獄にあるポッド05の地雷に触れるとモンスター配置を行うフラグをON
	SetEventFlg_("BFG_SET_MONSTER_TOUCH_POD_05", true);
	uTouchPot(g_mine_pot05 , g_gmk_pot05 );
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		改造ポット地雷⑥に触れた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMinePot06()
{
	// モンスターを強制配置(別途配置されないビットフラグが必要)
	PlacementMonster_(712);
	// 監獄にあるポッド06の地雷に触れるとモンスター配置を行うフラグをON
	SetEventFlg_("BFG_SET_MONSTER_TOUCH_POD_06", true);
	uTouchPot(g_mine_pot06 , g_gmk_pot06 );
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		改造ポット地雷⑦に触れた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMinePot07()
{
	// 監獄にあるポッド07の地雷に触れるとモンスター配置を行うフラグをON
	SetEventFlg_("BFG_SET_MONSTER_TOUCH_POD_07", true);
	uTouchPot(g_mine_pot07 , g_gmk_pot07 );
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		改造ポット地雷⑧に触れた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMinePot08()
{
	// モンスターを強制配置(別途配置されないビットフラグが必要)
	PlacementMonster_(702);
	// 監獄にあるポッド08の地雷に触れるとモンスター配置を行うフラグをON
	SetEventFlg_("BFG_SET_MONSTER_TOUCH_POD_08", true);
	uTouchPot(g_mine_pot08 , g_gmk_pot08 );
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		改造ポット地雷⑨に触れた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMinePot09()
{
	// 監獄にあるポッド09の地雷に触れるとモンスター配置を行うフラグをON
	SetEventFlg_("BFG_SET_MONSTER_TOUCH_POD_09", true);
	uTouchPot(g_mine_pot09 , g_gmk_pot09 );
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		改造ポット地雷⑩に触れた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMinePot10()
{
	// モンスターを強制配置(別途配置されないビットフラグが必要)
	PlacementMonster_(706);
	// 監獄にあるポッド10の地雷に触れるとモンスター配置を行うフラグをON
	SetEventFlg_("BFG_SET_MONSTER_TOUCH_POD_10", true);
	uTouchPot(g_mine_pot10 , g_gmk_pot10 );
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		改造ポット地雷⑪に触れた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMinePot11()
{
	// モンスターを強制配置(別途配置されないビットフラグが必要)
	PlacementMonster_(707);
	// 監獄にあるポッド11の地雷に触れるとモンスター配置を行うフラグをON
	SetEventFlg_("BFG_SET_MONSTER_TOUCH_POD_11", true);
	uTouchPot(g_mine_pot11 , g_gmk_pot11 );
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		改造ポット地雷⑫に触れた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMinePot12()
{
	// モンスターを強制配置(別途配置されないビットフラグが必要)
	PlacementMonster_(705);
	// 監獄にあるポッド12の地雷に触れるとモンスター配置を行うフラグをON
	SetEventFlg_("BFG_SET_MONSTER_TOUCH_POD_12", true);
	uTouchPot(g_mine_pot12 , g_gmk_pot12 );
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		改造ポット地雷⑬に触れた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMinePot13()
{
	// モンスターを強制配置(別途配置されないビットフラグが必要)
	PlacementMonster_(703);
	// 監獄にあるポッド13の地雷に触れるとモンスター配置を行うフラグをON
	SetEventFlg_("BFG_SET_MONSTER_TOUCH_POD_13", true);
	uTouchPot(g_mine_pot13 , g_gmk_pot13 );
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		改造ポット地雷⑭に触れた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMinePot14()
{
	// モンスターを強制配置(別途配置されないビットフラグが必要)
	PlacementMonster_(701);
	// 監獄にあるポッド14の地雷に触れるとモンスター配置を行うフラグをON
	SetEventFlg_("BFG_SET_MONSTER_TOUCH_POD_14", true);
	uTouchPot(g_mine_pot14 , g_gmk_pot14 );
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		改造ポット起動時のモーション
//------------------------------------------------
//	引数	: ポットの地雷
//	引数	: ポットのＩＤ
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTouchPot(mine , id )
{
	DeleteEventMine_(mine);
	PlaySE_("SE_FLD_013");	// 監獄・ブレイクモンスターポッドが開く
    SetMotion_(id, MOT_GIMMICK_2, BLEND_N);
    SetGimmickMapHitEnable_(id, false); // gimmick のアタリを無効化
}

