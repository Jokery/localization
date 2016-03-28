//===================== C00_02コア 第２層 ====================
//定数定義
const EFC_DEF =		 1.0;
const EFC_WALL =	 6.0;


// 変数定義
main_num	 <- C_NONE_ID;
core_num	 <- C_NONE_ID;
outside_num	 <- C_NONE_ID;
crystal_num	 <- C_NONE_ID;

core_num_sub <- "NUM_SCENARIO_SUB_CORE";

//------------------------------------------------
//		戦闘終了後
//------------------------------------------------
function AfterBattle()
{
	// フラグの取得
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");				// Num0
	core_num	 = GetNumFlg_("NUM_SCENARIO_SUB_CORE");			// Num8
	crystal_num	 = GetNumFlg_("NUM_FLG_COUNT_BROKEN_CRYSTAL");	// Num125
	
	local daemon_battle	 = GetEventFlg_("BFG_BATTLE_BAD_ARCDEAMON");	// 凶アークデーモンと戦ったかどうか	//Bit1310
	local daemon_win	 = GetEventFlg_("BFG_WIN_BAD_ARCDEAMON");		// 凶アークデーモンに勝ったフラグ	//Bit1311
	local kessyou_battle = GetEventFlg_("BFG_BATTLE_CRYSTAL_MONSTER");	// 結晶モンスターと戦ったフラグ(Bit1322)
	local kessyou_win	 = GetEventFlg_("BFG_WIN_CRYSTAL_MONSTER");		// 結晶モンスターに勝ったフラグ(Bit1323)
	local player		 = GetPlayerId_();
	
	// 結晶を壊したフラグ
	local crystal_break1 = GetEventFlg_("BFG_BREAK_CRYSTAL_1");	// 結晶1を壊した
	local crystal_break2 = GetEventFlg_("BFG_BREAK_CRYSTAL_2");	// 結晶2を壊した
	local crystal_break3 = GetEventFlg_("BFG_BREAK_CRYSTAL_3");	// 結晶3を壊した
	local crystal_break4 = GetEventFlg_("BFG_BREAK_CRYSTAL_4");	// 結晶4を壊した
	local crystal_break5 = GetEventFlg_("BFG_BREAK_CRYSTAL_5");	// 結晶5を壊した
	local crystal_break6 = GetEventFlg_("BFG_BREAK_CRYSTAL_6");	// 結晶6を壊した
	
	
	// 凶アークデーモンとの戦闘判定
	if(daemon_battle == true){
		// 勝利
		if(GetBattleEndType_() == END_TYPE_WIN){
			// 凶アークデーモンに勝ったフラグを立てる
			SetEventFlg_("BFG_WIN_BAD_ARCDEAMON", true);
		}
		// 敗北
		else{
			// 凶アークデーモンと戦ったフラグを降ろす
			SetEventFlg_("BFG_BATTLE_BAD_ARCDEAMON", false);
			// 戦闘前に設定したプレイヤーの非表示を解除
			SetVisible(player, true);
		}
	}
	
	// 結晶モンスターとの戦闘判定
	if(kessyou_battle == true){
		// 勝利
		if(GetBattleEndType_() == END_TYPE_WIN){
			SetEventFlg_("BFG_WIN_CRYSTAL_MONSTER", true);
			// 結晶を完全に破壊したフラグを立てる
			uSetCrystalCompleteFlg();
		// 敗北
		}else{
			SetNumFlg_("NUM_FLG_COUNT_BROKEN_CRYSTAL", crystal_num = crystal_num - 1);
			SetEventFlg_("BFG_BATTLE_CRYSTAL_MONSTER", false);	// 結晶モンスターと戦ったフラグ(Bit1322)
			SetEventFlg_("BFG_WIN_CRYSTAL_MONSTER", false);		// 結晶モンスターに勝ったフラグ(Bit1323)
		}
	}
	
	
	
	EventEnd_();
}


//------------------------------------------------
//		マップに入る前
//------------------------------------------------
function BeforeInitMap()
{
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");				// Num0
	core_num	 = GetNumFlg_("NUM_SCENARIO_SUB_CORE");			// Num8
	
	
	// コアシナリオより後のシナリオではギミック配置を行わないようにする
	if(main_num > GetFlagID_("CONST_SM_CORE")){
		SetNumFlg_("NUM_FLG_COUNT_BROKEN_CRYSTAL", 6);			// 結界ギミッククリア済み
		SetEventFlg_("BFG_LOOKED_PLAYABLE_DEMO_C00_02", true);	// レナーテの擬似デモを見た後
		SetEventFlg_("BFG_WIN_BAD_ARCDEAMON", true);			// 凶アークデーモンに勝った
		SetEventFlg_("BFG_PERFECT_BREAK_CRYSTAL_1", true);		// 結晶1を完全に破壊した
		SetEventFlg_("BFG_PERFECT_BREAK_CRYSTAL_2", true);		// 結晶2を完全に破壊した
		SetEventFlg_("BFG_PERFECT_BREAK_CRYSTAL_3", true);		// 結晶3を完全に破壊した
		SetEventFlg_("BFG_PERFECT_BREAK_CRYSTAL_4", true);		// 結晶4を完全に破壊した
		SetEventFlg_("BFG_PERFECT_BREAK_CRYSTAL_5", true);		// 結晶5を完全に破壊した
		SetEventFlg_("BFG_PERFECT_BREAK_CRYSTAL_6", true);		// 結晶6を完全に破壊した
	}
	
	
	EventEnd_();
}


//------------------------------------------------
//		フェードアウト中
//------------------------------------------------
function FadeIn()
{
	// フラグの取得
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");				// Num0
	core_num	 = GetNumFlg_("NUM_SCENARIO_SUB_CORE");			// Num8
	crystal_num	 = GetNumFlg_("NUM_FLG_COUNT_BROKEN_CRYSTAL");	// Num125
	
	// 結晶のリアクターポイントを調べたかどうかのフラグ
	local rec_flg1 = GetEventFlg_("BFG_CHECK_CRYSTAL_REC_POINT_1");	// 結晶1のリアクターポイントを調べたか	//Bit1313
	local rec_flg2 = GetEventFlg_("BFG_CHECK_CRYSTAL_REC_POINT_2");	// 結晶2のリアクターポイントを調べたか	//Bit1314
	local rec_flg3 = GetEventFlg_("BFG_CHECK_CRYSTAL_REC_POINT_3");	// 結晶3のリアクターポイントを調べたか	//Bit1315
	local rec_flg4 = GetEventFlg_("BFG_CHECK_CRYSTAL_REC_POINT_4");	// 結晶4のリアクターポイントを調べたか	//Bit1316
	local rec_flg5 = GetEventFlg_("BFG_CHECK_CRYSTAL_REC_POINT_5");	// 結晶5のリアクターポイントを調べたか	//Bit1317
	local rec_flg6 = GetEventFlg_("BFG_CHECK_CRYSTAL_REC_POINT_6");	// 結晶6のリアクターポイントを調べたか	//Bit1318
	
	// 結晶モンスターを倒し、完全に破壊出来てるかどうか
	local crystal_complete1 = GetEventFlg_("BFG_PERFECT_BREAK_CRYSTAL_1");	// 結晶1を完全に破壊した
	local crystal_complete2 = GetEventFlg_("BFG_PERFECT_BREAK_CRYSTAL_2");	// 結晶2を完全に破壊した
	local crystal_complete3 = GetEventFlg_("BFG_PERFECT_BREAK_CRYSTAL_3");	// 結晶3を完全に破壊した
	local crystal_complete4 = GetEventFlg_("BFG_PERFECT_BREAK_CRYSTAL_4");	// 結晶4を完全に破壊した
	local crystal_complete5 = GetEventFlg_("BFG_PERFECT_BREAK_CRYSTAL_5");	// 結晶5を完全に破壊した
	local crystal_complete6 = GetEventFlg_("BFG_PERFECT_BREAK_CRYSTAL_6");	// 結晶6を完全に破壊した
	
	local daemon_battle	 = GetEventFlg_("BFG_BATTLE_BAD_ARCDEAMON");		// 凶アークデーモンと戦ったかどうか	//Bit1310
	local daemon_win	 = GetEventFlg_("BFG_WIN_BAD_ARCDEAMON");			// 凶アークデーモンに勝ったフラグ	//Bit1311
	local kessyou_battle = GetEventFlg_("BFG_BATTLE_CRYSTAL_MONSTER");		// 結晶モンスターと戦ったフラグ(Bit1322)
	local kessyou_win	 = GetEventFlg_("BFG_WIN_CRYSTAL_MONSTER");			// 結晶モンスターに勝ったフラグ(Bit1323)
	local gimmick_help	 = GetEventFlg_("BFG_LOOKED_PLAYABLE_DEMO_C00_02");	// 結界の初回説明を受けたかどうか
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
	g_daemon		 <- C_NONE_ID;
	
	// ■凶アークデーモン
	if(daemon_win == false){
		g_daemon  = ReadAndArrangePointNpc("m202_00",  "npc_daemon");
		SetScaleSilhouette(g_daemon, SCALE.M, SILHOUETTE_WIDTH.M);	// サイズの設定
		SetTalkEnable_(g_daemon, false);							// 会話アイコン非表示
		SetReactorMsg_(g_daemon, "NPC_DAEMON_ANALYZE_010");
	}
	
	
	
	//---------------
	// ▼ギミック配置
	//---------------
	// ID初期化
	g_crystal_01	 <- C_NONE_ID;
	g_crystal_02	 <- C_NONE_ID;
	g_crystal_03	 <- C_NONE_ID;
	g_crystal_04	 <- C_NONE_ID;
	g_crystal_05	 <- C_NONE_ID;
	g_crystal_06	 <- C_NONE_ID;
	g_ruler_point	 <- C_NONE_ID;
	
	// リソース読み込み
	local id_crystal = ReadGimmick_("o_C00_07");	// 結晶
	
	// ■結晶
	if(crystal_complete1 == false){
		g_crystal_01 = ArrangePointGimmick_("o_C00_07", id_crystal, "gim_crystal_001");// 1層入口付近
	}
	if(crystal_complete2 == false){
		g_crystal_02 = ArrangePointGimmick_("o_C00_07", id_crystal, "gim_crystal_002");// 1層北西付近
	}
	if(crystal_complete3 == false){
		g_crystal_03 = ArrangePointGimmick_("o_C00_07", id_crystal, "gim_crystal_003");// 2層北付近
	}
	if(crystal_complete4 == false){
		g_crystal_04 = ArrangePointGimmick_("o_C00_07", id_crystal, "gim_crystal_004");// 2層西付近
	}
	if(crystal_complete5 == false){
		g_crystal_05 = ArrangePointGimmick_("o_C00_07", id_crystal, "gim_crystal_005");// 3層中央付近
	}
	if(crystal_complete6 == false){
		g_crystal_06 = ArrangePointGimmick_("o_C00_07", id_crystal, "gim_crystal_006");// 3層南西付近
	}
	
	// ■ルーラポイント
	local rulerpoint_id = ReadGimmick_("o_com_08");
	g_ruler_point = ArrangePointGimmick_("o_com_08", rulerpoint_id, "gim_ruler_point");
	SetMotion_(g_ruler_point, MOT_GIMMICK_0, BLEND_N);
	if(GetEventFlg_("BFG_RULER_ADD_025") == true){
		SetMotion_(g_ruler_point, MOT_GIMMICK_2, BLEND_N);
	}
	
	//--------------------
	//	▼エフェクトの設置
	//--------------------
	// ID初期化
	g_efc_kekkai01	 <- C_NONE_ID;
	g_efc_kekkai02	 <- C_NONE_ID;
	g_efc_aura_01	 <- C_NONE_ID;
	g_efc_aura_02	 <- C_NONE_ID;
	g_efc_aura_03	 <- C_NONE_ID;
	g_efc_aura_04	 <- C_NONE_ID;
	g_efc_aura_05	 <- C_NONE_ID;
	g_efc_aura_06	 <- C_NONE_ID;
	
	// エフェクトの読み込み
	LoadEffect_("ef300_51_wall_block");			// 瘴気の結界
	LoadEffect_("ef731_10_mag_aura_crystal");	// 結晶のオーラ
	
	// ■瘴気の結界
	if(crystal_num < 3){
		g_efc_kekkai01 = SetPointWorldEffect_("ef300_51_wall_block", "efc_kekkai_001");
		SetEffectScale_(g_efc_kekkai01, EFC_WALL);
	}
	if(crystal_num < 6){
		g_efc_kekkai02 = SetPointWorldEffect_("ef300_51_wall_block", "efc_kekkai_002");
		SetEffectScale_(g_efc_kekkai02, EFC_WALL);
	}
	
	// ■結晶のオーラ
	if(rec_flg1 == true && crystal_complete1 == false){
		g_efc_aura_01 = SetPointWorldEffect_("ef731_10_mag_aura_crystal", "gim_crystal_001");
		SetEffectScale_(g_efc_aura_01, EFC_DEF);
	}
	if(rec_flg2 == true && crystal_complete2 == false){
		g_efc_aura_02 = SetPointWorldEffect_("ef731_10_mag_aura_crystal", "gim_crystal_002");
		SetEffectScale_(g_efc_aura_02, EFC_DEF);
	}
	if(rec_flg3 == true && crystal_complete3 == false){
		g_efc_aura_03 = SetPointWorldEffect_("ef731_10_mag_aura_crystal", "gim_crystal_003");
		SetEffectScale_(g_efc_aura_03, EFC_DEF);
	}
	if(rec_flg4 == true && crystal_complete4 == false){
		g_efc_aura_04 = SetPointWorldEffect_("ef731_10_mag_aura_crystal", "gim_crystal_004");
		SetEffectScale_(g_efc_aura_04, EFC_DEF);
	}
	if(rec_flg5 == true && crystal_complete5 == false){
		g_efc_aura_05 = SetPointWorldEffect_("ef731_10_mag_aura_crystal", "gim_crystal_005");
		SetEffectScale_(g_efc_aura_05, EFC_DEF);
	}
	if(rec_flg6 == true && crystal_complete6 == false){
		g_efc_aura_06 = SetPointWorldEffect_("ef731_10_mag_aura_crystal", "gim_crystal_006");
		SetEffectScale_(g_efc_aura_06, EFC_DEF);
	}
	
	//-----------
	// ▼地雷配置
	//-----------
	// ID初期化
	g_mine_ruler_point	 <- C_NONE_ID;
	g_mine_daemon		 <- C_NONE_ID;
	g_mine_standby		 <- C_NONE_ID;
	g_mine_kekkai_01	 <- C_NONE_ID;
	g_mine_kekkai_02	 <- C_NONE_ID;
	g_mine_kekkai_03	 <- C_NONE_ID;
	g_mine_crystal_01	 <- C_NONE_ID;
	g_mine_crystal_02	 <- C_NONE_ID;
	g_mine_crystal_03	 <- C_NONE_ID;
	g_mine_crystal_04	 <- C_NONE_ID;
	g_mine_crystal_05	 <- C_NONE_ID;
	g_mine_crystal_06	 <- C_NONE_ID;
	g_mine_layer_01		 <- C_NONE_ID;
	g_mine_pane_01		 <- C_NONE_ID;
	
	
	// ■ルーラポイント
	g_mine_ruler_point = SetPointCircleEventMine_("mine_ruler_point", true);
	
	// ■凶アークデーモンとの戦闘用地雷
	if(daemon_win == false){
		g_mine_daemon = SetPointBoxEventMine_("mine_daemon", false);
	}
	
	// ■コア最深部への突入確認地雷
	if(main_num == GetFlagID_("CONST_SM_CORE")){							// Num0 = 7
		if(core_num == GetFlagID_("CONST_SS_CO_GO_MOTHER_ROOM")){			// Num8 = 1
			g_mine_standby = SetPointBoxEventMine_("mine_standby", false);
		}
	}
	
	// ■瘴気の結界
	if(gimmick_help == false){
		g_mine_kekkai_01 = SetPointBoxEventMine_("mine_kekkai_001", false);	// レナーテが話かけてくる地雷
	}
	if(crystal_num < 3){
		g_mine_kekkai_02 = SetPointBoxEventMine_("mine_kekkai_002", false);	// 第1層の結界
	}
	if(crystal_num < 6){
		g_mine_kekkai_03 = SetPointBoxEventMine_("mine_kekkai_003", false);	// 第3層の結界
	}
	
	// ■結晶
	// リアクターで調べた後＆結晶を完全破壊出来ていない時に配置
	if(rec_flg1 == true && crystal_complete1 == false){
		g_mine_crystal_01 = SetPointCircleEventMine_("mine_crystal_001", true);
	}
	if(rec_flg2 == true && crystal_complete2 == false){
		g_mine_crystal_02 = SetPointCircleEventMine_("mine_crystal_002", true);
	}
	if(rec_flg3 == true && crystal_complete3 == false){
		g_mine_crystal_03 = SetPointCircleEventMine_("mine_crystal_003", true);
	}
	if(rec_flg4 == true && crystal_complete4 == false){
		g_mine_crystal_04 = SetPointCircleEventMine_("mine_crystal_004", true);
	}
	if(rec_flg5 == true && crystal_complete5 == false){
		g_mine_crystal_05 = SetPointCircleEventMine_("mine_crystal_005", true);
	}
	if(rec_flg6 == true && crystal_complete6 == false){
		g_mine_crystal_06 = SetPointCircleEventMine_("mine_crystal_006", true);
	}
	
	// ■プレイヤーがどの階層にいるのかを調べる地雷
	g_mine_layer_01	 = SetPointBoxEventMineNoFallWait_("mine_layer_01");
	SetMinePlayerStop_(g_mine_layer_01, false);
	
	// ■マップ拡張のためのペインを解放するための地雷
	local pane_flg = GetEventFlg_("BFG_OPEN_SECRET_AREA_01_C00_02");
	if(pane_flg == false){
		g_mine_pane_01 = SetPointBoxEventMineNoFallWait_("mine_pane_01");
	}
	
	//---------------------
	// ▼リアクターポイント
	//---------------------
	// ID初期化
	g_rec_crystal_01 <- C_NONE_ID;
	g_rec_crystal_02 <- C_NONE_ID;
	g_rec_crystal_03 <- C_NONE_ID;
	g_rec_crystal_04 <- C_NONE_ID;
	g_rec_crystal_05 <- C_NONE_ID;
	g_rec_crystal_06 <- C_NONE_ID;
	
	
	// ■巨大な横穴
	local rec_point_hall = ArrangeMsgReactorPoint("rec_hall", GetFlagID_("BFG_REACTER_POINT_117")// Bit_1616 巨大な横穴
		, SHORT_DIST, "REC_POINT_HALL_010", "REC_POINT_HALL_020");
	
	// ■結晶
	if(gimmick_help == true){
		if(crystal_complete1 == false){
			g_rec_crystal_01 = ArrangePointReactorPoint_("rec_crystal_001", SHORT_DIST);
			SetReactorEvent_(g_rec_crystal_01);
		}
		if(crystal_complete2 == false){
			g_rec_crystal_02 = ArrangePointReactorPoint_("rec_crystal_002", SHORT_DIST);
			SetReactorEvent_(g_rec_crystal_02);
		}
		if(crystal_complete3 == false){
			g_rec_crystal_03 = ArrangePointReactorPoint_("rec_crystal_003", SHORT_DIST);
			SetReactorEvent_(g_rec_crystal_03);
		}
		if(crystal_complete4 == false){
			g_rec_crystal_04 = ArrangePointReactorPoint_("rec_crystal_004", SHORT_DIST);
			SetReactorEvent_(g_rec_crystal_04);
		}
		if(crystal_complete5 == false){
			g_rec_crystal_05 = ArrangePointReactorPoint_("rec_crystal_005", SHORT_DIST);
			SetReactorEvent_(g_rec_crystal_05);
		}
		if(crystal_complete6 == false){
			g_rec_crystal_06 = ArrangePointReactorPoint_("rec_crystal_006", SHORT_DIST);
			SetReactorEvent_(g_rec_crystal_06);
		}
	}
	
	// ■ルーラポイント
	local reactorPoint01  = ArrangeMsgReactorPoint("ReactorPoint_01", GetFlagID_("BFG_REACTER_POINT_010")
		, SHORT_DIST, "REC_POINT_01_01", "REC_POINT_01_02");
	
	//---------------------
	// ▼ナビマップアイコン
	//---------------------
	// ■ルーラポイント
	if(GetEventFlg_("BFG_RULER_ADD_025") == true){
		local icon_ruler_point = ArrangePointNaviMapIcon_(NAVIMAP_ICON.RULER_POINT , "gim_ruler_point");
		SetNaviMapIconVisible_(icon_ruler_point, true);
	}
	
	
	EventEnd_();
}


//------------------------------------------------
//		フィールド操作開始
//------------------------------------------------
function EventStartOperate()
{
	// フラグの取得
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");		// Num0
	core_num	 = GetNumFlg_("NUM_SCENARIO_SUB_CORE");	// Num8
	outside_num = GetNumFlg_("NUM_SCENARIO_SUB_INSIDE_CLEAR");	// Num10
	crystal_num	 = GetNumFlg_("NUM_FLG_COUNT_BROKEN_CRYSTAL");	// Num125
	
	// セーブ＆ロード対応のため階層によって敵の配置を変更する
	local player = GetPlayerId_();
	local pos = GetPos_(player);
	// プレイヤーのY座標が中層より上にいる場合
	DebugPrint("Y座標値は " + pos.y + " になりました。");
	if(pos.y >= 255){
		SetEventFlg_("BFG_C00_02_IN_SENTER_LAYER", true);	// コア３層目の中層以上にいるときtrue,下層にいるときfalseになるフラグ
		SetEventFlg_("BFG_C00_02_IN_DOWN_LAYER", false);	// コア３層目の中層以上にいるときfalse,下層にいるときtrueになるフラグ
	}
	// プレイヤーのY座標が中層より下にいる場合
	else if(pos.y <= 254){
		SetEventFlg_("BFG_C00_02_IN_SENTER_LAYER", false);	// コア３層目の中層以上にいるときtrue,下層にいるときfalseになるフラグ
		SetEventFlg_("BFG_C00_02_IN_DOWN_LAYER", true);		// コア３層目の中層以上にいるときfalse,下層にいるときtrueになるフラグ
	}
	
	
	// 結晶モンスターを倒し、完全に破壊出来てるかどうか
	local crystal_complete1 = GetEventFlg_("BFG_PERFECT_BREAK_CRYSTAL_1");	// 結晶1を完全に破壊した
	local crystal_complete2 = GetEventFlg_("BFG_PERFECT_BREAK_CRYSTAL_2");	// 結晶2を完全に破壊した
	local crystal_complete3 = GetEventFlg_("BFG_PERFECT_BREAK_CRYSTAL_3");	// 結晶3を完全に破壊した
	local crystal_complete4 = GetEventFlg_("BFG_PERFECT_BREAK_CRYSTAL_4");	// 結晶4を完全に破壊した
	local crystal_complete5 = GetEventFlg_("BFG_PERFECT_BREAK_CRYSTAL_5");	// 結晶5を完全に破壊した
	local crystal_complete6 = GetEventFlg_("BFG_PERFECT_BREAK_CRYSTAL_6");	// 結晶6を完全に破壊した
	
	local daemon_battle	 = GetEventFlg_("BFG_BATTLE_BAD_ARCDEAMON");	// 凶アークデーモンと戦ったかどうか	//Bit1310
	local daemon_win	 = GetEventFlg_("BFG_WIN_BAD_ARCDEAMON");		// 凶アークデーモンに勝ったフラグ	//Bit1311
	local kessyou_battle = GetEventFlg_("BFG_BATTLE_CRYSTAL_MONSTER");	// 結晶モンスターと戦ったフラグ(Bit1322)
	local kessyou_win	 = GetEventFlg_("BFG_WIN_CRYSTAL_MONSTER");		// 結晶モンスターに勝ったフラグ(Bit1323)
	local player		 = GetPlayerId_();
	
	//-----------
	// ▼戦闘結果
	//-----------
	// ■凶アークデーモン
	if(daemon_battle == true){
		// 勝利した場合
		if(daemon_win == true){
			SetEventFlg_("BFG_RETURN_BATTLE_FIRLD_BGM_HEAD", true);		// フィールドBGMを頭打ち
			SetEventFlg_("BFG_BATTLE_BAD_ARCDEAMON", false);	// 戦ったフラグを降ろす
			CommChangeMomentFadeOut(FADE_COLOR_BLACK)			// 1フレで暗転
			SetVisible(g_daemon, false);						// NPCを表示させない
			DeleteEventMine_(g_mine_daemon);					// 地雷削除
			uPlayableReset(-303.1, 631.9, -233.2, -130);		// プレイアブルに復帰させる
		}
		// ※負け判定はAfterBattle()内で行っている
	}
	
	// ■結晶モンスター戦
	if(kessyou_battle == true){
		// 勝利した場合
		if(kessyou_win == true){
			SetEventFlg_("BFG_BATTLE_CRYSTAL_MONSTER", false);	// 結晶モンスターと戦ったフラグ
			Wait_(20);
			// 結晶を3つ壊した時
			if(crystal_num == 3){
				uBreakWall(1);	// 1層の結界を消す擬似デモ
			}
			// 結晶を6つ壊した時
			else if(crystal_num == 6){
				uBreakWall(2);	// 3層の結界を消す擬似デモ
			}
		}
		// ※負け判定はAfterBattle()内で行っている
	}
	
	//-----------
	// ▼進入禁止
	//-----------
	// 裏シナリオ
	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){				// Num 0 =  9
		// Demo825[コアの現状]を再生するまで
		if(outside_num <= GetFlagID_("CONST_SS_OS_GO_TO_CORE")){		// Num10 <= 12
			// メッセージの表示＋コア突入口へ移動
			uNotEnterRoomMsg();
		}
	}
	
	
	EventEnd_();
}


//------------------------------------------------
//		ＮＰＣ接触時
//------------------------------------------------
function TouchNpc()
{
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");		// Num0
	core_num	 = GetNumFlg_("NUM_SCENARIO_SUB_CORE");	// Num8
	
	local target = GetTargetId_();
	
	DebugPrint("ID: " + target + " に接触 [TouchEventMine]");
	
	switch (target) {
//	case  :
//		break;
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
	// フラグの取得
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");		// Num0
	core_num	 = GetNumFlg_("NUM_SCENARIO_SUB_CORE");	// Num8
	
	local target = GetTouchEventMineId_();
	
	DebugPrint("ID: " + target + " に接触 [TouchEventMine]");
	
	switch (target) {
	case g_mine_ruler_point:
		uMineRulerPoint();
		break;
	case g_mine_daemon :
		uMineDaemonBattle();
		break;
	case g_mine_standby :
		uMineStandby();
		break;
	case g_mine_kekkai_01 :
		uMineKekkai01();
		break;
	case g_mine_kekkai_02 :
		uMineKekkai02();
		break;
	case g_mine_kekkai_03 :
		uMineKekkai03();
		break;
	case g_mine_crystal_01 :
		uMineCrystalBreak(g_crystal_01, g_efc_aura_01, g_mine_crystal_01);
		break;
	case g_mine_crystal_02 :
		uMineCrystalBreak(g_crystal_02, g_efc_aura_02, g_mine_crystal_02);
		break;
	case g_mine_crystal_03 :
		uMineCrystalBreak(g_crystal_03, g_efc_aura_03, g_mine_crystal_03);
		break;
	case g_mine_crystal_04 :
		uMineCrystalBreak(g_crystal_04, g_efc_aura_04, g_mine_crystal_04);
		break;
	case g_mine_crystal_05 :
		uMineCrystalBreak(g_crystal_05, g_efc_aura_05, g_mine_crystal_05);
		break;
	case g_mine_crystal_06 :
		uMineCrystalBreak(g_crystal_06, g_efc_aura_06, g_mine_crystal_06);
		break;
	case g_mine_layer_01 :
		uMineLayer();
		break;
	case g_mine_pane_01 :
		uMinePane01();
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
	// フラグの取得
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");		// Num0
	core_num	 = GetNumFlg_("NUM_SCENARIO_SUB_CORE");	// Num8
	
	local target = GetTargetId_();
	
	switch(target){
	case g_rec_crystal_01:
		uReactorPointCrystal(g_rec_crystal_01);
		break;
	case g_rec_crystal_02:
		uReactorPointCrystal(g_rec_crystal_02);
		break;
	case g_rec_crystal_03:
		uReactorPointCrystal(g_rec_crystal_03);
		break;
	case g_rec_crystal_04:
		uReactorPointCrystal(g_rec_crystal_04);
		break;
	case g_rec_crystal_05:
		uReactorPointCrystal(g_rec_crystal_05);
		break;
	case g_rec_crystal_06:
		uReactorPointCrystal(g_rec_crystal_06);
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
//		ルーラポイントの地雷に触れた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineRulerPoint()
{
	CommPlayerTurnAroundObj(g_ruler_point);
	CommRulerPointEvent(g_ruler_point, "BFG_RULER_ADD_025", "gim_ruler_point");
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		凶アークデーモンとの戦闘用地雷に触れた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineDaemonBattle()
{
	// フラグの取得
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");		// Num0
	core_num	 = GetNumFlg_("NUM_SCENARIO_SUB_CORE");	// Num8
	
	local daemon_battle	 = GetEventFlg_("BFG_BATTLE_BAD_ARCDEAMON");// 凶アークデーモンと戦ったかどうか	//Bit1310
	local daemon_win	 = GetEventFlg_("BFG_WIN_BAD_ARCDEAMON");	// 凶アークデーモンに勝ったフラグ	//Bit1311
	local player		 = GetPlayerId_();
	
	
	// 地雷削除
	DeleteEventMine_(g_mine_daemon);
	
	// アークデーモンと戦ったフラグ
	SetEventFlg_("BFG_BATTLE_BAD_ARCDEAMON", true);
	
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
	
	// 凶アークデーモンのメッセージ
	OpenMsgWnd_();
	ShowMsg_("NPC_DAEMON_010");						//「ココカラ……先ハ……行カセナイ……！
	KeyInputWait_();
	CloseMsgWnd_();
	
	// 凶アークデーモンのモーション再生
	PlaySE_("SE_FLD_073");
	SetMotion_(g_daemon, MOT_SPELL_START, BLEND_M);
	Wait_(20);
	SetMotion_(g_daemon, MOT_SPELL_CHARGE, BLEND_M);
	Wait_(10);
	SetMotion_(g_daemon, MOT_SPELL_ACTUATE, BLEND_M);
	Wait_(20);
	
	// 凶アークデーモンと戦闘
	ChangeBattleParty_(166);
	
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		コア最深部への突入確認地雷に触れた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineStandby()
{
	// システムメッセージ
	OpenMsgWnd_();
	ShowMsg_("SYS_MESSAGE_010");			//この奥から　マ素の　強い反応がある……。
	KeyInputWait_();
	// 「はい」
	if(GetQueryResult_() == QUERY2_0){
		CloseMsgWnd_();
		// 地雷削除
		DeleteEventMine_(g_mine_standby);
		ChangeMap_("E00_00");
	}
	// 「いいえ」
	else{
		CloseMsgWnd_();
		// バックして移動
		CommPlayerTurnMoveDirWalk(50);
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		レナーテが話しかけてくるに触れた時(第1層)
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineKekkai01()
{
	SetEventFlg_("BFG_LOOKED_PLAYABLE_DEMO_C00_02", true);	// 結界ギミックの初回説明擬似デモを見たかどうか
	DeleteEventMine_(g_mine_kekkai_01);
	// ユニークIDの初期化
	g_mine_kekkai_01 = C_NONE_ID;
	
	// フェードアウト
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
	Wait_(10);
	
	// カメラを設置
	SetPointCameraEye_("cameye_002");
	SetPointCameraTarget_("camtgt_002");
	Wait_(10);
	
	// フェードイン
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
	Wait_(20);
	
	// メッセージ
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_RENATE_010");			//「これは……マ素が生み出す　エネルギーで
	KeyInputWait_();
	CloseMsgWnd_();
	
	// フェードアウト
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
	Wait_(10);
	
	//カメラを設置
	SetPlayableCamera_();
	Wait_(10);
	
	// フェードイン
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
	Wait_(20);
	
	
	//---------------------------
	// ▼リアクターポイントの設置
	//---------------------------
	// ■結晶
	g_rec_crystal_01 = ArrangePointReactorPoint_("rec_crystal_001", SHORT_DIST);
	SetReactorEvent_(g_rec_crystal_01);
	g_rec_crystal_02 = ArrangePointReactorPoint_("rec_crystal_002", SHORT_DIST);
	SetReactorEvent_(g_rec_crystal_02);
	g_rec_crystal_03 = ArrangePointReactorPoint_("rec_crystal_003", SHORT_DIST);
	SetReactorEvent_(g_rec_crystal_03);
	g_rec_crystal_04 = ArrangePointReactorPoint_("rec_crystal_004", SHORT_DIST);
	SetReactorEvent_(g_rec_crystal_04);
	g_rec_crystal_05 = ArrangePointReactorPoint_("rec_crystal_005", SHORT_DIST);
	SetReactorEvent_(g_rec_crystal_05);
	g_rec_crystal_06 = ArrangePointReactorPoint_("rec_crystal_006", SHORT_DIST);
	SetReactorEvent_(g_rec_crystal_06);
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		瘴気の結界に触れた時(第1層)
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineKekkai02()
{
	local player = GetPlayerId_();	// プレイヤーID取得
	
	// フェードアウト
	SetFadePlane_(FADE_PLANE.PLANE_3D);
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
	
	SetVisible(player, true);
	SetPos_(player, Vec3(503.0, 15.0, -67.0));
	SetDir_(player, -83);
	
	// メッセージ
	OpenMsgWnd_();
	ShowMsg_("SYS_KEKKAI_010");		// 強力なエネルギーバリアによって
	KeyInputWait_();
	CloseMsgWnd_();
	
	SetPlayableCamera_();
	SetCameraDir_(-83);
	Wait_(10);
	
	// フェードイン
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		瘴気の結界に触れた時(第3層)
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineKekkai03()
{
	local player = GetPlayerId_();	// プレイヤーID取得
	
	// フェードアウト
	SetFadePlane_(FADE_PLANE.PLANE_3D);
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
	
	// モンスターの配置を変更
	SetEventFlg_("BFG_C00_02_IN_SENTER_LAYER", false);	// コア３層目の中層以上にいるときtrue,下層にいるときfalseになるフラグ
	SetEventFlg_("BFG_C00_02_IN_DOWN_LAYER", true);		// コア３層目の中層以上にいるときfalse,下層にいるときtrueになるフラグ
	
	SetVisible(player, true);
	SetPos_(player, Vec3(503.0, 15.0, -67.0));
	SetDir_(player, -83);
	
	// メッセージ
	OpenMsgWnd_();
	ShowMsg_("SYS_KEKKAI_010");		// 強力なエネルギーバリアによって
	KeyInputWait_();
	CloseMsgWnd_();
	
	SetPlayableCamera_();
	SetCameraDir_(-83);
	Wait_(10);
	
	// フェードイン
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		結晶を調べた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineCrystalBreak(obj, efc, mine)
{
	// フラグの取得
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");				// Num0
	core_num	 = GetNumFlg_("NUM_SCENARIO_SUB_CORE");			// Num8
	crystal_num	 = GetNumFlg_("NUM_FLG_COUNT_BROKEN_CRYSTAL");	// Num125
	
	// 結晶のリアクターポイントを調べたかどうかのフラグ
	local rec_flg1 = GetEventFlg_("BFG_CHECK_CRYSTAL_REC_POINT_1");	// 結晶1のリアクターポイントを調べたか	//Bit1313
	local rec_flg2 = GetEventFlg_("BFG_CHECK_CRYSTAL_REC_POINT_2");	// 結晶2のリアクターポイントを調べたか	//Bit1314
	local rec_flg3 = GetEventFlg_("BFG_CHECK_CRYSTAL_REC_POINT_3");	// 結晶3のリアクターポイントを調べたか	//Bit1315
	local rec_flg4 = GetEventFlg_("BFG_CHECK_CRYSTAL_REC_POINT_4");	// 結晶4のリアクターポイントを調べたか	//Bit1316
	local rec_flg5 = GetEventFlg_("BFG_CHECK_CRYSTAL_REC_POINT_5");	// 結晶5のリアクターポイントを調べたか	//Bit1317
	local rec_flg6 = GetEventFlg_("BFG_CHECK_CRYSTAL_REC_POINT_6");	// 結晶6のリアクターポイントを調べたか	//Bit1318
	
	local target = GetTouchEventMineId_();
	local player = GetPlayerId_();
	
	CommPlayerTurnAroundObj(obj);
	
	// メッセージ
	OpenMsgWnd_();
	if(crystal_num == 2 || crystal_num == 5){
		ShowMsg_("SYS_KESSYOU_015");				// 結晶の内部から　魔物の気配を感じる……。
	}
	else{
		ShowMsg_("SYS_KESSYOU_010");				// 目の前の結晶を  破壊しますか？
	}
	KeyInputWait_();
	
	// 「はい」
	if (GetQueryResult_() == QUERY2_0) {
		CloseMsgWnd_();
		
		SetNumFlg_("NUM_FLG_COUNT_BROKEN_CRYSTAL", crystal_num = crystal_num + 1);
		
		//白フェードアウト
		SetFade_(FADE_OUT, FADE_COLOR_WHITE, 10.0);
//		SetFadeSub_(FADE_OUT, FADE_COLOR_WHITE, FADE_DEF);
		WaitFade_();
		Wait_(10);
		
		// SE再生
		PlaySE_("SE_FLD_064");	// コア・マデュライト結晶が割れる音
		Wait_(28);
		
		// 結晶オブジェクトとオーラエフェクトと地雷を消す
		SetVisible(obj, false);
		DeleteEffectEmitter_(efc);
		DeleteEventMine_(mine);
		
		// ユニークIDの初期化を行う
		switch (mine) {
		case g_mine_crystal_01 :
			g_mine_crystal_01 = C_NONE_ID;
			SetEventFlg_("BFG_BREAK_CRYSTAL_1", true);	//結晶を壊した
			SetActive_(g_rec_crystal_01, false);		//結晶のリアクターポイントを消す
			break;
		case g_mine_crystal_02 :
			g_mine_crystal_02 = C_NONE_ID;
			SetEventFlg_("BFG_BREAK_CRYSTAL_2", true);
			SetActive_(g_rec_crystal_02, false);
			break;
		case g_mine_crystal_03 :
			g_mine_crystal_03 = C_NONE_ID;
			SetEventFlg_("BFG_BREAK_CRYSTAL_3", true);
			SetActive_(g_rec_crystal_03, false);
			break;
		case g_mine_crystal_04 :
			g_mine_crystal_04 = C_NONE_ID;
			SetEventFlg_("BFG_BREAK_CRYSTAL_4", true);
			SetActive_(g_rec_crystal_04, false);
			break;
		case g_mine_crystal_05 :
			g_mine_crystal_05 = C_NONE_ID;
			SetEventFlg_("BFG_BREAK_CRYSTAL_5", true);
			SetActive_(g_rec_crystal_05, false);
			break;
		case g_mine_crystal_06 :
			g_mine_crystal_06 = C_NONE_ID;
			SetEventFlg_("BFG_BREAK_CRYSTAL_6", true);
			SetActive_(g_rec_crystal_06, false);
			break;
		default :
			DebugPrint("WARNING : MINE_IDが不正です [TouchEventMine]");
			break;
		}
		
		// ボスを倒さなくていい場合、結晶を完全に破壊したフラグを立てる
		if(crystal_num == 1 || crystal_num == 2 || crystal_num == 4 || crystal_num == 5){
			uSetCrystalCompleteFlg();
		}
		
		//フェードイン
		SetFade_(FADE_IN, FADE_COLOR_WHITE, FADE_DEF);
		WaitFade_();
		Wait_(10);
		
		// メッセージ
		OpenMsgWnd_();
		ShowMsg_("SYS_KESSYOU_020");					// マ素の結晶を　ひとつ破壊した！
		KeyInputWait_();
		if(crystal_num == 1 || crystal_num == 4){
			ShowMsg_("SYS_KESSYOU_030");				// バリアのエネルギーが　少し低下したようだ。
			KeyInputWait_();
		}
		if(crystal_num == 2 || crystal_num == 5){
			ShowMsg_("SYS_KESSYOU_040");				// もう少しで　消滅させられそうだ。
			KeyInputWait_();
		}
		if(crystal_num == 3 || crystal_num == 6){
			// メッセージ
			ShowMsg_("SYS_KESSYOU_060");				// 結晶から　飛び散ったマ素によって
			KeyInputWait_();
		}
		CloseMsgWnd_();
		
		// 結界の結晶ボスとの戦闘
//		if(crystal_num == 1 || crystal_num == 4){
//			SetEventFlg_("BFG_BATTLE_CRYSTAL_MONSTER", true);	// 結晶モンスターと戦った(Bit1322)
//			ChangeBattleParty_(167);							// コア　結界の結晶ボス１
//		}
//		else if(crystal_num == 2 || crystal_num == 5){
//			SetEventFlg_("BFG_BATTLE_CRYSTAL_MONSTER", true);	// 結晶モンスターと戦った(Bit1322)
//			ChangeBattleParty_(168);							// コア　結界の結晶ボス２
//		}
		if(crystal_num == 3){
			SetEventFlg_("BFG_BATTLE_CRYSTAL_MONSTER", true);	// 結晶モンスターと戦った(Bit1322)
			InhibitMonsterGenerate_( 10000.0 );
			ChangeBattleParty_(168);							// コア　結界の結晶ボス２
		}
		if(crystal_num == 6){
			SetEventFlg_("BFG_BATTLE_CRYSTAL_MONSTER", true);	// 結晶モンスターと戦った(Bit1322)
			InhibitMonsterGenerate_( 10000.0 );
			ChangeBattleParty_(169);							// コア　結界の結晶ボス３
		}
	}
	// 「いいえ」
	else {
		CloseMsgWnd_();
	}
	
	
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		リアクターポイントを調べた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uReactorPointCrystal(id)
{
	local rec_flg1 = GetEventFlg_("BFG_CHECK_CRYSTAL_REC_POINT_1");	// 結晶1のリアクターポイントを調べたか	//Bit1313
	local rec_flg2 = GetEventFlg_("BFG_CHECK_CRYSTAL_REC_POINT_2");	// 結晶2のリアクターポイントを調べたか	//Bit1314
	local rec_flg3 = GetEventFlg_("BFG_CHECK_CRYSTAL_REC_POINT_3");	// 結晶3のリアクターポイントを調べたか	//Bit1315
	local rec_flg4 = GetEventFlg_("BFG_CHECK_CRYSTAL_REC_POINT_4");	// 結晶4のリアクターポイントを調べたか	//Bit1316
	local rec_flg5 = GetEventFlg_("BFG_CHECK_CRYSTAL_REC_POINT_5");	// 結晶8のリアクターポイントを調べたか	//Bit1317
	local rec_flg6 = GetEventFlg_("BFG_CHECK_CRYSTAL_REC_POINT_6");	// 結晶6のリアクターポイントを調べたか	//Bit1318
	
	// 結晶のオーラエフェクトと地雷を設置
	if(id == g_rec_crystal_01 && rec_flg1 == false){
		SetEventFlg_("BFG_CHECK_CRYSTAL_REC_POINT_1", true);
		g_mine_crystal_01 = SetPointCircleEventMine_("mine_crystal_001", true);
		g_efc_aura_01 = SetPointWorldEffect_("ef731_10_mag_aura_crystal", "gim_crystal_001");
		SetEffectScale_(g_efc_aura_01, EFC_DEF);
	}
	if(id == g_rec_crystal_02 && rec_flg2 == false){
		SetEventFlg_("BFG_CHECK_CRYSTAL_REC_POINT_2", true);
		g_mine_crystal_02 = SetPointCircleEventMine_("mine_crystal_002", true);
		g_efc_aura_02 = SetPointWorldEffect_("ef731_10_mag_aura_crystal", "gim_crystal_002");
		SetEffectScale_(g_efc_aura_02, EFC_DEF);
	}
	if(id == g_rec_crystal_03 && rec_flg3 == false){
		SetEventFlg_("BFG_CHECK_CRYSTAL_REC_POINT_3", true);
		g_mine_crystal_03 = SetPointCircleEventMine_("mine_crystal_003", true);
		g_efc_aura_03 = SetPointWorldEffect_("ef731_10_mag_aura_crystal", "gim_crystal_003");
		SetEffectScale_(g_efc_aura_03, EFC_DEF);
	}
	if(id == g_rec_crystal_04 && rec_flg4 == false){
		SetEventFlg_("BFG_CHECK_CRYSTAL_REC_POINT_4", true);
		g_mine_crystal_04 = SetPointCircleEventMine_("mine_crystal_004", true);
		g_efc_aura_04 = SetPointWorldEffect_("ef731_10_mag_aura_crystal", "gim_crystal_004");
		SetEffectScale_(g_efc_aura_04, EFC_DEF);
	}
	if(id == g_rec_crystal_05 && rec_flg5 == false){
		SetEventFlg_("BFG_CHECK_CRYSTAL_REC_POINT_5", true);
		g_mine_crystal_05 = SetPointCircleEventMine_("mine_crystal_005", true);
		g_efc_aura_05 = SetPointWorldEffect_("ef731_10_mag_aura_crystal", "gim_crystal_005");
		SetEffectScale_(g_efc_aura_05, EFC_DEF);
	}
	if(id == g_rec_crystal_06 && rec_flg6 == false){
		SetEventFlg_("BFG_CHECK_CRYSTAL_REC_POINT_6", true);
		g_mine_crystal_06 = SetPointCircleEventMine_("mine_crystal_006", true);
		g_efc_aura_06 = SetPointWorldEffect_("ef731_10_mag_aura_crystal", "gim_crystal_006");
		SetEffectScale_(g_efc_aura_06, EFC_DEF);
	}
	
	// メッセージ
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_REACTOR");
	ShowMsg_("REC_KESSYOU_010");				// 「高濃度のマ素を帯びた　結晶がある。
	KeyInputWait_();
	CloseMsgWnd_();
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		結界が消える演出
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uBreakWall(id)
{
	local player;
	player = GetPlayerId_();	// プレイヤーID取得
	
	// 1層の結界
	if(id == 1){
		DeleteEventMine_(g_mine_kekkai_02);						// 地雷削除
		g_mine_kekkai_02 = C_NONE_ID;							// ユニークIDの初期化
	}
	// 3層の結界
	else if(id == 2){
		DeleteEventMine_(g_mine_kekkai_03);						// 地雷削除
		g_mine_kekkai_03 = C_NONE_ID;							// ユニークIDの初期化
	}
	
	// 地震を起こす
	Wait_(15);
	PlaySE_("SE_FLD_129");
	StartEarthQuake_(15, 3, 0.3)
	Wait_(15);
	
	// 「！」ピコン
	LoadEffect_("ef712_10_emo_surprise01");
	SurpriseDisp(player);
	Wait_(15);
	
	// フェードアウト
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
	Wait_(10);
	
	// カメラを設置
	// 1層の結界
	if(id == 1){
		SetPointCameraEye_("cameye_002");
		SetPointCameraTarget_("camtgt_002");
	}
	// 3層の結界
	else if(id == 2){
		SetPointCameraEye_("cameye_003");
		SetPointCameraTarget_("camtgt_003");
	}
	
	Wait_(10);
	
	// フェードイン
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
	Wait_(10);
	
	// エフェクトのアルファを"0"にして見えないようにする
	// 1層の結界
	if(id == 1){
		DeleteEffectEmitter_(g_efc_kekkai01);
	}
	// 3層の結界
	else if(id == 2){
		DeleteEffectEmitter_(g_efc_kekkai02);
	}
	
	Wait_(90);
	
	// メッセージ
	OpenMsgWnd_();
	ShowMsg_("SYS_KESSYOU_050");	// 消滅したようだ……。
	KeyInputWait_();
	CloseMsgWnd_();
	
	// フェードアウト
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
	Wait_(10);
	
	// マップ拡張のためのペイン解放
	if(id == 1){ SetEventFlg_("BFG_OPEN_SECRET_AREA_00_C00_02", true); }
	if(id == 2){ SetEventFlg_("BFG_OPEN_SECRET_AREA_02_C00_02", true); }
	
	
	//カメラを設置
	SetPlayableCamera_();
	Wait_(10);
	
	// フェードイン
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
	Wait_(20);
	
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


//++++++++++++++++++++++++++++++++++++++++++++++++
//		どの高さにいるのか調べる地雷
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineLayer()
{
	local layer_flg = GetEventFlg_("BFG_C00_02_SENTER_OR_DOWN_LAYER");	// コア３層目の中層以上か下層にいるか判断するフラグ
	local player = GetPlayerId_();
	local pos = GetPos_(player);
	
	DebugPrint("Y座標の値は " + pos.y + " になりました。");
	
	// 地雷より上層にいるか下層にいるかの判定を行う
	if(pos.y >= 245){
		SetEventFlg_("BFG_C00_02_SENTER_OR_DOWN_LAYER", true);
	}
	else{
		SetEventFlg_("BFG_C00_02_SENTER_OR_DOWN_LAYER", false);
	}
	
	// フラグを再取得する
	layer_flg = GetEventFlg_("BFG_C00_02_SENTER_OR_DOWN_LAYER");
	DebugPrint("フラグの値は " + layer_flg + " になりました。");
	
	// 地雷よりも上層に居た時
	if(layer_flg == true){
		SetEventFlg_("BFG_C00_02_IN_SENTER_LAYER", true);	// コア３層目の中層以上にいるときtrue,下層にいるときfalseになるフラグ
		SetEventFlg_("BFG_C00_02_IN_DOWN_LAYER", false);	// コア３層目の中層以上にいるときfalse,下層にいるときtrueになるフラグ
	}
	// 下層に居た時
	else{
		SetEventFlg_("BFG_C00_02_IN_SENTER_LAYER", false);	// コア３層目の中層以上にいるときtrue,下層にいるときfalseになるフラグ
		SetEventFlg_("BFG_C00_02_IN_DOWN_LAYER", true);		// コア３層目の中層以上にいるときfalse,下層にいるときtrueになるフラグ
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		マップ拡張のためのペインを解放する地雷
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMinePane01()
{
	local pane_flg = GetEventFlg_("BFG_OPEN_SECRET_AREA_01_C00_02");
	if(pane_flg == false){
		SetEventFlg_("BFG_OPEN_SECRET_AREA_01_C00_02", true);	// ペインの解放を行う
		DeleteEventMine_(g_mine_pane_01);						// 地雷削除
		g_mine_pane_01 = C_NONE_ID;								// ユニークIDの初期化
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		結晶を完全に破壊したフラグをセットする
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uSetCrystalCompleteFlg()
{
	// 結晶を壊したフラグを取得
	local crystal_break1 = GetEventFlg_("BFG_BREAK_CRYSTAL_1");	// 結晶1を壊した
	local crystal_break2 = GetEventFlg_("BFG_BREAK_CRYSTAL_2");	// 結晶2を壊した
	local crystal_break3 = GetEventFlg_("BFG_BREAK_CRYSTAL_3");	// 結晶3を壊した
	local crystal_break4 = GetEventFlg_("BFG_BREAK_CRYSTAL_4");	// 結晶4を壊した
	local crystal_break5 = GetEventFlg_("BFG_BREAK_CRYSTAL_5");	// 結晶5を壊した
	local crystal_break6 = GetEventFlg_("BFG_BREAK_CRYSTAL_6");	// 結晶6を壊した
	
	// 完全に破壊したフラグをセットする
	if(crystal_break1 == true){ SetEventFlg_("BFG_PERFECT_BREAK_CRYSTAL_1", true); }// 結晶1を完全に破壊した
	if(crystal_break2 == true){ SetEventFlg_("BFG_PERFECT_BREAK_CRYSTAL_2", true); }// 結晶2を完全に破壊した
	if(crystal_break3 == true){ SetEventFlg_("BFG_PERFECT_BREAK_CRYSTAL_3", true); }// 結晶3を完全に破壊した
	if(crystal_break4 == true){ SetEventFlg_("BFG_PERFECT_BREAK_CRYSTAL_4", true); }// 結晶4を完全に破壊した
	if(crystal_break5 == true){ SetEventFlg_("BFG_PERFECT_BREAK_CRYSTAL_5", true); }// 結晶5を完全に破壊した
	if(crystal_break6 == true){ SetEventFlg_("BFG_PERFECT_BREAK_CRYSTAL_6", true); }// 結晶6を完全に破壊した
}

//++++++++++++++++++++++++++++++++++++++++++++++++
// コア最深部進入禁止処理  Redmine#2664
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uNotEnterRoomMsg()
{
	// プレイヤーの復帰位置
	local pl_return_pos = Vec3(57.993, 0.000, 23.173);;
	local pl_return_dir = 75;
	// メッセージボックスより後ろの階層が暗転するように設定
	SetFadePlane_(FADE_PLANE.PLANE_3D);
	CommChangeMomentFadeOut(FADE_COLOR_WHITE);
	// メッセージ
	OpenMsgWnd_();
	ShowMsg_("NOT_ENTER_MSG");
	KeyInputWait_();
	CloseMsgWnd_();
	// 暗転
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
	// 階層を戻しておく
	SetFadePlane_(FADE_PLANE.PLANE_NORMAL);
	// コア突入口へ移動
	ChangeMapPosDir_("C00_00", pl_return_pos, pl_return_dir);
}
