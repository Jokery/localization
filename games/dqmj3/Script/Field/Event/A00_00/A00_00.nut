//===================== A00_00崩落都市 ====================
//---------------------------------
// ▼空間の遊びで使用する定数
//---------------------------------
// ギミックの起動とクリアフラグ
const GIMMICK_FLG			 = "BFG_SPACE_GIMMICK_CITY";
const GIMMICK_CLEAR_FLG		 = "BFG_SPACE_GIMMICK_CITY_1ST_CLEAR";

// 主人公の復帰位置と向き
const XPOS_1				 = 1834.650;	// 遺跡スイッチ付近
const YPOS_1				 = -58.867;
const ZPOS_1				 = 25.251;
const DIR_1					 = -53;

const XPOS_2				 = 472.0;		// ゴールボスの手前
const YPOS_2				 = 213.0;
const ZPOS_2				 = 1038.0;
const DIR_2					 = -60;

// 擬似デモで使用するカメラのノード名
const CAMERA_EYE			 = "cameye_001";
const CAMERA_TGT			 = "camtgt_001";

// 遺跡スイッチを起動させる為の鍵ID
const GIMMICK_KEY_ID		 = 902;

// 遺跡スイッチを起動させた時のメッセージID
const GIMMICK_MSG_ID		 = "MASTERS_LOAD_REACTOR_MSG_011";

// 遺跡スイッチ起動後の再生デモナンバー
const DEMO_NUM				 = 134;

// ボスモンスターのID (1=初回, 2=2回目以降)
const BOSS_ID_1				 = "m110_01";	// ゴールドマン
const BOSS_ID_2				 = "m110_01";	// ゴールドマン

// ボスモンスターのExchange用ID
const BOSS_EXCHANGE_ID		 = 338;			// ゴールドマン

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
const BOSS_PARTY_TABLE_1	 = 155;
const BOSS_PARTY_TABLE_2	 = 155;

// ボスを仲間にする際のモンスターパラメータ (1=初回, 2=2回目以降)
const BOSS_PARAMETER_1		 = 1803;
const BOSS_PARAMETER_2		 = 1803;

// ボス仲間後のマップチェンジID
const MAP_ID				 = "A00_00";


//-------------------- 初期化 --------------------
// 起動条件：バトル終了後に呼ばれます
// (バトルの勝敗判定やイベントフラグの設定はココ)
//-------------------- 初期化 --------------------
function AfterBattle()
{
//------------------------------------------------------------------
// フラグの状態を取得
	local main_num   = GetNumFlg_("NUM_SCENARIO_MAIN");
	local green_num  = GetNumFlg_("NUM_SCENARIO_SUB_GREEN");
	local city_num   = GetNumFlg_("NUM_SCENARIO_SUB_CITY");

	//---------------------------------
	// ▼空間の遊びイベント用のフラグ
	//---------------------------------
	local info = {
		GIMMICK_FLG			 = GIMMICK_FLG,
	};
	
	MastersLoad_AfterBattle(info);

	EventEnd_();
}

//-------------------- 初期化 --------------------
// 起動条件：FadeInより前に呼ばれる
// (例外的なイベントフラグの設定はココ)
//-------------------- 初期化 --------------------
function BeforeInitMap()
{
	// フラグの状態を取得
	local main_num   = GetNumFlg_("NUM_SCENARIO_MAIN");							// Num0
	local sky_num	 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");						// Num9
	
	// 特技石碑の擬似デモ再生前にライドを解除する
	if(GetEventFlg_("BFG_RIDE_OFF_FLAG_BEFORE_STELE") == true){
		//ライド強制解除
		SetRideOffStart_();
	}
	
	// 移動装置を使用した場合
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
	
	
	EventEnd_();
}

//-------------------- 初期化 --------------------
// 起動条件：画面切り替えのフェードイン中
// (NPCと地雷の設置/マップ到達フラグはココ)
//-------------------- 初期化 --------------------
function FadeIn()
{
	// マップ到達フラグ
	SetEventFlg_("BFG_ARRIVE_AT_A00", true);
	// セーブ禁止を解除(セーブ禁止マップから帰ってきた時用)
	SetEventFlg_("BFG_SAVE_PROHIBIT", false);		// セーブ禁止(Bit451)

	// フラグの状態を取得
	local main_num   = GetNumFlg_("NUM_SCENARIO_MAIN");
	local green_num  = GetNumFlg_("NUM_SCENARIO_SUB_GREEN");
	local city_num   = GetNumFlg_("NUM_SCENARIO_SUB_CITY");
	local sub_num    = GetNumFlg_("NUM_FLG_GO_POWER_PLANT_STATE");
	local inside_num = GetNumFlg_("NUM_SCENARIO_SUB_INSIDE_CLEAR");
	// 送電施設で電力の復旧が行われたかをチェック(主にギミック用)
	local check_restoration = GetEventFlg_("BFG_RESTORATION_POWER_PLANT");

	DebugPrint(" ");
	DebugPrint("NUM_SCENARIO_MAIN の値は " + main_num + " になりました。");
	DebugPrint("NUM_SCENARIO_SUB_GREEN の値は " + green_num + " になりました。");
	DebugPrint("NUM_SCENARIO_SUB_CITY の値は " + city_num + " になりました。");

//--------------------------------------------------------------------------------
// BGMの変更[ 「BG_AMBI_008」を「BGM_005」(崩落都市の通常BGM)に変更 ]
	SetEventFlg_("BFG_A00_00_ENVIRONMENT_BGM_PLAY", false);
	// Demo101[目的地はバトルＧＰ本部ビル]再生後のタイミング
	if(main_num == GetFlagID_("CONST_SM_CITY")){
		if(city_num == GetFlagID_("CONST_SS_CI_NOT_ENTER_THE_BUILDING")){
			SetEventFlg_("BFG_A00_00_ENVIRONMENT_BGM_PLAY", false);
		}
	}

//--------------------------------------------------------------------------------
// マップチェンジnullを有効にするかどうか設定する命令(FadeIn()で設定し、他のイベントブロックでON/OFFできる)

	// 送電施設の電力復旧前
	if(check_restoration == false){
		// マップチェンジしない
		SetHitEnableMapChangeNull_("w_A01_00ALdr_006", false);
	}
	else{
		// マップチェンジする
		SetHitEnableMapChangeNull_("w_A01_00ALdr_006", true);
	}
//--------------------------------------------------------------------------------
// 時間の設定
	if(main_num == 2){
		if(city_num == GetFlagID_("CONST_SS_CI_EVENING_CITY")){
			// まんたんの石碑取得後
			if(GetEventFlg_("BFG_EXAMINE_FULLTANK_STELE") == true){
				// 夕方に設定
				SetTime_(START_TIME_ZONE_EVENING);
				ChangeColorTone_(0.0, 0.0, 0.0, 0);
			}
			// まんたんの石碑取得前
			else{
				// 昼のまま
				SetTime_(0);
				ChangeColorTone_(0.0, 0.0, 0.0, 0);
			}
		}
		// demo124[迫る夕暮]再生後
		if(city_num >= GetFlagID_("CONST_SS_CI_GO_POWER_PLANT")
		&& city_num <= GetFlagID_("CONST_SS_CI_RESTORATION_POWER_PLANT")){
			// 夜に設定
			SetTime_(START_TIME_ZONE_NIGHT);
			// 復旧前の暗い状態
			ChangeColorTone_(CITY_COLOR_TONE_DARK_R, CITY_COLOR_TONE_DARK_G, CITY_COLOR_TONE_DARK_B, 0);
		}
		// 送電施設クリア後
		if(city_num  > GetFlagID_("CONST_SS_CI_RESTORATION_POWER_PLANT")){
			// 夜に設定
			SetTime_(START_TIME_ZONE_NIGHT);
			// 復旧後の明るい状態
			ChangeColorTone_(CITY_COLOR_TONE_BRIGHT_R, CITY_COLOR_TONE_BRIGHT_G, CITY_COLOR_TONE_BRIGHT_B, 0);
		}
	}

//-----------------------------------------------------------------
// NPC
	// NPCの初期化
	g_king    <- C_NONE_ID;	// キング
	g_jack    <- C_NONE_ID;	// ジャック
	g_queen   <- C_NONE_ID;	// クイーン
	g_ace     <- C_NONE_ID;	// エース
	g_npc1    <- C_NONE_ID;	// NPC_A
	g_npc1_2  <- C_NONE_ID;	// 本屋
	g_npc2    <- C_NONE_ID;	// NPC_B
	g_npc2_2  <- C_NONE_ID;	// NPC_B 道具屋
	g_npc4    <- C_NONE_ID;	// 道具
	g_npc5    <- C_NONE_ID;	// 銀行
	g_npc6    <- C_NONE_ID;	// 本屋
	g_npc7    <- C_NONE_ID;	// 肉屋
	g_npc8    <- C_NONE_ID;	// リアクター
	g_npc9    <- C_NONE_ID;	// アクセサリ
	g_inn     <- C_NONE_ID;	// 宿屋
	dead_npc  <- C_NONE_ID;	// 全滅復帰時

	if(main_num == 2){
		if(city_num == GetFlagID_("CONST_SS_CI_CLIMB_THE_LADDER")){
			// リソース読み込み
			local g_id_nochorin = ReadNpc_("n043");	// ノチョリン
			local g_id_npc_000  = ReadNpc_("n000");	// ノチョーラ男
			// NPC配置
			g_npc1  = ArrangePointNpc_(g_id_nochorin, "NPC_37"); // NPC_A（ノチョリン）
			g_npc5  = ArrangePointNpc_(g_id_npc_000 , "NPC_38"); // 銀行
			// リアクターメッセージの設定
			SetReactorMsg_(g_npc1, "NPC_NOCHORIN_REC");
			SetReactorMsg_(g_npc5, "NPC_NOCHO_MEN_REC");
			// 会話時カメラ(全滅復帰時は会話をさせなくする)
			if(GetEventFlg_("BFG_DEAD_RETURN") == false){
				SetTalkCameraType_(g_npc1, TALK_CAMERA_UP);		// NPC_A(ノチョリン)
			}
			else{
				SetTalkEnable_(g_npc1, false);
			}
		}
		// センタービル内にノチョーラが移動した後で全滅復帰した場合(Redmine#2261)
		if(city_num == GetFlagID_("CONST_SS_CI_ESTABLISH_KINGDOM")){
			if(GetEventFlg_("BFG_DEAD_RETURN") == true){
				// 橋の前でノチョリンを設置
				dead_npc = ReadAndArrangePointNpc("n043", "NPC_39");
				SetTalkEnable_(dead_npc, false);
			}
		}
		// 入口前
		if(city_num == GetFlagID_("CONST_SS_CI_GO_BACK_KING"))
		{
			// 玉座
			local g_throne_02 = ReadGimmick_("o_com_05");
			local throne_02 = ArrangePointGimmick_("o_com_05", g_throne_02, "g_throne_02");
			// リソース読み込み
			local g_id_npc_000  = ReadNpc_("n000");	// ノチョーラ男
			local g_id_npc_001  = ReadNpc_("n004");	// ノチョーラ女
			local g_id_jack     = ReadNpc_("n001");	// ジャック
			local g_id_ace      = ReadNpc_("n002");	// エース
			local g_id_king     = ReadNpc_("n003");	// キング
			local g_id_queen    = ReadNpc_("n005");	// クイーン
			local g_id_nochorin = ReadNpc_("n043");	// ノチョリン
			// NPC配置
			g_king  = ArrangePointNpc_(g_id_king,  "NPC_22");
			SetTalkTurn_ (g_king, false);//キングは振り向かないようにする
			// NPCの会話可能角度を設定
			SetSearchableAngle_(g_king, SEARCHABLE_ANGLE_MINIMUM); // キング
			g_jack  = ArrangePointNpc_(g_id_jack,  "NPC_23");
			g_queen = ArrangePointNpc_(g_id_queen, "NPC_24");
			g_ace   = ArrangePointNpc_(g_id_ace,   "NPC_25");
//			g_npc2  = ArrangePointNpc_(g_id_npc_000, "NPC_27"); // NPC_B
//			g_npc4  = ArrangePointNpc_(g_id_npc_000, "NPC_26"); // 道具
//			g_npc5  = ArrangePointNpc_(g_id_npc_000, "NPC_30"); // 銀行
//			g_npc6  = ArrangePointNpc_(g_id_npc_000, "NPC_31"); // 本屋
//			g_npc7  = ArrangePointNpc_(g_id_npc_000, "NPC_32"); // 肉屋
//			g_npc8  = ArrangePointNpc_(g_id_npc_000, "NPC_33"); // リアクター
//			g_npc9  = ArrangePointNpc_(g_id_npc_001, "NPC_34"); // アクセサリ
//			g_inn   = ArrangePointNpc_(g_id_npc_000, "NPC_INN_02"); // 宿屋
			// リアクターメッセージの設定
			SetReactorMsg_(g_king, "NPC_KING_REC");
			SetReactorMsg_(g_jack, "NPC_JACK_REC");
			SetReactorMsg_(g_queen, "NPC_QUEEN_REC");
			SetReactorMsg_(g_ace, "NPC_ACE_REC");
//			SetReactorMsg_(g_npc2, "NPC_NOCHO_MEN_REC");
//			SetReactorMsg_(g_npc4, "NPC_NOCHO_MEN_REC");
//			SetReactorMsg_(g_npc5, "NPC_NOCHO_MEN_REC");
//			SetReactorMsg_(g_npc6, "NPC_NOCHO_MEN_REC");
//			SetReactorMsg_(g_npc7, "NPC_NOCHO_MEN_REC");
//			SetReactorMsg_(g_npc8, "NPC_NOCHO_MEN_REC");
//			SetReactorMsg_(g_npc9, "NPC_NOCHO_WOMEN_REC");
//			SetReactorMsg_(g_inn, "NPC_NOCHO_MEN_REC");
			// 会話時カメラ
			SetTalkCameraType_(g_jack, TALK_CAMERA_UP);		// ジャック
			SetTalkCameraType_(g_queen, TALK_CAMERA_UP);	// クイーン
			SetTalkCameraType_(g_ace, TALK_CAMERA_UP);		// エース
			SetTalkCameraType_(g_king, TALK_CAMERA_UP);		// キング
			// 会話アイコンを非表示&会話させない
			SetTalkEnable_(g_king, false);
			SetTalkEnable_(g_jack, false);
			SetTalkEnable_(g_queen, false);
			SetTalkEnable_(g_ace, false);
//			SetTalkEnable_(g_npc2, false);
//			SetTalkEnable_(g_npc4, false);
//			SetTalkEnable_(g_npc5, false);
//			SetTalkEnable_(g_npc6, false);
//			SetTalkEnable_(g_npc7, false);
//			SetTalkEnable_(g_npc8, false);
//			SetTalkEnable_(g_npc9, false);
//			SetTalkEnable_(g_inn, false);
			// ノチョリン
			if(GetEventFlg_("BFG_DEAD_RETURN") == false){
				// 非全滅時
				g_npc1  = ArrangePointNpc_(g_id_nochorin, "NPC_29"); // NPC_A(ノチョリン)
				SetReactorMsg_(g_npc1, "NPC_NOCHORIN_REC");
				SetTalkCameraType_(g_npc1, TALK_CAMERA_UP);
				SetTalkEnable_(g_npc1, false);
			}
			else{
				// 全滅時
				dead_npc = ReadAndArrangePointNpc("n043", "NPC_39");
				SetTalkEnable_(dead_npc, false);
			}
		}
		// 壁の前
		if(city_num >= GetFlagID_("CONST_SS_CI_NOT_ENTER_THE_BUILDING")
		&& city_num <= GetFlagID_("CONST_SS_CI_RESTORATION_POWER_PLANT"))
		{
			// 玉座
			local g_throne_01 = ReadGimmick_("o_com_05");
			local throne_01 = ArrangePointGimmick_("o_com_05", g_throne_01, "g_throne_01");
			// 宿屋の看板
			local g_board = ReadGimmick_("o_com_13");
			local board = ArrangePointGimmick_("o_com_13", g_board, "g_board");
			// リソース読み込み
			local g_id_npc_000 = ReadNpc_("n000");	// ノチョーラ男
			local g_id_npc_001 = ReadNpc_("n004");	// ノチョーラ女
			local g_id_jack    = ReadNpc_("n001");	// ジャック
			local g_id_ace     = ReadNpc_("n002");	// エース
			local g_id_king    = ReadNpc_("n003");	// キング
			local g_id_queen   = ReadNpc_("n005");	// クイーン
			// NPC配置
			g_king    = ArrangePointNpc_(g_id_king,  "NPC_09");
			// 会話時カメラ(全滅復帰時は会話をさせなくする)
			if(GetEventFlg_("BFG_DEAD_RETURN") == false){
				SetTalkCameraType_(g_king, TALK_CAMERA_UP); // キング
				SetTalkTurn_ (g_king, false); //キングは振り向かないようにする
				// NPCの会話可能角度を設定
				SetSearchableAngle_(g_king, SEARCHABLE_ANGLE_MINIMUM); // キング
			}
			else{
				SetTalkEnable_(g_king, false);
			}
			g_jack    = ArrangePointNpc_(g_id_jack,  "NPC_12");
			g_queen   = ArrangePointNpc_(g_id_queen, "NPC_10");
			g_ace     = ArrangePointNpc_(g_id_ace,   "NPC_11");
			g_npc7    = ArrangePointNpc_(g_id_npc_000, "NPC_19"); // 肉屋
			g_npc8    = ArrangePointNpc_(g_id_npc_000, "NPC_20"); // リアクター
			g_npc9    = ArrangePointNpc_(g_id_npc_001, "NPC_21"); // アクセサリ
			g_inn     = ArrangePointNpc_(g_id_npc_000, "NPC_INN_01"); // 宿屋
			// リアクターメッセージの設定
			SetReactorMsg_(g_king, "NPC_KING_REC");
			SetReactorMsg_(g_jack, "NPC_JACK_REC");
			SetReactorMsg_(g_queen, "NPC_QUEEN_REC");
			SetReactorMsg_(g_ace, "NPC_ACE_REC");
			SetReactorMsg_(g_npc7, "NPC_NOCHO_MEN_REC");
			SetReactorMsg_(g_npc8, "NPC_NOCHO_MEN_REC");
			SetReactorMsg_(g_npc9, "NPC_NOCHO_WOMEN_REC");
			SetReactorMsg_(g_inn, "NPC_NOCHO_MEN_REC");
			// 会話時カメラ
			SetTalkCameraType_(g_jack, TALK_CAMERA_UP);		// ジャック
			SetTalkCameraType_(g_queen, TALK_CAMERA_UP);	// クイーン
			SetTalkCameraType_(g_ace, TALK_CAMERA_UP);		// エース
			SetTalkCameraType_(g_king, TALK_CAMERA_UP);		// キング
		}
		//バトルＧＰ本部ビルに入れないノチョーラたち再生後
		if(city_num >= GetFlagID_("CONST_SS_CI_EVENING_CITY")
		&& city_num <= GetFlagID_("CONST_SS_CI_RESTORATION_POWER_PLANT"))
		{
			// リソース読込
			local g_id_nochorin = ReadNpc_("n043"); // ノチョリン
			local g_id_npc_000  = ReadNpc_("n000"); // ノチョーラ男
			local g_id_npc_001  = ReadNpc_("n004");	// ノチョーラ女
			// NPC設置
			g_npc1    = ArrangePointNpc_(g_id_nochorin, "NPC_13"); // NPC_A(ノチョリン)
			SetTalkCameraType_(g_npc1, TALK_CAMERA_UP);
			g_npc2    = ArrangePointNpc_(g_id_npc_000, "NPC_14"); // NPC_B
			g_npc1_2  = ArrangePointNpc_(g_id_npc_001, "NPC_35"); // 本屋
			g_npc2_2  = ArrangePointNpc_(g_id_npc_000, "NPC_36"); // 道具屋
			g_npc5    = ArrangePointNpc_(g_id_npc_000, "NPC_17"); // 銀行
			// リアクターメッセージの設定
			SetReactorMsg_(g_npc1, "NPC_NOCHORIN_REC");
			SetReactorMsg_(g_npc2, "NPC_NOCHO_MEN_REC");
			SetReactorMsg_(g_npc1_2, "NPC_NOCHO_WOMEN_REC");
			SetReactorMsg_(g_npc2_2, "NPC_NOCHO_MEN_REC");
			SetReactorMsg_(g_npc5, "NPC_NOCHO_MEN_REC");
		}
		//目的地はバトルＧＰ本部ビル再生後
		if(city_num == GetFlagID_("CONST_SS_CI_NOT_ENTER_THE_BUILDING"))
		{
			// リソース読込
			local g_id_nochorin = ReadNpc_("n043"); // ノチョリン
			local g_id_npc_000  = ReadNpc_("n000"); // ノチョーラ男
			local g_id_npc_001  = ReadNpc_("n004");	// ノチョーラ女
			// NPC設定
			g_npc1    = ArrangePointNpc_(g_id_nochorin, "NPC_37"); // NPC_A(ノチョリン)
			// 会話時カメラ(全滅復帰時は会話をさせなくする)
			if(GetEventFlg_("BFG_DEAD_RETURN") == false){
				SetTalkCameraType_(g_npc1, TALK_CAMERA_UP);		// NPC_A(ノチョリン)
			}
			else{
				SetTalkEnable_(g_npc1, false);
			}
			g_npc2    = ArrangePointNpc_(g_id_npc_000, "NPC_14"); // NPC_B
			g_npc1_2  = ArrangePointNpc_(g_id_npc_001, "NPC_35"); // 本屋
			g_npc2_2  = ArrangePointNpc_(g_id_npc_000, "NPC_36"); // 道具屋
			g_npc5    = ArrangePointNpc_(g_id_npc_000, "NPC_38"); // 銀行
			// リアクターメッセージの設定
			SetReactorMsg_(g_npc1, "NPC_NOCHORIN_REC");
			SetReactorMsg_(g_npc2, "NPC_NOCHO_MEN_REC");
			SetReactorMsg_(g_npc1_2, "NPC_NOCHO_WOMEN_REC");
			SetReactorMsg_(g_npc2_2, "NPC_NOCHO_MEN_REC");
			SetReactorMsg_(g_npc5, "NPC_NOCHO_MEN_REC");
		}
	}


//-------------------------------------------------------------------------------------
// イベント地雷
	// イベント地雷の初期化
	g_mine_00     <- C_NONE_ID;
	g_mine_02     <- C_NONE_ID;
	g_mine_03     <- C_NONE_ID;
	g_mine_04     <- C_NONE_ID;
	g_mine_05     <- C_NONE_ID;
	g_mine_06     <- C_NONE_ID;
	g_mine_07     <- C_NONE_ID;
	mine_wall00   <- C_NONE_ID;
	mine_wall_01  <- C_NONE_ID;
	mine_wall_02  <- C_NONE_ID;
	mine_wall_03  <- C_NONE_ID;
	mine_wall_04  <- C_NONE_ID;
	mine_ruler_01 <- C_NONE_ID;
	mine_ruler_02 <- C_NONE_ID;
	mine_ruler_03 <- C_NONE_ID;
	mine_full     <- C_NONE_ID;
	mine_stele00  <- C_NONE_ID;	// ゲート前(ルーラポイント進入禁止1)
	mine_stele01  <- C_NONE_ID;	// ゲート前(ルーラポイント進入禁止2)
	mine_stele07  <- C_NONE_ID;	// ゲート前(ルーラポイント進入禁止3)
	mine_stele08  <- C_NONE_ID;	// ゲート前(ルーラポイント進入禁止4)
	mine_stele09  <- C_NONE_ID;	// ゲート前(ルーラポイント進入禁止5)
	mine_stele02  <- C_NONE_ID;	// ゲート前(まんたん取得デモ開始)
	mine_stele03  <- C_NONE_ID;	// ゲート前(石碑を調べるまで封鎖1)
	mine_stele04  <- C_NONE_ID;	// ゲート前(石碑を調べるまで封鎖2)
	mine_stele05  <- C_NONE_ID;	// ゲート前(石碑を調べるまで封鎖3)
	mine_stele06  <- C_NONE_ID;	// ゲート前(石碑を調べるまで封鎖4)
	mine_stele10  <- C_NONE_ID;	// ゲート前(石碑を調べるまで封鎖5)
	g_mine_ladder <- C_NONE_ID;
	// イベント地雷の読込
	// 草原フィールドへ飛ぶ
	g_mine_00 = SetPointCircleEventMine_("00_Mine", true);

	// 歓楽の霊道へ飛ぶ
	g_mine_07 = SetPointCircleEventMine_("07_Mine", true);

	// まんたん石碑のイベント進行度合
	// まんたん未取得状態
	if(sub_num == 0){
		mine_stele02 = SetPointCircleEventMine_("09_Mine02", false);
	}
	// 石碑に近づく( mine_stele02に触れた後 )
	else if(sub_num == 1){
		mine_stele03 = SetPointBoxEventMine_("09_Mine", false);
		mine_stele04 = SetPointBoxEventMine_("10_Mine", false);
		mine_stele05 = SetPointBoxEventMine_("11_Mine", false);
		mine_stele10 = SetPointBoxEventMine_("11_Mine02", false);
		mine_stele06 = SetPointBoxEventMine_("12_Mine", false);
	}
	// まんたん取得後
	else{
	}

	// まんたん石碑を調べたかどうか
	if(GetEventFlg_("BFG_EXAMINE_FULLTANK_STELE") == false){
		mine_full = SetPointCircleEventMine_("08_Mine", true);
	}

	// 崩落都市
	if(main_num == 2){
		if(city_num == GetFlagID_("CONST_SS_CI_GO_BACK_KING")){
			g_mine_05 = SetPointBoxEventMine_("05_Mine", false);
		}
		if(city_num == GetFlagID_("CONST_SS_CI_EVENING_CITY")){
			// 送電施設前(demo124[迫る夕暮])
			g_mine_04 = SetPointCircleEventMine_("04_Mine", false);
		}
		if(city_num == GetFlagID_("CONST_SS_CI_NOT_ENTER_THE_BUILDING")){
			g_mine_03    = SetPointBoxEventMine_("03_Mine", false);
			mine_stele00 = SetPointBoxEventMine_("09_Mine", false);
			mine_stele01 = SetPointBoxEventMine_("10_Mine", false);
			mine_stele07 = SetPointBoxEventMine_("11_Mine", false);
			mine_stele08 = SetPointBoxEventMine_("11_Mine02", false);
			mine_stele09 = SetPointBoxEventMine_("12_Mine", false);
		}
		if(city_num == GetFlagID_("CONST_SS_CI_CLIMB_THE_LADDER")){
			g_mine_02 = SetPointBoxEventMine_("02_Mine", false);
		}
	}
	// 送電施設復旧前にセンタービルに入れるので進行不可地雷を設置(保険)
	if(check_restoration == false){
		g_mine_06 = SetPointCircleEventMine_("06_Mine", true);
		//中央の最初の扉に開かないというメッセージを表示させる
		mine_wall00 = SetPointCircleEventMine_("mine_wall_00", true);
		mine_wall_01 = SetPointCircleEventMine_("mine_wall_01", true);
		mine_wall_02 = SetPointCircleEventMine_("mine_wall_02", true);
		mine_wall_03 = SetPointCircleEventMine_("mine_wall_03", true);
		//北西シャッター扉は開かないというメッセージを表示させる
		mine_wall_04 = SetPointCircleEventMine_("mine_wall_04", true);
	}

	//センタービルのシャッター前のルーラポイント
	mine_ruler_01 = SetPointCircleEventMine_("mine_ruler_01", true);
	//送電施設の前のルーラポイント
	mine_ruler_02 = SetPointCircleEventMine_("mine_ruler_02", true);
	//北西ゲート前
	mine_ruler_03 = SetPointCircleEventMine_("mine_ruler_03", true);

	// ハシゴ用の地雷
	if(GetEventFlg_("BFG_CHECK_USED_FIRST_TIME_LADDER") == false){
		g_mine_ladder = SetPointCircleEventMine_("mine_ladder_01", false);
	}
//------------------------------------------------------
// ギミック
	// 転送装置(草原フィールド側)
	local g_transfer = ReadGimmick_("o_com_01");
	local transfer_device = ArrangePointGimmick_("o_com_01", g_transfer, "g_transfer");

	// 転送装置(歓楽の霊道側)
	local g_transfer_02 = ReadGimmick_("o_com_01");
	local transfer_device_02 = ArrangePointGimmick_("o_com_01", g_transfer_02, "g_transfer_02");

	// 石碑(まんたん)
	local g_stele = ReadGimmick_("o_com_07");
	g_full_stele <- ArrangePointGimmick_("o_com_07", g_stele, "stele");
	SetMotion_(g_full_stele, "GIMMICK_0", 0);
	if(GetEventFlg_("BFG_EXAMINE_FULLTANK_STELE") == true){
		SetMotion_(g_full_stele, "GIMMICK_2", 0);
	}

	// SetTime_()みたく現在の経過時間フレーム数を取得してbitフラグを変更して点けたり消したり
	local g_bill = ReadGimmick_("o_A00_04");
	local bill_light = ArrangePointGimmick_("o_A00_04", g_bill, "g_bill");
	if(check_restoration == false){
		// 消灯
		SetMotion_(bill_light, "GIMMICK_0", 0);
	}else{
		// 点灯
		SetMotion_(bill_light, "GIMMICK_1", 0);
	}

	// 送電施設が復旧するまで配置
	if(check_restoration == false){
		// 正面の扉ギミック
		local g_wall_00 = ReadGimmick_("o_A00_01");
		wall_00 <- ArrangePointGimmick_("o_A00_01", g_wall_00, "g_wall_00");
		// ビル入り口前の壁(1)
		local g_wall_01 = ReadGimmick_("o_A00_03");
		wall_01 <- ArrangePointGimmick_("o_A00_03", g_wall_01, "g_wall_01");
		// ビル入り口前の壁(2)
		local g_wall_02 = ReadGimmick_("o_A00_03");
		wall_02 <- ArrangePointGimmick_("o_A00_03", g_wall_02, "g_wall_02");
		// ビル入り口前の壁(3)
		local g_wall_03 = ReadGimmick_("o_A00_03");
		wall_03 <- ArrangePointGimmick_("o_A00_03", g_wall_03, "g_wall_03");
		// 歓楽の霊道の移動装置前の扉
		local g_wall_04 = ReadGimmick_("o_A00_01");
		wall_04 <- ArrangePointGimmick_("o_A00_01", g_wall_04, "g_wall_04");
	}
	// ルーラポイント(バトルGP本部 入口前)
	local g_rulerpoint = ReadGimmick_("o_com_08");
	rulerpoint01 <- ArrangePointGimmick_("o_com_08", g_rulerpoint, "g_rulerpoint01");
	SetMotion_(rulerpoint01, "GIMMICK_0", 0);
	if(GetEventFlg_("BFG_RULER_ADD_002") == true){
		SetMotion_(rulerpoint01, "GIMMICK_2", 0);
	}
	// ルーラポイント(送電施設前)
	rulerpoint02 <- ArrangePointGimmick_("o_com_08", g_rulerpoint, "g_rulerpoint02");
	if(GetEventFlg_("BFG_RULER_ADD_005") == true){
		SetMotion_(rulerpoint02, "GIMMICK_2", 0);
	}
	// ルーラポイント(北西ゲート前)
	rulerpoint03 <- ArrangePointGimmick_("o_com_08", g_rulerpoint, "g_rulerpoint03");
	if(GetEventFlg_("BFG_RULER_ADD_030") == true){
		SetMotion_(rulerpoint03, "GIMMICK_2", 0);
	}
//-------------------------------------------------------------------------------
//リアクターポイント
	//大陸移動装置
	local reactorPoint01 = ArrangeMsgReactorPoint("reactorPoint_01", GetFlagID_("BFG_REACTER_POINT_015")
		, SHORT_DIST, "REC_POINT_NOC_01_01", "REC_POINT_NOC_01_02");
	if(check_restoration == false){
		//南の防災シャッター(北側)
		local reactorPoint02 = ArrangeMsgReactorPoint("reactorPoint_02_N", GetFlagID_("BFG_REACTER_POINT_016")
			, SHORT_DIST, "REC_POINT_NOC_02_01", "REC_POINT_NOC_02_02");
		//南の防災シャッター(南側)
		local reactorPoint02 = ArrangeMsgReactorPoint("reactorPoint_02_S", GetFlagID_("BFG_REACTER_POINT_016")
			, SHORT_DIST, "REC_POINT_NOC_02_01", "REC_POINT_NOC_02_02");
		//中央のシャッター
		local reactorPoint03 = ArrangeMsgReactorPoint("reactorPoint_03", GetFlagID_("BFG_REACTER_POINT_016")
			, SHORT_DIST, "REC_POINT_NOC_02_01", "REC_POINT_NOC_02_02");
		//北西の防災シャッター
		local reactorPoint04 = ArrangeMsgReactorPoint("reactorPoint_04", GetFlagID_("BFG_REACTER_POINT_016")
			, SHORT_DIST, "REC_POINT_NOC_02_01", "REC_POINT_NOC_02_02");
	}
	//送電施設
	local reactorPoint05 = ArrangeMsgReactorPoint("reactorPoint_05", GetFlagID_("BFG_REACTER_POINT_017")
		, LONG_DIST, "REC_POINT_NOC_03_01", "REC_POINT_NOC_03_02");
	//バトルGP本部
	local reactorPoint06 = ArrangeMsgReactorPoint("reactorPoint_06", GetFlagID_("BFG_REACTER_POINT_020")
		, LONG_DIST, "REC_POINT_NOC_04_01", "REC_POINT_NOC_04_02");
	//大陸移動装置
	local reactorPoint07 = ArrangeMsgReactorPoint("reactorPoint_07", GetFlagID_("BFG_REACTER_POINT_015")
		, SHORT_DIST, "REC_POINT_NOC_07_01", "REC_POINT_NOC_07_02");
	//CORE
	local reactorPoint08 = ArrangeMsgReactorPoint("reactorPoint_08", GetFlagID_("BFG_REACTER_POINT_001")
		, ENDLESS_DIST, "REC_POINT_NOC_05_01", "REC_POINT_NOC_05_02");
	//ルーラポイント
	local reactorPoint09 = ArrangeMsgReactorPoint("reactorPoint_09", GetFlagID_("BFG_REACTER_POINT_010")
		, SHORT_DIST, "REC_POINT_NOC_06_01", "REC_POINT_NOC_06_02");
	//ルーラポイント
	local reactorPoint10 = ArrangeMsgReactorPoint("reactorPoint_10", GetFlagID_("BFG_REACTER_POINT_010")
		, SHORT_DIST, "REC_POINT_NOC_06_01", "REC_POINT_NOC_06_02");
	// 石碑(まんたん)
	local reactorPoint11 = ArrangeMsgReactorPoint("reactorPoint_11", GetFlagID_("BFG_REACTER_POINT_045")
		, SHORT_DIST, "REC_POINT_NOC_08_01", "REC_POINT_NOC_08_02");
	// ルーラポイント(新規:北西ゲート)
	local reactorPoint12 = ArrangeMsgReactorPoint("reactorPoint_12", GetFlagID_("BFG_REACTER_POINT_010")
		, SHORT_DIST, "REC_POINT_NOC_06_01", "REC_POINT_NOC_06_02");
	// 天導の柱
	local reactorPoint13 = ArrangeMsgReactorPoint("reactorPoint_13", GetFlagID_("BFG_REACTER_POINT_176")
		, SHORT_DIST, "REC_POINT_NOC_09_01", "REC_POINT_NOC_09_02");

//-------------------------------------------------------------------------------
//マップナビ

	// ナビマップアイコン（ターゲット）
	// ローカル変数用
	local g_map_navi01 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.DESTINATION, "map_navi_01");  // ハシゴを登ったところ
	local g_map_navi02 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.DESTINATION, "map_navi_02");  // センタービル門の前
	local g_map_navi04 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.DESTINATION, "map_navi_04");  // キングダム
	local g_map_navi05 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.DESTINATION, "map_navi_05");  // 歓楽の霊道行き移動装置
	// グローバル変数用
	g_map_navi03 <- ArrangePointNaviMapIcon_(NAVIMAP_ICON.DESTINATION, "map_navi_03");  // 送電施設
	g_map_navi06 <- ArrangePointNaviMapIcon_(NAVIMAP_ICON.DESTINATION, "map_navi_06");  // まんたん石碑

	SetNaviMapIconVisible_(g_map_navi01, false);
	SetNaviMapIconVisible_(g_map_navi02, false);
	SetNaviMapIconVisible_(g_map_navi03, false);
	SetNaviMapIconVisible_(g_map_navi04, false);
	SetNaviMapIconVisible_(g_map_navi05, false);
	SetNaviMapIconVisible_(g_map_navi06, false);

	// 崩落進行中
	if(main_num == 2){
		if(city_num == 0
		|| city_num == GetFlagID_("CONST_SS_CI_CLIMB_THE_LADDER")){
			SetNaviMapIconVisible_(g_map_navi01, true);	// ハシゴを登ったところ
		}
		if(city_num == GetFlagID_("CONST_SS_CI_NOT_ENTER_THE_BUILDING")){
			SetNaviMapIconVisible_(g_map_navi02, true);	// センタービル門の前
		}
		if(city_num >= GetFlagID_("CONST_SS_CI_EVENING_CITY")
		&& city_num <= GetFlagID_("CONST_SS_CI_RESTORATION_POWER_PLANT")){
			// まんたん未取得状態,擬似デモ直後
			if(sub_num == 0 || sub_num == 1){
				SetNaviMapIconVisible_(g_map_navi06, true);	// まんたん石碑
			}
			// まんたん取得状態
			else{
				SetNaviMapIconVisible_(g_map_navi03, true);	// 送電施設
			}
		}
		if(city_num >= GetFlagID_("CONST_SS_CI_GO_BACK_KING")
		&& city_num <= GetFlagID_("CONST_SS_CI_TEST_RUN_HAIGOU")){
			SetNaviMapIconVisible_(g_map_navi04, true);	// キングダム
		}
		if(city_num == GetFlagID_("CONST_SS_CI_GO_NEXT_CONTINENT")){
			SetNaviMapIconVisible_(g_map_navi05, true);	// 歓楽の霊道行き移動装置
		}
	}
	// 裏シナリオ進行中
	else if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){				// NUm0  = 9
		// demo803[秘策はスターシード]の再生後 ～ アロマに指輪を見せるまで
		if(inside_num >= GetFlagID_("CONST_SS_OS_GO_CENTER_BILL_1F")		// Num10 = 4
		&& inside_num <= GetFlagID_("CONST_SS_OS_GET_DISC_ACCESSORY")){		// NUm10 = 8
			SetNaviMapIconVisible_(g_map_navi04, true);	// キングダム
		}
	}
	
	//ルーラポイントが起動後にルーラポイントアイコン表示
	if(GetEventFlg_("BFG_RULER_ADD_002") == true){
		local icon01 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.RULER_POINT , "g_rulerpoint01");
		SetNaviMapIconVisible_(icon01, true);
	}
	if(GetEventFlg_("BFG_RULER_ADD_005") == true){
		local icon02 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.RULER_POINT , "g_rulerpoint02");
		SetNaviMapIconVisible_(icon02, true);
	}
	if(GetEventFlg_("BFG_RULER_ADD_030") == true){
		local icon03 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.RULER_POINT , "g_rulerpoint03");
		SetNaviMapIconVisible_(icon03, true);
	}

	// 石碑(まんたん)アイコン
	icon_stone <- ArrangePointNaviMapIcon_(NAVIMAP_ICON.STONE , "stele");

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

//-------------------- 初期化 --------------------
// 起動条件：フィールド操作開始時
// マップ切り替え直後のデモ再生・バトル開始命令・
// 設置物をWaitを挟みながら操作するのはココ
//-------------------- 初期化 --------------------
function EventStartOperate()
{
// フラグの状態を取得
	local main_num   = GetNumFlg_("NUM_SCENARIO_MAIN");
	local green_num  = GetNumFlg_("NUM_SCENARIO_SUB_GREEN");
	local city_num   = GetNumFlg_("NUM_SCENARIO_SUB_CITY");
	local sky_num    = GetNumFlg_("NUM_SCENARIO_SUB_SKY");
	local sub_num    = GetNumFlg_("NUM_FLG_GO_POWER_PLANT_STATE");

	// 送電施設で電力の復旧が行われたかをチェック(主にギミック用)
	local check_restoration = GetEventFlg_("BFG_RESTORATION_POWER_PLANT");
	// 全滅復帰フラグ
	local check_dead = GetEventFlg_("BFG_DEAD_RETURN");

	//---------------
	// ▼ギミック設定
	//---------------
	local examine_stele = GetEventFlg_("BFG_EXAMINE_FULLTANK_STELE");
	if(examine_stele == true){
		// 石碑は光らない
		SetMotion_(g_full_stele, "GIMMICK_2", 0);
		DebugPrint("石碑(まんたん)のアニメはGIMMICK_2です");
		SetNaviMapIconVisible_(icon_stone, false);
	}
	else{
		// 石碑は光る
		SetMotion_(g_full_stele, "GIMMICK_0", 0);
		DebugPrint("石碑(まんたん)のアニメはGIMMICK_0です");
		SetNaviMapIconVisible_(icon_stone, true);
	}

	//-----------
	// ▼全滅復帰
	//-----------
	// 復帰位置のチェック
	if(check_dead == true){
		if(main_num == GetFlagID_("CONST_SM_CITY")){
			if(city_num < GetFlagID_("CONST_SS_CI_EVENING_CITY")){
				// 疑似デモのBGMを頭打ちにするフラグ
				SetEventFlg_("BFG_RETURN_BATTLE_FIRLD_BGM_HEAD", true);
				// 全滅通知Bitフラグをfalseに戻す( プログラムで立ててスクリプトで降ろす )
				SetEventFlg_("BFG_DEAD_RETURN", false);
				// 全滅復帰デモ
				uDeadReturnDemo1();
			}
			else if(city_num >= GetFlagID_("CONST_SS_CI_EVENING_CITY")
			&& city_num <= GetFlagID_("CONST_SS_CI_RESTORATION_POWER_PLANT")){
				// 疑似デモのBGMを頭打ちにするフラグ
				SetEventFlg_("BFG_RETURN_BATTLE_FIRLD_BGM_HEAD", true);
				// 全滅通知Bitフラグをfalseに戻す( プログラムで立ててスクリプトで降ろす )
				SetEventFlg_("BFG_DEAD_RETURN", false);
				// 全滅復帰デモ
				uDeadReturnDemo2();
			}
			else if(city_num == GetFlagID_("CONST_SS_CI_GO_BACK_KING")
			|| city_num == GetFlagID_("CONST_SS_CI_ESTABLISH_KINGDOM")){
				// 疑似デモのBGMを頭打ちにするフラグ
				SetEventFlg_("BFG_RETURN_BATTLE_FIRLD_BGM_HEAD", true);
				// 全滅通知Bitフラグをfalseに戻す( プログラムで立ててスクリプトで降ろす )
				SetEventFlg_("BFG_DEAD_RETURN", false);
				// 全滅復帰デモ
				uDeadReturnDemo3();
			}
			else{
				// 例外
			}
		}
	}

	//----------
	// ▼BGM変更
	//----------
	// 崩落都市に来て最初のタイミング
	if(main_num == GetFlagID_("CONST_SM_CITY")){
		if(city_num == GetFlagID_("CONST_SS_CI_CLIMB_THE_LADDER")){
			StopBgm_(0);
			SetEventFlg_("BFG_A00_00_ENVIRONMENT_BGM_PLAY", true);
		}
	}
	// 高空開始
	else if(main_num == GetFlagID_("CONST_SM_SKY")){				// Num0 = 8
		// 巨大ボーショックを倒すまで
		if(sky_num < GetFlagID_("CONST_SS_SK_GO_GRAVE_SKY")){		// Num9 < 18
			StopBgm_(0);
			SetEventFlg_("BFG_A00_00_ENVIRONMENT_BGM_PLAY", true);
		}
	}

	//-----------------------
	// ▼移動装置を使用した時
	//-----------------------
	if(GetEventFlg_("BFG_RIDE_OFF_USED_TRANSFER") == true){
		UsingTransfer();
		
		// 崩落都市に来て最初のタイミング
		if(main_num == GetFlagID_("CONST_SM_CITY")){
			if(city_num == GetFlagID_("CONST_SS_CI_CLIMB_THE_LADDER")){
				CommSavedAfterTransferDemo("BFG_SCENARIO_CLEAR_GRASS");
			}
		}
		
		SetEventFlg_("BFG_RIDE_OFF_USED_TRANSFER", false);
	}

	//-----------------
	// ▼擬似デモの再生
	//-----------------
	if(GetEventFlg_("BFG_RIDE_OFF_FLAG_BEFORE_STELE") == true){
		CommChangeMomentFadeOut(FADE_COLOR_BLACK);
		SetEventFlg_("BFG_RIDE_OFF_FLAG_BEFORE_STELE", false);
		uPlayableDemoStele();
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

	EventEnd_();
}

//-------------------- NPC --------------------
//起動条件：NPCに向かってAボタンが押された時
//OpenMsgWnd_() -> ShowMsg_() -> KeyInputWait_() の順に呼び出すこと
//-------------------- NPC --------------------
function TouchNpc()
{
// フラグの状態を取得
	local main_num   = GetNumFlg_("NUM_SCENARIO_MAIN");
	local city_num   = GetNumFlg_("NUM_SCENARIO_SUB_CITY");
	local sub_num    = GetNumFlg_("NUM_FLG_GO_POWER_PLANT_STATE");

	// NPCの種類を取得
	local target = GetTargetId_();

	switch(target)
	{
	case g_king:
		ContentKing(main_num, city_num);
		break;
	case g_jack:
		ContentJack(main_num, city_num);
		break;
	case g_ace:
		ContentAce(main_num, city_num);
		break;
	case g_queen:
		ContentQueen(main_num, city_num);
		break;
	case g_npc1:
		ContentNPC_A(main_num, city_num);
		break;
	case g_npc2:
		ContentNPC_B(main_num, city_num);
		break;
	case g_npc1_2:
		ContentBOK(main_num, city_num);
		break;
	case g_npc2_2:
		ContentIMP(main_num, city_num);
		break;
	case g_npc5:
		ContentBNK(main_num, city_num);
		break;
	case g_npc7:
		ContentBUT(main_num, city_num);
		break;
	case g_npc8:
		ContentREC(main_num, city_num);
		break;
	case g_npc9:
		ContentACC(main_num, city_num);
		break;
	case g_inn:
		// 主人公の位置と向きを修正
		local re_pos = Vec3(33.534, -46.050, 1002.144);	// 復帰位置を指定
		local re_dir = 120;								// 向きを指定
		// 宿屋で表示するメッセージを指定
		local message_key_1 = "INN_MSG_CITY_1ST_001";
		local message_key_2 = "INN_MSG_CITY_1ST_002";
		local message_key_3 = "INN_MSG_CITY_1ST_003";
		// メッセージの表示
		OpenMsgWnd_();
		ShowMsg_(message_key_1);	// 「やぁ いらっしゃい…
		KeyInputWait_();
		switch(GetQueryResult_())
		{
		case QUERY2_0:
		// 泊まる処理
			CloseMsgWnd_();
			// 宿屋の共通の回復処理
			CommTaskInn(re_pos, re_dir, false, g_inn);
			// メッセージの表示
			OpenMsgWnd_();
			ShowMsg_(message_key_3);	// 「おはよーだっちょ…
			KeyInputWait_();
			CloseMsgWnd_();
			break;
		case QUERY2_1:
		// やめる処理
			// メッセージの表示
			ShowMsg_(message_key_2);	// 「わかったっちょ…
			KeyInputWait_();
			CloseMsgWnd_();
			break;
		}
		break;
	default:
		DebugPrint("話す相手がいません");
		break;
	}

	EventEnd_();
}

//-------------------- NPC --------------------
//起動条件：リアクターを使用した本音会話
//OpenMsgWnd_() -> ShowMsg_() -> KeyInputWait_() の順に呼び出すこと
//-------------------- NPC --------------------
function ReactorAnalyze()
{
// フラグの状態を取得
	local main_num   = GetNumFlg_("NUM_SCENARIO_MAIN");
	local city_num   = GetNumFlg_("NUM_SCENARIO_SUB_CITY");
	local sub_num    = GetNumFlg_("NUM_FLG_GO_POWER_PLANT_STATE");

	EventEnd_();
}


//-------------------- イベント地雷 --------------------
//起動条件：マップに配置したメッシュに触れたとき
//-------------------- イベント地雷 --------------------
function TouchEventMine(){
// フラグの状態を取得
	local main_num   = GetNumFlg_("NUM_SCENARIO_MAIN");
	local green_num  = GetNumFlg_("NUM_SCENARIO_SUB_GREEN");
	local city_num   = GetNumFlg_("NUM_SCENARIO_SUB_CITY");
	local sub_num    = GetNumFlg_("NUM_FLG_GO_POWER_PLANT_STATE");
	local dont_use_transfer1 = GetEventFlg_("BFG_DONT_TRANSFER_GREEN_TO_CITY");// 草原-崩落間の大陸移動装置の使用を禁止するフラグ
	local dont_use_transfer2 = GetEventFlg_("BFG_DONT_TRANSFER_CITY_TO_GRAVE");// 崩落-霊道間の大陸移動装置の使用を禁止するフラグ

	local target = GetTouchEventMineId_();
	local player = GetPlayerId_();

	// 送電施設で電力の復旧が行われたかをチェック
	local check_restoration = GetEventFlg_("BFG_RESTORATION_POWER_PLANT");

	switch(target)
	{
	// 移動装置(草原行き)
	case g_mine_00:
		if(dont_use_transfer1 == false){
			// 選択肢メッセージ
			OpenMsgWnd_();
			ShowMsg_("MINE_00_MSG");
			KeyInputWait_();
			if(GetQueryResult_() == QUERY_YES){
				CloseMsgWnd_();
				// ライド状態で大陸移動した場合、ライドを解除するフラグ
				SetEventFlg_("BFG_RIDE_OFF_USED_TRANSFER", true);
				DeleteEventMine_(g_mine_00);
				// 草原の復帰位置
				ChangeMapPosDir_("H00_00", Vec3(-613.237, 555.044, -1783.254), 100);
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
		break;
	// 移動装置(霊道行き)
	case g_mine_07:
		if(dont_use_transfer2 == false){
			// 歓楽の霊道行きの移動装置解禁フラグ
			if(GetEventFlg_("BFG_ENABLED_GO_TO_GRAVE_TRANSFER") == true){
				if(city_num == GetFlagID_("CONST_SS_CI_GO_NEXT_CONTINENT")){
					// ボタン連打でバグが発生するので地雷を削除
					DeleteEventMine_(g_mine_07);
					// 崩落都市の大陸クリアフラグを設定
					SetEventFlg_("BFG_SCENARIO_CLEAR_CITY", true);
					// 大陸移動のデモ中にセーブポイントを挟む際に使用するフラグ
					SetEventFlg_("BFG_SAVE_POINT_FLAG", true);
					// ライド状態で大陸移動した場合、ライドを解除するフラグ
					SetEventFlg_("BFG_RIDE_OFF_USED_TRANSFER", true);
					// イベントフラグを進める
					SetNumFlg_("NUM_SCENARIO_MAIN", GetFlagID_("CONST_SM_CEMETERY"));			// メインフラグ
					SetNumFlg_("NUM_SCENARIO_SUB_CITY", 0);		// 崩落都市フラグ(29 -> 0に戻す)
					SetNumFlg_("NUM_SCENARIO_SUB_GRAVE", 0);	// 歓楽の霊道フラグ
					DebugPrint("NUM_SCENARIO_MAIN の値は " + main_num + " になりました。");
					// 歓楽の霊道へ
					SetReturnDemoMap_("G00_00");
					SetReturnDemoPosDir_(Vec3(-1261.0, 130.000, 1602.0), 100);
					// Demo131[転送装置使用(歓楽の霊道へ)]
					ChangeDemo_(131);
				}
				else{
					OpenMsgWnd_();
					ShowMsg_("MINE_07_MSG_02");
					KeyInputWait_();
					if(GetQueryResult_() == QUERY_YES){
						CloseMsgWnd_();
						// ライド状態で大陸移動した場合、ライドを解除するフラグ
						SetEventFlg_("BFG_RIDE_OFF_USED_TRANSFER", true);
						DeleteEventMine_(g_mine_07);
						// 歓楽の霊道へ
						ChangeMapPosDir_("G00_00", Vec3(-1261.0, 154.000, 1602.0), 100);
					}
					else{
						CloseMsgWnd_();
					}
				}
			}
			else{
				CommonMessageT("MINE_07_MSG_01", "NAME_NONE");
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
		break;
	// ハシゴを上る
	case g_mine_02:
		if(main_num == GetFlagID_("CONST_SM_CITY")){
			if(city_num == GetFlagID_("CONST_SS_CI_CLIMB_THE_LADDER")){
				// アサートが発生するので必ず地雷を削除
				DeleteEventMine_(g_mine_02);
				// サブフラグを変更
				SetNumFlg_("NUM_SCENARIO_SUB_CITY",  GetFlagID_("CONST_SS_CI_NOT_ENTER_THE_BUILDING"));
				// 全滅復帰マップ指定Numフラグ
				SetNumFlg_("NUM_DEAD_RETURN_MAP", GetFlagID_("CONST_DEAD_RETURN_MAP_A00_00"));
				// デモ後の主人公の位置を修正（仮）
				SetReturnDemoPosDir_(Vec3(23.616, 289.621, 2133.921), -85);
				// Demo101[目的地はバトルＧＰ本部ビル]を再生
				ChangeDemo_(101);
			}
		}
		break;
	// シャッター前のキング達に近づく
	case g_mine_03:
		if(main_num == GetFlagID_("CONST_SM_CITY")){
			if(city_num == GetFlagID_("CONST_SS_CI_NOT_ENTER_THE_BUILDING")){
				// アサートが発生するので必ず地雷を削除
				DeleteEventMine_(g_mine_03);
				// サブフラグを変更
				SetNumFlg_("NUM_SCENARIO_SUB_CITY",  GetFlagID_("CONST_SS_CI_EVENING_CITY"));
				// デモ後の主人公の位置
				SetReturnDemoPosDir_(Vec3(-0.024, -1.318, 851.988), 180);
				// Demo102[バトルＧＰ本部ビルに入れないノチョーラたち]を再生
				ChangeDemo_(102);
			}
		}
		break;
	// 送電施設に近づく
	case g_mine_04:
		// アサートが発生するので必ず地雷を削除
		DeleteEventMine_(g_mine_04);
		// サブフラグを変更
		SetNumFlg_("NUM_SCENARIO_SUB_CITY",  GetFlagID_("CONST_SS_CI_GO_POWER_PLANT"));
		// センタービル前の扉が開いたら配置モンスターを解禁する用フラグ
		SetEventFlg_("BFG_LIMIT_DEMO_EVENING_CITY", true);
		// デモ後の主人公の位置を修正
		SetReturnDemoPosDir_(Vec3(1574.280, -271.030, -904.503), 120);
		// Demo124[迫る日暮れ]を再生
		ChangeDemo_(124);
		break;
	// 入口前のキング達に近づく
	case g_mine_05:
		if(main_num == GetFlagID_("CONST_SM_CITY")){
			if(city_num == GetFlagID_("CONST_SS_CI_GO_BACK_KING")){
				// アサートが発生するので必ず地雷を削除
				DeleteEventMine_(g_mine_05);
				// サブフラグを変更
				SetNumFlg_("NUM_SCENARIO_SUB_CITY",  GetFlagID_("CONST_SS_CI_ESTABLISH_KINGDOM"));
				// 移民開始フラグをfalseにする
				SetEventFlg_("BFG_START_IMMIGRATION", false);
				// 移民完了フラグをtrueにする
				SetEventFlg_("BFG_FINISHED_IMMIGRATION", true);
				// デモ後の主人公の位置を修正
				SetReturnDemoPosDir_(Vec3(0.000, 66.357, 256.822), 180);
				// Demo108[ノチョーラキングダムの成立]
				ChangeDemo_(108);
			}
		}
		break;
	// センタービルに地雷追加(保険)
	case g_mine_06:
		if(check_restoration == false){
			local set_dir = 180;
			CommPlayerTurnAroundDir(set_dir);
			CommonMessageT("NOT_USE_MESSAGE_BILL_ENTRANCE", "NAME_NONE");
		}
		break;
	// 中央の最初の扉に開かないというメッセージを表示させる
	case mine_wall00:
		if(check_restoration == false){
			CommPlayerTurnAroundObj(wall_00);
			CommonMessageT("NOT_USE_MESSAGE_BILL_ENTRANCE", "NAME_NONE");
		}
		break;
	case mine_wall_01:
		if(check_restoration == false){
			CommPlayerTurnAroundObj(wall_01);
			CommonMessageT("NOT_USE_MESSAGE_BILL_ENTRANCE", "NAME_NONE");
		}
		break;
	case mine_wall_02:
		if(check_restoration == false){
			CommPlayerTurnAroundObj(wall_02);
			CommonMessageT("NOT_USE_MESSAGE_BILL_ENTRANCE", "NAME_NONE");
		}
		break;
	case mine_wall_03:
		if(check_restoration == false){
			CommPlayerTurnAroundObj(wall_03);
			CommonMessageT("NOT_USE_MESSAGE_BILL_ENTRANCE", "NAME_NONE");
		}
		break;
	case mine_wall_04:
		if(check_restoration == false){
			CommPlayerTurnAroundObj(wall_04);
			CommonMessageT("NOT_USE_MESSAGE_BILL_ENTRANCE", "NAME_NONE");
		}
		break;
	// センタービルのシャッター前のルーラポイント
	case mine_ruler_01:
		// ルーラポイントの共通処理
		CommPlayerTurnAroundObj(rulerpoint01);
		CommRulerPointEvent(rulerpoint01, "BFG_RULER_ADD_002", "g_rulerpoint01");
		break;
	// 送電施設の前のルーラポイント
	case mine_ruler_02:
		// ルーラポイントの共通処理
		CommPlayerTurnAroundObj(rulerpoint02);
		CommRulerPointEvent(rulerpoint02, "BFG_RULER_ADD_005", "g_rulerpoint02");
		break;
	// 北西ゲート前のルーラポイント
	case mine_ruler_03:
		// ルーラポイントの共通処理
		CommPlayerTurnAroundObj(rulerpoint03);
		CommRulerPointEvent(rulerpoint03, "BFG_RULER_ADD_030", "g_rulerpoint03");
		break;
	// まんたん石碑付近の地雷(ライド解除後擬似デモ再生 2次DB #3442)
	case mine_full:
		CommPlayerTurnAroundObj(g_full_stele); // 石碑の方を向かせる
		SetEventFlg_("BFG_RIDE_OFF_FLAG_BEFORE_STELE", true);
		ChangeMapPosDir_("A00_00", Vec3(-1522.246, 13.681, -795.441), -126);
		break;
	// ゲート前(ルーラポイント進入禁止)
	case mine_stele00:
		StopTalkAcc(0);
		break;
	case mine_stele01:
		StopTalkAcc(1);
		break;
	case mine_stele07:
	case mine_stele08:
		StopTalkAcc(2);
		break;
	case mine_stele09:
		StopTalkAcc(3);
		break;
	// まんたん取得デモ開始
	case mine_stele02:
		// 封鎖用地雷をの設置
		mine_stele03 = SetPointBoxEventMine_("09_Mine", false);
		mine_stele04 = SetPointBoxEventMine_("10_Mine", false);
		mine_stele05 = SetPointBoxEventMine_("11_Mine", false);
		mine_stele06 = SetPointBoxEventMine_("12_Mine", false);
		mine_stele10 = SetPointBoxEventMine_("11_Mine02", false);
		// (備忘録)ここでDeleteEventMine_(mine_stele02)より前に地雷をの設置する
		DeleteEventMine_(mine_stele02);
		SetNumFlg_("NUM_FLG_GO_POWER_PLANT_STATE", 1);			// 送電施設に行くまでの進行フラグを進める
		// ルーラを禁止するフラグを設定
		SetEventFlg_("BFG_PLAYERABILITY_RULER_PROHIBIT", true);
		// まんたん取得デモ再生
		uFullTankDemo();
		break;
	// 石碑を調べるまで封鎖する地雷
	case mine_stele03:
		uStopTalkRec(3);
		break;
	case mine_stele04:
		uStopTalkRec(4);
		break;
	case mine_stele05:
		uStopTalkRec(5);
		break;
	case mine_stele06:
		uStopTalkRec(6);
		break;
	case mine_stele10:
		uStopTalkRec(5);
		break;
	// ハシゴ
	case g_mine_ladder:
		// はしごの初回説明フラグを立てる
		SetEventFlg_("BFG_CHECK_USED_FIRST_TIME_LADDER", true);
		DeleteEventMine_(g_mine_ladder);
		g_mine_ladder <- C_NONE_ID;
		uLadderMsg();
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
		DebugPrint("対応するイベント地雷はありません");
		break;
	}
	
	
	EventEnd_();
}

//======================================================
// 自作関数：地雷でアクセサリー屋に止められる処理
//------------------------------------------------------
// 引数    ：0 -> mine_stele00, 1 -> mine_stele01, 2 -> mine_stele07,mine_stele08, 3 -> mine_stele09
// 戻り値  ：なし
//======================================================
function StopTalkAcc(num)
{
	local player = GetPlayerId_();
	local playerPos = GetPos_(player);
	local npc = g_npc9;
	
	local PLAYER_BACK_POS = Vec3(-1591.824, 15.000, -522.503);
	local ROT_DIR = 6;
	local MOTION_BLEND_FRAME = 4;
	local PLAYER_BACK_DIR;
	if(num == 0){
		PLAYER_BACK_DIR =  -30;
	}
	else if(num == 1){
		PLAYER_BACK_DIR =   60;
	}
	else if(num == 2){
		PLAYER_BACK_DIR =  140;
	}
	else{
		PLAYER_BACK_DIR =  60;
	}
	
	// 発見エフェクトをアクセサリー屋に表示
	SetBoneEffect_("ef300_20_target_icon", npc);
	PlaySE_("SE_DEM_053");		// 「ピンッ！」
	Wait_(15);
	// アクセサリー屋をプレイヤーの方に向かせる< 備忘録 : Task_RotateToPos_()した後,WaitTask()しないと回転しないので注意 >
	SetMotion_(npc, "WALK", MOTION_BLEND_FRAME);
	local rotateTask = Task_RotateToPos_(npc, playerPos, ROT_DIR);
	WaitTask(rotateTask);
	SetMotion_(npc, "WAIT", MOTION_BLEND_FRAME);
	// アクセサリー屋のメッセージ表示
	OpenMsgWnd_();
	SetTalkName_("NAME_NONE");
	ShowMsg_("DEMO_101_AFT_ACC");
	KeyInputWait_();
	CloseMsgWnd_();
	// アクセサリー屋も正面に向き直る
	SetMotion_(npc, "WALK", MOTION_BLEND_FRAME);
	// アクセサリー屋を向き直させる座標
	local frondPos = Vec3(-1650.000, 18.000, -415.000);
	local rotateFrontTask = Task_RotateToPos_(npc, frondPos, ROT_DIR);
	// アクセサリー屋を待機モーションに戻す
	WaitTask(rotateFrontTask);
	SetMotion_(npc, "WAIT", MOTION_BLEND_FRAME);
	// プレイヤーバックして移動
	CommPlayerTurnMoveDirWalk(PLAYER_BACK_DIR);
}

//======================================================
// 自作関数：擬似デモ(リアクター反応)
//------------------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//======================================================
function uFullTankDemo()
{
	local player = GetPlayerId_();
	local g_stele_pos = Vec3(-1529.718, 14.149, -788.056);
	
	// リアクター反応があった時の共通処理
	CommReactorActionDiscover();
	// 特技石碑に近づいた時のメッセージ表示
	CommApproachStatueMsg(ABILITY_FULLTANK);
	// モーションを待機状態に戻す共通処理
	CommResetPlayerMotion();
	
	// 石碑の方を向く
	if(!IsPlayerRide_()){
		SetMotion_(player, MOT_WALK, BLEND_M);
	}
	local rotateTask = Task_RotateToPos_(player, g_stele_pos, ROTATE_EVENT_DEF);
	WaitTask(rotateTask);
	
	// 間を持たせる
	Wait_(15);
	SetMotion_(player, MOT_WAIT, BLEND_M);
	Wait_(5);
}

//======================================================
// 自作関数：擬似デモ(夕方になる)※進行度合が「CONST_SS_CI_EVENING_CITY」のときのみ
//------------------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//======================================================
function uEveningDemo()
{
	// 60Fで夕方にする
	local f = 0;
	for(f = 0; f <= 60; ++f){
		SetTime_(f * 90);
		Wait_(1);
	}
	// エースからの通信とメッセージ
	OpenConnective("connective_ace");
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("ACE_SPECIAL_MSG");
	KeyInputWait_();
	CloseMsgWnd_();
	CloseConnective();
}

//======================================================
// 自作関数：地雷でリアクターに止められる処理
//------------------------------------------------------
// 引数    ：3 -> mine_stele03, 4 -> mine_stele04, 5 -> mine_stele05
// 戻り値  ：なし
//======================================================
function uStopTalkRec(num)
{
	local player = GetPlayerId_();
	local PLAYER_BACK_POS = Vec3(-1516.202, 13.457, -789.543);
	local MOTION_BLEND_FRAME = 4;
	local PLAYER_BACK_DIR = 0;
	if(num == 3){
		PLAYER_BACK_DIR =  148;
	}else if(num == 4){
		PLAYER_BACK_DIR = -135;
	}else if(num == 5){
		PLAYER_BACK_DIR =  -30;
	}else{
		PLAYER_BACK_DIR =   60;
	}
	
	// リアクターからのお知らせ
	CommReactorActionNotice();
	// 特技石碑に近づいた時のメッセージ表示
	CommApproachStatueMsg(ABILITY_FULLTANK);
	// リアクター反応があった時、最後にプレイヤーのモーションを待機状態に戻す
	CommResetPlayerMotion();
	// 少し間を持たせる
	Wait_(15);
	// プレイヤーバックして移動< 2次DB#5981 東藤さん指示で歩く距離を長くする >
	CommPlayerTurnMoveDirWalk(PLAYER_BACK_DIR, 60);
}

//=====================================================
// 自作関数：ハシゴ地雷の処理
//-----------------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//=====================================================
function uLadderMsg()
{
	// リアクターが何かを発見した挙動を行う
	CommReactorActionDiscover();

	// リアクターのメッセージ表示
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_REACTOR");
	ShowMsg_("MINE_LADDER_MSG");
	KeyInputWait_();
	CloseMsgWnd_();

	// プレイヤーモーションを元に戻す(ライド中は無視する)
	CommResetPlayerMotion();
}

//--------------------------
//  メッセージの表示関数(名前表示あり)
//--------------------------
function CommonMessageT(message_key, name_tag){
	OpenMsgWnd_();
	SetTalkName_(name_tag);
	ShowMsg_(message_key);
	KeyInputWait_();
	CloseMsgWnd_();
}

//-------------------------------------------------------
// キングの話す内容
//-------------------------------------------------------
function ContentKing(main_num, city_num)
{
	if(main_num = 2){
		switch(city_num)
		{
		case GetFlagID_("CONST_SS_CI_EVENING_CITY"):
		case GetFlagID_("CONST_SS_CI_GO_POWER_PLANT"):
		case GetFlagID_("CONST_SS_CI_START_UP_POWER_PLANT"):
		case GetFlagID_("CONST_SS_CI_RESTORATION_POWER_PLANT"):
			CommonMessageT("DEMO_102_AFT_KNG", "NAME_TAG_KING");
			break;
		}
	}
}

//-------------------------------------------------------
// ジャックの話す内容
//-------------------------------------------------------
function ContentJack(main_num, city_num)
{
	if(main_num = 2){
		switch(city_num)
		{
		case GetFlagID_("CONST_SS_CI_EVENING_CITY"):
		case GetFlagID_("CONST_SS_CI_GO_POWER_PLANT"):
		case GetFlagID_("CONST_SS_CI_START_UP_POWER_PLANT"):
		case GetFlagID_("CONST_SS_CI_RESTORATION_POWER_PLANT"):
			CommonMessageT("DEMO_102_AFT_JAC", "NAME_TAG_JACK");
			break;
		}
	}
}

//-------------------------------------------------------
// エースの話す内容
//-------------------------------------------------------
function ContentAce(main_num, city_num)
{
	if(main_num = 2){
		switch(city_num)
		{
		case GetFlagID_("CONST_SS_CI_EVENING_CITY"):
		case GetFlagID_("CONST_SS_CI_GO_POWER_PLANT"):
		case GetFlagID_("CONST_SS_CI_START_UP_POWER_PLANT"):
		case GetFlagID_("CONST_SS_CI_RESTORATION_POWER_PLANT"):
			CommonMessageT("DEMO_102_AFT_ACE", "NAME_TAG_ACE");
			break;
		}
	}
}

//-------------------------------------------------------
// クイーンの話す内容
//-------------------------------------------------------
function ContentQueen(main_num, city_num)
{
	if(main_num = 2){
		switch(city_num)
		{
		case GetFlagID_("CONST_SS_CI_EVENING_CITY"):
		case GetFlagID_("CONST_SS_CI_GO_POWER_PLANT"):
		case GetFlagID_("CONST_SS_CI_START_UP_POWER_PLANT"):
		case GetFlagID_("CONST_SS_CI_RESTORATION_POWER_PLANT"):
			CommonMessageT("DEMO_102_AFT_QEN", "NAME_TAG_QUEEN");
			break;
		}
	}
}

//-------------------------------------------------------
// NPC_Aの話す内容
//-------------------------------------------------------
function ContentNPC_A(main_num, city_num)
{
	if(main_num = 2){
		switch(city_num)
		{
		case GetFlagID_("CONST_SS_CI_CLIMB_THE_LADDER"):
		case GetFlagID_("CONST_SS_CI_NOT_ENTER_THE_BUILDING"):
			CommonMessageT("DEMO_100_AFT_NPC_A", "NAME_TAG_NOCHORIN");
			break;
		case GetFlagID_("CONST_SS_CI_EVENING_CITY"):
		case GetFlagID_("CONST_SS_CI_GO_POWER_PLANT"):
		case GetFlagID_("CONST_SS_CI_START_UP_POWER_PLANT"):
		case GetFlagID_("CONST_SS_CI_RESTORATION_POWER_PLANT"):
			CommonMessageT("DEMO_101_AFT_NPC_A", "NAME_TAG_NOCHORIN");
			break;
		}
	}
}

//-------------------------------------------------------
// NPC_Bの話す内容
//-------------------------------------------------------
function ContentNPC_B(main_num, city_num)
{
	if(main_num = 2){
		switch(city_num)
		{
		case GetFlagID_("CONST_SS_CI_NOT_ENTER_THE_BUILDING"):
		case GetFlagID_("CONST_SS_CI_EVENING_CITY"):
		case GetFlagID_("CONST_SS_CI_GO_POWER_PLANT"):
		case GetFlagID_("CONST_SS_CI_START_UP_POWER_PLANT"):
		case GetFlagID_("CONST_SS_CI_RESTORATION_POWER_PLANT"):
			CommonMessageT("DEMO_101_AFT_NPC_B_1", "NAME_NONE");
			break;
		}
	}
}

//-------------------------------------------------------
// 道具屋の話す内容
//-------------------------------------------------------
function ContentIMP(main_num, city_num)
{
	if(main_num = 2){
		switch(city_num)
		{
		case GetFlagID_("CONST_SS_CI_NOT_ENTER_THE_BUILDING"):
		case GetFlagID_("CONST_SS_CI_EVENING_CITY"):
		case GetFlagID_("CONST_SS_CI_GO_POWER_PLANT"):
		case GetFlagID_("CONST_SS_CI_START_UP_POWER_PLANT"):
		case GetFlagID_("CONST_SS_CI_RESTORATION_POWER_PLANT"):
			CommonMessageT("DEMO_101_AFT_IMP_2", "NAME_NONE");
			break;
		}
	}
}

//-------------------------------------------------------
// 銀行の話す内容
//-------------------------------------------------------
function ContentBNK(main_num, city_num)
{
	if(main_num = 2){
		switch(city_num)
		{
		case GetFlagID_("CONST_SS_CI_CLIMB_THE_LADDER"):
		case GetFlagID_("CONST_SS_CI_NOT_ENTER_THE_BUILDING"):
			CommonMessageT("DEMO_100_AFT_NPC_NOCHORIN", "NAME_NONE");
			break;
		case GetFlagID_("CONST_SS_CI_EVENING_CITY"):
		case GetFlagID_("CONST_SS_CI_GO_POWER_PLANT"):
		case GetFlagID_("CONST_SS_CI_START_UP_POWER_PLANT"):
		case GetFlagID_("CONST_SS_CI_RESTORATION_POWER_PLANT"):
			CommonMessageT("DEMO_101_AFT_BNK", "NAME_NONE");
			break;
		}
	}
}

//-------------------------------------------------------
// 本屋の話す内容
//-------------------------------------------------------
function ContentBOK(main_num, city_num)
{
	if(main_num = 2){
		switch(city_num)
		{
		case GetFlagID_("CONST_SS_CI_NOT_ENTER_THE_BUILDING"):
			CommonMessageT("DEMO_102_AFT_NPC_A", "NAME_NONE");
			break;
		case GetFlagID_("CONST_SS_CI_EVENING_CITY"):
		case GetFlagID_("CONST_SS_CI_GO_POWER_PLANT"):
		case GetFlagID_("CONST_SS_CI_START_UP_POWER_PLANT"):
		case GetFlagID_("CONST_SS_CI_RESTORATION_POWER_PLANT"):
			CommonMessageT("DEMO_102_AFT_NPC_A_02", "NAME_NONE");
			break;
		}
	}
}

//-------------------------------------------------------
// 肉屋の話す内容
//-------------------------------------------------------
function ContentBUT(main_num, city_num)
{
	if(main_num = 2){
		switch(city_num)
		{
		case GetFlagID_("CONST_SS_CI_NOT_ENTER_THE_BUILDING"):
		case GetFlagID_("CONST_SS_CI_EVENING_CITY"):
		case GetFlagID_("CONST_SS_CI_GO_POWER_PLANT"):
		case GetFlagID_("CONST_SS_CI_START_UP_POWER_PLANT"):
		case GetFlagID_("CONST_SS_CI_RESTORATION_POWER_PLANT"):
			CommonMessageT("DEMO_101_AFT_BUT", "NAME_NONE");
			break;
		}
	}
}

//-------------------------------------------------------
// リアクター屋の話す内容
//-------------------------------------------------------
function ContentREC(main_num, city_num)
{
	if(main_num = 2){
		switch(city_num)
		{
		case GetFlagID_("CONST_SS_CI_NOT_ENTER_THE_BUILDING"):
		case GetFlagID_("CONST_SS_CI_EVENING_CITY"):
		case GetFlagID_("CONST_SS_CI_GO_POWER_PLANT"):
		case GetFlagID_("CONST_SS_CI_START_UP_POWER_PLANT"):
		case GetFlagID_("CONST_SS_CI_RESTORATION_POWER_PLANT"):
			CommonMessageT("DEMO_101_AFT_REC", "NAME_NONE");
			break;
		}
	}
}

//-------------------------------------------------------
// アクセサリー屋の話す内容
//-------------------------------------------------------
function ContentACC(main_num, city_num)
{
	if(main_num = 2){
		switch(city_num)
		{
		case GetFlagID_("CONST_SS_CI_NOT_ENTER_THE_BUILDING"):
			CommonMessageT("DEMO_101_AFT_ACC", "NAME_NONE");
			break;
		case GetFlagID_("CONST_SS_CI_EVENING_CITY"):
		case GetFlagID_("CONST_SS_CI_GO_POWER_PLANT"):
		case GetFlagID_("CONST_SS_CI_START_UP_POWER_PLANT"):
		case GetFlagID_("CONST_SS_CI_RESTORATION_POWER_PLANT"):
			local sub_num = GetNumFlg_("NUM_FLG_GO_POWER_PLANT_STATE");
			// まんたん未取得状態
			if(sub_num == 0 || sub_num == 1){
				CommonMessageT("DEMO_102_AFT_NPC_ACC_00", "NAME_NONE");
			}
			// まんたん取得状態
			else{
				CommonMessageT("DEMO_102_AFT_NPC_ACC", "NAME_NONE");
			}
			break;
		}
	}
}

//======================================================
// 自作関数：全滅復帰の擬似デモ1[崩落都市到着～バリケードに到着するまで]
//------------------------------------------------------
// 第一引数：なし
// 戻り値  ：なし
//======================================================
function uDeadReturnDemo1()
{
// 暗転
	CommChangeMomentFadeOut(FADE_COLOR_BLACK);
// 準備
	// BGM対応( 2次DB #5189 )
	local main_num   = GetNumFlg_("NUM_SCENARIO_MAIN");
	local city_num   = GetNumFlg_("NUM_SCENARIO_SUB_CITY");
	if(main_num == GetFlagID_("CONST_SM_CITY")){
		if(city_num == GetFlagID_("CONST_SS_CI_CLIMB_THE_LADDER")){
			SetEventFlg_("BFG_A00_00_ENVIRONMENT_BGM_PLAY", true);
		}
	}
	// 主人公の位置
	local player_pos = Vec3(-21.816, -20.000, 3241.817);
	local player_dir = -133;
	// 擬似デモ後の復帰位置
	local player_rtn_pos = Vec3(-21.816, -20.000, 3241.817);
	local player_rtn_dir = 170;
	// ウェイト
	local wait_speed     = 15;
	local wait_speed_def = 30;
	// プレイヤーID
	local player = GetPlayerId_();
	// カメラの角度
	local cam_dir = -105;
	local cam_rtn_dir = 180;
	// 定義した数値をセット
	SetPos_(player, player_pos);
	SetDir_(player, player_dir);
	SetCameraDir_(cam_dir);
	SetDirToPlayer_(g_npc1);
	Wait_(wait_speed);
	// ノチョリン(待機モーション→会話モーション)
	SetMotion_(g_npc1, "TALKLOOP", BLEND_N);
// 暗転明け
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	Wait_(FADE_DEF);
	// メッセージ表示
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_NOCHORIN");
	ShowMsg_("DEAD_RETURN_MSG_01");
	KeyInputWait_();
	CloseMsgWnd_();
	// ノチョリン(会話モーション→待機モーション)
	SetMotion_(g_npc1, "WAIT", BLEND_L);
	Wait_(wait_speed_def);
	// 回復処理＋共通メッセージ表示
	RecoveryAndMsg();
	Wait_(wait_speed);
// 暗転
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, wait_speed);
	SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, wait_speed);
	Wait_(20);
	WaitFade_();
// マップチェンジ
	ChangeMapPosDir_("A00_00", player_rtn_pos, player_rtn_dir);
}

//======================================================
// 自作関数：全滅復帰の擬似デモ2[バリケードに到着後～送電施設クリア]
//------------------------------------------------------
// 第一引数：なし
// 戻り値  ：なし
//======================================================
function uDeadReturnDemo2()
{
// 暗転
	CommChangeMomentFadeOut(FADE_COLOR_BLACK);
// 準備
	// 主人公の位置
	local player_pos = Vec3(3.997, 20.000, 809.251);
	local player_dir = -124;
	// 擬似デモ後の復帰位置
	local player_rtn_pos = Vec3(3.997, 20.000, 809.251);
	local player_rtn_dir = -124;
	// ウェイト
	local wait_speed     = 15;
	local wait_speed_def = 30;
	// プレイヤーID
	local player = GetPlayerId_();
	// カメラの角度
	local cam_dir = -130;
	local cam_rtn_dir = -90;
	// 定義した数値をセット
	SetPos_(player, player_pos);
	SetDir_(player, player_dir);
	SetCameraDir_(cam_dir);
	Wait_(wait_speed);
	// キング(待機モーション→会話モーション)
	SetMotion_(g_king, "TALKLOOP", BLEND_N);
// 暗転明け
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	Wait_(FADE_DEF);
	// メッセージ表示
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEAD_RETURN_MSG_02");
	KeyInputWait_();
	CloseMsgWnd_();
	// キング(会話モーション→待機モーション)
	SetMotion_(g_king, "WAIT", BLEND_L);
	Wait_(wait_speed_def);
	// 回復処理＋共通メッセージ表示
	RecoveryAndMsg();
	Wait_(wait_speed);
	// メッセージ表示
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEAD_RETURN_MSG_02_2");
	KeyInputWait_();
	CloseMsgWnd_();
// 暗転
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, wait_speed);
	SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, wait_speed);
	Wait_(20);
	WaitFade_();
// マップチェンジ
	ChangeMapPosDir_("A00_00", player_rtn_pos, player_rtn_dir);
}

//======================================================
// 自作関数：全滅復帰の擬似デモ3[送電施設クリア～移民完了]
//------------------------------------------------------
// 第一引数：なし
// 戻り値  ：なし
//======================================================
function uDeadReturnDemo3()
{
// 暗転
	CommChangeMomentFadeOut(FADE_COLOR_BLACK);
// 準備
	// 主人公の位置
	local player_pos = Vec3(0.000, 20.000, 510.000);
	local player_dir = 125;
	// 擬似デモ後の復帰位置
	local player_rtn_pos = Vec3(0.000, 20.000, 510.000);
	local player_rtn_dir = 180;
	// ウェイト
	local wait_speed     = 15;
	local wait_speed_def = 30;
	// プレイヤーID
	local player = GetPlayerId_();
	// カメラの角度
	local cam_dir = 180;
	local cam_rtn_dir = 180;
	// 定義した数値をセット
	SetPos_(player, player_pos);
	SetDir_(player, player_dir);
	SetCameraDir_(cam_dir);
	SetDirToPlayer_(dead_npc);
	Wait_(wait_speed);
	// ノチョリン(待機モーション→会話モーション)
	SetMotion_(dead_npc, "TALKLOOP", BLEND_N);
// 暗転明け
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	Wait_(FADE_DEF);
	// メッセージ表示
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_NOCHORIN");
	ShowMsg_("DEAD_RETURN_MSG_03");
	KeyInputWait_();
	CloseMsgWnd_();
	// ノチョリン(会話モーション→待機モーション)
	SetMotion_(dead_npc, "WAIT", BLEND_L);
	Wait_(wait_speed_def);
	// 回復処理＋共通メッセージ表示
	RecoveryAndMsg();
	Wait_(wait_speed);
// 暗転
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, wait_speed);
	SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, wait_speed);
	Wait_(20);
	WaitFade_();
// マップチェンジ
	ChangeMapPosDir_("A00_00", player_rtn_pos, player_rtn_dir);
}

//======================================================
// 自作関数：特技取得デモ
//------------------------------------------------------
// 第一引数：なし
// 戻り値  ：なし
//======================================================
function uPlayableDemoStele()
{
	// フラグ取得
	local main_num   = GetNumFlg_("NUM_SCENARIO_MAIN");
	local city_num   = GetNumFlg_("NUM_SCENARIO_SUB_CITY");
	
	// プレイヤーID
	local player = GetPlayerId_();
	
	DeleteEventMine_(mine_full);							//石碑用地雷削除
	DeleteEventMine_(mine_stele03);							//封鎖用地雷1削除
	DeleteEventMine_(mine_stele04);							//封鎖用地雷2削除
	DeleteEventMine_(mine_stele05);							//封鎖用地雷3削除
	DeleteEventMine_(mine_stele06);							//封鎖用地雷4削除
	DeleteEventMine_(mine_stele10);
	
	//主人公の位置を石碑の前に置く
	SetPos_(player, Vec3(-1522.246, 13.681, -795.441));
	SetDir_(player, -126);
	//カメラを設置
	SetPointCameraEye_("cameye_002");
	SetPointCameraTarget_("camtgt_002");
	Wait_(10);
	
	//スキル取得共通処理
	SkillStelePerformance(g_full_stele, ABILITY_FULLTANK);	//スキル取得共通処理
	
	SetEventFlg_("BFG_EXAMINE_FULLTANK_STELE", true);		// まんたんの石碑を調べる
// 備忘録( 心得の項目が「まんたん」から「モンスター特技」に変更の為 )
//		SetEventFlg_("BFG_TRAVEL_INFO_SHOW_020", true);			// 旅の心得の項目解放フラグ	【メニュー】まんたん
	SetEventFlg_("BFG_PLAYERABILITY_RULER_PROHIBIT", false);// ルーラ禁止を解除
	SetEventFlg_("BFG_LIMIT_FULLTANK_STELE", true);			// まんたん取得後に周辺に配置するモンスターを解禁
	SetNumFlg_("NUM_FLG_GO_POWER_PLANT_STATE", 2);			// 送電施設に行くまでの進行フラグを進める
	// 石碑アイコンを見えなくする
	SetNaviMapIconVisible_(icon_stone, false);
	// プレイヤー特技の解禁
	AddPlayerAbility_(PLAYERABILITYID.MANTAN);
	SetNaviMapIconVisible_(g_map_navi06, false);	// 石碑(まんたん)
	SetNaviMapIconVisible_(g_map_navi03, true);		// 送電施設
	
	//フェードイン
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
	
	if(main_num == GetFlagID_("CONST_SM_CITY")					// Num0 = 2
	&& city_num == GetFlagID_("CONST_SS_CI_EVENING_CITY")){		// Num3 = 3
		// 夕方にする
		uEveningDemo();
	}
}
