//=============================================
//
//		demo652[予兆]
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
	local task_cam, task_player;
	local efc_player;

// ▼リソース読込
	// キャラクター
	local player = GetPlayerId_();					// 主人公
	local n_nyan = ReadNpc_("m040_00");				// ぷりずにゃん
	local n_sura = ReadNpc_("m000_00");				// スライム

// ▼配置
	// 主人公
	SetPointPos_(player, "player000");
	SetVisible(player, false);

	//プリズニャン
	local nyan = ArrangePointNpc_(n_nyan, "nyan000");

	//スライム
	local sura = ArrangePointNpc_(n_sura, "sura000");
	SetScaleSilhouette(sura, 1.3, 1.3);
	SetVisible(sura, false);

// ▼非常駐モーション読込
	local p_Player_sleep_L = ReadMotion_(player, "Player_sleep_L");					// 寝ころび
	local p_Player_sleep_reactor_L = ReadMotion_(player, "Player_sleep_reactor");	// リアクターに手を置くL
	local p_Player_up03 = ReadMotion_(player, "Player_up03");						// リアクターを手を置く→飛び起きる
	local p_Player_up03_L = ReadMotion_(player, "Player_up03_L");					// 飛び起きるL

// ▼カメラ設定
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	LoadEffect_("ef732_09_light_reactor_c");										// リアクター発光

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------
//cut01
	StartDemo(FADE_COLOR_BLACK);

	WaitTask(task_cam);
	WaitLod_();
	SetVisible(sura, true);
	SetMotion_(nyan, MOT_WALK, BLEND_N);


//cut02
	task_cam = Task_AnimeMove_(nyan, "anm_nyan000");
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");

	WaitTask(task_cam);
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 15);
	WaitFade_();
	WaitLod_(); 
	SetVisible(player, true);
	SetMotion_(player, p_Player_sleep_L, BLEND_N);


//cut03
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");

	SetFade_(FADE_IN, FADE_COLOR_BLACK, 15);
	WaitFade_();
	WaitTask(task_cam);
	Wait_(30);
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 15);
	WaitFade_();
	Wait_(5);
	WaitLod_();
	Wait_(5);
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 15);


//cut04
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");

	SetPointPos_(player, "player001");
	WaitTask(task_cam);
	Wait_(20);
	PlaySE_("SE_DEM_019");

	Wait_(20);
	SetMotion_(player, p_Player_sleep_reactor_L, BLEND_XL);
	Wait_(16);
	SetMotion_(player, p_Player_up03, BLEND_XL);
	WaitMotion(player);
	SetMotion_(player, p_Player_up03_L, BLEND_N);
	Wait_(30);

	//===============================================
	// *ルキヤ
	//……聞こえるかい？
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_626_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================


//cut05
	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");

	StopBgm_(150);
	WaitTask(task_cam);
	Wait_(60);
	SetFadePlane_(FADE_PLANE.PLANE_3D);	
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);
	WaitFade_();
	LoadLayout_("to_be_continued");
	SetLayoutAnime_("tobe_in", false);
	Wait_(25);
	PlaySE_("SE_DEM_176");
	WaitLayoutAnime();
	SetLayoutAnime_("tobe_wait", false);
	Wait_(45);

	SetFadePlane_(FADE_PLANE.PLANE_NORMAL);

	EndDemo(FADE_COLOR_BLACK);
}
