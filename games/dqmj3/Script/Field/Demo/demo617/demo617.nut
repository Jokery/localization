//=============================================
//
//		demo617[レナーテの告白_3(残骸)]
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
	local task_cam;

// ▼リソース読込
	// キャラクター
	local player = GetPlayerId_();							// 主人公
	local model_rena = ReadNpc_("n007");					// レナーテ
	// ギミック
	local model_monolith = ReadGimmick_("o_com_02");		// モノリス
	local model_reactor = ReadGimmick_("o_dem_07");			// リアクター(アタッチ用)
	// エフェクト
	LoadEffect_("ef732_13_light_reactor01");				// リアクターの光(まぶしい)

// ▼配置
	// 主人公
	SetPointPos_(player, "player000");
	// レナーテ
	local rena = ArrangePointNpc_(model_rena, "npc_rena000");
	// モノリス
	local monolith = ArrangePointGimmick_("o_com_02", model_monolith, "obj_monolith000");
	SetVisible(monolith, false);
	// リアクター(アタッチ用)
	local reactor = ArrangePointGimmick_("o_com_02", model_reactor, "efc_light000");
	SetAlpha_(reactor, ALPHA_CLEAR);

// ▼非常駐モーション読込
	// 主人公
	local player_look_left_L = ReadMotion_(player, "Player_look_left_L");	// 顔を少し左向けるL
	// レナーテ
	local rena_talk01 = ReadMotion_(rena, "n007_talk01");					// 会話
	local rena_talk01_L = ReadMotion_(rena, "n007_talk01_L");				// 会話L
	local rena_show01 = ReadMotion_(rena, "n007_show01");					// 待機→手を胸の高さ位まで上げる
	local rena_show_L = ReadMotion_(rena, "n007_show_L");					// 手を胸の高さ位まで上げるL
	local rena_look_right_L = ReadMotion_(rena, "n007_look_right_L");		// 右向き待機L
	local rena_show_send_L = ReadMotion_(rena, "n007_show_send_L");			// 手を胸の高さ位まで上げ前へ出すL
	SetMotion_(rena, rena_talk01, BLEND_N);									// レナーテ　会話

// ▼初期モーション設定
	SetMotion_(rena, MOT_WAIT, BLEND_N);					// レナーテ　待機


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット1　主人公とレナーテ　レナーテ会話　斜め上→レナーテズームイン
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

// ▼カメラ設定
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	StartDemoNoFade(FADE_COLOR_BLACK);

	Wait_(20);
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt00");// anmtgt[xxx]を二個作るとコンパイルが通らなくなる為、やむなくanmtgt00

	Wait_(66);
	SetMotion_(rena, rena_talk01, 24);						// レナーテ　会話
	Wait_(24);
	DeleteTask_(task_cam);
	WaitMotion(rena);

	//===============================================
	// ■レナーテ
	//「ガルビルスと決着をつけるには
	//　直接　星空を渡って　乗り込むしかない。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_617_MSG_010");
	SetMotion_(rena, rena_talk01_L, BLEND_N);				// レナーテ　会話L
	KeyInputWait_();
	//===============================================

	//===============================================
	//■レナーテ
	//「だから……！
	//-----------------------------------------------
	ShowMsg_("DEMO_617_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(rena, MOT_WAIT, 20);							// レナーテ　待機
	Wait_(20);
	SetMotion_(rena, rena_show01, 28);						// レナーテ　手を胸の高さ位まで上げる
	local task_rena = Task_RotateToDir_(rena, 35, 0.72);
	Wait_(28);
	SetMotion_(rena, rena_show_L, BLEND_L);					// レナーテ　手を胸の高さ位まで上げるL
	Wait_(15);

	local efc_rena = SetSelectBoneEffect_("ef732_13_light_reactor01", reactor, ATTACH_GLOBAL);
	SetEffectScale_(efc_rena, 0.095);
	PlaySE_("SE_DEM_214");									// ◆汎用・光演出6
	Wait_(20);
	Task_AnimeMoveNoFit_(reactor, "anm_light000");
	Wait_(7);
	SetMotion_(rena, rena_show_send_L, 18);
	Wait_(50);
	DeleteTask_(task_rena);

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット2　アンセスとレナーテとバーディと敵群　アンセス達高飛び→敵群追撃　横から
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");

	PlaySE_("SE_DEM_037");									// ◆汎用・光演出1
	SetEffectScale_(efc_rena, 0.3);
	SetMotion_(player, MOT_WAIT, BLEND_N);					// 主人公　待機
	SetMotion_(rena, MOT_WAIT, BLEND_N);					// レナーテ　待機
	SetPointPos_(player, "player001");
	SetPointPos_(rena, "npc_rena001");
	Task_AnimeMoveNoFit_(reactor, "anm_light001");
	Wait_(45);
	SetFade_(FADE_OUT, FADE_COLOR_WHITE, 30);
	Wait_(30);

	DeleteEffect_(efc_rena);
	SetVisible(monolith, true);
	Wait_(15);
	SetFade_(FADE_IN, FADE_COLOR_WHITE, 45);
	Wait_(55);

	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt01");// anmtgt[xxx]を二個作るとコンパイルが通らなくなる為、やむなくanmtgt01

	Wait_(20);
	SetMotion_(rena, rena_look_right_L, BLEND_XL);			// レナーテ　右向き待機L
	Wait_(25);
	DeleteTask_(task_cam);
	Wait_(5);

	//===============================================
	//■レナーテ
	//「行きましょう　<name_player/>。
	//　最後の　バーチャルコロシアムへ……。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_617_MSG_030");
	Wait_(7);
	SetMotion_(player, player_look_left_L, 12);				// 主人公　顔を少し左向けるL
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(4);
	SetMotion_(rena, MOT_WAIT, BLEND_XL);					// レナーテ　待機
	Wait_(21);

	//===============================================
	//■レナーテ
	//「星空を　自由に飛びまわれる
	//　新たなチカラを　手に入れるために……！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_617_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(4);
	SetMotion_(player, MOT_WAIT, BLEND_XL);					// 主人公　待機
	Wait_(75);

	EndDemo(FADE_COLOR_BLACK);
}
