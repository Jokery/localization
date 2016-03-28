//行動演出（詠唱カットなし）

// 初期化
function Init()
{
	DebugPrint("BATTLE090_function_Init")
	BattleCommon_Init();
	LoadEffect();
	cAction <- cActionInfo(0)
	Debug_cActionPrint(cAction)
	ChangeIndexPointData_(PERSONAL_POINT_DATA);
	
	gMultiCount <- 0;
	gMultiStageCount <- 0;
	gNameVisibleFlag <- true;
	gActor <- GetActorIndex_(0);
	gAlly <- IsAlly_(gActor)
}

// 更新
function Update()
{
	DebugPrint("BATTLE090_function_Update")
	
	local CharaStandFlag = true;
	local WaitFlag = true
	
	// 行動名表示
	ShowActionName_(gMultiCount);
	
	//MP消費
	local UsedMP = GetUseMp_(gMultiCount);
	SetMpDamage_(gActor, UsedMP);
	
	//耐性連携を非表示に
	UnDispTolerChainRate_()
	
	Exception_1stCheck(gMultiCount, true, cAction);
	
	LineEffect_Init(CharaStandFlag, gMultiCount, gMultiStageCount, WaitFlag, cAction);
	
	BatteleScript_End();
}

