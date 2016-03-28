//���E

// ������
function Init()
{
	DebugPrint("BATTLE072_function_Init")
	BattleCommon_Init();
	LoadEffect();
	//���E�G�t�F�N�g
	LoadEffect_("EF130_31_MAHOTORA_REC")
	LoadEffect_("EF000_18_OFFSET_SCREEN")
	
	gMultiCount <- 0;
	gMultiStageCount <- 0;
	
}

// �X�V
function Update()
{
	DebugPrint("BATTLE072_function_Update")

	FirstSpellCast()
	CutReset()
	gMultiCount += 1;
	SecondSpellCast()
	CutReset()
	OffsetCast()
	BatteleScript_End();
}

//��U�r���J�b�g
function FirstSpellCast()
{
	local Actor = GetActorIndex_(gMultiCount)
	local NameVisibleFlag = false;
	ShowOffsetMessage(gMultiCount)
	CharaStand_PartyFull_CamCenter(IsAlly_(Actor),Actor);
	SpellCastEffect(Actor,gMultiCount)
	//ReplaySE_("SE_SHA_002");
	SetMotion_(Actor, MOT_SWORD_START, 4);
	SetCameraEffect_("EF000_03_SHUCHUSEN", 100);
	SetMotion_(Actor, MOT_SWORD_EXERCISE, 4);
	Task_ChangeMotion_(Actor, MOT_WAIT, 4);
	SetStatusChange_(gMultiCount,0)
	Wait_(30);
}

//��U�r���J�b�g
function SecondSpellCast()
{
	//�G���̕\��
	DeleteAllActionName_();
	local Actor = GetActorIndex_(gMultiCount)
	local NameVisibleFlag = false;
	ShowOffsetMessage(gMultiCount)
	CharaStand_PartyFull_CamCenter(IsAlly_(Actor),Actor);
	SpellCastEffect(Actor,gMultiCount)
	//ReplaySE_("SE_SHA_002");
	SetMotion_(Actor, MOT_SWORD_START, 4);
	SetCameraEffect_("EF000_03_SHUCHUSEN", 100);
	SetMotion_(Actor, MOT_SWORD_EXERCISE, 4);
	Task_ChangeMotion_(Actor, MOT_WAIT, 4);
	SetStatusChange_(gMultiCount,0)
	Wait_(30);
}

//���E�J�b�g
function OffsetCast()
{
	DeleteAllActionName_();
	CharaStand_PartyFull(true,false);
	local cParty = cFullPartyInfo(GetEnemyIndex_(0));
	local Actor = GetActorIndex_(gMultiCount)
	//ReplaySE_("SE_SHA_002");
	ShowBattleEventMessage_(false, 12);
	Wait_(10)
	SetCameraEffect_("EF000_18_OFFSET_SCREEN",150)
	
	SetMotion_(Actor, MOT_WAIT, 1);
	//Wait_(75);
	Wait_(90);
	SetApealPoint_Init(true)
}

//���E���b�Z�[�W�\��
function ShowOffsetMessage(MultiCount)
{
	//DebugPrint("BattleCommon_" + "IN" + "_function_" + "ShowActionMessage");
	//DebugPrint("	=>	MultiCount		: " + MultiCount);
	//DebugPrint("	=>	NameVisibleFlag	: " + NameVisibleFlag);
	//MultiCoun			: ����ڂ̍s�����H
	//NameVisibleFlag	: �P��ڂ̍s������ōs������\�����邩�H
	local ActionNum = GetActionNum_();
	
	if(IsScout_()){
		//�X�J�E�g���ɂ͍s������\�����Ȃ�
	} else {
		//�s������\������
		ShowActionName_(MultiCount)
	}
	
	local UsedMP = GetUseMp_(MultiCount);
	local ActorIndex = GetActorIndex_(MultiCount);
	SetMpDamage_(ActorIndex, UsedMP);
	
	SetTolerChainRate_(MultiCount)
	
	//�s�����\���ɍ��킹�ĉ���ʂ̃����X�^�[�A�C�R����h�炷
	ShowActionMessage_IconAnimation(MultiCount,ActorIndex)
	
	//�s�����\���ɍ��킹�ĉ���ʂ̖��A�C�R��������
	if(IsScout_()){
		//�X�J�E�g�A�^�b�N�̏ꍇ�͖��������Ȃ�
	} else {
		UnSettingAllowTarget_(ActorIndex);
	}
	//DebugPrint("BattleCommon_" + "OUT" + "_function_" + "ShowActionMessage");
}
