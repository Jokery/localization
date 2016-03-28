//=============================================
//
//		demo613[ガルビルスの暴走_1]
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
	local task_cam, task_rena, task_antibody, task_grbrs, task_rena_step;
	local efc_cam, efc_player, efc_rena, efc_rena2, efc_mist, efc_field, efc_grbrs, efc_cough;
	local efc_pollen00, efc_pollen01, efc_pollen02, efc_pollen03, efc_pollen04;
	local frame_sum = 0;		// 総フレーム数

// ▼リソース読込
	// ギミック
	local model_mother = ReadGimmick_("o_C03_02");		// マザー
	local model_decoration = ReadGimmick_("o_C03_03");	// マザー飾り
	// キャラクター
	local player = GetPlayerId_();						// 主人公
	local model_rena = ReadNpc_("n007");				// レナーテ
	local model_grbrs = ReadNpc_("m184_00");			// ガルビルス
	// エフェクト
	LoadEffect_("ef712_10_emo_surprise01");				// 「！」
	LoadEffect_("ef733_01_sym_shuchusen01");					// 集中線
	LoadEffect_("ef721_03_nat_smoke_n03");				// 煙
	LoadEffect_("ef733_04_sym_pollen_mist");			// 黒い靄
	LoadEffect_("ef731_02_mag_dark_pollen_field");		// 黒花粉フィールド
	LoadEffect_("ef731_03_mag_boss_pollen01");			// 黒花粉　小
	LoadEffect_("ef731_04_mag_boss_pollen02");			// 黒花粉　中
	LoadEffect_("ef731_05_mag_boss_pollen03");			// 黒花粉　大
	LoadEffect_("ef710_05_cha_light_ren");				// レナーテの光
	LoadEffect_("ef732_07_teleport_monolith");			// 転送エフェクト

	LoadEffect_("ef861_10_galvirus_fusion01");			// ガルビルス融合演出 咳				45f	Up_Mouth2にアタッチ
	LoadEffect_("ef861_11_galvirus_fusion02");			// ガルビルス融合演出 粉噴き			INF	Effect2にアタッチ
	LoadEffect_("ef861_12_galvirus_fusion03");			// ガルビルス融合演出 粉噴き(はげしい)	INF	Effect2にアタッチ
	LoadEffect_("ef861_13_galvirus_fusion04");			// ガルビルス融合演出 コアの周りの花粉	INF
	LoadEffect_("ef861_14_galvirus_fusion05");			// ガルビルス融合演出 コアの周りの花粉	INF

// ▼配置
	// マザー
	local mother = ArrangePointGimmick_("o_C03_02", model_mother, "obj_mothier000");
	local decoration = ArrangePointGimmick_("o_C03_03", model_decoration, "obj_mothier000");
	// 主人公
	SetPointPos_(player, "player000");
	// レナーテ
	local rena = ArrangePointNpc_(model_rena, "npc_rena000");
	// ガルビルス
	local grbrs = ArrangePointNpc_(model_grbrs, "npc_grbrs000");
	SetScaleSilhouette(grbrs, SCALE.G, SILHOUETTE_WIDTH.G);

// ▼非常駐モーション読込
	// 主人公
	local player_caution01_L = ReadMotion_(player, "Player_caution01_L");	// 警戒L
	local player_guard = ReadMotion_(player, "Player_guard");				// 警戒→身構える
	local player_guard_L = ReadMotion_(player, "Player_guard_L");			// 身構えるL
	local player_look_right_L = ReadMotion_(player, "Player_look_right_L");	// 右を向く
	local player_battle_L = ReadMotion_(player, "Player_battle_L");			// 戦闘待機L
	local player_battle01_L = ReadMotion_(player, "Player_battle01_L");		// 戦闘待機（顔上向き）L

	// レナーテ
	local rena_look_left_L = ReadMotion_(rena, "n007_look_left_L");			// 左を向くL
	local rena_look_up_L = ReadMotion_(rena, "n007_look_up_L");				// 上を向くL
	local rena_run_L = ReadMotion_(rena, "n007_run_L");						// 走るL
	local rena_caution_L = ReadMotion_(rena, "n007_caution_L");				// 警戒L
	local rena_look_down_L = ReadMotion_(rena, "n007_look_down_L");			// うつむき待機L(詠唱の代わり)
	local rena_attack_start = ReadMotion_(rena, "n007_attack_start");		// 待機→攻撃開始(詠唱の代わり)
	local rena_attack_start_L = ReadMotion_(rena, "n007_attack_start_L");	// 攻撃開始L

	// ガルビルス
	local grbrs_shout = ReadMotion_(grbrs, "m184_00_shout");				// 待機→咆哮→待機
	local grbrs_damage = ReadMotion_(grbrs, "m184_00_damage");				// 待機→負傷
	local grbrs_damage_L = ReadMotion_(grbrs, "m184_00_damage_L");			// 負傷L
	local grbrs_reach = ReadMotion_(grbrs, "m184_00_reach_for_mother");		// 負傷→マザー手を伸ばす
	local grbrs_reach_L = ReadMotion_(grbrs, "m184_00_reach_for_mother_L");	// マザーに手を伸ばすL
	
//足音
	SetStepSe_(rena, "SE_FLD_016");
	
// ▼カメラ設定
	task_cam = Task_AnimeMoveCamera_("anmeye005", "anmtgt005");

// ▼初期モーション
	SetMotion_(rena, rena_caution_L, BLEND_N); 								// レナ　構え
	SetMotion_(player, player_battle01_L, BLEND_N); 						// 主　戦闘待機 顔上げ
	
//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット1 ガル　アップ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	SetMotion_(grbrs, grbrs_damage, BLEND_M); 												// ガルビルス負傷
	PlaySE_("SE_DEM_156");
	Wait_(30.5);
	
	efc_cough = SetSelectBoneEffectSetBoneName_("ef861_10_galvirus_fusion01", grbrs, "Up_Mouth2", Vec3(0.0, -3.0, 0.0));		// 咳
	SetEffectScale_(efc_cough, 1.3);
	Wait_(30);

	StartDecayEarthQuake_(30, 6, 8)															// 地震
	efc_grbrs = SetSelectBoneEffect_("ef721_03_nat_smoke_n03", grbrs, ATTACH_GLOBAL);		// 煙
	SetEffectScale_(efc_grbrs, 2.5);

	efc_cough = SetSelectBoneEffectSetBoneName_("ef861_10_galvirus_fusion01", grbrs, "Up_Mouth2", Vec3(0.0, -10.0, 0.0));		// 咳
	SetEffectScale_(efc_cough, 2.0);
	
	WaitMotion(grbrs);
	SetMotion_(grbrs, grbrs_damage_L, BLEND_L); 											// ガルビルス負傷L
	
	WaitTask(task_cam);
	
	Wait_(30);
	
	//===============================================
	// ■ガルビルス
	// 「ま……まさか　またモンスターマスターに……
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_GARUBIRUSU");
	ShowMsg_("DEMO_613_MSG_010");
	efc_cough = SetSelectBoneEffectSetBoneName_("ef861_10_galvirus_fusion01", grbrs, "Up_Mouth2", Vec3(0.0, -3.0, 3.0));		// 咳
	SetEffectScale_(efc_cough, 1.3);
	KeyInputWait_();
	
	//===============================================
	
	//===============================================
	// ■ガルビルス
	// 「ちくしょう……ちくしょう！
	//-----------------------------------------------
	ShowMsg_("DEMO_613_MSG_020");
	efc_cough = SetSelectBoneEffectSetBoneName_("ef861_10_galvirus_fusion01", grbrs, "Up_Mouth2", Vec3(0.0, -2.0, 3.0));		//咳
	SetEffectScale_(efc_cough, 1.5);
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット2 コアに手を伸ばすガル
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetDir_(grbrs, 180);
	
	// カメラ回り込む
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	efc_cough = SetSelectBoneEffectSetBoneName_("ef861_10_galvirus_fusion01", grbrs, "Up_Mouth2", Vec3(0.0, -5.0, 3.0));		// 咳
	PlaySE_("SE_DEM_157");													// 倒れるSE
	
	SetEffectScale_(efc_cough, 1.3);

	Wait_(20);
	efc_cough = SetSelectBoneEffectSetBoneName_("ef861_10_galvirus_fusion01", grbrs, "Up_Mouth2", Vec3(0.0, -5.0, 3.0));		// 咳
	SetEffectScale_(efc_cough, 1.1);
	
	Wait_(70);

	SetMotion_(grbrs, grbrs_reach, BLEND_L); 								// ガル　負傷→手を伸ばす
	Wait_(25);	
	efc_cough = SetSelectBoneEffectSetBoneName_("ef861_10_galvirus_fusion01", grbrs, "Up_Mouth2", Vec3(0.0, -5.0, 0.0));		// 咳
	SetEffectScale_(efc_cough, 1.3);
	
	Wait_(50);
	StartDecayEarthQuake_(16, 8, 4)															//地震
	efc_grbrs = SetSelectBoneEffectSetOffset_("ef721_03_nat_smoke_n03", grbrs, ATTACH_GLOBAL, Vec3(-25.0, 0.0, 0.0));			// 煙
	SetEffectScale_(efc_grbrs, 1.5);
	efc_cough = SetSelectBoneEffectSetBoneName_("ef861_10_galvirus_fusion01", grbrs, "Up_Mouth2", Vec3(0.0, -2.0, 0.0));		// 咳
	SetEffectScale_(efc_cough, 3.0);
	
	WaitMotion(grbrs);
	SetMotion_(grbrs, grbrs_reach_L, BLEND_L); 								//ガル　負傷→手を伸ばす
	
	Wait_(10);
	efc_cough = SetSelectBoneEffectSetBoneName_("ef861_10_galvirus_fusion01", grbrs, "Up_Mouth2", Vec3(0.0, -4.0, 0.0));		// 咳
	SetEffectScale_(efc_cough, 1.0);
	
	Wait_(20);
	efc_cough = SetSelectBoneEffectSetBoneName_("ef861_10_galvirus_fusion01", grbrs, "Up_Mouth2", Vec3(0.0, -6.0, 0.0));		// 咳
	SetEffectScale_(efc_cough, 1.8);
	
	WaitTask(task_cam);
	Wait_(30);
	
	//〓〓〓〓〓〓〓〓〓〓
	//■カット3 ガル　アップ
	//〓〓〓〓〓〓〓〓〓〓
	SetScaleSilhouette(grbrs, SCALE.G, 0.6);												// シルエット変更
	
	task_cam = Task_AnimeMoveCamera_("anmeye006", "anmtgt006");
	PlaySE_("SE_DEM_026");	// ■SE:集中線
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", 100);									// 集中線
	
	WaitTask(task_cam);
	efc_pollen00 = SetSelectBoneEffectSetOffset_("ef861_11_galvirus_fusion02", grbrs, ATTACH_EFFECT2, Vec3(-10.0, 0.0, 0.0));		// 花粉吹き出し
	SetEffectScale_(efc_pollen00, 2.0);
	
	//===============================================
	// ■ガルビルス
	// 「いやだ！　負けたくない！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_GARUBIRUSU");
	ShowMsg_("DEMO_613_MSG_030");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	// ■ガルビルス
	// 「もう　どうなっても　構うもんか！
	//-----------------------------------------------
	ShowMsg_("DEMO_613_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	DeleteEffect_(efc_cam);
	SetScaleSilhouette(grbrs, SCALE.G, SILHOUETTE_WIDTH.G);
	
	//〓〓〓〓〓〓〓〓〓〓〓
	//■カット4 花粉噴出
	//〓〓〓〓〓〓〓〓〓〓〓	
	// カメラ　早めにズームアウト
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	PlaySE_("SE_DEM_182");
	
	Wait_(30);
	DeleteEffectEmitter_(efc_pollen00); 
	
	WaitTask(task_cam);
	
	//===============================================
	// ■ガルビルス
	// 「何もかも　吸収して　誰よりも強く……
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_GARUBIRUSU");
	ShowMsg_("DEMO_613_MSG_050");
	efc_pollen01 = SetSelectBoneEffectSetOffset_("ef861_12_galvirus_fusion03", grbrs, ATTACH_EFFECT2, Vec3(-10.0, 0.0, 0.0));		//花粉吹き出し
	SetEffectScale_(efc_pollen01, 2.0);
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	Wait_(40);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット5 主人公に駆け寄るレナ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	
	SetPointPos_(player, "player001");

	local task_rena_step = Task_ChangeStepSe(rena, "SE_FLD_016", 1);
	PlaySE_("SE_DEM_158");
	
	SetPointPos_(rena, "npc_rena001");
	SetMotion_(rena, rena_run_L, BLEND_N); 							// レナ　走る
	
	SetDirToObject_(rena, player);
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");
	
	task_rena = Task_MoveForward_(rena, 1.0, true);					// レナ　駆け寄る
	Wait_(3);
	SetMotion_(rena, MOT_WAIT, BLEND_L);							// レナ　待機
	DeleteTask_(task_rena);
	DeleteTaskStepSe(rena, task_rena_step);
	Wait_(20);
	
	SetMotion_(rena, rena_attack_start, BLEND_L);					// レナ　攻撃開始（詠唱の代わり）
	WaitMotion(rena); 
	
	SetMotion_(rena, rena_attack_start_L, BLEND_L);					// レナ　攻撃開始
	
	Wait_(20);
	SetFace_(rena, "Face_loop_close");
	
	SetMotion_(player, player_look_right_L, BLEND_XL);				// 主　右を向く
	Wait_(30);
	
	PlaySE_("SE_DEM_183");
	efc_rena = SetSelectBoneEffectSetOffset_("ef710_05_cha_light_ren", rena, ATTACH_GLOBAL, Vec3(-11.0, 25.0, 0.0));			// 主　レナ　ワープの光
	SetEffectScale_(efc_rena, 2.3);
	Wait_(20);

	
	Task_ObjectFadeOut_(rena, 20);															// 20フレームでフェードアウトします
	Task_ObjectFadeOut_(player, 20);														// 20フレームでフェードアウトします
	Wait_(5);

	efc_player = SetSelectBoneEffectSetOffset_("ef732_07_teleport_monolith", player, ATTACH_GLOBAL, Vec3(0.0, 0.0, 0.0));
	efc_rena2 = SetSelectBoneEffectSetOffset_("ef732_07_teleport_monolith", rena, ATTACH_GLOBAL, Vec3(0.0, 0.0, 0.0));
	DeleteEffectEmitter_(efc_rena);
	
	WaitTask(task_cam);
	Wait_(100);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット6 花粉に覆われるコア
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	DeleteEffectEmitter_(efc_pollen01); 

	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");

	efc_mist = SetCameraEffect_("ef733_04_sym_pollen_mist", 100);			// ブラックミスト
	ChangeColorTone_(2.0, 0.0, 4.0, 50);									// 色調補正「紫」

	efc_pollen03 = SetPointWorldEffect_("ef861_13_galvirus_fusion04", "obj_mothier000");
	
	WaitTask(task_cam);
	Wait_(60);
	EndDemo(FADE_COLOR_BLACK);
}
