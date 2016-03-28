//=============================================
//
//		demo133[地下室にて]
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
	local player = GetPlayerId_();						// 主人公
	// ギミック
	local model_elevatordoor = ReadGimmick_("o_A01_16");// エレベーター扉
	local model_diskdevice = ReadGimmick_("o_com_18");	// ディスク装置
	local model_sougen = ReadGimmick_("o_A01_05");		// 草原パネル（起動前）
	local model_houraku = ReadGimmick_("o_A01_06");		// 崩落パネル（起動前）
	local model_boti = ReadGimmick_("o_A01_07");		// 墓地パネル（起動前）
	local model_koori = ReadGimmick_("o_A01_08");		// 氷パネル（起動前）
	local model_suna = ReadGimmick_("o_A01_09");		// 砂パネル（起動前）
	local model_kazan = ReadGimmick_("o_A01_10");		// 火山パネル（起動前）
	// エフェクト
	LoadEffect_("ef732_09_light_reactor_c");			// リアクター発光

// ▼配置
	// 主人公
	SetPointPos_(player, "player000");
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
	// エレベーター扉
	local door = ArrangePointGimmick_("o_A01_16", model_elevatordoor, "obj_elevatordoor000");
	local door = ArrangePointGimmick_("o_A01_16", model_elevatordoor, "obj_elevatordoor001");
	// 転送装置
	local diskdevice = ArrangePointGimmick_("o_o_com_18", model_diskdevice, "obj_diskdevice000");

// ▼非常駐モーション読込
	local pl_touch_reacter = ReadMotion_(player, "Player_touch_reactor");// 主人公　顔を少し左向ける→リアクターを触る
	local pl_touch_reacter_L = ReadMotion_(player, "Player_touch_reactor_L");// 主人公　顔を少し左向ける→リアクターを触るL

// ▼カメラ設定
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

// ▼モーション設定
	SetMotion_(player, MOT_WALK, BLEND_N);
	task_player = Task_MoveForward_(player, 0.8, false);


//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);

	// ▼カット１＠エレベーター前　リアクター反応～～～～～～～
	Wait_(2);
	PlaySE_("SE_FLD_135");								// リアクター反応音
	local light = SetSelectBoneEffect_("ef732_09_light_reactor_c", player, ATTACH_EFFECT1);// リアクター発光		
	Wait_(5);
	SetMotion_(player, MOT_WAIT, BLEND_L);
	DeleteTask_(task_player);
	Wait_(10);

	SetMotion_(player, pl_touch_reacter, BLEND_L);
	WaitMotion(player);
	SetMotion_(player, pl_touch_reacter_L, BLEND_M);
	Wait_(10);


	// ▼カット２＠ディスク装置へズームイン～～～～～～～～～～
	SetPointPos_(player, "player001");
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	Wait_(20);	
	SetMotion_(player, MOT_WAIT, BLEND_XL);
	WaitTask(task_cam);
	DeleteTask_(task_cam);
	Wait_(20);


	// ▼カット３＠ディスク装置　別アングルアップ～～～～～～～
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");

	LoadEffect_("ef732_12_monolith_on");				// モノリスの起動エフェクト
	SetPointWorldEffect_("ef732_12_monolith_on", "obj_diskdevice000");
	PlaySE_("SE_FLD_101");								// モノリス起動音
	SetMotion_(diskdevice, MOT_GIMMICK_1, BLEND_N);		// ディスク装置起動
	Wait_(30);
	SetMotion_(diskdevice, MOT_GIMMICK_2, BLEND_N);		// ディスク装置起動後待機
	Wait_(30);
	
	//===============================================
	// ■リアクター
	// 「冒険を　支援するために　作られた
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_REACTOR");
	ShowMsg_("DEMO_133_MSG_010");
	KeyInputWait_();
	
	//-----------------------------------------------
	// ▽
	// 「機能を　説明しますので
	//-----------------------------------------------
	ShowMsg_("DEMO_133_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	EndDemo(FADE_COLOR_BLACK);
}
