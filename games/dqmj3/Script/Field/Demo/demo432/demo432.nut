//=============================================
//
//		demo432[�}�X�^�[�Y���[�h_5(�č�)]
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
//	local model_reverse = ReadGimmick_("o_com_16");			// ���Ԃ鑫��
//	local model_collapse = ReadGimmick_("o_com_17");		// ����鑫��
	local model_switch = ReadGimmick_("o_com_19");			// �X�C�b�`
//	local model_wind = ReadGimmick_("o_com_22");			// �ނ���
	local model_collapse_l = ReadGimmick_("o_com_24");		// ����鑫��i�y�ʁj
	local model_spark = ReadGimmick_("o_com_25");			// �X�p�[�N
	local model_burner = ReadGimmick_("o_com_26");			// �o�[�i�[
	local model_square = ReadGimmick_("o_com_29");			// ����i�l�p�j
	local model_circle = ReadGimmick_("o_com_30");			// ����i�ہj
	local model_slope = ReadGimmick_("o_com_31");			// �⓹
	local model_float_l = ReadGimmick_("o_S00_08");			// ����(��)
	local model_float_m = ReadGimmick_("o_S00_07");			// ����(��)
	// �L�����N�^�[
	local player = GetPlayerId_();							// ��l��
	local model_boss = ReadNpc_("m178_00");					// ���W�t���C���[
	// �G�t�F�N�g
	LoadEffect_("ef730_02_oth_gimmick_in01");				// �M�~�b�N�\�����̌�

// ���z�u
	// ��============================= �I�u�W�F�N�g =============================��
	// ���z�u���̏���� 49 �ׁ̈A�����Ȃ��I�u�W�F�N�g��C.O���Ă���
	
	// ���������O
//	local acceleration00 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration000");
	local acceleration01 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration001");
//	local acceleration02 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration002");
	local acceleration03 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration003");
	local acceleration04 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration004");
//	local acceleration05 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration005");
//	local acceleration06 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration006");
	local acceleration07 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration007");
//	local acceleration08 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration008");
//	local acceleration09 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration009");
//	local acceleration10 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration010");
//	local acceleration11 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration011");
//	local acceleration12 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration012");
//	local acceleration13 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration013");
	
	// ���Ԃ鑫��
//	local reverse00 = ArrangePointGimmick_("o_com_16", model_reverse, "obj_reverse000");
//	local reverse01 = ArrangePointGimmick_("o_com_16", model_reverse, "obj_reverse001");
//	local reverse02 = ArrangePointGimmick_("o_com_16", model_reverse, "obj_reverse002");
	
	// �X�C�b�`
	local switch00 = ArrangePointGimmick_("o_com_19", model_switch, "obj_switch000");
	SetMotion_(switch00, MOT_GIMMICK_2, BLEND_N);
	
	// �ނ���
//	local wind00 = ArrangePointGimmick_("o_com_22", model_wind, "obj_wind000");
	
	// ����鑫��i�y�ʁj
//	local collapse_l00 = ArrangePointGimmick_("o_com_24", model_collapse_l, "obj_collapse_l000");
//	local collapse_l01 = ArrangePointGimmick_("o_com_24", model_collapse_l, "obj_collapse_l001");
//	local collapse_l02 = ArrangePointGimmick_("o_com_24", model_collapse_l, "obj_collapse_l002");
//	local collapse_l03 = ArrangePointGimmick_("o_com_24", model_collapse_l, "obj_collapse_l003");
	
	// �X�p�[�N
	local spark00 = ArrangePointGimmick_("o_com_25", model_spark, "obj_spark000");
	local spark01 = ArrangePointGimmick_("o_com_25", model_spark, "obj_spark001");
	local spark02 = ArrangePointGimmick_("o_com_25", model_spark, "obj_spark002");
	local spark03 = ArrangePointGimmick_("o_com_25", model_spark, "obj_spark003");
	local spark04 = ArrangePointGimmick_("o_com_25", model_spark, "obj_spark004");
//	local spark05 = ArrangePointGimmick_("o_com_25", model_spark, "obj_spark005");
	local spark06 = ArrangePointGimmick_("o_com_25", model_spark, "obj_spark006");
//	local spark07 = ArrangePointGimmick_("o_com_25", model_spark, "obj_spark007");
//	local spark08 = ArrangePointGimmick_("o_com_25", model_spark, "obj_spark008");
//	local spark09 = ArrangePointGimmick_("o_com_25", model_spark, "obj_spark009");
//	local spark10 = ArrangePointGimmick_("o_com_25", model_spark, "obj_spark010");
	
	// �o�[�i�[
	local burner00 = ArrangePointGimmick_("o_com_26", model_burner, "obj_burner000");
//	local burner01 = ArrangePointGimmick_("o_com_26", model_burner, "obj_burner001");
//	local burner02 = ArrangePointGimmick_("o_com_26", model_burner, "obj_burner002");
//	local burner03 = ArrangePointGimmick_("o_com_26", model_burner, "obj_burner003");
	local burner04 = ArrangePointGimmick_("o_com_26", model_burner, "obj_burner004");
//	local burner05 = ArrangePointGimmick_("o_com_26", model_burner, "obj_burner005");
	local burner06 = ArrangePointGimmick_("o_com_26", model_burner, "obj_burner006");
//	local burner07 = ArrangePointGimmick_("o_com_26", model_burner, "obj_burner007");
	local burner08 = ArrangePointGimmick_("o_com_26", model_burner, "obj_burner008");
//	local burner09 = ArrangePointGimmick_("o_com_26", model_burner, "obj_burner009");
	
	// ����i�l�p�j
	local square00 = ArrangePointGimmick_("o_com_29", model_square, "obj_square000");
	local square01 = ArrangePointGimmick_("o_com_29", model_square, "obj_square001");
	local square02 = ArrangePointGimmick_("o_com_29", model_square, "obj_square002");
	local square03 = ArrangePointGimmick_("o_com_29", model_square, "obj_square003");
	local square04 = ArrangePointGimmick_("o_com_29", model_square, "obj_square004");
	local square05 = ArrangePointGimmick_("o_com_29", model_square, "obj_square005");
	local square06 = ArrangePointGimmick_("o_com_29", model_square, "obj_square006");
	local square07 = ArrangePointGimmick_("o_com_29", model_square, "obj_square007");
	local square08 = ArrangePointGimmick_("o_com_29", model_square, "obj_square008");
//	local square09 = ArrangePointGimmick_("o_com_29", model_square, "obj_square009");
//	local square10 = ArrangePointGimmick_("o_com_29", model_square, "obj_square010");
//	local square11 = ArrangePointGimmick_("o_com_29", model_square, "obj_square011");
	local square12 = ArrangePointGimmick_("o_com_29", model_square, "obj_square012");
//	local square13 = ArrangePointGimmick_("o_com_29", model_square, "obj_square013");
//	local square14 = ArrangePointGimmick_("o_com_29", model_square, "obj_square014");
//	local square15 = ArrangePointGimmick_("o_com_29", model_square, "obj_square015");
	local square16 = ArrangePointGimmick_("o_com_29", model_square, "obj_square016");
	local square17 = ArrangePointGimmick_("o_com_29", model_square, "obj_square017");
	local square18 = ArrangePointGimmick_("o_com_29", model_square, "obj_square018");
//	local square19 = ArrangePointGimmick_("o_com_29", model_square, "obj_square019");
	
	//����i�ہj
//	local circle00 = ArrangePointGimmick_("o_com_30", model_circle, "obj_circle000");
	
	// �⓹
	local circle01 = ArrangePointGimmick_("o_com_31", model_slope, "obj_circle001");
	local circle02 = ArrangePointGimmick_("o_com_31", model_slope, "obj_circle002");
	local circle03 = ArrangePointGimmick_("o_com_31", model_slope, "obj_circle003");
	local circle04 = ArrangePointGimmick_("o_com_31", model_slope, "obj_circle004");
//	local circle05 = ArrangePointGimmick_("o_com_31", model_slope, "obj_circle005");
	local circle06 = ArrangePointGimmick_("o_com_31", model_slope, "obj_circle006");
	local circle07 = ArrangePointGimmick_("o_com_31", model_slope, "obj_circle007");
	local circle08 = ArrangePointGimmick_("o_com_31", model_slope, "obj_circle008");
	local circle09 = ArrangePointGimmick_("o_com_31", model_slope, "obj_circle009");
//	local circle10 = ArrangePointGimmick_("o_com_31", model_slope, "obj_circle010");
//	local circle11 = ArrangePointGimmick_("o_com_31", model_slope, "obj_circle011");
//	local circle12 = ArrangePointGimmick_("o_com_31", model_slope, "obj_circle012");
	
	// �����i���j
	local float_m00 = ArrangePointGimmick_("o_S00_07", model_float_m, "obj_float_m000");
	local float_m01 = ArrangePointGimmick_("o_S00_07", model_float_m, "obj_float_m001");
//	local float_m02 = ArrangePointGimmick_("o_S00_07", model_float_m, "obj_float_m002");
//	local float_m03 = ArrangePointGimmick_("o_S00_07", model_float_m, "obj_float_m003");
	
	// �����i��j
	local float_l00 = ArrangePointGimmick_("o_S00_08", model_float_l, "obj_float_l000");
//	local float_l01 = ArrangePointGimmick_("o_S00_08", model_float_l, "obj_float_l001");
	local float_l02 = ArrangePointGimmick_("o_S00_08", model_float_l, "obj_float_l002");
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
	
	// ���J�b�g�P����l���t�o���A�X���`�b�N�Љ�P�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");		// 120F
	task_player = Task_WalkAroundToDir(player, 155, ROTATE_DEMO_DEF/3);
	
	WaitTask(task_player);
	SetMotion_(player, MOT_WAIT, BLEND_M);
	
	WaitTask(task_cam);
	Wait_(15);
	
	// ���J�b�g�Q���A�X���`�b�N�Љ�Q���{�X���f���`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");		// 200F
	WaitTask(task_cam);
	Wait_(15);
	
	// ���J�b�g�R���{�X�փY�[���C���`�`�`�`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");		// 45F
	WaitTask(task_cam);
	Wait_(10);
	
	PlaySE_("SE_BTL_713");
	SetMotion_(boss, MOT_SPELL_START, BLEND_N);
	WaitMotion(boss);
	PlaySE_("SE_BTL_714");
	SetMotion_(boss, MOT_SPELL_ACTUATE, BLEND_N);
	WaitMotion(boss);
	SetMotion_(boss, MOT_WAIT, BLEND_M);
	Wait_(10);
	
	EndDemo(FADE_COLOR_BLACK);
}

