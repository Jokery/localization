//=============================================
//
//		demo208[�u���h���h�Đ�]
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
	local player, bundorudo;
	local model_bundorudo;
	local Player_battle_L, Player_run_battle;
	local task_player, task_cam;
	local efc_cam, efc_bun;

// �����\�[�X�Ǎ�
	// �L�����N�^�[
	player = GetPlayerId_();					// ��l��
	model_bundorudo = ReadNpc_("m203_00");		// �u���h���h
	// �G�t�F�N�g
	LoadEffect_("ef733_01_sym_shuchusen01");	// �W����
	LoadEffect_("ef730_01_oth_dark_aura01");	// �܂��܂������I�[��

// ���z�u
	// ��l��
	SetPointPos_(player, "player000");
	// �u���h���h
	bundorudo = ArrangePointNpc_(model_bundorudo, "npc_bundorudo000");
	SetScaleSilhouette(bundorudo, SCALE.M, SILHOUETTE_WIDTH.M);
	efc_bun = SetSelectBoneEffectSetOffset_("ef730_01_oth_dark_aura01", bundorudo, ATTACH_EFFECT2, Vec3(0.0, -5.0, 0.0));		//���I�[��

// ����풓���[�V�����Ǎ�
	Player_battle_L = ReadMotion_(player, "Player_battle_L");		//�퓬�ҋ@
	Player_run_battle = ReadMotion_(player, "Player_run_battle");	//�퓬�ҋ@
	
	//�����̃��[�V����
	SetMotion_(bundorudo, MOT_WAIT, BLEND_M);

// �����Ԑݒ�
	SetTime_(START_TIME_ZONE_NIGHT);
	
// ���J�����ݒ�
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	SetMotion_(player, Player_run_battle, BLEND_L);	// ���聨�퓬�ҋ@
	
	task_player = Task_MoveForward_(player, 0.5, true);
	
	Wait_(20);
	
	DeleteTask_(task_player);
	
	SetMotion_(player, Player_battle_L, BLEND_M);
	
	Wait_(40);
	
	//��������������������������������������
	//���J�b�g2
	//��������������������������������������
	
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");

	//===============================================
	//*�u���h���h
	//�u�L���������c�c�������g���ĒT���o����Ԃ��@�͂Ԃ����悤�ŃX�B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BUNDORUDO");
	ShowMsg_("DEMO_208_MSG_010");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	//*�u���h���h
	// �u�����I�@���x�����@���ƂȂ����@���ɂȃT�C�I

	//-----------------------------------------------
	ShowMsg_("DEMO_208_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	WaitTask(task_cam);
	SetMotion_(bundorudo, MOT_SWORD_ACTUATE, BLEND_L);			//�퓬�J�n���[�V�������P
	PlaySE_("SE_DEM_106");
	Wait_(36);	
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	
	SetMotionSpeed_(bundorudo, 0.8);
	
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", 100);		// �W����
	
	
	//=====================================
	//���퓬�u���[
	//=====================================
	EncountEndDemo(ENCOUNT_BOSS);
	
}
