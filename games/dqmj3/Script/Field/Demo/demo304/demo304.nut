//=============================================
//
//		demo304[B�����N����_1(����)]
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
	local efc_player,efc_mono,efc_scan;

// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();									// ��l��
	// �M�~�b�N
	local mono = ReadGimmick_("o_com_02");							// ���m���X
	local model_door = ReadGimmick_("o_O01_05");					// ���i�����N�a�j

// ���z�u
	// ��l��
	SetPointPos_(player, "player000");

	// ���m���X
	local res_mono = ArrangePointGimmick_("o_com_02", mono, "obj_monolith000");
	SetMotion_(res_mono, MOT_GIMMICK_2, BLEND_N);
	// ���i�����N�a�j
	local door = ArrangePointGimmick_("o_O01_05", model_door, "obj_door000");

// ���G�t�F�N�g�̓ǂݍ���
	LoadEffect_("ef732_07_teleport_monolith");						//���m���X�]���G�t�F�N�g
	LoadEffect_("ef732_08_light_scan"); 							//�X�L�����̌��G�t�F�N�g

	//�����̃��[�V����
	SetMotion_(player, MOT_WAIT, BLEND_M);							//��l���ҋ@
	SetAlpha_(player, ALPHA_CLEAR);									//���l�̏����ݒ�


//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	//��������������������������������������
	//���J�b�g1 B�����N�t���A �w�i�\��
	//��������������������������������������

// ���J�����ݒ�
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");

	StartDemo(FADE_COLOR_BLACK);

	//===============================================
	//���e���W�A
	//�u������́@�����X�^�[�}�X�^�[��p�{��
	//�@�o�[�`�����R���V�A���ł��B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TEREZIA");
	ShowMsg_("DEMO_304_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();

	WaitTask(task_cam);

	//��������������������������������������
	//���J�b�g2 �X�L����������l��
	//��������������������������������������

	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

	Wait_(10);

	//��l���]��
	PlaySE_("SE_DEM_017");
	efc_mono = SetSelectBoneEffect_("ef732_07_teleport_monolith", player, ATTACH_GLOBAL);

	for (local i=1; i <= 10; i++) {
		SetAlpha_(player, ALPHA_CLEAR + (i * 0.1));
		Wait_(3);
	}
	Wait_(30);
	//===============================================
	//���e���W�A
	//�u������@���Ȃ��́@�{�ݗ��p���ɂ���
	//�@�m�F���@�����Ă��������܂��B
	//===============================================
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TEREZIA");
	ShowMsg_("DEMO_304_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	PlaySE_("SE_FLD_235");					//���A�N�^�[�i�A�i���C�Y/�����̋��Ԕ������j
	efc_player = SetSelectBoneEffect_("ef732_08_light_scan", player, ATTACH_GLOBAL);		//�}�X�^�[�X�L����
	Wait_(45);

	//===============================================
	//���e���W�A
	//�u<name_player/>���܂̏����@�m�F�c�c
	//�@�o�^�f�[�^�Ɓ@�ƍ����������܂����B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TEREZIA");
	ShowMsg_("DEMO_304_MSG_030");
	KeyInputWait_();
	//===============================================
	//���e���W�A
	//�o�^�ԍ�<exchange/>�c�c
	//�@�悤�����@<name_player/>���܁B
	//-----------------------------------------------
	SetExchangeRegistrationNumber_();		// DEMO_304_MSG_004�Ɋ܂܂��<exchange/>�^�O���v���C���[�o�^�ԍ��ɒu��������
	ShowMsg_("DEMO_304_MSG_040");
	KeyInputWait_();

	//��������������������������������������
	//���J�b�g3 ��]�J����
	//��������������������������������������

	//�J������]
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	SetMotion_(player, MOT_WAIT, BLEND_XL);			//��l���ҋ@

	//===============================================
	//���e���W�A
	//�u�����<name_player/>���܂ɂ�
	//�@�a�����N�������@���ē������Ă��������܂��B
	//-----------------------------------------------
	ShowMsg_("DEMO_304_MSG_050");
	KeyInputWait_();
	//===============================================
	//���e���W�A
	//�u�a�����N�ɍ��i���ꂽ�@�����X�^�[�}�X�^�[��
	//�@�l���ł���`�J���́@�������C�h�B
	//-----------------------------------------------
	ShowMsg_("DEMO_304_MSG_060");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	WaitTask(task_cam);
	Wait_(10);

	//��������������������������������������
	//���J�b�g4 �v�[���f��
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");

	//===============================================
	//���e���W�A
	//�u����́@���ɐ����@�����X�^�[�ɏ��
	//�@������i�ނ��߂́@�`�J���ƂȂ�܂��B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TEREZIA");
	ShowMsg_("DEMO_304_MSG_070");
	KeyInputWait_();

	//===============================================
	//���e���W�A
	//�u�s���͈͂��L���ā@�`���̑�������ƂȂ�
	//�@���̃`�J���̂��߂Ɂ@���Ё@���Q�����������B
	//-----------------------------------------------
	ShowMsg_("DEMO_304_MSG_080");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	WaitTask(task_cam);
	Wait_(40);

	//��������������������������������������
	//���J�b�g5 ���Y�[���A�b�v
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");

	//===============================================
	//���e���W�A
	//�u�퓬�ɂ���ā@�\�͂��@���肢�����܂��B
	//�@���̔��ց@���i�݂��������B
	//===============================================
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TEREZIA");
	ShowMsg_("DEMO_304_MSG_090");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	WaitTask(task_cam);

	EndDemo(FADE_COLOR_BLACK);
}
