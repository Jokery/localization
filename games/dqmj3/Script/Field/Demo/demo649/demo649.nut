//=============================================
//
//		demo649[�K���}�U�[�h�폟��_8(��-����)]
//
//=============================================

//-------------------------------------------------------------------------
//
//		�ǂݍ��݁E�z�u
//
//-------------------------------------------------------------------------
function Update()
{

// ���ϐ���`
	local task_cam, task_player, task_slime, task_almi, task_hat;
	local efc_player,efc_catastrophe000;

// �����Ԑݒ�
	SetTime_(0);									//��

// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local model_slime = ReadNpc_("m000_00");			// �X���C��
	local model_almi = ReadNpc_("m036_00");				// �A���~���[�W
	local model_hat = ReadNpc_("m048_00");				// �r�b�O�n�b�g
	local model_denden = ReadNpc_("m013_00");			// �ł�ł�
	//�G�t�F�N�g
	LoadEffect_("ef864_05_catastrophe02");				// �V�g�̂͂���
	LoadEffect_("ef864_04_catastrophe01");				// ᏋC
	LoadEffect_("ef320_01_life_zzz");					// ZZZ

// ���z�u
	local slime = ArrangePointNpc_(model_slime, "npc_slime000");
	SetScaleSilhouette(slime, SCALE.S, SILHOUETTE_WIDTH.S);								// �T�C�YS

	local almi = ArrangePointNpc_(model_almi, "npc_almi000");
	SetScaleSilhouette(almi, SCALE.S, SILHOUETTE_WIDTH.S);								// �T�C�YS

	local hat = ArrangePointNpc_(model_hat, "npc_hat000");
	SetScaleSilhouette(hat, SCALE.S, SILHOUETTE_WIDTH.S);								// �T�C�YS

	local denden = ArrangePointNpc_(model_denden, "npc_denden000");
	SetScaleSilhouette(denden, SCALE.N, SILHOUETTE_WIDTH.N);							// �T�C�YN

// ���������[�V�����Ǎ�
	SetStepSe_(slime, SILENT_STEP_SE);
	SetStepSe_(almi, SILENT_STEP_SE);
	SetStepSe_(hat, SILENT_STEP_SE);
	SetMotion_(slime, MOT_RUN, BLEND_N);												// �X����������
	Wait_(2);
	SetMotion_(almi, MOT_RUN, BLEND_N);
	Wait_(2);
	SetMotion_(hat, MOT_RUN, BLEND_N);
	SetMotion_(denden, MOT_LIFE_SPECIAL_1, BLEND_N);									// �ł�ł񗳐Q��
	local efc_ZZZ = SetSelectBoneEffectSetOffset_("ef320_01_life_zzz", denden, ATTACH_EFFECT1, Vec3(0.0, -3.0, 0.0));
	SetEffectScale_(efc_ZZZ, 0.8);

// ���J�����ݒ�
	ReadWaitingLod("lodeye000", "lodtgt000");
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");


//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------
	// �V�g�̂͂���
	StartDemo(FADE_COLOR_WHITE);

	Wait_(150);
	task_slime = Task_MoveForward_(slime, 0.7, true);
	task_hat = Task_MoveForward_(hat, 0.5, true);	
	Wait_(10);
	task_almi = Task_MoveForward_(almi, 0.8, true);
	WaitTask(task_cam);
	Wait_(200);

	EndDemo(FADE_COLOR_BLACK);
}
