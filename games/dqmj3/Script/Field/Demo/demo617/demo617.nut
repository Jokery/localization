//=============================================
//
//		demo617[���i�[�e�̍���_3(�c�[)]
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

// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();							// ��l��
	local model_rena = ReadNpc_("n007");					// ���i�[�e
	// �M�~�b�N
	local model_monolith = ReadGimmick_("o_com_02");		// ���m���X
	local model_reactor = ReadGimmick_("o_dem_07");			// ���A�N�^�[(�A�^�b�`�p)
	// �G�t�F�N�g
	LoadEffect_("ef732_13_light_reactor01");				// ���A�N�^�[�̌�(�܂Ԃ���)

// ���z�u
	// ��l��
	SetPointPos_(player, "player000");
	// ���i�[�e
	local rena = ArrangePointNpc_(model_rena, "npc_rena000");
	// ���m���X
	local monolith = ArrangePointGimmick_("o_com_02", model_monolith, "obj_monolith000");
	SetVisible(monolith, false);
	// ���A�N�^�[(�A�^�b�`�p)
	local reactor = ArrangePointGimmick_("o_com_02", model_reactor, "efc_light000");
	SetAlpha_(reactor, ALPHA_CLEAR);

// ����풓���[�V�����Ǎ�
	// ��l��
	local player_look_left_L = ReadMotion_(player, "Player_look_left_L");	// ���������������L
	// ���i�[�e
	local rena_talk01 = ReadMotion_(rena, "n007_talk01");					// ��b
	local rena_talk01_L = ReadMotion_(rena, "n007_talk01_L");				// ��bL
	local rena_show01 = ReadMotion_(rena, "n007_show01");					// �ҋ@��������̍����ʂ܂ŏグ��
	local rena_show_L = ReadMotion_(rena, "n007_show_L");					// ������̍����ʂ܂ŏグ��L
	local rena_look_right_L = ReadMotion_(rena, "n007_look_right_L");		// �E�����ҋ@L
	local rena_show_send_L = ReadMotion_(rena, "n007_show_send_L");			// ������̍����ʂ܂ŏグ�O�֏o��L
	SetMotion_(rena, rena_talk01, BLEND_N);									// ���i�[�e�@��b

// ���������[�V�����ݒ�
	SetMotion_(rena, MOT_WAIT, BLEND_N);					// ���i�[�e�@�ҋ@


	//��������������������������������������
	//���J�b�g1�@��l���ƃ��i�[�e�@���i�[�e��b�@�΂ߏと���i�[�e�Y�[���C��
	//��������������������������������������

// ���J�����ݒ�
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemoNoFade(FADE_COLOR_BLACK);

	Wait_(20);
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt00");// anmtgt[xxx]�����ƃR���p�C�����ʂ�Ȃ��Ȃ�ׁA��ނȂ�anmtgt00

	Wait_(66);
	SetMotion_(rena, rena_talk01, 24);						// ���i�[�e�@��b
	Wait_(24);
	DeleteTask_(task_cam);
	WaitMotion(rena);

	//===============================================
	// �����i�[�e
	//�u�K���r���X�ƌ���������ɂ�
	//�@���ځ@�����n���ā@��荞�ނ����Ȃ��B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_617_MSG_010");
	SetMotion_(rena, rena_talk01_L, BLEND_N);				// ���i�[�e�@��bL
	KeyInputWait_();
	//===============================================

	//===============================================
	//�����i�[�e
	//�u������c�c�I
	//-----------------------------------------------
	ShowMsg_("DEMO_617_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(rena, MOT_WAIT, 20);							// ���i�[�e�@�ҋ@
	Wait_(20);
	SetMotion_(rena, rena_show01, 28);						// ���i�[�e�@������̍����ʂ܂ŏグ��
	local task_rena = Task_RotateToDir_(rena, 35, 0.72);
	Wait_(28);
	SetMotion_(rena, rena_show_L, BLEND_L);					// ���i�[�e�@������̍����ʂ܂ŏグ��L
	Wait_(15);

	local efc_rena = SetSelectBoneEffect_("ef732_13_light_reactor01", reactor, ATTACH_GLOBAL);
	SetEffectScale_(efc_rena, 0.095);
	PlaySE_("SE_DEM_214");									// ���ėp�E�����o6
	Wait_(20);
	Task_AnimeMoveNoFit_(reactor, "anm_light000");
	Wait_(7);
	SetMotion_(rena, rena_show_send_L, 18);
	Wait_(50);
	DeleteTask_(task_rena);

	//��������������������������������������
	//���J�b�g2�@�A���Z�X�ƃ��i�[�e�ƃo�[�f�B�ƓG�Q�@�A���Z�X�B����с��G�Q�ǌ��@������
	//��������������������������������������

	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");

	PlaySE_("SE_DEM_037");									// ���ėp�E�����o1
	SetEffectScale_(efc_rena, 0.3);
	SetMotion_(player, MOT_WAIT, BLEND_N);					// ��l���@�ҋ@
	SetMotion_(rena, MOT_WAIT, BLEND_N);					// ���i�[�e�@�ҋ@
	SetPointPos_(player, "player001");
	SetPointPos_(rena, "npc_rena001");
	Task_AnimeMoveNoFit_(reactor, "anm_light001");
	Wait_(45);
	SetFade_(FADE_OUT, FADE_COLOR_WHITE, 30);
	Wait_(30);

	DeleteEffect_(efc_rena);
	SetVisible(monolith, true);
	Wait_(15);
	SetFade_(FADE_IN, FADE_COLOR_WHITE, 45);
	Wait_(55);

	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt01");// anmtgt[xxx]�����ƃR���p�C�����ʂ�Ȃ��Ȃ�ׁA��ނȂ�anmtgt01

	Wait_(20);
	SetMotion_(rena, rena_look_right_L, BLEND_XL);			// ���i�[�e�@�E�����ҋ@L
	Wait_(25);
	DeleteTask_(task_cam);
	Wait_(5);

	//===============================================
	//�����i�[�e
	//�u�s���܂��傤�@<name_player/>�B
	//�@�Ō�́@�o�[�`�����R���V�A���ցc�c�B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_617_MSG_030");
	Wait_(7);
	SetMotion_(player, player_look_left_L, 12);				// ��l���@���������������L
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(4);
	SetMotion_(rena, MOT_WAIT, BLEND_XL);					// ���i�[�e�@�ҋ@
	Wait_(21);

	//===============================================
	//�����i�[�e
	//�u������@���R�ɔ�т܂���
	//�@�V���ȃ`�J�����@��ɓ���邽�߂Ɂc�c�I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_617_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(4);
	SetMotion_(player, MOT_WAIT, BLEND_XL);					// ��l���@�ҋ@
	Wait_(75);

	EndDemo(FADE_COLOR_BLACK);
}
