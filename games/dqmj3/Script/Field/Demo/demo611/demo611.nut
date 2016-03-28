//=============================================
//
//		demo611[元凶のガルビルス]
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
	local task_cam, task_player, task_rena, task_antibody, task_grbrs, task_beto;
	local efc_cam, efc_player, efc_rena, efc_antibody0, efc_antibody1, efc_drain, efc_grbrs;
	local bone_efc0, bone_efc1, bone_efc2, bone_efc3, bone_efc4;

// ▼リソース読込
	// ギミック
	local model_mother = ReadGimmick_("o_C03_02");		// マザー
	local model_decoration = ReadGimmick_("o_C03_03");	// マザー飾り
	local model_ground = ReadGimmick_("o_dem_20");		// ガルビルス（地面べとべと）
	local model_base = ReadGimmick_("o_effect_base");	// エフェクトベース
	// キャラクター
	local player = GetPlayerId_();						// 主人公
	local model_rena = ReadNpc_("n007");				// レナーテ
	local model_grbrs = ReadNpc_("m184_00");			// ガルビルス
	local model_beto = ReadNpc_("n038");				// ガルビルス（べとべと）
	// エフェクト
	LoadEffect_("ef712_10_emo_surprise01");				// 「！」
	LoadEffect_("ef733_01_sym_shuchusen01");			// 集中線
	LoadEffect_("ef733_02_sym_black_mist01");			// 黒い靄
	LoadEffect_("ef732_17_antibody_m");					// M抗体の光
	LoadEffect_("ef861_03_m_draw");						// M抗体吸い込まれる
	LoadEffect_("ef861_04_m_vomit");					// M抗体はじき出される
	LoadEffect_("ef861_05_galvirus_appear01");			// 突出し
	LoadEffect_("ef861_06_galvirus_appear02");			// 出産
	LoadEffect_("ef861_07_galvirus_appear03");			// 口元
	LoadEffect_("ef861_08_galvirus_appear04");			// 滴り
	LoadEffect_("ef861_09_galvirus_appear05");			// 飛び散り
	LoadEffect_("ef861_16_galvirus_appear06");			// 滴り 口汁
	LoadEffect_("ef861_17_galvirus_appear07");			// 滴り 尻汁
	LoadEffect_("ef861_18_galvirus_appear08");			// 滴り 胸汁
	LoadEffect_("ef731_01_mag_light01");				// 白いキラキラ
	LoadEffect_("ef732_27_shock_wave01");				// 衝撃波
	LoadEffect_("ef732_13_light_reactor01");			// リアクターの光
	// レイアウト
	LoadLayout_("memories");

// ▼配置
	// マザー
	local mother = ArrangePointGimmick_("o_C03_02", model_mother, "obj_mothier000");
	// マザー飾り
	local decoration = ArrangePointGimmick_("o_C03_03", model_decoration, "obj_mothier000");
	// ガルビルス（地面べとべと）
	local ground = ArrangeGimmick_("o_dem_20", model_ground, "npc_grbrs000");
	SetScaleSilhouette(ground, SCALE.G, SILHOUETTE_WIDTH.G);
	SetMotion_(ground, MOT_GIMMICK_0, BLEND_N);
	// Ｍ抗体（エフェクトベース）
	local antibody = ArrangeGimmick_("o_effect_base", model_base, false);

	// 主人公
	SetPointPos_(player, "player000");
	// レナーテ
	local rena = ArrangePointNpc_(model_rena, "npc_rena001");
	// ガルビルス
	local grbrs = ArrangePointNpc_(model_grbrs, "npc_grbrs000");
	SetScaleSilhouette(grbrs, SCALE.G, SILHOUETTE_WIDTH.G);
	SetAlpha_(grbrs, ALPHA_CLEAR);
	AttachObject_(grbrs, ground, ATTACH_GLOBAL);
	// ガルビルス（べとべと）
	local beto = ArrangePointNpc_(model_beto, "npc_grbrs000");
	SetScaleSilhouette(beto, SCALE.G, SILHOUETTE_WIDTH.G);
	SetAlpha_(beto, 0.5);
	SetVisible(beto, false);

// ▼非常駐モーション読込
	// 主人公
	local player_caution01_L = ReadMotion_(player, "Player_caution01_L");	// 警戒L
	local player_guard = ReadMotion_(player, "Player_guard");				// 警戒→身構える
	local player_guard_L = ReadMotion_(player, "Player_guard_L");			// 身構えるL
	local player_guard_turn = ReadMotion_(player, "Player_guard_turn");		// 身構える→振り向く
	local player_guard_turn_L = ReadMotion_(player, "Player_guard_turn_L");	// 身構え振り向くL
	local player_run_battle = ReadMotion_(player, "Player_run_battle");		// 走り→戦闘待機
	local player_battle_L = ReadMotion_(player, "Player_battle_L");			// 戦闘待機L
	local player_battle01_L = ReadMotion_(player, "Player_battle01_L");		// 戦闘待機（顔上向き）L
	// レナーテ
	local rena_look_left_L = ReadMotion_(rena, "n007_look_left_L");			// 左を向くL
	local rena_show01 = ReadMotion_(rena, "n007_show01");					// 待機→手を胸の高さ位まで上げる
	local rena_show_L = ReadMotion_(rena, "n007_show_L");					// 手を胸の高さ位まで上げるL
	local rena_show02 = ReadMotion_(rena, "n007_show02");					// 手を胸の高さ位まで上げる→待機
	local rena_talk01 = ReadMotion_(rena, "n007_talk01");					// 会話
	local rena_talk01_L = ReadMotion_(rena, "n007_talk01_L");				// 会話L
	local rena_attack_start = ReadMotion_(rena, "n007_attack_start");		// 待機→攻撃開始
	local rena_attack_start_L = ReadMotion_(rena, "n007_attack_start_L");	// 攻撃開始L
	local rena_guard = ReadMotion_(rena, "n007_guard");						// 待機→ガード
	local rena_weaken = ReadMotion_(rena, "n007_weaken");					// 弾き飛ばされる→弱り
	local rena_weaken_L = ReadMotion_(rena, "n007_weaken_L");				// 弱りL
	local rena_show_send_L = ReadMotion_(rena, "n007_show_send_L");			// 手を胸の高さ位まで上げ前へ出すL
	// ガルビルス
	local grbrs_grow = ReadMotion_(grbrs, "m184_00_grow");					// マザーから出てくる
	local grbrs_grow_L = ReadMotion_(grbrs, "m184_00_grow_L");				// マザーから出てくるL
	local grbrs_born = ReadMotion_(grbrs, "m184_00_born");					// マザーから出てくる→待機
	local grbrs_shout = ReadMotion_(grbrs, "m184_00_shout");				// 待機→咆哮→待機
	// ガルビルス（べとべと）
	local beto_grow = ReadMotion_(beto, "n038_grow");						// マザーから出てくる
	local beto_grow_L = ReadMotion_(beto, "n038_grow_L");					// マザーから出てくるL
	local beto_born = ReadMotion_(beto, "n038_born");						// マザーから出てくる→待機
	local beto_shout = ReadMotion_(beto, "n038_shout");						// 待機→咆哮→待機
	local beto_m_attack = ReadMotion_(beto, "n038_m_attack");				// 魔法攻撃

// ▼カメラ設定
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");				// 225F


//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	StartDemoNoFade(FADE_COLOR_BLACK);

	// ▼カット１＠マザーズームアウト～～～～～～～～～～～～～
	Wait_(100);
	// 地震１回目 100F-120F
	PlayLoopSE_("SE_DEM_148");
	Wait_(10);
	StopLoopSE_(10);
	Wait_(40);

	// 地震２回目 150F-170F
	PlayLoopSE_("SE_DEM_148");
	Wait_(10);
	StopLoopSE_(10);
	Wait_(40);

	// 地震３回目 200F-220F
	PlayLoopSE_("SE_DEM_148");
	Wait_(10);
	StopLoopSE_(10);

	WaitTask(task_cam);
	Wait_(30);


	// ▼カット２＠レナーテと主人公～～～～～～～～～～～～～～
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

	SetMotion_(rena, rena_look_left_L, BLEND_XL);		// 左を向くL
	Wait_(5);
	SetFace_(rena, "Face_left");
	Wait_(10);
	//===============================================
	// ■レナーテ
	// 「ありがとう……　<name_player/>。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_611_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetAlpha_(player, ALPHA_CLEAR);


	// ▼カット３＠レナーテＵＰ～～～～～～～～～～～～～～～～
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");

	SetMotion_(rena, MOT_WAIT, BLEND_XL);
	SetFace_(rena, "Face_eyes_close");
	Wait_(15);

	//===============================================
	// ■レナーテ
	// 「ここから先は　私の役割。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_611_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(rena, rena_show01, BLEND_L);		// 手を胸の高さ位まで上げる
	WaitMotion(rena);
	Wait_(2);
	SetMotion_(rena, rena_show_L, BLEND_M);
	PlaySE_("SE_DEM_142");											//虹の光用SE
	SetPointPosNoFit_(antibody, "obj_antibody000");
	efc_antibody0 = SetSelectBoneEffect_("ef732_17_antibody_m", antibody, ATTACH_GLOBAL);

	//===============================================
	// ■レナーテ
	// 「……心配はいらない。今なら　Ｍ抗体で
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_611_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	task_antibody = Task_AnimeMoveNoFit_(antibody, "anm_antibody000");
	SetMotion_(rena, rena_show_send_L, 20);
	PlaySE_("SE_DEM_149");											//M抗体が飛んでいき心臓部に入り込む
	Wait_(60);
	SetAlpha_(player, ALPHA_EXIST);


	// ▼カット４＠Ｍ抗体がマザーへ向かう～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");		// 240F

	SetMotion_(rena, MOT_WAIT, BLEND_N);
	WaitTask(task_cam);


	// ▼カット５＠マザーＵＰ～～～～～～～～～～～～～～～～～
	SetPointCameraEye_("cameye009");
	SetPointCameraTarget_("camtgt009");
	SetFace_(rena, "Face_default");
	
	WaitTask(task_antibody);
	SetDir_(antibody, 180);
	StopBgm_(90);
	efc_drain = SetSelectBoneEffect_("ef861_03_m_draw", antibody, ATTACH_GLOBAL);
	SetEffectScale_(efc_drain, 3.0);
	Wait_(10);
	SetEffectScale_(efc_antibody0, 5.0);
	WaitTask(task_cam);
	Wait_(60);
	PlaySE_("SE_DEM_150");											//心臓部が光り輝く

	task_cam = Task_AnimeMoveCamera_("anmeye008", "anmtgt008");		// 195Fマザーズームアウト

	uChangeEffectScale(efc_antibody0, 5.0, 35.0, 150)				// だんだんエフェクト大きくなる
	Wait_(50);
	WaitTask(task_cam);
	efc_drain = SetSelectBoneEffectSetOffset_("ef732_13_light_reactor01", antibody, ATTACH_GLOBAL, Vec3(0.0, 0.0, 50.0));
	SetEffectScale_(efc_drain, 6.0);
	Wait_(40);
	//白フラッシュのようなフェードアウト
	DeleteEffectEmitter_(efc_antibody0);
	DeleteEffectEmitter_(efc_drain);
	SetFade_(FADE_OUT, FADE_COLOR_WHITE, 10);
	Wait_(30);
	SetFade_(FADE_IN, FADE_COLOR_WHITE, FADE_DEF);
	WaitFade_();
	Wait_(80);


	// ▼カット６＠レナーテと主人公～～～～～～～～～～～～～～
	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");

	SetMotion_(rena, rena_talk01, BLEND_M);		// 会話
	WaitMotion(rena);
	SetMotion_(rena, rena_talk01_L, BLEND_M);	// 会話L

	//===============================================
	// ■レナーテ
	// 「成功した……の？
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_611_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(10);
	PlayLoopSE_("SE_DEM_013");
	StartEarthQuake_(60, 3, 0.5);
	Wait_(5);
	SurpriseDisp(rena, 0.6);								//「!」
	local pos = Vec3(0, 1, 0);
	efc_player = SurpriseDispSetOffset(player, pos, 0.7);
	SetMotion_(rena, rena_attack_start_L,  BLEND_XL);		// 攻撃開始L
	Wait_(2);
	SetMotion_(player, player_caution01_L, BLEND_L);		// 警戒L
	Wait_(53);
	StopLoopSE_(30);
	StartDecayEarthQuake_(30, 3, 0.5);
	Wait_(30);


	// ▼カット７＠マザーＵＰ～～～～～～～～～～～～～～～～～
	SetPointCameraEye_("cameye003");
	SetPointCameraTarget_("camtgt003");

	efc_cam = SetCameraEffect_("ef733_02_sym_black_mist01", CAMERA_DEF);		// 黒い靄
	SetDir_(antibody, 180);
	efc_antibody1 = SetPosWorldEffect_("ef861_04_m_vomit", GetPos_(antibody));
	PlaySE_("SE_DEM_151");									//M抗体がはじかれる
	Wait_(60);
	SetPointPos_(player, "player001");
	SetMotion_(rena, rena_guard, BLEND_N);		// ガード
	SetFace_(rena, "Face_loop_close");


	// ▼カット８＠レナーテ尻もちをつく～～～～～～～～～～～～
	SetPointCameraEye_("cameye004");
	SetPointCameraTarget_("camtgt004");

	efc_rena = SetSelectBoneEffect_("ef732_27_shock_wave01", rena, ATTACH_EFFECT1);
	PlayLoopSE_("SE_DEM_013");
	StartEarthQuake_(-1, 3, 0.5);
	SetMotion_(rena, rena_weaken, BLEND_M);				// 弾き飛ばされる→弱り
	task_rena = Task_AnimeMoveNoDir_(rena, "anm_rena000");

	SetMotion_(player, player_guard_L, BLEND_M);	// 身構える
	SetFace_(player, "Face_loop_close");

	//===============================================
	// ■レナーテ
	// 「……くっ！？
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_611_MSG_050");
	StopEarthQuake_();
	StopLoopSE_(15);
	StartDecayEarthQuake_(15, 3, 0.5);
	Wait_(70);
	CloseMsgWnd_();
	//===============================================

	SetFace_(player, "Face_default");
	SetMotion_(player, player_guard_turn, BLEND_L);		// 身構える→振り向く
	WaitMotion(player);
	SetMotion_(player, player_guard_turn_L, BLEND_M);	// 身構え振り向くL
	DeleteTask_(task_rena);


	// ▼カット９＠主人公、レナーテをかばう～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");				// 20F

	SetMotionSpeed_(player, 0.8);
	SetMotion_(player, player_run_battle, BLEND_M);
	task_player = Task_AnimeMoveNoDir_(player, "anm_player000");
	for (local i=1; i <= 20; i++) {
		SetDir_(player, GetDir_(player) + 1.5);
		Wait_(1);
	}
	SetMotionSpeed_(player, 1.0);
	SetMotion_(player, player_battle_L, BLEND_M);		// 戦闘待機L
	Wait_(69);
	SetMotion_(rena, rena_weaken_L, BLEND_M);			// 弱りL
	Wait_(18);
	SetFace_(rena, "Face_default");		// 150F後に目を開ける
	Wait_(45);
	PlaySE_("SE_DEM_152");									//ガルビルスが現れる
	SetAlpha_(grbrs, ALPHA_EXIST);
	SetMotion_(grbrs, grbrs_grow, BLEND_N);		// マザーから出てくる
	SetVisible(beto, true);
	SetMotion_(beto, beto_grow, BLEND_N);
	efc_grbrs = SetSelectBoneEffect_("ef861_05_galvirus_appear01", grbrs, ATTACH_GLOBAL);
	task_grbrs = Task_ChangeMotion_(grbrs, grbrs_grow_L, BLEND_M);
	DeleteEffect_(efc_cam);
	DeleteTask_(task_cam);
	bone_efc0 = SetSelectBoneEffectSetBoneName_("ef861_08_galvirus_appear04", grbrs, "R_Finger1_03", Vec3(0.0, 0.0, 0.0));
	bone_efc1 = SetSelectBoneEffectSetBoneName_("ef861_08_galvirus_appear04", grbrs, "R_Finger2_03", Vec3(0.0, 0.0, 0.0));
	bone_efc2 = SetSelectBoneEffectSetBoneName_("ef861_08_galvirus_appear04", grbrs, "R_Finger3_03", Vec3(0.0, 0.0, 0.0));
	bone_efc3 = SetSelectBoneEffectSetBoneName_("ef861_16_galvirus_appear06", beto, "Effect_up_mouth", Vec3(0.0, 0.0, 0.0));
	SetEffectFrame_(bone_efc1, 10);
	SetEffectFrame_(bone_efc2, 20);


	// ▼カット10＠ガルビルス登場～～～～～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");				// 170F

	WaitMotion(grbrs);
	SetMotion_(grbrs, grbrs_grow_L, BLEND_M);
	SetMotion_(beto, beto_grow_L, BLEND_M);
	WaitTask(task_cam);
	PlayBgm_("BGM_007");

	//===============================================
	// *ガルビルス
	// 「にゃははは！　惜しかったね。
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_611_MSG_060");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	DeleteTask_(task_grbrs);
	SetAlpha_(player, ALPHA_CLEAR);


	// ▼カット11＠レナーテズームイン～～～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye005", "anmtgt005");			// 8F
	PlaySE_("SE_DEM_026");	// ■SE:集中線
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", CAMERA_DEF);		// 集中線

	//===============================================
	// ■レナーテ
	// 「な……なんなの……あれは……？
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_611_MSG_070");
	KeyInputWait_();
	CloseMsgWnd_();
	//-----------------------------------------------

	DeleteTask_(task_cam);
	DeleteEffect_(efc_cam);


	// ▼カット12＠ガルビルスズームイン～～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye006", "anmtgt006");				// 300F

	//===============================================
	//  ガルビルス
	// 「にゃははは！　ボクが　なんなのかって？
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_611_MSG_080");
	KeyInputWait_();
	//-----------------------------------------------
	// *ガルビルス
	// 「……かつて　マ素を研究し　魔界の扉を開き
	//-----------------------------------------------
	ShowMsg_("DEMO_611_MSG_090");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);
	WaitFade_();


	// ▼カット13＠過去回想～～～～～～～～～～～～

	SetLayoutAnime_("ev611_00_loop", true);//過去回想開始
	Wait_(30);
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);
	Wait_(45);

	//===============================================
	// *ガルビルス
	// 「やがてカルマッソは　あるモンスターマスターに
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_611_MSG_100");
	KeyInputWait_();
	//-----------------------------------------------
	// ▽
	// 「悪意は　マ素に宿って　世界へと拡散。
	//-----------------------------------------------
	ShowMsg_("DEMO_611_MSG_110");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(30);
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);
	WaitFade_();
	SetLayoutAnime_("ev611_00_out", false);//過去回想終了

	WaitLayoutAnime();
	DeleteTask_(task_cam);
	SetAlpha_(player, ALPHA_EXIST);
	SetMotion_(player, player_battle01_L, BLEND_N);
	SetDir_(player, 15);


	// ▼カット14＠主人公とレナーテ～～～～～～～～～～～～～～
	SetPointCameraEye_("cameye005");
	SetPointCameraTarget_("camtgt005");

	SetFade_(FADE_IN, FADE_COLOR_BLACK, 20);
	Wait_(20);

	//===============================================
	// ■レナーテ
	// 「そんな……マザーを動かす　マデュライトの中に
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_611_MSG_120");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================


	// ▼カット15＠ガルビルスＵＰ～～～～～～～～～～～～～～～
	SetPointCameraEye_("cameye006");
	SetPointCameraTarget_("camtgt006");

	//===============================================
	// *ガルビルス
	// 「そう！　星をも作り出せる　マザーのチカラで
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_611_MSG_130");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	DeleteEffectEmitter_(bone_efc0);
	DeleteEffectEmitter_(bone_efc1);
	DeleteEffectEmitter_(bone_efc2);
	DeleteEffectEmitter_(bone_efc3);


	// ▼カット16＠ガルビルス、マザーから落ちる～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");				// 450F

	PlaySE_("SE_DEM_153");													//ガルビルスが心臓から落ちる
	efc_grbrs = SetSelectBoneEffect_("ef861_06_galvirus_appear02", grbrs, ATTACH_GLOBAL);
	SetSelectBoneEffectSetBoneName_("ef861_18_galvirus_appear08", grbrs, "Waist_Root", Vec3(0.0, 0.0, 0.0));
	SetMotion_(grbrs, grbrs_born, BLEND_M);
	SetMotion_(beto, beto_born, BLEND_M);
	SetMotion_(ground, MOT_GIMMICK_1, BLEND_N);
	Wait_(280);
	PlaySE_("SE_DEM_154");													//ガルビルスが立ち上がる
	Wait_(120);
	SetSelectBoneEffectSetBoneName_("ef861_17_galvirus_appear07", grbrs, "Hip2", Vec3(0.0, 0.0, 0.0));
	Wait_(20);
	task_grbrs = Task_RotateToDir_(grbrs, -160, 1);
	task_beto = Task_RotateToDir_(beto, -160, 1);
	Wait_(10);
	SetMotion_(grbrs, MOT_SPELL_ACTUATE, BLEND_XL);
	SetMotion_(beto, beto_m_attack, BLEND_XL);
	Wait_(35);
	StartEarthQuake_(9, 3, 3);

	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", CAMERA_DEF);		// 集中線
	SetMotionSpeed_(grbrs, 0.1);
	SetMotionSpeed_(beto, 0.1);

	//===============================================
	// *ガルビルス
	// 「ボクは　カルマッソの悪意から　生まれし者。
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_611_MSG_140");
	bone_efc0 = SetSelectBoneEffectSetBoneName_("ef861_09_galvirus_appear05", grbrs, "R_Mouth7", Vec3(0.0, 0.0, 0.0));
	bone_efc1 = SetSelectBoneEffectSetBoneName_("ef861_09_galvirus_appear05", grbrs, "R_Mouth9", Vec3(0.0, 0.0, 0.0));
	bone_efc2 = SetSelectBoneEffectSetBoneName_("ef861_09_galvirus_appear05", grbrs, "L_Mouth4", Vec3(0.0, 0.0, 0.0));
	bone_efc3 = SetSelectBoneEffectSetBoneName_("ef861_09_galvirus_appear05", grbrs, "L_Mouth12", Vec3(0.0, 0.0, 0.0));
	Wait_(75);
	efc_grbrs = SetSelectBoneEffectSetBoneName_("ef861_07_galvirus_appear03", beto, "Effect_lo_mouth", Vec3(0.0, 0.0, 0.0));
	SetMotion_(grbrs, MOT_WAIT, BLEND_XL);
	SetMotion_(beto, MOT_WAIT, BLEND_XL);
	SetMotionSpeed_(grbrs, 1.0);
	SetMotionSpeed_(beto, 1.0);
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	WaitTask(task_cam);
	DeleteEffect_(efc_cam);
	DeleteTask_(task_grbrs);

	task_cam = Task_AnimeMoveCamera_("anmeye009", "anmtgt009");				// 170F

	WaitTask(task_cam);
	Wait_(50);
	SetAlpha_(player, ALPHA_CLEAR);
	SetPointPos_(grbrs, "npc_grbrs001");
	SetPointPos_(beto, "npc_grbrs001");


	// ▼カット17＠ガルビルスＵＰ～～～～～～～～～～～～～～～
	SetPointCameraEye_("cameye008");
	SetPointCameraTarget_("camtgt008");

	//===============================================
	// ■ガルビルス
	// 「マザーを　浄化なんてさせないよ。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_GARUBIRUSU");
	ShowMsg_("DEMO_611_MSG_160");
	KeyInputWait_();
	//-----------------------------------------------
	// ▽
	// 「ボクは　カルマッソが夢見た　すべてを超越する
	//-----------------------------------------------
	ShowMsg_("DEMO_611_MSG_170");
	KeyInputWait_();
	//-----------------------------------------------
	// ▽
	// 「その邪魔は　させないよっ！！
	//-----------------------------------------------
	ShowMsg_("DEMO_611_MSG_180");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	DeleteEffectEmitter_(efc_grbrs);

	task_cam = Task_AnimeMoveCamera_("anmeye007", "anmtgt007");				// 60Fガルビルス咆哮

	task_beto = Task_ObjectFadeOut_(beto, 60);
	SetMotion_(grbrs, grbrs_shout, BLEND_M);		// 待機→咆哮→待機
	SetMotion_(beto, beto_shout, BLEND_M);
	PlaySE_("SE_DEM_155");
	Wait_(55);
	bone_efc0 = SetSelectBoneEffectSetBoneName_("ef861_09_galvirus_appear05", grbrs, "R_Mouth7", Vec3(0.0, 0.0, 0.0));
	bone_efc1 = SetSelectBoneEffectSetBoneName_("ef861_09_galvirus_appear05", grbrs, "R_Mouth9", Vec3(0.0, 0.0, 0.0));
	bone_efc2 = SetSelectBoneEffectSetBoneName_("ef861_09_galvirus_appear05", grbrs, "L_Mouth4", Vec3(0.0, 0.0, 0.0));
	bone_efc3 = SetSelectBoneEffectSetBoneName_("ef861_09_galvirus_appear05", grbrs, "L_Mouth12", Vec3(0.0, 0.0, 0.0));
	bone_efc4 = SetSelectBoneEffectSetBoneName_("ef861_09_galvirus_appear05", grbrs, "Down_Mouth2", Vec3(0.0, 0.0, 0.0));
	SetEffectScale_(bone_efc4, 3.0);
	Wait_(15);

	EncountEndDemo(ENCOUNT_BOSS);
}


//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//		エフェクトサイズを徐々に変更
//
//----------------------------------------------------------------------------
//	引数	: efc			エフェクトＩＤ
//			: start_size	初期エフェクトサイズ
//			: end_size		最終エフェクトサイズ
//			: frm			フレーム数
//
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function uChangeEffectScale(efc, start_size, end_size, frm)
{
	local change_size;		// １フレームで変更するサイズ

	change_size = (end_size - start_size) / frm;		// (最終サイズ － 初期サイズ) ÷ フレーム数

	for (local i=1; i<=frm; i++) {
		SetEffectScale_(efc, start_size + (change_size * i));
		Wait_(1);
	}

	SetEffectScale_(efc, end_size);
}
