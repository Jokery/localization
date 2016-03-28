//=============================================
//
//		demo503[長老との面会]
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
	local task_cam, task_player, task_elder;
	local efc_shuchusen;
	
// ▼リソース読込
	// キャラクター
	local player = GetPlayerId_();										// 主人公
	local model_elder = ReadNpc_("m076_02");							// 長老（げんじゅつし）
	local model_rock = ReadNpc_("m107_01");								// 側近（メガザルロック）
	
	// エフェクト
	LoadEffect_("ef733_01_sym_shuchusen01");									// 集中線
	
	local pos_eld = Vec3(0, 0, 0);											//elder「！」の位置
	local pos_pl = Vec3(0.8, 1.2, 0);										//player「！」の位置

// ▼配置
	// 主人公
	SetPointPos_(player, "player000");
	
	//NPC
	local elder = ArrangePointNpc_(model_elder, "npc_elder000");				// 長老 サイズ0.4
	SetScaleSilhouette(elder, SCALE.S, 0.3);

	local rock = ArrangePointNpc_(model_rock, "npc_rock000");					// 側近 サイズ0.6
	SetScaleSilhouette(rock, SCALE.N, SILHOUETTE_WIDTH.N);
	SetDirToObject_(rock, player);												// 側近 主人公の方を向く

// ▼非常駐モーション読込
	
	//主人公
	local pl_talk = ReadMotion_(player, "Player_talk");							//	話す
	local pl_talk_L = ReadMotion_(player, "Player_talk_L");						//	話すL

	//長老
	local elder_wait = ReadMotion_(elder, "m076_02_wait_L");					//	待機
	
// ▼初期モーション
	SetMotion_(elder, elder_wait, BLEND_N)										//長老待機
	
// ▼カメラ設定
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット1 お帰りアンセス
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	
	StartDemo(FADE_COLOR_WHITE);
	
	Wait_(20);
	//===============================================
	//*長老
	// 	「アンセスじゃと？
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ELDER");
	ShowMsg_("DEMO_503_MSG_010");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	//*長老
	// 	「今回は　やけに時間が　かかったようじゃて。
	//-----------------------------------------------
	ShowMsg_("DEMO_503_MSG_020");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	//*長老
	// 	「それとも　ルキヤと　会っていたのかの？
	//-----------------------------------------------
	ShowMsg_("DEMO_503_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	Wait_(10);
	
	SetMotion_(player, pl_talk, BLEND_L)								//主　話すL
	WaitMotion(player); 
	SetMotion_(player, pl_talk_L, BLEND_M)
	
	Wait_(50);
	
	DeleteTask_(task_cam);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット2 【悲報】ルキヤ死す
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	SetMotion_(player, MOT_WAIT, BLEND_N)
	SetVisible(player, false);
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	
	Wait_(20);
	PlaySE_("SE_DEM_026");	// ■SE:集中線
	efc_shuchusen = SetCameraEffect_("ef733_01_sym_shuchusen01", 100);

	WaitTask(task_cam);
	
	//===============================================
	//*長老
	// 	「なんと……ルキヤが　死んだじゃと？
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ELDER");
	ShowMsg_("DEMO_503_MSG_040");
	KeyInputWait_();
	//===============================================
	DeleteEffectEmitter_(efc_shuchusen);

	SetMotionSpeed_(elder, 0.4);													// モーションがゆっくりになる
	SetMotion_(elder, MOT_SPELL_CHARGE, BLEND_XL)									//長老ふるえ（魔法詠唱）
	
	//===============================================
	//*長老
	// 	「……惜しい者を　亡くしたわい。
	//-----------------------------------------------
	ShowMsg_("DEMO_503_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	Wait_(20);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット3 主人公アップ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetVisible(player, true);
	SetVisible(elder, false);
	SetMotionSpeed_(elder, 1.0);													// モーション速度戻す
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");
	
	//===============================================
	//*長老
	// 	「しかし　焦ってはならぬ。おぬしは特別。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ELDER");
	ShowMsg_("DEMO_503_MSG_060");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	//*長老
	// 	「不死身のおぬしなら　それができる。
	//-----------------------------------------------
	ShowMsg_("DEMO_503_MSG_070");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(40);
	DeleteTask_(task_cam);

//	WaitTask(task_cam);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット4 長老近づく
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetVisible(elder, true);
	SetMotion_(elder, elder_wait, BLEND_N)								//長老待機

	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	
	SetMotion_(player, pl_talk, BLEND_L)								//主　話すL
	WaitMotion(player); 
	SetMotion_(player, pl_talk_L, BLEND_M)
	
	Wait_(50);
	
	SetMotion_(elder, MOT_WALK, BLEND_M)								//長老　前へ出る
	task_elder = Task_MoveForward_(elder, 0.9, false);
	Wait_(20);
	SetMotion_(elder, elder_wait, BLEND_L)								//長老待機
	DeleteTask_(task_elder);
	
	//===============================================
	//*長老
	// 	「むむ？　自分はアンセスじゃないとな？
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ELDER");
	ShowMsg_("DEMO_503_MSG_080");
	KeyInputWait_();
	//===============================================

	//===============================================
	//*長老
	// 	「おぬしは　どこからどう見ても
	//-----------------------------------------------
	ShowMsg_("DEMO_503_MSG_090");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	SetMotion_(player, MOT_WAIT, BLEND_L)									//主　待機
	Wait_(30);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット5 長老アップ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetVisible(player, false);

	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
		
	//===============================================
	//*長老
	// 	「ふむ……どこかで　頭でも打ったかの？
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ELDER");
	ShowMsg_("DEMO_503_MSG_100");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	//*長老
	// 	「そんなに　自分に自信が持てないなら
	//-----------------------------------------------
	ShowMsg_("DEMO_503_MSG_110");
	KeyInputWait_();
	//===============================================

	//===============================================
	//*長老
	// 	「あやつの顔を見れば　ちょいとトボけた
	//-----------------------------------------------
	ShowMsg_("DEMO_503_MSG_120");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	Wait_(30);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット6 バーディさん家にズームイン
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");
	//===============================================
	//*長老
	// 	「さあ　行くがええ。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ELDER");
	ShowMsg_("DEMO_503_MSG_130");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	Wait_(80);

	EndDemo(FADE_COLOR_BLACK);
}
