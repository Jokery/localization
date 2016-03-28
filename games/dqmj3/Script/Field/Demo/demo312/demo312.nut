//=============================================
//
//		demo312[イエタスとの会見]
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
	local task_cam, task_player, task_momonja0, task_momonja1, task_yetas;
	local efc_cam, efc_player, efc_momonja0, efc_momonja1, efc_yetas;
	local effect_pos = Vec3(0, 5, 0);	// ももんじゃ用エフェクトを、Effect1より高い位置に表示する

// ▼リソース読込
	// キャラクター
	local player = GetPlayerId_();					// 主人公
	local model_yeti = ReadNpc_("n041");			// イエタス
	local model_momonja = ReadNpc_("n050");			// メイジももんじゃ
	// エフェクト
//	LoadEffect_("ef741_01_div_nor_death");			// 死亡
	LoadEffect_("ef712_19_emo_confusion01");		// ピヨピヨ
	LoadEffect_("ef712_10_emo_surprise01");			// 「！」
	LoadEffect_("ef733_01_sym_shuchusen01");		// 集中線
	LoadEffect_("ef712_13_emo_sweat01");			// 汗
	LoadEffect_("ef831_01_atc_yetas");				// イエタスの攻撃
	LoadEffect_("ef831_02_line_effect");			// 効果線
	LoadEffect_("ef733_02_sym_black_mist01");		// 黒い靄

// ▼配置
	// 主人公
	SetPointPos_(player, "player000");
	SetAlpha_(player, ALPHA_CLEAR);
	
	// イエタス
	local yetas = ArrangePointNpc_(model_yeti, "npc_yetas000");
	SetScaleSilhouette(yetas, SCALE.N, 0.45);
	PosDebug(yetas);
	SetStepSe_(yetas, "SE_FLD_032");
	
	// ももんじゃ１・２
	local momonja0 = ArrangePointNpc_(model_momonja, "npc_momonja000");
	local momonja1 = ArrangePointNpc_(model_momonja, "npc_momonja100");
	SetScaleSilhouette(momonja0, SCALE.N, 0.4);
	SetScaleSilhouette(momonja1, SCALE.N, 0.4);

// ▼非常駐モーション読込
	// 主人公
	local player_look_up_L = ReadMotion_(player, "Player_look_up_L");		// 上向き待機L
	local pl_surprise = ReadMotion_(player, "Player_surprise");				// 驚く
	local pl_surprise_L = ReadMotion_(player, "Player_surprise_L");			// 驚くL
	local player_battle_L = ReadMotion_(player, "Player_battle_L");			// 戦闘待機L
	local player_nod02 = ReadMotion_(player, "Player_nod02");			// 上向き頷き	
	
	// イエタス
	local yetas_wait_L = ReadMotion_(yetas, "n041_wait_L");				// 待機L
	local yetas_talk_L = ReadMotion_(yetas, "n041_talk_L");				// 会話L
	local yetas_laugh_L = ReadMotion_(yetas, "n041_laugh_L");			// 待機→笑う
	local yetas_scowl = ReadMotion_(yetas, "n041_scowl");				// 笑う→にらむ
	local yetas_attack = ReadMotion_(yetas, "n041_attack");					// アタック

	// ももんじゃ１
	local momonja0_scare_L = ReadMotion_(momonja0, "m041_02_scare_L");		// 怯えるL
	// ももんじゃ２
	local momonja1_talk_L = ReadMotion_(momonja1, "m041_02_talk_L");		// 会話L
	local momonja1_think_L = ReadMotion_(momonja1, "m041_02_think_L");		// 考えるL
	local momonja1_damage = ReadMotion_(momonja1, "m041_02_damage");		// 吹っ飛び→倒れる1
	local momonja1_die_L = ReadMotion_(momonja1, "m041_02_die_L");			// 倒れる1L

// ▼モーション設定
	SetMotion_(yetas, yetas_wait_L, BLEND_N);

// ▼カメラ設定
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");		// 240F

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	// ▼カット１＠イエタスとももんじゃＰＡＮ～～～～～～～～～
	WaitTask(task_cam);
	
	SetAlpha_(momonja0, ALPHA_CLEAR);
	SetAlpha_(momonja1, ALPHA_CLEAR);
	
	// ▼カット２＠イエタスへズームイン～～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");		// 300F
	
	//===============================================
	// *イエタス
	//「ほう！　このイエタスさまの屋敷に
	//　土足で踏み込んでくるとは　いい度胸だな。
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_312_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetAlpha_(player, ALPHA_EXIST);
	SetMotion_(player, player_look_up_L, BLEND_N);					// 上向き待機L
	DeleteTask_(task_cam);
	
	// ▼カット３＠主人公ズームアウト～～～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");		// 180F
	
	Wait_(5);
	//-----------------------------------------------
	// ■イエタス
	//「その姿は……レジスタンスの　生き残りか。
	//　トードーに　泣きつかれて　ここに来たのか？
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_IETASU");
	ShowMsg_("DEMO_312_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	Wait_(10);
	SetMotion_(player, player_nod02, BLEND_M);						//頷き
	Wait_(15);
	SetMotion_(player, player_look_up_L, BLEND_L);		
	Wait_(20);
	
	DeleteTask_(task_cam);
	
	// ▼カット４＠イエタスへズームイン～～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");		// 300F
	
	SetMotion_(yetas, yetas_laugh_L, BLEND_L);						// 待機→笑う
	Wait_(15);
	
	//===============================================
	// ■イエタス
	//「先代を　だまし討ちで　殺したくせに
	//　自分の命は　惜しいというわけか……。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_IETASU");
	ShowMsg_("DEMO_312_MSG_030");
	KeyInputWait_();
	
	//-----------------------------------------------
	// ▽
	//「そんな　ひきょう者の言う　和平など
	//　受け入れては　やれんなぁ。
	//-----------------------------------------------
	ShowMsg_("DEMO_312_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	DeleteTask_(task_cam);
	SetAlpha_(player, ALPHA_CLEAR);
	SetAlpha_(momonja0, ALPHA_EXIST);
	SetAlpha_(momonja1, ALPHA_EXIST);
	
	// ▼カット５＠イエタスとももんじゃ～～～～～～～～～～～～
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	
	SetMotion_(momonja1, MOT_WALK, BLEND_M);
	task_momonja1 = Task_RotateToDir_(momonja1, -90, ROTATE_DEMO_DEF);
	WaitTask(task_momonja1);
	SetMotion_(momonja1, momonja1_talk_L, BLEND_L);					// 会話L
	
	//===============================================
	// *イエタス側近
	//「しかし　イエタスさま。だまし討ちをした
	//　トードーが　和解を　こうも願うでしょうか？
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_312_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	// ▼カット６＠ももんじゃズームアウト～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");		// 180F
	
	SetMotion_(momonja1, momonja1_think_L, BLEND_L);				// 考えるL
	
	Wait_(5);
	//-----------------------------------------------
	//「我々は　もしかして　何か重大な
	//　カン違いを　しているのでは……？
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_312_MSG_060");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	DeleteTask_(task_cam);
	SetAlpha_(momonja0, ALPHA_CLEAR);
	SetAlpha_(momonja1, ALPHA_CLEAR);
	
	StopBgm_(BGM_STOP_DEF);
	
	// ▼カット７＠イエタス攻撃～～～～～～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");								// 80F
	StopBgm_(30);
	efc_cam = SetCameraEffect_("ef733_02_sym_black_mist01", 100);							// 黒い靄
	
	SetMotion_(yetas, yetas_scowl, BLEND_M);												// 笑う→にらむ
	PlaySE_("SE_DEM_109");
	WaitMotion(yetas);																		// 30F
	Wait_(15);
	
	SetMotion_(yetas, yetas_attack, BLEND_XL);
	PlaySE_("SE_DEM_110");
	task_yetas = Task_RotateToDir_(yetas, 45, ROTATE_DEMO_DEF);
	efc_yetas = SetBoneEffect_("ef831_01_atc_yetas", yetas);
	Wait_(20);
	DeleteEffect_(efc_cam);
	
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", CAMERA_DEF);						// 集中線
	WaitMotion(yetas);
	
	DeleteEffect_(efc_cam);
	DeleteTask_(task_cam);
	SetAlpha_(momonja1, ALPHA_EXIST);
	task_momonja1 = Task_AnimeMoveNoDir_(momonja1, "anm_momonja100");
	SetMotion_(momonja1, momonja1_damage, BLEND_N);											// 吹っ飛び→倒れる1
	efc_momonja1 = SetBoneEffect_("ef831_02_line_effect", momonja1);
	
	// ▼カット８＠ももんじゃ、やられ～～～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye007", "anmtgt007");								// 30F
	SetMeshVisible_(momonja1, "Model1", true);												// ももんじゃの目が×になる
	PlaySE_("SE_DEM_111");
	WaitTask(task_cam);
	
	DeleteEffect_(efc_momonja1);
	StartEarthQuake_(15, 3, 0.5);
	PlaySE_("SE_FLD_107");																	// 壁にぶつかる
	WaitMotion(momonja1);
	SetMotion_(momonja1, momonja1_die_L, BLEND_N);											// 倒れる1L
	
	efc_momonja1 = SetPointWorldEffect_("ef712_19_emo_confusion01", "efc_momo000");			// 混乱ef ※位置調整が難しいのでBlenderで配置
	SetEffectScale_(efc_momonja1, 0.05);
	Wait_(30);
	
	DeleteTask_(task_yetas);
	SetAlpha_(player, ALPHA_EXIST);
	SetAlpha_(yetas, ALPHA_CLEAR);
	
	// ▼カット９＠主人公驚き～～～～～～～～～～～～～～～～～
	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");
	
	PlaySE_("SE_DEM_053");
	efc_player = SetSelectBoneEffectSetOffset_("ef712_10_emo_surprise01", player, ATTACH_EFFECT1, Vec3(0.0, 0.5, 1.0));
	SetEffectScale_(efc_player, 0.7);
	SetMotion_(player, pl_surprise, BLEND_M);				// 驚く
	WaitMotion(player);
	SetMotion_(player, pl_surprise_L, BLEND_M);				// 驚くL
	Wait_(30);
	
	SetAlpha_(momonja0, ALPHA_EXIST);
	SetDir_(momonja0, 75);
	SetMotion_(momonja0, momonja0_scare_L, BLEND_N);		// 怯えるL
	efc_momonja0 = SetSelectBoneEffectSetOffset_("ef712_13_emo_sweat01", momonja0, ATTACH_EFFECT1, effect_pos);		// 汗
	SetEffectScale_(efc_momonja0, 3.0);
	
	// ▼カット10＠ももんじゃ驚き～～～～～～～～～～～～～～～
	SetPointCameraEye_("cameye003");
	SetPointCameraTarget_("camtgt003");
	
	Wait_(45);
	SetPointPos_(momonja0, "npc_momonja001");
	SetAlpha_(yetas, ALPHA_EXIST);
	
	// ▼カット11＠イエタスへズームイン～～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye005", "anmtgt005");		// 210F
	
	SetMotion_(yetas, MOT_WALK, BLEND_N);
	task_yetas = Task_RotateToDir_(yetas, -18, ROTATE_DEMO_DEF/2);
	WaitTask(task_yetas);
	
	SetMotion_(player, player_battle_L, BLEND_XL);					// 戦闘待機L
	SetMotion_(yetas, yetas_talk_L, BLEND_M);						// 会話L
	
	//===============================================
	// ■イエタス
	//「大切なのは　希望を　手に入れることだ。
	//　和平など　必要ない……勝てばいい。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_IETASU");
	ShowMsg_("DEMO_312_MSG_070");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	DeleteTask_(task_cam);
	
	// ▼カット12＠イエタスへズームイン～～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye006", "anmtgt006");		// 250F
	
	Wait_(5);
	//-----------------------------------------------
	//「貴様は　ここで始末しようかと　思ったが
	//　気が変わった……見逃してやろう。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_IETASU");
	ShowMsg_("DEMO_312_MSG_080");
	KeyInputWait_();
	
	//-----------------------------------------------
	// ▽
	//「帰って　トードーに伝えろ　レジスタンス。
	//　首を洗って　待っていろ……とな。
	//-----------------------------------------------
	ShowMsg_("DEMO_312_MSG_090");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	EndDemo(FADE_COLOR_BLACK);
}
