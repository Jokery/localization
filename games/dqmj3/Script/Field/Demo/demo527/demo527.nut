//=============================================
//
//		demo527[ジョーカー計画]
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
	local task_cam, task_player, task_rena, task_birdy;
	local efc_player, efc_rena, efc_birdy, efc_cam;

// ▼フラグ設定
	local bit_ruler = GetEventFlg_("BFG_RULER_ADD_023");	// Bit_223  ルーラ追加フラグ 焦熱の火山　秘密基地　地下施設
	
// ▼リソース読込
	// キャラクター
	local player = GetPlayerId_();						// 主人公
	local model_rena = ReadNpc_("n007");				// レナーテ
	local model_birdy = ReadNpc_("n019");				// バーディ
	local model_boy = ReadNpc_("n040"); 				// こども主人公
	
	// ギミック
	local model_cold = ReadGimmick_("o_V02_10");			// コールドスリープ装置
	local model_cpu = ReadGimmick_("o_V02_11");				// コンピュータの明滅
	local model_cold_player = ReadGimmick_("o_V02_12");		// コールドスリープ_主人公
	local model_light = ReadGimmick_("o_V02_13");			// コールドスリープ明滅
	local model_ruler = ReadGimmick_("o_com_08");			// ルーラポイント
	local model_door = ReadGimmick_("o_V02_09");			// 扉
	local model_door01 = ReadGimmick_("o_V02_02");			// エレベーター扉

	// エフェクト設定
	LoadEffect_("ef712_13_emo_sweat01")		;				// 汗

// ▼配置
	// 主人公
	SetPointPos_(player, "player000");										// 主人公
	
	local rena = ArrangePointNpc_(model_rena, "npc_renerte000");			// レナーテ
	
	local birdy = ArrangePointNpc_(model_birdy, "npc_birdy000");			// バーディ
	SetScaleSilhouette(birdy, SCALE.N, SILHOUETTE_WIDTH.N);					// サイズN
	
	local boy = ArrangePointNpc_(model_boy, "npc_boy000");					// こども主人公（コールドスリープの中に配置）
	
	//ギミック
	local cold_player = ArrangePointGimmick_("o_V02_10", model_cold_player, "obj_cold_player000");		//コールドスリープ主人公
	
	local cold_cpu = ArrangePointGimmick_("o_V02_11", model_cpu, "obj_cpu000");					//コンピュータの明滅
	local cold_light = ArrangePointGimmick_("o_V02_13", model_light, "obj_light000");			//コールドスリープ明滅

	// ルーラポイント
	local ruler = ArrangePointGimmick_("o_com_08", model_ruler, "obj_ruler000");
	// ▽ルーラポイントが既に起動していた場合
	if (bit_ruler) { SetMotion_(ruler, MOT_GIMMICK_2, BLEND_N); }
	
	// 扉
	local door = ArrangePointGimmick_("o_V02_09", model_door, "obj_door000");
	// エレベーター扉
	local door01 = ArrangePointGimmick_("o_V02_02", model_door01, "obj_door001");
	SetMotion_(door01, MOT_GIMMICK_0, BLEND_N);			// 閉じる
	
// ▼非常駐モーション読込
	//主人公
	local player_caution01 = ReadMotion_(player, "Player_caution01_L");				// 警戒
	local player_look_right = ReadMotion_(player, "Player_look_right_L");			// 右を向く
	
	//レナーテ
	local rena_right = ReadMotion_(rena, "n007_look_right_L");						// 右を向く
	local rena_left = ReadMotion_(rena, "n007_look_left_L");						// 左を向く
	local rena_look_up_L = ReadMotion_(rena, "n007_look_up_L");						// レナーテ上向き待機
	local rena_talk = ReadMotion_(rena, "n007_talk01");								// 会話開始（手を胸にあてる）
	local rena_talk_L = ReadMotion_(rena, "n007_talk01_L");							// 会話L（手を胸にあてる）
	local rena_turn_left = ReadMotion_(rena, "n007_turn_left");						// 待機→振り返る（左向き）
	local rena_turn_left_L = ReadMotion_(rena, "n007_turn_left_L");					// 振り返るL（左向き）
	local rena_run_L = ReadMotion_(rena, "n007_run_L");								// 走るL
	local rena_look_down = ReadMotion_(rena, "n007_look_down_L");					// うつむき待機
	local rena_look_up = ReadMotion_(rena, "n007_look_up_L");					// うつむき待機

	//バーディ
	local birdy_idol = ReadMotion_(birdy, "n019_idol");								// 待機L
	local birdy_talk = ReadMotion_(birdy, "n019_talk");								// 話す
	
	//こども主人公
	local boy_sleep = ReadMotion_(boy, "n010_cold_sleep_L");						// コールドスリープ用モーション
	SetMotion_(boy, boy_sleep, BLEND_N);
	SetFace_(boy, "Face_loop_close02");

// ▼初期モーション
	SetMotion_(birdy, birdy_idol, BLEND_N);											//鳥　待機
	SetMotion_(rena, rena_look_down, BLEND_N);										//レナ　うつむき待機
	SetFace_(rena, "Face_loop_close");												//目閉じ
	
//足音
	SetStepSe_(rena, "SE_FLD_016");
	
// ▼カメラ設定
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット1 主　レナ　鳥
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	
	//===============================================
	//*レナーテ
	// 	「でも……結局アンセスは　戻らなかった。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_527_MSG_010");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	//*レナーテ
	// 	「ブレイクモンスターを倒し　マ素に汚染された
	//-----------------------------------------------
	ShowMsg_("DEMO_527_MSG_020");
	KeyInputWait_();
	//===============================================
	
	SetMotion_(rena, rena_look_up, BLEND_XL);										//レナ　待機
	SetFace_(rena, "Face_default");												//目開け

	//===============================================
	//*レナーテ
	// 	「だから　私たちは　アンセスの遺志を継ぐため
	//-----------------------------------------------
	ShowMsg_("DEMO_527_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	WaitTask(task_cam); 
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット2 レナにズームイン
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetPointPos_(player, "player001");										// 主人公移動

	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	
	SetMotion_(rena, rena_turn_left, BLEND_L);									//レナーテ振り向く
	Wait_(10);	
	SetFace_(rena, "Face_left");
	WaitMotion(rena);
	SetMotion_(rena, rena_turn_left_L, BLEND_L);

	//===============================================
	//*レナーテ
	// 	「いわば　不死身のアンセスを　作り出す計画よ。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_527_MSG_040");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	//*レナーテ
	// 	「でも　このジョーカー計画には
	//-----------------------------------------------
	ShowMsg_("DEMO_527_MSG_050");
	KeyInputWait_();
	//===============================================


	//===============================================
	//*レナーテ
	// 	「アンセスのチカラを　使いこなせる者が
	//-----------------------------------------------
	ShowMsg_("DEMO_527_MSG_060");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	WaitTask(task_cam);
	Wait_(10);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット3 こども主人公
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetPointPos_(player, "player000");										// 主人公移動

	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");
	Wait_(30);
	//===============================================
	//*レナーテ
	// 	「その事実を知った　あなたは　自分から
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_527_MSG_070");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================	
	WaitTask(task_cam);
	Wait_(30);

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット4 主人公にズームイン
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetVisible(rena, false);												// レナ　非表示
	SetVisible(birdy, false);												// 鳥　非表示

	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");

	//===============================================
	//*レナーテ
	// 	「そう……かつてのあなたは　自分の意志で
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_527_MSG_080");
	KeyInputWait_();
	//===============================================
	

	//===============================================
	//*レナーテ
	// 	「でも今一度　あなた自身で選ぶべき……。
	//-----------------------------------------------
	ShowMsg_("DEMO_527_MSG_090");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================	
	WaitTask(task_cam);
	Wait_(20);	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット5 主　レナ　鳥
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetVisible(rena, true);													// レナ　表示
	SetVisible(birdy, true);												// 鳥　表示

	SetDirToObject_(rena, player);
	SetMotion_(rena, MOT_WAIT, BLEND_N);									//レナーテ待機
	
	SetMotionSpeed_(birdy, 2.0);											// モーション早める
	SetMotion_(birdy, birdy_talk, BLEND_N);									//バーディ話す
	
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

	efc_birdy = SetSelectBoneEffectSetOffset_("ef712_13_emo_sweat01", birdy, ATTACH_EFFECT1, Vec3(0.0, 2.0, 0.0));	//汗エフェクト
	SetEffectScale_(efc_birdy, 2.0);
	
	//===============================================
	//*バーディ
	// 	「ホワッツ！？　でもレナーテ！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BIRDY");
	ShowMsg_("DEMO_527_MSG_100");
	
	SetMotion_(rena, rena_left, BLEND_L);									//レナーテ　左を向く
	SetMotion_(player, player_look_right, BLEND_L);							//主人公　右を向く
	
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	
	//===============================================
	//*レナーテ
	// 	「ブレイクモンスターの源……マ素に汚染された
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_527_MSG_110");
	
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	Wait_(20);
	DeleteEffect_(efc_birdy); 
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット6 レナ　アップ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetPointPos_(player, "player001");										// 主人公移動
	SetDirToObject_(rena, player);
	SetVisible(player, false);												// 主　非表示
	
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	SetFace_(rena, "Face_eyes_close");	
	SetMotion_(rena, MOT_WAIT, BLEND_XL);									//レナーテ　待機
	Wait_(20);
	SetMotion_(rena, rena_talk, BLEND_L);									//レナーテ　話す
	WaitMotion(rena);
	SetMotion_(rena, rena_talk_L, BLEND_L);									//レナーテ　話す

	//===============================================
	//*レナーテ
	// 	「それを　決めるのは……彼よ。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_527_MSG_120");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	//*レナーテ
	// 	「「私は　奥の部屋にいる……。
	//-----------------------------------------------
	ShowMsg_("DEMO_527_MSG_130");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	SetMotion_(rena, MOT_WAIT, BLEND_XL);									//レナーテ　待機
	Wait_(20);
	
	task_rena = Task_WalkAroundToDir(rena, 200, 5.7);
	WaitTask(task_rena);
	task_rena = Task_MoveForward_(rena, 1.0, false);

	Wait_(60);
	
	EndDemo(FADE_COLOR_BLACK);
}
