//せいけんづき（BattleCommonにSkip）

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
	gAlly <- IsAlly_(gAttack)
}

// 更新
function Update()
{
	DebugPrint("BATTLE018_function_Update")

	//必要なクラスを呼び出す
	local cParty = cFullPartyInfo(gAttack);
	//技名の表示
	
	ShowActionMessage(gMultiCount,gNameVisibleFlag);
	
	local CharaStand_Select = "Action"
	local CameraFlag = true;
	CharaStand(CharaStand_Select , CameraFlag , gMultiCount,cAction);
	
	//ReplaySE_("SE_SHA_002");
	Wait_(5);
	SetMotion_(gAttack, MOT_SWORD_START, 4);
	Wait_(5);
	DeleteAllActionName_();
	
	SetCameraEffect_("EF000_03_SHUCHUSEN", 100);
	Wait_(5);
	ShowBattleEventMessage_(gAlly,28)
	SetMotion_(gAttack, MOT_SWORD_CHARGE, 4);
	Task_ChangeMotion_(gAttack, MOT_WAIT, 4);
	Wait_(45);
	
	//CharaStand呼び出し判定用
	local CharaStandFlag = false;
	local WaitFlag = false;
	
	//ステータス変化処理
	local WaitFrame = 0;
	for(local x = 0 ; x <cAction.TargetNum ; x++){
		local Value = SetStateEffect_Init(0 ,gMultiCount,cAction)
	}
	SetApealPoint_Init(true)
	BatteleScript_End();
}

