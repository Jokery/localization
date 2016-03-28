//相殺

// 初期化
function Init()
{
	DebugPrint("BATTLE072_function_Init")
	BattleCommon_Init();
	LoadEffect();
	//相殺エフェクト
	LoadEffect_("EF130_31_MAHOTORA_REC")
	LoadEffect_("EF000_18_OFFSET_SCREEN")
	
	gMultiCount <- 0;
	gMultiStageCount <- 0;
	
}

// 更新
function Update()
{
	DebugPrint("BATTLE072_function_Update")

	FirstSpellCast()
	CutReset()
	gMultiCount += 1;
	SecondSpellCast()
	CutReset()
	OffsetCast()
	BatteleScript_End();
}

//先攻詠唱カット
function FirstSpellCast()
{
	local Actor = GetActorIndex_(gMultiCount)
	local NameVisibleFlag = false;
	ShowOffsetMessage(gMultiCount)
	CharaStand_PartyFull_CamCenter(IsAlly_(Actor),Actor);
	SpellCastEffect(Actor,gMultiCount)
	//ReplaySE_("SE_SHA_002");
	SetMotion_(Actor, MOT_SWORD_START, 4);
	SetCameraEffect_("EF000_03_SHUCHUSEN", 100);
	SetMotion_(Actor, MOT_SWORD_EXERCISE, 4);
	Task_ChangeMotion_(Actor, MOT_WAIT, 4);
	SetStatusChange_(gMultiCount,0)
	Wait_(30);
}

//後攻詠唱カット
function SecondSpellCast()
{
	//敵側の表示
	DeleteAllActionName_();
	local Actor = GetActorIndex_(gMultiCount)
	local NameVisibleFlag = false;
	ShowOffsetMessage(gMultiCount)
	CharaStand_PartyFull_CamCenter(IsAlly_(Actor),Actor);
	SpellCastEffect(Actor,gMultiCount)
	//ReplaySE_("SE_SHA_002");
	SetMotion_(Actor, MOT_SWORD_START, 4);
	SetCameraEffect_("EF000_03_SHUCHUSEN", 100);
	SetMotion_(Actor, MOT_SWORD_EXERCISE, 4);
	Task_ChangeMotion_(Actor, MOT_WAIT, 4);
	SetStatusChange_(gMultiCount,0)
	Wait_(30);
}

//相殺カット
function OffsetCast()
{
	DeleteAllActionName_();
	CharaStand_PartyFull(true,false);
	local cParty = cFullPartyInfo(GetEnemyIndex_(0));
	local Actor = GetActorIndex_(gMultiCount)
	//ReplaySE_("SE_SHA_002");
	ShowBattleEventMessage_(false, 12);
	Wait_(10)
	SetCameraEffect_("EF000_18_OFFSET_SCREEN",150)
	
	SetMotion_(Actor, MOT_WAIT, 1);
	//Wait_(75);
	Wait_(90);
	SetApealPoint_Init(true)
}

//相殺メッセージ表示
function ShowOffsetMessage(MultiCount)
{
	//DebugPrint("BattleCommon_" + "IN" + "_function_" + "ShowActionMessage");
	//DebugPrint("	=>	MultiCount		: " + MultiCount);
	//DebugPrint("	=>	NameVisibleFlag	: " + NameVisibleFlag);
	//MultiCoun			: 何回目の行動か？
	//NameVisibleFlag	: １回目の行動限定で行動名を表示するか？
	local ActionNum = GetActionNum_();
	
	if(IsScout_()){
		//スカウト時には行動名を表示しない
	} else {
		//行動名を表示する
		ShowActionName_(MultiCount)
	}
	
	local UsedMP = GetUseMp_(MultiCount);
	local ActorIndex = GetActorIndex_(MultiCount);
	SetMpDamage_(ActorIndex, UsedMP);
	
	SetTolerChainRate_(MultiCount)
	
	//行動名表示に合わせて下画面のモンスターアイコンを揺らす
	ShowActionMessage_IconAnimation(MultiCount,ActorIndex)
	
	//行動名表示に合わせて下画面の矢印アイコンを消す
	if(IsScout_()){
		//スカウトアタックの場合は矢印を消さない
	} else {
		UnSettingAllowTarget_(ActorIndex);
	}
	//DebugPrint("BattleCommon_" + "OUT" + "_function_" + "ShowActionMessage");
}
