//===================== 大陸【静寂の草原】 ====================
//---------------------------------
// ▼空間の遊びで使用する定数
//---------------------------------
// ギミックの起動とクリアフラグ
const GIMMICK_FLG			 = "BFG_SPACE_GIMMICK_GREEN";
const GIMMICK_CLEAR_FLG		 = "BFG_SPACE_GIMMICK_GREEN_1ST_CLEAR";

// 主人公の復帰位置と向き
const XPOS_1				 = 1999.844;	// 遺跡スイッチ付近
const YPOS_1				 = 1300.000;
const ZPOS_1				 = -260.862;
const DIR_1					 = -70;

const XPOS_2				 = -1870.0;		// ゴールボスの手前
const YPOS_2				 = 1349.0;
const ZPOS_2				 = 648.0;
const DIR_2					 = 150;

// 擬似デモで使用するカメラのノード名
const CAMERA_EYE			 = "cameye_001";
const CAMERA_TGT			 = "camtgt_001";

// 遺跡スイッチを起動させる為の鍵ID
const GIMMICK_KEY_ID		 = 901;

// 遺跡スイッチを起動させた時のメッセージID
const GIMMICK_MSG_ID		 = "MASTERS_LOAD_REACTOR_MSG_014";

// 遺跡スイッチ起動後の再生デモナンバー
const DEMO_NUM				 = 13;

// ボスモンスターのID (1=初回, 2=2回目以降)
const BOSS_ID_1				 = "m175_00";	// レジアクセル
const BOSS_ID_2				 = "m175_00";	// レジアクセル

// ボスモンスターのExchange用ID
const BOSS_EXCHANGE_ID		 = 480;			// レジアクセル

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
const BOSS_PARTY_TABLE_1	 = 153;
const BOSS_PARTY_TABLE_2	 = 153;

// ボスを仲間にする際のモンスターパラメータ (1=初回, 2=2回目以降)
const BOSS_PARAMETER_1		 = 1801;
const BOSS_PARAMETER_2		 = 1801;

// ボス仲間後のマップチェンジID
const MAP_ID				 = "H00_00";



//------------------------------------------------
//		戦闘終了後
//------------------------------------------------
function AfterBattle()
{
	// イベントフラグ
	local main_num        = GetNumFlg_("NUM_SCENARIO_MAIN");
	local green_event_num = GetNumFlg_("NUM_SCENARIO_SUB_GREEN");

	// あばれうしどり捕獲チェック
	local get_abareushidori = GetEventFlg_("BFG_FIRST_TIME_SCOUT_ABAREUSHIDORI");

	if(get_abareushidori == false){
		DebugPrint("あばれうしどり捕獲チェック開始");
		if(CheckAllMonsterKind() == true){
			DebugPrint("今のバトルで初めて あばれうしどり を捕まえました");
			SetEventFlg_("BFG_FIRST_TIME_SCOUT_ABAREUSHIDORI", true);
		}
		else{
			DebugPrint("今のバトルで あばれうしどり は捕まえてません！");
		}
	}

	// ここで敗北の判定とフラグ変更を行う。( 16 -> 15 )
	if(main_num == 1){
		if(green_event_num == GetFlagID_("CONST_SS_GR_CHANGE_BOWSHOCK")){
			// ボーショックに敗北
			if(GetBattleEndType_() == END_TYPE_LOSE){
				SetNumFlg_("NUM_SCENARIO_SUB_GREEN", GetFlagID_("CONST_SS_GR_REMATCH_BOWSHOCK"));
			}
		}
	}

	//TERGETアイコンの多重表示の一時回避
	if(main_num == 1){
		if(green_event_num == GetFlagID_("CONST_SS_GR_INVITE_JUMP_MONSTER")){
			if(get_abareushidori == false){
				if (mapNavi03 != 0) {
					SetNaviMapIconVisible_(mapNavi03, false);
				}
			} else {
				if (mapNavi01 != 0) {
					SetNaviMapIconVisible_(mapNavi01, false);
				}
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
	local main_num   = GetNumFlg_("NUM_SCENARIO_MAIN");							// Num0
	local sky_num	 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");						// Num9
	
	// ライドしたまま移動装置を使って来たらライド強制解除
	if(GetEventFlg_("BFG_RIDE_OFF_USED_TRANSFER") == true){
		SetRideOffStart_();
	}
	
	// demo652[予兆]再生後のタイミング
	if(main_num == GetFlagID_("CONST_SM_SKY")){
		if(sky_num == GetFlagID_("CONST_SS_SK_DATA_SAVED")){
			//ライド強制解除
			SetRideOffStart_();
		}
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
	ORCA_FRONT_POS <- Vec3(-611.01, 191.62, 559.71);	// オークAが正面に向くときの目印座標
	ORCB_FRONT_POS <- Vec3(-544.81, 196.03, 587.13);	// オークBが正面に向くときの目印座標

	// ナビマップ
	mapNavi01 <- ArrangePointNaviMapIcon_(NAVIMAP_ICON.DESTINATION, "map_navi_01");	// ノチョーラパーク
	mapNavi02 <- ArrangePointNaviMapIcon_(NAVIMAP_ICON.DESTINATION, "map_navi_02");	// ボーショック住処
	mapNavi03 <- ArrangePointNaviMapIcon_(NAVIMAP_ICON.DESTINATION, "map_navi_03");	// あばれうしどり捕獲
	mapNavi04 <- ArrangePointNaviMapIcon_(NAVIMAP_ICON.DESTINATION, "map_navi_04");	// 北の崖
	mapNavi05 <- ArrangePointNaviMapIcon_(NAVIMAP_ICON.DESTINATION, "map_navi_05");	// 大陸移動装置
	mapNavi06 <- ArrangePointNaviMapIcon_(NAVIMAP_ICON.DESTINATION, "map_navi_06");	// ルーラ石碑
	SetNaviMapIconVisible_(mapNavi01, false);
	SetNaviMapIconVisible_(mapNavi02, false);
	SetNaviMapIconVisible_(mapNavi03, false);
	SetNaviMapIconVisible_(mapNavi04, false);
	SetNaviMapIconVisible_(mapNavi05, false);
	SetNaviMapIconVisible_(mapNavi06, false);

	// マップ到達フラグ
	SetEventFlg_("BFG_ARRIVE_AT_H00", true);

	local main_num        = GetNumFlg_("NUM_SCENARIO_MAIN");
	local op_event_num    = GetNumFlg_("NUM_SCENARIO_SUB_OP");
	local green_event_num = GetNumFlg_("NUM_SCENARIO_SUB_GREEN");
	local check_dead = GetEventFlg_("BFG_DEAD_RETURN");
	local check_r_point_rock = GetEventFlg_("BFG_COMPLETE_FOOTHOLD"); // 岩ギミックのリアクターポイントの位置を切り替える為のフラグ
	local inside_num      = GetNumFlg_("NUM_SCENARIO_SUB_INSIDE_CLEAR");

	// セーブ禁止の解除(オープニング～ノチョリンとの出会いまでは通らないようにする)
	// オープニング
	if(main_num == GetFlagID_("CONST_SM_OPENING")){
		// セーブ機能は解放されていないので何もしない
	}
	// 草原
	else if(main_num == GetFlagID_("CONST_SM_GRASSLAND")){
		if(green_event_num >= GetFlagID_("CONST_SS_GR_ENCOUT_BEFORE")){
			// 崖イベントのみセーブ禁止を解除させない(2次DB #6036)
			if(green_event_num != GetFlagID_("CONST_SS_GR_CLIFF")){
				// セーブ禁止を解除(セーブ禁止マップから帰ってきた時用)
				SetEventFlg_("BFG_SAVE_PROHIBIT", false); // セーブ禁止(Bit451)
			}
		}
	}
	// 草原以降
	else{
		// セーブ禁止を解除(セーブ禁止マップから帰ってきた時用)
		SetEventFlg_("BFG_SAVE_PROHIBIT", false); // セーブ禁止(Bit451)
	}

	// ウッドパークの擬似デモ[ジャック・クイーンからの依頼]再生後に所定位置にいるフラグ状態にする
	SetEventFlg_("BFG_RESET_POS_JACK_AND_QUEEN", false);
	SetEventFlg_("BFG_FIXATION_CHARA_WOOD_PARK", false);

	DebugPrint(" ");
	DebugPrint("NUM_SCENARIO_MAIN の値は " + main_num + " になりました。");
	DebugPrint("NUM_SCENARIO_SUB_OP の値は " + op_event_num + " になりました。");
	DebugPrint("NUM_SCENARIO_SUB_GREEN の値は " + green_event_num + " になりました。");
	
	

	//-------------
	// 全滅復帰処理
	//-------------
	// 全滅復帰時の擬似デモ移行の準備
	if(check_dead == true){
		if(main_num == GetFlagID_("CONST_SM_GRASSLAND")){
			if(green_event_num == GetFlagID_("CONST_SS_GR_INVITE_MONSTER")){
				// ノチョリンを一時的に配置
				dead_npc <- C_NONE_ID;
				dead_npc = ReadAndArrangePointNpc("n043", "dead_return_npc_01");
				SetTalkEnable_(dead_npc, false);
				SetEventFlg_("BFG_RETURN_BATTLE_FIRLD_BGM_HEAD", true);	// 疑似デモのBGMを頭打ちにするフラグ
			}
			else if(green_event_num == GetFlagID_("CONST_SS_GR_HIDE_AND_SEEK")){
				// ノチョリンを一時的に配置
				dead_npc <- C_NONE_ID;
				dead_npc = ReadAndArrangePointNpc("n043", "dead_return_npc_01");
				SetTalkEnable_(dead_npc, false);
				SetEventFlg_("BFG_RETURN_BATTLE_FIRLD_BGM_HEAD", true);
			}
			// 
			else if(green_event_num == GetFlagID_("CONST_SS_GR_RETURN_KING")){
				// ノチョリンを一時的に配置
				dead_npc <- C_NONE_ID;
				dead_npc = ReadAndArrangePointNpc("n043", "dead_return_npc_02");
				SetTalkEnable_(dead_npc, false);
				SetEventFlg_("BFG_RETURN_BATTLE_FIRLD_BGM_HEAD", true);
			}
			else{
				// 例外
			}
		}
	}

	//----------------------------------------------------
	// Demo043[ふしぎな石碑]再生後のカメラの向きを固定する
	//----------------------------------------------------
	// デモ再生直後のカメラの向きを固定するためのフラグ
	local check_camera_dir_fix = GetEventFlg_("BFG_CAMERA_DIR_FIX");
	// ルーラ石碑に接触したかをチェックするフラグ
	local contact_stele = GetEventFlg_("BFG_CONTACT_RULER_STELE");
	// ルーラ石碑を調べたかをチェックするフラグ
	local examine_stele = GetEventFlg_("BFG_EXAMINE_RULER_STELE");

	// Demo043[ふしぎな石碑]を再生後のカメラの向きを設定
	if(check_camera_dir_fix == true){
		if(contact_stele == true && examine_stele == false){
			SetCameraDir_(-72);
			// カメラの向きを変更するフラグを降ろす
			SetEventFlg_("BFG_CAMERA_DIR_FIX", false);
		}
	}

	//---------------
	// ▼ギミック配置
	//---------------
	// ID初期化
	switch01 <- C_NONE_ID;
	
	// ■茂み
	local g_brush = ReadGimmick_("o_dem_02");
	local brush_01 = ArrangePointGimmick_("o_dem_02", g_brush, "brush_01");
	
	// ■檻(草原シナリオ中)
	if(main_num == GetFlagID_("CONST_SM_GRASSLAND")							// Num0 = 1
	&& green_event_num < GetFlagID_("CONST_SS_GR_CONTROL_DEVICE")){			// Num2 = 13 より前
		// 起動前
		local g_cage01 = ReadGimmick_("o_H00_02");
		local cage01 = ArrangePointGimmick_("o_H00_02", g_cage01, "cage_01");
	}
	if(green_event_num >= GetFlagID_("CONST_SS_GR_CONTROL_DEVICE")){		// Num2 = 13 以上
		// 起動後
		local g_cage02 = ReadGimmick_("o_H00_03");
		local cage02 = ArrangePointGimmick_("o_H00_03", g_cage02, "cage_02");
	}
	
	// ■檻(崩落シナリオ以降)
	if(main_num >= GetFlagID_("CONST_SM_CITY")){							// Num0 = 2 以上
		// 起動後
		local g_cage02 = ReadGimmick_("o_H00_03");
		local cage02 = ArrangePointGimmick_("o_H00_03", g_cage02, "cage_02");
	}
	
	// ■木(かつては岩だった)
	if(check_r_point_rock == false){
		local g_rock01 = ReadGimmick_("o_H00_04");
		local rock01 = ArrangePointGimmick_("o_H00_04", g_rock01, "rock_01");
	}
	else{
		local g_rock02 = ReadGimmick_("o_H00_05");
		local rock02 = ArrangePointGimmick_("o_H00_05", g_rock02, "rock_02");
	}
	
	// ■スイッチ
	local g_switch = ReadGimmick_("o_H00_06");
	switch01 = ArrangePointGimmick_("o_H00_06", g_switch, "switch_01");
	
	// ■移動装置
	local g_transfer = ReadGimmick_("o_com_01");
	local transfer_device = ArrangePointGimmick_("o_com_01", g_transfer, "transfer");
	
	// ■ルーラポイント
	local g_rulerpoint = ReadGimmick_("o_com_08");
	rulerpoint01 <- ArrangePointGimmick_("o_com_08", g_rulerpoint, "g_rulerpoint");
	SetMotion_(rulerpoint01, "GIMMICK_0", 0);
	if(GetEventFlg_("BFG_RULER_ADD_001") == true){
		SetMotion_(rulerpoint01, "GIMMICK_2", 0);
		//ルーラポイントが起動後にルーラポイントアイコン表示
		icon01 <- ArrangePointNaviMapIcon_(NAVIMAP_ICON.RULER_POINT , "g_rulerpoint");
		SetNaviMapIconVisible_(icon01, true);
	}
	
	//----------
	// ▼NPC配置
	//----------
	if(main_num == 1){
		if(green_event_num == GetFlagID_("CONST_SS_GR_FIRST_INVITE")){
			// ノチョリン
			local ID_NPC_000 = ReadNpc_("n043");	// ノチョリンモデル
			Nochora <- ArrangePointNpc_(ID_NPC_000, "npc_m");
			SetDir_(Nochora, -108);
			// リアクターメッセージ事前指定版
			SetReactorMsg_(Nochora, "NPC_NOCHO_MEN_REC");
			// アナライズのターゲット名を切り替える(ノチョリン→ノチョーラ)
			SetTargetNameKey_(Nochora, "NAME_TAG_NOCHORA");
		}
		// ノチョーラとの出会いのデモ終了後
		if(green_event_num == GetFlagID_("CONST_SS_GR_ENCOUTER") ||
		   green_event_num == GetFlagID_("CONST_SS_GR_WIN_TUTORIAL") ||
		   green_event_num == GetFlagID_("CONST_SS_GR_NOT_INVITE_MONSTER"))
		{
			// ノチョリン
			local ID_NPC_000 = ReadNpc_("n043");	// ノチョリンモデル
			nochora <- ArrangePointNpc_(ID_NPC_000, "npc_n");
			SetDir_(nochora, -108);
			// メッセージ事前指定版( ノチョリンの本音 )
			SetReactorMsg_(nochora, "NPC_NOCHO_MEN_REC");
			// アナライズのターゲット名を切り替える(ノチョリン→ノチョーラ)
			SetTargetNameKey_(nochora, "NAME_TAG_NOCHORA");
		}
		// 進入禁止のオークを配置
		if(green_event_num >= GetFlagID_("CONST_SS_GR_INVITE_MONSTER")
		&& green_event_num <= GetFlagID_("CONST_SS_GR_HIDE_AND_SEEK")){
			local ID_NPC_ORC = ReadNpc_("m039_00"); 					// オークのID
			npc_ORC_A  <- ArrangePointNpc_(ID_NPC_ORC, "NPC_ORC_01");	// オークA
			npc_ORC_B  <- ArrangePointNpc_(ID_NPC_ORC, "NPC_ORC_02");	// オークA
			// 地雷で向き直る向きに、向かせておく
			SetDirToPos_(npc_ORC_A, ORCA_FRONT_POS);
			SetDirToPos_(npc_ORC_B, ORCB_FRONT_POS);
			// 表示するモンスターNPCのサイズを設定
			SetScaleSilhouette(npc_ORC_A, SCALE.N, SILHOUETTE_WIDTH.N);
			SetScaleSilhouette(npc_ORC_B, SCALE.N, SILHOUETTE_WIDTH.N);
			// スクリプト呼び出し版の本音設定
			SetReactorMsg_(npc_ORC_A, "NPC_ORC_REC");
			SetReactorMsg_(npc_ORC_B, "NPC_ORC_REC");
		}
		// 捕虜( 会話はさせない )
		if(green_event_num <= GetFlagID_("CONST_SS_GR_COMMUNICATE_ACE")){
			// リソース読み込み
			local ID_NPC_000 = ReadNpc_("n000");	// ノチョーラ男モデル
			local ID_NPC_001 = ReadNpc_("n004");	// ノチョーラ女モデル
			local ID_KING    = ReadNpc_("n003");	// キングモデル
			// 檻起動前
			local Prisoner_01   = ArrangePointNpc_(ID_NPC_001, "Prisoner_01");
			local Prisoner_02   = ArrangePointNpc_(ID_NPC_000, "Prisoner_02");
			local Prisoner_03   = ArrangePointNpc_(ID_NPC_001, "Prisoner_03");
			local Prisoner_04   = ArrangePointNpc_(ID_NPC_000, "Prisoner_04");
			local Prisoner_King = ArrangePointNpc_(ID_KING, "Prisoner_King");
			// 会話させない
			SetTalkEnable_(Prisoner_01, false);
			SetTalkEnable_(Prisoner_02, false);
			SetTalkEnable_(Prisoner_03, false);
			SetTalkEnable_(Prisoner_04, false);
			SetTalkEnable_(Prisoner_King, false);
			// スクリプト呼び出し版の本音設定
			SetReactorMsg_(Prisoner_King, "NPC_KING_REC");
		}
		if(green_event_num == GetFlagID_("CONST_SS_GR_CONTROL_DEVICE")
		|| green_event_num == GetFlagID_("CONST_SS_GR_REMATCH_BOWSHOCK")){
			// リソース読み込み
			local ID_NPC_000 = ReadNpc_("n000");	// ノチョーラ男モデル
			local ID_NPC_001 = ReadNpc_("n004");	// ノチョーラ女モデル
			local ID_KING    = ReadNpc_("n003");	// キングモデル
			// 檻起動後
			local Prisoner_01_b = ArrangePointNpc_(ID_NPC_001, "Prisoner_01_b");
			local Prisoner_02_b = ArrangePointNpc_(ID_NPC_000, "Prisoner_02_b");
			local Prisoner_03_b = ArrangePointNpc_(ID_NPC_001, "Prisoner_03_b");
			local Prisoner_04_b = ArrangePointNpc_(ID_NPC_000, "Prisoner_04_b");
			Prisoner_King_b  <- ArrangePointNpc_(ID_KING, "Prisoner_King_b");
			// 会話させない
			SetTalkEnable_(Prisoner_01_b, false);
			SetTalkEnable_(Prisoner_02_b, false);
			SetTalkEnable_(Prisoner_03_b, false);
			SetTalkEnable_(Prisoner_04_b, false);
			// キングのみ会話させる
			if(green_event_num == GetFlagID_("CONST_SS_GR_CONTROL_DEVICE")){
				SetTalkEnable_(Prisoner_King_b, true);
				SetTalkTurn_ (Prisoner_King_b, false);							// ,振り向かないようにする
				SetSearchableAngle_(Prisoner_King_b, SEARCHABLE_ANGLE_NARROW);	// 正面45度から 話しかけ可能
			}
			else{
				// ただし、ボーショック再戦・ブレイクボーショック再戦時は会話させない
				SetTalkEnable_(Prisoner_King_b, false);
			}
			// スクリプト呼び出し版の本音設定
			SetReactorMsg_(Prisoner_King_b, "NPC_KING_REC");
		}
		// 再戦用ボーショック<現状はオーラを纏わせない>→仕様変更で纏わせることになりました。
		if(green_event_num == GetFlagID_("CONST_SS_GR_REMATCH_BOWSHOCK")){
			local boss = ReadNpc_("m207_00");
			// ボーショック
			local Bowshock = ArrangePointNpc_(boss, "Boss");
			SetScaleSilhouette(Bowshock, SCALE.M, SILHOUETTE_WIDTH.M);	// サイズの設定
			SetTalkEnable_(Bowshock, false);	// 会話させない
			SetReactorMsg_(Bowshock, "NPC_BOSHOCK_REC");
			// ボーショックのオーラ
			LoadEffect_("ef730_01_oth_dark_aura01");
			local efect = SetBoneEffect_("ef730_01_oth_dark_aura01", Bowshock);
			// 子分(ビッグハットA・B)
			local retainer = ReadNpc_("m048_00");
			local Retainer_A = ArrangePointNpc_(retainer, "BossRetainer_01");
			local Retainer_B = ArrangePointNpc_(retainer, "BossRetainer_02");
			SetReactorMsg_(Retainer_A, "NPC_BIGHAT_REC");
			SetReactorMsg_(Retainer_B, "NPC_BIGHAT_REC");
			SetScaleSilhouette(Retainer_A, SCALE.N, SILHOUETTE_WIDTH.N);
			SetScaleSilhouette(Retainer_B, SCALE.N, SILHOUETTE_WIDTH.N);
			SetTalkEnable_(Retainer_A, false);
			SetTalkEnable_(Retainer_B, false);
		}
		// demo037[険しい崖を越えて]の後に配置するNPC( 会話はさせない )->2_20会話させることになる(メッセージは問合せ中)
		if(green_event_num == GetFlagID_("CONST_SS_GR_CLIFF")){
			// 玉座ギミック
			local model_throne = ReadGimmick_("o_com_05");
			local throne = ArrangePointGimmick_("o_com_05", model_throne, "NPC_01_THRONE");
			// リソース読み込み
			local ID_NPC_000 = ReadNpc_("n000");	// ノチョーラ男モデル
			local ID_JACK    = ReadNpc_("n001");	// ジャックモデル
			local ID_ACE     = ReadNpc_("n002");	// エースモデル
			local ID_KING    = ReadNpc_("n003");	// キングモデル
			local ID_QUEEN   = ReadNpc_("n005");	// クイーンモデル
			local ID_NOCHORIN= ReadNpc_("n043");	// ノチョリンモデル
			// ＮＰＣ
			local Cliff_King  = ArrangePointNpc_(ID_KING,  "NPC_01");
			local Cliff_Jack  = ArrangePointNpc_(ID_JACK,  "NPC_08");
			local Cliff_Queen = ArrangePointNpc_(ID_QUEEN, "NPC_02");
			local Cliff_Ace   = ArrangePointNpc_(ID_ACE ,  "NPC_05");
			local Cliff_NPC1  = ArrangePointNpc_(ID_NOCHORIN, "NPC_03");
			local Cliff_NPC2  = ArrangePointNpc_(ID_NPC_000, "NPC_04");
			local Cliff_NPC3  = ArrangePointNpc_(ID_NPC_000, "NPC_06");
			local Cliff_NPC4  = ArrangePointNpc_(ID_NPC_000, "NPC_07");
			// 会話させない
			SetTalkEnable_(Cliff_King, false);
			SetTalkEnable_(Cliff_Jack, false);
			SetTalkEnable_(Cliff_Queen, false);
			SetTalkEnable_(Cliff_Ace, false);
			SetTalkEnable_(Cliff_NPC1, false);
			SetTalkEnable_(Cliff_NPC2, false);
			SetTalkEnable_(Cliff_NPC3, false);
			SetTalkEnable_(Cliff_NPC4, false);
		}
		if(green_event_num == GetFlagID_("CONST_SS_GR_START_UP_TRANSFER")){
			//demo038[足場完成] の後に配置するNPC(会話できない距離で次のデモに入る)
			// 玉座ギミック
			local model_throne = ReadGimmick_("o_com_05");
			local throne = ArrangePointGimmick_("o_com_05", model_throne, "NPC_09_THRONE");
			// リソース読み込み
			local ID_NPC_000 = ReadNpc_("n000");	// ノチョーラ男モデル
			local ID_JACK    = ReadNpc_("n001");	// ジャックモデル
			local ID_ACE     = ReadNpc_("n002");	// エースモデル
			local ID_KING    = ReadNpc_("n003");	// キングモデル
			local ID_QUEEN   = ReadNpc_("n005");	// クイーンモデル
			local ID_NOCHORIN= ReadNpc_("n043");	// ノチョリンモデル
			// ＮＰＣ
			local TRANSFER_King  = ArrangePointNpc_(ID_KING,  "NPC_09");
			local TRANSFER_Jack  = ArrangePointNpc_(ID_JACK,  "NPC_10");
			local TRANSFER_Queen = ArrangePointNpc_(ID_QUEEN, "NPC_11");
			local TRANSFER_Ace   = ArrangePointNpc_(ID_ACE ,  "NPC_12");
			local TRANSFER_NPC1  = ArrangePointNpc_(ID_NOCHORIN, "NPC_13");
			local TRANSFER_NPC2  = ArrangePointNpc_(ID_NPC_000, "NPC_14");
			local TRANSFER_NPC3  = ArrangePointNpc_(ID_NPC_000, "NPC_15");
			local TRANSFER_NPC4  = ArrangePointNpc_(ID_NPC_000, "NPC_16");
			// 会話させない
			SetTalkEnable_(TRANSFER_King, false);
			SetTalkEnable_(TRANSFER_Jack, false);
			SetTalkEnable_(TRANSFER_Queen, false);
			SetTalkEnable_(TRANSFER_Ace, false);
			SetTalkEnable_(TRANSFER_NPC1, false);
			SetTalkEnable_(TRANSFER_NPC2, false);
			SetTalkEnable_(TRANSFER_NPC3, false);
			SetTalkEnable_(TRANSFER_NPC4, false);
		}
	}

	// 名前付けの時だけ表示する(主人公の復帰位置はChangeDemo_(9)の所で行っている)
	if(main_num == GetFlagID_("CONST_SM_GRASSLAND")
	&& green_event_num == GetFlagID_("CONST_SS_GR_ENCOUT_BEFORE")){
		// ID初期化
		MONS_1ST <- C_NONE_ID;
		// 配置するキャラを切り替え
		switch(GetNumFlg_("NUM_CHANGE_FIRST_MONSTER"))
		{
		case PURIZUNYAN:
			local ID_PRZN = ReadNpc_("m040_00"); // プリズニャン
			MONS_1ST = ArrangePointNpc_(ID_PRZN, "1st_monster");
			SetScaleSilhouette(MONS_1ST, SCALE.N, SILHOUETTE_WIDTH.N);
			break;
		case FONDHU:
			local ID_FOND = ReadNpc_("m125_00"); // フォンデュ
			MONS_1ST = ArrangePointNpc_(ID_FOND, "1st_monster");
			SetScaleSilhouette(MONS_1ST, SCALE.N, SILHOUETTE_WIDTH.N);
			break;
		case DORAKI:
			local ID_DRKY = ReadNpc_("m052_00"); // ドラキー
			MONS_1ST = ArrangePointNpc_(ID_DRKY, "1st_monster");
			SetScaleSilhouette(MONS_1ST, SCALE.S, SILHOUETTE_WIDTH.S);
			break;
		case NASUBINARA:
			local ID_NASU = ReadNpc_("m069_00"); // ナスビナーラ
			MONS_1ST = ArrangePointNpc_(ID_NASU, "1st_monster");
			SetScaleSilhouette(MONS_1ST, SCALE.N, SILHOUETTE_WIDTH.N);
			break;
		}
		SetTalkEnable_(MONS_1ST, false);
		SetTalkTurn_(MONS_1ST, false);
	}
	
	
	//-----------
	// ▼地雷配置
	//-----------
	// ID初期化
	g_mineCircle11  <- C_NONE_ID;
	g_mineBoxStele  <- C_NONE_ID;
	g_mineCirStele  <- C_NONE_ID;
	g_mineStopStele <- C_NONE_ID;
	
	
	// ■看板
	g_mineCircle01 <- SetPointCircleEventMine_("mine_001", true);
	g_mineCircle02 <- SetPointCircleEventMine_("mine_002", true);
	
	
	// ■崩落都市への移動装置
	local check_transfer_device = GetEventFlg_("BFG_START_UP_TRANSFER_DEVICE"); // 移動装置が起動しているかチェック
	if(check_transfer_device == true){
		g_mineCircle11 = SetPointCircleEventMine_("mine_011", true);
	}
	
	
	// ■ルーラ石碑
	local contact_stele = GetEventFlg_("BFG_CONTACT_RULER_STELE");// ルーラ石碑に接触したかをチェックするフラグ
	local examine_stele = GetEventFlg_("BFG_EXAMINE_RULER_STELE");// ルーラ石碑を調べたかをチェックするフラグ
	if(main_num == GetFlagID_("CONST_SM_GRASSLAND")){
		if(green_event_num == GetFlagID_("CONST_SS_GR_GO_RULAR_STEEL")
		|| green_event_num == GetFlagID_("CONST_SS_GR_SNEAKING_IN_FORTRESS")){
			g_mineBoxStele = SetPointBoxEventMine_("mine_stele", false);
			if(contact_stele == true){
				DeleteEventMine_(g_mineBoxStele);
			}
			if(contact_stele == true){
				g_mineCirStele = SetPointCircleEventMine_("mine_stele_02", true);
				// 進行不可地雷
				g_mineStopStele = SetPointBoxEventMine_("mine_stele_03", false);
			}
			if(contact_stele == true && examine_stele == true){
				DeleteEventMine_(g_mineCirStele);
				DeleteEventMine_(g_mineStopStele);
			}
		}
	}

	//-----------------------------
	// 草原フィールドのイベント地雷
	//-----------------------------
	// ノチョリンとの出会いトリガー(洞穴に入った場合の再配置地雷)
	g_mineBox03_01 <-  C_NONE_ID;
	if(main_num == GetFlagID_("CONST_SM_GRASSLAND")){
		if(green_event_num == 0){
			g_mineBox03_01 = SetPointBoxEventMine_("mine_003_01", false);
			DebugPrint("g_mineBox03_01 を読込みました。");
		}
	}
	
	if(main_num == 1){
		//**アルファロム追加
		if(green_event_num == GetFlagID_("CONST_SS_GR_FIRST_INVITE")){
			g_mineBox03_04  <- SetPointBoxEventMine_("mine_003_04", false);
			g_mineBox03_05  <- SetPointBoxEventMine_("mine_003_05", false);
			DebugPrint("mine_003_04 と g_mineBox03_05 を読込みました。");
		}
		// Demo009[チュートリアル戦闘前の出会い]終了後の戦闘チュートリアル
		if(green_event_num == GetFlagID_("CONST_SS_GR_ENCOUTER") ||
		   green_event_num == GetFlagID_("CONST_SS_GR_WIN_TUTORIAL") ||
		   green_event_num == GetFlagID_("CONST_SS_GR_NOT_INVITE_MONSTER"))
		{
			// 先に進もうとすると止められる地雷
			g_mineBox04_01 <- SetPointBoxEventMine_("mine_004_01", false);
			g_mineBox04_07 <- SetPointBoxEventMine_("mine_004_07", false);
			DebugPrint("g_mineBox04 を読込みました。");
		}
		// ノチョーラパークに行かずにボーショックの住処に行こうとすると止められる地雷
		if(green_event_num >= GetFlagID_("CONST_SS_GR_INVITE_MONSTER")
		&& green_event_num <= GetFlagID_("CONST_SS_GR_HIDE_AND_SEEK")){
			g_mineBox04_08 <- SetPointBoxEventMine_("mine_004_08", false);
		}
		
		// ジャックとの出会いのデモ後に発生するイベント地雷
		if(green_event_num >= GetFlagID_("CONST_SS_GR_SNEAKING_IN_FORTRESS")
		&& green_event_num <= GetFlagID_("CONST_SS_GR_CHANGE_BOWSHOCK")){
			// ノチョーラ族が捕まっているカゴに近づくと発生するイベント地雷１
			if(green_event_num == GetFlagID_("CONST_SS_GR_SNEAKING_IN_FORTRESS")){
				g_mineBox05 <- SetPointBoxEventMine_("mine_005", false);
			}
		}
		
		// ボーショック再戦用地雷
		if(green_event_num == GetFlagID_("CONST_SS_GR_REMATCH_BOWSHOCK")){
			g_mineBox07 <- SetPointBoxEventMine_("mine_007_rematch", false);
		}
		
		// ノチョーラの移民計画デモ後に発生するイベント地雷
		if(green_event_num == GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_3")){
			g_mineCircle08 <- SetPointCircleEventMine_("mine_008", false); // 崖トリガー
		}
		// 険しい崖を越えてデモ後に発生するイベント地雷
		if(green_event_num == GetFlagID_("CONST_SS_GR_CLIFF")){
			g_mineBox09_b1 <- SetPointBoxEventMine_("mine_009_b1", false); // 崖から離れる(ノチョーラパーク側)
			g_mineBox09_b2 <- SetPointBoxEventMine_("mine_009_b2", false); // 崖から離れる(ノチョーラパーク側)
			g_mineBox09_b3 <- SetPointBoxEventMine_("mine_009_b3", false); // 崖から離れる(ノチョーラパーク側)
			g_mineCircle10 <- SetPointCircleEventMine_("mine_010", true);  // 岩場を調べる(6/19ROMで岩から木に変更)
		}
		// 移動装置にたむろっているノチョーラに近づく
		if(green_event_num == GetFlagID_("CONST_SS_GR_START_UP_TRANSFER")){
			g_mineBox12    <- SetPointBoxEventMine_("mine_012", false); //  岩場を調べる(6/19ROMで岩から木に変更)
			g_mineBox12_b  <- SetPointBoxEventMine_("mine_012_2", false); //  岩場を調べる(6/19ROMで岩から木に変更)
			g_mineBox12_c  <- SetPointBoxEventMine_("mine_012_3", false); //  岩場を調べる(6/19ROMで岩から木に変更)
		}
	}

	// ■制御装置(ウィンチ)
	g_mineCircle06 <- C_NONE_ID;
	g_mineCircle06 = SetPointCircleEventMine_("mine_006", true);

	// ■ルーラポイント(ボス戦前)
	mine_ruler_01 <- SetPointCircleEventMine_("mine_ruler_01", true);

	//-------------------------
	// ▼リアクターポイント配置
	//-------------------------
	// ■ウッドパーク
	local reactorPoint01 = ArrangeMsgReactorPoint("reactorPoint_01", GetFlagID_("BFG_REACTER_POINT_002")
		, LONG_DIST, "REC_POINT_GR_01_01", "REC_POINT_GR_01_02");
	// ■看板
	local reactorPoint02 = ArrangeMsgReactorPoint("reactorPoint_02", GetFlagID_("BFG_REACTER_POINT_003")
		, SHORT_DIST, "REC_POINT_GR_06_01", "REC_POINT_GR_06_02");
	// ■妖精のいこい場
	local reactorPoint03 = ArrangeMsgReactorPoint("reactorPoint_03", GetFlagID_("BFG_REACTER_POINT_005")
		, LONG_DIST, "REC_POINT_GR_05_01", "REC_POINT_GR_05_02");
	// ■大喰らいのアギト
	local reactorPoint04 = ArrangeMsgReactorPoint("reactorPoint_04", GetFlagID_("BFG_REACTER_POINT_004")
		, LONG_DIST, "REC_POINT_GR_02_01", "REC_POINT_GR_02_02");
	// ■檻(草原シナリオ中)
	if(main_num == GetFlagID_("CONST_SM_GRASSLAND")							// Num0 = 1
	&& green_event_num < GetFlagID_("CONST_SS_GR_CONTROL_DEVICE")){			// Num2 = 13 より前
		// 起動前
		local reactorPoint05 = ArrangeMsgReactorPoint("reactorPoint_05", GetFlagID_("BFG_REACTER_POINT_011")
			, SHORT_DIST, "REC_POINT_GR_03_01", "REC_POINT_GR_03_02");
	}
	if(green_event_num >= GetFlagID_("CONST_SS_GR_CONTROL_DEVICE")){
		// 起動後
		local reactorPoint05_2 = ArrangeMsgReactorPoint("reactorPoint_05_2", GetFlagID_("BFG_REACTER_POINT_011")
			, SHORT_DIST, "REC_POINT_GR_03_01", "REC_POINT_GR_03_02");
	}
	// ■檻(崩落シナリオ以降)
	if(main_num >= GetFlagID_("CONST_SM_CITY")){							// Num0 = 2 以上
		// 起動後
		local reactorPoint05_2 = ArrangeMsgReactorPoint("reactorPoint_05_2", GetFlagID_("BFG_REACTER_POINT_011")
			, SHORT_DIST, "REC_POINT_GR_03_01", "REC_POINT_GR_03_02");
	}
	// ■制御装置(ウィンチ)
	local reactorPoint06 = ArrangeMsgReactorPoint("reactorPoint_06", GetFlagID_("BFG_REACTER_POINT_012")
		, SHORT_DIST, "REC_POINT_GR_04_01", "REC_POINT_GR_04_02");
	// ■木(かつては岩だった)
	if(check_r_point_rock == false){
		local reactorPoint07 = ArrangeMsgReactorPoint("reactorPoint_07", GetFlagID_("BFG_REACTER_POINT_014")
			, SHORT_DIST, "REC_POINT_GR_07_01", "REC_POINT_GR_07_02");
	}
	else{
		local reactorPoint07_2 = ArrangeMsgReactorPoint("reactorPoint_07_2", GetFlagID_("BFG_REACTER_POINT_014")
			, SHORT_DIST, "REC_POINT_GR_07_01", "REC_POINT_GR_07_02");
	}
	// ■移動装置
	local reactorPoint08 = ArrangeMsgReactorPoint("reactorPoint_08", GetFlagID_("BFG_REACTER_POINT_015")
		, SHORT_DIST, "REC_POINT_GR_08_01", "REC_POINT_GR_08_02");
	// ■コア
	local reactorPoint09 = ArrangeMsgReactorPoint("reactorPoint_09", GetFlagID_("BFG_REACTER_POINT_001")
		, ENDLESS_DIST, "REC_POINT_GR_09_01", "REC_POINT_GR_09_02");
	// ■ふしぎな石碑
	local reactorPoint10 = ArrangeMsgReactorPoint("reactorPoint_10", GetFlagID_("BFG_REACTER_POINT_009")
		, SHORT_DIST, "REC_POINT_GR_10_01", "REC_POINT_GR_10_02");
	// ■ルーラポイント
	local reactorPoint11 = ArrangeMsgReactorPoint("reactorPoint_11", GetFlagID_("BFG_REACTER_POINT_010")
		, SHORT_DIST, "REC_POINT_GR_11_01", "REC_POINT_GR_11_02");
	// ■楽園跡地（西口）
	local reactorPoint12 = ArrangeMsgReactorPoint("reactorPoint_12", GetFlagID_("BFG_REACTER_POINT_044")
		, SHORT_DIST, "REC_POINT_GR_12_01", "REC_POINT_GR_12_02");
	// ■楽園跡地（東口）
	local reactorPoint13 = ArrangeMsgReactorPoint("reactorPoint_13", GetFlagID_("BFG_REACTER_POINT_044")
		, SHORT_DIST, "REC_POINT_GR_12_01", "REC_POINT_GR_12_02");
	// ■天導の柱
	local reactorPoint14 = ArrangeMsgReactorPoint("reactorPoint_14", GetFlagID_("BFG_REACTER_POINT_176")
		, SHORT_DIST, "REC_POINT_GR_13_01", "REC_POINT_GR_13_02");

	//-----------------
	// ▼マップナビ配置
	//-----------------
	// ■檻の制御装置
	if(main_num == GetFlagID_("CONST_SM_GRASSLAND")
	&& green_event_num == GetFlagID_("CONST_SS_GR_COMMUNICATE_ACE")){
		local exclamation01 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "switch_01");
		SetNaviMapIconVisible_(exclamation01, true);
	}
	
	if(main_num == 1){
		if(green_event_num == GetFlagID_("CONST_SS_GR_INVITE_MONSTER")
		|| green_event_num == GetFlagID_("CONST_SS_GR_HIDE_AND_SEEK")){
			SetNaviMapIconVisible_(mapNavi01, true);	// ノチョーラパーク
		}
		if(green_event_num >= GetFlagID_("CONST_SS_GR_MEET_JACK")
		&& green_event_num <= GetFlagID_("CONST_SS_GR_CHANGE_BOWSHOCK")){
			if(contact_stele == true && examine_stele == true){
				SetNaviMapIconVisible_(mapNavi02, true);	// ボーショック住処
			}
			else{
				SetNaviMapIconVisible_(mapNavi06, true);	// ルーラ石碑
			}
		}
		if(green_event_num >= GetFlagID_("CONST_SS_GR_RETURN_KING")
		&& green_event_num <= GetFlagID_("CONST_SS_GR_GET_RIDE_SKILL_JUMP")){
			SetNaviMapIconVisible_(mapNavi01, true);	// ノチョーラパーク
		}
		if(green_event_num >= GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_1")
		&& green_event_num <= GetFlagID_("CONST_SS_GR_CLIFF")){
			 SetNaviMapIconVisible_(mapNavi04, true);	// 北の崖
		}
		if(green_event_num > GetFlagID_("CONST_SS_GR_CLIFF")
		&& green_event_num <= GetFlagID_("CONST_SS_GR_CITY_ENTRANCE")){
			 SetNaviMapIconVisible_(mapNavi05, true);	// 大陸移動装置
		}
	}
	// 裏シナリオ中
	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){				// NUm0  = 9
		if(inside_num == GetFlagID_("CONST_SS_OS_GO_WOOD_PARK")){		// Num10 = 1
			SetNaviMapIconVisible_(mapNavi01, true);		// ノチョーラパーク
		}
	}
	
	// ■ルーラ石碑
	local g_stele = ReadGimmick_("o_com_07");
	ruler_stele <- ArrangePointGimmick_("o_com_07", g_stele, "stele");
	
	// ■石碑アイコン
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

//------------------------------------------------
//		フィールド操作開始
//------------------------------------------------
function EventStartOperate()
{
	// フラグを取得
	local main_num        = GetNumFlg_("NUM_SCENARIO_MAIN");
	local op_event_num    = GetNumFlg_("NUM_SCENARIO_SUB_OP");
	local green_event_num = GetNumFlg_("NUM_SCENARIO_SUB_GREEN");
	local sky_num         = GetNumFlg_("NUM_SCENARIO_SUB_SKY");
	local inside_num      = GetNumFlg_("NUM_SCENARIO_SUB_INSIDE_CLEAR");
	local scout_check     = GetEventFlg_("BFG_FIRST_TIME_SCOUT_ABAREUSHIDORI");
	local contact_stele   = GetEventFlg_("BFG_CONTACT_RULER_STELE");// ルーラ石碑に接触したかをチェックするフラグ
	local examine_stele   = GetEventFlg_("BFG_EXAMINE_RULER_STELE");// ルーラ石碑を調べたかをチェックするフラグ

	// IDを取得
	local player          = GetPlayerId_();
	
	DebugPrint(" ");
	DebugPrint("NUM_SCENARIO_MAIN の値は " + main_num + " になりました。");
	DebugPrint("NUM_SCENARIO_SUB_OP の値は " + op_event_num + " になりました。");
	DebugPrint("NUM_SCENARIO_SUB_GREEN の値は " + green_event_num + " になりました。");

	//-----------------------
	// ▼移動装置を使用した時
	//-----------------------
	if(GetEventFlg_("BFG_RIDE_OFF_USED_TRANSFER") == true){
		SetEventFlg_("BFG_RIDE_OFF_USED_TRANSFER", false);
		
		UsingTransfer();
	}

	// アクセサリー屋の配置を変更
	if(main_num == GetFlagID_("CONST_SM_GRASSLAND")){
		if(green_event_num == GetFlagID_("CONST_SS_GR_INVITE_JUMP_MONSTER")){
			SetEventFlg_("BFG_CHANGE_POS_ACCE_SHOP_NPC", true);
		}
	}

	//-------------
	// 全滅復帰処理
	//-------------
	// 復帰位置のチェック
	local check_dead = GetEventFlg_("BFG_DEAD_RETURN");
	if(check_dead == true){
		if(main_num == GetFlagID_("CONST_SM_GRASSLAND")){
			if(green_event_num == GetFlagID_("CONST_SS_GR_INVITE_MONSTER")){
				// 全滅通知Bitフラグをfalseに戻す( プログラムで立ててスクリプトで降ろす )
				SetEventFlg_("BFG_DEAD_RETURN", false);
				// 全滅復帰
				uDeadReturnDemo1();
			}
			else if(green_event_num == GetFlagID_("CONST_SS_GR_HIDE_AND_SEEK")){
				// 全滅通知Bitフラグをfalseに戻す( プログラムで立ててスクリプトで降ろす )
				SetEventFlg_("BFG_DEAD_RETURN", false);
				// 全滅復帰
				uDeadReturnDemo1();
			}
			// 
			else if(green_event_num == GetFlagID_("CONST_SS_GR_RETURN_KING")){
				// 全滅通知Bitフラグをfalseに戻す( プログラムで立ててスクリプトで降ろす )
				SetEventFlg_("BFG_DEAD_RETURN", false);
				// 全滅復帰
				uDeadReturnDemo2();
			}
			else{
				// 例外
			}
		}
	}

	//---------------
	// 裏シナリオ開始
	//---------------
	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){
		if(inside_num == 0){
			// Numフラグ操作
			SetNumFlg_("NUM_SCENARIO_MAIN", GetFlagID_("CONST_SM_INSIDE_CLEAR"));					// NUM000 = 9
			SetNumFlg_("NUM_SCENARIO_SUB_INSIDE_CLEAR", GetFlagID_("CONST_SS_OS_GO_WOOD_PARK"));	// NUM010 0 → 1
			// 一時的に草原クリアフラグを降ろす(天候と時間帯の固定の為)
			SetEventFlg_("BFG_SCENARIO_CLEAR_GRASS", false);
			// デモ後主人公の位置
			local rtn_pos = Vec3(139.283, 202.756, 121.290);
			local rtn_dir = -137;
			SetReturnDemoPosDir_(rtn_pos, rtn_dir);
			// 天候と時間帯をデモに合わせる
			SetWeather_(WEATHER.NORMAL);
			SetTime_(START_TIME_ZONE_NOON);
			// Demo800[ルキヤ？からの通信]
			EventStartChangeDemo(800, FADE_COLOR_BLACK);
		}
	}

	//----------------------------
	// Demo652[予兆]再生後にセーブ
	//----------------------------
	if(main_num == GetFlagID_("CONST_SM_SKY")){
		if(sky_num == GetFlagID_("CONST_SS_SK_DATA_SAVED")){
			// フラグを表シナリオクリア後にする
			SetNumFlg_("NUM_SCENARIO_SUB_SKY",  0); 		// 高空シナリオのフラグをリセット
			SetNumFlg_("NUM_SCENARIO_MAIN", GetFlagID_("CONST_SM_INSIDE_CLEAR"));
			SetNumFlg_("NUM_SCENARIO_SUB_INSIDE_CLEAR",  0);
			// 表シナリオクリアフラグ[Bit_46]
			SetEventFlg_("BFG_SCENARIO_CLEAR_ALL", true);
			// 超生配合解禁
			SetEventFlg_("BFG_CHOUSEI_HAIGOU_UNLOCK", true);
			SetEventFlg_("BFG_TRAVEL_INFO_SHOW_050", true); // 旅の心得の項目解放フラグ	【仲間の育成】超生配合
			UpdateLibraryMonsterByUnlockChousei_();			// 超生配合のライブラリ項目更新

			// フェードアウト
			SetFadePlane_(FADE_PLANE.PLANE_3D);
			SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
			SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
			WaitFade_();

			// 表シナリオの機能解禁告知
			OpenMsgWnd_();
			ShowMsg_("SCENARIO_CLEAR_OPENSYSTM_001");
			KeyInputWait_();
			PlaySE_("SE_SYS_011");
			ShowMsg_("SCENARIO_CLEAR_OPENSYSTM_002");
			KeyInputWait_();
			CloseMsgWnd_();

			Wait_(15);

			PlaySE_("SE_SYS_011");
			OpenMsgWnd_();
			ShowMsg_("SCENARIO_CLEAR_OPENSYSTM_003");
			KeyInputWait_();
			CloseMsgWnd_();

			//フェード適用面を元に戻す
			SetFadePlane_(FADE_PLANE.PLANE_NORMAL);

			// 主人公の位置をdemo[予兆]の再生後の位置に合わせる
			local pl_pos = Vec3(139.283, 202.756, 121.290);
			local pl_dir = -99;
			SetPos_(player, pl_pos);
			SetDir_(player, pl_dir);

			SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, FADE_SHORT);
			// 有無を言わさずセーブ
			uAutoSaved();
			// タイトル画面を呼びだす
			ChangeTitle_();
		}
	}

	//-----------------------------
	// ギミックのアニメーション操作
	//-----------------------------
	// フラグが両方とも true の時に石碑の光を消す
	if(contact_stele == true){
		if(examine_stele == true){
			// 石碑は光らない
			SetMotion_(ruler_stele, "GIMMICK_2", 0);
			DebugPrint("石碑(ルーラ)のアニメはGIMMICK_2です");
			SetNaviMapIconVisible_(icon_stone, false);
		}
		else{
			// 石碑は光る
			SetMotion_(ruler_stele, "GIMMICK_0", 0);
			DebugPrint("石碑(ルーラ)のアニメはGIMMICK_0です");
			SetNaviMapIconVisible_(icon_stone, true);
		}
	}
	else{
		// 石碑は光る
		SetMotion_(ruler_stele, "GIMMICK_0", 0);
		DebugPrint("石碑(ルーラ)のアニメはGIMMICK_0です");
		SetNaviMapIconVisible_(icon_stone, true);
	}

	//---------------------------------------------------------
	// イベント戦018[ボーショック登場]・019[ボーショック再戦時] 
	//---------------------------------------------------------
	if(main_num == 1){
		if(green_event_num == GetFlagID_("CONST_SS_GR_APPEAR_BOWSHOCK")){
			// ボーショック戦(再戦も含む)中のフラグ
			SetNumFlg_("NUM_SCENARIO_SUB_GREEN", GetFlagID_("CONST_SS_GR_CHANGE_BOWSHOCK"));
			// ボーショック戦
			ChangeBattleParty_(9);
		}
	}

	//--------------------------------------------
	// Demo014[ノチョーラパークへ連れてって]を再生
	//--------------------------------------------
	if(main_num == 1){
		if(green_event_num == GetFlagID_("CONST_SS_GR_NOT_INVITE_MONSTER")){
			// デモ再生前にフィールドが映らないための対応
			SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
			SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
			WaitFade_();
			// サブフラグを進める
			SetNumFlg_("NUM_SCENARIO_SUB_GREEN", GetFlagID_("CONST_SS_GR_INVITE_MONSTER"));
			// モンスターの出現制限をかけていたフラグを解除
			SetEventFlg_("BFG_LIMIT_TUTORIAL_GREEN", true);

			// デモ終了後の位置を修正
			SetReturnDemoMap_("H00_00");
			//2015/2/26 現状のデモに合わせて調整しました。
			SetReturnDemoPosDir_(Vec3(246.358, 64.276, -705.062), -82);
			// デモ再生
			SetEventFlg_("BFG_DEMO_START_BGM_PAUSE_RELEASE", true);
			ChangeDemo_(14);
		}
	}

	//-----------------------------------------------------------------------------
	// Demo009[チュートリアル戦闘前の出会い]の再生後に名前の設定してDemo012[]を再生
	//-----------------------------------------------------------------------------
	if(main_num == 1){
		if(green_event_num == GetFlagID_("CONST_SS_GR_ENCOUT_BEFORE")){
			// サブフラグを進める
			SetNumFlg_("NUM_SCENARIO_SUB_GREEN", GetFlagID_("CONST_SS_GR_FIRST_INVITE"));
			// demo041再生前に配置するアナライズ用のスライム２体を設置
			SetEventFlg_("BFG_LIMIT_ANALYZE_SLIME", true);
			// モンスターの名前設定画面に移行
			uTaskNamedWindow();
			// 旅の心得の項目解放フラグ	【メニュー】モンスター特技(2次DB #2463でプログラム側で解放することになりました。-> やっぱりスクリプトで解放することになりました。)
			SetEventFlg_("BFG_TRAVEL_INFO_SHOW_020", true); // 備忘録( Redmine#1771で心得の項目が「まんたん」から「モンスター特技」に変更 )
			// 初めてのモンスターを手に入れたフラグ(Redmine #2589)
			SetEventFlg_("BFG_FIRST_MONSTER", true);
			// モンスター特技の解禁
			AddFieldMenu_(FIELD_COMMAND.MONSTERABILITY);
			// デモ終了後の復帰位置
			SetReturnDemoPosDir_(Vec3(807.389, 192.581, -489.168), -120);
			// デモ再生
			EventStartChangeDemo(12, FADE_COLOR_BLACK);
		}
	}

	//-----------------
	// 戦闘終了時の処理
	//-----------------
	// 戦闘終了からの復帰状態を判定
	if (GetBattleEndType_() != BATTLE_END_TYPE_NONE){
		local main_num        = GetNumFlg_("NUM_SCENARIO_MAIN");
		local green_event_num = GetNumFlg_("NUM_SCENARIO_SUB_GREEN");
		if(main_num == 1){
			// チュートリアル戦闘
			// (チュートリアル戦闘初回       green_event_num == 1 )
			// (チュートリアル戦闘２回目以降 green_event_num == 2 )
			if(green_event_num == GetFlagID_("CONST_SS_GR_ENCOUTER")
			|| green_event_num == GetFlagID_("CONST_SS_GR_WIN_TUTORIAL")){
				//戦闘に勝利
				if (GetBattleEndType_() == BATTLE_END_TYPE_WIN){
					// 初回勝利( スカウト失敗 )
					if(green_event_num == GetFlagID_("CONST_SS_GR_ENCOUTER")){
						// デモ再生前にフィールドが映らないための対応
						SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
						SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
						WaitFade_();
						// サブフラグを進める
						SetNumFlg_("NUM_SCENARIO_SUB_GREEN", GetFlagID_("CONST_SS_GR_WIN_TUTORIAL"));
						// 全滅時その場復帰Bitフラグ
						SetEventFlg_("BFG_DEAD_KEEP_MAP", true);
						// 最初のチュートリアルのスライム登場前に配置されないようにするフラグ
						SetEventFlg_("BFG_LIMIT_TUTORIAL_GREEN_BEFORE", true);
						// チュートリアル戦は起き上がらないよフラグ
						SetEventFlg_("BFG_BATTLE_GETUP_DISABLE", true);
						// モンスターを出現させる最小距離を設定
						SetMonsterGenPlayerInvasionAreaMin_(100);  // 制限を10mに設定
						DebugPrint("モンスターを出現させる最小距離を設定2");
						// チュートリアルスカウト失敗フラグ
						SetEventFlg_("BFG_NOT_SUCCESS_SCOUT", true);
						// デモ終了後の復帰位置
						SetReturnDemoPosDir_(Vec3(651.668, 153.869, -688.307), -138); // 東藤さん指定復帰位置
						
						SetEventFlg_("BFG_TRAVEL_INFO_SHOW_025", true);	// 旅の心得の項目解放フラグ	【戦闘】モンスターを仲間にする方法
						SetEventFlg_("BFG_TRAVEL_INFO_SHOW_015", true);	// 旅の心得の項目解放フラグ	【メニュー】作戦
						
						// シナリオの変更で全回復の命令を追加
						RecoverAll_();
						// Demo010[チュートリアル戦闘勝利]が再生
						SetEventFlg_("BFG_DEMO_START_BGM_PAUSE_RELEASE", true);
						ChangeDemo_(10);
					}
					// 勝利( スカウト失敗 )
					else{
						SetNumFlg_("NUM_SCENARIO_SUB_GREEN", GetFlagID_("CONST_SS_GR_WIN_TUTORIAL"));
						// 全滅時その場復帰Bitフラグ
						SetEventFlg_("BFG_DEAD_KEEP_MAP", true);
						// 最初のチュートリアルのスライム登場前に配置されないようにするフラグ
						SetEventFlg_("BFG_LIMIT_TUTORIAL_GREEN_BEFORE", true);
						// チュートリアル戦は起き上がらないよフラグ
						SetEventFlg_("BFG_BATTLE_GETUP_DISABLE", true);
						// モンスターを出現させる最小距離を設定
						SetMonsterGenPlayerInvasionAreaMin_(100);  // 制限を10mに設定
						DebugPrint("モンスターを出現させる最小距離を設定3");
					}
					
				// スカウト成功
				}else if(GetBattleEndType_() == END_TYPE_SCOUT){
					// 初回スカウト成功デモ
					if(green_event_num == GetFlagID_("CONST_SS_GR_ENCOUTER")){
						// デモ再生前にフィールドが映らないための対応
						SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
						SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
						WaitFade_();
						// 全滅時その場復帰Bitフラグを戻す
						SetEventFlg_("BFG_DEAD_KEEP_MAP", false);
						DebugPrint("初回スカウト成功デモ");
						
						SetNumFlg_("NUM_SCENARIO_SUB_GREEN", GetFlagID_("CONST_SS_GR_INVITE_MONSTER"));
						// モンスターの出現制限をかけていたフラグを解除
						SetEventFlg_("BFG_LIMIT_TUTORIAL_GREEN", true);
						// チュートリアル戦以降は起き上がるようにフラグ
						SetEventFlg_("BFG_BATTLE_GETUP_DISABLE", false);
						// スカウト失敗時に怒りを発動するようにする
						SetEventFlg_("BFG_BATTLE_SCOUT_ANGRY_DISABLE", false);
						// 敵パーティのお供体数を制御フラグ(進行度1
						SetNumFlg_("NUM_ENEMY_PARTY_STRENGTH", 1);
						// モンスターを出現させる距離をデフォルト値に戻す
						SetMonsterGenPlayerInvasionAreaMin_(-1);
						// チュートリアルスカウト失敗フラグ
						SetEventFlg_("BFG_NOT_SUCCESS_SCOUT", false);
						SetReturnDemoPosDir_(Vec3(615.893, 150.757, -609.944), -120);
						
						SetEventFlg_("BFG_TRAVEL_INFO_SHOW_025", true);	// 旅の心得の項目解放フラグ	【戦闘】モンスターを仲間にする方法
						SetEventFlg_("BFG_TRAVEL_INFO_SHOW_015", true);	// 旅の心得の項目解放フラグ	【メニュー】作戦
						
						// Demo014[ノチョーラパークへ連れてって(分岐１)]が再生
						SetEventFlg_("BFG_DEMO_START_BGM_PAUSE_RELEASE", true);
						ChangeDemo_(14);
					}
					// スカウト成功デモ
					else{
						// デモ再生前にフィールドが映らないための対応
						SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
						SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
						WaitFade_();
						// 全滅時その場復帰Bitフラグを戻す
						SetEventFlg_("BFG_DEAD_KEEP_MAP", false);
						// サブフラグを進める
						SetNumFlg_("NUM_SCENARIO_SUB_GREEN", GetFlagID_("CONST_SS_GR_INVITE_MONSTER"));
						// チュートリアル戦以降は起き上がるようにフラグ
						SetEventFlg_("BFG_BATTLE_GETUP_DISABLE", false);
						// スカウト失敗時に怒りを発動するようにする
						SetEventFlg_("BFG_BATTLE_SCOUT_ANGRY_DISABLE", false);
						// 敵パーティのお供体数を制御フラグ(進行度1
						SetNumFlg_("NUM_ENEMY_PARTY_STRENGTH", 1);
						// モンスターを出現させる距離をデフォルト値に戻す
						SetMonsterGenPlayerInvasionAreaMin_(-1);
						// モンスターの出現制限をかけていたフラグを解除
						SetEventFlg_("BFG_LIMIT_TUTORIAL_GREEN", true);
						// デモ終了後の位置を修正
						SetReturnDemoMap_("H00_00");
						SetReturnDemoPosDir_(Vec3(615.893, 150.757, -609.944), -120);
						// Demo014[ノチョーラパークへ連れてって(分岐２)]が再生
						SetEventFlg_("BFG_DEMO_START_BGM_PAUSE_RELEASE", true);
						ChangeDemo_(14);
					}
					
				// 敗北
				}else if(GetBattleEndType_() == END_TYPE_LOSE){
					// デモ再生前にフィールドが映らないための対応
					SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
					SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
					WaitFade_();
					// 全滅時その場復帰Bitフラグ
					SetEventFlg_("BFG_DEAD_KEEP_MAP", true);
					// ステータス回復
					RecoverAll_();
					DebugPrint(" ");
					DebugPrint("スクリプト:チュートリアル戦闘で敗北したので回復しました");
					
					// モンスターを出現させる最小距離を設定
					SetMonsterGenPlayerInvasionAreaMin_(100);  // 制限を10mに設定
					
					// 011[チュートリアル戦闘敗北]
					SetReturnDemoPosDir_(Vec3(618.801, 147.278, -644.414), 169); // 東藤さん指定復帰位置
					ChangeDemo_(11);
				}
				
			// ボス(ボーショック)戦の時
			}else if(green_event_num == GetFlagID_("CONST_SS_GR_CHANGE_BOWSHOCK")){
				if (GetBattleEndType_() == BATTLE_END_TYPE_WIN){
					// デモ再生前にフィールドが映らないための対応
					SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
					SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
					WaitFade_();
					// ボーショックに勝利
					SetNumFlg_("NUM_SCENARIO_SUB_GREEN", GetFlagID_("CONST_SS_GR_RETURN_KING"));
					// 草原をクリアしたのでボーショックの住処に
					// モンスターを配置しない制限を解除
					SetEventFlg_("BFG_LIMIT_CLEAR_GREEN", true);
					// 敵パーティのお供体数を制御フラグ(進行度３
					SetNumFlg_("NUM_ENEMY_PARTY_STRENGTH", 3);
					// 全滅復帰マップを変更(Redmine#2261全滅復帰ルールの改訂)
					SetNumFlg_("NUM_DEAD_RETURN_MAP", GetFlagID_("CONST_DEAD_RETURN_MAP_H00_00"));
					// デモ後に設定される主人公の位置と向き
					SetReturnDemoPosDir_(Vec3(510.0, 342.65, 973.96), -70);
					// Demo020[ボーショック戦勝利]が再生される
					ChangeDemo_(20);
				}
				else{
					// 敗北判定はAfterBattle()で行う
				}
			}
		}
	}

	//-----------
	// マップナビ
	//-----------
	// あばれうしどり捕獲チェック
	local get_abareushidori = GetEventFlg_("BFG_FIRST_TIME_SCOUT_ABAREUSHIDORI");
	local hide_aba_mapnavi  = GetEventFlg_("BFG_CHECK_DISPLAYED_ABARE_MAP_NAVI");

	if(main_num == 1){
		if(green_event_num == GetFlagID_("CONST_SS_GR_INVITE_JUMP_MONSTER")){
			if(get_abareushidori == false){
				// あばれうしどり捕獲マップナビを表示
				SetNaviMapIconVisible_(mapNavi03, true);
				// あばれうしどり捕獲マップナビを一度でも表示したかを調べるフラグ
				SetEventFlg_("BFG_CHECK_DISPLAYED_ABARE_MAP_NAVI", true);
			}
			else{
				// 一度でもあばれうしどりマップナビを表示していたら削除する
				if(hide_aba_mapnavi == true){
					SetNaviMapIconVisible_(mapNavi04, false);

					// キングの所に戻ろうメッセージを表示
					if (GetEventFlg_("BFG_ABA_SCOUT_MSG_ON") == false) {
						// プレイヤーのモーションを追加
						SetMotion_(player, "WAIT", 15);
						// システムメッセージ表示(仮)
						CommonMessageT("DEMO_023_AFT_SYS", "NAME_NONE");
						SetEventFlg_("BFG_ABA_SCOUT_MSG_ON", true);
					}
					SetEventFlg_("BFG_FIRST_TIME_SCOUT_ABAREUSHIDORI", true);
				}
				// ノチョーラパークのナビを表示
				SetNaviMapIconVisible_(mapNavi01, true);
			}
		}
	}

	//-------------------------------------
	// ライドフィルタ解除のメッセージを表示
	//-------------------------------------
	// フィールドライド(陸)を取得した段階で表示
	if(GetEventFlg_("BFG_RIDE_LICENSE_FIELD") == true){
		if(!IsOpenNaviMapRideFilter_(RIDE_FILTER.HIGHJUMP)){
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
			OpenNaviMapRideFilter_(RIDE_FILTER.HIGHJUMP);
			// プレイヤーのモーションを待機状態に戻す
			CommResetPlayerMotion();
		}
	}

	//---------------------------
	// リアクター起動演出イベント
	//---------------------------
	if(main_num == GetFlagID_("CONST_SM_OPENING")){
		if(op_event_num == GetFlagID_("CONST_SS_OP_ESCAPE_PARADISE")){
			ReactorOnEvent();
			// ノチョリンとの出会いトリガー(リアクター起動イベント後に地雷を配置)
			g_mineBox03_01 = SetPointBoxEventMine_("mine_003_01", false);
		}
	}

//---------------------------------------------------------------------
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

//------------------------------------------------
//		ＮＰＣ接触時
//------------------------------------------------
function TouchNpc()
{
	local target = GetTargetId_();
	local bit = GetEventFlg_("BFG_NOT_SUCCESS_SCOUT");

	local main_num  = GetNumFlg_("NUM_SCENARIO_MAIN");
	local green_event_num = GetNumFlg_("NUM_SCENARIO_SUB_GREEN");
	
	// ■檻の中のキング
	if(main_num == 1){
		if(green_event_num == GetFlagID_("CONST_SS_GR_CONTROL_DEVICE")
		|| green_event_num == GetFlagID_("CONST_SS_GR_REMATCH_BOWSHOCK")){
			if(target == Prisoner_King_b){
				// サブフラグをイベント戦に変更
				SetNumFlg_("NUM_SCENARIO_SUB_GREEN", GetFlagID_("CONST_SS_GR_APPEAR_BOWSHOCK"));
				// 旅の心得の項目解放
				SetEventFlg_("BFG_TRAVEL_INFO_SHOW_064", true); // 旅の心得の項目解放フラグ【世界観】ブレイクモンスター
				// デモ復帰後の位置
				SetReturnDemoPosDir_(Vec3(515.0, 342.0, 960.0), 60);
				// Demo018[ボーショック登場]再生
				SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
				SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
				WaitFade_();
				ChangeDemo_(18); 
			}
		}

		// ■進入禁止のオーク
		if(green_event_num >= GetFlagID_("CONST_SS_GR_INVITE_MONSTER")
		&& green_event_num <= GetFlagID_("CONST_SS_GR_HIDE_AND_SEEK")){
			// オークA
			if(target == npc_ORC_A){
				CommonMessageT("DEMO_010_AFT_ORC_001", "NAME_NONE");
			}
			// オークB
			if(target == npc_ORC_B){
				CommonMessageT("DEMO_010_AFT_ORC_002", "NAME_NONE");
			}
		}

		if(green_event_num == GetFlagID_("CONST_SS_GR_ENCOUTER") ||
		   green_event_num == GetFlagID_("CONST_SS_GR_WIN_TUTORIAL") ||
		   green_event_num == GetFlagID_("CONST_SS_GR_NOT_INVITE_MONSTER"))
		{
			if(target == nochora){
				if(green_event_num == GetFlagID_("CONST_SS_GR_ENCOUTER")){
					CommonMessageT("DEMO_009_AFT_NOC_002", "NAME_NONE");
				}
				else{
					CommonMessageT("DEMO_009_AFT_NOC_004", "NAME_NONE");
				}
				RecoveryAndMsg();
				DebugPrint("スクリプト:ノチョーラに話しかけて回復しました");
			}
		}
		
		// ノチョーラ(チュートリアル中)
		if(green_event_num == GetFlagID_("CONST_SS_GR_FIRST_INVITE")){
			if(target == Nochora){
				DeleteEventMine_(g_mineBox03_04);
				DeleteEventMine_(g_mineBox03_05);
				// サブフラグを進める
				SetNumFlg_("NUM_SCENARIO_SUB_GREEN", GetFlagID_("CONST_SS_GR_ENCOUTER"));
				// 敵パーティのお供体数を制御フラグ(進行度０
				SetNumFlg_("NUM_ENEMY_PARTY_STRENGTH", 0);
				// 全滅時その場復帰Bitフラグを設定
				SetEventFlg_("BFG_DEAD_KEEP_MAP", true);
				// 最初のチュートリアルのスライム登場前に配置されないようにするフラグ
				SetEventFlg_("BFG_LIMIT_TUTORIAL_GREEN_BEFORE", true);
				// demo041再生前に配置するアナライズ用のスライム２体を消す
				SetEventFlg_("BFG_LIMIT_ANALYZE_SLIME", false);
				// チュートリアル戦は起き上がらないよフラグ
				SetEventFlg_("BFG_BATTLE_GETUP_DISABLE", true);
				// スカウト失敗時に怒りを発動しないようにする
				SetEventFlg_("BFG_BATTLE_SCOUT_ANGRY_DISABLE", true);
				// モンスターを出現させる最小距離を設定
				SetMonsterGenPlayerInvasionAreaMin_(100);  // 制限を10mに設定
				DebugPrint("モンスターを出現させる最小距離を設定1");
				// デモ終了後の復帰位置
				SetReturnDemoPosDir_(Vec3(651.668, 153.869, -688.307), -138); // 東藤さん指定復帰位置
				// 話しかけたらすぐにフェード ＋ Demo041「戦闘チュートリアル導入」を再生
				TouchNpcChangeDemo(41);
			}
		}
	}

	EventEnd_();
}

//------------------------------------------------
//		地雷接触時
//------------------------------------------------
function TouchEventMine()
{
	// フラグを取得
	local main_num             = GetNumFlg_("NUM_SCENARIO_MAIN");
	local op_event_num         = GetNumFlg_("NUM_SCENARIO_SUB_OP");
	local green_event_num      = GetNumFlg_("NUM_SCENARIO_SUB_GREEN");
	local bit_control_device   = GetEventFlg_("BFG_CONTROL_DEVICE");
	local rematch_bit          = GetEventFlg_("BFG_REMATCH_BOWSHOCK");
	local check_camera_dir_fix = GetEventFlg_("BFG_CAMERA_DIR_FIX");	 // デモ再生直後のカメラの向きを固定するためのフラグ
	local contact_stele        = GetEventFlg_("BFG_CONTACT_RULER_STELE");// ルーラ石碑に接触したかをチェックするフラグ
	local examine_stele        = GetEventFlg_("BFG_EXAMINE_RULER_STELE");// ルーラ石碑を調べたかをチェックするフラグ
	
	// IDを取得
	local target = GetTouchEventMineId_();
	local player = GetPlayerId_();

	// ■ボーショック注意の看板
	local board_pos = Vec3(-457.63, 171.68, -302.13);
	if(target == g_mineCircle01){
		CommTurnAroundAndSetPlayableCamera(-95);
		CommonMessageT("MINE_MSG_001", "NAME_NONE");
	}
	if(target == g_mineCircle02){
		CommPlayerTurnAroundDir(95);
		CommonMessageT("MINE_MSG_002", "NAME_NONE");
	}

	// ■ルーラポイント(ボス戦前)
	if(target == mine_ruler_01){
		if(GetEventFlg_("BFG_RULER_ADD_001") == false){
			// ルーラポイントの共通処理
			CommPlayerTurnAroundObj(rulerpoint01);
			CommRulerPointEvent(rulerpoint01, "BFG_RULER_ADD_001", "g_rulerpoint");
		}
		else{
			// 石碑の方に向ける
			CommPlayerTurnAroundObj(rulerpoint01);
			//システムメッセージ
			CommonMessageT("RULER_POINT_MSG", "NAME_TAG_REACTOR");
		}
	}

	// ■ルーラ石碑
	if(contact_stele == false){
		if(target == g_mineBoxStele){
			DeleteEventMine_(g_mineBoxStele);
			// サブフラグの変更
			SetEventFlg_("BFG_CONTACT_RULER_STELE", true);
			SetNumFlg_("NUM_SCENARIO_SUB_GREEN", GetFlagID_("CONST_SS_GR_SNEAKING_IN_FORTRESS"));
			//デモ後の座標と向きを設定
			SetReturnDemoPosDir_(Vec3(-649.015, 201.336, 754.161), -62);
			// カメラの向きを変更するフラグを立てる
			SetEventFlg_("BFG_CAMERA_DIR_FIX", true);
			ChangeDemo_(43);// デモを再生
		}
	}
	else{
		if(examine_stele == false){
			if(target == g_mineCirStele){
				DeleteEventMine_(g_mineCirStele);	// 石碑用地雷削除
				DeleteEventMine_(g_mineStopStele);	// 進行不可地雷を削除
				
				CommPlayerTurnAroundObj(ruler_stele);
				
				//フェードアウト
				SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
				SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
				WaitFade_();
				Wait_(10);
				
				//主人公の位置を石碑の前に置く
				SetPos_(player, Vec3(-742.714, 216.347, 808.211));
				SetDir_(player, -67);
				//カメラを設置
				SetPointCameraEye_("cameye_002");
				SetPointCameraTarget_("camtgt_002");
				Wait_(10);
				
				//スキル取得共通処理
				SkillStelePerformance(ruler_stele, ABILITY_RULER);
				
				// プレイヤー特技の解禁
				AddFieldMenu_(FIELD_COMMAND.PLAYERABILITY);
				SetEventFlg_("BFG_TRAVEL_INFO_SHOW_018", true); // 旅の心得の項目解放フラグ	【メニュー】プレイヤー特技
				SetEventFlg_("BFG_TRAVEL_INFO_SHOW_033", true); // 旅の心得の項目解放フラグ	【フィールド】ルーラ
				SetEventFlg_("BFG_EXAMINE_RULER_STELE", true);
				
				// 石碑アイコンを見えなくする
				SetNaviMapIconVisible_(icon_stone, false);
				// ナビアイコンをルーラ石碑から要塞に変更
				SetNaviMapIconVisible_(mapNavi06, false);	// ルーラ石碑
				SetNaviMapIconVisible_(mapNavi02, true);	// ボーショックの要塞
				
				// ルーラポイント解放後に配置モンスターを解禁する用
				SetEventFlg_("BFG_LIMIT_STELE", true);
				// プレイヤー特技メニューにルーラを追加
				AddPlayerAbility_(PLAYERABILITYID.RULER);
				
				//フェードイン
				SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
				SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
				WaitFade_();
			}
			// 進行不可
			if(target == g_mineStopStele){
				CommReactorActionNotice();		// リアクター反応があった時の共通処理
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_REACTOR");
				ShowMsg_("STELE_MSG_005");
				KeyInputWait_();
				CloseMsgWnd_();
				CommResetPlayerMotion();		// モーションを待機状態に戻す共通処理
				Wait_(5);
				
				// バックして移動
				SetDirToPos_(player, Vec3(-753.838, 232.069, 815.531));
				CommPlayerTurnMoveDirWalk(-123);
			}
		}
	}

	// ■制御装置(ウィンチ)
	if(target == g_mineCircle06){
		local ctl_dev_pos = Vec3(772.83, 365.30, 1021.81);
		if(main_num == GetFlagID_("CONST_SM_GRASSLAND")){
			if(green_event_num == GetFlagID_("CONST_SS_GR_COMMUNICATE_ACE")){
				// 地雷削除
				DeleteEventMine_(g_mineCircle06);
				SetNumFlg_("NUM_SCENARIO_SUB_GREEN", GetFlagID_("CONST_SS_GR_CONTROL_DEVICE"));
				// 制御装置のフラグをtrueにする
				SetEventFlg_("BFG_CONTROL_DEVICE", true);
				CommPlayerTurnAroundObj(switch01);
				// デモ後復帰位置
				SetReturnDemoPosDir_(Vec3(720.168, 354.575, 1016.072), 76);
				// demo040[エースからの通信・ロック解除後]を再生
				ChangeDemo_(40);
			}
			else{
				CommPlayerTurnAroundObj(switch01);
				OpenMsgWnd_();
				ShowMsg_("DEVICE_MSG_001");
				KeyInputWait_();
				CloseMsgWnd_();
			}
		}
		else{
			CommPlayerTurnAroundObj(switch01);
			OpenMsgWnd_();
			ShowMsg_("DEVICE_MSG_001");
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}

	// ■移動装置
	local check_transfer_device = GetEventFlg_("BFG_START_UP_TRANSFER_DEVICE");	// 移動装置が起動しているかチェック
	local dont_use_transfer = GetEventFlg_("BFG_DONT_TRANSFER_GREEN_TO_CITY");	// 草原-崩落間の大陸移動装置の使用を禁止するフラグ
	if(target == g_mineCircle11){
		if(check_transfer_device == true){
			if(dont_use_transfer == false){
				// 移動装置を初めて調べた時だけ、NUMフラグを進める
				if(green_event_num == GetFlagID_("CONST_SS_GR_COMPLETE_FOOTHOLD")){
					// 地雷削除
					DeleteEventMine_(g_mineCircle11);
					// イベントフラグを進める
					SetNumFlg_("NUM_SCENARIO_MAIN", 2);													// メインフラグ
					SetNumFlg_("NUM_SCENARIO_SUB_GREEN", 0);											// 静寂の草原フラグ(30 -> 0に戻す)
					SetNumFlg_("NUM_SCENARIO_SUB_CITY",  GetFlagID_("CONST_SS_CI_CLIMB_THE_LADDER"));	// 崩落都市フラグ
					DebugPrint("NUM_SCENARIO_MAIN の値は " + main_num + " になりました。");
					// 送電施設内のモンスター制限フラグを起動
					SetEventFlg_("BFG_MACHINE_POWEROFF", true);
					// 大陸移動のデモ中にセーブポイントを挟む際に使用するフラグ
					SetEventFlg_("BFG_SAVE_POINT_FLAG", true);
					// 大陸移動装置を使って大陸移動した場合、ライドを解除するために使用するフラグ
					SetEventFlg_("BFG_RIDE_OFF_USED_TRANSFER", true);
					// 草原の大陸移動装置周辺の配置モンスターをこのイベント終了後に解禁するフラグ
					SetEventFlg_("BFG_LIMIT_DEVICE_GREEN", true);
					// 全滅復帰マップを変更(Redmine#2261全滅復帰ルールの改訂)
					SetNumFlg_("NUM_DEAD_RETURN_MAP", GetFlagID_("CONST_DEAD_RETURN_MAP_A00_00"));
					// 崩落都市へ
					SetReturnDemoMap_("A00_00"); 
					// 実験自由落下で飛んできた感を出してみる。2015/3/19（αは暫定コレで行く）
					SetReturnDemoPosDir_(Vec3(-7.588, 120.555, 3307.945), 180);
					// 大陸間移動のdemo039[新天地へ！]を再生する処理
					ChangeDemo_(39);
				}
				else{
					// 選択肢メッセージ
					OpenMsgWnd_();
					ShowMsg_("MINE_MSG_011");
					KeyInputWait_();
					if(GetQueryResult_() == QUERY_YES){
						// 大陸移動装置を使って大陸移動した場合、ライドを解除するために使用するフラグ
						SetEventFlg_("BFG_RIDE_OFF_USED_TRANSFER", true);
						CloseMsgWnd_();
						DeleteEventMine_(g_mineCircle11);
						// 崩落都市へ
						ChangeMapPosDir_("A00_00", Vec3(-4.974, 147.255,3323. 595), 180);
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
	}

	// ■ノチョーラとの出会い
	if(target == g_mineBox03_01){
		// 地雷削除
		DeleteEventMine_(g_mineBox03_01);
		// 主人公が茂みに近づく処理
		SetMotion_(player, "WAIT", 4);
		// サブフラグを進める
		SetNumFlg_("NUM_SCENARIO_SUB_GREEN", GetFlagID_("CONST_SS_GR_ENCOUT_BEFORE"));

		//最初の仲間加入に合わせてフィールドコマンド解禁
		SetEventFlg_("BFG_TACTICS_PROHIBIT", false);		//作戦（アクティブ）
		SetEventFlg_("BFG_SKILLPOINT_PROHIBIT", false);		//スキルポイント（アクティブ）
		SetEventFlg_("BFG_SAVE_PROHIBIT", false);			//セーブ（アクティブ）
		SetEventFlg_("BFG_COMMUNICATION_PROHIBIT", false);	//通信（アクティブ）
		SetEventFlg_("BFG_LIBRARY_PROHIBIT", false);		//ライブラリ（アクティブ）

		//旅の心得解禁
		SetEventFlg_("BFG_TRAVEL_INFO_SHOW_002", true);	// 旅の心得の項目解放フラグ【基本】モンスターマスター
		SetEventFlg_("BFG_TRAVEL_INFO_SHOW_004", true);	// 旅の心得の項目解放フラグ【基本】仲間モンスター
		SetEventFlg_("BFG_TRAVEL_INFO_SHOW_005", true);	// 旅の心得の項目解放フラグ【基本】パーティとスタンバイ
		SetEventFlg_("BFG_TRAVEL_INFO_SHOW_006", true);	// 旅の心得の項目解放フラグ【基本】パーティランク
		SetEventFlg_("BFG_TRAVEL_INFO_SHOW_017", true);	// 旅の心得の項目解放フラグ【メニュー】セーブ
		SetEventFlg_("BFG_TRAVEL_INFO_SHOW_019", true);	// 旅の心得の項目解放フラグ【メニュー】ライブラリ
		SetEventFlg_("BFG_TRAVEL_INFO_SHOW_021", true);	// 旅の心得の項目解放フラグ【メニュー】通信
		SetEventFlg_("BFG_TRAVEL_INFO_SHOW_022", true);	// 旅の心得の項目解放フラグ【メニュー】すれちがいバトルをはじめる
		SetEventFlg_("BFG_TRAVEL_INFO_SHOW_023", true);	// 旅の心得の項目解放フラグ【メニュー】ローカル通信をはじめる
		SetEventFlg_("BFG_TRAVEL_INFO_SHOW_024", true);	// 旅の心得の項目解放フラグ【メニュー】Wi-Fi通信ロビーに行く
		SetEventFlg_("BFG_TRAVEL_INFO_SHOW_053", true);	// 旅の心得の項目解放フラグ【仲間の育成】通信コインとの交換
		SetEventFlg_("BFG_TRAVEL_INFO_SHOW_054", true);	// 旅の心得の項目解放フラグ【通信】めざせ最強！マスターズＧＰ
		SetEventFlg_("BFG_TRAVEL_INFO_SHOW_056", true);	// 旅の心得の項目解放フラグ【通信】通信コインを集めよう！
		SetEventFlg_("BFG_TRAVEL_INFO_SHOW_063", true);	// 旅の心得の項目解放フラグ【世界観】ブレイクワールド
		SetEventFlg_("BFG_TRAVEL_INFO_SHOW_065", true);	// 旅の心得の項目解放フラグ【世界観】ノチョーラ
		SetEventFlg_("BFG_TRAVEL_INFO_SHOW_068", true);	// 旅の心得の項目解放フラグ【通信】ルール限定！チャレンジャーズGP
		
		// デモ終了後の復帰位置
		SetReturnDemoPosDir_(Vec3(861.850, 195.959, -574.483), 177);
		// Demo009[チュートリアル戦闘前の出会い]を再生
		ChangeDemo_(9);
	}

	if(main_num == 1){
		if(green_event_num == GetFlagID_("CONST_SS_GR_FIRST_INVITE")){
			if(target == g_mineBox03_04 || target == g_mineBox03_05){
				DeleteEventMine_(g_mineBox03_04);
				DeleteEventMine_(g_mineBox03_05);
				// サブフラグを進める
				SetNumFlg_("NUM_SCENARIO_SUB_GREEN", GetFlagID_("CONST_SS_GR_ENCOUTER"));
				// 敵パーティのお供体数を制御フラグ(進行度０
				SetNumFlg_("NUM_ENEMY_PARTY_STRENGTH", 0);
				// 全滅時その場復帰Bitフラグを設定
				SetEventFlg_("BFG_DEAD_KEEP_MAP", true);
				// 最初のチュートリアルのスライム登場前に配置されないようにするフラグ
				SetEventFlg_("BFG_LIMIT_TUTORIAL_GREEN_BEFORE", true);
				// demo041再生前に配置するアナライズ用のスライム２体を消す
				SetEventFlg_("BFG_LIMIT_ANALYZE_SLIME", false);
				// チュートリアル戦は起き上がらないよフラグ
				SetEventFlg_("BFG_BATTLE_GETUP_DISABLE", true);
				// スカウト失敗時に怒りを発動しないようにする
				SetEventFlg_("BFG_BATTLE_SCOUT_ANGRY_DISABLE", true);
				// モンスターを出現させる最小距離を設定
				SetMonsterGenPlayerInvasionAreaMin_(100);  // 制限を10mに設定
				DebugPrint("モンスターを出現させる最小距離を設定1");
				// デモ終了後の復帰位置
				SetReturnDemoPosDir_(Vec3(651.668, 153.869, -688.307), -138);
				// 話しかけたらすぐにフェード ＋ Demo041「戦闘チュートリアル導入」を再生
				TouchNpcChangeDemo(41);
			}
		}

		// チュートリアル戦闘を始めずに先に進めようとした場合
		if(green_event_num == GetFlagID_("CONST_SS_GR_ENCOUTER") ||
		   green_event_num == GetFlagID_("CONST_SS_GR_WIN_TUTORIAL") ||
		   green_event_num == GetFlagID_("CONST_SS_GR_NOT_INVITE_MONSTER"))
		{
			if(target == g_mineBox04_01
			|| target == g_mineBox04_07){
				// イベント地雷の移動処理
				local dir;
				switch(target){
				case g_mineBox04_01:
					dir = 100;
					break;
				case g_mineBox04_07:
					dir = -128;
					break;
				}
				if(green_event_num == GetFlagID_("CONST_SS_GR_ENCOUTER")){
					PlayerLeaveMine("NAME_NONE","DEMO_009_AFT_NOC_001", dir);
				}
				else{
					OpenMsgWnd_();
					ShowMsg_("DEMO_009_AFT_NOC_005");
					KeyInputWait_();
					ShowMsg_("DEMO_009_AFT_NOC_006");
					KeyInputWait_();
					CloseMsgWnd_();
					CommPlayerTurnMoveDirWalk(dir);
				}
			}
		}

		// ノチョーラパークによらずにボーショックの住処に行こうとした場合
		if(green_event_num >= GetFlagID_("CONST_SS_GR_INVITE_MONSTER")
		&& green_event_num <= GetFlagID_("CONST_SS_GR_HIDE_AND_SEEK")){
			if(target == g_mineBox04_08){
				// 近くに居る方のオークに止められる
				StopTalkOrc();
			}
		}

		// ノチョーラ族が捕まっているカゴに近づくと発生するイベント地雷１
		if(green_event_num == GetFlagID_("CONST_SS_GR_SNEAKING_IN_FORTRESS")){
			if(target == g_mineBox05){
				SetNumFlg_("NUM_SCENARIO_SUB_GREEN", GetFlagID_("CONST_SS_GR_COMMUNICATE_ACE"));
				// デモを呼び出す復帰後の位置
				SetReturnDemoPosDir_(Vec3(540.0, 345.0, 960.0), 112);
				// Demo017[エースからの通信・ロック解除前]が再生する処理を後で記述
				ChangeDemo_(17);
			}
		}

		// ボーショック再戦時
		if(green_event_num == GetFlagID_("CONST_SS_GR_REMATCH_BOWSHOCK")){
			if(target == g_mineBox07){
				// サブフラグをボーショック戦に変更
				SetNumFlg_("NUM_SCENARIO_SUB_GREEN", GetFlagID_("CONST_SS_GR_APPEAR_BOWSHOCK"));
				// Demo019[ボーショック再戦時]が再生する処理を後で記述
				ChangeDemo_(19);
			}
		}

		// 崖トリガー
		if(green_event_num == GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_3")){
			if(target == g_mineCircle08){
				// あばれうしどりの所持チェック( 2次DB #6750 )
				local check_flg = uCheckHighJumpMonsterKind();
				if(check_flg == false){
					// システムメッセージ表示
					OpenMsgWnd_();
					ShowMsg_("EVENT_IRREGULAR_MSG");	// 仲間に　あばれうしどりが　いないようです。
					KeyInputWait_();
					CloseMsgWnd_();
					// 引き返す
					CommPlayerTurnMoveDirWalk(5, 60);
				}
				else{
					// 崖トリガーの地雷を削除
					DeleteEventMine_(g_mineCircle08);
					SetNumFlg_("NUM_SCENARIO_SUB_GREEN", GetFlagID_("CONST_SS_GR_CLIFF"));
					// ルーラ禁止
					SetEventFlg_("BFG_PLAYERABILITY_RULER_PROHIBIT", true);
					// あばれうしどり逃がせないフラグ
					SetEventFlg_("BFG_ABARE_LET_ESCAPE_PROHIBIT", true);
					// セーブ禁止
					SetEventFlg_("BFG_SAVE_PROHIBIT", true);
					// 通信禁止
					SetEventFlg_("BFG_COMMUNICATION_PROHIBIT", true);
					// モンスター配置制限フラグを解除
					SetEventFlg_("BFG_LIMIT_CLIFF_GREEN", true);
					// 移民開始フラグをtrueにする
					SetEventFlg_("BFG_START_IMMIGRATION", true);
					// デモ後復帰位置
					SetReturnDemoPosDir_(Vec3(108.415, 240.0, -1394.394), -169.0);
					// Demo037[険しい崖を越えて]を再生
					ChangeDemo_(37);
				}
			}
		}

		if(green_event_num == GetFlagID_("CONST_SS_GR_CLIFF")){
			// 木から離れる
			if(target == g_mineBox09_b1){
				PlayerLeaveMine("NAME_TAG_KING", "DEMO_025_AFT_KNG", 110);
			}
			if(target == g_mineBox09_b2){
				PlayerLeaveMine("NAME_TAG_KING", "DEMO_025_AFT_KNG", -170);
			}
			if(target == g_mineBox09_b3){
				PlayerLeaveMine("NAME_TAG_KING", "DEMO_025_AFT_KNG", -110);
			}

			// 木を調べる
			if(target == g_mineCircle10){
				SetNumFlg_("NUM_SCENARIO_SUB_GREEN", GetFlagID_("CONST_SS_GR_START_UP_TRANSFER"));
				// 岩付近の地雷を削除(6/19ROMで岩から木に変更)
				DeleteEventMine_(g_mineCircle10);
				// 移動装置を起動させるためのイベント地雷を読込むようにする
				SetEventFlg_("BFG_START_UP_TRANSFER_DEVICE", true);
				// 移動装置を起動させるためのイベント地雷を読込むようにする
				SetEventFlg_("BFG_COMPLETE_FOOTHOLD", true);
				// ルーラ禁止を解除
				SetEventFlg_("BFG_PLAYERABILITY_RULER_PROHIBIT", false);
				// あばれうしどり逃がせないフラグを元に戻す
				SetEventFlg_("BFG_ABARE_LET_ESCAPE_PROHIBIT", false);
				// セーブ禁止を解除
				SetEventFlg_("BFG_SAVE_PROHIBIT", false);
				// 通信禁止を解除
				SetEventFlg_("BFG_COMMUNICATION_PROHIBIT", false);
				// デモ後復帰位置
				SetReturnDemoPosDir_(Vec3(-13.024, 250.200, -1745.892), -118);
				// Demo038[足場完成]を再生する
				ChangeDemo_(38);
			}
		}

		// 移動装置にたむろっているノチョーラに近づく
		if(green_event_num == GetFlagID_("CONST_SS_GR_START_UP_TRANSFER")){
			if(target == g_mineBox12
			|| target == g_mineBox12_b
			|| target == g_mineBox12_c){
				SetNumFlg_("NUM_SCENARIO_SUB_GREEN", GetFlagID_("CONST_SS_GR_COMPLETE_FOOTHOLD"));
				// 地雷を削除
				DeleteEventMine_(g_mineBox12);
				DeleteEventMine_(g_mineBox12_b);
				DeleteEventMine_(g_mineBox12_c);
				// デモ後復帰位置(仮)
				SetReturnDemoPosDir_(Vec3(-489.778, 383.121, -1783.760), -79.0);
				// Demo047[移動装置の起動]を再生する
				ChangeDemo_(47); // 仮
			}
		}
	}

//---------------------------------------------------------------------
	//--------------------------------
	// ▼空間の遊びイベント用地雷
	//--------------------------------
	// 遺跡スイッチを調べた時の処理
	if(target == g_keyhole_mine){
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
	}
	
	// ゴールモンスターに近づいた時の処理
	if(target == g_keyhole_goal_mine){
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

//=================================================================
// 自作関数：所持モンスターから、あばれうしどりがいるかチェック  
//-----------------------------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//=================================================================
function CheckAllMonsterKind(){

	DebugPrint(" ");
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

//=================================================================
// 自作関数：メッセージの表示関数(名前表示あり)
//-----------------------------------------------------------------
// 第一引数：表示するメッセージ（メッセージキー）
// 第二引数：ネームタグ
// 戻り値  ：なし
//=================================================================
function CommonMessageT(message_key, name_tag){
	OpenMsgWnd_();
	SetTalkName_(name_tag);
	ShowMsg_(message_key);
	KeyInputWait_();
	CloseMsgWnd_();
}

//=================================================================
// 自作関数：プレイヤーがイベント地雷から離れる
//-----------------------------------------------------------------
// 第一引数：ネームタグ
// 第二引数：表示するメッセージ（メッセージキー）
// 第三引数：向き（度数）
// 戻り値  ：なし
//=================================================================
function PlayerLeaveMine(name_tag, message_key, dir){
	local player = GetPlayerId_();
	OpenMsgWnd_();
	SetTalkName_(name_tag);
	ShowMsg_(message_key);
	KeyInputWait_();
	CloseMsgWnd_();
	CommPlayerTurnMoveDirWalk(dir);
}

//======================================================
// 自作関数：リアクター起動イベント
//------------------------------------------------------
// 引数  ：なし
// 戻り値：なし
//======================================================
function ReactorOnEvent()
{
	// NUMフラグの変更
	SetNumFlg_("NUM_SCENARIO_MAIN", GetFlagID_("CONST_SM_GRASSLAND"));
	SetNumFlg_("NUM_SCENARIO_SUB_OP", 0);
	SetNumFlg_("NUM_SCENARIO_SUB_GREEN", 0);

	// BITフラグの変更
	SetEventFlg_("BFG_TRAVEL_INFO_SHOW_037", true);	// 旅の心得の項目解放フラグ	【フィールド】リアクター
	SetEventFlg_("BFG_TRAVEL_INFO_SHOW_040", true);	// 旅の心得の項目解放フラグ	【フィールド】目的地アイコン
	SetEventFlg_("BFG_REACTOR_ON", true);			// リアクターの起動フラグ(草原の洞窟のマップ表示で使用)

	// 演出開始
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);
	SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, 30);
	WaitFade_();
	
	// 定数
	local ZOOM_FRAME = 5;
	
	//=============================================
	// カメラ高速ズーム
	//=============================================
	// 今のカメラの座標
	local beforeEye = GetCameraEye_();
	local beforeTgt = GetCameraTarget_();
	
	// 一人称視点の座標
	local personEye = GetFirstPersonCameraEye_();
	local personTgt = GetFirstPersonCameraTarget_();
	SetLinearCameraEye_(personEye, ZOOM_FRAME);
	SetLinearCameraTarget_(personTgt, ZOOM_FRAME);
	// プレイヤーが映るので消す
	local player = GetPlayerId_();
	SetActive_(player, false);
	Wait_(ZOOM_FRAME);
	
	//=============================================
	// カメラ初期位置移動
	// リアクターレイアウト起動
	//=============================================
	LoadLayout_("reactor_frame");
	SetLayoutAnime_("reactor_on", false);
	PlaySE_("SE_FLD_231");						// リアクター起動音
	WaitLayoutAnime();
	
	//=============================================
	// リアクターレイアウト 通常に設定
	// ■リアクターメッセージ
	//=============================================
	SetLayoutAnime_("reactor_loop", true);
	
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MYSTERYMACHINE");
	ShowMsg_("REC_ON_SYSTEM_WELCOME");			// 「あなたの冒険を 完全確実に サポートする
	KeyInputWait_();
	
	SetTalkName_("NAME_TAG_REACTOR");
	ShowMsg_("REC_ON_SYSTEM_INTRO");			// 「当装置は レジスタンス支援用に作られた
	KeyInputWait_();
	CloseMsgWnd_();

	//=============================================
	// リアクター起動ボタン表示
	//=============================================
	Wait_(15);
	SetEventFlg_("BFG_NAVIMAP_REACTOR_CONTROL_UNLOCK", true);
	Wait_(15);

	//=============================================
	// ■リアクターメッセージ
	// 下画面のナビマップを解放
	//=============================================
	PlaySE_("SE_FLD_234");							// スキャン（仮）音
	Wait_(47);
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_REACTOR");
	ShowMsg_("REC_ON_SYSTEM_ACT");					// 「……付近に 集落らしき 反応を 確認。
	KeyInputWait_();
	CloseMsgWnd_();
	
	Wait_(30);
	SetEventFlg_("BFG_NAVIMAP_REACTOR_PLAYER_UNLOCK", true);	// プレイヤーアイコン表示
	SetEventFlg_("BFG_NAVIMAP_REACTOR_MAP_UNLOCK", true);		// ナビマップ目隠しオープン
	Wait_(30);
	
	//=============================================
	// ウッドパークへフォーカス移動
	// ウッドパークにターゲットアイコン表示
	//=============================================
	FocusIcon_(NAVIMAP_ICON.DESTINATION);
	WaitIsScrollNaviMap();
	SetNaviMapIconVisible_(mapNavi01, true);
	Wait_(60);
	
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_REACTOR");
	ShowMsg_("REC_ON_SYSTEM_RENEWAL");				// 「冒険中　道に迷うことが　あったら
	KeyInputWait_();
	CloseMsgWnd_();
	
	FocusCancel_();	// 元の位置に戻す
	WaitIsScrollNaviMap();
	
	Wait_(30);
	
	//=============================================
	// リアクターレイアウト 終了に設定
	//=============================================
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_REACTOR");
	ShowMsg_("REC_ON_SYSTEM_END");				// 「また　下画面　右下を　タッチすると
	KeyInputWait_();
	ShowMsg_("REC_ON_SYSTEM_EXPLAIN");			// 「本機の 各機能を 使用する際は
	KeyInputWait_();
	CloseMsgWnd_();
	
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

//======================================================
// 自作関数：ナビマップスクロール待ち
//------------------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//======================================================
function WaitIsScrollNaviMap()
{
	while(IsScrollNaviMap_()){
		Wait_(1);
	}
}

//======================================================
// 自作関数：地雷で近場のオークに止められる処理
//------------------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//======================================================
function StopTalkOrc()
{
	local player = GetPlayerId_();
	local playerPos = GetPos_(player);
	local near = GetPlayerNearObj_();
	
	local PLAYER_BACK_POS = Vec3(-583.15, 190.50, 582.30);
	local ORC_ROT_DIR = 2.9;
	local MOTION_BLEND_FRAME = 4;
	local PLAYER_FRONT_MOVE_SPEED = 1.0;
	local PLAYER_BACK_DIR = 148;
	
	if(near == npc_ORC_A || near == npc_ORC_B){
		// 発見エフェクトをオークに表示
		LoadEffect_("ef300_20_target_icon");
		SetBoneEffect_("ef300_20_target_icon", near);
		PlaySE_("SE_DEM_053");
		Wait_(15);
		
		// オークをプレイヤーの方に向かせる< 備忘録 : Task_RotateToPos_()した後,WaitTask()しないと回転しないので注意 >
		SetMotion_(near, "WALK", MOTION_BLEND_FRAME);
		local rotateTask = Task_RotateToPos_(near, playerPos, ORC_ROT_DIR);
		WaitTask(rotateTask);
		SetMotion_(near, "WAIT", MOTION_BLEND_FRAME);
		
		// オークのメッセージ表示
		OpenMsgWnd_();
		SetTalkName_("NAME_NONE");
		if(near == npc_ORC_A){
			ShowMsg_("DEMO_010_AFT_ORC_001");
		} else {
			ShowMsg_("DEMO_010_AFT_ORC_002");
		}
		KeyInputWait_();
		CloseMsgWnd_();
		
		// オークも正面に向き直る
		SetMotion_(near, "WALK", MOTION_BLEND_FRAME);
		// オークによって向き直る座標が違う
		local frondPos = ORCA_FRONT_POS;
		if(near == npc_ORC_B){
			frondPos = ORCB_FRONT_POS;
		}
		local rotateFrontTask = Task_RotateToPos_(near, frondPos, ORC_ROT_DIR);
		
		// オークを待機モーションに戻す
		WaitTask(rotateFrontTask);
		SetMotion_(near, "WAIT", MOTION_BLEND_FRAME);
		
		// プレイヤーバックして移動
		CommPlayerTurnMoveDirWalk(PLAYER_BACK_DIR);
	}
}

//======================================================
// 自作関数：名前付け画面を呼び出す
//------------------------------------------------------
// 引数    ：なし
// 戻り値  ：なし
//======================================================
function uTaskNamedWindow()
{
	local mons_param = 0;
	// 初期仲間モンスターの取得
	switch(GetNumFlg_("NUM_CHANGE_FIRST_MONSTER"))
	{
	case PURIZUNYAN:	
		mons_param = 1203;		// パラメータＩＤ:プリズニャン
		break;
	case FONDHU:
		mons_param = 1202;		// パラメータＩＤ:フォンデュ
		break;
	case DORAKI:
		mons_param = 1201;		// パラメータＩＤ:ドラキー
		break;
	case NASUBINARA:
		mons_param = 1204;		// パラメータＩＤ:ナスビナーラ
		break;
	}

	// 背景を設定
	// プレイヤーが映るので消す
	local player = GetPlayerId_();
	SetActive_(player, false);

	// 名前付け画面へ移行
	local tsk_named_wnd = Task_AddFellow_(mons_param, false);
	WaitTask(tsk_named_wnd);

	// 名前付けが終わったら一旦フェードアウト→プレイヤーを表示する処理
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
	SetActive_(player, true);
}

//======================================================
// 共通関数：表シナリオクリア時のセーブ処理
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
		// フェードイン前に下画面をフェードアウトさせる
		SetNavimapVisible_(true);
		SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
		WaitFadeSub_();
	}
}

//======================================================
// 共通関数：全滅復帰の擬似デモ1[戦闘チュートリアル終了～ジャックを見つける]
//------------------------------------------------------
// 第一引数：なし
// 戻り値  ：なし
//======================================================
function uDeadReturnDemo1()
{
// フェードアウト
	CommChangeMomentFadeOut(FADE_COLOR_BLACK);
// 準備
	// 主人公の位置
	local player_pos = Vec3(501.006, 117.891, -636.878);
	local player_dir = -160;
	// 擬似デモ後の復帰位置
	local player_rtn_pos = Vec3(501.006, 117.891, -636.878);
	local player_rtn_dir = -90;
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
	// フェードイン
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	Wait_(FADE_DEF);
	// メッセージ表示
	OpenMsgWnd_();
	ShowMsg_("DEAD_RETURN_MSG_01");
	KeyInputWait_();
	CloseMsgWnd_();
	// ノチョリン(会話モーション→待機モーション)
	SetMotion_(dead_npc, "WAIT", BLEND_L);
	Wait_(wait_speed_def);
	// 回復処理＋共通メッセージ表示
	RecoveryAndMsg();
	Wait_(wait_speed);
	// フェードアウト
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, wait_speed);
	SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, wait_speed);
	Wait_(20);
	WaitFade_();
	// マップチェンジ
	ChangeMapPosDir_("H00_00", player_rtn_pos, player_rtn_dir);
}

//======================================================
// 共通関数：全滅復帰の擬似デモ2[キング救出～ウッドパークに戻る]
//------------------------------------------------------
// 第一引数：なし
// 戻り値  ：なし
//======================================================
function uDeadReturnDemo2()
{
// フェードアウト
	CommChangeMomentFadeOut(FADE_COLOR_BLACK);
// 準備
	// 主人公の位置
	local player_pos = Vec3(-355.779, 145.218, -589.044);
	local player_dir = -90;
	// 擬似デモ後の復帰位置
	local player_rtn_pos = Vec3(-355.779, 145.218, -589.044);
	local player_rtn_dir = -108;
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
	// フェードイン
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	Wait_(FADE_DEF);
	// メッセージ表示
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_NOCHORIN");
	ShowMsg_("DEAD_RETURN_MSG_02");
	KeyInputWait_();
	CloseMsgWnd_();
	// アロマ(会話モーション→待機モーション)
	SetMotion_(dead_npc, "WAIT", BLEND_L);
	Wait_(wait_speed);
	// 回復処理＋共通メッセージ表示
	RecoveryAndMsg();
	// フェードアウト
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, wait_speed);
	SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, wait_speed);
	Wait_(20);
	WaitFade_();
	// マップチェンジ
	ChangeMapPosDir_("H00_00", player_rtn_pos, player_rtn_dir);
}

//======================================================
// 共通関数： 手持ちにあばれうしどりがいるか判定する
//------------------------------------------------------
// 第一引数：なし
// 戻り値  ：いる → true / いない → false
//======================================================
function uCheckHighJumpMonsterKind()
{
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

