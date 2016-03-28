//=============================================
//
//		demo219[�����X�^�[�̗H��`�ɔ������郊�A�N�^�[]
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
	local task_cam, task_player, task_poison00, task_poison01, task_poisonFadeOut;
	local efc_player, efc_reactor_light, efc_target_icon;
	local poison_on1 = [0, 0.2, 0.4, 0.6, 0.9];
	local poison_on2 = [90, 4, 3, 2, 1];

// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();					// ��l��
	local model_poison = ReadNpc_("m100_01");		// �|�C�Y���g����
	LoadEffect_("ef732_09_light_reactor_c");		//���A�N�^�[�̌�
	LoadEffect_("ef712_10_emo_surprise01");			//�т�����}�[�N
	
// ���z�u
	// ��l��
	SetPointPos_(player, "player000");
	// �|�C�Y���g����
	local poison = ArrangePointNpc_(model_poison, "npc_poison000");
	SetScaleSilhouette(poison, SCALE.S, SILHOUETTE_WIDTH.S);
	SetAlpha_(poison, ALPHA_HALF);

// ����풓���[�V�����Ǎ�
	local player_look_left_L = ReadMotion_(player, "Player_look_left_L");		//��l����������
	local player_look_right_L = ReadMotion_(player, "Player_look_right_L");		// ��l�� �E������
	
	local poison__hand_L = ReadMotion_(poison, "m100_01_shake_hand_L");			// �|�C�Y���g���� ���U��
	
// ���������[�V�����ݒ�
	SetMotion_(poison, player_look_left_L, BLEND_L);							// ��b
	SetMotion_(poison, MOT_WAIT, BLEND_M);										//���[�V�������Ȃ����ߑҋ@(��Ŋ�т�)
	
// �����Ԑݒ�
	SetTime_(START_TIME_ZONE_NIGHT);
	
// ���J�����ݒ�
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	task_player = Task_AnimeMove_(player, "anm_player000");

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	SetMotion_(player, MOT_WALK, BLEND_M);		//��l������
	task_player = Task_AnimeMove_(player, "anm_player000");
	
	StartDemo(FADE_COLOR_BLACK);
	
	Wait_(47);
	SetMotion_(player, MOT_WAIT, BLEND_M);		//��l���ҋ@
	Wait_(20);
	
	PlaySE_("SE_FLD_135");	//���A�N�^�[�̔���SE
	
	efc_reactor_light = SetSelectBoneEffect_("ef732_09_light_reactor_c", player, ATTACH_EFFECT1);		//���A�N�^�[��;
	SetEffectScale_(efc_reactor_light, 0.5);
	
	Wait_(20);
	DeleteEffectEmitter_(efc_reactor_light);
	
	//===============================================
	//*���A�N�^�[
	// �u�c�c�ڎ��ł��Ȃ��@����ȑ��݂����m�B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_REACTOR");
	ShowMsg_("DEMO_219_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(player, player_look_right_L, BLEND_L);		//��l����������
	Wait_(18);
	SetMotion_(player, player_look_left_L, BLEND_XL);		//��l���E������
	Wait_(20);
	
	PlaySE_("SE_FLD_231");									//���A�N�^�[�N��SE
	LoadLayout_("reactor_frame");
	SetLayoutAnime_("reactor_on", false);					//���A�N�^�[�N��

	SetAlpha_(poison, 0);								// �|�C�Y���g�������l
	local task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	Wait_(110);
	PlaySE_("SE_DEM_018");
	SetAlphaFade(poison,0.9,90);

	Wait_(3);
	SetAlpha_(poison, 0.9);								// �|�C�Y���g�������l
	
	Wait_(31);
	
	efc_target_icon = SetSelectBoneEffect_("ef712_10_emo_surprise01", poison, ATTACH_EFFECT1);		//�т�����}�[�N
	SetEffectScale_(efc_target_icon, 4.0);
	Wait_(5);
	PlaySE_("SE_DEM_053");
	Wait_(30);
	//===============================================
	//*�����X�^�[�̗H��`
	// �u�c�c�c�c�I
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_219_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(poison, poison__hand_L, BLEND_M);		//�|�C�Y���g�������U��
	Wait_(30);
	
	//===============================================
	//*�����X�^�[�̗H��`
	// �u�c�c�c�������@������
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_219_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(poison, MOT_WAIT, BLEND_L);	
	Wait_(10);
	local task_poison00 = Task_RotateToDir_(poison, -90, ROTATE_EVENT_DEF);		//�|�C�Y���g������������
	local task_poison01 = Task_MoveForward_(poison, 2.0, false);				//�|�C�Y���g�������ʂɐi��
	
	Wait_(25);
	
	PlaySE_("SE_FLD_232");														//���A�N�^�[�I��SE
	SetLayoutAnime_("reactor_off", false);										//���A�N�^�[�I��
	
	Wait_(25);
	
	DeleteTask_(task_cam);
	DeleteTask_(task_poison00);
	DeleteTask_(task_poison01);
	
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	
	task_poison01 = Task_AnimeMove_(poison, "anm_poison001");
	
	task_poisonFadeOut = Task_ObjectFadeOut_(poison, 50);						//�H��t�F�[�h����
	PlaySE_("SE_DEM_018");
	WaitTask(task_poisonFadeOut);
	
	//===============================================
	//*�V�X�e�����b�Z�[�W
	// �H��́@����l���̖��O����
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_219_MSG_040");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	//*�V�X�e�����b�Z�[�W
	// �ǂ������ĒT���Ă݂悤�B
	//-----------------------------------------------
	ShowMsg_("DEMO_219_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	EndDemo(FADE_COLOR_BLACK);
}
