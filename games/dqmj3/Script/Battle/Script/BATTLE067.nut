//アイテム使用

// 初期化
function Init()
{
	DebugPrint("BATTLE067_function_Init")
	BattleCommon_Init();
	LoadEffect();
	cAction <- cActionInfo(0)
	Debug_cActionPrint(cAction)
	ChangeIndexPointData_(PERSONAL_POINT_DATA);
	
	gMultiCount <- 0;
	gMultiStageCount <- 0;
	gNameVisibleFlag <- false;
	gActor <- GetActorIndex_(0);
}

// 更新
function Update()
{
	DebugPrint("BATTLE067_function_Update")
	
	// アイテムアイコンを消す
	ItemIconInvisible_();

	//必要なクラスを呼び出す
	local cParty = cFullPartyInfo(gActor);
	
	//マスターカットの表示
	ShowActionMessage_NoAllow(gMultiCount,gNameVisibleFlag)
	
	//アイテム用CutIn
	Gosign_Item()
	
	//CharaStand呼び出し判定用
	local CharaStandFlag = true;
	local WaitFlag = true;
	
	local SingleAttackFlag = false;
	Exception_2ndCheck(gMultiCount,SingleAttackFlag,cAction)
	LineEffect_Init(CharaStandFlag ,gMultiCount,gMultiStageCount,WaitFlag,cAction);
	
	Task_ObjectFadeIn_(gActor, 1);
	
	if(IsFull_()){
		DeleteAllActionName_();
		//AddBattleEventMessage_(581)
		ShowBattleEventMessage_(IsAlly_(gActor), 581);	
		Wait_(30)
	}
	SetApealPoint_Init(true)
	BatteleScript_End();
}

