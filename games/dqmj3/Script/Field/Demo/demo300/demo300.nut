//=============================================
//
//		Demo300[�����̕X���E�S�i]
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
	local task_cam, task_hawk1, task_deep1, task_deep2, task_deep3, task_gorem1, task_gorem2, task_slime1, task_slime2, task_dragon;

// �����\�[�X�Ǎ�
	// �M�~�b�N
	local model_ruler = ReadGimmick_("o_com_08");	// ���[���|�C���g
	// �L�����N�^�[
	local player = GetPlayerId_();								// ��l��
	local model_slime = ReadNpc_("m009_01");					// �X���C���u���X
	local model_dragon = ReadNpc_("m015_01");					// �������イ
	local model_hawk = ReadNpc_("m053_01");						// �z�[�N�u���U�[�h
	local model_brawn = ReadNpc_("m035_01");					// �u���E�j�[
	local model_gorem = ReadNpc_("m110_03");					// �A�C�X�S�[����
	local model_deep = ReadNpc_("m144_01");						// �f�B�[�v�o�C�^�[
	
// ���z�u
	// ���[���|�C���g
	local ruler = ArrangePointGimmick_("o_com_08", model_ruler, "obj_ruler000");
	
	// ��l��
	SetPointPos_(player, "player000");
	SetVisible(player, false);
	
	//���X���C���u���X
	local slime00 = ArrangePointNpc_(model_slime, "npc_slime000");
	SetScaleSilhouette(slime00, SCALE.M, SILHOUETTE_WIDTH.M);			//M�T�C�Y
	SetStepSe_(slime00, SILENT_STEP_SE);

	local slime01 = ArrangePointNpc_(model_slime, "npc_slime001");
	SetScaleSilhouette(slime01, SCALE.M, SILHOUETTE_WIDTH.M);			//M�T�C�Y
	SetStepSe_(slime01, SILENT_STEP_SE);
	
	local gorem00 = ArrangePointNpc_(model_slime, "npc_gorem000");
	SetScaleSilhouette(gorem00, SCALE.M, SILHOUETTE_WIDTH.M);			//M�T�C�Y
	SetStepSe_(gorem00, SILENT_STEP_SE);
	
	//���������イ
	local dragon00 = ArrangePointNpc_(model_dragon, "npc_dragon000");
	SetScaleSilhouette(dragon00, 1.5, SILHOUETTE_WIDTH.M);				//�J�����������̂ŃT�C�Y�ύX
	SetStepSe_(dragon00, SILENT_STEP_SE);

	local dragon01 = ArrangePointNpc_(model_dragon, "npc_dragon001");
	SetScaleSilhouette(dragon01, 1.5, SILHOUETTE_WIDTH.M);				//�J�����������̂ŃT�C�Y�ύX
	SetStepSe_(dragon01, SILENT_STEP_SE);
	
	//���z�[�N�u���U�[�h
	local hawk01 = ArrangePointNpc_(model_hawk, "npc_hawk001");
	SetScaleSilhouette(hawk01, SCALE.M, SILHOUETTE_WIDTH.M);			//M�T�C�Y
	SetStepSe_(hawk01, SILENT_STEP_SE);
	SetMotion_(hawk01, MOT_RUN, BLEND_N);								//�������[�V����

	//���f�B�[�v�o�C�^�[
	local deep00 = ArrangePointNpc_(model_deep, "npc_deep000");
	SetScaleSilhouette(deep00, 1.3, SILHOUETTE_WIDTH.M);				//�J�����������̂ŃT�C�Y�ύX
	SetStepSe_(deep00, SILENT_STEP_SE);
	SetPointPosNoFit_(deep00, "npc_deep000");
	SetMotion_(deep00, MOT_SPECIAL_RUN, BLEND_N);						//�������[�V����

	local deep01 = ArrangePointNpc_(model_deep, "npc_deep001");
	SetScaleSilhouette(deep01, 1.3, SILHOUETTE_WIDTH.M);				//�J�����������̂ŃT�C�Y�ύX
	SetStepSe_(deep01, SILENT_STEP_SE);
	SetPointPosNoFit_(deep01, "npc_deep001");
	SetMotion_(deep01, MOT_SPECIAL_RUN, BLEND_N);						//�������[�V����
	
	local deep02 = ArrangePointNpc_(model_deep, "npc_deep002");
	SetScaleSilhouette(deep02, 1.3, SILHOUETTE_WIDTH.M);				//�J�����������̂ŃT�C�Y�ύX
	SetStepSe_(deep02, SILENT_STEP_SE);
	SetPointPosNoFit_(deep02, "npc_deep002");
	SetMotion_(deep02, MOT_SPECIAL_RUN, BLEND_N);						//�������[�V����

	//���A�C�X�S�[����
	local gorem01 = ArrangePointNpc_(model_gorem, "npc_gorem001");
	SetScaleSilhouette(gorem01, SCALE.M, SILHOUETTE_WIDTH.M);			//M�T�C�Y
	SetStepSe_(gorem01, SILENT_STEP_SE);
	
	//���u���E�j�[
	local brawn00 = ArrangePointNpc_(model_brawn, "npc_brawn000");
	SetScaleSilhouette(brawn00, 0.8, SILHOUETTE_WIDTH.S);				//�J�����������̂ŃT�C�Y�ύX
	SetStepSe_(brawn00, SILENT_STEP_SE);
	SetMotion_(hawk01, MOT_WALK, BLEND_N);								//�������[�V����

	local brawn01 = ArrangePointNpc_(model_brawn, "npc_brawn001");
	SetScaleSilhouette(brawn01, 0.8, SILHOUETTE_WIDTH.S);				//�J�����������̂ŃT�C�Y�ύX
	SetStepSe_(brawn01, SILENT_STEP_SE);
	SetMotion_(hawk01, MOT_WALK, BLEND_N);								//�������[�V����

// ���J�����ݒ�
	task_hawk1 = Task_AnimeMoveNoFit_(hawk01, "anm_hawk001");
	Wait_(15);
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");	// 200F
	Wait_(15);

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemoNoFade(FADE_COLOR_BLACK);
	
	//��������������������������������������
	//���J�b�g1
	//��������������������������������������
	
	task_deep1 = Task_MoveForward_(deep00, 1.1, false);										//�J��
	task_deep2 = Task_MoveForward_(deep01, 2.0, false);
	task_deep3 = Task_MoveForward_(deep02, 1.2, false);
	Wait_(40);
	SetMotion_(gorem00, MOT_WALK, BLEND_N);													//�����X���C���u���X
	task_gorem2 = Task_MoveForward_(gorem00, 2.0, false);
	Wait_(30);
	SetMotion_(gorem01, MOT_WALK, BLEND_N);													//�����S�[����
	task_gorem1 = Task_MoveForward_(gorem01, 1.5, false);
	
	WaitTask(task_cam);
	
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 20);
	WaitFade_();
	DeleteTask_(task_deep1);
	DeleteTask_(task_deep2);
	DeleteTask_(task_deep3);
	DeleteTask_(task_gorem1);
	DeleteTask_(task_gorem2);
	//��������������������������������������
	//���J�b�g2
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");	// 210F
	
	SetMotion_(dragon00, MOT_RUN, BLEND_N);													//���邹�����イ
	task_dragon = Task_MoveForward_(dragon00, 1.5, true);
	
	SetMotion_(slime00, MOT_RUN, BLEND_N);													//������X���C���u���X
	task_slime1 = Task_MoveForward_(slime00, 1.3, true);
	
	SetMotion_(slime01, MOT_RUN, BLEND_N);
	task_slime2 = Task_MoveForward_(slime01, 0.6, true);
	
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);
	WaitFade_();
	
	Wait_(50);
	SetMotion_(dragon00, MOT_LIFE_SPECIAL_1, BLEND_M);										//�H���������イ
	Wait_(10);
	SetMotion_(slime00, MOT_DAMAGE, BLEND_M);												//�X���C���u���X�@�_���[�W
	
	task_deep1 = Task_MoveForward_(brawn00, 1.1, false);									//�u���E�j�[�ړ�
	task_deep2 = Task_MoveForward_(brawn01, 1.0, false);

	Wait_(40);
	SetMotion_(dragon01, MOT_LIFE_SPECIAL_2, BLEND_M);										//�i���邹�����イB
	
	WaitTask(task_cam);
	
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 20);
	WaitFade_();
	DeleteTask_(task_dragon);
	DeleteTask_(task_slime1);
	DeleteTask_(task_slime2);
	DeleteTask_(task_deep1);
	DeleteTask_(task_deep2);
	
	//��������������������������������������
	//���J�b�g3
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");	// 150F
	
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);
	WaitFade_();	

	WaitTask(task_cam);
	
	Wait_(15);
	
	EndDemo(FADE_COLOR_BLACK);
}
