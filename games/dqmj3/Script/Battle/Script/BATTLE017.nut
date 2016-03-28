// 特殊（敵）２

// 初期化
function Init()
{
	DebugPrint("BATTLE017_START ======")
	DebugPrint("BATTLE017_function_Init")
	BattleCommon_Init();
	gAttack <- GetActorIndex_(0);
	gAttackSize <- GetMonsterSize_(gAttack);
	
	cAction <- cActionInfo(0)
	Debug_cActionPrint(cAction)
	ChangeIndexPointData_(PERSONAL_POINT_DATA);
	
	gMultiCount <- 0;
	gMultiStageCount <- 0;	//多段攻撃用
	/*
	local Target = GetTargetIndex_(0,0);
	if(Target != INVALID_CHARACTER){
		SetVisible_(Target, false);
	}*/

	LoadEffect_("EF000_01_MAGIC_ARIA");
	LoadEffect_("EF000_03_SHUCHUSEN");
	
	LoadEffect();
}

// 更新
function Update()
{
	DebugPrint("BATTLE017_function_Update")
	DebugPrint("BATTLE017 => BattleCommon_StanbyCut_Magic")
	StandbyCut_Magic(gMultiCount,cAction);
	ChangeIndexPointData_(PERSONAL_POINT_DATA);
	DeleteAllTask_();
	SetVisibleNeedModel_();
	DebugPrint("BATTLE017 <= BattleCommon_StanbyCut_Magic")
	
	//必要なクラスを呼び出す
	//CharaStandy呼び出し判定用
	local CharaStandFlag = true;
	
	local AttackEmptyS;
	local AttackEmptyM;
	local AttackEmptyG;
	local AttackEmptyT;
	local CameraEmptyS;
	local CameraEmptyM;
	local CameraEmptyG;
	local CameraEmptyT;
	local CameraTargetEmptyS;
	local CameraTargetEmptyM;
	local CameraTargetEmptyG;
	local CameraTargetEmptyT;
	local SizeWaitS = 20;
	local SizeWaitM = 35;
	local SizeWaitG = 50;
	local SizeWaitT = 65;
	local AllyFlag = IsAlly_(gAttack);
	
	//上級呪文の分岐
	local HighRank = IsHighRankSpell_(0);
	local EffectEmptyS;
	local EffectEmptyM;
	local EffectEmptyG;
	local EffectEmptyT;
	if(AllyFlag == true){
		AttackEmptyS = "move_101_ALLYS";
		AttackEmptyM = "move_102_ALLYM";
		AttackEmptyG = "move_103_ALLYG";
		AttackEmptyT = "move_104_ALLYT";
		CameraEmptyS = "camera_001_ALLYS";
		CameraEmptyM = "camera_002_ALLYM";
		CameraEmptyG = "camera_003_ALLYG";
		CameraEmptyT = "camera_004_ALLYT";
		CameraTargetEmptyS = "camtgt_001_ALLYS";
		CameraTargetEmptyM = "camtgt_002_ALLYM";
		CameraTargetEmptyG = "camtgt_003_ALLYG";
		CameraTargetEmptyT = "camtgt_004_ALLYT";
		EffectEmptyS = "pos_301_ALLYEffectS";
		EffectEmptyM = "pos_302_ALLYEffectM";
		EffectEmptyG = "pos_303_ALLYEffectG";
		EffectEmptyT = "pos_304_ALLYEffectT";
	} else {
		AttackEmptyS = "move_151_ENEMYS";
		AttackEmptyM = "move_152_ENEMYM";
		AttackEmptyG = "move_153_ENEMYG";
		AttackEmptyT = "move_154_ENEMYT";
		CameraEmptyS = "camera_011_ENEMYS";
		CameraEmptyM = "camera_012_ENEMYM";
		CameraEmptyG = "camera_013_ENEMYG";
		CameraEmptyT = "camera_014_ENEMYT";
		CameraTargetEmptyS = "camtgt_011_ENEMYS";
		CameraTargetEmptyM = "camtgt_012_ENEMYM";
		CameraTargetEmptyG = "camtgt_013_ENEMYG";
		CameraTargetEmptyT = "camtgt_014_ENEMYT";
		EffectEmptyS = "pos_351_ENEMYEffectS";
		EffectEmptyM = "pos_352_ENEMYEffectM";
		EffectEmptyG = "pos_353_ENEMYEffectG";
		EffectEmptyT = "pos_354_ENEMYEffectT";
	}
	
	//SpellCaset引数用変数
	local CameraEmpty;
	local CameraTargetEmpty;
	local AttackEmpty;
	local EffectEmpty;
	local SizeWait;		
	//Ｓサイズの場合
	if(gAttackSize == SIZE_S || gAttackSize == SIZE_N){
		AttackEmpty = AttackEmptyS;
		CameraEmpty = CameraEmptyS;
		CameraTargetEmpty = CameraTargetEmptyS;
		EffectEmpty = EffectEmptyS;
		SizeWait = SizeWaitS;
	//Ｍサイズの場合
	} else if(gAttackSize == SIZE_M ){
		AttackEmpty = AttackEmptyM;
		CameraEmpty = CameraEmptyM;
		CameraTargetEmpty = CameraTargetEmptyM;
		EffectEmpty = EffectEmptyM;
		SizeWait = SizeWaitM;
	//Ｇサイズの場合
	} else if(gAttackSize == SIZE_G ){
		AttackEmpty = AttackEmptyG;
		CameraEmpty = CameraEmptyG;
		CameraTargetEmpty = CameraTargetEmptyG;
		EffectEmpty = EffectEmptyG;
		SizeWait = SizeWaitG;
	//Ｔサイズの場合
	} else {
		AttackEmpty = AttackEmptyT;
		CameraEmpty = CameraEmptyT;
		CameraTargetEmpty = CameraTargetEmptyT;
		EffectEmpty = EffectEmptyT;
		SizeWait = SizeWaitT;
	}
	SwordCast(CameraEmpty,CameraTargetEmpty,AttackEmpty,SizeWait,EffectEmpty)
	
	local CharaStandFlag = true;		//キャラの配置は行う
	local WaitFlag = true;				//演出終了を待つ
	
	if(cAction.SelfTargetFlag== true){
		CharaStandFlag = false;
	}
	
	SpecialCutCheck(gMultiCount);
	
	
	local SingleAttackFlag = false;
	Exception_2ndCheck(gMultiCount,SingleAttackFlag,cAction)
	LineEffect_Init(CharaStandFlag ,gMultiCount,gMultiStageCount,WaitFlag,cAction);
	BatteleScript_End();
}

//呪文詠唱演出
function SwordCast(CameraTarget,CameraTargetEmpty,AttackEmpty,SizeWait,EffectEmpty)
{
	DebugPrint("BATTLE017_function_SwordCast")
	DebugPrint("	=>	:	" + "CameraTarget" + " : "+ CameraTarget)
	DebugPrint("	=>	:	" + "CameraTargetEmpty" + " : "+ CameraTargetEmpty)
	DebugPrint("	=>	:	" + "AttackEmpty" + " : "+ CameraTarget)
	DebugPrint("	=>	:	" + "SizeWait" + " : "+ CameraTarget)
	DebugPrint("	=>	:	" + "EffectEmpty" + " : "+ EffectEmpty)
	local AllyFlag = IsAlly_(gAttack);
	
	Task_AnimeMoveCamera_(CameraTarget , CameraTargetEmpty);
	Task_AnimeMoveCharNoDir_(gAttack, AttackEmpty);
	
	//上級魔法演出判定
	HighRankSpellEffect(gMultiCount,EffectEmpty,cAction)
	
	SetMotion_(gAttack, MOT_PARTICULAR_START, 4);
	
	//詠唱用エフェクトの表示
	SpellCastEffect(gAttack,gMultiCount)
	
	//パーティ情報の取得
	local PartyType = Get_PartyType(AllyFlag);
	local PartyNum = Get_PartyNum(AllyFlag);
	
	//配置Emptyの用意
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
	local Party00_Dir;
	local Party01_Dir;
	local Party02_Dir;
	local Master_Dir;

	
	local MonsterIndexNum0;
	local MonsterIndexNum1;
	local MonsterIndexNum2;
	local MonsterIndexNum3;
	
	local AllyFlag = IsAlly_(gAttack);
	if(AllyFlag == true){
		AttackS_PartyS4_00 = "move_111_ALLY_PartyS4_00";
		AttackS_PartyS4_01 = "move_112_ALLY_PartyS4_01";
		AttackS_PartyS4_02 = "move_113_ALLY_PartyS4_02";
		AttackS_PartyS4_03 = "move_114_ALLY_PartyS4_03";
		AttackS_PartyS3_00 = "move_115_ALLY_PartyS3_00";
		AttackS_PartyS3_01 = "move_116_ALLY_PartyS3_01";
		AttackS_PartyS3_02 = "move_117_ALLY_PartyS3_02";
		AttackS_PartyG_00 = "move_118_ALLY_PartyG_00";
		MonsterIndexNum0 = GetAllyIndex_(0);
		MonsterIndexNum1 = GetAllyIndex_(1);
		MonsterIndexNum2 = GetAllyIndex_(2);
		MonsterIndexNum3 = GetAllyIndex_(3);
		AttackS_Master = "move_101_ALLYS_Master"
		AttackG_Master = "move_103_ALLYG_Master"
		AttackT_Master = "move_104_ALLYT_Master"
		Master = GetAllyMaster_();
		Party00_Dir = 180;
		Party01_Dir = 180;
		Party02_Dir = 180;
		Master_Dir = 180;
	} else {
		AttackS_PartyS4_00 = "move_161_ENEMY_PartyS4_00";
		AttackS_PartyS4_01 = "move_162_ENEMY_PartyS4_01";
		AttackS_PartyS4_02 = "move_163_ENEMY_PartyS4_02";
		AttackS_PartyS4_03 = "move_164_ENEMY_PartyS4_03";
		AttackS_PartyS3_00 = "move_165_ENEMY_PartyS3_00";
		AttackS_PartyS3_01 = "move_166_ENEMY_PartyS3_01";
		AttackS_PartyS3_02 = "move_167_ENEMY_PartyS3_02";
		AttackS_PartyG_00 = "move_168_ENEMY_PartyG_00";
		MonsterIndexNum0 = GetEnemyIndex_(0);
		MonsterIndexNum1 = GetEnemyIndex_(1);
		MonsterIndexNum2 = GetEnemyIndex_(2);
		MonsterIndexNum3 = GetEnemyIndex_(3);
		AttackS_Master = "move_151_ENEMYS_Master"
		AttackG_Master = "move_153_ENEMYG_Master"
		AttackT_Master = "move_154_ENEMYT_Master"
		Master = GetEnemyMaster_();
		Party00_Dir = 0;
		Party01_Dir = 0;
		Party02_Dir = 0;
		Master_Dir = 0;
	}
	
	//パーティモンスターインデックスの取得
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
			//モンスターインデックスから配置場所を変更
			if(Party00 == MonsterIndexNum0){
				SetMonster_Empty(Party00,AttackS_PartyS4_00,Party00_Dir);
			} else if(Party00 == MonsterIndexNum1){
				SetMonster_Empty(Party00,AttackS_PartyS4_01,Party00_Dir);
			} else if(Party00 == MonsterIndexNum2){
				SetMonster_Empty(Party00,AttackS_PartyS4_02,Party00_Dir);
			} else if(Party00 == MonsterIndexNum3){
				SetMonster_Empty(Party00,AttackS_PartyS4_03,Party00_Dir);
			} else {}
			if(Party01 == MonsterIndexNum0){
				SetMonster_Empty(Party01,AttackS_PartyS4_00,Party01_Dir);
			} else if(Party01 == MonsterIndexNum1){
				SetMonster_Empty(Party01,AttackS_PartyS4_01,Party01_Dir);
			} else if(Party01 == MonsterIndexNum2){
				SetMonster_Empty(Party01,AttackS_PartyS4_02,Party01_Dir);
			} else if(Party01 == MonsterIndexNum3){
				SetMonster_Empty(Party01,AttackS_PartyS4_03,Party01_Dir);
			} else {}
			if(Party02 == MonsterIndexNum0){
				SetMonster_Empty(Party02,AttackS_PartyS4_00,Party02_Dir);
			} else if(Party02 == MonsterIndexNum1){
				SetMonster_Empty(Party02,AttackS_PartyS4_01,Party02_Dir);
			} else if(Party02 == MonsterIndexNum2){
				SetMonster_Empty(Party02,AttackS_PartyS4_02,Party02_Dir);
			} else if(Party02 == MonsterIndexNum3){
				SetMonster_Empty(Party02,AttackS_PartyS4_03,Party02_Dir);
			} else {}
			SetMaster_Empty(Master,AttackS_Master,Master_Dir);
		} else {}
		if(PartyType == PARTYTYPE.S3){		//S3
			if(Party00 == MonsterIndexNum0){
				SetMonster_Empty(Party00,AttackS_PartyS3_00,Party00_Dir);
			} else if(Party00 == MonsterIndexNum1){
				SetMonster_Empty(Party00,AttackS_PartyS3_01,Party00_Dir);
			} else if(Party00 == MonsterIndexNum2){
				SetMonster_Empty(Party00,AttackS_PartyS3_02,Party00_Dir);
			} else {}
			if(Party01 == MonsterIndexNum0){
				SetMonster_Empty(Party01,AttackS_PartyS3_00,Party01_Dir);
			} else if(Party01 == MonsterIndexNum1){
				SetMonster_Empty(Party01,AttackS_PartyS3_01,Party01_Dir);
			} else if(Party01 == MonsterIndexNum2){
				SetMonster_Empty(Party01,AttackS_PartyS3_02,Party01_Dir);
			} else {}
			SetMaster_Empty(Master,AttackS_Master,Master_Dir);
		} else {}
		if(PartyType == PARTYTYPE.S2){		//S2
			if(Party00 == MonsterIndexNum0){
				SetMonster_Empty(Party00,AttackS_PartyS3_00,Party00_Dir);
			} else if(Party00 == MonsterIndexNum1){
				SetMonster_Empty(Party00,AttackS_PartyS3_02,Party00_Dir);
			} else {}
			SetMaster_Empty(Master,AttackS_Master,Master_Dir);
		} else {}
		if(PartyType == PARTYTYPE.S1){		//S1
			//S1では何もしない
			SetMaster_Empty(Master,AttackS_Master,Master_Dir);
		} else {}
		if(PartyType == PARTYTYPE.SG || PartyType == PARTYTYPE.GS){		//SG
			//Gの場合はモンスターインデックスに関係なく固定位置
			if(Party00 == MonsterIndexNum0){
				SetMonster_Empty(Party00,AttackS_PartyG_00,Party00_Dir);
			} else if(Party00 == MonsterIndexNum1){
				SetMonster_Empty(Party00,AttackS_PartyG_00,Party00_Dir);
			} else {}
			SetMaster_Empty(Master,AttackG_Master,Master_Dir);
		} else {}
	} else if(gAttackSize == SIZE_G){
		if(PartyType == PARTYTYPE.SG || PartyType == PARTYTYPE.GS){		//SG
			//SGの場合、一旦モンスターは配置しない
			SetMaster_Empty(Master,AttackG_Master,Master_Dir);
		} else {}
		if(PartyType == PARTYTYPE.G1){		//G1
			//G1では何もしない
			SetMaster_Empty(Master,AttackG_Master,Master_Dir);
		} else {}
	}  else if(gAttackSize == SIZE_T){
		//Tは必ず１体なので何もしない
		SetMaster_Empty(Master,AttackT_Master,Master_Dir);
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
	
	switch(gAttackSize)
	{
	case SIZE_T:
		T_Action()
		break;
	default:
		SNMG_Action()
		break;
	}
}


function SNMG_Action()
{
	SetMotion_(gAttack, MOT_PARTICULAR_START, 0);
	Wait_(15);
	local LineWork = SetCameraEffect_("EF000_03_SHUCHUSEN", 100);
	SetMotion_(gAttack, MOT_PARTICULAR_EXERCISE, 4);
	Task_ChangeMotion_(gAttack, MOT_WAIT, 4);
	//SetEffectScale_(LineWork, 1.0);
	Wait_(45);
}

function T_Action()
{
	SetMotion_(gAttack, MOT_PARTICULAR_START, 4);
	Task_ChangeMotion_(gAttack, MOT_PARTICULAR_CHANT, 4);
	Wait_(45);
	local LineWork = SetCameraEffect_("EF000_03_SHUCHUSEN", 100);
	SetMotion_(gAttack, MOT_PARTICULAR_EXERCISE, 4);
	Task_ChangeMotion_(gAttack, MOT_WAIT, 4);
	//SetEffectScale_(LineWork, 1.0);
	Wait_(45);	
}