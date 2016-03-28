//=============================================
//
//		demo830[人類の復活、そして]
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
	local task_cam, task_m_regi, task_man, task_nocho;

// ▼リソース読込
	// キャラクター
	local id_nocho_m	 = ReadNpc_("n000");		// ノチョーラ♂
	local id_jack		 = ReadNpc_("n001");		// ジャック
	local id_queen		 = ReadNpc_("n005");		// クイーン
	local id_m_regi		 = ReadNpc_("n012");		// レジスタンス 男性
	local id_f_regi		 = ReadNpc_("n013");		// レジスタンス 女性
	local id_man		 = ReadNpc_("n015");		// 移民 男性
	local id_girl		 = ReadNpc_("n016");		// 移民 女性
	local id_boy		 = ReadNpc_("n017");		// 移民 男の子
	local id_aroma		 = ReadNpc_("n018");		// アロマ
	// エフェクト
	LoadEffect_("ef712_04_emo_joy01");				// 喜び
	LoadEffect_("ef712_13_emo_sweat01");			// 汗
	LoadEffect_("ef712_10_emo_surprise01");			// 「！」

// ▼配置
	// ノチョーラ♂
	local nochoS = ArrangePointNpc_(id_nocho_m,"nocho000");
	SetStepSe_(nochoS, SILENT_STEP_SE);
	// ジャック
	local jack = ArrangePointNpc_(id_jack,"jack000");
	SetStepSe_(jack, SILENT_STEP_SE);
	// クイーン
	local queen = ArrangePointNpc_(id_queen,"queen");
	SetStepSe_(queen, SILENT_STEP_SE);
	// レジスタンス 男性
	local m_regi = ArrangePointNpc_(id_m_regi,"m_regi000");
	SetStepSe_(m_regi, SILENT_STEP_SE);
	// レジスタンス 女性
	local f_regi = ArrangePointNpc_(id_f_regi,"f_regi");
	SetStepSe_(f_regi, SILENT_STEP_SE);
	// 移民 男性
	local man = ArrangePointNpc_(id_man,"man000");
	SetStepSe_(man, SILENT_STEP_SE);
	// 移民 男の子
	local boy = ArrangePointNpc_(id_boy,"boy");
	SetStepSe_(boy, SILENT_STEP_SE);
	// 移民 女性
	local girl = ArrangePointNpc_(id_girl,"girl");
	SetStepSe_(girl, SILENT_STEP_SE);
	// アロマ
	local aroma = ArrangePointNpc_(id_aroma,"aroma");
	SetStepSe_(aroma, SILENT_STEP_SE);

// ▼非常駐モーション読込
	//ノチョーラ用
	local n_jumpS = ReadMotion_(nochoS, "n000_rejoice");				//通常会話→ジャンプ
	local n_jumpLS = ReadMotion_(nochoS, "n000_rejoice_L");				//ジャンプL
	local nS_run = ReadMotion_(nochoS, "n001_run_L");					//うれしそうにはしる
	
	//ジャック用
	local j_bow = ReadMotion_(jack, "n001_bow");						//通常会話→頭を下げる
	local j_talk = ReadMotion_(jack, "n001_talk01");					//頭を下げる→通常会話
	local j_talk02_L = ReadMotion_(jack, "n001_talk02_L");				//会話（嬉しそう）L
	
	//女の子
	local girl_hand_L = ReadMotion_(girl, "n016_shake_the_hand_L");		//手を振るL
	
	//男の子
	local boy_hand_L = ReadMotion_(boy, "n017_shake_the_hand_L");		//手を振るL
	
	//アロマモーション
	local a_ue = ReadMotion_(aroma, "n018_look_up_L");					//上向く
	
// ▼モーション設定
	SetMotion_(nochoS, n_jumpLS, BLEND_N);
	SetMotion_(jack, j_talk02_L, BLEND_N);
	SetMotion_(boy, boy_hand_L, BLEND_N);
	SetMotion_(girl, girl_hand_L, BLEND_N);
	SetMotion_(aroma, a_ue, BLEND_N);
	
// ▼カメラ設定
	SetPointCameraEye_("001_cameye");
	SetPointCameraTarget_("001_camtgt");

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	//カット１
	Wait_(30);
	
	SetPointPos_(jack, "jack001");
	SetVisible(queen, false);
	SetVisible(f_regi, false);
	
	//カット２＠見送る側のカット
	SetPointCameraEye_("002_cameye");
	SetPointCameraTarget_("002_camtgt");
	Wait_(60);
	
	//カット３＠見送られる側のカット
	SetPointCameraEye_("003_cameye");
	SetPointCameraTarget_("003_camtgt");
	Wait_(45);
	
	SetMotion_(m_regi, MOT_WALK, BLEND_L);
	task_m_regi =Task_RotateToDir_(m_regi, 0, ROTATE_DEMO_DEF);
	Wait_(20);
	SetMotion_(man, MOT_WALK, BLEND_L);
	task_man =Task_RotateToDir_(man, 0, ROTATE_DEMO_DEF*0.8);
	
	WaitTask(task_m_regi);
	task_m_regi = Task_MoveToPointSetSpeed_(m_regi, "m_regi001", 0.5);
	WaitTask(task_man);
	task_man = Task_MoveToPointSetSpeed_(man, "man001", 0.5);
	
	SetMotion_(man, MOT_WALK, BLEND_M);
	SetMotion_(m_regi, MOT_WALK, BLEND_M);
	Wait_(23);
	
	task_nocho =Task_WalkAroundToDir(nochoS, 0, ROTATE_DEMO_DEF);
	WaitTask(task_nocho);
	task_nocho = Task_MoveToPointSetSpeed_(nochoS, "nocho001", 1.5);
	SetMotion_(nochoS, nS_run, 8);
	Wait_(15);
	
	//-----
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);
	WaitFade_();
	
	//カット４準備
	WaitLod_();
	SetStopLod_(true);
	task_cam	 = Task_AnimeMoveCamera_("001_anmeye", "001_anmtgt");
	
	//カット４
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 20);
	//-----
	Wait_(30);
	StopBgm_(150);
	WaitTask(task_cam);
	Wait_(30);
	
	EndDemo(FADE_COLOR_BLACK);
}
