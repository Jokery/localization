//=============================================
//
//		demo527[�W���[�J�[�v��]
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
	local task_cam, task_player, task_rena, task_birdy;
	local efc_player, efc_rena, efc_birdy, efc_cam;

// ���t���O�ݒ�
	local bit_ruler = GetEventFlg_("BFG_RULER_ADD_023");	// Bit_223  ���[���ǉ��t���O �ŔM�̉ΎR�@�閧��n�@�n���{��
	
// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();						// ��l��
	local model_rena = ReadNpc_("n007");				// ���i�[�e
	local model_birdy = ReadNpc_("n019");				// �o�[�f�B
	local model_boy = ReadNpc_("n040"); 				// ���ǂ���l��
	
	// �M�~�b�N
	local model_cold = ReadGimmick_("o_V02_10");			// �R�[���h�X���[�v���u
	local model_cpu = ReadGimmick_("o_V02_11");				// �R���s���[�^�̖���
	local model_cold_player = ReadGimmick_("o_V02_12");		// �R�[���h�X���[�v_��l��
	local model_light = ReadGimmick_("o_V02_13");			// �R�[���h�X���[�v����
	local model_ruler = ReadGimmick_("o_com_08");			// ���[���|�C���g
	local model_door = ReadGimmick_("o_V02_09");			// ��
	local model_door01 = ReadGimmick_("o_V02_02");			// �G���x�[�^�[��

	// �G�t�F�N�g�ݒ�
	LoadEffect_("ef712_13_emo_sweat01")		;				// ��

// ���z�u
	// ��l��
	SetPointPos_(player, "player000");										// ��l��
	
	local rena = ArrangePointNpc_(model_rena, "npc_renerte000");			// ���i�[�e
	
	local birdy = ArrangePointNpc_(model_birdy, "npc_birdy000");			// �o�[�f�B
	SetScaleSilhouette(birdy, SCALE.N, SILHOUETTE_WIDTH.N);					// �T�C�YN
	
	local boy = ArrangePointNpc_(model_boy, "npc_boy000");					// ���ǂ���l���i�R�[���h�X���[�v�̒��ɔz�u�j
	
	//�M�~�b�N
	local cold_player = ArrangePointGimmick_("o_V02_10", model_cold_player, "obj_cold_player000");		//�R�[���h�X���[�v��l��
	
	local cold_cpu = ArrangePointGimmick_("o_V02_11", model_cpu, "obj_cpu000");					//�R���s���[�^�̖���
	local cold_light = ArrangePointGimmick_("o_V02_13", model_light, "obj_light000");			//�R�[���h�X���[�v����

	// ���[���|�C���g
	local ruler = ArrangePointGimmick_("o_com_08", model_ruler, "obj_ruler000");
	// �����[���|�C���g�����ɋN�����Ă����ꍇ
	if (bit_ruler) { SetMotion_(ruler, MOT_GIMMICK_2, BLEND_N); }
	
	// ��
	local door = ArrangePointGimmick_("o_V02_09", model_door, "obj_door000");
	// �G���x�[�^�[��
	local door01 = ArrangePointGimmick_("o_V02_02", model_door01, "obj_door001");
	SetMotion_(door01, MOT_GIMMICK_0, BLEND_N);			// ����
	
// ����풓���[�V�����Ǎ�
	//��l��
	local player_caution01 = ReadMotion_(player, "Player_caution01_L");				// �x��
	local player_look_right = ReadMotion_(player, "Player_look_right_L");			// �E������
	
	//���i�[�e
	local rena_right = ReadMotion_(rena, "n007_look_right_L");						// �E������
	local rena_left = ReadMotion_(rena, "n007_look_left_L");						// ��������
	local rena_look_up_L = ReadMotion_(rena, "n007_look_up_L");						// ���i�[�e������ҋ@
	local rena_talk = ReadMotion_(rena, "n007_talk01");								// ��b�J�n�i������ɂ��Ă�j
	local rena_talk_L = ReadMotion_(rena, "n007_talk01_L");							// ��bL�i������ɂ��Ă�j
	local rena_turn_left = ReadMotion_(rena, "n007_turn_left");						// �ҋ@���U��Ԃ�i�������j
	local rena_turn_left_L = ReadMotion_(rena, "n007_turn_left_L");					// �U��Ԃ�L�i�������j
	local rena_run_L = ReadMotion_(rena, "n007_run_L");								// ����L
	local rena_look_down = ReadMotion_(rena, "n007_look_down_L");					// ���ނ��ҋ@
	local rena_look_up = ReadMotion_(rena, "n007_look_up_L");					// ���ނ��ҋ@

	//�o�[�f�B
	local birdy_idol = ReadMotion_(birdy, "n019_idol");								// �ҋ@L
	local birdy_talk = ReadMotion_(birdy, "n019_talk");								// �b��
	
	//���ǂ���l��
	local boy_sleep = ReadMotion_(boy, "n010_cold_sleep_L");						// �R�[���h�X���[�v�p���[�V����
	SetMotion_(boy, boy_sleep, BLEND_N);
	SetFace_(boy, "Face_loop_close02");

// ���������[�V����
	SetMotion_(birdy, birdy_idol, BLEND_N);											//���@�ҋ@
	SetMotion_(rena, rena_look_down, BLEND_N);										//���i�@���ނ��ҋ@
	SetFace_(rena, "Face_loop_close");												//�ڕ�
	
//����
	SetStepSe_(rena, "SE_FLD_016");
	
// ���J�����ݒ�
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	//��������������������������������������
	//���J�b�g1 ��@���i�@��
	//��������������������������������������
	
	//===============================================
	//*���i�[�e
	// 	�u�ł��c�c���ǃA���Z�X�́@�߂�Ȃ������B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_527_MSG_010");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	//*���i�[�e
	// 	�u�u���C�N�����X�^�[��|���@�}�f�ɉ������ꂽ
	//-----------------------------------------------
	ShowMsg_("DEMO_527_MSG_020");
	KeyInputWait_();
	//===============================================
	
	SetMotion_(rena, rena_look_up, BLEND_XL);										//���i�@�ҋ@
	SetFace_(rena, "Face_default");												//�ڊJ��

	//===============================================
	//*���i�[�e
	// 	�u������@�������́@�A���Z�X�̈�u���p������
	//-----------------------------------------------
	ShowMsg_("DEMO_527_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	WaitTask(task_cam); 
	
	//��������������������������������������
	//���J�b�g2 ���i�ɃY�[���C��
	//��������������������������������������
	SetPointPos_(player, "player001");										// ��l���ړ�

	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	
	SetMotion_(rena, rena_turn_left, BLEND_L);									//���i�[�e�U�����
	Wait_(10);	
	SetFace_(rena, "Face_left");
	WaitMotion(rena);
	SetMotion_(rena, rena_turn_left_L, BLEND_L);

	//===============================================
	//*���i�[�e
	// 	�u����΁@�s���g�̃A���Z�X���@���o���v���B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_527_MSG_040");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	//*���i�[�e
	// 	�u�ł��@���̃W���[�J�[�v��ɂ�
	//-----------------------------------------------
	ShowMsg_("DEMO_527_MSG_050");
	KeyInputWait_();
	//===============================================


	//===============================================
	//*���i�[�e
	// 	�u�A���Z�X�̃`�J�����@�g�����Ȃ���҂�
	//-----------------------------------------------
	ShowMsg_("DEMO_527_MSG_060");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	WaitTask(task_cam);
	Wait_(10);
	
	//��������������������������������������
	//���J�b�g3 ���ǂ���l��
	//��������������������������������������
	SetPointPos_(player, "player000");										// ��l���ړ�

	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");
	Wait_(30);
	//===============================================
	//*���i�[�e
	// 	�u���̎�����m�����@���Ȃ��́@��������
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_527_MSG_070");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================	
	WaitTask(task_cam);
	Wait_(30);

	//��������������������������������������
	//���J�b�g4 ��l���ɃY�[���C��
	//��������������������������������������
	SetVisible(rena, false);												// ���i�@��\��
	SetVisible(birdy, false);												// ���@��\��

	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");

	//===============================================
	//*���i�[�e
	// 	�u�����c�c���Ă̂��Ȃ��́@�����̈ӎu��
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_527_MSG_080");
	KeyInputWait_();
	//===============================================
	

	//===============================================
	//*���i�[�e
	// 	�u�ł�����x�@���Ȃ����g�őI�Ԃׂ��c�c�B
	//-----------------------------------------------
	ShowMsg_("DEMO_527_MSG_090");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================	
	WaitTask(task_cam);
	Wait_(20);	
	//��������������������������������������
	//���J�b�g5 ��@���i�@��
	//��������������������������������������
	SetVisible(rena, true);													// ���i�@�\��
	SetVisible(birdy, true);												// ���@�\��

	SetDirToObject_(rena, player);
	SetMotion_(rena, MOT_WAIT, BLEND_N);									//���i�[�e�ҋ@
	
	SetMotionSpeed_(birdy, 2.0);											// ���[�V�������߂�
	SetMotion_(birdy, birdy_talk, BLEND_N);									//�o�[�f�B�b��
	
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

	efc_birdy = SetSelectBoneEffectSetOffset_("ef712_13_emo_sweat01", birdy, ATTACH_EFFECT1, Vec3(0.0, 2.0, 0.0));	//���G�t�F�N�g
	SetEffectScale_(efc_birdy, 2.0);
	
	//===============================================
	//*�o�[�f�B
	// 	�u�z���b�c�I�H�@�ł����i�[�e�I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BIRDY");
	ShowMsg_("DEMO_527_MSG_100");
	
	SetMotion_(rena, rena_left, BLEND_L);									//���i�[�e�@��������
	SetMotion_(player, player_look_right, BLEND_L);							//��l���@�E������
	
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	
	//===============================================
	//*���i�[�e
	// 	�u�u���C�N�����X�^�[�̌��c�c�}�f�ɉ������ꂽ
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_527_MSG_110");
	
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	Wait_(20);
	DeleteEffect_(efc_birdy); 
	//��������������������������������������
	//���J�b�g6 ���i�@�A�b�v
	//��������������������������������������
	SetPointPos_(player, "player001");										// ��l���ړ�
	SetDirToObject_(rena, player);
	SetVisible(player, false);												// ��@��\��
	
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	SetFace_(rena, "Face_eyes_close");	
	SetMotion_(rena, MOT_WAIT, BLEND_XL);									//���i�[�e�@�ҋ@
	Wait_(20);
	SetMotion_(rena, rena_talk, BLEND_L);									//���i�[�e�@�b��
	WaitMotion(rena);
	SetMotion_(rena, rena_talk_L, BLEND_L);									//���i�[�e�@�b��

	//===============================================
	//*���i�[�e
	// 	�u������@���߂�̂́c�c�ނ�B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_527_MSG_120");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	//*���i�[�e
	// 	�u�u���́@���̕����ɂ���c�c�B
	//-----------------------------------------------
	ShowMsg_("DEMO_527_MSG_130");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	SetMotion_(rena, MOT_WAIT, BLEND_XL);									//���i�[�e�@�ҋ@
	Wait_(20);
	
	task_rena = Task_WalkAroundToDir(rena, 200, 5.7);
	WaitTask(task_rena);
	task_rena = Task_MoveForward_(rena, 1.0, false);

	Wait_(60);
	
	EndDemo(FADE_COLOR_BLACK);
}
