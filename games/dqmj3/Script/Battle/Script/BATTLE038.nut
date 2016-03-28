// 通常攻撃用

// 初期化
function Init()
{
	DebugPrint("BATTLE038_function_Init")
	BattleCommon_Init();
	local attack = GetActorIndex_(0);
	local target = GetTargetIndex_(0,0);
	gMultiCount <- 0;
	cAction <- cActionInfo(0)
	Debug_cActionPrint(cAction)
	ChangeIndexPointData_(PERSONAL_POINT_DATA);
	
	SetMotion_(attack, MOT_WAIT, 0);
	SetMotion_(target, MOT_WAIT, 0);
	
	//エフェクト
	LoadEffect();
	
}

// 更新
function Update()
{
	DebugPrint("BATTLE038_function_Update")
	local attack = GetActorIndex_(0);			// 攻撃する側
	local target = GetTargetIndex_(0,0);			// 攻撃される側
	local random = GetRandom_(7);
	
	if(random == 0){
		SetDir_(target, 0);
	}
	else if(random == 1){
		SetDir_(target, 45);
	}
	else if(random == 2){
		SetDir_(target, 90);
	}
	else if(random == 3){
		SetDir_(target, 135);
	}
	else if(random == 4){
		SetDir_(target, 180);
	}
	else if(random == 5){
		SetDir_(target, -45);
	}
	else if(random == 6){
		SetDir_(target, -90);
	}
	else if(random == 7){
		SetDir_(target, -135);
	}

	//状況判定分岐
	local AttackSize;
	AttackSize = GetMonsterSize_(attack);

	if(AttackSize == SIZE_S){
		SAction(attack,target);
	}
	else{
		MAction(attack,target);
	}
	BatteleScript_End();
}

function SAction(attack,target)	//行動者がＳサイズの場合
{
	DebugPrint("BATTLE038_function_SAction")
	Task_AnimeMoveChar_(attack, 15);
	local task = Task_AnimeMoveCharNoDir_(target, 7);
	Task_AnimeMoveCamera_(0);
	local angle;
	
	ShowActionName_(gMultiCount);
	
	SetMotion_(attack, MOT_MOVE_LOOP, 0);
	
	Wait_(15);
	SetMotion_(attack, MOT_ATTACK, 4);
	
	Wait_(10);
	
	angle = -90
	SetDamageMotion(task, target, angle,cAction);
	
	if(IsDead_(0,0)){
		targetDead();
	} else {
		gMultiCount += 1;
		ShowActionName_(gMultiCount);
		
		Wait_(15);
		SetMotion_(attack, MOT_SWORD_EXERCISE, 0);
		
		Wait_(10);
		
		angle = -90
		SetDamageMotion(task, target, angle,cAction);
		
		if(IsDead_(0,0)){
			targetDead();
		} else {
			gMultiCount += 1;
			ShowActionName_(gMultiCount);
			
			Wait_(15);
			SetMotion_(attack, MOT_ATTACK, 4);
			
			Wait_(10);
			
			angle = -90
			SetDamageMotion(task, target, angle,cAction);
			
			if(IsDead_(0,0)){
				targetDead();
			} else {
				gMultiCount += 1;
				ShowActionName_(gMultiCount);
				
				Wait_(15);
				SetMotion_(attack, MOT_SWORD_EXERCISE, 0,cAction);
				
				Wait_(10);
				
				angle = -90
				SetDamageMotion(task, target, angle,cAction);
				
				if(IsDead_(0,0)){
					targetDead();
				} else {
					Wait_(45);
				}
			}
		}
	}
}

function MAction(attack,target)	//行動者がＭサイズの場合
{
	DebugPrint("BATTLE038_function_MAction")
	Task_AnimeMoveChar_(attack, 16);
	local task = Task_AnimeMoveCharNoDir_(target, 8);
	Task_AnimeMoveCamera_(1);
	local angle;
	
	ShowActionName_(gMultiCount);

	
	SetMotion_(attack, MOT_MOVE_LOOP, 0);
	
	Wait_(15);
	SetMotion_(attack, MOT_ATTACK, 10);
	
	Wait_(10);
	
	angle = -90
	SetDamageMotion(task, target, angle);
	
	if(IsDead_(0,0)){
		targetDead();
	} else {
		gMultiCount += 1;
		ShowActionName_(gMultiCount);

		
		Wait_(15);
		SetMotion_(attack, MOT_SWORD_EXERCISE, 0);
		
		Wait_(10);
		
		angle = -90
		SetDamageMotion(task, target, angle);
		
		if(IsDead_(0,0)){
			targetDead();
		} else {
			gMultiCount += 1;
			ShowActionName_(gMultiCount);
			
			Wait_(15);
			SetMotion_(attack, MOT_ATTACK, 4);
			
			Wait_(10);
			
			angle = -90
			SetDamageMotion(task, target, angle);
			
			if(IsDead_(0,0)){
				targetDead();
			} else {
				gMultiCount += 1;
				ShowActionName_(gMultiCount);

				
				Wait_(15);
				SetMotion_(attack, MOT_SWORD_EXERCISE, 0);
				
				Wait_(10);
				
				angle = -90
				SetDamageMotion(task, target, angle);
				
				if(IsDead_(0,0)){
					targetDead();
				} else {
					Wait_(45);
				}
			}
		}
	}
}

// 被弾時
function SetDamageMotion(task, target,angle)
{
	DebugPrint("BATTLE038_function_SetDamageMotion");

	if(IsMiss_(0,0,0))
	{
//		DeleteTask_(task);
		
		Wait_(5);
//		SetMissPop_(target, ATTACH_EFFECT2);
		SetDir_(target, angle);
	}
	else if(IsDead_(0,0))
	{
		SetMotion_(target, MOT_DAMAGE, 4);
		SetMotionStepFrame_(target, 0.8);
		SetMonsterPlayMoveSE_(target,false);
		
		
		Wait_(5);
		SetDamageEffectSE(target,true);
		SetDir_(target, angle);
	}
	else
	{
		SetMotion_(target, MOT_DAMAGE, 4);
		
		Wait_(5);
		SetDamageEffectSE(target,true);
		SetDir_(target, angle);
	}
}

// 死亡時
function targetDead()
{
	DebugPrint("BATTLE038_function_targetDead")
	local target = GetTargetIndex_(0,0);
	
	local deadCnt = 0;
	local cntMax = 30;
	
	while(deadCnt < cntMax){
		local alpha = 1.0 - (0.05 * deadCnt);
		if(alpha < 0){
			alpha = 0;
		}
		if(alpha == 0){
			SetVisible_(target, false);
		} else {
			SetAlpha_(target, alpha);
		}
		Wait_(1);
		deadCnt++;
	}
}

