//=============================================
//
//		demo623[Ｓランクライセンス獲得_1]
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
	local task_cam, task_player, task_rena, task_retis;
	local efc_player, efc_rena, efc_cam, efc_retis;

// ▼リソース読込
	// キャラクター
	local player = GetPlayerId_();															// 主人公
	local model_rena = ReadNpc_("n007");													// レナーテ
	
	// エフェクト
	LoadEffect_("ef712_10_emo_surprise01");													// 「！」
	LoadEffect_("ef732_13_light_reactor01");												// レティスの光（リアクターの光）
	LoadEffect_("ef732_06_get_license");													// ライセンス獲得エフェクト
	
	// ギミック
	local model_base = ReadGimmick_("o_effect_base");										// エフェクトベース

// ▼配置
	// キャラクター
	SetPointPos_(player, "player000");														// 主人公
	local rena = ArrangePointNpc_(model_rena, "npc_renerte000");							// レナーテ
	
	// ギミック
	local retis = ArrangeGimmick_("o_effect_base", model_base, false);						// レティスの光（エフェクトベース）
	
// ▼非常駐モーション読込
	// 主人公
	local player_look_up_L = ReadMotion_(player, "Player_look_up_L");						// 上向き待機L
	local player_licence01_L = ReadMotion_(player, "Player_licence01_L");					// ライセンスゲット1
	local player_hand1_L = ReadMotion_(player, "Player_r_hand_hold01L");					// 右手を握る1　上
	local player_hand2_L = ReadMotion_(player, "Player_r_hand_hold02L");					// 右手を握る2　下
	local player_sup = ReadMotion_(player, "Player_surprise");								// 驚く
	local player_sup_L = ReadMotion_(player, "Player_surprise_L");							// 驚くL
	local player_nod = ReadMotion_(player, "Player_nod");									// うなづく
	
	// レナーテ
	local rena_look_up_L = ReadMotion_(rena, "n007_look_up_L");								// 上向き待機L	
	local rena_talk = ReadMotion_(rena, "n007_talk01");										// 会話開始（手を胸にあてる）
	local rena_talk_L = ReadMotion_(rena, "n007_talk01_L");									// 会話L（手を胸にあてる）
	local rena_show01 = ReadMotion_(rena, "n007_show01");									// 待機→手を胸の高さ位まで上げる
	local rena_show_L = ReadMotion_(rena, "n007_show_L");									// 手を胸の高さ位まで上げるL
	local rena_show02 = ReadMotion_(rena, "n007_show02");									// 手を胸の高さ位まで上げる→待機
	local rena_nod = ReadMotion_(rena, "n007_nod");											// うなづく
	local rena_show_send_L = ReadMotion_(rena, "n007_show_send_L");							// 手を胸の高さ位まで上げ前へ出すL

// ▼初期モーション
	SetMotion_(rena, MOT_WALK, BLEND_N);													// レナ歩く
	SetMotion_(player, MOT_WALK, BLEND_N);													// 主　歩く
	
	
//足音
	SetStepSe_(rena, "SE_FLD_016");

// ▼カメラ設定
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------
	task_player = Task_MoveForward_(player, 1.2, false);
	StartDemo(FADE_COLOR_BLACK);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット1 レナのお出迎え
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	Wait_(50);
	SetMotion_(player, MOT_WAIT, BLEND_L);									// 主　待機
	DeleteTask_(task_player);
	
	local pos = Vec3(0, 0, 0);
	efc_player = SurpriseDispSetOffset(player, pos, 1.0);					// [!]
	task_rena = Task_MoveForward_(rena, 0.8, false);

	Wait_(55);
	
	SetMotion_(rena, MOT_WAIT, BLEND_XL);									// レナ待機
	DeleteTask_(task_rena);
	Wait_(50);

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット2 レナ　主
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");
	Wait_(10);
	SetMotion_(rena, rena_talk, BLEND_L);									// レナ話す
	WaitMotion(rena);
	SetMotion_(rena, rena_talk_L, BLEND_M);
	//===============================================
	// *レナーテ
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_623_MSG_010");											// 「おめでとう……<name_player/>。
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(rena, MOT_WAIT, BLEND_XL);									// レナ待機
	WaitTask(task_cam);
	Wait_(20);	
	//===============================================
	// *テレジア
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TEREZIA");	
	ShowMsg_("DEMO_623_MSG_020");	// 「それでは　<name_player/>さまに
	
	SetMotion_(player, player_look_up_L, BLEND_XL);							// 主　上待機
	SetMotion_(rena, rena_look_up_L, BLEND_XL);								// レナ上待機
	
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	Wait_(30);
	SetMotion_(rena, MOT_WAIT, BLEND_XL);									// レナ待機
	SetMotion_(player, MOT_WAIT, BLEND_XL);									// 主　待機
	Wait_(40);
	SetMotion_(rena, rena_nod, BLEND_L);									// レナうなづく
	SetMotion_(player, player_nod, BLEND_L);								// 主　うなづく
	WaitMotion(rena);
	WaitMotion(player);
	SetMotion_(rena, MOT_WAIT, BLEND_XL);
	SetMotion_(player, MOT_WAIT, BLEND_XL);									// 主　待機
	Wait_(30);
	DeleteTask_(task_cam);

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット3 主　ライセンスゲット
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	SetPointPos_(player, "player001");										// 主人公移動
	SetPointPos_(rena, "npc_renerte001");									// レナ移動
	SetVisible(rena, false);
	
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	
	PlaySE_("SE_DEM_028");
	efc_player = SetSelectBoneEffect_("ef732_06_get_license", player, ATTACH_GLOBAL);		// ライセンス獲得エフェクト
	
	Wait_(90);
	SetMotion_(player, player_hand1_L, BLEND_XL);											// 主　右手を握る

	//===============================================
	// *システムメッセージ
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_623_MSG_030");															// <name_player/>はＳ級ライセンスを　手に入れた！
	PlayMe_("ME_010");
	WaitMe_();
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	WaitTask(task_cam);
	SetMotion_(player, MOT_WAIT, BLEND_XL);													// 主　待機
	
	//===============================================
	// *テレジア
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TEREZIA");	
	ShowMsg_("DEMO_623_MSG_040");															// 「Ｓ級ライセンスでは　星空を渡るチカラ
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	Wait_(30);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット4 主　レティスゲット
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetVisible(rena, true);
	SetMotion_(rena, MOT_WAIT, BLEND_N);													// レナ待機
	SetDir_(player, 165);
	
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	
	//===============================================
	// *レナーテ
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_623_MSG_050");	// 「そして　これも受け取ってほしい……。
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(rena, rena_show01, BLEND_M);													// レナ　手を胸の高さ位まで上げる
	WaitMotion(rena);
	SetMotion_(rena, rena_show_L, BLEND_M);
	
	SetPointPosNoFit_(retis, "obj_retis000");												// レティス出てくる
	efc_retis = SetSelectBoneEffect_("ef732_13_light_reactor01", retis, ATTACH_GLOBAL);
	SetEffectScale_(efc_retis, 0.2);
	PlaySE_("SE_DEM_160");
	Wait_(50);

	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");								// アニメに切り替え
	task_retis = Task_AnimeMoveNoFit_(retis, "anm_retis000");
	Wait_(11);
	SetMotion_(rena, rena_show_send_L, 31);
	WaitTask(task_cam);
	WaitTask(task_retis);
	Wait_(10);
	//===============================================
	//白フラッシュのようなフェードアウト
	SetFade_(FADE_OUT, FADE_COLOR_WHITE, 10);
	Wait_(20);
	SetFade_(FADE_IN, FADE_COLOR_WHITE, 30);
	//===============================================
	
	//===============================================
	// *システムメッセージ
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_623_MSG_060");															// 「レティス　手に入れた
	PlayMe_("ME_010");
	WaitMe_();
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	DeleteEffectEmitter_(efc_retis); 
	
	Wait_(50);
	
	EndDemo(FADE_COLOR_BLACK);
}
