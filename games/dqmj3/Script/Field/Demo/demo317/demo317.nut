//=============================================
//
//		demo317[黒幕アーザムーク登場]
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
	local task_cam, task_player, task_yetas, task_momonja1, task_silver, task_todo, task_azmk, task_reactor;
	local efc_cam, efc_player, efc_yetas00, efc_yetas01, efc_yetas02, efc_momonja1, efc_silver;
	local efc_reactor0, efc_reactor1, efc_reactor2, efc_reactor3, efc_reactor4;
	local offset_momonja1 = Vec3(0, 5, 0);
	local offset_reactor0 = Vec3(0, 40, 20);
	local offset_reactor1 = Vec3(0, 40.5, 10);

// ▼リソース読込
	// ギミック
	local model_ice_wall = ReadGimmick_("o_I01_00");// 氷の壁
	local model_proof = ReadGimmick_("o_dem_14");	// オサの証
	local model_reactor = ReadGimmick_("o_dem_15");	// オサの証のリアクター
	// キャラクター
	local player = GetPlayerId_();					// 主人公
	local model_yeti = ReadNpc_("n041");			// イエタス
	local model_momonja = ReadNpc_("m041_02");		// メイジももんじゃ
	local model_silver = ReadNpc_("m077_00");		// シルバーデビル
	local model_todo = ReadNpc_("n039");			// トードー親分
	local model_azmk = ReadNpc_("m204_00");			// アーザムーク
	// エフェクト
	LoadEffect_("ef712_10_emo_surprise01");			// 「！」
	LoadEffect_("ef712_13_emo_sweat01");			// 汗
	LoadEffect_("ef733_01_sym_shuchusen01");				// 集中線
	LoadEffect_("ef721_02_nat_smoke_n01");			// 煙
	LoadEffect_("ef831_05_black_cyclone");			// 黒い竜巻
	LoadEffect_("ef831_06_black_feather");			// 黒い羽
	LoadEffect_("ef730_01_oth_dark_aura01");		// 禍々しいオーラ
	LoadEffect_("ef733_02_sym_black_mist01");		// 黒い靄
	LoadEffect_("ef800_04_flying_reactor01");		// リアクター飛行開始
	LoadEffect_("ef831_07_appear_reactor_p");		// リアクターの部品出現
	LoadEffect_("ef831_08_union_reactor01");		// リアクターの合体

// ▼配置
	// 氷の壁
	local ice_wall = ArrangePointGimmick_("o_I01_00", model_ice_wall, "obj_ice_wall000");
	
	// オサの証のリアクター
	local reactor = ArrangePointGimmick_("o_dem_15", model_reactor, "obj_reactor000");
	SetMotion_(reactor, MOT_GIMMICK_1, BLEND_N);
	SetAlpha_(reactor, ALPHA_CLEAR);
	
	// 主人公
	SetPointPos_(player, "player000");
	// イエタス
	local yetas = ArrangePointNpc_(model_yeti, "npc_yetas000");
	SetScaleSilhouette(yetas, SCALE.N, 0.55);
	SetStepSe_(yetas, "SE_FLD_032");
	SetStepSePan_(yetas, false);
	// ももんじゃ１・２
	local momonja1 = ArrangePointNpc_(model_momonja, "npc_momonja100");
	SetVisible(momonja1, false);
	// シルバー
	local silver = ArrangePointNpc_(model_silver, "npc_silver000");
	SetScaleSilhouette(silver, SCALE.N, SILHOUETTE_WIDTH.S);
	SetStepSePan_(silver, false);
	// トードー(オサの証なし)
	local todo = ArrangePointNpc_(model_todo, "npc_todo000");
	SetScaleSilhouette(todo, SCALE.TODO, SILHOUETTE_WIDTH.S);
	// アーザムーク
	local azmk = ArrangePointNpc_(model_azmk, "npc_azmk000");
	SetScaleSilhouette(azmk, SCALE.AZAMUKU, SILHOUETTE_WIDTH.S);
	SetPointPosNoFit_(azmk, "npc_azmk000");
	SetAlpha_(azmk, ALPHA_CLEAR);

	// オサの証（イエタスにアタッチするものなので、イエタスより後にArrangePointGimmick_する）
	local proof = ArrangePointGimmick_("o_dem_14", model_proof, "obj_proof000");
	SetScaleSilhouette(proof, 1.5, SILHOUETTE_WIDTH.REACTOR);
	SetAlpha_(proof, ALPHA_CLEAR);

// ▼非常駐モーション読込
	// 主人公
	local player_battle_L = ReadMotion_(player, "Player_battle_L");			// 戦闘待機L
	local player_caution01_L = ReadMotion_(player, "Player_caution01_L");	// 警戒L
	local player_look_left_L = ReadMotion_(player, "Player_look_left_L");	// 左向き待機L
	local player_look_up_L = ReadMotion_(player, "Player_look_up_L");		// 上向き待機L
	local player_battle01_L = ReadMotion_(player, "Player_battle01_L");		// 上向き戦闘待機L
	// イエタス
	local yetas_wait_L = ReadMotion_(yetas, "m038_00_wait_L");				// 待機L
	local yetas_talk_L = ReadMotion_(yetas, "m038_00_talk_L");				// 会話L
	local yetas_laugh_L = ReadMotion_(yetas, "m038_00_laugh_L");			// 待機→笑う
	local yetas_pendant_L = ReadMotion_(yetas, "m038_00_pendant_L");		// ペンダントを持つL
	local yetas_retreat = ReadMotion_(yetas, "m038_00_retreat");			// 待機→後ずさる
	local yetas_retreat_L = ReadMotion_(yetas, "m038_00_retreat_L");		// 後ずさるL
	local yetas_float = ReadMotion_(yetas, "m038_00_float");				// 笑う→浮く
	local yetas_float_L = ReadMotion_(yetas, "m038_00_float_L");			// 浮くL
	local yetas_attack = ReadMotion_(yetas, "n041_attack");				// 攻撃（イエタス用）

	// シルバー
	local silver_strike = ReadMotion_(silver, "m077_00_strike");			// 待機→地面を打つ→待機
	local silver_wait_right_L = ReadMotion_(silver, "m077_00_wait_right_L");// 顔を右向けるL
	local silver_refer = ReadMotion_(silver, "m077_00_refer");				// 待機→イエタスを指さす
	local silver_refer_L = ReadMotion_(silver, "m077_00_refer_L");			// イエタスを指さすL
	local silver_wait_above_L = ReadMotion_(silver, "m077_00_wait_above_L");// 上向き待機L
	// トードー(オサの証なし)
	local todo_lay_L = ReadMotion_(todo, "m141_00_lay_L");					// ひざをつくL
	local todo_strike = ReadMotion_(todo, "m141_00_strike");				// 膝をつく→地面をたたく
	// アーザムーク
	local azmk_appearance = ReadMotion_(azmk, "m204_00_appearance");		// 登場
	local azmk_talk_L = ReadMotion_(azmk, "m204_00_talk_L");				// 会話（喜）L
	local azmk_bow = ReadMotion_(azmk, "m204_00_bow");						// おじぎ→リアクターを取り出す
	local azmk_take_reactor_L = ReadMotion_(azmk, "m204_00_take_reactor_L");// リアクターを取り出すL

// ▼モーション設定
	SetMotion_(yetas, MOT_WALK, BLEND_N);
	task_yetas = Task_MoveToPointSetSpeed_(yetas, "npc_yetas001", 0.5);
	SetMotion_(todo, todo_lay_L, BLEND_N);
	SetFace_(todo, "Face_look_up");
	
// ▼カメラ設定
	task_cam = Task_AnimeMoveCamera_("anmeye011", "anmtgt011");		// 60F

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	// ▼カット１＠イエタス登場～～～～～～～～～～～～～～～～
	WaitTask(task_yetas);
	SetMotion_(yetas, MOT_WAIT, BLEND_L);
	
	//===============================================
	//■イエタス
	//「手こずらせてくれたな　トードー！
	//　いただくぞ　オサの証を！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_IETASU");
	ShowMsg_("DEMO_317_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(yetas, yetas_attack, BLEND_XL);
	PlaySE_("SE_DEM_117");
	Wait_(18);
	
	//-----
	SetFade_(FADE_OUT, FADE_COLOR_WHITE, 8);
	WaitFade_();
	
	SetPointPos_(yetas,"npc_yetas002");
	SetMotion_(yetas, yetas_pendant_L, BLEND_N);
	
	SetMotion_(proof, MOT_GIMMICK_0, BLEND_N);
	AttachObject_(yetas, proof, ATTACH_EFFECT1);
	SetAlpha_(proof, ALPHA_EXIST);
	SetMeshVisible_(todo, "Model_2", false);								// オサの証
	
	Wait_(30);
	SetScaleSilhouette(proof, SCALE.REACTOR, SILHOUETTE_WIDTH.REACTOR);
	
	// ▼カット２＠イエタスズームアウト～～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");		// 150F
	InitSilhouetteWidth_(yetas, 0.8);
	SetFade_(FADE_IN, FADE_COLOR_WHITE, FADE_DEF);
	WaitFade_();
	//-----
	
	WaitTask(task_cam);
	Wait_(30);

	// ▼カット３＠トードーとイエタス会話～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");		// 300F
	InitSilhouetteWidth_(yetas, 1.4);
	//===============================================
	//■トードー
	//「イエタス　なぜ　こんなことを！？
	//　そのオサの証こそ　ルキヤの残した……！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TODO");
	ShowMsg_("DEMO_317_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	DeleteTask_(task_cam);
	SetAlpha_(todo, ALPHA_CLEAR);
	
	// ▼カット3.5＠イエタスＵＰ～～～～～～～～～～～～～～～～
	SetPointCameraEye_("cameye011");
	SetPointCameraTarget_("camtgt011");
	InitSilhouetteWidth_(yetas, 0.7);
	//===============================================
	//■イエタス
	//「知っている。だから　求めたのだ。
	//　ルキヤの残した　希望を　俺がいただく！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_IETASU");
	ShowMsg_("DEMO_317_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetAlpha_(yetas, ALPHA_CLEAR);
	SetAlpha_(proof, ALPHA_CLEAR);
	SetAlpha_(todo, ALPHA_EXIST);
	DeleteTask_(task_cam);
	
	// ▼カット４＠トードーズームイン～～～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");		// 15F
	
	SetMotion_(todo, todo_strike, BLEND_M);							// 膝をつく→地面をたたく
	task_todo = Task_ChangeMotion_(todo, todo_lay_L, BLEND_M);		// 膝をつくL
	Wait_(25);
	
	SetPointWorldEffect_("ef721_02_nat_smoke_n01", "efc_smoke000");	// 煙03
	PlaySE_("SE_DEM_014");		// ボーショク足踏み
	StartEarthQuake_(9, 3, 1);
	Wait_(9);
	StartDecayEarthQuake_(18, 3, 1);
	Wait_(20);
	
	//===============================================
	//■トードー
	//「バカが！　いずれ　時が来るまで
	//　そっとしとけと　ルキヤは　言うちょった！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TODO");
	ShowMsg_("DEMO_317_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	DeleteTask_(task_cam);
	DeleteTask_(task_todo);
	SetAlpha_(yetas, ALPHA_EXIST);
	SetAlpha_(proof, ALPHA_EXIST);
	
	// ▼カット５＠イエティズームイン～～～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");		// 180F
	
	//===============================================
	//■イエタス
	//「そんなことは　知らんな。
	//　手に入れてしまえば　どうにでもなる。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_IETASU");
	ShowMsg_("DEMO_317_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	Wait_(12);
	
	//===============================================
	//*シルバー
	//「ほう……やけに　急ぐじゃないか。
	//　何か　事情でも　あるようだな……イエタス！
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_317_MSG_060");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetAlpha_(proof, ALPHA_CLEAR);
	SetMotion_(yetas, MOT_WAIT, BLEND_N);
	DeleteTask_(task_cam);
	
	SetMotion_(player, MOT_RUN, BLEND_N);
	task_player = Task_MoveToPointSetSpeed_(player, "player001", 1.0);
	SetMotion_(silver, MOT_RUN, BLEND_N);
	task_silver = Task_MoveToPointSetSpeed_(silver, "npc_silver001", 1.0);
	
	// ▼カット６＠主人公とシルバー登場～～～～～～～～～～～～
	SetPointCameraEye_("cameye010");
	SetPointCameraTarget_("camtgt010");
	
	WaitTask(task_silver);
	SetMotion_(silver, MOT_WAIT, BLEND_L);
	WaitTask(task_player);
	SetMotion_(player, player_battle_L, BLEND_M);		// 戦闘待機L
	Wait_(15);
	
	// ▼カット７＠シルバーヘズームイン～～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");		// 10F
	PlaySE_("SE_DEM_026");	// ■SE:集中線
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", CAMERA_DEF);	// 集中線
	
	
	//===============================================
	//■トードー
	//「シルバー！　生きておったのか！？
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TODO");
	ShowMsg_("DEMO_317_MSG_070");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	DeleteEffect_(efc_cam);
	DeleteTask_(task_cam);
	
	SetPointPos_(player, "player002");
	SetPointPos_(silver, "npc_silver002");
	SetPointPos_(yetas, "npc_yetas003");
	SetPointPos_(momonja1, "npc_momonja101");
	SetDir_(todo, -70);
	
	SetMotion_(player, MOT_WALK, BLEND_N);
	SetMotion_(silver, MOT_WALK, BLEND_M);
	task_player = Task_MoveToPointSetSpeed_(player, "player003", 0.5);
	task_silver = Task_MoveToPointSetSpeed_(silver, "npc_silver003", 0.5);
	
	// ▼カット８＠主人公とシルバーカメライン～～～～～～～～～
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	InitSilhouetteWidth_(yetas, 1.4);
	SetMotion_(yetas, yetas_retreat, BLEND_M);				// 待機→後ずさる
	Task_ChangeMotion_(yetas, yetas_retreat_L, BLEND_M);	// 後ずさるL
	
	WaitTask(task_player);
	SetMotion_(player, player_caution01_L, BLEND_L);		// 警戒L
	
	WaitTask(task_silver);
	SetMotion_(silver, MOT_WAIT, BLEND_L);
	
	//===============================================
	//■シルバー
	//「私が　死ぬわけないだろう。
	//　と言いたいが……運が　よかっただけだな。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_SILVER");
	ShowMsg_("DEMO_317_MSG_080");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetDirToPos_(silver, GetPos_(momonja1));
	SetPointPos_(yetas, "npc_yetas004");
	SetMotion_(yetas, yetas_wait_L, BLEND_N);
	SetAlpha_(todo, ALPHA_CLEAR);
	
	// ▼カット９＠主人公とシルバー～～～～～～～～～～～～～～
	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");
	
	SetMotion_(silver, silver_wait_right_L, BLEND_XL);	//  顔を右向けるL
	Wait_(10);
	
	SetMotion_(player, player_look_left_L, BLEND_XL);	// 左向き待機L
	
	//===============================================
	//■シルバー
	//「だが　おかげで　<name_player/>と会えた。
	//　そして　事件の真相に　たどりつけたのだ！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_SILVER");
	ShowMsg_("DEMO_317_MSG_090");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(silver, silver_refer, BLEND_L);		// イエタスを指さす
	task_silver = Task_ChangeMotion_(silver, silver_refer_L, BLEND_M);
	Wait_(5);
	
	// ▼カット10＠イエタスへＰＡＮ～～～～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye005", "anmtgt005");		// 20F
	StartBlurEffect_();
	
	WaitTask(task_cam);
	EndBlurEffect_();
	
	PlaySE_("SE_DEM_053");												// 「！」
	efc_yetas02 = SetPointWorldEffect_("ef712_10_emo_surprise01", "efc_surprise000");// 「！」
	SetEffectScale_(efc_yetas02, 0.7);
	SetMotion_(yetas, yetas_retreat, BLEND_M);							// 待機→後ずさる
	task_yetas = Task_ChangeMotion_(yetas, yetas_retreat_L, BLEND_M);	// 後ずさるL
	
	//===============================================
	//■シルバー
	//「こいつは　イエタスを殺して
	//　なりすました　真っ赤な　ニセモノだ！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_SILVER");
	ShowMsg_("DEMO_317_MSG_100");
	KeyInputWait_();
	
	//-----------------------------------------------
	//■シルバー
	//「何者だ？　正体を　現すがいい！
	//-----------------------------------------------
	ShowMsg_("DEMO_317_MSG_110");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	DeleteTask_(task_yetas);
	DeleteTask_(task_silver);
	SetMotion_(yetas, yetas_wait_L, BLEND_N);								// 待機L
	
	// ▼カット11＠イエタスアップ～～～～～～～～～～～～～～～
	SetPointCameraEye_("cameye003");
	SetPointCameraTarget_("camtgt003");
	InitSilhouetteWidth_(yetas, 0.7);
	SetPointPosNoFit_(yetas, "npc_yetas004");
	//===============================================
	//■イエタス
	//「ホーッホッホッホッ！
	//　まさか　あなたが　生きていらしたとは。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_IETASU");
	ShowMsg_("DEMO_317_MSG_120");
	KeyInputWait_();
	//===============================================
	
	efc_yetas00 = SetBoneEffect_("ef730_01_oth_dark_aura01", yetas);		// 禍々しいオーラ
	SetEffectScale_(efc_yetas00, 1.5);
	efc_cam = SetCameraEffect_("ef733_02_sym_black_mist01", 100);				// 黒い靄
	
	// ▼カット12＠イエタスＰＡＮＵＰ～～～～～～～～～～～～～
	SetMotion_(yetas, yetas_float, BLEND_XL);
	task_yetas = Task_AnimeMoveNoFitSetMotion_(yetas, "anm_yetas000", yetas_float, yetas_float_L);	// 笑う→浮く
	task_cam = Task_AnimeMoveCamera_("anmeye006", "anmtgt006");		// 40F
	
	//===============================================
	//■イエタス
	//「とんだ誤算ですが……問題は　ありませんねぇ。
	//　すでに　求めたカギは　我が手にあり！
	//-----------------------------------------------
	ShowMsg_("DEMO_317_MSG_130");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	WaitTask(task_cam);
	DeleteEffectEmitter_(efc_yetas00);
	
	// ▼カット13＠イエタスへズームイン～～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye007", "anmtgt007");			// 60F
	efc_yetas00 = SetSelectBoneEffect_("ef831_05_black_cyclone", yetas, ATTACH_GLOBAL);		// 黒い竜巻
	efc_yetas01 = SetSelectBoneEffect_("ef831_06_black_feather", yetas, ATTACH_GLOBAL);		// 黒い羽
	PlaySE_("SE_DEM_118");
	Wait_(45);
	
	//-----
	SetFade_(FADE_OUT, FADE_COLOR_WHITE, 8);
	WaitFade_();
	
	SetAlpha_(player, ALPHA_CLEAR);
	SetAlpha_(silver, ALPHA_CLEAR);
	SetAlpha_(todo, ALPHA_CLEAR);
	
	SetAlpha_(yetas, ALPHA_CLEAR);
	SetAlpha_(azmk, ALPHA_EXIST);
	SetMotion_(azmk, azmk_appearance, BLEND_N);
	DeleteTask_(task_cam);
	DeleteTask_(task_yetas);
	DeleteEffect_(efc_cam);
	DeleteEffect_(efc_yetas00);
	DeleteEffect_(efc_yetas01);
	
	// ▼カット14＠アーザムーク登場～～～～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye008", "anmtgt008");		// 125F
	
	SetFade_(FADE_IN, FADE_COLOR_WHITE, FADE_DEF);
	//-----
	PlayBgm_("BGM_007");
	Wait_(60);
	PlaySE_("SE_FLD_036");		// 「バサッ」
	SetBoneEffect_("ef831_06_black_feather", azmk);
	Wait_(5);
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", CAMERA_DEF);	// 集中線
	Wait_(15);
	DeleteEffect_(efc_cam);
	
	WaitMotion(azmk);
	SetMotion_(azmk, MOT_WAIT, BLEND_L);
	
	Wait_(30);
	
	SetPointPos_(player, "player004");
	SetPointPos_(silver, "npc_silver004");
	SetPointPos_(todo, "npc_todo001");
	SetAlpha_(player, ALPHA_EXIST);
	SetAlpha_(silver, ALPHA_EXIST);
	SetAlpha_(todo, ALPHA_EXIST);
	SetMotion_(player, player_battle01_L, BLEND_N);
	SetMotion_(silver, silver_wait_above_L, BLEND_N);
	SetMotion_(todo, MOT_WAIT, BLEND_N);
	
	// ▼カット15＠アーザムークあおり～～～～～～～～～～～～～
	SetPointCameraEye_("cameye004");
	SetPointCameraTarget_("camtgt004");
	
	//===============================================
	//■トードー
	//「なんじゃあ　おんしは！？
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TODO");
	ShowMsg_("DEMO_317_MSG_140");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	// ▼カット16＠アーザムークＵＰ～～～～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye009", "anmtgt009");		// 90F
	
	Wait_(60);	
	//===============================================
	//*アーザムーク
	//「わたぁーくしの　名前はぁーっ！
	//　アァァァザムゥゥゥクッ！！
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_317_MSG_150");
	KeyInputWait_();
	CloseMsgWnd_();	
	SetMotion_(azmk, azmk_bow, 30);		// おじぎ→リアクターを取り出す
	WaitMotion(azmk);
	SetMotion_(azmk, azmk_take_reactor_L, BLEND_N);	
	//-----------------------------------------------
	//■アーザムーク
	//「ダークマスターさまの　忠実なる　部下として
	//　レジスタンスの希望……いただきますよ！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AZAMUKU");
	ShowMsg_("DEMO_317_MSG_160");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	WaitTask(task_cam);
	
	// ▼カット17＠リアクターへズームイン～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye012", "anmtgt012");		// 90F
	
	efc_reactor1 = SetSelectBoneEffect_("ef831_07_appear_reactor_p", reactor, ATTACH_EFFECT1);
	efc_reactor2 = SetSelectBoneEffect_("ef831_07_appear_reactor_p", reactor, ATTACH_EFFECT2);
	PlaySE_("SE_DEM_119");
	Wait_(5);
	
	SetAlpha_(reactor, ALPHA_EXIST);
	local effectId = SetSelectBoneEffect_("ef831_07_appear_reactor_p", reactor, ATTACH_GLOBAL);
	
	Wait_(30);
	local effectId2 = SetSelectBoneEffectSetOffset_("ef831_08_union_reactor01", reactor, ATTACH_GLOBAL, Vec3(0.0, 0.0, 0.0));
	SetMotion_(reactor, MOT_GIMMICK_2, BLEND_N);		// くっつき始める
	Wait_(70);
	
	//===============================================
	//白フラッシュのようなフェードアウト
	SetFade_(FADE_OUT, FADE_COLOR_WHITE, 10);
	Wait_(20);

	DeleteEffectEmitter_(efc_reactor1);
	DeleteEffectEmitter_(efc_reactor2);
	DeleteEffectEmitter_(effectId);

	SetAlpha_(reactor, ALPHA_CLEAR);
	SetMotion_(reactor, MOT_GIMMICK_3, BLEND_N);		// くっついた後
	
	
	// ▼カット18＠アーザムーク、ズームアウト～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye010", "anmtgt010");		// 120F
	
	task_reactor = Task_ObjectFadeIn_(reactor, 30);
	efc_reactor0 = SetSelectBoneEffect_("ef800_04_flying_reactor01", reactor, ATTACH_GLOBAL);

	SetFade_(FADE_IN, FADE_COLOR_WHITE, FADE_DEF);
	WaitFade_();
	//===============================================
	Wait_(10);
	WaitTask(task_reactor);
	WaitTask(task_cam);
	DeleteEffectEmitter_(effectId2);
	
	//===============================================
	//■アーザムーク
	//「そう！　このルキヤさんの　リアクターが！
	//　残されし　希望への　カギとなる！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AZAMUKU");
	ShowMsg_("DEMO_317_MSG_170");
	KeyInputWait_();
	
	//-----------------------------------------------
	//■アーザムーク
	//「希望……それは　我々を　倒すための
	//　切り札となる物に　違いありませんからねぇ！
	//-----------------------------------------------
	ShowMsg_("DEMO_317_MSG_180");
	KeyInputWait_();
	
	//-----------------------------------------------
	//■アーザムーク
	//「レジスタンスの　確実な　滅びのために……
	//　潰させて　いただきますよーぅ！
	//-----------------------------------------------
	ShowMsg_("DEMO_317_MSG_190");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetBoneEffect_("ef831_05_black_cyclone", azmk);		// 黒い竜巻
	PlaySE_("SE_DEM_120");
	Wait_(22);
	
	//-----
	SetFade_(FADE_OUT, FADE_COLOR_WHITE, 8);
	WaitFade_();
	
	SetAlpha_(azmk, ALPHA_CLEAR);
	SetAlpha_(reactor, ALPHA_CLEAR);
	DeleteEffect_(efc_reactor0);
	SetBoneEffect_("ef831_06_black_feather", azmk);		// 黒い羽
	
	SetFade_(FADE_IN, FADE_COLOR_WHITE, 8);
	WaitFade_();
	//-----
	
	Wait_(30);
	
	// ▼カット19＠３人をうつす～～～～～～～～～～～～～～～～
	SetPointCameraEye_("cameye009");
	SetPointCameraTarget_("camtgt009");
	
	//===============================================
	//■シルバー
	//「リアクターを　奪われたか！
	//　奴め……鉄の箱舟の　封印を解く気だな！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_SILVER");
	ShowMsg_("DEMO_317_MSG_200");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	//===============================================
	//■トードー
	//「ルキヤの研究室が　狙いじゃったとは……。
	//　シルバー！　ワシらも　急いで追うぞ！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TODO");
	ShowMsg_("DEMO_317_MSG_210");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetAlpha_(player, ALPHA_EXIST);
	SetDir_(player, 210);
	SetAlpha_(todo, ALPHA_CLEAR);
	SetAlpha_(silver, ALPHA_CLEAR);
	
	// ▼カット20＠主人公ＵＰ～～～～～～～～～～～～～～～～～
	SetPointCameraEye_("cameye008");
	SetPointCameraTarget_("camtgt008");
	
	Wait_(5);
	//===============================================
	//■トードー
	//「聞いとったな？　アーザムークめは
	//　おんしら　レジスタンスを滅ぼすのが　目的！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TODO");
	ShowMsg_("DEMO_317_MSG_220");
	KeyInputWait_();
	
	//-----------------------------------------------
	//■トードー
	//「奴らを　のさばらせておけば　おんしにも
	//　必ず　災いが　降りかかるはずじゃ！
	//-----------------------------------------------
	ShowMsg_("DEMO_317_MSG_230");
	KeyInputWait_();
	CloseMsgWnd_();
	//-----------------------------------------------
	
	SetAlpha_(todo, ALPHA_EXIST);
	SetAlpha_(player, ALPHA_CLEAR);
	
	// ▼カット21＠トードーＵＰ～～～～～～～～～～～～～～～～
	SetPointCameraEye_("cameye007");
	SetPointCameraTarget_("camtgt007");
	
	SetFace_(todo, "Face_default");
	Wait_(5);
	//-----------------------------------------------
	//■トードー
	//「ワシらも　すぐ後を追う。おんしは　先行し
	//　南東にある　鉄の箱舟に行き　奴を止めてくれ！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TODO");
	ShowMsg_("DEMO_317_MSG_240");
	KeyInputWait_();
	
	//-----------------------------------------------
	//■トードー
	//「箱舟は　湖の真ん中で　半分　凍りついたまま
	//　浮かんでいるから　すぐわかるはずじゃ！
	//-----------------------------------------------
	ShowMsg_("DEMO_317_MSG_250");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	EndDemo(FADE_COLOR_BLACK);
}
