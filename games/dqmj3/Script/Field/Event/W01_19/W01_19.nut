//===================== W01_19 浮島 ====================

//------------------------------------------------
//		戦闘終了後
//------------------------------------------------
function AfterBattle()
{


	EventEnd_();
}

//------------------------------------------------
//		マップに入る前
//------------------------------------------------
function BeforeInitMap()
{
	
	EventEnd_();
}


//------------------------------------------------
//		フェードアウト中
//------------------------------------------------
function FadeIn()
{

	//----------
	// ▼NPC配置
	//----------
	//無し

	//-----------
	// ▼地雷配置
	//-----------
	// ID初期化
	g_mine_sky_return_point <- C_NONE_ID;

	g_mine_sky_return_point = SetPointBoxEventMine_("mine_sky_return_point", true);


	EventEnd_();
}

//------------------------------------------------
//		フィールド操作開始
//------------------------------------------------
function EventStartOperate()
{


	EventEnd_()
}

//------------------------------------------------
//		ＮＰＣ接触時
//------------------------------------------------
function TouchNpc()
{

	local target = GetTargetId_();

	EventEnd_();
}

//------------------------------------------------
//		地雷接触時
//------------------------------------------------
function TouchEventMine()
{
	local target = GetTouchEventMineId_();
	
	switch (target) {
	case g_mine_sky_return_point:
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_REACTOR");
		ShowMsg_("SKY_RETURN_MSG_00");
		KeyInputWait_();
		if(GetQueryResult_() == QUERY_YES){

			//大空ライドにモンスターが設定されているかチェック
			if ( IsFlightRideSetting_() == true ) {
				CloseMsgWnd_();
				DeleteEventMine_(g_mine_sky_return_point);
				ChangeMapToFlight_();

			//設定されていない！
			} else {
				// コメント化< 2次DB #6294 >
				//OpenMsgWnd_();
				//SetTalkName_("NAME_TAG_REACTOR");
				ShowMsg_("SKY_RETURN_MSG_10");
				KeyInputWait_();
				ShowMsg_("SKY_RETURN_MSG_11");
				KeyInputWait_();
				CloseMsgWnd_();

			}

		} else {
			CloseMsgWnd_();
			//主人公フリーに
		}

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

