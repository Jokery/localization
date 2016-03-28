//=============================================
//
//		demo814[陸のスターピース入手]
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
	local efc_player, efc_yachihoko, efc_seed;

// ▼リソース読込
	// ギミック
	local model_base = ReadGimmick_("o_effect_base");	// エフェクトベース
	// キャラクター
	local player = GetPlayerId_();						// 主人公
	local model_yachihoko = ReadNpc_("m171_00");		// 陸の神ヤチホコ
	// エフェクト
	LoadEffect_("ef881_01_god_die_land");				// 神死亡の光 陸
	LoadEffect_("ef732_19_star_seed_g");				// スターシード 緑
	LoadEffect_("ef732_29_star_egg_g");					// スターエッグ 緑

// ▼配置
	// 主人公
	SetPointPos_(player, "player000");
	SetVisible(player, false);
	// 陸の神ヤチホコ
	local yachihoko = ArrangePointNpc_(model_yachihoko, "npc_yachihoko000");
	SetScale_(yachihoko, 4.0);
	
	// スターシード 緑（エフェクトベース）
	local seed = ArrangePointGimmick_("o_effect_base", model_base, "obj_seed000");

// ▼非常駐モーション読込
	// 主人公
	local player_hold_L = ReadMotion_(player, "Player_hold_L");		// 物を持つ

// ▼モーション設定
	SetMotion_(yachihoko, MOT_SPELL_CHARGE, BLEND_N);
	SetMotionSpeed_(yachihoko, 0.2);
	
// ▼カメラ設定
//	SetPointCameraEye_("cameye000");
//	SetPointCameraTarget_("camtgt000");
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");		// 200F
	DeleteTask_(task_cam);
	StartBlurEffect_();

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	// ▼カット１＠ヤチホコＵＰ～～～～～～～～～～～～～～～～
	
	//===============================================
	// ■陸の神ヤチホコ
	// 「見事なり……！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_YACHIHOKO");
	ShowMsg_("DEMO_814_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	// ▼カット２＠ヤチホコやられ～～～～～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");		// 200F
	PlaySE_("SE_DEM_198");
	SetMotion_(yachihoko, MOT_DAMAGE, 45);
	Wait_(45);
	
	efc_yachihoko = SetBoneEffect_("ef881_01_god_die_land", yachihoko);	// 神死亡の光 陸
	SetMotionSpeed_(yachihoko, 0.1);
	Wait_(40);
	SetMotionSpeed_(yachihoko, 0.2);
	Wait_(100);
	
	SetAlpha_(yachihoko, ALPHA_CLEAR);
	
	efc_seed = SetSelectBoneEffect_("ef732_29_star_egg_g", seed, ATTACH_GLOBAL);
	SetEffectScale_(efc_seed, 4.0);
	
	EndBlurEffect_();

	DeleteTask_(task_cam);
	
	// ▼カット２＠スターピース出現～～～～～～～～～～～～～～

	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	Wait_(30);
	
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");
	Wait_(280);
	
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
	// 陸のスターピースを　手に入れた！
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_814_MSG_020");
	PlayMe_("ME_010");
	WaitMe_();
	KeyInputWait_();
	
	//-----------------------------------------------
	// ▽
	// センタービルの　地下１階で待っている
	//-----------------------------------------------
	ShowMsg_("DEMO_814_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	EndDemo(FADE_COLOR_BLACK);
}
