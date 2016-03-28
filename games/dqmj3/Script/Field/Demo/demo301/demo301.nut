//=============================================
//
//		demo301[鉄砲玉との遭遇]
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
	local task_cam, task_player, task_momonja, task_henchman, task_west;
	local efc_cam, efc_player, efc_momonja;
	local effect_pos = Vec3(0.0, 3.0, 0.0);
	local rot_player00 = Vec3(-171.4474, 31.47983, 177.4337);		// 80°
	local rot_player01 = Vec3(-214.63692, 31.47983, 160.56419);		// 160°
	local rot_player02 = Vec3(-214.19415, 31.01984, 192.15332);		// -30°
	local rot_henchman = Vec3(-213.11865, 31.22486, 132.75562);		// 180°

// ▼リソース読込
	// キャラクター
	local player = GetPlayerId_();					// 主人公
	local model_ookzchi = ReadNpc_("m035_00");		// おおきづち
	local model_momonja = ReadNpc_("m041_02");		// メイジももんじゃ
	local model_darkmmn = ReadNpc_("m083_04");		// ダークモーモン
	// エフェクト
	LoadEffect_("ef733_01_sym_shuchusen01");		// 集中線
	LoadEffect_("ef712_13_emo_sweat01");			// 汗
	LoadEffect_("ef712_07_emo_anger01");			// 怒り
	//ギミック
	local ice_wall = ReadGimmick_("o_I01_00");		// 氷の壁

// ▼配置
	// 主人公
	SetPointPos_(player, "player000");
	SetFace_(player, "Face_eyes_close");
	// トードー子分
	local henchman = ArrangePointNpc_(model_ookzchi, "npc_henchman000");
	SetScaleSilhouette(henchman, SCALE.N, SILHOUETTE_WIDTH.S);
	SetAlpha_(henchman, ALPHA_CLEAR);
	SetStepSePan_(henchman, false);
	// ももんじゃ
	local momonja = ArrangePointNpc_(model_momonja, "npc_momonja000");
	SetScaleSilhouette(momonja, SCALE.N, SILHOUETTE_WIDTH.S);
	SetAlpha_(momonja, ALPHA_CLEAR);
	SetStepSePan_(momonja, false);
	// 西ポーラパーク住人
	local west = ArrangePointNpc_(model_darkmmn, "npc_west000");
	SetScaleSilhouette(west, SCALE.N, SILHOUETTE_WIDTH.S);
	SetMotionSpeed_(west, 0.5);
	
	//ギミック
	local res_ice = ArrangePointGimmick_("o_I01_00", ice_wall, "obj_ice_wall000");	//氷の壁

// ▼非常駐モーション読込
	// 主人公
	local player_look_up_L = ReadMotion_(player, "Player_look_up_L");				// 上を見るL
	local player_look_left_L = ReadMotion_(player, "Player_look_left_L");			// 左を見るL
	local player_surprise = ReadMotion_(player, "Player_surprise");					// 驚く
	// ももんじゃ
	local momonja_fall_stand_up = ReadMotion_(momonja, "m041_02_fall_stand_up");	// 転がる→顔を上げる

// ▼カメラ設定
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");		// 180F


//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);

	// ▼カット１＠氷の木と氷の壁～～～～～～～～～～～～～～～
	WaitTask(task_cam);

	//-----
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 15);
	WaitFade_();


	// ▼カット２＠主人公カメライン～～～～～～～～～～～～～～
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

	Wait_(10);
	task_player = Task_MoveForward_(player, 1.0, false);
	SetMotion_(player, MOT_WALK, BLEND_N);
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 15);
	//-----

	Wait_(100);
	DeleteTask_(task_player);
	task_player = Task_WalkAroundToPos(player, rot_player00, 5.0);
	Wait_(15);
	PlaySE_("SE_FLD_016");	// 足音
	WaitTask(task_player);
	SetMotion_(player, player_look_up_L, BLEND_XL);		// 上を見るL
	Wait_(15);
	PlaySE_("SE_FLD_016");	// 足音
	Wait_(30);
	SetPointPos_(player, "player001");


	// ▼カット３＠主人公にズームイン～～～～～～～～～～～～～
	SetPointCameraEye_("cameye003");
	SetPointCameraTarget_("camtgt003");

	//===============================================
	// *鉄砲玉モンスター
	// 「どけどけどけ～っ！！
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_301_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");		// 30F
	PlaySE_("SE_DEM_026");												// ■SE:集中線
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", CAMERA_DEF);	// 集中線

	// ももんじゃ足音設定
	uPlayStepSE(3);
	uPlayStepSE(4);
	uPlayStepSE(4);
	uPlayStepSE(4);

	task_player = Task_RotateToPos_(player, rot_player01, 22.9);
	SetMotion_(player, player_surprise, BLEND_M);						// 驚く
	Wait_(12);

	//-----
	SetFade_(FADE_OUT, FADE_COLOR_WHITE, 8);
	WaitFade_();

	PlaySE_("SE_DEM_004");	// 「ドシンッ！」

	DeleteEffect_(efc_cam);
	DeleteTask_(task_player);
	DeleteTask_(task_cam);


	// ▼カット４＠ももんじゃ転がる～～～～～～～～～～～～～～
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");

	Wait_(30);
	SetAlpha_(momonja, ALPHA_EXIST);
	SetMotion_(momonja, momonja_fall_stand_up, BLEND_N);					// 転がる→顔を上げる
	task_momonja = Task_ChangeMotion_(momonja, MOT_WAIT, BLEND_M);

	SetFade_(FADE_IN, FADE_COLOR_WHITE, FADE_DEF);
	//-----

	uPlayStepSE(100);
	Wait_(15);

	//===============================================
	// *鉄砲玉モンスター
	// 「うおあっ！　いてぇっ！？
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_301_MSG_020");
	KeyInputWait_();
	efc_momonja = SetSelectBoneEffectSetOffset_("ef712_07_emo_anger01", momonja, ATTACH_EFFECT1, effect_pos);	// 怒り
	SetEffectScale_(efc_momonja, 3.0);
	//-----------------------------------------------
	// ▽
	// 「ちっきしょう……気を付けろっ！！
	//-----------------------------------------------
	ShowMsg_("DEMO_301_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	DeleteTask_(task_momonja);
	DeleteEffect_(efc_momonja);
	task_momonja = Task_AnimeMoveSetMotion_(momonja, "anm_momonja000", MOT_RUN, MOT_WAIT);
	efc_momonja = SetSelectBoneEffectSetOffset_("ef712_13_emo_sweat01", momonja, ATTACH_EFFECT1, effect_pos);	// 汗
	SetEffectScale_(efc_momonja, 3.0);

	SetPointPos_(player, "player002");
	SetMotion_(player, MOT_WAIT, BLEND_N);
	SetFace_(player, "Face_eyes_close");


	// ▼カット５＠ももんじゃ逃げていく～～～～～～～～～～～～
	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");

	Wait_(2);
	PlaySE_("SE_FLD_031");	// 足音
	Wait_(13);
	SetMotion_(player, player_look_left_L, BLEND_XL);		// 左を見るL

	WaitTask(task_momonja);

	// トードー子分登場
	SetAlpha_(henchman, ALPHA_EXIST);
	SetMotion_(henchman, MOT_RUN, BLEND_M);
	task_henchman = Task_MoveToPointSetSpeed_(henchman, "npc_henchman001", 1.0);
	Wait_(15);
	SetMotion_(player, MOT_WALK, BLEND_XL)
	Wait_(10);
	task_player = Task_RotateToPosSetMotion_(player, GetPos_(henchman), ROTATE_DEMO_DEF/3 ,MOT_WALK, MOT_WAIT);
	Wait_(15);
	WaitTask(task_henchman);
	SetMotion_(henchman, MOT_TALKLOOP, BLEND_L);

	//===============================================
	// *トードーの子分
	// 「くそっ！　逃しちまった！
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_301_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	// トードー子分退場
	task_henchman = Task_WalkAroundToPos(henchman, rot_henchman, ROTATE_DEMO_DEF);
	WaitTask(task_henchman);
	task_henchman = Task_MoveToPointSetSpeed_(henchman, "npc_henchman000", 0.5);
	WaitTask(task_henchman);
	SetAlpha_(henchman, ALPHA_CLEAR);
	SetMotion_(henchman, MOT_WAIT, BLEND_N);
	Wait_(15);

	// 西ポーラパーク住人登場
	task_west = Task_RotateToDir_(west, 40, 1);
	WaitTask(task_west);
	DeleteTask_(task_west);
	task_west = Task_MoveToPointSetSpeed_(west, "npc_henchman001", 0.5);
	Wait_(45);

	// ▼カット６＠西パーク住人カメライン～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");		// 60F

	WaitTask(task_west);
	DeleteTask_(task_west);
	task_west = Task_RotateToPos_(west, GetPos_(player), ROTATE_DEMO_DEF/3);
	WaitTask(task_west);
	DeleteTask_(task_west);

	//===============================================
	// *西ポーラパーク住人Ｄ
	// 「あんた　大丈夫だったか？
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_301_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();


	// ▼カット７＠西パーク住人アップ～～～～～～～～～～～～～
	SetPointCameraEye_("cameye004");
	SetPointCameraTarget_("camtgt004");

	Wait_(5);

	//-----------------------------------------------
	// 「今　この西ポーラパークは　抗争中でよ。
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_301_MSG_060");
	KeyInputWait_();
	//-----------------------------------------------
	// ▽
	// 「くわしい話が　聞きたかったら
	//-----------------------------------------------
	ShowMsg_("DEMO_301_MSG_070");
	KeyInputWait_();
	CloseMsgWnd_();


	// ▼カット８＠親分の屋敷を映す～～～～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");		// 60F

	task_west = Task_RotateToDir_(west, 180, ROTATE_DEMO_DEF/2);
	Wait_(5);

	//-----------------------------------------------
	// 「ホレ　親分の屋敷は　あそこじゃ。
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_301_MSG_080");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	WaitTask(task_cam);

	EndDemo(FADE_COLOR_BLACK);
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		ももんじゃ足音設定
//------------------------------------------------
//	引数	: wait	待ち時間
//	戻り値	: なし
//++++++++++++++++++++++++++++++++++++++++++++++++
function uPlayStepSE(wait)
{
	Wait_(wait);
	PlaySE_("SE_FLD_031");	// 足音
}
