//=============================================
//
//		demo407[���S�̊č�����_2(�č���)]
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
	
// ���z�u
	//----------
	// ��NPC�z�u
	//----------
	// ID������
	local
	player				,
	g_npc_prizoner_a	, 
	g_npc_prizoner_b	,
	g_npc_prizoner_c	,
	g_npc_prizoner_d	,
	g_npc_jailer_a		,
	g_npc_jailer_b		,
	g_npc_jailer_c		,
	g_npc_jailer_d		,
	npc_ittaburu		;

	// ���\�[�X�ǂݍ���
	local k_player		 = ReadNpc_("n027");		// ��l��(�L�O���~)

	local id_toge		 = ReadNpc_("m127_02");		// ���lA�F�g�Q����ځ[
	local id_saboten	 = ReadNpc_("m064_00");		// ���lB�F�T�{�e���{�[��
	local id_spike		 = ReadNpc_("m127_01");		// ���lC�F�X�p�C�N�w�b�h
	local id_dessert	 = ReadNpc_("m132_01");		// ���lD�F�f�U�[�g�^���N

	local id_samayou	 = ReadNpc_("m111_00");		// �Ŏ�A�F���܂悤��낢
	local id_sli_knight	 = ReadNpc_("m008_00");		// �Ŏ�B�F�X���C���i�C�g
	local id_ookizuchi	 = ReadNpc_("m035_00");		// �Ŏ�C�F�������Â�
	local id_gaikotu	 = ReadNpc_("m101_00");		// �Ŏ�D�F��������
	
	local id_ittaburu	 = ReadNpc_("m205_00");		// �C�b�^�u��
	
	// ����l��(�L�O���~)
	player = ArrangePointNpc_(k_player, "player000");
	SetScaleSilhouette(player, 0.6 ,0.6);
	SetVisible(player,			 false);							// ��\���ɂ���	
	SetStepSe_(player, SILENT_STEP_SE);
	// �����l�`
	g_npc_prizoner_a = ArrangePointNpc_(id_toge, "npc_prisoner_a000");
	SetScaleSilhouette(g_npc_prizoner_a,	 1,			 1);
	
	// �����l�a
	g_npc_prizoner_b = ArrangePointNpc_(id_saboten, "npc_prisoner_b000");
	SetScaleSilhouette(g_npc_prizoner_b,	 SCALE.SABOTENBOUL,	 SILHOUETTE_WIDTH.SABOTENBOUL);
	
	// �����l�b
	g_npc_prizoner_c = ArrangePointNpc_(id_spike, "npc_prisoner_c000");
	SetScaleSilhouette(g_npc_prizoner_c,	 SCALE.N,			 SILHOUETTE_WIDTH.N);	// SCALE.N=0.6 SILHOUETTE_WIDTH.N=0.8
	
	// �����l�c
	g_npc_prizoner_d = ArrangePointNpc_(id_dessert, "npc_prisoner_d000");
	SetScaleSilhouette(g_npc_prizoner_d,	 SCALE.SABOTENBOUL,	 SILHOUETTE_WIDTH.SABOTENBOUL);
	
	// ���Ŏ�`
	g_npc_jailer_a = ArrangePointNpc_(id_samayou, "npc_jailer_a000");
	SetScaleSilhouette(g_npc_jailer_a,		 SCALE.N,			 SILHOUETTE_WIDTH.N);
	
	// ���Ŏ�a
	g_npc_jailer_b = ArrangePointNpc_(id_sli_knight, "npc_jailer_b000");
	SetScaleSilhouette(g_npc_jailer_b,		 SCALE.N,			 SILHOUETTE_WIDTH.N);
	
	// ���Ŏ�b
	g_npc_jailer_c = ArrangePointNpc_(id_ookizuchi, "npc_jailer_c000");
	SetScaleSilhouette(g_npc_jailer_c,		 SCALE.N,			 SILHOUETTE_WIDTH.N);
	SetVisible(g_npc_jailer_c,			 false);							// ��\���ɂ���
	
	// ���Ŏ�c
	g_npc_jailer_d = ArrangePointNpc_(id_gaikotu, "npc_jailer_d000");
	SetScaleSilhouette(g_npc_jailer_d,		 SCALE.N,			 SILHOUETTE_WIDTH.N);
	
	// �C�b�^�u��
	npc_ittaburu = ArrangePointNpc_(id_ittaburu, "npc_ittaburu000");
	SetVisible(npc_ittaburu,			 false);							// ��\���ɂ���

	//---------------
	// ���M�~�b�N�z�u
	//---------------
	// ID������
	local
	g_gmk_elevator_door		,
	g_gmk_elevator_lift		,
	g_gmk_jail_door_est_1	,
	g_gmk_jail_door_est_2	,
	g_gmk_jail_door_est_3	,
	g_gmk_jail_door_est_4	,
	g_gmk_jail_door_est_5	,
	g_gmk_jail_door_est_6	,
	g_gmk_jail_door_west_1	,
	g_gmk_jail_door_west_2	,
	g_gmk_jail_door_west_3	,
	g_gmk_jail_door_west_4	,
	g_gmk_jail_door_west_5	,
	g_gmk_jail_door_west_6	,
	g_gmk_rukiya_doll			;
	
	// ���\�[�X�ǂݍ���
	local id_elevator_door	 = ReadGimmick_("o_S02_01");		// �G���x�[�^�[�̔�
	local id_elevator_lift	 = ReadGimmick_("o_S02_00");		// �G���x�[�^�[���t�g
	local id_jail_door		 = ReadGimmick_("o_S02_02");		// �S����
	local id_gmk_rukiya_doll = ReadGimmick_("o_dem_16");		// ���L���̔����k
	
	// �����L���̔����k
	g_gmk_rukiya_doll = ArrangePointGimmick_("o_dem_16", id_gmk_rukiya_doll, "gmk_rukiya_doll");
	
	// ���G���x�[�^�[�̔�
	g_gmk_elevator_door = ArrangePointGimmick_("o_S02_01", id_elevator_door, "gmk_elevator_door");

	// ���G���x�[�^�[���t�g
	g_gmk_elevator_lift = ArrangePointGimmick_("o_S02_00", id_elevator_lift, "gmk_elevator_lift");
	
	// ���S���� ���P
	g_gmk_jail_door_est_1 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_est_1");
	SetMotion_(g_gmk_jail_door_est_1, MOT_GIMMICK_0, BLEND_N);

	// ���S���� ���Q
	g_gmk_jail_door_est_2 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_est_2");
	SetMotion_(g_gmk_jail_door_est_2, MOT_GIMMICK_0, BLEND_N);

	// ���S���� ���R�i���l�`�j
	g_gmk_jail_door_est_3 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_est_3");
	SetMotion_(g_gmk_jail_door_est_3, MOT_GIMMICK_0, BLEND_N);

	// ���S���� ���S
	g_gmk_jail_door_est_4 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_est_4");
	SetMotion_(g_gmk_jail_door_est_4, MOT_GIMMICK_0, BLEND_N);

	// ���S���� ���T�i���l�b�j
	g_gmk_jail_door_est_5 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_est_5");
	SetMotion_(g_gmk_jail_door_est_5, MOT_GIMMICK_0, BLEND_N);

	// ���S���� ���U
	g_gmk_jail_door_est_6 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_est_6");
	SetMotion_(g_gmk_jail_door_est_6, MOT_GIMMICK_0, BLEND_N);

	// ���S���� ���P
	g_gmk_jail_door_west_1 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_west_1");
	SetMotion_(g_gmk_jail_door_west_1, MOT_GIMMICK_0, BLEND_N);

	// ���S���� ���Q�i���l�a�j
	g_gmk_jail_door_west_2 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_west_2");
	SetMotion_(g_gmk_jail_door_west_2, MOT_GIMMICK_0, BLEND_N);

	// ���S���� ���R
	g_gmk_jail_door_west_3 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_west_3");
	SetMotion_(g_gmk_jail_door_west_3, MOT_GIMMICK_0, BLEND_N);

	// ���S���� ���S�i���l�c�j
	g_gmk_jail_door_west_4 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_west_4");
	SetMotion_(g_gmk_jail_door_west_4, MOT_GIMMICK_0, BLEND_N);
	
	// ���S���� ���T
	g_gmk_jail_door_west_5 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_west_5");
	SetMotion_(g_gmk_jail_door_west_5, MOT_GIMMICK_0, BLEND_N);

	// ���S���� ���U
	g_gmk_jail_door_west_6 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_west_6");
	SetMotion_(g_gmk_jail_door_west_6, MOT_GIMMICK_0, BLEND_N);

	// ���G�t�F�N�g�ǂݍ���
	LoadEffect_("ef721_02_nat_smoke_n02");								// �y��

// ����풓���[�V�����Ǎ�
	local m_zusa	= ReadMotion_(player,				 "m127_01_break_machine");	// �Y�T�[L
	local m_wait	= ReadMotion_(player,				 "m127_01_hero_wait_L");	// �ҋ@L
	local m_down	= ReadMotion_(g_npc_prizoner_a,		 "m127_01_down_heavy_L");	// ��������L

	SetMotion_(g_npc_prizoner_a, m_down, 1);

// ���J�����ݒ�

	task_cam = Task_AnimeMoveCamera_("001_anmeye", "001_anmtgt");					//

//-------------------------------------------------------------------------
//		�͂��܂�͂��܂�
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);

	WaitTask(task_cam);
	Wait_(30);
	task_cam = Task_AnimeMoveCamera_("002_anmeye", "002_anmtgt");
	SetVisible(g_npc_jailer_c,			 true);							// �\������
	WaitTask(task_cam);

	SetFadePlane_(FADE_PLANE.PLANE_3D);									// 3D�ʂ����t�F�[�h�A�E�g
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 20);

	Wait_(20);
	SetMotion_(g_gmk_jail_door_est_3, MOT_GIMMICK_2, 1);
	Wait_(10);
	//===============================================
	// �C�b�^�u��
	// �u�����Ɂ@�����Ă���I
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ITABURU");
	ShowMsg_("DEMO_407_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	PlaySE_("SE_DEM_089");																	//�C�b�^�u���ɓ�������
	
	SetVisible(player,			 true);														// ��\���ɂ���

	local task_kaiwa = Task_RotateToPos_(player, GetPos_(g_npc_prizoner_b), 100.0);			// �J�����̕��������L�O���~

	SetFadePlane_(FADE_PLANE.PLANE_NORMAL);
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);
	task_cam = Task_AnimeMoveCamera_("003_anmeye", "003_anmtgt");							// �Y�T�[�J����
	
	task_player = Task_AnimeMoveNoDir_(player, "anm_player000");							// �Y�T�[
	SetMotion_(player,	 m_zusa, 1);														// �Y�T�[
	
	Wait_(20);
	
	StartEarthQuake_(15, 3, 0.5);
	local efc = SetPointWorldEffect_("ef721_02_nat_smoke_n02", "player000");

	Wait_(20);
	DeleteEffect_(efc);
	
	SetMotion_(g_gmk_jail_door_est_3, MOT_GIMMICK_3, BLEND_M);
	PlaySE_("SE_DEM_090");																	// �S��߂鉹
	WaitMotion(g_gmk_jail_door_est_3);
	StartEarthQuake_(15, 3, 0.5);
	SetMotion_(g_gmk_jail_door_est_3, MOT_GIMMICK_0, BLEND_M);
	WaitMotion(player);																		// �Y�T�[�҂�
	SetMotion_(player,	 MOT_WALK, BLEND_M);
	
	WaitTask(task_player);
	DeleteTask_(task_player);
	Wait_(10);
	SetMotion_(player,	 m_wait, 8);
	Wait_(10);
	SetPointCameraEye_("000_cameye");														// �J�����A�C���������W�ɐݒ�
	SetPointCameraTarget_("000_camtgt");													// �J�����^�[�Q�b�g���������W�ɐݒ�
	InitSilhouetteWidth_(player, 0.8);
	SetVisible(npc_ittaburu,			 true);												// �\������
	SetPos_(player, Vec3(163.97659, 0.0, 218.87369));
	SetDir_(player, 252);
	
	//===============================================
	// ���C�b�^�u��
	// �u���ӂӁc�c�Ȃ��Ȃ��@�C�L�̂����f�ނł��邪
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ITABURU");
	ShowMsg_("DEMO_407_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	task_cam = Task_AnimeMoveCamera_("004_anmeye", "004_anmtgt");
	InitSilhouetteWidth_(g_npc_prizoner_a, 1.3);

	//===============================================
	// ���C�b�^�u��
	// �u�����ŐQ�Ă���z�̂悤�Ɂ@���ׂĂ��������
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ITABURU");
	ShowMsg_("DEMO_407_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	WaitTask(task_cam);

	EndDemo(FADE_COLOR_BLACK);
}
