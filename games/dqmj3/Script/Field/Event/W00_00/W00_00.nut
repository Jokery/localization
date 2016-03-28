//===================== W00_00 高空 ====================

// 定数定義
const EFC_SIZE	= 10.0;						// 巨大ボスのエフェクトサイズ


// 変数定義
main_num	 <- C_NONE_ID;					// メインフラグ
sky_num		 <- C_NONE_ID;					// シナリオサブフラグ

str_num_sub	 <- "NUM_SCENARIO_SUB_SKY";		// シナリオサブフラグの定数名 : Num9

// いつの間に高空徘徊モンスター仲間後のマップチェンジID
const MAP_ID				 = "W00_00";
//------------------------------------------------
//		戦闘終了後
//------------------------------------------------
function AfterBattle()
{
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");			// Num0
	sky_num		 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");		// Num9
	
	local battle_result = GetBattleEndType_();
	
	if (main_num == GetFlagID_("CONST_SM_SKY")) {			// Num0 = 8
		// ■巨大ボーショック戦 敗北時
		if (sky_num == GetFlagID_("CONST_SS_SK_JDG_BATTLE_G_BOWSHOCK")					// Num9 = 14 or
		 || sky_num == GetFlagID_("CONST_SS_SK_JDG_REMATCH_G_BOWSHOCK")) {				// Num9 = 17
			if(battle_result == END_TYPE_LOSE){
				SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_SK_CONTACT_G_BOWSHOCK"));	// Num9 = 15
			}
		}
		// ■巨大ブンドルド戦 敗北時
		else if (sky_num == GetFlagID_("CONST_SS_SK_JDG_BATTLE_G_BUNDORUDO")			// Num9 = 20 or
		 || sky_num == GetFlagID_("CONST_SS_SK_JDG_REMATCH_G_BUNDORUDO")) {				// Num9 = 23
			if(battle_result == END_TYPE_LOSE){
				SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_SK_CONTACT_G_BUNDORUDO"));	// Num9 = 21
			}
		}
		// ■巨大アーザムーク戦 敗北時
		else if (sky_num == GetFlagID_("CONST_SS_SK_JDG_BATTLE_G_AZAMUKU")				// Num9 = 26 or
		 || sky_num == GetFlagID_("CONST_SS_SK_JDG_REMATCH_G_AZAMUKU")) {				// Num9 = 29
			if(battle_result == END_TYPE_LOSE){
				SetNumFlg_(str_num_sub,  GetFlagID_("CONST_SS_SK_CONTACT_G_AZAMUKU"));	// Num9 = 27
			}
		}
		// ■巨大イッタブル戦 敗北時
		else if (sky_num ==  GetFlagID_("CONST_SS_SK_JDG_BATTLE_G_ITTABURU")			// Num9 = 32 or
		 || sky_num ==  GetFlagID_("CONST_SS_SK_JDG_REMATCH_G_ITTABURU")) {				// Num9 = 35
			if(battle_result == END_TYPE_LOSE){
				SetNumFlg_(str_num_sub,  GetFlagID_("CONST_SS_SK_CONTACT_G_ITTABURU"));	// Num9 = 33
			}
		}
		// ■巨大デスバーン戦 敗北時
		else if (sky_num ==  GetFlagID_("CONST_SS_SK_JDG_BATTLE_DEATH_PRO")				// Num9 = 38 or
		 || sky_num ==  GetFlagID_("CONST_SS_SK_JDG_REMATCH_DEATH_PRO")) {				// Num9 = 41
			if(battle_result == END_TYPE_LOSE){
				SetNumFlg_(str_num_sub,  GetFlagID_("CONST_SS_SK_CONTACT_DEATH_PRO"));	// Num9 = 39
			}
		}
		// ■巨大ガルマザード戦 敗北時
		else if (sky_num ==  GetFlagID_("CONST_SS_SK_JDG_BATTLE_GARUMAZARD")			// Num9 = 44 or
		 || sky_num ==  GetFlagID_("CONST_SS_SK_JDG_REMATCH_GARUMAZARD")) {				// Num9 = 47
			if(battle_result == END_TYPE_LOSE){
				SetNumFlg_(str_num_sub,  GetFlagID_("CONST_SS_SK_CONTACT_GARUMAZARD"));	// Num9 = 45
			}
		}
	}
	
	//-----------------------
	// ▼いつの間に高空徘徊用
	//-----------------------
	if(battle_result == END_TYPE_LOSE){
		if(GetEventFlg_("BFG_BOSS_MONSTER_BATTLE_START")){
			// 戦闘したかどうかのフラグを降ろす
			SetEventFlg_("BFG_BOSS_MONSTER_BATTLE_START", false);							// Bit_2020
		}
	}
	
	
	EventEnd_();
}

//------------------------------------------------
//		マップに入る前
//------------------------------------------------
function BeforeInitMap()
{
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");			// Num0
	sky_num		 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");		// Num9
	
	/*
		処理なし
	*/
	
	EventEnd_();
}


//------------------------------------------------
//		フェードアウト中
//------------------------------------------------
function FadeIn()
{
	// マップ到達フラグ
	SetEventFlg_("BFG_ARRIVE_AT_W00", true);
	// セーブ禁止を解除(セーブ禁止マップから帰ってきた時用)
	SetEventFlg_("BFG_SAVE_PROHIBIT", false);		// セーブ禁止(Bit451)

	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");			// Num0
	sky_num		 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");		// Num9
	
	
	// モンスター配置をする為のフラグ操作を行う
	if (main_num >= GetFlagID_("CONST_SM_SKY")) {										// Num0 = 8 以上
		if (sky_num >=  GetFlagID_("CONST_SS_SK_GO_GRAVE_SKY")) {						// Num9 = 18 以上
			// 巨大ボーショック戦勝利後に配置を解禁するフラグ
			SetEventFlg_("BFG_SET_MONSTER_G_BOWSHOCK_WINS", true);						// Bit1260
		}
		if (sky_num >=  GetFlagID_("CONST_SS_SK_GO_ICE_FIELD_SKY")) {					// Num9 = 24 以上
			// 巨大ブンドルド戦勝利後に配置を解禁するフラグ
			SetEventFlg_("BFG_SET_MONSTER_G_BUNDORUDO_WINS", true);						// Bit1261
		}
		if (sky_num >=  GetFlagID_("CONST_SS_SK_GO_PRISON_SKY")) {						// Num9 = 30 以上
			// 巨大アーザムーク戦勝利後に配置を解禁するフラグ
			SetEventFlg_("BFG_SET_MONSTER_G_AZAMUKU_WINS", true);						// Bit1262
		}
		if (sky_num >=  GetFlagID_("CONST_SS_SK_GO_VOLCANO_SKY")) {						// Num9 = 36 以上
			// 巨大イッタブル戦勝利後に配置を解禁するフラグ
			SetEventFlg_("BFG_SET_MONSTER_G_ITTABURU_WINS", true);						// Bit1263
		}
		if (sky_num >=  GetFlagID_("CONST_SS_SK_GO_CORE_SKY")) {						// Num9 = 42 以上
			// 巨大デスバーン＆プロメテウス戦勝利後に配置を解禁するフラグ
			SetEventFlg_("BFG_SET_MONSTER_G_DEATH_PRO_WINS", true);						// Bit1264
		}
	}
	
	
	//----------
	// ▼NPC配置
	//----------
	// ID初期化
	g_npc_boshoku			 <- C_NONE_ID;
	g_npc_bunndorudo		 <- C_NONE_ID;
	g_npc_azamuku			 <- C_NONE_ID;
	g_npc_ittaburu			 <- C_NONE_ID;
	g_npc_purometeusu		 <- C_NONE_ID;
	g_npc_desuban			 <- C_NONE_ID;
	g_npc_garumazado		 <- C_NONE_ID;
	g_sky_monster_npc		 <- C_NONE_ID;
	
	//------------------
	//	エフェクトの設置
	//------------------
	local efc_dark;
	
	// エフェクトの読み込み
	LoadEffect_("ef731_02_mag_dark_pollen_field");		//黒い花粉
	LoadEffect_("ef731_11_mag_dark_pollen_field_gm");	//黒い花粉(ガルマザード用)
	
	if (main_num == GetFlagID_("CONST_SM_SKY")) {									// Num0 = 8
		// ■巨大ボーショック
		if (sky_num == GetFlagID_("CONST_SS_SK_GO_CITY_SKY")						// Num9 = 12 or
		||  sky_num == GetFlagID_("CONST_SS_SK_CONTACT_G_BOWSHOCK")) {				// Num9 = 15
			local id_boshoku = ReadNpc_("m207_00");
			g_npc_boshoku = ArrangePointNpc_(id_boshoku, "npc_1_boshoku");
			SetPointPosNoFit_(g_npc_boshoku, "npc_1_boshoku");			//空中に配置
			SetHideIfFar_(g_npc_boshoku, false);						//遠距離フェード
			SetScaleSilhouette(g_npc_boshoku, SCALE.NEO_BOSS, SILHOUETTE_WIDTH.NEO_BOSS);	//サイズの設定
			SetReactorMsg_(g_npc_boshoku, "NPC_BIG_BOWSHOCK_REC");
			SetMotion_(g_npc_boshoku, MOT_SPECIAL_WAIT, BLEND_N);
			//暗雲エフェクトの設定
			efc_dark = SetPointWorldEffect_("ef731_02_mag_dark_pollen_field", "npc_1_boshoku");
			SetEffectScale_(efc_dark, EFC_SIZE);
		}
		// ■巨大ブンドルド
		else if (sky_num == GetFlagID_("CONST_SS_SK_GO_GRAVE_SKY")					// Num9 = 18 or
			 ||  sky_num == GetFlagID_("CONST_SS_SK_CONTACT_G_BUNDORUDO")) {		// Num9 = 21
			local id_bunndorudo = ReadNpc_("m203_00");
			g_npc_bunndorudo = ArrangePointNpc_(id_bunndorudo, "npc_2_bunndorudo");
			SetPointPosNoFit_(g_npc_bunndorudo, "npc_2_bunndorudo");	//空中に配置
			SetHideIfFar_(g_npc_bunndorudo, false);						//遠距離フェード
			SetScaleSilhouette(g_npc_bunndorudo, SCALE.NEO_BOSS, SILHOUETTE_WIDTH.NEO_BOSS);	//サイズの設定
			SetReactorMsg_(g_npc_bunndorudo, "NPC_BIG_BUNDORUDO_REC");
			SetMotion_(g_npc_bunndorudo, MOT_SPECIAL_WAIT, BLEND_N);
			//暗雲エフェクトの設定
			efc_dark = SetPointWorldEffect_("ef731_02_mag_dark_pollen_field", "npc_2_bunndorudo");
			SetEffectScale_(efc_dark, EFC_SIZE);
		}
		// ■巨大アーザムーク
		else if (sky_num == GetFlagID_("CONST_SS_SK_GO_ICE_FIELD_SKY")				// Num9 = 24 or
			 || sky_num == GetFlagID_("CONST_SS_SK_CONTACT_G_AZAMUKU")) {			// Num9 = 27
			local id_azamuku = ReadNpc_("m204_00");
			g_npc_azamuku = ArrangePointNpc_(id_azamuku, "npc_3_azamuku");
			SetPointPosNoFit_(g_npc_azamuku, "npc_3_azamuku");			//空中に配置
			SetHideIfFar_(g_npc_azamuku, false);						//遠距離フェード
			SetScaleSilhouette(g_npc_azamuku, SCALE.NEO_BOSS, SILHOUETTE_WIDTH.NEO_BOSS);	//サイズの設定
			SetReactorMsg_(g_npc_azamuku, "NPC_BIG_AZAMUKU_REC");
			SetMotion_(g_npc_azamuku, MOT_SPECIAL_WAIT, BLEND_N);
			//暗雲エフェクトの設定
			efc_dark = SetPointWorldEffect_("ef731_02_mag_dark_pollen_field", "npc_3_azamuku");
			SetEffectScale_(efc_dark, EFC_SIZE);
		}
		// ■巨大イッタブル
		else if (sky_num == GetFlagID_("CONST_SS_SK_GO_PRISON_SKY")					// Num9 = 30 or
			 || sky_num == GetFlagID_("CONST_SS_SK_CONTACT_G_ITTABURU")) {			// Num9 = 33
			local id_ittaburu = ReadNpc_("m205_00");
			g_npc_ittaburu = ArrangePointNpc_(id_ittaburu, "npc_4_ittaburu");
			SetPointPosNoFit_(g_npc_ittaburu, "npc_4_ittaburu");		//空中に配置
			SetHideIfFar_(g_npc_ittaburu, false);						//遠距離フェード
			SetScaleSilhouette(g_npc_ittaburu, SCALE.NEO_BOSS, SILHOUETTE_WIDTH.NEO_BOSS);	//サイズの設定
			SetReactorMsg_(g_npc_ittaburu, "NPC_BIG_ITTABURU_REC");
			SetMotion_(g_npc_ittaburu, MOT_WAIT, BLEND_N);
			//暗雲エフェクトの設定
			efc_dark = SetPointWorldEffect_("ef731_02_mag_dark_pollen_field", "npc_4_ittaburu");
			SetEffectScale_(efc_dark, EFC_SIZE);
		}
		// ■巨大デスバーン
		else if (sky_num == GetFlagID_("CONST_SS_SK_GO_VOLCANO_SKY")				// Num9 = 36 or
			 || sky_num == GetFlagID_("CONST_SS_SK_CONTACT_DEATH_PRO")) {			// Num9 = 39
			local id_desuban = ReadNpc_("m206_00");
			g_npc_desuban = ArrangePointNpc_(id_desuban, "npc_5_desuban");
			SetPointPosNoFit_(g_npc_desuban, "npc_5_desuban");			//空中に配置
			SetHideIfFar_(g_npc_desuban, false);						//遠距離フェード
			SetScaleSilhouette(g_npc_desuban, SCALE.NEO_BOSS, SILHOUETTE_WIDTH.NEO_BOSS);	//サイズの設定
			SetReactorMsg_(g_npc_desuban, "NPC_BIG_DEATH_REC");
			 //モーション読み込み
			local hovering = ReadMotion_(g_npc_desuban, "m206_00_flight_Hovering_L");		// ホバリングL
			SetMotion_(g_npc_desuban, hovering, BLEND_N);
			//暗雲エフェクトの設定
			efc_dark = SetPointWorldEffect_("ef731_02_mag_dark_pollen_field", "npc_5_desuban");
			SetEffectScale_(efc_dark, EFC_SIZE);
			
			// ■巨大プロメテウス
			local id_purometeusu = ReadNpc_("n026");
			g_npc_purometeusu = ArrangePointNpc_(id_purometeusu, "npc_5_purometeusu");
			SetPointPosNoFit_(g_npc_purometeusu, "npc_5_purometeusu");	//空中に配置
			SetHideIfFar_(g_npc_purometeusu, false);					//遠距離フェード
			SetScaleSilhouette(g_npc_purometeusu, SCALE.T, SILHOUETTE_WIDTH.T);				//サイズの設定
			SetReactorMsg_(g_npc_purometeusu, "NPC_BIG_PRO_REC");
			RideOn_(g_npc_purometeusu, g_npc_desuban, 606, SIZE_T);		//ライドさせる
			
		}
		// ■巨大ガルマザード(初戦時)
		else if (sky_num ==  GetFlagID_("CONST_SS_SK_GO_CORE_SKY")){					// Num9 = 42
			local id_garumazado = ReadNpc_("m185_00");
			g_npc_garumazado = ArrangePointNpc_(id_garumazado, "npc_6_garumazado");
			SetPointPosNoFit_(g_npc_garumazado, "npc_6_garumazado");	//空中に配置
			SetHideIfFar_(g_npc_garumazado, false);						//遠距離フェード
			SetScaleSilhouette(g_npc_garumazado, SCALE.NEO_BOSS, SILHOUETTE_WIDTH.NEO_BOSS);//サイズの設定
			//暗雲エフェクトの設定
			efc_dark = SetPointWorldEffect_("ef731_11_mag_dark_pollen_field_gm", "npc_6_garumazado");
			SetEffectScale_(efc_dark, 1.0);	// 専用のエフェクトを使用しているので倍率は他と異なる
		}
		// ■巨大ガルマザード(再戦時)
		else if (sky_num ==  GetFlagID_("CONST_SS_SK_CONTACT_GARUMAZARD")) {		// Num9 = 45
			local id_garumazado = ReadNpc_("m185_00");
			g_npc_garumazado = ArrangePointNpc_(id_garumazado, "npc_6_garumazado");
			SetPointPosNoFit_(g_npc_garumazado, "npc_6_garumazado");	//空中に配置
			SetHideIfFar_(g_npc_garumazado, false);						//遠距離フェード
			SetScaleSilhouette(g_npc_garumazado, SCALE.NEO_BOSS, SILHOUETTE_WIDTH.NEO_BOSS);//サイズの設定
			SetReactorMsg_(g_npc_garumazado, "NPC_BIG_GARUMAZARD_REC");
			//暗雲エフェクトの設定
			efc_dark = SetPointWorldEffect_("ef731_02_mag_dark_pollen_field", "npc_6_garumazado");
			SetEffectScale_(efc_dark, EFC_SIZE);
		}
	}

	//-----------
	// ▼地雷配置
	//-----------
	// ID初期化
	g_mine_boshoku			 <- C_NONE_ID;
	g_mine_bunndorudo		 <- C_NONE_ID;
	g_mine_azamuku			 <- C_NONE_ID;
	g_mine_ittaburu			 <- C_NONE_ID;
	g_mine_purometeusu		 <- C_NONE_ID;
	g_mine_garumazado		 <- C_NONE_ID;
	g_sky_monster_talk_mine	 <- C_NONE_ID;
	
	if (main_num == GetFlagID_("CONST_SM_SKY")) {									// Num0 = 8
		// ■ボーショックdemo 起動地雷
		if (sky_num ==  GetFlagID_("CONST_SS_SK_GO_CITY_SKY")						// Num9 = 12 or
		|| sky_num ==  GetFlagID_("CONST_SS_SK_CONTACT_G_BOWSHOCK")) {				// Num9 = 15
			g_mine_boshoku = SetPointBoxEventMine_("mine_1_boshoku", false);
		}
		// ■ブンドルドdemo 起動地雷
		else if (sky_num ==  GetFlagID_("CONST_SS_SK_GO_GRAVE_SKY")					// Num9 = 18 or
			 || sky_num ==  GetFlagID_("CONST_SS_SK_CONTACT_G_BUNDORUDO")) {		// Num9 = 21
			g_mine_bunndorudo = SetPointBoxEventMine_("mine_2_bunndorudo", false);
		}
		// ■アーザムークdemo 起動地雷
		else if (sky_num ==  GetFlagID_("CONST_SS_SK_GO_ICE_FIELD_SKY")				// Num9 = 24 or
			 || sky_num ==  GetFlagID_("CONST_SS_SK_CONTACT_G_AZAMUKU")) {			// Num9 = 27
			g_mine_azamuku = SetPointBoxEventMine_("mine_3_azamuku", false);
		}
		// ■イッタブルdemo 起動地雷
		else if (sky_num ==  GetFlagID_("CONST_SS_SK_GO_PRISON_SKY")				// Num9 = 30 or
			 || sky_num ==  GetFlagID_("CONST_SS_SK_CONTACT_G_ITTABURU")) {			// Num9 = 33
			g_mine_ittaburu = SetPointBoxEventMine_("mine_4_ittaburu", false);
		}
		// ■デスバーンdemo 起動地雷
		else if (sky_num ==  GetFlagID_("CONST_SS_SK_GO_VOLCANO_SKY")				// Num9 = 36 or
			 || sky_num ==  GetFlagID_("CONST_SS_SK_CONTACT_DEATH_PRO")) {			// Num9 = 39
			g_mine_purometeusu = SetPointBoxEventMine_("mine_5_purometeusu", false);
		}
		// ■ガルマザードdemo 起動地雷
		else if (sky_num ==  GetFlagID_("CONST_SS_SK_GO_CORE_SKY")					// Num9 = 42 or
			 || sky_num ==  GetFlagID_("CONST_SS_SK_CONTACT_GARUMAZARD")) {			// Num9 = 45
			g_mine_garumazado = SetPointBoxEventMine_("mine_6_garumazado", false);
		}
	}
	
	//---------------------------
	// ▼いつの間に高空徘徊用変数
	//---------------------------
	g_map_navi01 <- C_NONE_ID;	// 配置モンスターの場所に出す「！」アイコン

	if (GetEventFlg_("BFG_BOSS_ENABLE") == true ){
		if(GetEventFlg_("BFG_SCENARIO_CLEAR_ALL") == true){	// Bit_46 表シナリオクリア
			uReadSetSkyMapMonster();
		}
	}else{
		SetEventFlg_("BFG_W00_00_EVENT_BG_AMBI_012_PLAY", false);
	}

	
	EventEnd_();
}

//------------------------------------------------
//		フィールド操作開始
//------------------------------------------------
function EventStartOperate()
{
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");			// Num0
	sky_num		 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");		// Num9

	if (main_num == GetFlagID_("CONST_SM_SKY")) {										// Num0 = 8
		// 初めて高空マップに来た時にレナーテのメッセージを表示する
		if(GetEventFlg_("BFG_W00_1ST_MSG") == false){
			SetEventFlg_("BFG_W00_1ST_MSG", true);
			Wait_(20);
			// メッセージ表示
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_RENERTE");
			ShowMsg_("NPC_RENERTE_010");		// 「今……世界の大部分は　ガルビルスの放った
			KeyInputWait_();
			CloseMsgWnd_();
		}
		// ■巨大ボーショック 戦闘開始
		if (sky_num ==  GetFlagID_("CONST_SS_SK_PRE_BATTLE_G_BOWSHOCK")) {				// Num9 =  13
			SetNumFlg_(str_num_sub,  GetFlagID_("CONST_SS_SK_JDG_BATTLE_G_BOWSHOCK"));	// Num9 <- 14
			// VS.巨大ボーショック
			ChangeBattleParty_(22);
		}
		// 戦闘結果
		else if (sky_num ==  GetFlagID_("CONST_SS_SK_JDG_BATTLE_G_BOWSHOCK")			// Num9 =  14 or
			 || sky_num ==  GetFlagID_("CONST_SS_SK_JDG_REMATCH_G_BOWSHOCK")) {			// Num9 =  17
			SetNumFlg_(str_num_sub,  GetFlagID_("CONST_SS_SK_GO_GRAVE_SKY"));			// Num9 <- 18
			// 黒い花粉に覆われるフラグをOFFにする
			SetEventFlg_("BFG_WEATHER_BLACK_POLLEN_CITY", false);
			// 移動装置を使えるようにする
			SetEventFlg_("BFG_DONT_TRANSFER_GREEN_TO_CITY", false);	// 草原-崩落間の大陸移動装置の使用を禁止するフラグ
			// デモ再生後の復帰位置
			SetReturnDemoMap_("W00_00");
			SetReturnDemoPosDir_(Vec3(-1269, 0, 45465), 155);
			// Demo626[巨大ボーショック勝利：ボーショック死亡（高空MAP）]再生
			EventStartChangeDemo(626, FADE_COLOR_BLACK);
		}
		// ■巨大ブンドルド 戦闘開始
		else if (sky_num ==  GetFlagID_("CONST_SS_SK_PRE_BATTLE_G_BUNDORUDO")) {		// Num9 = 19
			SetNumFlg_(str_num_sub,  GetFlagID_("CONST_SS_SK_JDG_BATTLE_G_BUNDORUDO"));	// Num9 <- 20
			
			// VS.巨大ブンドルド
			ChangeBattleParty_(23);
		}
		// 戦闘結果
		else if (sky_num ==  GetFlagID_("CONST_SS_SK_JDG_BATTLE_G_BUNDORUDO")			// Num9 = 20 or
			 || sky_num ==  GetFlagID_("CONST_SS_SK_JDG_REMATCH_G_BUNDORUDO")) {		// Num9 = 23
			SetNumFlg_(str_num_sub,  GetFlagID_("CONST_SS_SK_GO_ICE_FIELD_SKY"));		// Num9 <- 24
			// 黒い花粉に覆われるフラグをOFFにする
			SetEventFlg_("BFG_WEATHER_BLACK_POLLEN_GRAVE", false);
			// 移動装置を使えるようにする
			SetEventFlg_("BFG_DONT_TRANSFER_CITY_TO_GRAVE", false);	// 崩落-霊道間の大陸移動装置の使用を禁止するフラグ
			// デモ再生後の復帰位置
			SetReturnDemoMap_("W00_00");
			SetReturnDemoPosDir_(Vec3(1399, 0, 22933), -153);
			// Demo629[巨大ブンドルド勝利：ブンドルド死亡（高空MAP）]再生
			EventStartChangeDemo(629, FADE_COLOR_BLACK);
		}
		// ■巨大アーザムーク 戦闘開始
		else if (sky_num ==  GetFlagID_("CONST_SS_SK_PRE_BATTLE_G_AZAMUKU")) {			// Num9 = 25
			SetNumFlg_(str_num_sub,  GetFlagID_("CONST_SS_SK_JDG_BATTLE_G_AZAMUKU"));	// Num9 <- 26
			
			// VS.巨大アーザムーク
			ChangeBattleParty_(24);
		}
		// 戦闘結果
		else if (sky_num ==  GetFlagID_("CONST_SS_SK_JDG_BATTLE_G_AZAMUKU")				// Num9 = 26 or
			 || sky_num ==  GetFlagID_("CONST_SS_SK_JDG_REMATCH_G_AZAMUKU")) {			// Num9 = 29
			SetNumFlg_(str_num_sub,  GetFlagID_("CONST_SS_SK_GO_PRISON_SKY"));			// Num9 <- 30
			// 黒い花粉に覆われるフラグをOFFにする
			SetEventFlg_("BFG_WEATHER_BLACK_POLLEN_ICE", false);
			// 移動装置を使えるようにする
			SetEventFlg_("BFG_DONT_TRANSFER_GRAVE_TO_ICE", false);	// 霊道-氷原間の大陸移動装置の使用を禁止するフラグ
			// デモ再生後の復帰位置
			SetReturnDemoMap_("W00_00");
			SetReturnDemoPosDir_(Vec3(-1229, 0, 1553), -171);
			// Demo632[巨大アーザムーク勝利：アーザムーク死亡（高空MAP）]再生
			EventStartChangeDemo(632, FADE_COLOR_BLACK);
		}
		// ■巨大イッタブル 戦闘開始
		else if (sky_num ==  GetFlagID_("CONST_SS_SK_PRE_BATTLE_G_ITTABURU")) {			// Num9 = 31
			SetNumFlg_(str_num_sub,  GetFlagID_("CONST_SS_SK_JDG_BATTLE_G_ITTABURU"));	// Num9 <- 32
			
			// VS.巨大イッタブル
			ChangeBattleParty_(25);
		}
		// 戦闘結果
		else if (sky_num ==  GetFlagID_("CONST_SS_SK_JDG_BATTLE_G_ITTABURU")			// Num9 = 32 or
			 || sky_num ==  GetFlagID_("CONST_SS_SK_JDG_REMATCH_G_ITTABURU")) {			// Num9 = 35
			SetNumFlg_(str_num_sub,  GetFlagID_("CONST_SS_SK_GO_VOLCANO_SKY"));			// Num9 <- 36
			// 黒い花粉に覆われるフラグをOFFにする
			SetEventFlg_("BFG_WEATHER_BLACK_POLLEN_SAND", false);
			// 移動装置を使えるようにする
			SetEventFlg_("BFG_DONT_TRANSFER_ICE_TO_SAND", false);	// 氷原-砂漠間の大陸移動装置の使用を禁止するフラグ
			// デモ再生後の復帰位置
			SetReturnDemoMap_("W00_00");
			SetReturnDemoPosDir_(Vec3(1124, 0, -21007), 165);
			// Demo636[巨大イッタブル勝利：イッタブル死亡（高空MAP）]再生
			EventStartChangeDemo(635, FADE_COLOR_BLACK);
		}
		// ■巨大デスバーン 戦闘開始
		else if (sky_num ==  GetFlagID_("CONST_SS_SK_PRE_BATTLE_DEATH_PRO")) {			// Num9 = 37
			SetNumFlg_(str_num_sub,  GetFlagID_("CONST_SS_SK_JDG_BATTLE_DEATH_PRO"));	// Num9 <- 38
			
			// VS.巨大デスバーン
			ChangeBattleParty_(26);
		}
		// 戦闘結果
		else if (sky_num ==  GetFlagID_("CONST_SS_SK_JDG_BATTLE_DEATH_PRO")				// Num9 = 38 or
			 || sky_num ==  GetFlagID_("CONST_SS_SK_JDG_REMATCH_DEATH_PRO")) {			// Num9 = 41
			SetNumFlg_(str_num_sub,  GetFlagID_("CONST_SS_SK_GO_CORE_SKY"));			// Num9 <- 42
			// 黒い花粉に覆われるフラグをOFFにする
			SetEventFlg_("BFG_WEATHER_BLACK_POLLEN_VOLCANO", false);
			// 移動装置を使えるようにする
			SetEventFlg_("BFG_DONT_TRANSFER_SAND_TO_VOLCANO", false);	// 砂漠-火山間の大陸移動装置の使用を禁止するフラグ
			// デモ再生後の復帰位置
			SetReturnDemoMap_("W00_00");
			SetReturnDemoPosDir_(Vec3(-1192, 0, -42768), 169);
			// Demo639[巨大デスバーン勝利：デスバーン死亡（高空MAP）]再生
			EventStartChangeDemo(639, FADE_COLOR_BLACK);
		}
		// ■ガルマザード 戦闘開始
		else if (sky_num ==  GetFlagID_("CONST_SS_SK_PRE_BATTLE_GARUMAZARD")) {			// Num9 = 43
			SetNumFlg_(str_num_sub,  GetFlagID_("CONST_SS_SK_JDG_BATTLE_GARUMAZARD"));	// Num9 <- 44
			
			// VS.ガルマザード
			ChangeBattleParty_(27);
		}
		// ■ガルマザード 再戦開始
		else if (sky_num ==  GetFlagID_("CONST_SS_SK_PRE_REMATCH_GARUMAZARD")) {		// Num9 = 46
			SetNumFlg_(str_num_sub,  GetFlagID_("CONST_SS_SK_JDG_REMATCH_GARUMAZARD"));	// Num9 <- 47
			
			// VS.ガルマザード
			ChangeBattleParty_(27);
		}
		// 戦闘結果
		// ■Demo642[ガルマザード勝利：コア高空MAP]再生
		else if (sky_num ==  GetFlagID_("CONST_SS_SK_JDG_BATTLE_GARUMAZARD")			// Num9 = 44 or
			 || sky_num ==  GetFlagID_("CONST_SS_SK_JDG_REMATCH_GARUMAZARD")) {			// Num9 = 47
			SetNumFlg_(str_num_sub,  GetFlagID_("CONST_SS_SK_WIN_GARUMAZARD_1"));		// Num9 <- 48
			// コアマップでのフライトシグナル使用禁止を解除
			SetEventFlg_("BFG_FLIGHT_PROHIBIT", false);
			// 移動装置を使えるようにする
			SetEventFlg_("BFG_DONT_TRANSFER_VOLCANO_TO_CORE", false);	// 火山-コア間の大陸移動装置の使用を禁止するフラグ
			// 全回復処理
			RecoverAll_();
			EventStartChangeDemo(642, FADE_COLOR_BLACK);//仮 demo642
		}
		// ■Demo643[ガルマザード戦勝利：天変地異①]再生
		else if (sky_num ==  GetFlagID_("CONST_SS_SK_WIN_GARUMAZARD_1")) {				// Num9 = 48
			SetNumFlg_(str_num_sub,  GetFlagID_("CONST_SS_SK_WIN_GARUMAZARD_2"));		// Num9 <- 49
			EventStartChangeDemo(643, FADE_COLOR_BLACK);
		}
		// ■Demo644[ガルマザード戦勝利：天変地異②]再生
		else if (sky_num ==  GetFlagID_("CONST_SS_SK_WIN_GARUMAZARD_2")) {				// Num9 = 49
			SetNumFlg_(str_num_sub,  GetFlagID_("CONST_SS_SK_WIN_GARUMAZARD_3"));		// Num9 <- 50
			EventStartChangeDemo(644, FADE_COLOR_BLACK);
		}
		// ■Demo645[ガルマザード戦勝利：天変地異③]再生
		else if (sky_num ==  GetFlagID_("CONST_SS_SK_WIN_GARUMAZARD_3")) {				// Num9 = 50
			SetNumFlg_(str_num_sub,  GetFlagID_("CONST_SS_SK_WIN_GARUMAZARD_4"));		// Num9 <- 51
			EventStartChangeDemo(645, FADE_COLOR_BLACK);
		}
		// ■Demo646[ガルマザード戦勝利：コアMap]再生
		else if (sky_num ==  GetFlagID_("CONST_SS_SK_WIN_GARUMAZARD_4")) {				// Num9 = 51
			SetNumFlg_(str_num_sub,  GetFlagID_("CONST_SS_SK_WIN_GARUMAZARD_5"));		// Num9 <- 52
			EventStartChangeDemo(646, FADE_COLOR_BLACK);
		}
		// ■Demo647[ガルマザード戦勝利：天変地異回復①]再生
		else if (sky_num ==  GetFlagID_("CONST_SS_SK_WIN_GARUMAZARD_5")) {				// Num9 = 52
			SetNumFlg_(str_num_sub,  GetFlagID_("CONST_SS_SK_WIN_GARUMAZARD_6"));		// Num9 <- 53
			EventStartChangeDemo(647, FADE_COLOR_BLACK);
		}
		// ■Demo648[ガルマザード戦勝利：天変地異回復②]再生
		else if (sky_num ==  GetFlagID_("CONST_SS_SK_WIN_GARUMAZARD_6")) {				// Num9 = 53
			SetNumFlg_(str_num_sub,  GetFlagID_("CONST_SS_SK_WIN_GARUMAZARD_7"));		// Num9 <- 54
			SetFade_(FADE_OUT, FADE_COLOR_WHITE, FADE_SHORT);
			SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
			WaitFade_();
			ChangeDemo_(648);
		}
		// ■Demo649[ガルマザード戦勝利：天変地異回復③]再生
		else if (sky_num ==  GetFlagID_("CONST_SS_SK_WIN_GARUMAZARD_7")) {				// Num9 = 54
			SetNumFlg_(str_num_sub,  GetFlagID_("CONST_SS_SK_WIN_GARUMAZARD_8"));		// Num9 <- 55
			SetFade_(FADE_OUT, FADE_COLOR_WHITE, FADE_SHORT);
			SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
			WaitFade_();
			ChangeDemo_(649);
		}
		// ■Demo650[ガルマザード戦勝利：コアMap]（主人公が光に包まれてる）再生
		else if (sky_num ==  GetFlagID_("CONST_SS_SK_WIN_GARUMAZARD_8")) {				// Num9 = 55
			SetNumFlg_(str_num_sub,  GetFlagID_("CONST_SS_SK_PLAY_STAFFROLL"));			// Num9 <- 56
			EventStartChangeDemo(650, FADE_COLOR_BLACK);
		}
		// ■Demo651[スタッフロール]再生
		else if (sky_num ==  GetFlagID_("CONST_SS_SK_PLAY_STAFFROLL")) {				// Num9 = 56
			// フェードアウト
			SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
			SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
			SetNumFlg_(str_num_sub,  GetFlagID_("CONST_SS_SK_PLAY_HERALD_DEMO"));		// Num9 <- 57
			ChangeEndRoll_();
		}
		// ■Demo652[予兆]再生
		else if (sky_num ==  GetFlagID_("CONST_SS_SK_PLAY_HERALD_DEMO")) {				// Num9 = 57
			SetNumFlg_(str_num_sub,  GetFlagID_("CONST_SS_SK_DATA_SAVED"));				// Num9 <- 58

			//時空の裂け目レベルを上げる（メタルエリアも含むためココ）
			SetNumFlg_( "NUM_FLG_CRACK_LEVEL", 3 );

			// セーブポイントを挟むためのフラグ
			SetEventFlg_("BFG_SAVE_POINT_FLAG", true);
			// デモ再生後の復帰位置
			SetReturnDemoMap_("H00_00");
			SetReturnDemoPosDir_(Vec3(-80.0, 197.0, 260.0), -154);
			// Demo[予兆]再生
			EventStartChangeDemo(652, FADE_COLOR_BLACK);
		}
	}
	
	// いつの間に高空徘徊用
	if(GetEventFlg_("BFG_BOSS_MONSTER_BATTLE_START")){
		uBossSkyMonsterAfterBattleTalk();
	} else {
		// 戦闘後ではなく、高空徘徊が設定されている時に、初回察知メッセージを出す
		if(g_sky_monster_npc != C_NONE_ID){
			if(GetEventFlg_("BFG_ITSUNOMANI_FIRST_MSG") == true){
				uBossSkyMonsterInitTalk();
			}
		}
	}

	EventEnd_()
}

//------------------------------------------------
//		ＮＰＣ接触時
//------------------------------------------------
function TouchNpc()
{
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");			// Num0
	sky_num		 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");		// Num9
	
	local target = GetTargetId_();

	EventEnd_();
}

//------------------------------------------------
//		地雷接触時
//------------------------------------------------
function TouchEventMine()
{
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");			// Num0
	sky_num		 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");		// Num9

	local target = GetTouchEventMineId_();
	
	switch (target) {
	case g_mine_boshoku :
		uMineBoshoku();
		break;
	case g_mine_bunndorudo :
		uMineBunndorudo();
		break;
	case g_mine_azamuku :
		uMineAzamuku();
		break;
	case g_mine_ittaburu :
		uMineIttaburu();
		break;
	case g_mine_purometeusu :
		uMinePurometeusu();
		break;
	case g_mine_garumazado :
		uMineGarumazado();
		break;
	case g_sky_monster_talk_mine:
		uMineBossSkyMonster();
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
//		ボーショックdemo 起動地雷に触れた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineBoshoku()
{
	if (main_num == GetFlagID_("CONST_SM_SKY")) {										// Num0 = 8
		if (sky_num == GetFlagID_("CONST_SS_SK_GO_CITY_SKY")) {							// Num9 = 12
			DeleteEventMine_(g_mine_boshoku);
			SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_SK_PRE_BATTLE_G_BOWSHOCK"));	// Num9 = 13
			
			// Demo625「巨大ボーショック」再生
			StopBgmChangeDemo(625);
		}
		else if (sky_num ==  GetFlagID_("CONST_SS_SK_CONTACT_G_BOWSHOCK")){				// Num9 = 15
			DeleteEventMine_(g_mine_boshoku);
			SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_SK_JDG_REMATCH_G_BOWSHOCK"));	// Num9 = 17

			// VS.巨大ボーショック
			ChangeBattleParty_(145);
		}
	}

}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		ブンドルドdemo 起動地雷に触れた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineBunndorudo()
{
	if (main_num == GetFlagID_("CONST_SM_SKY")) {										// Num0 = 8
		if (sky_num ==  GetFlagID_("CONST_SS_SK_GO_GRAVE_SKY")) {						// Num9 = 18
			DeleteEventMine_(g_mine_bunndorudo);
			SetNumFlg_(str_num_sub,  GetFlagID_("CONST_SS_SK_PRE_BATTLE_G_BUNDORUDO"));	// Num9 <- 19
			
			// Demo628「巨大ブンドルド」再生
			StopBgmChangeDemo(628);
		}
		else if (sky_num ==  GetFlagID_("CONST_SS_SK_CONTACT_G_BUNDORUDO")){			// Num9 <- 21
			DeleteEventMine_(g_mine_bunndorudo);
			SetNumFlg_(str_num_sub,  GetFlagID_("CONST_SS_SK_JDG_REMATCH_G_BUNDORUDO"));// Num9 <- 23

			// VS.巨大ブンドルド
			ChangeBattleParty_(146);
		}
	}

}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		アーザムークdemo 起動地雷に触れた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineAzamuku()
{
	if (main_num == GetFlagID_("CONST_SM_SKY")) {										// Num0 = 8
		if (sky_num ==  GetFlagID_("CONST_SS_SK_GO_ICE_FIELD_SKY")) {					// Num9 = 24
			DeleteEventMine_(g_mine_azamuku);
			SetNumFlg_(str_num_sub,  GetFlagID_("CONST_SS_SK_PRE_BATTLE_G_AZAMUKU"));	// Num9 <- 25
			
			// Demo631「巨大アーザムーク」再生
			StopBgmChangeDemo(631);
		}
		else if (sky_num ==  GetFlagID_("CONST_SS_SK_CONTACT_G_AZAMUKU")){				// Num9 <- 27
			DeleteEventMine_(g_mine_azamuku);
			SetNumFlg_(str_num_sub,  GetFlagID_("CONST_SS_SK_JDG_REMATCH_G_AZAMUKU"));	// Num9 <- 29

			// VS.巨大アーザムーク
			ChangeBattleParty_(147);
		}
	}

}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		イッタブルdemo 起動地雷に触れた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineIttaburu()
{
	if (main_num == GetFlagID_("CONST_SM_SKY")) {										// Num0 = 8
		if (sky_num ==  GetFlagID_("CONST_SS_SK_GO_PRISON_SKY")) {						// Num9 = 30
			DeleteEventMine_(g_mine_ittaburu);
			SetNumFlg_(str_num_sub,  GetFlagID_("CONST_SS_SK_PRE_BATTLE_G_ITTABURU"));	// Num9 <- 31
			
			// Demo634「巨大イッタブル」再生
			StopBgmChangeDemo(634);
		}
		else if (sky_num ==  GetFlagID_("CONST_SS_SK_CONTACT_G_ITTABURU")){				// Num9 <- 33
			DeleteEventMine_(g_mine_ittaburu);
			SetNumFlg_(str_num_sub,  GetFlagID_("CONST_SS_SK_JDG_REMATCH_G_ITTABURU"));	// Num9 <- 35

			// VS.巨大イッタブル
			ChangeBattleParty_(148);
		}
	}

}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		デスバーンdemo 起動地雷に触れた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMinePurometeusu()
{
	if (main_num == GetFlagID_("CONST_SM_SKY")) {										// Num0 = 8
		if (sky_num ==  GetFlagID_("CONST_SS_SK_GO_VOLCANO_SKY")) {						// Num9 = 36
			DeleteEventMine_(g_mine_purometeusu);
			SetNumFlg_(str_num_sub,  GetFlagID_("CONST_SS_SK_PRE_BATTLE_DEATH_PRO"));	// Num9 <- 37
			
			// Demo638「巨大デスバーン」再生
			StopBgmChangeDemo(638);
		}
		else if (sky_num ==  GetFlagID_("CONST_SS_SK_CONTACT_DEATH_PRO")){				// Num9 <- 39
			DeleteEventMine_(g_mine_purometeusu);
			SetNumFlg_(str_num_sub,  GetFlagID_("CONST_SS_SK_JDG_REMATCH_DEATH_PRO"));	// Num9 <- 41

			// VS.巨大デスバーン
			ChangeBattleParty_(149);
		}
	}

}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		ガルマザードdemo 起動地雷に触れた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineGarumazado()
{
	if (main_num == GetFlagID_("CONST_SM_SKY")) {										// Num0 = 8
		if (sky_num ==  GetFlagID_("CONST_SS_SK_GO_CORE_SKY")) {						// Num9 = 42
			DeleteEventMine_(g_mine_garumazado);
			SetNumFlg_(str_num_sub,  GetFlagID_("CONST_SS_SK_PRE_BATTLE_GARUMAZARD"));	// Num9 <- 43
			
			// Demo641「ガルマザード」再生
			StopBgmChangeDemo(641);
		}
		else if (sky_num ==  GetFlagID_("CONST_SS_SK_CONTACT_GARUMAZARD")){				// Num9 <- 45
			DeleteEventMine_(g_mine_garumazado);
			SetNumFlg_(str_num_sub,  GetFlagID_("CONST_SS_SK_PRE_REMATCH_GARUMAZARD"));	// Num9 <- 46

			// Demo651「ガルマザード再戦」再生
			StopBgmChangeDemo(651);
		}
	}
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		いつの間に高空徘徊用NPC・地雷設置
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uReadSetSkyMapMonster()
{
	// エフェクトが消える距離
	local effectDelDist = [
		1500,
		2000,
		2500,
		3000,
		3500,
	];

	// ランダム配置用ノード名
	local fbxName = [
		"mine_boss_0",
		"mine_boss_1",
		"mine_boss_2",
		"mine_boss_3",
		"mine_boss_4",
		"mine_boss_5",
	];

	// いつの間にデータを読みこめたとき
	if (BossLoadNewSkyMapMonsterData_())
	{
		// 初回メッセージフラグを立てる
		SetEventFlg_("BFG_ITSUNOMANI_FIRST_MSG", true);
		
		g_random <- GetRandom_(6);	// グローバル変数で扱う
//		g_random = 0;				// デバッグ用
		DebugPrint("いつの間に高空徘徊NPCは [" + (g_random + 1) + "] に設置されました");
		
		local skyMonsterResId = ReadNpc_(BossGetSkyMapMonsterResName_());
		g_sky_monster_npc = ArrangePointNpc_(skyMonsterResId, fbxName[g_random]);
		SetScaleSilhouette(g_sky_monster_npc, SCALE.BOSS_SKY, SILHOUETTE_WIDTH.T);
		SetVisible(g_sky_monster_npc, true);
		SetPointPosNoFit_(g_sky_monster_npc, fbxName[g_random]);	// 地面より下に置きたいので、SetPointPosNoFit_で置きなおす
		
		// モンスター情報設定（リアクターで調べた時モンスター情報が出るように）
		BossSetupSkyMapMonsterNPC_(g_sky_monster_npc);
		// 地雷設置
		g_sky_monster_talk_mine = SetPointCircleEventMine_(fbxName[g_random], false);
		
		// だんだんエフェクトが少なくなるように消える距離を変えた同じエフェクトを設定
		for(local i = 0; i < 5; i++){
			AddNearPlayerStopEffect_(g_sky_monster_npc, effectDelDist[i], "ef300_50_thundercloud01", ATTACH_EFFECT2);
		}
		// 最後までNPCに残っているエフェクト
		LoadEffect_("ef300_56_thundercloud02");
		SetSelectBoneEffect_("ef300_56_thundercloud02", g_sky_monster_npc, ATTACH_EFFECT2);
		
		// ナビマップアイコン設置
		g_map_navi01 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.MONSTER, fbxName[g_random]);
		SetNaviMapIconVisible_(g_map_navi01, false);
		
		// ナビマップを高空用に変更
		SetDispFlightMap_(true);
		
		// BGMを変更
		SetEventFlg_("BFG_W00_00_EVENT_BG_AMBI_012_PLAY", true);
		
	// いつの間にデータが無い時
	} else {
		SetEventFlg_("BFG_W00_00_EVENT_BG_AMBI_012_PLAY", false);
	}
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		いつの間に高空徘徊 地雷起動時会話
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineBossSkyMonster()
{
	local player = GetPlayerId_();
	local mons_num = GetFreeMonsterNum_();
	if(mons_num >= 1){	// 空きがあったら戦闘
		SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
		SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
		WaitFade_();
		
		SetVisible(player, false);
		SetCameraEye_(BossGetTalkCameraEye_(g_sky_monster_npc));
		SetCameraTarget_(BossGetTalkCameraTarget_(g_sky_monster_npc));
		
		SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
		WaitFade_();

		OpenMsgWnd_();
			local kindId = BossGetSkyMapMonsterKindId_();
			SetExchangeMonsterKindName_(kindId);
			ShowMsg_("BOSS_EVENT_MSG_01");
			KeyInputWait_();
		CloseMsgWnd_();
		
		// 「はい」
		if(GetQueryResult_() == QUERY2_0){
			// 戦闘モーション
			SetMotion_(g_sky_monster_npc, MOT_ATTACK, BLEND_N);
			Wait_(30);
			SetEventFlg_("BFG_BOSS_MONSTER_BATTLE_START", true);
			BossSetupSkyMapMonsterParty_();
			ChangeBattlePartyUseHitMap_(BossGetSkyMapMonsterPartyID_());
			DeleteEventMine_(g_sky_monster_talk_mine);
			g_sky_monster_talk_mine = C_NONE_ID;
		}
		// 「いいえ」
		else{
			// 乱数の値を見て復帰場所を変える
			switch (g_random) {
			case 0 :
				uPlayableReset(250.0, 0.0, 60000.0, 180);
				break;
			case 1 :
				uPlayableReset(250.0, 0.0, 38000.0, 180);
				break;
			case 2 :
				uPlayableReset(250.0, 0.0, 15000.0, 180);
				break;
			case 3 :
				uPlayableReset(250.0, 0.0, -7000.0, 180);
				break;
			case 4 :
				uPlayableReset(250.0, 0.0, -30000.0, 180);
				break;
			case 5 :
				uPlayableReset(250.0, 0.0, -51000.0, 180);
				break;
			default :
				DebugPrint("WARNING : g_randomの値が不正です");
				break;
			}
		}
	}
	else{
		OpenMsgWnd_();
		ShowMsg_("BOSS_EVENT_MSG_00");
		KeyInputWait_();
		CloseMsgWnd_();
		CommPlayerTurnMoveDirWalk(-30);	// 反対向きに戻る
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		いつの間に高空徘徊 初回察知メッセージ
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uBossSkyMonsterInitTalk()
{
	// 初回メッセージフラグを降ろす
	SetEventFlg_("BFG_ITSUNOMANI_FIRST_MSG", false);
	// メッセージ表示
	OpenMsgWnd_();
		SetTalkName_("NAME_TAG_REACTOR");
		SetNaviMapIconVisible_(g_map_navi01, true);
		ShowMsg_("BOSS_RECEIVE_MSG_00");	// 高空エリア内に　異様なモンスターを察知しました。
		KeyInputWait_();
	CloseMsgWnd_();
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		いつの間に高空徘徊 戦闘終了後処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uBossSkyMonsterAfterBattleTalk()
{
	SetMotion_(g_sky_monster_npc, MOT_WAIT, BLEND_N);
	local player = GetPlayerId_();
	
	if(GetBattleEndType_() == END_TYPE_WIN){
		// フェードイン
		SetCameraEye_(BossGetTalkCameraEye_(g_sky_monster_npc));
		SetCameraTarget_(BossGetTalkCameraTarget_(g_sky_monster_npc));
		
		SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
		WaitFade_();
		
		// 仲間にするかどうかメッセージ
		OpenMsgWnd_();
			uBossAddFellow();
		CloseMsgWnd_();
		
		// モンスターをフェードアウト
		SetManualCalcAlpha_(g_sky_monster_npc, true);
		local task_fade = Task_ObjectFadeOut_(g_sky_monster_npc, FADE_DEF);
		WaitTask(task_fade);
		
		BossSetReadFlagToSkyMapMonster_();	// いつの間に高空徘徊モンスターのデータを既読にする
		
		// フェードアウト
		// マップチェンジ後にBGM設定のフラグを変更するため
		// 自動でBGMがフェードしない
		// そのため、スクリプトで画面フェードに合わせてBGMをフェードさせる
		FieldBgmStop_(FADE_MAPCHANGE);
		SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
		WaitFade_();
		
		// プレイヤーを映す
		SetVisible(player, true);
		// 配置したモンスターＮＰＣを削除するためにマップチェンジ
		ChangeMapPosDir_(MAP_ID, GetPos_(player), GetDir_(player));
	}
	SetEventFlg_("BFG_BOSS_MONSTER_BATTLE_START", false);
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		いつの間に高空徘徊 仲間加入フロー
//------------------------------------------------
//	引数	: なし
//	戻り値	: 終了したかどうか
//++++++++++++++++++++++++++++++++++++++++++++++++
function uBossAddFellow()
{
	local kindId = BossGetSkyMapMonsterKindId_();
	SetExchangeMonsterKindName_(kindId);
	SetExchangeMonsterKindName_(kindId);
	ShowMsg_("BOSS_ADDFELLOW_MSG_00");			// なんと　<exchange/>が　おきあがり
	KeyInputWait_();
	
	// 「はい」
	if(GetQueryResult_() == QUERY2_0){
		CloseMsgWnd_();
		
		// メッセージ
		OpenMsgWnd_();
			local kindId = BossGetSkyMapMonsterKindId_();
			SetExchangeMonsterKindName_(kindId);
			ShowMsg_("BOSS_ADDFELLOW_MSG_01");	// <exchange/>が　仲間になった！
			// 仲間ME(重要アイテム取得と同じ)
			PlayMe_("ME_010");
			WaitMe_();
			KeyInputWait_();
		CloseMsgWnd_();
		
		// モンスター加入処理
		local task_fellow = Task_BossSkyMapMonsterAddFellow_();	//モンスター加入処理
		WaitTask(task_fellow);
		// モンスターをフェードアウト
		SetManualCalcAlpha_(g_sky_monster_npc, true);
		local task_fade = Task_ObjectFadeOut_(g_sky_monster_npc, FADE_DEF);
		WaitTask(task_fade);
	}
	// 「いいえ」
	else{
		uBossNoAddFellow();
	}
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		いつの間に高空徘徊 仲間加入を拒否した際の処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uBossNoAddFellow()
{
	local kindId = BossGetSkyMapMonsterKindId_();
	SetExchangeMonsterKindName_(kindId);
	ShowMsg_("BOSS_NOTFELLOW_MSG_00");		// 「仲間にしなくて　本当によろしいでしょうか？
	KeyInputWait_();
	// 「はい」
	if(GetQueryResult_() == QUERY2_0){
		SetExchangeMonsterKindName_(kindId);
		ShowMsg_("BOSS_NOTFELLOW_MSG_01");	// 「<exchange/>は　さみしそうに帰って行きました。
		KeyInputWait_();
	}
	// 「いいえ」
	else{
		uBossAddFellow()
	}
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

