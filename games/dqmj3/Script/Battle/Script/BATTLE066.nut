//�X�e���X�A�^�b�N�i�Q�i�ځj

// ������
function Init()
{
	DebugPrint("BATTLE066_function_Init")
	BattleCommon_Init();
	LoadEffect();
	cAction <- cActionInfo(0)
	Debug_cActionPrint(cAction)
	ChangeIndexPointData_(PERSONAL_POINT_DATA);
	
	gMultiCount <- 0;
	gMultiStageCount <- 0;
	gNameVisibleFlag <- true;
	gAttack <- GetActorIndex_(0);
}

// �X�V
function Update()
{
	DebugPrint("BATTLE066_function_Update")
	Exception_1stCheck(0, true, cAction);

	//�K�v�ȃN���X���Ăяo��
	local cParty = cFullPartyInfo(gAttack);
	//�Z���̕\��
	
	ShowActionMessage(gMultiCount,gNameVisibleFlag);
	
	//CharaStand�Ăяo������p
	local CharaStandFlag = true;
	local WaitFlag = true;
	
	local SingleAttackFlag = false;
	Exception_2ndCheck(gMultiCount,SingleAttackFlag,cAction)
	LineEffect_Init(CharaStandFlag ,gMultiCount,gMultiStageCount,WaitFlag,cAction);
	
	BatteleScript_End();
}

