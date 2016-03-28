//=============================================
//
//		demo209[ブンドルド戦勝利]
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
	local efc_bundorudo000, efc_bundorudo001, efc_player;
	local task_cam, task_player, task_bundorudo;

// ▼リソース読込
	// キャラクター
	local player = GetPlayerId_();						// 主人公
	local model_bundorudo = ReadNpc_("m203_00");		// ブンドルド
	// エフェクト
	LoadEffect_("ef721_03_nat_smoke_n03");
	LoadEffect_("ef741_01_div_nor_death");
	LoadEffect_("ef712_10_emo_surprise01");				// 「！」
	// ギミック
	local model_reactor = ReadGimmick_("o_dem_07");		// リアクター


// ▼配置
	// 主人公
	SetPointPos_(player, "player000");
	// ブンドルド
	local bundorudo = ArrangePointNpc_(model_bundorudo, "npc_bundorudo000");
	SetScaleSilhouette(bundorudo, SCALE.M, SILHOUETTE_WIDTH.M);
	SetManualCalcAlpha_(bundorudo, true);
	// リアクター
	local reactor = ArrangePointGimmick_("o_dem_07", model_reactor, "obj_reactor000");

// ▼非常駐モーション読込
	local player_battle_L = ReadMotion_(player, "Player_battle_L");				// 戦闘待機
	local player_look_around_L = ReadMotion_(player, "Player_look_around_L");	// 主人公キョロキョロ
	local player_look_left_L = ReadMotion_(player, "Player_look_left_L");		// 主人公顔を少し左向ける
	
	local bundorudo_down_L = ReadMotion_(bundorudo, "m203_00_down_L");			// 杖をつくL
	local bundorudo_death = ReadMotion_(bundorudo, "m203_00_death");			// 杖をつく→死亡

// ▼時間設定
	SetTime_(START_TIME_ZONE_NIGHT);
	
// ▼カメラ設定
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット1　ブンドルド死す
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	SetMotion_(player, player_battle_L, BLEND_N);
	SetMotion_(bundorudo, bundorudo_down_L, BLEND_N);
	
	StartDemo(FADE_COLOR_BLACK);
	
	Wait_(20);
	
	//===============================================
	//*ブンドルド
	//「ダ……ダメなのでス……。　お前を　この先に　行かせるわけには……。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BUNDORUDO");
	ShowMsg_("DEMO_209_MSG_010");
	KeyInputWait_();
	
	//===============================================
	//*ブンドルド
	// 「お前を　レジスタンスの　生き残りと　合流など……させまセン……。
	//-----------------------------------------------
	ShowMsg_("DEMO_209_MSG_020");
	KeyInputWait_();
	
	//===============================================
	//*ブンドルド
	// 「凍骨の氷原に　向かったルキヤと　会わせるわけには　いかないのでス……。
	//-----------------------------------------------
	ShowMsg_("DEMO_209_MSG_030");
	KeyInputWait_();

	//===============================================
	//*ブンドルド
	// 「お許しを……奴が　凍骨の氷原へと　向かうこと……止められませんでした……。
	//-----------------------------------------------
	ShowMsg_("DEMO_209_MSG_040");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	//*ブンドルド
	//「ぐ…ぐおおおぉぉぉぉぉ…………！
	//-----------------------------------------------
	ShowMsg_("DEMO_209_MSG_050");
	
	Wait_(5);
	
	SetMotion_(bundorudo, bundorudo_death, BLEND_L);
	PlaySE_("SE_DEM_107");
	SetMotionSpeed_(bundorudo, 0.9);
	Wait_(43);
	PlaySE_("SE_FLD_168");

	Wait_(8);
	
//	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	efc_bundorudo000 = SetPointWorldEffect_("ef721_03_nat_smoke_n03", "npc_bundorudo000");
	SetEffectScale_(efc_bundorudo000, 1.7);
	
	StartDecayEarthQuake_(20, 4, 2)
	
	Wait_(45);
	
	efc_bundorudo001 = SetPointWorldEffect_("ef741_01_div_nor_death", "npc_bundorudo000");
	SetEffectScale_(efc_bundorudo001, 2.0);

	PlaySE_("SE_DEM_010");
	
	task_bundorudo = Task_ObjectFadeOut_(bundorudo, 20);
	
	Wait_(50);

	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット2　主人公アップ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");
	
	SetPointPos_(player, "player001");
	
	SetMotion_(player, MOT_WAIT, BLEND_L);
	
	Wait_(30);
	
	SetMotionSpeed_(player, 1.5);	// モーションが早くなる
	SetMotion_(player, player_look_around_L, 19);
	Wait_(3);
	SetFace_(player, "Face_right");	
	Wait_(22);
	SetFace_(player, "Face_left");	
	Wait_(25);	

	efc_player = SetSelectBoneEffectSetOffset_("ef712_10_emo_surprise01", player, ATTACH_EFFECT1, Vec3(0.0, 3.0, 0.0));
	SetEffectScale_(efc_player, 0.415);
	PlaySE_("SE_DEM_053");
	SetMotionSpeed_(player, 1);	// モーション戻す
	SetFace_(player, "Face_default");	
	SetMotion_(player, player_look_left_L, BLEND_M);			//主人公左向き
	
	Wait_(80);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット3　モニタアップ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");	// 125F
	
	WaitTask(task_cam);
	
	Wait_(40);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット4　光るリアクター
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");	// 90F
	
	WaitTask(task_cam);
	
	Wait_(20);
	
	SetMotion_(reactor, MOT_GIMMICK_1, BLEND_M);
	PlaySE_("SE_DEM_055");
	Wait_(50);
	SetMotion_(reactor, MOT_GIMMICK_2, BLEND_M);
	
	Wait_(85);

	EndDemo(FADE_COLOR_BLACK);

}
