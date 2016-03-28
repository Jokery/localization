//=============================================
//
//		demo518[デスバーン襲来]
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
	local task_cam, task_player, task_burdy, task_desburn;
	local efc_cam, efc_player, efc_burdy, efc_desburn;

// ▼リソース読込
	// キャラクター
	local player = GetPlayerId_();					// 主人公
	local model_burdy = ReadNpc_("n019");			// バーディ
	local model_desburn = ReadNpc_("m206_00");		// デスバーン
	// ギミック
	local model_wall = ReadGimmick_("o_V00_03");	// 秘密基地入り口の岩壁(待機)
	local model_switch = ReadGimmick_("o_V00_11");	// 認証装置（起動前）
	local model_ruler = ReadGimmick_("o_com_08");	// ルーラポイント
	// エフェクト
	LoadEffect_("ef712_10_emo_surprise01");			// 「！」
	LoadEffect_("ef733_01_sym_shuchusen01");		// 集中線
	LoadEffect_("ef721_02_nat_smoke_n02");

// ▼配置
	// 主人公
	SetPointPos_(player, "player000");
	// バーディ
	local burdy = ArrangePointNpc_(model_burdy, "npc_burdy000");
	SetScaleSilhouette(burdy, SCALE.N, SILHOUETTE_WIDTH.N);
	// デスバーン
	local desburn = ArrangePointNpc_(model_desburn, "npc_desburn000");
	SetPointPosNoFit_(desburn, "npc_desburn000");
	
	// 秘密基地入り口の岩壁(待機)
	local wall = ArrangePointGimmick_("o_V00_03", model_wall, "obj_wall000");
	// 認証装置（起動前）
	local switch000 = ArrangePointGimmick_("o_V00_11", model_switch, "obj_switch000");
	// ルーラポイント
	local ruler = ArrangePointGimmick_("o_com_08", model_ruler, "obj_ruler000");
	if(GetEventFlg_("BFG_RULER_ADD_021") == true){
		SetMotion_(ruler, MOT_GIMMICK_2, BLEND_N);
	}

// ▼非常駐モーション読込
	local player_run_battle = ReadMotion_(player, "Player_run_battle");		// 走り→戦闘待機
	local player_battle_L = ReadMotion_(player, "Player_battle_L");			// 戦闘待機L
	local player_look_left_L = ReadMotion_(player, "Player_look_left_L");	// 顔を少し左向けるL

	local burdy_idol_L = ReadMotion_(burdy, "n019_idol");	// 待機L
	local burdy_talk_L = ReadMotion_(burdy, "n019_talk");	// 会話L
	local burdy_run_L = ReadMotion_(burdy, "n019_run_L");	// 走るL
	
	local desburn_flight_Hovering_L = ReadMotion_(desburn, "m206_00_flight_Hovering_L");	// ホバリングL

// ▼カメラ設定
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	WaitLod_();

// ▼天候設定
	SetWeather_(WEATHER.BAD);

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------
	
	SetMotion_(desburn, desburn_flight_Hovering_L, BLEND_N);

	local task_burdy_step = Task_ChangeStepSe(burdy, "SE_FLD_032", 18);								//バーディ足音

	SetMotion_(burdy, MOT_WALK, BLEND_N);
	task_burdy = Task_AnimeMove_(burdy, "anm_burdy000");	// 60F
	
	StartDemo(FADE_COLOR_BLACK);	
	
	Wait_(10);
	
	WaitTask(task_burdy);
	DeleteTaskStepSe(burdy, task_burdy_step);

	SetMotion_(burdy, burdy_talk_L, BLEND_L);
	
	//===============================================
	//*バーディ
	// 	「お？　何か見つけたネー？
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BIRDY");
	ShowMsg_("DEMO_518_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
		
	SetMotion_(burdy, burdy_idol_L, BLEND_L);
	
	Wait_(35);
	
	task_desburn = Task_AnimeMoveNoFit_(desburn, "anm_desburn000");	// 50F
	Wait_(15);
	
	StopBgm_(20);
	Wait_(20);
	
	efc_player = SetSelectBoneEffectSetOffset_("ef712_10_emo_surprise01", player, ATTACH_EFFECT1, Vec3(0.0, 0.0, 0.0));
	efc_burdy = SetSelectBoneEffectSetOffset_("ef712_10_emo_surprise01", burdy, ATTACH_EFFECT1, Vec3(-6.0, -0.2, 4.0));
	SetEffectScale_(efc_burdy, 1.75);
	PlaySE_("SE_DEM_053");
	
	SetMotion_(player, player_look_left_L, BLEND_L);
	
	Wait_(30);
		
	PlaySE_("SE_FLD_032");										//バーディの足音

	SetMotion_(burdy, MOT_WALK, BLEND_L);
	task_burdy = Task_RotateToDir_(burdy, 330, 2.85);
	
	WaitTask(task_burdy);
	
	SetMotion_(burdy, burdy_idol_L, BLEND_L);
	
	Wait_(35);
	
	DeleteTask_(task_desburn);
	
	SetScaleSilhouette(desburn, 0.85, 1.0);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット2
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");		// 90F
	DeleteTask_(task_cam);
	
	SetPointPos_(player, "player001");
	SetPointPos_(burdy, "npc_burdy001");
	SetPointPosNoFit_(desburn, "npc_desburn001");
	SetPointPos_(switch000, "obj_switch001");
	
	SetStepSe_(player, SILENT_STEP_SE);	// 足音を 無音にする
	
	
	
	SetMotion_(player, MOT_RUN, BLEND_N);
	local task_player_step = Task_ChangeStepSe(player, "SE_FLD_016", 10);							//主人公足音
	SetMotion_(burdy, burdy_run_L, BLEND_N);
	local task_burdy_step = Task_PlaySe_("SE_FLD_032", 20);										//バーディの足音
	Wait_(3);
	local task_burdy_step2 = Task_PlaySe_("SE_FLD_032", 20);										//バーディの足音
	
	task_player = Task_AnimeMove_(player, "anm_player000");	// 30F
	task_burdy = Task_AnimeMove_(burdy, "anm_burdy001");	// 30F
	Wait_(10);
	SetMotion_(player, player_run_battle, BLEND_XL);
	
	WaitTask(task_player);
	WaitTask(task_burdy);
	DeleteTaskStepSe(player, task_player_step);
	DeleteTask_(task_burdy_step);
	DeleteTask_(task_burdy_step2);
	
	SetMotion_(player, player_battle_L, BLEND_XL);

	SetMotion_(burdy, burdy_idol_L, BLEND_XL);
	
	Wait_(20);
	
	//===============================================
	//*バーディ
	// 	「ホワッツ！？
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BIRDY");
	ShowMsg_("DEMO_518_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	Wait_(5);
	
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");	// 90F
	local task_fly = Task_PlaySe_("SE_FLD_036", 20);
	PlayBgm_("BGM_007");
	task_desburn = Task_AnimeMoveNoFit_(desburn, "anm_desburn001");	// 115F
	
	WaitTask(task_cam);
	
	Wait_(20);
	
	SetMotion_(desburn, MOT_WAIT, 20);
	DeleteTask_(task_fly);
	
	Wait_(2);
	
	PlaySE_("SE_FLD_168");
	
	WaitTask(task_desburn);
	
	task_desburn = Task_AnimeMoveNoFit_(desburn, "anm_desburn002");	// 5F
	
	WaitTask(task_desburn);
	
	efc_desburn = SetSelectBoneEffectSetOffset_("ef721_02_nat_smoke_n02", desburn, ATTACH_GLOBAL, Vec3(0.0, -2.2, 0.0));
	SetEffectScale_(efc_desburn, 2.5);
	
	StartDecayEarthQuake_(30, 3, 2.0)

	Wait_(70);

	//===============================================
	//*デスバーン
	// 	「敵性ノ　もんすたーますたー反応アリ。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_DEATHBURN");
	ShowMsg_("DEMO_518_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(burdy, burdy_talk_L, BLEND_L);
	
	//===============================================
	//*バーディ
	// 	「どうやら　逃がしてくれなさそうネー！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BIRDY");
	ShowMsg_("DEMO_518_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(burdy, burdy_idol_L, BLEND_L);
	
	Wait_(25);
	
	SetActive_(player, false);
	SetActive_(burdy, false);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット3
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");		// 57F
	
	SetPointPos_(desburn, "npc_desburn002");
	
	Wait_(25);
	
	SetMotion_(desburn, MOT_SPELL_ACTUATE, BLEND_L);
	PlaySE_("SE_DEM_095");
	Wait_(25);
	
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", CAMERA_DEF);
	SetMotionSpeed_(desburn, 0.8);
	
	Wait_(7);
	
	EncountEndDemo(ENCOUNT_BOSS);
}
