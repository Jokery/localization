// 通常攻撃用

// 初期化
function Init()
{
	DebugPrint("BATTLE037_function_Init")
	BattleCommon_Init();
	local attack1 = GetActorIndex_(0);
	local attack2 = GetActorIndex_(1);
	local attack3 = GetActorIndex_(2);
	local target = GetTargetIndex_(0,0);
	
	cAction <- cActionInfo(0)
	Debug_cActionPrint(cAction)
	ChangeIndexPointData_(PERSONAL_POINT_DATA);
	
	SetMotion_(attack1, MOT_WAIT, 0);
	SetMotion_(attack2, MOT_WAIT, 0);
	SetMotion_(attack3, MOT_WAIT, 0);
	SetMotion_(target, MOT_WAIT, 0);
	
	//エフェクト
	LoadEffect();
	
}

// 更新
function Update()
{
	DebugPrint("BATTLE037_function_Update")
	local attack1 = GetActorIndex_(0);
//	local attack2 = GetActorIndex_(1);
//	local attack3 = GetActorIndex_(2);
	local attack2 = GetExtra(Attack,1);
	local attack3 = GetExtra(Attack,2);
	ChangeIndexPointData_(PERSONAL_POINT_DATA);
	local target = GetTargetIndex_(0,0);

	SetDir_(attack1, 90);
	SetDir_(attack2, 90);
	SetDir_(attack3, 90);
	SetDir_(target, -90);

	//状況判定分岐
	local AttackSize;
	AttackSize = GetMonsterSize_(attack1);

	if(AttackSize == SIZE_S){
		SAction(attack1,attack3,attack2,target);
	}
	else{
		MAction(attack,target);
	}
	BatteleScript_End();
}

function SAction(attack1,attack3,attack2,target)	//行動者がＳサイズの場合
{
	DebugPrint("BATTLE037_function_SAction")
	Task_AnimeMoveChar_(attack1, 21);
	Task_AnimeMoveCharNoDir_(attack2, 20);
	Task_AnimeMoveCharNoDir_(attack3, 22);
	Task_AnimeMoveCharNoDir_(target, 7);
	Task_AnimeMoveCamera_(1);
	
	SetVisible_(attack1, true);
	SetVisible_(attack2, true);
	SetVisible_(attack3, true);
	
	SetMotion_(attack1, MOT_MOVE_LOOP, 0);
	
	Wait_(15);
	
	SetMotion_(attack1, MOT_SWORD_EXERCISE, 4);
//	SetMotion_(attack1, MOT_ATTACK, 4);
	
	Wait_(10);
	SetMotion_(target, MOT_DAMAGE, 4);

	Wait_(5);
	SetDamageEffectSE(target,true);
	SetMotion_(attack2, MOT_SWORD_EXERCISE, 4);
	SetMotion_(target, MOT_DAMAGE, 4);
	
	Wait_(5);
	SetMotion_(attack3, MOT_SWORD_EXERCISE, 4);
	SetDamageEffectSE(target,true);
	SetMotion_(target, MOT_DAMAGE, 4);
	
	Wait_(5);
	SetDamageEffectSE(target,true);
	SetMotion_(attack1, MOT_SWORD_EXERCISE, 4);
	SetMotion_(target, MOT_DAMAGE, 4);
	
	
	Wait_(5);
	SetDamageEffectSE(target,true);
	SetMotion_(target, MOT_DAMAGE, 4);
	
	Wait_(5);
	SetDamageEffectSE(target,true);
	SetMotion_(target, MOT_DAMAGE, 4);
	
	Wait_(5);
	SetDamageEffectSE(target,true);
	SetMotion_(target, MOT_DAMAGE, 4);
	
	
	Wait_(5);
	SetDamageEffectSE(target,true);
	SetMotion_(attack2, MOT_SWORD_EXERCISE, 4);
	SetMotion_(target, MOT_DAMAGE, 4);
	
	Wait_(5);
	SetMotion_(attack3, MOT_SWORD_EXERCISE, 4);
	SetDamageEffectSE(target,true);
	SetMotion_(target, MOT_DAMAGE, 4);
	
	Wait_(5);
	SetDamageEffectSE(target,true);
	SetMotion_(attack1, MOT_SWORD_EXERCISE, 4);
	SetMotion_(target, MOT_DAMAGE, 4);
	
	
	Wait_(5);
	SetDamageEffectSE(target,true);
	SetMotion_(target, MOT_DAMAGE, 4);
	
	Wait_(5);
	SetDamageEffectSE(target,true);
	SetMotion_(target, MOT_DAMAGE, 4);
	
	Wait_(5);
	SetDamageEffectSE(target,true);
	SetMotion_(target, MOT_DAMAGE, 4);

	}

function MAction(attack,target)	//行動者がＭサイズの場合
{
	DebugPrint("BATTLE037_function_MAction")
	Task_AnimeMoveChar_(attack, 24);
	Task_AnimeMoveCharNoDir_(target, 10);
	Task_AnimeMoveCamera_(0);
	
	SetMotion_(attack, MOT_MOVE_LOOP, 0);
	
	Wait_(15);
	
	SetMotion_(attack, MOT_ATTACK, 4);
	
	Wait_(18);
	
	//モーション
	SetMotion_(target, MOT_DAMAGE, 4);
	
	Wait_(5);
	
	// エフェクト
	SetDamageEffectSE(target,true);
	
	Wait_(27);
}

