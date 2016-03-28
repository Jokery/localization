//=============================================
//
//		demo016[ジャックとの出会い]
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
	local task_cam, task_jack, task_box;
	local efc_cam, efc_jack;
	
// ▼モデル読込
	// ギミック
	local model_box = ReadGimmick_("o_dem_12");		// 木箱
	local model_stick = ReadGimmick_("o_dem_13");	// ジャックが持つ木の棒
	// キャラクター
	local player = GetPlayerId_();					// 主人公
	local model_jack = ReadNpc_("n001");			// ジャック
	local model_nocho = ReadNpc_("n043");			// ノチョリン
	local model_ace = ReadNpc_("n002");				// エース
	// エフェクト
	LoadEffect_("ef733_01_sym_shuchusen01");				// 集中線
	LoadEffect_("ef712_13_emo_sweat01");			// 汗

// ▼配置
	// 木箱
	local box = ArrangePointGimmick_("o_dem_12", model_box, "obj_box000");
	// ジャックが持つ木の棒
	local stick = ArrangePointGimmick_("o_dem_13", model_stick, "npc_jack000");
	// 主人公
	SetPointPos_(player, "player000");
	// ジャック
	local jack = ArrangePointNpc_(model_jack, "npc_jack000");
	SetAlpha_(jack, ALPHA_CLEAR);
	// ノチョーラ
	local nocho = ArrangePointNpc_(model_nocho, "npc_nocho000");
	// エース
	local ace = ArrangePointNpc_(model_ace, "npc_ace000");
	SetAlpha_(ace, ALPHA_CLEAR);
	
// ▼非常駐モーション読込
	// 主人公
	local Player_look_left_L = ReadMotion_(player, "Player_look_left_L");	// 左を見る
	local Player_look_right_L = ReadMotion_(player, "Player_look_right_L");	// 右を見る
	local Player_look_down_L = ReadMotion_(player, "Player_look_down_L");	// 下を見る
	local Player_nod = ReadMotion_(player, "Player_nod");					// 待機→うなづく→待機
	// ジャック
	local jack_scary_L = ReadMotion_(jack, "n001_scary_L");					// ジャックうずくまり怯える
	local jack_resolution = ReadMotion_(jack, "n001_resolution");			// ジャックうずくまり怯える→覚悟を決める
	local jack_resolution_L = ReadMotion_(jack, "n001_resolution_L");		// ジャック覚悟を決める
	local jack_run_L = ReadMotion_(jack, "n001_run_L");						// ジャック走る
	local jack_look_player = ReadMotion_(jack, "n001_look_player");			// ジャック主人公を見る
	local jack_look_player_L = ReadMotion_(jack, "n001_look_player_L");		// ジャック主人公を見るL
	local jack_anger_L = ReadMotion_(jack, "n001_anger_L");					// ジャック怒りL
	local jack_talk02 = ReadMotion_(jack, "n001_talk02");					// ジャック考える→会話（嬉しそう）
	local jack_talk02_L = ReadMotion_(jack, "n001_talk02_L");				// ジャック会話（嬉しそう）
	local jack_jump = ReadMotion_(jack, "n002_jump");						// ジャック飛び出す
	local jack_impatience_L = ReadMotion_(jack, "n001_impatience_L");		// ジャック焦る	
	local jack_battle_L = ReadMotion_(jack, "n001_battle_L");				// ジャック攻撃L
	// ノチョーラ
	local nocho_show_face = ReadMotion_(nocho, "n000_show_face");			// モブ通常待機→顔を出す
	local nocho_show_face_L = ReadMotion_(nocho, "n000_show_face_L");		// モブ顔を出す
	local nocho_stand_right_L = ReadMotion_(nocho, "n000_stand_right_L");	// モブ主人公を見るL
	local nocho_talk_joy_L = ReadMotion_(nocho, "n000_talk_joy_L");			// モブ会話（嬉しそう）
	local nocho_think02_L = ReadMotion_(nocho, "n000_think02_L");			// モブ考える
	
// ▼初期モーション設定
	SetMotion_(jack, jack_scary_L, BLEND_N);
	
// ▼カメラ設定
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------
	
	StartDemo(FADE_COLOR_BLACK);
	
	//===============================================
	// *ジャック
	// 「もはや　これまでですちょー！
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_016_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(box, MOT_GIMMICK_1, BLEND_N);		// ガタガタ
	PlaySE_("SE_DEM_016");							//■SE:ジャック登場
	Wait_(30);
	
	WaitTask(task_cam);
	DeleteTask_(task_cam);
	
	SetAlpha_(jack, ALPHA_EXIST);
	SetMotion_(jack, jack_jump, BLEND_M);			// ジャック飛び出す
	SetMotion_(box, MOT_GIMMICK_0, BLEND_N);		// 通常
	
	task_jack = Task_AnimeMoveNoFit_(jack, "anm_jack000");
	
	// ジャック飛び出す
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");		// 20F
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", CAMERA_DEF);		// 集中線
	
	Wait_(10);
	
	//白フェード
	//----------------------------------------------------------------
	SetFade_(FADE_OUT, FADE_COLOR_WHITE, 10);
	WaitFade_();
	
	SetAlpha_(player, ALPHA_CLEAR);
	SetAlpha_(nocho, ALPHA_CLEAR);
	SetActive_(box, false);
	
	DeleteEffect_(efc_cam);
	DeleteTask_(task_cam);
	DeleteTask_(task_jack);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット２
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	
	Wait_(15);
	
	SetPointPos_(jack, "npc_jack000");
	SetMotion_(jack, jack_battle_L, BLEND_N);		// 攻撃L
	SetMotion_(stick, MOT_GIMMICK_1, BLEND_N);		// ジャックが持つ
	
//	efc_jack = SetSelectBoneEffect_("ef712_13_emo_sweat01", jack, ATTACH_EFFECT1);	
	efc_jack = SetSelectBoneEffectSetOffset_("ef712_13_emo_sweat01", jack, ATTACH_EFFECT1, Vec3(-0.2, 1.7, -1.5));
	SetEffectScale_(efc_jack, 1.1);
	
	SetFade_(FADE_IN, FADE_COLOR_WHITE, 30);
	//----------------------------------------------------------------
	
	Wait_(45);
	
	SetAlpha_(player, ALPHA_EXIST);
	SetAlpha_(nocho, ALPHA_EXIST);
	
	DeleteEffect_(efc_jack);
	SetMotion_(stick, MOT_GIMMICK_0, BLEND_N);		// 地面に落ちてる
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット３
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	
	SetMotion_(nocho, nocho_show_face, BLEND_M);
	WaitMotion(nocho);
	SetMotion_(nocho, nocho_show_face_L, BLEND_M);
	
	SetMotion_(player, Player_look_left_L, BLEND_L);
	
	//===============================================
	// *ノチョーラ
	//「落ち着くっちょ　ジャック。
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_016_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetDir_(jack, -24);
	SetDirToObject_(player, jack);
	SetDirToObject_(nocho, jack);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット４
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");
	
	SetMotion_(jack, jack_run_L, BLEND_N);
	
	task_jack = Task_MoveForward_(jack, 0.8, true);
	PlaySE_("SE_FLD_011");
	Wait_(9);
	PlaySE_("SE_FLD_011");
	
	DeleteTask_(task_jack);
	
	SetMotion_(jack, MOT_TALKLOOP, BLEND_M);
	
	//===============================================
	// ■ジャック
	// 「お……おお！　よくぞ無事に
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_JACK");
	ShowMsg_("DEMO_016_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(jack, MOT_WAIT, BLEND_M);
	
	//============
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
	
	SetPointPos_(player, "player001");
	SetPointPos_(jack, "npc_jack001");
	SetPointPos_(nocho, "npc_nocho001");
	SetMotion_(player, MOT_WAIT, BLEND_N);
	SetMotion_(nocho, MOT_WAIT, BLEND_N);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット５
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");
	
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
	//============
	
	Wait_(30);
	
	SetMotion_(jack, MOT_TALKLOOP, BLEND_M);
	SetMotion_(player, Player_look_right_L, BLEND_L);		// 右を見る
	
	//===============================================
	// ■ジャック
	// 「さすがは　はやてのノチョリン。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_JACK");
	ShowMsg_("DEMO_016_MSG_040");
	KeyInputWait_();
	//-----------------------------------------------
	// ▽
	// 「なるほど……一緒に　さらわれた
	//-----------------------------------------------
	ShowMsg_("DEMO_016_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(jack, MOT_WAIT, BLEND_M);
	SetMotion_(nocho, nocho_think02_L, BLEND_L);
	SetMotion_(player, Player_look_left_L, BLEND_L);		// 左を見る
	
	//===============================================
	// ■ノチョリン
	// 「キングの　あの身体では　逃げられないっちょ。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_NOCHORIN");
	ShowMsg_("DEMO_016_MSG_060");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット６
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetPointCameraEye_("cameye003");
	SetPointCameraTarget_("camtgt003");
	
	DeleteTask_(task_cam);
	
	SetMotion_(jack, jack_anger_L, BLEND_N);
	SetMotion_(nocho, MOT_WAIT, BLEND_M);
	
	//===============================================
	// ■ジャック
	// 「ああ！　おいたわしや　ノチョーラキング！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_JACK");
	ShowMsg_("DEMO_016_MSG_070");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット７
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetPointCameraEye_("cameye004");
	SetPointCameraTarget_("camtgt004");
	
	SetDir_(jack, 168);
	SetDir_(player, 77);
	SetDir_(nocho, -7);
	
	SetMotion_(player, Player_look_down_L, BLEND_N);		// 下を見る
	SetMotion_(nocho, nocho_talk_joy_L, BLEND_M);
	
	//===============================================
	// ■ノチョリン
	// 「なげくなっちょ　ジャック！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_NOCHORIN");
	ShowMsg_("DEMO_016_MSG_080");
	KeyInputWait_();
	CloseMsgWnd_();
	Wait_(10);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット８
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");
	Wait_(10);	
	//-----------------------------------------------
	// ▽
	// 「<name_player/>は　モンスタマスター。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_NOCHORIN");
	ShowMsg_("DEMO_016_MSG_090");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	DeleteTask_(task_cam);
	
	SetDir_(player, 50);
	
	SetMotion_(player, MOT_WAIT, BLEND_N);
	SetMotion_(nocho, MOT_WAIT, BLEND_N);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット９
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");
	
	SetMotion_(jack, jack_look_player, BLEND_L);						// 主人公を見る
	
	task_jack = Task_ChangeMotion_(jack, jack_look_player_L, BLEND_M);	// 主人公を見るLOOP
	
	//===============================================
	// ■ジャック
	// 「おおっ！　あなたが　キングを
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_JACK");
	ShowMsg_("DEMO_016_MSG_100");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	DeleteTask_(task_cam);
	
	SetMotion_(player, Player_nod, BLEND_L);		// 待機→うなづく→待機
	WaitMotion(player);
	SetMotion_(player, MOT_WAIT, BLEND_L);
	
	DeleteTask_(task_jack);
	
	task_jack = Task_WalkAroundToPos(jack, GetPos_(player), ROTATE_DEMO_DEF);
	WaitTask(task_jack);
	DeleteTask_(task_jack);
	
	SetMotion_(jack, jack_talk02, BLEND_M);
	WaitMotion(jack);
	SetMotion_(jack, jack_talk02_L, BLEND_M);
	
	//===============================================
	// ■ジャック
	// 「なんと　ありがたい！　なんと　頼もしい！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_JACK");
	ShowMsg_("DEMO_016_MSG_110");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(nocho, nocho_stand_right_L, BLEND_M);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット９
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");
	
	SetAlpha_(ace, ALPHA_EXIST);
	
	Wait_(30);
	
	SetMotion_(jack, MOT_TALKLOOP, BLEND_M);
	
	//===============================================
	// ■ジャック
	// 「それでは　まずは　あそこにいる　エースという・・
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_JACK");
	ShowMsg_("DEMO_016_MSG_120");
	KeyInputWait_();
	//-----------------------------------------------
	// ▽
	//「ヤツの知恵は　必ずや
	//-----------------------------------------------
	ShowMsg_("DEMO_016_MSG_130");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(jack, MOT_WAIT, BLEND_M);
	
	EndDemo(FADE_COLOR_BLACK);
}