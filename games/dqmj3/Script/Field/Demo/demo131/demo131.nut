//========================================================
//
//		demo131[�ړ����u�g�p_2(����)]
//
//========================================================

//-------------------------------------------------------------------------
//
//		�ǂݍ��݁E�z�u
//
//-------------------------------------------------------------------------

function Update()
{
	SetTime_(15120);								// ��	
	//=====================================
	//���[�J���ϐ��̐ݒ�
	//=====================================
	local task_cam, task_player;
	local efc_player, ef_tec01, ef_tec02, ef_tec03;
	
	//=====================================
	//�M�~�b�N�ݒu
	//=====================================
	local gimmick000 = ReadGimmick_("o_dem_00");
	local res_tele = ArrangePointGimmick_("o_dem_00", gimmick000, "obj_transfer000");
	
	//=====================================
	//�v���C���[�ݒu
	//=====================================
	//ID�̎擾
	local player = GetPlayerId_();
	
	//�ݒu
	SetPointPos_(player, "player000");
	
	//�����̌���
	SetDir_(player, 190);
	
	//=====================================
	//�G�t�F�N�g�̓ǂݍ���
	//=====================================
	LoadEffect_("ef732_01_tec_device_travel01");
	LoadEffect_("ef732_01_tec_device_travel02");
	LoadEffect_("ef732_01_tec_device_travel03");
	LoadEffect_("ef732_02_tec_device_travel02");
	LoadEffect_("ef732_03_tec_device_travel03");

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------
	//��������������������������������������
	//���J�b�g�P	�ړ����u�N��
	//��������������������������������������
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");									//F260

	StartDemo(FADE_COLOR_BLACK);
	
	Wait_(40);
	PlaySE_("SE_DEM_022");
	SetMotion_(res_tele, MOT_GIMMICK_1, 0);														//�ڑ����u�N��
	
	Wait_(190);
	SetMotion_(res_tele, MOT_GIMMICK_2, 0);														//�ڑ����u�N��
	Wait_(35);
	
	//��������������������������������������
	//���J�b�g2		��l����ї���
	//��������������������������������������
	DeleteTask_(task_cam);
	
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	
	Wait_(10);

	PlaySE_("SE_DEM_102");																		//��l���������яオ���Ă���ˏo�����܂ł̈�A��SE
	local ef_tec02 = SetPointWorldEffect_("ef732_02_tec_device_travel02", "obj_transfer000");	//��������
	SetMotion_(player, MOT_JUMP_UP, BLEND_M);
	task_player = Task_AnimeMoveNoFit_(player, "anm_player001");								//��l�� ���ɕ���
	ef_tec03 = SetSelectBoneEffect_("ef732_03_tec_device_travel03", player, ATTACH_GLOBAL);		//��l���̎���̌�
	Wait_(30);
	
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");									//��l�� ��ї���
	
	DeleteTask_(task_player);
	
	task_player = Task_AnimeMoveNoFit_(player, "anm_player000");
	
	Wait_(20);
	SetMotion_(player, MOT_SPECIAL_WAIT, BLEND_XL);	
	
			
	Wait_(40);
	SetMotion_(player, MOT_SPECIAL_RUN, BLEND_M);
	local ef_tec01 = SetPointWorldEffect_("ef732_01_tec_device_travel01", "obj_transfer000");	//�ړ����u�A�ۂ�EF
	Wait_(15);
	
	Wait_(40);

	//��������������������������������������
	//���f���I��
	//��������������������������������������
	
	EndDemo(FADE_COLOR_BLACK);
}
