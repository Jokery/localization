//===================== 通信ロビー ====================
// BossDef.h が原本
const BOSS_FLOWKIND_NONE             = 0;
const BOSS_FLOWKIND_FIRSTCHECK       = 1;	// 初期チェック
const BOSS_FLOWKIND_NPC_CHECK        = 2;	// NPCチェックフロー
const BOSS_FLOWKIND_NPC_REGIST       = 3;	// NPC登録フロー
const BOSS_FLOWKIND_FGONLYT          = 4;	// 即時実行前チェック
const BOSS_FLOWKIND_ENTER_MENU_CHECK = 5;	// メニュー前チェック(フィールドニュータイトルメニュー)
const BOSS_FLOWKIND_CHECK_ONLY       = 6;	// チェックオンリー(フィールドニュータイトルメニュー)
const BOSS_FLOWEXT_MESSAGE           = 1;	// メッセージ表示        パラメータ：メッセージ種別
const BOSS_FLOWEXT_SELECT            = 2;	// 選択肢表示            パラメータ：メッセージ種別
const BOSS_FLOWEXT_ASSERT            = 3;	// アプリの強制停止      パラメータ：メッセージ種別
const BOSS_FLOWEXT_READY_APPLET      = 4;	// アプレット準備/後始末 パラメータ：true/false
const BOSS_FLOWEXT_CREATE_EXTSDMC    = 5;	// 拡張セーブ作成        パラメータ：true(開始) false(終了)
const BOSS_FLOWEXT_SAVE              = 6;	// セーブ
const BOSS_FLOWEXT_END               = 7;	// 正常終了              パラメータ：準備の成否

const BOSSDAT_KIND_STEALTHBOX_ITEM   = 1;	// いつの間にステルスボックス アイテム
const BOSSDAT_KIND_STEALTHBOX_MONS   = 2;	// いつの間にステルスボックス モンスター
const BOSSDAT_KIND_SKYMAPMONSTER     = 3;	// いつの間に高空
const BOSSDAT_KIND_CROSS             = 4;	// いつの間にすれ違い

ace_npc <- null;				// いつの間にNPC
wifi_runking_npc <- null;		//Wi-FiランキングNPC
wifi_battle_npc <- null;		//Wi-Fi対戦NPC
wifi_present_npc <- null;		//Wi-FiプレゼントダウンロードNPC
wifi_shop_npc <- null;			//Wi-FiショップNPC
profile_npc <- null;			//プロフィール設定NPC
meet_change_npc <- null;		//超しもふりにく引換NPC
training_battle_npc <- null;	//トレーニングバトルNPC

gate_mine <- null;				//出入口用地雷
hologram_mine <- null;			//ホログラム装置用地雷

//-------------------- 初期化 --------------------
//起動条件：フェードイン
//-------------------- 初期化 --------------------
function FadeIn()
{
	// トレーニングバトル解禁フラグ
	SetEventFlg_("BFG_FREE_BATTLE_UNLOCK", true);	// トレーニングバトル解放フラグを立てる
	SetEventFlg_("BFG_TRAVEL_INFO_SHOW_060", true); // 旅の心得の項目解放フラグ	【バーチャルコロシアム】トレーニングバトル
	
	// BOSSガイドライン
//	if (GetEventFlg_("BFG_BOSS_ENABLE") == true )
	local n000ResId = ReadNpc_("n002");			// エース
	local n001ResId = ReadNpc_("m007_00");		// スライムタワー（Wi-Fiランキング）
	local n002ResId = ReadNpc_("m111_00");		// さまようよろい（Wi-Fi対戦）
	local n003ResId = ReadNpc_("m100_02");		// レッドプリン（Wi-Fiプレゼント）
	local n004ResId = ReadNpc_("m128_02");		// ロイヤルミミック（Wi-Fiショップ）
	local n005ResId = ReadNpc_("m113_00");		// エンタシスマン（プロフィール）
	local n007ResId = ReadNpc_("m045_01");		// あらくれチャッピー（トレーニングバトル）

	ace_npc = ArrangePointNpc_(n000ResId, "ace00");
	wifi_runking_npc = ArrangePointNpc_(n001ResId, "npc00");
	wifi_battle_npc = ArrangePointNpc_(n002ResId, "npc01");
	wifi_present_npc = ArrangePointNpc_(n003ResId, "npc02");
	
	// レッドプリンは浮かせる
	local wifi_present_npc_pos = GetPos_(wifi_present_npc);
	wifi_present_npc_pos.y += 5;
	SetPosNoFit_(wifi_present_npc, wifi_present_npc_pos);
	
	wifi_shop_npc = ArrangePointNpc_(n004ResId, "npc03");
	profile_npc = ArrangePointNpc_(n005ResId, "npc04");
	training_battle_npc = ArrangePointNpc_(n007ResId, "npc06");
	
	// 会話可能角度設定
	SetSearchableAngle_(wifi_runking_npc, SEARCHABLE_ANGLE_MINIMUM);
	SetSearchableAngle_(wifi_battle_npc, SEARCHABLE_ANGLE_MINIMUM);
	SetSearchableAngle_(wifi_present_npc, SEARCHABLE_ANGLE_MINIMUM);
	SetSearchableAngle_(wifi_shop_npc, SEARCHABLE_ANGLE_MINIMUM);
	
	//NPCスケール設定	
	SetScaleSilhouette(wifi_runking_npc, SCALE.WIFIRANKING, SILHOUETTE_WIDTH.S);
	SetScaleSilhouette(wifi_battle_npc, SCALE.WIFIBATTLE, SILHOUETTE_WIDTH.N);
	SetScaleSilhouette(wifi_present_npc, SCALE.WIFIPRESENT, SILHOUETTE_WIDTH.S);
	SetScaleSilhouette(wifi_shop_npc, SCALE.WIFISHOP, SILHOUETTE_WIDTH.N);
	SetScaleSilhouette(profile_npc, SCALE.WIFIPROFILE, SILHOUETTE_WIDTH.N);
	SetScaleSilhouette(training_battle_npc, SCALE.N, SILHOUETTE_WIDTH.N);

	// リアクターメッセージ
	SetReactorMsg_(ace_npc, "REC_NPC_ace");
	SetReactorMsg_(wifi_runking_npc, "REC_NPC_wifi_runking");
	SetReactorMsg_(wifi_battle_npc, "REC_NPC_wifi_battle");
	SetReactorMsg_(wifi_present_npc, "REC_NPC_wifi_present");
	SetReactorMsg_(wifi_shop_npc, "REC_NPC_wifi_shop");
	SetReactorMsg_(profile_npc, "REC_NPC_profile");
	SetReactorMsg_(training_battle_npc, "REC_NPC_training");
	
	// 会話カメラ設定
	SetTalkCameraType_(ace_npc, TALK_CAMERA_UP);
	SetTalkCameraType_(wifi_runking_npc, TALK_CAMERA_UP);
	SetTalkCameraType_(wifi_battle_npc, TALK_CAMERA_UP);
	SetTalkCameraType_(wifi_present_npc, TALK_CAMERA_UP);
	SetTalkCameraType_(wifi_shop_npc, TALK_CAMERA_UP);
	SetTalkCameraType_(profile_npc, TALK_CAMERA_UP);
	SetTalkCameraType_(training_battle_npc, TALK_CAMERA_UP);
	
	// 超しもふりにく交換所は表シナリオクリア後に配置
	local main_num  = GetNumFlg_("NUM_SCENARIO_MAIN");
	if(main_num >= GetFlagID_("CONST_SM_INSIDE_CLEAR")){	// NUM000 = 9 以上
		local n006ResId = ReadNpc_("m002_02");				// ゴールドエンゼル（超しもふりにく引換）
		meet_change_npc = ArrangePointNpc_(n006ResId, "npc05");
		SetScaleSilhouette(meet_change_npc, SCALE.S, SILHOUETTE_WIDTH.S);
		SetReactorMsg_(meet_change_npc, "REC_NPC_meet");	
		SetTalkCameraType_(meet_change_npc, TALK_CAMERA_UP);
		
		SetEventFlg_("BFG_MAP_ICON_056", true);		// Bit1856 : ！アイコン  しもふり肉引き換え券
	}
	
	if (GetEventFlg_("BFG_BOSS_ENABLE") == true )
	{
		if (BossLoadNewStealthBoxData_())
		{
			BossArrangeStealthBox_("stealthbox00");
		}
	}
	
	gate_mine = SetPointCircleEventMine_("mine00", true);
	
	// ホログラム調べる地雷
	hologram_mine = SetPointCircleEventMine_("hologram_mine", true);
	
	// ワープ装置用エフェクト
	LoadEffect_("ef510_16_wireless_warp");

	EventEnd_();
}

//-------------------- 初期化 --------------------
//起動条件：マップチェンジしてきた時
//-------------------- 初期化 --------------------
function EventStartOperate()
{
	
	// ガイドラインチェックが終わってから、各メニュー戻りメッセージを表示する
	// WIFIバトルから戻ってきた時のメッセージ
	if(GetEventFlg_("BFG_WIFI_BATTLE_RETURN_MESSAGE")){
		EventStartOperateTalkAction(wifi_battle_npc)
		TalkWiFiBattleMenuClose();
		SetEventFlg_("BFG_WIFI_BATTLE_RETURN_MESSAGE", false);
	}
	// フリーバトルから戻ってきた時のメッセージ
	else if(GetEventFlg_("BFG_WIFI_FREE_BATTLE_RTN_MSG")){
		EventStartOperateTalkAction(training_battle_npc)
		TalkWiFiFreeBattleMenuClose();
		SetEventFlg_("BFG_WIFI_FREE_BATTLE_RTN_MSG", false);
	}
	// プロフィール設定から戻ってきた時のメッセージ
	else if(GetEventFlg_("BFG_WIFI_PROFILE_RTN_MSG")){
		EventStartOperateTalkAction(profile_npc)
		TalkWiFiProfileMenuClose();
		SetEventFlg_("BFG_WIFI_PROFILE_RTN_MSG", false);
	}
	// Wi-Fiランキングメニューから抜けた時のメッセージを表示<2次DB #3067>
	else if(GetEventFlg_("BFG_WIFI_RANKING_RETURN_MSG")){
		EventStartOperateTalkAction(wifi_runking_npc)
		TalkWiFiRankingMenuReturnMsg();
		SetEventFlg_("BFG_WIFI_RANKING_RETURN_MSG", false); // 「BFG_WIFI_RANKING_RETURN_MSG」はプログラム側でtrueにしてスクリプト側でfalseにしています。
	}
	// 通常のマップチェンジ（BOSSガイドラインチェック）
	else if (GetEventFlg_("BFG_BOSS_ENABLE") == true )
	{
		// 画面を隠す
		SetNavimapVisible_(false);
		SetFade_(FADE_OUT, FADE_COLOR_BLACK, 1);
		
		// チェックして駄目なら回復
		local index = BossTaskGuideFlowMenu_(BOSS_FLOWKIND_CHECK_ONLY);
		WaitTask( index );
		if (!BossTaskGuideFlowMenuResult_())
		{
			local index = BossTaskGuideFlowMenu_(BOSS_FLOWKIND_ENTER_MENU_CHECK);
			WaitTask( index );
		}
		
		// フェードで復帰
		SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);
		SetNavimapVisible_(true);
	}
	
	EventEnd_();
}

//-------------------- NPC --------------------
//起動条件：NPCに向かってAボタンが押された時
//-------------------- NPC --------------------
function TouchNpc()
{
	local target = GetTargetId_();
	local bit = false;
	local bit_boss_able;
	
	if (target == ace_npc)
	{
		if (GetEventFlg_("BFG_BOSS_ENABLE") == true )
		{
			bit_boss_able = BossNPCGuideLineFlow( BOSS_FLOWKIND_NPC_REGIST );
			if (bit_boss_able)
			{
				// いつの間にか起動中
				OpenMsgWnd_();
					SetTalkName_( "NAME_TAG_ACE" );
					ShowMsg_( "npc_boss_mes_02" );
					KeyInputWait_();
				CloseMsgWnd_();
				// ボス停止フロー
				BossNPCUnRegistFlow();
			}
		}else{
			// Boss 説明
			OpenMsgWnd_();
				SetTalkName_( "NAME_TAG_ACE" );
				ShowMsg_( "npc_boss_mes_01" );
				KeyInputWait_();
			CloseMsgWnd_();
			// 確認
			OpenMsgWnd_();
				SetTalkName_( "NAME_TAG_ACE" );
				ShowMsg_( "npc_boss_mes_01_ask" );
				KeyInputWait_();
			CloseMsgWnd_();
			if (GetQueryResult_() == MES_QUERY_YES)
			{
				bit_boss_able = BossNPCGuideLineFlow( BOSS_FLOWKIND_NPC_REGIST );
				if (bit_boss_able)
				{
					SetEventFlg_("BFG_BOSS_ENABLE", true);
					// タスク登録
					BossRegistTasks_();
					// セーブ
					local index = Task_Save_();
					WaitTask( index );
					
					// 
					OpenMsgWnd_();
						SetTalkName_( "NAME_TAG_ACE" );
						ShowMsg_( "npc_boss_mes_01_yes" );
						KeyInputWait_();
					CloseMsgWnd_();
				}
			}else{
				OpenMsgWnd_();
				SetTalkName_( "NAME_TAG_ACE" );
				ShowMsg_( "npc_boss_mes_01_no" );
				KeyInputWait_();
				CloseMsgWnd_();
				
				// タスク消しておく
				BossUnRegistTasks_();
			}
		}
	}

	//Wi-FiランキングNPC
	if (target == wifi_runking_npc)
	{
		TalkWiFiRanking();
	}
	
	// Wi-Fi対戦NPC
	if (target == wifi_battle_npc)
	{
		TalkWiFiBattle();
	}
	
	// Wi-FiプレゼントNPC
	if (target == wifi_present_npc)
	{
		TalkWiFiPresent();
	}
	
	// Wi-FiショップNPC
	if (target == wifi_shop_npc)
	{
		TalkWiFiShop();
	}
	
	// プロフィールNPC
	if (target == profile_npc)
	{
		TalkProfileSetting();
	}
	
	// 超しもふりにく交換所NPC
	if (target == meet_change_npc)
	{
		TalkMeetChange();
	}
	
	// トレーニングバトルNPC
	if (target == training_battle_npc)
	{
		TalkTrainingBattle();
	}
	
	
	EventEnd_();
}

//-------------------- 地雷 --------------------
//起動条件：地雷に触れた or 地雷の上でAボタンが押された時
//-------------------- 地雷 --------------------
function TouchEventMine()
{
	local target = GetTouchEventMineId_();
	
	if(target == gate_mine){
		// どこに戻るかの選択
		OpenMsgWnd_();
			ShowMsg_( "sys_gate_mes_00" );
			KeyInputWait_();
		CloseMsgWnd_();
		
		switch (GetQueryResult_()){
			case QUERY3_0:	// フィールド
				CommonGateWarp();
				ChangeNetworkLobbyToField_();
				break;
			case QUERY3_1:	// タイトル
				CommonGateWarp();
				ChangeNetworkLobbyToTitle_();
				break;
			case QUERY3_2:	// やめる
				break;
		}
	}
	else if(target == hologram_mine){	// ホログラム地雷を調べるとオンライン状態メッセージ表示
		// 指定した座標の方を向く
		local pos = Vec3(0.0, 0.0, -255.0);
		uPlayerTurnAroundPos(pos);
		// メッセージ表示
		OpenMsgWnd_();
			if(CheckNetworkLogin_()){	// オンラインなら
				ShowMsg_( "hologram_01" );
			} else {	// オフラインなら
				ShowMsg_( "hologram_00" );
			}
			KeyInputWait_();
		CloseMsgWnd_();
	}
	EventEnd_();
}


//-------------------- NPC --------------------
// BOSS停止フロー
//-------------------- NPC --------------------
function BossNPCUnRegistFlow()
{
	print("BossNPCUnRegistFlow\n");
	// いつの間に不可時フロー
	OpenMsgWnd_();
		SetTalkName_( "NAME_TAG_ACE" );
		ShowMsg_( "npc_boss_mes_02_ask" );
		KeyInputWait_();
	CloseMsgWnd_();
	if (GetQueryResult_() == MES_QUERY_YES)
	{
		SetEventFlg_("BFG_BOSS_ENABLE", false);
		// タスク登録
		BossUnRegistTasks_();
		// セーブ
		local index = Task_Save_();
		WaitTask( index );
		
		// 
		OpenMsgWnd_();
			SetTalkName_( "NAME_TAG_ACE" );
			ShowMsg_( "npc_boss_mes_02_yes" );
			KeyInputWait_();
		CloseMsgWnd_();
	}else{
		OpenMsgWnd_();
		SetTalkName_( "NAME_TAG_ACE" );
		ShowMsg_( "npc_boss_mes_02_no" );
		KeyInputWait_();
		CloseMsgWnd_();
	}
}

//-------------------- NPC --------------------
// Bossのガイドラインフロー
//-------------------- NPC --------------------
function BossNPCGuideLineFlow( check_kind )
{
	local bit_boss_able = false;
	local loop = true;
	local closeWin = false;
	local closeDialog = false;
	while(loop)
	{
		BossNPCRegistFlow_( check_kind );
		local flow_kind  = BossNPCRegistFlowGetKind_();
		local flow_param = BossNPCRegistFlowGetParam_();
		if (closeWin)
		{
			CloseMsgWnd_();
			closeWin = false;
		}
		if (closeDialog)
		{
			CloseDialog_();
			closeDialog = false;
		}
		
		switch(flow_kind)
		{
			case BOSS_FLOWEXT_MESSAGE:
				print("BOSS_FLOWEXT_MESSAGE\n");
				OpenMsgWnd_();
				SetTalkName_( "NAME_TAG_ACE" );
				ShowMsg_( "npc_boss_flow_" + flow_param );
				KeyInputWait_();
				CloseMsgWnd_();
				BossNPCRegistFlowResponse_( -1 )
				break;
			case BOSS_FLOWEXT_SELECT:
				print("BOSS_FLOWEXT_SELECT\n");
				OpenMsgWnd_();
				SetTalkName_( "NAME_TAG_ACE" );
				ShowMsg_( "npc_boss_flow_" + flow_param );
				KeyInputWait_();
				CloseMsgWnd_();
				if (GetQueryResult_() == MES_QUERY_YES)
				{
					// はい
					BossNPCRegistFlowResponse_( 1 )
				}else{
					// いいえ
					BossNPCRegistFlowResponse_( 0 )
				}
				break;
			case BOSS_FLOWEXT_READY_APPLET:
				BossNPCRegistFlowResponse_( -1 )
				break;
			case BOSS_FLOWEXT_CREATE_EXTSDMC:
				print("BOSS_FLOWEXT_SELECT ACE\n");
				// セーブ準備
				OpenDialog_( "npc_boss_flow_13", false, true );
				BossNPCRegistFlowResponse_( -1 )
				closeDialog = true;
				break;
			case BOSS_FLOWEXT_SAVE:
				print("BOSS_FLOWEXT_SAVE ACE\n");
				// セーブ
				{
					local index = Task_Save_();
					WaitTask( index );
				}
				BossNPCRegistFlowResponse_( -1 );
				break;
			case BOSS_FLOWEXT_END:
				print("BOSS_FLOWEXT_END\n");
				loop = false;
				bit_boss_able = flow_param;
				BossNPCRegistFlowResponse_( -1 );
				break;
		}
		
	}
	print("bit_boss_able " + bit_boss_able + "\n");
	return bit_boss_able;
}


//-------------------- NPC --------------------
//起動条件：ステルスボックスをOpenしたとき
//-------------------- NPC --------------------
function OpenTreasureBox()
{
	// 強制的に会話状態を設定
	SetTalkCameraType_(ace_npc, TALK_CAMERA_UP);
	SetTalkAction_(ace_npc);
	
	OpenMsgWnd_();
		SetTalkName_( "NAME_TAG_ACE" );
		ShowMsg_( "npc_boss_mes_getbox" );
		KeyInputWait_();
	CloseMsgWnd_();
	// BOSSデータに既読フラグを立てておく
	BossSetReadFlagToStealthBox_();
	// セーブ
	local index = Task_Save_();
	WaitTask( index );
	
	
	EventEnd_();
}

//------------- L00_00 用関数-----------------
// 転送装置で転送される時の共通処理
//------------- L00_00 用関数-----------------
function CommonGateWarp()
{
	// 「！」が出ないように先に地雷を消しておく
	DeleteEventMine_(gate_mine);
	gate_mine = null;

	// 地雷の中心に向かって歩いていく
	local playerId = GetPlayerId_();
	SetMotion_(playerId, MOT_WALK, BLEND_M);
	local moveTask = Task_MoveToPointSetSpeed_(playerId, "mine00", FORWARD_MOVE_SPEED);
	WaitTask(moveTask);
	SetMotion_(playerId, MOT_WAIT, BLEND_M);

	// ワープエフェクト
	// エフェクトがワープ装置にうまってしまうので、y座標を少し上げる
	SetPosWorldEffect_("ef510_16_wireless_warp", Vec3(0, 15.523, -102.343));
	PlaySE_("SE_FLD_066");
	Wait_(30);

	// 画面を白フェード
	SetFade_(FADE_OUT, FADE_COLOR_WHITE, 10);
	WaitFade_();
}

//------------- L00_00 用関数-----------------
// Wi-Fiランキング用会話フロー
//------------- L00_00 用関数-----------------
function TalkWiFiRanking()
{
	SetEventFlg_("BFG_MAP_ICON_052", true);		// Bit1852 : NEWアイコン Wi-Fiランキング
	
	OpenMsgWnd_();	// メッセージを閉じるタイミングはメニュー前かメッセージ終わった後

	ShowMsg_( "wifi_ranking_00" );		// 「ここは　Wi-Fiランキングの
	KeyInputWait_();

	if(CheckPlayerNameNgWord_()){	// 禁止用語があった場合
		ShowMsg_( "wifi_ranking_03" );	// 「あれれ？　プレイヤーの名前か　Miiの名前に
		KeyInputWait_();
		ShowMsg_( "wifi_ranking_04" );	// 「プロフィール設定で　名前を変えてから
		KeyInputWait_();
		CloseMsgWnd_();	// ▲ここでウィンドウ閉じる
	} else {
		// 禁止用語が無かった場合
		if(!GetEventFlg_("BFG_WIFI_RANKING_1ST_MESSAGE")){	// 初回メッセージが必要か
			ShowMsg_( "wifi_ranking_05" );	// 「Wi-Fiランキングに参加する際には……
			KeyInputWait_();
			ShowMsg_( "wifi_ranking_06" );	// 「プレイヤーやモンスター　Miiなどの情報を
			KeyInputWait_();
			ShowMsg_( "wifi_ranking_07" );	// 「インターネット通信を使い　情報を
			KeyInputWait_();
			
			if (GetQueryResult_() == MES_QUERY_YES){
				// 「はい」選択
				SetEventFlg_("BFG_WIFI_RANKING_1ST_MESSAGE", true);	// 初回メッセージを聞いたフラグをtrueに
				ShowMsg_( "wifi_ranking_08" );	// 「ありがとう～。　それじゃ　改めて……
				KeyInputWait_();
				CloseMsgWnd_();		// ▲ここでウィンドウ閉じる
				GotoMenuFadeOpen(MENU_OPEN.WIFI_RANKING);	// メニューを開く
				// メニューから戻った際のメッセージ
				TalkWiFiRankingMenuClose();
				// メニュー最初の画面から戻った際は終了メッセージが出るので、フラグを下す
			} else {
				// 「いいえ」選択
				ShowMsg_( "wifi_ranking_09" );	// 「それは残念～。
				KeyInputWait_();
				CloseMsgWnd_();	// ▲ここでウィンドウ閉じる
			}
			
		} else {
			// 初回メッセージが不要な時
			ShowMsg_( "wifi_ranking_01" );	// 「今日は　どんなご用ですか～？
			KeyInputWait_();
			CloseMsgWnd_();	// ▲ここでウィンドウ閉じる
			GotoMenuFadeOpen(MENU_OPEN.WIFI_RANKING);	// メニューを開く
			// メニューから戻った際のメッセージ
			TalkWiFiRankingMenuClose();
		}
	}
}


//------------- L00_00 用関数-----------------
// Wi-Fiランキング用終了メッセージ
//------------- L00_00 用関数-----------------
function TalkWiFiRankingMenuClose()
{
	// メニューから戻った際のメッセージ
	OpenMsgWnd_();
	ShowMsg_( "wifi_ranking_02" );	// 「また遊びに来てね～
//	ShowMsg_( "wifi_ranking_10" );	// 「じゃあ　またね！
	KeyInputWait_();
	CloseMsgWnd_();	// ▲ここでウィンドウ閉じる
}


//------------- L00_00 用関数----------------------
// Wi-Fiランキングメニューから抜けた時のメッセージ 
//------------- L00_00 用関数----------------------
function TalkWiFiRankingMenuReturnMsg()
{
	// メニューから戻った際のメッセージ
	OpenMsgWnd_();
	ShowMsg_( "wifi_ranking_10" );	// 「じゃあ　またね！
	KeyInputWait_();
	CloseMsgWnd_();	// ▲ここでウィンドウ閉じる
}


//------------- L00_00 用関数-----------------
// Wi-Fiバトル用会話フロー
//------------- L00_00 用関数-----------------
function TalkWiFiBattle()
{
	SetEventFlg_("BFG_MAP_ICON_053", true);		// Bit1853 : NEWアイコン Wi-Fi対戦
	
	OpenMsgWnd_();	// メッセージを閉じるタイミングはメニュー前かメッセージ終わった後

	ShowMsg_( "wifi_battle_00" );		// 「ここは　Wi-Fi対戦の
	KeyInputWait_();

	if(CheckPlayerNameNgWord_()){	// 禁止用語があった場合
		ShowMsg_( "wifi_battle_03" );	// 「ん？　プレイヤーの名前か　Miiの名前に
		KeyInputWait_();
		ShowMsg_( "wifi_battle_04" );	// 「プロフィール設定で　名前を変えてから
		KeyInputWait_();
		CloseMsgWnd_();	// ▲ここでウィンドウ閉じる
	} else {
		// 禁止用語が無かった場合
		if(!GetEventFlg_("BFG_WIFI_BATTLE_1ST_MESSAGE")){	// 初回メッセージが必要か
			ShowMsg_( "wifi_battle_05" );	// 「Wi-Fiランキングに参加する際には……
			KeyInputWait_();
			ShowMsg_( "wifi_battle_06" );	// 「プレイヤーやモンスター　Miiなどの情報を
			KeyInputWait_();
			ShowMsg_( "wifi_battle_07" );	// 「インターネット通信を使い　情報を
			KeyInputWait_();
			
			if (GetQueryResult_() == MES_QUERY_YES){
				// 「はい」選択
				SetEventFlg_("BFG_WIFI_BATTLE_1ST_MESSAGE", true);	// 初回メッセージを聞いたフラグをtrueに
				ShowMsg_( "wifi_battle_08" );	// 「改めて……ここは　Wi-Fi対戦の
				KeyInputWait_();
				if (GetQueryResult_() == MES_QUERY_YES){
					CloseMsgWnd_();	// ▲ここでウィンドウ閉じる
					GotoMenuSceneFadeOut();
					GotoMenuScene_(MENU_SCENE.WIFI_BATTLE);
				} else {
					ShowMsg_( "wifi_battle_02" );	// 「またの　ご利用を　お待ちしていますぞ！
					KeyInputWait_();
					CloseMsgWnd_();	// ▲ここでウィンドウ閉じる
				}
				
			} else {
				// 「いいえ」選択
				ShowMsg_( "wifi_battle_09" );	// 「むむむ……それは　残念ですぞ。
				KeyInputWait_();
				CloseMsgWnd_();	// ▲ここでウィンドウ閉じる
			}
			
		} else {
			// 初回メッセージが不要な時
			ShowMsg_( "wifi_battle_01" );	// 「Wi-Fi対戦に　参加されますか？
			KeyInputWait_();
			if (GetQueryResult_() == MES_QUERY_YES){
				CloseMsgWnd_();	// ▲ここでウィンドウ閉じる
				GotoMenuSceneFadeOut();
				GotoMenuScene_(MENU_SCENE.WIFI_BATTLE);
			} else {
				ShowMsg_( "wifi_battle_02" );	// 「またご利用くださいまし！
				KeyInputWait_();
				CloseMsgWnd_();	// ▲ここでウィンドウ閉じる
			}
		}
	}
}

//------------- L00_00 用関数-----------------
// Wi-Fiバトル用終了メッセージ
//------------- L00_00 用関数-----------------
function TalkWiFiBattleMenuClose()
{
	// メニューから戻った際のメッセージ
	OpenMsgWnd_();
	ShowMsg_( "wifi_battle_10" );	// 「またの　ご利用を　お待ちしていますぞ。
	KeyInputWait_();
	CloseMsgWnd_();	// ▲ここでウィンドウ閉じる
}


//------------- L00_00 用関数-----------------
// Wi-Fiプレゼント用会話フロー
//------------- L00_00 用関数-----------------
function TalkWiFiPresent()
{
	SetEventFlg_("BFG_MAP_ICON_054", true);		// Bit1854 :プレゼントダウンロード
	
	OpenMsgWnd_();	// メッセージを閉じるタイミングはメニュー前かメッセージ終わった後
	
	ShowMsg_( "wifi_present_00" );		// 「プレゼントデータの　ダウンロードは
	KeyInputWait_();
	ShowMsg_( "wifi_present_01" );		// 「ダウンロードの準備は　
	KeyInputWait_();
	if (GetQueryResult_() == MES_QUERY_YES)
	{
		CloseMsgWnd_();	// ▲ここでウィンドウ閉じる
		// はい を選んだ時
		GotoMenuFadeOpen(MENU_OPEN.WIFI_DATA_DL);
		
		OpenMsgWnd_();	// メニューを抜けた時のメッセージ
		ShowMsg_( "wifi_present_03" );		// 「また来いよな！　待ってるぜ！
		KeyInputWait_();
		CloseMsgWnd_();	// ▲ここでウィンドウ閉じる
	} else {
		// いいえ を選んだ時
		ShowMsg_( "wifi_present_02" );	// 「いつでも　待ってっからな～！
		KeyInputWait_();
		CloseMsgWnd_();	// ▲ここでウィンドウ閉じる
	}
}

//------------- L00_00 用関数-----------------
// Wi-Fiショップ用会話フロー
//------------- L00_00 用関数-----------------
function TalkWiFiShop()
{
	SetEventFlg_("BFG_MAP_ICON_055", true);		// Bit1855 :通信コイン交換所
	
	OpenMsgWnd_();
	ShowMsg_( "wifi_shop_00" );		// 「ここは　通信コイン交換所だべ。
	KeyInputWait_();
	CloseMsgWnd_();
	
	GotoMenuFadeOpen(MENU_OPEN.WIFI_SHOP);
	
	// フローから抜けた時のメッセージ
	OpenMsgWnd_();
	ShowMsg_( "wifi_shop_01" );		// 「おめえが　また来るのを　待ってるべ！
	KeyInputWait_();
	CloseMsgWnd_();
	
	
}

//------------- L00_00 用関数-----------------
// プロフィール設定用会話フロー
//------------- L00_00 用関数-----------------
function TalkProfileSetting()
{
	OpenMsgWnd_();	// メッセージを閉じるタイミングはメニュー前かメッセージ終わった後
	
	ShowMsg_( "profile_00" );		// 「ようこそ　みんなの通信ロビーへ！
	KeyInputWait_();
	
	ShowMsg_( "profile_01" );		// 「あなたのプロフィール
	KeyInputWait_();
	if (GetQueryResult_() == MES_QUERY_YES)
	{
		CloseMsgWnd_();	// ▲ここでウィンドウ閉じる
		GotoMenuSceneFadeOut();
		// はい を選んだ時
		GotoMenuScene_(MENU_SCENE.PROFILE_SETTING);
	} else {
		// いいえ を選んだ時
		ShowMsg_( "profile_02" );	// 「またいらっしゃい！
		KeyInputWait_();
		CloseMsgWnd_();	// ▲ここでウィンドウ閉じる
	}
}

//------------- L00_00 用関数-----------------
// Wi-Fiプロフィール用終了メッセージ
//------------- L00_00 用関数-----------------
function TalkWiFiProfileMenuClose()
{
	// メニューから戻った際のメッセージ
	OpenMsgWnd_();
	ShowMsg_( "profile_03" );	// 「それじゃ　まったね～ん！
	KeyInputWait_();
	CloseMsgWnd_();	// ▲ここでウィンドウ閉じる
}


//------------- L00_00 用関数-----------------
// 超しもふりにく交換所用会話フロー
//------------- L00_00 用関数-----------------
function TalkMeetChange()
{
	OpenMsgWnd_();			// ▼ここでウィンドウを開く
	
	ShowMsg_( "meet_change_00" );				//「おほほほ！　よく来たわね！
	KeyInputWait_();
	ShowMsg_( "meet_change_01" );				//「ここは　超しもふりにく引換券　１枚と
	KeyInputWait_();
	ShowMsg_( "meet_change_02" );				//「超しもふりにく引換券と　超しもふりにくを
	KeyInputWait_();
	if (GetQueryResult_() == MES_QUERY_YES){
		// はい を選んだ時
		local meet_ticket = GetItemNum_(67);	// 超しもふりにく引換券
		if(meet_ticket >= 1){
			// 超しもふりにく引換券を持っていたら
			ShowMsg_( "meet_change_04" );		//「では　こちらをどうぞサマス！
			KeyInputWait_();
			CloseMsgWnd_();	// ▲ここでウィンドウ閉じる
			
			AddItem_(48, meet_ticket);			// 超しもふりにくを引換券の数だけ手持ちに追加
			AddItem_(67, -meet_ticket);			// 超しもふりにく引換券を全て無くす
			
			OpenMsgWnd_();	// ▼ここでウィンドウを開く
			ShowMsg_( "meet_change_05" );		//「○主人公の名前○は　超しもふりにく引換券を
			PlayMe_("ME_010"); 					// 重要アイテム入手ME
			WaitMe_();
			KeyInputWait_();
			CloseMsgWnd_();	// ▲ここでウィンドウ閉じる
			
			OpenMsgWnd_();	// ▼ここでウィンドウを開く
			ShowMsg_( "meet_change_08" );		//「どんな魔物も一発で　メロメロになってしまう
			KeyInputWait_();
			CloseMsgWnd_();	// ▲ここでウィンドウ閉じる
		}else{
			// 超しもふりにく引換券を持っていなかったら
			ShowMsg_( "meet_change_06" );		//「あらあら？　どうやら　超しもふりにく引換券を
			KeyInputWait_();
			ShowMsg_( "meet_change_07" );		//「超しもふりにく引換券を　手に入れたら
			KeyInputWait_();
			CloseMsgWnd_();	// ▲ここでウィンドウ閉じる
		}
	} else {
		// いいえ を選んだ時
		ShowMsg_( "meet_change_03" );			//「まあ　それは残念ザマス。
		KeyInputWait_();
		CloseMsgWnd_();	// ▲ここでウィンドウ閉じる
	}
}

//------------- L00_00 用関数-----------------
// トレーニングバトル用会話フロー
//------------- L00_00 用関数-----------------
function TalkTrainingBattle()
{
	// フラグ取得
	local mes_flg = GetEventFlg_("BFG_FREE_BATTLE_FIRST_MESSAGE");	// トレーニングバトルのNPCに初回だけ説明メッセージを表示させるフラグ
	
	OpenMsgWnd_();	// メッセージを閉じるタイミングはメニュー前かメッセージ終わった後
	
	ShowMsg_( "training_00" );			// 「おっす！　ここは　トレーニングバトルの
	KeyInputWait_();
	
	// 初回だけ表示するメッセージ
	if(mes_flg == false){
		SetEventFlg_("BFG_FREE_BATTLE_FIRST_MESSAGE", true);
		ShowMsg_( "training_03" );		// 「トレーニングバトルは　あんたの預かり所にいる
		KeyInputWait_();
		ShowMsg_( "training_04" );		// 「組んだパーティ同士で
		KeyInputWait_();
		ShowMsg_( "training_05" );		// 「どんな　パーティが強いのか……
		KeyInputWait_();
		ShowMsg_( "training_06" );		// 「どうだい？　早速
		KeyInputWait_();
	}
	// 2回目以降に表示するメッセージ
	else{
		ShowMsg_( "training_01" );		// 「どうだい　あんた？
		KeyInputWait_();
	}
	if (GetQueryResult_() == MES_QUERY_YES)
	{
		CloseMsgWnd_();	// ▲ここでウィンドウ閉じる
		GotoMenuSceneFadeOut();
		// はい を選んだ時
		GotoMenuScene_(MENU_SCENE.FREE_BATTLE);
	} else {
		// いいえ を選んだ時
		ShowMsg_( "training_02" );		// 「また来いよ　<name_player/>！
		KeyInputWait_();
		CloseMsgWnd_();	// ▲ここでウィンドウ閉じる
	}
}
//------------- L00_00 用関数-----------------
// Wi-Fiフリーバトル用終了メッセージ
//------------- L00_00 用関数-----------------
function TalkWiFiFreeBattleMenuClose()
{
	// メニューから戻った際のメッセージ
	OpenMsgWnd_();
	ShowMsg_( "training_07" );	// 「じゃあな！　次の機会を待ってるぞ！
	KeyInputWait_();
	CloseMsgWnd_();	// ▲ここでウィンドウ閉じる
}

//------------- L00_00 用関数------------------
// 会話後にGotoMenuScene_()に行く直前の暗転処理
//------------- L00_00 用関数------------------
function GotoMenuSceneFadeOut()
{
	// 暗転までのフレーム数を設定< 調節する際は麸山さんに相談 >
	local fade_speed = 10; // 10F
	
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, fade_speed);
	SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, fade_speed);
	WaitFade_();
}


//+++++++++++++++++++++++++++++++++++++++
//	指定した座標に歩きながら振り向く処理
//---------------------------------------
// 第一引数：指定した座標(Vec3)
// 戻り値  ：なし
//+++++++++++++++++++++++++++++++++++++++
function uPlayerTurnAroundPos(pos)
{
	local player    = GetPlayerId_();
	// 対象物の方向に回転(1Fで11.4°ずつ回転)
	local rotateTask = Task_RotateToPosSetMotion_(player, Vec3(pos.x, pos.y, pos.z), ROTATE_EVENT_DEF MOT_WALK, MOT_WAIT);
	WaitTask(rotateTask);
	// 間を持たせる
	Wait_(15);
}

