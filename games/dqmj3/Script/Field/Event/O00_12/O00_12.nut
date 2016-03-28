//===================== 拠点【空の神(O00_12)】 ====================

// バトル終了時の復帰座標
const RTN_BATTLE_POS_X =        0;
const RTN_BATTLE_POS_Y =        0;
const RTN_BATTLE_POS_Z = -247.035;
const RTN_BATTLE_DIR   =        0;

//------------------------------------------------
//		戦闘終了後
//------------------------------------------------
function AfterBattle()
{
	// 進行フラグの状態を取得
	local status_num = GetNumFlg_("NUM_HOAKARI_PHASE");

	// 戦闘の判定
	if(status_num == 3 || status_num == 6){
		local player = GetPlayerId_();
		// 擬似デモで消した主人公を見えるようにする
		SetManualCalcAlpha_(player, true);
		SetAlpha_(player, 1.0);
		// 擬似デモでカメラを調整したのでデフォルトに戻しておく
		SetPlayableCamera_();
		
		// 勝ち
		if(GetBattleEndType_() == END_TYPE_WIN){
			// 処理なし
		}
		// にげる
		else if(GetBattleEndType_() == END_TYPE_FLEE){
			// 処理なし
		}
		// 負け
		else{
			// 進行フラグを再戦時へ
			SetNumFlg_("NUM_HOAKARI_PHASE", 4);
			// ルーラとフライトシグナルの禁止の解除
			SetEventFlg_("BFG_PLAYERABILITY_RULER_PROHIBIT", false);
			SetEventFlg_("BFG_FLIGHT_PROHIBIT", false);
		}
	}

	EventEnd_();
}

//------------------------------------------------
//		マップに入る前
//------------------------------------------------
function BeforeInitMap()
{
	// 進行フラグの状態を取得
	local status_num = GetNumFlg_("NUM_HOAKARI_PHASE");
	
	if(status_num == 2 || status_num == 5){ // NUM015 == 2 or 5
		//ライド強制解除
		SetRideOffStart_();
	}

	EventEnd_();
}

//------------------------------------------------
//		フェードアウト中
//------------------------------------------------
function FadeIn()
{
	// 進行フラグの状態を取得
	local status_num = GetNumFlg_("NUM_HOAKARI_PHASE");
	DebugPrint(" ");
	DebugPrint("NUM_HOAKARI_PHASE の値は " + status_num + " になりました。");
	
	//---------------
	// ▼ギミック配置
	//---------------
	// ID初期化
	
	// リソース読み込み
	
	// ■配置なし
	
	
	//----------
	// ▼NPC配置
	//----------
	// ID初期化
	g_npc_hoakari <- C_NONE_ID;
	
	// ■ホアカリ(4行目で初期化)
	if(status_num == 1 || status_num == 4){ // NUM015 == 1 or 4
		g_npc_hoakari = ReadAndArrangePointNpc("m172_00", "npc_god");
		SetTalkCameraType_(g_npc_hoakari, TALK_CAMERA_UP);
		SetReactorMsg_(g_npc_hoakari, "NPC_HOAKARI_REC");
		SetScaleSilhouette(g_npc_hoakari, SCALE.T, SILHOUETTE_WIDTH.T);
		SetVisible(g_npc_hoakari, true);
	}
	// ■擬似デモ用の設置
	else if(status_num == 2 || status_num == 5){
		g_npc_hoakari = ReadAndArrangePointNpc("m172_00", "npc_god");
		SetTalkCameraType_(g_npc_hoakari, TALK_CAMERA_UP);
		SetReactorMsg_(g_npc_hoakari, "NPC_YATIHOKO_REC");
		SetScaleSilhouette(g_npc_hoakari, SCALE.T, SILHOUETTE_WIDTH.T);
		SetVisible(g_npc_hoakari, true);
	}
	
	
	//-----------------
	// ▼エフェクト配置
	//-----------------
	// ■時空の裂け目
	LoadEffect_("ef300_25_wormhole");
	// 擬似デモの時カメラにエフェクトが映るので表示しない
	if(status_num == 2 || status_num == 5){
		// 擬似デモ中はうつさない
	}
	else{
		local wormhole_01 = SetPointWorldEffect_("ef300_25_wormhole", "ef_wormhole_01");
	}
	
	
	//-----------
	// ▼地雷配置
	//-----------
	// 初期化
	g_mine_01			 <- C_NONE_ID;
	g_mine_02			 <- C_NONE_ID;
	g_mine_wormhole_01	 <- C_NONE_ID;
	
	// ■ホアカリ用地雷(5行目で初期化)
	if(status_num == 1 || status_num == 4){ // NUM015 == 1 or 4
		g_mine_01 =  SetPointBoxEventMine_("mine_01_box", false);
		g_mine_02 =  SetPointBoxEventMine_("mine_01_box_2", false);
	}
	// ■時空の裂け目
	g_mine_wormhole_01 = SetPointCircleEventMine_("mine_wormhole_01", true);
	
	
	//-------------------------
	// ▼リアクターポイント配置
	//-------------------------
	// ■配置なし
	
	
	//-----------------
	// ▼マップナビ配置
	//-----------------
	// ■時空の裂け目
	local navi_wormhole = ArrangePointNaviMapIcon_(NAVIMAP_ICON.CREVICE, "mine_wormhole_01");
	
	
	EventEnd_();
}

//------------------------------------------------
//		フィールド操作開始
//------------------------------------------------
function EventStartOperate()
{
	// 進行フラグの状態を取得
	local status_num = GetNumFlg_("NUM_HOAKARI_PHASE");
	
	//-----------
	// デモの再生
	//-----------
	// 擬似デモ再生
	if(status_num == 2 || status_num == 5){
		uPlayableDemoHoakari();
	}
	// 再戦時
	else if(status_num == 4){
		// 処理なし
	}
	// 勝敗判定
	else if(status_num == 3 || status_num == 6){
		// 勝利
		if(GetBattleEndType_() == END_TYPE_WIN){
			// フラグ
			SetNumFlg_("NUM_HOAKARI_PHASE", 7);
			SetEventFlg_("BFG_GET_SKY_STAR_PIECE", true); // 空のスターピース取得フラグ
			SetEventFlg_("BFG_KNOCK_DOWN_HOAKARI", true); // ホアカリ撃破取得フラグ
			// 復帰位置
			SetReturnDemoPosDir_(Vec3(RTN_BATTLE_POS_X, RTN_BATTLE_POS_Y, RTN_BATTLE_POS_Z), RTN_BATTLE_DIR);
			// アイテム取得(Redmine#2349)
			AddItem_(SKY_STAR_PIECE_ID, 1);
			// Demo818[空のスターピース入手]再生
			EventStartChangeDemo(818, FADE_COLOR_BLACK);
		}
		else{
			// 敗北はアフターバトルで処理
		}
	}

	EventEnd_();
}

//------------------------------------------------
//		ＮＰＣ接触時
//------------------------------------------------
function TouchNpc()
{
	/*
		処理なし
	*/
	
	EventEnd_();
}

//------------------------------------------------
//		地雷接触時
//------------------------------------------------
function TouchEventMine()
{
	// 触れた地雷の取得
	local target = GetTouchEventMineId_();

	// 主人公の情報
	local player = GetPlayerId_();

	switch(target)
	{
	case g_mine_01:
	case g_mine_02:
		uMine01();
		break;
	case g_mine_wormhole_01:
		uChangeMap();
		break;
	default:
		DebugPrint("設置していない地雷に触れています。");
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

//======================================================
//  ローカル関数 : ホアカリ用地雷の処理
//------------------------------------------------------
// 第一引数：なし
// 戻り値  ：なし
//======================================================
function uMine01()
{
	// 進行フラグの状態を取得
	local status_num = GetNumFlg_("NUM_HOAKARI_PHASE");
	
	// 地雷を削除
	DeleteEventMine_(g_mine_01);
	DeleteEventMine_(g_mine_02);
	
	if(status_num == 1){
		// シナリオ進行フラグを進める
		SetNumFlg_("NUM_HOAKARI_PHASE", 2);
	}
	else if(status_num == 4){
		// シナリオ進行フラグを進める
		SetNumFlg_("NUM_HOAKARI_PHASE", 5);
	}
	// ライド解除の為、マップチェンジ
	ChangeMapPosDir_("O00_12", Vec3(26.740, -14.900, -60.276), 180);
}

//======================================================
//  ローカル関数 : 擬似デモ[空の神ホアカリ]
//------------------------------------------------------
// 第一引数：なし
// 戻り値  ：なし
//======================================================
function uPlayableDemoHoakari()
{
	// 進行フラグの状態を取得
	local status_num = GetNumFlg_("NUM_HOAKARI_PHASE");
	
	// 準備
	local cam_pos = Vec3(7.537, -14.900, -21.867);
	local cam_dir = 180;
	local wait_motion = 45;
	// 暗転
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
	SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
	WaitFade_();
	// 主人公をモンスターの真正面に配置
	local player = GetPlayerId_();
	SetPos_(player, cam_pos);
	SetDir_(player, cam_dir);
	// 主人公を消す
	SetManualCalcAlpha_(player, true);
	SetAlpha_(player, 0.0);
	SetCameraDir_(cam_dir);
	// カメラの設定
	SetPointCameraEye_("cam_eye");
	SetPointCameraTarget_("cam_target");
	// 準備が終わったので暗転解除
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
/*
	// 全滅時はその場復帰
	SetEventFlg_("BFG_DEAD_KEEP_MAP", true);
*/	
	// メッセージ表示
	// 初回or再戦で分岐
	if(status_num == 2){
		OpenMsgWnd_();
		ShowMsg_("HOAKARI_MSG_001");
		KeyInputWait_();
		SetTalkName_("NAME_TAG_HOAKARI");
		ShowMsg_("HOAKARI_MSG_002");
		KeyInputWait_();
		CloseMsgWnd_();
		// クワッ
		Wait_(15);
		// クワッ([2015/8/31]該当するモーションがないので追加されるまでコメント化)
		SetMotion_(g_npc_hoakari, MOT_SPELL_START, BLEND_N);
		Wait_(30);
		SetMotion_(g_npc_hoakari, MOT_SPELL_ACTUATE, BLEND_N);
		Wait_(45);
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_HOAKARI");
		ShowMsg_("HOAKARI_MSG_002_2");
		KeyInputWait_();
		CloseMsgWnd_();
		// シナリオ進行フラグを進める
		SetNumFlg_("NUM_HOAKARI_PHASE", 3);
	}
	else if(status_num == 5){
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_HOAKARI");
		ShowMsg_("HOAKARI_MSG_003");
		KeyInputWait_();
		CloseMsgWnd_();
		// シナリオ進行フラグを進める
		SetNumFlg_("NUM_HOAKARI_PHASE", 6);
	}
	
	// 戦闘モーション
	SetMotion_(g_npc_hoakari, MOT_ATTACK, BLEND_N);
	PlaySE_("SE_FLD_070");
	Wait_(8);
	// 戦闘開始(ブラーの指定は東藤さんに)
	ChangeBattleParty_(121);
}

//======================================================
//  ローカル関数 : 元の世界に戻る処理
//------------------------------------------------------
// 第一引数：なし
// 戻り値  ：なし
//======================================================
function uChangeMap()
{
	// 地雷を削除
	DeleteEventMine_(g_mine_wormhole_01);
	// メッセージ
	OpenMsgWnd_();
	ShowMsg_("SYSTEM_MSG_001");
	KeyInputWait_();
	if(GetQueryResult_() == QUERY_YES){
		CloseMsgWnd_();
		// ルーラとフライトシグナルの禁止の解除
		SetEventFlg_("BFG_PLAYERABILITY_RULER_PROHIBIT", false);
		SetEventFlg_("BFG_FLIGHT_PROHIBIT", false);
		// 時空の裂け目の共通処理
		CommDisplayedWormholeEffect();
		// 指定したマップに移動
		ChangeMapPosDir_("U00_00", Vec3(82.383, 63.408, -3194.422), -20);
	}
	else{
		CloseMsgWnd_();
		// 地雷を再設置
		SetPointCircleEventMine_("mine_wormhole_01", true);
	}
}

