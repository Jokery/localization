//=============================================
//
//		demo211[�̐l����󂯌p��������_1]
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
	local task_cam, task_player;
	local efc_player, efc_holography;
	local rena_on1 = [0.3, 0.6, 0.4, 0.3, 0.5, 0.3, 0.6, 0.4, 0.3, 0.5, 0.4, 0.3, 0.7];
	local rena_on2 = [1, 1, 15, 1, 1, 1, 1, 5, 1, 1, 1, 1, 1];

// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();					// ��l��
	local npc_rena = ReadNpc_("n034");				// ���i�[�e
	// �M�~�b�N
	local model_monitor = ReadGimmick_("o_G02_14");	// ���j�^
	local model_meimetu = ReadGimmick_("o_G02_11");	// �R���s���[�^�[�̖���

	// �G�t�F�N�g
	LoadEffect_("ef732_14_holography01");			// �z���O�����\���@�풓
	LoadEffect_("ef732_15_holography01");			// �z���O�����\���@�o��
	LoadEffect_("ef732_09_light_reactor_c");		// ���A�N�^�[����

// ���z�u
	// ��l��
	SetPointPos_(player, "player000");
	// ���i�[�e
	local res_rena = ArrangePointNpc_(npc_rena, "npc_renerte000");
	SetManualCalcAlpha_(res_rena, true);
	SetAlpha_(res_rena, ALPHA_CLEAR);
	// ���j�^
	local monitor = ArrangePointGimmick_("o_G02_14", model_monitor, "obj_monitor000");	//���j�^
	SetMotion_(monitor, MOT_GIMMICK_0, BLEND_N);
	// ����
	local meimetu = ArrangePointGimmick_("o_G02_11", model_meimetu, "obj_meimetu000");
	
// ����풓���[�V�����Ǎ�
	local renerte_look_down = ReadMotion_(res_rena, "n007_look_down_L");		//�@���i�[�e�@���ނ��ҋ@
	local renerte_look_up = ReadMotion_(res_rena, "n007_look_up_L");			//�@���i�[�e�@�������
	local renerte_look_left_L = ReadMotion_(res_rena, "n007_look_left_L");		//�@���i�[�e�@��������

// ���������[�V����
	SetMotion_(res_rena, renerte_look_down, BLEND_N);		//���i�[�e���ނ��ҋ@

// �����Ԑݒ�
	SetTime_(START_TIME_ZONE_NIGHT);

// ���J�����ݒ�
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");	
	DeleteTask_(task_cam);

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	//��������������������������������������
	//���J�b�g1 �`���i�[�e�`
	//��������������������������������������
	
	StartDemo(FADE_COLOR_BLACK);
	Wait_(15);
	
	//===============================================
	// *�V�X�e�����b�Z�[�W
	// �Z�L�����e�B�R�[�h���@���m���܂����B
	// �F�؃V�X�e�����@�N���������܂��B
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_211_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	PlaySE_("SE_FLD_135");		// ���A�N�^�[������
	efc_player = SetSelectBoneEffect_("ef732_09_light_reactor_c", player, ATTACH_EFFECT1);	// ���A�N�^�[����
	Wait_(30);
	
	//===============================================
	// *�V�X�e�����b�Z�[�W
	// ���K�̃��A�N�^�[�ł��邱�Ƃ��@�m�F�c�c�B
	// �i�[���ꂽ�@�f�[�^���@�W�J���܂��B
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_211_MSG_060");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	
	WaitTask(task_cam);
	PlaySE_("SE_DEM_047");													// ���i�[�e�����
	efc_holography = SetBoneEffect_("ef732_15_holography01", res_rena);		// �z���O�����\���@�o��
	
	// ���i�[�e�_��
	for (local i = 0; i< rena_on1.len(); i ++){
		SetAlpha_(res_rena, rena_on1[i]);
		Wait_(rena_on2[i]);
	}
	
	// ���i�[�e����
	SetAlpha_(res_rena, 1);
	DeleteEffect_(efc_holography);
	efc_holography = SetBoneEffect_("ef732_14_holography01", res_rena);
	
	task_player = Task_WalkAroundToPos(player, GetPos_(res_rena), ROTATE_DEMO_DEF);	// ��l���@�E������
	WaitTask(task_player);
	SetMotion_(player, MOT_WAIT, BLEND_M);
	Wait_(30);
	
	//===============================================
	// ���Ȃ��̏���
	// �u�c�c���̃��b�Z�[�W�́@���Ȃ���
	// �@�u���h���h���@�|������@�Đ��������́c�c
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MYSTERYGIRL");
	ShowMsg_("DEMO_211_MSG_010");
	KeyInputWait_();
	
	SetMotion_(res_rena, renerte_look_up, BLEND_XL);
	DeleteTask_(task_cam);
	
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");
	
	//-----------------------------------------------
	// ���Ȃ��̏���
	// �u���Ȃ��́@�`�J���́@�߂����悤�ˁB
	// �@���ƒ��Ԃ������@������ʂ�Ɂc�c�B
	//-----------------------------------------------
	ShowMsg_("DEMO_211_MSG_020");
	Wait_(16);
	KeyInputWait_();
	
	SetMotion_(res_rena, renerte_look_down, BLEND_XL);
	
	//-----------------------------------------------
	// ���Ȃ��̏���
	// �u�ł��@���̂��Ȃ��́@�܂�����Ȃ��B
	// �@����Ȃ����̂��@�������邭�炢�c�c�B
	//-----------------------------------------------
	ShowMsg_("DEMO_211_MSG_030");
	Wait_(6);
	KeyInputWait_();
	
	Wait_(10);
	SetMotion_(res_rena, renerte_look_left_L, BLEND_XL);
	Wait_(20);
	
	//-----------------------------------------------
	// ���Ȃ��̏���
	// �u������c�c���E���@�����Ɓ@�m���āc�c�B
	// �@����@���L����������c�c���̐��E�̂��Ƃ��B
	//-----------------------------------------------
	ShowMsg_("DEMO_211_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(res_rena, MOT_WAIT, 20);
	Wait_(36);
	DeleteTask_(task_cam);
	
	//��������������������������������������
	//���J�b�g2 �`���j�^�N���`
	//��������������������������������������
	
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	
	DeleteTask_(task_cam);
	SetVisible(res_rena, false);
	DeleteEffect_(efc_holography);
	Wait_(10);
	
	task_player = Task_RotateToDir_(player, 180, 5);
	SetMotion_(player, MOT_WALK, 9);
	Wait_(30);
	
	SetMotion_(player, MOT_WAIT, 9);
	Wait_(30);
	
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	
	WaitTask(task_cam);
	PlaySE_("SE_DEM_049");															// ���j�^�[�Ƀm�C�Y������
	SetMotion_(monitor, MOT_GIMMICK_1, BLEND_N);
	PlaySE_("SE_DEM_050");															// �m�C�Y�ł����
	Wait_(60);
	
	EndDemo(FADE_COLOR_WHITE);
}
