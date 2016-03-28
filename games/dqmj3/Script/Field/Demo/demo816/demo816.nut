//=============================================
//
//		demo816[海のスターピース入手]
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
	local efc_player, efc_wadatsumi, efc_seed;

// ▼リソース読込
	// ギミック
	local model_base = ReadGimmick_("o_effect_base");	// エフェクトベース
	// キャラクター
	local player = GetPlayerId_();						// 主人公
	local model_wadatsumi = ReadNpc_("m183_00");		// 海の神ワダツミ
	// エフェクト
	LoadEffect_("ef881_02_god_die_sea");				// 神死亡の光 海
	LoadEffect_("ef732_30_star_egg_b");					// スターシード 青

// ▼配置
	// 主人公
	SetPointPos_(player, "player000");
	SetVisible(player, false);
	// 海の神ワダツミ
	local wadatsumi = ArrangePointNpc_(model_wadatsumi, "npc_wadatsumi000");
	SetScale_(wadatsumi, 4.0);
	
	// スターシード 緑（エフェクトベース）
	local seed = ArrangePointGimmick_("o_effect_base", model_base, "obj_seed000");

// ▼非常駐モーション読込
	// 主人公
	local player_hold_L = ReadMotion_(player, "Player_hold_L");		// 物を持つ

// ▼モーション設定
	SetMotion_(wadatsumi, MOT_SWORD_CHARGE, BLEND_N);
	SetMotionSpeed_(wadatsumi, 0.1);
	
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
	
	// ▼カット１＠ワダツミＵＰ～～～～～～～～～～～～～～～～
	
	//===============================================
	// ■海の神ワダツミ
	// 「ま……またしても　敗れただと！？
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_WADATSUMI");
	ShowMsg_("DEMO_816_MSG_010");
	KeyInputWait_();
	//-----------------------------------------------
	
	//-----------------------------------------------
	// ■海の神ワダツミ
	// 「このワシの持つ　星のかけらは　くれてやる！
	//-----------------------------------------------
	ShowMsg_("DEMO_816_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	// ▼カット２＠ワダツミやられ～～～～～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");		// 200F
	
	PlaySE_("SE_DEM_198");
	SetMotion_(wadatsumi, MOT_DAMAGE, 45);
	Wait_(45);
	
	efc_wadatsumi = SetBoneEffect_("ef881_02_god_die_sea", wadatsumi);	// 神死亡の光 海
	SetMotionSpeed_(wadatsumi, 0.1);
	Wait_(130);
	
	SetMotion_(wadatsumi, MOT_WAIT, BLEND_N);	// エフェクト位置調整
	SetAlpha_(wadatsumi, ALPHA_CLEAR);
	
	efc_seed = SetSelectBoneEffect_("ef732_30_star_egg_b", seed, ATTACH_GLOBAL);
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
	// 海のスターピースを　手に入れた！
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_816_MSG_030");
	PlayMe_("ME_010");
	WaitMe_();
	KeyInputWait_();
	
	//-----------------------------------------------
	// ▽
	// センタービルの　地下１階で待っている
	//-----------------------------------------------
	ShowMsg_("DEMO_816_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	EndDemo(FADE_COLOR_BLACK);
}
