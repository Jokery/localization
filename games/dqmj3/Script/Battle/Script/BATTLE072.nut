//�}�z�g���E�s���㓮�쉉�o�iBattleCommon��Skip�j
//�^���g���E�s���㓮�쉉�o�iBattleCommon��Skip�j

// ������
function Init()
{
	DebugPrint("BATTLE072_function_Init")
	BattleCommon_Init();
	LoadEffect();
	LoadEffect_("EF130_31_MAHOTORA_ABS")
	LoadEffect_("EF130_27_TAMETORA_ABS")
	LoadEffect_("EF120_01_HOIMI")
	cAction <- cActionInfo(0)
	
	gMultiCount <- 0;
	gMultiStageCount <- 0;
	
	gMessageId <- 0;
	
	switch(GetDamageType_(gMultiCount,0))
	{
	case AFFECT_PARAM.HP:
		//�~���N���̏ꍇ
		/*cAction.SingleActEffect0_Name			= "EF120_01_HOIMI";
		cAction.SingleActEffect0_Frame			= 30;
		//cAction.SingleActEffect1_Name			= GetSingleEffectName_(Count,1);
		//cAction.SingleActEffect1_Frame		= GetSingleEffectFrame_(Count,1)
		//cAction.AllActEffect0_Name			= GetAllEffectName_(Count,0);
		//cAction.AllActEffect0_Frame			= GetAllEffectFrame_(Count,0);
		//cAction.AllActEffect1_Name			= GetAllEffectName_(Count,1);
		//cAction.AllActEffect1_Frame			= GetAllEffectFrame_(Count,1);
		cAction.UpdateEffect(gMultiCount);*/
		gMessageId = 0;
		break;
	case AFFECT_PARAM.MP:
		//�}�z�g��
		cAction.SingleActEffect0_Name			= "EF130_31_MAHOTORA_ABS";
		cAction.SingleActEffect0_Frame			= 45;
		//cAction.SingleActEffect1_Name			= GetSingleEffectName_(Count,1);
		//cAction.SingleActEffect1_Frame		= GetSingleEffectFrame_(Count,1)
		//cAction.AllActEffect0_Name			= GetAllEffectName_(Count,0);
		//cAction.AllActEffect0_Frame			= GetAllEffectFrame_(Count,0);
		//cAction.AllActEffect1_Name			= GetAllEffectName_(Count,1);
		//cAction.AllActEffect1_Frame			= GetAllEffectFrame_(Count,1);	
		cAction.UpdateEffect(gMultiCount)
		gMessageId = 610;
		break;	
	case AFFECT_PARAM.TS:
		cAction.SingleActEffect0_Name			= "EF130_27_TAMETORA_ABS";
		cAction.SingleActEffect0_Frame			= 45;
		//cAction.SingleActEffect1_Name			= GetSingleEffectName_(Count,1);
		//cAction.SingleActEffect1_Frame		= GetSingleEffectFrame_(Count,1)
		//cAction.AllActEffect0_Name			= GetAllEffectName_(Count,0);
		//cAction.AllActEffect0_Frame			= GetAllEffectFrame_(Count,0);
		//cAction.AllActEffect1_Name			= GetAllEffectName_(Count,1);
		//cAction.AllActEffect1_Frame			= GetAllEffectFrame_(Count,1);	
		cAction.UpdateEffect(gMultiCount)
		gMessageId = 611;
		break;		
	default:
		break;
	}
	
	Debug_cActionPrint(cAction)
	ChangeIndexPointData_(PERSONAL_POINT_DATA);
	
	//gAttack <- GetActorIndex_(0);
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
	local firstTarget = GetTargetIndex_(0, 0);
	ShowBattleFeatMessage_(IsAlly_(firstTarget), gMessageId);
	//�Ώێ҂̔z�u
	local CameraFlag = true;
	CharaStand_Target(CameraFlag,gMultiCount);	
	local TargetNum = GetTargetNum_(gMultiCount)
	
	//CharaStand�Ăяo������p
	local CharaStandFlag = true;
	local WaitFlag = true;

	LineEffect_Init(CharaStandFlag ,gMultiCount,gMultiStageCount,WaitFlag,cAction);
	
}

