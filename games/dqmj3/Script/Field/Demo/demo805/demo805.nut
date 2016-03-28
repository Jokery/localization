//=============================================
//
//		demo805[ディスクマシーンの秘密]
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
	local task_cam, task_player, task_aroma;
	local task_aroma_step;
	local efc_seed;

// ▼リソース読込
	// ギミック
	local model_disc = ReadGimmick_("o_com_18");	// ディスク装置
	local model_sougen = ReadGimmick_("o_A01_05");	// 草原パネル（起動前）
	local model_houraku = ReadGimmick_("o_A01_06");	// 崩落パネル（起動前）
	local model_boti = ReadGimmick_("o_A01_07");	// 墓地パネル（起動前）
	local model_koori = ReadGimmick_("o_A01_08");	// 氷パネル（起動前）
	local model_suna = ReadGimmick_("o_A01_09");	// 砂パネル（起動前）
	local model_kazan = ReadGimmick_("o_A01_10");	// 火山パネル（起動前）
	local model_door = ReadGimmick_("o_A01_16");	// エレベーターの扉(閉じた状態)
	// キャラクター
	local player = GetPlayerId_();					// 主人公
	local model_aroma = ReadNpc_("n018");			// アロマ

// ▼配置
	// ディスク装置
	local disc = ArrangePointGimmick_("o_com_18", model_disc, "obj_disc000");
	SetMotion_(disc, MOT_GIMMICK_2, BLEND_N);
	// 各種パネル（起動前）
	local sougen = ArrangePointGimmick_("o_A01_05", model_sougen, "obj_panel000");
	SetMotion_(sougen, MOT_GIMMICK_1, BLEND_N);
	local houraku = ArrangePointGimmick_("o_A01_06", model_houraku, "obj_panel000");
	SetMotion_(houraku, MOT_GIMMICK_1, BLEND_N);
	local boti = ArrangePointGimmick_("o_A01_07", model_boti, "obj_panel000");
	SetMotion_(boti, MOT_GIMMICK_1, BLEND_N);
	local koori = ArrangePointGimmick_("o_A01_08", model_koori, "obj_panel000");
	SetMotion_(koori, MOT_GIMMICK_1, BLEND_N);
	local suna = ArrangePointGimmick_("o_A01_09", model_suna, "obj_panel000");
	SetMotion_(suna, MOT_GIMMICK_1, BLEND_N);
	local kazan = ArrangePointGimmick_("o_A01_10", model_kazan, "obj_panel000");
	SetMotion_(kazan, MOT_GIMMICK_1, BLEND_N);
	// エレベーターの扉(閉じた状態)
	local door0 = ArrangePointGimmick_("o_A01_16", model_door, "obj_door000");
	local door1 = ArrangePointGimmick_("o_A01_16", model_door, "obj_door001");
	
	// 主人公
	SetPointPos_(player, "player000");
	// アロマ
	local aroma = ArrangePointNpc_(model_aroma, "npc_aroma000");
	SetStepSe_(aroma, SILENT_STEP_SE);
	
	task_aroma = Task_AnimeMove_(aroma, "anm_aroma000");
	DeleteTask_(task_aroma);
	
// ▼非常駐モーション読込
	local player_talk = ReadMotion_(player, "Player_talk");				// 通常待機→しゃべり
	local player_talk_L = ReadMotion_(player, "Player_talk_L");			// しゃべりL
	
	local aroma_star_seed_L = ReadMotion_(aroma, "n018_star_seed_L");	// スターシードを持つL
	local aroma_look_down_L = ReadMotion_(aroma, "n018_look_down_L");	// 下向き待機L

// ▼カメラ設定
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------
	
	StartDemo(FADE_COLOR_BLACK);
	
	Wait_(15);
	
	task_aroma = Task_AnimeMove_(aroma, "anm_aroma000");	// 50F
	SetMotionSpeed_(aroma, 0.88);
	SetMotion_(aroma, MOT_WALK, BLEND_N);
	task_aroma_step = Task_PlaySe_("SE_FLD_016", 17);
	
	Wait_(35);
	
	task_player = Task_RotateToDir_(player, 110, ROTATE_DEMO_DEF);
	SetMotionSpeed_(player, 0.9);
	SetMotion_(player, MOT_WALK, BLEND_M);
	
	WaitTask(task_aroma);
	SetMotionSpeed_(aroma, 1.0);
	SetMotion_(aroma, MOT_WAIT, BLEND_L);
	Wait_(5);
	DeleteTask_(task_aroma_step);
	
	WaitTask(task_player);
	SetMotionSpeed_(player, 1.0);
	SetMotion_(player, MOT_WAIT, BLEND_L);
	
	Wait_(40);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット2
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	
	SetPointPos_(player, "player001");
	SetPointPos_(aroma, "npc_aroma001");
	SetDirToPlayer_(aroma);
	SetDirToObject_(player, aroma);
	
	Wait_(5);
	
	SetMotion_(aroma, MOT_TALK, BLEND_M);
	task_aroma = Task_ChangeMotion_(aroma, MOT_TALKLOOP, BLEND_S);
	
	Wait_(22);
	
	//===============================================
	// ■アロマ
	// 「あらためて言うけど……産星神は
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_805_MSG_010");
	KeyInputWait_();
	
	//===============================================
	// ■アロマ
	// 「普通にやっても　勝負にならないわね。
	//-----------------------------------------------
	ShowMsg_("DEMO_805_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット3
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");	// 150F
	
	SetActive_(player, false);
	
	//===============================================
	// ■アロマ
	// 「でも……すでに対策は　確立されてるわ。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_805_MSG_030");
	KeyInputWait_();
	
	//===============================================
	// ■アロマ
	// 「それぞれ　○ヤチホコ用○　○ワダツミ用○
	//-----------------------------------------------
	ShowMsg_("DEMO_805_MSG_040");
	KeyInputWait_();
	
	//===============================================
	// ■アロマ
	// 「それがあれば　アンタひとりでも
	//-----------------------------------------------
	ShowMsg_("DEMO_805_MSG_050");
	KeyInputWait_();
	
	DeleteTask_(task_aroma);
	SetMotion_(aroma, aroma_look_down_L, 10);
	
	Wait_(5);
	
	//===============================================
	// ■アロマ
	// 「ただね……その３つのアクセサリーって
	//-----------------------------------------------
	ShowMsg_("DEMO_805_MSG_060");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	Wait_(20);
	
	WaitTask(task_cam);
	
	Wait_(5);

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット4
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");	// 150F
	
	SetMotion_(aroma, MOT_WAIT, BLEND_N);
	
	Wait_(40);
	
	//===============================================
	// ■アロマ
	// 「知ってるとは思うけど　ディスクシステムって
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_805_MSG_070");
	KeyInputWait_();
	
	//===============================================
	// ■アロマ
	// 「だから　アクセサリーのある　異世界に
	//-----------------------------------------------
	ShowMsg_("DEMO_805_MSG_080");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	WaitTask(task_cam);
	
	Wait_(25);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット5
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");	// 300F
	
	SetActive_(player, true);
	
	Wait_(5);
	
	SetMotion_(player, player_talk, BLEND_M);
	WaitMotion(player);
	SetMotion_(player, player_talk_L, BLEND_S);
	
	Wait_(48);
	
	SetMotion_(player, MOT_WAIT, 10);
	
	Wait_(11);
	
	SetMotion_(aroma, MOT_TALK, BLEND_M);
	task_aroma = Task_ChangeMotion_(aroma, MOT_TALKLOOP, BLEND_S);
	
	Wait_(15);
	
	//===============================================
	// ■アロマ
	// 「アクセサリーのある　異世界へ行く
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_805_MSG_090");
	KeyInputWait_();
	
	//===============================================
	// ■アロマ
	// 「だって　このディスクシステムには
	//-----------------------------------------------
	ShowMsg_("DEMO_805_MSG_100");
	KeyInputWait_();
	
	//===============================================
	// ■アロマ
	// 「ロックが　かかっているようだけど
	// 　このアタシに　かかれば……！
	//-----------------------------------------------
	ShowMsg_("DEMO_805_MSG_103");
	KeyInputWait_();
	CloseMsgWnd_();
	//-----------------------------------------------
	SetMotion_(aroma, MOT_WAIT, 10);
	Wait_(20);
	SetMotion_(aroma, MOT_WALK, BLEND_M);
	task_aroma = Task_RotateToDir_(aroma, -90, 5.7);
	task_aroma_step = Task_PlaySe_("SE_FLD_016", 15);
	WaitTask(task_aroma);
	task_aroma = Task_MoveForward_(aroma, 1.0, false);				//アロマ移動
	Wait_(20);

	SetMotion_(player, MOT_WALK, BLEND_M);
	task_player = Task_RotateToDir_(player, -90, 5.7);				//主人公向き
	WaitTask(task_player);
	SetMotion_(player, MOT_WAIT, BLEND_M);
	Wait_(20);
	//フェードアウト---------------------------------------------------------------------
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);
	WaitFade_();
	SetMotion_(aroma, MOT_WAIT, BLEND_M);
	DeleteTask_(task_aroma);
	DeleteTask_(task_aroma_step);
	Wait_(30);
	PlaySE_("SE_DEM_012");					//■SE：エースのリアクター改造音
	Wait_(100);
	DeleteTask_(task_cam);
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット6
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetPointPos_(player, "player002");
	SetPointPos_(aroma, "npc_aroma002");
	SetFace_(aroma, "Face_smile");
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");		// 200F

	//フェードイン---------------------------------------------------------------------
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);
	WaitFade_();
	
	SetMotion_(aroma, MOT_TALK, BLEND_M);
	task_aroma = Task_ChangeMotion_(aroma, MOT_TALKLOOP, BLEND_S);
	//===============================================
	// ■アロマ
	// 「カンッペキ！　これでもう　好きな時に
	// 　ディスクを　作れるようになったわ！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_805_MSG_106");
	KeyInputWait_();
	
	//===============================================
	// ■アロマ
	// 「ＭＡＰなディスクを　作るにあたって
	//-----------------------------------------------
	ShowMsg_("DEMO_805_MSG_110");
	KeyInputWait_();
	
	//===============================================
	// ■アロマ
	// 「キーワードを　組み合わせて　ディスクに
	//-----------------------------------------------
	ShowMsg_("DEMO_805_MSG_120");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(aroma, MOT_WAIT, 10);
	
	Wait_(40);
	DeleteTask_(task_aroma);
	DeleteTask_(task_cam);	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット7
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetPointCameraEye_("cameye003");
	SetPointCameraTarget_("camtgt003");

	Wait_(5);
	
	SetMotion_(aroma, MOT_TALK, BLEND_M);
	task_aroma = Task_ChangeMotion_(aroma, MOT_TALKLOOP, BLEND_XL);
	
	Wait_(22);
	
	//===============================================
	// ■アロマ
	// 「たとえば……この○キーワード１○を
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_805_MSG_130");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	Wait_(20);
	
	DeleteTask_(task_aroma);
	SetMotion_(aroma, MOT_WAIT, BLEND_XL);	
	Wait_(20);	
	SetMotion_(aroma, aroma_star_seed_L, BLEND_XL);
	
	Wait_(25);
	//===============================================
	// ■システムメッセージ
	// キーワード　○キーワード１○と
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_805_MSG_140");
	PlayMe_("ME_010");
	WaitMe_();
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	Wait_(15);
	
	SetMotion_(aroma, MOT_TALK, BLEND_XL);
	SetMotionSpeed_(aroma, 0.9);
	task_aroma = Task_ChangeMotion_(aroma, MOT_TALKLOOP, BLEND_L);
	
	Wait_(20);
	
	//===============================================
	// ■アロマ
	// 「ディスクを作るときには　ゴールドが必要なの。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_805_MSG_150");
	KeyInputWait_();
	//-----------------------------------------------
	// ▽
	// 「完成したら　アタシに見せるのよ。
	//-----------------------------------------------
	ShowMsg_("DEMO_805_MSG_160");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	DeleteTask_(task_aroma);
	
	SetMotion_(aroma, MOT_WAIT, 10);
	
	Wait_(40);
	
	EndDemo(FADE_COLOR_BLACK);
}
