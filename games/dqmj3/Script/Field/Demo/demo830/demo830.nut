//=============================================
//
//		demo830[�l�ނ̕����A������]
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
	local task_cam, task_m_regi, task_man, task_nocho;

// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local id_nocho_m	 = ReadNpc_("n000");		// �m�`���[����
	local id_jack		 = ReadNpc_("n001");		// �W���b�N
	local id_queen		 = ReadNpc_("n005");		// �N�C�[��
	local id_m_regi		 = ReadNpc_("n012");		// ���W�X�^���X �j��
	local id_f_regi		 = ReadNpc_("n013");		// ���W�X�^���X ����
	local id_man		 = ReadNpc_("n015");		// �ږ� �j��
	local id_girl		 = ReadNpc_("n016");		// �ږ� ����
	local id_boy		 = ReadNpc_("n017");		// �ږ� �j�̎q
	local id_aroma		 = ReadNpc_("n018");		// �A���}
	// �G�t�F�N�g
	LoadEffect_("ef712_04_emo_joy01");				// ���
	LoadEffect_("ef712_13_emo_sweat01");			// ��
	LoadEffect_("ef712_10_emo_surprise01");			// �u�I�v

// ���z�u
	// �m�`���[����
	local nochoS = ArrangePointNpc_(id_nocho_m,"nocho000");
	SetStepSe_(nochoS, SILENT_STEP_SE);
	// �W���b�N
	local jack = ArrangePointNpc_(id_jack,"jack000");
	SetStepSe_(jack, SILENT_STEP_SE);
	// �N�C�[��
	local queen = ArrangePointNpc_(id_queen,"queen");
	SetStepSe_(queen, SILENT_STEP_SE);
	// ���W�X�^���X �j��
	local m_regi = ArrangePointNpc_(id_m_regi,"m_regi000");
	SetStepSe_(m_regi, SILENT_STEP_SE);
	// ���W�X�^���X ����
	local f_regi = ArrangePointNpc_(id_f_regi,"f_regi");
	SetStepSe_(f_regi, SILENT_STEP_SE);
	// �ږ� �j��
	local man = ArrangePointNpc_(id_man,"man000");
	SetStepSe_(man, SILENT_STEP_SE);
	// �ږ� �j�̎q
	local boy = ArrangePointNpc_(id_boy,"boy");
	SetStepSe_(boy, SILENT_STEP_SE);
	// �ږ� ����
	local girl = ArrangePointNpc_(id_girl,"girl");
	SetStepSe_(girl, SILENT_STEP_SE);
	// �A���}
	local aroma = ArrangePointNpc_(id_aroma,"aroma");
	SetStepSe_(aroma, SILENT_STEP_SE);

// ����풓���[�V�����Ǎ�
	//�m�`���[���p
	local n_jumpS = ReadMotion_(nochoS, "n000_rejoice");				//�ʏ��b���W�����v
	local n_jumpLS = ReadMotion_(nochoS, "n000_rejoice_L");				//�W�����vL
	local nS_run = ReadMotion_(nochoS, "n001_run_L");					//���ꂵ�����ɂ͂���
	
	//�W���b�N�p
	local j_bow = ReadMotion_(jack, "n001_bow");						//�ʏ��b������������
	local j_talk = ReadMotion_(jack, "n001_talk01");					//���������遨�ʏ��b
	local j_talk02_L = ReadMotion_(jack, "n001_talk02_L");				//��b�i���������jL
	
	//���̎q
	local girl_hand_L = ReadMotion_(girl, "n016_shake_the_hand_L");		//���U��L
	
	//�j�̎q
	local boy_hand_L = ReadMotion_(boy, "n017_shake_the_hand_L");		//���U��L
	
	//�A���}���[�V����
	local a_ue = ReadMotion_(aroma, "n018_look_up_L");					//�����
	
// �����[�V�����ݒ�
	SetMotion_(nochoS, n_jumpLS, BLEND_N);
	SetMotion_(jack, j_talk02_L, BLEND_N);
	SetMotion_(boy, boy_hand_L, BLEND_N);
	SetMotion_(girl, girl_hand_L, BLEND_N);
	SetMotion_(aroma, a_ue, BLEND_N);
	
// ���J�����ݒ�
	SetPointCameraEye_("001_cameye");
	SetPointCameraTarget_("001_camtgt");

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	//�J�b�g�P
	Wait_(30);
	
	SetPointPos_(jack, "jack001");
	SetVisible(queen, false);
	SetVisible(f_regi, false);
	
	//�J�b�g�Q�������鑤�̃J�b�g
	SetPointCameraEye_("002_cameye");
	SetPointCameraTarget_("002_camtgt");
	Wait_(60);
	
	//�J�b�g�R���������鑤�̃J�b�g
	SetPointCameraEye_("003_cameye");
	SetPointCameraTarget_("003_camtgt");
	Wait_(45);
	
	SetMotion_(m_regi, MOT_WALK, BLEND_L);
	task_m_regi =Task_RotateToDir_(m_regi, 0, ROTATE_DEMO_DEF);
	Wait_(20);
	SetMotion_(man, MOT_WALK, BLEND_L);
	task_man =Task_RotateToDir_(man, 0, ROTATE_DEMO_DEF*0.8);
	
	WaitTask(task_m_regi);
	task_m_regi = Task_MoveToPointSetSpeed_(m_regi, "m_regi001", 0.5);
	WaitTask(task_man);
	task_man = Task_MoveToPointSetSpeed_(man, "man001", 0.5);
	
	SetMotion_(man, MOT_WALK, BLEND_M);
	SetMotion_(m_regi, MOT_WALK, BLEND_M);
	Wait_(23);
	
	task_nocho =Task_WalkAroundToDir(nochoS, 0, ROTATE_DEMO_DEF);
	WaitTask(task_nocho);
	task_nocho = Task_MoveToPointSetSpeed_(nochoS, "nocho001", 1.5);
	SetMotion_(nochoS, nS_run, 8);
	Wait_(15);
	
	//-----
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);
	WaitFade_();
	
	//�J�b�g�S����
	WaitLod_();
	SetStopLod_(true);
	task_cam	 = Task_AnimeMoveCamera_("001_anmeye", "001_anmtgt");
	
	//�J�b�g�S
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 20);
	//-----
	Wait_(30);
	StopBgm_(150);
	WaitTask(task_cam);
	Wait_(30);
	
	EndDemo(FADE_COLOR_BLACK);
}
