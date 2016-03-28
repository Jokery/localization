// 連続攻撃（物理）

// 初期化
function Init()
{
	DebugPrint("BATTLE028_IN_function_Init")
	BattleCommon_Init();
	gAttack1 <- GetActorIndex_(0);
	gAttack2 <- GetActorIndex_(1);
	gAttack3 <- GetActorIndex_(2);
	gAttack4 <- GetActorIndex_(3);
	gAttack1Size <- SIZE_S;
	gAttack2Size <- SIZE_S;
	gAttack3Size <- SIZE_S;
	gAttack4Size <- SIZE_S;
	gSFlag <- false;
	gNFlag <- false;
	gMFlag <- false;
	gGFlag <- false;
	gTFlag <- false;
	gTarget <- GetTargetIndex_(0,0);
	gTarget2 <- GetExtra(gTarget,0);
	gTarget3 <- GetExtra(gTarget,1);
	gTarget4 <- GetExtra(gTarget,2);
	ChangeIndexPointData_(PERSONAL_POINT_DATA);
	gMultiCount <- 0;
	gMultistagecount <- 0;
	gAngle <- 0;
	gAttackNum <- GetActionNum_();
	gNameVisibleFlag <- false;
	gEffect <- 0;
	cAction <- cActionInfo(gMultiCount)
	
	if(gAttack1 != INVALID_CHARACTER){
		SetVisible_(gAttack1, true);
		gAttack1Size = GetMonsterSize_(gAttack1);
		if(gAttack1Size == SIZE_S){gSFlag = true;}
		if(gAttack1Size == SIZE_N){gNFlag = true;}
		if(gAttack1Size == SIZE_M){gMFlag = true;}
		if(gAttack1Size == SIZE_G){gGFlag = true;}
		if(gAttack1Size == SIZE_T){gTFlag = true;}
	}
	if(gAttack2 != INVALID_CHARACTER){
		SetVisible_(gAttack2, true);
		gAttack2Size = GetMonsterSize_(gAttack2);
		if(gAttack2Size == SIZE_S){gSFlag = true;}
		if(gAttack2Size == SIZE_N){gNFlag = true;}
		if(gAttack2Size == SIZE_M){gMFlag = true;}
		if(gAttack2Size == SIZE_G){gGFlag = true;}
		if(gAttack2Size == SIZE_T){gTFlag = true;}
	}
	if(gAttack3 != INVALID_CHARACTER){
		SetVisible_(gAttack3, true);
		gAttack3Size = GetMonsterSize_(gAttack3);
		if(gAttack3Size == SIZE_S){gSFlag = true;}
		if(gAttack3Size == SIZE_N){gNFlag = true;}
		if(gAttack3Size == SIZE_M){gMFlag = true;}
		if(gAttack3Size == SIZE_G){gGFlag = true;}
		if(gAttack3Size == SIZE_T){gTFlag = true;}
	}
	if(gAttack4 != INVALID_CHARACTER){
		SetVisible_(gAttack4, true);
		gAttack4Size = GetMonsterSize_(gAttack4);
		if(gAttack4Size == SIZE_S){gSFlag = true;}
		if(gAttack4Size == SIZE_N){gNFlag = true;}
		if(gAttack4Size == SIZE_M){gMFlag = true;}
		if(gAttack4Size == SIZE_G){gGFlag = true;}
		if(gAttack4Size == SIZE_T){gTFlag = true;}
	}
		
	SetMotion_(gTarget, MOT_WAIT, 0);
	
	LoadEffect();
	DebugPrint("BATTLE028_OUT_function_Init")
}

// 更新
function Update()
{
	DebugPrint("BATTLE028__IN_function_Update");
	
	StandbyCut_Assault(gMultiCount,cAction);
	ChangeIndexPointData_(PERSONAL_POINT_DATA);
	DeleteAllTask_();

	//エキストラキャラの撤去
	if(gTarget2 != INVALID_CHARACTER){SetVisible_(gTarget2, false);}
	if(gTarget3 != INVALID_CHARACTER){SetVisible_(gTarget3, false);}
	if(gTarget4 != INVALID_CHARACTER){SetVisible_(gTarget4, false);}
	
	DebugPrint("gAttack1 : " + gAttack1);
	DebugPrint("gAttack2 : " + gAttack2);
	DebugPrint("gAttack3 : " + gAttack3);
	DebugPrint("gAttack4 : " + gAttack4);
	DebugPrint("gTarget : " + gTarget);
	DebugPrint("gTarget2 : " + gTarget2);
	DebugPrint("gTarget3 : " + gTarget3);
	DebugPrint("gTarget4 : " + gTarget4);
	DebugPrint("gAttackNum : " + gAttackNum);
	DebugPrint("gAttack1Size : " + gAttack1Size);
	DebugPrint("gAttack2Size : " + gAttack2Size);
	DebugPrint("gAttack3Size : " + gAttack3Size);
	DebugPrint("gAttack4Size : " + gAttack4Size);
	DebugPrint("gSFlag : " + gSFlag);
	DebugPrint("gMFlag : " + gMFlag);
	DebugPrint("gGFlag : " + gGFlag);
	DebugPrint("gTFlag : " + gTFlag);
	
	if(gAttackNum == 4){
		S4Action();					//Ｓ４体構成
	} else if(gAttackNum == 3 && gMFlag == false ){
		S3Action();					//Ｓ３体構成
	} else if(gAttackNum == 3 && gMFlag == true ){
		S2M1Action();				//Ｓ２体＋Ｍ１体構成
	} else if(gAttackNum == 2 && gMFlag == false ){
		S2Action();					//Ｓ２体構成
	} else if(gAttackNum == 2 && gMFlag == true ){
		if(gSFlag == true || gNFlag == true){
			S1M1Action();				//Ｓ１体＋Ｍ１体構成
		} else {
			M2Action();					//Ｍ２体構成
		}
	} else{
		//ＧorＴ１体構成
	}
	DebugPrint("BATTLE028__OUT_function_Update");
	BatteleScript_End();
}

function S4Action()					//Ｓ４体構成
{
	DebugPrint("BATTLE028_IN_function_S4Action")
	// アニメーション動作セット
	Task_AnimeMoveCamera_("camera_000" , "camtgt_000");
	
	Task_AnimeMoveChar_(gAttack1, "move_015");
	Task_AnimeMoveChar_(gAttack2, "move_016");
	Task_AnimeMoveChar_(gAttack3, "move_017");
	Task_AnimeMoveChar_(gAttack4, "move_018");
	SetVisible_(gAttack2, true);
	SetVisible_(gAttack3, true);
	SetVisible_(gAttack4, true);
	SetSceneOffsetFromMove_(gTarget, "move_007");

	gTask <- Task_AnimeMoveCharNoDir_(gTarget, "move_007");
	
	// モーションセット
	SetMotion_(gAttack1, MOT_MOVE_LOOP, 0);
	SetMotion_(gAttack2, MOT_MOVE_LOOP, 0);
	SetMotion_(gAttack3, MOT_MOVE_LOOP, 0);
	SetMotion_(gAttack4, MOT_MOVE_LOOP, 0);
	
	//ShowActionMessage(gMultiCount,gNameVisibleFlag);
	
	Wait_(2);
	SetMotion_(gAttack1, MOT_ATTACK, 4);
	
	Wait_(23);
	gAngle = -45;
	SetDamageMotion_Rush(gAttack1,gTarget,gAngle,gMultiCount,gMultistagecount,gEffect)
	gEffect = SetBoneEffect_("EF000_14_SMOKE_FOOT", gTarget);
	
	local DeadCheck = IsDead_(gMultiCount,0);
	
	if(DeadCheck == true){
		SetVisible_(gAttack2, false);
		SetVisible_(gAttack3, false);
		SetVisible_(gAttack4, false);
		//gTargetDead(gAttack1, gMultiCount);
		DeleteEffectEmitter_(gEffect);
		Wait_(30);
	} else {
		gMultiCount++;
		ShowActionMessage(gMultiCount,gNameVisibleFlag);
		
		SetMotion_(gAttack2, MOT_ATTACK, 4);
		SetMotionFrame_(gAttack2, 3);
		Wait_(20 - GetActHitNum_(gMultiCount - 1,0));
		gAngle = 45;
		SetDamageMotion_Rush(gAttack2,gTarget,gAngle,gMultiCount,gMultistagecount,gEffect)
		
		
		if(IsDead_(gMultiCount,0)){
			SetVisible_(gAttack3, false);
			SetVisible_(gAttack4, false);
			//gTargetDead(gAttack2, gMultiCount);
			DeleteEffectEmitter_(gEffect);
			Wait_(30);
		} else {
			gMultiCount++;
			ShowActionMessage(gMultiCount,gNameVisibleFlag);
			
			SetMotion_(gAttack3, MOT_ATTACK, 4);
			SetMotionFrame_(gAttack3, 13);
			Wait_(10 - GetActHitNum_(gMultiCount - 1,0));
			gAngle = -45;
			SetDamageMotion_Rush(gAttack3,gTarget,gAngle,gMultiCount,gMultistagecount,gEffect)
			
			if(IsDead_(gMultiCount,0)){
				SetVisible_(gAttack4, false);
				//gTargetDead(gAttack3, gMultiCount);
				DeleteEffectEmitter_(gEffect);
				Wait_(30);
			} else {
				gMultiCount++;
				ShowActionMessage(gMultiCount,gNameVisibleFlag);
				
				SetMotion_(gAttack4, MOT_ATTACK, 4);
				SetMotionFrame_(gAttack4, 13);
				Wait_(10 - GetActHitNum_(gMultiCount - 1,0));
				gAngle = 45;
				SetDamageMotion_Rush(gAttack4,gTarget,gAngle,gMultiCount,gMultistagecount,gEffect)
				/*if(IsDead_(gMultiCount,0)){
					gTargetDead(gAttack4, gMultiCount);
					DeleteEffectEmitter_(gEffect);
				} else {
					DeleteEffectEmitter_(gEffect);
					//Wait_(35);
				}*/
				//Wait_(30);
			}
		}
	}
	DeleteAllActionName_();
	DebugPrint("BATTLE028_OUT_function_S4Action")
}
function S3Action()					//Ｓ３体構成
{
	DebugPrint("BATTLE028_IN_function_S3Action");
	// アニメーション動作セット
	Task_AnimeMoveCamera_("camera_001" , "camtgt_001");
	
	Task_AnimeMoveChar_(gAttack1, "move_015");
	Task_AnimeMoveChar_(gAttack2, "move_016");
	Task_AnimeMoveChar_(gAttack3, "move_017");
	SetVisible_(gAttack2, true);
	SetVisible_(gAttack3, true);
	SetSceneOffsetFromMove_(gTarget, "move_008");
	gTask <- Task_AnimeMoveCharNoDir_(gTarget, "move_008");
	
	// モーションセット
	SetMotion_(gAttack1, MOT_MOVE_LOOP, 0);
	SetMotion_(gAttack2, MOT_MOVE_LOOP, 0);
	SetMotion_(gAttack3, MOT_MOVE_LOOP, 0);
	
	//ShowActionMessage(gMultiCount,gNameVisibleFlag);
	
	Wait_(2);
	SetMotion_(gAttack1, MOT_ATTACK, 4);
	
	Wait_(23);
	gAngle = -45;
	SetDamageMotion_Rush(gAttack1,gTarget,gAngle,gMultiCount,gMultistagecount,gEffect)
	gEffect= SetBoneEffect_("EF000_14_SMOKE_FOOT", gTarget);
	
	if(IsDead_(gMultiCount,0)){
		SetVisible_(gAttack2, false);
		SetVisible_(gAttack3, false);
		//gTargetDead(gAttack1,gMultiCount);
		DeleteEffectEmitter_(gEffect);
		Wait_(30);
	} else {
		gMultiCount++;
		ShowActionMessage(gMultiCount,gNameVisibleFlag);
		
		SetMotion_(gAttack2, MOT_ATTACK, 4);
		SetMotionFrame_(gAttack2,3)
		Wait_(20 - GetActHitNum_(gMultiCount - 1,0));
		gAngle = 45;
		SetDamageMotion_Rush(gAttack2,gTarget,gAngle,gMultiCount,gMultistagecount,gEffect)
		
		if(IsDead_(gMultiCount,0)){
			SetVisible_(gAttack3, false);
			//gTargetDead(gAttack2,gMultiCount);
			DeleteEffectEmitter_(gEffect);
			Wait_(30);
		} else {
			gMultiCount++;
			ShowActionMessage(gMultiCount,gNameVisibleFlag);
			
			SetMotion_(gAttack3, MOT_ATTACK, 4);
			SetMotionFrame_(gAttack3,13)
			Wait_(10 - GetActHitNum_(gMultiCount - 1,0));
			gAngle = -45;
			SetDamageMotion_Rush(gAttack3,gTarget,gAngle,gMultiCount,gMultistagecount,gEffect)
			/*if(IsDead_(gMultiCount,0)){
				gTargetDead(gAttack3,gMultiCount);
				DeleteEffectEmitter_(gEffect);
			} else {
				DeleteEffectEmitter_(gEffect);
				Wait_(35);
			}*/
			//Wait_(30);
		}
	}
	DeleteAllActionName_();
	DebugPrint("BATTLE028_OUT_function_S3Action");
}
function S2M1Action()				//Ｓ２体＋Ｍ１体構成
{
	DebugPrint("BATTLE028_IN_function_S2M1Action");
	// アニメーション動作セット
	Task_AnimeMoveCamera_("camera_004" , "camtgt_004");
	
	if(gAttack1Size == SIZE_M ){
	
		Task_AnimeMoveChar_(gAttack1, "move_023");
		Task_AnimeMoveChar_(gAttack2, "move_016");
		Task_AnimeMoveChar_(gAttack3, "move_017");
		SetVisible_(gAttack2, true);
		SetVisible_(gAttack3, true);
		SetSceneOffsetFromMove_(gTarget, "move_008");
		gTask <- Task_AnimeMoveCharNoDir_(gTarget, "move_008");
		
		// モーションセット
		SetMotion_(gAttack1, MOT_MOVE_LOOP, 0);
		SetMotion_(gAttack2, MOT_MOVE_LOOP, 0);
		SetMotion_(gAttack3, MOT_MOVE_LOOP, 0);
		
		//ShowActionMessage(gMultiCount,gNameVisibleFlag);
		
		Wait_(2);
		SetMotion_(gAttack1, MOT_ATTACK, 4);
		
		Wait_(23);
		gAngle = -45;
		SetDamageMotion_Rush(gAttack1,gTarget,gAngle,gMultiCount,gMultistagecount,gEffect)
		gEffect= SetBoneEffect_("EF000_14_SMOKE_FOOT", gTarget);
		
		if(IsDead_(gMultiCount,0)){
			SetVisible_(gAttack2, false);
			SetVisible_(gAttack3, false);
			//gTargetDead(gAttack1,gMultiCount);
			DeleteEffectEmitter_(gEffect);
			Wait_(30);
		} else {
			gMultiCount++;
			ShowActionMessage(gMultiCount,gNameVisibleFlag);
			
			SetMotion_(gAttack2, MOT_ATTACK, 4);
			SetMotionFrame_(gAttack2,3)
			Wait_(20 - GetActHitNum_(gMultiCount - 1,0));
			gAngle = 45;
			SetDamageMotion_Rush(gAttack1,gTarget,gAngle,gMultiCount,gMultistagecount,gEffect)
			
			if(IsDead_(gMultiCount,0)){
				SetVisible_(gAttack3, false);
				//gTargetDead(gAttack2,gMultiCount);
				DeleteEffectEmitter_(gEffect);
				Wait_(30);
			} else {
				gMultiCount++;
				ShowActionMessage(gMultiCount,gNameVisibleFlag);
				
				SetMotion_(gAttack3, MOT_ATTACK, 4);
				SetMotionFrame_(gAttack3,13)
				Wait_(10 - GetActHitNum_(gMultiCount - 1,0));
				gAngle = -45;
				SetDamageMotion_Rush(gAttack1,gTarget,gAngle,gMultiCount,gMultistagecount,gEffect)
				/*if(IsDead_(gMultiCount,0)){
					gTargetDead(gAttack3,gMultiCount);
					DeleteEffectEmitter_(gEffect);
				} else {
					DeleteEffectEmitter_(gEffect);
					Wait_(35);
				}*/
				//Wait_(30);
			}
		}
	DeleteAllActionName_();
	}
	else if(gAttack2Size == SIZE_M ){
	
		Task_AnimeMoveChar_(gAttack1, "move_015");
		Task_AnimeMoveChar_(gAttack2, "move_024");
		Task_AnimeMoveChar_(gAttack3, "move_017");
		SetVisible_(gAttack2, true);
		SetVisible_(gAttack3, true);
		SetSceneOffsetFromMove_(gTarget, "move_011");
		gTask <- Task_AnimeMoveCharNoDir_(gTarget, "move_011");
		
		// モーションセット
		SetMotion_(gAttack1, MOT_MOVE_LOOP, 0);
		SetMotion_(gAttack2, MOT_MOVE_LOOP, 0);
		SetMotion_(gAttack3, MOT_MOVE_LOOP, 0);
		
		//ShowActionMessage(gMultiCount,gNameVisibleFlag);
		
		Wait_(2);
		SetMotion_(gAttack1, MOT_ATTACK, 4);
		
		Wait_(23);
		gAngle = -45;
		SetDamageMotion_Rush(gAttack1,gTarget,gAngle,gMultiCount,gMultistagecount,gEffect)
		gEffect= SetBoneEffect_("EF000_14_SMOKE_FOOT", gTarget);
		
		if(IsDead_(gMultiCount,0)){
			SetVisible_(gAttack2, false);
			SetVisible_(gAttack3, false);
			//gTargetDead(gAttack1,gMultiCount);
			DeleteEffectEmitter_(gEffect);
			Wait_(30);
		} else {
			gMultiCount++;
			ShowActionMessage(gMultiCount,gNameVisibleFlag);
			
			SetMotion_(gAttack2, MOT_ATTACK, 4);
			SetMotionFrame_(gAttack2,13)
			Wait_(20 - GetActHitNum_(gMultiCount - 1,0));
			gAngle = 45;
			SetDamageMotion_Rush(gAttack2,gTarget,gAngle,gMultiCount,gMultistagecount,gEffect)
			
			if(IsDead_(gMultiCount,0)){
				SetVisible_(gAttack3, false);
				//gTargetDead(gAttack2,gMultiCount);
				DeleteEffectEmitter_(gEffect);
				Wait_(30);
			} else {
				gMultiCount++;
				ShowActionMessage(gMultiCount,gNameVisibleFlag);
				
				SetMotion_(gAttack3, MOT_ATTACK, 4);
				SetMotionFrame_(gAttack3,13)
				Wait_(10 - GetActHitNum_(gMultiCount - 1,0));
				gAngle = -45;
				SetDamageMotion_Rush(gAttack3,gTarget,gAngle,gMultiCount,gMultistagecount,gEffect)
				/*if(IsDead_(gMultiCount,0)){
					gTargetDead(gAttack3);
					DeleteEffectEmitter_(gEffect);
				} else {
					DeleteEffectEmitter_(gEffect);
					Wait_(35);
				}*/
				//Wait_(30);
			}
		}
	DeleteAllActionName_();
	}
	else{
	
		Task_AnimeMoveChar_(gAttack1, "move_015");
		Task_AnimeMoveChar_(gAttack2, "move_016");
		Task_AnimeMoveChar_(gAttack3, "move_025");
		SetVisible_(gAttack2, true);
		SetVisible_(gAttack3, true);
		SetSceneOffsetFromMove_(gTarget, "move_011");
		gTask <- Task_AnimeMoveCharNoDir_(gTarget, "move_011");
		
		// モーションセット
		SetMotion_(gAttack1, MOT_MOVE_LOOP, 0);
		SetMotion_(gAttack2, MOT_MOVE_LOOP, 0);
		SetMotion_(gAttack3, MOT_MOVE_LOOP, 0);
		
		//ShowActionMessage(gMultiCount,gNameVisibleFlag);
		
		Wait_(2);
		SetMotion_(gAttack1, MOT_ATTACK, 4);
		
		Wait_(23);
		gAngle = -45;
		SetDamageMotion_Rush(gAttack1,gTarget,gAngle,gMultiCount,gMultistagecount,gEffect)
		gEffect= SetBoneEffect_("EF000_14_SMOKE_FOOT", gTarget);
		
		if(IsDead_(gMultiCount,0)){
			SetVisible_(gAttack2, false);
			SetVisible_(gAttack3, false);
			//gTargetDead(gAttack1,gMultiCount);
			DeleteEffectEmitter_(gEffect);
			Wait_(30);
		} else {
			gMultiCount++;
			ShowActionMessage(gMultiCount,gNameVisibleFlag);
			
			SetMotion_(gAttack2, MOT_ATTACK, 4);
			SetMotionFrame_(gAttack2,13)
			Wait_(20 - GetActHitNum_(gMultiCount - 1,0));
			gAngle = 45;
			SetDamageMotion_Rush(gAttack2,gTarget,gAngle,gMultiCount,gMultistagecount,gEffect)
			
			if(IsDead_(gMultiCount,0)){
				SetVisible_(gAttack3, false);
				//gTargetDead(gAttack2,gMultiCount);
				DeleteEffectEmitter_(gEffect);
				Wait_(30);
			} else {
				gMultiCount++;
				ShowActionMessage(gMultiCount,gNameVisibleFlag);
				
				SetMotion_(gAttack3, MOT_ATTACK, 4);
				SetMotionFrame_(gAttack3,3)
				Wait_(20 - GetActHitNum_(gMultiCount - 1,0));
				gAngle = -45;
				SetDamageMotion_Rush(gAttack3,gTarget,gAngle,gMultiCount,gMultistagecount,gEffect)
				/*if(IsDead_(gMultiCount,0)){
					//gTargetDead(gAttack3,gMultiCount);
					DeleteEffectEmitter_(gEffect);
					Wait_(30);
				} else {
					DeleteEffectEmitter_(gEffect);
					Wait_(35);
				}*/
				//Wait_(30);
			}
		}
	DeleteAllActionName_();
	}
	DebugPrint("BATTLE028_OUT_function_S2M1Action");
}
function S2Action()					//Ｓ２体構成
{
	DebugPrint("BATTLE028_IN_function_S2Action")
	// アニメーション動作セット
	Task_AnimeMoveCamera_("camera_002" , "camtgt_002");
	
	Task_AnimeMoveChar_(gAttack1, "move_015");
	Task_AnimeMoveChar_(gAttack2, "move_016");
	SetVisible_(gAttack2, true);
	SetSceneOffsetFromMove_(gTarget, "move_009");
	gTask <- Task_AnimeMoveCharNoDir_(gTarget, "move_009");
	
	// モーションセット
	SetMotion_(gAttack1, MOT_MOVE_LOOP, 0);
	SetMotion_(gAttack2, MOT_MOVE_LOOP, 0);
	
	//ShowActionMessage(gMultiCount,gNameVisibleFlag);
	
	Wait_(2);
	SetMotion_(gAttack1, MOT_ATTACK, 4);
	
	Wait_(23);
	gAngle = -45;
	SetDamageMotion_Rush(gAttack1,gTarget,gAngle,gMultiCount,gMultistagecount,gEffect)
	gEffect= SetBoneEffect_("EF000_14_SMOKE_FOOT", gTarget);
	
	if(IsDead_(gMultiCount,0)){
		SetVisible_(gAttack2, false);
		//gTargetDead(gAttack1,gMultiCount);
		DeleteEffectEmitter_(gEffect);
		Wait_(30);
	} else {
		gMultiCount++;
		ShowActionMessage(gMultiCount,gNameVisibleFlag);
		
		SetMotion_(gAttack2, MOT_ATTACK, 4);
		SetMotionFrame_(gAttack2,13)
		Wait_(10 - GetActHitNum_(gMultiCount - 1 ,0));
		gAngle = 45;
		SetDamageMotion_Rush(gAttack2,gTarget,gAngle,gMultiCount,gMultistagecount,gEffect)
		/*
		if(IsDead_(gMultiCount,0)){
			//gTargetDead(gAttack2,gMultiCount);
			DeleteEffectEmitter_(gEffect);
			Wait_(30);
		} else {
			DeleteEffectEmitter_(gEffect);
			Wait_(35);
		}*/
		//Wait_(30);
	}
	DeleteAllActionName_();
	DebugPrint("BATTLE028_OUT_function_S2Action");
}
function S1M1Action()				//Ｓ１体＋Ｍ１体構成
{
	DebugPrint("BATTLE028_IN_function_S1M1Action");
	// アニメーション動作セット
	Task_AnimeMoveCamera_("camera_005" , "camtgt_005");
	
	if(gAttack1Size == SIZE_M ){
	
		Task_AnimeMoveChar_(gAttack1, "move_023");
		Task_AnimeMoveChar_(gAttack2, "move_016");
		SetVisible_(gAttack2, true);
		SetSceneOffsetFromMove_(gTarget, "move_012");
		gTask <- Task_AnimeMoveCharNoDir_(gTarget, "move_012");
		
		// モーションセット
		SetMotion_(gAttack1, MOT_MOVE_LOOP, 0);
		SetMotion_(gAttack2, MOT_MOVE_LOOP, 0);
		
		//ShowActionMessage(gMultiCount,gNameVisibleFlag);
		
		Wait_(2);
		SetMotion_(gAttack1, MOT_ATTACK, 4);
		
		Wait_(23);
		gAngle = -45;
		SetDamageMotion_Rush(gAttack1,gTarget,gAngle,gMultiCount,gMultistagecount,gEffect)
		gEffect= SetBoneEffect_("EF000_14_SMOKE_FOOT", gTarget);
		
		if(IsDead_(gMultiCount,0)){
			SetVisible_(gAttack2, false);
			//gTargetDead(gAttack1,gMultiCount);
			DeleteEffectEmitter_(gEffect);
			Wait_(30);
		} else {
			gMultiCount++;
			ShowActionMessage(gMultiCount,gNameVisibleFlag);
			
			SetMotion_(gAttack2, MOT_ATTACK, 4);
			SetMotionFrame_(gAttack2,3)
			Wait_(20 - GetActHitNum_(gMultiCount - 1,0));
			gAngle = 45;
			SetDamageMotion_Rush(gAttack2,gTarget,gAngle,gMultiCount,gMultistagecount,gEffect)
			/*if(IsDead_(gMultiCount,0)){
				//gTargetDead(gAttack2,gMultiCount);
				DeleteEffectEmitter_(gEffect);
				Wait_(30);
			} else {
				DeleteEffectEmitter_(gEffect);
				Wait_(35);
			}*/
			//Wait_(30);
		}
	DeleteAllActionName_();
	}
	else{
	
		Task_AnimeMoveChar_(gAttack1, "move_015");
		Task_AnimeMoveChar_(gAttack2, "move_024");
		SetVisible_(gAttack2, true);
		SetSceneOffsetFromMove_(gTarget, "move_012");
		gTask <- Task_AnimeMoveCharNoDir_(gTarget, "move_012");
		
		// モーションセット
		SetMotion_(gAttack1, MOT_MOVE_LOOP, 0);
		SetMotion_(gAttack2, MOT_MOVE_LOOP, 0);
		
		//ShowActionMessage(gMultiCount,gNameVisibleFlag);
		
		Wait_(2);
		SetMotion_(gAttack1, MOT_ATTACK, 4);
		
		Wait_(23);
		gAngle = -45;
		SetDamageMotion_Rush(gAttack1,gTarget,gAngle,gMultiCount,gMultistagecount,gEffect)
		gEffect= SetBoneEffect_("EF000_14_SMOKE_FOOT", gTarget);
		
		if(IsDead_(gMultiCount,0)){
			SetVisible_(gAttack2, false);
			//gTargetDead(gAttack1,gMultiCount);
			DeleteEffectEmitter_(gEffect);
			Wait_(30);
		} else {
			gMultiCount++;
			ShowActionMessage(gMultiCount,gNameVisibleFlag);
			SetMotion_(gAttack2, MOT_ATTACK, 4);
			SetMotionFrame_(gAttack2,3)
			Wait_(20 - GetActHitNum_(gMultiCount - 1 ,0));
			gAngle = 45;
			SetDamageMotion_Rush(gAttack2,gTarget,gAngle,gMultiCount,gMultistagecount,gEffect)
			/*if(IsDead_(gMultiCount,0)){
				//gTargetDead(gAttack2,gMultiCount);
				DeleteEffectEmitter_(gEffect);
				Wait_(30);
			} else {
				DeleteEffectEmitter_(gEffect);
				Wait_(35);
			}*/
			//Wait_(30);
		}
	DeleteAllActionName_();
	}
	DebugPrint("BATTLE028_OUT_function_S1M1Action");
}
function M2Action()					//Ｍ２体構成
{
	DebugPrint("BATTLE028_IN_function_M2Action");
	// アニメーション動作セット
	Task_AnimeMoveCamera_("camera_005" , "camtgt_005");
	
	Task_AnimeMoveChar_(gAttack1, "move_023");
	Task_AnimeMoveChar_(gAttack2, "move_024");
	SetVisible_(gAttack2, true);
	SetSceneOffsetFromMove_(gTarget, "move_012");
	gTask <- Task_AnimeMoveCharNoDir_(gTarget, "move_012");
	
	// モーションセット
	SetMotion_(gAttack1, MOT_MOVE_LOOP, 0);
	SetMotion_(gAttack2, MOT_MOVE_LOOP, 0);
	
	//ShowActionMessage(gMultiCount,gNameVisibleFlag);
	
	Wait_(2);
	SetMotion_(gAttack1, MOT_ATTACK, 4);
	
	Wait_(23);
	gAngle = -45;
	SetDamageMotion_Rush(gAttack1,gTarget,gAngle,gMultiCount,gMultistagecount,gEffect)
	gEffect= SetBoneEffect_("EF000_14_SMOKE_FOOT", gTarget);
	
	if(IsDead_(gMultiCount,0)){
		SetVisible_(gAttack2, false);
		//gTargetDead(gAttack1,gMultiCount);
		DeleteEffectEmitter_(gEffect);
		Wait_(30);
	} else {
		gMultiCount++;
		ShowActionMessage(gMultiCount,gNameVisibleFlag);
		SetMotion_(gAttack2, MOT_ATTACK, 4);
		SetMotionFrame_(gAttack2,3)
		Wait_(20 - GetActHitNum_(gMultiCount - 1,0));
		gAngle = 45;
		SetDamageMotion_Rush(gAttack2,gTarget,gAngle,gMultiCount,gMultistagecount,gEffect)
		/*if(IsDead_(gMultiCount,0)){
			//gTargetDead(gAttack2,gMultiCount);
			DeleteEffectEmitter_(gEffect);
			Wait_(30);
		} else {
			DeleteEffectEmitter_(gEffect);
			Wait_(35);
		}*/
		//Wait_(30);
	}
	DeleteAllActionName_();
	DebugPrint("BATTLE028_OUT_function_M2Action");
}

// 死亡時
function gTargetDead(attack,gMultiCount)
{
	DebugPrint("BATTLE028_IN_function_gTargetDead");
	local gTarget = GetTargetIndex_(gMultiCount,0);
	local deadCnt = 0;
	local cntMax = 30;
	
	gEffect= SetBoneEffect_("EF000_12_MONSTER_DEATH", gTarget);
	
	while(deadCnt < cntMax){
//		local alpha = 1.0 - (0.05 * deadCnt);
//		if(alpha < 0){
//			alpha = 0;
//		}
//		if(alpha == 0){
//			SetVisible_(gTarget, false);
//		} else {
//			SetAlpha_(gTarget, alpha);
//		}
		if(deadCnt == 10){
			SetMotionStepFrame_(attack, 0.2);
			SetMotionStepFrame_(gTarget, 0.2);
			SetMonsterPlayMoveSE_(attack,false);
			SetMonsterPlayMoveSE_(gTarget,false);
		}
		if(deadCnt == 15){
			SetMotionStepFrame_(attack, 0.4);
			SetMotionStepFrame_(gTarget, 0.4);
			SetMonsterPlayMoveSE_(attack,false);
			SetMonsterPlayMoveSE_(gTarget,false);
		}
		if(deadCnt == 20){
			SetMotionStepFrame_(attack, 0.6);
			SetMotionStepFrame_(gTarget, 0.6);
			SetMonsterPlayMoveSE_(attack,false);
			SetMonsterPlayMoveSE_(gTarget,false);
		}
		if(deadCnt == 25){
			SetMotionStepFrame_(attack, 0.8);
			SetMotionStepFrame_(gTarget, 0.8);
			SetMonsterPlayMoveSE_(attack,false);
			SetMonsterPlayMoveSE_(gTarget,false);
		}
		if(deadCnt == 30){
			SetMotionStepFrame_(attack, 1.0);
			SetMotionStepFrame_(gTarget, 1.0);
			SetMonsterPlayMoveSE_(attack,false);
			SetMonsterPlayMoveSE_(gTarget,false);
		}
		Wait_(1);
		deadCnt++;
	}
	DebugPrint("BATTLE028_OUT_function_gTargetDead");
}
