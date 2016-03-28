//�g�o�E�l�o�����񕜁iBattleCommon��Skip�j

// ������
function Init()
{
	DebugPrint("BATTLE087_function_Init")
	BattleCommon_Init();
	LoadEffect();
	cAction <- cActionInfo(0)
	
	gMultiCount <- 0;
	gMultiStageCount <- 0;
	
	switch(GetDamageType_(gMultiCount,0))
	{
	case AFFECT_PARAM.HP:
		//�~���N���̏ꍇ
		//cAction.SingleActEffect0_Name			= "EF120_01_HOIMI";
		//cAction.SingleActEffect0_Frame			= 30;
		//cAction.SingleActEffect1_Name			= GetSingleEffectName_(Count,1);
		//cAction.SingleActEffect1_Frame		= GetSingleEffectFrame_(Count,1)
		//cAction.AllActEffect0_Name			= GetAllEffectName_(Count,0);
		//cAction.AllActEffect0_Frame			= GetAllEffectFrame_(Count,0);
		//cAction.AllActEffect1_Name			= GetAllEffectName_(Count,1);
		//cAction.AllActEffect1_Frame			= GetAllEffectFrame_(Count,1);
		//cAction.UpdateEffect(gMultiCount)
		//cAction.SingleActEffect0_SEFlag			= false;
		break;
	case AFFECT_PARAM.MP:
		//�}�z�g��
		//cAction.SingleActEffect0_Name			= "EF130_31_MAHOTORA_REC";
		//cAction.SingleActEffect0_Frame			= 45;
		//cAction.SingleActEffect1_Name			= GetSingleEffectName_(Count,1);
		//cAction.SingleActEffect1_Frame		= GetSingleEffectFrame_(Count,1)
		//cAction.AllActEffect0_Name			= GetAllEffectName_(Count,0);
		//cAction.AllActEffect0_Frame			= GetAllEffectFrame_(Count,0);
		//cAction.AllActEffect1_Name			= GetAllEffectName_(Count,1);
		//cAction.AllActEffect1_Frame			= GetAllEffectFrame_(Count,1);	
		//cAction.UpdateEffect(gMultiCount)
		break;	
	case AFFECT_PARAM.TS:
		//cAction.SingleActEffect0_Name			= "EF130_31_MAHOTORA_REC";
		//cAction.SingleActEffect0_Frame			= 45;
		//cAction.SingleActEffect1_Name			= GetSingleEffectName_(Count,1);
		//cAction.SingleActEffect1_Frame		= GetSingleEffectFrame_(Count,1)
		//cAction.AllActEffect0_Name			= GetAllEffectName_(Count,0);
		//cAction.AllActEffect0_Frame			= GetAllEffectFrame_(Count,0);
		//cAction.AllActEffect1_Name			= GetAllEffectName_(Count,1);
		//cAction.AllActEffect1_Frame			= GetAllEffectFrame_(Count,1);	
		//cAction.UpdateEffect(gMultiCount)
		break;		
	default:
		break;
	}
	
	Debug_cActionPrint(cAction)
	ChangeIndexPointData_(PERSONAL_POINT_DATA);
	
	gAttack <- GetActorIndex_(0);
}

// �X�V
function Update()
{
	DebugPrint("BATTLE087_function_Update")
	
	DebugPrint("=========================");
	DebugPrint("AfterAction!");
	DebugPrint("=========================");
	
	AfterAction()
	
	BatteleScript_End();
}

function AfterAction()
{
	
	UnDispTolerChainRate_()
	
	//�s���҃J�b�g�����邩�H
	if(cAction.SelfTargetFlag == false){
		local CharaStand_Select = "Action"
		local CameraFlag = true;
		CharaStand(CharaStand_Select , CameraFlag , gMultiCount,cAction);
		Wait_(60);
	}
	
	
	switch(GetDamageType_(gMultiCount,gMultiStageCount))
	{
	case AFFECT_PARAM.HP:
		//����HP�񕜃��b�Z�[�W
		ShowBattleFeatMessage_(IsAlly_(gAttack) , 23)
		break;
	case AFFECT_PARAM.MP:
		//����MP�񕜃��b�Z�[�W
		ShowBattleFeatMessage_(IsAlly_(gAttack) , 24)
		break;
	default:
		break;
	}	
	
	
	//CharaStand�Ăяo������p
	local CharaStandFlag = true;
	local WaitFlag = true;
	
	LineEffect_Init(CharaStandFlag ,gMultiCount,gMultiStageCount,WaitFlag,cAction);
	
}

