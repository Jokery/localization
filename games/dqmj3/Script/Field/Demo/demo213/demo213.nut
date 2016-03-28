//=============================================
//
//		demo213[�嗤�ړ�]
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
	local task_cam;
	local efc_player, efc_holography;

// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();					// ��l��
	local npc_rena = ReadNpc_("n034");				// ���i�[�e
	// �M�~�b�N
	local model_monitor = ReadGimmick_("o_G02_14");	// ���j�^
	local model_meimetu = ReadGimmick_("o_G02_11");	// �R���s���[�^�[�̖���
	// �G�t�F�N�g
	LoadEffect_("ef732_09_light_reactor_c");		// ���A�N�^�[����
	LoadEffect_("ef732_14_holography01");			// �z���O�����\���@�풓
	LoadEffect_("ef732_16_holography01");			// �z���O�����\���@����

// ���z�u
	// ��l��
	SetPointPos_(player, "player000");
	//���i�[�e
	local res_rena = ArrangePointNpc_(npc_rena, "npc_renerte000");
	SetManualCalcAlpha_(res_rena, true);
	efc_holography = SetBoneEffect_("ef732_14_holography01", res_rena);	
	// �M�~�b�N�ݒu
	local monitor = ArrangePointGimmick_("o_G02_14", model_monitor, "obj_monitor000");	//���j�^
	// ����
	local meimetu = ArrangePointGimmick_("o_G02_11", model_meimetu, "obj_meimetu000");
	
// ����풓���[�V�����Ǎ�
	local player_touch_reactor_L = ReadMotion_(player, "Player_touch_reactor_L");		// ���A�N�^�[��G��L
	local player_look_right_L = ReadMotion_(player, "Player_look_right_L");				// �E������
	local renerte_look_left_L = ReadMotion_(res_rena, "n007_look_left_L");				//�@���i�[�e�@��������
	local renerte_look_down_L = ReadMotion_(res_rena, "n007_look_down_L");				//�@���i�[�e�@��������	
	local renerte_look_up_L = ReadMotion_(res_rena, "n007_look_up02_L");				//�@���i�[�e�@�������	

// �����Ԑݒ�
	SetTime_(START_TIME_ZONE_NIGHT);


	//��������������������������������������
	//���J�b�g1�@��l��&���j�^�˃��C�A�E�g�}�b�v�\��
	//��������������������������������������

// ���J�����ݒ�
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_WHITE);

	//===============================================
	//*�V�X�e�����b�Z�[�W
	//	�����ā@�����̕X���ւƂȂ���
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_213_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(30);
	StartEarthQuake_(60, 4, 0.4)
	PlayLoopSE_("SE_DEM_013");
	Wait_(30);
	StopLoopSE_(30);

	//...........................................................................
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);					//�t�F�[�h�A�E�g
	WaitFade_();
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	SetPointPos_(player, "player001");
	Wait_(10);
	LoadLayout_("w_map");										//���C�A�E�g�ǂݍ���
	SetLayoutAnime_("move_02", false);							//�}�b�v
	Wait_(30);
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);					//�t�F�[�h�C��
	//...........................................................................

	Wait_(50);
	PlaySE_("SE_DEM_179");
	Wait_(100);
	PlaySE_("SE_DEM_178");
	Wait_(200);


	//��������������������������������������
	//���J�b�g2�@��l���ʁ���l���Y�[���C��
	//��������������������������������������

	PlaySE_("SE_FLD_135");		// ���A�N�^�[������
	efc_player = SetSelectBoneEffect_("ef732_09_light_reactor_c", player, ATTACH_EFFECT1);	//���A�N�^�[����
	SetEffectScale_(efc_player, 0.5);
	Wait_(10);
	SetFace_(player, "Face_left");
	SetMotion_(player, player_touch_reactor_L, 20);		//���A�N�^�[�ɐG��L
	Wait_(50);

	//===============================================
	//*�V�X�e�����b�Z�[�W
	//�����X�^�[�}�X�^�[�@����l���̖��O�����m�F�B
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_213_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(15);
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");		// 120F
	SetMotion_(res_rena, renerte_look_down_L, 20);		////�@���i�[�e�@�������
	SetFace_(player, "Face_right");
	//===============================================
	//�Ȃ��̏���
	//�����̕X���Ɂc�c���L�����@�悭�m��҂�����B
	//�ړ����u�Ł@�����̕X���Ɂ@�������Ȃ����c�c�B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MYSTERYGIRL");
	ShowMsg_("DEMO_213_MSG_030");
	Wait_(5);
	SetMotion_(player, player_look_right_L, 20);		// �E������
	KeyInputWait_();
	CloseMsgWnd_();
	//-----------------------------------------------
	PlaySE_("SE_DEM_048");															//���i�[�e������
	SetVisible(res_rena, false);
	DeleteEffect_(efc_holography);
	efc_holography = SetBoneEffect_("ef732_16_holography01", res_rena);
	SetAlpha_(res_rena, 0);							//���i�[�e���l

	Wait_(75);

	EndDemo(FADE_COLOR_BLACK);
}
