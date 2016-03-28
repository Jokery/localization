// 通常攻撃用

// 初期化
function Init()
{
	DebugPrint("BATTLE007_function_Init");
	BattleCommon_Init();
	gAttack <- GetActorIndex_(0);
	gTarget <- GetTargetIndex_(0,0);
	gTargetSize <- GetMonsterSize_(gTarget);
	gTarget2 <- GetExtra(gTarget,0);
	ChangeIndexPointData_(PERSONAL_POINT_DATA);
	
	SetMotion_(gAttack, MOT_WAIT, 0);
	SetMotion_(gTarget, MOT_WAIT, 0);
	
	//SetDamageMotion用引数
	gMultiCount <- 0;
	gPos <- GetFbxPointPos_("pos_000");
	gTargetDir <- 180;
	gDeletetaskFlag <- true;
	gPierceFlag <- false;
	cAttack <- cMonsterInfo(gAttack)
	cTarget <- cTargetMonsterInfo(gTarget,gMultiCount)
	
	if(IsScout_()){
		cAction <- null;
	} else {
		cAction <- cActionInfo(gMultiCount) 
		Debug_cActionPrint(cAction)
		ChangeIndexPointData_(PERSONAL_POINT_DATA);
	}
	gAttackTask <- null;
	gTargetTask <- null;
	
	//エフェクト
	LoadEffect();

	//Script開始時チェック
	ScriptStartCheck()

}

// 更新
function Update()
{
	DebugPrint("BATTLE007_function_Update");
	StandbyCut_Assault(gMultiCount,cAction);
	ChangeIndexPointData_(PERSONAL_POINT_DATA);
	DeleteAllTask_();

	//状況判定分岐
	local AttackSize;
	AttackSize = GetMonsterSize_(gAttack);

	if(AttackSize == SIZE_S || AttackSize == SIZE_N){
		SAction();
	}
	else if(AttackSize == SIZE_M){
		MAction();
	}
	else{
		GAction();
	}
	
	BatteleScript_End();
}

// 行動者がＳサイズの場合
function SAction()
{
	DebugPrint("BATTLE007_function_SAction");
	//local StartFrame = 114;
	//local WaitFrame = 37;
	local WaitFrame = 20;
	local StartFrame = 151 - WaitFrame;
	if(cAttack.Size == SIZE_S){
		if(cTarget.Size == SIZE_S){
			gAttackTask = Task_SetFrameAnimeMoveChar_(gAttack, "move_EnemyAttack0000_StoS",StartFrame);
			gTargetTask = Task_SetFrameAnimeMoveCharNoDir_(gTarget, "move_AllyTarget00_S",StartFrame);
			Task_SetFrameAnimeMoveCamera_("camera_AttackStoTargetSN" , "camtgt_AttackStoTargetSN",StartFrame);
			SetSceneOffsetFromMove_(gTarget, "move_AllyTarget00_S");
		} else if(cTarget.Size == SIZE_N){
			gAttackTask = Task_SetFrameAnimeMoveChar_(gAttack, "move_EnemyAttack0001_StoN",StartFrame);
			gTargetTask = Task_SetFrameAnimeMoveCharNoDir_(gTarget, "move_AllyTarget01_N",StartFrame);
			Task_SetFrameAnimeMoveCamera_("camera_AttackStoTargetSN" , "camtgt_AttackStoTargetSN",StartFrame);
			SetSceneOffsetFromMove_(gTarget, "move_AllyTarget01_N");
		} else if(cTarget.Size == SIZE_M){
			gAttackTask = Task_SetFrameAnimeMoveChar_(gAttack, "move_EnemyAttack0002_StoM",StartFrame);
			gTargetTask = Task_SetFrameAnimeMoveCharNoDir_(gTarget, "move_AllyTarget02_M",StartFrame);
			Task_SetFrameAnimeMoveCamera_("camera_AttackStoTargetM" , "camtgt_AttackStoTargetM",StartFrame);
			SetSceneOffsetFromMove_(gTarget, "move_AllyTarget01_N");
		} else if(cTarget.Size == SIZE_G){
			gAttackTask = Task_SetFrameAnimeMoveChar_(gAttack, "move_EnemyAttack0003_StoG",StartFrame);
			gTargetTask = Task_SetFrameAnimeMoveCharNoDir_(gTarget, "move_AllyTarget03_G",StartFrame);
			Task_SetFrameAnimeMoveCamera_("camera_AttackStoTargetG" , "camtgt_AttackStoTargetG",StartFrame);
			SetSceneOffsetFromMove_(gTarget, "move_AllyTarget03_G");
			if(gTarget2 != INVALID_CHARACTER){
				SetVisible_(gTarget2, false);
			}
		} else if(cTarget.Size == SIZE_T){
			gAttackTask = Task_SetFrameAnimeMoveChar_(gAttack, "move_EnemyAttack0004_StoT",StartFrame);
			gTargetTask = Task_SetFrameAnimeMoveCharNoDir_(gTarget, "move_AllyTarget04_T",StartFrame);
			Task_SetFrameAnimeMoveCamera_("camera_AttackStoTargetT" , "camtgt_AttackStoTargetT",StartFrame);
			SetSceneOffsetFromMove_(gTarget, "move_AllyTarget04_T");
		}
	} else if(cAttack.Size == SIZE_N){
		if(cTarget.Size == SIZE_S){
			gAttackTask = Task_SetFrameAnimeMoveChar_(gAttack, "move_EnemyAttack0100_NtoS",StartFrame);
			gTargetTask = Task_SetFrameAnimeMoveCharNoDir_(gTarget, "move_AllyTarget00_S",StartFrame);
			Task_SetFrameAnimeMoveCamera_("camera_AttackNtoTargetSN" , "camtgt_AttackNtoTargetSN",StartFrame);
			SetSceneOffsetFromMove_(gTarget, "move_AllyTarget00_S");
		} else if(cTarget.Size == SIZE_N){
			gAttackTask = Task_SetFrameAnimeMoveChar_(gAttack, "move_EnemyAttack0101_NtoN",StartFrame);
			gTargetTask = Task_SetFrameAnimeMoveCharNoDir_(gTarget, "move_AllyTarget01_N",StartFrame);
			Task_SetFrameAnimeMoveCamera_("camera_AttackNtoTargetSN" , "camtgt_AttackNtoTargetSN",StartFrame);
			SetSceneOffsetFromMove_(gTarget, "move_AllyTarget01_N");
		} else if(cTarget.Size == SIZE_M){
			gAttackTask = Task_SetFrameAnimeMoveChar_(gAttack, "move_EnemyAttack0102_NtoM",StartFrame);
			gTargetTask = Task_SetFrameAnimeMoveCharNoDir_(gTarget, "move_AllyTarget02_M",StartFrame);
			Task_SetFrameAnimeMoveCamera_("camera_AttackNtoTargetM" , "camtgt_AttackNtoTargetM",StartFrame);
			SetSceneOffsetFromMove_(gTarget, "move_AllyTarget02_M");
		} else if(cTarget.Size == SIZE_G){
			gAttackTask = Task_SetFrameAnimeMoveChar_(gAttack, "move_EnemyAttack0103_NtoG",StartFrame);
			gTargetTask = Task_SetFrameAnimeMoveCharNoDir_(gTarget, "move_AllyTarget03_G",StartFrame);
			Task_SetFrameAnimeMoveCamera_("camera_AttackNtoTargetG" , "camtgt_AttackNtoTargetG",StartFrame);
			SetSceneOffsetFromMove_(gTarget, "move_AllyTarget03_G");
			if(gTarget2 != INVALID_CHARACTER){
				SetVisible_(gTarget2, false);
			}
		} else if(cTarget.Size == SIZE_T){
			gAttackTask = Task_SetFrameAnimeMoveChar_(gAttack, "move_EnemyAttack0104_NtoT",StartFrame);
			gTargetTask = Task_SetFrameAnimeMoveCharNoDir_(gTarget, "move_AllyTarget04_T",StartFrame);
			Task_SetFrameAnimeMoveCamera_("camera_AttackNtoTargetT" , "camtgt_AttackNtoTargetT",StartFrame);
			SetSceneOffsetFromMove_(gTarget, "move_AllyTarget04_T");
		}
	}
	
	
	SetMotion_(gAttack, MOT_MOVE_LOOP, 0);
	SetMotionFrame_(gAttack,60-WaitFrame)
	
	Wait_(WaitFrame);
	
	SetMotion_(gAttack, MOT_ATTACK, 0);
	Task_ChangeMotion_(gAttack, MOT_WAIT, 0);
	
	Wait_(ATTACKMOTIONWAIT);
	
	SetDir_(gTarget, gTargetDir);
	local effect = EffParamSizeEffect(gTarget,"EF000_14_SMOKE_FOOT");
	SetDamageMotion(gTarget,gDeletetaskFlag,gTargetTask,gMultiCount,gPos,gPierceFlag,cAction);
	ChangeIndexPointData_(PERSONAL_POINT_DATA);
	SetDamageMotion_EndWait(20,effect,15)
}

// 行動者がＭサイズの場合
function MAction()
{
	DebugPrint("BATTLE007_function_MAction");
	//local WaitFrame = 30;
	local WaitFrame = 20;
	local StartFrame = 150 - WaitFrame;
	if(cTarget.Size == SIZE_S){
		gAttackTask = Task_SetFrameAnimeMoveChar_(gAttack, "move_EnemyAttack0200_MtoS",StartFrame);
		gTargetTask = Task_SetFrameAnimeMoveCharNoDir_(gTarget, "move_AllyTarget00_S",StartFrame);
		SetSceneOffsetFromMove_(gTarget, "move_AllyTarget00_S");
	} else if(cTarget.Size == SIZE_N){
		gAttackTask = Task_SetFrameAnimeMoveChar_(gAttack, "move_EnemyAttack0201_MtoN",StartFrame);
		gTargetTask = Task_SetFrameAnimeMoveCharNoDir_(gTarget, "move_AllyTarget01_N",StartFrame);
		SetSceneOffsetFromMove_(gTarget, "move_AllyTarget01_N");
	} else if(cTarget.Size == SIZE_M){
		gAttackTask = Task_SetFrameAnimeMoveChar_(gAttack, "move_EnemyAttack0202_MtoM",StartFrame);
		gTargetTask = Task_SetFrameAnimeMoveCharNoDir_(gTarget, "move_AllyTarget02_M",StartFrame);
		SetSceneOffsetFromMove_(gTarget, "move_AllyTarget01_N");
	} else if(cTarget.Size == SIZE_G){
		gAttackTask = Task_SetFrameAnimeMoveChar_(gAttack, "move_EnemyAttack0203_MtoG",StartFrame);
		gTargetTask = Task_SetFrameAnimeMoveCharNoDir_(gTarget, "move_AllyTarget03_G",StartFrame);
		SetSceneOffsetFromMove_(gTarget, "move_AllyTarget03_G");
	} else if(cTarget.Size == SIZE_T){
		gAttackTask = Task_SetFrameAnimeMoveChar_(gAttack, "move_EnemyAttack0204_MtoT",StartFrame);
		gTargetTask = Task_SetFrameAnimeMoveCharNoDir_(gTarget, "move_AllyTarget04_T",StartFrame);
		SetSceneOffsetFromMove_(gTarget, "move_AllyTarget04_T");
	}
	
	if(cTarget.Size == SIZE_M){
		Task_SetFrameAnimeMoveCamera_("camera_AttackMtoTargetM" , "camtgt_AttackMtoTargetM",StartFrame);
	} else if(cTarget.Size == SIZE_G){
		//Ｇサイズの場合
		Task_SetFrameAnimeMoveCamera_("camera_AttackMtoTargetG" , "camtgt_AttackMtoTargetG",StartFrame);
		if(gTarget2 != INVALID_CHARACTER){
			SetVisible_(gTarget2, false);
		}
	} else if(cTarget.Size == SIZE_T){
		//Ｔサイズの場合
		Task_SetFrameAnimeMoveCamera_("camera_AttackMtoTargetT" , "camtgt_AttackMtoTargetT",StartFrame);
	} else {
		//それ以外の場合
		Task_SetFrameAnimeMoveCamera_("camera_AttackMtoTargetSN" , "camtgt_AttackMtoTargetSN",StartFrame);
	}
	
	SetMotion_(gAttack, MOT_MOVE_LOOP, 0);
	//SetMotionFrame_(gAttack,13)
	
	Wait_(WaitFrame);
	
	SetMotion_(gAttack, MOT_ATTACK, 3);
	Task_ChangeMotion_(gAttack, MOT_WAIT, 0);
	
	Wait_(ATTACKMOTIONWAIT);
	
	SetDir_(gTarget, gTargetDir);
	local effect = EffParamSizeEffect(gTarget,"EF000_14_SMOKE_FOOT");
	SetDamageMotion(gTarget,gDeletetaskFlag,gTargetTask,gMultiCount,gPos,gPierceFlag,cAction);
	ChangeIndexPointData_(PERSONAL_POINT_DATA);
	SetDamageMotion_EndWait(20,effect,15)
}

