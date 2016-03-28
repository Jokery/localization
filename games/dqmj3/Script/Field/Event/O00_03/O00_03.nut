//===================== 時空間マップ ====================
// FieldCrackManager.hが原本
const eNPC_KIND_MASTER_ITEM  = 0;	//アイテム(デフォルト)
const eNPC_KIND_MASTER_GOLD  = 1;	//金
const eNPC_KIND_MASTER_SHOP  = 2;	//ショップ(肉)
const eNPC_KIND_DISC_SUBDUE  = 3;	//DISC討伐
const eNPC_KIND_DARKLORD     = 4;	//魔王

const eNPC_KIND_MASTER_ITEM_ITEMSET = 0;	// お役立ち
const eNPC_KIND_MASTER_ITEM_SEED    = 1;	// 種
const eNPC_KIND_MASTER_ITEM_MEDAL   = 2;	// メダル
const eNPC_KIND_MASTER_ITEM_PROOF   = 3;	// 証

const DiscQuestEndType_None    = 0; //!< 終了していない
const DiscQuestEndType_Success = 1; //!< 成功
const DiscQuestEndType_Failure = 2; //!< 失敗

// メッセージタグ番号
const MSG_TOUCHMASTER_ASK_BATTLE  = 0;		//バトルするか尋ねる
const MSG_TOUCHMASTER_SEL_YES     = 1;		//YES →バトル開始
const MSG_TOUCHMASTER_SEL_NO      = 2;		//NO　→主人公フリー
const MSG_TOUCHMASTER_WIN_CMN_01  = 3;		//バトル勝利共通１（キャラ会話　称える）
const MSG_TOUCHMASTER_WIN_CMN_02  = 4;		//バトル勝利共通２（報酬獲得数が1つの時）
const MSG_TOUCHMASTER_WIN_CMN_04  = 5;		//バトル勝利共通２（報酬獲得数が2つ以上の時）
const MSG_TOUCHMASTER_WIN_CMN_03  = 6;		//バトル勝利共通３（キャラ会話　別れ）
const MSG_TOUCHMASTER_LOSE_CMN_01 = 7;		//バトル敗北共通１
const MSG_TOUCHMASTER_LOSE_CMN_02 = 8;		//バトル敗北共通２　※2015/10/19現在、紫の所持金を奪う場合のみ。

const MSG_TOUCHMASTER_WIN_SHOP_01  = 8;		//バトル勝利　肉屋（キャラ会話　称える）
const MSG_TOUCHMASTER_WIN_SHOP_02  = 9;		//バトル勝利　肉屋（キャラ会話　ショップ後再確認）
const MSG_TOUCHMASTER_WIN_SHOP_03  = 10;		//バトル勝利　肉屋（キャラ会話　別れ）
const MSG_TOUCHMASTER_LOSE_SHOP_01 = 11;	//バトル敗北　肉屋（キャラ会話　定価販売）
const MSG_TOUCHMASTER_LOSE_SHOP_02 = 12;	//バトル敗北　肉屋（キャラ会話　ショップ後再確認）
const MSG_TOUCHMASTER_LOSE_SHOP_03 = 13;	//バトル敗北　肉屋（キャラ会話　別れ）

const MSG_TOUCHDISC_ASK_BATTLE     = 13;	//バトルするか尋ねる
const MSG_TOUCHDISC_SEL_YES        = 14;	//YES →バトル開始
const MSG_TOUCHDISC_SEL_NO         = 15;	//NO　→主人公フリー
const MSG_TOUCHDISC_WIN_CMN_01     = 16;	//バトル勝利共通１（キャラ会話　称える）
const MSG_TOUCHDISC_LOSE_CMN_01    = 17;	//バトル敗北共通１（キャラ会話　残念）

// 変数定義
g_crack_npc	 <- C_NONE_ID;	// 裂け目NPC
g_mineCircle <- C_NONE_ID;	// 魔王地雷
g_disc_master_msg_type <- C_NONE_ID;	//ディスクの他国マスターの会話タイプ（空間内で固定化するため）

//------------------------------------------------
//		フェードイン
//------------------------------------------------
function FadeIn()
{
	// 変数定義
	local master_on, player;
	
	// フラグの状態を取得
	master_on	 = IsMasterCrackMap_();		// 裂け目の世界かどうか
	player		 = GetPlayerId_();			// プレイヤーID取得
	
	//------------------
	// ▼裂け目NPCの設定
	//------------------
	
	//■他国マスターの時
	if (master_on){
		//まだ配置されていないときだけ配置
		if ( g_crack_npc == C_NONE_ID ) {
			// 変数定義
			local crack_npc, crack_scale;
			
			crack_npc	 = GetCrackNPCModelResName_();	// 裂け目の世界NPCのモデルリソース名を取得
			crack_scale	 = GetCrackNPCScale_();			// 裂け目NPCのスケール値（倍率）を取得
			
			DebugPrint("★★他国処理★★");
			
			// NPC配置
			id_crack_npc <- ReadNpc_(crack_npc);
			g_crack_npc <- ArrangePointNpc_(id_crack_npc, "npc000");
			SetScale_(g_crack_npc, crack_scale);
			SetReactorMsg_(g_crack_npc, "REACTOR_MSG_MASTER_NOCHO");
			SetTalkCameraType_(g_crack_npc, TALK_CAMERA_UP);
			// アナライズのターゲット名を切り替える(チョーマッハ→マスター・ノチョーラ)
			SetTargetNameKey_(g_crack_npc, "NAME_TAG_MASTER_NOCHORA");
		}
	}

	
	// セーブ禁止	※解除については各大陸の"FadeIn()"にて行っている。
	//このマップのセーブ禁止は、プログラムで行っています。

	//-----------------
	// ▼マップナビ配置
	//-----------------
	local navi_master = ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "npc000");	// 他国マスター
	
	
	EventEnd_();
}

//------------------------------------------------
//		イベントスタート
//------------------------------------------------
function EventStartOperate()
{
	// 変数定義
	local master_on, player;
	
	// フラグの状態を取得
	master_on		 = IsMasterCrackMap_();					// 裂け目の世界かどうか
	player			 = GetPlayerId_();						// プレイヤーID取得
	
	//-------------
	// ■戦闘結果
	//-------------
	// ネームタグ設定
	if (GetBattleEndType_() != END_TYPE_NONE){			// 戦闘終了タイプ"その他"を取得
		SetEventFlg_("BFG_DEAD_KEEP_MAP", false);		// その場復帰フラグを下ろす
		
		// UI Stop
		SetDiscQuestUIStop_( true );

		switch (GetCrackNPCKind_()){					// 裂け目世界のNPCの種別を取得
		case eNPC_KIND_MASTER_ITEM:
			uAfterBattleMasterItem(END_TYPE_NONE);
			break;
		case eNPC_KIND_MASTER_GOLD:
			uAfterBattleMasterGold(END_TYPE_NONE);
			break;
		case eNPC_KIND_MASTER_SHOP:
			uAfterBattleMasterShop(END_TYPE_NONE);
			break;
		case eNPC_KIND_DISC_SUBDUE:
			uAfterBattleDidcSubdue(END_TYPE_NONE);
			break;
		case eNPC_KIND_DARKLORD:
		default :
			DebugPrint("WARNING : NPC_IDが不正です [EventStartOperate]");
			break;
		}
		
		SetDirToPos_(player, GetPos_(g_crack_npc));		//プレイヤーをNPCの方に
		SetDirToPos_(g_crack_npc, GetPos_(player));		//NPCをプレイヤーの方に向かせる
		
		// 勝った or スカウトした場合
		if(GetBattleEndType_() == END_TYPE_WIN			// 戦闘終了タイプ"勝利"を取得
		|| GetBattleEndType_() == END_TYPE_SCOUT){		// 戦闘終了タイプ"スカウト"を取得
			
			// 勝ったのでQuestValueを足す
			AddDiscQuestValue_( 1 );
			
			switch (GetCrackNPCKind_()){				// 裂け目世界のNPCの種別を取得
			case eNPC_KIND_MASTER_ITEM:
				uAfterBattleMasterItem(END_TYPE_WIN);
				break;
			case eNPC_KIND_MASTER_GOLD:
				uAfterBattleMasterGold(END_TYPE_WIN);
				break;
			case eNPC_KIND_MASTER_SHOP:
				uAfterBattleMasterShop(END_TYPE_WIN);
				break;
			case eNPC_KIND_DISC_SUBDUE:
				uAfterBattleDidcSubdue(END_TYPE_WIN);
				break;
			case eNPC_KIND_DARKLORD:
			default :
				DebugPrint("WARNING : NPC_IDが不正です [EventStartOperate]");
				break;
			}
		}
		// 負けた or 棄権した場合
		else{
			switch (GetCrackNPCKind_()){				// 裂け目世界のNPCの種別を取得
			case eNPC_KIND_MASTER_ITEM:
				uAfterBattleMasterItem(END_TYPE_LOSE);
				break;
			case eNPC_KIND_MASTER_GOLD:
				uAfterBattleMasterGold(END_TYPE_LOSE);
				break;
			case eNPC_KIND_MASTER_SHOP:
				uAfterBattleMasterShop(END_TYPE_LOSE);
				break;
			case eNPC_KIND_DISC_SUBDUE:
				uAfterBattleDidcSubdue(END_TYPE_LOSE);
				break;
			case eNPC_KIND_DARKLORD:
			default :
				DebugPrint("WARNING : NPC_IDが不正です [EventStartOperate]");
				break;
			}
		}
		
		if (GetCrackNPCKind_() != eNPC_KIND_DISC_SUBDUE){
			// 時空の裂け目関連のクリアフラグ
			SetClearFlagCrackMap_( true );
		}else{
			// 会話カメラのまま終了したいので、ここでフェードアウト
			SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
			SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
			WaitFade_();
			
			// DISCのクリアフラグ
			if (GetBattleEndType_() == BATTLE_END_TYPE_WIN){
				SetDiscQuestEnd_( DiscQuestEndType_Success );
			}else{
				SetDiscQuestEnd_( DiscQuestEndType_Failure );
			}
		}
		// プレイヤーを止める
		PlayerForcePause_( true );
	}

	EventEnd_();
}

//------------------------------------------------
//		ＮＰＣ接触時
//------------------------------------------------
function TouchNpc()
{
	// 変数定義
	local master_on, target, bit;
	
	// フラグの状態を取得
	master_on	 = IsMasterCrackMap_();					//裂け目の世界かどうか
	target		 = GetTargetId_();
	bit			 = false;
	
	if (target == g_crack_npc)
	{
		// UI Stop
		SetDiscQuestUIStop_( true );
		
		switch (GetCrackNPCKind_()){
		case eNPC_KIND_MASTER_ITEM:
			uTalkMasterItem();
			break;
		case eNPC_KIND_MASTER_GOLD:
			uTalkMasterGold();
			break;
		case eNPC_KIND_MASTER_SHOP:
			uTalkMasterShop();
			break;
		case eNPC_KIND_DISC_SUBDUE:
			uTalkDiscSubdue();
			break;
		case eNPC_KIND_DARKLORD:
		default :
			DebugPrint("WARNING : NPC_IDが不正です [EventStartOperate]");
			break;
		}
		// UI Stop解除
		SetDiscQuestUIStop_( false );
	}
	EventEnd_();
}
//------------------------------------------------
//		地雷接触時
//------------------------------------------------
function TouchEventMine()
{
	/*
		処理なし
	*/
	
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
//		戦闘終了後の処理  アイテムの場合
//------------------------------------------------
//	引数	: type	戦闘終了タイプ
//						END_TYPE_NONE	メッセージタグ設定
//						END_TYPE_WIN	勝った時
//						END_TYPE_LOSE	負けた時
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uAfterBattleMasterItem(type)
{

	if(type == END_TYPE_NONE){
		SetCrackNPCMessageNameTag_( "NAME_TAG_MASTER_NOCHORA" );

		switch (GetCrackNPCSubKind_()){
		//冒険に役立つセットのノチョーラ
		case eNPC_KIND_MASTER_ITEM_ITEMSET:
			SetCrackNPCMessageTag_(MSG_TOUCHMASTER_WIN_CMN_01,  "NPCMSG_001_WIN_01");
			SetCrackNPCMessageTag_(MSG_TOUCHMASTER_WIN_CMN_02,  "NPCMSG_WIN_REWORD_ITEM_SET_01");
			SetCrackNPCMessageTag_(MSG_TOUCHMASTER_WIN_CMN_04,  "NPCMSG_WIN_REWORD_ITEM_SET_02");
			SetCrackNPCMessageTag_(MSG_TOUCHMASTER_WIN_CMN_03,  "NPCMSG_001_WIN_02");
			SetCrackNPCMessageTag_(MSG_TOUCHMASTER_LOSE_CMN_01, "NPCMSG_001_LOSE_01");
			break;
		//種のノチョーラ
		case eNPC_KIND_MASTER_ITEM_SEED:
			SetCrackNPCMessageTag_(MSG_TOUCHMASTER_WIN_CMN_01,  "NPCMSG_002_WIN_01");
			SetCrackNPCMessageTag_(MSG_TOUCHMASTER_WIN_CMN_02,  "NPCMSG_WIN_REWORD_ITEM");
			SetCrackNPCMessageTag_(MSG_TOUCHMASTER_WIN_CMN_04,  "NPCMSG_WIN_REWORD_ITEMS");
			SetCrackNPCMessageTag_(MSG_TOUCHMASTER_WIN_CMN_03,  "NPCMSG_002_WIN_02");
			SetCrackNPCMessageTag_(MSG_TOUCHMASTER_LOSE_CMN_01, "NPCMSG_002_LOSE_01");
			break;
		//メダルのノチョーラ
		case eNPC_KIND_MASTER_ITEM_MEDAL:
			SetCrackNPCMessageTag_(MSG_TOUCHMASTER_WIN_CMN_01,  "NPCMSG_003_WIN_01");
			SetCrackNPCMessageTag_(MSG_TOUCHMASTER_WIN_CMN_02,  "NPCMSG_WIN_REWORD_MEDAL");
			SetCrackNPCMessageTag_(MSG_TOUCHMASTER_WIN_CMN_04,  "NPCMSG_WIN_REWORD_MEDALS");
			SetCrackNPCMessageTag_(MSG_TOUCHMASTER_WIN_CMN_03,  "NPCMSG_003_WIN_02");
			SetCrackNPCMessageTag_(MSG_TOUCHMASTER_LOSE_CMN_01, "NPCMSG_003_LOSE_01");
			break;
		//スキルの証のノチョーラ
		case eNPC_KIND_MASTER_ITEM_PROOF:
			SetCrackNPCMessageTag_(MSG_TOUCHMASTER_WIN_CMN_01,  "NPCMSG_006_WIN_01");
			SetCrackNPCMessageTag_(MSG_TOUCHMASTER_WIN_CMN_02,  "NPCMSG_WIN_REWORD_SKILL");
			SetCrackNPCMessageTag_(MSG_TOUCHMASTER_WIN_CMN_03,  "NPCMSG_006_WIN_02");
			SetCrackNPCMessageTag_(MSG_TOUCHMASTER_LOSE_CMN_01, "NPCMSG_006_LOSE_01");
			break;
		default :
			DebugPrint("WARNING : GetCrackNPCSubKind_の値が不正です [uAfterBattleMasterItem]");
			break;
		}
	}
	if(type == END_TYPE_WIN){
		SetTalkAction_( g_crack_npc );
		
		// 報酬数の抽選
		LotteryCrackNPCItemNum_();
		local item_num = GetCrackNPCItemNum_();
		
		//勝利メッセージ
		uReservMessageDisplay( MSG_TOUCHMASTER_WIN_CMN_01, true );
		
		//報酬SEとメッセージ
		PlaySE_("SE_SYS_011");

		if (GetCrackNPCSubKind_() != eNPC_KIND_MASTER_ITEM_ITEMSET)
		{
			PushCrackNPCItemNameAndNumMessage_(0);		// アイテム名と数を<exchange/>に登録
			if(item_num <= 1){
				// 報酬数が「1つ」の時のメッセージ
				uReservMessageDisplay( MSG_TOUCHMASTER_WIN_CMN_02, false );
			}else{
				// 報酬数が「2つ以上」の時のメッセージ
				uReservMessageDisplay( MSG_TOUCHMASTER_WIN_CMN_04, false );
			}
		}else
		{
			// お役立ちセット
			OpenMsgWnd_();
				PushCrackNPCItemNameAndNumMessage_(0);
				ShowMsg_( GetCrackNPCMessageTag_(MSG_TOUCHMASTER_WIN_CMN_02) );
				KeyInputWait_();
				PushCrackNPCItemNameAndNumMessage_(1);
				ShowMsg_( GetCrackNPCMessageTag_(MSG_TOUCHMASTER_WIN_CMN_04) );
				KeyInputWait_();
			CloseMsgWnd_();
		}
		
		//お別れメッセージ
		uReservMessageDisplay( MSG_TOUCHMASTER_WIN_CMN_03, true );
		
		// 実行
		ExecuteCrackNPCPresent_(BATTLE_END_TYPE_WIN);
	}
	if(type == END_TYPE_LOSE){
		SetTalkAction_( g_crack_npc );
		
		//敗北メッセージ
		uReservMessageDisplay( MSG_TOUCHMASTER_LOSE_CMN_01, true );
	}
	
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		戦闘終了後の処理  ゴールドの場合
//------------------------------------------------
//	引数	: type	戦闘終了タイプ
//						END_TYPE_NONE	メッセージタグ設定
//						END_TYPE_WIN	勝った時
//						END_TYPE_LOSE	負けた時
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uAfterBattleMasterGold(type)
{
	if(type == END_TYPE_NONE){
		SetCrackNPCMessageNameTag_( "NAME_TAG_MASTER_NOCHORA" );
		SetCrackNPCMessageTag_(MSG_TOUCHMASTER_WIN_CMN_01,  "NPCMSG_004_WIN_01");
		SetCrackNPCMessageTag_(MSG_TOUCHMASTER_WIN_CMN_02,  "NPCMSG_WIN_REWORD_MONEY_DOUBLE");
		SetCrackNPCMessageTag_(MSG_TOUCHMASTER_WIN_CMN_03,  "NPCMSG_004_WIN_02");
		SetCrackNPCMessageTag_(MSG_TOUCHMASTER_LOSE_CMN_01, "NPCMSG_004_LOSE_01");
		SetCrackNPCMessageTag_(MSG_TOUCHMASTER_LOSE_CMN_02, "NPCMSG_004_LOSE_02");
	}
	if(type == END_TYPE_WIN){
		SetTalkAction_( g_crack_npc );

		// 報酬数の抽選
		LotteryCrackNPCItemNum_();

		//勝利メッセージ
		uReservMessageDisplay( MSG_TOUCHMASTER_WIN_CMN_01, true );
		
		//報酬SEとメッセージ
		PushCrackNPCItemNameAndNumMessage_(0);		// 入手ゴールドを<exchange/>に登録
		PlaySE_("SE_SYS_011");
		uReservMessageDisplay( MSG_TOUCHMASTER_WIN_CMN_02, false );

		//お別れメッセージ
		uReservMessageDisplay( MSG_TOUCHMASTER_WIN_CMN_03, true );

		// 実行
		ExecuteCrackNPCPresent_(BATTLE_END_TYPE_WIN);
	}
	if(type == END_TYPE_LOSE){
		SetTalkAction_( g_crack_npc );

		// 報酬数の抽選
		LotteryCrackNPCItemNum_();

		//敗北メッセージ
		uReservMessageDisplay( MSG_TOUCHMASTER_LOSE_CMN_01, true );

		//半額ボッシュートメッセージ
		uReservMessageDisplay( MSG_TOUCHMASTER_LOSE_CMN_02, false );

		// 実行
		ExecuteCrackNPCPresent_(BATTLE_END_TYPE_LOSE);
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		戦闘終了後の処理  ショップ(肉)の場合
//------------------------------------------------
//	引数	: type	戦闘終了タイプ
//						END_TYPE_NONE	メッセージタグ設定
//						END_TYPE_WIN	勝った時
//						END_TYPE_LOSE	負けた時
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uAfterBattleMasterShop(type)
{
	if(type == END_TYPE_NONE){
		SetCrackNPCMessageNameTag_( "NAME_TAG_MASTER_NOCHORA" );
		SetCrackNPCMessageTag_(MSG_TOUCHMASTER_WIN_SHOP_01,  "NPCMSG_005_WIN_REWORD_SHOP_01");
		SetCrackNPCMessageTag_(MSG_TOUCHMASTER_WIN_SHOP_02,  "NPCMSG_005_WIN_REWORD_SHOP_02");
		SetCrackNPCMessageTag_(MSG_TOUCHMASTER_WIN_SHOP_03,  "NPCMSG_005_WIN_REWORD_SHOP_03");
		SetCrackNPCMessageTag_(MSG_TOUCHMASTER_LOSE_SHOP_01, "NPCMSG_005_LOSE_REWORD_SHOP_01");
		SetCrackNPCMessageTag_(MSG_TOUCHMASTER_LOSE_SHOP_02, "NPCMSG_005_LOSE_REWORD_SHOP_02");
		SetCrackNPCMessageTag_(MSG_TOUCHMASTER_LOSE_SHOP_03, "NPCMSG_005_LOSE_REWORD_SHOP_03");
	}
	if(type == END_TYPE_WIN){
		SetTalkAction_( g_crack_npc );

		//勝利メッセージ
		uReservMessageDisplay( MSG_TOUCHMASTER_WIN_SHOP_01, true );

		// 実行
		ExecuteCrackNPCPresent_(BATTLE_END_TYPE_WIN);
		while(true){
			// 肉屋の価格を半額にするフラグをON
			SetEventFlg_("BFG_MASTER_MEET_HALF_PRICE", true);
			// ショップメニューを呼び出す
			GotoMenuFadeOpen(MENU_OPEN.MASTER_MEET);
			// 肉屋の価格を半額にするフラグをOFF
			SetEventFlg_("BFG_MASTER_MEET_HALF_PRICE", false);

			//もう十分買った？
			uReservMessageDisplay( MSG_TOUCHMASTER_WIN_SHOP_02, true );
			// はい
			if (GetQueryResult_() == MES_QUERY_YES) {
				uReservMessageDisplay( MSG_TOUCHMASTER_WIN_SHOP_03, true );

				break;
			// いいえ
			} else {
				//ループ
			}
		}
	}
	if(type == END_TYPE_LOSE){
		SetTalkAction_( g_crack_npc );

		//敗北メッセージ
		uReservMessageDisplay( MSG_TOUCHMASTER_LOSE_SHOP_01, true );

		while(true){
			// ショップメニューを呼び出す
			GotoMenuFadeOpen(MENU_OPEN.MASTER_MEET);

			//もう十分買った？
			uReservMessageDisplay( MSG_TOUCHMASTER_LOSE_SHOP_02, true );
			// はい
			if (GetQueryResult_() == MES_QUERY_YES) {
				uReservMessageDisplay( MSG_TOUCHMASTER_LOSE_SHOP_03, true );

				break;
			// いいえ
			} else {
				//ループ
			}
		}
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		戦闘終了後の処理  DISC討伐の場合
//------------------------------------------------
//	引数	: type	戦闘終了タイプ
//						END_TYPE_NONE	メッセージタグ設定
//						END_TYPE_WIN	勝った時
//						END_TYPE_LOSE	負けた時
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uAfterBattleDidcSubdue(type)
{
	if(type == END_TYPE_NONE){
		SetCrackNPCMessageNameTag_( "NAME_TAG_MASTER_NOCHORA" );
		switch ( g_disc_master_msg_type ){
		case 0:
			SetCrackNPCMessageTag_( MSG_TOUCHDISC_WIN_CMN_01, "DISC_NPCMSG_001_WIN_01");
			SetCrackNPCMessageTag_( MSG_TOUCHDISC_LOSE_CMN_01, "DISC_NPCMSG_001_LOSE_01");
			break;
		case 1:
			SetCrackNPCMessageTag_( MSG_TOUCHDISC_WIN_CMN_01, "DISC_NPCMSG_002_WIN_01");
			SetCrackNPCMessageTag_( MSG_TOUCHDISC_LOSE_CMN_01, "DISC_NPCMSG_002_LOSE_01");
			break;
		case 2:
			SetCrackNPCMessageTag_( MSG_TOUCHDISC_WIN_CMN_01, "DISC_NPCMSG_003_WIN_01");
			SetCrackNPCMessageTag_( MSG_TOUCHDISC_LOSE_CMN_01, "DISC_NPCMSG_003_LOSE_01");
			break;
		case 3:
			SetCrackNPCMessageTag_( MSG_TOUCHDISC_WIN_CMN_01, "DISC_NPCMSG_004_WIN_01");
			SetCrackNPCMessageTag_( MSG_TOUCHDISC_LOSE_CMN_01, "DISC_NPCMSG_004_LOSE_01");
			break;
		case 4:
			SetCrackNPCMessageTag_( MSG_TOUCHDISC_WIN_CMN_01, "DISC_NPCMSG_005_WIN_01");
			SetCrackNPCMessageTag_( MSG_TOUCHDISC_LOSE_CMN_01, "DISC_NPCMSG_005_LOSE_01");
			break;
		default:
			//ここには来ないはず
			break;
		}
	}
	if(type == END_TYPE_WIN){
		SetTalkAction_( g_crack_npc );

		uReservMessageDisplay( MSG_TOUCHDISC_WIN_CMN_01, true );
	}
	if(type == END_TYPE_LOSE){
		SetTalkAction_( g_crack_npc );

		//敗北メッセージ
		uReservMessageDisplay( MSG_TOUCHDISC_LOSE_CMN_01, true );
	}
	
}



//++++++++++++++++++++++++++++++++++++++++++++++++
//		マスター・アイテム  会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkMasterItem()
{
	// メッセージタグ設定
	SetCrackNPCMessageNameTag_( "NAME_TAG_MASTER_NOCHORA" );

	switch (GetCrackNPCSubKind_()){
	//冒険に役立つセットのノチョーラ
	case eNPC_KIND_MASTER_ITEM_ITEMSET:
		SetCrackNPCMessageTag_( MSG_TOUCHMASTER_ASK_BATTLE, "NPCMSG_001_ASK_BATTLE");
		SetCrackNPCMessageTag_( MSG_TOUCHMASTER_SEL_YES,    "NPCMSG_001_YES_BATTLE_START");
		SetCrackNPCMessageTag_( MSG_TOUCHMASTER_SEL_NO,     "NPCMSG_001_NO_BATTLE_ESCAPE");
		break;
	//種のノチョーラ
	case eNPC_KIND_MASTER_ITEM_SEED:
		SetCrackNPCMessageTag_( MSG_TOUCHMASTER_ASK_BATTLE, "NPCMSG_002_ASK_BATTLE");
		SetCrackNPCMessageTag_( MSG_TOUCHMASTER_SEL_YES,    "NPCMSG_002_YES_BATTLE_START");
		SetCrackNPCMessageTag_( MSG_TOUCHMASTER_SEL_NO,     "NPCMSG_002_NO_BATTLE_ESCAPE");
		break;
	//メダルのノチョーラ
	case eNPC_KIND_MASTER_ITEM_MEDAL:
		SetCrackNPCMessageTag_( MSG_TOUCHMASTER_ASK_BATTLE, "NPCMSG_003_ASK_BATTLE");
		SetCrackNPCMessageTag_( MSG_TOUCHMASTER_SEL_YES,    "NPCMSG_003_YES_BATTLE_START");
		SetCrackNPCMessageTag_( MSG_TOUCHMASTER_SEL_NO,     "NPCMSG_003_NO_BATTLE_ESCAPE");
		break;
	//スキルの証のノチョーラ
	case eNPC_KIND_MASTER_ITEM_PROOF:
		SetCrackNPCMessageTag_( MSG_TOUCHMASTER_ASK_BATTLE, "NPCMSG_006_ASK_BATTLE");
		SetCrackNPCMessageTag_( MSG_TOUCHMASTER_SEL_YES,    "NPCMSG_006_YES_BATTLE_START");
		SetCrackNPCMessageTag_( MSG_TOUCHMASTER_SEL_NO,     "NPCMSG_006_NO_BATTLE_ESCAPE");
		break;
	default :
		DebugPrint("WARNING : GetCrackNPCSubKind_の値が不正です [uTalkMasterItem]");
		break;
	}

	
	// バトルするか尋ねる
	uMessageOpenClose( MSG_TOUCHMASTER_ASK_BATTLE, true );
	// はい
	if (GetQueryResult_() == MES_QUERY_YES){
		uMessageOpenClose( MSG_TOUCHMASTER_SEL_YES, false );

		// バトル開始
		SetEventFlg_("BFG_DEAD_KEEP_MAP", true);
		ChangeBattleParty_( GetCrackNPCPartyID_() );
	}
	// いいえ
	else{
		uMessageOpenClose( MSG_TOUCHMASTER_SEL_NO, false );
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		マスター・ゴールド  会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkMasterGold()
{
	// メッセージタグ設定
	SetCrackNPCMessageNameTag_( "NAME_TAG_MASTER_NOCHORA" );
	SetCrackNPCMessageTag_( MSG_TOUCHMASTER_ASK_BATTLE, "NPCMSG_004_ASK_BATTLE");
	SetCrackNPCMessageTag_( MSG_TOUCHMASTER_SEL_YES,    "NPCMSG_004_YES_BATTLE_START");
	SetCrackNPCMessageTag_( MSG_TOUCHMASTER_SEL_NO,     "NPCMSG_004_NO_BATTLE_ESCAPE");
	
	// バトルするか尋ねる
	uMessageOpenClose( MSG_TOUCHMASTER_ASK_BATTLE, true );
	// はい
	if (GetQueryResult_() == MES_QUERY_YES){
		uMessageOpenClose( MSG_TOUCHMASTER_SEL_YES, false );

		// バトル開始
		SetEventFlg_("BFG_DEAD_KEEP_MAP", true);
		ChangeBattleParty_( GetCrackNPCPartyID_() );
	}
	// いいえ
	else{
		uMessageOpenClose( MSG_TOUCHMASTER_SEL_NO, false );
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		マスター・ショップ  会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkMasterShop()
{
	// メッセージタグ設定
	SetCrackNPCMessageNameTag_( "NAME_TAG_MASTER_NOCHORA" );
	SetCrackNPCMessageTag_( MSG_TOUCHMASTER_ASK_BATTLE, "NPCMSG_005_ASK_BATTLE");
	SetCrackNPCMessageTag_( MSG_TOUCHMASTER_SEL_YES,    "NPCMSG_005_YES_BATTLE_START");
	SetCrackNPCMessageTag_( MSG_TOUCHMASTER_SEL_NO,     "NPCMSG_005_NO_BATTLE_ESCAPE");
	
	// バトルするか尋ねる
	uMessageOpenClose( MSG_TOUCHMASTER_ASK_BATTLE, true );
	// はい
	if (GetQueryResult_() == MES_QUERY_YES){
		uMessageOpenClose( MSG_TOUCHMASTER_SEL_YES, false );

		// バトル開始
		SetEventFlg_("BFG_DEAD_KEEP_MAP", true);
		ChangeBattleParty_( GetCrackNPCPartyID_() );
	}
	// いいえ
	else{
		uMessageOpenClose( MSG_TOUCHMASTER_SEL_NO, false );
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		DISC討伐  会話処理
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkDiscSubdue()
{
	// メッセージタグ設定（パターン関係ないのでココ）
	SetCrackNPCMessageNameTag_( "NAME_TAG_MASTER_NOCHORA" );

	if ( g_disc_master_msg_type == C_NONE_ID ) {
		g_disc_master_msg_type = GetRandom_(5);
	}

	switch ( g_disc_master_msg_type ){
	case 0:
		SetCrackNPCMessageTag_( MSG_TOUCHDISC_ASK_BATTLE, "DISC_NPCMSG_001_ASK_BATTLE");
		SetCrackNPCMessageTag_( MSG_TOUCHDISC_SEL_YES, "DISC_NPCMSG_001_YES");
		SetCrackNPCMessageTag_( MSG_TOUCHDISC_SEL_NO, "DISC_NPCMSG_001_NO");
		break;
	case 1:
		SetCrackNPCMessageTag_( MSG_TOUCHDISC_ASK_BATTLE, "DISC_NPCMSG_002_ASK_BATTLE");
		SetCrackNPCMessageTag_( MSG_TOUCHDISC_SEL_YES, "DISC_NPCMSG_002_YES");
		SetCrackNPCMessageTag_( MSG_TOUCHDISC_SEL_NO, "DISC_NPCMSG_002_NO");
		break;
	case 2:
		SetCrackNPCMessageTag_( MSG_TOUCHDISC_ASK_BATTLE, "DISC_NPCMSG_003_ASK_BATTLE");
		SetCrackNPCMessageTag_( MSG_TOUCHDISC_SEL_YES, "DISC_NPCMSG_003_YES");
		SetCrackNPCMessageTag_( MSG_TOUCHDISC_SEL_NO, "DISC_NPCMSG_003_NO");
		break;
	case 3:
		SetCrackNPCMessageTag_( MSG_TOUCHDISC_ASK_BATTLE, "DISC_NPCMSG_004_ASK_BATTLE");
		SetCrackNPCMessageTag_( MSG_TOUCHDISC_SEL_YES, "DISC_NPCMSG_004_YES");
		SetCrackNPCMessageTag_( MSG_TOUCHDISC_SEL_NO, "DISC_NPCMSG_004_NO");
		break;
	case 4:
		SetCrackNPCMessageTag_( MSG_TOUCHDISC_ASK_BATTLE, "DISC_NPCMSG_005_ASK_BATTLE");
		SetCrackNPCMessageTag_( MSG_TOUCHDISC_SEL_YES, "DISC_NPCMSG_005_YES");
		SetCrackNPCMessageTag_( MSG_TOUCHDISC_SEL_NO, "DISC_NPCMSG_005_NO");
		break;
	default:
		//ここには来ないはず
		break;
	}

	// バトルするか尋ねる
	uMessageOpenClose( MSG_TOUCHDISC_ASK_BATTLE, true );
	// はい
	if (GetQueryResult_() == MES_QUERY_YES){
		uMessageOpenClose( MSG_TOUCHDISC_SEL_YES, false );
		//戦闘開始へ
		SetEventFlg_("BFG_DEAD_KEEP_MAP", true);
		ChangeBattleParty_( GetCrackNPCPartyID_() );
	}
	// いいえ
	else{
		uMessageOpenClose( MSG_TOUCHDISC_SEL_NO, false);
	}
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		汎用メッセージ関数
//------------------------------------------------
//	引数	: msg		メッセージID
//	引数	: check		true = オープンしたまま閉じない
//						false = オープンした状態から閉じる
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMessageOpenClose(msg, check)
{
	if ( check == true ) {
		OpenMsgWnd_();
		SetTalkName_(GetCrackNPCMessageNameTag_());
		ShowMsg_( GetCrackNPCMessageTag_(msg) );
		KeyInputWait_();
	}
	if ( check == false ) {
		ShowMsg_( GetCrackNPCMessageTag_(msg) );
		KeyInputWait_();
		CloseMsgWnd_();
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		汎用メッセージ関数
//------------------------------------------------
//	引数	: msg	メッセージID
//	引数	: false = ネームタグ無、true = ネームタグ有り
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uReservMessageDisplay(msg, tagchk)
{
	OpenMsgWnd_();
	if ( tagchk == true ) {
		SetTalkName_(GetCrackNPCMessageNameTag_());
	}
	ShowMsg_( GetCrackNPCMessageTag_(msg) );
	KeyInputWait_();
	CloseMsgWnd_();
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		プレイヤーを指定の位置に復帰させる
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uPlayableReset()
{
	local player;
	player		 = GetPlayerId_();					// プレイヤーID取得
	
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
	
	SetPos_(player, Vec3(-272.0, 10.0, -3.0));
	SetDir_(player, 110);
	SetCameraDir_(110);
	Wait_(10);
	
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
}

