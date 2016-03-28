//スカウト特性演出

// 初期化
function Init()
{
	DebugPrint("BATTLE074_function_" + "Init")
	BattleCommon_Init();
	LoadEffect();
	LoadEffect_("EF030_02_STATUS_HEART")
	
	//スカウトUIの表示
	SetVisibleScoutGauge_(true);
	FilterOn_(0, 0, 0, 100);
}

// 更新
function Update()
{
	DebugPrint("BATTLE074_function_" + "Update")
	ScoutActorEffect();
	ScoutTargetEffect();
	BatteleScript_End();
}

//行動者正面カット
function ScoutActorEffect()
{
	DebugPrint("BATTLE074_function_" + "Update")
	DeleteAllActionName_();
	ShowBattleEventMessage_(true , 5)
	local Actor = GetActorIndex_(0)
	CharaStand_PartyFull_CamCenter(IsAlly_(Actor),Actor);
	Wait_(45)
}


//対象者正面カット
function ScoutTargetEffect()
{
	DebugPrint("BATTLE074_function_" + "Update")
	
	local Target	= GetTargetIndex_(0,0)
	
	CharaStand_ScoutTarget();
	Wait_(10);
	MonsterSizeEffect(Target,"EF030_02_STATUS_HEART")
	
	//スカウトゲージの更新
	//DebugPrint(("GetScoutFeatValue_() : " + GetScoutFeatValue_() + "\n")
	AddScoutGaugeValue_(GetScoutFeatValue_())
	while(IsFinishScoutGaugeAnime_() != true)
	{
		Wait_(1)
		UpdateScoutGauge_();
		//DebugPrint(("IsFinishScoutGaugeAnime_() : " + IsFinishScoutGaugeAnime_() + "\n")
	}
	Wait_(20)
	
}