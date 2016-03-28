//=============================================
//
//		demo522[エイリアス]
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
	local task_cam, task_player, task_burdy, task_rena, task_darkmaster, task_prometheus;
	local efc_player, efc_burdy, efc_rena, efc_prometheus;
	local efc_cam;
	
// ▼フラグ設定
	local bit_ruler = GetEventFlg_("BFG_RULER_ADD_023");	// Bit_223  ルーラ追加フラグ 焦熱の火山　秘密基地　地下施設
	
// ▼リソース読込
	// キャラクター
	local player = GetPlayerId_();							// 主人公
	local model_burdy = ReadNpc_("n019");					// バーディ
	local model_boy = ReadNpc_("n040"); 					// こども主人公
	local model_rena = ReadNpc_("n007");					// レナーテ
	local model_darkmaster = ReadNpc_("n008");				// ダークマスター
	local model_prometheus = ReadNpc_("m190_00");			// プロメテウス
	// ギミック
	local model_cold = ReadGimmick_("o_V02_10");			// コールドスリープ装置
	local model_cpu = ReadGimmick_("o_V02_11");				// コンピュータの明滅
	local model_light = ReadGimmick_("o_V02_13");			// コールドスリープ明滅
	local model_coldsleep = ReadGimmick_("o_V02_12");		// コールドスリープ(主人公用)
	local model_ruler = ReadGimmick_("o_com_08");			// ルーラポイント
	local model_door = ReadGimmick_("o_V02_09");			// 扉
	local model_door01 = ReadGimmick_("o_V02_02");			// エレベーター扉
	// エフェクト
	LoadEffect_("ef712_10_emo_surprise01");					// 「！」
	LoadEffect_("ef733_01_sym_shuchusen01");				// 集中線
	LoadEffect_("ef730_01_oth_dark_aura01");				// オーラ

// ▼配置
	// 主人公
	SetPointPos_(player, "player000");
	// バーディ
	local burdy = ArrangePointNpc_(model_burdy, "npc_burdy000");
	SetScaleSilhouette(burdy, SCALE.N, SILHOUETTE_WIDTH.N);
	// レナーテ
	local rena = ArrangePointNpc_(model_rena, "npc_rena000");
	SetVisible(rena, false);
	// ダークマスター
	local darkmaster = ArrangePointNpc_(model_darkmaster, "npc_darkmaster000");
	SetVisible(darkmaster, false);
	// プロメテウス
	local prometheus = ArrangePointNpc_(model_prometheus, "npc_prometheus000");
	SetVisible(prometheus, false);
	// こども主人公（コールドスリープの中に配置）
	local boy = ArrangePointNpc_(model_boy, "npc_boy000");
	// コールドスリープ(主人公用)
	local coldsleep = ArrangePointGimmick_("o_V02_12", model_coldsleep, "obj_coldsleep000");
	// コンピュータの明滅
	local cold_cpu = ArrangePointGimmick_("o_V02_11", model_cpu, "obj_cpu000");
	// コールドスリープ明滅
	local cold_light = ArrangePointGimmick_("o_V02_13", model_light, "obj_light000");
	SetMotion_(cold_light, MOT_GIMMICK_0, BLEND_N);			// 通常画面
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
	// 主人公
	local player_look_walk_L = ReadMotion_(player, "Player_look_walk_L");			// 歩き（あたりを見回す）L
	local player_look_up_L = ReadMotion_(player, "Player_look_up_L");				// 上向き待機L
	local player_surprise = ReadMotion_(player, "Player_surprise");					// 驚く
	local player_surprise_L = ReadMotion_(player, "Player_surprise_L");				// 驚くL
	local player_caution01 = ReadMotion_(player, "Player_caution01_L");				// 警戒L
	//レナーテ
	local rena_turn_left = ReadMotion_(rena, "n007_turn_left");						// 待機→振り返る（左向き）
	local rena_turn_left_L = ReadMotion_(rena, "n007_turn_left_L");					// 振り返るL（左向き）
	local rena_caution = ReadMotion_(rena, "n007_caution_L");						// 警戒L
	//バーディ
	local burdy_idol = ReadMotion_(burdy, "n019_idol");								// 待機
	local burdy_run_L = ReadMotion_(burdy, "n019_run_L");							// 走るL
	local burdy_talk = ReadMotion_(burdy, "n019_talk");								// 会話
	local burdy_why = ReadMotion_(burdy, "n019_why");								// 首をかしげる
	local burdy_look_around = ReadMotion_(burdy, "n019_look_around_L");				// 見渡すL
	
	//ダークマスター
	local darkmaster_laugh_L = ReadMotion_(darkmaster, "n008_laugh_L");				// 笑うL
	local darkmaster_summon = ReadMotion_(darkmaster, "n008_summon");				// 待機→モンスター召喚
	local darkmaster_summon_L = ReadMotion_(darkmaster, "n008_summon_L");			// モンスター召喚L
	//こども主人公
	local boy_sleep = ReadMotion_(boy, "n010_cold_sleep_L");						// コールドスリープ用モーション

	SetStepSe_(darkmaster,"SE_FLD_016");
	SetStepSe_(burdy,"SE_FLD_032");
	SetStepSePan_(rena, false);
	SetStepSePan_(darkmaster, false);
	SetStepSePan_(burdy, false);

// ▼初期モーション設定
	SetMotion_(player, player_look_up_L, BLEND_XL);			// 主人公　上向き待機L
	SetMotion_(burdy, burdy_look_around, BLEND_N);			// バーディ　見渡す
	SetMotion_(rena, MOT_WAIT, BLEND_N);					// レナーテ　待機
	SetMotion_(boy, boy_sleep, BLEND_N);					// こども主人公　コールドスリープ用モーション
	SetFace_(boy, "Face_loop_close02");						// こども主人公　目閉じ


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット1　主人公とバーディ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

// ▼カメラ設定
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------
	StartDemo(FADE_COLOR_BLACK);
	Wait_(15);
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	Wait_(75);
	//===============================================
	//■バーディ
	//「なんだか　ホラーな部屋デース。
	//　ミーは　ちょっとコワい感じがしマース。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BIRDY");
	ShowMsg_("DEMO_522_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	Wait_(30);
	
	DeleteTask_(task_cam);
	SetMotion_(player, MOT_WAIT, BLEND_N);					// 主人公　待機

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット2-1　バーディアップ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetPointPos_(burdy, "npc_burdy004");
	task_cam = Task_AnimeMoveCamera_("anmeye010", "anmtgt010");
	DeleteTask_(task_cam);
	Wait_(50);
	task_cam = Task_AnimeMoveCamera_("anmeye010", "anmtgt010");
	Wait_(30);
	PlaySE_("SE_DEM_026");	// ■SE:集中線
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", CAMERA_DEF);// 集中線
	Wait_(10);
	DeleteEffectEmitter_(efc_cam);
	WaitTask(task_cam);
	//===============================================
	//■バーディ
	//「こ……これは！？
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BIRDY");
	ShowMsg_("DEMO_522_MSG_013");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	Wait_(10);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット2-2 室内　カプセルを見回すシーン
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	WaitTask(task_cam);
	Wait_(30);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット2-3 アンセス4体を見せる
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye001-2", "anmtgt001-2");
	WaitTask(task_cam);
	//===============================================
	//■バーディ
	//「ア……アンセスが……たくさん……？
	//　これは……どういうことデース！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BIRDY");
	ShowMsg_("DEMO_522_MSG_015");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(10);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット2-4 冷凍アンセスアップ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye001-3", "anmtgt001-3");
	WaitTask(task_cam);
	Wait_(20);
	
	SetPointPos_(burdy, "npc_burdy000");
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット3　こども主人公　カメラＰＡＮＵＰ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");

	Wait_(250);

	DeleteTask_(task_cam);

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット4　主人公＋バーディ＋こども主人公　走り→驚き→振り向き　横から
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");

	SetMotion_(player, MOT_RUN, BLEND_N);					// 主人公　走り
	
	local task_burdy_step = Task_PlaySe_("SE_FLD_032", 7);							//バーディ足音
	
	SetMotion_(burdy, burdy_run_L, BLEND_N);				// バーディ　走りL
	task_player = Task_AnimeMove_(player, "anm_player002");
	task_burdy = Task_AnimeMove_(burdy, "anm_burdy000");
	Wait_(22);
	SetMotion_(player, player_look_up_L, BLEND_L);			// 主人公　上向き待機L
	DeleteTask_(task_player);
	Wait_(6);
	
	DeleteTask_(task_burdy_step);
	
	SetMotion_(burdy, burdy_idol, 12);						// バーディ　待機
	Wait_(2);
	DeleteTask_(task_burdy);
	task_burdy = Task_RotateToDir_(burdy, 135, 4);
	Wait_(12);
	DeleteTask_(task_burdy);
	SetMotion_(burdy, burdy_talk, 12);

	//===============================================
	//■バーディ
	//「ホワッツ！？　こ……このボーイ！
	//　ミーは　このボーイのこと　知ってマース！　▽
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BIRDY");
	ShowMsg_("DEMO_522_MSG_040");
	KeyInputWait_();
	//===============================================

	//===============================================
	//■バーディ
	//「このボーイは　アンセスの弟デース！
	//　名前は　たしか……。
	//-----------------------------------------------
	ShowMsg_("DEMO_522_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(burdy, burdy_idol, 24);						// バーディ　待機
	Wait_(10);

	//===============================================
	//*レナーテ
	//「よく　来てくれたわね……。
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_522_MSG_060");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	local posplayer = Vec3(0, 1.70, 0);
	local posburdy = Vec3(0, 4, 1);
	local id3 = SetSelectBoneEffectSetOffset_("ef712_10_emo_surprise01", player, ATTACH_EFFECT1, posplayer);	// 「！」
	efc_burdy = SurpriseDispSetOffset(burdy, posburdy, 2.4);
	Wait_(30);
	SetMotion_(player, MOT_WALK, BLEND_L);					// 主人公　歩き
	task_player = Task_RotateToDir_(player, 300, 6);
	
	PlaySE_("SE_FLD_016");									//主人公の足音

	SetMotion_(burdy, MOT_WALK, BLEND_L);					// バーディ　歩き
	task_burdy = Task_RotateToDir_(burdy, 270, 6);
	WaitTask(task_burdy);
	SetMotion_(burdy, burdy_idol, BLEND_L);					// バーディ　待機
	WaitTask(task_player);
	SetMotion_(player, MOT_WAIT, BLEND_L);					// 主人公　待機
	DeleteTask_(task_player);
	DeleteTask_(task_burdy);
	Wait_(15);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット5　レナーテ　待機→歩き　ズームイン
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");

	SetVisible(rena, true);
	PlaySE_("SE_DEM_026");	// ■SE:集中線
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", CAMERA_DEF);// 集中線
	Wait_(8);
	DeleteEffectEmitter_(efc_cam);
	DeleteTask_(task_cam);

	//===============================================
	//■バーディ
	//「レナーテ！？
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BIRDY");
	ShowMsg_("DEMO_522_MSG_070");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	Wait_(5);
	SetStepSe_(rena, SILENT_STEP_SE);	// 足音を 無音にする
	local task_rena_step = Task_ChangeStepSe(rena, "SE_FLD_016", 15);							//レナーテ足音

	SetMotion_(rena, MOT_WALK, BLEND_L);
	task_rena = Task_AnimeMove_(rena, "anm_rena000");
	Wait_(15);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット6　レナーテ＋主人公＋バーディ　歩き→待機　クォータービューでレナーテ追尾
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");

	SetMotionSpeed_(rena, 1.35);
	SetPointPos_(player, "player001");
	SetPointPos_(burdy, "npc_burdy001");
	Wait_(100);
	SetMotion_(burdy, MOT_WALK, BLEND_L);					// バーディ　歩き
	task_burdy = Task_RotateToDir_(burdy, 105, 3);
	Wait_(5);
	SetMotion_(player, MOT_WALK, BLEND_L);					// 主人公　歩き
	task_player = Task_RotateToDir_(player, 75, 3);
	Wait_(52);
	SetMotion_(burdy, burdy_idol, BLEND_L);					// バーディ　待機
	Wait_(1);
	SetMotion_(player, MOT_WAIT, BLEND_L);					// 主人公　待機
	Wait_(16);
	SetMotion_(rena, MOT_WAIT, BLEND_XL);					// レナーテ　待機
	SetMotionSpeed_(rena, 1.0);
	Wait_(5);
	DeleteTask_(task_rena_step);
	SetStepSe_(rena,"SE_FLD_016");
	Wait_(25);
	DeleteTask_(task_cam);
	DeleteTask_(task_player);
	DeleteTask_(task_burdy);
	DeleteTask_(task_rena);

	//===============================================
	//■レナーテ
	//「この子こそ　レジスタンスの切り札。
	//　そして　私が守るべきもの……。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_522_MSG_080");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(rena, rena_turn_left, BLEND_XL);				// レナーテ　待機→振り返る（左向き）
	SetMotionSpeed_(rena, 0.6);
	Wait_(24);
	SetMotion_(rena, rena_turn_left_L, BLEND_L);			// レナーテ　振り返るL（左向き）
	SetMotionSpeed_(rena, 1.0);
	Wait_(30);
	task_player = Task_MoveForward_(player, 0.8, false);
	SetMotion_(player, MOT_WALK, BLEND_XL);
	Wait_(24);
	SetMotion_(player, MOT_WAIT, BLEND_N);					// 主人公　待機
	DeleteTask_(task_player);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット7　レナーテ＋こども主人公　会話　呷り
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");

	SetVisible(player, false);
	Wait_(5);

	//===============================================
	//■レナーテ
	//「見て……<name_player/>。
	//　これがあなた……本当のあなたよ。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_522_MSG_090");
	KeyInputWait_();
	CloseMsgWnd_();	
	//===============================================

	task_cam = Task_AnimeMoveCamera_("anmeye005", "anmtgt005");
	WaitTask(task_cam);
	DeleteTask_(task_cam);
	Wait_(60);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット8　主人公　驚き　バストアップ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	SetPointCameraEye_("cameye003");
	SetPointCameraTarget_("camtgt003");

	SetVisible(player, true);
	SetVisible(burdy, false);
	SetPointPos_(player, "player002");
	posplayer = Vec3(0.5, 1.35, -1.0);
	efc_player = SurpriseDispSetOffset(player, posplayer, 0.55);
	SetMotion_(player, player_surprise, BLEND_M);			// 主人公　驚く
	WaitMotion(player);
	SetMotion_(player, player_surprise_L, BLEND_M);			// 主人公　驚くL
	Wait_(15);

	//===============================================
	//■レナーテ
	//「今のあなたは　エイリアス……
	//　亡くなった　アンセスを模したコピー。　▽
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_522_MSG_100");
	KeyInputWait_();
	//===============================================


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット9　主人公＋レナーテ＋バーディ　会話　俯瞰→ややズームアウト
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	task_cam = Task_AnimeMoveCamera_("anmeye006", "anmtgt006");

	SetVisible(burdy, true);
	SetPointPos_(rena, "npc_rena001");
	SetDir_(player, 15);
	SetDir_(rena, 210);
	SetMotion_(player, MOT_WAIT, BLEND_N);					// 主人公　待機
	SetMotion_(rena, MOT_TALKLOOP, BLEND_N);				// レナーテ　会話L

	//===============================================
	//■レナーテ
	//「この機械と　本当のあなたの意識から
	//　生み出された　かりそめの身体なの。
	//-----------------------------------------------
	ShowMsg_("DEMO_522_MSG_110");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(15);
	DeleteTask_(task_cam);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット10　主人公＋レナーテ＋バーディ　バーディ首かしげ→レナーテ左向き待機　クォータービュー
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	SetPointCameraEye_("cameye004");
	SetPointCameraTarget_("camtgt004");

	SetPointPos_(burdy, "npc_burdy002");
	SetDir_(rena, 200);
	SetMotion_(rena, MOT_WAIT, BLEND_N);					// レナーテ　待機
	SetMotion_(burdy, burdy_why, BLEND_XL);					// バーディ　首をかしげる

	//===============================================
	//■バーディ
	//「どういうことネー？
	//　今のアンセスは　ニセモノなのですかー！？
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BIRDY");
	ShowMsg_("DEMO_522_MSG_120");
	Wait_(16);
	WaitMotion(burdy);
	SetMotion_(burdy, burdy_idol, BLEND_L);					// バーディ　待機
	KeyInputWait_();
	CloseMsgWnd_();	
	//===============================================

	SetMotion_(rena, rena_turn_left, BLEND_XL);				// レナーテ　待機→振り返る（左向き）
	SetMotionSpeed_(rena, 0.6);
	Wait_(5);
	task_rena = Task_RotateToDir_(rena, 160, 1.5);
	Wait_(25);
	SetMotion_(rena, rena_turn_left_L, BLEND_L);			// レナーテ　振り返るL（左向き）
	SetMotionSpeed_(rena, 1.0);
	Wait_(8);

	//===============================================
	//■レナーテ
	//「オリジナルではないという意味では　そう。
	//　彼の外見と能力を　引きついではいる……。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_522_MSG_130");
	KeyInputWait_();
	CloseMsgWnd_();	
	//===============================================

	Wait_(10);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット11　主人公＋レナーテ＋バーディ　待機　横から装置全体→ＰＡＮアップ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	task_cam = Task_AnimeMoveCamera_("anmeye007", "anmtgt007");

	SetMotion_(rena, MOT_TALKLOOP, BLEND_N);				// レナーテ　会話L
	SetDir_(rena, 195);
	Wait_(5);

	//===============================================
	//■レナーテ
	//「本体から意識を切り離し　装置に記録。
	//　それを　かりそめの身体に　宿らせる……。　▽
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_522_MSG_140");
	KeyInputWait_();
	//===============================================

	//===============================================
	//■レナーテ
	//「だから　本体があるかぎり　何度でも
	//　復活ができる……それがエイリアスよ。
	//-----------------------------------------------
	ShowMsg_("DEMO_522_MSG_150");
	KeyInputWait_();
	CloseMsgWnd_();	
	//===============================================

	Wait_(15);
	WaitTask(task_cam);
	DeleteTask_(task_cam);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット12　主人公＋レナーテ＋バーディ　主人公＋バーディ振り向く　横から
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	SetPointCameraEye_("cameye005");
	SetPointCameraTarget_("camtgt005");

	SetMotion_(rena, MOT_WAIT, BLEND_N);					// レナーテ　待機
	Wait_(5);

	StopBgm_(15);
	//===============================================
	//*ダークマスター
	//「ほう……なかなか　興味深い話だな。
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_522_MSG_160");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	posplayer = Vec3(0, 1.1, 0);
	posburdy = Vec3(0, 0, 1);
	local posrena = Vec3(2, -2, 0);
	local id1;
	id1 = SetSelectBoneEffectSetOffset_("ef712_10_emo_surprise01", player, ATTACH_EFFECT1, posplayer);	// 「！」
	SetEffectScale_(id1, 1.5);
	local id2;
	id2 = SetSelectBoneEffectSetOffset_("ef712_10_emo_surprise01", burdy, ATTACH_EFFECT1, posburdy);	// 「！」
	SetEffectScale_(id2, 3.0);
	local id3;
	id3 = SetSelectBoneEffectSetOffset_("ef712_10_emo_surprise01", rena, ATTACH_EFFECT1, posrena);	// 「！」
	SetEffectScale_(id3, 2.0);
	PlaySE_("SE_DEM_053");		// 「ピンッ！」

	Wait_(30);
	SetMotion_(player, MOT_WALK, BLEND_L);					// 主人公　歩き
	task_player = Task_RotateToDir_(player, 280, 7);
	SetMotion_(burdy, MOT_WALK, BLEND_L);					// バーディ　歩き
	task_burdy = Task_RotateToDir_(burdy, 270, 6);
	SetMotion_(rena, MOT_WALK, BLEND_L);					// レナーテ　歩き
	task_rena = Task_RotateToDir_(rena, 275, 6);
	WaitTask(task_rena);
	SetMotion_(rena, rena_caution, BLEND_L);				// レナーテ　警戒L
	WaitTask(task_player);
	SetMotion_(player, player_caution01, BLEND_L);			// 主人公　警戒L
	WaitTask(task_burdy);
	SetMotion_(burdy, burdy_idol, BLEND_L);					// バーディ　待機
	DeleteTask_(task_player);
	DeleteTask_(task_burdy);
	DeleteTask_(task_rena);
	Wait_(15);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット13　主人公＋レナーテ＋バーディ＋ダークマスター　ダークマスター歩く→待機　３人後方から→ダークマスターアップ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	task_cam = Task_AnimeMoveCamera_("anmeye008", "anmtgt008");
	PlayBgm_("BGM_008");
	task_darkmaster = Task_AnimeMove_(darkmaster, "anm_darkmaster000");
	SetVisible(darkmaster, true);
	SetMotionSpeed_(darkmaster, 1.5);
	SetMotion_(darkmaster, MOT_WALK, BLEND_N);				// ダークマスター　歩き
	Wait_(40);
	SetMotion_(darkmaster, MOT_WAIT, 10);					// ダークマスター　待機
	SetMotionSpeed_(darkmaster, 1.0);
	Wait_(5);
	DeleteTask_(task_darkmaster);

	//===============================================
	//■バーディ
	//「ダ……ダークマスター！？
	//　ユーは　死んだはずでは……！？
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BIRDY");
	ShowMsg_("DEMO_522_MSG_170");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(10);
	SetMotion_(darkmaster, MOT_TALKLOOP, BLEND_XL);			// ダークマスター　会話L

	//===============================================
	//■ダークマスター
	//「フッ。生きているのが　不思議か？
	//　別に　たいしたことではない。　▽
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_DARKMASTER");
	ShowMsg_("DEMO_522_MSG_180");
	KeyInputWait_();
	//===============================================

	//===============================================
	//■ダークマスター
	//「イッタブルを　盾にしただけよ。
	//　愚か者にも　使い道はあったということだ。
	//-----------------------------------------------
	ShowMsg_("DEMO_522_MSG_190");
	KeyInputWait_();
	CloseMsgWnd_();	
	//===============================================

	SetMotion_(darkmaster, MOT_WAIT, BLEND_XL);				// ダークマスター　待機
	Wait_(16);
	DeleteTask_(task_cam);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット14　主人公＋レナーテ＋バーディ＋ダークマスター　会話　ダークマスター後方から
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	SetPointCameraEye_("cameye006");
	SetPointCameraTarget_("camtgt006");

	SetPointPos_(burdy, "npc_burdy003");
	Wait_(10);
	SetMotion_(darkmaster, MOT_TALKLOOP, BLEND_XL);			// ダークマスター　会話L

	//===============================================
	//■ダークマスター
	//「しばらく　デスバーンに　様子を探らせていたが
	//　おかげで面白いものを　見ることができた。　▽
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_DARKMASTER");
	ShowMsg_("DEMO_522_MSG_200");
	KeyInputWait_();
	//===============================================

	//===============================================
	//■ダークマスター
	//「……何度でも　よみがえるわけだ。
	//　まさか　貴様がエイリアスだったとは。
	//-----------------------------------------------
	ShowMsg_("DEMO_522_MSG_210");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(darkmaster, MOT_WAIT, BLEND_XL);				// ダークマスター　待機
	Wait_(30);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット15　ダークマスター　笑う→会話→召喚　斜め前方から→上半身ズームイン
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	SetPointCameraEye_("cameye007");
	SetPointCameraTarget_("camtgt007");

	SetPointPosNoFit_(darkmaster, "npc_darkmaster001");
	SetMotion_(darkmaster, darkmaster_laugh_L, BLEND_XL);	// ダークマスター　笑うL
	SetMotionSpeed_(darkmaster, 1.5);
	Wait_(36);
	SetMotion_(darkmaster, MOT_WAIT, 10);					// ダークマスター　待機
	SetMotionSpeed_(darkmaster, 1.0);
	Wait_(10);
	SetMotion_(darkmaster, MOT_TALKLOOP, BLEND_XL);			// ダークマスター　会話L
	Wait_(5);

	//===============================================
	//■ダークマスター
	//「だが　ネタが割れれば　対処はたやすい。
	//　本体を滅ぼせば　復活はなくなる！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_DARKMASTER");
	ShowMsg_("DEMO_522_MSG_220");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(darkmaster, darkmaster_summon, 12);			// ダークマスター　待機→モンスター召喚
	Wait_(40);
	PlaySE_("SE_DEM_026");	// ■SE:集中線
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", CAMERA_DEF);// 集中線
	Wait_(18);
	DeleteEffectEmitter_(efc_cam);
	SetFade_(FADE_OUT, FADE_COLOR_WHITE, 25);
	Wait_(2);
	SetMotion_(darkmaster, darkmaster_summon_L, BLEND_L);	// ダークマスター　モンスター召喚L
	Wait_(40);
	SetVisible(prometheus, true);
	efc_prometheus = SetSelectBoneEffectSetOffset_("ef730_01_oth_dark_aura01", prometheus, ATTACH_EFFECT2, Vec3(0.0, 0.0, 0.0));
	SetMotion_(darkmaster, MOT_WAIT, BLEND_N);				// ダークマスター　待機
	task_cam = Task_AnimeMoveCamera_("anmeye009", "anmtgt009");
	SetDir_(darkmaster, 97);
	SetFade_(FADE_IN, FADE_COLOR_WHITE, 25);
	Wait_(105);
	DeleteTask_(task_cam);

	//===============================================
	//■ダークマスター
	//「今こそ　滅ぶがいい！
	//　その希望　アンセスの名前もろともにな！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_DARKMASTER");
	ShowMsg_("DEMO_522_MSG_230");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(darkmaster, darkmaster_summon, 12);			// ダークマスター　待機→モンスター召喚
	Wait_(39);

	EncountEndDemo(ENCOUNT_BOSS);
}
