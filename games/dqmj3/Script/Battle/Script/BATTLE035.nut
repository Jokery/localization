// 連続攻撃（物理/全体）

// 初期化
function Init()
{
	DebugPrint("BATTLE035_function_Init")
	BattleCommon_Init();
	local attack1 = GetActorIndex_(0);
	local attack2 = GetActorIndex_(1);
	local attack3 = GetActorIndex_(2);
	local attack4 = GetActorIndex_(3);
	local target1 = GetTargetIndex_(0,0);
	local target2 = GetExtra(target,0);
	local target3 = GetExtra(target,1);
	local target4 = GetExtra(target,2);
	ChangeIndexPointData_(PERSONAL_POINT_DATA);
	
	
	SetMotion_(target1, MOT_WAIT, 0);
	SetMotion_(target2, MOT_WAIT, 0);
	SetMotion_(target3, MOT_WAIT, 0);
	SetMotion_(target4, MOT_WAIT, 0);
	
	LoadEffect();
	
	SetDir_(attack1, 90);
	SetDir_(attack2, 90);
	SetDir_(attack3, 45);
	SetDir_(attack4, 135);
	SetDir_(target1, -90);
	SetDir_(target2, -90);
	SetDir_(target3, -90);
	SetDir_(target4, -90);
	
	gMultiCount <- 0;
	
}

// 更新
function Update()
{
	DebugPrint("BATTLE035_function_Update")
	local attack1 = GetActorIndex_(0);
	local attack2 = GetActorIndex_(1);
	local attack3 = GetActorIndex_(2);
	local attack4 = GetActorIndex_(3);
	local target1 = GetTargetIndex_(0,0);
	local target2 = GetExtra(target,0);
	local target3 = GetExtra(target,1);
	local target4 = GetExtra(target,2);
	ChangeIndexPointData_(PERSONAL_POINT_DATA);
	
	SetVisible_(attack1, true);
	SetVisible_(attack2, true);
	SetVisible_(attack3, true);
	SetVisible_(attack4, true);
	SetVisible_(target1, true);
	SetVisible_(target2, true);
	SetVisible_(target3, true);
	SetVisible_(target4, true);
	
	//状況判定分岐
	local AttackSize;
	AttackSize = GetMonsterSize_(attack1);

	if(AttackSize == SIZE_S){
		SAction(attack1,attack2,attack3,attack4,target1,target2,target3,target4);
	}
	else{
//		MAction(attack,target);
	}
	BatteleScript_End();
}

function SAction(attack1,attack2,attack3,attack4,target1,target2,target3,target4)	//行動者がＳサイズの場合
{
	Task_AnimeMoveCharNoDir_(attack1, 15);
	Task_AnimeMoveCharNoDir_(attack2, 16);
	Task_AnimeMoveCharNoDir_(attack3, 17);
	Task_AnimeMoveCharNoDir_(attack4, 18);
	Task_AnimeMoveCharNoDir_(target1, 1);
	Task_AnimeMoveCharNoDir_(target2, 2);
	Task_AnimeMoveCharNoDir_(target3, 3);
	Task_AnimeMoveCharNoDir_(target4, 4);
	Task_AnimeMoveCamera_(1);
	
	SetMotion_(attack1, MOT_SWORD_START, 4);
	
	Wait_(10);
	SetMotion_(attack2, MOT_SWORD_START, 4);
	
	Wait_(5);
	SetMotion_(attack1, MOT_SWORD_EXERCISE, 4);
	
	Wait_(5);
	SetMotion_(attack3, MOT_SWORD_START, 4);
	
	Wait_(5);
	SetMotion_(attack2, MOT_SWORD_EXERCISE, 4);
	
	
	Wait_(5);
	SetMotion_(attack4, MOT_SWORD_START, 4);
	
	Wait_(5);
	SetMotion_(attack3, MOT_SWORD_EXERCISE, 4);
	
	SetMotion_(target1, MOT_DAMAGE, 4);
	
	Wait_(5);
	local MultiCount = 0;
	local PopCount = 0;
	SetDamageEffectSE(target1,true,MultiCount,PopCount);
	MultiCount += 1;
	SetDamageEffectSE(target2,true,MultiCount,PopCount);
	MultiCount += 1;
	SetDamageEffectSE(target3,true,MultiCount,PopCount);
	MultiCount += 1;
	SetDamageEffectSE(target4,true,MultiCount,PopCount);
	
	Wait_(5);
	SetMotion_(attack4, MOT_SWORD_EXERCISE, 4);
	
	SetMotion_(target3, MOT_DAMAGE, 4);
	
	Wait_(10);
	
	SetMotion_(target2, MOT_DAMAGE, 4);
	
	Wait_(10);
	SetMotion_(target4, MOT_DAMAGE, 4);
	
	
	Wait_(60);
	
}



