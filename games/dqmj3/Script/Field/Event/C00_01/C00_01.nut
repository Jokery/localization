//===================== C00_01コア ２層目（プールエリア） ====================

// グローバル変数定義
main_num	 <- C_NONE_ID;
core_num	 <- C_NONE_ID;

core_num_sub <- "NUM_SCENARIO_SUB_CORE";

//------------------------------------------------
//		戦闘終了後
//------------------------------------------------
function AfterBattle()
{
	// グローバル変数
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");		// Num0
	core_num	 = GetNumFlg_("NUM_SCENARIO_SUB_CORE");	// Num8
	
	//ローカル変数
	local kuragon_battle = GetEventFlg_("BFG_BATTLE_BAD_KRAGON");	// Bit_1308 凶クラーゴンと戦ったかどうか
	local kuragon_win	 = GetEventFlg_("BFG_WIN_BAD_KRAGON");		// Bit_1309 凶クラーゴンに勝ったかどうか
	local player		 = GetPlayerId_();
	
	// 凶クラーゴンとの戦闘判定
	if(kuragon_battle == true){
		// 勝利
		if(GetBattleEndType_() == END_TYPE_WIN){
			// 凶クラーゴンに勝ったフラグを立てる
			SetEventFlg_("BFG_WIN_BAD_KRAGON", true);
		}
		// 敗北
		else{
			// 凶クラーゴンと戦ったフラグを降ろす
			SetEventFlg_("BFG_BATTLE_BAD_KRAGON", false);
			// 戦闘前に設定したプレイヤーの非表示を解除
			SetVisible(player, true);
		}
	}
	
	
	EventEnd_();
}


//------------------------------------------------
//		マップに入る前
//------------------------------------------------
function BeforeInitMap()
{
	// グローバル変数
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");		// Num0
	core_num	 = GetNumFlg_("NUM_SCENARIO_SUB_CORE");	// Num8
	
	
	// コアシナリオより後のシナリオではギミック配置を行わないようにする
	if(main_num > GetFlagID_("CONST_SM_CORE")){
		SetEventFlg_("BFG_WIN_BAD_KRAGON", true);	// 凶クラーゴンに勝った
	}
	
	// 普通にマップに入ってきた時は敵の配置を行う
	SetEventFlg_("BFG_C00_01_IN_UP_LAYER", true);		// コア２層目の上層にいるときtrue,下層にいるときfalseになるフラグ
	SetEventFlg_("BFG_C00_01_IN_DOWN_LAYER", false);	// コア２層目の上層にいるときfalse,下層にいるときtrueになるフラグ
	
	EventEnd_();
}


//------------------------------------------------
//		フェードアウト中
//------------------------------------------------
function FadeIn()
{
	// グローバル変数
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");		// Num0
	core_num	 = GetNumFlg_("NUM_SCENARIO_SUB_CORE");	// Num8
	
	//ローカル変数
	local kuragon_battle = GetEventFlg_("BFG_BATTLE_BAD_KRAGON");	// Bit_1308 凶クラーゴンと戦ったかどうか
	local kuragon_win	 = GetEventFlg_("BFG_WIN_BAD_KRAGON");		// Bit_1309 凶クラーゴンに勝ったかどうか
	local player		 = GetPlayerId_();
	
	DebugPrint(" ");
	DebugPrint("NUM_SCENARIO_MAIN の値は " + main_num + " になりました。");
	DebugPrint("NUM_SCENARIO_SUB_CORE の値は " + core_num + " になりました。");

	// 表シナリオクリア後に出現するモンスターを変化させる(Redmine#1617)
	if(main_num >= GetFlagID_("CONST_SM_INSIDE_CLEAR")
	|| GetEventFlg_("BFG_SCENARIO_CLEAR_ALL") == true){
		SetEventFlg_("BFG_CHANGE_ENCOUNT_MONSTER_BEFORE", false);
		SetEventFlg_("BFG_CHANGE_ENCOUNT_MONSTER_AFTER", true);
	}
	else{
		SetEventFlg_("BFG_CHANGE_ENCOUNT_MONSTER_BEFORE", true);
		SetEventFlg_("BFG_CHANGE_ENCOUNT_MONSTER_AFTER", false);
	}

	//----------
	// ▼NPC配置
	//----------
	// ID初期化
	g_kuragon		 <- C_NONE_ID;
	
	// ■凶クラーゴン
	if(kuragon_win == false){
		g_kuragon = ReadAndArrangePointNpc("m194_01",  "npc_kuragon");	// 凶クラーゴン
		SetScaleSilhouette(g_kuragon, SCALE.M, SILHOUETTE_WIDTH.M);		// サイズの設定
		SetTalkEnable_(g_kuragon, false);								// 会話アイコン非表示
		SetReactorMsg_(g_kuragon, "NPC_KURAGON_ANALYZE_010");
	}
	
	
	//-----------
	// ▼地雷配置
	//-----------
	// ID初期化
	g_mine_kuragon	 	 <- C_NONE_ID;
	g_mine_layer_01_a	 <- C_NONE_ID;
	g_mine_layer_01_b	 <- C_NONE_ID;
	g_mine_layer_02_a	 <- C_NONE_ID;
	g_mine_layer_02_b	 <- C_NONE_ID;
	
	// ■凶クラーゴンとの戦闘用地雷
	if(kuragon_win == false){
		g_mine_kuragon = SetPointBoxEventMine_("mine_kuragon", false);
	}
	
	// ■プレイヤーがどの階層にいるのかを調べる地雷
	g_mine_layer_01_a = SetPointBoxEventMineNoFallWait_("mine_layer_01_a");
	g_mine_layer_01_b = SetPointBoxEventMineNoFallWait_("mine_layer_01_b");
	g_mine_layer_02_a = SetPointBoxEventMineNoFallWait_("mine_layer_02_a");
	g_mine_layer_02_b = SetPointBoxEventMineNoFallWait_("mine_layer_02_b");
	SetMinePlayerStop_(g_mine_layer_01_a, false);
	SetMinePlayerStop_(g_mine_layer_01_b, false);
	SetMinePlayerStop_(g_mine_layer_02_a, false);
	SetMinePlayerStop_(g_mine_layer_02_b, false);
	
	
	
	//---------------
	// ▼ギミック配置
	//---------------
	
	// 配置なし
	
	
	
	//---------------------
	// ▼リアクターポイント
	//---------------------
	// ■コールドスリープ
	local rec_point_trap01 = ArrangeMsgReactorPoint("rec_trap_001", GetFlagID_("BFG_REACTER_POINT_116")// Bit_1615 センサートラップ
		, SHORT_DIST, "REC_POINT_TRAP_010", "REC_POINT_TRAP_020");
	local rec_point_trap02 = ArrangeMsgReactorPoint("rec_trap_002", GetFlagID_("BFG_REACTER_POINT_116")// Bit_1615 センサートラップ
		, SHORT_DIST, "REC_POINT_TRAP_010", "REC_POINT_TRAP_020");
	local rec_point_trap03 = ArrangeMsgReactorPoint("rec_trap_003", GetFlagID_("BFG_REACTER_POINT_116")// Bit_1615 センサートラップ
		, SHORT_DIST, "REC_POINT_TRAP_010", "REC_POINT_TRAP_020");
	local rec_point_trap04 = ArrangeMsgReactorPoint("rec_trap_004", GetFlagID_("BFG_REACTER_POINT_116")// Bit_1615 センサートラップ
		, SHORT_DIST, "REC_POINT_TRAP_010", "REC_POINT_TRAP_020");
	local rec_point_trap05 = ArrangeMsgReactorPoint("rec_trap_005", GetFlagID_("BFG_REACTER_POINT_116")// Bit_1615 センサートラップ
		, SHORT_DIST, "REC_POINT_TRAP_010", "REC_POINT_TRAP_020");
	local rec_point_trap06 = ArrangeMsgReactorPoint("rec_trap_006", GetFlagID_("BFG_REACTER_POINT_116")// Bit_1615 センサートラップ
		, SHORT_DIST, "REC_POINT_TRAP_010", "REC_POINT_TRAP_020");
	local rec_point_trap07 = ArrangeMsgReactorPoint("rec_trap_007", GetFlagID_("BFG_REACTER_POINT_116")// Bit_1615 センサートラップ
		, SHORT_DIST, "REC_POINT_TRAP_010", "REC_POINT_TRAP_020");
	
	
	
	EventEnd_();
}


//------------------------------------------------
//		フィールド操作開始
//------------------------------------------------
function EventStartOperate()
{
	// グローバル変数
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");		// Num0
	core_num	 = GetNumFlg_("NUM_SCENARIO_SUB_CORE");	// Num8
	
	//ローカル変数
	local kuragon_battle = GetEventFlg_("BFG_BATTLE_BAD_KRAGON");	// Bit_1308 凶クラーゴンと戦ったかどうか
	local kuragon_win	 = GetEventFlg_("BFG_WIN_BAD_KRAGON");		// Bit_1309 凶クラーゴンに勝ったかどうか
	local player		 = GetPlayerId_();
	
	//-----------
	// ▼戦闘結果
	//-----------
	// ■凶クラーゴン
	if(kuragon_battle == true){
		// 勝利した場合
		if(kuragon_win == true){
			SetEventFlg_("BFG_RETURN_BATTLE_FIRLD_BGM_HEAD", true);	// フィールドBGMを頭打ち
			SetEventFlg_("BFG_BATTLE_BAD_KRAGON", false);	// 戦ったフラグを降ろす
			CommChangeMomentFadeOut(FADE_COLOR_BLACK)		// 1フレで暗転
			SetVisible(g_kuragon, false);					// NPCを表示させない
			DeleteEventMine_(g_mine_kuragon);				// 地雷削除
			uPlayableReset(534.0, 29.3, 427.2, 55);			// プレイアブルに復帰させる
		}
		// ※負け判定はAfterBattle()内で行っている
	}
	
	
	EventEnd_();
}


//------------------------------------------------
//		ＮＰＣ接触時
//------------------------------------------------
function TouchNpc()
{
	// グローバル変数
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");		// Num0
	core_num	 = GetNumFlg_("NUM_SCENARIO_SUB_CORE");	// Num8
	
	local target = GetTouchEventMineId_();
	
	DebugPrint("ID: " + target + " に接触 [TouchEventMine]");
	
	switch (target) {
//	case  :
//		break;
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
	// グローバル変数
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");		// Num0
	core_num	 = GetNumFlg_("NUM_SCENARIO_SUB_CORE");	// Num8
	
	local target = GetTouchEventMineId_();
	
	DebugPrint("ID: " + target + " に接触 [TouchEventMine]");
	
	switch (target) {
	case g_mine_kuragon :
		uMineKuragonBattle();	// 凶クラーゴンとの戦闘地雷
		break;
	case g_mine_layer_01_a :	// 上層にモンスターを配置する地雷(東側)
	case g_mine_layer_02_a :	// 上層にモンスターを配置する地雷(西側)
		uMineUpperLayer();
		break;
	case g_mine_layer_01_b :	// 下層にモンスターを配置する地雷(東側)
	case g_mine_layer_02_b :	// 下層にモンスターを配置する地雷(西側)
		uMineUnderLayer();
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
//		上層にモンスターを配置する地雷
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineUpperLayer()
{
	// 上層に居いる時に立てるフラグ
	SetEventFlg_("BFG_C00_01_IN_UP_LAYER", true);	// コア２層目の上層にいるときtrue,下層にいるときfalseになるフラグ
	SetEventFlg_("BFG_C00_01_IN_DOWN_LAYER", false);// コア２層目の上層にいるときfalse,下層にいるときtrueになるフラグ
	// 確認用
	local upper_flg = GetEventFlg_("BFG_C00_01_IN_UP_LAYER");
	local under_flg = GetEventFlg_("BFG_C00_01_IN_DOWN_LAYER");
	DebugPrint("上層にいるフラグが " + upper_flg + " になりました。");
	DebugPrint("下層にいるフラグが " + under_flg + " になりました。");
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		下層にモンスターを配置する地雷
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineUnderLayer()
{
	// 下層に居いる時に立てるフラグ
	SetEventFlg_("BFG_C00_01_IN_UP_LAYER", false);	// コア２層目の上層にいるときtrue,下層にいるときfalseになるフラグ
	SetEventFlg_("BFG_C00_01_IN_DOWN_LAYER", true);	// コア２層目の上層にいるときfalse,下層にいるときtrueになるフラグ
	// 確認用
	local upper_flg = GetEventFlg_("BFG_C00_01_IN_UP_LAYER");
	local under_flg = GetEventFlg_("BFG_C00_01_IN_DOWN_LAYER");
	DebugPrint("上層にいるフラグが " + upper_flg + " になりました。");
	DebugPrint("下層にいるフラグが " + under_flg + " になりました。");
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		凶クラーゴンとの戦闘用地雷に触れた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineKuragonBattle()
{
	// グローバル変数
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");		// Num0
	core_num	 = GetNumFlg_("NUM_SCENARIO_SUB_CORE");	// Num8
	
	// ローカル変数
	local player = GetPlayerId_();
	
	
	// 地雷削除
	DeleteEventMine_(g_mine_kuragon);
	
	// クラーゴンと戦ったフラグ
	SetEventFlg_("BFG_BATTLE_BAD_KRAGON", true);
	
	// フェードアウト
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
	Wait_(10);
	
	// 主人公を消す
	SetVisible(player, false);
	
	//カメラを設置
	SetPointCameraEye_("cameye_001");
	SetPointCameraTarget_("camtgt_001");
	Wait_(10);
	
	// フェードイン
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
	Wait_(10);
	
	// 凶クラーゴンのメッセージ
	OpenMsgWnd_();
	ShowMsg_("NPC_KURAGON_010");						//「グギュ…ルルルルルル！！
	KeyInputWait_();
	CloseMsgWnd_();
	
	// 凶クラーゴンのモーション再生
	PlaySE_("SE_FLD_072");
	SetMotion_(g_kuragon, MOT_SPELL_START, BLEND_M);
	Wait_(20);
	SetMotion_(g_kuragon, MOT_SPELL_CHARGE, BLEND_M);
	Wait_(10);
	SetMotion_(g_kuragon, MOT_SPELL_ACTUATE, BLEND_M);
	Wait_(40);
	
	// 凶クラーゴンと戦闘
	ChangeBattleParty_(165);
	
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		プレイヤーを指定の位置に復帰させる
//------------------------------------------------
//	引数	: xpos	X座標
//			: ypos	Y座標
//			: zpos	Z座標
//			: dir	回転値
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uPlayableReset(xpos, ypos, zpos, dir)
{
	local player;
	player = GetPlayerId_();	// プレイヤーID取得
	
	SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
	
	SetVisible(player, true);
	SetPos_(player, Vec3(xpos, ypos, zpos));
	SetDir_(player, dir);
	
	SetPlayableCamera_();
	SetCameraDir_(dir);
	Wait_(10);
	
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);// 下画面をフェードイン
	WaitFade_();
}















