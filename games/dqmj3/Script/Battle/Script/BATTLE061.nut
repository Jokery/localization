//���ˉ��o�iBattleCommon��Skip�j

// ������
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

// �X�V
function Update()
{
	DebugPrint("BATTLE061_function_Update")
	
	AfterAction()
	
	BatteleScript_End();
}

function AfterAction(){

	
	//CharaStand�Ăяo������p
	local CharaStandFlag = true;
	local WaitFlag = true;
	
	local SingleAttackFlag = false;
	SetTolerChainRate_(gMultiCount)
	Exception_2ndCheck(gMultiCount,SingleAttackFlag,cAction)
	LineEffect_Init(CharaStandFlag ,gMultiCount,gMultiStageCount,WaitFlag,cAction);
	
}
