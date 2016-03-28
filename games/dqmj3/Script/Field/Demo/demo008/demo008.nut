//=============================================
//
//		demo008[楽園からの脱出_2(草原)]
//
//=============================================

//-------------------------------------------------------------------------
//
//		読み込み・配置
//
//-------------------------------------------------------------------------
function Update()
{
// ▼ダミーメッセージ
//	DummyMsg();

// ▼変数定義
	local task_cam, task_player;
	local efc_player;

// ▼モデル読込
	// キャラクター
	local player = GetPlayerId_();					// 主人公
	// レイアウト
	LoadLayout_("op_title");

// ▼配置
	// 主人公
	SetPointPos_(player, "player000");
	SetFace_(player, "Face_eyes_close");
	SetStepSe_(player, SILENT_STEP_SE);				// 足音を無音にする

// ▼非常駐モーション読み込み
	local player_touch_reactor_L = ReadMotion_(player, "Player_touch_reactor_L");			// リアクターを触る
	local player_look_walk_L = ReadMotion_(player, "Player_look_walk_L");					// キョロキョロ歩く
	
// ▼エフェクト読み込み
	LoadEffect_("ef732_09_light_reactor_c");		// リアクター発光
	
//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------
	
// ▼カメラ設定
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

	// ▼カメラ１---------------------
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	Wait_(6);
	local task_step = Task_ChangeStepSe(player, "SE_FLD_014", 20);
	Wait_(12);
	
	// ▼初期モーション設定
	SetMotion_(player, player_look_walk_L, BLEND_N);
	task_player = Task_MoveForward_(player, 1.0, false);
	
	PlaySE_("SE_DEM_232");
	StartDemo(FADE_COLOR_WHITE);
	
	Wait_(60);
	SetMotion_(player, MOT_WAIT, BLEND_L);
	DeleteTask_(task_player);
	Wait_(10);
	DeleteTaskStepSe(player, task_step);
	Wait_(40);
	//明るいところに出る感じに白フェード
	SetFade_(FADE_OUT, FADE_COLOR_WHITE, 30);
	WaitFade_();
	Wait_(10);
	
	//■草原紹介用のカメラに切り替え
	DeleteTask_(task_cam);

	SetMotion_(player, MOT_WAIT, 1);
	
	//紹介カット①
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");		// 100F

	Wait_(5);

	SetFade_(FADE_IN, FADE_COLOR_WHITE, 10);
	PlayBgm_("BGM_012");
	WaitFade_();
	Wait_(75);
	
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 20);
	WaitFade_();
	DeleteTask_(task_cam);

	//紹介カット②
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");		// 130F

	Wait_(5);

	SetFade_(FADE_IN, FADE_COLOR_BLACK, 10);
	WaitFade_();
	Wait_(95);
	
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 20);
	WaitFade_();
	DeleteTask_(task_cam);

	//紹介カット③
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");		// 140F

	Wait_(5);
	
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 20);
	WaitFade_();

	Wait_(90);
	
	SetLayoutAnime_("title", false);		// タイトルロゴ
	WaitLayoutAnime();
	SetLayoutAnime_("title_loop", false);		// タイトルロゴ	
	Wait_(100);
	SetLayoutAnime_("title_out", false);		// タイトルロゴ
	Wait_(30);
		
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 60);
	WaitFade_();
	Wait_(30);
	
	DeleteTask_(task_cam);
	
	SetPointPos_(player, "player001");
	
	//主人公パンアップ
	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);
	WaitFade_();
	Wait_(50);

	PlaySE_("SE_FLD_135");		// リアクター反応音
	efc_player = SetSelectBoneEffect_("ef732_09_light_reactor_c", player, ATTACH_EFFECT1);	// リアクター発光
	SetEffectScale_(efc_player, 0.5);

	Wait_(20);
	SetFace_(player, "Face_left");	
	Wait_(10);	
	DeleteTask_(task_cam);
	
	//主人公ズーム
	task_cam = Task_AnimeMoveCamera_("anmeye005", "anmtgt005");
	
	SetMotion_(player, player_touch_reactor_L, 20);		// リアクターに触る
	Wait_(30);
	
	DeleteTask_(task_cam);
	
	EndDemo(FADE_COLOR_BLACK);
	
}