// スカウト（ＰＣ）用

// 初期化
function Init()
{
	DebugPrint("BATTLE039_function_Init")
	BattleCommon_Init();
	cAction <- cActionInfo(0)
	Debug_cActionPrint(cAction)
	ChangeIndexPointData_(PERSONAL_POINT_DATA);
	//エフェクト
	LoadEffect_("EF000_14_SMOKE_FOOT");
	LoadEffect_("EF000_03_SHUCHUSEN");
}

// 更新
function Update()
{
	DebugPrint("BATTLE039_function_Update")
	gAttack <- GetActorIndex_(0);
	gTarget <- GetTargetIndex_(0,0);
	local master = GetAllyMaster_();		// マスター
	SetVisible_(master, true);
	SetVisible_(gAttack, false);
	SetVisible_(gTarget, false);

	//カメラ位置
	Task_AnimeMoveCamera_(0);

	//マスター切り離し命令
	RideOffMaster_(master);
	
	//マスター回転
	SetDir_(master, -90);
	
	//マスター　モーション　配置
	Task_AnimeMoveCharNoDir_(master, 0);
	SetMotion_(master, 15, 0);
	SetMotionStepFrame_(master, 0.6);
	SetMonsterPlayMoveSE_(master,false);
	
	
//	local effect = SetCameraEffect_("EF000_03_SHUCHUSEN", 100);
	
	Wait_(14)
	
	//エフェクトを消す命令
//	DeleteEffectEmitter_(effect);
	
	Wait_(1)
	
//	SetMotion_(master, 15, 0);
	SetMotionStepFrame_(master, 1.0);
	SetMonsterPlayMoveSE_(master,false);
	

	
	Wait_(35)
	
	BatteleScript_End();
}
