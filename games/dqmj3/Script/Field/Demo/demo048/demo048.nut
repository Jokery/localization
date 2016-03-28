//=============================================
//
//		demo048[レナーテ登場_1(楽園)]
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
	local task_cam, task_player, task_rena, task_sancho;
	local efc_cam, efc_player, efc_sancho0, efc_sancho1, efc_sancho2, efc_rena, efc_wormhole ,efc_bird;
	local effect_pos = Vec3(0, -1.5, 0);	// 主人公用エフェクトを、Effect1より低い位置に表示する

// ▼LOD読み込み
	ReadWaitingLod("cameye003", "camtgt003");

// ▼リソース読込
	// ギミック
	local model_reactor = ReadGimmick_("o_dem_11");		// リアクター
	// キャラクター
	local player = GetPlayerId_();						// 主人公
	local model_rena = ReadNpc_("n007");				// レナーテ
	local model_sancho = ReadNpc_("n011");				// サンチョ（変身前）
	local model_sancho_after = ReadNpc_("m179_00");		// サンチョ（変身後）
	// エフェクト
	LoadEffect_("ef710_02_cha_heroi_atc01");			// ヒロインの攻撃１
	LoadEffect_("ef710_03_cha_heroi_atc02");			// ヒロインの攻撃２
	LoadEffect_("ef732_10_wormhole_black");				// 黒い空間
	LoadEffect_("ef732_09_light_reactor_c");			// リアクターの光
	LoadEffect_("ef732_08_light_scan");					// スキャンの光
	LoadEffect_("ef712_10_emo_surprise01");				// 「！」
	LoadEffect_("ef721_03_nat_smoke_n03");				// 砂煙
	LoadEffect_("ef804_02_beacon_reactor");				// ガイドビーコン
	LoadEffect_("ef804_03_tran_sancho");				// トランスフォーム
	LoadEffect_("ef720_01_nat_oth_birds");				// 鳥
	LoadEffect_("ef733_01_sym_shuchusen01");			// 集中線(音無)
	LoadEffect_("ef804_04_death_sancho01");				// 攻撃を受けた時
	LoadEffect_("ef804_05_death_sancho02");				// ビリビリ
	LoadEffect_("ef804_06_death_sancho03");				// 爆発
	LoadEffect_("ef723_01_nat_explosion_n01");			// コンソール爆発
	

// ▼配置
	// ギミック
	local reactor = ArrangePointGimmick_("o_dem_11", model_reactor, "obj_reactor000");
	// 主人公
	SetPointPos_(player, "player000");
	SetFace_(player, "Face_left");
	// レナーテ
	local rena = ArrangePointNpc_(model_rena, "npc_rena000");
	SetPointPosNoFit_(rena, "npc_rena000");
	SetFace_(rena, "Face_loop_close");
	// サンチョ（変身前）
	local sancho = ArrangePointNpc_(model_sancho, "npc_sancho000");
	SetScaleSilhouette(sancho, SCALE.SANCHO, SILHOUETTE_WIDTH.SANCHO);
	SetStepSe_(sancho, SILENT_STEP_SE);									// 足音を 無音にする
	// サンチョ（変身後）
	local sancho_after = ArrangePointNpc_(model_sancho_after, "npc_sancho_after000");
	SetScaleSilhouette(sancho_after, SCALE.M, SILHOUETTE_WIDTH.S);
	SetAlpha_(sancho_after, ALPHA_CLEAR);

// ▼非常駐モーション読込
	// 主人公
	local player_battle01_L = ReadMotion_(player, "Player_battle01_L");				// 戦闘待機L（顔上向き）
	local player_caution01_L = ReadMotion_(player, "Player_caution01_L");			// 警戒L
	local player_cage_turn = ReadMotion_(player, "Player_cage_turn");				// 上を向く→振り向き
	local player_cage_turn_L = ReadMotion_(player, "Player_cage_turn_L");			// 振り向き
	local player_look_left_L = ReadMotion_(player, "Player_look_left_L");			// 顔を少し左向けるL
	local player_reactor = ReadMotion_(player, "Player_touch_reactor");				// 顔を少し左向ける→リアクターを触る
	local player_reactor_L = ReadMotion_(player, "Player_touch_reactor_L");			// リアクターを触るL
	local player_surprise = ReadMotion_(player, "Player_surprise");					// 主人公　驚く
	local player_surprise_L = ReadMotion_(player, "Player_surprise_L");				// 主人公　驚くL
	
	// レナーテ
	local rena_reach_hand = ReadMotion_(rena, "n007_reach_hand");					// 待機→手を伸ばす
	local rena_appearance = ReadMotion_(rena, "n007_appearance");					// 登場
	local rena_attack_start = ReadMotion_(rena, "n007_attack_start");				// 待機→攻撃開始
	local rena_attack_start_L = ReadMotion_(rena, "n007_attack_start_L");			// 攻撃開始L
	local rena_attack02 = ReadMotion_(rena, "n007_attack02");						// サンチョに攻撃
	local rena_attack02_L = ReadMotion_(rena, "n007_attack02_L");					// サンチョに攻撃L
	
	// サンチョ（変身前）
	local sancho_warning_L = ReadMotion_(sancho, "n011_warning_L");					// 警戒L
	
	// サンチョ（変身後）
	local sancho_explosion = ReadMotion_(sancho_after, "m179_00_explosion");		// 爆発する
	local sancho_explosion_L = ReadMotion_(sancho_after, "m179_00_explosion_L");	// 爆発するL
	local sancho_death = ReadMotion_(sancho_after, "m179_00_death");				// 死亡する

// ▼モーション設定
	// 主人公
	SetMotion_(player, player_reactor_L, BLEND_N);		// リアクターを触るLOOP

// ▼カメラ設定
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");		// 60F
//	PlayBgm_("BG_AMBI_005");//デバッグ用BGM

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	// ▼カット１＠主人公へズームイン～～～～～～～～～～～～～
	Wait_(15);
	SetMotion_(player, player_look_left_L, BLEND_XL);		// 左向きLOOP
	Wait_(15);
	
//	efc_player = SetBoneEffect_("ef732_09_light_reactor_c", player);
	efc_player = SetSelectBoneEffectSetOffset_("ef732_09_light_reactor_c", player, ATTACH_EFFECT1, effect_pos);		// ガイドビーコン
	PlaySE_("SE_FLD_135");		// リアクター反応音
	Wait_(15);
	
	//===============================================
	// ■なぞの機械
	// 「これより　着用者の確認を　行います。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MYSTERYMACHINE");
	ShowMsg_("DEMO_048_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	DeleteTask_(task_cam);
	DeleteEffect_(efc_player);
	SetMotion_(player, MOT_WAIT, BLEND_N);
	SetFace_(player, "Face_eyes_close");
	efc_player = SetSelectBoneEffect_("ef732_08_light_scan", player, ATTACH_GLOBAL);		// スキャンの光
	PlaySE_("SE_FLD_235");
	// ▼カット２＠主人公へＰＡＮＵＰ～～～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");		// 120F
	WaitTask(task_cam);
	DeleteTask_(task_cam);
	
	//===============================================
	// ■なぞの機械
	// 「登録されている　ＤＮＡデータと一致……
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MYSTERYMACHINE");
	ShowMsg_("DEMO_048_MSG_020");
	KeyInputWait_();
	//-----------------------------------------------
	// ▽
	// 「プログラムを　自動再生。
	//-----------------------------------------------
	ShowMsg_("DEMO_048_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	// ▼カット３＠主人公からズームアウト～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");		// 60F
	SetMotion_(player, player_caution01_L, BLEND_L);				// 警戒
	efc_player = SetSelectBoneEffectSetOffset_("ef804_02_beacon_reactor", player, ATTACH_EFFECT1, effect_pos);		// ガイドビーコン
	
	PlaySE_("SE_DEM_063");											// ■SE:ガイドビーコン
	
	Wait_(60);
	DeleteTask_(task_cam);
	DeleteEffect_(efc_player);
	
	// ▼カット４＠鳥が飛び立つ（？）～～～～～～～～～～～～～
	SetPointCameraEye_("cameye003");
	SetPointCameraTarget_("camtgt003");
	
	efc_bird = SetPointWorldEffect_("ef720_01_nat_oth_birds", "efc_bird000");
	Wait_(180);
	
	// ▼カット５＠サンチョのアップ～～～～～～～～～～～～～～
	SetPointCameraEye_("cameye004");
	SetPointCameraTarget_("camtgt004");
	Wait_(10);
	efc_sancho0 = SurpriseDisp(sancho);
	task_sancho = Task_RotateToDir_(sancho, -60, ROTATE_DEMO_DEF);
	WaitTask(task_sancho);
	DeleteTask_(task_sancho);
	
	SetFace_(sancho, "Face_warning");
	Wait_(30);
	
	// ズームアウト
	task_cam = Task_AnimeMoveCamera_("anmeye012", "anmtgt012");			// 30F
	SetMotion_(sancho, MOT_WALK, BLEND_L);
	task_sancho = Task_MoveForward_(sancho, 4.0, false);
	PlaySE_("SE_FLD_040");											//■SE:サンチョ足音（浮遊モンスターの足音）
	Wait_(15);
	PlaySE_("SE_FLD_040");											//■SE:サンチョ足音（浮遊モンスターの足音）
	Wait_(45);
	PosDebug(sancho);
	
	SetMotion_(sancho, MOT_WAIT, BLEND_N);
	DeleteTask_(task_sancho);
	DeleteTask_(task_cam);
	
	//-----
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 15);
	StopBgm_(15);
	WaitFade_();
	
	SetBgBlack_(true);
	
	// 真っ黒な画面
	SetPointCameraEye_("cameye004");
	SetPointCameraTarget_("camtgt004");
	
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 15);
	//-----
	
	// ▼カット４＠レナーテへＰＡＮ～～～～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");		// 120F
	StartBlurEffect_();
	Wait_(30);
	
	//===============================================
	// *なぞの少女
	// 「……けた。
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_048_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	Wait_(20);
	
	//===============================================
	// *なぞの少女
	// 「……見つけた。
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_048_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	Wait_(20);
	
	//===============================================
	// *なぞの少女
	// 「やっと……見つけた。
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_048_MSG_060");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(rena, rena_reach_hand, BLEND_M);		// 待機→手を伸ばす
	SetMotionSpeed_(rena, 0.75);
	WaitMotion(rena);
	
//	Wait_(30);
	
	WaitTask(task_cam);
	DeleteTask_(task_cam);
	EndBlurEffect_();
	
	SetBgBlack_(false);
	SetMotion_(player, player_caution01_L, BLEND_N);				// 警戒
	
//	//-----
//	SetFade_(FADE_OUT, FADE_COLOR_WHITE, 5);
//	WaitFade_();
	
	// ▼カット６＠黒い空間が出現する～～～～～～～～～～～～～
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	
	efc_wormhole = SetPointWorldEffect_("ef732_10_wormhole_black", "efc_wormhole000");
	PlaySE_("SE_DEM_064");											// ■SE:次元の穴からレナーテ

	Wait_(90);
	
	//-----
	SetFade_(FADE_OUT, FADE_COLOR_WHITE, 5);
	WaitFade_();
	
//	DeleteEffect_(efc_wormhole);
	
	SetPointPos_(rena, "npc_rena001");
	SetMotion_(rena, rena_appearance, BLEND_N);		// 登場
	SetMotionSpeed_(rena, 0.5);
	
	// ▼カット７＠レナーテ登場～～～～～～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");		// 110F
	
	SetFade_(FADE_IN, FADE_COLOR_WHITE, 10);
	//-----
	
	Wait_(55);
	SetMotionSpeed_(rena, 1.0);
	Wait_(43);
	PlaySE_("SE_FLD_015");		// 足音（草原）
	
	Wait_(55);
	SetFace_(rena, "Face_default");
	
	WaitMotion(rena);
	SetMotion_(rena, MOT_WAIT, BLEND_M);
	
	WaitTask(task_cam);
	DeleteEffect_(efc_wormhole);
	
	// ▼カット８＠レナーテ、ズームイン～～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye008", "anmtgt008");		// 60F
	WaitTask(task_cam);
	
	Wait_(60);
	
	SetMotion_(player, MOT_WAIT, BLEND_N);
	SetMotionSpeed_(rena, 1.0);
	
	// ▼カット９＠主人公アップ～～～～～～～～～～～～～～～～
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	
	//===============================================
	// ■なぞの少女
	// 「探した……あなたのこと。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MYSTERYGIRL");
	ShowMsg_("DEMO_048_MSG_070");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetPointPos_(player, "player001");
	
	SetPointPos_(rena, "npc_rena002");
	SetMotion_(rena, MOT_WAIT, BLEND_N);
	
	SetPointPos_(sancho, "npc_sancho001");
	task_sancho = Task_MoveToPointSetSpeed_(sancho, "npc_sancho002", 1.5);
	SetMotion_(sancho, sancho_warning_L, BLEND_N);		// 警戒
//	SetMotion_(sancho, MOT_RUN, BLEND_N);
	SetFace_(sancho, "Face_warning");
	
	// ▼カット10＠サンチョ、主人公の前へ～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye005", "anmtgt005");			// 10F
	PlaySE_("SE_DEM_026");													// ■SE:集中線
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", CAMERA_DEF);		// 集中線
	
	WaitTask(task_sancho);
	DeleteTask_(task_sancho);
	
//	SetMotion_(sancho, sancho_warning_L, BLEND_M);		// 警戒
	task_sancho = Task_RotateToDir_(sancho, -20, ROTATE_DEMO_DEF);
//	WaitTask(task_sancho);
//	DeleteTask_(task_sancho);
	
	SetMotion_(player, player_surprise, BLEND_M);					// 驚き
	task_player = Task_ChangeMotion_(player, player_surprise_L, BLEND_M);
	
	//===============================================
	// ■サンチョ
	// 「イケマセン　ゴ主人サマ！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_SANCHO");
	ShowMsg_("DEMO_048_MSG_080");
	KeyInputWait_();
	
	DeleteTask_(task_cam);
	DeleteEffect_(efc_cam);
	SetAlpha_(player, ALPHA_CLEAR);
	SetAlpha_(rena, ALPHA_CLEAR);
	
	// ▼カット11＠サンチョのアップ～～～～～～～～～～～～～～
	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");
	
	//-----------------------------------------------
	// ▽
	// 「言イナリニナッテハ　ダメデス！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_SANCHO");
	ShowMsg_("DEMO_048_MSG_090");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	// ズームイン
	task_cam = Task_AnimeMoveCamera_("anmeye011", "anmtgt011");			// 10F
//	PlaySE_("SE_DEM_026");												// ■SE:集中線
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", CAMERA_DEF);	// 集中線
	
	//-----
	SetFade_(FADE_OUT, FADE_COLOR_WHITE, 10);
	WaitFade_();
	PlaySE_("SE_DEM_065");											// ■SE:サンチョ変形
	
	DeleteTask_(task_cam);
	DeleteTask_(task_sancho);
	DeleteTask_(task_player);
	DeleteEffect_(efc_cam);
	
	SetAlpha_(sancho, ALPHA_CLEAR);
	SetAlpha_(sancho_after, ALPHA_EXIST);
	
	Wait_(15);
	
	efc_sancho0 = SetSelectBoneEffect_("ef804_03_tran_sancho", sancho_after, ATTACH_GLOBAL);		// トランスフォーム
	
	// ▼カット12＠変身後サンチョ、ＰＡＮＵＰ～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye009", "anmtgt009");		// 210F
	SetFade_(FADE_IN, FADE_COLOR_WHITE, 60);
	//-----
	
	WaitTask(task_cam);
	Wait_(10);
	DeleteTask_(task_cam);
	
	SetPointPos_(rena, "npc_rena001");
	SetAlpha_(rena, ALPHA_EXIST);
//	SetAlpha_(sancho_after, ALPHA_CLEAR);
	
	// ▼カット13＠レナーテＵＰ～～～～～～～～～～～～～～～～

	task_cam = Task_AnimeMoveCamera_("anmeye007a", "anmtgt007a");				// 5F
	SetMotion_(rena, rena_attack_start, BLEND_M);
	task_rena = Task_ChangeMotion_(rena, rena_attack_start_L, BLEND_M);
	Wait_(20);
	efc_rena = SetSelectBoneEffect_("ef710_02_cha_heroi_atc01", rena, ATTACH_EFFECT3);
	PlaySE_("SE_DEM_142");
	WaitTask(task_cam);	
	
	//===============================================
	// ■なぞの少女
	// 「邪魔をしないで。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MYSTERYGIRL");
	ShowMsg_("DEMO_048_MSG_100");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	DeleteTask_(task_cam);
	task_cam = Task_AnimeMoveCamera_("anmeye007", "anmtgt007");				// 5F
	SetFace_(rena, "Face_left");	
		
	SetMotion_(rena, rena_attack02, BLEND_M);
	task_rena = Task_ChangeMotion_(rena, rena_attack02_L, BLEND_M);
		
	DeleteEffectEmitter_(efc_rena);
	efc_rena = SetSelectBoneEffect_("ef710_03_cha_heroi_atc02", rena, ATTACH_GLOBAL);
	Wait_(16);
	SetFace_(rena, "Face_default");
	PlaySE_("SE_DEM_066");											// ■SE:レナーテ攻撃
	DeleteTask_(task_rena);
		
	// ▼カット14＠ズームアップ～～～～～～～～～～～～～～～～

	StartBlurEffect_();
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", CAMERA_DEF);		// 集中線
	Wait_(45);
	
	SetAlpha_(sancho_after, ALPHA_EXIST);
	SetAlpha_(rena, ALPHA_CLEAR);
	DeleteTask_(task_cam);
//	DeleteTask_(task_rena);
	DeleteEffect_(efc_cam);
	EndBlurEffect_();	
	
	// ▼カット15＠サンチョ壊れる～～～～～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye014", "anmtgt014");				// 210F
	
	efc_sancho0 = SetBoneEffect_("ef804_04_death_sancho01", sancho_after);
	efc_sancho1 = SetBoneEffect_("ef804_05_death_sancho02", sancho_after);
	SetMotion_(sancho_after, MOT_DAMAGE, BLEND_N);
	WaitMotion(sancho_after);
	SetMotion_(sancho_after, sancho_explosion, BLEND_XL);
	Wait_(30);
	efc_sancho0 = SetSelectBoneEffectSetOffset_("ef723_01_nat_explosion_n01", sancho_after, ATTACH_EFFECT2, Vec3(0.0, 30.0, 0.0));
	SetEffectScale_(efc_sancho0, 0.3);	
	WaitMotion(sancho_after);
	SetMotion_(sancho_after, sancho_explosion_L, BLEND_M);
	
	//===============================================
	// ■サンチョ
	// 「ギギ……メインシステムに
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_SANCHO");
	ShowMsg_("DEMO_048_MSG_110");
	KeyInputWait_();
	
	//-----------------------------------------------
	// ▽
	// 「この空間を　維持……できマセン。
	//-----------------------------------------------
	ShowMsg_("DEMO_048_MSG_120");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	WaitTask(task_cam);
	
	SetAlpha_(player, ALPHA_EXIST);
	SetPointPos_(player, "player000");
	SetMotion_(player, MOT_WAIT, BLEND_N);
	SetAlpha_(rena, ALPHA_EXIST);
	SetAlpha_(sancho_after, ALPHA_CLEAR);
	DeleteEffect_(efc_sancho0);
	DeleteEffect_(efc_sancho1);
	
	// ▼カット16＠主人公ズームイン～～～～～～～～～～～～～～
	SetMotion_(player, player_caution01_L, BLEND_N);				// 警戒
	SetPointCameraEye_("cameye010");
	SetPointCameraTarget_("camtgt010");
	Wait_(10);
	
	//===============================================
	// ■なぞの少女
	// 「まずは　あなたを……
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MYSTERYGIRL");
	ShowMsg_("DEMO_048_MSG_130");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetAlpha_(player, ALPHA_CLEAR);
	SetAlpha_(rena, ALPHA_EXIST);
	SetMotion_(rena, MOT_WAIT, BLEND_N);

	
	// ▼カット17＠レナーテＵＰ～～～～～～～～～～～～～～～～
	SetMotionSpeed_(rena, 1.0);	

	
	task_cam = Task_AnimeMoveCamera_("anmeye018", "anmtgt018");				// 8F
	Wait_(10);
	SetFace_(rena, "Face_loop_close");
	
	WaitTask(task_cam);

	//===============================================
	// ■なぞの少女
	// 「この　まぼろしの世界から　解放する！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MYSTERYGIRL");
	ShowMsg_("DEMO_048_MSG_140");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	DeleteTask_(task_cam);
	task_cam = Task_AnimeMoveCamera_("anmeye019", "anmtgt019");				// 8F

	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", CAMERA_DEF);		// 集中線
	PlaySE_("SE_DEM_026");													// ■SE:集中線

	SetFace_(rena, "Face_default");
	WaitTask(task_cam);
	Wait_(20);	
	DeleteTask_(task_cam);
	DeleteEffect_(efc_cam);
	SetAlpha_(rena, ALPHA_CLEAR);
	SetAlpha_(sancho_after, ALPHA_EXIST);
	
	// ▼カット18＠サンチョ爆発～～～～～～～～～～～～～～～～
	StartBlurEffect_();
	task_cam = Task_AnimeMoveCamera_("anmeye015", "anmtgt015");				// 60F
	PlaySE_("SE_DEM_233");
	efc_sancho0 = SetSelectBoneEffectSetOffset_("ef804_05_death_sancho02", sancho_after, ATTACH_EFFECT2, Vec3(5.0, 12.0, 0.0));
	Wait_(10);	
	efc_sancho1 = SetSelectBoneEffectSetOffset_("ef804_05_death_sancho02", sancho_after, ATTACH_EFFECT2, Vec3(0.0, -10.0, 0.0));
	Wait_(10);	
	efc_sancho2 = SetSelectBoneEffectSetOffset_("ef804_05_death_sancho02", sancho_after, ATTACH_EFFECT2, Vec3(0.0, 10.0, 0.0));
	Wait_(30);	
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", CAMERA_DEF);		// 集中線
	SetMotion_(sancho_after, sancho_death, BLEND_M);
	efc_sancho0 = SetBoneEffect_("ef804_06_death_sancho03", sancho_after);
	Wait_(5);
	DeleteEffect_(efc_cam);
	Wait_(15);
	SetMotionSpeed_(sancho_after, 0.5);		
	EndDemo(FADE_COLOR_WHITE, 60);
	EndBlurEffect_();
}
