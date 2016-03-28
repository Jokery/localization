//=============================================
//
//		demo212[故人から受け継いだもの_2(過去映像-監獄)]
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
	local task_cam, task_rena, task_man0, task_man1, task_woman, task_birdy;
	local task_smyou0, task_smyou1, task_smyou2;
	local efc_cam, efc_player;
	local frame_sum = 0;							// 総フレーム数

// ▼リソース読込
	// ギミック
	local model_transfer = ReadGimmick_("o_dem_00");	// 転送装置
	// キャラクター
	local anses = GetPlayerId_();					// 主人公（アンセス）
	local model_rena = ReadNpc_("n007");			// レナーテ
	local model_man0 = ReadNpc_("n012");			// レジスタンス男性１
	local model_woman = ReadNpc_("n013");			// レジスタンス女性
	local model_birdy = ReadNpc_("n019");			// バーディ
	local model_man1 = ReadNpc_("n020");			// レジスタンス男性２
	local model_smyou = ReadNpc_("m111_00");		// さまようよろい
	// エフェクト
	LoadEffect_("ef741_02_div_nor_hit");			// ヒットエフェクト
	LoadEffect_("ef733_01_sym_shuchusen01");				// 集中線
	// レイアウト
	LoadLayout_("noise");							//ノイズ

// ▼配置
	// 転送装置
	local transfer = ArrangePointGimmick_("o_dem_00", model_transfer, "obj_transfer000");
	
	// 主人公（アンセス）
	SetPointPos_(anses, "npc_anses000");
	SetStepSe_(anses, SILENT_STEP_SE);
	// レナーテ
	local rena = ArrangePointNpc_(model_rena, "npc_rena000");
	SetStepSe_(rena, SILENT_STEP_SE);
	// レジスタンス男性１
	local man0 = ArrangePointNpc_(model_man0, "npc_man000");
	SetStepSe_(man0, SILENT_STEP_SE);
	// レジスタンス男性２
	local man1 = ArrangePointNpc_(model_man1, "npc_man100");
	SetStepSe_(man1, SILENT_STEP_SE);
	// レジスタンス女性
	local woman = ArrangePointNpc_(model_woman, "npc_woman000");
	SetStepSe_(woman, SILENT_STEP_SE);
	// バーディ
	local birdy = ArrangePointNpc_(model_birdy, "npc_birdy000");
	SetPointPosNoFit_(birdy, "npc_birdy000");
	SetStepSe_(birdy, SILENT_STEP_SE);
	AttachObject_(birdy, anses, ATTACH_EFFECT2);
	// さまようよろい１～３
	local smyou0 = ArrangePointNpc_(model_smyou, "npc_smyou000");
	local smyou1 = ArrangePointNpc_(model_smyou, "npc_smyou100");
	local smyou2 = ArrangePointNpc_(model_smyou, "npc_smyou200");
	SetScaleSilhouette(smyou0, SCALE.M, SILHOUETTE_WIDTH.M);
	SetScaleSilhouette(smyou1, SCALE.M, SILHOUETTE_WIDTH.M);
	SetScaleSilhouette(smyou2, SCALE.M, SILHOUETTE_WIDTH.M);
	SetStepSe_(smyou0, SILENT_STEP_SE);
	SetStepSe_(smyou1, SILENT_STEP_SE);
	SetStepSe_(smyou2, SILENT_STEP_SE);

// ▼非常駐モーション読込
	// 主人公（アンセス）
	local anses_ride00_L = ReadMotion_(anses, "Player_ride00_L");				// ライドL
	local anses_glide_L = ReadMotion_(anses, "Player_flight_glide_L");			// グライドL
	local anses_glide_right_L = ReadMotion_(anses, "Player_flight_glide_right_L");	// 飛行（滑空）右向き
	// レジスタンス男性１・２
	local man0_run_L = ReadMotion_(man0, "n012_run_L");							// 走るL
	local man0_guard_L = ReadMotion_(man0, "n012_guard_L");						// 構えL
	local man1_run_L = ReadMotion_(man1, "n012_run_L");							// 走るL
	local man1_guard_L = ReadMotion_(man1, "n012_guard_L");						// 構えL
	local man1_turn = ReadMotion_(man1, "n012_turn");							// 振り向く
	// レジスタンス女性
	local woman_run_L = ReadMotion_(woman, "n013_run_L");						// 走るL
	local woman_guard_L = ReadMotion_(woman, "n013_guard_L");					// 構えL
	// レナーテ
	local rena_run_L = ReadMotion_(rena, "n007_run_L");							// 走るL
	local rena_caution_L = ReadMotion_(rena, "n007_caution_L");					// 警戒L
	local rena_look_down_L = ReadMotion_(rena, "n007_look_down_L");				// うつむく
	local rena_look_up_L = ReadMotion_(rena, "n007_look_up_L");					// 上を向く
	local rena_look_right_L = ReadMotion_(rena, "n007_look_right_L");			// 右を向く
	local rena_look_up02_L = ReadMotion_(rena, "n007_look_up02_L");			// 右を向く	

	// バーディ
	local birdy_glide_L = ReadMotion_(birdy, "n019_flight_glide_L");			// 滑空
	local birdy_glide_attack = ReadMotion_(birdy, "n019_glide_attack");			// 登場→敵に突撃
	// さまようよろい
	local smyou_fall0 = ReadMotion_(smyou0, "m111_00_fall");					// 崖から落ちる
	local smyou_fall1 = ReadMotion_(smyou1, "m111_00_fall");					// 崖から落ちる
	local smyou_fall2 = ReadMotion_(smyou2, "m111_00_fall");					// 崖から落ちる

// ▼セピア調
	ChangeColorSepia();

// ▼モーション設定
	SetMotion_(anses, anses_ride00_L, BLEND_N);

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	SetFadePlane_(FADE_PLANE.PLANE_3D);
	SetFade_(FADE_OUT, FADE_COLOR_WHITE, FADE_SHORT);
	
	SetLayoutAnime_("noise_in", false);
	PlayBgm_("BG_AMBI_016");
	WaitLayoutAnime();
	SetLayoutAnime_("noise_out", false);
	WaitLayoutAnime();
	
	//===============================================
	// ■なぞの少女
	// 「早く　外に逃げて……！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MYSTERYGIRL");
	ShowMsg_("DEMO_212_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(woman, woman_run_L, BLEND_N);
	task_woman = Task_MoveForward_(woman, 1.0, true);
	
	// ▼カット１＠レジスタンス走って逃げる～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");		// 120F
	
//	StartDemo(FADE_COLOR_WHITE);
	SetFade_(FADE_IN, FADE_COLOR_WHITE, FADE_DEF);
	WaitFade_();
	
	SetMotion_(man0, man0_run_L, BLEND_N);
	task_man0 = Task_MoveForward_(man0, 1.0, true);
	Wait_(20);
	
	SetMotion_(man1, man1_run_L, BLEND_N);
	task_man1 = Task_MoveForward_(man1, 1.0, true);
	Wait_(25);
	
	SetMotion_(rena, rena_run_L, BLEND_N);
	task_rena = Task_MoveForward_(rena, 1.0, true);
	
	WaitTask(task_cam);
	DeleteAllTask_();
	
	SetPointPos_(man0, "npc_man001");
	SetPointPos_(man1, "npc_man101");
	SetPointPos_(woman, "npc_woman001");
	SetPointPos_(rena, "npc_rena001");
	SetMotion_(man0, man0_guard_L, BLEND_N);
	SetMotion_(man1, man1_guard_L, BLEND_N);
	SetMotion_(woman, woman_guard_L, BLEND_N);
	
	// ▼カット２＠敵が立ちふさがる～～～～～～～～～～～～～～
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	
	SetMotion_(rena, rena_run_L, BLEND_N);
	task_rena = Task_MoveForward_(rena, 1.0, true);
	Wait_(12);
	
	DeleteTask_(task_rena);
	SetMotion_(rena, rena_caution_L, BLEND_M);
	Wait_(60);
	
	// ▼カット３＠レジスタンス男女～～～～～～～～～～～～～～
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	
	//===============================================
	// *レジスタンスＡ（男）
	// 「先回りされてるぞ！
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_212_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	//===============================================
	// *レジスタンスＢ（女）
	// 「なんてことなの！
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_212_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	// ▼カット４＠レジスタンスとレナーテ～～～～～～～～～～～
	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");
	
	SetMotionSpeed_(man1, 2.0);
	SetMotion_(man1, man1_turn, BLEND_XL);		// 振り向く
	Wait_(25);
	SetMotionSpeed_(man1, 1.0);
	SetMotion_(man1, man1_guard_L, BLEND_L);	// 構えL
	
	//===============================================
	// *レジスタンスＣ（男）
	// 「さっきの部屋のほうにも　来てるぞ！
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_212_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	// ▼カット５＠レナーテズームイン～～～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");		// 120F
	
	SetMotion_(rena, rena_look_down_L, BLEND_XL);	// うつむき待機
	Wait_(15);
	
	//===============================================
	// ■なぞの少女
	// 「そんな……！　これまでなの……？
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MYSTERYGIRL");
	ShowMsg_("DEMO_212_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	Wait_(60);

	//===============================================
	// *アンセス
	// 「あきらめるな！
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_212_MSG_060");
	KeyInputWait_();
	//===============================================

	//===============================================
	// *アンセス
	// 「いくぞっ　バーディ！！
	//-----------------------------------------------
	ShowMsg_("DEMO_212_MSG_070");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(rena, rena_look_up02_L, BLEND_L);
	Wait_(20);
	
	DeleteTask_(task_cam);
	SetMotion_(anses, anses_glide_L, BLEND_N);
	SetMotion_(birdy, birdy_glide_attack, BLEND_N);		// 登場→敵に突撃
	
	// ▼カット６＠バーディ登場～～～～～～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");		// 310F
	SetMotion_(rena, rena_caution_L, BLEND_M);
	Wait_(110);
	
	// さまようよろい、バーディの方を向く
	task_smyou1 = Task_WalkAroundToDir(smyou1, -90, ROTATE_DEMO_DEF/2);
	Wait_(10);
	task_smyou0 = Task_WalkAroundToDir(smyou0, -90, ROTATE_DEMO_DEF/2);
	Wait_(10);
	task_smyou2 = Task_WalkAroundToDir(smyou2, -90, ROTATE_DEMO_DEF/2);
	
	// 向いた後は待機モーションにする
	frame_sum += WaitTask(task_smyou1);
	SetMotion_(smyou1, MOT_WAIT, BLEND_M);
	frame_sum += WaitTask(task_smyou0);
	SetMotion_(smyou0, MOT_WAIT, BLEND_M);
	frame_sum += WaitTask(task_smyou2);
	SetMotion_(smyou2, MOT_WAIT, BLEND_M);
	Wait_(75-frame_sum);
	
	// バーディ突撃
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", 0);		// 集中線
	Wait_(13);
	DeleteEffect_(efc_cam);
	Wait_(8);
	
	// さまようよろい１～３転落
	uFallEnemy(smyou1, smyou_fall1, "anm_smyou100");
	Wait_(3);
	uFallEnemy(smyou0, smyou_fall0, "anm_smyou000");
	Wait_(3);
	uFallEnemy(smyou2, smyou_fall2, "anm_smyou200");
	Wait_(15);
	SetVisible(anses, false);		// 主人公チラつき防止
	
	WaitTask(task_cam);
	
	DeleteAllTask_();
	SetVisible(smyou0, false);
	SetVisible(smyou1, false);
	SetVisible(smyou2, false);
	
	SetMotion_(birdy, birdy_glide_L, BLEND_N);
	SetScaleSilhouette(birdy, SCALE.N, SILHOUETTE_WIDTH.N);
	task_birdy = Task_AnimeMoveNoFit_(birdy, "anm_birdy000");
	
	// ▼カット７＠バーディカメライン～～～～～～～～～～～～～
	SetPointCameraEye_("cameye003");
	SetPointCameraTarget_("camtgt003");
	Wait_(3);
	SetVisible(anses, true);
	SetMotion_(anses, anses_glide_L, BLEND_M);
	WaitTask(task_birdy);
		
	//===============================================
	// *アンセス
	// 「今がチャンスだ！　みんな走れっ！
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_212_MSG_080");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	// ▼カット８＠レジスタンス達カメラアウト～～～～～～～～～
	SetPointCameraEye_("cameye004");
	SetPointCameraTarget_("camtgt004");
	
	SetMotion_(woman, woman_run_L, BLEND_L);
	task_woman = Task_MoveForward_(woman, 1.0, true);
	Wait_(10);
	
	SetMotion_(man0, man0_run_L, BLEND_L);
	task_man0 = Task_MoveForward_(man0, 1.0, true);
	Wait_(10);
	
	SetMotion_(man1, man1_run_L, BLEND_L);
	task_man1 = Task_MoveForward_(man1, 1.0, true);
	Wait_(10);
	
	SetMotion_(rena, rena_run_L, BLEND_L);
	task_rena = Task_MoveToPointSetSpeed_(rena, "npc_rena002", 2.0);
	WaitTask(task_rena);
	SetMotion_(rena, MOT_WAIT, BLEND_L);
	Wait_(10);
	SetMotion_(rena, rena_look_right_L, BLEND_XL);		// 右を向く
	Wait_(45);
	
	SetMotion_(rena, rena_look_up_L, BLEND_N);			// 上を向く
	SetDir_(rena, 100);
	
	// ▼カット９＠レナーテとアンセス～～～～～～～～～～～～～
	SetPointCameraEye_("cameye005");
	SetPointCameraTarget_("camtgt005");
	
	//===============================================
	// *アンセス
	// 「どうした？　お前も急げよ。
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_212_MSG_090");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(rena, MOT_WAIT, BLEND_N);
	
	// ▼カット10＠レナーテＵＰ～～～～～～～～～～～～～～～～
	SetPointCameraEye_("cameye006");
	SetPointCameraTarget_("camtgt006");
	
	SetMotion_(rena, rena_look_down_L, BLEND_XL);		// うつむく
	Wait_(45);
	SetMotion_(rena, MOT_WAIT, BLEND_L);
	Wait_(10);
	
	//===============================================
	// ■なぞの少女
	// 「……ありがとう　助けてくれて。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MYSTERYGIRL");
	ShowMsg_("DEMO_212_MSG_100");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetFace_(anses, "Face_right");	
	
	task_rena = Task_WalkAroundToDir(rena, 180, ROTATE_DEMO_DEF/2);
	WaitTask(task_rena);
	SetMotion_(rena, rena_run_L, BLEND_L);
	task_rena = Task_MoveForward_(rena, 1.0, true);
	Wait_(45);
	DeleteTask_(task_rena);

	// ▼カット11＠アンセスＵＰ～～～～～～～～～～～～～～～～
	SetPointCameraEye_("cameye007");
	SetPointCameraTarget_("camtgt007");
	
	SetMotion_(anses, anses_glide_right_L, BLEND_N);		// 飛行（滑空）右向き
	Wait_(60);
	
	StopBgm_(3);
	PlaySE_("SE_DEM_050");
	SetLayoutAnime_("noise_in", false);												//ノイズ
	Wait_(30);
	
	SetFadePlane_(FADE_PLANE.PLANE_NORMAL);
	EndDemo(FADE_COLOR_WHITE);
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		さまようよろい　崖から落ちる処理
//------------------------------------------------
//	引数	: id	キャラクターID
//			: mot	モーション名
//			: pos	ノード名
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uFallEnemy(id, mot, pos)
{
	local task;
	
	SetSelectBoneEffect_("ef741_02_div_nor_hit", id, ATTACH_EFFECT1);
	SetMotion_(id, mot, BLEND_M);
	task = Task_AnimeMoveNoDir_(id, pos);
}
