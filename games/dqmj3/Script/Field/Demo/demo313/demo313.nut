//=============================================
//
//		demo313[希望とはなんぞや]
//
//=============================================

function Update()
{
	//=====================================
	//ローカル変数の設定
	//=====================================
	local task_cam, task_cam2, task_player, task_todo, task_okiduti;	//タスク関係の変数
	local task_todoSe;													//タスク関係(足音)の変数
	local efc_cam, efc_player, efc_todo, efc_okiduti;					//エフェクト関係の変数
	local player, nochoM00;												//キャラクターの変数
	local flg;															//デモ終了用変数
	
	//=====================================
	//エフェクト読み込み
	//=====================================
	LoadEffect_("ef733_01_sym_shuchusen01");									// 集中船
	LoadEffect_("ef712_13_emo_sweat01")		;							// 汗
	
	//=====================================
	//ギミック設置
	//=====================================
	
	//=====================================
	//リソース読み込み
	//=====================================
	
	//主人公（IDの取得）
	player = GetPlayerId_();
	
	//NPC
	local model_todo = ReadNpc_("n039");								//トードー親分
	local model_okiduti = ReadNpc_("m035_00")							// おおきづち（トードー子分）
	
	//=====================================
	//設置
	//=====================================
	
	//主人公
	SetPointPos_(player, "player000");
	
	//NPC
	local todo = ArrangePointNpc_(model_todo, "npc_todo000");
	local okiduti = ArrangePointNpc_(model_okiduti, "npc_okiduti000");
	SetDir_(okiduti, -200);
	
	//初期の向き
	task_player = Task_RotateToPos_(player, GetPos_(todo), 286.5);
	
	//サイズ設定
	SetScaleSilhouette(todo, SCALE.TODO, 0.5);
	SetScaleSilhouette(okiduti, SCALE.N, SILHOUETTE_WIDTH.N);
	
	//=====================================
	//非常注モーション読み込み
	//=====================================
	// 主人公
	local pl_talk_L = ReadMotion_(player, "Player_talk_L");						//	話すL
	local pl_lookup_L = ReadMotion_(player, "Player_look_up_L");				//	主人公 見上げる
	local pl_look_r_L = ReadMotion_(player, "Player_look_right_L");				//	主人公 右（トードー）を見る

	//	トードー
	local todo_arm_folde_L = ReadMotion_(todo, "m141_00_arm_folde01_L");		//	腕組み1L（目閉じ）
	local todo_talk_ang = ReadMotion_(todo, "m141_00_talk");					//	腕組み1→怒り会話
	local todo_talk_ang_L = ReadMotion_(todo, "m141_00_talk_L");				//	怒り会話L
	local todo_arm_above_L = ReadMotion_(todo, "m141_00_arm_above_L");			//	腕組み上を見るL
	local todo_arm_folde2_L = ReadMotion_(todo, "m141_00_arm_folde02_L");		//	腕組み2L（目開け）
	local todooyabun_run = ReadMotion_(todo, "n039_run");						//	走り（トードー親分用）

	//	おおきづち
	local oki_sup = ReadMotion_(okiduti, "m035_00_surprise");					//	待機→驚く→待機
	
	//=====================================
	//初期モーション
	//=====================================
	SetMotion_(player, pl_talk_L, BLEND_N);										//主人公　話す
	SetMotion_(todo, todo_arm_folde_L, BLEND_N);								//トド　腕組み待機
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット１　主人公説明
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓	
	
	//～～～～～～～～～カメラ～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	StartDemo(FADE_COLOR_BLACK);

	WaitTask(task_cam);
	SetMotion_(player, pl_lookup_L, BLEND_XL);									//主人公　見上げる
	Wait_(40);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット2　トードーアップ「希望だと！？
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	DeleteTask_(task_cam);
	//～～～～～～～～～カメラ～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");
	InitSilhouetteWidth_(todo, 0.9);
	
	SetMotion_(todo, todo_talk_ang, BLEND_M);									//トードー目を開き怒会話
	PlaySE_("SE_DEM_026");	// ■SE:集中線
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", 100);
	WaitMotion(todo);
	SetMotion_(todo, todo_talk_ang_L, BLEND_M);									//怒会話L
	Wait_(10);
	
	efc_todo = SetPointWorldEffect_("ef712_13_emo_sweat01", "efc_sweat000");	// つば（汗エフェクト）
	SetEffectScale_(efc_todo, 2.0);	
	//===============================================
	//■トードー
	//「なにっ！　希望を　手に入れるだと！？
	//　奴が　そう　言っていたんか！？
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TODO");
	ShowMsg_("DEMO_313_MSG_010");
	SetMotion_(player, MOT_WAIT, BLEND_M);										//主人公待機
	KeyInputWait_();
	//===============================================
	
	DeleteEffectEmitter_(efc_cam);
	DeleteEffectEmitter_(efc_todo);
	WaitTask(task_cam);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット3　見上げるトードー
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//～～～～～～～～～カメラ～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	Wait_(10);
	SetMotion_(todo, todo_arm_folde2_L, BLEND_XL);								//トド　腕組み
	Wait_(20);
	SetMotion_(todo, todo_arm_folde_L, BLEND_XL);								//トド　腕組み　目閉じ
	
	//===============================================
	//■トードー
	//「希望……そいつは　この地を去った　ルキヤが
	//　ワシらに　残してくれた　ある物のことじゃ。
	//-----------------------------------------------
	ShowMsg_("DEMO_313_MSG_020");
	KeyInputWait_();
	//===============================================
	
	Wait_(25);
	
	//===============================================
	//■トードー
	//「希望が　いずれ　世界を変える……。
	//　そんな風に　言うておった。
	//-----------------------------------------------
	SetMotion_(todo, todo_arm_above_L, BLEND_XL);								//トド　腕組み上を見るL	
	
	ShowMsg_("DEMO_313_MSG_030");	
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	WaitTask(task_cam);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット4　トードーアップ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//～～～～～～～～～カメラ～～～～～～～～～～～	
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");
	Wait_(10);
	
	//===============================================
	//■トードー
	//「だが　この話……ワシと
	//　シルバーしか　知らぬはずなんじゃ。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TODO");
	ShowMsg_("DEMO_313_MSG_040");	
	SetMotion_(todo, todo_talk_ang_L, BLEND_L);										//怒会話L
	KeyInputWait_();
	//===============================================
	SetMotion_(todo, todo_arm_folde2_L, BLEND_XL);								//トド　腕組み
	
	//===============================================
	//■トードー
	//「イエタスは　希望のことを　どこで知った？
	//　やはり　何かが　おかしいのう……。
	//-----------------------------------------------
	ShowMsg_("DEMO_313_MSG_050");
	Wait_(20);
	SetMotion_(todo, todo_arm_folde_L, BLEND_XL);								//トド　腕組み　目閉じ
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	Wait_(30);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット5　おおきづちカメライン
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	DeleteTask_(task_cam);

	//～～～～～～～～～カメラ～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");

	//おおきづち走る
	task_okiduti = Task_AnimeMove_(okiduti, "anm_okiduti000");
	SetMotion_(okiduti, MOT_RUN, BLEND_N);
	efc_okiduti = SetSelectBoneEffectSetOffset_("ef712_13_emo_sweat01", okiduti, ATTACH_EFFECT2, Vec3(0.0, 11.0, 0.0));		// 汗エフェクト
	SetEffectScale_(efc_okiduti, 4.0);
	SetPointPos_(player, "player002");
	PlaySE_("SE_FLD_031");	// 足音
	
	Wait_(55);
	SetMotion_(okiduti, oki_sup, BLEND_M);											//◆子分焦り
	InitSilhouetteWidth_(okiduti, 0.8);
	WaitTask(task_cam);
	
	StopBgm_(18);
	//===============================================
	//*トードーの子分
	//「大変だ！　イエタスファミリーの連中が
	//　親分を出せと　カチコミ　かけてきやがった！
	//-----------------------------------------------
	SetMotion_(okiduti, MOT_WAIT, BLEND_M);
	PlaySE_("SE_FLD_031");	// 足音
	OpenMsgWnd_();
	ShowMsg_("DEMO_313_MSG_060");	
	KeyInputWait_();	
	CloseMsgWnd_();
	//===============================================
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット6　トードー・ド・アップ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	DeleteTask_(task_cam);
	//～～～～～～～～～カメラ～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");
	Wait_(15);	
	
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", 100);
	
	PlayBgm_("BGM_021");
	SetMotion_(todo, todo_talk_ang, BLEND_M);										//トードー目を開き怒会話
	WaitMotion(todo);
	SetMotion_(todo, todo_talk_ang_L, BLEND_N);										//怒会話L
	Wait_(10);
	efc_todo = SetPointWorldEffect_("ef712_13_emo_sweat01", "efc_sweat000");		// つば（汗エフェクト）
	SetEffectScale_(efc_todo, 2.0);

	//===============================================
	//■トードー
	//「ええいっ！　しつこい奴らじゃ！
	//　いくぞ　いてもうたるわい！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TODO");
	ShowMsg_("DEMO_313_MSG_070");
	KeyInputWait_();
	CloseMsgWnd_();
	Wait_(10);
	DeleteTask_(task_cam);
	DeleteEffectEmitter_(efc_cam);
	DeleteEffect_(efc_todo);
	DeleteEffect_(efc_okiduti);
	task_todo = Task_AnimeMove_(todo, "anm_todo000");
	task_okiduti = Task_AnimeMove_(okiduti, "anm_okiduti001");
	SetMotion_(todo, todooyabun_run, BLEND_N);
	SetMotion_(okiduti, MOT_RUN, BLEND_N);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット7　部屋から出る親分と子分
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	InitSilhouetteWidth_(todo, 1.3);
	//～～～～～～～～～カメラ～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye005", "anmtgt005");
	SetPointPos_(okiduti, "npc_okiduti001");
	PlaySE_("SE_FLD_031");	// 足音

	Wait_(4);
	PlaySE_("SE_FLD_029");	// 足音
	task_todoSe = Task_PlaySe_("SE_FLD_029", 11);
	Wait_(36);
	SetMotion_(player,pl_look_r_L, BLEND_XL);										// 主人公右を向く

	Wait_(70);
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);
	Wait_(28);
	SetStepSe_(okiduti, SILENT_STEP_SE);
	DeleteTask_(task_todoSe);
	Wait_(2);

	EndDemo(FADE_COLOR_BLACK, 1);
}
