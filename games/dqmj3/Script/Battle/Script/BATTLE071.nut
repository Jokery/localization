//行動者エフェクト（BattleCommonにSkip）

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
	local EffectStartWait = 5
	Wait_(EffectStartWait);
	MonsterSizeEffect(cAction.Attack , cAction.SingleActEffect0_Name);
	MonsterSizeEffect(cAction.Attack , cAction.SingleActEffect1_Name);
	
	Wait_(cAction.EffectFrame)
		
	if(cAction.EffectFrame + EffectStartWait< 60){
		Wait_(60 - cAction.EffectFrame - EffectStartWait)
	}
	
	local CharaStand_Select = "Target"
	local CameraFlag = true;
	CharaStand(CharaStand_Select,CameraFlag,gMultiCount,cAction)
	Wait_(1)	//キャラ配置待ち
	local WaitFlag = true;
	local EffectFlag = false;
	LineEffect_SingleStage(gMultiCount,gMultiStageCount,cAction,WaitFlag,EffectFlag)
	SetApealPoint_Init(true)
	
	BatteleScript_End();
}

