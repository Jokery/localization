//--------------
//	※注意事項※
//--------------
//このマップのセーブ禁止処理は、プログラムで行っています。


//===================== 時空間マップ ====================
// FieldCrackManager.hが原本
// メッセージタグ番号
const MSG_TOUCHMASTER_ASK_BATTLE	= 0;	//バトルするか尋ねる
const MSG_TOUCHMASTER_SEL_YES		= 1;	//YES →バトル開始
const MSG_TOUCHMASTER_SEL_NO		= 2;	//NO
const MSG_TOUCHMASTER_WIN_CMN_01	= 3;	//バトル勝利共通１
const MSG_TOUCHMASTER_WIN_CMN_02	= 4;	//バトル勝利共通２
const MSG_TOUCHMASTER_LOSE_CMN_01	= 5;	//バトル敗北共通１

const MSG_TOUCHDISC_START_BATTLE	= 0;	//バトル開始
const MSG_TOUCHDISC_END_BATTLE		= 1;	//バトル終了

const DARKLORD_RYUOU				= 0;	//竜王
const DARKLORD_SHIDO				= 1;	//シドー
const DARKLORD_ZOMA					= 2;	//ゾーマ
const DARKLORD_DEATHPISARO			= 3;	//デスピサロ
const DARKLORD_MILDLARS				= 4;	//ミルドラース
const DARKLORD_DEATHTAMUA			= 5;	//デスタムーア
const DARKLORD_OLGODEMIRA			= 6;	//オルゴ・デミーラ
const DARKLORD_RAPSONE				= 7;	//ラプソーン
const DARKLORD_ELGIOS				= 8;	//エルギオス

// 変数定義
g_crack_npc		 <- C_NONE_ID;	// 裂け目NPC
g_mine_circle	 <- C_NONE_ID;	// 魔王地雷


//------------------------------------------------
//		戦闘終了後
//------------------------------------------------
function AfterBattle()
{
	// 魔王に敗北した時
	if(GetBattleEndType_() == END_TYPE_LOSE){
		// 全滅したらプレイヤーの非表示を解除
		local player = GetPlayerId_();
		SetVisible(player, true);
	}
	
	EventEnd_();
}

//------------------------------------------------
//		フェードイン
//------------------------------------------------
function FadeIn()
{
	// 変数定義
	local darklord_on, player;
	
	// フラグの状態を取得
	darklord_on	 = IsDarkLordCrackMap_();	// 魔王世界かどうか
	player		 = GetPlayerId_();			// プレイヤーID取得
	//------------------
	// ▼裂け目NPCの設定
	//------------------
	//■魔王の時
	if (darklord_on){
		// ■変数定義
		local crack_npc, crack_scale;
		
		crack_npc	 = GetCrackNPCModelResName_();	// 裂け目の世界NPCのモデルリソース名を取得
		crack_scale	 = GetCrackNPCScale_();			// 裂け目NPCのスケール値（倍率）を取得
		
		DebugPrint("★★魔王処理★★");
		
		// ■NPC配置
		id_crack_npc <- ReadNpc_(crack_npc);
		g_crack_npc <- ArrangePointNpc_(id_crack_npc, "dl000");
		SetScale_(g_crack_npc, crack_scale);
		
		// リアクターメッセージ
		switch (GetCrackNPCDarkLordNo_()) {
		//■竜王
		case DARKLORD_RYUOU:
			SetReactorMsg_(g_crack_npc, "NPC_RYUOU_REC_010");
			break;
		//■シドー
		case DARKLORD_SHIDO:
			SetReactorMsg_(g_crack_npc, "NPC_SHIDO_REC_010");
			break;
		//■ゾーマ
		case DARKLORD_ZOMA:
			SetReactorMsg_(g_crack_npc, "NPC_ZOMA_REC_010");
			break;
		//■デスピサロ
		case DARKLORD_DEATHPISARO:
			SetReactorMsg_(g_crack_npc, "NPC_DEATHPISARO_REC_010");
			break;
		//■ミルドラース
		case DARKLORD_MILDLARS:
			SetReactorMsg_(g_crack_npc, "NPC_MILDLARS_REC_010");
			break;
		//■デスタムーア
		case DARKLORD_DEATHTAMUA:
			SetReactorMsg_(g_crack_npc, "NPC_DEATHTAMUA_REC_010");
			break;
		//■オルゴ・デミーラ
		case DARKLORD_OLGODEMIRA:
			SetReactorMsg_(g_crack_npc, "NPC_OLGODEMIRA_REC_010");
			break;
		//■ラプソーン
		case DARKLORD_RAPSONE:
			SetReactorMsg_(g_crack_npc, "NPC_RAPSONE_REC_010");
			break;
		//■エルギオス
		case DARKLORD_ELGIOS:
			SetReactorMsg_(g_crack_npc, "NPC_ELGIOS_REC_010");
			break;
		default :
			DebugPrint("WARNING : 魔王_IDが不正です [TouchEventMine]");
			break;
		}
		
		// ■魔王用の地雷設定
		// ラプソーンのみ大きい地雷
		if(GetCrackNPCDarkLordNo_() == DARKLORD_RAPSONE){
			g_mine_circle <- SetPointCircleEventMine_("mine_002", false);
		}else{
			g_mine_circle <- SetPointCircleEventMine_("mine_001", false);
		}
	}
	
	//-----------------
	// ▼マップナビ配置
	//-----------------
	local navi_darklord = ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "dl000");	// 魔王
	
	
	EventEnd_();
}

//------------------------------------------------
//		イベントスタート
//------------------------------------------------
function EventStartOperate()
{
	// 変数定義
	local darklord_on, player;
	
	// フラグの状態を取得
	darklord_on		 = IsDarkLordCrackMap_();				// 魔王世界かどうか
	player			 = GetPlayerId_();						// プレイヤーID取得
	
	//-------------
	// ■戦闘結果
	//-------------
	// ネームタグ設定
	if (GetBattleEndType_() != END_TYPE_NONE){			// 戦闘終了タイプ"その他"を取得
		// 魔王個別で処理を行う関数
		uAfterBattleDarklord(END_TYPE_NONE);
		
		// 勝った場合
		if (GetBattleEndType_() == END_TYPE_WIN){		// 戦闘終了タイプ"勝利"を取得
			// 魔王個別で処理を行う関数
			uAfterBattleDarklord(END_TYPE_WIN);
		}
		// 負けた場合
		else if (GetBattleEndType_() == END_TYPE_LOSE){	// 戦闘終了タイプ"敗北"を取得
			// ※敗北処理はAfterBattle()に記述
		}
		
		// 時空の裂け目関連のクリアフラグ
		SetClearFlagCrackMap_( true );
	}
	
	EventEnd_();
}

//------------------------------------------------
//		ＮＰＣ接触時
//------------------------------------------------
function TouchNpc()
{
	
	/*
		処理なし
	*/
	
	EventEnd_();
}
//------------------------------------------------
//		地雷接触時
//------------------------------------------------
function TouchEventMine()
{
	// 変数定義
	local darklord_on, target, player;
	
	// フラグの状態を取得
	darklord_on	 = IsDarkLordCrackMap_();				//魔王世界かどうか
	target		 = GetTouchEventMineId_();
	player		 = GetPlayerId_();

	if(target == g_mine_circle){
		// ネームタグ設定
		SetCrackNPCMessageNameTag_( "NAME_TAG_CRACKLORD_" + ( GetCrackNPCDarkLordNo_() +1 ));
		switch (GetCrackNPCDarkLordNo_()) {
		//■竜王
		case DARKLORD_RYUOU:
			uMineRyuou();
			break;
		//■シドー
		case DARKLORD_SHIDO:
			uMineShido();
			break;
		//■ゾーマ
		case DARKLORD_ZOMA:
			uMineZoma();
			break;
		//■デスピサロ
		case DARKLORD_DEATHPISARO:
			uMineDeathpisaro();
			break;
		//■ミルドラース
		case DARKLORD_MILDLARS:
			uMineMildlars();
			break;
		//■デスタムーア
		case DARKLORD_DEATHTAMUA:
			uMineDeathtamua();
			break;
		//■オルゴ・デミーラ
		case DARKLORD_OLGODEMIRA:
			uMineOlgoDemira();
			break;
		//■ラプソーン
		case DARKLORD_RAPSONE:
			uMineRapsone();
			break;
		//■エルギオス
		case DARKLORD_ELGIOS:
			uMineElgios();
			break;
		default :
			DebugPrint("WARNING : 魔王_IDが不正です [TouchEventMine]");
			break;
		}
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
//		戦闘終了後の処理  魔王の場合
//------------------------------------------------
//	引数	: type	戦闘終了タイプ
//						END_TYPE_NONE	メッセージタグ設定
//						END_TYPE_WIN	勝った時
//						END_TYPE_LOSE	負けた時
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uAfterBattleDarklord(type)
{
	local  battleround, dlordscoutround, task_fellow;
	
	battleround		 = GetBattleRound_();				// バトルのラウンド数取得
	dlordscoutround	 = GetCrackNPCDarkLordScoutRound_();// 魔王スカウト可能ラウンドを取得
	
	// ネームタグ設定
	SetCrackNPCMessageNameTag_( "NAME_TAG_CRACKLORD_" + ( GetCrackNPCDarkLordNo_() +1 ));
	
	if(type == END_TYPE_WIN){
		switch (GetCrackNPCDarkLordNo_()){
		//■竜王
		case DARKLORD_RYUOU:
			uShamDemoAfterBattle();							// 擬似デモの共通処理
			//■規定ターン数以内に勝利
			if(battleround <= dlordscoutround){
				SetExchangeNumber_(battleround);
				uMessageHanyou("dlord_ryuou_battlewin_000");
				uNakamaKyoutsu("dlord_ryuou_win_001", 2701);
			//■規定ターン数以上かかった
			} else {
				SetExchangeNumber_(battleround);
				uMessageHanyou("dlord_ryuou_win_002");
			}
			break;
		//■シドー
		case DARKLORD_SHIDO:
			uShamDemoAfterBattle();							// 擬似デモの共通処理
			//■規定ターン数以内に勝利
			if(battleround <= dlordscoutround){
				SetExchangeNumber_(battleround);
				uMessageHanyou("dlord_shido_win_000");
				uNakamaKyoutsu("dlord_shido_win_001", 2702);
			//■規定ターン数以上かかった
			} else {
				SetExchangeNumber_(battleround);
				uMessageHanyou("dlord_shido_win_002");
			}
			break;
		//■ゾーマ
		case DARKLORD_ZOMA:
			uShamDemoAfterBattle();							// 擬似デモの共通処理
			//■規定ターン数以内に勝利
			if(battleround <= dlordscoutround){
				SetExchangeNumber_(battleround);
				uMessageHanyou("dlord_zoma_win_000");
				uNakamaKyoutsu("dlord_zoma_win_001", 2703);
			//■規定ターン数以上かかった
			} else {
				SetExchangeNumber_(battleround);
				uMessageHanyou("dlord_zoma_win_002");
			}
			break;
		//■デスピサロ
		case DARKLORD_DEATHPISARO:
			uShamDemoAfterBattle();							// 擬似デモの共通処理
			//■規定ターン数以内に勝利
			if(battleround <= dlordscoutround){
				SetExchangeNumber_(battleround);
				uMessageHanyou("dlord_deathpisaro_win_000");
				uNakamaKyoutsu("dlord_deathpisaro_win_001", 2704);
			//■規定ターン数以上かかった
			} else {
				SetExchangeNumber_(battleround);
				uMessageHanyou("dlord_deathpisaro_win_002");
			}
			break;
		//■ミルドラース
		case DARKLORD_MILDLARS:
			uShamDemoAfterBattle();							// 擬似デモの共通処理
			//■規定ターン数以内に勝利
			if(battleround <= dlordscoutround){
				SetExchangeNumber_(battleround);
				uMessageHanyou("dlord_mildlars_win_000");
				uNakamaKyoutsu("dlord_mildlars_win_001", 2705);
			//■規定ターン数以上かかった
			} else {
				SetExchangeNumber_(battleround);
				uMessageHanyou("dlord_mildlars_win_002");
			}
			break;
		//■デスタムーア
		case DARKLORD_DEATHTAMUA:
			uShamDemoAfterBattle();							// 擬似デモの共通処理
			//■規定ターン数以内に勝利
			if(battleround <= dlordscoutround){
				SetExchangeNumber_(battleround);
				uMessageHanyou("dlord_deathtamua_win_000");
				uNakamaKyoutsu("dlord_deathtamua_win_001", 2706);
			//■規定ターン数以上かかった
			} else {
				SetExchangeNumber_(battleround);
				uMessageHanyou("dlord_deathtamua_win_002");
			}
			break;
		//■オルゴ・デミーラ
		case DARKLORD_OLGODEMIRA:
			uShamDemoAfterBattle();							// 擬似デモの共通処理
			//■規定ターン数以内に勝利
			if(battleround <= dlordscoutround){
				SetExchangeNumber_(battleround);
				uMessageHanyou("dlord_olgodemira_win_000");
				uNakamaKyoutsu("dlord_olgodemira_win_001", 2707);
			//■規定ターン数以上かかった
			} else {
				SetExchangeNumber_(battleround);
				uMessageHanyou("dlord_olgodemira_win_002");
			}
			break;
		//■ラプソーン
		case DARKLORD_RAPSONE:
			uShamDemoAfterBattle();							// 擬似デモの共通処理
			//■規定ターン数以内に勝利
			if(battleround <= dlordscoutround){
				SetExchangeNumber_(battleround);
				uMessageHanyou("dlord_rapsone_win_000");
				uNakamaKyoutsu("dlord_rapsone_win_001", 2708);
			//■規定ターン数以上かかった
			} else {
				SetExchangeNumber_(battleround);
				uMessageHanyou("dlord_rapsone_win_002");
			}
			break;
		//■エルギオス
		case DARKLORD_ELGIOS:
			uShamDemoAfterBattle();							// 擬似デモの共通処理
			//■規定ターン数以内に勝利
			if(battleround <= dlordscoutround){
				SetExchangeNumber_(battleround);
				uMessageHanyou("dlord_elgios_win_000");
				uNakamaKyoutsu("dlord_elgios_win_001", 2709);
			//■規定ターン数以上かかった
			} else {
				SetExchangeNumber_(battleround);
				uMessageHanyou("dlord_elgios_win_002");
			}
			break;
		default :
			DebugPrint("WARNING : 魔王_IDが不正です [uAfterBattleDarklord]");
			break;
		}
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		竜王  地雷会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineRyuou()
{
	uShamDemoBeforeBattle();							// 擬似デモの共通処理
	uMessageHanyou("dlord_ryuou_beforebattle_000");
	
	if(GetQueryResult_() == MES_QUERY_YES){
		DeleteEventMine_(g_mine_circle);
		uMessageHanyou("dlord_ryuou_beforebattle_001");
		
		// バトル開始
		SetEventFlg_("BFG_DEAD_KEEP_MAP", false);
		ChangeBattleParty_( GetCrackNPCPartyID_() );
	}else{
		uMessageHanyou("dlord_ryuou_beforebattle_002");
		uPlayableReset();
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		シドー  地雷会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineShido()
{
	uShamDemoBeforeBattle();							// 擬似デモの共通処理
	uMessageHanyou("dlord_shido_beforebattle_000");	
	// システムメッセージ
	OpenMsgWnd_();
	ShowMsg_("dlord_shido_beforebattle_001");			// 破壊神シドーが　おそいかかってきた！
	KeyInputWait_();
	CloseMsgWnd_();
	
	if(GetQueryResult_() == MES_QUERY_YES){
		DeleteEventMine_(g_mine_circle);
		uMessageHanyou("dlord_shido_beforebattle_002");
		
		// バトル開始
		SetEventFlg_("BFG_DEAD_KEEP_MAP", false);
		ChangeBattleParty_( GetCrackNPCPartyID_() );
	}else{
		// システムメッセージ
		OpenMsgWnd_();
		ShowMsg_("dlord_shido_beforebattle_003");		// <name_player/>は　逃げだした。
		KeyInputWait_();
		CloseMsgWnd_();
		uPlayableReset();
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		ゾーマ  地雷会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineZoma()
{
	uShamDemoBeforeBattle();							// 擬似デモの共通処理
	uMessageHanyou("dlord_zoma_beforebattle_000");
	
	if(GetQueryResult_() == MES_QUERY_YES){
		DeleteEventMine_(g_mine_circle);
		uMessageHanyou("dlord_zoma_beforebattle_001");
		
		// バトル開始
		SetEventFlg_("BFG_DEAD_KEEP_MAP", false);
		ChangeBattleParty_( GetCrackNPCPartyID_() );
	}else{
		uMessageHanyou("dlord_zoma_beforebattle_002");
		uPlayableReset();
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		デスピサロ  地雷会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineDeathpisaro()
{
	uShamDemoBeforeBattle();							// 擬似デモの共通処理
	uMessageHanyou("dlord_deathpisaro_beforebattle_000");
	
	if(GetQueryResult_() == MES_QUERY_YES){
		DeleteEventMine_(g_mine_circle);
		uMessageHanyou("dlord_deathpisaro_beforebattle_001");
		
		// バトル開始
		SetEventFlg_("BFG_DEAD_KEEP_MAP", false);
		ChangeBattleParty_( GetCrackNPCPartyID_() );
	}else{
		uMessageHanyou("dlord_deathpisaro_beforebattle_002");
		uPlayableReset();
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		ミルドラース  地雷会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineMildlars()
{
	uShamDemoBeforeBattle();							// 擬似デモの共通処理
	uMessageHanyou("dlord_mildlars_beforebattle_000");
	
	if(GetQueryResult_() == MES_QUERY_YES){
		DeleteEventMine_(g_mine_circle);
		uMessageHanyou("dlord_mildlars_beforebattle_001");
		
		// バトル開始
		SetEventFlg_("BFG_DEAD_KEEP_MAP", false);
		ChangeBattleParty_( GetCrackNPCPartyID_() );
	}else{
		uMessageHanyou("dlord_mildlars_beforebattle_002");
		uPlayableReset();
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		デスタムーア  地雷会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineDeathtamua()
{
	uShamDemoBeforeBattle();							// 擬似デモの共通処理
	uMessageHanyou("dlord_deathtamua_beforebattle_000");
	
	if(GetQueryResult_() == MES_QUERY_YES){
		DeleteEventMine_(g_mine_circle);
		uMessageHanyou("dlord_deathtamua_beforebattle_001");
		
		// バトル開始
		SetEventFlg_("BFG_DEAD_KEEP_MAP", false);
		ChangeBattleParty_( GetCrackNPCPartyID_() );
	}else{
		uMessageHanyou("dlord_deathtamua_beforebattle_002");
		uPlayableReset();
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		オルゴデミーラ  地雷会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineOlgoDemira()
{
	uShamDemoBeforeBattle();							// 擬似デモの共通処理
	uMessageHanyou("dlord_olgodemira_beforebattle_000");
	
	if(GetQueryResult_() == MES_QUERY_YES){
		DeleteEventMine_(g_mine_circle);
		uMessageHanyou("dlord_olgodemira_beforebattle_001");
		
		// バトル開始
		SetEventFlg_("BFG_DEAD_KEEP_MAP", false);
		ChangeBattleParty_( GetCrackNPCPartyID_() );
	}else{
		uMessageHanyou("dlord_olgodemira_beforebattle_002");
		uPlayableReset();
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		ラプソーン  地雷会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineRapsone()
{
	uShamDemoBeforeBattle();							// 擬似デモの共通処理
	uMessageHanyou("dlord_rapsone_beforebattle_000");
	
	if(GetQueryResult_() == MES_QUERY_YES){
		DeleteEventMine_(g_mine_circle);
		uMessageHanyou("dlord_rapsone_beforebattle_001");
		
		// バトル開始
		SetEventFlg_("BFG_DEAD_KEEP_MAP", false);
		ChangeBattleParty_( GetCrackNPCPartyID_() );
	}else{
		uMessageHanyou("dlord_rapsone_beforebattle_002");
		uPlayableReset();
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		エルギオス  地雷会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineElgios()
{
	uShamDemoBeforeBattle();							// 擬似デモの共通処理
	uMessageHanyou("dlord_elgios_beforebattle_000");
	
	if(GetQueryResult_() == MES_QUERY_YES){
		DeleteEventMine_(g_mine_circle);
		uMessageHanyou("dlord_elgios_beforebattle_001");
		
		// バトル開始
		SetEventFlg_("BFG_DEAD_KEEP_MAP", false);
		ChangeBattleParty_( GetCrackNPCPartyID_() );
	}else{
		uMessageHanyou("dlord_elgios_beforebattle_002");
		uPlayableReset();
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		ネルゲル  地雷会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineNelgel()
{
	uMessageHanyou("dlord_nelgel_beforebattle_000");
	
	if(GetQueryResult_() == MES_QUERY_YES){
		DeleteEventMine_(g_mine_circle);
		uMessageHanyou("dlord_nelgel_beforebattle_001");
		
		// バトル開始
		SetEventFlg_("BFG_DEAD_KEEP_MAP", true);
		ChangeBattleParty_( GetCrackNPCPartyID_() );
	}else{
		uMessageHanyou("dlord_nelgel_beforebattle_002");
		uPlayableReset();
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		真・災厄の王  地雷会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineDisasterking()
{
	uMessageHanyou("dlord_disasterking_beforebattle_000");
	
	if(GetQueryResult_() == MES_QUERY_YES){
		DeleteEventMine_(g_mine_circle);
		uMessageHanyou("dlord_disasterking_beforebattle_001");
		
		// バトル開始
		SetEventFlg_("BFG_DEAD_KEEP_MAP", true);
		ChangeBattleParty_( GetCrackNPCPartyID_() );
	}else{
		uMessageHanyou("dlord_disasterking_beforebattle_002");
		uPlayableReset();
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		魔勇者アンルシア  地雷会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineEvilAnrcia()
{
	uMessageHanyou("dlord_evilanrcia_beforebattle_000");
	
	if(GetQueryResult_() == MES_QUERY_YES){
		DeleteEventMine_(g_mine_circle);
		uMessageHanyou("dlord_evilanrcia_beforebattle_001");
		
		// バトル開始
		SetEventFlg_("BFG_DEAD_KEEP_MAP", true);
		ChangeBattleParty_( GetCrackNPCPartyID_() );
	}else{
		uMessageHanyou("dlord_evilanrcia_beforebattle_002");
		uPlayableReset();
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		魔元帥ゼルドラド  地雷会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineEvilZeldorado()
{
	uMessageHanyou("dlord_evilzeldorado_beforebattle_000");
	
	if(GetQueryResult_() == MES_QUERY_YES){
		DeleteEventMine_(g_mine_circle);
		uMessageHanyou("dlord_evilzeldorado_beforebattle_001");
		
		// バトル開始
		SetEventFlg_("BFG_DEAD_KEEP_MAP", true);
		ChangeBattleParty_( GetCrackNPCPartyID_() );
	}else{
		uMessageHanyou("dlord_evilzeldorado_beforebattle_001");
		uPlayableReset();
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		創造神マデサゴーラ  地雷会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineMadesagora()
{
	uMessageHanyou("dlord_madesagora_beforebattle_000");
	
	if(GetQueryResult_() == MES_QUERY_YES){
		DeleteEventMine_(g_mine_circle);
		uMessageHanyou("dlord_madesagora_beforebattle_001");
		
		// バトル開始
		SetEventFlg_("BFG_DEAD_KEEP_MAP", true);
		ChangeBattleParty_( GetCrackNPCPartyID_() );
	}else{
		uMessageHanyou("dlord_madesagora_beforebattle_002");
		uPlayableReset();
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		エスターク  地雷会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineEstark()
{
	uMessageHanyou("dlord_estark_beforebattle_000");
	
	if(GetQueryResult_() == MES_QUERY_YES){
		DeleteEventMine_(g_mine_circle);
		uMessageHanyou("dlord_estark_beforebattle_001");
		
		// バトル開始
		SetEventFlg_("BFG_DEAD_KEEP_MAP", true);
		ChangeBattleParty_( GetCrackNPCPartyID_() );
	}else{
		uMessageHanyou("dlord_estark_beforebattle_002");
		uPlayableReset();
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		ガルマッゾ  地雷会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineGalmazzo()
{
	uMessageHanyou("dlord_galmazzo_beforebattle_000");
	
	if(GetQueryResult_() == MES_QUERY_YES){
		DeleteEventMine_(g_mine_circle);
		uMessageHanyou("dlord_galmazzo_beforebattle_001");
		
		// バトル開始
		SetEventFlg_("BFG_DEAD_KEEP_MAP", true);
		ChangeBattleParty_( GetCrackNPCPartyID_() );
	}else{
		uMessageHanyou("dlord_galmazzo_beforebattle_002");
		uPlayableReset();
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		闘神レオソード  地雷会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineLeosword()
{
	uMessageHanyou("dlord_leosword_beforebattle_000");
	
	if(GetQueryResult_() == MES_QUERY_YES){
		DeleteEventMine_(g_mine_circle);
		uMessageHanyou("dlord_leosword_beforebattle_001");
		
		// バトル開始
		SetEventFlg_("BFG_DEAD_KEEP_MAP", true);
		ChangeBattleParty_( GetCrackNPCPartyID_() );
	}else{
		uMessageHanyou("dlord_leosword_beforebattle_002");
		uPlayableReset();
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		ヒヒュドラード  地雷会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineHihydlard()
{
	uMessageHanyou("dlord_hihydlard_beforebattle_000");
	
	if(GetQueryResult_() == MES_QUERY_YES){
		DeleteEventMine_(g_mine_circle);
		uMessageHanyou("dlord_hihydlard_beforebattle_001");
		
		// バトル開始
		SetEventFlg_("BFG_DEAD_KEEP_MAP", true);
		ChangeBattleParty_( GetCrackNPCPartyID_() );
	}else{
		uMessageHanyou("dlord_hihydlard_beforebattle_002");
		uPlayableReset();
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		聖竜ミラクレア  地雷会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineMilaclare()
{
	uMessageHanyou("dlord_milaclare_beforebattle_000");
	
	if(GetQueryResult_() == MES_QUERY_YES){
		DeleteEventMine_(g_mine_circle);
		uMessageHanyou("dlord_milaclare_beforebattle_001");
		
		// バトル開始
		SetEventFlg_("BFG_DEAD_KEEP_MAP", true);
		ChangeBattleParty_( GetCrackNPCPartyID_() );
	}else{
		uMessageHanyou("dlord_milaclare_beforebattle_002");
		uPlayableReset();
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		名もなき闇の王  地雷会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineUnknownDarklord()
{
		uMessageHanyou("dlord_unknowndarklord_beforebattle_000");
	
	if(GetQueryResult_() == MES_QUERY_YES){
		DeleteEventMine_(g_mine_circle);
		uMessageHanyou("dlord_unknowndarklord_beforebattle_001");
		
		// バトル開始
		SetEventFlg_("BFG_DEAD_KEEP_MAP", true);
		ChangeBattleParty_( GetCrackNPCPartyID_() );
	}else{
		uMessageHanyou("dlord_unknowndarklord_beforebattle_002");
		uPlayableReset();
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		汎用メッセージ関数
//------------------------------------------------
//	引数	: msg	メッセージID
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMessageHanyou(msg)
{
	OpenMsgWnd_();
	SetTalkName_(GetCrackNPCMessageNameTag_());
	ShowMsg_(msg);
	KeyInputWait_();
	CloseMsgWnd_();
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		魔王仲間共通処理
//------------------------------------------------
//	引数	: msg	メッセージID
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uNakamaKyoutsu(msg, party_id)
{
	// メッセージ
	OpenMsgWnd_();
	ShowMsg_(msg);
	// 仲間ME(重要アイテム取得と同じ)
	PlayMe_("ME_010");
	WaitMe_();
	KeyInputWait_();
	CloseMsgWnd_();
	// モンスター加入処理
	local task_fellow = Task_AddFellow_(party_id, false);
	WaitTask(task_fellow);
	// モンスターをフェードアウト
	SetManualCalcAlpha_(g_crack_npc, true);
	local task_fade = Task_ObjectFadeOut_(g_crack_npc, FADE_DEF);
	WaitTask(task_fade);
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		戦闘前の擬似デモ共通処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uShamDemoBeforeBattle()
{
	//フェードアウト
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
	// 主人公を見えなくする
	SetVisible(GetPlayerId_(), false);
	// カメラを設置
	switch (GetCrackNPCDarkLordNo_()){
	//■竜王
	case DARKLORD_RYUOU:
	//■シドー
	case DARKLORD_SHIDO:
		SetPointCameraEye_("cameye_001");
		SetPointCameraTarget_("camtgt_001");
		break;
	//■ゾーマ
	case DARKLORD_ZOMA:
		SetPointCameraEye_("cameye_008");
		SetPointCameraTarget_("camtgt_008");
		break;
	//■デスピサロ
	case DARKLORD_DEATHPISARO:
		SetPointCameraEye_("cameye_002");
		SetPointCameraTarget_("camtgt_002");
		break;
	//■ミルドラース
	case DARKLORD_MILDLARS:
		SetPointCameraEye_("cameye_003");
		SetPointCameraTarget_("camtgt_003");
		break;
	//■デスタムーア
	case DARKLORD_DEATHTAMUA:
		SetPointCameraEye_("cameye_004");
		SetPointCameraTarget_("camtgt_004");
		break;
	//■オルゴ・デミーラ
	case DARKLORD_OLGODEMIRA:
		SetPointCameraEye_("cameye_005");
		SetPointCameraTarget_("camtgt_005");
		break;
	//■ラプソーン
	case DARKLORD_RAPSONE:
		SetPointCameraEye_("cameye_006");
		SetPointCameraTarget_("camtgt_006");
		break;
	//■エルギオス
	case DARKLORD_ELGIOS:
		SetPointCameraEye_("cameye_007");
		SetPointCameraTarget_("camtgt_007");
		break;
	default :
		DebugPrint("WARNING : 魔王_IDが不正です [uAfterBattleDarklord]");
		break;
	}
	//フェードイン
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		戦闘後の擬似デモ共通処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uShamDemoAfterBattle()
{
	local player = GetPlayerId_();
	
	// チラつきをなくすために１フレームで暗転
	CommChangeMomentFadeOut(FADE_COLOR_BLACK);
	
	// カメラを設置
	switch (GetCrackNPCDarkLordNo_()){
	//■竜王
	case DARKLORD_RYUOU:
	//■シドー
	case DARKLORD_SHIDO:
		SetPointCameraEye_("cameye_001");
		SetPointCameraTarget_("camtgt_001");
		break;
	//■ゾーマ
	case DARKLORD_ZOMA:
		SetPointCameraEye_("cameye_008");
		SetPointCameraTarget_("camtgt_008");
		break;
	//■デスピサロ
	case DARKLORD_DEATHPISARO:
		SetPointCameraEye_("cameye_002");
		SetPointCameraTarget_("camtgt_002");
		break;
	//■ミルドラース
	case DARKLORD_MILDLARS:
		SetPointCameraEye_("cameye_003");
		SetPointCameraTarget_("camtgt_003");
		break;
	//■デスタムーア
	case DARKLORD_DEATHTAMUA:
		SetPointCameraEye_("cameye_004");
		SetPointCameraTarget_("camtgt_004");
		break;
	//■オルゴ・デミーラ
	case DARKLORD_OLGODEMIRA:
		SetPointCameraEye_("cameye_005");
		SetPointCameraTarget_("camtgt_005");
		break;
	//■ラプソーン
	case DARKLORD_RAPSONE:
		SetPointCameraEye_("cameye_006");
		SetPointCameraTarget_("camtgt_006");
		break;
	//■エルギオス
	case DARKLORD_ELGIOS:
		SetPointCameraEye_("cameye_007");
		SetPointCameraTarget_("camtgt_007");
		break;
	default :
		DebugPrint("WARNING : 魔王_IDが不正です [uAfterBattleDarklord]");
		break;
	}
	
	Wait_(15);
	
	// 主人公を表示 ただし、カメラには映らないようにする
	SetVisible(player, true);
	SetPos_(player, Vec3(0.0, 0.0, 0.0));
	
	// フェードイン
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		プレイヤーを指定の位置に復帰させる
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uPlayableReset()
{
	local player;
	player		 = GetPlayerId_();					// プレイヤーID取得
	
	// フェードアウト
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
	// プレイヤーを映す
	SetVisible(player, true);
	// カメラを通常状態に戻す
	SetPlayableCamera_();
	SetCameraDir_(110);
	// 主人公を魔王から離れたところに配置
	SetPos_(player, Vec3(-272.0, 10.0, -3.0));
	SetDir_(player, 110);
	Wait_(15);
	// フェードイン
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
}

