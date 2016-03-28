//=============================================
//
//		demo826[最後の試練]
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
	local task_cam, task_aroma, task_star_seed, task_darsgalma00, task_darsgalma01, task_darsgalma02;
	local task_aroma_step;
	local efc_cam, efc_aroma00, efc_aroma01, efc_star_seed;
	local efc_darkmaster00, efc_darkmaster01, efc_darkmaster02, efc_darsgalma00, efc_darsgalma01;

// ▼リソース読込
	// キャラクター
	local player = GetPlayerId_();
	local model_rena = ReadNpc_("n007");										// レナーテ
	local model_aroma = ReadNpc_("n018");										// アロマ
	local model_darkmaster = ReadNpc_("n008");									// ダークマスター
	local model_darsgalma = ReadNpc_("m180_00");								// ダースガルマ
	// ギミック
	local model_mother = ReadGimmick_("o_C03_02");								// マザー
	local model_decoration = ReadGimmick_("o_C03_03");							// マザー飾り
	local model_reactor = ReadGimmick_("o_dem_07");								// リアクター(アタッチ用)
	//エフェクト
	LoadEffect_("ef712_10_emo_surprise01");										// 「！」
	LoadEffect_("ef733_01_sym_shuchusen01");									// 集中線
	LoadEffect_("ef732_13_light_reactor01");									// リアクターの光(まぶしい)
	LoadEffect_("ef732_26_star_seed_base02");									// スターシード ベース02
	LoadEffect_("ef882_04_smoke_dark");											// スターシードから出る暗黒
	LoadEffect_("ef861_01_dm_die01");											// ダークマスター消滅１
	LoadEffect_("ef861_02_dm_die02");											// ダークマスター消滅２
	LoadEffect_("ef730_01_oth_dark_aura01");									// 禍々しいオーラ
	LoadEffect_("ef861_03_m_draw");												// M抗体吸収
	//レイアウト
	LoadLayout_("black");														// ブラック

// ▼配置
	// 主人公
	SetPointPos_(player, "player000");
	// アロマ
	local aroma = ArrangePointNpc_(model_aroma, "npc_aroma000");
	SetStepSe_(aroma, SILENT_STEP_SE);
	// レナーテ
	local rena = ArrangePointNpc_(model_rena, "obj_mother000");
	SetPointPosNoFit_(rena, "obj_mother000");
	SetFace_(rena, "Face_loop_close");
	// ダークマスター
	local darkmaster = ArrangePointNpc_(model_darkmaster, "npc_darkmaster000");
	SetPointPosNoFit_(darkmaster, "npc_darkmaster000");
	SetVisible(darkmaster, false);
	// ダースガルマ
	local darsgalma = ArrangePointNpc_(model_darsgalma, "npc_darsgalma000");
	SetPointPosNoFit_(darsgalma, "npc_darsgalma000");
	SetScaleSilhouette(darsgalma, SCALE.G, SILHOUETTE_WIDTH.G);
	SetVisible(darsgalma, false);
	// マザー
	local mother = ArrangePointGimmick_("o_C03_02", model_mother, "obj_mother000");
	// マザー飾り
	local decoration = ArrangePointGimmick_("o_C03_03", model_decoration, "obj_mother000");
	// リアクター(アタッチ用)
	local reactor = ArrangePointGimmick_("o_com_02", model_reactor, "efc_star_seed000");
	SetAlpha_(reactor, ALPHA_CLEAR);

// ▼非常駐モーション読込
	// 主人公
	local player_look_up_L = ReadMotion_(player, "Player_look_up_L");			// 上向き待機L
	local player_caution01_L = ReadMotion_(player, "Player_caution01_L");		// 警戒L
	local player_battle_L = ReadMotion_(player, "Player_battle_L");				// 戦闘待機
	// アロマ
	local aroma_look_up_L = ReadMotion_(aroma, "n018_look_up_L");				// 上向き待機L
	local aroma_send_up_L = ReadMotion_(aroma, "n018_star_seed_send_up_L");		// スターシードを迎える
	local star_seed_look_L = ReadMotion_(aroma, "n018_star_seed_look_L");		// スターシードを見る
	local aroma_guard_L = ReadMotion_(aroma, "n018_guard_L");					// 構えるL
	// ダークマスター
	local darkmaster_fly_L = ReadMotion_(darkmaster, "n008_fly_L");				// 浮くL
	local darkmaster_fly_summon = ReadMotion_(darkmaster, "n008_fly_summon");	// 召喚（浮いた状態）
	local darkmaster_fly_summon_L = ReadMotion_(darkmaster, "n008_fly_summon_L");// 召喚L（浮いた状態）
	local darkmaster_fly_laugh_L = ReadMotion_(darkmaster, "n008_fly_laugh_L");	// 笑うL（浮いた状態）
	// レナーテ
	local rena_mother_L = ReadMotion_(rena, "n007_mother_L");					// マザーの中のレナーテ

// ▼初期モーション設定
	SetMotion_(mother, MOT_GIMMICK_1 ,BLEND_N);									// マザー　肉なし
	SetMotion_(player, player_look_up_L, BLEND_N);								// 主人公　上向き待機L
	SetMotion_(aroma, MOT_WALK, BLEND_N);										// アロマ　歩き
	SetMotion_(rena, rena_mother_L, BLEND_N);									// レナーテinマザー
	SetMotion_(darkmaster, darkmaster_fly_L ,BLEND_N);							// ダークマスター　浮くL
	SetMotionSpeed_(darkmaster, 0);
	task_aroma = Task_AnimeMove_(aroma, "anm_aroma000");
	task_aroma_step = Task_PlaySe_("SE_FLD_016", 15);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット１　主人公とアロマとマザー　アロマ歩行→停止　主人公とアロマ斜め後方→マザーへＰＡＮアップ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

// ▼カメラ設定
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------
	StartDemo(FADE_COLOR_BLACK);

	Wait_(23);
	SetMotion_(aroma, MOT_WAIT, 14);											// アロマ　スターシードを持つ
	Wait_(15);
	DeleteTask_(task_aroma_step);
	Wait_(15);
	DeleteTask_(task_aroma);

	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	Wait_(180);
	DeleteTask_(task_cam);
	ChangeColorTone_(1.0, 0.0, 1.0, 1);											//色調補正「紫」


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット２　追加カット　レナーテを注視
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	task_cam = Task_AnimeMoveCamera_("anmeye012", "anmtgt012");

	WaitTask(task_cam);
	Wait_(60);
	ChangeColorTone_(0.0, 0.0, 0.0, 1);											//色調補正もどす
	SetVisible(player, false);
	SetMotion_(aroma, aroma_look_up_L, BLEND_N);								// アロマ　上向き待機


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット３　アロマ　上向き待機→光持ち上向き待機　アロマ斜め前方
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");

	//===============================================
	//■アロマ
	//「おまたせ　レナーテ。
	//　今すぐ　自由にしてあげるわ……。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_826_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(aroma, star_seed_look_L, 20);									// アロマ　スターシードを持つ
	Wait_(35);
	PlaySE_("SE_DEM_204");
	efc_aroma00 = SetSelectBoneEffect_("ef732_13_light_reactor01", reactor, ATTACH_GLOBAL);
	SetEffectScale_(efc_aroma00, 0.12);
	Wait_(45);

	local size = 0.015;
	local count = 0;
	while(1){//毎フレーム光エフェクトを大きくする
		SetEffectScale_(efc_aroma00, 0.12+(count * size));
		count = count + 1;
		Wait_(1);
		if(50 == count){//50フレームで終了
			break;
		}
	}

	SetFade_(FADE_OUT, FADE_COLOR_WHITE, 1);
	DeleteEffectEmitter_(efc_aroma00);
	SetPointPosNoFit_(reactor, "efc_star_seed001");
	efc_aroma01 = SetSelectBoneEffect_("ef732_26_star_seed_base02", reactor, ATTACH_GLOBAL);
	SetEffectScale_(efc_aroma01, 0.3);
	Wait_(5);
	SetFade_(FADE_IN, FADE_COLOR_WHITE, 25);
	Wait_(45);
	PlaySE_("SE_DEM_205");
	Task_AnimeMoveNoFit_(reactor, "anm_star_seed000");
	Wait_(7);
	SetMotion_(aroma, aroma_send_up_L, 43);										// アロマ　スターシードを迎える
	Wait_(92);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット４　マザー　光接近→レナーテアップ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	task_cam = Task_AnimeMoveCamera_("anmeye013", "anmtgt013");

	SetEffectScale_(efc_aroma01, 0.5);
	local task_star = Task_AnimeMoveNoFit_(reactor, "anm_star_seed001");
	WaitTask(task_cam);
	WaitTask(task_star);
	StopBgm_(30);
	SetLayoutAnime_("fade_in", false);											//黒半透明イン
	Wait_(30);
	SetLayoutAnime_("loop", false);												//黒半透明L
	Wait_(5);

	//===============================================
	//*レナーテ
	//だめ……やめて……！
	//-----------------------------------------------
	ShowScreenMessage_("DEMO_826_MSG_020", false);
	Wait_(50);
	SetLayoutAnime_("fade_out", false);											//黒半透明アウト
	//===============================================

	Wait_(30);
	ChangeColorTone_(0.0, 0.0, 0.0, 1);											//色調補正戻す


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット５　主人公とアロマ　警戒・構え　二人斜め前方
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	SetPointCameraEye_("cameye003");
	SetPointCameraTarget_("camtgt003");

	SetVisible(player, true);
	SetMotion_(player, MOT_WAIT, BLEND_N);										// 主人公　待機
	SetMotion_(aroma, MOT_WAIT, BLEND_N);										// アロマ　待機

	SetMotion_(player, player_caution01_L, 6);									// 主人公　警戒L
	SetMotion_(aroma, aroma_guard_L, 12);										// アロマ　構えるL

	//===============================================
	//■アロマ
	//「レナーテ！？　何か　あったの？
	//　どういうことなの……はっきり言って！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_826_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット６　マザー　光から花粉→光落下　正面→光とＰＡＮダウン
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	SetPointCameraEye_("cameye004");
	SetPointCameraTarget_("camtgt004");

	SetPointPosNoFit_(reactor, "efc_star_seed002");
	SetEffectScale_(efc_aroma01, 0.7);

	Wait_(10);
	SetLayoutAnime_("fade_in", false);											//黒半透明イン
	Wait_(30);
	SetLayoutAnime_("loop", false);												//黒半透明L
	Wait_(5);

	//===============================================
	//*レナーテ
	//それを……使っては……だめ……！
	//-----------------------------------------------
	ShowScreenMessage_("DEMO_826_MSG_040", false);
	Wait_(10);
	SetLayoutAnime_("fade_out", false);											//黒半透明アウト
	//===============================================
	PlaySE_("SE_DEM_206");
	efc_star_seed = SetSelectBoneEffect_("ef882_04_smoke_dark", reactor, ATTACH_GLOBAL);
	SetEffectScale_(efc_star_seed, 3.0);
	Wait_(30);

	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	Wait_(60);

	//===============================================
	//*ダークマスター
	//「ふ……ふははははっ！！
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_826_MSG_050");
	DeleteTask_(task_cam);
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	size = 0.3;
	count = 0;
	while(1){//毎フレーム黒エフェクトを大きくする
		SetEffectScale_(efc_star_seed, 3.0+(count * size));
		count = count + 1;
		Wait_(1);
		if(55 == count){//55フレームで暗転開始
			PlaySE_("SE_DEM_207");
			SetFade_(FADE_OUT, FADE_COLOR_WHITE, 30);
		}
		if(85 == count){//85フレームで終了
			break;
		}
	}


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット７　ダークマスター　斜め正面足元→頭へＰＡＮアップ→バストアップ→ゆっくり正面寄りに回り込みながらズームアウト
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	SetPointCameraEye_("cameye005");
	SetPointCameraTarget_("camtgt005");

	efc_darkmaster00 = SetSelectBoneEffectSetOffset_("ef861_02_dm_die02", darkmaster, ATTACH_GLOBAL, Vec3(0.0, -4.5, 2.0));
	efc_darkmaster01 = SetSelectBoneEffectSetOffset_("ef861_02_dm_die02", darkmaster, ATTACH_GLOBAL, Vec3(0.0, 10.25, 2.0));
	SetEffectScale_(efc_darkmaster00, 1.5);
	SetEffectScale_(efc_darkmaster01, 1.5);
	SetEffectScale_(efc_star_seed, 0.4);
	SetPointPosNoFit_(reactor, "efc_star_seed003");
	SetEffectScale_(efc_aroma01, 0.225);
	SetVisible(darkmaster, true);
	SetMotionSpeed_(darkmaster, 1.0);

	Wait_(30);
	SetFade_(FADE_IN, FADE_COLOR_WHITE, 20);
	Wait_(10);
	DeleteEffectEmitter_(efc_darkmaster00);
	DeleteEffectEmitter_(efc_darkmaster01);

	StartBlurEffect_();
	Wait_(40);

	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", CAMERA_DEF);				// 集中線
	PlaySE_("SE_DEM_026");															// ■SE:集中線
	Wait_(10);
	PlayBgm_("BGM_008");
	Wait_(6);
	DeleteEffectEmitter_(efc_cam);
	WaitTask(task_cam);
	DeleteTask_(task_cam);

	EndBlurEffect_();

	//===============================================
	//■アロマ
	//「ダークマスター！？
	//　<name_player/>が　倒したはずじゃ！？
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_826_MSG_060");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");
	Wait_(60);

	//===============================================
	//■ダークマスター
	//「死んでいたとも……肉体的にはな。
	//　貴様に敗れた　あのとき……我は死んだ。　▽
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_DARKMASTER");
	ShowMsg_("DEMO_826_MSG_070");
	KeyInputWait_();
	//===============================================

	SetMotion_(darkmaster, darkmaster_fly_summon, 6);							// ダークマスター　待機→モンスター召喚
	SetMotionSpeed_(darkmaster, 2.5);

	//===============================================
	//■ダークマスター
	//「しかし　あの場にあった　ガルマザードのマ素が
	//　我の思念を　この世に　とどまらせたのだ！
	//-----------------------------------------------
	ShowMsg_("DEMO_826_MSG_080");
	Wait_(12);
	SetMotion_(darkmaster, darkmaster_fly_summon_L, 16);						// ダークマスター　モンスター召喚L
	SetMotionSpeed_(darkmaster, 1.0);
	Wait_(16);
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(15);
	DeleteTask_(task_cam);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット８　アロマ　アロマ斜め前方→ズームアップ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");

	SetMotion_(darkmaster, darkmaster_fly_L ,BLEND_N);							// ダークマスター　浮くL
	SetVisible(player, false);
	PlaySE_("SE_DEM_026");	// ■SE:集中線
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", CAMERA_DEF);				// 集中線
	Wait_(6);
	DeleteEffectEmitter_(efc_cam);
	DeleteTask_(task_cam);

	//===============================================
	//■アロマ
	//「それって……ガルマッゾと　同じじゃない！
	//　マ素に　思念だけが　宿るなんて……！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_826_MSG_090");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(5);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット９　ダークマスターとアロマと主人公　ダークマスター斜め前方→二人斜め後方
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	task_cam = Task_AnimeMoveCamera_("anmeye005", "anmtgt005");

	SetVisible(player, true);
	SetMotion_(aroma, aroma_guard_L, BLEND_N);									// アロマ　構えるL
	SetPointPosNoFit_(darkmaster, "npc_darkmaster001");
	SetPointPosNoFit_(reactor, "efc_star_seed004");
	Wait_(5);

	//===============================================
	//■ダークマスター
	//「そう……しかし　思念だけでは　何もできん。
	//　我は　新たな身体を　生み出す方法を探した。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_DARKMASTER");
	ShowMsg_("DEMO_826_MSG_100");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(10);

	//===============================================
	//■アロマ
	//「……そこで　ポイントゼロにあった
	//　未完成スターシードに　目をつけたってわけ？
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_826_MSG_110");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(10);

	//===============================================
	//■ダークマスター
	//「いかにも。スターシードについては
	//　マザーより与えられた　知識があった……。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_DARKMASTER");
	ShowMsg_("DEMO_826_MSG_120");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(25);
	DeleteTask_(task_cam);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット１０　ダークマスター→ダースガルマ　変身　カメラほぼアニメ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	task_cam = Task_AnimeMoveCamera_("anmeye006", "anmtgt006");

	SetDir_(player, 0);
	SetVisible(player, false);
	SetVisible(aroma, false);
	SetPointPosNoFit_(darkmaster, "npc_darkmaster002");
	SetPointPosNoFit_(reactor, "efc_star_seed005");
	SetMotion_(darkmaster, darkmaster_fly_summon, 6);							// ダークマスター　待機→モンスター召喚
	SetMotionSpeed_(darkmaster, 2.5);
	PlaySE_("SE_DEM_026");	// ■SE:集中線
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", CAMERA_DEF);				// 集中線
	Wait_(8);

	//===============================================
	//■ダークマスター
	//「そして　読めていた……レナーテを救うため
	//　貴様たちが　スターシードを　使うことはな！　▽
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_DARKMASTER");
	ShowMsg_("DEMO_826_MSG_130");
	Wait_(4);
	SetMotion_(darkmaster, darkmaster_fly_summon_L, 16);						// ダークマスター　モンスター召喚L
	SetMotionSpeed_(darkmaster, 1.0);
	Wait_(18);
	DeleteEffectEmitter_(efc_cam);
	DeleteTask_(task_cam);
	KeyInputWait_();
	//===============================================
	//■ダークマスター
	//「だから　我は　スターシードに潜み
	//　貴様らが　起動させるのを　待ったのだ。　▽
	//-----------------------------------------------
	ShowMsg_("DEMO_826_MSG_140");
	KeyInputWait_();
	//===============================================

	task_cam = Task_AnimeMoveCamera_("anmeye007", "anmtgt007");
	task_star_seed = Task_AnimeMoveNoFit_(reactor, "anm_star_seed002");
	SetMotion_(darkmaster, darkmaster_fly_L ,32);								// ダークマスター　浮くL

	//===============================================
	//■ダークマスター
	//「そう……貴様らは　倒したはずの　我を
	//　自分たちの手で　復活させてしまったわけだ。
	//-----------------------------------------------
	ShowMsg_("DEMO_826_MSG_150");
	Wait_(27);
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(5);
	SetMotion_(darkmaster, darkmaster_fly_laugh_L ,12);							// ダークマスター　笑うL
	SetMotionSpeed_(darkmaster, 1.0);
	Wait_(30);

	//===============================================
	//■ダークマスター
	//「神殺しで得た　世界を創成するチカラ……
	//　それを　我に与えた上でな！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_DARKMASTER");
	ShowMsg_("DEMO_826_MSG_160");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(15);
	WaitTask(task_star_seed);
	DeleteTask_(task_star_seed);

	task_star_seed = Task_AnimeMoveNoFit_(reactor, "anm_star_seed003");
	Wait_(45);
	efc_aroma00 = SetSelectBoneEffect_("ef732_13_light_reactor01", reactor, ATTACH_GLOBAL);
	PlaySE_("SE_DEM_208");													
	SetEffectScale_(efc_aroma00, 0.6);
	DeleteTask_(task_star_seed);
	Wait_(45);
	DeleteEffectEmitter_(efc_aroma00);
	DeleteEffectEmitter_(efc_aroma01);
	DeleteEffectEmitter_(efc_star_seed);
	Wait_(15);
	efc_darkmaster00 = SetSelectBoneEffectSetOffset_("ef861_03_m_draw", darkmaster, ATTACH_EFFECT2, Vec3(0.0, 1.5, 5.0));
	SetEffectScale_(efc_darkmaster00, 0.3);
	Wait_(5);
	SetPos_(reactor, Vec3(0.0, 0.0, 0.0));
	Wait_(55);

	DeleteEffectEmitter_(efc_darkmaster00);	
	WaitTask(task_cam);
	DeleteTask_(task_cam);
	Wait_(15);

	task_cam = Task_AnimeMoveCamera_("anmeye008", "anmtgt008");
	StartBlurEffect_();
	PlaySE_("SE_DEM_209");
	efc_darkmaster00 = SetSelectBoneEffectSetOffset_("ef861_01_dm_die01", darkmaster, ATTACH_GLOBAL, Vec3(0.0, -1.5, -3.0));
	SetEffectScale_(efc_darkmaster00, 3);
	Wait_(60);
	efc_darkmaster01 = SetSelectBoneEffectSetOffset_("ef861_02_dm_die02", darkmaster, ATTACH_GLOBAL, Vec3(0.0, -1.5, 0.0));
	Wait_(15);
	SetEffectScale_(efc_darkmaster01, 6);
	Wait_(5);
	efc_darkmaster02 = SetSelectBoneEffectSetOffset_("ef861_02_dm_die02", darkmaster, ATTACH_GLOBAL, Vec3(0.0, 3.0, 0.0));
	SetEffectScale_(efc_darkmaster02, 6);
	Wait_(30);

	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 15);

	Wait_(30);
	DeleteEffectEmitter_(efc_darkmaster02);	
	SetVisible(darkmaster, false);
	SetVisible(darsgalma, true);
	SetMeshVisible_(darsgalma, "Model", true);								// 本体
	SetMeshVisible_(darsgalma, "cover", true);								// 割れてないカバー
	SetMeshVisible_(darsgalma, "arm", false);								// 腕
	SetMeshVisible_(darsgalma, "breakCover", false);						// 割れてるカバー
	SetMeshVisible_(darsgalma, "head", false);								// 竜
	SetAlphaFade(darsgalma, 0.2, 0);
	SetMotion_(player, player_battle_L, BLEND_N);								// 主人公　戦闘待機
	efc_darsgalma00 = SetPointWorldEffect_("ef861_02_dm_die02", "efc_darsgalma000");
	SetEffectScale_(efc_darsgalma00, 5.0);
	efc_darsgalma01 = SetSelectBoneEffectSetOffset_("ef730_01_oth_dark_aura01", darsgalma, ATTACH_GLOBAL, Vec3(0.0, 45.0, 0.0));// 禍々しいオーラ
	SetEffectScale_(efc_darsgalma01, 1.5);
	DeleteTask_(task_cam);

	task_cam = Task_AnimeMoveCamera_("anmeye009", "anmtgt009");
	SetMotionSpeed_(darsgalma, 0.5);
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);
	StartBlurEffect_();
	Wait_(5);
	DeleteEffectEmitter_(efc_darsgalma00);
	SetAlphaFade(darsgalma, 1.0, 25);
	PlaySE_("SE_DEM_026");	// ■SE:集中線
	SetMotionSpeed_(darsgalma, 1.0);
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", CAMERA_DEF);				// 集中線
	task_darsgalma00 = Task_AnimeMoveNoFit_(darsgalma, "anm_darsgalma000");
	Wait_(5);
	DeleteEffectEmitter_(efc_cam);
	DeleteEffectEmitter_(efc_darkmaster00);
	DeleteEffectEmitter_(efc_darkmaster01);

	WaitTask(task_cam);
	EndBlurEffect_();
	DeleteTask_(task_cam);
	EndBlurEffect_();

	task_cam = Task_AnimeMoveCamera_("anmeye010", "anmtgt010");
	Wait_(57);
	SetVisible(player, true);
	SetVisible(aroma, true);
	SetMotion_(aroma, aroma_guard_L, BLEND_N);									// アロマ　構えるL
	Wait_(150);
	DeleteTask_(task_cam);
	DeleteTask_(task_darsgalma00);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット１１　ダースガルマ　剣攻撃　正面
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	SetPointCameraEye_("cameye006");
	SetPointCameraTarget_("camtgt006");

	SetPointPosNoFit_(darsgalma, "npc_darsgalma001");
	SetVisible(player, false);
	SetVisible(aroma, false);
	Wait_(10);

	//===============================================
	//■ダークマスター
	//「この姿こそは……ダースガルマ！！
	//　我が　新たなチカラの　結晶である！！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_DARKMASTER");
	ShowMsg_("DEMO_826_MSG_170");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(10);

	//===============================================
	//■ダースガルマ
	//「偉大にして　絶対的な　チカラの前に
	//　絶望しながら死ね！　<name_player/>！！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_DARSGARUMA");
	ShowMsg_("DEMO_826_MSG_180");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(20);
	task_darsgalma01 = Task_RotateToDir_(darsgalma, 165, 1.0);
	task_darsgalma02 = Task_AnimeMoveNoFit_(darsgalma, "anm_darsgalma001");
	SetMotion_(darsgalma, MOT_SWORD_ACTUATE, 32);
	PlaySE_("SE_DEM_210");
	Wait_(28);

	task_cam = Task_AnimeMoveCamera_("anmeye011", "anmtgt011");

	EncountEndDemo(ENCOUNT_BOSS);
	SetMotionSpeed_(darsgalma, 0.1);
}
