//=============================================
//
//		Demo220[レースプログラム発見]
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
	local task_cam, task_player, task_nocho, task_foot, task_foot1, task_foot2, task_foot3, task_foot4, task_foot5, efc_nocho;

// ▼フラグ設定
	local bit_ruler = GetEventFlg_("BFG_RULER_ADD_010");			// Bit_210 ルーラ追加フラグ

// ▼リソース読込
	// ギミック
	local model_ruler = ReadGimmick_("o_com_08");	// ルーラポイント
	local model_reactor = ReadGimmick_("o_dem_07");		// リアクター
	// キャラクター
	local player = GetPlayerId_();					// 主人公
	local model_nocho = ReadNpc_("n006");			// チョーマッハ
	// エフェクト
	LoadEffect_("ef712_10_emo_surprise01");			// 「！」
	LoadEffect_("ef712_01_emo_notice01");			// 気づき

// ▼配置
	// 主人公
	SetPointPos_(player, "player000");
	// チョーマッハ
	local nocho = ArrangePointNpc_(model_nocho, "npc_nocho000");
	SetStepSePan_(nocho, false);
	//リアクター
	local reactor = ArrangePointGimmick_("o_dem_07", model_reactor, "obj_reactor000");
	SetPointPosNoFit_(reactor, "obj_reactor000");
	SetMotion_(reactor, MOT_GIMMICK_0, BLEND_N);

// ▼非常駐モーション読込
	// ルーラポイント
	local ruler = ArrangePointGimmick_("o_com_08", model_ruler, "obj_ruler000");
	// ▽ルーラポイントが既に起動していた場合
	if (bit_ruler) { SetMotion_(ruler, MOT_GIMMICK_2, BLEND_N); }
	
	// 主人公
	local player_look_right_L = ReadMotion_(player, "Player_look_right_L");	// 右を向くL
	local player_look_left_L = ReadMotion_(player, "Player_look_left_L");	// 顔を少し左向けるL
	local player_talk = ReadMotion_(player, "Player_talk");					// 主人公話す
	local player_talk_L = ReadMotion_(player, "Player_talk_L");				// 主人公話すL
	// チョーマッハ
	local nocho_run_L = ReadMotion_(nocho, "n001_run_L");					// 走るL
	local nocho_think02_L = ReadMotion_(nocho, "n000_think02_L");			// 考える（腕組み）L
	local nocho_arm_folde = ReadMotion_(nocho, "n000_arm_folde");			// 考える（腕組み）→腕組み
	local nocho_arm_folde_L = ReadMotion_(nocho, "n000_arm_folde_L");		// 腕組みL
	local nocho_talk_joy_L = ReadMotion_(nocho, "n000_talk_joy_L");			// 会話（嬉しそう）L
	local nocho_hand_up = ReadMotion_(nocho, "n002_hand_up");
	local nocho_hand_up_L = ReadMotion_(nocho, "n002_hand_up_L");
	
	SetMotion_(nocho, nocho_run_L, BLEND_N);

// ▼時間設定
	SetTime_(START_TIME_ZONE_NIGHT);

// ▼カメラ設定
	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	//===============================================
	// ■チョーマッハ
	// 「おーい！
	// 　<name_player/>！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_CHOMACH");
	ShowMsg_("DEMO_220_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	task_nocho = Task_MoveForward_(nocho, 0.82, true);
	task_foot = Task_PlaySe_("SE_FLD_011", 5);
	
	Wait_(15);
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");		// 65F
	Wait_(15);
	
	Wait_(37);
	DeleteTask_(task_nocho);
	DeleteTask_(task_foot);
	SetMotion_(nocho, MOT_WAIT, BLEND_M);
	
	Wait_(5);
	SetMotion_(nocho, MOT_TALK, BLEND_M);
	WaitMotion(nocho);
	SetMotion_(nocho, MOT_TALKLOOP, BLEND_M);
	
	WaitTask(task_cam);
	
	//===============================================
	// ■チョーマッハ
	// 「やっつけたのかッシュ　ブンドルドを！
	// 　それで……リアクターは　あったッシュ？
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_CHOMACH");
	ShowMsg_("DEMO_220_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(nocho, MOT_WAIT, BLEND_M);
	
	SetMotion_(player, player_talk, BLEND_M);	// 主人公説明
	WaitMotion(player);
	SetMotion_(player, player_talk_L, BLEND_M);
	Wait_(65);
	
	SetMotion_(player, player_look_right_L, BLEND_XL);
	Wait_(5);
	
	task_nocho = Task_RotateToDirSetMotion_(nocho, 250, ROTATE_DEMO_DEF, MOT_WALK, MOT_WAIT);
	task_foot1 = Task_PlaySe_("SE_FLD_011", 7);
	Wait_(22);
	
	DeleteTask_(task_foot1);
	SurpriseDisp(nocho);
	
	Wait_(60);
	
	DeleteTask_(task_nocho);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	// ■カット2
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");		// 60F
	WaitTask(task_cam);
	
	//===============================================
	// ■チョーマッハ
	// 「おおっ！　リアクターだッシュ！
	// 　今すぐ　マッハで調べてみるッシュ！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_CHOMACH");
	ShowMsg_("DEMO_220_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetPointPos_(nocho, "npc_nocho001");
	task_player = Task_AnimeMoveSetMotion_(player, "anm_player000", MOT_WALK, MOT_WAIT);
	task_nocho = Task_MoveForward_(nocho, 0.5, true);
	SetMotion_(nocho, nocho_run_L, BLEND_N);
	task_foot2 = Task_PlaySe_("SE_FLD_011", 5);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	// ■カット3
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	
	Wait_(29);
	DeleteTask_(task_nocho);
	DeleteTask_(task_foot2);
	
	SetMotion_(nocho, MOT_WAIT, BLEND_M);
	
	Wait_(10);
	SetMotion_(nocho, MOT_TALK, BLEND_M);
	WaitMotion(nocho);
	SetMotion_(nocho, MOT_TALKLOOP, BLEND_M);
	
	//===============================================
	// ■チョーマッハ
	// 「おおっ！　このリアクターは……
	// 　やったっちょ！　探してたもの　あったッシュ！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_CHOMACH");
	ShowMsg_("DEMO_220_MSG_040");
	KeyInputWait_();
	
	WaitTask(task_player);
	Wait_(2);
	
	SetMotion_(nocho, nocho_arm_folde_L, BLEND_L);
	Wait_(2);
	SetMotion_(player, player_look_left_L, BLEND_L);
	
	//-----------------------------------------------
	// ■チョーマッハ
	// 「ふむふむ　崩落都市のセンタービルで
	// 　このプログラムは　使えばいいッシュか。
	//-----------------------------------------------
	ShowMsg_("DEMO_220_MSG_050");
	KeyInputWait_();
	
	SetMotion_(nocho, MOT_TALK, BLEND_M);
	WaitMotion(nocho);
	SetMotion_(nocho, MOT_TALKLOOP, BLEND_M);
	
	//-----------------------------------------------
	// ■チョーマッハ
	// 「こうしちゃ　いられないッシュ！
	// 　さっそく崩落都市で　試してみるッシュ！
	//-----------------------------------------------
	ShowMsg_("DEMO_220_MSG_060");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	task_nocho = Task_RotateToDir_(nocho, 430, ROTATE_DEMO_DEF);
	SetMotion_(nocho, MOT_WALK, BLEND_M);
	WaitTask(task_nocho);
	task_nocho = Task_RotateToDir_(nocho, 445, ROTATE_DEMO_DEF);
	WaitTask(task_nocho);
	SetMotion_(nocho, nocho_run_L, BLEND_M);
	task_nocho = Task_MoveForward_(nocho, 0.6, true);
	task_foot3 = Task_PlaySe_("SE_FLD_011", 5);
	
	Wait_(33);
	DeleteTask_(task_nocho);
	DeleteTask_(task_foot3);
	
	SetMotion_(player, MOT_WAIT, BLEND_N);
	SetPointPos_(player, "player001");
	
	task_nocho = Task_AnimeMove_(nocho, "anm_nocho000");
	task_foot5 = Task_PlaySe_("SE_FLD_011", 5);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	// ■カット4
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	
	SetMotion_(player, MOT_WALK, BLEND_N);
	SetMotionSpeed_(player, 0.7);	// モーションがゆっくりになる
	task_player = Task_RotateToDir_(player, 75, 2.85);
	WaitTask(task_player);
	SetMotion_(player, MOT_WAIT, 12);
	SetMotionSpeed_(player, 1.0);
	
	WaitTask(task_nocho);
	DeleteTask_(task_foot5);
	SetMotion_(nocho, MOT_WAIT, BLEND_M);
	SurpriseDisp(nocho);
	
	Wait_(30);
	
	SetMotion_(nocho, MOT_WALK, BLEND_M);
	task_nocho = Task_RotateToDir_(nocho, -105, ROTATE_DEMO_DEF);
	WaitTask(task_nocho);
	SetMotion_(nocho, nocho_talk_joy_L, BLEND_M);
	Wait_(2);
	
	//===============================================
	// ■チョーマッハ
	// 「シュシュッ！　礼を言うのを　忘れてたッシュ！
	// 　おかげで　探してた物が　見つかったッシュ！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_CHOMACH");
	ShowMsg_("DEMO_220_MSG_070");
	KeyInputWait_();
	
	//-----------------------------------------------
	// ■チョーマッハ
	// 「今　見つけたのは　モンスターマスターのための
	// 　特別な　プログラムなんだッシュ！
	//-----------------------------------------------
	ShowMsg_("DEMO_220_MSG_080");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	DeleteTask_(task_foot3);
	SetMotion_(nocho, MOT_WAIT, BLEND_L);								//待機
	Wait_(10);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	// ■カット5 チョーマッハ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetPointPos_(nocho, "npc_nocho002");
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");			// 200F
	Wait_(10);
	
	SetMotion_(nocho, nocho_think02_L, BLEND_XL);						//考える
	
	//===============================================
	// ■チョーマッハ
	// 「ふふふ……このプログラムは　どんなものかは
	// 　崩落都市に来たら　教えてやるッシュ。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_CHOMACH");
	ShowMsg_("DEMO_220_MSG_090");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	Wait_(15);
	efc_nocho = SetSelectBoneEffectSetOffset_("ef712_01_emo_notice01", nocho, ATTACH_EFFECT1, Vec3(0.0, 0.0, 0.0));		//気づきef
	SetMotion_(nocho, nocho_arm_folde, BLEND_L);						//考える→腕組み
	WaitMotion(nocho);
	SetMotion_(nocho, nocho_arm_folde_L, BLEND_L);						//腕組みL
	
	//===============================================
	// ■チョーマッハ
	// 「そういえば　これから
	// 　あんたは　どうするつもりッシュ？
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_CHOMACH");
	ShowMsg_("DEMO_220_MSG_100");
	KeyInputWait_();
	
	SetMotion_(nocho, MOT_TALK, BLEND_XL);
	WaitMotion(nocho);
	SetMotion_(nocho, MOT_TALKLOOP, BLEND_M);
	
	//-----------------------------------------------
	// ■チョーマッハ
	// 「もし　凍骨の氷原に　行くつもりなら
	// 　このガーデンの外に出て　裏に回るッシュ。
	//-----------------------------------------------
	ShowMsg_("DEMO_220_MSG_110");
	KeyInputWait_();
	
	SetMotion_(nocho, nocho_hand_up, BLEND_XL);
	WaitMotion(nocho);
	SetMotion_(nocho, nocho_hand_up_L, BLEND_M);
	
	//-----------------------------------------------
	// ■チョーマッハ
	// 「たしか　そこに　凍骨の氷原へ行ける
	// 　移動装置への扉が　あったはずだッシュ！
	//-----------------------------------------------
	ShowMsg_("DEMO_220_MSG_120");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(nocho, MOT_WALK, BLEND_M);
	task_nocho = Task_RotateToDir_(nocho, 0, ROTATE_DEMO_DEF);
	WaitTask(task_nocho);
	task_nocho = Task_MoveForward_(nocho, 0.7, true);
	SetMotion_(nocho, nocho_run_L, BLEND_M);
	task_foot4 = Task_PlaySe_("SE_FLD_011", 5)
	
	Wait_(45);
	DeleteTask_(task_foot4);
	
	EndDemo(FADE_COLOR_BLACK);
}
