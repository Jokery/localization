//=============================================
//
//		demo423[アンセスの最後_1]
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
	local efc_player;
	local rete_on1 = [0.3, 0.6, 0.4, 0.3, 0.5, 0.3, 0.6, 0.4, 0.3, 0.5, 0.4, 0.3, 0.7];
	local rete_on2 = [1, 1, 15, 1, 1, 1, 1, 5, 1, 1, 1, 1, 1];
	local rete_off1 = [0.35, 0.6, 0.5, 0.4, 0.6, 0.4, 0.5, 0.4, 0.6, 0.35, 0.4, 0.35, 0.0];
	local rete_off2 = [1, 1, 15, 1, 1, 5, 1, 1, 1, 1, 1, 1, 1];
	local flg00 = true;
	local efc_holography,efc_holography2;

	//=====================================
	//プレイヤー設置
	//=====================================
	//IDの取得
	local player = GetPlayerId_();
	//設置
	SetPointPos_(player, "player");
	SetMotion_(player, MOT_WAIT, BLEND_L);
	//α値の手動設定
	SetManualCalcAlpha_(player, true);
	//初期のα値
	SetAlpha_(player, 1.0);

	//=====================================
	//NPC設置
	//=====================================
	//リソースの読み込み
	local npc_rena		 = ReadNpc_("n034");													// レナーテ
	local npc_rukiya	 = ReadNpc_("n035");													// ルキヤ
	//設置
	local rena			 = ArrangePointNpc_(npc_rena,	 "rena");
	local rukiya		 = ArrangePointNpc_(npc_rukiya,	 "rukiya");

	//α値の手動設定
	SetManualCalcAlpha_(rena, true);
	SetManualCalcAlpha_(rukiya, true);

	//初期のα値
	SetAlpha_(rena, ALPHA_CLEAR);
	SetAlpha_(rukiya, ALPHA_CLEAR);

	SetMotion_(rena,	 MOT_WAIT, BLEND_M);									//レナーテ待機
	SetMotion_(rukiya,	 MOT_WAIT, BLEND_M);									//ルキヤ待機

	//レナーテ
	local r_sita = ReadMotion_(rena, "n007_look_down_L");				// レナーテ　うつむき待機

	SetMotion_(rena, r_sita, BLEND_L);

	local model_main_screen = ReadGimmick_("o_S02_23");

	local main_screen = ArrangePointGimmick_("o_S02_23", model_main_screen, "monita");
	SetVisible(main_screen, false);
	//=====================================
	//エフェクトの読み込み
	//=====================================
	
	LoadEffect_("ef732_14_holography01");											// ホログラム表現　常駐
	LoadEffect_("ef732_15_holography01");											// ホログラム表現　出現
	LoadEffect_("ef732_16_holography01");											// ホログラム表現　消失
	LoadEffect_("ef712_10_emo_surprise01");											//「！」エフェクト
	LoadEffect_("ef732_18_r_holography01");											// ルキヤ用常駐エフェクト

// ▼カメラ設定
	SetPointCameraEye_("001_cameye");
	SetPointCameraTarget_("001_camtgt");

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	
	Wait_(20);
	PlaySE_("SE_FLD_135");																			// リアクター反応音
	Wait_(10);

	//===============================================
	// ■ルキヤのリアクター
	// 「リアクターへの　アクセスを確認。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RUKIYA_REACTOR");
	ShowMsg_("DEMO_423_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	SetAlpha_(main_screen, 0);
	SetVisible(main_screen, true);
	Wait_(3);
	PlaySE_("SE_DEM_055");
	SetAlpha_(main_screen, 0.5);
	Wait_(3);
	SetAlpha_(main_screen, 1);
	Wait_(60);

	SetPointCameraEye_("002_cameye");
	SetPointCameraTarget_("002_camtgt");
	
	PlaySE_("SE_DEM_047");																			//レナーテ現れる

	efc_holography = SetBoneEffect_("ef732_15_holography01", rena);
	for (local i = 0; i< rete_off1.len(); i ++){													//レナーテ点滅
		SetAlpha_(rena, rete_on1[i]);
		Wait_(rete_on2[i]);
	}
	SetAlpha_(rena, 1);																			//レナーテα値
	DeleteEffect_(efc_holography);
	efc_holography = SetBoneEffect_("ef732_14_holography01", rena);

	Wait_(15);
	
	//===============================================
	// *レナーテ
	// 「黒鉄の大監獄は　マザーの下僕である。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MYSTERYGIRL");
	ShowMsg_("DEMO_423_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	SurpriseDisp(player);
	local task_kaiwa = Task_RotateToPos_(player, GetPos_(rena), 10.0);
	SetMotion_(player, MOT_WALK, BLEND_M);
	WaitTask(task_kaiwa);
	SetMotion_(player, MOT_WAIT, BLEND_M);
	Wait_(30);
	SetVisible(player,			 false);							//非表示にする
	SetPointCameraEye_("003_cameye");
	SetPointCameraTarget_("003_camtgt");
	
	SetMotion_(rena, MOT_TALK, BLEND_L);

	//===============================================
	// *レナーテ
	// 「たしかに　放置できる場所ではない……。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MYSTERYGIRL");
	ShowMsg_("DEMO_423_MSG_030");
	WaitMotion(rena);
	SetMotion_(rena, MOT_TALKLOOP, BLEND_L);
	KeyInputWait_();
	//===============================================
	
	//===============================================
	// *レナーテ
	// ▽「考え直して。○主人公の名前○と
	//-----------------------------------------------
	ShowMsg_("DEMO_423_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	local task = Task_RotateToDir_(player, 0, 410);	// 100度まで、1フレーム1度ずつ回転

	SetMotion_(rena, MOT_WAIT, BLEND_M);
	
	task_player	 = Task_AnimeMove_(rukiya, "rukiya_anm");
	task_cam	 = Task_AnimeMoveCamera_("004_cameye", "004_camtgt");
	SetVisible(player, true);
	efc_holography2 = SetBoneEffect_("ef732_15_holography01", rukiya);
	for (local i = 0; i< rete_off1.len(); i ++){													//ルキヤ点滅
		SetAlpha_(rukiya, rete_on1[i]);
		Wait_(rete_on2[i]);
	}
	SetAlpha_(rukiya, 1);																			//ルキヤα値
	DeleteEffect_(efc_holography2);
	efc_holography2 = SetBoneEffect_("ef732_18_r_holography01", rukiya);

	Wait_(15);
	
	
	WaitTask(task_player);
	SetMotion_(rukiya, MOT_TALK, BLEND_M);
	//===============================================
	// ■ルキヤ
	// 「あんたは　本当に心配性だね。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RUKIYA");
	ShowMsg_("DEMO_423_MSG_050");
	WaitMotion(rukiya);
	SetMotion_(rukiya, MOT_TALKLOOP, BLEND_M);
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	SetMotion_(rukiya, MOT_WAIT, BLEND_M);

	SetMotion_(rena, MOT_TALK, BLEND_M);
	//===============================================
	// *レナーテ
	// 「あなたの能力を　信頼はしている。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MYSTERYGIRL");
	ShowMsg_("DEMO_423_MSG_060");
	WaitMotion(rena);
	SetMotion_(rena, MOT_TALKLOOP, BLEND_M);
	KeyInputWait_();
	//===============================================
	
	//===============================================
	// *レナーテ
	// 「絶対に　○主人公の名前○は　助けられる。
	//-----------------------------------------------
	ShowMsg_("DEMO_423_MSG_070");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	// *レナーテ
	// 「だから……あせらないでルキヤ。
	//-----------------------------------------------
	ShowMsg_("DEMO_423_MSG_080");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(rena, r_sita, BLEND_XL);
	Wait_(60);
	
	PlaySE_("SE_DEM_048");															//レナーテ消える

	SetVisible(rena, false);
	SetVisible(rukiya, false);
	local efc_rena		 = SetBoneEffect_("ef732_16_holography01", rena);
	local efc_rukiya	 = SetBoneEffect_("ef732_16_holography01", rukiya);
	DeleteEffect_(efc_holography);
	DeleteEffect_(efc_holography2);

	WaitTask(task_cam);
	Wait_(60);
		
	SetVisible(player, false);
	task_cam	 = Task_AnimeMoveCamera_("005_anmeye", "005_anmtgt");
	WaitTask(task_cam);
	
	PlaySE_("SE_DEM_049");															//モニターにノイズが走る

	SetMotion_(main_screen, MOT_GIMMICK_1, BLEND_N);	
	Wait_(60);
	
	EndDemo(FADE_COLOR_WHITE);
}
