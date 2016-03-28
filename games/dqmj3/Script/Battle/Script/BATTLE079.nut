// スカウト怒り

// 初期化
function Init()
{
	DebugPrint("BATTLE079_function_Init")
	BattleCommon_Init();
	gMultiCount <- 0;
	
	LoadEffect_("EF120_01_HOIMI")
	LoadEffect_("EF030_10_TENSION01")

}

// 更新
function Update()
{
	DebugPrint("BATTLE079_function_Update")
	local CameraFlag = true;
	
	CharaStand_PartyFull(true,false)
	CharaStand_NonCamera(false);
	Wait_(10)
	
	DeleteAllActionName_();
	if(IsScoutTargetSideAngry_() == true){
		//怒り
		ShowBattleEventMessage_(false , 6)
		ScoutStateCheck()
		Wait_(45)
	} else {
		//様子を見ている
		ShowBattleEventMessage_(false , 3)
		Wait_(45)
	}
	
	BatteleScript_End();
}

function ScoutStateCheck()
{
	for(local IndexCount = 0 ; IndexCount < 4 ; IndexCount++){
		for(local y = STATUS_TOP ; y < STATUS_NUM ; y += 1){	//StateListの１つ目の値はダメージなので無視する
			local EnemyIndex		= GetEnemyIndex_(IndexCount)
			//local cTarget			= cMonsterInfo(EnemyIndex)
			local StateFlag			= GetStatusFlag_(y,gMultiCount,IndexCount);
			local StateEndFlag		= GetStatusEndFlag_(y,gMultiCount,IndexCount);
			local StateValue		= GetStatusValue_(y,gMultiCount,IndexCount);
			local NowStateValue		= GetMonsterStatusValue_(y,EnemyIndex);
			local StateEndFlag		= GetStatusEndFlag_(y,gMultiCount,IndexCount);
			//ステータス変化があった場合
			if(StateFlag == true && StateValue != 0 && StateEndFlag == false){
				if(StateValue > 0){
					switch(y)
					{
					case STATUS.TENSION:
						local Target = GetTargetIndex_(gMultiCount,IndexCount)
						MonsterSizeEffect(Target,"EF030_10_TENSION01")
						SetStateEffect_TensionPop(gMultiCount , IndexCount , true)
						break;
					default:
						break;
					}
				}
			}
		}
		SetStatusChange_(gMultiCount, IndexCount);
	}
	SetApealPoint_Init(true)
}