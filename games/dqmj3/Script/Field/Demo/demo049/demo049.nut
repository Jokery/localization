//=============================================
//
//		demo049[レナーテ登場_2(残骸)]
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
	local efc_heavencrash, efc_santyo000, efc_santyo001;

// ▼リソース読込
	// ギミック
	local model_santyo = ReadGimmick_("o_dem_09");		// サンチョ
	local model_heavencrash = ReadGimmick_("o_dem_10");	// 楽園崩壊オブジェクト
	local model_pod = ReadGimmick_("o_dem_26");			// 楽園の残骸のリアクター
	// エフェクト
	LoadEffect_("ef721_04_nat_smoke_psps");				// 煙 プスプス
	LoadEffect_("ef804_01_paradise_lost01");			// 楽園崩壊演出
	// キャラクター
	local player = GetPlayerId_();						// 主人公
	local model_rena = ReadNpc_("n007");				// レナーテ

// ▼配置
	// サンチョ
	local santyo = ArrangePointGimmick_("o_dem_09", model_santyo, "obj_santyo000");
	SetScaleSilhouette(santyo, SCALE.SANCHO_CRASH, SILHOUETTE_WIDTH.SANCHO_CRASH);
	// 楽園崩壊オブジェクト
	local heavencrash = ArrangePointGimmick_("o_dem_10", model_heavencrash, "obj_heavencrash000");
	SetManualCalcAlpha_(heavencrash, true);									//α値を手動で設定
	// 楽園崩壊演出
	efc_heavencrash = SetPointWorldEffect_("ef804_01_paradise_lost01", "obj_heavencrash000");
	// 主人公
	SetPointPos_(player, "player000");
	// レナーテ
	local rena = ArrangePointNpc_(model_rena, "npc_rena000");
	SetStepSePan_(rena, false);
	// 楽園の残骸のリアクター
	local pod = ArrangePointGimmick_("o_dem_26", model_pod, "obj_pod000");	//(原点配置)
	SetManualCalcAlpha_(pod, true);									//α値を手動で設定
	SetAlpha_(pod, ALPHA_CLEAR);
// ▼非常駐モーション読込
	// 主人公
	local player_guard_L = ReadMotion_(player, "Player_guard_L");			// 身構えるL
	local player_caution = ReadMotion_(player, "Player_caution");			// 身構える→警戒
	local player_caution01_L = ReadMotion_(player, "Player_caution01_L");	// 警戒L
	// レナーテ
	local rena_attack_L = ReadMotion_(rena, "n007_attack_L");				// 攻撃L
	local rena_sit_L = ReadMotion_(rena, "n007_sit_L");						// しゃがみL
	local rena_stand01 = ReadMotion_(rena, "n007_stand01");					// しゃがみ→待機
	local rena_look_left_L = ReadMotion_(rena, "n007_look_left_L");			// 左を向くL
	
// ▼初期のモーション
	SetMotion_(player, player_guard_L, BLEND_N);
	
	SetActive_(santyo, false);
	
// ▼カメラ設定
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");		// 150F
	SetFace_(player, "Face_loop_close");	
	SetFace_(rena, "Face_eyes_close");
//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット１ 割れる空間
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	StartBlurEffect_();
//	StartDemo(FADE_COLOR_WHITE);	// SEの再生タイミングを調整したいのでStartDemoの関数を分解して記述しています

	local bgm = "";
	
	if(bgm != ""){
		PlayBgm_(bgm);
	}
	
	SetFade_(FADE_IN, FADE_COLOR_WHITE, FADE_DEF);
	PlaySE_("SE_DEM_067");	// ■SE：楽園の背景が割れるSE

	Wait_(160);	
	local efc_crash = Task_ObjectFadeOut_(heavencrash, 40);								//破片がどんどん消えていく
	
	Wait_(10);
	
	SetFade_(FADE_OUT, FADE_COLOR_WHITE, 60);
	WaitFade_();
	DeleteEffect_(efc_heavencrash);
	
	SetActive_(rena, false);
	SetActive_(heavencrash, false);

	SetPointPos_(player, "player002");
	SetPointPos_(rena, "npc_rena002");

	DeleteTask_(task_cam);
	EndBlurEffect_();
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット２ 主人公アップ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");		// 100F
	PlayBgm_("BG_AMBI_008");
	SetFade_(FADE_IN, FADE_COLOR_WHITE, FADE_DEF);
	WaitFade_();
	
	WaitTask(task_cam);
	SetAlpha_(pod, ALPHA_EXIST);
	SetMotion_(player, player_caution, BLEND_M);
	SetFace_(player, "Face_eyes_close");
	WaitMotion(player);
	SetMotion_(player, player_caution01_L, BLEND_M);
	
	Wait_(60);	
	DeleteTask_(task_cam);
	
	SetActive_(player, false);
	SetPointPos_(player, "player001");
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット３ 謎の少女アップ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");		// 170F
	SetActive_(rena, true);
	SetDirToObject_(rena, player);

	Wait_(80);
	SetMotion_(rena, MOT_WAIT, BLEND_XL);
	WaitTask(task_cam);	
	DeleteTask_(task_cam);
	
	Wait_(20);
	SetMotion_(player, MOT_WAIT, BLEND_N);
	SetMotion_(rena, rena_look_left_L, BLEND_M);

	SetDir_(player, -25);
	SetActive_(player, true);
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット４ 行きましょう
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetPointPos_(rena, "npc_rena001");
	SetDir_(rena, 80);
	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");		// 130F

	Wait_(130);

	//===============================================
	// ■なぞの少女
	// 「行きましょう……<name_player/>。
	//　こんな場所にいては　いけないわ……。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MYSTERYGIRL");
	ShowMsg_("DEMO_049_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	WaitTask(task_cam);
	
	DeleteTask_(task_cam);

	efc_santyo000 = SetPointWorldEffect_("ef721_04_nat_smoke_psps", "efc_santyocrash000");
	SetEffectScale_(efc_santyo000, 1.15);
	efc_santyo001 = SetPointWorldEffect_("ef721_04_nat_smoke_psps", "efc_santyocrash001");
	SetEffectScale_(efc_santyo001, 1.15);
	
	
	SetActive_(santyo, true);
	
	SetMotion_(rena, MOT_WALK, BLEND_L);
	task_rena = Task_RotateToDir_(rena, -10, ROTATE_DEMO_DEF);
	WaitTask(task_rena);
	DeleteTask_(task_rena);
	task_rena = Task_MoveForward_(rena, 0.78, false);
	Wait_(15);

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット５
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");		// 120F
	
	Wait_(70);

	EndDemo(FADE_COLOR_BLACK);

}
