//=============================================
//
//		demo319[��]�̐���_2(�퓬�O)]
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
	local player, azamuku;
	local model_azamuku;
	local Player_battle_L;
	local efc_obj000, efc_cam, efc_smoke000, efc_smoke001, efc_azamuku;
	local task_player, task_azamuku, task_cam;

// �����\�[�X�Ǎ�
	// �L�����N�^�[
	player = GetPlayerId_();														// ��l��
	model_azamuku = ReadNpc_("m204_00");											// �A�[�U���[�N
	
	// �M�~�b�N
	local model_reactor = ReadGimmick_("o_dem_15");									// ���L���̃��A�N�^�[
	local model_daiza = ReadGimmick_("o_I02_19");									// ���A�N�^�[���
	local model_display = ReadGimmick_("o_I02_17");									// �f�B�X�v���C
	
	// �G�t�F�N�g
	LoadEffect_("ef733_01_sym_shuchusen01");										// �W����
	LoadEffect_("ef721_04_nat_smoke_psps");											// ���u�̉��G�t�F�N�g���p�ӂ��ꂽ�炱���ɓ���ĉ�����
	LoadEffect_("ef730_01_oth_dark_aura01");
	
// ���z�u
	SetPointPos_(player, "player000");													// ��l��
	azamuku = ArrangePointNpc_(model_azamuku, "npcazamuku000");							// �A�[�U���[�N

// ����풓���[�V�����Ǎ�
	Player_battle_L = ReadMotion_(player, "Player_battle01_L");							// �퓬�ҋ@
	local azamuku_down_think = ReadMotion_(azamuku, "m204_00_spread_hand_L");			// �A�[�U�[���[�N ������L����

// ���M�~�b�N�ݒu
	local reactor = ArrangePointGimmick_("o_dem_15", model_reactor, "obj_reactor000");	// ���L���̃��A�N�^�[
	local daiza = ArrangePointGimmick_("o_I02_19", model_daiza, "obj_daiza000");		// ���A�N�^�[���
	SetMotion_(daiza, MOT_GIMMICK_2, BLEND_N);
	local display = ArrangePointGimmick_("o_I02_17", model_display, "display");			// �f�B�X�v���C
	
// �� �����̃��[�V����
	SetMotion_(player, Player_battle_L, BLEND_M);
	efc_azamuku = SetSelectBoneEffectSetOffset_("ef730_01_oth_dark_aura01", azamuku, ATTACH_EFFECT2, Vec3(0.0, -10.0, 0.0));
	
// ���J�����ݒ�
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------
	
	efc_smoke000 = SetPointWorldEffect_("ef721_04_nat_smoke_psps", "efc_smoke000");	// ���u�̉�
	SetEffectScale_(efc_smoke000, 3.0);												
	efc_smoke001 = SetPointWorldEffect_("ef721_04_nat_smoke_psps", "efc_smoke001");	// ���u�̉�
	SetEffectScale_(efc_smoke001, 2.0);												

	SetScaleSilhouette(azamuku, SCALE.AZAMUKU, SILHOUETTE_WIDTH.S);

	StartDemo(FADE_COLOR_BLACK);
	
	Wait_(35);
	
	//===============================================
	//���A�[�U���[�N
	//�u���Ȃ������^�N�V���@�΂��Ƃ����̃f�X���I�H
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AZAMUKU");
	ShowMsg_("DEMO_319_MSG_010");
	KeyInputWait_();
	//===============================================
	
	task_azamuku = Task_RotateToPos_(azamuku, GetPos_(player), 3.4);
	
	WaitTask(task_azamuku);
	DeleteTask_(task_azamuku);
	
	//===============================================
	//���A�[�U���[�N
	//�u���W�X�^���X�̊�]���@�B����Ă���ƕ���
	//�@�m�R�m�R����Ă��ā@���̎n���c�c�I
	//-----------------------------------------------
	ShowMsg_("DEMO_319_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	//��������������������������������������
	//���J�b�g�Q
	//��������������������������������������
	
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");		// 60F
	
	SetMotion_(azamuku, azamuku_down_think, BLEND_L);				// �A�[�U�[���[�N ������L����
	
	Wait_(10);
	//===============================================
	//���A�[�U���[�N
	//�u����ł́@���ω��ł͂Ȃ��@���m���f�X��I
	//�@���̂�@���L���I�@�f���ċ����܂���I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AZAMUKU");
	ShowMsg_("DEMO_319_MSG_030");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	//���A�[�U���[�N
	//�u���W�X�^���X�c�c���L���̒��Ԃ��Ƃ����Ȃ�
	//�@���Ȃ����@�������Ă͋A���܂���I
	//-----------------------------------------------
	ShowMsg_("DEMO_319_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	WaitTask(task_cam);	

	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");		// 15F
		
	SetMotion_(azamuku, MOT_SPELL_ACTUATE, BLEND_M);				// �A�[�U�[���[�N �퓬
	PlaySE_("SE_DEM_123");
	Wait_(30);
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", 100);			// �W����
	Wait_(5);
	
	SetMotionSpeed_(azamuku, 0.2);
	//=====================================
	//���퓬�u���[
	//=====================================
	EncountEndDemo(ENCOUNT_BOSS);
	
}
