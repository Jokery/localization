//===================== S02_02イッタブル監獄 3F ====================

// 変数定義
main_num	 <- C_NONE_ID;					// メインフラグ
prison_num	 <- C_NONE_ID;					// シナリオサブフラグ

str_num_sub	 <- "NUM_SCENARIO_SUB_PRISON";	// シナリオサブフラグの定数名 : Num6

//------------------------------------------------
//		戦闘終了後
//------------------------------------------------
function AfterBattle()
{
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");
	prison_num	 = GetNumFlg_("NUM_SCENARIO_SUB_PRISON");
	
	local battle_result = GetBattleEndType_();
	
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {										// Num0 = 5
		// イッタブル戦 敗北時
		if (prison_num == GetFlagID_("CONST_SS_PR_BATTLE_ITTABURU_START")					// Num6 = 22 or
		 || prison_num == GetFlagID_("CONST_SS_PR_REMATCH_ITTABURU_START")) {				// Num6 = 26
			if(battle_result == END_TYPE_LOSE){
				SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_PR_BATTLE_ITTABURU_LOSE"));	//Num6 = 23
				SetEventFlg_("BFG_LIMIT_1F_ALL", false);	// Bit_1242 監獄１階にモンスターを配置
			}
		}

	}
	
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
	
	// モンスターを出現させる最小距離を設定(※単位は1=10cm)
	SetMonsterGenPlayerInvasionAreaMin_(-1)	// 制限をデフォルト値に戻す
	
	// ■イッタブル撃破まで中央の通路周辺にモンスターを配置しない
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_INVULNERABILITY_PLAYER")) {		// Num6 < 28
			SetEventFlg_("BFG_LIMIT_3F_CENTER_PATHWAY", false);				// Bit_1226 イッタブル撃破（中央の通路周辺にモンスターを配置）
		} else {
			SetEventFlg_("BFG_LIMIT_3F_CENTER_PATHWAY", true);				// Bit_1226 イッタブル撃破（中央の通路周辺にモンスターを配置）
		}
	} else {
		SetEventFlg_("BFG_LIMIT_3F_CENTER_PATHWAY", true);					// Bit_1226 イッタブル撃破（中央の通路周辺にモンスターを配置）
	}
	
	//----------
	// ▼NPC配置
	//----------
	// ID初期化
	g_npc_ittaburu		 <- C_NONE_ID;

	// ■イッタブル
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_BATTLE_ITTABURU_LOSE")			// Num6 = 23
		|| prison_num == GetFlagID_("CONST_SS_PR_PRE_REMACHI_ITTABURU")) {			// Num6 = 24
			local id_ittaburu	 = ReadNpc_("m205_00");		// イッタブル
			g_npc_ittaburu		 = ArrangePointNpc_(id_ittaburu, "npc_ittaburu000");
			SetReactorMsg_(g_npc_ittaburu, "REC_NPC_ITTABURU");
			// 暗黒のオーラを纏わせる
			LoadEffect_("ef730_01_oth_dark_aura01");
			local efc_aura = SetSelectBoneEffectSetOffset_("ef730_01_oth_dark_aura01", g_npc_ittaburu, ATTACH_EFFECT2, Vec3(0.0, -10.0, 0.0));
		}
		else {
			// 設置しない
		}
	}
	
	//-----------
	// ▼地雷配置
	//-----------
	// ID初期化
	g_mine_demo417		 <- C_NONE_ID;
	g_mine_demo419		 <- C_NONE_ID;
	g_mine_door01		 <- C_NONE_ID;
	g_mine_door02		 <- C_NONE_ID;
	g_mine_ruler		 <- C_NONE_ID;
	g_mine_break_monster_event <- C_NONE_ID;
	
	// ■Demo417起動地雷
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_BLAST_STRATEGY")) {				// Num6 = 20
			g_mine_demo417 = SetPointBoxEventMine_("mine_demo417", false);
		}
	}
	
	// ■Demo419起動地雷
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_BATTLE_ITTABURU_LOSE")			// Num6 = 23
		|| prison_num == GetFlagID_("CONST_SS_PR_PRE_REMACHI_ITTABURU")) {			// Num6 = 24
			g_mine_demo419 = SetPointBoxEventMine_("mine_demo419", false);
		}
	}
	
	// ■ロック扉地雷
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_BLAST_STRATEGY")) {				// Num6 < 20
			g_mine_door01 = SetPointCircleEventMine_("mine_door01", true);
			g_mine_door02 = SetPointCircleEventMine_("mine_door02", true);
		}
	}
	
	// ■ルーラポイント(イッタブル監獄 制御室)
	g_mine_ruler = SetPointCircleEventMine_("mine_ruler", true);
	
	// ■凶モンスターイベント用
	g_mine_break_monster_event = SetPointCircleEventMine_("mine_break_monster_event", true);

	//---------------
	// ▼ギミック配置
	//---------------
	// ID初期化
	g_gmk_door01		 <- C_NONE_ID;
	g_gmk_door02		 <- C_NONE_ID;
	g_gmk_rulerpoint	 <- C_NONE_ID;
	
	// リソース読み込み
	local id_rulerpoint		 = ReadGimmick_("o_com_08");	// ルーラポイント

	// ■ロック扉
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_BLAST_STRATEGY")) {				// Num6 < 20
			local id_door	= ReadGimmick_("o_S02_04");				// ロック扉
			g_gmk_door01	= ArrangePointGimmick_("o_S02_04", id_door, "gmk_door01");
			g_gmk_door02	= ArrangePointGimmick_("o_S02_04", id_door, "gmk_door02");
		}
	}

	// ■パイプの蓋（開）
	local id_paipu_open	 = ReadGimmick_("o_S02_22");				// パイプの蓋（開）
	local gmk_paipu_open = ArrangePointGimmick_("o_S02_22", id_paipu_open, "gmk_paipu_open");

	// ■制御装置
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_INVULNERABILITY_PLAYER")) {		// Num6 < 28
			local id_souti	 = ReadGimmick_("o_S02_09");
			local gmk_souti	 = ArrangePointGimmick_("o_S02_09", id_souti, "gmk_souti");
		} else {
			// ■制御装置（壊れ）
			local id_souti_brake	 = ReadGimmick_("o_S02_12");
			local gmk_souti_brake	 = ArrangePointGimmick_("o_S02_12", id_souti_brake, "gmk_souti_brake");
		}
	} else {
		// ■制御装置（壊れ）
		local id_souti_brake	 = ReadGimmick_("o_S02_12");
		local gmk_souti_brake	 = ArrangePointGimmick_("o_S02_12", id_souti_brake, "gmk_souti_brake");
	}


	// ■ルーラポイント(イッタブル監獄 制御室)※仮の位置に置いています
	g_gmk_rulerpoint = ArrangePointGimmick_("o_com_08", id_rulerpoint, "g_rulerpoint");
	SetMotion_(g_gmk_rulerpoint, MOT_GIMMICK_0, BLEND_N);
	if(GetEventFlg_("BFG_RULER_ADD_019") == true){				// Bit_219 ルーラ追加 イッタブル監獄 制御室
		SetMotion_(g_gmk_rulerpoint, MOT_GIMMICK_2, BLEND_N);
	}

	//-------------------------
	// ▼リアクターポイント配置
	//-------------------------
	// ■メイン制御装置
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_INVULNERABILITY_PLAYER")) {		// Num6 < 28
			local reactorPoint01 = ArrangeMsgReactorPoint("recpoint_01_monitar", GetFlagID_("BFG_REACTER_POINT_078")// Bit_1577 メイン制御装置
				, SHORT_DIST, "REC_POINT_01", "REC_POINT_01_2");
		}
	}
	
	// ■ルーラポイント(イッタブル監獄 制御室)
	local reactorPoint02 = ArrangeMsgReactorPoint("reactorPoint_ruler", GetFlagID_("BFG_REACTER_POINT_010")// Bit_1520 ルーラポイント
		, SHORT_DIST, "REC_POINT_02", "REC_POINT_02_2");
	
	//-----------------
	// ▼マップナビ配置
	//-----------------
	// ■ルーラポイントアイコン
	if(GetEventFlg_("BFG_RULER_ADD_019") == true){				// Bit_219 ルーラ追加 イッタブル監獄 制御室
		local icon01 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.RULER_POINT , "g_rulerpoint");
		SetNaviMapIconVisible_(icon01, true);
	}
	
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
	
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {									// Num0 = 5
		// ■５階の広間を目指している時のリアクターメッセージ
		if (prison_num == GetFlagID_("CONST_SS_PR_MEETING_02")) {						// Num6 = 13
			local bit_rec_msg = GetEventFlg_("BFG_DISPLAYED_LEADING_5F_MSG_3F");	// Bit_1234 リアクターの誘導MSGを再生した
			if (!bit_rec_msg){
				SetEventFlg_("BFG_DISPLAYED_LEADING_5F_MSG_3F", true);				// Bit_1234 リアクターの誘導MSGを再生した
				
				// 階段を登りきるまで待つ
				Wait_(25);
				SetMotion_(player, MOT_WAIT, BLEND_XL);
				Wait_(BLEND_XL);
				
				// リアクター反応付きメッセージ
				CommReactorActionNotice();			// リアクター反応があった時の共通処理
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_REACTOR");	// リアクター
				ShowMsg_("REACTER_MSG_000");		// 「５階に モンスター反応の少ない 広間を発見。
				KeyInputWait_();
				CloseMsgWnd_();
				CommResetPlayerMotion();			// モーションを待機状態に戻す共通処理
			}
		}
		// ■イッタブル 戦闘開始
		if (prison_num == GetFlagID_("CONST_SS_PR_ITTABURU_INTERFERENCE")) {			// Num6 = 21
			SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_PR_BATTLE_ITTABURU_START"));	// Num6 <- 22
			
			// VS.イッタブル
			ChangeBattleParty_(17);
		}
		else if (prison_num == GetFlagID_("CONST_SS_PR_REMACHI_ITTABURU")) {			// Num6 = 25
			SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_PR_REMATCH_ITTABURU_START"));	// Num6 <- 26
			
			// VS.イッタブル
			ChangeBattleParty_(17);
		}
		
		// ■イッタブル 戦闘結果
		if (prison_num == GetFlagID_("CONST_SS_PR_BATTLE_ITTABURU_START")				// Num6 = 22 or
		 || prison_num == GetFlagID_("CONST_SS_PR_REMATCH_ITTABURU_START")) {			// Num6 = 26
			SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_PR_ITTABURU_WIN"));			// Num6 <- 27
			SetEventFlg_("BFG_LIMIT_1F_ALL", true);	// Bit_1242 監獄１階にモンスターを配置
			// デモ再生後の復帰位置
			SetReturnDemoMap_("S01_00");
			SetReturnDemoPosDir_(Vec3(-77.0, 0.0, 51.0), 0);
			
			// Demo420[イッタブル戦勝利]再生
			EventStartChangeDemo(420, FADE_COLOR_BLACK);
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
	
	DebugPrint(" ");
	DebugPrint("ID: " + target + " に接触 [TouchNpc]");
	
	switch (target) {
	case g_npc_ittaburu :
		// 会話なし
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
	
	DebugPrint(" ");
	DebugPrint("ID: " + target + " に接触 [TouchEventMine]");
	
	switch (target) {
	case g_mine_demo417 :
		uMineDemo417Start();
		break;
	case g_mine_demo419 :
		uMineDemo419Start();
		break;
	case g_mine_door01 :
		uMineDoor01();
		break;
	case g_mine_door02 :
		uMineDoor02();
		break;
	case g_mine_ruler :
		uMineRuler();
		break;
	case g_mine_break_monster_event :
		uMineBreakMonsterEvent();
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
//		ルキヤ 会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkRukiya()
{
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_BLAST_EXPLANATION_1ST")) {			// Num6 < 16
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_RUKIYA");	//ルキヤ
			ShowMsg_("NPC_RUKIYA_MSG_100");		// 「４階の右上に 空き部屋がある。
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		Demo417起動地雷に触れた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineDemo417Start()
{
	SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_PR_ITTABURU_INTERFERENCE"));		// Num6 <- 21
	
	// Demo417[イッタブルの妨害]再生
	TouchNpcChangeDemo(417);
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		Demo419起動地雷に触れた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineDemo419Start()
{
	SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_PR_REMACHI_ITTABURU"));		// Num6 <- 25
	
	// Demo419[イッタブル再戦]再生
	StopBgmChangeDemo(419);
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
	ShowMsg_("SYSTEM_MSG_999");		// （仮）扉には ロックがかかっている。
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
	ShowMsg_("SYSTEM_MSG_999");		// （仮）扉には ロックがかかっている。
	KeyInputWait_();
	CloseMsgWnd_();
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		ルーラポイントに触れた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineRuler()
{
	CommPlayerTurnAroundObj(g_gmk_rulerpoint);
	CommRulerPointEvent(g_gmk_rulerpoint, "BFG_RULER_ADD_019", "g_rulerpoint"); 
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		凶モンスターイベント用の地雷
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineBreakMonsterEvent()
{
	CommPlayerTurnAroundDir(180);
	// 監獄３階にある配合装置に凶エスターク復活のアイテムを近づけた後、「はい」を選択したか？
	if(GetEventFlg_("BFG_BLENDING_BREAK_ESTARK_ITEM") == false){
		// 凶モンスター作成条件のチェック
		if(CommCheckBreakEstarkMaking() == true){
			// エースから凶モンスター復活アイテムの説明を聞いたか？
			if(GetEventFlg_("BFG_DISPLAYED_BREAK_ESTARK_MSG") == true){
				// 凶エスタークが復活していないかチェック
				if(GetNumFlg_("NUM_BREAK_ESTARK_PHASE") == 0){		 // Num018 == 0
					OpenMsgWnd_();
					ShowMsg_("BREAK_ESTARK_EVENT_MSG_002_01");
					KeyInputWait_();
					ShowMsg_("BREAK_ESTARK_EVENT_MSG_002_02");
					KeyInputWait_();
					if(GetQueryResult_() == MES_QUERY_YES){
						CloseMsgWnd_();
						// 監獄３階にある配合装置に凶エスターク復活のアイテムを近づけた後、「はい」を選択したか？フラグを立てる
						SetEventFlg_("BFG_BLENDING_BREAK_ESTARK_ITEM", true);
						// 凶モンスターの進行フラグを進める
						SetNumFlg_("NUM_BREAK_ESTARK_PHASE", 1);
						// 凶モンスター復活演出
						uBreakMonsterRevival();
					}
					else{
						CloseMsgWnd_();
					}
				}
				// 復活しているが、仲間にしていない
				else if(GetNumFlg_("NUM_BREAK_ESTARK_PHASE") >= 1
					&&  GetNumFlg_("NUM_BREAK_ESTARK_PHASE") <= 6){ // Num018 が 1 以上 6 以下
					// 地震演出＋メッセージの表示
					uEarthQuakeAndMsg();
				}
				// 復活して、仲間にした。
				else{ 												// Num018 が 0 ～ 6 以外
					OpenMsgWnd_();
					ShowMsg_("BREAK_ESTARK_EVENT_MSG_000");
					KeyInputWait_();
					CloseMsgWnd_();
				}
			}
			else{
				OpenMsgWnd_();
				ShowMsg_("BREAK_ESTARK_EVENT_MSG_001");
				KeyInputWait_();
				CloseMsgWnd_();
			}
		}
		else{
			OpenMsgWnd_();
			ShowMsg_("BREAK_ESTARK_EVENT_MSG_001");
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else{
		// 凶エスタークを仲間にしていない場合
		if(GetNumFlg_("NUM_BREAK_ESTARK_PHASE") >= 1
		&& GetNumFlg_("NUM_BREAK_ESTARK_PHASE") <= 6){ // Num018 が 1 以上 6 以下
			// 地震演出＋メッセージの表示
			uEarthQuakeAndMsg();
		}
		// 凶エスタークは復活していない(通らないはず)
		else if(GetNumFlg_("NUM_BREAK_ESTARK_PHASE") == 0){
			OpenMsgWnd_();
			ShowMsg_("BREAK_ESTARK_EVENT_MSG_000");
			KeyInputWait_();
			CloseMsgWnd_();
		}
		// 凶エスタークを仲間にしている場合
		else{
			OpenMsgWnd_();
			ShowMsg_("BREAK_ESTARK_EVENT_MSG_000");
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		凶モンスター復活演出
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uBreakMonsterRevival()
{
	local fade_spd = 15;
	// 1.暗転(メッセージウィンドウ表示できる暗転にする)
	SetFadePlane_(FADE_PLANE.PLANE_3D);
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, fade_spd);
	SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, fade_spd);
	WaitFade_();
	Wait_(fade_spd);
	// 2.アイテムの減算
	AddItem_(BREAK_ESTARK_01_ID, -1);
	AddItem_(BREAK_ESTARK_02_ID, -1);
	AddItem_(BREAK_ESTARK_03_ID, -1);
	AddItem_(BREAK_ESTARK_04_ID, -1);
	AddItem_(BREAK_ESTARK_05_ID, -1);
	// 3.メッセージ（近づけたアイテムは…
	OpenMsgWnd_();
	ShowMsg_("BREAK_ESTARK_EVENT_MSG_003");
	KeyInputWait_();
	CloseMsgWnd_();
	// 4. 配合マシンの起動音の再生
	PlaySE_("SE_SYS_021");
	Wait_(115);
	// 5.暗転明け
	SetFade_(FADE_IN, FADE_COLOR_BLACK, fade_spd);
	SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, fade_spd);
	WaitFade_();
	SetFadePlane_(FADE_PLANE.PLANE_NORMAL);
	Wait_(fade_spd);
	// 地震演出＋メッセージの表示
	uEarthQuakeAndMsg();
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		地震演出＋メッセージの表示
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uEarthQuakeAndMsg()
{
	local earth_quake_frame = 20;
	local earth_quake_wait  = 25;
	// 6.地震発生処理
	PlaySE_("SE_DEM_014");
	StartDecayEarthQuake_(earth_quake_frame, 3, 5);
	Wait_(earth_quake_wait);
	// 7.メッセージ（屋上のほうで…
	OpenMsgWnd_();
	ShowMsg_("BREAK_ESTARK_EVENT_MSG_004");
	KeyInputWait_();
	CloseMsgWnd_();
}

