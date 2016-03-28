//=============================================
//
//		demo321[�A�[�U���[�N�폟��]
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
	local player, azamuku, reactor;
	local efc_reactor, efc_azamuku, efc_smoke0, efc_smoke1, efc_cam, efc_dead ,efc_feather;
	local task_cam;

// �����\�[�X�Ǎ�
	// �L�����N�^�[
	player = GetPlayerId_();						// ��l��
	local model_azamuku = ReadNpc_("m204_00");		// �A�[�U���[�N
	
	// �G�t�F�N�g
	LoadEffect_("ef741_01_div_nor_death");
	LoadEffect_("ef733_01_sym_shuchusen01");								// �W����
	LoadEffect_("ef831_06_black_feather");							// ���H
	LoadEffect_("ef721_06_nat_smoke_s02");							// ���u�̉��G�t�F�N�g���p�ӂ��ꂽ�炱���ɓ���ĉ�����
	LoadEffect_("ef721_03_nat_smoke_n03");							// �A�U�[���[�N�|�ꂽ���̚��G�t�F�N�g
	LoadEffect_("ef732_09_light_reactor_c");						// ���A�N�^�[����

	// �M�~�b�N
	local model_reactor = ReadGimmick_("o_dem_15");					// ���L���̃��A�N�^�[
	local model_tenmetu = ReadGimmick_("o_I02_16");					// ���䑕�u�̓_��
	local model_display = ReadGimmick_("o_I02_17");					// �f�B�X�v���C���
	local model_daiza = ReadGimmick_("o_I02_19");					// ���A�N�^�[���

	// ���C�A�E�g
	LoadLayout_("black");
	
// ���z�u
	// ��l��
	SetPointPos_(player, "player000");
	// �A�[�U���[�N
	azamuku = ArrangePointNpc_(model_azamuku, "npc_azamuku000");
	SetScaleSilhouette(azamuku, SCALE.AZAMUKU, SILHOUETTE_WIDTH.S);
	
	// �G�t�F�N�g
	efc_smoke0 = SetPointWorldEffect_("ef721_06_nat_smoke_s02", "efc_smoke000");	// ���u�̉��G�t�F�N�g���p�ӂ��ꂽ�炱���ɓ���ĉ�����
	SetEffectScale_(efc_smoke0, 2.0);					
	efc_smoke1 = SetPointWorldEffect_("ef721_06_nat_smoke_s02", "efc_smoke001");	// ���u�̉��G�t�F�N�g���p�ӂ��ꂽ�炱���ɓ���ĉ�����
	SetEffectScale_(efc_smoke1, 2.0);	
	
	// �M�~�b�N�ݒu
	reactor = ArrangePointGimmick_("o_dem_15", model_reactor, "obj_reactor000");		// ���A�N�^�[
	local display = ArrangePointGimmick_("o_I02_17", model_display, "obj_display000");	// �f�B�X�v���C���
	local tenmetu = ArrangePointGimmick_("o_I02_16", model_tenmetu, "obj_tenmetu000");	//���䑕�u�̓_��
	local daiza = ArrangePointGimmick_("o_I02_19", model_daiza, "obj_daiza000");		// ���A�N�^�[���
	SetMotion_(daiza, MOT_GIMMICK_2, BLEND_N);

// ����풓���[�V�����Ǎ�
	// ��l��
	local Player_battle_L = ReadMotion_(player, "Player_battle_L");				// �퓬�ҋ@

	// �A�[�U���[�N
	local aza_g_wait = ReadMotion_(azamuku, "m204_00_g_wait_L");			// �n��ҋ@L
	local aza_ret = ReadMotion_(azamuku, "m204_00_retreat");				// �ジ����
	local aza_ret_L = ReadMotion_(azamuku, "m204_00_retreat_L");			// �ジ����L
	local aza_ret_fly = ReadMotion_(azamuku, "m204_00_retreat_fly");		// �ジ���遨���֏オ��
	local aza_damage_L = ReadMotion_(azamuku, "m204_00_damage_L");			// ����
	local aza_die = ReadMotion_(azamuku, "m204_00_die");					// ���������S
	local aza_die_L = ReadMotion_(azamuku, "m204_00_die_L");				// ���SL
	local aza_hurry_L = ReadMotion_(azamuku, "m204_00_hurry_L");			// �ł�L
	local aza_spr_hand = ReadMotion_(azamuku, "m204_00_spread_hand");		// �ҋ@��������L����
	local aza_spr_hand_L = ReadMotion_(azamuku, "m204_00_spread_hand_L");	// ������L����L

	// �����̃��[�V����
	SetMotion_(player, Player_battle_L, BLEND_N);
	SetMotion_(azamuku, aza_g_wait, BLEND_N);

	
// ���J�����ݒ�
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------
	//��������������������������������������
	//���J�b�g�P
	//��������������������������������������
	SetMotion_(azamuku, aza_ret, BLEND_L);
	StartDemo(FADE_COLOR_BLACK);
	WaitMotion(azamuku);
	SetMotion_(azamuku, aza_ret_L, BLEND_L);

	Wait_(30);

	//===============================================
	//���A�[�U���[�N
	//�u�ʁc�c�ʂ��������c�c�I
	//�@�s�k�����Ƃ����̂ł����I�@���̃��^�N�V���I�H
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AZAMUKU");
	ShowMsg_("DEMO_321_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	Wait_(20);
	
	//��������������������������������������
	//���J�b�g2�@�A�U�A�b�v
	//��������������������������������������
	SetMotionSpeed_(azamuku, 4);											// ���[�V�����������Ȃ�
	SetMotion_(azamuku, aza_hurry_L, BLEND_N)									// �A�U�@�ł�
	
	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");
	PlaySE_("SE_DEM_026");	// ��SE:�W����
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", 100);					// �W����

	//===============================================
	//���A�[�U���[�N
	//�u����́c�c�����́@�ԈႢ�f�F�F�X�I
	//�@���^�N�V���@����Ȃ��ƂŁ@�I���͂����c�c�I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AZAMUKU");
	ShowMsg_("DEMO_321_MSG_020");
	KeyInputWait_();
	//===============================================

	//��������������������������������������
	//���J�b�g3�@�A�U����
	//��������������������������������������

	SetMotionSpeed_(azamuku, 2.5);											// ���[�V���������������

	//===============================================
	//���A�[�U���[�N
	//�u���c�c����f�F�F�X�I�@���ɂ����Ȃ��I
	//�@���������������@�_�[�N�}�X�^�[���c�c�܂��I
	//-----------------------------------------------
	ShowMsg_("DEMO_321_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	DeleteEffectEmitter_(efc_cam);
	SetMotionSpeed_(azamuku, 2.0);											// ���[�V�������񂾂�������
	PlaySE_("SE_DEM_124");

	Wait_(20);
	SetMotionSpeed_(azamuku, 1.5);											// ���[�V�����������
	Wait_(20);
	
	SetMotionSpeed_(azamuku, 0.5);

	SetMotion_(azamuku, aza_die, BLEND_XL);

	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	Wait_(45);
	StartDecayEarthQuake_(20, 4, 3); 														// �U��

	efc_azamuku = SetSelectBoneEffectSetOffset_("ef721_03_nat_smoke_n03", azamuku, ATTACH_GLOBAL, Vec3(0.0, 0.0, 0.0));	// ��
	SetEffectScale_(efc_azamuku, 1.2);
	efc_feather = SetSelectBoneEffectSetOffset_("ef831_06_black_feather", azamuku, ATTACH_GLOBAL, Vec3(0.0, 0.0, 0.0));	// �H
	SetMotion_(azamuku, aza_die_L, BLEND_L);
	

	WaitTask(task_cam);
	Wait_(20);
	efc_dead = SetBoneEffect_("ef741_01_div_nor_death", azamuku);
	SetEffectScale_(efc_dead, 1.5);
	PlaySE_("SE_DEM_010");

	for (local i=1; i <= 10; i++) {
		SetAlpha_(azamuku, ALPHA_EXIST - (i * 0.1));
		Wait_(2);
	}

	Wait_(70)
	//��������������������������������������
	//���J�b�g4
	//��������������������������������������
	
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	
	WaitTask(task_cam);
	PlaySE_("SE_FLD_135");																	// ������
	efc_reactor = SetPointWorldEffect_("ef732_09_light_reactor_c", "obj_reactor000");		// ���A�N�^�[�N���G�t�F�N�g
	SetEffectScale_(efc_reactor, 0.5);
	Wait_(60);
	//===============================================
	//*���L���̃��A�N�^�[
	//<name_player/>��
	//�A�N�Z�X���@��]���܂��B
	//-----------------------------------------------
	SetLayoutAnime_("fade_in", false);											// ��������
	Wait_(30);
	SetLayoutAnime_("loop", false);
	ShowScreenMessage_("DEMO_321_MSG_040", false);
	SetLayoutAnime_("fade_out", false);
	//===============================================
	
	Wait_(30);
	
	//��������������������������������������
	//���f���I��
	//��������������������������������������
	
	EndDemo(FADE_COLOR_BLACK);
	
}
