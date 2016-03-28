//=============================================
//
//		demo203[���������]
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
	local task_cam, task_player, task_hunter, task_foot;
	local efc_player, efc_hunter;
	local flg_select_no = false;			// �u�������v��I�񂾂��ǂ����𔻒肷��t���O
	local effect_pos00 = Vec3(1.2, 0.8, 0);	// ���G�t�F�N�g���AEffect1��菭�������ʒu�ɕ\������
	local effect_pos01 = Vec3(0, 2.0, 0);	// ���G�t�F�N�g���AEffect1��菭�������ʒu�ɕ\������

// �����\�[�X�Ǎ�
	// �M�~�b�N
	local model_stone = ReadGimmick_("o_G02_21");	// �Α��i�����j
	local model_door = ReadGimmick_("o_G02_01");	//��
	// �L�����N�^�[
	local player = GetPlayerId_();					// ��l��
	local model_hunter = ReadNpc_("n006");			// �`���[�}�b�n
	// �G�t�F�N�g
	LoadEffect_("ef712_10_emo_surprise01");			// �u�I�v
	LoadEffect_("ef712_13_emo_sweat01");			// ��

// ���z�u
	// �Α��i�����j
	local stone003 = ArrangePointGimmick_("o_G02_21", model_stone, "obj_statue003");
	// ��
	local door000 = ArrangePointGimmick_("o_G02_02", model_door, "obj_door000");
	
	// ��l��
	SetPointPos_(player, "player000");
	// �`���[�}�b�n
	local hunter = ArrangePointNpc_(model_hunter, "npc_hunter000");

// ����풓���[�V�����Ǎ�
	// ��l��
	local player_look_walk_L = ReadMotion_(player, "Player_look_walk_L");		// �����i����������񂷁jL
	local player_look_left_L = ReadMotion_(player, "Player_look_left_L");		// ��������L
	
	// �`���[�}�b�n
	local hunter_show_face = ReadMotion_(hunter, "n002_show_face");				// �h�A�������o��
	local hunter_show_face_L = ReadMotion_(hunter, "n002_show_face_L");			// �h�A�������o��L
	local hunter_run_L = ReadMotion_(hunter, "n001_run_L");						// ����L
	local hunter_hand_up = ReadMotion_(hunter, "n002_hand_up");					// ���������
	local hunter_hand_up_L = ReadMotion_(hunter, "n002_hand_up_L");				// ���������L
	local hunter_talk_joy_L = ReadMotion_(hunter, "n000_talk_joy_L");			// ��b�i���������jL
	local hunter_feel_down = ReadMotion_(hunter, "n000_feel_down");				// ��������
	local hunter_feel_down_L = ReadMotion_(hunter, "n000_feel_down_L");			// ��������L
	local hunter_stand_right_L = ReadMotion_(hunter, "n000_stand_right_L");		// �E������
	local hunter_arm_folde_L = ReadMotion_(hunter, "n000_arm_folde_L");			// �r�g��L
	local hunter_impatience_L = ReadMotion_(hunter, "n002_impatience_L");		// �ł�L
	
// �����[�V�����ݒ�
	SetMotion_(player, player_look_walk_L, BLEND_N);				// �����i����������񂷁jL
	task_player = Task_MoveToPointSetSpeed_(player, "player001", 0.46);

// ���J�����ݒ�
	task_cam = Task_AnimeMoveCamera_("anmeye006", "anmtgt006");		// 120F
	
// �����Ԑݒ�
	SetTime_(START_TIME_ZONE_NIGHT);

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------
	StartDemo(FADE_COLOR_BLACK);
	
	//��������������������������������������
	//�J�b�g�P�@��l���J�����C��
	//��������������������������������������
	PlaySE_("SE_FLD_018");
	SetStepSe_(player, SILENT_STEP_SE);
	Wait_(9);
	
	SetMotion_(player, MOT_WALK, BLEND_XL);
	Wait_(3);
	ResetStepSe_(player);
	
	WaitTask(task_player);
	SetMotion_(player, MOT_WAIT, BLEND_XL);
	
	DeleteTask_(task_cam);
	SetMotion_(hunter, hunter_show_face_L, BLEND_N);				// �h�A�������o��L
	
	//��������������������������������������
	//�J�b�g�Q�@�`���[�}�b�n��������
	//��������������������������������������
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	Wait_(20);
	
	SetMotion_(player, player_look_left_L, BLEND_XL);		// ��������L
	Wait_(15);
	
	// ��l�����E���������^�C�~���O�ŕ\��
	SurpriseDisp(hunter);
	Wait_(60);
	
	efc_hunter = SetSelectBoneEffectSetOffset_("ef712_13_emo_sweat01", hunter, ATTACH_EFFECT1, effect_pos00);		// ��
	
	//��������������������������������������
	//�J�b�g�R�@�`���[�}�b�n�A�b�v
	//��������������������������������������
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	
	//===============================================
	// *�`���[�}�b�n
	// �u�V���V�����I�H
	// �@�����Ă��܂����b�V���I
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_203_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(hunter, hunter_run_L, BLEND_M);			// ����L
	task_hunter = Task_MoveToPointSetSpeed_(hunter, "npc_hunter001", 1.0);
	WaitTask(task_hunter);
	
	// �Y�[���C��
	task_cam = Task_AnimeMoveCamera_("anmeye010", "anmtgt010");		// 60F
	WaitTask(task_cam);
	
	DeleteTask_(task_hunter);
	DeleteEffect_(efc_hunter);
	
	SetMotion_(hunter, hunter_show_face, BLEND_N);		// �h�A�������o��
	Wait_(5);		// �m�`���[���`�����h�~
	SetPointPos_(hunter, "npc_hunter000");
	WaitMotion(hunter);
	SetMotion_(hunter, hunter_show_face_L, BLEND_M);
	
	//===============================================
	// *�`���[�}�b�n
	// �u�Ђ���Ƃ��āc�c�l�ԁI�H
	// �@���������ā@<name_player/>���b�V���I�H
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_203_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	//��������������������������������������
	//�J�b�g�S�@��l���J�����C��
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye007", "anmtgt007");		// 70F
	
	SetMotion_(hunter, MOT_WALK, BLEND_M);
	task_hunter = Task_RotateToDir_(hunter, 90, ROTATE_DEMO_DEF/2);
	WaitTask(task_hunter);
	
	task_hunter = Task_MoveToPointSetSpeed_(hunter, "npc_hunter002", 0.5);
	WaitTask(task_hunter);
	SetMotion_(hunter, MOT_WAIT, BLEND_M);
	
	SetPointPos_(player, "player002");
	SetMotion_(player, MOT_WALK, BLEND_N);
	task_player = Task_MoveToPointSetSpeed_(player, "player003", 0.5);
	WaitTask(task_player);
	SetMotion_(player, MOT_WAIT, BLEND_M);
	
	SetMotion_(hunter, hunter_talk_joy_L, BLEND_L);		// ��b�i���������jL
	
	//===============================================
	// *�`���[�}�b�n
	// �u�I�}�G�̂��Ƃ́@���A�N�^�[�ʐM��
	// �@�G�[�X����@�����Ă�b�V���I
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_203_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	DeleteTask_(task_cam);
	SetAlpha_(player, ALPHA_CLEAR);
	
	//��������������������������������������
	//�J�b�g�T�@�`���[�}�b�n�Y�[���C��
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye008", "anmtgt008");		// 180F
	
	SetMotion_(hunter, hunter_hand_up, BLEND_N);		// ���������
	WaitMotion(hunter);
	SetMotion_(hunter, hunter_hand_up_L, BLEND_M);		// ���������L
	
	//===============================================
	// *�`���[�}�b�n
	// �u�I���̓`���[�}�b�n�I�@�D���ȕ��́@�������I
	// �@�����ȕ��́@�����������b�V���I
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_203_MSG_040");
	KeyInputWait_();
	
	SetMotion_(hunter, MOT_TALKLOOP, BLEND_L);
	
	//-----------------------------------------------
	// ���`���[�}�b�n
	// �u�I���́@���W�X�^���X���@���A�N�^�[�Ɏc����
	// �@�`���̃v���O������T���ā@�����ɗ����b�V���B
	//-----------------------------------------------
	SetTalkName_("NAME_TAG_CHOMACH");
	ShowMsg_("DEMO_203_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	DeleteTask_(task_cam);
	SetAlpha_(player, ALPHA_EXIST);
	
	//��������������������������������������
	//�J�b�g�U�@�`���[�}�b�n�Ǝ�l��
	//��������������������������������������
	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");
	
	SetMotion_(hunter, hunter_feel_down, BLEND_M);		// ��������
	WaitMotion(hunter);
	SetMotion_(hunter, hunter_feel_down_L, BLEND_M);	// ��������L
	
	//===============================================
	// ���`���[�}�b�n
	// �u�ł��@���A�N�^�[�́@�u���h���h���ЂƂ肶�߁I
	// �@�I���Ƃ������Ƃ��@�o�x�ꂽ�b�V���c�c�B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_CHOMACH");
	ShowMsg_("DEMO_203_MSG_060");
	KeyInputWait_();
	
	SetMotion_(hunter, MOT_TALKLOOP, BLEND_L);
	
	//-----------------------------------------------
	// ��
	// �u�Ȃ��@<name_player/>�B
	// �@�u���h���h��|���Ɂ@�����񂾃b�V���H
	//-----------------------------------------------
	ShowMsg_("DEMO_203_MSG_070");
	KeyInputWait_();
	
	//2������
	//-----------------------------------------------
	// ��
	// �u�������@�u���h���h���@�|���Ă����Ȃ�
	// �@���̃K�[�f���́@�q�~�c�������Ă��b�V���I
	//-----------------------------------------------
	ShowMsg_("DEMO_203_MSG_080");
	KeyInputWait_();
	
	while(true)
	{
		// �y�͂��̏ꍇ�z
		if (GetQueryResult_() == QUERY2_0) {
			SetMotion_(hunter, hunter_talk_joy_L, BLEND_L);		// ��b�i���������jL
			
			//-----------------------------------------------
			// ��
			// �u���ށI�@����Ă���邩�b�V���I
			// �@������΂��肾���ǁ@�M���Ă��b�V���I
			//-----------------------------------------------
			ShowMsg_("DEMO_203_MSG_090");
			KeyInputWait_();
			
			break;
		}
		// �y�������̏ꍇ�z
		else {
			//-----------------------------------------------
			// ��
			// �u���΂₭�@�f��ꂽ�b�V���I
			// �@����@����Ȃ��ƌ��킸�Ɂ@���ރb�V���I
			//-----------------------------------------------
			ShowMsg_("DEMO_203_MSG_085");
			KeyInputWait_();
		}
	}
	
	SetMotion_(hunter, MOT_TALKLOOP, BLEND_L);
	
	//-----------------------------------------------
	// ���`���[�}�b�n
	// �u���ꂶ��@�܂��@���̐Α�������b�V���I
	// �@���ꂪ�@�K�[�f���̂������́@�L�����b�V���I
	//-----------------------------------------------
	ShowMsg_("DEMO_203_MSG_100");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(hunter, MOT_WALK, BLEND_L);
	task_hunter = Task_RotateToDir_(hunter, 45, ROTATE_DEMO_DEF/2);
	WaitTask(task_hunter);
	
	SetMotion_(hunter, hunter_stand_right_L, BLEND_XL);		// �E������L
	Wait_(10);
	
	SetMotion_(player, player_look_left_L, BLEND_XL);		// ��������L
	Wait_(45);
	
	SetAlpha_(player, ALPHA_CLEAR);
	SetMotion_(hunter, MOT_WAIT, BLEND_N);
	SetDir_(hunter, 90);
	
	//��������������������������������������
	//�J�b�g�V�@�Α��i����j�Y�[��
	//��������������������������������������
	SetPointCameraEye_("cameye003");
	SetPointCameraTarget_("camtgt003");
	Wait_(30);
	
	// �Y�[���A�E�g
	task_cam = Task_AnimeMoveCamera_("anmeye009", "anmtgt009");		// 150F
	
	WaitTask(task_cam);
	Wait_(40);
	
	//��������������������������������������
	//�J�b�g�W�@�`���[�}�b�n�Y�[���C��
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye008", "anmtgt008");		// 180F
	
	SetMotion_(hunter, MOT_TALKLOOP, BLEND_N);
	
	//===============================================
	// ���`���[�}�b�n
	// �u���̐Α��c�c���́@��������b�V���B
	// �@�����������@�������Ă�̂��@�����b�V���I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_CHOMACH");
	ShowMsg_("DEMO_203_MSG_110");
	KeyInputWait_();
	//-----------------------------------------------
	
	SetMotion_(hunter, hunter_arm_folde_L, BLEND_XL);	// �r�g��L
	
	//-----------------------------------------------
	// ��
	// �u���̐Α����@�����������ւƁ@��������
	// �@�ǂ����@�B�������@�J���悤�Ȃ񂾃b�V���B
	//-----------------------------------------------
	ShowMsg_("DEMO_203_MSG_113");
	KeyInputWait_();
	
	SetMotion_(hunter, hunter_hand_up, BLEND_M);		// ���������
	task_hunter = Task_ChangeMotion_(hunter, hunter_hand_up_L, BLEND_M);
	
	//-----------------------------------------------
	// ��
	// �u�����I�@�K�[�f���̂��������@������
	// �@�u���h���h�̌��Ɂ@��荞�ރb�V���I
	//-----------------------------------------------
	ShowMsg_("DEMO_203_MSG_120");
	KeyInputWait_();
	
	//-----------------------------------------------
	// ��
	// �u�I�����@������Ɂ@���͂��邩��
	// �@����΂��Ă���V���I
	//-----------------------------------------------
	ShowMsg_("DEMO_203_MSG_125");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	EndDemo(FADE_COLOR_BLACK);
}
