//ó‘Ô‰ğœˆ—

// ‰Šú‰»
function Init()
{
	DebugPrint("BATTLE062_function_Init")
	BattleCommon_Init();
	LoadEffect();
	cAction <- cActionInfo(0);
	Debug_cActionPrint(cAction)
	ChangeIndexPointData_(PERSONAL_POINT_DATA);
	gMultiCount <- 0;
	gMultiStageCount <- 0;
	gIndexCount <- 0;
	gAttack <- GetActorIndex_(gMultiCount);
	gTarget <- GetTargetIndex_(gMultiCount ,gIndexCount)
	cTarget <- cMonsterInfo(gTarget)
}

// XV
function Update()
{
	DebugPrint("BATTLE062_function_Update")
	
	if(CheckDead() == false) {
		StateCheckFlag();
	}
	
	SetDamageEffect_ExceptionEffect(gMultiCount,cAction)
	SetApealPoint_Init(true)
	BatteleScript_End();
}

function CheckDead()
{
	if(IsDead_(gMultiCount, gIndexCount)) {
		local CharaStand_Select = "Target";
		local CameraFlag = true;
		if(GetStatusEndFlag_(STATUS.DEADACTION,gMultiCount,gIndexCount)) {
			ShowBattleEventMessage_(IsAlly_(gTarget) , GetStatusResetMessageId(STATUS.DEADACTION))
		}
		CharaStand(CharaStand_Select, CameraFlag, gMultiCount, cAction);
		SetDeadEffect(gIndexCount, true, false, gMultiCount, gMultiStageCount, false, cAction);
		Wait_(60);
		return true;
	}
	return false;
}

function StateCheckFlag()
{
	local isAlly = IsAlly_(gTarget);
	local isFirst = true;
	for(local y = STATUS_TOP ; y < STATUS_NUM ; y++){
		local StateFlag		= GetStatusFlag_(y, gMultiCount, gIndexCount);
		local StateEndFlag	= GetStatusEndFlag_(y, gMultiCount, gIndexCount);
		local StateValue	= GetStatusValue_(y, gMultiCount, gIndexCount);
		local NowStateValue	= GetMonsterStatusValue_(y, gTarget);
		
		if(StateEndFlag == true){
			//DebugPrint(("StateFlag[" + y + ",0,"+ gMultiCount +"] is End : " + StateFlag + "\n");
			if(IsStatusResetMessageVisible(y) == true){
				local CharaStand_Select = "Target";
				local CameraFlag = true;
				CharaStand(CharaStand_Select, CameraFlag, gMultiCount, cAction);
				if(isFirst){
					StartComboBattleEventMessage_(isAlly, GetStatusResetMessageId(y));
					isFirst = false;
				}else{
					AddBattleEventMessage_(isAlly, GetStatusResetMessageId(y));
				}
			}
			if(GetStatusResetWait(y) != 0){
				Wait_(GetStatusResetWait(y))
			}
		}
	}
	
	SetStatusChange_(gMultiCount, gIndexCount);
	
}