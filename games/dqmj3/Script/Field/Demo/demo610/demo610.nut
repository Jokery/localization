//=============================================
//
//		demo610[ダークマスターの最期]
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
	local task_cam, task_rena, task_dark, task_kasya, task_apa, task_fade, task_darkSe00, task_darkSe01;
	local efc_dark, efc_dark2, efc_kasya, efc_apa;

// ▼フラグ設定
//	local bit_ruler = GetEventFlg_("BFG_RULER_ADD_025");			// Bit_225 ルーラ追加フラグ

// ▼リソース読込
	// ギミック
	local model_core000 = ReadGimmick_("o_C03_02");	// マザー
	local model_core100 = ReadGimmick_("o_C03_03");	// マザー飾り
//	local model_ruler = ReadGimmick_("o_com_08");	// ルーラポイント
	// キャラクター
	local player = GetPlayerId_();					// 主人公
	local model_rena = ReadNpc_("n007");			// レナーテ
	local model_dark = ReadNpc_("n008");			// ダークマスター
	local model_kasya = ReadNpc_("m200_00");		// カシャロット
	local model_apa = ReadNpc_("m201_00");			// アパデマク
	// エフェクト
	LoadEffect_("ef861_01_dm_die01");				// ダークマスター消滅
	LoadEffect_("ef861_02_dm_die02");				// ダークマスター消滅
	LoadEffect_("ef741_01_div_nor_death");
	LoadEffect_("ef721_03_nat_smoke_n03");

// ▼配置
	// マザー
	local core000 = ArrangePointGimmick_("o_C03_02", model_core000, "obj_core000");
	local core100 = ArrangePointGimmick_("o_C03_03", model_core100, "obj_core000");
	// ルーラポイント
//	local ruler = ArrangePointGimmick_("o_com_08", model_ruler, "obj_ruler000");
	// ▽ルーラポイントが既に起動していた場合
//	if (bit_ruler) { SetMotion_(ruler, MOT_GIMMICK_2, BLEND_N); }
	
	// 主人公
	SetPointPos_(player, "player000");
	// レナーテ
	local rena = ArrangePointNpc_(model_rena, "npc_rena000");
	// ダークマスター
	local dark = ArrangePointNpc_(model_dark, "npc_dark000");
	SetManualCalcAlpha_(dark, true);
	// カシャロット
	local kasya = ArrangePointNpc_(model_kasya, "npc_kasya000");
	SetScaleSilhouette(kasya, 0.75, 1.0);
	SetManualCalcAlpha_(kasya, true);
	// アパデマク
	local apa = ArrangePointNpc_(model_apa, "npc_apa000");
	SetScaleSilhouette(apa, 0.95, 1.0);
	SetManualCalcAlpha_(apa, true);

// ▼非常駐モーション読込
	local player_caution01_L = ReadMotion_(player, "Player_caution01_L");	// 警戒L
	local rena_caution_L = ReadMotion_(rena, "n007_caution_L");				// 警戒L
	local rena_talk01 = ReadMotion_(rena, "n007_talk01");					// 会話開始（手を胸にあてる）
	local rena_talk01_L = ReadMotion_(rena, "n007_talk01_L");				// 会話L（手を胸にあてる）
	local rena_look_down_L = ReadMotion_(rena, "n007_look_down_L");			// うつむき待機L

	local dark_damage = ReadMotion_(dark, "n008_damage");					// 待機→片膝
	local dark_damage_L = ReadMotion_(dark, "n008_damage_L");				// 片膝L
	local dark_stagger = ReadMotion_(dark, "n008_stagger");					// 片膝→よろよろ
	local dark_stagger_L = ReadMotion_(dark, "n008_stagger_L");				// よろよろと前進するL
	local dark_annihilation = ReadMotion_(dark, "n008_annihilation");		// よろよろと前進しながら前に手を伸ばす
	local dark_annihilation_L = ReadMotion_(dark, "n008_annihilation_L");	// よろよろと前進しながら前に手を伸ばすL
	local dark_totter_L = ReadMotion_(dark, "n008_totter_L");				// よろよろL

	local kasya_die = ReadMotion_(kasya, "m200_00_die");					// 待機→死亡

	local apa_die = ReadMotion_(apa, "m201_00_die");						// 待機→死亡

// ▼初期モーション
	SetMotion_(player, player_caution01_L, BLEND_N);
	SetMotion_(rena, rena_caution_L, BLEND_N);
	SetMotion_(dark, dark_damage, BLEND_N);
	SetMotionSpeed_(dark, 0.9);
	SetMotion_(kasya, kasya_die, BLEND_N);
	SetMotionSpeed_(kasya, 1.25);
	SetMotion_(apa, apa_die, BLEND_N);
	SetMotionSpeed_(apa, 0.75);

// ▼カメラ設定
	task_cam = Task_AnimeMoveCamera_("anmeye006", "anmtgt006");	// 180F


//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	task_dark = Task_ChangeMotion_(dark, dark_damage_L, BLEND_M);
	efc_dark = SetSelectBoneEffectSetOffset_("ef861_01_dm_die01", dark, ATTACH_GLOBAL, Vec3(0.0, -1.5, -3.0));
	SetEffectScale_(efc_dark, 1.2);
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	Wait_(10);
	PlaySE_("SE_DEM_146");
	Wait_(20);
	SetMotionSpeed_(dark, 1.0);
	SetMotionSpeed_(kasya, 0.65);
	SetMotionSpeed_(apa, 0.92);
	Wait_(83);
	efc_apa = SetSelectBoneEffectSetOffset_("ef721_03_nat_smoke_n03", apa, ATTACH_GLOBAL, Vec3(0.0, -6.0, 0.0));
	Wait_(12);
	StartDecayEarthQuake_(21, 3, 2)
	efc_kasya = SetSelectBoneEffectSetOffset_("ef721_03_nat_smoke_n03", kasya, ATTACH_GLOBAL, Vec3(0.0, -3.0, 10.0));
	SetEffectScale_(efc_kasya, 1.65);
	Wait_(55);
	DeleteTask_(task_cam);
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");	// 80F
	WaitTask(task_cam);
	Wait_(10);

	//===============================================
	// ■ダークマスター
	// 「なぜだ……なぜ勝てぬ！？
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_DARKMASTER");
	ShowMsg_("DEMO_609_MSG_010");
	KeyInputWait_();
	//===============================================
	// ■ダークマスター
	// 「私は　モンスターバトルＧＰ　最後の覇者である
	//-----------------------------------------------
	ShowMsg_("DEMO_609_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(15);
	DeleteTask_(task_dark);
	DeleteEffect_(efc_kasya);
	DeleteEffect_(efc_apa);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット2
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");	// 60F

	DeleteTask_(task_cam);
	SetPointPos_(dark, "npc_dark002");

	//===============================================
	// ■ダークマスター
	// 「その私が　アンセスの弟でしかない
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_DARKMASTER");
	ShowMsg_("DEMO_609_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(5);
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");	// 60F
	SetMotion_(rena, rena_talk01, 12);
	WaitMotion(rena);
	SetMotion_(rena, rena_talk01_L, BLEND_M);

	//===============================================
	// ■レナーテ
	// 「人間は　成長するわ……たしかに　かつて
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_609_MSG_040");
	KeyInputWait_();
	//===============================================
	// ■レナーテ
	// 「でも　積み重ねてきた　戦いの経験によって
	//-----------------------------------------------
	ShowMsg_("DEMO_609_MSG_050");
	KeyInputWait_();
	WaitTask(task_cam);
	CloseMsgWnd_();
	//===============================================

	Wait_(15);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット3
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

	//===============================================
	// ■レナーテ
	// 「人間だけが持つ　無限の可能性を
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_609_MSG_060");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(rena, MOT_WAIT, 18);
	Wait_(30);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット4
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");	// 120F

	DeleteTask_(task_cam);
	Wait_(5);

	//===============================================
	// ■ダークマスター
	// 「認めん！　認めんぞ　そんなことは！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_DARKMASTER");
	ShowMsg_("DEMO_609_MSG_070");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(dark, dark_stagger, BLEND_L);
	WaitMotion(dark);
	SetMotion_(dark, dark_stagger_L, BLEND_M);

	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");	// 120F

	task_dark = Task_AnimeMove_(dark, "anm_dark000");	// 150F
	Wait_(17);
	PlaySE_("SE_FLD_016");// 足音
	task_darkSe00 = Task_PlaySe_("SE_FLD_016", 40)// 足音
	Wait_(10);
	PlaySE_("SE_FLD_016");// 足音
	task_darkSe01 = Task_PlaySe_("SE_FLD_016", 40)// 足音

	//===============================================				//オートメッセージ
	// ■ダークマスター
	// 「もう一度だ！　もう一度　戦えば
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_DARKMASTER");
	ShowMsg_("DEMO_609_MSG_080");
	Wait_(80);														//計80wait
	CloseMsgWnd_();
	//===============================================

	WaitTask(task_cam);
	WaitTask(task_dark);
	DeleteTask_(task_cam);
	DeleteTask_(task_dark);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット5
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");	// 100F
	task_dark = Task_AnimeMove_(dark, "anm_dark001");	// 110F

	WaitTask(task_cam);
	PlaySE_("SE_FLD_016");// 足音

	WaitTask(task_dark);
	PlaySE_("SE_FLD_016");// 足音
	DeleteTask_(task_cam);
	DeleteTask_(task_dark);
	DeleteTask_(task_darkSe00);
	DeleteTask_(task_darkSe01);
	
	SetMotion_(dark, dark_totter_L, BLEND_L);
	Wait_(15);
	SetMotion_(dark, dark_annihilation, BLEND_L);
	task_dark = Task_ChangeMotion_(dark, dark_annihilation_L, BLEND_M);
	Wait_(20);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット6
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");	// 120F

	DeleteTask_(task_cam);
	SetPointPos_(dark, "npc_dark003");
	SetActive_(player, false);
	SetActive_(rena, false);
	SetActive_(kasya, false);
	SetActive_(apa, false);
	Wait_(10);

	//===============================================
	// ■ダークマスター
	// 「は……はおおお……！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_DARKMASTER");
	ShowMsg_("DEMO_609_MSG_090");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");	// 120F

	Wait_(15);
	StopBgm_(BGM_STOP_DEF);
	PlaySE_("SE_DEM_147");
	StopBgm_(180);
	efc_dark2 = SetSelectBoneEffectSetOffset_("ef861_02_dm_die02", dark, ATTACH_GLOBAL, Vec3(2.0, -3.0, 1.5));
	SetEffectScale_(efc_dark2, 1.3);
	DeleteEffectEmitter_(efc_dark);
	Wait_(20);
	task_fade = Task_ObjectFadeOut_(dark, 60);
	Wait_(40);
	WaitTask(task_cam);
	Wait_(150);
	DeleteTask_(task_dark);
	DeleteEffect_(efc_dark2);
	SetActive_(player, true);
	SetActive_(rena, true);
	SetActive_(kasya, true);
	SetActive_(apa, true);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット7
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");

	SetPointPos_(kasya, "npc_kasya001");
	SetPointPos_(apa, "npc_apa001");
	Wait_(40);
	efc_kasya = SetSelectBoneEffectSetOffset_("ef741_01_div_nor_death", kasya, ATTACH_GLOBAL, Vec3(0.0, 0.0, 0.0));
	SetEffectScale_(efc_kasya, 2.1);
	efc_apa = SetSelectBoneEffectSetOffset_("ef741_01_div_nor_death", apa, ATTACH_GLOBAL, Vec3(0.0, 0.0, 0.0));
	SetEffectScale_(efc_apa, 1.7);
	PlaySE_("SE_DEM_010");
	task_kasya = Task_ObjectFadeOut_(kasya, 20);
	task_apa = Task_ObjectFadeOut_(apa, 20);
	Wait_(75);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット8
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	task_cam = Task_AnimeMoveCamera_("anmeye005", "anmtgt005");	// 90F

	DeleteTask_(task_cam);
	SetPointPos_(player, "player002");
	SetMotion_(rena, rena_look_down_L, BLEND_N);
	Wait_(15);
	SetMotion_(rena, MOT_WAIT, 18);

	task_cam = Task_AnimeMoveCamera_("anmeye005", "anmtgt005");	// 90F

	//===============================================
	// ■レナーテ
	// 「あなたに……もう一度はない。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_609_MSG_100");
	KeyInputWait_();
	WaitTask(task_cam);
	CloseMsgWnd_();
	//===============================================

	Wait_(25);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット9
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	task_cam = Task_AnimeMoveCamera_("anmeye007", "anmtgt007");	// 125F

	SetPointPos_(player, "player000");
	Wait_(20);

	//===============================================
	// ■レナーテ
	// 「マザーのところに　行きましょう。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_609_MSG_110");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	WaitTask(task_cam);
	Wait_(20);

	EndDemo(FADE_COLOR_BLACK);
}
