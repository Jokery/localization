//=============================================
//
//		demo001[オープニングデモ_1(研究所)]
//
//=============================================

//-------------------------------------------------------------------------
//
//		読み込み・配置
//
//-------------------------------------------------------------------------
function Update()
{
//	DummyMsg();
// ▼時間設定
	SetTime_(18400);											// 夜(朝焼け)
	
// ▼変数定義
	local task_cam, task_reactor;
	local task_killer00, task_killer01, task_killer02, task_step, task_step01;
	local efc_engineer, efc_ractor00, efc_ractor01, efc_ractor02, efc_window, efc_light;
	local efc_fall00, efc_fall01, efc_fall02, efc_fall03, efc_fall04;

// ▼リソース読込
	// ギミック
	local model_reactor = ReadGimmick_("o_dem_11");				// リアクターケース
	local model_reactor2 = ReadGimmick_("o_dem_07");			// リアクター
	local model_window = ReadGimmick_("o_E01_01");				// 窓
	// キャラクター
	local player = GetPlayerId_();								// 主人公
	local model_engineer = ReadNpc_("n037");					// 技術者（スクエニ要望で、キャラを変更）
	local model_killer = ReadNpc_("m120_01");					// キラーマシン
	// エフェクト
	LoadEffect_("ef800_04_flying_reactor01");					// リアクターの軌跡
	LoadEffect_("ef800_05_flying_reactor02");					// リアクター飛行開始
	LoadEffect_("ef800_06_flying_reactor03");					// リアクター加速
	LoadEffect_("ef723_01_nat_explosion_n01");					// 汎用爆発01
	LoadEffect_("ef726_01_nat_parapara");						// 落下物
	LoadEffect_("ef800_12_crash_window");						// 窓の破片
	LoadEffect_("ef800_08_flying_reactor05");					// キラーン	
	
	
	// レイアウト
	LoadLayout_("op_credit");

// ▼配置
	// 主人公
	SetPos_(player, Vec3(0, -100, 0));

	// 技術者
	local engineer = ArrangePointNpc_(model_engineer, "npc_engineer000");

	// リアクターケース
	local reactor = ArrangePointGimmick_("o_dem_11", model_reactor, "obj_reactor000");
	SetMotion_(reactor, MOT_GIMMICK_1, BLEND_N);											// 開いた状態
	
	//机の上のリアクター
	local reactor_desk = ArrangePointGimmick_("o_dem_07", model_reactor2, "npc_engineer000");
	SetMotion_(reactor_desk, MOT_GIMMICK_4, BLEND_N);
	
	// 窓
	local window = ArrangePointGimmick_("o_E01_01", model_window, "obj_window000");
	SetMotion_(window, MOT_GIMMICK_0, BLEND_N);												// 窓が割れる前の状態
	
	// キラーマシン
	local killer00 = ArrangePointNpc_(model_killer, "npc_killer000");
	local killer01 = ArrangePointNpc_(model_killer, "npc_killer100");
	local killer02 = ArrangePointNpc_(model_killer, "npc_killer200");
	SetScaleSilhouette(killer00, SCALE.N, SILHOUETTE_WIDTH.S);
	SetScaleSilhouette(killer01, SCALE.N, SILHOUETTE_WIDTH.S);
	SetScaleSilhouette(killer02, SCALE.N, SILHOUETTE_WIDTH.S);
	
// ▼非常駐モーション読込
	// 技術者
	local engineer_work_L = ReadMotion_(engineer, "n012_work_L");				// 作業するL
	local engineer_work_end_L = ReadMotion_(engineer, "n012_work_end_L");		// 作業完了L
	local engineer_turn = ReadMotion_(engineer, "n012_turn");					// 作業完了→振り返る→スイッチを押す
	local engineer_look_up_L = ReadMotion_(engineer, "n012_look_up_L");			// 上を向くL
	local engineer_hold = ReadMotion_(engineer, "n012_hold_reactor");			// リアクターを持つ
	local engineer_hold_L = ReadMotion_(engineer, "n012_hold_reactor_L");		// リアクターを持つL
	local engineer_lift_pod = ReadMotion_(engineer, "n012_lift_pod");			// リアクターケースを掲げる
	local engineer_lift_pod_L = ReadMotion_(engineer, "n012_lift_pod_L");		// リアクターケースを掲げるL

// ▼モーション設定
	SetMotion_(engineer, engineer_work_L, BLEND_N);								// 作業するL

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------
	SetFadePlane_(FADE_PLANE.PLANE_3D);									// 通常よりフェードスピードを長くする為、共通関数を使用しない
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 1);
	Wait_(100);
	SetLayoutAnime_("sq_presents", false);								// レイアウト「スクエニプレゼンツ
	WaitLayoutAnime();	
	
	PlaySE_("SE_SKL_040");		// 爆発音
	Wait_(60);
	
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 120);
	
	// ▼カット１＠技術者へズームイン～～～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");		// 240F
	Wait_(80);
	
	// １回目の爆発
	PlaySE_("SE_SKL_040");		// 爆発音
	Wait_(5);
	
	efc_fall00 = SetPointWorldEffect_("ef726_01_nat_parapara", "efc_fall000");
	Wait_(5);
	DeleteEffectEmitter_(efc_fall00);
	
	efc_fall01 = SetPointWorldEffect_("ef726_01_nat_parapara", "efc_fall001");
	Wait_(10);
	DeleteEffectEmitter_(efc_fall01);
	
	Wait_(60);
	
	// ２回目の爆発
	PlaySE_("SE_SKL_040");		// 爆発音
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
	
	// ▼カット２＠技術者とリアクター～～～～～～～～～～～～～
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	
	PlaySE_("SE_SKL_040");		// 爆発音
	StartEarthQuake_(12, 3, 0.5);
	Wait_(12);
	StartDecayEarthQuake_(12, 3, 0.5);
	Wait_(12);
	
	PlaySE_("SE_FLD_054");		// 作業
	
	//===============================================
	// *レジスタンス技術者
	// 「……もう少し　もう少しなんだ！
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_001_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	Wait_(30);
	SetMotion_(engineer, engineer_work_end_L, BLEND_L);					// 作業完了L
	Wait_(20);
	
	// ▼カット３＠リアクターＵＰ～～～～～～～～～～～～～～～
	SetMotion_(engineer, engineer_hold, BLEND_XL);						// モーション　リアクターを持つ
	Wait_(2);
	SetMotion_(reactor_desk, MOT_GIMMICK_5, BLEND_XL);					// ギミック　リアクター持つ開始
	WaitMotion(reactor_desk);
	SetMotion_(engineer, engineer_hold_L, BLEND_M);						// モーション　リアクターを持つL	
	SetMotion_(reactor_desk, MOT_GIMMICK_3, BLEND_M);					// ギミック　リアクター持つL
	
	//===============================================
	// *レジスタンス技術者
	// 「できたぞっ！　あとはこれを……。
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_001_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================	

	task_cam = Task_AnimeMoveCamera_("anmeye005", "anmtgt005");			// 40F
	WaitTask(task_cam);
	efc_light = SetSelectBoneEffectSetOffset_("ef800_08_flying_reactor05", reactor_desk, ATTACH_GLOBAL, Vec3(0.0, 0.0, 0.0));		
	
	//※リアクターの動きと合わせるために一瞬待機モーションに切り替えております
//	SetMotion_(engineer, MOT_WAIT, BLEND_N);							// モーションリセットのため待機モーション
//	SetMotion_(engineer, engineer_hold_L, BLEND_N);						// モーション　リアクターを持つL
	Wait_(2);
	PlaySE_("SE_DEM_128");												// リアクター起動SE
//	SetMotion_(reactor_desk, MOT_GIMMICK_6, BLEND_M);					// ギミック　リアクターひかる
	
	Wait_(65);
	
	// ▼カット４＠キラーマシン移動～～～～～～～～～～～～～～
	SetStepSe_(killer00, SILENT_STEP_SE);											// 足音を 無音にする
	SetStepSe_(killer01, SILENT_STEP_SE);											// 足音を 無音にする
	SetStepSe_(killer02, SILENT_STEP_SE);											// 足音を 無音にする
	task_step = Task_ChangeStepSe(killer00, "SE_FLD_034", 8.5);
	Wait_(5);
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");			// 180F
	SetVisible(reactor_desk, false);									//机の上のリアクター非表示
	
	// モーション再生タイミングをバラバラにする
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
	
	// １回目の爆発
	PlaySE_("SE_SKL_040");		// 爆発音
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
	
	// ２回目の爆発
	PlaySE_("SE_SKL_040");		// 爆発音
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

	//キラーマシン位置調整
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
	SetStepSe_(killer00, SILENT_STEP_SE);											// 足音を 無音にする
	SetStepSe_(killer01, SILENT_STEP_SE);											// 足音を 無音にする
	SetStepSe_(killer02, SILENT_STEP_SE);											// 足音を 無音にする
	task_step01 = Task_ChangeStepSe(killer00, "SE_FLD_034", 10.5);

	Wait_(10);
	task_killer02 = Task_AnimeMove_(killer02, "anm_killer201");
	task_step = Task_ChangeStepSe(killer02, "SE_FLD_034", 10.5);
	// ▼カット５＠キラーマシン、ズームアウト～～～～～～～～～
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
	
	SetMotion_(engineer, engineer_turn, BLEND_N);						// 作業完了→振り返る→スイッチを押す
	SetMotion_(killer00, MOT_WAIT, BLEND_N);
	SetMotion_(killer01, MOT_WAIT, BLEND_N);
	SetMotion_(killer02, MOT_WAIT, BLEND_N);

	SetMotionSpeed_(killer00, 1.0);
	SetMotionSpeed_(killer01, 1.0);
	SetMotionSpeed_(killer02, 1.0);	
	
	// ▼カット5.5＠技術者スイッチを押す～～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye006", "anmtgt006");			// 100F
	
	Wait_(85);
	PlaySE_("SE_DEM_056");												// ■SE・ポッド閉まる
	
	SetMotion_(reactor, MOT_GIMMICK_3, BLEND_N);						// リアクターケース閉じる状態
	WaitMotion(reactor);
	
	WaitMotion(engineer);
	
	Wait_(30);
	
	WaitTask(task_cam);
	
	SetPointPos_(reactor, "npc_engineer000");
	DeleteTask_(task_cam);

	// ▼カット６＠リアクター、上昇する～～～～～～～～～～～～
	
	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");
	
	SetMotion_(engineer, engineer_lift_pod, BLEND_N);					// モーション　リアクターケースを持つ
	SetMotion_(reactor, MOT_GIMMICK_5, BLEND_N);						// ギミック　リアクターケース持ちあげる開始
	WaitMotion(engineer);
	SetMotion_(engineer, engineer_lift_pod_L, BLEND_M);					// モーション　リアクターを持つL
	WaitMotion(reactor);
	
	//===============================================
	// *レジスタンス技術者
	// 「とどけ！　希望のところまで！
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_001_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	// ▼カット７＠キラーマシン、カメライン～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");			// 80F
	SetMotion_(reactor, MOT_GIMMICK_6, BLEND_N);						// ギミック　リアクター持つL
	PlaySE_("SE_DEM_057");												// ■SE・ポッド浮く

	efc_ractor02 = SetSelectBoneEffect_("ef800_05_flying_reactor02", reactor, ATTACH_GLOBAL);		//リアクター飛行開始
	Wait_(10);
	task_reactor = Task_AnimeMoveNoFit_(reactor, "anm_reactor000");		// 60F
	
	efc_ractor00 = SetSelectBoneEffect_("ef800_04_flying_reactor01", reactor, ATTACH_GLOBAL);
	Wait_(60);
	DeleteEffectEmitter_(efc_ractor02);
	Wait_(10);
	
	SetMotion_(engineer, engineer_look_up_L, BLEND_L);					// 上を向くL
	
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
	
	
	//リアクター切り替え（※向きが反対になる不具合のため新たなリアクターケースに切り替え）
	DeleteTask_(task_reactor);
	local reactor01 = ArrangePointGimmick_("o_dem_11", model_reactor, "obj_reactor000");
	SetMotion_(reactor01, MOT_GIMMICK_0, BLEND_N);
	efc_ractor01 = SetSelectBoneEffect_("ef800_04_flying_reactor01", reactor01, ATTACH_GLOBAL);

	SetVisible(reactor, false);											//持ち上げたリアクター非表示
	DeleteEffectEmitter_(efc_ractor00);
	
	DeleteTask_(task_cam);
	
	
	// ▼カット８＠リアクター、発進～～～～～～～～～～～～～～
	SetPointCameraEye_("cameye004");
	SetPointCameraTarget_("camtgt004");

	Wait_(35);
	PlaySE_("SE_DEM_058");												// ■SE・ポッドがガラスを割る
	Wait_(5);
	efc_window = SetPointWorldEffect_("ef800_12_crash_window", "efc_window000");
	SetMotion_(window, MOT_GIMMICK_1, BLEND_M);							// 窓が割れる
	SetEffectScale_(efc_window, 1.0);

	task_reactor = Task_AnimeMoveNoFit_(reactor01, "anm_reactor001");	// 35F
	Wait_(16);
	
	// 16F経過後、アニメカメラを設定する
	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");			// 20F
	Wait_(55);
	
	EndDemo(FADE_COLOR_BLACK);
}
