//=============================================
//
//		demo040[�G�[�X����̒ʐM�E���b�N�����O_2]
//
//=============================================

function Update()
{

// ���ϐ���`
	local efc_player;

// �����\�[�X�Ǎ�
	//�v���C���[
	local player = GetPlayerId_();
	//�M�~�b�N
	local model_switch000 = ReadGimmick_("o_H00_06");								// �E�B���`���䑕�u
	//�G�t�F�N�g
	LoadEffect_("ef732_09_light_reactor_c");										// ���A�N�^�[����
	
// ���z�u
	SetPointPos_(player, "player000");
	
	local switch000 = ArrangePointGimmick_("o_H00_06", model_switch000, "obj_switch000");
	
// ����풓���[�V�����Ǎ�
	local Player_touch_reactor = ReadMotion_(player, "Player_touch_reactor");		// ��l����������������遨���A�N�^�[��G��
	local Player_touch_reactor_L = ReadMotion_(player, "Player_touch_reactor_L");	// ��l�����A�N�^�[��G��L
	local Player_panel02 = ReadMotion_(player, "Player_panel01");					// ��l���p�l������
	
// ���J�����ݒ�
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	
	SetDirToObject_(player, switch000);

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	efc_player = SetSelectBoneEffect_("ef732_09_light_reactor_c", player, ATTACH_EFFECT1);				// ���A�N�^�[����
	OpenConnectiveWithMotion("connective_ace", player, Player_touch_reactor, Player_touch_reactor_L);	// ���A�N�^�[��G�遨���b�Z�[�W�\��
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_ACE");
		//���I�������Ă������X�C�b�`��
		ShowMsg_("DEMO_040_MSG_010");
		KeyInputWait_();
		CloseMsgWnd_();
	CloseConnective();
	Wait_(5);
	
	SetMotion_(player, MOT_WAIT, BLEND_L);
	Wait_(30);
	
	SetMotion_(player, Player_panel02, BLEND_L);														// ��l���p�l������
	Wait_(20);
	PlaySE_("SE_DEM_029");																				// ��:SE�X�C�b�`
	SetMotion_(player, MOT_WAIT, BLEND_L);
	Wait_(50);
	
	PlaySE_("SE_DEM_030");																				// ��:SE�B�����ɍ~���
	StartEarthQuake_(15, 3, 1);																			// �n�k
	Wait_(70);
	
	DeleteEffect_(efc_player);
	
	efc_player = SetSelectBoneEffect_("ef732_09_light_reactor_c", player, ATTACH_EFFECT1);				// ���A�N�^�[����
	OpenConnectiveWithMotion("connective_ace", player, Player_touch_reactor, Player_touch_reactor_L);	// ���A�N�^�[��G�遨���b�Z�[�W�\��
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_ACE");
		//����ŃJ�S���������͂����I
		ShowMsg_("DEMO_040_MSG_020");
		KeyInputWait_();
		CloseMsgWnd_();
	CloseConnective();
	
	SetMotion_(player, MOT_WAIT, BLEND_L);	
	
	//��������������������������������������
	//���f���I��
	//��������������������������������������
	
	EndDemo(FADE_COLOR_BLACK);
	
}