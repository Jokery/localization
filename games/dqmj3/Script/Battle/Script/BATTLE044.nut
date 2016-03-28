//テンションバーン

// 初期化
function Init()
{
	DebugPrint("BATTLE044_function_Init")
	BattleCommon_Init();
	LoadEffect_("EF030_10_TENSION01")
	cAction <- cActionInfo(0)
	cAction.SingleActEffect0_Name = "EF030_10_TENSION01";
	cAction.SingleActEffect0_Frame = 30;
	Debug_cActionPrint(cAction)
	gMultiCount <- 0;
	gMultiStageCount <- 0;
	gAttack <- GetActorIndex_(0);
}

// 更新
function Update()
{
	DebugPrint("BATTLE044_function_Update")
	
	OnUpdate()
	
	BatteleScript_End();
}

function OnUpdate()
{
	// バーン種類表示
	local firstTarget = GetTargetIndex_(0, 0);
	ShowBattleEventMessage_(IsAlly_(firstTarget), GetMonsterLinage_(firstTarget) + 590);
	
	//対象者の配置
	CharaStand_Target(true, gMultiCount);
	LineEffect_Init(true, gMultiCount, gMultiStageCount, true, cAction);
}

