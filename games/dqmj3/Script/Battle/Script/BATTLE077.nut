//ゆうきの斬舞・行動後動作演出（BattleCommonにSkip）

// 初期化
function Init()
{
	DebugPrint("BATTLE072_function_Init")
	BattleCommon_Init();
	LoadEffect();
	LoadEffect_("EF130_31_MAHOTORA_REC")
	LoadEffect_("EF030_10_TENSION01")
	
	gMultiCount <- 0;
	gMultiStageCount <- 0;
	
	cAction <- cActionInfo(gMultiCount)
	//単体用エフェクトの設定
	cAction.SingleActEffect0_Name	= "EF130_31_MAHOTORA_REC";
	cAction.SingleActEffect0_Frame	= 45;
	cAction.UpdateEffect(gMultiCount);
	
	Debug_cActionPrint(cAction)
	gAttack <- GetActorIndex_(0);
}

// 更新
function Update()
{
	DebugPrint("BATTLE072_function_Update")
	
	AfterAction()
	
	BatteleScript_End();
}

function AfterAction()
{
	
	
	//対象者の配置
	//local CameraFlag = true;
	//CharaStand_Target(CameraFlag,gMultiCount);
	
	local CharaStandFlag = true;
	local WaitFlag = false;
	LineEffect_Init(CharaStandFlag ,gMultiCount,gMultiStageCount,WaitFlag,cAction);
	Wait_(30)
}
