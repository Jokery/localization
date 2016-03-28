//=============================================
//
//		demo520[デスバーン戦勝利]
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
	local efc_cam, efc_player, efc_burdy, efc_desburn000, efc_desburn100, efc_desburn200, efc_desburn300, efc_desburn400, efc_desburn500;
	local efc_wall000, efc_wall001, efc_wall002, efc_smoke000, efc_smoke001, efc_smoke002, efc_smoke003, efc_smoke004, efc_smoke005, efc_smoke006;
	local efc_smoke007, efc_smoke008, efc_smoke009, efc_smoke010, efc_smoke011, efc_smoke012, efc_smoke013;
	local efc_smoke014, efc_smoke015, efc_smoke016, efc_smoke017, efc_smoke018, efc_smoke019, efc_smoke020;

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
	LoadEffect_("ef732_09_light_reactor_c");		// リアクター発光
	LoadEffect_("ef712_10_emo_surprise01");			// 「！」
	LoadEffect_("ef733_01_sym_shuchusen01");		// 集中線
	LoadEffect_("ef721_04_nat_smoke_psps");
	LoadEffect_("ef852_01_flash_eye01");
	LoadEffect_("ef852_02_flash_eye02");
	LoadEffect_("ef852_03_explosion_db");
	LoadEffect_("ef852_07_door_stone");
	LoadEffect_("ef741_01_div_nor_death");
	LoadEffect_("ef852_06_door_smoke");
	
// ▼配置
	// 主人公
	SetPointPos_(player, "player000");
	// バーディ
	local burdy = ArrangePointNpc_(model_burdy, "npc_burdy000");
	SetScaleSilhouette(burdy, SCALE.N, SILHOUETTE_WIDTH.N);
	SetStepSe_(burdy, SILENT_STEP_SE);						// 足音を無音にする
	// デスバーン
	local desburn = ArrangePointNpc_(model_desburn, "npc_desburn000");
	SetScaleSilhouette(desburn, 0.85, 1.0);
	SetManualCalcAlpha_(desburn, true);
	efc_desburn000 = SetPointWorldEffect_("ef721_04_nat_smoke_psps", "efc_smoke000");
	SetEffectScale_(efc_desburn000, 2.20);
	efc_desburn100 = SetPointWorldEffect_("ef721_04_nat_smoke_psps", "efc_smoke100");
	SetEffectScale_(efc_desburn100, 2.20);

	// 秘密基地入り口の岩壁(待機)
	local wall = ArrangePointGimmick_("o_V00_03", model_wall, "obj_wall000");
	SetMotion_(wall, MOT_GIMMICK_0, BLEND_N);
	// 認証装置（起動前）
	local switch000 = ArrangePointGimmick_("o_V00_11", model_switch, "obj_switch000");
	SetMotion_(switch000, MOT_GIMMICK_0, BLEND_N);
	// ルーラポイント
	local ruler = ArrangePointGimmick_("o_com_08", model_ruler, "obj_ruler000");
	if(GetEventFlg_("BFG_RULER_ADD_022") == true){
		SetMotion_(ruler, MOT_GIMMICK_2, BLEND_N);
	}

// ▼非常駐モーション読込
	local player_battle_L = ReadMotion_(player, "Player_battle_L");					// 戦闘待機L
	local player_panel02 = ReadMotion_(player, "Player_panel02");					// パネルを操作する2
	local player_touch_reactor = ReadMotion_(player, "Player_touch_reactor");		// 顔を少し左向ける→リアクターを触る
	local player_touch_reactor_L = ReadMotion_(player, "Player_touch_reactor_L");	// 顔を少し左向ける→リアクターを触るL

	local burdy_idol_L = ReadMotion_(burdy, "n019_idol");	// 待機L
	local burdy_talk_L = ReadMotion_(burdy, "n019_talk");	// 会話L
	local burdy_run_L = ReadMotion_(burdy, "n019_run_L");	// 走るL
	
	local desburn_breakdown = ReadMotion_(desburn, "m206_00_breakdown");	// 破壊
	
// ▼カメラ設定
	SetPointCameraEye_("cameye003");
	SetPointCameraTarget_("camtgt003");
	WaitLod_();

// ▼天候設定
	SetWeather_(WEATHER.BAD);

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	SetMotion_(burdy, burdy_idol_L, BLEND_N);
	SetMotionSpeed_(desburn, 0.5);
	
	SetActive_(player, false);
	SetActive_(burdy, false);
	SetActive_(switch000, false);

	StartDemo(FADE_COLOR_BLACK);
	
	Wait_(10);
	
	//===============================================
	//*デスバーン
	// 	「機体ノ損傷率ガ　６０ぱーせんと突破。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_DEATHBURN");
	ShowMsg_("DEMO_520_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	Wait_(10);
	
	SetActive_(player, true);
	SetActive_(burdy, true);
	SetAlpha_(desburn, ALPHA_CLEAR);
	SetActive_(switch000, true);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット2
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	
	SetMotion_(player, player_battle_L, BLEND_N);
	SetMotion_(desburn, desburn_breakdown, BLEND_N);
	
	DeleteEffect_(efc_desburn000);
	DeleteEffect_(efc_desburn100);
	
	Wait_(5);
	
	SetMotion_(burdy, burdy_talk_L, BLEND_L);
	
	Wait_(5);
	
	//===============================================
	//*バーディ
	// 	「やったデース！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BIRDY");
	ShowMsg_("DEMO_520_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(desburn, MOT_WAIT, BLEND_N);
	SetMotionSpeed_(desburn, 1.3);
	
	Wait_(15);
	
	SetActive_(player, false);
	SetActive_(burdy, false);
	SetAlpha_(desburn, ALPHA_EXIST);
	SetActive_(switch000, false);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット3
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");		// 7F
	DeleteTask_(task_cam);
	
	SetMotionSpeed_(desburn, 0.5);
	
	efc_desburn000 = SetPointWorldEffect_("ef721_04_nat_smoke_psps", "efc_smoke000");
	SetEffectScale_(efc_desburn000, 2.20);
	efc_desburn100 = SetPointWorldEffect_("ef721_04_nat_smoke_psps", "efc_smoke100");
	SetEffectScale_(efc_desburn100, 2.20);

	Wait_(20);
	
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");		// 7F
	PlaySE_("SE_DEM_026");	// ■SE:集中線
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", CAMERA_DEF);
	WaitTask(task_cam);
	
	Wait_(7);
	
	DeleteEffect_(efc_cam);
	
	efc_desburn200 = SetPointWorldEffect_("ef852_01_flash_eye01", "efc_eye000");
	SetEffectScale_(efc_desburn200, 1.1);
	efc_desburn300 = SetPointWorldEffect_("ef852_02_flash_eye02", "efc_eye000");
	SetEffectScale_(efc_desburn300, 1.1);
	PlaySE_("SE_DEM_125");
	SetMotionSpeed_(desburn, 0.0);
	
	Wait_(40);
	
	//===============================================
	//*デスバーン
	// 	「重要ナでーたヲ　こあニ転送シマス。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_DEATHBURN");
	ShowMsg_("DEMO_520_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	Wait_(11);
	
	DeleteEffect_(efc_desburn000);
	DeleteEffect_(efc_desburn100);
	
	PlaySE_("SE_DEM_134");									//■SE:デスバーン爆発
	SetMotionSpeed_(desburn, 1.0);
	SetMotion_(desburn, desburn_breakdown, BLEND_XL);

	efc_desburn400 = SetSelectBoneEffectSetOffset_("ef852_03_explosion_db", desburn, ATTACH_GLOBAL, Vec3(0.0, 0.0, 0.0));
	SetEffectScale_(efc_desburn400, 1.1);
	
	StartDecayEarthQuake_(51, 3, 2)
//	PlaySE_("SE_SKL_011");
	
	Wait_(105);

	efc_desburn500 = SetSelectBoneEffectSetOffset_("ef741_01_div_nor_death", desburn, ATTACH_GLOBAL, Vec3(0.0, 0.0, 0.0));
	SetEffectScale_(efc_desburn500, 1.75);
	PlaySE_("SE_DEM_010");	
	task_desburn = Task_ObjectFadeOut_(desburn, 20);
	
	Wait_(100);

	SetActive_(player, true);
	SetActive_(burdy, true);
	SetActive_(switch000, true);

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット4
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	
	SetPointPos_(player, "player001");
	SetPointPos_(burdy, "npc_burdy001");
	PlayBgm_("BGM_006");

	SetMotion_(player, MOT_WAIT, BLEND_N);
	SetMotion_(burdy, burdy_idol_L, BLEND_N);
	
	Wait_(10);
	
	task_player = Task_RotateToDirSetMotion_(player, -113, 3.0, MOT_WALK, MOT_WAIT);
	
	Wait_(10);

	SetMotion_(burdy, MOT_WALK, BLEND_L);
	task_burdy = Task_RotateToDir_(burdy, 46, 2.5);
	PlaySE_("SE_FLD_032");										//■SE:バーディ足音
	Wait_(15);
	PlaySE_("SE_FLD_032");										//■SE:バーディ足音
	WaitTask(task_burdy);
	
	SetMotion_(burdy, burdy_talk_L, BLEND_L);
	
	//===============================================
	//*バーディ
	// 	「グゥレイト！　さあ　アンセス！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BIRDY");
	ShowMsg_("DEMO_520_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(burdy, burdy_idol_L, BLEND_L);
	
	Wait_(20);
	
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 20);
	WaitFade_();
	
	Wait_(25);
	
	DeleteTask_(task_player);

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット5
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");		// 90F
	DeleteTask_(task_cam);
	
	SetPointPos_(player, "player002");
	SetPointPos_(burdy, "npc_burdy002");
	
	Wait_(25);
	
	
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 20);
	WaitFade_();
	
	Wait_(35);
	
	PlaySE_("SE_FLD_135");
	efc_player = SetSelectBoneEffect_("ef732_09_light_reactor_c", player, ATTACH_EFFECT1);
	
	Wait_(39);
	
	PlaySE_("SE_DEM_193");
	SetMotion_(switch000, MOT_GIMMICK_1, BLEND_N);
	SetMotionSpeed_(switch000, 0.7);
	
	Wait_(68);

	SetMotionSpeed_(switch000, 1.0);
	SetMotion_(player, player_panel02, BLEND_M);
	Wait_(22);
	PlaySE_("SE_DEM_194");
	SetMotion_(switch000, MOT_GIMMICK_3, BLEND_N);
	WaitMotion(player);
	SetMotion_(player, MOT_WAIT, BLEND_M);
	
	Wait_(20);

	//===============================================
	//リアクター
	// 	「隠されているドアに　アクセス。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_REACTOR");
	ShowMsg_("DEMO_520_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	Wait_(25);
	
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");		// 90F

	WaitTask(task_cam);
	
	task_player = Task_RotateToDirSetMotion_(player, 300, 2.85, MOT_WALK, MOT_WAIT);
	
	efc_smoke000 = SetPointWorldEffect_("ef852_06_door_smoke", "efc_nat000");
	SetEffectScale_(efc_smoke000, 1.2);
	efc_smoke001 = SetPointWorldEffect_("ef852_06_door_smoke", "efc_nat001");
	SetEffectScale_(efc_smoke001, 1.2);
	efc_smoke002 = SetPointWorldEffect_("ef852_06_door_smoke", "efc_nat002");
	SetEffectScale_(efc_smoke002, 1.21);
	efc_smoke003 = SetPointWorldEffect_("ef852_06_door_smoke", "efc_nat003");
	SetEffectScale_(efc_smoke003, 1.185);
	efc_smoke004 = SetPointWorldEffect_("ef852_06_door_smoke", "efc_nat004");
	SetEffectScale_(efc_smoke004, 1.185);
	efc_smoke005 = SetPointWorldEffect_("ef852_06_door_smoke", "efc_nat005");
	SetEffectScale_(efc_smoke005, 1.18);
	efc_smoke006 = SetPointWorldEffect_("ef852_06_door_smoke", "efc_nat006");
	SetEffectScale_(efc_smoke006, 1.2);
	
	Wait_(7)
	
	efc_smoke007 = SetPointWorldEffect_("ef852_06_door_smoke", "efc_nat000");
	SetEffectScale_(efc_smoke007, 1.2);
	efc_smoke008 = SetPointWorldEffect_("ef852_06_door_smoke", "efc_nat001");
	SetEffectScale_(efc_smoke008, 1.2);
	efc_smoke009 = SetPointWorldEffect_("ef852_06_door_smoke", "efc_nat002");
	SetEffectScale_(efc_smoke009, 1.21);
	efc_smoke010 = SetPointWorldEffect_("ef852_06_door_smoke", "efc_nat003");
	SetEffectScale_(efc_smoke010, 1.185);
	efc_smoke011 = SetPointWorldEffect_("ef852_06_door_smoke", "efc_nat004");
	SetEffectScale_(efc_smoke011, 1.185);
	efc_smoke012 = SetPointWorldEffect_("ef852_06_door_smoke", "efc_nat005");
	SetEffectScale_(efc_smoke012, 1.18);
	efc_smoke013 = SetPointWorldEffect_("ef852_06_door_smoke", "efc_nat006");
	SetEffectScale_(efc_smoke013, 1.2);
	
	Wait_(7)
	
	efc_smoke014 = SetPointWorldEffect_("ef852_06_door_smoke", "efc_nat000");
	SetEffectScale_(efc_smoke014, 1.2);
	efc_smoke015 = SetPointWorldEffect_("ef852_06_door_smoke", "efc_nat001");
	SetEffectScale_(efc_smoke015, 1.2);
	efc_smoke016 = SetPointWorldEffect_("ef852_06_door_smoke", "efc_nat002");
	SetEffectScale_(efc_smoke016, 1.21);
	efc_smoke017 = SetPointWorldEffect_("ef852_06_door_smoke", "efc_nat003");
	SetEffectScale_(efc_smoke017, 1.185);
	efc_smoke018 = SetPointWorldEffect_("ef852_06_door_smoke", "efc_nat004");
	SetEffectScale_(efc_smoke018, 1.185);
	efc_smoke019 = SetPointWorldEffect_("ef852_06_door_smoke", "efc_nat005");
	SetEffectScale_(efc_smoke019, 1.18);
	efc_smoke020 = SetPointWorldEffect_("ef852_06_door_smoke", "efc_nat006");
	SetEffectScale_(efc_smoke020, 1.2);
	
	Wait_(1)
	SetMotion_(wall, MOT_GIMMICK_1, BLEND_N);
	SetMotionSpeed_(wall, 0.21);
	
	Wait_(13);
	
	StartEarthQuake_(156, 3, 0.3)
	
	Wait_(2);
	
	PlayLoopSE_("SE_DEM_013");
	
	Wait_(5);
	
	efc_wall000 = SetPointWorldEffect_("ef852_07_door_stone", "efc_wall000");
	SetEffectScale_(efc_wall000, 1.5);
	efc_wall001 = SetPointWorldEffect_("ef852_07_door_stone", "efc_wall001");
	SetEffectScale_(efc_wall001, 1.5);
	efc_wall002 = SetPointWorldEffect_("ef852_07_door_stone", "efc_wall002");
	SetEffectScale_(efc_wall002, 1.5);
	
	Wait_(9);
	
	DeleteEffectEmitter_(efc_smoke000);
	DeleteEffectEmitter_(efc_smoke006);
	DeleteEffectEmitter_(efc_smoke007);
	DeleteEffectEmitter_(efc_smoke013);
	DeleteEffectEmitter_(efc_smoke014);
	DeleteEffectEmitter_(efc_smoke020);

	Wait_(51);

	DeleteEffectEmitter_(efc_smoke001);
	DeleteEffectEmitter_(efc_smoke005);
	DeleteEffectEmitter_(efc_smoke008);
	DeleteEffectEmitter_(efc_smoke012);
	DeleteEffectEmitter_(efc_smoke015);
	DeleteEffectEmitter_(efc_smoke019);
	
	Wait_(32);
	
	DeleteEffectEmitter_(efc_wall000);
	DeleteEffectEmitter_(efc_wall001);
	DeleteEffectEmitter_(efc_wall002);
	
	Wait_(4);

	DeleteEffectEmitter_(efc_smoke002);
	DeleteEffectEmitter_(efc_smoke004);
	DeleteEffectEmitter_(efc_smoke009);
	DeleteEffectEmitter_(efc_smoke011);
	DeleteEffectEmitter_(efc_smoke016);
	DeleteEffectEmitter_(efc_smoke018);
	
	Wait_(1);

	DeleteEffectEmitter_(efc_smoke003);
	DeleteEffectEmitter_(efc_smoke010);
	DeleteEffectEmitter_(efc_smoke017);
	
	StopLoopSE_(30);
	
	Wait_(22);
	
	PlaySE_("SE_FLD_168");
	
	Wait_(10);
	
	StartDecayEarthQuake_(18, 3, 1)
	
	Wait_(30);
	
	SetMotion_(burdy, burdy_talk_L, BLEND_L);
	
	//===============================================
	//バーディ
	// 	「オー！　ホントにゲートがあったネー！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BIRDY");
	ShowMsg_("DEMO_520_MSG_060");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(burdy, burdy_idol_L, BLEND_L);
	
	Wait_(20);
		
	EndDemo(FADE_COLOR_BLACK);
}
