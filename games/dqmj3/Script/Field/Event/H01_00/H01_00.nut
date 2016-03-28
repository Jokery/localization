//===================== H01_00【ウッドパーク】 ====================

enum HIDE_NPC_KIND{
	JACK,
	QUEEN,
	ACE,
	INN,
	NUM,
};

//カラーフォンデュイベント用の定数
const	CF_COLORFONDUE_MONSTER_ID = 395;	//カラーフォンデュのID
const	CF_COLORFONDUE_COUNTMAX = 5;		//カラーフォンデュ兄弟の集める数

const	CF_GREEN_PROBLEM_ITEM_ID = 189;		//緑の宝石
const	CF_GREEN_PROBLEM_ITEM_NUMBER = 4;	//必要個数
const	CF_GREEN_REWARD_ITEM_ID = 132;		//ドラゴンの皮
const	CF_GREEN_REWARD_ITEM_NUMBER = 1;	//もらえる個数

const	CF_BLUE_PROBLEM_ITEM_ID = 187;		//青い宝石
const	CF_BLUE_PROBLEM_ITEM_NUMBER = 4;	//必要個数
const	CF_BLUE_REWARD_ITEM_ID = 110;		//ひかりの石
const	CF_BLUE_REWARD_ITEM_NUMBER = 1;		//もらえる個数

const	CF_YELLOW_PROBLEM_ITEM_ID = 188;	//黄色の宝石
const	CF_YELLOW_PROBLEM_ITEM_NUMBER = 4;	//必要個数
const	CF_YELLOW_REWARD_ITEM_ID = 111;		//げんませき
const	CF_YELLOW_REWARD_ITEM_NUMBER = 1;	//もらえる個数

const	CF_RED_PROBLEM_ITEM_ID = 186;		//赤い宝石
const	CF_RED_PROBLEM_ITEM_NUMBER = 4;		//必要個数
const	CF_RED_REWARD_ITEM_ID = 131;		//まじゅうの皮
const	CF_RED_REWARD_ITEM_NUMBER = 1;		//もらえる個数

//------------------------------------------------
//		マップに入る前
//------------------------------------------------
function BeforeInitMap()
{
	local main_num  = GetNumFlg_("NUM_SCENARIO_MAIN");
	local event_num = GetNumFlg_("NUM_SCENARIO_SUB_GREEN");
	
	// Demo033[大ジャンプライド入手]の再生前にライドの解除を行う
	if(main_num == GetFlagID_("CONST_SM_GRASSLAND")){
		if(event_num == GetFlagID_("CONST_SS_GR_GET_RIDE_SKILL_JUMP")){
			//ライド強制解除
			SetRideOffStart_();
		}
	}

	EventEnd_();
}


//------------------------------------------------
//		フェードイン
//------------------------------------------------
function FadeIn()
{
	// ■Numフラグ取得
	local main_num  = GetNumFlg_("NUM_SCENARIO_MAIN");						// Num0
	local event_num = GetNumFlg_("NUM_SCENARIO_SUB_GREEN");					// Num2
	local event_num2 = GetNumFlg_("NUM_SCENARIO_SUB_CITY");					// Num3
	local outside_num = GetNumFlg_("NUM_SCENARIO_SUB_INSIDE_CLEAR");		// Num10
	
	// ■Bitフラグ取得
	// 全滅復帰通知フラグ
	local check_dead = GetEventFlg_("BFG_DEAD_RETURN");						// Bit21

	// 隠れているノチョーラたちを見つけたかどうか調べるフラグ
	local appear_jack  = GetEventFlg_("BFG_APPEAR_JACK");					// Bit1060
	local appear_queen = GetEventFlg_("BFG_APPEAR_QUEEN");					// Bit1061
	local appear_ace   = GetEventFlg_("BFG_APPEAR_ACE");					// Bit1062
	local appear_inn   = GetEventFlg_("BFG_APPEAR_INN");					// Bit1063

	// 隠れているノチョーラたちに初めて話しかけたかどうか調べるフラグ
	local first_time_talk_j = GetEventFlg_("BFG_FIRST_TIME_TALK_JACK");		// Bit1065
	local first_time_talk_q = GetEventFlg_("BFG_FIRST_TIME_TALK_QUEEN");	// Bit1066
	local first_time_talk_a = GetEventFlg_("BFG_FIRST_TIME_TALK_ACE");		// Bit1067
	local first_time_talk_i = GetEventFlg_("BFG_FIRST_TIME_TALK_INN");		// Bit1068

	// 移民開始フラグと移民完了フラグ
	local start_immg_flg  = GetEventFlg_("BFG_START_IMMIGRATION");			// Bit1057
	local finish_immg_flg = GetEventFlg_("BFG_FINISHED_IMMIGRATION");		// Bit1056

	// ■フラグ設定
	SetEventFlg_("BFG_H00_ITEM_SHOP_ICON", false);							// Bit1058 : 道具屋アイコン表示フラグ
	SetEventFlg_("BFG_ARRIVE_AT_H01", true);								// Bit82   : 到達フラグ_ウッドパーク
	SetEventFlg_("BFG_RULER_ADD_000", true);								// Bit200  : ルーラポイント追加_ウッドパーク

	// 擬似デモ[ジャックからの依頼]再生した後
	if(GetEventFlg_("BFG_FIXATION_CHARA_WOOD_PARK") == true){				// Bit1072
		SetEventFlg_("BFG_RESET_POS_JACK_AND_QUEEN", true);					// Bit1022 : ジャックとクイーンの配置変更フラグ
	}
	
	
	//-----------------
	// ▼マップチェンジ
	//-----------------
	// Demo015[隠れているノチョーラ]再生後 ～ Demo042[エースによるリアクター修理]再生後まで
	if(main_num == 1){
		if(event_num == GetFlagID_("CONST_SS_GR_HIDE_AND_SEEK")
		|| event_num == GetFlagID_("CONST_SS_GR_MEET_JACK")
		|| event_num == GetFlagID_("CONST_SS_GR_TALK_QUEEN")){
			// マップチェンジさせない
			SetHitEnableMapChangeNull_("w_H00_00ALdr_001", false);
		}
	}
	
	
	//----------
	// ▼NPC配置
	//----------
	// ID初期化
	npc_ACC <- C_NONE_ID;		// アクセサリー屋
	npc_ACE <- C_NONE_ID;		// エース
	npc_BNK <- C_NONE_ID;		// 銀行屋
	npc_BOK <- C_NONE_ID;		// 本屋
	npc_BUT <- C_NONE_ID;		// 肉屋
	npc_IMP <- C_NONE_ID;		// 道具屋
	npc_INN <- C_NONE_ID;		// 宿屋
	npc_JAC <- C_NONE_ID;		// ジャック
	npc_KNG <- C_NONE_ID;		// キング
	npc_A	<- C_NONE_ID;		// ノチョリン
	npc_B	<- C_NONE_ID;		// ノチョーラＢ
	npc_QEN <- C_NONE_ID;		// クイーン
	npc_REC <- C_NONE_ID;		// リアクター屋
	
	// 【草原進行中】
	if(main_num == 1){
		// demo020[ボーショック戦勝利]再生後 ～ demo034[ノチョーラの移民計画]再生後
		if(event_num >= GetFlagID_("CONST_SS_GR_RETURN_KING")					// Num2 = 18
		&& event_num <= GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_3")){			// Num2 = 32
			// フラグ設定
			SetEventFlg_("BFG_H00_ITEM_SHOP_ICON", true);						// Bit1058 : 道具屋アイコン表示フラグ
			
			// リソースの読込
			local ID_NPC_000  = ReadNpc_("n000");		// ノチョーラ男
			local ID_NPC_001  = ReadNpc_("n004");		// ノチョーラ女
			local ID_JACK     = ReadNpc_("n001");		// ジャック
			local ID_ACE      = ReadNpc_("n002");		// エース
			local ID_KING     = ReadNpc_("n003");		// キング
			local ID_QUEEN    = ReadNpc_("n005");		// クイーン
			local ID_NOCHORIN = ReadNpc_("n043");		// ノチョリン
			
			// ■アクセサリー屋
			// ■ノチョーラＢ
			if(event_num == GetFlagID_("CONST_SS_GR_INVITE_JUMP_MONSTER")		// Num2 = 29
			&& GetEventFlg_("BFG_CHANGE_POS_ACCE_SHOP_NPC") == false){			// Bit1075
				// ライド中のＡボタン攻撃の説明用
				npc_ACC = ArrangePointNpc_(ID_NPC_001, "B004");
				SetReactorEvent_(npc_ACC);
				
				// 倍速戦闘の説明用
				npc_B   = ArrangePointNpc_(ID_NPC_000, "B005");
				SetReactorEvent_(npc_B);
			}
			else{
				npc_ACC = ArrangePointNpc_(ID_NPC_001, "007");
				SetReactorEvent_(npc_ACC);
				SetSearchableAngle_(npc_ACC, SEARCHABLE_ANGLE_MINIMUM);
				
				npc_B   = ArrangePointNpc_(ID_NPC_000, "013");
				SetReactorEvent_(npc_B);
			}
			
			// ■エース
			npc_ACE = ArrangePointNpc_(ID_ACE, "003");
			SetTalkCameraType_(npc_ACE, TALK_CAMERA_UP);
			SetReactorEvent_(npc_ACE);
			
			// ■銀行屋
			npc_BNK = ArrangePointNpc_(ID_NPC_000, "008");
			SetReactorEvent_(npc_BNK);
			
			// ■本屋
			npc_BOK = ArrangePointNpc_(ID_NPC_001, "004");
			SetReactorEvent_(npc_BOK);
			
			// ■肉屋
			npc_BUT = ArrangePointNpc_(ID_NPC_000, "006");
			SetReactorEvent_(npc_BUT);
			
			// ■道具屋
			npc_IMP = ArrangePointNpc_(ID_NPC_000, "010");
			SetSearchableAngle_(npc_IMP, SEARCHABLE_ANGLE_MINIMUM);
			SetTalkCameraType_(npc_IMP, TALK_CAMERA_UP);
			SetReactorEvent_(npc_IMP);
			
			// ■宿屋
			npc_INN = ArrangePointNpc_(ID_NPC_000, "009");
			SetSearchableAngle_(npc_INN, SEARCHABLE_ANGLE_MINIMUM);
			SetTalkCameraType_(npc_INN, TALK_CAMERA_UP);
			SetReactorEvent_(npc_INN);
			
			// ■ジャック
			if(event_num >= GetFlagID_("CONST_SS_VC_TRY_RANK_C")				// Num2 = 19
			&& event_num <= GetFlagID_("CONST_SS_VC_THIRD_BATTLE")){			// Num2 = 26
				npc_JAC = ArrangePointNpc_(ID_JACK, "C001");
				SetTalkCameraType_(npc_JAC, TALK_CAMERA_UP);
				SetReactorEvent_(npc_JAC);
			}
			else{
				npc_JAC = ArrangePointNpc_(ID_JACK, "001");
				SetTalkCameraType_(npc_JAC, TALK_CAMERA_UP);
				SetReactorEvent_(npc_JAC);
			}
			
			// ■キング
			npc_KNG = ArrangePointNpc_(ID_KING, "000");
			SetSearchableAngle_(npc_KNG, SEARCHABLE_ANGLE_MINIMUM);
			SetTalkCameraType_(npc_KNG, TALK_CAMERA_UP);
			SetTalkTurn_ (npc_KNG, false);				// 振り向きOFF
			SetReactorEvent_(npc_KNG);
			
			// ■ノチョリン
			npc_A = ArrangePointNpc_(ID_NOCHORIN, "012");
			SetTalkCameraType_(npc_A, TALK_CAMERA_UP);
			SetReactorEvent_(npc_A);
			
			// ■クイーン
			npc_QEN = ArrangePointNpc_(ID_QUEEN , "002");
			SetTalkCameraType_(npc_QEN, TALK_CAMERA_UP);
			SetReactorEvent_(npc_QEN);
			
			// ■リアクター屋
			npc_REC = ArrangePointNpc_(ID_NPC_000, "005");
			SetReactorEvent_(npc_REC);
		}
	}
	
	if(main_num == 1){
		// demo015[隠れているノチョーラ]再生後
		if(event_num == GetFlagID_("CONST_SS_GR_HIDE_AND_SEEK")){				// Num2 = 7
			// ■クイーン
			//見つけたかフラグ
			if(appear_queen == true){
				if(first_time_talk_q == false){
					local ID_QUEEN = ReadNpc_("n005");
					npc_QEN = ArrangePointNpc_(ID_QUEEN , "A001");
					SetManualCalcAlpha_(npc_QEN, true);
					SetAlpha_(npc_QEN, 0.0);
				}
			}
			//話しかけたかフラグ
			if(first_time_talk_q == true){
				local ID_QUEEN   = ReadNpc_("n005");
				npc_QEN = ArrangePointNpc_(ID_QUEEN  , "A001_2");
				SetReactorMsg_(npc_QEN, "NPC_QUEEN_REC");
			}
			
			// ■エース
			//見つけたかフラグ
			if(appear_ace == true){
				if(first_time_talk_a == false){
					local ID_ACE     = ReadNpc_("n002");
					npc_ACE = ArrangePointNpc_(ID_ACE, "A002");
					SetManualCalcAlpha_(npc_ACE, true);
					SetAlpha_(npc_ACE, 0.0);
				}
			}
			//話しかけたかフラグ
			if(first_time_talk_a == true){
				local ID_ACE = ReadNpc_("n002");
				npc_ACE = ArrangePointNpc_(ID_ACE , "A002_2");
				SetReactorMsg_(npc_ACE, "NPC_ACE_REC");
			}
			
			// ■宿屋
			//見つけたかフラグ
			if(appear_inn == true){
				if(first_time_talk_i == false){
					local ID_NPC_000 = ReadNpc_("n000");
					npc_INN = ArrangePointNpc_(ID_NPC_000, "A003");
					SetManualCalcAlpha_(npc_INN, true);
					SetAlpha_(npc_INN, 0.0);
				}
			}
			//話しかけたかフラグ
			if(first_time_talk_i == true){
				local ID_NPC_000 = ReadNpc_("n000");
				npc_INN = ArrangePointNpc_(ID_NPC_000, "A003_2");
				SetReactorMsg_(npc_INN, "NPC_NOCHO_MEN_REC");
			}
			
			// ■ジャック
			//見つけたかフラグ
			if(appear_jack == true){
				local ID_JACK = ReadNpc_("n001");
				npc_JAC = ArrangePointNpc_(ID_JACK, "A000");
				SetManualCalcAlpha_(npc_JAC, true);
				SetAlpha_(npc_JAC, 0.0);
			}
			
			// ■ノチョリン
			local ID_NOCHORIN = ReadNpc_("n043");
			npc_A = ArrangePointNpc_(ID_NOCHORIN, "A004");
			SetReactorMsg_(npc_A, "NPC_NOCHO_MEN_REC");
			// ターゲット名を切替(ノチョリン→ノチョーラ)
			SetTargetNameKey_(npc_A, "NAME_TAG_NOCHORA");
		}
		
		// demo016[ジャックとの出会い]の再生後 ～ ボーショックを倒すまで
		if(event_num >= GetFlagID_("CONST_SS_GR_MEET_JACK")						// Num2 = 8
		&& event_num <= GetFlagID_("CONST_SS_GR_WIN_BOWSHOCK")){				// Num2 = 17
			// ■ジャック
			// ■クイーン
			//  擬似デモ[ジャックからの依頼]再生後まで
			if(event_num >= GetFlagID_("CONST_SS_GR_MEET_JACK")					// Num2 = 8
			&& event_num <= GetFlagID_("CONST_SS_GR_GO_RULAR_STEEL")){			// Num2 = 10
				// リソースの読込
				local ID_JACK    = ReadNpc_("n001");		// ジャック
				local ID_QUEEN   = ReadNpc_("n005");		// クイーン
				
				switch(event_num)
				{
				// Demo016[ジャックとの出会い]再生後
				case GetFlagID_("CONST_SS_GR_MEET_JACK"):
					npc_JAC = ArrangePointNpc_(ID_JACK, "B000");
					npc_QEN = ArrangePointNpc_(ID_QUEEN, "B003_1");
					SetTalkCameraType_(npc_JAC, TALK_CAMERA_UP);
					SetTalkCameraType_(npc_QEN, TALK_CAMERA_UP);
					SetReactorEvent_(npc_JAC);
					SetReactorEvent_(npc_QEN);
					
					// ターゲット名を切替(クイーン→ノチョーラ)
					SetTargetNameKey_(npc_QEN, "NAME_TAG_NOCHORA");
					break;
					
				// Demo042[エースによるリアクター修理]再生後
				case GetFlagID_("CONST_SS_GR_TALK_QUEEN"):
					npc_JAC = ArrangePointNpc_(ID_JACK, "B000_1");
					npc_QEN = ArrangePointNpc_(ID_QUEEN, "B003");
					SetTalkCameraType_(npc_JAC, TALK_CAMERA_UP);
					SetTalkCameraType_(npc_QEN, TALK_CAMERA_UP);
					SetReactorEvent_(npc_JAC);
					SetReactorEvent_(npc_QEN);
					
					// ターゲット名を切替(クイーン→ノチョーラ)
					SetTargetNameKey_(npc_QEN, "NAME_TAG_NOCHORA");
					
					// 会話できないようにする
					SetTalkEnable_(npc_JAC, false);
					SetTalkEnable_(npc_QEN, false);
					break;
					
				// 擬似デモ[ジャック・クイーンからの依頼]再生後
				case GetFlagID_("CONST_SS_GR_GO_RULAR_STEEL"):
					// 配置変更しない
					if(GetEventFlg_("BFG_RESET_POS_JACK_AND_QUEEN") == false){	// Bit1022
						npc_JAC = ArrangePointNpc_(ID_JACK , "001");
						npc_QEN = ArrangePointNpc_(ID_QUEEN, "002");
						SetTalkCameraType_(npc_JAC, TALK_CAMERA_UP);
						SetTalkCameraType_(npc_QEN, TALK_CAMERA_UP);
						SetReactorEvent_(npc_JAC);
						SetReactorEvent_(npc_QEN);
					}
					// 配置変更する
					else{
						npc_JAC = ArrangePointNpc_(ID_JACK , "B000_2");
						npc_QEN = ArrangePointNpc_(ID_QUEEN, "B002");
						SetTalkCameraType_(npc_JAC, TALK_CAMERA_UP);
						SetTalkCameraType_(npc_QEN, TALK_CAMERA_UP);
						SetReactorEvent_(npc_JAC);
						SetReactorEvent_(npc_QEN);
					}
					break;
					
				default:
					DebugPrint("キングが帰還するまで配置しておく条件に該当していません");
					break;
				}
			}
			else{
				local ID_JACK    = ReadNpc_("n001");
				local ID_QUEEN   = ReadNpc_("n005");
				
				npc_JAC = ArrangePointNpc_(ID_JACK , "001");
				npc_QEN = ArrangePointNpc_(ID_QUEEN, "002");
				SetTalkCameraType_(npc_JAC, TALK_CAMERA_UP);
				SetTalkCameraType_(npc_QEN, TALK_CAMERA_UP);
				SetReactorEvent_(npc_JAC);
				SetReactorEvent_(npc_QEN);
			}
			
			// リソースの読込
			local ID_NPC_000  = ReadNpc_("n000");		// ノチョーラ男
			local ID_ACE      = ReadNpc_("n002");		// エース
			local ID_NOCHORIN = ReadNpc_("n043");		// ノチョリン
			
			// ■宿屋
			npc_INN = ArrangePointNpc_(ID_NPC_000, "009");
			SetSearchableAngle_(npc_INN, SEARCHABLE_ANGLE_MINIMUM);
			SetTalkCameraType_(npc_INN, TALK_CAMERA_UP);
			SetReactorEvent_(npc_INN);
			
			// ■ノチョリン
			npc_A = ArrangePointNpc_(ID_NOCHORIN, "B001");
			SetTalkCameraType_(npc_A, TALK_CAMERA_UP);
			SetReactorEvent_(npc_A);
			
			// ■エース
			// demo016[ジャックとの出会い]再生後
			if(event_num == GetFlagID_("CONST_SS_GR_MEET_JACK")){				// NUm2 = 8
				npc_ACE = ArrangePointNpc_(ID_ACE, "003");
				SetTalkCameraType_(npc_ACE, TALK_CAMERA_DEF);
				SetReactorEvent_(npc_ACE);
			}
			else{
				npc_ACE = ArrangePointNpc_(ID_ACE, "003");
				SetTalkCameraType_(npc_ACE, TALK_CAMERA_UP);
				SetReactorEvent_(npc_ACE);
			}
			
			// 向き設定
			// demo016[ジャックとの出会い]再生後
			if(event_num == GetFlagID_("CONST_SS_GR_MEET_JACK")){				// Num2 = 8
				// ジャックとノチョリンを向き合わせる
				SetDirToPoint_(npc_JAC, "B001");
				SetDirToPoint_(npc_A, "B000");
			}
			else{
				SetDir_(npc_A, 60);
			}
		}
	}
	
	
	//----------
	// ▼NPC配置
	//----------
	// ID初期化
	g_npc_cf_white <- C_NONE_ID;
	g_npc_cf_green <- C_NONE_ID;
	g_npc_cf_black <- C_NONE_ID;
	g_npc_cf_blue <- C_NONE_ID;
	g_npc_cf_yellow <- C_NONE_ID;
	g_npc_cf_red <- C_NONE_ID;

	// 【草原クリア後】
	if( GetEventFlg_("BFG_SCENARIO_CLEAR_GRASS") == true ){
		// ■ホワイト
		g_npc_cf_white  = ArrangePointNpc_(ReadNpc_("n044"), "npc_color_white");
		SetScaleSilhouette(g_npc_cf_white, SCALE.N, SILHOUETTE_WIDTH.N);
		SetTalkCameraType_(g_npc_cf_white, TALK_CAMERA_UP);
		SetReactorMsg_(g_npc_cf_white, "NPC_COLORFONDUE_WHITE_REC");

		// ■グリーン
		if( GetEventFlg_("BFG_STEALTHBOX_LARGE_OPEN_01") == true ){
			g_npc_cf_green  = ArrangePointNpc_(ReadNpc_("n049"), "npc_color_green");
			SetScaleSilhouette(g_npc_cf_green, SCALE.N, SILHOUETTE_WIDTH.N);
			SetSearchableAngle_(g_npc_cf_green, SEARCHABLE_ANGLE_MINIMUM);
			SetReactorMsg_(g_npc_cf_green, "NPC_COLORFONDUE_GREEN_REC");
		}

		// ■ブラック
		if( GetEventFlg_("BFG_STEALTHBOX_LARGE_OPEN_02") == true ){
			g_npc_cf_black  = ArrangePointNpc_(ReadNpc_("n045"), "npc_color_black");
			SetScaleSilhouette(g_npc_cf_black, SCALE.N, SILHOUETTE_WIDTH.N);
			SetTalkCameraType_(g_npc_cf_black, TALK_CAMERA_UP);
			SetSearchableAngle_(g_npc_cf_black, SEARCHABLE_ANGLE_MINIMUM);
			SetReactorMsg_(g_npc_cf_black, "NPC_COLORFONDUE_BLACK_REC");
			SetEventFlg_("BFG_H00_ITEM_SHOP_ICON", true);		// 道具屋アイコン
			SetNumFlg_("NUM_FLG_SHOP_H01_00_ITEM_LEVEL", 1);	//フォンデュ経営用のレベルに変更
		}

		// ■ブルー
		if( GetEventFlg_("BFG_STEALTHBOX_LARGE_OPEN_03") == true ){
			g_npc_cf_blue  = ArrangePointNpc_(ReadNpc_("n047"), "npc_color_blue");
			SetScaleSilhouette(g_npc_cf_blue, SCALE.N, SILHOUETTE_WIDTH.N);
			SetReactorMsg_(g_npc_cf_blue, "NPC_COLORFONDUE_BLUE_REC");
		}

		// ■イエロー
		if( GetEventFlg_("BFG_STEALTHBOX_LARGE_OPEN_04") == true ){
			g_npc_cf_yellow  = ArrangePointNpc_(ReadNpc_("n048"), "npc_color_yellow");
			SetScaleSilhouette(g_npc_cf_yellow, SCALE.N, SILHOUETTE_WIDTH.N);
			SetReactorMsg_(g_npc_cf_yellow, "NPC_COLORFONDUE_YELLOW_REC");
		}

		// ■レッド
		if( GetEventFlg_("BFG_STEALTHBOX_LARGE_OPEN_05") == true ){
			g_npc_cf_red  = ArrangePointNpc_(ReadNpc_("n046"), "npc_color_red");
			SetScaleSilhouette(g_npc_cf_red, SCALE.N, SILHOUETTE_WIDTH.N);
			SetReactorMsg_(g_npc_cf_red, "NPC_COLORFONDUE_RED_REC");
		}
	}
	
	// 初期化
	npc_Rukiya <- C_NONE_ID;
	
	// 【表シナリオクリア後】
	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){ // NUM000 = 9
		if(outside_num == GetFlagID_("CONST_SS_OS_GO_POINT_ZERO")){ // NUM010 = 2
			// ポイント・ゼロに入ったら配置されないようにする
			if(GetEventFlg_("BFG_DEMO801_AFTER_U00_00") == false){		// Bit1386
				npc_Rukiya = ReadAndArrangePointNpc("n009", "014");
				SetTalkCameraType_(npc_Rukiya, TALK_CAMERA_UP);
				SetReactorMsg_(npc_Rukiya, "NPC_RUKIYA_REC");
				// 会話カメラ時に透過されるのでアルファ値を設定する
				SetManualCalcAlpha_(npc_Rukiya, true);
				SetAlpha_(npc_Rukiya, 1.0);
			}
		}
	}

//----------------------------------------------------------
// 全滅復帰処理
	// 全滅復帰時の擬似デモ移行の準備(EventStartOperate()内でArrangePointNpc_()が行えないので)
	if(check_dead == true){
		if(main_num == GetFlagID_("CONST_SM_GRASSLAND")){
			if(event_num >= GetFlagID_("CONST_SS_GR_GO_RULAR_STEEL")
			&& event_num < GetFlagID_("CONST_SS_GR_RETURN_KING")){
				// ノチョリンを一時的に会話できないようにする
				SetTalkEnable_(npc_A, false);
			}
			else if(event_num >= GetFlagID_("CONST_SS_GR_RETURN_KING")
			&& event_num < GetFlagID_("CONST_SS_GR_CLIFF")){
				// キングを一時的に会話できないようにする
				SetTalkEnable_(npc_KNG, false);
			}
			else if(event_num >= GetFlagID_("CONST_SS_GR_CLIFF")){
				// ノチョリンを一時的に配置
				dead_npc <- C_NONE_ID;
				dead_npc = ReadAndArrangePointNpc("n043", "B001");
				SetTalkEnable_(dead_npc, false);
			}
		}
	}

//------------------------------------------------------------------
// ギミック
	// モノリス
	local g_monolith = ReadGimmick_("o_com_02");
	monolith <- ArrangePointGimmick_("o_com_02", g_monolith, "g_monolith");
	//「！」アイコン
	local exclamation01 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "g_monolith"); 
	//モノリス解禁後、「！」アイコンを表示
	if(main_num <= 1 && event_num < GetFlagID_("CONST_SS_VC_TRY_RANK_C")){
		SetNaviMapIconVisible_(exclamation01, false);
	}
	else{
		SetNaviMapIconVisible_(exclamation01, true);
	}

	// 進入禁止の旗
	if(main_num <= 1 && event_num < GetFlagID_("CONST_SS_VC_TRY_RANK_C")){
		local g_flag = ReadGimmick_("o_H01_01");
		local stop_flag = ArrangePointGimmick_("o_H01_01", g_flag, "g_flag");
	}

	//ノチョーラたちが隠れるギミック
	local id_barrel = ReadGimmick_("o_H01_03");
	local id_wooden_box = ReadGimmick_("o_H01_04");
	local green01 = ArrangePointGimmick_("o_H01_03", id_barrel, "g_green_01");//クイーン
	local green02 = ArrangePointGimmick_("o_H01_04", id_wooden_box, "g_green_02");//エース
	local green03 = ArrangePointGimmick_("o_H01_03", id_barrel, "g_green_03");//宿屋
	local green04 = ArrangePointGimmick_("o_H01_04", id_wooden_box, "g_green_04");//ジャック

//------------------------------------------------------------------
// イベント地雷の設置
	// モノリス(イベント地雷)
	Monolith    <- C_NONE_ID;
	Mine_Exit_K <- C_NONE_ID;
	Mine_Exit   <- C_NONE_ID;
	Mine_INN    <- C_NONE_ID;
	Mine_Exit_E <- C_NONE_ID;

	Monolith = SetPointCircleEventMine_("Monolith", true);
	// リアクターをエースに直してもらわずにパークを出るとジャックに呼び止められる地雷
	if(main_num == 1){
		if(event_num == GetFlagID_("CONST_SS_GR_GET_RIDE_SKILL_JUMP")){
			Mine_Exit_K = SetPointCircleEventMine_("Mine_Exit", false);
			// この時だけルーラ禁止なのでフラグを立てる（フラグ設定はEventEnd_()直前で行います
		}
	}
	// リアクター修理後ジャックとクイーンに近づく
	if(event_num == GetFlagID_("CONST_SS_GR_TALK_QUEEN")){
		Mine_Exit = SetPointCircleEventMine_("Mine_Exit", false);
	}
	// 無人宿屋用イベント地雷(移民開始～移民完了まで配置)
	if(start_immg_flg == true && finish_immg_flg == false){
		Mine_INN = SetPointCircleEventMine_("Mine_INN", true);
	}
	// 
	// 無人宿屋用イベント地雷(カラーフォンデュイベントの為、条件< 移民完了以降 >を追加)
	if(start_immg_flg == false && finish_immg_flg == true){
		Mine_INN = SetPointCircleEventMine_("Mine_INN", true);
	}
	// ＮＰＣたちを見つけるまで、ウッドパークの入口を閉鎖する地雷
	if(main_num == GetFlagID_("CONST_SM_GRASSLAND")){
		if(event_num == GetFlagID_("CONST_SS_GR_HIDE_AND_SEEK")){
			Mine_Exit_E = SetPointCircleEventMine_("Mine_Exit", false);
		}
	}

//-------------------------------------------------------------------------------
//リアクターポイント
	//大樹
	local reactorPoint01 = ArrangeMsgReactorPoint("reactorPoint_01", GetFlagID_("BFG_REACTER_POINT_006")
		, LONG_DIST, "REC_POINT_GR_01_01", "REC_POINT_GR_01_02");
	//モノリス
	local reactorPoint02 = ArrangeMsgReactorPoint("reactorPoint_02", GetFlagID_("BFG_REACTER_POINT_013")
		, SHORT_DIST, "REC_POINT_GR_02_01", "REC_POINT_GR_02_02");
	//演算処理装置
	local reactorPoint03 = ArrangeMsgReactorPoint("reactorPoint_03", GetFlagID_("BFG_REACTER_POINT_008")
		, SHORT_DIST, "REC_POINT_GR_03_01", "REC_POINT_GR_03_02");
	//貯水湖
	local reactorPoint04 = ArrangeMsgReactorPoint("reactorPoint_04", GetFlagID_("BFG_REACTER_POINT_007")
		, SHORT_DIST, "REC_POINT_GR_04_01", "REC_POINT_GR_04_02");

	//隠れているノチョーラたちに初めて話しかけたかどうか調べるフラグ
	local first_time_talk_j = GetEventFlg_("BFG_FIRST_TIME_TALK_JACK");
	local first_time_talk_q = GetEventFlg_("BFG_FIRST_TIME_TALK_QUEEN");
	local first_time_talk_a = GetEventFlg_("BFG_FIRST_TIME_TALK_ACE");
	local first_time_talk_i = GetEventFlg_("BFG_FIRST_TIME_TALK_INN");

	//ノチョーラたちが隠れるギミックのリアクターポイント
	if(main_num == 1){
		// Demo009[隠れているノチョーラ]後に配置する
		if(event_num == GetFlagID_("CONST_SS_GR_HIDE_AND_SEEK")){
			//ギミックに一度話しかけたか
			if(first_time_talk_q == false){
				reactorPoint_queen <- ArrangeMsgReactorPoint("reactorPoint_queen", GetFlagID_("BFG_REACTER_POINT_174")
					, SHORT_DIST, "REC_POINT_GR_06_01", "REC_POINT_GR_06_02");
				//reactorPoint_queen <- ArrangePointReactorPoint_("reactorPoint_queen", SHORT_DIST); // 旧
			}
			if(first_time_talk_a == false){
				reactorPoint_ace <- ArrangeMsgReactorPoint("reactorPoint_ace", GetFlagID_("BFG_REACTER_POINT_172")
					, SHORT_DIST, "REC_POINT_GR_05_01", "REC_POINT_GR_05_02");
				//reactorPoint_ace <- ArrangePointReactorPoint_("reactorPoint_ace", SHORT_DIST); // 旧
			}
			if(first_time_talk_i == false){
				reactorPoint_inn <- ArrangeMsgReactorPoint("reactorPoint_inn", GetFlagID_("BFG_REACTER_POINT_175")
					, SHORT_DIST, "REC_POINT_GR_06_01", "REC_POINT_GR_06_02");
				//reactorPoint_inn <- ArrangePointReactorPoint_("reactorPoint_inn", SHORT_DIST); // 旧
			}
			reactorPoint_jack <- ArrangeMsgReactorPoint("reactorPoint_jack", GetFlagID_("BFG_REACTER_POINT_173")
				, SHORT_DIST, "REC_POINT_GR_05_01", "REC_POINT_GR_05_02");
			//reactorPoint_jack <- ArrangePointReactorPoint_("reactorPoint_jack", SHORT_DIST); // 旧
		}
	}
//----------------------------------------------------------------------
// ルーラ禁止
	if(main_num == 1){
		if(event_num == GetFlagID_("CONST_SS_GR_GET_RIDE_SKILL_JUMP")){
			// ルーラを禁止するフラグを設定
			SetEventFlg_("BFG_PLAYERABILITY_RULER_PROHIBIT", true);
		}
	}

// 会話アイコン
	LoadEffect_("EF300_21_TALK_ICON");
	sTalkIconId <- array(HIDE_NPC_KIND.NUM, C_NONE_ID);	// 四人分の配列を作って、C_NONE_ID で初期化

	EventEnd_();
}

//------------------------------------------------
//		イベントスタート
//------------------------------------------------
function EventStartOperate()
{
	local main_num    = GetNumFlg_("NUM_SCENARIO_MAIN");
	local event_num   = GetNumFlg_("NUM_SCENARIO_SUB_GREEN");
	local core_num    = GetNumFlg_("NUM_SCENARIO_SUB_CORE");
	local outside_num = GetNumFlg_("NUM_SCENARIO_SUB_INSIDE_CLEAR");

	DebugPrint(" ");
	DebugPrint("NUM_SCENARIO_MAIN の値は " + main_num + " になりました。(ノチョーラパーク)");
	DebugPrint("NUM_SCENARIO_SUB_GREEN の値は " + event_num + " になりました。(ノチョーラパーク)");

	local check_dead = GetEventFlg_("BFG_DEAD_RETURN");
//---------------------------------------------------------------------------------------
// ギミック( デモを挟まずにアニメを切り替えるオブジェクトのみ配置 )
//
	// モノリス(「起動前待機」のアニメを設定)
	SetMotion_(monolith, "GIMMICK_0", 0);
	DebugPrint("モノリスのアニメはGIMMICK_0です");
	if(GetEventFlg_("BFG_START_C_MONOLITH") == true){
		// モノリスの起動後待機アニメを再生
		SetMotion_(monolith, MOT_GIMMICK_2, BLEND_N);
		DebugPrint("モノリスのアニメはGIMMICK_2です");
	}

//-----------------------------------------------------------------
// 切り替え直後に発生するデモ

	if(main_num == 1){
		// ノチョーラの移民計画③の再生
		if(event_num == GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_2")){
			// デモ再生前にフィールドが映らないための対応
			SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
			SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
			WaitFade_();
			// サブフラグを GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_3") に変更
			SetNumFlg_("NUM_SCENARIO_SUB_GREEN", GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_3"));
			// マップをノチョーラパークに変更する(仮処理)
			SetReturnDemoMap_("H01_00");
			SetReturnDemoPosDir_(Vec3(-20.0, 0.0, 3.0), 270);
			// Demo036[ノチョーラの移民計画③]が再生される処理
			ChangeDemo_(36);
		}
		// ノチョーラの移民計画②の再生
		if(event_num == GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_1")){
			// デモ再生前にフィールドが映らないための対応
			SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
			SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
			WaitFade_();
			// サブフラグを GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_2") に変更
			SetNumFlg_("NUM_SCENARIO_SUB_GREEN", GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_2"));
			// Demo035[ノチョーラの移民計画②]が再生される処理
			ChangeDemo_(35);
		}
		// Demo033[大ジャンプライド入手]を再生
		if(event_num == GetFlagID_("CONST_SS_GR_GET_RIDE_SKILL_JUMP")){
			// デモ再生前にフィールドが映らないための対応
			SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
			SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
			WaitFade_();
			// ルーラを禁止するフラグを設定
			SetEventFlg_("BFG_PLAYERABILITY_RULER_PROHIBIT", false);

			// あばれうしどりを捕まえていない場合のフラグの変更
			SetNumFlg_("NUM_SCENARIO_SUB_GREEN", GetFlagID_("CONST_SS_GR_INVITE_JUMP_MONSTER"));

			SetReturnDemoMap_("H01_00");
			SetReturnDemoPosDir_(Vec3(-18.125, 3.700, -2.875), -89);
			// Demo33を再生
			ChangeDemo_(33);
		}
		if(event_num == GetFlagID_("CONST_SS_GR_RETURN_KING")){
			// デモ再生前にフィールドが映らないための対応
			SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
			SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
			WaitFade_();
			// サブフラグを GetFlagID_("CONST_SS_GR_RETURN_KING") に変更
			SetNumFlg_("NUM_SCENARIO_SUB_GREEN", GetFlagID_("CONST_SS_VC_TRY_RANK_C"));
			// 全滅復帰マップを変更(Redmine#2261全滅復帰ルールの改訂)
			SetNumFlg_("NUM_DEAD_RETURN_MAP", GetFlagID_("CONST_DEAD_RETURN_MAP_H01_00"));
			// マップをノチョーラパークに変更する(仮処理)
			SetReturnDemoMap_("H01_00");
			SetReturnDemoPosDir_(Vec3(-24.33, 3.70, 0.326), -91);
			// Demo21[キングの帰還]が再生される処理
			ChangeDemo_(21);
		}
		if(event_num == GetFlagID_("CONST_SS_GR_INVITE_MONSTER")){
			// デモ再生前にフィールドが映らないための対応
			SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
			SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
			WaitFade_();
			// シナリオフラグを進める
			SetNumFlg_("NUM_SCENARIO_SUB_GREEN", GetFlagID_("CONST_SS_GR_HIDE_AND_SEEK"));
			// 敵パーティのお供体数を制御フラグ(進行度２
			SetNumFlg_("NUM_ENEMY_PARTY_STRENGTH", 2);
			// マップをノチョーラパークに変更する(仮処理)
			SetReturnDemoMap_("H01_00");
			SetReturnDemoPosDir_(Vec3(251.155, -1.329, -2.057), -102);

			// Demo015[隠れているノチョーラ]が再生される処理
			ChangeDemo_(15);
		}
	}

	// 裏シナリオ
	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){ // NUM000 = 9
		if(outside_num == GetFlagID_("CONST_SS_OS_GO_WOOD_PARK")){ // NUM010 = 1
			// 天候と時間帯の固定の為に一時的にクリアフラグを降ろしていた処理を解除
			SetEventFlg_("BFG_SCENARIO_CLEAR_GRASS", true);
			// シナリオ進行フラグ( NUM010 を 1 -> 2 に変更 )
			SetNumFlg_("NUM_SCENARIO_SUB_INSIDE_CLEAR", GetFlagID_("CONST_SS_OS_GO_POINT_ZERO"));
			// デモの復帰位置をデモの完成後に設定します
			SetReturnDemoPosDir_(Vec3(15, 0, 0), -90);
			// Demo801[ルキヤとの再会]再生
			EventStartChangeDemo(801, FADE_COLOR_BLACK);
		}
	}

//-----------------------------------------------------------------
// 全滅復帰処理 : 東藤さん指示(一部挙動が異なるので共通関数に置き換えません)
	if(check_dead == true){
		if(main_num == GetFlagID_("CONST_SM_GRASSLAND")){
			if(event_num >= GetFlagID_("CONST_SS_GR_GO_RULAR_STEEL")
			&& event_num < GetFlagID_("CONST_SS_GR_RETURN_KING")){
				// 全滅通知Bitフラグをfalseに戻す( プログラムで立ててスクリプトで降ろす )
				SetEventFlg_("BFG_DEAD_RETURN", false);
				// 全滅復帰デモ
				uDeadReturnDemo1();
			}
			else if(event_num >= GetFlagID_("CONST_SS_GR_RETURN_KING")
			&& event_num < GetFlagID_("CONST_SS_GR_CLIFF")){
				// 全滅通知Bitフラグをfalseに戻す( プログラムで立ててスクリプトで降ろす )
				SetEventFlg_("BFG_DEAD_RETURN", false);
				// 全滅復帰デモ
				uDeadReturnDemo2();
			}
			else if(event_num >= GetFlagID_("CONST_SS_GR_CLIFF")){
				// 全滅通知Bitフラグをfalseに戻す( プログラムで立ててスクリプトで降ろす )
				SetEventFlg_("BFG_DEAD_RETURN", false);
				// 全滅復帰デモ
				uDeadReturnDemo3();
			}
		}
	}

//-------------------------------------------------------------
//リアクターポイント

	//隠れているノチョーラたちに初めて話しかけたかどうか調べるフラグ
	local first_time_talk_j  = GetEventFlg_("BFG_FIRST_TIME_TALK_JACK");
	local first_time_talk_q  = GetEventFlg_("BFG_FIRST_TIME_TALK_QUEEN");
	local first_time_talk_a  = GetEventFlg_("BFG_FIRST_TIME_TALK_ACE");
	local first_time_talk_i  = GetEventFlg_("BFG_FIRST_TIME_TALK_INN");

	//ノチョーラたちが隠れるギミックのリアクターポイント
	if(main_num == 1){
		// Demo009[隠れているノチョーラ]後に配置する
		if(event_num == GetFlagID_("CONST_SS_GR_HIDE_AND_SEEK")){
			//ギミックに一度話しかけたか
			if(first_time_talk_q == false){
				SetReactorEvent_(reactorPoint_queen);
			}
			if(first_time_talk_a == false){
				SetReactorEvent_(reactorPoint_ace);
			}
			if(first_time_talk_i == false){
				SetReactorEvent_(reactorPoint_inn);
			}
			SetReactorEvent_(reactorPoint_jack);
		}
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

	// シナリオのメインフラグを取得する
	local main_num = GetNumFlg_("NUM_SCENARIO_MAIN");

	// フラグからイベント番号を取得する
	local event_num = GetNumFlg_("NUM_SCENARIO_SUB_GREEN");

	// Demo022[Cランク試験]が再生されたかどうかのフラグ
	local bit_demo022 = GetEventFlg_("BFG_EXAM_RANK_C");

	if(target == Mine_Exit){
	// 擬似デモ[ジャックからの依頼]
		//地雷削除
		DeleteEventMine_(Mine_Exit);
		// サブフラグを CONST_SS_GR_GO_RULAR_STEEL に変更
		SetNumFlg_("NUM_SCENARIO_SUB_GREEN", GetFlagID_("CONST_SS_GR_GO_RULAR_STEEL"));
		// 暗転
		SetFade_(FADE_OUT , FADE_COLOR_BLACK, 30);
		SetFadeSub_(FADE_OUT , FADE_COLOR_BLACK, 30);
		WaitFade_();
		// 非常駐モーション読込(主人公うなずき)
		local nod = ReadMotion_(player, "Player_nod");
		//カメラを扉とジャッククイーンをななめに捉えるように調整
		SetCameraDir_(63);
		//プレイヤーの座標を扉正面に調整。
		SetPos_(player, Vec3(256.094, -1.236, 1.317));
		SetDir_(player, 86);
		//ジャックからしゃべるので、クイーンは最初は主人公の方を向かない。
		SetDir_(npc_QEN, -90);
		SetMotion_(npc_QEN, "WAIT", BLEND_N);
		//ジャックが主人公の方を向く
		SetDirToPlayer_(npc_JAC);
		Wait_(30);
		// 暗転明け
		SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);
		WaitFade_();
		// ジャックのメッセージ
		SetMotion_(npc_JAC, "TALKLOOP", BLEND_M);
		CommonMessageT("DEMO_048_MSG_001", "NAME_TAG_JACK");
		SetMotion_(npc_JAC, "WAIT", BLEND_M);
		// 主人公頷く
		Wait_(15);
		SetMotion_(player, nod, BLEND_M);
		WaitMotion(player);
		SetMotion_(player, MOT_WAIT, BLEND_L);
		// ジャックのメッセージ
		SetMotion_(npc_JAC, "TALKLOOP", BLEND_M);
		CommonMessageT("DEMO_048_MSG_002", "NAME_TAG_JACK");
		SetMotion_(npc_JAC, "WAIT", BLEND_M);
		//クイーンが主人公の方を向く
		SetDirToPlayer_(npc_QEN);
		// クイーンのメッセージ
		SetMotion_(npc_QEN, "TALKLOOP", BLEND_M);
		CommonMessageT("DEMO_048_MSG_003", "NAME_TAG_QUEEN");
		SetMotion_(npc_QEN, "WAIT", BLEND_M);
		// アイテム入手メッセージ表示
		// SE再生
		PlaySE_("SE_SYS_011");
		CommonMessageT("DEMO_048_MSG_004", "NAME_NONE");
		// 装備品に追加(ちからのゆびわ)
		CommAddAccessory(200, EQUIP_GRADE.NONE);
		// フラグの追加( 2次DB #3731 )
		//SetEventFlg_("BFG_EQUIPACCESSORY_PROHIBIT", false); //アクセサリ装備（アクティブ）
		//SetEventFlg_("BFG_TRAVEL_INFO_SHOW_013", true); // 旅の心得の項目解放フラグ	【メニュー】アクセサリー装備
		// 暗転(上画面のみ)
		SetFade_(FADE_OUT , FADE_COLOR_BLACK, 30);
		WaitFade_();
		// 暗転中にジャックとクイーンの位置を変更
		//クイーンの再配置
		SetHideIfFar_(npc_QEN, false);
		SetActive_(npc_QEN, false);
		local ID_QUEEN = ReadNpc_("n005"); // クイーンモデル
		npc_QEN = ArrangePointNpc_(ID_QUEEN  , "B002");
		SetReactorMsg_(npc_QEN, "NPC_QUEEN_REC");
		//ジャックの再配置
		SetHideIfFar_(npc_JAC, false);
		SetActive_(npc_JAC, false);
		local ID_JACK = ReadNpc_("n001"); // ジャックのモデル
		npc_JAC = ArrangePointNpc_(ID_JACK, "B000_2");
		SetReactorMsg_(npc_JAC, "NPC_JACK_REC");
		// ジャック・クイーンの配置変更フラグ(入口付近:true, 所定位置:false)
		SetEventFlg_("BFG_RESET_POS_JACK_AND_QUEEN", true);
		SetEventFlg_("BFG_FIXATION_CHARA_WOOD_PARK", true);
		// 会話時カメラの設定
		SetTalkCameraType_(npc_JAC, TALK_CAMERA_UP);
		SetTalkCameraType_(npc_QEN, TALK_CAMERA_UP);
		Wait_(30);
		//プレイヤーの座標を扉正面に調整。
		SetPos_(player, Vec3(256.094, -1.236, 1.317));
		SetDir_(player, 86);
		SetCameraDir_(86);
		// マップチェンジできるようにする
		SetHitEnableMapChangeNull_("w_H00_00ALdr_001", true);
		// 暗転明け
		SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);
		SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, 30);
		WaitFade_();
		Wait_(15);
	}

	// モノリス
	if(target == Monolith){
		//地雷削除
		DeleteEventMine_(Monolith);

		// 主人公をモノリスの方向に向ける
		CommPlayerTurnAroundObj(monolith);

		// モノリスのアニメを再生(EventCommon)
		MonolithAnime(monolith, "BFG_START_C_MONOLITH", "g_monolith");

		// マップチェンジ後のマップ名・復帰座標・向きを変数を格納
		local map_name = "O01_00";
		local return_pos = Vec3(0.0, 10.0, 1260.0);	// 座標
		local return_dir = 180;						// 本対応の向き

		// Demo022[Cランク試験]が再生する処理
		if(main_num == 1 && event_num == GetFlagID_("CONST_SS_GR_RETURN_KING")){
			if(bit_demo022 == false){
				// サブフラグを CONST_SM_VC_TRY_RANK_C に変更
				SetNumFlg_("NUM_SCENARIO_SUB_GREEN", GetFlagID_("CONST_SS_VC_TRY_RANK_C"));
				// マップをバーチャルコロシアムに変更する
				SetReturnDemoMap_(map_name);
				SetReturnDemoPosDir_(return_pos, return_dir);
				// Demo022[Cランク試験]が再生された状態にフラグを移行
				SetEventFlg_("BFG_EXAM_RANK_C", true);
				ChangeDemo_(22);
			}
			else{
			// 通常のマップチェンジ
			ChangeMapPosDir_(map_name, return_pos, return_dir);
			}
		}
		else{
			// 通常のマップチェンジ
			ChangeMapPosDir_(map_name, return_pos, return_dir);
		}
	}

	if(main_num == 1){
		// バーチャルコロシアムから帰ってきたときにキングに報告せずにパークから出ると止められる
		if(event_num == GetFlagID_("CONST_SS_GR_GET_RIDE_SKILL_JUMP")){
			if(target == Mine_Exit_K){
				PlayerLeaveMine("NAME_TAG_KING", "DEMO_022_AFT_KING", 256.0, -1.225, -0.64, -90);
			}
		}
	}

	// 無人の宿屋
	if(target == Mine_INN){
		// 指定座標に回転
		local obj_pos = Vec3(213.00, 0.00, -65.00);
		local rotateTask = Task_RotateToPosSetMotion_(player, obj_pos, ROTATE_EVENT_DEF, MOT_WALK, MOT_WAIT);
		WaitTask(rotateTask);
		// 間を持たせる
		Wait_(15);
		NotInInnMessage();
	}

	// 隠れているノチョーラのイベント中の進行不可地雷
	if(target == Mine_Exit_E){
		// 主人公の位置を取得
		local playerPos = GetPos_(player);
		// 発見エフェクトをノチョリンに表示
		LoadEffect_("EF712_10_EMO_SURPRISE01");			// 「！」
		SurpriseDisp(npc_A);
		Wait_(15);
		// ノチョリンをプレイヤーの方に向かせる< 備忘録 : Task_RotateToPos_()した後,WaitTask()しないと回転しないので注意 >
		SetMotion_(npc_A, "WALK", BLEND_M);
		local ROT_DIR = 6; // 回転画
		local rotateTask = Task_RotateToPos_(npc_A, playerPos, ROT_DIR);
		WaitTask(rotateTask);
		SetMotion_(npc_A, "WAIT", BLEND_M);
		OpenMsgWnd_();
		ShowMsg_("DEMO_012_AFT_MINE");
		KeyInputWait_();
		CloseMsgWnd_();
		Wait_(5);
		// ノチョリンも正面に向き直る
		SetMotion_(npc_A, "WALK", BLEND_M);
		// ノチョリンを向き直させる座標
		local frondPos = Vec3(-245.000, 0.000, -7.000);
		local rotateFrontTask = Task_RotateToPos_(npc_A, frondPos, ROT_DIR);
		// ノチョリンを待機モーションに戻す
		WaitTask(rotateFrontTask);
		SetMotion_(npc_A, "WAIT", BLEND_M);
		// プレイヤー移動
		CommPlayerTurnMoveDirWalk(-90);
	}

	EventEnd_();
}


//------------------------------------------------
//		ＮＰＣ会話直前
//------------------------------------------------
function BeforeTalkNpc()
{
 	// フラグを取得する
	local main_num = GetNumFlg_("NUM_SCENARIO_MAIN");
	local event_num = GetNumFlg_("NUM_SCENARIO_SUB_GREEN");

   // 話しかけられているNPCのIDを取得
    local target = GetTargetId_();
	
	//------------------------------------
	// ライド中の会話カメラオフセット設定
	//------------------------------------
	// ■キング
	if(target == npc_KNG){
		// あばれうしどりを捕まえたかどうかで会話が分岐する
		if(event_num == GetFlagID_("CONST_SS_GR_INVITE_JUMP_MONSTER")){
			// 大ジャンプできる種族のモンスターにライドしている
			if(CheckHighJumpMonsterRide() == true){
				SetTalkCameraType_(target, TALK_CAMERA_DEF);
			}else{
				SetTalkCameraType_(target, TALK_CAMERA_UP);
			}
		}
	}
	
	// ■ルキヤ
	if(target == npc_Rukiya){
		SetRideTalkCamOffset(OFFSET_RUKIYA);
	}
	
	// ■カラーフォンデュ(ホワイト)
	if(target == g_npc_cf_white){
		//兄弟そろっているかチェックカウント
		local cf_count = uReturnColorFondueNum();
		//全員揃っている
		if ( cf_count == CF_COLORFONDUE_COUNTMAX ) {
			//ペイント配合解禁していない(擬似デモ再生時のみ)
			if(GetEventFlg_("BFG_COUPLING_UNLOCK_PAINT") == false){
				SetTalkTurn_(target, false);
				SetTalkCameraType_(target, TALK_CAMERA_DEF);
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
	local target = GetTargetId_();
	local player = GetPlayerId_();

	// シナリオのメインフラグを取得する
	local main_num = GetNumFlg_("NUM_SCENARIO_MAIN");

	// フラグからイベント番号を取得する
	local event_num = GetNumFlg_("NUM_SCENARIO_SUB_GREEN");

	//隠れているノチョーラたちを見つけたかどうか調べるフラグ
	local appear_jack  = GetEventFlg_("BFG_APPEAR_JACK");
	local appear_queen = GetEventFlg_("BFG_APPEAR_QUEEN");
	local appear_ace   = GetEventFlg_("BFG_APPEAR_ACE");
	local appear_inn   = GetEventFlg_("BFG_APPEAR_INN");

	//隠れているノチョーラたちに初めて話しかけたかどうか調べるフラグ
	local first_time_talk_j  = GetEventFlg_("BFG_FIRST_TIME_TALK_JACK");
	local first_time_talk_q = GetEventFlg_("BFG_FIRST_TIME_TALK_QUEEN");
	local first_time_talk_a   = GetEventFlg_("BFG_FIRST_TIME_TALK_ACE");
	local first_time_talk_i   = GetEventFlg_("BFG_FIRST_TIME_TALK_INN");

// Demo009[隠れているノチョーラ]後に話せるNPC
	// エース
	if(target == npc_ACE){
		if(main_num == 1){
			if(event_num >= GetFlagID_("CONST_SS_GR_HIDE_AND_SEEK")){
				if(appear_ace == true){
					if(event_num == GetFlagID_("CONST_SS_GR_HIDE_AND_SEEK")){
						if(first_time_talk_a == false){
							CommHideAndSeek(target, reactorPoint_ace, player);
						}
						else{
							// 通常会話( 第４引数を「0」)
							TalkTaget(target, main_num, event_num, 0);
						}
					}
					else if(event_num >= GetFlagID_("CONST_SS_GR_MEET_JACK")
					&& event_num <= GetFlagID_("CONST_SS_GR_GO_RULAR_STEEL")){
						switch(event_num)
						{
						// Demo016[ジャックとの出会い]再生後
						case GetFlagID_("CONST_SS_GR_MEET_JACK"):
							// サブフラグを GetFlagID_("CONST_SS_GR_TALK_QUEEN") に変更
							SetNumFlg_("NUM_SCENARIO_SUB_GREEN", GetFlagID_("CONST_SS_GR_TALK_QUEEN"));
							// フラグ
							SetEventFlg_("BFG_REACTOR_UNLOCK_STEALTHBOX_SONAR", true);	//ステルスボックスのソナー解禁
							SetEventFlg_("BFG_TRAVEL_INFO_SHOW_039", true);				//旅の心得の項目解放フラグ【フィールド】ステルスボックス
							// 主人公の配置位置を合わせる
							SetReturnDemoPosDir_(Vec3(39.37, -0.039, -99.184), -175);
							// 話しかけたらすぐにフェード ＋ Demo42[エースによるリアクター修理]を再生
							TouchNpcChangeDemo(42);
							break;
						// Demo042[エースによるリアクター修理]再生後
						case GetFlagID_("CONST_SS_GR_TALK_QUEEN"):
							OpenMsgWnd_();
							SetTalkName_("NAME_TAG_ACE");
							ShowMsg_("DEMO_013_AFT_ACE_2");
							KeyInputWait_();
							CloseMsgWnd_();
							break;
						// 擬似デモ[ジャック・クイーンからの依頼]再生後
						case GetFlagID_("CONST_SS_GR_GO_RULAR_STEEL"):
							OpenMsgWnd_();
							SetTalkName_("NAME_TAG_ACE");
							ShowMsg_("DEMO_013_AFT_ACE");
							KeyInputWait_();
							CloseMsgWnd_();
							break;
						default:
							DebugPrint("エースの会話する条件を満たしていません");
							break;
						}
					}
					else{
						// 通常会話( 第４引数を「0」)
						TalkTaget(target, main_num, event_num, 0);
					}
				}
			}
		}
	}
	// 宿屋
	if(target == npc_INN){
		if(appear_inn == true){
			if(main_num == 1){
				// 通常会話
				if(event_num == 0 || event_num == GetFlagID_("CONST_SS_GR_HIDE_AND_SEEK")){
					if(first_time_talk_i == false){
						CommHideAndSeek(target, reactorPoint_inn, player);
					}
					else{
						// 通常会話( 第４引数を「0」)
						TalkTaget(target, main_num, event_num, 0);
					}
				}
				// 宿屋会話
				else{
					local player = GetPlayerId_();
					InnMessage(npc_INN, "INN_NOC_MSG_1ST_001","INN_NOC_MSG_1ST_002","INN_NOC_MSG_1ST_003");
				}
			}
			// 宿屋会話
			else{
				local player = GetPlayerId_();
				InnMessage(npc_INN, "INN_NOC_MSG_1ST_001","INN_NOC_MSG_1ST_002","INN_NOC_MSG_1ST_003");
			}
		}
	}
	// ジャック
	if(target == npc_JAC){
		if(appear_jack == true){
			if(main_num == 1){
				if(event_num == GetFlagID_("CONST_SS_GR_HIDE_AND_SEEK")){
					// サブフラグを GetFlagID_("CONST_SS_GR_MEET_JACK") に変更
					SetNumFlg_("NUM_SCENARIO_SUB_GREEN", GetFlagID_("CONST_SS_GR_MEET_JACK"));
					SetEventFlg_("BFG_TRAVEL_INFO_SHOW_007", true);	// 旅の心得の項目解放フラグ	【基本】仲間モンスターの回復

					// 主人公の配置位置を[ジャックとの出会い]デモ後に合わせる
					SetReturnDemoMap_("H01_00");
					SetReturnDemoPosDir_(Vec3(75.9, -1.26, 7.7), -172);

					SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
					SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
					WaitFade_();

					// α値を元に戻す
					SetManualCalcAlpha_(npc_JAC, true);
					SetAlpha_(npc_JAC, 1.0);

					//隠れているノチョーラを見つけたフラグ
					SetEventFlg_("BFG_APPEAR_JACK", true);
					SetEventFlg_("BFG_APPEAR_QUEEN", true);
					SetEventFlg_("BFG_APPEAR_ACE", true);
					SetEventFlg_("BFG_APPEAR_INN", true);
					SetEventFlg_("BFG_FIRST_TIME_TALK_JACK", true);
					SetEventFlg_("BFG_FIRST_TIME_TALK_QUEEN", true);
					SetEventFlg_("BFG_FIRST_TIME_TALK_ACE",true);
					SetEventFlg_("BFG_FIRST_TIME_TALK_INN", true);

					// 全滅復帰マップを変更(Redmine#2261全滅復帰ルールの改訂)
					SetNumFlg_("NUM_DEAD_RETURN_MAP", GetFlagID_("CONST_DEAD_RETURN_MAP_H01_00"));

					// Demo016[ジャックとの出会い]を再生
					ChangeDemo_(16); 
				}
				else if(event_num >= GetFlagID_("CONST_SS_GR_MEET_JACK")
				&& event_num <= GetFlagID_("CONST_SS_GR_WIN_BOWSHOCK")){
					// Demo016[ジャックとの出会い]再生後
					if(event_num == GetFlagID_("CONST_SS_GR_MEET_JACK")){
						CommonMessageT("DEMO_013_AFT_JAC_WARNING", "NAME_TAG_JACK");
					}
					// Demo042[エースによるリアクター修理]再生後
					else if(event_num == GetFlagID_("CONST_SS_GR_TALK_QUEEN")){
						// 話しかけられないようにしているので何も処理しない
					}
					// 擬似デモ[ジャック・クイーンからの依頼]再生後～ボーショック戦勝利まで
					else{
						TalkTaget(target, main_num, event_num, 0);
					}
				}
				// 通常会話
				else{
					TalkTaget(target, main_num, event_num, 0);
				}
			}
		}
	}
	// クイーン
	if(target == npc_QEN){
		if(appear_queen == true){
			if(main_num == 1){
				if(event_num == GetFlagID_("CONST_SS_GR_HIDE_AND_SEEK")){
					if(first_time_talk_q == false){
						CommHideAndSeek(target, reactorPoint_queen, player);
					}
					else{
						// 通常会話( 第４引数を「0」)
						TalkTaget(target, main_num, event_num, 0);
					}
				}
				else if(event_num >= GetFlagID_("CONST_SS_GR_MEET_JACK")
				&& event_num <= GetFlagID_("CONST_SS_GR_WIN_BOWSHOCK")){
					// Demo016[ジャックとの出会い]再生後
					if(event_num == GetFlagID_("CONST_SS_GR_MEET_JACK")){
						CommonMessageT("DEMO_013_AFT_QEN_WARNING", "NAME_NONE");
					}
					// Demo042[エースによるリアクター修理]再生後
					else if(event_num == GetFlagID_("CONST_SS_GR_TALK_QUEEN")){
						// 話しかけられないようにしているので何も処理しない
					}
					// 擬似デモ[ジャック・クイーンからの依頼]再生後～ボーショック戦勝利まで
					else{
						TalkTaget(target, main_num, event_num, 0);
					}
				}
				// 通常会話
				else{
					TalkTaget(target, main_num, event_num, 0);
				}
			}
		}
	}
	// NPC_A( ノチョリン )
	if(target == npc_A){
		if(main_num == 1){
			if(event_num >= GetFlagID_("CONST_SS_GR_HIDE_AND_SEEK")){
				TalkTaget(target, main_num, event_num, 0);
			}
		}
	}

// Demo015[キングの帰還]後に話しかけられるNPC
	// アクセサリー屋
	if(target == npc_ACC){
		if(main_num == 1){
			if(event_num >= GetFlagID_("CONST_SS_GR_RETURN_KING")){
				TalkTaget(target, main_num, event_num, 0);
			}
		}
	}
	// 銀行屋
	if(target == npc_BNK){
		if(main_num == 1){
			if(event_num >= GetFlagID_("CONST_SS_GR_RETURN_KING")){
				TalkTaget(target, main_num, event_num, 0);
			}
		}
	}
	// 本屋
	if(target == npc_BOK){
		if(main_num == 1){
			if(event_num >= GetFlagID_("CONST_SS_GR_RETURN_KING")){
				TalkTaget(target, main_num, event_num, 0);
			}
		}
	}
	// 肉屋
	if(target == npc_BUT){
		if(main_num == 1){
			if(event_num >= GetFlagID_("CONST_SS_GR_RETURN_KING")){
				TalkTaget(target, main_num, event_num, 0);
			}
		}
	}
	// 道具屋
	if(target == npc_IMP){
		if(main_num == 1){
			if(event_num >= GetFlagID_("CONST_SS_GR_RETURN_KING")){
				TalkTaget(target, main_num, event_num, 0);
			}
		}
	}
	// NPC_B
	if(target == npc_B){
		if(main_num == 1){
			if(event_num >= GetFlagID_("CONST_SS_GR_RETURN_KING")){
				TalkTaget(target, main_num, event_num, 0);
			}
		}
	}
	// リアクター屋
	if(target == npc_REC){
		if(main_num == 1){
			if(event_num >= GetFlagID_("CONST_SS_GR_RETURN_KING")){
				TalkTaget(target, main_num, event_num, 0);
			}
		}
	}
	// キング
	if(target == npc_KNG){
				// あばれうしどりを捕まえたかどうかで会話が分岐する
				if(event_num == GetFlagID_("CONST_SS_GR_INVITE_JUMP_MONSTER")){
					// 大ジャンプできる種族のモンスターにライドしている
					if(CheckHighJumpMonsterRide() == true){
						//★↓移民計画の３連続デモを１つのみ再生に変更
						//堀井さんROM提出後にフラグ整形します。（20150331東藤）
						//// サブフラグを CONST_SS_GR_IMMIGRATION_PLAN に変更
						SetNumFlg_("NUM_SCENARIO_SUB_GREEN", GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_1"));
						// サブフラグを GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_3") に変更
						SetNumFlg_("NUM_SCENARIO_SUB_GREEN", GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_3"));
						// デモ再生後の復帰位置を調整
						SetReturnDemoMap_("H01_00");
						SetReturnDemoPosDir_(Vec3(-18.125, 3.700, -2.875), -89);
						//★↑

						// あばれうしどり逃がせないフラグ
						SetEventFlg_("BFG_ABARE_LET_ESCAPE_PROHIBIT", true);
						// 話しかけたらすぐにフェード ＋ Demo034[ノチョーラの移民計画①]を再生
						TouchNpcChangeDemo(34);
					}
					else{
						if(CheckHighJumpMonsterKind() == true){
							// ライドして話かけるように促す
							OpenMsgWnd_();
							SetTalkName_("NAME_TAG_KING");
							ShowMsg_("DEMO_023_AFT_KNG_RIDE_OFF");
							KeyInputWait_();
							CloseMsgWnd_();
						}
						else{
							TalkTaget(target, main_num, event_num, 0);
						}
					}
				}

				// 通常会話
				else{
					TalkTaget(target, main_num, event_num, 0);
				}

	}

// 移民後のNPCの会話（カラーフォンデュ）

	//兄弟そろっているかチェックカウント（カラーフォンデュ全員使うので頭でカウントしてる）
	local cf_count = uReturnColorFondueNum();

	//カラーフォンデュ　ホワイト
	if(target == g_npc_cf_white){
		//全員揃っている
		if ( cf_count == CF_COLORFONDUE_COUNTMAX ) {
			//ペイント配合解禁している
			if(GetEventFlg_("BFG_COUPLING_UNLOCK_PAINT") == true){
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_CF_WHITE");
				ShowMsg_("COLORFONDUE_WHITE_001");
				KeyInputWait_();
				ShowMsg_("COLORFONDUE_WHITE_002");
				KeyInputWait_();
				CloseMsgWnd_();

			//ペイント配合解禁していない
			} else {
				// 擬似デモ ペイント配合解禁！
				uColorFondueDemo(player);
			}
			//このタイミングでは本来不要だけど、こっそりtrueにしておく
			SetEventFlg_("BFG_COLOREVENT_WHITE_FIRST_TALK", true);

		//揃ってない
		} else {
			//初めてホワイトに話しかけた
			if(GetEventFlg_("BFG_COLOREVENT_WHITE_FIRST_TALK") == false){
				SetEventFlg_("BFG_COLOREVENT_WHITE_FIRST_TALK", true);
				//助けた数は 0 体
				if( cf_count == 0 ){
					OpenMsgWnd_();
					ShowMsg_("COLORFONDUE_WHITE_201");
					KeyInputWait_();
					CloseMsgWnd_();
					// 発見エフェクトをホワイトに表示
					local ef_id = SetBoneEffect_("ef300_20_target_icon", g_npc_cf_white);
					SetEffectScale_(ef_id, 0.5);
					PlaySE_("SE_DEM_053");
					Wait_(20);
					OpenMsgWnd_();
					ShowMsg_("COLORFONDUE_WHITE_202");
					KeyInputWait_();
					ShowMsg_("COLORFONDUE_WHITE_203");
					KeyInputWait_();
					ShowMsg_("COLORFONDUE_WHITE_204");
					KeyInputWait_();
					SetTalkName_("NAME_TAG_CF_WHITE");
					ShowMsg_("COLORFONDUE_WHITE_205");
					KeyInputWait_();
					ShowMsg_("COLORFONDUE_WHITE_206");
					KeyInputWait_();
				//助けた数は 1 体以上５体未満
				} else {
					OpenMsgWnd_();
					ShowMsg_("COLORFONDUE_WHITE_301");
					KeyInputWait_();
					CloseMsgWnd_();
					// 発見エフェクトをホワイトに表示
					local ef_id = SetBoneEffect_("ef300_20_target_icon", g_npc_cf_white);
					SetEffectScale_(ef_id, 0.5);
					PlaySE_("SE_DEM_053");
					Wait_(20);
					OpenMsgWnd_();
					ShowMsg_("COLORFONDUE_WHITE_302");
					KeyInputWait_();
					ShowMsg_("COLORFONDUE_WHITE_303");
					KeyInputWait_();
					ShowMsg_("COLORFONDUE_WHITE_304");
					KeyInputWait_();
					SetTalkName_("NAME_TAG_CF_WHITE");
					ShowMsg_("COLORFONDUE_WHITE_305");
					KeyInputWait_();
					ShowMsg_("COLORFONDUE_WHITE_306");
					KeyInputWait_();
				}
				//「はい」を選ばないかぎり進まない選択肢
				while ( true ) {
					//選択肢で「はい」を選択
					if ( GetQueryResult_() == QUERY2_0 ) {
						ShowMsg_("COLORFONDUE_WHITE_208");
						KeyInputWait_();
						ShowMsg_("COLORFONDUE_WHITE_209");
						KeyInputWait_();
						ShowMsg_("COLORFONDUE_WHITE_210");
						KeyInputWait_();
						ShowMsg_("COLORFONDUE_WHITE_211");
						KeyInputWait_();
						SetExchangeNumber_( CF_COLORFONDUE_COUNTMAX - cf_count);
						ShowMsg_("COLORFONDUE_WHITE_212");
						KeyInputWait_();
						ShowMsg_("COLORFONDUE_WHITE_213");
						KeyInputWait_();
						CloseMsgWnd_();
						//ループから抜ける
						break;

					//選択肢で「いいえ」を選択
					} else {
						ShowMsg_("COLORFONDUE_WHITE_207");
						KeyInputWait_();
						//ループで戻る
					}
				}

			//２回目以降でホワイトに話しかけた
			} else {
				//グリーンを助けていない
				if ( GetEventFlg_("BFG_STEALTHBOX_LARGE_OPEN_01") == false ) {
					OpenMsgWnd_();
					SetTalkName_("NAME_TAG_CF_WHITE");
					ShowMsg_("COLORFONDUE_WHITE_401");
					KeyInputWait_();
					SetExchangeNumber_( CF_COLORFONDUE_COUNTMAX - cf_count);
					ShowMsg_("COLORFONDUE_WHITE_402");
					KeyInputWait_();
					ShowMsg_("COLORFONDUE_WHITE_403");
					KeyInputWait_();
					CloseMsgWnd_();

				//ブラックを助けていない
				} else if ( GetEventFlg_("BFG_STEALTHBOX_LARGE_OPEN_02") == false ) {
					OpenMsgWnd_();
					SetTalkName_("NAME_TAG_CF_WHITE");
					ShowMsg_("COLORFONDUE_WHITE_501");
					KeyInputWait_();
					SetExchangeNumber_( CF_COLORFONDUE_COUNTMAX - cf_count);
					ShowMsg_("COLORFONDUE_WHITE_502");
					KeyInputWait_();
					ShowMsg_("COLORFONDUE_WHITE_503");
					KeyInputWait_();
					CloseMsgWnd_();

				//ブルーを助けていない
				} else if ( GetEventFlg_("BFG_STEALTHBOX_LARGE_OPEN_03") == false ) {
					OpenMsgWnd_();
					SetTalkName_("NAME_TAG_CF_WHITE");
					ShowMsg_("COLORFONDUE_WHITE_601");
					KeyInputWait_();
					SetExchangeNumber_( CF_COLORFONDUE_COUNTMAX - cf_count);
					ShowMsg_("COLORFONDUE_WHITE_602");
					KeyInputWait_();
					ShowMsg_("COLORFONDUE_WHITE_603");
					KeyInputWait_();
					CloseMsgWnd_();

				//イエローを助けていない
				} else if ( GetEventFlg_("BFG_STEALTHBOX_LARGE_OPEN_04") == false ) {
					OpenMsgWnd_();
					SetTalkName_("NAME_TAG_CF_WHITE");
					ShowMsg_("COLORFONDUE_WHITE_701");
					KeyInputWait_();
					SetExchangeNumber_( CF_COLORFONDUE_COUNTMAX - cf_count);
					ShowMsg_("COLORFONDUE_WHITE_702");
					KeyInputWait_();
					ShowMsg_("COLORFONDUE_WHITE_703");
					KeyInputWait_();
					CloseMsgWnd_();

				//レッドを助けていない
				} else if ( GetEventFlg_("BFG_STEALTHBOX_LARGE_OPEN_05") == false ) {
					OpenMsgWnd_();
					SetTalkName_("NAME_TAG_CF_WHITE");
					ShowMsg_("COLORFONDUE_WHITE_801");
					KeyInputWait_();
					SetExchangeNumber_( CF_COLORFONDUE_COUNTMAX - cf_count);
					ShowMsg_("COLORFONDUE_WHITE_802");
					KeyInputWait_();
					ShowMsg_("COLORFONDUE_WHITE_803");
					KeyInputWait_();
					CloseMsgWnd_();
				}

				local chk = false;
				local monskind = 0;
				local mons_count  = 0;

				// 所持モンスターの中にカラーフォンデュがいるかを確認
				for(mons_count = 0; mons_count <= ( GetOwnerMonsterNum_() - 1 ); mons_count++){
					monskind = GetOwnerMonsterKind_(mons_count);
					if(monskind == CF_COLORFONDUE_MONSTER_ID){
						chk = true;
						break;
					}
				}
				//所持している
				if ( chk == true ) {
					// 「！」ピコン
					local ef_id = SetSelectBoneEffectSetOffset_("ef300_20_target_icon", g_npc_cf_white, ATTACH_EFFECT2, Vec3(0.0, 10.0, 0.0));
					SetEffectScale_(ef_id, 0.3);
					PlaySE_("SE_DEM_053");
					Wait_(20);
					
					OpenMsgWnd_();
					SetTalkName_("NAME_TAG_CF_WHITE");
					ShowMsg_("COLORFONDUE_WHITE_901");
					KeyInputWait_();
					ShowMsg_("COLORFONDUE_WHITE_902");
					KeyInputWait_();
					ShowMsg_("COLORFONDUE_WHITE_903");
					KeyInputWait_();
					CloseMsgWnd_();

				//所持していない
				} else {
					//なにもせずに終了
				}

			}
		}
	}


	//グリーン
	if(target == g_npc_cf_green){
		local chk = false;
		//全員揃っている
		if(cf_count == CF_COLORFONDUE_COUNTMAX){
			//ペイント配合解禁している
			if(GetEventFlg_("BFG_COUPLING_UNLOCK_PAINT") == true){
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_CF_GREEN");
				ShowMsg_("COLORFONDUE_GREEN_001");
				KeyInputWait_();
				ShowMsg_("COLORFONDUE_GREEN_002");
				KeyInputWait_();
				ShowMsg_("COLORFONDUE_GREEN_003");
				KeyInputWait_();
				CloseMsgWnd_();

				chk = true;
			//解禁していない
			} else {
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_CF_GREEN");
				ShowMsg_("COLORFONDUE_GREEN_401");
				KeyInputWait_();
				ShowMsg_("COLORFONDUE_GREEN_402");
				KeyInputWait_();
				CloseMsgWnd_();
			}
		//揃っていない
		} else {
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_CF_GREEN");
			ShowMsg_("COLORFONDUE_GREEN_501");
			KeyInputWait_();
			ShowMsg_("COLORFONDUE_GREEN_502");
			KeyInputWait_();
			ShowMsg_("COLORFONDUE_GREEN_503");
			KeyInputWait_();
			CloseMsgWnd_();

			chk = true;
		}

		if ( chk == true ) {
			chk = false;

			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_CF_GREEN");
				SetExchangeItemName_(CF_GREEN_PROBLEM_ITEM_ID);
			ShowMsg_("COLORFONDUE_GREEN_004");
			KeyInputWait_();
				SetExchangeItemName_(CF_GREEN_PROBLEM_ITEM_ID);
			ShowMsg_("COLORFONDUE_GREEN_005");
			KeyInputWait_();
				SetExchangeItemName_(CF_GREEN_PROBLEM_ITEM_ID);
				SetExchangeNumber_(CF_GREEN_PROBLEM_ITEM_NUMBER);
				SetExchangeItemName_(CF_GREEN_REWARD_ITEM_ID);
				SetExchangeNumber_(CF_GREEN_REWARD_ITEM_NUMBER);
			ShowMsg_("COLORFONDUE_GREEN_006");
			KeyInputWait_();
			//選択肢で「はい」を選択
			if ( GetQueryResult_() == QUERY2_0 ) {
				//指定アイテムを指定個数以上持っている
				if ( CF_GREEN_PROBLEM_ITEM_NUMBER <= GetItemNum_(CF_GREEN_PROBLEM_ITEM_ID) ) {
					CloseMsgWnd_();

					OpenMsgWnd_();
						SetExchangeItemName_(CF_GREEN_PROBLEM_ITEM_ID);
						SetExchangeNumber_(CF_GREEN_PROBLEM_ITEM_NUMBER);
						SetExchangeItemName_(CF_GREEN_REWARD_ITEM_ID);
						SetExchangeNumber_(CF_GREEN_REWARD_ITEM_NUMBER);
					ShowMsg_("COLORFONDUE_GREEN_101");
					KeyInputWait_();
					CloseMsgWnd_();

					//交換
					AddItem_(CF_GREEN_PROBLEM_ITEM_ID, -CF_GREEN_PROBLEM_ITEM_NUMBER);
					AddItem_(CF_GREEN_REWARD_ITEM_ID, CF_GREEN_REWARD_ITEM_NUMBER);

					OpenMsgWnd_();
					SetTalkName_("NAME_TAG_CF_GREEN");
					SetExchangeItemName_(CF_GREEN_PROBLEM_ITEM_ID);
					ShowMsg_("COLORFONDUE_GREEN_102");
					KeyInputWait_();
					CloseMsgWnd_();

				//指定アイテムを指定個数以上持っていない
				} else {
					ShowMsg_("COLORFONDUE_GREEN_201");
					KeyInputWait_();
						SetExchangeItemName_(CF_GREEN_PROBLEM_ITEM_ID);
						SetExchangeNumber_(CF_GREEN_PROBLEM_ITEM_NUMBER);
					ShowMsg_("COLORFONDUE_GREEN_202");
					KeyInputWait_();
					CloseMsgWnd_();

				}
			//選択肢で「いいえ」を選択
			} else {
				ShowMsg_("COLORFONDUE_GREEN_301");
				KeyInputWait_();
				CloseMsgWnd_();
			}
		}
	}

	//ブラック
	if(target == g_npc_cf_black){
		local chk = false;
		//全員揃っている
		if(cf_count == CF_COLORFONDUE_COUNTMAX){
			//ペイント配合解禁している
			if(GetEventFlg_("BFG_COUPLING_UNLOCK_PAINT") == true){
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_CF_BLACK");
				ShowMsg_("COLORFONDUE_BLACK_001");
				KeyInputWait_();
				ShowMsg_("COLORFONDUE_BLACK_002");
				KeyInputWait_();
				ShowMsg_("COLORFONDUE_BLACK_003");
				KeyInputWait_();
				CloseMsgWnd_();

				chk = true;
			//解禁していない
			} else {
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_CF_BLACK");
				ShowMsg_("COLORFONDUE_BLACK_401");
				KeyInputWait_();
				ShowMsg_("COLORFONDUE_BLACK_402");
				KeyInputWait_();
				CloseMsgWnd_();
			}
		//揃っていない
		} else {
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_CF_BLACK");
			ShowMsg_("COLORFONDUE_BLACK_501");
			KeyInputWait_();
			ShowMsg_("COLORFONDUE_BLACK_502");
			KeyInputWait_();
			CloseMsgWnd_();

			chk = true;
		}

		if ( chk == true ) {
			chk = false;

			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_CF_BLACK");
			ShowMsg_("COLORFONDUE_BLACK_004");
			KeyInputWait_();
			ShowMsg_("COLORFONDUE_BLACK_005");
			KeyInputWait_();
			//選択肢で「はい」を選択
			if ( GetQueryResult_() == QUERY2_0 ) {
				CloseMsgWnd_();

				GotoMenuFadeOpen(MENU_OPEN.H01_00_ITEM);

				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_CF_BLACK");
				ShowMsg_("COLORFONDUE_BLACK_101");
				KeyInputWait_();
				CloseMsgWnd_();

			//選択肢で「いいえ」を選択
			} else {
				ShowMsg_("COLORFONDUE_BLACK_301");
				KeyInputWait_();
				CloseMsgWnd_();
			}
		}
	}

	//ブルー
	if(target == g_npc_cf_blue){
		local chk = false;
		//全員揃っている
		if(cf_count == CF_COLORFONDUE_COUNTMAX){
			//ペイント配合解禁している
			if(GetEventFlg_("BFG_COUPLING_UNLOCK_PAINT") == true){
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_CF_BLUE");
				ShowMsg_("COLORFONDUE_BLUE_001");
				KeyInputWait_();
				ShowMsg_("COLORFONDUE_BLUE_002");
				KeyInputWait_();
				ShowMsg_("COLORFONDUE_BLUE_003");
				KeyInputWait_();
				CloseMsgWnd_();

				chk = true;
			//解禁していない
			} else {
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_CF_BLUE");
				ShowMsg_("COLORFONDUE_BLUE_401");
				KeyInputWait_();
				ShowMsg_("COLORFONDUE_BLUE_402");
				KeyInputWait_();
				CloseMsgWnd_();
			}
		//揃っていない
		} else {
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_CF_BLUE");
			ShowMsg_("COLORFONDUE_BLUE_501");
			KeyInputWait_();
			ShowMsg_("COLORFONDUE_BLUE_502");
			KeyInputWait_();
			CloseMsgWnd_();

			chk = true;
		}

		if ( chk == true ) {
			chk = false;

			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_CF_BLUE");
				SetExchangeItemName_(CF_BLUE_PROBLEM_ITEM_ID);
			ShowMsg_("COLORFONDUE_BLUE_004");
			KeyInputWait_();
				SetExchangeItemName_(CF_BLUE_PROBLEM_ITEM_ID);
				SetExchangeNumber_(CF_BLUE_PROBLEM_ITEM_NUMBER);
				SetExchangeItemName_(CF_BLUE_REWARD_ITEM_ID);
				SetExchangeNumber_(CF_BLUE_REWARD_ITEM_NUMBER);
			ShowMsg_("COLORFONDUE_BLUE_005");
			KeyInputWait_();
			//選択肢で「はい」を選択
			if ( GetQueryResult_() == QUERY2_0 ) {
				//指定アイテムを指定個数以上持っている
				if ( CF_BLUE_PROBLEM_ITEM_NUMBER <= GetItemNum_(CF_BLUE_PROBLEM_ITEM_ID) ) {
					CloseMsgWnd_();

					OpenMsgWnd_();
						SetExchangeItemName_(CF_BLUE_PROBLEM_ITEM_ID);
						SetExchangeNumber_(CF_BLUE_PROBLEM_ITEM_NUMBER);
						SetExchangeItemName_(CF_BLUE_REWARD_ITEM_ID);
						SetExchangeNumber_(CF_BLUE_REWARD_ITEM_NUMBER);
					ShowMsg_("COLORFONDUE_BLUE_101");
					KeyInputWait_();
					CloseMsgWnd_();

					//交換
					AddItem_(CF_BLUE_PROBLEM_ITEM_ID, -CF_BLUE_PROBLEM_ITEM_NUMBER);
					AddItem_(CF_BLUE_REWARD_ITEM_ID, CF_BLUE_REWARD_ITEM_NUMBER);

					OpenMsgWnd_();
					SetTalkName_("NAME_TAG_CF_BLUE");
					ShowMsg_("COLORFONDUE_BLUE_102");
					KeyInputWait_();
					CloseMsgWnd_();

				//指定アイテムを指定個数以上持っていない
				} else {
					ShowMsg_("COLORFONDUE_BLUE_201");
					KeyInputWait_();
						SetExchangeItemName_(CF_BLUE_PROBLEM_ITEM_ID);
						SetExchangeNumber_(CF_BLUE_PROBLEM_ITEM_NUMBER);
					ShowMsg_("COLORFONDUE_BLUE_202");
					KeyInputWait_();
					CloseMsgWnd_();

				}
			//選択肢で「いいえ」を選択
			} else {
				ShowMsg_("COLORFONDUE_BLUE_301");
				KeyInputWait_();
				CloseMsgWnd_();
			}
		}
	}


	//イエロー
	if(target == g_npc_cf_yellow){
		local chk = false;
		//全員揃っている
		if(cf_count == CF_COLORFONDUE_COUNTMAX){
			//ペイント配合解禁している
			if(GetEventFlg_("BFG_COUPLING_UNLOCK_PAINT") == true){
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_CF_YELLOW");
				ShowMsg_("COLORFONDUE_YELLOW_001");
				KeyInputWait_();
				ShowMsg_("COLORFONDUE_YELLOW_002");
				KeyInputWait_();
				ShowMsg_("COLORFONDUE_YELLOW_003");
				KeyInputWait_();
				CloseMsgWnd_();

				chk = true;
			//解禁していない
			} else {
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_CF_YELLOW");
				ShowMsg_("COLORFONDUE_YELLOW_401");
				KeyInputWait_();
				ShowMsg_("COLORFONDUE_YELLOW_402");
				KeyInputWait_();
				CloseMsgWnd_();
			}
		//揃っていない
		} else {
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_CF_YELLOW");
			ShowMsg_("COLORFONDUE_YELLOW_501");
			KeyInputWait_();
			ShowMsg_("COLORFONDUE_YELLOW_502");
			KeyInputWait_();
			CloseMsgWnd_();

			chk = true;
		}

		if ( chk == true ) {
			chk = false;

			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_CF_YELLOW");
				SetExchangeItemName_(CF_YELLOW_PROBLEM_ITEM_ID);
			ShowMsg_("COLORFONDUE_YELLOW_004");
			KeyInputWait_();
				SetExchangeItemName_(CF_YELLOW_PROBLEM_ITEM_ID);
				SetExchangeNumber_(CF_YELLOW_PROBLEM_ITEM_NUMBER);
				SetExchangeItemName_(CF_YELLOW_REWARD_ITEM_ID);
				SetExchangeNumber_(CF_YELLOW_REWARD_ITEM_NUMBER);
			ShowMsg_("COLORFONDUE_YELLOW_005");
			KeyInputWait_();
			//選択肢で「はい」を選択
			if ( GetQueryResult_() == QUERY2_0 ) {
				//指定アイテムを指定個数以上持っている
				if ( CF_YELLOW_PROBLEM_ITEM_NUMBER <= GetItemNum_(CF_YELLOW_PROBLEM_ITEM_ID) ) {
					CloseMsgWnd_();

					OpenMsgWnd_();
						SetExchangeItemName_(CF_YELLOW_PROBLEM_ITEM_ID);
						SetExchangeNumber_(CF_YELLOW_PROBLEM_ITEM_NUMBER);
						SetExchangeItemName_(CF_YELLOW_REWARD_ITEM_ID);
						SetExchangeNumber_(CF_YELLOW_REWARD_ITEM_NUMBER);
					ShowMsg_("COLORFONDUE_YELLOW_101");
					KeyInputWait_();
					CloseMsgWnd_();

					//交換
					AddItem_(CF_YELLOW_PROBLEM_ITEM_ID, -CF_YELLOW_PROBLEM_ITEM_NUMBER);
					AddItem_(CF_YELLOW_REWARD_ITEM_ID, CF_YELLOW_REWARD_ITEM_NUMBER);

					OpenMsgWnd_();
					SetTalkName_("NAME_TAG_CF_YELLOW");
					ShowMsg_("COLORFONDUE_YELLOW_102");
					KeyInputWait_();
					CloseMsgWnd_();

				//指定アイテムを指定個数以上持っていない
				} else {
					SetExchangeItemName_(CF_YELLOW_PROBLEM_ITEM_ID);
					ShowMsg_("COLORFONDUE_YELLOW_201");
					KeyInputWait_();
						SetExchangeItemName_(CF_YELLOW_PROBLEM_ITEM_ID);
						SetExchangeNumber_(CF_YELLOW_PROBLEM_ITEM_NUMBER);
					ShowMsg_("COLORFONDUE_YELLOW_202");
					KeyInputWait_();
					CloseMsgWnd_();

				}
			//選択肢で「いいえ」を選択
			} else {
				ShowMsg_("COLORFONDUE_YELLOW_301");
				KeyInputWait_();
				CloseMsgWnd_();
			}
		}
	}

	//レッド
	if(target == g_npc_cf_red){
		local chk = false;
		//全員揃っている
		if(cf_count == CF_COLORFONDUE_COUNTMAX){
			//ペイント配合解禁している
			if(GetEventFlg_("BFG_COUPLING_UNLOCK_PAINT") == true){
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_CF_RED");
				ShowMsg_("COLORFONDUE_RED_001");
				KeyInputWait_();
				ShowMsg_("COLORFONDUE_RED_002");
				KeyInputWait_();
				ShowMsg_("COLORFONDUE_RED_003");
				KeyInputWait_();
				CloseMsgWnd_();

				chk = true;
			//解禁していない
			} else {
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_CF_RED");
				ShowMsg_("COLORFONDUE_RED_401");
				KeyInputWait_();
				ShowMsg_("COLORFONDUE_RED_402");
				KeyInputWait_();
				CloseMsgWnd_();
			}
		//揃っていない
		} else {
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_CF_RED");
			ShowMsg_("COLORFONDUE_RED_501");
			KeyInputWait_();
			ShowMsg_("COLORFONDUE_RED_502");
			KeyInputWait_();
			CloseMsgWnd_();

			chk = true;
		}

		if ( chk == true ) {
			chk = false;

			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_CF_RED");
				SetExchangeItemName_(CF_RED_PROBLEM_ITEM_ID);
			ShowMsg_("COLORFONDUE_RED_004");
			KeyInputWait_();
				SetExchangeItemName_(CF_RED_PROBLEM_ITEM_ID);
				SetExchangeNumber_(CF_RED_PROBLEM_ITEM_NUMBER);
				SetExchangeItemName_(CF_RED_REWARD_ITEM_ID);
				SetExchangeNumber_(CF_RED_REWARD_ITEM_NUMBER);
			ShowMsg_("COLORFONDUE_RED_005");
			KeyInputWait_();
			//選択肢で「はい」を選択
			if ( GetQueryResult_() == QUERY2_0 ) {
				//指定アイテムを指定個数以上持っている
				if ( CF_RED_PROBLEM_ITEM_NUMBER <= GetItemNum_(CF_RED_PROBLEM_ITEM_ID) ) {
					CloseMsgWnd_();

					OpenMsgWnd_();
						SetExchangeItemName_(CF_RED_PROBLEM_ITEM_ID);
						SetExchangeNumber_(CF_RED_PROBLEM_ITEM_NUMBER);
						SetExchangeItemName_(CF_RED_REWARD_ITEM_ID);
						SetExchangeNumber_(CF_RED_REWARD_ITEM_NUMBER);
					ShowMsg_("COLORFONDUE_RED_101");
					KeyInputWait_();
					CloseMsgWnd_();

					//交換
					AddItem_(CF_RED_PROBLEM_ITEM_ID, -CF_RED_PROBLEM_ITEM_NUMBER);
					AddItem_(CF_RED_REWARD_ITEM_ID, CF_RED_REWARD_ITEM_NUMBER);

					OpenMsgWnd_();
					SetTalkName_("NAME_TAG_CF_RED");
					ShowMsg_("COLORFONDUE_RED_102");
					KeyInputWait_();
					CloseMsgWnd_();

				//指定アイテムを指定個数以上持っていない
				} else {
					ShowMsg_("COLORFONDUE_RED_201");
					KeyInputWait_();
						SetExchangeItemName_(CF_RED_PROBLEM_ITEM_ID);
						SetExchangeNumber_(CF_RED_PROBLEM_ITEM_NUMBER);
					ShowMsg_("COLORFONDUE_RED_202");
					KeyInputWait_();
					CloseMsgWnd_();

				}
			//選択肢で「いいえ」を選択
			} else {
				ShowMsg_("COLORFONDUE_RED_301");
				KeyInputWait_();
				CloseMsgWnd_();
			}
		}
	}

	// クリア後ルキヤ
	if(target == npc_Rukiya){
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_RUKIYA");
		ShowMsg_("RUKIYA_MSG");
		KeyInputWait_();
		CloseMsgWnd_();
	}

	EventEnd_();
}

//------------------------------------------------
//		リアクターで調べた時
//------------------------------------------------
function ReactorAnalyze()
{
	local target = GetTargetId_();
	// シナリオのメインフラグを取得する
	local main_num = GetNumFlg_("NUM_SCENARIO_MAIN");
	// フラグからイベント番号を取得する
	local event_num = GetNumFlg_("NUM_SCENARIO_SUB_GREEN");

	local ID_JACK    = ReadNpc_("n001"); // ジャックモデル
	local ID_ACE     = ReadNpc_("n002"); // エースモデル
	local ID_QUEEN   = ReadNpc_("n005"); // クイーンモデル
	local ID_NPC_000 = ReadNpc_("n000"); // ノチョーラ男モデル

	//隠れているノチョーラたちを見つけたかどうか調べるフラグ
	local appear_jack  = GetEventFlg_("BFG_APPEAR_JACK");
	local appear_queen = GetEventFlg_("BFG_APPEAR_QUEEN");
	local appear_ace   = GetEventFlg_("BFG_APPEAR_ACE");
	local appear_inn   = GetEventFlg_("BFG_APPEAR_INN");

	//隠れているノチョーラたちに初めて話しかけたかどうか調べるフラグ
	local first_time_talk_j  = GetEventFlg_("BFG_FIRST_TIME_TALK_JACK");
	local first_time_talk_q = GetEventFlg_("BFG_FIRST_TIME_TALK_QUEEN");
	local first_time_talk_a   = GetEventFlg_("BFG_FIRST_TIME_TALK_ACE");
	local first_time_talk_i   = GetEventFlg_("BFG_FIRST_TIME_TALK_INN");

	DebugPrint("リアクターで調べる前");

	// 共通会話(本音は第４引数を「1」)
	if(event_num != GetFlagID_("CONST_SS_GR_HIDE_AND_SEEK")){
		TalkTaget(target, main_num, event_num, 1);
	}

	//隠れいているノチョーラのギミックをアナライズした時
	if(main_num == 1){
		// Demo009[隠れているノチョーラ]後に配置するNPC
		if(event_num == GetFlagID_("CONST_SS_GR_HIDE_AND_SEEK")){
			DebugPrint("アクターで調べられたとき");
			//ギミックに一度話しかけたか
			if(first_time_talk_q == false){
				if(target == reactorPoint_queen){
					if(appear_queen == false){
						//クイーンをみつけたフラグ
						SetEventFlg_("BFG_APPEAR_QUEEN", true);
						//ノチョーラを箱の中に設置
						npc_QEN <- ArrangePointNpc_(ID_QUEEN  , "A001");  // クイーン
						SetPointPosNoFit_(npc_QEN  , "A001");  // クイーン
						// 会話アイコンが表示されていなければ、表示する
						SetTalkIcon(npc_QEN, HIDE_NPC_KIND.QUEEN);
						// α値手動設定
						SetManualCalcAlpha_(npc_QEN, true);
						SetAlpha_(npc_QEN, 0.0);
						//リアクターメッセージ
						OpenMsgWnd_();
						SetTalkName_("NAME_TAG_REACTOR");
						ShowMsg_("gimmick_001_1");			// 「何かが　中に隠れているようだ。
						KeyInputWait_();
						CloseMsgWnd_();
					} else {
						//リアクターメッセージ
						OpenMsgWnd_();
						SetTalkName_("NAME_TAG_REACTOR");
						ShowMsg_("REC_POINT_GR_06_02");		// 「ウッドパークに　残されていた　なぞのタル。
						KeyInputWait_();
						CloseMsgWnd_();
					}
				}
			}
			//ギミックに一度話しかけたか
			if(first_time_talk_a == false){
				if(target == reactorPoint_ace){
					if(appear_ace == false){
						//エースをみつけたフラグ
						SetEventFlg_("BFG_APPEAR_ACE", true);
						npc_ACE <- ArrangePointNpc_(ID_ACE    , "A002");  // エース
						SetPointPosNoFit_(npc_ACE    , "A002");  // エース
						DebugPrint("エースを読み込みました");
						// 会話アイコンが表示されていなければ、表示する
						SetTalkIcon(npc_ACE, HIDE_NPC_KIND.ACE);
						// α値手動設定
						SetManualCalcAlpha_(npc_ACE, true);
						SetAlpha_(npc_ACE, 0.0);
						//リアクターメッセージ
						OpenMsgWnd_();
						SetTalkName_("NAME_TAG_REACTOR");
						ShowMsg_("gimmick_001_1");			// 「何かが　中に隠れているようだ。
						KeyInputWait_();
						CloseMsgWnd_();
					} else {
						//リアクターメッセージ
						OpenMsgWnd_();
						SetTalkName_("NAME_TAG_REACTOR");
						ShowMsg_("REC_POINT_GR_05_02");		// 「ウッドパークに　残されていた　なぞの箱。
						KeyInputWait_();
						CloseMsgWnd_();
					}
				}
			}
			//ギミックに一度話しかけたか
			if(first_time_talk_i == false){
				if(target == reactorPoint_inn){
					//宿屋をみつけたフラグ
					if(appear_inn == false){
						SetEventFlg_("BFG_APPEAR_INN", true);
						npc_INN <- ArrangePointNpc_(ID_NPC_000, "A003");  // 宿屋
						SetPointPosNoFit_(npc_INN, "A003");  // 宿屋
						// 会話アイコンが表示されていなければ、表示する
						SetTalkIcon(npc_INN, HIDE_NPC_KIND.INN);
						// α値手動設定
						SetManualCalcAlpha_(npc_INN, true);
						SetAlpha_(npc_INN, 0.0);
						//リアクターメッセージ
						OpenMsgWnd_();
						SetTalkName_("NAME_TAG_REACTOR");
						ShowMsg_("gimmick_001_1");			// 「何かが　中に隠れているようだ。
						KeyInputWait_();
						CloseMsgWnd_();
					} else {
						//リアクターメッセージ
						OpenMsgWnd_();
						SetTalkName_("NAME_TAG_REACTOR");
						ShowMsg_("REC_POINT_GR_06_02");		// 「ウッドパークに　残されていた　なぞのタル。
						KeyInputWait_();
						CloseMsgWnd_();
					}
				}
			}
			if(target == reactorPoint_jack){
				//ジャックをみつけたフラグ
				if(appear_jack == false){
					SetEventFlg_("BFG_APPEAR_JACK", true);
					npc_JAC <- ArrangePointNpc_(ID_JACK   , "A000");  // ジャック
					SetPointPosNoFit_(npc_JAC   , "A000");  // ジャック
					SetTalkIcon(npc_JAC, HIDE_NPC_KIND.JACK);
					// α値手動設定
					SetManualCalcAlpha_(npc_JAC, true);
					SetAlpha_(npc_JAC, 0.0);
					//リアクターメッセージ
					OpenMsgWnd_();
					SetTalkName_("NAME_TAG_REACTOR");
					ShowMsg_("gimmick_001_1");			// 「何かが　中に隠れているようだ。
					KeyInputWait_();
					CloseMsgWnd_();
				} else {
					//リアクターメッセージ
					OpenMsgWnd_();
					SetTalkName_("NAME_TAG_REACTOR");
					ShowMsg_("REC_POINT_GR_05_02");		// 「ウッドパークに　残されていた　なぞの箱。
					KeyInputWait_();
					CloseMsgWnd_();
				}
			}
		}
	}

	EventEnd_();
}

//------------------------------------------------
//		リアクター起動時
//------------------------------------------------
function ReactorOn()
{
	// 既に調べていて、まだ箱の中のキャラに、話しかけアイコンを表示する

	// 会話アイコンキャラ分の、話しかけフラグ
	local chaeckAppearFlag = [
		"BFG_APPEAR_JACK",
		"BFG_APPEAR_QUEEN",
		"BFG_APPEAR_ACE",
		"BFG_APPEAR_INN"
	];
	
	// 初回話しかけをしたかどうかフラグ
	local checkFirstTalkFlag = [
		"BFG_FIRST_TIME_TALK_JACK",
		"BFG_FIRST_TIME_TALK_QUEEN",
		"BFG_FIRST_TIME_TALK_ACE",
		"BFG_FIRST_TIME_TALK_INN",
	];
	
	// 会話アイコンを出す対象
	local talkIconTarget = [
		npc_JAC,
		npc_QEN,
		npc_ACE,
		npc_INN,
	];
	
	for(local i = 0; i < HIDE_NPC_KIND.NUM; i++){
		if(GetEventFlg_(chaeckAppearFlag[i]) &&
			!GetEventFlg_(checkFirstTalkFlag[i])){
			if(talkIconTarget[i] != C_NONE_ID){
				SetTalkIcon(talkIconTarget[i], i);
			}
		}
	}
	EventEnd_();
}

//------------------------------------------------
//		リアクター終了時
//------------------------------------------------
function ReactorOff()
{
	// リアクターで調べた際の会話アイコンが出ていたら
	// リアクター終了時に消す
	for(local i = 0; i < HIDE_NPC_KIND.NUM; i++){
		if(sTalkIconId[i] != C_NONE_ID){
			DeleteEffect_(sTalkIconId[i]);
			sTalkIconId[i] = C_NONE_ID;
		}
	}
	EventEnd_();
}



//=========================================================================================================
//									▼▼▼ここから下はローカル関数▼▼▼
//=========================================================================================================

//----------------------------------------------
//  大ジャンプモンスターを取得しているか判定する
//----------------------------------------------
function CheckHighJumpMonsterKind()
{
	DebugPrint(" ");
	local p_kind = 0;
	local s_kind = 0;
	local o_kind = 0;
	local count  = 0;
	local monster_id = 157; // あばれうしどりのIDは157

	// 所持モンスターの中にあばれうしどりがいるかを確認
	for(count = 0; count <= ( GetOwnerMonsterNum_() - 1 ); count++){
		o_kind = GetOwnerMonsterKind_(count);
		DebugPrint("所持モンスター " + (count+1) + " 体目の種族IDは " + o_kind + " です");
		if(o_kind == monster_id){
			DebugPrint("所持モンスターに大ジャンプモンスターはいます");
			return true;
		}
	}
	DebugPrint("大ジャンプモンスターはいません");
	return false;
}
//------------------------------------------------
//  大ジャンプモンスターにライドしているか判定する
//------------------------------------------------
function CheckHighJumpMonsterRide()
{
	//あばれうしどりにライドしている
	if(CheckFieldRideMonster_(157) == true) {
		return true;
	}
	//あばれうしどりにライドしていない
	else{
		return false;
	}
}

//--------------------------
//  メッセージの表示関数(名前表示なし)
//--------------------------
function CommonMessage(message_key){
	OpenMsgWnd_();
	ShowMsg_(message_key);
	KeyInputWait_();
	CloseMsgWnd_();
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

//---------------------------------------
// (新)宿屋のメッセージ処理( ノチョ )
//---------------------------------------
function InnMessage(g_inn, msg_key_1, msg_key_2, msg_key_3){

	// 暗転明けの主人公の復帰位置と向きを設定する
	local re_pos = Vec3(218.31, -1.26, -18.56);	// 復帰位置を指定
	local re_dir = 180;							// 向きを指定

	// 草原大陸クリアフラグ
	local clear_flag = GetEventFlg_("BFG_SCENARIO_CLEAR_GRASS");

	// メッセージの表示（「やぁ いらっしゃい…
	OpenMsgWnd_();
	ShowMsg_(msg_key_1);
	KeyInputWait_();

	switch(GetQueryResult_())
	{
	case QUERY2_0:
	// 泊まる処理
		CloseMsgWnd_();
		// 宿屋の共通の回復処理
		CommTaskInn(re_pos, re_dir, clear_flag, g_inn);
		// メッセージの表示(「おはよーだっちょ…
		OpenMsgWnd_();
		ShowMsg_(msg_key_3);
		KeyInputWait_();
		CloseMsgWnd_();
		break;
	case QUERY2_1:
	// やめる処理
		// メッセージの表示(「わかったっちょ…
		ShowMsg_(msg_key_2);
		KeyInputWait_();
		CloseMsgWnd_();
		break;
	}
}

//---------------------------------------
// (新)宿屋のメッセージ処理( ドラキー )
//---------------------------------------
function InnMessage3(g_inn, msg_key_1, msg_key_2, msg_key_3){

	// 暗転明けの主人公の復帰位置と向きを設定する
	local re_pos = Vec3(218.31, -1.26, -18.56);	// 復帰位置を指定
	local re_dir = 180;							// 向きを指定

	// 草原大陸クリアフラグ
	local clear_flag = GetEventFlg_("BFG_SCENARIO_CLEAR_GRASS");

	// シナリオのメインフラグを取得する
	local main_num = GetNumFlg_("NUM_SCENARIO_MAIN");
	// 高空用のイベントフラグ
	local sky_num = GetNumFlg_("NUM_SCENARIO_SUB_SKY");

	// メッセージの表示
	OpenMsgWnd_();
	
	// 前置きメッセージの表示
	// 「崩落都市」から「コア」まで
	if(main_num <= GetFlagID_("CONST_SM_CORE")){
		// 前置きなし
	}
	// 「高空」
	else if(main_num == GetFlagID_("CONST_SM_SKY")){
		// ガルビルス戦に勝利後～高空ライド獲得前まで
		if(sky_num <= GetFlagID_("CONST_SS_VC_JDG_THIRD_BATTLE_S")){
			ShowMsg_("DORAKI_MSG_002");// （「あの空を見てると
			KeyInputWait_();
		}
		// 高空ライド獲得以降
		else if(sky_num >= GetFlagID_("CONST_SS_SK_GO_OUT_THE_COLOSSEUM_1")){
			ShowMsg_("DORAKI_MSG_003");// （「デカイこと
			KeyInputWait_();
		}
	}
	// 表シナリオクリア以降(完全クリア後も同じ)
	else if(main_num >= GetFlagID_("CONST_SM_INSIDE_CLEAR")){
		// 前置きなし
	}
	
	ShowMsg_(msg_key_1);// （「やぁ いらっしゃい…
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
		// メッセージの表示(「おはよー…
		OpenMsgWnd_();
		ShowMsg_(msg_key_3);
		KeyInputWait_();
		CloseMsgWnd_();
		break;
	case QUERY3_2:
	// やめる処理
		// メッセージの表示(「わかった…
		ShowMsg_(msg_key_2);
		KeyInputWait_();
		CloseMsgWnd_();
		break;
	}

}

//---------------------------------------
// 無人宿屋のメッセージ処理
//---------------------------------------
function NotInInnMessage(){

	// 暗転明けの主人公の復帰位置と向きを設定する
	local re_pos = Vec3(218.31, -1.26, -18.56);	// 復帰位置を指定
	local re_dir = 4;							// 向きを指定

	// 草原の大陸クリアフラグ
	local grass_clear_flg = GetEventFlg_("BFG_SCENARIO_CLEAR_GRASS");

	// メッセージキーの初期化
	local msg_key_1 = 0;	// メッセージキー(選択肢を表示するメッセージ)
	local msg_key_2 = 0;	// メッセージキー(やめる場合のメッセージ)
	local msg_key_3 = 0;	// メッセージキー(利用した場合のメッセージ)

	if(grass_clear_flg == true){
		if(GetEventFlg_("BFG_CHECK_INN_FIRST_MSG_ALL") == false){
			msg_key_1 = "CAPTURE_CITY_INN_01";
			SetEventFlg_("BFG_CHECK_INN_FIRST_MSG_ALL", true);
		}
		else{
			msg_key_1 = "CAPTURE_CITY_INN_02";
		}
		msg_key_2 = "INN_MSG_NO";
		msg_key_3 = "INN_MSG_YES";

		// メッセージの表示（「ベッドがある…
		OpenMsgWnd_();
		ShowMsg_(msg_key_1);
		KeyInputWait_();
		
		switch(GetQueryResult_())
		{
		case QUERY3_0:
		case QUERY3_1:
		// 泊まる処理
		// 休む処理
			CloseMsgWnd_();
			// 宿屋の共通の回復処理
			CommTaskInn(re_pos, re_dir, grass_clear_flg);
			// メッセージの表示(「元気になった…
			OpenMsgWnd_();
			ShowMsg_(msg_key_3);
			KeyInputWait_();
			CloseMsgWnd_();
			break;
		case QUERY3_2:
		// やめる処理
			// メッセージの表示(「使うのをやめた…
			ShowMsg_(msg_key_2);
			KeyInputWait_();
			CloseMsgWnd_();
			break;
		}
	}
	else{
		msg_key_1 = "CAPTURE_GREEN_INN";
		msg_key_2 = "INN_MSG_NO";
		msg_key_3 = "INN_MSG_YES";

		// メッセージの表示（「ベッドがある…
		OpenMsgWnd_();
		ShowMsg_(msg_key_1);
		KeyInputWait_();

		switch(GetQueryResult_()){
		case QUERY2_0:
		// 泊まる処理
			CloseMsgWnd_();
			// 宿屋の共通の回復処理
			CommTaskInn(re_pos, re_dir, grass_clear_flg);
			// メッセージの表示(「元気になった…
			OpenMsgWnd_();
			ShowMsg_(msg_key_3);
			KeyInputWait_();
			CloseMsgWnd_();
			break;
		case QUERY2_1:
		// やめる処理
			// メッセージの表示(「使うのをやめた…
			ShowMsg_(msg_key_2);
			KeyInputWait_();
			CloseMsgWnd_();
			break;
		}
	}
}

//------------------------------------------------------
// 話す相手を調べる -> 話しかけてデモが発生する場合はココで行う
// ( 第４引数について )
// talk_kind == 0 : 通常会話
// talk_kind == 1 : 本音会話
//------------------------------------------------------
function TalkTaget(target, main_num, event_num, talk_kind)
{
	//隠れているノチョーラたちを見つけたかどうか調べるフラグ
	local appear_jack  = GetEventFlg_("BFG_APPEAR_JACK");
	local appear_queen = GetEventFlg_("BFG_APPEAR_QUEEN");
	local appear_ace   = GetEventFlg_("BFG_APPEAR_ACE");
	local appear_inn   = GetEventFlg_("BFG_APPEAR_INN");

	if(main_num == 1){
		if(event_num >= GetFlagID_("CONST_SS_GR_HIDE_AND_SEEK")
		&& event_num <= GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_3")){
			if(appear_jack == true){
				if(target == npc_JAC){
					OpenMsgWnd_();
					if(talk_kind == 1){
						SetTalkName_("NAME_TAG_REACTOR");
					}
					else{
						SetTalkName_("NAME_TAG_JACK");
					}
					ContentJac(main_num, event_num, talk_kind);
					KeyInputWait_();
					CloseMsgWnd_();
				}
			}
			if(appear_ace == true){
				if(target == npc_ACE){
					OpenMsgWnd_();
					if(talk_kind == 1){
						SetTalkName_("NAME_TAG_REACTOR");
					}
					else{
						if(main_num == GetFlagID_("CONST_SM_GRASSLAND") && event_num == GetFlagID_("CONST_SS_GR_HIDE_AND_SEEK")){
							SetTalkName_("NAME_NONE");
						}
						else{
							SetTalkName_("NAME_TAG_ACE");
						}
					}
					ContentAce(main_num, event_num, talk_kind);
					KeyInputWait_();
					CloseMsgWnd_();
				}
			}
			if(appear_queen == true){
				if(target == npc_QEN){
					OpenMsgWnd_();
					if(talk_kind == 1){
						SetTalkName_("NAME_TAG_REACTOR");
					}
					else{
						if((main_num == GetFlagID_("CONST_SM_GRASSLAND") && event_num == GetFlagID_("CONST_SS_GR_HIDE_AND_SEEK"))
						|| (main_num == GetFlagID_("CONST_SM_GRASSLAND") && event_num == GetFlagID_("CONST_SS_GR_MEET_JACK"))){
							SetTalkName_("NAME_NONE");
						}
						else{
							SetTalkName_("NAME_TAG_QUEEN");
						}
					}
					ContentQen(main_num, event_num, talk_kind);
					KeyInputWait_();
					CloseMsgWnd_();
				}
			}
			if(target == npc_A){
				OpenMsgWnd_();
				if(event_num >= GetFlagID_("CONST_SS_GR_MEET_JACK")){
					if(talk_kind == 1){
						SetTalkName_("NAME_TAG_REACTOR");
					}
					else{
						if(main_num == GetFlagID_("CONST_SM_GRASSLAND") && event_num == GetFlagID_("CONST_SS_GR_HIDE_AND_SEEK")){
							SetTalkName_("NAME_NONE");
						}
						else{
							SetTalkName_("NAME_TAG_NOCHORIN");
						}
					}
				}
				ContentNpcA(main_num, event_num, talk_kind);
				KeyInputWait_();
				CloseMsgWnd_();
			}
			if(appear_inn == true){
				if(target == npc_INN){
					OpenMsgWnd_();
					if(talk_kind == 1){
						SetTalkName_("NAME_TAG_REACTOR");
					}
					ContentInn(main_num, event_num, talk_kind);
					KeyInputWait_();
					CloseMsgWnd_();
				}
			}
		}
		if(event_num >= GetFlagID_("CONST_SS_GR_RETURN_KING")
		&& event_num <= GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_3")){
			if(target == npc_KNG){
				OpenMsgWnd_();
				if(talk_kind == 1){
					SetTalkName_("NAME_TAG_REACTOR");
				}
				else{
					SetTalkName_("NAME_TAG_KING");
				}
				ContentKng(main_num, event_num, talk_kind);
				KeyInputWait_();
				CloseMsgWnd_();
			}
			if(target == npc_B){
				OpenMsgWnd_();
				if(talk_kind == 1){
					SetTalkName_("NAME_TAG_REACTOR");
				}
				ContentNpcB(main_num, event_num, talk_kind);
				KeyInputWait_();
				CloseMsgWnd_();
			}
			if(target == npc_IMP){
				OpenMsgWnd_();
				if(talk_kind == 1){
					SetTalkName_("NAME_TAG_REACTOR");
				}
				ContentImp(main_num, event_num, talk_kind);
				KeyInputWait_();
				CloseMsgWnd_();
			}
			if(target == npc_BNK){
				OpenMsgWnd_();
				if(talk_kind == 1){
					SetTalkName_("NAME_TAG_REACTOR");
				}
				ContentBnk(main_num, event_num, talk_kind);
				KeyInputWait_();
				CloseMsgWnd_();
			}
			if(target == npc_BOK){
				OpenMsgWnd_();
				if(talk_kind == 1){
					SetTalkName_("NAME_TAG_REACTOR");
				}
				ContentBok(main_num, event_num, talk_kind);
				KeyInputWait_();
				CloseMsgWnd_();
			}
			if(target == npc_BUT){
				OpenMsgWnd_();
				if(talk_kind == 1){
					SetTalkName_("NAME_TAG_REACTOR");
				}
				ContentBut(main_num, event_num, talk_kind);
				KeyInputWait_();
				CloseMsgWnd_();
			}
			if(target == npc_REC){
				OpenMsgWnd_();
				if(talk_kind == 1){
					SetTalkName_("NAME_TAG_REACTOR");
				}
				ContentRec(main_num, event_num, talk_kind);
				KeyInputWait_();
				CloseMsgWnd_();
			}
			if(target == npc_ACC){
				OpenMsgWnd_();
				if(talk_kind == 1){
					SetTalkName_("NAME_TAG_REACTOR");
				}
				ContentAcc(main_num, event_num, talk_kind);
				KeyInputWait_();
				CloseMsgWnd_();
			}
		}
	}

}

//-------------------------
//  アクセサリー屋の話す内容
//-------------------------
function ContentAcc(main_num, event_num, talk_kind)
{
	// 通常会話
	if(talk_kind == 0){
		if(main_num == 1){
			switch(event_num){
			case GetFlagID_("CONST_SS_GR_RETURN_KING"):
			case GetFlagID_("CONST_SS_VC_TRY_RANK_C"):
			case GetFlagID_("CONST_SS_VC_RIDE_TUTORIAL"):
			case GetFlagID_("CONST_SS_VC_START_RANK_C"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE_WIN"):
			case GetFlagID_("CONST_SS_VC_SECOND_BATTLE"):
				ShowMsg_("DEMO_018_AFT_ACC_NOC");
				break;
			case GetFlagID_("CONST_SS_GR_GET_RIDE_SKILL_JUMP"):
				ShowMsg_("DEMO_022_AFT_ACC_NOC");
				break;
			case GetFlagID_("CONST_SS_GR_INVITE_JUMP_MONSTER"):
				ShowMsg_("DEMO_023_AFT_ACC_NOC");
				break;
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_1"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_2"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_3"):
				ShowMsg_("DEMO_024_AFT_ACC_NOC");
				break;
			default:
				ShowMsg_("FlagDefault");
				DebugPrint("アクセサリー屋の会話のevent_num値が適切ではありません。");
				break;
			}
		}
	}
	// 本音
	else if(talk_kind == 1){
		if(main_num == 1){
			switch(event_num){
			case GetFlagID_("CONST_SS_GR_RETURN_KING"):
			case GetFlagID_("CONST_SS_VC_TRY_RANK_C"):
			case GetFlagID_("CONST_SS_VC_RIDE_TUTORIAL"):
			case GetFlagID_("CONST_SS_VC_START_RANK_C"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE_WIN"):
			case GetFlagID_("CONST_SS_VC_SECOND_BATTLE"):
			case GetFlagID_("CONST_SS_GR_GET_RIDE_SKILL_JUMP"):
			case GetFlagID_("CONST_SS_GR_INVITE_JUMP_MONSTER"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_1"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_2"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_3"):
				ShowMsg_("NPC_NOCHO_WOMEN_REC");
				break;
			default:
				ShowMsg_("FlagDefault");
				DebugPrint("アクセサリー屋の本音のevent_num値が適切ではありません。");
				break;
			}
		}
	}
}

//-------------------------
//  エースの話す内容
//-------------------------
function ContentAce(main_num, event_num, talk_kind)
{
	// 通常会話
	if(talk_kind == 0){
		if(main_num == 1){
			switch(event_num){
			case GetFlagID_("CONST_SS_GR_HIDE_AND_SEEK"):
				ShowMsg_("DEMO_012_AFT_FIND_ACE");
				break;
			case GetFlagID_("CONST_SS_GR_MEET_JACK"):
			case GetFlagID_("CONST_SS_GR_TALK_QUEEN"):
			case GetFlagID_("CONST_SS_GR_GO_RULAR_STEEL"):
			case GetFlagID_("CONST_SS_GR_SNEAKING_IN_FORTRESS"):
			case GetFlagID_("CONST_SS_GR_COMMUNICATE_ACE"):
			case GetFlagID_("CONST_SS_GR_CONTROL_DEVICE"):
			case GetFlagID_("CONST_SS_GR_APPEAR_BOWSHOCK"):
			case GetFlagID_("CONST_SS_GR_REMATCH_BOWSHOCK"):
			case GetFlagID_("CONST_SS_GR_WIN_BOWSHOCK"):
				ShowMsg_("DEMO_013_AFT_ACE");
				break;
			case GetFlagID_("CONST_SS_GR_RETURN_KING"):
			case GetFlagID_("CONST_SS_VC_TRY_RANK_C"):
			case GetFlagID_("CONST_SS_VC_RIDE_TUTORIAL"):
			case GetFlagID_("CONST_SS_VC_START_RANK_C"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE_WIN"):
			case GetFlagID_("CONST_SS_VC_SECOND_BATTLE"):
				ShowMsg_("DEMO_018_AFT_ACE");
				break;
			case GetFlagID_("CONST_SS_GR_GET_RIDE_SKILL_JUMP"):
				ShowMsg_("DEMO_022_AFT_ACE");
				break;
			case GetFlagID_("CONST_SS_GR_INVITE_JUMP_MONSTER"):
				ShowMsg_("DEMO_023_AFT_ACE");
				break;
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_1"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_2"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_3"):
				ShowMsg_("DEMO_024_AFT_ACE");
				break;
			default:
				ShowMsg_("FlagDefault");
				DebugPrint("エースの会話のevent_num値が適切ではありません。");
				break;
			}
		}
	}
	// 本音
	else if(talk_kind == 1){
		if(main_num == 1){
			switch(event_num){
			case GetFlagID_("CONST_SS_GR_HIDE_AND_SEEK"):
			case GetFlagID_("CONST_SS_GR_MEET_JACK"):
			case GetFlagID_("CONST_SS_GR_TALK_QUEEN"):
			case GetFlagID_("CONST_SS_GR_GO_RULAR_STEEL"):
			case GetFlagID_("CONST_SS_GR_SNEAKING_IN_FORTRESS"):
			case GetFlagID_("CONST_SS_GR_COMMUNICATE_ACE"):
			case GetFlagID_("CONST_SS_GR_CONTROL_DEVICE"):
			case GetFlagID_("CONST_SS_GR_APPEAR_BOWSHOCK"):
			case GetFlagID_("CONST_SS_GR_REMATCH_BOWSHOCK"):
			case GetFlagID_("CONST_SS_GR_WIN_BOWSHOCK"):
			case GetFlagID_("CONST_SS_GR_RETURN_KING"):
			case GetFlagID_("CONST_SS_VC_TRY_RANK_C"):
			case GetFlagID_("CONST_SS_VC_RIDE_TUTORIAL"):
			case GetFlagID_("CONST_SS_VC_START_RANK_C"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE_WIN"):
			case GetFlagID_("CONST_SS_VC_SECOND_BATTLE"):
			case GetFlagID_("CONST_SS_GR_GET_RIDE_SKILL_JUMP"):
			case GetFlagID_("CONST_SS_GR_INVITE_JUMP_MONSTER"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_1"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_2"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_3"):
				ShowMsg_("NPC_ACE_REC");
				break;
			default:
				ShowMsg_("FlagDefault");
				DebugPrint("エースの本音のevent_num値が適切ではありません。");
				break;
			}
		}
	}
}

//-------------------------
//  銀行屋の話す内容
//-------------------------
function ContentBnk(main_num, event_num, talk_kind)
{
	// 通常会話
	if(talk_kind == 0){
		if(main_num == 1){
			switch(event_num){
			case GetFlagID_("CONST_SS_GR_RETURN_KING"):
			case GetFlagID_("CONST_SS_VC_TRY_RANK_C"):
			case GetFlagID_("CONST_SS_VC_RIDE_TUTORIAL"):
			case GetFlagID_("CONST_SS_VC_START_RANK_C"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE_WIN"):
			case GetFlagID_("CONST_SS_VC_SECOND_BATTLE"):
				ShowMsg_("DEMO_018_AFT_BNK_NOC");
				break;
			case GetFlagID_("CONST_SS_GR_GET_RIDE_SKILL_JUMP"):
				ShowMsg_("DEMO_022_AFT_BNK_NOC");
				break;
			case GetFlagID_("CONST_SS_GR_INVITE_JUMP_MONSTER"):
				ShowMsg_("DEMO_023_AFT_BNK_NOC");
				break;
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_1"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_2"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_3"):
				ShowMsg_("DEMO_024_AFT_BNK_NOC");
				break;
			default:
				ShowMsg_("FlagDefault");
				DebugPrint("銀行屋のevent_num値が適切ではありません。");
				break;
			}
		}
	}
	// 本音
	else if(talk_kind == 1){
		if(main_num == 1){
			switch(event_num){
			case GetFlagID_("CONST_SS_GR_RETURN_KING"):
			case GetFlagID_("CONST_SS_VC_TRY_RANK_C"):
			case GetFlagID_("CONST_SS_VC_RIDE_TUTORIAL"):
			case GetFlagID_("CONST_SS_VC_START_RANK_C"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE_WIN"):
			case GetFlagID_("CONST_SS_VC_SECOND_BATTLE"):
			case GetFlagID_("CONST_SS_GR_GET_RIDE_SKILL_JUMP"):
			case GetFlagID_("CONST_SS_GR_INVITE_JUMP_MONSTER"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_1"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_2"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_3"):
				ShowMsg_("NPC_NOCHO_MEN_REC");
				break;
			default:
				ShowMsg_("FlagDefault");
				DebugPrint("銀行屋のevent_num値が適切ではありません。");
				break;
			}
		}
	}
}

//-------------------------
//  本屋の話す内容
//-------------------------
function ContentBok(main_num, event_num, talk_kind)
{
	// 通常会話
	if(talk_kind == 0){
		if(main_num == 1){
			switch(event_num){
			case GetFlagID_("CONST_SS_GR_RETURN_KING"):
			case GetFlagID_("CONST_SS_VC_TRY_RANK_C"):
			case GetFlagID_("CONST_SS_VC_RIDE_TUTORIAL"):
			case GetFlagID_("CONST_SS_VC_START_RANK_C"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE_WIN"):
			case GetFlagID_("CONST_SS_VC_SECOND_BATTLE"):
				ShowMsg_("DEMO_018_AFT_BOK_NOC");
				break;
			case GetFlagID_("CONST_SS_GR_GET_RIDE_SKILL_JUMP"):
				ShowMsg_("DEMO_022_AFT_BOK_NOC");
				break;
			case GetFlagID_("CONST_SS_GR_INVITE_JUMP_MONSTER"):
				ShowMsg_("DEMO_023_AFT_BOK_NOC");
				break;
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_1"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_2"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_3"):
				ShowMsg_("DEMO_024_AFT_BOK_NOC");
				break;
			default:
				ShowMsg_("FlagDefault");
				DebugPrint("本屋のevent_num値が適切ではありません。");
				break;
			}
		}
	}
	// 本音
	else if(talk_kind == 1){
		if(main_num == 1){
			switch(event_num){
			case GetFlagID_("CONST_SS_GR_RETURN_KING"):
			case GetFlagID_("CONST_SS_VC_TRY_RANK_C"):
			case GetFlagID_("CONST_SS_VC_RIDE_TUTORIAL"):
			case GetFlagID_("CONST_SS_VC_START_RANK_C"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE_WIN"):
			case GetFlagID_("CONST_SS_VC_SECOND_BATTLE"):
			case GetFlagID_("CONST_SS_GR_GET_RIDE_SKILL_JUMP"):
			case GetFlagID_("CONST_SS_GR_INVITE_JUMP_MONSTER"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_1"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_2"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_3"):
				ShowMsg_("NPC_NOCHO_WOMEN_REC");
				break;
			default:
				ShowMsg_("FlagDefault");
				DebugPrint("本屋のevent_num値が適切ではありません。");
				break;
			}
		}
	}
}

//-------------------------
//  肉屋の話す内容
//-------------------------
function ContentBut(main_num, event_num, talk_kind)
{
	// 通常会話
	if(talk_kind == 0){
		if(main_num == 1){
			switch(event_num){
			case GetFlagID_("CONST_SS_GR_RETURN_KING"):
			case GetFlagID_("CONST_SS_VC_TRY_RANK_C"):
			case GetFlagID_("CONST_SS_VC_RIDE_TUTORIAL"):
			case GetFlagID_("CONST_SS_VC_START_RANK_C"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE_WIN"):
			case GetFlagID_("CONST_SS_VC_SECOND_BATTLE"):
				ShowMsg_("DEMO_018_AFT_BUT_NOC");
				break;
			case GetFlagID_("CONST_SS_GR_GET_RIDE_SKILL_JUMP"):
				ShowMsg_("DEMO_022_AFT_BUT_NOC");
				break;
			case GetFlagID_("CONST_SS_GR_INVITE_JUMP_MONSTER"):
				ShowMsg_("DEMO_023_AFT_BUT_NOC");
				break;
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_1"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_2"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_3"):
				ShowMsg_("DEMO_024_AFT_BUT_NOC");
				break;
			default:
				ShowMsg_("FlagDefault");
				DebugPrint("肉屋のevent_num値が適切ではありません。");
				break;
			}
		}
	}
	// 本音
	else if(talk_kind == 1){
		if(main_num == 1){
			switch(event_num){
			case GetFlagID_("CONST_SS_GR_RETURN_KING"):
			case GetFlagID_("CONST_SS_VC_TRY_RANK_C"):
			case GetFlagID_("CONST_SS_VC_RIDE_TUTORIAL"):
			case GetFlagID_("CONST_SS_VC_START_RANK_C"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE_WIN"):
			case GetFlagID_("CONST_SS_VC_SECOND_BATTLE"):
			case GetFlagID_("CONST_SS_GR_GET_RIDE_SKILL_JUMP"):
			case GetFlagID_("CONST_SS_GR_INVITE_JUMP_MONSTER"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_1"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_2"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_3"):
				ShowMsg_("NPC_NOCHO_MEN_REC");
				break;
			default:
				ShowMsg_("FlagDefault");
				DebugPrint("肉屋のevent_num値が適切ではありません。");
				break;
			}
		}
	}
}

//-------------------------
//  道具屋の話す内容
//-------------------------
function ContentImp(main_num, event_num, talk_kind)
{
	local item_flg = GetEventFlg_("BFG_TALK_ITEM_WOOD_PARK");

	// 通常会話
	if(talk_kind == 0){
		if(main_num == 1){
			switch(event_num){
			case GetFlagID_("CONST_SS_GR_RETURN_KING"):
			case GetFlagID_("CONST_SS_VC_TRY_RANK_C"):
			case GetFlagID_("CONST_SS_VC_RIDE_TUTORIAL"):
			case GetFlagID_("CONST_SS_VC_START_RANK_C"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE_WIN"):
			case GetFlagID_("CONST_SS_VC_SECOND_BATTLE"):
			case GetFlagID_("CONST_SS_GR_GET_RIDE_SKILL_JUMP"):
			case GetFlagID_("CONST_SS_GR_INVITE_JUMP_MONSTER"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_1"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_2"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_3"):
				if(item_flg == false){
					SetEventFlg_("BFG_TALK_ITEM_WOOD_PARK", true);
					ShowMsg_("MSG_SHOP_ITEM_1ST");
					KeyInputWait_();
					CloseMsgWnd_();
					// 道具屋へ移行
					GotoMenuFadeOpen(MENU_OPEN.H01_00_ITEM);
				} else {
					if(event_num >= GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_1")
					&& event_num <= GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_3")){
						ShowMsg_("DEMO_024_AFT_IMP_NOC");
					}
					else{
						ShowMsg_("MSG_SHOP_ITEM_2ND");
					}
					KeyInputWait_();
					CloseMsgWnd_();
					// 道具屋へ移行
					GotoMenuFadeOpen(MENU_OPEN.H01_00_ITEM);
				}
				//道具屋フロー終了後
				OpenMsgWnd_();
				ShowMsg_("MSG_SHOP_ITEM_3RD");
				KeyInputWait_();
				CloseMsgWnd_();
				break;
			default:
				ShowMsg_("FlagDefault");
				DebugPrint("道具屋のevent_num値が適切ではありません。");
				break;
			}
		}
	}
	// 本音
	else if(talk_kind == 1){
		if(main_num == 1){
			switch(event_num){
			case GetFlagID_("CONST_SS_GR_RETURN_KING"):
			case GetFlagID_("CONST_SS_VC_TRY_RANK_C"):
			case GetFlagID_("CONST_SS_VC_RIDE_TUTORIAL"):
			case GetFlagID_("CONST_SS_VC_START_RANK_C"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE_WIN"):
			case GetFlagID_("CONST_SS_VC_SECOND_BATTLE"):
			case GetFlagID_("CONST_SS_GR_GET_RIDE_SKILL_JUMP"):
			case GetFlagID_("CONST_SS_GR_INVITE_JUMP_MONSTER"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_1"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_2"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_3"):
				ShowMsg_("NPC_NOCHO_MEN_REC");
				break;
			default:
				ShowMsg_("FlagDefault");
				DebugPrint("道具屋のevent_num値が適切ではありません。");
				break;
			}
		}
	}
}

//-------------------------
//  宿屋の話す内容
//-------------------------
function ContentInn(main_num, event_num, talk_kind)
{
	// 通常会話
	if(talk_kind == 0){
		if(main_num == 1){
			switch(event_num){
			case GetFlagID_("CONST_SS_GR_HIDE_AND_SEEK"):
				ShowMsg_("DEMO_012_AFT_FIND_INN");
				break;
			default:
				ShowMsg_("FlagDefault");
				DebugPrint("宿屋のevent_num値が適切ではありません。");
				break;
			}
		}
	}
	// 本音
	else if(talk_kind == 1){
		if(main_num == 1){
			switch(event_num){
			case GetFlagID_("CONST_SS_GR_HIDE_AND_SEEK"):
			case GetFlagID_("CONST_SS_GR_MEET_JACK"):
			case GetFlagID_("CONST_SS_GR_TALK_QUEEN"):
			case GetFlagID_("CONST_SS_GR_GO_RULAR_STEEL"):
			case GetFlagID_("CONST_SS_GR_SNEAKING_IN_FORTRESS"):
			case GetFlagID_("CONST_SS_GR_COMMUNICATE_ACE"):
			case GetFlagID_("CONST_SS_GR_CONTROL_DEVICE"):
			case GetFlagID_("CONST_SS_GR_APPEAR_BOWSHOCK"):
			case GetFlagID_("CONST_SS_GR_REMATCH_BOWSHOCK"):
			case GetFlagID_("CONST_SS_GR_WIN_BOWSHOCK"):
			case GetFlagID_("CONST_SS_GR_RETURN_KING"):
			case GetFlagID_("CONST_SS_VC_TRY_RANK_C"):
			case GetFlagID_("CONST_SS_VC_RIDE_TUTORIAL"):
			case GetFlagID_("CONST_SS_VC_START_RANK_C"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE_WIN"):
			case GetFlagID_("CONST_SS_VC_SECOND_BATTLE"):
			case GetFlagID_("CONST_SS_GR_GET_RIDE_SKILL_JUMP"):
			case GetFlagID_("CONST_SS_GR_INVITE_JUMP_MONSTER"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_1"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_2"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_3"):
				ShowMsg_("NPC_NOCHO_MEN_REC");
				break;
			default:
				ShowMsg_("FlagDefault");
				DebugPrint("宿屋のevent_num値が適切ではありません。");
				break;
			}
		}
	}
}

//-------------------------
//  ジャックの話す内容
//-------------------------
function ContentJac(main_num, event_num, talk_kind)
{
	// 通常会話
	if(talk_kind == 0){
		if(main_num == 1){
			switch(event_num){
			case GetFlagID_("CONST_SS_GR_HIDE_AND_SEEK"):
				ShowMsg_("StartDemo");
				break;
			case GetFlagID_("CONST_SS_GR_MEET_JACK"):
			case GetFlagID_("CONST_SS_GR_TALK_QUEEN"):
			case GetFlagID_("CONST_SS_GR_GO_RULAR_STEEL"):
			case GetFlagID_("CONST_SS_GR_SNEAKING_IN_FORTRESS"):
			case GetFlagID_("CONST_SS_GR_COMMUNICATE_ACE"):
			case GetFlagID_("CONST_SS_GR_CONTROL_DEVICE"):
			case GetFlagID_("CONST_SS_GR_APPEAR_BOWSHOCK"):
			case GetFlagID_("CONST_SS_GR_REMATCH_BOWSHOCK"):
			case GetFlagID_("CONST_SS_GR_WIN_BOWSHOCK"):
				ShowMsg_("DEMO_013_AFT_JAC");
				break;
			case GetFlagID_("CONST_SS_GR_RETURN_KING"):
			case GetFlagID_("CONST_SS_VC_TRY_RANK_C"):
			case GetFlagID_("CONST_SS_VC_RIDE_TUTORIAL"):
			case GetFlagID_("CONST_SS_VC_START_RANK_C"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE_WIN"):
			case GetFlagID_("CONST_SS_VC_SECOND_BATTLE"):
				ShowMsg_("DEMO_018_AFT_JAC");
				break;
			case GetFlagID_("CONST_SS_GR_GET_RIDE_SKILL_JUMP"):
				ShowMsg_("DEMO_022_AFT_JAC");
				break;
			case GetFlagID_("CONST_SS_GR_INVITE_JUMP_MONSTER"):
				ShowMsg_("DEMO_023_AFT_JAC");
				break;
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_1"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_2"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_3"):
				ShowMsg_("DEMO_024_AFT_JAC");
				break;
			default:
				ShowMsg_("FlagDefault");
				DebugPrint("ジャックのevent_num値が適切ではありません。");
				break;
			}
		}
	}
	// 本音
	else if(talk_kind == 1){
		if(main_num == 1){
			switch(event_num){
			case GetFlagID_("CONST_SS_GR_HIDE_AND_SEEK"):
			case GetFlagID_("CONST_SS_GR_MEET_JACK"):
			case GetFlagID_("CONST_SS_GR_TALK_QUEEN"):
			case GetFlagID_("CONST_SS_GR_GO_RULAR_STEEL"):
			case GetFlagID_("CONST_SS_GR_SNEAKING_IN_FORTRESS"):
			case GetFlagID_("CONST_SS_GR_COMMUNICATE_ACE"):
			case GetFlagID_("CONST_SS_GR_CONTROL_DEVICE"):
			case GetFlagID_("CONST_SS_GR_APPEAR_BOWSHOCK"):
			case GetFlagID_("CONST_SS_GR_REMATCH_BOWSHOCK"):
			case GetFlagID_("CONST_SS_GR_WIN_BOWSHOCK"):
			case GetFlagID_("CONST_SS_GR_RETURN_KING"):
			case GetFlagID_("CONST_SS_VC_TRY_RANK_C"):
			case GetFlagID_("CONST_SS_VC_RIDE_TUTORIAL"):
			case GetFlagID_("CONST_SS_VC_START_RANK_C"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE_WIN"):
			case GetFlagID_("CONST_SS_VC_SECOND_BATTLE"):
			case GetFlagID_("CONST_SS_GR_GET_RIDE_SKILL_JUMP"):
			case GetFlagID_("CONST_SS_GR_INVITE_JUMP_MONSTER"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_1"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_2"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_3"):
				ShowMsg_("NPC_JACK_REC");
				break;
			default:
				ShowMsg_("FlagDefault");
				DebugPrint("ジャックのevent_num値が適切ではありません。");
				break;
			}
		}
	}
}

//-------------------------
//  キングの話す内容
//-------------------------
function ContentKng(main_num, event_num, talk_kind)
{
	// 通常会話
	if(talk_kind == 0){
		if(main_num == 1){
			switch(event_num){
			case GetFlagID_("CONST_SS_GR_RETURN_KING"):
			case GetFlagID_("CONST_SS_VC_TRY_RANK_C"):
			case GetFlagID_("CONST_SS_VC_RIDE_TUTORIAL"):
			case GetFlagID_("CONST_SS_VC_START_RANK_C"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE_WIN"):
			case GetFlagID_("CONST_SS_VC_SECOND_BATTLE"):
				ShowMsg_("DEMO_018_AFT_KNG");
				break;
			case GetFlagID_("CONST_SS_GR_GET_RIDE_SKILL_JUMP"):
				ShowMsg_("StartDemo");
				break;
			case GetFlagID_("CONST_SS_GR_INVITE_JUMP_MONSTER"):
				ShowMsg_("DEMO_023_AFT_KNG");
				break;
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_1"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_2"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_3"):
				ShowMsg_("DEMO_024_AFT_KNG");
				break;
			default:
				ShowMsg_("FlagDefault");
				DebugPrint("キングの会話のevent_num値が適切ではありません。");
				break;
			}
		}
	}
	// 本音
	else if(talk_kind == 1){
		if(main_num == 1){
			switch(event_num){
			case GetFlagID_("CONST_SS_GR_RETURN_KING"):
			case GetFlagID_("CONST_SS_VC_TRY_RANK_C"):
			case GetFlagID_("CONST_SS_VC_RIDE_TUTORIAL"):
			case GetFlagID_("CONST_SS_VC_START_RANK_C"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE_WIN"):
			case GetFlagID_("CONST_SS_VC_SECOND_BATTLE"):
			case GetFlagID_("CONST_SS_GR_GET_RIDE_SKILL_JUMP"):
			case GetFlagID_("CONST_SS_GR_INVITE_JUMP_MONSTER"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_1"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_2"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_3"):
				ShowMsg_("NPC_KING_REC");
				break;
			default:
				ShowMsg_("FlagDefault");
				DebugPrint("キングの本音のevent_num値が適切ではありません。");
				break;
			}
		}
	}
}

//-------------------------
//  NPC_A(ノチョリン)の話す内容
//-------------------------
function ContentNpcA(main_num, event_num, talk_kind)
{
	// 通常会話
	if(talk_kind == 0){
		if(main_num == 1){
			switch(event_num){
			case GetFlagID_("CONST_SS_GR_HIDE_AND_SEEK"):
				ShowMsg_("DEMO_012_AFT_NOC_A");
				KeyInputWait_();
				CloseMsgWnd_();
				// リアクターからのお知らせ
				CommReactorActionNotice();
				// リアクターメッセージ
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_REACTOR");
				ShowMsg_("DEMO_012_AFT_REACTOR");
				KeyInputWait_();
				CloseMsgWnd_();
				// 主人公のモーションを戻す
				CommResetPlayerMotion();
				break;
			case GetFlagID_("CONST_SS_GR_MEET_JACK"):
			case GetFlagID_("CONST_SS_GR_TALK_QUEEN"):
			case GetFlagID_("CONST_SS_GR_GO_RULAR_STEEL"):
			case GetFlagID_("CONST_SS_GR_SNEAKING_IN_FORTRESS"):
			case GetFlagID_("CONST_SS_GR_COMMUNICATE_ACE"):
			case GetFlagID_("CONST_SS_GR_CONTROL_DEVICE"):
			case GetFlagID_("CONST_SS_GR_APPEAR_BOWSHOCK"):
			case GetFlagID_("CONST_SS_GR_REMATCH_BOWSHOCK"):
			case GetFlagID_("CONST_SS_GR_WIN_BOWSHOCK"):
				ShowMsg_("DEMO_013_AFT_NOC_A");
				break;
			case GetFlagID_("CONST_SS_GR_RETURN_KING"):
			case GetFlagID_("CONST_SS_VC_TRY_RANK_C"):
			case GetFlagID_("CONST_SS_VC_RIDE_TUTORIAL"):
			case GetFlagID_("CONST_SS_VC_START_RANK_C"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE_WIN"):
			case GetFlagID_("CONST_SS_VC_SECOND_BATTLE"):
				ShowMsg_("DEMO_018_AFT_NOC_A");
				break;
			case GetFlagID_("CONST_SS_GR_GET_RIDE_SKILL_JUMP"):
				ShowMsg_("DEMO_022_AFT_NOC_A");
				break;
			case GetFlagID_("CONST_SS_GR_INVITE_JUMP_MONSTER"):
				ShowMsg_("DEMO_023_AFT_NOC_A");
				break;
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_1"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_2"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_3"):
				ShowMsg_("DEMO_024_AFT_NOC_A");
				break;
			default:
				ShowMsg_("FlagDefault");
				DebugPrint("NPC_Aのevent_num値が適切ではありません。");
				break;
			}
		}
	}
	// 本音
	else if(talk_kind == 1){
		if(main_num == 1){
			switch(event_num){
			case GetFlagID_("CONST_SS_GR_HIDE_AND_SEEK"):
				ShowMsg_("NPC_NOCHO_MEN_REC");
				break;
			case GetFlagID_("CONST_SS_GR_MEET_JACK"):
			case GetFlagID_("CONST_SS_GR_TALK_QUEEN"):
			case GetFlagID_("CONST_SS_GR_GO_RULAR_STEEL"):
			case GetFlagID_("CONST_SS_GR_SNEAKING_IN_FORTRESS"):
			case GetFlagID_("CONST_SS_GR_COMMUNICATE_ACE"):
			case GetFlagID_("CONST_SS_GR_CONTROL_DEVICE"):
			case GetFlagID_("CONST_SS_GR_APPEAR_BOWSHOCK"):
			case GetFlagID_("CONST_SS_GR_REMATCH_BOWSHOCK"):
			case GetFlagID_("CONST_SS_GR_WIN_BOWSHOCK"):
			case GetFlagID_("CONST_SS_GR_RETURN_KING"):
			case GetFlagID_("CONST_SS_VC_TRY_RANK_C"):
			case GetFlagID_("CONST_SS_VC_RIDE_TUTORIAL"):
			case GetFlagID_("CONST_SS_VC_START_RANK_C"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE_WIN"):
			case GetFlagID_("CONST_SS_VC_SECOND_BATTLE"):
			case GetFlagID_("CONST_SS_GR_GET_RIDE_SKILL_JUMP"):
			case GetFlagID_("CONST_SS_GR_INVITE_JUMP_MONSTER"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_1"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_2"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_3"):
				ShowMsg_("NPC_NOCHORIN_REC");
				break;
			default:
				ShowMsg_("FlagDefault");
				DebugPrint("NPC_Aのevent_num値が適切ではありません。");
				break;
			}
		}
	}
}

//-------------------------
//  NPC_Bの話す内容
//-------------------------
function ContentNpcB(main_num, event_num, talk_kind)
{
	// 通常会話
	if(talk_kind == 0){
		if(main_num == 1){
			switch(event_num){
			case GetFlagID_("CONST_SS_GR_RETURN_KING"):
			case GetFlagID_("CONST_SS_VC_TRY_RANK_C"):
			case GetFlagID_("CONST_SS_VC_RIDE_TUTORIAL"):
			case GetFlagID_("CONST_SS_VC_START_RANK_C"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE_WIN"):
			case GetFlagID_("CONST_SS_VC_SECOND_BATTLE"):
				ShowMsg_("DEMO_018_AFT_NOC_B");
				break;
			case GetFlagID_("CONST_SS_GR_GET_RIDE_SKILL_JUMP"):
				ShowMsg_("DEMO_022_AFT_NOC_B");
				break;
			case GetFlagID_("CONST_SS_GR_INVITE_JUMP_MONSTER"):
				ShowMsg_("DEMO_023_AFT_NOC_B");
				break;
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_1"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_2"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_3"):
				ShowMsg_("DEMO_024_AFT_NOC_B");
				break;
			default:
				ShowMsg_("FlagDefault");
				DebugPrint(" NPC_Bのevent_num値が適切ではありません。");
				break;
			}
		}
	}
	// 本音
	else if(talk_kind == 1){
		if(main_num == 1){
			switch(event_num){
			case GetFlagID_("CONST_SS_GR_RETURN_KING"):
			case GetFlagID_("CONST_SS_VC_TRY_RANK_C"):
			case GetFlagID_("CONST_SS_VC_RIDE_TUTORIAL"):
			case GetFlagID_("CONST_SS_VC_START_RANK_C"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE_WIN"):
			case GetFlagID_("CONST_SS_VC_SECOND_BATTLE"):
			case GetFlagID_("CONST_SS_GR_GET_RIDE_SKILL_JUMP"):
			case GetFlagID_("CONST_SS_GR_INVITE_JUMP_MONSTER"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_1"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_2"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_3"):
				ShowMsg_("NPC_NOCHO_MEN_REC");
				break;
			default:
				ShowMsg_("FlagDefault");
				DebugPrint(" NPC_Bのevent_num値が適切ではありません。");
				break;
			}
		}
	}
}

//-------------------------
//  クイーンの話す内容
//-------------------------
function ContentQen(main_num, event_num, talk_kind)
{
	// 通常会話
	if(talk_kind == 0){
		if(main_num == 1){
			switch(event_num){
			case GetFlagID_("CONST_SS_GR_HIDE_AND_SEEK"):
				ShowMsg_("DEMO_012_AFT_FIND_QEN");
				break;
			case GetFlagID_("CONST_SS_GR_MEET_JACK"):
			case GetFlagID_("CONST_SS_GR_TALK_QUEEN"):
			case GetFlagID_("CONST_SS_GR_GO_RULAR_STEEL"):
				ShowMsg_("DEMO_013_AFT_QEN_5");
				break;
			case GetFlagID_("CONST_SS_GR_SNEAKING_IN_FORTRESS"):
			case GetFlagID_("CONST_SS_GR_COMMUNICATE_ACE"):
			case GetFlagID_("CONST_SS_GR_CONTROL_DEVICE"):
			case GetFlagID_("CONST_SS_GR_APPEAR_BOWSHOCK"):
			case GetFlagID_("CONST_SS_GR_REMATCH_BOWSHOCK"):
			case GetFlagID_("CONST_SS_GR_WIN_BOWSHOCK"):
				ShowMsg_("DEMO_013_AFT_QEN");
				break;
			case GetFlagID_("CONST_SS_GR_RETURN_KING"):
			case GetFlagID_("CONST_SS_VC_TRY_RANK_C"):
			case GetFlagID_("CONST_SS_VC_RIDE_TUTORIAL"):
			case GetFlagID_("CONST_SS_VC_START_RANK_C"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE_WIN"):
			case GetFlagID_("CONST_SS_VC_SECOND_BATTLE"):
				ShowMsg_("DEMO_018_AFT_QEN");
				break;
			case GetFlagID_("CONST_SS_GR_GET_RIDE_SKILL_JUMP"):
				ShowMsg_("DEMO_022_AFT_QEN");
				break;
			case GetFlagID_("CONST_SS_GR_INVITE_JUMP_MONSTER"):
				ShowMsg_("DEMO_023_AFT_QEN");
				break;
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_1"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_2"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_3"):
				ShowMsg_("DEMO_024_AFT_QEN");
				break;
			default:
				ShowMsg_("FlagDefault");
				DebugPrint("クイーンの会話のevent_num値が適切ではありません。");
				break;
			}
		}
	}
	// 本音
	else if(talk_kind == 1){
		if(main_num == 1){
			switch(event_num){
			case GetFlagID_("CONST_SS_GR_HIDE_AND_SEEK"):
			case GetFlagID_("CONST_SS_GR_MEET_JACK"):
			case GetFlagID_("CONST_SS_GR_TALK_QUEEN"):
				ShowMsg_("NPC_NOCHO_WOMEN_REC");
				break;
			case GetFlagID_("CONST_SS_GR_GO_RULAR_STEEL"):
			case GetFlagID_("CONST_SS_GR_SNEAKING_IN_FORTRESS"):
			case GetFlagID_("CONST_SS_GR_COMMUNICATE_ACE"):
			case GetFlagID_("CONST_SS_GR_CONTROL_DEVICE"):
			case GetFlagID_("CONST_SS_GR_APPEAR_BOWSHOCK"):
			case GetFlagID_("CONST_SS_GR_REMATCH_BOWSHOCK"):
			case GetFlagID_("CONST_SS_GR_WIN_BOWSHOCK"):
			case GetFlagID_("CONST_SS_GR_RETURN_KING"):
			case GetFlagID_("CONST_SS_VC_TRY_RANK_C"):
			case GetFlagID_("CONST_SS_VC_RIDE_TUTORIAL"):
			case GetFlagID_("CONST_SS_VC_START_RANK_C"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE_WIN"):
			case GetFlagID_("CONST_SS_VC_SECOND_BATTLE"):
			case GetFlagID_("CONST_SS_GR_GET_RIDE_SKILL_JUMP"):
			case GetFlagID_("CONST_SS_GR_INVITE_JUMP_MONSTER"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_1"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_2"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_3"):
				ShowMsg_("NPC_QUEEN_REC");
				break;
			default:
				ShowMsg_("FlagDefault");
				DebugPrint("クイーンの本音のevent_num値が適切ではありません。");
				break;
			}
		}
	}
}

//-------------------------
//  リアクター屋の話す内容
//-------------------------
function ContentRec(main_num, event_num, talk_kind)
{
	// 通常会話
	if(talk_kind == 0){
		if(main_num == 1){
			switch(event_num){
			case GetFlagID_("CONST_SS_GR_RETURN_KING"):
			case GetFlagID_("CONST_SS_VC_TRY_RANK_C"):
			case GetFlagID_("CONST_SS_VC_RIDE_TUTORIAL"):
			case GetFlagID_("CONST_SS_VC_START_RANK_C"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE_WIN"):
			case GetFlagID_("CONST_SS_VC_SECOND_BATTLE"):
				ShowMsg_("DEMO_018_AFT_REC_NOC");
				break;
			case GetFlagID_("CONST_SS_GR_GET_RIDE_SKILL_JUMP"):
				ShowMsg_("DEMO_022_AFT_REC_NOC");
				break;
			case GetFlagID_("CONST_SS_GR_INVITE_JUMP_MONSTER"):
				ShowMsg_("DEMO_023_AFT_REC_NOC");
				break;
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_1"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_2"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_3"):
				ShowMsg_("DEMO_024_AFT_REC_NOC");
				break;
			default:
				ShowMsg_("FlagDefault");
				DebugPrint("リアクター屋のevent_num値が適切ではありません(通常会話)");
				break;
			}
		}
	}
	// 本音
	else if(talk_kind == 1){
		if(main_num == 1){
			switch(event_num){
			case GetFlagID_("CONST_SS_GR_RETURN_KING"):
			case GetFlagID_("CONST_SS_VC_TRY_RANK_C"):
			case GetFlagID_("CONST_SS_VC_RIDE_TUTORIAL"):
			case GetFlagID_("CONST_SS_VC_START_RANK_C"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE_WIN"):
			case GetFlagID_("CONST_SS_VC_SECOND_BATTLE"):
			case GetFlagID_("CONST_SS_GR_GET_RIDE_SKILL_JUMP"):
			case GetFlagID_("CONST_SS_GR_INVITE_JUMP_MONSTER"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_1"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_2"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_3"):
				ShowMsg_("NPC_NOCHO_MEN_REC");
				break;
			default:
				ShowMsg_("FlagDefault");
				DebugPrint("リアクター屋のevent_num値が適切ではありません。(本音)");
				break;
			}
		}
	}
}

//--------------------------
//  プレイヤーがイベント地雷から離れる
//--------------------------
function PlayerLeaveMine(name_tag, message_key, pos_x, pos_y, pos_z, dir){
	local player = GetPlayerId_();
	OpenMsgWnd_();
	SetTalkName_(name_tag);
	ShowMsg_(message_key);
	KeyInputWait_();
	SetDirToPos_(player, Vec3(pos_x, pos_y, pos_z));
	SetMotion_(player, "RUN", 2);
	local task_walk = Task_MoveForward_(player, 1.0, true);
	SetDir_(player, dir);
	Wait_(5);
	DeleteTask_(task_walk);
	Wait_(10);
	CloseMsgWnd_();
}

//--------------------------
//  別途表示する会話アイコンをセット
//--------------------------
function SetTalkIcon(target, kind)
{
	if(sTalkIconId[kind] == C_NONE_ID && target != C_NONE_ID){
		sTalkIconId[kind] = SetSelectBoneEffect_("EF300_21_TALK_ICON", target, ATTACH_EFFECT1);
	}
}

//======================================================
// 自作関数：全滅復帰の擬似デモ1[ジャックを見つける～キング救出]
//------------------------------------------------------
// 第一引数：なし
// 戻り値  ：なし
//======================================================
function uDeadReturnDemo1()
{
// 暗転
	CommChangeMomentFadeOut(FADE_COLOR_BLACK);
// 準備
	// 主人公の位置
	local player_pos = Vec3(105.157, -1.260, 5.307);
	local player_dir = -140;
	// 擬似デモ後の復帰位置
	local player_rtn_pos = Vec3(105.157, -1.260, 5.307);
	local player_rtn_dir = 90;
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
	SetDirToPlayer_(npc_A);
	Wait_(wait_speed);
	// ノチョリン(待機モーション→会話モーション)
	SetMotion_(npc_A, "TALKLOOP", BLEND_N);
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
	SetMotion_(npc_A, "WAIT", BLEND_L);
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
	ChangeMapPosDir_("H01_00", player_rtn_pos, player_rtn_dir);
}

//======================================================
// 自作関数：全滅復帰の擬似デモ2[救出後にウッドパークに入る～崖に集合前]
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
	local player_pos = Vec3(-21.885, 3.700, -2.418);
	local player_dir = -90;
	// 擬似デモ後の復帰位置
	local player_rtn_pos = Vec3(-4.200, 3.600, 0.000);
	local player_rtn_dir = -90;
	// ウェイト
	local wait_speed     = 15;
	local wait_speed_def = 30;
	// プレイヤーID
	local player = GetPlayerId_();
	// カメラの角度
	local cam_dir = -88;
	local cam_rtn_dir = -90;
	// 定義した数値をセット
	SetPos_(player, player_pos);
	SetDir_(player, player_dir);
	SetCameraDir_(cam_dir);
	Wait_(wait_speed);
	// キング(待機モーション→会話モーション)
	SetMotion_(npc_KNG, "TALKLOOP", BLEND_N);
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
	SetMotion_(npc_KNG, "WAIT", BLEND_L);
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
	ChangeMapPosDir_("H01_00", player_rtn_pos, player_rtn_dir);
}

//======================================================
// 自作関数：全滅復帰の擬似デモ3[崖に集合後～崩落都市到着前]
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
	local player_pos = Vec3(105.157, -1.260, 5.307);
	local player_dir = -140;
	// 擬似デモ後の復帰位置
	local player_rtn_pos = Vec3(105.157, -1.260, 5.307);
	local player_rtn_dir = 90;
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
	ChangeMapPosDir_("H01_00", player_rtn_pos, player_rtn_dir);
}

//=========================================================
// 自作関数：カラーフォンデュがパークに常駐しているか調べる
//---------------------------------------------------------
// 第一引数：なし
// 戻り値  ：パークに常駐しているカラーフォンデュの数(ホワイトを除く)
//=========================================================
function uReturnColorFondueNum()
{
	// 兄弟そろっているかチェックカウント（カラーフォンデュ全員使うので頭でカウントしてる）
	local cf_count = 0;
	if(GetEventFlg_("BFG_STEALTHBOX_LARGE_OPEN_01") == true){
		cf_count = cf_count + 1;
	}
	if(GetEventFlg_("BFG_STEALTHBOX_LARGE_OPEN_02") == true){
		cf_count = cf_count + 1;
	}
	if(GetEventFlg_("BFG_STEALTHBOX_LARGE_OPEN_03") == true){
		cf_count = cf_count + 1;
	}
	if(GetEventFlg_("BFG_STEALTHBOX_LARGE_OPEN_04") == true){
		cf_count = cf_count + 1;
	}
	if(GetEventFlg_("BFG_STEALTHBOX_LARGE_OPEN_05") == true){
		cf_count = cf_count + 1;
	}
	return cf_count;
}

//=========================================================
// 自作関数：擬似デモ ペイント配合解禁
//---------------------------------------------------------
// 第一引数：playerのID
// 戻り値  ：なし
//=========================================================
function uColorFondueDemo(player)
{
	// 暗転
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
	// 配置変更準備
	// プレイヤー
	SetPointPos_(player, "event_color_player01");
	SetDir_(player, 45);
	// 主人公を消す
	SetManualCalcAlpha_(player, true);
	SetAlpha_(player, 0.0);
	// ルキヤを配置している場合は消す
	if (npc_Rukiya != C_NONE_ID) {
		SetVisible(npc_Rukiya, false);
	}
	// ホワイト
	SetDir_(g_npc_cf_white, 90);
	//場所変わらず
	// ブラック
	local demo_npc_black = ReadAndArrangePointNpc("n045", "npc_color_black_end");
	SetScaleSilhouette(demo_npc_black, SCALE.N, SILHOUETTE_WIDTH.N);
	// レッド
	local demo_npc_red = ReadAndArrangePointNpc("n046", "npc_color_red_end");
	SetScaleSilhouette(demo_npc_red, SCALE.N, SILHOUETTE_WIDTH.N);
	// ブルー
	local demo_npc_blue = ReadAndArrangePointNpc("n047", "npc_color_blue_end");
	SetScaleSilhouette(demo_npc_blue, SCALE.N, SILHOUETTE_WIDTH.N);
	// イエロー
	local demo_npc_yellow = ReadAndArrangePointNpc("n048", "npc_color_yellow_end");
	SetScaleSilhouette(demo_npc_yellow, SCALE.N, SILHOUETTE_WIDTH.N);
	// グリーン
	local demo_npc_green = ReadAndArrangePointNpc("n049", "npc_color_green_end");
	SetScaleSilhouette(demo_npc_green, SCALE.N, SILHOUETTE_WIDTH.N);
	// モーション読み込み
	local attack_whi = ReadMotion_(g_npc_cf_white, "m125_00_take_L");
	local attack_bla = ReadMotion_(demo_npc_black, "m125_00_take_L");
	local attack_red = ReadMotion_(demo_npc_red, "m125_00_take_L");
	local attack_blu = ReadMotion_(demo_npc_blue, "m125_00_take_L");
	local attack_yel = ReadMotion_(demo_npc_yellow, "m125_00_take_L");
	local attack_gre = ReadMotion_(demo_npc_green, "m125_00_take_L");
	// カメラ位置変更
	SetPointCameraEye_("event_color_cam_eye");
	SetPointCameraTarget_("event_color_cam_tgt");
	// 暗転明け
	Wait_(15);
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();

	// 擬似デモ開始
	// ホワイトのメッセージ
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_CF_WHITE");
	ShowMsg_("COLORFONDUE_WHITE_101");
	KeyInputWait_();
	ShowMsg_("COLORFONDUE_WHITE_102");
	KeyInputWait_();
	CloseMsgWnd_();
	// グリーンのメッセージ
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_CF_GREEN");
	ShowMsg_("COLORFONDUE_WHITE_103");
	KeyInputWait_();
	CloseMsgWnd_();
	// 戦闘モーション
	SetMotion_(demo_npc_green, attack_gre, BLEND_XL);
	PlaySE_("SE_DEM_006");
	Wait_(30);
	// ブラックのメッセージ
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_CF_BLACK");
	ShowMsg_("COLORFONDUE_WHITE_104");
	KeyInputWait_();
	CloseMsgWnd_();
	// 戦闘モーション
	SetMotion_(demo_npc_black, attack_bla, BLEND_XL);
	PlaySE_("SE_DEM_006");
	Wait_(30);
	// ブルーのメッセージ
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_CF_BLUE");
	ShowMsg_("COLORFONDUE_WHITE_105");
	KeyInputWait_();
	CloseMsgWnd_();
	// 戦闘モーション
	SetMotion_(demo_npc_blue, attack_blu, BLEND_XL);
	PlaySE_("SE_DEM_006");
	Wait_(30);
	// イエローのメッセージ
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_CF_YELLOW");
	ShowMsg_("COLORFONDUE_WHITE_106");
	KeyInputWait_();
	CloseMsgWnd_();
	// 戦闘モーション
	SetMotion_(demo_npc_yellow, attack_yel, BLEND_XL);
	PlaySE_("SE_DEM_006");
	Wait_(30);
	// レッドのメッセージ
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_CF_RED");
	ShowMsg_("COLORFONDUE_WHITE_107");
	KeyInputWait_();
	CloseMsgWnd_();
	// 戦闘モーション
	SetMotion_(demo_npc_red, attack_red, BLEND_XL);
	PlaySE_("SE_DEM_006");
	Wait_(30);
	// ホワイトのメッセージ
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_CF_WHITE");
	ShowMsg_("COLORFONDUE_WHITE_108");
	KeyInputWait_();
	CloseMsgWnd_();
	// 戦闘モーション
	SetMotion_(g_npc_cf_white, attack_whi, BLEND_XL);
	PlaySE_("SE_DEM_006");
	Wait_(30);

	// 全員揃ってのメッセージ
	OpenMsgWnd_();
	ShowMsg_("COLORFONDUE_WHITE_109");
		Wait_(30);

		// ジャンプ上昇モーション
		SetMotion_(g_npc_cf_white, ReadMotion_(g_npc_cf_white, "m125_00_jump"), BLEND_XL);
		SetMotion_(demo_npc_green, ReadMotion_(demo_npc_green, "m125_00_jump"), BLEND_XL);
		SetMotion_(demo_npc_black, ReadMotion_(demo_npc_black, "m125_00_jump"), BLEND_XL);
		SetMotion_(demo_npc_blue, ReadMotion_(demo_npc_blue, "m125_00_jump"), BLEND_XL);
		SetMotion_(demo_npc_yellow, ReadMotion_(demo_npc_yellow, "m125_00_jump"), BLEND_XL);
		SetMotion_(demo_npc_red, ReadMotion_(demo_npc_red, "m125_00_jump"), BLEND_XL);
		PlaySE_("SE_DEM_005");

		//演出的に勢いで流したいのと、つなぎのループモーションは無いため、キー入力待ちは無し
		//６体同時なので、判定は１体だけ
		WaitMotion(g_npc_cf_white);

		// ジャンプ上昇モーション
		SetMotion_(g_npc_cf_white, ReadMotion_(g_npc_cf_white, "m125_00_jump_end"), BLEND_N);
		SetMotion_(demo_npc_green, ReadMotion_(demo_npc_green, "m125_00_jump_end"), BLEND_N);
		SetMotion_(demo_npc_black, ReadMotion_(demo_npc_black, "m125_00_jump_end"), BLEND_N);
		SetMotion_(demo_npc_blue, ReadMotion_(demo_npc_blue, "m125_00_jump_end"), BLEND_N);
		SetMotion_(demo_npc_yellow, ReadMotion_(demo_npc_yellow, "m125_00_jump_end"), BLEND_N);
		SetMotion_(demo_npc_red, ReadMotion_(demo_npc_red, "m125_00_jump_end"), BLEND_N);
	CloseMsgWnd_();

	//６体同時なので、判定は１体だけ
	WaitMotion(g_npc_cf_white);

	// 待機に戻す
	SetMotion_(g_npc_cf_white, MOT_WAIT, BLEND_N);
	SetMotion_(demo_npc_green, MOT_WAIT, BLEND_N);
	SetMotion_(demo_npc_black, MOT_WAIT, BLEND_N);
	SetMotion_(demo_npc_blue, MOT_WAIT, BLEND_N);
	SetMotion_(demo_npc_yellow, MOT_WAIT, BLEND_N);
	SetMotion_(demo_npc_red, MOT_WAIT, BLEND_N);

	Wait_(30);

	// ホワイトのメッセージ
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_CF_WHITE");
	ShowMsg_("COLORFONDUE_WHITE_110");
	KeyInputWait_();
	CloseMsgWnd_();

	// 白暗転
	SetFadePlane_(FADE_PLANE.PLANE_3D);	
	SetFade_(FADE_OUT, FADE_COLOR_WHITE, FADE_DEF);
	PlaySE_("SE_FLD_109");
	WaitFade_();
	// 白暗転中メッセージ
	OpenMsgWnd_();
	ShowMsg_("COLORFONDUE_WHITE_111");
	KeyInputWait_();
	CloseMsgWnd_();

	// 白暗転解除
	SetFade_(FADE_IN, FADE_COLOR_WHITE, FADE_DEF);
	WaitFade_();
	SetFadePlane_(FADE_PLANE.PLANE_NORMAL);	

	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_CF_WHITE");
	ShowMsg_("COLORFONDUE_WHITE_112");
	KeyInputWait_();
	ShowMsg_("COLORFONDUE_WHITE_113");
	KeyInputWait_();
	ShowMsg_("COLORFONDUE_WHITE_114");
	KeyInputWait_();
	CloseMsgWnd_();

	//ペイント配合解禁
	SetEventFlg_("BFG_COUPLING_UNLOCK_PAINT", true);
	SetEventFlg_("BFG_TRAVEL_INFO_SHOW_052", true);		//旅の心得
	//擬似デモ　ペイント配合解禁！
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
	// ルキヤを配置している場合は表示する
	if (npc_Rukiya != C_NONE_ID) {
		SetVisible(npc_Rukiya, true);
	}
	//カメラ位置変更
	SetPlayableCamera_();
	//配置変更が面倒くさいので、マップチェンジで元に戻す
	ChangeMapPosDir_("H01_00", Vec3(15.0, 0.0, 0.0), 267);
}
