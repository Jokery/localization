//=============================================
//
//		demo409[ルキヤのヌケガラ]
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
	local npc_player = ReadNpc_("n027");					// 主人公(キグルミ)
	// ギミック
	local model_rukiya_doll = ReadGimmick_("o_dem_16");		// ルキヤの抜け殻
	local model_jail_door = ReadGimmick_("o_S02_02");		// 牢屋扉
	// エフェクト
	LoadEffect_("ef712_10_emo_surprise01");					// 「！」

// ▼配置
	// 主人公(キグルミ)
	local player = ArrangePointNpc_(npc_player, "player000");
	SetScaleSilhouette(player, 0.6 ,0.6);
	// ルキヤのヌケガラ
	local rukiya_doll = ArrangePointGimmick_("o_dem_16", model_rukiya_doll, "obj_rukiya_doll000");
	InitSilhouetteWidth_(rukiya_doll, 0.7);

	// 牢屋扉 東２
	local jail_door_est_2 = ArrangePointGimmick_("o_S02_02", model_jail_door, "obj_jail_door_est_2_000");
	SetMotion_(jail_door_est_2, MOT_GIMMICK_4, BLEND_N);	// 半開き・待機
	
//非常駐モーション読み込み
	local player_stand_L = ReadMotion_(player, "m127_01_hero_wait_L");
	local player_surprise = ReadMotion_(player, "m127_01_surprise");		//驚く
	local player_surprise_L = ReadMotion_(player, "m127_01_surprise_L");	//驚くL


// ▼カメラ設定
	SetMotion_(player, player_stand_L, BLEND_M);
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);

	Wait_(5);
	
	local pos = Vec3(3, 2.2, -1.6);
	efc_player = SurpriseDispSetOffset(player, pos, 1.7);
	
	SetMotion_(player, player_surprise, BLEND_M);
	WaitMotion(player);
	SetMotion_(player, player_surprise_L, BLEND_M);
		
	Wait_(30);

	//===============================================
	//◇システムメッセージ
	//なんと　中身が　ない！
	//ヌケガラ……いや　キグルミのようだ。
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_409_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	Wait_(180);

	EndDemo(FADE_COLOR_BLACK);
}
