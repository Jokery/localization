//行動後動作演出（BattleCommonにSkip）

// 初期化
function Init()
{
	DebugPrint("BATTLE042_function_Init")
	BattleCommon_Init();
	gMultiCount <- 0;
	gMultiStageCount <- 0;
	gAttack <- GetActorIndex_(0);
	gNameVisibleFlag <- false
}

// 更新
function Update()
{
	DebugPrint("BATTLE042_function_Update")
	LoadEffect();
	LoadEffect_("EF000_03_SHUCHUSEN");
	cAction <- cActionInfo(0);
	Debug_cActionPrint(cAction)
	ChangeIndexPointData_(PERSONAL_POINT_DATA);
	AfterAction()
	
	BatteleScript_End();
}

function AfterAction()
{
	
	//行動者カットを入れるか？
	if(cAction.SelfTargetFlag == false){
		ShowActionMessage_NoAllow(gMultiCount,gNameVisibleFlag)
		local CharaStand_Select = "Action"
		local CameraFlag = true;
		CharaStand(CharaStand_Select , CameraFlag , gMultiCount,cAction);
		//SetMotion_(cAction.Attack , MOT_SWORD_START , 4)
		//Wait_(15);
		//SetMotion_(cAction.Attack , MOT_SWORD_CHARGE , 4)
		//Wait_(30);
		SetMotion_(cAction.Attack , MOT_SWORD_EXERCISE , 4)
		SetCameraEffect_("EF000_03_SHUCHUSEN", 100);
		Wait_(45);
		DeleteAllEffect_()
	} else {
		ShowActionMessage_NoAllow(gMultiCount,gNameVisibleFlag);
	}
	
	//CharaStand呼び出し判定用
	local CharaStandFlag = true;
	local WaitFlag = true;
	
	local SingleAttackFlag = false;
	Exception_2ndCheck(gMultiCount,SingleAttackFlag,cAction)
	LineEffect_Init(CharaStandFlag ,gMultiCount,gMultiStageCount,WaitFlag,cAction);
	Wait_(20)
}

function StateChangeCheck()
{
	local Flag		= false;
	
	//ステータス変化が発生したかを確認する
	for(local IndexCount = 0 ; IndexCount < GetTargetNum_(gMultiCount) ; IndexCount++){
		local Target	= GetTargetIndex_(gMultiCount, IndexCount);
		for(local State = STATUS_TOP ; State < STATUS_NUM ; State++){
			local StateFlag			= GetStatusFlag_(State,gMultiCount,IndexCount);
			local StateEndFlag		= GetStatusEndFlag_(State,gMultiCount,IndexCount);
			local StateValue		= GetStatusValue_(State,gMultiCount,IndexCount);
			//ステータスに変更があったか？
			if(StateFlag == true && StateValue != 0 && StateEndFlag == false){
				Flag = true;
			}
		}
	}
	return Flag;
}