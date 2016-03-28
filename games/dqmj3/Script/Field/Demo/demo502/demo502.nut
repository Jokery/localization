//=============================================
//
//		demo502[地下シェルターの町_2]
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

// ▼リソース読込
	// キャラクター
	local player = GetPlayerId_();					// 主人公
	local n_bevil = ReadNpc_("m082_01");			//べビル
	local n_genjyutusi = ReadNpc_("m076_02");		//げんじゅつし
	local n_bes = ReadNpc_("m006_03");				//ベスキング
	local n_megazaru = ReadNpc_("m107_01");			//メガザルロック

// ▼配置
	// 主人公
	local task = Task_AnimeMove_(player,"player");
	DeleteTask_(task);

	//べビル																主人公の隣(住人A)
	local bevil = ArrangeNpc_(n_bevil, false);
	SetScaleSilhouette(bevil, SCALE.S, 0.4);
	local task = Task_AnimeMove_(bevil,"bevil");
	DeleteTask_(task);

	//べビル																道具屋
	local bevil_mob = ArrangeNpc_(n_bevil, false);
	SetScaleSilhouette(bevil_mob, SCALE.S, 0.4);
	local task = Task_AnimeMove_(bevil_mob,"bevil_mob");
	DeleteTask_(task);

	//べビル																住人D
	local bevil_item = ArrangeNpc_(n_bevil, false);
	SetScaleSilhouette(bevil_item, SCALE.S, 0.4);
	local task = Task_AnimeMove_(bevil_item,"bevil_item");
	DeleteTask_(task);

	//げんじゅつし															長老
	local genjyutusi = ArrangePointNpc_(n_genjyutusi, "genjyutusi000");
	SetScaleSilhouette(genjyutusi, SCALE.S, 0.4);

	//メガザルロック														宿屋
	local mega_a = ArrangeNpc_(n_megazaru, false);
	SetScaleSilhouette(mega_a, SCALE.N, 0.6);
	local task = Task_AnimeMove_(mega_a,"mega_a");
	DeleteTask_(task);

	//メガザルロック														側近
	local mega_b = ArrangePointNpc_(n_megazaru, "mega_b");
	SetScaleSilhouette(mega_b, SCALE.N, 0.6);

	//ベスキング															住人B
	local bes_a = ArrangeNpc_(n_bes, false);
	SetScaleSilhouette(bes_a, SCALE.S, 0.3);
	local task = Task_AnimeMove_(bes_a,"bes_a");
	DeleteTask_(task);

	local task_iwa = Task_RotateToPos_(bevil_item, GetPos_(mega_a), 100);

// ▼非常駐モーション読込
	local g_m076_02_wait_L	= ReadMotion_(genjyutusi, "m076_02_wait_L");
	SetMotion_(genjyutusi, g_m076_02_wait_L, BLEND_N);

// ▼カメラ設定
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

// ▼エフェクト読み込み
	LoadEffect_("EF712_10_EMO_SURPRISE01");			// 「！」


//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

// カット1
	StartDemo(FADE_COLOR_BLACK);

	Wait_(10);

	//===============================================
	//*マグマパーク住人Ａ
	// 	「おーい　みんなー！
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_502_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================


// カット2
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");

	Wait_(1);
	SetAlpha_(player, 0);
	local taskg = Task_AnimeMoveSetMotion_(player, "player", MOT_WALK, MOT_WAIT);
	Wait_(2);
	local efc = SurpriseDispSetOffset(bevil_mob, Vec3(0, 3, 0), 7.0);
	local task = Task_RotateToPlayerSetMotion_(bevil_mob, 3.0, MOT_WALK, MOT_WAIT);
	Wait_(40);
	local efc = SurpriseDispSetOffset(mega_a, Vec3(0, 8, 0), 2.5);
	local task = Task_RotateToPlayerSetMotion_(mega_a, 3.0, MOT_WALK, MOT_WAIT);
	Wait_(15);
	local efc = SurpriseDispSetOffset(bes_a, Vec3(0, 6, 0), 6.5);
	local task = Task_RotateToPlayerSetMotion_(bes_a, 3.0, MOT_WALK, MOT_WAIT);
	Wait_(20);
	local efc = SurpriseDispSetOffset(bevil_item, Vec3(0, 3, 0), 4.0);
	local taska = Task_RotateToPlayerSetMotion_(bevil_item, 3.0, MOT_WALK, MOT_WAIT);
	Wait_(60);
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 15);
	WaitFade_();

	SetPointPos_(player, "player000");
	SetMotion_(bevil_mob, MOT_WALK, 4);
	SetMotion_(bevil_item, MOT_WALK, 4);
	SetMotion_(mega_a, MOT_WALK, 4);
	local taska = Task_AnimeMoveSetMotion_(bes_a		, "bes_a", MOT_WALK, MOT_WAIT);
	local taskd = Task_AnimeMoveSetMotion_(bevil		, "bevil", MOT_WALK, MOT_WAIT);
	local taske = Task_AnimeMove_(bevil_mob				, "bevil_mob");
	local taskf = Task_AnimeMove_(bevil_item			, "bevil_item");
	local taskc = Task_AnimeMove_(mega_a				, "mega_a");
	SetAlpha_(player, 1);
	Wait_(1);


// カット3
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");

	SetFade_(FADE_IN, FADE_COLOR_BLACK, 10);
	WaitFade_();
	WaitTask(taskf);
	SetMotion_(bevil_item, MOT_WAIT, 8);
	WaitTask(taske);
	SetMotion_(bevil_mob, MOT_WAIT, 8);
	SetMotion_(mega_a, MOT_WAIT, 16);
	Wait_(5);
	SetMotion_(bevil_item, MOT_RUN, 8);
	SetStepSe_(bevil_item, SILENT_STEP_SE);

	//===============================================
	//*マグマパーク住人Ｂ
	// 	「不死身のアンセス！
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_502_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	WaitTask(taska);
	//===============================================

	SetMotion_(bevil_item, MOT_WAIT, 8);
	Wait_(1);
	SetMotion_(bes_a, MOT_WALK, 8);
	SetStepSe_(bes_a, SILENT_STEP_SE);

	//===============================================
	//*マグマパーク住人Ｃ
	// 	「おかえりなさい　アンセス。
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_502_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(bes_a, MOT_WAIT, 8);
	DeleteTask_(task_cam);
	SetDirToPlayer_(bevil);


// カット4
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");

	SetVisible(bes_a		, false);
	SetVisible(mega_a		, false);
	SetVisible(bevil_mob	, false);
	SetVisible(bevil_item	, false);
	SetVisible(player		, false);

	//===============================================
	//*マグマパーク住人Ａ
	// 	「アンセス　まずは長老に会って
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_502_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================


// カット5
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");

	Wait_(30);

	//===============================================
	//*マグマパーク住人Ａ
	// 	「場所は　昔と変わってない。
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_502_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	WaitTask(task_cam);
	Wait_(30);

	EndDemo(FADE_COLOR_BLACK);
}
