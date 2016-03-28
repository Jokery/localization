//テンション（BattleCommonにSkip）

// 初期化
function Init()
{
	DebugPrint("BATTLE018_function_Init")
	BattleCommon_Init();
	LoadEffect();
	cAction <- cActionInfo(0)
	Debug_cActionPrint(cAction)
	ChangeIndexPointData_(PERSONAL_POINT_DATA);
	
	gMultiCount <- 0;
	gMultiStageCount <- 0;
	gNameVisibleFlag <- true;
	gAttack <- GetActorIndex_(0);
	gAlly <- IsAlly_(gAttack)
}

// 更新
function Update()
{
	DebugPrint("BATTLE018_function_Update")
	
	local CharaStandFlag = true;
	local WaitFlag = true
	ShowActionMessage(gMultiCount,gNameVisibleFlag)
	LineEffect_Init(CharaStandFlag,gMultiCount,gMultiStageCount,WaitFlag,cAction)
	
	BatteleScript_End();
}

