//�䂤���̎a���E�s���㓮�쉉�o�iBattleCommon��Skip�j

// ������
function Init()
{
	DebugPrint("BATTLE072_function_Init")
	BattleCommon_Init();
	LoadEffect();
	LoadEffect_("EF130_31_MAHOTORA_REC")
	LoadEffect_("EF030_10_TENSION01")
	
	gMultiCount <- 0;
	gMultiStageCount <- 0;
	
	cAction <- cActionInfo(gMultiCount)
	//�P�̗p�G�t�F�N�g�̐ݒ�
	cAction.SingleActEffect0_Name	= "EF130_31_MAHOTORA_REC";
	cAction.SingleActEffect0_Frame	= 45;
	cAction.UpdateEffect(gMultiCount);
	
	Debug_cActionPrint(cAction)
	gAttack <- GetActorIndex_(0);
}

// �X�V
function Update()
{
	DebugPrint("BATTLE072_function_Update")
	
	AfterAction()
	
	BatteleScript_End();
}

function AfterAction()
{
	
	
	//�Ώێ҂̔z�u
	//local CameraFlag = true;
	//CharaStand_Target(CameraFlag,gMultiCount);
	
	local CharaStandFlag = true;
	local WaitFlag = false;
	LineEffect_Init(CharaStandFlag ,gMultiCount,gMultiStageCount,WaitFlag,cAction);
	Wait_(30)
}
