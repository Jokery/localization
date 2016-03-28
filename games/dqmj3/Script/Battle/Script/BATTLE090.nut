//�s�����o�i�r���J�b�g�Ȃ��j

// ������
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

// �X�V
function Update()
{
	DebugPrint("BATTLE090_function_Update")
	
	local CharaStandFlag = true;
	local WaitFlag = true
	
	// �s�����\��
	ShowActionName_(gMultiCount);
	
	//MP����
	local UsedMP = GetUseMp_(gMultiCount);
	SetMpDamage_(gActor, UsedMP);
	
	//�ϐ��A�g���\����
	UnDispTolerChainRate_()
	
	Exception_1stCheck(gMultiCount, true, cAction);
	
	LineEffect_Init(CharaStandFlag, gMultiCount, gMultiStageCount, WaitFlag, cAction);
	
	BatteleScript_End();
}

