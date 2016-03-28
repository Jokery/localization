//===================== V00_00焦熱の火山 ====================
//---------------------------------
// ▼空間の遊びで使用する定数
//---------------------------------
// ギミックの起動とクリアフラグ
const GIMMICK_FLG			 = "BFG_SPACE_GIMMICK_VOLCANO";
const GIMMICK_CLEAR_FLG		 = "BFG_SPACE_GIMMICK_VOLCANO_1ST_CLEAR";

// 主人公の復帰位置と向き
const XPOS_1				 = -90.593;		// 遺跡スイッチ付近
const YPOS_1				 = 1370.699;
const ZPOS_1				 = -1837.342;
const DIR_1					 = 86;

const XPOS_2				 = 2002.0;		// ゴールボスの手前
const YPOS_2				 = 1300.0;
const ZPOS_2				 = 1445.0;
const DIR_2					 = 148;

// 擬似デモで使用するカメラのノード名
const CAMERA_EYE			 = "cameye_001";
const CAMERA_TGT			 = "camtgt_001";

// 遺跡スイッチを起動させる為の鍵ID
const GIMMICK_KEY_ID		 = 906;

// 遺跡スイッチを起動させた時のメッセージID
const GIMMICK_MSG_ID		 = "MASTERS_LOAD_REACTOR_MSG_013";

// 遺跡スイッチ起動後の再生デモナンバー
const DEMO_NUM				 = 535;

// ボスモンスターのID (1=初回, 2=2回目以降)
const BOSS_ID_1				 = "m079_00";	// おにこんぼう
const BOSS_ID_2				 = "m079_00";	// おにこんぼう

// ボスモンスターのExchange用ID
const BOSS_EXCHANGE_ID		 = 245;			// おにこんぼう

// ボスモンスターのスケールと輪郭幅の設定 (1=初回, 2=2回目以降)
//【Nサイズ】スケール=0.6, シルエット幅=0.8
//【Mサイズ】スケール=1.0, シルエット幅=1.0
//【Gサイズ】スケール=2.5, シルエット幅=1.0
//【Tサイズ】スケール=6.0, シルエット幅=1.0
const BOSS_SCALE_1			 = 2.5;
const BOSS_SILHOUETTE_1		 = 1.0;
const BOSS_SCALE_2			 = 2.5;
const BOSS_SILHOUETTE_2		 = 1.0;

// ボス戦の敵パーティテーブル (1=初回, 2=2回目以降)
const BOSS_PARTY_TABLE_1	 = 163;
const BOSS_PARTY_TABLE_2	 = 163;

// ボスを仲間にする際のモンスターパラメータ (1=初回, 2=2回目以降)
const BOSS_PARAMETER_1		 = 1811;
const BOSS_PARAMETER_2		 = 1811;

// ボス仲間後のマップチェンジID
const MAP_ID				 = "V00_00";



// 変数定義
main_num	 <- C_NONE_ID;
volcano_num	 <- C_NONE_ID;

str_num_sub <- "NUM_SCENARIO_SUB_VOLCANO";


//------------------------------------------------
//		戦闘終了後
//------------------------------------------------
function AfterBattle()
{
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");
	volcano_num	 = GetNumFlg_("NUM_SCENARIO_SUB_VOLCANO");
	
	// デスバーンに負けた時にNUMフラグを変更する処理（要注意）
	// イベントブロックのEventStartOperate()では敗北を判定できないので
	// ここで敗北の判定とフラグ変更を行う。
	if (main_num == GetFlagID_("CONST_SM_VOLCANO")) {									// Num0 = 6
		if (volcano_num == GetFlagID_("CONST_SS_HV_JDG_BATTLE_DEATHBURN")) {			// Num7 = 20
			// デスバーンに敗北
			if(GetBattleEndType_() == END_TYPE_LOSE){
				SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_HV_CONTACT_DEATHBURN"));	// Num7 <- 21
			}
		}
		//再戦時
		if (volcano_num == GetFlagID_("CONST_SS_HV_JDG_REMATCH_DEATHBURN")) {			// Num7 = 23
			// デスバーンに敗北
			if(GetBattleEndType_() == END_TYPE_LOSE){
				SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_HV_CONTACT_DEATHBURN"));	// Num7 <- 21
			}
		}
	}
	
	
	//---------------------------------
	// ▼空間の遊びイベント用のフラグ
	//---------------------------------
	local info = {
		GIMMICK_FLG			 = GIMMICK_FLG,
	};
	
	MastersLoad_AfterBattle(info);
	
	
	EventEnd_();
}
//------------------------------------------------
//		マップに入る前
//------------------------------------------------
function BeforeInitMap()
{
	// フラグの状態を取得
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");
	volcano_num	 = GetNumFlg_("NUM_SCENARIO_SUB_VOLCANO");
	local sky_num	 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");						// Num9
	
	// Demo505[飛べない！]の再生後とDemo517[バーディの飛翔]の再生後はライドの解除を行う
	if(main_num == GetFlagID_("CONST_SM_VOLCANO")){
		if(volcano_num == GetFlagID_("CONST_SS_HV_BIRDY_NEAR_THE_MONOLITH")
		|| volcano_num == GetFlagID_("CONST_SS_HV_GO_TO_THE_RED_WALL")){
			//ライド強制解除
			SetRideOffStart_();
		}
	}
	
	// ライドしたまま移動装置を使って来たらライド強制解除
	if(GetEventFlg_("BFG_RIDE_OFF_USED_TRANSFER") == true){
		//ライド強制解除
		SetRideOffStart_();
	}
	
	// 擬似デモ[秘密のモノリス]再生前にライド解除
	if(GetEventFlg_("BFG_PLAY_PSEUDO_DEMO_VOLCANO") == true){
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
	
	EventEnd_();
}
//------------------------------------------------
//		フェードアウト中
//------------------------------------------------
function FadeIn()
{
	// マップ到達フラグ
	SetEventFlg_("BFG_ARRIVE_AT_V00", true);
	// セーブ禁止を解除(セーブ禁止マップから帰ってきた時用)
	SetEventFlg_("BFG_SAVE_PROHIBIT", false);		// セーブ禁止(Bit451)

	main_num				= GetNumFlg_("NUM_SCENARIO_MAIN");
	volcano_num				= GetNumFlg_("NUM_SCENARIO_SUB_VOLCANO");
	
	DebugPrint(" ");
	DebugPrint("NUM_SCENARIO_MAIN の値は " + main_num + " になりました。");
	DebugPrint("NUM_SCENARIO_SUB_VOLCANO の値は " + volcano_num + " になりました。");

	//------------------------------------
	//  火山シナリオクリア後に設定するもの
	//------------------------------------
	if(GetEventFlg_("BFG_SCENARIO_CLEAR_VOLCANO") == true){
		SetEventFlg_("BFG_V00_00_WEATHER_FIX_BAD", false);	// 悪天候固定フラグを降ろす
		SetEventFlg_("BFG_V00_00_EVENT_BGM006_PLAY", false);// 晴天でしか BGM006 が流れないようにする
	}
	
	//----------------------------------------------------------------------
	// ▼BGM変更フラグの切替(1.天候変化はFadeIn()の▼天候変化で行っています)
	//                      (2.火山のシナリオ中は悪天候でもBGM006が流れる)
	//                      (3.コアのシナリオに突入したらフラグ「BFG_V00_00_EVENT_BGM006_PLAY」はfalseにする)
	//----------------------------------------------------------------------
	if(main_num == GetFlagID_("CONST_SM_VOLCANO")) {					// Num0 == 6
		if(volcano_num == GetFlagID_("CONST_SS_HV_GO_TO_THE_VOLCANO")){ // Num7 == 1
			// Demo500[焦熱の火山・全景]の再生後にBGM変更（悪天候でも BGM006 を再生するようにする）
			SetEventFlg_("BFG_V00_00_EVENT_BGM006_PLAY", true);
		}
	}

	//---------------
	// ▼ギミック配置
	//---------------
	// ID初期化
	g_gim_monolith        <- C_NONE_ID;
	g_gim_rulerpoint01    <- C_NONE_ID;
	g_gim_rulerpoint02    <- C_NONE_ID;
	g_gim_rulerpoint03    <- C_NONE_ID;
	g_gim_transfer_device <- C_NONE_ID;
	g_gim_rockdoor        <- C_NONE_ID;
	g_gim_kui01           <- C_NONE_ID;
	g_gim_kui02           <- C_NONE_ID;
	g_gim_door01          <- C_NONE_ID;
	g_gim_door02          <- C_NONE_ID;
	g_gim_lift            <- C_NONE_ID;
	g_gim_opendevice      <- C_NONE_ID;

	// リソース読み込み
	local id_monojith	 = ReadGimmick_("o_com_02");		// モノリス
	local id_ruler		 = ReadGimmick_("o_com_08");		// ルーラポイント
	local id_transfer	 = ReadGimmick_("o_com_01");		// 移動装置
	local id_kui		 = ReadGimmick_("o_V00_04");		// 大きな杭
	local id_door		 = ReadGimmick_("o_V00_05");		// 発射台の扉
	local id_lift		 = ReadGimmick_("o_V00_06");		// 発射台のリフト
	local id_opendevice	 = ReadGimmick_("o_V00_11");		// 認証装置

	// ■モノリス
	g_gim_monolith = ArrangePointGimmick_("o_com_02", id_monojith, "g_monolith");

	// ■大陸移動装置(黒鉄の監獄塔行)
	g_gim_transfer_device = ArrangePointGimmick_("o_com_01", id_transfer, "g_transfer01");

	// ■ルーラポイント(山頂)
	g_gim_rulerpoint01 = ArrangePointGimmick_("o_com_08", id_ruler, "g_ruler01");
	SetMotion_(g_gim_rulerpoint01, MOT_GIMMICK_0, BLEND_N);
	if(GetEventFlg_("BFG_RULER_ADD_021") == true){
		SetMotion_(g_gim_rulerpoint01, MOT_GIMMICK_2, BLEND_N);
	}

	// ■ルーラポイント(秘密基地入口)
	g_gim_rulerpoint02 = ArrangePointGimmick_("o_com_08", id_ruler, "g_ruler02");
	SetMotion_(g_gim_rulerpoint02, MOT_GIMMICK_0, BLEND_N);
	if(GetEventFlg_("BFG_RULER_ADD_022") == true){
		SetMotion_(g_gim_rulerpoint02, MOT_GIMMICK_2, BLEND_N);
	}

	// ■ルーラポイント(中腹)
	g_gim_rulerpoint03 = ArrangePointGimmick_("o_com_08", id_ruler, "g_ruler03");
	SetMotion_(g_gim_rulerpoint03, MOT_GIMMICK_0, BLEND_N);
	if(GetEventFlg_("BFG_RULER_ADD_032") == true){
		SetMotion_(g_gim_rulerpoint03, MOT_GIMMICK_2, BLEND_N);
	}

	// ■岩壁
	if (main_num == GetFlagID_("CONST_SM_VOLCANO")) {								// Num0 = 6
		if (volcano_num <= GetFlagID_("CONST_SS_HV_JDG_REMATCH_DEATHBURN")) {		// Num7 < 25
			local id_rockdoor = ReadGimmick_("o_V00_03");
			g_gim_rockdoor = ArrangePointGimmick_("o_V00_03", id_rockdoor, "g_rockdoor");
		}
	}

	// ■大きな杭
	//g_gim_kui01 = ArrangePointGimmick_("o_V00_04", id_kui, "gmk_kui01");
	//g_gim_kui02 = ArrangePointGimmick_("o_V00_04", id_kui, "gmk_kui02");

	// ■発射台の扉
	g_gim_door01 = ArrangePointGimmick_("o_V00_05", id_door, "gmk_door01");
	g_gim_door02 = ArrangePointGimmick_("o_V00_05", id_door, "gmk_door02");

	// ■発射台のリフト
	g_gim_lift = ArrangePointGimmick_("o_V00_06", id_lift, "gmk_lift");
	SetMotion_(g_gim_lift, MOT_GIMMICK_2, BLEND_N);
	if(main_num == GetFlagID_("CONST_SM_VOLCANO")){
		if(volcano_num <= GetFlagID_("CONST_SS_HV_PRE_LAUNCH_PAD_DEMO_5")){// Num7 39まで
			SetMotion_(g_gim_lift, MOT_GIMMICK_0, BLEND_N);
		}
	}

	// ■認証装置
	g_gim_opendevice = ArrangePointGimmick_("o_V00_11", id_opendevice, "g_opendevice");
	SetMotion_(g_gim_opendevice, MOT_GIMMICK_3, BLEND_N);
	if(main_num == GetFlagID_("CONST_SM_VOLCANO")){
		if(volcano_num <= GetFlagID_("CONST_SS_HV_JDG_REMATCH_DEATHBURN")){// Num7 23まで
			SetMotion_(g_gim_opendevice, MOT_GIMMICK_0, BLEND_N);
		}
	}
	
	
	//----------
	// ▼NPC配置
	//----------
	// ID初期化
	g_birdy     <- C_NONE_ID;
	g_deathburn <- C_NONE_ID;

	// ■バーディ
	if (main_num == GetFlagID_("CONST_SM_VOLCANO")) {								// Num0 = 6
		if (volcano_num > GetFlagID_("CONST_SS_HV_CLIMBING_THE_VOLCANO")			// Num7 > 5
		&& volcano_num < GetFlagID_("CONST_SS_VC_PRE_HELP_GIRL_DEMO")) {			// Num7 < 16
			// リソース読み込みと配置
			local id_birdy ="n019";
			g_birdy = ReadAndArrangePointNpc(id_birdy, "birdy01");
			// NPCの設定
			SetReactorMsg_(g_birdy, "VOLCANO_BIRDY_REC");				// リアクターメッセージ
			SetScaleSilhouette(g_birdy, SCALE.N, SILHOUETTE_WIDTH.N);	// サイズの設定
			if(volcano_num == GetFlagID_("CONST_SS_HV_BIRDY_NEAR_THE_MONOLITH")){ // Num7 = 6
				SetTalkEnable_(g_birdy, false); // 会話できない
			}
			else{
				SetTalkEnable_(g_birdy, true); // 会話できる
				SetTalkCameraType_(g_birdy, TALK_CAMERA_UP); // カメラの設定
			}
		}
		else if(volcano_num == GetFlagID_("CONST_SS_HV_GO_TO_THE_RED_WALL")			// Num7 = 18
			 || volcano_num == GetFlagID_("CONST_SS_HV_CONTACT_DEATHBURN")			// Num7 = 21
			 || volcano_num == GetFlagID_("CONST_SS_HV_FIND_OUT_AUTHEN_SYSTEM")		// Num7 = 24
			 || volcano_num == GetFlagID_("CONST_SS_HV_ENTER_THE_ALIAS_ROOM")) {	// Num7 = 25
			// リソース読み込みと配置
			local id_birdy ="n019";
			if(volcano_num == GetFlagID_("CONST_SS_HV_FIND_OUT_AUTHEN_SYSTEM")	// Num7 = 24
			|| volcano_num == GetFlagID_("CONST_SS_HV_ENTER_THE_ALIAS_ROOM")){	// Num7 = 25
				g_birdy = ReadAndArrangePointNpc(id_birdy, "birdy03");
			}
			else{
				g_birdy = ReadAndArrangePointNpc(id_birdy, "birdy02");
			}
			// NPCの設定
			SetReactorMsg_(g_birdy, "VOLCANO_BIRDY_REC");				// リアクターメッセージ
			SetTalkCameraType_(g_birdy, TALK_CAMERA_UP);				// カメラの設定
			SetScaleSilhouette(g_birdy, SCALE.N, SILHOUETTE_WIDTH.N);	// サイズの設定
			if(volcano_num == GetFlagID_("CONST_SS_HV_GO_TO_THE_RED_WALL")){
				SetDirToPlayer_(g_birdy);
			}
			else if(volcano_num == GetFlagID_("CONST_SS_HV_CONTACT_DEATHBURN")){
				SetTalkEnable_(g_birdy, false);
			}
		}
	}
	
	//-----------
	// ▼地雷配置
	//-----------
	// ID初期化
	g_mine_transfer01	 <- C_NONE_ID;
	g_mine_monolith		 <- C_NONE_ID;
	g_mine_ruler_01		 <- C_NONE_ID;
	g_mine_ruler_02		 <- C_NONE_ID;
	g_mine_ruler_03		 <- C_NONE_ID;
	g_mine01_01			 <- C_NONE_ID;
	g_mine01_02			 <- C_NONE_ID;
	g_mine02_01			 <- C_NONE_ID;
	g_mine02_02			 <- C_NONE_ID;
	g_mine03			 <- C_NONE_ID;
	g_mine04			 <- C_NONE_ID;
	g_mine06			 <- C_NONE_ID;
	g_mine07			 <- C_NONE_ID;
	g_mine_lift			 <- C_NONE_ID;
	g_mine_keyhole		 <- C_NONE_ID;
	g_mine_keyhole_np 	 <- C_NONE_ID;
	
	// ■大陸移動装置(黒鉄の監獄塔行)
	g_mine_transfer01	 = SetPointCircleEventMine_("mine_transfer01", true);

	// ■モノリス
	g_mine_monolith		 = SetPointCircleEventMine_("mine_monolith", true);

	// ■ルーラポイント(山頂)
	g_mine_ruler_01		 = SetPointCircleEventMine_("mine_ruler01", true);

	// ■ルーラポイント(秘密基地入口)
	g_mine_ruler_02		 = SetPointCircleEventMine_("mine_ruler02", true);

	// ■ルーラポイント(中腹)
	g_mine_ruler_03		 = SetPointCircleEventMine_("mine_ruler03", true);

	if (main_num == GetFlagID_("CONST_SM_VOLCANO")) {								// Num0 = 6
		if (volcano_num == GetFlagID_("CONST_SS_HV_GO_TO_THE_VOLCANO")) {			// Num7 = 1
			// ■マグマパーク入り口でデモ501[地下のシェルターの町]を再生する地雷(旧)
//			g_mine01 = SetPointCircleEventMine_("mine01", false);    // (旧)
			g_mine01_01 = SetPointBoxEventMine_("mine01_01", false); // (新)
			g_mine01_02 = SetPointBoxEventMine_("mine01_02", false); // (新)
		}
		if (volcano_num == GetFlagID_("CONST_SS_HV_CLIMBING_THE_VOLCANO")) {		// Num7 = 5
			// ■山頂付近でデモ505[飛べない！]を再生する地雷
			g_mine02_01 = SetPointBoxEventMine_("mine02_01", false);
			g_mine02_02 = SetPointBoxEventMine_("mine02_02", false);
		}
		if (volcano_num == GetFlagID_("CONST_SS_HV_BIRDY_NEAR_THE_MONOLITH")) {		// Num7 = 6
			// ■山頂付近でデモ506[秘密のモノリス]を再生する地雷
			g_mine03 = SetPointCircleEventMine_("mine03", false);
		}
		if (volcano_num == GetFlagID_("CONST_SS_HV_GO_TO_THE_RED_WALL")) {			// Num7 = 18
			// ■赤い壁付近でデモ518[対決・デスバーン]を再生する地雷
			g_mine04 = SetPointCircleEventMine_("mine04", true);
		}
		if (volcano_num == GetFlagID_("CONST_SS_HV_CONTACT_DEATHBURN")) {			// Num7 = 21
			// ■バーディ付近でデモ519[デスバーン再戦]を再生する地雷
			g_mine07 = SetPointCircleEventMine_("mine07", false);
		}
		if (volcano_num == GetFlagID_("CONST_SS_HV_GO_TO_THE_TOEWR")) {				// Num7 = 40
			// ■移動装置に触れデモ533[火山の移動装置使用]を再生する地雷
			g_mine06 = SetPointCircleEventMine_("mine06", false);
		}
	}
	// ■リフト起動地雷
	if (main_num >= GetFlagID_("CONST_SM_CORE")) {								// Num0 >= 7
		g_mine_lift = SetPointCircleEventMine_("mine_lift", true);
	}
	
	
	
	//--------------------
	//▼リアクターポイント
	//--------------------
	// 巨大な機械
	local reactorPoint01 = ArrangeMsgReactorPoint("reactorPoint07", GetFlagID_("BFG_REACTER_POINT_081")
		, SHORT_DIST, "REC_POINT_01_01", "REC_POINT_01_02");
	// モノリスゲート
	local reactorPoint02 = ArrangeMsgReactorPoint("reactorPoint03", GetFlagID_("BFG_REACTER_POINT_013")
		, SHORT_DIST, "REC_POINT_02_01", "REC_POINT_02_02");
	// 秘密基地
	local reactorPoint03 = ArrangeMsgReactorPoint("reactorPoint08", GetFlagID_("BFG_REACTER_POINT_082")
		, SHORT_DIST, "REC_POINT_03_01", "REC_POINT_03_02");
	// マグマパーク
	local reactorPoint04 = ArrangeMsgReactorPoint("reactorPoint05", GetFlagID_("BFG_REACTER_POINT_083")
		, SHORT_DIST, "REC_POINT_04_01", "REC_POINT_04_02");
	// 移動装置(黒鉄の監獄塔行き)
	local reactorPoint01 = ArrangeMsgReactorPoint("reactorPoint01", GetFlagID_("BFG_REACTER_POINT_015")
		, SHORT_DIST, "REC_POINT_05_01", "REC_POINT_05_02");
	// コア
	local reactorPoint06 = ArrangeMsgReactorPoint("reactorPoint06", GetFlagID_("BFG_REACTER_POINT_001")
		, ENDLESS_DIST, "REC_POINT_06_01", "REC_POINT_06_02");
	// ルーラポイント(山頂)
	local reactorPoint07 = ArrangeMsgReactorPoint("reactorPoint02", GetFlagID_("BFG_REACTER_POINT_010")
		, SHORT_DIST, "REC_POINT_07_01", "REC_POINT_07_02");
	// ルーラポイント(秘密基地前)
	local reactorPoint08 = ArrangeMsgReactorPoint("reactorPoint09", GetFlagID_("BFG_REACTER_POINT_010")
		, SHORT_DIST, "REC_POINT_07_01", "REC_POINT_07_02");
	// ルーラポイント(中腹)
	local reactorPoint09 = ArrangeMsgReactorPoint("reactorPoint10", GetFlagID_("BFG_REACTER_POINT_010")
		, SHORT_DIST, "REC_POINT_07_01", "REC_POINT_07_02");
	// 天導の柱
	local reactorPoint10 = ArrangeMsgReactorPoint("reactorPoint11", GetFlagID_("BFG_REACTER_POINT_176")
		, SHORT_DIST, "REC_POINT_08_01", "REC_POINT_08_02");
	
	//----------------------------
	//▼マップナビアイコン(！など)
	//----------------------------
	// ■目的地
	local mapNavi01 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.DESTINATION, "mapNavi01"); // マグマパーク
	SetNaviMapIconVisible_(mapNavi01, false);
	local mapNavi02 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.DESTINATION, "mapNavi02"); // 山頂(モノリス)
	SetNaviMapIconVisible_(mapNavi02, false);
	local mapNavi03 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.DESTINATION, "mapNavi03"); // 秘密基地入口
	SetNaviMapIconVisible_(mapNavi03, false);
	local mapNavi04 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.DESTINATION, "mapNavi04"); // 強大な装置(移動装置)
	SetNaviMapIconVisible_(mapNavi04, false);
	if(main_num == GetFlagID_("CONST_SM_VOLCANO")){							// Num0 = 6
		// 焦熱の火山到着～バーディの家でバーディと話すまで
		if(volcano_num <= GetFlagID_("CONST_SS_HV_GO_TO_THE_BIRDY_HOUSE")){
			SetNaviMapIconVisible_(mapNavi01, true);
		}
		// バーディの家でバーディと話す～低空ライド入手まで
		else if(volcano_num >= GetFlagID_("CONST_SS_HV_CLIMBING_THE_VOLCANO")
		&& volcano_num <= GetFlagID_("CONST_SS_HV_GO_BACK_THE_VOLCANO")){
			SetNaviMapIconVisible_(mapNavi02, true);
		}
		// 低空ライド入手～コア突入準備完了まで
		else if(volcano_num >= GetFlagID_("CONST_SS_HV_GO_TO_THE_RED_WALL")
		&& volcano_num <= GetFlagID_("CONST_SS_HV_PRE_LAUNCH_PAD_DEMO_5")){
			SetNaviMapIconVisible_(mapNavi03, true);
		}
		// コア突入準備完了～コアに行くまで
		else{
			SetNaviMapIconVisible_(mapNavi04, true);
		}
	}
	
	// ■「！」アイコン
	if(main_num == GetFlagID_("CONST_SM_VOLCANO")){
		if(volcano_num == GetFlagID_("CONST_SS_HV_GO_TO_THE_RED_WALL")){ // Num7 = 18
			local exclamation01 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "g_opendevice"); // 認証装置
			SetNaviMapIconVisible_(exclamation01, true);
		}
	}
	
	// ■モノリス(マップチェンジアイコンがないので常駐表示)
	if(!(main_num == GetFlagID_("CONST_SM_VOLCANO") 
	&& volcano_num <= GetFlagID_("CONST_SS_HV_CLIMBING_THE_VOLCANO"))){
		local exclamation01 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "g_monolith");
		SetNaviMapIconVisible_(exclamation01, true);
	}
	
	// ■ルーラポイント(山頂)
	if(GetEventFlg_("BFG_RULER_ADD_021") == true){
		local icon_ruler_01 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.RULER_POINT , "g_ruler01");
		SetNaviMapIconVisible_(icon_ruler_01, true);
	}
	
	// ■ルーラポイント(秘密基地前)
	if(GetEventFlg_("BFG_RULER_ADD_022") == true){
		local icon_ruler_02 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.RULER_POINT , "g_ruler02");
		SetNaviMapIconVisible_(icon_ruler_02, true);
	}
	
	// ■ルーラポイント(中腹)
	if(GetEventFlg_("BFG_RULER_ADD_032") == true){
		local icon_ruler_03 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.RULER_POINT , "g_ruler03");
		SetNaviMapIconVisible_(icon_ruler_03, true);
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
	
	
	EventEnd_();
}	
//------------------------------------------------
//		フィールド操作開始
//------------------------------------------------
function EventStartOperate()
{
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");			// Num0
	volcano_num	 = GetNumFlg_("NUM_SCENARIO_SUB_VOLCANO");	// Num7

	//-----------------------
	// ▼移動装置を使用した時
	//-----------------------
	if(GetEventFlg_("BFG_RIDE_OFF_USED_TRANSFER") == true){
		UsingTransfer();
		
		// はじめて焦熱の火山に来たとき
		if(main_num == GetFlagID_("CONST_SM_VOLCANO")){
			if(volcano_num == 0){
				local shop_lv = 2;
				CommShopLevelChange(shop_lv);
				CommSavedAfterTransferDemo("BFG_SCENARIO_CLEAR_SAND");
			}
		}
		
		SetEventFlg_("BFG_RIDE_OFF_USED_TRANSFER", false);
	}

	//-----------------
	// ▼アニメーション
	//-----------------
	// モノリス(「起動前待機」のアニメを設定)
	SetMotion_(g_gim_monolith, MOT_GIMMICK_0, 0);
	DebugPrint("モノリスのアニメはGIMMICK_0です");
	if(GetEventFlg_("BFG_START_A_MONOLITH") == true){
		// モノリスの起動後待機アニメを再生
		SetMotion_(g_gim_monolith, MOT_GIMMICK_2, BLEND_N);
		DebugPrint("モノリスのアニメはGIMMICK_2です");
	}

	//-----------------
	// ▼擬似デモの再生
	//-----------------
	// 擬似デモ再生フラグのチェック
	if(GetEventFlg_("BFG_PLAY_PSEUDO_DEMO_VOLCANO") == true){
		if(main_num == GetFlagID_("CONST_SM_VOLCANO")) {							// Num0 = 6
			if(volcano_num == GetFlagID_("CONST_SS_HV_BIRDY_NEAR_THE_MONOLITH")){	// Num7 = 6
				SetEventFlg_("BFG_PLAY_PSEUDO_DEMO_VOLCANO", false);
				// 擬似デモ[秘密のモノリス]の再生
				uMineDemo506();
			}
		}
	}

	//-------------
	// ▼デモの再生
	//-------------
	if (main_num == GetFlagID_("CONST_SM_VOLCANO")) {								// Num0 = 6
		//はじめて焦熱の火山に入った時のデモ
		if (volcano_num == 0) {
			SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_HV_GO_TO_THE_VOLCANO"));	// Num7 <- 1
			// デモの復帰位置をデモの完成後に設定します
			SetReturnDemoPosDir_(Vec3(1607.939, 158.280, 1395.642), -141);
			// Demo500[焦熱の火山・全景]再生
			EventStartChangeDemo(500, FADE_COLOR_BLACK);
		}
		//Aランクライセンス獲得後、モノリスから戻った時のデモ
		if (volcano_num == GetFlagID_("CONST_SS_HV_GO_BACK_THE_VOLCANO")) {			// Num7 = 17
			SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_HV_GO_TO_THE_RED_WALL"));	// Num7 <- 18
			// 山頂付近のモンスターで配置を解禁するフラグ
			SetEventFlg_("BFG_LIMIT_ELPIS_SUMMIT", true);
			// Demo517[バーディの飛翔]再生後の復帰位置
			SetReturnDemoPosDir_(Vec3(-1316.467, 1104.792, -842.097), -80);
			// Demo517[バーディの飛翔]再生
			EventStartChangeDemo(517, FADE_COLOR_BLACK);
		}

		//-------------------------------------
		// ▼ライドフィルタ解除のメッセージを表示
		//-------------------------------------
		// Demo517[バーディの飛翔]再生後に表示
		if (volcano_num == GetFlagID_("CONST_SS_HV_GO_TO_THE_RED_WALL")) {		// Num7 = 17
			if(GetEventFlg_("BFG_RIDE_LICENSE_MULTIJUMP") == true){
				if(!IsOpenNaviMapRideFilter_(RIDE_FILTER.MULTIJUMP)){
					local player = GetPlayerId_();
					Wait_(35);
					SetMotion_(player, MOT_WAIT, BLEND_M);
					// リアクターからのお知らせの挙動
					CommReactorActionNotice();
					// メッセージ
					OpenMsgWnd_();
					SetTalkName_("NAME_TAG_REACTOR");
					ShowMsg_("RIDE_FILTER_MSG_01");
					KeyInputWait_();
					CloseMsgWnd_();
					OpenNaviMapRideFilter_(RIDE_FILTER.MULTIJUMP);
					// プレイヤーのモーションを待機状態に戻す
					CommResetPlayerMotion();
				}
			}
		}
	}
	//-------------
	// ▼戦闘開始
	//-------------
	// イベント戦[デスバーン戦]
	if (main_num == GetFlagID_("CONST_SM_VOLCANO")) {										// Num0 = 6
		if (volcano_num == GetFlagID_("CONST_SS_HV_PRE_BATTLE_DEATHBURN")) {				// Num7 = 19
			SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_HV_JDG_BATTLE_DEATHBURN"));		// Num7 <- 20
			// デスバーン戦
			ChangeBattleParty_(18);
		}
	}
	// イベント戦[デスバーン再戦]
	if (main_num == GetFlagID_("CONST_SM_VOLCANO")) {										// Num0 = 6
		if (volcano_num == GetFlagID_("CONST_SS_HV_PRE_REMATCH_DEATHBURN")) {				// Num7 = 22
			SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_HV_JDG_REMATCH_DEATHBURN"));		// Num7 <- 23
			// デスバーン戦
			ChangeBattleParty_(18);
		}
	}
	//-------------
	// ▼戦闘結果
	//-------------
	if (main_num == GetFlagID_("CONST_SM_VOLCANO")) {										// Num0 = 6
		if (volcano_num == GetFlagID_("CONST_SS_HV_JDG_BATTLE_DEATHBURN")) {				// Num7 = 20
			if (GetBattleEndType_() == BATTLE_END_TYPE_WIN){
				uWinDeathBurn();
			}else{
				// デスバーンに敗北
				// ここではデスバーン戦の敗北判定ができないので
				// イベントブロックのAfterBattle()で敗北の判定とフラグ変更を行う。
			}
		}
		//再戦時
		if (volcano_num == GetFlagID_("CONST_SS_HV_JDG_REMATCH_DEATHBURN")) {				// Num7 = 23
			if (GetBattleEndType_() == BATTLE_END_TYPE_WIN){
				uWinDeathBurn();
			}else{
				// デスバーンに敗北
				// ここではデスバーン戦の敗北判定ができないので
				// イベントブロックのAfterBattle()で敗北の判定とフラグ変更を行う。
			}
		}
	}
	
	
	//-------------------------------------------
	// ▼空間の遊びイベント用のカウントダウン表示
	//-------------------------------------------
	local info = {
		GIMMICK_FLG			 = GIMMICK_FLG,
	};
	
	MastersLoad_CountDown(info);
	
	//---------------------------------
	// ▼空間の遊びイベント用の戦闘判定
	//---------------------------------
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
	
	
	EventEnd_();
}

//------------------------------------------------
//		ＮＰＣ接触時
//------------------------------------------------
function TouchNpc()
{
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");			// Num0
	volcano_num	 = GetNumFlg_("NUM_SCENARIO_SUB_VOLCANO");	// Num7
	
	local target = GetTargetId_();
	
	DebugPrint(" ");
	DebugPrint("ID: " + target + " に接触 [TouchNpc]");
	
	switch (target) {
	case g_birdy :
		uTalkbirdy();
		break;
	default :
		DebugPrint("WARNING : NPC_IDが不正です [TouchNpc]");
		break;
	}
	
	EventEnd_();
}
//------------------------------------------------
//		イベント地雷接触時
//------------------------------------------------
function TouchEventMine()
{
	local target = GetTouchEventMineId_();
	local player = GetPlayerId_();

	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");			// Num0
	volcano_num	 = GetNumFlg_("NUM_SCENARIO_SUB_VOLCANO");	// Num7

	DebugPrint(" ");
	DebugPrint("ID: " + target + " に接触 [TouchNpc]");
	
	switch (target) {
	case g_mine_transfer01:
		uMineTransfer01();
		break;
	case g_mine_ruler_01:
		CommPlayerTurnAroundObj(g_gim_rulerpoint01);
		uMineRuler01();
		break;
	case g_mine_ruler_02:
		CommPlayerTurnAroundObj(g_gim_rulerpoint02);
		uMineRuler02();
		break;
	case g_mine_ruler_03:
		CommPlayerTurnAroundObj(g_gim_rulerpoint03);
		uMineRuler03();
		break;
	case g_mine_monolith:
		uMineMonolith();
		break;
// (旧)
//	case g_mine01:
//		uMineDemo501();
//		break;
// (新)
	case g_mine01_01:
	case g_mine01_02:
		uMineDemo501();
		break;
	case g_mine02_01:
	case g_mine02_02:
		uMineDemo505();
		break;
	case g_mine03:
		// 擬似デモはライドを強制解除できないので一旦マップチェンジしてライドを解除してEventStartOperate内で擬似デモを再生する
		SetEventFlg_("BFG_PLAY_PSEUDO_DEMO_VOLCANO", true);
		ChangeMap_("V00_00");
		break;
	case g_mine04:
		CommPlayerTurnAroundObj(g_gim_opendevice);
		uMineDemo518();
		break;
	case g_mine06:
		uMineDemo533();
		break;
	case g_mine07:
		CommPlayerTurnAroundObj(g_birdy);
		uMineDemo519();
		break;
	case g_mine_lift:
		uMineLift();
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
		DebugPrint("WARNING : NPC_IDが不正です [TouchNpc]");
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
//		バーディ 会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkbirdy()
{
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");			// Num0
	volcano_num	 = GetNumFlg_("NUM_SCENARIO_SUB_VOLCANO");	// Num7

	if (main_num == GetFlagID_("CONST_SM_VOLCANO")) {						// Num0 = 6
		if(volcano_num <= GetFlagID_("CONST_SS_VC_PRE_SECRET_BASE_DEMO")) { // Num7 15まで
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_BIRDY");
			ShowMsg_("DEMO_506_AFT_BIRDY"); //「アンセス！ モノリスに ゴーオンするネー！
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if(volcano_num == GetFlagID_("CONST_SS_HV_GO_TO_THE_RED_WALL")) { // Num7 = 18
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_BIRDY");
			ShowMsg_("DEMO_517_AFT_BIRDY"); //「それっぽい入口は 見つからないデース。
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if(volcano_num == GetFlagID_("CONST_SS_HV_FIND_OUT_AUTHEN_SYSTEM") // Num7 = 24
			 || volcano_num == GetFlagID_("CONST_SS_HV_ENTER_THE_ALIAS_ROOM")){ // Num7 = 25
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_BIRDY");
			ShowMsg_("DEMO_520_AFT_BIRDY"); //「一番乗りは アンセスに譲るデース。
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		大陸移動装置(黒鉄の監獄塔行)を調べた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineTransfer01()
{
	local dont_use_transfer = GetEventFlg_("BFG_DONT_TRANSFER_SAND_TO_VOLCANO");// 砂漠-火山間の大陸移動装置の使用を禁止するフラグ
	
	if(dont_use_transfer == false){
		OpenMsgWnd_();
		ShowMsg_("TRANSFER_01_MSG");
		KeyInputWait_();
		//はい
		if(GetQueryResult_() == QUERY_YES){
			CloseMsgWnd_();
			// ライド状態で大陸移動した場合、ライドを解除するフラグ
			SetEventFlg_("BFG_RIDE_OFF_USED_TRANSFER", true);
			// 黒鉄の監獄塔へ
			ChangeMapPosDir_("S00_00", Vec3(180.000, 1378.8,-700.000), -1);
		}
		//いいえ
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
//		発射台のリフトの地雷を調べた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineLift()
{
	local dont_use_transfer = GetEventFlg_("BFG_DONT_TRANSFER_VOLCANO_TO_CORE");// 火山-コア間の大陸移動装置の使用を禁止するフラグ
	
	if(dont_use_transfer == false){
		// 選択肢メッセージ
		OpenMsgWnd_();
		ShowMsg_("SYSTEM_MSG_000");
		KeyInputWait_();
		if(GetQueryResult_() == QUERY_YES){
			CloseMsgWnd_();
			DeleteEventMine_(g_mine_lift);
			
			// 大陸移動装置を使って大陸移動した場合、ライドを解除するために使用するフラグ
			SetEventFlg_("BFG_RIDE_OFF_USED_TRANSFER", true);
			// 主人公にテレポートエフェクトをつける
			//IDの取得
			local player = GetPlayerId_();
			// α値の設定
			local alpha_def = 1.0;
			// α値を変更する前は必ずこの命令を記載
			SetManualCalcAlpha_(player, true);
			// エフェクトの読み込み
			LoadEffect_("ef732_07_teleport_monolith");	//モノリス転送エフェクト
			PlaySE_("SE_DEM_017");						// ＳＥ再生
			local effectId = SetSelectBoneEffect_("ef732_07_teleport_monolith", player, ATTACH_GLOBAL);
			Wait_(1);
			// 主人公の姿を段々と消していく
			for(alpha_def = 1.0; alpha_def >= 0.0; alpha_def = alpha_def - 0.1){
				SetAlpha_(player, alpha_def);
				Wait_(1);
			}
			SetAlpha_(player, 0.0);
			// 間を持たせる
			Wait_(30);
			// 暗転させる(主人公が消えたままにならないようにここで暗転させてα値を元に戻す)
			SetFade_(FADE_OUT, FADE_COLOR_BLACK, 15);
			SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, 15);
			WaitFade_();
			// 主人公のα値を元に戻す
			SetAlpha_(player, 1.0);
			
			// コアの復帰位置
			ChangeMapPosDir_("C00_00", Vec3(-148.641, 0.000, -44.546), 68);
/*
			// 発射台の扉を開ける
			SetMotion_(g_gim_door01, MOT_GIMMICK_1, BLEND_N);
			SetMotion_(g_gim_door02, MOT_GIMMICK_1, BLEND_N);
			Wait_(30);
			SetMotion_(g_gim_door01, MOT_GIMMICK_2, BLEND_N);
			SetMotion_(g_gim_door02, MOT_GIMMICK_2, BLEND_N);
			// 発射台のリフトが上がる
*/
		}
		else{
			CloseMsgWnd_();
		}
	}
	// 転送装置の使用禁止中だった場合
	else{
		// システムメッセージ
		OpenMsgWnd_();
		ShowMsg_("DONT_USE_TELEPORTER_010");		// 転送装置は　動いていない。
		KeyInputWait_();
		CloseMsgWnd_();
	}
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		ルーラポイント(山頂)を調べた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineRuler01()
{
	CommRulerPointEvent(g_gim_rulerpoint01, "BFG_RULER_ADD_021", "g_ruler01"); 
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		ルーラポイント(秘密基地入口)を調べた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineRuler02()
{
	CommRulerPointEvent(g_gim_rulerpoint02, "BFG_RULER_ADD_022", "g_ruler02"); 
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		ルーラポイント(中腹)を調べた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineRuler03()
{
	CommRulerPointEvent(g_gim_rulerpoint03, "BFG_RULER_ADD_032", "g_ruler03"); 
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		モノリスを調べた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineMonolith()
{
	local player = GetPlayerId_();

	CommPlayerTurnAroundObj(g_gim_monolith);
	MonolithAnime(g_gim_monolith, "BFG_START_A_MONOLITH", "g_monolith");
	ChangeMapPosDir_("O01_00", Vec3(-1260.0, 10.0, 0.0), 90);
}

//++++++++++++++++++++++++++++++++++++++++++++++++
// デモ501[地下のシェルターの町]を再生する地雷を調べた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineDemo501()
{
	// 地雷の削除
//	DeleteEventMine_(g_mine01); // (旧)
	DeleteEventMine_(g_mine01_01); // (新)
	DeleteEventMine_(g_mine01_02); // (新)
	// シナリオのフラグを進める
	SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_HV_PRE_MAGMA_PARK_DEMO"));	// Num7 <- 2
	// マグマパーク付近のモンスターで配置を解禁するフラグ
	SetEventFlg_("BFG_LIMIT_MAGMA_PARK", true);
	// デモの復帰位置をデモの完成後に設定します
	SetReturnDemoMap_("V01_00"); 
	SetReturnDemoPosDir_(Vec3(47.092, 0.000, -300.000), 0); // Demo502[]再生後の復帰座標
	// Demo501[地下のシェルターの町(火山フィールド)]
	ChangeDemo_(501);
}

//++++++++++++++++++++++++++++++++++++++++++++++++
// デモ505[飛べない！]を再生する地雷を調べた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineDemo505()
{
	SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_HV_BIRDY_NEAR_THE_MONOLITH"));	// Num7 <- 6
	DeleteEventMine_(g_mine02_01);
	DeleteEventMine_(g_mine02_02);
	// デモ後の復帰位置と向きの設定
	local player_pos = Vec3(-757.361, 1052.426, -1434.833);
	local player_dir = -42;
	SetReturnDemoPosDir_(player_pos, player_dir);
	// Demo505[飛べない！]
	ChangeDemo_(505);
}

//++++++++++++++++++++++++++++++++++++++++++++++++
// 擬似デモ[秘密のモノリス]を再生する地雷を調べた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineDemo506()
{
	SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_HV_GO_TO_THE_COLOSSEUM"));		// Num7 <- 7
	DeleteEventMine_(g_mine03);

	// プレイヤーID
	local player = GetPlayerId_();
	// デモ中のプレイヤーの位置
	local player_pos = Vec3(-293.593, 1290.653, -763.338);
	local player_dir = 130;
	// デモ後の主人公の位置
	local rtn_pos = Vec3(-293.593, 1290.653, -763.338); // 備忘録)旧座標 → -286.014, 1291.893, -776.528
	local rtn_dir = 168;
	// カメラの角度
	local cam_dir = -190;
	// ウェイトフレーム
	local wait_frm = 10;
	// フェードスピード
	local fade_spd = 15;
	// 非常駐モーション読込(主人公うなずき)
	local nod = ReadMotion_(player, "Player_nod");

	// 瞬間暗転
	CommChangeMomentFadeOut(FADE_COLOR_BLACK);
	// 準備
	Wait_(wait_frm);
	SetPos_(player, player_pos);
	SetDir_(player, player_dir);
	SetCameraDir_(cam_dir);
	SetDirToPlayer_(g_birdy);
	// 暗転明け(上画面のみ)
	SetFade_(FADE_IN, FADE_COLOR_BLACK, fade_spd);
	WaitFade_();
	// 擬似デモの処理
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BIRDY");
	ShowMsg_("PSEUDO_DEMO_BIRDY");		//「前みたいに　バーチャルコロシアムで
	KeyInputWait_();
	CloseMsgWnd_();
	Wait_(wait_frm);
	SetMotion_(player, nod, BLEND_M); // 主人公がうなずく
	Wait_(fade_spd);
	// 暗転
	uWaitPseudoDemoFade(fade_spd);
	// 準備
	SetCameraDir_(175); // 主人公の真後ろ付近
	// バーディ
	SetDir_(g_birdy, -50);
	SetTalkEnable_(g_birdy, true); // 会話できる
	SetTalkCameraType_(g_birdy, TALK_CAMERA_UP); // カメラの設定
	// 主人公
	SetPos_(player, rtn_pos);
	SetDir_(player, rtn_dir);
	Wait_(FADE_DEF);
	// 暗転明け
	SetFade_(FADE_IN, FADE_COLOR_BLACK, fade_spd);
	SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, fade_spd);
	WaitFade_();
	Wait_(wait_frm);
/*
	// デモ後の復帰位置と向きの設定
	local player_pos = Vec3(-281.711, 1292.686, -838.463);
	local player_dir = -166;
	SetReturnDemoPosDir_(player_pos, player_dir);
	// Demo506[秘密のモノリス]
	ChangeDemo_(506);
*/
}

//++++++++++++++++++++++++++++++++++++++++++++++++
// デモ518[対決・デスバーン]を再生する地雷を調べた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineDemo518()
{
	if (main_num == GetFlagID_("CONST_SM_VOLCANO")) {									// Num0 = 6
		if (volcano_num == GetFlagID_("CONST_SS_HV_GO_TO_THE_RED_WALL")) {				// Num7 = 18
			SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_HV_PRE_BATTLE_DEATHBURN"));	// Num7 <- 19
			DeleteEventMine_(g_mine04);
			// Demo518[対決・デスバーン]
			ChangeDemo_(518);
		}
	}
}

//++++++++++++++++++++++++++++++++++++++++++++++++
// デモ519[デスバーン再戦]を再生する地雷に触れた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineDemo519()
{
	if (main_num == GetFlagID_("CONST_SM_VOLCANO")) {									// Num0 = 6
		if (volcano_num == GetFlagID_("CONST_SS_HV_CONTACT_DEATHBURN")) {				// Num7 = 21
			SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_HV_PRE_REMATCH_DEATHBURN"));	// Num7 <- 22
			DeleteEventMine_(g_mine07);
			// Demo519[デスバーン再戦]
			ChangeDemo_(519);
		}
	}
}

//++++++++++++++++++++++++++++++++++++++++++++++++
// デモ533[火山の移動装置使用]を再生する地雷を調べた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineDemo533()
{
	SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_HV_CLEAR_HEAT_VOLCANO"));	// Num7 <- 41
	DeleteEventMine_(g_mine06);
	// イベントフラグを進める
	SetNumFlg_("NUM_SCENARIO_MAIN", GetFlagID_("CONST_SM_CORE"));	// メインフラグ NUM000 = 7
	SetNumFlg_("NUM_SCENARIO_SUB_VOLCANO", 0);	// 火山フラグ(NUM007 を 41 → 0に戻す)

	// 大陸移動のデモ中にセーブポイントを挟む際に使用するフラグ
	SetEventFlg_("BFG_SAVE_POINT_FLAG", true);

	// ライド状態で大陸移動した場合、ライドを解除するフラグ
	SetEventFlg_("BFG_RIDE_OFF_USED_TRANSFER", true);

	// コアへ
	SetReturnDemoMap_("C00_00"); 
	SetReturnDemoPosDir_(Vec3(-87.559, 0.000, -43.226), 83);

	// 大陸間移動のdemo533[コア侵入]を再生する処理
	ChangeDemo_(533);
}

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// 擬似デモなどの暗転処理関数
//----------------------------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function uWaitPseudoDemoFade(fade_spd)
{
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, fade_spd);
	SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, fade_spd);
	WaitFade_();
}

//+++++++++++++++++++++++++++++++++
// デスバーンに勝利後の共通処理関数
//---------------------------------
// 引数    ：なし
// 戻り値  ：なし
//+++++++++++++++++++++++++++++++++
function uWinDeathBurn()
{
	// デスバーンに勝利
	SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_HV_FIND_OUT_AUTHEN_SYSTEM"));	// Num7 <- 24
	// 扉アイコン(灰色線)とマップチェンジアイコン(赤線)を切り替える
	SetEventFlg_("BFG_MAP_CHANGE_ICON_V00_00", true);
	// デモ後に設定される主人公の位置と向き
	SetReturnDemoPosDir_(Vec3(-1355.154, 1105.822, -892.930), -90);
	// Demo520[デスバーン戦勝利]の再生<EventStartOperate()のイベントロック内なのでEventStartChangeDemo()>
	EventStartChangeDemo(520, FADE_COLOR_BLACK);
}

