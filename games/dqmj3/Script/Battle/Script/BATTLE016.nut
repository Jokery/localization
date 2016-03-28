// 特殊（敵）１

// 初期化
function Init()
{
	DebugPrint("BATTLE016_function_Init");
	BattleCommon_Init();
	gAttack <- GetActorIndex_(0);
	gAttackSize <- GetMonsterSize_(gAttack);
	gMultiCount <- 0;		//連続行動カウント
	gMultiStageCount <- 0;	//多段攻撃カウント用
	cAction <- cActionInfo(0)
	Debug_cActionPrint(cAction)
	ChangeIndexPointData_(PERSONAL_POINT_DATA);
	
	//ライド判定
	gAllyFlag <- IsAlly_(gAttack);
	gRideFlag <- false;
	if(gAllyFlag == true){
		if(gRideFlag == false){gRideFlag = IsRide_(GetAllyIndex_(0));}
		if(gRideFlag == false){gRideFlag = IsRide_(GetAllyIndex_(1));}
		if(gRideFlag == false){gRideFlag = IsRide_(GetAllyIndex_(2));}
		if(gRideFlag == false){gRideFlag = IsRide_(GetAllyIndex_(3));}
	} else {
		if(gRideFlag == false){gRideFlag = IsRide_(GetEnemyIndex_(0));}
		if(gRideFlag == false){gRideFlag = IsRide_(GetEnemyIndex_(1));}
		if(gRideFlag == false){gRideFlag = IsRide_(GetEnemyIndex_(2));}
		if(gRideFlag == false){gRideFlag = IsRide_(GetEnemyIndex_(3));}
	}
	
	LoadEffect_("EF000_01_MAGIC_ARIA");
	LoadEffect_("EF000_06_ROCK");
	LoadEffect_("EF000_03_SHUCHUSEN");
	
	LoadEffect();
	gAttackTask <- null;
	gTargetTask <- null;
	gCameraTask <- null;

	/*local Target = GetTargetIndex_(0,0);
	if(Target != INVALID_CHARACTER){
		SetVisible_(Target, false);
	}*/

}

// 更新
function Update()
{
	DebugPrint("BATTLE016_IN_function_Update")
	StandbyCut_Magic(gMultiCount,cAction);
	ChangeIndexPointData_(PERSONAL_POINT_DATA);
	DeleteAllTask_();
	SetVisibleNeedModel_();
	
	//CharaStandy呼び出し判定用
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
	local CameraTargetEmptyS;
	local CameraTargetEmptyN;
	local CameraTargetEmptyM;
	local CameraTargetEmptyG;
	local CameraTargetEmptyT;
	local SizeWaitS = 30;
	local SizeWaitN = 30;
	local SizeWaitM = 45;
	local SizeWaitG = 60;
	local SizeWaitT = 75;
	local AllyFlag = IsAlly_(gAttack);
	
	//上級呪文の分岐
	local EffectEmptyS;
	local EffectEmptyN;
	local EffectEmptyM;
	local EffectEmptyG;
	local EffectEmptyT;
	if(AllyFlag == true){
		AttackEmptyS = "move_100_ALLY00S";
		AttackEmptyN = "move_100_ALLY00S";	//SとNで共通
		AttackEmptyM = "move_101_ALLY01M";
		AttackEmptyG = "move_102_ALLY02G";
		AttackEmptyT = "move_103_ALLY03T";
		CameraEmptyS = "camera_001_ALLYS";
		CameraEmptyN = "camera_001_ALLYS";	//SとNで共通
		CameraEmptyM = "camera_002_ALLYM";
		//CameraEmptyG = "camera_003_ALLYG";
		CameraEmptyG = "camera_003_ALLYG_03";
		CameraEmptyT = "camera_004_ALLYT";
		CameraTargetEmptyS = "camtgt_001_ALLYS";
		CameraTargetEmptyN = "camtgt_001_ALLYS";	//SとNで共通
		CameraTargetEmptyM = "camtgt_002_ALLYM";
		//CameraTargetEmptyG = "camtgt_003_ALLYG";
		CameraTargetEmptyG = "camtgt_003_ALLYG_03";
		CameraTargetEmptyT = "camtgt_004_ALLYT";
		EffectEmptyS = "pos_301_ALLYEffectS";
		EffectEmptyN = "pos_302_ALLYEffectN";
		EffectEmptyM = "pos_303_ALLYEffectM";
		EffectEmptyG = "pos_304_ALLYEffectG";
		EffectEmptyT = "pos_305_ALLYEffectT";
	} else {
		AttackEmptyS = "move_150_ENEMY00S";
		AttackEmptyN = "move_150_ENEMY00S";	//SとNで共通
		AttackEmptyM = "move_151_ENEMY01M";
		AttackEmptyG = "move_152_ENEMY02G";
		AttackEmptyT = "move_153_ENEMY03T";
		CameraEmptyS = "camera_011_ENEMYS";
		CameraEmptyN = "camera_011_ENEMYS";	//SとNで共通
		CameraEmptyM = "camera_012_ENEMYM";
		//CameraEmptyG = "camera_013_ENEMYG";
		CameraEmptyG = "camera_013_ENEMYG_03";
		CameraEmptyT = "camera_014_ENEMYT";
		CameraTargetEmptyS = "camtgt_011_ENENYS";
		CameraTargetEmptyN = "camtgt_011_ENENYS";	//SとNで共通
		CameraTargetEmptyM = "camtgt_012_ENEMYM";
		//CameraTargetEmptyG = "camtgt_013_ENEMYG";
		CameraTargetEmptyG = "camtgt_013_ENEMYG_03";
		CameraTargetEmptyT = "camtgt_014_ENEMYT";
		EffectEmptyS = "pos_351_ENEMYEffectS";
		EffectEmptyN = "pos_352_ENEMYEffectN";
		EffectEmptyM = "pos_353_ENEMYEffectM";
		EffectEmptyG = "pos_354_ENEMYEffectG";
		EffectEmptyT = "pos_355_ENEMYEffectT";
	}
	
	//Spellcast用管理変数
	local CameraEmpty;
	local CameraTargetEmpty;
	local AttackEmpty;
	local EffectEmpty;
	local SizeWait;
	
	//Ｓサイズの場合
	if(gAttackSize == SIZE_S ){
		//引数の設定
		CameraEmpty = CameraEmptyS;
		CameraTargetEmpty = CameraTargetEmptyS;
		AttackEmpty = AttackEmptyS;
		EffectEmpty = EffectEmptyS;
		SizeWait = SizeWaitS;
	//Ｎサイズの場合
	} else if(gAttackSize == SIZE_N ){
		//引数の設定
		CameraEmpty = CameraEmptyN;
		CameraTargetEmpty = CameraTargetEmptyN;
		AttackEmpty = AttackEmptyN;
		EffectEmpty = EffectEmptyN;
		SizeWait = SizeWaitN;
	//Ｍサイズの場合
	} else if(gAttackSize == SIZE_M ){
		//引数の設定
		CameraEmpty = CameraEmptyM;
		CameraTargetEmpty = CameraTargetEmptyM;
		AttackEmpty = AttackEmptyM;
		EffectEmpty = EffectEmptyM;
		SizeWait = SizeWaitM;
	//Ｇサイズの場合
	} else if(gAttackSize == SIZE_G ){
		//引数の設定
		CameraEmpty = CameraEmptyG;
		CameraTargetEmpty = CameraTargetEmptyG;
		AttackEmpty = AttackEmptyG;
		EffectEmpty = EffectEmptyG;
		SizeWait = SizeWaitG;
	//Ｔサイズの場合
	} else {
		//引数の設定
		CameraEmpty = CameraEmptyT;
		CameraTargetEmpty = CameraTargetEmptyT;
		AttackEmpty = AttackEmptyT;
		EffectEmpty = EffectEmptyT;
		SizeWait = SizeWaitT;
	}
	SpellCast(CameraEmpty,CameraTargetEmpty,AttackEmpty,SizeWait,EffectEmpty);
	
	local CharaStandFlag = true;		//キャラの配置は行わない
	local WaitFlag = true;				//演出終了を待つ
	
	if(cAction.SelfTargetFlag == true){
		CharaStandFlag = false;
	}
	
	SpecialCutCheck(gMultiCount);
	
	local SingleAttackFlag = false;
	Exception_2ndCheck(gMultiCount,SingleAttackFlag,cAction)
	
	LineEffect_Init(CharaStandFlag ,gMultiCount,gMultiStageCount,WaitFlag,cAction);
	
	DebugPrint("BATTLE016_OUT_function_Update")
	BatteleScript_End();
}

//呪文詠唱演出
function SpellCast(CameraEmpty,CameraTargetEmpty,AttackEmpty,SizeWait,EffectEmpty)
{
	DebugPrint("BATTLE016_function_SpellCast");
	local AllyFlag = IsAlly_(gAttack);
	
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
	
	local MonsterIndexNum0;
	local MonsterIndexNum1;
	local MonsterIndexNum2;
	local MonsterIndexNum3;
	
	local AllyFlag = IsAlly_(gAttack);
	if(AllyFlag == true){
		AttackS_PartyS4_00 = "move_110_ALLYPartyS4_00";
		AttackS_PartyS4_01 = "move_111_ALLYPartyS4_01";
		AttackS_PartyS4_02 = "move_112_ALLYPartyS4_02";
		AttackS_PartyS4_03 = "move_113_ALLYPartyS4_03";
		AttackS_PartyS3_00 = "move_114_ALLYPartyS3_00";
		AttackS_PartyS3_01 = "move_115_ALLYPartyS3_01";
		AttackS_PartyS3_02 = "move_116_ALLYPartyS3_02";
		AttackS_PartyG_00 = "move_117_ALLYPartyG_00";
		MonsterIndexNum0 = GetAllyIndex_(0);
		MonsterIndexNum1 = GetAllyIndex_(1);
		MonsterIndexNum2 = GetAllyIndex_(2);
		MonsterIndexNum3 = GetAllyIndex_(3);
		AttackS_Master = "move_100_ALLY00S_Master";
		AttackG_Master = "move_102_ALLY02G_Master";
		AttackT_Master = "move_103_ALLY03T_Master";
		Master = GetAllyMaster_();
	} else {
		AttackS_PartyS4_00 = "move_160_ENEMYPartyS4_00";
		AttackS_PartyS4_01 = "move_161_ENEMYPartyS4_01";
		AttackS_PartyS4_02 = "move_162_ENEMYPartyS4_02";
		AttackS_PartyS4_03 = "move_163_ENEMYPartyS4_03";
		AttackS_PartyS3_00 = "move_164_ENEMYPartyS3_00";
		AttackS_PartyS3_01 = "move_165_ENEMYPartyS3_01";
		AttackS_PartyS3_02 = "move_166_ENEMYPartyS3_02";
		AttackS_PartyG_00 = "move_167_ENEMYPartyG_00";
		MonsterIndexNum0 = GetEnemyIndex_(0);
		MonsterIndexNum1 = GetEnemyIndex_(1);
		MonsterIndexNum2 = GetEnemyIndex_(2);
		MonsterIndexNum3 = GetEnemyIndex_(3);
		AttackS_Master = "move_150_ENEMY00S_Master";
		AttackG_Master = "move_152_ENEMY02G_Master";
		AttackT_Master = "move_153_ENEMY03T_Master";
		Master = GetEnemyMaster_();
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
			//マスター配置
			if(gRideFlag == false){SetMaster_Empty(Master,AttackS_Master,null);}
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
			//マスター配置
			if(gRideFlag == false){SetMaster_Empty(Master,AttackS_Master,null);}
		} else {}
		if(PartyType == PARTYTYPE.S2){		//S2
			if(Party00 == MonsterIndexNum0){
				SetMonster_Empty(Party00,AttackS_PartyS3_00,null);
			} else if(Party00 == MonsterIndexNum1){
				SetMonster_Empty(Party00,AttackS_PartyS3_02,null);
			} else {}
			//マスター配置
			if(gRideFlag == false){SetMaster_Empty(Master,AttackS_Master,null);}
		} else {}
		if(PartyType == PARTYTYPE.S1){		//S1
			//S1では何もしない
			SetMaster_Empty(Master,AttackS_Master,null);
		} else {}
		if(PartyType == PARTYTYPE.SG || PartyType == PARTYTYPE.GS){		//SG・GS
			//Gの場合はモンスターインデックスに関係なく固定位置
			if(Party00 == MonsterIndexNum0){
				SetMonster_Empty(Party00,AttackS_PartyG_00,null);
			} else if(Party00 == MonsterIndexNum1){
				SetMonster_Empty(Party00,AttackS_PartyG_00,null);
			} else {}
			//マスター配置
			if(gRideFlag == false){SetMaster_Empty(Master,AttackG_Master,null);}
		} else {}
	} else if(gAttackSize == SIZE_G){
		if(PartyType == PARTYTYPE.SG || PartyType == PARTYTYPE.GS){		//SG・GS
			//SGの場合、一旦モンスターは配置しない
			if(gRideFlag == false){SetMaster_Empty(Master,AttackG_Master,null);}
		} else {}
		if(PartyType == PARTYTYPE.G1){		//G1
			//G1では何もしない
			if(gRideFlag == false){SetMaster_Empty(Master,AttackG_Master,null);}
		} else {}
	}  else if(gAttackSize == SIZE_T){
		//Tは必ず１体なので何もしない
		if(gRideFlag == false){SetMaster_Empty(Master,AttackT_Master,null);}
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
	
	
	//上級魔法演出判定
	HighRankSpellEffect(gMultiCount,EffectEmpty,cAction)
	
	gAttackTask = Task_AnimeMoveCharNoDir_(gAttack, AttackEmpty);
	
	switch(gAttackSize)
	{
	case SIZE_T:
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
		if(CentralPos.y < LowSetting){
			//低いモンスタ
			if(IsAlly_(gAttack)){
				//味方側
				//gCameraTask = Task_AnimeMoveCamera_(CameraNum_AllyLow,CameraTargetNum_AllyRow);
				gCameraTask = Task_AnimeMoveCamera_(CameraEmpty,CameraTargetEmpty);
			} else {
				//敵側
				//gCameraTask = Task_AnimeMoveCamera_(CameraNum_EnemyLow,CameraTargetNum_EnemyRow);
				gCameraTask = Task_AnimeMoveCamera_(CameraEmpty,CameraTargetEmpty);
			}
		} else if(CentralPos.y >= LowSetting && CentralPos.y < HighSetting){
			//平均
			gCameraTask = Task_AnimeMoveCamera_(CameraEmpty,CameraTargetEmpty);
		} else {
			//高いモンスター
			if(IsAlly_(gAttack)){
				gCameraTask = Task_AnimeMoveCamera_(CameraNum_AllyHigh,CameraTargetNum_AllyHigh);
			} else {
				gCameraTask = Task_AnimeMoveCamera_(CameraNum_EnemyHigh,CameraTargetNum_EnemyHigh);
			}
		}
		break;
	default:
		gCameraTask = Task_AnimeMoveCamera_(CameraEmpty , CameraTargetEmpty);
		break;
	}
	
	//
	//Effect2
	//local IndexPos = GetBonePos_(gAttack,"Effect2")
	//DebugPrint("IndexPos : " + IndexPos.x + " , " +  IndexPos.y +  " , " +IndexPos.z + "\n")
	
	switch(gAttackSize)
	{
	case SIZE_T:
		T_Action()
		break;
	default:
		SNMG_Action()
		break;
	}
	
	//各サイズの総フレーム数
	//Ｓは６０Ｆ
	//Ｍは７５Ｆ
	//Ｇは９０Ｆ
	//Ｔは１０５Ｆ
	//DeleteTask_(gCameraTask);
}

function SNMG_Action()
{
	SetMotion_(gAttack, MOT_PARTICULAR_START, 4);
	Wait_(15);
	local LineWork = SetCameraEffect_("EF000_03_SHUCHUSEN", 100);
	SetMotion_(gAttack, MOT_PARTICULAR_EXERCISE, 4);
	Task_ChangeMotion_(gAttack, MOT_WAIT, 4);
	Wait_(45);	
	
}

function T_Action()
{
	SetMotion_(gAttack, MOT_PARTICULAR_START, 4);
	Task_ChangeMotion_(gAttack, MOT_PARTICULAR_CHANT, 0);
	Wait_(80);
	local LineWork = SetCameraEffect_("EF000_03_SHUCHUSEN", 100);
	SetMotion_(gAttack, MOT_PARTICULAR_EXERCISE, 4);
	Task_ChangeMotion_(gAttack, MOT_WAIT, 4);
	Wait_(45);		
	
}
