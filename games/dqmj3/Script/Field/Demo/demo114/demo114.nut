//=============================================
//
//		demo114[レナーテと過去の録画映像]
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
	local task_player, task_res_rena, task_ace;
	local efc_player, efc_holography, efc_ace;
	local rete_on1 = [0.3, 0.6, 0.4, 0.3, 0.5, 0.3, 0.6, 0.4, 0.3, 0.5, 0.4, 0.3, 0.7];
	local rete_on2 = [1, 1, 15, 1, 1, 1, 1, 5, 1, 1, 1, 1, 1];

// ▼リソース読込
	// ギミック
	local model_main_screen = ReadGimmick_("o_A03_04");		// 管制室メインモニター
	local model_red_screen = ReadGimmick_("o_A03_06");		// 点滅する赤モニター(左)
	local model_screen_right = ReadGimmick_("o_A03_09");	// ディスプレイ画面(右)
	local model_screen_left = ReadGimmick_("o_A03_10");		// ディスプレイ画面(左)
	// キャラクター
	local player = GetPlayerId_();							// 主人公
	local model_ace = ReadNpc_("n002");						// エース
	local model_rena = ReadNpc_("n034");					// レナーテ
	// エフェクト
	LoadEffect_("ef712_10_emo_surprise01");					// 「！」
	LoadEffect_("ef732_09_light_reactor_c");				// リアクター発光
	LoadEffect_("ef732_14_holography01");					// ホログラム表現　常駐
	LoadEffect_("ef732_15_holography01");					// ホログラム表現　出現
	LoadEffect_("ef732_16_holography01");					// ホログラム表現　消失
	LoadEffect_("ef712_01_emo_notice01");					// 気づき

// ▼配置
	// 管制室メインモニター
	local main_screen = ArrangePointGimmick_("o_A03_04", model_main_screen, "obj_screen000");
	// 点滅する赤モニター(左)
	local red_screen = ArrangeGimmick_("o_A03_06", model_red_screen, false);
	SetMotion_(red_screen, MOT_GIMMICK_0, BLEND_N);			// 点滅ON
	// ディスプレイ画面(左)
	local screen_left = ArrangeGimmick_("o_A03_10", model_screen_left, false);
	
	// 主人公
	SetPointPos_(player, "player000");
	SetDir_(player, 5);
	// エース
	local ace = ArrangePointNpc_(model_ace, "npc_ace000");
	// レナーテ
	local res_rena = ArrangePointNpc_(model_rena, "npc_rena000");
	SetAlpha_(res_rena, ALPHA_CLEAR);

// ▼非常駐モーション読込
	// 主人公
	local pl_touch_reacter = ReadMotion_(player, "Player_touch_reactor");			// 主人公　顔を少し左向ける→リアクターを触る
	local pl_touch_reacter_L = ReadMotion_(player, "Player_touch_reactor_L");		// 主人公　顔を少し左向ける→リアクターを触るL
	local player_right = ReadMotion_(player, "Player_look_right_L");				// 主人公　右を向く
	local player_left = ReadMotion_(player, "Player_look_left_L");					// 主人公　左を向く
	local player_caution_turn = ReadMotion_(player, "Player_caution_turn");			// 主人公　警戒右振り向き
	local player_caution_turn_L = ReadMotion_(player, "Player_caution_turn_L");		// 主人公　警戒右振り向きL
	local player_back_L = ReadMotion_(player, "Player_back_L");						// 主人公　驚きL
	local pl_caution01_L = ReadMotion_(player, "Player_caution01_L");				// 警戒
	// エース
	local ace_shock = ReadMotion_(ace, "n002_shock");								// 驚く
	local ace_shock_L = ReadMotion_(ace, "n002_shock_L");							// 驚くL（怯える風）
	// レナーテ
	local rena_look_down = ReadMotion_(res_rena, "n007_look_down_L");				// レナーテ　うつむき待機
	local rena_look_up = ReadMotion_(res_rena, "n007_look_up_L");					// レナーテ　上向き待機
	local rena_look_up02 = ReadMotion_(res_rena, "n007_look_up02_L");				// レナーテ　上向き待機02L
	local rena_look_left_L = ReadMotion_(res_rena, "n007_look_left_L");				// レナーテ　左向き待機

// ▼モーション設定
	SetMotion_(res_rena, rena_look_down, BLEND_M);									// レナーテ　待機
	SetFace_(res_rena, "Face_loop_close");

// ▼カメラ設定
	local task_cam = Task_AnimeMoveCamera_("anmeye006", "anmtgt006");				// 60F
	DeleteTask_(task_cam);

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット1　コンソール前　主人公　リアクター反応
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	StartDemo(FADE_COLOR_BLACK);

	Wait_(20);
	PlaySE_("SE_FLD_135");																	// リアクター反応音
	local light = SetSelectBoneEffect_("ef732_09_light_reactor_c", player, ATTACH_EFFECT1);	// リアクター発光
	SetEffectScale_(light, 0.8);
	Wait_(10);
	SetFace_(player, "Face_left");	
	SetMotion_(player, pl_touch_reacter, BLEND_L);
	WaitMotion(player);
	SetMotion_(player, pl_touch_reacter_L, BLEND_M);
	Wait_(20);
	
	//===============================================
	// ◇システムメッセージ・センタリング
	// このメッセージが　再生されたということは
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_114_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット2　ズームアウト
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	local task_cam = Task_AnimeMoveCamera_("anmeye006", "anmtgt006");				// 60F

	WaitTask(task_cam);
	Wait_(30);
	
	PlaySE_("SE_DEM_047");															//レナーテ現れる

	
	efc_holography = SetBoneEffect_("ef732_15_holography01", res_rena);
	for (local i = 0; i< rete_on1.len(); i ++){									// レナーテ　点滅
		SetAlpha_(res_rena, rete_on1[i]);
		Wait_(rete_on2[i]);
	}
	SetAlpha_(res_rena, 1);															// レナーテ　α値
	DeleteEffect_(efc_holography);
	efc_holography = SetBoneEffect_("ef732_14_holography01", res_rena);
	
	Wait_(30);

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット3　主人公振り向き
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetPointPos_(ace, "npc_ace001");

	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	SetDir_(player, -25);
	SetFace_(player, "Face_right");	
	Wait_(10);
	
	
	local pos = Vec3(3.0, 3.2, 0.0);
	efc_player = SurpriseDispSetOffset(player, pos, 0.55);
	SetMotionSpeed_(player, 1.3);
	SetMotion_(player, player_caution_turn, 6);
	Wait_(5);
	
//	task_ace = Task_RotateToDirSetMotion_(ace, -165, 15, MOT_WALK, ace_shock);
	SetMotion_(ace, ace_shock, BLEND_M);											// 驚く（怯える風）
	efc_ace = SetSelectBoneEffect_("ef712_01_emo_notice01", ace, ATTACH_EFFECT1);	// 気づき
	task_ace = Task_RotateToDir_(ace, -165, 10);		// 回転
	Wait_(10);
	
	SetMotionSpeed_(player, 1.0);
	SetMotion_(ace, ace_shock_L, BLEND_M);		// 驚くL（怯える風）
//	WaitMotion(player);
	SetMotion_(player, player_caution_turn_L, BLEND_M);
	
//	WaitTask(task_ace);
	
	Wait_(57);
	SetPointPos_(ace, "npc_ace001");

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット4　レナーテ　足元→バストアップ→ズームイン
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	local task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	WaitTask(task_cam);
	Wait_(27);

	SetMotion_(res_rena, rena_look_up, BLEND_XL);									// レナーテ　上向き待機
	
	Wait_(10);
	SetFace_(res_rena, "Face_default");
	Wait_(10);

	//===============================================
	// ■なぞの少女
	// 「今のあなたは　モンスターマスターとして
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MYSTERYGIRL");
	ShowMsg_("DEMO_114_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(10);
	
	SetMotionSpeed_(res_rena, 0.7);
	SetMotion_(res_rena, MOT_WALK, 10);										// レナーテ　歩き
	SetStepSe_(res_rena, SILENT_STEP_SE);											// レナーテ　足音を無音にする

	Wait_(5);
	
	task_res_rena = Task_RotateToDir_(res_rena, -20, 2.85);
	WaitTask(task_res_rena);
	task_res_rena = Task_MoveForward_(res_rena, 0.5, false);
	Wait_(62);
	DeleteTask_(task_res_rena);
	SetDir_(res_rena, 0);

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット5　主人公とレナーテ　レナーテ歩き→待機＋主人公がレナーテの映像見る　レナーテ寄り→二人中央
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetDirToObject_(player, res_rena);
	SetFace_(player, "Face_default");	
	SetMotion_(player, pl_caution01_L, BLEND_N);									// 主　警戒

	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");

	task_res_rena = Task_AnimeMove_(res_rena, "anm_rena000");

	Wait_(75);

	WaitTask(task_res_rena);
	SetMotion_(res_rena, MOT_WAIT, BLEND_L);										// レナーテ　待機
	WaitTask(task_cam);

	//===============================================
	// ■なぞの少女
	// 「……まだまだ　わからないことだらけのはず。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MYSTERYGIRL");
	ShowMsg_("DEMO_114_MSG_030");
	KeyInputWait_();
	SetMotion_(player, MOT_WAIT, BLEND_XL);											// 主人公　待機
	CloseMsgWnd_();
	//===============================================
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット6　レナーテの映像　消える
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");
	
	SetDir_(res_rena, 20);
	SetMotionSpeed_(res_rena, 1.0);
	SetMotion_(res_rena, rena_look_down, BLEND_XL);									// レナーテ　うつむき待機
	SetFace_(res_rena, "Face_loop_close");
	WaitTask(task_cam);
	
	//===============================================
	// ■なぞの少女
	// 「あなたは　きっと　この世界で起きていることを
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MYSTERYGIRL");
	ShowMsg_("DEMO_114_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();	
	//===============================================

	Wait_(5);
	SetFace_(res_rena, "Face_default");
	SetMotion_(res_rena, rena_look_up02, BLEND_XL);									// レナーテ　上向き待機
	Wait_(15);

	//===============================================
	// ■なぞの少女
	// 「だから……ここに　記録を残したわ……。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MYSTERYGIRL");
	ShowMsg_("DEMO_114_MSG_050");
	KeyInputWait_();
	
	SetMotion_(res_rena, rena_look_left_L, BLEND_XL);		// 左向き待機
	
	//-----------------------------------------------
	// ▽
	// 「見て……聞いて……感じて……。
	//-----------------------------------------------
	ShowMsg_("DEMO_114_MSG_060");
	KeyInputWait_();
	CloseMsgWnd_();	
	//===============================================

	SetAlpha_(player, ALPHA_CLEAR);
	SetAlpha_(res_rena, ALPHA_CLEAR);
	SetAlpha_(ace, ALPHA_CLEAR);
	DeleteEffect_(efc_holography);

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット7　メインモニター　ノイズアニメ　モニターへズームイン
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye005", "anmtgt005");
	WaitTask(task_cam);
		
	PlaySE_("SE_DEM_050");															//ノイズでおわる

	SetMotion_(screen_left, MOT_GIMMICK_1, BLEND_N);								// ノイズ
	Wait_(30);

	EndDemo(FADE_COLOR_WHITE);
}
