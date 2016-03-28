//=============================================
//
//		demo009[ノチョリンとの出会い_1(仲間前)]
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
	local task_cam, task_player, task_mons, task_nocho, task_window;
	local efc_cam, efc_player, efc_bush, efc_nocho00, efc_mons;
	local flg_mons = GetNumFlg_("NUM_CHANGE_FIRST_MONSTER");		// Num12
	local anmeye007, anmeye008;
	local anmtgt007, anmtgt008;
	local anm_priz002;
	local motion_jump, motion_take;
	local mons_rot = Vec3(864.8573, 197.21187, -589.32306);
	local mons_scale = 0;			// スケール値
	local mons_outline = 0;			// アウトライン
	local mons_param = 0;			// パラメータＩＤ
	local mons_kind = 0;			// 種族ＩＤ
	local mons_res = 0;				// リソース名
	local mons_ride_size = 0;		// ライド時のサイズ
	local heart_scale = 5.0;		// デフォルト値だと小さいため
	local frame_sum = 0;
	
	// 初期仲間モンスター設定
	switch(flg_mons)
	{
	// 「プリズニャン」
	case PURIZUNYAN:		// Num12 = 0
		mons_scale = SCALE.PURIZUNYAN;
		mons_outline = SILHOUETTE_WIDTH.PURIZUNYAN;
		mons_param = 1203;
		mons_kind = 128;
		mons_res = "m040_00";
		mons_ride_size = SIZE_S;
		anm_priz002 = "anm_priz002_0";
		anmeye007 = "anmeye007_0";
		anmtgt007 = "anmtgt007_0";
		anmeye008 = "anmeye008_0";
		anmtgt008 = "anmtgt008_0";
		break;
	// 「フォンデュ」
	case FONDHU:			// Num12 = 1
		mons_scale = SCALE.FONDHU;
		mons_outline = SILHOUETTE_WIDTH.FONDHU;
		mons_param = 1202;
		mons_kind = 392;
		mons_res = "m125_00";
		mons_ride_size = SIZE_M;
		anm_priz002 = "anm_priz002_1";
		anmeye007 = "anmeye007_1";
		anmtgt007 = "anmtgt007_1";
		anmeye008 = "anmeye008_1";
		anmtgt008 = "anmtgt008_1";
		break;
	// 「ドラキー」
	case DORAKI:			// Num12 = 2
		mons_scale = SCALE.DORAKI;
		mons_outline = SILHOUETTE_WIDTH.DORAKI;
		mons_param = 1201;
		mons_kind = 160;
		mons_res = "m052_00";
		mons_ride_size = SIZE_M;
		anm_priz002 = "anm_priz002_2";
		anmeye007 = "anmeye007_2";
		anmtgt007 = "anmtgt007_2";
		anmeye008 = "anmeye008_2";
		anmtgt008 = "anmtgt008_2";
		break;
	// 「ナスビナーラ」
	case NASUBINARA:		// Num12 = 3
		mons_scale = SCALE.NASUBINARA;
		mons_outline = SILHOUETTE_WIDTH.NASUBINARA;
		mons_param = 1204;
		mons_kind = 214;
		mons_res = "m069_00";
		mons_ride_size = SIZE_S;
		anm_priz002 = "anm_priz002_3";
		anmeye007 = "anmeye007_3";
		anmtgt007 = "anmtgt007_3";
		anmeye008 = "anmeye008_3";
		anmtgt008 = "anmtgt008_3";
		break;
	default :
		DebugPrint("[Update] WARNING : フラグID (" + flg_mons + ") が不正です");
	}
	
// ▼モデル読込
	// ギミック
	local model_bush = ReadGimmick_("o_dem_02");	// 茂み
	// キャラクター
	local player = GetPlayerId_();					// 主人公
	local model_n_man = ReadNpc_("n043");			// ノチョリン
	local model_mons = ReadNpc_(mons_res);			// 初期モンスター
	// エフェクト
	LoadEffect_("ef712_10_emo_surprise01");			// 「！」
	LoadEffect_("ef712_18_emo_heart01");			// ハート01
	LoadEffect_("ef712_01_emo_notice01");			// 気づき
	LoadEffect_("ef712_13_emo_sweat01");			// 汗
	LoadEffect_("ef800_01_leaf_n");					// 葉っぱ(ガサゴソ)
	LoadEffect_("ef800_02_leaf_s");					// 葉っぱ(ノチョーラ出現時)
	LoadEffect_("ef800_03_grass");					// 葉っぱ(地面)
	LoadEffect_("ef733_01_sym_shuchusen01");		// 集中線(音無)

// ▼配置
	// 茂み
	local bush00 = ArrangePointGimmick_("o_dem_02", model_bush, "obj_bush000");
	
	// 主人公
	SetPointPos_(player, "player000");
	SetFace_(player, "Face_surprised");
	// ノチョーラ
	local nocho00 = ArrangePointNpc_(model_n_man, "npc_nocho000");
	SetAlpha_(nocho00, ALPHA_CLEAR);
	// 初期モンスター
	local mons = ArrangePointNpc_(model_mons, "npc_nocho000");
	SetScaleSilhouette(mons, mons_scale, mons_outline);
	SetAlpha_(mons, ALPHA_CLEAR);

// ▼非常駐モーション読込
	// 主人公
	local pl_surprise = ReadMotion_(player, "Player_surprise");			// 驚く
	local pl_zusa01 = ReadMotion_(player, "Player_zusa01");				// ズサー（早い）
	local pl_up01 = ReadMotion_(player, "Player_up01");					// 倒れ→上半身を起こす
	local pl_up01_L = ReadMotion_(player, "Player_up01_L");				// 上半身を起こすL
	local pl_one_knee = ReadMotion_(player, "Player_one_knee");			// 上半身を起こす→立膝
	local pl_sit_guard = ReadMotion_(player, "Player_sit_guard");		// 立膝→立膝ガード
	local pl_sit_guard_L = ReadMotion_(player, "Player_sit_guard_L");	// 立膝ガードL
	local pl_one_knee01 = ReadMotion_(player, "Player_one_knee01");		// 立膝ガード→立膝（顔左向き）
	local pl_one_knee01_L = ReadMotion_(player, "Player_one_knee01_L");	// 立膝（顔左向き）L
	local pl_look_left_L = ReadMotion_(player, "Player_look_left_L");	// 顔を少し左向けるL
	
	// ノチョーラ
	local nch_surprise = ReadMotion_(nocho00, "n000_surprise");			// 通常待機→驚く
	local nch_surprise_L = ReadMotion_(nocho00, "n000_surprise_L");		// 驚くL
	local nch_think02 = ReadMotion_(nocho00, "n000_think02");			// 驚く→考える（腕組み）
	local nch_think02_L = ReadMotion_(nocho00, "n000_think02_L");		// 考える（腕組み）L
	local nch_arm_folde = ReadMotion_(nocho00, "n000_arm_folde");		// 考える（腕組み）→腕組み
	local nch_arm_folde_L = ReadMotion_(nocho00, "n000_arm_folde_L");	// 腕組みL
	local nch_run_L = ReadMotion_(nocho00, "n001_run_L");				// 走るL
	local nch_feel_down = ReadMotion_(nocho00, "n000_feel_down");		// 通常会話→落ち込み
	local nch_feel_down_L = ReadMotion_(nocho00, "n000_feel_down_L");	// 落ち込みL
	local nch_roll = ReadMotion_(nocho00, "n000_roll");					// 転げる→起き上がる
	local nch_up_L = ReadMotion_(nocho00, "n000_up_L");					// 起き上がるL（座り）
	local nch_sit = ReadMotion_(nocho00, "n000_sit_surprise");			// 起き上がる（座り）→驚く（座り）
	local nch_sit_L = ReadMotion_(nocho00, "n000_sit_surprise_L");		// 驚く（座り）L
	local nch_impatience_L = ReadMotion_(nocho00, "n000_impatience_L");	// 焦りL
	local nch_right_L = ReadMotion_(nocho00, "n000_stand_right_L");		// 右向きL
	
// ▼モーション設定
	switch(flg_mons)
	{
	// 「プリズニャン」
	case PURIZUNYAN:		// Num12 = 0
		motion_jump = ReadMotion_(mons, "m040_00_jump");				// 飛び出す
		motion_take = MOT_LIFE_SPECIAL_1;								// なつくL
		break;
	// 「フォンデュ」
	case FONDHU:			// Num12 = 1
		motion_jump = ReadMotion_(mons, "m125_00_jump");				// 飛び出す
		motion_take = ReadMotion_(mons, "m125_00_take_L");				// なつくL
		break;
	// 「ドラキー」
	case DORAKI:			// Num12 = 2
		motion_jump = MOT_RUN;											// 飛び出す
		motion_take = ReadMotion_(mons, "m052_00_take_L");				// なつくL
		break;
	// 「ナスビーラ」
	case NASUBINARA:		// Num12 = 3
		motion_jump = ReadMotion_(mons, "m069_00_jump");				// 飛び出す
		motion_take = ReadMotion_(mons, "m069_00_take_L");				// なつくL
		break;
	default :
		DebugPrint("[Update] WARNING : フラグID (" + flg_mons + ") が不正です");
	}

// ▼カメラ設定
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	// ▼カット１＠ノチョーラの悲鳴～～～～～～～～～～～～～～
	SetMotion_(bush00, MOT_GIMMICK_1, BLEND_M);						// ガサゴソON
	SetPointWorldEffect_("ef800_01_leaf_n", "obj_bush000");
	PlaySE_("SE_DEM_002");											// ■：SE「ガサガサ…」
	Wait_(15);
	
	SurpriseDisp(player);
	
	Wait_(30);
	
	// 次のカットの準備・・
	SetMotion_(player, MOT_WALK, BLEND_M);
	SetMotionSpeed_(player, 0.7);
	// ・・・・・・・・・・
	
	// ▼カット２＠茂みに近づく～～～～～～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");		// 120F
	
	task_player = Task_AnimeMove_(player, "anm_player000");			// 120F
	WaitTask(task_player);
	
	// ・・・・・・・・・・
	DeleteTask_(task_player);
	SetMotion_(player, MOT_WAIT, BLEND_S);
	SetAlpha_(player, ALPHA_CLEAR);
	SetPointPos_(player, "player002");
	
	DeleteTask_(task_cam);
	SetMotion_(bush00, MOT_GIMMICK_0, BLEND_M);							// ガサゴソOFF
	// ・・・・・・・・・・
	
	// ×カット３＠廃止
	
	// ▼カット４＠茂みズーム～～～～～～～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye001_2", "anmtgt001_2");		// 120F
	SetMotionSpeed_(player, 1.0);
	
	uMoveBush(bush00, 10);
	uMoveBush(bush00, 20);
	uMoveBush(bush00, 35);
	
	WaitTask(task_cam);
	
	//===============================================
	// *ノチョーラ
	// 「どいてちょー！　あぶないちょー！
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_009_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	// ・・・・・・・・・・
	DeleteTask_(task_cam);
	SetMotion_(bush00, MOT_GIMMICK_0, BLEND_M);								// ガサゴソOFF
	// ・・・・・・・・・・
	
	// ▼カット５＠ノチョーラ飛び出し～～～～～～～～～～～～～
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", CAMERA_DEF);			// 集中線
	efc_nocho00 = SetSelectBoneEffect_("ef712_13_emo_sweat01", nocho00, ATTACH_EFFECT1);		// 汗
	
	RideOn_(nocho00, mons, mons_kind, mons_ride_size);
	SetMotion_(mons, motion_jump, BLEND_M);
	task_mons = Task_AnimeMove_(mons, "anm_nocho000");		// 45F
	SetAlpha_(nocho00, ALPHA_EXIST);
	SetAlpha_(mons, ALPHA_EXIST);
	
	SetMotion_(bush00, MOT_GIMMICK_1, BLEND_M);				// ガサゴソON
	SetPointWorldEffect_("ef800_01_leaf_s", "obj_bush000");
	PlaySE_("SE_DEM_003");									// ■：SE「ガサッ！」
	Wait_(17);
	
	// ・・・・・・・・・・
	SetMotion_(bush00, MOT_GIMMICK_0, BLEND_M);				// ガサゴソOFF
	DeleteTask_(task_mons);
	task_mons = Task_AnimeMove_(mons, "anm_nocho001");		// 5F
	SetMotion_(mons, MOT_WAIT, BLEND_N);
	SetMotion_(mons, motion_jump, BLEND_N);					// ジャンプモーション再生し直し
	
	SetAlpha_(player, ALPHA_EXIST);
	SetMotion_(player, pl_surprise, BLEND_M);				// 驚く
	SetFace_(player, "Face_surprised");
	// ・・・・・・・・・・
	
	// カット切り替え～～～～～～～～～～
	SetPointCameraEye_("cameye005_2");
	SetPointCameraTarget_("camtgt005_2");
	Wait_(10);
	
	// ・・・・・・・・・・
	SetFace_(player, "Face_eyes_close");
	DeleteTask_(task_mons);
	RideOff_(nocho00, mons);
	SetAlpha_(mons, ALPHA_CLEAR);
	SetMotion_(mons, MOT_WAIT, BLEND_N);
	SetAlpha_(nocho00, ALPHA_CLEAR);
	SetPointPos_(nocho00, "npc_nocho001");
	DeleteEffect_(efc_nocho00);
	// ・・・・・・・・・・
	
	// ▼カット６＠驚く主人公ズームイン～～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");		// 5F
	
	//-----
	SetFade_(FADE_OUT, FADE_COLOR_WHITE, 8);
	WaitFade_();
	
	DeleteTask_(task_cam);
	DeleteEffect_(efc_cam);
	
	PlaySE_("SE_DEM_004");								// ■：SE「ドシンッ！」
	Wait_(30);
	
	// ・・・・・・・・・・
	SetMotion_(nocho00, nch_feel_down_L, BLEND_S);
	SetAlpha_(nocho00, ALPHA_EXIST);
	
	SetPointPos_(player, "player003");
	SetMotion_(player, pl_zusa01, BLEND_M);				// ズサー（早い）
	efc_player = SetSelectBoneEffect_("ef800_03_grass", player, ATTACH_GLOBAL);
	// ・・・・・・・・・・
	
	// ▼カット７－０＠主人公ズサー～～～～～～～～～～～～～～
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	PlaySE_("SE_DEM_008");								// ■：SE主人公ぶつかってこける
	
	SetFade_(FADE_IN, FADE_COLOR_WHITE, FADE_DEF);
	WaitFade_();
	//-----
	
	WaitMotion(player);
	
	// ・・・・・・・・・・
	SetMotion_(nocho00, nch_roll, BLEND_N);		// 転げる→起き上がる
	// ・・・・・・・・・・
	
	// ▼カット７－１＠ノチョーラこけてる～～～～～～～～～～～
	SetPointCameraEye_("cameye007");
	SetPointCameraTarget_("camtgt007");
	PlaySE_("SE_DEM_009");								// ■：SEノチョぶつかってこける
	
	Wait_(15);
	efc_nocho00 = SetSelectBoneEffect_("ef800_03_grass", nocho00, ATTACH_GLOBAL);
	WaitMotion(nocho00);
	SetMotion_(nocho00, nch_up_L, BLEND_M);		// 起き上がるL（座り）
	
	//===============================================
	// *ノチョーラ
	// 「あいたた……ひどい目に　あったちょ。
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_009_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(nocho00, nch_sit, BLEND_M);		// 起き上がる（座り）→驚く（座り）
	local efc = SurpriseDispSetOffset(nocho00, Vec3(3, -2.0, -5), 0.6);
	WaitMotion(nocho00);
	SetMotion_(nocho00, nch_sit_L, BLEND_M);	// 驚く（座り）L
	Wait_(15);
	
	// ・・・・・・・・・・
	SetDir_(player, 10);
	SetMotion_(player, pl_up01, BLEND_N);							// 倒れ→上半身を起こす
	task_player = Task_ChangeMotion_(player, pl_up01_L, BLEND_M);	// 上半身を起こすLOOP
	SetPointPos_(nocho00, "npc_nocho004");
	task_nocho = Task_AnimeMove_(nocho00, "anm_nocho004");			// 15F
	efc_nocho00 = SetSelectBoneEffect_("ef712_13_emo_sweat01", nocho00, ATTACH_EFFECT1);		// 汗
	SetMotion_(nocho00, nch_run_L, BLEND_N);						// 走るLOOP
	// ・・・・・・・・・・
	
	// ▼カット７－２＠ノチョーラカメライン～～～～～～～～～～
	SetPointCameraEye_("cameye003");
	SetPointCameraTarget_("camtgt003");
	
	WaitTask(task_nocho);
	DeleteTask_(task_nocho);
	SetMotion_(nocho00, nch_impatience_L, BLEND_L);
	
	//===============================================
	// *ノチョーラ
	// 「いやはや　悪かったっちょ。
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_009_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	// ・・・・・・・・・・
	DeleteTask_(task_player);
	SetAlpha_(player, ALPHA_CLEAR);
	SetMotion_(nocho00, MOT_WAIT, BLEND_N);
	DeleteEffect_(efc_nocho00);
	SetPointPos_(mons, "npc_priz004");
	SetAlpha_(mons, ALPHA_EXIST);
	// ・・・・・・・・・・
	
	// ▼カット７－３＠ノチョーラＰＡＮ＿ＵＰ～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_(anmeye008, anmtgt008);		// 120F
	WaitTask(task_cam);
	MotionTalk(nocho00);
	
	//===============================================
	// *ノチョーラ
	// 「オイラは　ノチョーラ族のものだちょ。
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_009_MSG_040");
	KeyInputWait_();
	
	SetMotion_(nocho00, nch_right_L, BLEND_L);					// 右向きLOOP
	
	//-----------------------------------------------
	// ▽
	// 「そして　ここにいるのは野良モンスターの
	//-----------------------------------------------
	SetExchangeMonsterKindName_(mons_kind);		// モンスター種族名に置換
	ShowMsg_("DEMO_009_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(mons, MOT_RUN, BLEND_M);
	task_mons = Task_MoveForward_(mons, 2.0, false);
	
	Wait_(10);
	SetMotion_(nocho00, MOT_WAIT, BLEND_M);
	Wait_(4);
	efc_nocho00 = SetSelectBoneEffect_("ef712_01_emo_notice01", nocho00, ATTACH_EFFECT1);	// 気づき
	SetMotion_(nocho00, nch_surprise, BLEND_M);												// 驚く
	WaitMotion(nocho00);
	
	// ・・・・・・・・・・
	SetMotion_(nocho00, MOT_WAIT, BLEND_N);
	SetAlpha_(nocho00, ALPHA_CLEAR);
	DeleteTask_(task_mons);
	SetPointPos_(mons, "npc_priz005");
	SetMotion_(mons, MOT_RUN, BLEND_N);
	// ・・・・・・・・・・
	
	// ▼カット７－４＠モンスター攻撃直前～～～～～～～～～
	SetPointCameraEye_("cameye009");
	SetPointCameraTarget_("camtgt009");
	
	//===============================================
	// *ノチョーラ
	// 「「あっ！　こら　お前っ！
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_009_MSG_060");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	// ・・・・・・・・・・
	DeleteTask_(task_mons);
	DeleteTask_(task_nocho);
	PlaySE_("SE_DEM_011");								// ■：SEモンスターが迫る
	
	SetPointPos_(nocho00, "npc_nocho003");
	SetAlpha_(nocho00, ALPHA_CLEAR);
	SetStepSe_(mons, SILENT_STEP_SE);
	SetMotion_(mons, MOT_ATTACK, BLEND_M);
	task_mons = Task_AnimeMove_(mons, "anm_priz001");		// 30F
	
	DeleteTask_(task_cam);
	// ・・・・・・・・・・
	
	// ▼カット９＠モンスター攻撃～～～～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");			// 30F
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", CAMERA_DEF);		// 集中線
	Wait_(25);
	
	// ・・・・・・・・・・
	DeleteTask_(task_cam);
	
	DeleteTask_(task_mons);
	SetAlpha_(mons, ALPHA_CLEAR);
	SetMotion_(mons, MOT_WAIT, BLEND_N);
	
	SetAlpha_(player, ALPHA_EXIST);
	SetDir_(player, 45);
	SetFace_(player, "Face_grimace");
	SetMotion_(player, pl_sit_guard, BLEND_M);		// 立膝→立膝ガード
	// ・・・・・・・・・・
	
	// ▼カット10＠主人公ズーム→モンスター懐く～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye005", "anmtgt005");		// 30F
	WaitTask(task_cam);
	DeleteEffect_(efc_cam);
	
	WaitMotion(player);
	SetMotion_(player, pl_sit_guard_L, BLEND_M);		// 立膝ガードLOOP
	Wait_(30);
	SetAlpha_(mons, ALPHA_EXIST);
	SetMotion_(mons, MOT_WALK, BLEND_M);
	task_mons = Task_AnimeMove_(mons, anm_priz002);		// 30F
	Wait_(30);
	DeleteTask_(task_cam);
	
	// ズームアウト～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye006", "anmtgt006");		// 150F
	
	SetFace_(player, "Face_surprised");
	SetMotion_(player, pl_one_knee01, BLEND_M);		// 立膝ガード→立膝（顔左向き）
	
	ResetStepSe_(mons);
	DeleteTask_(task_mons);
	task_mons = Task_RotateToPos_(mons, mons_rot, ROTATE_DEMO_DEF);
	
	SetMotion_(mons, motion_take, BLEND_L);				// 懐く
	efc_mons = SetSelectBoneEffect_("ef712_18_emo_heart01", mons, ATTACH_EFFECT2);	// ハート
	SetEffectScale_(efc_mons, heart_scale);
	PlaySE_("SE_DEM_005");		// 「ぼわわん…」
	
	WaitMotion(player);
	SetMotion_(player, pl_one_knee01_L, BLEND_M);		// 立膝（顔左向き）L
	WaitTask(task_cam);
	Wait_(30);
	
	// ・・・・・・・・・・
	SetFace_(player, "Face_eyes_close");
	SetMotion_(player, MOT_WAIT, BLEND_N);
	SetAlpha_(player, ALPHA_CLEAR);
	SetAlpha_(mons, ALPHA_CLEAR);
	SetAlpha_(nocho00, ALPHA_EXIST);
	DeleteTask_(task_mons);
	DeleteTask_(task_cam);
	// ・・・・・・・・・・
	
	// ▼カット11＠ノチョーラアップ～～～～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye011", "anmtgt011");		// 300F
	
	SetMotion_(nocho00, nch_surprise, BLEND_M);		// 通常待機→驚く
	efc_nocho00 = SetSelectBoneEffect_("ef712_01_emo_notice01", nocho00, ATTACH_EFFECT2);	// 気づき
	WaitMotion(nocho00);
	SetMotion_(nocho00, nch_surprise_L, BLEND_M);		// 驚くL
	
	//===============================================
	// *ノチョーラ
	// 「あれれ？　なんで　オイラが乗ってた
	//-----------------------------------------------
	SetExchangeMonsterKindName_(mons_kind);		// モンスター種族名に置換
	OpenMsgWnd_();
	ShowMsg_("DEMO_009_MSG_070");
	KeyInputWait_();
	
	SetMotion_(nocho00, nch_think02, BLEND_M);				// 驚く→考える（腕組み）
	WaitMotion(nocho00);
	SetMotion_(nocho00, nch_think02_L, BLEND_M);			// 考える（腕組み）LOOP
	
	//-----------------------------------------------
	// ▽
	// 「そういえば　ノチョーラ族のキングから
	//-----------------------------------------------
	ShowMsg_("DEMO_009_MSG_080");
	KeyInputWait_();
	
	SetMotion_(nocho00, nch_arm_folde, BLEND_M);			// 考える（腕組み）→腕組み
	WaitMotion(nocho00);
	SetMotion_(nocho00, nch_arm_folde_L, BLEND_M);			// 腕組みLOOP
	
	//-----------------------------------------------
	// ▽
	// 「魔物をしたがえる　チカラを持つ
	//-----------------------------------------------
	ShowMsg_("DEMO_009_MSG_090");
	KeyInputWait_();

	//-----------------------------------------------
	// まさか　お前が
	//-----------------------------------------------
	ShowMsg_("DEMO_009_MSG_100");
	KeyInputWait_();
	
	CloseMsgWnd_();
	//===============================================
	
	// ・・・・・・・・・・
	DeleteTask_(task_cam);
	DeleteEffect_(efc_mons);
	
	SetAlpha_(player, ALPHA_CLEAR);
	
	SetAlpha_(mons, ALPHA_EXIST);
	SetMotion_(mons, MOT_WAIT, BLEND_N);
	SetPointPos_(mons, "npc_priz001");
	// ・・・・・・・・・・
	
	// ▼カット15＠モンスターアップ～～～～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_(anmeye007, anmtgt007);
	WaitTask(task_cam);
	
	//===============================================
	// *ノチョーラ
	// 「お前のことを　気に入ったようだし　仲間にしたらどうかちょ？
	//-----------------------------------------------
	SetExchangeMonsterKindName_(mons_kind);		// モンスター種族名に置換
	OpenMsgWnd_();
	ShowMsg_("DEMO_009_MSG_110");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	//===============================================
	// ◇システムメッセージ
	// ○モンスター種族名○を　仲間にしますか？
	//-----------------------------------------------
	SetExchangeMonsterKindName_(mons_kind);		// モンスター種族名に置換
	OpenMsgWnd_();
	ShowMsg_("DEMO_009_MSG_120");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	while(true)
	{
		// 【はいの場合：１】
		if (GetQueryResult_() == QUERY2_0) {
			PlayMe_("ME_010");			// 重要アイテム入手
			
			//===============================================
			// ◇システムメッセージ
			// ○モンスター種族名○が　仲間になった！
			//-----------------------------------------------
			SetExchangeMonsterKindName_(mons_kind);		// モンスター種族名に置換
			OpenMsgWnd_();
			ShowMsg_("DEMO_009_MSG_140");
			WaitMe_();
			KeyInputWait_();
			CloseMsgWnd_();
			//===============================================
			
			break;
		}
		// 【いいえの場合：１】
		else {
			//===============================================
			// *ノチョーラ
			// 「まあまあ　そう言わずに。
			//-----------------------------------------------
			OpenMsgWnd_();
			ShowMsg_("DEMO_009_MSG_130");
			KeyInputWait_();
			CloseMsgWnd_();
			//===============================================
		}
	}
	
	EndDemo(FADE_COLOR_BLACK);
}


//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//		茂みモーション切り替え
//
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function uMoveBush(obj, frame)
{
	Wait_(15);
	SetMotion_(obj, MOT_GIMMICK_1, BLEND_M);		// ガサゴソON
	SetPointWorldEffect_("ef800_01_leaf_n", "obj_bush000");
	PlaySE_("SE_DEM_002");	// 「ガサガサ…」
	Wait_(frame);
	SetMotion_(obj, MOT_GIMMICK_0, BLEND_M);		// ガサゴソOFF
}
