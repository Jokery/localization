//ＨＰ・ＭＰ自動回復（BattleCommonにSkip）

// 初期化
function Init()
{
	DebugPrint("BATTLE087_function_Init")
	BattleCommon_Init();
	LoadEffect();
	cAction <- cActionInfo(0)
	
	gMultiCount <- 0;
	gMultiStageCount <- 0;
	
	switch(GetDamageType_(gMultiCount,0))
	{
	case AFFECT_PARAM.HP:
		//ミラクルの場合
		//cAction.SingleActEffect0_Name			= "EF120_01_HOIMI";
		//cAction.SingleActEffect0_Frame			= 30;
		//cAction.SingleActEffect1_Name			= GetSingleEffectName_(Count,1);
		//cAction.SingleActEffect1_Frame		= GetSingleEffectFrame_(Count,1)
		//cAction.AllActEffect0_Name			= GetAllEffectName_(Count,0);
		//cAction.AllActEffect0_Frame			= GetAllEffectFrame_(Count,0);
		//cAction.AllActEffect1_Name			= GetAllEffectName_(Count,1);
		//cAction.AllActEffect1_Frame			= GetAllEffectFrame_(Count,1);
		//cAction.UpdateEffect(gMultiCount)
		//cAction.SingleActEffect0_SEFlag			= false;
		break;
	case AFFECT_PARAM.MP:
		//マホトラ
		//cAction.SingleActEffect0_Name			= "EF130_31_MAHOTORA_REC";
		//cAction.SingleActEffect0_Frame			= 45;
		//cAction.SingleActEffect1_Name			= GetSingleEffectName_(Count,1);
		//cAction.SingleActEffect1_Frame		= GetSingleEffectFrame_(Count,1)
		//cAction.AllActEffect0_Name			= GetAllEffectName_(Count,0);
		//cAction.AllActEffect0_Frame			= GetAllEffectFrame_(Count,0);
		//cAction.AllActEffect1_Name			= GetAllEffectName_(Count,1);
		//cAction.AllActEffect1_Frame			= GetAllEffectFrame_(Count,1);	
		//cAction.UpdateEffect(gMultiCount)
		break;	
	case AFFECT_PARAM.TS:
		//cAction.SingleActEffect0_Name			= "EF130_31_MAHOTORA_REC";
		//cAction.SingleActEffect0_Frame			= 45;
		//cAction.SingleActEffect1_Name			= GetSingleEffectName_(Count,1);
		//cAction.SingleActEffect1_Frame		= GetSingleEffectFrame_(Count,1)
		//cAction.AllActEffect0_Name			= GetAllEffectName_(Count,0);
		//cAction.AllActEffect0_Frame			= GetAllEffectFrame_(Count,0);
		//cAction.AllActEffect1_Name			= GetAllEffectName_(Count,1);
		//cAction.AllActEffect1_Frame			= GetAllEffectFrame_(Count,1);	
		//cAction.UpdateEffect(gMultiCount)
		break;		
	default:
		break;
	}
	
	Debug_cActionPrint(cAction)
	ChangeIndexPointData_(PERSONAL_POINT_DATA);
	
	gAttack <- GetActorIndex_(0);
}

// 更新
function Update()
{
	DebugPrint("BATTLE087_function_Update")
	
	DebugPrint("=========================");
	DebugPrint("AfterAction!");
	DebugPrint("=========================");
	
	AfterAction()
	
	BatteleScript_End();
}

function AfterAction()
{
	
	UnDispTolerChainRate_()
	
	//行動者カットを入れるか？
	if(cAction.SelfTargetFlag == false){
		local CharaStand_Select = "Action"
		local CameraFlag = true;
		CharaStand(CharaStand_Select , CameraFlag , gMultiCount,cAction);
		Wait_(60);
	}
	
	
	switch(GetDamageType_(gMultiCount,gMultiStageCount))
	{
	case AFFECT_PARAM.HP:
		//自動HP回復メッセージ
		ShowBattleFeatMessage_(IsAlly_(gAttack) , 23)
		break;
	case AFFECT_PARAM.MP:
		//自動MP回復メッセージ
		ShowBattleFeatMessage_(IsAlly_(gAttack) , 24)
		break;
	default:
		break;
	}	
	
	
	//CharaStand呼び出し判定用
	local CharaStandFlag = true;
	local WaitFlag = true;
	
	LineEffect_Init(CharaStandFlag ,gMultiCount,gMultiStageCount,WaitFlag,cAction);
	
}

