//=============================================
//
//		demo609[カシャロット、アパデマク再戦]
//
//=============================================
function Task_Rot3(chr, rot, frm)
{

//半時計回り　加算
//時計回り　減算

	local dir = GetDir_(chr);
	
	local sita = dir+rot;
	
	local sita2 = sita-dir;

	if( sita2 <= 0 ){
		sita2 = sita2*-1;
	}
	
	local frm2 = sita2/frm;
	
//	SetMotion_(chr, MOT_WALK, BLEND_M);
	local task = Task_RotateToDir_(chr, sita, frm2);
	
	return task;
}
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
	local player = GetPlayerId_();					// 主人公
	local id_dark	 = ReadNpc_("n008");
	local id_kasya	 = ReadNpc_("m200_00");
	local id_apa	 = ReadNpc_("m201_00");
	
	// ギミック
	local model_core000 = ReadGimmick_("o_C03_02");	// マザー
	local model_core100 = ReadGimmick_("o_C03_03");	// マザー飾り

// ▼配置
	// 主人公
	SetPointPos_(player, "player");
	local dark	 = ArrangePointNpc_(id_dark, "dark");
	local apa	 = ArrangePointNpc_(id_apa, "apa");
	local kasya	 = ArrangePointNpc_(id_kasya, "kasya");
	SetScaleSilhouette(kasya, 0.8, 0.8);
	local task_kaiwa = Task_RotateToPos_(dark, GetPos_(player), 180);
	local task_kaiwa = Task_RotateToPos_(apa, GetPos_(player), 180);
	local task_kaiwa = Task_RotateToPos_(kasya, GetPos_(player), 180);
	Wait_(2);
	local task = Task_Rot3(apa, -15, 1);
	local task = Task_Rot3(kasya, 15, 1);
	
	// マザー
	local core000 = ArrangePointGimmick_("o_C03_02", model_core000, "obj_core000");
	local core100 = ArrangePointGimmick_("o_C03_03", model_core100, "obj_core000");
	
// ▼非常駐モーション読込
	local d_summon	 = ReadMotion_(dark, "n008_summon");
	local d_summonL	 = ReadMotion_(dark, "n008_summon_L");
	local a_battle	 = ReadMotion_(apa, "m201_00_battle");

// ▼カメラ設定
	SetPointCameraEye_("cameye");
	SetPointCameraTarget_("camtgt");

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	
	//===============================================
	// ■ダークマスター
	// 「……逃げのびて　なおマザーに　刃向かうか。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_DARKMASTER");
	ShowMsg_("DEMO_609_MSG_010");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	// ■ダークマスター
	// 「よかろう。ならば　何度でも　相手をしてやる。
	//-----------------------------------------------
	ShowMsg_("DEMO_609_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	SetMotion_(dark, d_summon, 4);
	SetMotion_(apa, a_battle, 4);
	Wait_(50);
	SetMotion_(kasya, MOT_SPELL_ACTUATE, 4);
	Wait_(20);
	PlaySE_("SE_DEM_145");
	
	Wait_(14);
	SetMotionSpeed_(kasya, 0.3);
	WaitMotion(dark);
	SetMotion_(dark, d_summonL, 4);
	Wait_(10);
	
	EncountEndDemo(ENCOUNT_BOSS);
}