//�A�C�e���g�p

// ������
function Init()
{
	DebugPrint("BATTLE067_function_Init")
	BattleCommon_Init();
	LoadEffect();
	cAction <- cActionInfo(0)
	Debug_cActionPrint(cAction)
	ChangeIndexPointData_(PERSONAL_POINT_DATA);
	
	gMultiCount <- 0;
	gMultiStageCount <- 0;
	gNameVisibleFlag <- false;
	gActor <- GetActorIndex_(0);
}

// �X�V
function Update()
{
	DebugPrint("BATTLE067_function_Update")
	
	// �A�C�e���A�C�R��������
	ItemIconInvisible_();

	//�K�v�ȃN���X���Ăяo��
	local cParty = cFullPartyInfo(gActor);
	
	//�}�X�^�[�J�b�g�̕\��
	ShowActionMessage_NoAllow(gMultiCount,gNameVisibleFlag)
	
	//�A�C�e���pCutIn
	Gosign_Item()
	
	//CharaStand�Ăяo������p
	local CharaStandFlag = true;
	local WaitFlag = true;
	
	local SingleAttackFlag = false;
	Exception_2ndCheck(gMultiCount,SingleAttackFlag,cAction)
	LineEffect_Init(CharaStandFlag ,gMultiCount,gMultiStageCount,WaitFlag,cAction);
	
	Task_ObjectFadeIn_(gActor, 1);
	
	if(IsFull_()){
		DeleteAllActionName_();
		//AddBattleEventMessage_(581)
		ShowBattleEventMessage_(IsAlly_(gActor), 581);	
		Wait_(30)
	}
	SetApealPoint_Init(true)
	BatteleScript_End();
}

