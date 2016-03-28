//=============================================
//
//		demo322[ダークマスターの挑戦_1]
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
	local task_cam, task_rena;
	local efc_holography, efc_smoke0, efc_smoke1;
	local rena_on1 = [0.3, 0.6, 0.4, 0.3, 0.5, 0.3, 0.6, 0.4, 0.3, 0.5, 0.4, 0.3, 0.7];
	local rena_on2 = [1, 1, 15, 1, 1, 1, 1, 5, 1, 1, 1, 1, 1];

// ▼リソース読込
	// キャラクター
	local player = GetPlayerId_();					// 主人公
	local model_rena = ReadNpc_("n034");			// レナーテ立体映像
	// ギミック
	local model_display = ReadGimmick_("o_I02_17");	// ディスプレイ
	local model_reactor = ReadGimmick_("o_dem_15");	// ルキヤのリアクター
	local model_daiza = ReadGimmick_("o_I02_19");	// リアクター台座
	// エフェクト
	LoadEffect_("ef732_14_holography01");			// ホログラム表現　常駐
	LoadEffect_("ef732_15_holography01");			// ホログラム表現　出現
	LoadEffect_("ef721_04_nat_smoke_psps");			// 装置の煙

// ▼配置
	// 主人公
	SetPointPos_(player, "player000");
	// レナーテ
	local rena = ArrangePointNpc_(model_rena, "npc_rena000");
	SetManualCalcAlpha_(rena, true);
	SetAlpha_(rena, ALPHA_CLEAR);
	// ギミック
	local display = ArrangePointGimmick_("o_I02_17", model_display, "display");			// ディスプレイ
	local reactor = ArrangePointGimmick_("o_dem_15", model_reactor, "obj_reactor000");	// リアクター
	local daiza = ArrangePointGimmick_("o_I02_19", model_daiza, "obj_daiza000");		// リアクター台座
	// エフェクト
	efc_smoke0 = SetPointWorldEffect_("ef721_04_nat_smoke_psps", "efc_smoke000");		// 装置の煙
	SetEffectScale_(efc_smoke0, 2.0);					
	efc_smoke1 = SetPointWorldEffect_("ef721_04_nat_smoke_psps", "efc_smoke001");		// 装置の煙
	SetEffectScale_(efc_smoke1, 2.0);	

// ▼非常駐モーション読込
	local rena_look_down_L = ReadMotion_(rena, "n007_look_down_L");	// うつむき待機L
	local rena_look_up_L = ReadMotion_(rena, "n007_look_up_L");		// 上を向くL

// ▼カメラ設定
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");		// 240F

// ▼ギミックの初期状態
	SetMotion_(daiza, MOT_GIMMICK_2, BLEND_N);

	task_rena = Task_AnimeMoveNoFitSetMotion_(rena, "anm_rena000", MOT_WALK, MOT_WAIT);	// 150F
	SetStepSe_(rena, SILENT_STEP_SE);								// レナーテ　足音を無音にする


//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);

	PlaySE_("SE_DEM_047");											// レナーテ現れる
	Wait_(5);
	efc_holography = SetBoneEffect_("ef732_15_holography01", rena);

	for (local i = 0; i< rena_on1.len(); i ++){		// レナーテ点滅
		SetAlpha_(rena, rena_on1[i]);
		Wait_(rena_on2[i]);
	}

	SetAlpha_(rena, 1);								// レナーテα値
	DeleteEffect_(efc_holography);
	efc_holography = SetBoneEffect_("ef732_14_holography01", rena);
	Wait_(40);

	//===============================================
	//■なぞの少女
	//「このメッセージが　再生されたということは
	//　あなたは　凍骨の氷原に　着いたのね。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MYSTERYGIRL");
	ShowMsg_("DEMO_322_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	WaitTask(task_cam);

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット2
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

	SetPointPos_(rena, "npc_rena001");

	Wait_(20);

	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");	// 210F

	SetMotion_(rena, rena_look_down_L, BLEND_XL);

	//===============================================
	//■なぞの少女
	//「あなたが　ルキヤのやっていた　研究を
	//　守ってくれたということね……。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MYSTERYGIRL");
	ShowMsg_("DEMO_322_MSG_020");
	KeyInputWait_();
	//===============================================
	//「ならば……氷原を　緑地にする研究も
	//　無事に　進んでいるはず……。
	//-----------------------------------------------
	ShowMsg_("DEMO_322_MSG_030");
	KeyInputWait_();
	//===============================================
	//「ルキヤは……ただ　敵と戦うだけではなく
	//　この世界を　豊かにすることを　考えていた。
	//----------------------------------------------- 
	ShowMsg_("DEMO_322_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	WaitTask(task_cam);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット3
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	DeleteEffect_(efc_smoke1);															//右端の煙消す
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");	// 150F

	SetPointPos_(rena, "npc_rena002");
	Wait_(20);
	SetMotion_(rena, rena_look_up_L, BLEND_XL);

	//===============================================
	//■なぞの少女
	//「私たちは　この苗のように　希望の種をまいた。
	//　それが　あなたよ……<name_player/>。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MYSTERYGIRL");
	ShowMsg_("DEMO_322_MSG_050");
	KeyInputWait_();
	//===============================================
	//「私は　待っている……あなたが
	//　世界を知り　希望として　大きく育つのを……。
	//-----------------------------------------------
	ShowMsg_("DEMO_322_MSG_060");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	WaitTask(task_cam);
	Wait_(30);
	SetActive_(player, false);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット4
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	efc_smoke1 = SetPointWorldEffect_("ef721_04_nat_smoke_psps", "efc_smoke002");		// 右端の煙　位置調整
	SetEffectScale_(efc_smoke1, 2.0);	

	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");	// 120F

	WaitTask(task_cam);
	PlaySE_("SE_DEM_050");															//モニターにノイズが走る
	SetMotion_(display, MOT_GIMMICK_1, BLEND_N);
	Wait_(30);

	EndDemo(FADE_COLOR_WHITE);
}
