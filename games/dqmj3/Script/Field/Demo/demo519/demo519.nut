//=============================================
//
//		demo519[デスバーン再戦]
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
	LoadEffect_("ef733_01_sym_shuchusen01");				// 集中線
	LoadEffect_("ef721_02_nat_smoke_n02");

// ▼配置
	// 主人公
	SetPointPos_(player, "player002");
	// バーディ
	local burdy = ArrangePointNpc_(model_burdy, "npc_burdy002");
	SetScaleSilhouette(burdy, SCALE.N, SILHOUETTE_WIDTH.N);
	// デスバーン
	local desburn = ArrangePointNpc_(model_desburn, "npc_desburn001");
	SetScaleSilhouette(desburn, 0.85, 1.0);
	task_desburn = Task_AnimeMoveNoFit_(desburn, "anm_desburn001");	// 115F
	DeleteTask_(task_desburn);
	
	// 秘密基地入り口の岩壁(待機)
	local wall = ArrangePointGimmick_("o_V00_03", model_wall, "obj_wall000");
	// 認証装置（起動前）
	local switch000 = ArrangePointGimmick_("o_V00_11", model_switch, "obj_switch000");
	SetPointPos_(switch000, "obj_switch001");
	// ルーラポイント
	local ruler = ArrangePointGimmick_("o_com_08", model_ruler, "obj_ruler000");
	if(GetEventFlg_("BFG_RULER_ADD_021") == true){
		SetMotion_(ruler, MOT_GIMMICK_2, BLEND_N);
	}

// ▼非常駐モーション読込
	local player_battle_L = ReadMotion_(player, "Player_battle_L");			// 戦闘待機L

	local burdy_idol_L = ReadMotion_(burdy, "n019_idol");	// 待機L
	local burdy_talk_L = ReadMotion_(burdy, "n019_talk");	// 会話L
	
	local desburn_flight_Hovering_L = ReadMotion_(desburn, "m206_00_flight_Hovering_L");	// ホバリングL

// ▼カメラ設定
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	WaitLod_();

// ▼天候設定
	SetWeather_(WEATHER.BAD);

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	SetMotion_(player, player_battle_L, BLEND_N);
	SetMotion_(burdy, burdy_idol_L, BLEND_N);
	SetMotion_(desburn, desburn_flight_Hovering_L, BLEND_N);
	
	task_desburn = Task_AnimeMoveNoFit_(desburn, "anm_desburn001");	// 130F

	StartDemo(FADE_COLOR_BLACK);
	local task_fly = Task_PlaySe_("SE_FLD_036", 26);

	Wait_(95);
	
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

	Wait_(80);
	
	SetMotion_(burdy, burdy_talk_L, BLEND_L);
	
	Wait_(5);
	
	//===============================================
	//*バーディ
	// 	「戻ってきたネー　アンセス！ 
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BIRDY");
	ShowMsg_("DEMO_519_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(burdy, burdy_idol_L, BLEND_L);
	
	Wait_(30);
	
	SetActive_(player, false);
	SetActive_(burdy, false);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット2
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");		// 57F
	DeleteTask_(task_cam);
	
	SetPointPos_(desburn, "npc_desburn002");
	
	Wait_(10);
	
	//===============================================
	//*デスバーン
	// 	「敵性ノ　もんすたーますたー反応アリ。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_DEATHBURN");
	ShowMsg_("DEMO_519_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");		// 57F
	
	Wait_(25);
	
	SetMotion_(desburn, MOT_SPELL_ACTUATE, BLEND_L);
	PlaySE_("SE_DEM_095");

	Wait_(25);
	
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", CAMERA_DEF);
	SetMotionSpeed_(desburn, 0.8);
	
	Wait_(7);
	
	EncountEndDemo(ENCOUNT_BOSS);
}
