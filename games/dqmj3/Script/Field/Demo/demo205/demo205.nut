//=============================================
//
//		demo205[6�̂̐Α�]
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
	local task_cam;

// �����\�[�X�Ǎ�
	// �M�~�b�N
	local obj_doa = ReadGimmick_("o_G02_02");
	local obj_statue1 = ReadGimmick_("o_G02_20");
	local obj_statue3 = ReadGimmick_("o_G02_21");
	local obj_statue5 = ReadGimmick_("o_G02_22");
	local model_ruler = ReadGimmick_("o_com_08");	// ���[���|�C���g
	// �L�����N�^�[
	local player = GetPlayerId_();					// ��l��

// ���z�u
	local doa = ArrangePointGimmick_("o_G02_02",obj_doa, "obj_doa000");
	local statue1 = ArrangePointGimmick_("o_G02_20",obj_statue1, "obj_statue000");
	local statue2 = ArrangePointGimmick_("o_G02_20",obj_statue1, "obj_statue001");
	local statue3 = ArrangePointGimmick_("o_G02_21",obj_statue3, "obj_statue002");
	local statue4 = ArrangePointGimmick_("o_G02_21",obj_statue3, "obj_statue003");
	local statue5 = ArrangePointGimmick_("o_G02_22",obj_statue5, "obj_statue004");
	local statue6 = ArrangePointGimmick_("o_G02_22",obj_statue5, "obj_statue005");
	// ���[���|�C���g
	local ruler = ArrangePointGimmick_("o_com_08", model_ruler, "obj_ruler000");
	
	// ��l��
	SetPointPos_(player, "player000");

// �����Ԑݒ�
	SetTime_(START_TIME_ZONE_NIGHT);

// ���J�����ݒ�
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	DeleteTask_(task_cam);

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	//��������������������������������������
	//���J�b�g1 �Α��Y�[���C���~6
	//��������������������������������������
	WaitLod_();
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	WaitTask(task_cam);
	Wait_(50);
	DeleteTask_(task_cam);
	
	
// �����莆������
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	WaitTask(task_cam);
	Wait_(60);
	DeleteTask_(task_cam);
	
	
	//��������������������������������������
	//���J�b�g2 �`��l���ƉB�����`
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye006", "anmtgt006");	

	WaitLod_();
	Wait_(5);
	WaitFade_();
	Wait_(150);
	DeleteTask_(task_cam);
	

	EndDemo(FADE_COLOR_BLACK);
}
