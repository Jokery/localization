//=============================================
//
//		demo425[�A���Z�X�̍Ō�_3]
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
	local efc_player;

// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();					// ��l��

// ���z�u
	// ��l��
	SetPointPos_(player, "player000");
	
	//�f�B�X�v���C
	local model_o_S02_23 = ReadGimmick_("o_S02_23");
	local gmc_o_S02_23 = ArrangePointGimmick_("o_S02_23", model_o_S02_23, "obj_display000");
	SetVisible(gmc_o_S02_23, false);

// ����풓���[�V�����Ǎ�
	

// ���J�����ݒ�
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");	
	
	LoadEffect_("ef732_09_light_reactor_c");

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	SetMotion_(gmc_o_S02_23, MOT_GIMMICK_0, BLEND_N);
	SetAlpha_(gmc_o_S02_23, 1);
	SetVisible(gmc_o_S02_23, true);
	Wait_(10);
	StartDemo(FADE_COLOR_WHITE);

	Wait_(30);

	SetMotion_(gmc_o_S02_23, MOT_GIMMICK_0, BLEND_N);
	PlaySE_("SE_FLD_135");																			// ���A�N�^�[������
	local light = SetSelectBoneEffect_("ef732_09_light_reactor_c", player, ATTACH_EFFECT1);			//���A�N�^�[����		
	Wait_(30);

	//===============================================
	// �����A�N�^�[
	// �u��~�����ړ����u�̑��݂��@�m�F���܂����B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_REACTOR");
	ShowMsg_("DEMO_425_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	Wait_(30);
	StartEarthQuake_(60, 3.5, 0.3)
	PlayLoopSE_("SE_DEM_013");
	Wait_(30);
	StopLoopSE_(30);
	//...........................................................................
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);					//�t�F�[�h�A�E�g
	WaitFade_();
	Wait_(10);
	LoadLayout_("w_map");
	SetLayoutAnime_("move_04", false);
	Wait_(30);
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);					//�t�F�[�h�C��
	//...........................................................................
	Wait_(50);
	PlaySE_("SE_DEM_181");
	Wait_(100);
	PlaySE_("SE_DEM_178");
	WaitLayoutAnime();
	
	SetAlpha_(gmc_o_S02_23, 0.8);
	Wait_(3);
	SetAlpha_(gmc_o_S02_23, 0.6);
	Wait_(3);
	SetAlpha_(gmc_o_S02_23, 0.4);
	Wait_(3);
	SetAlpha_(gmc_o_S02_23, 0.2);
	Wait_(3);
	SetVisible(gmc_o_S02_23, false);
	
	Wait_(30);
	
	EndDemo(FADE_COLOR_BLACK);
}
