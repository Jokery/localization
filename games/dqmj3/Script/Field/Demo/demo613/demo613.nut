//=============================================
//
//		demo613[�K���r���X�̖\��_1]
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
	local task_cam, task_rena, task_antibody, task_grbrs, task_rena_step;
	local efc_cam, efc_player, efc_rena, efc_rena2, efc_mist, efc_field, efc_grbrs, efc_cough;
	local efc_pollen00, efc_pollen01, efc_pollen02, efc_pollen03, efc_pollen04;
	local frame_sum = 0;		// ���t���[����

// �����\�[�X�Ǎ�
	// �M�~�b�N
	local model_mother = ReadGimmick_("o_C03_02");		// �}�U�[
	local model_decoration = ReadGimmick_("o_C03_03");	// �}�U�[����
	// �L�����N�^�[
	local player = GetPlayerId_();						// ��l��
	local model_rena = ReadNpc_("n007");				// ���i�[�e
	local model_grbrs = ReadNpc_("m184_00");			// �K���r���X
	// �G�t�F�N�g
	LoadEffect_("ef712_10_emo_surprise01");				// �u�I�v
	LoadEffect_("ef733_01_sym_shuchusen01");					// �W����
	LoadEffect_("ef721_03_nat_smoke_n03");				// ��
	LoadEffect_("ef733_04_sym_pollen_mist");			// ������
	LoadEffect_("ef731_02_mag_dark_pollen_field");		// ���ԕ��t�B�[���h
	LoadEffect_("ef731_03_mag_boss_pollen01");			// ���ԕ��@��
	LoadEffect_("ef731_04_mag_boss_pollen02");			// ���ԕ��@��
	LoadEffect_("ef731_05_mag_boss_pollen03");			// ���ԕ��@��
	LoadEffect_("ef710_05_cha_light_ren");				// ���i�[�e�̌�
	LoadEffect_("ef732_07_teleport_monolith");			// �]���G�t�F�N�g

	LoadEffect_("ef861_10_galvirus_fusion01");			// �K���r���X�Z�����o �P				45f	Up_Mouth2�ɃA�^�b�`
	LoadEffect_("ef861_11_galvirus_fusion02");			// �K���r���X�Z�����o ������			INF	Effect2�ɃA�^�b�`
	LoadEffect_("ef861_12_galvirus_fusion03");			// �K���r���X�Z�����o ������(�͂�����)	INF	Effect2�ɃA�^�b�`
	LoadEffect_("ef861_13_galvirus_fusion04");			// �K���r���X�Z�����o �R�A�̎���̉ԕ�	INF
	LoadEffect_("ef861_14_galvirus_fusion05");			// �K���r���X�Z�����o �R�A�̎���̉ԕ�	INF

// ���z�u
	// �}�U�[
	local mother = ArrangePointGimmick_("o_C03_02", model_mother, "obj_mothier000");
	local decoration = ArrangePointGimmick_("o_C03_03", model_decoration, "obj_mothier000");
	// ��l��
	SetPointPos_(player, "player000");
	// ���i�[�e
	local rena = ArrangePointNpc_(model_rena, "npc_rena000");
	// �K���r���X
	local grbrs = ArrangePointNpc_(model_grbrs, "npc_grbrs000");
	SetScaleSilhouette(grbrs, SCALE.G, SILHOUETTE_WIDTH.G);

// ����풓���[�V�����Ǎ�
	// ��l��
	local player_caution01_L = ReadMotion_(player, "Player_caution01_L");	// �x��L
	local player_guard = ReadMotion_(player, "Player_guard");				// �x�����g�\����
	local player_guard_L = ReadMotion_(player, "Player_guard_L");			// �g�\����L
	local player_look_right_L = ReadMotion_(player, "Player_look_right_L");	// �E������
	local player_battle_L = ReadMotion_(player, "Player_battle_L");			// �퓬�ҋ@L
	local player_battle01_L = ReadMotion_(player, "Player_battle01_L");		// �퓬�ҋ@�i�������jL

	// ���i�[�e
	local rena_look_left_L = ReadMotion_(rena, "n007_look_left_L");			// ��������L
	local rena_look_up_L = ReadMotion_(rena, "n007_look_up_L");				// �������L
	local rena_run_L = ReadMotion_(rena, "n007_run_L");						// ����L
	local rena_caution_L = ReadMotion_(rena, "n007_caution_L");				// �x��L
	local rena_look_down_L = ReadMotion_(rena, "n007_look_down_L");			// ���ނ��ҋ@L(�r���̑���)
	local rena_attack_start = ReadMotion_(rena, "n007_attack_start");		// �ҋ@���U���J�n(�r���̑���)
	local rena_attack_start_L = ReadMotion_(rena, "n007_attack_start_L");	// �U���J�nL

	// �K���r���X
	local grbrs_shout = ReadMotion_(grbrs, "m184_00_shout");				// �ҋ@�����K���ҋ@
	local grbrs_damage = ReadMotion_(grbrs, "m184_00_damage");				// �ҋ@������
	local grbrs_damage_L = ReadMotion_(grbrs, "m184_00_damage_L");			// ����L
	local grbrs_reach = ReadMotion_(grbrs, "m184_00_reach_for_mother");		// �������}�U�[���L�΂�
	local grbrs_reach_L = ReadMotion_(grbrs, "m184_00_reach_for_mother_L");	// �}�U�[�Ɏ��L�΂�L
	
//����
	SetStepSe_(rena, "SE_FLD_016");
	
// ���J�����ݒ�
	task_cam = Task_AnimeMoveCamera_("anmeye005", "anmtgt005");

// ���������[�V����
	SetMotion_(rena, rena_caution_L, BLEND_N); 								// ���i�@�\��
	SetMotion_(player, player_battle01_L, BLEND_N); 						// ��@�퓬�ҋ@ ��グ
	
//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	//��������������������������������������
	//���J�b�g1 �K���@�A�b�v
	//��������������������������������������

	SetMotion_(grbrs, grbrs_damage, BLEND_M); 												// �K���r���X����
	PlaySE_("SE_DEM_156");
	Wait_(30.5);
	
	efc_cough = SetSelectBoneEffectSetBoneName_("ef861_10_galvirus_fusion01", grbrs, "Up_Mouth2", Vec3(0.0, -3.0, 0.0));		// �P
	SetEffectScale_(efc_cough, 1.3);
	Wait_(30);

	StartDecayEarthQuake_(30, 6, 8)															// �n�k
	efc_grbrs = SetSelectBoneEffect_("ef721_03_nat_smoke_n03", grbrs, ATTACH_GLOBAL);		// ��
	SetEffectScale_(efc_grbrs, 2.5);

	efc_cough = SetSelectBoneEffectSetBoneName_("ef861_10_galvirus_fusion01", grbrs, "Up_Mouth2", Vec3(0.0, -10.0, 0.0));		// �P
	SetEffectScale_(efc_cough, 2.0);
	
	WaitMotion(grbrs);
	SetMotion_(grbrs, grbrs_damage_L, BLEND_L); 											// �K���r���X����L
	
	WaitTask(task_cam);
	
	Wait_(30);
	
	//===============================================
	// ���K���r���X
	// �u�܁c�c�܂����@�܂������X�^�[�}�X�^�[�Ɂc�c
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_GARUBIRUSU");
	ShowMsg_("DEMO_613_MSG_010");
	efc_cough = SetSelectBoneEffectSetBoneName_("ef861_10_galvirus_fusion01", grbrs, "Up_Mouth2", Vec3(0.0, -3.0, 3.0));		// �P
	SetEffectScale_(efc_cough, 1.3);
	KeyInputWait_();
	
	//===============================================
	
	//===============================================
	// ���K���r���X
	// �u�������傤�c�c�������傤�I
	//-----------------------------------------------
	ShowMsg_("DEMO_613_MSG_020");
	efc_cough = SetSelectBoneEffectSetBoneName_("ef861_10_galvirus_fusion01", grbrs, "Up_Mouth2", Vec3(0.0, -2.0, 3.0));		//�P
	SetEffectScale_(efc_cough, 1.5);
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	//��������������������������������������
	//���J�b�g2 �R�A�Ɏ��L�΂��K��
	//��������������������������������������
	SetDir_(grbrs, 180);
	
	// �J������荞��
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	efc_cough = SetSelectBoneEffectSetBoneName_("ef861_10_galvirus_fusion01", grbrs, "Up_Mouth2", Vec3(0.0, -5.0, 3.0));		// �P
	PlaySE_("SE_DEM_157");													// �|���SE
	
	SetEffectScale_(efc_cough, 1.3);

	Wait_(20);
	efc_cough = SetSelectBoneEffectSetBoneName_("ef861_10_galvirus_fusion01", grbrs, "Up_Mouth2", Vec3(0.0, -5.0, 3.0));		// �P
	SetEffectScale_(efc_cough, 1.1);
	
	Wait_(70);

	SetMotion_(grbrs, grbrs_reach, BLEND_L); 								// �K���@���������L�΂�
	Wait_(25);	
	efc_cough = SetSelectBoneEffectSetBoneName_("ef861_10_galvirus_fusion01", grbrs, "Up_Mouth2", Vec3(0.0, -5.0, 0.0));		// �P
	SetEffectScale_(efc_cough, 1.3);
	
	Wait_(50);
	StartDecayEarthQuake_(16, 8, 4)															//�n�k
	efc_grbrs = SetSelectBoneEffectSetOffset_("ef721_03_nat_smoke_n03", grbrs, ATTACH_GLOBAL, Vec3(-25.0, 0.0, 0.0));			// ��
	SetEffectScale_(efc_grbrs, 1.5);
	efc_cough = SetSelectBoneEffectSetBoneName_("ef861_10_galvirus_fusion01", grbrs, "Up_Mouth2", Vec3(0.0, -2.0, 0.0));		// �P
	SetEffectScale_(efc_cough, 3.0);
	
	WaitMotion(grbrs);
	SetMotion_(grbrs, grbrs_reach_L, BLEND_L); 								//�K���@���������L�΂�
	
	Wait_(10);
	efc_cough = SetSelectBoneEffectSetBoneName_("ef861_10_galvirus_fusion01", grbrs, "Up_Mouth2", Vec3(0.0, -4.0, 0.0));		// �P
	SetEffectScale_(efc_cough, 1.0);
	
	Wait_(20);
	efc_cough = SetSelectBoneEffectSetBoneName_("ef861_10_galvirus_fusion01", grbrs, "Up_Mouth2", Vec3(0.0, -6.0, 0.0));		// �P
	SetEffectScale_(efc_cough, 1.8);
	
	WaitTask(task_cam);
	Wait_(30);
	
	//��������������������
	//���J�b�g3 �K���@�A�b�v
	//��������������������
	SetScaleSilhouette(grbrs, SCALE.G, 0.6);												// �V���G�b�g�ύX
	
	task_cam = Task_AnimeMoveCamera_("anmeye006", "anmtgt006");
	PlaySE_("SE_DEM_026");	// ��SE:�W����
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", 100);									// �W����
	
	WaitTask(task_cam);
	efc_pollen00 = SetSelectBoneEffectSetOffset_("ef861_11_galvirus_fusion02", grbrs, ATTACH_EFFECT2, Vec3(-10.0, 0.0, 0.0));		// �ԕ������o��
	SetEffectScale_(efc_pollen00, 2.0);
	
	//===============================================
	// ���K���r���X
	// �u���₾�I�@���������Ȃ��I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_GARUBIRUSU");
	ShowMsg_("DEMO_613_MSG_030");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	// ���K���r���X
	// �u�����@�ǂ��Ȃ��Ă��@�\�����񂩁I
	//-----------------------------------------------
	ShowMsg_("DEMO_613_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	DeleteEffect_(efc_cam);
	SetScaleSilhouette(grbrs, SCALE.G, SILHOUETTE_WIDTH.G);
	
	//����������������������
	//���J�b�g4 �ԕ����o
	//����������������������	
	// �J�����@���߂ɃY�[���A�E�g
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	PlaySE_("SE_DEM_182");
	
	Wait_(30);
	DeleteEffectEmitter_(efc_pollen00); 
	
	WaitTask(task_cam);
	
	//===============================================
	// ���K���r���X
	// �u���������@�z�����ā@�N���������c�c
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_GARUBIRUSU");
	ShowMsg_("DEMO_613_MSG_050");
	efc_pollen01 = SetSelectBoneEffectSetOffset_("ef861_12_galvirus_fusion03", grbrs, ATTACH_EFFECT2, Vec3(-10.0, 0.0, 0.0));		//�ԕ������o��
	SetEffectScale_(efc_pollen01, 2.0);
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	Wait_(40);
	
	//��������������������������������������
	//���J�b�g5 ��l���ɋ삯��郌�i
	//��������������������������������������
	
	SetPointPos_(player, "player001");

	local task_rena_step = Task_ChangeStepSe(rena, "SE_FLD_016", 1);
	PlaySE_("SE_DEM_158");
	
	SetPointPos_(rena, "npc_rena001");
	SetMotion_(rena, rena_run_L, BLEND_N); 							// ���i�@����
	
	SetDirToObject_(rena, player);
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");
	
	task_rena = Task_MoveForward_(rena, 1.0, true);					// ���i�@�삯���
	Wait_(3);
	SetMotion_(rena, MOT_WAIT, BLEND_L);							// ���i�@�ҋ@
	DeleteTask_(task_rena);
	DeleteTaskStepSe(rena, task_rena_step);
	Wait_(20);
	
	SetMotion_(rena, rena_attack_start, BLEND_L);					// ���i�@�U���J�n�i�r���̑���j
	WaitMotion(rena); 
	
	SetMotion_(rena, rena_attack_start_L, BLEND_L);					// ���i�@�U���J�n
	
	Wait_(20);
	SetFace_(rena, "Face_loop_close");
	
	SetMotion_(player, player_look_right_L, BLEND_XL);				// ��@�E������
	Wait_(30);
	
	PlaySE_("SE_DEM_183");
	efc_rena = SetSelectBoneEffectSetOffset_("ef710_05_cha_light_ren", rena, ATTACH_GLOBAL, Vec3(-11.0, 25.0, 0.0));			// ��@���i�@���[�v�̌�
	SetEffectScale_(efc_rena, 2.3);
	Wait_(20);

	
	Task_ObjectFadeOut_(rena, 20);															// 20�t���[���Ńt�F�[�h�A�E�g���܂�
	Task_ObjectFadeOut_(player, 20);														// 20�t���[���Ńt�F�[�h�A�E�g���܂�
	Wait_(5);

	efc_player = SetSelectBoneEffectSetOffset_("ef732_07_teleport_monolith", player, ATTACH_GLOBAL, Vec3(0.0, 0.0, 0.0));
	efc_rena2 = SetSelectBoneEffectSetOffset_("ef732_07_teleport_monolith", rena, ATTACH_GLOBAL, Vec3(0.0, 0.0, 0.0));
	DeleteEffectEmitter_(efc_rena);
	
	WaitTask(task_cam);
	Wait_(100);
	
	//��������������������������������������
	//���J�b�g6 �ԕ��ɕ�����R�A
	//��������������������������������������
	DeleteEffectEmitter_(efc_pollen01); 

	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");

	efc_mist = SetCameraEffect_("ef733_04_sym_pollen_mist", 100);			// �u���b�N�~�X�g
	ChangeColorTone_(2.0, 0.0, 4.0, 50);									// �F���␳�u���v

	efc_pollen03 = SetPointWorldEffect_("ef861_13_galvirus_fusion04", "obj_mothier000");
	
	WaitTask(task_cam);
	Wait_(60);
	EndDemo(FADE_COLOR_BLACK);
}
