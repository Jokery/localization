//=============================================
//
//		demo211[故人から受け継いだもの_1]
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
	local efc_player, efc_holography;
	local rena_on1 = [0.3, 0.6, 0.4, 0.3, 0.5, 0.3, 0.6, 0.4, 0.3, 0.5, 0.4, 0.3, 0.7];
	local rena_on2 = [1, 1, 15, 1, 1, 1, 1, 5, 1, 1, 1, 1, 1];

// ▼リソース読込
	// キャラクター
	local player = GetPlayerId_();					// 主人公
	local npc_rena = ReadNpc_("n034");				// レナーテ
	// ギミック
	local model_monitor = ReadGimmick_("o_G02_14");	// モニタ
	local model_meimetu = ReadGimmick_("o_G02_11");	// コンピューターの明滅

	// エフェクト
	LoadEffect_("ef732_14_holography01");			// ホログラム表現　常駐
	LoadEffect_("ef732_15_holography01");			// ホログラム表現　出現
	LoadEffect_("ef732_09_light_reactor_c");		// リアクター発光

// ▼配置
	// 主人公
	SetPointPos_(player, "player000");
	// レナーテ
	local res_rena = ArrangePointNpc_(npc_rena, "npc_renerte000");
	SetManualCalcAlpha_(res_rena, true);
	SetAlpha_(res_rena, ALPHA_CLEAR);
	// モニタ
	local monitor = ArrangePointGimmick_("o_G02_14", model_monitor, "obj_monitor000");	//モニタ
	SetMotion_(monitor, MOT_GIMMICK_0, BLEND_N);
	// 明滅
	local meimetu = ArrangePointGimmick_("o_G02_11", model_meimetu, "obj_meimetu000");
	
// ▼非常駐モーション読込
	local renerte_look_down = ReadMotion_(res_rena, "n007_look_down_L");		//　レナーテ　うつむき待機
	local renerte_look_up = ReadMotion_(res_rena, "n007_look_up_L");			//　レナーテ　上を向く
	local renerte_look_left_L = ReadMotion_(res_rena, "n007_look_left_L");		//　レナーテ　左を向く

// ▼初期モーション
	SetMotion_(res_rena, renerte_look_down, BLEND_N);		//レナーテうつむき待機

// ▼時間設定
	SetTime_(START_TIME_ZONE_NIGHT);

// ▼カメラ設定
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");	
	DeleteTask_(task_cam);

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット1 ～レナーテ～
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	
	StartDemo(FADE_COLOR_BLACK);
	Wait_(15);
	
	//===============================================
	// *システムメッセージ
	// セキュリティコードを　感知しました。
	// 認証システムを　起動いたします。
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_211_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	PlaySE_("SE_FLD_135");		// リアクター反応音
	efc_player = SetSelectBoneEffect_("ef732_09_light_reactor_c", player, ATTACH_EFFECT1);	// リアクター発光
	Wait_(30);
	
	//===============================================
	// *システムメッセージ
	// 正規のリアクターであることを　確認……。
	// 格納された　データを　展開します。
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_211_MSG_060");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	
	WaitTask(task_cam);
	PlaySE_("SE_DEM_047");													// レナーテ現れる
	efc_holography = SetBoneEffect_("ef732_15_holography01", res_rena);		// ホログラム表現　出現
	
	// レナーテ点滅
	for (local i = 0; i< rena_on1.len(); i ++){
		SetAlpha_(res_rena, rena_on1[i]);
		Wait_(rena_on2[i]);
	}
	
	// レナーテ現る
	SetAlpha_(res_rena, 1);
	DeleteEffect_(efc_holography);
	efc_holography = SetBoneEffect_("ef732_14_holography01", res_rena);
	
	task_player = Task_WalkAroundToPos(player, GetPos_(res_rena), ROTATE_DEMO_DEF);	// 主人公　右を向く
	WaitTask(task_player);
	SetMotion_(player, MOT_WAIT, BLEND_M);
	Wait_(30);
	
	//===============================================
	// ■なぞの少女
	// 「……このメッセージは　あなたが
	// 　ブンドルドを　倒したら　再生されるもの……
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MYSTERYGIRL");
	ShowMsg_("DEMO_211_MSG_010");
	KeyInputWait_();
	
	SetMotion_(res_rena, renerte_look_up, BLEND_XL);
	DeleteTask_(task_cam);
	
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");
	
	//-----------------------------------------------
	// ■なぞの少女
	// 「あなたの　チカラは　戻りつつあるようね。
	// 　私と仲間たちが　願った通りに……。
	//-----------------------------------------------
	ShowMsg_("DEMO_211_MSG_020");
	Wait_(16);
	KeyInputWait_();
	
	SetMotion_(res_rena, renerte_look_down, BLEND_XL);
	
	//-----------------------------------------------
	// ■なぞの少女
	// 「でも　今のあなたは　まだ足りない。
	// 　足りないものが　多すぎるくらい……。
	//-----------------------------------------------
	ShowMsg_("DEMO_211_MSG_030");
	Wait_(6);
	KeyInputWait_();
	
	Wait_(10);
	SetMotion_(res_rena, renerte_look_left_L, BLEND_XL);
	Wait_(20);
	
	//-----------------------------------------------
	// ■なぞの少女
	// 「だから……世界を　もっと　知って……。
	// 　私や　ルキヤが生きる……この世界のことを。
	//-----------------------------------------------
	ShowMsg_("DEMO_211_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(res_rena, MOT_WAIT, 20);
	Wait_(36);
	DeleteTask_(task_cam);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット2 ～モニタ起動～
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	
	DeleteTask_(task_cam);
	SetVisible(res_rena, false);
	DeleteEffect_(efc_holography);
	Wait_(10);
	
	task_player = Task_RotateToDir_(player, 180, 5);
	SetMotion_(player, MOT_WALK, 9);
	Wait_(30);
	
	SetMotion_(player, MOT_WAIT, 9);
	Wait_(30);
	
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	
	WaitTask(task_cam);
	PlaySE_("SE_DEM_049");															// モニターにノイズが走る
	SetMotion_(monitor, MOT_GIMMICK_1, BLEND_N);
	PlaySE_("SE_DEM_050");															// ノイズでおわる
	Wait_(60);
	
	EndDemo(FADE_COLOR_WHITE);
}
