//=============================================
//
//		demo647[ガルマザード戦勝利_6(回復-火山)]
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
	local task_cam, task_player, task_birdy;
	local efc_cam, efc_player, efc_catastrophe000;

// ▼時間設定
	SetTime_(18000);								//朝焼け

// ▼リソース読込
	// キャラクター
	local player = GetPlayerId_();					// 主人公
	local model_birdy = ReadNpc_("n019");			// バーディ

	//エフェクト
	LoadEffect_("ef864_05_catastrophe02");			// 天使のはしご
	LoadEffect_("ef864_04_catastrophe01");			// 瘴気
	LoadEffect_("ef860_01_release");				// 凍てつく波動
	LoadEffect_("ef220_08_hikarinohadou");			// ひかりの波動

// ▼配置
	local birdy = ArrangePointNpc_(model_birdy, "npc_birdy000");						// バーディ
	SetPointPosNoFit_(birdy, "npc_birdy000");
	SetScaleSilhouette(birdy, SCALE.N, SILHOUETTE_WIDTH.N);								// サイズN
	SetVisible(birdy, false);															// バーディ非表示

// ▼非常駐モーション読込
	local birdy_flight_Hovering_L = ReadMotion_(birdy, "n019_flight_Hovering_L");		// 飛行(ホバリング)L

// ▼カメラ設定
	ReadWaitingLod("lodeye000", "lodtgt000");											//Lod読込

	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");

// ▼初期エフェクト
	efc_catastrophe000 = SetCameraEffect_("ef864_04_catastrophe01", 100);				// 瘴気


//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);

	WaitTask(task_cam); 

	//...........................................................................
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);					//フェードアウト
	WaitFade_();

	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	SetVisible(birdy, true);															// バーディ表示
	SetMotion_(birdy, birdy_flight_Hovering_L, BLEND_N);								// バーディホバリングL

	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);					//フェードイン
	//...........................................................................	

	Wait_(60);

	//...........................................................................
	efc_cam = SetCameraEffect_("ef220_08_hikarinohadou", 100);					//波動
	SetEffectScale_(efc_cam, 4.0);
	PlaySE_("SE_DEM_192");
	Wait_(10);
	StopBgm_(15);
	SetFade_(FADE_OUT, FADE_COLOR_WHITE, 10);					//白フェードアウト
	DeleteEffectEmitter_(efc_catastrophe000);									//瘴気消滅
	Wait_(10);
	SetFade_(FADE_IN, FADE_COLOR_WHITE, 35);					//白フェードイン
	ChangeTime(0, 30, 8700);													//夜から昼に

	//...........................................................................	

	task_birdy = Task_AnimeMoveNoFit_(birdy, "anm_birdy000");					// バーディアニメ
	Wait_(35);
	PlayBgm_("BGM_002");
	Wait_(15);

	// 天使のはしご
	local efc_catastrophe000 = SetPointWorldEffect_("ef864_05_catastrophe02", "efc_catastrophe000");
	local efc_catastrophe001 = SetPointWorldEffect_("ef864_05_catastrophe02", "efc_catastrophe001");
	local efc_catastrophe002 = SetPointWorldEffect_("ef864_05_catastrophe02", "efc_catastrophe002");
	local efc_catastrophe003 = SetPointWorldEffect_("ef864_05_catastrophe02", "efc_catastrophe003");
	local efc_catastrophe004 = SetPointWorldEffect_("ef864_05_catastrophe02", "efc_catastrophe004");

	SetEffectScale_(efc_catastrophe000, 0.8);
	SetEffectScale_(efc_catastrophe001, 0.9);
	SetEffectScale_(efc_catastrophe002, 1.5);
	SetEffectScale_(efc_catastrophe003, 1.1);
	SetEffectScale_(efc_catastrophe004, 0.9);
	WaitTask(task_birdy);
	local efc_catastrophe005 = SetPointWorldEffect_("ef864_05_catastrophe02", "efc_catastrophe005");
	SetEffectScale_(efc_catastrophe005, 1.0);
	Wait_(100);

	EndDemo(FADE_COLOR_WHITE);
}
