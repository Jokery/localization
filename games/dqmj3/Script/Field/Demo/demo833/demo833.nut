//=============================================
//
//		demo833 [アロマの置き土産]
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
	local task_cam, task_player, task_rena, task_aroma;
	local task_aroma_step;
	local efc_player, efc_rena, efc_aroma, efc_cam;

// ▼リソース読込
	// キャラクター
	local player = GetPlayerId_();						// 主人公
	local model_rena = ReadNpc_("n007");				// レナーテ
	local n_aroma = ReadNpc_("n018");					// アロマ
	//ギミック
	local model_o_A01_14 = ReadGimmick_("o_A01_14");	// 青扉
	local model_o_A01_15 = ReadGimmick_("o_A01_15");	// 赤扉
	//エフェクト
	LoadEffect_("ef712_10_emo_surprise01");				// 「！」
	LoadEffect_("ef732_15_holography02");				// ホログラム表現　出現
	LoadEffect_("ef732_14_holography01");				// ホログラム表現　常駐
	LoadEffect_("ef733_01_sym_shuchusen01");			// 集中線

// ▼配置
	// 主人公
	SetPointPos_(player, "player000");
	// レナーテ
	local rena = ArrangePointNpc_(model_rena, "npc_rena000");
	SetVisible(rena, false);
	// アロマ
	local aroma = ArrangePointNpc_(n_aroma, "npc_aroma000");
	SetStepSe_(aroma, SILENT_STEP_SE);
	SetVisible(aroma, false);
	// ドア
	local gmc_o_A01_14 = ArrangePointGimmick_("o_A01_14", model_o_A01_14, "obj_bluedoor");
	local gmc_o_A01_15 = ArrangePointGimmick_("o_A01_15", model_o_A01_15, "obj_reddoor");

// ▼非常駐モーション読込
	local player_guard_L = ReadMotion_(player, "Player_guard_L");				// 主人公　身構えL
	local player_look_around_L = ReadMotion_(player, "Player_look_around_L");	// 主人公　キョロキョロL
	local player_look_right_L = ReadMotion_(player, "Player_look_right_L");		// 主人公　右向き待機L
	local player_surprise = ReadMotion_(player, "Player_surprise");				// 主人公　驚き
	local player_surprise_L = ReadMotion_(player, "Player_surprise_L");			// 主人公　驚きL
	local rena_talk01 = ReadMotion_(rena, "n007_talk01");						// レナーテ　会話（手を胸にあてる）
	local rena_talk01_L = ReadMotion_(rena, "n007_talk01_L");					// レナーテ　会話L（手を胸にあてる）
	local rena_look_left_L = ReadMotion_(rena, "n007_look_left_L");				// レナーテ　左を向くL
	local rena_look_up_L = ReadMotion_(rena, "n007_look_up_L");					// レナーテ　上向き待機L
	local rena_look_down_L = ReadMotion_(rena, "n007_look_down_L");				// レナーテ　うつむき待機L
	local aroma_star_seed_L = ReadMotion_(aroma, "n018_star_seed_L");			// アロマ　スターシードを持つL
	local aroma_look_down_L = ReadMotion_(aroma, "n018_look_down_L");			// アロマ　下向き待機L

// ▼フェード色設定
	SetFade_(FADE_OUT, FADE_COLOR_WHITE, FADE_DEF);
	WaitFade_();

	SetFace_(player, "Face_loop_close");
	SetFace_(aroma, "Face_smile");
	SetMotion_(player, player_guard_L, BLEND_N);		// 主人公　身構えL
	
//足音
	SetStepSe_(rena, "SE_FLD_016");


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット１　主人公　身構え→キョロキョロ　主人公側面
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

// ▼カメラ設定
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------
	SetFade_(FADE_IN, FADE_COLOR_WHITE, 120);

	Wait_(90);
	SetMotion_(player, MOT_WAIT, 34);					// 主人公　待機
	SetFace_(player, "Face_eyes_close");
	Wait_(35);
	SetMotion_(player, player_look_around_L, 22);		// 主人公　キョロキョロL
	Wait_(68);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット２　闘技場内見回し
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	PlayBgm_("BGM_018");
	WaitTask(task_cam);
	DeleteTask_(task_cam);
	Wait_(30);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット３　主人公とレナーテ　レナーテ歩き→主人公右向き→レナーテ会話　二人右斜め前方
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");

	SetVisible(rena, true);
	SetMotion_(player, MOT_WAIT, BLEND_N);				// 主人公　待機
	SetMotion_(rena, MOT_WALK, BLEND_N);				// レナーテ　歩き
	task_rena = Task_AnimeMove_(rena, "anm_rena000");
	Wait_(65);
	SetMotion_(player, player_look_right_L, 10);		// 主人公　右向き待機L
	Wait_(8);
	SetMotion_(rena, MOT_WAIT, BLEND_XL);				// レナーテ　待機
	WaitTask(task_rena);
	DeleteTask_(task_rena);
	Wait_(16);
	SetMotion_(rena, rena_talk01, 18);					// レナーテ　会話（手を胸にあてる）

	//===============================================
	//■レナーテ
	//「なんなの……この場所は……？
	//　格闘場のようだけど……どうして　ここに？
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_833_MSG_010");
	WaitMotion(rena);
	SetMotion_(rena, rena_talk01_L, BLEND_M);			// レナーテ　会話L（手を胸にあてる）
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	SetMotion_(rena, MOT_WAIT, BLEND_XL);			
	Wait_(10);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット４　レナーテ　レナーテ会話　右斜め前方
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");

	SetVisible(player, false);

	//===============================================
	//■レナーテ
	//「これを　アロマが……？　どういうつもりなの？
	//　彼女らしいといえば　らしいのだけど……。　▽
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_833_MSG_020");
	KeyInputWait_();
	Wait_(16);
	SetMotion_(rena, rena_look_left_L, BLEND_XL);		// レナーテ　左を向くL
	Wait_(10);
	//===============================================
	//■レナーテ
	//「<name_player/>……調べてみましょう。
	//　ここからでは　様子が　よくわからないわ。
	//-----------------------------------------------
	ShowMsg_("DEMO_833_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(5);

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット５　武舞台　ズームイン
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");

	SetVisible(player, true);
	Wait_(30);

	//===============================================
	//■レナーテ
	//「中心に　バトル用のステージが　あるみたい。
	//　あそこまで　行ってみましょう。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_833_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	WaitTask(task_cam);
	DeleteTask_(task_cam);
	Wait_(15);
	SetMotion_(player, MOT_WALK, BLEND_N);				// 主人公　歩き
	SetMotion_(rena, MOT_WALK, BLEND_N);				// レナーテ　歩き
	task_player = Task_AnimeMove_(player, "anm_player001");
	task_rena = Task_AnimeMove_(rena, "anm_rena001");
	Wait_(1);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット６　主人公とレナーテ　二人歩き→レナーテ会話　左斜め前方
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	SetPointCameraEye_("cameye003");
	SetPointCameraTarget_("camtgt003");

	Wait_(73);
	SetMotion_(player, MOT_WAIT, BLEND_XL);				// 主人公　待機
	SetMotion_(rena, MOT_WAIT, BLEND_XL);				// レナーテ　待機
	WaitTask(task_rena);
	Wait_(15);
	SetMotion_(player, player_look_around_L, 20);		// 主人公　キョロキョロL
	SetMotion_(rena, rena_look_up_L, 21);				// レナーテ　上向き待機L

	//===============================================
	//■レナーテ
	//「立派な　客席ね……お客さんが
	//　たくさん　入れそうだわ。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_833_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(15);

	//===============================================
	//＊アロマ２号
	//「ようこそ！　モンスターバトルグランプリへ！
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_833_MSG_060");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	local efc_player = SurpriseDispSetOffset(player, Vec3(0.1, 1.9, 0.0), 0.525);
	local efc_rena = SurpriseDispSetOffset(rena, Vec3(0.9, -0.5, 0.0), 0.7);
	SetMotion_(player, MOT_WAIT, BLEND_M);				// 主人公　待機
	SetMotion_(rena, MOT_WAIT, BLEND_M);				// レナーテ　待機
	Wait_(45);
	SetVisible(aroma, true);
	SetMotion_(aroma, MOT_WALK, BLEND_N);				// アロマ　歩き
	task_aroma = Task_AnimeMove_(aroma, "anm_aroma000");
	task_aroma_step = Task_PlaySe_("SE_FLD_016", 15);
	Wait_(1);
	DeleteTask_(task_player);
	DeleteTask_(task_rena);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット７　足元→バストアップ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	SetPointCameraEye_("cameye004");
	SetPointCameraTarget_("camtgt004");

	Wait_(40);
	SetMotion_(aroma, MOT_WAIT, BLEND_XL);				// アロマ　待機
	WaitTask(task_aroma);
	DeleteTask_(task_aroma);
	Wait_(10);
	DeleteTask_(task_aroma_step);
	
	PlaySE_("SE_DEM_068");
	efc_aroma = SetBoneEffect_("ef732_15_holography02", aroma);							//ホログラム出現
	SetAlpha_(aroma, ALPHA_HALF);
	Wait_(5);
	SetAlpha_(aroma, ALPHA_EXIST);

	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");
	Wait_(70);
	
	PlaySE_("SE_DEM_068");
	efc_aroma = SetBoneEffect_("ef732_15_holography02", aroma);							//ホログラム出現
	SetAlpha_(aroma, ALPHA_HALF);
	Wait_(3);
	SetAlpha_(aroma, ALPHA_EXIST);
	Wait_(15);
	
	PlaySE_("SE_DEM_068");
	efc_aroma = SetBoneEffect_("ef732_15_holography02", aroma);							//ホログラム出現
	SetAlpha_(aroma, ALPHA_HALF);
	Wait_(3);
	SetAlpha_(aroma, ALPHA_EXIST);
	
	WaitTask(task_cam);
	DeleteTask_(task_cam);
	Wait_(30);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット８　アロマ　主人公とレナーテ　ズームイン
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");

	SetDir_(rena, 295);
	SetPointPos_(player, "player001");
	SetMotion_(player, player_surprise, BLEND_M);		// 主人公　驚き
	SetMotion_(rena, rena_talk01, BLEND_L);				// レナーテ　会話（手を胸にあてる）
	PlaySE_("SE_DEM_026");								// ■SE:集中線
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", CAMERA_DEF);	// 集中線
	Wait_(8);
	SetMotion_(player, player_surprise_L, BLEND_M);		// 主人公　驚きL

	//===============================================
	//■レナーテ
	//「あ……アロマッ！？
	//　どうして　ここに……旅立ったはずでは！？
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_833_MSG_070");
	Wait_(2);
	DeleteEffectEmitter_(efc_cam);
	WaitMotion(rena);
	SetMotion_(rena, rena_talk01_L, BLEND_M);			// レナーテ　会話L（手を胸にあてる）
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(rena, MOT_WAIT, BLEND_XL);				// レナーテ　待機
	Wait_(26);
	DeleteTask_(task_cam);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット９　３人　俯瞰→水平
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");

	SetPointPos_(player, "player002");
	SetMotion_(aroma, MOT_WALK, BLEND_N);				// アロマ　歩き
	task_aroma = Task_AnimeMove_(aroma, "anm_aroma001");
	task_aroma_step = Task_PlaySe_("SE_FLD_016", 15);
	Wait_(56);
	SetMotion_(aroma, MOT_WAIT, BLEND_XL);				// アロマ　待機
	Wait_(16);
	DeleteTask_(task_aroma_step);
	Wait_(16);
	DeleteTask_(task_aroma);
	DeleteTask_(task_cam);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット１０　アロマ　バストアップ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	SetPointCameraEye_("cameye005");
	SetPointCameraTarget_("camtgt005");

	//===============================================
	//＊アロマ２号
	//「アタシは　アロマ本人じゃないわ。
	//　このモンスター格闘場の案内役　アロマ２号よ！
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_833_MSG_080");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(10);
	PlaySE_("SE_DEM_068");
	efc_aroma = SetBoneEffect_("ef732_15_holography02", aroma);							//ホログラム出現
	SetAlpha_(aroma, ALPHA_HALF);
	Wait_(3);
	SetAlpha_(aroma, ALPHA_EXIST);
	Wait_(15);
	
	PlaySE_("SE_DEM_068");
	efc_aroma = SetBoneEffect_("ef732_15_holography02", aroma);							//ホログラム出現
	SetAlpha_(aroma, ALPHA_HALF);
	Wait_(3);
	SetAlpha_(aroma, ALPHA_EXIST);
	Wait_(34);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット１１　レナーテ　バストアップ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	SetPointCameraEye_("cameye006");
	SetPointCameraTarget_("camtgt006");

	SetMotion_(rena, rena_look_down_L, BLEND_N);		// レナーテ　うつむき待機L
	Wait_(30);

	//===============================================
	//■レナーテ
	//「アロマ２号……そうか　ＡＩね？
	//　テレジアのような……。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_833_MSG_090");
	Wait_(12);
	SetMotion_(rena, MOT_WAIT, BLEND_XL);				// レナーテ　待機
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット１２　アロマ　バストアップ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	SetPointCameraEye_("cameye007");
	SetPointCameraTarget_("camtgt007");

	SetMotion_(aroma, MOT_WAIT, BLEND_N);				// アロマ　待機
	Wait_(5);
	SetMotion_(aroma, aroma_look_down_L, 16);			// アロマ　下向き待機L
	Wait_(16);
	SetMotion_(aroma, MOT_WAIT, 12);					// アロマ　待機
	Wait_(16);
	
	PlaySE_("SE_DEM_068");
	efc_aroma = SetBoneEffect_("ef732_15_holography02", aroma);							//ホログラム出現
	SetAlpha_(aroma, ALPHA_HALF);
	Wait_(3);
	SetAlpha_(aroma, ALPHA_EXIST);
	Wait_(11);
	SetMotion_(aroma, MOT_TALK, BLEND_L);				// アロマ　会話
	Wait_(8);

	//===============================================
	//■アロマ２号
	//「モンスターバトルグランプリは
	//　アンタに残した　アロマからの挑戦状！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA_NO2");
	ShowMsg_("DEMO_833_MSG_100");
	WaitMotion(aroma);
	SetMotion_(aroma, MOT_TALKLOOP, BLEND_L);			// アロマ　会話L
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(5);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット１３　主人公とレナーテ　ヾ(oﾟωﾟo)ﾉﾞ＜謎の歓声
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	SetPointCameraEye_("cameye008");
	SetPointCameraTarget_("camtgt008");

	SetDir_(player, 330);
	SetDir_(rena, 345);
	SetMotion_(player, MOT_WAIT, BLEND_N);				// 主人公　待機

	//===============================================
	//■アロマ２号
	//「最強のモンスターマスターを　目指して
	//　勝ち抜いてみせなさい　<name_player/>！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA_NO2");
	ShowMsg_("DEMO_833_MSG_110");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	task_cam = Task_AnimeMoveCamera_("anmeye005", "anmtgt005");

	PlayLoopSE_("SE_WIFI_001");
	WaitTask(task_cam);
	Wait_(30);
	StopLoopSE_(15);

	EndDemo(FADE_COLOR_WHITE);

}
