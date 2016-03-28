// ゼロのしょうげき

// 初期化
function Init()
{
	DebugPrint("BATTLE086_" + "IN" + "_function_" + "Init")
	BattleCommon_Init();
	gAttack <- GetActorIndex_(0);
	gAttackSize <- GetMonsterSize_(gAttack);
	gMultiCount <- 0;		//連続行動カウント
	gMultiStageCount <- 0;	//多段攻撃カウント用
	
	ChangeIndexPointData_(PERSONAL_POINT_DATA);
	LoadEffect()
	DebugPrint("BATTLE086_" + "OUT" + "_function_" + "Init")
}

// 更新
function Update()
{
	DebugPrint("BATTLE086_" + "IN" + "_function_" + "Update")
	ChangeIndexPointData_(PERSONAL_POINT_DATA);
	DeleteAllTask_();
	SetVisibleNeedModel_();
	
	FirstSpellCast();
	//cAction <- cActionInfo(gMultiCount)
	//Debug_cActionPrint(cAction)
	
	gMultiCount++;
	SecondSpellCast();
	cAction <- cActionInfo(gMultiCount)
	//行動エフェクトを削除する
	cAction.AllActEffect0_Name	= null;
	cAction.AllActEffect0_Frame	= 10;
	cAction.UpdateEffect(gMultiCount)
	
	Debug_cActionPrint(cAction)
	
	local CharaStandFlag = true;
	local WaitFlag = true;
	
	ThirdSpellCut()
	
	BatteleScript_End();
	DebugPrint("BATTLE086_" + "OUT" + "_function_" + "Update")
}


//先攻詠唱カット
function FirstSpellCast()
{
	DebugPrint("BATTLE086_" + "IN" + "_function_" + "FirstSpellCast")
	local Actor = GetActorIndex_(gMultiCount)
	local NameVisibleFlag = true;
	ShowActionMessage(gMultiCount,NameVisibleFlag)
	CharaStand_PartyFull_CamCenter(IsAlly_(Actor),Actor);
	SpellCastEffect(Actor,gMultiCount)
	//ReplaySE_("SE_SHA_002");
	SetMotion_(Actor, MOT_SWORD_START, 4);
	SetCameraEffect_("EF000_03_SHUCHUSEN", 100);
	SetMotion_(Actor, MOT_SWORD_EXERCISE, 4);
	Task_ChangeMotion_(Actor, MOT_WAIT, 4);
	SetStatusChange_(gMultiCount,0)
	Wait_(30);
	DebugPrint("BATTLE086_" + "OUT" + "_function_" + "FirstSpellCast")
}

//後攻詠唱カット
function SecondSpellCast()
{
	DebugPrint("BATTLE086_" + "IN" + "_function_" + "SecondSpellCast")
	//敵側の表示
	DeleteAllTask_()
	DeleteAllActionName_();
	DeleteAllEffect_();
	local Actor = GetActorIndex_(gMultiCount)
	local NameVisibleFlag = true;
	
	//ゼロのしょうげきメッセージの表示
	ShowBattleEventMessage_(IsAlly_(Actor) , 61);	
	ShowActionMessage_IconAnimation(gMultiCount,Actor)
	
	CharaStand_PartyFull_CamCenter(IsAlly_(Actor),Actor);
	SpellCastEffect(Actor,gMultiCount)
	//ReplaySE_("SE_SHA_002");
	SetMotion_(Actor, MOT_SWORD_START, 4);
	SetCameraEffect_("EF000_03_SHUCHUSEN", 100);
	SetMotion_(Actor, MOT_SWORD_EXERCISE, 4);
	Task_ChangeMotion_(Actor, MOT_WAIT, 4);
	SetStatusChange_(gMultiCount,0)
	Wait_(30);
	DebugPrint("BATTLE086_" + "OUT" + "_function_" + "SecondSpellCast")
}

//対象者殺害カット
function ThirdSpellCut()
{
	DebugPrint("BATTLE086_" + "IN" + "_function_" + "ThirdSpellCut")
	local cParty			= cFullPartyInfo(GetActorIndex_(0))
	local SingleFlag		= true;
	local CamCenterMonster	= GetActorIndex_(0)
	//先行詠唱者カット（正面）
	DeleteAllTask_()
	DeleteAllActionName_();
	DeleteAllEffect_();
	CharaStand_PartyInfo(cParty , SingleFlag , CamCenterMonster)
	Wait_(1)
	LineEffect_Init(false,gMultiCount,gMultiStageCount,true,cAction)
	
}