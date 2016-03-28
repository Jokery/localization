//=============================================
//
//		demo420[イッタブル戦勝利]
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
	local task_cam, task_player, task_dark, task_rukiya00, task_rukiya01;
	local task_toge00, task_toge01, task_toge02, task_togeSE00, task_togeSE01, task_togeSE02;
	local efc_player, efc_ittaburu, efc_rukiya, efc_cam00, efc_cam01;
	local efc_foce, efc_smoke00, efc_smoke01, efc_smoke02, efc_smoke03, efc_explosion;
	
// ▼フラグ設定
	local bit_ruler2 = GetEventFlg_("BFG_RULER_ADD_019");			// Bit_219  ルーラ追加フラグ 黒鉄の監獄塔　動力区
	
// ▼リソース読込
	// キャラクター
	local player = GetPlayerId_();							// 主人公
	local model_rukiya = ReadNpc_("n009");					// ルキヤ
	local model_ittaburu = ReadNpc_("m205_00");				// イッタブル
	local model_dark = ReadNpc_("n008");					// ダークマスター
	local model_toge = ReadNpc_("m195_00");					// 凶トゲジョボー
	// ギミック
	local model_control = ReadGimmick_("o_S02_09");			// 制御装置（通常）
	local model_reactor = ReadGimmick_("o_dem_23");			// ルキヤのリアクター
	local model_bomb = ReadGimmick_("o_dem_17");			// 爆弾
	local model_bombswitch = ReadGimmick_("o_dem_18");		// 起爆装置スイッチ
	local model_ruler = ReadGimmick_("o_com_08");			// ルーラポイント
	// エフェクト
	LoadEffect_("ef712_10_emo_surprise01");					// 「！」
	LoadEffect_("ef721_03_nat_smoke_n03");					// イッタブルの煙
	LoadEffect_("ef733_01_sym_shuchusen01");				// 集中線
	LoadEffect_("ef842_04_dark_foce");						// ダークマスターの手から出る力
	LoadEffect_("ef721_05_nat_smoke_s01");					// 汎用煙　小さい煙→白
	LoadEffect_("ef721_04_nat_smoke_psps");					// 煙ぷすぷす（電流あり）
	LoadEffect_("ef842_02_light_alert");					// 赤いランプ
	LoadEffect_("ef842_03_explosion_brkmcn01");				// ブレイク化装置の爆発

// ▼配置
	// 主人公
	SetPointPos_(player, "player000");
	// ルキヤ
	local rukiya = ArrangePointNpc_(model_rukiya, "npc_rukiya000");
	SetPointPosNoFit_(rukiya, "npc_rukiya000");
	SetFace_(rukiya, "bom_default");
	SetMeshVisible_(rukiya, "Model_3", false);
	// イッタブル
	local ittaburu = ArrangePointNpc_(model_ittaburu, "npc_ittaburu000");
	SetScale_(ittaburu, SCALE.M);
	// ダークマスター
	local dark = ArrangePointNpc_(model_dark, "npc_dark000");
	SetVisible(dark, false);
	SetStepSe_(dark, "SE_FLD_021");
	// 凶トゲジョボー１２３
	local toge00 = ArrangePointNpc_(model_toge, "npc_toge000");
	local toge01 = ArrangePointNpc_(model_toge, "npc_toge100");
	local toge02 = ArrangePointNpc_(model_toge, "npc_toge200");
	SetVisible(toge00, false);
	SetVisible(toge01, false);
	SetVisible(toge02, false);
	// 制御装置（通常）
	local control = ArrangePointGimmick_("o_S02_09", model_control, "obj_control000");
	// ルキヤのリアクター
	local reactor = ArrangePointGimmick_("o_dem_07", model_reactor, "npc_rukiya000");
	SetMotion_(reactor, MOT_GIMMICK_0, BLEND_N);
	SetAlpha_(reactor, ALPHA_CLEAR);
	// 爆弾
	local bomb = ArrangePointGimmick_("o_dem_17", model_bomb, "obj_control000");
	SetMotion_(bomb, MOT_GIMMICK_0, BLEND_N);
	// 起爆装置スイッチ
	local bombswitch = ArrangePointGimmick_("o_dem_18", model_bombswitch, "npc_rukiya000");
	SetAlpha_(bombswitch, ALPHA_CLEAR);
	SetScale_(bombswitch, 1.2);
	// ルーラポイント
	local ruler = ArrangePointGimmick_("o_com_08", model_ruler, "obj_ruler000");
	// ▽ルーラポイントが既に起動していた場合
	if (bit_ruler2) { SetMotion_(ruler, MOT_GIMMICK_2, BLEND_N); }
	
// ▼非常駐モーション読込
	local player_battle_L = ReadMotion_(player, "Player_battle_L");				// 主人公　戦闘待機
	local player_look_left_L = ReadMotion_(player, "Player_look_left_L");		// 主人公　左向き待機L
	local player_caution01_L = ReadMotion_(player, "Player_caution01_L");		// 主人公　警戒L
	local player_back_L = ReadMotion_(player, "Player_back_L");					// 主人公　後ずさり
	local player_get_reactor = ReadMotion_(player, "Player_get_reactor");		// 主人公　リアクター受け取る→待機
	local player_caution01_up_L = ReadMotion_(player, "Player_caution01_up_L");	// 主人公　警戒（ルキヤを見る）L
	local player_vix = ReadMotion_(player, "Player_vix");						// 主人公　悔しい感じ
	local player_reactor_stand = ReadMotion_(player, "Player_reactor_stand");	// 主人公　リアクター付待機
	local player_reactor_run = ReadMotion_(player, "Player_reactor_run");		// 主人公　リアクター付走り
	local player_reactor_caution01_L = ReadMotion_(player, "Player_reactor_caution01_L");	// 主人公　リアクター付警戒
	local player_reactor_caution_turn_L = ReadMotion_(player, "Player_reactor_caution_turn_L");// 主人公　リアクター付警戒（振り向き）

	local rukiya_bomb_L = ReadMotion_(rukiya, "n009_bomb_L");					// ルキヤ　起爆装置持ち待機L
	local rukiya_bomb = ReadMotion_(rukiya, "n009_bomb");						// ルキヤ　起爆装置スイッチ押し
	local rukiya_look_right_L = ReadMotion_(rukiya, "n009_look_right_L");		// ルキヤ　右向き待機L
	local rukiya_look_left_L = ReadMotion_(rukiya, "n009_look_left_L");			// ルキヤ　左向き待機L
	local rukiya_pass_reactor = ReadMotion_(rukiya, "n009_pass_reactor");		// ルキヤ　リアクターを外す→差し出す
	local rukiya_pass_reactor_L = ReadMotion_(rukiya, "n009_pass_reactor_L");	// ルキヤ　リアクターを差し出すL
	local rukiya_blast_on = ReadMotion_(rukiya, "n009_blast_on");				// ルキヤ　椅子スイッチオン
	local rukiya_blast_L = ReadMotion_(rukiya, "n009_blast_L");					// ルキヤ　椅子スイッチオンL
	local rukiya_look_down_L = ReadMotion_(rukiya, "n009_look_down_L");			// ルキヤ　下向き待機L
	local rukiya_look_up_L = ReadMotion_(rukiya, "n009_look_up_L");				// ルキヤ　上向き待機L

	local ittaburu_one_knee = ReadMotion_(ittaburu, "m205_00_one_knee");		// イッタブル　待機→膝をつく
	local ittaburu_one_knee_L = ReadMotion_(ittaburu, "m205_00_one_knee_L");	// イッタブル　膝をつくL

	local dark_summon = ReadMotion_(dark, "n008_summon");						// ダークマスター　待機→モンスター召喚
	local dark_summon_L = ReadMotion_(dark, "n008_summon_L");					// ダークマスター　モンスター召喚L
	local dark_laugh_L = ReadMotion_(dark, "n008_laugh_L");						// ダークマスター　笑うL
	local dark_surprise_L = ReadMotion_(dark, "n008_surprise_L");				// ダークマスター　驚きL

	local toge_after_break00 = ReadMotion_(toge00, "m195_00_after_break");		// 凶トゲジョボー１　トゲ付き待機
	local toge_break_walk00 = ReadMotion_(toge00, "m195_00_break_walk");		// 凶トゲジョボー１　トゲ付き歩き
	local toge_after_break01 = ReadMotion_(toge01, "m195_00_after_break");		// 凶トゲジョボー２　トゲ付き待機
	local toge_break_walk01 = ReadMotion_(toge01, "m195_00_break_walk");		// 凶トゲジョボー２　トゲ付き歩き
	local toge_after_break02 = ReadMotion_(toge02, "m195_00_after_break");		// 凶トゲジョボー３　トゲ付き待機
	local toge_break_walk02 = ReadMotion_(toge02, "m195_00_break_walk");		// 凶トゲジョボー３　トゲ付き歩き


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット1　イッタブル　膝をつく
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

// ▼カメラ設定
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");

	SetMotion_(player, player_battle_L, BLEND_N);			// 主人公　戦闘待機
	PlaySE_("SE_DEM_092");
	SetMotion_(ittaburu, ittaburu_one_knee, BLEND_XL);		// イッタブル　待機→膝をつく


//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	WaitMotion(ittaburu);
	SetMotion_(ittaburu, ittaburu_one_knee_L, BLEND_XL);	// イッタブル　膝をつくL
	efc_ittaburu = SetPointWorldEffect_("ef721_03_nat_smoke_n03", "npc_ittaburu000");// 砂煙
	SetEffectScale_(efc_ittaburu, 1.5);
	StartEarthQuake_(9, 3, 2);
	Wait_(22);
	DeleteTask_(task_cam);

	//===============================================
	// ■イッタブル
	// 「これほどとは……！
	// 　このイッタブル　一生の不覚である……！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ITABURU");
	ShowMsg_("DEMO_420_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(10);
	task_dark = Task_AnimeMove_(dark, "anm_dark000");
	Wait_(5);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット2　ダークマスター　登場　カメラ足元左→背後
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

	PlayBgm_("BGM_008");
	SetMotionSpeed_(player, 0.9);
	SetScale_(ittaburu, 0.6);// カメラに収まらないので一時的に縮小
	SetPointPosNoFit_(ittaburu, "npc_ittaburu001");
	SetPointPos_(rukiya, "npc_rukiya001");
	SetVisible(dark, true);
	DeleteEffect_(efc_ittaburu);
	SetPos_(player, Vec3(-8.8, 5.0, 141.13576));
	SetDir_(player, 16);
	SetMotion_(dark, MOT_WALK, BLEND_L);					// ダークマスター　歩き
	Wait_(84);
	DeleteTask_(task_cam);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット3　ダークマスター　歩き→待機
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");

	SetPos_(player, Vec3(-4.8, 5.0, 141.13576));
	Wait_(52);
	SetMotion_(dark, MOT_WAIT, 26);							// ダークマスター　待機
	SetMotionSpeed_(dark, 1.0);
	WaitTask(task_dark);
	DeleteTask_(task_dark);
	task_dark = Task_RotateToDir_(dark, 215, 3.0);
	Wait_(15);
	DeleteTask_(task_dark);

	//===============================================
	// *ダークマスター
	// 「もういい。下がれ　イッタブル。
	// 　おろか者が……我が手を　わずらわせおって。
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_420_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	// ルキヤ　「！」
	efc_rukiya = SetPointWorldEffect_("ef712_10_emo_surprise01", "efc_surprise000");// 「！」
	SetEffectScale_(efc_rukiya, 2.4);
	PlaySE_("SE_DEM_053");									// 「！」音
	Wait_(30);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット4　ルキヤ　驚き　ズームイン
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");

	SetVisible(player, false);
	SetMotion_(player, MOT_WAIT, BLEND_N);					// 主人公　待機
	SetMotionSpeed_(player, 1.0);
	PlaySE_("SE_DEM_026");	// ■SE:集中線
	efc_cam00 = SetCameraEffect_("ef733_01_sym_shuchusen01", CAMERA_DEF);// 集中線
	Wait_(7);
	DeleteEffectEmitter_(efc_cam00);
	

	//===============================================
	// ■ルキヤ
	// 「お前は……ダークマスター！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RUKIYA");
	ShowMsg_("DEMO_420_MSG_030");
	SetFace_(rukiya, "Face_anger");
	
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(15);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット5　イッタブル　膝つき　アップ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");

	SetVisible(dark, false);
	SetScale_(ittaburu, SCALE.M);//サイズ戻し
	Wait_(10);

	//===============================================
	// ■イッタブル
	// 「ダ……ダークマスターさまっ！
	// 　面目次第も　ございませぬ……のである。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ITABURU");
	ShowMsg_("DEMO_420_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(10);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット6　ダークマスター　会話　足元→バストアップ→ズームイン
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");

	SetVisible(dark, true);
	SetVisible(ittaburu, false);
	SetDir_(dark, 185);
	Wait_(135);

	//===============================================
	// ■ダークマスター
	// 「ルキヤに　アンセス……この改造装置に
	// 　目をつけたこと　まずは　ほめておこう。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_DARKMASTER");
	ShowMsg_("DEMO_420_MSG_050");
	KeyInputWait_();
	//===============================================

	//===============================================
	// ■ダークマスター
	// 「だが　この装置は　マザーの下僕たる
	// 　ブレイクモンスターを　作り出す要だ。
	//-----------------------------------------------
	ShowMsg_("DEMO_420_MSG_060");
	KeyInputWait_();
	//===============================================

	//===============================================
	// ■ダークマスター
	// 「この世界を　マザーの名のもとに　まとめあげ
	// 　ひとつにする……その邪魔は　させんぞ！
	//-----------------------------------------------
	ShowMsg_("DEMO_420_MSG_070");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	DeleteTask_(task_cam);
	Wait_(10);
	SetFace_(rukiya, "Face_eyes_close");

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット7　ルキヤ　起爆装置スイッチ押し→逃走　バストアップ(→カメラアウト)
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	SetPointCameraEye_("cameye003");
	SetPointCameraTarget_("camtgt003");

	SetDir_(rukiya, 10);
	SetMotion_(rukiya, rukiya_bomb_L, BLEND_N);				// ルキヤ　起爆装置持ち待機L
	SetAlpha_(bombswitch, ALPHA_EXIST);
	AttachObject_(rukiya, bombswitch, ATTACH_EFFECT2);

	//===============================================
	// ■ルキヤ
	// 「遅いよ　ダークマスター！
	// 　このスイッチさえ　入れれば……！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RUKIYA");
	ShowMsg_("DEMO_420_MSG_080");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(rukiya, rukiya_bomb, BLEND_XL);				// ルキヤ　起爆装置スイッチ押し
	Wait_(24);												// スイッチを押すSEタイミング調整
	PlaySE_("SE_DEM_029");									// ポチっとな
	Wait_(6);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット8　起爆装置　チカチカ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	SetPointCameraEye_("cameye004");
	SetPointCameraTarget_("camtgt004");

	DetachObject_(rukiya);
	Wait_(5);
	PlaySE_("SE_DEM_070");
	SetMotion_(bomb, MOT_GIMMICK_1, BLEND_N);				// 爆弾　点滅
	Wait_(45);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット9　ダークマスター　待機→召喚　バストアップ左斜め前方
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	SetPointCameraEye_("cameye005");
	SetPointCameraTarget_("camtgt005");

	//===============================================
	// ■ダークマスター
	// 「ふん……バカめ。
	// 　そんな　単純な爆弾など……！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_DARKMASTER");
	ShowMsg_("DEMO_420_MSG_090");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(dark, dark_summon, BLEND_L);					// ダークマスター　待機→モンスター召喚
	SetMotionSpeed_(dark, 1.33);
	Wait_(40);
	PlaySE_("SE_DEM_071");
	SetMotion_(dark, dark_summon_L, BLEND_L);				// ダークマスター　モンスター召喚L
	SetMotionSpeed_(dark, 1.00);
	efc_foce = SetPointWorldEffect_("ef842_04_dark_foce", "efc_foce000");// ダークマスターの手から出る力
	SetEffectScale_(efc_foce, 0.7);

	Wait_(30);
	DeleteEffect_(efc_foce);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット10　起爆装置　ぷすん
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	SetPointCameraEye_("cameye004");
	SetPointCameraTarget_("camtgt004");

	Wait_(15);
	PlaySE_("SE_DEM_072");
	efc_smoke00 = SetPointWorldEffect_("ef721_05_nat_smoke_s01", "efc_smoke000");// 汎用煙　小さい煙→白
	efc_smoke01 = SetPointWorldEffect_("ef721_04_nat_smoke_psps", "efc_smoke001");// 煙ぷすぷす（電流あり）
	SetMotion_(bomb, MOT_GIMMICK_0, BLEND_N);				// 爆弾　停止
	Wait_(45);
	SetFace_(rukiya, "Face_default");


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット11　主人公とルキヤと起爆装置　起爆装置へ振り向く二人　右斜め前方
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	SetPointCameraEye_("cameye006");
	SetPointCameraTarget_("camtgt006");

	DeleteEffect_(efc_smoke00);
	DeleteEffect_(efc_smoke01);
	efc_smoke02 = SetPointWorldEffect_("ef721_05_nat_smoke_s01", "efc_smoke002");// 汎用煙　小さい煙→白
	efc_smoke03 = SetPointWorldEffect_("ef721_04_nat_smoke_psps", "efc_smoke003");// 煙ぷすぷす（電流あり）
	SetEffectScale_(efc_smoke02, 3.0);
	SetEffectScale_(efc_smoke03, 3.0);
	SetVisible(player, true);
	SetPointPos_(player, "player001");
	SetPointPos_(rukiya, "npc_rukiya002");
	SetMotion_(player, player_look_left_L, BLEND_L);		// 主人公　左向き待機L
	SetMotion_(rukiya, MOT_WAIT, BLEND_N);					// ルキヤ　待機
	SetMotion_(rukiya, rukiya_look_right_L, BLEND_L);		// ルキヤ　右向き待機L
	Wait_(8);
	efc_player = SurpriseDispSetOffset(player, Vec3(1.0, 1.5, 0.0), 0.9);
	Wait_(60);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット12　ダークマスター→全員　ダークマスター召喚→他歩き　バストアップ→ズームアウト
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	SetPointCameraEye_("cameye007");
	SetPointCameraTarget_("camtgt007");

	SetVisible(ittaburu, true);
	SetPointPos_(ittaburu, "npc_ittaburu002");
	SetPointPos_(player, "player002");
	SetPointPos_(rukiya, "npc_rukiya003");
	SetDir_(ittaburu, 165);
	SetMotion_(dark, dark_laugh_L, BLEND_N);				// ダークマスター　笑うL
	SetMotion_(player, player_caution01_L, BLEND_N);		// 主人公　警戒L
	SetMotion_(rukiya, MOT_WAIT, BLEND_N);					// ルキヤ　待機
	DeleteEffect_(efc_smoke02);
	DeleteEffect_(efc_smoke03);

	//===============================================
	// ■ダークマスター
	// 「クックック……残念だったな　ルキヤ。
	// 　遊びは　おしまいだ……観念するがいい！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_DARKMASTER");
	ShowMsg_("DEMO_420_MSG_100");
	Wait_(45);
	SetMotion_(dark, MOT_WAIT, 16);							// ダークマスター　待機
	Wait_(16);
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");

	SetMotion_(dark, dark_summon, BLEND_L);					// ダークマスター　待機→モンスター召喚
	PlaySE_("SE_DEM_073");
	Wait_(60);
	DeleteTask_(task_cam);
	SetMotion_(dark, dark_summon_L, BLEND_L);				// ダークマスター　モンスター召喚L
	SetFade_(FADE_OUT, FADE_COLOR_WHITE, 25);
	Wait_(30);
	SetVisible(toge00, true);
	SetVisible(toge01, true);
	SetVisible(toge02, true);
	SetMotion_(toge00, toge_after_break00, BLEND_N);		// 凶トゲジョボー１　トゲ付き待機
	SetMotion_(toge01, toge_after_break01, BLEND_N);		// 凶トゲジョボー２　トゲ付き待機
	SetMotion_(toge02, toge_after_break02, BLEND_N);		// 凶トゲジョボー３　トゲ付き待機
	
	SetStepSe_(toge00, SILENT_STEP_SE);
	SetStepSe_(toge01, SILENT_STEP_SE);
	SetStepSe_(toge02, SILENT_STEP_SE);
	
	SetFade_(FADE_IN, FADE_COLOR_WHITE, 25);
	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");
	Wait_(75);
	
	SetMotion_(toge00, toge_break_walk00, 24);				// 凶トゲジョボー１　トゲ付き歩き
	task_toge00 = Task_AnimeMoveNoDir_(toge00, "anm_toge000");
	SetMotionSpeed_(toge00, 0.49);
	task_togeSE00=Task_PlaySe_("SE_FLD_021", 18);	
	Wait_(1);
	
	SetMotion_(toge01, toge_break_walk00, 24);				// 凶トゲジョボー２　トゲ付き歩き
	task_toge01 = Task_AnimeMoveNoDir_(toge01, "anm_toge100");
	SetMotionSpeed_(toge01, 0.50);
	task_togeSE01=Task_PlaySe_("SE_FLD_021", 18);	
	Wait_(1);
	
	SetMotion_(toge02, toge_break_walk00, 24);				// 凶トゲジョボー３　トゲ付き歩き
	task_toge02 = Task_AnimeMoveNoDir_(toge02, "anm_toge200");
	SetMotionSpeed_(toge02, 0.51);
	task_togeSE02=Task_PlaySe_("SE_FLD_021", 18);
	Wait_(40);
	
	task_player = Task_AnimeMoveNoDir_(player, "anm_player000");
	SetMotion_(player, player_back_L, 12);					// 主人公　後ずさり
	SetMotionSpeed_(player, 1.80);
	Wait_(2);
	
	task_rukiya00 = Task_AnimeMoveNoDir_(rukiya, "anm_rukiya000");
	Wait_(57);
	
	DeleteTask_(task_cam);
	
	DeleteTask_(task_toge00);
	DeleteTask_(task_toge01);
	DeleteTask_(task_toge02);
	
	DeleteTask_(task_togeSE00);
	DeleteTask_(task_togeSE01);
	DeleteTask_(task_togeSE02);
		
	DeleteTask_(task_player);
	DeleteTask_(task_rukiya00);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット13　主人公とルキヤ　後ずさり　俯瞰
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	SetPointCameraEye_("cameye008");
	SetPointCameraTarget_("camtgt008");

	SetDir_(toge00, 165);
	SetDir_(toge01, 170);
	SetDir_(toge02, 180);
	SetScale_(toge00, 0.6);// カメラに収まらないので縮小
	SetScale_(toge01, 0.6);// カメラに収まらないので縮小
	SetScale_(toge02, 0.6);// カメラに収まらないので縮小
	InitSilhouetteWidth_(toge00, 0.6);
	InitSilhouetteWidth_(toge01, 0.6);
	InitSilhouetteWidth_(toge02, 0.6);
	task_toge00 = Task_AnimeMoveNoDir_(toge00, "anm_toge001");
	task_toge01 = Task_AnimeMoveNoDir_(toge01, "anm_toge101");
	task_toge02 = Task_AnimeMoveNoDir_(toge02, "anm_toge201");
	task_player = Task_AnimeMoveNoDir_(player, "anm_player001");
	task_rukiya00 = Task_AnimeMoveNoDir_(rukiya, "anm_rukiya001");
	SetMotionSpeed_(toge00, 0.30);
	SetMotionSpeed_(toge01, 0.31);
	SetMotionSpeed_(toge02, 0.29);
	SetMotionSpeed_(player, 1.80);
	Wait_(85);
	DeleteTask_(task_toge00);
	DeleteTask_(task_toge01);
	DeleteTask_(task_toge02);
	DeleteTask_(task_player);
	DeleteTask_(task_rukiya00);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット14　主人公とルキヤ　構え　バストアップ→ズームアウト
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	task_cam = Task_AnimeMoveCamera_("anmeye005", "anmtgt005");

	SetMotion_(toge00, toge_after_break00, BLEND_N);		// 凶トゲジョボー１　トゲ付き待機
	SetMotion_(toge01, toge_after_break01, BLEND_N);		// 凶トゲジョボー２　トゲ付き待機
	SetMotion_(toge02, toge_after_break02, BLEND_N);		// 凶トゲジョボー３　トゲ付き待機
	SetMotion_(player, player_caution01_L, BLEND_N);		// 主人公　警戒L
	SetMotionSpeed_(player, 1.00);
	SetPointPos_(player, "player003");
	Wait_(60);
	task_rukiya00 = Task_RotateToDir_(rukiya, 80, 7.5);
	Wait_(2);
	SetMotion_(rukiya, rukiya_look_left_L, 10);				// ルキヤ　左向き待機L
	Wait_(30);
	DeleteTask_(task_rukiya00);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット15　パイプ　ズームイン
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	task_cam = Task_AnimeMoveCamera_("anmeye006", "anmtgt006");

	Wait_(60);
	DeleteTask_(task_cam);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット16　主人公とルキヤ　リアクター手渡し
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	SetPointCameraEye_("cameye009");
	SetPointCameraTarget_("camtgt009");

	SetPointPosNoFit_(rukiya, "npc_rukiya004");
	SetMotion_(rukiya, MOT_WAIT, BLEND_N);					// ルキヤ　待機
	task_rukiya00 = Task_RotateToDir_(rukiya, 180, 5);
	Wait_(15);
	DeleteTask_(task_rukiya00);
	task_rukiya00 = Task_AnimeMoveNoFit_(rukiya, "anm_rukiya002");
	Wait_(15);
	DeleteTask_(task_rukiya00);

	SetMotion_(rukiya, rukiya_pass_reactor, BLEND_XL);		// ルキヤ　リアクターを外す→差し出す
	SetMotionSpeed_(rukiya, 1.25);
	Wait_(26);
	SetAlpha_(reactor, ALPHA_EXIST);
	AttachObject_(rukiya, reactor, ATTACH_EFFECT2);
	SetMeshVisible_(rukiya, "Model_2", false);
	WaitMotion(rukiya);
	SetMotion_(rukiya, rukiya_pass_reactor_L, BLEND_XL);	// ルキヤ　リアクターを差し出すL

	//===============================================
	// ■ルキヤ
	// 「<name_player/>……あんたは
	// 　これを持って　そこから　お逃げ。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RUKIYA");
	ShowMsg_("DEMO_420_MSG_110");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	task_cam = Task_AnimeMoveCamera_("anmeye007", "anmtgt007");

	SetMotion_(player, MOT_WAIT, 13);						// 主人公　待機
	SetScale_(toge00, 0.8);// カメラ収まりを考えて調整
	SetScale_(toge01, 0.8);// カメラ収まりを考えて調整
	SetScale_(toge02, 0.8);// カメラ収まりを考えて調整
	task_toge00 = Task_AnimeMove_(toge00, "anm_toge002");
	task_toge01 = Task_AnimeMove_(toge01, "anm_toge102");
	task_toge02 = Task_AnimeMove_(toge02, "anm_toge202");
	SetMotionSpeed_(toge00, 0.30);
	SetMotionSpeed_(toge01, 0.32);
	SetMotionSpeed_(toge02, 0.28);
	SetMotion_(toge00, toge_break_walk00, BLEND_N);			// 凶トゲジョボー１　トゲ付き歩き
	Wait_(1);
	SetMotion_(toge01, toge_break_walk00, BLEND_M);			// 凶トゲジョボー２　トゲ付き歩き
	Wait_(1);
	SetMotion_(toge02, toge_break_walk00, BLEND_L);			// 凶トゲジョボー３　トゲ付き歩き
	Wait_(13);
	SetMotion_(player, player_get_reactor, BLEND_L);		// 主人公　リアクター受け取る→待機
	SetMotionSpeed_(player, 1.25);
	Wait_(12);
	DetachObject_(rukiya);
	AttachObject_(player, reactor, ATTACH_EFFECT2);
	SetMotion_(rukiya, MOT_WAIT, BLEND_L);					// ルキヤ　待機
	Wait_(24);
	WaitMotion(player);
	SetMotion_(player, player_reactor_stand, 5);			// 主人公　リアクター付待機
	Wait_(69);
	DeleteTask_(task_cam);
	SetMotion_(toge00, toge_after_break00, BLEND_N);		// 凶トゲジョボー１　トゲ付き待機
	SetMotion_(toge01, toge_after_break01, BLEND_N);		// 凶トゲジョボー２　トゲ付き待機
	SetMotion_(toge02, toge_after_break02, BLEND_N);		// 凶トゲジョボー３　トゲ付き待機


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット17　主人公とルキヤ　振り向き→スイッチ→赤くなる　ズームイン→ズームアウト
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	task_cam = Task_AnimeMoveCamera_("anmeye008", "anmtgt008");

	SetMotionSpeed_(player, 1.00);
	SetMotionSpeed_(rukiya, 1.00);
	SetMotion_(player, player_reactor_caution01_L, BLEND_N);// 主人公　リアクター付警戒
	SetPointPos_(rukiya, "npc_rukiya005");
	task_rukiya00 = Task_RotateToDir_(rukiya, 1, 10);
	Wait_(18);
	PlaySE_("SE_DEM_026");	// ■SE:集中線
	efc_cam00 = SetCameraEffect_("ef733_01_sym_shuchusen01", CAMERA_DEF);// 集中線
	Wait_(7);
	DeleteTask_(task_rukiya00);
	DeleteEffectEmitter_(efc_cam00);

	//===============================================
	// ■ルキヤ
	// 「……こんなことも　あろうかと　用意しておいた
	// 　最後の切り札を　使うときが　きたようだね。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RUKIYA");
	ShowMsg_("DEMO_420_MSG_120");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	WaitTask(task_cam);
	DeleteTask_(task_cam);

	task_cam = Task_AnimeMoveCamera_("anmeye009", "anmtgt009");
	Wait_(60);

	StopBgm_(60);
	SetMotion_(rukiya, rukiya_blast_on, BLEND_XL);			// ルキヤ　椅子スイッチオン
	WaitMotion(rukiya);
	SetMotion_(rukiya, rukiya_blast_L, BLEND_L);			// ルキヤ　椅子スイッチオンL
	PlaySE_("SE_DEM_093");
	SetFace_(rukiya, "bom_loop");							// ルキヤ　爆弾起動
	SetMeshVisible_(rukiya, "Model_3", true);
	Wait_(25);
	efc_cam01 = SetCameraEffect_("ef842_02_light_alert", CAMERA_DEF);// 赤いランプ
	Wait_(60);
	DeleteTask_(task_cam);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット18　ダークマスター　驚き(警戒？)　バストアップズームイン
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	task_cam = Task_AnimeMoveCamera_("anmeye010", "anmtgt010");
	PlayBgm_("BGM_023");
	SetMotion_(dark, MOT_WAIT, BLEND_N);					// ダークマスター　待機
	SetMotion_(dark, dark_surprise_L, 6);					// ダークマスター　驚きL
	PlaySE_("SE_DEM_026");	// ■SE:集中線
	efc_cam00 = SetCameraEffect_("ef733_01_sym_shuchusen01", CAMERA_DEF);// 集中線
	Wait_(7);
	DeleteEffectEmitter_(efc_cam00);

	//===============================================
	// ■ダークマスター
	// 「この巨大な　熱反応は……まさか
	// 　ルキヤが　乗っている機械の　自爆装置か！？
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_DARKMASTER");
	ShowMsg_("DEMO_420_MSG_130");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(5);
	DeleteTask_(task_cam);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット19　ルキヤと主人公　会話　バストアップズームイン
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	task_cam = Task_AnimeMoveCamera_("anmeye011", "anmtgt011");

	SetMotion_(rukiya, MOT_WAIT, BLEND_N);					// ルキヤ　待機
	SetMotion_(rukiya, MOT_TALK, BLEND_L);					// ルキヤ　会話
	PlaySE_("SE_DEM_026");	// ■SE:集中線
	efc_cam00 = SetCameraEffect_("ef733_01_sym_shuchusen01", CAMERA_DEF);// 集中線
	Wait_(7);
	DeleteEffectEmitter_(efc_cam00);

	//===============================================
	// ■ルキヤ
	// 「そうさ！　こいつを使えば
	// 　改造装置くらい　吹っ飛ばせるはず！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RUKIYA");
	ShowMsg_("DEMO_420_MSG_140");
	SetMotion_(rukiya, MOT_TALKLOOP, BLEND_L);				// ルキヤ　会話L
	SetFace_(rukiya, "Face_anger");							// ルキヤ　嘲笑
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(5);
	DeleteTask_(task_cam);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット20　ダークマスター　バストアップ左斜め前方
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	SetPointCameraEye_("cameye010");
	SetPointCameraTarget_("camtgt010");

	SetMotion_(dark, MOT_TALKLOOP, BLEND_N);				// ダークマスター　会話L
	SetMotionSpeed_(dark, 1.75);

	//===============================================
	// ■ダークマスター
	// 「ルキヤ　貴様……！
	// 　装置の破壊と　ひきかえに　死ぬ気か！？
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_DARKMASTER");
	ShowMsg_("DEMO_420_MSG_150");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(5);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット21　ルキヤ　待機→右向き待機　バストアップ左斜め前方
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	task_cam = Task_AnimeMoveCamera_("anmeye012", "anmtgt012");

	SetFace_(rukiya, "Face_default");
	SetMotion_(rukiya, MOT_WAIT, BLEND_N);					// ルキヤ　待機
	SetDir_(rukiya, 90);
	task_rukiya00 = Task_AnimeMoveNoDirNoFit_(rukiya, "anm_rukiya003");
	Wait_(25);
	task_rukiya01 = Task_RotateToDir_(rukiya, 70, 0.4);
	Wait_(25);
	SetMotion_(rukiya, rukiya_look_right_L, 14);			// ルキヤ　右向き待機L
	WaitTask(task_rukiya00);
	DeleteTask_(task_rukiya00);
	DeleteTask_(task_rukiya01);

	//===============================================
	// ■ルキヤ
	// 「こんな　改造装置は　この世界に
	// 　存在させておくわけにゃ　いかないんでね！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RUKIYA");
	ShowMsg_("DEMO_420_MSG_160");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	WaitTask(task_cam);
	DeleteTask_(task_cam);
	task_cam = Task_AnimeMoveCamera_("anmeye013", "anmtgt013");
	SetMotion_(rukiya, rukiya_look_left_L, 12);				// ルキヤ　左向き待機L
	Wait_(36);
	DeleteTask_(task_cam);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット22　主人公　警戒→方向転換→走り　バストアップ右斜め前方→ややズームイン
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	SetPointCameraEye_("cameye011");
	SetPointCameraTarget_("camtgt011");

	SetMotion_(rukiya, MOT_WAIT, BLEND_N);					// ルキヤ　待機
	SetDir_(rukiya, 40);
	SetPointPos_(player, "player004");
	Wait_(15);

	//===============================================
	// ■ルキヤ
	// 「何やってんだい！
	// 　そいつを持って　早く　逃げるんだよ！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RUKIYA");
	ShowMsg_("DEMO_420_MSG_170");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(player, player_caution01_up_L, 5);			// 主人公　警戒（ルキヤを見る）L
	Wait_(60);
	SetMotion_(player, player_vix, BLEND_M);				// 主人公　悔しい感じ
	SetFace_(player, "Face_loop_close");
	Wait_(30);
	task_cam = Task_AnimeMoveCamera_("anmeye014", "anmtgt014");
	Wait_(70);

	SetMotion_(player, player_reactor_caution01_L, BLEND_M);// 主人公　リアクター付警戒L
	SetFace_(player, "Face_default");
	Wait_(50);

	SetMotion_(player, player_reactor_run, BLEND_L);		// 主人公　リアクター付走り
	task_player = Task_RotateToDir_(player, 165, 12);
	WaitTask(task_player);
	DeleteTask_(task_player);

	task_player = Task_AnimeMoveNoDirNoFit_(player, "anm_player002");
	Wait_(20);
	SetMotion_(player, player_reactor_stand, BLEND_N);		// 主人公　リアクター付待機
	DeleteTask_(task_cam);
	DeleteTask_(task_player);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット23　ルキヤ　呷り右斜め前方→ズームアウト
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	task_cam = Task_AnimeMoveCamera_("anmeye015", "anmtgt015");

	Wait_(30);
	SetFace_(rukiya, "bom_loop02");
	Wait_(20);
	SetFade_(FADE_OUT, FADE_COLOR_WHITE, 40);
	Wait_(45);
	DeleteTask_(task_cam);

	SetFace_(player, "Face_right");
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット24　ダークマスターとイッタブル　ダークマスター待機→警戒　左斜め前方
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	SetPointCameraEye_("cameye012");
	SetPointCameraTarget_("camtgt012");

	StartBlurEffect_();
	SetPointPosNoFit_(ittaburu, "npc_ittaburu003");
	SetMotion_(dark, MOT_WAIT, BLEND_N);					// ダークマスター　待機
	SetMotionSpeed_(dark, 0.1);
	SetMotionSpeed_(ittaburu, 0.1);
	Wait_(1);
	SetFade_(FADE_IN, FADE_COLOR_WHITE, 1);
	SetMotion_(dark, dark_surprise_L, 64);					// ダークマスター　驚きL
	Wait_(19);
	SetFade_(FADE_OUT, FADE_COLOR_WHITE, 35);
	Wait_(45);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット25　主人公　振り向き→走り　左斜め後方
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	SetPointCameraEye_("cameye013");
	SetPointCameraTarget_("camtgt013");
	
//	DetachObject_(player);//いったんリアクター外す(付けた状態を見るときはここをCO)
	SetPointPos_(player, "player005");
	SetMotion_(player, player_reactor_caution_turn_L, BLEND_N);// 主人公　リアクター付警戒（振り向き→走り）
	SetMotionSpeed_(player, 0.2);
	
	Wait_(1);
	SetFade_(FADE_IN, FADE_COLOR_WHITE, 1);
	SetStepSe_(player, SILENT_STEP_SE);
	Wait_(30);
	SetMotionSpeed_(player, 0.1);
//	SetMotion_(player, player_reactor_run, 32);				// 主人公　リアクター付走り
	task_player = Task_MoveForward_(player, 0.5, false);
	Wait_(50);
	SetFade_(FADE_OUT, FADE_COLOR_WHITE, 40);
	Wait_(40);
	SetMotion_(player, player_reactor_stand, BLEND_N);		// 主人公　リアクター付待機
	Wait_(10);
	DeleteTask_(task_player);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット26　ルキヤ　下向き待機→上向き待機→目をつぶる　俯瞰右斜め前方
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	SetPointCameraEye_("cameye014");
	SetPointCameraTarget_("camtgt014");

	SetMotion_(rukiya, MOT_WAIT, BLEND_N);					// ルキヤ　下向き待機L
	SetMotionSpeed_(rukiya, 0.2);
	SetStepSe_(rukiya, SILENT_STEP_SE);
	Wait_(1);
	SetFade_(FADE_IN, FADE_COLOR_WHITE, 1);
	Wait_(15);
	SetMotion_(rukiya, rukiya_look_up_L, 32);				// ルキヤ　上向き待機L
	Wait_(35);

	//===============================================
	// ■ルキヤ
	// 「それで　いい……。
	// 　マザーのこと　あんたに　まかせたよ……。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RUKIYA");
	ShowMsg_("DEMO_420_MSG_180");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	SetFade_(FADE_OUT, FADE_COLOR_WHITE, 80);
	SetFace_(rukiya, "Face_loop_close");
	StopBgm_(80);
	Wait_(80);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット27　装置　大爆発
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	task_cam = Task_AnimeMoveCamera_("anmeye016", "anmtgt016");
	PlaySE_("SE_DEM_094");

	Wait_(1);
	SetFade_(FADE_IN, FADE_COLOR_WHITE, 1);

	Wait_(5);
	PlaySE_("SE_SKL_021");									// 爆発音
	Wait_(15);
	SetFade_(FADE_OUT, FADE_COLOR_WHITE, 60);
	efc_explosion = SetPointWorldEffect_("ef842_03_explosion_brkmcn01", "efc_explosion000");// ブレイク化装置の爆発
	StartEarthQuake_(30, 3, 12);
	Wait_(60);
	
	EndBlurEffect_();

	EndDemo(FADE_COLOR_WHITE);
}
