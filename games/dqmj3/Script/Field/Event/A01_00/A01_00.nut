//===================== 拠点【ノチョーラキングダム】 ====================
// ▼定数定義
// 【アクセサリーＱ用】
const	AQ_1_PROBLEM_ITEM_ID = 164;		//まりょくの土
const	AQ_1_PROBLEM_ITEM_NUMBER = 4;	//必要個数
const	AQ_1_REWARD_ITEM_ID = 101;		//てつくず
const	AQ_1_REWARD_ITEM_NUMBER = 4;	//もらえる個数
const	AQ_1_2_REWARD_ITEM_ID = 100;	//こうせきのチカラ
const	AQ_1_2_REWARD_ITEM_NUMBER = 4;	//もらえる個数
const	AQ_2_PROBLEM_ITEM_ID = 145;		//花のみつ
const	AQ_2_PROBLEM_ITEM_NUMBER = 2;	//必要個数
const	AQ_2_REWARD_ITEM_ID = 149;		//かがやきそう
const	AQ_2_REWARD_ITEM_NUMBER = 1;	//もらえる個数
const	AQ_2_2_REWARD_ITEM_ID = 120;	//だいちのチカラ
const	AQ_2_2_REWARD_ITEM_NUMBER = 4;	//もらえる個数
const	AQ_3_PROBLEM_ITEM_ID = 168;		//ふしぎなドロドロ
const	AQ_3_PROBLEM_ITEM_NUMBER = 1;	//必要個数
const	AQ_3_REWARD_ITEM_ID = 124;		//小さなうろこ
const	AQ_3_REWARD_ITEM_NUMBER = 2;	//もらえる個数
const	AQ_3_2_REWARD_ITEM_ID = 120;	//だいちのチカラ
const	AQ_3_2_REWARD_ITEM_NUMBER = 4;	//もらえる個数
const	AQ_4_PROBLEM_ITEM_ID = 148;		//氷の樹木
const	AQ_4_PROBLEM_ITEM_NUMBER = 2;	//必要個数
const	AQ_4_REWARD_ITEM_ID = 131;		//まじゅうの皮
const	AQ_4_REWARD_ITEM_NUMBER = 1;	//もらえる個数
const	AQ_4_2_REWARD_ITEM_ID = 160;	//まどうのチカラ
const	AQ_4_2_REWARD_ITEM_NUMBER = 8;	//もらえる個数
const	AQ_5_PROBLEM_ITEM_ID = 102;		//小さな化石
const	AQ_5_PROBLEM_ITEM_NUMBER = 4;	//必要個数
const	AQ_5_REWARD_ITEM_ID = 105;		//大きな化石
const	AQ_5_REWARD_ITEM_NUMBER = 2;	//もらえる個数
const	AQ_5_2_REWARD_ITEM_ID = 160;	//まどうのチカラ
const	AQ_5_2_REWARD_ITEM_NUMBER = 8;	//もらえる個数
const	AQ_6_PROBLEM_ITEM_ID = 112;		//マデュライト
const	AQ_6_PROBLEM_ITEM_NUMBER = 1;	//必要個数
const	AQ_6_REWARD_ITEM_ID = 127;		//ふさふさの毛皮
const	AQ_6_REWARD_ITEM_NUMBER = 2;	//もらえる個数
const	AQ_6_2_REWARD_ITEM_ID = 140;	//しょくぶつのチカラ
const	AQ_6_2_REWARD_ITEM_NUMBER = 16;	//もらえる個数
const	AQ_7_PROBLEM_ITEM_ID = 190;		//レッドオーブ
const	AQ_7_PROBLEM_ITEM_NUMBER = 1;	//必要個数
const	AQ_7_REWARD_ITEM_ID = 131;		//まじゅうの皮
const	AQ_7_REWARD_ITEM_NUMBER = 1;	//もらえる個数
const	AQ_7_2_REWARD_ITEM_ID = 180;	//宝石のカケラ
const	AQ_7_2_REWARD_ITEM_NUMBER = 16;	//もらえる個数
const	AQ_8_PROBLEM_ITEM_ID = 153;		//かがやきの樹液
const	AQ_8_PROBLEM_ITEM_NUMBER = 1;	//必要個数
const	AQ_8_REWARD_ITEM_ID = 107;		//せいれいせき
const	AQ_8_REWARD_ITEM_NUMBER = 2;	//もらえる個数
const	AQ_8_2_REWARD_ITEM_ID = 160;	//まどうのチカラ
const	AQ_8_2_REWARD_ITEM_NUMBER = 16;	//もらえる個数

const	AQ_ANSWER_TRUE = 2;		//正解アイテムを持ってきて、数も十分
const	AQ_ANSWER_HALF = 1;		//正解アイテムを持ってきたが、数が足りない
const	AQ_ANSWER_FALSE = 0;	//正解アイテムを持っていない

// 【メダルＱ用】
const	MQ_01_REWARD_ACCE_ID = 275;		// 装備品:幸運のリング★
const	MQ_02_REWARD_ACCE_ID = 201;		// 装備品:いかりのタトゥー★
const	MQ_03_REWARD_MONS_ID =   3;		// モンスター種族:メタルスライム
const	MQ_04_REWARD_ACCE_ID = 210;		// 装備品:はやてのリング★
const	MQ_05_REWARD_MONS_ID =  12;		// モンスター種族:はぐれメタル
const	MQ_06_REWARD_ACCE_ID = 259;		// 装備品:メタルつぶしのベルト★
const	MQ_07_REWARD_MONS_ID =  27;		// モンスター種族:メタルキング
const	MQ_08_REWARD_ACCE_ID = 258;		// 装備品:きょしょうのベルト★
const	MQ_09_REWARD_ACCE_ID = 203;		// 装備品:ごうけつのうでわ★
const	MQ_10_REWARD_MONS_ID =  38;		// モンスター種族:ゴールデンスライム
const	MQ_11_REWARD_ACCE_ID = 260;		// 装備品:ラッキーペンダント★★
const	MQ_12_REWARD_MONS_ID =  41;		// モンスター種族:プラチナキング
const	MQ_EX_A1_REWARD_ITEM_ID = 190;	// 素材:レッドオーブ
const	MQ_EX_A2_REWARD_ITEM_ID = 191;	// 素材:ブルーオーブ
const	MQ_EX_A3_REWARD_ITEM_ID = 192;	// 素材:イエローオーブ
const	MQ_EX_A4_REWARD_ITEM_ID = 193;	// 素材:グリーンオーブ
const	MQ_EX_A5_REWARD_ITEM_ID = 194;	// 素材:パープルオーブ
const	MQ_EX_B1_REWARD_MONS_ID = 395;	// モンスター種族:カラーフォンデュ(白)
const	MQ_EX_B2_REWARD_MONS_ID = 395;	// モンスター種族:カラーフォンデュ(黒)
const	MQ_REWARD_NONE = 0;				// 報酬：該当なし
const	MQ_REWARD_MONSTER = 1;			// 報酬：モンスター
const	MQ_REWARD_ITEM = 2;				// 報酬：アイテム

// 【仲間にする時のモンスターのパラメータＩＤ】
const	MQ_03_PARAM_ID = 2601;			// メタルスライム
const	MQ_05_PARAM_ID = 2602;			// はぐれメタル
const	MQ_07_PARAM_ID = 2603;			// メタルキング
const	MQ_10_PARAM_ID = 2604;			// ゴールデンスライム
const	MQ_12_PARAM_ID = 2605;			// プラチナキング

// 【解禁する配合回数】
const	UNLOCK_TIME_10 = 10;	// らくらく配合の解禁判定用の定数

// 【ライブラリ用】
const	LIBRARY_NONE		 = 0;		// 該当なし
const	LIBRARY_LANK_F		 = 1;		// Ｆランク
const	LIBRARY_LANK_E		 = 2;		// Ｅランク
const	LIBRARY_LANK_D		 = 3;		// Ｄランク
const	LIBRARY_LANK_C		 = 4;		// Ｃランク
const	LIBRARY_LANK_B		 = 5;		// Ｂランク
const	LIBRARY_LANK_A		 = 6;		// Ａランク
const	LIBRARY_LANK_S		 = 7;		// Ｓランク
const	LIBRARY_LANK_SS		 = 8;		// SSランク

// 【ブレイクモンスター作成用】
const	MAKE_BREAK_NONE		 = 0;		// 該当なし
const	MAKE_BREAK_SLIME	 = 1;		// 凶スライム
const	MAKE_BREAK_CHIMERA	 = 2;		// 凶キメラ
const	MAKE_BREAK_LIZARD	 = 3;		// 凶キングリザード
const	MAKE_BREAK_KUJAKU	 = 4;		// 凶にじくじゃく
const	MAKE_BREAK_SQUID	 = 5;		// 凶大王イカ

// ▼グローバル変数定義
// 【アクセサリーＱ・スカウトＱ用】
scoutq_num			 <- C_NONE_ID;		// スカウトQ シナリオ
scoutq_mission_now	 <- C_NONE_ID;		// スカウトQ 出題中
acceq_num			 <- C_NONE_ID;		// アクセサリーQ シナリオ

sq_num_sub			 <- "NUM_SUBEVENT_SCOUTQ";
sq_mission_now		 <- "BFG_SUBEVENT_SCOUTQ_NOW";
aq_num_sub			 <- "NUM_SUBEVENT_QUEENQ";		// Num24
aq_mission_now		 <- "BFG_SUBEVENT_QUEENQ_NOW";	// Bit_2010

// ▼クエストで使用する分岐用フラグ
lib_msg_flg				 <- false;		// ライブラリ(ジャック)
medal_msg_flg			 <- false;		// メダルＱ(キング)
g_coupling_flg			 <- false;		// 配合フラグ
g_coupling_event_flg	 <- false;		// 配合サブイベント発生フラグ

//------------------------------------------------
//		戦闘終了後
//------------------------------------------------
function AfterBattle()
{
	EventEnd_();
}

//------------------------------------------------
//		マップに入る前
//------------------------------------------------
function BeforeInitMap()
{
	// イベントフラグ
	local main_num    = GetNumFlg_("NUM_SCENARIO_MAIN");
	local outside_num = GetNumFlg_("NUM_SCENARIO_SUB_INSIDE_CLEAR");

	// Demo832[アロマとの別れ]再生後のタイミング
	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){				// Num0  = 9
		if(outside_num == GetFlagID_("CONST_SS_OS_DATA_SAVED")){		// Num10 = 38
			//ライド強制解除
			SetRideOffStart_();
		}
	}

	// 擬似デモ[メダルＱ開始]再生前
	if(GetEventFlg_("BFG_NEAR_KING_MINE") == true){						// Bit1146
		if(GetEventFlg_("BFG_DISPLAYED_MEDAL_Q_DEMO") == false){		// Bit1145
			//ライド強制解除
			SetRideOffStart_();
		}
	}

	// 擬似デモ[地下室への誘い]が再生前
	if(GetEventFlg_("BFG_RIDE_OFF_BEFORE_BASEMENT_DEMO") == true){
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
	//シナリオメインフラグ
	local main_num = GetNumFlg_("NUM_SCENARIO_MAIN");
	//シナリオサブフラグ
	local city_num = GetNumFlg_("NUM_SCENARIO_SUB_CITY");
	local grave_num = GetNumFlg_("NUM_SCENARIO_SUB_GRAVE");
	local outside_num = GetNumFlg_("NUM_SCENARIO_SUB_INSIDE_CLEAR"); // 表シナリオクリア後

	// マップ到達フラグ
	SetEventFlg_("BFG_ARRIVE_AT_A01", true);
	// モンスターを出現させる最小距離を設定(※単位は1=10cm)
	SetMonsterGenPlayerInvasionAreaMin_(-1)	// 制限をデフォルト値に戻す
	// ルーラポイント
	SetEventFlg_("BFG_RULER_ADD_004", true);
	// 東エレベータを自動解禁(歓楽の霊道に到達で自動解禁)
	if(main_num >= GetFlagID_("CONST_SM_CEMETERY")){
		SetEventFlg_("BFG_UNLOCK_EAST_ELEVATOR", true);
	}

	//モデル読み込み
	local n_man 	= ReadNpc_("n000"); //ノチョーラ男
	local n_woman 	= ReadNpc_("n004"); //ノチョーラ女
	local jack 		= ReadNpc_("n001"); //ジャック
	local ace 		= ReadNpc_("n002"); //エース
	local king 		= ReadNpc_("n003"); //キング
	local queen 	= ReadNpc_("n005"); //クイーン
	local nochorin  = ReadNpc_("n043"); //ノチョリン

	//NPC配置( 初期化の為グローバル変数に"-1"を代入する )
	g_king    <- C_NONE_ID;
	g_queen   <- C_NONE_ID;
	g_reactor <- C_NONE_ID;
	g_hunter  <- C_NONE_ID;
	g_bank    <- C_NONE_ID;
	g_acce    <- C_NONE_ID;
	g_book    <- C_NONE_ID;
	g_inn     <- C_NONE_ID;
	g_item    <- C_NONE_ID;
	g_meat    <- C_NONE_ID;
	g_n_man01 <- C_NONE_ID;
	g_ace     <- C_NONE_ID;
	g_jack    <- C_NONE_ID;
	g_n_man02 <- C_NONE_ID;
	npc_Aroma <- C_NONE_ID;
	npc_Citizen_Man_A <- C_NONE_ID;
	npc_Citizen_Chi_A <- C_NONE_ID;
	npc_Renate <- C_NONE_ID;

	// 配置場所が変わらないNPC
	if(main_num >= GetFlagID_("CONST_SM_CITY")){
		g_queen   = ArrangePointNpc_(queen,   "002"); //クイーン
		g_bank    = ArrangePointNpc_(n_man,   "009"); //銀行
		g_acce    = ArrangePointNpc_(n_woman, "007"); //アクセサリー屋
		g_book    = ArrangePointNpc_(n_woman, "008"); //本屋
		g_inn     = ArrangePointNpc_(n_man,   "006"); //宿屋
		g_item    = ArrangePointNpc_(n_man,   "010"); //道具屋
		g_meat    = ArrangePointNpc_(n_man,   "011"); //肉屋
		// 会話時アップ
		SetTalkCameraType_(g_queen, TALK_CAMERA_UP);
		SetTalkCameraType_(g_bank, TALK_CAMERA_UP);
		SetTalkCameraType_(g_acce, TALK_CAMERA_UP);
		SetTalkCameraType_(g_book, TALK_CAMERA_UP);
		SetTalkCameraType_(g_inn, TALK_CAMERA_UP);
		SetTalkCameraType_(g_item, TALK_CAMERA_UP);
		SetTalkCameraType_(g_meat, TALK_CAMERA_UP);
		// アナライズメッセージ
		SetReactorMsg_(g_queen, "NPC_QUEEN_REC");
		SetReactorMsg_(g_bank, "NPC_NOCHO_MEN_REC");
		SetReactorMsg_(g_acce, "NPC_NOCHO_WOMEN_REC");
		SetReactorMsg_(g_book, "NPC_NOCHO_WOMEN_REC");
		SetReactorMsg_(g_inn, "NPC_NOCHO_MEN_REC");
		SetReactorMsg_(g_item, "NPC_NOCHO_MEN_REC");
		SetReactorMsg_(g_meat, "NPC_NOCHO_MEN_REC");
		// NPCの会話可能角度を設定
		SetSearchableAngle_(g_bank, SEARCHABLE_ANGLE_MINIMUM); // 銀行
		SetSearchableAngle_(g_acce, SEARCHABLE_ANGLE_MINIMUM); // アクセサリー屋
		SetSearchableAngle_(g_book, SEARCHABLE_ANGLE_MINIMUM); // 本屋
		SetSearchableAngle_(g_inn , SEARCHABLE_ANGLE_MINIMUM); // 宿屋
		SetSearchableAngle_(g_item, SEARCHABLE_ANGLE_MINIMUM); // 道具屋
		SetSearchableAngle_(g_meat, SEARCHABLE_ANGLE_MINIMUM); // 肉屋

		// キングの設定(個別)
		g_king    = ArrangePointNpc_(king,    "000"); //キング
		// 通常時の設定
		if(GetEventFlg_("BFG_DEAD_RETURN") == false){
			// 会話時アップ
			if(city_num != GetFlagID_("CONST_SS_CI_DISCOVER_HAIGOU")
			|| city_num != GetFlagID_("CONST_SS_CI_REPORT_TO_KING")){
				// 「CONST_SS_CI_DISCOVER_HAIGOU」と「CONST_SS_CI_REPORT_TO_KING」時だけ
				// デモを再生するので顔アップにしない
				SetTalkCameraType_(g_king, TALK_CAMERA_UP);
			}
			// アナライズメッセージ
			SetReactorMsg_(g_king, "NPC_KING_REC");
			// 会話時に振り向かない
			SetTalkTurn_ (g_king, false); // キング
			// NPCの会話可能角度を設定
			SetSearchableAngle_(g_king, SEARCHABLE_ANGLE_MINIMUM); // キング
			// NPCのモーションを設定
			local bit_mq_start = GetEventFlg_("BFG_DUMMY_MEDAL_QUEST_START");	// メダルQ解放後、初めて話しかけた
			if(!bit_mq_start){
				local clear_flg = GetEventFlg_("BFG_SCENARIO_CLEAR_CITY");		// Bit_41 崩落都市クリア
				if(clear_flg){
					if(main_num >= GetFlagID_("CONST_SM_CEMETERY")){
						if(GetEventFlg_("BFG_NEAR_KING_MINE") == false){
							local king_think_L = ReadMotion_(g_king, "n003_think_L");	// キング 考える
							SetMotion_(g_king, king_think_L, BLEND_M);	// 考えるLOOP
							SetTalkEnable_(g_king, false);
						}
					}
				}
			}
		}
		// 全滅時の設定
		else{
			SetTalkEnable_(g_king, false);
		}

		// リアクター屋の設定(個別)
		// 表シナリオ中
		if(main_num <= GetFlagID_("CONST_SM_SKY")){
			g_reactor = ArrangePointNpc_(n_man, "026"); //リアクター屋
			SetReactorMsg_(g_reactor, "NPC_NOCHO_MEN_REC");
			// ランダム歩行を設定
			SetComMode_(g_reactor, 1);
			SetWalkRadius_(g_reactor, 30);
		}
		// 表シナリオクリア後( Demo809[封印の解放]の再生後に地下１階へ移動するのでそれまで配置 )
		else if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){
			if(outside_num < GetFlagID_("CONST_SS_OS_COLLECT_STAR_PIECE")){
				g_reactor = ArrangePointNpc_(n_man, "026"); //リアクター屋
				SetReactorMsg_(g_reactor, "NPC_NOCHO_MEN_REC");
				// ランダム歩行を設定
				SetComMode_(g_reactor, 1);
				SetWalkRadius_(g_reactor, 30);
			}
		}
		// 完全クリア後
		else{
			// 配置しないので特に何もしない
		}
	}

	// 配置場所が変わるNPC(崩落都市クリア前)
	if(main_num == GetFlagID_("CONST_SM_CITY")){
		// エース
		if(city_num >= GetFlagID_("CONST_SS_CI_EARTHQUAKE")
		&& city_num <= GetFlagID_("CONST_SS_CI_REPORT_TO_KING")){
			// Demo109[キングダム地震発生]再生後
			g_ace = ArrangePointNpc_(ace, "019");					// エレベータの近く
			SetTalkCameraType_(g_ace, TALK_CAMERA_UP);				// 会話時にカメラアップ
			SetReactorMsg_(g_ace, "NPC_ACE_REC");					// アナライズメッセージ
		}else{
			g_ace = ArrangePointNpc_(ace, "003");	// モニタの前
			SetTalkCameraType_(g_ace, TALK_CAMERA_UP);	// 会話時にカメラアップ
			SetReactorMsg_(g_ace, "NPC_ACE_REC");		// アナライズメッセージ
		}

		// ジャック
		if(city_num == GetFlagID_("CONST_SS_CI_ESTABLISH_KINGDOM")
		|| city_num == GetFlagID_("CONST_SS_CI_ENTER_KINGDOM")
		|| city_num == GetFlagID_("CONST_SS_CI_DISCOVER_HAIGOU") ){
			g_jack = ArrangePointNpc_(jack, "017");		// 入口前
			SetTalkCameraType_(g_jack, TALK_CAMERA_UP);	// 会話時にカメラアップ
			SetReactorMsg_(g_jack, "NPC_JACK_REC");		// アナライズメッセージ
			// ランダム歩行
			SetComMode_(g_jack, 1);
			SetWalkRadius_(g_jack, 20);
		}
		if(city_num >= GetFlagID_("CONST_SS_CI_EARTHQUAKE")){
			g_jack = ArrangePointNpc_(jack, "001");		// キングの隣
			SetTalkCameraType_(g_jack, TALK_CAMERA_UP);	// 会話時にカメラアップ
			SetReactorMsg_(g_jack, "NPC_JACK_REC");		// アナライズメッセージ
		}

		// モブB
		if(city_num > GetFlagID_("CONST_SS_CI_GO_BACK_KING")
		&& city_num < GetFlagID_("CONST_SS_CI_TEST_RUN_HAIGOU")
		|| city_num >= GetFlagID_("CONST_SS_CI_GO_NEXT_CONTINENT")){
			g_n_man02 = ArrangePointNpc_(n_man, "013");		// 東エレベータ付近
			SetReactorMsg_(g_n_man02, "NPC_NOCHO_MEN_REC");	// アナライズメッセージ
			// ランダム歩行
			SetComMode_(g_n_man02, 1);
			SetWalkRadius_(g_n_man02, 30);
		}
		if(city_num == GetFlagID_("CONST_SS_CI_TEST_RUN_HAIGOU")){
			g_n_man02 = ArrangePointNpc_(n_man, "013_2");	// 入口封鎖
			SetReactorMsg_(g_n_man02, "NPC_NOCHO_MEN_REC");	// アナライズメッセージ
		}

		// モブ１(ノチョリン)
		if(city_num >= GetFlagID_("CONST_SS_CI_GO_NEXT_CONTINENT")){
			g_n_man01 = ArrangePointNpc_(nochorin, "005"); // クエスト受付に配置
			SetTalkCameraType_(g_n_man01, TALK_CAMERA_UP);
			SetReactorMsg_(g_n_man01, "NPC_NOCHORIN_REC");
		}
		else{
			g_n_man01 = ArrangePointNpc_(nochorin,   "012"); // 西エレベータ付近に配置
			SetTalkCameraType_(g_n_man01, TALK_CAMERA_UP);
			SetReactorMsg_(g_n_man01, "NPC_NOCHORIN_REC");
			// ランダム歩行を設定
			SetComMode_(g_n_man01, 1);
			SetWalkRadius_(g_n_man01, 30);
		}
	}
	// 配置場所が変わるNPC(崩落都市クリア後)
	if(main_num >= GetFlagID_("CONST_SM_CEMETERY")){
		g_ace = ArrangePointNpc_(ace, "003");		// エース(モニタ前)
		g_jack = ArrangePointNpc_(jack, "001");		// ジャック
		g_n_man01 = ArrangePointNpc_(nochorin, "005"); // モブ１(ノチョリン)受付
		// 会話時カメラの設定(モブ２は設定しなくてOK)
		// エース( 会話時カメラの設定 )
		if(main_num >= GetFlagID_("CONST_SM_ICE_FIELD")){
			// 擬似デモ[地下室への誘い]を再生する場合
			if(GetEventFlg_("BFG_PLAYED_DEMO_MEETING_AGEIN")		// Bit1149
			&& !GetEventFlg_("BFG_PLAYED_CENTER_BILL_BASEMENT")){	// Bit1148
				SetTalkCameraType_(g_ace, TALK_CAMERA_DEF);
			}
			else{
				SetTalkCameraType_(g_ace, TALK_CAMERA_UP);
			}
		}
		else{
			SetTalkCameraType_(g_ace, TALK_CAMERA_UP);
		}
		// 会話時カメラの設定
		SetTalkCameraType_(g_jack, TALK_CAMERA_UP); // ジャック
		SetTalkCameraType_(g_n_man01, TALK_CAMERA_UP); // モブ１(ノチョリン)
		// アナライズメッセージ
		SetReactorMsg_(g_ace, "NPC_ACE_REC");
		SetReactorMsg_(g_jack, "NPC_JACK_REC");
		SetReactorMsg_(g_n_man01, "NPC_NOCHORIN_REC");

		// 個別配置(モブ２ <ノチョＢ>)
		// 表シナリオ中
		if(main_num <= GetFlagID_("CONST_SM_SKY")){
			g_n_man02 = ArrangePointNpc_(n_man, "013");
			SetReactorMsg_(g_n_man02, "NPC_NOCHO_MEN_REC");
		}
		// 表シナリオクリア後( Demo830[人類の復活、そして]の再生後に地下１階へ移動するのでそれまで配置 )
		else if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){
			if(outside_num <= GetFlagID_("CONST_SS_OS_EXAMINE_STAR_SEED_2")){
				g_n_man02 = ArrangePointNpc_(n_man, "013");
				SetReactorMsg_(g_n_man02, "NPC_NOCHO_MEN_REC");
			}
		}
		// 完全クリア後
		else{
			// 配置しないので特に何もしない
		}
	}
	// 配置場所が変わるNPC(凍骨の氷原シナリオ以降)
	if(main_num >= GetFlagID_("CONST_SM_ICE_FIELD")){						// Num0 = 4 以上
		// Demo132[チョーマッハとの再会]が再生されたかどうかチェック
		local check_played = GetEventFlg_("BFG_PLAYED_DEMO_MEETING_AGEIN");
		if(check_played == true){
			// チョーマッハ(冒険ノチョーラ)
			local adv_nocho = ReadNpc_("n006");
			g_hunter = ArrangePointNpc_(adv_nocho, "004");   // ノチョリンの隣に配置
			SetTalkCameraType_(g_hunter, TALK_CAMERA_UP);    // 会話時カメラの設定
			SetReactorMsg_(g_hunter, "NPC_MASTER_NOCHO_REC");// アナライズメッセージ
			// アナライズのターゲット名を切り替える(マスター・ノチョーラ→チョーマッハ)
			SetTargetNameKey_(g_hunter, "NAME_TAG_CHOMACH");
		}
	}
	// 表シナリオクリア後(NUM000 == 9)
	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){
		if(outside_num == GetFlagID_("CONST_SS_OS_GO_CENTER_BILL_B1F")){
			// アロマ( NUM010 == 5 の時)
			npc_Aroma = ReadAndArrangePointNpc("n018", "027");
			SetTalkCameraType_(npc_Aroma, TALK_CAMERA_UP);
			SetReactorMsg_(npc_Aroma, "NPC_AROMA_REC");
			// 会話カメラ時に透過されるのでアルファ値を設定する
			SetManualCalcAlpha_(npc_Aroma, true);
			SetAlpha_(npc_Aroma, 1.0);
		}
		else if(outside_num == GetFlagID_("CONST_SS_OS_TALKED_AROMA")){ // NUM010 == 36 の時
			// 市民男Ａ
			npc_Citizen_Man_A = ReadAndArrangePointNpc("n015", "npc_citizen_man");
			SetReactorMsg_(npc_Citizen_Man_A, "NPC_CITIZEN_MAN_A_REC");
			// ランダム歩行を設定
			SetComMode_(npc_Citizen_Man_A, 1);
			SetWalkRadius_(npc_Citizen_Man_A, 15);
			// 市民子供Ａ
			npc_Citizen_Chi_A = ReadAndArrangePointNpc("n017", "npc_citizen_child");
			SetReactorMsg_(npc_Citizen_Chi_A, "NPC_CITIZEN_CHILD_A_REC");
			// ランダム歩行を設定
			SetComMode_(npc_Citizen_Chi_A, 1);
			SetWalkRadius_(npc_Citizen_Chi_A, 30);

			//レナーテ（復帰時のプレイヤーの方を向いておく）
			npc_Renate = ReadAndArrangePointNpc("n007", "npc_Def_renate");
			SetTalkCameraType_(npc_Renate, TALK_CAMERA_UP);
			SetReactorMsg_(npc_Renate, "NPC_RENATE_REC");
			// 会話カメラ時に透過されるのでアルファ値を設定する
			SetManualCalcAlpha_(npc_Renate, true);
			SetAlpha_(npc_Renate, 1.0);
			local player = GetPlayerId_();
			SetDirToPos_(npc_Renate, GetPos_(player));

		}
	}

	// 完全クリア後(NUM000 == 10)
	if(main_num == GetFlagID_("CONST_SM_ALL_CLEAR")){
		// 市民男Ａ
		npc_Citizen_Man_A = ReadAndArrangePointNpc("n015", "npc_citizen_man");
		SetReactorMsg_(npc_Citizen_Man_A, "NPC_CITIZEN_MAN_A_REC");
		// ランダム歩行を設定
		SetComMode_(npc_Citizen_Man_A, 1);
		SetWalkRadius_(npc_Citizen_Man_A, 15);
		// 市民子供Ａ
		npc_Citizen_Chi_A = ReadAndArrangePointNpc("n017", "npc_citizen_child");
		SetReactorMsg_(npc_Citizen_Chi_A, "NPC_CITIZEN_CHILD_A_REC");
		// ランダム歩行を設定
		SetComMode_(npc_Citizen_Chi_A, 1);
		SetWalkRadius_(npc_Citizen_Chi_A, 30);
	}
	
//-------------------------------------------------------------------------------------
// イベント地雷
	// 初期化
	near_ace     <- C_NONE_ID;
	WestElevator <- C_NONE_ID;
	EastElevator <- C_NONE_ID;
	mine_MedalQ  <- C_NONE_ID;
	mine_Mcninfo <- C_NONE_ID;

	//エースに近づいたらデモを再生するための地雷
	if(main_num == GetFlagID_("CONST_SM_CITY")){
		// Demo129[エースが目を付けた機械]再生後
		if(city_num == GetFlagID_("CONST_SS_CI_ENTER_KINGDOM")){
			near_ace = SetPointCircleEventMine_("Mine_Near_Ace", false);
		}
		// Demo122[キングに状況を報告]再生後
		if(city_num == GetFlagID_("CONST_SS_CI_TEST_RUN_HAIGOU")){
			near_ace = SetPointCircleEventMine_("Mine_Near_Ace", false);
		}
	}
	// 西エレベーター
	WestElevator = SetPointBoxEventMine_("Mine_Door_03", true);
	// 東エレベーター
	EastElevator = SetPointBoxEventMine_("Mine_Door_02", true);
	// 擬似デモ[メダルＱ開始]再生地雷
	if(GetEventFlg_("BFG_DUMMY_MEDAL_QUEST_START") == false){
		if(GetEventFlg_("BFG_SCENARIO_CLEAR_CITY") == true){
			if(main_num >= GetFlagID_("CONST_SM_CEMETERY")){
				if(GetEventFlg_("BFG_NEAR_KING_MINE") == false){
					if(GetEventFlg_("BFG_DISPLAYED_MEDAL_Q_DEMO") == false){
						mine_MedalQ = SetPointCircleEventMine_("Mine_Near_King", false);
					}
				}
			}
		}
	}
	// 配合装置右側のモニタ
	mine_Mcninfo = SetPointCircleEventMine_("Mine_MixMachine", true);

//-------------------------------------------------------------------------------
//リアクターポイント
	//配合装置
	local reactorPoint01 = ArrangeMsgReactorPoint("reactorPoint_01", GetFlagID_("BFG_REACTER_POINT_021")
		, LONG_DIST, "REC_POINT_NOC_01_01", "REC_POINT_NOC_01_02");
	//一般用エレベーター
	local reactorPoint02 = ArrangeMsgReactorPoint("reactorPoint_02", GetFlagID_("BFG_REACTER_POINT_022")
		, SHORT_DIST, "REC_POINT_NOC_02_01", "REC_POINT_NOC_02_02");
	//高速エレベーター
	local reactorPoint03 = ArrangeMsgReactorPoint("reactorPoint_03", GetFlagID_("BFG_REACTER_POINT_023")
		, SHORT_DIST, "REC_POINT_NOC_03_01", "REC_POINT_NOC_03_02");

//-------------------------------------------------------------------------------
// ギミック
	// エレベーターの扉
	local g_elevator = ReadGimmick_("o_A01_00");
	local w_k_elevator = ArrangePointGimmick_("o_A01_00", g_elevator, "g_elevator_01"); // 西エレベータの扉
	local e_k_elevator = ArrangePointGimmick_("o_A01_00", g_elevator, "g_elevator_02"); // 東エレベータの扉
	// エレベータのリフト
	local g_lift = ReadGimmick_("o_A01_01");
	w_lift <- ArrangePointGimmick_("o_A01_01", g_lift, "g_elevator_lift_01"); // 西エレベータのリフト
	e_lift <- ArrangePointGimmick_("o_A01_01", g_lift, "g_elevator_lift_02"); // 東エレベータのリフト
	// クロスオーバーマシン(配合装置)
	local g_haigou_machine = ReadGimmick_("o_A01_02");
	local haigou_machine = ArrangePointGimmick_("o_A01_02", g_haigou_machine, "g_haigou_machine");
	// 配合装置の起動判定(アイコンの表示設定[ペインの設定])
	if(main_num == GetFlagID_("CONST_SM_CITY")){
		if(city_num == GetFlagID_("CONST_SS_CI_GO_NEXT_CONTINENT")){
			SetEventFlg_("BFG_COUPLINGMACHINE_ACTIVE", true); // 配合装置起動フラグ(マップの配合装置アイコンを表示させる)
			// NEWアイコンを表示する
			if(GetEventFlg_("BFG_DISPLAYED_CROSS_OVER_NEW_ICON") == true){
				SetEventFlg_("BFG_DISPLAYED_CROSS_OVER_NEW_ICON", false);
				SetEventFlg_("BFG_MAP_ICON_042", true); // 配合装置のNEWマークをつける
				SetEventFlg_("BFG_MAP_ICON_051", true); // アクセサリ屋のアイコンを表示
				SetEventFlg_("BFG_MAP_ICON_041", true); // アクセサリ屋のNEWマークを表示
			}
		}
	}
	if ( GetEventFlg_("BFG_COUPLINGMACHINE_ACTIVE") == false ) {
		SetMotion_(haigou_machine, "GIMMICK_0", 0); // OFF
	} else {
		SetMotion_(haigou_machine, "GIMMICK_2", 0); // ON
	}

//----------------------------------------------------------------------------------
// マップ間移動の制限を設定
	if(main_num == 2){
		if(city_num == GetFlagID_("CONST_SS_CI_REPORT_TO_KING")
		|| city_num == GetFlagID_("CONST_SS_CI_TEST_RUN_HAIGOU")){
			// マップチェンジできないようにする
			SetHitEnableMapChangeNull_("w_A00_00ALdr_006", false);
		}
	}

//----------------------------------------------------------------------------------
// アイコンの表示設定(ペインの設定)
	// スカウトＱ・アクセサリＱ・ライブラリＱのアイコン表示設定
	if(main_num == GetFlagID_("CONST_SM_CITY")){
		if(city_num == GetFlagID_("CONST_SS_CI_GO_NEXT_CONTINENT")){
			SetEventFlg_("BFG_MAP_ICON_036", true); // スカウトＱのアイコンを表示
			SetEventFlg_("BFG_MAP_ICON_039", true); // アクセサリＱのアイコンを表示
			SetEventFlg_("BFG_MAP_ICON_046", true); // ライブラリＱのアイコンを表示
		}
	}
	else if(main_num >= GetFlagID_("CONST_SM_CEMETERY")){
		SetEventFlg_("BFG_MAP_ICON_036", true); // スカウトＱのアイコンを表示
		SetEventFlg_("BFG_MAP_ICON_039", true); // アクセサリＱのアイコンを表示
		SetEventFlg_("BFG_MAP_ICON_046", true); // ライブラリＱのアイコンを表示
	}

	EventEnd_();
}

//------------------------------------------------
//		フィールド操作開始
//------------------------------------------------
function EventStartOperate()
{
	//シナリオメインフラグ
	local main_num = GetNumFlg_("NUM_SCENARIO_MAIN");
	//シナリオサブフラグ
	local city_num = GetNumFlg_("NUM_SCENARIO_SUB_CITY");
	local grave_num = GetNumFlg_("NUM_SCENARIO_SUB_GRAVE");
	local outside_num = GetNumFlg_("NUM_SCENARIO_SUB_INSIDE_CLEAR"); // 表シナリオクリア後
	local allclear_num = GetNumFlg_("NUM_SCENARIO_SUB_ALL_CLEAR");   // 完全クリア後

	// 全滅復帰のチェック
	local check_dead = GetEventFlg_("BFG_DEAD_RETURN");
	if(check_dead == true){
		// ディスク世界で全滅した時は、ディスク装置戻りメッセージは不要になるので、フラグを下す
		SetEventFlg_("BFG_DISC_MACHINE_RETURN_MESSAGE", false);
		// 全滅復帰後にデモを流す時用のフェードを切り替えるフラグを立てる
		SetEventFlg_("BFG_CHECK_DEAD_RETURN_FADE_OFF", true);
		// 全滅通知Bitフラグをfalseに戻す( プログラムで立ててスクリプトで降ろす )
		SetEventFlg_("BFG_DEAD_RETURN", false);
		// 暗転
		CommChangeMomentFadeOut(FADE_COLOR_BLACK);
		// カメラを元に戻す
		SetPlayableCamera_();
		// 主人公の復帰位置を指定
		local pl_return_pos = Vec3(0.000, 2.500, 25.500);
		local pl_return_dir = 180;
		// カメラの角度
		local cam_dir = 180;
		// プレイヤーID
		local player = GetPlayerId_();
		// ウェイト
		local wait_speed     = 15;
		local wait_speed_def = 30;
		// 定義した数値をセット
		SetPos_(player, pl_return_pos);
		SetDir_(player, pl_return_dir);
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
		ShowMsg_("DEAD_RETURN_MSG_01");
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
		ShowMsg_("DEAD_RETURN_MSG_01_2");
		KeyInputWait_();
		CloseMsgWnd_();
		// 暗転
		SetFade_(FADE_OUT, FADE_COLOR_BLACK, wait_speed);
		SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, wait_speed);
		Wait_(20);
		WaitFade_();
		//=====================================================================================
		// 全滅復帰後にデモ(Demo122[キングに状況を報告]・Demo132[チョーマッハとの再会]・Demo804[アロマとキングの邂逅])
		// を再生する場合は通らないようにする
		//-------------------------------------------------------------------------------------
		// (備忘録) : 全滅処理の最後にEventEnd_();をいれるとハング,
		//            return;を行うとプレイアブルで操作不能＆BGMが無音になる
		//            なので条件分けで対処
		//=====================================================================================
		// リアクターマスターと別れた後以降(Demo220[レースプログラム発見]の再生後)
		if(main_num >= GetFlagID_("CONST_SM_ICE_FIELD")){
			// 表シナリオまで
			if(main_num <= GetFlagID_("CONST_SM_SKY")){
				if(GetEventFlg_("BFG_PLAYED_DEMO_MEETING_AGEIN") == false){
				// デモを再生するタイミングなのでマップチェンジしない
					uResetDeadReturnAndDemo(); // 全滅復帰と特定のデモの再生が重なった時の対処をするための処理<2次DB #2738>
				}
				else{
					// マップチェンジ
					ChangeMapPosDir_("A01_00", pl_return_pos, pl_return_dir);
				}
			}
			// 裏シナリオ
			else if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){
				if(outside_num == GetFlagID_("CONST_SS_OS_GO_CENTER_BILL_1F")){
				// デモを再生するタイミングなのでマップチェンジしない
					// 全滅復帰と特定のデモの再生が重なった時の対処をするための処理<2次DB #2738>
					SetEventFlg_("BFG_CHECK_SAME_TIME_DEAD_AND_DEMO_1", true);
				}
				else if(outside_num == GetFlagID_("CONST_SS_OS_GO_CENTER_BILL_B1F")){
					// マップチェンジ
					ChangeMapPosDir_("A01_00", pl_return_pos, pl_return_dir);
				}
				else{
					if(GetEventFlg_("BFG_PLAYED_DEMO_MEETING_AGEIN") == false){
					// デモを再生するタイミングなのでマップチェンジしない
						uResetDeadReturnAndDemo(); // 全滅復帰と特定のデモの再生が重なった時の対処をするための処理<2次DB #2738>
					}
					else{
						// マップチェンジ
						ChangeMapPosDir_("A01_00", pl_return_pos, pl_return_dir);
					}
				}
			}
			// 完全クリア後
			else{
				// マップチェンジ
				ChangeMapPosDir_("A01_00", pl_return_pos, pl_return_dir);
			}
		}
		// 崩落都市～歓楽の霊道中
		else{
			if(city_num == GetFlagID_("CONST_SS_CI_REPORT_TO_KING")){
				// デモを再生するタイミングなのでマップチェンジしない
				uResetDeadReturnAndDemo(); // 全滅復帰と特定のデモの再生が重なった時の対処をするための処理<2次DB #2738>
			}
			else{
				// マップチェンジ
				ChangeMapPosDir_("A01_00", pl_return_pos, pl_return_dir);
			}
		}
	}
	
	//-----------------------------
	// 擬似デモ[メダルＱ開始]の再生
	if(main_num >= GetFlagID_("CONST_SM_CEMETERY")){
		if(GetEventFlg_("BFG_NEAR_KING_MINE") == true){
			if(GetEventFlg_("BFG_DISPLAYED_MEDAL_Q_DEMO") == false){
				uMedalQuestFirstMsg();
			}
		}
	}
	
	//-------------------------------
	// 擬似デモ[地下室への誘い]が再生
	if(GetEventFlg_("BFG_RIDE_OFF_BEFORE_BASEMENT_DEMO") == true){
		// ライド解除フラグを戻す
		SetEventFlg_("BFG_RIDE_OFF_BEFORE_BASEMENT_DEMO", false);
		// チラつき防止処理
		CommChangeMomentFadeOut(FADE_COLOR_BLACK);
		// 擬似デモ[地下室への誘い]
		uUsedBasementDemo();
		// 不具合が発生しないよう一旦マップチェンジを挟んでリセット
		ChangeMapPosDir_("A01_00", Vec3(-14.857, 22.5, -218.525), -145);
	}
	
	//-----------------
	// 完全クリア後開始
	if(main_num == GetFlagID_("CONST_SM_ALL_CLEAR")){
		if(allclear_num == 0){
			// リアクターイベント
			uAromaMsgEvent();
			// 地下２階解放
			SetEventFlg_("BFG_RELEASE_CENTER_BILL_B2F", true);
		}
	}

	//--------------------------------------
	// Demo832[アロマとの別れ]再生後にセーブ
	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){
		if(outside_num == GetFlagID_("CONST_SS_OS_DATA_SAVED")){
			// フラグを完全クリアにする
			SetNumFlg_("NUM_SCENARIO_SUB_INSIDE_CLEAR",  0); // 表シナリオクリア後フラグをリセット
			SetNumFlg_("NUM_SCENARIO_MAIN", GetFlagID_("CONST_SM_ALL_CLEAR"));
			SetNumFlg_("NUM_SCENARIO_SUB_ALL_CLEAR",  0);
			SetEventFlg_("BFG_SCENARIO_CLEAR_EXTRA", true);
			// オート戦闘解禁フラグ
			SetEventFlg_("BFG_BATTLE_AUTO", true);

			// 暗転( 下画面でメッセージを表示するので、ここではSetFadeSub_()は呼び出さないこと )
			SetFadePlane_(FADE_PLANE.PLANE_3D);
			SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
			SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
			WaitFade_();

			//シナリオ完全クリアの機能解禁告知
			OpenMsgWnd_();
			ShowMsg_("SCENARIO_CLEAR_OPENSYSTM_101");
			KeyInputWait_();
			PlaySE_("SE_SYS_011");
			ShowMsg_("SCENARIO_CLEAR_OPENSYSTM_102");
			KeyInputWait_();
			CloseMsgWnd_();

			Wait_(15);

			PlaySE_("SE_SYS_011");
			OpenMsgWnd_();
			ShowMsg_("SCENARIO_CLEAR_OPENSYSTM_103");
			KeyInputWait_();
			CloseMsgWnd_();

			//フェード適用面を元に戻す
			SetFadePlane_(FADE_PLANE.PLANE_NORMAL);

			// 主人公の位置をdemo832[アロマとの別れ]の再生後の位置に合わせる
			local player = GetPlayerId_();
			local pl_pos = Vec3(0.00, 2.50, 235.50);
			local pl_dir = 180;
			SetPos_(player, pl_pos);
			SetDir_(player, pl_dir);

			SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, FADE_SHORT);
			
			// 全回復
			RecoverAll_();
			
			// 有無を言わさずセーブ
			uAutoSaved();
			// タイトル画面を呼びだす
			ChangeTitle_();
		}
	}

	//--------------------------------------------------------------------------
	// デモの再生(連続で再生する場合はここで行う)
	
	// 全滅復帰とDemo132[チョーマッハとの再会]が重ならないように
	if(GetEventFlg_("BFG_CHECK_SAME_TIME_DEAD_AND_DEMO_2") == false){
		// シナリオ変更で追加
		if(main_num == 2){
			if(city_num == GetFlagID_("CONST_SS_CI_ESTABLISH_KINGDOM")){
				// デモ再生前にフィールドが映らないための対応
				SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				WaitFade_();
				// 全滅復帰マップ指定Numフラグ
				SetNumFlg_("NUM_DEAD_RETURN_MAP", GetFlagID_("CONST_DEAD_RETURN_MAP_A01_00"));
				// サブフラグを進める(8 -> 9)
				SetNumFlg_("NUM_SCENARIO_SUB_CITY", GetFlagID_("CONST_SS_CI_ENTER_KINGDOM"));
				// 店屋にNEWアイコンを表示させる
				SetEventFlg_("BFG_MAP_ICON_040", true); // 本屋
				SetEventFlg_("BFG_MAP_ICON_043", true); // 道具屋
				SetEventFlg_("BFG_MAP_ICON_044", true); // 肉屋
				SetEventFlg_("BFG_MAP_ICON_047", true); // 銀行
				// デモ後の主人公の位置を修正
				SetReturnDemoPosDir_(Vec3(0.0, 2.5, 5.5), 180);
				// Demo129[エースが目を付けた機械]再生
				ChangeDemo_(129);
			//★↓再生タイミングを「キングに話かけたら」→「キングダムに入ったら」に変更（0406シナリオ指定 東藤）
			} else if( GetNumFlg_("NUM_SCENARIO_SUB_CITY") == GetFlagID_("CONST_SS_CI_REPORT_TO_KING")){
				// デモ再生前にフィールドが映らないための対応
				SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				WaitFade_();
				// サブフラグを進める
				SetNumFlg_("NUM_SCENARIO_SUB_CITY",GetFlagID_("CONST_SS_CI_TEST_RUN_HAIGOU"));
				// デモ後の主人公の位置を修正
				SetReturnDemoPosDir_(Vec3(0.0, 2.5, 5.5), 180);
				// Demo122[キングに状況を報告]
				ChangeDemo_(122);
			//★↑
			}
		}
		// 凍骨の氷原以降～
		else if(main_num >= GetFlagID_("CONST_SM_ICE_FIELD")){
			if(main_num <= GetFlagID_("CONST_SM_SKY")){
				// demo132[チョーマッハとの再会]再生準備
				uPlayDemo132();
			}
			else{
				// 表シナリオクリア後
				if(outside_num == GetFlagID_("CONST_SS_OS_GO_CENTER_BILL_1F")){
					// デモ再生前にフィールドが映らないための対応
					uCheckFadeOutTypeAndChangeFadeOutType();
					// 東エレベータ(地下行き)解放<その２>
					SetEventFlg_("BFG_UNLOCKED_EAST_ELEVETER_UNDER", true);
					// サブフラグを進める
					SetNumFlg_("NUM_SCENARIO_SUB_INSIDE_CLEAR", GetFlagID_("CONST_SS_OS_GO_CENTER_BILL_B1F"));
					// デモ後の主人公の位置を修正
					SetReturnDemoPosDir_(Vec3(18.080, 12.500, 13.470), 90);
					// Demo804[アロマとキングの邂逅]
					ChangeDemo_(804);
				}
				else if(outside_num == GetFlagID_("CONST_SS_OS_GO_CENTER_BILL_B1F")){
					// 何もしない
				}
				else if(outside_num == GetFlagID_("CONST_SS_OS_TALKED_AROMA")){
					if(GetEventFlg_("BFG_DEMO830_AFTEREVENT") == false){
						SetEventFlg_("BFG_DEMO830_AFTEREVENT", true);
						Wait_(30);
						
						// 「！」ピン！
						SurpriseDisp(npc_Renate);
						Wait_(15);

						// レナーテが主人公の方を向く
						local task = Task_RotateToPlayerSetMotion_(npc_Renate, 5.7, MOT_WALK, MOT_WAIT);
						WaitTask(task);
						
						// 会話開始
						SetTalkAction_(npc_Renate);

						OpenMsgWnd_();
						SetTalkName_("NAME_TAG_RENERTE");
						ShowMsg_("RENATE_MSG_001");			// 「<name_player/>……。
						KeyInputWait_();
						ShowMsg_("RENATE_MSG_002");			// 「アロマが　わたしとあなたを　呼んでいるわ。
						KeyInputWait_();
						ShowMsg_("RENATE_MSG_003");			// 「アロマは　ビルの地下１階に　いるはずよ。
						KeyInputWait_();
						CloseMsgWnd_();
					}
				}
				else{
					// demo132[チョーマッハとの再会]再生準備
					uPlayDemo132();
				}
			}
		}
	}

//--------------------------------------------------------------------------
//  ルーラの白フェードとデモの黒フェードが被った時のフラグの処理

	// ひと通りの処理が終わったら、エレベータ使用時に立てていたフラグを降ろす
	if(GetEventFlg_("BFG_CHECK_USED_ELEVATER_FADE_OFF") == true){
		// エレベータを使用したタイミングでデモを流すタイミングと被った場合フェードの種類を切り替える為のフラグ元に戻す
		SetEventFlg_("BFG_CHECK_USED_ELEVATER_FADE_OFF", false);
	}

//-------------------------------------------------------------------------
// 配合メニューから戻った時のメッセージ処理
	if(GetEventFlg_("BFG_COUPLING_RETURN_MESSAGE") == true){
		EventStartOperateTalkAction(g_ace);
		uRtnCouplingMsg();
		SetEventFlg_("BFG_COUPLING_RETURN_MESSAGE", false);
	}

//-------------------------------------------------------------------------
// レースメニューから戻った時のメッセージ処理
	if(GetEventFlg_("BFG_RACE_SHOP_RETURN_MESSAGE") == true){
		EventStartOperateTalkAction(g_hunter);
		uRtnRaceMsg();
		SetEventFlg_("BFG_RACE_SHOP_RETURN_MESSAGE", false);
	}

//--------------------------------------------------------
// 全滅復帰と被らないようにするフラグを降ろす<2次DB #2738>
	if(GetEventFlg_("BFG_CHECK_SAME_TIME_DEAD_AND_DEMO_2") == true){
		SetEventFlg_("BFG_CHECK_SAME_TIME_DEAD_AND_DEMO_2", false);
	}

//--------------------------------------------------------------------------------
// 全滅復帰と擬似デモ[メダルＱ開始]が被らないようにするフラグを降ろす<2次DB #2738>
	if(GetEventFlg_("BFG_CHECK_SAME_TIME_DEAD_AND_DEMO_3") == true){
		SetEventFlg_("BFG_CHECK_SAME_TIME_DEAD_AND_DEMO_3", false);
	}


	EventEnd_();
}

//------------------------------------------------
//		ＮＰＣ会話直前
//------------------------------------------------
function BeforeTalkNpc()
{
	local target = GetTargetId_();
	
	// Demo109[キングダム地震発生]再生直前はカメラアップしない
	if(target == g_king){
		local main_num = GetNumFlg_("NUM_SCENARIO_MAIN");
		local city_num = GetNumFlg_("NUM_SCENARIO_SUB_CITY");
		if(main_num == GetFlagID_("CONST_SM_CITY")){
			if(city_num == GetFlagID_("CONST_SS_CI_DISCOVER_HAIGOU")){
				SetTalkCameraType_(target, TALK_CAMERA_DEF);
			}
			else{
				SetTalkCameraType_(target, TALK_CAMERA_UP);
			}
		}
	}
	
	// ライド中にレナーテに話しかけた時は視点のオフセット値のY軸のみを変更する
	// 【備忘録】「npc_info.nut」で視点と注視点のオフセット値を原点の調整しています。
	//            なので、ココで行う視点のオフセット値変更は「npc_info.nut」で原点調整した値から
	//            さらに調整することになるので変更する時は要注意。
	if(target == npc_Renate){
		SetRideTalkCamOffset(OFFSET_RENATE);
	}

	EventEnd_();
}

//------------------------------------------------
//		ＮＰＣ接触時
//------------------------------------------------
function TouchNpc()
{
	local target = GetTargetId_();
	local player = GetPlayerId_();
	
	// イベントフラグ(お店の会話フラグはココ<アクセサリー屋は別処理なのでココに記載しない>)
	local book_flg = GetEventFlg_("BFG_TALK_BOOK");
	local item_flg = GetEventFlg_("BFG_TALK_ITEM");
	local meat_flg = GetEventFlg_("BFG_TALK_MEET");
	local bank_flg = GetEventFlg_("BFG_TALK_CREATE");

	local main_num = GetNumFlg_("NUM_SCENARIO_MAIN");			// Num0
	local city_num = GetNumFlg_("NUM_SCENARIO_SUB_CITY");		// Num3 : 崩落
	local grave_num = GetNumFlg_("NUM_SCENARIO_SUB_GRAVE");		// Num4 : 墓地
	local core_num = GetNumFlg_("NUM_SCENARIO_SUB_CORE");		// Num8 : コア
	local sky_num = GetNumFlg_("NUM_SCENARIO_SUB_SKY");			// Num9 : 高空

	//クエストフラグ
	local scoutq_num = GetNumFlg_(sq_num_sub);//ノチョーラC スカウト
	local raceq_num = GetNumFlg_("NUM_SUBEVENT_RACEQ");//リアクター
	local queenq_num = GetNumFlg_(aq_num_sub);//クイーン アクセ

	switch(target)
	{
	// キング
	case g_king:
		// 崩落都市
		if(main_num == GetFlagID_("CONST_SM_CITY")){
			//配合装置、試運転後の会話が5になる
			if(city_num >= GetFlagID_("CONST_SS_CI_GO_NEXT_CONTINENT")){
				MakeMassege("NAME_TAG_KING","MSG_DEMO123_AFTER_KING");
			}
			//キングに状況を報告後の会話が4になる
			if(city_num == GetFlagID_("CONST_SS_CI_TEST_RUN_HAIGOU")){
				MakeMassege("NAME_TAG_KING","MSG_DEMO122_AFTER_KING");
			}
			//動く大地後の会話が３になる
			if(city_num == GetFlagID_("CONST_SS_CI_REPORT_TO_KING")){
				SetNumFlg_("NUM_SCENARIO_SUB_CITY",GetFlagID_("CONST_SS_CI_TEST_RUN_HAIGOU"));
				// 主人公のデモ後の復帰位置
				SetReturnDemoPosDir_(Vec3(0.0, 2.5, 5.5), 180);
				// 話しかけたらすぐにフェード ＋ Demo122[キングに状況を報告]を再生
				TouchNpcChangeDemo(122);
			}
			//地震発生後の会話
			if(city_num >= GetFlagID_("CONST_SS_CI_EARTHQUAKE")
			&& city_num < GetFlagID_("CONST_SS_CI_REPORT_TO_KING")){
				MakeMassege("NAME_TAG_KING","MSG_DEMO109_AFTER_KING");
			}
			// シナリオ変更の為、あとでココにメッセージを追加
			if(city_num >= GetFlagID_("CONST_SS_CI_ENTER_KINGDOM")
			&& city_num < GetFlagID_("CONST_SS_CI_EARTHQUAKE")){
				// Demo108[ノチョーラキングダムの成立]の後
				if(city_num == GetFlagID_("CONST_SS_CI_DISCOVER_HAIGOU")){
					SetNumFlg_("NUM_SCENARIO_SUB_CITY", GetFlagID_("CONST_SS_CI_EARTHQUAKE"));
					// 西エレベーター解禁フラグ
					SetEventFlg_("BFG_UNLOCK_WEST_ELEVATOR", true);
					// 主人公のデモ後の復帰位置
					SetReturnDemoPosDir_(Vec3(0.0, 2.5, 5.5), 180);
					// 話しかけたらすぐにフェード ＋ Demo109[キングダム地震発生]を再生
					TouchNpcChangeDemo(109);
				}
				else{
					MakeMassege("NAME_TAG_KING","MSG_DEMO108_AFTER_KING");
				}
			}
		}
		// 歓楽の霊道以降～
		else if(main_num >= GetFlagID_("CONST_SM_CEMETERY")){
			// 歓楽の霊道～凍骨の氷原
			if(main_num == GetFlagID_("CONST_SM_CEMETERY")
			|| main_num == GetFlagID_("CONST_SM_ICE_FIELD")){
				uMedalQuestFlow("MSG_GRAVE_AFTER_KING", "BFG_FIRST_TALK_MQ_PHASE_X");
			}
			// 監獄～コア
			else if(main_num >= GetFlagID_("CONST_SM_PRISON")
			&& main_num <= GetFlagID_("CONST_SM_CORE")){
				// 監獄
				if(main_num == GetFlagID_("CONST_SM_PRISON")){
					local prison_num = GetNumFlg_("NUM_SCENARIO_SUB_PRISON");
					// ルキヤに出会う前(NUM006 が 14以下)
					if(prison_num <= GetFlagID_("CONST_SS_PR_SALVATION_VOICE")){
						uMedalQuestFlow("MSG_GRAVE_AFTER_KING", "BFG_FIRST_TALK_MQ_PHASE_X");
					}
					// ルキヤと出会った後～ルキヤと別れた前(NUM006 が 15 ～ 26)
					else if(prison_num >= GetFlagID_("CONST_SS_PR_RESISTANCE_RUKIYA")
					&& prison_num <= GetFlagID_("CONST_SS_PR_REMATCH_ITTABURU_START")){
						uMedalQuestFlow("MSG_PRISON_MET_RUKIYA_KING", "BFG_FIRST_TALK_MQ_PHASE_2");
					}
					// ルキヤと別れた[ルキヤが自爆した]後(NUM006 が 27以降)
					else{
						uMedalQuestFlow("MSG_PRISON_FAREWELL_RUKIYA_KING", "BFG_FIRST_TALK_MQ_PHASE_3");
					}
				}
				// 火山～コア
				else{
					uMedalQuestFlow("MSG_PRISON_FAREWELL_RUKIYA_KING", "BFG_FIRST_TALK_MQ_PHASE_3");
				}
			}
			// 高空
			else if(main_num == GetFlagID_("CONST_SM_SKY")){
				// ガルビルス戦勝利後～巨大ボーショック戦勝利前まで
				if(sky_num <= GetFlagID_("CONST_SS_SK_JDG_REMATCH_G_BOWSHOCK")){
					uMedalQuestFlow("MSG_WIN_GARUBIRUSU_AFTER_KING", "BFG_FIRST_TALK_MQ_PHASE_4");
				}
				// 巨大ボーショック戦勝利後～
				else if(sky_num >= GetFlagID_("CONST_SS_SK_GO_GRAVE_SKY")){
					uMedalQuestFlow("MSG_WIN_G_BOWSHOCK_AFTER_KING", "BFG_FIRST_TALK_MQ_PHASE_5");
				}
			}
			// 裏シナリオ
			else if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){
				local outside_num = GetNumFlg_("NUM_SCENARIO_SUB_INSIDE_CLEAR");
				// Demo804[アロマとキングの邂逅]の再生前
				if(outside_num <= GetFlagID_("CONST_SS_OS_GO_CENTER_BILL_1F")){
					uMedalQuestFlow("MSG_INSIDE_CLEAR_KING", "BFG_FIRST_TALK_MQ_PHASE_6");
				}
				// Demo804[アロマとキングの邂逅]の再生後
				else if(outside_num >= GetFlagID_("CONST_SS_OS_GO_CENTER_BILL_B1F")
				&& outside_num <= GetFlagID_("CONST_SS_OS_EXAMINE_STAR_SEED_2")){
					uMedalQuestFlow("MSG_MEET_AROMA_AFTER_KING", "BFG_FIRST_TALK_MQ_PHASE_7");
				}
				// レナーテ救出後
				else{
					uMedalQuestFlow("MSG_RENATE_RESCUE_AFTER_KING", "BFG_FIRST_TALK_MQ_PHASE_8");
				}
			}
			// 完全クリア後
			else{
				local allclear_num = GetNumFlg_("NUM_SCENARIO_SUB_ALL_CLEAR");
				// 完全クリア直後
				if(allclear_num <= GetFlagID_("CONST_SS_ALL_GO_TO_CENTER_BILL_B2F")){
					uMedalQuestFlow("MSG_ALL_CLEAR_KING", "BFG_FIRST_TALK_MQ_PHASE_9");
				}
				// モンスターバトルＧＰ解禁後
				else{
					uMedalQuestFlow("MSG_MBGP_AFTER_KING", "BFG_FIRST_TALK_MQ_PHASE_10");
				}
			}
		}
		break;
	// ジャック
	case g_jack:
		local bit_lq_start = GetEventFlg_("BFG_LIBRARY_FIRST_TIME");	// Bit_1073 ライブラリQ解放後、初めて話しかけた
		// 崩落都市
		if(main_num == GetFlagID_("CONST_SM_CITY")){
			// ノチョーラキングダム、機能開始
			if(city_num <= GetFlagID_("CONST_SS_CI_DISCOVER_HAIGOU")){
				MakeMassege("NAME_TAG_JACK","MSG_DEMO108_AFTER_JACK");
			}
			//地震発生後
			if(city_num >= GetFlagID_("CONST_SS_CI_EARTHQUAKE")
			&& city_num < GetFlagID_("CONST_SS_CI_TEST_RUN_HAIGOU")){
				MakeMassege("NAME_TAG_JACK","MSG_DEMO109_AFTER_JACK");
			}
			//キングに状況を報告後
			if(city_num == GetFlagID_("CONST_SS_CI_TEST_RUN_HAIGOU")){
				MakeMassege("NAME_TAG_JACK","MSG_DEMO122_AFTER_JACK");
			}
			//配合装置、試運転後
			if(city_num >= GetFlagID_("CONST_SS_CI_GO_NEXT_CONTINENT")){
				if(!bit_lq_start){
					uLibraryQuestFirstMsg();
				} else {
					uLibraryFlow("", "BFG_FIRST_TALK_LIB_PHASE_0");
				}
			}
		}
		// 歓楽の霊道以降
		else if(main_num >= GetFlagID_("CONST_SM_CEMETERY")){
			// メインフラグが歓楽の霊道～コアの時
			if(main_num >= GetFlagID_("CONST_SM_CEMETERY")
			&& main_num <= GetFlagID_("CONST_SM_CORE")){
				if(!bit_lq_start){
					uLibraryQuestFirstMsg();
				} else {
					uLibraryFlow("", "BFG_FIRST_TALK_LIB_PHASE_0");
				}
			}
			// メインフラグが高空になった時
			else if(main_num == GetFlagID_("CONST_SM_SKY")){
				// ガルビルス戦勝利後～巨大ボーショック戦勝利前まで
				if(sky_num <= GetFlagID_("CONST_SS_SK_JDG_REMATCH_G_BOWSHOCK")){
					if(!bit_lq_start){
						uLibraryQuestFirstMsg();
					} else {
						uLibraryFlow("MSG_WIN_GARUBIRUSU_AFTER_JACK", "BFG_FIRST_TALK_LIB_PHASE_1");
					}
				}
				// 巨大ボーショック戦勝利後～
				else if(sky_num >= GetFlagID_("CONST_SS_SK_GO_GRAVE_SKY")){
					if(!bit_lq_start){
						uLibraryQuestFirstMsg();
					} else {
						uLibraryFlow("MSG_WIN_G_BOWSHOCK_AFTER_JACK", "BFG_FIRST_TALK_LIB_PHASE_2");
					}
				}
			}
			// 裏シナリオ
			else if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){
				if(!bit_lq_start){
					uLibraryQuestFirstMsg();
				} else {
					uLibraryFlow("MSG_INSIDE_CLEAR_JACK", "BFG_FIRST_TALK_LIB_PHASE_3");
				}
			}
			// 完全クリア後
			else{
				local allclear_num = GetNumFlg_("NUM_SCENARIO_SUB_ALL_CLEAR");
				// 完全クリア直後
				if(allclear_num <= GetFlagID_("CONST_SS_ALL_GO_TO_CENTER_BILL_B2F")){
					if(!bit_lq_start){
						uLibraryQuestFirstMsg();
					} else {
						uLibraryFlow("MSG_ALL_CLEAR_JACK", "BFG_FIRST_TALK_LIB_PHASE_4");
					}
				}
				// モンスターバトルＧＰ解禁後
				else{
					if(!bit_lq_start){
						uLibraryQuestFirstMsg();
					} else {
						uLibraryFlow("MSG_MBGP_AFTER_JACK", "BFG_FIRST_TALK_LIB_PHASE_5");
					}
				}
			}
		}
		break;
	// エース
	case g_ace:
		// エースに話しかけた時点でNEWマークを消す
		SetEventFlg_("BFG_MAP_ICON_042", false);
		
		// 配合用フラグを初期化
		g_coupling_flg = false;
		g_coupling_event_flg = false;
		
		// ▼崩落シナリオ
		if(main_num <= GetFlagID_("CONST_SM_CITY")){
			// Demo130[その名は配合装置]再生後
			if(city_num <= GetFlagID_("CONST_SS_CI_DISCOVER_HAIGOU")){			// Num3 <= 10
				MakeMassege("NAME_TAG_ACE","MSG_DEMO130_AFTER_ACE");
			}
			//地震発生後の会話
			else if(city_num <= GetFlagID_("CONST_SS_CI_TEST_RUN_HAIGOU")){		// Num3 <= 28
				MakeMassege("NAME_TAG_ACE","MSG_DEMO109_AFTER_ACE");
			}
			// Demo123[配合装置の試運転]再生後
			else if(city_num >= GetFlagID_("CONST_SS_CI_GO_NEXT_CONTINENT")){	// Num3 >= 29
				// 配合サブイベントチェック
				uCoupling_CheckEvent();
				
				// サブイベントが発生していない場合
				if (!g_coupling_event_flg) {
					// シナリオメッセージ表示
					uCoupling_ScenarioMsg();
				}
				
				// 配合する場合
				if (g_coupling_flg) {
					// 配合画面へ
					uCoupling_GotoMenu();
				}
			}
		}
		
		// ▼墓地シナリオ以降
		else if(main_num >= GetFlagID_("CONST_SM_CEMETERY")){
			// 配合サブイベントチェック
			uCoupling_CheckEvent();
			
			// サブイベントが発生していない場合
			if (!g_coupling_event_flg) {
				// シナリオメッセージ表示
				uCoupling_ScenarioMsg();
			}
			
			// 配合する場合
			if (g_coupling_flg) {
				// 配合画面へ
				uCoupling_GotoMenu();
			}
		}
		
		break;
		
	// クイーン
	case g_queen:
		local flg_open_msg = true;		// ウィンドウを開くかどうか
		
		// 崩落都市
		if(main_num == GetFlagID_("CONST_SM_CITY")){
			// Demo129[エースが目を付けた機械]再生後～Demo121[動く大地⑤ エースと会話]再生後まで表示(NUM002が 9 ～ 27 )
			if(city_num >= GetFlagID_("CONST_SS_CI_ENTER_KINGDOM")
			&& city_num <= GetFlagID_("CONST_SS_CI_REPORT_TO_KING")){
				// メッセージ
				MakeMassege("NAME_TAG_QUEEN","MSG_DEMO108_AFTER_QUEEN");
			}
			// Demo122[キングに状況を報告]再生後
			else if(city_num == GetFlagID_("CONST_SS_CI_TEST_RUN_HAIGOU")){
				MakeMassege("NAME_TAG_QUEEN","MSG_DEMO122_AFTER_QUEEN");
			}
			// Demo123[配合装置の試運転]再生後
			else if(city_num >= GetFlagID_("CONST_SS_CI_GO_NEXT_CONTINENT")){
				// アクセサリーＱへ移行
				uAccessoriesQ( GetNumFlg_("NUM_SUBEVENT_QUEENQ"), flg_open_msg);
			}
			// それ以外 < 通らないはずなのでログ出力 >
			else{
				DebugPrint("クイーンのメッセージが対応していません<崩落都市シナリオ>");
			}
		}
		// 歓楽の霊道以降
		else if(main_num >= GetFlagID_("CONST_SM_CEMETERY")){
			// メインフラグが歓楽の霊道～コアの時
			if(main_num <= GetFlagID_("CONST_SM_CORE")){
				// アクセサリーＱへ移行
				uAccessoriesQ( GetNumFlg_("NUM_SUBEVENT_QUEENQ"), flg_open_msg);
			}
			// メインフラグが高空になった時
			else if(main_num == GetFlagID_("CONST_SM_SKY")){
				// ガルビルス戦勝利後～巨大ボーショック戦勝利前まで
				if(sky_num <= GetFlagID_("CONST_SS_SK_JDG_REMATCH_G_BOWSHOCK")){
					// クエスト中は表示させないようにする
					if(GetEventFlg_("BFG_SUBEVENT_QUEENQ_NOW") == false){
						// １回だけ表示( 2次DB #5941 )
						if(GetEventFlg_("BFG_FIRST_TALK_AQ_PHASE_1") == false){
							flg_open_msg = false;
							SetEventFlg_("BFG_FIRST_TALK_AQ_PHASE_1", true);
							
							OpenMsgWnd_();
							SetTalkName_("NAME_TAG_QUEEN");
							ShowMsg_("MSG_WIN_GARUBIRUSU_AFTER_QUEEN");
							KeyInputWait_();
						}
					}
					// アクセサリーＱへ移行
					uAccessoriesQ( GetNumFlg_("NUM_SUBEVENT_QUEENQ"), flg_open_msg);
				}
				// 巨大ボーショック戦勝利後～
				else if(sky_num >= GetFlagID_("CONST_SS_SK_GO_GRAVE_SKY")){
					// クエスト中は表示させないようにする
					if(GetEventFlg_("BFG_SUBEVENT_QUEENQ_NOW") == false){
						// １回だけ表示( 2次DB #5941 )
						if(GetEventFlg_("BFG_FIRST_TALK_AQ_PHASE_2") == false){
							flg_open_msg = false;
							SetEventFlg_("BFG_FIRST_TALK_AQ_PHASE_2", true);
							
							OpenMsgWnd_();
							SetTalkName_("NAME_TAG_QUEEN");
							ShowMsg_("MSG_WIN_G_BOWSHOCK_AFTER_QUEEN");
							KeyInputWait_();
						}
					}
					// アクセサリーＱへ移行
					uAccessoriesQ( GetNumFlg_("NUM_SUBEVENT_QUEENQ"), flg_open_msg);
				}
			}
			// 裏シナリオ
			else if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){
				// アクセサリーＱへ移行
				uAccessoriesQ( GetNumFlg_("NUM_SUBEVENT_QUEENQ"), flg_open_msg);
			}
			// 完全クリア後
			else{
				local allclear_num = GetNumFlg_("NUM_SCENARIO_SUB_ALL_CLEAR");
				// 完全クリア直後
				if(allclear_num <= GetFlagID_("CONST_SS_ALL_GO_TO_CENTER_BILL_B2F")){
					// アクセサリーＱへ移行
					uAccessoriesQ( GetNumFlg_("NUM_SUBEVENT_QUEENQ"), flg_open_msg);
				}
				// モンスターバトルＧＰ解禁後
				else{
					// クエスト中は表示させないようにする
					if(GetEventFlg_("BFG_SUBEVENT_QUEENQ_NOW") == false){
						// １回だけ表示( 2次DB #5941 )
						if(GetEventFlg_("BFG_FIRST_TALK_AQ_PHASE_5") == false){
							flg_open_msg = false;
							SetEventFlg_("BFG_FIRST_TALK_AQ_PHASE_5", true);
							
							OpenMsgWnd_();
							SetTalkName_("NAME_TAG_QUEEN");
							ShowMsg_("MSG_MBGP_AFTER_QUEEN");
							KeyInputWait_();
						}
					}
					// アクセサリーＱへ移行
					uAccessoriesQ( GetNumFlg_("NUM_SUBEVENT_QUEENQ"), flg_open_msg);
				}
			}
		}
		break;
	// リアクター屋(リアクターＱは仕様削除)
	case g_reactor:
		// 崩落都市
		if(main_num == GetFlagID_("CONST_SM_CITY")){
			// Demo129[エースが目を付けた機械]再生後
			if(city_num >= GetFlagID_("CONST_SS_CI_ENTER_KINGDOM")
			&& city_num <= GetFlagID_("CONST_SS_CI_DISCOVER_HAIGOU")){
				MakeMassege2("MSG_DEMO108_AFTER_SHOP_REACTOR");
			}
			// Demo109[キングダム地震発生]再生後
			else if(city_num >= GetFlagID_("CONST_SS_CI_EARTHQUAKE")
			&& city_num <= GetFlagID_("CONST_SS_CI_REPORT_TO_KING")){
				MakeMassege2("MSG_DEMO108_AFTER_SHOP_REACTOR_2");
			}
			// Demo122[キングに状況を報告]再生後
			else if(city_num == GetFlagID_("CONST_SS_CI_TEST_RUN_HAIGOU")){
				MakeMassege2("MSG_DEMO122_AFTER_SHOP_REACTOR_3");
			}
			// Demo123[配合装置の試運転]再生後
			else if(city_num == GetFlagID_("CONST_SS_CI_GO_NEXT_CONTINENT")){
				MakeMassege2("MSG_DEMO123_AFTER_SHOP_REACTOR");
			}
		}
		// 歓楽の霊道以降
		else if(main_num >= GetFlagID_("CONST_SM_CEMETERY")){
			// メインフラグが歓楽の霊道～コアの時
			if(main_num >= GetFlagID_("CONST_SM_CEMETERY")
			&& main_num <= GetFlagID_("CONST_SM_CORE")){
				OpenMsgWnd_();
				ShowMsg_("MSG_DEMO123_AFTER_SHOP_REACTOR");
				KeyInputWait_();
				CloseMsgWnd_();
			}
			// メインフラグが高空になった時
			else if(main_num == GetFlagID_("CONST_SM_SKY")){
				// ガルビルス戦勝利後～巨大ボーショック戦勝利前まで
				if(sky_num <= GetFlagID_("CONST_SS_SK_JDG_REMATCH_G_BOWSHOCK")){
					MakeMassege2("MSG_WIN_GARUBIRUSU_AFTER_SHOP_REC");
				}
				// 巨大ボーショック戦勝利後～
				else if(sky_num >= GetFlagID_("CONST_SS_SK_GO_GRAVE_SKY")){
					MakeMassege2("MSG_WIN_G_BOWSHOCK_AFTER_SHOP_REC");
				}
			}
			// 裏シナリオ
			else if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){
				MakeMassege2("MSG_INSIDE_CLEAR_SHOP_REC");
			}
			// 完全クリア後
			else{
				// 裏シナリオの途中で地下１階に移動するのでなにもしない
			}
		}
		break;
	// モブ１<ノチョリン>
	case g_n_man01:
		// 崩落都市
		if(main_num == GetFlagID_("CONST_SM_CITY")){
			// Demo130[その名は配合装置]再生後
			if(city_num <= GetFlagID_("CONST_SS_CI_DISCOVER_HAIGOU")){
				MakeMassege("NAME_TAG_NOCHORIN","MSG_DEMO108_AFTER_MOB_A");
			}else{
				// Demo109[キングダム地震発生]再生後～Demo122[キングに状況を報告]再生前まで
				if(city_num <= GetFlagID_("CONST_SS_CI_REPORT_TO_KING")){
					MakeMassege("NAME_TAG_NOCHORIN","MSG_DEMO109_AFTER_MOB_A");
				}else{
					// Demo122[キングに状況を報告]再生後
					if(city_num <= GetFlagID_("CONST_SS_CI_TEST_RUN_HAIGOU")){
						MakeMassege("NAME_TAG_NOCHORIN","MSG_DEMO122_AFTER_MOB_A");
					}else{
						// Demo123[配合装置の試運転]再生後
						if(city_num <= GetFlagID_("CONST_SS_CI_GO_NEXT_CONTINENT")){
							uScoutQuest();
						}
					}
				}
			}
		}
		// 歓楽の霊道以降
		else if(main_num >= GetFlagID_("CONST_SM_CEMETERY")){
			// メインフラグが歓楽の霊道～コアの時
			if(main_num >= GetFlagID_("CONST_SM_CEMETERY")
			&& main_num <= GetFlagID_("CONST_SM_CORE")){
				uScoutQuest();
			}
			// メインフラグが高空になった時
			else if(main_num == GetFlagID_("CONST_SM_SKY")){
				// ガルビルス戦勝利後～巨大ボーショック戦勝利前まで
				if(sky_num <= GetFlagID_("CONST_SS_SK_JDG_REMATCH_G_BOWSHOCK")){
					// クエスト初回メッセージが表示されていたら、前置きメッセージを表示
					if(GetEventFlg_("BFG_CHECK_SCOUT_MSG_FIRST") == true){
						// クエスト中は表示させないようにする
						if(GetEventFlg_("BFG_SUBEVENT_SCOUTQ_NOW") == false){
							// １回だけ表示( 2次DB #5941 )
							if(GetEventFlg_("BFG_FIRST_TALK_SCOUT_PHASE_1") == false){
								SetEventFlg_("BFG_FIRST_TALK_SCOUT_PHASE_1", true);
								local msg = "MSG_WIN_GARUBIRUSU_AFTER_MOB_A_INTRODUCTION";
								OpenMsgWnd_();
								SetTalkName_("NAME_TAG_NOCHORIN");
								ShowMsg_(msg);
								KeyInputWait_();
								CloseMsgWnd_();
							}
						}
					}
					uScoutQuest();
				}
				// 巨大ボーショック戦勝利後～
				else if(sky_num >= GetFlagID_("CONST_SS_SK_GO_GRAVE_SKY")){
					// クエスト初回メッセージが表示されていたら、前置きメッセージを表示
					if(GetEventFlg_("BFG_CHECK_SCOUT_MSG_FIRST") == true){
						// クエスト中は表示させないようにする
						if(GetEventFlg_("BFG_SUBEVENT_SCOUTQ_NOW") == false){
							// １回だけ表示( 2次DB #5941 )
							if(GetEventFlg_("BFG_FIRST_TALK_SCOUT_PHASE_2") == false){
								SetEventFlg_("BFG_FIRST_TALK_SCOUT_PHASE_2", true);
								local msg = "MSG_WIN_G_BOWSHOCK_AFTER_MOB_A_INTRODUCTION";
								OpenMsgWnd_();
								SetTalkName_("NAME_TAG_NOCHORIN");
								ShowMsg_(msg);
								KeyInputWait_();
								CloseMsgWnd_();
							}
						}
					}
					uScoutQuest();
				}
			}
			// 裏シナリオ
			else if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){
				// クエスト初回メッセージが表示されていたら、前置きメッセージを表示
				if(GetEventFlg_("BFG_CHECK_SCOUT_MSG_FIRST") == true){
					// クエスト中は表示させないようにする
					if(GetEventFlg_("BFG_SUBEVENT_SCOUTQ_NOW") == false){
						// スカウトＱをクリアしたか？< 裏シナリオ以降でしか判定しません >
						if(GetEventFlg_("BFG_SUBEVENT_SCOUTQ_CLEAR") == false){
							// １回だけ表示( 2次DB #5941 )
							if(GetEventFlg_("BFG_FIRST_TALK_SCOUT_PHASE_3") == false){
								SetEventFlg_("BFG_FIRST_TALK_SCOUT_PHASE_3", true);
								local msg = "MSG_INSIDE_CLEAR_MOB_A_INTRODUCTION";
								OpenMsgWnd_();
								SetTalkName_("NAME_TAG_NOCHORIN");
								ShowMsg_(msg);
								KeyInputWait_();
								CloseMsgWnd_();
							}
						}
					}
				}
				uScoutQuest();
			}
			// 完全クリア後
			else{
				local allclear_num = GetNumFlg_("NUM_SCENARIO_SUB_ALL_CLEAR");
				// 完全クリア直後
				if(allclear_num <= GetFlagID_("CONST_SS_ALL_GO_TO_CENTER_BILL_B2F")){
					// クエスト初回メッセージが表示されていたら、前置きメッセージを表示
					if(GetEventFlg_("BFG_CHECK_SCOUT_MSG_FIRST") == true){
						// クエスト中は表示させないようにする
						if(GetEventFlg_("BFG_SUBEVENT_SCOUTQ_NOW") == false){
							// スカウトＱをクリアしたか？< 裏シナリオ以降でしか判定しません >
							if(GetEventFlg_("BFG_SUBEVENT_SCOUTQ_CLEAR") == false){
								// １回だけ表示( 2次DB #5941 )
								if(GetEventFlg_("BFG_FIRST_TALK_SCOUT_PHASE_3") == false){
									SetEventFlg_("BFG_FIRST_TALK_SCOUT_PHASE_3", true);
									local msg = "MSG_INSIDE_CLEAR_MOB_A_INTRODUCTION";
									OpenMsgWnd_();
									SetTalkName_("NAME_TAG_NOCHORIN");
									ShowMsg_(msg);
									KeyInputWait_();
									CloseMsgWnd_();
								}
							}
						}
					}
					uScoutQuest();
				}
				// モンスターバトルＧＰ解禁後
				else{
					// クエスト初回メッセージが表示されていたら、前置きメッセージを表示
					if(GetEventFlg_("BFG_CHECK_SCOUT_MSG_FIRST") == true){
						// クエスト中は表示させないようにする
						if(GetEventFlg_("BFG_SUBEVENT_SCOUTQ_NOW") == false){
							// スカウトＱをクリアしたか？< 裏シナリオ以降でしか判定しません >
							if(GetEventFlg_("BFG_SUBEVENT_SCOUTQ_CLEAR") == false){
								// １回だけ表示( 2次DB #5941 )
								if(GetEventFlg_("BFG_FIRST_TALK_SCOUT_PHASE_4") == false){
									SetEventFlg_("BFG_FIRST_TALK_SCOUT_PHASE_4", true);
									local msg = "MSG_MBGP_AFTER_MOB_A_INTRODUCTION";
									OpenMsgWnd_();
									SetTalkName_("NAME_TAG_NOCHORIN");
									ShowMsg_(msg);
									KeyInputWait_();
									CloseMsgWnd_();
								}
							}
						}
					}
					uScoutQuest();
				}
			}
		}
		break;
	// モブ２
	case g_n_man02:
		// 崩落都市
		if(main_num == GetFlagID_("CONST_SM_CITY")){
			if(city_num > GetFlagID_("CONST_SS_CI_GO_BACK_KING")
			&& city_num < GetFlagID_("CONST_SS_CI_TEST_RUN_HAIGOU")){
				MakeMassege2("MSG_DEMO108_AFTER_MOB_B");
			}
			if(city_num >= GetFlagID_("CONST_SS_CI_GO_NEXT_CONTINENT")){
				MakeMassege2("MSG_DEMO123_AFTER_MOB_B");
			}
			if(city_num == GetFlagID_("CONST_SS_CI_TEST_RUN_HAIGOU")){
				MakeMassege2("MSG_DEMO122_AFTER_MOB_D");
			}
		}
		// 歓楽の霊道以降
		else if(main_num >= GetFlagID_("CONST_SM_CEMETERY")){
			// メインフラグが歓楽の霊道～コアの時
			if(main_num <= GetFlagID_("CONST_SM_CORE")){
				OpenMsgWnd_();
				ShowMsg_("MSG_DEMO123_AFTER_MOB_B");
				KeyInputWait_();
				CloseMsgWnd_();
			}
			// メインフラグが高空になった時
			else if(main_num == GetFlagID_("CONST_SM_SKY")){
				// ガルビルス戦勝利後～巨大ボーショック戦勝利前まで
				if(sky_num <= GetFlagID_("CONST_SS_SK_JDG_REMATCH_G_BOWSHOCK")){
					OpenMsgWnd_();
					ShowMsg_("MSG_WIN_GARUBIRUSU_AFTER_MOB_B");
					KeyInputWait_();
					CloseMsgWnd_();
				}
				// 巨大ボーショック戦勝利後～
				else if(sky_num >= GetFlagID_("CONST_SS_SK_GO_GRAVE_SKY")){
					OpenMsgWnd_();
					if(GetEventFlg_("BFG_SET_MONSTER_G_BUNDORUDO_WINS") == false){
						// 霊道の黒い花粉除去前
						ShowMsg_("MSG_WIN_G_BOWSHOCK_AFTER_MOB_B_01");
					}
					else{
						// 霊道の黒い花粉除去後
						ShowMsg_("MSG_WIN_G_BOWSHOCK_AFTER_MOB_B_02");
					}
					KeyInputWait_();
					CloseMsgWnd_();
				}
			}
			// 裏シナリオ
			else if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){
				OpenMsgWnd_();
				ShowMsg_("MSG_INSIDE_CLEAR_MOB_B");
				KeyInputWait_();
				CloseMsgWnd_();
			}
			// 完全クリア後
			else{
				// 裏シナリオの途中で地下１階に移動するのでなにもしない
			}
		}
		break;
	// 宿屋
	case g_inn:
		uInnMessage();
		break;
	// 道具屋
	case g_item:
		// 話しかけた時点でNEWマークを消す
		SetEventFlg_("BFG_MAP_ICON_043", false);
		uItemShopFlowMsg(item_flg);
		break;
	// 銀行
	case g_bank:
		// 話しかけた時点でNEWマークを消す
		SetEventFlg_("BFG_MAP_ICON_047", false);
		uBankFlowMsg(bank_flg);
		break;
	// 本屋
	case g_book:
		// 話しかけた時点でNEWマークを消す
		SetEventFlg_("BFG_MAP_ICON_040", false);
		uBookStoreFlowMsg(book_flg);
		break;
	// チョーマッハ(歓楽の霊道クリア以降に追加)
	case g_hunter:
		// チョーマッハに話しかけた時点でNEWマークを消す
		SetEventFlg_("BFG_MAP_ICON_045", false);
		// レースのチュートリアルを一度でも見たか？
		local check_racedemo = GetEventFlg_("BFG_PLAYED_RACE_TUTORIAL");
		// レースのチュートリアルを一度でも見たかチェック
		if(check_racedemo == true){
			local flg_b  = uCheckReleaseRaceB();
			local flg_a  = uCheckReleaseRaceA();
			local flg_s  = uCheckReleaseRaceS();
			local flg_ss = uCheckReleaseRaceSS();
			local release = uCheckBranch(flg_b, flg_a, flg_s, flg_ss);
			if(release == true){
				// 解禁メッセージを出してレースに移行
				uNewRaceReleaseMsg(flg_b, flg_a, flg_s, flg_ss);
			}
			else{
				// 通常メッセージ＋レース移行
				uRaceMsg(check_racedemo);
			}
		}
		else{
			// 初回メッセージ＋レース移行
			uRaceMsg(check_racedemo);
		}
		break;
	// 肉屋
	case g_meat:
		// 話しかけた時点でNEWマークを消す
		SetEventFlg_("BFG_MAP_ICON_044", false);
		uMeatShopFlowMsg(meat_flg);
		break;
	// アクセサリー屋
	case g_acce:
		uAcceShopFlowMsg();
		break;
	// アロマ
	case npc_Aroma:
		MakeMassege("NAME_TAG_AROMA","AROMA_MSG_001");
		break;
	// 市民男Ａ
	case npc_Citizen_Man_A:
		uCitizenManMsg();
		break;
	// 市民子供Ａ
	case npc_Citizen_Chi_A:
		uCitizenChiMsg();
		break;
	// レナーテ
	case npc_Renate:
		uRenateMsg();
		break;
	default:
		DebugPrint("対応しているNPCがいません");
		break;
	}

	EventEnd_();
}

//------------------------------------------------
//		地雷接触時
//------------------------------------------------
function TouchEventMine()
{

	local target = GetTouchEventMineId_();
	local player = GetPlayerId_();

	// フラグの状態を取得
	local main_num         = GetNumFlg_("NUM_SCENARIO_MAIN");
	local city_num   = GetNumFlg_("NUM_SCENARIO_SUB_CITY");

	// 西エレベーター解禁フラグ
	local unlock_west_elevator = GetEventFlg_("BFG_UNLOCK_WEST_ELEVATOR");
	// 東エレベーター解禁フラグ
	local unlock_east_elevator = GetEventFlg_("BFG_UNLOCK_EAST_ELEVATOR");

	switch(target)
	{
	// 西エレベータ
	case WestElevator:
		CommPlayerTurnAroundObj(w_lift);
		if(unlock_west_elevator == true){
			// 地雷削除
			DeleteEventMine_(WestElevator);
			uMoveUpWestEleveter();
		}
		else{
			//解禁されていない場合はシステムメッセージを表示
			MakeMassege2("NOT_MOVE_EAST_ELEVATOR");
		}
		break;
	// 東エレベータ
	case EastElevator:
		CommPlayerTurnAroundObj(e_lift);
		if(unlock_east_elevator == true){
			// 地雷削除
			DeleteEventMine_(EastElevator);
			uChoiceMoveEastEleveter();
		}
		else{
			//解禁されていない場合はシステムメッセージを表示
			MakeMassege2("NOT_MOVE_EAST_ELEVATOR");
		}
		break;
	case mine_Mcninfo:
		CommPlayerTurnAroundDir(142);
		if(GetEventFlg_("BFG_COUPLINGMACHINE_ACTIVE") == false){
			MakeMassege2("MIXMACHINE_GUIDE_001");
		}
		else{
			OpenMsgWnd_();
			ShowMsg_("MIXMACHINE_GUIDE_101");
			KeyInputWait_();
			ShowMsg_("MIXMACHINE_GUIDE_102");
			KeyInputWait_();
			while(true){
				// 配合とは
				if(GetQueryResult_() == QUERY_0){
					ShowMsg_("MIXMACHINE_GUIDE_201");
					KeyInputWait_();
					ShowMsg_("MIXMACHINE_GUIDE_202");
					KeyInputWait_();
					ShowMsg_("MIXMACHINE_GUIDE_203");
					KeyInputWait_();
					ShowMsg_("MIXMACHINE_GUIDE_204");
					KeyInputWait_();
					ShowMsg_("MIXMACHINE_GUIDE_205");
					KeyInputWait_();
					ShowMsg_("MIXMACHINE_GUIDE_206");
					KeyInputWait_();
					ShowMsg_("MIXMACHINE_GUIDE_102");
					KeyInputWait_();
				}
				// プラス値について
				else if(GetQueryResult_() == QUERY_1){
					ShowMsg_("MIXMACHINE_GUIDE_211");
					KeyInputWait_();
					ShowMsg_("MIXMACHINE_GUIDE_212");
					KeyInputWait_();
					ShowMsg_("MIXMACHINE_GUIDE_213");
					KeyInputWait_();
					ShowMsg_("MIXMACHINE_GUIDE_214");
					KeyInputWait_();
					ShowMsg_("MIXMACHINE_GUIDE_215");
					KeyInputWait_();
					ShowMsg_("MIXMACHINE_GUIDE_216");
					KeyInputWait_();
					ShowMsg_("MIXMACHINE_GUIDE_102");
					KeyInputWait_();
				}
				// スカウトの秘けつ
				else if(GetQueryResult_() == QUERY_2){
					ShowMsg_("MIXMACHINE_GUIDE_221");
					KeyInputWait_();
					ShowMsg_("MIXMACHINE_GUIDE_222");
					KeyInputWait_();
					ShowMsg_("MIXMACHINE_GUIDE_223");
					KeyInputWait_();
					ShowMsg_("MIXMACHINE_GUIDE_224");
					KeyInputWait_();
					ShowMsg_("MIXMACHINE_GUIDE_225");
					KeyInputWait_();
					ShowMsg_("MIXMACHINE_GUIDE_226");
					KeyInputWait_();
					ShowMsg_("MIXMACHINE_GUIDE_102");
					KeyInputWait_();
				}
				// 命令と作戦
				else if(GetQueryResult_() == QUERY_3){
					ShowMsg_("MIXMACHINE_GUIDE_231");
					KeyInputWait_();
					ShowMsg_("MIXMACHINE_GUIDE_232");
					KeyInputWait_();
					ShowMsg_("MIXMACHINE_GUIDE_233");
					KeyInputWait_();
					ShowMsg_("MIXMACHINE_GUIDE_234");
					KeyInputWait_();
					ShowMsg_("MIXMACHINE_GUIDE_102");
					KeyInputWait_();
				}
				// やめる
				else{
					break;
				}
			}
			CloseMsgWnd_();
		}
		break;
	// エースに近づいたらデモが再生する地雷
	case near_ace:
		if(main_num == GetFlagID_("CONST_SM_CITY")){
			switch(city_num)
			{
			// Demo129[エースが目を付けた機械]再生後
			case GetFlagID_("CONST_SS_CI_ENTER_KINGDOM"):
				DeleteEventMine_(near_ace);
				SetReturnDemoPosDir_(Vec3(-34.763, 22.500, -227.498), -145);
				SetNumFlg_("NUM_SCENARIO_SUB_CITY", GetFlagID_("CONST_SS_CI_DISCOVER_HAIGOU"));
				// Demo130[その名は配合装置]再生
				ChangeDemo_(130);
				break;
			// Demo122[キングに状況を報告]再生後
			case GetFlagID_("CONST_SS_CI_TEST_RUN_HAIGOU"):
				DeleteEventMine_(near_ace);
				// NUM003フラグを 28 から 29に設定
				SetNumFlg_("NUM_SCENARIO_SUB_CITY", GetFlagID_("CONST_SS_CI_GO_NEXT_CONTINENT"));
				// マップチェンジできるようにする
				SetHitEnableMapChangeNull_("w_A00_00ALdr_001", true);// 下層の出入り口
				SetHitEnableMapChangeNull_("w_A00_00ALdr_001", true);// 上層の出入り口
				// プレイヤー特技(ルーラ)の禁止を解除する（Demo116[エースの頼み事]再生後～Demo123[配合装置の試運転]再生後まで禁止するがここでは解除するだけで禁止するのはA03_01.nutで行っている）
				SetEventFlg_("BFG_PLAYERABILITY_RULER_PROHIBIT", false);
				SetReturnDemoPosDir_(Vec3(0.0, 15.0, -187.121), 180);
				// bitフラグの設定
				SetEventFlg_("BFG_ENABLED_GO_TO_GRAVE_TRANSFER", true);//歓楽の霊道行きの移動装置解禁フラグ
				SetEventFlg_("BFG_TRAVEL_INFO_SHOW_046", true);        //旅の心得の項目解放フラグ【仲間の育成】配合
				SetEventFlg_("BFG_TRAVEL_INFO_SHOW_047", true);        //旅の心得の項目解放フラグ【仲間の育成】配合の仕方
				// ナビマップNEWアイコンの表示切替
				SetEventFlg_("BFG_DISPLAYED_CROSS_OVER_NEW_ICON", true);
				// Demo123[配合装置、試運転]
				ChangeDemo_(123);
				break;
			}
		}
		break;
	case mine_MedalQ:
		SetEventFlg_("BFG_NEAR_KING_MINE", true);
		// ライド解除の為、マップチェンジ
		ChangeMapPosDir_("A01_00", Vec3(0.000, 2.500, 22.500), 180);
		break;
	default:
		DebugPrint("対応している地雷がありません");
		break;
	}

	EventEnd_();
}

//------------------------------------------------
//		リアクターで調べた時
//------------------------------------------------
function ReactorAnalyze()
{
	EventEnd_();
}


//===========================================================================
// ローカル関数：メッセージウィンドウを表示させるための関数
//---------------------------------------------------------------------------
// 引数    ：ネームタグ,メッセージキー
// 戻り値  ：なし
//===========================================================================
function MakeMassege(name_tag, message)
{
	OpenMsgWnd_();
	SetTalkName_(name_tag);
	ShowMsg_(message);
	KeyInputWait_();
	CloseMsgWnd_();
}
//===========================================================================
// ローカル関数：メッセージウィンドウを表示させるための関数（名前なし）
//---------------------------------------------------------------------------
// 引数    ：メッセージキー
// 戻り値  ：なし
//===========================================================================
function MakeMassege2(message)
{
	OpenMsgWnd_();
	ShowMsg_(message);
	KeyInputWait_();
	CloseMsgWnd_();
}

//==========================================================================
// ローカル関数：demo132[チョーマッハとの再会]再生準備
//--------------------------------------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//==========================================================================
function uPlayDemo132()
{
	// 全滅復帰と重なった → 抜ける
	if(GetEventFlg_("BFG_CHECK_SAME_TIME_DEAD_AND_DEMO_3")){ return; }
	
	// 配合画面から復帰した後 → 抜ける
	if(GetEventFlg_("BFG_COUPLING_RETURN_MESSAGE")){ return; }
	
	// 一度でも再生されている → 抜ける
	if(GetEventFlg_("BFG_PLAYED_DEMO_MEETING_AGEIN")){ return; }
	
	
	// デモ再生前にフィールドが映らないための対応
	uCheckFadeOutTypeAndChangeFadeOutType();
	SetEventFlg_("BFG_PLAYED_DEMO_MEETING_AGEIN", true);
	// デモ後の主人公の位置を修正
	SetReturnDemoPosDir_(Vec3(0.0, 2.5, 244.837), 180);
	// レースアイコンの表示設定
	SetEventFlg_("BFG_MAP_ICON_038", true); // アイコン
	SetEventFlg_("BFG_MAP_ICON_045", true); // NEWマーク
	// 旅の心得の解放
	SetEventFlg_("BFG_TRAVEL_INFO_SHOW_061", true); // 旅の心得の項目解放フラグ 【バーチャルコロシアム】Gカップ
	SetEventFlg_("BFG_TRAVEL_INFO_SHOW_055", true); // 旅の心得の項目解放フラグ 【通信】たくさん集めて参加しよう！Gカップランキン
	// Demo132[チョーマッハとの再会]
	ChangeDemo_(132);
}

//==========================================================================
// ローカル関数：全滅復帰と特定のデモの再生が重なった時の処理
//--------------------------------------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//==========================================================================
function uResetDeadReturnAndDemo()
{
	local main_num = GetNumFlg_("NUM_SCENARIO_MAIN");					// Num0
	
	// デモを流さないのでフェードを切り替えるフラグを降ろす
	SetEventFlg_("BFG_CHECK_DEAD_RETURN_FADE_OFF", false);				// Bit1096
	SetEventFlg_("BFG_CHECK_SAME_TIME_DEAD_AND_DEMO_2", true);			// Bit1088
	
	// 全滅復帰後、会話できるよう設定
	SetTalkEnable_(g_king, true);
	SetTalkTurn_(g_king, false);
	SetTalkCameraType_(g_king, TALK_CAMERA_UP);
	SetSearchableAngle_(g_king, SEARCHABLE_ANGLE_MINIMUM);
	SetReactorMsg_(g_king, "NPC_KING_REC");
	
	// メダルQ開始前ならキングのモーションを設定
	if(!GetEventFlg_("BFG_DUMMY_MEDAL_QUEST_START")){					// Bit1999 : メダルQ解放後、初めて話しかけた
		if(main_num >= GetFlagID_("CONST_SM_CEMETERY")){				// Num0 >= 3
			if(GetEventFlg_("BFG_NEAR_KING_MINE") == false){
				local king_think_L = ReadMotion_(g_king, "n003_think_L");	// 考えるLOOP
				SetMotion_(g_king, king_think_L, BLEND_M);
				SetTalkEnable_(g_king, false);
			}
		}
	}
	
	// 暗転明け
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	Wait_(FADE_DEF);
}

//===========================================================================
// ローカル関数：キングのメダルクエスト用の処理
//---------------------------------------------------------------------------
// 第一引数：メッセージキー
// 第一引数：対応する導入メッセージの初回フラグの名前
// 戻り値  ：なし
//===========================================================================
function uMedalQuestFlow(msg_key, flg_name)
{
	local bit_mq_start = GetEventFlg_("BFG_DUMMY_MEDAL_QUEST_START");	// メダルQ解放後、初めて話しかけた

	if(!bit_mq_start){
		//uMedalQuestFirstMsg();
	} else {
		// 津呂さんのコメント#22で削除されたので表示されないようにしました。(2次DB #5941)
		if(msg_key != "MSG_GRAVE_AFTER_KING"){
			// １回だけ表示( 2次DB #5941 )
			if(GetEventFlg_(flg_name) == false){
				SetEventFlg_(flg_name, true);
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_KING");
				ShowMsg_(msg_key);
				KeyInputWait_();
				// uMedalQuest()内でOpenMsgWnd_()を行わないようにするためのフラグ設定
				medal_msg_flg = true;
			}
		}
		// ちいさなメダル交換へ移行
		uMedalQuest();
	}
}

//===========================================================================
// ローカル関数：ジャックのライブラリフローの処理
//---------------------------------------------------------------------------
// 第一引数：メッセージキー
// 第一引数：対応する導入メッセージの初回フラグの名前
// 戻り値  ：なし
//===========================================================================
function uLibraryFlow(msg_key, flg_name)
{
	local bit_library_clear = GetEventFlg_("BFG_LIBRARY_INFO_ALL");	// Bit_1074 全てのライブラリ情報解放
	// ライブラリ未完成
	if(bit_library_clear == false){
		DebugPrint("ジャックのライブラリフロー " + msg_key + " ");
		// ライブラリへ移行
		uLibraryOpenMsg();
		// ライブラリへ移行した際、ライブラリ解放メッセージを表示したかチェック
		if(lib_msg_flg == false){
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_JACK");
			// １回だけ表示
			if(msg_key != "" && GetEventFlg_(flg_name) == false){
				SetEventFlg_(flg_name, true);
				ShowMsg_(msg_key);
				KeyInputWait_();
			}
			ShowMsg_("MSG_END_JACK");
			KeyInputWait_();
			CloseMsgWnd_();
			DebugPrint("ジャックのライブラリフロー " + lib_msg_flg + " ");
		}
		lib_msg_flg = false;
	}
	// ライブラリ完成
	else{
		local comp_msg_key = uCheckLibraryCompMsgKey();
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_JACK");
		ShowMsg_(comp_msg_key);
		KeyInputWait_();
		CloseMsgWnd_();
	}
}

//===========================================================================
// ローカル関数：ジャックのライブラリ完成時のメッセージフローの処理
//---------------------------------------------------------------------------
// 引数    ：なし
// 戻り値  ：メッセージキー
//===========================================================================
function uCheckLibraryCompMsgKey()
{
	// シナリオメインフラグ（キングやクイーンなどのお店以外のnpc会話のフラグ）
	local main_num = GetNumFlg_("NUM_SCENARIO_MAIN");
	// 崩落都市のシナリオサブフラグ（キングやクイーンなどのお店以外のnpc会話のフラグ）
	local city_num = GetNumFlg_("NUM_SCENARIO_SUB_CITY");
	// コアのシナリオサブフラグ（npc会話用）
	local core_num = GetNumFlg_("NUM_SCENARIO_SUB_CORE");
	// 高空のシナリオサブフラグ
	local sky_num = GetNumFlg_("NUM_SCENARIO_SUB_SKY");

	// 崩落都市
	if(main_num == GetFlagID_("CONST_SM_CITY")){
		//配合装置、試運転後
		if(city_num >= GetFlagID_("CONST_SS_CI_GO_NEXT_CONTINENT")){
			return "MSG_DEMO123_AFTER_JACK_02";
		}
	}
	// 歓楽の霊道以降
	else if(main_num >= GetFlagID_("CONST_SM_CEMETERY")){
		// メインフラグが歓楽の霊道～コアの時
		if(main_num >= GetFlagID_("CONST_SM_CEMETERY")
		&& main_num <= GetFlagID_("CONST_SM_CORE")){
			return "MSG_DEMO123_AFTER_JACK_02";
		}
		// メインフラグが高空になった時
		else if(main_num == GetFlagID_("CONST_SM_SKY")){
			// ガルビルス戦勝利後～巨大ボーショック戦勝利前まで
			if(sky_num <= GetFlagID_("CONST_SS_SK_JDG_REMATCH_G_BOWSHOCK")){
				return "MSG_WIN_GARUBIRUSU_AFTER_JACK_02";
			}
			// 巨大ボーショック戦勝利後～
			else if(sky_num >= GetFlagID_("CONST_SS_SK_GO_GRAVE_SKY")){
				return "MSG_WIN_G_BOWSHOCK_AFTER_JACK_02";
			}
		}
		// 裏シナリオ
		else if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){
			return "MSG_INSIDE_CLEAR_JACK_02";
		}
		// 完全クリア後
		else{
			local allclear_num = GetNumFlg_("NUM_SCENARIO_SUB_ALL_CLEAR");
			// 完全クリア直後
			if(allclear_num <= GetFlagID_("CONST_SS_ALL_GO_TO_CENTER_BILL_B2F")){
				return "MSG_INSIDE_CLEAR_JACK_02";
			}
			// モンスターバトルＧＰ解禁後
			else{
				return "MSG_MBGP_AFTER_JACK_02";
			}
		}
	}
}

//======================================================
// 共通関数：裏シナリオクリア時のセーブ処理
//------------------------------------------------------
// 第一引数：なし
// 戻り値  ：なし
//======================================================
function uAutoSaved()
{
	// 大陸移動のデモ中にセーブポイントを挟む際に使用するフラグ
	local save_pnt_flg = GetEventFlg_("BFG_SAVE_POINT_FLAG");
	if(save_pnt_flg == true){
		// 大陸移動のデモ中にセーブポイントを挟む際に使用するフラグをfalseに
		SetEventFlg_("BFG_SAVE_POINT_FLAG", false);
		SetNavimapVisible_(false);			// 下画面(マップを映らなくする)
		// セーブ画面へ移行
		local tsk_saved_wnd = Task_Save_();
		WaitTask(tsk_saved_wnd);
		DebugPrint("セーブ完了");
		KeyInputWait_();
		Wait_(1);
		// 暗転明け前に下画面を暗転させる
		SetNavimapVisible_(true);
		SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
		WaitFadeSub_();
	}
}

//================================================================
// 自作関数：センタービルに入ると再生されるデモ(demo132,demo804)で
//           入口から入った場合とそれ以外の場合で
//           スクリプトで判断してフェードの種類を変更する
//----------------------------------------------------------------
// 第一引数：なし
// 戻り値  ：なし
//================================================================
function uCheckFadeOutTypeAndChangeFadeOutType()
{
	// 入口から入ってきたとき
	if(GetEnteredMapChangeNullName_() == "w_A00_00ALdr_006"){
		CommChangeMomentFadeOut(FADE_COLOR_BLACK);
	}
	// それ以外の時
	else{
		// 全滅復帰で入ってきたとき
		if(GetEventFlg_("BFG_CHECK_DEAD_RETURN_FADE_OFF") == true){
			// 全滅復帰後にデモを流す時用のフェードを切り替えるフラグを元に戻す
			SetEventFlg_("BFG_CHECK_DEAD_RETURN_FADE_OFF", false);
			CommChangeMomentFadeOut(FADE_COLOR_BLACK);
		}
		// それ以外
		else{
			// エレベータを使って入ってきたとき
			if(GetEventFlg_("BFG_CHECK_USED_ELEVATER_FADE_OFF") == true){
				// エレベータを使用したタイミングでデモを流すタイミングと被った場合フェードの種類を切り替える為のフラグを戻す
				SetEventFlg_("BFG_CHECK_USED_ELEVATER_FADE_OFF", false);
				CommChangeMomentFadeOut(FADE_COLOR_BLACK);
			}
			// それ以外(ルーラで入ってきたときを想定)
			else{
				// ルーラで入ってきたとき
				uChangeMomentFadeOutAndDemoFade();
			}
		}
	}
}

//===========================================================
// 自作関数：ルーラ移動とデモ再生タイミングと被ったときの処理
//-----------------------------------------------------------
// 第一引数：なし
// 戻り値  ：なし
//===========================================================
function uChangeMomentFadeOutAndDemoFade()
{
	local fade_speed = 15;
	// 白暗転
	SetFade_(FADE_OUT, FADE_COLOR_WHITE, FADE_SHORT);
	SetFadeSub_(FADE_OUT, FADE_COLOR_WHITE, FADE_SHORT);
	WaitFade_();
	// 黒暗転
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, fade_speed);
	SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, fade_speed);
	WaitFade_();
}

//======================================================
// 自作関数：完全クリア時のアロマのメッセージイベント
//------------------------------------------------------
// 第一引数：なし
// 戻り値  ：なし
//======================================================
function uAromaMsgEvent()
{
// 進行フラグを進める
	SetNumFlg_("NUM_SCENARIO_SUB_ALL_CLEAR", GetFlagID_("CONST_SS_ALL_GO_TO_CENTER_BILL_B2F"));

// 準備
	// 定数
	local ZOOM_FRAME = 5;
	// 主人公の位置
	local player = GetPlayerId_();
	// 今のカメラの座標
	local beforeEye = GetCameraEye_();
	local beforeTgt = GetCameraTarget_();
	// 一人称視点の座標
	local personEye = Vec3(0.00, 22.50, 235.50);
	local personTgt = Vec3(0.00, 22.50, 185.50);

// 演出開始
	// 暗転明け
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
	// カメラ高速ズーム
	SetLinearCameraEye_(personEye, ZOOM_FRAME);
	SetLinearCameraTarget_(personTgt, ZOOM_FRAME);
	// プレイヤーが映るので消す
	SetActive_(player, false);
	Wait_(ZOOM_FRAME);
	// リアクターレイアウト起動
	LoadLayout_("reactor_frame");
	SetLayoutAnime_("reactor_on", false);
	PlaySE_("SE_FLD_231");						// リアクター起動音
	WaitLayoutAnime();
	SetLayoutAnime_("reactor_loop", true);
	// メッセージ
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_REACTOR");
	ShowMsg_("ALL_CLEAR_REACTOR_MSG_001");
	KeyInputWait_();
	CloseMsgWnd_();
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("AROMA_MSG_002");
	KeyInputWait_();
	CloseMsgWnd_();
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_REACTOR");
	ShowMsg_("ALL_CLEAR_REACTOR_MSG_002");
	KeyInputWait_();
	CloseMsgWnd_();
	//リアクターSEを再生
	PlaySE_("SE_FLD_135");
	Wait_(30);
	// メッセージ
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_REACTOR");
	ShowMsg_("ALL_CLEAR_REACTOR_MSG_003");
	KeyInputWait_();
	CloseMsgWnd_();
	// リアクターレイアウト 終了
	SetLayoutAnime_("reactor_off", false);
	PlaySE_("SE_FLD_232");						// リアクター停止音
	WaitLayoutAnime();
	// プレイヤーを表示
	SetActive_(player, true);
	// カメラを元の位置まで移動
	SetLinearCameraEye_(beforeEye, ZOOM_FRAME);
	SetLinearCameraTarget_(beforeTgt, ZOOM_FRAME);
	Wait_(ZOOM_FRAME);
	SetPlayableCamera_();						// カメラを通常に戻す
}

//======================================================
// 自作関数：レイアウトアニメ待ち
//------------------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//======================================================
function WaitLayoutAnime()
{
	while(!IsLayoutAnimeEnd_()){
		Wait_(1);
	}
}

//===========================================================================
// ローカル関数：東エレベータの共通処理
//---------------------------------------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//===========================================================================
function uChoiceMoveEastEleveter()
{
	// 地下１階解禁フラグをチェック
	if(GetEventFlg_("BFG_UNLOCKED_EAST_ELEVETER_UNDER") == false){
		uEastEleveterUp();
	}
	else{
		uMoveUpDownEastEleveter();
	}
}

//===========================================================================
// ローカル関数：西エレベータの処理
//---------------------------------------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//===========================================================================
function uMoveUpWestEleveter()
{
	OpenMsgWnd_();
	ShowMsg_("MOVE_WEST_ELEVATOR");
	KeyInputWait_();
	if(GetQueryResult_() == QUERY_YES){
		CloseMsgWnd_();
		// エレベータを使用したタイミングでデモを流すタイミングと被った場合フェードの種類を切り替える為のフラグ
		SetEventFlg_("BFG_CHECK_USED_ELEVATER_FADE_OFF", true);
		// エレベータで移動SE
		PlaySE_("SE_FLD_061");
		// ２９階に移動
		ChangeMapPosDir_("A03_00", Vec3(A03_00_RTN_POS_W_X, A03_00_RTN_POS_W_Y, A03_00_RTN_POS_W_Z), RTN_DIR_W);
	}
	else{
		CloseMsgWnd_();
		// 地雷を再設置
		SetPointBoxEventMine_("Mine_Door_03", true);
	}
}

//===========================================================================
// ローカル関数：東エレベータの移動処理
//---------------------------------------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//===========================================================================
function uEastEleveterUp()
{
	OpenMsgWnd_();
	ShowMsg_("MOVE_EAST_ELEVATOR");
	KeyInputWait_();
	switch(GetQueryResult_()){
	// ３０階
	case QUERY3_0:
		CloseMsgWnd_();
		// エレベータを使用したタイミングでデモを流すタイミングと被った場合フェードの種類を切り替える為のフラグ
		SetEventFlg_("BFG_CHECK_USED_ELEVATER_FADE_OFF", true);
		// エレベータで移動SE
		PlaySE_("SE_FLD_061");
		// ３０階に移動
		ChangeMapPosDir_("A03_01", Vec3(A03_01_RTN_POS_E_X, A03_01_RTN_POS_E_Y, A03_01_RTN_POS_E_Z), RTN_DIR_E);
		break;
	// ２９階
	case QUERY3_1:
		CloseMsgWnd_();
		// エレベータを使用したタイミングでデモを流すタイミングと被った場合フェードの種類を切り替える為のフラグ
		SetEventFlg_("BFG_CHECK_USED_ELEVATER_FADE_OFF", true);
		// エレベータで移動SE
		PlaySE_("SE_FLD_061");
		// ２９階に移動
		ChangeMapPosDir_("A03_00", Vec3(A03_00_RTN_POS_E_X, A03_00_RTN_POS_E_Y, A03_00_RTN_POS_E_Z), RTN_DIR_E);
		break;
	// やめる
	case QUERY3_2:
		CloseMsgWnd_();
		// 地雷を再設置
		SetPointBoxEventMine_("Mine_Door_02", true);
		break;
	}
}

//===========================================================================
// ローカル関数：東エレベータの地下階解放後の移動処理
//---------------------------------------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//===========================================================================
function uMoveUpDownEastEleveter()
{
	// カーソルの位置を１階にする( 2次DB #6698 )
	SetQueryDefault_(QUERY_2);
	
	OpenMsgWnd_();
	ShowMsg_("CHOICE_MOVE_UP_OR_DOWN_1");
	KeyInputWait_();
	switch(GetQueryResult_()){
	// ３０階
	case QUERY_0:
		CloseMsgWnd_();
		// エレベータを使用したタイミングでデモを流すタイミングと被った場合フェードの種類を切り替える為のフラグ
		SetEventFlg_("BFG_CHECK_USED_ELEVATER_FADE_OFF", true);
		// エレベータで移動SE
		PlaySE_("SE_FLD_061");
		// ３０階に移動
		ChangeMapPosDir_("A03_01", Vec3(A03_01_RTN_POS_E_X, A03_01_RTN_POS_E_Y, A03_01_RTN_POS_E_Z), RTN_DIR_E);
		break;
	// ２９階
	case QUERY_1:
		CloseMsgWnd_();
		// エレベータを使用したタイミングでデモを流すタイミングと被った場合フェードの種類を切り替える為のフラグ
		SetEventFlg_("BFG_CHECK_USED_ELEVATER_FADE_OFF", true);
		// エレベータで移動SE
		PlaySE_("SE_FLD_061");
		// ２９階に移動
		ChangeMapPosDir_("A03_00", Vec3(A03_00_RTN_POS_E_X, A03_00_RTN_POS_E_Y, A03_00_RTN_POS_E_Z), RTN_DIR_E);
		break;
	// 地下１階
	case QUERY_2:
		CloseMsgWnd_();
		// エレベータを使用したタイミングでデモを流すタイミングと被った場合フェードの種類を切り替える為のフラグ
		SetEventFlg_("BFG_CHECK_USED_ELEVATER_FADE_OFF", true);
		// エレベータで移動SE
		PlaySE_("SE_FLD_061");
		// 地下１階に移動
		ChangeMapPosDir_("A01_01", Vec3(A01_01_RTN_POS_E_X, A01_01_RTN_POS_E_Y, A01_01_RTN_POS_E_Z), RTN_DIR_E);
		break;
	// やめる
	case QUERY_3:
		CloseMsgWnd_();
		// 地雷を再設置
		SetPointBoxEventMine_("Mine_Door_02", true);
		break;
	}
}

//===========================================================================
// ローカル関数：宿屋のメッセージ処理
//---------------------------------------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//===========================================================================
function uInnMessage()
{
	// 暗転明けの主人公の復帰位置と向きを設定する
	local re_pos = Vec3(32.6, 0.0, 122.888);	// 復帰位置を指定
	local re_dir = 85;							// 向きを指定
	// メッセージキーの初期化
	local message_key_1 = 0;	// メッセージキー(選択肢を表示するメッセージ)
	local message_key_2 = 0;	// メッセージキー(やめる場合のメッセージ)
	local message_key_3 = 0;	// メッセージキー(利用した場合のメッセージ)
	// 崩落都市のクリアフラグ
	local clear_flag	= GetEventFlg_("BFG_SCENARIO_CLEAR_CITY");

	if(clear_flag == true){
		if(GetEventFlg_("BFG_CHECK_INN_FIRST_MSG_ALL") == false){
			// 崩落都市クリア後の宿屋で表示するメッセージを指定(初回)
			message_key_1 = "INN_NOC_MSG_2ND_004";
			message_key_2 = "INN_NOC_MSG_2ND_005";
			message_key_3 = "INN_NOC_MSG_2ND_006";
		}
		else{
			// 崩落都市クリア後の宿屋で表示するメッセージを指定(２回目以降)
			message_key_1 = "INN_NOC_MSG_2ND_001";
			message_key_2 = "INN_NOC_MSG_2ND_002";
			message_key_3 = "INN_NOC_MSG_2ND_003";
		}
		SetEventFlg_("BFG_CHECK_INN_FIRST_MSG_ALL", true);
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
			CommTaskInn(re_pos, re_dir, clear_flag, g_inn);
			// メッセージの表示「おはよーだっちょ…
			OpenMsgWnd_();
			ShowMsg_(message_key_3);
			KeyInputWait_();
			CloseMsgWnd_();
			break;
		case QUERY3_2:
		// やめる処理
			// メッセージの表示「わかったっちょ…
			ShowMsg_(message_key_2);
			KeyInputWait_();
			CloseMsgWnd_();
			break;
		}
	}
	else{
		// 崩落都市クリア前の宿屋で表示するメッセージを指定
		message_key_1 = "INN_NOC_MSG_1ST_001";
		message_key_2 = "INN_NOC_MSG_1ST_002";
		message_key_3 = "INN_NOC_MSG_1ST_003";

		// メッセージの表示「やぁ いらっしゃい…
		OpenMsgWnd_();
		ShowMsg_(message_key_1);
		KeyInputWait_();

		switch(GetQueryResult_()){
		case QUERY2_0:
		// 泊まる処理
			CloseMsgWnd_();
			// 宿屋の共通の回復処理
			CommTaskInn(re_pos, re_dir, clear_flag, g_inn);
			// メッセージの表示「おはよーだっちょ…
			OpenMsgWnd_();
			ShowMsg_(message_key_3);
			KeyInputWait_();
			CloseMsgWnd_();
			break;
		case QUERY2_1:
		// やめる処理
			// メッセージの表示「わかったっちょ…
			ShowMsg_(message_key_2);
			KeyInputWait_();
			CloseMsgWnd_();
			break;
		}
	}
}

//============================================================================
// ローカル関数：配合装置など移行した際にNPCの向きがおかしくなるのを修正する関数
//----------------------------------------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//============================================================================
function uWaitShopFade()
{
	// 話しかけたらすぐにフェードが始まるようにする
	local fade_spd = 15;
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, fade_spd);
	SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, fade_spd);
	WaitFade_();
}

//============================================================================
// ローカル関数：レース機能移行処理
//----------------------------------------------------------------------------
// 引数    ：レースチュートリアルを再生したか？
// 戻り値  ：なし
//============================================================================
function uRaceMsg(flg)
{
	local msg_01;
	local msg_02;
	local msg_03;
	// 初回チェック
	if(flg == false){
		msg_01 = "MSG_GRAVE_AFTER_HUNTER_01_01";
		msg_02 = "MSG_GRAVE_AFTER_HUNTER_01_02";
		msg_03 = "MSG_GRAVE_AFTER_HUNTER_01_03";
	}
	else{
		local main_num = GetNumFlg_("NUM_SCENARIO_MAIN");
		local sky_num = GetNumFlg_("NUM_SCENARIO_SUB_SKY");
		// 完全クリア後
		if(main_num == GetFlagID_("CONST_SM_ALL_CLEAR")){
			msg_01 = "MSG_INSIDE_CLEAR_HUNTER";
			msg_02 = "MSG_INSIDE_CLEAR_HUNTER_YES";
			msg_03 = "MSG_INSIDE_CLEAR_HUNTER_NO";
		}
		// 裏シナリオ
		else if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){
			msg_01 = "MSG_INSIDE_CLEAR_HUNTER";
			msg_02 = "MSG_INSIDE_CLEAR_HUNTER_YES";
			msg_03 = "MSG_INSIDE_CLEAR_HUNTER_NO";
		}
		// 高空シナリオ以降
		else if(main_num == GetFlagID_("CONST_SM_SKY")){
			// 会話内容を変更(巨大ボーショック戦勝利以降)
			if(sky_num >= GetFlagID_("CONST_SS_SK_GO_GRAVE_SKY")){
				// １回だけ表示( 2次DB #5941 )
				if(GetEventFlg_("BFG_FIRST_TALK_RACE_PHASE_2") == false){
					SetEventFlg_("BFG_FIRST_TALK_RACE_PHASE_2", true);
					msg_01 = "MSG_WIN_G_BOWSHOCK_AFTER_HUNTER";
					msg_02 = "MSG_WIN_G_BOWSHOCK_AFTER_HUNTER_YES";
					msg_03 = "MSG_WIN_G_BOWSHOCK_AFTER_HUNTER_NO";
				}
				else{
					msg_01 = "MSG_GRAVE_AFTER_HUNTER_02_01";
					msg_02 = "MSG_GRAVE_AFTER_HUNTER_02_02";
					msg_03 = "MSG_GRAVE_AFTER_HUNTER_02_03";
				}
			}
			// 会話内容を変更(ガルビルス戦勝利後～巨大ボーショック戦まで)
			else if(sky_num <= GetFlagID_("CONST_SS_SK_JDG_REMATCH_G_BOWSHOCK")){
				// １回だけ表示( 2次DB #5941 )
				if(GetEventFlg_("BFG_FIRST_TALK_RACE_PHASE_1") == false){
					SetEventFlg_("BFG_FIRST_TALK_RACE_PHASE_1", true);
					msg_01 = "MSG_WIN_GARUBIRUSU_AFTER_HUNTER";
					msg_02 = "MSG_WIN_GARUBIRUSU_AFTER_HUNTER_YES";
					msg_03 = "MSG_WIN_GARUBIRUSU_AFTER_HUNTER_NO";
				}
				else{
					msg_01 = "MSG_GRAVE_AFTER_HUNTER_02_01";
					msg_02 = "MSG_GRAVE_AFTER_HUNTER_02_02";
					msg_03 = "MSG_GRAVE_AFTER_HUNTER_02_03";
				}
			}
		}
		// 霊道クリア～コアクリアまで
		else{
			msg_01 = "MSG_GRAVE_AFTER_HUNTER_02_01";
			msg_02 = "MSG_GRAVE_AFTER_HUNTER_02_02";
			msg_03 = "MSG_GRAVE_AFTER_HUNTER_02_03";
		}
	}
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_CHOMACH");
	ShowMsg_(msg_01);
	KeyInputWait_();
	if(GetQueryResult_() == MES_QUERY_YES){
		SetEventFlg_("BFG_PLAYED_RACE_TUTORIAL", true);
		// 初回チェック
		if(flg == false){
			ShowMsg_(msg_02);
			KeyInputWait_();
			
			// フェードアウト
			FieldBgmStop_(FADE_MAPCHANGE);
			SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_MAPCHANGE);
			SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_MAPCHANGE);
			WaitFade_();
			
			CloseMsgWnd_();
			
			// メニュー画面に移行する直前で立てる
			SetEventFlg_("BFG_RACE_SHOP_RETURN_MESSAGE", true);
			// チュートリアルレースへ
			ChangeRaceTutorial_();
		}
		else{
			uWaitShopFade();
			CloseMsgWnd_();
			// メニュー画面に移行する直前で立てる
			SetEventFlg_("BFG_RACE_SHOP_RETURN_MESSAGE", true);
			// 通常レースへ
			GotoMenuScene_(MENU_SCENE.RACE_FACILITY);
		}
	}
	else{
		ShowMsg_(msg_03);
		KeyInputWait_();
		// 初回チェック
		if(flg == false){
			uWaitShopFade();
			CloseMsgWnd_();
			SetEventFlg_("BFG_PLAYED_RACE_TUTORIAL", true);
			// メニュー画面に移行する直前で立てる
			SetEventFlg_("BFG_RACE_SHOP_RETURN_MESSAGE", true);
			// 通常レースへ移行
			GotoMenuScene_(MENU_SCENE.RACE_FACILITY);
		}
		else{
			CloseMsgWnd_();
			// レースへ移行しないので何もしない
		}
	}
}

//============================================================================
// ローカル関数：ランクＢのレースが解禁できるかチェック
//----------------------------------------------------------------------------
// 引数    ：なし
// 戻り値  ：解禁できるか( true:できる / false:できない )
//============================================================================
function uCheckReleaseRaceB()
{
	// 水中ライドライセンス取得後
	if(GetEventFlg_("BFG_RIDE_LICENSE_DIVE") == true){
		if(GetEventFlg_("BFG_LOOK_RACE_MSG_B") == false){
			SetEventFlg_("BFG_LOOK_RACE_MSG_B", true);
			return true;
		}
	}
	return false;
}

//============================================================================
// ローカル関数：ランクＡのレースが解禁できるかチェック
//----------------------------------------------------------------------------
// 引数    ：なし
// 戻り値  ：解禁できるか( true:できる / false:できない )
//============================================================================
function uCheckReleaseRaceA()
{
	// 低空ライドライセンス取得後
	if(GetEventFlg_("BFG_RIDE_LICENSE_MULTIJUMP") == true){
		if(GetEventFlg_("BFG_LOOK_RACE_MSG_A") == false){
			SetEventFlg_("BFG_LOOK_RACE_MSG_A", true);
			return true;
		}
	}
	return false;
}

//============================================================================
// ローカル関数：ランクＳのレースが解禁できるかチェック
//----------------------------------------------------------------------------
// 引数    ：なし
// 戻り値  ：解禁できるか( true:できる / false:できない )
//============================================================================
function uCheckReleaseRaceS()
{
	// 高空ライドライセンス取得後
	if(GetEventFlg_("BFG_RIDE_LICENSE_FLIGHT") == true){
		if(GetEventFlg_("BFG_LOOK_RACE_MSG_S") == false){
			SetEventFlg_("BFG_LOOK_RACE_MSG_S", true);
			return true;
		}
	}
	return false;
}

//============================================================================
// ローカル関数：ランクＳＳのレースが解禁できるかチェック
//----------------------------------------------------------------------------
// 引数    ：なし
// 戻り値  ：解禁できるか( true:できる / false:できない )
//============================================================================
function uCheckReleaseRaceSS()
{
	// ゲームクリア後
	if(GetEventFlg_("BFG_SCENARIO_CLEAR_EXTRA") == true){
		if(GetEventFlg_("BFG_LOOK_RACE_MSG_SS") == false){
			SetEventFlg_("BFG_LOOK_RACE_MSG_SS", true);
			return true;
		}
	}
	return false;
}

//============================================================================
// ローカル関数：レース解禁メッセージ表示 or 通常メッセージ＋レース移行の切替え判定
//----------------------------------------------------------------------------
// 引数    ：flg_b  → Ｂランク解禁フラグ
// 引数    ：flg_a  → Ａランク解禁フラグ
// 引数    ：flg_s  → Ｓランク解禁フラグ
// 引数    ：flg_ss → ＳＳランク解禁フラグ
// 戻り値  ：true : レース解禁メッセージ表示 / false : 通常メッセージ＋レース移行
//============================================================================
function uCheckBranch(flg_b, flg_a, flg_s, flg_ss)
{
	if(flg_b == true){
		return true;
	}
	else{
		if(flg_a == true){
			return true;
		}
		else{
			if(flg_s == true){
				return true;
			}
			else{
				if(flg_ss == true){
					return true;
				}
				else{
					return false;
				}
			}
		}
	}
}

//============================================================================
// ローカル関数：レース解禁メッセージ＋レース移行処理
//----------------------------------------------------------------------------
// 引数    ：flg_b  → Ｂランク解禁フラグ
// 引数    ：flg_a  → Ａランク解禁フラグ
// 引数    ：flg_s  → Ｓランク解禁フラグ
// 引数    ：flg_ss → ＳＳランク解禁フラグ
// 戻り値  ：なし
//============================================================================
function uNewRaceReleaseMsg(flg_b, flg_a, flg_s, flg_ss)
{
	uRaceMsg(GetEventFlg_("BFG_PLAYED_RACE_TUTORIAL"));
}

//============================================================================
// 配合用関数：配合サブイベントチェック
//----------------------------------------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//============================================================================
function uCoupling_CheckEvent()
{
	DebugPrint("[uCoupling_CheckEvent]");
	
	// 擬似デモ[地下室への誘い]再生チェック
	uCoupling_CheckFakeDemo();
	if (g_coupling_event_flg) { return; }
	
	// 配合機能解禁チェック
	uCoupling_CheckRelease();
	if (g_coupling_event_flg) { return; }
	
	// 凶モンスター作成チェック
	uCoupling_CheckBreakMonster();
	if (g_coupling_event_flg) { return; }
	
	// 凶エスターク作成チェック
	uCoupling_CheckBreakEstark();
	if (g_coupling_event_flg) { return; }
}

//============================================================================
// 配合用関数：擬似デモ[地下室への誘い]再生チェック
//----------------------------------------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//============================================================================
function uCoupling_CheckFakeDemo()
{
	DebugPrint("[uCoupling_CheckFakeDemo]");
	
	// demo132[チョーマッハとの再会]が再生された
	if (GetEventFlg_("BFG_PLAYED_DEMO_MEETING_AGEIN")) {			// Bit1149
		// 擬似デモ[地下室への誘い]が再生されていない
		if(!GetEventFlg_("BFG_PLAYED_CENTER_BILL_BASEMENT")) {		// Bit1148
			g_coupling_event_flg = true;
			
			SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
			SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
			WaitFade_();
			SetEventFlg_("BFG_RIDE_OFF_BEFORE_BASEMENT_DEMO", true);
			ChangeMapPosDir_("A01_00", Vec3(-14.857, 22.5, -218.525), -145);
		}
	}
}

//============================================================================
// 配合用関数：配合機能解禁チェック
//----------------------------------------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//============================================================================
function uCoupling_CheckRelease()
{
	DebugPrint("[uCoupling_CheckRelease]");
	
	// 配合回数判定
	local count = GetCouplingCount_();
	DebugPrint("配合回数は " + count + " になりました。");
	
	// 配合画面呼び出し前セリフ
	local link_msg_coupling		 = "";
	// 配合しないセリフ
	local link_msg_not			 = "";
	// ペイント配合への繋ぎセリフ
	local link_msg_paint		 = "MSG_ACE_850";		// 「おっ！　よく来たな　<name_player/>！
	// 超生配合への繋ぎセリフ
	local link_msg_ultra		 = "MSG_ACE_950";		// 「よう！　久しぶりだな　<name_player/>！
	
	//-------------------
	// ■らくらく検索配合
	//-------------------
	// 配合回数が10回以上
	if(count >= UNLOCK_TIME_10){
		if(!GetEventFlg_("BFG_COUPLING_UNLOCK_SEARCHT")){		// Bit15
			// セリフ設定
			link_msg_coupling	 = "MSG_ACE_720";		// 「そうか　わかった。それじゃあ
			link_msg_paint		 = "MSG_ACE_730";		// 「どうした　<name_player/>？
			link_msg_ultra		 = "MSG_ACE_740";		// 「……じつは　さらに
			
			// らくらく検索配合解禁
			g_coupling_flg = true;			// ペイント・超生を解禁しない場合、必ず配合する
			g_coupling_event_flg = true;
			uCoupling_ReleaseEasySerch();
		}
	}
	
	//---------------
	// ■ペイント配合
	//---------------
	// カラーフォンデュのペイント配合解禁イベントを見た
	if(GetEventFlg_("BFG_COUPLING_UNLOCK_PAINT")){				// Bit16
		// ペイント配合の解禁会話を見ていない
		if(!GetEventFlg_("BFG_COLOREVENT_ACE_FIRST_TALK")) {	// Bit1180
			// セリフ設定
			link_msg_coupling	 = "MSG_ACE_855";		// 「カンペキだぜ！
			link_msg_not		 = "MSG_ACE_856";		// 「そうか。じゃあ　また来るんだぜ！
			link_msg_ultra		 = "MSG_ACE_857";		// 「カンペキだぜ！　……じつは
			
			// らくらく解禁の後でない
			if (!g_coupling_event_flg) {
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_ACE");
			}
			
			// ペイント配合への繋ぎメッセージ
			ShowMsg_(link_msg_paint);
			KeyInputWait_();
			
			// ペイント配合解禁
			g_coupling_flg = false;
			g_coupling_event_flg = true;
			uCoupling_ReleasePaint();
		}
	}
	
	//-----------
	// ■超生配合
	//-----------
	// 超生配合が解禁している
	if(GetEventFlg_("BFG_CHOUSEI_HAIGOU_UNLOCK")){				// Bit25
		// 超生配合の解禁会話を見ていない
		if(!GetEventFlg_("BFG_DISPLAYED_CHOUSEI_UNLOCK_MSG")){	// Bit1393
			// セリフ設定
			link_msg_coupling	 = "MSG_ACE_952";		// 「それじゃ　早速　配合をやっていくか？
			link_msg_not		 = "MSG_ACE_953";		// 「強くなるには　どんどん配合だぜ！
			
			// らくらく・ペイント解禁の後でない
			if (!g_coupling_event_flg) {
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_ACE");
			}
			
			// 超生配合への繋ぎメッセージ
			ShowMsg_(link_msg_ultra);
			KeyInputWait_();
			
			// 超生配合解禁
			g_coupling_flg = false;
			g_coupling_event_flg = true;
			uCoupling_ReleaseUltra();
		}
	}
	
	// 解禁するイベントがない場合 → 抜ける
	if (!g_coupling_event_flg) { return; }
	
	// 配合画面への繋ぎメッセージ
	ShowMsg_(link_msg_coupling);
	KeyInputWait_();
	
	// 「はい」の場合
	if(GetQueryResult_() == MES_QUERY_YES){
		// 配合する
		g_coupling_flg = true;
	}
	// 「いいえ」の場合
	else {
		if (link_msg_not != "") {
			ShowMsg_(link_msg_not);
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
}

//==========================================================================
// 配合用関数：らくらく検索配合解禁イベント関数
//--------------------------------------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//==========================================================================
function uCoupling_ReleaseEasySerch()
{
	DebugPrint("[uCoupling_ReleaseEasySerch]");
	
	SetEventFlg_("BFG_COUPLING_UNLOCK_SEARCHT", true);			// Bit15 : らくらく検索配合解禁
	
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("MSG_ACE_701");			// 「<name_player/>！　何やら　新しい配合が
	KeyInputWait_();
	
	// 「いいえ」を選ぶと抜ける
	while(GetQueryResult_() == MES_QUERY_YES){
		ShowMsg_("MSG_ACE_710");		// 「らくらく検索配合とは　その名の通り
		KeyInputWait_();
	}
}

//==========================================================================
// 配合用関数：ペイント配合解禁イベント関数
//--------------------------------------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//==========================================================================
function uCoupling_ReleasePaint()
{
	DebugPrint("[uCoupling_ReleasePaint]");
	
	SetEventFlg_("BFG_COLOREVENT_ACE_FIRST_TALK", true);		// Bit1180 : ペイント配合 解禁会話フラグ
	
	ShowMsg_("MSG_ACE_851");		// 「……魔物の色を変えられる　ペイント配合だと？
	KeyInputWait_();
	ShowMsg_("MSG_ACE_852");		// 「よし　オメーのリアクター　貸してみな！
	KeyInputWait_();
	CloseMsgWnd_();
	
	//-----
	SetFadePlane_(FADE_PLANE.PLANE_3D);
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
	
	PlaySE_("SE_DEM_012");			// ■SE：エースのリアクター改造音
	Wait_(100);
	
	OpenMsgWnd_();
	ShowMsg_("MSG_ACE_853");		// エースは　リアクターのデータを使って
	KeyInputWait_();
	ShowMsg_("MSG_ACE_854");		// 配合装置で　ペイント配合が
	PlayMe_("ME_010");
	WaitMe_();
	KeyInputWait_();
	CloseMsgWnd_();
	
	SetFadePlane_(FADE_PLANE.PLANE_NORMAL);
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
	//-----
	
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
}

//============================================================================
// 配合用関数：超生配合解禁イベント
//----------------------------------------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//============================================================================
function uCoupling_ReleaseUltra()
{
	DebugPrint("[uCoupling_ReleaseUltra]");
	
	SetEventFlg_("BFG_DISPLAYED_CHOUSEI_UNLOCK_MSG", true);		// Bit1393 : 超生配合 解禁会話フラグ
	
	ShowMsg_("MSG_ACE_951");	// 「配合装置に　新しい機能を　追加したんだ。
	KeyInputWait_();
}

//============================================================================
// 配合用関数：どのブレイクモンスターを作成するか判定
//----------------------------------------------------------------------------
// 引数    ：なし
// 戻り値  ： 作成するモンスター
//============================================================================
function uCoupling_JudgeMakeBreakMonster()
{
	DebugPrint("[uCoupling_JudgeMakeBreakMonster]");
	
	// 凶スライム
	local s_body_num = GetItemNum_(BREAK_BODY_ITEM_ID_01);
	local s_mind_num = GetItemNum_(BREAK_MIND_ITEM_ID_01);
	// 凶キメラ
	local c_body_num = GetItemNum_(BREAK_BODY_ITEM_ID_02);
	local c_mind_num = GetItemNum_(BREAK_MIND_ITEM_ID_02);
	// 凶キングリザード
	local k_body_num = GetItemNum_(BREAK_BODY_ITEM_ID_04);
	local k_mind_num = GetItemNum_(BREAK_MIND_ITEM_ID_04);
	// 凶にじくじゃく
	local n_body_num = GetItemNum_(BREAK_BODY_ITEM_ID_05);
	local n_mind_num = GetItemNum_(BREAK_MIND_ITEM_ID_05);
	// 凶大王イカ
	local d_body_num = GetItemNum_(BREAK_BODY_ITEM_ID_03);
	local d_mind_num = GetItemNum_(BREAK_MIND_ITEM_ID_03);
	
	// 優先順位 (高) 凶スライム > 凶キメラ > 凶キングリザード > 凶にじくじゃく > 凶大王イカ (低)
	if(s_body_num >= 1 && s_mind_num >= 1){	return MAKE_BREAK_SLIME;	}
	if(c_body_num >= 1 && c_mind_num >= 1){	return MAKE_BREAK_CHIMERA;	}
	if(k_body_num >= 1 && k_mind_num >= 1){	return MAKE_BREAK_LIZARD;	}
	if(n_body_num >= 1 && n_mind_num >= 1){	return MAKE_BREAK_KUJAKU;	}
	if(d_body_num >= 1 && d_mind_num >= 1){	return MAKE_BREAK_SQUID;	}
	
	return MAKE_BREAK_NONE;
}

//============================================================================
// 配合用関数：凶モンスター作成チェック
//----------------------------------------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//============================================================================
function uCoupling_CheckBreakMonster()
{
	DebugPrint("[uCoupling_CheckBreakMonster]");
	
	local case_num = uCoupling_JudgeMakeBreakMonster();		// どの凶モンスターを作るか
	local exc_item_01;		// 必要アイテムその１
	local exc_item_02;		// 必要アイテムその２
	local monster_race;		// モンスター種族ID
	local enemy_id;			// 仲間にする際の敵ID
	
	// 黒鉄の監獄塔をクリアしていない → 抜ける
	if (!GetEventFlg_("BFG_SCENARIO_CLEAR_SAND")) { return; }
	
	// 作れる凶モンスターがいない場合 → 抜ける
	if (case_num == MAKE_BREAK_NONE) { return; }
	
	// 配合サブイベント発生フラグＯＮ
	g_coupling_event_flg = true;
	
	switch(case_num)
	{
	// 凶スライム
	case MAKE_BREAK_SLIME:
		exc_item_01 = BREAK_BODY_ITEM_ID_01;
		exc_item_02 = BREAK_MIND_ITEM_ID_01;
		break;
	// 凶キメラ
	case MAKE_BREAK_CHIMERA:
		exc_item_01 = BREAK_BODY_ITEM_ID_02;
		exc_item_02 = BREAK_MIND_ITEM_ID_02;
		break;
	// 凶キングリザード
	case MAKE_BREAK_LIZARD:
		exc_item_01 = BREAK_BODY_ITEM_ID_04;
		exc_item_02 = BREAK_MIND_ITEM_ID_04;
		break;
	// 凶にじくじゃく
	case MAKE_BREAK_KUJAKU:
		exc_item_01 = BREAK_BODY_ITEM_ID_05;
		exc_item_02 = BREAK_MIND_ITEM_ID_05;
		break;
	//  凶大王イカ
	case MAKE_BREAK_SQUID:
		exc_item_01 = BREAK_BODY_ITEM_ID_03;
		exc_item_02 = BREAK_MIND_ITEM_ID_03;
		break;
	default:
		DebugPrint("WARNING : 作成できるモンスターがいません。  (" + case_num + ") [uCoupling_CheckBreakMonster] ");
		break;
	}
	
	SetExchangeItemName_(exc_item_01);
	SetExchangeItemName_(exc_item_02);
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("ACE_MAKE_BREAK_MONSTER_MSG_001");
	KeyInputWait_();
	
	if(GetQueryResult_() == MES_QUERY_YES){
		// 預り所の空き枠チェック
		local residue = GetFreeMonsterNum_();
		if(residue <= 0){
			// 空き枠を作るように促すメッセージを表示して終了
			ShowMsg_("NOT_EMPTY_MSG_001");
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else{
			CloseMsgWnd_();
			SetMotion_(g_ace, "WAIT", BLEND_M);
			//  1.case_numで減算するアイテムをチェックして減算＋メッセージの置き換え
			switch(case_num)
			{
			// 凶スライム
			case MAKE_BREAK_SLIME:
				monster_race = BREAK_MONSTER_01_ID;
				enemy_id     = BREAK_MONSTER_01_E_ID;
				// 2.アイテムの減算
				AddItem_(BREAK_BODY_ITEM_ID_01, -1);
				AddItem_(BREAK_MIND_ITEM_ID_01, -1);
				break;
			// 凶キメラ
			case MAKE_BREAK_CHIMERA:
				monster_race = BREAK_MONSTER_02_ID;
				enemy_id     = BREAK_MONSTER_02_E_ID;
				// 2.アイテムの減算
				AddItem_(BREAK_BODY_ITEM_ID_02, -1);
				AddItem_(BREAK_MIND_ITEM_ID_02, -1);
				break;
			// 凶キングリザード
			case MAKE_BREAK_LIZARD:
				monster_race = BREAK_MONSTER_04_ID;
				enemy_id     = BREAK_MONSTER_04_E_ID;
				// 2.アイテムの減算
				AddItem_(BREAK_BODY_ITEM_ID_04, -1);
				AddItem_(BREAK_MIND_ITEM_ID_04, -1);
				break;
			// 凶にじくじゃく
			case MAKE_BREAK_KUJAKU:
				monster_race = BREAK_MONSTER_05_ID;
				enemy_id     = BREAK_MONSTER_05_E_ID;
				// 2.アイテムの減算
				AddItem_(BREAK_BODY_ITEM_ID_05, -1);
				AddItem_(BREAK_MIND_ITEM_ID_05, -1);
				break;
			//  凶大王イカ
			case MAKE_BREAK_SQUID:
				monster_race = BREAK_MONSTER_03_ID;
				enemy_id     = BREAK_MONSTER_03_E_ID;
				// 2.アイテムの減算
				AddItem_(BREAK_BODY_ITEM_ID_03, -1);
				AddItem_(BREAK_MIND_ITEM_ID_03, -1);
				break;
			default:
				DebugPrint(" ");
				DebugPrint("アイテムの置き換えが出来ない。 凶モンスター作成フロー");
				break;
			}
			//  3.システムメッセージ(置き換えあり)
			SetExchangeItemName_(exc_item_01);
			SetExchangeItemName_(exc_item_02);
			OpenMsgWnd_();
			ShowMsg_("ACE_MAKE_BREAK_MONSTER_MSG_002");
			KeyInputWait_();
			CloseMsgWnd_();
			//  4.エースのメッセージ
			SetMotion_(g_ace, "TALKLOOP", BLEND_M);
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_ACE");
			ShowMsg_("ACE_MAKE_BREAK_MONSTER_MSG_003");
			KeyInputWait_();
			CloseMsgWnd_();
			SetMotion_(g_ace, "WAIT", BLEND_M);
			//  5.暗転(ただし、メッセージウィンドウ表示できる暗転にする)
			SetFadePlane_(FADE_PLANE.PLANE_3D);
			SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
			SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
			WaitFade_();
			// システムメッセージ(置き換えあり)
			SetExchangeItemName_(exc_item_01);
			SetExchangeItemName_(exc_item_02);
			OpenMsgWnd_();
			ShowMsg_("ACE_MAKE_BREAK_MONSTER_MSG_004");
			KeyInputWait_();
			CloseMsgWnd_();
			//  6.配合装置のSE再生と再生終了待ち
			PlaySE_("SE_SYS_021");
			Wait_(115);
			//  7.暗転明け
			SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
			SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
			WaitFade_();
			SetFadePlane_(FADE_PLANE.PLANE_NORMAL);
			//  8.エースのメッセージ
			SetMotion_(g_ace, "TALKLOOP", BLEND_M);
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_ACE");
			ShowMsg_("ACE_MAKE_BREAK_MONSTER_MSG_005");
			KeyInputWait_();
			CloseMsgWnd_();
			SetMotion_(g_ace, "WAIT", BLEND_M);
			//  9.システムメッセージ(種族名の置き換えあり)
			OpenMsgWnd_();
			SetExchangeItemName_(exc_item_01);
			SetExchangeItemName_(exc_item_02);
			SetExchangeMonsterKindName_(monster_race);
			ShowMsg_("ACE_MAKE_BREAK_MONSTER_MSG_006_1");
			KeyInputWait_();
			SetExchangeMonsterKindName_(monster_race);
			ShowMsg_("ACE_MAKE_BREAK_MONSTER_MSG_006_2");
			// 仲間ME(重要アイテム取得と同じRedmine#2831)
			PlayMe_("ME_010");
			WaitMe_();
			KeyInputWait_();
			CloseMsgWnd_();
			Wait_(15);
			// 10.仲間加入画面
			local task_fellow;
			task_fellow = Task_AddFellow_(enemy_id, false);
			WaitTask(task_fellow);
			SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, FADE_SHORT);
			// 11.エースのメッセージ
			Wait_(15);
			SetMotion_(g_ace, "TALKLOOP", BLEND_M);
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_ACE");
			ShowMsg_("ACE_MAKE_BREAK_MONSTER_MSG_007");
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else{
		ShowMsg_("ACE_MAKE_BREAK_MONSTER_MSG_001_NO");
		KeyInputWait_();
		if(GetQueryResult_() == MES_QUERY_YES){
			// 配合する
			g_coupling_flg = true;
		}
		else{
			ShowMsg_("ACE_MAKE_BREAK_MONSTER_MSG_001_NO_NO");
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
}

//============================================================================
// 配合用関数：凶エスターク作成チェック
//----------------------------------------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//============================================================================
function uCoupling_CheckBreakEstark()
{
	DebugPrint("[uCoupling_CheckBreakEstark]");
	
	// 「地獄の遺伝子」１～５を所持していない → 抜ける
	if (!CommCheckBreakEstarkMaking()) { return; }
	
	// 配合サブイベント発生フラグＯＮ
	g_coupling_event_flg = true;
	
	// 初回
	if(GetEventFlg_("BFG_DISPLAYED_BREAK_ESTARK_MSG") == false){
		// メッセージ処理
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_ACE");
		ShowMsg_("ACE_MAKE_BREAK_ESTARK_MSG_001");
		KeyInputWait_();
		if(GetQueryResult_() == MES_QUERY_YES){
			CloseMsgWnd_();
			SetMotion_(g_ace, "WAIT", BLEND_M);
			// 初回メッセージ開始
			SetEventFlg_("BFG_DISPLAYED_BREAK_ESTARK_MSG", true);
			// システムメッセージ
			OpenMsgWnd_();
			SetExchangeItemName_(BREAK_ESTARK_01_ID);
			SetExchangeItemName_(BREAK_ESTARK_02_ID);
			SetExchangeItemName_(BREAK_ESTARK_03_ID);
			ShowMsg_("ACE_MAKE_BREAK_ESTARK_MSG_002_01");
			KeyInputWait_();
			SetExchangeItemName_(BREAK_ESTARK_04_ID);
			SetExchangeItemName_(BREAK_ESTARK_05_ID);
			ShowMsg_("ACE_MAKE_BREAK_ESTARK_MSG_002_02");
			KeyInputWait_();
			CloseMsgWnd_();
			// エースのメッセージ
			SetMotion_(g_ace, "TALKLOOP", BLEND_M);
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_ACE");
			ShowMsg_("ACE_MAKE_BREAK_ESTARK_MSG_003_01");
			KeyInputWait_();
			ShowMsg_("ACE_MAKE_BREAK_ESTARK_MSG_003_02");
			KeyInputWait_();
			if(GetQueryResult_() == MES_QUERY_YES){
				// 配合する
				g_coupling_flg = true;
			}
			else{
				ShowMsg_("ACE_MAKE_BREAK_ESTARK_MSG_003_NO");
				KeyInputWait_();
				CloseMsgWnd_();
			}
		}
		else{
			ShowMsg_("ACE_MAKE_BREAK_ESTARK_MSG_001_NO");
			KeyInputWait_();
			if(GetQueryResult_() == MES_QUERY_YES){
				// 配合する
				g_coupling_flg = true;
			}
			else{
				ShowMsg_("ACE_MAKE_BREAK_ESTARK_MSG_001_NO_NO");
				KeyInputWait_();
				CloseMsgWnd_();
			}
		}
	}
	// ２回目以降
	else{
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_ACE");
		ShowMsg_("ACE_MAKE_BREAK_ESTARK_MSG_004");
		KeyInputWait_();
		if(GetQueryResult_() == MES_QUERY_YES){
			// 配合する
			g_coupling_flg = true;
		}
		else{
			ShowMsg_("ACE_MAKE_BREAK_ESTARK_MSG_004_NO");
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
}

//============================================================================
// 配合用関数：シナリオメッセージ表示
//----------------------------------------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//============================================================================
function uCoupling_ScenarioMsg()
{
	DebugPrint("[uCoupling_ScenarioMsg]");
	
	local main_num = GetNumFlg_("NUM_SCENARIO_MAIN");			// Num0
	local city_num = GetNumFlg_("NUM_SCENARIO_SUB_CITY");		// Num3 : 崩落
	local grave_num = GetNumFlg_("NUM_SCENARIO_SUB_GRAVE");		// Num4 : 墓地
	local sky_num = GetNumFlg_("NUM_SCENARIO_SUB_SKY");			// Num9 : 高空
	local all_num = GetNumFlg_("NUM_SCENARIO_SUB_ALL_CLEAR");	// Num10: 完全クリア
	
	local q_msg  = "MSG_DEMO123_AFTER_ACE_000";		// 「よく来たな　<name_player/>。
	
	// 擬似デモ[地下室への誘い]再生後、demo133[地下室にて]を見ていない場合
	if(GetEventFlg_("BFG_PLAYED_CENTER_BILL_BASEMENT")							// Bit1148
	&& !GetEventFlg_("BFG_PLAYED_BASEMENT_DEMO")) {								// Bit1147
		q_msg  = "MSG_GRAVE_AFTER_ACE_INTRODUCTION";				// 「ナビマップの右にある　エレベーターから
	}
	
	else {
		// ▼崩落シナリオ
		if(main_num == GetFlagID_("CONST_SM_CITY")){							// Num0 = 2
			// demo123[配合装置の試運転]再生後
			if(city_num >= GetFlagID_("CONST_SS_CI_GO_NEXT_CONTINENT")){		// Num3 >= 29
				q_msg  = "MSG_DEMO123_AFTER_ACE_001";				// 「配合した魔物は　レベル1で生まれるからな。
			}
		}
		
		// ▼墓地シナリオ
		else if(main_num == GetFlagID_("CONST_SM_CEMETERY")){					// Num0 = 3
			// demo202[モンスターの幽霊Ａとの出会い]再生後
			if(grave_num <= GetFlagID_("CONST_SS_CC_FIND_THE_GHOST")){			// Num4 <= 2
				q_msg  = "MSG_DEMO123_AFTER_ACE_001";				// 「配合した魔物は　レベル1で生まれるからな。
			}
		}
		
		// ▼高空シナリオ
		else if(main_num == GetFlagID_("CONST_SM_SKY")){						// Num0 = 8
			// 巨大ボーショックを倒すまで
			if(sky_num <= GetFlagID_("CONST_SS_SK_JDG_REMATCH_G_BOWSHOCK")){	// Num9 <= 17
				if(GetEventFlg_("BFG_FIRST_TALK_COUPLING_PHASE_3") == false){	// Bit1442
					SetEventFlg_("BFG_FIRST_TALK_COUPLING_PHASE_3", true);
					q_msg  = "MSG_WIN_GARUBIRUSU_AFTER_ACE";		// 「あの黒いモヤモヤに　包まれてから
				}
			}
			// 巨大ボーショック勝利以降
			else {
				if(GetEventFlg_("BFG_FIRST_TALK_COUPLING_PHASE_4") == false){	// Bit1443
					SetEventFlg_("BFG_FIRST_TALK_COUPLING_PHASE_4", true);
					q_msg  = "MSG_WIN_G_BOWSHOCK_AFTER_ACE";		// 「なるほど……魔物が　原因だったのかだぜ。
				}
			}
		}
		
		// ▼裏シナリオ
		else if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){				// Num0 = 9
			if(GetEventFlg_("BFG_FIRST_TALK_COUPLING_PHASE_5") == false){		// Bit1444
				SetEventFlg_("BFG_FIRST_TALK_COUPLING_PHASE_5", true);
				q_msg  = "MSG_INSIDE_CLEAR_ACE";					// 「平和だからって　この配合装置を
			}
		}
		
		// ▼完全クリア
		else if(main_num == GetFlagID_("CONST_SM_ALL_CLEAR")){					// Num0 = 10
			// モンスターバトルＧＰ解禁前
			if(all_num == GetFlagID_("CONST_SS_ALL_GO_TO_CENTER_BILL_B2F")){	// Num11 = 1
				if(GetEventFlg_("BFG_FIRST_TALK_COUPLING_PHASE_5") == false){	// Bit1444
					SetEventFlg_("BFG_FIRST_TALK_COUPLING_PHASE_5", true);
					q_msg  = "MSG_INSIDE_CLEAR_ACE";				// 「平和だからって　この配合装置を
				}
			}
			// モンスターバトルＧＰ解禁後
			else{
				if(GetEventFlg_("BFG_FIRST_TALK_COUPLING_PHASE_6") == false){	// Bit1445
					SetEventFlg_("BFG_FIRST_TALK_COUPLING_PHASE_6", true);
					q_msg  = "MSG_MBGP_AFTER_ACE";					// 「オレも　モンスターバトルＧＰを　見るため
				}
			}
		}
	}
	
	// 配合メッセージ
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_(q_msg);
	KeyInputWait_();
	
	// 「はい」の場合
	if(GetQueryResult_() == MES_QUERY_YES){
		// 配合する
		g_coupling_flg = true;
	}
	// 「いいえ」の場合
	else{
		ShowMsg_("MSG_DEMO123_AFTER_ACE_NO");		// 「そうか。また　来るんだぜ！
		KeyInputWait_();
		CloseMsgWnd_();
	}
}

//==========================================================================
// 配合用関数：配合画面へ移行する
//--------------------------------------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//==========================================================================
function uCoupling_GotoMenu()
{
	DebugPrint("[uCoupling_GotoMenu]");
	
	uWaitShopFade();
	CloseMsgWnd_();
	
	SetEventFlg_("BFG_COUPLING_RETURN_MESSAGE", true);		// Bit2028 : 配合画面移行フラグ
	
	// 配合画面の呼び出し
	GotoMenuScene_(MENU_SCENE.COUPLING);
}

//============================================================================
// 配合用関数：擬似デモ[地下室への誘い]
//----------------------------------------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//============================================================================
function uUsedBasementDemo()
{
	// 追加するアイテム(ディスクマネージャー)
	local item_id = 69;
	local item_num = 1;
	// 主人公の位置
	local player_pos = Vec3(-14.857, 22.5, -218.525);
	local player_dir = -145;
	// プレイヤーID
	local player = GetPlayerId_();
	// カメラの角度
	local cam_dir = -100;
	// 非常駐モーション読込(主人公うなずき)
	local nod = ReadMotion_(player, "Player_nod");
	
	// 擬似デモ[地下室への誘い]が再生されたのでフラグを立てる
	SetEventFlg_("BFG_PLAYED_CENTER_BILL_BASEMENT", true);
	SetEventFlg_("BFG_UNLOCKED_EAST_ELEVETER_UNDER", true);
	SetEventFlg_("BFG_TRAVEL_INFO_SHOW_044", true);		// 旅の心得解放フラグ 【ディスク】ディスク装置
	
	// 振り向くまで待つ
	Wait_(15);
	
	//-----
	uWaitShopFade();
	Wait_(15);
	
	SetPos_(player, player_pos);
	SetDir_(player, player_dir);
	SetCameraDir_(cam_dir);
	SetDirToPlayer_(g_ace);
	
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	Wait_(FADE_DEF);
	//-----
	
	SetMotion_(g_ace, MOT_TALKLOOP, BLEND_L);	// エース　会話L
	
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("MSG_GRAVE_AFTER_ACE_DEMO_01");
	KeyInputWait_();
	CloseMsgWnd_();
	
	SetMotion_(g_ace, MOT_WAIT, BLEND_M);		// エース　待機
	
	// カスタムディスク(固定ディスク)を追加
	OpenMsgWnd_();
	ShowMsg_("COMM_DISC_GET");
	PlayMe_("ME_010");  // 重要アイテム入手ME
	WaitMe_();
	AddItem_(item_id, item_num);
	AddCustomDisc_(FIX_DISC_CODE_1, FIX_DISC_CODE_2, FIX_DISC_CODE_3, DISC_LEVEL_20);
	KeyInputWait_();
	CloseMsgWnd_();
	
	SetMotion_(g_ace, MOT_TALKLOOP, BLEND_L);	// エース　会話L
	
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("MSG_GRAVE_AFTER_ACE_DEMO_02");
	KeyInputWait_();
	CloseMsgWnd_();
	
	SetMotion_(g_ace, MOT_WAIT, BLEND_M);		// エース　待機
	Wait_(15);
	
	SetMotion_(player, nod, BLEND_M);			// 主人公　うなずく
	Wait_(30);
	
	// 暗転
	uWaitShopFade();
}

//==========================================================================
// ローカル関数：配合機能の後に表示する戻りメッセージ
//--------------------------------------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//==========================================================================
function uRtnCouplingMsg()
{
	// メニューから戻った際のメッセージ
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("RTN_MSG_COUPLING");
	KeyInputWait_();
	CloseMsgWnd_();
}


//==========================================================================
// ローカル関数：レースメニューの後に表示する戻りメッセージ
//--------------------------------------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//==========================================================================
function uRtnRaceMsg()
{
	// メニューから戻った際のメッセージ
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_CHOMACH");
	ShowMsg_("RTN_MSG_HUNTER");
	KeyInputWait_();
	CloseMsgWnd_();
}


//============================================================================
// ローカル関数：道具屋フローとメッセージの表示関数
//----------------------------------------------------------------------------
// 引数    ：お店会話の初回フラグ
// 戻り値  ：なし
//============================================================================
function uItemShopFlowMsg(flg)
{
	// シナリオメインフラグ（キングやクイーンなどのお店以外のnpc会話のフラグ）
	local main_num = GetNumFlg_("NUM_SCENARIO_MAIN");
	// 崩落都市のシナリオサブフラグ（キングやクイーンなどのお店以外のnpc会話のフラグ）
	local city_num = GetNumFlg_("NUM_SCENARIO_SUB_CITY");
	// ガルビルス戦後のシナリオサブフラグ（高空シナリオ用）
	local sky_num = GetNumFlg_("NUM_SCENARIO_SUB_SKY");

	// 新しい商品を入荷したメッセージを表示するが判断する
	local rtn_num = uCheckItemShopNewListMsg();
	if(rtn_num >= 1){
		// 道具屋の初回メッセージを表示させないようにする
		SetEventFlg_("BFG_TALK_ITEM", true);
		switch(rtn_num)
		{
		// １段階目解放メッセージ
		case 1:
			SetEventFlg_("BFG_LOOK_ITEMSHOP_LV_MSG_1", true);
			MakeMassege2("SHOP_LV_MSG_001");
			break;
		// ２段階目解放メッセージ
		case 2:
			SetEventFlg_("BFG_LOOK_ITEMSHOP_LV_MSG_1", true);	// １段階目解放メッセージを見てない場合はすっ飛ばすため
			SetEventFlg_("BFG_LOOK_ITEMSHOP_LV_MSG_2", true);
			MakeMassege2("SHOP_LV_MSG_002");
			break;
		// ３段階目解放の確認メッセージ
		case 3:
			// 道具屋メッセージ(置き換えあり)
			OpenMsgWnd_();
			SetExchangeItemName_(ITEM_SHOP_EXTEND_ITEM_ID);
			SetExchangeItemName_(ITEM_SHOP_EXTEND_ITEM_ID);
			ShowMsg_("SHOP_LV_MSG_003_01");
			KeyInputWait_();
			CloseMsgWnd_();
			// システムメッセージ(置き換えあり)
			OpenMsgWnd_();
			SetExchangeItemName_(ITEM_SHOP_EXTEND_ITEM_ID);
			ShowMsg_("SHOP_LV_MSG_003_02");
			KeyInputWait_();
			CloseMsgWnd_();
			if(GetQueryResult_() == QUERY_YES){
				// ３段階解放＋アイテム減算＋メッセージ表示
				CommCheckItemShopChangeLv3();
				// 道具屋メッセージ
				OpenMsgWnd_();
				SetExchangeItemName_(ITEM_SHOP_EXTEND_ITEM_ID);
				ShowMsg_("SHOP_LV_MSG_003_02_YES");
				KeyInputWait_();
				CloseMsgWnd_();
				// 暗転＋ガサゴソSE＋暗転明け
				SetFade_(FADE_OUT, FADE_COLOR_BLACK, 15);
				WaitFade_();
				PlaySE_("SE_DEM_034");
				Wait_(30);
				SetFade_(FADE_IN, FADE_COLOR_BLACK, 15);
				WaitFade_();
				// 道具屋メッセージ
				OpenMsgWnd_();
				ShowMsg_("SHOP_LV_MSG_004");
				KeyInputWait_();
				CloseMsgWnd_();
			}
			else{
				// 道具屋メッセージ
				OpenMsgWnd_();
				ShowMsg_("SHOP_LV_MSG_003_02_NO");
				KeyInputWait_();
				CloseMsgWnd_();
			}
			break;
		default:
			break;
		}
	}
	else{
		// 完全クリア
		if(main_num == GetFlagID_("CONST_SM_ALL_CLEAR")){
			// お店会話の初回
			if(flg ==false){
				SetEventFlg_("BFG_TALK_ITEM", true);
				MakeMassege2("MSG_DEMO108_AFTER_SHOP_ITEM_000");
			}
			// ２回目以降
			else{
				MakeMassege2("MSG_INSIDE_CLEAR_SHOP_ITEM");
			}
		}
		// 裏シナリオ
		else if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){
			// お店会話の初回
			if(flg ==false){
				SetEventFlg_("BFG_TALK_ITEM", true);
				MakeMassege2("MSG_DEMO108_AFTER_SHOP_ITEM_000");
			}
			// ２回目以降
			else{
				MakeMassege2("MSG_INSIDE_CLEAR_SHOP_ITEM");
			}
		}
		// 高空シナリオ開始(sky_numは仮設置なので後で修正します)
		else if(main_num == GetFlagID_("CONST_SM_SKY")){
			// ガルビルス戦勝利後～巨大ボーショック戦
			if(sky_num <= GetFlagID_("CONST_SS_SK_JDG_REMATCH_G_BOWSHOCK")){
				// １回だけ表示( 2次DB #5941 )
				if(GetEventFlg_("BFG_FIRST_TALK_ITEM_SHOP_PHASE_1") == false){
					SetEventFlg_("BFG_FIRST_TALK_ITEM_SHOP_PHASE_1", true);
					MakeMassege2("MSG_WIN_GARUBIRUSU_AFTER_SHOP_ITEM");
				}
				else{
					MakeMassege2("MSG_DEMO108_AFTER_SHOP_ITEM_001");
				}
			}
			// 巨大ボーショック戦勝利後以降
			else if(sky_num >= GetFlagID_("CONST_SS_SK_GO_GRAVE_SKY")){
				// １回だけ表示( 2次DB #5941 )
				if(GetEventFlg_("BFG_FIRST_TALK_ITEM_SHOP_PHASE_2") == false){
					SetEventFlg_("BFG_FIRST_TALK_ITEM_SHOP_PHASE_2", true);
					MakeMassege2("MSG_WIN_G_BOWSHOCK_AFTER_SHOP_ITEM");
				}
				else{
					MakeMassege2("MSG_DEMO108_AFTER_SHOP_ITEM_001");
				}
			}
		}
		// 崩落開始～コアクリア
		else{
			// お店会話の初回
			if(flg ==false){
				SetEventFlg_("BFG_TALK_ITEM", true);
				MakeMassege2("MSG_DEMO108_AFTER_SHOP_ITEM_000");
			}
			// ２回目以降
			else{
				// 崩落
				if(main_num == GetFlagID_("CONST_SM_CITY")){
					// NUM003 → 9 ～ 10
					if(city_num >= GetFlagID_("CONST_SS_CI_ENTER_KINGDOM")
					&& city_num <= GetFlagID_("CONST_SS_CI_DISCOVER_HAIGOU")){
						MakeMassege2("MSG_DEMO108_AFTER_SHOP_ITEM_001");
					}
					// NUM003 → 11 ～ 27
					else if(city_num >= GetFlagID_("CONST_SS_CI_EARTHQUAKE")
					&& city_num <= GetFlagID_("CONST_SS_CI_REPORT_TO_KING")){
						MakeMassege2("MSG_DEMO108_AFTER_SHOP_ITEM_001_2");
					}
					// NUM003 → 28
					else if(city_num == GetFlagID_("CONST_SS_CI_TEST_RUN_HAIGOU")){
						MakeMassege2("MSG_DEMO122_AFTER_SHOP_ITEM_001_3");
					}
					// NUM003 → 29
					else if(city_num == GetFlagID_("CONST_SS_CI_GO_NEXT_CONTINENT")){
						MakeMassege2("MSG_DEMO123_AFTER_SHOP_ITEM_001_4");
					}
					// 上記以外
					else{
						MakeMassege2("MSG_DEMO108_AFTER_SHOP_ITEM_001");
					}
				}
				// 霊道開始～コアクリア
				else{
					MakeMassege2("MSG_DEMO123_AFTER_SHOP_ITEM_001_4");
				}
			}
		}
	}
	// 道具屋フローへ移行
	GotoMenuFadeOpen(MENU_OPEN.A01_00_ITEM);
	// 道具屋フロー終了後
	OpenMsgWnd_();
	ShowMsg_("RTN_MSG_SHOP_ITEM");
	KeyInputWait_();
	CloseMsgWnd_();
}


//============================================================================
// ローカル関数：新しい商品を入荷したメッセージを表示するが判断する関数(道具屋用)
//----------------------------------------------------------------------------
// 引数    ：なし
// 戻り値  ： 0 → 表示しない、1 ～ 3 → 表示する
//============================================================================
function uCheckItemShopNewListMsg()
{
	// 道具屋のショップ段階を調べる
	local shop_lv = GetNumFlg_("NUM_FLG_SHOP_A01_00_ITEM_LEVEL");

	// ２段階目解禁チェック
	if(shop_lv == 2){
		// ２段階目解禁メッセージがまだ表示されていない場合
		if(GetEventFlg_("BFG_LOOK_ITEMSHOP_LV_MSG_2") == false){
			return 2;
		}
		// ２段階目解禁メッセージが表示された場合
		else{
			// ３段階目解禁メッセージがまだ表示されていない場合
			if(GetEventFlg_("BFG_LOOK_ITEMSHOP_LV_MSG_3") == false){
				local get_num = GetItemNum_(ITEM_SHOP_EXTEND_ITEM_ID); // どうぐの達人
				// ３段階目解禁アイテムを持っている場合
				if(get_num >= 1){
					return 3;
				}
				// ３段階目解禁アイテムを持っていない場合
				else{
					return 0;
				}
			}
			else{
				return 0;
			}
		}
	}
	// １段階目解禁チェック
	else if(shop_lv == 1){
		// １段階目解禁メッセージがまだ表示されていない場合
		if(GetEventFlg_("BFG_LOOK_ITEMSHOP_LV_MSG_1") == false){
			return 1;
		}
		// １段階目解禁メッセージが表示された場合
		else{
			return 0;
		}
	}
	// 初期段階、３段階目の時は何もしない
	else{
		return 0;
	}
}


//============================================================================
// ローカル関数：銀行屋フローとメッセージの表示関数
//----------------------------------------------------------------------------
// 引数    ：お店会話の初回フラグ
// 戻り値  ：なし
//============================================================================
function uBankFlowMsg(flg)
{
	//シナリオメインフラグ（キングやクイーンなどのお店以外のnpc会話のフラグ）
	local main_num = GetNumFlg_("NUM_SCENARIO_MAIN");
	//崩落都市のシナリオサブフラグ（キングやクイーンなどのお店以外のnpc会話のフラグ）
	local city_num = GetNumFlg_("NUM_SCENARIO_SUB_CITY");
	// ガルビルス戦後のシナリオサブフラグ（高空シナリオ用）
	local sky_num = GetNumFlg_("NUM_SCENARIO_SUB_SKY");

	// 完全クリア
	if(main_num == GetFlagID_("CONST_SM_ALL_CLEAR")){
		// お店会話の初回
		if(flg ==false){
			SetEventFlg_("BFG_TALK_CREATE", true);
			MakeMassege2("MSG_DEMO108_AFTER_SHOP_BANK_000");
		}
		// ２回目以降
		else{
			MakeMassege2("MSG_INSIDE_CLEAR_SHOP_BANK");
		}
	}
	// 裏シナリオ
	else if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){
		// お店会話の初回
		if(flg ==false){
			SetEventFlg_("BFG_TALK_CREATE", true);
			MakeMassege2("MSG_DEMO108_AFTER_SHOP_BANK_000");
		}
		// ２回目以降
		else{
			MakeMassege2("MSG_INSIDE_CLEAR_SHOP_BANK");
		}
	}
	// 高空シナリオ開始(sky_numは仮設置なので後で修正します)
	else if(main_num == GetFlagID_("CONST_SM_SKY")){
		// ガルビルス戦勝利後～巨大ボーショック戦
		if(sky_num <= GetFlagID_("CONST_SS_SK_JDG_REMATCH_G_BOWSHOCK")){
			// １回だけ表示( 2次DB #5941 )
			if(GetEventFlg_("BFG_FIRST_TALK_BANK_PHASE_1") == false){
				SetEventFlg_("BFG_FIRST_TALK_BANK_PHASE_1", true);
				MakeMassege2("MSG_WIN_GARUBIRUSU_AFTER_SHOP_BANK");
			}
			else{
				MakeMassege2("MSG_DEMO108_AFTER_SHOP_BANK_001");
			}
		}
		// 巨大ボーショック戦勝利後以降
		else if(sky_num >= GetFlagID_("CONST_SS_SK_GO_GRAVE_SKY")){
			// １回だけ表示( 2次DB #5941 )
			if(GetEventFlg_("BFG_FIRST_TALK_BANK_PHASE_2") == false){
				SetEventFlg_("BFG_FIRST_TALK_BANK_PHASE_2", true);
				MakeMassege2("MSG_WIN_G_BOWSHOCK_AFTER_SHOP_BANK");
			}
			else{
				MakeMassege2("MSG_DEMO108_AFTER_SHOP_BANK_001");
			}
		}
	}
	// 崩落開始～コアクリア
	else{
		// お店会話の初回
		if(flg ==false){
			SetEventFlg_("BFG_TALK_CREATE", true);
			MakeMassege2("MSG_DEMO108_AFTER_SHOP_BANK_000");
		}
		// ２回目以降
		else{
			// 崩落
			if(main_num == GetFlagID_("CONST_SM_CITY")){
				// NUM003 → 9 ～ 10
				if(city_num >= GetFlagID_("CONST_SS_CI_ENTER_KINGDOM")
				&& city_num <= GetFlagID_("CONST_SS_CI_DISCOVER_HAIGOU")){
					MakeMassege2("MSG_DEMO108_AFTER_SHOP_BANK_001");
				}
				// NUM003 → 11 ～ 27
				else if(city_num >= GetFlagID_("CONST_SS_CI_EARTHQUAKE")
				&& city_num <= GetFlagID_("CONST_SS_CI_REPORT_TO_KING")){
					MakeMassege2("MSG_DEMO108_AFTER_SHOP_BANK_001_2");
				}
				// NUM003 → 28
				else if(city_num == GetFlagID_("CONST_SS_CI_TEST_RUN_HAIGOU")){
					MakeMassege2("MSG_DEMO122_AFTER_SHOP_BANK_001_3");
				}
				// NUM003 → 29
				else if(city_num == GetFlagID_("CONST_SS_CI_GO_NEXT_CONTINENT")){
					MakeMassege2("MSG_DEMO123_AFTER_SHOP_BANK_001_4");
				}
				// 上記以外
				else{
					MakeMassege2("MSG_DEMO108_AFTER_SHOP_BANK_001");
				}
			}
			// 霊道開始～コアクリア
			else{
				MakeMassege2("MSG_DEMO123_AFTER_SHOP_BANK_001_4");
			}
		}
	}
	// 銀行へ移行
	GotoMenuFadeOpen(MENU_OPEN.GOLD_BANK);
	// 銀行フロー終了後
	OpenMsgWnd_();
	ShowMsg_("RTN_MSG_SHOP_BANK");
	KeyInputWait_();
	CloseMsgWnd_();
}


//============================================================================
// ローカル関数：本屋フローとメッセージの表示関数
//----------------------------------------------------------------------------
// 引数    ：お店会話の初回フラグ
// 戻り値  ：なし
//============================================================================
function uBookStoreFlowMsg(flg)
{
	// シナリオメインフラグ（キングやクイーンなどのお店以外のnpc会話のフラグ）
	local main_num = GetNumFlg_("NUM_SCENARIO_MAIN");
	// 崩落都市のシナリオサブフラグ（キングやクイーンなどのお店以外のnpc会話のフラグ）
	local city_num = GetNumFlg_("NUM_SCENARIO_SUB_CITY");
	// ガルビルス戦後のシナリオサブフラグ（高空シナリオ用）
	local sky_num = GetNumFlg_("NUM_SCENARIO_SUB_SKY");
	// 変数(一番最初の解放アイテムのアイテムIDを格納する変数)
	local item_id = 0;
	
	// ■本屋ラインナップ解禁アイテムのチェック < Redmine#2259 >
	if(uCheckBookItem() > 1){
		// 本屋
		OpenMsgWnd_();
		// メッセージの置き換え
		item_id = uCheckBookItem();
		SetExchangeItemName_(item_id);
		SetExchangeItemName_(item_id);
		ShowMsg_("RELEASE_BOOK_LIST_MSG_03_01");
		KeyInputWait_();
		ShowMsg_("RELEASE_BOOK_LIST_MSG_03_02");
		KeyInputWait_();
		CloseMsgWnd_();
		
		if(GetQueryResult_() == QUERY_YES){
			// 一番最初の解放アイテムを減算してリストに追加
			uCalcBookItem(item_id);
			
			// システムメッセージ
			OpenMsgWnd_();
			// メッセージの置き換え
			SetExchangeItemName_(item_id);
			ShowMsg_("RELEASE_BOOK_LIST_MSG_03_YES_01");
			KeyInputWait_();
			CloseMsgWnd_();
			
			// 本屋メッセージ
			OpenMsgWnd_();
			// メッセージの置き換え
			SetExchangeItemName_(item_id);
			SetExchangeItemName_(uCheckAddEmblem1st(item_id));
			SetExchangeItemName_(uCheckAddEmblem2nd(item_id));
			ShowMsg_("RELEASE_BOOK_LIST_MSG_03_YES_02");
			KeyInputWait_();
			CloseMsgWnd_();

			// 解放アイテムを２個以上持っているかチェック
			while(true){
				if(uCheckBookItem() > 1){
					// 本屋メッセージ
					OpenMsgWnd_();
					item_id = uCheckBookItem();
					SetExchangeItemName_(item_id);
					SetExchangeItemName_(item_id);
					ShowMsg_("RELEASE_BOOK_LIST_MSG_04"); // 「お？　もしかして
					KeyInputWait_();
					CloseMsgWnd_();
					if(GetQueryResult_() == QUERY_YES){
						// 解放アイテムを２個以上持ってて、はいを選んだ場合
						// 減算してリストに追加
						uCalcBookItem(item_id);
					}
					else{
						// いいえを選んだ場合
						break;
					}
				}
				else{
					// 持っていなかった場合
					break;
				}
			}

			// リストに追加する演出(ここで減算すしないこと)
			OpenMsgWnd_();
			ShowMsg_("RELEASE_BOOK_LIST_MSG_04_NO_01");
			KeyInputWait_();
			CloseMsgWnd_();
			// 暗転
			SetFade_(FADE_OUT, FADE_COLOR_BLACK, 15);
			WaitFade_();
			// SE(ガサゴソがないので汎用アイテム入手で代用)
			PlaySE_("SE_DEM_034");
			Wait_(30);
			// 暗転
			SetFade_(FADE_IN, FADE_COLOR_BLACK, 15);
			WaitFade_();
			// メッセージ
			OpenMsgWnd_();
			ShowMsg_("RELEASE_BOOK_LIST_MSG_04_NO_02");
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else{
			OpenMsgWnd_();
			ShowMsg_("RELEASE_BOOK_LIST_MSG_03_NO");
			KeyInputWait_();
			CloseMsgWnd_();
		}
		// お店会話の初回時の場合、フラグを立てておく
		SetEventFlg_("BFG_TALK_BOOK", true);
	}
	else{
		// 完全クリア
		if(main_num == GetFlagID_("CONST_SM_ALL_CLEAR")){
			// お店会話の初回
			if(flg ==false){
				SetEventFlg_("BFG_TALK_BOOK", true);
				MakeMassege2("MSG_DEMO108_AFTER_SHOP_BOOK_000");
			}
			// ２回目以降
			else{
				MakeMassege2("MSG_INSIDE_CLEAR_SHOP_BOOK");
			}
		}
		// 裏シナリオ
		else if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){
			// お店会話の初回
			if(flg ==false){
				SetEventFlg_("BFG_TALK_BOOK", true);
				MakeMassege2("MSG_DEMO108_AFTER_SHOP_BOOK_000");
			}
			// ２回目以降
			else{
				MakeMassege2("MSG_INSIDE_CLEAR_SHOP_BOOK");
			}
		}
		// 高空シナリオ開始(sky_numは仮設置なので後で修正します)
		else if(main_num == GetFlagID_("CONST_SM_SKY")){
			// ガルビルス戦勝利後～巨大ボーショック戦
			if(sky_num <= GetFlagID_("CONST_SS_SK_JDG_REMATCH_G_BOWSHOCK")){
				// １回だけ表示( 2次DB #5941 )
				if(GetEventFlg_("BFG_FIRST_TALK_BOOK_SHOP_PHASE_1") == false){
					SetEventFlg_("BFG_FIRST_TALK_BOOK_SHOP_PHASE_1", true);
					MakeMassege2("MSG_WIN_GARUBIRUSU_AFTER_SHOP_BOOK");
				}
				else{
					MakeMassege2("MSG_DEMO108_AFTER_SHOP_BOOK_001");
				}
			}
			// 巨大ボーショック戦勝利後以降
			else if(sky_num >= GetFlagID_("CONST_SS_SK_GO_GRAVE_SKY")){
				// １回だけ表示( 2次DB #5941 )
				if(GetEventFlg_("BFG_FIRST_TALK_BOOK_SHOP_PHASE_2") == false){
					SetEventFlg_("BFG_FIRST_TALK_BOOK_SHOP_PHASE_2", true);
					MakeMassege2("MSG_WIN_G_BOWSHOCK_AFTER_SHOP_BOOK");
				}
				else{
					MakeMassege2("MSG_DEMO108_AFTER_SHOP_BOOK_001");
				}
			}
		}
		// 崩落開始～コアクリア
		else{
			// お店会話の初回
			if(flg ==false){
				SetEventFlg_("BFG_TALK_BOOK", true);
				MakeMassege2("MSG_DEMO108_AFTER_SHOP_BOOK_000");
			}
			// ２回目以降
			else{
				// 崩落
				if(main_num == GetFlagID_("CONST_SM_CITY")){
					// NUM003 → 9 ～ 10
					if(city_num >= GetFlagID_("CONST_SS_CI_ENTER_KINGDOM")
					&& city_num <= GetFlagID_("CONST_SS_CI_DISCOVER_HAIGOU")){
						MakeMassege2("MSG_DEMO108_AFTER_SHOP_BOOK_001");
					}
					// NUM003 → 11 ～ 27
					else if(city_num >= GetFlagID_("CONST_SS_CI_EARTHQUAKE")
					&& city_num <= GetFlagID_("CONST_SS_CI_REPORT_TO_KING")){
						MakeMassege2("MSG_DEMO108_AFTER_SHOP_BOOK_001_2");
					}
					// NUM003 → 28
					else if(city_num == GetFlagID_("CONST_SS_CI_TEST_RUN_HAIGOU")){
						MakeMassege2("MSG_DEMO122_AFTER_SHOP_BOOK_001_3");
					}
					// NUM003 → 29
					else if(city_num == GetFlagID_("CONST_SS_CI_GO_NEXT_CONTINENT")){
						MakeMassege2("MSG_DEMO123_AFTER_SHOP_BOOK_001_4");
					}
					// 上記以外
					else{
						MakeMassege2("MSG_DEMO108_AFTER_SHOP_BOOK_001");
					}
				}
				// 霊道開始～コアクリア
				else{
					MakeMassege2("MSG_DEMO123_AFTER_SHOP_BOOK_001_4");
				}
			}
		}
	}
	// 本屋へ移行
	GotoMenuFadeOpen(MENU_OPEN.A01_00_BOOK);
	// 本屋フロー終了後
	OpenMsgWnd_();
	ShowMsg_("RTN_MSG_SHOP_BOOK");
	KeyInputWait_();
	CloseMsgWnd_();
}


//==========================================================
// ローカル関数 : 本屋ラインナップ解禁アイテムのチェック処理
//----------------------------------------------------------
// 引数  ：なし
// 戻り値：解禁アイテム持ってる→ アイテムＩＤ / 持ってない→ 0
//==========================================================
function uCheckBookItem()
{
	if(GetItemNum_(BOOK_ITEM_ID_01) >= 1){
		return BOOK_ITEM_ID_01;
	}
	if(GetItemNum_(BOOK_ITEM_ID_02) >= 1){
		return BOOK_ITEM_ID_02;
	}
	if(GetItemNum_(BOOK_ITEM_ID_03) >= 1){
		return BOOK_ITEM_ID_03;
	}
	if(GetItemNum_(BOOK_ITEM_ID_04) >= 1){
		return BOOK_ITEM_ID_04;
	}
	if(GetItemNum_(BOOK_ITEM_ID_05) >= 1){
		return BOOK_ITEM_ID_05;
	}
	if(GetItemNum_(BOOK_ITEM_ID_06) >= 1){
		return BOOK_ITEM_ID_06;
	}
	if(GetItemNum_(BOOK_ITEM_ID_07) >= 1){
		return BOOK_ITEM_ID_07;
	}
	if(GetItemNum_(BOOK_ITEM_ID_08) >= 1){
		return BOOK_ITEM_ID_08;
	}
	if(GetItemNum_(BOOK_ITEM_ID_09) >= 1){
		return BOOK_ITEM_ID_09;
	}
	if(GetItemNum_(BOOK_ITEM_ID_10) >= 1){
		return BOOK_ITEM_ID_10;
	}
	if(GetItemNum_(BOOK_ITEM_ID_11) >= 1){
		return BOOK_ITEM_ID_11;
	}
	if(GetItemNum_(BOOK_ITEM_ID_12) >= 1){
		return BOOK_ITEM_ID_12;
	}

	return 0;
}


//==========================================================
// ローカル関数 : 減算してラインナップを増やすフラグを立てる
//----------------------------------------------------------
// 引数  ：アイテムID
// 戻り値：なし
//==========================================================
function uCalcBookItem(item_id)
{
	// アイテムの総数を取得
	local item_num = GetItemNum_(item_id);

	switch(item_id)
	{
	case BOOK_ITEM_ID_01:
		if(item_num >= 1){
			SetEventFlg_("BFG_BOOK_SHOP_LIST_ADD_000", true);
			AddItem_(item_id, -1);
		}
		break;
	case BOOK_ITEM_ID_02:
		if(item_num >= 1){
			SetEventFlg_("BFG_BOOK_SHOP_LIST_ADD_006", true);
			AddItem_(item_id, -1);
		}
		break;
	case BOOK_ITEM_ID_03:
		if(item_num >= 1){
			SetEventFlg_("BFG_BOOK_SHOP_LIST_ADD_001", true);
			AddItem_(item_id, -1);
		}
		break;
	case BOOK_ITEM_ID_04:
		if(item_num >= 1){
			SetEventFlg_("BFG_BOOK_SHOP_LIST_ADD_007", true);
			AddItem_(item_id, -1);
		}
		break;
	case BOOK_ITEM_ID_05:
		if(item_num >= 1){
			SetEventFlg_("BFG_BOOK_SHOP_LIST_ADD_002", true);
			AddItem_(item_id, -1);
		}
		break;
	case BOOK_ITEM_ID_06:
		if(item_num >= 1){
			SetEventFlg_("BFG_BOOK_SHOP_LIST_ADD_008", true);
			AddItem_(item_id, -1);
		}
		break;
	case BOOK_ITEM_ID_07:
		if(item_num >= 1){
			SetEventFlg_("BFG_BOOK_SHOP_LIST_ADD_003", true);
			AddItem_(item_id, -1);
		}
		break;
	case BOOK_ITEM_ID_08:
		if(item_num >= 1){
			SetEventFlg_("BFG_BOOK_SHOP_LIST_ADD_009", true);
			AddItem_(item_id, -1);
		}
		break;
	case BOOK_ITEM_ID_09:
		if(item_num >= 1){
			SetEventFlg_("BFG_BOOK_SHOP_LIST_ADD_004", true);
			AddItem_(item_id, -1);
		}
		break;
	case BOOK_ITEM_ID_10:
		if(item_num >= 1){
			SetEventFlg_("BFG_BOOK_SHOP_LIST_ADD_010", true);
			AddItem_(item_id, -1);
		}
		break;
	case BOOK_ITEM_ID_11:
		if(item_num >= 1){
			SetEventFlg_("BFG_BOOK_SHOP_LIST_ADD_005", true);
			AddItem_(item_id, -1);
		}
		break;
	case BOOK_ITEM_ID_12:
		if(item_num >= 1){
			SetEventFlg_("BFG_BOOK_SHOP_LIST_ADD_011", true);
			AddItem_(item_id, -1);
		}
		break;
	default:
		break;
	}
}

//============================================================================
// ローカル関数：本屋で渡したアイテムＩＤでラインナップに並ぶ証を調べる(その１)
//----------------------------------------------------------------------------
// 引数    ：アイテムＩＤ
// 戻り値  ：なし
//============================================================================
function uCheckAddEmblem1st(item_id)
{
	switch(item_id)
	{
	case BOOK_ITEM_ID_01:
		return BOOK_LIST_01_ITEM_ID_01;
	case BOOK_ITEM_ID_02:
		return BOOK_LIST_01_ITEM_ID_02;
	case BOOK_ITEM_ID_03:
		return BOOK_LIST_01_ITEM_ID_03;
	case BOOK_ITEM_ID_04:
		return BOOK_LIST_01_ITEM_ID_04;
	case BOOK_ITEM_ID_05:
		return BOOK_LIST_01_ITEM_ID_05;
	case BOOK_ITEM_ID_06:
		return BOOK_LIST_01_ITEM_ID_06;
	case BOOK_ITEM_ID_07:
		return BOOK_LIST_01_ITEM_ID_07;
	case BOOK_ITEM_ID_08:
		return BOOK_LIST_01_ITEM_ID_08;
	case BOOK_ITEM_ID_09:
		return BOOK_LIST_01_ITEM_ID_09;
	case BOOK_ITEM_ID_10:
		return BOOK_LIST_01_ITEM_ID_10;
	case BOOK_ITEM_ID_11:
		return BOOK_LIST_01_ITEM_ID_11;
	case BOOK_ITEM_ID_12:
		return BOOK_LIST_01_ITEM_ID_12;
	default:
		break;
	}
}

//============================================================================
// ローカル関数：本屋で渡したアイテムＩＤでラインナップに並ぶ証を調べる(その２)
//----------------------------------------------------------------------------
// 引数    ：アイテムＩＤ
// 戻り値  ：なし
//============================================================================
function uCheckAddEmblem2nd(item_id)
{
	switch(item_id)
	{
	case BOOK_ITEM_ID_01:
		return BOOK_LIST_02_ITEM_ID_01;
	case BOOK_ITEM_ID_02:
		return BOOK_LIST_02_ITEM_ID_02;
	case BOOK_ITEM_ID_03:
		return BOOK_LIST_02_ITEM_ID_03;
	case BOOK_ITEM_ID_04:
		return BOOK_LIST_02_ITEM_ID_04;
	case BOOK_ITEM_ID_05:
		return BOOK_LIST_02_ITEM_ID_05;
	case BOOK_ITEM_ID_06:
		return BOOK_LIST_02_ITEM_ID_06;
	case BOOK_ITEM_ID_07:
		return BOOK_LIST_02_ITEM_ID_07;
	case BOOK_ITEM_ID_08:
		return BOOK_LIST_02_ITEM_ID_08;
	case BOOK_ITEM_ID_09:
		return BOOK_LIST_02_ITEM_ID_09;
	case BOOK_ITEM_ID_10:
		return BOOK_LIST_02_ITEM_ID_10;
	case BOOK_ITEM_ID_11:
		return BOOK_LIST_02_ITEM_ID_11;
	case BOOK_ITEM_ID_12:
		return BOOK_LIST_02_ITEM_ID_12;
	default:
		break;
	}
}


//============================================================================
// ローカル関数：肉屋フローとメッセージの表示関数
//----------------------------------------------------------------------------
// 引数    ：お店会話の初回フラグ
// 戻り値  ：なし
//============================================================================
function uMeatShopFlowMsg(flg)
{
	// シナリオメインフラグ（キングやクイーンなどのお店以外のnpc会話のフラグ）
	local main_num = GetNumFlg_("NUM_SCENARIO_MAIN");
	// 崩落都市のシナリオサブフラグ（キングやクイーンなどのお店以外のnpc会話のフラグ）
	local city_num = GetNumFlg_("NUM_SCENARIO_SUB_CITY");
	// ガルビルス戦後のシナリオサブフラグ（高空シナリオ用）
	local sky_num = GetNumFlg_("NUM_SCENARIO_SUB_SKY");

	// 新しい商品を入荷したメッセージを表示するが判断する
	local rtn_num = uCheckMeatShopNewListMsg();
	if(rtn_num >= 1){
		// 肉屋の初回メッセージを表示させないようにする
		SetEventFlg_("BFG_TALK_MEET", true);
		switch(rtn_num)
		{
		// １段階目解放メッセージ
		case 1:
			SetEventFlg_("BFG_LOOK_MEATSHOP_LV_MSG_1", true);
			MakeMassege2("MEAT_SHOP_LV_MSG_001");
			break;
		// ２段階目解放メッセージ
		case 2:
			SetEventFlg_("BFG_LOOK_MEATSHOP_LV_MSG_1", true);	// １段階目解放メッセージを見てない場合はすっ飛ばすため
			SetEventFlg_("BFG_LOOK_MEATSHOP_LV_MSG_2", true);
			MakeMassege2("MEAT_SHOP_LV_MSG_002");
			break;
		// ３段階目解放の確認メッセージ
		case 3:
			// 肉屋メッセージ(置き換えあり)
			OpenMsgWnd_();
			SetExchangeItemName_(MEAT_SHOP_EXTEND_ITEM_ID);
			ShowMsg_("MEAT_SHOP_LV_MSG_003_01");
			KeyInputWait_();
			CloseMsgWnd_();
			// システムメッセージ(置き換えあり)
			OpenMsgWnd_();
			SetExchangeItemName_(MEAT_SHOP_EXTEND_ITEM_ID);
			ShowMsg_("MEAT_SHOP_LV_MSG_003_02");
			KeyInputWait_();
			CloseMsgWnd_();
			if(GetQueryResult_() == QUERY_YES){
				// ３段階解放＋アイテム減算＋メッセージ表示
				CommCheckMeatShopChangeLv3();
				// 肉屋メッセージ
				OpenMsgWnd_();
				ShowMsg_("MEAT_SHOP_LV_MSG_003_02_YES");
				KeyInputWait_();
				CloseMsgWnd_();
				// 暗転＋ガサゴソSE＋暗転明け
				SetFade_(FADE_OUT, FADE_COLOR_BLACK, 15);
				WaitFade_();
				PlaySE_("SE_DEM_034");
				Wait_(30);
				SetFade_(FADE_IN, FADE_COLOR_BLACK, 15);
				WaitFade_();
				// 肉屋メッセージ
				OpenMsgWnd_();
				ShowMsg_("MEAT_SHOP_LV_MSG_004");
				KeyInputWait_();
				CloseMsgWnd_();
			}
			else{
				// 肉屋メッセージ
				OpenMsgWnd_();
				ShowMsg_("MEAT_SHOP_LV_MSG_003_02_NO");
				KeyInputWait_();
				CloseMsgWnd_();
			}
			break;
		default:
			break;
		}
	}
	else{
		// 完全クリア
		if(main_num == GetFlagID_("CONST_SM_ALL_CLEAR")){
			// お店会話の初回
			if(flg ==false){
				SetEventFlg_("BFG_TALK_MEET", true);
				MakeMassege2("MSG_DEMO108_AFTER_SHOP_MEET_000");
			}
			// ２回目以降
			else{
				MakeMassege2("MSG_INSIDE_CLEAR_SHOP_MEET");
			}
		}
		// 裏シナリオ
		else if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){
			// お店会話の初回
			if(flg ==false){
				SetEventFlg_("BFG_TALK_MEET", true);
				MakeMassege2("MSG_DEMO108_AFTER_SHOP_MEET_000");
			}
			// ２回目以降
			else{
				MakeMassege2("MSG_INSIDE_CLEAR_SHOP_MEET");
			}
		}
		// 高空シナリオ開始(sky_numは仮設置なので後で修正します)
		else if(main_num == GetFlagID_("CONST_SM_SKY")){
			// ガルビルス戦勝利後～巨大ボーショック戦
			if(sky_num <= GetFlagID_("CONST_SS_SK_JDG_REMATCH_G_BOWSHOCK")){
				// １回だけ表示( 2次DB #5941 )
				if(GetEventFlg_("BFG_FIRST_TALK_MEAT_SHOP_PHASE_1") == false){
					SetEventFlg_("BFG_FIRST_TALK_MEAT_SHOP_PHASE_1", true);
					MakeMassege2("MSG_WIN_GARUBIRUSU_AFTER_SHOP_MEET");
				}
				else{
					MakeMassege2("MSG_DEMO108_AFTER_SHOP_MEET_001");
				}
			}
			// 巨大ボーショック戦勝利後以降
			else if(sky_num >= GetFlagID_("CONST_SS_SK_GO_GRAVE_SKY")){
				// １回だけ表示( 2次DB #5941 )
				if(GetEventFlg_("BFG_FIRST_TALK_MEAT_SHOP_PHASE_2") == false){
					SetEventFlg_("BFG_FIRST_TALK_MEAT_SHOP_PHASE_2", true);
					MakeMassege2("MSG_WIN_G_BOWSHOCK_AFTER_SHOP_MEET");
				}
				else{
					MakeMassege2("MSG_DEMO108_AFTER_SHOP_MEET_001");
				}
			}
		}
		// 崩落開始～コアクリア
		else{
			// お店会話の初回
			if(flg ==false){
				SetEventFlg_("BFG_TALK_MEET", true);
				MakeMassege2("MSG_DEMO108_AFTER_SHOP_MEET_000");
			}
			// ２回目以降
			else{
				// 崩落
				if(main_num == GetFlagID_("CONST_SM_CITY")){
					// NUM003 → 9 ～ 10
					if(city_num >= GetFlagID_("CONST_SS_CI_ENTER_KINGDOM")
					&& city_num <= GetFlagID_("CONST_SS_CI_DISCOVER_HAIGOU")){
						MakeMassege2("MSG_DEMO108_AFTER_SHOP_MEET_001");
					}
					// NUM003 → 11 ～ 27
					else if(city_num >= GetFlagID_("CONST_SS_CI_EARTHQUAKE")
					&& city_num <= GetFlagID_("CONST_SS_CI_REPORT_TO_KING")){
						MakeMassege2("MSG_DEMO108_AFTER_SHOP_MEET_001_2");
					}
					// NUM003 → 28
					else if(city_num == GetFlagID_("CONST_SS_CI_TEST_RUN_HAIGOU")){
						MakeMassege2("MSG_DEMO122_AFTER_SHOP_MEET_001_3");
					}
					// NUM003 → 29
					else if(city_num == GetFlagID_("CONST_SS_CI_GO_NEXT_CONTINENT")){
						MakeMassege2("MSG_DEMO123_AFTER_SHOP_MEET_001_4");
					}
					// 上記以外
					else{
						MakeMassege2("MSG_DEMO108_AFTER_SHOP_MEET_001");
					}
				}
				// 霊道開始～コアクリア
				else{
					MakeMassege2("MSG_DEMO123_AFTER_SHOP_MEET_001_4");
				}
			}
		}
	}
	// 肉屋へ移行
	GotoMenuFadeOpen(MENU_OPEN.A01_00_MEET);
	// 肉屋フロー終了後
	OpenMsgWnd_();
	ShowMsg_("RTN_MSG_SHOP_MEET");
	KeyInputWait_();
	CloseMsgWnd_();
}


//============================================================================
// ローカル関数：新しい商品を入荷したメッセージを表示するが判断する関数(肉屋用)
//----------------------------------------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//============================================================================
function uCheckMeatShopNewListMsg()
{
	// 肉屋のショップ段階を調べる
	local shop_lv = GetNumFlg_("NUM_FLG_SHOP_A01_00_MEET_LEVEL");

	// ２段階目解禁チェック
	if(shop_lv == 2){
		// ２段階目解禁メッセージがまだ表示されていない場合
		if(GetEventFlg_("BFG_LOOK_MEATSHOP_LV_MSG_2") == false){
			return 2;
		}
		// ２段階目解禁メッセージが表示された場合
		else{
			// ３段階目解禁メッセージがまだ表示されていない場合
			if(GetEventFlg_("BFG_LOOK_MEATSHOP_LV_MSG_3") == false){
				local get_num = GetItemNum_(MEAT_SHOP_EXTEND_ITEM_ID); // せい肉の極意
				// ３段階目解禁アイテムを持っている場合
				if(get_num >= 1){
					return 3;
				}
				// ３段階目解禁アイテムを持っていない場合
				else{
					return 0;
				}
			}
			else{
				return 0;
			}
		}
	}
	// １段階目解禁チェック
	else if(shop_lv == 1){
		// １段階目解禁メッセージがまだ表示されていない場合
		if(GetEventFlg_("BFG_LOOK_MEATSHOP_LV_MSG_1") == false){
			return 1;
		}
		// １段階目解禁メッセージが表示された場合
		else{
			return 0;
		}
	}
	// 初期段階、３段階目の時は何もしない
	else{
		return 0;
	}
}


//============================================================================
// ローカル関数：アクセサリ屋フロー移行と前置きメッセージの表示関数
//----------------------------------------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//============================================================================
function uAcceShopFlowMsg()
{
	//シナリオメインフラグ（キングやクイーンなどのお店以外のnpc会話のフラグ）
	local main_num = GetNumFlg_("NUM_SCENARIO_MAIN");
	//崩落都市のシナリオサブフラグ（キングやクイーンなどのお店以外のnpc会話のフラグ）
	local city_num = GetNumFlg_("NUM_SCENARIO_SUB_CITY");
	// ガルビルス戦後のシナリオサブフラグ（高空シナリオ用）
	local sky_num = GetNumFlg_("NUM_SCENARIO_SUB_SKY");

// 前置きメッセージ＋アクセサリ屋機能に移行
// ( アクセサリー屋機能が解放されるのはDemo123[配合装置、試運転]再生後 )
	// 完全クリア
	if(main_num == GetFlagID_("CONST_SM_ALL_CLEAR")){
		// １回だけ表示( 2次DB #5941 )
		if(GetEventFlg_("BFG_FIRST_TALK_ACCE_SHOP_PHASE_3") == false){
			// 初回メッセージと被る場合はフラグを立てない
			if(GetEventFlg_("BFG_TALK_ACCE") == true){
				SetEventFlg_("BFG_FIRST_TALK_ACCE_SHOP_PHASE_3", true);
			}
			uAcceShopMenuOpenFlow("MSG_INSIDE_CLEAR_SHOP_ACCE");
		}
		else{
			uAcceShopMenuOpenFlow();
		}
	}
	// 裏シナリオ
	else if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){
		// １回だけ表示( 2次DB #5941 )
		if(GetEventFlg_("BFG_FIRST_TALK_ACCE_SHOP_PHASE_3") == false){
			// 初回メッセージと被る場合はフラグを立てない
			if(GetEventFlg_("BFG_TALK_ACCE") == true){
				SetEventFlg_("BFG_FIRST_TALK_ACCE_SHOP_PHASE_3", true);
			}
			uAcceShopMenuOpenFlow("MSG_INSIDE_CLEAR_SHOP_ACCE");
		}
		else{
			uAcceShopMenuOpenFlow();
		}
	}
	// 高空シナリオ開始(sky_numは仮設置なので後で修正します)
	else if(main_num == GetFlagID_("CONST_SM_SKY")){
		// ガルビルス戦勝利後～巨大ボーショック戦
		if(sky_num <= GetFlagID_("CONST_SS_SK_JDG_REMATCH_G_BOWSHOCK")){
			// １回だけ表示( 2次DB #5941 )
			if(GetEventFlg_("BFG_FIRST_TALK_ACCE_SHOP_PHASE_1") == false){
				// 初回メッセージと被る場合はフラグを立てない
				if(GetEventFlg_("BFG_TALK_ACCE") == true){
					SetEventFlg_("BFG_FIRST_TALK_ACCE_SHOP_PHASE_1", true);
				}
				uAcceShopMenuOpenFlow("MSG_WIN_GARUBIRUSU_AFTER_SHOP_ACCE");
			}
			else{
				uAcceShopMenuOpenFlow();
			}
		}
		// 巨大ボーショック戦勝利後以降
		else if(sky_num >= GetFlagID_("CONST_SS_SK_GO_GRAVE_SKY")){
			// １回だけ表示( 2次DB #5941 )
			if(GetEventFlg_("BFG_FIRST_TALK_ACCE_SHOP_PHASE_2") == false){
				// 初回メッセージと被る場合はフラグを立てない
				if(GetEventFlg_("BFG_TALK_ACCE") == true){
					SetEventFlg_("BFG_FIRST_TALK_ACCE_SHOP_PHASE_2", true);
				}
				uAcceShopMenuOpenFlow("MSG_WIN_G_BOWSHOCK_AFTER_SHOP_ACCE");
			}
			else{
				uAcceShopMenuOpenFlow();
			}
		}
	}
	// 崩落開始～コアクリア
	else{
		// 崩落
		if(main_num == GetFlagID_("CONST_SM_CITY")){
			// NUM003 → 9 ～ 10
			if(city_num >= GetFlagID_("CONST_SS_CI_ENTER_KINGDOM")
			&& city_num <= GetFlagID_("CONST_SS_CI_DISCOVER_HAIGOU")){
				MakeMassege2("MSG_DEMO108_AFTER_SHOP_ACCE_001");
			}
			// NUM003 → 11 ～ 27
			else if(city_num >= GetFlagID_("CONST_SS_CI_EARTHQUAKE")
			&& city_num <= GetFlagID_("CONST_SS_CI_REPORT_TO_KING")){
				MakeMassege2("MSG_DEMO108_AFTER_SHOP_ACCE_001_2");
			}
			// NUM003 → 28
			else if(city_num == GetFlagID_("CONST_SS_CI_TEST_RUN_HAIGOU")){
				MakeMassege2("MSG_DEMO122_AFTER_SHOP_ACCE_001_3");
			}
			// NUM003 → 29 以上
			else if(city_num >= GetFlagID_("CONST_SS_CI_GO_NEXT_CONTINENT")){
				uAcceShopMenuOpenFlow();
			}
			// 上記以外
			else{
				MakeMassege2("MSG_DEMO108_AFTER_SHOP_ACCE_001");
			}
		}
		// 霊道開始～コアクリア
		else{
			uAcceShopMenuOpenFlow();
		}
	}
}

//============================================================================
// ローカル関数：アクセサリ屋機能に移行する際のフロー
//----------------------------------------------------------------------------
// デフォルト引数：メッセージキー(前置きメッセージを表示するための)
// 戻り値        ：なし
//============================================================================
function uAcceShopMenuOpenFlow(msg_key = "")
{
	// ナビマップアイコンの表示切替
	SetEventFlg_("BFG_MAP_ICON_041", false); // アクセサリ屋のNEWマークを消す
	
	// 通常
	if(uCheckUnlockAcceShop() == false){
		// メッセージ開始
		OpenMsgWnd_();
		// 初回チェック
		if(GetEventFlg_("BFG_TALK_ACCE") == false){
			ShowMsg_("MSG_SHOP_ACCE_FLOW_01");
			KeyInputWait_();
			// アクセサリーＱを始めていない
			if(GetEventFlg_("BFG_SUBEVENT_ACCEQ_FIRSTTALK") == false){
				ShowMsg_("MSG_SHOP_ACCE_FLOW_02");
				KeyInputWait_();
			}
			ShowMsg_("MSG_SHOP_ACCE_FLOW_03");
			KeyInputWait_();
			SetEventFlg_("BFG_TALK_ACCE", true);
		}
		else{
			// 前置きメッセージチェック(なければ飛ばす)
			if(msg_key != ""){
				ShowMsg_(msg_key);
				KeyInputWait_();
			}
			else{
				// アクセサリー屋(定型文)
				ShowMsg_("MSG_SHOP_ACCE_FLOW_08");
				KeyInputWait_();
			}
		}
		CloseMsgWnd_();
	}
	// アクセサリー屋の機能解禁イベント処理
	else{
		// アクセサリー屋の機能解禁フラグ
		SetEventFlg_("BFG_UNLOCK_ACCESSORY_STRENGTHEN", true);
		SetEventFlg_("BFG_TRAVEL_INFO_SHOW_051", true); // 旅の心得の項目解放フラグ【仲間の育成】アクセサリーの強化
		// メッセージ
		OpenMsgWnd_();
		ShowMsg_("MSG_SHOP_ACCE_FLOW_04");
		KeyInputWait_();
		//CloseMsgWnd_();
		if(GetQueryResult_() == MES_QUERY_YES){
			while(true){
				if(GetQueryResult_() == MES_QUERY_YES){
					//OpenMsgWnd_();
					ShowMsg_("MSG_SHOP_ACCE_FLOW_06_01");
					KeyInputWait_();
					ShowMsg_("MSG_SHOP_ACCE_FLOW_06_02");
					KeyInputWait_();
					ShowMsg_("MSG_SHOP_ACCE_FLOW_06_03");
					KeyInputWait_();
					//CloseMsgWnd_();
				}
				else{
					//OpenMsgWnd_();
					ShowMsg_("MSG_SHOP_ACCE_FLOW_07");
					KeyInputWait_();
					CloseMsgWnd_();
					break;
				}
			}
		}
		else{
			//OpenMsgWnd_();
			ShowMsg_("MSG_SHOP_ACCE_FLOW_05");
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	// アクセサリー屋へ移行
	GotoMenuFadeOpen(MENU_OPEN.ACCESSORY);
	// 戻りメッセージ
	OpenMsgWnd_();
	ShowMsg_("RTN_MSG_SHOP_ACCE");
	KeyInputWait_();
	CloseMsgWnd_();
}

//============================================================================
// ローカル関数：アクセサリ屋機能解禁イベントのチェック関数
//----------------------------------------------------------------------------
// 引数    ：なし
// 戻り値  ：true : 解禁イベントへ / false : 通常
//============================================================================
function uCheckUnlockAcceShop()
{
	// アクセサリー作成回数を取得
	local make_count = GetCreatedAccessoryCounts_();
	
	// ５回以上
	if(make_count >= 5){
		// アクセサリー屋の機能解禁イベントをみていない
		if(GetEventFlg_("BFG_UNLOCK_ACCESSORY_STRENGTHEN") == false){
			return true;
		}
	}
	return false;
}

//============================================================================
// ローカル関数：メダルＱ１回目に話しかけた時の処理 → 擬似デモ[メダルＱ開始]に変更
//----------------------------------------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//============================================================================
function uMedalQuestFirstMsg()
{
	SetEventFlg_("BFG_DUMMY_MEDAL_QUEST_START", true);	// メダルQ解放後、初めて話しかけた
	SetEventFlg_("BFG_DISPLAYED_MEDAL_Q_DEMO", true);	// この擬似デモを２回以上再生させないフラグ

	// 準備
	local player = GetPlayerId_();
	local pl_pos = Vec3(0.000, 2.500, 22.500);
	local pl_dir = 180;
	local rtn_pl_pos = Vec3(0.000, 2.500, 22.500); // 復帰位置
	local wait_frame = 27;
	local king_talk_L = ReadMotion_(g_king, "n003_talk_L"); // キング会話L
	local king_think_to_wait = ReadMotion_(g_king, "n003_stand01"); // キング考える→キング通常待機
	LoadEffect_("EF712_10_EMO_SURPRISE01");			// 「！」
	// 暗転
	CommChangeMomentFadeOut(FADE_COLOR_BLACK);
	// 主人公をモンスターの真正面に配置
	SetPos_(player, pl_pos);
	SetDir_(player, pl_dir);
	// カメラをデフォルト値に戻す
	SetPlayableCamera_();
	// キング考え中
	local king_think_L = ReadMotion_(g_king, "n003_think_L");
	SetMotion_(g_king, king_think_L, BLEND_N);
	// 準備が終わったので暗転解除
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
	// メッセージ
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("MSG_MEDALQ_START_00");		//「さて どうしたものか……
	KeyInputWait_();
	CloseMsgWnd_();
	
	// 振り向いて、主人公に気づく
	SetMotion_(g_king, king_think_to_wait, BLEND_L);
	SetMotionSpeed_(g_king, 1);
	WaitMotion(g_king);
	SetMotion_(g_king, MOT_WAIT, BLEND_L);
	SetMotionSpeed_(g_king, 1);
	local task_king = Task_ChangeMotion_(g_king, king_talk_L, BLEND_L);
	Wait_(BLEND_L);
	SurpriseDisp(g_king);	// 「！」マークを出す共通処理
	Wait_(5);
	
	// キング会話
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("MSG_MEDALQ_START_01");		//「おおっ！？
	KeyInputWait_();
	ShowMsg_("MSG_MEDALQ_START_02");		//「そこで 世界を旅する そちに頼みたい。
	KeyInputWait_();
	CloseMsgWnd_();
	DeleteTask_(task_king);
	SetMotion_(g_king, MOT_WAIT, BLEND_L);
	
	// 非常駐モーション読込(主人公うなずき)
	Wait_(15);
	local nod = ReadMotion_(player, "Player_nod");
	SetMotion_(player, nod, BLEND_M); // 主人公がうなずく
	Wait_(wait_frame);
	
	// 暗転
	SetFade_(FADE_OUT , FADE_COLOR_BLACK, 15);
	Wait_(20);
	
	// ちいさなメダルアイコンを表示させる
	SetEventFlg_("BFG_MAP_ICON_037", true); // アイコン
	
	// キングの設定を元に戻す
	SetTalkCameraType_(g_king, TALK_CAMERA_UP);
	SetTalkEnable_(g_king, true);
	
	// 全滅復帰とDemo132[チョーマッハとの再会]と擬似デモ[メダルＱ開始]が重ならないようにする<2次DB #2738>
	SetEventFlg_("BFG_CHECK_SAME_TIME_DEAD_AND_DEMO_3", true); // アイコン
	
	// フェードイン
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
}


//======================================================
// ローカル関数：メダルＱ処理
//------------------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//======================================================
function uMedalQuest()
{
	local medal_num			 = GetNumFlg_("NUM_SUBEVENT_MEDAL");	// Num25 達成枚数段階チェック
	local itemNum			 = GetItemNum_(60);			// アイテム「ちいさなメダル」の個数取得
	local send_num			 = GetSendMedalCount_();	// 今まで渡した数
	local bit_mq_150clear	 = GetEventFlg_("BFG_DUMMY_MEDAL_QUEST_GET_150");	// メダルQ 150枚達成
	local bit_type_a_item	 = GetEventFlg_("BFG_DUMMY_MEDAL_QUEST_TYPE_A");	// 報酬Ａタイプ

	// uMedalQuestFlow()内でフラグを切替えたかチェック
	if(medal_msg_flg == false){
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_KING");
	}
	ShowMsg_("MSG_MEDALQ_000");			//「 <name_player/>よ。ちいさなメダルは　持ってまいったか？
	KeyInputWait_();
	medal_msg_flg = false;				// フラグを元に戻す
	
	if(bit_mq_150clear == true){		// メダルQ 150枚達成
		if(bit_type_a_item == false){	// 報酬 = 宝石
			if(itemNum > 4 ){
				ShowMsg_("MSG_MEDALQ_150_5CLEAR_00");		//「うむ……そちは ちいさなメダルを
				KeyInputWait_();

				// 「はい」
				if (GetQueryResult_() == QUERY2_0) {
					SetEventFlg_("BFG_DUMMY_MEDAL_QUEST_TYPE_A", true);	// 報酬 -> カラーフォンデュ
					AddItem_(60, -5);				// 「ちいさなメダル」を所持アイテムから減らす

					ShowMsg_("MSG_MEDALQ_150_5CLEAR_YES");	//「よかろう。では メダル５枚の ほうびとして
					KeyInputWait_();
					CloseMsgWnd_();
				
					local random_a = GetRandom_(5);
					switch (random_a) {
					case   0 :
						AddItemAndMsg(MQ_EX_A1_REWARD_ITEM_ID, 1, false)	// レッドオーブ
						break;
					case   1 :
						AddItemAndMsg(MQ_EX_A2_REWARD_ITEM_ID, 1, false)	// ブルーオーブ
						break;
					case   2 :
						AddItemAndMsg(MQ_EX_A3_REWARD_ITEM_ID, 1, false)	// イエローオーブ
						break;
					case   3 :
						AddItemAndMsg(MQ_EX_A4_REWARD_ITEM_ID, 1, false)	// グリーンオーブ
						break;
					case   4 :
						AddItemAndMsg(MQ_EX_A5_REWARD_ITEM_ID, 1, false)	// パープルオーブ
						break;
					}
					OpenMsgWnd_();
					SetTalkName_("NAME_TAG_KING");
					ShowMsg_("MSG_MEDALQ_150_5CLEAR_01");		//「宝石は ５種類 用意してある。
					KeyInputWait_();
					CloseMsgWnd_();
				}
				// 「いいえ」
				else{
					ShowMsg_("MSG_MEDALQ_150_5CLEAR_NO");		// 「う……ううむ そうか……。
					KeyInputWait_();
					CloseMsgWnd_();
				}
			} else {
				ShowMsg_("MSG_MEDALQ_150_5UNDER");		//「ちいさなメダルを 集めてくれた ほうびに
				KeyInputWait_();
				CloseMsgWnd_();
			}
		} else {
			if(itemNum > 9 ){
				ShowMsg_("MSG_MEDALQ_150_10CLEAR_00");		//「うむ……そちは ちいさなメダルを
				KeyInputWait_();

				// 「はい」
				if (GetQueryResult_() == QUERY2_0) {
					SetEventFlg_("BFG_DUMMY_MEDAL_QUEST_TYPE_A", false);	// 報酬 -> 宝石
					AddItem_(60, -10);				// 「ちいさなメダル」を所持アイテムから減らす

					ShowMsg_("MSG_MEDALQ_150_10CLEAR_YES");	//「よかろう。では メダル１０枚の ほうびとして
					KeyInputWait_();
					CloseMsgWnd_();
				
					local random_b = GetRandom_(2);
					switch (random_b) {
					case   0 :
						uGetMonsMsgAndNameWindow(MQ_EX_B1_REWARD_MONS_ID, 2606);	// カラーフォンデュ（白）
						break;
					case   1 :
						uGetMonsMsgAndNameWindow(MQ_EX_B2_REWARD_MONS_ID, 2607);	// カラーフォンデュ（黒）
						break;
					}
					
					OpenMsgWnd_();
					SetTalkName_("NAME_TAG_KING");
					ShowMsg_("MSG_MEDALQ_150_10CLEAR_01");		//「これからも がんばるのだ <name_player/>。
					KeyInputWait_();
					CloseMsgWnd_();
				}
				// 「いいえ」
				else{
					ShowMsg_("MSG_MEDALQ_150_10CLEAR_NO");		// 「う……ううむ そうか……。
					KeyInputWait_();
					CloseMsgWnd_();
				}
			} else {
				ShowMsg_("MSG_MEDALQ_150_10UNDER");		//「ちいさなメダルを 集めてくれた ほうびに
				KeyInputWait_();
				CloseMsgWnd_();
			}
		}
	} else {
		if(send_num == 0){
			if(itemNum == 0){
				ShowMsg_("MSG_MEDALQ_002");		//「ふむ……そちからは まだ １枚も
				KeyInputWait_();
				CloseMsgWnd_();
			} else {
				uGetMedalQ();
			}
		} else {
			local maisu;
			local medal_num	 = GetNumFlg_("NUM_SUBEVENT_MEDAL");	// Num25 達成枚数段階チェック
			if(medal_num ==  0){ maisu =   5; }
			if(medal_num ==  1){ maisu =  10; }
			if(medal_num ==  2){ maisu =  15; }
			if(medal_num ==  3){ maisu =  20; }
			if(medal_num ==  4){ maisu =  30; }
			if(medal_num ==  5){ maisu =  40; }
			if(medal_num ==  6){ maisu =  50; }
			if(medal_num ==  7){ maisu =  60; }
			if(medal_num ==  8){ maisu =  75; }
			if(medal_num ==  9){ maisu = 100; }
			if(medal_num == 10){ maisu = 125; }
			if(medal_num == 11){ maisu = 150; }
			if(itemNum == 0){
				SetExchangeNumber_(send_num);
				SetExchangeNumber_(maisu);
				uTasseiHoushu();
				
				// 報酬が モンスター の場合
				if (uMedalQJudgeReward() == MQ_REWARD_MONSTER) {
					ShowMsg_("MSG_MEDALQ_001_1");		//「これまでに そちからは <exchange/>枚
				}
				// 報酬が アイテム の場合
				else {
					ShowMsg_("MSG_MEDALQ_001_2");		//「これまでに そちからは <exchange/>枚
				}
				
				KeyInputWait_();
				CloseMsgWnd_();
			} else {
				uGetMedalQ();
			}
		}
	}
}


//======================================================
// ローカル関数：メダルQ処理
//------------------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//======================================================
function uGetMedalQ()
{
	local itemNum		 = GetItemNum_(60);			// アイテム「ちいさなメダル」の個数取得
	AddSendMedalCount_(itemNum);		// 所持しているメダルを、「渡した数」に追加
	AddItem_(60, -itemNum);				// 渡した分の「ちいさなメダル」を所持アイテムから減らす
	local send_num		 = GetSendMedalCount_();	// 今まで渡した数
	local maisu;
	local medal_num	 = GetNumFlg_("NUM_SUBEVENT_MEDAL");	// Num25 達成枚数段階チェック
	
	if(medal_num ==  0){ maisu =   5; }
	if(medal_num ==  1){ maisu =  10; }
	if(medal_num ==  2){ maisu =  15; }
	if(medal_num ==  3){ maisu =  20; }
	if(medal_num ==  4){ maisu =  30; }
	if(medal_num ==  5){ maisu =  40; }
	if(medal_num ==  6){ maisu =  50; }
	if(medal_num ==  7){ maisu =  60; }
	if(medal_num ==  8){ maisu =  75; }
	if(medal_num ==  9){ maisu = 100; }
	if(medal_num == 10){ maisu = 125; }
	if(medal_num == 11){ maisu = 150; }
	//達成枚数以下
	if(send_num < maisu){
		SetExchangeNumber_(send_num);
		SetExchangeNumber_(maisu);
		uTasseiHoushu();
		
		// 報酬が モンスター の場合
		if (uMedalQJudgeReward() == MQ_REWARD_MONSTER) {
			ShowMsg_("MSG_MEDALQ_003_1");		//「む！ メダルを 手に入れてくれたのであるな。
		}
		// 報酬が アイテム の場合
		else {
			ShowMsg_("MSG_MEDALQ_003_2");		//「む！ メダルを 手に入れてくれたのであるな。
		}
		
		KeyInputWait_();
		CloseMsgWnd_();
		
	//達成枚数以上
	} else {
		if(send_num >= 150){
			SetExchangeNumber_(150);
		} else {
			SetExchangeNumber_(send_num);
		}
		ShowMsg_("MSG_MEDALQ_004");		//「む！ メダルを 手に入れてくれたのであるな。
		KeyInputWait_();

		//預けたメダルが次の達成枚数以上か
		local flag = GetNumFlg_("NUM_SUBEVENT_MEDAL");
		//ループさせる
		while(1){
			local maisu;
			local medal_num	 = GetNumFlg_("NUM_SUBEVENT_MEDAL");	// Num25 達成枚数段階チェック
			if(medal_num ==  0){ maisu =   5; }
			if(medal_num ==  1){ maisu =  10; }
			if(medal_num ==  2){ maisu =  15; }
			if(medal_num ==  3){ maisu =  20; }
			if(medal_num ==  4){ maisu =  30; }
			if(medal_num ==  5){ maisu =  40; }
			if(medal_num ==  6){ maisu =  50; }
			if(medal_num ==  7){ maisu =  60; }
			if(medal_num ==  8){ maisu =  75; }
			if(medal_num ==  9){ maisu = 100; }
			if(medal_num == 10){ maisu = 125; }
			if(medal_num == 11){ maisu = 150; }
			if(medal_num == 12){
				if(send_num >= 150){
					SetEventFlg_("BFG_DUMMY_MEDAL_QUEST_GET_150", true);	// メダルQ 150枚達成
					if(send_num > 150){						// 150で入ってきてしまうと、渡す個数が0になってしまうので
						AddItem_(60, send_num -150);		// 達成枚数以上のメダルを返却
					}
					
					ShowMsg_("MSG_MEDALQ_150CLEAR");		// 「<name_player/> そちのおかげで
					KeyInputWait_();
					
					ShowMsg_("MSG_MEDALQ_150CLEAR_02");		// 「宝石も カラーフォンデュも 何色のものが
					KeyInputWait_();
					CloseMsgWnd_();
					break;
				}
			}
			if(send_num >= maisu){
				uTasseiHoushu();
				
				// 報酬が モンスター の場合
				if (uMedalQJudgeReward() == MQ_REWARD_MONSTER) {
					ShowMsg_("MSG_MEDALQ_005_1");		// 「約束したとおり　ほうびを　授けよう。
				}
				// 報酬が アイテム の場合
				else {
					ShowMsg_("MSG_MEDALQ_005_2");		// 「約束したとおり　ほうびを　授けよう。
				}
				
				KeyInputWait_();
				CloseMsgWnd_();
				
				flag = flag + 1;
				//報酬（アイテム・モンスター）ゲット処理
				switch(medal_num){
				case 0 :
					AddAccessoryAndMsg(MQ_01_REWARD_ACCE_ID, 1, EQUIP_GRADE.GRADE_1);	// 疾風のバンダナ★
					break;
				case 1 :
					AddAccessoryAndMsg(MQ_02_REWARD_ACCE_ID, 1, EQUIP_GRADE.GRADE_1);	// 幸運のリング★
					break;
				case 2 :
					uGetMonsMsgAndNameWindow(MQ_03_REWARD_MONS_ID, MQ_03_PARAM_ID);		// メタルスライム
					break;
				case 3 :
					AddAccessoryAndMsg(MQ_04_REWARD_ACCE_ID, 1, EQUIP_GRADE.GRADE_1);	// まばゆいリング★
					break;
				case 4 :
					uGetMonsMsgAndNameWindow(MQ_05_REWARD_MONS_ID, MQ_05_PARAM_ID);		// はぐれメタル
					break;
				case 5 :
					AddAccessoryAndMsg(MQ_06_REWARD_ACCE_ID, 1, EQUIP_GRADE.GRADE_1);	// はたらきのおまもり★
					break;
				case 6 :
					uGetMonsMsgAndNameWindow(MQ_07_REWARD_MONS_ID, MQ_07_PARAM_ID);		// メタルキング
					break;
				case 7 :
					AddAccessoryAndMsg(MQ_08_REWARD_ACCE_ID, 1, EQUIP_GRADE.GRADE_1);	// 招きのリング★
					break;
				case 8 :
					AddAccessoryAndMsg(MQ_09_REWARD_ACCE_ID, 1, EQUIP_GRADE.GRADE_1);	// ごうけつのうでわ★
					break;
				case 9 :
					uGetMonsMsgAndNameWindow(MQ_10_REWARD_MONS_ID, MQ_10_PARAM_ID);		// ゴールデンスライム
					break;
				case 10 :
					AddAccessoryAndMsg(MQ_11_REWARD_ACCE_ID, 1, EQUIP_GRADE.GRADE_2);	// 忠誠のチョーカー★★
					break;
				case 11 :
					uGetMonsMsgAndNameWindow(MQ_12_REWARD_MONS_ID, MQ_12_PARAM_ID);		// プラチナキング
					break;
				default :
					//-----;
					break;
				}
				SetNumFlg_("NUM_SUBEVENT_MEDAL", flag);	// Num25 フラグを１進める
				
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_KING");
			} else {
				SetExchangeNumber_(maisu);
				uTasseiHoushu();
				
				// 報酬が モンスター の場合
				if (uMedalQJudgeReward() == MQ_REWARD_MONSTER) {
					ShowMsg_("MSG_MEDALQ_NEXT_1");		//「次は <exchange/>枚になったとき ほうびとして
				}
				// 報酬が アイテム の場合
				else {
					ShowMsg_("MSG_MEDALQ_NEXT_2");		//「次は <exchange/>枚になったとき ほうびとして
				}
				
				KeyInputWait_();
				CloseMsgWnd_();
				break;
			}
		}
	}
}


//======================================================
// ローカル関数：メダルＱ報酬アイテム・モンスターID
//------------------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//======================================================
function uTasseiHoushu()
{
	local medal_num			 = GetNumFlg_("NUM_SUBEVENT_MEDAL");	// Num25 達成枚数段階チェック

	switch(medal_num){
	case 0 :
		SetExchangeItemName_(MQ_01_REWARD_ACCE_ID);			// 疾風のバンダナ★
		break;
	case 1 :
		SetExchangeItemName_(MQ_02_REWARD_ACCE_ID);			// ねむりの攻印
		break;
	case 2 :
		SetExchangeMonsterKindName_(MQ_03_REWARD_MONS_ID);	// メタルスライム
		break;
	case 3 :
		SetExchangeItemName_(MQ_04_REWARD_ACCE_ID);			// まばゆいリング★
		break;
	case 4 :
		SetExchangeMonsterKindName_(MQ_05_REWARD_MONS_ID);	// はぐれメタル
		break;
	case 5 :
		SetExchangeItemName_(MQ_06_REWARD_ACCE_ID);			// 追撃の小鈴 
		break;
	case 6 :
		SetExchangeMonsterKindName_(MQ_07_REWARD_MONS_ID);	// メタルキング
		break;
	case 7 :
		SetExchangeItemName_(MQ_08_REWARD_ACCE_ID);			// 招きのリング★
		break;
	case 8 :
		SetExchangeItemName_(MQ_09_REWARD_ACCE_ID);			// 活気の鈴
		break;
	case 9 :
		SetExchangeMonsterKindName_(MQ_10_REWARD_MONS_ID);	// プラチナキング
		break;
	case 10 :
		SetExchangeItemName_(MQ_11_REWARD_ACCE_ID);			// 忠誠のチョーカー★★
		break;
	case 11 :
		SetExchangeMonsterKindName_(MQ_12_REWARD_MONS_ID);	// ゴールデンスライム
		break;
	default :
		//-----;
		break;
	}
}


//======================================================
// ローカル関数：メダルＱ報酬区分判定処理
//------------------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//======================================================
function uMedalQJudgeReward()
{
	local medal_num	 = GetNumFlg_("NUM_SUBEVENT_MEDAL");	// Num25 達成枚数段階チェック
	local reward	 = MQ_REWARD_NONE;						// 報酬区分
	
	switch(medal_num){
	case 0 :
		reward = MQ_REWARD_ITEM;
		break;
	case 1 :
		reward = MQ_REWARD_ITEM;
		break;
	case 2 :
		reward = MQ_REWARD_MONSTER;
		break;
	case 3 :
		reward = MQ_REWARD_ITEM;
		break;
	case 4 :
		reward = MQ_REWARD_MONSTER;
		break;
	case 5 :
		reward = MQ_REWARD_ITEM;
		break;
	case 6 :
		reward = MQ_REWARD_MONSTER;
		break;
	case 7 :
		reward = MQ_REWARD_ITEM;
		break;
	case 8 :
		reward = MQ_REWARD_ITEM;
		break;
	case 9 :
		reward = MQ_REWARD_MONSTER;
		break;
	case 10 :
		reward = MQ_REWARD_ITEM;
		break;
	case 11 :
		reward = MQ_REWARD_MONSTER;
		break;
	default :
		//-----;
		break;
	}
	
	return reward;
}


//============================================================================
// ローカル関数：モンスターＧＥＴ時のメッセージ、名付け画面表示の関数
//----------------------------------------------------------------------------
// 引数    ：モンスター種族ＩＤ
// 引数    ：モンスターパラメーター敵ＩＤ
// 戻り値  ：なし
//============================================================================
function uGetMonsMsgAndNameWindow(kind_id , pa_id)
{
	// 預り所の空き枠チェック
	local residue = GetFreeMonsterNum_();
	local empty_num = 0;
	if(residue <= empty_num){
		while(true){
			// ナビマップを非表示
			SetNavimapVisible_(false);
			// 仮メッセージ(システムメッセージ)
			OpenMsgWnd_();
			ShowMsg_("MSG_MEDALQ_NOT_EMPTY_001");
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
	}
	
	SetExchangeMonsterKindName_(kind_id);			// モンスター種族ＩＤ
	
	OpenMsgWnd_();
	ShowMsg_("MSG_MEDALQ_GET_MONATER");//<exchange/>が 仲間になった！
	PlayMe_("ME_010");			// 重要アイテム入手ME
	WaitMe_();
	KeyInputWait_();
	CloseMsgWnd_();
	
	local tsk_named_wnd = Task_AddFellow_(pa_id, false);	// モンスターパラメーター敵ＩＤ
	WaitTask(tsk_named_wnd);

	SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, FADE_SHORT);
	WaitFade_();
}


//======================================================
// ローカル関数：スカウトＱ処理
//------------------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//======================================================
function uScoutQuest()
{
	scoutq_num         = GetNumFlg_(sq_num_sub);       // Num22 問題進行フラグ
	scoutq_mission_now = GetEventFlg_(sq_mission_now); // Bit2011 出題中

	//話し始める前に一泊の間
	Wait_(10);

	switch (scoutq_num) {
	case   0 :
		if(scoutq_mission_now == false){
			SetEventFlg_("BFG_CHECK_SCOUT_MSG_FIRST", true);
			// クエスト初回導入メッセージ
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_NOCHORIN");
			ShowMsg_("MSG_CITY_AFTER_MOB_A_INTRODUCTION_01_1");
			KeyInputWait_();
			ShowMsg_("MSG_CITY_AFTER_MOB_A_INTRODUCTION_01_2");
			KeyInputWait_();
			
			// クエストスタート
			SetEventFlg_(sq_mission_now, true);								// Bit = 2011 出題中
			
			PlayMe_("SE_FLD_124");					// 出題ジャジャジャン( 再生方法をSE再生からME再生に変更<Redmine#2834> )
			WaitMe_();
			
			ShowMsg_("MSG_SCOUTQ_01_01");			//「ＨＰ回復というスキルを持った
			KeyInputWait_();
			ShowMsg_("MSG_SCOUTQ_DESCRIPTION");		//「もしも　指定の魔物を　仲間にできたら
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else {
			// 確認メッセージ表示
			uScoutQuest_Confirm("MSG_SCOUTQ_01_AFTER_00");	//「ＨＰ回復というスキルを持った
			
			// ＨＰ回復のメイジドラキーを所持しているかの判定処理
			if(uCheckSQ01() == false){
				// 不正解メッセージ表示
				uScoutQuest_Mistake("MSG_SCOUTQ_01_NOTCLEAR");
				
			} else {
				SetNumFlg_(sq_num_sub, 1);									// Num22 <- 1
				SetEventFlg_(sq_mission_now, false);						// Bit = 2011 出題中
				
				PlaySE_("SE_FLD_125");				// 正解ピンポーン
				Wait_(30);
				
				SetMotion_(g_n_man01, MOT_TALKLOOP, BLEND_XL);
				
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_NOCHORIN");
				ShowMsg_("MSG_SCOUTQ_01_CLEAR_MSG");//「メイジドラキーを　連れてきたっちょね。
				KeyInputWait_();
				ShowMsg_("MSG_SCOUTQ_CLEAR_01");	//「それじゃ　クエストクリアの
				KeyInputWait_();
				CloseMsgWnd_();
				
				SetMotion_(g_n_man01, "WAIT", BLEND_M);
				
				AddItemAndMsgSQ1(37, 1, false);		// ふしぎなきのみ
				
				SetMotion_(g_n_man01, "TALKLOOP", BLEND_M);
				
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_NOCHORIN");
				ShowMsg_("MSG_SCOUTQ_CLEAR_02");	//「さあ！　スカウトＱは　まだまだ　あるっちょ！
				KeyInputWait_();
				CloseMsgWnd_();
			}
		}
		break;
	case   1 :
		if(scoutq_mission_now == false){
			uMissionStartMsg("MSG_SCOUTQ_02_00" , "MSG_SCOUTQ_02_01");
		}
		else {
			uScoutQuest_Confirm("MSG_SCOUTQ_02_AFTER_00");		//「プリーストナイトを
			
			// プリーストナイトを所持しているかの判定処理
			if(uCheckSQ02() == false){
				uScoutQuest_Mistake("MSG_SCOUTQ_02_NOTCLEAR");	//「だめだちょ。
				
			} else {
				SetNumFlg_(sq_num_sub, 2);									// Num22 <- 2
				SetEventFlg_(sq_mission_now, false);						// Bit = 2011 出題中
				
				PlaySE_("SE_FLD_125");				// 正解ピンポーン
				Wait_(30);
				
				SetMotion_(g_n_man01, MOT_TALKLOOP, BLEND_XL);
				
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_NOCHORIN");
				ShowMsg_("MSG_SCOUTQ_02_CLEAR_MSG");//「プリーストナイトを　連れてきたっちょね。
				KeyInputWait_();
				ShowMsg_("MSG_SCOUTQ_CLEAR_A");		//「それじゃ　お楽しみの　ごほうびっちょ。
				KeyInputWait_();
				CloseMsgWnd_();
				
				SetMotion_(g_n_man01, "WAIT", BLEND_M);
				
				PlaySE_("SE_FLD_135");				// リアクター音
				Wait_(30);
				
				// リアクター機能[ もっとくわしく ]の解放
				SetEventFlg_("BFG_REACTOR_UNLOCK_ANALYZE", true);			// Bit = 70 アナライズ情報の拡張機能の解放（もっとくわしく）
				SetEventFlg_("BFG_TRAVEL_INFO_SHOW_038", true);				// 旅の心得の項目解放フラグ	【フィールド】アナライズ
				
				// システムメッセージ
				OpenMsgWnd_();
				ShowMsg_("MSG_SCOUTQ_CLEAR_A_A_01");// リアクター拡張パーツαを　もらった！
				PlayMe_("ME_010");					// 重要アイテム入手ME
				WaitMe_();
				KeyInputWait_();
				ShowMsg_("MSG_SCOUTQ_CLEAR_A_A_03");// リアクター拡張パーツαを　組み込んでみた！
				KeyInputWait_();
				ShowMsg_("MSG_SCOUTQ_02_CLEAR_1");	// リアクター機能[ もっとくわしく ]
				KeyInputWait_();
				CloseMsgWnd_();
				
				SetMotion_(g_n_man01, "TALKLOOP", BLEND_M);
				
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_NOCHORIN");
				ShowMsg_("MSG_SCOUTQ_CLEAR_A_A_02");//「リアクターに　パーツを組みこんだことで
				KeyInputWait_();
				ShowMsg_("MSG_SCOUTQ_CLEAR_02");	//「さあ！　スカウトＱは　まだまだ　あるっちょ！
				KeyInputWait_();
				CloseMsgWnd_();
			}
		}
		break;
	case   2 :
		if(scoutq_mission_now == false){
			uMissionStartMsg("MSG_SCOUTQ_03_00" , "MSG_SCOUTQ_03_01");
		}
		else {
			uScoutQuest_Confirm("MSG_SCOUTQ_03_AFTER_00");		//「スライム系の魔物を４体　ずらっと
			
			// スライム系４種スタンバイにあつめたかの判定処理
			if(uCheckSQ03() == false){
				uScoutQuest_Mistake("MSG_SCOUTQ_03_NOTCLEAR");	//「だめだちょ。
				
			} else {
				SetNumFlg_(sq_num_sub, 3);									// Num22 <- 3
				SetEventFlg_(sq_mission_now, false);						// Bit = 2011 出題中
				
				PlaySE_("SE_FLD_125");				// 正解ピンポーン
				Wait_(30);
				
				SetMotion_(g_n_man01, MOT_TALKLOOP, BLEND_XL);
				
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_NOCHORIN");
				ShowMsg_("MSG_SCOUTQ_03_CLEAR_MSG");//「スライム系の魔物を　そろえてきたっちょね。
				KeyInputWait_();
				ShowMsg_("MSG_SCOUTQ_CLEAR_01");	//「それじゃ　クエストクリアの
				KeyInputWait_();
				CloseMsgWnd_();
				
				SetMotion_(g_n_man01, "WAIT", BLEND_M);
				
				AddItemAndMsgSQ1(8, 1, false);		// けんじゃのせいすい
				
				SetMotion_(g_n_man01, "TALKLOOP", BLEND_M);
				
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_NOCHORIN");
				ShowMsg_("MSG_SCOUTQ_CLEAR_02");	//「さあ！　スカウトＱは　まだまだ　あるっちょ！
				KeyInputWait_();
				CloseMsgWnd_();
			}
		}
		break;
	case   3 :
		// 凍骨の氷原に到着していないときは始まらない( 2次DB #1309 )
		if(GetEventFlg_("BFG_SCENARIO_CLEAR_GRAVE") == false){	// 霊道クリアフラグのチェック
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_NOCHORIN");			// ノチョリン
			ShowMsg_("MSG_SCOUTQ_04_00");				//「それじゃあ　スカウトＱ！
			KeyInputWait_();
			ShowMsg_("MSG_SCOUTQ_SINARIO_CLEAR_BEFORE");//「……と思ったけど
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else{
			if(scoutq_mission_now == false){
				uMissionStartMsg("MSG_SCOUTQ_04_00" , "MSG_SCOUTQ_04_01");
			}
			else {
				uScoutQuest_Confirm("MSG_SCOUTQ_04_AFTER_00");		//「エルダードラゴンを
				
				// エルダードラゴンを所持しているかの判定処理
				if(uCheckSQ04() == false){
					uScoutQuest_Mistake("MSG_SCOUTQ_04_NOTCLEAR");	//「だめだちょ。
					
				} else {
					SetNumFlg_(sq_num_sub, 4);									// Num22 <- 4
					SetEventFlg_(sq_mission_now, false);						// Bit = 2011 出題中
					
					PlaySE_("SE_FLD_125");				// 正解ピンポーン
					Wait_(30);
					
					SetMotion_(g_n_man01, MOT_TALKLOOP, BLEND_XL);
					
					OpenMsgWnd_();
					SetTalkName_("NAME_TAG_NOCHORIN");
					ShowMsg_("MSG_SCOUTQ_04_CLEAR_MSG");//「エルダードラゴンを　連れてきたっちょね。
					KeyInputWait_();
					ShowMsg_("MSG_SCOUTQ_CLEAR_A");		//「それじゃ　お楽しみの　ごほうびっちょ。
					KeyInputWait_();
					CloseMsgWnd_();
					
					SetMotion_(g_n_man01, "WAIT", BLEND_M);
					
					PlaySE_("SE_FLD_135");				// リアクター音
					Wait_(30);
					
					// リアクター機能[ カラー転生 ]の解放
					SetEventFlg_("BFG_REACTOR_UNLOCK_MAGICSOURCE", true);		// Bit = 71 
					// 旅の心得の項目解放フラグ	【フィールド】突然変異に出会うコツ
					SetEventFlg_("BFG_TRAVEL_INFO_SHOW_069", true);				// Bit = 569
					
					// システムメッセージ
					OpenMsgWnd_();
					ShowMsg_("MSG_SCOUTQ_CLEAR_A_B_01");// リアクター拡張パーツβを　もらった！
					PlayMe_("ME_010");					// 重要アイテム入手ME
					WaitMe_();
					KeyInputWait_();
					ShowMsg_("MSG_SCOUTQ_CLEAR_A_B_03");// リアクター拡張パーツβを　組み込んでみた！
					KeyInputWait_();
					ShowMsg_("MSG_SCOUTQ_04_CLEAR_4");	// リアクター機能[ カラー転生 ]
					KeyInputWait_();
					CloseMsgWnd_();
					
					SetMotion_(g_n_man01, "TALKLOOP", BLEND_M);
					
					OpenMsgWnd_();
					SetTalkName_("NAME_TAG_NOCHORIN");
					ShowMsg_("MSG_SCOUTQ_CLEAR_A_B_02");//「リアクターに　パーツを組みこんだことで
					KeyInputWait_();
					ShowMsg_("MSG_SCOUTQ_CLEAR_02");	//「さあ！　スカウトＱは　まだまだ　あるっちょ！
					KeyInputWait_();
					CloseMsgWnd_();
				}
			}
		}
		break;
	case   4 :
		if(scoutq_mission_now == false){
			uMissionStartMsg("MSG_SCOUTQ_05_00" , "MSG_SCOUTQ_05_01");
		}
		else {
			uScoutQuest_Confirm("MSG_SCOUTQ_05_AFTER_00");		//「スキル名の後ろに　ＥＸ　と　ついたスキルを
			
			// カラー転生したモンスターを所持しているかの判定処理
			if(uCheckSQ05() == false){
				uScoutQuest_Mistake("MSG_SCOUTQ_05_NOTCLEAR");	//「だめだちょ。
				
			} else {
				SetNumFlg_(sq_num_sub, 5);									// Num22 <- 5
				SetEventFlg_(sq_mission_now, false);						// Bit = 2011 出題中
				
				PlaySE_("SE_FLD_125");				// 正解ピンポーン
				Wait_(30);
				
				SetMotion_(g_n_man01, MOT_TALKLOOP, BLEND_XL);
				
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_NOCHORIN");
				ShowMsg_("MSG_SCOUTQ_05_CLEAR_MSG");//「身体の色がちがう魔物を　連れてきたっちょね。
				KeyInputWait_();
				ShowMsg_("MSG_SCOUTQ_CLEAR_01");	//「それじゃ　クエストクリアの
				KeyInputWait_();
				CloseMsgWnd_();
				
				SetMotion_(g_n_man01, "WAIT", BLEND_M);
				
				AddItemAndMsgSQ1(10, 1, false);		// せかいじゅのは
				
				SetMotion_(g_n_man01, "TALKLOOP", BLEND_M);
				
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_NOCHORIN");
				ShowMsg_("MSG_SCOUTQ_CLEAR_02");	//「さあ！　スカウトＱは　まだまだ　あるっちょ！
				KeyInputWait_();
				CloseMsgWnd_();
			}
		}
		break;
	case   5 :
		if(scoutq_mission_now == false){
			uMissionStartMsg("MSG_SCOUTQ_06_00" , "MSG_SCOUTQ_06_01");
		}
		else {
			uScoutQuest_Confirm("MSG_SCOUTQ_06_AFTER_00");		//「プラス値が　＋２５以上の魔物を
			
			// プラス値が25以上のモンスターを所持しているかの判定処理
			if(uCheckSQ06() == false){
				uScoutQuest_Mistake("MSG_SCOUTQ_06_NOTCLEAR");	//「だめだちょ。
				
			} else {
				SetNumFlg_(sq_num_sub, 6);									// Num22 <- 6
				SetEventFlg_(sq_mission_now, false);						// Bit = 2011 出題中
				
				PlaySE_("SE_FLD_125");				// 正解ピンポーン
				Wait_(30);
				
				SetMotion_(g_n_man01, MOT_TALKLOOP, BLEND_XL);
				
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_NOCHORIN");
				ShowMsg_("MSG_SCOUTQ_06_CLEAR_MSG");//「おおっ！　プラス値が２５以上の魔物っちょ！
				KeyInputWait_();
				ShowMsg_("MSG_SCOUTQ_CLEAR_A");		//「それじゃ　お楽しみの　ごほうびっちょ。
				KeyInputWait_();
				CloseMsgWnd_();
				
				SetMotion_(g_n_man01, "WAIT", BLEND_M);
				
				PlaySE_("SE_FLD_135");				// リアクター音
				Wait_(30);
				
				// リアクター機能[ 時空の裂け目サーチ ]の解放
				SetEventFlg_("BFG_REACTOR_UNLOCK_CRACK_SONAR_1", true);	// Bit = 74 アクティブソナー(時空の裂け目)の解放
				SetEventFlg_("BFG_TRAVEL_INFO_SHOW_043", true);			// 旅の心得の項目解放フラグ【フールド】時空の裂け目
				
				// システムメッセージ
				OpenMsgWnd_();
				ShowMsg_("MSG_SCOUTQ_CLEAR_A_C_01");// リアクター拡張パーツγを　もらった！
				PlayMe_("ME_010");					// 重要アイテム入手ME
				WaitMe_();
				KeyInputWait_();
				ShowMsg_("MSG_SCOUTQ_CLEAR_A_C_03");// リアクター拡張パーツγを　組み込んでみた！
				KeyInputWait_();
				ShowMsg_("MSG_SCOUTQ_06_CLEAR");	// リアクター機能[ 時空の裂け目サーチ ]
				KeyInputWait_();
				CloseMsgWnd_();
				
				SetMotion_(g_n_man01, "TALKLOOP", BLEND_M);
				
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_NOCHORIN");
				ShowMsg_("MSG_SCOUTQ_CLEAR_A_C_02");//「リアクターに　パーツを組みこんだことで
				KeyInputWait_();
				ShowMsg_("MSG_SCOUTQ_CLEAR_02");	//「さあ！　スカウトＱは　まだまだ　あるっちょ！
				KeyInputWait_();
				CloseMsgWnd_();
			}
		}
		break;
	case   6 :
		// 黒鉄の監獄塔に到着していないときは始まらない( 2次DB #1340 )
		if(GetEventFlg_("BFG_SCENARIO_CLEAR_ICE") == false){// 氷原クリアフラグのチェック
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_NOCHORIN");			// ノチョリン
			ShowMsg_("MSG_SCOUTQ_07_00");				//「それじゃあ　スカウトＱ！
			KeyInputWait_();
			ShowMsg_("MSG_SCOUTQ_SINARIO_CLEAR_BEFORE");//「……と思ったけど
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else{
			if(scoutq_mission_now == false){
				uMissionStartMsg("MSG_SCOUTQ_07_00" , "MSG_SCOUTQ_07_01");
			}
			else {
				uScoutQuest_Confirm("MSG_SCOUTQ_07_AFTER_00");		//「ガネーシャエビルを
				
				// ガネーシャエビルを所持しているかの判定処理
				if(uCheckSQ07() == false){
					uScoutQuest_Mistake("MSG_SCOUTQ_07_NOTCLEAR");	//「だめだちょ。
					
				} else {
					SetNumFlg_(sq_num_sub, 7);									// Num22 <- 7
					SetEventFlg_(sq_mission_now, false);						// Bit = 2011 出題中
					
					PlaySE_("SE_FLD_125");				// 正解ピンポーン
					Wait_(30);
				
					SetMotion_(g_n_man01, MOT_TALKLOOP, BLEND_XL);
					
					OpenMsgWnd_();
					SetTalkName_("NAME_TAG_NOCHORIN");
					ShowMsg_("MSG_SCOUTQ_07_CLEAR_MSG");//「ガネーシャエビルを　連れてきたっちょね。
					KeyInputWait_();
					ShowMsg_("MSG_SCOUTQ_CLEAR_01");	//「それじゃ　クエストクリアの
					KeyInputWait_();
					CloseMsgWnd_();
					
					SetMotion_(g_n_man01, "WAIT", BLEND_M);
					
					AddItemAndMsgSQ1(47, 1, false);		// しもふりにく
					
					SetMotion_(g_n_man01, "TALKLOOP", BLEND_M);
					
					OpenMsgWnd_();
					SetTalkName_("NAME_TAG_NOCHORIN");
					ShowMsg_("MSG_SCOUTQ_CLEAR_02");	//「さあ！　スカウトＱは　まだまだ　あるっちょ！
					KeyInputWait_();
					CloseMsgWnd_();
				}
			}
		}
		break;
	case   7 :
		if(scoutq_mission_now == false){
			uMissionStartMsg("MSG_SCOUTQ_08_00" , "MSG_SCOUTQ_08_01");
		}
		else {
			uScoutQuest_Confirm("MSG_SCOUTQ_08_AFTER_00");		//「守備力アップ２というスキルを持つ
			
			// 守備力アップ２のスキルを持つモンスターを所持しているかの判定処理
			if(uCheckSQ08() == false){
				uScoutQuest_Mistake("MSG_SCOUTQ_08_NOTCLEAR");	//「だめだちょ。
				
			} else {
				SetNumFlg_(sq_num_sub, 8);									// Num22 <- 8
				SetEventFlg_(sq_mission_now, false);						// Bit = 2011 出題中
				
				PlaySE_("SE_FLD_125");				// 正解ピンポーン
				Wait_(30);
				
				SetMotion_(g_n_man01, MOT_TALKLOOP, BLEND_XL);
				
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_NOCHORIN");
				ShowMsg_("MSG_SCOUTQ_08_CLEAR_MSG");//「それは　守備力アップ２を持つ　魔物っちょね？
				KeyInputWait_();
				ShowMsg_("MSG_SCOUTQ_CLEAR_01");	//「それじゃ　クエストクリアの
				KeyInputWait_();
				CloseMsgWnd_();
				
				SetMotion_(g_n_man01, "WAIT", BLEND_M);
				
				AddItemAndMsgSQ1(678, 1, false);	// 全体回復の証
				
				SetMotion_(g_n_man01, "TALKLOOP", BLEND_M);
				
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_NOCHORIN");
				ShowMsg_("MSG_SCOUTQ_CLEAR_02");	//「さあ！　スカウトＱは　まだまだ　あるっちょ！
				KeyInputWait_();
				CloseMsgWnd_();
			}
		}
		break;
	case   8 :
		if(scoutq_mission_now == false){
			uMissionStartMsg("MSG_SCOUTQ_09_00" , "MSG_SCOUTQ_09_01");
		}
		else {
			uScoutQuest_Confirm("MSG_SCOUTQ_09_AFTER_00");			//「ブレイクモンスターの　凶スライムを
			
			// ブレイクモンスターを所持しているかの判定処理
			if(uCheckSQ09() == false){
				uScoutQuest_Mistake("MSG_SCOUTQ_09_NOTCLEAR");		//「だめだちょ。
				
			} else {
				SetNumFlg_(sq_num_sub, 9);									// Num22 <- 9
				SetEventFlg_(sq_mission_now, false);						// Bit = 2011 出題中
				
				PlaySE_("SE_FLD_125");					// 正解ピンポーン
				Wait_(30);
				
				SetMotion_(g_n_man01, MOT_TALKLOOP, BLEND_XL);
				
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_NOCHORIN");
				ShowMsg_("MSG_SCOUTQ_09_CLEAR_MSG_01");	//「おおっ！　それは　まさしく　凶スライム！
				KeyInputWait_();
				ShowMsg_("MSG_SCOUTQ_09_CLEAR_MSG_02");	//「死なないかぎりは　どんどん　強くなっていく
				KeyInputWait_();
				ShowMsg_("MSG_SCOUTQ_CLEAR_01");		//「それじゃ　クエストクリアの
				KeyInputWait_();
				CloseMsgWnd_();
				
				SetMotion_(g_n_man01, "WAIT", BLEND_M);
				
				AddItemAndMsgSQ2(38, 5, false);			// ちからのたね×５
				AddItemAndMsgSQ3(40, 5, false);			// まもりのたね×５
				
				SetMotion_(g_n_man01, "TALKLOOP", BLEND_M);
				
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_NOCHORIN");
				ShowMsg_("MSG_SCOUTQ_CLEAR_02");		// 「さあ！　スカウトＱは　まだまだ　あるっちょ！
				KeyInputWait_();
				CloseMsgWnd_();
			}
		}
		break;
	case   9 :
		if(scoutq_mission_now == false){
			uMissionStartMsg("MSG_SCOUTQ_10_00" , "MSG_SCOUTQ_10_01");
		}
		else {
			uScoutQuest_Confirm("MSG_SCOUTQ_10_AFTER_00");		//「プラス値が　＋５０以上になった魔物を
			
			// プラス値が50以上のモンスターをを所持しているかの判定処理
			if(uCheckSQ10() == false){
				uScoutQuest_Mistake("MSG_SCOUTQ_10_NOTCLEAR");	//「だめだちょ。
				
			} else {
				SetNumFlg_(sq_num_sub, 10);									// Num22 <- 10
				SetEventFlg_(sq_mission_now, false);						// Bit = 2011 出題中
				
				PlaySE_("SE_FLD_125");				// 正解ピンポーン
				Wait_(30);
				
				SetMotion_(g_n_man01, MOT_TALKLOOP, BLEND_XL);
				
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_NOCHORIN");
				ShowMsg_("MSG_SCOUTQ_10_CLEAR_MSG");//「おおっ！　プラス値が５０以上の魔物っちょ！
				KeyInputWait_();
				ShowMsg_("MSG_SCOUTQ_CLEAR_01");	//「それじゃ　クエストクリアの
				KeyInputWait_();
				CloseMsgWnd_();
				
				SetMotion_(g_n_man01, "WAIT", BLEND_M);
				
				AddItemAndMsgSQ2(36, 5, false);		// いのちのきのみ×５
				AddItemAndMsgSQ3(37, 5, false);		// ふしぎなきのみ×５
				
				SetMotion_(g_n_man01, "TALKLOOP", BLEND_M);
				
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_NOCHORIN");
				ShowMsg_("MSG_SCOUTQ_CLEAR_02");	//「さあ！　スカウトＱは　まだまだ　あるっちょ！
				KeyInputWait_();
				CloseMsgWnd_();
			}
		}
		break;
	case   10 :
		if(GetEventFlg_("BFG_SCENARIO_CLEAR_ALL") == false){// Bit_46 シナリオクリア
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_NOCHORIN");				// ノチョリン
			ShowMsg_("MSG_SCOUTQ_11_00");					//「それじゃあ　スカウトＱ！
			KeyInputWait_();
			ShowMsg_("MSG_SCOUTQ_SINARIO_CLEAR_BEFORE");	//「……と思ったけど
			KeyInputWait_();
			CloseMsgWnd_();
		} else {
			if(scoutq_mission_now == false){
				uMissionStartMsg("MSG_SCOUTQ_11_00" , "MSG_SCOUTQ_11_01");
			}
			else {
				uScoutQuest_Confirm("MSG_SCOUTQ_11_AFTER_00");		//「ダークネビュラスを
				
				// ダークネビュラスを所持しているかの判定処理
				if(uCheckSQ11() == false){
					uScoutQuest_Mistake("MSG_SCOUTQ_11_NOTCLEAR");	//「だめだちょ。
					
				} else {
					SetNumFlg_(sq_num_sub, 11);									// Num22 <- 11
					SetEventFlg_(sq_mission_now, false);						// Bit = 2011 出題中
					
					PlaySE_("SE_FLD_125");	// 正解ピンポーン
					Wait_(30);
				
					SetMotion_(g_n_man01, MOT_TALKLOOP, BLEND_XL);
					
					OpenMsgWnd_();
					SetTalkName_("NAME_TAG_NOCHORIN");
					ShowMsg_("MSG_SCOUTQ_11_CLEAR_MSG");//「ダークネビュラスを　連れてきたっちょね。
					KeyInputWait_();
					ShowMsg_("MSG_SCOUTQ_CLEAR_01");	//「それじゃ　クエストクリアの
					KeyInputWait_();
					CloseMsgWnd_();
					
					SetMotion_(g_n_man01, "WAIT", BLEND_M);
					
					AddItemAndMsgSQ1(690, 1, false);	// 冥界の霧の証
					
					SetMotion_(g_n_man01, "TALKLOOP", BLEND_M);
					
					OpenMsgWnd_();
					SetTalkName_("NAME_TAG_NOCHORIN");
					ShowMsg_("MSG_SCOUTQ_CLEAR_02");	//「さあ！　スカウトＱは　まだまだ　あるっちょ！
					KeyInputWait_();
					CloseMsgWnd_();
				}
			}
		}
		break;
	case   11 :
		if(scoutq_mission_now == false){
			uMissionStartMsg("MSG_SCOUTQ_12_00" , "MSG_SCOUTQ_12_01");
		}
		else {
			uScoutQuest_Confirm("MSG_SCOUTQ_12_AFTER_00");		//「月夜の将を
			
			// 月夜の将を所持しているかの判定処理
			if(uCheckSQ12() == false){
				uScoutQuest_Mistake("MSG_SCOUTQ_12_NOTCLEAR");	//「だめだちょ。
				
			} else {
				SetNumFlg_(sq_num_sub, 12);									// Num22 <- 12
				SetEventFlg_(sq_mission_now, false);						// Bit = 2011 出題中
				
				PlaySE_("SE_FLD_125");				// 正解ピンポーン
				Wait_(30);
				
				SetMotion_(g_n_man01, MOT_TALKLOOP, BLEND_XL);
				
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_NOCHORIN");
				ShowMsg_("MSG_SCOUTQ_12_CLEAR_MSG");//「月夜の将を　連れてきたっちょね。
				KeyInputWait_();
				ShowMsg_("MSG_SCOUTQ_CLEAR_01");	//「それじゃ　クエストクリアの
				KeyInputWait_();
				CloseMsgWnd_();
				
				SetMotion_(g_n_man01, "WAIT", BLEND_M);
				
				AddItemAndMsgSQ1(61, 1, true);		// ゴールドカード
				
				SetMotion_(g_n_man01, "TALKLOOP", BLEND_M);
				
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_NOCHORIN");
				ShowMsg_("MSG_SCOUTQ_CLEAR_02");	//「さあ！　スカウトＱは　まだまだ　あるっちょ！
				KeyInputWait_();
				CloseMsgWnd_();
			}
		}
		break;
	case   12 :
		if(scoutq_mission_now == false){
			uMissionStartMsg("MSG_SCOUTQ_13_00" , "MSG_SCOUTQ_13_01");
		}
		else {
			uScoutQuest_Confirm("MSG_SCOUTQ_13_AFTER_00");		//「超生配合で　生まれた魔物を
			
			// 超生配合で　生まれたモンスターを所持しているかの判定処理
			if(uCheckSQ13() == false){
				uScoutQuest_Mistake("MSG_SCOUTQ_13_NOTCLEAR");	//「だめだちょ。
				
			} else {
				SetNumFlg_(sq_num_sub, 13);									// Num22 <- 13
				SetEventFlg_(sq_mission_now, false);						// Bit = 2011 出題中
				
				PlaySE_("SE_FLD_125");				// 正解ピンポーン
				Wait_(30);
				
				SetMotion_(g_n_man01, MOT_TALKLOOP, BLEND_XL);
				
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_NOCHORIN");
				ShowMsg_("MSG_SCOUTQ_13_CLEAR_MSG");//「超生配合した魔物を　連れてきたっちょね！
				KeyInputWait_();
				ShowMsg_("MSG_SCOUTQ_CLEAR_01");	//「それじゃ　クエストクリアの
				KeyInputWait_();
				CloseMsgWnd_();
				
				SetMotion_(g_n_man01, "WAIT", BLEND_M);
				
				AddItemAndMsgSQ2(42, 5, false);		// スキルのたね×５
				AddItemAndMsgSQ3(43, 5, false);		// しあわせのたね×５
				
				SetMotion_(g_n_man01, "TALKLOOP", BLEND_M);
				
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_NOCHORIN");
				ShowMsg_("MSG_SCOUTQ_CLEAR_02");	//「さあ！　スカウトＱは　まだまだ　あるっちょ！
				KeyInputWait_();
				CloseMsgWnd_();
			}
		}
		break;
	case   13 :
		if(scoutq_mission_now == false){
			uMissionStartMsg("MSG_SCOUTQ_14_00" , "MSG_SCOUTQ_14_01");
		}
		else {
			uScoutQuest_Confirm("MSG_SCOUTQ_14_AFTER_00");			//「剣豪のスキルを持った　破戒王ベルムドを
			
			// スキル 剣豪 を持った 破戒王ベルムドを所持しているかの判定処理
			if(uCheckSQ14() == false){
				uScoutQuest_Mistake("MSG_SCOUTQ_14_NOTCLEAR");		//「だめだちょ。
				
			} else {
				SetNumFlg_(sq_num_sub, 14);									// Num22 <- 14
				SetEventFlg_(sq_mission_now, false);						// Bit = 2011 出題中
				
				PlaySE_("SE_FLD_125");					// 正解ピンポーン
				Wait_(30);
				
				SetMotion_(g_n_man01, MOT_TALKLOOP, BLEND_XL);
				
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_NOCHORIN");
				ShowMsg_("MSG_SCOUTQ_14_CLEAR_MSG_01");	//「破戒王ベルムドを　連れてきたっちょね！
				KeyInputWait_();
				ShowMsg_("MSG_SCOUTQ_14_CLEAR_MSG_02");	//「そのかわり　剣を使うもの以外の　特技は
				KeyInputWait_();
				ShowMsg_("MSG_SCOUTQ_CLEAR_A");			//「それじゃ　お楽しみの　ごほうびっちょ。
				KeyInputWait_();
				CloseMsgWnd_();
				
				SetMotion_(g_n_man01, "WAIT", BLEND_M);
				
				PlaySE_("SE_FLD_135");					// リアクター音
				Wait_(30);
				
				// リアクター機能「Xボタン戦闘」の解放
				SetEventFlg_("BFG_REACTOR_UNLOCK_QUICKBATTLE", true);	// Bit = 72 クイックバトル機能の解放（Xボタン戦闘）
				
				// システムメッセージ
				OpenMsgWnd_();
				ShowMsg_("MSG_SCOUTQ_CLEAR_A_D_01");	// リアクター拡張パーツΩを　もらった！
				PlayMe_("ME_010");						// 重要アイテム入手ME
				WaitMe_();
				KeyInputWait_();
				ShowMsg_("MSG_SCOUTQ_CLEAR_A_D_03");	// リアクター拡張パーツΩを　組み込んでみた！
				KeyInputWait_();
				ShowMsg_("MSG_SCOUTQ_14_CLEAR");		// リアクター機能[ Xボタン戦闘 ]
				KeyInputWait_();
				CloseMsgWnd_();
				
				SetMotion_(g_n_man01, "TALKLOOP", BLEND_M);
				
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_NOCHORIN");
				ShowMsg_("MSG_SCOUTQ_CLEAR_A_D_02");	//「リアクターに　パーツを組みこんだことで
				KeyInputWait_();
				ShowMsg_("MSG_SCOUTQ_CLEAR_02");		//「さあ！　スカウトＱは　まだまだ　あるっちょ！
				KeyInputWait_();
				CloseMsgWnd_();
			}
		}
		break;
	case   14 :
		if(scoutq_mission_now == false){
			uMissionStartMsg("MSG_SCOUTQ_15_00" , "MSG_SCOUTQ_15_01");
		}
		else {
			uScoutQuest_Confirm("MSG_SCOUTQ_15_AFTER_00");			//「魔元帥ゼルドラドを
			
			// 魔元帥ゼルドラドを所持しているかの判定処理
			if(uCheckSQ15() == false){
				uScoutQuest_Mistake("MSG_SCOUTQ_15_NOTCLEAR");		//「だめだちょ。
				
			} else {
				local item_id_1 = 579;					// 攻撃力アップＳＰの証
				local item_id_2 = 583;					// 守備力アップＳＰの証
				local item_id_3 = 587;					// 素早さアップＳＰの証
				local item_id_4 = 591;					// 賢さアップＳＰの証
				
				AddItem_(item_id_1, 1);
				AddItem_(item_id_2, 1);
				AddItem_(item_id_3, 1);
				AddItem_(item_id_4, 1);
				
				SetNumFlg_(sq_num_sub, 15);									// Num22 <- 15
				SetEventFlg_(sq_mission_now, false);						// Bit = 2011 出題中
				
				PlaySE_("SE_FLD_125");					// 正解ピンポーン
				Wait_(30);
				
				SetMotion_(g_n_man01, MOT_TALKLOOP, BLEND_XL);
				
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_NOCHORIN");
				ShowMsg_("MSG_SCOUTQ_15_CLEAR_MSG_01");	//「魔元帥ゼルドラドを　連れてきたっちょね！
				KeyInputWait_();
				CloseMsgWnd_();
				
				SetMotion_(g_n_man01, "WAIT", BLEND_M);
				
				OpenMsgWnd_();
				PlaySE_("SE_SYS_011");					// アイテム入手ＳＥ(鳴らすのは1度だけでOK→東藤さん指示)
				SetExchangeItemName_(item_id_1);		// 攻撃力アップＳＰの証
				SetExchangeItemName_(item_id_2);		// 守備力アップＳＰの証
				SetExchangeItemName_(item_id_3);		// 素早さアップＳＰの証
				SetExchangeItemName_(item_id_4);		// 賢さアップＳＰの証
				ShowMsg_("MSG_SCOUTQ_15_CLEAR_MSG_02");	// ノチョリンから　ごほうびとして
				KeyInputWait_();
				CloseMsgWnd_();
				
				SetMotion_(g_n_man01, "TALKLOOP", BLEND_M);
				
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_NOCHORIN");
				ShowMsg_("MSG_SCOUTQ_15_CLEAR_MSG_03");	// 「スカウトＱのクエストは　これが最後。
				KeyInputWait_();
				CloseMsgWnd_();
				// スカウトＱクリアフラグを立てる
				SetEventFlg_("BFG_SUBEVENT_SCOUTQ_CLEAR", true);
			}
		}
		break;
	case   15 :
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_NOCHORIN");	// ノチョリン
		ShowMsg_("MSG_SCOUTQ_ALL_CLEAR");	// 「キミは立派な モンスターマスター。
		KeyInputWait_();
		CloseMsgWnd_();
		break;
	}
}




//++++++++++++++++++++++++++++++++++++++++++++++++
//  スカウトＱ問①ＨＰ回復のメイジドラキーを所持しているかの判定処理
//-------------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uCheckSQ01()
{
	local monster_id = 161; // メイジドラキー
	local skill_id = 276;	// ＨＰ回復
	
	// パーティ枠を判定
	local p_num = GetPartyMonsterNum_(MONSTER_PLACE.PLACE_PARTY);
	for(local i = 0; i < p_num; i ++){
		local p_kind = GetPartyMonsterKind_(MONSTER_PLACE.PLACE_PARTY, i);
		local p_check = CheckPartyMonsterSkill_(MONSTER_PLACE.PLACE_PARTY, skill_id, i);
		DebugPrint("パーティの " + i + " 番目");
		DebugPrint("モンスターIDは " + p_kind + " です");
		DebugPrint("ＨＰ回復スキルは " + p_check + " です");
		if(p_kind == monster_id && p_check == true){ return true; }
	}
	// スタンバイ枠を判定
	local s_num = GetPartyMonsterNum_(MONSTER_PLACE.PLACE_STANDBY);
	for(local i = 0; i < s_num; i ++){
		local s_kind = GetPartyMonsterKind_(MONSTER_PLACE.PLACE_STANDBY, i);
		local s_check = CheckPartyMonsterSkill_(MONSTER_PLACE.PLACE_STANDBY, skill_id, i);
		DebugPrint("スタンバイの " + i + " 番目");
		DebugPrint("モンスターIDは " + s_kind + " です");
		DebugPrint("ＨＰ回復スキルは " + s_check + " です");
		if(s_kind == monster_id && s_check == true){ return true; }
	}
	
	return false;
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//  スカウトＱ問②プリーストナイトを所持しているかの判定処理
//-------------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uCheckSQ02()
{
	local monster_id = 263; // プリーストナイト
	
	local p_num = GetPartyMonsterNum_(MONSTER_PLACE.PLACE_PARTY);
	for(local i = 0; i < p_num; i ++){
		local p_kind = GetPartyMonsterKind_(MONSTER_PLACE.PLACE_PARTY, i);
		if(p_kind == monster_id){ return true; }
	}
	local s_num = GetPartyMonsterNum_(MONSTER_PLACE.PLACE_STANDBY);
	for(local i = 0; i < s_num; i ++){
		local s_kind = GetPartyMonsterKind_(MONSTER_PLACE.PLACE_STANDBY, i);
		if(s_kind == monster_id){ return true; }
	}
	return false;
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//  スカウトＱ問③スライム系４種パーティ枠にあつめたかの判定処理
//-------------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uCheckSQ03()
{
	local slime_num_main = 0;
	local s_num = GetPartyMonsterNum_(MONSTER_PLACE.PLACE_PARTY);
	
	// パーティ枠
	for(local i = 0; i < s_num; i ++){
		local s_line_main = GetPartyMonsterLineAge_(MONSTER_PLACE.PLACE_PARTY, i);
		if(s_line_main ==  MONSTER_LINEAGE.SLIME){ slime_num_main ++ }
	}
	if(slime_num_main >= 4){
		return true;
	}else{
		return false;
	}
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//  スカウトＱ問④エルダードラゴンを所持しているかの判定処理
//-------------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uCheckSQ04()
{
	local monster_id = 64; // エルダードラゴン
	
	local p_num = GetPartyMonsterNum_(MONSTER_PLACE.PLACE_PARTY);
	for(local i = 0; i < p_num; i ++){
		local p_kind = GetPartyMonsterKind_(MONSTER_PLACE.PLACE_PARTY, i);
		if(p_kind == monster_id){ return true; }
	}
	local s_num = GetPartyMonsterNum_(MONSTER_PLACE.PLACE_STANDBY);
	for(local i = 0; i < s_num; i ++){
		local s_kind = GetPartyMonsterKind_(MONSTER_PLACE.PLACE_STANDBY, i);
		if(s_kind == monster_id){ return true; }
	}
	return false;
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//  スカウトＱ問⑤カラー転生したモンスターを所持しているかの判定処理
//-------------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uCheckSQ05()
{
	local p_num = GetPartyMonsterNum_(MONSTER_PLACE.PLACE_PARTY);
	for(local i = 0; i < p_num; i ++){
		local p_kind = CheckPartyMonsterChangeColor_(MONSTER_PLACE.PLACE_PARTY);
		if(p_kind == true){ return true; }
	}
	local s_num = GetPartyMonsterNum_(MONSTER_PLACE.PLACE_STANDBY);
	for(local i = 0; i < s_num; i ++){
		local s_kind = CheckPartyMonsterChangeColor_(MONSTER_PLACE.PLACE_STANDBY);
		if(s_kind == true){ return true; }
	}
	return false;
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//  スカウトＱ問⑥プラス値が25以上のモンスターを所持しているかの判定処理
//-------------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uCheckSQ06()
{
	local p_num = GetPartyMonsterNum_(MONSTER_PLACE.PLACE_PARTY);
	for(local i = 0; i < p_num; i ++){
		local p_kind = GetPartyMonsterPlus_(MONSTER_PLACE.PLACE_PARTY, i);
		if(p_kind >= 25){ return true; }
	}
	local s_num = GetPartyMonsterNum_(MONSTER_PLACE.PLACE_STANDBY);
	for(local i = 0; i < s_num; i ++){
		local s_kind = GetPartyMonsterPlus_(MONSTER_PLACE.PLACE_STANDBY, i);
		if(s_kind >= 25){ return true; }
	}
	return false;
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//  スカウトＱ問⑦ガネーシャエビルを所持しているかの判定処理
//-------------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uCheckSQ07()
{
	local monster_id = 147; // ガネーシャエビル

	local p_num = GetPartyMonsterNum_(MONSTER_PLACE.PLACE_PARTY);
	for(local i = 0; i < p_num; i ++){
		local p_kind = GetPartyMonsterKind_(MONSTER_PLACE.PLACE_PARTY, i);
		if(p_kind == monster_id){ return true; }
	}
	local s_num = GetPartyMonsterNum_(MONSTER_PLACE.PLACE_STANDBY);
	for(local i = 0; i < s_num; i ++){
		local s_kind = GetPartyMonsterKind_(MONSTER_PLACE.PLACE_STANDBY, i);
		if(s_kind == monster_id){ return true; }
	}
	return false;
}

//++++++++++++++++++++++++++++++++++++++++++++++++
// スカウトＱ 問⑧守備力アップ２のスキルを持つモンスターを所持しているかの判定処理
//-------------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uCheckSQ08()
{
	local skill_id = 181;	// 守備力アップ２
	
	// パーティ枠を判定
	local p_num = GetPartyMonsterNum_(MONSTER_PLACE.PLACE_PARTY);
	for(local i = 0; i < p_num; i ++){
		local p_check = CheckPartyMonsterSkill_(MONSTER_PLACE.PLACE_PARTY, skill_id, i);
		DebugPrint("パーティの " + i + " 番目");
		DebugPrint("守備力アップ２は " + p_check + " です");
		if(p_check == true){ return true; }
	}
	// スタンバイ枠を判定
	local s_num = GetPartyMonsterNum_(MONSTER_PLACE.PLACE_STANDBY);
	for(local i = 0; i < s_num; i ++){
		local s_check = CheckPartyMonsterSkill_(MONSTER_PLACE.PLACE_STANDBY, skill_id, i);
		DebugPrint("スタンバイの " + i + " 番目");
		DebugPrint("守備力アップ２は " + s_check + " です");
		if(s_check == true){ return true; }
	}
	return false;
}

//++++++++++++++++++++++++++++++++++++++++++++++++
// スカウトＱ 問⑨凶スライムを所持しているかの判定処理
//-------------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uCheckSQ09()
{
	local monster_id = 492; // 凶スライム

	local p_num = GetPartyMonsterNum_(MONSTER_PLACE.PLACE_PARTY);
	for(local i = 0; i < p_num; i ++){
		local p_kind = GetPartyMonsterKind_(MONSTER_PLACE.PLACE_PARTY, i);
		if(p_kind == monster_id){ return true; }
	}
	local s_num = GetPartyMonsterNum_(MONSTER_PLACE.PLACE_STANDBY);
	for(local i = 0; i < s_num; i ++){
		local s_kind = GetPartyMonsterKind_(MONSTER_PLACE.PLACE_STANDBY, i);
		if(s_kind == monster_id){ return true; }
	}
	return false;
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//  スカウトＱ問⑩プラス値が50以上のモンスターをを所持しているかの判定処理
//-------------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uCheckSQ10()
{
	local p_num = GetPartyMonsterNum_(MONSTER_PLACE.PLACE_PARTY);
	for(local i = 0; i < p_num; i ++){
		local p_kind = GetPartyMonsterPlus_(MONSTER_PLACE.PLACE_PARTY, i);
		if(p_kind >= 50){ return true; }
	}
	local s_num = GetPartyMonsterNum_(MONSTER_PLACE.PLACE_STANDBY);
	for(local i = 0; i < s_num; i ++){
		local s_kind = GetPartyMonsterPlus_(MONSTER_PLACE.PLACE_STANDBY, i);
		if(s_kind >= 50){ return true; }
	}
	return false;
}

//++++++++++++++++++++++++++++++++++++++++++++++++
// スカウトＱ 問⑪ダークネビュラスを所持しているかの判定処理
//-------------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uCheckSQ11()
{
	local monster_id = 388; // ダークネビュラス
	
	local p_num = GetPartyMonsterNum_(MONSTER_PLACE.PLACE_PARTY);
	for(local i = 0; i < p_num; i ++){
		local p_kind = GetPartyMonsterKind_(MONSTER_PLACE.PLACE_PARTY, i);
		if(p_kind == monster_id){ return true; }
	}
	local s_num = GetPartyMonsterNum_(MONSTER_PLACE.PLACE_STANDBY);
	for(local i = 0; i < s_num; i ++){
		local s_kind = GetPartyMonsterKind_(MONSTER_PLACE.PLACE_STANDBY, i);
		if(s_kind == monster_id){ return true; }
	}
	return false;
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//  スカウトＱ問⑫月夜の将を所持しているかの判定処理
//-------------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uCheckSQ12()
{
	local monster_id = 326; // 月夜の将

	local p_num = GetPartyMonsterNum_(MONSTER_PLACE.PLACE_PARTY);
	for(local i = 0; i < p_num; i ++){
		local p_kind = GetPartyMonsterKind_(MONSTER_PLACE.PLACE_PARTY, i);
		if(p_kind == monster_id){ return true; }
	}
	local s_num = GetPartyMonsterNum_(MONSTER_PLACE.PLACE_STANDBY);
	for(local i = 0; i < s_num; i ++){
		local s_kind = GetPartyMonsterKind_(MONSTER_PLACE.PLACE_STANDBY, i);
		if(s_kind == monster_id){ return true; }
	}
	return false;
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//  スカウトＱ問⑬超生配合で　生まれたモンスターを所持しているかの判定処理
//-------------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uCheckSQ13()
{
	local p_num = GetPartyMonsterNum_(MONSTER_PLACE.PLACE_PARTY);
	for(local i = 0; i < p_num; i ++){
		local p_kind = GetPartyMonsterPlus_(MONSTER_PLACE.PLACE_PARTY, i);
		if(p_kind >= 100){ return true; }
	}
	local s_num = GetPartyMonsterNum_(MONSTER_PLACE.PLACE_STANDBY);
	for(local i = 0; i < s_num; i ++){
		local s_kind = GetPartyMonsterPlus_(MONSTER_PLACE.PLACE_STANDBY, i);
		if(s_kind >= 100){ return true; }
	}
	return false;
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//  スカウトＱ問⑭スキル 剣豪 を持った 破戒王ベルムドを所持しているかの判定処理
//-------------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uCheckSQ14()
{
	local monster_id = 285; // 破戒王ベルムド
	local skill_id = 213;	// 剣豪スキル
	
	// パーティ枠を判定
	local p_num = GetPartyMonsterNum_(MONSTER_PLACE.PLACE_PARTY);
	for(local i = 0; i < p_num; i ++){
		local p_kind = GetPartyMonsterKind_(MONSTER_PLACE.PLACE_PARTY, i);
		local p_check = CheckPartyMonsterSkill_(MONSTER_PLACE.PLACE_PARTY, skill_id, i);
		DebugPrint("パーティの " + i + " 番目");
		DebugPrint("モンスターIDは " + p_kind + " です");
		DebugPrint("剣豪スキルは " + p_check + " です");
		if(p_kind == monster_id && p_check == true){ return true; }
	}
	// スタンバイ枠を判定
	local s_num = GetPartyMonsterNum_(MONSTER_PLACE.PLACE_STANDBY);
	for(local i = 0; i < s_num; i ++){
		local s_kind = GetPartyMonsterKind_(MONSTER_PLACE.PLACE_STANDBY, i);
		local s_check = CheckPartyMonsterSkill_(MONSTER_PLACE.PLACE_STANDBY, skill_id, i);
		DebugPrint("スタンバイの " + i + " 番目");
		DebugPrint("モンスターIDは " + s_kind + " です");
		DebugPrint("剣豪スキルは " + s_check + " です");
		if(s_kind == monster_id && s_check == true){ return true; }
	}
	
	return false;
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//  スカウトＱ問⑮魔元帥ゼルドラドを所持しているかの判定処理
//-------------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uCheckSQ15()
{
	local monster_id = 286; // 魔元帥ゼルドラド
	
	local p_num = GetPartyMonsterNum_(MONSTER_PLACE.PLACE_PARTY);
	for(local i = 0; i < p_num; i ++){
		local p_kind = GetPartyMonsterKind_(MONSTER_PLACE.PLACE_PARTY, i);
		if(p_kind == monster_id){ return true; }
	}
	local s_num = GetPartyMonsterNum_(MONSTER_PLACE.PLACE_STANDBY);
	for(local i = 0; i < s_num; i ++){
		local s_kind = GetPartyMonsterKind_(MONSTER_PLACE.PLACE_STANDBY, i);
		if(s_kind == monster_id){ return true; }
	}
	return false;
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		スカウトＱ出題メッセージ関数
//------------------------------------------------
//	引数	: msg_number	メッセージID(第何問目か)
//	引数	: msg_mission	メッセージID（出題内容）
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMissionStartMsg(msg_number , msg_mission)
{
	SetEventFlg_(sq_mission_now, true);							// Bit = 2011 出題中

	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_NOCHORIN");	// ノチョリン
	ShowMsg_(msg_number);				// 「準備ができたようね。
	KeyInputWait_();
	
	PlayMe_("SE_FLD_124");				// 出題ジャジャジャン( 再生方法をSE再生からME再生に変更<Redmine#2834> )
	WaitMe_();
	
	ShowMsg_(msg_mission);				// メッセージID（出題内容）
	KeyInputWait_();
	ShowMsg_("MSG_SCOUTQ_DESCRIPTION");	// 「もしも　指定の魔物を　仲間にできたら
	KeyInputWait_();
	CloseMsgWnd_();
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		スカウトＱ確認メッセージ関数
//------------------------------------------------
//	引数	: msg_number	メッセージID
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uScoutQuest_Confirm(msg_number)
{
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_NOCHORIN");		// ノチョリン
	ShowMsg_(msg_number);					// 「○○を　連れてきたかっちょ？
	KeyInputWait_();
	CloseMsgWnd_();
	
	SetMotion_(g_n_man01, MOT_WAIT, BLEND_L);
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		スカウトＱ不正解メッセージ関数
//------------------------------------------------
//	引数	: msg_number	メッセージID
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uScoutQuest_Mistake(msg_number)
{
	PlaySE_("SE_FLD_126");				// はずれブブー
	Wait_(30);
	
	SetMotion_(g_n_man01, MOT_TALKLOOP, BLEND_XL);
	
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_NOCHORIN");
	ShowMsg_(msg_number);				//「だめだちょ。
	KeyInputWait_();
	ShowMsg_("MSG_SCOUTQ_DESCRIPTION");	//「もしも　指定の魔物を
	KeyInputWait_();
	CloseMsgWnd_();
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		アクセサリーＱの関数
//------------------------------------------------
//	引数	: acce_q_num	アクセサリーＱ進行フラグ
//			: flg_open		ウィンドウを開くかどうか
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uAccessoriesQ( acce_q_num , flg_open)
{
	local	answer = false;					//回答チェック用
	local	scenario_save_check = false;	//シナリオ制限のチェック用

	if (flg_open) {
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_QUEEN");
	}
	
	//初回前ふり会話
	if ( GetEventFlg_("BFG_SUBEVENT_ACCEQ_FIRSTTALK") == false ) {
		//初回前ふり会話
		ShowMsg_("MSG_ACCQ_START_01");		//「いらっしゃいまし　あなたさま。
		KeyInputWait_();
		CloseMsgWnd_();
		
		//初回会話を済ませた
		SetEventFlg_("BFG_SUBEVENT_ACCEQ_FIRSTTALK", true);
		//アクセサリーＱのアイコンを追加
		SetEventFlg_("BFG_MAP_ICON_039", true);
		
	//アクセサリQが始まって２回目以降
	} else {
		//シナリオ進行による問題制限(2次DB #4230 で ２問目の制限がなくなったので条件を削除)
		//凍骨の氷原クリア前で、３問目に行こうとしているか？
		if ( GetEventFlg_("BFG_SCENARIO_CLEAR_ICE") == false ) {			//Bit_43
			if ( acce_q_num == 2 ) {
				scenario_save_check = true;
			}
		//黒鉄の監獄塔クリア前で、４問目に行こうとしているか？
		} else if ( GetEventFlg_("BFG_SCENARIO_CLEAR_SAND") == false ) {	//Bit_44
			if ( acce_q_num == 3 ) {
				scenario_save_check = true;
			}
		//焦熱の火山クリア前で、５問目に行こうとしているか？
		} else if ( GetEventFlg_("BFG_SCENARIO_CLEAR_VOLCANO") == false ) {	//Bit_45
			if ( acce_q_num == 4 ) {
				scenario_save_check = true;
			}
		//表シナリオクリア前で、６問目に行こうとしているか？
		} else if ( GetEventFlg_("BFG_SCENARIO_CLEAR_ALL") == false ) {		//Bit_46
			if ( acce_q_num == 5 ) {
				scenario_save_check = true;
			}
		//産星神撃破前で、７問目に行こうとしているか？
		} else if ( GetEventFlg_("BFG_KNOCK_DOWN_YATIHOKO") == false ||		//Bit_1364
					GetEventFlg_("BFG_KNOCK_DOWN_WADATUMI") == false ||		//Bit_1365
					GetEventFlg_("BFG_KNOCK_DOWN_HOAKARI") == false ) {		//Bit_1366
			if ( acce_q_num == 6 ) {
				scenario_save_check = true;
			}
		//完全クリア前で、８問目に行こうとしているか？
		} else if ( GetEventFlg_("BFG_SCENARIO_CLEAR_EXTRA") == false ) {	//Bit_47
			if ( acce_q_num == 7 ) {
				scenario_save_check = true;
			}
		}
		
		// 凍骨の氷原クリア後で３問目に行ける状態だが、刻印解禁イベントをみていない
		if( GetEventFlg_("BFG_SCENARIO_CLEAR_ICE") == true ){
			if ( acce_q_num == 2 ) {
				if( GetEventFlg_("BFG_UNLOCK_ACCESSORY_STRENGTHEN") == false ){
					scenario_save_check = true;
				}
			}
		}
		
		//シナリオ制限がかかっていない
		if ( scenario_save_check == false ) {
			//まだ出題していない
			if ( GetEventFlg_("BFG_SUBEVENT_QUEENQ_NOW") == false ) {
				//出題セリフ
				uAccessoriesQProblemMsg( acce_q_num, AQ_ANSWER_FALSE );
				
				// アクセサリＱをクリアしたら出題中フラグは立てない
				if(acce_q_num < 8){
					//出題中にする
					SetEventFlg_("BFG_SUBEVENT_QUEENQ_NOW", true);
				}
				
			//出題中
			} else {
				//アクセサリQの回答チェック
				switch( acce_q_num ){
				case	0:
					answer = uItemNumberOrMoreCheck( AQ_1_PROBLEM_ITEM_ID, AQ_1_PROBLEM_ITEM_NUMBER );
					break;
				case	1:
					answer = uItemNumberOrMoreCheck( AQ_2_PROBLEM_ITEM_ID, AQ_2_PROBLEM_ITEM_NUMBER );
					break;
				case	2:
					answer = uItemNumberOrMoreCheck( AQ_3_PROBLEM_ITEM_ID, AQ_3_PROBLEM_ITEM_NUMBER );
					break;
				case	3:
					answer = uItemNumberOrMoreCheck( AQ_4_PROBLEM_ITEM_ID, AQ_4_PROBLEM_ITEM_NUMBER );
					break;
				case	4:
					answer = uItemNumberOrMoreCheck( AQ_5_PROBLEM_ITEM_ID, AQ_5_PROBLEM_ITEM_NUMBER );
					break;
				case	5:
					answer = uItemNumberOrMoreCheck( AQ_6_PROBLEM_ITEM_ID, AQ_6_PROBLEM_ITEM_NUMBER );
					break;
				case	6:
					answer = uItemNumberOrMoreCheck( AQ_7_PROBLEM_ITEM_ID, AQ_7_PROBLEM_ITEM_NUMBER );
					break;
				case	7:
					answer = uItemNumberOrMoreCheck( AQ_8_PROBLEM_ITEM_ID, AQ_8_PROBLEM_ITEM_NUMBER );
					break;
				default:
					break;
				}

				//回答チェックの結果による報酬会話
				//正解した！セリフ
				if ( answer == AQ_ANSWER_TRUE ) {
					uAccessoriesQProblemMsg( acce_q_num, AQ_ANSWER_TRUE );

					//アクセサリQを次の問題ができるように進める。
					SetNumFlg_("NUM_SUBEVENT_QUEENQ", GetNumFlg_("NUM_SUBEVENT_QUEENQ")+1);
					//出題していない状態にする
					SetEventFlg_("BFG_SUBEVENT_QUEENQ_NOW", false);

				//合ってるけど、足りてないセリフ
				} else if ( answer == AQ_ANSWER_HALF ) {
					uAccessoriesQProblemMsg( acce_q_num, AQ_ANSWER_HALF );

				//正解していないセリフ
				} else {
					uAccessoriesQProblemMsg( acce_q_num, AQ_ANSWER_FALSE );
				}
			}

		//シナリオ制限がかかっている
		} else {
			// ３問目出題条件を満たしてるが刻印が解禁前の時(２問目クリア + 凍骨の氷原クリア + 刻印作成が解禁していないの場合)
			if(acce_q_num == 2
			&& GetEventFlg_("BFG_SCENARIO_CLEAR_ICE") == true
			&& GetEventFlg_("BFG_UNLOCK_ACCESSORY_STRENGTHEN") == false){
				ShowMsg_("MSG_ACCQ_WAIT_NEXT_02");
				KeyInputWait_();
				ShowMsg_("MSG_ACCQ_WAIT_NEXT_03");
				KeyInputWait_();
				CloseMsgWnd_();
			}
			else{
				//ちょっと待っててメッセージ
				ShowMsg_("MSG_ACCQ_WAIT_NEXT");
				KeyInputWait_();
				CloseMsgWnd_();
			}
		}
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		アクセサリーＱ出題会話の関数
//------------------------------------------------
//	引数	: acce_q_num		アクセサリーＱ進行フラグ
//	引数	: answer			正解か、不正解か、不足しているか
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uAccessoriesQProblemMsg( acce_q_num, answer )
{
	//出題会話
	switch( acce_q_num ){
	case	0:
		//１問目セリフ
		//正解した！
		if ( answer == AQ_ANSWER_TRUE ) {
			//おめでとうメッセージ
			SetExchangeItemName_(AQ_1_PROBLEM_ITEM_ID);
			ShowMsg_("MSG_ACCQ_CLEAR");		//「あらあら　あなたさま！
			KeyInputWait_();
			CloseMsgWnd_();

			// アイテム入手処理
			AddItemAndMsgAQ1(AQ_1_REWARD_ITEM_ID, AQ_1_REWARD_ITEM_NUMBER, false);
			AddItemAndMsgAQ2(AQ_1_2_REWARD_ITEM_ID, AQ_1_2_REWARD_ITEM_NUMBER, false);

			//次のメッセージ
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_QUEEN");
			ShowMsg_("MSG_ACCQ_CLEAR_NEXT");
			KeyInputWait_();
			CloseMsgWnd_();
		//合ってるけど、足りてないセリフ
		} else if ( answer == AQ_ANSWER_HALF ) {
			//おしい！メッセージ
			SetExchangeItemName_(AQ_1_PROBLEM_ITEM_ID);
			SetExchangeNumber_(AQ_1_PROBLEM_ITEM_NUMBER);
			ShowMsg_("MSG_ACCQ_ANSWER_HALF");	//「でも 数が足りていないようですわね……。
			KeyInputWait_();
			SetExchangeItemName_(AQ_1_PROBLEM_ITEM_ID);
			ShowMsg_("MSG_ACCQ_HINT_01_02");	// 「まりょくの土
			KeyInputWait_();
			CloseMsgWnd_();

		//出題セリフ or 正解していない…
		} else {
			//初出題
			SetExchangeItemName_(AQ_1_PROBLEM_ITEM_ID);
			SetExchangeNumber_(AQ_1_PROBLEM_ITEM_NUMBER);
			ShowMsg_("MSG_ACCQ_QUIZ_01");
			KeyInputWait_();
			SetExchangeItemName_(AQ_1_PROBLEM_ITEM_ID);
			ShowMsg_("MSG_ACCQ_HINT_01_01");
			KeyInputWait_();
			ShowMsg_("MSG_ACCQ_QUIZ_02");
			KeyInputWait_();
			CloseMsgWnd_();
		}
		break;
	case	1:
		//２問目出題セリフ
		//正解した！
		if ( answer == AQ_ANSWER_TRUE ) {
			//おめでとうメッセージ
			SetExchangeItemName_(AQ_2_PROBLEM_ITEM_ID);
			ShowMsg_("MSG_ACCQ_CLEAR");		//「あらあら　あなたさま！
			KeyInputWait_();
			CloseMsgWnd_();

			// アイテム入手処理
			AddItemAndMsgAQ1(AQ_2_REWARD_ITEM_ID, AQ_2_REWARD_ITEM_NUMBER, false);
			AddItemAndMsgAQ2(AQ_2_2_REWARD_ITEM_ID, AQ_2_2_REWARD_ITEM_NUMBER, false);

			//次のメッセージ
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_QUEEN");
			ShowMsg_("MSG_ACCQ_CLEAR_NEXT");
			KeyInputWait_();
			CloseMsgWnd_();

		//合ってるけど、足りてないセリフ
		} else if ( answer == AQ_ANSWER_HALF ) {
			//おしい！メッセージ
			SetExchangeItemName_(AQ_2_PROBLEM_ITEM_ID);
			SetExchangeNumber_(AQ_2_PROBLEM_ITEM_NUMBER);
			ShowMsg_("MSG_ACCQ_ANSWER_HALF");	//「でも　数が足りていないようですわね……。
			KeyInputWait_();
			SetExchangeItemName_(AQ_2_PROBLEM_ITEM_ID);
			ShowMsg_("MSG_ACCQ_HINT_02_02");// 「花のみつは　崩落都市にいる
			KeyInputWait_();
			ShowMsg_("MSG_ACCQ_HINT_END");	// 「ぬすっと斬りを
			KeyInputWait_();
			CloseMsgWnd_();

		//出題セリフ or 正解していない…
		} else {
			//初出題
			SetExchangeItemName_(AQ_2_PROBLEM_ITEM_ID);
			SetExchangeNumber_(AQ_2_PROBLEM_ITEM_NUMBER);
			ShowMsg_("MSG_ACCQ_QUIZ_01");
			KeyInputWait_();
			SetExchangeItemName_(AQ_2_PROBLEM_ITEM_ID);
			ShowMsg_("MSG_ACCQ_HINT_02_01");
			KeyInputWait_();
			ShowMsg_("MSG_ACCQ_QUIZ_02");
			KeyInputWait_();
			CloseMsgWnd_();
		}
		break;
	case	2:
		//３問目出題セリフ
		//正解した！
		if ( answer == AQ_ANSWER_TRUE ) {
			//おめでとうメッセージ
			SetExchangeItemName_(AQ_3_PROBLEM_ITEM_ID);
			ShowMsg_("MSG_ACCQ_CLEAR");		//「あらあら　あなたさま！
			KeyInputWait_();
			CloseMsgWnd_();

			// アイテム入手処理
			AddItemAndMsgAQ1(AQ_3_REWARD_ITEM_ID, AQ_3_REWARD_ITEM_NUMBER, false);
			AddItemAndMsgAQ2(AQ_3_2_REWARD_ITEM_ID, AQ_3_2_REWARD_ITEM_NUMBER, false);

			//次のメッセージ(装備品)
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_QUEEN");
			ShowMsg_("MSG_ACCQ_CLEAR_NEXT_02");
			KeyInputWait_();
			CloseMsgWnd_();

		//合ってるけど、足りてないセリフ
		} else if ( answer == AQ_ANSWER_HALF ) {
			//おしい！メッセージ
			SetExchangeItemName_(AQ_3_PROBLEM_ITEM_ID);
			SetExchangeNumber_(AQ_3_PROBLEM_ITEM_NUMBER);
			ShowMsg_("MSG_ACCQ_ANSWER_HALF");	//「でも　数が足りていないようですわね……。
			KeyInputWait_();
			SetExchangeItemName_(AQ_3_PROBLEM_ITEM_ID);
			ShowMsg_("MSG_ACCQ_HINT_03_02");	// 「ふしぎなドロドロは
			KeyInputWait_();
			CloseMsgWnd_();

		//出題セリフ or 正解していない…
		} else {
			//初出題
			SetExchangeItemName_(AQ_3_PROBLEM_ITEM_ID);
			SetExchangeNumber_(AQ_3_PROBLEM_ITEM_NUMBER);
			ShowMsg_("MSG_ACCQ_QUIZ_01");
			KeyInputWait_();
			SetExchangeItemName_(AQ_3_PROBLEM_ITEM_ID);
			ShowMsg_("MSG_ACCQ_HINT_03_01");
			KeyInputWait_();
			ShowMsg_("MSG_ACCQ_QUIZ_02");
			KeyInputWait_();
			CloseMsgWnd_();
		}
		break;
	case	3:
		//４問目出題セリフ
		//正解した！
		if ( answer == AQ_ANSWER_TRUE ) {
			//おめでとうメッセージ
			SetExchangeItemName_(AQ_4_PROBLEM_ITEM_ID);
			ShowMsg_("MSG_ACCQ_CLEAR");		//「あらあら　あなたさま！
			KeyInputWait_();
			CloseMsgWnd_();

			// アイテム入手処理
			AddItemAndMsgAQ1(AQ_4_REWARD_ITEM_ID, AQ_4_REWARD_ITEM_NUMBER, false);
			AddItemAndMsgAQ2(AQ_4_2_REWARD_ITEM_ID, AQ_4_2_REWARD_ITEM_NUMBER, false);

			//次のメッセージ
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_QUEEN");
			ShowMsg_("MSG_ACCQ_CLEAR_NEXT");
			KeyInputWait_();
			CloseMsgWnd_();

		//合ってるけど、足りてないセリフ
		} else if ( answer == AQ_ANSWER_HALF ) {
			//おしい！メッセージ
			SetExchangeItemName_(AQ_4_PROBLEM_ITEM_ID);
			SetExchangeNumber_(AQ_4_PROBLEM_ITEM_NUMBER);
			ShowMsg_("MSG_ACCQ_ANSWER_HALF");	//「でも　数が足りていないようですわね……。
			KeyInputWait_();
			SetExchangeItemName_(AQ_4_PROBLEM_ITEM_ID);
			ShowMsg_("MSG_ACCQ_HINT_04_02");	// 「氷の樹木は
			KeyInputWait_();
			CloseMsgWnd_();

		//出題セリフ or 正解していない…
		} else {
			//初出題
			SetExchangeItemName_(AQ_4_PROBLEM_ITEM_ID);
			SetExchangeNumber_(AQ_4_PROBLEM_ITEM_NUMBER);
			ShowMsg_("MSG_ACCQ_QUIZ_01");
			KeyInputWait_();
			SetExchangeItemName_(AQ_4_PROBLEM_ITEM_ID);
			ShowMsg_("MSG_ACCQ_HINT_04_01");
			KeyInputWait_();
			ShowMsg_("MSG_ACCQ_QUIZ_02");
			KeyInputWait_();
			CloseMsgWnd_();
		}
		break;
	case	4:
		//５問目出題セリフ
		//正解した！
		if ( answer == AQ_ANSWER_TRUE ) {
			//おめでとうメッセージ
			SetExchangeItemName_(AQ_5_PROBLEM_ITEM_ID);
			ShowMsg_("MSG_ACCQ_CLEAR");		//「あらあら　あなたさま！
			KeyInputWait_();
			CloseMsgWnd_();

			// アイテム入手処理
			AddItemAndMsgAQ1(AQ_5_REWARD_ITEM_ID, AQ_5_REWARD_ITEM_NUMBER, false);
			AddItemAndMsgAQ2(AQ_5_2_REWARD_ITEM_ID, AQ_5_2_REWARD_ITEM_NUMBER, false);

			//次のメッセージ
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_QUEEN");
			ShowMsg_("MSG_ACCQ_CLEAR_NEXT_02");
			KeyInputWait_();
			CloseMsgWnd_();

		//合ってるけど、足りてないセリフ
		} else if ( answer == AQ_ANSWER_HALF ) {
			//おしい！メッセージ
			SetExchangeItemName_(AQ_5_PROBLEM_ITEM_ID);
			SetExchangeNumber_(AQ_5_PROBLEM_ITEM_NUMBER);
			ShowMsg_("MSG_ACCQ_ANSWER_HALF");	//「でも　数が足りていないようですわね……。
			KeyInputWait_();
			SetExchangeItemName_(AQ_5_PROBLEM_ITEM_ID);
			ShowMsg_("MSG_ACCQ_HINT_05_02");	// 「小さな化石
			KeyInputWait_();
			CloseMsgWnd_();

		//出題セリフ or 正解していない…
		} else {
			//初出題
			SetExchangeItemName_(AQ_5_PROBLEM_ITEM_ID);
			SetExchangeNumber_(AQ_5_PROBLEM_ITEM_NUMBER);
			ShowMsg_("MSG_ACCQ_QUIZ_01");
			KeyInputWait_();
			SetExchangeItemName_(AQ_5_PROBLEM_ITEM_ID);
			ShowMsg_("MSG_ACCQ_HINT_05_01");
			KeyInputWait_();
			ShowMsg_("MSG_ACCQ_QUIZ_02");
			KeyInputWait_();
			CloseMsgWnd_();
		}
		break;
	case	5:
		//６問目出題セリフ
		//正解した！
		if ( answer == AQ_ANSWER_TRUE ) {
			//おめでとうメッセージ
			SetExchangeItemName_(AQ_6_PROBLEM_ITEM_ID);
			ShowMsg_("MSG_ACCQ_CLEAR");		//「あらあら　あなたさま！
			KeyInputWait_();
			CloseMsgWnd_();

			// アイテム入手処理
			AddItemAndMsgAQ1(AQ_6_REWARD_ITEM_ID, AQ_6_REWARD_ITEM_NUMBER, false);
			AddItemAndMsgAQ2(AQ_6_2_REWARD_ITEM_ID, AQ_6_2_REWARD_ITEM_NUMBER, false);

			//次のメッセージ
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_QUEEN");
			ShowMsg_("MSG_ACCQ_CLEAR_NEXT");
			KeyInputWait_();
			CloseMsgWnd_();

		//合ってるけど、足りてないセリフ
		} else if ( answer == AQ_ANSWER_HALF ) {
			//おしい！メッセージ
			SetExchangeItemName_(AQ_6_PROBLEM_ITEM_ID);
			SetExchangeNumber_(AQ_6_PROBLEM_ITEM_NUMBER);
			ShowMsg_("MSG_ACCQ_ANSWER_HALF");	//「（仮）これですわ！
			KeyInputWait_();
			SetExchangeItemName_(AQ_6_PROBLEM_ITEM_ID);
			ShowMsg_("MSG_ACCQ_HINT_06_02");	// 「マデュライト
			KeyInputWait_();
			ShowMsg_("MSG_ACCQ_HINT_END");		// 「ぬすっと斬りを
			KeyInputWait_();
			CloseMsgWnd_();

		//出題セリフ or 正解していない…
		} else {
			//初出題
			SetExchangeItemName_(AQ_6_PROBLEM_ITEM_ID);
			SetExchangeNumber_(AQ_6_PROBLEM_ITEM_NUMBER);
			ShowMsg_("MSG_ACCQ_QUIZ_01");
			KeyInputWait_();
			SetExchangeItemName_(AQ_6_PROBLEM_ITEM_ID);
			ShowMsg_("MSG_ACCQ_HINT_06_01");
			KeyInputWait_();
			ShowMsg_("MSG_ACCQ_QUIZ_02");
			KeyInputWait_();
			CloseMsgWnd_();
		}
		break;
	case	6:
		//７問目出題セリフ
		//正解した！
		if ( answer == AQ_ANSWER_TRUE ) {
			//おめでとうメッセージ
			SetExchangeItemName_(AQ_7_PROBLEM_ITEM_ID);
			ShowMsg_("MSG_ACCQ_CLEAR");		//「あらあら　あなたさま！
			KeyInputWait_();
			CloseMsgWnd_();

			// アイテム入手処理
			AddItemAndMsgAQ1(AQ_7_REWARD_ITEM_ID, AQ_7_REWARD_ITEM_NUMBER, false);
			AddItemAndMsgAQ2(AQ_7_2_REWARD_ITEM_ID, AQ_7_2_REWARD_ITEM_NUMBER, false);

			//次のメッセージ
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_QUEEN");
			ShowMsg_("MSG_ACCQ_CLEAR_NEXT_02");
			KeyInputWait_();
			CloseMsgWnd_();

		//合ってるけど、足りてないセリフ
		} else if ( answer == AQ_ANSWER_HALF ) {
			//おしい！メッセージ
			SetExchangeItemName_(AQ_7_PROBLEM_ITEM_ID);
			SetExchangeNumber_(AQ_7_PROBLEM_ITEM_NUMBER);
			ShowMsg_("MSG_ACCQ_ANSWER_HALF");	//「でも　数が足りていないようですわね……。
			KeyInputWait_();
			SetExchangeItemName_(AQ_7_PROBLEM_ITEM_ID);
			ShowMsg_("MSG_ACCQ_HINT_07_02");	// 「レッドオーブ
			KeyInputWait_();
			CloseMsgWnd_();

		//出題セリフ or 正解していない…
		} else {
			//初出題
			SetExchangeItemName_(AQ_7_PROBLEM_ITEM_ID);		// レッドオーブ
			SetExchangeNumber_(AQ_7_PROBLEM_ITEM_NUMBER);	// ２個
			ShowMsg_("MSG_ACCQ_QUIZ_SPECIAL_07_01");
			KeyInputWait_();
			SetExchangeItemName_(AQ_7_PROBLEM_ITEM_ID);		// レッドオーブ
			ShowMsg_("MSG_ACCQ_QUIZ_SPECIAL_07_02");
			KeyInputWait_();
			CloseMsgWnd_();
		}
		break;
	case	7:
		//８問目出題セリフ
		//正解した！
		if ( answer == AQ_ANSWER_TRUE ) {
			//おめでとうメッセージ
			SetExchangeItemName_(AQ_8_PROBLEM_ITEM_ID);
			SetExchangeNumber_(AQ_8_PROBLEM_ITEM_NUMBER);
			ShowMsg_("MSG_ACCQ_CLEAR_02");		//「ああっ！　それはまさしく　かがやきの樹液！
			KeyInputWait_();
			CloseMsgWnd_();

			// アイテム入手処理
			AddItemAndMsgAQ1(AQ_8_REWARD_ITEM_ID, AQ_8_REWARD_ITEM_NUMBER, false);
			AddItemAndMsgAQ2(AQ_8_2_REWARD_ITEM_ID, AQ_8_2_REWARD_ITEM_NUMBER, false);

			//次のメッセージ
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_QUEEN");
			ShowMsg_("MSG_ACCQ_ALL_CLEAR_NOW");
			KeyInputWait_();
			CloseMsgWnd_();

		//合ってるけど、足りてないセリフ
		} else if ( answer == AQ_ANSWER_HALF ) {
			//おしい！メッセージ
			SetExchangeItemName_(AQ_8_PROBLEM_ITEM_ID);
			SetExchangeNumber_(AQ_8_PROBLEM_ITEM_NUMBER);
			ShowMsg_("MSG_ACCQ_ANSWER_HALF");	//「（仮）これですわ！
			KeyInputWait_();
			SetExchangeItemName_(AQ_8_PROBLEM_ITEM_ID);
			ShowMsg_("MSG_ACCQ_HINT_08_02");	// 「かがやきの樹液は
			KeyInputWait_();
			CloseMsgWnd_();

		//出題セリフ or 正解していない…
		} else {
			//初出題
			SetExchangeItemName_(AQ_8_PROBLEM_ITEM_ID);
			SetExchangeNumber_(AQ_8_PROBLEM_ITEM_NUMBER);
			ShowMsg_("MSG_ACCQ_QUIZ_SPECIAL_08_01");
			KeyInputWait_();
			SetExchangeItemName_(AQ_8_PROBLEM_ITEM_ID);
			ShowMsg_("MSG_ACCQ_QUIZ_SPECIAL_08_02");
			KeyInputWait_();
			CloseMsgWnd_();
		}
		break;
	case	8:
		ShowMsg_("MSG_ACCQ_ALL_CLEAR");	//「アタクシも知らない　めずらしい素材が
		KeyInputWait_();
		CloseMsgWnd_();
		break;
	default:
		break;
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		アクセサリーＱ指定アイテムを指定個数以上持っているかチェック
//------------------------------------------------
//	引数	: item_id		指定アイテムのＩＤ
//	引数	: item_num		指定個数
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uItemNumberOrMoreCheck( item_id, item_num )
{
	if ( item_num <= GetItemNum_(item_id) ) {
		return	AQ_ANSWER_TRUE;	//持っているなら AQ_ANSWER_TRUE を返す。
	} else {
		if ( 1 <= GetItemNum_(item_id) && GetItemNum_(item_id) < item_num ) {
			return	AQ_ANSWER_HALF;	//持っているけど足りてないなら AQ_ANSWER_HALF を返す。
		} else {
			return	AQ_ANSWER_FALSE;	//持っていないなら AQ_ANSWER_FALSE を返す。
		}
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
// ローカル関数：ライブラリＱ１回目に話しかけた時の処理
//------------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uLibraryQuestFirstMsg()
{
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_JACK");
	ShowMsg_("MSG_LIBRARY_START");		//「これは <name_player/>どの！
	KeyInputWait_();
	ShowMsg_("MSG_LIBRARY_START_Q");	//「どうか ワガハイのために
	KeyInputWait_();
	// 「はい」
	if (GetQueryResult_() == QUERY2_0) {
		SetEventFlg_("BFG_LIBRARY_FIRST_TIME",true);	// Bit_1073 ライブラリQ解放後、初めて話しかけた

		ShowMsg_("MSG_LIBRARY_START_YES");		// 「なんと ありがたい！
		KeyInputWait_();
		CloseMsgWnd_();
	}
	// 「いいえ」
	else{
		ShowMsg_("MSG_LIBRARY_START_NO");		// 「むう……それは 残念ですな。
		KeyInputWait_();
		CloseMsgWnd_();
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		ライブラリの解放の関数
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uLibraryOpenMsg()
{
	// どのランクが解放されるかチェックする
	local unlock_rank = uCheckLibraryRank();
	switch(unlock_rank)
	{
	// ■Fランク解放
	case LIBRARY_LANK_F:
		lib_msg_flg = true;					// ライブラリを解放したのでtrueに
		
		Wait_(10);// 話し始める前に一泊の間
		
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_JACK");	// ジャック
		ShowMsg_("MSG_LIBRARY_F_OPEN");	// 「（仮）おお！ Ｆランクの 仲間にしたことのある
		KeyInputWait_();
		CloseMsgWnd_();
		
		SetEventFlg_("BFG_LIBRARY_RELEASE_MONSTER_F", true);	// Bit_462 Fランクの魔物に関するライブラリ情報解放
		
		OpenMsgWnd_();
		ShowMsg_("MSG_LIBRARY_F_SYS");	// ジャックから Ｆランクの
		PlaySE_("SE_SYS_011");			// アイテム入手SE
		KeyInputWait_();
		CloseMsgWnd_();
		
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_JACK");		// ジャック
		ShowMsg_("MSG_LIBRARY_F_OPEN_2");	//「仮）メニューから ライブラリを開いて
		KeyInputWait_();
		CloseMsgWnd_(); // コメント化する時は東藤さんに要確認(2次DB #3091)
		
		uMsgLibraryComplete(); // ライブラリＱクリアチェック
		break;
	// ■Eランク解放
	case LIBRARY_LANK_E:
		lib_msg_flg = true;					// ライブラリを解放したのでtrueに
		
		Wait_(10);// 話し始める前に一泊の間
		
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_JACK");		// ジャック
		ShowMsg_("MSG_LIBRARY_E_OPEN");		// 「（仮）おお！ Eランクの 仲間にしたことのある
		KeyInputWait_();
		CloseMsgWnd_();
		
		SetEventFlg_("BFG_LIBRARY_RELEASE_MONSTER_E", true);	// Bit_463 Eランクの魔物に関するライブラリ情報解放
		
		OpenMsgWnd_();
		ShowMsg_("MSG_LIBRARY_E_SYS");	// ジャックから Eランクの
		PlaySE_("SE_SYS_011");			// アイテム入手SE
		KeyInputWait_();
		CloseMsgWnd_();
		
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_JACK");		// ジャック
		ShowMsg_("MSG_LIBRARY_E_OPEN_2");	//「仮）メニューから ライブラリを開いて
		KeyInputWait_();
		CloseMsgWnd_(); // コメント化する時は東藤さんに要確認(2次DB #3091)
		
		uMsgLibraryComplete(); // ライブラリＱクリアチェック
		break;
	// ■Dランク解放
	case LIBRARY_LANK_D:
		lib_msg_flg = true;					// ライブラリを解放したのでtrueに
		
		Wait_(10);// 話し始める前に一泊の間
		
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_JACK");		// ジャック
		ShowMsg_("MSG_LIBRARY_D_OPEN");		// 「（仮）おお！ Dランクの 仲間にしたことのある
		KeyInputWait_();
		CloseMsgWnd_();
		
		SetEventFlg_("BFG_LIBRARY_RELEASE_MONSTER_D", true);	// Bit_464 Dランクの魔物に関するライブラリ情報解放
		
		OpenMsgWnd_();
		ShowMsg_("MSG_LIBRARY_D_SYS");	// ジャックから Dランクの
		PlaySE_("SE_SYS_011");			// アイテム入手SE
		KeyInputWait_();
		CloseMsgWnd_();
		
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_JACK");		// ジャック
		ShowMsg_("MSG_LIBRARY_D_OPEN_2");	//「仮）メニューから ライブラリを開いて
		KeyInputWait_();
		CloseMsgWnd_(); // コメント化する時は東藤さんに要確認(2次DB #3091)
		
		uMsgLibraryComplete(); // ライブラリＱクリアチェック
		break;
	// ■Cランク解放
	case LIBRARY_LANK_C:
		lib_msg_flg = true;					// ライブラリを解放したのでtrueに
		
		Wait_(10);// 話し始める前に一泊の間
		
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_JACK");		// ジャック
		ShowMsg_("MSG_LIBRARY_C_OPEN");		// 「（仮）おお！ Cランクの 仲間にしたことのある
		KeyInputWait_();
		CloseMsgWnd_();
		
		SetEventFlg_("BFG_LIBRARY_RELEASE_MONSTER_C", true);	// Bit_465 Cランクの魔物に関するライブラリ情報解放
		
		OpenMsgWnd_();
		ShowMsg_("MSG_LIBRARY_C_SYS");	// ジャックから Cランクの
		PlaySE_("SE_SYS_011");			// アイテム入手SE
		KeyInputWait_();
		CloseMsgWnd_();
		
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_JACK");		// ジャック
		ShowMsg_("MSG_LIBRARY_C_OPEN_2");	//「仮）メニューから ライブラリを開いて
		KeyInputWait_();
		CloseMsgWnd_(); // コメント化する時は東藤さんに要確認(2次DB #3091)
		
		uMsgLibraryComplete(); // ライブラリＱクリアチェック
		break;
	// ■Bランク解放
	case LIBRARY_LANK_B:
		lib_msg_flg = true;					// ライブラリを解放したのでtrueに
		
		Wait_(10);// 話し始める前に一泊の間
		
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_JACK");		// ジャック
		ShowMsg_("MSG_LIBRARY_B_OPEN");		// 「（仮）おお！ Bランクの 仲間にしたことのある
		KeyInputWait_();
		CloseMsgWnd_();
		
		SetEventFlg_("BFG_LIBRARY_RELEASE_MONSTER_B", true);	// Bit_466 Bランクの魔物に関するライブラリ情報解放
		
		OpenMsgWnd_();
		ShowMsg_("MSG_LIBRARY_B_SYS");	// ジャックから Bランクの
		PlaySE_("SE_SYS_011");			// アイテム入手SE
		KeyInputWait_();
		CloseMsgWnd_();
		
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_JACK");		// ジャック
		ShowMsg_("MSG_LIBRARY_B_OPEN_2");	//「仮）メニューから ライブラリを開いて
		KeyInputWait_();
		CloseMsgWnd_(); // コメント化する時は東藤さんに要確認(2次DB #3091)
		
		uMsgLibraryComplete(); // ライブラリＱクリアチェック
		break;
	// ■Aランク解放
	case LIBRARY_LANK_A:
		lib_msg_flg = true;					// ライブラリを解放したのでtrueに
		
		Wait_(10);// 話し始める前に一泊の間
		
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_JACK");		// ジャック
		ShowMsg_("MSG_LIBRARY_A_OPEN");		// 「（仮）おお！ Aランクの 仲間にしたことのある
		KeyInputWait_();
		CloseMsgWnd_();
		
		SetEventFlg_("BFG_LIBRARY_RELEASE_MONSTER_A", true);	// Bit_467 Aランクの魔物に関するライブラリ情報解放
		
		OpenMsgWnd_();
		ShowMsg_("MSG_LIBRARY_A_SYS");	// ジャックから Aランクの
		PlaySE_("SE_SYS_011");			// アイテム入手SE
		KeyInputWait_();
		CloseMsgWnd_();
		
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_JACK");		// ジャック
		ShowMsg_("MSG_LIBRARY_A_OPEN_2");	//「仮）メニューから ライブラリを開いて
		KeyInputWait_();
		CloseMsgWnd_(); // コメント化する時は東藤さんに要確認(2次DB #3091)
		
		uMsgLibraryComplete(); // ライブラリＱクリアチェック
		break;
	// ■Sランク解放
	case LIBRARY_LANK_S:
		lib_msg_flg = true;					// ライブラリを解放したのでtrueに
		
		Wait_(10);// 話し始める前に一泊の間
		
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_JACK");		// ジャック
		ShowMsg_("MSG_LIBRARY_S_OPEN");		// 「（仮）おお！ Sランクの 仲間にしたことのある
		KeyInputWait_();
		CloseMsgWnd_();
		
		SetEventFlg_("BFG_LIBRARY_RELEASE_MONSTER_S", true);	// Bit_468 Sランクの魔物に関するライブラリ情報解放
		
		OpenMsgWnd_();
		ShowMsg_("MSG_LIBRARY_S_SYS");	// ジャックから Sランクの
		PlaySE_("SE_SYS_011");			// アイテム入手SE
		KeyInputWait_();
		CloseMsgWnd_();
		
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_JACK");		// ジャック
		ShowMsg_("MSG_LIBRARY_S_OPEN_2");	//「仮）メニューから ライブラリを開いて
		KeyInputWait_();
		CloseMsgWnd_(); // コメント化する時は東藤さんに要確認(2次DB #3091)
		
		uMsgLibraryComplete(); // ライブラリＱクリアチェック
		break;
	// ■SSランク解放
	case LIBRARY_LANK_SS:
		lib_msg_flg = true;					// ライブラリを解放したのでtrueに
		
		Wait_(10);// 話し始める前に一泊の間
		
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_JACK");		// ジャック
		ShowMsg_("MSG_LIBRARY_SS_OPEN");		// 「（仮）おお！ SSランクの 仲間にしたことのある
		KeyInputWait_();
		CloseMsgWnd_();
		
		SetEventFlg_("BFG_LIBRARY_RELEASE_MONSTER_SS", true);	// Bit_469 SSランクの魔物に関するライブラリ情報解放
		
		OpenMsgWnd_();
		ShowMsg_("MSG_LIBRARY_SS_SYS");	// ジャックから SSランクの
		PlaySE_("SE_SYS_011");			// アイテム入手SE
		KeyInputWait_();
		CloseMsgWnd_();
		
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_JACK");		// ジャック
		ShowMsg_("MSG_LIBRARY_SS_OPEN_2");	//「仮）メニューから ライブラリを開いて
		KeyInputWait_();
		CloseMsgWnd_(); // コメント化する時は東藤さんに要確認(2次DB #3091)
		
		uMsgLibraryComplete(); // ライブラリＱクリアチェック
		break;
	// ■該当なし
	case LIBRARY_NONE:
		DebugPrint("ランク解放処理は行いません");
		break;
	// ■イレギュラー(通らないけど、念のため設定)
	default:
		DebugPrint("WARNING : どのランクのライブラリが解放されるか判定する関数の見直しが必要です[uLibraryOpenMsg]");
		break;
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++++
//		ライブラリ解放判定処理
//--------------------------------------------------
//	引数	: なし
//	戻り値	: 解放するランク
//++++++++++++++++++++++++++++++++++++++++++++++++++
function uCheckLibraryRank()
{
	// 各ランクのライブラリ解放に必要なモンスター種族数
	local unlock_f  = 10;
	local unlock_e  = 10;
	local unlock_d  = 10;
	local unlock_c  = 10;
	local unlock_b  = 10;
	local unlock_a  = 10;
	local unlock_s  = 10;
	local unlock_ss = 10;
	
	// 各ランクで仲間にしたことのあるモンスター種族数
	local kind_f  = GetNakamaMonsterRankNum_(MONSTER_RANK.F);
	local kind_e  = GetNakamaMonsterRankNum_(MONSTER_RANK.E);
	local kind_d  = GetNakamaMonsterRankNum_(MONSTER_RANK.D);
	local kind_c  = GetNakamaMonsterRankNum_(MONSTER_RANK.C);
	local kind_b  = GetNakamaMonsterRankNum_(MONSTER_RANK.B);
	local kind_a  = GetNakamaMonsterRankNum_(MONSTER_RANK.A);
	local kind_s  = GetNakamaMonsterRankNum_(MONSTER_RANK.S);
	local kind_ss = GetNakamaMonsterRankNum_(MONSTER_RANK.SS);
	
	// 優先順位 (高) F > E > D > C > B > A > S > SS (低)
	if(!GetEventFlg_("BFG_LIBRARY_RELEASE_MONSTER_F")  && kind_f  >= unlock_f ){	return LIBRARY_LANK_F;	}
	if(!GetEventFlg_("BFG_LIBRARY_RELEASE_MONSTER_E")  && kind_e  >= unlock_e ){	return LIBRARY_LANK_E;	}
	if(!GetEventFlg_("BFG_LIBRARY_RELEASE_MONSTER_D")  && kind_d  >= unlock_d ){	return LIBRARY_LANK_D;	}
	if(!GetEventFlg_("BFG_LIBRARY_RELEASE_MONSTER_C")  && kind_c  >= unlock_c ){	return LIBRARY_LANK_C;	}
	if(!GetEventFlg_("BFG_LIBRARY_RELEASE_MONSTER_B")  && kind_b  >= unlock_b ){	return LIBRARY_LANK_B;	}
	if(!GetEventFlg_("BFG_LIBRARY_RELEASE_MONSTER_A")  && kind_a  >= unlock_a ){	return LIBRARY_LANK_A;	}
	if(!GetEventFlg_("BFG_LIBRARY_RELEASE_MONSTER_S")  && kind_s  >= unlock_s ){	return LIBRARY_LANK_S;	}
	if(!GetEventFlg_("BFG_LIBRARY_RELEASE_MONSTER_SS") && kind_ss >= unlock_ss){	return LIBRARY_LANK_SS;	}
	
	return LIBRARY_NONE;
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		ライブラリクリア時の、称号獲得とメッセージ
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMsgLibraryComplete()
{
	local bit_library_clear = GetEventFlg_("BFG_LIBRARY_INFO_ALL");	// Bit_1074 全てのライブラリ情報解放
	if(!bit_library_clear){
		local bit_f_lank_open = GetEventFlg_("BFG_LIBRARY_RELEASE_MONSTER_F");	// Bit_462 Fランクの魔物に関するライブラリ情報解放
		local bit_e_lank_open = GetEventFlg_("BFG_LIBRARY_RELEASE_MONSTER_E");	// Bit_463 Eランクの魔物に関するライブラリ情報解放
		local bit_d_lank_open = GetEventFlg_("BFG_LIBRARY_RELEASE_MONSTER_D");	// Bit_464 Dランクの魔物に関するライブラリ情報解放
		local bit_c_lank_open = GetEventFlg_("BFG_LIBRARY_RELEASE_MONSTER_C");	// Bit_465 Cランクの魔物に関するライブラリ情報解放
		local bit_b_lank_open = GetEventFlg_("BFG_LIBRARY_RELEASE_MONSTER_B");	// Bit_466 Bランクの魔物に関するライブラリ情報解放
		local bit_a_lank_open = GetEventFlg_("BFG_LIBRARY_RELEASE_MONSTER_A");	// Bit_467 Aランクの魔物に関するライブラリ情報解放
		local bit_s_lank_open = GetEventFlg_("BFG_LIBRARY_RELEASE_MONSTER_S");	// Bit_468 Sランクの魔物に関するライブラリ情報解放
		local bit_ss_lank_open = GetEventFlg_("BFG_LIBRARY_RELEASE_MONSTER_SS");	// Bit_469 SSランクの魔物に関するライブラリ情報解放
		if(bit_f_lank_open
		&& bit_e_lank_open
		&& bit_d_lank_open
		&& bit_c_lank_open
		&& bit_b_lank_open
		&& bit_a_lank_open
		&& bit_s_lank_open
		&& bit_ss_lank_open){
			
			//話し始める前に一泊の間
			Wait_(10);
			
			// 一泊の間があるので、ウィンドウは開け続けてないようにして下さい(by東藤)
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_JACK");		// ジャック
			ShowMsg_("MSG_LIBRARY_COMPLETE");	// 「仮）なんと！ これで この世のすべての
			KeyInputWait_();
			CloseMsgWnd_();
			
			SetEventFlg_("BFG_LIBRARY_INFO_ALL", true);	// Bit_1074 全てのライブラリ情報解放
			
			OpenMsgWnd_();
			ShowMsg_("MSG_LIBRARY_COMPLETE_SYS");// 称号 <yellow/>りっぱな魔物マニア<white/> を手にいれた！
			PlaySE_("SE_SYS_011");				// アイテム入手SE
			KeyInputWait_();
			CloseMsgWnd_();
			
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_JACK");		// ジャック
			ShowMsg_("MSG_LIBRARY_COMPLETE_2");	//「仮）集まった情報は きっと お役に立ちますぞ。
			KeyInputWait_();
			CloseMsgWnd_();
		} else {
			// 処理なし
		}
	} else {
		// 処理なし
	}
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		市民男Ａのメッセージ
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uCitizenManMsg()
{
	//シナリオメインフラグ
	local main_num = GetNumFlg_("NUM_SCENARIO_MAIN");
	//シナリオサブフラグ(表シナリオクリア後と完全クリア後)
	local outside_num  = GetNumFlg_("NUM_SCENARIO_SUB_INSIDE_CLEAR");
	local allclear_num = GetNumFlg_("NUM_SCENARIO_SUB_ALL_CLEAR");

	// 表シナリオクリア後
	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){
		if(outside_num == GetFlagID_("CONST_SS_OS_TALKED_AROMA")){
			OpenMsgWnd_();
			ShowMsg_("CITIZEN_MAN_A_MSG_001");
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	// 完全クリア後
	else if(main_num == GetFlagID_("CONST_SM_ALL_CLEAR")){
		if(allclear_num == GetFlagID_("CONST_SS_ALL_GO_TO_CENTER_BILL_B2F")){
			OpenMsgWnd_();
			ShowMsg_("CITIZEN_MAN_A_MSG_002");
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if(allclear_num == GetFlagID_("CONST_SS_ALL_UNLOCK_BATTLE_GP")){
			OpenMsgWnd_();
			ShowMsg_("CITIZEN_MAN_A_MSG_003");
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else{
			// 特に何もしない
		}
	}
	// 例外
	else{
		// 特に何もしない
	}
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		市民子供Ａのメッセージ
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uCitizenChiMsg()
{
	//シナリオメインフラグ
	local main_num = GetNumFlg_("NUM_SCENARIO_MAIN");
	//シナリオサブフラグ(表シナリオクリア後と完全クリア後)
	local outside_num  = GetNumFlg_("NUM_SCENARIO_SUB_INSIDE_CLEAR");
	local allclear_num = GetNumFlg_("NUM_SCENARIO_SUB_ALL_CLEAR");

	// 表シナリオクリア後
	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){
		if(outside_num == GetFlagID_("CONST_SS_OS_TALKED_AROMA")){
			OpenMsgWnd_();
			ShowMsg_("CITIZEN_CHILD_A_MSG_001");
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	// 完全クリア後
	else if(main_num == GetFlagID_("CONST_SM_ALL_CLEAR")){
		if(allclear_num == GetFlagID_("CONST_SS_ALL_GO_TO_CENTER_BILL_B2F")){
			OpenMsgWnd_();
			ShowMsg_("CITIZEN_CHILD_A_MSG_002");
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if(allclear_num == GetFlagID_("CONST_SS_ALL_UNLOCK_BATTLE_GP")){
			OpenMsgWnd_();
			ShowMsg_("CITIZEN_CHILD_A_MSG_003");
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else{
			// 特に何もしない
		}
	}
	// 例外
	else{
		// 特に何もしない
	}
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		レナーテのメッセージ
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uRenateMsg()
{
	// NUM 000 == 9 かつ NUM 010 == 36 の時
	if(GetNumFlg_("NUM_SCENARIO_MAIN") == GetFlagID_("CONST_SM_INSIDE_CLEAR")){
		if(GetNumFlg_("NUM_SCENARIO_SUB_INSIDE_CLEAR") == GetFlagID_("CONST_SS_OS_TALKED_AROMA")){
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_RENERTE");
			ShowMsg_("RENATE_MSG_011");
			KeyInputWait_();
			ShowMsg_("RENATE_MSG_012");
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
}

