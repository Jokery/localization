// ゴールドアタック

// 初期化
function Init()
{
	DebugPrint("BATTLE083_function_Init")
	BattleCommon_Init();
	cAction <- cActionInfo(0)
	Debug_cActionPrint(cAction)
	ChangeIndexPointData_(PERSONAL_POINT_DATA);
	
	gMultiCount <- 0;
	gMultiStageCount <- 0;
	gAttack <- GetActorIndex_(0);
}

// 更新
function Update()
{
	OnInit();
	
	OnUpdate();
	DebugPrint("BATTLE083_function_Update")
	BatteleScript_End();
}

function OnInit()
{
	CharaStand("Action", true, gMultiCount, cAction);
}

function OnUpdate()
{
	SetExchangeNumber_(GetStoleGold_(0, 0));
	ShowBattleEventMessage_(IsAlly_(GetActorIndex_(0)), 600);
	Wait_(30)
}

