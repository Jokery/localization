//=============================================
//
//		demo606[兄・アンセス]
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
	local task_cam, task_player, task_sancho, task_anses, task_slime, task_toge;
	local efc_cam, efc_player;
	local flg;		// タスクを消すかどうかフラグ

// ▼リソース読込
	// キャラクター
	local player = GetPlayerId_();					// 主人公
	local model_dark = ReadNpc_("n008");			// ダークマスター
	local model_child = ReadNpc_("n010");			// 主人公子供
	local model_sancho = ReadNpc_("n011");			// サンチョ
	local model_anses = ReadNpc_("n036");			// アンセス
	
	local model_slime = ReadNpc_("m000_00");		// スライム
	local model_break_slime = ReadNpc_("m187_00");	// 凶スライム
	local model_toge = ReadNpc_("m127_02");			// トゲジョボー
	local model_break_toge = ReadNpc_("m195_00");	// 凶トゲジョボー
	
	// エフェクト
	LoadEffect_("ef712_10_emo_surprise01");			// 「！」
	LoadEffect_("ef732_09_light_reactor_c");		// リアクターの光
	LoadEffect_("ef733_03_sym_core_dream");			// 楽園に飛ばされるとき
	LoadEffect_("ef860_01_release");				// 呪縛からの解放

// ▼配置
	// 主人公
	SetPointPos_(player, "player000");
	SetAlpha_(player, ALPHA_CLEAR);
	// ダークマスター
	local dark = ArrangePointNpc_(model_dark, "npc_dark000");
	SetPointPosNoFit_(dark, "npc_dark000");
	SetAlpha_(dark, ALPHA_CLEAR);
	// 主人公子供
	local child = ArrangePointNpc_(model_child, "player000");
	// サンチョ
	local sancho = ArrangePointNpc_(model_sancho, "npc_sancho000");
	SetScaleSilhouette(sancho, SCALE.SANCHO, SILHOUETTE_WIDTH.SANCHO);
	SetAlpha_(sancho, ALPHA_CLEAR);
	// アンセス
	local anses = ArrangePointNpc_(model_anses, "npc_anses000");
	SetFace_(anses, "Face_smile");				// 笑顔
	SetStepSe_(anses, "SE_FLD_015");
	
	// スライム
	local slime = ArrangePointNpc_(model_slime, "npc_slime000");
	SetScaleSilhouette(slime, 0.3, 0.3);
	SetAlpha_(slime, ALPHA_CLEAR);
	// 凶スライム
	local break_slime = ArrangePointNpc_(model_break_slime, "npc_slime001");
	SetScaleSilhouette(break_slime, 0.3, 0.3);
	SetAlpha_(break_slime, ALPHA_CLEAR);
	// トゲジョボー
	local toge = ArrangePointNpc_(model_toge, "npc_toge000");
	SetScaleSilhouette(toge, 0.5, 0.4);
	SetAlpha_(toge, ALPHA_CLEAR);
	// 凶トゲジョボー
	local break_toge = ArrangePointNpc_(model_break_toge, "npc_toge002");
	SetScaleSilhouette(break_toge, 0.5, 0.4);
	SetAlpha_(break_toge, ALPHA_CLEAR);

// ▼非常駐モーション読込
	// 主人公
	local player_surprise = ReadMotion_(player, "Player_surprise");			// 驚く
	local player_surprise_L = ReadMotion_(player, "Player_surprise_L");		// 驚くL
	local player_headache_L = ReadMotion_(player, "Player_headache_L");		// 頭痛L
	local player_caution01_L = ReadMotion_(player, "Player_caution01_L");	// 警戒L
	
	// 主人公子供
	local child_caution_L = ReadMotion_(child, "n010_caution_L");			// 警戒L
	local child_surprise_L = ReadMotion_(child, "n010_surprise_L");			// 驚くL
	local child_headache_L = ReadMotion_(child, "n010_headache_L");			// 頭痛L
	local child_look_around_L = ReadMotion_(child, "n010_look_around_L");	// 警戒して辺りを見回すL
	
	// アンセス
	local anses_surprise = ReadMotion_(anses, "Player_surprise");			// 驚く
	local anses_surprise_L = ReadMotion_(anses, "Player_surprise_L");		// 驚くL
	local anses_talk = ReadMotion_(anses, "Player_talk");					// しゃべり
	local anses_talk_L = ReadMotion_(anses, "Player_talk_L");				// しゃべりL
	local anses_caution01_L = ReadMotion_(anses, "Player_caution01_L");		// 警戒L
	
	// ダークマスター
	local dark_surprise_L = ReadMotion_(dark, "n008_surprise_L");			// 驚くL

// ▼カメラ設定
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");		// 80F

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	// ▼カット１＠アンセスにズームイン～～～～～～～～～～～～
	Wait_(15);
	
	SetMotion_(anses, MOT_WALK, BLEND_L);
	Wait_(5);
	task_anses = Task_RotateToDir_(anses, -136, ROTATE_DEMO_DEF);
	WaitTask(task_anses);
	
	SetMotion_(anses, anses_talk, BLEND_M);			// しゃべり
	WaitMotion(anses);
	SetMotion_(anses, anses_talk_L, BLEND_M);		// しゃべりL
	
	//===============================================
	// ■アンセス
	// 「おはよう　<name_player/>！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ANSESU");
	ShowMsg_("DEMO_606_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(anses, MOT_WAIT, BLEND_N);
	DeleteTask_(task_cam);
	
	
	// ▼カット２＠主人公ＵＰ～～～～～～～～～～～～～～～～～
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	
	SurpriseDispSetOffset(child, Vec3(0.0, 0.2, 0.0), 0.4);
	SetMotion_(child, child_caution_L, BLEND_M);		// 警戒L
	SetFace_(child, "Face_surprise");					// 驚き顔
	Wait_(30);
	
	
	// ▼カット３＠アンセスと子供主人公～～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");		// 0F目
	DeleteTask_(task_cam);
	
	SetMotion_(anses, anses_talk, BLEND_M);			// しゃべり
	WaitMotion(anses);
	SetMotion_(anses, anses_talk_L, BLEND_M);		// しゃべりL
	
	//===============================================
	// ■アンセス
	// 「あん？　どうしたんだよ？
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ANSESU");
	ShowMsg_("DEMO_606_MSG_020");
	KeyInputWait_();
	
	//-----------------------------------------------
	// ▽
	// 「オレは　ちゃんと　ここにいるぞ。
	//-----------------------------------------------
	ShowMsg_("DEMO_606_MSG_030");
	KeyInputWait_();
	
	// ズームアウト
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");		// 150F
	
	//-----------------------------------------------
	// ▽
	// 「もう　オレは　どこにも行きやしない。
	//-----------------------------------------------
	ShowMsg_("DEMO_606_MSG_040");
	KeyInputWait_();
	
	task_slime = Task_AnimeMoveSetMotion_(slime, "anm_slime000", MOT_WALK, MOT_WAIT);
	task_toge = Task_AnimeMoveSetMotion_(toge, "anm_toge000", MOT_WALK, MOT_WAIT);
	task_sancho = Task_AnimeMoveSetMotion_(sancho, "anm_sancho000", MOT_WALK, MOT_WAIT);
	SetAlpha_(slime, ALPHA_EXIST);
	SetAlpha_(toge, ALPHA_EXIST);
	SetAlpha_(sancho, ALPHA_EXIST);
	
	//-----------------------------------------------
	// ▽
	// 「それとも……。
	//-----------------------------------------------
	ShowMsg_("DEMO_606_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(anses, MOT_WAIT, BLEND_XL);
	WaitTask(task_cam);
	WaitTask(task_slime);
	WaitTask(task_toge);
	WaitTask(task_sancho);
	Wait_(60);
	
//	SetFace_(anses, "Face_default");
	SetAlpha_(slime, ALPHA_CLEAR);
	SetAlpha_(toge, ALPHA_CLEAR);
	SetAlpha_(sancho, ALPHA_CLEAR);
	
	
	// ▼カット４＠子供主人公ズームイン～～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");		// 90F
	
	//===============================================
	// ■アンセス
	// 「お前は　この楽園が　イヤなのか？
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ANSESU");
	ShowMsg_("DEMO_606_MSG_060");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	efc_cam = SetCameraEffect_("ef733_03_sym_core_dream", 300);
	PlaySE_("SE_DEM_143");
	Wait_(70);
	
	//=====
	StartBlurEffect_();
	StartEarthQuake_(150, 150, 1);
	SetMotion_(child, child_headache_L, BLEND_L);		// 頭痛L
	SetFace_(child, "Face_loop_close02");				// 目閉じ（笑ってない）
	Wait_(60);
	
	StopEarthQuake_();
	DeleteTask_(task_cam);
	
	
	// ▼カット５＠アンセスからダークマスターへ変身～～～～～～
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	
	// ☆アンセスOut
	StartEarthQuake_(150, 150, 1);
	PlaySE_("SE_DEM_097");
	SetAlphaFade(anses, 0.3, 90);
	
	Wait_(5);
	
	// ★ダークマスターIn
	efc_cam = SetCameraEffect_("ef860_01_release", 30);
	SetAlpha_(anses, ALPHA_CLEAR);
	SetAlphaFade(dark, 1.0, 45);
	
	Wait_(20);
	
	SetMotion_(child, child_look_around_L, BLEND_N);		// 警戒して辺りを見回すL
	SetFace_(child, "Face_default");
	SetPointPos_(dark, "npc_dark000");
	SetPointPos_(toge, "npc_toge002");
	SetPointPos_(sancho, "npc_sancho003");
	SetAlpha_(slime, ALPHA_EXIST);
	SetAlpha_(toge, ALPHA_EXIST);
	SetAlpha_(sancho, ALPHA_EXIST);
	StopEarthQuake_();
	
	
	// ▼カット６＠子供主人公を中心にぐるっと写す～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");		// 300F
	SetDirToObject_(sancho, player);
	Wait_(30);
	
	// ☆通常Out
	task_slime = Task_ObjectFadeOut_(slime, 30);
	task_toge = Task_ObjectFadeOut_(toge, 30);
	Wait_(15);
	
	// ★ブレイクIn
	efc_cam = SetCameraEffect_("ef860_01_release", 30);
	Wait_(5);
	
	DeleteTask_(task_slime);
	DeleteTask_(task_toge);
	SetAlpha_(slime, ALPHA_CLEAR);
	SetAlpha_(toge, ALPHA_CLEAR);
	SetAlpha_(break_slime, 0.1);
	SetAlpha_(break_toge, 0.3);
	task_slime = Task_ObjectFadeIn_(break_slime, 90);
	task_toge = Task_ObjectFadeIn_(break_toge, 45);
	Wait_(45);
	
	// ★ブレイクOut
	DeleteTask_(task_slime);
	DeleteTask_(task_toge);
	task_slime = Task_ObjectFadeOut_(break_slime, 30);
	task_toge = Task_ObjectFadeOut_(break_toge, 30);
	Wait_(15);
	
	// ☆通常In
	efc_cam = SetCameraEffect_("ef860_01_release", 30);
	Wait_(5);
	
	DeleteTask_(task_slime);
	DeleteTask_(task_toge);
	SetAlpha_(slime, 0.3);
	SetAlpha_(toge, 0.4);
	SetAlpha_(break_slime, ALPHA_CLEAR);
	SetAlpha_(break_toge, ALPHA_CLEAR);
	task_slime = Task_ObjectFadeIn_(slime, 45);
	task_toge = Task_ObjectFadeIn_(toge, 45);
	Wait_(35);
	
	// ☆通常Out
	DeleteTask_(task_slime);
	DeleteTask_(task_toge);
	task_slime = Task_ObjectFadeOut_(slime, 30);
	task_toge = Task_ObjectFadeOut_(toge, 30);
	Wait_(20);
	
	// ★ブレイクIn
	efc_cam = SetCameraEffect_("ef860_01_release", 30);
	Wait_(5);
	
	DeleteTask_(task_slime);
	DeleteTask_(task_toge);
	SetAlpha_(slime, ALPHA_CLEAR);
	SetAlpha_(toge, ALPHA_CLEAR);
	SetAlpha_(break_slime, 0.15);
	SetAlpha_(break_toge, 0.3);
	task_slime = Task_ObjectFadeIn_(break_slime, 120);
	task_toge = Task_ObjectFadeIn_(break_toge, 90);
	Wait_(125);		// カット６のWaitの合計が 300F になるように調整する
	
	SetPointPosNoFit_(dark, "npc_dark000");
	SetAlpha_(break_slime, ALPHA_CLEAR);
	SetAlpha_(break_toge, ALPHA_CLEAR);
	DeleteTask_(task_cam);
	
	
	// ▼カット７＠ダークマスターからアンセスへ変身～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");		// 0F目
	DeleteTask_(task_cam);
	
	// ★ダークマスターOut
	StartEarthQuake_(150, 150, 1);
	PlaySE_("SE_DEM_097");
	SetAlphaFade(dark, 0.31, 90);
	
	Wait_(5);
	
	// ☆アンセスIn
	efc_cam = SetCameraEffect_("ef860_01_release", 30);
	SetAlpha_(dark, ALPHA_CLEAR);
	SetAlphaFade(anses, 1.0, 55);
	StopEarthQuake_();
	EndBlurEffect_();
	//=====
	
	// ズームイン
	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");		// 75F
	
	SetMotion_(anses, anses_talk, BLEND_XL);			// しゃべり
	SetFace_(anses, "Face_smile");					// 笑顔
	WaitMotion(anses);
	SetMotion_(anses, anses_talk_L, BLEND_M);		// しゃべりL
	
	//===============================================
	// ■アンセス
	// 「迷うことは　ないだろう……？
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ANSESU");
	ShowMsg_("DEMO_606_MSG_070");
	KeyInputWait_();
	//-----------------------------------------------
	// ▽
	// 「ずっと　ここにいれば　いい。
	//-----------------------------------------------
	ShowMsg_("DEMO_606_MSG_080");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetPointPos_(slime, "npc_slime002");
	SetPointPos_(toge, "npc_toge000");
	SetPointPos_(sancho, "npc_sancho002");
	SetDir_(toge, 75);
	SetMotion_(anses, MOT_WAIT, BLEND_N);
	
	SetAlpha_(child, ALPHA_CLEAR);
	SetAlpha_(slime, ALPHA_EXIST);
	SetAlpha_(toge, ALPHA_EXIST);
	SetAlpha_(sancho, ALPHA_EXIST);
	DeleteTask_(task_cam);
	
	
	// ▼カット８＠サンチョとモンスター達～～～～～～～～～～～
	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");
	
	task_sancho = Task_MoveToPointSetSpeed_(sancho, "npc_sancho003", 0.5);
	WaitTask(task_sancho);
	
	MotionTalk(sancho);
	
	//===============================================
	// ■サンチョ
	// 「アンセスさまの　言うとおりデス。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_SANCHO");
	ShowMsg_("DEMO_606_MSG_090");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(sancho, MOT_WAIT, BLEND_L);
	SetMotion_(slime, MOT_WALK, BLEND_M);
	
	//===============================================
	// *スライム
	// 「ボクたちも　一緒だよ！
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_606_MSG_100");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(child, child_caution_L, BLEND_N);		// 警戒L
	SetMotion_(sancho, MOT_WAIT, BLEND_N);
	SetMotion_(slime, MOT_WAIT, BLEND_N);
	SetAlpha_(child, ALPHA_EXIST);
	SetAlpha_(slime, ALPHA_CLEAR);
	SetAlpha_(toge, ALPHA_CLEAR);
	SetAlpha_(sancho, ALPHA_CLEAR);
	
	
	// ▼カット９＠アンセスと子供主人公～～～～～～～～～～～～
	SetPointCameraEye_("cameye003");
	SetPointCameraTarget_("camtgt003");
	
	MotionTalk(anses);
	
	//===============================================
	// ■アンセス
	// 「それとも……もしかして　お前は
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ANSESU");
	ShowMsg_("DEMO_606_MSG_110");
	SetFace_(anses, "Face_default");	
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	// ▼カット10＠アンセスＵＰ～～～～～～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye008", "anmtgt008");		// 120F

	//===============================================
	// ■アンセス
	// 「……レナーテなんて　ここには　いない。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ANSESU");
	ShowMsg_("DEMO_606_MSG_120");
	KeyInputWait_();
	
	//-----------------------------------------------
	// ▽
	// 「あいつが……レナーテが　いたから　
	//-----------------------------------------------
	ShowMsg_("DEMO_606_MSG_130");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	DeleteTask_(task_cam);
	
	// ▼カット11＠子供主人公ズームイン～～～～～～～～～～～～
	SetFace_(child, "Face_surprise");					// 驚き顔
	task_cam = Task_AnimeMoveCamera_("anmeye005", "anmtgt005");		// 180F
	
	//===============================================
	// ■アンセス
	// 「お前は　あいつと関わるべきじゃ　なかった。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ANSESU");
	ShowMsg_("DEMO_606_MSG_140");
	KeyInputWait_();
	
	while(true)
	{
		//-----------------------------------------------
		// ▽
		// 「忘れろ　<name_player/>！
		//-----------------------------------------------
		ShowMsg_("DEMO_606_MSG_150");
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================
		
		// 初回のみ、task_cam を消す
		if(!flg) {
			DeleteTask_(task_cam);
			flg = true;
		}
		
		// 【いいえの場合】 → ループを抜ける
		if (GetQueryResult_() == QUERY2_1) {
			break;
		}
		// 【はいの場合】
		else {
			SetMotion_(child, child_headache_L, BLEND_L);		// 頭痛L
			SetFace_(child, "Face_loop_close02");				// 目閉じ（笑ってない）
			
			//=====
			StartBlurEffect_();
			StartEarthQuake_(90, 90, 1.5);
			
			Wait_(90);
			
			StopEarthQuake_();
			EndBlurEffect_();
			//=====
			
			SetMotion_(child, child_caution_L, BLEND_L);		// 警戒L
			SetFace_(child, "Face_surprise");
			Wait_(10);
			
			//===============================================
			// ■アンセス
			// 「<name_player/>　忘れてしまえ！
			//-----------------------------------------------
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_ANSESU");
			ShowMsg_("DEMO_606_MSG_160");
			KeyInputWait_();
			CloseMsgWnd_();
			//===============================================
			
			SetMotion_(child, child_headache_L, BLEND_L);		// 頭痛L
			SetFace_(child, "Face_loop_close02");				// 目閉じ（笑ってない）
			
			//=====
			StartBlurEffect_();
			StartEarthQuake_(90, 90, 1.5);
			
			Wait_(90);
			
			StopEarthQuake_();
			EndBlurEffect_();
			//=====
			
			SetMotion_(child, child_caution_L, BLEND_L);		// 警戒L
			SetFace_(child, "Face_surprise");
			Wait_(10);
			
			//===============================================
			// ■アンセス
			// 「忘れろ　<name_player/>！」へループする
			//-----------------------------------------------
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_ANSESU");
		}
	}
	
	efc_cam = SetCameraEffect_("ef733_03_sym_core_dream", 300);
	PlaySE_("SE_DEM_143");
	Wait_(70);
	
	SetPointPos_(toge, "npc_toge003");
	SetPointPos_(sancho, "npc_sancho004");
	SetMotion_(anses, MOT_WAIT, BLEND_N);
	SetAlpha_(slime, ALPHA_EXIST);
	SetAlpha_(toge, ALPHA_EXIST);
	SetAlpha_(sancho, ALPHA_EXIST);
	
	
	// ▼カット12＠主人公、子供から大人へ変身する～～～～～～～
	SetPointCameraEye_("cameye005");
	SetPointCameraTarget_("camtgt005");
	
	//=====
	StartBlurEffect_();
	StartEarthQuake_(150, 150, 1);
	
	SetMotion_(player, player_headache_L, BLEND_L);		// 頭痛L
	SetMotion_(child, child_headache_L, BLEND_L);		// 頭痛L
	SetFace_(player, "Face_loop_close");				// 目閉じ
	SetFace_(child, "Face_loop_close02");				// 目閉じ（笑ってない）
	
	// 子供Out
	StartEarthQuake_(150, 150, 1);
	PlaySE_("SE_DEM_097");
	SetAlphaFade(child, 0.3, 90);
	
	Wait_(5);
	
	// 大人In
	efc_cam = SetCameraEffect_("ef860_01_release", 30);
	SetAlpha_(child, ALPHA_CLEAR);
	SetAlphaFade(player, 1.0, 55);
	
	StopEarthQuake_();
	EndBlurEffect_();
	//=====
	
	SetMotion_(player, player_caution01_L, BLEND_L);	// 警戒L
	SetFace_(player, "Face_default");
	Wait_(5);
	
	SurpriseDispSetOffset(anses, Vec3(0.0, 0.0, 0.0), 0.7);
	SetMotion_(anses, anses_surprise, BLEND_M);			// 驚く
	WaitMotion(anses);
	SetMotion_(anses, anses_surprise_L, BLEND_M);		// 驚くL
	
	//===============================================
	// ■アンセス
	// 「なっ……！？
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ANSESU");
	ShowMsg_("DEMO_606_MSG_170");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetPointPos_(dark, "npc_dark000");
	
	
	// ▼カット13＠アンセスからダークマスターへ変身～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye006", "anmtgt006");		// 0F目
	DeleteTask_(task_cam);
	
	SetMotion_(anses, anses_caution01_L, BLEND_L);		// 警戒L
	SetMotion_(dark, dark_surprise_L, BLEND_L);			// 驚くL
	
	//=====
	// ☆アンセスOut
	StartBlurEffect_();
	StartEarthQuake_(205, 205, 1);
	PlaySE_("SE_DEM_097");
	SetAlphaFade(anses, 0.3, 90);
	Wait_(5);
	
	// ★ダークマスターIn
	efc_cam = SetCameraEffect_("ef860_01_release", 30);
	SetAlpha_(anses, ALPHA_CLEAR);
	SetAlphaFade(dark, 0.99, 45);
	
	// ★ダークマスターOut
	SetAlphaFade(dark, 0.3, 15);
	
	// ☆アンセスIn
	SetCameraEffect_("ef860_01_release", 30);
	SetAlpha_(anses, ALPHA_EXIST);
	SetAlpha_(dark, ALPHA_CLEAR);
	SetAlphaFade(anses, 1.0, 45);
	Wait_(5);
	
	StopEarthQuake_();
	EndBlurEffect_();
	//=====
	
	SetSelectBoneEffectSetOffset_("ef732_09_light_reactor_c", player, ATTACH_EFFECT1, Vec3(0.0, -2.0, 0.0));
	PlaySE_("SE_FLD_135");		// リアクター反応音
	
	//===============================================
	// ■リアクター
	// 「周囲の人物から　異常を感知しました。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_REACTOR");
	ShowMsg_("DEMO_606_MSG_180");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	// ズームイン
	task_cam = Task_AnimeMoveCamera_("anmeye006", "anmtgt006");		// 60F
	WaitTask(task_cam);
	
	//===============================================
	// ■リアクター
	// 「くり返します。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_REACTOR");
	ShowMsg_("DEMO_606_MSG_190");
	KeyInputWait_();
	
	//-----------------------------------------------
	// ▽
	// 「周囲の人物から　異常を感知しました。
	//-----------------------------------------------
	ShowMsg_("DEMO_606_MSG_200");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	EndDemo(FADE_COLOR_BLACK);
}
