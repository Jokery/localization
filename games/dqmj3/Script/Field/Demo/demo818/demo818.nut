//=============================================
//
//		demo818[空のスターピース入手]
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
	local task_cam, task_player, task_seed;
	local efc_player, efc_hoakari, efc_seed;

// ▼リソース読込
	// ギミック
	local model_base = ReadGimmick_("o_effect_base");	// エフェクトベース
	// キャラクター
	local player = GetPlayerId_();						// 主人公
	local model_hoakari = ReadNpc_("m172_00");			// 空の神ホアカリ
	// エフェクト
	LoadEffect_("ef881_03_god_die_air");				// 神死亡の光 空
	LoadEffect_("ef732_31_star_egg_r");				// スターシード 赤

// ▼配置
	// 主人公
	SetPointPos_(player, "player000");
	SetVisible(player, false);
	// 空の神ホアカリ
	local hoakari = ArrangePointNpc_(model_hoakari, "npc_hoakari000");
	SetScale_(hoakari, 4.0);
	
	// スターシード 緑（エフェクトベース）
	local seed = ArrangePointGimmick_("o_effect_base", model_base, "obj_seed000");

// ▼非常駐モーション読込
	// 主人公
	local player_hold_L = ReadMotion_(player, "Player_hold_L");		// 物を持つ

// ▼モーション設定
	SetMotion_(hoakari, MOT_SWORD_CHARGE, BLEND_N);
	SetMotionSpeed_(hoakari, 0.3);
	
// ▼カメラ設定
//	SetPointCameraEye_("cameye000");
//	SetPointCameraTarget_("camtgt000");
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	DeleteTask_(task_cam);
	StartBlurEffect_();

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	// ▼カット１＠ホアカリＵＰ～～～～～～～～～～～～～～～～
	
	//===============================================
	// ■空の神ホアカリ
	// 「ホホホ……よくぞ　わらわに勝ったものよな。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_HOAKARI");
	ShowMsg_("DEMO_818_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	// ▼カット２＠ホアカリやられ～～～～～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");		// 200F
	
	PlaySE_("SE_DEM_198");
	SetMotion_(hoakari, MOT_DAMAGE, 60);
	Wait_(45);
	
	efc_hoakari = SetBoneEffect_("ef881_03_god_die_air", hoakari);	// 神死亡の光 空
	SetMotionSpeed_(hoakari, 0.3);
	Wait_(140);
	
	SetAlpha_(hoakari, ALPHA_CLEAR);
	
	efc_seed = SetSelectBoneEffect_("ef732_31_star_egg_r", seed, ATTACH_GLOBAL);
	SetEffectScale_(efc_seed, 4.0);
	
	EndBlurEffect_();
	DeleteTask_(task_cam);
	
	// ▼カット２＠スターピース出現～～～～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");
	Wait_(310);
	
	task_seed = Task_AnimeMoveNoFit_(seed, "anm_seed000");
	WaitTask(task_seed);
	
	SetVisible(player, true);
	SetEffectScale_(efc_seed, 0.5);
	
	SetPos_(seed, false);
	
	// ▼カット３＠スターピース、主人公の元へ～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	task_seed = Task_AnimeMoveNoFit_(seed, "anm_seed001");
	Wait_(60);
	
	SetMotion_(player, player_hold_L, BLEND_XL);
	WaitTask(task_seed);
	Wait_(60);
	
	//===============================================
	// ◇システムメッセージ
	// 空のスターピースを　手に入れた！
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_818_MSG_020");
	PlayMe_("ME_010");
	WaitMe_();
	KeyInputWait_();
	
	//-----------------------------------------------
	// ▽
	// センタービルの　地下１階で待っている
	//-----------------------------------------------
	ShowMsg_("DEMO_818_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	EndDemo(FADE_COLOR_BLACK);
}
