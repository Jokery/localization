//=============================================
//
//		demo008[�y������̒E�o_2(����)]
//
//=============================================

//-------------------------------------------------------------------------
//
//		�ǂݍ��݁E�z�u
//
//-------------------------------------------------------------------------
function Update()
{
// ���_�~�[���b�Z�[�W
//	DummyMsg();

// ���ϐ���`
	local task_cam, task_player;
	local efc_player;

// �����f���Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();					// ��l��
	// ���C�A�E�g
	LoadLayout_("op_title");

// ���z�u
	// ��l��
	SetPointPos_(player, "player000");
	SetFace_(player, "Face_eyes_close");
	SetStepSe_(player, SILENT_STEP_SE);				// �����𖳉��ɂ���

// ����풓���[�V�����ǂݍ���
	local player_touch_reactor_L = ReadMotion_(player, "Player_touch_reactor_L");			// ���A�N�^�[��G��
	local player_look_walk_L = ReadMotion_(player, "Player_look_walk_L");					// �L�����L��������
	
// ���G�t�F�N�g�ǂݍ���
	LoadEffect_("ef732_09_light_reactor_c");		// ���A�N�^�[����
	
//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------
	
// ���J�����ݒ�
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

	// ���J�����P---------------------
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	Wait_(6);
	local task_step = Task_ChangeStepSe(player, "SE_FLD_014", 20);
	Wait_(12);
	
	// ���������[�V�����ݒ�
	SetMotion_(player, player_look_walk_L, BLEND_N);
	task_player = Task_MoveForward_(player, 1.0, false);
	
	PlaySE_("SE_DEM_232");
	StartDemo(FADE_COLOR_WHITE);
	
	Wait_(60);
	SetMotion_(player, MOT_WAIT, BLEND_L);
	DeleteTask_(task_player);
	Wait_(10);
	DeleteTaskStepSe(player, task_step);
	Wait_(40);
	//���邢�Ƃ���ɏo�銴���ɔ��t�F�[�h
	SetFade_(FADE_OUT, FADE_COLOR_WHITE, 30);
	WaitFade_();
	Wait_(10);
	
	//�������Љ�p�̃J�����ɐ؂�ւ�
	DeleteTask_(task_cam);

	SetMotion_(player, MOT_WAIT, 1);
	
	//�Љ�J�b�g�@
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");		// 100F

	Wait_(5);

	SetFade_(FADE_IN, FADE_COLOR_WHITE, 10);
	PlayBgm_("BGM_012");
	WaitFade_();
	Wait_(75);
	
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 20);
	WaitFade_();
	DeleteTask_(task_cam);

	//�Љ�J�b�g�A
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");		// 130F

	Wait_(5);

	SetFade_(FADE_IN, FADE_COLOR_BLACK, 10);
	WaitFade_();
	Wait_(95);
	
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 20);
	WaitFade_();
	DeleteTask_(task_cam);

	//�Љ�J�b�g�B
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");		// 140F

	Wait_(5);
	
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 20);
	WaitFade_();

	Wait_(90);
	
	SetLayoutAnime_("title", false);		// �^�C�g�����S
	WaitLayoutAnime();
	SetLayoutAnime_("title_loop", false);		// �^�C�g�����S	
	Wait_(100);
	SetLayoutAnime_("title_out", false);		// �^�C�g�����S
	Wait_(30);
		
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 60);
	WaitFade_();
	Wait_(30);
	
	DeleteTask_(task_cam);
	
	SetPointPos_(player, "player001");
	
	//��l���p���A�b�v
	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);
	WaitFade_();
	Wait_(50);

	PlaySE_("SE_FLD_135");		// ���A�N�^�[������
	efc_player = SetSelectBoneEffect_("ef732_09_light_reactor_c", player, ATTACH_EFFECT1);	// ���A�N�^�[����
	SetEffectScale_(efc_player, 0.5);

	Wait_(20);
	SetFace_(player, "Face_left");	
	Wait_(10);	
	DeleteTask_(task_cam);
	
	//��l���Y�[��
	task_cam = Task_AnimeMoveCamera_("anmeye005", "anmtgt005");
	
	SetMotion_(player, player_touch_reactor_L, 20);		// ���A�N�^�[�ɐG��
	Wait_(30);
	
	DeleteTask_(task_cam);
	
	EndDemo(FADE_COLOR_BLACK);
	
}