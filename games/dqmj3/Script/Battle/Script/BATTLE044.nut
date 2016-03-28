//�e���V�����o�[��

// ������
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

// �X�V
function Update()
{
	DebugPrint("BATTLE044_function_Update")
	
	OnUpdate()
	
	BatteleScript_End();
}

function OnUpdate()
{
	// �o�[����ޕ\��
	local firstTarget = GetTargetIndex_(0, 0);
	ShowBattleEventMessage_(IsAlly_(firstTarget), GetMonsterLinage_(firstTarget) + 590);
	
	//�Ώێ҂̔z�u
	CharaStand_Target(true, gMultiCount);
	LineEffect_Init(true, gMultiCount, gMultiStageCount, true, cAction);
}

