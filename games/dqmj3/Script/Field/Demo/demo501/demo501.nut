//=============================================
//
//		demo501[地下シェルターの町_1]
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
	local task_cam, task_player, task_bevil;
	local efc_player, efc_bevil;

// ▼リソース読込
	// キャラクター
	local player = GetPlayerId_();					// 主人公
	local n_deathvern = ReadNpc_("m206_00");		//デスバーン
	local n_bevil = ReadNpc_("m082_01");			//べビル
	
// ▼配置
	// 主人公
	SetPointPos_(player, "player000");
	SetVisible(player, true);
	
	//デスバーン
	local deathvern = ArrangePointNpc_(n_deathvern, "npc_deathvern000");
	SetVisible(deathvern, false);
	
	//べビル
	local bevil = ArrangePointNpc_(n_bevil, "npc_bevil000");
	SetPointPosNoFit_(bevil, "npc_bevil000");
	SetScaleSilhouette(bevil, SCALE.S, 0.4);

// ▼非常駐モーション読込
	
	local d_m206_00_fly	= ReadMotion_(deathvern, "m206_00_fly");
	local p_Player_look_up_L	= ReadMotion_(player, "Player_look_up_L");
	local p_Player_surprise	= ReadMotion_(player, "Player_surprise");
	local p_Player_surprise_L	= ReadMotion_(player, "Player_surprise_L");
	local p_Player_look_left_L	= ReadMotion_(player, "Player_look_left_L");

// ▼カメラ設定
	SetPointCameraEye_("000cameye");
	SetPointCameraTarget_("000camtgt");
	
// ▼エフェクト読み込み
	LoadEffect_("EF712_10_EMO_SURPRISE01");			// 「！」

// ▼天候設定
	SetWeather_(WEATHER.BAD);

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

//カット1
	StartDemo(FADE_COLOR_BLACK);
	SetMotion_(player, MOT_WALK, BLEND_N);
	task_player = Task_AnimeMove_(player, "anm_player000");
	WaitTask(task_player);
	SetMotion_(player, MOT_WAIT, BLEND_M);
	Wait_(10);
	SetMotion_(player, p_Player_look_up_L, BLEND_XL);
	Wait_(30);
	
//カット2
	SetVisible(deathvern, true);
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");
	PlaySE_("SE_DEM_129");											//■SE:デスバーンが空を横切る
	SetPointPos_(deathvern, "npc_deathvern000");
	SetMotion_(deathvern, d_m206_00_fly, BLEND_N); //200F
	
	Wait_(130);
	
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 15);
	WaitFade_();
	ReadWaitingLod("002cameye", "002camtgt");
	
//カット4
	SetPointPos_(player, "player001");
	local task = Task_RotateToDir_(player, 230, 230);
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 15);
	SetMotion_(bevil, MOT_WALK, BLEND_XL);
	task_bevil = Task_AnimeMoveNoFit_(bevil, "anm_bevil003");
	WaitFade_();
	
	SetPointCameraEye_("002cameye");
	SetPointCameraTarget_("002camtgt");
	
	WaitTask(task_bevil);
	
	SetMotion_(bevil, MOT_WAIT, BLEND_M);
	
	//===============================================
	//*マグマパーク住人Ａ
	// 	「今日も　ふてぶてしく　飛んでやがる。
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_501_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(player, p_Player_look_left_L, BLEND_M);
	SetDirToPlayer_(bevil);
	
	Wait_(5);
	SurpriseDisp(player);

	//ビックリマークを表示
	local efc_mother = SetSelectBoneEffectSetOffset_("ef712_10_emo_surprise01", bevil, ATTACH_EFFECT1, Vec3(0.0, 0.0, 0.0));
	SetEffectScale_(efc_mother, 5.0);

	Wait_(30);

//カット5
	local task = Task_RotateToDir_(bevil, 183, 183);
	task_cam = Task_AnimeMoveCamera_("001anmeye", "001anmtgt");
	DeleteTask_(task_cam);
	task_bevil = Task_AnimeMoveNoFit_(bevil, "anm_bevil001");
	DeleteTask_(task_bevil);
	
	//===============================================
	//*マグマパーク住人Ａ
	// 	おっ！？　誰だっ！？
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_501_MSG_020");
	
	SetMotion_(bevil, MOT_DAMAGE, BLEND_N);
	WaitMotion(bevil);	
	SetMotion_(bevil, MOT_WAIT, BLEND_XL);
	
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	task_bevil = Task_AnimeMoveNoDirNoFit_(bevil, "anm_bevil001");
	task_cam = Task_AnimeMoveCamera_("001anmeye", "001anmtgt");
	SetMotion_(bevil, MOT_WAIT, BLEND_XL);
	WaitTask(task_bevil);
	SetDirToObject_(player, bevil);
	
	//===============================================
	//*マグマパーク住人Ａ
	// 	「……あれっ？
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_501_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	WaitTask(task_cam);
		
	SetMotion_(bevil, MOT_RUN, BLEND_L);
	task_cam = Task_AnimeMoveCamera_("002anmeye", "002anmtgt");
	task_bevil = Task_AnimeMoveNoFit_(bevil, "anm_bevil002");
	Wait_(45);
	SetMotion_(player, p_Player_surprise, BLEND_L);
	WaitMotion(player);
	SetMotion_(player, p_Player_surprise_L, BLEND_N);
	WaitTask(task_bevil);
	WaitTask(task_cam);

	SetMotion_(bevil, MOT_SWORD_CHARGE, BLEND_L);
	
	//===============================================
	//*マグマパーク住人Ａ
	// 	「戻ってきたのか　アンセス！
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_501_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetPointPosNoFit_(bevil, "npc_bevil001");
	SetVisible(player, false);
	SetMotion_(bevil, MOT_TALKLOOP, BLEND_L);
	SetPointCameraEye_("003cameye");
	SetPointCameraTarget_("003camtgt");

	//===============================================
	//*マグマパーク住人Ａ
	// 	こうしちゃいられないな！
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_501_MSG_050");
	KeyInputWait_();
	//===============================================

	//===============================================
	//*マグマパーク住人Ａ
	// 	「アンセス！　何　ボーッとしてんだ？
	//-----------------------------------------------
	ShowMsg_("DEMO_501_MSG_060");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	Wait_(15);
	EndDemo(FADE_COLOR_BLACK);
}
