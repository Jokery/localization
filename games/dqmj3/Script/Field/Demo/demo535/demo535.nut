//=============================================
//
//		demo535[�}�X�^�[�Y���[�h_6(�ΎR)]
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
	local model_switch = ReadGimmick_("o_com_19");			// �X�C�b�`
	local model_burner = ReadGimmick_("o_com_26");			// �o�[�i�[
	local model_square = ReadGimmick_("o_com_29");			// ����i�l�p�j
	local model_slope = ReadGimmick_("o_com_31");			// �⓹
	local model_magma = ReadGimmick_("o_com_34");			// �}�O�}����
//	local model_float_m = ReadGimmick_("o_V00_09");			// ����(��)
	local model_float_l = ReadGimmick_("o_V00_10");			// ����(��)
	// �L�����N�^�[
	local player = GetPlayerId_();							// ��l��
	local model_boss = ReadNpc_("m079_00");					// ���ɂ���ڂ�

// ���z�u
	// ��============================= �I�u�W�F�N�g =============================��
	// ���z�u���̏���� 49 �ׁ̈A�����Ȃ��I�u�W�F�N�g��C.O���Ă���
	
	// ���������O
//	local acceleration00 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration000");
//	local acceleration01 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration001");
//	local acceleration02 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration002");
//	local acceleration03 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration003");
	local acceleration04 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration004");
	local acceleration05 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration005");
//	local acceleration06 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration006");
//	local acceleration07 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration007");
//	local acceleration08 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration008");
//	local acceleration09 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration009");
	local acceleration10 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration010");
	local acceleration11 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration011");
//	local acceleration12 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration012");
//	local acceleration13 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration013");
	local acceleration14 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration014");
	local acceleration15 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration015");
//	local acceleration16 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration016");
//	local acceleration17 = ArrangePointGimmick_("o_com_00", model_acceleration, "obj_acceleration017");
	
	// �X�C�b�`
	local switch00 = ArrangePointGimmick_("o_com_19", model_switch, "obj_switch000");
	SetMotion_(switch00, MOT_GIMMICK_2, BLEND_N);
	
	// �o�[�i�[
//	local burner00 = ArrangePointGimmick_("o_com_26", model_burner, "obj_burner000");
//	local burner01 = ArrangePointGimmick_("o_com_26", model_burner, "obj_burner001");
//	local burner02 = ArrangePointGimmick_("o_com_26", model_burner, "obj_burner002");
//	local burner03 = ArrangePointGimmick_("o_com_26", model_burner, "obj_burner003");
//	local burner04 = ArrangePointGimmick_("o_com_26", model_burner, "obj_burner004");
//	local burner05 = ArrangePointGimmick_("o_com_26", model_burner, "obj_burner005");
	local burner06 = ArrangePointGimmick_("o_com_26", model_burner, "obj_burner006");
	
	// ����i�l�p�j
	local square00 = ArrangePointGimmick_("o_com_29", model_square, "obj_square000");
//	local square01 = ArrangePointGimmick_("o_com_29", model_square, "obj_square001");
	local square02 = ArrangePointGimmick_("o_com_29", model_square, "obj_square002");
	local square03 = ArrangePointGimmick_("o_com_29", model_square, "obj_square003");
	local square04 = ArrangePointGimmick_("o_com_29", model_square, "obj_square004");
	local square05 = ArrangePointGimmick_("o_com_29", model_square, "obj_square005");
//	local square06 = ArrangePointGimmick_("o_com_29", model_square, "obj_square006");
//	local square07 = ArrangePointGimmick_("o_com_29", model_square, "obj_square007");
//	local square08 = ArrangePointGimmick_("o_com_29", model_square, "obj_square008");
//	local square09 = ArrangePointGimmick_("o_com_29", model_square, "obj_square009");
//	local square10 = ArrangePointGimmick_("o_com_29", model_square, "obj_square010");
//	local square11 = ArrangePointGimmick_("o_com_29", model_square, "obj_square011");
//	local square12 = ArrangePointGimmick_("o_com_29", model_square, "obj_square012");
//	local square13 = ArrangePointGimmick_("o_com_29", model_square, "obj_square013");
//	local square14 = ArrangePointGimmick_("o_com_29", model_square, "obj_square014");
	local square15 = ArrangePointGimmick_("o_com_29", model_square, "obj_square015");
//	local square16 = ArrangePointGimmick_("o_com_29", model_square, "obj_square016");//cut1�f�邪�Acut3�`���f�肵�Ă����̂Ŕ�\����
	local square17 = ArrangePointGimmick_("o_com_29", model_square, "obj_square017");
	local square18 = ArrangePointGimmick_("o_com_29", model_square, "obj_square018");
//	local square19 = ArrangePointGimmick_("o_com_29", model_square, "obj_square019");//cut3�f��ʒu�����Ӑ}�I�ɔ�\��
//	local square20 = ArrangePointGimmick_("o_com_29", model_square, "obj_square020");//cut3�f��ʒu�����Ӑ}�I�ɔ�\��
//	local square21 = ArrangePointGimmick_("o_com_29", model_square, "obj_square021");//cut3�f��ʒu�����Ӑ}�I�ɔ�\��
	local square22 = ArrangePointGimmick_("o_com_29", model_square, "obj_square022");
	local square23 = ArrangePointGimmick_("o_com_29", model_square, "obj_square023");
	local square24 = ArrangePointGimmick_("o_com_29", model_square, "obj_square024");
	local square25 = ArrangePointGimmick_("o_com_29", model_square, "obj_square025");
//	local square26 = ArrangePointGimmick_("o_com_29", model_square, "obj_square026");
//	local square27 = ArrangePointGimmick_("o_com_29", model_square, "obj_square027");
//	local square28 = ArrangePointGimmick_("o_com_29", model_square, "obj_square028");
	local square29 = ArrangePointGimmick_("o_com_29", model_square, "obj_square029");
//	local square30 = ArrangePointGimmick_("o_com_29", model_square, "obj_square030");
//	local square31 = ArrangePointGimmick_("o_com_29", model_square, "obj_square031");
	local square32 = ArrangePointGimmick_("o_com_29", model_square, "obj_square032");
//	local square33 = ArrangePointGimmick_("o_com_29", model_square, "obj_square033");
	
	// �⓹
	local slope00 = ArrangePointGimmick_("o_com_31", model_slope, "obj_slope000");
	local slope01 = ArrangePointGimmick_("o_com_31", model_slope, "obj_slope001");
	local slope02 = ArrangePointGimmick_("o_com_31", model_slope, "obj_slope002");
	local slope03 = ArrangePointGimmick_("o_com_31", model_slope, "obj_slope003");
//	local slope04 = ArrangePointGimmick_("o_com_31", model_slope, "obj_slope004");
//	local slope05 = ArrangePointGimmick_("o_com_31", model_slope, "obj_slope005");
//	local slope06 = ArrangePointGimmick_("o_com_31", model_slope, "obj_slope006");
	local slope07 = ArrangePointGimmick_("o_com_31", model_slope, "obj_slope007");
	local slope08 = ArrangePointGimmick_("o_com_31", model_slope, "obj_slope008");
	local slope09 = ArrangePointGimmick_("o_com_31", model_slope, "obj_slope009");
	local slope10 = ArrangePointGimmick_("o_com_31", model_slope, "obj_slope010");
	local slope11 = ArrangePointGimmick_("o_com_31", model_slope, "obj_slope011");
//	local slope12 = ArrangePointGimmick_("o_com_31", model_slope, "obj_slope012");//cut3�f��ʒu�����Ӑ}�I�ɔ�\��
	
	// �}�O�}����
	local magma00 = ArrangePointGimmick_("o_com_34", model_magma, "obj_magma000");
//	local magma01 = ArrangePointGimmick_("o_com_34", model_magma, "obj_magma001");
	local magma02 = ArrangePointGimmick_("o_com_34", model_magma, "obj_magma002");
//	local magma03 = ArrangePointGimmick_("o_com_34", model_magma, "obj_magma003");
//	local magma04 = ArrangePointGimmick_("o_com_34", model_magma, "obj_magma004");
//	local magma05 = ArrangePointGimmick_("o_com_34", model_magma, "obj_magma005");
	local magma06 = ArrangePointGimmick_("o_com_34", model_magma, "obj_magma006");//cut1�f��ʒu���������Ă����̂Œǉ�
	local magma07 = ArrangePointGimmick_("o_com_34", model_magma, "obj_magma007");
	local magma08 = ArrangePointGimmick_("o_com_34", model_magma, "obj_magma008");
//	local magma09 = ArrangePointGimmick_("o_com_34", model_magma, "obj_magma009");
	local magma10 = ArrangePointGimmick_("o_com_34", model_magma, "obj_magma010");
	local magma11 = ArrangePointGimmick_("o_com_34", model_magma, "obj_magma011");
	local magma12 = ArrangePointGimmick_("o_com_34", model_magma, "obj_magma012");
	local magma13 = ArrangePointGimmick_("o_com_34", model_magma, "obj_magma013");
	local magma14 = ArrangePointGimmick_("o_com_34", model_magma, "obj_magma014");
	local magma15 = ArrangePointGimmick_("o_com_34", model_magma, "obj_magma015");
	local magma16 = ArrangePointGimmick_("o_com_34", model_magma, "obj_magma016");
	local magma17 = ArrangePointGimmick_("o_com_34", model_magma, "obj_magma017");
	local magma18 = ArrangePointGimmick_("o_com_34", model_magma, "obj_magma018");
//	local magma19 = ArrangePointGimmick_("o_com_34", model_magma, "obj_magma019");
	local magma20 = ArrangePointGimmick_("o_com_34", model_magma, "obj_magma020");
//	local magma21 = ArrangePointGimmick_("o_com_34", model_magma, "obj_magma021");//cut3�f��ʒu�����Ӑ}�I�ɔ�\��
//	local magma22 = ArrangePointGimmick_("o_com_34", model_magma, "obj_magma022");//cut3�f��ʒu�����Ӑ}�I�ɔ�\��
//	local magma23 = ArrangePointGimmick_("o_com_34", model_magma, "obj_magma023");//cut3�f��ʒu�����Ӑ}�I�ɔ�\��
	
	// ����(��)
//	local float_m00 = ArrangePointGimmick_("o_V00_09", model_float_m, "obj_float_m000");
//	local float_m01 = ArrangePointGimmick_("o_V00_09", model_float_m, "obj_float_m001");
	
	// ����(��)
	local float_l00 = ArrangePointGimmick_("o_V00_10", model_float_l, "obj_float_l000");
//	local float_l01 = ArrangePointGimmick_("o_V00_10", model_float_l, "obj_float_l001");
	local float_l02 = ArrangePointGimmick_("o_V00_10", model_float_l, "obj_float_l002");
//	local float_l03 = ArrangePointGimmick_("o_V00_10", model_float_l, "obj_float_l003");
	// ��============================= �I�u�W�F�N�g =============================��
	
	// ��l��
	SetPointPos_(player, "player000");
	
	// �S�[���p�����X�^�[
	local boss = ArrangePointNpc_(model_boss, "npc_boss000");
	SetScaleSilhouette(boss, SCALE.G, SILHOUETTE_WIDTH.G);

// ���J�����ݒ�
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");		// 0F�ڂ��f��
	DeleteTask_(task_cam);

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	// ���J�b�g�P����l���t�o���A�X���`�b�N�Љ�P�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");		// 120F
	task_player = Task_WalkAroundToDir(player, 60, ROTATE_DEMO_DEF/3);
	
	WaitTask(task_player);
	SetMotion_(player, MOT_WAIT, BLEND_M);
	
	WaitTask(task_cam);
	Wait_(15);
	
	// ���J�b�g�Q���A�X���`�b�N�Љ�Q���{�X���f���`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");		// 200F
	WaitTask(task_cam);
	Wait_(15);
	
	// ���J�b�g�R���{�X�փY�[���C���`�`�`�`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");		// 75F
	WaitTask(task_cam);
	Wait_(10);
	PlaySE_("SE_FLD_096");
	SetMotion_(boss, MOT_SPELL_START, BLEND_M);
	WaitMotion(boss);
	SetMotion_(boss, MOT_SPELL_ACTUATE, BLEND_M);
	WaitMotion(boss);
	SetMotion_(boss, MOT_WAIT, BLEND_M);
	Wait_(10);
	
	EndDemo(FADE_COLOR_BLACK);
}
