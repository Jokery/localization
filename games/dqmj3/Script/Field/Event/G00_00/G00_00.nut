//===================== G00_00歓楽の霊道 ====================
//---------------------------------
// ▼空間の遊びで使用する定数
//---------------------------------
// ギミックの起動とクリアフラグ
const GIMMICK_FLG			 = "BFG_SPACE_GIMMICK_GRAVE";
const GIMMICK_CLEAR_FLG		 = "BFG_SPACE_GIMMICK_GRAVE_1ST_CLEAR";

// 主人公の復帰位置と向き
const XPOS_1				 = -133.978;	// 遺跡スイッチ付近
const YPOS_1				 = 1002.629;
const ZPOS_1				 = -886.804;
const DIR_1					 = 65;

const XPOS_2				 = 1919.0;		// ゴールボスの手前
const YPOS_2				 = 1171.0;
const ZPOS_2				 = 213.0;
const DIR_2					 = 145;

// 擬似デモで使用するカメラのノード名
const CAMERA_EYE			 = "cameye_004";
const CAMERA_TGT			 = "camtgt_004";

// 遺跡スイッチを起動させる為の鍵ID
const GIMMICK_KEY_ID		 = 903;

// 遺跡スイッチを起動させた時のメッセージID
const GIMMICK_MSG_ID		 = "MASTERS_LOAD_REACTOR_MSG_015";

// 遺跡スイッチ起動後の再生デモナンバー
const DEMO_NUM				 = 222;

// ボスモンスターのID (1=初回, 2=2回目以降)
const BOSS_ID_1				 = "m181_00";	// レジマリン
const BOSS_ID_2				 = "m181_00";	// レジマリン

// ボスモンスターのExchange用ID
const BOSS_EXCHANGE_ID		 = 486;			// レジマリン

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
const BOSS_PARTY_TABLE_1	 = 157;
const BOSS_PARTY_TABLE_2	 = 157;

// ボスを仲間にする際のモンスターパラメータ (1=初回, 2=2回目以降)
const BOSS_PARAMETER_1		 = 1805;
const BOSS_PARAMETER_2		 = 1805;

// ボス仲間後のマップチェンジID
const MAP_ID				 = "G00_00";


//------------------------------------------------
//		戦闘終了後
//------------------------------------------------
function AfterBattle()
{
	// フラグの状態を取得
	local main_num  = GetNumFlg_("NUM_SCENARIO_MAIN");
	local grave_num = GetNumFlg_("NUM_SCENARIO_SUB_GRAVE");
	//ブンドルドの手下と戦ったか
	local bit_figth_key_npc_a = GetEventFlg_("BFG_BATTLE_BUNDORUDO_RETAINER_A");
	local bit_figth_key_npc_b = GetEventFlg_("BFG_BATTLE_BUNDORUDO_RETAINER_B");
	local bit_figth_key_npc_c = GetEventFlg_("BFG_BATTLE_BUNDORUDO_RETAINER_C");

	// ブンドルドの手下に負けた時にフラグを変更する処理（要注意）
	// イベントブロックのEventStartOperate()では敗北を判定できないので
	// ここで敗北の判定とフラグ変更を行う。
	if(main_num == GetFlagID_("CONST_SM_CEMETERY")){				// Num0 = 3
		if(grave_num == GetFlagID_("CONST_SS_CC_FIND_THE_GHOST")){	// Num4 = 2
			if(bit_figth_key_npc_a == true){
				// ■ブンドルドの手下Aに敗北
				if(GetBattleEndType_() == END_TYPE_LOSE){
					//ブンドルドの手下Aと戦う前のフラグに戻す
					SetEventFlg_("BFG_BATTLE_BUNDORUDO_RETAINER_A", false);
					// 全滅したらプレイヤーの非表示を解除
					local player = GetPlayerId_();
					SetVisible(player, true);
				}
			}
			if(bit_figth_key_npc_b == true){
				// ■ブンドルドの手下Bに敗北
				if(GetBattleEndType_() == END_TYPE_LOSE){
					//ブンドルドの手下Bと戦う前のフラグに戻す
					SetEventFlg_("BFG_BATTLE_BUNDORUDO_RETAINER_B", false);
					// 全滅したらプレイヤーの非表示を解除
					local player = GetPlayerId_();
					SetVisible(player, true);
				}
			}
			if(bit_figth_key_npc_c == true){
				// ■ブンドルドの手下Cに敗北
				if(GetBattleEndType_() == END_TYPE_LOSE){
					//ブンドルドの手下Cと戦う前のフラグに戻す
					SetEventFlg_("BFG_BATTLE_BUNDORUDO_RETAINER_C", false);
					// 全滅したらプレイヤーの非表示を解除
					local player = GetPlayerId_();
					SetVisible(player, true);
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
	local grave_num  = GetNumFlg_("NUM_SCENARIO_SUB_GRAVE");					// Num4
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
	
	
	EventEnd_();
}


//------------------------------------------------
//		フェードイン
//------------------------------------------------
function FadeIn()
{
	// マップ到達フラグ
	SetEventFlg_("BFG_ARRIVE_AT_G00", true);
	// セーブ禁止を解除(セーブ禁止マップから帰ってきた時用)
	SetEventFlg_("BFG_SAVE_PROHIBIT", false);		// セーブ禁止(Bit451)

	// フラグの状態を取得
	local main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");				// Num0
	local grave_num	 = GetNumFlg_("NUM_SCENARIO_SUB_GRAVE");		// Num4
	local ice_num	 = GetNumFlg_("NUM_SCENARIO_SUB_ICE");			// Num5
	local check_dead = GetEventFlg_("BFG_DEAD_RETURN");
	local mantan_flg = GetEventFlg_("BFG_EXAMINE_FULLTANK_STELE");
	local first_demo = GetEventFlg_("BFG_PLAYED_GRAVE_SCENE_DEMO");	//全景デモを見たかどうか
	
	// カギ入手フラグ
	local bit_key1 = GetEventFlg_("BFG_GET_GATE_KEY_1ST");
	local bit_key2 = GetEventFlg_("BFG_GET_GATE_KEY_2ND");
	local bit_key3 = GetEventFlg_("BFG_GET_GATE_KEY_3RD");
	
	// 門が開いたフラグ
	local bit_door_open1 = GetEventFlg_("BFG_OPEN_GATE_1ST");
	local bit_door_open2 = GetEventFlg_("BFG_OPEN_GATE_2ND");
	local bit_door_open3 = GetEventFlg_("BFG_OPEN_GATE_3RD");
	
	// 暗証番号の扉が開いたフラグ
	local bit_lock_door_open = GetEventFlg_("BFG_OPEN_PASSWORD_DOOR");
	
	// 時間の設定
	if(main_num == GetFlagID_("CONST_SM_CEMETERY")){					// Num0 = 3
		if(grave_num <= GetFlagID_("CONST_SS_CC_GET_RACE_PROGRAM")){	// Num4 = 17
			// シナリオ進行中は夜（瘴気）に設定
			SetTime_(8700);
		}
	}
	
	// 環境音の再生
	if(main_num == GetFlagID_("CONST_SM_CEMETERY")){				// Num0 = 3
		if(first_demo == false){									// 全景デモをまだ見ていない場合
			SetEventFlg_("BFG_G00_00_ENVIRONMENT_BGM_PLAY", true);	// 環境音を再生する
		}
	}
	// 氷原シナリオ以降
	else if(main_num >= GetFlagID_("CONST_SM_ICE_FIELD")){			// Num0 = 4
		// 環境音とマップBGMの再生フラグをOFFにする
		SetEventFlg_("BFG_G00_00_ENVIRONMENT_BGM_PLAY", false);
		SetEventFlg_("BFG_G00_00_EVENT_BGM012_PLAY", false);
	}
	
	DebugPrint(" ");
	DebugPrint("NUM_SCENARIO_MAIN の値は " + main_num + " になりました。");

	//---------------
	// ▼ギミック配置
	//---------------
	// ID初期化
	g_lock_door		 <- C_NONE_ID;
	g_key_door_01	 <- C_NONE_ID;
	g_key_door_02	 <- C_NONE_ID;
	g_key_door_03	 <- C_NONE_ID;
	g_transfer01	 <- C_NONE_ID;
	g_transfer02	 <- C_NONE_ID;
	g_rulerpoint01	 <- C_NONE_ID;
	g_rulerpoint02	 <- C_NONE_ID;
	g_keyhole		 <- C_NONE_ID;
	
	// リソース読み込み
	local id_transfer		 = ReadGimmick_("o_com_01");	// 転送装置
	local id_rulerpoint01	 = ReadGimmick_("o_com_08");	// ルーラポイント
	
	// ■アンデッドガーデンの門①
	if(bit_door_open1 == false){
		local id_door_red = ReadGimmick_("o_G00_00");		// アンデッドガーデンの扉(赤)
		g_key_door_01 = ArrangePointGimmick_("o_G00_00", id_door_red, "g_key_door01");
	}

	// ■アンデッドガーデンの門②
	if(bit_door_open2 == false){
		local id_door_green = ReadGimmick_("o_G00_01");		// アンデッドガーデンの扉(緑)
		g_key_door_02 = ArrangePointGimmick_("o_G00_01", id_door_green, "g_key_door02");
	}

	// ■アンデッドガーデンの門③
	if(bit_door_open3 == false){
		local id_door_brue = ReadGimmick_("o_G00_02");		// アンデッドガーデンの扉(青)
		g_key_door_03 = ArrangePointGimmick_("o_G00_02", id_door_brue, "g_key_door03");
	}

	// ■暗証番号の扉
	if(bit_lock_door_open == false){
		local id_door_pass = ReadGimmick_("o_G00_03");		// 暗証番号の扉
		g_lock_door = ArrangePointGimmick_("o_G00_03", id_door_pass, "g_door");
	}

	// ■転送装置(崩落都市行)
	g_transfer01 = ArrangePointGimmick_("o_com_01", id_transfer, "g_transfer01");

	// ■転送装置(凍骨の氷原行)
	g_transfer02 = ArrangePointGimmick_("o_com_01", id_transfer, "g_transfer02");

	// ■ルーラポイント(アンデッドガーデン入口)
	g_rulerpoint01 = ArrangePointGimmick_("o_com_08", id_rulerpoint01, "g_rulerpoint01");
	SetMotion_(g_rulerpoint01, "GIMMICK_0", 0);
	if(GetEventFlg_("BFG_RULER_ADD_009") == true){
		SetMotion_(g_rulerpoint01, "GIMMICK_2", 0);
	}

	// ■ルーラポイント(中央広場)
	g_rulerpoint02 = ArrangePointGimmick_("o_com_08", id_rulerpoint01, "g_rulerpoint02");
	SetMotion_(g_rulerpoint02, "GIMMICK_0", 0);
	if(GetEventFlg_("BFG_RULER_ADD_031") == true){
		SetMotion_(g_rulerpoint02, "GIMMICK_2", 0);
	}
	
	
	//----------
	// ▼NPC配置
	//----------
	// ID初期化
	g_gost_npc_a	 <- C_NONE_ID;
	g_gost_npc_b	 <- C_NONE_ID;
	g_gost_npc_c	 <- C_NONE_ID;
	g_gost_npc_h	 <- C_NONE_ID;
	g_key_npc_a		 <- C_NONE_ID;
	g_key_npc_a_sub	 <- C_NONE_ID;
	g_key_npc_b_sub	 <- C_NONE_ID;
	g_key_npc_c_sub	 <- C_NONE_ID;
	g_key_npc_b		 <- C_NONE_ID;
	g_key_npc_c		 <- C_NONE_ID;
	g_keyhole_npc	 <- C_NONE_ID;

	// NPCの配置
	// ■モンスターの幽霊Ａ
	if(main_num == GetFlagID_("CONST_SM_CEMETERY")){						// Num0 = 3
		if(grave_num == GetFlagID_("CONST_SS_CC_GET_RACE_PROGRAM")){		// Num4 = 17
			local id_npc_gost  = ReadNpc_("m100_01");						// リソース読み込み
			g_gost_npc_a  = ArrangePointNpc_(id_npc_gost,  "NPC_06");		// モンスターの幽霊A
			SetTalkEnable_(g_gost_npc_a, false);							// 会話アイコン非表示
			SetScaleSilhouette(g_gost_npc_a, SCALE.S, SILHOUETTE_WIDTH.S);
			SetReactorMsg_(g_gost_npc_a, "GRAVE_NPC_GOST_REC");
		}
		if(grave_num == GetFlagID_("CONST_SS_CC_CLEAR_CEMETERY")){			// Num4 = 18
			local id_npc_gost  = ReadNpc_("m100_01");						// リソース読み込み
			g_gost_npc_a  = ArrangePointNpc_(id_npc_gost,  "NPC_06");		// モンスターの幽霊A
			SetScaleSilhouette(g_gost_npc_a, SCALE.S, SILHOUETTE_WIDTH.S);
			SetReactorMsg_(g_gost_npc_a, "GRAVE_NPC_GOST_REC");
		}
	}
	// 氷原シナリオ以降
	else if(main_num >= GetFlagID_("CONST_SM_ICE_FIELD")){					// Num0 = 4 以上
		local id_npc_gost  = ReadNpc_("m100_01");							// リソース読み込み
		g_gost_npc_a  = ArrangePointNpc_(id_npc_gost,  "NPC_06");			// モンスターの幽霊A
		SetScaleSilhouette(g_gost_npc_a, SCALE.S, SILHOUETTE_WIDTH.S);
		SetReactorMsg_(g_gost_npc_a, "GRAVE_NPC_GOST_REC");
	}
	
	// ■モンスターの幽霊Ｂ－Ｃ－Ｈ
	if(main_num == GetFlagID_("CONST_SM_CEMETERY")){						// Num0 = 3
		if(grave_num >= GetFlagID_("CONST_SS_CC_FIND_THE_GHOST")){			// Num4 = 2
			local id_npc_gost  = ReadNpc_("m100_01");						// リソース読み込み
			g_gost_npc_b  = ArrangePointNpc_(id_npc_gost,  "NPC_04");		// モンスターの幽霊Ｂ
			SetSearchableAngle_(g_gost_npc_b, SEARCHABLE_ANGLE_WIDE);		// 会話可能角度を設定
			SetScaleSilhouette(g_gost_npc_b, SCALE.S, SILHOUETTE_WIDTH.S);
			SetReactorMsg_(g_gost_npc_b, "GRAVE_NPC_GOST_REC");
			
			g_gost_npc_c  = ArrangePointNpc_(id_npc_gost,  "NPC_05");		// モンスターの幽霊Ｃ
			SetScaleSilhouette(g_gost_npc_c, SCALE.S, SILHOUETTE_WIDTH.S);
			SetReactorMsg_(g_gost_npc_c, "GRAVE_NPC_GOST_REC");
			
			g_gost_npc_h  = ArrangePointNpc_(id_npc_gost,  "NPC_07");		// モンスターの幽霊Ｈ
			SetScaleSilhouette(g_gost_npc_h, SCALE.S, SILHOUETTE_WIDTH.S);
			SetReactorMsg_(g_gost_npc_h, "GRAVE_NPC_GOST_REC");
		}
	}
	else if(main_num >= 4){
		local id_npc_gost  = ReadNpc_("m100_01");							// リソース読み込み
		g_gost_npc_b  = ArrangePointNpc_(id_npc_gost,  "NPC_04");			// モンスターの幽霊Ｂ
		SetSearchableAngle_(g_gost_npc_b, SEARCHABLE_ANGLE_WIDE);			// 会話可能角度を設定
		SetScaleSilhouette(g_gost_npc_b, SCALE.S, SILHOUETTE_WIDTH.S);
		SetReactorMsg_(g_gost_npc_b, "GRAVE_NPC_GOST_REC");
		
		g_gost_npc_c  = ArrangePointNpc_(id_npc_gost,  "NPC_05");			// モンスターの幽霊Ｃ
		SetScaleSilhouette(g_gost_npc_c, SCALE.S, SILHOUETTE_WIDTH.S);
		SetReactorMsg_(g_gost_npc_c, "GRAVE_NPC_GOST_REC");
			
		g_gost_npc_h  = ArrangePointNpc_(id_npc_gost,  "NPC_07");			// モンスターの幽霊Ｈ
		SetScaleSilhouette(g_gost_npc_h, SCALE.S, SILHOUETTE_WIDTH.S);
		SetReactorMsg_(g_gost_npc_h, "GRAVE_NPC_GOST_REC");
	}

	// ■ブンドルドの手下Ａ－Ｃ
	if(main_num == GetFlagID_("CONST_SM_CEMETERY")){						// Num0 = 3
		if(grave_num == GetFlagID_("CONST_SS_CC_FIND_THE_GHOST")){			// Num4 = 2
			// 手下Ａ(ほねコウモリ)
			if(bit_key1 == false){
				local id_key_npc_a = ReadNpc_("m097_02");					// リソース読み込み
				g_key_npc_a  = ArrangePointNpc_(id_key_npc_a,  "NPC_01");	// ブンドルドの手下A
				SetTalkTurn_(g_key_npc_a, false);							// 話しかけても振り向かない
				SetSearchableAngle_(g_key_npc_a, SEARCHABLE_ANGLE_WIDE);	// 会話可能角度を設定
				SetScaleSilhouette(g_key_npc_a, SCALE.N, SILHOUETTE_WIDTH.N);
				SetReactorMsg_(g_key_npc_a, "GRAVE_NPC_A_REC");
				
				g_key_npc_a_sub  = ArrangePointNpc_(id_key_npc_a,  "NPC_01");// ブンドルドの手下A(サブ)
				SetScaleSilhouette(g_key_npc_a_sub, SCALE.N, SILHOUETTE_WIDTH.N);
				SetVisible(g_key_npc_a_sub, false);
				
				// マップナビに「!」表示
				g_map_navi_enemy_01 <- ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "NPC_01");
			}
			// 手下Ｂ(チャームバット)
			if(bit_key2 == false){
				local id_key_npc_b = ReadNpc_("m097_01");					// リソース読み込み
				g_key_npc_b  = ArrangePointNpc_(id_key_npc_b,  "NPC_02");	// ブンドルドの手下B
				SetTalkTurn_(g_key_npc_b, false);							// 話しかけても振り向かない
				SetSearchableAngle_(g_key_npc_b, SEARCHABLE_ANGLE_WIDE);	// 会話可能角度を設定
				SetScaleSilhouette(g_key_npc_b, SCALE.N, SILHOUETTE_WIDTH.N);
				SetReactorMsg_(g_key_npc_b, "GRAVE_NPC_B_REC");
				
				g_key_npc_b_sub  = ArrangePointNpc_(id_key_npc_b,  "NPC_02");// ブンドルドの手下B(サブ)
				SetScaleSilhouette(g_key_npc_b_sub, SCALE.N, SILHOUETTE_WIDTH.N);
				SetVisible(g_key_npc_b_sub, false);
				
				// マップナビに「!」表示
				g_map_navi_enemy_02 <- ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "NPC_02");
			}
			// 手下Ｃ(コープスフライ)
			if(bit_key3 == false){
				local id_key_npc_c = ReadNpc_("m097_03");					// リソース読み込み
				g_key_npc_c  = ArrangePointNpc_(id_key_npc_c,  "NPC_03");	// ブンドルドの手下C
				SetTalkTurn_(g_key_npc_c, false);							// 話しかけても振り向かない
				SetSearchableAngle_(g_key_npc_c, SEARCHABLE_ANGLE_WIDE);	// 会話可能角度を設定
				SetScaleSilhouette(g_key_npc_c, SCALE.N, SILHOUETTE_WIDTH.N);
				SetReactorMsg_(g_key_npc_c, "GRAVE_NPC_C_REC");
				
				g_key_npc_c_sub  = ArrangePointNpc_(id_key_npc_c,  "NPC_03");// ブンドルドの手下B(サブ)
				SetScaleSilhouette(g_key_npc_c_sub, SCALE.N, SILHOUETTE_WIDTH.N);
				SetVisible(g_key_npc_c_sub, false);
				
				// マップナビに「!」表示
				g_map_navi_enemy_03 <- ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "NPC_03");
			}
		}
	}
	
	//-----------
	// ▼地雷配置
	//-----------
	// ID初期化
	g_mine_transfer01	<- C_NONE_ID;
	g_mine_transfer02	<- C_NONE_ID;
	g_mine_key_door_01	<- C_NONE_ID;
	g_mine_key_door_02	<- C_NONE_ID;
	g_mine_key_door_03	<- C_NONE_ID;
	g_mine_01			<- C_NONE_ID;
	g_mine_01_b			<- C_NONE_ID;
	g_mine_01_c			<- C_NONE_ID;
	g_mine_lock_door	<- C_NONE_ID;
	g_mine_ruler_01		<- C_NONE_ID;
	g_mine_ruler_02		<- C_NONE_ID;
	g_mine_mantan		<- C_NONE_ID;
	g_mine_keyhole		<- C_NONE_ID;
	g_mine_keyhole_npc 	<- C_NONE_ID;
	
	// ■大陸移動装置(崩落都市行)
	g_mine_transfer01 = SetPointCircleEventMine_("mine_transfer01", true);

	// ■大陸移動装置(凍骨の氷原行)
	g_mine_transfer02 = SetPointCircleEventMine_("mine_transfer02", true);

	// ■ルーラポイント(アンデッドガーデン入口)
	g_mine_ruler_01 = SetPointCircleEventMine_("mine_ruler_01", true);

	// ■ルーラポイント(中央広場)
	g_mine_ruler_02 = SetPointCircleEventMine_("mine_ruler_02", true);

	// ■「まんたん」の石碑
	if(mantan_flg == false){
		g_mine_mantan = SetPointCircleEventMine_("mine_mantan", true);
	}

	if(main_num == GetFlagID_("CONST_SM_CEMETERY")){						// Num0 = 3
		// ■アンデッドガーデンの門①
		if(bit_door_open1 == false){
			g_mine_key_door_01 = SetPointCircleEventMine_("mine_key_door01", true);
		}
		// ■アンデッドガーデンの門②
		else if(bit_door_open2 == false){
			g_mine_key_door_02 = SetPointCircleEventMine_("mine_key_door02", true);
		}
		// ■アンデッドガーデンの門③
		else if(bit_door_open3 == false){
			g_mine_key_door_03 = SetPointCircleEventMine_("mine_key_door03", true);
		}
		// ■移動装置付近で待っているモンスターの幽霊Ａ
		if(grave_num == GetFlagID_("CONST_SS_CC_GET_RACE_PROGRAM")){		// Num4 = 17
			g_mine_01   = SetPointBoxEventMine_("mine01", false);
			g_mine_01_b = SetPointBoxEventMine_("mine01_b", false);
			g_mine_01_c = SetPointBoxEventMine_("mine01_c", false);
		}
		// ■暗証番号の扉
		if(bit_lock_door_open == false){
			if(grave_num <= GetFlagID_("CONST_SS_CC_GET_RACE_PROGRAM")){	// Num4 = 17
				g_mine_lock_door = SetPointCircleEventMine_("mine_lock_door", true);
			}
		}
	}
	
	
	//-------------------------
	// ▼リアクターポイント配置
	//-------------------------
	// ID初期化
	g_reactorPoint14	<- C_NONE_ID;
	g_reactorPoint16	<- C_NONE_ID;
	g_reactorPoint17	<- C_NONE_ID;
	g_reactorPoint18	<- C_NONE_ID;

	// ■移動装置（崩落都市行）
	local reactorPoint01 = ArrangeMsgReactorPoint("recpoint_transfer01", GetFlagID_("BFG_REACTER_POINT_015")// Bit_1514 移動装置
		, SHORT_DIST, "REC_POINT_TRANSFER_01", "REC_POINT_TRANSFER_02");
	
	// ■移動装置（凍骨の氷原行）
	local reactorPoint02 = ArrangeMsgReactorPoint("recpoint_transfer02", GetFlagID_("BFG_REACTER_POINT_015")// Bit_1514 移動装置
		, SHORT_DIST, "REC_POINT_TRANSFER_01", "REC_POINT_TRANSFER_03");
	
	// ■ネオンパーク（南口）
	local reactorPoint04 = ArrangeMsgReactorPoint("recpoint_park_south", GetFlagID_("BFG_REACTER_POINT_177")// Bit_1676 ネオンパーク南口
		, SHORT_DIST, "REC_POINT_PARK_01", "REC_POINT_PARK_02");
	
	// ■ネオンパーク（北口）
	local reactorPoint03 = ArrangeMsgReactorPoint("recpoint_park_north", GetFlagID_("BFG_REACTER_POINT_178")// Bit_1677 ネオンパーク北口
		, SHORT_DIST, "REC_POINT_PARK_03", "REC_POINT_PARK_04");
	
	// ■派手な墓１
	local reactorPoint05 = ArrangeMsgReactorPoint("recpoint_grave01", GetFlagID_("BFG_REACTER_POINT_096")// Bit_1595 派手な墓
		, SHORT_DIST, "REC_POINT_GRAVE_01", "REC_POINT_GRAVE_02");
	
	// ■派手な墓２
	local reactorPoint06 = ArrangeMsgReactorPoint("recpoint_grave02", GetFlagID_("BFG_REACTER_POINT_096")// Bit_1595 派手な墓
		, SHORT_DIST, "REC_POINT_GRAVE_01", "REC_POINT_GRAVE_02");
	
	// ■派手な墓３
	local reactorPoint07 = ArrangeMsgReactorPoint("recpoint_grave03", GetFlagID_("BFG_REACTER_POINT_096")// Bit_1595 派手な墓
		, SHORT_DIST, "REC_POINT_GRAVE_01", "REC_POINT_GRAVE_02");
	
	// ■毒の湿地帯１
	local reactorPoint08 = ArrangeMsgReactorPoint("recpoint_doku_numa01", GetFlagID_("BFG_REACTER_POINT_097")// Bit_1596 毒の湿地帯
		, SHORT_DIST, "REC_POINT_DOKU_NUMA_01", "REC_POINT_DOKU_NUMA_02");
	
	// ■毒の湿地帯２
	local reactorPoint09 = ArrangeMsgReactorPoint("recpoint_doku_numa02", GetFlagID_("BFG_REACTER_POINT_097")// Bit_1596 毒の湿地帯
		, SHORT_DIST, "REC_POINT_DOKU_NUMA_01", "REC_POINT_DOKU_NUMA_02");
	
	// ■毒の湿地帯３
	local reactorPoint10 = ArrangeMsgReactorPoint("recpoint_doku_numa03", GetFlagID_("BFG_REACTER_POINT_097")// Bit_1596 毒の湿地帯
		, SHORT_DIST, "REC_POINT_DOKU_NUMA_01", "REC_POINT_DOKU_NUMA_02");
	
	// ■毒の深間
	local reactorPoint11 = ArrangeMsgReactorPoint("recpoint_doku_ike", GetFlagID_("BFG_REACTER_POINT_098")// Bit_1597 毒の深間
		, SHORT_DIST, "REC_POINT_DOKU_IKE_01", "REC_POINT_DOKU_IKE_02");
	
	// ■海底トンネル
	local reactorPoint12 = ArrangeMsgReactorPoint("recpoint_tunnel", GetFlagID_("BFG_REACTER_POINT_099")// Bit_1598 海底トンネル
		, SHORT_DIST, "REC_POINT_TUNNEL_01", "REC_POINT_TUNNEL_02");
	
	// ■アンデッドガーデン
	local reactorPoint13 = ArrangeMsgReactorPoint("recpoint_undead_garden", GetFlagID_("BFG_REACTER_POINT_151")// Bit_1650 アンデッドガーデン
		, SHORT_DIST, "REC_POINT_UNDEAD_GARDEN_01", "REC_POINT_UNDEAD_GARDEN_02");
	
	// ■秘密の暗証扉
	if(bit_lock_door_open == false){
		g_reactorPoint14 = ArrangeMsgReactorPoint("recpoint_door", GetFlagID_("BFG_REACTER_POINT_152")// Bit_1651 秘密の暗証扉
			, SHORT_DIST, "REC_POINT_DOOR_01", "REC_POINT_DOOR_02");
	}
	
	// ■コア
	local reactorPoint15 = ArrangeMsgReactorPoint("recpoint_core", GetFlagID_("BFG_REACTER_POINT_001")// Bit_1500 コア
		, ENDLESS_DIST, "REC_POINT_CORE_01", "REC_POINT_CORE_02");
	
	// ■バリケードＡ
	if(bit_door_open1 == false){
		g_reactorPoint16 = ArrangeMsgReactorPoint("recpoint_barikedo01", GetFlagID_("BFG_REACTER_POINT_153")// Bit_1652 バリケードＡ
			, SHORT_DIST, "REC_POINT_BARIKEDO_A_01", "REC_POINT_BARIKEDO_A_02");
	}
	
	// ■バリケードＢ
	if(bit_door_open2 == false){
		g_reactorPoint17 = ArrangeMsgReactorPoint("recpoint_barikedo02", GetFlagID_("BFG_REACTER_POINT_154")// Bit_1653 バリケードＢ
			, SHORT_DIST, "REC_POINT_BARIKEDO_B_01", "REC_POINT_BARIKEDO_B_02");
	}
	
	// ■バリケードＣ
	if(bit_door_open3 == false){
		g_reactorPoint18 = ArrangeMsgReactorPoint("recpoint_barikedo03", GetFlagID_("BFG_REACTER_POINT_155")// Bit_1654 バリケードＣ
			, SHORT_DIST, "REC_POINT_BARIKEDO_C_01", "REC_POINT_BARIKEDO_C_02");
	}
	
	// ■ルーラポイント(アンデッドガーデン入口)
	local reactorPoint19 = ArrangeMsgReactorPoint("recpoint_ruler_01", GetFlagID_("BFG_REACTER_POINT_010")// Bit_1509 ルーラポイント
		, SHORT_DIST, "REC_POINT_RULER_01", "REC_POINT_RULER_02");
	
	// ■ルーラポイント(中央広場)
	local reactorPoint20 = ArrangeMsgReactorPoint("recpoint_ruler_02", GetFlagID_("BFG_REACTER_POINT_010")// Bit_1509 ルーラポイント
		, SHORT_DIST, "REC_POINT_RULER_01", "REC_POINT_RULER_02");
	
	// ■天導の柱
	local reactorPoint21 = ArrangeMsgReactorPoint("recpoint_keyhole", GetFlagID_("BFG_REACTER_POINT_176")
		, SHORT_DIST, "REC_POINT_HASHIRA_01", "REC_POINT_HASHIRA_02");
	
	//-----------------
	// ▼マップナビ配置
	//-----------------
	// ■目的地
	// ローカル宣言
	local navi_neon		 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.DESTINATION, "map_navi_neon");		// ネオンパーク
	local navi_garden	 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.DESTINATION, "map_navi_garden");	// アンデッドガーデン
	// グローバル宣言
	g_navi_lock		 <- ArrangePointNaviMapIcon_(NAVIMAP_ICON.DESTINATION, "map_navi_lock");		// 暗証番号の扉
	g_navi_transfer	 <- ArrangePointNaviMapIcon_(NAVIMAP_ICON.DESTINATION, "map_navi_transfer");	// 氷原行の移動装置
	SetNaviMapIconVisible_(navi_neon, false);
	SetNaviMapIconVisible_(navi_garden, false);
	SetNaviMapIconVisible_(g_navi_lock, false);
	SetNaviMapIconVisible_(g_navi_transfer, false);
	
	if(main_num == GetFlagID_("CONST_SM_CEMETERY")){							// Num0 = 3
		if(grave_num <= GetFlagID_("CONST_SS_CC_GO_TO_THE_NEON_PARK")){			// Num4 = 1 以下
			SetNaviMapIconVisible_(navi_neon, true);
		}
		else if(grave_num <= GetFlagID_("CONST_SS_CC_TAKE_OVER_VOLITION_2")){	// Num4 = 15 以下
			SetNaviMapIconVisible_(navi_garden, true);
		}
		else if(grave_num <= GetFlagID_("CONST_SS_CC_GET_RACE_PROGRAM")){		// Num4 = 17 以下
			// 暗証番号の扉を開けた場合
			if(bit_lock_door_open == true){										// Bit1114
				SetNaviMapIconVisible_(g_navi_lock, false);
				SetNaviMapIconVisible_(g_navi_transfer, true);
			}else{
				SetNaviMapIconVisible_(g_navi_lock, true);
				SetNaviMapIconVisible_(g_navi_transfer, false);
			}
		}
		else{
			SetNaviMapIconVisible_(g_navi_transfer, true);
		}
	}
	
	// ■ルーラポイントアイコン(アンデッドガーデン入口)
	if(GetEventFlg_("BFG_RULER_ADD_009") == true){	// Bit_209 ルーラ追加 アンデッドガーデン
		local icon_ruler_01 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.RULER_POINT , "g_rulerpoint01");
		SetNaviMapIconVisible_(icon_ruler_01, true);
	}
	
	// ■ルーラポイントアイコン(中央広場)
	if(GetEventFlg_("BFG_RULER_ADD_031") == true){	// Bit_209 ルーラ追加 アンデッドガーデン
		local icon_ruler_02 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.RULER_POINT , "g_rulerpoint02");
		SetNaviMapIconVisible_(icon_ruler_02, true);
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
//		イベントスタート
//------------------------------------------------
function EventStartOperate()
{
// フラグの状態を取得
	local main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");
	local grave_num	 = GetNumFlg_("NUM_SCENARIO_SUB_GRAVE");
	local first_demo = GetEventFlg_("BFG_PLAYED_GRAVE_SCENE_DEMO");	//全景デモを見たかどうか
	//ブンドルドの手下と戦ったか
	local bit_figth_key_npc_a = GetEventFlg_("BFG_BATTLE_BUNDORUDO_RETAINER_A");
	local bit_figth_key_npc_b = GetEventFlg_("BFG_BATTLE_BUNDORUDO_RETAINER_B");
	local bit_figth_key_npc_c = GetEventFlg_("BFG_BATTLE_BUNDORUDO_RETAINER_C");
	
	local player = GetPlayerId_();	// プレイヤーID取得
	local efc_death;				// ブンドルドの手下消滅エフェクト用
	// ガーデンのカギのID
	local garden_key_id = 951;
	
	// ■モンスターの幽霊Ａを半透明にする
	if(main_num == GetFlagID_("CONST_SM_CEMETERY")){				// Num0 = 3
		if(grave_num >= GetFlagID_("CONST_SS_CC_GET_RACE_PROGRAM")){// Num4 = 17 以上
			SetManualCalcAlpha_(g_gost_npc_a, true);
			SetAlpha_(g_gost_npc_a, 0.3);
		}
	}
	else if(main_num >= GetFlagID_("CONST_SM_ICE_FIELD")){			// Num0 = 4 以上
		SetManualCalcAlpha_(g_gost_npc_a, true);
		SetAlpha_(g_gost_npc_a, 0.3);
	}
	// ■モンスターの幽霊Ｂ－Ｃ－Ｈを半透明にする
	if(main_num == GetFlagID_("CONST_SM_CEMETERY")){				// Num0 = 3
		if(grave_num >= GetFlagID_("CONST_SS_CC_FIND_THE_GHOST")){	// Num4 = 2
			SetManualCalcAlpha_(g_gost_npc_b, true);
			SetAlpha_(g_gost_npc_b, 0.3);
			
			SetManualCalcAlpha_(g_gost_npc_c, true);
			SetAlpha_(g_gost_npc_c, 0.3);
			
			SetManualCalcAlpha_(g_gost_npc_h, true);
			SetAlpha_(g_gost_npc_h, 0.3);
		}
	}
	else if(main_num >= GetFlagID_("CONST_SM_ICE_FIELD")){			// Num0 = 4
		SetManualCalcAlpha_(g_gost_npc_b, true);
		SetAlpha_(g_gost_npc_b, 0.3);
		
		SetManualCalcAlpha_(g_gost_npc_c, true);
		SetAlpha_(g_gost_npc_c, 0.3);
		
		SetManualCalcAlpha_(g_gost_npc_h, true);
		SetAlpha_(g_gost_npc_h, 0.3);
	}

//---------------------------------------------------------------------------------------
// デモの再生
	if(main_num == GetFlagID_("CONST_SM_CEMETERY")){					// Num0 = 3
		// ■はじめて歓楽の霊道に入った時のデモ
		if(first_demo == false){										// まだデモを一度も見ていない場合
			local route = GetEnteredMapChangeNullName_();				// どこから入って来たのかを取得する
			DebugPrint(" ルートの値は "+ route +" です ");
			if(route == "w_G01_00BLdr_005"){							// 出口が北門だった場合
				SetEventFlg_("BFG_PLAYED_GRAVE_SCENE_DEMO", true);		// 全景デモを見たかどうか
				SetEventFlg_("BFG_RULER_ADD_008", true);				// ネオンパーク北口のルーラポイント解放
				SetEventFlg_("BFG_G00_00_ENVIRONMENT_BGM_PLAY", false);	// 環境音を止める
				SetEventFlg_("BFG_G00_00_EVENT_BGM012_PLAY", true);		// BGM012[未知の世界を行く] を再生する
				EventStartChangeDemo(200, FADE_COLOR_BLACK);			// Demo200[歓楽の霊道・全景]
			}
		}
	}
//---------------------------------------------------------------------------------------
// 戦闘結果
	if(main_num == GetFlagID_("CONST_SM_CEMETERY")){					// Num0 = 3
		if(grave_num == GetFlagID_("CONST_SS_CC_FIND_THE_GHOST")){		// Num4 = 2
			if(bit_figth_key_npc_a == true){
				// ■ブンドルドの手下Aに勝利
				if (GetBattleEndType_() == BATTLE_END_TYPE_WIN){
					LoadEffect_("ef741_01_div_nor_death");				// 敵消滅エフェクト
					// 下画面を1フレで暗転
					SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
					// フィールドBGMを頭打ち
					SetEventFlg_("BFG_RETURN_BATTLE_FIRLD_BGM_HEAD", true);
					//ブンドルドの手下Aと戦う前のフラグに戻す
					SetEventFlg_("BFG_BATTLE_BUNDORUDO_RETAINER_A", false);
					//ブンドルドの手下Aとの戦闘に勝利した後配置モンスターを解禁するフラグ
					SetEventFlg_("BFG_LIMIT_BUNDORUDO_RETAINER_A", true);
					//マップナビに「!」非表示
					SetNaviMapIconVisible_(g_map_navi_enemy_01, false);
					
					//カメラを設置
					SetPointCameraEye_("cameye_001");
					SetPointCameraTarget_("camtgt_001");
					
					//戦闘後のセリフ
					uMessage("NPC_UNDERLING_A_002");
					
					//ブンドルドの手下Aの消滅処理
					efc_death = SetSelectBoneEffect_("ef741_01_div_nor_death", g_key_npc_a_sub, ATTACH_GLOBAL);
					SetEffectScale_(efc_death, 1.0);
					PlaySE_("SE_DEM_010");
					uAlphaFadeOut(g_key_npc_a_sub);			//徐々にアルファ値を小さくする
					SetVisible(g_key_npc_a_sub, false);		//NPCを表示させない
					SetTalkEnable_(g_key_npc_a_sub, false);	//会話アイコン非表示
					
					//カギ入手フラグ
					SetEventFlg_("BFG_GET_GATE_KEY_1ST", true);
					Wait_(20);
					
					// アイテム入手処理
					AddItemAndMsg(garden_key_id, 1, true);
					
					//プレイアブルに復帰させる
					uPlayableReset(-800.0, -3.6, 786.0, -152);
				}else{
					// ※敗北処理はAfterBattle()に記述
				}
			}
			if(bit_figth_key_npc_b == true){
				// ■ブンドルドの手下Bに勝利
				if (GetBattleEndType_() == BATTLE_END_TYPE_WIN){
					LoadEffect_("ef741_01_div_nor_death");				// 敵消滅エフェクト
					// 下画面を1フレで暗転
					SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
					// フィールドBGMを頭打ち
					SetEventFlg_("BFG_RETURN_BATTLE_FIRLD_BGM_HEAD", true);
					//ブンドルドの手下Bと戦う前のフラグに戻す
					SetEventFlg_("BFG_BATTLE_BUNDORUDO_RETAINER_B", false);
					//ブンドルドの手下Bとの戦闘に勝利した後配置モンスターを解禁するフラグ
					SetEventFlg_("BFG_LIMIT_BUNDORUDO_RETAINER_B", true);
					//マップナビに「!」非表示
					SetNaviMapIconVisible_(g_map_navi_enemy_02, false);
					
					//カメラを設置
					SetPointCameraEye_("cameye_002");
					SetPointCameraTarget_("camtgt_002");
					
					//戦闘後のセリフ
					uMessage("NPC_UNDERLING_B_002");
					
					//ブンドルドの手下Bの消滅処理
					efc_death = SetSelectBoneEffect_("ef741_01_div_nor_death", g_key_npc_b, ATTACH_GLOBAL);
					SetEffectScale_(efc_death, 1.0);
					PlaySE_("SE_DEM_010");
					uAlphaFadeOut(g_key_npc_b_sub);			//徐々にアルファ値を小さくする
					SetVisible(g_key_npc_b_sub, false);		//NPCを表示させない
					SetTalkEnable_(g_key_npc_b_sub, false);	//会話アイコン非表示
					
					//カギ入手フラグ
					SetEventFlg_("BFG_GET_GATE_KEY_2ND", true);
					Wait_(20);
					
					// アイテム入手処理
					AddItemAndMsg(garden_key_id, 1, true);
					
					//プレイアブルに復帰させる
					uPlayableReset(1454.3, 172.7, 390.6, 174);
				}else{
					// ※敗北処理はAfterBattle()に記述
				}
			}
			if(bit_figth_key_npc_c == true){
				// ■ブンドルドの手下Cに勝利
				if (GetBattleEndType_() == BATTLE_END_TYPE_WIN){
					LoadEffect_("ef741_01_div_nor_death");				// 敵消滅エフェクト
					// 下画面を1フレで暗転
					SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
					// フィールドBGMを頭打ち
					SetEventFlg_("BFG_RETURN_BATTLE_FIRLD_BGM_HEAD", true);
					//ブンドルドの手下Cと戦う前のフラグに戻す
					SetEventFlg_("BFG_BATTLE_BUNDORUDO_RETAINER_C", false);
					//ブンドルドの手下Cとの戦闘に勝利した後配置モンスターを解禁するフラグ
					SetEventFlg_("BFG_LIMIT_BUNDORUDO_RETAINER_C", true);
					//マップナビに「!」非表示
					SetNaviMapIconVisible_(g_map_navi_enemy_03, false);
					
					//カメラを設置
					SetPointCameraEye_("cameye_003");
					SetPointCameraTarget_("camtgt_003");
					
					//戦闘後のセリフ
					uMessage("NPC_UNDERLING_C_002");
					
					//ブンドルドの手下Aの消滅処理
					efc_death = SetSelectBoneEffect_("ef741_01_div_nor_death", g_key_npc_c, ATTACH_GLOBAL);
					SetEffectScale_(efc_death, 1.0);
					PlaySE_("SE_DEM_010");
					uAlphaFadeOut(g_key_npc_c_sub);			//徐々にアルファ値を小さくする
					SetVisible(g_key_npc_c_sub, false);		//NPCを表示させない
					SetTalkEnable_(g_key_npc_c_sub, false);	//会話アイコン非表示
					
					//カギ入手フラグ
					SetEventFlg_("BFG_GET_GATE_KEY_3RD", true);
					Wait_(20);
					
					// アイテム入手処理
					AddItemAndMsg(garden_key_id, 1, true);
					
					//プレイアブルに復帰させる
					uPlayableReset(960.7, 296.5, -177.6, 175);
				}else{
					// ※敗北処理はAfterBattle()に記述
				}
			}
		}
	}

	//-----------------------
	// ▼移動装置を使用した時
	//-----------------------
	if(GetEventFlg_("BFG_RIDE_OFF_USED_TRANSFER") == true){
		UsingTransfer();
		
		// 歓楽の霊道に来て最初のタイミング
		if(main_num == GetFlagID_("CONST_SM_CEMETERY")){
			if(grave_num == 0){
				// 旅の心得の項目解放
				SetEventFlg_("BFG_TRAVEL_INFO_SHOW_067", true); // 旅の心得の項目解放フラグ 【フィールド】戦闘がつらい時は
				CommSavedAfterTransferDemo("BFG_SCENARIO_CLEAR_CITY");
			}
		}
		
		SetEventFlg_("BFG_RIDE_OFF_USED_TRANSFER", false);
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


//------------------------------------------------
//		ＮＰＣ接触時
//------------------------------------------------
function TouchNpc()
{
	// フラグの状態を取得
	local main_num  = GetNumFlg_("NUM_SCENARIO_MAIN");
	local grave_num = GetNumFlg_("NUM_SCENARIO_SUB_GRAVE");
	// カギ入手フラグ
	local bit_key1 = GetEventFlg_("BFG_GET_GATE_KEY_1ST");
	local bit_key2 = GetEventFlg_("BFG_GET_GATE_KEY_2ND");
	local bit_key3 = GetEventFlg_("BFG_GET_GATE_KEY_3RD");
	// ブンドルドの手下と戦ったか
	local bit_figth_key_npc_a = GetEventFlg_("BFG_BATTLE_BUNDORUDO_RETAINER_A");
	local bit_figth_key_npc_b = GetEventFlg_("BFG_BATTLE_BUNDORUDO_RETAINER_B");
	local bit_figth_key_npc_c = GetEventFlg_("BFG_BATTLE_BUNDORUDO_RETAINER_C");
	// NPCの種類を取得
	local player = GetPlayerId_();
	local target = GetTargetId_();

	switch(target){
	case g_gost_npc_a:		// モンスターの幽霊A
		uTalkGostNpcA();
		break;
	case g_gost_npc_b:		// モンスターの幽霊B
		uTalkGostNpcB();
		break;
	case g_gost_npc_c:		// モンスターの幽霊C
		uTalkGostNpcC();
		break;
	case g_gost_npc_h:		// モンスターの幽霊H
		uTalkGostNpcH();
		break;
	case g_key_npc_a:		// ブンドルドの手下A
		uTalkKeyNpcA();
		break;
	case g_key_npc_b:		// ブンドルドの手下B
		uTalkKeyNpcB();
		break;
	case g_key_npc_c:		// ブンドルドの手下C
		uTalkKeyNpcC();
		break;
	default:
		DebugPrint("WARNING : NPC_IDが不正です [TouchNpc]");
		break;
	}
	
	EventEnd_();
}


//------------------------------------------------
//		地雷接触時
//------------------------------------------------
function TouchEventMine(){
	// フラグの状態を取得
	local main_num		 = GetNumFlg_("NUM_SCENARIO_MAIN");
	local grave_num		 = GetNumFlg_("NUM_SCENARIO_SUB_GRAVE");
	local ice_event_num	 = GetNumFlg_("NUM_SCENARIO_SUB_ICE");
	// 門が開いたフラグ
	local bit_door_open1 = GetEventFlg_("BFG_OPEN_GATE_1ST");
	local bit_door_open2 = GetEventFlg_("BFG_OPEN_GATE_2ND");
	local bit_door_open3 = GetEventFlg_("BFG_OPEN_GATE_3RD");
	// 暗証番号の扉が開いたフラグ
	local bit_lock_door_open = GetEventFlg_("BFG_OPEN_PASSWORD_DOOR");
	
	local target		 = GetTouchEventMineId_();
	local player		 = GetPlayerId_();
	// ガーデンのカギをいくつ所有しているか
	local key_num = GetItemNum_(951);
	// ガーデンのカギのID
	local garden_key_id  = 951;
	
	switch (target) {
	case g_mine_transfer01:		// ■大陸移動装置(崩落都市行)
		uMineTransferToCity();
		break;
	case g_mine_transfer02:		// ■大陸移動装置(凍骨の氷原行)
		uMineTransferToIce();
		break;
	case g_mine_01:				// ■モンスターの幽霊Aに近づいた時(デモ214[幽霊のお礼]再生)
	case g_mine_01_b:
	case g_mine_01_c:
		uMineGostA();
		break;
	case g_mine_ruler_01:		// ■ルーラポイント(アンデッドガーデン入口)
		uMineRulerPoint01();
		break;
	case g_mine_ruler_02:		// ■ルーラポイント(中央広場)
		uMineRulerPoint02();
		break;
	case g_mine_lock_door:		// ■暗証番号の扉
		uMineLockDoor();
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
	default:
		DebugPrint("設置されていない地雷に接触判定しています！");
		break;
	}
	
	// ※リアルタイムで扉の出し分けと判定を行うので関数化しない方が良い
	// ■アンデッドガーデンの門①
	if(target == g_mine_key_door_01){
		if(bit_door_open1 == false){
			// カギを一つ以上持っていた場合
			if(key_num > 0){
				AddItem_(garden_key_id, -1);					// 「ガーデンのカギ」を減らす
				SetEventFlg_("BFG_OPEN_GATE_1ST", true);		// 1つ目の門が開いたフラグ
				DeleteEventMine_(g_mine_key_door_01);			// 地雷を消す
				CommPlayerTurnAroundObj(g_key_door_01);			// 扉の方にPCを向かせる
				
				PlaySE_("SE_FLD_008");	// アンデッドガーデン入り口への扉
				// 扉のアニメーション開始
				SetMotion_(g_key_door_01, MOT_GIMMICK_1, 0);
				SetGimmickMapHitEnable_(g_key_door_01, false);	// gimmick のアタリを無効化
				Wait_(50);
				
				// 地震を起こす
				StartEarthQuake_(15, 3, 0.3)
				Wait_(40);
				
				uMessage("DOOR_OPEN_MSG_001");					// システムメッセージ
				SetActive_(g_key_door_01, false);				// 門を表示させない
				SetActive_(g_reactorPoint16, false);			// リアクターポイントを消す
				g_mine_key_door_02 = SetPointCircleEventMine_("mine_key_door02", true);// 二つ目の門の地雷を置く
			}
			// カギを持っていない場合
			else{
				CommPlayerTurnAroundObj(g_key_door_01);
				uMessage("DOOR_NOTOPEN_MSG_001");				// システムメッセージ
			}
		}
	}
	// ■アンデッドガーデンの門②
	if(target == g_mine_key_door_02){
		if(bit_door_open1 == true){
			if(bit_door_open2 == false){
				// カギを一つ以上持っていた場合
				if(key_num > 0){
					AddItem_(garden_key_id, -1);				// 「ガーデンのカギ」を減らす
					SetEventFlg_("BFG_OPEN_GATE_2ND", true);	// 2つ目の門が開いたフラグ
					DeleteEventMine_(g_mine_key_door_02);		// 地雷を消す
					CommPlayerTurnAroundObj(g_key_door_02);		// 扉の方にPCを向かせる
					
					PlaySE_("SE_FLD_008");	// アンデッドガーデン入り口への扉
					// 扉のアニメーション開始
					SetMotion_(g_key_door_02, MOT_GIMMICK_1, 0);
					SetGimmickMapHitEnable_(g_key_door_02, false);	// gimmick のアタリを無効化
					Wait_(50);
					
					// 地震を起こす
					StartEarthQuake_(15, 3, 0.3)
					Wait_(40);
					
					uMessage("DOOR_OPEN_MSG_002");				// システムメッセージ
					SetActive_(g_key_door_02, false);			// 門を表示させない
					SetActive_(g_reactorPoint17, false);		// リアクターポイントを消す
					g_mine_key_door_03 = SetPointCircleEventMine_("mine_key_door03", true);// 三つ目の門の地雷を置く
				}
				// カギを持っていない場合
				else{
					CommPlayerTurnAroundObj(g_key_door_02);
					uMessage("DOOR_NOTOPEN_MSG_001");			// システムメッセージ
				}
			}
		}
	}
	// ■アンデッドガーデンの門③
	if(target == g_mine_key_door_03){
		if(bit_door_open2 == true){
			if(bit_door_open3 == false){
				// カギを一つ以上持っていた場合
				if(key_num > 0){
					AddItem_(garden_key_id, -1);				// 「ガーデンのカギ」を減らす
					SetEventFlg_("BFG_OPEN_GATE_3RD", true);	// 3つ目の門が開いたフラグ
					DeleteEventMine_(g_mine_key_door_03);		// 地雷を消す
					CommPlayerTurnAroundObj(g_key_door_03);		// 扉の方にPCを向かせる
					
					PlaySE_("SE_FLD_008");	// アンデッドガーデン入り口への扉
					// 扉のアニメーション開始
					SetMotion_(g_key_door_03, MOT_GIMMICK_1, 0);
					SetGimmickMapHitEnable_(g_key_door_03, false);	// gimmick のアタリを無効化
					Wait_(50);
					
					// 地震を起こす
					StartEarthQuake_(15, 3, 0.3)
					Wait_(40);
					
					uMessage("DOOR_OPEN_MSG_003");				// システムメッセージ
					SetActive_(g_key_door_03, false);			// 門を表示させない
					SetActive_(g_reactorPoint18, false);		// リアクターポイントを消す
				}
				// カギを持っていない場合
				else{
					CommPlayerTurnAroundObj(g_key_door_03);
					uMessage("DOOR_NOTOPEN_MSG_001");			// システムメッセージ
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
// フラグの状態を取得
	local main_num  = GetNumFlg_("NUM_SCENARIO_MAIN");
	local grave_num = GetNumFlg_("NUM_SCENARIO_SUB_GRAVE");

	// NPCの種類を取得
	local target = GetTargetId_();
	
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
//		モンスターの幽霊Ａ  会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkGostNpcA()
{
	// フラグの状態を取得
	local main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");				//Num0
	local grave_num	 = GetNumFlg_("NUM_SCENARIO_SUB_GRAVE");		//Num4
	local sky_num	 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");			//Num9
	
	
	// 霊道シナリオクリアするまで
	if(main_num == GetFlagID_("CONST_SM_CEMETERY")){						// Num0 = 3
		if(grave_num == GetFlagID_("CONST_SS_CC_CLEAR_CEMETERY")){			// Num4 = 18
			uMessage("NPC_GOST_A_010");			//「移動装置で　凍骨の氷原に着いたら
		}
	}
	// 氷原シナリオ開始～ガルビルス撃破まで
	else if(main_num <= GetFlagID_("CONST_SM_CORE")){						// Num0 = 7 以下
		uMessage("NPC_GOST_A_020");				//「やあ　○主人公の名前○じゃないか。
	}
	// ガルビルス撃破後～巨大ブンドルド撃破前まで
	else if(main_num == GetFlagID_("CONST_SM_SKY")){						// Num0 = 8
		if(sky_num <= GetFlagID_("CONST_SS_SK_JDG_REMATCH_G_BUNDORUDO")){	// Num9 = 23 以下
			uMessage("NPC_GOST_A_030");			//「まるで　いつも夜みたいな空だね。
		}
		// 巨大ブンドルド撃破後～表シナリオクリアまで
		else if(sky_num <= GetFlagID_("CONST_SS_SK_DATA_SAVED")){			// Num9 = 58 以下
			uMessage("NPC_GOST_A_040");			//「黒い花粉がなくなったら　悪意は遠ざかったな。
		}
	}
	// 表シナリオクリア後
	else if(main_num >= GetFlagID_("CONST_SM_INSIDE_CLEAR")){				// Num0 = 9 以上
		uMessage("NPC_GOST_A_050");				//「モンスターは　いなくならないけど
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		モンスターの幽霊Ｂ  会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkGostNpcB()
{
	// フラグの状態を取得
	local main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");				//Num0
	local grave_num	 = GetNumFlg_("NUM_SCENARIO_SUB_GRAVE");		//Num4
	local sky_num	 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");			//Num9
	
	// 霊道シナリオ開始～ブンドルド撃破まで
	if(main_num == GetFlagID_("CONST_SM_CEMETERY")){						// Num0 = 3
		if(grave_num <= GetFlagID_("CONST_SS_CC_GO_TO_THE_NEXT_TRANSFER")){	// Num4 = 16 以下
			uMessage("NPC_GOST_B_010");			//「アンデッドガーデンのカギを持つ　魔物は
		// ブンドルド撃破後
		}else if(grave_num <= GetFlagID_("CONST_SS_CC_CLEAR_CEMETERY")){	// Num4 = 18 以下
			uMessage("NPC_GOST_B_020");			//「ブンドルドが　いなくなったら
		}
	}
	// 霊道シナリオクリア後～ガルビルス撃破前まで
	else if(main_num <= GetFlagID_("CONST_SM_CORE")){						// Num0 = 7 以下
		uMessage("NPC_GOST_B_020");				//「ブンドルドが　いなくなったら
	}
	// ガルビルス撃破後～巨大ブンドルド撃破前まで
	else if(main_num == GetFlagID_("CONST_SM_SKY")){						// Num0 = 8
		if(sky_num <= GetFlagID_("CONST_SS_SK_JDG_REMATCH_G_BUNDORUDO")){	// Num9 = 23 以下
			uMessage("NPC_GOST_B_030");			//「まるで　いつも夜みたいな空だね。
		}
		// 巨大ブンドルド撃破後～表シナリオクリアまで
		else if(sky_num <= GetFlagID_("CONST_SS_SK_DATA_SAVED")){			// Num9 = 58 以下
			uMessage("NPC_GOST_B_040");			//「黒い花粉がなくなったら　悪意は遠ざかったな。
		}
	}
	// 表シナリオクリア後
	else if(main_num >= GetFlagID_("CONST_SM_INSIDE_CLEAR")){				// Num0 = 9 以上
		uMessage("NPC_GOST_B_050");				//「モンスターは　いなくならないけど
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		モンスターの幽霊Ｃ  会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkGostNpcC()
{
	// フラグの状態を取得
	local main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");				//Num0
	local grave_num	 = GetNumFlg_("NUM_SCENARIO_SUB_GRAVE");		//Num4
	local sky_num	 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");			//Num9
	
	// 霊道シナリオ開始～ブンドルド撃破まで
	if(main_num == GetFlagID_("CONST_SM_CEMETERY")){						// Num0 = 3
		if(grave_num <= GetFlagID_("CONST_SS_CC_GO_TO_THE_NEXT_TRANSFER")){	// Num4 = 16 以下
			uMessage("NPC_GOST_C_010");			//「アンデッドガーデンの守りは　厳重よ。
		// ブンドルド撃破後
		}else if(grave_num <= GetFlagID_("CONST_SS_CC_CLEAR_CEMETERY")){	// Num4 = 18 以下
			uMessage("NPC_GOST_C_020");			//「アンデッドガーデンの門は　開けっ放しよ。
		}
	}
	// 霊道シナリオクリア後～ガルビルス撃破前まで
	else if(main_num <= GetFlagID_("CONST_SM_CORE")){						// Num0 = 7 以下
		uMessage("NPC_GOST_C_020");				//「アンデッドガーデンの門は　開けっ放しよ。
	}
	// ガルビルス撃破後～巨大ブンドルド撃破前まで
	else if(main_num == GetFlagID_("CONST_SM_SKY")){						// Num0 = 8
		if(sky_num <= GetFlagID_("CONST_SS_SK_JDG_REMATCH_G_BUNDORUDO")){	// Num9 = 23 以下
			uMessage("NPC_GOST_C_030");			//「黒い花粉で覆われた　空を見ていると
		}
		// 巨大ブンドルド撃破後～表シナリオクリアまで
		else if(sky_num <= GetFlagID_("CONST_SS_SK_DATA_SAVED")){			// Num9 = 58 以下
			uMessage("NPC_GOST_C_040");			//「ああ　空が広々としてるわ。
		}
	}
	// 表シナリオクリア後
	else if(main_num >= GetFlagID_("CONST_SM_INSIDE_CLEAR")){				// Num0 = 9 以上
		uMessage("NPC_GOST_C_050");				//「私たち幽霊にとって　いい天気っていうのは
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		モンスターの幽霊Ｈ  会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkGostNpcH()
{
	// フラグの状態を取得
	local main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");				//Num0
	local grave_num	 = GetNumFlg_("NUM_SCENARIO_SUB_GRAVE");		//Num4
	local sky_num	 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");			//Num9
	local bit_door_open3 = GetEventFlg_("BFG_OPEN_GATE_3RD");		//Bit_1113  ３つ目の門を開錠
	
	// 霊道シナリオ開始～ブンドルド撃破まで
	if(main_num == GetFlagID_("CONST_SM_CEMETERY")){						// Num0 = 3
		if(grave_num <= GetFlagID_("CONST_SS_CC_GO_TO_THE_NEXT_TRANSFER")){	// Num4 = 16 以下
			// 扉を3つ全て開けていない時のセリフ
			if(bit_door_open3 == false){
				uMessage("NPC_GOST_H_010");		// ブンドルドは　アンデッドガーデンの入口に
			}
			// 扉を3つ全て開けた時のセリフ
			else{
				uMessage("NPC_GOST_H_020");		//「すごいな……３つのカギを集めて
			}
		// ブンドルド撃破後
		}else if(grave_num <= GetFlagID_("CONST_SS_CC_CLEAR_CEMETERY")){	// Num4 = 18 以下
			uMessage("NPC_GOST_H_030");			//「まさか　ブンドルドの奴が
		}
	}
	// 霊道シナリオクリア後～ガルビルス撃破前まで
	else if(main_num <= GetFlagID_("CONST_SM_CORE")){						// Num0 = 7 以下
		uMessage("NPC_GOST_H_030");				//「まさか　ブンドルドの奴が
	}
	// ガルビルス撃破後～巨大ブンドルド撃破前まで
	else if(main_num == GetFlagID_("CONST_SM_SKY")){						// Num0 = 8
		if(sky_num <= GetFlagID_("CONST_SS_SK_JDG_REMATCH_G_BUNDORUDO")){	// Num9 = 23 以下
			uMessage("NPC_GOST_H_040");			//「あの暗い空の向こうに
		}
		// 巨大ブンドルド撃破後～表シナリオクリアまで
		else if(sky_num <= GetFlagID_("CONST_SS_SK_DATA_SAVED")){			// Num9 = 58 以下
			uMessage("NPC_GOST_H_050");			//「やれやれ……ようやく解決したか。
		}
	}
	// 表シナリオクリア後
	else if(main_num >= GetFlagID_("CONST_SM_INSIDE_CLEAR")){				// Num0 = 9 以上
		uMessage("NPC_GOST_H_060");				//「あんたが　動いてるってことは……
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		ブンドルドの手下Ａ  会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkKeyNpcA()
{
	// フラグの状態を取得
	local main_num  = GetNumFlg_("NUM_SCENARIO_MAIN");
	local grave_num = GetNumFlg_("NUM_SCENARIO_SUB_GRAVE");

	// NPCの種類を取得
	local player = GetPlayerId_();

	// カギ入手フラグ
	local bit_key1 = GetEventFlg_("BFG_GET_GATE_KEY_1ST");
	local bit_key2 = GetEventFlg_("BFG_GET_GATE_KEY_2ND");
	local bit_key3 = GetEventFlg_("BFG_GET_GATE_KEY_3RD");
	
	// ブンドルドの手下と戦ったか（仮フラグ）
	local bit_figth_key_npc_a = GetEventFlg_("BFG_BATTLE_BUNDORUDO_RETAINER_A");
	local bit_figth_key_npc_b = GetEventFlg_("BFG_BATTLE_BUNDORUDO_RETAINER_B");
	local bit_figth_key_npc_c = GetEventFlg_("BFG_BATTLE_BUNDORUDO_RETAINER_C");
	
	if(main_num == GetFlagID_("CONST_SM_CEMETERY")){					// Num0 = 3
		if(grave_num == GetFlagID_("CONST_SS_CC_FIND_THE_GHOST")){		// Num4 = 2
			if(bit_key1 == false){
				//フェードアウト
				SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
				SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
				WaitFade_();
				Wait_(10);
				
				//主人公と手下Aを見えなくする
				SetVisible(player, false);			// 主人公を消す
				SetVisible(g_key_npc_a, false);		// 手下Aを消す
				SetVisible(g_key_npc_a_sub, true);	// 手下Aのサブを表示させる
				
				//カメラを設置
				SetPointCameraEye_("cameye_001");
				SetPointCameraTarget_("camtgt_001");
				Wait_(10);
				
				//フェードイン
				SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
				WaitFade_();
				Wait_(10);
				
				//ブンドルドの手下Aのメッセージ
				OpenMsgWnd_();
				ShowMsg_("DEMO_202_AFT_NPC_A");
				KeyInputWait_();
				// 「はい」
				if(GetQueryResult_() == QUERY2_0){
					ShowMsg_("DEMO_202_AFT_NPC_A_YES");
					KeyInputWait_();
					CloseMsgWnd_();
					//プレイアブルに復帰させる
					uPlayableReset(-800.0, -3.6, 786.0, -152);
					SetVisible(g_key_npc_a, true);		// 手下Aを表示させる
					SetVisible(g_key_npc_a_sub, false);	// 手下Aのサブを消す
				}
				// 「いいえ」
				else{
					ShowMsg_("DEMO_202_AFT_NPC_A_NO");
					KeyInputWait_();
					CloseMsgWnd_();
					//ブンドルドの手下Aと戦ったかフラグ
					SetEventFlg_("BFG_BATTLE_BUNDORUDO_RETAINER_A", true);
					//周囲の徘徊モンスターを削除
					InhibitMonsterGenerate_( 10000.0 );
					//ブンドルドの手下Aと戦闘
					ChangeBattleParty_(13);
				}
			}
		}
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		ブンドルドの手下Ｂ  会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkKeyNpcB()
{
	// フラグの状態を取得
	local main_num  = GetNumFlg_("NUM_SCENARIO_MAIN");
	local grave_num = GetNumFlg_("NUM_SCENARIO_SUB_GRAVE");

	// NPCの種類を取得
	local player = GetPlayerId_();

	// カギ入手フラグ
	local bit_key1 = GetEventFlg_("BFG_GET_GATE_KEY_1ST");
	local bit_key2 = GetEventFlg_("BFG_GET_GATE_KEY_2ND");
	local bit_key3 = GetEventFlg_("BFG_GET_GATE_KEY_3RD");
	
	// ブンドルドの手下と戦ったか（仮フラグ）
	local bit_figth_key_npc_a = GetEventFlg_("BFG_BATTLE_BUNDORUDO_RETAINER_A");
	local bit_figth_key_npc_b = GetEventFlg_("BFG_BATTLE_BUNDORUDO_RETAINER_B");
	local bit_figth_key_npc_c = GetEventFlg_("BFG_BATTLE_BUNDORUDO_RETAINER_C");
	
	if(main_num == GetFlagID_("CONST_SM_CEMETERY")){					// Num0 = 3
		if(grave_num == GetFlagID_("CONST_SS_CC_FIND_THE_GHOST")){		// Num4 = 2
			if(bit_key2 == false){
				//フェードアウト
				SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
				SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
				WaitFade_();
				Wait_(10);
				
				//主人公と手下Bを見えなくする
				SetVisible(player, false);			// 主人公を消す
				SetVisible(g_key_npc_b, false);		// 手下Bを消す
				SetVisible(g_key_npc_b_sub, true);	// 手下Bのサブを表示させる
				
				//カメラを設置
				SetPointCameraEye_("cameye_002");
				SetPointCameraTarget_("camtgt_002");
				Wait_(10);
				
				//フェードイン
				SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
				WaitFade_();
				Wait_(10);
				
				//ブンドルドの手下Bのメッセージ
				OpenMsgWnd_();
				ShowMsg_("DEMO_202_AFT_NPC_B");
				KeyInputWait_();
				// 「はい」
				if(GetQueryResult_() == QUERY2_0){
					ShowMsg_("DEMO_202_AFT_NPC_B_YES");
					KeyInputWait_();
					CloseMsgWnd_();
					//ブンドルドの手下Bと戦ったかフラグ
					SetEventFlg_("BFG_BATTLE_BUNDORUDO_RETAINER_B", true);
					//周囲の徘徊モンスターを削除
					InhibitMonsterGenerate_( 10000.0 );
					//ブンドルドの手下Bと戦闘
					ChangeBattleParty_(12);
				}
				// 「いいえ」
				else{
					ShowMsg_("DEMO_202_AFT_NPC_B_NO");
					KeyInputWait_();
					CloseMsgWnd_();
					//プレイアブルに復帰させる
					uPlayableReset(1454.3, 172.7, 390.6, 174);
					SetVisible(g_key_npc_b, true);		// 手下Bを表示させる
					SetVisible(g_key_npc_b_sub, false);	// 手下Bのサブを消す
				}
			}
		}
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		ブンドルドの手下Ｃ  会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkKeyNpcC()
{
	// フラグの状態を取得
	local main_num  = GetNumFlg_("NUM_SCENARIO_MAIN");
	local grave_num = GetNumFlg_("NUM_SCENARIO_SUB_GRAVE");

	// NPCの種類を取得
	local player = GetPlayerId_();

	// カギ入手フラグ
	local bit_key1 = GetEventFlg_("BFG_GET_GATE_KEY_1ST");
	local bit_key2 = GetEventFlg_("BFG_GET_GATE_KEY_2ND");
	local bit_key3 = GetEventFlg_("BFG_GET_GATE_KEY_3RD");
	
	// ブンドルドの手下と戦ったか（仮フラグ）
	local bit_figth_key_npc_a = GetEventFlg_("BFG_BATTLE_BUNDORUDO_RETAINER_A");
	local bit_figth_key_npc_b = GetEventFlg_("BFG_BATTLE_BUNDORUDO_RETAINER_B");
	local bit_figth_key_npc_c = GetEventFlg_("BFG_BATTLE_BUNDORUDO_RETAINER_C");
	
	if(main_num == GetFlagID_("CONST_SM_CEMETERY")){					// Num0 = 3
		if(grave_num == GetFlagID_("CONST_SS_CC_FIND_THE_GHOST")){		// Num4 = 2
			if(bit_key3 == false){
				//フェードアウト
				SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
				SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
				WaitFade_();
				Wait_(10);
				
				//主人公と手下Bを見えなくする
				SetVisible(player, false);			// 主人公を消す
				SetVisible(g_key_npc_c, false);		// 手下Bを消す
				SetVisible(g_key_npc_c_sub, true);	// 手下Bのサブを表示させる
				
				//カメラを設置
				SetPointCameraEye_("cameye_003");
				SetPointCameraTarget_("camtgt_003");
				Wait_(10);
				
				//フェードイン
				SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
				WaitFade_();
				Wait_(10);
				
				//ブンドルドの手下Cのメッセージ
				OpenMsgWnd_();
				ShowMsg_("DEMO_202_AFT_NPC_C");
				KeyInputWait_();
				// 「はい」
				if(GetQueryResult_() == QUERY2_0){
					ShowMsg_("DEMO_202_AFT_NPC_C_YES");
					KeyInputWait_();
					CloseMsgWnd_();
					//プレイアブルに復帰させる
					uPlayableReset(960.7, 296.5, -177.6, 175);
					SetVisible(g_key_npc_c, true);		// 手下Cを表示させる
					SetVisible(g_key_npc_c_sub, false);	// 手下Cのサブを消す
				}
				// 「いいえ」
				else{
					ShowMsg_("DEMO_202_AFT_NPC_C_NO");
					KeyInputWait_();
					CloseMsgWnd_();
					//ブンドルドの手下Cと戦ったかフラグ
					SetEventFlg_("BFG_BATTLE_BUNDORUDO_RETAINER_C", true);
					//周囲の徘徊モンスターを削除
					InhibitMonsterGenerate_( 10000.0 );
					//ブンドルドの手下Cと戦闘
					ChangeBattleParty_(14);
				}
			}
		}
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		大陸移動装置(崩落都市行)を調べた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineTransferToCity()
{
	local dont_use_transfer = GetEventFlg_("BFG_DONT_TRANSFER_CITY_TO_GRAVE");// 崩落-霊道間の大陸移動装置の使用を禁止するフラグ
	
	if(dont_use_transfer == false){
		// 選択肢メッセージ
		OpenMsgWnd_();
		ShowMsg_("MINE_TRANSFER_MSG_001");
		KeyInputWait_();
		//はい
		if(GetQueryResult_() == QUERY_YES){
			CloseMsgWnd_();
			// ライド状態で大陸移動した場合、ライドを解除するフラグ
			SetEventFlg_("BFG_RIDE_OFF_USED_TRANSFER", true);
			// 崩落都市へ
			ChangeMapPosDir_("A00_00", Vec3(-2399.243, 235.961,-1390. 153), 62);
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
//		大陸移動装置(凍骨の氷原行)を調べた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineTransferToIce()
{
	// フラグの状態を取得
	local main_num			 = GetNumFlg_("NUM_SCENARIO_MAIN");
	local grave_num			 = GetNumFlg_("NUM_SCENARIO_SUB_GRAVE");
	local dont_use_transfer	 = GetEventFlg_("BFG_DONT_TRANSFER_GRAVE_TO_ICE");// 霊道-氷原間の大陸移動装置の使用を禁止するフラグ
	
	if(dont_use_transfer == false){
		//クリア後
		if(main_num >= GetFlagID_("CONST_SM_ICE_FIELD")){					// Num0 = 4
			// 選択肢メッセージ
			OpenMsgWnd_();
			ShowMsg_("MINE_TRANSFER_MSG_002");
			KeyInputWait_();
			//はい
			if(GetQueryResult_() == QUERY_YES){
				CloseMsgWnd_();
				// ライド状態で大陸移動した場合、ライドを解除するフラグ
				SetEventFlg_("BFG_RIDE_OFF_USED_TRANSFER", true);
				// 凍骨の氷原へ
				ChangeMapPosDir_("I00_00", Vec3(-1440.1, 1100.0, -1855.7), 35);
			}
			//いいえ
			else{
				CloseMsgWnd_();
			}
		}
		if(main_num == GetFlagID_("CONST_SM_CEMETERY")){					// Num0 = 3
			//起動後
			if(grave_num == GetFlagID_("CONST_SS_CC_CLEAR_CEMETERY")){		// Num4 = 18
				DeleteEventMine_(g_mine_transfer02);
				// 霊道のシナリオフラグ
				SetNumFlg_("NUM_SCENARIO_SUB_GRAVE", 0);
				// 大陸移動のデモ中にセーブポイントを挟む際に使用するフラグ
				SetEventFlg_("BFG_SAVE_POINT_FLAG", true);
				// ライド状態で大陸移動した場合、ライドを解除するフラグ
				SetEventFlg_("BFG_RIDE_OFF_USED_TRANSFER", true);
				// 氷のシナリオのフラグ
				SetNumFlg_("NUM_SCENARIO_MAIN", 4);
				SetNumFlg_("NUM_SCENARIO_SUB_ICE", GetFlagID_("CONST_SS_IF_ARRIVE_ICE_FIELD"));
				// 凍骨の氷原へ
				SetReturnDemoMap_("I00_00"); 
				SetReturnDemoPosDir_(Vec3(-1440.1, 1100.0, -1855.7), 35);
				//demo221[転送装置使用]
				TouchNpcChangeDemo(221);
			}
			//起動前
			if(grave_num <= GetFlagID_("CONST_SS_CC_GET_RACE_PROGRAM")){	// Num4 = 17
				//システムメッセージ
				uMessage("MINE_04_MSG");
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
//		モンスターの幽霊Aに近づいた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineGostA()
{
	// フラグの状態を取得
	local main_num		 = GetNumFlg_("NUM_SCENARIO_MAIN");
	local grave_num		 = GetNumFlg_("NUM_SCENARIO_SUB_GRAVE");
	
	if(main_num == GetFlagID_("CONST_SM_CEMETERY")){					// Num0 = 3
		//モンスターの幽霊Aに近づいた時(デモ214[幽霊のお礼]再生)
		if(grave_num == GetFlagID_("CONST_SS_CC_GET_RACE_PROGRAM")){	// Num4 = 17
			DeleteEventMine_(g_mine_01);
			DeleteEventMine_(g_mine_01_b);
			DeleteEventMine_(g_mine_01_c);
			SetNumFlg_("NUM_SCENARIO_SUB_GRAVE",GetFlagID_("CONST_SS_CC_CLEAR_CEMETERY"));// Num4 = 18
			AddItem_(902, 1);	//崩落の天導石をデモ内でもらえるので加算
			// デモの復帰位置をデモの完成後に設定します
			SetReturnDemoPosDir_(Vec3(-457.299, 315.610, -1668.393), -125);
			TouchNpcChangeDemo(214);//Demo214[幽霊のお礼]
		}
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		ルーラポイント(アンデッドガーデン入口)を調べた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineRulerPoint01()
{
	CommPlayerTurnAroundObj(g_rulerpoint01);
	CommRulerPointEvent(g_rulerpoint01, "BFG_RULER_ADD_009", "g_rulerpoint01"); 
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		ルーラポイント(中央広場)を調べた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineRulerPoint02()
{
	CommPlayerTurnAroundObj(g_rulerpoint02);
	CommRulerPointEvent(g_rulerpoint02, "BFG_RULER_ADD_031", "g_rulerpoint02"); 
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		暗証番号の扉を調べた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineLockDoor()
{
	// フラグの状態を取得
	local main_num		 = GetNumFlg_("NUM_SCENARIO_MAIN");
	local grave_num		 = GetNumFlg_("NUM_SCENARIO_SUB_GRAVE");
	// 暗証番号の扉が開いたフラグ
	local bit_lock_door_open = GetEventFlg_("BFG_OPEN_PASSWORD_DOOR");
	
	// 主人公を扉の方向に向ける
	CommPlayerTurnAroundObj(g_lock_door);
	
	if(main_num == GetFlagID_("CONST_SM_CEMETERY")){									// Num0 = 3
		if(bit_lock_door_open == false){
			// 暗証番号入手前
			if(grave_num <= GetFlagID_("CONST_SS_CC_TAKE_OVER_VOLITION_2")){			// Num4 = 15
				// システムメッセージ
				uMessage("LOCK_DOOR_MSG_00");							// カベに見せかけた　隠しドアだ。
				//ドアロックメッセージ
				uMessageTag("NAME_TAG_DOORLOCK", "LOCK_DOOR_MSG_01");	//「暗証番号を  入力してください。
				//（後で数字入力の処理を追加
				// システムメッセージ
				uMessage("LOCK_DOOR_MSG_02");							// この扉を　開くためには
			}
			// 暗証番号入手後
			if(grave_num == GetFlagID_("CONST_SS_CC_GET_RACE_PROGRAM")){				// Num4 = 17
				// システムメッセージ
				uMessage("LOCK_DOOR_MSG_00");							// カベに見せかけた　隠しドアだ。
				// ドアロックメッセージ
				uMessageTag("NAME_TAG_DOORLOCK", "LOCK_DOOR_MSG_01");	//「暗証番号を  入力してください。
				Wait_(60); 
				// システムメッセージ
				uMessage("LOCK_DOOR_MSG_03");							// <name_player/>は  暗証番号を  入力した！
				Wait_(5); 
				// ドアロックメッセージ
				uMessageTag("NAME_TAG_DOORLOCK", "LOCK_DOOR_MSG_04");	//「暗証番号を  確認しました。
				PlaySE_("SE_FLD_009");	// アンデッドガーデン裏の壁が開く
				// 扉のアニメーション開始
				SetMotion_(g_lock_door, MOT_GIMMICK_1, 0);
				SetGimmickMapHitEnable_(g_lock_door, false);			// gimmick のアタリを無効化
				Wait_(40);
				// 地震を起こす
				StartEarthQuake_(15, 3, 0.3)
				Wait_(40);
				// ナビマップの配置を変える
				SetNaviMapIconVisible_(g_navi_lock, false);
				SetNaviMapIconVisible_(g_navi_transfer, true);
				// 暗所番号の扉を消す
				SetActive_(g_lock_door, false);//門を表示させない
				SetActive_(g_reactorPoint14, false);			// リアクターポイントを消す
				DeleteEventMine_(g_mine_lock_door);
				SetEventFlg_("BFG_OPEN_PASSWORD_DOOR", true);	// 暗証番号の扉を開けたフラグ
				//システムメッセージ
				uMessage("LOCK_DOOR_MSG_05");					// ドアロックが  開いたようだ。
			}
		}
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		NPCをフェードアウトする
//------------------------------------------------
//	引数	: id	NPCID
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uAlphaFadeOut(id)
{
	local alpha = 0.0;				// α値の設定
	SetManualCalcAlpha_(id, true);	// 手動計算出来るようにする
	for(alpha = 1.0; alpha >= 0.0; alpha = alpha - 0.1){
		SetAlpha_(id, alpha);
		Wait_(2);
	}
	SetAlpha_(id, 0.0);				// 確実に消す
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
//		汎用メッセージ関数(ネームタグ無し)
//------------------------------------------------
//	引数	: msg	メッセージID
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMessage(msg)
{
	OpenMsgWnd_();
	ShowMsg_(msg);
	KeyInputWait_();
	CloseMsgWnd_();
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		汎用メッセージ関数(ネームタグ有り)
//------------------------------------------------
//	引数	: msg	メッセージID
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMessageTag(tag, msg)
{
	OpenMsgWnd_();
	SetTalkName_(tag);
	ShowMsg_(msg);
	KeyInputWait_();
	CloseMsgWnd_();
}


