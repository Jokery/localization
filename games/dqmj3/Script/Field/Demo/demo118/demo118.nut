//=============================================
//
//		demo118[������n_2(�����ړ�)]
//
//=============================================

//-------------------------------------------------------------------------
//
//		�ǂݍ��݁E�z�u
//
//-------------------------------------------------------------------------
function Update()
{

	SetTime_(8700);		// ��

// ���ϐ���`
	local task_cam;
	local efc_cloud, efc_transfer;

// �����\�[�X�Ǎ�
	// �M�~�b�N
	local model_transfer = ReadGimmick_("o_dem_00");	// �]�����u
	local model_map = ReadGimmick_("o_dem_06");			// �����s�s�i���j
	local model_window = ReadGimmick_("o_A00_04");		// �Z���^�[�r���̑�
	// �G�t�F�N�g
	LoadEffect_("ef732_02_tec_device_travel02");		// �ړ����u�A�y��
	LoadEffect_("ef811_03_move_city01");				// �_
	LoadEffect_("ef811_04_move_city02");				// ��n�p���p��

// ���z�u
	// �]�����u
	local transfer00 = ArrangePointGimmick_("o_dem_00", model_transfer, "obj_transfer000");
	local transfer01 = ArrangePointGimmick_("o_dem_00", model_transfer, "obj_transfer001");
	// �����s�s�i���j
	local res_map = ArrangePointGimmick_("o_dem_06", model_map, "obj_map000");
	// �Z���^�[�r���̑�
	local window = ArrangePointGimmick_("o_A00_04", model_window, "obj_window000");
	SetMotion_(window, MOT_GIMMICK_1, BLEND_N);

// ���J�����ݒ�
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);

	//��������������������������������������
	//���J�b�g1�@�n�k����
	//��������������������������������������
	
	Wait_(10);
//	PlayLoopSE_("SE_DEM_013");
	StartEarthQuake_(10, 3, 2);
	Wait_(10);
	StartEarthQuake_(10, 4, 3);
	Wait_(10);
	StartEarthQuake_(20, 4, 3);
	Wait_(20);
	StartEarthQuake_(20, 5, 5);
	Wait_(20);
	StartEarthQuake_(50, 5, 6);
	Wait_(50);
	
	//��������������������������������������
	//���J�b�g2�@��n�̃A�b�v
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");
	
	//��n�p���p��
	StartEarthQuake_(30, 5, 5);
	uSetMultiEffect(30);
	
	StartEarthQuake_(60, 4, 6);
	uSetMultiEffect(60);
	
	StartEarthQuake_(60, 4, 7);
	uSetMultiEffect(60);
	
	StartEarthQuake_(60, 5, 8);
	uSetMultiEffect(60);
	
	//��������������������������������������
	//���J�b�g3�@�嗤�S�̂������`��
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	efc_cloud = SetPointWorldEffect_("ef811_03_move_city01", "efc_cloud000");		// �_
	
	StartEarthQuake_(60, 4, 4);
	Wait_(60);
	
	StartEarthQuake_(40, 4, 3);
	Wait_(40);
	
	StartEarthQuake_(60, 4, 3);
	Wait_(50);
	StopBgm_(BGM_STOP_DEF);
	Wait_(10);
	
	//��������������������������������������
	//���J�b�g4�@�]�����u�N��
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");

	StartEarthQuake_(10, 3, 2);
	Wait_(10);
//	StopLoopSE_(10);	
	StartEarthQuake_(10, 4, 1);
	Wait_(40);
	
	efc_transfer = SetPointWorldEffect_("ef732_02_tec_device_travel02", "obj_transfer000");
	PlaySE_("SE_DEM_023");
	Wait_(100);
	
	EndDemo(FADE_COLOR_BLACK);
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�����̃G�t�F�N�g�z�u
//------------------------------------------------
//	����	: wait	�҂�����
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uSetMultiEffect(wait)
{
	SetPointWorldEffect_("ef811_04_move_city02", "efc_rock000");
	SetPointWorldEffect_("ef811_04_move_city02", "efc_rock001");
	SetPointWorldEffect_("ef811_04_move_city02", "efc_rock002");
	SetPointWorldEffect_("ef811_04_move_city02", "efc_rock003");
	SetPointWorldEffect_("ef811_04_move_city02", "efc_rock004");
	SetPointWorldEffect_("ef811_04_move_city02", "efc_rock005");
}
