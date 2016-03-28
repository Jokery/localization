//=============================================
//
//		demo007[モンスター選択用の質問]
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
	// ギミック
	local model_breakfast = ReadGimmick_("o_E00_01");	// 朝食
	// キャラクター
	local player = GetPlayerId_();					// 主人公
	local model_santyo = ReadNpc_("n011");			// サンチョ

// ▼配置
	// 朝食
	local breakfast = ArrangePointGimmick_("o_E00_01", model_breakfast, "obj_breakfast000");
	// 主人公
	SetPointPosNoFit_(player, "player000");
	// サンチョ
	local santyo = ArrangePointNpc_(model_santyo, "npc_santyo000");
	SetScaleSilhouette(santyo, SCALE.SANCHO, SILHOUETTE_WIDTH.SANCHO);
	SetActive_(santyo, false);

// ▼非常駐モーション読込
	// 主人公
	local player_sit_L = ReadMotion_(player, "Player_sit_L");			// 座るL
	local player_sit02 = ReadMotion_(player, "Player_sit02");			// 座る→座る（サンチョを見る）
	local player_sit02_L = ReadMotion_(player, "Player_sit02_L");		// 座る（サンチョを見る）L
	
	// サンチョ
	local santyo_bow = ReadMotion_(santyo, "n011_bow");					// おじぎ

// ▼モーション設定
	SetMotion_(breakfast, MOT_GIMMICK_1, BLEND_N);						// 食べた後(MOT_GIMMICK_1)
	SetMotion_(player, player_sit_L, BLEND_N);
	
// ▼カメラ設定
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	SetFadePlane_(FADE_PLANE.PLANE_3D);
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 1);

	Wait_(30);

	//===============================================
	// ◇システムメッセージ
	// ○主人公の名前○は　出された朝食を　食べた。　
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_007_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	Wait_(30);

	StartDemo(FADE_COLOR_BLACK);
	
	Wait_(60);
	
	SetPointPosNoFit_(player, "player001");
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット２
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	
	SetActive_(santyo, true);
	
	SetMotion_(santyo, MOT_TALK, BLEND_N);
	SetMotion_(player, player_sit02, BLEND_M);		// 座る→座る（サンチョを見る）
	Wait_(21);
	SetMotion_(player, player_sit02_L, BLEND_M);	// 座る（サンチョを見る）L
	Wait_(7);
	SetMotion_(santyo, MOT_TALKLOOP, BLEND_M);
	
	//===============================================
	// ■サンチョ
	// 「ほれぼれする　食べっぷりデシタ！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_SANCHO");
	ShowMsg_("DEMO_007_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	
	Wait_(10);
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット３
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");
	
	SetPointPos_(santyo, "npc_santyo001");
	
	//-----------------------------------------------
	// ▽
	// 「ところで　ご主人さま。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_SANCHO");
	ShowMsg_("DEMO_007_MSG_030");
	KeyInputWait_();
	
	//-----------------------------------------------
	// ▽
	// 「今日も　お天気が　よろしいようデス。
	//-----------------------------------------------
	ShowMsg_("DEMO_007_MSG_040");
	KeyInputWait_();
	
	while(true)
	{
		// 【はいの場合：１】
		if (GetQueryResult_() == QUERY2_0) {
			//-----------------------------------------------
			// ▽
			// 「では　お庭へどうぞ。
			//-----------------------------------------------
			ShowMsg_("DEMO_007_MSG_050");
			KeyInputWait_();
			
			SetNumFlg_("NUM_CHANGE_FIRST_MONSTER", PURIZUNYAN);			// プリズニャン
			
			break;
		}
		
		//-----------------------------------------------
		// ▽
		// 「でしたら　ご本を読まれマスカ？
		//-----------------------------------------------
		ShowMsg_("DEMO_007_MSG_060");
		KeyInputWait_();
		
		// 【はいの場合：２】
		if (GetQueryResult_() == QUERY2_0) {
			//-----------------------------------------------
			// ▽
			// 「かしこまりマシタ。
			//-----------------------------------------------
			ShowMsg_("DEMO_007_MSG_070");
			KeyInputWait_();
			
			//-----------------------------------------------
			// ▽
			// 「それまでは　ごゆるりと　おすごしくだサイ。
			//-----------------------------------------------
			ShowMsg_("DEMO_007_MSG_080");
			KeyInputWait_();
			
			SetNumFlg_("NUM_CHANGE_FIRST_MONSTER", FONDHU);			// フォンデュ
			
			break;
		}
		
		//-----------------------------------------------
		// ▽
		// 「ならば　お庭に　出られては？ 
		//-----------------------------------------------
		ShowMsg_("DEMO_007_MSG_090");
		KeyInputWait_();
		
		// 【はいの場合：３】
		if (GetQueryResult_() == QUERY2_0) {
			//-----------------------------------------------
			// ▽
			// 「わかりました　お庭へどうぞ。
			//-----------------------------------------------
			ShowMsg_("DEMO_007_MSG_100");
			KeyInputWait_();
			
			//-----------------------------------------------
			// ▽
			// 「こころゆくまで　ゆっくりと
			//-----------------------------------------------
			ShowMsg_("DEMO_007_MSG_110");
			KeyInputWait_();
			//-----------------------------------------------
			
			SetNumFlg_("NUM_CHANGE_FIRST_MONSTER", DORAKI);			// ドラキー
			
			break;
		}
		
		//-----------------------------------------------
		// ▽
		// 「それでは　ゆかいな　モンスターたちと
		//-----------------------------------------------
		ShowMsg_("DEMO_007_MSG_120");
		KeyInputWait_();
		
		// 【はいの場合：11】
		if (GetQueryResult_() == QUERY2_0) {
			//-----------------------------------------------
			// ▽
			// 「はい！　スライムも　モーモンも　家の外で
			//-----------------------------------------------
			ShowMsg_("DEMO_007_MSG_130");
			KeyInputWait_();
			//-----------------------------------------------
			
			SetNumFlg_("NUM_CHANGE_FIRST_MONSTER", NASUBINARA);		// ナスビナーラ
			
			break;
		}
		
		//-----------------------------------------------
		// ▽
		// 「そうですか……わかりマシタ。
		//-----------------------------------------------
		ShowMsg_("DEMO_007_MSG_140");
		KeyInputWait_();
		
		//-----------------------------------------------
		// ▽
		// 「それでは　やっぱり　お庭で
		//-----------------------------------------------
		ShowMsg_("DEMO_007_MSG_150");
		KeyInputWait_();
	}
	
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");		// 80F
	
	
	
//	SetMotion_(santyo, MOT_TALK, BLEND_M);
//	Wait_(28);
	SetMotion_(santyo, MOT_TALKLOOP, BLEND_M);

	//-----------------------------------------------
	// ▽
	// 「それでは　今日も　よい１日を。
	//-----------------------------------------------
	ShowMsg_("DEMO_007_MSG_160");
	KeyInputWait_();
	
	//-----------------------------------------------
	// ▽
	// 「ここは楽園……安全で　やさしい世界。
	//-----------------------------------------------
	ShowMsg_("DEMO_007_MSG_170");
	KeyInputWait_();
	
	//-----------------------------------------------
	// ▽
	// 「そして　どんなことでも　ご主人さまの自由。
	//-----------------------------------------------
	ShowMsg_("DEMO_007_MSG_180");
	KeyInputWait_();
	
	//-----------------------------------------------
	// ▽
	// 「何が　できるのか　確かめたいのでしたら
	//-----------------------------------------------
	ShowMsg_("DEMO_007_MSG_190");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(santyo, santyo_bow, BLEND_XL);
	WaitMotion(santyo);
	
	SetMotion_(santyo, MOT_WAIT, BLEND_XL);
	
	Wait_(15);

	WaitTask(task_cam);

	EndDemo(FADE_COLOR_BLACK);
}
