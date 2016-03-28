//�e��u��v�̌��ʔ����iBattleCommon��Skip�j

// ������
function Init()
{
	DebugPrint("BATTLE088_function_Init")
	BattleCommon_Init();
	ChangeIndexPointData_(PERSONAL_POINT_DATA);
	
	gMultiCount <- 0;
	gMultiStageCount <- 0;
	
	gEnemyIndex	<- GetEnemyIndex_(0);
	gAllyIndex	<- GetAllyIndex_(0);
	
	gEnemyParty <- cFullPartyInfo(gEnemyIndex)
	gAllyParty <- cFullPartyInfo(gAllyIndex)
	
	gEffectName <- "";
	gMessageId <- 0;
}

// �X�V
function Update()
{
	DebugPrint("BATTLE088_function_Update");
	OnInitialize();
	AfterAction();
	
	BatteleScript_End();
}

function OnInitialize()
{
	//���b�Z�[�W�\��
	switch(GetEnvType_())
	{
	case FIELD.FAINTNESS:
		gEffectName = "EF200_10_FIELD_FAINTNESS";
		gMessageId = 53;
		break;
	case FIELD.CRUSH:
		gEffectName = "EF200_11_FIELD_CRUSH";
		gMessageId = 54;
		break;
		
	case FIELD.SLOW:
		gEffectName = "EF200_12_FIELD_SLOW";
		gMessageId = 55;
		break;
	case FIELD.INNOCENT:
		gEffectName = "EF200_13_FIELD_INNOCENT";
		gMessageId = 56;
		break;
	default:
		break;
	}
	LoadEffect_(gEffectName);
}

function AfterAction()
{
	
	UnDispTolerChainRate_();
	
	//�G���z�u
	FieldEffect(gEnemyParty)
	DeleteAllActionName_();
	
	
	//�������z�u
	FieldEffect(gAllyParty);
}

//�e���̌��ʔ���
//
function FieldEffect(cParty)
{
	for(local i = 0 ; i < 4 ; i++){
		local Index;
		if(cParty.AllyFlag){
			Index = GetEnemyIndex_(i);
		} else {
			Index = GetAllyIndex_(i);
		}
		SetVisible_(Index, false);
	}
	
	CharaStand_PartyInfo(cParty , false , null)
	
	Wait_(5)
	//���b�Z�[�W�\��
	ShowBattleFeatMessage_(true , gMessageId)
	ChangeIndexPointData_(BATTLE_COMMON_POINT_DATA);
	
	local EffectParam = SetPointWorldEffect_(gEffectName, cParty.EffectEmpty_Area);
	SetEffectScale_(EffectParam, cParty.EffectScale_Area);
	
	for(local IndexCount = 0 ; IndexCount < cParty.PartyNum ; IndexCount++){
		local Index;
		if(cParty.AllyFlag){
			Index = GetAllyIndex_(IndexCount);
		} else {
			Index = GetEnemyIndex_(IndexCount);
		}
		if(Index != INVALID_CHARACTER){
			if(GetInitExistType_(Index) == LIVETYPE.ACTIVE){
				SetVisible_(Index, true);
			}
			SetMotion_(Index, MOT_DAMAGE,0)
			Task_ChangeMotion_(Index,MOT_WAIT,0)
			//SetStatusChange_(gMultiCount, IndexCount);
			//SetParamChange_(gMultiCount, IndexCount);
		}
	}
	
	Wait_(45);
	
}
