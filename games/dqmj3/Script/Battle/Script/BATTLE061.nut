//反射演出（BattleCommonにSkip）

// 初期化
function Init()
{
	DebugPrint("BATTLE061_function_Init")
	BattleCommon_Init();
	LoadEffect();
	cAction <- cActionInfo(0);
	Debug_cActionPrint(cAction)
	ChangeIndexPointData_(PERSONAL_POINT_DATA);
	gMultiCount <- 0;
	gMultiStageCount <- 0;
}

// 更新
function Update()
{
	DebugPrint("BATTLE061_function_Update")
	
	AfterAction()
	
	BatteleScript_End();
}

function AfterAction(){

	
	//CharaStand呼び出し判定用
	local CharaStandFlag = true;
	local WaitFlag = true;
	
	local SingleAttackFlag = false;
	SetTolerChainRate_(gMultiCount)
	Exception_2ndCheck(gMultiCount,SingleAttackFlag,cAction)
	LineEffect_Init(CharaStandFlag ,gMultiCount,gMultiStageCount,WaitFlag,cAction);
	
}
