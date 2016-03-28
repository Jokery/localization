//=============================================
//
//		demo321[アーザムーク戦勝利]
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
	local player, azamuku, reactor;
	local efc_reactor, efc_azamuku, efc_smoke0, efc_smoke1, efc_cam, efc_dead ,efc_feather;
	local task_cam;

// ▼リソース読込
	// キャラクター
	player = GetPlayerId_();						// 主人公
	local model_azamuku = ReadNpc_("m204_00");		// アーザムーク
	
	// エフェクト
	LoadEffect_("ef741_01_div_nor_death");
	LoadEffect_("ef733_01_sym_shuchusen01");								// 集中線
	LoadEffect_("ef831_06_black_feather");							// 黒羽
	LoadEffect_("ef721_06_nat_smoke_s02");							// 装置の煙エフェクトが用意されたらここに入れて下さい
	LoadEffect_("ef721_03_nat_smoke_n03");							// アザームーク倒れた時の埃エフェクト
	LoadEffect_("ef732_09_light_reactor_c");						// リアクター発光

	// ギミック
	local model_reactor = ReadGimmick_("o_dem_15");					// ルキヤのリアクター
	local model_tenmetu = ReadGimmick_("o_I02_16");					// 制御装置の点滅
	local model_display = ReadGimmick_("o_I02_17");					// ディスプレイ画面
	local model_daiza = ReadGimmick_("o_I02_19");					// リアクター台座

	// レイアウト
	LoadLayout_("black");
	
// ▼配置
	// 主人公
	SetPointPos_(player, "player000");
	// アーザムーク
	azamuku = ArrangePointNpc_(model_azamuku, "npc_azamuku000");
	SetScaleSilhouette(azamuku, SCALE.AZAMUKU, SILHOUETTE_WIDTH.S);
	
	// エフェクト
	efc_smoke0 = SetPointWorldEffect_("ef721_06_nat_smoke_s02", "efc_smoke000");	// 装置の煙エフェクトが用意されたらここに入れて下さい
	SetEffectScale_(efc_smoke0, 2.0);					
	efc_smoke1 = SetPointWorldEffect_("ef721_06_nat_smoke_s02", "efc_smoke001");	// 装置の煙エフェクトが用意されたらここに入れて下さい
	SetEffectScale_(efc_smoke1, 2.0);	
	
	// ギミック設置
	reactor = ArrangePointGimmick_("o_dem_15", model_reactor, "obj_reactor000");		// リアクター
	local display = ArrangePointGimmick_("o_I02_17", model_display, "obj_display000");	// ディスプレイ画面
	local tenmetu = ArrangePointGimmick_("o_I02_16", model_tenmetu, "obj_tenmetu000");	//制御装置の点滅
	local daiza = ArrangePointGimmick_("o_I02_19", model_daiza, "obj_daiza000");		// リアクター台座
	SetMotion_(daiza, MOT_GIMMICK_2, BLEND_N);

// ▼非常駐モーション読込
	// 主人公
	local Player_battle_L = ReadMotion_(player, "Player_battle_L");				// 戦闘待機

	// アーザムーク
	local aza_g_wait = ReadMotion_(azamuku, "m204_00_g_wait_L");			// 地上待機L
	local aza_ret = ReadMotion_(azamuku, "m204_00_retreat");				// 後ずさる
	local aza_ret_L = ReadMotion_(azamuku, "m204_00_retreat_L");			// 後ずさるL
	local aza_ret_fly = ReadMotion_(azamuku, "m204_00_retreat_fly");		// 後ずさる→上空へ上がる
	local aza_damage_L = ReadMotion_(azamuku, "m204_00_damage_L");			// 負傷
	local aza_die = ReadMotion_(azamuku, "m204_00_die");					// 負傷→死亡
	local aza_die_L = ReadMotion_(azamuku, "m204_00_die_L");				// 死亡L
	local aza_hurry_L = ReadMotion_(azamuku, "m204_00_hurry_L");			// 焦るL
	local aza_spr_hand = ReadMotion_(azamuku, "m204_00_spread_hand");		// 待機→両手を広げる
	local aza_spr_hand_L = ReadMotion_(azamuku, "m204_00_spread_hand_L");	// 両手を広げるL

	// 初期のモーション
	SetMotion_(player, Player_battle_L, BLEND_N);
	SetMotion_(azamuku, aza_g_wait, BLEND_N);

	
// ▼カメラ設定
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット１
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetMotion_(azamuku, aza_ret, BLEND_L);
	StartDemo(FADE_COLOR_BLACK);
	WaitMotion(azamuku);
	SetMotion_(azamuku, aza_ret_L, BLEND_L);

	Wait_(30);

	//===============================================
	//■アーザムーク
	//「ぬ……ぬぐぐぐぐ……！
	//　敗北したというのですか！　このワタクシが！？
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AZAMUKU");
	ShowMsg_("DEMO_321_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	Wait_(20);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット2　アザアップ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetMotionSpeed_(azamuku, 4);											// モーションが早くなる
	SetMotion_(azamuku, aza_hurry_L, BLEND_N)									// アザ　焦る
	
	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");
	PlaySE_("SE_DEM_026");	// ■SE:集中線
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", 100);					// 集中線

	//===============================================
	//■アーザムーク
	//「これは……何かの　間違いデェェス！
	//　ワタクシが　こんなことで　終わるはずが……！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AZAMUKU");
	ShowMsg_("DEMO_321_MSG_020");
	KeyInputWait_();
	//===============================================

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット3　アザ死す
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	SetMotionSpeed_(azamuku, 2.5);											// モーション少しゆっくり

	//===============================================
	//■アーザムーク
	//「い……いやデェェス！　死にたくない！
	//　お助けください　ダークマスターさ……まぁ！
	//-----------------------------------------------
	ShowMsg_("DEMO_321_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	DeleteEffectEmitter_(efc_cam);
	SetMotionSpeed_(azamuku, 2.0);											// モーションだんだんゆっくり
	PlaySE_("SE_DEM_124");

	Wait_(20);
	SetMotionSpeed_(azamuku, 1.5);											// モーションゆっくり
	Wait_(20);
	
	SetMotionSpeed_(azamuku, 0.5);

	SetMotion_(azamuku, aza_die, BLEND_XL);

	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	Wait_(45);
	StartDecayEarthQuake_(20, 4, 3); 														// 振動

	efc_azamuku = SetSelectBoneEffectSetOffset_("ef721_03_nat_smoke_n03", azamuku, ATTACH_GLOBAL, Vec3(0.0, 0.0, 0.0));	// 埃
	SetEffectScale_(efc_azamuku, 1.2);
	efc_feather = SetSelectBoneEffectSetOffset_("ef831_06_black_feather", azamuku, ATTACH_GLOBAL, Vec3(0.0, 0.0, 0.0));	// 羽
	SetMotion_(azamuku, aza_die_L, BLEND_L);
	

	WaitTask(task_cam);
	Wait_(20);
	efc_dead = SetBoneEffect_("ef741_01_div_nor_death", azamuku);
	SetEffectScale_(efc_dead, 1.5);
	PlaySE_("SE_DEM_010");

	for (local i=1; i <= 10; i++) {
		SetAlpha_(azamuku, ALPHA_EXIST - (i * 0.1));
		Wait_(2);
	}

	Wait_(70)
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット4
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	
	WaitTask(task_cam);
	PlaySE_("SE_FLD_135");																	// 反応音
	efc_reactor = SetPointWorldEffect_("ef732_09_light_reactor_c", "obj_reactor000");		// リアクター起動エフェクト
	SetEffectScale_(efc_reactor, 0.5);
	Wait_(60);
	//===============================================
	//*ルキヤのリアクター
	//<name_player/>の
	//アクセスを　希望します。
	//-----------------------------------------------
	SetLayoutAnime_("fade_in", false);											// 黒半透明
	Wait_(30);
	SetLayoutAnime_("loop", false);
	ShowScreenMessage_("DEMO_321_MSG_040", false);
	SetLayoutAnime_("fade_out", false);
	//===============================================
	
	Wait_(30);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■デモ終了
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	
	EndDemo(FADE_COLOR_BLACK);
	
}
