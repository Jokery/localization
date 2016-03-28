//�X�J�E�g�������o

// ������
function Init()
{
	DebugPrint("BATTLE074_function_" + "Init")
	BattleCommon_Init();
	LoadEffect();
	LoadEffect_("EF030_02_STATUS_HEART")
	
	//�X�J�E�gUI�̕\��
	SetVisibleScoutGauge_(true);
	FilterOn_(0, 0, 0, 100);
}

// �X�V
function Update()
{
	DebugPrint("BATTLE074_function_" + "Update")
	ScoutActorEffect();
	ScoutTargetEffect();
	BatteleScript_End();
}

//�s���Ґ��ʃJ�b�g
function ScoutActorEffect()
{
	DebugPrint("BATTLE074_function_" + "Update")
	DeleteAllActionName_();
	ShowBattleEventMessage_(true , 5)
	local Actor = GetActorIndex_(0)
	CharaStand_PartyFull_CamCenter(IsAlly_(Actor),Actor);
	Wait_(45)
}


//�ΏێҐ��ʃJ�b�g
function ScoutTargetEffect()
{
	DebugPrint("BATTLE074_function_" + "Update")
	
	local Target	= GetTargetIndex_(0,0)
	
	CharaStand_ScoutTarget();
	Wait_(10);
	MonsterSizeEffect(Target,"EF030_02_STATUS_HEART")
	
	//�X�J�E�g�Q�[�W�̍X�V
	//DebugPrint(("GetScoutFeatValue_() : " + GetScoutFeatValue_() + "\n")
	AddScoutGaugeValue_(GetScoutFeatValue_())
	while(IsFinishScoutGaugeAnime_() != true)
	{
		Wait_(1)
		UpdateScoutGauge_();
		//DebugPrint(("IsFinishScoutGaugeAnime_() : " + IsFinishScoutGaugeAnime_() + "\n")
	}
	Wait_(20)
	
}