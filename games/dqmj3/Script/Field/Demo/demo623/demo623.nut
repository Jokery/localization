//=============================================
//
//		demo623[�r�����N���C�Z���X�l��_1]
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
	local task_cam, task_player, task_rena, task_retis;
	local efc_player, efc_rena, efc_cam, efc_retis;

// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();															// ��l��
	local model_rena = ReadNpc_("n007");													// ���i�[�e
	
	// �G�t�F�N�g
	LoadEffect_("ef712_10_emo_surprise01");													// �u�I�v
	LoadEffect_("ef732_13_light_reactor01");												// ���e�B�X�̌��i���A�N�^�[�̌��j
	LoadEffect_("ef732_06_get_license");													// ���C�Z���X�l���G�t�F�N�g
	
	// �M�~�b�N
	local model_base = ReadGimmick_("o_effect_base");										// �G�t�F�N�g�x�[�X

// ���z�u
	// �L�����N�^�[
	SetPointPos_(player, "player000");														// ��l��
	local rena = ArrangePointNpc_(model_rena, "npc_renerte000");							// ���i�[�e
	
	// �M�~�b�N
	local retis = ArrangeGimmick_("o_effect_base", model_base, false);						// ���e�B�X�̌��i�G�t�F�N�g�x�[�X�j
	
// ����풓���[�V�����Ǎ�
	// ��l��
	local player_look_up_L = ReadMotion_(player, "Player_look_up_L");						// ������ҋ@L
	local player_licence01_L = ReadMotion_(player, "Player_licence01_L");					// ���C�Z���X�Q�b�g1
	local player_hand1_L = ReadMotion_(player, "Player_r_hand_hold01L");					// �E�������1�@��
	local player_hand2_L = ReadMotion_(player, "Player_r_hand_hold02L");					// �E�������2�@��
	local player_sup = ReadMotion_(player, "Player_surprise");								// ����
	local player_sup_L = ReadMotion_(player, "Player_surprise_L");							// ����L
	local player_nod = ReadMotion_(player, "Player_nod");									// ���ȂÂ�
	
	// ���i�[�e
	local rena_look_up_L = ReadMotion_(rena, "n007_look_up_L");								// ������ҋ@L	
	local rena_talk = ReadMotion_(rena, "n007_talk01");										// ��b�J�n�i������ɂ��Ă�j
	local rena_talk_L = ReadMotion_(rena, "n007_talk01_L");									// ��bL�i������ɂ��Ă�j
	local rena_show01 = ReadMotion_(rena, "n007_show01");									// �ҋ@��������̍����ʂ܂ŏグ��
	local rena_show_L = ReadMotion_(rena, "n007_show_L");									// ������̍����ʂ܂ŏグ��L
	local rena_show02 = ReadMotion_(rena, "n007_show02");									// ������̍����ʂ܂ŏグ�遨�ҋ@
	local rena_nod = ReadMotion_(rena, "n007_nod");											// ���ȂÂ�
	local rena_show_send_L = ReadMotion_(rena, "n007_show_send_L");							// ������̍����ʂ܂ŏグ�O�֏o��L

// ���������[�V����
	SetMotion_(rena, MOT_WALK, BLEND_N);													// ���i����
	SetMotion_(player, MOT_WALK, BLEND_N);													// ��@����
	
	
//����
	SetStepSe_(rena, "SE_FLD_016");

// ���J�����ݒ�
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------
	task_player = Task_MoveForward_(player, 1.2, false);
	StartDemo(FADE_COLOR_BLACK);
	
	//��������������������������������������
	//���J�b�g1 ���i�̂��o�}��
	//��������������������������������������
	Wait_(50);
	SetMotion_(player, MOT_WAIT, BLEND_L);									// ��@�ҋ@
	DeleteTask_(task_player);
	
	local pos = Vec3(0, 0, 0);
	efc_player = SurpriseDispSetOffset(player, pos, 1.0);					// [!]
	task_rena = Task_MoveForward_(rena, 0.8, false);

	Wait_(55);
	
	SetMotion_(rena, MOT_WAIT, BLEND_XL);									// ���i�ҋ@
	DeleteTask_(task_rena);
	Wait_(50);

	//��������������������������������������
	//���J�b�g2 ���i�@��
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");
	Wait_(10);
	SetMotion_(rena, rena_talk, BLEND_L);									// ���i�b��
	WaitMotion(rena);
	SetMotion_(rena, rena_talk_L, BLEND_M);
	//===============================================
	// *���i�[�e
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_623_MSG_010");											// �u���߂łƂ��c�c<name_player/>�B
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(rena, MOT_WAIT, BLEND_XL);									// ���i�ҋ@
	WaitTask(task_cam);
	Wait_(20);	
	//===============================================
	// *�e���W�A
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TEREZIA");	
	ShowMsg_("DEMO_623_MSG_020");	// �u����ł́@<name_player/>���܂�
	
	SetMotion_(player, player_look_up_L, BLEND_XL);							// ��@��ҋ@
	SetMotion_(rena, rena_look_up_L, BLEND_XL);								// ���i��ҋ@
	
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	Wait_(30);
	SetMotion_(rena, MOT_WAIT, BLEND_XL);									// ���i�ҋ@
	SetMotion_(player, MOT_WAIT, BLEND_XL);									// ��@�ҋ@
	Wait_(40);
	SetMotion_(rena, rena_nod, BLEND_L);									// ���i���ȂÂ�
	SetMotion_(player, player_nod, BLEND_L);								// ��@���ȂÂ�
	WaitMotion(rena);
	WaitMotion(player);
	SetMotion_(rena, MOT_WAIT, BLEND_XL);
	SetMotion_(player, MOT_WAIT, BLEND_XL);									// ��@�ҋ@
	Wait_(30);
	DeleteTask_(task_cam);

	//��������������������������������������
	//���J�b�g3 ��@���C�Z���X�Q�b�g
	//��������������������������������������

	SetPointPos_(player, "player001");										// ��l���ړ�
	SetPointPos_(rena, "npc_renerte001");									// ���i�ړ�
	SetVisible(rena, false);
	
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	
	PlaySE_("SE_DEM_028");
	efc_player = SetSelectBoneEffect_("ef732_06_get_license", player, ATTACH_GLOBAL);		// ���C�Z���X�l���G�t�F�N�g
	
	Wait_(90);
	SetMotion_(player, player_hand1_L, BLEND_XL);											// ��@�E�������

	//===============================================
	// *�V�X�e�����b�Z�[�W
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_623_MSG_030");															// <name_player/>�͂r�����C�Z���X���@��ɓ��ꂽ�I
	PlayMe_("ME_010");
	WaitMe_();
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	WaitTask(task_cam);
	SetMotion_(player, MOT_WAIT, BLEND_XL);													// ��@�ҋ@
	
	//===============================================
	// *�e���W�A
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TEREZIA");	
	ShowMsg_("DEMO_623_MSG_040");															// �u�r�����C�Z���X�ł́@�����n��`�J��
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	Wait_(30);
	
	//��������������������������������������
	//���J�b�g4 ��@���e�B�X�Q�b�g
	//��������������������������������������
	SetVisible(rena, true);
	SetMotion_(rena, MOT_WAIT, BLEND_N);													// ���i�ҋ@
	SetDir_(player, 165);
	
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	
	//===============================================
	// *���i�[�e
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_623_MSG_050");	// �u�����ā@������󂯎���Ăق����c�c�B
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(rena, rena_show01, BLEND_M);													// ���i�@������̍����ʂ܂ŏグ��
	WaitMotion(rena);
	SetMotion_(rena, rena_show_L, BLEND_M);
	
	SetPointPosNoFit_(retis, "obj_retis000");												// ���e�B�X�o�Ă���
	efc_retis = SetSelectBoneEffect_("ef732_13_light_reactor01", retis, ATTACH_GLOBAL);
	SetEffectScale_(efc_retis, 0.2);
	PlaySE_("SE_DEM_160");
	Wait_(50);

	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");								// �A�j���ɐ؂�ւ�
	task_retis = Task_AnimeMoveNoFit_(retis, "anm_retis000");
	Wait_(11);
	SetMotion_(rena, rena_show_send_L, 31);
	WaitTask(task_cam);
	WaitTask(task_retis);
	Wait_(10);
	//===============================================
	//���t���b�V���̂悤�ȃt�F�[�h�A�E�g
	SetFade_(FADE_OUT, FADE_COLOR_WHITE, 10);
	Wait_(20);
	SetFade_(FADE_IN, FADE_COLOR_WHITE, 30);
	//===============================================
	
	//===============================================
	// *�V�X�e�����b�Z�[�W
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_623_MSG_060");															// �u���e�B�X�@��ɓ��ꂽ
	PlayMe_("ME_010");
	WaitMe_();
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	DeleteEffectEmitter_(efc_retis); 
	
	Wait_(50);
	
	EndDemo(FADE_COLOR_BLACK);
}
