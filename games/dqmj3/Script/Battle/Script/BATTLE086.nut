// �[���̂��傤����

// ������
function Init()
{
	DebugPrint("BATTLE086_" + "IN" + "_function_" + "Init")
	BattleCommon_Init();
	gAttack <- GetActorIndex_(0);
	gAttackSize <- GetMonsterSize_(gAttack);
	gMultiCount <- 0;		//�A���s���J�E���g
	gMultiStageCount <- 0;	//���i�U���J�E���g�p
	
	ChangeIndexPointData_(PERSONAL_POINT_DATA);
	LoadEffect()
	DebugPrint("BATTLE086_" + "OUT" + "_function_" + "Init")
}

// �X�V
function Update()
{
	DebugPrint("BATTLE086_" + "IN" + "_function_" + "Update")
	ChangeIndexPointData_(PERSONAL_POINT_DATA);
	DeleteAllTask_();
	SetVisibleNeedModel_();
	
	FirstSpellCast();
	//cAction <- cActionInfo(gMultiCount)
	//Debug_cActionPrint(cAction)
	
	gMultiCount++;
	SecondSpellCast();
	cAction <- cActionInfo(gMultiCount)
	//�s���G�t�F�N�g���폜����
	cAction.AllActEffect0_Name	= null;
	cAction.AllActEffect0_Frame	= 10;
	cAction.UpdateEffect(gMultiCount)
	
	Debug_cActionPrint(cAction)
	
	local CharaStandFlag = true;
	local WaitFlag = true;
	
	ThirdSpellCut()
	
	BatteleScript_End();
	DebugPrint("BATTLE086_" + "OUT" + "_function_" + "Update")
}


//��U�r���J�b�g
function FirstSpellCast()
{
	DebugPrint("BATTLE086_" + "IN" + "_function_" + "FirstSpellCast")
	local Actor = GetActorIndex_(gMultiCount)
	local NameVisibleFlag = true;
	ShowActionMessage(gMultiCount,NameVisibleFlag)
	CharaStand_PartyFull_CamCenter(IsAlly_(Actor),Actor);
	SpellCastEffect(Actor,gMultiCount)
	//ReplaySE_("SE_SHA_002");
	SetMotion_(Actor, MOT_SWORD_START, 4);
	SetCameraEffect_("EF000_03_SHUCHUSEN", 100);
	SetMotion_(Actor, MOT_SWORD_EXERCISE, 4);
	Task_ChangeMotion_(Actor, MOT_WAIT, 4);
	SetStatusChange_(gMultiCount,0)
	Wait_(30);
	DebugPrint("BATTLE086_" + "OUT" + "_function_" + "FirstSpellCast")
}

//��U�r���J�b�g
function SecondSpellCast()
{
	DebugPrint("BATTLE086_" + "IN" + "_function_" + "SecondSpellCast")
	//�G���̕\��
	DeleteAllTask_()
	DeleteAllActionName_();
	DeleteAllEffect_();
	local Actor = GetActorIndex_(gMultiCount)
	local NameVisibleFlag = true;
	
	//�[���̂��傤�������b�Z�[�W�̕\��
	ShowBattleEventMessage_(IsAlly_(Actor) , 61);	
	ShowActionMessage_IconAnimation(gMultiCount,Actor)
	
	CharaStand_PartyFull_CamCenter(IsAlly_(Actor),Actor);
	SpellCastEffect(Actor,gMultiCount)
	//ReplaySE_("SE_SHA_002");
	SetMotion_(Actor, MOT_SWORD_START, 4);
	SetCameraEffect_("EF000_03_SHUCHUSEN", 100);
	SetMotion_(Actor, MOT_SWORD_EXERCISE, 4);
	Task_ChangeMotion_(Actor, MOT_WAIT, 4);
	SetStatusChange_(gMultiCount,0)
	Wait_(30);
	DebugPrint("BATTLE086_" + "OUT" + "_function_" + "SecondSpellCast")
}

//�ΏێҎE�Q�J�b�g
function ThirdSpellCut()
{
	DebugPrint("BATTLE086_" + "IN" + "_function_" + "ThirdSpellCut")
	local cParty			= cFullPartyInfo(GetActorIndex_(0))
	local SingleFlag		= true;
	local CamCenterMonster	= GetActorIndex_(0)
	//��s�r���҃J�b�g�i���ʁj
	DeleteAllTask_()
	DeleteAllActionName_();
	DeleteAllEffect_();
	CharaStand_PartyInfo(cParty , SingleFlag , CamCenterMonster)
	Wait_(1)
	LineEffect_Init(false,gMultiCount,gMultiStageCount,true,cAction)
	
}