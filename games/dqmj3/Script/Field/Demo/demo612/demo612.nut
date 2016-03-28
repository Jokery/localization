//=============================================
//
//		demo612[ガルビルス再戦]
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
	local task_cam, task_player, task_player_step;
	local efc_player, efc_mag_dark, efc_mist;

// ▼リソース読込
	// キャラクター
	local player = GetPlayerId_();												// 主人公
	local model_rena = ReadNpc_("n007");										// レナーテ
	local model_garu = ReadNpc_("m184_00");										// ガルビルス	
	local model_mother = ReadGimmick_("o_C03_02");								// マザー
	local model_decoration = ReadGimmick_("o_C03_03");							// マザー

// ▼配置
	// 主人公
	SetPointPos_(player, "player000");
	// レナーテ
	local rena = ArrangePointNpc_(model_rena, "npc_rena000");
	// ガルビルス
	local garu = ArrangePointNpc_(model_garu, "npc_garu000");
	SetScaleSilhouette(garu, SCALE.G, SILHOUETTE_WIDTH.G);
	// マザー
	local mother = ArrangePointGimmick_("o_C03_02", model_mother, "obj_mother000");
	local decoration = ArrangePointGimmick_("o_C03_03", model_decoration, "obj_mother000");

// ▼非常駐モーション読込
	local player_run_battle = ReadMotion_(player, "Player_run_battle");			// 主人公 走り→戦闘待機
	local rena_look_left_L = ReadMotion_(rena, "n007_look_left_L");				// レナーテ 左を向く
	local player_battle_L = ReadMotion_(player, "Player_battle_L");				// 主人公 戦闘待機
	local garu_shout = ReadMotion_(garu, "m184_00_shout");						// ガルビルス 待機→咆哮→待機
	SetDir_(player, 18);
	SetDir_(mother, 180);
	SetDir_(decoration, 180);

// ▼カメラ設定
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");


//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);

	SetMotion_(player, player_run_battle, BLEND_L);								// 走り→戦闘待機
	task_player_step = Task_ChangeStepSe(player, "SE_FLD_018", 8);
	task_player = Task_MoveForward_(player, 0.5, true);
	Wait_(23);
	DeleteTask_(task_player);
	DeleteTaskStepSe(player, task_player_step);
	SetMotion_(player, player_battle_L, BLEND_M);
	Wait_(40);


// 主人公とレナーテ撮影用
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");

	SetDir_(rena, 40);
	SetPointPos_(player, "player001");
	Wait_(10);
	SetMotion_(rena, rena_look_left_L, BLEND_L);								// レナーテ 左を向く
	Wait_(10);

	//===============================================
	// ■レナーテ
	// 「<name_player/>！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_612_MSG_010");
	KeyInputWait_();
	//===============================================
	// ■レナーテ
	// 「ガルビルスさえ倒せば
	//-----------------------------------------------
	ShowMsg_("DEMO_612_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================


	//ガルビルス 戦闘前
	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");	

	SetAlpha_(rena, 0);

	//===============================================
	// ■ガルビルス
	// 「マザーを　浄化なんてさせないよ。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_GARUBIRUSU");
	ShowMsg_("DEMO_612_MSG_030");
	KeyInputWait_();
	//===============================================
	// ■ガルビルス
	// 「ボクは　カルマッソが夢見た　すべてを超越する
	//-----------------------------------------------
	ShowMsg_("DEMO_612_MSG_040");
	KeyInputWait_();
	//===============================================
	// ■ガルビルス
	// 「その邪魔は　させないよっ！！
	//-----------------------------------------------
	ShowMsg_("DEMO_612_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

//ガルビルス咆哮
	local task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");

	SetMotion_(garu, garu_shout, BLEND_M);		// 待機→咆哮→待機
	PlaySE_("SE_DEM_155");
	Wait_(70);

	EncountEndDemo(ENCOUNT_BOSS);
}
