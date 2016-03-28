// 通常攻撃用

// 初期化
function Init()
{
	DebugPrint("BATTLE040_function_Init")
	BattleCommon_Init();
	gAttack <- GetActorIndex_(0);
	gTarget <- GetTargetIndex_(0,0);
	cAction <- cActionInfo(0)
	Debug_cActionPrint(cAction)
	ChangeIndexPointData_(PERSONAL_POINT_DATA);
	ChangeIndexPointData_(PERSONAL_POINT_DATA);
	
	if(IsAlly_(gAttack)){
		gMaster <- GetAllyMaster_();
	} else {
		gMaster <- GetEnemyMaster_();
	}
	gRideFlag <- IsRide_(gAttack)
	
	//SetDamageMotion用引数
	gMultiCount <- 0;
	gPos <- GetFbxPointPos_("pos_000");
	gTargetDir <- 0;
	gDeletegTaskFlag <- false
	gPierceFlag <- true;
	SetMotion_(gAttack, MOT_WAIT, 0);
	SetMotion_(gTarget, MOT_WAIT, 0);
	
	//古い演出判定
	gOldPattern <- false;
	
	//エフェクト
	LoadEffect();
	LoadEffect_("EF000_12_MONSTER_DEATH");
	LoadEffect_("EF010_08_HIT_KILL");
	
	//Script開始時チェック
	ScriptStartCheck()

}

// 更新
function Update()
{
	DebugPrint("BATTLE040_function_Update")
	if(IsAlly_(gAttack)){
		PlaySE_("SE_BTL_001")
	} else {
		PlaySE_("SE_BTL_004")
	}
	
	StandbyCut_Magic(gMultiCount,cAction);
	ChangeIndexPointData_(PERSONAL_POINT_DATA);
	DeleteAllTask_();

	//状況判定分岐
	local AttackSize;
	AttackSize = GetMonsterSize_(gAttack);
	
	SetExtraVisible(gAttack);

	//対戦相手のパーティのExtraがGサイズの場合は非表示にする
	local ExtraChara = GetExtra(gTarget,0);
	//DebugPrint(("ExtraChara	:" + ExtraChara + "\n")
	local ExtraCharaSize = null;
	if(ExtraChara != INVALID_CHARACTER){
		ExtraCharaSize = GetMonsterSize_ (ExtraChara)
		if(ExtraCharaSize == SIZE_G){
			SetVisible_(ExtraChara, false);
		}
	}

	if(AttackSize == SIZE_S || AttackSize == SIZE_N){
		SAction();
	}
	else if(AttackSize == SIZE_M){
		MAction();
	}
	else {
		GAction();
	}
	BatteleScript_End();
}

function SAction()	//行動者がＳサイズの場合
{
	DebugPrint("BATTLE040_function_SAction")
	Task_AnimeMoveCharNoDir_(gAttack, "move_021_S06S3target");
	SetDir_(gAttack, 180);
	
	SetSceneOffsetFromMove_(gTarget, "move_007_S02S3target");
	gTask <- Task_AnimeMoveCharNoDir_(gTarget, "move_007_S02S3target");
	local CameraTask;
	
	if(gOldPattern == true){
		/*CameraTask = Task_AnimeMoveCamera_("camera_001" , "camtgt_001");
		SetMotion_(gAttack, MOT_SWORD_START, 4);
		Wait_(15);
		SetMotion_(gAttack, MOT_SWORD_EXERCISE, 4);
		Task_ChangeMotion_(gAttack , MOT_WAIT , 4);
		SetMotionStepFrame_(gAttack, 0.7);
		SetMonsterPlayMoveSE_(gAttack,false);
		
		
		Wait_(20);
		
		SetDir_(gTarget, gTargetDir);
		
		TargetPierceMotion(gTarget,gAttack,gOldPattern,cAction)
		Wait_(35)
		SetDamageMotion(gTarget,gDeletegTaskFlag,gTask,gMultiCount,gPos,gPierceFlag,cAction);
		ChangeIndexPointData_(PERSONAL_POINT_DATA);
		Wait_(45);*/
	} else {
		CameraTask = Task_AnimeMoveCamera_("camera_001_Enemy02" , "camtgt_001_Enemy02");
		
		PlaySE_("SE_BTL_027")
		SetMonsterPlayMoveSE_(gAttack,false);
		SetMotion_(gAttack, MOT_SWORD_START, 4);
		SetMotionStepFrame_(gAttack, 0.9);
		if(gRideFlag == true){SetMasterRideMotion_(gMaster, RIDE_MOTION_ID.WALK , 4);}
		
		
		Wait_(15);
		SetMotion_(gAttack, MOT_SWORD_EXERCISE, 4);
		Task_ChangeMotion_(gAttack , MOT_WAIT , 4);
		SetMotionStepFrame_(gAttack, 0.7);
		
		Wait_(20);
		
		SetDir_(gTarget, gTargetDir);
		
		TargetPierceMotion(gTarget,gAttack,gOldPattern,cAction)
		MonsterSizeEffect(gTarget,"EF010_08_HIT_KILL")
		Wait_(60)
		SetDamageMotion(gTarget,gDeletegTaskFlag,gTask,gMultiCount,gPos,gPierceFlag,cAction);
		ChangeIndexPointData_(PERSONAL_POINT_DATA);
		
		SetDamageMotion_EndWait(20,null,25)
	}
}

function MAction()	//行動者がＭサイズの場合
{
	DebugPrint("BATTLE040_function_MAction")
	Task_AnimeMoveCharNoDir_(gAttack, "move_024_S07G1target");
	SetDir_(gAttack, 180);
	
	SetSceneOffsetFromMove_(gTarget, "move_010_S03G1target");
	gTask <- Task_AnimeMoveCharNoDir_(gTarget, "move_010_S03G1target");
	local CameraTask;
	if(gOldPattern == true){
		/*Task_AnimeMoveCamera_("camera_000" , "camtgt_000");
		ReplaySE_("SE_BTL_027")
		SetMotion_(gAttack, MOT_SWORD_START, 4);
		SetMotionStepFrame_(gAttack, 0.9);
		SetMonsterPlayMoveSE_(gAttack,false);
		
		Wait_(20);
		SetMotion_(gAttack, MOT_SWORD_EXERCISE, 4);
		Task_ChangeMotion_(gAttack , MOT_WAIT , 4);
		
		Wait_(20);
		
		Wait_(5);
		SetDir_(gTarget, gTargetDir);
		
		TargetPierceMotion(gTarget,gAttack,gOldPattern,cAction)
		
		Wait_(35);
		SetDamageMotion(gTarget,gDeletegTaskFlag,gTask,gMultiCount,gPos,gPierceFlag,cAction);
		ChangeIndexPointData_(PERSONAL_POINT_DATA);
		Wait_(45);*/
	} else {
		Task_AnimeMoveCamera_("camera_000_Enemy" , "camtgt_000_Enemy");
		SetMonsterPlayMoveSE_(gAttack,false);
		SetMotion_(gAttack, MOT_SWORD_START, 4);
		if(gRideFlag == true){SetMasterRideMotion_(gMaster, RIDE_MOTION_ID.WALK , 4);}
		
		Wait_(10)
		ReplaySE_("SE_BTL_027")
		Wait_(10);
		SetMotion_(gAttack, MOT_SWORD_EXERCISE, 4);
		Task_ChangeMotion_(gAttack , MOT_WAIT , 4);
		SetMotionStepFrame_(gAttack, 0.7);
		
		Wait_(25);
		
		SetDir_(gTarget, gTargetDir);
		
		TargetPierceMotion(gTarget,gAttack,gOldPattern,cAction)
		MonsterSizeEffect(gTarget,"EF010_08_HIT_KILL")
		Wait_(45);
		SetDamageMotion(gTarget,gDeletegTaskFlag,gTask,gMultiCount,gPos,gPierceFlag,cAction);
		ChangeIndexPointData_(PERSONAL_POINT_DATA);
		
		SetDamageMotion_EndWait(20,null,25)
	}
}

function GAction()	//行動者がＧサイズの場合
{
	DebugPrint("BATTLE040_function_GAction")
	Task_AnimeMoveCharNoDir_(gAttack, "move_025_S07G1target");
	SetDir_(gAttack, 0);
	
	SetSceneOffsetFromMove_(gTarget, "move_010_S03G1target");
	gTask <- Task_AnimeMoveCharNoDir_(gTarget, "move_010_S03G1target");
	Task_AnimeMoveCamera_("camera_002" , "camtgt_002");
	
	SetMotion_(gAttack, MOT_SWORD_START, 4);
	
	Wait_(20);
	SetMotion_(gAttack, MOT_SWORD_EXERCISE, 4);
	Task_ChangeMotion_(gAttack , MOT_WAIT , 4);
	
	Wait_(10);
	SetMotion_(gAttack, MOT_ATTACK, 10);
	
	Wait_(20);
	
	Wait_(5);
	SetDir_(gTarget, gTargetDir);
	
	SetDamageMotion(gTarget,gDeletegTaskFlag,gTask,gMultiCount,gPos,gPierceFlag,cAction);
	Wait_(35);
	
	ChangeIndexPointData_(PERSONAL_POINT_DATA);
	/*if(IsDead_(0,0)){
		gTargetDead();
	} else {
		Wait_(6);
		SetMotionStepFrame_(gAttack, 0.2);
		SetMotionStepFrame_(gTarget, 0.2);
		SetMonsterPlayMoveSE_(gAttack,false);
		SetMonsterPlayMoveSE_(gTarget,false);
		
		
		Wait_(14);
		SetMotionStepFrame_(gAttack, 0.4);
		SetMotionStepFrame_(gTarget, 0.4);
		SetMonsterPlayMoveSE_(gAttack,false);
		SetMonsterPlayMoveSE_(gTarget,false);
		
		
		Wait_(10);
		SetMotionStepFrame_(gAttack, 0.6);
		SetMotionStepFrame_(gTarget, 0.6);
		SetMonsterPlayMoveSE_(gAttack,false);
		SetMonsterPlayMoveSE_(gTarget,false);
		
		
		Wait_(5);
		SetMotionStepFrame_(gAttack, 0.8);
		SetMotionStepFrame_(gTarget, 0.8);
		SetMonsterPlayMoveSE_(gAttack,false);
		SetMonsterPlayMoveSE_(gTarget,false);
		
		Wait_(5);
		SetMotionStepFrame_(gAttack, 1.0);
		SetMotionStepFrame_(gTarget, 1.0);
		SetMonsterPlayMoveSE_(gAttack,false);
		SetMonsterPlayMoveSE_(gTarget,false);
		
		
		Wait_(20);
	}*/
	Wait_(45);
}


// 死亡時
function gTargetDead()
{
	DebugPrint("BATTLE040_function_gTargetDead")
	local gTarget = GetTargetIndex_(0,0);
	
	local deadCnt = 0;
	local cntMax = 60;
	
	local effect= SetBoneEffect_("EF000_12_MONSTER_DEATH", gTarget);
	
	while(deadCnt < cntMax){
//		local alpha = 1.0 - (0.05 * deadCnt);
		local alpha = 1.0 - (0.025 * deadCnt);
		if(alpha < 0){
			alpha = 0;
		}
		if(alpha == 0){
			SetVisible_(gTarget, false);
		} else {
			SetAlpha_(gTarget, alpha);
		}
		if(deadCnt == 6){
			SetMotionStepFrame_(gAttack, 0.2);
			SetMotionStepFrame_(gTarget, 0.2);
			SetMonsterPlayMoveSE_(gAttack,false);
			SetMonsterPlayMoveSE_(gTarget,false);
			
		}
		if(deadCnt == 20){
			SetMotionStepFrame_(gAttack, 0.4);
			SetMotionStepFrame_(gTarget, 0.4);
			SetMonsterPlayMoveSE_(gAttack,false);
			SetMonsterPlayMoveSE_(gTarget,false);
			
		}
		if(deadCnt == 25){
			SetMotionStepFrame_(gAttack, 0.6);
			SetMotionStepFrame_(gTarget, 0.6);
			SetMonsterPlayMoveSE_(gAttack,false);
			SetMonsterPlayMoveSE_(gTarget,false);
			
		}
		if(deadCnt == 30){
			SetMotionStepFrame_(gAttack, 0.8);
			SetMotionStepFrame_(gTarget, 0.8);
			SetMonsterPlayMoveSE_(gAttack,false);
			SetMonsterPlayMoveSE_(gTarget,false);
			
		}
		if(deadCnt == 35){
			SetMotionStepFrame_(gAttack, 1.0);
			SetMotionStepFrame_(gTarget, 1.0);
			SetMonsterPlayMoveSE_(gAttack,false);
			SetMonsterPlayMoveSE_(gTarget,false);
			
		}
		Wait_(1);
		deadCnt++;
	}
}
