//=============================================
//
//		demo124[�ӂ����ȐΔ�]
//
//=============================================

//-------------------------------------------------------------------------
//
//		�ǂݍ��݁E�z�u
//
//-------------------------------------------------------------------------
function Update()
{
// ��LOD�ǂݍ���
	ReadWaitingLod("cameye000", "camtgt000");

// ���t���O�ݒ�
	local bit_ruler = GetEventFlg_("BFG_RULER_END_005");			// Bit_305  ���[���ǉ��I���t���O ���d�{��
	local bit_ruler2 = GetEventFlg_("BFG_RULER_ADD_005");			// Bit_205  ���[���ǉ��t���O ���d�{��
	local bit_mantan = GetEventFlg_("BFG_EXAMINE_FULLTANK_STELE");	// Bit_1104 �܂񂽂�擾�t���O

// ���ϐ���`
	local task_cam, task_player;
	local efc_player;
	local start_time;		// �f���J�n���̎���
	local frame;			// ���t���[���Ŏ��Ԍo�߂����邩
	local change_time;		// �P�t���[���ŕύX���鎞��
	
	// ���u�܂񂽂�v���擾���Ă����ꍇ
	if (bit_mantan) {
		start_time	 = START_TIME_ZONE_EVENING;
		frame		 = 60;
	}
	// ���u�܂񂽂�v���擾�̏ꍇ
	else {
		start_time	 = START_TIME_ZONE_NOON;
		frame		 = 150;
	}
	change_time = (START_TIME_ZONE_NIGHT - start_time) / frame;		// (��̎��� �| �J�n����) �� �t���[����

// �����Ԑݒ�
	SetTime_(start_time);

// �����f���Ǎ�
	// �M�~�b�N
	local model_window = ReadGimmick_("o_A00_04");		//�Z���^�[�r���̑��M�~�b�N
	local model_ruler = ReadGimmick_("o_com_08");		//���[���|�C���g
	// �L�����N�^�[
	local player = GetPlayerId_();						// ��l��
	// �G�t�F�N�g
	LoadEffect_("ef732_09_light_reactor_c");

// ���z�u
	// ���M�~�b�N
	local window = ArrangePointGimmick_("o_A00_04", model_window, "obj_light000");
	SetMotion_(window, MOT_GIMMICK_1, BLEND_N);
	// ���[���|�C���g
	local ruler = ArrangePointGimmick_("o_com_08", model_ruler, "obj_ruler000");
	// �����[���|�C���g�����ɋN�����Ă����ꍇ
	if (bit_ruler2) { SetMotion_(ruler, MOT_GIMMICK_2, BLEND_N); }
	
	// ��l��
	SetPointPos_(player, "player000");

// ����풓���[�V�����Ǎ�
	// ��l��
	local Player_touch_reactor = ReadMotion_(player, "Player_touch_reactor_L");	// ���A�N�^�[��G��

// ���J�����ݒ�
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------
	StartDemo(FADE_COLOR_BLACK);
	Wait_(30);
	
	PlaySE_("SE_DEM_019");		//SE:���A�N�^�[������
	efc_player = SetSelectBoneEffect_("ef732_09_light_reactor_c", player, ATTACH_EFFECT1);		// �u�I�v
	Wait_(30);
	
	SetMotion_(player, Player_touch_reactor, BLEND_XL);		// ���A�N�^�[��G��
	Wait_(30);
	
	OpenConnective("connective_ace");
	
	//===============================================
	// ���G�[�X
	// �u���d�{�݂Ɂ@�������݂������ȁB
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_124_MSG_010");
	KeyInputWait_();
	
	//-----------------------------------------------
	// ��
	// �u��������ā@���A�N�^�[�Ŏw�����o������
	//-----------------------------------------------
	ShowMsg_("DEMO_124_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	CloseConnective();
	
	SetMotion_(player, MOT_WAIT, BLEND_XL);
	Wait_(18);
	
	// ���J�����Q�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	
	task_player = Task_RotateToDirSetMotion_(player, 0, ROTATE_DEMO_DEF, MOT_WALK, MOT_WAIT);
	
	StopBgm_(frame);
	// ��(�[) �� ���
	ChangeColorTone_(CITY_COLOR_TONE_DARK_R, CITY_COLOR_TONE_DARK_G, CITY_COLOR_TONE_DARK_B, frame);
	for (local i=1; i <= frame; i++){
		SetTime_(start_time + (change_time * i));
		Wait_(1);
	}
	
	WaitTask(task_cam);
	Wait_(20);
	
	EndDemo(FADE_COLOR_BLACK);
}
