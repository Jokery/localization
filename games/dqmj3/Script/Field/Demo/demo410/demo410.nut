//=============================================
//
//		demo410[悪魔の改造装置]
//
//=============================================
function Task_Rot3(chr, rot, frm)
{

//半時計回り　加算
//時計回り　減算

	local dir = GetDir_(chr);
	
	local sita = dir+rot;
	
	local sita2 = sita-dir;

	if( sita2 <= 0 ){
		sita2 = sita2*-1;
	}
	
	local frm2 = sita2/frm;
	
	local task = Task_RotateToDir_(chr, sita, frm2);
	
	return task;
}
//-------------------------------------------------------------------------
//
//		読み込み・配置
//
//-------------------------------------------------------------------------
function Update()
{
	
// ▼変数定義
	local task_cam, task_player, task_break;
	local task_kansyu_step;
	local efc_player, efc_door, efc_syuzin;

// ▼リソース読込
	
	local k_player		 = ReadNpc_("n027");		// 主人公(キグルミ)

	local id_toge		 = ReadNpc_("m127_02");		// 囚人A：トゲじょぼー
	local id_togeB		 = ReadNpc_("m195_00");		// ブレイク化
	
	local id_samayou	 = ReadNpc_("m101_00");		// 看守A：がいこつ
	
	
	// ◆主人公(キグルミ)
	local player = ArrangePointNpc_(k_player, "player000");
	SetDir_(player, 0);
	SetStepSe_(player, "SE_FLD_031");
	SetScaleSilhouette(player, 0.6 ,0.6);
	SetStepSePan_(player, false);

	// ■囚人Ａ
	local npc_syuzin = ArrangePointNpc_(id_toge, "npc_syuzin");
	local npc_break = ArrangePointNpc_(id_togeB, "npc_syuzin");
	SetVisible(npc_break, false);					// 非表示にする
	SetVisible(npc_syuzin, false);					// 非表示にする
	SetStepSePan_(npc_syuzin, false);
	
	// ■看守Ａ
	local npc_jai = ArrangePointNpc_(id_samayou, "npc_kansyu");
	SetScaleSilhouette(npc_jai,		 SCALE.N,			 SILHOUETTE_WIDTH.N);
	SetVisible(npc_jai, false);					// 非表示にする
	SetStepSePan_(npc_jai, false);
	
	// ■看守Ｂ
	local kansyu = ArrangeNpc_(id_samayou, false);
	SetScaleSilhouette(kansyu,		 SCALE.N,		 SILHOUETTE_WIDTH.N);
	SetVisible(kansyu, false);				// 非表示にする
	SetStepSePan_(kansyu, false);
	
	
// ▼エフェクト読み込み
	LoadEffect_("ef721_02_nat_smoke_n02");		// 煙
	LoadEffect_("ef841_01_smoke_brkmcn01");		// 開く前　煙
	LoadEffect_("ef841_02_smoke_brkmcn02");		// 開いたとき　煙
	LoadEffect_("ef841_03_smoke_brkmcn03");		// 開いたあと　煙
	LoadEffect_("ef712_10_emo_surprise01");		// ！マーク
	LoadEffect_("ef741_02_div_nor_hit");		// ヒットエフェクト

	//---------------
	// ▼ギミック配置
	//---------------
	// ID初期化
	local 
	g_door1	,
	g_door2	,
	g_door3	,
	g_door4	,
	g_door5	,
	g_door6	,
	g_door7	;

	local id_door	 = ReadGimmick_("o_S02_03");		// 機械の扉

	//pot1
	g_door1 = ArrangePointGimmick_("o_S02_03", id_door, "gmk_pot01");
	SetMotion_(g_door1, MOT_GIMMICK_1, BLEND_N);

	//pot2
	g_door2 = ArrangePointGimmick_("o_S02_03", id_door, "gmk_pot02");
	SetMotion_(g_door2, MOT_GIMMICK_1, BLEND_N);

	//pot3
	g_door3 = ArrangePointGimmick_("o_S02_03", id_door, "gmk_pot03");
	SetMotion_(g_door3, MOT_GIMMICK_1, BLEND_N);

	//pot4
	g_door4 = ArrangePointGimmick_("o_S02_03", id_door, "gmk_pot07");
	SetMotion_(g_door4, MOT_GIMMICK_1, BLEND_N);

	//pot5
	g_door5 = ArrangePointGimmick_("o_S02_03", id_door, "gmk_pot05");
	SetMotion_(g_door5, MOT_GIMMICK_1, BLEND_N);

	//pot6
	g_door6 = ArrangePointGimmick_("o_S02_03", id_door, "gmk_pot06");
	SetMotion_(g_door6, MOT_GIMMICK_1, BLEND_N);

	//pot7
	g_door7 = ArrangePointGimmick_("o_S02_03", id_door, "gmk_pot04");
	SetMotion_(g_door7, MOT_GIMMICK_3, BLEND_N);

// ▼非常駐モーション読込
	local m_zusa	= ReadMotion_(npc_syuzin,			 "m127_01_break_machine");	// ズサーL
	local m_break = ReadMotion_(npc_break,				 "m195_00_after_break");	// 改造された直後
	SetMotion_(player, MOT_WAIT, 1);
	local s_wait = ReadMotion_(npc_syuzin,"m127_01_talk_L");

// ▼カメラ設定
	task_cam = Task_AnimeMoveCamera_("004_anmeye", "004_anmtgt");

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	SetMotion_(player, MOT_WALK, BLEND_N);
	task_player = Task_AnimeMove_(player, "anm_player000");

	StartDemo(FADE_COLOR_BLACK);
	
	WaitTask(task_player);
	Wait_(5);

	task_player = Task_RotateToDir_(player, -90, 4.0);
	WaitTask(task_player);
	SetMotion_(player, MOT_WAIT, BLEND_L);
	WaitTask(task_cam);
	Wait_(50);
	
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 15);
	WaitFade_();
	
	SetPointPos_(player, "player000");
	
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 15);
	
	task_cam = Task_AnimeMoveCamera_("001_anmeye", "001_anmtgt");
	Wait_(40);

	SetVisible(npc_jai, true);
	SetVisible(kansyu, true);
	SetVisible(npc_syuzin, true);
	local task_player	 = Task_AnimeMove_(npc_jai, "anm_kansyu");
	local tasksassa		 = Task_AnimeMove_(kansyu, "anm_kansyuB");
	local task_break	 = Task_AnimeMove_(npc_syuzin, "anm_syuzin2");
//	task_kansyu_step = Task_PlaySe_(se_id, frm);
	
	SetMotion_(npc_jai, MOT_WALK,4);
	SetMotion_(kansyu, MOT_WALK,4);
	SetMotion_(npc_syuzin, MOT_WALK,4);
	Wait_(20);

	SurpriseDispSetOffset(player, 5, 2);
	SetMotion_(player, MOT_WALK, 4);
	local task_kaiwa = Task_RotateToPos_(player, GetPos_(kansyu), ROTATE_DEMO_DEF/2);
	WaitTask(task_kaiwa);

	SetMotion_(player, MOT_WAIT, 4);
	DeleteTask_(task_kaiwa);
	WaitTask(task_cam);
	
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 20);
	Wait_(20);
	
	WaitTask(task_player);
	SetMotion_(npc_jai,MOT_WAIT,4)
	SetMotion_(kansyu,MOT_WAIT,4)
	SetMotion_(npc_syuzin,MOT_WAIT,4)
	
	SetPointCameraEye_("002_cameye");
	SetPointCameraTarget_("002_camtgt");
	
	local task_kaiwap = Task_RotateToPos_(player, GetPos_(npc_jai), 100);
	local task_kaiwap = Task_RotateToPos_(player, GetPos_(kansyu), 100);
	local task_kaiwab = Task_RotateToPos_(npc_break, GetPos_(g_door3), 100);
	local task = Task_Rot3(npc_jai, -90, 1);
	local task_kaiwas = Task_RotateToPos_(npc_syuzin, GetPos_(g_door3), 100);

	LoadEffect_("ef712_13_emo_sweat01");			// 汗
	local efc = SetSelectBoneEffect_("ef712_13_emo_sweat01", npc_syuzin, ATTACH_EFFECT1);		// 汗
	WaitTask(task_kaiwas);
	SetMotion_(npc_syuzin,s_wait,4);

	local task_kaiwap = Task_RotateToPos_(kansyu, GetPos_(npc_syuzin), 100);

	SetFade_(FADE_IN, FADE_COLOR_BLACK, 20);
	Wait_(30);
	//===============================================
	// *囚人Ａ
	// 「おい！　やめろ！　やめてくれー！
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_410_MSG_010");

	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	DeleteEffect_(efc);
	//===============================================
	// *看守
	//「うるさい！
	//　早く　この中に　入れ！
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_410_MSG_020");
	SetMotion_(npc_jai,MOT_SWORD_START,4);
	WaitMotion(npc_jai);
	SetMotion_(npc_jai,MOT_SWORD_CHARGE,4);
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	PlaySE_("SE_DEM_083");													//投げ込まれるとき
	
	SetMotion_(npc_jai,MOT_SWORD_ACTUATE,4);
	Wait_(30);
	
	local efc_cam2 = SetCameraEffect_("ef741_02_div_nor_hit", CAMERA_DEF);
	local task_kaiwa = Task_RotateToPos_(npc_syuzin, GetPos_(npc_jai), 180);
	Wait_(5);
	SetVisible(player, false);												// 非表示にする
	SetMotion_(npc_syuzin,	 m_zusa, 0);									// ズサー
	SetVisible(kansyu, false);												// 非表示にする
	task_cam = Task_AnimeMoveCamera_("003_anmeye", "003_anmtgt");
	task_player	 = Task_AnimeMoveNoDir_(npc_syuzin, "anm_syuzin");			// ズサー
	Wait_(20);
	StartEarthQuake_(15, 3, 0.5);
	local task_kaiwa = Task_RotateToPos_(player, GetPos_(npc_syuzin), 100);		
	
	efc_syuzin = SetSelectBoneEffectSetOffset_("ef721_02_nat_smoke_n02", npc_syuzin, ATTACH_EFFECT1, Vec3(0.0, -25.0, 0.0));
	WaitMotion(npc_syuzin);													// ズサー待ち
	SetMotion_(npc_syuzin,	 MOT_RUN, BLEND_M);
	SetMotion_(g_door7, MOT_GIMMICK_4, BLEND_N);
	SetMotionSpeed_(g_door7, 5);
	WaitMotion(g_door7);
	SetMotionSpeed_(g_door7, 1);
	SetMotion_(g_door7, MOT_GIMMICK_1, BLEND_N);
	
	PlaySE_("SE_DEM_084");													//製造器の扉が閉まる

	StartEarthQuake_(15, 3, 0.5);
	Wait_(20);
	
	StartEarthQuake_(10, 3, 0.7);
	PlaySE_("SE_DEM_085");
	Wait_(5);
	StartEarthQuake_(10, 3, 0.7);
	Wait_(20);
	
	StartEarthQuake_(10, 3, 0.7);
	PlaySE_("SE_DEM_085");
	Wait_(5);
	StartEarthQuake_(10, 3, 0.7);

	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 80);
	Wait_(20);
	SetStepSe_(npc_syuzin, SILENT_STEP_SE);

	StartEarthQuake_(10, 3, 0.7);
	PlaySE_("SE_DEM_085");
	Wait_(5);
	StartEarthQuake_(10, 3, 0.7);
	Wait_(20);

	StartEarthQuake_(10, 3, 0.7);
	PlaySE_("SE_DEM_085");
	Wait_(5);
	StartEarthQuake_(10, 3, 0.7);
	Wait_(20);

	StartEarthQuake_(10, 3, 0.7);
	PlaySE_("SE_DEM_085");
	Wait_(5);
	StartEarthQuake_(10, 3, 0.7);

	Wait_(120);
	
	PlaySE_("SE_DEM_086");													//製造器の扉が開く

	SetVisible(player, true);						// 非表示にする
	SetVisible(npc_jai, false);						// 非表示にする
	SetVisible(kansyu, false);						// 非表示にする
	SetVisible(npc_syuzin, false);					// 非表示にする
	SetVisible(npc_break, true);					// 非表示にする
	
	local task_kaiwa = Task_RotateToPos_(npc_break, GetPos_(npc_jai), 15);

	SetMotion_(npc_break, m_break, BLEND_N);
	local efc_door = SetPointWorldEffect_("ef841_01_smoke_brkmcn01", "kemurin");

	task_cam = Task_AnimeMoveCamera_("002_anmeye", "002_anmtgt");
	DeleteTask_(task_cam);
	task_player	 = Task_AnimeMoveNoDir_(npc_break, "anm_break");				// ズサー
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);

	DeleteEffectEmitter_(efc_door);
	SetMotion_(g_door7, MOT_GIMMICK_2, BLEND_N);
	local efc_door = SetPointWorldEffect_("ef841_02_smoke_brkmcn02", "kemurin");
	SetMotionSpeed_(g_door7, 0.5);

	task_cam = Task_AnimeMoveCamera_("002_anmeye", "002_anmtgt");
	
	WaitMotion(g_door7);
	DeleteEffectEmitter_(efc_door);

	SetMotion_(g_door7, MOT_GIMMICK_3, BLEND_N);
	local efc_door = SetPointWorldEffect_("ef841_03_smoke_brkmcn03", "kemurin");

	WaitTask(task_cam);

	//===============================================
	// *囚人Ａ
	// 「ギギ……ギギギ……
	// 　マザーさま　ばんざい……！
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_410_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	Wait_(30);
	SetPointCameraEye_("002_cameye");
	SetPointCameraTarget_("002_camtgt");
	SetVisible(npc_jai, true);					// 表示にする
	SetVisible(kansyu, true);					// 表示にする

	local task_kaiwa = Task_RotateToPos_(player, GetPos_(npc_jai), 100);
	local task_kaiwa = Task_WalkAroundToPos(npc_jai, GetPos_(player), 100);		// 主人公の方を向く
	local task_kaiwa = Task_RotateToPos_(kansyu, GetPos_(player), 100);
	SetMotion_(npc_jai, MOT_WAIT, BLEND_N);
	SetMotion_(kansyu, MOT_WAIT, BLEND_N);

	Wait_(20);

	//===============================================
	// *看守モンスターＣ
	// 「うむ！　いいデキの　ブレイクモンスターだ。
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_410_MSG_040");
	KeyInputWait_();
	//===============================================

	//-----------------------------------------------
	// 「む？　改造装置の確認に　来たのか？
	//-----------------------------------------------
	ShowMsg_("DEMO_410_MSG_050");
	KeyInputWait_();
	//===============================================

	//-----------------------------------------------
	// 「１階で　これから　集会があるんで
	//-----------------------------------------------
	ShowMsg_("DEMO_410_MSG_060");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	EndDemo(FADE_COLOR_BLACK);
}
