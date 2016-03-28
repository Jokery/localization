//特性用演出（BattleCommonにSkip）

// 初期化
function Init()
{
	DebugPrint("BATTLE057_function_Init")
	BattleCommon_Init();
	cAction <- cActionInfo(0)
	Debug_cActionPrint(cAction)
	ChangeIndexPointData_(PERSONAL_POINT_DATA);
	
	LoadEffect();
}

// 更新
function Update()
{
	DebugPrint("BATTLE057_function_Update")

	//CharaStandy呼び出し判定用
	local CharaStandFlag = true;

	//技名の表示
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
	
	//CharaStand呼び出し判定用
	local CharaStandFlag = true;
	local WaitFlag = true;
	
	local SingleAttackFlag = false;
	Exception_2ndCheck(MultiCount,SingleAttackFlag,cAction)
	LineEffect_Init(CharaStandFlag ,MultiCount,MultiStageCount,WaitFlag,cAction);
	
	BatteleScript_End();
}

