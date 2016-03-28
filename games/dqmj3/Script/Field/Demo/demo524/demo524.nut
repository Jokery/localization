//=============================================
//
//		demo524[プロメテウス戦勝利]
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
	local task_cam, task_player, task_rena, task_dark, task_birdy, task_pro;
	local efc_player, efc_rena, efc_dark, efc_birdy, efc_pro, efc_cam, efc_fire;
	
// ▼フラグ設定
	local bit_ruler = GetEventFlg_("BFG_RULER_ADD_023");	// Bit_223  ルーラ追加フラグ 焦熱の火山　秘密基地　地下施設
	
// ▼リソース読込
	// キャラクター
	local player = GetPlayerId_();						// 主人公
	local model_rena = ReadNpc_("n007");				// レナーテ
	local model_birdy = ReadNpc_("n019");				// バーディ
	local model_pro = ReadNpc_("m190_00");				// プロメテウス
	local model_dark = ReadNpc_("n008"); 				// ダークマスター
	local model_boy = ReadNpc_("n040"); 				// こども主人公
	
	// ギミック
	local model_cold = ReadGimmick_("o_V02_10");			// コールドスリープ装置
	local model_cpu = ReadGimmick_("o_V02_11");				// コンピュータの明滅
	local model_cold_player = ReadGimmick_("o_V02_12");		// コールドスリープ_主人公
	local model_light = ReadGimmick_("o_V02_13");			// コールドスリープ明滅
	local model_ruler = ReadGimmick_("o_com_08");			// ルーラポイント
	local model_door = ReadGimmick_("o_V02_09");			// 扉
	local model_door01 = ReadGimmick_("o_V02_02");			// エレベーター扉
	
	// エフェクト設定
	LoadEffect_("ef733_01_sym_shuchusen01");			// 集中線
	LoadEffect_("ef721_03_nat_smoke_n03");				// 煙
	LoadEffect_("ef741_01_div_nor_death");				// プロメテウス死亡エフェクト
	LoadEffect_("ef852_04_rura_dm01");					// ダークマスターのルーラ（発動前）
	LoadEffect_("ef852_05_rura_dm02");					// ダークマスターのルーラ（発動後）
	
// ▼配置
	//キャラクター
	SetPointPos_(player, "player000");										// 主人公
	
	local rena = ArrangePointNpc_(model_rena, "npc_renerte000");			// レナーテ

	local dark = ArrangePointNpc_(model_dark, "npc_dark000");				// ダークマスター
	
	local birdy = ArrangePointNpc_(model_birdy, "npc_birdy000");			// バーディ
	SetScaleSilhouette(birdy, SCALE.N, SILHOUETTE_WIDTH.N);					// サイズN

	local pro = ArrangePointNpc_(model_pro, "npc_pro000");					// プロメテウス
	SetScaleSilhouette(pro, SCALE.M, SILHOUETTE_WIDTH.M);					// サイズM
	
	local boy = ArrangePointNpc_(model_boy, "npc_boy000");					// こども主人公（コールドスリープの中に配置）
	//ギミック
	local cold_player = ArrangePointGimmick_("o_V02_10", model_cold_player, "obj_cold_player000");		//コールドスリープ主人公
	
	local cold_cpu = ArrangePointGimmick_("o_V02_11", model_cpu, "obj_cpu000");					//コンピュータの明滅
	local cold_light = ArrangePointGimmick_("o_V02_13", model_light, "obj_light000");			//コールドスリープ明滅

	// ルーラポイント
	local ruler = ArrangePointGimmick_("o_com_08", model_ruler, "obj_ruler000");
	// ▽ルーラポイントが既に起動していた場合
	if (bit_ruler) { SetMotion_(ruler, MOT_GIMMICK_2, BLEND_N); }
	
	// 扉
	local door = ArrangePointGimmick_("o_V02_09", model_door, "obj_door000");
	// エレベーター扉
	local door01 = ArrangePointGimmick_("o_V02_02", model_door01, "obj_door001");
	SetMotion_(door01, MOT_GIMMICK_0, BLEND_N);			// 閉じる
	
// ▼非常駐モーション読込
	//主人公
	local player_caution01 = ReadMotion_(player, "Player_caution01_L");				// 警戒
	local player_battle_L = ReadMotion_(player, "Player_battle_L");					// 戦闘待機
	local player_battle_look_up_L = ReadMotion_(player, "Player_battle01_L");		// 戦闘待機（顔上向き）
	
	//レナーテ
	local rena_talk = ReadMotion_(rena, "n007_talk01");								// 会話開始（手を胸にあてる）
	local rena_talk_L = ReadMotion_(rena, "n007_talk01_L");							// 会話L（手を胸にあてる）
	local rena_turn_left = ReadMotion_(rena, "n007_turn_left");						// 待機→振り返る（左向き）
	local rena_turn_left_L = ReadMotion_(rena, "n007_turn_left_L");					// 振り返るL（左向き）
	local rena_attack = ReadMotion_(rena, "n007_attack");							// 攻撃
	local rena_attack_L = ReadMotion_(rena, "n007_attack_L");						// 攻撃L
	local rena_run_L = ReadMotion_(rena, "n007_run_L");								// 走るL
	local rena_look_down = ReadMotion_(rena, "n007_look_down_L");					// うつむき待機
	local rena_caution = ReadMotion_(rena, "n007_caution_L");						// 警戒L

	//バーディ
	local birdy_idol = ReadMotion_(birdy, "n019_idol");								// 待機L

	//ダークマスター
	local dark_sup = ReadMotion_(dark, "n008_surprise_L");							// 驚きL
	local dark_stagger = ReadMotion_(dark, "n008_stagger_L");						// 傷つき歩く
	local dark_totter = ReadMotion_(dark, "n008_totter_L");							// よろよろ

	//プロメテウス
	local pro_die = ReadMotion_(pro, "m190_00_die");								// プロメテウス死亡
	
	//こども主人公
	local boy_sleep = ReadMotion_(boy, "n010_cold_sleep_L");						// コールドスリープ用モーション
	SetMotion_(boy, boy_sleep, BLEND_N);
	SetFace_(boy, "Face_loop_close02");

// ▼初期モーション
	SetMotion_(player, player_battle_look_up_L, BLEND_N);							//主　戦闘待機上向き
	SetMotion_(birdy, birdy_idol, BLEND_N);											//鳥　待機
	SetMotion_(rena, rena_caution, BLEND_N);										//レナ　警戒
	
// ▼レイアウト
	LoadLayout_("black");
	
//足音
	SetStepSe_(rena, "SE_FLD_016");

// ▼カメラ設定

	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------
	SetVisible(player, false);
	SetVisible(dark, false);
	
	StartDemo(FADE_COLOR_BLACK);

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット1 咆哮をあげ、倒れるプロメテウス
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	PlaySE_("SE_DEM_136");															//■SE:プロメテウス死亡
	
	SetMotion_(pro, pro_die, BLEND_M);												//死亡モーション
	
	local task_pro_step = Task_ChangeStepSe(pro, "SE_FLD_033", 12);					//プロメテウス足音	
	Wait_(25);
	DeleteTaskStepSe(pro, task_pro_step);
	
	Wait_(70);

//	PlaySE_("SE_DEM_015");															//倒れるSE

	Wait_(25);
	StartDecayEarthQuake_(25, 4, 2)													//地震
	Wait_(5);	
	efc_pro = SetSelectBoneEffect_("ef721_03_nat_smoke_n03", pro, ATTACH_GLOBAL);	//煙
	SetEffectScale_(efc_pro, 2.5);

	Wait_(35);	
	
	efc_pro = SetSelectBoneEffect_("ef741_01_div_nor_death", pro, ATTACH_GLOBAL);	//死亡ef
	SetEffectScale_(efc_pro, 3.0);
	PlaySE_("SE_DEM_010");															//死亡SE
	
	Task_ObjectFadeOut_(pro, 30);													// 30フレームでフェードアウトします
	
	Wait_(60);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット2 主人公を睨み付けるダークマスター
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetVisible(dark, true);
	SetVisible(player, true);
	SetDir_(dark, 0);

	SetMotion_(dark, dark_sup, BLEND_N);											//ダーク　驚き

	task_cam = Task_AnimeMoveCamera_("anmeye006", "anmtgt006");
	PlaySE_("SE_DEM_026");	// ■SE:集中線
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", 100);							//集中線
	
	//===============================================
	//*ダークマスター
	// 	「バ……バカな！？
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_DARKMASTER");
	ShowMsg_("DEMO_524_MSG_010");
	KeyInputWait_();
	//===============================================
	DeleteEffectEmitter_(efc_cam);
	task_cam = Task_AnimeMoveCamera_("anmeye005", "anmtgt005");						//振り向きに合わせてズームアウト
	Wait_(10);
	SetMotion_(dark, MOT_WALK, BLEND_L);
	task_dark = Task_RotateToPos_(dark, GetPos_(rena), 5.7);
	WaitTask(task_dark);
	SetMotion_(dark, MOT_WAIT, BLEND_L);
	
	Wait_(15);
	//===============================================
	//*ダークマスター
	// 	「わからぬ……なぜだ？
	//-----------------------------------------------
	ShowMsg_("DEMO_524_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	WaitTask(task_cam);
	Wait_(10);
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット3 主人公、レナーテ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetMotion_(player, player_caution01, BLEND_N);							//主　警戒
	

	SetMotion_(rena, MOT_WALK, BLEND_N);									//レナ　歩く
	Wait_(15);
	
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	local task_rena_step = Task_ChangeStepSe(rena, "SE_FLD_016", 6);		//レナ足音

	task_rena = Task_MoveForward_(rena, 1.0, false);
	Wait_(15);
	DeleteTaskStepSe(rena, task_rena_step);

	SetMotion_(rena, MOT_WAIT, BLEND_L);									//レナ　待機
	DeleteTask_(task_rena);

	Wait_(10);

	//===============================================
	//*レナーテ
	// 	「あなたには　わからない。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_524_MSG_030");
	
	SetMotion_(rena, rena_talk, BLEND_L);									//レナ　会話
	WaitMotion(rena);
	SetMotion_(rena, rena_talk_L, BLEND_M);									//レナ　会話L
	
	KeyInputWait_();
	//===============================================	
		
	//===============================================
	//*レナーテ
	// 	「そして　絶望さえも乗りこえる
	//-----------------------------------------------
	ShowMsg_("DEMO_524_MSG_040");
	
	SetMotion_(rena, rena_attack, BLEND_XL);									//レナ　攻撃
	WaitMotion(rena);
	SetMotion_(rena, rena_attack_L, BLEND_XL);								//レナ　攻撃L
	
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	Wait_(30);
	WaitTask(task_cam);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット4 主人公、レナーテ、DM
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	DeleteTask_(task_cam);
	SetPointPos_(rena, "npc_renerte001");									//レナ移動
	SetDirToObject_(player, dark);
	SetDirToObject_(birdy, dark);
	
	SetMotion_(rena, MOT_WAIT, BLEND_L);									//レナ　待機

	Wait_(10);

	SetMotion_(dark, MOT_TALK, BLEND_L);												//ダクマス話す
	WaitMotion(dark);
	SetMotion_(dark, MOT_TALKLOOP, BLEND_M);											//ダクマス話す
	//===============================================
	//*ダークマスター
	// 	「……なんたる失態だ！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_DARKMASTER");
	ShowMsg_("DEMO_524_MSG_050");
	KeyInputWait_();
	//-----------------------------------------------
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
		
//	local SE_VOL = PlaySE_("SE_DEM_137");															//■SE:ダークマスター逃亡
	StopBgm_(75);
	//-----------------------------------------------
	//*ダークマスター
	// 	「雪辱を果たすのは　次の機会としよう。
	//-----------------------------------------------
	ShowMsg_("DEMO_524_MSG_070");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
//	WaitSe_(SE_VOL);				//※ここの部分をSEの再生終了待ちに変える

	SetMotion_(dark, MOT_WAIT, BLEND_XL);											//ダクマス待機
	PlaySE_("SE_DEM_137");
	efc_dark = SetSelectBoneEffect_("ef852_04_rura_dm01", dark, ATTACH_GLOBAL);		//ダークルーラ発動前
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット6 DMルーラ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	
	
	PlaySE_("SE_DEM_139");															//■SE:ダークマスターが去る
	Wait_(60);
	DeleteEffectEmitter_(efc_dark);
	Wait_(5);
	efc_dark = SetSelectBoneEffect_("ef852_05_rura_dm02", dark, ATTACH_GLOBAL);		//ダークルーラ発動後
	Wait_(10);

	//===============================================
	//白フラッシュのようなフェードアウト
	SetFade_(FADE_OUT, FADE_COLOR_WHITE, 10);
	Task_ObjectFadeOut_(dark, 20);													// 20フレームでフェードアウトします

	SetMotion_(rena, rena_caution, BLEND_L);										//レナ　警戒
	SetMotion_(player, player_caution01, BLEND_L);									//主　警戒

	efc_dark = SetSelectBoneEffect_("ef852_05_rura_dm02", dark, ATTACH_GLOBAL);		//ダークルーラ発動後	
	Wait_(15);
	task_cam = Task_AnimeMoveCamera_("anmeye007", "anmtgt007");
	SetFade_(FADE_IN, FADE_COLOR_WHITE, 30);
	//===============================================
	Wait_(50);

	SetLayoutAnime_("fade_in", false);										//黒半透明
	Wait_(30);
	SetLayoutAnime_("loop", false);
	
	//===============================================
	//*ダークマスター
	// 	「フハハハ……！
	//-----------------------------------------------
	ShowScreenMessage_("DEMO_524_MSG_080", false);
	//===============================================
	WaitTask(task_cam);
	SetLayoutAnime_("fade_out", false);										//黒半透明解除
	Wait_(20);

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット7 レナーテアップ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetVisible(player, false);
	SetVisible(birdy, false);
	
	local task_rena_step = Task_ChangeStepSe(rena, "SE_FLD_016", 5);		//レナ足音

	SetPointPos_(rena, "npc_renerte003");									//レナ移動
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");
//	DeleteTaskStepSe(player, task_player_step);
	
	DeleteTaskStepSe(rena, task_rena_step);

	SetMotion_(rena, MOT_WAIT, BLEND_XL);									//レナ　待機

	WaitTask(task_cam);

	SetMotion_(rena, rena_look_down, BLEND_XL);								//レナ　うつむき待機
	SetFace_(rena, "Face_loop_close");										//目閉じ

	//===============================================
	//*レナーテ
	// 	「……　決戦のときは　近い……か。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_524_MSG_090");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	Wait_(20);

	//～～～～～～～～～～～～～～～黒フェード～～～～～～～～～～～～～～～～～
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);										//フェードアウト
	WaitFade_();
	
	SetStepSe_(rena, "SE_FLD_016");
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット8 本体の前にて
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetVisible(player, true);
	SetVisible(birdy, true);
	SetPointPos_(player, "player002");										//主　移動
	SetPointPos_(rena, "npc_renerte004");									//レナ移動
	SetPointPos_(birdy, "npc_birdy001");									//鳥　移動

	SetMotion_(player, MOT_WAIT, BLEND_N);									//主　待機
	SetMotion_(rena, MOT_WAIT, BLEND_N);									//レナ　待機
	SetFace_(rena, "Face_default");											//目開け

	SetPointCameraEye_("cameye004");
	SetPointCameraTarget_("camtgt004");
	
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);										//フェードイン
	
	//～～～～～～～～～～～～～～～黒フェード～～～～～～～～～～～～～～～～～
	SetMotion_(rena, rena_run_L, BLEND_M);									//レナ　走る

	SetMotion_(rena, MOT_WALK, BLEND_N);									//レナ　歩く
	task_rena = Task_MoveForward_(rena, 0.8, false);
	Wait_(65);
	SetMotion_(rena, MOT_WAIT, BLEND_L);									//レナ　待機
	DeleteTask_(task_rena);
	
	//===============================================
	//*レナーテ
	// 	「<name_player/>……あなたは今
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_524_MSG_100");
	KeyInputWait_();
	CloseMsgWnd_();
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット9 本体とレナーテ（カット8とつなげる）
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");

	Wait_(55);
	SetMotionSpeed_(rena, 0.8);													// モーションがゆっくりになる
	SetMotion_(rena, rena_turn_left, BLEND_XL);									//レナーテ振り向く

	task_rena = Task_RotateToPos_(rena, GetPos_(player), 3);
	Wait_(10);
	DeleteTask_(task_rena);
	WaitMotion(rena);
	SetMotion_(rena, rena_turn_left_L, BLEND_L);
	Wait_(20);

	//===============================================
	//*レナーテ
	// 	「そして　もうひとつ……この装置に記録された
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_524_MSG_110");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================	
	Wait_(10);
	EndDemo(FADE_COLOR_BLACK);
}
