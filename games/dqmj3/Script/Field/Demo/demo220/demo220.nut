//=============================================
//
//		Demo220[���[�X�v���O��������]
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
	local task_cam, task_player, task_nocho, task_foot, task_foot1, task_foot2, task_foot3, task_foot4, task_foot5, efc_nocho;

// ���t���O�ݒ�
	local bit_ruler = GetEventFlg_("BFG_RULER_ADD_010");			// Bit_210 ���[���ǉ��t���O

// �����\�[�X�Ǎ�
	// �M�~�b�N
	local model_ruler = ReadGimmick_("o_com_08");	// ���[���|�C���g
	local model_reactor = ReadGimmick_("o_dem_07");		// ���A�N�^�[
	// �L�����N�^�[
	local player = GetPlayerId_();					// ��l��
	local model_nocho = ReadNpc_("n006");			// �`���[�}�b�n
	// �G�t�F�N�g
	LoadEffect_("ef712_10_emo_surprise01");			// �u�I�v
	LoadEffect_("ef712_01_emo_notice01");			// �C�Â�

// ���z�u
	// ��l��
	SetPointPos_(player, "player000");
	// �`���[�}�b�n
	local nocho = ArrangePointNpc_(model_nocho, "npc_nocho000");
	SetStepSePan_(nocho, false);
	//���A�N�^�[
	local reactor = ArrangePointGimmick_("o_dem_07", model_reactor, "obj_reactor000");
	SetPointPosNoFit_(reactor, "obj_reactor000");
	SetMotion_(reactor, MOT_GIMMICK_0, BLEND_N);

// ����풓���[�V�����Ǎ�
	// ���[���|�C���g
	local ruler = ArrangePointGimmick_("o_com_08", model_ruler, "obj_ruler000");
	// �����[���|�C���g�����ɋN�����Ă����ꍇ
	if (bit_ruler) { SetMotion_(ruler, MOT_GIMMICK_2, BLEND_N); }
	
	// ��l��
	local player_look_right_L = ReadMotion_(player, "Player_look_right_L");	// �E������L
	local player_look_left_L = ReadMotion_(player, "Player_look_left_L");	// ���������������L
	local player_talk = ReadMotion_(player, "Player_talk");					// ��l���b��
	local player_talk_L = ReadMotion_(player, "Player_talk_L");				// ��l���b��L
	// �`���[�}�b�n
	local nocho_run_L = ReadMotion_(nocho, "n001_run_L");					// ����L
	local nocho_think02_L = ReadMotion_(nocho, "n000_think02_L");			// �l����i�r�g�݁jL
	local nocho_arm_folde = ReadMotion_(nocho, "n000_arm_folde");			// �l����i�r�g�݁j���r�g��
	local nocho_arm_folde_L = ReadMotion_(nocho, "n000_arm_folde_L");		// �r�g��L
	local nocho_talk_joy_L = ReadMotion_(nocho, "n000_talk_joy_L");			// ��b�i���������jL
	local nocho_hand_up = ReadMotion_(nocho, "n002_hand_up");
	local nocho_hand_up_L = ReadMotion_(nocho, "n002_hand_up_L");
	
	SetMotion_(nocho, nocho_run_L, BLEND_N);

// �����Ԑݒ�
	SetTime_(START_TIME_ZONE_NIGHT);

// ���J�����ݒ�
	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	//===============================================
	// ���`���[�}�b�n
	// �u���[���I
	// �@<name_player/>�I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_CHOMACH");
	ShowMsg_("DEMO_220_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	task_nocho = Task_MoveForward_(nocho, 0.82, true);
	task_foot = Task_PlaySe_("SE_FLD_011", 5);
	
	Wait_(15);
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");		// 65F
	Wait_(15);
	
	Wait_(37);
	DeleteTask_(task_nocho);
	DeleteTask_(task_foot);
	SetMotion_(nocho, MOT_WAIT, BLEND_M);
	
	Wait_(5);
	SetMotion_(nocho, MOT_TALK, BLEND_M);
	WaitMotion(nocho);
	SetMotion_(nocho, MOT_TALKLOOP, BLEND_M);
	
	WaitTask(task_cam);
	
	//===============================================
	// ���`���[�}�b�n
	// �u��������̂��b�V���@�u���h���h���I
	// �@����Łc�c���A�N�^�[�́@�������b�V���H
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_CHOMACH");
	ShowMsg_("DEMO_220_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(nocho, MOT_WAIT, BLEND_M);
	
	SetMotion_(player, player_talk, BLEND_M);	// ��l������
	WaitMotion(player);
	SetMotion_(player, player_talk_L, BLEND_M);
	Wait_(65);
	
	SetMotion_(player, player_look_right_L, BLEND_XL);
	Wait_(5);
	
	task_nocho = Task_RotateToDirSetMotion_(nocho, 250, ROTATE_DEMO_DEF, MOT_WALK, MOT_WAIT);
	task_foot1 = Task_PlaySe_("SE_FLD_011", 7);
	Wait_(22);
	
	DeleteTask_(task_foot1);
	SurpriseDisp(nocho);
	
	Wait_(60);
	
	DeleteTask_(task_nocho);
	
	//��������������������������������������
	// ���J�b�g2
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");		// 60F
	WaitTask(task_cam);
	
	//===============================================
	// ���`���[�}�b�n
	// �u�������I�@���A�N�^�[���b�V���I
	// �@�������@�}�b�n�Œ��ׂĂ݂�b�V���I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_CHOMACH");
	ShowMsg_("DEMO_220_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetPointPos_(nocho, "npc_nocho001");
	task_player = Task_AnimeMoveSetMotion_(player, "anm_player000", MOT_WALK, MOT_WAIT);
	task_nocho = Task_MoveForward_(nocho, 0.5, true);
	SetMotion_(nocho, nocho_run_L, BLEND_N);
	task_foot2 = Task_PlaySe_("SE_FLD_011", 5);
	
	//��������������������������������������
	// ���J�b�g3
	//��������������������������������������
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	
	Wait_(29);
	DeleteTask_(task_nocho);
	DeleteTask_(task_foot2);
	
	SetMotion_(nocho, MOT_WAIT, BLEND_M);
	
	Wait_(10);
	SetMotion_(nocho, MOT_TALK, BLEND_M);
	WaitMotion(nocho);
	SetMotion_(nocho, MOT_TALKLOOP, BLEND_M);
	
	//===============================================
	// ���`���[�}�b�n
	// �u�������I�@���̃��A�N�^�[�́c�c
	// �@�����������I�@�T���Ă����́@�������b�V���I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_CHOMACH");
	ShowMsg_("DEMO_220_MSG_040");
	KeyInputWait_();
	
	WaitTask(task_player);
	Wait_(2);
	
	SetMotion_(nocho, nocho_arm_folde_L, BLEND_L);
	Wait_(2);
	SetMotion_(player, player_look_left_L, BLEND_L);
	
	//-----------------------------------------------
	// ���`���[�}�b�n
	// �u�ӂނӂށ@�����s�s�̃Z���^�[�r����
	// �@���̃v���O�����́@�g���΂����b�V�����B
	//-----------------------------------------------
	ShowMsg_("DEMO_220_MSG_050");
	KeyInputWait_();
	
	SetMotion_(nocho, MOT_TALK, BLEND_M);
	WaitMotion(nocho);
	SetMotion_(nocho, MOT_TALKLOOP, BLEND_M);
	
	//-----------------------------------------------
	// ���`���[�}�b�n
	// �u����������@�����Ȃ��b�V���I
	// �@�������������s�s�Ł@�����Ă݂�b�V���I
	//-----------------------------------------------
	ShowMsg_("DEMO_220_MSG_060");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	task_nocho = Task_RotateToDir_(nocho, 430, ROTATE_DEMO_DEF);
	SetMotion_(nocho, MOT_WALK, BLEND_M);
	WaitTask(task_nocho);
	task_nocho = Task_RotateToDir_(nocho, 445, ROTATE_DEMO_DEF);
	WaitTask(task_nocho);
	SetMotion_(nocho, nocho_run_L, BLEND_M);
	task_nocho = Task_MoveForward_(nocho, 0.6, true);
	task_foot3 = Task_PlaySe_("SE_FLD_011", 5);
	
	Wait_(33);
	DeleteTask_(task_nocho);
	DeleteTask_(task_foot3);
	
	SetMotion_(player, MOT_WAIT, BLEND_N);
	SetPointPos_(player, "player001");
	
	task_nocho = Task_AnimeMove_(nocho, "anm_nocho000");
	task_foot5 = Task_PlaySe_("SE_FLD_011", 5);
	
	//��������������������������������������
	// ���J�b�g4
	//��������������������������������������
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	
	SetMotion_(player, MOT_WALK, BLEND_N);
	SetMotionSpeed_(player, 0.7);	// ���[�V�������������ɂȂ�
	task_player = Task_RotateToDir_(player, 75, 2.85);
	WaitTask(task_player);
	SetMotion_(player, MOT_WAIT, 12);
	SetMotionSpeed_(player, 1.0);
	
	WaitTask(task_nocho);
	DeleteTask_(task_foot5);
	SetMotion_(nocho, MOT_WAIT, BLEND_M);
	SurpriseDisp(nocho);
	
	Wait_(30);
	
	SetMotion_(nocho, MOT_WALK, BLEND_M);
	task_nocho = Task_RotateToDir_(nocho, -105, ROTATE_DEMO_DEF);
	WaitTask(task_nocho);
	SetMotion_(nocho, nocho_talk_joy_L, BLEND_M);
	Wait_(2);
	
	//===============================================
	// ���`���[�}�b�n
	// �u�V���V���b�I�@��������̂��@�Y��Ă��b�V���I
	// �@�������Ł@�T���Ă������@���������b�V���I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_CHOMACH");
	ShowMsg_("DEMO_220_MSG_070");
	KeyInputWait_();
	
	//-----------------------------------------------
	// ���`���[�}�b�n
	// �u���@�������̂́@�����X�^�[�}�X�^�[�̂��߂�
	// �@���ʂȁ@�v���O�����Ȃ񂾃b�V���I
	//-----------------------------------------------
	ShowMsg_("DEMO_220_MSG_080");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	DeleteTask_(task_foot3);
	SetMotion_(nocho, MOT_WAIT, BLEND_L);								//�ҋ@
	Wait_(10);
	
	//��������������������������������������
	// ���J�b�g5 �`���[�}�b�n
	//��������������������������������������
	SetPointPos_(nocho, "npc_nocho002");
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");			// 200F
	Wait_(10);
	
	SetMotion_(nocho, nocho_think02_L, BLEND_XL);						//�l����
	
	//===============================================
	// ���`���[�}�b�n
	// �u�ӂӂӁc�c���̃v���O�����́@�ǂ�Ȃ��̂���
	// �@�����s�s�ɗ�����@�����Ă��b�V���B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_CHOMACH");
	ShowMsg_("DEMO_220_MSG_090");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	Wait_(15);
	efc_nocho = SetSelectBoneEffectSetOffset_("ef712_01_emo_notice01", nocho, ATTACH_EFFECT1, Vec3(0.0, 0.0, 0.0));		//�C�Â�ef
	SetMotion_(nocho, nocho_arm_folde, BLEND_L);						//�l���遨�r�g��
	WaitMotion(nocho);
	SetMotion_(nocho, nocho_arm_folde_L, BLEND_L);						//�r�g��L
	
	//===============================================
	// ���`���[�}�b�n
	// �u���������΁@���ꂩ��
	// �@���񂽂́@�ǂ��������b�V���H
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_CHOMACH");
	ShowMsg_("DEMO_220_MSG_100");
	KeyInputWait_();
	
	SetMotion_(nocho, MOT_TALK, BLEND_XL);
	WaitMotion(nocho);
	SetMotion_(nocho, MOT_TALKLOOP, BLEND_M);
	
	//-----------------------------------------------
	// ���`���[�}�b�n
	// �u�����@�����̕X���Ɂ@�s������Ȃ�
	// �@���̃K�[�f���̊O�ɏo�ā@���ɉ��b�V���B
	//-----------------------------------------------
	ShowMsg_("DEMO_220_MSG_110");
	KeyInputWait_();
	
	SetMotion_(nocho, nocho_hand_up, BLEND_XL);
	WaitMotion(nocho);
	SetMotion_(nocho, nocho_hand_up_L, BLEND_M);
	
	//-----------------------------------------------
	// ���`���[�}�b�n
	// �u�������@�����Ɂ@�����̕X���֍s����
	// �@�ړ����u�ւ̔����@�������͂����b�V���I
	//-----------------------------------------------
	ShowMsg_("DEMO_220_MSG_120");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(nocho, MOT_WALK, BLEND_M);
	task_nocho = Task_RotateToDir_(nocho, 0, ROTATE_DEMO_DEF);
	WaitTask(task_nocho);
	task_nocho = Task_MoveForward_(nocho, 0.7, true);
	SetMotion_(nocho, nocho_run_L, BLEND_M);
	task_foot4 = Task_PlaySe_("SE_FLD_011", 5)
	
	Wait_(45);
	DeleteTask_(task_foot4);
	
	EndDemo(FADE_COLOR_BLACK);
}
