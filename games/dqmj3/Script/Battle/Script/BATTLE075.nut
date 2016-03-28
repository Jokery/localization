// スカウト判定

// 初期化
function Init()
{
	DebugPrint("BATTLE075_function_Init")
	BattleCommon_Init();
	gMultiCount <- 0;
	UnSettingArrowTargetAll_();//行動者の矢印を全部削除
}

// 更新
function Update()
{
	DebugPrint("BATTLE075_function_Update")
	local CameraFlag = true;
	CharaStand_ScoutTarget()
	FilterOff_(0, 0, 0, 0);
	//FilterOn_(0, 0, 0, 100);
	Wait_(30)
	
	// スカウトゲージの判定演出
	local ScoutGage = GetScoutGaugeValue_();
	if(ScoutGage == 1000){
		//１００％演出
		ScoutGaugePlayAnimMax_();
		ReplaySE_("SE_BTL_233")
		while(IsFinishScoutGaugeAnime_() != true)
		{
			Wait_(1);
			UpdateScoutGauge_();
		}
		Wait_(20);
	} else if(ScoutGage == 0){
		//０％演出
		ScoutGaugePlayAnimPulsation_();
		while(IsFinishScoutGaugeAnime_() != true)
		{
			Wait_(1);
			UpdateScoutGauge_();
		}
		Wait_(30);
	} else {
		//通常時
		for(local i = 0 ; i < 3 ; i++){
			ScoutGaugePlayAnimPulsation_();
			ReplaySE_("SE_BTL_062")
			while(IsFinishScoutGaugeAnime_() != true)
			{
				Wait_(1);
				UpdateScoutGauge_();
			}
			Wait_(30);
		}
	}
	
	// スカウトゲージ削除
	SetVisibleScoutGauge_(false);
	DeleteScoutGauge_();
	
	// 判定結果表示
	if(IsScoutSuccess_() == true){
		ScoutSuccess()
	} else {
		ScoutFailure()
	}
	
	EndTryScoutScene_();
	BatteleScript_End();
}

//スカウト成功
function ScoutSuccess()
{
	//DeleteAllActionName_();
	ShowBattleEventMessage_(true , 0)
	StopBgmSub_(18);
	
	local Target	= GetTargetIndex_(0,0)
	local AllyFlag	= IsAlly_(Target)
	local MasterIndex = GetAllyMaster_();
	if(IsAlly_(Target) != true){
		MasterIndex = GetEnemyMaster_();
	}
	if(AllyFlag == false){MasterIndex = GetEnemyMaster_();}
	//DebugPrint("MasterIndex	: " + MasterIndex + "\n")
	//RideOffMaster_(MasterIndex);
	Task_ObjectFadeOut_(MasterIndex, 30);
	
	Wait_(6)
	PlayMe_("ME_011");
	Wait_(30)
}

//スカウト失敗
function ScoutFailure()
{
	ShowBattleEventMessage_(false , 1)
	Wait_(30)
}

