//=============================================
//
//		demo529[移動装置を打ち上げろ_2(発射装置)]
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
	local task_cam, task_rocket, task_efc;
	local efc_lift, efc_rocket, efc_rocket_light;

// ▼リソース読込
	// キャラクター
	local player = GetPlayerId_();					// 主人公
	// ギミック
	local model_rocket = ReadGimmick_("o_V00_04");	// 大きな杭
	local model_gate = ReadGimmick_("o_V00_05");	// 発射台の扉
	local model_lift = ReadGimmick_("o_dem_24");	// 発射台のリフト
	local model_monolith = ReadGimmick_("o_com_02");// モノリス
	local model_ruler = ReadGimmick_("o_com_08");	// ルーラポイント
	local model_switch = ReadGimmick_("o_V00_11");	// 認証装置
	// エフェクト
	LoadEffect_("ef853_01_launch01");				// 発射時のまいあがる煙
	LoadEffect_("ef853_02_launch02");				// 発射時のエンジンから出る煙
	LoadEffect_("ef853_05_launch05");				// ビーコン
	
	local baseResId = ReadGimmick_("o_effect_base");
	local baseObj = ArrangePointGimmick_("o_effect_base", baseResId, "efc_rocket000");

// ▼配置
	// 主人公
	SetPointPos_(player, "player000");
	SetActive_(player, false);
	
	// 大きな杭
	local rocket = ArrangePointGimmick_("o_V00_04", model_rocket, "obj_rocket000");
	// 発射台の扉（上）
	local gateup = ArrangePointGimmick_("o_V00_05", model_gate, "obj_gateup000");
	// 発射台の扉（下）
	local gatedown = ArrangePointGimmick_("o_V00_05", model_gate, "obj_gatedown000");
	// 発射台のリフト
	local lift = ArrangePointGimmick_("o_dem_24", model_lift, "obj_lift000");
	// モノリス
	local monolith = ArrangePointGimmick_("o_com_02", model_monolith, "obj_monolith000");
	if(GetEventFlg_("BFG_START_A_MONOLITH") == true){
		SetMotion_(monolith, MOT_GIMMICK_2, BLEND_N);
	}
	// ルーラポイント
	local ruler = ArrangePointGimmick_("o_com_08", model_ruler, "obj_ruler000");
	if(GetEventFlg_("BFG_RULER_ADD_021") == true){
		SetMotion_(ruler, MOT_GIMMICK_2, BLEND_N);
	}
	// 認証装置
	local switch000 = ArrangePointGimmick_("o_V00_11", model_switch, "obj_switch000");
	SetMotion_(switch000, MOT_GIMMICK_3, BLEND_N);

// ▼カメラ設定
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	WaitLod_();
	
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");		// 550F

// ▼天候設定
	SetWeather_(WEATHER.NORMAL);

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------
	SetMotion_(gateup, MOT_GIMMICK_0, BLEND_N);
	SetMotionSpeed_(gateup, 0.5);
	SetMotion_(gatedown, MOT_GIMMICK_0, BLEND_N);
	SetMotionSpeed_(gatedown, 0.5);
	SetMotion_(lift, MOT_GIMMICK_0, BLEND_N);

	StartDemo(FADE_COLOR_BLACK);
	
	Wait_(60);
	
	PlaySE_("SE_DEM_098");											//■SE:発射台の扉が開く
	SetMotion_(gateup, MOT_GIMMICK_1, BLEND_N);
	Wait_(35);
	SetMotion_(gateup, MOT_GIMMICK_2, BLEND_N);

//	PlaySE_("SE_DEM_140");											//■SE:ワープ装置が光る
	SetMotion_(gatedown, MOT_GIMMICK_1, BLEND_N);
	Wait_(35);
	SetMotion_(gatedown, MOT_GIMMICK_2, BLEND_N);
	
	SetMotion_(lift, MOT_GIMMICK_1, BLEND_N);
	Wait_(83);
	PlaySE_("SE_DEM_099");											//■SE:中央発射装置がでてくる
	Wait_(202);
	SetMotion_(lift, MOT_GIMMICK_2, BLEND_N);
	
	Wait_(35);
	
	//===============================================
	//*レナーテ
	// 	「だからこの装置で　移動装置を撃ち込み
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_529_MSG_010");
	KeyInputWait_();
	
	//===============================================
	//*レナーテ
	// 	「そう……これこそ　ルキヤの遺してくれた
	//-----------------------------------------------
	ShowMsg_("DEMO_529_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	WaitTask(task_cam);
	
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");		// 80F
	
	WaitTask(task_cam);
	
	task_rocket = Task_AnimeMoveNoFit_(rocket, "anm_rocket000");	// 150F
	SetDir_(rocket, 0);

	Wait_(7);
	PlaySE_("SE_DEM_100");											//弾頭ロケットがでてくる
	Wait_(133);
	
	Wait_(10);
	DeleteTask_(task_rocket);
	StartDecayEarthQuake_(21, 3, 3)

	Wait_(20);

	efc_rocket_light = SetSelectBoneEffectSetOffset_("ef853_05_launch05", baseObj, ATTACH_GLOBAL, Vec3(0.0, 0.0, 0.0));	//ビーコン
	
	Wait_(60);
	
	StartEarthQuake_(30, 3, 5)	

	PlaySE_("SE_DEM_101");											//弾頭ロケットの発射
	
	efc_lift = SetPointWorldEffect_("ef853_01_launch01", "efc_lift000");
	efc_rocket = SetSelectBoneEffect_("ef853_02_launch02", baseObj, ATTACH_GLOBAL);
	
	Wait_(15);

	Wait_(15);
	
	StartEarthQuake_(30, 3, 4)	

	task_efc = Task_AnimeMoveNoFit_(baseObj, "anm_efc000");			// 565F
	SetDir_(baseObj, 0);
	
	task_rocket = Task_AnimeMoveNoFit_(rocket, "anm_rocket001");	// 565F
	SetDir_(rocket, 0);
	
	Wait_(30);	
	StartEarthQuake_(24, 3, 3)	
	Wait_(24);
	
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");		// 300F
	Wait_(120);

	StartDecayEarthQuake_(69, 3, 5)	
	
	EndDemo(FADE_COLOR_BLACK);
}
