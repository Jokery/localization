//=============================================
//
//		demo405[黒鉄の監獄塔へ_1(アロイパーク)]
//
//=============================================
//
//		重厚感のある歩き
//
//----------------------------------------------------------------------------
//	引数	: chr			キャラ
//			: mot			モーション
//			: spd			モーションスピード(普通:SPEED_N、ゆっくり:SPEED_S)
//			: frm			足を付く時間(デフォルト数値)
//			: tsk			タスク名
//			: endMot		タスク終了時のモーション
//			: endCnt		終了までのカウント
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
const SPEED_N = 1;
const SPEED_S = 0.5;
function WalkQuake_(chr, mot, spd, frm, tsk, endMot, endCnt)
{
	local m_spd = frm / spd;
	SetMotion_(chr, mot, 8);
	SetMotionSpeed_(chr, spd);
	
	local cnt = 0;
	local taskCnt = 0;
	while(!IsTaskEnd_(tsk)){
		StartEarthQuake_(10, 3, 0.7);
		PlaySE_("SE_DEM_014");
		Wait_(m_spd);
		taskCnt += m_spd;
		cnt++;
		if(endCnt != -1 && endCnt == taskCnt){
			return;
		}
	}
	SetMotion_(chr, endMot, BLEND_M);
	
	return cnt;
}
//-------------------------------------------------------------------------
//
//		読み込み・配置
//
//-------------------------------------------------------------------------
function Update()
{
	
// ▼変数定義
	local task_cam, task_player, task_ittaburu;

// ▼リソース読込
	// キャラクター
	local n_ittaburu = ReadNpc_("m205_00");					// イッタブル
	local g_box		 = ReadGimmick_("o_S01_02");			// はこ

// ▼配置
	// イッタブル
	local ittaburu0 = ArrangePointNpc_(n_ittaburu, "npc_ittaburu000");
	SetScale_(ittaburu0, SCALE.M);
	
	// ハコ
	local gmc_box = ArrangePointGimmick_("o_S01_02", g_box, "obj_hako000");
	SetMotion_(gmc_box, MOT_GIMMICK_0, BLEND_N);
	SetGimmickMapHitEnable_(gmc_box, false);

// ▼非常駐モーション読込
	local ittaburu_box_check = ReadMotion_(ittaburu0, "m205_00_box_check");
	local ittaburu_box_wait_L = ReadMotion_(ittaburu0, "m205_00_box_wait_L");
	local ittaburu_box_carry_L = ReadMotion_(ittaburu0, "m205_00_box_carry_L");

// ▼カメラ設定
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	
	task_ittaburu = Task_AnimeMove_(ittaburu0, "anm_ittaburu000");
	
// ▼モーション
	SetMotion_(ittaburu0, MOT_WALK, BLEND_L);
	SetMotionSpeed_(ittaburu0, 0.5);
//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	WalkQuake_(ittaburu0, MOT_WALK, 0.5, 15, task_ittaburu, MOT_WAIT, -1);
	SetMotionSpeed_(ittaburu0, 1);
	StartEarthQuake_(10, 3, 0.7);
	PlaySE_("SE_DEM_014");	
	SetMotion_(ittaburu0, MOT_WAIT, BLEND_L);
	//===============================================
	// ■イッタブル
	// 「ちゃーんと　イケニエは
	//-----------------------------------------------	
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ITABURU");
	ShowMsg_("DEMO_405_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 10);
	WaitFade_();

	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");

	task_ittaburu = Task_AnimeMove_(ittaburu0, "anm_hako");
	SetMotion_(ittaburu0, ittaburu_box_wait_L, BLEND_N);
	SetMotion_(gmc_box, MOT_GIMMICK_4, BLEND_M);

	task_ittaburu = Task_AnimeMove_(gmc_box, "anm_hako");

	SetFade_(FADE_IN, FADE_COLOR_BLACK, 10);
	WaitFade_();

	SetMotion_(gmc_box, MOT_GIMMICK_6, BLEND_M);
	SetMotion_(ittaburu0, ittaburu_box_check, BLEND_M);
	PlaySE_("SE_DEM_075");  			//「ガタゴト」SE再生
	Wait_(10);
	WaitMotion(ittaburu0);
	SetMotion_(gmc_box, MOT_GIMMICK_4, BLEND_M);
	SetMotion_(ittaburu0, ittaburu_box_wait_L, BLEND_M);
	
	//===============================================
	// ■イッタブル
	// 「よし！　では　もらっていくのである！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ITABURU");
	ShowMsg_("DEMO_405_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(ittaburu0, ittaburu_box_carry_L, BLEND_M);
	SetMotionSpeed_(ittaburu0, 0.5);
	SetMotion_(gmc_box, MOT_GIMMICK_5, BLEND_M);
	SetMotionSpeed_(gmc_box, 0.5);

	StartEarthQuake_(10, 3, 0.7);
	PlaySE_("SE_DEM_014");
	
	local task = Task_RotateToDir_(ittaburu0, 180, 2);	
	local task_b = Task_RotateToDir_(gmc_box, 180, 2);	
	Wait_(30);
	StartEarthQuake_(10, 3, 0.7);
	PlaySE_("SE_DEM_014");	
	Wait_(30);
	StartEarthQuake_(10, 3, 0.7);
	PlaySE_("SE_DEM_014");	
	
	WaitTask(task_b);
	WaitTask(task);
	task_b = Task_AnimeMove_(gmc_box, "anm_ittaburu001");	
	task_ittaburu = Task_AnimeMove_(ittaburu0, "anm_ittaburu001");
	WalkQuake_(ittaburu0, ittaburu_box_carry_L, 0.5, 15, task_ittaburu, ittaburu_box_carry_L, 60);

	StartEarthQuake_(10, 3, 0.7);
	PlaySE_("SE_DEM_014");	
	EndDemo(FADE_COLOR_BLACK);
}
