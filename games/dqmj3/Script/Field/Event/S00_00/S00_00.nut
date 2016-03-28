//===================== S00_00黒鉄の監獄塔 ====================
//---------------------------------
// ▼空間の遊びで使用する定数
//---------------------------------
// ギミックの起動とクリアフラグ
const GIMMICK_FLG			 = "BFG_SPACE_GIMMICK_SAND";
const GIMMICK_CLEAR_FLG		 = "BFG_SPACE_GIMMICK_SAND_1ST_CLEAR";

// 主人公の復帰位置と向き
const XPOS_1				 = 447.366;		// 遺跡スイッチ付近
const YPOS_1				 = -173.314;
const ZPOS_1				 = 1117.000;
const DIR_1					 = 144;

const XPOS_2				 = 1491.000;	// ゴールボスの手前
const YPOS_2				 = 1798.000;
const ZPOS_2				 = -831.000;
const DIR_2					 = 150;

// 擬似デモで使用するカメラのノード名
const CAMERA_EYE			 = "cameye_001";
const CAMERA_TGT			 = "camtgt_001";

// 遺跡スイッチを起動させる為の鍵ID
const GIMMICK_KEY_ID		 = 905;

// 遺跡スイッチを起動させた時のメッセージID
const GIMMICK_MSG_ID		 = "MASTERS_LOAD_REACTOR_MSG_016";

// 遺跡スイッチ起動後の再生デモナンバー
const DEMO_NUM				 = 432;

// ボスモンスターのID (1=初回, 2=2回目以降)
const BOSS_ID_1				 = "m178_00";	// レジフライヤー
const BOSS_ID_2				 = "m178_00";	// レジフライヤー

// ボスモンスターのExchange用ID
const BOSS_EXCHANGE_ID		 = 483;			// レジウィング

// ボスモンスターのスケールと輪郭幅の設定 (1=初回, 2=2回目以降)
//【Nサイズ】スケール=0.6, シルエット幅=0.8
//【Mサイズ】スケール=1.0, シルエット幅=1.0
//【Gサイズ】スケール=2.5, シルエット幅=1.0
//【Tサイズ】スケール=6.0, シルエット幅=1.0
const BOSS_SCALE_1			 = 0.6;
const BOSS_SILHOUETTE_1		 = 0.8;
const BOSS_SCALE_2			 = 0.6;
const BOSS_SILHOUETTE_2		 = 0.8;

// ボス戦の敵パーティテーブル (1=初回, 2=2回目以降)
const BOSS_PARTY_TABLE_1	 = 161;
const BOSS_PARTY_TABLE_2	 = 161;

// ボスを仲間にする際のモンスターパラメータ (1=初回, 2=2回目以降)
const BOSS_PARAMETER_1		 = 1809;
const BOSS_PARAMETER_2		 = 1809;

// ボス仲間後のマップチェンジID
const MAP_ID				 = "S00_00";


// 変数定義
main_num	 <- C_NONE_ID;
prison_num	 <- C_NONE_ID;

str_num_sub	 <- "NUM_SCENARIO_SUB_PRISON";

// 凶エスタークイベント用変数
npc_B_Estark  <- C_NONE_ID;
mine_B_Estark <- C_NONE_ID;

//------------------------------------------------
//		戦闘終了後
//------------------------------------------------
function AfterBattle()
{
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");			// Num0
	prison_num	 = GetNumFlg_("NUM_SCENARIO_SUB_PRISON");	// Num6
	
	//---------------------------------
	// ▼空間の遊びイベント用のフラグ
	//---------------------------------
	local info = {
		GIMMICK_FLG			 = GIMMICK_FLG,
	};
	
	MastersLoad_AfterBattle(info);

	//-------------------------------
	// ▼凶エスタークイベント用
	//-------------------------------
	// ■進行フラグ
	local status_num = GetNumFlg_("NUM_BREAK_ESTARK_PHASE"); // NUM018
	// 戦闘の判定
	if(status_num == 3 || status_num == 6){
		local player = GetPlayerId_();
		// 擬似デモで消した主人公を見えるようにする
		SetManualCalcAlpha_(player, true);
		SetAlpha_(player, 1.0);
		// 擬似デモでカメラを調整したのでデフォルトに戻しておく
		SetPlayableCamera_();
		// 勝ち
		if(GetBattleEndType_() == END_TYPE_WIN){
			// 残って映っている凶エスタークを消す
			SetManualCalcAlpha_(npc_B_Estark, true);
			SetAlpha_(npc_B_Estark, 0.0);
			// 凶エスタークを配置
			local npc_B_Estark_l = ReadAndArrangePointNpc("m199_00", "e_BreakEstark_npc");
			SetTalkEnable_(npc_B_Estark_l, false);
			SetScaleSilhouette(npc_B_Estark_l, SCALE.T, SILHOUETTE_WIDTH.T);
			SetVisible(npc_B_Estark_l, true);
		}
		// にげる
		else if(GetBattleEndType_() == END_TYPE_FLEE){
			// 特に何もしない
		}
		// 負け
		else{
			// 進行フラグを再戦時へ
			SetNumFlg_("NUM_BREAK_ESTARK_PHASE", 4);
		}
	}

	
	EventEnd_();
}


//------------------------------------------------
//		マップに入る前
//------------------------------------------------
function BeforeInitMap()
{
	// フラグの状態を取得
	main_num		 = GetNumFlg_("NUM_SCENARIO_MAIN");							// Num0
	prison_num		 = GetNumFlg_("NUM_SCENARIO_SUB_PRISON");					// Num6
	local sky_num	 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");						// Num9
	
	// ライドしたまま移動装置を使って来たらライド強制解除
	if(GetEventFlg_("BFG_RIDE_OFF_USED_TRANSFER") == true){
		//ライド強制解除
		SetRideOffStart_();
	}
	
	//-----------------------------------
	// ▼空間の遊びイベント用のフラグ設定
	//-----------------------------------
	local info = {
		GIMMICK_FLG			 = GIMMICK_FLG,
		GIMMICK_CLEAR_FLG	 = GIMMICK_CLEAR_FLG,
	};
	
	MastersLoad_SetFlag(info);
	
	//-------------------------------
	// ▼凶エスタークイベント用
	//-------------------------------
	// ■進行フラグ
	local status_num = GetNumFlg_("NUM_BREAK_ESTARK_PHASE"); // NUM018
	if(status_num == 2 || status_num == 5){ // NUM013 == 2 or 5
		//ライド強制解除
		SetRideOffStart_();
	}
	
	
	EventEnd_();
}


//------------------------------------------------
//		フェードイン
//------------------------------------------------
function FadeIn()
{
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");			// Num0
	prison_num	 = GetNumFlg_("NUM_SCENARIO_SUB_PRISON");	// Num6
	
	DebugPrint(" ");
	DebugPrint("NUM_SCENARIO_MAIN の値は " + main_num + " になりました。");
	DebugPrint("NUM_SCENARIO_SUB_PRISON の値は " + prison_num + " になりました。");
	
	// ■マップ到達フラグ
	SetEventFlg_("BFG_ARRIVE_AT_S00", true);				// Bit_93 到達フラグ 監獄塔フィールドマップ
	// ■セーブ禁止を解除(セーブ禁止マップから帰ってきた時用)
	SetEventFlg_("BFG_SAVE_PROHIBIT", false);				// セーブ禁止(Bit451)

	// ■時間の設定（イッタブル撃破まで砂嵐・以降クリアまで晴れ）
	if(main_num == GetFlagID_("CONST_SM_PRISON")){			// Num0 = 5
		if(prison_num < GetFlagID_("CONST_SS_PR_INVULNERABILITY_PLAYER")){	// Num6 < 28
			SetTime_(START_TIME_ZONE_NOON);		// 昼
		} else {
			SetTime_(START_TIME_ZONE_NOON);		// 昼
			SetEventFlg_("BFG_S00_00_WEATHER_FIX_BAD", false);
		}
	}
	
	//----------
	// ▼NPC配置
	//----------
	
	// 配置なし
	
	//-----------
	// ▼地雷配置
	//-----------
	// ID初期化
	g_mine_enter_transfer	 <- C_NONE_ID;
	g_mine_exit_transfer	 <- C_NONE_ID;
	g_mine_ruler			 <- C_NONE_ID;
	
	// ■転送装置（凍骨の氷原）
	g_mine_enter_transfer = SetPointCircleEventMine_("mine_enter_transfer", true);
	
	// ■転送装置（焦熱の火山）
	g_mine_exit_transfer = SetPointCircleEventMine_("mine_exit_transfer", true);
	
	// ■ルーラポイント(イッタブル監獄 輸送広間)
	g_mine_ruler = SetPointCircleEventMine_("mine_ruler", true);

	//---------------
	// ▼ギミック配置
	//---------------
	// ID初期化
	g_gmk_rulerpoint		 <- C_NONE_ID;
	
	// リソース読み込み
	local id_transfer		 = ReadGimmick_("o_com_01");		// 転送装置
	local id_rulerpoint		 = ReadGimmick_("o_com_08");		// ルーラポイント
	
	// ■転送装置（凍骨の氷原）
	local gmk_enter_transfer = ArrangePointGimmick_("o_com_01", id_transfer, "gmk_enter_transfer");
	
	// ■転送装置（焦熱の火山）
	local gmk_exit_transfer = ArrangePointGimmick_("o_com_01", id_transfer, "gmk_exit_transfer");
	
	// ■パイプの蓋（閉）
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {							// Num0 = 5
		if(prison_num < GetFlagID_("CONST_SS_PR_ITTABURU_WIN")){				// Num6 < 27
			local id_paipu_close	 = ReadGimmick_("o_S02_21");
			local gmk_paipu_close	 = ArrangePointGimmick_("o_S02_21", id_paipu_close, "gmk_paipu_close");
		}
	}

	// ■パイプの蓋（開）
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {							// Num0 = 5
		if(prison_num > GetFlagID_("CONST_SS_PR_ITTABURU_WIN")){				// Num6 > 27
			local id_paipu_open	 = ReadGimmick_("o_S02_22");
			local gmk_paipu_open = ArrangePointGimmick_("o_S02_22", id_paipu_open, "gmk_paipu_open");
		}
	} else {
		local id_paipu_open	 = ReadGimmick_("o_S02_22");
		local gmk_paipu_open = ArrangePointGimmick_("o_S02_22", id_paipu_open, "gmk_paipu_open");
	}

	// ■ルーラポイント(イッタブル監獄 輸送広間)※仮の位置に置いています
	g_gmk_rulerpoint = ArrangePointGimmick_("o_com_08", id_rulerpoint, "gmk_ruler");
	SetMotion_(g_gmk_rulerpoint, MOT_GIMMICK_0, BLEND_N);
	if(GetEventFlg_("BFG_RULER_ADD_018") == true){				// Bit_218 ルーラ追加 イッタブル監獄 輸送広間
		SetMotion_(g_gmk_rulerpoint, MOT_GIMMICK_2, BLEND_N);
	}

	//-------------------------
	// ▼リアクターポイント配置
	//-------------------------
	// ■移動装置（凍骨の氷原）
	local reactorPoint01 = ArrangeMsgReactorPoint("recPoint_01_transfer", GetFlagID_("BFG_REACTER_POINT_015")// Bit_1514 移動装置
		, SHORT_DIST, "REC_POINT_01", "REC_POINT_01_2");

	// ■移動装置（焦熱の火山）
	local reactorPoint02 = ArrangeMsgReactorPoint("recPoint_02_transfer", GetFlagID_("BFG_REACTER_POINT_015")// Bit_1514 移動装置
		, SHORT_DIST, "REC_POINT_02", "REC_POINT_02_2");

	// ■アロイパーク
	local reactorPoint03 = ArrangeMsgReactorPoint("recPoint_03_park", GetFlagID_("BFG_REACTER_POINT_070")// Bit_1569 アロイパーク
		, SHORT_DIST, "REC_POINT_03", "REC_POINT_03_2");

	// ■コア
	local reactorPoint04 = ArrangeMsgReactorPoint("recPoint_04_core", GetFlagID_("BFG_REACTER_POINT_001")// Bit_1500 コア
		, ENDLESS_DIST, "REC_POINT_04", "REC_POINT_04_2");
	
	// ■ルーラポイント(イッタブル監獄 輸送広間)
	local reactorPoint06 = ArrangeMsgReactorPoint("recPoint_ruler", GetFlagID_("BFG_REACTER_POINT_010")// Bit_1520 ルーラポイント
		, SHORT_DIST, "REC_POINT_06", "REC_POINT_06_2");
	
	// ■天導の柱
	local reactorPoint05 = ArrangeMsgReactorPoint("recPoint_05_keyhole", GetFlagID_("BFG_REACTER_POINT_176")
		, SHORT_DIST, "REC_POINT_07", "REC_POINT_07_2");
	
	//-----------------
	// ▼マップナビ配置
	//-----------------
	// ■目的地
	local navi_park			= ArrangePointNaviMapIcon_(NAVIMAP_ICON.DESTINATION, "map_navi_park");			// アロイパーク
	local navi_ittaburu	 	= ArrangePointNaviMapIcon_(NAVIMAP_ICON.DESTINATION, "map_navi_ittaburu");		// イッタブルの監獄
	local navi_transfer	 	= ArrangePointNaviMapIcon_(NAVIMAP_ICON.DESTINATION, "map_navi_transfer");		// 火山行の移動装置
	SetNaviMapIconVisible_(navi_park, false);
	SetNaviMapIconVisible_(navi_ittaburu, false);
	SetNaviMapIconVisible_(navi_transfer, false);

	if (main_num == GetFlagID_("CONST_SM_PRISON")) {							// Num0 = 5
		if(prison_num < GetFlagID_("CONST_SS_PR_ITTABURU_PRISON_2ND")){			// Num6 < 7
			SetNaviMapIconVisible_(navi_park, true);
		}
		else  if(prison_num > GetFlagID_("CONST_SS_PR_LAST_ANSESU_1ST")){		// Num6 > 30
			SetNaviMapIconVisible_(navi_transfer, true);
		}
	}
	// ■ルーラポイントアイコン
	if(GetEventFlg_("BFG_RULER_ADD_018") == true){				// Bit_218 ルーラ追加 イッタブル監獄 輸送広間
		local ruler_icon = ArrangePointNaviMapIcon_(NAVIMAP_ICON.RULER_POINT , "gmk_ruler");
		SetNaviMapIconVisible_(ruler_icon, true);
	}

	//-----------------------------
	// ▼空間の遊びイベント用の配置
	//-----------------------------
	// ID初期化
	g_keyhole			 <- C_NONE_ID;
	g_keyhole_goal_point <- C_NONE_ID;
	
	g_keyhole_npc		 <- C_NONE_ID;
	
	g_keyhole_mine		 <- C_NONE_ID;
	g_keyhole_goal_mine	 <- C_NONE_ID;
	
	local info = {
		GIMMICK_FLG			 = GIMMICK_FLG,
		GIMMICK_CLEAR_FLG	 = GIMMICK_CLEAR_FLG,
		BOSS_ID_1			 = BOSS_ID_1,
		BOSS_ID_2			 = BOSS_ID_2,
		BOSS_SCALE_1		 = BOSS_SCALE_1,
		BOSS_SILHOUETTE_1	 = BOSS_SILHOUETTE_1,
		BOSS_SCALE_2		 = BOSS_SCALE_2,
		BOSS_SILHOUETTE_2	 = BOSS_SILHOUETTE_2,
	};
	
	MastersLoad_Setting(info);
	
	//-------------------------------
	// ▼凶エスタークイベント用の配置
	//-------------------------------
	// ■進行フラグ
	local status_num = GetNumFlg_("NUM_BREAK_ESTARK_PHASE"); // NUM018
	// モンスターの配置を制限するフラグの切替え(Redmine#2783)
	if(status_num >= 1 && status_num <= 6){ // NUM018 が 1 ～ 6 の時(イベント中の時)
		// イベント中は制限する
		SetEventFlg_("BFG_LIMIT_APPEAR_BREAK_ESTARK", false);
	}
	else{
		// イベント以外は制限しない
		SetEventFlg_("BFG_LIMIT_APPEAR_BREAK_ESTARK", true);
	}
	

	// ■プレイアブル用のNPC配置
	if(status_num == 1 || status_num == 4){ // NUM018 == 1 or 4
		npc_B_Estark = ReadAndArrangePointNpc("m199_00", "e_BreakEstark_npc");
		local mot_B_Estark_Sleep = ReadMotion_(npc_B_Estark, "m199_00_sleep");
		SetMotion_(npc_B_Estark, mot_B_Estark_Sleep, BLEND_N);
		// 寝ているエフェクト
		LoadEffect_("ef320_01_life_zzz");					// ZZZ
		local efc_zzz = SetSelectBoneEffect_("ef320_01_life_zzz", npc_B_Estark, ATTACH_EFFECT1);
		SetEffectScale_(efc_zzz, 6.0);
		SetTalkEnable_(npc_B_Estark, false);
		SetScaleSilhouette(npc_B_Estark, SCALE.T, SILHOUETTE_WIDTH.T);
		SetVisible(npc_B_Estark, true);
		SetReactorMsg_(npc_B_Estark, "NPC_B_ESTARK_REC"); // アナライズメッセージ
	}
	// ■擬似デモ用のNPC配置
	else if(status_num == 2 || status_num == 5){
		npc_B_Estark = ReadAndArrangePointNpc("m199_00", "e_BreakEstark_npc");
		SetTalkEnable_(npc_B_Estark, false);
		SetScaleSilhouette(npc_B_Estark, SCALE.T, SILHOUETTE_WIDTH.T);
		SetVisible(npc_B_Estark, true);
	}

	// ■イベント地雷
	if(status_num == 1 || status_num == 4){
		mine_B_Estark = SetPointBoxEventMine_("e_BreakEstark_npc_mine", false);
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
	
	//-----------------------
	// ▼移動装置を使用した時
	//-----------------------
	if(GetEventFlg_("BFG_RIDE_OFF_USED_TRANSFER") == true){
		UsingTransfer();
		
		// はじめて黒鉄監獄塔に来たとき
		if (main_num == GetFlagID_("CONST_SM_PRISON")) {							// Num0 = 5
			if (prison_num == GetFlagID_("CONST_SS_PR_PRISON_START")) {				// Num6 = 0
				CommSavedAfterTransferDemo("BFG_SCENARIO_CLEAR_ICE", true);
			}
		}
		
		SetEventFlg_("BFG_RIDE_OFF_USED_TRANSFER", false);
	}

	//-----------
	// ▼デモ再生
	//-----------
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_PRISON_START")) {					// Num6 = 0
			SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_PR_GO_TO_THE_PRISON"));	// Num6 <- 1
			
			// Demo400[黒鉄の監獄塔・全景]再生
			EventStartChangeDemo(400, FADE_COLOR_BLACK);
		}
	}
	
	//-------------------------------------------
	// ▼空間の遊びイベント用のカウントダウン表示
	//-------------------------------------------
	local info = {
		GIMMICK_FLG			 = GIMMICK_FLG,
	};
	
	MastersLoad_CountDown(info);
	
	//--------------------------------
	// ▼空間の遊びイベント用の戦闘判定
	//--------------------------------
	local info = {
		GIMMICK_FLG			 = GIMMICK_FLG,
		GIMMICK_CLEAR_FLG	 = GIMMICK_CLEAR_FLG,
		XPOS_1				 = XPOS_1,
		YPOS_1				 = YPOS_1,
		ZPOS_1				 = ZPOS_1,
		DIR_1				 = DIR_1,
		CAMERA_EYE			 = CAMERA_EYE,
		CAMERA_TGT			 = CAMERA_TGT,
		BOSS_EXCHANGE_ID	 = BOSS_EXCHANGE_ID,
		BOSS_PARAMETER_1	 = BOSS_PARAMETER_1,
		BOSS_PARAMETER_2	 = BOSS_PARAMETER_2,
		MAP_ID				 = MAP_ID,
	};
	
	MastersLoad_BattleJudgment(info);

	//-------------------------------
	// ▼凶エスタークイベント
	//-------------------------------
	local status_num = GetNumFlg_("NUM_BREAK_ESTARK_PHASE"); // NUM018
	// 擬似デモ再生
	if(status_num == 2 || status_num == 5){
		uPlayableDemoBreakEstark();
	}
	// 再戦時
	else if(status_num == 4){
		// 特に何もしない
	}
	// 勝敗判定
	else if(status_num == 3 || status_num == 6){
		// 勝利
		if(GetBattleEndType_() == END_TYPE_WIN){
			// フィールドBGMを頭打ち
			SetEventFlg_("BFG_RETURN_BATTLE_FIRLD_BGM_HEAD", true);
			
			// 仲間判定
			uCheckMateBreakEstark();
		}
		else{
			// 敗北はアフターバトルで処理
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
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");			// Num0
	prison_num	 = GetNumFlg_("NUM_SCENARIO_SUB_PRISON");	// Num6
	
	local target = GetTouchEventMineId_();
	
	DebugPrint("ID: " + target + " に接触 [TouchEventMine]");
	
	switch (target) {
	case g_mine_enter_transfer :
		uMineEnterTransfer();
		break;
	case g_mine_exit_transfer :
		uMineExitTransfer();
		break;
	case g_mine_ruler :
		uMineRuler();
		break;
	// 凶エスタークイベント用
	case mine_B_Estark :
		uMineBreakEstark();
		break;
	// 空間の遊び 遺跡スイッチを調べた時
	case g_keyhole_mine :
		local info = {
			GIMMICK_FLG			 = GIMMICK_FLG,
			GIMMICK_CLEAR_FLG	 = GIMMICK_CLEAR_FLG,
			GIMMICK_KEY_ID		 = GIMMICK_KEY_ID,
			GIMMICK_MSG_ID		 = GIMMICK_MSG_ID,
			XPOS_1				 = XPOS_1,
			YPOS_1				 = YPOS_1,
			ZPOS_1				 = ZPOS_1,
			DIR_1				 = DIR_1,
			BOSS_ID_1			 = BOSS_ID_1,
			BOSS_ID_2			 = BOSS_ID_2,
			BOSS_SCALE_1		 = BOSS_SCALE_1,
			BOSS_SILHOUETTE_1	 = BOSS_SILHOUETTE_1,
			BOSS_SCALE_1		 = BOSS_SCALE_2,
			BOSS_SILHOUETTE_1	 = BOSS_SILHOUETTE_2,
			DEMO_NUM			 = DEMO_NUM,
			MAP_ID				 = MAP_ID,
		};
		
		MastersLoad_MineStart(info);
		break;
	// 空間の遊び ゴール地雷
	case g_keyhole_goal_mine :
		local info = {
			GIMMICK_FLG			 = GIMMICK_FLG,
			GIMMICK_CLEAR_FLG	 = GIMMICK_CLEAR_FLG,
			XPOS_2				 = XPOS_2,
			YPOS_2				 = YPOS_2,
			ZPOS_2				 = ZPOS_2,
			DIR_2				 = DIR_2,
			CAMERA_EYE			 = CAMERA_EYE,
			CAMERA_TGT			 = CAMERA_TGT,
			BOSS_EXCHANGE_ID	 = BOSS_EXCHANGE_ID,
			BOSS_PARTY_TABLE_1	 = BOSS_PARTY_TABLE_1,
			BOSS_PARTY_TABLE_2	 = BOSS_PARTY_TABLE_2,
		};
		
		MastersLoad_MineGoal(info);
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
//		転送装置（凍骨の氷原）を調べた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineEnterTransfer()
{
	local return_pos = Vec3(1118.2, 990.4, -3238.7);
	local return_rot = -69;
	local dont_use_transfer = GetEventFlg_("BFG_DONT_TRANSFER_ICE_TO_SAND");// 氷原-砂漠間の大陸移動装置の使用を禁止するフラグ
	
	if(dont_use_transfer == false){
		OpenMsgWnd_();
		ShowMsg_("SYSTEM_MSG_000");			// 大陸移動装置を 使って
		KeyInputWait_();
		
		if(GetQueryResult_() == QUERY2_0){
			CloseMsgWnd_();
			// 大陸移動装置を使って大陸移動した場合、ライドを解除するために使用するフラグ
			SetEventFlg_("BFG_RIDE_OFF_USED_TRANSFER", true);
			// 凍骨の氷原フィールドへ
			ChangeMapPosDir_("I00_00", return_pos, return_rot);
		}
		else{
			CloseMsgWnd_();
		}
	}
	// 移動装置の使用禁止中だった場合
	else{
		// システムメッセージ
		OpenMsgWnd_();
		ShowMsg_("DONT_USE_TRANSFER_010");		// 移動装置は　動いていない。
		KeyInputWait_();
		CloseMsgWnd_();
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		転送装置（焦熱の火山）を調べた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineExitTransfer()
{
	local return_pos = Vec3(1608.0, 133.7, 1395.0);
	local return_rot = -140;
	local dont_use_transfer = GetEventFlg_("BFG_DONT_TRANSFER_SAND_TO_VOLCANO");// 砂漠-火山間の大陸移動装置の使用を禁止するフラグ
	
	if(dont_use_transfer == false){
		if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
			if (prison_num < GetFlagID_("CONST_SS_PR_LAST_ANSESU_6TH")) {				// Num6 < 35
				OpenMsgWnd_();
				ShowMsg_("SYSTEM_MSG_001");		// 大陸移動装置は 動いていない。
				KeyInputWait_();
				CloseMsgWnd_();
			}
			else if (prison_num == GetFlagID_("CONST_SS_PR_LAST_ANSESU_6TH")) {			// Num6 = 35
				DeleteEventMine_(g_mine_exit_transfer);
				
				// Bitフラグ設定
				SetEventFlg_("BFG_S00_00_EVENT_BGM005_PLAY", false);	// Bit_659  BGM_005 を流すかどうか
				SetEventFlg_("BFG_SAVE_POINT_FLAG", true);				// Bit_1033 セーブポイントを挟む
				SetEventFlg_("BFG_RIDE_OFF_USED_TRANSFER", true);		// Bit_1400 ライド解除するかどうか
				
				// Numフラグ設定
				SetNumFlg_("NUM_SCENARIO_MAIN", GetFlagID_("CONST_SM_VOLCANO"));				// Num0 <- 6
				SetNumFlg_("NUM_SCENARIO_SUB_PRISON", GetFlagID_("CONST_SS_PR_PRISON_START"));	// Num6 <- 0
				
				//時空の裂け目レベルを上げる（メタルエリアも含むためココ）
				SetNumFlg_( "NUM_FLG_CRACK_LEVEL", 2 );
				
				// デモ再生後の復帰位置
				SetReturnDemoMap_("V00_00");
				SetReturnDemoPosDir_(return_pos, return_rot);
				
				// Demo429[移動装置使用]再生
				ChangeDemo_(429);
			}
		}
		else {
			OpenMsgWnd_();
			ShowMsg_("SYSTEM_MSG_002");			// 大陸移動装置を 使って
			KeyInputWait_();
			
			if(GetQueryResult_() == QUERY2_0){
				CloseMsgWnd_();
				// ライド状態で大陸移動した場合、ライドを解除するフラグ
				SetEventFlg_("BFG_RIDE_OFF_USED_TRANSFER", true);
				// 焦熱の火山フィールドへ
				ChangeMapPosDir_("V00_00", return_pos, return_rot);
			}
			else{
				CloseMsgWnd_();
			}
		}
	}
	// 移動装置の使用禁止中だった場合
	else{
		// システムメッセージ
		OpenMsgWnd_();
		ShowMsg_("DONT_USE_TRANSFER_010");		// 移動装置は　動いていない。
		KeyInputWait_();
		CloseMsgWnd_();
	}
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
	CommRulerPointEvent(g_gmk_rulerpoint, "BFG_RULER_ADD_018", "gmk_ruler"); 
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//  ローカル関数 : 凶エスターク用地雷の処理
//------------------------------------------------
// 引数   ：なし
// 戻り値 ：なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineBreakEstark()
{
	local status_num = GetNumFlg_("NUM_BREAK_ESTARK_PHASE"); // NUM018
	
	if(status_num == 1){
		SetNumFlg_("NUM_BREAK_ESTARK_PHASE", 2);
	}
	else if(status_num == 4){
		SetNumFlg_("NUM_BREAK_ESTARK_PHASE", 5);
	}
	
	// ライド解除の為、マップチェンジ
	ChangeMapPosDir_("S00_00", Vec3(-35.000, 1350.520, -40.000), 90);
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//  ローカル関数 : 擬似デモ[凶エスタークとの接触]
//------------------------------------------------
// 引数   ：なし
// 戻り値 ：なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uPlayableDemoBreakEstark()
{
	// 進行フラグの状態を取得
	local status_num = GetNumFlg_("NUM_BREAK_ESTARK_PHASE"); // NUM018
	
	// 準備
	local player = GetPlayerId_();
	local pl_pos = Vec3(-35.000, 1350.520, -40.000);
	local pl_dir = 90;
	local rtn_pl_pos = Vec3(-80.000, 1350.420, -40.000); // 復帰位置
	local wait_frame = 27;
	local del_eff_wait = 30; // 寝ているエフェクトが消えるまでのかけるウェイト
	// 暗転
	CommChangeMomentFadeOut(FADE_COLOR_BLACK);
	// 主人公をモンスターの真正面に配置
	SetPos_(player, pl_pos);
	SetDir_(player, pl_dir);
	// 主人公を消す
	SetManualCalcAlpha_(player, true);
	SetAlpha_(player, 0.0);
	//SetCameraDir_(pl_dir);
	// 凶エスタークを寝ているモーションにする。
	local mot_B_Estark_Sleep = ReadMotion_(npc_B_Estark, "m199_00_sleep");
	SetMotion_(npc_B_Estark, mot_B_Estark_Sleep, BLEND_N);
	// 寝ているエフェクト
	LoadEffect_("ef320_01_life_zzz");					// ZZZ
	local efc_zzz = SetSelectBoneEffect_("ef320_01_life_zzz", npc_B_Estark, ATTACH_EFFECT1);
	SetEffectScale_(efc_zzz, 6.0);
	// カメラの設定
	SetPointCameraEye_("cam_eye002");
	SetPointCameraTarget_("cam_target002");
	// 準備が終わったので暗転解除
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();

// 擬似デモ開始
	// メッセージ表示( 初回or再戦で分岐 )
	if(status_num == 2){ // 初回
		OpenMsgWnd_();
		ShowMsg_("BREAK_ESTARK_MSG_000");
		KeyInputWait_();
		CloseMsgWnd_();
		// 寝ているエフェクトを消す
		DeleteEffectEmitter_(efc_zzz); 
		Wait_(del_eff_wait);
		// 起きるモーションに切り替える
		local mot_B_Estark_Wake = ReadMotion_(npc_B_Estark, "m199_00_wake");
		SetMotion_(npc_B_Estark, mot_B_Estark_Wake, BLEND_N);
		WaitMotion(npc_B_Estark);
		SetMotion_(npc_B_Estark, MOT_WAIT, BLEND_N);
		// メッセージの続き
		OpenMsgWnd_();
		ShowMsg_("BREAK_ESTARK_MSG_001");
		KeyInputWait_();
		ShowMsg_("BREAK_ESTARK_MSG_002_01");
		KeyInputWait_();
		SetTalkName_("NAME_TAG_BRAEK_ESTARK");
		ShowMsg_("BREAK_ESTARK_MSG_003");
		KeyInputWait_();
		if(GetQueryResult_() == MES_QUERY_YES){
			if(uCheckEmptyCloakRoom()){
				// 戦闘移行処理
				uBreakEstarkQuestionYes(3, true, wait_frame);
			}
			else{
				// uCheckEmptyCloakRoom()内で預り所の処理を行う
				Wait_(10); // 間を持たせる
				// 戦闘移行処理
				uBreakEstarkQuestionYes(3, false, wait_frame);
			}
		}
		else{
			// メッセージを表示
			ShowMsg_("BREAK_ESTARK_MSG_004");
			KeyInputWait_();
			CloseMsgWnd_();
			// 凶エスターク用の進行フラグを再戦に合わせる
			SetNumFlg_("NUM_BREAK_ESTARK_PHASE", 4);
			// マップチェンジ
			ChangeMapPosDir_("S00_00", rtn_pl_pos, pl_dir);
			Wait_(1);
		}
	}
	else if(status_num == 5){ // 初回以外
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_BRAEK_ESTARK");
		ShowMsg_("BREAK_ESTARK_MSG_000");
		KeyInputWait_();
		CloseMsgWnd_();
		// 寝ているエフェクトを消す
		DeleteEffectEmitter_(efc_zzz);
		Wait_(del_eff_wait);
		// 起きるモーションに切り替える
		local mot_B_Estark_Wake = ReadMotion_(npc_B_Estark, "m199_00_wake");
		SetMotion_(npc_B_Estark, mot_B_Estark_Wake, BLEND_N);
		WaitMotion(npc_B_Estark);
		SetMotion_(npc_B_Estark, MOT_WAIT, BLEND_N);
		// メッセージの続き
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_BRAEK_ESTARK");
		ShowMsg_("BREAK_ESTARK_MSG_001");
		KeyInputWait_();
		ShowMsg_("BREAK_ESTARK_MSG_002_02");
		KeyInputWait_();
		if(GetQueryResult_() == MES_QUERY_YES){
			if(uCheckEmptyCloakRoom()){
				// 戦闘移行処理
				uBreakEstarkQuestionYes(6, true, wait_frame);
			}
			else{
				// uCheckEmptyCloakRoom()内で預り所の処理を行う
				Wait_(10); // 間を持たせる
				// 戦闘移行処理
				uBreakEstarkQuestionYes(6, false, wait_frame);
			}
		}
		else{
			// メッセージを表示
			ShowMsg_("BREAK_ESTARK_MSG_004");
			KeyInputWait_();
			CloseMsgWnd_();
			// 凶エスターク用の進行フラグをる
			SetNumFlg_("NUM_BREAK_ESTARK_PHASE", 4);
			// マップチェンジ
			ChangeMapPosDir_("S00_00", rtn_pl_pos, pl_dir);
			Wait_(1);
		}
	}
}


//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//  ローカル関数 : モンスターの預り所に空きがあるか調べて戻り値を返す。(空きがない場合は預り所を延々と呼び出す)
//-------------------------------------------------------------------------------------------
// 引数   ：なし
// 戻り値 ：true : 空きがある / false : 空きがない
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function uCheckEmptyCloakRoom()
{
	local residue = GetFreeMonsterNum_();
	local empty_num = 0;

	// 空きがない
	if(residue <= empty_num){
		CloseMsgWnd_();
		while(true){
			// ナビマップを非表示
			SetNavimapVisible_(false);
			// 仮メッセージ(システムメッセージ)
			OpenMsgWnd_();
			ShowMsg_("BREAK_ESTARK_MSG_NOT_EMPTY");
			KeyInputWait_();
			CloseMsgWnd_();
			// すぐに暗転解除
			SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, FADE_SHORT);
			// 預り所を呼び出す
			GotoMenuFadeOpen(MENU_OPEN.LUGGAGE_OFFICE);
			// 再チェック
			residue = GetFreeMonsterNum_();
			if(residue > empty_num){
				// １体でも空きが出来たら抜ける
				break;
			}
		}
		// すぐに暗転
		SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
		// ナビマップを表示
		SetNavimapVisible_(true);
		return false;
	}
	// 空きがある
	else{
		return true;
	}
}


//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//  自作関数 : 凶エスタークの質問で「はい」を選んだときの戦闘移行処理
//-------------------------------------------------------------------
// 第一引数：進行フラグの定数( 初回 : 3 / 再戦 : 6 を代入)
// 第二引数：預かり所チェックのフラグ( 直設定でお願いします )
// 第三引数：凶エスタークのアタックモーション待ちのフレーム数
// 戻り値  ：なし
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function uBreakEstarkQuestionYes(flg_num, flg, frame)
{
	// 預かり所を経由したかチェック(経由した場合は「false」を通る)
	if(flg == false){
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_BRAEK_ESTARK");
	}
	// メッセージを表示
	ShowMsg_("BREAK_ESTARK_MSG_005");
	KeyInputWait_();
	CloseMsgWnd_();
	// 凶エスターク用の進行フラグを進める
	SetNumFlg_("NUM_BREAK_ESTARK_PHASE", flg_num);
	// 戦闘モーション
	PlaySE_("SE_FLD_074");
	SetMotion_(npc_B_Estark, MOT_ATTACK, BLEND_N);
	Wait_(frame);
	//周囲の徘徊モンスターを削除
	InhibitMonsterGenerate_( 10000.0 );
	// 戦闘開始(ブラーの指定は東藤さんに)
	ChangeBattleParty_(132);
}

//+++++++++++++++++++++++++++++++++++++++++++++++++
//  ローカル関数 : 擬似デモ[凶エスタークとの戦闘後]
//-------------------------------------------------
// 引数   ：なし
// 戻り値 ：なし
//+++++++++++++++++++++++++++++++++++++++++++++++++
function uCheckMateBreakEstark()
{
	// 進行フラグの状態を取得
	local status_num = GetNumFlg_("NUM_BREAK_ESTARK_PHASE"); // NUM018
	// 準備
	local player = GetPlayerId_();
	local pl_pos = Vec3(-35.000, 1350.520, -40.000);
	local pl_dir = 90;
	local rtn_pl_pos = Vec3(-80.000, 1350.420, -40.000); // 復帰位置
	local wait_frame = 30;
	// 暗転
	CommChangeMomentFadeOut(FADE_COLOR_BLACK);
	// 主人公をモンスターの真正面に配置
	SetPos_(player, pl_pos);
	SetDir_(player, pl_dir);
	// 主人公を消す
	SetManualCalcAlpha_(player, true);
	SetAlpha_(player, 0.0);
	//SetCameraDir_(pl_dir);
	// カメラの設定
	SetPointCameraEye_("cam_eye002");
	SetPointCameraTarget_("cam_target002");
	// 準備が終わったので暗転解除
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();

// 擬似デモ開始
	local lmt_round = GetBattleRound_();
	DebugPrint("戦闘終了ターン数は " + lmt_round + " ターンです。");
	// 規定ターン数(10ラウンドは可)以内で勝利
	if(lmt_round <= 10){
		// メッセージを表示
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_BRAEK_ESTARK");
		SetExchangeNumber_(lmt_round);
		ShowMsg_("BREAK_ESTARK_MSG_006_CLEAR");
		KeyInputWait_();
		ShowMsg_("BREAK_ESTARK_MSG_006_01");
		KeyInputWait_();
		CloseMsgWnd_();
		// 仲間になったメッセージ
		OpenMsgWnd_();
		ShowMsg_("BREAK_ESTARK_MSG_007");
		// 仲間ME
		PlayMe_("ME_010");
		WaitMe_();
		KeyInputWait_();
		CloseMsgWnd_();
		// 名前付け画面へ移行
		local tsk_named_wnd = Task_AddFellow_(BREAK_MONSTER_06_E_ID, false);
		WaitTask(tsk_named_wnd);
		// 暗転
		SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
		WaitFade_();
		// プレイヤーを映す
		SetVisible(player, true);
		// 凶エスタークの表示を元に戻す
		SetManualCalcAlpha_(npc_B_Estark, true);
		SetAlpha_(npc_B_Estark, 1.0);
		// 凶エスターク用の進行フラグを戻す
		SetNumFlg_("NUM_BREAK_ESTARK_PHASE", 7);
	}
	else{
		// メッセージを表示
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_BRAEK_ESTARK");
		SetExchangeNumber_(lmt_round);
		ShowMsg_("BREAK_ESTARK_MSG_006_NOTCLEAR");
		KeyInputWait_();
		ShowMsg_("BREAK_ESTARK_MSG_006_02");
		KeyInputWait_();
		CloseMsgWnd_();
		// 暗転
		SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
		WaitFade_();
		// 凶エスタークの表示を元に戻す
		SetManualCalcAlpha_(npc_B_Estark, true);
		SetAlpha_(npc_B_Estark, 1.0);
		// 凶エスターク用の進行フラグを戻す
		SetNumFlg_("NUM_BREAK_ESTARK_PHASE", 4);
	}
	// 擬似デモでカメラを調整したのでデフォルトに戻しておく
	SetPlayableCamera_();
	// マップチェンジ
	ChangeMapPosDir_("S00_00", rtn_pl_pos, pl_dir);
	Wait_(1);
}


