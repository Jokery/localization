//=============================================
//
//		demo001[�I�[�v�j���O�f��_1(������)]
//
//=============================================

//-------------------------------------------------------------------------
//
//		�ǂݍ��݁E�z�u
//
//-------------------------------------------------------------------------
function Update()
{
//	DummyMsg();
// �����Ԑݒ�
	SetTime_(18400);											// ��(���Ă�)
	
// ���ϐ���`
	local task_cam, task_reactor;
	local task_killer00, task_killer01, task_killer02, task_step, task_step01;
	local efc_engineer, efc_ractor00, efc_ractor01, efc_ractor02, efc_window, efc_light;
	local efc_fall00, efc_fall01, efc_fall02, efc_fall03, efc_fall04;

// �����\�[�X�Ǎ�
	// �M�~�b�N
	local model_reactor = ReadGimmick_("o_dem_11");				// ���A�N�^�[�P�[�X
	local model_reactor2 = ReadGimmick_("o_dem_07");			// ���A�N�^�[
	local model_window = ReadGimmick_("o_E01_01");				// ��
	// �L�����N�^�[
	local player = GetPlayerId_();								// ��l��
	local model_engineer = ReadNpc_("n037");					// �Z�p�ҁi�X�N�G�j�v�]�ŁA�L������ύX�j
	local model_killer = ReadNpc_("m120_01");					// �L���[�}�V��
	// �G�t�F�N�g
	LoadEffect_("ef800_04_flying_reactor01");					// ���A�N�^�[�̋O��
	LoadEffect_("ef800_05_flying_reactor02");					// ���A�N�^�[��s�J�n
	LoadEffect_("ef800_06_flying_reactor03");					// ���A�N�^�[����
	LoadEffect_("ef723_01_nat_explosion_n01");					// �ėp����01
	LoadEffect_("ef726_01_nat_parapara");						// ������
	LoadEffect_("ef800_12_crash_window");						// ���̔j��
	LoadEffect_("ef800_08_flying_reactor05");					// �L���[��	
	
	
	// ���C�A�E�g
	LoadLayout_("op_credit");

// ���z�u
	// ��l��
	SetPos_(player, Vec3(0, -100, 0));

	// �Z�p��
	local engineer = ArrangePointNpc_(model_engineer, "npc_engineer000");

	// ���A�N�^�[�P�[�X
	local reactor = ArrangePointGimmick_("o_dem_11", model_reactor, "obj_reactor000");
	SetMotion_(reactor, MOT_GIMMICK_1, BLEND_N);											// �J�������
	
	//���̏�̃��A�N�^�[
	local reactor_desk = ArrangePointGimmick_("o_dem_07", model_reactor2, "npc_engineer000");
	SetMotion_(reactor_desk, MOT_GIMMICK_4, BLEND_N);
	
	// ��
	local window = ArrangePointGimmick_("o_E01_01", model_window, "obj_window000");
	SetMotion_(window, MOT_GIMMICK_0, BLEND_N);												// ���������O�̏��
	
	// �L���[�}�V��
	local killer00 = ArrangePointNpc_(model_killer, "npc_killer000");
	local killer01 = ArrangePointNpc_(model_killer, "npc_killer100");
	local killer02 = ArrangePointNpc_(model_killer, "npc_killer200");
	SetScaleSilhouette(killer00, SCALE.N, SILHOUETTE_WIDTH.S);
	SetScaleSilhouette(killer01, SCALE.N, SILHOUETTE_WIDTH.S);
	SetScaleSilhouette(killer02, SCALE.N, SILHOUETTE_WIDTH.S);
	
// ����풓���[�V�����Ǎ�
	// �Z�p��
	local engineer_work_L = ReadMotion_(engineer, "n012_work_L");				// ��Ƃ���L
	local engineer_work_end_L = ReadMotion_(engineer, "n012_work_end_L");		// ��Ɗ���L
	local engineer_turn = ReadMotion_(engineer, "n012_turn");					// ��Ɗ������U��Ԃ遨�X�C�b�`������
	local engineer_look_up_L = ReadMotion_(engineer, "n012_look_up_L");			// �������L
	local engineer_hold = ReadMotion_(engineer, "n012_hold_reactor");			// ���A�N�^�[������
	local engineer_hold_L = ReadMotion_(engineer, "n012_hold_reactor_L");		// ���A�N�^�[������L
	local engineer_lift_pod = ReadMotion_(engineer, "n012_lift_pod");			// ���A�N�^�[�P�[�X���f����
	local engineer_lift_pod_L = ReadMotion_(engineer, "n012_lift_pod_L");		// ���A�N�^�[�P�[�X���f����L

// �����[�V�����ݒ�
	SetMotion_(engineer, engineer_work_L, BLEND_N);								// ��Ƃ���L

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------
	SetFadePlane_(FADE_PLANE.PLANE_3D);									// �ʏ���t�F�[�h�X�s�[�h�𒷂�����ׁA���ʊ֐����g�p���Ȃ�
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 1);
	Wait_(100);
	SetLayoutAnime_("sq_presents", false);								// ���C�A�E�g�u�X�N�G�j�v���[���c
	WaitLayoutAnime();	
	
	PlaySE_("SE_SKL_040");		// ������
	Wait_(60);
	
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 120);
	
	// ���J�b�g�P���Z�p�҂փY�[���C���`�`�`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");		// 240F
	Wait_(80);
	
	// �P��ڂ̔���
	PlaySE_("SE_SKL_040");		// ������
	Wait_(5);
	
	efc_fall00 = SetPointWorldEffect_("ef726_01_nat_parapara", "efc_fall000");
	Wait_(5);
	DeleteEffectEmitter_(efc_fall00);
	
	efc_fall01 = SetPointWorldEffect_("ef726_01_nat_parapara", "efc_fall001");
	Wait_(10);
	DeleteEffectEmitter_(efc_fall01);
	
	Wait_(60);
	
	// �Q��ڂ̔���
	PlaySE_("SE_SKL_040");		// ������
	Wait_(5);
	
	efc_fall02 = SetPointWorldEffect_("ef726_01_nat_parapara", "efc_fall002");
	Wait_(5);
	DeleteEffectEmitter_(efc_fall02);
	
	efc_fall03 = SetPointWorldEffect_("ef726_01_nat_parapara", "efc_fall003");
	Wait_(5);
	DeleteEffectEmitter_(efc_fall03);
	
	efc_fall04 = SetPointWorldEffect_("ef726_01_nat_parapara", "efc_fall004");
	Wait_(5);
	DeleteEffectEmitter_(efc_fall04);
	
	WaitTask(task_cam);
	DeleteTask_(task_cam);
	
	// ���J�b�g�Q���Z�p�҂ƃ��A�N�^�[�`�`�`�`�`�`�`�`�`�`�`�`�`
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	
	PlaySE_("SE_SKL_040");		// ������
	StartEarthQuake_(12, 3, 0.5);
	Wait_(12);
	StartDecayEarthQuake_(12, 3, 0.5);
	Wait_(12);
	
	PlaySE_("SE_FLD_054");		// ���
	
	//===============================================
	// *���W�X�^���X�Z�p��
	// �u�c�c���������@���������Ȃ񂾁I
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_001_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	Wait_(30);
	SetMotion_(engineer, engineer_work_end_L, BLEND_L);					// ��Ɗ���L
	Wait_(20);
	
	// ���J�b�g�R�����A�N�^�[�t�o�`�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	SetMotion_(engineer, engineer_hold, BLEND_XL);						// ���[�V�����@���A�N�^�[������
	Wait_(2);
	SetMotion_(reactor_desk, MOT_GIMMICK_5, BLEND_XL);					// �M�~�b�N�@���A�N�^�[���J�n
	WaitMotion(reactor_desk);
	SetMotion_(engineer, engineer_hold_L, BLEND_M);						// ���[�V�����@���A�N�^�[������L	
	SetMotion_(reactor_desk, MOT_GIMMICK_3, BLEND_M);					// �M�~�b�N�@���A�N�^�[����L
	
	//===============================================
	// *���W�X�^���X�Z�p��
	// �u�ł��������I�@���Ƃ͂�����c�c�B
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_001_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================	

	task_cam = Task_AnimeMoveCamera_("anmeye005", "anmtgt005");			// 40F
	WaitTask(task_cam);
	efc_light = SetSelectBoneEffectSetOffset_("ef800_08_flying_reactor05", reactor_desk, ATTACH_GLOBAL, Vec3(0.0, 0.0, 0.0));		
	
	//�����A�N�^�[�̓����ƍ��킹�邽�߂Ɉ�u�ҋ@���[�V�����ɐ؂�ւ��Ă���܂�
//	SetMotion_(engineer, MOT_WAIT, BLEND_N);							// ���[�V�������Z�b�g�̂��ߑҋ@���[�V����
//	SetMotion_(engineer, engineer_hold_L, BLEND_N);						// ���[�V�����@���A�N�^�[������L
	Wait_(2);
	PlaySE_("SE_DEM_128");												// ���A�N�^�[�N��SE
//	SetMotion_(reactor_desk, MOT_GIMMICK_6, BLEND_M);					// �M�~�b�N�@���A�N�^�[�Ђ���
	
	Wait_(65);
	
	// ���J�b�g�S���L���[�}�V���ړ��`�`�`�`�`�`�`�`�`�`�`�`�`�`
	SetStepSe_(killer00, SILENT_STEP_SE);											// ������ �����ɂ���
	SetStepSe_(killer01, SILENT_STEP_SE);											// ������ �����ɂ���
	SetStepSe_(killer02, SILENT_STEP_SE);											// ������ �����ɂ���
	task_step = Task_ChangeStepSe(killer00, "SE_FLD_034", 8.5);
	Wait_(5);
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");			// 180F
	SetVisible(reactor_desk, false);									//���̏�̃��A�N�^�[��\��
	
	// ���[�V�����Đ��^�C�~���O���o���o���ɂ���
	SetMotion_(killer00, MOT_WALK, BLEND_N);
	SetMotionSpeed_(killer00, 2.0);
	task_killer00 = Task_MoveForward_(killer00, 2.0, false);
	Wait_(20);
	
	SetMotion_(killer01, MOT_WALK, BLEND_N);
	SetMotionSpeed_(killer01, 2.0);
	task_killer01 = Task_MoveForward_(killer01, 2.0, false);
	task_step01 = Task_ChangeStepSe(killer01, "SE_FLD_034", 8.5);
	Wait_(20);
	
	SetMotion_(killer02, MOT_WALK, BLEND_N);
	SetMotionSpeed_(killer02, 2.0);
	task_killer02 = Task_MoveForward_(killer02, 2.0, false);
	
	// �P��ڂ̔���
	PlaySE_("SE_SKL_040");		// ������
	Wait_(5);
	
	efc_fall00 = SetPointWorldEffect_("ef726_01_nat_parapara", "efc_fall100");
	Wait_(5);
	DeleteEffectEmitter_(efc_fall00);
	
	efc_fall01 = SetPointWorldEffect_("ef726_01_nat_parapara", "efc_fall101");
	Wait_(5);
	DeleteEffectEmitter_(efc_fall01);
	
	efc_fall02 = SetPointWorldEffect_("ef726_01_nat_parapara", "efc_fall102");
	Wait_(5);
	DeleteEffectEmitter_(efc_fall02);
	
	Wait_(60);
	
	// �Q��ڂ̔���
	PlaySE_("SE_SKL_040");		// ������
	Wait_(5);
	
	efc_fall03 = SetPointWorldEffect_("ef726_01_nat_parapara", "efc_fall103");
	Wait_(5);
	DeleteEffectEmitter_(efc_fall03);
	
	efc_fall04 = SetPointWorldEffect_("ef726_01_nat_parapara", "efc_fall104");
	Wait_(5);
	DeleteEffectEmitter_(efc_fall04);
	
	WaitTask(task_cam);
	
	DeleteTask_(task_killer00);
	DeleteTask_(task_killer01);
	DeleteTask_(task_killer02);

	//�L���[�}�V���ʒu����
	SetPointPos_(killer00, "npc_killer001");
	SetPointPos_(killer01, "npc_killer101");
	SetPointPos_(killer02, "npc_killer201");
	
	SetMotionSpeed_(killer00, 1.5);
	SetMotionSpeed_(killer01, 1.2);
	SetMotionSpeed_(killer02, 1.6);
	
	task_killer00 = Task_AnimeMove_(killer00, "anm_killer001");
	task_killer01 = Task_AnimeMove_(killer01, "anm_killer101");
	DeleteTaskStepSe(killer00, task_step);
	DeleteTaskStepSe(killer01, task_step01);
	SetStepSe_(killer00, SILENT_STEP_SE);											// ������ �����ɂ���
	SetStepSe_(killer01, SILENT_STEP_SE);											// ������ �����ɂ���
	SetStepSe_(killer02, SILENT_STEP_SE);											// ������ �����ɂ���
	task_step01 = Task_ChangeStepSe(killer00, "SE_FLD_034", 10.5);

	Wait_(10);
	task_killer02 = Task_AnimeMove_(killer02, "anm_killer201");
	task_step = Task_ChangeStepSe(killer02, "SE_FLD_034", 10.5);
	// ���J�b�g�T���L���[�}�V���A�Y�[���A�E�g�`�`�`�`�`�`�`�`�`
	Wait_(5);
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");			// 75F

//	Wait_(70);
	
	WaitTask(task_killer00);
	SetMotion_(killer00, MOT_WAIT, BLEND_M);
	DeleteTask_(task_killer00);
	Wait_(5);
	DeleteTaskStepSe(killer01, task_step01);
	
	WaitTask(task_killer01);
	SetMotion_(killer01, MOT_WAIT, BLEND_M);
	DeleteTask_(task_killer01);
	
	WaitTask(task_killer02);
	SetMotion_(killer02, MOT_WAIT, BLEND_L);
	DeleteTask_(task_killer02);
	Wait_(5);
	DeleteTaskStepSe(killer02, task_step);

	WaitTask(task_cam);
	Wait_(50);
	DeleteTask_(task_cam);
	
	Wait_(15);
	
	SetMotion_(engineer, engineer_turn, BLEND_N);						// ��Ɗ������U��Ԃ遨�X�C�b�`������
	SetMotion_(killer00, MOT_WAIT, BLEND_N);
	SetMotion_(killer01, MOT_WAIT, BLEND_N);
	SetMotion_(killer02, MOT_WAIT, BLEND_N);

	SetMotionSpeed_(killer00, 1.0);
	SetMotionSpeed_(killer01, 1.0);
	SetMotionSpeed_(killer02, 1.0);	
	
	// ���J�b�g5.5���Z�p�҃X�C�b�`�������`�`�`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye006", "anmtgt006");			// 100F
	
	Wait_(85);
	PlaySE_("SE_DEM_056");												// ��SE�E�|�b�h�܂�
	
	SetMotion_(reactor, MOT_GIMMICK_3, BLEND_N);						// ���A�N�^�[�P�[�X������
	WaitMotion(reactor);
	
	WaitMotion(engineer);
	
	Wait_(30);
	
	WaitTask(task_cam);
	
	SetPointPos_(reactor, "npc_engineer000");
	DeleteTask_(task_cam);

	// ���J�b�g�U�����A�N�^�[�A�㏸����`�`�`�`�`�`�`�`�`�`�`�`
	
	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");
	
	SetMotion_(engineer, engineer_lift_pod, BLEND_N);					// ���[�V�����@���A�N�^�[�P�[�X������
	SetMotion_(reactor, MOT_GIMMICK_5, BLEND_N);						// �M�~�b�N�@���A�N�^�[�P�[�X����������J�n
	WaitMotion(engineer);
	SetMotion_(engineer, engineer_lift_pod_L, BLEND_M);					// ���[�V�����@���A�N�^�[������L
	WaitMotion(reactor);
	
	//===============================================
	// *���W�X�^���X�Z�p��
	// �u�Ƃǂ��I�@��]�̂Ƃ���܂ŁI
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_001_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	// ���J�b�g�V���L���[�}�V���A�J�����C���`�`�`�`�`�`�`�`�`�`
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");			// 80F
	SetMotion_(reactor, MOT_GIMMICK_6, BLEND_N);						// �M�~�b�N�@���A�N�^�[����L
	PlaySE_("SE_DEM_057");												// ��SE�E�|�b�h����

	efc_ractor02 = SetSelectBoneEffect_("ef800_05_flying_reactor02", reactor, ATTACH_GLOBAL);		//���A�N�^�[��s�J�n
	Wait_(10);
	task_reactor = Task_AnimeMoveNoFit_(reactor, "anm_reactor000");		// 60F
	
	efc_ractor00 = SetSelectBoneEffect_("ef800_04_flying_reactor01", reactor, ATTACH_GLOBAL);
	Wait_(60);
	DeleteEffectEmitter_(efc_ractor02);
	Wait_(10);
	
	SetMotion_(engineer, engineer_look_up_L, BLEND_L);					// �������L
	
	SetPointPos_(killer00, "npc_killer002");
	SetMotion_(killer00, MOT_WALK, BLEND_N);
	SetMotionSpeed_(killer00, 1.0);
	task_killer00 = Task_MoveToPointSetSpeed_(killer00, "npc_killer003", 1.0);
	
	WaitTask(task_killer00);
	DeleteTask_(task_killer00);
	SetMotion_(killer00, MOT_WAIT, BLEND_M);
	SetMotionSpeed_(killer00, 1.0);
	Wait_(15);
	
	WaitTask(task_cam);
	Wait_(15);
	
	
	//���A�N�^�[�؂�ւ��i�����������΂ɂȂ�s��̂��ߐV���ȃ��A�N�^�[�P�[�X�ɐ؂�ւ��j
	DeleteTask_(task_reactor);
	local reactor01 = ArrangePointGimmick_("o_dem_11", model_reactor, "obj_reactor000");
	SetMotion_(reactor01, MOT_GIMMICK_0, BLEND_N);
	efc_ractor01 = SetSelectBoneEffect_("ef800_04_flying_reactor01", reactor01, ATTACH_GLOBAL);

	SetVisible(reactor, false);											//�����グ�����A�N�^�[��\��
	DeleteEffectEmitter_(efc_ractor00);
	
	DeleteTask_(task_cam);
	
	
	// ���J�b�g�W�����A�N�^�[�A���i�`�`�`�`�`�`�`�`�`�`�`�`�`�`
	SetPointCameraEye_("cameye004");
	SetPointCameraTarget_("camtgt004");

	Wait_(35);
	PlaySE_("SE_DEM_058");												// ��SE�E�|�b�h���K���X������
	Wait_(5);
	efc_window = SetPointWorldEffect_("ef800_12_crash_window", "efc_window000");
	SetMotion_(window, MOT_GIMMICK_1, BLEND_M);							// ���������
	SetEffectScale_(efc_window, 1.0);

	task_reactor = Task_AnimeMoveNoFit_(reactor01, "anm_reactor001");	// 35F
	Wait_(16);
	
	// 16F�o�ߌ�A�A�j���J������ݒ肷��
	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");			// 20F
	Wait_(55);
	
	EndDemo(FADE_COLOR_BLACK);
}
