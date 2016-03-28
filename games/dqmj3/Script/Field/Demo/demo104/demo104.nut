//=============================================
//
//		demo104[電源の復旧_2(サブ電源A)]
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
	local efc00_acc, efc01_srp;
	local task_cam, task_cam2, task_player;
	local gimmick_motion;
	local msg_key00;

// ▼フラグ設定
	local bit_battery02 = GetEventFlg_("BFG_BATTERY_SECOND");		// Bit_1045 蓄電器②起動

	if (bit_battery02) {
		gimmick_motion = MOT_GIMMICK_1;		// 白
		msg_key00 = "DEMO_104_MSG_030"		// 「よしよし。もう１個の　サブ電源もあったな。
	}
	else {
		gimmick_motion = MOT_GIMMICK_0;		// 赤
		msg_key00 = "DEMO_104_MSG_010"		// 「そいつが　サブ電源だぜ
	}

// ▼モデル読込
	// キャラクター
	local player = GetPlayerId_();					// 主人公
	// ギミック
	local model_storage = ReadGimmick_("o_A02_01");	// 蓄電器
	local model_light_R = ReadGimmick_("o_A02_04");	// ライト（右）
	local model_light_L = ReadGimmick_("o_A02_05");	// ライト（左）
	local model_door = ReadGimmick_("o_A02_00");	// 電子ドア
	local model_monitor = ReadGimmick_("o_A02_02");	// メインモニター
	// エフェクト
	LoadEffect_("ef712_10_emo_surprise01");			// 「！」
	LoadEffect_("ef732_09_light_reactor_c");		// リアクター発光

// ▼配置
	// 蓄電器１（左）
	local storage00 = ArrangePointGimmick_("o_A02_01", model_storage, "obj_storage000");
	// ライト（右）
	local light00 = ArrangePointGimmick_("o_A02_04", model_light_R, "obj_lightR000");
	SetMotion_(light00, gimmick_motion, BLEND_N);
	// ライト（左）
	local light01 = ArrangePointGimmick_("o_A02_05", model_light_L, "obj_lightL000");
	SetMotion_(light01, MOT_GIMMICK_0, BLEND_N);
	SetAlpha_(light01, ALPHA_CLEAR);
	// ライト（左）予備
	local light_spare = ArrangePointGimmick_("o_A02_05", model_light_L, "obj_lightL000");
	SetMotion_(light_spare, MOT_GIMMICK_0, BLEND_N);
	// 電子ドア１（左側）
	local door00 = ArrangePointGimmick_("o_A02_00", model_door, "obj_door000");
	// 電子ドア２（右側）
	local door01 = ArrangePointGimmick_("o_A02_00", model_door, "obj_door100");
	// メインモニター
	local monitor = ArrangePointGimmick_("o_A02_02", model_monitor, "obj_monitor000");
	SetMotion_(monitor, MOT_GIMMICK_3, BLEND_N);			// モニタ(蓄電器右点灯)
	
	// 主人公
	SetPointPos_(player, "player000");

// ▼非常駐モーション読込
	// 主人公
	local panel = ReadMotion_(player, "Player_panel02");				// 主人公パネル操作
	local reactor = ReadMotion_(player, "Player_touch_reactor");		// 顔を少し左向ける→リアクターを触る
	local reactor_L = ReadMotion_(player, "Player_touch_reactor_L");	// リアクターを触るL
	local player_stand = ReadMotion_(player, "Player_stand01");			// リアクターを触る→待機に戻る	

// ▼カメラ設定
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	SurpriseDisp(player);
	Wait_(15);
	
	local light = SetSelectBoneEffect_("ef732_09_light_reactor_c", player, ATTACH_EFFECT1);	//リアクター発光
	OpenConnectiveWithMotion("connective_ace", player, reactor, reactor_L);
	
	//===============================================
	// ■エース
	// 分岐メッセージ
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_(msg_key00);
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	CloseConnective();
	Wait_(30);
	
	SetMotion_(player, player_stand, BLEND_L);			//リアクター触る→待機
	Wait_(25);
	
	// パネルONのSE
	SetMotion_(player, panel, BLEND_L);					//主人公パネル操作
	Wait_(5);
	PlaySE_("SE_DEM_033");								// 蓄電器起動音	
	WaitMotion(player);
	SetMotion_(player, MOT_WAIT, BLEND_L);	

	Wait_(23);
	
	StartEarthQuake_(15, 3, 0.5);

	Wait_(42);
	
	SetMotion_(storage00, MOT_GIMMICK_1, BLEND_M);		// 電源ON
	Wait_(30);
	
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 10);
	WaitFade_();
		DeleteTask_(task_cam);
		task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");		// 120F
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 10);
	
	Wait_(30);
	
	SetMotion_(light01, MOT_GIMMICK_1, BLEND_M);		// 赤→白
	for (local i=1; i<=10; i++) {
		SetAlpha_(light01, ALPHA_CLEAR + (i * 0.1));
		SetAlpha_(light_spare, ALPHA_EXIST - (i * 0.1));
		Wait_(1);
	}
	SetMotion_(light01, MOT_GIMMICK_1, BLEND_N);
	
	Wait_(30);
	
	if (bit_battery02) {
		//====================================
		//◆クロスフェード
		//====================================
		SetFade_(FADE_OUT, FADE_COLOR_BLACK, 10);
		WaitFade_();
		DeleteTask_(task_cam);
		task_cam2 = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");		// 90F
		SetFade_(FADE_IN, FADE_COLOR_BLACK, 10);
		PlaySE_("SE_DEM_039");
		SetMotion_(door00, MOT_GIMMICK_1, BLEND_M);		// ドア１開く
		Wait_(30);
		SetMotion_(door01, MOT_GIMMICK_1, BLEND_M);		// ドア２開く
		
		Wait_(59);
		
		SetMotion_(door00, MOT_GIMMICK_2, BLEND_M);		// ドア１開状態
		Wait_(30);
		SetMotion_(door01, MOT_GIMMICK_2, BLEND_M);		// ドア２開状態
		
		Wait_(15);
		
		SetFade_(FADE_OUT, FADE_COLOR_BLACK, 10);
		WaitFade_();
		DeleteTask_(task_cam2);
		task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");		// 90F
		SetFade_(FADE_IN, FADE_COLOR_BLACK, 10);
		Wait_(30);
		
		PlaySE_("SE_FLD_233");	// リアクターｱﾅﾗｲｽﾞ（分析結果表示）
		SetMotion_(monitor, MOT_GIMMICK_4, BLEND_M);		// モニタ両点灯
		
		WaitTask(task_cam);
	}
	
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 10);
	WaitFade_();
	DeleteTask_(task_cam);
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 10);
	Wait_(30);
	
	OpenConnectiveWithMotion("connective_ace", player, reactor, reactor_L);
	
	if (bit_battery02) {
		//===============================================
		// ■エース
		// 「……よし。これで大丈夫だ。
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_ACE");
		ShowMsg_("DEMO_104_MSG_040");
		KeyInputWait_();
		
		//-----------------------------------------------
		// ▽
		// 「よし！　今度は制御室に戻るんだぜ。
		//-----------------------------------------------
		ShowMsg_("DEMO_104_MSG_050");
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================
	}
	else {
		//===============================================
		// ■エース
		// 「オッケーだぜ！
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_ACE");
		ShowMsg_("DEMO_104_MSG_020");
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================
	}
	
	CloseConnective();
	Wait_(30);
	
	SetMotion_(player, player_stand, BLEND_L);			//リアクター触る→待機
	
	EndDemo(FADE_COLOR_BLACK);
}
