//=============================================
//
//		demo804[アロマとキングの邂逅]
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
	local task_cam, task_player, task_aroma, task_king;
	local task_aroma_step;
	local efc_king;
	
// ▼フラグ設定
	local bit_game_over = GetEventFlg_("BFG_CHECK_SAME_TIME_DEAD_AND_DEMO_1");		// Bit_1087 全滅復帰とDemo804[アロマとキングの邂逅]が重なった時に立てるフラグ
	
// ▼リソース読込
	// ギミック
	local model_elevator = ReadGimmick_("o_A01_00");						// エレベーター扉
	local model_mixture = ReadGimmick_("o_A01_02");							// 配合装置
	// キャラクター
	local player = GetPlayerId_();
	local model_aroma = ReadNpc_("n018");									// アロマ
	local model_king = ReadNpc_("n003");									// キング
	local model_jack = ReadNpc_("n001");									// ジャック
	local model_queen = ReadNpc_("n005");									// クイーン
	// エフェクト
	LoadEffect_("ef712_10_emo_surprise01");									// 「！」

// ▼配置
	SetPointPos_(player, "player000");
	local aroma = ArrangePointNpc_(model_aroma, "npc_aroma000");
	SetStepSe_(aroma, SILENT_STEP_SE);
	local king = ArrangePointNpc_(model_king, "npc_king000");
	local queen = ArrangePointNpc_(model_queen, "npc_queen000");
	local jack = ArrangePointNpc_(model_jack, "npc_jack000");

	// エレベーター扉（左）
	local elevator_left = ArrangePointGimmick_("o_A01_00", model_elevator, "obj_elevator000");
	// エレベーター扉（右）
	local elevator_right = ArrangePointGimmick_("o_A01_00", model_elevator, "obj_elevator100");
	// 配合装置
	local mixture = ArrangePointGimmick_("o_A01_02", model_mixture, "obj_mixture000");
	SetMotion_(mixture, MOT_GIMMICK_2, BLEND_N);

// ▼非常駐モーション読込
	// 主人公
	local look_left_L = ReadMotion_(player, "Player_look_left_L");			// 顔を少し左向ける
	local player_nod = ReadMotion_(player, "Player_nod");					// 頷き
	// キング
	local king_talk = ReadMotion_(king, "n003_talk");						// 待機→会話
	local king_talk_L = ReadMotion_(king, "n003_talk_L");					// 会話L
	local king_surprise = ReadMotion_(king, "n003_surprise");				// 待機→驚き
	local king_surprise_L = ReadMotion_(king, "n003_surprise_L");			// 驚きL
	local king_think = ReadMotion_(king, "n003_think");						// 待機→考える
	local king_think_L = ReadMotion_(king, "n003_think_L");					// 考えるL
	local king_nod = ReadMotion_(king, "n003_nod");							// 頷く
	// アロマ
	local aroma_look_right_L = ReadMotion_(aroma, "n018_look_right_L");		// 右向き待機L

	
//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	// ■■■■■■■■■■■■■■■■【全滅復帰と被った場合】■■■■■■■■■■■■■■■■
	if(bit_game_over)
	{
		//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
		//■カット１　主人公とアロマとキング（主　アロマの歩くシーンをカット）
		//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
		SetPointCameraEye_("cameye001");
		SetPointCameraTarget_("camtgt001");

		StartDemo(FADE_COLOR_BLACK);
		Wait_(20);
		//===============================================
		//■キング
		//「おおっ！　<name_player/>か！
		//　今日は　どうした？　何用であるか？
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_KING");
		ShowMsg_("DEMO_804_MSG_010");
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================

		SetMotion_(king, MOT_WAIT, BLEND_XL);									// キング　待機
		Wait_(10);
		SetMotion_(aroma, MOT_TALK, BLEND_L);									// アロマ　会話

		//===============================================
		//■アロマ
		//「キング　久しぶり！
		//　相変わらず　でっかいわね　アンタ。
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_AROMA");
		ShowMsg_("DEMO_804_MSG_020");
		WaitMotion(aroma);
		SetMotion_(aroma, MOT_TALKLOOP, BLEND_L);								// アロマ　会話L
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================

		Wait_(5);
	}
	// ■■■■■■■■■■■■■■■■【全滅していない場合】■■■■■■■■■■■■■■■■■■■
	else
	{
		//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
		//■カットelse１　主人公とアロマ　二人歩行→カメラアウト　二人の斜め前方
		//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

		// ▼初期モーション設定
		SetMotion_(player, MOT_WALK, BLEND_N);									// 主人公　歩き
		SetMotionSpeed_(player, 1.1);
		SetMotion_(aroma, MOT_WALK, BLEND_N);									// アロマ　歩き
		task_player = Task_AnimeMove_(player, "anm_player000");
		task_aroma = Task_AnimeMove_(aroma, "anm_aroma000");
		task_aroma_step = Task_PlaySe_("SE_FLD_016", 15);
			
		// ▼カメラ設定
		SetPointCameraEye_("cameye000");
		SetPointCameraTarget_("camtgt000");

		StartDemo(FADE_COLOR_BLACK);

		Wait_(49);
		DeleteTask_(task_player);
		DeleteTask_(task_aroma);
		SetMotion_(aroma, MOT_WAIT, BLEND_N);		// アロマ　足音に合わせるため、モーションを再生しなおす


		//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
		//■カットelse２　主人公とアロマとキングその他　二人歩行→カメライン後に待機　キングの左方斜め下前方から呷り
		//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

		SetPointCameraEye_("cameye001");
		SetPointCameraTarget_("camtgt001");

		SetMotion_(aroma, MOT_WALK, BLEND_N);
		task_aroma = Task_AnimeMove_(aroma, "anm_aroma001");
		Wait_(10);
		task_player = Task_AnimeMove_(player, "anm_player001");
		WaitTask(task_aroma);
		DeleteTask_(task_aroma_step);
		SetMotion_(aroma, MOT_WAIT, BLEND_M);										// アロマ　待機
		WaitTask(task_player);
		SetMotion_(player, MOT_WAIT, BLEND_M);										// 主人公　待機
		SetMotionSpeed_(player, 1.0);

		SetMotion_(king, king_talk, BLEND_XL);									// キング　待機→会話
		WaitMotion(king);
		SetMotion_(king, king_talk_L, BLEND_XL);								// キング　会話

		//===============================================
		//■キング
		//「おおっ！　<name_player/>か！
		//　今日は　どうした？　何用であるか？
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_KING");
		ShowMsg_("DEMO_804_MSG_010");
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================

		SetMotion_(king, MOT_WAIT, BLEND_XL);									// キング　待機
		Wait_(10);
		SetMotion_(aroma, MOT_TALK, BLEND_L);									// アロマ　会話

		//===============================================
		//■アロマ
		//「キング　久しぶり！
		//　相変わらず　でっかいわね　アンタ。
		//-----------------------------------------------
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_AROMA");
		ShowMsg_("DEMO_804_MSG_020");
		WaitMotion(aroma);
		SetMotion_(aroma, MOT_TALKLOOP, BLEND_L);								// アロマ　会話L
		KeyInputWait_();
		CloseMsgWnd_();
		//===============================================

		Wait_(5);
	}

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット３　キング　会話→驚き　キングアップ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");

	SetMotion_(aroma, MOT_WAIT, BLEND_L);									// アロマ　待機
	SetMotion_(king, king_talk, BLEND_XL);									// キング　会話
	WaitMotion(king);
	SetMotion_(king, king_talk_L, BLEND_XL);								// キング　会話L

	//===============================================
	//■キング
	//「いきなり　無礼な人間の娘であるな！
	//　い……いや　人間っ！？
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_804_MSG_030");
	Wait_(25);
	efc_king = SetSelectBoneEffectSetOffset_("ef712_10_emo_surprise01", king, ATTACH_EFFECT1,  Vec3(1, -8.0, 12));
	SetEffectScale_(efc_king, 1.5);
	PlaySE_("SE_DEM_053");
	SetMotion_(king, king_surprise, BLEND_XL);								// キング　驚き
	WaitMotion(king);
	SetMotion_(king, king_surprise_L, BLEND_XL);							// キング　驚きL
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット４　アロマ　会話　アロマアップ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	SetPointCameraEye_("cameye003");
	SetPointCameraTarget_("camtgt003");

	SetVisible(player, false);
	SetMotion_(aroma, MOT_TALK, BLEND_L);									// アロマ　会話
	SetFace_(aroma, "Face_smile");
	//===============================================
	//■アロマ
	//「そっか……この姿で　会うのは　初めてだっけ。
	//　アタシはルキヤ先生の助手……アロマよ！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_804_MSG_040");
	WaitMotion(aroma);
	SetMotion_(aroma, MOT_TALKLOOP, BLEND_L);								// アロマ　会話L
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(aroma, MOT_WAIT, BLEND_XL);									// アロマ　待機
	Wait_(30);
	SetVisible(player, true);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット５　主人公とアロマとキングその他
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");

	SetVisible(queen, false);
	SetMotion_(king, king_surprise, BLEND_XL);								// キング　驚き
	WaitMotion(king);
	SetMotion_(king, king_surprise_L, BLEND_XL);							// キング　驚きL
	//===============================================
	//■キング
	//「なんと　ルキヤの助手とな！？
	//　では　ルキヤ本人は　どこに！？
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_804_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(king, MOT_WAIT, BLEND_XL);									// キング　待機
	Wait_(8);
	SetMotion_(aroma, MOT_TALK, BLEND_L);									// アロマ　会話

	//===============================================
	//■アロマ
	//「あ！　そ……それは……。　▽
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_804_MSG_060");
	WaitMotion(aroma);
	SetMotion_(aroma, MOT_TALKLOOP, BLEND_L);								// アロマ　会話L
	KeyInputWait_();
	//===============================================

	//===============================================
	//■アロマ
	//「……先生は　ちょっと遠いところにね。
	//　それより　キングに　お願いがあるのだけど。　▽
	//-----------------------------------------------
	ShowMsg_("DEMO_804_MSG_070");
	KeyInputWait_();
	//===============================================

	//===============================================
	//■アロマ
	//「ちょっと　地下を貸して欲しいのよ。
	//　ディスクシステムのある　地下１階をね。
	//-----------------------------------------------
	ShowMsg_("DEMO_804_MSG_080");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(aroma, MOT_WAIT, BLEND_XL);									// アロマ　待機
	Wait_(30);
	DeleteTask_(task_cam);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット６　キング　会話　キングアップ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");

	SetVisible(queen, true);
	SetMotion_(king, king_think, BLEND_XL);									// キング　考える

	//===============================================
	//■キング
	//「ほう　地下１階とな？
	//　別にかまわぬが……なんのためにであるか？
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_804_MSG_090");
	WaitMotion(king);
	SetMotion_(king, king_think_L, BLEND_XL);								// キング　考えるL
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(king, MOT_WAIT, 20);											// キング　待機
	Wait_(35);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット７　主人公とアロマ　二人向き合い　斜め前方
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetFace_(aroma, "Face_default");

	SetPointCameraEye_("cameye004");
	SetPointCameraTarget_("camtgt004");

	Wait_(10);
	SetMotion_(aroma, aroma_look_right_L, BLEND_XL);						// アロマ　 右向き待機L
	Wait_(15);
	SetMotion_(player, look_left_L, BLEND_XL);								// 主人公　顔を少し左向ける
	SetFace_(player, "Face_left");
	Wait_(40);

	//===============================================
	//■アロマ
	//「彼のため……そして　レナーテのためよ。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_804_MSG_100");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(aroma, MOT_WAIT, BLEND_XL);									// アロマ　待機
	Wait_(55);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット８　主人公とアロマとキングその他　頷き→セリフ後に杖上げ　キングの左方斜め下前方から呷り
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");

	SetMotion_(player, MOT_WAIT, BLEND_N);									// 主人公　待機
	SetFace_(player, "Face_default");
	SetMotion_(king, king_nod, BLEND_XL);									// キング　頷く

	//===============================================
	//■キング
	//「ふむ……我らが友のためならば
	//　拒む理由はない。好きにするがよい。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_804_MSG_110");
	WaitMotion(king);
	SetMotion_(king, MOT_WAIT, 20);											// キング　待機
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(25);

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット９　主人公とアロマ　二人向き合い　斜め前方
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	SetPointCameraEye_("cameye004");
	SetPointCameraTarget_("camtgt004");

	SetDir_(player, 255);
	Wait_(5);
	SetMotion_(aroma, aroma_look_right_L, BLEND_XL);						// アロマ　右向き待機L
	Wait_(16);

	//===============================================
	//■アロマ
	//「聞いた　<name_player/>？
	//　それじゃ　早速　地下１階に行くわよ！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_804_MSG_120");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(player, player_nod, BLEND_L);								// 主人公　頷く
	WaitMotion(player);
	SetMotion_(player, MOT_WAIT, BLEND_M);									// 主人公　待機
	Wait_(25);


	EndDemo(FADE_COLOR_BLACK);
}