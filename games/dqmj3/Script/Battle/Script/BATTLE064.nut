//防御（BattleCommonにSkip）

// 初期化
function Init()
{
	DebugPrint("BATTLE018_function_Init")
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

// 更新
function Update()
{
	DebugPrint("BATTLE018_function_Update")

	//必要なクラスを呼び出す
	local cParty = cFullPartyInfo(gAttack);
	//技名の表示
	
	ShowActionMessage(gMultiCount,gNameVisibleFlag);
	
	if(cAction.SelfTargetFlag == false){
		local CharaStand_Select = "Action"
		local CameraFlag = true;
		CharaStand(CharaStand_Select , CameraFlag , gMultiCount,cAction);
		Wait_(60);
	}
	
	//CharaStand呼び出し判定用
	local CharaStandFlag = true;
	local WaitFlag = true;
	
	local SingleAttackFlag = false;
	Exception_2ndCheck(gMultiCount,SingleAttackFlag,cAction)
	LineEffect_Init(CharaStandFlag ,gMultiCount,gMultiStageCount,WaitFlag,cAction);
	
	
	BatteleScript_End();
}

