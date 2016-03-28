//�s���҃G�t�F�N�g�iBattleCommon��Skip�j

// ������
function Init()
{
	DebugPrint("BATTLE068_function_Init")
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
	DebugPrint("BATTLE068_function_Update")

	//�K�v�ȃN���X���Ăяo��
	local cParty = cFullPartyInfo(gAttack);
	//�Z���̕\��
	
	ShowActionMessage(gMultiCount,gNameVisibleFlag);
	
	local CharaStand_Select = "Action"
	local CameraFlag = true;
	CharaStand(CharaStand_Select , CameraFlag , gMultiCount,cAction);
	SetMotion_(cAction.Attack , MOT_SWORD_START , 4)
	Wait_(15);
	SetMotion_(cAction.Attack , MOT_SWORD_CHARGE , 4)
	Wait_(30);
	SetMotion_(cAction.Attack , MOT_SWORD_EXERCISE , 4)
	local EffectStartWait = 5
	Wait_(EffectStartWait);
	MonsterSizeEffect(cAction.Attack , cAction.SingleActEffect0_Name);
	MonsterSizeEffect(cAction.Attack , cAction.SingleActEffect1_Name);
	
	Wait_(cAction.EffectFrame)
		
	if(cAction.EffectFrame + EffectStartWait< 60){
		Wait_(60 - cAction.EffectFrame - EffectStartWait)
	}
	
	local CharaStand_Select = "Target"
	local CameraFlag = true;
	CharaStand(CharaStand_Select,CameraFlag,gMultiCount,cAction)
	Wait_(1)	//�L�����z�u�҂�
	local WaitFlag = true;
	local EffectFlag = false;
	LineEffect_SingleStage(gMultiCount,gMultiStageCount,cAction,WaitFlag,EffectFlag)
	SetApealPoint_Init(true)
	
	BatteleScript_End();
}

