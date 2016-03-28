//===================== I02_01氷の遺跡 下層 ====================


//------------------------------------------------
//		戦闘終了後
//------------------------------------------------
function AfterBattle()
{
	local main_num			= GetNumFlg_("NUM_SCENARIO_MAIN");			// Num0
	local ice_event_num		= GetNumFlg_("NUM_SCENARIO_SUB_ICE");		// Num5

	/*
		処理なし
	*/

	EventEnd_();
}


//------------------------------------------------
//		マップに入る前
//------------------------------------------------
function BeforeInitMap()
{
	local main_num			 = GetNumFlg_("NUM_SCENARIO_MAIN");			// Num0
	local ice_event_num		 = GetNumFlg_("NUM_SCENARIO_SUB_ICE");		// Num5
	
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
	local main_num			 = GetNumFlg_("NUM_SCENARIO_MAIN");			// Num0
	local ice_event_num		 = GetNumFlg_("NUM_SCENARIO_SUB_ICE");		// Num5

	//-----------
	// ▼地雷配置
	//-----------
	// ID初期化
	g_mine_phantom_wall01	 <- C_NONE_ID;
	g_mine_phantom_wall02	 <- C_NONE_ID;
	g_mine_phantom_wall03	 <- C_NONE_ID;
	g_mine_phantom_wall04	 <- C_NONE_ID;
	g_mine_phantom_wall05	 <- C_NONE_ID;
	
	// ■幻の壁
	g_mine_phantom_wall01 = SetPointBoxEventMineNoFallWait_("mine_phantom_wall01");
	g_mine_phantom_wall02 = SetPointBoxEventMineNoFallWait_("mine_phantom_wall02");
	g_mine_phantom_wall03 = SetPointBoxEventMineNoFallWait_("mine_phantom_wall03");
	g_mine_phantom_wall04 = SetPointBoxEventMineNoFallWait_("mine_phantom_wall04");
	g_mine_phantom_wall05 = SetPointBoxEventMineNoFallWait_("mine_phantom_wall05");
	
	EventEnd_();
}

//------------------------------------------------
//		フィールド操作開始
//------------------------------------------------
function EventStartOperate()
{
	local main_num			 = GetNumFlg_("NUM_SCENARIO_MAIN");			// Num0
	local ice_event_num		 = GetNumFlg_("NUM_SCENARIO_SUB_ICE");		// Num5

	/*
		処理なし
	*/

	EventEnd_();
}

//------------------------------------------------
//		ＮＰＣ接触時
//------------------------------------------------
function TouchNpc()
{
	local main_num			 = GetNumFlg_("NUM_SCENARIO_MAIN");			// Num0
	local ice_event_num		 = GetNumFlg_("NUM_SCENARIO_SUB_ICE");		// Num5

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
	local main_num			 = GetNumFlg_("NUM_SCENARIO_MAIN");			// Num0
	local ice_event_num		 = GetNumFlg_("NUM_SCENARIO_SUB_ICE");		// Num5

	local target = GetTouchEventMineId_();
	local player = GetPlayerId_();

	switch (target) {
	case g_mine_phantom_wall01 :
		uMinePhantom_wall01();
		break;
	case g_mine_phantom_wall02 :
		uMinePhantom_wall02();
		break;
	case g_mine_phantom_wall03 :
		uMinePhantom_wall03();
		break;
	case g_mine_phantom_wall04 :
		uMinePhantom_wall04();
		break;
	case g_mine_phantom_wall05 :
		uMinePhantom_wall05();
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
	local main_num			= GetNumFlg_("NUM_SCENARIO_MAIN");			// Num0
	local ice_event_num		= GetNumFlg_("NUM_SCENARIO_SUB_ICE");		// Num5

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
//		幻の壁①に触れた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMinePhantom_wall01()
{
	SetEventFlg_("BFG_OPEN_SECRET_AREA_I02_01_1", true);		// Bit_1823 隠し部屋オープンフラグ 氷の遺跡①
	DeleteEventMine_(g_mine_phantom_wall01);
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		幻の壁②に触れた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMinePhantom_wall02()
{
	SetEventFlg_("BFG_OPEN_SECRET_AREA_I02_01_2", true);		// Bit_1824 隠し部屋オープンフラグ 氷の遺跡②
	DeleteEventMine_(g_mine_phantom_wall02);
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		幻の壁③に触れた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMinePhantom_wall03()
{
	SetEventFlg_("BFG_OPEN_SECRET_AREA_I02_01_3", true);		// Bit_1825 隠し部屋オープンフラグ 氷の遺跡③
	DeleteEventMine_(g_mine_phantom_wall03);
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		幻の壁④に触れた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMinePhantom_wall04()
{
	SetEventFlg_("BFG_OPEN_SECRET_AREA_I02_01_4", true);		// Bit_1826 隠し部屋オープンフラグ 氷の遺跡④
	DeleteEventMine_(g_mine_phantom_wall04);
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		幻の壁⑤に触れた時
//------------------------------------------------
//	引数	: なし
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMinePhantom_wall05()
{
	SetEventFlg_("BFG_OPEN_SECRET_AREA_I02_01_5", true);		// Bit_1827 隠し部屋オープンフラグ 氷の遺跡⑤
	DeleteEventMine_(g_mine_phantom_wall05);
}


