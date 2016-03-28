//=============================================
//
//		demo430[イッタブルの集会_1(1F)]
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
	local task_cam, task_player, task_player2, task_ittaburu, task_gaikotu, task_samayou, task_ookiduti, task_knight;
	local efc_cam, efc_cam2, efc_player, efc_gaikotu, efc_smoke;

// ▼リソース読込
	// ギミック
	local model_lift = ReadGimmick_("o_S02_00");	// エレベーターのリフト
	local model_elevator = ReadGimmick_("o_S02_01");// エレベーターの扉
	local model_door = ReadGimmick_("o_S02_02");	// 牢屋の扉
	// キャラクター
	local model_player = ReadNpc_("n027");			// 主人公（キグルミ）
	local player2 = GetPlayerId_();					// 主人公（キグルミなし）
	local model_ittaburu = ReadNpc_("m205_00");		// イッタブル
	local model_samayou = ReadNpc_("m111_00");		// 看守モンスターA（さまようよろい）
	local model_knight = ReadNpc_("m008_00");		// 看守モンスターB（スライムナイト）
	local model_ookiduti = ReadNpc_("m035_00");		// 看守モンスターC（おおきづち）
	local model_gaikotu = ReadNpc_("m101_00");		// 看守モンスターD（がいこつ）
	// エフェクト
	LoadEffect_("ef712_10_emo_surprise01");			// 「！」
	LoadEffect_("ef741_03_div_nor_sleep");			// 眠りエフェクト
	LoadEffect_("ef733_01_sym_shuchusen01");				// 集中線
	LoadEffect_("ef721_02_nat_smoke_n02");			// 煙
	LoadEffect_("ef741_02_div_nor_hit");			// ヒットエフェクト

// ▼配置
	// エレベーターのリフト
	local lift = ArrangePointGimmick_("o_S02_00", model_lift, "obj_lift000");
	// エレベーターの扉
	local elevator = ArrangePointGimmick_("o_S02_01", model_elevator, "obj_elevator000");
	// 牢屋の扉
	local door000 = ArrangePointGimmick_("o_S02_02", model_door, "obj_door000");
	local door100 = ArrangePointGimmick_("o_S02_02", model_door, "obj_door100");
	local door200 = ArrangePointGimmick_("o_S02_02", model_door, "obj_door200");
	local door300 = ArrangePointGimmick_("o_S02_02", model_door, "obj_door300");
	local door400 = ArrangePointGimmick_("o_S02_02", model_door, "obj_door400");
	local door500 = ArrangePointGimmick_("o_S02_02", model_door, "obj_door500");
	local door600 = ArrangePointGimmick_("o_S02_02", model_door, "obj_door600");
	local door700 = ArrangePointGimmick_("o_S02_02", model_door, "obj_door700");
	local door800 = ArrangePointGimmick_("o_S02_02", model_door, "obj_door800");
	local door900 = ArrangePointGimmick_("o_S02_02", model_door, "obj_door900");
	local door910 = ArrangePointGimmick_("o_S02_02", model_door, "obj_door910");
	local door920 = ArrangePointGimmick_("o_S02_02", model_door, "obj_door920");
	
	// 主人公（キグルミ）
	local player = ArrangePointNpc_(model_player, "player000");
	SetScaleSilhouette(player, SCALE.N, SILHOUETTE_WIDTH.S);
	SetStepSe_(player, "SE_FLD_016");
	// 主人公（キグルミなし）
	SetPointPos_(player2, "player002");
	SetVisible(player2, false);
	// イッタブル
	local ittaburu = ArrangePointNpc_(model_ittaburu, "npc_ittaburu000");
	SetScaleSilhouette(ittaburu, SCALE.M, SILHOUETTE_WIDTH.M);
	// 看守モンスターA（さまようよろい）
	local samayou = ArrangePointNpc_(model_samayou, "npc_samayou000");
	SetScaleSilhouette(samayou, SCALE.N, SILHOUETTE_WIDTH.N);
	// 看守モンスターB（スライムナイト）
	local knight = ArrangePointNpc_(model_knight, "npc_knight000");
	SetScaleSilhouette(knight, SCALE.N, SILHOUETTE_WIDTH.N);
	// 看守モンスターC（おおきづち）
	local ookiduti = ArrangePointNpc_(model_ookiduti, "npc_ookiduti000");
	SetScaleSilhouette(ookiduti, SCALE.S, SILHOUETTE_WIDTH.S);
	// 看守モンスターD（がいこつ）
	local gaikotu = ArrangePointNpc_(model_gaikotu, "npc_gaikotu000");
	SetScaleSilhouette(gaikotu, SCALE.N, SILHOUETTE_WIDTH.N);
	
	
// ▼非常駐モーション読込
	local player_shake_head_1_L = ReadMotion_(player, "m127_01_shake_head_1_L");	// 必死で頷くL
	local player_shake_head_2_L = ReadMotion_(player, "m127_01_shake_head_2_L");	// 必死で首を横に振るL
	local player_rigidity_L = ReadMotion_(player, "m127_01_rigidity_L");			// 硬直L
	
	local player2_caution01_L = ReadMotion_(player2, "Player_caution01_L");			// 警戒L
	local player2_look_around_L = ReadMotion_(player2, "Player_look_around_L");		// キョロキョロL
	local player2_hero_landing = ReadMotion_(player2, "Player_hero_landing");		// かっこよく着地
	local player2_back_L = ReadMotion_(player2, "Player_back_L");					// 後ずさりL
	local player2_caution02_L = ReadMotion_(player2, "Player_caution02_L");			// キョロキョロ
	
	local ittaburu_Pressure = ReadMotion_(ittaburu, "m205_00_Pressure");			// 待機→威圧
	local ittaburu_Pressure_L = ReadMotion_(ittaburu, "m205_00_Pressure_L");		// 威圧L

	local gaikotu_blow_off = ReadMotion_(gaikotu, "m101_00_blow_off");				// 殴られて吹っ飛ぶ→倒れ
	local gaikotu_blow_off_L = ReadMotion_(gaikotu, "m101_00_blow_off_L");			// 倒れL

// ▼カメラ設定
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");		// 180F

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	SetVisible(ittaburu, false);

	StartDemo(FADE_COLOR_BLACK);

	WaitTask(task_cam);
	
	Wait_(40);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット2
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetVisible(ittaburu, true);
	
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	PlayBgm_("BGM_007");
	Wait_(10);
	
	SetMotion_(elevator, MOT_GIMMICK_1, BLEND_N);
	PlaySE_("SE_DEM_080");
	WaitMotion(elevator);
	SetMotion_(elevator, MOT_GIMMICK_2, BLEND_N);
	
	Wait_(5);
	
	SetMotion_(ittaburu, MOT_WALK, BLEND_L);
	task_ittaburu = Task_AnimeMove_(ittaburu, "anm_ittaburu000");	// 130F
	local Istep;
	Istep = Task_ChangeStepSe(ittaburu, "SE_FLD_052", 15);

	Wait_(90);
	
	DeleteTask_(task_ittaburu);
	DeleteTaskStepSe(ittaburu, Istep);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット3
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓	
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");		// 180F
	PlaySE_("SE_FLD_052");
	SetMotion_(ittaburu, MOT_WALK, BLEND_N);
	SetPointPos_(ittaburu, "npc_ittaburu001");
	
	task_ittaburu = Task_AnimeMove_(ittaburu, "anm_ittaburu001");	// 180F
	Istep = Task_ChangeStepSe(ittaburu, "SE_FLD_052", 14);
	
	WaitTask(task_ittaburu);
	
	task_ittaburu = Task_RotateToDir_(ittaburu, -90, ROTATE_DEMO_DEF);

	WaitTask(task_ittaburu);
	DeleteTaskStepSe(ittaburu, Istep);

	SetMotion_(ittaburu, MOT_WAIT, BLEND_L);
	Wait_(20);
	//===============================================
	// *イッタブル
	// 「注目なのであるっ！！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ITABURU");
	ShowMsg_("DEMO_430_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	DeleteTask_(task_cam);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット4
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	
	//===============================================
	// *イッタブル
	// 「知ってのとおり　今日は　我らが
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ITABURU");
	ShowMsg_("DEMO_430_MSG_020");
	KeyInputWait_();
	
	//===============================================
	// *イッタブル
	// 「しかーし！　その前に
	//-----------------------------------------------
	ShowMsg_("DEMO_430_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット5
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");
	
	SetMotion_(ittaburu, MOT_WALK, BLEND_N);
	SetPointPos_(ittaburu, "npc_ittaburu002");
	
	task_ittaburu = Task_RotateToDir_(ittaburu, 0, ROTATE_DEMO_DEF);
	Istep = Task_ChangeStepSe(ittaburu, "SE_FLD_052", 15);

	WaitTask(task_ittaburu);
	
	task_ittaburu = Task_AnimeMove_(ittaburu, "anm_ittaburu002");	// 30F
	
	WaitTask(task_ittaburu);
	
	task_ittaburu = Task_RotateToDir_(ittaburu, -90, ROTATE_DEMO_DEF);

	WaitTask(task_ittaburu);
	DeleteTaskStepSe(ittaburu, Istep);

	SetMotion_(ittaburu, MOT_WAIT, BLEND_L);
	
	Wait_(20);
	//===============================================
	// *イッタブル
	// 「ネズミが１匹！　監獄の中に　入りこんだ！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ITABURU");
	ShowMsg_("DEMO_430_MSG_040");
	KeyInputWait_();
	
	//===============================================
	// *イッタブル
	// 「ネズミは　まだ見つからんのである！
	//-----------------------------------------------
	ShowMsg_("DEMO_430_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(ittaburu, MOT_WALK, BLEND_L);
	
	task_ittaburu = Task_RotateToDir_(ittaburu, -180, ROTATE_DEMO_DEF);
	Istep = Task_ChangeStepSe(ittaburu, "SE_FLD_052", 15);

	WaitTask(task_ittaburu);
	
	task_ittaburu = Task_AnimeMove_(ittaburu, "anm_ittaburu003");	// 120F
	
	Wait_(15);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット6
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");		// 105F
	
	WaitTask(task_ittaburu);
	
	task_ittaburu = Task_RotateToDir_(ittaburu, -90, ROTATE_DEMO_DEF);

	WaitTask(task_ittaburu);
	DeleteTaskStepSe(ittaburu, Istep);

	SetMotion_(ittaburu, MOT_WAIT, BLEND_L);
	
	Wait_(20);
	//===============================================
	// *イッタブル
	// 「貴様たち　看守の中に　裏切り者がいる。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ITABURU");
	ShowMsg_("DEMO_430_MSG_060");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	Wait_(15);
	
	DeleteTask_(task_cam);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット7
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");		// 5F
	PlaySE_("SE_DEM_026");	// ■SE:集中線
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", CAMERA_DEF);
	
	SetPointPos_(ittaburu, "npc_ittaburu004");
	
	WaitTask(task_cam);
	
	Wait_(9);
	
	DeleteEffect_(efc_cam);
	
	//===============================================
	// *イッタブル
	// 「おい！　貴様……。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ITABURU");
	ShowMsg_("DEMO_430_MSG_070");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット8
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetPointCameraEye_("cameye003");
	SetPointCameraTarget_("camtgt003");
	InitSilhouetteWidth_(player, 0.7);

	Wait_(10);
	
	efc_player = SetSelectBoneEffectSetOffset_("ef712_10_emo_surprise01", player, ATTACH_EFFECT1, Vec3(1.9, 2.5, 0.0));
	PlaySE_("SE_DEM_053");
	SetEffectScale_(efc_player, 1.5);
	
	Wait_(75);
	
	DeleteEffect_(efc_player);

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット9
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetPointCameraEye_("cameye004");
	SetPointCameraTarget_("camtgt004");

	SetPointPos_(ittaburu, "npc_ittaburu004");
	
	Wait_(20);
	
	SetMotion_(ittaburu, MOT_WALK, BLEND_L);
	task_ittaburu = Task_AnimeMove_(ittaburu, "anm_ittaburu004");	// 30F
	Istep = Task_ChangeStepSe(ittaburu, "SE_FLD_052", 15);
	
	Wait_(20);
	
	SetMotion_(player, MOT_WALK, BLEND_L);
	task_player = Task_RotateToDir_(player, 45, 2.5);
	
	WaitTask(task_ittaburu);
	DeleteTaskStepSe(ittaburu, Istep);
	
	SetMotion_(ittaburu, MOT_WAIT, BLEND_L);
	
	WaitTask(task_player);
	
	SetMotion_(player, MOT_WAIT, BLEND_L);
	
	Wait_(35);
	
	//===============================================
	// *看守モンスターＤ
	// 「…………。
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_430_MSG_080");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	Wait_(15);
	
	//===============================================
	// *イッタブル
	// 「…………。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ITABURU");
	ShowMsg_("DEMO_430_MSG_090");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	Wait_(80);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット10
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetPointCameraEye_("cameye005");
	SetPointCameraTarget_("camtgt005");
	
	SetVisible(ittaburu, false);
	
	SetScaleSilhouette(gaikotu, SCALE.N, 0.5);
	
	Wait_(50);
	
	efc_gaikotu = SetPointWorldEffect_("ef741_03_div_nor_sleep", "efc_sleep000");
	SetEffectScale_(efc_gaikotu, 0.24);
	PlaySE_("SE_DEM_081");
	
	Wait_(100);
	
	DeleteEffect_(efc_gaikotu);
	
	SetVisible(ittaburu, true);
	
	SetScaleSilhouette(gaikotu, SCALE.N, SILHOUETTE_WIDTH.N);

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット11
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");		// 5F
	PlaySE_("SE_DEM_026");	// ■SE:集中線
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", CAMERA_DEF);
	
	SetVisible(gaikotu, false);
	
	SetPointPos_(player, "player001");
	SetPointPos_(ittaburu, "npc_ittaburu005");
	
	WaitTask(task_cam);
	
	Wait_(7);
	
	DeleteEffect_(efc_cam);
	
	//===============================================
	// *イッタブル
	// 「こ……こんな時に　立って寝る奴があるか！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ITABURU");
	ShowMsg_("DEMO_430_MSG_100");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(ittaburu, MOT_SWORD_ACTUATE, BLEND_L);
	task_ittaburu = Task_ChangeMotion_(ittaburu, MOT_WAIT, BLEND_L);
	Wait_(20);
	
	PlaySE_("SE_DEM_014");
	Wait_(14);
	
	SetMotion_(gaikotu, gaikotu_blow_off, BLEND_L);
	SetMotionSpeed_(gaikotu, 0.5);
	task_gaikotu = Task_AnimeMoveNoDir_(gaikotu, "anm_gaikotu000");	// 36F
	SetVisible(gaikotu, true);

	Wait_(4);

	PlaySE_("SE_DEM_082");											//騎士を殴る
	task_cam = Task_AnimeMoveCamera_("anmeye005", "anmtgt005");		// 15F
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", CAMERA_DEF);
	efc_cam2 = SetCameraEffect_("ef741_02_div_nor_hit", CAMERA_DEF);
	
	Wait_(27);
	DeleteEffect_(efc_cam);
	
	Wait_(5);
	PlaySE_("SE_FLD_207");
	efc_smoke = SetPointWorldEffect_("ef721_02_nat_smoke_n02", "efc_smoke000");

	WaitMotion(gaikotu);
	SetMotion_(gaikotu, gaikotu_blow_off_L, BLEND_L);
	
	Wait_(25);
	
	//===============================================
	// *イッタブル
	// 「ともかく　我らはエリを正して
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ITABURU");
	ShowMsg_("DEMO_430_MSG_110");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	DeleteTask_(task_ittaburu);
	DeleteTask_(task_cam);
	DeleteTask_(task_gaikotu);
	
	SetMotionSpeed_(gaikotu, 1.00);

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット12
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetPointCameraEye_("cameye006");
	SetPointCameraTarget_("camtgt006");
	
	SetPointPos_(player, "player001");
	SetPointPos_(ittaburu, "npc_ittaburu005");
	
	SetVisible(gaikotu, false);
	
	SetMotion_(ittaburu, MOT_WALK, BLEND_N);
	task_ittaburu = Task_RotateToDir_(ittaburu, -135, 2.85);
	Wait_(10);
	
	PlaySE_("SE_FLD_052");
	WaitTask(task_ittaburu);
	
	SetMotion_(ittaburu, MOT_WAIT, BLEND_L);
	Wait_(5);
	
	//===============================================
	// *イッタブル
	// 「貴様も　わかっておるな？
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ITABURU");
	ShowMsg_("DEMO_430_MSG_120");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(player, player_shake_head_1_L, BLEND_L);
	
	Wait_(59);
	
	SetMotion_(player, MOT_WAIT, BLEND_L);
	
	Wait_(50);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット13
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetPointCameraEye_("cameye007");
	SetPointCameraTarget_("camtgt007");
	
	SetPointPos_(ittaburu, "npc_ittaburu006");
	
	//===============================================
	// *イッタブル
	// 「む？　貴様……見かけない　顔であるな？
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ITABURU");
	ShowMsg_("DEMO_430_MSG_130");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット14
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetPointCameraEye_("cameye008");
	SetPointCameraTarget_("camtgt008");
	
	SetPointPos_(player, "player001");
	
	Wait_(5);
	
	SetMotion_(player, player_shake_head_2_L, BLEND_L);
	
	Wait_(62);
	
	SetMotion_(player, MOT_WAIT, BLEND_L);
	
	Wait_(50);

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット15
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetPointCameraEye_("cameye006");
	SetPointCameraTarget_("camtgt006");

	SetPointPos_(player, "player001");
	SetPointPos_(ittaburu, "npc_ittaburu006");
	
	SetVisible(gaikotu, false);
	
	//===============================================
	// *イッタブル
	// 「ふむ……ワガハイの　覚え違いであるか？
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ITABURU");
	ShowMsg_("DEMO_430_MSG_140");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(player, player_shake_head_1_L, BLEND_L);
	
	Wait_(42);
	PlaySE_("SE_DEM_077");
	Wait_(1);
	SetMotion_(player, player_rigidity_L, BLEND_L);
	
	Wait_(18);
	efc_player = SetSelectBoneEffectSetOffset_("ef712_10_emo_surprise01", player, ATTACH_EFFECT1, Vec3(1.0, 2.25, 0.0));
	PlaySE_("SE_DEM_053");
	SetEffectScale_(efc_player, 1.8);
	
	Wait_(77);

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット16
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye006", "anmtgt006");		// 90F
	
	SetPointPos_(ittaburu, "npc_ittaburu006");
	
	Wait_(30);
	
	//===============================================
	// *イッタブル
	// 「……ビリ？　何が破けた音であるか？
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ITABURU");
	ShowMsg_("DEMO_430_MSG_150");
	KeyInputWait_();
	
	//===============================================
	// *イッタブル
	// 「中に　何がいるのであるか！？
	//-----------------------------------------------
	ShowMsg_("DEMO_430_MSG_160");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	WaitTask(task_cam);
	
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 20);
	WaitFade_();

	Wait_(10);
	PlaySE_("SE_DEM_078");
	Wait_(45);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット17
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye007", "anmtgt007");		// 120F
	DeleteTask_(task_cam);
	
	SetVisible(player, false);
	SetPointPos_(player, "player002");

	Wait_(55);
	
	SetVisible(player2, true);
	SetPointPos_(player2, "player001");
	SetMotion_(player2, player2_caution01_L, BLEND_N);
	
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);
	WaitFade_();
	
	Wait_(15);
	
	//===============================================
	// *イッタブル
	// 「き…貴様は…………
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ITABURU");
	ShowMsg_("DEMO_430_MSG_170");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	task_cam = Task_AnimeMoveCamera_("anmeye007", "anmtgt007");		// 120F

	WaitTask(task_cam);
	
	Wait_(25);
	
	task_cam = Task_AnimeMoveCamera_("anmeye008", "anmtgt008");		// 5F
	PlaySE_("SE_DEM_026");	// ■SE:集中線
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", CAMERA_DEF);

	WaitTask(task_cam);
	
	Wait_(9);
	
	DeleteEffect_(efc_cam);
	
	//===============================================
	// *イッタブル
	// 「アンセス！！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ITABURU");
	ShowMsg_("DEMO_430_MSG_180");
	KeyInputWait_();
	
	//===============================================
	// *イッタブル
	// 「どうして　貴様が　ここにいる！？
	//-----------------------------------------------
	ShowMsg_("DEMO_430_MSG_190");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetVisible(gaikotu, true);
	SetMotion_(gaikotu, MOT_WAIT, BLEND_N);
	
	SetPointPos_(samayou, "npc_samayou002");
	SetPointPos_(ookiduti, "npc_ookiduti002");
	SetPointPos_(gaikotu, "npc_gaikotu002");
	SetPointPos_(knight, "npc_knight002");
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット18
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye011", "anmtgt011");		// 180F
	
	//===============================================
	// *イッタブル
	// 「いや！　そんなことは　どうでもいい！ 
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ITABURU");
	ShowMsg_("DEMO_430_MSG_200");
	KeyInputWait_();
	
	//===============================================
	// *イッタブル
	// 「このイッタブルさまのナワバリから…… 
	//-----------------------------------------------
	ShowMsg_("DEMO_430_MSG_210");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	task_gaikotu = uTask_MoveSetMotionAndSpeed(gaikotu, "npc_gaikotu003", 0.5);
	Wait_(3);
	
	task_samayou = uTask_MoveSetMotionAndSpeed(samayou, "npc_samayou003", 0.5);
	Wait_(4);
	
	task_player = Task_AnimeMoveNoDir_(player2, "anm_player001");
	SetMotion_(player2, player2_back_L, BLEND_M);
	Wait_(1);
	
	task_knight = uTask_MoveSetMotionAndSpeed(knight, "npc_knight003", 0.5);
	Wait_(3);
	
	task_ookiduti = uTask_MoveSetMotionAndSpeed(ookiduti, "npc_ookiduti003", 0.5);
	Wait_(5);
	
	WaitTask(task_gaikotu);
	SetMotion_(gaikotu, MOT_WAIT, BLEND_M);
	WaitTask(task_samayou);
	SetMotion_(samayou, MOT_WAIT, BLEND_M);
	WaitTask(task_knight);
	SetMotion_(knight, MOT_WAIT, BLEND_M);
	WaitTask(task_ookiduti);
	SetMotion_(ookiduti, MOT_WAIT, BLEND_M);
	
	SetMotion_(player2, player2_caution01_L, BLEND_XL);
	
	//===============================================
	// *イッタブル
	// 「さあ！　おとなしくするのである！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ITABURU");
	ShowMsg_("DEMO_430_MSG_220");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetVisible(gaikotu, false);
	SetVisible(samayou, false);
	DeleteTask_(task_cam);
	DeleteTask_(task_player);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット19
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	InitSilhouetteWidth_(ittaburu, 0.65);
	task_cam = Task_AnimeMoveCamera_("anmeye012", "anmtgt012");		// 5F
	PlaySE_("SE_DEM_026");	// ■SE:集中線
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", CAMERA_DEF);
	
	SetMotion_(ittaburu, ittaburu_Pressure, BLEND_M);
	task_ittaburu = Task_ChangeMotion_(ittaburu, ittaburu_Pressure_L, BLEND_M);
	
	WaitTask(task_cam);
	Wait_(10);
	DeleteEffect_(efc_cam);
	Wait_(5);
	
	//===============================================
	// *イッタブル
	// 「かかれいっ！　取り押さえるのであるっ！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ITABURU");
	ShowMsg_("DEMO_430_MSG_230");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	DeleteTask_(task_cam);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット20
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetMotion_(player2, player2_caution02_L, BLEND_XL);
	task_cam = Task_AnimeMoveCamera_("anmeye013", "anmtgt013");		// 5F
	SetStepSe_(player2, SILENT_STEP_SE);							// 足音を無音にする

	SetPointPos_(player2, "player001");
	Wait_(30);
	task_player = Task_AnimeMoveNoDir_(player2, "anm_player002");
	SetMotion_(player2, player2_back_L, 20);
	Wait_(30);	
	PlaySE_("SE_FLD_016");											//■SE:主　足音
	Wait_(30);	
	PlaySE_("SE_FLD_016");											//■SE:主　足音
	Wait_(30);	
	PlaySE_("SE_FLD_016");											//■SE:主　足音
	
	SetVisible(player2, false);
	SetVisible(knight, false);
	SetVisible(ookiduti, false);
	SetVisible(gaikotu, true);
	SetVisible(samayou, true);
	SetPointPos_(gaikotu, "npc_gaikotu004");
	SetPointPos_(samayou, "npc_samayou004");
	
	DeleteTask_(task_cam);
	ResetStepSe_(player2);
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット21
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	InitSilhouetteWidth_(ittaburu, 1.5);
	SetPointCameraEye_("cameye009");
	SetPointCameraTarget_("camtgt009");
	PlaySE_("SE_DEM_140");											//■SE:看守の攻撃
	
	// 剣を掲げる
	SetMotion_(gaikotu, MOT_ATTACK, BLEND_XL);
	SetMotion_(samayou, MOT_ATTACK, BLEND_XL);
	SetMotionSpeed_(gaikotu, 0.6);
	SetMotionSpeed_(samayou, 0.6);
	Wait_(20);
	
	// 振りかぶる
	SetMotionSpeed_(samayou, 0.4);
	SetMotionSpeed_(gaikotu, 0.4);
	Wait_(5);
	SetMotionSpeed_(samayou, 0.3);
	SetMotionSpeed_(gaikotu, 0.3);
	Wait_(5);
	SetMotionSpeed_(samayou, 0.2);
	SetMotionSpeed_(gaikotu, 0.2);
	Wait_(5);
	SetMotionSpeed_(samayou, 0.1);
	SetMotionSpeed_(gaikotu, 0.1);
	Wait_(10);
	
	StartBlurEffect_();
	
	// 振り下ろす
	SetMotionSpeed_(samayou, 0.2);
	SetMotionSpeed_(gaikotu, 0.2);
	Wait_(2);
	SetMotionSpeed_(samayou, 0.3);
	SetMotionSpeed_(gaikotu, 0.3);
	Wait_(2);
	SetMotionSpeed_(samayou, 0.4);
	SetMotionSpeed_(gaikotu, 0.4);
	Wait_(2);
	SetMotionSpeed_(samayou, 0.5);
	SetMotionSpeed_(gaikotu, 0.5);
	Wait_(2);
	
	//=====
	SetFade_(FADE_OUT, FADE_COLOR_WHITE, 8);
	WaitFade_();
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット22
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye014", "anmtgt014");		// 17F
	
	EndBlurEffect_();
	SetMotionSpeed_(samayou, 0.3);
	SetMotionSpeed_(gaikotu, 1.15);
	Wait_(10);
	
	SetVisible(player2, true);
	SetDir_(player2, 0);
	SetMotion_(player2, MOT_JUMP_DOWN, BLEND_N);
	task_player = Task_AnimeMoveNoDirNoFit_(player2, "anm_player000");		// 17F
	
	SetVisible(knight, true);
	SetVisible(ookiduti, true);
	SetPointPos_(ittaburu, "npc_ittaburu008");
	SetPointPos_(gaikotu, "npc_gaikotu005");
	SetPointPos_(samayou, "npc_samayou005");
	SetDir_(ittaburu, -160);
	SetDir_(knight, -130);
	
	SetMotionSpeed_(samayou, 0.1);
	SetMotionSpeed_(gaikotu, 0.1);
	
	SetFade_(FADE_IN, FADE_COLOR_WHITE, 5);
	Wait_(5);
	//=====
	
	SetMotion_(player2, player2_hero_landing, BLEND_L);
	Wait_(7);
	
	PlaySE_("SE_FLD_021");									//主人公が床に着地したとき
	efc_player = SetPosWorldEffect_("ef721_02_nat_smoke_n02", GetPos_(player2));
	WaitTask(task_player);
	
	SetMotion_(player2, MOT_RUN, BLEND_XL);
	Wait_(5);
	task_player = Task_RotateToDir_(player2, -179, ROTATE_DEMO_DEF*2);
	WaitTask(task_player);
	
	task_player = Task_MoveForward_(player2, 1.0, true);
	Wait_(20);
	DeleteTask_(task_player);
	
	SetMotion_(samayou, MOT_WAIT, BLEND_XL);
	SetMotion_(gaikotu, MOT_WAIT, BLEND_XL);
	SetMotion_(knight, MOT_WAIT, BLEND_N);
	SetMotion_(ookiduti, MOT_WAIT, BLEND_N);
	SetMotionSpeed_(samayou, 1.0);
	SetMotionSpeed_(gaikotu, 1.0);
	SetMotionSpeed_(knight, 1.0);
	SetMotionSpeed_(ookiduti, 1.0);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット23
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye009", "anmtgt009");		// 90F
	
	SetPointPos_(player2, "player003");
	task_player = Task_MoveForward_(player2, 0.6, true);
	
	Wait_(35);
	
	task_player2 = Task_RotateToDir_(player2, 90, 2.85);

	Wait_(110);
	
	DeleteTask_(task_cam);
	DeleteTask_(task_player);
	DeleteTask_(task_player2);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット24
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye010", "anmtgt010");		// 120F
	
	SetMotion_(gaikotu, MOT_WAIT, BLEND_N);
	SetVisible(gaikotu, true);
	
	SetPointPos_(ittaburu, "npc_ittaburu007");
	SetPointPos_(samayou, "npc_samayou001");
	SetPointPos_(ookiduti, "npc_ookiduti001");
	SetPointPos_(knight, "npc_knight001");
	SetPointPos_(gaikotu, "npc_gaikotu001");
	
	Wait_(30);
	
	//===============================================
	// *イッタブル
	// 「逃がしはせん……逃がしはせんぞぉ！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ITABURU");
	ShowMsg_("DEMO_430_MSG_240");
	KeyInputWait_();
	
	SetMotion_(ittaburu, ittaburu_Pressure, BLEND_L);
	Wait_(15);
	SetDir_(ittaburu, 179);
	WaitMotion(ittaburu);
	SetMotion_(ittaburu, ittaburu_Pressure_L, BLEND_L);
	
	//===============================================
	// *イッタブル
	// 「あのお方が来る前に　試運転である！
	//-----------------------------------------------
	ShowMsg_("DEMO_430_MSG_250");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	WaitTask(task_cam);
	
	Wait_(15);
	
	EndDemo(FADE_COLOR_BLACK);
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		移動＋モーション＋モーション速度設定
//------------------------------------------------
//	引数	: chr	キャラクターＩＤ
//			: pos	ノード名
//			: spd	移動速度
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTask_MoveSetMotionAndSpeed(chr, pos, spd)
{
	local task;
	
	task = Task_MoveToPointSetSpeed_(chr, pos, spd);
	SetMotion_(chr, MOT_WALK, BLEND_L);
	SetMotionSpeed_(chr, 0.7);
	
	return task;
}
