// 通常攻撃用

// 初期化
function Init()
{
	DebugPrint("BATTLE004_function_Init");
	BattleCommon_Init();
	gAttack <- GetActorIndex_(0);
	gTarget <- GetTargetIndex_(0,0);
	gTargetSize <- GetMonsterSize_(gTarget);
	gTarget2 <- GetExtra(gTarget,0);
	ChangeIndexPointData_(PERSONAL_POINT_DATA);
	//SetDamageMotion用引数
	gMultiCount <- 0;
	gPos <- GetFbxPointPos_("pos_000");
	gTargetDir <- 0;
	gDeletetaskFlag <- true;
	gAttackTask <- null;
	gTargetTask <- null;
	gPierceFlag <- false;
	cAttack <- cMonsterInfo(gAttack)
	cTarget <- cMonsterInfo(gTarget)
	
	if(IsScout_()){
		cAction <- null
	} else {
		cAction <- cActionInfo(0)
		Debug_cActionPrint(cAction)
		ChangeIndexPointData_(PERSONAL_POINT_DATA);
	}
	
	SetMotion_(cAttack.Index, MOT_WAIT, 0);
	SetMotion_(gTarget, MOT_WAIT, 0);
	
	//エフェクト
	LoadEffect();
	
	//Script開始時チェック
	ScriptStartCheck()
}

// 更新
function Update()
{
	DebugPrint("BATTLE004_function_Update");
	StandbyCut_Assault(gMultiCount,cAction);
	ChangeIndexPointData_(PERSONAL_POINT_DATA);
	DeleteAllTask_();
	
	
	
	//状況判定分岐
	if(cAttack.Size == SIZE_S || cAttack.Size == SIZE_N){
		SNAction();
	}
	else if(cAttack.Size == SIZE_M){
		MAction();
	}
	
	if(GetEventFlg_(BFG_TUTORIAL_RIDE)){
		if(IsRide_(gAttack)){
			switch(GetRound_())
			{
				case 0:
					OpenMessageWindow_();
					SetTalkName_("NAME_TAG_REACTOR");
					SetMessage_("RideTutorial_3");
					
					while(IsOpenMessageWindow_()){
					    Wait_(1);
					}
					break;
				case 1:
					OpenMessageWindow_();
					SetTalkName_("NAME_TAG_REACTOR");
					SetMessage_("RideTutorial_5");
					
					while(IsOpenMessageWindow_()){
					    Wait_(1);
					}
					break;
				default:
					break;
			}
		}
	}
	
	
	BatteleScript_End();
}

// 行動者がＳサイズの場合
function SNAction()
{
	DebugPrint("BATTLE004_function_SNAction");
	
	local StartFrame = 136;
	local WaitFrame = 15;
	
	if(cAttack.Size == SIZE_S){
		if(cTarget.Size == SIZE_S){
			gAttackTask = Task_SetFrameAnimeMoveChar_(gAttack, "move_AllyAttack0000_StoS",StartFrame);
			gTargetTask = Task_SetFrameAnimeMoveCharNoDir_(gTarget, "move_EnemyTarget00_S",StartFrame);
			SetSceneOffsetFromMove_(gTarget, "move_EnemyTarget00_S");
		} else if(cTarget.Size == SIZE_N){
			gAttackTask = Task_SetFrameAnimeMoveChar_(gAttack, "move_AllyAttack0001_StoN",StartFrame);
			gTargetTask = Task_SetFrameAnimeMoveCharNoDir_(gTarget, "move_EnemyTarget01_N",StartFrame);
			SetSceneOffsetFromMove_(gTarget, "move_EnemyTarget01_N");
		} else if(cTarget.Size == SIZE_M){
			gAttackTask = Task_SetFrameAnimeMoveChar_(gAttack, "move_AllyAttack0002_StoM",StartFrame);
			gTargetTask = Task_SetFrameAnimeMoveCharNoDir_(gTarget, "move_EnemyTarget02_M",StartFrame);
			SetSceneOffsetFromMove_(gTarget, "move_EnemyTarget02_M");
		} else if(cTarget.Size == SIZE_G){
			gAttackTask = Task_SetFrameAnimeMoveChar_(gAttack, "move_AllyAttack0003_StoG",StartFrame);
			gTargetTask = Task_SetFrameAnimeMoveCharNoDir_(gTarget, "move_EnemyTarget03_G",StartFrame);
			SetSceneOffsetFromMove_(gTarget, "move_EnemyTarget03_G");
		} else if(cTarget.Size == SIZE_T){
			gAttackTask = Task_SetFrameAnimeMoveChar_(gAttack, "move_AllyAttack0004_StoT",StartFrame);
			gTargetTask = Task_SetFrameAnimeMoveCharNoDir_(gTarget, "move_EnemyTarget04_T",StartFrame);
			SetSceneOffsetFromMove_(gTarget, "move_EnemyTarget04_T");
		}
	} else if(cAttack.Size == SIZE_N){
		if(cTarget.Size == SIZE_S){
			gAttackTask = Task_SetFrameAnimeMoveChar_(gAttack, "move_AllyAttack0100_NtoS",StartFrame);
			gTargetTask = Task_SetFrameAnimeMoveCharNoDir_(gTarget, "move_EnemyTarget00_S",StartFrame);
			SetSceneOffsetFromMove_(gTarget, "move_EnemyTarget00_S");
		} else if(cTarget.Size == SIZE_N){
			gAttackTask = Task_SetFrameAnimeMoveChar_(gAttack, "move_AllyAttack0101_NtoN",StartFrame);
			gTargetTask = Task_SetFrameAnimeMoveCharNoDir_(gTarget, "move_EnemyTarget01_N",StartFrame);
			SetSceneOffsetFromMove_(gTarget, "move_EnemyTarget01_N");
		} else if(cTarget.Size == SIZE_M){
			gAttackTask = Task_SetFrameAnimeMoveChar_(gAttack, "move_AllyAttack0102_NtoM",StartFrame);
			gTargetTask = Task_SetFrameAnimeMoveCharNoDir_(gTarget, "move_EnemyTarget02_M",StartFrame);
			SetSceneOffsetFromMove_(gTarget, "move_EnemyTarget02_M");
		} else if(cTarget.Size == SIZE_G){
			gAttackTask = Task_SetFrameAnimeMoveChar_(gAttack, "move_AllyAttack0103_NtoG",StartFrame);
			gTargetTask = Task_SetFrameAnimeMoveCharNoDir_(gTarget, "move_EnemyTarget03_G",StartFrame);
			SetSceneOffsetFromMove_(gTarget, "move_EnemyTarget03_G");
		} else if(cTarget.Size == SIZE_T){
			gAttackTask = Task_SetFrameAnimeMoveChar_(gAttack, "move_AllyAttack0104_NtoT",StartFrame);
			gTargetTask = Task_SetFrameAnimeMoveCharNoDir_(gTarget, "move_EnemyTarget04_T",StartFrame);
			SetSceneOffsetFromMove_(gTarget, "move_EnemyTarget04_T");
		}
	}
	
	if(cTarget.Size == SIZE_G){
		//Ｇサイズの場合
		Task_SetFrameAnimeMoveCamera_("camera_AttackStoTargetG" , "camtgt_AttackStoTargetG",StartFrame);
		if(gTarget2 != INVALID_CHARACTER){
			SetVisible_(gTarget2, false);
		}
	} else if(cTarget.Size == SIZE_T){
		//Ｔサイズの場合
		Task_SetFrameAnimeMoveCamera_("camera_AttackStoTargetT" , "camtgt_AttackStoTargetT",StartFrame);
	} else {
		//それ以外の場合
		Task_SetFrameAnimeMoveCamera_("camera_AttackStoTargetSNM" , "camtgt_AttackStoTargetSNM",StartFrame);
	}
	
	SetMotion_(gAttack, MOT_MOVE_LOOP, 0);
	SetMotionFrame_(gAttack, 30 % WaitFrame)
	Wait_(WaitFrame);
	
	SetMotion_(gAttack, MOT_ATTACK, 0);
	Task_ChangeMotion_(gAttack, MOT_WAIT, 0);
	Wait_(ATTACKMOTIONWAIT);
	
	SetDir_(gTarget, gTargetDir);
	
	local effect = EffParamSizeEffect(gTarget,"EF000_14_SMOKE_FOOT");
	SetDamageMotion(gTarget,gDeletetaskFlag,gTargetTask,gMultiCount,gPos,gPierceFlag,cAction);
	ChangeIndexPointData_(PERSONAL_POINT_DATA);
	SetDamageMotion_EndWait(20,effect,10)
}

// 行動者がＭサイズの場合
function MAction()
{
	DebugPrint("BATTLE004_function_MAction");
	
	local WaitFrame = 15;
	local StartFrame = 151-WaitFrame;
	if(cTarget.Size == SIZE_S){
		gAttackTask = Task_SetFrameAnimeMoveChar_(gAttack, "move_AllyAttack0200_MtoS",StartFrame);
		gTargetTask = Task_SetFrameAnimeMoveCharNoDir_(gTarget, "move_EnemyTarget00_S",StartFrame);
		SetSceneOffsetFromMove_(gTarget, "move_EnemyTarget00_S");
	} else if(cTarget.Size == SIZE_N){
		gAttackTask = Task_SetFrameAnimeMoveChar_(gAttack, "move_AllyAttack0201_MtoN",StartFrame);
		gTargetTask = Task_SetFrameAnimeMoveCharNoDir_(gTarget, "move_EnemyTarget01_N",StartFrame);
		SetSceneOffsetFromMove_(gTarget, "move_EnemyTarget01_N");
	} else if(cTarget.Size == SIZE_M){
		gAttackTask = Task_SetFrameAnimeMoveChar_(gAttack, "move_AllyAttack0202_MtoM",StartFrame);
		gTargetTask = Task_SetFrameAnimeMoveCharNoDir_(gTarget, "move_EnemyTarget02_M",StartFrame);
		SetSceneOffsetFromMove_(gTarget, "move_EnemyTarget02_M");
	} else if(cTarget.Size == SIZE_G){
		gAttackTask = Task_SetFrameAnimeMoveChar_(gAttack, "move_AllyAttack0203_MtoG",StartFrame);
		gTargetTask = Task_SetFrameAnimeMoveCharNoDir_(gTarget, "move_EnemyTarget03_G",StartFrame);
		SetSceneOffsetFromMove_(gTarget, "move_EnemyTarget03_G");
	} else if(cTarget.Size == SIZE_T){
		gAttackTask = Task_SetFrameAnimeMoveChar_(gAttack, "move_AllyAttack0204_MtoT",StartFrame);
		gTargetTask = Task_SetFrameAnimeMoveCharNoDir_(gTarget, "move_EnemyTarget04_T",StartFrame);
		SetSceneOffsetFromMove_(gTarget, "move_EnemyTarget04_T");
	}
		
	if(cTarget.Size == SIZE_G){
		Task_AnimeMoveCamera_("camera_AttackMtoTargetG" , "camtgt_AttackMtoTargetG");
		if(gTarget2 != INVALID_CHARACTER){
			SetVisible_(gTarget2, false);
		}
	} else if(cTarget.Size == SIZE_T){
		Task_AnimeMoveCamera_("camera_AttackMtoTargetT" , "camtgt_AttackMtoTargetT");
	}else{
		Task_AnimeMoveCamera_("camera_AttackMtoTargetSNM" , "camtgt_AttackMtoTargetSNM");
	}
	
	SetMotion_(gAttack, MOT_MOVE_LOOP, 0);
	SetMotionFrame_(gAttack, 30 % WaitFrame)
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
