//=============================================
//
//		demo320[アーザムーク再戦]
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
	local model_azamuku;
	local player, azamuku;
	local efc_smoke0, efc_smoke1, efc_cam, efc_azamuku;
	local task_azamuku, task_cam;

// ▼リソース読込
	// キャラクター
	player = GetPlayerId_();					// 主人公
	model_azamuku = ReadNpc_("m204_00");		// アーザムーク

// ▼配置
	// 主人公
	SetPointPos_(player, "player000");
	// アーザムーク
	azamuku = ArrangePointNpc_(model_azamuku, "npc_azamuku000");
	SetScaleSilhouette(azamuku, SCALE.AZAMUKU, SILHOUETTE_WIDTH.S);
	
	// エフェクト
	LoadEffect_("ef733_01_sym_shuchusen01");				// 集中線
	LoadEffect_("ef721_04_nat_smoke_psps");								// 装置の煙エフェクトが用意されたらここに入れて下さい
	LoadEffect_("ef730_01_oth_dark_aura01");
	efc_azamuku = SetSelectBoneEffectSetOffset_("ef730_01_oth_dark_aura01", azamuku, ATTACH_EFFECT2, Vec3(0.0, -10.0, 0.0));
	
//	▼ギミック読み込み	
	local model_reactor = ReadGimmick_("o_dem_15");					// ルキヤのリアクター
	local model_daiza = ReadGimmick_("o_I02_19");					// リアクター台座
	local model_display = ReadGimmick_("o_I02_17");					// ディスプレイ
	
	//=====================================
	//ギミック設置
	//=====================================
	local reactor = ArrangePointGimmick_("o_dem_15", model_reactor, "obj_reactor000");
	local daiza = ArrangePointGimmick_("o_I02_19", model_daiza, "obj_daiza000");		// リアクター台座
	local display = ArrangePointGimmick_("o_I02_17", model_display, "display");		// ディスプレイ
	SetMotion_(daiza, MOT_GIMMICK_2, BLEND_N);
// ▼カメラ設定
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------
	
	efc_smoke0 = SetPointWorldEffect_("ef721_04_nat_smoke_psps", "efc_smoke000");	// 装置の煙エフェクトが用意されたらここに入れて下さい
	SetEffectScale_(efc_smoke0, 2.0);												// 装置の煙エフェクトが用意されたらここに入れて下さい
	efc_smoke1 = SetPointWorldEffect_("ef721_04_nat_smoke_psps", "efc_smoke001");	// 装置の煙エフェクトが用意されたらここに入れて下さい
	SetEffectScale_(efc_smoke1, 2.0);	
	
	StartDemo(FADE_COLOR_BLACK);
	
	Wait_(30);
	
	//===============================================
	//■アーザムーク
	//「わざわざ　やられに戻ってくるとは！
	//　あきれるほどの　愚か者デスね！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AZAMUKU");
	ShowMsg_("DEMO_320_MSG_010");
	KeyInputWait_();
	//===============================================
	
	task_azamuku = Task_RotateToPos_(azamuku, GetPos_(player), 4);
	
	WaitTask(task_azamuku);
	DeleteTask_(task_azamuku);
	
	//===============================================
	//■アーザムーク
	//「ルキヤへの　うらみつらみ！
	//　あなたで　晴らさせて　いただくデェェェス！！
	//-----------------------------------------------
	ShowMsg_("DEMO_320_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(azamuku, MOT_SPELL_ACTUATE, BLEND_M);							// 後ほどデモ用戦闘モーションに差し替えて下さい
		PlaySE_("SE_DEM_123");

	Wait_(23);
	
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");		// 15F
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", 100);			// 集中線
		EncountEndDemo(ENCOUNT_BOSS);
	Wait_(10);
	SetMotionSpeed_(azamuku, 0.1);
	//=====================================
	//◆戦闘ブラー
	//=====================================

	
}
