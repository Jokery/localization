//=============================================
//
//		demo109[センタービル地震発生]
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
	local task_cam, task_player, task_jack, task_ace;
	local efc_player, efc_jack, efc_king, efc_fall00, efc_fall01, efc_fall02;

// ▼リソース読込
	// ギミック
	local model_elevator = ReadGimmick_("o_A01_00");	// エレベーター扉
	local model_mixture = ReadGimmick_("o_A01_02");		// 配合装置
	// キャラクター
	local player = GetPlayerId_();				// 主人公
	local model_jack = ReadNpc_("n001");		// ジャック
	local model_ace = ReadNpc_("n002");			// エース
	local model_king = ReadNpc_("n003");		// キング
	local model_queen = ReadNpc_("n005");		// クイーン
	// エフェクト
	LoadEffect_("ef712_13_emo_sweat01");		// 汗
	LoadEffect_("ef726_01_nat_parapara");		// 落下物
	LoadEffect_("ef712_10_emo_surprise01");		// 「！」

// ▼配置
	// エレベーター扉（左）
	local elevator_left = ArrangePointGimmick_("o_A01_00", model_elevator, "obj_elevator000");
	// エレベーター扉（右）
	local elevator_right = ArrangePointGimmick_("o_A01_00", model_elevator, "obj_elevator100");
	// 配合装置
	local mixture = ArrangePointGimmick_("o_A01_02", model_mixture, "obj_mixture000");
	
	// 主人公
	SetPointPos_(player, "player000");
	// ジャック
	local jack = ArrangePointNpc_(model_jack, "npc_jack000");
	// エース
	local ace = ArrangePointNpc_(model_ace, "npc_ace000");
	SetStepSePan_(ace, false);
	// キング
	local king = ArrangePointNpc_(model_king, "npc_king000");

// ▼非常駐モーション読込
	// 主人公
	local player_quake_L = ReadMotion_(player, "Player_quake_L");				// 揺れ
	local player_caution01_L = ReadMotion_(player, "Player_caution01_L");		// 警戒L
	local player_look_left_L = ReadMotion_(player, "Player_look_left_L");		// 左を見る
	local player_look_down_L = ReadMotion_(player, "Player_look_down_L");		// 下を見る
	
	// ジャック
	local jack_run_L = ReadMotion_(jack, "n001_run_L");							// 走るL
	local jack_impatience_L = ReadMotion_(jack, "n001_impatience_L");			// 焦るL
	
	// エース
	local ace_run_L = ReadMotion_(ace, "n001_run_L");							// 走る
	local ace_think = ReadMotion_(ace, "n002_think");							// 考える
	local ace_think_L = ReadMotion_(ace, "n002_think_L");						// 考えるL
	local ace_arm_folde = ReadMotion_(ace, "n002_arm_folde");					// 考える→腕組み
	local ace_arm_folde_L = ReadMotion_(ace, "n002_arm_folde_L");				// 腕組みL	
	local ace_feel_down = ReadMotion_(ace, "n000_feel_down");					// 落ち込む
	local ace_feel_down_L = ReadMotion_(ace, "n000_feel_down_L");				// 落ち込むL
	
	// キング
	local king_quake_L = ReadMotion_(king, "n003_quake_L");						// 揺れ
	local king_look_jack = ReadMotion_(king, "n003_look_jack");					// ジャック見つめる
	local king_look_jack_L = ReadMotion_(king, "n003_look_jack_L");				// ジャック見つめるL
	local king_stick_up = ReadMotion_(king, "n003_stick_up");					// 待機→杖掲げ
	local king_stick_up_L = ReadMotion_(king, "n003_stick_up_L");				// 杖掲げ
	local king_talk_L = ReadMotion_(king, "n003_talk_L");						// 会話(エースに向く)
	local king_shock_L = ReadMotion_(king, "n003_shock_L");						// 驚く（怯え）L
	local king_surprise_L = ReadMotion_(king, "n003_surprise_L");				// 驚きL
	local king_think = ReadMotion_(king, "n003_think");							// 通常待機→考える
	local king_think_L = ReadMotion_(king, "n003_think_L");						// 考えるL
	local king_nod = ReadMotion_(king, "n003_nod");								// うなづく

// ▼カメラ設定
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

	SetMotion_(mixture, MOT_GIMMICK_0, BLEND_N);
	SetMotion_(jack, jack_run_L, BLEND_M);							//ジャック走る	
	
	efc_jack = SetSelectBoneEffect_("ef712_13_emo_sweat01", jack, ATTACH_EFFECT2);// 汗エフェクト

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	SetMotion_(king, king_think, BLEND_M);
	WaitMotion(king);
	SetMotion_(king, king_think_L, BLEND_M);
	
	//===============================================
	// ■キング
	// 「魔物と魔物を　配合する……？
	//-----------------------------------------------
	OpenMsgWnd_();	
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_109_MSG_010");
	KeyInputWait_();
	
	SetMotion_(king, king_talk_L, BLEND_XL);		// 会話LOOP
	
	//-----------------------------------------------
	// ▽
	// 「そちの　助けとなるのなら
	//-----------------------------------------------
	ShowMsg_("DEMO_109_MSG_020");
	KeyInputWait_();
	
	SetMotion_(king, king_stick_up, BLEND_M);
	WaitMotion(king);
	SetMotion_(king, king_stick_up_L, BLEND_M);
	
	//-----------------------------------------------
	// ▽
	// 「さっそく　試運転を……おおっ！？
	//-----------------------------------------------
	ShowMsg_("DEMO_109_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	StartEarthQuake_(-1, 3, 1);
	PlayLoopSE_("SE_DEM_013");
	StopBgm_(15);
	efc_player = SurpriseDisp(player);
	SetEffectScale_(efc_player, 1.5);
	
	SetMotion_(king, king_quake_L, BLEND_M);
	SetMotion_(player, player_quake_L, BLEND_M);
	
	// エフェクト設置タイミングをずらす
	efc_fall00 = SetPointWorldEffect_("ef726_01_nat_parapara", "efc_fall000");
	Wait_(5);
	efc_fall01 = SetPointWorldEffect_("ef726_01_nat_parapara", "efc_fall001");
	Wait_(5);
	efc_fall02 = SetPointWorldEffect_("ef726_01_nat_parapara", "efc_fall002");
	Wait_(50);
	
	//===============================================
	// ■キング
	// 「ぬおおっ！　何ごとであるかーっ！？
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_109_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	StopEarthQuake_();
	StartDecayEarthQuake_(20, 3, 1)
	StopLoopSE_(20);
	
	// エフェクト削除タイミングをずらす
	DeleteEffectEmitter_(efc_fall02);
	Wait_(5);
	DeleteEffectEmitter_(efc_fall01);
	Wait_(5);
	DeleteEffectEmitter_(efc_fall00);
	
	SetMotion_(king, king_surprise_L, BLEND_L);
	SetMotion_(player, player_caution01_L, BLEND_M);
	Wait_(10);
	
	task_jack = Task_MoveForward_(jack, 1.0, true);		//Wait合計37
	Wait_(20);
	PlaySE_("SE_FLD_011");								//■SE:ジャック足音
	Wait_(7);
	PlaySE_("SE_FLD_011");								//■SE:ジャック足音
	Wait_(7);
	PlaySE_("SE_FLD_011");								//■SE:ジャック足音
	Wait_(3);
	DeleteTask_(task_jack);
	
	SetMotion_(player, MOT_WAIT, BLEND_M);
	SetMotion_(jack, jack_impatience_L, BLEND_M);		// 焦るLOOP
	SetMotion_(king, king_look_jack, BLEND_L);			// ジャックを見る
	Wait_(30);											// WaitMotionを使用すると待機時間が長すぎるため、待ち時間指定する
	SetMotion_(king, king_look_jack_L, BLEND_M);
	
	SetAlpha_(player, ALPHA_CLEAR);
	
	// ▼カット２＠ジャックのアップ～～～～～～～～～～～～～～
	SetPointCameraEye_("cameye003");
	SetPointCameraTarget_("camtgt003");
	
	SetPointPos_(jack, "npc_jack001");
	SetMotion_(jack, jack_impatience_L, BLEND_M);
	
	//===============================================
	// ■ジャック
	// 「キングーッ！　大変です！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_JACK");
	ShowMsg_("DEMO_109_MSG_050");
	KeyInputWait_();
	
	//-----------------------------------------------
	// ▽
	// 「一族の者たちも　おびえております。
	//-----------------------------------------------
	ShowMsg_("DEMO_109_MSG_060");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	// ▼カット３＠キングのアップ～～～～～～～～～～～～～～～
	SetPointCameraEye_("cameye004");
	SetPointCameraTarget_("camtgt004");
	
	//===============================================
	// ■キング
	// 「うむ……原因が　わからなくては
	//-----------------------------------------------
	OpenMsgWnd_();	
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_109_MSG_070");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	task_ace = Task_AnimeMove_(ace, "anm_ace000");
	SetMotion_(ace, MOT_WALK, BLEND_N);
	
	// ▼カット４＠エースのアップ～～～～～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");
	
	//===============================================
	// ■エース
	// 「いや！　原因なら　わかっているぜ。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_109_MSG_080");
	
	WaitTask(task_ace);
	DeleteTask_(task_ace);
	
	SetMotion_(ace, ace_think, BLEND_M);		// 考える
	WaitMotion(ace);
	SetMotion_(ace, ace_think_L, BLEND_M);		// 考えるLOOP
	
	KeyInputWait_();
	
	//-----------------------------------------------
	// ▽
	// 「最上階にある　機械が振動してるんだ。
	//-----------------------------------------------
	ShowMsg_("DEMO_109_MSG_090");
	SetMotion_(ace, ace_arm_folde, BLEND_M);	// 腕組み
	WaitMotion(ace);
	SetMotion_(ace, ace_arm_folde_L, BLEND_M);	// 腕組みLOOP
	
	KeyInputWait_();
	
	//-----------------------------------------------
	// ▽
	// 「揺れは　このあとも続きそうだ。
	//-----------------------------------------------
	ShowMsg_("DEMO_109_MSG_100");
	SetMotion_(ace, ace_feel_down, BLEND_XL);	// 落ち込み
	WaitMotion(ace);
	SetMotion_(ace, ace_feel_down_L, BLEND_M);	// 落ち込みLOOP
	
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	DeleteTask_(task_cam);
	
	// ▼カット５＠キングのアップ～～～～～～～～～～～～～～～
	SetPointCameraEye_("cameye004");
	SetPointCameraTarget_("camtgt004");
	
	SetMotion_(king, king_talk_L, BLEND_XL);
	
	//===============================================
	// ■キング
	// 「エース！　なんとか　できるであるか？
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_109_MSG_110");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	// ▼カット６＠エレベーターをうつす～～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	
	//===============================================
	// ■エース
	// 「エレベーターを復旧させれば　調査はできる。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_109_MSG_120");
	KeyInputWait_();
	
	//-----------------------------------------------
	// ▽
	// 「<name_player/>が　護衛してくれるなら
	//-----------------------------------------------
	ShowMsg_("DEMO_109_MSG_130");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	DeleteTask_(task_cam);
	SetMotion_(player, MOT_WAIT, BLEND_N);
	
	// ▼カット７＠キングのアップ～～～～～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");	
	
	//===============================================
	// ■キング
	// 「うむ！　万事まかせるのである。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_109_MSG_140");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	Wait_(30);
	
	SetPointPos_(ace, "npc_ace001");						// エース移動
	SetDirToObject_(ace, player);
	
	SetAlpha_(player, ALPHA_EXIST);							// 主人公配置
	SetDir_(player, 210);	
	SetMotion_(player, player_look_left_L, BLEND_XL);		// 左を見る
	
	// ▼カット８＠エースと主人公～～～～～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	
	MotionTalk(ace);
	
	//===============================================
	// ■エース
	// 「左のエレベーターを　使えるようにするから
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_109_MSG_150");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(ace, MOT_WAIT, BLEND_M);
	
	EndDemo(FADE_COLOR_BLACK);
}
