//=============================================
//
//		demo832[アロマとの別れ]
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
	local task_cam, task_player, task_aroma, task_rena, task_man, task_woman, task_base00, task_base01, task_base02;
	local efc_player, efc_rena, efc_pod00, efc_pod01, efc_pod02;

// ▼リソース読込
	// キャラクター
	local player = GetPlayerId_();						// 主人公
	local model_rena = ReadNpc_("n007");				// レナーテ
	local model_aroma = ReadNpc_("n018");				// アロマ
	local model_man = ReadNpc_("n021");					// レジスタンス♂
	local model_woman = ReadNpc_("n023");				// レジスタンス♀
	
	// エフェクト
	LoadEffect_("EF712_10_EMO_SURPRISE01");				// びっくり
	LoadEffect_("ef732_25_star_seed_base01");			// スターシードベース　完成前
	LoadEffect_("ef883_04_flying_pod01");				// フライングポッド軌跡
	LoadEffect_("ef883_05_flying_pod02");				// フライングポッド加速
	LoadEffect_("ef883_06_flying_pod03");				// フライングポッドのまぶしい光
	
	// ギミック
	local model_base = ReadGimmick_("o_effect_base");	// エフェクトベース
	local model_pod = ReadGimmick_("o_U00_02");			// 脱出ポッド
	local model_alias = ReadGimmick_("o_U00_11");		// エイリアス装置

	
// ▼配置
	// 主人公
	SetPointPos_(player, "player000");
	SetStepSe_(player, SILENT_STEP_SE);
	//レナーテ
	local rena = ArrangePointNpc_(model_rena, "npc_rena000");
	SetStepSe_(rena, SILENT_STEP_SE);
	//アロマ
	local aroma = ArrangePointNpc_(model_aroma, "npc_aroma000");
	SetStepSe_(aroma, SILENT_STEP_SE);
	
	//レジスタンス
	local man = ArrangePointNpc_(model_man, "npc_man000");					//♂
	SetStepSe_(man, SILENT_STEP_SE);
	local woman = ArrangePointNpc_(model_woman, "npc_woman000");			//♀
	SetStepSe_(woman, SILENT_STEP_SE);

	
	//ギミック
	local base00 = ArrangePointGimmick_("o_effect_base", model_base, "efc_base000");					//エフェクトベース1
	local base01 = ArrangePointGimmick_("o_effect_base", model_base, "efc_base001");					//エフェクトベース2
	local base02 = ArrangePointGimmick_("o_effect_base", model_base, "efc_base002");					//エフェクトベース3

	
	local pod00 = ArrangePointGimmick_("o_U00_02", model_pod, "obj_pod000");							//脱出ポッド３基
	local pod01 = ArrangePointGimmick_("o_U00_02", model_pod, "obj_pod001");
	local pod02 = ArrangePointGimmick_("o_U00_02", model_pod, "obj_pod002");
	SetMotion_(pod00, MOT_GIMMICK_2, BLEND_N);															//開いた状態
	SetMotion_(pod01, MOT_GIMMICK_2, BLEND_N);
	SetMotion_(pod02, MOT_GIMMICK_2, BLEND_N);
	SetManualCalcAlpha_(pod00, true);																	//α値を有効
	SetManualCalcAlpha_(pod01, true);
	SetManualCalcAlpha_(pod02, true);
	
		
// ▼非常駐モーション読込
	//主人公
	local player_look_up = ReadMotion_(player, "Player_look_up_L");								//上向き待機L
	local player_nod = ReadMotion_(player, "Player_nod");										//うなづく
	local player_left = ReadMotion_(player, "Player_look_left_L");								//左を向く
	local player_talk = ReadMotion_(player, "Player_talk");										//話す
	local player_talk_L = ReadMotion_(player, "Player_talk_L");									//話すL
	local player_nod2 = ReadMotion_(player, "Player_nod02");									//上向き頷き
	local player_walk_up = ReadMotion_(player, "Player_walk_up_L");								//上向き歩きL

	//レナーテ
	local rena_look_up = ReadMotion_(rena, "n007_look_up_L");									//上向き待機L
	local rena_talk = ReadMotion_(rena, "n007_talk01_L");										//レナ話す
	local rena_look_down_L = ReadMotion_(rena, "n007_look_right_L");							//レナ右向き待機
	local rena_nod = ReadMotion_(rena, "n007_nod");												//レナうなづく
	local rena_look_up02 = ReadMotion_(rena, "n007_look_up02_L");								//レナ上向き待機02L

	//アロマ
	local aro_look_right_L = ReadMotion_(aroma, "n018_look_right_L");							//右向き待機L
	local aro_look_left_L = ReadMotion_(aroma, "n018_look_left_L");								//左向き待機L
	local aro_look_up_L = ReadMotion_(aroma, "n018_look_up_L");									//上向き待機L
	local aro_look_down_L = ReadMotion_(aroma, "n018_look_down_L");								//下向き待機L
	local aro_stretch = ReadMotion_(aroma, "n018_stretch");										//ストレッチ
	local aro_star_L = ReadMotion_(aroma, "n018_star_seed_L");									//スターシードを持つ（話すモーションのパターン追加）
	local aro_sit_L = ReadMotion_(aroma, "n018_sit_L");											//ポッドに座るL	ポッドの椅子に座る。※ポッドと同じ座標に配置
	local aro_sit_left_L = ReadMotion_(aroma, "n018_sit_left_L");								//ポッドに座るL（左向き）
	local aro_operate_L = ReadMotion_(aroma, "n018_operation_L");								//ポッド操作L
	local aro_sit_left_nod = ReadMotion_(aroma, "n018_sit_left_nod");							//ポッドに座りうなづく
	
// ▼初期モーション
	SetMotion_(rena, rena_talk, BLEND_N);														//レナ・アロマなんか話している
	SetMotion_(aroma, aro_star_L, BLEND_N);
	
// ▼カメラ設定
	local density = GetFogDensity_();
	SetFogDensity_(5.0);
	local distmax = GetFogDistMax_();
	SetFogDistMax_(10000.0);
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------
	StartDemo(FADE_COLOR_BLACK);
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット1 脱出ポッド→移民たち移動
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	Wait_(210);
	SetMotion_(aroma, MOT_WAIT, BLEND_XL);
	Wait_(20);
	SetMotion_(rena, MOT_WAIT, BLEND_XL);					//レナ　右待機


	task_man = Task_WalkAroundToDir(man, 0, 5.7);			//移民たち移動
	WaitTask(task_man);
	task_man = Task_MoveForward_(man, 0.9, false);
//	SetMotionSpeed_(woman, 0.7); 
	task_woman = Task_WalkAroundToDir(woman, 0, 5.7);
	WaitTask(task_woman);
	task_woman = Task_MoveForward_(woman, 0.7, false);
	Wait_(20);
	MotionTalk(aroma);										//アロマなんか話す
	Wait_(40);
	
	SetMotion_(aroma, MOT_WAIT, BLEND_XL);
	
	SetMotion_(player, player_nod, BLEND_XL);				//主　うなづく
	SetMotion_(rena, rena_nod, BLEND_XL);					//レナ　うなづく
	WaitMotion(player);
	SetMotion_(player, MOT_WAIT, BLEND_XL);
	WaitMotion(rena);
	SetMotion_(rena, MOT_WAIT, BLEND_XL);	
	
	SetMotion_(man, MOT_WAIT, BLEND_N);
	SetMotion_(woman , MOT_WAIT, BLEND_N);
	DeleteTask_(task_man);
	DeleteTask_(task_woman);
	Wait_(50);
	
	task_aroma = Task_WalkAroundToDir(aroma, 90, 5.7);		//アロマ移動
	WaitTask(task_aroma);
	task_aroma = Task_MoveForward_(aroma, 0.8, false);
	
	WaitTask(task_cam);
	Wait_(30);
	//...............................................................................................................
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);				//フェードアウト
	WaitFade_();
	DeleteTask_(task_aroma);
	DeleteTask_(task_cam);	
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット2 ポッドにのりこむアロマ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetPointPos_(player, "player001");
	SetPointPos_(rena, "npc_rena001");
	SetPointPosNoFit_(aroma, "npc_aroma001");
	SetMotion_(aroma, aro_sit_left_L, BLEND_N);				//アロマ左を向く
	
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);				//フェードイン
	WaitFade_();
	//...............................................................................................................
	

	SetMotion_(aroma, aro_sit_L, BLEND_XL);
	Wait_(30);
	
	SetMotion_(aroma, aro_operate_L, BLEND_XL);
	Wait_(60);
	
	SetMotionSpeed_(pod00, 0.5);
	SetMotion_(pod00, MOT_GIMMICK_3, BLEND_L); 
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	Wait_(150);
	WaitTask(task_cam);

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット3 ポッドの中のアロマ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetMotionSpeed_(pod00, 1.0);
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	Wait_(80);
	StartEarthQuake_(90, 3.5, 0.3)
	Wait_(60);
	
	//...............................................................................................................
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);												//フェードアウト
	WaitFade_();
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット4 打ち上げポッド×3
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	
	local pod03 = ArrangePointGimmick_("o_U00_02", model_pod, "obj_pod000");				//脱出ポッド３基（飛行）
	local pod04 = ArrangePointGimmick_("o_U00_02", model_pod, "obj_pod001");
	local pod05 = ArrangePointGimmick_("o_U00_02", model_pod, "obj_pod002");
	
	SetMotion_(pod03, MOT_GIMMICK_0, BLEND_N);
	SetMotion_(pod04, MOT_GIMMICK_0, BLEND_N);
	SetMotion_(pod05, MOT_GIMMICK_0, BLEND_N);
	
	local efc_pod03 = SetSelectBoneEffect_("ef883_04_flying_pod01", base00, ATTACH_GLOBAL);	//ポッドの軌跡
	SetEffectScale_(efc_pod03, 6.0);
	local efc_pod04 = SetSelectBoneEffect_("ef883_04_flying_pod01", base01, ATTACH_GLOBAL);
	SetEffectScale_(efc_pod04, 6.0);
	local efc_pod05 = SetSelectBoneEffect_("ef883_04_flying_pod01", base02, ATTACH_GLOBAL);
	SetEffectScale_(efc_pod05, 6.0);
	
	local task_anm_player = Task_AnimeMove_(player, "anm_player000");
	SetMotion_(player, MOT_WALK, BLEND_XL);	
	local task_anm_rena = Task_AnimeMove_(rena, "anm_npc_rena000");	
	SetMotion_(rena, MOT_WALK, BLEND_XL);
	
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 60);												//フェードイン
	WaitFade_();
	//...............................................................................................................
	Wait_(60);
	SetMotion_(player, MOT_WAIT, BLEND_XL);	
	SetMotion_(rena, MOT_WAIT, BLEND_XL);
	
	WaitTask(task_cam);
	task_aroma = Task_AnimeMoveNoFit_(pod03, "anm_pod000");
	task_base00 = Task_AnimeMoveNoFit_(base00, "anm_pod000");
	Wait_(10);
	task_man = Task_AnimeMoveNoFit_(pod04, "anm_pod100");
	task_base01 = Task_AnimeMoveNoFit_(base01, "anm_pod100");
	Wait_(10);
	task_woman = Task_AnimeMoveNoFit_(pod05, "anm_pod200");
	task_base02 = Task_AnimeMoveNoFit_(base02, "anm_pod200");
	Wait_(20);
	SetMotion_(player, player_look_up, BLEND_XL);				//二人で上を向く
	SetMotion_(rena, rena_look_up, BLEND_XL);
	
	Wait_(100);

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット5 ポッドの中のアロマ２
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//...............................................................................................................
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);					//フェードアウト
	WaitFade_();
	SetMotion_(aroma, aro_sit_L, BLEND_N);
	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");
	StartEarthQuake_(-1, 130, 0.5)
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);					//フェードイン
	WaitFade_();
	//...............................................................................................................
	Wait_(10);
	SetMotion_(aroma, aro_sit_left_L, BLEND_XL);				//アロマ左を向く
	
	Wait_(30);
	SetMotion_(aroma, aro_sit_left_nod, BLEND_XL);				//アロマ頷く
	WaitMotion(aroma);
	SetMotion_(aroma, aro_sit_left_L, BLEND_XL);				//アロマ左を向く
	Wait_(30);
	SetMotion_(aroma, aro_sit_L, BLEND_XL);						//アロマ前を向く
	Wait_(80);

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット6 主　レナ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//...............................................................................................................
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);					//フェードアウト
	WaitFade_();
	SetMotion_(player, player_look_up, BLEND_N);
	StopEarthQuake_();
	task_cam = Task_AnimeMoveCamera_("anmeye005", "anmtgt005");
	
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);					//フェードイン
	WaitFade_();
	//...............................................................................................................
	SetMotion_(rena, rena_look_up02, 30);						//レナーテ手を胸にあてる。
	
	Wait_(20);
	SetMotion_(player, player_walk_up, BLEND_M);				//主　一歩前へ
	task_player = Task_MoveForward_(player, 1.0, false);
	Wait_(10);
	DeleteTask_(task_player);
	SetMotion_(player, player_look_up, BLEND_XL);
	Wait_(60);
	
	SetMotion_(player, player_nod2, BLEND_XL);					//主　うなづく
	Wait_(20);
	SetMotion_(player, player_look_up, BLEND_XL);

	Wait_(90);
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット7 去ってゆくアロマたち
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_aroma = Task_AnimeMoveNoFit_(pod03, "anm_pod001");
	task_base00 = Task_AnimeMoveNoFit_(base00, "anm_pod001");
	Wait_(5);
	task_man = Task_AnimeMoveNoFit_(pod04, "anm_pod101");
	task_base01 = Task_AnimeMoveNoFit_(base01, "anm_pod101");
	Wait_(5);
	task_woman = Task_AnimeMoveNoFit_(pod05, "anm_pod201");
	task_base02 = Task_AnimeMoveNoFit_(base02, "anm_pod201");
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");
	
	Wait_(50);
	
	local efc_kasoku1 = SetSelectBoneEffect_("ef883_05_flying_pod02", base00, ATTACH_GLOBAL);		//ポッド加速
	SetEffectScale_(efc_kasoku1, 8.5);
	Wait_(5);
	local efc_kasoku2 = SetSelectBoneEffect_("ef883_05_flying_pod02", base01, ATTACH_GLOBAL);
	SetEffectScale_(efc_kasoku2, 8.0);
	Wait_(5);
	local efc_kasoku3 = SetSelectBoneEffect_("ef883_05_flying_pod02", base02, ATTACH_GLOBAL);
	SetEffectScale_(efc_kasoku3, 9.0);
	
	WaitTask(task_cam);
	DeleteTask_(task_cam);
	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");
	Wait_(30);		
	local efc_flash1 = SetSelectBoneEffect_("ef883_06_flying_pod03", base02, ATTACH_GLOBAL);
	SetEffectScale_(efc_flash1, 10.0);																//ポッドのまぶしい光1
	SetVisible(pod05, false);
	DeleteEffectEmitter_(efc_pod05);
	Wait_(10);
	
	local efc_flash2 = SetSelectBoneEffect_("ef883_06_flying_pod03", base01, ATTACH_GLOBAL);
	SetEffectScale_(efc_flash2, 8.0);
	SetVisible(pod04, false);
	DeleteEffectEmitter_(efc_pod04);
	Wait_(5);
	
	local efc_flash3 = SetSelectBoneEffect_("ef883_06_flying_pod03", base00, ATTACH_GLOBAL);
	SetEffectScale_(efc_flash3, 7.0);
	SetVisible(pod03, false);
	DeleteEffectEmitter_(efc_pod03);
	Wait_(10);
	
	local efc_flash1 = SetSelectBoneEffect_("ef883_06_flying_pod03", base02, ATTACH_GLOBAL);
	SetEffectScale_(efc_flash1, 6.0);
	Wait_(10);
	
	local efc_flash2 = SetSelectBoneEffect_("ef883_06_flying_pod03", base01, ATTACH_GLOBAL);
	SetEffectScale_(efc_flash2, 8.0);
	Wait_(5);
		
	local efc_flash3 = SetSelectBoneEffect_("ef883_06_flying_pod03", base02, ATTACH_GLOBAL);
	SetEffectScale_(efc_flash3, 7.0);
	Wait_(10);

	local efc_flash1 = SetSelectBoneEffect_("ef883_06_flying_pod03", base00, ATTACH_GLOBAL);
	SetEffectScale_(efc_flash1, 6.0);
	Wait_(5);

	local efc_flash2 = SetSelectBoneEffect_("ef883_06_flying_pod03", base01, ATTACH_GLOBAL);
	SetEffectScale_(efc_flash2, 3.0);
	Wait_(5);

	local efc_flash3 = SetSelectBoneEffect_("ef883_06_flying_pod03", base02, ATTACH_GLOBAL);
	SetEffectScale_(efc_flash3, 2.0);
	
	Wait_(30);
	SetMotion_(rena, MOT_WALK, BLEND_M);											//レナ　一歩前へ
	task_rena = Task_MoveForward_(rena, 0.5, false);
	Wait_(25);
	DeleteTask_(task_rena);
	SetMotion_(rena, rena_look_up, BLEND_L);
	
	Wait_(140);
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);
	Wait_(50);
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 10);
	LoadLayout_("fin");																//レイアウト読み込み
	SetLayoutAnime_("fin_in", false);												//fin
	Wait_(110);																		//Fの文字が表示されるタイミング
	PlaySE_("SE_DEM_231");
	WaitLayoutAnime();

//	EndDemo(FADE_COLOR_BLACK);
	EndDemoBgmFade_(FADE_DEF);
	
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
	SetFogDensity_(density);
	SetFogDistMax_(distmax);
	DeleteAllTask_();
	SetSepiaColor_(false);
	End_();
}
