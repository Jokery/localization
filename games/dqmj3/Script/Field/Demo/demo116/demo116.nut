//=============================================
//
//		demo116[エースの頼み事]
//
//=============================================
function Update()
{
	//=====================================
	//ローカル変数の設定
	//=====================================
	local task_cam, task_player, task_ace;
	local efc_holography, efc_ace, efc_fall00, efc_fall01, efc_fall02;

	//=====================================
	//プレイヤー設置
	//=====================================
	//IDの取得
	local player = GetPlayerId_();
	//設置
	SetPointPos_(player, "player000");
	//初期のモーション
	SetMotion_(player, MOT_WAIT, BLEND_N);
	//α値の手動設定
	SetManualCalcAlpha_(player, true);
	//初期のα値
	SetAlpha_(player, 1.0);

	//=====================================
	//NPC設置
	//=====================================
	//リソースの読み込み
	local npc_ace = ReadNpc_("n002");										// エース
	//設置
	local res_ace = ArrangePointNpc_(npc_ace, "npc_ace000");
	//α値の手動設定
	SetManualCalcAlpha_(res_ace, true);
	//初期のα値
	SetAlpha_(res_ace, 1.0);

	//リソースの読み込み
	local npc_rena = ReadNpc_("n034");										// レナーテ
	//設置
	local res_rena = ArrangePointNpc_(npc_rena, "npc_rena000");
	//α値の手動設定
	SetManualCalcAlpha_(res_rena, true);
	//初期のα値
	SetAlpha_(res_rena, 1.0);

	//=====================================
	//ギミック設置
	//=====================================
	local model_red_screen = ReadGimmick_("o_A03_05");
	local red_screen = ArrangeGimmick_("o_A03_05", model_red_screen, false);
	SetMotion_(red_screen, MOT_GIMMICK_0, BLEND_N);							// 点滅ON
	local gimmickRes = ReadGimmick_("o_A03_04");
	local gimmick = ArrangePointGimmick_("o_A03_04", gimmickRes, "obj_screen000");

	//=====================================
	//エフェクトの読み込み
	//=====================================
	LoadEffect_("ef712_13_emo_sweat01");
	LoadEffect_("ef732_14_holography01");									// ホログラム表現　常駐
	LoadEffect_("ef732_16_holography01");									// ホログラム表現　消失
	efc_holography = SetBoneEffect_("ef732_14_holography01", res_rena);
	LoadEffect_("ef726_01_nat_parapara");									// 落下物

	//=====================================
	//モーションの読み込み
	//=====================================
	local player_surprise = ReadMotion_(player, "Player_surprise");			// 主人公　驚く
	local player_surprise_L = ReadMotion_(player, "Player_surprise_L");		// 主人公　驚くL
	local player_talk = ReadMotion_(player, "Player_talk");					// 主人公　話す
	local player_talk_L = ReadMotion_(player, "Player_talk_L");				// 主人公　話すL
	local player_caution01_L = ReadMotion_(player, "Player_caution01_L");	// 主人公　警戒L
	local res_rena_look_left_L = ReadMotion_(res_rena, "n007_look_left_L");	// レナーテ　左向き待機L
	local ace_look_araund2_L = ReadMotion_(res_ace, "n002_look_araund02_L");// エース　辺りを見回すL（普通にキョロキョロ）
	local ace_think = ReadMotion_(res_ace, "n002_think");					// エース　考える
	local ace_think_L = ReadMotion_(res_ace, "n002_think_L");				// エース　考えるL
	local ace_arm_folde = ReadMotion_(res_ace, "n002_arm_folde");			// エース　考える→見上げる
	local ace_arm_folde_L = ReadMotion_(res_ace, "n002_arm_folde_L");		// エース　見上げるL
	local ace_impatience_L = ReadMotion_(res_ace, "n002_impatience_L");		// エース　焦るL
	local ace_look_up_L = ReadMotion_(res_ace, "n002_look_up_L");			// エース　上向き待機L
	//初期のモーション
	SetMotion_(res_rena, res_rena_look_left_L, BLEND_N);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット１　レナーテと主人公　レナーテ左向き待機L→主人公驚く　レナーテ左側面→二人左側面
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

// ▼カメラ設定
	local task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);

	//===============================================
	//*レナーテ
	//「……<name_player/>。ルキヤを……
	//　レジスタンスの　ルキヤを　探して……。　▽
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_116_MSG_010");
	KeyInputWait_();
	//===============================================
	//*レナーテ
	//「ルキヤが……世界を　知るための
	//　あなたの旅の　道しるべとなる……。　▽
	//-----------------------------------------------
	ShowMsg_("DEMO_116_MSG_020");
	KeyInputWait_();
	//===============================================
	//*レナーテ
	//「手がかりは……歓楽の霊道に……。
	//-----------------------------------------------
	ShowMsg_("DEMO_116_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	WaitTask(task_cam);
	DeleteTask_(task_cam);
	PlaySE_("SE_DEM_048");													// レナーテ消える
	Wait_(10);
	SetVisible(res_rena, false);
	DeleteEffect_(efc_holography);
	efc_holography = SetBoneEffect_("ef732_16_holography01", res_rena);
	Wait_(5);
	SetMotion_(player, player_surprise, BLEND_M);							// 主人公　驚く
	WaitMotion(player);
	SetMotion_(player, player_surprise_L, BLEND_M);							// 主人公　驚くL
	Wait_(15);
	SetFade_(FADE_OUT, FADE_COLOR_WHITE, 25);
	Wait_(25);
	SetPointPos_(player, "player001");
	SetMotion_(player, MOT_WAIT, BLEND_N);									// 主人公　待機
	SetMotion_(res_ace, ace_impatience_L, BLEND_N);						// エース　辺りを見回すL（普通にキョロキョロ）
	Wait_(65);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット２　主人公とエース　エースきょろきょろ→会話　側面画面右寄り
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	local efc_ace = SetSelectBoneEffect_("ef712_13_emo_sweat01", res_ace, ATTACH_EFFECT2);// 汗エフェクト
	
	PlayBgm_("BGM_027");
	SetFade_(FADE_IN, FADE_COLOR_WHITE, 25);
	Wait_(25);

	//===============================================
	//■エース
	//「はっ！　い　今のは　なんだったんだぜ？
	//　<name_player/>　大丈夫か？　▽
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_116_MSG_040");
	KeyInputWait_();
	//===============================================
	
	DeleteEffectEmitter_(efc_ace);
	SetMotion_(res_ace, ace_think, BLEND_XL);								// エース　会話
	//■エース
	//「今のって　オメーに向けた　メッセージだよな？
	//　記録に　出てきたのは　オメーだったのか？
	//-----------------------------------------------
	ShowMsg_("DEMO_116_MSG_050");
	WaitMotion(res_ace);
	SetMotion_(res_ace, ace_think_L, BLEND_L);								// エース　会話L
	Wait_(20);
	SetMotion_(res_ace, ace_arm_folde_L, BLEND_L);								// エース　会話L	
	Wait_(10);
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	Wait_(10);

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット３　主人公　会話　右斜め前方画面左寄り
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");

	SetMotion_(player, player_talk, BLEND_N);								// 主人公　話す
	WaitMotion(player);
	SetMotion_(player, player_talk_L, BLEND_M);								// 主人公　話すL
	Wait_(45);
	SetMotion_(player, MOT_WAIT, 20);										// 主人公　待機
	Wait_(30);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット４　主人公とエース　エース考える→上向く→二人警戒焦る　二人側面→俯瞰
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetMotion_(res_ace, ace_arm_folde_L, BLEND_N);								// エース　考える
	
//	SetPointCameraEye_("cameye002");
//	SetPointCameraTarget_("camtgt002");

	local task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");

	//===============================================
	//■エース
	//「そうか　オメー　昔の記憶がないんだったな。
	//　でも　あれはオメーとしか　思えなかった。　▽
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_116_MSG_060");
	KeyInputWait_();
	//===============================================
	//■エース
	//「どうやら……オメーには　自分も知らない
	//　隠された秘密が　あるみたいだな。
	//-----------------------------------------------
	ShowMsg_("DEMO_116_MSG_070");
	SetMotion_(res_ace, MOT_TALK, BLEND_L);							// エース　会話開始
	WaitMotion(res_ace);
	SetMotion_(res_ace, MOT_TALKLOOP, BLEND_M);							// エース　会話
	Wait_(4);
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(res_ace, MOT_WAIT, BLEND_L);										// エース　待機
	WaitTask(task_cam);
	Wait_(30);
	DeleteTask_(task_cam);
	
	StartEarthQuake_(-1, 3, 0.8);
	PlayLoopSE_("SE_DEM_013");
	SetMotion_(player, player_caution01_L, BLEND_L);						// 主人公　警戒L
	SetMotion_(res_ace, ace_impatience_L, BLEND_L);							// エース　焦るL
	local efc_ace = SetSelectBoneEffect_("ef712_13_emo_sweat01", res_ace, ATTACH_EFFECT2);// 汗エフェクト
	efc_fall00 = SetPointWorldEffect_("ef726_01_nat_parapara", "efc_fall000");
	Wait_(5);
	SetEffectScale_(efc_fall00, 1.6);
	Wait_(5);
	efc_fall01 = SetPointWorldEffect_("ef726_01_nat_parapara", "efc_fall001");
	Wait_(5);
	efc_fall02 = SetPointWorldEffect_("ef726_01_nat_parapara", "efc_fall002");
	SetEffectScale_(efc_fall02, 0.8);
	Wait_(75);
	StopEarthQuake_();
	StartDecayEarthQuake_(20, 3, 0.8)
	StopLoopSE_(20);
	Wait_(5);
	DeleteEffectEmitter_(efc_fall02);
	Wait_(5);
	DeleteEffectEmitter_(efc_fall01);
	Wait_(5);
	DeleteEffectEmitter_(efc_fall00);
	Wait_(20);
	DeleteEffect_(efc_ace);
	SetMotion_(res_ace, MOT_WAIT, BLEND_L);									// エース　待機
	Wait_(30);

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット５　エース　会話　正面やや左斜め画面右寄り
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	SetPointCameraEye_("cameye003");
	SetPointCameraTarget_("camtgt003");

	SetVisible(player, false);
	SetMotion_(res_ace, MOT_TALK, BLEND_N);									// エース　会話

	//===============================================
	//■エース
	//「おおっと！　うっかり　忘れてた。
	//　地震の　原因になった機械を　調べねーと。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_116_MSG_080");
	Wait_(15);
	SetMotion_(res_ace, MOT_TALKLOOP, BLEND_L);								// エース　会話L
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(res_ace, MOT_WAIT, BLEND_L);										// エース　待機
	Wait_(30);

	EndDemo(FADE_COLOR_BLACK);
}
