//=============================================
//
//		demo222[�}�X�^�[�Y���[�h_3(�쓹)]
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
	local model_reverse = ReadGimmick_("o_com_16");			// ���Ԃ鑫��
//	local model_collapse = ReadGimmick_("o_com_17");		// ����鑫��
	local model_switch = ReadGimmick_("o_com_19");			// �X�C�b�`
//	local model_wind = ReadGimmick_("o_com_22");			// �ނ���
//	local model_collapse_l = ReadGimmick_("o_com_24");		// ����鑫��i�y�ʁj
	local model_burner = ReadGimmick_("o_com_26");			// �o�[�i�[
	local model_square = ReadGimmick_("o_com_29");			// ����i�l�p�j
	local model_circle = ReadGimmick_("o_com_30");			// ����i�ہj
	local model_poison = ReadGimmick_("o_com_33");			// ����i�Łj
//	local model_float_l = ReadGimmick_("o_com_97");			// ����(��)
//	local model_float_m = ReadGimmick_("o_com_98");			// ����(��)
	local model_float_s = ReadGimmick_("o_G00_07");			// ��n�̕����P
	local model_float_l = ReadGimmick_("o_G00_08");			// ��n�̕����Q

	// �L�����N�^�[
	local player = GetPlayerId_();							// ��l��
	local model_boss = ReadNpc_("m181_00");					// ���W�T�u�}����
	// �G�t�F�N�g
	LoadEffect_("ef730_02_oth_gimmick_in01");				// �M�~�b�N�\�����̌�

// ���z�u
	
	// ��l��
	SetPointPos_(player, "player000");
	
	// �S�[���p�����X�^�[
	local boss = ArrangePointNpc_(model_boss, "npc_boss000");
	SetScaleSilhouette(boss, SCALE.N, SILHOUETTE_WIDTH.N);

	// ��============================= ���g�p�I�u�W�F�N�g =============================��
	// ���z�u���̏���� 49 �ׁ̈A�����Ȃ��I�u�W�F�N�g��C.O���Ă���
	
	//���������O
//	local acceleration00 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration000");				//���g�p
//	local acceleration03 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration003");
//	local acceleration05 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration005");
//	local acceleration06 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration006");
//	local acceleration07 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration007");
//	local acceleration10 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration010");
//	local acceleration11 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration011");
//	local acceleration12 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration012");
//	local acceleration13 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration013");
//	local acceleration14 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration014");
//	local acceleration15 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration015");
	
	// �o�[�i�[
//	local burner00 = ArrangePointGimmick_("o_com_26", model_burner, "obj_burner000");			//���g�p
//	local burner01 = ArrangePointGimmick_("o_com_26", model_burner, "obj_burner001");
//	local burner02 = ArrangePointGimmick_("o_com_26", model_burner, "obj_burner002");
//	local burner03 = ArrangePointGimmick_("o_com_26", model_burner, "obj_burner003");
//	local burner12 = ArrangePointGimmick_("o_com_26", model_burner, "obj_burner012");
//	local burner13 = ArrangePointGimmick_("o_com_26", model_burner, "obj_burner013");
//	local burner11 = ArrangePointGimmick_("o_com_26", model_burner, "obj_burner011");
//	local burner14 = ArrangePointGimmick_("o_com_26", model_burner, "obj_burner014");
//	local burner15 = ArrangePointGimmick_("o_com_26", model_burner, "obj_burner015");


	// ����i�l�p�j
//	local square2 = ArrangePointGimmick_("o_com_29", model_square, "obj_square002");
//	local square3 = ArrangePointGimmick_("o_com_29", model_square, "obj_square003");
//	local square4 = ArrangePointGimmick_("o_com_29", model_square, "obj_square004");
//	local square5 = ArrangePointGimmick_("o_com_29", model_square, "obj_square005");
//	local square6 = ArrangePointGimmick_("o_com_29", model_square, "obj_square006");
//	local square7 = ArrangePointGimmick_("o_com_29", model_square, "obj_square007");
//	local square8 = ArrangePointGimmick_("o_com_29", model_square, "obj_square008");
//	local square9 = ArrangePointGimmick_("o_com_29", model_square, "obj_square009");
//	local square10 = ArrangePointGimmick_("o_com_29", model_square, "obj_square010");
//	local square11 = ArrangePointGimmick_("o_com_29", model_square, "obj_square011");
//	local square12 = ArrangePointGimmick_("o_com_29", model_square, "obj_square012");
//	local square13 = ArrangePointGimmick_("o_com_29", model_square, "obj_square013");
//	local square17 = ArrangePointGimmick_("o_com_29", model_square, "obj_square017");
//	local square18 = ArrangePointGimmick_("o_com_29", model_square, "obj_square018");
//	local square19 = ArrangePointGimmick_("o_com_29", model_square, "obj_square019");
//	local square20 = ArrangePointGimmick_("o_com_29", model_square, "obj_square020");
//	local square21 = ArrangePointGimmick_("o_com_29", model_square, "obj_square021");
//	local square24 = ArrangePointGimmick_("o_com_29", model_square, "obj_square024");
//	local square25 = ArrangePointGimmick_("o_com_29", model_square, "obj_square025");
//	local square26 = ArrangePointGimmick_("o_com_29", model_square, "obj_square026");
//	local square27 = ArrangePointGimmick_("o_com_29", model_square, "obj_square027");

	// ����i�Łj
//	local circle00 = ArrangePointGimmick_("o_com_30", model_circle, "obj_circle000");
//	local circle01 = ArrangePointGimmick_("o_com_30", model_circle, "obj_circle001");
//	local circle02 = ArrangePointGimmick_("o_com_33", model_poison, "obj_circle002");
//	local circle07 = ArrangePointGimmick_("o_com_33", model_poison, "obj_circle007");
//	local circle08 = ArrangePointGimmick_("o_com_33", model_poison, "obj_circle008");
//	local circle09 = ArrangePointGimmick_("o_com_33", model_poison, "obj_circle009");
//	local circle10 = ArrangePointGimmick_("o_com_33", model_poison, "obj_circle010");

	// ����
//	local float_s04 = ArrangePointGimmick_("o_G00_07", model_float_s, "obj_float_s004");			//���g�p
//	local float_s05 = ArrangePointGimmick_("o_G00_07", model_float_s, "obj_float_s005");
//	local float_s06 = ArrangePointGimmick_("o_G00_07", model_float_s, "obj_float_s006");
//	local float_s07 = ArrangePointGimmick_("o_G00_07", model_float_s, "obj_float_s007");

	
	// ��----------------- 1�J�b�g�ڂŎg�p ------------------��
	// �X�C�b�`
	local switch00 = ArrangePointGimmick_("o_com_19", model_switch, "obj_switch000");
	SetPointPos_(switch00, "obj_switch000");
	SetMotion_(switch00, MOT_GIMMICK_2, BLEND_N);

	// ���������O
	local acceleration01 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration001");			//�J�b�g1
	local acceleration02 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration002");			//�J�b�g1
	local acceleration08 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration008");			//�J�b�g1
	local acceleration09 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration009");			//�J�b�g1
	local acceleration04 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration004");			//�J�b�g1

	// ���Ԃ鑫��
	local reverse00 = ArrangePointGimmick_("o_com_16", model_reverse, "obj_reverse000");			//�J�b�g1
	local reverse01 = ArrangePointGimmick_("o_com_16", model_reverse, "obj_reverse001");			//�J�b�g1
	local reverse02 = ArrangePointGimmick_("o_com_16", model_reverse, "obj_reverse002");			//�J�b�g1
	local reverse03 = ArrangePointGimmick_("o_com_16", model_reverse, "obj_reverse003");			//�J�b�g1
	local reverse04 = ArrangePointGimmick_("o_com_16", model_reverse, "obj_reverse004"); 			//�J�b�g1
	local reverse05 = ArrangePointGimmick_("o_com_16", model_reverse, "obj_reverse005");			//�J�b�g1
	local reverse06 = ArrangePointGimmick_("o_com_16", model_reverse, "obj_reverse006");			//�J�b�g1

	// �o�[�i�[
	local burner04 = ArrangePointGimmick_("o_com_26", model_burner, "obj_burner004");			//�J�b�g1
	local burner05 = ArrangePointGimmick_("o_com_26", model_burner, "obj_burner005");			//�J�b�g1
	local burner06 = ArrangePointGimmick_("o_com_26", model_burner, "obj_burner006");			//�J�b�g1
	local burner19 = ArrangePointGimmick_("o_com_26", model_burner, "obj_burner019");
	local burner20 = ArrangePointGimmick_("o_com_26", model_burner, "obj_burner020");
	local burner21 = ArrangePointGimmick_("o_com_26", model_burner, "obj_burner021");
	local burner22 = ArrangePointGimmick_("o_com_26", model_burner, "obj_burner022");

	// ����i�l�p�j
	local square00 = ArrangePointGimmick_("o_com_29", model_square, "obj_square000");			//�J�b�g1
	local square01 = ArrangePointGimmick_("o_com_29", model_square, "obj_square001");			//�J�b�g1
	local square14 = ArrangePointGimmick_("o_com_29", model_square, "obj_square014");			//�J�b�g1
	
	// ����i�Łj
	local circle03 = ArrangePointGimmick_("o_com_33", model_poison, "obj_circle003");			//�J�b�g1
	local circle04 = ArrangePointGimmick_("o_com_33", model_poison, "obj_circle004");			//�J�b�g1
	local circle05 = ArrangePointGimmick_("o_com_33", model_poison, "obj_circle005");			//�J�b�g1
	local circle06 = ArrangePointGimmick_("o_com_33", model_poison, "obj_circle006");			//�J�b�g1

	// ����
	local float_s00 = ArrangePointGimmick_("o_G00_07", model_float_s, "obj_float_s000");		//�J�b�g1
	local float_s01 = ArrangePointGimmick_("o_G00_07", model_float_s, "obj_float_s001");		//�J�b�g1
	local float_s03 = ArrangePointGimmick_("o_G00_07", model_float_s, "obj_float_s003");		//�J�b�g1
	local float_s08 = ArrangePointGimmick_("o_G00_07", model_float_s, "obj_float_s008");		//�J�b�g1
	local float_s09 = ArrangePointGimmick_("o_G00_08", model_float_l, "obj_float_s009");		//�J�b�g1

// ���t�H�O�ݒ�
	local density = GetFogDensity_();
	SetFogDensity_(5.0);											//�t�H�O�𔖂�����
	SetFogDistMax_(10000.0);
	
// ���J�����ݒ�
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");		// 0F�ڂ��f��
	DeleteTask_(task_cam);

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	//��������������������������������������
	// ���J�b�g�P����l���t�o���A�X���`�b�N�Љ�`�`�`�`�`�`�`�`
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");		// 250F	
	WaitTask(task_cam);
	Wait_(50);
	
	// ��----------------- �K�v�Ȃ��I�u�W�F�N�g���\�� ------------------��
	SetVisible(reverse03, false);
	SetVisible(reverse04, false);
	SetVisible(burner06, false);
	SetVisible(burner19, false);
	SetVisible(burner20, false);
	SetVisible(burner21, false);
	SetVisible(burner22, false);
	SetVisible(circle03, false);
	SetVisible(circle04, false);
	SetVisible(circle05, false);
	SetVisible(circle06, false);
	SetVisible(reverse03, false);
	SetVisible(reverse04, false);
	SetVisible(reverse06, false);
	SetVisible(square00, false);
	SetVisible(square01, false);
	SetVisible(square14, false);
	SetVisible(float_s00, false);
	SetVisible(float_s01, false);
	SetVisible(float_s03, false);
	SetVisible(float_s08, false);
	SetVisible(float_s09, false);
	
	//��������������������������������������
	// ���J�b�g�Q���A�X���`�b�N�Љ�P�`�`�`�`�`�`�`�`
	//��������������������������������������
	// ��----------------- 2�J�b�g�ڂ���g�p ------------------��
	//���������O
	local acceleration16 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration016");			//�J�b�g2

	//�o�[�i�[
	local burner07 = ArrangePointGimmick_("o_com_26", model_burner, "obj_burner007");			//�J�b�g2
	local burner08 = ArrangePointGimmick_("o_com_26", model_burner, "obj_burner008");			//�J�b�g2
	local burner09 = ArrangePointGimmick_("o_com_26", model_burner, "obj_burner009");			//�J�b�g2
	local burner10 = ArrangePointGimmick_("o_com_26", model_burner, "obj_burner010");			//�J�b�g2
	local burner16 = ArrangePointGimmick_("o_com_26", model_burner, "obj_burner016");			//�J�b�g2
	local burner17 = ArrangePointGimmick_("o_com_26", model_burner, "obj_burner017");			//�J�b�g2
	local burner18 = ArrangePointGimmick_("o_com_26", model_burner, "obj_burner018");			//�J�b�g2
	// ����
	local square15 = ArrangePointGimmick_("o_com_29", model_square, "obj_square015");			//�J�b�g2
	local square16 = ArrangePointGimmick_("o_com_29", model_square, "obj_square016");			//�J�b�g2
	local square22 = ArrangePointGimmick_("o_com_29", model_square, "obj_square022");			//�J�b�g2
	local square23 = ArrangePointGimmick_("o_com_29", model_square, "obj_square023");			//�J�b�g2
	local float_s02 = ArrangePointGimmick_("o_G00_07", model_float_s, "obj_float_s002");		//�J�b�g2
	// ��----------------- 2�J�b�g�ڂ���g�p ------------------��
	
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");		// 100F
	WaitTask(task_cam);
	Wait_(50);

	//��������������������������������������	
	// ���J�b�g3���{�X���f���`�`�`�`�`�`�`�`
	//��������������������������������������

	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");		// 100F
	WaitTask(task_cam);
	
	Wait_(10);
	PlaySE_("SE_BTL_728");
	SetMotion_(boss, MOT_SPELL_START, BLEND_M);
	WaitMotion(boss);
	PlaySE_("SE_BTL_729");
	SetMotion_(boss, MOT_SPELL_ACTUATE, BLEND_M);
	WaitMotion(boss);
	SetMotion_(boss, MOT_WAIT, BLEND_M);
	Wait_(10);
	
	EndDemo(FADE_COLOR_BLACK);
}

