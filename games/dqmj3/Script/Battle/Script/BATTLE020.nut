// �����i�o�b�j�p

// ������
function Init()
{
	BattleCommon_Init();
	//�G�t�F�N�g
	LoadEffect_("EF000_14_SMOKE_FOOT");
	gMaster <- GetFallMaster_();		// �}�X�^�[
	gMasterKind <- GetMasterKind_(IsAlly_(gMaster))
}

// �X�V
function Update()
{

	SlipEffect_01()
	
	DeleteAllActionName_();
	
	BatteleScript_End();
}

function PlayFallSE()
{
	ReplaySE_("SE_BTL_150");
}

function SlipEffect_01()
{
	local ALLY_FALL_MESSAGE = 582;
	local ENEMY_FALL_MESSAGE = 583;

	SetVisible_(gMaster, true);
	
	PlayFallSE();
	
	//���ׂẴ����X�^�[���\����
	for(local i = 0 ; i < 4 ; i++){
		if(GetAllyIndex_(i) != INVALID_CHARACTER){SetVisible_(GetAllyIndex_(i),false)}
		if(GetEnemyIndex_(i) != INVALID_CHARACTER){SetVisible_(GetEnemyIndex_(i),false)}
	}
	
	//�G����Master���\����
	local EnemyMaster;
	if(IsAlly_(gMaster)){
		EnemyMaster = GetEnemyMaster_()
	} else {
		EnemyMaster = GetAllyMaster_()
	}
	if(EnemyMaster != INVALID_CHARACTER){
		SetVisible_(EnemyMaster , false)
	}
	
	//�J�����ʒu
	switch(gMasterKind)
	{
	//�l�^
	case MASTER_KIND.PLAYER:
	case MASTER_KIND.RENATE:
	case MASTER_KIND.RUKIYA:
	case MASTER_KIND.DARK_MASTER:
	case MASTER_KIND.RESISTANCE_MAN:
	case MASTER_KIND.RESISTANCE_WOMAN:
	case MASTER_KIND.RESISTANCE_GENTLEMAN:
	case MASTER_KIND.IMMIGRANT_MAN:
	case MASTER_KIND.IMMIGRANT_WOMAN:
	case MASTER_KIND.IMMIGRANT_BOY:
	case MASTER_KIND.COOL:
	case MASTER_KIND.SYNTHE:
		Task_AnimeMoveCamera_("camera_Human", "camtgt_Human");
		break;
	//�m�`���[��
	case MASTER_KIND.NOTYORIN:
	case MASTER_KIND.NOTYORA_WOMEN:
	case MASTER_KIND.KING:
	case MASTER_KIND.JACK:
	case MASTER_KIND.ACE:
	case MASTER_KIND.ADVENTURER:
	case MASTER_KIND.ADVENTURER_BLUE:
	case MASTER_KIND.ADVENTURER_GREEN:
	case MASTER_KIND.ADVENTURER_YELLOW:
	case MASTER_KIND.ADVENTURER_ORANGE:
	case MASTER_KIND.ADVENTURER_PURPLE:
	case MASTER_KIND.ADVENTURER_BLACK:
	case MASTER_KIND.QUEEN:
		Task_AnimeMoveCamera_("camera_Notyora", "camtgt_Notyora");
		break;
	//Mii
	case MASTER_KIND.MII:
		Task_AnimeMoveCamera_("camera_Mii", "camtgt_Mii");
		break;
	//���̃}�X�^�[�͗������Ȃ�
	case MASTER_KIND.NONE:	
	case MASTER_KIND.PROMETHEUS:
		break;
	}

	//�}�X�^�[�؂藣������
	RideOffMaster_(gMaster);
	
	//�}�X�^�[��]
	SetDir_(gMaster, 0);
	
	//�}�X�^�[�@���[�V�����@�z�u
	SetPointPos_(gMaster, "pos_103_master");
	SetMotion_(gMaster, MOT_SLIP_LOOP, 0);
	//Task_ChangeMotion_(gMaster, MOT_SLIP_LOOP, 4);	
	
	//�����G�t�F�N�g
	local effect= SetBoneEffect_("EF000_14_SMOKE_FOOT", gMaster);
	
	local isAlly = IsAlly_(gMaster);
	if(isAlly){
		ShowBattleEventMessage_(isAlly, ALLY_FALL_MESSAGE);
	}else{
		ShowBattleEventMessage_(isAlly, ENEMY_FALL_MESSAGE);
	}
	
	Wait_(30)
	
	//����̍����G�t�F�N�g����������
	DeleteEffectEmitter_(effect);
	
	Wait_(60)
	SetApealPoint_Init(true)

}