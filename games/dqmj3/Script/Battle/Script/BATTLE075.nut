// �X�J�E�g����

// ������
function Init()
{
	DebugPrint("BATTLE075_function_Init")
	BattleCommon_Init();
	gMultiCount <- 0;
	UnSettingArrowTargetAll_();//�s���҂̖���S���폜
}

// �X�V
function Update()
{
	DebugPrint("BATTLE075_function_Update")
	local CameraFlag = true;
	CharaStand_ScoutTarget()
	FilterOff_(0, 0, 0, 0);
	//FilterOn_(0, 0, 0, 100);
	Wait_(30)
	
	// �X�J�E�g�Q�[�W�̔��艉�o
	local ScoutGage = GetScoutGaugeValue_();
	if(ScoutGage == 1000){
		//�P�O�O�����o
		ScoutGaugePlayAnimMax_();
		ReplaySE_("SE_BTL_233")
		while(IsFinishScoutGaugeAnime_() != true)
		{
			Wait_(1);
			UpdateScoutGauge_();
		}
		Wait_(20);
	} else if(ScoutGage == 0){
		//�O�����o
		ScoutGaugePlayAnimPulsation_();
		while(IsFinishScoutGaugeAnime_() != true)
		{
			Wait_(1);
			UpdateScoutGauge_();
		}
		Wait_(30);
	} else {
		//�ʏ펞
		for(local i = 0 ; i < 3 ; i++){
			ScoutGaugePlayAnimPulsation_();
			ReplaySE_("SE_BTL_062")
			while(IsFinishScoutGaugeAnime_() != true)
			{
				Wait_(1);
				UpdateScoutGauge_();
			}
			Wait_(30);
		}
	}
	
	// �X�J�E�g�Q�[�W�폜
	SetVisibleScoutGauge_(false);
	DeleteScoutGauge_();
	
	// ���茋�ʕ\��
	if(IsScoutSuccess_() == true){
		ScoutSuccess()
	} else {
		ScoutFailure()
	}
	
	EndTryScoutScene_();
	BatteleScript_End();
}

//�X�J�E�g����
function ScoutSuccess()
{
	//DeleteAllActionName_();
	ShowBattleEventMessage_(true , 0)
	StopBgmSub_(18);
	
	local Target	= GetTargetIndex_(0,0)
	local AllyFlag	= IsAlly_(Target)
	local MasterIndex = GetAllyMaster_();
	if(IsAlly_(Target) != true){
		MasterIndex = GetEnemyMaster_();
	}
	if(AllyFlag == false){MasterIndex = GetEnemyMaster_();}
	//DebugPrint("MasterIndex	: " + MasterIndex + "\n")
	//RideOffMaster_(MasterIndex);
	Task_ObjectFadeOut_(MasterIndex, 30);
	
	Wait_(6)
	PlayMe_("ME_011");
	Wait_(30)
}

//�X�J�E�g���s
function ScoutFailure()
{
	ShowBattleEventMessage_(false , 1)
	Wait_(30)
}

