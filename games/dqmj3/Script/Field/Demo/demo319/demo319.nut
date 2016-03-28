//=============================================
//
//		demo319[希望の正体_2(戦闘前)]
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
	local player, azamuku;
	local model_azamuku;
	local Player_battle_L;
	local efc_obj000, efc_cam, efc_smoke000, efc_smoke001, efc_azamuku;
	local task_player, task_azamuku, task_cam;

// ▼リソース読込
	// キャラクター
	player = GetPlayerId_();														// 主人公
	model_azamuku = ReadNpc_("m204_00");											// アーザムーク
	
	// ギミック
	local model_reactor = ReadGimmick_("o_dem_15");									// ルキヤのリアクター
	local model_daiza = ReadGimmick_("o_I02_19");									// リアクター台座
	local model_display = ReadGimmick_("o_I02_17");									// ディスプレイ
	
	// エフェクト
	LoadEffect_("ef733_01_sym_shuchusen01");										// 集中線
	LoadEffect_("ef721_04_nat_smoke_psps");											// 装置の煙エフェクトが用意されたらここに入れて下さい
	LoadEffect_("ef730_01_oth_dark_aura01");
	
// ▼配置
	SetPointPos_(player, "player000");													// 主人公
	azamuku = ArrangePointNpc_(model_azamuku, "npcazamuku000");							// アーザムーク

// ▼非常駐モーション読込
	Player_battle_L = ReadMotion_(player, "Player_battle01_L");							// 戦闘待機
	local azamuku_down_think = ReadMotion_(azamuku, "m204_00_spread_hand_L");			// アーザームーク 両手を広げる

// ▼ギミック設置
	local reactor = ArrangePointGimmick_("o_dem_15", model_reactor, "obj_reactor000");	// ルキヤのリアクター
	local daiza = ArrangePointGimmick_("o_I02_19", model_daiza, "obj_daiza000");		// リアクター台座
	SetMotion_(daiza, MOT_GIMMICK_2, BLEND_N);
	local display = ArrangePointGimmick_("o_I02_17", model_display, "display");			// ディスプレイ
	
// ▼ 初期のモーション
	SetMotion_(player, Player_battle_L, BLEND_M);
	efc_azamuku = SetSelectBoneEffectSetOffset_("ef730_01_oth_dark_aura01", azamuku, ATTACH_EFFECT2, Vec3(0.0, -10.0, 0.0));
	
// ▼カメラ設定
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------
	
	efc_smoke000 = SetPointWorldEffect_("ef721_04_nat_smoke_psps", "efc_smoke000");	// 装置の煙
	SetEffectScale_(efc_smoke000, 3.0);												
	efc_smoke001 = SetPointWorldEffect_("ef721_04_nat_smoke_psps", "efc_smoke001");	// 装置の煙
	SetEffectScale_(efc_smoke001, 2.0);												

	SetScaleSilhouette(azamuku, SCALE.AZAMUKU, SILHOUETTE_WIDTH.S);

	StartDemo(FADE_COLOR_BLACK);
	
	Wait_(35);
	
	//===============================================
	//■アーザムーク
	//「あなたもワタクシを　笑うというのデスか！？
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AZAMUKU");
	ShowMsg_("DEMO_319_MSG_010");
	KeyInputWait_();
	//===============================================
	
	task_azamuku = Task_RotateToPos_(azamuku, GetPos_(player), 3.4);
	
	WaitTask(task_azamuku);
	DeleteTask_(task_azamuku);
	
	//===============================================
	//■アーザムーク
	//「レジスタンスの希望が　隠されていると聞き
	//　ノコノコやってきて　この始末……！
	//-----------------------------------------------
	ShowMsg_("DEMO_319_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット２
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");		// 60F
	
	SetMotion_(azamuku, azamuku_down_think, BLEND_L);				// アーザームーク 両手を広げる
	
	Wait_(10);
	//===============================================
	//■アーザムーク
	//「これでは　狡猾王ではなく　滑稽王デスよ！
	//　おのれ　ルキヤ！　断じて許しません！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AZAMUKU");
	ShowMsg_("DEMO_319_MSG_030");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	//■アーザムーク
	//「レジスタンス……ルキヤの仲間だというなら
	//　あなたも　生かしては帰しません！
	//-----------------------------------------------
	ShowMsg_("DEMO_319_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	WaitTask(task_cam);	

	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");		// 15F
		
	SetMotion_(azamuku, MOT_SPELL_ACTUATE, BLEND_M);				// アーザームーク 戦闘
	PlaySE_("SE_DEM_123");
	Wait_(30);
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", 100);			// 集中線
	Wait_(5);
	
	SetMotionSpeed_(azamuku, 0.2);
	//=====================================
	//◆戦闘ブラー
	//=====================================
	EncountEndDemo(ENCOUNT_BOSS);
	
}
