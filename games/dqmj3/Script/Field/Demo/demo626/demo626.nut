//=============================================
//
//		demo626[����{�[�V���b�N�폟��]
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
	local task_cam, task_player, task_rena, task_neo;
	local efc_cam, efc_neo0, efc_neo1, efc_mag_boss_die01, efc_mag_boss_die02, efc_mag_boss_die03, efc_mag_boss_die04;
	local efc_bone0, efc_bone1, efc_bone2, efc_bone3, efc_bone4, efc_bone5, efc_bone6, efc_bone7;

// ��LOD�ǂݍ���
	ReadWaitingLod("lodeye000", "lodtgt000");//�s�s�\�����Ԃɍ����Ă��Ȃ������̂Őݒ�

// �����\�[�X�Ǎ�
	// �M�~�b�N
	local model_island = ReadGimmick_("o_com_10");	// ����
	// �L�����N�^�[
	local player = GetPlayerId_();					// ��l��
	local model_rena = ReadNpc_("n007");			// ���i�[�e
	local model_neo = ReadNpc_("m207_00");			// �{�[�V���b�N
	// �G�t�F�N�g
	LoadEffect_("ef733_02_sym_black_mist01");		// ������
	LoadEffect_("ef731_06_mag_boss_die01");			// ����{�X�̏��ŃG�t�F�N�g(��)
	LoadEffect_("ef731_08_mag_boss_die03");			// ����{�X�̏��ŃG�t�F�N�g(��)
	LoadEffect_("ef731_09_mag_boss_die04");			// ����{�X�̏��ŃG�t�F�N�g(���j)

// ���z�u
	// ����
	local island = ArrangePointGimmick_("o_com_10", model_island, "obj_island000");
	// ��l��
	SetPointPos_(player, "player000");
	// ���i�[�e
	local rena = ArrangePointNpc_(model_rena, "npc_rena000");
	// �{�[�V���b�N
	local neo = ArrangePointNpc_(model_neo, "npc_bor000");
	SetPointPosNoFit_(neo, "npc_bor000");
	SetScaleSilhouette(neo, SCALE.T, SILHOUETTE_WIDTH.T);
	SetSilhouetteHideIfFar_(neo, false);

// ����풓���[�V�����Ǎ�
	// ��l��
	local player_look_right_L = ReadMotion_(player, "Player_look_right_L");	// �E������L
	// ���i�[�e
	local rena_look_left_L = ReadMotion_(rena, "n007_look_left_L");			// ��������L
	// �{�[�V���b�N
	local neo_die = ReadMotion_(neo, "m207_00_die");						// ����

// ���G�t�F�N�g�ݒ�
	efc_cam = SetCameraEffect_("ef733_02_sym_black_mist01", CAMERA_DEF);
	efc_bone0 = SetSelectBoneEffectSetBoneName_("ef731_08_mag_boss_die03", neo, "Hip_root", Vec3(0.0, 5.0, 0.0));
	efc_bone1 = SetSelectBoneEffectSetBoneName_("ef731_06_mag_boss_die01", neo, "j_ude_a_l", Vec3(0.0, 0.0, 0.0));
	efc_bone2 = SetSelectBoneEffectSetBoneName_("ef731_06_mag_boss_die01", neo, "j_ude_b_l", Vec3(0.0, 0.0, 0.0));
	efc_bone3 = SetSelectBoneEffectSetBoneName_("ef731_06_mag_boss_die01", neo, "j_te_l", Vec3(0.0, 0.0, 0.0));
	efc_bone4 = SetSelectBoneEffectSetBoneName_("ef731_06_mag_boss_die01", neo, "j_ude_a_r", Vec3(0.0, 0.0, 0.0));
	efc_bone5 = SetSelectBoneEffectSetBoneName_("ef731_06_mag_boss_die01", neo, "j_ude_b_r", Vec3(0.0, 0.0, 0.0));
	efc_bone6 = SetSelectBoneEffectSetBoneName_("ef731_06_mag_boss_die01", neo, "j_te_r", Vec3(0.0, 0.0, 0.0));
	efc_bone7 = SetSelectBoneEffectSetBoneName_("ef731_06_mag_boss_die01", neo, "j_kubi", Vec3(0.0, 0.0, 0.0));

// �����[�V�����ݒ�
	SetMotion_(neo, MOT_SPECIAL_WAIT, BLEND_N);
	SetMotionSpeed_(neo, 0.5);

	ChangeColorTone_(-0.3, -0.5, -0.2, 0);

	SetVisible(player, false);
	SetVisible(rena, false);
	SetVisible(island, false);
	WaitLod_();
	Wait_(120);// �s�s�\���҂�

//����
	SetStepSe_(rena, "SE_FLD_016");

	// ���J�����ݒ�
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");		// 90F


//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);

	Wait_(60);
	DeleteTask_(task_cam);
	StartEarthQuake_(-1, 3, 1);

	// ���J�b�g�P���{�[�V���b�N�t�o�`�`�`�`�`�`�`�`�`�`�`�`�`�`

	//===============================================
	// ���{�[�V���b�N
	// �u���������@��݂��������̂Ɂc�c
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BORSHOCK");
	ShowMsg_("DEMO_626_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	// ���J�b�g�Q���{�[�V���b�N�Y�[���A�E�g�`�`�`�`�`�`�`�`�`�`
	PlaySE_("SE_DEM_162");											//�{�[�V���b�N�iT�j����
	
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");		// 65F

	StartBlurEffect_();

	SetMotion_(neo, neo_die, BLEND_M);
	SetMotionSpeed_(neo, 0.5); //���ʂƂ��̃��[�V�����X�s�[�h���������ɁB
	efc_mag_boss_die04 = SetSelectBoneEffect_("ef731_09_mag_boss_die04", neo, ATTACH_EFFECT2);
	DeleteEffectEmitter_(efc_cam);	
	ChangeColorTone_(0.3, 0.3, 0.3, 60);
	Wait_(40);

	//�����ɏ����Ɖ摜�������̂Ń^�C�~���O�����炷
	DeleteEffectEmitter_(efc_bone0);
	Wait_(1);
	DeleteEffectEmitter_(efc_bone1);
	Wait_(1);
	DeleteEffectEmitter_(efc_bone2);
	Wait_(1);
	DeleteEffectEmitter_(efc_bone3);
	Wait_(1);
	DeleteEffectEmitter_(efc_bone4);
	Wait_(1);
	DeleteEffectEmitter_(efc_bone5);
	Wait_(1);
	DeleteEffectEmitter_(efc_bone6);
	Wait_(1);
	DeleteEffectEmitter_(efc_bone7);
	Wait_(33);

	StopEarthQuake_();
	Wait_(15);

	StartEarthQuake_(-1, 3, 30);
	Wait_(45);

	task_neo = Task_ObjectFadeOut_(neo, 15);
	Wait_(30);

	ChangeColorTone_(-0.3, -0.5, -0.2, 60);
	Wait_(39);

	StartEarthQuake_(60, 3, 30);
	Wait_(105);

	StopEarthQuake_();
	DeleteEffectEmitter_(efc_mag_boss_die04);
	EndBlurEffect_();
	DeleteTask_(task_cam);

	// ���J�b�g�R����l���ƃ��i�[�e�Y�[���A�E�g�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");		// 180F

	SetVisible(player, true);
	SetVisible(rena, true);
	SetVisible(island, true);

	Wait_(60);
	ChangeColorTone_(0.1, 0.1, 0.1, 60);

	WaitTask(task_cam);

	// ���J�b�g�S����l���ƃ��i�[�e�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");

	task_rena = Task_WalkAroundToDir(rena,GetDir_(rena)+65, ROTATE_DEMO_DEF/2);
	Wait_(15);
	task_player = Task_WalkAroundToDir(player, GetDir_(player)-55, ROTATE_DEMO_DEF/2);
	WaitTask(task_player);
	SetMotion_(player, player_look_right_L, BLEND_L);
	WaitTask(task_rena);
	SetMotion_(rena, MOT_WAIT, BLEND_M);
	Wait_(5);

	MotionTalk(rena);

	//===============================================
	// �����i�[�e
	// �u�Ȃ�قǁc�c���@�|����������
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_626_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	SetVisible(player, false);

	// ���J�b�g�T�����i�[�e�t�o�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");

	//-----------------------------------------------
	// �����i�[�e
	// �u<name_player/>�B�����Ɓ@���̐��
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_626_MSG_030");
	KeyInputWait_();

	//-----------------------------------------------
	// �����i�[�e
	// �u���͋�����n�c�c���f�͂��Ȃ��Łc�c�B
	//-----------------------------------------------
	ShowMsg_("DEMO_626_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(rena, MOT_WAIT, 20);
	Wait_(30);

	EndDemo(FADE_COLOR_BLACK);
}
