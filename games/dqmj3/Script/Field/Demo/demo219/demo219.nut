//=============================================
//
//		demo219[モンスターの幽霊Ａに反応するリアクター]
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
	local task_cam, task_player, task_poison00, task_poison01, task_poisonFadeOut;
	local efc_player, efc_reactor_light, efc_target_icon;
	local poison_on1 = [0, 0.2, 0.4, 0.6, 0.9];
	local poison_on2 = [90, 4, 3, 2, 1];

// ▼リソース読込
	// キャラクター
	local player = GetPlayerId_();					// 主人公
	local model_poison = ReadNpc_("m100_01");		// ポイズントリル
	LoadEffect_("ef732_09_light_reactor_c");		//リアクターの光
	LoadEffect_("ef712_10_emo_surprise01");			//びっくりマーク
	
// ▼配置
	// 主人公
	SetPointPos_(player, "player000");
	// ポイズントリル
	local poison = ArrangePointNpc_(model_poison, "npc_poison000");
	SetScaleSilhouette(poison, SCALE.S, SILHOUETTE_WIDTH.S);
	SetAlpha_(poison, ALPHA_HALF);

// ▼非常駐モーション読込
	local player_look_left_L = ReadMotion_(player, "Player_look_left_L");		//主人公左を向く
	local player_look_right_L = ReadMotion_(player, "Player_look_right_L");		// 主人公 右を向く
	
	local poison__hand_L = ReadMotion_(poison, "m100_01_shake_hand_L");			// ポイズントリル 手を振る
	
// ▼初期モーション設定
	SetMotion_(poison, player_look_left_L, BLEND_L);							// 会話
	SetMotion_(poison, MOT_WAIT, BLEND_M);										//モーションがないため待機(後で喜びに)
	
// ▼時間設定
	SetTime_(START_TIME_ZONE_NIGHT);
	
// ▼カメラ設定
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	task_player = Task_AnimeMove_(player, "anm_player000");

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	SetMotion_(player, MOT_WALK, BLEND_M);		//主人公歩き
	task_player = Task_AnimeMove_(player, "anm_player000");
	
	StartDemo(FADE_COLOR_BLACK);
	
	Wait_(47);
	SetMotion_(player, MOT_WAIT, BLEND_M);		//主人公待機
	Wait_(20);
	
	PlaySE_("SE_FLD_135");	//リアクターの反応SE
	
	efc_reactor_light = SetSelectBoneEffect_("ef732_09_light_reactor_c", player, ATTACH_EFFECT1);		//リアクター光;
	SetEffectScale_(efc_reactor_light, 0.5);
	
	Wait_(20);
	DeleteEffectEmitter_(efc_reactor_light);
	
	//===============================================
	//*リアクター
	// 「……目視できない　特殊な存在を感知。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_REACTOR");
	ShowMsg_("DEMO_219_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(player, player_look_right_L, BLEND_L);		//主人公左を向く
	Wait_(18);
	SetMotion_(player, player_look_left_L, BLEND_XL);		//主人公右を向く
	Wait_(20);
	
	PlaySE_("SE_FLD_231");									//リアクター起動SE
	LoadLayout_("reactor_frame");
	SetLayoutAnime_("reactor_on", false);					//リアクター起動

	SetAlpha_(poison, 0);								// ポイズントリルα値
	local task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	Wait_(110);
	PlaySE_("SE_DEM_018");
	SetAlphaFade(poison,0.9,90);

	Wait_(3);
	SetAlpha_(poison, 0.9);								// ポイズントリルα値
	
	Wait_(31);
	
	efc_target_icon = SetSelectBoneEffect_("ef712_10_emo_surprise01", poison, ATTACH_EFFECT1);		//びっくりマーク
	SetEffectScale_(efc_target_icon, 4.0);
	Wait_(5);
	PlaySE_("SE_DEM_053");
	Wait_(30);
	//===============================================
	//*モンスターの幽霊Ａ
	// 「…………！
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_219_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(poison, poison__hand_L, BLEND_M);		//ポイズントリル手を振る
	Wait_(30);
	
	//===============================================
	//*モンスターの幽霊Ａ
	// 「………こっち　こっち
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_219_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(poison, MOT_WAIT, BLEND_L);	
	Wait_(10);
	local task_poison00 = Task_RotateToDir_(poison, -90, ROTATE_EVENT_DEF);		//ポイズントリル左を向く
	local task_poison01 = Task_MoveForward_(poison, 2.0, false);				//ポイズントリル正面に進む
	
	Wait_(25);
	
	PlaySE_("SE_FLD_232");														//リアクター終了SE
	SetLayoutAnime_("reactor_off", false);										//リアクター終了
	
	Wait_(25);
	
	DeleteTask_(task_cam);
	DeleteTask_(task_poison00);
	DeleteTask_(task_poison01);
	
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	
	task_poison01 = Task_AnimeMove_(poison, "anm_poison001");
	
	task_poisonFadeOut = Task_ObjectFadeOut_(poison, 50);						//幽霊フェード消す
	PlaySE_("SE_DEM_018");
	WaitTask(task_poisonFadeOut);
	
	//===============================================
	//*システムメッセージ
	// 幽霊は　○主人公の名前○に
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_219_MSG_040");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	//*システムメッセージ
	// 追いかけて探してみよう。
	//-----------------------------------------------
	ShowMsg_("DEMO_219_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	EndDemo(FADE_COLOR_BLACK);
}
