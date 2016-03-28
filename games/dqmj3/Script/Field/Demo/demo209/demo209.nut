//=============================================
//
//		demo209[�u���h���h�폟��]
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
	local efc_bundorudo000, efc_bundorudo001, efc_player;
	local task_cam, task_player, task_bundorudo;

// �����\�[�X�Ǎ�
	// �L�����N�^�[
	local player = GetPlayerId_();						// ��l��
	local model_bundorudo = ReadNpc_("m203_00");		// �u���h���h
	// �G�t�F�N�g
	LoadEffect_("ef721_03_nat_smoke_n03");
	LoadEffect_("ef741_01_div_nor_death");
	LoadEffect_("ef712_10_emo_surprise01");				// �u�I�v
	// �M�~�b�N
	local model_reactor = ReadGimmick_("o_dem_07");		// ���A�N�^�[


// ���z�u
	// ��l��
	SetPointPos_(player, "player000");
	// �u���h���h
	local bundorudo = ArrangePointNpc_(model_bundorudo, "npc_bundorudo000");
	SetScaleSilhouette(bundorudo, SCALE.M, SILHOUETTE_WIDTH.M);
	SetManualCalcAlpha_(bundorudo, true);
	// ���A�N�^�[
	local reactor = ArrangePointGimmick_("o_dem_07", model_reactor, "obj_reactor000");

// ����풓���[�V�����Ǎ�
	local player_battle_L = ReadMotion_(player, "Player_battle_L");				// �퓬�ҋ@
	local player_look_around_L = ReadMotion_(player, "Player_look_around_L");	// ��l���L�����L����
	local player_look_left_L = ReadMotion_(player, "Player_look_left_L");		// ��l�����������������
	
	local bundorudo_down_L = ReadMotion_(bundorudo, "m203_00_down_L");			// �����L
	local bundorudo_death = ReadMotion_(bundorudo, "m203_00_death");			// ����������S

// �����Ԑݒ�
	SetTime_(START_TIME_ZONE_NIGHT);
	
// ���J�����ݒ�
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------
	//��������������������������������������
	//���J�b�g1�@�u���h���h����
	//��������������������������������������

	SetMotion_(player, player_battle_L, BLEND_N);
	SetMotion_(bundorudo, bundorudo_down_L, BLEND_N);
	
	StartDemo(FADE_COLOR_BLACK);
	
	Wait_(20);
	
	//===============================================
	//*�u���h���h
	//�u�_�c�c�_���Ȃ̂ŃX�c�c�B�@���O���@���̐�Ɂ@�s������킯�ɂ́c�c�B
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BUNDORUDO");
	ShowMsg_("DEMO_209_MSG_010");
	KeyInputWait_();
	
	//===============================================
	//*�u���h���h
	// �u���O���@���W�X�^���X�́@�����c��Ɓ@�����Ȃǁc�c�����܃Z���c�c�B
	//-----------------------------------------------
	ShowMsg_("DEMO_209_MSG_020");
	KeyInputWait_();
	
	//===============================================
	//*�u���h���h
	// �u�����̕X���Ɂ@�����������L���Ɓ@��킹��킯�ɂ́@�����Ȃ��̂ŃX�c�c�B
	//-----------------------------------------------
	ShowMsg_("DEMO_209_MSG_030");
	KeyInputWait_();

	//===============================================
	//*�u���h���h
	// �u���������c�c�z���@�����̕X���ւƁ@���������Ɓc�c�~�߂��܂���ł����c�c�B
	//-----------------------------------------------
	ShowMsg_("DEMO_209_MSG_040");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	//*�u���h���h
	//�u���c�������������������c�c�c�c�I
	//-----------------------------------------------
	ShowMsg_("DEMO_209_MSG_050");
	
	Wait_(5);
	
	SetMotion_(bundorudo, bundorudo_death, BLEND_L);
	PlaySE_("SE_DEM_107");
	SetMotionSpeed_(bundorudo, 0.9);
	Wait_(43);
	PlaySE_("SE_FLD_168");

	Wait_(8);
	
//	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	efc_bundorudo000 = SetPointWorldEffect_("ef721_03_nat_smoke_n03", "npc_bundorudo000");
	SetEffectScale_(efc_bundorudo000, 1.7);
	
	StartDecayEarthQuake_(20, 4, 2)
	
	Wait_(45);
	
	efc_bundorudo001 = SetPointWorldEffect_("ef741_01_div_nor_death", "npc_bundorudo000");
	SetEffectScale_(efc_bundorudo001, 2.0);

	PlaySE_("SE_DEM_010");
	
	task_bundorudo = Task_ObjectFadeOut_(bundorudo, 20);
	
	Wait_(50);

	
	//��������������������������������������
	//���J�b�g2�@��l���A�b�v
	//��������������������������������������
	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");
	
	SetPointPos_(player, "player001");
	
	SetMotion_(player, MOT_WAIT, BLEND_L);
	
	Wait_(30);
	
	SetMotionSpeed_(player, 1.5);	// ���[�V�����������Ȃ�
	SetMotion_(player, player_look_around_L, 19);
	Wait_(3);
	SetFace_(player, "Face_right");	
	Wait_(22);
	SetFace_(player, "Face_left");	
	Wait_(25);	

	efc_player = SetSelectBoneEffectSetOffset_("ef712_10_emo_surprise01", player, ATTACH_EFFECT1, Vec3(0.0, 3.0, 0.0));
	SetEffectScale_(efc_player, 0.415);
	PlaySE_("SE_DEM_053");
	SetMotionSpeed_(player, 1);	// ���[�V�����߂�
	SetFace_(player, "Face_default");	
	SetMotion_(player, player_look_left_L, BLEND_M);			//��l��������
	
	Wait_(80);
	
	//��������������������������������������
	//���J�b�g3�@���j�^�A�b�v
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");	// 125F
	
	WaitTask(task_cam);
	
	Wait_(40);
	
	//��������������������������������������
	//���J�b�g4�@���郊�A�N�^�[
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");	// 90F
	
	WaitTask(task_cam);
	
	Wait_(20);
	
	SetMotion_(reactor, MOT_GIMMICK_1, BLEND_M);
	PlaySE_("SE_DEM_055");
	Wait_(50);
	SetMotion_(reactor, MOT_GIMMICK_2, BLEND_M);
	
	Wait_(85);

	EndDemo(FADE_COLOR_BLACK);

}
