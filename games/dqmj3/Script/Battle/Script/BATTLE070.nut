// 連携用

// 初期化
function Init()
{
	BattleCommon_Init();
}

// 更新
function Update()
{
	local allyCamEye = GetVec3_Camera(true);
	local allyCamTgt = GetVec3_CameraTarget(true);
	local allyEffectEmpty = GetVec3_EffectEmpty(true);
	
	local enemyCamEye = GetVec3_Camera(false);
	local enemyCamTgt = GetVec3_CameraTarget(false);
	local enemyEffectEmpty = GetVec3_EffectEmpty(false);
	
	CharaStand_PartyFull(false, true);
	CharaStand_PartyFull(false, false);
	local task = Task_Chain_(	allyCamEye, allyCamTgt, allyEffectEmpty,
								enemyCamEye, enemyCamTgt, enemyEffectEmpty);

	while(!IsTaskEnd_(task)){
		Wait_(1);
	}
	
	BatteleScript_End();
}

