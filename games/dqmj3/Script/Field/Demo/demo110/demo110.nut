//=============================================
//
//		demo110[カードキーAを探せ_1]
//
//=============================================
function Update()
{
	//=====================================
	//ローカル変数の設定
	//=====================================
	local task_cam, task_player, task_ace;
	local task_ace_step;
	
	//=====================================
	//ギミック設置
	//=====================================
	local model_eledoor = ReadGimmick_("o_A03_01");																// エレベーター扉
	local model_door03 = ReadGimmick_("o_A03_00");																// 電子ドア
	local eledoor = ArrangePointGimmick_("o_A03_01", model_eledoor, "obj_elevator001");							// エレベーター扉
	local door03 = ArrangePointGimmick_("o_A03_00", model_door03, "obj_door000");								// 電子ドア
	
	//=====================================
	//プレイヤー設置
	//=====================================
	
	//IDの取得
	local player = GetPlayerId_();
	
	//設置
	SetPointPos_(player, "player000");
	
	//初期の向き
	SetDir_(player, 90);
	
	//モーションの読み込み
	local battlewait = ReadMotion_(player, "Player_battle_L");					//戦闘待機
	local look_walk = ReadMotion_(player, "Player_look_walk_L");				//キョロ歩き
	local pl_look_around_L = ReadMotion_(player, "Player_look_around_L");		// 主人公　キョロキョロL
	local pl_cage_turn_L = ReadMotion_(player, "Player_cage_turn_L");			// 主人公　振り向く
	local pl_look_left_L = ReadMotion_(player, "Player_look_left_L");			// 主人公　顔を少し左向けるL
	
	//初期のモーション
	SetMotion_(player, MOT_WAIT, 15);
	
	//α値の手動設定
	SetManualCalcAlpha_(player, true);
	
	//初期のα値
	SetAlpha_(player, 1.0);
	
	//=====================================
	//NPC設置
	//=====================================
	
	//リソースの読み込み
	local npc_kil = ReadNpc_("m120_00");										// メタルハンター
	local npc_ace = ReadNpc_("n002");											// エース
	
	//設置
	local res_kil = ArrangePointNpc_(npc_kil, "npc_hunter000");
	local res_ace = ArrangePointNpc_(npc_ace, "npc_ace000");
	
	//初期の向き
	SetDir_(res_kil, 270);
	SetDir_(res_ace, 90);
	
	//サイズ設定
	SetScaleSilhouette(res_kil, SCALE.N, SILHOUETTE_WIDTH.N);
	
	//α値の手動設定
	SetManualCalcAlpha_(res_ace, true);
	
	//初期のα値
	SetAlpha_(res_ace, 1.0);
	
	//=====================================
	//モーションの読み込み
	//=====================================
	
	local bibiriwalk_ace = ReadMotion_(res_ace, "n002_walk01_L");				//エース怯え歩き
	local bibirilook_ace = ReadMotion_(res_ace, "n002_look_araund_L");			//エース怯え見回し
	local shock_ace = ReadMotion_(res_ace, "n002_shock");						//エース驚く→怯える
	local shockL_ace = ReadMotion_(res_ace, "n002_shock_L");					//エース怯える
	local ac_talk_joy_L = ReadMotion_(res_ace, "n002_talk_joy_L");				// エース　会話（嬉しそう）L
	local ac_look_araund_L = ReadMotion_(res_ace, "n002_look_araund_L");		// エース　辺りを見回すL（おびえた感じ）
	local ac_look_araund2_L = ReadMotion_(res_ace, "n002_look_araund02_L");		// エース　辺りを見回すL（普通にキョロキョロ）
	local ac_surprise = ReadMotion_(res_ace, "n000_surprise");					// エース　通常待機→驚く
	local ac_surprise_L = ReadMotion_(res_ace, "n000_surprise_L");				// エース　驚くL
	local ac_look_player = ReadMotion_(res_ace, "n002_look_player");			// エース　待機→主人公を見る
	local ac_look_player_L = ReadMotion_(res_ace, "n002_look_player_L");		// エース　主人公を見るL
	local ac_run_L = ReadMotion_(res_ace, "n001_run_L");						// エース　走るL
	local ac_impatience_L = ReadMotion_(res_ace, "n002_impatience_L");			// エース　焦るL
	local folde_ace = ReadMotion_(res_ace, "n002_arm_folde");					// エース腕を組む
	local foldeL_ace = ReadMotion_(res_ace, "n002_arm_folde_L");				// エース腕を組むL
	local think_ace = ReadMotion_(res_ace, "n002_think");						// エース考える
	local thinkL_ace = ReadMotion_(res_ace, "n002_think_L");					// エース考えるL	
	
	local kil_search_L = ReadMotion_(res_kil, "m120_01_search_L");				// メタルハンター　キョロキョロ
	
	//=====================================
	//エフェクトの読み込み
	//=====================================
	LoadEffect_("ef712_10_emo_surprise01");										//[!]
	LoadEffect_("ef712_13_emo_sweat01");										// 汗エフェクト読み込み
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット1
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	local task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	
	//=====================================
	//フェードイン
	//=====================================
	StartDemo(FADE_COLOR_BLACK);
	
	//=====================================
	//会話開始
	//=====================================
	
	SetMotion_(eledoor, MOT_GIMMICK_1, 0);
	PlaySE_("SE_DEM_041");
	WaitMotion(eledoor);
	SetMotion_(eledoor, MOT_GIMMICK_2, 0);
	WaitMotion(eledoor);
	SetMotion_(player, MOT_WALK, BLEND_M);
	SetMotion_(res_ace, MOT_WALK, BLEND_M);
	
	//歩くスピード
	local task1 = Task_MoveForward_(res_ace, 1.05, false);
	Wait_(1);
	local task2 = Task_MoveForward_(player, 1.0, false);
	Wait_(110);
	
	//エースストップ
	DeleteTask_(task1);
	SetDir_(res_ace, 70);
	SetMotion_(res_ace, ac_look_araund2_L, BLEND_L);		//エース普通にキョロキョロ
	
	Wait_(15);
	
	//主人公ストップ
	DeleteTask_(task2);
	SetDir_(player, 90);
	SetMotion_(player, MOT_WAIT, BLEND_L);					//主人公　待機

	WaitFade_();

	//エース「さて、最上階に行くためには・・・
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_110_MSG_010");
		
	SetMotion_(player, pl_look_around_L, BLEND_L);			//主人公普通にキョロキョロ
	KeyInputWait_();
	CloseMsgWnd_();
	
	Wait_(20);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット2
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	DeleteTask_(task_cam);
	
	local task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	
	task_player = Task_RotateToPos_(player, GetPos_(door03), 229);
	task_ace = Task_RotateToPos_(res_ace, GetPos_(door03), 229);
	SetMotion_(player, MOT_WAIT, BLEND_M);
	SetMotion_(res_ace, ac_talk_joy_L, BLEND_M);
	
	OpenMsgWnd_();
	
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_110_MSG_020");
	KeyInputWait_();
	
	ShowMsg_("DEMO_110_MSG_030");
	KeyInputWait_();
	
	CloseMsgWnd_();
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■扉に駆け寄るエースのカット
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetMotion_(res_ace, ac_run_L, BLEND_M);
	task_ace = Task_AnimeMove_(res_ace, "anm_ace000");
	task_ace_step = Task_PlaySe_("SE_FLD_011", 7);
	WaitTask(task_ace);
	
	task_ace = Task_RotateToPos_(res_ace, GetPos_(door03), 172);
	SetMotion_(res_ace, ac_impatience_L, BLEND_M);
	DeleteTask_(task_ace_step);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット2
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	DeleteTask_(task_cam);
	
	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");
	
	SetMotion_(player, MOT_WALK, BLEND_M);
	task_player = Task_AnimeMove_(player, "anm_player000");
	WaitTask(task_player);
	SetMotion_(player, MOT_WAIT, BLEND_M);
	
	// 汗エフェクト
	local sweat = SetSelectBoneEffect_("ef712_13_emo_sweat01", res_ace, ATTACH_EFFECT1);
	
	//エース「ぬぐぐ！　開かないぜーっ！？
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_110_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	
	Wait_(20);
	DeleteEffect_(sweat);													//汗消去
	SetMotion_(res_ace, think_ace, BLEND_M);								//エース考える	
	WaitMotion(res_ace);
	SetMotion_(res_ace, thinkL_ace, BLEND_M);								//エース考える
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット3
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	DeleteTask_(task_cam);
	SetMotion_(door03, MOT_GIMMICK_2, 0);
	
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	
	SetDir_(res_ace, 165);
	SetDir_(player, 195);
	
	OpenMsgWnd_();
	//エース「こいつは……解除するために
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_110_MSG_050");
	KeyInputWait_();
	
	local task_npc00 = Task_AnimeMoveNoFitSetMotion_(res_kil, "anm_hunter000", MOT_WALK, kil_search_L);	//メタハン登場
	SetMotion_(res_kil, MOT_WALK, BLEND_M);
	
	//エース「どっかで　カードキーを……
	ShowMsg_("DEMO_110_MSG_060");
	
	SetMotion_(res_ace, ac_look_player_L, BLEND_XL);					//エース主人公を見る
	
	KeyInputWait_();
	CloseMsgWnd_();
	
	WaitTask(task_npc00);
	
	SurpriseDisp(res_ace);												//主人公＆エース「！」
	SurpriseDisp(player);
	SetDir_(player, 30);
	SetDir_(res_ace, 30);
	SetMotion_(player, pl_cage_turn_L, BLEND_M);
	
	// 汗エフェクト
	local sweat = SetSelectBoneEffect_("ef712_13_emo_sweat01", res_ace, ATTACH_EFFECT1);
	
	SetMotion_(res_ace, ac_surprise, BLEND_M);
	Wait_(10);
	SetMotion_(res_ace, ac_surprise_L, BLEND_M);
	Wait_(45);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット4		メタハンアップ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	local task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");

	//エース「うひいっ！？	
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_110_MSG_070");
	KeyInputWait_();

	//エース「あ……ああいう魔物が　いるから
	ShowMsg_("DEMO_110_MSG_080");
	KeyInputWait_();
	CloseMsgWnd_();

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット5
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	DeleteTask_(task_cam);
	
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	
	SetDir_(res_ace, 53);												//エース主人公へ方向転換
	
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	//エース「俺はおっかなびっくりついていくぜ！
	ShowMsg_("DEMO_110_MSG_090");
	
	SetMotion_(res_ace, ac_run_L, BLEND_M);								//走る
	local task_ace = Task_MoveForward_(res_ace, 1.0, true);				//エース主人公に近づく
	Wait_(3);
	DeleteTask_(task_ace);
	SetDir_(res_ace, 15);
	SetMotion_(res_ace, shockL_ace, 0);									//怯え―す

	KeyInputWait_();
	CloseMsgWnd_();
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■デモ終了
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	
	EndDemo(FADE_COLOR_BLACK);
}