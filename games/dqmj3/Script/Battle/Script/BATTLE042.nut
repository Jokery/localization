//行動後動作演出（BattleCommonにSkip）

// 初期化
function Init()
{
	DebugPrint("BATTLE042_function_Init")
	BattleCommon_Init();
	LoadEffect();
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
	DebugPrint("BATTLE042_function_Update")
	
	AfterAction()
	
	BatteleScript_End();
}

function AfterAction()
{
	
	UnDispTolerChainRate_()
	
	//行動者カットを入れるか？
	if(cAction.SelfTargetFlag == false){
		local CharaStand_Select = "Action"
		local CameraFlag = true;
		CharaStand(CharaStand_Select , CameraFlag , gMultiCount,cAction);
		Wait_(60);
	}
	
	//CharaStand呼び出し判定用
	local CharaStandFlag = true;
	local WaitFlag = true;
	
	LineEffect_Init(CharaStandFlag ,gMultiCount,gMultiStageCount,WaitFlag,cAction);
	
}

