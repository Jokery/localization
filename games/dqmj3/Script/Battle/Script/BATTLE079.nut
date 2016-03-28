// �X�J�E�g�{��

// ������
function Init()
{
	DebugPrint("BATTLE079_function_Init")
	BattleCommon_Init();
	gMultiCount <- 0;
	
	LoadEffect_("EF120_01_HOIMI")
	LoadEffect_("EF030_10_TENSION01")

}

// �X�V
function Update()
{
	DebugPrint("BATTLE079_function_Update")
	local CameraFlag = true;
	
	CharaStand_PartyFull(true,false)
	CharaStand_NonCamera(false);
	Wait_(10)
	
	DeleteAllActionName_();
	if(IsScoutTargetSideAngry_() == true){
		//�{��
		ShowBattleEventMessage_(false , 6)
		ScoutStateCheck()
		Wait_(45)
	} else {
		//�l�q�����Ă���
		ShowBattleEventMessage_(false , 3)
		Wait_(45)
	}
	
	BatteleScript_End();
}

function ScoutStateCheck()
{
	for(local IndexCount = 0 ; IndexCount < 4 ; IndexCount++){
		for(local y = STATUS_TOP ; y < STATUS_NUM ; y += 1){	//StateList�̂P�ڂ̒l�̓_���[�W�Ȃ̂Ŗ�������
			local EnemyIndex		= GetEnemyIndex_(IndexCount)
			//local cTarget			= cMonsterInfo(EnemyIndex)
			local StateFlag			= GetStatusFlag_(y,gMultiCount,IndexCount);
			local StateEndFlag		= GetStatusEndFlag_(y,gMultiCount,IndexCount);
			local StateValue		= GetStatusValue_(y,gMultiCount,IndexCount);
			local NowStateValue		= GetMonsterStatusValue_(y,EnemyIndex);
			local StateEndFlag		= GetStatusEndFlag_(y,gMultiCount,IndexCount);
			//�X�e�[�^�X�ω����������ꍇ
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