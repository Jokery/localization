//=============================================
//
//		demo829[レナーテの解放]
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
	local task_cam, task_player, task_rena, task_aroma, task_seed;
	local task_aroma_step;
	local efc_cam, efc_player, efc_rena, efc_aroma, efc_seed000, efc_seed001;

// ▼リソース読込
	// ギミック
	local model_core000 = ReadGimmick_("o_C03_02");	// マザー
	local model_core100 = ReadGimmick_("o_C03_03");	// マザー飾り
	local model_case000 = ReadGimmick_("o_C03_01");	// コールドスリープのケース(開・待機)
	// キャラクター
	local player = GetPlayerId_();					// 主人公
	local model_rena = ReadNpc_("n007");			// レナーテ
	local model_aroma = ReadNpc_("n018");			// アロマ
	local model_regi_m = ReadNpc_("n012");			// レジスタンス 男性
	local model_regi_f = ReadNpc_("n013");			// レジスタンス 女性
	local model_man = ReadNpc_("n015");				// 男
	local model_woman = ReadNpc_("n016");			// 女
	local model_child = ReadNpc_("n017");			// 子供
	// エフェクト
	LoadEffect_("ef732_26_star_seed_base02");		// スターシード ベース02
	LoadEffect_("ef732_13_light_reactor01");		// リアクターの光(まぶしい)
	LoadEffect_("ef710_05_cha_light_ren");			// レナーテの光
	LoadEffect_("ef712_10_emo_surprise01");			// 「！」
	LoadEffect_("ef712_01_emo_notice01");			// 気づき
	LoadEffect_("ef733_01_sym_shuchusen01");		// 集中線

	local baseResId = ReadGimmick_("o_effect_base");
	local baseObj000 = ArrangePointGimmick_("o_effect_base", baseResId, "efc_seed000");
	local baseObj001 = ArrangePointGimmick_("o_effect_base", baseResId, "efc_seed001");

// ▼配置
	// マザー
	local core000 = ArrangePointGimmick_("o_C03_02", model_core000, "obj_core000");
	SetMotion_(core000, MOT_GIMMICK_1, BLEND_N);
	local core100 = ArrangePointGimmick_("o_C03_03", model_core100, "obj_core000");

	// 主人公
	SetPointPos_(player, "player000");
	// レナーテ
	local rena = ArrangePointNpc_(model_rena, "npc_rena000");
	SetPointPosNoFit_(rena, "obj_core000");
	SetFace_(rena, "Face_loop_close");
	// アロマ
	local aroma = ArrangePointNpc_(model_aroma, "npc_aroma000");
	SetStepSe_(aroma, SILENT_STEP_SE);
	// レジスタンス 男性
	local regi_m = ArrangePointNpc_(model_regi_m, "npc_woman000");
	// レジスタンス 女性
	local regi_f = ArrangePointNpc_(model_regi_f, "npc_child000");
	// 女
	local woman = ArrangePointNpc_(model_woman, "npc_woman000");
	// 子供
	local child = ArrangePointNpc_(model_child, "npc_child000");

// ▼非常駐モーション読込
	local player_look_up_L = ReadMotion_(player, "Player_look_up_L");		// 上向き待機L
	local player_romance = ReadMotion_(player, "Player_romance");			// レナーテの横でしゃがむ
	local player_romance_L = ReadMotion_(player, "Player_romance_L");		// レナーテの横でしゃがむL
	local player_romance02_L = ReadMotion_(player, "Player_romance02_L");	// レナーテの横でしゃがむ02L（顔の向きが少し上になる）
	local Player_romance03_L = ReadMotion_(player, "Player_romance03_L");	// レナーテの横でしゃがむ03L（アロマの方を向く）
	local player_stand_up = ReadMotion_(player, "Player_stand_up");			// レナーテを起き上がらせる
	local player_stand_up_L = ReadMotion_(player, "Player_stand_up_L");		// レナーテを起き上がらせるL
	
	local rena_romance = ReadMotion_(rena, "n007_romance");					// マザーから解放
	local rena_romance_L = ReadMotion_(rena, "n007_romance_L");				// 主人公の横で弱る（顔下向き）
	local rena_romance02_L = ReadMotion_(rena, "n007_romance02_L");			// 主人公の横で弱る（顔上向き）
	local rena_stand_up = ReadMotion_(rena, "n007_stand_up");				// 主人公とともに起き上がる
	local rena_talk01 = ReadMotion_(rena, "n007_talk01");					// 会話開始（手を胸にあてる）
	local rena_talk01_L = ReadMotion_(rena, "n007_talk01_L");				// 会話L（手を胸にあてる）
	local rena_mother_L = ReadMotion_(rena, "n007_mother_L");				// マザーの中のレナーテ

	local aroma_look_up_L = ReadMotion_(aroma, "n018_look_up_L");			// 上向き待機L
	local aroma_look_down_L = ReadMotion_(aroma, "n018_look_down_L");		// 下向き待機L
	local aroma_look_right_L = ReadMotion_(aroma, "n018_look_right_L");		// 右向き待機L
	local aroma_run_L = ReadMotion_(aroma, "n018_run_L");					// 走りL
	local aroma_guard_L = ReadMotion_(aroma, "n018_guard_L");				// 構えるL
	local aroma_angry = ReadMotion_(aroma, "n018_angry");					// 怒る
	local aroma_angry_L = ReadMotion_(aroma, "n018_angry_L");				// 怒るL

	local n012_cold_L = ReadMotion_(regi_m, "n012_cold_L");					// コールド明けL	
	local n013_cold_L = ReadMotion_(regi_f, "n013_cold_L");					// コールド明けL
	local n016_cold_L = ReadMotion_(woman, "n016_cold_L");					// コールド明けL
	local n017_cold_L = ReadMotion_(child, "n017_cold_L");					// コールド明けL

// ▼初期モーション
	SetMotion_(rena, rena_mother_L, BLEND_N);
	SetMotion_(player, player_look_up_L, BLEND_N);
	SetMotion_(aroma, aroma_look_up_L, BLEND_N);

// ▼カメラ設定
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");	// 150F
	DeleteTask_(task_cam);

	efc_seed000 = SetSelectBoneEffect_("ef732_26_star_seed_base02", baseObj000, ATTACH_GLOBAL);
	task_seed = Task_AnimeMoveNoFit_(baseObj000, "anm_seed000");	// 150F
	DeleteTask_(task_seed);


//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット1
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	
	PlaySE_("SE_DEM_227");
	StartDemo(FADE_COLOR_BLACK);
	
	task_seed = Task_AnimeMoveNoFit_(baseObj000, "anm_seed000");	// 150F
	Wait_(5);

	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");		// 70F

	WaitTask(task_cam);
	Wait_(10);
	DeleteTask_(task_seed);
	ChangeColorTone_(1.0, 0.0, 1.0, 1);								//色調補正「紫」
	SetEffectScale_(efc_seed000, 0.5);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット2 追加カット レナアップ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	task_cam = Task_AnimeMoveCamera_("anmeye007", "anmtgt007");		// 150F

	task_seed = Task_AnimeMoveNoFit_(baseObj000, "anm_seed003");	// 120F
	Wait_(85);
	WaitTask(task_seed);
	WaitTask(task_cam);
	efc_seed001 = SetSelectBoneEffect_("ef732_13_light_reactor01", baseObj000, ATTACH_GLOBAL);
	SetEffectScale_(efc_seed001, 0.5);
	Wait_(5);

	SetFade_(FADE_OUT, FADE_COLOR_WHITE, 10);
	WaitFade_();

	DeleteEffect_(efc_seed000);
	DeleteEffect_(efc_seed001);
	ChangeColorTone_(0.0, 0.0, 0.0, 1);
	SetPointPosNoFit_(rena, "npc_rena000");

	efc_rena = SetSelectBoneEffectSetBoneName_("ef710_05_cha_light_ren", rena, "Waist", Vec3(0.0, -9.5, -0.5));

	efc_seed001 = SetSelectBoneEffectSetBoneName_("ef732_13_light_reactor01", rena, "Waist", Vec3(0.0, -1.0, 7.5));
	SetEffectScale_(efc_seed001, 3.6);
	Wait_(40);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット3
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");	// 120F

	SetMotion_(rena, rena_romance, BLEND_N);
	SetMotionSpeed_(rena, 0.005);
	PlaySE_("SE_DEM_228");
	SetFade_(FADE_IN, FADE_COLOR_WHITE, 90);
	WaitFade_();
	Wait_(5);
	DeleteEffectEmitter_(efc_seed001);

	Wait_(20);
	SetMotionSpeed_(rena, 0.07);
	Wait_(10);
	SetMotionSpeed_(rena, 0.10);
	Wait_(10);
	SetMotionSpeed_(rena, 0.15);
	Wait_(10);
	SetMotionSpeed_(rena, 0.20);
	Wait_(10);
	SetMotionSpeed_(rena, 0.25);
	Wait_(10);
	SetMotionSpeed_(rena, 0.28);

	WaitTask(task_cam);
	SetMotion_(rena, MOT_WAIT, BLEND_N);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット4
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");	// 180F

	SetMotion_(rena, rena_romance, BLEND_N);
	SetMotionSpeed_(rena, 0.4);
	task_rena = Task_AnimeMoveNoFit_(rena, "anm_rena001");	// 190F
	task_player = Task_AnimeMove_(player, "anm_player000");	// 50F
	task_aroma = Task_AnimeMove_(aroma, "anm_aroma000");	// 50F
	DeleteTask_(task_player);
	DeleteTask_(task_aroma);
	Wait_(150);
	DeleteEffectEmitter_(efc_rena);
	WaitTask(task_cam);
	WaitTask(task_rena);

	SetMotionSpeed_(rena, 0.9);
	WaitMotion(rena);
	SetMotion_(rena, rena_romance_L, BLEND_M);

	Wait_(10);
	task_player = Task_AnimeMoveSetMotion_(player, "anm_player000", MOT_RUN, MOT_WAIT);		// 30F
	task_aroma = Task_AnimeMoveSetMotion_(aroma, "anm_aroma000", aroma_run_L, MOT_WAIT);	// 30F
	task_aroma_step = Task_PlaySe_("SE_FLD_016", 8);
	Wait_(4);

	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 25);
	WaitFade_();
	SetMotionSpeed_(aroma, 1.0);
	SetMotionSpeed_(player, 1.0);
	DeleteTask_(task_aroma);
	DeleteTask_(task_player);
	DeleteTask_(task_aroma_step);
	Wait_(35);

	SetPointPos_(player, "player001");
	SetPointPos_(rena, "npc_rena001");
	SetPointPos_(aroma, "npc_aroma001");
	Wait_(30);

	SetMotion_(rena, rena_romance_L, BLEND_N);
	SetMotionSpeed_(rena, 1.0);
	SetMotion_(aroma, aroma_look_down_L, BLEND_N);
	SetMotion_(player, player_romance, BLEND_N);
	SetMotionSpeed_(player, 1.5);
	task_player = Task_ChangeMotion_(player, player_romance_L, BLEND_S);
	Wait_(5);
	SetMotionSpeed_(player, 0.8);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット5
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");	// 210F

	SetFace_(rena, "Face_loop_close");
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
	Wait_(48);
	SetMotion_(rena, rena_romance02_L, 30);
	Wait_(10);
	SetFace_(rena, "Face_eyes_close");
	Wait_(10);
	SetMotion_(player, player_romance02_L, 18);
	SetMotionSpeed_(player, 1.0);
	Wait_(45);

	//===============================================
	// ■レナーテ
	// 「う……ん……？
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_829_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	WaitTask(task_cam);
	Wait_(15);
	DeleteTask_(task_player);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット6
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetFace_(rena, "Face_default");
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

	Wait_(10);

	//===============================================
	// ■アロマ
	// 「……寝ぼけてるの？　アタシのことを
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_829_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(10);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット7
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");

	Wait_(15);

	//===============================================
	// ■レナーテ
	// 「……あなたは　アロマ・ゲブズリン。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_829_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	Wait_(10);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■追加カット1 My name is Gevuzrin
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetAlpha_(player, ALPHA_CLEAR);
	SetAlpha_(rena, ALPHA_CLEAR);
	
	task_cam = Task_AnimeMoveCamera_("anmeye008", "anmtgt008");
	DeleteTask_(task_cam);
	
	SetMotion_(aroma, aroma_angry, BLEND_L);
	Wait_(10);
	task_cam = Task_AnimeMoveCamera_("anmeye008", "anmtgt008");
	
	PlaySE_("SE_DEM_001");													// ◆汎用・大声の演出
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", CAMERA_DEF);		// 集中線
	Wait_(10);
	
	WaitMotion(aroma);
	SetMotion_(aroma, aroma_angry_L, BLEND_L);

	//===============================================
	// ■アロマ
	// 「ゲブズリンって　言うなっ！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_829_MSG_032");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	Wait_(10);
	DeleteEffect_(efc_cam);
	SetAlpha_(player, ALPHA_EXIST);
	SetAlpha_(rena, ALPHA_EXIST);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■追加カット2 主　レナーテ「！」
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetAlpha_(aroma, ALPHA_CLEAR);
	task_cam = Task_AnimeMoveCamera_("anmeye011", "anmtgt011");
	Wait_(4);	
	PlaySE_("SE_DEM_053");																// SE「ピンッ！」
	efc_rena = SetPointWorldEffect_("ef712_10_emo_surprise01", "efc_rena000");			//「！」※モーションの都合によりBlenderで設置
	efc_player = SetPointWorldEffect_("ef712_10_emo_surprise01", "efc_player000");		//「！」※モーションの都合によりBlenderで設置
	SetEffectScale_(efc_rena, 0.4);
	SetEffectScale_(efc_player, 0.4);
	
	SetMotion_(player, Player_romance03_L, BLEND_M);						//主　アロマの方を向く
	
	WaitTask(task_cam);
	Wait_(60);
	SetAlpha_(aroma, ALPHA_EXIST);

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■追加カット3 すべずりん
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye009", "anmtgt009");
	WaitTask(task_cam);
	Wait_(90);

	DeleteTask_(task_cam);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■追加カット4 アロマ　アップ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye010", "anmtgt010");
	Wait_(30);
	efc_aroma = SetSelectBoneEffectSetOffset_("ef712_01_emo_notice01", aroma, ATTACH_EFFECT1, Vec3(0.0, 0.0, 0.0));		//気づきef
	SetMotion_(aroma, aroma_guard_L, BLEND_L);								//アロマ警戒「はッ！？」って感じで

	//===============================================
	// ■アロマ
	// 「……はっ！
	// 　ほ　本名を呼ばれるの　嫌いなのよ。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_829_MSG_034");
	KeyInputWait_();
	//===============================================
	SetMotion_(aroma, MOT_TALK, BLEND_L);
	//===============================================
	// ■アロマ
	// 「ともかく！　アタシは　いかにも
	// 　ルキヤ先生の　一番弟子だった　アロマよ
	//-----------------------------------------------
	ShowMsg_("DEMO_829_MSG_036");
	WaitMotion(aroma);
	task_aroma = Task_ChangeMotion_(aroma, MOT_TALKLOOP, BLEND_S);
	KeyInputWait_();
	//===============================================
	
	//===============================================
	// ■アロマ
	// 「そして　レジスタンスのリーダーだった
	//-----------------------------------------------
	ShowMsg_("DEMO_829_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	DeleteTask_(task_aroma);
//	SetMotion_(aroma, aroma_look_down_L, BLEND_XL);
	SetMotion_(aroma, MOT_WAIT, BLEND_XL);
	Wait_(30);
	SetMotionSpeed_(aroma, 1.0);
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■追加カット5 レナ　アップ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");
	DeleteTask_(task_cam);
	
	SetMotion_(rena, rena_romance_L, 14);
	Wait_(15);
	//===============================================
	// ■レナーテ
	// 「そう……ルキヤも　エイリアスだったのね……。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_829_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	Wait_(20);

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット8
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

	Wait_(10);
	SetMotionSpeed_(aroma, 0.8);
	SetMotion_(aroma, MOT_TALK, BLEND_L);
	task_aroma = Task_ChangeMotion_(aroma, MOT_TALKLOOP, BLEND_S);
	Wait_(20);
	SetMotionSpeed_(aroma, 1.0);

	//===============================================
	// ■アロマ
	// 「まぁ……色々と　事情があってね。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_829_MSG_060");
	KeyInputWait_();
	//===============================================
	// ■アロマ
	// 「さておき……なんとか　アンタを助けたけど……
	//-----------------------------------------------
	ShowMsg_("DEMO_829_MSG_070");
	KeyInputWait_();
	DeleteTask_(task_aroma);
	SetMotion_(aroma, aroma_look_down_L, 16);
	//===============================================
	// ■アロマ
	// 「ダークマスターの件は　さすがに　予想外でね。
	//-----------------------------------------------
	ShowMsg_("DEMO_829_MSG_080");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	Wait_(20);

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット9
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");	// 130F

	DeleteTask_(task_cam);
	SetMotion_(player, player_romance_L, BLEND_XL);
	SetActive_(aroma, false);
	Wait_(30);

	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");	// 130F

	SetMotion_(player, player_stand_up, BLEND_L);
	task_player = Task_ChangeMotion_(player, player_stand_up_L, BLEND_M);
	SetMotion_(rena, rena_stand_up, BLEND_L);
	SetMotionSpeed_(player, 0.75);
	SetMotionSpeed_(rena, 0.75);
	WaitMotion(rena);
	SetMotionSpeed_(player, 1.0);
	SetMotionSpeed_(rena, 1.0);
	SetMotion_(rena, rena_talk01, BLEND_L);
	WaitMotion(rena);
	SetMotion_(rena, rena_talk01_L, BLEND_M);

	//===============================================
	// ■レナーテ
	//「……大丈夫のようだわ。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_829_MSG_090");
	KeyInputWait_();
	//===============================================
	// ■レナーテ
	// 「ありがとう……<name_player/>　アロマ。
	//-----------------------------------------------
	ShowMsg_("DEMO_829_MSG_100");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(rena, MOT_WAIT, 12);
	Wait_(40);
	SetActive_(aroma, true);
	DeleteTask_(task_cam);
	DeleteTask_(task_player);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット10
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	task_cam = Task_AnimeMoveCamera_("anmeye005", "anmtgt005");	// 210F

	SetMotion_(player, MOT_WAIT, BLEND_N);
	SetMotion_(aroma, MOT_WAIT, BLEND_N);
	SetPointPos_(player, "player002");
	SetPointPos_(rena, "npc_rena002");
	Wait_(20);
	SetMotionSpeed_(aroma, 0.8);
	SetMotion_(aroma, MOT_TALK, BLEND_L);
	task_aroma = Task_ChangeMotion_(aroma, MOT_TALKLOOP, BLEND_S);
	Wait_(20);
	SetMotionSpeed_(aroma, 1.0);

	PlayBgm_("BGM_001");
	//===============================================
	// ■アロマ
	// 「長年　共に戦い抜いてきた同志を
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_829_MSG_110");
	KeyInputWait_();
	//===============================================
	// ■アロマ
	// 「それに　犠牲あっての勝利なんて　ゴメンよ。
	//-----------------------------------------------
	ShowMsg_("DEMO_829_MSG_120");
	KeyInputWait_();
	//===============================================
	// ■アロマ
	// 「それに……マザーを　どうにかしないと
	//-----------------------------------------------
	ShowMsg_("DEMO_829_MSG_130");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	DeleteTask_(task_aroma);
	SetMotion_(aroma, MOT_WAIT, 12);
	Wait_(25);
	SetMotion_(aroma, aroma_look_right_L, 12);
	Wait_(40);
	WaitTask(task_cam);
	Wait_(30);
	SetMotion_(child, n017_cold_L, BLEND_N);
	SetMotion_(woman, n016_cold_L, BLEND_N);
	SetMotion_(regi_f, n013_cold_L, BLEND_N);
	SetMotion_(regi_m, n012_cold_L, BLEND_N);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット11
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	task_cam = Task_AnimeMoveCamera_("anmeye006", "anmtgt006");	// 260F

	Wait_(30);

	//===============================================
	// ■アロマ
	// 「彼らは　コールドスリープしたまま
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_829_MSG_140");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	WaitTask(task_cam);
	Wait_(30);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット12
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");

	SetActive_(player, false);
	SetActive_(rena, false);
	SetDir_(aroma, -110);
	SetMotion_(aroma, aroma_look_right_L, BLEND_N);

	//===============================================
	// ■アロマ
	// 「彼らも……ずいぶん待たせてしまったわね……。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_829_MSG_150");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(aroma, MOT_WALK, 10);
	task_aroma = Task_RotateToDir_(aroma, 0, 2.85);
	task_aroma_step = Task_PlaySe_("SE_FLD_016", 15);
	WaitTask(task_aroma);
	DeleteTask_(task_aroma_step);

	SetMotionSpeed_(aroma, 0.8);
	SetMotion_(aroma, MOT_TALK, 10);
	task_aroma = Task_ChangeMotion_(aroma, MOT_TALKLOOP, BLEND_S);
	Wait_(20);
	SetMotionSpeed_(aroma, 1.0);
	SetFace_(aroma, "Face_smile");
	//===============================================
	// ■アロマ
	// 「さあ！　これからは　忙しくなるわよ？
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_829_MSG_160");
	KeyInputWait_();
	//===============================================
	// ■アロマ
	// 「あんたたちにも　たくさん働いてもらうわ！
	//-----------------------------------------------
	ShowMsg_("DEMO_829_MSG_170");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	DeleteTask_(task_aroma);
	SetMotion_(aroma, MOT_WAIT, 10);
	Wait_(35);

	EndDemo(FADE_COLOR_BLACK);
}
