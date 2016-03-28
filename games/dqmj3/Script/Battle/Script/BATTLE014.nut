// �����i�z�C�~�E�P�́j

// ������
function Init()
{
	DebugPrint("BATTLE014_function_Init");
	BattleCommon_Init();
	gAttack <- GetActorIndex_(0);
	gAttackSize <- GetMonsterSize_(gAttack);
	gTarget1 <- GetTargetIndex_(0,0);
	gTarget1Size <- GetMonsterSize_(gTarget1);
	
	if(IsScout_()){
		cAction <- null
	} else {
		cAction <- cActionInfo(0);
		Debug_cActionPrint(cAction)
		ChangeIndexPointData_(PERSONAL_POINT_DATA);
	}
	gMultiCount <- 0;
	gMultiStageCount <- 0;	//���i�U���J�E���g�p
	LoadEffect_("EF000_01_MAGIC_ARIA");
	LoadEffect_("EF000_03_SHUCHUSEN");
	LoadEffect();

}

// �X�V
function Update()
{
	DebugPrint("BATTLE014_function_Update");
	StandbyCut_Magic(gMultiCount,cAction);
	ChangeIndexPointData_(PERSONAL_POINT_DATA);
	DeleteAllTask_();
	SetVisibleNeedModel_();
	
	ChangeIndexPointData_(PERSONAL_POINT_DATA);
	//CharaStandy�Ăяo������p
	local CharaStandFlag = true;
	
	local AttackEmptyS;
	local AttackEmptyN;
	local AttackEmptyM;
	local AttackEmptyG;
	local AttackEmptyT;
	local Master;
	local CameraEmptyS;
	local CameraEmptyN;
	local CameraEmptyM;
	local CameraEmptyG;
	local CameraEmptyT;
	local CameraTargetEmptyS;
	local CameraTargetEmptyN;
	local CameraTargetEmptyM;
	local CameraTargetEmptyG;
	local CameraTargetEmptyT;
	local EffectEmptyS;
	local EffectEmptyN;
	local EffectEmptyM;
	local EffectEmptyG;
	local EffectEmptyT;
	local SizeWaitS = 30;
	local SizeWaitN = 30;
	local SizeWaitM = 30;
	local SizeWaitG = 30;
	local SizeWaitT = 30;
	local AllyFlag = IsAlly_(gAttack);
	
	if(AllyFlag == true){
		AttackEmptyS = "move_100_ALLYS";
		AttackEmptyN = "move_100_ALLYS";
		AttackEmptyM = "move_101_ALLYM";
		AttackEmptyG = "move_102_ALLYG";
		AttackEmptyT = "move_103_ALLYT";
		CameraEmptyS = "camera_AllyS";
		CameraEmptyN = "camera_AllyN";
		CameraEmptyM = "camera_AllyM";
		CameraEmptyG = "camera_AllyG";
		CameraEmptyT = "camera_AllyT";
		CameraTargetEmptyS = "camtgt_AllyS";
		CameraTargetEmptyN = "camtgt_AllyN";
		CameraTargetEmptyM = "camtgt_AllyM";
		CameraTargetEmptyG = "camtgt_AllyG";
		CameraTargetEmptyT = "camtgt_AllyT";
		EffectEmptyS = "pos_301_ALLYEffectS";
		EffectEmptyN = "pos_302_ALLYEffectN";
		EffectEmptyM = "pos_303_ALLYEffectM";
		EffectEmptyG = "pos_304_ALLYEffectG";
		EffectEmptyT = "pos_305_ALLYEffectT";
	} else {
		AttackEmptyS = "move_150_ENEMYS";
		AttackEmptyN = "move_150_ENEMYS";
		AttackEmptyM = "move_151_ENEMYM";
		AttackEmptyG = "move_152_ENEMYG";
		AttackEmptyT = "move_153_ENEMYT";
		CameraEmptyS = "camera_EnemyS";
		CameraEmptyN = "camera_EnemyN";
		CameraEmptyM = "camera_EnemyM";
		CameraEmptyG = "camera_EnemyG";
		CameraEmptyT = "camera_EnemyT";
		CameraTargetEmptyS = "camtgt_EnemyS";
		CameraTargetEmptyN = "camtgt_EnemyN";
		CameraTargetEmptyM = "camtgt_EnemyM";
		CameraTargetEmptyG = "camtgt_EnemyG";
		CameraTargetEmptyT = "camtgt_EnemyT";
		EffectEmptyS = "pos_351_ENEMYEffectS";
		EffectEmptyN = "pos_352_ENEMYEffectN";
		EffectEmptyM = "pos_353_ENEMYEffectM";
		EffectEmptyG = "pos_354_ENEMYEffectG";
		EffectEmptyT = "pos_355_ENEMYEffectT";
	}
	
	//�r�T�C�Y�̏ꍇ
	if(gAttackSize == SIZE_S){
		//�����̐ݒ�
		local CameraNum = CameraEmptyS;
		local CameraTargetNum = CameraTargetEmptyS;
		local CharaPoint = AttackEmptyS;
		local EffectEmpty = EffectEmptyS;
		local SizeWait = SizeWaitS
		SpellCast(CameraNum,CameraTargetNum,CharaPoint,SizeWait,EffectEmpty)
	//�m�T�C�Y�̏ꍇ
	} else if(gAttackSize == SIZE_N ){
		//�����̐ݒ�
		local CameraNum = CameraEmptyN;
		local CameraTargetNum = CameraTargetEmptyN;
		local CharaPoint = AttackEmptyN;
		local EffectEmpty = EffectEmptyN;
		local SizeWait = SizeWaitN
		SpellCast(CameraNum,CameraTargetNum,CharaPoint,SizeWait,EffectEmpty)
	//�l�T�C�Y�̏ꍇ
	} else if(gAttackSize == SIZE_M ){
		//�����̐ݒ�
		local CameraNum = CameraEmptyM;
		local CameraTargetNum = CameraTargetEmptyM;
		local CharaPoint = AttackEmptyM;
		local EffectEmpty = EffectEmptyM;
		local SizeWait = SizeWaitM
		SpellCast(CameraNum,CameraTargetNum,CharaPoint,SizeWait,EffectEmpty)
	//�f�T�C�Y�̏ꍇ
	} else if(gAttackSize == SIZE_G ){
		//�����̐ݒ�
		local CameraNum = CameraEmptyG;
		local CameraTargetNum = CameraTargetEmptyG;
		local CharaPoint = AttackEmptyG;
		local EffectEmpty = EffectEmptyG;
		local SizeWait = SizeWaitG
		SpellCast(CameraNum,CameraTargetNum,CharaPoint,SizeWait,EffectEmpty)
	//�s�T�C�Y�̏ꍇ
	} else {
		//�����̐ݒ�
		local CameraNum = CameraEmptyT;
		local CameraTargetNum = CameraTargetEmptyT;
		local CharaPoint = AttackEmptyT;
		local EffectEmpty = EffectEmptyT;
		local SizeWait = SizeWaitT
		SpellCast(CameraNum,CameraTargetNum,CharaPoint,SizeWait,EffectEmpty)
	}
	
	local CharaStandFlag = true;		//�L�����̔z�u�͍s��Ȃ�
	local WaitFlag = true;				//���o�I����҂�
	
	if(cAction.SelfTargetFlag== true){
		CharaStandFlag = false;
	}
	
	local SingleAttackFlag = false;
	Exception_2ndCheck(gMultiCount,SingleAttackFlag,cAction)
	LineEffect_Init(CharaStandFlag ,gMultiCount,gMultiStageCount,WaitFlag,cAction);
	
	
	BatteleScript_End();
}

//�����r�����o
function SpellCast(CameraNum,CameraTargetNum,CharaPoint,SizeWait,EffectEmpty)
{
	local AllyFlag = IsAlly_(gAttack);
	ChangeIndexPointData_(PERSONAL_POINT_DATA);
	Task_AnimeMoveCharNoDir_(gAttack, CharaPoint);
	local pos = GetPos_(gAttack);
	
	SetVisible_(gAttack , true);
	Task_AnimeMoveCamera_(CameraNum,CameraTargetNum);
	
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
		AttackS_PartyS4_00 = "move_110_ALLYPartyS04";
		AttackS_PartyS4_01 = "move_111_ALLYPartyS04";
		AttackS_PartyS4_02 = "move_112_ALLYPartyS04";
		AttackS_PartyS4_03 = "move_113_ALLYPartyS04";
		AttackS_PartyS3_00 = "move_114_ALLYPartyS03";
		AttackS_PartyS3_01 = "move_115_ALLYPartyS03";
		AttackS_PartyS3_02 = "move_116_ALLYPartyS03";
		AttackS_PartyG_00 = "move_117_ALLYPartyG";
		MonsterIndexNum0 = GetAllyIndex_(0);
		MonsterIndexNum1 = GetAllyIndex_(1);
		MonsterIndexNum2 = GetAllyIndex_(2);
		MonsterIndexNum3 = GetAllyIndex_(3);
		AttackS_Master	 = "move_100_ALLYS_Master";
		AttackG_Master	 = "move_102_ALLYG_Master";
		AttackT_Master	 = "move_103_ALLYT_Master";
	} else {
		AttackS_PartyS4_00 = "move_160_ENEMYPartyS4";
		AttackS_PartyS4_01 = "move_161_ENEMYPartyS4";
		AttackS_PartyS4_02 = "move_162_ENEMYPartyS4";
		AttackS_PartyS4_03 = "move_163_ENEMYPartyS4";
		AttackS_PartyS3_00 = "move_164_ENEMYPartyS3";
		AttackS_PartyS3_01 = "move_165_ENEMYPartyS3";
		AttackS_PartyS3_02 = "move_166_ENEMYPartyS3";
		AttackS_PartyG_00 = "move_167_ENEMYPartyG";
		MonsterIndexNum0 = GetEnemyIndex_(0);
		MonsterIndexNum1 = GetEnemyIndex_(1);
		MonsterIndexNum2 = GetEnemyIndex_(2);
		MonsterIndexNum3 = GetEnemyIndex_(3);
		AttackS_Master	 = "move_150_ENEMYS_Master";
		AttackG_Master	 = "move_152_ENEMYG_Master";
		AttackT_Master	 = "move_153_ENEMYT_Master";
	}
	
	
	//�p�[�e�B�����X�^�[�C���f�b�N�X�̎擾
	if(PartyNum >= 1){
		if(AllyFlag == true){
			Master = GetAllyMaster_();
		} else {
			Master = GetEnemyMaster_();
		}
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
	
	if(gAttackSize == SIZE_S || gAttackSize == SIZE_N || gAttackSize == SIZE_M){
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
				SetMaster_Empty(Master,AttackS_Master,null);	//Master
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
				SetMaster_Empty(Master,AttackS_Master,null);	//Master
		} else {}
		if(PartyType == PARTYTYPE.S2){		//S2
			if(Party00 == MonsterIndexNum0){
				SetMonster_Empty(Party00,AttackS_PartyS3_00,null);
			} else if(Party00 == MonsterIndexNum1){
				SetMonster_Empty(Party00,AttackS_PartyS3_02,null);
			} else {}
				SetMaster_Empty(Master,AttackS_Master,null);	//Master
		} else {}
		if(PartyType == PARTYTYPE.S1){		//S1
			SetMaster_Empty(Master,AttackS_Master,null);	//Master
			//S1�ł͉������Ȃ�
		} else {}
		if(PartyType == PARTYTYPE.SG || PartyType == PARTYTYPE.GS){		//SG
			//G�̏ꍇ�̓����X�^�[�C���f�b�N�X�Ɋ֌W�Ȃ��Œ�ʒu
			if(Party00 == MonsterIndexNum0){
				SetMonster_Empty(Party00,AttackS_PartyG_00,null);
			} else if(Party00 == MonsterIndexNum1){
				SetMonster_Empty(Party00,AttackS_PartyG_00,null);
			} else {}
			SetMaster_Empty(Master,AttackG_Master,null);	//Master
		} else {}
	} else if(gAttackSize == SIZE_G){
		if(PartyType == PARTYTYPE.SG){		//SG
			//SG�̏ꍇ�A��U�����X�^�[�͔z�u���Ȃ�
			SetMaster_Empty(Master,AttackG_Master,null);	//Master
		} else {}
		if(PartyType == PARTYTYPE.GS){
			//GS�̏ꍇ�A��U�����X�^�[�͔z�u���Ȃ�
			SetMaster_Empty(Master,AttackG_Master,null);	//Master
		}
		if(PartyType == PARTYTYPE.G1){		//G1
			//G1�ł͉������Ȃ�
			SetMaster_Empty(Master,AttackG_Master,null);	//Master
		} else {}
	}  else if(gAttackSize == SIZE_T){
		//T�͕K���P�̂Ȃ̂ŉ������Ȃ�
		SetMaster_Empty(Master,AttackT_Master,null);	//Master
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
	
	//�㋉���@���o����
	HighRankSpellEffect(gMultiCount,EffectEmpty,cAction)
	
	SetMotion_(gAttack, MOT_PARTICULAR_START, 4);
	Wait_(15);
	SetCameraEffect_("EF000_03_SHUCHUSEN", 100);
	SetMotion_(gAttack, MOT_PARTICULAR_EXERCISE, 4);
	Task_ChangeMotion_(gAttack, MOT_WAIT, 4);
	if(cAction.SelfTargetFlag == true){
		Wait_(30);
	} else {
		Wait_(45);
	}
}
