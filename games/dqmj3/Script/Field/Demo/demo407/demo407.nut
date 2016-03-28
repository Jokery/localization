//=============================================
//
//		demo407[黒鉄の監獄塔へ_2(監獄塔)]
//
//=============================================

//-------------------------------------------------------------------------
//
//		読み込み・配置
//
//-------------------------------------------------------------------------
function Update()
{
	
// ▼変数定義
	local task_cam, task_player;
	
// ▼配置
	//----------
	// ▼NPC配置
	//----------
	// ID初期化
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

	// リソース読み込み
	local k_player		 = ReadNpc_("n027");		// 主人公(キグルミ)

	local id_toge		 = ReadNpc_("m127_02");		// 囚人A：トゲじょぼー
	local id_saboten	 = ReadNpc_("m064_00");		// 囚人B：サボテンボール
	local id_spike		 = ReadNpc_("m127_01");		// 囚人C：スパイクヘッド
	local id_dessert	 = ReadNpc_("m132_01");		// 囚人D：デザートタンク

	local id_samayou	 = ReadNpc_("m111_00");		// 看守A：さまようよろい
	local id_sli_knight	 = ReadNpc_("m008_00");		// 看守B：スライムナイト
	local id_ookizuchi	 = ReadNpc_("m035_00");		// 看守C：おおきづち
	local id_gaikotu	 = ReadNpc_("m101_00");		// 看守D：がいこつ
	
	local id_ittaburu	 = ReadNpc_("m205_00");		// イッタブル
	
	// ◆主人公(キグルミ)
	player = ArrangePointNpc_(k_player, "player000");
	SetScaleSilhouette(player, 0.6 ,0.6);
	SetVisible(player,			 false);							// 非表示にする	
	SetStepSe_(player, SILENT_STEP_SE);
	// ■囚人Ａ
	g_npc_prizoner_a = ArrangePointNpc_(id_toge, "npc_prisoner_a000");
	SetScaleSilhouette(g_npc_prizoner_a,	 1,			 1);
	
	// ■囚人Ｂ
	g_npc_prizoner_b = ArrangePointNpc_(id_saboten, "npc_prisoner_b000");
	SetScaleSilhouette(g_npc_prizoner_b,	 SCALE.SABOTENBOUL,	 SILHOUETTE_WIDTH.SABOTENBOUL);
	
	// ■囚人Ｃ
	g_npc_prizoner_c = ArrangePointNpc_(id_spike, "npc_prisoner_c000");
	SetScaleSilhouette(g_npc_prizoner_c,	 SCALE.N,			 SILHOUETTE_WIDTH.N);	// SCALE.N=0.6 SILHOUETTE_WIDTH.N=0.8
	
	// ■囚人Ｄ
	g_npc_prizoner_d = ArrangePointNpc_(id_dessert, "npc_prisoner_d000");
	SetScaleSilhouette(g_npc_prizoner_d,	 SCALE.SABOTENBOUL,	 SILHOUETTE_WIDTH.SABOTENBOUL);
	
	// ■看守Ａ
	g_npc_jailer_a = ArrangePointNpc_(id_samayou, "npc_jailer_a000");
	SetScaleSilhouette(g_npc_jailer_a,		 SCALE.N,			 SILHOUETTE_WIDTH.N);
	
	// ■看守Ｂ
	g_npc_jailer_b = ArrangePointNpc_(id_sli_knight, "npc_jailer_b000");
	SetScaleSilhouette(g_npc_jailer_b,		 SCALE.N,			 SILHOUETTE_WIDTH.N);
	
	// ■看守Ｃ
	g_npc_jailer_c = ArrangePointNpc_(id_ookizuchi, "npc_jailer_c000");
	SetScaleSilhouette(g_npc_jailer_c,		 SCALE.N,			 SILHOUETTE_WIDTH.N);
	SetVisible(g_npc_jailer_c,			 false);							// 非表示にする
	
	// ■看守Ｄ
	g_npc_jailer_d = ArrangePointNpc_(id_gaikotu, "npc_jailer_d000");
	SetScaleSilhouette(g_npc_jailer_d,		 SCALE.N,			 SILHOUETTE_WIDTH.N);
	
	// イッタブル
	npc_ittaburu = ArrangePointNpc_(id_ittaburu, "npc_ittaburu000");
	SetVisible(npc_ittaburu,			 false);							// 非表示にする

	//---------------
	// ▼ギミック配置
	//---------------
	// ID初期化
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
	
	// リソース読み込み
	local id_elevator_door	 = ReadGimmick_("o_S02_01");		// エレベーターの扉
	local id_elevator_lift	 = ReadGimmick_("o_S02_00");		// エレベーターリフト
	local id_jail_door		 = ReadGimmick_("o_S02_02");		// 牢屋扉
	local id_gmk_rukiya_doll = ReadGimmick_("o_dem_16");		// ルキヤの抜け殻
	
	// ■ルキヤの抜け殻
	g_gmk_rukiya_doll = ArrangePointGimmick_("o_dem_16", id_gmk_rukiya_doll, "gmk_rukiya_doll");
	
	// ■エレベーターの扉
	g_gmk_elevator_door = ArrangePointGimmick_("o_S02_01", id_elevator_door, "gmk_elevator_door");

	// ■エレベーターリフト
	g_gmk_elevator_lift = ArrangePointGimmick_("o_S02_00", id_elevator_lift, "gmk_elevator_lift");
	
	// ■牢屋扉 東１
	g_gmk_jail_door_est_1 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_est_1");
	SetMotion_(g_gmk_jail_door_est_1, MOT_GIMMICK_0, BLEND_N);

	// ■牢屋扉 東２
	g_gmk_jail_door_est_2 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_est_2");
	SetMotion_(g_gmk_jail_door_est_2, MOT_GIMMICK_0, BLEND_N);

	// ■牢屋扉 東３（囚人Ａ）
	g_gmk_jail_door_est_3 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_est_3");
	SetMotion_(g_gmk_jail_door_est_3, MOT_GIMMICK_0, BLEND_N);

	// ■牢屋扉 東４
	g_gmk_jail_door_est_4 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_est_4");
	SetMotion_(g_gmk_jail_door_est_4, MOT_GIMMICK_0, BLEND_N);

	// ■牢屋扉 東５（囚人Ｃ）
	g_gmk_jail_door_est_5 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_est_5");
	SetMotion_(g_gmk_jail_door_est_5, MOT_GIMMICK_0, BLEND_N);

	// ■牢屋扉 東６
	g_gmk_jail_door_est_6 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_est_6");
	SetMotion_(g_gmk_jail_door_est_6, MOT_GIMMICK_0, BLEND_N);

	// ■牢屋扉 西１
	g_gmk_jail_door_west_1 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_west_1");
	SetMotion_(g_gmk_jail_door_west_1, MOT_GIMMICK_0, BLEND_N);

	// ■牢屋扉 西２（囚人Ｂ）
	g_gmk_jail_door_west_2 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_west_2");
	SetMotion_(g_gmk_jail_door_west_2, MOT_GIMMICK_0, BLEND_N);

	// ■牢屋扉 西３
	g_gmk_jail_door_west_3 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_west_3");
	SetMotion_(g_gmk_jail_door_west_3, MOT_GIMMICK_0, BLEND_N);

	// ■牢屋扉 西４（囚人Ｄ）
	g_gmk_jail_door_west_4 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_west_4");
	SetMotion_(g_gmk_jail_door_west_4, MOT_GIMMICK_0, BLEND_N);
	
	// ■牢屋扉 西５
	g_gmk_jail_door_west_5 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_west_5");
	SetMotion_(g_gmk_jail_door_west_5, MOT_GIMMICK_0, BLEND_N);

	// ■牢屋扉 西６
	g_gmk_jail_door_west_6 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_west_6");
	SetMotion_(g_gmk_jail_door_west_6, MOT_GIMMICK_0, BLEND_N);

	// ▼エフェクト読み込み
	LoadEffect_("ef721_02_nat_smoke_n02");								// 土煙

// ▼非常駐モーション読込
	local m_zusa	= ReadMotion_(player,				 "m127_01_break_machine");	// ズサーL
	local m_wait	= ReadMotion_(player,				 "m127_01_hero_wait_L");	// 待機L
	local m_down	= ReadMotion_(g_npc_prizoner_a,		 "m127_01_down_heavy_L");	// ぐったりL

	SetMotion_(g_npc_prizoner_a, m_down, 1);

// ▼カメラ設定

	task_cam = Task_AnimeMoveCamera_("001_anmeye", "001_anmtgt");					//

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);

	WaitTask(task_cam);
	Wait_(30);
	task_cam = Task_AnimeMoveCamera_("002_anmeye", "002_anmtgt");
	SetVisible(g_npc_jailer_c,			 true);							// 表示する
	WaitTask(task_cam);

	SetFadePlane_(FADE_PLANE.PLANE_3D);									// 3D面だけフェードアウト
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 20);

	Wait_(20);
	SetMotion_(g_gmk_jail_door_est_3, MOT_GIMMICK_2, 1);
	Wait_(10);
	//===============================================
	// イッタブル
	// 「ここに　入っていろ！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ITABURU");
	ShowMsg_("DEMO_407_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	PlaySE_("SE_DEM_089");																	//イッタブルに投げられる
	
	SetVisible(player,			 true);														// 非表示にする

	local task_kaiwa = Task_RotateToPos_(player, GetPos_(g_npc_prizoner_b), 100.0);			// カメラの方を向くキグルミ

	SetFadePlane_(FADE_PLANE.PLANE_NORMAL);
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);
	task_cam = Task_AnimeMoveCamera_("003_anmeye", "003_anmtgt");							// ズサーカメラ
	
	task_player = Task_AnimeMoveNoDir_(player, "anm_player000");							// ズサー
	SetMotion_(player,	 m_zusa, 1);														// ズサー
	
	Wait_(20);
	
	StartEarthQuake_(15, 3, 0.5);
	local efc = SetPointWorldEffect_("ef721_02_nat_smoke_n02", "player000");

	Wait_(20);
	DeleteEffect_(efc);
	
	SetMotion_(g_gmk_jail_door_est_3, MOT_GIMMICK_3, BLEND_M);
	PlaySE_("SE_DEM_090");																	// 牢を閉める音
	WaitMotion(g_gmk_jail_door_est_3);
	StartEarthQuake_(15, 3, 0.5);
	SetMotion_(g_gmk_jail_door_est_3, MOT_GIMMICK_0, BLEND_M);
	WaitMotion(player);																		// ズサー待ち
	SetMotion_(player,	 MOT_WALK, BLEND_M);
	
	WaitTask(task_player);
	DeleteTask_(task_player);
	Wait_(10);
	SetMotion_(player,	 m_wait, 8);
	Wait_(10);
	SetPointCameraEye_("000_cameye");														// カメラアイを初期座標に設定
	SetPointCameraTarget_("000_camtgt");													// カメラターゲットを初期座標に設定
	InitSilhouetteWidth_(player, 0.8);
	SetVisible(npc_ittaburu,			 true);												// 表示する
	SetPos_(player, Vec3(163.97659, 0.0, 218.87369));
	SetDir_(player, 252);
	
	//===============================================
	// ■イッタブル
	// 「ぐふふ……なかなか　イキのいい素材であるが
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
	// ■イッタブル
	// 「そこで寝ている奴のように　すべてをあきらめ
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
