//=============================================
//
//		demo134[�}�X�^�[�Y���[�h_2(����)]
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
	local task_cam, task_player;

// �����\�[�X�Ǎ�
	// �M�~�b�N
	local model_acceleration = ReadGimmick_("o_com_00");	// ���������O
	local model_float_l = ReadGimmick_("o_com_10");			// ����(��)
	local model_reverse = ReadGimmick_("o_com_16");			// ���Ԃ鑫��
	local model_switch = ReadGimmick_("o_com_19");			// �X�C�b�`
	local model_wind = ReadGimmick_("o_com_22");			// �ނ���
	local model_collapse_l = ReadGimmick_("o_com_24");		// ����鑫��i�y�ʁj
	local model_square = ReadGimmick_("o_com_29");			// ����i�l�p�j
	local model_float_m = ReadGimmick_("o_A00_05");			// �����s�s�̕���(��)
	local model_ukisima = ReadGimmick_("o_A00_06");			// �����s�s�̕���(��)
	// �L�����N�^�[
	local player = GetPlayerId_();							// ��l��
	local model_boss = ReadNpc_("m110_01");					// �S�[���h�}��

// ���z�u
	// ��============================= �I�u�W�F�N�g =============================��
	// ���z�u���̏���� 49 �ׁ̈A�����Ȃ��I�u�W�F�N�g��C.O���Ă���
	
	// �X�C�b�`
	local switch00 = ArrangePointGimmick_("o_com_19", model_switch, "obj_switch000");
	SetPointPos_(switch00, "obj_switch000");
	SetMotion_(switch00, MOT_GIMMICK_2, BLEND_N);
	
	// ���������O
	local acceleration00 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration000");
	local acceleration01 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration001");
	local acceleration02 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration002");
	local acceleration03 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration003");
	local acceleration04 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration004");
	local acceleration05 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration005");
	local acceleration06 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration006");
	local acceleration07 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration007");
	
	// ����(��)
	local float_l00 = ArrangePointGimmick_("o_com_10", model_float_l, "obj_float_l000");
	local float_l01 = ArrangePointGimmick_("o_com_10", model_float_l, "obj_float_l001");
	local float_l02 = ArrangePointGimmick_("o_com_10", model_float_l, "obj_float_l002");
	local float_l03 = ArrangePointGimmick_("o_com_10", model_float_l, "obj_float_l003");
	
	// ���Ԃ鑫��
	local reverse00 = ArrangePointGimmick_("o_com_16", model_reverse, "obj_reverse000");
	local reverse01 = ArrangePointGimmick_("o_com_16", model_reverse, "obj_reverse001");
	local reverse02 = ArrangePointGimmick_("o_com_16", model_reverse, "obj_reverse002");
	local reverse03 = ArrangePointGimmick_("o_com_16", model_reverse, "obj_reverse003");
	local reverse04 = ArrangePointGimmick_("o_com_16", model_reverse, "obj_reverse004");
	local reverse05 = ArrangePointGimmick_("o_com_16", model_reverse, "obj_reverse005");
	
	// �ނ���
	local wind00 = ArrangePointGimmick_("o_com_22", model_wind, "obj_wind000");
	
	// ����鑫��i�y�ʁj
	local collapse_l00 = ArrangePointGimmick_("o_com_24", model_collapse_l, "obj_collapse_l000");
	local collapse_l01 = ArrangePointGimmick_("o_com_24", model_collapse_l, "obj_collapse_l001");
	local collapse_l02 = ArrangePointGimmick_("o_com_24", model_collapse_l, "obj_collapse_l002");
	
	// ����i�l�p�j
	local square00 = ArrangePointGimmick_("o_com_29", model_square, "obj_square000");
//	local square01 = ArrangePointGimmick_("o_com_29", model_square, "obj_square001");
//	local square02 = ArrangePointGimmick_("o_com_29", model_square, "obj_square002");
//	local square03 = ArrangePointGimmick_("o_com_29", model_square, "obj_square003");
//	local square04 = ArrangePointGimmick_("o_com_29", model_square, "obj_square004");
	local square05 = ArrangePointGimmick_("o_com_29", model_square, "obj_square005");
	local square06 = ArrangePointGimmick_("o_com_29", model_square, "obj_square006");
	local square07 = ArrangePointGimmick_("o_com_29", model_square, "obj_square007");
//	local square08 = ArrangePointGimmick_("o_com_29", model_square, "obj_square008");
//	local square09 = ArrangePointGimmick_("o_com_29", model_square, "obj_square009");
	local square10 = ArrangePointGimmick_("o_com_29", model_square, "obj_square010");
	local square11 = ArrangePointGimmick_("o_com_29", model_square, "obj_square011");
	local square12 = ArrangePointGimmick_("o_com_29", model_square, "obj_square012");
	local square13 = ArrangePointGimmick_("o_com_29", model_square, "obj_square013");
	local square14 = ArrangePointGimmick_("o_com_29", model_square, "obj_square014");
	local square15 = ArrangePointGimmick_("o_com_29", model_square, "obj_square015");
	local square16 = ArrangePointGimmick_("o_com_29", model_square, "obj_square016");
	local square17 = ArrangePointGimmick_("o_com_29", model_square, "obj_square017");
	
	// �����s�s�̕���(��)
	local float_m00 = ArrangePointGimmick_("o_A00_05", model_float_m, "obj_float_m000");
	local float_m01 = ArrangePointGimmick_("o_A00_05", model_float_m, "obj_float_m001");
	
	// �����s�s�̕���(��)
	local float_l04 = ArrangePointGimmick_("o_A00_06", model_ukisima, "obj_float_l004");
	local float_l05 = ArrangePointGimmick_("o_A00_06", model_ukisima, "obj_float_l005");
	local float_l06 = ArrangePointGimmick_("o_A00_06", model_ukisima, "obj_float_l006");
	local float_l07 = ArrangePointGimmick_("o_A00_06", model_ukisima, "obj_float_l007");
	local float_l08 = ArrangePointGimmick_("o_A00_06", model_ukisima, "obj_float_l008");
	local float_l09 = ArrangePointGimmick_("o_A00_06", model_ukisima, "obj_float_l009");
	local float_l10 = ArrangePointGimmick_("o_A00_06", model_ukisima, "obj_float_l010");
	
	// ��============================= �I�u�W�F�N�g =============================��
	
	// ��l��
	SetPointPos_(player, "player000");
	
	// �S�[���p�����X�^�[
	local boss = ArrangePointNpc_(model_boss, "npc_boss000");
	SetScaleSilhouette(boss, SCALE.N, SILHOUETTE_WIDTH.N);

// ���J�����ݒ�
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");		// 0F�ڂ��f��
	DeleteTask_(task_cam);

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	// ���J�b�g�P����l���t�o���A�X���`�b�N�Љ�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");		// 120F
	WaitTask(task_cam);
	Wait_(30);
	
	// ���J�b�g�Q���A�X���`�b�N�Љ�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");		// 300F
	WaitTask(task_cam);
	Wait_(10);
	
	// ���J�b�g3���{�X���f���`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");		// 300F
	WaitTask(task_cam);
	
	Wait_(10);
	PlaySE_("SE_BTL_429");
	SetMotion_(boss, MOT_SPELL_START, BLEND_M);
	WaitMotion(boss);
	PlaySE_("SE_BTL_430");
	SetMotion_(boss, MOT_SPELL_ACTUATE, BLEND_M);
	WaitMotion(boss);
	SetMotion_(boss, MOT_WAIT, BLEND_M);
	Wait_(10);
	
	EndDemo(FADE_COLOR_BLACK);
}
