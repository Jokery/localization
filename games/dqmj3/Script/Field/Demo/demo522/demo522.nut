//=============================================
//
//		demo522[�G�C���A�X]
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
	local task_cam, task_player, task_burdy, task_rena, task_darkmaster, task_prometheus;
	local efc_player, efc_burdy, efc_rena, efc_prometheus;
	local efc_cam;
	
// ���t���O�ݒ�
	local bit_ruler = GetEventFlg_("BFG_RULER_ADD_023");	// Bit_223  ���[���ǉ��t���O �ŔM�̉ΎR�@�閧��n�@�n���{��
	
// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();							// ��l��
	local model_burdy = ReadNpc_("n019");					// �o�[�f�B
	local model_boy = ReadNpc_("n040"); 					// ���ǂ���l��
	local model_rena = ReadNpc_("n007");					// ���i�[�e
	local model_darkmaster = ReadNpc_("n008");				// �_�[�N�}�X�^�[
	local model_prometheus = ReadNpc_("m190_00");			// �v�����e�E�X
	// �M�~�b�N
	local model_cold = ReadGimmick_("o_V02_10");			// �R�[���h�X���[�v���u
	local model_cpu = ReadGimmick_("o_V02_11");				// �R���s���[�^�̖���
	local model_light = ReadGimmick_("o_V02_13");			// �R�[���h�X���[�v����
	local model_coldsleep = ReadGimmick_("o_V02_12");		// �R�[���h�X���[�v(��l���p)
	local model_ruler = ReadGimmick_("o_com_08");			// ���[���|�C���g
	local model_door = ReadGimmick_("o_V02_09");			// ��
	local model_door01 = ReadGimmick_("o_V02_02");			// �G���x�[�^�[��
	// �G�t�F�N�g
	LoadEffect_("ef712_10_emo_surprise01");					// �u�I�v
	LoadEffect_("ef733_01_sym_shuchusen01");				// �W����
	LoadEffect_("ef730_01_oth_dark_aura01");				// �I�[��

// ���z�u
	// ��l��
	SetPointPos_(player, "player000");
	// �o�[�f�B
	local burdy = ArrangePointNpc_(model_burdy, "npc_burdy000");
	SetScaleSilhouette(burdy, SCALE.N, SILHOUETTE_WIDTH.N);
	// ���i�[�e
	local rena = ArrangePointNpc_(model_rena, "npc_rena000");
	SetVisible(rena, false);
	// �_�[�N�}�X�^�[
	local darkmaster = ArrangePointNpc_(model_darkmaster, "npc_darkmaster000");
	SetVisible(darkmaster, false);
	// �v�����e�E�X
	local prometheus = ArrangePointNpc_(model_prometheus, "npc_prometheus000");
	SetVisible(prometheus, false);
	// ���ǂ���l���i�R�[���h�X���[�v�̒��ɔz�u�j
	local boy = ArrangePointNpc_(model_boy, "npc_boy000");
	// �R�[���h�X���[�v(��l���p)
	local coldsleep = ArrangePointGimmick_("o_V02_12", model_coldsleep, "obj_coldsleep000");
	// �R���s���[�^�̖���
	local cold_cpu = ArrangePointGimmick_("o_V02_11", model_cpu, "obj_cpu000");
	// �R�[���h�X���[�v����
	local cold_light = ArrangePointGimmick_("o_V02_13", model_light, "obj_light000");
	SetMotion_(cold_light, MOT_GIMMICK_0, BLEND_N);			// �ʏ���
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
	// ��l��
	local player_look_walk_L = ReadMotion_(player, "Player_look_walk_L");			// �����i����������񂷁jL
	local player_look_up_L = ReadMotion_(player, "Player_look_up_L");				// ������ҋ@L
	local player_surprise = ReadMotion_(player, "Player_surprise");					// ����
	local player_surprise_L = ReadMotion_(player, "Player_surprise_L");				// ����L
	local player_caution01 = ReadMotion_(player, "Player_caution01_L");				// �x��L
	//���i�[�e
	local rena_turn_left = ReadMotion_(rena, "n007_turn_left");						// �ҋ@���U��Ԃ�i�������j
	local rena_turn_left_L = ReadMotion_(rena, "n007_turn_left_L");					// �U��Ԃ�L�i�������j
	local rena_caution = ReadMotion_(rena, "n007_caution_L");						// �x��L
	//�o�[�f�B
	local burdy_idol = ReadMotion_(burdy, "n019_idol");								// �ҋ@
	local burdy_run_L = ReadMotion_(burdy, "n019_run_L");							// ����L
	local burdy_talk = ReadMotion_(burdy, "n019_talk");								// ��b
	local burdy_why = ReadMotion_(burdy, "n019_why");								// �����������
	local burdy_look_around = ReadMotion_(burdy, "n019_look_around_L");				// ���n��L
	
	//�_�[�N�}�X�^�[
	local darkmaster_laugh_L = ReadMotion_(darkmaster, "n008_laugh_L");				// �΂�L
	local darkmaster_summon = ReadMotion_(darkmaster, "n008_summon");				// �ҋ@�������X�^�[����
	local darkmaster_summon_L = ReadMotion_(darkmaster, "n008_summon_L");			// �����X�^�[����L
	//���ǂ���l��
	local boy_sleep = ReadMotion_(boy, "n010_cold_sleep_L");						// �R�[���h�X���[�v�p���[�V����

	SetStepSe_(darkmaster,"SE_FLD_016");
	SetStepSe_(burdy,"SE_FLD_032");
	SetStepSePan_(rena, false);
	SetStepSePan_(darkmaster, false);
	SetStepSePan_(burdy, false);

// ���������[�V�����ݒ�
	SetMotion_(player, player_look_up_L, BLEND_XL);			// ��l���@������ҋ@L
	SetMotion_(burdy, burdy_look_around, BLEND_N);			// �o�[�f�B�@���n��
	SetMotion_(rena, MOT_WAIT, BLEND_N);					// ���i�[�e�@�ҋ@
	SetMotion_(boy, boy_sleep, BLEND_N);					// ���ǂ���l���@�R�[���h�X���[�v�p���[�V����
	SetFace_(boy, "Face_loop_close02");						// ���ǂ���l���@�ڕ�


	//��������������������������������������
	//���J�b�g1�@��l���ƃo�[�f�B
	//��������������������������������������

// ���J�����ݒ�
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------
	StartDemo(FADE_COLOR_BLACK);
	Wait_(15);
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	Wait_(75);
	//===============================================
	//���o�[�f�B
	//�u�Ȃ񂾂��@�z���[�ȕ����f�[�X�B
	//�@�~�[�́@������ƃR�������������}�[�X�B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BIRDY");
	ShowMsg_("DEMO_522_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	Wait_(30);
	
	DeleteTask_(task_cam);
	SetMotion_(player, MOT_WAIT, BLEND_N);					// ��l���@�ҋ@

	//��������������������������������������
	//���J�b�g2-1�@�o�[�f�B�A�b�v
	//��������������������������������������
	SetPointPos_(burdy, "npc_burdy004");
	task_cam = Task_AnimeMoveCamera_("anmeye010", "anmtgt010");
	DeleteTask_(task_cam);
	Wait_(50);
	task_cam = Task_AnimeMoveCamera_("anmeye010", "anmtgt010");
	Wait_(30);
	PlaySE_("SE_DEM_026");	// ��SE:�W����
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", CAMERA_DEF);// �W����
	Wait_(10);
	DeleteEffectEmitter_(efc_cam);
	WaitTask(task_cam);
	//===============================================
	//���o�[�f�B
	//�u���c�c����́I�H
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BIRDY");
	ShowMsg_("DEMO_522_MSG_013");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	Wait_(10);
	
	//��������������������������������������
	//���J�b�g2-2 �����@�J�v�Z�������񂷃V�[��
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	WaitTask(task_cam);
	Wait_(30);
	
	//������������������������������������
	//���J�b�g2-3 �A���Z�X4�̂�������
	//������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye001-2", "anmtgt001-2");
	WaitTask(task_cam);
	//===============================================
	//���o�[�f�B
	//�u�A�c�c�A���Z�X���c�c��������c�c�H
	//�@����́c�c�ǂ��������ƃf�[�X�I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BIRDY");
	ShowMsg_("DEMO_522_MSG_015");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(10);
	
	//������������������������������������
	//���J�b�g2-4 �Ⓚ�A���Z�X�A�b�v
	//������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye001-3", "anmtgt001-3");
	WaitTask(task_cam);
	Wait_(20);
	
	SetPointPos_(burdy, "npc_burdy000");
	//��������������������������������������
	//���J�b�g3�@���ǂ���l���@�J�����o�`�m�t�o
	//��������������������������������������

	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");

	Wait_(250);

	DeleteTask_(task_cam);

	//��������������������������������������
	//���J�b�g4�@��l���{�o�[�f�B�{���ǂ���l���@���聨�������U������@������
	//��������������������������������������

	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");

	SetMotion_(player, MOT_RUN, BLEND_N);					// ��l���@����
	
	local task_burdy_step = Task_PlaySe_("SE_FLD_032", 7);							//�o�[�f�B����
	
	SetMotion_(burdy, burdy_run_L, BLEND_N);				// �o�[�f�B�@����L
	task_player = Task_AnimeMove_(player, "anm_player002");
	task_burdy = Task_AnimeMove_(burdy, "anm_burdy000");
	Wait_(22);
	SetMotion_(player, player_look_up_L, BLEND_L);			// ��l���@������ҋ@L
	DeleteTask_(task_player);
	Wait_(6);
	
	DeleteTask_(task_burdy_step);
	
	SetMotion_(burdy, burdy_idol, 12);						// �o�[�f�B�@�ҋ@
	Wait_(2);
	DeleteTask_(task_burdy);
	task_burdy = Task_RotateToDir_(burdy, 135, 4);
	Wait_(12);
	DeleteTask_(task_burdy);
	SetMotion_(burdy, burdy_talk, 12);

	//===============================================
	//���o�[�f�B
	//�u�z���b�c�I�H�@���c�c���̃{�[�C�I
	//�@�~�[�́@���̃{�[�C�̂��Ɓ@�m���ă}�[�X�I�@��
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BIRDY");
	ShowMsg_("DEMO_522_MSG_040");
	KeyInputWait_();
	//===============================================

	//===============================================
	//���o�[�f�B
	//�u���̃{�[�C�́@�A���Z�X�̒�f�[�X�I
	//�@���O�́@�������c�c�B
	//-----------------------------------------------
	ShowMsg_("DEMO_522_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(burdy, burdy_idol, 24);						// �o�[�f�B�@�ҋ@
	Wait_(10);

	//===============================================
	//*���i�[�e
	//�u�悭�@���Ă��ꂽ��ˁc�c�B
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_522_MSG_060");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	local posplayer = Vec3(0, 1.70, 0);
	local posburdy = Vec3(0, 4, 1);
	local id3 = SetSelectBoneEffectSetOffset_("ef712_10_emo_surprise01", player, ATTACH_EFFECT1, posplayer);	// �u�I�v
	efc_burdy = SurpriseDispSetOffset(burdy, posburdy, 2.4);
	Wait_(30);
	SetMotion_(player, MOT_WALK, BLEND_L);					// ��l���@����
	task_player = Task_RotateToDir_(player, 300, 6);
	
	PlaySE_("SE_FLD_016");									//��l���̑���

	SetMotion_(burdy, MOT_WALK, BLEND_L);					// �o�[�f�B�@����
	task_burdy = Task_RotateToDir_(burdy, 270, 6);
	WaitTask(task_burdy);
	SetMotion_(burdy, burdy_idol, BLEND_L);					// �o�[�f�B�@�ҋ@
	WaitTask(task_player);
	SetMotion_(player, MOT_WAIT, BLEND_L);					// ��l���@�ҋ@
	DeleteTask_(task_player);
	DeleteTask_(task_burdy);
	Wait_(15);


	//��������������������������������������
	//���J�b�g5�@���i�[�e�@�ҋ@�������@�Y�[���C��
	//��������������������������������������

	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");

	SetVisible(rena, true);
	PlaySE_("SE_DEM_026");	// ��SE:�W����
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", CAMERA_DEF);// �W����
	Wait_(8);
	DeleteEffectEmitter_(efc_cam);
	DeleteTask_(task_cam);

	//===============================================
	//���o�[�f�B
	//�u���i�[�e�I�H
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BIRDY");
	ShowMsg_("DEMO_522_MSG_070");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	Wait_(5);
	SetStepSe_(rena, SILENT_STEP_SE);	// ������ �����ɂ���
	local task_rena_step = Task_ChangeStepSe(rena, "SE_FLD_016", 15);							//���i�[�e����

	SetMotion_(rena, MOT_WALK, BLEND_L);
	task_rena = Task_AnimeMove_(rena, "anm_rena000");
	Wait_(15);


	//��������������������������������������
	//���J�b�g6�@���i�[�e�{��l���{�o�[�f�B�@�������ҋ@�@�N�H�[�^�[�r���[�Ń��i�[�e�ǔ�
	//��������������������������������������

	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");

	SetMotionSpeed_(rena, 1.35);
	SetPointPos_(player, "player001");
	SetPointPos_(burdy, "npc_burdy001");
	Wait_(100);
	SetMotion_(burdy, MOT_WALK, BLEND_L);					// �o�[�f�B�@����
	task_burdy = Task_RotateToDir_(burdy, 105, 3);
	Wait_(5);
	SetMotion_(player, MOT_WALK, BLEND_L);					// ��l���@����
	task_player = Task_RotateToDir_(player, 75, 3);
	Wait_(52);
	SetMotion_(burdy, burdy_idol, BLEND_L);					// �o�[�f�B�@�ҋ@
	Wait_(1);
	SetMotion_(player, MOT_WAIT, BLEND_L);					// ��l���@�ҋ@
	Wait_(16);
	SetMotion_(rena, MOT_WAIT, BLEND_XL);					// ���i�[�e�@�ҋ@
	SetMotionSpeed_(rena, 1.0);
	Wait_(5);
	DeleteTask_(task_rena_step);
	SetStepSe_(rena,"SE_FLD_016");
	Wait_(25);
	DeleteTask_(task_cam);
	DeleteTask_(task_player);
	DeleteTask_(task_burdy);
	DeleteTask_(task_rena);

	//===============================================
	//�����i�[�e
	//�u���̎q�����@���W�X�^���X�̐؂�D�B
	//�@�����ā@�������ׂ����́c�c�B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_522_MSG_080");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(rena, rena_turn_left, BLEND_XL);				// ���i�[�e�@�ҋ@���U��Ԃ�i�������j
	SetMotionSpeed_(rena, 0.6);
	Wait_(24);
	SetMotion_(rena, rena_turn_left_L, BLEND_L);			// ���i�[�e�@�U��Ԃ�L�i�������j
	SetMotionSpeed_(rena, 1.0);
	Wait_(30);
	task_player = Task_MoveForward_(player, 0.8, false);
	SetMotion_(player, MOT_WALK, BLEND_XL);
	Wait_(24);
	SetMotion_(player, MOT_WAIT, BLEND_N);					// ��l���@�ҋ@
	DeleteTask_(task_player);


	//��������������������������������������
	//���J�b�g7�@���i�[�e�{���ǂ���l���@��b�@���
	//��������������������������������������

	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");

	SetVisible(player, false);
	Wait_(5);

	//===============================================
	//�����i�[�e
	//�u���āc�c<name_player/>�B
	//�@���ꂪ���Ȃ��c�c�{���̂��Ȃ���B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_522_MSG_090");
	KeyInputWait_();
	CloseMsgWnd_();	
	//===============================================

	task_cam = Task_AnimeMoveCamera_("anmeye005", "anmtgt005");
	WaitTask(task_cam);
	DeleteTask_(task_cam);
	Wait_(60);


	//��������������������������������������
	//���J�b�g8�@��l���@�����@�o�X�g�A�b�v
	//��������������������������������������

	SetPointCameraEye_("cameye003");
	SetPointCameraTarget_("camtgt003");

	SetVisible(player, true);
	SetVisible(burdy, false);
	SetPointPos_(player, "player002");
	posplayer = Vec3(0.5, 1.35, -1.0);
	efc_player = SurpriseDispSetOffset(player, posplayer, 0.55);
	SetMotion_(player, player_surprise, BLEND_M);			// ��l���@����
	WaitMotion(player);
	SetMotion_(player, player_surprise_L, BLEND_M);			// ��l���@����L
	Wait_(15);

	//===============================================
	//�����i�[�e
	//�u���̂��Ȃ��́@�G�C���A�X�c�c
	//�@�S���Ȃ����@�A���Z�X��͂����R�s�[�B�@��
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_522_MSG_100");
	KeyInputWait_();
	//===============================================


	//��������������������������������������
	//���J�b�g9�@��l���{���i�[�e�{�o�[�f�B�@��b�@���Ձ����Y�[���A�E�g
	//��������������������������������������

	task_cam = Task_AnimeMoveCamera_("anmeye006", "anmtgt006");

	SetVisible(burdy, true);
	SetPointPos_(rena, "npc_rena001");
	SetDir_(player, 15);
	SetDir_(rena, 210);
	SetMotion_(player, MOT_WAIT, BLEND_N);					// ��l���@�ҋ@
	SetMotion_(rena, MOT_TALKLOOP, BLEND_N);				// ���i�[�e�@��bL

	//===============================================
	//�����i�[�e
	//�u���̋@�B�Ɓ@�{���̂��Ȃ��̈ӎ�����
	//�@���ݏo���ꂽ�@���肻�߂̐g�̂Ȃ́B
	//-----------------------------------------------
	ShowMsg_("DEMO_522_MSG_110");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(15);
	DeleteTask_(task_cam);


	//��������������������������������������
	//���J�b�g10�@��l���{���i�[�e�{�o�[�f�B�@�o�[�f�B�񂩂��������i�[�e�������ҋ@�@�N�H�[�^�[�r���[
	//��������������������������������������

	SetPointCameraEye_("cameye004");
	SetPointCameraTarget_("camtgt004");

	SetPointPos_(burdy, "npc_burdy002");
	SetDir_(rena, 200);
	SetMotion_(rena, MOT_WAIT, BLEND_N);					// ���i�[�e�@�ҋ@
	SetMotion_(burdy, burdy_why, BLEND_XL);					// �o�[�f�B�@�����������

	//===============================================
	//���o�[�f�B
	//�u�ǂ��������ƃl�[�H
	//�@���̃A���Z�X�́@�j�Z���m�Ȃ̂ł����[�I�H
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BIRDY");
	ShowMsg_("DEMO_522_MSG_120");
	Wait_(16);
	WaitMotion(burdy);
	SetMotion_(burdy, burdy_idol, BLEND_L);					// �o�[�f�B�@�ҋ@
	KeyInputWait_();
	CloseMsgWnd_();	
	//===============================================

	SetMotion_(rena, rena_turn_left, BLEND_XL);				// ���i�[�e�@�ҋ@���U��Ԃ�i�������j
	SetMotionSpeed_(rena, 0.6);
	Wait_(5);
	task_rena = Task_RotateToDir_(rena, 160, 1.5);
	Wait_(25);
	SetMotion_(rena, rena_turn_left_L, BLEND_L);			// ���i�[�e�@�U��Ԃ�L�i�������j
	SetMotionSpeed_(rena, 1.0);
	Wait_(8);

	//===============================================
	//�����i�[�e
	//�u�I���W�i���ł͂Ȃ��Ƃ����Ӗ��ł́@�����B
	//�@�ނ̊O���Ɣ\�͂��@�������ł͂���c�c�B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_522_MSG_130");
	KeyInputWait_();
	CloseMsgWnd_();	
	//===============================================

	Wait_(10);


	//��������������������������������������
	//���J�b�g11�@��l���{���i�[�e�{�o�[�f�B�@�ҋ@�@�����瑕�u�S�́��o�`�m�A�b�v
	//��������������������������������������

	task_cam = Task_AnimeMoveCamera_("anmeye007", "anmtgt007");

	SetMotion_(rena, MOT_TALKLOOP, BLEND_N);				// ���i�[�e�@��bL
	SetDir_(rena, 195);
	Wait_(5);

	//===============================================
	//�����i�[�e
	//�u�{�̂���ӎ���؂藣���@���u�ɋL�^�B
	//�@������@���肻�߂̐g�̂Ɂ@�h�点��c�c�B�@��
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_522_MSG_140");
	KeyInputWait_();
	//===============================================

	//===============================================
	//�����i�[�e
	//�u������@�{�̂����邩����@���x�ł�
	//�@�������ł���c�c���ꂪ�G�C���A�X��B
	//-----------------------------------------------
	ShowMsg_("DEMO_522_MSG_150");
	KeyInputWait_();
	CloseMsgWnd_();	
	//===============================================

	Wait_(15);
	WaitTask(task_cam);
	DeleteTask_(task_cam);


	//��������������������������������������
	//���J�b�g12�@��l���{���i�[�e�{�o�[�f�B�@��l���{�o�[�f�B�U������@������
	//��������������������������������������

	SetPointCameraEye_("cameye005");
	SetPointCameraTarget_("camtgt005");

	SetMotion_(rena, MOT_WAIT, BLEND_N);					// ���i�[�e�@�ҋ@
	Wait_(5);

	StopBgm_(15);
	//===============================================
	//*�_�[�N�}�X�^�[
	//�u�ق��c�c�Ȃ��Ȃ��@�����[���b���ȁB
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_522_MSG_160");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	posplayer = Vec3(0, 1.1, 0);
	posburdy = Vec3(0, 0, 1);
	local posrena = Vec3(2, -2, 0);
	local id1;
	id1 = SetSelectBoneEffectSetOffset_("ef712_10_emo_surprise01", player, ATTACH_EFFECT1, posplayer);	// �u�I�v
	SetEffectScale_(id1, 1.5);
	local id2;
	id2 = SetSelectBoneEffectSetOffset_("ef712_10_emo_surprise01", burdy, ATTACH_EFFECT1, posburdy);	// �u�I�v
	SetEffectScale_(id2, 3.0);
	local id3;
	id3 = SetSelectBoneEffectSetOffset_("ef712_10_emo_surprise01", rena, ATTACH_EFFECT1, posrena);	// �u�I�v
	SetEffectScale_(id3, 2.0);
	PlaySE_("SE_DEM_053");		// �u�s���b�I�v

	Wait_(30);
	SetMotion_(player, MOT_WALK, BLEND_L);					// ��l���@����
	task_player = Task_RotateToDir_(player, 280, 7);
	SetMotion_(burdy, MOT_WALK, BLEND_L);					// �o�[�f�B�@����
	task_burdy = Task_RotateToDir_(burdy, 270, 6);
	SetMotion_(rena, MOT_WALK, BLEND_L);					// ���i�[�e�@����
	task_rena = Task_RotateToDir_(rena, 275, 6);
	WaitTask(task_rena);
	SetMotion_(rena, rena_caution, BLEND_L);				// ���i�[�e�@�x��L
	WaitTask(task_player);
	SetMotion_(player, player_caution01, BLEND_L);			// ��l���@�x��L
	WaitTask(task_burdy);
	SetMotion_(burdy, burdy_idol, BLEND_L);					// �o�[�f�B�@�ҋ@
	DeleteTask_(task_player);
	DeleteTask_(task_burdy);
	DeleteTask_(task_rena);
	Wait_(15);


	//��������������������������������������
	//���J�b�g13�@��l���{���i�[�e�{�o�[�f�B�{�_�[�N�}�X�^�[�@�_�[�N�}�X�^�[�������ҋ@�@�R�l������灨�_�[�N�}�X�^�[�A�b�v
	//��������������������������������������

	task_cam = Task_AnimeMoveCamera_("anmeye008", "anmtgt008");
	PlayBgm_("BGM_008");
	task_darkmaster = Task_AnimeMove_(darkmaster, "anm_darkmaster000");
	SetVisible(darkmaster, true);
	SetMotionSpeed_(darkmaster, 1.5);
	SetMotion_(darkmaster, MOT_WALK, BLEND_N);				// �_�[�N�}�X�^�[�@����
	Wait_(40);
	SetMotion_(darkmaster, MOT_WAIT, 10);					// �_�[�N�}�X�^�[�@�ҋ@
	SetMotionSpeed_(darkmaster, 1.0);
	Wait_(5);
	DeleteTask_(task_darkmaster);

	//===============================================
	//���o�[�f�B
	//�u�_�c�c�_�[�N�}�X�^�[�I�H
	//�@���[�́@���񂾂͂��ł́c�c�I�H
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BIRDY");
	ShowMsg_("DEMO_522_MSG_170");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(10);
	SetMotion_(darkmaster, MOT_TALKLOOP, BLEND_XL);			// �_�[�N�}�X�^�[�@��bL

	//===============================================
	//���_�[�N�}�X�^�[
	//�u�t�b�B�����Ă���̂��@�s�v�c���H
	//�@�ʂɁ@�����������Ƃł͂Ȃ��B�@��
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_DARKMASTER");
	ShowMsg_("DEMO_522_MSG_180");
	KeyInputWait_();
	//===============================================

	//===============================================
	//���_�[�N�}�X�^�[
	//�u�C�b�^�u�����@���ɂ���������B
	//�@�����҂ɂ��@�g�����͂������Ƃ������Ƃ��B
	//-----------------------------------------------
	ShowMsg_("DEMO_522_MSG_190");
	KeyInputWait_();
	CloseMsgWnd_();	
	//===============================================

	SetMotion_(darkmaster, MOT_WAIT, BLEND_XL);				// �_�[�N�}�X�^�[�@�ҋ@
	Wait_(16);
	DeleteTask_(task_cam);


	//��������������������������������������
	//���J�b�g14�@��l���{���i�[�e�{�o�[�f�B�{�_�[�N�}�X�^�[�@��b�@�_�[�N�}�X�^�[�������
	//��������������������������������������

	SetPointCameraEye_("cameye006");
	SetPointCameraTarget_("camtgt006");

	SetPointPos_(burdy, "npc_burdy003");
	Wait_(10);
	SetMotion_(darkmaster, MOT_TALKLOOP, BLEND_XL);			// �_�[�N�}�X�^�[�@��bL

	//===============================================
	//���_�[�N�}�X�^�[
	//�u���΂炭�@�f�X�o�[���Ɂ@�l�q��T�点�Ă�����
	//�@�������Ŗʔ������̂��@���邱�Ƃ��ł����B�@��
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_DARKMASTER");
	ShowMsg_("DEMO_522_MSG_200");
	KeyInputWait_();
	//===============================================

	//===============================================
	//���_�[�N�}�X�^�[
	//�u�c�c���x�ł��@��݂�����킯���B
	//�@�܂����@�M�l���G�C���A�X�������Ƃ́B
	//-----------------------------------------------
	ShowMsg_("DEMO_522_MSG_210");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(darkmaster, MOT_WAIT, BLEND_XL);				// �_�[�N�}�X�^�[�@�ҋ@
	Wait_(30);


	//��������������������������������������
	//���J�b�g15�@�_�[�N�}�X�^�[�@�΂�����b�������@�΂ߑO�����灨�㔼�g�Y�[���C��
	//��������������������������������������

	SetPointCameraEye_("cameye007");
	SetPointCameraTarget_("camtgt007");

	SetPointPosNoFit_(darkmaster, "npc_darkmaster001");
	SetMotion_(darkmaster, darkmaster_laugh_L, BLEND_XL);	// �_�[�N�}�X�^�[�@�΂�L
	SetMotionSpeed_(darkmaster, 1.5);
	Wait_(36);
	SetMotion_(darkmaster, MOT_WAIT, 10);					// �_�[�N�}�X�^�[�@�ҋ@
	SetMotionSpeed_(darkmaster, 1.0);
	Wait_(10);
	SetMotion_(darkmaster, MOT_TALKLOOP, BLEND_XL);			// �_�[�N�}�X�^�[�@��bL
	Wait_(5);

	//===============================================
	//���_�[�N�}�X�^�[
	//�u�����@�l�^�������΁@�Ώ��͂��₷���B
	//�@�{�̂�łڂ��΁@�����͂Ȃ��Ȃ�I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_DARKMASTER");
	ShowMsg_("DEMO_522_MSG_220");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(darkmaster, darkmaster_summon, 12);			// �_�[�N�}�X�^�[�@�ҋ@�������X�^�[����
	Wait_(40);
	PlaySE_("SE_DEM_026");	// ��SE:�W����
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", CAMERA_DEF);// �W����
	Wait_(18);
	DeleteEffectEmitter_(efc_cam);
	SetFade_(FADE_OUT, FADE_COLOR_WHITE, 25);
	Wait_(2);
	SetMotion_(darkmaster, darkmaster_summon_L, BLEND_L);	// �_�[�N�}�X�^�[�@�����X�^�[����L
	Wait_(40);
	SetVisible(prometheus, true);
	efc_prometheus = SetSelectBoneEffectSetOffset_("ef730_01_oth_dark_aura01", prometheus, ATTACH_EFFECT2, Vec3(0.0, 0.0, 0.0));
	SetMotion_(darkmaster, MOT_WAIT, BLEND_N);				// �_�[�N�}�X�^�[�@�ҋ@
	task_cam = Task_AnimeMoveCamera_("anmeye009", "anmtgt009");
	SetDir_(darkmaster, 97);
	SetFade_(FADE_IN, FADE_COLOR_WHITE, 25);
	Wait_(105);
	DeleteTask_(task_cam);

	//===============================================
	//���_�[�N�}�X�^�[
	//�u�������@�łԂ������I
	//�@���̊�]�@�A���Z�X�̖��O����Ƃ��ɂȁI
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_DARKMASTER");
	ShowMsg_("DEMO_522_MSG_230");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(darkmaster, darkmaster_summon, 12);			// �_�[�N�}�X�^�[�@�ҋ@�������X�^�[����
	Wait_(39);

	EncountEndDemo(ENCOUNT_BOSS);
}
