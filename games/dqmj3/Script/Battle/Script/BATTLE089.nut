//�}�z�g���E�z���񕜁iBattleCommon��Skip�j
//�^���g���E�z���񕜁iBattleCommon��Skip�j

// ������
function Init()
{
	DebugPrint("BATTLE072_function_Init")
	BattleCommon_Init();
	LoadEffect();
	LoadEffect_("EF130_30_MAHOTORA_REC")
	LoadEffect_("EF130_26_TAMETORA_REC")
	LoadEffect_("EF120_01_HOIMI")
	cAction <- cActionInfo(0)
	
	gMultiCount <- 0;
	gMultiStageCount <- 0;
	
	switch(GetDamageType_(gMultiCount,0))
	{
	case AFFECT_PARAM.HP:
		//�~���N���̏ꍇ
		cAction.SingleActEffect0_Name			= "EF120_01_HOIMI";
		cAction.SingleActEffect0_Frame			= 30;
		//cAction.SingleActEffect1_Name			= GetSingleEffectName_(Count,1);
		//cAction.SingleActEffect1_Frame		= GetSingleEffectFrame_(Count,1)
		//cAction.AllActEffect0_Name			= GetAllEffectName_(Count,0);
		//cAction.AllActEffect0_Frame			= GetAllEffectFrame_(Count,0);
		//cAction.AllActEffect1_Name			= GetAllEffectName_(Count,1);
		//cAction.AllActEffect1_Frame			= GetAllEffectFrame_(Count,1);
		cAction.UpdateEffect(gMultiCount)
		break;
	case AFFECT_PARAM.MP:
		//�}�z�g��
		cAction.SingleActEffect0_Name			= "EF130_30_MAHOTORA_REC";
		cAction.SingleActEffect0_Frame			= 45;
		//cAction.SingleActEffect1_Name			= GetSingleEffectName_(Count,1);
		//cAction.SingleActEffect1_Frame		= GetSingleEffectFrame_(Count,1)
		//cAction.AllActEffect0_Name			= GetAllEffectName_(Count,0);
		//cAction.AllActEffect0_Frame			= GetAllEffectFrame_(Count,0);
		//cAction.AllActEffect1_Name			= GetAllEffectName_(Count,1);
		//cAction.AllActEffect1_Frame			= GetAllEffectFrame_(Count,1);	
		cAction.UpdateEffect(gMultiCount)
		break;	
	case AFFECT_PARAM.TS:
		cAction.SingleActEffect0_Name			= "EF130_26_TAMETORA_REC";
		cAction.SingleActEffect0_Frame			= 45;
		//cAction.SingleActEffect1_Name			= GetSingleEffectName_(Count,1);
		//cAction.SingleActEffect1_Frame		= GetSingleEffectFrame_(Count,1)
		//cAction.AllActEffect0_Name			= GetAllEffectName_(Count,0);
		//cAction.AllActEffect0_Frame			= GetAllEffectFrame_(Count,0);
		//cAction.AllActEffect1_Name			= GetAllEffectName_(Count,1);
		//cAction.AllActEffect1_Frame			= GetAllEffectFrame_(Count,1);	
		cAction.UpdateEffect(gMultiCount)
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
	
	//�Ώێ҂̔z�u
	local CameraFlag = true;
	CharaStand_Target(CameraFlag,gMultiCount);	
	local TargetNum = GetTargetNum_(gMultiCount)
	
	for(local IndexCount = 0; IndexCount < TargetNum ; IndexCount++){
		local Target = GetTargetIndex_(gMultiCount,IndexCount)
		switch(GetDamageType_(gMultiCount,IndexCount))
		{
			//�}�z�g���̏ꍇ
			case AFFECT_PARAM.MP:
				//MonsterSizeEffect(Target,"EF130_31_MAHOTORA_REC")
				break;
			//�^���g���̏ꍇ
			case AFFECT_PARAM.TS:
				//MonsterSizeEffect(Target,"EF130_27_TAMETORA_REC")
				break;
			case AFFECT_PARAM.HP:
				//MonsterSizeEffect(Target,"EF120_01_HOIMI")
				break
			default:
				//�ʏ펞�͉������Ȃ�	
				break;
		}
	}
	
	//CharaStand�Ăяo������p
	local CharaStandFlag = true;
	local WaitFlag = true;

	LineEffect_Init(CharaStandFlag ,gMultiCount,gMultiStageCount,WaitFlag,cAction);
	
}

