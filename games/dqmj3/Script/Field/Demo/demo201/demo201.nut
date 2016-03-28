//=============================================
//
//		demo201[�l�I���p�[�N�̗��H�n���]
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
	local task_cam, task_player, task_okiduti;
	local efc_player;

// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();					// ��l��
	local model_dragon = ReadNpc_("m013_01");		// �h���S���o�P�[�W
	local model_incubus = ReadNpc_("m047_01");		// �C���L���o�X
	local model_okiduti = ReadNpc_("m035_00");		// �������Â�
	
// ���z�u
	// ��l��
	SetPointPos_(player, "player001");
	
	// �l�I���p�[�N�Z��
	local dragon00 = ArrangePointNpc_(model_dragon, "npc_dragon000");		// �h���S���o�P�[�WA
	local dragon01 = ArrangePointNpc_(model_dragon, "npc_dragon100");		// �h���S���o�P�[�WB
	local dragon02 = ArrangePointNpc_(model_dragon, "npc_dragon200");		// �h���S���o�P�[�WC

	local incubus00 = ArrangePointNpc_(model_okiduti, "npc_incubus000");	// �������Â�(�C���L���o�XA�ƈʒu�ύX�@�`�P�b�g#6704�j
	local incubus01 = ArrangePointNpc_(model_incubus, "npc_incubus100");	// �C���L���o�XB
	local incubus02 = ArrangePointNpc_(model_incubus, "npc_incubus200");	// �C���L���o�XC
	
	local okiduti00 = ArrangePointNpc_(model_incubus, "npc_okiduti000");	// �C���L���o�XA�i�������Â��ƈʒu�ύX�@�`�P�b�g#6704�j

// ���T�C�Y�ݒ�
	SetScaleSilhouette(dragon00, SCALE.N, SILHOUETTE_WIDTH.N);				// �h���S���o�P�[�WN�T�C�Y
	SetScaleSilhouette(dragon01, SCALE.N, SILHOUETTE_WIDTH.N);
	SetScaleSilhouette(dragon02, SCALE.N, SILHOUETTE_WIDTH.N);
	
	SetScaleSilhouette(incubus00, SCALE.N, SILHOUETTE_WIDTH.N);				// �C���L���o�XN�T�C�Y
	SetScaleSilhouette(incubus01, SCALE.N, SILHOUETTE_WIDTH.N);
	SetScaleSilhouette(incubus02, SCALE.N, SILHOUETTE_WIDTH.N);
	
	SetScaleSilhouette(okiduti00, SCALE.N, SILHOUETTE_WIDTH.N);				// �������Â�N�T�C�Y

// ���J�����ݒ�
	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------
	//===============================================
	// �J�b�g�@�@�`�H�n���Ȃ���`
	//===============================================
	//��l������
	SetMotion_(player, MOT_WALK, BLEND_N);
	task_player = Task_MoveForward_(player, 1.0, false);
	
	StartDemo(FADE_COLOR_BLACK);
	
	Wait_(60);
	
	//���t�F�[�h
	SetFade_(FADE_OUT, FADE_COLOR_WHITE, 30);
	WaitFade_();
	
	DeleteTask_(task_cam);
	DeleteTask_(task_player);
	SetMotion_(player, MOT_WAIT, BLEND_N);
	SetVisible(player, false);								//��l����\��
	
	Wait_(30);
	
	//===============================================
	// �J�b�g�A�@�`�l�I���X��������1�`
	//===============================================
	
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");
	WaitLod_();
	Wait_(15);
	
	//�t�F�[�h�C��
	SetFade_(FADE_IN, FADE_COLOR_WHITE, 30);
	WaitFade_();

	WaitTask(task_cam);
	Wait_(20);
	DeleteTask_(task_cam);
	
	//===============================================
	// �J�b�g�B�@�`�l�I���X��������2�`
	//===============================================
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");
	
	Wait_(70);
	
	//�������Â������]��������
	SetStepSe_(okiduti00, SILENT_STEP_SE);
	SetMotion_(okiduti00, MOT_WALK, BLEND_M);
	task_okiduti = Task_RotateToDir_(okiduti00, 0, ROTATE_DEMO_DEF);
	WaitTask(task_okiduti);
	DeleteTask_(task_okiduti);
	
	task_okiduti = Task_MoveForward_(okiduti00, 0.7, false);
	
	WaitTask(task_cam);
	Wait_(10);
	
	DeleteTask_(task_okiduti);
	SetVisible(okiduti00, false);
	
	//===============================================
	// �J�b�g�C�@�`��l�����J�����ɓ����`
	//===============================================
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	
	WaitLod_();

	// ��l���\��
	SetVisible(player, true);
	SetPointPos_(player, "player000");
	
	Wait_(150);
	
	EndDemo(FADE_COLOR_BLACK);
}
