// 特殊（全体/味方）

// 初期化
function Init()
{
	DebugPrint("BATTLE015_IN_function_Init")
	BattleCommon_Init();
	gAttack <- GetActorIndex_(0);
	gAttackSize <- GetMonsterSize_(gAttack);
	gTargetNum <- GetTargetNum_(0);

	gTarget1 <- INVALID_CHARACTER;
	gTarget2 <- INVALID_CHARACTER;
	gTarget3 <- INVALID_CHARACTER;

	// 行動者以外の、行動者の味方を保存
	local isAlly = IsAlly_(gAttack);
	local attackAllyExtra = [];
	for(local i = 0; i < 4; i++){
		local index = INVALID_CHARACTER;
		if(isAlly){
			index = GetAllyIndex_(i);
		} else {
			index = GetEnemyIndex_(i);
		}
		 
		if(index != gAttack){
			attackAllyExtra.append(index);
		}
	}
	// 蘇生対象者
	local revivalTarget = [];
	for(local i = 0; i < gTargetNum; i++){
		if(IsRevival_(0, i)){
			revivalTarget.append(GetTargetIndex_(0, i));
		}
	}
	// 死んでて蘇生もしないかどうか
	local targetIndex = [];
	for(local i = 0; i < attackAllyExtra.len(); i++){
		// 生きてる以外
		if(GetInitExistType_(attackAllyExtra[i]) != LIVETYPE.ACTIVE){
			//蘇生対象なら、ターゲットに含める
			for(local j = 0; j < revivalTarget.len(); j++){
				if(attackAllyExtra[i] == revivalTarget[j]){
					targetIndex.append(attackAllyExtra[i]);
				}
			}
		} else {
			targetIndex.append(attackAllyExtra[i]);
		}
	}
	// 各ターゲットにインデックスを設定
	if(targetIndex.len() >= 1){
		gTarget1 = targetIndex[0];
	}
	if(targetIndex.len() >= 2){
		gTarget2 = targetIndex[1];
	}
	if(targetIndex.len() >= 3){
		gTarget3 = targetIndex[2];
	}

	cAction <- cActionInfo(0)
	Debug_cActionPrint(cAction)
	ChangeIndexPointData_(PERSONAL_POINT_DATA);
	gTarget1Type <- LIVETYPE.NONE;
	gTarget2Type <- LIVETYPE.NONE;
	gTarget3Type <- LIVETYPE.NONE;
	DebugPrint("gTarget1 : " + gTarget1);
	DebugPrint("gTarget2 : " + gTarget2);
	DebugPrint("gTarget3 : " + gTarget3);
	if(gTarget1 != INVALID_CHARACTER){gTarget1Type = GetInitExistType_(gTarget1);}
	if(gTarget2 != INVALID_CHARACTER){gTarget2Type = GetInitExistType_(gTarget2);}
	if(gTarget3 != INVALID_CHARACTER){gTarget3Type = GetInitExistType_(gTarget3);}
	gTarget1Size <- SIZE_S;
	gTarget2Size <- SIZE_S;
	gTarget3Size <- SIZE_S;
	gMultiCount <- 0;
	gMultiStageCount <- 0;
	gExtraPartyNum <- 0;
	
	if(gTargetNum >= 2 && gTarget1Type != LIVETYPE.NONE){
		gTarget1Size = GetMonsterSize_(gTarget1);
		gExtraPartyNum++
	} else {}
	if(gTargetNum >= 3 && gTarget2Type != LIVETYPE.NONE){
		gTarget2Size = GetMonsterSize_(gTarget2);
		gExtraPartyNum++
	} else {}
	if(gTargetNum >= 4 && gTarget3Type != LIVETYPE.NONE){
		gTarget3Size = GetMonsterSize_(gTarget3);
		gExtraPartyNum++
	} else {}
	
	LoadEffect();
	
	SetVisibleNeedModel_();
	ChangeIndexPointData_(PERSONAL_POINT_DATA);
	DebugPrint("BATTLE015_OUT_function_Init")
}


// 更新
function Update()
{
	DebugPrint("BATTLE015_IN_function_Update")
	StandbyCut_Magic(gMultiCount,cAction);
	DeleteAllTask_();
	EnenyMonsterUnVisible();
	DeleteAllTask_();
	ChangeIndexPointData_(PERSONAL_POINT_DATA);

	SetVisible_(gAttack,true);
	SetMotion_(gAttack, MOT_PARTICULAR_CHANT, 4);
	SetDir_(gAttack, 270);
	
	//ターゲットモンスターを非表示にする
	local Target = GetTargetIndex_(0,0);
	if(gAttack != Target){
		SetVisible_(Target, false)
	}
	
	local Target1Empty = "move_207_DefenseS";
	local Target2Empty = "move_205_DefenseS";
	local Target3Empty = "move_206_DefenseS";
	local TargetGEmpty = "move_208_DefenseG";
	local Target1Dir = 90;
	local Target2Dir = 90;
	local Target3Dir = 90;
	local TargetGDir = 90;
	local AttackEmptyS = "move_101_AttackS"
	local AttackEmptyM = "move_102_AttackM"
	local AttackEmptyG = "move_103_AttackG"
	local AttackEmptyT = "move_104_AttackT"
	local CamS		= "camera_AttackSN_SNM"
	local CamM		= "camera_AttackM_SNM"
	local CamS_G	= "camera_AttackSN_G"
	local CamG		= "camera_AttackG_SN"
	local CamT		= "camera_AttackT"
	local CamTgtS	= "camtgt_AttackSN_SNM"
	local CamTgtM	= "camtgt_AttackM_SNM"
	local CamTgtS_G	= "camtgt_AttackSN_G"
	local CamTgtG	= "camtgt_AttackG_SN"
	local CamTgtT	= "camtgt_AttackT"
	
	//TargetEmpty設定
	if(gExtraPartyNum == 3){
		Target1Empty = "move_207_DefenseS";
		Target2Empty = "move_205_DefenseS";
		Target3Empty = "move_206_DefenseS";
	} else if(gExtraPartyNum == 2){
		Target1Empty = "move_207_DefenseS";
		Target2Empty = "move_206_DefenseS";
	} else if(gExtraPartyNum == 1){
		if(gAttackSize != SIZE_G ){
			Target1Empty = "move_205_DefenseS";
		} else {
			Target1Empty = "move_209_DefenseS";
		}
	}
	
	//ターゲット数に応じて、配置を行う。
	if(gTarget1 != INVALID_CHARACTER){
		if(gTarget1Size != SIZE_G){
			SetMonster_Empty(gTarget1,Target1Empty,Target1Dir);
		} else {
			//Ｇサイズのみ配置位置を調整する。
			local Target1Empty	= TargetGEmpty;
			local Target1Dir	= TargetGDir;
			SetMonster_Empty(gTarget1,Target1Empty,Target1Dir);
		}
	}
	if(gTarget2 != INVALID_CHARACTER){
		SetMonster_Empty(gTarget2,Target2Empty,Target2Dir);
	}
	if(gTarget3 != INVALID_CHARACTER){
		SetMonster_Empty(gTarget3,Target3Empty,Target3Dir);
	}
	
	//Ｓサイズの場合
	if(gAttackSize == SIZE_S || gAttackSize == SIZE_N){
		//引数の設定
		local CameraNum = CamS;
		local CameragTargetNum = CamTgtS;
		local CharaPoint = AttackEmptyS;
		local SizeWait = 25;
		//SG組み合わせの場合はGカメラを利用
		local Extra = GetExtra(gAttack,0);
		local ExtraSize = null;
		if(Extra != INVALID_CHARACTER){
			ExtraSize = GetMonsterSize_(Extra)
			if(ExtraSize == SIZE_G){
				CameraNum = CamS_G;
				CameragTargetNum = CamTgtS_G;
			}
		}
		SpellCast(CameraNum,CameragTargetNum,CharaPoint,SizeWait,gAttackSize);
	//Ｍサイズの場合
	} else if(gAttackSize == SIZE_M ){
		//引数の設定
		local CameraNum = CamM;
		local CameragTargetNum = CamTgtM;
		local CharaPoint = AttackEmptyM;
		local SizeWait = 45;
		SpellCast(CameraNum,CameragTargetNum,CharaPoint,SizeWait,gAttackSize);
	//Ｇサイズの場合
	} else if(gAttackSize == SIZE_G ){
		//引数の設定
		local CameraNum = CamG;
		local CameragTargetNum = CamTgtG;
		local CharaPoint = AttackEmptyG;
		local SizeWait = 60;
		SpellCast(CameraNum,CameragTargetNum,CharaPoint,SizeWait,gAttackSize);
	//Ｔサイズの場合
	} else {
		//引数の設定
		local CameraNum = CamT;
		local CameragTargetNum = CamTgtT;
		local CharaPoint = AttackEmptyT;
		local SizeWait = 75;
		SpellCast(CameraNum,CameragTargetNum,CharaPoint,SizeWait,gAttackSize);
	}
	
	local CharaStandFlag = false;
	local WaitFlag = true;
	
	LineEffect_Init(CharaStandFlag ,gMultiCount,gMultiStageCount,WaitFlag,cAction);
	ChangeIndexPointData_(PERSONAL_POINT_DATA);
	
	DebugPrint("BATTLE015_OUT_function_Update")
	BatteleScript_End();
}

//カット１
function SpellCast(CameraNum,CameragTargetNum,CharaPoint,SizeWait,gAttackSize)
{
	DebugPrint("BATTLE015_IN_function_SpellCast")
	
	Task_AnimeMoveCamera_(CameraNum,CameragTargetNum);
	Task_AnimeMoveCharNoDir_(gAttack, CharaPoint);
	
	//魔力の暴走判定
	MagicRunawayQuake(gMultiCount)
	
	//詠唱用エフェクトの表示
	SpellCastEffect(gAttack,gMultiCount)
	
	SetMotion_(gAttack, MOT_PARTICULAR_START, 0);
	Wait_(5);
	SetMotion_(gAttack, MOT_PARTICULAR_CHANT, 4);
	Wait_(10);
	SetMotion_(gAttack, MOT_PARTICULAR_EXERCISE, 4);
	Task_ChangeMotion_(gAttack, MOT_WAIT, 4);
	Wait_(10);

	DebugPrint("BATTLE015_OUT_function_SpellCast")

}


//相手モンスターを非表示にする
function EnenyMonsterUnVisible()
{
	DebugPrint("BATTLE015_IN_function_EnenyMonsterUnVisible")
	local AllyFlag = IsAlly_(gAttack);
	local Monster1 = GetAllyIndex_(0);
	local Monster2 = GetAllyIndex_(1);
	local Monster3 = GetAllyIndex_(2);
	local Monster4 = GetAllyIndex_(3);
	local Monster1Type = GetInitExistType_(Monster1)
	local Monster2Type = GetInitExistType_(Monster2)
	local Monster3Type = GetInitExistType_(Monster3)
	local Monster4Type = GetInitExistType_(Monster4)

	if(AllyFlag == true){
		Monster1 = GetEnemyIndex_(0);
		Monster2 = GetEnemyIndex_(1);
		Monster3 = GetEnemyIndex_(2);
		Monster4 = GetEnemyIndex_(3);
		Monster1Type = GetInitExistType_(Monster1)
		Monster2Type = GetInitExistType_(Monster2)
		Monster3Type = GetInitExistType_(Monster3)
		Monster4Type = GetInitExistType_(Monster4)
	}
	
	if(Monster1Type != LIVETYPE.NONE){
		SetVisible_(Monster1, false);
	}
	if(Monster2Type != LIVETYPE.NONE){
		SetVisible_(Monster2, false);
	}
	if(Monster3Type != LIVETYPE.NONE){
		SetVisible_(Monster3, false);
	}
	if(Monster4Type != LIVETYPE.NONE){
		SetVisible_(Monster4, false);
	}
	DebugPrint("BATTLE015_OUT_function_EnenyMonsterUnVisible")
}

