//========================================================
//
//              �C�x���gNo.200 ������n�S�i
//
//========================================================

function Update()
{	
	//=====================================
	//���[�J���ϐ��̐ݒ�
	//=====================================
	local task_cam, task_dead, task_gaikotu, task_bat;					//�^�X�N�֌W�̕ϐ�
	local efc_player, efc_dead00, efc_dead01, efc_dead02;				//�G�t�F�N�g�֌W�̕ϐ�
	local player;														//�L�����N�^�[�̕ϐ�
	
	//=====================================
	//���\�[�X�ǂݍ���
	//=====================================
	// �����f���Ǎ�
	local model_dead = ReadNpc_("m102_00");								// ������������
	local model_gaikotu = ReadNpc_("m101_00");							// ��������
	local model_bat00 = ReadNpc_("m097_00");							// �{�[���o�b�g
	local model_bat01 = ReadNpc_("m097_02");							// �ق˂�������
	local model_rezard = ReadNpc_("m017_00");							// ���U�[�h�}��

	// ���M�~�b�N�Ǎ�
	local model_reddoor = ReadGimmick_("o_G00_00");						// �A���f�b�h�K�[�f���̔�(��)
	local model_ruler = ReadGimmick_("o_com_08");						// ���[���|�C���g

	// ���G�t�F�N�g�Ǎ�
	LoadEffect_("ef726_02_nat_zombie");									// �]���r�n���y����o�Ă���Ƃ���

	//=====================================
	//�ݒu
	//=====================================
	//��������������
	local dead00 = ArrangePointNpc_(model_dead, "npc_dead000");
	SetScaleSilhouette(dead00, SCALE.M, SILHOUETTE_WIDTH.M);			//M�T�C�Y
	SetStepSe_(dead00, SILENT_STEP_SE);
	local dead01 = ArrangePointNpc_(model_dead, "npc_dead001");
	SetScaleSilhouette(dead01, SCALE.M, SILHOUETTE_WIDTH.M);			//N�T�C�Y
	SetStepSe_(dead01, SILENT_STEP_SE);

	//�����U�[�h�}��
	local dead02 = ArrangePointNpc_(model_rezard, "npc_dead002");
	SetScaleSilhouette(dead02, SCALE.M, SILHOUETTE_WIDTH.M);			//M�T�C�Y
	SetStepSe_(dead02, SILENT_STEP_SE);

	//����������
	local gaikotu00 = ArrangePointNpc_(model_gaikotu, "npc_gaikotu000");
	SetScaleSilhouette(gaikotu00, SCALE.M, SILHOUETTE_WIDTH.M);			//M�T�C�Y
	SetStepSe_(gaikotu00, SILENT_STEP_SE);

	//���ق˂�������
	local bat00 = ArrangePointNpc_(model_bat01, "npc_bat000");
	SetScaleSilhouette(bat00, SCALE.N, SILHOUETTE_WIDTH.N);				//N�T�C�Y
	SetStepSe_(bat00, SILENT_STEP_SE);

	//���A���f�b�h�K�[�f���̔�(��)
	local reddoor = ArrangePointGimmick_("o_G00_00", model_reddoor, "obj_reddoor000");
	
	//�����[���|�C���g
	local ruler = ArrangePointGimmick_("o_com_08", model_ruler, "obj_ruler000");

	// �������\���ݒ�
	SetVisible(dead00, false);										//��\���Ȏ���A
	SetVisible(dead01, false);										//��\���Ȏ���B

	// �����Ԑݒ�
	SetTime_(START_TIME_ZONE_NIGHT);
	//��������������������������������������
	//���J�b�g�P
	//��������������������������������������
	
	//�`�`�`�`�`�`�`�`�`�J�����`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");

	
	StartDemo(FADE_COLOR_BLACK);
	
	SetMotion_(gaikotu00, MOT_WALK, BLEND_M);
	task_gaikotu = Task_MoveForward_(gaikotu00, 2.0, false);		//�[������
	
	Wait_(105);
	
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 15);						//�t�F�[�h�A�E�g
	WaitFade_();
	DeleteTask_(task_gaikotu);
	//��������������������������������������
	//���J�b�g2
	//��������������������������������������
	//�`�`�`�`�`�`�`�`�`�J�����`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");


	SetFade_(FADE_IN, FADE_COLOR_BLACK, 15);						//�t�F�[�h�C��
	WaitFade_();
	
	SetMotion_(dead02, MOT_RUN, BLEND_N);													//���郊�U�[�h�}��
	task_dead = Task_MoveForward_(dead02, 0.9, true);
	
	SetMotion_(dead00, MOT_LIFE_SPECIAL_1, BLEND_N);										//�����o�鎀��A
	SetVisible(dead00, true);																//�\������鎀��A
	efc_dead00 = SetSelectBoneEffect_("ef726_02_nat_zombie", dead00, ATTACH_GLOBAL);		//�y�G�t�F�N�g
	WaitMotion(dead00);
	SetMotion_(dead00, MOT_WAIT, BLEND_M);													//����A�ҋ@
	
	SetMotion_(dead01, MOT_LIFE_SPECIAL_1, BLEND_N);										//�����o�鎀��B	
	SetVisible(dead01, true);																//�\������鎀��B
	efc_dead01 = SetSelectBoneEffect_("ef726_02_nat_zombie", dead01, ATTACH_GLOBAL);		//�y�G�t�F�N�g
	WaitMotion(dead01);
	SetMotion_(dead01, MOT_WAIT, BLEND_M);													//����B�ҋ@
	
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 15);						//�t�F�[�h�A�E�g
	WaitFade_();
	DeleteTask_(task_dead);
	//��������������������������������������
	//���J�b�g3
	//��������������������������������������
	//�`�`�`�`�`�`�`�`�`�J�����`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");

	SetFade_(FADE_IN, FADE_COLOR_BLACK, 15);						//�t�F�[�h�C��
	WaitFade_();
	
	WaitTask(task_cam);
	Wait_(15);
	
	EndDemo(FADE_COLOR_BLACK);
}
