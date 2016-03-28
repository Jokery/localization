//===================== G02_01秘密地下 ====================

// 定数の宣言
const EFC_SIZE_MIN		= 0.0;	// エフェクトサイズの最小値
const EFC_SIZE_MAX		= 0.5;	// エフェクトサイズの最大値
const GRADUALLY_SMALL	= 0.05;	// エフェクトサイズを段々小さくする値


//------------------------------------------------
//		戦闘終了後
//------------------------------------------------
function AfterBattle()
{
	//フラグの状態を取得
	local main_num  = GetNumFlg_("NUM_SCENARIO_MAIN");
	local grave_num = GetNumFlg_("NUM_SCENARIO_SUB_GRAVE");
	
	// 石像のフラグを取得
	uGetSekizouFlag();
	
	// 石像のフラグをセット
	uSetSekizouFlag();// 戦闘後は石像の向きを保持するため、取得した値をそのままセット

	// ブンドルドに負けた時にNUMフラグを変更する処理（要注意）
	// イベントブロックのEventStartOperate()では敗北を判定できないのでここで敗北の判定とフラグ変更を行う。
	if(main_num == 3){
		if(grave_num == GetFlagID_("CONST_SS_CC_JDG_BATTLE_BUNDORUDO")		// Num4 = 8
		|| grave_num == GetFlagID_("CONST_SS_CC_JDG_REMATCH_BUNDORUDO")){	// Num4 = 11
			// ブンドルドに敗北
			if(GetBattleEndType_() == END_TYPE_LOSE){
				SetNumFlg_("NUM_SCENARIO_SUB_GRAVE", GetFlagID_("CONST_SS_CC_BE_WIPED_OUT_BUNDORUDO"));// Num4 = 9
			}
		}
	}

	EventEnd_();
}


//------------------------------------------------
//		フェードイン
//------------------------------------------------
function FadeIn()
{

	// フラグの状態を取得
	local main_num   = GetNumFlg_("NUM_SCENARIO_MAIN");
	local grave_num  = GetNumFlg_("NUM_SCENARIO_SUB_GRAVE");
	local ice_num    = GetNumFlg_("NUM_SCENARIO_SUB_ICE");
	local check_dead = GetEventFlg_("BFG_DEAD_RETURN");
	local route      = GetEnteredMapChangeNullName_();
	local seikai     = GetEventFlg_("BFG_MOVE_SUCCESS_SECOND");// ６体の石像ギミックを正確な位置に合わせられたフラグ
	// 石像のフラグを取得
	uGetSekizouFlag();
	
	// 石像の向きの初期設定
	if( route == "w_G02_00ALru_000" ){
		// 手順カウントを0にする
		SetNumFlg_("NUM_FLG_SECRETROOM_COUNT", 0);
		// 石像ギミックが未攻略の場合
		if( seikai == false ){
			// 石像の角度をNUMフラグに置き換える
			uResetNumStone(2, 3, 1, 1, 0, 1);	// 0=0度, 1=90度, 2=180度, 3=270, 4=360度 とする
			// 代入した値をセット
			uSetSekizouFlag();
		}
		// 石像ギミックを攻略済みの場合
		if( seikai == true ){
			// 石像の角度をNUMフラグに置き換える
			uResetNumStone(1, 3, 1, 3, 1, 3);	// 0=0度, 1=90度, 2=180度, 3=270, 4=360度 とする
			// 代入した値をセット
			uSetSekizouFlag();
		}
	}else{
		// マップチェンジをしなかった場合は回転値を保持するので取得した値をそのままセット
		uSetSekizouFlag();
	}
	
	// 石像のナビマップアイコン（ターゲット）
	g_map_navi01 <- ArrangePointNaviMapIcon_(NAVIMAP_ICON.DIRECTION, "map_navi_01");  // 左上
	g_map_navi02 <- ArrangePointNaviMapIcon_(NAVIMAP_ICON.DIRECTION, "map_navi_02");  // 右上
	g_map_navi03 <- ArrangePointNaviMapIcon_(NAVIMAP_ICON.DIRECTION, "map_navi_03");  // 左中
	g_map_navi04 <- ArrangePointNaviMapIcon_(NAVIMAP_ICON.DIRECTION, "map_navi_04");  // 右中
	g_map_navi05 <- ArrangePointNaviMapIcon_(NAVIMAP_ICON.DIRECTION, "map_navi_05");  // 左下
	g_map_navi06 <- ArrangePointNaviMapIcon_(NAVIMAP_ICON.DIRECTION, "map_navi_06");  // 右下
	SetNaviMapIconVisible_(g_map_navi01, true);
	SetNaviMapIconVisible_(g_map_navi02, true);
	SetNaviMapIconVisible_(g_map_navi03, true);
	SetNaviMapIconVisible_(g_map_navi04, true);
	SetNaviMapIconVisible_(g_map_navi04, true);
	SetNaviMapIconVisible_(g_map_navi05, true);
	SetNaviMapIconVisible_(g_map_navi06, true);
	
	
	// 時間の設定
	if(main_num == 3){
		if(grave_num <= GetFlagID_("CONST_SS_CC_GET_RACE_PROGRAM")){	// Num4 <= 17
			// シナリオ進行中は夜（瘴気）に設定
			SetTime_(8700);
		}
	}
	
	DebugPrint(" ");
	DebugPrint("NUM_SCENARIO_MAIN の値は " + main_num + " になりました。");
	
	//----------
	// ▼NPC配置
	//----------
	// ID初期化
	g_gost_e		 <- C_NONE_ID;
	g_gost_f		 <- C_NONE_ID;
	g_npc_chomach	 <- C_NONE_ID;
	
	// リソース読み込み
	local id_npc_gost	 = ReadNpc_("m100_01");	// モンスターの幽霊
	local id_chomach	 = ReadNpc_("n006");	// チョーマッハ

	// ■モンスターの幽霊E
	g_gost_e = ArrangePointNpc_(id_npc_gost,  "npc_gost_e");
	SetScaleSilhouette(g_gost_e, SCALE.S, SILHOUETTE_WIDTH.S);
	SetReactorMsg_(g_gost_e, "GRAVE_NPC_GOST_REC");
	
	// ■モンスターの幽霊F
	g_gost_f = ArrangePointNpc_(id_npc_gost,  "npc_gost_f");
	SetScaleSilhouette(g_gost_f, SCALE.S, SILHOUETTE_WIDTH.S);
	SetReactorMsg_(g_gost_f, "GRAVE_NPC_GOST_REC");
	
	// ■チョーマッハ
	if(main_num == GetFlagID_("CONST_SM_CEMETERY")){						// Num0 = 3
		// Demo213[故人から受け継いだもの②]の再生後まで
		if(grave_num <= GetFlagID_("CONST_SS_CC_GO_TO_THE_NEXT_TRANSFER")){	// Num4 = 16 以下
			g_npc_chomach  = ArrangePointNpc_(id_chomach,  "npc_chomach_01");
			SetTalkCameraType_(g_npc_chomach, TALK_CAMERA_UP);	// 会話時カメラの設定
			SetReactorMsg_(g_npc_chomach, "GRAVE_NPC_CHOMACH_REC");
			// アナライズのターゲット名を切り替える(マスター・ノチョーラ→チョーマッハ)
			SetTargetNameKey_(g_npc_chomach, "NAME_TAG_CHOMACH");
		}
		// Demo220[レースプログラム発見]の再生後
		if(grave_num >= GetFlagID_("CONST_SS_CC_GET_RACE_PROGRAM")){		// Num4 = 17 以上
			g_npc_chomach  = ArrangePointNpc_(id_chomach,  "npc_chomach_02");
			SetTalkCameraType_(g_npc_chomach, TALK_CAMERA_UP);	// 会話時カメラの設定
			SetReactorMsg_(g_npc_chomach, "GRAVE_NPC_CHOMACH_REC");
			// アナライズのターゲット名を切り替える(マスター・ノチョーラ→チョーマッハ)
			SetTargetNameKey_(g_npc_chomach, "NAME_TAG_CHOMACH");
		}
	}
	
	// ■ブンドルド
	LoadEffect_("ef730_01_oth_dark_aura01");		// まがまがしいオーラ
	if(main_num == 3){
		if(grave_num == GetFlagID_("CONST_SS_CC_INTO_THE_SECRET_ROOM")){		// Num4 = 6
			local id_npc_bundorudo = ReadNpc_("m203_00");						// リソース読み込み
			local npc_bundorudo = ArrangePointNpc_(id_npc_bundorudo,  "npc_boss_01");
			local efc_bun = SetSelectBoneEffectSetOffset_("ef730_01_oth_dark_aura01", npc_bundorudo, ATTACH_EFFECT2, Vec3(0.0, -5.0, 0.0));		//黒オーラ
			SetReactorMsg_(npc_bundorudo, "GRAVE_NPC_BUNDORUDO_REC");
			SetHideIfFar_(npc_bundorudo, false);
		}
		if(grave_num == GetFlagID_("CONST_SS_CC_BE_WIPED_OUT_BUNDORUDO")){		// Num4 = 9
			local id_npc_bundorudo = ReadNpc_("m203_00");						// リソース読み込み
			local npc_bundorudo = ArrangePointNpc_(id_npc_bundorudo,  "npc_boss_02");
			local efc_bun = SetSelectBoneEffectSetOffset_("ef730_01_oth_dark_aura01", npc_bundorudo, ATTACH_EFFECT2, Vec3(0.0, -5.0, 0.0));		//黒オーラ
			SetReactorMsg_(npc_bundorudo, "GRAVE_NPC_BUNDORUDO_REC");
			SetHideIfFar_(npc_bundorudo, false);
		}
	}

	//-----------
	// ▼地雷配置
	//-----------
	DebugPrint("イベント地雷の読込");

	// ID初期化
	g_mine_wall_paper		<- C_NONE_ID;
	g_mine_ruler			<- C_NONE_ID;
	g_mine_book_01			<- C_NONE_ID;
	g_mine_book_02			<- C_NONE_ID;
	g_mine_hint_01			<- C_NONE_ID;
	g_mine_hint_02			<- C_NONE_ID;
	g_mine_hint_03			<- C_NONE_ID;
	g_mine_hint_04			<- C_NONE_ID;
	g_mine_01 				<- C_NONE_ID;
	g_mine_02 				<- C_NONE_ID;
	g_mine_03 				<- C_NONE_ID;
	g_mine_04 				<- C_NONE_ID;
	g_mine_stone_01 		<- C_NONE_ID;
	g_mine_stone_02 		<- C_NONE_ID;
	g_mine_stone_03 		<- C_NONE_ID;
	g_mine_stone_04 		<- C_NONE_ID;
	g_mine_stone_05 		<- C_NONE_ID;
	g_mine_stone_06 		<- C_NONE_ID;
	g_mine_phantom_wall_01 	<- C_NONE_ID;
	g_mine_phantom_wall_02 	<- C_NONE_ID;

	// ■張り紙
	g_mine_wall_paper		 = SetPointCircleEventMine_("mine_wall_paper", true);
	
	// ■ルーラポイント
	g_mine_ruler			 = SetPointCircleEventMine_("mine_rulerpoint", true);

	// ■幻の壁
	g_mine_phantom_wall_01	 = SetPointBoxEventMineNoFallWait_("mine_phantom_wall_01");// 東側
	g_mine_phantom_wall_02	 = SetPointBoxEventMineNoFallWait_("mine_phantom_wall_02");// 北側
	
	// ■レジスタンスのアジトにある本棚
	g_mine_book_01			 = SetPointCircleEventMine_("mine_book_01", true);// 真ん中列
	g_mine_book_02			 = SetPointCircleEventMine_("mine_book_02", true);// 入口手前
	
	// ■本棚のヒント
	g_mine_hint_01			 = SetPointCircleEventMine_("mine_hint_01", true);// 左上
	g_mine_hint_02			 = SetPointCircleEventMine_("mine_hint_02", true);// 右上
	g_mine_hint_03			 = SetPointCircleEventMine_("mine_hint_03", true);// 右下
	g_mine_hint_04			 = SetPointCircleEventMine_("mine_hint_04", true);// 左下

	// ■石像
	g_mine_stone_01			 = SetPointCircleEventMine_("mine_stone01", true);// 左上
	g_mine_stone_02			 = SetPointCircleEventMine_("mine_stone02", true);// 右上
	g_mine_stone_03			 = SetPointCircleEventMine_("mine_stone03", true);// 左中
	g_mine_stone_04			 = SetPointCircleEventMine_("mine_stone04", true);// 右中
	g_mine_stone_05			 = SetPointCircleEventMine_("mine_stone05", true);// 左下
	g_mine_stone_06			 = SetPointCircleEventMine_("mine_stone06", true);// 右下
	
	if(main_num == 3){
		// ■リアクターの地雷（デモ210[リアクターの遺言]再生）
		if(grave_num == GetFlagID_("CONST_SS_CC_FIND_OUT_SECRET_ROOM")){	// Num4 = 12
			g_mine_04 = SetPointCircleEventMine_("mine03", true);
		}
		// ■モニタの地雷
		if(grave_num >= GetFlagID_("CONST_SS_CC_FIND_OUT_SECRET_ROOM")		// Num4 = 12
		&& grave_num <= GetFlagID_("CONST_SS_CC_TAKE_OVER_VOLITION_2")){	// Num4 = 15
			g_mine_03 = SetPointCircleEventMine_("mine02", true);
		}
		// ■ブンドルド再戦時のデモ
		if(grave_num == GetFlagID_("CONST_SS_CC_BE_WIPED_OUT_BUNDORUDO")){	// Num4 = 9
			g_mine_02 = SetPointBoxEventMine_("mine01", false);
		}
		// ■秘密部屋に入った時のデモ
		if(grave_num == GetFlagID_("CONST_SS_CC_INTO_THE_SECRET_ROOM")){	// Num4 = 6
			g_mine_01 = SetPointBoxEventMine_("mine01", false);
		}
	}
	
	//---------------
	// ▼ギミック配置
	//---------------
	
	//※石像ギミックで使用するNUMフラグのフラグ番号は
	//　石像の角度に置き換えて使用し、リアルタイムで石像の角度の値を取得出来るようにしています。
	///////////////////////////////////////////////////////
	//【角度】  １８０度      【NUM番号】     ２         //
	//            ↑                          ↑         //
	// ２７０度 ←  → ９０度            ３ ←  → １    //
	//            ↓                          ↓         //
	//           ０度(３６０度)               ０(４)     //
	///////////////////////////////////////////////////////


	//------------------------------------------------
	//6体の石像ギミックの回転値をNUMフラグに格納する
	//------------------------------------------------
	// 石像1の場合
	if(g_num_stone1 == 0){ g_dir01 <-   0; }	//NUMフラグが"0"だったら  "0"度にする
	if(g_num_stone1 == 1){ g_dir01 <-  90; }	//NUMフラグが"1"だったら "90"度にする
	if(g_num_stone1 == 2){ g_dir01 <- 180; }	//NUMフラグが"2"だったら"180"度にする
	if(g_num_stone1 == 3){ g_dir01 <- 270; }	//NUMフラグが"3"だったら"270"度にする
	if(g_num_stone1 == 4){ g_dir01 <- 360; }	//NUMフラグが"4"だったら"360"度にする
	// 石像2の場合
	if(g_num_stone2 == 0){ g_dir02 <-   0; }
	if(g_num_stone2 == 1){ g_dir02 <-  90; }
	if(g_num_stone2 == 2){ g_dir02 <- 180; }
	if(g_num_stone2 == 3){ g_dir02 <- 270; }
	if(g_num_stone2 == 4){ g_dir02 <- 360; }
	// 石像3の場合
	if(g_num_stone3 == 0){ g_dir03 <-   0; }
	if(g_num_stone3 == 1){ g_dir03 <-  90; }
	if(g_num_stone3 == 2){ g_dir03 <- 180; }
	if(g_num_stone3 == 3){ g_dir03 <- 270; }
	if(g_num_stone3 == 4){ g_dir03 <- 360; }
	// 石像4の場合
	if(g_num_stone4 == 0){ g_dir04 <-   0; }
	if(g_num_stone4 == 1){ g_dir04 <-  90; }
	if(g_num_stone4 == 2){ g_dir04 <- 180; }
	if(g_num_stone4 == 3){ g_dir04 <- 270; }
	if(g_num_stone4 == 4){ g_dir04 <- 360; }
	// 石像5の場合
	if(g_num_stone5 == 0){ g_dir05 <-   0; }
	if(g_num_stone5 == 1){ g_dir05 <-  90; }
	if(g_num_stone5 == 2){ g_dir05 <- 180; }
	if(g_num_stone5 == 3){ g_dir05 <- 270; }
	if(g_num_stone5 == 4){ g_dir05 <- 360; }
	// 石像6の場合
	if(g_num_stone6 == 0){ g_dir06 <-   0; }
	if(g_num_stone6 == 1){ g_dir06 <-  90; }
	if(g_num_stone6 == 2){ g_dir06 <- 180; }
	if(g_num_stone6 == 3){ g_dir06 <- 270; }
	if(g_num_stone6 == 4){ g_dir06 <- 360; }
	
	//---------------------------
	//	6体の石像の読み込みと設置
	//---------------------------
	// ID初期化
	g_stone_01			 <- C_NONE_ID;
	g_stone_02			 <- C_NONE_ID;
	g_stone_03			 <- C_NONE_ID;
	g_stone_04			 <- C_NONE_ID;
	g_stone_05			 <- C_NONE_ID;
	g_stone_06			 <- C_NONE_ID;
	g_gim_rulerpoint	 <- C_NONE_ID;
	
	// リソース読み込み
	local id_stone_panther	= ReadGimmick_("o_G02_22");// ヘルコンドルの石像キラーパンサーの石像
	local id_stone_fish 	= ReadGimmick_("o_G02_21");// とつげきうおの石像
	local id_stone_condor 	= ReadGimmick_("o_G02_20");// キラーパンサーの石像
	local id_rulerpoint		= ReadGimmick_("o_com_08");// ルーラポイント
	
	// 6体の石像の設置
	g_stone_01 = ArrangePointGimmick_("o_G02_20", id_stone_panther, "g_stone01");// 左上
	g_stone_02 = ArrangePointGimmick_("o_G02_20", id_stone_panther, "g_stone02");// 右上
	g_stone_03 = ArrangePointGimmick_("o_G02_21", id_stone_fish, "g_stone03");	 // 左中
	g_stone_04 = ArrangePointGimmick_("o_G02_21", id_stone_fish, "g_stone04");	 // 右中
	g_stone_05 = ArrangePointGimmick_("o_G02_22", id_stone_condor, "g_stone05"); // 左下
	g_stone_06 = ArrangePointGimmick_("o_G02_22", id_stone_condor, "g_stone06"); // 右下
	
	// 石像とナビマップアイコンの向きを現状の値の方向に向かせる
	uSetDirStoneAndNavi();
	
	//	扉の設置
	if(main_num <= 3){
		if(grave_num <= GetFlagID_("CONST_SS_CC_SOLVE_THE_STONE_MYSTERY")){	// Num4 = 5
			// ■レジスタンスの扉
			local id_lock_door = ReadGimmick_("o_G02_02");
			local lock_door = ArrangePointGimmick_("o_G02_02", id_lock_door, "g_door");
		}
	}
	
	// ■リアクター
	local id_reactor  = ReadGimmick_("o_dem_07");		// リアクター
	local gmk_reactor = ArrangePointGimmick_("o_dem_07", id_reactor, "g_rec");
	SetScale_(gmk_reactor, 1.5);	// 見えにくいので、1.5倍にする
	if(main_num == 3){
		if (grave_num == GetFlagID_("CONST_SS_CC_FIND_OUT_SECRET_ROOM")) {	// Num4 = 12
			SetMotion_(gmk_reactor, MOT_GIMMICK_2, BLEND_N);
		}
	}
	
	// ■ルーラポイント
	g_gim_rulerpoint = ArrangePointGimmick_("o_com_08", id_rulerpoint, "g_rulerpoint");
	SetMotion_(g_gim_rulerpoint, MOT_GIMMICK_0, 0);
	if(GetEventFlg_("BFG_RULER_ADD_010") == true){					// Bit_210 ルーラ追加 秘密地下
		SetMotion_(g_gim_rulerpoint, MOT_GIMMICK_2, 0);
	}
	
	// ■コンピューターの明滅
	if(main_num == GetFlagID_("CONST_SM_CEMETERY")){	// Num0 = 3
		if(grave_num == GetFlagID_("CONST_SS_CC_FIND_OUT_THE_SCREEN")){	// Num4 = 13
			local id_flash  = ReadGimmick_("o_G02_11");
			local gmk_flash = ArrangePointGimmick_("o_G02_11", id_flash, "g_flash");
			SetMotion_(gmk_flash, MOT_GIMMICK_0, BLEND_N);
		}
	}
	
	// ■ディスプレイ
	if(main_num == GetFlagID_("CONST_SM_CEMETERY")){	// Num0 = 3
		if(grave_num >= GetFlagID_("CONST_SS_CC_FIND_OUT_THE_SCREEN")){	// Num4 = 13 以上
			local id_display  = ReadGimmick_("o_G02_14");
			local gmk_display = ArrangePointGimmick_("o_G02_14", id_display, "g_display");
		}
	}
	// 氷原シナリオ以降
	else if(main_num >= GetFlagID_("CONST_SM_ICE_FIELD")){	// Num0 = 4 以上
		local id_display  = ReadGimmick_("o_G02_14");
		local gmk_display = ArrangePointGimmick_("o_G02_14", id_display, "g_display");
	}
	
	//------------------
	//	エフェクトの設置
	//------------------
	//アタッチ用のモデルを設置
	local model_base = ReadGimmick_("o_effect_base");
	base1to2 <- ArrangePointGimmick_("o_effect_base", model_base, "obj001");//石像1→石像2へ飛ぶ光
	base1to3 <- ArrangePointGimmick_("o_effect_base", model_base, "obj001");//石像1→石像3へ飛ぶ光
	base2to1 <- ArrangePointGimmick_("o_effect_base", model_base, "obj002");//石像2→石像1へ飛ぶ光
	base2to4 <- ArrangePointGimmick_("o_effect_base", model_base, "obj002");//石像2→石像4へ飛ぶ光
	base3to1 <- ArrangePointGimmick_("o_effect_base", model_base, "obj003");//石像3→石像1へ飛ぶ光
	base3to4 <- ArrangePointGimmick_("o_effect_base", model_base, "obj003");//石像3→石像4へ飛ぶ光
	base3to5 <- ArrangePointGimmick_("o_effect_base", model_base, "obj003");//石像3→石像5へ飛ぶ光
	base4to2 <- ArrangePointGimmick_("o_effect_base", model_base, "obj004");//石像4→石像2へ飛ぶ光
	base4to3 <- ArrangePointGimmick_("o_effect_base", model_base, "obj004");//石像4→石像3へ飛ぶ光
	base4to6 <- ArrangePointGimmick_("o_effect_base", model_base, "obj004");//石像4→石像6へ飛ぶ光
	base5to3 <- ArrangePointGimmick_("o_effect_base", model_base, "obj005");//石像5→石像3へ飛ぶ光
	base5to6 <- ArrangePointGimmick_("o_effect_base", model_base, "obj005");//石像5→石像6へ飛ぶ光
	base6to4 <- ArrangePointGimmick_("o_effect_base", model_base, "obj006");//石像6→石像4へ飛ぶ光
	base6to5 <- ArrangePointGimmick_("o_effect_base", model_base, "obj006");//石像6→石像5へ飛ぶ光
	
	// 光エフェクトの読み込み
	LoadEffect_("ef731_01_mag_light01");
	efc_1to2 <- SetSelectBoneEffect_("ef731_01_mag_light01", base1to2, ATTACH_GLOBAL);
	efc_1to3 <- SetSelectBoneEffect_("ef731_01_mag_light01", base1to3, ATTACH_GLOBAL);
	efc_2to1 <- SetSelectBoneEffect_("ef731_01_mag_light01", base2to1, ATTACH_GLOBAL);
	efc_2to4 <- SetSelectBoneEffect_("ef731_01_mag_light01", base2to4, ATTACH_GLOBAL);
	efc_3to1 <- SetSelectBoneEffect_("ef731_01_mag_light01", base3to1, ATTACH_GLOBAL);
	efc_3to4 <- SetSelectBoneEffect_("ef731_01_mag_light01", base3to4, ATTACH_GLOBAL);
	efc_3to5 <- SetSelectBoneEffect_("ef731_01_mag_light01", base3to5, ATTACH_GLOBAL);
	efc_4to2 <- SetSelectBoneEffect_("ef731_01_mag_light01", base4to2, ATTACH_GLOBAL);
	efc_4to3 <- SetSelectBoneEffect_("ef731_01_mag_light01", base4to3, ATTACH_GLOBAL);
	efc_4to6 <- SetSelectBoneEffect_("ef731_01_mag_light01", base4to6, ATTACH_GLOBAL);
	efc_5to3 <- SetSelectBoneEffect_("ef731_01_mag_light01", base5to3, ATTACH_GLOBAL);
	efc_5to6 <- SetSelectBoneEffect_("ef731_01_mag_light01", base5to6, ATTACH_GLOBAL);
	efc_6to4 <- SetSelectBoneEffect_("ef731_01_mag_light01", base6to4, ATTACH_GLOBAL);
	efc_6to5 <- SetSelectBoneEffect_("ef731_01_mag_light01", base6to5, ATTACH_GLOBAL);
	
	// 光エフェクトのサイズ設定 (初期状態は"0"にして見えないようにする)
	SetEffectScale_(efc_1to2, EFC_SIZE_MIN);
	SetEffectScale_(efc_1to3, EFC_SIZE_MIN);
	SetEffectScale_(efc_2to1, EFC_SIZE_MIN);
	SetEffectScale_(efc_2to4, EFC_SIZE_MIN);
	SetEffectScale_(efc_3to1, EFC_SIZE_MIN);
	SetEffectScale_(efc_3to4, EFC_SIZE_MIN);
	SetEffectScale_(efc_3to5, EFC_SIZE_MIN);
	SetEffectScale_(efc_4to2, EFC_SIZE_MIN);
	SetEffectScale_(efc_4to3, EFC_SIZE_MIN);
	SetEffectScale_(efc_4to6, EFC_SIZE_MIN);
	SetEffectScale_(efc_5to3, EFC_SIZE_MIN);
	SetEffectScale_(efc_5to6, EFC_SIZE_MIN);
	SetEffectScale_(efc_6to4, EFC_SIZE_MIN);
	SetEffectScale_(efc_6to5, EFC_SIZE_MIN);
	
	
	//-------------------------
	// ▼リアクターポイント配置
	//-------------------------
	// ■仕掛け扉
	if( seikai == false ){
		local reactorPoint01 = ArrangeMsgReactorPoint("recpointo_door", GetFlagID_("BFG_REACTER_POINT_092")// Bit_1591 仕掛け扉
			, SHORT_DIST, "REC_POINT_DOOR_01", "REC_POINT_DOOR_02");
	}
	
	// ■本棚（左上）
	local reactorPoint02 = ArrangeMsgReactorPoint("recpointo_book01", GetFlagID_("BFG_REACTER_POINT_089")// Bit_1588 本棚
		, SHORT_DIST, "REC_POINT_BOOK_01", "REC_POINT_BOOK_02");
	
	// ■本棚（右上）
	local reactorPoint03 = ArrangeMsgReactorPoint("recpointo_book02", GetFlagID_("BFG_REACTER_POINT_089")// Bit_1588 本棚
		, SHORT_DIST, "REC_POINT_BOOK_01", "REC_POINT_BOOK_02");
	
	// ■本棚（右下）
	local reactorPoint04 = ArrangeMsgReactorPoint("recpointo_book03", GetFlagID_("BFG_REACTER_POINT_089")// Bit_1588 本棚
		, SHORT_DIST, "REC_POINT_BOOK_01", "REC_POINT_BOOK_02");
	
	// ■本棚（左下）
	local reactorPoint05 = ArrangeMsgReactorPoint("recpointo_book04", GetFlagID_("BFG_REACTER_POINT_089")// Bit_1588 本棚
		, SHORT_DIST, "REC_POINT_BOOK_01", "REC_POINT_BOOK_02");
	
	// ■通信装置
	local reactorPoint06 = ArrangeMsgReactorPoint("recpointo_monitor", GetFlagID_("BFG_REACTER_POINT_093")// Bit_1592 通信装置
		, SHORT_DIST, "REC_POINT_MONITOR_01", "REC_POINT_MONITOR_02");
	
	// ■リアクターの残骸
	local reactorPoint07 = ArrangeMsgReactorPoint("recpointo_reactor", GetFlagID_("BFG_REACTER_POINT_094")// Bit_1593 リアクターの残骸
		, SHORT_DIST, "REC_POINT_REACTOR_01", "REC_POINT_REACTOR_02");
	
	// ■石像（左上）（ヘルコンドル）
	local reactorPoint08 = ArrangeMsgReactorPoint("recpointo_stone01", GetFlagID_("BFG_REACTER_POINT_091")// Bit_1590 石像
		, SHORT_DIST, "REC_POINT_STONE_01", "REC_POINT_HERUKONDORU");
	
	// ■石像（右上）（ヘルコンドル）
	local reactorPoint09 = ArrangeMsgReactorPoint("recpointo_stone02", GetFlagID_("BFG_REACTER_POINT_091")// Bit_1590 石像
		, SHORT_DIST, "REC_POINT_STONE_01", "REC_POINT_HERUKONDORU");
	
	// ■石像（左中）（とつげきうお）
	local reactorPoint10 = ArrangeMsgReactorPoint("recpointo_stone03", GetFlagID_("BFG_REACTER_POINT_091")// Bit_1590 石像
		, SHORT_DIST, "REC_POINT_STONE_01", "REC_POINT_TOTUGEKIUO");
	
	// ■石像（右中）（とつげきうお）
	local reactorPoint11 = ArrangeMsgReactorPoint("recpointo_stone04", GetFlagID_("BFG_REACTER_POINT_091")// Bit_1590 石像
		, SHORT_DIST, "REC_POINT_STONE_01", "REC_POINT_TOTUGEKIUO");
	
	// ■石像（左下）（キラーパンサー）
	local reactorPoint12 = ArrangeMsgReactorPoint("recpointo_stone05", GetFlagID_("BFG_REACTER_POINT_091")// Bit_1590 石像
		, SHORT_DIST, "REC_POINT_STONE_01", "REC_POINT_KIRAPANSA");
	
	// ■石像（右下）（キラーパンサー）
	local reactorPoint13 = ArrangeMsgReactorPoint("recpointo_stone06", GetFlagID_("BFG_REACTER_POINT_091")// Bit_1590 石像
		, SHORT_DIST, "REC_POINT_STONE_01", "REC_POINT_KIRAPANSA");
	
	// ■羊皮紙
	local reactorPoint14 = ArrangeMsgReactorPoint("recpointo_harigami", GetFlagID_("BFG_REACTER_POINT_090")// Bit_1589 羊皮紙
		, SHORT_DIST, "REC_POINT_HARIGAMI_01", "REC_POINT_HARIGAMI_02");
	
	// ■ルーラポイント
	local reactorPoint_ruler = ArrangeMsgReactorPoint("recpointo_ruler", GetFlagID_("BFG_REACTER_POINT_010")// Bit_1520 リアクター ルーラポイント
		, SHORT_DIST, "REC_POINT_GRAVE_01", "REC_POINT_GRAVE_01_2");
	
	//-------------------------
	// ▼ナビマップアイコン配置
	//-------------------------
	// ID初期化
	g_exclamation02	 <- C_NONE_ID;
	g_exclamation03	 <- C_NONE_ID;
	
	
	// ■ルーラポイントアイコン
	if(GetEventFlg_("BFG_RULER_ADD_010") == true){									// Bit_210 ルーラ追加 秘密地下
		local ruler_icon = ArrangePointNaviMapIcon_(NAVIMAP_ICON.RULER_POINT , "g_rulerpoint");
		SetNaviMapIconVisible_(ruler_icon, true);
	}
	
	// ■「！」
	if(grave_num == GetFlagID_("CONST_SS_CC_FIND_OUT_SECRET_ROOM")){					// Num4 = 12
		g_exclamation03 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "mine03");	// リアクター
	}
	if(grave_num == GetFlagID_("CONST_SS_CC_FIND_OUT_THE_SCREEN")){						// Num4 = 12
		g_exclamation02 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "mine02");	// モニタ
	}
	
	EventEnd_();
}


//------------------------------------------------
//		イベントスタート
//------------------------------------------------
function EventStartOperate()
{
	// フラグの状態を取得
	local main_num  = GetNumFlg_("NUM_SCENARIO_MAIN");
	local grave_num = GetNumFlg_("NUM_SCENARIO_SUB_GRAVE");

	if(main_num >= 3){
		// モンスターの幽霊Eを半透明にする
		SetManualCalcAlpha_(g_gost_e, true);
		SetAlpha_(g_gost_e, 0.3);
		// モンスターの幽霊Fを半透明にする
		SetManualCalcAlpha_(g_gost_f, true);
		SetAlpha_(g_gost_f, 0.3);
	}

	// 戦闘開始
	if(main_num == 3){
		if(grave_num == GetFlagID_("CONST_SS_CC_PRE_REMATCH_BUNDORUDO")){	// Num4 = 10
			// ブンドルド再戦中のフラグ
			SetNumFlg_("NUM_SCENARIO_SUB_GRAVE", GetFlagID_("CONST_SS_CC_JDG_REMATCH_BUNDORUDO"));	// Num4 = 11
			// ブンドルド再戦
			ChangeBattleParty_(15); // ブンドルド
		}
		if(grave_num == GetFlagID_("CONST_SS_CC_PRE_BATTLE_BUNDORUDO")){	// Num4 = 7
			// ブンドルド戦中のフラグ
			SetNumFlg_("NUM_SCENARIO_SUB_GRAVE", GetFlagID_("CONST_SS_CC_JDG_BATTLE_BUNDORUDO"));	// Num4 = 8
			// ブンドルド戦
			ChangeBattleParty_(15); // ブンドルド
		}
	}

	// 戦闘結果
	if(main_num == 3){
		//ブンドルド再戦
		if(grave_num == GetFlagID_("CONST_SS_CC_JDG_REMATCH_BUNDORUDO")){	// Num4 = 11
			if (GetBattleEndType_() == BATTLE_END_TYPE_WIN){
				// ブンドルドに勝利
				SetNumFlg_("NUM_SCENARIO_SUB_GRAVE", GetFlagID_("CONST_SS_CC_FIND_OUT_SECRET_ROOM"));// Num4 = 12
				// デモ後に設定される主人公の位置と向き
				SetReturnDemoPosDir_(Vec3(-17.8, 0.0, -216.1), -85);
				// Demo209[ブンドルド戦勝利]が再生される
				StopBgm_(0);
				EventStartChangeDemo(209, FADE_COLOR_BLACK);//209[ブンドルド戦勝利]
			}
			else{
				// ※敗北処理はAfterBattle()で記述
			}
		}
		//ブンドルド初戦
		if(grave_num == GetFlagID_("CONST_SS_CC_JDG_BATTLE_BUNDORUDO")){	// Num4 = 8
			if (GetBattleEndType_() == BATTLE_END_TYPE_WIN){
				// ブンドルドに勝利
				SetNumFlg_("NUM_SCENARIO_SUB_GRAVE", GetFlagID_("CONST_SS_CC_FIND_OUT_SECRET_ROOM"));// Num4 = 12
				// デモ後に設定される主人公の位置と向き
				SetReturnDemoPosDir_(Vec3(-17.8, 0.0, -216.1), -85);
				// Demo209[ブンドルド戦勝利]が再生される
				StopBgm_(0);
				EventStartChangeDemo(209, FADE_COLOR_BLACK);//209[ブンドルド戦勝利]
			}
			else{
				// ※敗北処理はAfterBattle()で記述
			}
		}
	}

	// デモの再生
	if(main_num == 3){
		//デモ220[レースプログラム発見]再生
		if(grave_num == GetFlagID_("CONST_SS_CC_GO_TO_THE_NEXT_TRANSFER")){// Num4 = 16
			SetNumFlg_("NUM_SCENARIO_SUB_GRAVE", GetFlagID_("CONST_SS_CC_GET_RACE_PROGRAM"));// Num4 = 17
			// デモの復帰位置をデモの完成後に設定します
			SetReturnDemoPosDir_(Vec3(-107.3, 0.0, -201.836), 48);
			EventStartChangeDemo(220, FADE_COLOR_BLACK);//220[レースプログラム発見]
		}
		//デモ213[故人から受け継いだもの②]再生
		if(grave_num == GetFlagID_("CONST_SS_CC_TAKE_OVER_VOLITION_2")){// Num4 = 15
			SetNumFlg_("NUM_SCENARIO_SUB_GRAVE", GetFlagID_("CONST_SS_CC_GO_TO_THE_NEXT_TRANSFER"));// Num4 = 16
			SetFade_(FADE_OUT, FADE_COLOR_WHITE, FADE_SHORT);
			SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
			WaitFade_();
			ChangeDemo_(213);//213[故人から受け継いだもの②]
		}
		//デモ212[故人から受け継いだもの 過去映像]再生
		if(grave_num == GetFlagID_("CONST_SS_CC_TAKE_OVER_VOLITION_1")){// Num4 = 14
			SetNumFlg_("NUM_SCENARIO_SUB_GRAVE", GetFlagID_("CONST_SS_CC_TAKE_OVER_VOLITION_2"));// Num4 = 15
			SetFade_(FADE_OUT, FADE_COLOR_WHITE, FADE_SHORT);
			SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
			WaitFade_();
			ChangeDemo_(212);//212[故人から受け継いだもの 過去映像]
		}
		//はじめて秘密地下に入った時のデモ
		if(grave_num == GetFlagID_("CONST_SS_CC_DESCEND_THE_STAIRS")){// Num4 = 4
			SetNumFlg_("NUM_SCENARIO_SUB_GRAVE", GetFlagID_("CONST_SS_CC_SOLVE_THE_STONE_MYSTERY"));// Num4 = 5
			EventStartChangeDemo(205, FADE_COLOR_BLACK);//205[6体の石像]
		}
	}
	
	local route = GetEnteredMapChangeNullName_();
	DebugPrint(" ルートの値は "+ route +" です ");
	
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

	// NPCの種類を取得
	local target = GetTargetId_();

	switch(target){
	case g_gost_e :		//モンスターの幽霊E
		uTalkGostE();
		break;
	case g_gost_f :		//モンスターの幽霊F
		uTalkGostF();
		break;
	case g_npc_chomach :	// チョーマッハ
		uTalkChomach();
		break;
	default :
		DebugPrint("WARNING : NPC_IDが不正です [TouchNpc]");
		break;
	}
	
	EventEnd_();
}


//------------------------------------------------
//		地雷接触時
//------------------------------------------------
function TouchEventMine(){
	local target = GetTouchEventMineId_();
	local player = GetPlayerId_();
	//フラグの状態を取得
	local main_num  = GetNumFlg_("NUM_SCENARIO_MAIN");
	local grave_num = GetNumFlg_("NUM_SCENARIO_SUB_GRAVE");
	local count_num = GetNumFlg_("NUM_FLG_SECRETROOM_COUNT");	// 石像の手順リセット用
	local seikai    = GetEventFlg_("BFG_MOVE_SUCCESS_SECOND");	// ６体の石像ギミックを正確な位置に合わせられたフラグ
	
	//石像の回転タスクに使用
	local task1, task2, task3, task4, task5, task6;
	//エフェクトに使用
	local efc_task1to2, efc_task1to3, efc_task2to1, efc_task2to4;
	local efc_task3to1, efc_task3to4, efc_task3to5, efc_task4to2, efc_task4to3, efc_task4to6;
	local efc_task5to3, efc_task5to6, efc_task6to4, efc_task6to5;
	local alpha_def;
	
	switch ( target ) {
	case g_mine_01:			//秘密部屋に入った時のデモ
		uMinePlayDemo01();
		break;
	case g_mine_02:			//ブンドルド再戦時のデモ
		uMinePlayDemo02();
		break;
	case g_mine_03:			//モニタの地雷
		uMinePlayDemo03();
		break;
	case g_mine_04:			//リアクターの地雷（デモ210[リアクターの遺言]再生）
		uMinePlayDemo04();
		break;
	case g_mine_wall_paper:	//張り紙
		uMineWallPaper();
		break;
	case g_mine_ruler:		//ルーラポイント
		uMineRulerPoint();
		break;
	case g_mine_book_01:	//レジスタンスのアジトにある本棚(真ん中列)
		uMineResistanceBookShelf1();
		break;
	case g_mine_book_02:	//レジスタンスのアジトにある本棚(入口手前)
		uMineResistanceBookShelf2();
		break;
	case g_mine_hint_01:	//本棚(左上)
		uMineBookShelf1();
		break;
	case g_mine_hint_02:	//本棚(右上)
		uMineBookShelf2();
		break;
	case g_mine_hint_03:	//本棚(右下)
		uMineBookShelf3();
		break;
	case g_mine_hint_04:	//本棚(左下)
		uMineBookShelf4();
		break;
	case g_mine_stone_01:	//石像1(左上)
		uMineRotateStone1();
		break;
	case g_mine_stone_02:	//石像2(右上)
		uMineRotateStone2();
		break;
	case g_mine_stone_03:	//石像3(左中)
		uMineRotateStone3();
		break;
	case g_mine_stone_04:	//石像4(右中)
		uMineRotateStone4();
		break;
	case g_mine_stone_05:	//石像5(左下)
		uMineRotateStone5();
		break;
	case g_mine_stone_06:	//石像6(右下)
		uMineRotateStone6();
		break;
	default:
		DebugPrint("設置されていない地雷に接触判定しています！");
		break;
	}
	
	
	DebugPrint("石像1のNUMフラグは " + g_num_stone1 + " になりました。");
	DebugPrint("石像2のNUMフラグは " + g_num_stone2 + " になりました。");
	DebugPrint("石像3のNUMフラグは " + g_num_stone3 + " になりました。");
	DebugPrint("石像4のNUMフラグは " + g_num_stone4 + " になりました。");
	DebugPrint("石像5のNUMフラグは " + g_num_stone5 + " になりました。");
	DebugPrint("石像6のNUMフラグは " + g_num_stone6 + " になりました。");
	DebugPrint("石像1は " + g_dir01 + " 度になりました。");
	DebugPrint("石像2は " + g_dir02 + " 度になりました。");
	DebugPrint("石像3は " + g_dir03 + " 度になりました。");
	DebugPrint("石像4は " + g_dir04 + " 度になりました。");
	DebugPrint("石像5は " + g_dir05 + " 度になりました。");
	DebugPrint("石像6は " + g_dir06 + " 度になりました。");
	
	
	// 手順の回数を取得
	count_num = GetNumFlg_("NUM_FLG_SECRETROOM_COUNT");
	
	//手順通りに正解になった場合
	if( count_num == 3 ){
		//石像の向きが正解の向きになったら
		if( g_num_stone1 == 1 && g_num_stone2 == 3 && 
			g_num_stone3 == 1 && g_num_stone4 == 3 &&
			g_num_stone5 == 1 && g_num_stone4 == 3 ){
			if( seikai == false ){
				// 地雷を消す
				DeleteEventMine_(g_mine_stone_01);
				DeleteEventMine_(g_mine_stone_02);
				DeleteEventMine_(g_mine_stone_03);
				DeleteEventMine_(g_mine_stone_04);
				DeleteEventMine_(g_mine_stone_05);
				DeleteEventMine_(g_mine_stone_06);
				
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
				
				// 正解したフラグ	ナビマップのペイン削除のため、このタイミングで解放する
				SetNumFlg_("NUM_SCENARIO_SUB_GRAVE", GetFlagID_("CONST_SS_CC_INTO_THE_SECRET_ROOM"));// Num4 = 6
				SetEventFlg_("BFG_MOVE_SUCCESS_SECOND", true);// ６体の石像ギミックを正確な位置に合わせられたフラグ
				
				ChangeDemo_(206);
			}
		}
		// 手順オーバーした場合
		else{
			// 手順カウントを0に戻す
			SetNumFlg_("NUM_FLG_SECRETROOM_COUNT", 0);
			
			// フェードアウト
			SetFadePlane_(FADE_PLANE.PLANE_3D);
			SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
			SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
			WaitFade_();
			
			//石像の配置を初期化する
			uResetNumStone(2, 3, 1, 1, 0, 1);		//初期値をグローバル変数に代入
			uSetSekizouFlag();						//代入した値をセット
			uResetDirStone(180, 270, 90, 90, 0, 90)	//石像の向きを初期化する
			uSetDirStoneAndNavi();					//石像とナビマップアイコンの向きを現状の値の方向に向かせる
			
			Wait_(20);
			
			// システムメッセージ
			OpenMsgWnd_();
			ShowMsg_("GIMMICK_NOT_CLEAR_001");		// しかけは　解けなかったようだ……。
			KeyInputWait_();
			CloseMsgWnd_();
			
			PlaySE_("SE_FLD_129");
			
			// システムメッセージ
			OpenMsgWnd_();
			ShowMsg_("GIMMICK_NOT_CLEAR_002");		// 石像が　元の向きに　もどった。
			KeyInputWait_();
			CloseMsgWnd_();
			
			// フェードイン
			Wait_(10);
			SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
			SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
			WaitFade_();
			
		}
	}
	
	// 幻の壁に触れたら隠し部屋をナビマップに表示させる
	if(target == g_mine_phantom_wall_01){
		DeleteEventMine_(g_mine_phantom_wall_01);
		SetEventFlg_("BFG_OPEN_SECRET_AREA_G02_01_1", true);// 東側の隠し部屋オープンフラグ
	}
	if(target == g_mine_phantom_wall_02){
		DeleteEventMine_(g_mine_phantom_wall_02);
		SetEventFlg_("BFG_OPEN_SECRET_AREA_G02_01_2", true);// 北側の隠し部屋オープンフラグ
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
//		モンスターの幽霊Eの会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkGostE()
{
	// フラグの状態を取得
	local main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");				//Num0
	local grave_num	 = GetNumFlg_("NUM_SCENARIO_SUB_GRAVE");		//Num4
	local sky_num	 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");			//Num9
	
	// 霊道シナリオ開始～ブンドルド撃破まで
	if(main_num == GetFlagID_("CONST_SM_CEMETERY")){						// Num0 = 3
		if(grave_num <= GetFlagID_("CONST_SS_CC_FIND_OUT_THE_SCREEN")){		// Num4 = 13 以下
			uMessage("NPC_GOST_E_010");			//「ブンドルドは　おくびょう者さ。
		// ブンドルド撃破後
		}else if(grave_num <= GetFlagID_("CONST_SS_CC_CLEAR_CEMETERY")){	// Num4 = 18 以下
			uMessage("NPC_GOST_E_020");			//「おくびょう者の　ブンドルドめ！
		}
	}
	// 霊道シナリオクリア後～ガルビルス撃破前まで
	else if(main_num <= GetFlagID_("CONST_SM_CORE")){						// Num0 = 7 以下
		uMessage("NPC_GOST_E_020");				//「おくびょう者の　ブンドルドめ！
	}
	// ガルビルス撃破後～巨大ブンドルド撃破前まで
	else if(main_num == GetFlagID_("CONST_SM_SKY")){						// Num0 = 8
		if(sky_num <= GetFlagID_("CONST_SS_SK_JDG_REMATCH_G_BUNDORUDO")){	// Num9 = 23 以下
			uMessage("NPC_GOST_E_030");			//「外は　すごいことに　なってるみたいだな。
		}
		// 巨大ブンドルド撃破後～表シナリオクリアまで
		else if(sky_num <= GetFlagID_("CONST_SS_SK_DATA_SAVED")){			// Num9 = 58 以下
			uMessage("NPC_GOST_E_040");			//「幽霊仲間たちから聞いたよ。
		}
	}
	// 表シナリオクリア後
	else if(main_num >= GetFlagID_("CONST_SM_INSIDE_CLEAR")){				// Num0 = 9 以上
		uMessage("NPC_GOST_E_050");				//「よう！　今日は　何の用で
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		モンスターの幽霊Fの会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkGostF()
{
	//モンスターの幽霊FはMSG固定
	OpenMsgWnd_();
	ShowMsg_("NPC_GOST_F_010");					//「このアンデッドガーデンの　しかけは
	KeyInputWait_();
	CloseMsgWnd_();
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		チョーマッハとの会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkChomach()
{
	// フラグの状態を取得
	local main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");				//Num0
	local grave_num	 = GetNumFlg_("NUM_SCENARIO_SUB_GRAVE");		//Num4
	
	if(main_num == GetFlagID_("CONST_SM_CEMETERY")){						// Num0 = 3
		// Demo213[故人から受け継いだもの②]の再生後まで
		if(grave_num <= GetFlagID_("CONST_SS_CC_GO_TO_THE_NEXT_TRANSFER")){	// Num4 = 16 以下
			// チョーマッハのメッセージ
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_CHOMACH");
			ShowMsg_("NPC_CHOMACH_010");				//「また　何か　書いてるあるっちょ！
			KeyInputWait_();
			CloseMsgWnd_();
		}
		// Demo220[レースプログラム発見]の再生後
		if(grave_num >= GetFlagID_("CONST_SS_CC_GET_RACE_PROGRAM")){		// Num4 = 17 以上
			// チョーマッハのメッセージ
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_CHOMACH");
			ShowMsg_("NPC_CHOMACH_020");				//「すぐに　崩落都市へ行こうと　思ったけど
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		秘密部屋に入った時の処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMinePlayDemo01()
{
	local grave_num = GetNumFlg_("NUM_SCENARIO_SUB_GRAVE");
	
	if(grave_num == GetFlagID_("CONST_SS_CC_INTO_THE_SECRET_ROOM")){						// Num4 = 6
		DeleteEventMine_(g_mine_01);
		SetNumFlg_("NUM_SCENARIO_SUB_GRAVE",GetFlagID_("CONST_SS_CC_PRE_BATTLE_BUNDORUDO"));// Num4 = 7
		// デモの復帰位置をデモの完成後に設定します
		//SetReturnDemoPosDir_(Vec3(261.301, 75.308, -113.488), -28);
		//207[ブンドルド登場]
		ChangeDemo_(207);
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		ブンドルド再戦時の処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMinePlayDemo02()
{
	local grave_num = GetNumFlg_("NUM_SCENARIO_SUB_GRAVE");
	
	if(grave_num == GetFlagID_("CONST_SS_CC_BE_WIPED_OUT_BUNDORUDO")){						 // Num4 = 9
		DeleteEventMine_(g_mine_02);
		SetNumFlg_("NUM_SCENARIO_SUB_GRAVE",GetFlagID_("CONST_SS_CC_PRE_REMATCH_BUNDORUDO"));// Num4 = 10
		// デモの復帰位置をデモの完成後に設定します
		//SetReturnDemoPosDir_(Vec3(261.301, 75.308, -113.488), -28);
		//Demo208[ブンドルド再戦]
		ChangeDemo_(208);
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		モニタの地雷に触れた時の処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMinePlayDemo03()
{
	local grave_num = GetNumFlg_("NUM_SCENARIO_SUB_GRAVE");
	local player = GetPlayerId_();
	
	CommPlayerTurnAroundDir(180);
	
	//デモ211[故人から受け継いだもの①]再生）
	if(grave_num == GetFlagID_("CONST_SS_CC_FIND_OUT_THE_SCREEN")){							// Num4 = 13
		DeleteEventMine_(g_mine_03);
		SetNaviMapIconVisible_(g_exclamation02, false);	// 「！」アイコンを消す
		SetNumFlg_("NUM_SCENARIO_SUB_GRAVE",GetFlagID_("CONST_SS_CC_TAKE_OVER_VOLITION_1"));// Num4 = 14
		//Demo211[故人から受け継いだもの①]
		ChangeDemo_(211);
	}
	//セキュリティコードを知る前のモニタ（システムMSG表示）
	if(grave_num == GetFlagID_("CONST_SS_CC_FIND_OUT_SECRET_ROOM")){//フラグ「12」
		local pos  = Vec3(-6.5, 0.0, -299.2);
		//システムメッセージ
		OpenMsgWnd_();
		ShowMsg_("DEMO_209_AFT_SYS_01");
		KeyInputWait_();
		CloseMsgWnd_();
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		リアクターの地雷に触れた時の処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMinePlayDemo04()
{
	local grave_num = GetNumFlg_("NUM_SCENARIO_SUB_GRAVE");
	
	CommPlayerTurnAroundDir(-90);
	
	if(grave_num == GetFlagID_("CONST_SS_CC_FIND_OUT_SECRET_ROOM")){						// Num4 = 12
		DeleteEventMine_(g_mine_04);
		SetNaviMapIconVisible_(g_exclamation03, false);	// 「！」アイコンを消す
		SetNumFlg_("NUM_SCENARIO_SUB_GRAVE",GetFlagID_("CONST_SS_CC_FIND_OUT_THE_SCREEN"));	// Num4 = 13
		// デモの復帰位置をデモの完成後に設定します
		SetReturnDemoPosDir_(Vec3(-114.487, 0.0, -187.9), -188);
		//Demo210[リアクターの遺言]
		ChangeDemo_(210);
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//		壁の張り紙を調べた時の処理
//
//----------------------------------------------------------------------------
//	引数	: なし
//
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function uMineWallPaper()
{
	local player = GetPlayerId_();
	
	// レイアウトの読み込み
	LoadLayout_("black");
	
	local pos  = Vec3(50.0, 0.0, 320.0);
	uPlayerTurnAroundPos(pos);
	SetLayoutAnime_("fade_in", false);
	//黒半透明イン
	Wait_(30);
	SetLayoutAnime_("loop", false);
	//黒半透明L
	Wait_(5);
	// メッセージ
	ShowScreenMessage_("MINE_WALL_PAPER_001", false);
	//黒半透明アウト
	SetLayoutAnime_("fade_out", false);			//システムメッセージ(センタリング)
	
}


//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//		ルーラポイントを調べた時の処理
//
//----------------------------------------------------------------------------
//	引数	: なし
//
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function uMineRulerPoint()
{
	CommPlayerTurnAroundObj(g_gim_rulerpoint);
	CommRulerPointEvent(g_gim_rulerpoint, "BFG_RULER_ADD_010", "g_rulerpoint"); 
}


//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//		レジスタンスのアジトにある本棚(真ん中列)を調べた時の処理
//
//----------------------------------------------------------------------------
//	引数	: なし
//
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function uMineResistanceBookShelf1()
{
	local player = GetPlayerId_();
	
	local pos  = Vec3(81.8, 0.0, -230.9);
	uPlayerTurnAroundPos(pos);
	
	//システムメッセージ
	OpenMsgWnd_();
	ShowMsg_("MINE_BOOK_SHELF_001");
	KeyInputWait_();
	CloseMsgWnd_();
}


//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//		レジスタンスのアジトにある本棚(入口手前)を調べた時の処理
//
//----------------------------------------------------------------------------
//	引数	: なし
//
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function uMineResistanceBookShelf2()
{
	local player = GetPlayerId_();
	
	local pos  = Vec3(76.0, 0.0, -142.8);
	uPlayerTurnAroundPos(pos);
	
	//システムメッセージ
	OpenMsgWnd_();
	ShowMsg_("MINE_BOOK_SHELF_002");
	KeyInputWait_();
	CloseMsgWnd_();
}


//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//		本棚(左上)を調べた時の処理
//
//----------------------------------------------------------------------------
//	引数	: なし
//
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function uMineBookShelf1()
{
	local player = GetPlayerId_();
	
	SetEventFlg_("BFG_LIMIT_BOOKSHELF_G02_01", true); // Bit_1121 本棚周辺の配置モンスターを解禁
	local pos  = Vec3(-90.1, -10.0, -79.1);
	uPlayerTurnAroundPos(pos);
	
	// 本棚のメッセージ内容を取得
	local msg = uReturnBookshelfMsg("NUM_FLG_EXAMINE_BOOKSHELF_A")
	
	//システムメッセージ
	OpenMsgWnd_();
	ShowMsg_(msg);
	KeyInputWait_();
	CloseMsgWnd_();
}


//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//		本棚(右上)を調べた時の処理
//
//----------------------------------------------------------------------------
//	引数	: なし
//
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function uMineBookShelf2()
{
	local player = GetPlayerId_();
	
	SetEventFlg_("BFG_LIMIT_BOOKSHELF_G02_01", true); // Bit_1121 本棚周辺の配置モンスターを解禁
	local pos  = Vec3(82.0, -10.0, -79.3);
	uPlayerTurnAroundPos(pos);
	
	// 本棚のメッセージ内容を取得
	local msg = uReturnBookshelfMsg("NUM_FLG_EXAMINE_BOOKSHELF_B")
	
	//システムメッセージ
	OpenMsgWnd_();
	ShowMsg_(msg);
	KeyInputWait_();
	CloseMsgWnd_();
}


//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//		本棚(右下)を調べた時の処理
//
//----------------------------------------------------------------------------
//	引数	: なし
//
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function uMineBookShelf3()
{
	local player = GetPlayerId_();
	
	SetEventFlg_("BFG_LIMIT_BOOKSHELF_G02_01", true); // Bit_1121 本棚周辺の配置モンスターを解禁
	local pos  = Vec3(65.9, -10.0, 92.0);
	uPlayerTurnAroundPos(pos);
	
	// 本棚のメッセージ内容を取得
	local msg = uReturnBookshelfMsg("NUM_FLG_EXAMINE_BOOKSHELF_C")
	
	//システムメッセージ
	OpenMsgWnd_();
	ShowMsg_(msg);
	KeyInputWait_();
	CloseMsgWnd_();
}


//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//		本棚(左下)を調べた時の処理
//
//----------------------------------------------------------------------------
//	引数	: なし
//
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function uMineBookShelf4()
{
	local player = GetPlayerId_();
	
	SetEventFlg_("BFG_LIMIT_BOOKSHELF_G02_01", true); // Bit_1121 本棚周辺の配置モンスターを解禁
	local pos  = Vec3(-72.2, -10.0, 93.1);
	uPlayerTurnAroundPos(pos);
	
	// 本棚のメッセージ内容を取得
	local msg = uReturnBookshelfMsg("NUM_FLG_EXAMINE_BOOKSHELF_D")
	
	//システムメッセージ
	OpenMsgWnd_();
	ShowMsg_(msg);
	KeyInputWait_();
	CloseMsgWnd_();
}


//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//		石像1(左上)を90度回転させるタスク処理
//
//----------------------------------------------------------------------------
//	引数	: なし
//
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function uMineRotateStone1()
{
	//フラグの状態を取得
	local count_num = GetNumFlg_("NUM_FLG_SECRETROOM_COUNT");	// 石像の手順リセット用
	local seikai    = GetEventFlg_("BFG_MOVE_SUCCESS_SECOND");	// ６体の石像ギミックを正確な位置に合わせられたフラグ

	//石像の回転タスクに使用
	local task1, task2, task3, task4, task5, task6;
	//エフェクトに使用
	local efc_task1to2, efc_task1to3, efc_task2to1, efc_task2to4;
	local efc_task3to1, efc_task3to4, efc_task3to5, efc_task4to2, efc_task4to3, efc_task4to6;
	local efc_task5to3, efc_task5to6, efc_task6to4, efc_task6to5;
	local alpha_def;
	
	CommPlayerTurnAroundObj(g_stone_01);
	if( seikai == false ){	//ギミック未攻略の場合
		//システムメッセージ
		OpenMsgWnd_();
		ShowMsg_("STONE_ROTATE_QUE");
		KeyInputWait_();
		switch(GetQueryResult_()){
		// 時計回り
		case QUERY3_0:
			CloseMsgWnd_();
			
			//石像ギミックの手順をカウントする
			count_num = count_num + 1;
			SetNumFlg_("NUM_FLG_SECRETROOM_COUNT", count_num);
			
			//回転値を計算する関数
			uStoneRotateRight(g_stone_01);	//石像1を右に90度回転させる
			uStoneRotateRight(g_stone_02);	//石像2を右に90度回転させる
			uStoneRotateRight(g_stone_03);	//石像3を右に90度回転させる
			
			//--------------------------------
			//タスクにて石像を同時に回転させる
			//--------------------------------
			//調べた石像の回転処理
			PlaySE_("SE_FLD_100");
			task1 = Task_RotateToDirSetMotion_(g_stone_01, g_dir01, 2.0, "WAIT", "WAIT");
			WaitTask(task1);
			
			//ナビマップアイコンの向きを変える
			SetNaviMapIconDir_(g_map_navi01, g_dir01);
			
			//エフェクトサイズを標準サイズにしてから発射
			PlaySE_("SE_DEM_103");
			SetEffectScale_(efc_1to2, EFC_SIZE_MAX);
			SetEffectScale_(efc_1to3, EFC_SIZE_MAX);
			efc_task1to2 = Task_AnimeMoveNoFit_(base1to2, "beem1_to_2");
			efc_task1to3 = Task_AnimeMoveNoFit_(base1to3, "beem1_to_3");
			WaitTask(efc_task1to2);
			
			//エフェクトサイズを"0"にして見えないようにする
			for(alpha_def = EFC_SIZE_MAX; alpha_def >= EFC_SIZE_MIN; alpha_def = alpha_def - GRADUALLY_SMALL){
				SetEffectScale_(efc_1to2, alpha_def);
				SetEffectScale_(efc_1to3, alpha_def);
				Wait_(1);
			}
			
			//エフェクトのα値を0にする
			SetEffectScale_(efc_1to2, EFC_SIZE_MIN);
			SetEffectScale_(efc_1to3, EFC_SIZE_MIN);
			
			//ビームの位置を元に戻す
			SetPointPos_(base1to2, "obj001");
			SetPointPos_(base1to3, "obj001");
			
			//ビームが当たった石像の回転処理
			PlaySE_("SE_FLD_100");
			task2 = Task_RotateToDirSetMotion_(g_stone_02, g_dir02, 2.0, "WAIT", "WAIT");
			task3 = Task_RotateToDirSetMotion_(g_stone_03, g_dir03, 2.0, "WAIT", "WAIT");
			WaitTask(task2);
			
			//ナビマップアイコンの向きを変える
			SetNaviMapIconDir_(g_map_navi02, g_dir02);
			SetNaviMapIconDir_(g_map_navi03, g_dir03);
			
			//システムメッセージ
			OpenMsgWnd_();
			ShowMsg_("GRAVE_FAKE_SYS_04");
			KeyInputWait_();
			CloseMsgWnd_();
			break;
		// 反時計回り
		case QUERY3_1:
			CloseMsgWnd_();
			
			//石像ギミックの手順をカウントする
			count_num = count_num + 1;
			SetNumFlg_("NUM_FLG_SECRETROOM_COUNT", count_num);
			
			//回転値を計算する関数
			uStoneRotateLeft(g_stone_01);	//石像1を左に90度回転させる
			uStoneRotateLeft(g_stone_02);	//石像2を左に90度回転させる
			uStoneRotateLeft(g_stone_03);	//石像3を左に90度回転させる
			
			//--------------------------------
			//タスクにて石像を同時に回転させる
			//--------------------------------
			//調べた石像の回転処理
			PlaySE_("SE_FLD_100");
			task1 = Task_RotateToDirSetMotion_(g_stone_01, g_dir01, 2.0, "WAIT", "WAIT");
			WaitTask(task1);
			
			//ナビマップアイコンの向きを変える
			SetNaviMapIconDir_(g_map_navi01, g_dir01);
			
			//エフェクトサイズを標準サイズにしてから発射
			PlaySE_("SE_DEM_103");
			SetEffectScale_(efc_1to2, EFC_SIZE_MAX);
			SetEffectScale_(efc_1to3, EFC_SIZE_MAX);
			efc_task1to2 = Task_AnimeMoveNoFit_(base1to2, "beem1_to_2");
			efc_task1to3 = Task_AnimeMoveNoFit_(base1to3, "beem1_to_3");
			WaitTask(efc_task1to2);
			
			//エフェクトサイズを"0"にして見えないようにする
			for(alpha_def = EFC_SIZE_MAX; alpha_def >= EFC_SIZE_MIN; alpha_def = alpha_def - GRADUALLY_SMALL){
				SetEffectScale_(efc_1to2, alpha_def);
				SetEffectScale_(efc_1to3, alpha_def);
				Wait_(1);
			}
			
			//エフェクトのα値を0にする
			SetEffectScale_(efc_1to2, EFC_SIZE_MIN);
			SetEffectScale_(efc_1to3, EFC_SIZE_MIN);
			
			//ビームの位置を元に戻す
			SetPointPos_(base1to2, "obj001");
			SetPointPos_(base1to3, "obj001");
			
			//ビームが当たった石像の回転処理
			PlaySE_("SE_FLD_100");
			task2 = Task_RotateToDirSetMotion_(g_stone_02, g_dir02, 2.0, "WAIT", "WAIT");
			task3 = Task_RotateToDirSetMotion_(g_stone_03, g_dir03, 2.0, "WAIT", "WAIT");
			WaitTask(task2);
			
			//ナビマップアイコンの向きを変える
			SetNaviMapIconDir_(g_map_navi02, g_dir02);
			SetNaviMapIconDir_(g_map_navi03, g_dir03);
			
			//システムメッセージ
			OpenMsgWnd_();
			ShowMsg_("GRAVE_FAKE_SYS_04");
			KeyInputWait_();
			CloseMsgWnd_();
			break;
		// やめる
		case QUERY3_2:
			// メッセージウインドウを閉じる(仮)
			CloseMsgWnd_();
			break;
		}
	}else{
		//ギミック攻略した後のメッセージ
		OpenMsgWnd_();
		ShowMsg_("GRAVE_FAKE_SYS_05");
		KeyInputWait_();
		CloseMsgWnd_();
	}
	
	// 手順の回数を教えるメッセージを表示
	if( count_num == 1 ){
		OpenMsgWnd_();
		ShowMsg_("SYS_HELP_MES_020");	// 石像を動かせる　残り回数は　あと２回だ……。
		KeyInputWait_();
		CloseMsgWnd_();
	}
	if( count_num == 2 ){
		OpenMsgWnd_();
		ShowMsg_("SYS_HELP_MES_010");	// 石像を動かせる　残り回数は　あと１回だ……。
		KeyInputWait_();
		CloseMsgWnd_();
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//		石像2(右上)を90度回転させるタスク処理
//
//----------------------------------------------------------------------------
//	引数	: なし
//
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function uMineRotateStone2()
{
	//フラグの状態を取得
	local count_num = GetNumFlg_("NUM_FLG_SECRETROOM_COUNT");	// 石像の手順リセット用
	local seikai    = GetEventFlg_("BFG_MOVE_SUCCESS_SECOND");	// ６体の石像ギミックを正確な位置に合わせられたフラグ

	//石像の回転タスクに使用
	local task1, task2, task3, task4, task5, task6;
	//エフェクトに使用
	local efc_task1to2, efc_task1to3, efc_task2to1, efc_task2to4;
	local efc_task3to1, efc_task3to4, efc_task3to5, efc_task4to2, efc_task4to3, efc_task4to6;
	local efc_task5to3, efc_task5to6, efc_task6to4, efc_task6to5;
	local alpha_def;
	
	CommPlayerTurnAroundObj(g_stone_02);
	if( seikai == false ){	//ギミック未攻略の場合
		//システムメッセージ
		OpenMsgWnd_();
		ShowMsg_("STONE_ROTATE_QUE");
		KeyInputWait_();
		switch(GetQueryResult_()){
		// 時計回り
		case QUERY3_0:
			CloseMsgWnd_();
			
			//石像ギミックの手順をカウントする
			count_num = count_num + 1;
			SetNumFlg_("NUM_FLG_SECRETROOM_COUNT", count_num);
			
			//回転値を計算する関数
			uStoneRotateRight(g_stone_02);	//石像2を右に90度回転させる
			uStoneRotateRight(g_stone_01);	//石像1を右に90度回転させる
			uStoneRotateRight(g_stone_04);	//石像4を右に90度回転させる
			
			//--------------------------------
			//タスクにて石像を同時に回転させる
			//--------------------------------
			//調べた石像の回転処理
			PlaySE_("SE_FLD_100");
			task2 = Task_RotateToDirSetMotion_(g_stone_02, g_dir02, 2.0, "WAIT", "WAIT");
			WaitTask(task2);
			
			//ナビマップアイコンの向きを変える
			SetNaviMapIconDir_(g_map_navi02, g_dir02);
			
			//エフェクトサイズを標準サイズにしてから発射
			PlaySE_("SE_DEM_103");
			SetEffectScale_(efc_2to1, EFC_SIZE_MAX);
			SetEffectScale_(efc_2to4, EFC_SIZE_MAX);
			efc_task2to1 = Task_AnimeMoveNoFit_(base2to1, "beem2_to_1");
			efc_task2to4 = Task_AnimeMoveNoFit_(base2to4, "beem2_to_4");
			WaitTask(efc_task2to1);
			
			//エフェクトサイズを"0"にして見えないようにする
			for(alpha_def = EFC_SIZE_MAX; alpha_def >= EFC_SIZE_MIN; alpha_def = alpha_def - GRADUALLY_SMALL){
				SetEffectScale_(efc_2to1, alpha_def);
				SetEffectScale_(efc_2to4, alpha_def);
				Wait_(1);
			}
			
			//エフェクトのα値を0にする
			SetEffectScale_(efc_2to1, EFC_SIZE_MIN);
			SetEffectScale_(efc_2to4, EFC_SIZE_MIN);
			
			//ビームの位置を元に戻す
			SetPointPos_(base2to1, "obj002");
			SetPointPos_(base2to4, "obj002");
			
			//ビームが当たった石像の回転処理
			PlaySE_("SE_FLD_100");
			task1 = Task_RotateToDirSetMotion_(g_stone_01, g_dir01, 2.0, "WAIT", "WAIT");
			task4 = Task_RotateToDirSetMotion_(g_stone_04, g_dir04, 2.0, "WAIT", "WAIT");
			WaitTask(task1);
			
			//ナビマップアイコンの向きを変える
			SetNaviMapIconDir_(g_map_navi01, g_dir01);
			SetNaviMapIconDir_(g_map_navi04, g_dir04);
			
			//システムメッセージ
			OpenMsgWnd_();
			ShowMsg_("GRAVE_FAKE_SYS_04");
			KeyInputWait_();
			CloseMsgWnd_();
			break;
		// 反時計回り
		case QUERY3_1:
			CloseMsgWnd_();
			
			//石像ギミックの手順をカウントする
			count_num = count_num + 1;
			SetNumFlg_("NUM_FLG_SECRETROOM_COUNT", count_num);
			
			//回転値を計算する関数
			uStoneRotateLeft(g_stone_01);	//石像1を左に90度回転させる
			uStoneRotateLeft(g_stone_02);	//石像2を左に90度回転させる
			uStoneRotateLeft(g_stone_04);	//石像4を左に90度回転させる
			
			//--------------------------------
			//タスクにて石像を同時に回転させる
			//--------------------------------
			//調べた石像の回転処理
			PlaySE_("SE_FLD_100");
			task2 = Task_RotateToDirSetMotion_(g_stone_02, g_dir02, 2.0, "WAIT", "WAIT");
			WaitTask(task2);
			
			//ナビマップアイコンの向きを変える
			SetNaviMapIconDir_(g_map_navi02, g_dir02);
			
			//エフェクトサイズを標準サイズにしてから発射
			PlaySE_("SE_DEM_103");
			SetEffectScale_(efc_2to1, EFC_SIZE_MAX);
			SetEffectScale_(efc_2to4, EFC_SIZE_MAX);
			efc_task2to1 = Task_AnimeMoveNoFit_(base2to1, "beem2_to_1");
			efc_task2to4 = Task_AnimeMoveNoFit_(base2to4, "beem2_to_4");
			WaitTask(efc_task2to1);
			
			//エフェクトサイズを"0"にして見えないようにする
			for(alpha_def = EFC_SIZE_MAX; alpha_def >= EFC_SIZE_MIN; alpha_def = alpha_def - GRADUALLY_SMALL){
				SetEffectScale_(efc_2to1, alpha_def);
				SetEffectScale_(efc_2to4, alpha_def);
				Wait_(1);
			}
			
			//エフェクトのα値を0にする
			SetEffectScale_(efc_2to1, EFC_SIZE_MIN);
			SetEffectScale_(efc_2to4, EFC_SIZE_MIN);
			
			//ビームの位置を元に戻す
			SetPointPos_(base2to1, "obj002");
			SetPointPos_(base2to4, "obj002");
			
			//ビームが当たった石像の回転処理
			PlaySE_("SE_FLD_100");
			task1 = Task_RotateToDirSetMotion_(g_stone_01, g_dir01, 2.0, "WAIT", "WAIT");
			task4 = Task_RotateToDirSetMotion_(g_stone_04, g_dir04, 2.0, "WAIT", "WAIT");
			WaitTask(task1);
			
			//ナビマップアイコンの向きを変える
			SetNaviMapIconDir_(g_map_navi01, g_dir01);
			SetNaviMapIconDir_(g_map_navi04, g_dir04);
			
			//システムメッセージ
			OpenMsgWnd_();
			ShowMsg_("GRAVE_FAKE_SYS_04");
			KeyInputWait_();
			CloseMsgWnd_();
			break;
		// やめる
		case QUERY3_2:
			// メッセージウインドウを閉じる(仮)
			CloseMsgWnd_();
			break;
		}
	}else{
		//ギミック攻略した後のメッセージ
		OpenMsgWnd_();
		ShowMsg_("GRAVE_FAKE_SYS_05");
		KeyInputWait_();
		CloseMsgWnd_();
	}
	
	// 手順の回数を教えるメッセージを表示
	if( count_num == 1 ){
		OpenMsgWnd_();
		ShowMsg_("SYS_HELP_MES_020");	// 石像を動かせる　残り回数は　あと２回だ……。
		KeyInputWait_();
		CloseMsgWnd_();
	}
	if( count_num == 2 ){
		OpenMsgWnd_();
		ShowMsg_("SYS_HELP_MES_010");	// 石像を動かせる　残り回数は　あと１回だ……。
		KeyInputWait_();
		CloseMsgWnd_();
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//		石像3(左中)を90度回転させるタスク処理
//
//----------------------------------------------------------------------------
//	引数	: なし
//
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function uMineRotateStone3()
{
	//フラグの状態を取得
	local count_num = GetNumFlg_("NUM_FLG_SECRETROOM_COUNT");	// 石像の手順リセット用
	local seikai    = GetEventFlg_("BFG_MOVE_SUCCESS_SECOND");	// ６体の石像ギミックを正確な位置に合わせられたフラグ

	//石像の回転タスクに使用
	local task1, task2, task3, task4, task5, task6;
	//エフェクトに使用
	local efc_task1to2, efc_task1to3, efc_task2to1, efc_task2to4;
	local efc_task3to1, efc_task3to4, efc_task3to5, efc_task4to2, efc_task4to3, efc_task4to6;
	local efc_task5to3, efc_task5to6, efc_task6to4, efc_task6to5;
	local alpha_def;
	
	CommPlayerTurnAroundObj(g_stone_03);
	if( seikai == false ){	//ギミック未攻略の場合
		//システムメッセージ
		OpenMsgWnd_();
		ShowMsg_("STONE_ROTATE_QUE");
		KeyInputWait_();
		switch(GetQueryResult_()){
		// 時計回り
		case QUERY3_0:
			CloseMsgWnd_();
			
			//石像ギミックの手順をカウントする
			count_num = count_num + 1;
			SetNumFlg_("NUM_FLG_SECRETROOM_COUNT", count_num);
			
			//回転値を計算する関数
			uStoneRotateRight(g_stone_03);	//石像3を右に90度回転させる
			uStoneRotateRight(g_stone_01);	//石像1を右に90度回転させる
			uStoneRotateRight(g_stone_04);	//石像4を右に90度回転させる
			uStoneRotateRight(g_stone_05);	//石像5を右に90度回転させる
			
			//--------------------------------
			//タスクにて石像を同時に回転させる
			//--------------------------------
			//調べた石像の回転処理
			PlaySE_("SE_FLD_100");
			task3 = Task_RotateToDirSetMotion_(g_stone_03, g_dir03, 2.0, "WAIT", "WAIT");
			WaitTask(task3);
			
			//ナビマップアイコンの向きを変える
			SetNaviMapIconDir_(g_map_navi03, g_dir03);
			
			//エフェクトサイズを標準サイズにしてから発射
			PlaySE_("SE_DEM_103");
			SetEffectScale_(efc_3to1, EFC_SIZE_MAX);
			SetEffectScale_(efc_3to4, EFC_SIZE_MAX);
			SetEffectScale_(efc_3to5, EFC_SIZE_MAX);
			efc_task3to1 = Task_AnimeMoveNoFit_(base3to1, "beem3_to_1");
			efc_task3to4 = Task_AnimeMoveNoFit_(base3to4, "beem3_to_4");
			efc_task3to5 = Task_AnimeMoveNoFit_(base3to5, "beem3_to_5");
			WaitTask(efc_task3to1);
			
			//エフェクトサイズを"0"にして見えないようにする
			for(alpha_def = EFC_SIZE_MAX; alpha_def >= EFC_SIZE_MIN; alpha_def = alpha_def - GRADUALLY_SMALL){
				SetEffectScale_(efc_3to1, alpha_def);
				SetEffectScale_(efc_3to4, alpha_def);
				SetEffectScale_(efc_3to5, alpha_def);
				Wait_(1);
			}
			
			//エフェクトのα値を0にする
			SetEffectScale_(efc_3to1, EFC_SIZE_MIN);
			SetEffectScale_(efc_3to4, EFC_SIZE_MIN);
			SetEffectScale_(efc_3to5, EFC_SIZE_MIN);
			
			//ビームの位置を元に戻す
			SetPointPos_(base3to1, "obj003");
			SetPointPos_(base3to4, "obj003");
			SetPointPos_(base3to5, "obj003");
			
			//ビームが当たった石像の回転処理
			PlaySE_("SE_FLD_100");
			task1 = Task_RotateToDirSetMotion_(g_stone_01, g_dir01, 2.0, "WAIT", "WAIT");
			task4 = Task_RotateToDirSetMotion_(g_stone_04, g_dir04, 2.0, "WAIT", "WAIT");
			task5 = Task_RotateToDirSetMotion_(g_stone_05, g_dir05, 2.0, "WAIT", "WAIT");
			WaitTask(task1);
			
			//ナビマップアイコンの向きを変える
			SetNaviMapIconDir_(g_map_navi01, g_dir01);
			SetNaviMapIconDir_(g_map_navi04, g_dir04);
			SetNaviMapIconDir_(g_map_navi05, g_dir05);
			
			//システムメッセージ
			OpenMsgWnd_();
			ShowMsg_("GRAVE_FAKE_SYS_04");
			KeyInputWait_();
			CloseMsgWnd_();
			break;
		// 反時計回り
		case QUERY3_1:
			CloseMsgWnd_();
			
			//石像ギミックの手順をカウントする
			count_num = count_num + 1;
			SetNumFlg_("NUM_FLG_SECRETROOM_COUNT", count_num);
			
			//回転値を計算する関数
			uStoneRotateLeft(g_stone_03);	//石像3を左に90度回転させる
			uStoneRotateLeft(g_stone_01);	//石像1を左に90度回転させる
			uStoneRotateLeft(g_stone_04);	//石像4を左に90度回転させる
			uStoneRotateLeft(g_stone_05);	//石像5を左に90度回転させる
			
			//--------------------------------
			//タスクにて石像を同時に回転させる
			//--------------------------------
			//調べた石像の回転処理
			PlaySE_("SE_FLD_100");
			task3 = Task_RotateToDirSetMotion_(g_stone_03, g_dir03, 2.0, "WAIT", "WAIT");
			WaitTask(task3);
			
			//ナビマップアイコンの向きを変える
			SetNaviMapIconDir_(g_map_navi03, g_dir03);
			
			//エフェクトサイズを標準サイズにしてから発射
			PlaySE_("SE_DEM_103");
			SetEffectScale_(efc_3to1, EFC_SIZE_MAX);
			SetEffectScale_(efc_3to4, EFC_SIZE_MAX);
			SetEffectScale_(efc_3to5, EFC_SIZE_MAX);
			efc_task3to1 = Task_AnimeMoveNoFit_(base3to1, "beem3_to_1");
			efc_task3to4 = Task_AnimeMoveNoFit_(base3to4, "beem3_to_4");
			efc_task3to5 = Task_AnimeMoveNoFit_(base3to5, "beem3_to_5");
			WaitTask(efc_task3to1);
			
			//エフェクトサイズを"0"にして見えないようにする
			for(alpha_def = EFC_SIZE_MAX; alpha_def >= EFC_SIZE_MIN; alpha_def = alpha_def - GRADUALLY_SMALL){
				SetEffectScale_(efc_3to1, alpha_def);
				SetEffectScale_(efc_3to4, alpha_def);
				SetEffectScale_(efc_3to5, alpha_def);
				Wait_(1);
			}
			
			//エフェクトのα値を0にする
			SetEffectScale_(efc_3to1, EFC_SIZE_MIN);
			SetEffectScale_(efc_3to4, EFC_SIZE_MIN);
			SetEffectScale_(efc_3to5, EFC_SIZE_MIN);
			
			//ビームの位置を元に戻す
			SetPointPos_(base3to1, "obj003");
			SetPointPos_(base3to4, "obj003");
			SetPointPos_(base3to5, "obj003");
			
			//ビームが当たった石像の回転処理
			PlaySE_("SE_FLD_100");
			task1 = Task_RotateToDirSetMotion_(g_stone_01, g_dir01, 2.0, "WAIT", "WAIT");
			task4 = Task_RotateToDirSetMotion_(g_stone_04, g_dir04, 2.0, "WAIT", "WAIT");
			task5 = Task_RotateToDirSetMotion_(g_stone_05, g_dir05, 2.0, "WAIT", "WAIT");
			WaitTask(task1);
			
			//ナビマップアイコンの向きを変える
			SetNaviMapIconDir_(g_map_navi01, g_dir01);
			SetNaviMapIconDir_(g_map_navi04, g_dir04);
			SetNaviMapIconDir_(g_map_navi05, g_dir05);
			
			//システムメッセージ
			OpenMsgWnd_();
			ShowMsg_("GRAVE_FAKE_SYS_04");
			KeyInputWait_();
			CloseMsgWnd_();
			break;
		// やめる
		case QUERY3_2:
			// メッセージウインドウを閉じる(仮)
			CloseMsgWnd_();
			break;
		}
	}else{
		//ギミック攻略した後のメッセージ
		OpenMsgWnd_();
		ShowMsg_("GRAVE_FAKE_SYS_05");
		KeyInputWait_();
		CloseMsgWnd_();
	}
	
	// 手順の回数を教えるメッセージを表示
	if( count_num == 1 ){
		OpenMsgWnd_();
		ShowMsg_("SYS_HELP_MES_020");	// 石像を動かせる　残り回数は　あと２回だ……。
		KeyInputWait_();
		CloseMsgWnd_();
	}
	if( count_num == 2 ){
		OpenMsgWnd_();
		ShowMsg_("SYS_HELP_MES_010");	// 石像を動かせる　残り回数は　あと１回だ……。
		KeyInputWait_();
		CloseMsgWnd_();
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//		石像4(右中)を90度回転させるタスク処理
//
//----------------------------------------------------------------------------
//	引数	: なし
//
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function uMineRotateStone4()
{
	//フラグの状態を取得
	local count_num = GetNumFlg_("NUM_FLG_SECRETROOM_COUNT");	// 石像の手順リセット用
	local seikai    = GetEventFlg_("BFG_MOVE_SUCCESS_SECOND");	// ６体の石像ギミックを正確な位置に合わせられたフラグ

	//石像の回転タスクに使用
	local task1, task2, task3, task4, task5, task6;
	//エフェクトに使用
	local efc_task1to2, efc_task1to3, efc_task2to1, efc_task2to4;
	local efc_task3to1, efc_task3to4, efc_task3to5, efc_task4to2, efc_task4to3, efc_task4to6;
	local efc_task5to3, efc_task5to6, efc_task6to4, efc_task6to5;
	local alpha_def;
	
	CommPlayerTurnAroundObj(g_stone_04);
	if( seikai == false ){	//ギミック未攻略の場合
		//システムメッセージ
		OpenMsgWnd_();
		ShowMsg_("STONE_ROTATE_QUE");
		KeyInputWait_();
		switch(GetQueryResult_()){
		// 時計回り
		case QUERY3_0:
			CloseMsgWnd_();
			
			//石像ギミックの手順をカウントする
			count_num = count_num + 1;
			SetNumFlg_("NUM_FLG_SECRETROOM_COUNT", count_num);
			
			//回転値を計算する関数
			uStoneRotateRight(g_stone_04);	//石像4を右に90度回転させる
			uStoneRotateRight(g_stone_02);	//石像2を右に90度回転させる
			uStoneRotateRight(g_stone_03);	//石像3を右に90度回転させる
			uStoneRotateRight(g_stone_06);	//石像6を右に90度回転させる
			
			//--------------------------------
			//タスクにて石像を同時に回転させる
			//--------------------------------
			//調べた石像の回転処理
			PlaySE_("SE_FLD_100");
			task4 = Task_RotateToDirSetMotion_(g_stone_04, g_dir04, 2.0, "WAIT", "WAIT");
			WaitTask(task4);
			
			//ナビマップアイコンの向きを変える
			SetNaviMapIconDir_(g_map_navi04, g_dir04);
			
			//エフェクトサイズを標準サイズにしてから発射
			PlaySE_("SE_DEM_103");
			SetEffectScale_(efc_4to2, EFC_SIZE_MAX);
			SetEffectScale_(efc_4to3, EFC_SIZE_MAX);
			SetEffectScale_(efc_4to6, EFC_SIZE_MAX);
			efc_task4to2 = Task_AnimeMoveNoFit_(base4to2, "beem4_to_2");
			efc_task4to3 = Task_AnimeMoveNoFit_(base4to3, "beem4_to_3");
			efc_task4to6 = Task_AnimeMoveNoFit_(base4to6, "beem4_to_6");
			WaitTask(efc_task4to2);
			
			//エフェクトサイズを"0"にして見えないようにする
			for(alpha_def = EFC_SIZE_MAX; alpha_def >= EFC_SIZE_MIN; alpha_def = alpha_def - GRADUALLY_SMALL){
				SetEffectScale_(efc_4to2, alpha_def);
				SetEffectScale_(efc_4to3, alpha_def);
				SetEffectScale_(efc_4to6, alpha_def);
				Wait_(1);
			}
			
			//エフェクトのα値を0にする
			SetEffectScale_(efc_4to2, EFC_SIZE_MIN);
			SetEffectScale_(efc_4to3, EFC_SIZE_MIN);
			SetEffectScale_(efc_4to6, EFC_SIZE_MIN);
			
			//ビームの位置を元に戻す
			SetPointPos_(base4to2, "obj004");
			SetPointPos_(base4to3, "obj004");
			SetPointPos_(base4to6, "obj004");
			
			//ビームが当たった石像の回転処理
			PlaySE_("SE_FLD_100");
			task2 = Task_RotateToDirSetMotion_(g_stone_02, g_dir02, 2.0, "WAIT", "WAIT");
			task3 = Task_RotateToDirSetMotion_(g_stone_03, g_dir03, 2.0, "WAIT", "WAIT");
			task6 = Task_RotateToDirSetMotion_(g_stone_06, g_dir06, 2.0, "WAIT", "WAIT");
			WaitTask(task2);
			
			//ナビマップアイコンの向きを変える
			SetNaviMapIconDir_(g_map_navi02, g_dir02);
			SetNaviMapIconDir_(g_map_navi03, g_dir03);
			SetNaviMapIconDir_(g_map_navi06, g_dir06);
			
			//システムメッセージ
			OpenMsgWnd_();
			ShowMsg_("GRAVE_FAKE_SYS_04");
			KeyInputWait_();
			CloseMsgWnd_();
			break;
		// 反時計回り
		case QUERY3_1:
			CloseMsgWnd_();
			
			//石像ギミックの手順をカウントする
			count_num = count_num + 1;
			SetNumFlg_("NUM_FLG_SECRETROOM_COUNT", count_num);
			
			//回転値を計算する関数
			uStoneRotateLeft(g_stone_04);	//石像4を左に90度回転させる
			uStoneRotateLeft(g_stone_02);	//石像2を左に90度回転させる
			uStoneRotateLeft(g_stone_03);	//石像3を左に90度回転させる
			uStoneRotateLeft(g_stone_06);	//石像6を左に90度回転させる
			
			//--------------------------------
			//タスクにて石像を同時に回転させる
			//--------------------------------
			//調べた石像の回転処理
			PlaySE_("SE_FLD_100");
			task4 = Task_RotateToDirSetMotion_(g_stone_04, g_dir04, 2.0, "WAIT", "WAIT");
			WaitTask(task4);
			
			//ナビマップアイコンの向きを変える
			SetNaviMapIconDir_(g_map_navi04, g_dir04);
			
			//エフェクトサイズを標準サイズにしてから発射
			PlaySE_("SE_DEM_103");
			SetEffectScale_(efc_4to2, EFC_SIZE_MAX);
			SetEffectScale_(efc_4to3, EFC_SIZE_MAX);
			SetEffectScale_(efc_4to6, EFC_SIZE_MAX);
			efc_task4to2 = Task_AnimeMoveNoFit_(base4to2, "beem4_to_2");
			efc_task4to3 = Task_AnimeMoveNoFit_(base4to3, "beem4_to_3");
			efc_task4to6 = Task_AnimeMoveNoFit_(base4to6, "beem4_to_6");
			WaitTask(efc_task4to2);
			
			//エフェクトサイズを"0"にして見えないようにする
			for(alpha_def = EFC_SIZE_MAX; alpha_def >= EFC_SIZE_MIN; alpha_def = alpha_def - GRADUALLY_SMALL){
				SetEffectScale_(efc_4to2, alpha_def);
				SetEffectScale_(efc_4to3, alpha_def);
				SetEffectScale_(efc_4to6, alpha_def);
				Wait_(1);
			}
			
			//エフェクトのα値を0にする
			SetEffectScale_(efc_4to2, EFC_SIZE_MIN);
			SetEffectScale_(efc_4to3, EFC_SIZE_MIN);
			SetEffectScale_(efc_4to6, EFC_SIZE_MIN);
			
			//ビームの位置を元に戻す
			SetPointPos_(base4to2, "obj004");
			SetPointPos_(base4to3, "obj004");
			SetPointPos_(base4to6, "obj004");
			
			//ビームが当たった石像の回転処理
			PlaySE_("SE_FLD_100");
			task2 = Task_RotateToDirSetMotion_(g_stone_02, g_dir02, 2.0, "WAIT", "WAIT");
			task3 = Task_RotateToDirSetMotion_(g_stone_03, g_dir03, 2.0, "WAIT", "WAIT");
			task6 = Task_RotateToDirSetMotion_(g_stone_06, g_dir06, 2.0, "WAIT", "WAIT");
			WaitTask(task2);
			
			//ナビマップアイコンの向きを変える
			SetNaviMapIconDir_(g_map_navi02, g_dir02);
			SetNaviMapIconDir_(g_map_navi03, g_dir03);
			SetNaviMapIconDir_(g_map_navi06, g_dir06);
			
			//システムメッセージ
			OpenMsgWnd_();
			ShowMsg_("GRAVE_FAKE_SYS_04");
			KeyInputWait_();
			CloseMsgWnd_();
			break;
		// やめる
		case QUERY3_2:
			// メッセージウインドウを閉じる(仮)
			CloseMsgWnd_();
			break;
		}
	}else{
		//ギミック攻略した後のメッセージ
		OpenMsgWnd_();
		ShowMsg_("GRAVE_FAKE_SYS_05");
		KeyInputWait_();
		CloseMsgWnd_();
	}
	
	// 手順の回数を教えるメッセージを表示
	if( count_num == 1 ){
		OpenMsgWnd_();
		ShowMsg_("SYS_HELP_MES_020");	// 石像を動かせる　残り回数は　あと２回だ……。
		KeyInputWait_();
		CloseMsgWnd_();
	}
	if( count_num == 2 ){
		OpenMsgWnd_();
		ShowMsg_("SYS_HELP_MES_010");	// 石像を動かせる　残り回数は　あと１回だ……。
		KeyInputWait_();
		CloseMsgWnd_();
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//		石像5(左下)を90度回転させるタスク処理
//
//----------------------------------------------------------------------------
//	引数	: なし
//
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function uMineRotateStone5()
{
	//フラグの状態を取得
	local count_num = GetNumFlg_("NUM_FLG_SECRETROOM_COUNT");	// 石像の手順リセット用
	local seikai    = GetEventFlg_("BFG_MOVE_SUCCESS_SECOND");	// ６体の石像ギミックを正確な位置に合わせられたフラグ

	//石像の回転タスクに使用
	local task1, task2, task3, task4, task5, task6;
	//エフェクトに使用
	local efc_task1to2, efc_task1to3, efc_task2to1, efc_task2to4;
	local efc_task3to1, efc_task3to4, efc_task3to5, efc_task4to2, efc_task4to3, efc_task4to6;
	local efc_task5to3, efc_task5to6, efc_task6to4, efc_task6to5;
	local alpha_def;
	
	CommPlayerTurnAroundObj(g_stone_05);
	if( seikai == false ){	//ギミック未攻略の場合
		//システムメッセージ
		OpenMsgWnd_();
		ShowMsg_("STONE_ROTATE_QUE");
		KeyInputWait_();
		switch(GetQueryResult_()){
		// 時計回り
		case QUERY3_0:
			CloseMsgWnd_();
			
			//石像ギミックの手順をカウントする
			count_num = count_num + 1;
			SetNumFlg_("NUM_FLG_SECRETROOM_COUNT", count_num);
			
			//回転値を計算する関数
			uStoneRotateRight(g_stone_05);	//石像5を右に90度回転させる
			uStoneRotateRight(g_stone_03);	//石像3を右に90度回転させる
			uStoneRotateRight(g_stone_06);	//石像6を右に90度回転させる
			
			//--------------------------------
			//タスクにて石像を同時に回転させる
			//--------------------------------
			//調べた石像の回転処理
			PlaySE_("SE_FLD_100");
			task5 = Task_RotateToDirSetMotion_(g_stone_05, g_dir05, 2.0, "WAIT", "WAIT");
			WaitTask(task5);
			
			//ナビマップアイコンの向きを変える
			SetNaviMapIconDir_(g_map_navi05, g_dir05);
			
			//エフェクトサイズを標準サイズにしてから発射
			PlaySE_("SE_DEM_103");
			SetEffectScale_(efc_5to3, EFC_SIZE_MAX);
			SetEffectScale_(efc_5to6, EFC_SIZE_MAX);
			efc_task5to3 = Task_AnimeMoveNoFit_(base5to3, "beem5_to_3");
			efc_task5to6 = Task_AnimeMoveNoFit_(base5to6, "beem5_to_6");
			WaitTask(efc_task5to3);
			
			//エフェクトサイズを"0"にして見えないようにする
			for(alpha_def = EFC_SIZE_MAX; alpha_def >= EFC_SIZE_MIN; alpha_def = alpha_def - GRADUALLY_SMALL){
				SetEffectScale_(efc_5to3, alpha_def);
				SetEffectScale_(efc_5to6, alpha_def);
				Wait_(1);
			}
			
			//エフェクトのα値を0にする
			SetEffectScale_(efc_5to3, EFC_SIZE_MIN);
			SetEffectScale_(efc_5to6, EFC_SIZE_MIN);
			
			//ビームの位置を元に戻す
			SetPointPos_(base5to3, "obj005");
			SetPointPos_(base5to6, "obj005");
			
			//ビームが当たった石像の回転処理
			PlaySE_("SE_FLD_100");
			task3 = Task_RotateToDirSetMotion_(g_stone_03, g_dir03, 2.0, "WAIT", "WAIT");
			task6 = Task_RotateToDirSetMotion_(g_stone_06, g_dir06, 2.0, "WAIT", "WAIT");
			WaitTask(task3);
			
			//ナビマップアイコンの向きを変える
			SetNaviMapIconDir_(g_map_navi03, g_dir03);
			SetNaviMapIconDir_(g_map_navi06, g_dir06);
			
			//システムメッセージ
			OpenMsgWnd_();
			ShowMsg_("GRAVE_FAKE_SYS_04");
			KeyInputWait_();
			CloseMsgWnd_();
			break;
		// 反時計回り
		case QUERY3_1:
			CloseMsgWnd_();
			
			//石像ギミックの手順をカウントする
			count_num = count_num + 1;
			SetNumFlg_("NUM_FLG_SECRETROOM_COUNT", count_num);
			
			//回転値を計算する関数
			uStoneRotateLeft(g_stone_05);	//石像5を左に90度回転させる
			uStoneRotateLeft(g_stone_03);	//石像3を左に90度回転させる
			uStoneRotateLeft(g_stone_06);	//石像6を左に90度回転させる
			
			//--------------------------------
			//タスクにて石像を同時に回転させる
			//--------------------------------
			//調べた石像の回転処理
			PlaySE_("SE_FLD_100");
			task5 = Task_RotateToDirSetMotion_(g_stone_05, g_dir05, 2.0, "WAIT", "WAIT");
			WaitTask(task5);
			
			//ナビマップアイコンの向きを変える
			SetNaviMapIconDir_(g_map_navi05, g_dir05);
			
			//エフェクトサイズを標準サイズにしてから発射
			PlaySE_("SE_DEM_103");
			SetEffectScale_(efc_5to3, EFC_SIZE_MAX);
			SetEffectScale_(efc_5to6, EFC_SIZE_MAX);
			efc_task5to3 = Task_AnimeMoveNoFit_(base5to3, "beem5_to_3");
			efc_task5to6 = Task_AnimeMoveNoFit_(base5to6, "beem5_to_6");
			WaitTask(efc_task5to3);
			
			//エフェクトサイズを"0"にして見えないようにする
			for(alpha_def = EFC_SIZE_MAX; alpha_def >= EFC_SIZE_MIN; alpha_def = alpha_def - GRADUALLY_SMALL){
				SetEffectScale_(efc_5to3, alpha_def);
				SetEffectScale_(efc_5to6, alpha_def);
				Wait_(1);
			}
			
			//エフェクトのα値を0にする
			SetEffectScale_(efc_5to3, EFC_SIZE_MIN);
			SetEffectScale_(efc_5to6, EFC_SIZE_MIN);
			
			//ビームの位置を元に戻す
			SetPointPos_(base5to3, "obj005");
			SetPointPos_(base5to6, "obj005");
			
			//ビームが当たった石像の回転処理
			PlaySE_("SE_FLD_100");
			task3 = Task_RotateToDirSetMotion_(g_stone_03, g_dir03, 2.0, "WAIT", "WAIT");
			task6 = Task_RotateToDirSetMotion_(g_stone_06, g_dir06, 2.0, "WAIT", "WAIT");
			WaitTask(task3);
			
			//ナビマップアイコンの向きを変える
			SetNaviMapIconDir_(g_map_navi03, g_dir03);
			SetNaviMapIconDir_(g_map_navi06, g_dir06);
			
			//システムメッセージ
			OpenMsgWnd_();
			ShowMsg_("GRAVE_FAKE_SYS_04");
			KeyInputWait_();
			CloseMsgWnd_();
			break;
		// やめる
		case QUERY3_2:
			// メッセージウインドウを閉じる(仮)
			CloseMsgWnd_();
			break;
		}
	}else{
		//ギミック攻略した後のメッセージ
		OpenMsgWnd_();
		ShowMsg_("GRAVE_FAKE_SYS_05");
		KeyInputWait_();
		CloseMsgWnd_();
	}
	
	// 手順の回数を教えるメッセージを表示
	if( count_num == 1 ){
		OpenMsgWnd_();
		ShowMsg_("SYS_HELP_MES_020");	// 石像を動かせる　残り回数は　あと２回だ……。
		KeyInputWait_();
		CloseMsgWnd_();
	}
	if( count_num == 2 ){
		OpenMsgWnd_();
		ShowMsg_("SYS_HELP_MES_010");	// 石像を動かせる　残り回数は　あと１回だ……。
		KeyInputWait_();
		CloseMsgWnd_();
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//		石像6(右下)を90度回転させるタスク処理
//
//----------------------------------------------------------------------------
//	引数	: なし
//
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function uMineRotateStone6()
{
	//フラグの状態を取得
	local count_num = GetNumFlg_("NUM_FLG_SECRETROOM_COUNT");	// 石像の手順リセット用
	local seikai    = GetEventFlg_("BFG_MOVE_SUCCESS_SECOND");	// ６体の石像ギミックを正確な位置に合わせられたフラグ

	//石像の回転タスクに使用
	local task1, task2, task3, task4, task5, task6;
	//エフェクトに使用
	local efc_task1to2, efc_task1to3, efc_task2to1, efc_task2to4;
	local efc_task3to1, efc_task3to4, efc_task3to5, efc_task4to2, efc_task4to3, efc_task4to6;
	local efc_task5to3, efc_task5to6, efc_task6to4, efc_task6to5;
	local alpha_def;
	
	CommPlayerTurnAroundObj(g_stone_06);
	if( seikai == false ){	//ギミック未攻略の場合
		//システムメッセージ
		OpenMsgWnd_();
		ShowMsg_("STONE_ROTATE_QUE");
		KeyInputWait_();
		switch(GetQueryResult_()){
		// 時計回り
		case QUERY3_0:
			CloseMsgWnd_();
			
			//石像ギミックの手順をカウントする
			count_num = count_num + 1;
			SetNumFlg_("NUM_FLG_SECRETROOM_COUNT", count_num);
			
			//回転値を計算する関数
			uStoneRotateRight(g_stone_06);	//石像6を右に90度回転させる
			uStoneRotateRight(g_stone_04);	//石像4を右に90度回転させる
			uStoneRotateRight(g_stone_05);	//石像5を右に90度回転させる
			
			//--------------------------------
			//タスクにて石像を同時に回転させる
			//--------------------------------
			//調べた石像の回転処理
			PlaySE_("SE_FLD_100");
			task6 = Task_RotateToDirSetMotion_(g_stone_06, g_dir06, 2.0, "WAIT", "WAIT");
			WaitTask(task6);
			
			//ナビマップアイコンの向きを変える
			SetNaviMapIconDir_(g_map_navi06, g_dir06);
			
			//エフェクトサイズを標準サイズにしてから発射
			PlaySE_("SE_DEM_103");
			SetEffectScale_(efc_6to4, EFC_SIZE_MAX);
			SetEffectScale_(efc_6to5, EFC_SIZE_MAX);
			efc_task6to4 = Task_AnimeMoveNoFit_(base6to4, "beem6_to_4");
			efc_task6to5 = Task_AnimeMoveNoFit_(base6to5, "beem6_to_5");
			WaitTask(efc_task6to4);
			
			//エフェクトサイズを"0"にして見えないようにする
			for(alpha_def = EFC_SIZE_MAX; alpha_def >= EFC_SIZE_MIN; alpha_def = alpha_def - GRADUALLY_SMALL){
				SetEffectScale_(efc_6to4, alpha_def);
				SetEffectScale_(efc_6to5, alpha_def);
				Wait_(1);
			}
			
			//エフェクトのα値を0にする
			SetEffectScale_(efc_6to4, EFC_SIZE_MIN);
			SetEffectScale_(efc_6to5, EFC_SIZE_MIN);
			
			//ビームの位置を元に戻す
			SetPointPos_(base6to4, "obj006");
			SetPointPos_(base6to5, "obj006");
			
			//ビームが当たった石像の回転処理
			PlaySE_("SE_FLD_100");
			task4 = Task_RotateToDirSetMotion_(g_stone_04, g_dir04, 2.0, "WAIT", "WAIT");
			task5 = Task_RotateToDirSetMotion_(g_stone_05, g_dir05, 2.0, "WAIT", "WAIT");
			WaitTask(task4);
			
			//ナビマップアイコンの向きを変える
			SetNaviMapIconDir_(g_map_navi04, g_dir04);
			SetNaviMapIconDir_(g_map_navi05, g_dir05);
			
			//システムメッセージ
			OpenMsgWnd_();
			ShowMsg_("GRAVE_FAKE_SYS_04");
			KeyInputWait_();
			CloseMsgWnd_();
			break;
		// 反時計回り
		case QUERY3_1:
			CloseMsgWnd_();
			
			//石像ギミックの手順をカウントする
			count_num = count_num + 1;
			SetNumFlg_("NUM_FLG_SECRETROOM_COUNT", count_num);
			
			//回転値を計算する関数
			uStoneRotateLeft(g_stone_06);	//石像6を左に90度回転させる
			uStoneRotateLeft(g_stone_04);	//石像4を左に90度回転させる
			uStoneRotateLeft(g_stone_05);	//石像5を左に90度回転させる
			
			//--------------------------------
			//タスクにて石像を同時に回転させる
			//--------------------------------
			//調べた石像の回転処理
			PlaySE_("SE_FLD_100");
			task6 = Task_RotateToDirSetMotion_(g_stone_06, g_dir06, 2.0, "WAIT", "WAIT");
			WaitTask(task6);
			
			//ナビマップアイコンの向きを変える
			SetNaviMapIconDir_(g_map_navi06, g_dir06);
			
			//エフェクトサイズを標準サイズにしてから発射
			PlaySE_("SE_DEM_103");
			SetEffectScale_(efc_6to4, EFC_SIZE_MAX);
			SetEffectScale_(efc_6to5, EFC_SIZE_MAX);
			efc_task6to4 = Task_AnimeMoveNoFit_(base6to4, "beem6_to_4");
			efc_task6to5 = Task_AnimeMoveNoFit_(base6to5, "beem6_to_5");
			WaitTask(efc_task6to4);
			
			//エフェクトサイズを"0"にして見えないようにする
			for(alpha_def = EFC_SIZE_MAX; alpha_def >= EFC_SIZE_MIN; alpha_def = alpha_def - GRADUALLY_SMALL){
				SetEffectScale_(efc_6to4, alpha_def);
				SetEffectScale_(efc_6to5, alpha_def);
				Wait_(1);
			}
			
			//エフェクトのα値を0にする
			SetEffectScale_(efc_6to4, EFC_SIZE_MIN);
			SetEffectScale_(efc_6to5, EFC_SIZE_MIN);
			
			//ビームの位置を元に戻す
			SetPointPos_(base6to4, "obj006");
			SetPointPos_(base6to5, "obj006");
			
			//ビームが当たった石像の回転処理
			PlaySE_("SE_FLD_100");
			task4 = Task_RotateToDirSetMotion_(g_stone_04, g_dir04, 2.0, "WAIT", "WAIT");
			task5 = Task_RotateToDirSetMotion_(g_stone_05, g_dir05, 2.0, "WAIT", "WAIT");
			WaitTask(task4);
			
			//ナビマップアイコンの向きを変える
			SetNaviMapIconDir_(g_map_navi04, g_dir04);
			SetNaviMapIconDir_(g_map_navi05, g_dir05);
			
			//システムメッセージ
			OpenMsgWnd_();
			ShowMsg_("GRAVE_FAKE_SYS_04");
			KeyInputWait_();
			CloseMsgWnd_();
			break;
		// やめる
		case QUERY3_2:
			// メッセージウインドウを閉じる(仮)
			CloseMsgWnd_();
			break;
		}
	}else{
		//ギミック攻略した後のメッセージ
		OpenMsgWnd_();
		ShowMsg_("GRAVE_FAKE_SYS_05");
		KeyInputWait_();
		CloseMsgWnd_();
	}
	
	// 手順の回数を教えるメッセージを表示
	if( count_num == 1 ){
		OpenMsgWnd_();
		ShowMsg_("SYS_HELP_MES_020");	// 石像を動かせる　残り回数は　あと２回だ……。
		KeyInputWait_();
		CloseMsgWnd_();
	}
	if( count_num == 2 ){
		OpenMsgWnd_();
		ShowMsg_("SYS_HELP_MES_010");	// 石像を動かせる　残り回数は　あと１回だ……。
		KeyInputWait_();
		CloseMsgWnd_();
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		石像専用のフラグを取得する
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uGetSekizouFlag()
{
	g_num_stone1 <- GetNumFlg_("NUM_FLG_SECRETROOM_STONE_STATUE_01");
	g_num_stone2 <- GetNumFlg_("NUM_FLG_SECRETROOM_STONE_STATUE_02");
	g_num_stone3 <- GetNumFlg_("NUM_FLG_SECRETROOM_STONE_STATUE_03");
	g_num_stone4 <- GetNumFlg_("NUM_FLG_SECRETROOM_STONE_STATUE_04");
	g_num_stone5 <- GetNumFlg_("NUM_FLG_SECRETROOM_STONE_STATUE_05");
	g_num_stone6 <- GetNumFlg_("NUM_FLG_SECRETROOM_STONE_STATUE_06");
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		石像専用のフラグをセットする
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uSetSekizouFlag()
{
	SetNumFlg_("NUM_FLG_SECRETROOM_STONE_STATUE_01", g_num_stone1);
	SetNumFlg_("NUM_FLG_SECRETROOM_STONE_STATUE_02", g_num_stone2);
	SetNumFlg_("NUM_FLG_SECRETROOM_STONE_STATUE_03", g_num_stone3);
	SetNumFlg_("NUM_FLG_SECRETROOM_STONE_STATUE_04", g_num_stone4);
	SetNumFlg_("NUM_FLG_SECRETROOM_STONE_STATUE_05", g_num_stone5);
	SetNumFlg_("NUM_FLG_SECRETROOM_STONE_STATUE_06", g_num_stone6);
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		石像の回転値(num)を変える処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uResetNumStone(num1, num2, num3, num4, num5, num6)
{
	g_num_stone1 <- num1;
	g_num_stone2 <- num2;
	g_num_stone3 <- num3;
	g_num_stone4 <- num4;
	g_num_stone5 <- num5;
	g_num_stone6 <- num6;
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		石像の回転値(dir)を変える処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uResetDirStone(dir1, dir2, dir3, dir4, dir5, dir6)
{
	g_dir01 <- dir1;
	g_dir02 <- dir2;
	g_dir03 <- dir3;
	g_dir04 <- dir4;
	g_dir05 <- dir5;
	g_dir06 <- dir6;
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		石像とナビマップアイコンの向きを変える処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uSetDirStoneAndNavi()
{
	// 石像の向きを現状の値の方向に向かせる
	SetDir_( g_stone_01, g_dir01 );
	SetDir_( g_stone_02, g_dir02 );
	SetDir_( g_stone_03, g_dir03 );
	SetDir_( g_stone_04, g_dir04 );
	SetDir_( g_stone_05, g_dir05 );
	SetDir_( g_stone_06, g_dir06 );
	// ナビマップアイコンの向きを現状の値の方向に向かせる
	SetNaviMapIconDir_(g_map_navi01, g_dir01);
	SetNaviMapIconDir_(g_map_navi02, g_dir02);
	SetNaviMapIconDir_(g_map_navi03, g_dir03);
	SetNaviMapIconDir_(g_map_navi04, g_dir04);
	SetNaviMapIconDir_(g_map_navi05, g_dir05);
	SetNaviMapIconDir_(g_map_navi06, g_dir06);
}


//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//		石像を右に90度回転させる計算を行う
//
//----------------------------------------------------------------------------
//	引数	: id	ギミックID
//
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function uStoneRotateRight(id)
{
	// 現在の角度から-90度回転させ、同時にNUMフラグの値も変動させる
	//石像1(左上)の場合
	if( id == g_stone_01 ){
		//NUMフラグの計算をする
		if( g_num_stone1 == 0 ){ g_num_stone1 <- 4; }	//NUMフラグの値をマイナスにならない様にする
		g_num_stone1 = g_num_stone1 - 1;				//NUMフラグの値を"-1"する
		SetNumFlg_("NUM_FLG_SECRETROOM_STONE_STATUE_01", g_num_stone1);	//"-1"された値をセット
		
		//石像の回転値を計算する
		if( g_dir01 == 0 ){ g_dir01 <- 360; }			//回転値がマイナスにならない様にする
		g_dir01 = g_dir01 - 90;							//変数の値を"-90"する
	}
	//石像2(右上)の場合
	if( id == g_stone_02 ){
		if( g_num_stone2 == 0 ){ g_num_stone2 <- 4; }
		g_num_stone2 = g_num_stone2 - 1;
		SetNumFlg_("NUM_FLG_SECRETROOM_STONE_STATUE_02", g_num_stone2);
		
		if( g_dir02 == 0 ){ g_dir02 <- 360; }
		g_dir02 = g_dir02 - 90;
	}
	//石像3(左中)の場合
	if( id == g_stone_03 ){
		if( g_num_stone3 == 0 ){ g_num_stone3 <- 4; }
		g_num_stone3 = g_num_stone3 - 1;
		SetNumFlg_("NUM_FLG_SECRETROOM_STONE_STATUE_03", g_num_stone3);
		
		if( g_dir03 == 0 ){ g_dir03 <- 360; }
		g_dir03 = g_dir03 - 90;
	}
	//石像4(右中)の場合
	if( id == g_stone_04 ){
		if( g_num_stone4 == 0 ){ g_num_stone4 <- 4; }
		g_num_stone4 = g_num_stone4 - 1;
		SetNumFlg_("NUM_FLG_SECRETROOM_STONE_STATUE_04", g_num_stone4);
		
		if( g_dir04 == 0 ){ g_dir04 <- 360; }
		g_dir04 = g_dir04 - 90;
	}
	//石像5(左下)の場合
	if( id == g_stone_05 ){
		if( g_num_stone5 == 0 ){ g_num_stone5 <- 4; }
		g_num_stone5 = g_num_stone5 - 1;
		SetNumFlg_("NUM_FLG_SECRETROOM_STONE_STATUE_05", g_num_stone5);
		
		if( g_dir05 == 0 ){ g_dir05 <- 360; }
		g_dir05 = g_dir05 - 90;
	}
	//石像6(右下)の場合
	if( id == g_stone_06 ){
		if( g_num_stone6 == 0 ){ g_num_stone6 <- 4; }
		g_num_stone6 = g_num_stone6 - 1;
		SetNumFlg_("NUM_FLG_SECRETROOM_STONE_STATUE_06", g_num_stone6);
		
		if( g_dir06 == 0 ){ g_dir06 <- 360; }
		g_dir06 = g_dir06 - 90;
	}
}
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//		石像を左に90度回転させる計算を行う
//
//----------------------------------------------------------------------------
//	引数	: id	ギミックID
//
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function uStoneRotateLeft(id)
{
	// 現在の角度から+90度回転させ、同時にNUMフラグの値も変動させる
	//石像1(左上)の場合
	if( id == g_stone_01 ){
		//NUMフラグの計算をする
		g_num_stone1 = g_num_stone1 + 1;				//NUMフラグの値を"+1"する
		if( g_num_stone1 == 4 ){ g_num_stone1 <- 0; }	//NUMフラグの値を"4"より大きくならない様にする
		SetNumFlg_("NUM_FLG_SECRETROOM_STONE_STATUE_01", g_num_stone1);//"+1"された値をセット
		
		//石像の回転値を計算する
		g_dir01 = g_dir01 + 90;							//変数の値を"+90"する
		if( g_dir01 == 360 ){	g_dir01 <- 0;	}		//回転値が"360"より大きくならない様にする
	}
	//石像2(右上)の場合
	if( id == g_stone_02 ){
		g_num_stone2 = g_num_stone2 + 1;
		if( g_num_stone2 == 4 ){ g_num_stone2 <- 0; }
		SetNumFlg_("NUM_FLG_SECRETROOM_STONE_STATUE_02", g_num_stone2);
		
		g_dir02 = g_dir02 + 90;
		if( g_dir02 == 360 ){	g_dir02 <- 0;	}
	}
	//石像3(左中)の場合
	if( id == g_stone_03 ){
		g_num_stone3 = g_num_stone3 + 1;
		if( g_num_stone3 == 4 ){ g_num_stone3 <- 0; }
		SetNumFlg_("NUM_FLG_SECRETROOM_STONE_STATUE_03", g_num_stone3);
		
		g_dir03 = g_dir03 + 90;
		if( g_dir03 == 360 ){	g_dir03 <- 0;	}
	}
	//石像4(右中)の場合
	if( id == g_stone_04 ){
		g_num_stone4 = g_num_stone4 + 1;
		if( g_num_stone4 == 4 ){ g_num_stone4 <- 0; }
		SetNumFlg_("NUM_FLG_SECRETROOM_STONE_STATUE_04", g_num_stone4);
		
		g_dir04 = g_dir04 + 90;
		if( g_dir04 == 360 ){	g_dir04 <- 0;	}
	}
	//石像5(左下)の場合
	if( id == g_stone_05 ){
		g_num_stone5 = g_num_stone5 + 1;
		if( g_num_stone5 == 4 ){ g_num_stone5 <- 0; }
		SetNumFlg_("NUM_FLG_SECRETROOM_STONE_STATUE_05", g_num_stone5);
		
		g_dir05 = g_dir05 + 90;
		if( g_dir05 == 360 ){	g_dir05 <- 0;	}
	}
	//石像6(右下)の場合
	if( id == g_stone_06 ){
		g_num_stone6 = g_num_stone6 + 1;
		if( g_num_stone6 == 4 ){ g_num_stone6 <- 0; }
		SetNumFlg_("NUM_FLG_SECRETROOM_STONE_STATUE_06", g_num_stone6);
		
		g_dir06 = g_dir06 + 90;
		if( g_dir06 == 360 ){	g_dir06 <- 0;	}
	}
}

	

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//		指定した座標に歩きながら振り向く処理
//
//---------------------------------------------------------------------------
// 第一引数：指定した座標(Vec3)
// 戻り値  ：なし
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function uPlayerTurnAroundPos(pos)
{
	local player    = GetPlayerId_();
	// 対象物の方向に回転(1Fで11.4°ずつ回転)
	local rotateTask = Task_RotateToPosSetMotion_(player, Vec3(pos.x, pos.y, pos.z), ROTATE_EVENT_DEF MOT_WALK, MOT_WAIT);
	WaitTask(rotateTask);
	// 間を持たせる
	Wait_(15);
}

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//		本棚のメッセージを返す処理
//---------------------------------------------------------------
//	引数	: 本棚？が何番目に調べられたかを管理するnumフラグ番号
//	戻り値	: 番号に対応したメッセージID
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function uReturnBookshelfMsg(flg_name)
{
	if(GetNumFlg_(flg_name) == 0){
		local num = GetNumFlg_("NUM_FLG_CHECK_BOOKSHELF_COUNT");
		num = num + 1;
		SetNumFlg_("NUM_FLG_CHECK_BOOKSHELF_COUNT", num);
		SetNumFlg_(flg_name, num);
	}
	
	switch(GetNumFlg_(flg_name))
	{
	case 1:
		return "MINE_BOOK_HINT_001";
	case 2:
		return "MINE_BOOK_HINT_002";
	case 3:
		return "MINE_BOOK_HINT_003";
	case 4:
		return "MINE_BOOK_HINT_004";
	}
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


