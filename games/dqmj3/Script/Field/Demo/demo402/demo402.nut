//=============================================
//
//		demo402[イッタブルのハコ]
//
//=============================================

//		重厚感のある歩き
//
//----------------------------------------------------------------------------
//	引数	: chr			キャラ
//			: mot			モーション
//			: spd			モーションスピード(普通:SPEED_N、ゆっくり:SPEED_S)
//			: frm			足を付く時間(デフォルト数値)
//			: tsk			タスク名
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
const SPEED_N = 1;
const SPEED_S = 0.5;
function WalkQuake_(chr, mot, spd, frm, tsk)
{
	local m_spd = frm / spd;
	SetMotion_(chr, mot, 8);
	SetMotionSpeed_(chr, spd);
	
	local cnt = 0;
	while(!IsTaskEnd_(tsk)){
		//StartEarthQuake_(10, 3, 0.7);
		PlaySE_("SE_DEM_014");
		Wait_(m_spd);
		cnt++;
	}
	SetMotionSpeed_(chr, 1);
	
	return cnt;
}

//-------------------------------------------------------------------------
//
//		読み込み・配置
//
//-------------------------------------------------------------------------
function Update()
{
// ▼変数定義
	local task_cam, task_player, task_boy, task_ittaburu, task_box;
	local efc_player, efc_cam, efc_box, efc_aroi_a;

// ▼リソース読込
	// キャラクター
	local player = GetPlayerId_();							// 主人公
	local model_togejobo = ReadNpc_("m127_01");				// とげジョボー
	local model_saboten	 = ReadNpc_("m064_00");				// サボテンボール
	local model_dessert	 = ReadNpc_("m132_01");				// デザートタンク
	local model_ittaburu = ReadNpc_("m205_00");				// イッタブル
	// ギミック
	local model_box = ReadGimmick_("o_S01_02");				// 鉄の箱
	// エフェクト
	LoadEffect_("ef733_01_sym_shuchusen01");				// 集中線
	LoadEffect_("ef721_03_nat_smoke_n03");					// 砂煙
	LoadEffect_("ef712_13_emo_sweat01");					// 汗

// ▼配置
	// 主人公
	SetPointPos_(player, "player000");
	// 少年(スパイクヘッド)
	local boy = ArrangePointNpc_(model_togejobo, "npc_boy000");
	SetScaleSilhouette(boy, SCALE.S, 0.4);
	SetStepSePan_(boy, false);
	// アロイパーク住人Ａ
	local aroi_a = ArrangePointNpc_(model_saboten, "npc_aroi_a000");
	SetScaleSilhouette(aroi_a, SCALE.SABOTENBOUL,SILHOUETTE_WIDTH.SABOTENBOUL);
	SetAlpha_(aroi_a, ALPHA_CLEAR);
	// アロイパーク住人Ｂ
	local aroi_b = ArrangePointNpc_(model_dessert, "npc_aroi_b000");
	SetScaleSilhouette(aroi_b, SCALE.DEZATOTANKU,SILHOUETTE_WIDTH.DEZATOTANKU);
	SetAlpha_(aroi_b, ALPHA_CLEAR);
	// アロイパーク住人Ｃ
	local aroi_c = ArrangePointNpc_(model_saboten, "npc_aroi_c000");
	SetScaleSilhouette(aroi_c, SCALE.SABOTENBOUL,SILHOUETTE_WIDTH.SABOTENBOUL);
	SetAlpha_(aroi_c, ALPHA_CLEAR);
	// イッタブル
	local ittaburu = ArrangePointNpc_(model_ittaburu, "npc_ittaburu000");
	SetScale_(ittaburu, SCALE.M);
	// 鉄の箱
	local box = ArrangePointGimmick_("o_S01_02", model_box, "obj_box000");
	SetGimmickMapHitEnable_(box, false);

// ▼非常駐モーション読込
	local player_look_right_L = ReadMotion_(player, "Player_look_right_L");			// 主人公　右を向くL
	local player_nod = ReadMotion_(player, "Player_nod");							// 待機→頷き→待機
	local boy_talk_L = ReadMotion_(boy, "m127_01_talk_L");							// 少年(スパイクヘッド)　会話L
	local boy_feel_down_L = ReadMotion_(boy, "m127_01_feel_down_L");				// 少年(スパイクヘッド)　落ち込みL
	local boy_what_L = ReadMotion_(boy, "m127_01_what_L");							// 少年(スパイクヘッド)　ん？L
	local boy_irritated_L = ReadMotion_(boy, "m127_01_irritated_L");				// 少年(スパイクヘッド)　焦るL
	local aroi_a_frightened_L = ReadMotion_(aroi_a, "m064_01_Frightened_L");		// アロイパーク住人Ａ　おびえL
	local aroi_c_frightened_L = ReadMotion_(aroi_c, "m064_01_Frightened_L");		// アロイパーク住人Ｃ　おびえL
	local ittaburu_box_wait_L = ReadMotion_(ittaburu, "m205_00_box_wait_L");		// イッタブル　箱を抱え待機L
	local ittaburu_box_carry_L = ReadMotion_(ittaburu, "m205_00_box_carry_L");		// イッタブル　箱を抱えて歩きL
	local ittaburu_Pressure = ReadMotion_(ittaburu, "m205_00_Pressure");			// イッタブル　待機→威圧
	local ittaburu_Pressure_L = ReadMotion_(ittaburu, "m205_00_Pressure_L");		// イッタブル　威圧L

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット1　少年前　主人公　会話
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

// ▼カメラ設定
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	WaitFade_();
	SetMotion_(boy, boy_talk_L, BLEND_XL);					// 少年　会話L

	//===============================================
	// *少年
	// 「お兄さん　見ない顔だね？
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MONSTER_BOY");
	ShowMsg_("DEMO_412_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(boy, MOT_WAIT, BLEND_XL);					// 少年　待機
	Wait_(8);
	SetMotion_(player, player_nod, BLEND_L);				// 主人公　待機→頷き→待機
	Wait_(25);
	SetMotion_(player, MOT_WAIT, BLEND_M);					// 主人公　待機
	Wait_(15);

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット2　少年　落ち込み→ん？　アップ→ズームイン
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");

	SetMotion_(boy, boy_feel_down_L, BLEND_XL);				// 少年　落ち込みL
	Wait_(30);

	//===============================================
	// *少年
	// 「ルキヤが　どこに行ったのか　知ってるよ。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MONSTER_BOY");
	ShowMsg_("DEMO_412_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	StopBgm_(200);										//BGM停止
	
	Wait_(15);
	StopBgm_(80);
	StartDecayEarthQuake_(10, 5, 2.5);
	PlaySE_("SE_DEM_014");
	Wait_(40);
	StartDecayEarthQuake_(8, 4, 2);
	PlaySE_("SE_DEM_014");
	Wait_(40);
	StartDecayEarthQuake_(6, 3, 1.5);
	PlaySE_("SE_DEM_014");
	Wait_(15);
	local task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	SetMotion_(boy, boy_what_L, 7);							// 少年　ん？L
	Wait_(30);
	DeleteTask_(task_cam);

	PlayBgm_("BGM_007");

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット3　イッタブル　歩行→待機　足元→歩行に合わせてカメラ引き→待機でＰＡＮアップ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	InitSilhouetteWidth_(boy, 0.9);
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	task_ittaburu = Task_AnimeMove_(ittaburu, "anm_ittaburu000");
	task_box = Task_AnimeMove_(box, "anm_box000");

	SetMotion_(ittaburu, ittaburu_box_carry_L, BLEND_N);	// イッタブル　箱を抱えて歩きL
	SetMotion_(box, MOT_GIMMICK_5, BLEND_N);				// 鉄の箱　(イッタブル_箱持ち歩行)
	SetMotionSpeed_(ittaburu, 0.5);
	SetMotionSpeed_(box, 0.5);
	Wait_(33);
	StartDecayEarthQuake_(12, 6, 2.5);
	PlaySE_("SE_DEM_014");
	Wait_(27);
	SetMotion_(ittaburu, ittaburu_box_wait_L, 36);			// イッタブル　箱を抱え待機L
	SetMotion_(box, MOT_GIMMICK_4, 36);						// 鉄の箱　(イッタブル_箱持ち待機)
	StartDecayEarthQuake_(10, 5, 2);
	PlaySE_("SE_DEM_014");
	Wait_(27);
	StartDecayEarthQuake_(8, 4, 1.5);
	PlaySE_("SE_DEM_014");
	Wait_(88);

	DeleteTask_(task_box);
	DeleteTask_(task_ittaburu);
	PlaySE_("SE_DEM_026");	// ■SE:集中線
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", CAMERA_DEF);// 集中線
	Wait_(10);
	DeleteEffectEmitter_(efc_cam);
	DeleteTask_(task_cam);

	//===============================================
	// *少年
	// 「あれは……拷問王イッタブル！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MONSTER_BOY");
	ShowMsg_("DEMO_412_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット4　主人公と少年　岩陰に隠れる
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");

	SetAlpha_(aroi_a, ALPHA_EXIST);
	SetAlpha_(aroi_b, ALPHA_EXIST);
	SetAlpha_(aroi_c, ALPHA_EXIST);
	SetPointPos_(ittaburu, "npc_ittaburu000");				// イッタブル　移動した分を戻す
	SetPointPos_(box, "obj_box000");						// 鉄の箱　移動した分を戻す
	SetMotion_(player, MOT_RUN, BLEND_N);					// 主人公　走り
	SetMotion_(boy, MOT_RUN, BLEND_N);						// 少年　走り
	SetMotion_(aroi_a, aroi_a_frightened_L, BLEND_N);		// アロイパーク住人Ａ　おびえL
	SetMotion_(aroi_c, aroi_c_frightened_L, BLEND_N);		// アロイパーク住人Ｃ　おびえL
	task_player = Task_AnimeMove_(player, "anm_player000");
	task_boy = Task_AnimeMove_(boy, "anm_boy000");
	Wait_(40);
	DeleteTask_(task_player);
	task_player = Task_RotateToDirSetMotion_(player, -173, 2.5, MOT_WALK, MOT_WAIT);
	Wait_(2);
	DeleteTask_(task_boy);
	task_boy = Task_RotateToDir_(boy, -165, 2.5);
	SetMotion_(boy, MOT_WALK, BLEND_L);						// 少年　歩き
	WaitTask(task_boy);
	SetMotion_(boy, MOT_WAIT, BLEND_XL);					// 少年　待機
	DeleteTask_(task_player);
	DeleteTask_(task_boy);
	Wait_(30);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット5　イッタブル歩く　怯える住人　カメライッタブル→住人見えるまでズームアウト
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");
	SetMotion_(box, MOT_GIMMICK_5, BLEND_N);				// 鉄の箱　(イッタブル_箱持ち歩行)
	task_ittaburu = Task_AnimeMove_(ittaburu, "anm_ittaburu001");
	task_box = Task_AnimeMove_(box, "anm_box001");

	WalkQuake_(ittaburu, ittaburu_box_carry_L, 0.5, 15, task_ittaburu)
	DeleteTask_(task_ittaburu);
	DeleteTask_(task_box);

	SetMotion_(ittaburu, ittaburu_box_wait_L, BLEND_XL);	// イッタブル　箱を抱え待機L
	SetMotionSpeed_(box, 1);
	SetMotion_(box, MOT_GIMMICK_4, BLEND_XL);				// 鉄の箱　(イッタブル_箱持ち待機)
	Wait_(1);
	StartDecayEarthQuake_(8, 4, 1.5);
	PlaySE_("SE_DEM_014");
	WaitTask(task_cam);
	DeleteTask_(task_cam);
	Wait_(30);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット6　鉄の箱　地震＋砂煙　アップ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	SetPointCameraEye_("cameye003");
	SetPointCameraTarget_("camtgt003");

	SetAlpha_(ittaburu, ALPHA_CLEAR);
	SetPointPos_(box, "obj_box001");						// 鉄の箱　台座設置
	SetMotion_(box, MOT_GIMMICK_0, BLEND_N);				// 鉄の箱　(イッタブル_待機)
	efc_box = SetPointWorldEffect_("ef721_03_nat_smoke_n03", "obj_box001");// 砂煙
	SetEffectScale_(efc_box, 1.5);
	StartDecayEarthQuake_(24, 3, 3.5);
	PlaySE_("SE_DEM_074");
	Wait_(60);
	DeleteEffectEmitter_(efc_box);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット7　イッタブル　威圧　アップ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	SetPointCameraEye_("cameye004");
	SetPointCameraTarget_("camtgt004");

	SetAlpha_(ittaburu, ALPHA_EXIST);
	SetMotion_(ittaburu, MOT_WAIT, BLEND_N);				// イッタブル　待機
	Wait_(1);
	SetMotion_(ittaburu, ittaburu_Pressure_L, BLEND_XL);	// イッタブル　威圧L
	Wait_(15);

	//===============================================
	// ■イッタブル
	// 「今日も　イケニエを　迎えに参った！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ITABURU");
	ShowMsg_("DEMO_412_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット8　アロイパーク住人Ａ　おびえ　アップ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	SetPointCameraEye_("cameye005");
	SetPointCameraTarget_("camtgt005");

	SetAlpha_(player, ALPHA_CLEAR);
	SetAlpha_(boy, ALPHA_CLEAR);
	SetPointPos_(aroi_a, "npc_aroi_a001");					// アロイパーク住人Ａ　おびえカメラ位置
	efc_aroi_a = SetSelectBoneEffect_("ef712_13_emo_sweat01", aroi_a, ATTACH_EFFECT2);// 汗
	SetEffectScale_(efc_aroi_a, 3.0);

	//===============================================
	// *アロイパーク住人Ａ
	// 「わ……わかっております！
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_412_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット9　イッタブル　アップ→鉄の箱までズームアウト
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");

	DeleteEffectEmitter_(efc_aroi_a);
	SetMotion_(ittaburu, MOT_WAIT, BLEND_N);				// イッタブル　待機

	//===============================================
	// ■イッタブル
	// 「うむ！　賢明なのである。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ITABURU");
	ShowMsg_("DEMO_412_MSG_060");
	KeyInputWait_();
	//===============================================

	//===============================================
	// ■イッタブル
	// 「イケニエは　いつも通り
	//-----------------------------------------------
	ShowMsg_("DEMO_412_MSG_070");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	WaitTask(task_cam);
	DeleteTask_(task_cam);

	SetMotion_(ittaburu, MOT_WALK, BLEND_XL);				// イッタブル　歩き
	task_ittaburu = Task_RotateToDir_(ittaburu, 180, 3.0);
	SetMotionSpeed_(ittaburu,0.5);
	
	StartEarthQuake_(10, 3, 0.7);
	PlaySE_("SE_DEM_014");
	Wait_(30);
	
	StartEarthQuake_(10, 3, 0.7);
	PlaySE_("SE_DEM_014");
	Wait_(30);

	DeleteTask_(task_ittaburu);
	task_ittaburu = Task_AnimeMove_(ittaburu, "anm_ittaburu002");

	local m_spd = 15 / 0.5;
	SetMotion_(ittaburu, MOT_WALK, 8);
	SetMotionSpeed_(ittaburu, 0.5);
	
	local cnt = 0;
	while(!IsTaskEnd_(task_ittaburu)){
		StartEarthQuake_(10, 3, 0.7);
		PlaySE_("SE_DEM_014");
		Wait_(m_spd);
		cnt++;
	}

	StartEarthQuake_(10, 3, 0.7);
	PlaySE_("SE_DEM_014");
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);
	WaitFade_();
	DeleteTask_(task_ittaburu);
	SetMotion_(ittaburu, MOT_WAIT, BLEND_N);				// イッタブル　待機
	Wait_(30);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット10　主人公と少年　向き合う二人　少し二人へズームイン
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");

	SetAlpha_(ittaburu, ALPHA_CLEAR);
	SetAlpha_(aroi_c, ALPHA_CLEAR);
	SetAlpha_(player, ALPHA_EXIST);
	SetAlpha_(boy, ALPHA_EXIST);
	SetPointPos_(player, "player001");
	SetPointPos_(boy, "npc_boy001");
	SetMotion_(player, player_look_right_L, BLEND_XL);		// 主人公　右を向くL
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);
	Wait_(15);

	//===============================================
	// *少年
	// 「お兄さん　ルキヤはね……少し前に
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MONSTER_BOY");
	ShowMsg_("DEMO_412_MSG_080");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	task_boy = Task_RotateToDir_(boy, 80, 3.5);
	SetMotion_(boy, MOT_WALK, BLEND_L);						// 少年　歩き
	Wait_(9);
	SetMotion_(player, MOT_WAIT, BLEND_XL);					// 主人公　待機
	WaitTask(task_boy);
	SetMotion_(boy, MOT_WAIT, BLEND_XL);					// 少年　待機
	WaitTask(task_cam);
	DeleteTask_(task_cam);
//	Wait_(30);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット11　少年　落ち込む→ん？　アップ→ズームイン
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	InitSilhouetteWidth_(boy, 0.8);
	SetPointCameraEye_("cameye006");
	SetPointCameraTarget_("camtgt006");

	SetPointPos_(boy, "npc_boy000");
	SetDir_(boy, 120);
	SetMotion_(boy, boy_feel_down_L, BLEND_XL);				// 少年　落ち込みL
	Wait_(30);

	//===============================================
	// *少年
	// 「そのとき　イケニエに　なるはずだった
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MONSTER_BOY");
	ShowMsg_("DEMO_412_MSG_090");
	KeyInputWait_();
	//===============================================

	//===============================================
	// *少年
	// 「でも　せっかく　ルキヤが助けてくれたのに
	//-----------------------------------------------
	ShowMsg_("DEMO_412_MSG_100");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(30);
	SetMotion_(boy, boy_what_L, BLEND_XL);					// 少年　ん？L
	task_cam = Task_AnimeMoveCamera_("anmeye005", "anmtgt005");
	Wait_(15);

	//===============================================
	// *少年
	// 「ねえ……お兄さん。ここには　どうして
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MONSTER_BOY");
	ShowMsg_("DEMO_412_MSG_110");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	WaitTask(task_cam);
	DeleteTask_(task_cam);
	Wait_(15);

	EndDemo(FADE_COLOR_BLACK);
}
