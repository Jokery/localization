//�����p���o�iBattleCommon��Skip�j

// ������
function Init()
{
	DebugPrint("BATTLE057_function_Init")
	BattleCommon_Init();
	cAction <- cActionInfo(0)
	Debug_cActionPrint(cAction)
	ChangeIndexPointData_(PERSONAL_POINT_DATA);
	
	LoadEffect();
}

// �X�V
function Update()
{
	DebugPrint("BATTLE057_function_Update")

	//CharaStandy�Ăяo������p
	local CharaStandFlag = true;

	//�Z���̕\��
	local actor = GetActorIndex_(0);
	ShowActionName_(0);

	if(cAction.SelfTargetFlag == true){
			CharaStandFlag = false;
	}
	local MultiCount = 0;

	if(cAction.SelfTargetFlag == false){
		local CharaStand_Select = "Action"
		local CameraFlag = true;
		CharaStand(CharaStand_Select , CameraFlag , MultiCount,cAction);
		Wait_(60);
	}
	
	//CharaStand�Ăяo������p
	local CharaStandFlag = true;
	local WaitFlag = true;
	
	local SingleAttackFlag = false;
	Exception_2ndCheck(MultiCount,SingleAttackFlag,cAction)
	LineEffect_Init(CharaStandFlag ,MultiCount,MultiStageCount,WaitFlag,cAction);
	
	BatteleScript_End();
}

