//=============================================
//
//		demo325[ルキヤのメッセージ]
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
	local task_cam, task_cam2;
	local efc_reactor0, efc_smoke0, efc_smoke1;
	local Player1, Player;
	local model_reactor, reactor;
	
// ▼リソース読込
	// キャラクター
	local player = GetPlayerId_();					// 主人公

// ▼配置
	// 主人公
	SetPointPos_(player, "player000");

// ▼非常駐モーション読込
	Player1 = ReadMotion_(player, "Player_touch_reactor_L");	// リアクターを触るモーション

// ▼カメラ設定
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	
//	▼ギミック読み込み
	model_reactor = ReadGimmick_("o_dem_15");					// ルキヤのリアクター
	reactor = ArrangePointGimmick_("o_dem_15", model_reactor, "obj_reactor000");

	local obj_PC = ReadGimmick_("o_I02_18");					// ノートPC
	local PC = ArrangePointGimmick_("o_I02_18", obj_PC, "obj_PC000");
	SetMotion_(PC, MOT_GIMMICK_1, BLEND_N);	

	local model_daiza = ReadGimmick_("o_I02_19");					// リアクター台座
	local daiza = ArrangePointGimmick_("o_I02_19", model_daiza, "obj_daiza000");		// リアクター台座

//	▼エフェクト
	LoadEffect_("ef732_09_light_reactor_c");					// リアクターの発光エフェクト
	LoadEffect_("ef721_04_nat_smoke_psps");						// 電流と煙

	SetMotion_(daiza, MOT_GIMMICK_0, BLEND_N);
//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	efc_smoke0 = SetPointWorldEffect_("ef721_04_nat_smoke_psps", "efc_smoke000");	// ぷすぷすエフェクト
	SetEffectScale_(efc_smoke0, 2.0);		
	efc_smoke1 = SetPointWorldEffect_("ef721_04_nat_smoke_psps", "efc_smoke001");	// ぷすぷすエフェクト
	SetEffectScale_(efc_smoke1, 2.0);
	
	
	StartDemo(FADE_COLOR_BLACK);
	
	PlaySE_("SE_FLD_135");																	// リアクター反応音
	efc_reactor0 = SetSelectBoneEffectSetOffset_("ef732_09_light_reactor_c", reactor, ATTACH_GLOBAL, Vec3(0.0, -1.0, 0.0));		// リアクターの発光エフェクト
	SetEffectScale_(efc_reactor0, 0.5);	
	
	Wait_(40);
	
	PlaySE_("SE_FLD_135");																	// リアクター反応音
	efc_reactor0 = SetPointWorldEffect_("ef732_09_light_reactor_c", "efc_reactor000");		// リアクターの発光エフェクト
	SetEffectScale_(efc_reactor0, 0.3);

	Wait_(30);
	SetMotion_(player, Player1, BLEND_XL);													// リアクターを触るモーション
	Wait_(50);

	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");	
	Wait_(5);
	//===============================================
	//*ルキヤのリアクター
	//「聞こえるかい　<name_player/>？
	//　このメッセージは　あんたのために　準備した。
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_325_MSG_010");
	KeyInputWait_();
	//===============================================

	//===============================================
	//*ルキヤのリアクター
	//「これを　聞いているってことは　部屋にある
	//　メインシステムが　故障しているはず。
	//-----------------------------------------------
	ShowMsg_("DEMO_325_MSG_020");
	KeyInputWait_();
	//===============================================

	//===============================================
	//*ルキヤのリアクター
	//「時間がないんで　手短に言う。
	//　部屋の　サブシステムを　立ち上げな。
	//-----------------------------------------------
	ShowMsg_("DEMO_325_MSG_030");
	KeyInputWait_();
	//===============================================

	//===============================================
	//*ルキヤのリアクター
	//「移動装置が　使えるようになるはず。
	//　そうしたら　黒鉄の監獄塔に　来るんだ。
	//-----------------------------------------------
	ShowMsg_("DEMO_325_MSG_040");
	KeyInputWait_();
	//===============================================

	//===============================================
	//*ルキヤのリアクター
	//「待っているよ　<name_player/>。
	//-----------------------------------------------
	ShowMsg_("DEMO_325_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	WaitTask(task_cam);

	// サブシステムを映す
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");	// 100F

	WaitTask(task_cam);
	Wait_(40);
	EndDemo(FADE_COLOR_BLACK);
}
