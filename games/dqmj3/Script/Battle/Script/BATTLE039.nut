// �X�J�E�g�i�o�b�j�p

// ������
function Init()
{
	DebugPrint("BATTLE039_function_Init")
	BattleCommon_Init();
	cAction <- cActionInfo(0)
	Debug_cActionPrint(cAction)
	ChangeIndexPointData_(PERSONAL_POINT_DATA);
	//�G�t�F�N�g
	LoadEffect_("EF000_14_SMOKE_FOOT");
	LoadEffect_("EF000_03_SHUCHUSEN");
}

// �X�V
function Update()
{
	DebugPrint("BATTLE039_function_Update")
	gAttack <- GetActorIndex_(0);
	gTarget <- GetTargetIndex_(0,0);
	local master = GetAllyMaster_();		// �}�X�^�[
	SetVisible_(master, true);
	SetVisible_(gAttack, false);
	SetVisible_(gTarget, false);

	//�J�����ʒu
	Task_AnimeMoveCamera_(0);

	//�}�X�^�[�؂藣������
	RideOffMaster_(master);
	
	//�}�X�^�[��]
	SetDir_(master, -90);
	
	//�}�X�^�[�@���[�V�����@�z�u
	Task_AnimeMoveCharNoDir_(master, 0);
	SetMotion_(master, 15, 0);
	SetMotionStepFrame_(master, 0.6);
	SetMonsterPlayMoveSE_(master,false);
	
	
//	local effect = SetCameraEffect_("EF000_03_SHUCHUSEN", 100);
	
	Wait_(14)
	
	//�G�t�F�N�g����������
//	DeleteEffectEmitter_(effect);
	
	Wait_(1)
	
//	SetMotion_(master, 15, 0);
	SetMotionStepFrame_(master, 1.0);
	SetMonsterPlayMoveSE_(master,false);
	

	
	Wait_(35)
	
	BatteleScript_End();
}
