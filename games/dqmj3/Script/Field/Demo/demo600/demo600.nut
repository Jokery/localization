//=============================================
//
//		demo600[コア・全景]
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
	local efc_player, efc_rena, efc_koutai;

// ▼リソース読込
	// キャラクター
	local player = GetPlayerId_();				// 主人公
	local n_rena = ReadNpc_("n007");			// レナーテ
	// エフェクト
	LoadEffect_("ef732_17_antibody_m");			// M抗体の光
	LoadEffect_("ef732_07_teleport_monolith");	// モノリス転送エフェクト
	LoadEffect_("ef732_13_light_reactor01");	// リアクターの光(まぶしい)
	
// ▼配置
	// 主人公
	SetPointPos_(player, "player000");
	SetManualCalcAlpha_(player, true);
	SetAlpha_(player, ALPHA_CLEAR);
	// レナーテ
	local rena = ArrangePointNpc_(n_rena, "rena000");
	SetManualCalcAlpha_(rena, true);
	SetAlpha_(rena, ALPHA_CLEAR);
	
// ▼非常駐モーション読込
	local r_n007_show01	= ReadMotion_(rena, "n007_show01");
	local r_n007_show_L	= ReadMotion_(rena, "n007_show_L");
	local r_n007_show02	= ReadMotion_(rena, "n007_show02");
	local r_n007_look_left_L	= ReadMotion_(rena, "n007_look_left_L");
	local r_n007_look_up_L	= ReadMotion_(rena, "n007_look_up_L");
	local p_Player_look_up_L	= ReadMotion_(player, "Player_look_up_L");
	local p_Player_look_right_L	= ReadMotion_(player, "Player_look_right_L");
	local r_n007_talk01 = ReadMotion_(rena, "n007_talk01");
	local r_n007_talk01_L = ReadMotion_(rena, "n007_talk01_L");
	
// ▼カメラ設定
	SetPointCameraEye_("cameye003");
	SetPointCameraTarget_("camtgt003");

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	Wait_(15);
	
	PlaySE_("SE_DEM_017");
	efc_player = SetSelectBoneEffect_("ef732_07_teleport_monolith", player, ATTACH_GLOBAL);
	
	Wait_(1);
	SetAlpha_(player, 0.1);
	Wait_(1);
	SetAlpha_(player, 0.2);
	Wait_(1);
	SetAlpha_(player, 0.3);
	Wait_(1);
	SetAlpha_(player, 0.4);
	Wait_(1);
	SetAlpha_(player, 0.5);
	Wait_(1);
	SetAlpha_(player, 0.6);
	Wait_(1);
	SetAlpha_(player, 0.7);
	Wait_(1);
	SetAlpha_(player, 0.8);
	Wait_(1);
	SetAlpha_(player, 0.9);
	Wait_(1);
	SetAlpha_(player, 1.0);
	
	Wait_(100);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット2
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");
	
	SetMotion_(player, p_Player_look_up_L, BLEND_N);
	
	WaitTask(task_cam);
	
	Wait_(15);

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット3
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	
	WaitTask(task_cam);
	
	Wait_(20);
	
	PlaySE_("SE_DEM_017");
	efc_rena = SetSelectBoneEffect_("ef732_07_teleport_monolith", rena, ATTACH_GLOBAL);
	
	Wait_(1);
	SetAlpha_(rena, 0.1);
	Wait_(1);
	SetAlpha_(rena, 0.2);
	Wait_(1);
	SetAlpha_(rena, 0.3);
	Wait_(1);
	SetAlpha_(rena, 0.4);
	Wait_(1);
	SetAlpha_(rena, 0.5);
	Wait_(1);
	SetAlpha_(rena, 0.6);
	Wait_(1);
	SetAlpha_(rena, 0.7);
	Wait_(1);
	SetAlpha_(rena, 0.8);
	Wait_(1);
	SetAlpha_(rena, 0.9);
	Wait_(1);
	SetAlpha_(rena, 1.0);
	
	Wait_(70);
	
	SetMotion_(rena, r_n007_look_up_L, BLEND_L);
	
	Wait_(5);
	
	//===============================================
	// *レナーテ
	// 「なんて　まがまがしい姿……マ素の汚染が
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_600_MSG_010");
	KeyInputWait_();
	SetMotion_(rena, r_n007_look_left_L, BLEND_L);
	Wait_(10);
	//-----------------------------------------------
	// *レナーテ
	// 「急ぎましょう……<name_player/>。
	//-----------------------------------------------
	ShowMsg_("DEMO_600_MSG_020");
	SetFace_(player, "Face_right");
	SetMotion_(player, p_Player_look_right_L, BLEND_L);
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetDirToObject_(player, rena);
	SetVisible(player, false);
	SetMotion_(rena, MOT_WAIT, BLEND_N);
	local task = Task_RotateToPos_(rena, GetPos_(player), 5.0);	
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット4
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");
	
	//===============================================
	// *レナーテ
	// 「忘れないで……目指すのは　コアの最深部。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_600_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(rena, r_n007_show01, BLEND_L);
	WaitMotion(rena);
	SetMotion_(rena, r_n007_show_L, BLEND_N);
	
	Wait_(30);
	
	PlaySE_("SE_DEM_142");
	efc_koutai = SetPointWorldEffect_("ef732_13_light_reactor01", "ef_Mkoutai");
	SetEffectScale_(efc_koutai, 0.2);
	
	Wait_(80);
	
	SetFade_(FADE_OUT, FADE_COLOR_WHITE, 30);
	WaitFade_();
	
	DeleteEffect_(efc_koutai);
	
	Wait_(50);
	
	local Mkoutai = SetPointWorldEffect_("ef732_17_antibody_m", "ef_Mkoutai");
	
	Wait_(20);
	
	SetFade_(FADE_IN, FADE_COLOR_WHITE, 30);
	WaitFade_();

	Wait_(30);
	
	//===============================================
	// *レナーテ
	// 「部屋に着いたら　このＭ抗体で
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_600_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();

	SetVisible(player, true);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット5
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	WaitTask(task_cam);
	SetFace_(player, "Face_default");
	
	//-----------------------------------------------
	// *レナーテ
	// 「でも……私１人じゃ　きっと
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_600_MSG_050");
	KeyInputWait_();
	
	DeleteEffectEmitter_(Mkoutai);
	efc_koutai = SetPointWorldEffect_("ef732_13_light_reactor01", "ef_Mkoutai");
	SetEffectScale_(efc_koutai, 0.12);
	
	Wait_(10);
	
	DeleteEffectEmitter_(Mkoutai);
	
	Wait_(20);
	
	DeleteEffectEmitter_(efc_koutai);
	
	Wait_(15);
	
	SetMotion_(rena, r_n007_show02, BLEND_M);
//	Wait_(10);
	Wait_(15);
	SetMotion_(rena, r_n007_talk01, BLEND_L);
	WaitMotion(rena);
	SetMotion_(rena, r_n007_talk01_L, BLEND_N);
	
	//-----------------------------------------------
	// *レナーテ
	// 「だから　あなたが必要なの　<name_player/>。
	//-----------------------------------------------
	ShowMsg_("DEMO_600_MSG_060");
	KeyInputWait_();
	
	//-----------------------------------------------
	// *レナーテ
	// 「敵には　まだダークマスターがいる……。
	//-----------------------------------------------
	ShowMsg_("DEMO_600_MSG_070");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(rena, MOT_WAIT, BLEND_XL);
	
	EndDemo(FADE_COLOR_BLACK);
}
