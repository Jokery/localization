//=============================================
//
//		demo108[�Z���^�[�r������]
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
	local efc_cam, efc_player, efc_ace;
	local task_cam, task_player, task_ace, task_jack, task_npc01, task_npc02, task_npc03;
	
// ���G�t�F�N�g�ǂݍ���
	LoadEffect_("ef712_10_emo_surprise01");
	LoadEffect_("ef810_03_power_on");
	
// ���M�~�b�N�ݒu	
	local window = ReadGimmick_("o_A00_04");								//�Z���^�[�r���̑��M�~�b�N
	local res_tele = ArrangePointGimmick_("o_A00_04", window, "gimmick000");
	SetMotion_(res_tele, MOT_GIMMICK_1, 1);	
	local model_throne = ReadGimmick_("o_com_05");							// �ʍ�
	local throne = ArrangePointGimmick_("o_com_05", model_throne, "obj000");// �ʍ�
	
// �����f���Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();					// ��l��
	local model_nocho = ReadNpc_("n000");			// ��ʃm�`���[��
	local model_nocho_female = ReadNpc_("n004");	// ��ʃm�`���[���i���j
	local model_jack = ReadNpc_("n001");			// �W���b�N
	local model_ace = ReadNpc_("n002");				// �G�[�X
	local model_king = ReadNpc_("n003");			// �L���O
	local model_queen = ReadNpc_("n005");			// �N�C�[��

// ���z�u
	// ��l��
	SetPointPos_(player, "player");
	// �W���b�N
	local jack = ArrangePointNpc_(model_jack, "npc_jack000");
	// �G�[�X
	local ace = ArrangePointNpc_(model_ace, "npc_ace002");
	// �L���O
	local king = ArrangePointNpc_(model_king, "npc_king000");
	// �N�C�[��
	local qween = ArrangePointNpc_(model_queen, "npc_queen000");
	// dammy
	local dammy = ArrangePointNpc_(model_nocho, "center");
	
// ����풓���[�V�����Ǎ�
	// �L���O
	local stick_king = ReadMotion_(king, "n003_stick_up");					//�L���O�ҋ@����f��
	local stickL_king = ReadMotion_(king, "n003_stick_up_L");				//�L���O��f��
	local ki_talk_think = ReadMotion_(king, "n003_talk_think");				// �L���O�@��b���l����
	local ki_think_L = ReadMotion_(king, "n003_think_L");					// �L���O�@�l����L
	local ki_look_right_L = ReadMotion_(king, "n003_look_right_L");			// �L���O�@�E������L
	local ki_nod = ReadMotion_(king, "n003_nod");							// �L���O�@���ȂÂ�	
	// �G�[�X
	local ac_talk_joy_L = ReadMotion_(ace, "n002_talk_joy_L");				// �G�[�X�@��b�i���������jL
	local ac_look_bldg_L = ReadMotion_(ace, "n000_look_bldg_L");			// �G�[�X�@�Z���^�[�r��������L
	local ac_hand_up = ReadMotion_(ace, "n002_hand_up");					// �G�[�X�@��b�����������
	local ac_hand_up_L = ReadMotion_(ace, "n002_hand_up_L");				// �G�[�X�@���������L
	local ac_rejoice_L = ReadMotion_(ace, "n000_rejoice_L");				// �G�[�X�@�W�����v�i��сjL
	//�W���b�N
	local ja_rejoice_L = ReadMotion_(jack, "n000_rejoice_L");				// �W���b�N�@�W�����v�i��сjL
//	
// �������̃��[�V����
	//��l��
	SetMotion_(player, MOT_WALK, BLEND_N);
	
// �������̌���
	SetDir_(player, 180);
	
	local task_forward = Task_MoveForward_(player, 1.0, false);
// ���J�����ݒ�
	SetTime_(10000);		// ��
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");	
	local pwr_on = SetPointWorldEffect_("ef810_03_power_on", "gimmick000");
//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------
	//��������������������������������������
	//���J�b�g1�@�m�`���[�����炯�̃Z���^�[�r��
	//��������������������������������������
	StartDemo(FADE_COLOR_BLACK);
	Wait_(15);
	efc_ace = SurpriseDisp(ace);
	Wait_(45);
	DeleteTask_(task_forward);
	SetMotion_(player, MOT_WAIT, BLEND_M);
	
	//��v�m�`���[����l���̕��Ɍ���
	local task_ace = Task_WalkAroundToPos(ace, GetPos_(player), ROTATE_DEMO_DEF);
	Wait_(10);
	local task_jack = Task_WalkAroundToPos(jack, GetPos_(player), ROTATE_DEMO_DEF);
	Wait_(10);
	
	SetMotion_(ace, MOT_WAIT, BLEND_M);
	Wait_(10);
	SetMotion_(jack, MOT_WAIT, BLEND_M);
	Wait_(5);
	// ��l�������J�n�J�����C�������̑O�Ŏ~�܂�
	//��������������������������������������
	//���J�b�g2�@�G�[�X�A�b�v
	//��������������������������������������
	SetPointPos_(ace, "npc_ace000");						//�G�[�X�u�Ԉړ�
	SetDirToObject_(ace, player);
	
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	
	//===============================================
	// ���G�[�X
	// �u�������@<name_player/>�I
	//-----------------------------------------------
	SetMotion_(ace, ac_talk_joy_L, BLEND_M);								// �G�[�X�@��b�i���������jL
	
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_108_MSG_010");
	KeyInputWait_();
	
	//===============================================
	// ���G�[�X
	//�u���Ă���B�I���[�̂�������
	//-----------------------------------------------
	
	ShowMsg_("DEMO_108_MSG_020");
	SetMotion_(ace, ac_look_bldg_L, BLEND_L);								// �G�[�X�@�Z���^�[�r��������L
	
	KeyInputWait_();
	CloseMsgWnd_();
	
	Wait_(30);
	
	//��������������������������������������
	//���J�b�g3�@���d�{�݃A�b�v�����d�{�ݑS�i
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");
	WaitTask(task_cam);
	
	//�t�F�[�h�A�E�g
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 60);
	WaitFade_();
	
	//��������������������������������������
	//���J�b�g4 �L���O�A�G�[�X�A��l��
	//��������������������������������������
	task_player = Task_RotateToPos_(player, GetPos_(king), 287);
	task_ace = Task_RotateToPos_(ace, GetPos_(king), 287);
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");

	//�t�F�[�h�C��
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);
	WaitFade_();
	
	//===============================================
	// ���L���O
	// �u���ނ��ށB<name_player/>���G�[�X��
	//-----------------------------------------------
	Wait_(20);	
	SetMotion_(king, ki_look_right_L, BLEND_XL);					// �L���O�@�E������L
	SetMotion_(ace, MOT_WAIT, 30);									// �G�[�X�@�ҋ@
	
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_108_MSG_030");
	KeyInputWait_();

	// ���L���O
	//�u�������c�c�d�͂��~�܂��Ă����@�Ƃ������Ƃ�
	ShowMsg_("DEMO_108_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	
	SetMotion_(king, MOT_WAIT, BLEND_N);
	
	//��������������������������������������
	//���J�b�g5 �G�[�X�A�b�v�Ă�
	//��������������������������������������
	DeleteTask_(task_cam);
	
	SetPointCameraEye_("cameye003");
	SetPointCameraTarget_("camtgt003");
	
	//===============================================
	// ���G�[�X
	// �u�L���O�I�@�܂��͒����@�������߂Ă݂悤���B
	//-----------------------------------------------
	
	SetMotion_(ace, ac_talk_joy_L, BLEND_M);	// �G�[�X�@��b�i���������jL
	
	Wait_(5);
	
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_108_MSG_050");
	KeyInputWait_();
	
	CloseMsgWnd_();
	SetMotion_(ace, MOT_WAIT, 30);				// �G�[�X�@�ҋ@
	SetDirToObject_(king, player);
	
	//�m�`���[���ǂ��L���O�Î�
	SetDirToObject_(jack, king);
	SetDirToObject_(qween, king);
	
	//��������������������������������������
	//���J�b�g6�@�m�`���[���ړ�
	//��������������������������������������
	SetPointPos_(ace, "npc_ace002");						//�G�[�X�u�Ԉړ�
	SetDirToObject_(ace, king);

	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	
	//�m�`���[�������ړ��J�n
	SetMotion_(ace, MOT_WALK, BLEND_M);	
	local task_rotate = Task_RotateToPos_(ace, GetPos_(dammy), 11.5);	
	Wait_(3);
	SetMotion_(jack, MOT_WALK, BLEND_M);	
	local task_rotate2 = Task_RotateToPos_(jack, GetPos_(dammy), 11.5);	
	Wait_(2);
	SetMotion_(qween, MOT_WAIT, BLEND_M);	
	local task_rotate3 = Task_RotateToPos_(qween, GetPos_(dammy), 11.5);	
	WaitTask(task_rotate);
	local task_forward = Task_MoveForward_(ace, 1.0, false);
	WaitTask(task_rotate2);
	local task_forward = Task_MoveForward_(jack, 1.0, false);
	WaitTask(task_rotate3);
	
	Wait_(40);
	
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	EndDemoBgmFade_(FADE_DEF);
	Wait_(15);
	
	SetStepSe_(ace, SILENT_STEP_SE);
	SetStepSe_(jack, SILENT_STEP_SE);
	
	WaitFade_();
	DeleteAllTask_();
	SetSepiaColor_(false);
	End_();
	
//	EndDemo(FADE_COLOR_BLACK);		// ����SE���t�F�[�h�r���ŏ�������
}
