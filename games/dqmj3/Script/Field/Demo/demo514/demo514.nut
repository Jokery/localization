//=============================================
//
//		demo514[�`�����N���C�Z���X�l��]
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
	local efc_player,efc_licence;

// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();					// ��l��

// ���z�u
	// ��l��
	SetPointPos_(player, "player000");

// ����풓���[�V�����Ǎ�
	local pl_lookup = ReadMotion_(player, "Player_look_up_L");			//��������đҋ@
	local pl_grip1 = ReadMotion_(player, "Player_r_hand_hold01L");		//�E������� ��
	local pl_grip2 = ReadMotion_(player, "Player_r_hand_hold02L");		//�E������� ��
	
//�G�t�F�N�g�̓ǂݍ���
	LoadEffect_("ef732_06_get_license");								//���C�Z���X�l���G�t�F�N�g
	LoadEffect_("ef712_10_emo_surprise01");								// �u�I�v

	//�����̃��[�V����
	SetMotion_(player, pl_lookup, BLEND_M);								//��������đҋ@


// ���J�����ݒ�
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");	

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);

	WaitTask(task_cam);
	//===============================================
	//*�e���W�A
	// 	�u�����ꂳ�܂ł����[�B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TEREZIA");
	ShowMsg_("DEMO_514_MSG_010");
	KeyInputWait_();
	
	//===============================================
	//*�e���W�A
	// 	�u���Ȃ��́@�`�����N�����Ɂ@���i����܂����B
	//-----------------------------------------------
	
	ShowMsg_("DEMO_514_MSG_020");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	//*�e���W�A
	// 	�u�`�����C�Z���X���@���s�������܂��B
	//-----------------------------------------------
	ShowMsg_("DEMO_514_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	//��������������������������������������
	//���J�b�g2 ��l���Y�[��
	//��������������������������������������	
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	PlaySE_("SE_DEM_028");
	efc_licence = SetSelectBoneEffect_("ef732_06_get_license", player, ATTACH_GLOBAL);		//���C�Z���X�l���G�t�F�N�g
	
	SetMotion_(player, MOT_WAIT, BLEND_N);													//�ҋ@
	Wait_(10);
	SetMotion_(player, pl_grip1, BLEND_XL);													//�E�������
	Wait_(80);
	
	PlayMe_("ME_010");		//�t�@���t�@�[��

	//===============================================
	//*�V�X�e�����b�Z�[�W
	// 	�u<name_player/>�͂`�����C�Z���X���@��ɓ��ꂽ�I
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_514_MSG_040");
	WaitMe_();
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	//===============================================
	//*�e���W�A
	// 	�u�`�����C�Z���X�ł́@�V���Ă���`�J��
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TEREZIA");
	ShowMsg_("DEMO_514_MSG_050");
	SetMotion_(player, pl_grip2, BLEND_XL);													//�E�������
	KeyInputWait_();
	
	//===============================================
	//*�e���W�A
	// 	�u�̌����́@�`���[�g���A�����@���p�ӂ��܂����B
	//-----------------------------------------------
	
	ShowMsg_("DEMO_514_MSG_060");
	KeyInputWait_();
	CloseMsgWnd_();
	EndDemo(FADE_COLOR_BLACK);
}
