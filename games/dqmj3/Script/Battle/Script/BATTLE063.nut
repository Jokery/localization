//�s���㓮�쉉�o�iBattleCommon��Skip�j

// ������
function Init()
{
	DebugPrint("BATTLE042_function_Init")
	BattleCommon_Init();
	gMultiCount <- 0;
	gMultiStageCount <- 0;
	gAttack <- GetActorIndex_(0);
	gNameVisibleFlag <- false
}

// �X�V
function Update()
{
	DebugPrint("BATTLE042_function_Update")
	LoadEffect();
	LoadEffect_("EF000_03_SHUCHUSEN");
	cAction <- cActionInfo(0);
	Debug_cActionPrint(cAction)
	ChangeIndexPointData_(PERSONAL_POINT_DATA);
	AfterAction()
	
	BatteleScript_End();
}

function AfterAction()
{
	
	//�s���҃J�b�g�����邩�H
	if(cAction.SelfTargetFlag == false){
		ShowActionMessage_NoAllow(gMultiCount,gNameVisibleFlag)
		local CharaStand_Select = "Action"
		local CameraFlag = true;
		CharaStand(CharaStand_Select , CameraFlag , gMultiCount,cAction);
		//SetMotion_(cAction.Attack , MOT_SWORD_START , 4)
		//Wait_(15);
		//SetMotion_(cAction.Attack , MOT_SWORD_CHARGE , 4)
		//Wait_(30);
		SetMotion_(cAction.Attack , MOT_SWORD_EXERCISE , 4)
		SetCameraEffect_("EF000_03_SHUCHUSEN", 100);
		Wait_(45);
		DeleteAllEffect_()
	} else {
		ShowActionMessage_NoAllow(gMultiCount,gNameVisibleFlag);
	}
	
	//CharaStand�Ăяo������p
	local CharaStandFlag = true;
	local WaitFlag = true;
	
	local SingleAttackFlag = false;
	Exception_2ndCheck(gMultiCount,SingleAttackFlag,cAction)
	LineEffect_Init(CharaStandFlag ,gMultiCount,gMultiStageCount,WaitFlag,cAction);
	Wait_(20)
}

function StateChangeCheck()
{
	local Flag		= false;
	
	//�X�e�[�^�X�ω����������������m�F����
	for(local IndexCount = 0 ; IndexCount < GetTargetNum_(gMultiCount) ; IndexCount++){
		local Target	= GetTargetIndex_(gMultiCount, IndexCount);
		for(local State = STATUS_TOP ; State < STATUS_NUM ; State++){
			local StateFlag			= GetStatusFlag_(State,gMultiCount,IndexCount);
			local StateEndFlag		= GetStatusEndFlag_(State,gMultiCount,IndexCount);
			local StateValue		= GetStatusValue_(State,gMultiCount,IndexCount);
			//�X�e�[�^�X�ɕύX�����������H
			if(StateFlag == true && StateValue != 0 && StateEndFlag == false){
				Flag = true;
			}
		}
	}
	return Flag;
}