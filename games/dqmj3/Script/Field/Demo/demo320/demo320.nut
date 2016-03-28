//=============================================
//
//		demo320[�A�[�U���[�N�Đ�]
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
	local model_azamuku;
	local player, azamuku;
	local efc_smoke0, efc_smoke1, efc_cam, efc_azamuku;
	local task_azamuku, task_cam;

// �����\�[�X�Ǎ�
	// �L�����N�^�[
	player = GetPlayerId_();					// ��l��
	model_azamuku = ReadNpc_("m204_00");		// �A�[�U���[�N

// ���z�u
	// ��l��
	SetPointPos_(player, "player000");
	// �A�[�U���[�N
	azamuku = ArrangePointNpc_(model_azamuku, "npc_azamuku000");
	SetScaleSilhouette(azamuku, SCALE.AZAMUKU, SILHOUETTE_WIDTH.S);
	
	// �G�t�F�N�g
	LoadEffect_("ef733_01_sym_shuchusen01");				// �W����
	LoadEffect_("ef721_04_nat_smoke_psps");								// ���u�̉��G�t�F�N�g���p�ӂ��ꂽ�炱���ɓ���ĉ�����
	LoadEffect_("ef730_01_oth_dark_aura01");
	efc_azamuku = SetSelectBoneEffectSetOffset_("ef730_01_oth_dark_aura01", azamuku, ATTACH_EFFECT2, Vec3(0.0, -10.0, 0.0));
	
//	���M�~�b�N�ǂݍ���	
	local model_reactor = ReadGimmick_("o_dem_15");					// ���L���̃��A�N�^�[
	local model_daiza = ReadGimmick_("o_I02_19");					// ���A�N�^�[���
	local model_display = ReadGimmick_("o_I02_17");					// �f�B�X�v���C
	
	//=====================================
	//�M�~�b�N�ݒu
	//=====================================
	local reactor = ArrangePointGimmick_("o_dem_15", model_reactor, "obj_reactor000");
	local daiza = ArrangePointGimmick_("o_I02_19", model_daiza, "obj_daiza000");		// ���A�N�^�[���
	local display = ArrangePointGimmick_("o_I02_17", model_display, "display");		// �f�B�X�v���C
	SetMotion_(daiza, MOT_GIMMICK_2, BLEND_N);
// ���J�����ݒ�
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------
	
	efc_smoke0 = SetPointWorldEffect_("ef721_04_nat_smoke_psps", "efc_smoke000");	// ���u�̉��G�t�F�N�g���p�ӂ��ꂽ�炱���ɓ���ĉ�����
	SetEffectScale_(efc_smoke0, 2.0);												// ���u�̉��G�t�F�N�g���p�ӂ��ꂽ�炱���ɓ���ĉ�����
	efc_smoke1 = SetPointWorldEffect_("ef721_04_nat_smoke_psps", "efc_smoke001");	// ���u�̉��G�t�F�N�g���p�ӂ��ꂽ�炱���ɓ���ĉ�����
	SetEffectScale_(efc_smoke1, 2.0);	
	
	StartDemo(FADE_COLOR_BLACK);
	
	Wait_(30);
	
	//===============================================
	//���A�[�U���[�N
	//�u�킴�킴�@����ɖ߂��Ă���Ƃ́I
	//�@�������قǂ́@�����҃f�X�ˁI
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AZAMUKU");
	ShowMsg_("DEMO_320_MSG_010");
	KeyInputWait_();
	//===============================================
	
	task_azamuku = Task_RotateToPos_(azamuku, GetPos_(player), 4);
	
	WaitTask(task_azamuku);
	DeleteTask_(task_azamuku);
	
	//===============================================
	//���A�[�U���[�N
	//�u���L���ւ́@����݂�݁I
	//�@���Ȃ��Ł@���炳���ā@���������f�F�F�F�X�I�I
	//-----------------------------------------------
	ShowMsg_("DEMO_320_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(azamuku, MOT_SPELL_ACTUATE, BLEND_M);							// ��قǃf���p�퓬���[�V�����ɍ����ւ��ĉ�����
		PlaySE_("SE_DEM_123");

	Wait_(23);
	
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");		// 15F
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", 100);			// �W����
		EncountEndDemo(ENCOUNT_BOSS);
	Wait_(10);
	SetMotionSpeed_(azamuku, 0.1);
	//=====================================
	//���퓬�u���[
	//=====================================

	
}
