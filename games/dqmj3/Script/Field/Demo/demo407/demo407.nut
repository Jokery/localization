//=============================================
//
//		demo407[SÌÄÖ_2(Ä)]
//
//=============================================

//-------------------------------------------------------------------------
//
//		ÇÝÝEzu
//
//-------------------------------------------------------------------------
function Update()
{
	
// ¥Ïè`
	local task_cam, task_player;
	
// ¥zu
	//----------
	// ¥NPCzu
	//----------
	// IDú»
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

	// \[XÇÝÝ
	local k_player		 = ReadNpc_("n027");		// ålö(LO~)

	local id_toge		 = ReadNpc_("m127_02");		// úlAFgQ¶åÚ[
	local id_saboten	 = ReadNpc_("m064_00");		// úlBFT{e{[
	local id_spike		 = ReadNpc_("m127_01");		// úlCFXpCNwbh
	local id_dessert	 = ReadNpc_("m132_01");		// úlDFfU[g^N

	local id_samayou	 = ReadNpc_("m111_00");		// ÅçAF³Üæ¤æë¢
	local id_sli_knight	 = ReadNpc_("m008_00");		// ÅçBFXCiCg
	local id_ookizuchi	 = ReadNpc_("m035_00");		// ÅçCF¨¨«Ã¿
	local id_gaikotu	 = ReadNpc_("m101_00");		// ÅçDFª¢±Â
	
	local id_ittaburu	 = ReadNpc_("m205_00");		// Cb^u
	
	// ålö(LO~)
	player = ArrangePointNpc_(k_player, "player000");
	SetScaleSilhouette(player, 0.6 ,0.6);
	SetVisible(player,			 false);							// ñ\¦É·é	
	SetStepSe_(player, SILENT_STEP_SE);
	// ¡úl`
	g_npc_prizoner_a = ArrangePointNpc_(id_toge, "npc_prisoner_a000");
	SetScaleSilhouette(g_npc_prizoner_a,	 1,			 1);
	
	// ¡úla
	g_npc_prizoner_b = ArrangePointNpc_(id_saboten, "npc_prisoner_b000");
	SetScaleSilhouette(g_npc_prizoner_b,	 SCALE.SABOTENBOUL,	 SILHOUETTE_WIDTH.SABOTENBOUL);
	
	// ¡úlb
	g_npc_prizoner_c = ArrangePointNpc_(id_spike, "npc_prisoner_c000");
	SetScaleSilhouette(g_npc_prizoner_c,	 SCALE.N,			 SILHOUETTE_WIDTH.N);	// SCALE.N=0.6 SILHOUETTE_WIDTH.N=0.8
	
	// ¡úlc
	g_npc_prizoner_d = ArrangePointNpc_(id_dessert, "npc_prisoner_d000");
	SetScaleSilhouette(g_npc_prizoner_d,	 SCALE.SABOTENBOUL,	 SILHOUETTE_WIDTH.SABOTENBOUL);
	
	// ¡Åç`
	g_npc_jailer_a = ArrangePointNpc_(id_samayou, "npc_jailer_a000");
	SetScaleSilhouette(g_npc_jailer_a,		 SCALE.N,			 SILHOUETTE_WIDTH.N);
	
	// ¡Åça
	g_npc_jailer_b = ArrangePointNpc_(id_sli_knight, "npc_jailer_b000");
	SetScaleSilhouette(g_npc_jailer_b,		 SCALE.N,			 SILHOUETTE_WIDTH.N);
	
	// ¡Åçb
	g_npc_jailer_c = ArrangePointNpc_(id_ookizuchi, "npc_jailer_c000");
	SetScaleSilhouette(g_npc_jailer_c,		 SCALE.N,			 SILHOUETTE_WIDTH.N);
	SetVisible(g_npc_jailer_c,			 false);							// ñ\¦É·é
	
	// ¡Åçc
	g_npc_jailer_d = ArrangePointNpc_(id_gaikotu, "npc_jailer_d000");
	SetScaleSilhouette(g_npc_jailer_d,		 SCALE.N,			 SILHOUETTE_WIDTH.N);
	
	// Cb^u
	npc_ittaburu = ArrangePointNpc_(id_ittaburu, "npc_ittaburu000");
	SetVisible(npc_ittaburu,			 false);							// ñ\¦É·é

	//---------------
	// ¥M~bNzu
	//---------------
	// IDú»
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
	
	// \[XÇÝÝ
	local id_elevator_door	 = ReadGimmick_("o_S02_01");		// Gx[^[Ìà
	local id_elevator_lift	 = ReadGimmick_("o_S02_00");		// Gx[^[tg
	local id_jail_door		 = ReadGimmick_("o_S02_02");		// S®à
	local id_gmk_rukiya_doll = ReadGimmick_("o_dem_16");		// LÌ²¯k
	
	// ¡LÌ²¯k
	g_gmk_rukiya_doll = ArrangePointGimmick_("o_dem_16", id_gmk_rukiya_doll, "gmk_rukiya_doll");
	
	// ¡Gx[^[Ìà
	g_gmk_elevator_door = ArrangePointGimmick_("o_S02_01", id_elevator_door, "gmk_elevator_door");

	// ¡Gx[^[tg
	g_gmk_elevator_lift = ArrangePointGimmick_("o_S02_00", id_elevator_lift, "gmk_elevator_lift");
	
	// ¡S®à P
	g_gmk_jail_door_est_1 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_est_1");
	SetMotion_(g_gmk_jail_door_est_1, MOT_GIMMICK_0, BLEND_N);

	// ¡S®à Q
	g_gmk_jail_door_est_2 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_est_2");
	SetMotion_(g_gmk_jail_door_est_2, MOT_GIMMICK_0, BLEND_N);

	// ¡S®à Riúl`j
	g_gmk_jail_door_est_3 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_est_3");
	SetMotion_(g_gmk_jail_door_est_3, MOT_GIMMICK_0, BLEND_N);

	// ¡S®à S
	g_gmk_jail_door_est_4 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_est_4");
	SetMotion_(g_gmk_jail_door_est_4, MOT_GIMMICK_0, BLEND_N);

	// ¡S®à Tiúlbj
	g_gmk_jail_door_est_5 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_est_5");
	SetMotion_(g_gmk_jail_door_est_5, MOT_GIMMICK_0, BLEND_N);

	// ¡S®à U
	g_gmk_jail_door_est_6 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_est_6");
	SetMotion_(g_gmk_jail_door_est_6, MOT_GIMMICK_0, BLEND_N);

	// ¡S®à ¼P
	g_gmk_jail_door_west_1 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_west_1");
	SetMotion_(g_gmk_jail_door_west_1, MOT_GIMMICK_0, BLEND_N);

	// ¡S®à ¼Qiúlaj
	g_gmk_jail_door_west_2 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_west_2");
	SetMotion_(g_gmk_jail_door_west_2, MOT_GIMMICK_0, BLEND_N);

	// ¡S®à ¼R
	g_gmk_jail_door_west_3 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_west_3");
	SetMotion_(g_gmk_jail_door_west_3, MOT_GIMMICK_0, BLEND_N);

	// ¡S®à ¼Siúlcj
	g_gmk_jail_door_west_4 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_west_4");
	SetMotion_(g_gmk_jail_door_west_4, MOT_GIMMICK_0, BLEND_N);
	
	// ¡S®à ¼T
	g_gmk_jail_door_west_5 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_west_5");
	SetMotion_(g_gmk_jail_door_west_5, MOT_GIMMICK_0, BLEND_N);

	// ¡S®à ¼U
	g_gmk_jail_door_west_6 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_west_6");
	SetMotion_(g_gmk_jail_door_west_6, MOT_GIMMICK_0, BLEND_N);

	// ¥GtFNgÇÝÝ
	LoadEffect_("ef721_02_nat_smoke_n02");								// y

// ¥ñí[VÇ
	local m_zusa	= ReadMotion_(player,				 "m127_01_break_machine");	// YT[L
	local m_wait	= ReadMotion_(player,				 "m127_01_hero_wait_L");	// Ò@L
	local m_down	= ReadMotion_(g_npc_prizoner_a,		 "m127_01_down_heavy_L");	// ®Á½èL

	SetMotion_(g_npc_prizoner_a, m_down, 1);

// ¥JÝè

	task_cam = Task_AnimeMoveCamera_("001_anmeye", "001_anmtgt");					//

//-------------------------------------------------------------------------
//		Í¶ÜèÍ¶Üè
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);

	WaitTask(task_cam);
	Wait_(30);
	task_cam = Task_AnimeMoveCamera_("002_anmeye", "002_anmtgt");
	SetVisible(g_npc_jailer_c,			 true);							// \¦·é
	WaitTask(task_cam);

	SetFadePlane_(FADE_PLANE.PLANE_3D);									// 3DÊ¾¯tF[hAEg
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 20);

	Wait_(20);
	SetMotion_(g_gmk_jail_door_est_3, MOT_GIMMICK_2, 1);
	Wait_(10);
	//===============================================
	// Cb^u
	// u±±É@üÁÄ¢ëI
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ITABURU");
	ShowMsg_("DEMO_407_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	PlaySE_("SE_DEM_089");																	//Cb^uÉ°çêé
	
	SetVisible(player,			 true);														// ñ\¦É·é

	local task_kaiwa = Task_RotateToPos_(player, GetPos_(g_npc_prizoner_b), 100.0);			// JÌûðü­LO~

	SetFadePlane_(FADE_PLANE.PLANE_NORMAL);
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);
	task_cam = Task_AnimeMoveCamera_("003_anmeye", "003_anmtgt");							// YT[J
	
	task_player = Task_AnimeMoveNoDir_(player, "anm_player000");							// YT[
	SetMotion_(player,	 m_zusa, 1);														// YT[
	
	Wait_(20);
	
	StartEarthQuake_(15, 3, 0.5);
	local efc = SetPointWorldEffect_("ef721_02_nat_smoke_n02", "player000");

	Wait_(20);
	DeleteEffect_(efc);
	
	SetMotion_(g_gmk_jail_door_est_3, MOT_GIMMICK_3, BLEND_M);
	PlaySE_("SE_DEM_090");																	// SðÂßé¹
	WaitMotion(g_gmk_jail_door_est_3);
	StartEarthQuake_(15, 3, 0.5);
	SetMotion_(g_gmk_jail_door_est_3, MOT_GIMMICK_0, BLEND_M);
	WaitMotion(player);																		// YT[Ò¿
	SetMotion_(player,	 MOT_WALK, BLEND_M);
	
	WaitTask(task_player);
	DeleteTask_(task_player);
	Wait_(10);
	SetMotion_(player,	 m_wait, 8);
	Wait_(10);
	SetPointCameraEye_("000_cameye");														// JACðúÀWÉÝè
	SetPointCameraTarget_("000_camtgt");													// J^[QbgðúÀWÉÝè
	InitSilhouetteWidth_(player, 0.8);
	SetVisible(npc_ittaburu,			 true);												// \¦·é
	SetPos_(player, Vec3(163.97659, 0.0, 218.87369));
	SetDir_(player, 252);
	
	//===============================================
	// ¡Cb^u
	// u®ÓÓccÈ©È©@CLÌ¢¢fÞÅ éª
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
	// ¡Cb^u
	// u»±ÅQÄ¢ézÌæ¤É@·×Äð «çß
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
