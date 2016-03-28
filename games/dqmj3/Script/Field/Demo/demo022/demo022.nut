//=============================================
//
//		demo022[C�����N����_1(����)]
//
//=============================================
function Update()
{

// ���ϐ���`
	local task_cam;
	local efc_player;

// �����\�[�X�Ǎ�
	local player = GetPlayerId_();

	local model_monolith = ReadGimmick_("o_com_02");		// ���m���X
	local model_door = ReadGimmick_("o_O01_04");			// ���i�����N�b�j

	LoadEffect_("ef732_07_teleport_monolith");				// ���m���X�]���G�t�F�N�g
	LoadEffect_("ef712_10_emo_surprise01");
	LoadEffect_("ef732_08_light_scan"); 					// �X�L�����̌��G�t�F�N�g

// ���z�u
	SetPointPos_(player, "player000");
	SetDir_(player, 180);

	// ���m���X
	local monolith = ArrangePointGimmick_("o_com_02", model_monolith, "obj_monolith000");
	// ���i�����N�b�j
	local door = ArrangePointGimmick_("o_O01_04", model_door, "obj_door000");

// ����풓���[�V�����Ǎ�
	local player_look_up_L = ReadMotion_(player, "Player_look_up_L");					// ������ҋ@L
	local player_caution01_L = ReadMotion_(player, "Player_caution01_L");				// �x��L
	local player_guard_L = ReadMotion_(player, "Player_guard_L");						// �g�\����L
	local player_caution = ReadMotion_(player, "Player_caution");						// �g�\���遨�x��

// �������̃��[�V����
	SetMotion_(monolith, MOT_GIMMICK_2, BLEND_N);
	SetMotion_(player, MOT_WAIT, BLEND_N);									// �����ނ��ҋ@���[�V�������Ȃ��̂�WAIT�ő�p���Ă��܂��B

	SetManualCalcAlpha_(player, true);
	SetAlpha_(player, ALPHA_CLEAR);

// ���J�����ݒ�
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------
	//��������������������������������������
	//���J�b�g1 C�����N�t���A �w�i�\��
	//��������������������������������������

	StartDemo(FADE_COLOR_BLACK);

	//=====================================
	//	�u������́@�����X�^�[�}�X�^�[��p�{��
	OpenMsgWnd_();
	ShowMsg_("DEMO_022_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//=====================================

	WaitTask(task_cam);
	Wait_(40);

	//��������������������������������������
	//���J�b�g2 �X�L����������l��
	//��������������������������������������
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");

	Wait_(15);

	PlaySE_("SE_DEM_017");
	efc_player = SetSelectBoneEffect_("ef732_07_teleport_monolith", player, ATTACH_GLOBAL);					//��l���]��

	Wait_(1);
	SetAlpha_(player, 0.1);
	Wait_(1);
	SetAlpha_(player, 0.2);
	Wait_(1);
	SetAlpha_(player, 0.3);
	Wait_(1);
	SetAlpha_(player, 0.4);
	Wait_(1);
	SetAlpha_(player, 0.5);
	Wait_(1);
	SetAlpha_(player, 0.6);
	Wait_(1);
	SetAlpha_(player, 0.7);
	Wait_(1);
	SetAlpha_(player, 0.8);
	Wait_(1);
	SetAlpha_(player, 0.9);
	Wait_(1);
	SetAlpha_(player, 1.0);

	Wait_(40);
	//=====================================
	//	�u���������Ł@���炢�����܂��B
	OpenMsgWnd_();
	ShowMsg_("DEMO_022_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//=====================================

	SetMotion_(player, player_look_up_L, BLEND_M);							// ��@��ҋ@
	local pos = Vec3(0.0, 1.5, 0);
	efc_player = SurpriseDispSetOffset(player, pos, 0.65);

	Wait_(45);
	//=====================================
	//	�u���́@���{�݂��Ǘ����邽�߂́@�l�H�m�\�B
	OpenMsgWnd_();
	ShowMsg_("DEMO_022_MSG_030");
	KeyInputWait_();

	//	�u���̓e���W�A�B���C�Z���X�������@�󌱂����
	ShowMsg_("DEMO_022_MSG_040");
	KeyInputWait_();

	//	�u������@���Ȃ����@�{�ݗ��p�����@���������@�m�F�������Ă��������܂��B
	SetTalkName_("NAME_TAG_TEREZIA");
	ShowMsg_("DEMO_022_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	//=====================================
	Wait_(15);
	SetMotion_(player, MOT_WAIT, BLEND_XL);							// ��@�ҋ@
	Wait_(10);
	PlaySE_("SE_FLD_235");		//�X�L������
	efc_player = SetSelectBoneEffect_("ef732_08_light_scan", player, ATTACH_GLOBAL);		//�}�X�^�[�X�L����
	Wait_(50);
	
	SetExchangeRegistrationNumber_();		// DEMO_022_MSG_060�Ɋ܂܂��<exchange/>�^�O���v���C���[�o�^�ԍ��ɒu��������
	//=====================================
	//	�u�����X�^�[�}�X�^�[�́@���q�����m�B
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TEREZIA");	
	ShowMsg_("DEMO_022_MSG_060");
	KeyInputWait_();

	//	�u�悤�����@<name_player/>���܁B
	ShowMsg_("DEMO_022_MSG_070");
	SetFace_(player, "Face_default");
	KeyInputWait_();
	//=====================================

	//��������������������������������������
	//���J�b�g3 ��]�J����
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");

	//=====================================
	//�e���W�A�u���{�݂ł́@�����X�^�[�}�X�^�[�ɑ΂���@���C�Z���X�������@���{���Ă���܂��B
	ShowMsg_("DEMO_022_MSG_080");
	KeyInputWait_();

	//�e���W�A�u�����ɍ��i���ꂽ�@�����X�^�[�}�X�^�[���@�l���ł���`�J���́@���ド�C�h�B
	ShowMsg_("DEMO_022_MSG_090");
	KeyInputWait_();
	CloseMsgWnd_();
	//=====================================
	WaitTask(task_cam);
	Wait_(20);

	//��������������������������������������
	//���J�b�g4 ����f��
	//��������������������������������������	
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");

	//=====================================
	//�e���W�A�u����́@�����X�^�[�ɏ���ā@��n���삯�����邽�߂́@�`�J���ł��B
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TEREZIA");
	ShowMsg_("DEMO_022_MSG_100");
	KeyInputWait_();

	//�e���W�A�u�s���͈͂��L���ā@�`���̑�������ƂȂ�@���̃`�J���̂��߂Ɂ@���Ё@���Q�����������B
	ShowMsg_("DEMO_022_MSG_110");
	KeyInputWait_();
	CloseMsgWnd_();
	//=====================================
	WaitTask(task_cam);
	Wait_(20);

	//��������������������������������������
	//���J�b�g5 ���Y�[���A�b�v
	//��������������������������������������	
	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004")

	//=====================================
	//�e���W�A�u����́@<name_player/>���܂ɂ́@�b�����N���@���ē������Ă��������܂��B
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TEREZIA");
	ShowMsg_("DEMO_022_MSG_120");
	KeyInputWait_();

	//�e���W�A�u���̔��ւƁ@���i�݂��������B
	ShowMsg_("DEMO_022_MSG_130");
	KeyInputWait_();
	CloseMsgWnd_();

	WaitTask(task_cam);
	//=====================================

	//��������������������������������������
	//���f���I��
	//��������������������������������������

	EndDemo(FADE_COLOR_BLACK);
}