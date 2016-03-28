//===================== G02_00アンデッドガーデン ====================

// 定数の宣言
const EFC_SIZE_MIN		= 0.0;	// エフェクトサイズの最小値
const EFC_SIZE_MAX		= 0.5;	// エフェクトサイズの最大値
const GRADUALLY_SMALL	= 0.05;	// エフェクトサイズを段々小さくする値


//------------------------------------------------
//		戦闘終了後
//------------------------------------------------
function AfterBattle()
{
	// フラグの状態を取得
	local main_num  = GetNumFlg_("NUM_SCENARIO_MAIN");
	local grave_num = GetNumFlg_("NUM_SCENARIO_SUB_GRAVE");
	
	// 石像のフラグを取得
	uGetSekizouFlag();
	
	// 石像のフラグをセット
	uSetSekizouFlag();// 戦闘後は石像の向きを保持するため、取得した値をそのままセット
	
	EventEnd_();
}


//------------------------------------------------
//		フェードイン
//------------------------------------------------
function FadeIn()
{
	// マップ到達フラグ
	SetEventFlg_("BFG_ARRIVE_AT_G02", true);

	// フラグの状態を取得
	local main_num		 = GetNumFlg_("NUM_SCENARIO_MAIN");
	local grave_num		 = GetNumFlg_("NUM_SCENARIO_SUB_GRAVE");
	local check_dead	 = GetEventFlg_("BFG_DEAD_RETURN");
	local statue_demo	 = GetEventFlg_("BFG_MOVE_STATUE_FIRST_TIME_DEMO");	// 石像の初回デモを見たフラグ
	local demo_tyokugo	 = GetEventFlg_("BFG_DISPLAYED_DEMO_MOVE_STATUE");	// 石像の初回デモを見た直後のフラグ
	local seikai		 = GetEventFlg_("BFG_MOVE_SUCCESS_FIRST");			// ４体の石像ギミックを正確な位置に合わせられたフラグ
	// 石像のフラグを取得
	uGetSekizouFlag();
	
	// 石像の向きの初期設定
	// 石像の初回デモを見た直後ではない場合
	if(demo_tyokugo == false){
		SetNumFlg_("NUM_FLG_PRAYROOM_COUNT", 0);				// 手順カウントを0にする
		// 石像ギミックが未攻略の場合
		if( seikai == false ){
			// 石像の角度をNUMフラグに置き換える
			uResetNumStone(3, 0, 2, 1);	// 0=0度, 1=90度, 2=180度, 3=270, 4=360度 とする
			// 代入した値をセット
			uSetSekizouFlag();
		}
		// 石像ギミックを攻略済みの場合
		if( seikai == true ){
			// 石像の角度をNUMフラグに置き換える
			uResetNumStone(1, 3, 1, 3);	// 0=0度, 1=90度, 2=180度, 3=270, 4=360度 とする
			// 代入した値をセット
			uSetSekizouFlag();
		}
	}
	
	// 石像のナビマップアイコン（ターゲット）
	g_map_navi01 <- ArrangePointNaviMapIcon_(NAVIMAP_ICON.DIRECTION, "map_navi_01");  // 左上
	g_map_navi02 <- ArrangePointNaviMapIcon_(NAVIMAP_ICON.DIRECTION, "map_navi_02");  // 右上
	g_map_navi03 <- ArrangePointNaviMapIcon_(NAVIMAP_ICON.DIRECTION, "map_navi_03");  // 左下
	g_map_navi04 <- ArrangePointNaviMapIcon_(NAVIMAP_ICON.DIRECTION, "map_navi_04");  // 右下
	SetNaviMapIconVisible_(g_map_navi01, true);
	SetNaviMapIconVisible_(g_map_navi02, true);
	SetNaviMapIconVisible_(g_map_navi03, true);
	SetNaviMapIconVisible_(g_map_navi04, true);
	
	// 時間の設定
	if(main_num == GetFlagID_("CONST_SM_CEMETERY")){						// Num0 = 3
		if(grave_num <= GetFlagID_("CONST_SS_CC_GET_RACE_PROGRAM")){		// Num4 = 17
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
	g_npc_gost_d	 <- C_NONE_ID;
	g_npc_chomach	 <- C_NONE_ID;
	
	// リソース読み込み
	local id_gost	 = ReadNpc_("m100_01");		// モンスターの幽霊
	local id_chomach = ReadNpc_("n006");		// チョーマッハ
	
	// ■モンスターの幽霊D
	g_npc_gost_d  = ArrangePointNpc_(id_gost,  "npc_gost_d");
	SetScaleSilhouette(g_npc_gost_d, SCALE.S, SILHOUETTE_WIDTH.S);
	SetReactorMsg_(g_npc_gost_d, "GRAVE_NPC_GOST_REC");
	
	// ■チョーマッハ
	if(main_num == GetFlagID_("CONST_SM_CEMETERY")){						// Num0 = 3
		if(grave_num <= GetFlagID_("CONST_SS_CC_DESCEND_THE_STAIRS")){		// Num4 = 4 以下
			g_npc_chomach  = ArrangePointNpc_(id_chomach,  "npc_chomach");
			SetTalkCameraType_(g_npc_chomach, TALK_CAMERA_UP);	// 会話時カメラの設定
			SetReactorMsg_(g_npc_chomach, "GRAVE_NPC_CHOMACH_REC");
			// アナライズのターゲット名を切り替える(マスター・ノチョーラ→チョーマッハ)
			SetTargetNameKey_(g_npc_chomach, "NAME_TAG_CHOMACH");
		}
	}
	
	
	//-----------
	// ▼地雷配置
	//-----------
	DebugPrint("イベント地雷の読込");
	
	// ID初期化
	g_mine_book_01		<- C_NONE_ID;
	g_mine_venus_relief <- C_NONE_ID;
	g_mine_stone_01		<- C_NONE_ID;
	g_mine_stone_02		<- C_NONE_ID;
	g_mine_stone_03		<- C_NONE_ID;
	g_mine_stone_04		<- C_NONE_ID;
	g_mine_wall_paper	<- C_NONE_ID;
	
	// ■本棚
	g_mine_book_01 = SetPointCircleEventMine_("mine_book01", true);
	
	// ■張り紙
	g_mine_wall_paper = SetPointCircleEventMine_("mine_wall_paper", true);
	
	// ■アンセスの墓
	if(main_num == GetFlagID_("CONST_SM_CEMETERY")){						// Num0 = 3
		if(grave_num == GetFlagID_("CONST_SS_CC_MOVE_THE_STONE")){			// Num4 = 3
			g_mine_venus_relief = SetPointCircleEventMine_("mine_venus_relief", true);
		}
	}
	
	// ■石像
	g_mine_stone_01 = SetPointCircleEventMine_("mine_stone01", true);// 左上
	g_mine_stone_02 = SetPointCircleEventMine_("mine_stone02", true);// 右上
	g_mine_stone_03 = SetPointCircleEventMine_("mine_stone03", true);// 左下
	g_mine_stone_04 = SetPointCircleEventMine_("mine_stone04", true);// 右下

	//---------------
	// ▼ギミック配置
	//---------------

	//※石像ギミックで使用するNUMフラグのフラグ番号は
	//  石像の角度に置き換えて使用し、リアルタイムで石像の角度の値を取得出来るようにしています。
	///////////////////////////////////////////////////////
	//【角度】  １８０度      【NUM番号】     ２         //
	//            ↑                          ↑         //
	// ２７０度 ←  → ９０度            ３ ←  → １    //
	//            ↓                          ↓         //
	//           ０度(３６０度)               ０(４)     //
	///////////////////////////////////////////////////////

	//------------------------------------------------
	//	4体の石像ギミックの回転値をNUMフラグに格納する
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
	
	//---------------------------
	//	4体の石像の読み込みと設置
	//---------------------------
	// ID初期化
	g_stone_01 <- C_NONE_ID;
	g_stone_02 <- C_NONE_ID;
	g_stone_03 <- C_NONE_ID;
	g_stone_04 <- C_NONE_ID;
	
	// リソース読み込み
	local id_stone_panther = ReadGimmick_("o_G02_20");// キラーパンサーの石像
	local id_stone_fish    = ReadGimmick_("o_G02_21");// とつげきうおの石像
	
	// 4体の石像の設置
	g_stone_01 = ArrangePointGimmick_("o_G02_20", id_stone_panther, "g_stone01");//左上
	g_stone_02 = ArrangePointGimmick_("o_G02_20", id_stone_panther, "g_stone02");//右上
	g_stone_03 = ArrangePointGimmick_("o_G02_21", id_stone_fish, "g_stone03");	 //左下
	g_stone_04 = ArrangePointGimmick_("o_G02_21", id_stone_fish, "g_stone04");	 //右下
	
	// 石像とナビマップアイコンの向きを現状の値の方向に向かせる
	uSetDirStoneAndNavi();
	
	//	扉の設置
	if(main_num <= GetFlagID_("CONST_SM_CEMETERY")){						// Num0 = 3
		if(grave_num <= GetFlagID_("CONST_SS_CC_MOVE_THE_STONE")){			// Num4 = 3
			// 隠し扉
			local id_lock_door = ReadGimmick_("o_G02_01");//勇者の墓（扉）
			local lock_door = ArrangePointGimmick_("o_G02_01", id_lock_door, "g_door");
		}
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
	base4to2 <- ArrangePointGimmick_("o_effect_base", model_base, "obj004");//石像4→石像2へ飛ぶ光
	base4to3 <- ArrangePointGimmick_("o_effect_base", model_base, "obj004");//石像4→石像3へ飛ぶ光
	
	// 光エフェクトの読み込み
	LoadEffect_("ef731_01_mag_light01");
	efc_1to2 <- SetSelectBoneEffect_("ef731_01_mag_light01", base1to2, ATTACH_GLOBAL);
	efc_1to3 <- SetSelectBoneEffect_("ef731_01_mag_light01", base1to3, ATTACH_GLOBAL);
	efc_2to1 <- SetSelectBoneEffect_("ef731_01_mag_light01", base2to1, ATTACH_GLOBAL);
	efc_2to4 <- SetSelectBoneEffect_("ef731_01_mag_light01", base2to4, ATTACH_GLOBAL);
	efc_3to1 <- SetSelectBoneEffect_("ef731_01_mag_light01", base3to1, ATTACH_GLOBAL);
	efc_3to4 <- SetSelectBoneEffect_("ef731_01_mag_light01", base3to4, ATTACH_GLOBAL);
	efc_4to2 <- SetSelectBoneEffect_("ef731_01_mag_light01", base4to2, ATTACH_GLOBAL);
	efc_4to3 <- SetSelectBoneEffect_("ef731_01_mag_light01", base4to3, ATTACH_GLOBAL);
	
	// 光エフェクトのサイズ設定 (初期状態は"0"にして見えないようにする)
	SetEffectScale_(efc_1to2, EFC_SIZE_MIN);
	SetEffectScale_(efc_1to3, EFC_SIZE_MIN);
	SetEffectScale_(efc_2to1, EFC_SIZE_MIN);
	SetEffectScale_(efc_2to4, EFC_SIZE_MIN);
	SetEffectScale_(efc_3to1, EFC_SIZE_MIN);
	SetEffectScale_(efc_3to4, EFC_SIZE_MIN);
	SetEffectScale_(efc_4to2, EFC_SIZE_MIN);
	SetEffectScale_(efc_4to3, EFC_SIZE_MIN);
	
	//-------------------------
	// ▼リアクターポイント配置
	//-------------------------
	// ■レリーフ
	if(main_num <= GetFlagID_("CONST_SM_CEMETERY")){						// Num0 = 3
		if(grave_num <= GetFlagID_("CONST_SS_CC_MOVE_THE_STONE")){			// Num4 = 3
			local reactorPoint01 = ArrangeMsgReactorPoint("rec_point_relief", GetFlagID_("BFG_REACTER_POINT_088")// Bit_1587 レリーフ
				, SHORT_DIST, "REC_POINT_RELIEF_010", "REC_POINT_RELIEF_011");
		}
	}

	// ■本棚
	local reactorPoint02 = ArrangeMsgReactorPoint("rec_point_book_01", GetFlagID_("BFG_REACTER_POINT_089")// Bit_1588 本棚
		, SHORT_DIST, "REC_POINT_BOOK_010", "REC_POINT_BOOK_011");

	// ■羊皮紙
	local reactorPoint03 = ArrangeMsgReactorPoint("rec_point_harigami", GetFlagID_("BFG_REACTER_POINT_090")// Bit_1589 羊皮紙
		, SHORT_DIST, "REC_POINT_HARIGAMI_010", "REC_POINT_HARIGAMI_011");

	// ■石像1(左上)
	local reactorPoint04 = ArrangeMsgReactorPoint("rec_point_stone01", GetFlagID_("BFG_REACTER_POINT_091")// Bit_1590 石像
		, SHORT_DIST, "REC_POINT_STATUE_010", "REC_POINT_KIRAPANSA");

	// ■石像2(右上)
	local reactorPoint05 = ArrangeMsgReactorPoint("rec_point_stone02", GetFlagID_("BFG_REACTER_POINT_091")// Bit_1590 石像
		, SHORT_DIST, "REC_POINT_STATUE_010", "REC_POINT_KIRAPANSA");

	// ■石像3(左下)
	local reactorPoint06 = ArrangeMsgReactorPoint("rec_point_stone03", GetFlagID_("BFG_REACTER_POINT_091")// Bit_1590 石像
		, SHORT_DIST, "REC_POINT_STATUE_010", "REC_POINT_TOTUGEKIUO");

	// ■石像4(右下)
	local reactorPoint07 = ArrangeMsgReactorPoint("rec_point_stone04", GetFlagID_("BFG_REACTER_POINT_091")// Bit_1590 石像
		, SHORT_DIST, "REC_POINT_STATUE_010", "REC_POINT_TOTUGEKIUO");

	//------------------
	//マップナビ
	//------------------

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
	local demo_tyokugo = GetEventFlg_("BFG_DISPLAYED_DEMO_MOVE_STATUE");// 石像の初回デモを見た直後のフラグ

	// モンスターの幽霊Dを半透明にする
	SetManualCalcAlpha_(g_npc_gost_d, true);
	SetAlpha_(g_npc_gost_d, 0.3);

	// デモの再生
	if(main_num == GetFlagID_("CONST_SM_CEMETERY")){						// Num0 = 3
		// はじめてアンデッドガーデンに入った時のデモ
		if(grave_num == GetFlagID_("CONST_SS_CC_FIND_THE_GHOST")){			// Num4 = 2
			SetNumFlg_("NUM_SCENARIO_SUB_GRAVE", GetFlagID_("CONST_SS_CC_MOVE_THE_STONE"));	//フラグ「3」
			SetReturnDemoPosDir_(Vec3(-36.3, 0.000, 202.9), -103);
			EventStartChangeDemo(203, FADE_COLOR_BLACK);//203[聖堂入り口]
		}
	}
	
	// 石像の初回デモを見た直後だけメッセージ表示
	if(demo_tyokugo == true){
		SetEventFlg_("BFG_DISPLAYED_DEMO_MOVE_STATUE", false);	// デモを見た直後のフラグ
		
		Wait_(10);
		OpenMsgWnd_();
		ShowMsg_("SYS_HELP_MES_010");	// 石像を動かせる　残り回数は　あと１回だ……。
		KeyInputWait_();
		CloseMsgWnd_();
	}
	
	
	EventEnd_();
}


//------------------------------------------------
//		ＮＰＣ接触時
//------------------------------------------------
function TouchNpc()
{
	//フラグの状態を取得
	local main_num  = GetNumFlg_("NUM_SCENARIO_MAIN");
	local grave_num = GetNumFlg_("NUM_SCENARIO_SUB_GRAVE");
	
	//NPCの種類を取得
	local target = GetTargetId_();
	
	switch(target){
	case g_npc_gost_d :		// モンスターの幽霊D
		uTalkGostD();
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
	local demo_tyokugo = GetEventFlg_("BFG_DISPLAYED_DEMO_MOVE_STATUE");	// 石像の初回デモを見た直後のフラグ

	//フラグの状態を取得
	local main_num		 = GetNumFlg_("NUM_SCENARIO_MAIN");
	local grave_num		 = GetNumFlg_("NUM_SCENARIO_SUB_GRAVE");
	local count_num		 = GetNumFlg_("NUM_FLG_PRAYROOM_COUNT");			// 石像の手順リセット用
	local seikai		 = GetEventFlg_("BFG_MOVE_SUCCESS_FIRST");			// ４体の石像ギミックを正確な位置に合わせられたフラグ
	local statue_demo	 = GetEventFlg_("BFG_MOVE_STATUE_FIRST_TIME_DEMO");	// 石像の初回デモを見たフラグ
	
	
	switch(target){
	case g_mine_book_01:		//本棚
		uMineBookShelf();
		break;
	case g_mine_wall_paper:		//張り紙
		uMineWallPaper();
		break;
	case g_mine_venus_relief:	//女神の絵
		uMineVenusRelief();
		break;
	case g_mine_stone_01:		//石像1(左上)
		uMineRotateStone1();	
		break;
	case g_mine_stone_02:		//石像2(右上)
		uMineRotateStone2();	
		break;
	case g_mine_stone_03:		//石像3(左下)
		uMineRotateStone3();	
		break;
	case g_mine_stone_04:		//石像4(右下)
		uMineRotateStone4();	
		break;
	default:
		DebugPrint("設置されていない地雷に接触判定しています！");
		break;
	}
	
	
	DebugPrint("石像1のNUMフラグは " + g_num_stone1 + " になりました。");
	DebugPrint("石像2のNUMフラグは " + g_num_stone2 + " になりました。");
	DebugPrint("石像3のNUMフラグは " + g_num_stone3 + " になりました。");
	DebugPrint("石像4のNUMフラグは " + g_num_stone4 + " になりました。");
	DebugPrint("石像1は " + g_dir01 + " 度になりました。");
	DebugPrint("石像2は " + g_dir02 + " 度になりました。");
	DebugPrint("石像3は " + g_dir03 + " 度になりました。");
	DebugPrint("石像4は " + g_dir04 + " 度になりました。");
	
	
	// 手順の回数を取得
	count_num = GetNumFlg_("NUM_FLG_PRAYROOM_COUNT");
	
	//手順通りに正解になった場合
	if( count_num == 2 ){
		//石像の向きが正解の向きになったら
		if( g_num_stone1 == 1 && g_num_stone2 == 3 && g_num_stone3 == 1 && g_num_stone4 == 3 ){
			if( seikai == false ){
				//地雷を消す
				DeleteEventMine_(g_mine_stone_01);
				DeleteEventMine_(g_mine_stone_02);
				DeleteEventMine_(g_mine_stone_03);
				DeleteEventMine_(g_mine_stone_04);
				
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
				SetEventFlg_("BFG_MOVE_SUCCESS_FIRST", true);// ４体の石像ギミックを正確な位置に合わせられたフラグ
				SetNumFlg_("NUM_SCENARIO_SUB_GRAVE", GetFlagID_("CONST_SS_CC_DESCEND_THE_STAIRS"));	//フラグ「4」
				
				ChangeDemo_(204);
			}
		}
		// 手順オーバーした場合
		else{
			// 手順カウントを0に戻す
			SetNumFlg_("NUM_FLG_PRAYROOM_COUNT", 0);
			
			// フェードアウト
			SetFadePlane_(FADE_PLANE.PLANE_3D);
			SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
			SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
			WaitFade_();
			
			//石像の配置を初期化する
			uResetNumStone(3, 0, 2, 1);		//初期値をグローバル変数に代入
			uSetSekizouFlag();				//代入した値をセット
			uResetDirStone(270, 0, 180, 90)	//石像の向きを初期化する
			uSetDirStoneAndNavi();			//石像とナビマップアイコンの向きを現状の値の方向に向かせる
			
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
//		幽霊Dとの会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkGostD()
{
	// モンスターの幽霊Dのメッセージ
	OpenMsgWnd_();
	ShowMsg_("DEMO_203_AFT_NPC_GOST_D");			//「この部屋は　レジスタンスが　使ってたんだ。
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
	// チョーマッハのメッセージ
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_CHOMACH");
	ShowMsg_("DEMO_203_AFT_NPC_CHOMACH");			//「何か　書いてあるのを　見つけたっちょ！
	KeyInputWait_();
	CloseMsgWnd_();
}


//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//		本棚を調べた時の処理
//
//----------------------------------------------------------------------------
//	引数	: なし
//
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function uMineBookShelf()
{
	local player = GetPlayerId_();
	
	SetEventFlg_("BFG_LIMIT_BOOKSHELF_G02_00", true); // Bit_1120 本棚周辺の配置モンスターを解禁
	local pos  = Vec3(230.6, 70.0, -290.0);
	uPlayerTurnAroundPos(pos);
	//システムメッセージ
	OpenMsgWnd_();
	ShowMsg_("MINE_BOOK_SHELF_001");
	KeyInputWait_();
	CloseMsgWnd_();
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
	
	local pos  = Vec3(-190.4, 0.0, 134.6);
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
//		聖堂にある女神の絵を調べた時の処理
//
//----------------------------------------------------------------------------
//	引数	: なし
//
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function uMineVenusRelief()
{
	//フラグの状態を取得
	local main_num  = GetNumFlg_("NUM_SCENARIO_MAIN");
	local grave_num = GetNumFlg_("NUM_SCENARIO_SUB_GRAVE");
	
	local player = GetPlayerId_();
	
	// レイアウトの読み込み
	LoadLayout_("black");
	
	
	if(main_num == GetFlagID_("CONST_SM_CEMETERY")){						// Num0 = 3
		if(grave_num == GetFlagID_("CONST_SS_CC_MOVE_THE_STONE")){			// Num4 = 3
			local pos  = Vec3(2.5, 16.0, -374.0);
			uPlayerTurnAroundPos(pos);
			SetLayoutAnime_("fade_in", false);
			//黒半透明イン
			Wait_(30);
			SetLayoutAnime_("loop", false);
			//黒半透明L
			Wait_(5);
			// メッセージ
			ShowScreenMessage_("MINE_SECRET_DOOR_001", false);
			//黒半透明アウト
			SetLayoutAnime_("fade_out", false);			//システムメッセージ(センタリング)
			
			//システムメッセージ
			OpenMsgWnd_();
			ShowMsg_("MINE_SECRET_DOOR_002");
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
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
	local count_num		 = GetNumFlg_("NUM_FLG_PRAYROOM_COUNT");			// 石像の手順リセット用
	local statue_demo	 = GetEventFlg_("BFG_MOVE_STATUE_FIRST_TIME_DEMO");	// 石像の初回デモを見たフラグ
	local seikai		 = GetEventFlg_("BFG_MOVE_SUCCESS_FIRST");			// ４体の石像ギミックを正確な位置に合わせられたフラグ

	//石像の回転タスクに使用
	local task1, task2, task3, task4;
	//エフェクトに使用
	local efc_task1to2, efc_task1to3, efc_task2to1, efc_task2to4;
	local efc_task3to1, efc_task3to4, efc_task4to2, efc_task4to3;
	local alpha_def;
	
	
	CommPlayerTurnAroundObj(g_stone_01);
	//ギミック未攻略の場合
	if( seikai == false ){
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
			SetNumFlg_("NUM_FLG_PRAYROOM_COUNT", count_num);
			
			//石像が動くデモを一度も見ていない場合
			if(statue_demo == false){
				SetEventFlg_("BFG_MOVE_STATUE_FIRST_TIME_DEMO", true);	//石像が動くデモを見たかフラグ
				SetEventFlg_("BFG_MOVE_DIR_STATUE", true);				//時計回りを選択したフラグ
				SetEventFlg_("BFG_DISPLAYED_DEMO_MOVE_STATUE", true);	//デモを見た直後のフラグ
				
				//回転値を計算する関数(結果の出力は"function FadeIn()"内で行われる)
				uStoneRotateRight(g_stone_01);	//石像1を右に90度回転させる
				uStoneRotateRight(g_stone_02);	//石像2を右に90度回転させる
				uStoneRotateRight(g_stone_03);	//石像3を右に90度回転させる
				
				// デモの復帰位置をデモの完成後に設定します
				//SetReturnDemoPosDir_(Vec3(261.301, 75.308, -113.488), -28);
				ChangeDemo_(218);//218[石像回転 左上]
			}
			//石像が動くデモを一度でも見た場合
			if(statue_demo == true){
				
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
			}
			break;
		// 反時計回り
		case QUERY3_1:
			//石像ギミックの手順をカウントする
			count_num = count_num + 1;
			SetNumFlg_("NUM_FLG_PRAYROOM_COUNT", count_num);
			
			//石像が動くデモを一度も見ていない場合
			if(statue_demo == false){
				SetEventFlg_("BFG_MOVE_STATUE_FIRST_TIME_DEMO", true);	//石像が動くデモを見たかフラグ
				SetEventFlg_("BFG_MOVE_DIR_STATUE", false);				//反時計回りを選択したフラグ
				SetEventFlg_("BFG_DISPLAYED_DEMO_MOVE_STATUE", true);	//デモを見た直後のフラグ
				
				//回転値を計算する関数(結果の出力は"function FadeIn()"内で行われる)
				uStoneRotateLeft(g_stone_01);	//石像1を左に90度回転させる
				uStoneRotateLeft(g_stone_02);	//石像2を左に90度回転させる
				uStoneRotateLeft(g_stone_03);	//石像3を左に90度回転させる
				
				// デモの復帰位置をデモの完成後に設定します
				//SetReturnDemoPosDir_(Vec3(261.301, 75.308, -113.488), -28);
				ChangeDemo_(218);//218[石像回転 左上]
			}
			//石像が動くデモを一度でも見た場合
			if(statue_demo == true){
				CloseMsgWnd_();
				//調べた石像の回転処理
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
			}
			break;
		// やめる
		case QUERY3_2:
			//メッセージウインドウを閉じる(仮)
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
	if(statue_demo == true){					// 石像が動くデモを見た後
		if( count_num == 1 ){					// 手順の回数があと一回の場合
			OpenMsgWnd_();
			ShowMsg_("SYS_HELP_MES_010");		// 石像を動かせる　残り回数は　あと１回だ……。
			KeyInputWait_();
			CloseMsgWnd_();
		}
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
	local count_num		 = GetNumFlg_("NUM_FLG_PRAYROOM_COUNT");			// 石像の手順リセット用
	local statue_demo	 = GetEventFlg_("BFG_MOVE_STATUE_FIRST_TIME_DEMO");	// 石像の初回デモを見たフラグ
	local seikai		 = GetEventFlg_("BFG_MOVE_SUCCESS_FIRST");			// ４体の石像ギミックを正確な位置に合わせられたフラグ

	//石像の回転タスクに使用
	local task1, task2, task3, task4;
	//エフェクトに使用
	local efc_task1to2, efc_task1to3, efc_task2to1, efc_task2to4;
	local efc_task3to1, efc_task3to4, efc_task4to2, efc_task4to3;
	local alpha_def;
	
	
	CommPlayerTurnAroundObj(g_stone_02);
	//ギミック未攻略の場合
	if( seikai == false ){
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
			SetNumFlg_("NUM_FLG_PRAYROOM_COUNT", count_num);
			
			//石像が動くデモを一度も見ていない場合
			if(statue_demo == false){
				SetEventFlg_("BFG_MOVE_STATUE_FIRST_TIME_DEMO", true);	//石像が動くデモを見たかフラグ
				SetEventFlg_("BFG_MOVE_DIR_STATUE", true);				//時計回りを選択したフラグ
				SetEventFlg_("BFG_DISPLAYED_DEMO_MOVE_STATUE", true);	//デモを見た直後のフラグ
				
				//回転値を計算する関数(結果の出力は"function FadeIn()"内で行われる)
				uStoneRotateRight(g_stone_01);	//石像1を右に90度回転させる
				uStoneRotateRight(g_stone_02);	//石像2を右に90度回転させる
				uStoneRotateRight(g_stone_04);	//石像4を右に90度回転させる
				
				// デモの復帰位置をデモの完成後に設定します
				//SetReturnDemoPosDir_(Vec3(261.301, 75.308, -113.488), -28);
				ChangeDemo_(217);//217[石像回転 右上]
			}
			//石像が動くデモを一度でも見た場合
			if(statue_demo == true){
				
				//回転値を計算する関数
				uStoneRotateRight(g_stone_01);	//石像1を右に90度回転させる
				uStoneRotateRight(g_stone_02);	//石像2を右に90度回転させる
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
			}
			break;
		// 反時計回り
		case QUERY3_1:
			//石像ギミックの手順をカウントする
			count_num = count_num + 1;
			SetNumFlg_("NUM_FLG_PRAYROOM_COUNT", count_num);
			
			//石像が動くデモを一度も見ていない場合
			if(statue_demo == false){
				SetEventFlg_("BFG_MOVE_STATUE_FIRST_TIME_DEMO", true);	//石像が動くデモを見たかフラグ
				SetEventFlg_("BFG_MOVE_DIR_STATUE", false);				//反時計回りを選択したフラグ
				SetEventFlg_("BFG_DISPLAYED_DEMO_MOVE_STATUE", true);	//デモを見た直後のフラグ
				
				//回転値を計算する関数(結果の出力は"function FadeIn()"内で行われる)
				uStoneRotateLeft(g_stone_01);	//石像1を左に90度回転させる
				uStoneRotateLeft(g_stone_02);	//石像2を左に90度回転させる
				uStoneRotateLeft(g_stone_04);	//石像4を左に90度回転させる
				
				// デモの復帰位置をデモの完成後に設定します
				//SetReturnDemoPosDir_(Vec3(261.301, 75.308, -113.488), -28);
				ChangeDemo_(217);//217[石像回転 右上]
			}
			//石像が動くデモを一度でも見た場合
			if(statue_demo == true){
				CloseMsgWnd_();
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
			}
			break;
		// やめる
		case QUERY3_2:
			//メッセージウインドウを閉じる(仮)
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
	if(statue_demo == true){					// 石像が動くデモを見た後
		if( count_num == 1 ){					// 手順の回数があと一回の場合
			OpenMsgWnd_();
			ShowMsg_("SYS_HELP_MES_010");		// 石像を動かせる　残り回数は　あと１回だ……。
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//		石像3(左下)を90度回転させるタスク処理
//
//----------------------------------------------------------------------------
//	引数	: なし
//
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function uMineRotateStone3()
{
	//フラグの状態を取得
	local count_num		 = GetNumFlg_("NUM_FLG_PRAYROOM_COUNT");			// 石像の手順リセット用
	local statue_demo	 = GetEventFlg_("BFG_MOVE_STATUE_FIRST_TIME_DEMO");	// 石像の初回デモを見たフラグ
	local seikai		 = GetEventFlg_("BFG_MOVE_SUCCESS_FIRST");			// ４体の石像ギミックを正確な位置に合わせられたフラグ

	//石像の回転タスクに使用
	local task1, task2, task3, task4;
	//エフェクトに使用
	local efc_task1to2, efc_task1to3, efc_task2to1, efc_task2to4;
	local efc_task3to1, efc_task3to4, efc_task4to2, efc_task4to3;
	local alpha_def;
	
//	statue_demo = true;	//デバッグ確認用(有効にすると初回デモが発生しなくなる)
	
	CommPlayerTurnAroundObj(g_stone_03);
	//ギミック未攻略の場合
	if( seikai == false ){
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
			SetNumFlg_("NUM_FLG_PRAYROOM_COUNT", count_num);
			
			//石像が動くデモを一度も見ていない場合
			if(statue_demo == false){
				SetEventFlg_("BFG_MOVE_STATUE_FIRST_TIME_DEMO", true);	//石像が動くデモを見たかフラグ
				SetEventFlg_("BFG_MOVE_DIR_STATUE", true);				//時計回りを選択したフラグ
				SetEventFlg_("BFG_DISPLAYED_DEMO_MOVE_STATUE", true);	//デモを見た直後のフラグ
				
				//回転値を計算する関数(結果の出力は"function FadeIn()"内で行われる)
				uStoneRotateRight(g_stone_01);	//石像1を右に90度回転させる
				uStoneRotateRight(g_stone_03);	//石像3を右に90度回転させる
				uStoneRotateRight(g_stone_04);	//石像4を右に90度回転させる
				
				// デモの復帰位置をデモの完成後に設定します
				//SetReturnDemoPosDir_(Vec3(261.301, 75.308, -113.488), -28);
				ChangeDemo_(216);//216[石像回転 左下]
			}
			//石像が動くデモを一度でも見た場合
			if(statue_demo == true){
				
				//回転値を計算する関数
				uStoneRotateRight(g_stone_01);	//石像1を右に90度回転させる
				uStoneRotateRight(g_stone_03);	//石像3を右に90度回転させる
				uStoneRotateRight(g_stone_04);	//石像4を右に90度回転させる
				
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
				efc_task3to1 = Task_AnimeMoveNoFit_(base3to1, "beem3_to_1");
				efc_task3to4 = Task_AnimeMoveNoFit_(base3to4, "beem3_to_4");
				WaitTask(efc_task3to1);
				
				//エフェクトサイズを"0"にして見えないようにする
				for(alpha_def = EFC_SIZE_MAX; alpha_def >= EFC_SIZE_MIN; alpha_def = alpha_def - GRADUALLY_SMALL){
					SetEffectScale_(efc_3to1, alpha_def);
					SetEffectScale_(efc_3to4, alpha_def);
					Wait_(1);
				}
				
				//エフェクトのα値を0にする
				SetEffectScale_(efc_3to1, EFC_SIZE_MIN);
				SetEffectScale_(efc_3to4, EFC_SIZE_MIN);
				
				//ビームの位置を元に戻す
				SetPointPos_(base3to1, "obj003");
				SetPointPos_(base3to4, "obj003");
				
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
			}
			break;
		// 反時計回り
		case QUERY3_1:
			//石像ギミックの手順をカウントする
			count_num = count_num + 1;
			SetNumFlg_("NUM_FLG_PRAYROOM_COUNT", count_num);
			
			//石像が動くデモを一度も見ていない場合
			if(statue_demo == false){
				SetEventFlg_("BFG_MOVE_STATUE_FIRST_TIME_DEMO", true);	//石像が動くデモを見たかフラグ
				SetEventFlg_("BFG_MOVE_DIR_STATUE", false);				//反時計回りを選択したフラグ
				SetEventFlg_("BFG_DISPLAYED_DEMO_MOVE_STATUE", true);	//デモを見た直後のフラグ
				
				//回転値を計算する関数(結果の出力は"function FadeIn()"内で行われる)
				uStoneRotateLeft(g_stone_01);	//石像1を左に90度回転させる
				uStoneRotateLeft(g_stone_03);	//石像3を左に90度回転させる
				uStoneRotateLeft(g_stone_04);	//石像4を左に90度回転させる
				
				// デモの復帰位置をデモの完成後に設定します
				//SetReturnDemoPosDir_(Vec3(261.301, 75.308, -113.488), -28);
				ChangeDemo_(216);//216[石像回転 左下]
			}
			//石像が動くデモを一度でも見た場合
			if(statue_demo == true){
				CloseMsgWnd_();
				//回転値を計算する関数
				uStoneRotateLeft(g_stone_01);	//石像1を左に90度回転させる
				uStoneRotateLeft(g_stone_03);	//石像3を左に90度回転させる
				uStoneRotateLeft(g_stone_04);	//石像4を左に90度回転させる
				
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
				efc_task3to1 = Task_AnimeMoveNoFit_(base3to1, "beem3_to_1");
				efc_task3to4 = Task_AnimeMoveNoFit_(base3to4, "beem3_to_4");
				WaitTask(efc_task3to1);
				
				//エフェクトサイズを"0"にして見えないようにする
				for(alpha_def = EFC_SIZE_MAX; alpha_def >= EFC_SIZE_MIN; alpha_def = alpha_def - GRADUALLY_SMALL){
					SetEffectScale_(efc_3to1, alpha_def);
					SetEffectScale_(efc_3to4, alpha_def);
					Wait_(1);
				}
				
				//エフェクトのα値を0にする
				SetEffectScale_(efc_3to1, EFC_SIZE_MIN);
				SetEffectScale_(efc_3to4, EFC_SIZE_MIN);
				
				//ビームの位置を元に戻す
				SetPointPos_(base3to1, "obj003");
				SetPointPos_(base3to4, "obj003");
				
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
			}
			break;
		// やめる
		case QUERY3_2:
			//メッセージウインドウを閉じる(仮)
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
	if(statue_demo == true){					// 石像が動くデモを見た後
		if( count_num == 1 ){					// 手順の回数があと一回の場合
			OpenMsgWnd_();
			ShowMsg_("SYS_HELP_MES_010");		// 石像を動かせる　残り回数は　あと１回だ……。
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//		石像4(右下)を90度回転させるタスク処理
//
//----------------------------------------------------------------------------
//	引数	: なし
//
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function uMineRotateStone4()
{
	//フラグの状態を取得
	local count_num		 = GetNumFlg_("NUM_FLG_PRAYROOM_COUNT");			// 石像の手順リセット用
	local statue_demo	 = GetEventFlg_("BFG_MOVE_STATUE_FIRST_TIME_DEMO");	// 石像の初回デモを見たフラグ
	local seikai		 = GetEventFlg_("BFG_MOVE_SUCCESS_FIRST");			// ４体の石像ギミックを正確な位置に合わせられたフラグ

	//石像の回転タスクに使用
	local task1, task2, task3, task4;
	//エフェクトに使用
	local efc_task1to2, efc_task1to3, efc_task2to1, efc_task2to4;
	local efc_task3to1, efc_task3to4, efc_task4to2, efc_task4to3;
	local alpha_def;
	
	
	CommPlayerTurnAroundObj(g_stone_04);
	//ギミック未攻略の場合
	if( seikai == false ){
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
			SetNumFlg_("NUM_FLG_PRAYROOM_COUNT", count_num);
			
			//石像が動くデモを一度も見ていない場合
			if(statue_demo == false){
				SetEventFlg_("BFG_MOVE_STATUE_FIRST_TIME_DEMO", true);	//石像が動くデモを見たかフラグ
				SetEventFlg_("BFG_MOVE_DIR_STATUE", true);				//時計回りを選択したフラグ
				SetEventFlg_("BFG_DISPLAYED_DEMO_MOVE_STATUE", true);	//デモを見た直後のフラグ
				
				//回転値を計算する関数(結果の出力は"function FadeIn()"内で行われる)
				uStoneRotateRight(g_stone_02);	//石像2を右に90度回転させる
				uStoneRotateRight(g_stone_03);	//石像3を右に90度回転させる
				uStoneRotateRight(g_stone_04);	//石像4を右に90度回転させる
				
				// デモの復帰位置をデモの完成後に設定します
				//SetReturnDemoPosDir_(Vec3(261.301, 75.308, -113.488), -28);
				ChangeDemo_(215);//215[石像回転 右下]
			}
			//石像が動くデモを一度でも見た場合
			if(statue_demo == true){
				
				//回転値を計算する関数
				uStoneRotateRight(g_stone_02);	//石像2を右に90度回転させる
				uStoneRotateRight(g_stone_03);	//石像3を右に90度回転させる
				uStoneRotateRight(g_stone_04);	//石像4を右に90度回転させる
				
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
				efc_task4to2 = Task_AnimeMoveNoFit_(base4to2, "beem4_to_2");
				efc_task4to3 = Task_AnimeMoveNoFit_(base4to3, "beem4_to_3");
				WaitTask(efc_task4to2);
				
				//エフェクトサイズを"0"にして見えないようにする
				for(alpha_def = 1.0; alpha_def >= EFC_SIZE_MIN; alpha_def = alpha_def - GRADUALLY_SMALL){
					SetEffectScale_(efc_4to2, alpha_def);
					SetEffectScale_(efc_4to3, alpha_def);
					Wait_(1);
				}
				
				//エフェクトのα値を0にする
				SetEffectScale_(efc_4to2, EFC_SIZE_MIN);
				SetEffectScale_(efc_4to3, EFC_SIZE_MIN);
				
				//ビームの位置を元に戻す
				SetPointPos_(base4to2, "obj004");
				SetPointPos_(base4to3, "obj004");
				
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
			}
			break;
		// 反時計回り
		case QUERY3_1:
			//石像ギミックの手順をカウントする
			count_num = count_num + 1;
			SetNumFlg_("NUM_FLG_PRAYROOM_COUNT", count_num);
			
			//石像が動くデモを一度も見ていない場合
			if(statue_demo == false){
				SetEventFlg_("BFG_MOVE_STATUE_FIRST_TIME_DEMO", true);	//石像が動くデモを見たかフラグ
				SetEventFlg_("BFG_MOVE_DIR_STATUE", false);				//反時計回りを選択したフラグ
				SetEventFlg_("BFG_DISPLAYED_DEMO_MOVE_STATUE", true);	//デモを見た直後のフラグ
				
				//回転値を計算する関数(結果の出力は"function FadeIn()"内で行われる)
				uStoneRotateLeft(g_stone_02);	//石像2を左に90度回転させる
				uStoneRotateLeft(g_stone_03);	//石像3を左に90度回転させる
				uStoneRotateLeft(g_stone_04);	//石像4を左に90度回転させる
				
				// デモの復帰位置をデモの完成後に設定します
				//SetReturnDemoPosDir_(Vec3(261.301, 75.308, -113.488), -28);
				ChangeDemo_(215);//215[石像回転 右下]
			}
			//石像が動くデモを一度でも見た場合
			if(statue_demo == true){
				CloseMsgWnd_();
				//回転値を計算する関数
				uStoneRotateLeft(g_stone_02);	//石像2を左に90度回転させる
				uStoneRotateLeft(g_stone_03);	//石像3を左に90度回転させる
				uStoneRotateLeft(g_stone_04);	//石像4を左に90度回転させる
				
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
				efc_task4to2 = Task_AnimeMoveNoFit_(base4to2, "beem4_to_2");
				efc_task4to3 = Task_AnimeMoveNoFit_(base4to3, "beem4_to_3");
				WaitTask(efc_task4to2);
				
				//エフェクトサイズを"0"にして見えないようにする
				for(alpha_def = EFC_SIZE_MAX; alpha_def >= EFC_SIZE_MIN; alpha_def = alpha_def - GRADUALLY_SMALL){
					SetEffectScale_(efc_4to2, alpha_def);
					SetEffectScale_(efc_4to3, alpha_def);
					Wait_(1);
				}
				
				//エフェクトのα値を0にする
				SetEffectScale_(efc_4to2, EFC_SIZE_MIN);
				SetEffectScale_(efc_4to3, EFC_SIZE_MIN);
				
				//ビームの位置を元に戻す
				SetPointPos_(base4to2, "obj004");
				SetPointPos_(base4to3, "obj004");
				
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
			}
			break;
		// やめる
		case QUERY3_2:
			//メッセージウインドウを閉じる(仮)
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
	if(statue_demo == true){					// 石像が動くデモを見た後
		if( count_num == 1 ){					// 手順の回数があと一回の場合
			OpenMsgWnd_();
			ShowMsg_("SYS_HELP_MES_010");		// 石像を動かせる　残り回数は　あと１回だ……。
			KeyInputWait_();
			CloseMsgWnd_();
		}
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
	g_num_stone1 <- GetNumFlg_("NUM_FLG_PRAYROOM_STONE_STATUE_01");
	g_num_stone2 <- GetNumFlg_("NUM_FLG_PRAYROOM_STONE_STATUE_02");
	g_num_stone3 <- GetNumFlg_("NUM_FLG_PRAYROOM_STONE_STATUE_03");
	g_num_stone4 <- GetNumFlg_("NUM_FLG_PRAYROOM_STONE_STATUE_04");
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		石像専用のフラグをセットする
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uSetSekizouFlag()
{
	SetNumFlg_("NUM_FLG_PRAYROOM_STONE_STATUE_01", g_num_stone1);
	SetNumFlg_("NUM_FLG_PRAYROOM_STONE_STATUE_02", g_num_stone2);
	SetNumFlg_("NUM_FLG_PRAYROOM_STONE_STATUE_03", g_num_stone3);
	SetNumFlg_("NUM_FLG_PRAYROOM_STONE_STATUE_04", g_num_stone4);
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		石像の回転値(num)を変える処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uResetNumStone(num1, num2, num3, num4)
{
	g_num_stone1 <- num1;
	g_num_stone2 <- num2;
	g_num_stone3 <- num3;
	g_num_stone4 <- num4;
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		石像の回転値(dir)を変える処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uResetDirStone(dir1, dir2, dir3, dir4)
{
	g_dir01 <- dir1;
	g_dir02 <- dir2;
	g_dir03 <- dir3;
	g_dir04 <- dir4;
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
	// ナビマップアイコンの向きを現状の値の方向に向かせる
	SetNaviMapIconDir_(g_map_navi01, g_dir01);
	SetNaviMapIconDir_(g_map_navi02, g_dir02);
	SetNaviMapIconDir_(g_map_navi03, g_dir03);
	SetNaviMapIconDir_(g_map_navi04, g_dir04);
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
		SetNumFlg_("NUM_FLG_PRAYROOM_STONE_STATUE_01", g_num_stone1);	//"-1"された値をセット
		
		//石像の回転値を計算する
		if( g_dir01 == 0 ){ g_dir01 <- 360; }			//回転値がマイナスにならない様にする
		g_dir01 = g_dir01 - 90;							//変数の値を"-90"する
	}
	//石像2(右上)の場合
	if( id == g_stone_02 ){
		if( g_num_stone2 == 0 ){ g_num_stone2 <- 4; }
		g_num_stone2 = g_num_stone2 - 1;
		SetNumFlg_("NUM_FLG_PRAYROOM_STONE_STATUE_02", g_num_stone2);
		
		if( g_dir02 == 0 ){ g_dir02 <- 360; }
		g_dir02 = g_dir02 - 90;
	}
	//石像3(左下)の場合
	if( id == g_stone_03 ){
		if( g_num_stone3 == 0 ){ g_num_stone3 <- 4; }
		g_num_stone3 = g_num_stone3 - 1;
		SetNumFlg_("NUM_FLG_PRAYROOM_STONE_STATUE_03", g_num_stone3);
		
		if( g_dir03 == 0 ){ g_dir03 <- 360; }
		g_dir03 = g_dir03 - 90;
	}
	//石像4(右下)の場合
	if( id == g_stone_04 ){
		if( g_num_stone4 == 0 ){ g_num_stone4 <- 4; }
		g_num_stone4 = g_num_stone4 - 1;
		SetNumFlg_("NUM_FLG_PRAYROOM_STONE_STATUE_04", g_num_stone4);
		
		if( g_dir04 == 0 ){ g_dir04 <- 360; }
		g_dir04 = g_dir04 - 90;
	}
}


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
		SetNumFlg_("NUM_FLG_PRAYROOM_STONE_STATUE_01", g_num_stone1);//"+1"された値をセット
		
		//石像の回転値を計算する
		g_dir01 = g_dir01 + 90;							//変数の値を"+90"する
		if( g_dir01 == 360 ){	g_dir01 <- 0;	}		//回転値が"360"より大きくならない様にする
	}
	//石像2(右上)の場合
	if( id == g_stone_02 ){
		g_num_stone2 = g_num_stone2 + 1;
		if( g_num_stone2 == 4 ){ g_num_stone2 <- 0; }
		SetNumFlg_("NUM_FLG_PRAYROOM_STONE_STATUE_02", g_num_stone2);
		
		g_dir02 = g_dir02 + 90;
		if( g_dir02 == 360 ){	g_dir02 <- 0;	}
	}
	//石像3(左下)の場合
	if( id == g_stone_03 ){
		g_num_stone3 = g_num_stone3 + 1;
		if( g_num_stone3 == 4 ){ g_num_stone3 <- 0; }
		SetNumFlg_("NUM_FLG_PRAYROOM_STONE_STATUE_03", g_num_stone3);
		
		g_dir03 = g_dir03 + 90;
		if( g_dir03 == 360 ){	g_dir03 <- 0;	}
	}
	//石像4(右下)の場合
	if( id == g_stone_04 ){
		g_num_stone4 = g_num_stone4 + 1;
		if( g_num_stone4 == 4 ){ g_num_stone4 <- 0; }
		SetNumFlg_("NUM_FLG_PRAYROOM_STONE_STATUE_04", g_num_stone4);
		
		g_dir04 = g_dir04 + 90;
		if( g_dir04 == 360 ){	g_dir04 <- 0;	}
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

