//MPが足りない（BattleCommonにSkip）

// 初期化
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

// 更新
function Update()
{
	DebugPrint("BATTLE068_function_Update")

	//必要なクラスを呼び出す
	local cParty = cFullPartyInfo(gAttack);
	//技名の表示
	
	ShowActionMessage(gMultiCount,gNameVisibleFlag);
	
	local CharaStand_Select = "Action"
	local CameraFlag = true;
	CharaStand(CharaStand_Select , CameraFlag , gMultiCount,cAction);
	SetMotion_(cAction.Attack , MOT_SWORD_START , 4)
	Wait_(15);
	SetMotion_(cAction.Attack , MOT_SWORD_CHARGE , 4)
	Wait_(30);
	SetMotion_(cAction.Attack , MOT_SWORD_EXERCISE , 4)
	Wait_(5);
	ShowBattleEventMessage_(IsAlly_(cAction.Attack), 9);
	Wait_(35)
	SetApealPoint_Init(true)
	BatteleScript_End();
}

