// �����S�́i���j

// ������
function Init()
{
	DebugPrint("BATTLE013_function_Init");
	BattleCommon_Init();
	gAttack <- GetActorIndex_(0);			// �U�����鑤
	gAttackSize <- GetMonsterSize_(gAttack);		//
	if(IsScout_()){
		cAction <- null;
	} else {
		cAction <- cActionInfo(0)
		Debug_cActionPrint(cAction)
		ChangeIndexPointData_(PERSONAL_POINT_DATA);
	}
	
	LoadEffect_("EF000_03_SHUCHUSEN");
	LoadEffect();
	gMultiCount <- 0;
	gMultiStageCount <- 0;
	
	//Script�J�n���`�F�b�N
	ScriptStartCheck()

}

// �X�V
function Update()
{
	DebugPrint("BATTLE013_function_Update");
	StandbyCut_Magic(gMultiCount,cAction);
	ChangeIndexPointData_(PERSONAL_POINT_DATA);
	DeleteAllTask_();
	SetVisibleNeedModel_();
	
	//CharaStandy�Ăяo������p
	local CharaStandFlag = true;
	
	local AttackEmptyS;
	local AttackEmptyN;
	local AttackEmptyM;
	local AttackEmptyG;
	local AttackEmptyT;
	local CameraEmptyS;
	local CameraEmptyN;
	local CameraEmptyM;
	local CameraEmptyG;
	local CameraEmptyT;
	local CameraEmptyT_Low;
	local CameraEmptyT_High;
	local CameraTargetEmptyS;
	local CameraTargetEmptyN;
	local CameraTargetEmptyM;
	local CameraTargetEmptyG;
	local CameraTargetEmptyT;
	local CameraTargetEmptyT_Low;
	local CameraTargetEmptyT_High;
	local SizeWaitS = 30;
	local SizeWaitN = 30;
	local SizeWaitM = 45;
	local SizeWaitG = 60;
	local SizeWaitT = 75;
	local AllyFlag = IsAlly_(gAttack);
	
	//�㋉�����̕���
	local HighRank = IsHighRankSpell_(0);
	local EffectEmptyS;
	local EffectEmptyN;
	local EffectEmptyM;
	local EffectEmptyG;
	local EffectEmptyT;
	if(AllyFlag == true){
		AttackEmptyS			= "move_101_ALLY_S";
		AttackEmptyN			= "move_101_ALLY_S";		//N��S�͓����G�t�F�N�g
		AttackEmptyM			= "move_102_ALLY_M";
		AttackEmptyG			= "move_103_ALLY_G";
		AttackEmptyT			= "move_104_ALLY_T";
		CameraEmptyS			= "camera_001_ALLYS";
		CameraEmptyN			= "camera_001_ALLYS";		//N��S�͓����G�t�F�N�g
		CameraEmptyM			= "camera_002_ALLYM";
		CameraEmptyG			= "camera_003_ALLYG";
		CameraEmptyT			= "camera_004_ALLYT";
		CameraEmptyT_Low		= "camera_004_ALLYT_LOW";
		CameraEmptyT_High		= "camera_004_ALLYT";
		CameraTargetEmptyS		= "camtgt_001_ALLYS";
		CameraTargetEmptyN		= "camtgt_001_ALLYS";	//N��S�͓����G�t�F�N�g
		CameraTargetEmptyM		= "camtgt_002_ALLYM";
		CameraTargetEmptyG		= "camtgt_003_ALLYG";
		CameraTargetEmptyT		= "camtgt_004_ALLYT";
		CameraTargetEmptyT_Low	= "camtgt_004_ALLYT_LOW";
		CameraTargetEmptyT_High	= "camtgt_004_ALLYT";
		EffectEmptyS			= "pos_301_ALLYEffectS";
		EffectEmptyN			= "pos_302_ALLYEffectN";
		EffectEmptyM			= "pos_303_ALLYEffectM";
		EffectEmptyG			= "pos_304_ALLYEffectG";
		EffectEmptyT			= "pos_305_ALLYEffectT";
	} else {
		AttackEmptyS			= "move_151_ENEMY_S";
		AttackEmptyN			= "move_151_ENEMY_S";		//N��S�͓����G�t�F�N�g
		AttackEmptyM			= "move_152_ENEMY_M";
		AttackEmptyG			= "move_153_ENEMY_G";
		AttackEmptyT			= "move_154_ENEMY_T";
		CameraEmptyS			= "camera_011_ENEMYS";
		CameraEmptyN			= "camera_011_ENEMYS";		//N��S�͓����G�t�F�N�g
		CameraEmptyM			= "camera_012_ENEMYM";
		CameraEmptyG			= "camera_013_ENEMYG";
		CameraEmptyT			= "camera_014_ENEMYT";
		CameraEmptyT_Low		= "camera_014_ENEMYT_LOW";
		CameraEmptyT_High		= "camera_014_ENEMYT";
		CameraTargetEmptyS		= "camtgt_011_ENEMYS";
		CameraTargetEmptyN		= "camtgt_011_ENEMYS";		//N��S�͓����G�t�F�N�g
		CameraTargetEmptyM		= "camtgt_012_ENEMYM";
		CameraTargetEmptyG		= "camtgt_013_ENEMYG";
		CameraTargetEmptyT		= "camtgt_014_ENEMYT";
		CameraTargetEmptyT_Low	= "camtgt_014_ENEMYT_Low";
		CameraTargetEmptyT_High	= "camtgt_014_ENEMYT";
		EffectEmptyS			= "pos_351_ENEMYEffectS";
		EffectEmptyN			= "pos_352_ENEMYEffectN";
		EffectEmptyM			= "pos_353_ENEMYEffectM";
		EffectEmptyG			= "pos_354_ENEMYEffectG";
		EffectEmptyT			= "pos_355_ENEMYEffectT";
	}
	
	//�r�T�C�Y�̏ꍇ
	if(gAttackSize == SIZE_S){
		//�����̐ݒ�
		local CameraNum = CameraEmptyS;
		local CameraTargetNum = CameraTargetEmptyS;
		local CharaPoint = AttackEmptyS;
		local EffectEmpty = EffectEmptyS;
		local SizeWait = SizeWaitS;
		SwordCast(CameraNum,CameraTargetNum,CharaPoint,SizeWait,EffectEmpty)
	//�m�T�C�Y�̏ꍇ
	} else if(gAttackSize == SIZE_N ){
		//�����̐ݒ�
		local CameraNum = CameraEmptyN;
		local CameraTargetNum = CameraTargetEmptyN;
		local CharaPoint = AttackEmptyN;
		local EffectEmpty = EffectEmptyN;
		local SizeWait = SizeWaitN;
		SwordCast(CameraNum,CameraTargetNum,CharaPoint,SizeWait,EffectEmpty)
	//�l�T�C�Y�̏ꍇ
	} else if(gAttackSize == SIZE_M ){
		//�����̐ݒ�
		local CameraNum = CameraEmptyM;
		local CameraTargetNum = CameraTargetEmptyM;
		local CharaPoint = AttackEmptyM;
		local EffectEmpty = EffectEmptyM;
		local SizeWait = SizeWaitM;
		SwordCast(CameraNum,CameraTargetNum,CharaPoint,SizeWait,EffectEmpty)
	//�f�T�C�Y�̏ꍇ
	} else if(gAttackSize == SIZE_G ){
		//�����̐ݒ�
		local CameraNum = CameraEmptyG;
		local CameraTargetNum = CameraTargetEmptyG;
		local CharaPoint = AttackEmptyG;
		local EffectEmpty = EffectEmptyG;
		local SizeWait = SizeWaitG;
		SwordCast(CameraNum,CameraTargetNum,CharaPoint,SizeWait,EffectEmpty)
	//�s�T�C�Y�̏ꍇ
	} else {
		//�����̐ݒ�
		local CameraNum = CameraEmptyT;
		local CameraTargetNum = CameraTargetEmptyT;
		local CharaPoint = AttackEmptyT;
		local EffectEmpty = EffectEmptyT;
		local SizeWait = SizeWaitT;
		SwordCast(CameraNum,CameraTargetNum,CharaPoint,SizeWait,EffectEmpty)
	}
	
	if(IsScout_() == false){
		if(cAction.SelfTargetFlag== true){
			CharaStandFlag = false;
		}
	}
	
	local CharaStandFlag = true;		//�L�����̔z�u�͍s��Ȃ�
	local WaitFlag = true;				//���o�I����҂�
	
	local SingleAttackFlag = false;
	Exception_2ndCheck(gMultiCount,SingleAttackFlag,cAction)
	LineEffect_Init(CharaStandFlag ,gMultiCount,gMultiStageCount,WaitFlag,cAction);
	
	BatteleScript_End();
}

//�̋Z�r�����o
function SwordCast(CameraNum,CameraTargetNum,CharaPoint,SizeWait,EffectEmpty)
{
	DebugPrint("BATTLE013_function_SwordCast");
	local AllyFlag = IsAlly_(gAttack);
	
	//gCameraTask <- Task_AnimeMoveCamera_(CameraNum,CameraTargetNum);
	//Task_AnimeMoveCharNoDir_(gAttack, CharaPoint);
	
	//�r���p�G�t�F�N�g�̕\��
	SpellCastEffect(gAttack,gMultiCount)

	//�p�[�e�B���̎擾
	local PartyType = Get_PartyType(AllyFlag);
	local PartyNum = Get_PartyNum(AllyFlag);
	
	//�z�uEmpty�̗p��
	local AttackS_PartyS4_00;
	local AttackS_PartyS4_01;
	local AttackS_PartyS4_02;
	local AttackS_PartyS4_03;
	local AttackS_PartyS3_00;
	local AttackS_PartyS3_01;
	local AttackS_PartyS3_02;
	local AttackS_PartyG_00;
	local AttackS_Master;
	local AttackG_Master;
	local AttackT_Master;
	
	local Party00;
	local Party01;
	local Party02;
	local Master;
	
	local MonsterIndexNum0;
	local MonsterIndexNum1;
	local MonsterIndexNum2;
	local MonsterIndexNum3;
	
	local AllyFlag = IsAlly_(gAttack);
	if(AllyFlag == true){
		AttackS_PartyS4_00 = "move_111_ALLYPartyS4_00";
		AttackS_PartyS4_01 = "move_112_ALLYPartyS4_01";
		AttackS_PartyS4_02 = "move_113_ALLYPartyS4_02";
		AttackS_PartyS4_03 = "move_114_ALLYPartyS4_03";
		AttackS_PartyS3_00 = "move_115_ALLYPartyS3_00";
		AttackS_PartyS3_01 = "move_116_ALLYPartyS3_01";
		AttackS_PartyS3_02 = "move_117_ALLYPartyS3_02";
		AttackS_PartyG_00 = "move_118_ALLYPartyG_00";
		AttackS_Master = "move_101_ALLY_S_Master"
		AttackG_Master = "move_103_ALLY_G_Master"
		AttackT_Master = "move_104_ALLY_T_Master"
		MonsterIndexNum0 = GetAllyIndex_(0);
		MonsterIndexNum1 = GetAllyIndex_(1);
		MonsterIndexNum2 = GetAllyIndex_(2);
		MonsterIndexNum3 = GetAllyIndex_(3);
		Master = GetAllyMaster_();
	} else {
		AttackS_PartyS4_00 = "move_161_ENEMYPartyS4_00";
		AttackS_PartyS4_01 = "move_162_ENEMYPartyS4_01";
		AttackS_PartyS4_02 = "move_163_ENEMYPartyS4_02";
		AttackS_PartyS4_03 = "move_164_ENEMYPartyS4_03";
		AttackS_PartyS3_00 = "move_165_ENEMYPartyS3_00";
		AttackS_PartyS3_01 = "move_166_ENEMYPartyS3_01";
		AttackS_PartyS3_02 = "move_167_ENEMYPartyS3_02";
		AttackS_PartyG_00 = "move_168_ENEMYPartyG_00";
		AttackS_Master = "move_151_ENEMY_S_Master"
		AttackG_Master = "move_153_ENEMY_G_Master"
		AttackT_Master = "move_154_ENEMY_T_Master"
		MonsterIndexNum0 = GetEnemyIndex_(0);
		MonsterIndexNum1 = GetEnemyIndex_(1);
		MonsterIndexNum2 = GetEnemyIndex_(2);
		MonsterIndexNum3 = GetEnemyIndex_(3);
		Master = GetEnemyMaster_();
	}
	
	//�p�[�e�B�����X�^�[�C���f�b�N�X�̎擾
	if(PartyNum >= 1){
	} else {}
	if(PartyNum >= 2){
		Party00 = GetExtra(gAttack,0);
		ChangeIndexPointData_(PERSONAL_POINT_DATA);
	} else {}
	if(PartyNum >= 3){
		Party01 = GetExtra(gAttack,1);
		ChangeIndexPointData_(PERSONAL_POINT_DATA);
	} else {}
	if(PartyNum >= 4){
		Party02 = GetExtra(gAttack,2);
		ChangeIndexPointData_(PERSONAL_POINT_DATA);
	} else {}
	
	if(gAttackSize == SIZE_S || gAttackSize == SIZE_M || gAttackSize == SIZE_N){
		if(PartyType == PARTYTYPE.S4){		//S4
			//�����X�^�[�C���f�b�N�X����z�u�ꏊ��ύX
			if(Party00 == MonsterIndexNum0){
				SetMonster_Empty(Party00,AttackS_PartyS4_00,null);
			} else if(Party00 == MonsterIndexNum1){
				SetMonster_Empty(Party00,AttackS_PartyS4_01,null);
			} else if(Party00 == MonsterIndexNum2){
				SetMonster_Empty(Party00,AttackS_PartyS4_02,null);
			} else if(Party00 == MonsterIndexNum3){
				SetMonster_Empty(Party00,AttackS_PartyS4_03,null);
			} else {}
			if(Party01 == MonsterIndexNum0){
				SetMonster_Empty(Party01,AttackS_PartyS4_00,null);
			} else if(Party01 == MonsterIndexNum1){
				SetMonster_Empty(Party01,AttackS_PartyS4_01,null);
			} else if(Party01 == MonsterIndexNum2){
				SetMonster_Empty(Party01,AttackS_PartyS4_02,null);
			} else if(Party01 == MonsterIndexNum3){
				SetMonster_Empty(Party01,AttackS_PartyS4_03,null);
			} else {}
			if(Party02 == MonsterIndexNum0){
				SetMonster_Empty(Party02,AttackS_PartyS4_00,null);
			} else if(Party02 == MonsterIndexNum1){
				SetMonster_Empty(Party02,AttackS_PartyS4_01,null);
			} else if(Party02 == MonsterIndexNum2){
				SetMonster_Empty(Party02,AttackS_PartyS4_02,null);
			} else if(Party02 == MonsterIndexNum3){
				SetMonster_Empty(Party02,AttackS_PartyS4_03,null);
			} else {}
			SetMaster_Empty(Master,AttackS_Master,null);
		} else {}
		if(PartyType == PARTYTYPE.S3){		//S3
			if(Party00 == MonsterIndexNum0){
				SetMonster_Empty(Party00,AttackS_PartyS3_00,null);
			} else if(Party00 == MonsterIndexNum1){
				SetMonster_Empty(Party00,AttackS_PartyS3_01,null);
			} else if(Party00 == MonsterIndexNum2){
				SetMonster_Empty(Party00,AttackS_PartyS3_02,null);
			} else {}
			if(Party01 == MonsterIndexNum0){
				SetMonster_Empty(Party01,AttackS_PartyS3_00,null);
			} else if(Party01 == MonsterIndexNum1){
				SetMonster_Empty(Party01,AttackS_PartyS3_01,null);
			} else if(Party01 == MonsterIndexNum2){
				SetMonster_Empty(Party01,AttackS_PartyS3_02,null);
			} else {}
			SetMaster_Empty(Master,AttackS_Master,null);
		} else {}
		if(PartyType == PARTYTYPE.S2){		//S2
			if(Party00 == MonsterIndexNum0){
				SetMonster_Empty(Party00,AttackS_PartyS3_00,null);
			} else if(Party00 == MonsterIndexNum1){
				SetMonster_Empty(Party00,AttackS_PartyS3_02,null);
			} else {}
			SetMaster_Empty(Master,AttackS_Master,null);
		} else {}
		if(PartyType == PARTYTYPE.S1){		//S1
			//S1�ł͉������Ȃ�
			SetMaster_Empty(Master,AttackS_Master,null);
		} else {}
		if(PartyType == PARTYTYPE.SG || PartyType == PARTYTYPE.GS){		//SG
			//G�̏ꍇ�̓����X�^�[�C���f�b�N�X�Ɋ֌W�Ȃ��Œ�ʒu
			if(Party00 == MonsterIndexNum0){
				SetMonster_Empty(Party00,AttackS_PartyG_00,null);
			} else if(Party00 == MonsterIndexNum1){
				SetMonster_Empty(Party00,AttackS_PartyG_00,null);
			} else {}
			SetMaster_Empty(Master,AttackS_Master,null);
		} else {}
	} else if(gAttackSize == SIZE_G){
		if(PartyType == PARTYTYPE.SG){		//SG
			//SG�̏ꍇ�A��U�����X�^�[�͔z�u���Ȃ�
			SetMaster_Empty(Master,AttackG_Master,null);
		}
		if(PartyType == PARTYTYPE.GS){		//GS
			//SG�̏ꍇ�A��U�����X�^�[�͔z�u���Ȃ�
			SetMaster_Empty(Master,AttackG_Master,null);
		} else {}
		if(PartyType == PARTYTYPE.G1){		//G1
			//G1�ł͉������Ȃ�
			SetMaster_Empty(Master,AttackG_Master,null);
		} else {}
	}  else if(gAttackSize == SIZE_T){
		//T�͕K���P�̂Ȃ̂ŉ������Ȃ�
		SetMaster_Empty(Master,AttackT_Master,null);
	}
	
	if(PartyNum >= 1 && gAttack != INVALID_CHARACTER){
		SetVisible_(gAttack, true);
		if(AllyFlag == true){
			SetDir_(gAttack, 180);
		} else {
			SetDir_(gAttack, 0);
		}
	} else {}
	if(PartyNum >= 2 && Party00 != INVALID_CHARACTER){
		SetVisible_(Party00, true);
		if(AllyFlag == true){
			SetDir_(Party00, 180);
		} else {
			SetDir_(Party00, 0);
		}
	} else {}
	if(PartyNum >= 3 && Party01 != INVALID_CHARACTER){
		SetVisible_(Party01, true);
		if(AllyFlag == true){
			SetDir_(Party01, 180);
		} else {
			SetDir_(Party01, 0);
		}
	} else {}
	if(PartyNum >= 4 && Party02 != INVALID_CHARACTER){
		SetVisible_(Party02, true);
		if(AllyFlag == true){
			SetDir_(Party02, 180);
		} else {
			SetDir_(Party02, 0);
		}
	} else {}
	
	//�J�����ݒ�
	if(gAttackSize == SIZE_T){
		//�e���̏ꍇ�����A�����X�^�[�̒��S�ʒu�ɂ���ăJ������ύX
		local CentralPos	= GetBonePos_(gAttack,"Effect2")
		local LowSetting	= 75;
		local HighSetting	= 150;
		local CameraNum_AllyLow			= "camera_004_ALLYT_LOW"
		local CameraTargetNum_AllyRow	= "camtgt_004_ALLYT_LOW"
		local CameraNum_EnemyLow		= "camera_014_ENEMYT_LOW"
		local CameraTargetNum_EnemyRow	= "camtgt_014_ENEMYT_LOW"
		local CameraNum_AllyHigh		= "camera_004_ALLYT_HIGH"
		local CameraTargetNum_AllyHigh	= "camtgt_004_ALLYT_HIGH"
		local CameraNum_EnemyHigh		= "camera_014_ENEMYT_HIGH"
		local CameraTargetNum_EnemyHigh	= "camtgt_014_ENEMYT_HIGH"
		print("CentralPos	[x] " + CentralPos.x + "\n")
		print("CentralPos	[y] " + CentralPos.y + "\n")
		print("CentralPos	[z] " + CentralPos.z + "\n")
		if(CentralPos.y < LowSetting){
			//�Ⴂ�����X�^
			if(IsAlly_(gAttack)){
				//������
				gCameraTask <- Task_AnimeMoveCamera_(CameraNum_AllyLow,CameraTargetNum_AllyRow);
				Task_AnimeMoveCharNoDir_(gAttack, CharaPoint);
			} else {
				//�G��
				gCameraTask <- Task_AnimeMoveCamera_(CameraNum_EnemyLow,CameraTargetNum_EnemyRow);
				Task_AnimeMoveCharNoDir_(gAttack, CharaPoint);
			}
		} else if(CentralPos.y >= LowSetting && CentralPos.y < HighSetting){
			//����
			gCameraTask <- Task_AnimeMoveCamera_(CameraNum,CameraTargetNum);
			Task_AnimeMoveCharNoDir_(gAttack, CharaPoint);
		} else {
			//���������X�^�[
			if(IsAlly_(gAttack)){
				gCameraTask <- Task_AnimeMoveCamera_(CameraNum_AllyHigh,CameraTargetNum_AllyHigh);
				Task_AnimeMoveCharNoDir_(gAttack, CharaPoint);
			} else {
				gCameraTask <- Task_AnimeMoveCamera_(CameraNum_EnemyHigh,CameraTargetNum_EnemyHigh);
				Task_AnimeMoveCharNoDir_(gAttack, CharaPoint);			
			}
		}
		
	} else {
		gCameraTask <- Task_AnimeMoveCamera_(CameraNum,CameraTargetNum);
		Task_AnimeMoveCharNoDir_(gAttack, CharaPoint);
	}
	
	switch(gAttackSize)
	{
	case SIZE_T:
		T_Action(EffectEmpty)
		break;
	default:
		SNMG_Action(EffectEmpty)
		break;
	}

}

function SNMG_Action(EffectEmpty)
{
	//�㋉���@���o����
	HighRankSpellEffect(gMultiCount,EffectEmpty,cAction)
	
	SetMotion_(gAttack, MOT_SWORD_START, 4);
	Wait_(15);
	SetCameraEffect_("EF000_03_SHUCHUSEN", 100);
	SetMotion_(gAttack, MOT_SWORD_EXERCISE, 4);
	Task_ChangeMotion_(gAttack, MOT_WAIT, 4);
	Wait_(45);	
}

function T_Action(EffectEmpty)
{
	//�㋉���@���o����
	HighRankSpellEffect(gMultiCount,EffectEmpty,cAction)
	
	SetMotion_(gAttack, MOT_SWORD_START, 4);
	Task_ChangeMotion_(gAttack, MOT_SWORD_CHARGE, 0);
	Wait_(45);
	
	SetCameraEffect_("EF000_03_SHUCHUSEN", 100);
	SetMotion_(gAttack, MOT_SWORD_EXERCISE, 4);
	Task_ChangeMotion_(gAttack, MOT_WAIT, 4);
	Wait_(45);	
}
