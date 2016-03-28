//=============================================
//
//		demo204[地下１階への階段]
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
	local efc_player,efc_smoke,efc_stone1,efc_stone2;

// ▼エフェクト読込
	LoadEffect_("ef726_01_nat_parapara");		//天井などから落ちてくるパラパラ	
	LoadEffect_("ef721_03_nat_smoke_n03");		//煙1

//	▼ギミック読み込み
	local obj_tobira = ReadGimmick_("o_G02_01");
	local tobira = ArrangePointGimmick_("o_G02_01",obj_tobira, "obj_tobira000");
	
	local obj_statue0 = ReadGimmick_("o_G02_20");	//石像Ａ　北西
	local statue = ArrangePointGimmick_("o_G02_20",obj_statue0, "obj_hidariue000")
	
	local obj_statue1 = ReadGimmick_("o_G02_20");	//石像Ｂ　北東
	local statue = ArrangePointGimmick_("o_G02_21",obj_statue1, "obj_migiue000");	
	
	local obj_statue2 = ReadGimmick_("o_G02_21");	//石像Ｃ　南西
	local statue2 = ArrangePointGimmick_("o_G02_21",obj_statue2, "obj_hidarisita000");	
	
	local obj_statue3 = ReadGimmick_("o_G02_21");	//石像Ｄ　南東
	local statue3 = ArrangePointGimmick_("o_G02_21",obj_statue3, "obj_migisita000");	
	
// ▼時間設定
	SetTime_(START_TIME_ZONE_NIGHT);
	
// ▼カメラ設定
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■石像ズームイン
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	//石像A	
	WaitLod_();
	Wait_(5);
	WaitFade_();
	Wait_(60);

	//石像B
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");	

	WaitLod_();
	Wait_(5);
	WaitFade_();
	Wait_(90);
	DeleteTask_(task_cam);
	
	//石像C
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");	

	WaitLod_();
	Wait_(5);
	WaitFade_();
	Wait_(90);
	DeleteTask_(task_cam);
	
	//石像D
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");	

	WaitLod_();
	Wait_(5);
	WaitFade_();
	Wait_(90);
	DeleteTask_(task_cam);

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■扉が開くシーン
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	PlaySE_("SE_FLD_129");												// エレベーター起動時の振動音（J2）
	
	//地震
	StartEarthQuake_(3, 3, 3);
	Wait_(30);
	
	//扉が開くギミック
	SetMotion_(tobira, MOT_GIMMICK_1, BLEND_N);							// 扉が開く
	PlaySE_("SE_DEM_105");												//扉が開くSE
	Wait_(3);
	SetMotionSpeed_(tobira, 0.18);										// モーションがゆっくりになる
	
	efc_smoke = SetPointWorldEffect_("ef721_03_nat_smoke_n03", "efc_smoke000");//煙
	SetEffectScale_(efc_smoke, 2.0);
	Wait_(20);
	StartEarthQuake_(-1, 3, 0.5);

	
	//エフェクト
	//-----------------------------------------------
	efc_stone1 = SetPointWorldEffect_("ef726_01_nat_parapara", "efc_stone000");	//石の破片
	SetEffectScale_(efc_stone1, 1.2);
	
	efc_stone2 = SetPointWorldEffect_("ef726_01_nat_parapara", "efc_stone001");	//石の破片
	SetEffectScale_(efc_stone2, 1.2);
	//-----------------------------------------------
	
	Wait_(20);

	DeleteEffectEmitter_(efc_stone1);
	DeleteEffectEmitter_(efc_stone2);
	
	
	Wait_(10);
	efc_stone1 = SetPointWorldEffect_("ef726_01_nat_parapara", "efc_stone000");	//石の破片
	SetEffectScale_(efc_stone1, 1.2);
	
	efc_stone2 = SetPointWorldEffect_("ef726_01_nat_parapara", "efc_stone001");	//石の破片
	SetEffectScale_(efc_stone2, 1.2);
	Wait_(5);
	DeleteEffectEmitter_(efc_stone1);
	DeleteEffectEmitter_(efc_stone2);
	//-----------------------------------------------	

	Wait_(20);
	efc_stone1 = SetPointWorldEffect_("ef726_01_nat_parapara", "efc_stone000");	//石の破片
	SetEffectScale_(efc_stone1, 1.2);
	
	efc_stone2 = SetPointWorldEffect_("ef726_01_nat_parapara", "efc_stone001");	//石の破片
	SetEffectScale_(efc_stone2, 1.2);
	Wait_(35);
	DeleteEffectEmitter_(efc_stone1);
	DeleteEffectEmitter_(efc_stone2);
	Wait_(20);
	
	//-----------------------------------------------
	
	StopEarthQuake_();				//地震ストップ
	SetMotion_(tobira, MOT_GIMMICK_2, BLEND_N);									// 扉が開くL	
	DeleteTask_(task_cam);
	Wait_(30);

	//===============================================
	//*システムメッセージ
	// 階段が出現した。
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_204_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	//=====================================
	//フェードアウト
	//=====================================
	
	EndDemo(FADE_COLOR_BLACK);
}
