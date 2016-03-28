//===================== C00_03コア 最深部 ====================

// 変数定義
main_num	 <- C_NONE_ID;
core_num	 <- C_NONE_ID;
sky_num		 <- C_NONE_ID;
outside_num	 <- C_NONE_ID;

main_num_sub <- "NUM_SCENARIO_MAIN";
core_num_sub <- "NUM_SCENARIO_SUB_CORE";
sky_num_sub	 <- "NUM_SCENARIO_SUB_SKY";
outside_num_sub <- "NUM_SCENARIO_SUB_INSIDE_CLEAR";

//------------------------------------------------
//		戦闘終了後
//------------------------------------------------
function AfterBattle()
{
	// フラグの状態を取得
	main_num = GetNumFlg_("NUM_SCENARIO_MAIN");		// Num0
	core_num = GetNumFlg_("NUM_SCENARIO_SUB_CORE");	// Num8
	sky_num	 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");	// Num9
	outside_num = GetNumFlg_("NUM_SCENARIO_SUB_INSIDE_CLEAR");	// Num10
	
	// ボス戦に負けた時にNUMフラグを変更する処理（要注意）
	// イベントブロックのEventStartOperate()では敗北を判定できないので
	// ここで敗北の判定とフラグ変更を行う。
	
	// ■[カシャロット＆アパデマク戦]
	if(main_num == GetFlagID_("CONST_SM_CORE")){											// Num0 = 7
		if(core_num == GetFlagID_("CONST_SS_CO_JDG_BATTLE_DARK_MASTER")						// Num8 = 8 (初戦時)
		|| core_num == GetFlagID_("CONST_SS_CO_JDG_REMATCH_DARK_MASTER")){					// Num8 = 11(再戦時)
			// 敗北
			if(GetBattleEndType_() == END_TYPE_LOSE){
				SetNumFlg_(core_num_sub, GetFlagID_("CONST_SS_CO_CONTACT_DARK_MASTER"));	// Num8 = 9
				SetEventFlg_("BFG_C00_03_EVENT_BGM008_PLAY", true);							// Bit664 : C00_03 BGM_008 を流す
			// 勝利
			}else{
				// 勝利判定はEventStartOperate()内で行う
			}
		}
	}
	// ■[ガルビルス戦]
	if(main_num == GetFlagID_("CONST_SM_CORE")){											// Num0 = 7
		if(core_num == GetFlagID_("CONST_SS_CO_JDG_BATTLE_GARUBIRUSU")						// Num8 = 14(初戦時)
		|| core_num == GetFlagID_("CONST_SS_CO_JDG_REMATCH_GARUBIRUSU")){					// Num8 = 17(再戦時)
			// 敗北
			if(GetBattleEndType_() == END_TYPE_LOSE){
				SetNumFlg_(core_num_sub, GetFlagID_("CONST_SS_CO_CONTACT_GARUBIRUSU"));		// Num8 = 15
			// 勝利
			}else{
				// 勝利判定はEventStartOperate()内で行う
			}
		}
	}
	// ■[ダースガルマ]
	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){							// Num 0 = 9
		// ダースガルマ[その１]・[その２]・[その３]
		if(outside_num == GetFlagID_("CONST_SS_OS_JDG_BATTLE_DARTHGARUMA")			// Num10 = 15(初戦時)
		|| outside_num == GetFlagID_("CONST_SS_OS_JDG_REMATCH_DARTHGARUMA")			// Num10 = 18([その１]再戦時)
		|| outside_num == GetFlagID_("CONST_SS_OS_JDG_REMATCH_DARTH_2")				// Num10 = 23([その２]再戦時)
		|| outside_num == GetFlagID_("CONST_SS_OS_JDG_REMATCH_DARTH_3")){			// Num10 = 28([その３]再戦時)
			// 敗北
			if(GetBattleEndType_() == END_TYPE_LOSE){
				// 戦闘で何段階まで変身したかを取得
				local get_flg_num = GetNumFlg_("NUM_FLG_COUNT_UP_DEMO_834");
				local set_flg_id;
				switch(get_flg_num)
				{
				// 初期
				case 0:
					set_flg_id ="CONST_SS_OS_CONTACT_DARTHGARUMA";
					break;
				// 手生え
				case 1:
					set_flg_id ="CONST_SS_OS_CONTACT_DARTH_2";
					break;
				// 頭生え
				case 2:
					set_flg_id ="CONST_SS_OS_CONTACT_DARTH_3";
					break;
				default:
					// それ以外は初期に戻す
					set_flg_id ="CONST_SS_OS_CONTACT_DARTHGARUMA";
					break;
				}
				SetNumFlg_(outside_num_sub, GetFlagID_(set_flg_id));	// Num10 = 16
			// 勝利
			}else{
				// 勝利判定はEventStartOperate()内で行う
			}
		}
	}
	// ■[ダグジャガルマ]
	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){									// Num 0 = 9
		// ダグジャガルマ
		if(outside_num == GetFlagID_("CONST_SS_OS_JDG_BATTLE_DAGJAGARUMA")					// Num10 = 30(初戦時)
		|| outside_num == GetFlagID_("CONST_SS_OS_JDG_REMATCH_DAGJAGARUMA")){				// Num10 = 33(再戦時)
			// 敗北
			if(GetBattleEndType_() == END_TYPE_LOSE){
				SetNumFlg_(outside_num_sub, GetFlagID_("CONST_SS_OS_CONTACT_DAGJAGARUMA"));	// Num10 = 31
			// 勝利
			}else{
				// 勝利判定はEventStartOperate()内で行う
			}
		}
	}
	
	
	EventEnd_();
}


//------------------------------------------------
//		マップに入る前
//------------------------------------------------
function BeforeInitMap()
{
	main_num = GetNumFlg_("NUM_SCENARIO_MAIN");		// Num0
	core_num = GetNumFlg_("NUM_SCENARIO_SUB_CORE");	// Num8
	sky_num	 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");	// Num9
	outside_num = GetNumFlg_("NUM_SCENARIO_SUB_INSIDE_CLEAR");	// Num10
	
	// ■裏シナリオ Demo828[ダースガルマに勝利]再生後のタイミングでライド解除
	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){
		if(outside_num == GetFlagID_("CONST_SS_OS_EXAMINE_STAR_SEED")){
			//ライド強制解除
			SetRideOffStart_();
		}
	}
	
	EventEnd_();
}


//------------------------------------------------
//		フェードアウト中
//------------------------------------------------
function FadeIn()
{
	//変数定義
	local	player;
	
	main_num = GetNumFlg_("NUM_SCENARIO_MAIN");		// Num0
	core_num = GetNumFlg_("NUM_SCENARIO_SUB_CORE");	// Num8
	sky_num	 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");	// Num9
	outside_num = GetNumFlg_("NUM_SCENARIO_SUB_INSIDE_CLEAR");	// Num10
	player	 = GetPlayerId_();
	
	DebugPrint(" ");
	DebugPrint("NUM_SCENARIO_MAIN の値は " + main_num + " になりました。");
	DebugPrint("NUM_SCENARIO_SUB_CORE の値は " + core_num + " になりました。");
	
	
	//---------------
	// ▼ギミック配置
	//---------------
	// マザー
	local id_mother02  = ReadGimmick_("o_C03_02");	// マザー
	local id_mother03  = ReadGimmick_("o_C03_03");	// マザー飾り
	
	// ガルビルス撃破前は肉付きを配置(撃破後は配置なし)
	if (main_num <= GetFlagID_("CONST_SM_CORE")) {								// Num0 = 7 以下
		local gim_mother02 = ArrangePointGimmick_("o_C03_02", id_mother02, "gim_mother");
		SetMotion_(gim_mother02, MOT_GIMMICK_0, BLEND_N); // マザー(肉あり)
		local gim_mother03 = ArrangePointGimmick_("o_C03_03", id_mother03, "gim_mother");
	}
	// ガルビルス戦後～ガルマザード戦終了までマザー本体を配置しない(ガルマザードとマザーが融合している為)
	if (main_num == GetFlagID_("CONST_SM_SKY")) {								// Num0 = 8 
		local gim_mother03 = ArrangePointGimmick_("o_C03_03", id_mother03, "gim_mother");
	}
	// 表シナリオクリア後(裏シナリオ中)は肉無しを配置
	if (main_num >= GetFlagID_("CONST_SM_INSIDE_CLEAR")) {						// Num0 = 9 以上
		local gim_mother02 = ArrangePointGimmick_("o_C03_02", id_mother02, "gim_mother");
		SetMotion_(gim_mother02, MOT_GIMMICK_1, BLEND_N); // マザー(肉なし)
		local gim_mother03 = ArrangePointGimmick_("o_C03_03", id_mother03, "gim_mother");
	}
	
	// スターシード
	star_seed <- C_NONE_ID;
	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){					// Num 0 = 9
		if(outside_num == GetFlagID_("CONST_SS_OS_EXAMINE_STAR_SEED")){		// Num10 = 34
			// スターシード
			LoadEffect_("ef732_26_star_seed_base02");
			star_seed = SetPointWorldEffect_("ef732_26_star_seed_base02", "ef_star_piece");
			SetEffectScale_(star_seed, 0.45);
		}
	}
	
	//----------
	// ▼NPC配置
	//----------
	// ID初期化
	g_npc_renerte		 <- C_NONE_ID;
	g_npc_garubirusu	 <- C_NONE_ID;
	g_npc_garuma		 <- C_NONE_ID;
	g_npc_aroma			 <- C_NONE_ID;
	
	// リソース読み込み
	local id_renerte	 = ReadNpc_("n007");	// レナーテ
	
	// ■レナーテ
	if(main_num == GetFlagID_("CONST_SM_CORE")){								// Num0 = 7
		if(core_num >= GetFlagID_("CONST_SS_CO_APPROACH_RENATE")){				// Num8 = 12 以上
			g_npc_renerte = ArrangePointNpc_(id_renerte, "npc_renerte");
			SetVisible(g_npc_renerte, true);
			SetTalkEnable_(g_npc_renerte, false);								//会話アイコン非表示
			SetReactorMsg_(g_npc_renerte, "NPC_RENATE_010");
		}
	}
	// ■ガルビルス(再戦)
	if(main_num == GetFlagID_("CONST_SM_CORE")){
		if(core_num == GetFlagID_("CONST_SS_CO_CONTACT_GARUBIRUSU")){
			local id_boss = ReadNpc_("m184_00"); // ガルビルス
			g_npc_garubirusu = ArrangePointNpc_(id_boss, "npc_boss");
			SetVisible(g_npc_garubirusu, true);
			// サイズ
			SetScaleSilhouette(g_npc_garubirusu, SCALE.G, SILHOUETTE_WIDTH.G);
			SetTalkEnable_(g_npc_garubirusu, false);
			SetReactorMsg_(g_npc_garubirusu, "NPC_GARUBIRUSU_REC");
		}
	}
	// ■レナーテ(裏シナリオ用、救出してもらうまで配置)
	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){					// Num 0 == 9
		if(outside_num <= GetFlagID_("CONST_SS_OS_EXAMINE_STAR_SEED")){		// Num10 34以下
			g_npc_renerte = ArrangePointNpc_(id_renerte, "npc_renerte_in_mother");
			SetVisible(g_npc_renerte, true);
			SetPointPosNoFit_(g_npc_renerte, "npc_renerte_in_mother");
			SetTalkEnable_(g_npc_renerte, false);
			SetReactorMsg_(g_npc_renerte, "NPC_RENATE_010");
			SetFace_(g_npc_renerte, "Face_loop_close");
			// 非常駐モーション
			local renerte_mother = ReadMotion_(g_npc_renerte, "n007_mother_L");
			SetMotion_(g_npc_renerte, renerte_mother, BLEND_N);
		}
	}
	
	// ■ダースガルマ
	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){						// Num 0 = 9
		// ダースガルマ[その１]
		if(outside_num == GetFlagID_("CONST_SS_OS_CONTACT_DARTHGARUMA")){		// Num10 = 16
			local id_boss1 = ReadNpc_("m180_00"); // ダースガルマ
			g_npc_garuma = ArrangePointNpc_(id_boss1, "npc_ura_boss");
			// NPCモデルのメッシュ表示
			SetMeshVisible_(g_npc_garuma, "Model",       true); // 本体
			SetMeshVisible_(g_npc_garuma, "cover",       true); // 割れていないカバー
			SetMeshVisible_(g_npc_garuma, "breakCover", false); // 割れているカバー
			SetMeshVisible_(g_npc_garuma, "arm",        false); // 腕
			SetMeshVisible_(g_npc_garuma, "head",       false); // 頭(竜)
			// サイズ
			SetScaleSilhouette(g_npc_garuma, SCALE.G, SILHOUETTE_WIDTH.G);
			SetTalkEnable_(g_npc_garuma, false);
			SetReactorMsg_(g_npc_garuma, "NPC_DARTHGARUMA_REC");
			SetVisible(g_npc_garuma, true);
			// まがまがしいオーラ
			LoadEffect_("ef730_01_oth_dark_aura01");
			local g_npc_garuma_eff = SetSelectBoneEffect_("ef730_01_oth_dark_aura01", g_npc_garuma, ATTACH_EFFECT2);
		}
		// ダースガルマ[その２]
		else if(outside_num == GetFlagID_("CONST_SS_OS_CONTACT_DARTH_2")){		// Num10 = 21
			local id_boss1 = ReadNpc_("m180_00"); // ダースガルマ
			g_npc_garuma = ArrangePointNpc_(id_boss1, "npc_ura_boss");
			// NPCモデルのメッシュ表示
			SetMeshVisible_(g_npc_garuma, "Model",       true); // 本体
			SetMeshVisible_(g_npc_garuma, "cover",       true); // 割れていないカバー
			SetMeshVisible_(g_npc_garuma, "breakCover", false); // 割れているカバー
			SetMeshVisible_(g_npc_garuma, "arm",         true); // 腕
			SetMeshVisible_(g_npc_garuma, "head",       false); // 頭(竜)
			// サイズ
			SetScaleSilhouette(g_npc_garuma, SCALE.G, SILHOUETTE_WIDTH.G);
			SetTalkEnable_(g_npc_garuma, false);
			SetReactorMsg_(g_npc_garuma, "NPC_DARTHGARUMA_REC");
			SetVisible(g_npc_garuma, true);
			// まがまがしいオーラ
			LoadEffect_("ef730_01_oth_dark_aura01");
			local g_npc_garuma_eff = SetSelectBoneEffect_("ef730_01_oth_dark_aura01", g_npc_garuma, ATTACH_EFFECT2);
		}
		// ダースガルマ[その３]
		else if(outside_num == GetFlagID_("CONST_SS_OS_CONTACT_DARTH_3")){		// Num10 = 26
			local id_boss1 = ReadNpc_("m180_00"); // ダースガルマ
			g_npc_garuma = ArrangePointNpc_(id_boss1, "npc_ura_boss");
			// NPCモデルのメッシュ表示
			SetMeshVisible_(g_npc_garuma, "Model",       true); // 本体
			SetMeshVisible_(g_npc_garuma, "cover",      false); // 割れていないカバー
			SetMeshVisible_(g_npc_garuma, "breakCover",  true); // 割れているカバー
			SetMeshVisible_(g_npc_garuma, "arm",         true); // 腕
			SetMeshVisible_(g_npc_garuma, "head",        true); // 頭(竜)
			// サイズ
			SetScaleSilhouette(g_npc_garuma, SCALE.G, SILHOUETTE_WIDTH.G);
			SetTalkEnable_(g_npc_garuma, false);
			SetReactorMsg_(g_npc_garuma, "NPC_DARTHGARUMA_REC");
			SetVisible(g_npc_garuma, true);
			// まがまがしいオーラ
			LoadEffect_("ef730_01_oth_dark_aura01");
			local g_npc_garuma_eff = SetSelectBoneEffect_("ef730_01_oth_dark_aura01", g_npc_garuma, ATTACH_EFFECT2);
			SetEffectScale_(g_npc_garuma_eff, 1.5);
		}
	}
	// ■ダグジャガルマ
	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){						// Num 0 = 9
		// ダグジャガルマ
		if(outside_num == GetFlagID_("CONST_SS_OS_CONTACT_DAGJAGARUMA")){		// Num10 = 31
			local id_boss2 = ReadNpc_("m186_00"); // ダグジャガルマ
			g_npc_garuma = ArrangePointNpc_(id_boss2, "npc_ura_boss2");
			SetScaleSilhouette(g_npc_garuma, SCALE.G, SILHOUETTE_WIDTH.G);
			SetTalkEnable_(g_npc_garuma, false);
			SetReactorMsg_(g_npc_garuma, "NPC_DAGUJAGARUMA_REC");
			SetVisible(g_npc_garuma, true);
			// まがまがしいオーラ
			LoadEffect_("ef730_01_oth_dark_aura01");
			local g_npc_garuma_eff = SetSelectBoneEffect_("ef730_01_oth_dark_aura01", g_npc_garuma, ATTACH_EFFECT2);
			SetEffectScale_(g_npc_garuma_eff, 1.7);
		}
	}
	// ■アロマ
	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){					// Num 0 = 9
		// ダースガルマ[その１]再戦時( Num10 == 16 )
		if(outside_num == GetFlagID_("CONST_SS_OS_CONTACT_DARTHGARUMA")){
			g_npc_aroma = ReadAndArrangePointNpc("n018", "npc_aroma_rematch");
			SetTalkCameraType_(g_npc_aroma, TALK_CAMERA_UP);
			SetReactorMsg_(g_npc_aroma, "NPC_AROMA_REC");
			// 会話カメラ時に透過されるのでアルファ値を設定する
			SetManualCalcAlpha_(g_npc_aroma, true);
			SetAlpha_(g_npc_aroma, 1.0);
		}
		// ダースガルマ[その２]再戦時( Num10 == 21 )
		else if(outside_num == GetFlagID_("CONST_SS_OS_CONTACT_DARTH_2")){
			g_npc_aroma = ReadAndArrangePointNpc("n018", "npc_aroma_rematch");
			SetTalkCameraType_(g_npc_aroma, TALK_CAMERA_UP);
			SetReactorMsg_(g_npc_aroma, "NPC_AROMA_REC");
			// 会話カメラ時に透過されるのでアルファ値を設定する
			SetManualCalcAlpha_(g_npc_aroma, true);
			SetAlpha_(g_npc_aroma, 1.0);
		}
		// ダースガルマ[その３]再戦時( Num10 == 26 )
		else if(outside_num == GetFlagID_("CONST_SS_OS_CONTACT_DARTH_3")){
			g_npc_aroma = ReadAndArrangePointNpc("n018", "npc_aroma_rematch");
			SetTalkCameraType_(g_npc_aroma, TALK_CAMERA_UP);
			SetReactorMsg_(g_npc_aroma, "NPC_AROMA_REC");
			// 会話カメラ時に透過されるのでアルファ値を設定する
			SetManualCalcAlpha_(g_npc_aroma, true);
			SetAlpha_(g_npc_aroma, 1.0);
		}
		// ダグジャガルマ再戦時( Num10 == 31 )
		else if(outside_num == GetFlagID_("CONST_SS_OS_CONTACT_DAGJAGARUMA")){
			g_npc_aroma = ReadAndArrangePointNpc("n018", "npc_aroma_rematch");
			SetTalkCameraType_(g_npc_aroma, TALK_CAMERA_UP);
			SetReactorMsg_(g_npc_aroma, "NPC_AROMA_REC");
			// 会話カメラ時に透過されるのでアルファ値を設定する
			SetManualCalcAlpha_(g_npc_aroma, true);
			SetAlpha_(g_npc_aroma, 1.0);
		}
		else if(outside_num == GetFlagID_("CONST_SS_OS_EXAMINE_STAR_SEED")){		// Num10 = 34
			g_npc_aroma = ReadAndArrangePointNpc("n018", "npc_aroma");
			SetTalkCameraType_(g_npc_aroma, TALK_CAMERA_UP);
			SetReactorMsg_(g_npc_aroma, "NPC_AROMA_REC");
			// 会話カメラ時に透過されるのでアルファ値を設定する
			SetManualCalcAlpha_(g_npc_aroma, true);
			SetAlpha_(g_npc_aroma, 1.0);
			// スターシード
			LoadEffect_("ef732_26_star_seed_base02");
			local star_seed = SetPointWorldEffect_("ef732_26_star_seed_base02", "ef_star_piece");
		}
	}
	
	
	//-----------
	// ▼地雷配置
	//-----------
	// ID初期化
	g_mine_event_02	 <- C_NONE_ID;
	g_mine_event_03	 <- C_NONE_ID;
	g_mine_event_04	 <- C_NONE_ID;
	g_mine_event_05	 <- C_NONE_ID;
	g_mine_event_06	 <- C_NONE_ID;
	g_mine_event_07	 <- C_NONE_ID;
	g_mine_star_seed <- C_NONE_ID;
	
	// ■イベント地雷
	if (main_num == GetFlagID_("CONST_SM_CORE")) {								// Num0 = 7
		if(core_num == GetFlagID_("CONST_SS_CO_APPROACH_RENATE")				// Num8 = 12
		|| core_num == GetFlagID_("CONST_SS_CO_CONTACT_GARUBIRUSU")) {			// Num8 = 15
			g_mine_event_02 = SetPointCircleEventMine_("mine_event_02", false);	// ガルビルス再戦デモ用
		}
	}
	// ■裏シナリオ用イベント地雷
	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){							// Num 0 = 9
		// ボス戦用地雷
		if(outside_num == GetFlagID_("CONST_SS_OS_GO_TO_MOTHER_ROOM")){				// Num10 = 13
			// デモイベント用
			g_mine_event_03 = SetPointCircleEventMine_("mine_event_02", false);
		}
		// ボス再戦用地雷(ダースガルマその１)
		else if(outside_num == GetFlagID_("CONST_SS_OS_CONTACT_DARTHGARUMA")){		// Num10 = 16
			g_mine_event_04 = SetPointCircleEventMine_("mine_event_02", false);
		}
		// ボス再戦用地雷(ダースガルマその２)
		else if(outside_num == GetFlagID_("CONST_SS_OS_CONTACT_DARTH_2")){			// Num10 = 21
			g_mine_event_05 = SetPointCircleEventMine_("mine_event_02", false);
		}
		// ボス再戦用地雷(ダースガルマその３)
		else if(outside_num == GetFlagID_("CONST_SS_OS_CONTACT_DARTH_3")){			// Num10 = 26
			g_mine_event_06 = SetPointCircleEventMine_("mine_event_02", false);
		}
		// ボス再戦用地雷(ダグジャガルマ)
		else if(outside_num == GetFlagID_("CONST_SS_OS_CONTACT_DAGJAGARUMA")){		// Num10 = 34
			g_mine_event_07 = SetPointCircleEventMine_("mine_event_02", false);
		}
		// スターシード
		else if(outside_num == GetFlagID_("CONST_SS_OS_EXAMINE_STAR_SEED")){		// Num10 = 34
			g_mine_star_seed = SetPointCircleEventMine_("mine_star_piece", true);
		}
	}
	
	
	
	//---------------------
	// ▼リアクターポイント
	//---------------------
	// ■コールドスリープ
	local rec_point_sleep = ArrangeMsgReactorPoint("rec_sleep", GetFlagID_("BFG_REACTER_POINT_118")// Bit_1617 コールドスリープ
		, SHORT_DIST, "REC_POINT_SLEEP_010", "REC_POINT_SLEEP_020");
	// ■スターシード
	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR") && outside_num == GetFlagID_("CONST_SS_OS_EXAMINE_STAR_SEED")){
		local reactorPoint02  = ArrangeMsgReactorPoint("ReactorPoint_02", GetFlagID_("BFG_REACTER_POINT_119")
			, SHORT_DIST, "REC_POINT_02_01", "REC_POINT_02_02");
	}
	
	//---------------------
	// ▼ＢＧＭを無音に設定
	//---------------------
	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){				// Num 0 == 9
		if(outside_num == GetFlagID_("CONST_SS_OS_EXAMINE_STAR_SEED")){	// Num10 == 34
			// 無音にする
			SetEventFlg_("BFG_C00_03_EVENT_BGM_NONE", true);
		}
		else{
			// 無音にしない
			SetEventFlg_("BFG_C00_03_EVENT_BGM_NONE", false);
		}
	}
	else{
		// 無音にしない
		SetEventFlg_("BFG_C00_03_EVENT_BGM_NONE", false);
	}
	
	EventEnd_();
}


//------------------------------------------------
//		フィールド操作開始
//------------------------------------------------
function EventStartOperate()
{
	main_num = GetNumFlg_("NUM_SCENARIO_MAIN");		// Num0
	core_num = GetNumFlg_("NUM_SCENARIO_SUB_CORE");	// Num8
	sky_num	 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");	// Num9
	
	//-------------
	// ▼デモの再生
	//-------------
	// コアシナリオ
	if(main_num == GetFlagID_("CONST_SM_CORE")){										// Num0 = 7
		// ■楽園マップから移動してきた時
		if(core_num == GetFlagID_("CONST_SS_CO_CHECK_UP_ANSESU")){						// Num8 = 6
			SetNumFlg_(core_num_sub, GetFlagID_("CONST_SS_CO_PRE_BATTLE_DARK_MASTER"));	// Num8 = 7
			//デモ再生後の配置座標を指定
			SetReturnDemoPosDir_(Vec3(-4.5, 188.8, -688.1), 0);
			
			// ルーラ・ライド・まんたん禁止を解除
			SetEventFlg_("BFG_RIDE_INPUT_PROHIBIT", false);				// ライド禁止(Bit435)
			SetEventFlg_("BFG_PLAYERABILITY_RULER_PROHIBIT", false);	// ルーラ禁止(Bit440)
			SetEventFlg_("BFG_PLAYERABILITY_MANTAN_PROHIBIT", false);	// まんたん禁止(Bit444)
			
			// Demo608[いつわりの兄の正体：コアMap]（カシャロット・アパデマクと戦闘）
			SetFade_(FADE_OUT, FADE_COLOR_WHITE, FADE_SHORT);
			SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
			WaitFade_();
			ChangeDemo_(608); 
		}
		// ■カシャロット、アパデマク戦で負けた時の再戦処理
		else if(core_num == GetFlagID_("CONST_SS_CO_CONTACT_DARK_MASTER")) {				// Num8 = 9
			//フラグを進行させる
			SetNumFlg_(core_num_sub, GetFlagID_("CONST_SS_CO_PRE_REMATCH_DARK_MASTER"));// Num8 = 10
			// Demo609[カシャロット、アパデマク再戦]再生
			EventStartChangeDemo(609, FADE_COLOR_BLACK);
		}
		// ■ガルビルス戦後の連続デモ再生
		else if(core_num == GetFlagID_("CONST_SS_CO_VIOLENT_GARUBIRUSU")){					// Num8 = 18
			// 高空シナリオ開始のNUMフラグに設定
			SetNumFlg_(main_num_sub, GetFlagID_("CONST_SM_SKY"));						// Num0 = 8
			SetNumFlg_(core_num_sub, 0);												// Num8 = 0
			SetNumFlg_(sky_num_sub, GetFlagID_("CONST_SS_SK_CONFESSIONS_RENATE_1"));	// Num9 = 0
			// 大陸移動装置の使用を禁止する
			SetEventFlg_("BFG_DONT_TRANSFER_GREEN_TO_CITY",   true);// 草原-崩落間の大陸移動装置の使用を禁止するフラグ
			SetEventFlg_("BFG_DONT_TRANSFER_CITY_TO_GRAVE",   true);// 崩落-霊道間の大陸移動装置の使用を禁止するフラグ
			SetEventFlg_("BFG_DONT_TRANSFER_GRAVE_TO_ICE",    true);// 霊道-氷原間の大陸移動装置の使用を禁止するフラグ
			SetEventFlg_("BFG_DONT_TRANSFER_ICE_TO_SAND",     true);// 氷原-砂漠間の大陸移動装置の使用を禁止するフラグ
			SetEventFlg_("BFG_DONT_TRANSFER_SAND_TO_VOLCANO", true);// 砂漠-火山間の大陸移動装置の使用を禁止するフラグ
			SetEventFlg_("BFG_DONT_TRANSFER_VOLCANO_TO_CORE", true);// 火山-コア間の大陸移動装置の使用を禁止するフラグ
			// フライトシグナルの使用を禁止する
			SetEventFlg_("BFG_WEATHER_BLACK_POLLEN_CITY",     true);// 都市が黒い花粉に覆われているかどうか
			SetEventFlg_("BFG_WEATHER_BLACK_POLLEN_GRAVE",    true);// 墓地が黒い花粉に覆われているかどうか
			SetEventFlg_("BFG_WEATHER_BLACK_POLLEN_ICE",      true);// 氷原が黒い花粉に覆われているかどうか
			SetEventFlg_("BFG_WEATHER_BLACK_POLLEN_SAND",     true);// 監獄が黒い花粉に覆われているかどうか
			SetEventFlg_("BFG_WEATHER_BLACK_POLLEN_VOLCANO",  true);// 火山が黒い花粉に覆われているかどうか
			// デモ再生後のマップを指定
			SetReturnDemoMap_("H02_00");
			SetReturnDemoPosDir_(Vec3(-0.216, 0.0, 2.33), 145);
			// Demo614[ガルビルスの暴走：世界を黒い花粉が覆う]
			EventStartChangeDemo(614, FADE_COLOR_BLACK);
		}
	}
	
	// 裏シナリオ(Demo829[レナーテの解放]再生後に連続再生)
	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){						 // Num 0 =  9
		if(outside_num == GetFlagID_("CONST_SS_OS_EXAMINE_STAR_SEED_2")){		 // Num10 = 35
			SetNumFlg_(outside_num_sub, GetFlagID_("CONST_SS_OS_TALKED_AROMA")); // Num10 = 36
			//デモ再生後のマップを指定
			SetReturnDemoMap_("A01_00");
			SetReturnDemoPosDir_(Vec3(0.00, 2.50, 235.50), 180);
			// Demo830[人類の復活、そして]
			EventStartChangeDemo(830, FADE_COLOR_BLACK);
		}
	}

	
	//-------------
	// ▼戦闘開始
	//-------------
	// ■[カシャロット＆アパデマク戦]
	if(main_num == GetFlagID_("CONST_SM_CORE")){										// Num0 = 7
		if(core_num == GetFlagID_("CONST_SS_CO_PRE_BATTLE_DARK_MASTER")){				// Num8 = 7
			SetNumFlg_(core_num_sub, GetFlagID_("CONST_SS_CO_JDG_BATTLE_DARK_MASTER"));	// Num8 = 8
			ChangeBattleParty_(20);	// カシャロット＆アパデマク戦
		}
		// ■[カシャロット＆アパデマク再戦]
		else if(core_num == GetFlagID_("CONST_SS_CO_PRE_REMATCH_DARK_MASTER")){			// Num8 = 10
			SetNumFlg_(core_num_sub, GetFlagID_("CONST_SS_CO_JDG_REMATCH_DARK_MASTER"));// Num8 = 11
			ChangeBattleParty_(20);	// カシャロット＆アパデマク戦
		}
		
		//-------------
		// ▼戦闘結果
		//-------------
		if(core_num == GetFlagID_("CONST_SS_CO_JDG_BATTLE_DARK_MASTER")					// Num8 = 8 (初戦時)
		|| core_num == GetFlagID_("CONST_SS_CO_JDG_REMATCH_DARK_MASTER")){				// Num8 = 11(再戦時)
			// 勝利
			if (GetBattleEndType_() == BATTLE_END_TYPE_WIN){
				SetNumFlg_(core_num_sub, GetFlagID_("CONST_SS_CO_APPROACH_RENATE"));	// Num8 = 12
				SetEventFlg_("BFG_C00_03_EVENT_BGM008_PLAY", false);					// Bit664 : C00_03 BGM_008 を流す
				
				// デモ後に設定される主人公の位置と向き
				SetReturnDemoPosDir_(Vec3(-4.5, 188.8, -688.1), 0);
				// Demo610[ダークマスターの最期]再生
				EventStartChangeDemo(610, FADE_COLOR_BLACK);
			// 敗北
			}else{
				// ここでは敗北判定ができないので
				// AfterBattle()で敗北の判定とフラグ変更を行う。
			}
		}
	}
	// ■[ガルビルス戦]
	if(main_num == GetFlagID_("CONST_SM_CORE")){										// Num0 = 7
		if(core_num == GetFlagID_("CONST_SS_CO_PRE_BATTLE_GARUBIRUSU")){				// Num8 = 13
			SetNumFlg_(core_num_sub, GetFlagID_("CONST_SS_CO_JDG_BATTLE_GARUBIRUSU"));	// Num8 = 14
			ChangeBattleParty_(21);	// ガルビルス戦
		}
		// ■[ガルビルス再戦]
		else if(core_num == GetFlagID_("CONST_SS_CO_PRE_REMATCH_GARUBIRUSU")){			// Num8 = 16
			SetNumFlg_(core_num_sub, GetFlagID_("CONST_SS_CO_JDG_REMATCH_GARUBIRUSU"));	// Num8 = 17
			ChangeBattleParty_(21);	// ガルビルス再戦
		}
	
		//-------------
		// ▼戦闘結果
		//-------------
		if(core_num == GetFlagID_("CONST_SS_CO_JDG_BATTLE_GARUBIRUSU")					// Num8 = 14(初戦時)
		|| core_num == GetFlagID_("CONST_SS_CO_JDG_REMATCH_GARUBIRUSU")){				// Num8 = 17(再戦時)
			// 勝利
			if (GetBattleEndType_() == BATTLE_END_TYPE_WIN){
				SetNumFlg_(core_num_sub, GetFlagID_("CONST_SS_CO_VIOLENT_GARUBIRUSU"));	// Num8 = 18
				// デモ後に設定される主人公の位置と向き
				SetReturnDemoPosDir_(Vec3(-504.0, 341.0, -592.0), 40);
				// Demo613[ガルビルスの暴走：コアMap]再生
				EventStartChangeDemo(613, FADE_COLOR_BLACK);
			// 敗北
			}else{
				// ここでは敗北判定ができないので
				// AfterBattle()で敗北の判定とフラグ変更を行う。
			}
		}
	}
	// ■ダースガルマ戦
	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){									// Num 0 =  9
		// ダースガルマ(その１)
		if(outside_num == GetFlagID_("CONST_SS_OS_PRE_BATTLE_DARTHGARUMA")){				// Num10 = 14
			SetNumFlg_(outside_num_sub, GetFlagID_("CONST_SS_OS_JDG_BATTLE_DARTHGARUMA"));	// Num10 = 15
			ChangeBattleParty_(170);
		}
		// 再戦
		else if(outside_num == GetFlagID_("CONST_SS_OS_PRE_REMATCH_DARTHGARUMA")){			// Num10 = 17
			SetNumFlg_(outside_num_sub, GetFlagID_("CONST_SS_OS_JDG_REMATCH_DARTHGARUMA"));	// Num10 = 18
			ChangeBattleParty_(170);
		}
		//-------------
		// ▼戦闘結果  
		//-------------
		else if(outside_num == GetFlagID_("CONST_SS_OS_JDG_BATTLE_DARTHGARUMA")				// Num10 = 15
		|| outside_num == GetFlagID_("CONST_SS_OS_JDG_REMATCH_DARTHGARUMA")){				// Num10 = 18
			// 勝利
			if (GetBattleEndType_() == BATTLE_END_TYPE_WIN){
				// 進行フラグを進める(戦闘回数が不明なので仮対応)
				SetNumFlg_(outside_num_sub, GetFlagID_("CONST_SS_OS_PRE_BATTLE_DAGJAGARUMA"));	// Num10 = 29
				// ダースガルマ・ダグジャガルマの再戦デモは共通なので勝利したらフラグを進めておく(ダースガルマは戦闘で切り替える)
				SetNumFlg_("NUM_FLG_COUNT_UP_DEMO_834", 3);
				// Demo835[ダースガルマ変身]再生
				EventStartChangeDemo(835, FADE_COLOR_BLACK);
			// 敗北
			}else{
				// ここでは敗北判定ができないので
				// AfterBattle()で敗北の判定とフラグ変更を行う。
			}
		}
		// ダースガルマ(その２)再戦
		else if(outside_num == GetFlagID_("CONST_SS_OS_PRE_REMATCH_DARTH_2")){			// Num10 = 22
			SetNumFlg_(outside_num_sub, GetFlagID_("CONST_SS_OS_JDG_REMATCH_DARTH_2"));	// Num10 = 23
			ChangeBattleParty_(171);
		}
		//-------------
		// ▼戦闘結果
		//-------------
		else if(outside_num == GetFlagID_("CONST_SS_OS_JDG_REMATCH_DARTH_2")){			// Num10 = 23
			// 勝利
			if (GetBattleEndType_() == BATTLE_END_TYPE_WIN){
				// 進行フラグを進める(戦闘回数が不明なので仮対応)
				SetNumFlg_(outside_num_sub, GetFlagID_("CONST_SS_OS_PRE_BATTLE_DAGJAGARUMA"));	// Num10 = 29
				// ダースガルマ・ダグジャガルマの再戦デモは共通なので勝利したらフラグを進めておく(ダースガルマは戦闘で切り替える)
				SetNumFlg_("NUM_FLG_COUNT_UP_DEMO_834", 3);
				// Demo835[ダースガルマ変身]再生
				EventStartChangeDemo(835, FADE_COLOR_BLACK);
			// 敗北
			}else{
				// ここでは敗北判定ができないので
				// AfterBattle()で敗北の判定とフラグ変更を行う。
			}
		}

		// ダースガルマ(その３)再戦
		else if(outside_num == GetFlagID_("CONST_SS_OS_PRE_REMATCH_DARTH_3")){			// Num10 = 27
			SetNumFlg_(outside_num_sub, GetFlagID_("CONST_SS_OS_JDG_REMATCH_DARTH_3"));	// Num10 = 28
			ChangeBattleParty_(172);
		}
		//-------------
		// ▼戦闘結果  
		//-------------
		else if(outside_num == GetFlagID_("CONST_SS_OS_JDG_REMATCH_DARTH_3")){			// Num10 = 28
			// 勝利
			if (GetBattleEndType_() == BATTLE_END_TYPE_WIN){
				// 進行フラグを進める(戦闘回数が不明なので仮対応)
				SetNumFlg_(outside_num_sub, GetFlagID_("CONST_SS_OS_PRE_BATTLE_DAGJAGARUMA"));	// Num10 = 29
				// ダースガルマ・ダグジャガルマの再戦デモは共通なので勝利したらフラグを進めておく(ダースガルマは戦闘で切り替える)
				SetNumFlg_("NUM_FLG_COUNT_UP_DEMO_834", 3);
				// Demo835[ダースガルマ変身]再生
				EventStartChangeDemo(835, FADE_COLOR_BLACK);
			// 敗北
			}else{
				// ここでは敗北判定ができないので
				// AfterBattle()で敗北の判定とフラグ変更を行う。
			}
		}
	}
	// ■ダグジャガルマ戦
	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){									// Num 0 =  9
		// ダグジャガルマ
		if(outside_num == GetFlagID_("CONST_SS_OS_PRE_BATTLE_DAGJAGARUMA")){				// Num10 = 29
			SetNumFlg_(outside_num_sub, GetFlagID_("CONST_SS_OS_JDG_BATTLE_DAGJAGARUMA"));	// Num10 = 30
			ChangeBattleParty_(173);
		}
		// ダグジャガルマ再戦
		else if(outside_num == GetFlagID_("CONST_SS_OS_PRE_REMATCH_DAGJAGARUMA")){			// Num10 = 32
			SetNumFlg_(outside_num_sub, GetFlagID_("CONST_SS_OS_JDG_REMATCH_DAGJAGARUMA"));	// Num10 = 33
			ChangeBattleParty_(173);
		}
		//-------------
		// ▼戦闘結果  
		//-------------
		else if(outside_num == GetFlagID_("CONST_SS_OS_JDG_BATTLE_DAGJAGARUMA")				// Num10 = 30
		|| outside_num == GetFlagID_("CONST_SS_OS_JDG_REMATCH_DAGJAGARUMA")){				// Num10 = 33
			// 勝利
			if (GetBattleEndType_() == BATTLE_END_TYPE_WIN){
				// 進行フラグを進める
				SetNumFlg_(outside_num_sub, GetFlagID_("CONST_SS_OS_EXAMINE_STAR_SEED"));	// Num10 = 34
				// 全回復
				RecoverAll_();
				// デモ後に設定される主人公の位置と向き
				SetReturnDemoPosDir_(Vec3(-7.549, 231.202, -352.768), -10);
				// Demo828[ダースガルマに勝利]再生
				EventStartChangeDemo(828, FADE_COLOR_BLACK);
			// 敗北
			}else{
				// ここでは敗北判定ができないので
				// AfterBattle()で敗北の判定とフラグ変更を行う。
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
	// 話しかける対象のNPCを条件に
	local target = GetTargetId_();
	switch(target)
	{
	case g_npc_aroma:
		uTalkAroma();
		break;
	default:
		break;
	}
	
	EventEnd_();
}

//------------------------------------------------
//		地雷接触時
//------------------------------------------------
function TouchEventMine()
{
	main_num = GetNumFlg_("NUM_SCENARIO_MAIN");		// Num0
	core_num = GetNumFlg_("NUM_SCENARIO_SUB_CORE");	// Num8
	sky_num	 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");	// Num9
	
	local target = GetTouchEventMineId_();
	
	DebugPrint("ID: " + target + " に接触 [TouchEventMine]");
	
	switch (target) {
	case g_mine_event_02 :	//マザールームの地雷(レナーテ付近)
		uMineEvent02();
		break;
	case g_mine_event_03:
		DeleteEventMine_(g_mine_event_03);
		g_mine_event_03 <- C_NONE_ID;
		uMineEvent03();
		break;
	case g_mine_event_04:
		DeleteEventMine_(g_mine_event_04);
		g_mine_event_04 <- C_NONE_ID;
		uMineEvent04();
		break;
	case g_mine_event_05:
		DeleteEventMine_(g_mine_event_05);
		g_mine_event_05 <- C_NONE_ID;
		uMineEvent05();
		break;
	case g_mine_event_06:
		DeleteEventMine_(g_mine_event_06);
		g_mine_event_06 <- C_NONE_ID;
		uMineEvent06();
		break;
	case g_mine_event_07:
		DeleteEventMine_(g_mine_event_07);
		g_mine_event_07 <- C_NONE_ID;
		uMineEvent07();
		break;
	case g_mine_star_seed:
		uPlayerTurnAroundStarSeed(); // CommPlayerTurnAroundObj()を使うとおかしくなるので
		uMineEventStarSeed(g_mine_star_seed);
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
//	マザールーム(レナーテ付近)の地雷に触れた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineEvent02()
{
	if (main_num == GetFlagID_("CONST_SM_CORE")) {										// Num0 = 7
		if (core_num == GetFlagID_("CONST_SS_CO_APPROACH_RENATE")) {					// Num8 = 12
			DeleteEventMine_(g_mine_event_02);
			//フラグを進行させる
			SetNumFlg_(core_num_sub, GetFlagID_("CONST_SS_CO_PRE_BATTLE_GARUBIRUSU"));	// Num8 = 13
			//Demo611[元凶のガルビルス]（ガルビルスと戦闘）
			ChangeDemo_(611);
		}
		else if (core_num == GetFlagID_("CONST_SS_CO_CONTACT_GARUBIRUSU")) {			// Num8 = 15
			DeleteEventMine_(g_mine_event_02);
			//フラグを進行させる
			SetNumFlg_(core_num_sub, GetFlagID_("CONST_SS_CO_PRE_REMATCH_GARUBIRUSU"));	// Num8 = 16
			//Demo612[ガルビルス再戦]再生
			ChangeDemo_(612);
		}
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//	裏シナリオでマザールーム付近の地雷に触れた時
//------------------------------------------------
//	引数	: 削除地雷
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineEvent03()
{
	//フラグを進行させる
	SetNumFlg_(outside_num_sub, GetFlagID_("CONST_SS_OS_PRE_BATTLE_DARTHGARUMA"));	// Num10 = 13
	// Demo826[最後の試練]
	ChangeDemo_(826);
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//	裏シナリオでダースガルマ再戦時の地雷に触れた時
//------------------------------------------------
//	引数	: 削除地雷
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineEvent04()
{
	//フラグを進行させる
	SetNumFlg_(outside_num_sub, GetFlagID_("CONST_SS_OS_PRE_REMATCH_DARTHGARUMA")); // Num10 = 17
	// Demo827[ダースガルマ再戦]
	ChangeDemo_(827);
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//	裏シナリオでダースガルマ2再戦時の地雷に触れた時
//------------------------------------------------
//	引数	: 削除地雷
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineEvent05()
{
	//フラグを進行させる
	SetNumFlg_(outside_num_sub, GetFlagID_("CONST_SS_OS_PRE_REMATCH_DARTH_2")); // Num10 = 22
	// Demo827[ダースガルマ再戦]
	ChangeDemo_(827);
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//	裏シナリオでダースガルマ3再戦時の地雷に触れた時
//------------------------------------------------
//	引数	: 削除地雷
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineEvent06()
{
	//フラグを進行させる
	SetNumFlg_(outside_num_sub, GetFlagID_("CONST_SS_OS_PRE_REMATCH_DARTH_3")); // Num10 = 27
	// Demo827[ダースガルマ再戦]
	ChangeDemo_(827);
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//	裏シナリオでダグジャガルマ再戦時の地雷に触れた時
//------------------------------------------------
//	引数	: 削除地雷
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineEvent07()
{
	//フラグを進行させる
	SetNumFlg_(outside_num_sub, GetFlagID_("CONST_SS_OS_PRE_REMATCH_DAGJAGARUMA")); // Num10 = 32
	// Demo827[ダースガルマ再戦]
	ChangeDemo_(827);
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//	裏シナリオでマザールーム付近の地雷に触れた時
//------------------------------------------------
//	引数	: 削除地雷
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineEventStarSeed(mine)
{
	DeleteEventMine_(mine);
	//フラグを進行させる
	SetNumFlg_(outside_num_sub, GetFlagID_("CONST_SS_OS_EXAMINE_STAR_SEED_2"));	// Num8 = 35
	// Demo829[レナーテの解放]
	ChangeDemo_(829);
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//   アロマの会話内容
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkAroma()
{
	// 進行フラグの状態を取得
	main_num    = GetNumFlg_("NUM_SCENARIO_MAIN");				// Num0
	outside_num = GetNumFlg_("NUM_SCENARIO_SUB_INSIDE_CLEAR");	// Num10

	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){				// NUM000 =  9

		// ダースガルマ[その１]再戦時( Num10 == 16 )
		if(outside_num == GetFlagID_("CONST_SS_OS_CONTACT_DARTHGARUMA")){
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_AROMA");
			ShowMsg_("AROMA_REMATCH_MSG");
			KeyInputWait_();
			CloseMsgWnd_();
		}
		// ダースガルマ[その２]再戦時( Num10 == 21 )
		else if(outside_num == GetFlagID_("CONST_SS_OS_CONTACT_DARTH_2")){
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_AROMA");
			ShowMsg_("AROMA_REMATCH_MSG");
			KeyInputWait_();
			CloseMsgWnd_();
		}
		// ダースガルマ[その３]再戦時( Num10 == 26 )
		else if(outside_num == GetFlagID_("CONST_SS_OS_CONTACT_DARTH_3")){
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_AROMA");
			ShowMsg_("AROMA_REMATCH_MSG");
			KeyInputWait_();
			CloseMsgWnd_();
		}
		// ダグジャガルマ再戦時( Num10 == 31 )
		else if(outside_num == GetFlagID_("CONST_SS_OS_CONTACT_DAGJAGARUMA")){
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_AROMA");
			ShowMsg_("AROMA_REMATCH_MSG");
			KeyInputWait_();
			CloseMsgWnd_();
		}
		// Demo828[ダースガルマに勝利]の再生後( Num10 == 34 )
		else if(outside_num == GetFlagID_("CONST_SS_OS_EXAMINE_STAR_SEED")){
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_AROMA");
			ShowMsg_("AROMA_MSG_001");
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		チェンジデモ
//------------------------------------------------
//	引数	: number	デモ番号
//			: color		フェードの色
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uFadeChangeDemo(number, color)
{
	// 「uFadeChangeDemo()」とEventCommon.nutの「EventStartChangeDemo()」は同じ処理なので、後でこの関数は消して下さい。by 楠本
	EventStartChangeDemo(number, color);
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		ＮＰＣ・地雷接触時チェンジデモ
//------------------------------------------------
//	引数	: number	デモ番号
//			: color		フェードの色
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTouchChangeDemo(number, color)
{
	SetFade_(FADE_OUT, color, FADE_DEF);
	SetFadeSub_(FADE_OUT, color, FADE_DEF);
	WaitFade_();
	
	ChangeDemo_(number);
}

//++++++++++++++++++++++++++++++++++++++++++++++++
// 主人公をスターシードの方向に向ける
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uPlayerTurnAroundStarSeed()
{
	local player = GetPlayerId_();
	local starseed_pos = Vec3(-15.854, 245.046, -334.479);
	local rotateTask = Task_RotateToPosSetMotion_(player, starseed_pos, ROTATE_EVENT_DEF, MOT_WALK, MOT_WAIT);
	WaitTask(rotateTask);
	// 間を持たせる
	Wait_(15);
}

