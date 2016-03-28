//=============================================
//
//		demo318[希望の正体_1]
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
	local task_cam, task_player, task_aza, task_reactor;						// タスク関係の変数
	local efc_cam, efc_player, efc_aza01, efc_aza02;							// エフェクト関係の変数1
	local efc_reactor01, efc_reactor02, efc_attack, efc_smoke01, efc_smoke02;	// エフェクト関係の変数2

// ▼フラグ設定
	local bit_ruler = GetEventFlg_("BFG_RULER_ADD_016");						// Bit_216 ルーラ追加フラグ

// ▼リソース読込
	// キャラクター
	local player = GetPlayerId_();
	local model_azamuku = ReadNpc_("m204_00")								// 狡猾王アーザムーク
	// ギミック
	local model_reactor = ReadGimmick_("o_dem_15");							// 旧式リアクター
	local model_tenmetu = ReadGimmick_("o_I02_16");							// 制御装置の点滅
	local model_display = ReadGimmick_("o_I02_17");							// ディスプレイ画面
	local model_daiza = ReadGimmick_("o_I02_19");							// リアクター台座
	local model_ruler = ReadGimmick_("o_com_08");							// ルーラポイント
	//エフェクト
	LoadEffect_("ef730_01_oth_dark_aura01");								// まがまがしいオーラ
	LoadEffect_("ef732_09_light_reactor_c");								// リアクター発光
	LoadEffect_("ef733_01_sym_shuchusen01");								// 集中線
	LoadEffect_("ef723_01_nat_explosion_n01");								// 爆発
	LoadEffect_("ef831_01_atc_yetas");										// 黒い攻撃
	LoadEffect_("ef721_04_nat_smoke_psps");									// 煙ぷすぷす（電流あり）
	//レイアウト
	LoadLayout_("black");

// ▼配置
	// 主人公
	SetPointPos_(player, "player000");
	
	// アーザムーク
	local azamuku = ArrangePointNpc_(model_azamuku, "npc_azamuku000");
	SetScaleSilhouette(azamuku, SCALE.AZAMUKU, SILHOUETTE_WIDTH.S);
	
	// ディスプレイ画面
	local display = ArrangePointGimmick_("o_I02_17", model_display, "obj_display000");
	SetManualCalcAlpha_(display, true);
	SetAlpha_(display, ALPHA_CLEAR);
	
	// 制御装置の点滅
	local tenmetu = ArrangePointGimmick_("o_I02_16", model_tenmetu, "obj_tenmetu000");
	
	// 旧式リアクター
	local reactor = ArrangePointGimmick_("o_dem_15", model_reactor, "obj_reactor000");
	SetMotion_(reactor, MOT_GIMMICK_0, BLEND_N);
	
	// リアクター台座
	local daiza = ArrangePointGimmick_("o_I02_19", model_daiza, "obj_daiza000");
	SetMotion_(daiza, MOT_GIMMICK_0, BLEND_N);
	
	// ルーラポイント
	local ruler = ArrangePointGimmick_("o_com_08", model_ruler, "obj_ruler000");
	// ▽ルーラポイントが既に起動していた場合
	if (bit_ruler) { SetMotion_(ruler, MOT_GIMMICK_2, BLEND_N); }

// ▼非常駐モーション読込
	// 主人公
	local pl_walk02_L = ReadMotion_(player, "Player_walk02_L");				// 中腰で歩く
	local pl_caution01_L = ReadMotion_(player, "Player_caution01_L");		// 警戒L
	local pl_battle_run = ReadMotion_(player, "Player_run_battle");			// 走る→戦闘待機
	local pl_battle_L = ReadMotion_(player, "Player_battle_L");				// 戦闘待機
	
	// アーザムーク
	local aza_appearance = ReadMotion_(azamuku, "m204_00_appearance");		// 登場
	local aza_bow = ReadMotion_(azamuku, "m204_00_bow");					// おじぎ→リアクターを取り出す
	local aza_talk_L = ReadMotion_(azamuku, "m204_00_talk_L");				// 会話（喜）L
	local aza_take_L = ReadMotion_(azamuku, "m204_00_take_reactor_L");		// リアクターを取り出すL
	local aza_fly = ReadMotion_(azamuku, "m204_00_fly");					// 待機→羽を広げて飛ぶ
	local aza_hold_L = ReadMotion_(azamuku, "m204_00_hold_reactor_L");		// リアクターを持つL
	local aza_turn_L = ReadMotion_(azamuku, "m204_00_turn_L");				// 後ろを向くL
	local aza_g_wait = ReadMotion_(azamuku, "m204_00_g_wait_L");			// 地上待機L
	local aza_arm_L= ReadMotion_(azamuku, "m204_00_arm_folde_L");			// 腕組みうなづくL
	local aza_hurry = ReadMotion_(azamuku, "m204_00_hurry");				// 腕組み→焦る
	local aza_hurry_L = ReadMotion_(azamuku, "m204_00_hurry_L");			// 焦るL
	local aza_angry_L = ReadMotion_(azamuku, "m204_00_anger_L");			// 怒りL
	local aza_strike = ReadMotion_(azamuku, "m204_00_strike_L");			// 装置をたたくL
	local aza_ret = ReadMotion_(azamuku, "m204_00_retreat");				// 後ずさる
	local aza_ret_L = ReadMotion_(azamuku, "m204_00_retreat_L");			// 後ずさるL
	local aza_ret_fly = ReadMotion_(azamuku, "m204_00_retreat_fly");		// 後ずさる→上空へ上がる
	local aza_spr_hand = ReadMotion_(azamuku, "m204_00_spread_hand");		// 待機→両手を広げる
	local aza_spr_hand_L = ReadMotion_(azamuku, "m204_00_spread_hand_L");	// 両手を広げるL
	local aza_typing = ReadMotion_(azamuku, "m204_00_typing_L");			// タイピングL
	
// ▼初期モーション
	SetMotion_(azamuku, aza_g_wait, BLEND_N)								// アザ　地上待機
	SetMotion_(player, MOT_RUN, BLEND_N)									// 主人公走る
	task_player = Task_MoveForward_(player, 1.0, true);						// 主人公走る

// ▼カメラ設定
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット１　主人公室内に入る
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	
	StartDemo(FADE_COLOR_BLACK);											// フェードイン
	Wait_(15);
	
	DeleteTask_(task_player);
	SetMotion_(player, pl_caution01_L, BLEND_L)								// 主　警戒
	
	Wait_(60);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット2　木の苗⇒アーザムークを映す
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//～～～～～～～～～カメラ～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	WaitTask(task_cam);
	Wait_(60);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット3　アーザムークアップ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	DeleteTask_(task_cam);
	//～～～～～～～～～カメラ～～～～～～～～～～～
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	Wait_(30);
	SetMotion_(azamuku, aza_turn_L, BLEND_XL)												// アザ　後ろを向く
	task_aza = Task_RotateToPos_(azamuku, GetPos_(player), 3.0);
	Wait_(25);
	DeleteTask_(task_aza);
	
	Wait_(30);
	//===============================================
	//■アーザムーク
	//「ホーッホッホッホッ！
	//　遅かったですねぇ。まもなく　希望は我が手に！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AZAMUKU");
	ShowMsg_("DEMO_318_MSG_010");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	//■アーザムーク
	//「レジスタンスの最終兵器だという　希望……
	//　そのありか　拝ませていただくデス！
	//-----------------------------------------------
	ShowMsg_("DEMO_318_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(azamuku, aza_g_wait, BLEND_XL)												// アザ　地上待機
	task_aza = Task_RotateToDir_(azamuku, 90, 3.0);
	Wait_(50);
	DeleteTask_(task_aza);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット4　モニタ起動
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetVisible(azamuku, false);																// アザ非表示

	//～～～～～～～～～カメラ～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");
	
	Wait_(10);
	PlaySE_("SE_FLD_135");																	// 反応音
	efc_reactor01 = SetPointWorldEffect_("ef732_09_light_reactor_c", "obj_reactor000");		//◆リアクター起動エフェクト
	SetEffectScale_(efc_reactor01, 0.5);
	Wait_(10);
	SetMotion_(daiza, MOT_GIMMICK_1, BLEND_XL);												// 台座起動前待機に移行
	Wait_(20);	
	SetMotion_(daiza, MOT_GIMMICK_2, BLEND_XL);												// 台座起動
	Wait_(30);
	
	Task_ObjectFadeIn_(display, 30);
	PlaySE_("SE_DEM_055"); //ディスプレイ点灯
	
	Wait_(90);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット5　モニタPANUP
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetLayoutAnime_("fade_in", false);											// 黒半透明
	Wait_(30);
	SetLayoutAnime_("loop", false);												// 黒半透明
	
	//===============================================
	//*実験装置
	//……４日め。
	//新しい実験室は　順調に稼働している。
	//-----------------------------------------------
	ShowScreenMessage_("DEMO_318_MSG_030", false);
	//===============================================
	
	//===============================================
	//*実験装置
	//艦の電源を　利用したのは　正解だった。
	//これで　希望の開発にも　はずみがつくはずだ。
	//-----------------------------------------------
	ShowScreenMessage_("DEMO_318_MSG_040", false);
	//===============================================

	WaitTask(task_cam);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット6　アザムク＆主人公
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetVisible(azamuku, true);												// アザ表示
	SetPointPos_(player , "player001");
	SetMotion_(player, MOT_RUN, BLEND_N)									// 主人公走る
	task_player = Task_MoveForward_(player, 1.0, true);						// 主人公走る
	//～～～～～～～～～カメラ～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");
	
	Wait_(40);
	
	SetMotion_(player, pl_battle_run, BLEND_M)								// 主　戦闘待機
	Wait_(15);
	DeleteTask_(task_player);
	SetMotion_(player, pl_caution01_L, BLEND_L)								// 主　警戒
	
	//===============================================
	//*実験装置
	//……９５日め。
	//新しい苗の　開発に成功。
	//-----------------------------------------------
	ShowScreenMessage_("DEMO_318_MSG_050", false);
	//===============================================
	
	//===============================================
	//*実験装置
	//この苗が　希望への第一歩と　なるはず。
	//うまく　育ってほしいと思う。
	//-----------------------------------------------
	ShowScreenMessage_("DEMO_318_MSG_060", false);

	SetLayoutAnime_("fade_out", false);											// 黒半透明
	//===============================================

	WaitTask(task_cam);
	Wait_(20);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット7　アーザムーク　腕組み
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	
	//～～～～～～～～～カメラ～～～～～～～～～～～
	SetPointCameraEye_("cameye003");
	SetPointCameraTarget_("camtgt003");
	
	SetMotion_(azamuku, aza_arm_L, BLEND_XL)									// アザ　腕組み
	
	//===============================================
	//■アーザムーク
	//「なるほど　苗デスか……。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AZAMUKU");
	ShowMsg_("DEMO_318_MSG_070");
	KeyInputWait_();
	//===============================================
	PlaySE_("SE_DEM_026");	// ■SE:集中線
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", 100);					// 集中線
	SetMotionSpeed_(azamuku, 3);											// モーションが早くなる
	SetMotion_(azamuku, aza_hurry, BLEND_L)									//アザ　焦る（装置に掴みかかる）
	
	//===============================================
	//■アーザムーク
	//「……って　なぜ苗が出てくるのデス！？
	//　最終兵器と　どんな関係がっ？
	//-----------------------------------------------
	ShowMsg_("DEMO_318_MSG_080");

	WaitMotion(azamuku); 
	SetMotion_(azamuku, aza_hurry_L, BLEND_L)								// アザ　焦るL
	
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	DeleteEffectEmitter_(efc_cam);
	
	SetMotionSpeed_(azamuku, 1);												// モーション　元に戻る
	SetMotion_(azamuku, aza_angry_L, BLEND_XL)									// アザ　怒りふるえる
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット8　アーザムーク　ズームアップ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓	
	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");
	
	//===============================================
	//*実験装置
	//……１４４日め。
	//耐寒植物の苗は　順調に生育中。
	//-----------------------------------------------
	SetLayoutAnime_("fade_in", false);											// 黒半透明
	Wait_(30);
	SetLayoutAnime_("loop", false);												// 黒半透明

	ShowScreenMessage_("DEMO_318_MSG_090", false);
	//==============================================

	//===============================================
	//*実験装置
	//このままいけば　トードーや　シルバーの
	//友情に　報いることが　できるはずだ。
	//-----------------------------------------------
	ShowScreenMessage_("DEMO_318_MSG_100", false);
	//===============================================
	
	//===============================================
	//*実験装置
	//……１６６日め。
	//自動研究装置に　後を任せ　旅立つ時が来た。
	//-----------------------------------------------
	ShowScreenMessage_("DEMO_318_MSG_110", false);
	//===============================================
	WaitTask(task_cam);

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット9　苗ズームイン
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//～～～～～～～～～カメラ～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye005", "anmtgt005");
	
	//===============================================
	//*実験装置
	//トードーたちには　いずれ　希望が
	//世界を　変えると　言っておいた。
	//-----------------------------------------------
	ShowScreenMessage_("DEMO_318_MSG_120", false);

	
	//===============================================
	//*実験装置
	//しばし　耐えてほしい。この氷原が
	//緑豊かな土地に変わる　その日が　来るまで。
	//-----------------------------------------------	
	ShowScreenMessage_("DEMO_318_MSG_130", false);

	WaitTask(task_cam);
	
	SetLayoutAnime_("fade_out", false);											// 黒半透明
	//===============================================
	Wait_(20);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット10　アーザムーク「調べる」
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetPointPos_(azamuku , "npc_azamuku002");
	SetPointCameraEye_("cameye006");
	SetPointCameraTarget_("camtgt006");
	
	//===============================================
	//■アーザムーク
	//「ホーッホッホ……ホ？
	//　耐寒植物……？　緑豊かな土地……？
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AZAMUKU");
	ShowMsg_("DEMO_318_MSG_140");
	KeyInputWait_();
	//===============================================
	PlayLoopSE_("SE_DEM_121");
	SetMotion_(azamuku, aza_typing, BLEND_L)									// アザ　タイピング
	
	//===============================================
	//■アーザムーク
	//「バカなっ！　これで　終わりのはずがないデス！
	//　ここには　レジスタンスの希望が……
	//-----------------------------------------------
	ShowMsg_("DEMO_318_MSG_150");	
	KeyInputWait_();
	//===============================================
	
	//===============================================
	//■アーザムーク
	//「レジスタンスの作った　最終兵器が
	//　隠されているはずなんデス！
	//-----------------------------------------------
	ShowMsg_("DEMO_318_MSG_160");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	Wait_(40);

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット11　アザ	アップ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetPointCameraEye_("cameye004");
	SetPointCameraTarget_("camtgt004");
	
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", 100);						// 集中線
	//===============================================
	//■アーザムーク
	//「もっと　よく調べなさい！
	//　最終兵器を　絶対に　見つけるのデェェス！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AZAMUKU");
	ShowMsg_("DEMO_318_MSG_170");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	DeleteEffectEmitter_(efc_cam);
	StopLoopSE_(5);
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット12　装置　ズームアップ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetVisible(azamuku, false);
	task_cam = Task_AnimeMoveCamera_("anmeye007", "anmtgt007");
	
	StopBgm_(90);
	//===============================================
	//*実験装置
	//検索結果は　１件　です。
	//内容を　画面に表示いたします。
	//-----------------------------------------------
	SetLayoutAnime_("fade_in", false);											// 黒半透明
	Wait_(30);
	SetLayoutAnime_("loop", false);												// 黒半透明
	ShowScreenMessage_("DEMO_318_MSG_180", false);

	//===============================================
	WaitTask(task_cam);
	SetVisible(azamuku, true);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット13　アーザムーク　ズームアウト
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetPointPos_(azamuku , "npc_azamuku002");
	SetMotion_(azamuku, aza_g_wait, BLEND_N)								// アザ　地上待機

	task_cam = Task_AnimeMoveCamera_("anmeye008", "anmtgt008");
	WaitTask(task_cam);
	//===============================================
	//*実験装置
	// ここに　お前の求めているものは　ない。
	//-----------------------------------------------
	ShowScreenMessage_("DEMO_318_MSG_190", false);
	
	Wait_(30);	
	//===============================================

	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット14　主人公アップ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetPointPos_(azamuku , "npc_azamuku000");
	SetPointPos_(player , "player002");
	SetMotion_(player, pl_battle_L, BLEND_N)								// 主　戦闘待機
	task_cam = Task_AnimeMoveCamera_("anmeye010", "anmtgt010");
	WaitTask(task_cam);
	//===============================================
	//*実験装置
	//希望は　すでに立ち上がった。
	//-----------------------------------------------
	ShowScreenMessage_("DEMO_318_MSG_200", false);
	SetLayoutAnime_("fade_out", false);											// 黒半透明

	//===============================================
	Wait_(40);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット15　機械を破壊するアザムク
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetMotion_(azamuku, aza_angry_L, BLEND_N)									// アザ　怒りふるえる

	SetPointCameraEye_("cameye005");
	SetPointCameraTarget_("camtgt005");
	//===============================================
	//■アーザムーク
	//「なん……だと……！
	//　ワタクシが　踊らされたというのデスか！？
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AZAMUKU");	
	ShowMsg_("DEMO_318_MSG_210");
	KeyInputWait_();
	//===============================================
	
//	PlaySE_("SE_SKL_018");					// 音楽室要望でSEをカット
	PlayBgm_("BGM_007");					//代わりにBGMをここからスタート
	efc_aza01 = SetSelectBoneEffectSetOffset_("ef730_01_oth_dark_aura01", azamuku, ATTACH_EFFECT2, Vec3(0.0, -10.0, 0.0));		// 黒オーラ	
	
	//===============================================
	//■アーザムーク
	//「やってくれましたねぇ　ルキヤさん！
	//　このっ！　このこのこのっ！！
	//-----------------------------------------------
	ShowMsg_("DEMO_318_MSG_220");
	KeyInputWait_();
	CloseMsgWnd_();

	task_cam = Task_AnimeMoveCamera_("anmeye006", "anmtgt006");

	SetMotion_(azamuku, aza_strike, BLEND_L)														// アザ　装置をたたく
	PlaySE_("SE_DEM_122");
	Wait_(10);
	efc_aza02 = SetSelectBoneEffectSetOffset_("ef831_01_atc_yetas", azamuku, ATTACH_EFFECT1, Vec3(0.0, -10.0, 15.0));				// 黒い攻撃ef
	SetEffectScale_(efc_aza02, 0.4);
	Wait_(25);
	
	efc_attack = SetPointWorldEffect_("ef723_01_nat_explosion_n01", "efc_attack000");
	SetEffectScale_(efc_attack, 0.8);
	StartEarthQuake_(6, 3, 1.5)
	
	efc_aza02 = SetSelectBoneEffectSetOffset_("ef831_01_atc_yetas", azamuku, ATTACH_EFFECT1, Vec3(0.0, -10.0, 15.0));				// 黒い攻撃ef
	SetEffectScale_(efc_aza02, 0.4);
	Wait_(25);
	
	efc_smoke01 = SetPointWorldEffect_("ef721_04_nat_smoke_psps", "efc_smoke001");					// 煙
	SetEffectScale_(efc_smoke01, 2.0);
	
	efc_attack = SetPointWorldEffect_("ef723_01_nat_explosion_n01", "efc_attack001");
	SetEffectScale_(efc_attack, 0.5);
	StartEarthQuake_(6, 3, 1.2)
	
	efc_aza02 = SetSelectBoneEffectSetOffset_("ef831_01_atc_yetas", azamuku, ATTACH_EFFECT1, Vec3(0.0, -10.0, 15.0));				// 黒い攻撃ef
	SetEffectScale_(efc_aza02, 0.4);
	Wait_(25);
	
	efc_attack = SetPointWorldEffect_("ef723_01_nat_explosion_n01", "efc_attack000");
	SetEffectScale_(efc_attack, 0.7);
	StartEarthQuake_(6, 3, 1.4)
	
	efc_aza02 = SetSelectBoneEffectSetOffset_("ef831_01_atc_yetas", azamuku, ATTACH_EFFECT1, Vec3(0.0, -10.0, 15.0));				// 黒い攻撃ef
	SetEffectScale_(efc_aza02, 0.4);
	Wait_(25);
	
	efc_smoke01 = SetPointWorldEffect_("ef721_04_nat_smoke_psps", "efc_smoke000");					// 煙
	SetEffectScale_(efc_smoke01, 2.3);
	
	efc_attack = SetPointWorldEffect_("ef723_01_nat_explosion_n01", "efc_attack000");
	SetEffectScale_(efc_attack, 1.2);
	StartEarthQuake_(6, 3, 2)
	
	efc_aza02 = SetSelectBoneEffectSetOffset_("ef831_01_atc_yetas", azamuku, ATTACH_EFFECT1, Vec3(0.0, -10.0, 15.0));				// 黒い攻撃ef
	SetEffectScale_(efc_aza02, 0.4);
	Wait_(20);
	
	EndDemoBgmFade_(25);
	
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 25);
	
	Wait_(5);
	
	efc_attack = SetPointWorldEffect_("ef723_01_nat_explosion_n01", "efc_attack000");
	SetEffectScale_(efc_attack, 1.2);
	StartEarthQuake_(6, 3, 2)
	
	Wait_(20);
	DeleteAllTask_();
	SetSepiaColor_(false);
	End_();

}
