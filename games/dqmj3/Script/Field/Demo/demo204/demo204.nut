//=============================================
//
//		demo204[�n���P�K�ւ̊K�i]
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
	local efc_player,efc_smoke,efc_stone1,efc_stone2;

// ���G�t�F�N�g�Ǎ�
	LoadEffect_("ef726_01_nat_parapara");		//�V��Ȃǂ��痎���Ă���p���p��	
	LoadEffect_("ef721_03_nat_smoke_n03");		//��1

//	���M�~�b�N�ǂݍ���
	local obj_tobira = ReadGimmick_("o_G02_01");
	local tobira = ArrangePointGimmick_("o_G02_01",obj_tobira, "obj_tobira000");
	
	local obj_statue0 = ReadGimmick_("o_G02_20");	//�Α��`�@�k��
	local statue = ArrangePointGimmick_("o_G02_20",obj_statue0, "obj_hidariue000")
	
	local obj_statue1 = ReadGimmick_("o_G02_20");	//�Α��a�@�k��
	local statue = ArrangePointGimmick_("o_G02_21",obj_statue1, "obj_migiue000");	
	
	local obj_statue2 = ReadGimmick_("o_G02_21");	//�Α��b�@�쐼
	local statue2 = ArrangePointGimmick_("o_G02_21",obj_statue2, "obj_hidarisita000");	
	
	local obj_statue3 = ReadGimmick_("o_G02_21");	//�Α��c�@�쓌
	local statue3 = ArrangePointGimmick_("o_G02_21",obj_statue3, "obj_migisita000");	
	
// �����Ԑݒ�
	SetTime_(START_TIME_ZONE_NIGHT);
	
// ���J�����ݒ�
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	//��������������������������������������
	//���Α��Y�[���C��
	//��������������������������������������

	//�Α�A	
	WaitLod_();
	Wait_(5);
	WaitFade_();
	Wait_(60);

	//�Α�B
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");	

	WaitLod_();
	Wait_(5);
	WaitFade_();
	Wait_(90);
	DeleteTask_(task_cam);
	
	//�Α�C
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");	

	WaitLod_();
	Wait_(5);
	WaitFade_();
	Wait_(90);
	DeleteTask_(task_cam);
	
	//�Α�D
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");	

	WaitLod_();
	Wait_(5);
	WaitFade_();
	Wait_(90);
	DeleteTask_(task_cam);

	//��������������������������������������
	//�������J���V�[��
	//��������������������������������������

	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	PlaySE_("SE_FLD_129");												// �G���x�[�^�[�N�����̐U�����iJ2�j
	
	//�n�k
	StartEarthQuake_(3, 3, 3);
	Wait_(30);
	
	//�����J���M�~�b�N
	SetMotion_(tobira, MOT_GIMMICK_1, BLEND_N);							// �����J��
	PlaySE_("SE_DEM_105");												//�����J��SE
	Wait_(3);
	SetMotionSpeed_(tobira, 0.18);										// ���[�V�������������ɂȂ�
	
	efc_smoke = SetPointWorldEffect_("ef721_03_nat_smoke_n03", "efc_smoke000");//��
	SetEffectScale_(efc_smoke, 2.0);
	Wait_(20);
	StartEarthQuake_(-1, 3, 0.5);

	
	//�G�t�F�N�g
	//-----------------------------------------------
	efc_stone1 = SetPointWorldEffect_("ef726_01_nat_parapara", "efc_stone000");	//�΂̔j��
	SetEffectScale_(efc_stone1, 1.2);
	
	efc_stone2 = SetPointWorldEffect_("ef726_01_nat_parapara", "efc_stone001");	//�΂̔j��
	SetEffectScale_(efc_stone2, 1.2);
	//-----------------------------------------------
	
	Wait_(20);

	DeleteEffectEmitter_(efc_stone1);
	DeleteEffectEmitter_(efc_stone2);
	
	
	Wait_(10);
	efc_stone1 = SetPointWorldEffect_("ef726_01_nat_parapara", "efc_stone000");	//�΂̔j��
	SetEffectScale_(efc_stone1, 1.2);
	
	efc_stone2 = SetPointWorldEffect_("ef726_01_nat_parapara", "efc_stone001");	//�΂̔j��
	SetEffectScale_(efc_stone2, 1.2);
	Wait_(5);
	DeleteEffectEmitter_(efc_stone1);
	DeleteEffectEmitter_(efc_stone2);
	//-----------------------------------------------	

	Wait_(20);
	efc_stone1 = SetPointWorldEffect_("ef726_01_nat_parapara", "efc_stone000");	//�΂̔j��
	SetEffectScale_(efc_stone1, 1.2);
	
	efc_stone2 = SetPointWorldEffect_("ef726_01_nat_parapara", "efc_stone001");	//�΂̔j��
	SetEffectScale_(efc_stone2, 1.2);
	Wait_(35);
	DeleteEffectEmitter_(efc_stone1);
	DeleteEffectEmitter_(efc_stone2);
	Wait_(20);
	
	//-----------------------------------------------
	
	StopEarthQuake_();				//�n�k�X�g�b�v
	SetMotion_(tobira, MOT_GIMMICK_2, BLEND_N);									// �����J��L	
	DeleteTask_(task_cam);
	Wait_(30);

	//===============================================
	//*�V�X�e�����b�Z�[�W
	// �K�i���o�������B
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_204_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	//=====================================
	//�t�F�[�h�A�E�g
	//=====================================
	
	EndDemo(FADE_COLOR_BLACK);
}
