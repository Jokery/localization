//=============================================
//
//		demo403[少年の決意と母親のなげき]
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
	local task_cam, task_player, task_boy, task_mother;
	local efc_boy, efc_mother, efc_syutyu;
	
// ▼リソース読込
	// キャラクター
	local player = GetPlayerId_();					// 主人公
	local n_boy000 = ReadNpc_("m127_01");			// スパイクヘッド（子供）
	local n_mother000 = ReadNpc_("m127_01");		// スパイクヘッド（母親）

// ▼配置
	// 主人公
	SetPointPos_(player, "player000");

	// 子供
	local npc_boy000 = ArrangePointNpc_(n_boy000, "npc_boy000");
	SetScaleSilhouette(npc_boy000, 0.35, 0.25);

	// 母親
	local npc_mother000 = ArrangePointNpc_(n_mother000, "npc_mother000");
	SetScaleSilhouette(npc_mother000, 0.52, 0.35);

// ▼非常駐モーション読込
	local feel_down_b	= ReadMotion_(npc_boy000,		 "m127_01_feel_down_L");	// 落ち込むL
	local feel_down_m	= ReadMotion_(npc_mother000,	 "m127_01_feel_down_L");	// 落ち込むL
	local talk_b		= ReadMotion_(npc_boy000,		 "m127_01_talk_L");			// 会話L
	local talk_m		= ReadMotion_(npc_mother000,	 "m127_01_talk_L");			// 会話L
	local what_b		= ReadMotion_(npc_boy000,		 "m127_01_what_L");			// ん？L
	local what_m		= ReadMotion_(npc_mother000,	 "m127_01_what_L");			// ん？L
	local irritated_b	= ReadMotion_(npc_boy000,		 "m127_01_irritated_L");	// 焦るL
	local nod_m			= ReadMotion_(npc_mother000,	 "m127_01_nod");			// 待機→頭を下げる→待機
	local nod_p			= ReadMotion_(player,			 "Player_nod");				// 待機→頭を下げる→待機

	LoadEffect_("ef712_10_emo_surprise01");											// 「！」エフェクト
	LoadEffect_("ef733_01_sym_shuchusen01");												// 集中線エフェクト
	
	SetMotion_(npc_boy000, feel_down_b, 1);											// 落ち込み状態からスタート

// ▼カメラ設定
	SetPointCameraEye_("cameye004");								// カメラアイを初期座標に設定
	SetPointCameraTarget_("camtgt004");								// カメラターゲットを初期座標に設定
	task_mother = Task_AnimeMove_(npc_mother000, "anm_mother000");	// 母親の位置を初期位置に移動(実際には移動していない)
//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------
	StartDemo(FADE_COLOR_BLACK);
	
	Wait_(10);																	// 開始時に少し見せる
	
	SetMotion_(npc_mother000, talk_m, BLEND_L);									// 母親が会話
	//===============================================
	// *母親
	// 「ここから逃げるのよ！　かわいいあなたを
	//	　イケニエになんて　お母さんできないわ！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BOYS_MOTHER");
	ShowMsg_("DEMO_403_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	SetMotion_(npc_mother000, "WAIT", BLEND_L);	
	
	SetPointCameraEye_("cameye002");											// 少年アップ
	SetPointCameraTarget_("camtgt002");											// 少年アップ
	InitSilhouetteWidth_(npc_boy000, 0.9);
	
	//===============================================
	// *少年
	// 「……ダメだよ　お母さん。
	//	　ボクが逃げたら　みんなに　迷惑がかかる。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MONSTER_BOY");
	ShowMsg_("DEMO_403_MSG_020");
	KeyInputWait_();
	//===============================================

	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");					// 集中線用カメラムーブ
	PlaySE_("SE_DEM_026");	// ■SE:集中線
	efc_syutyu = SetCameraEffect_("ef733_01_sym_shuchusen01", 100);				// 集中線表示
	SetMotion_(npc_boy000, talk_b, BLEND_L);									// 落ち込んでる状態から会話モーションに変更
	
	SetMotion_(npc_mother000, feel_down_m, BLEND_XL);							// 母親が落ち込む
	//===============================================
	// *少年
	// 「それに　どこに　逃げるっていうのさ。
	//-----------------------------------------------
	ShowMsg_("DEMO_403_MSG_030");

	Wait_(20);																	// 集中線を20F表示
	DeleteEffect_(efc_syutyu);													// 集中線を消す

	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(npc_boy000, feel_down_b, BLEND_XL);	
	WaitTask(task_cam);
	DeleteTask_(task_cam);
	DeleteTask_(task_mother);

	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");					// 主人公が近づいてくるカメラ
	InitSilhouetteWidth_(npc_boy000, 1.4);

	task_player = Task_AnimeMove_(player, "anm_player000");						// 主人公近づく
	SetMotion_(player, MOT_WALK, BLEND_M);										// 歩きモーション

	WaitTask(task_player);														// 主人公が歩いてくるまで待つ
	SetMotion_(player, MOT_WAIT, BLEND_M);										// 歩いてきた主人公を待機モーションに
	local task_kaiwa = Task_RotateToPos_(player, GetPos_(npc_mother000), 5);	// 主人公を母親の方へ向ける

	// ビックリマークの音
	PlaySE_("SE_DEM_053");

	// ビックリマークを表示
	efc_boy = SetSelectBoneEffectSetOffset_("ef712_10_emo_surprise01", npc_boy000, ATTACH_EFFECT1, Vec3(0.0, 5.0, 0.0));
	SetEffectScale_(efc_boy, 3.0);

	// ビックリマークを表示
	efc_mother = SetSelectBoneEffectSetOffset_("ef712_10_emo_surprise01", npc_mother000, ATTACH_EFFECT1, Vec3(1.0, -3.5, 0.0));
	SetEffectScale_(efc_mother, 2.7);

	// 主人公の方を向く
	task_boy = Task_RotateToPlayerSetMotion_(npc_boy000, 5.0, "WALK", "WAIT");
	task_mother = Task_RotateToPlayerSetMotion_(npc_mother000, 1.0, "WALK", "WAIT");

	WaitTask(task_boy);															// 子供が主人公の方を向くまで待つ
	SetMotion_(npc_boy000, talk_b, BLEND_L);									// 子供は会話

	//===============================================
	// *少年
	// 「あっ！　お兄さん！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MONSTER_BOY");
	ShowMsg_("DEMO_403_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	DeleteTask_(task_cam);
	DeleteTask_(task_boy);
	DeleteTask_(task_player);
	DeleteTask_(task_mother);

	SetMotion_(npc_mother000, talk_m, BLEND_L);									// 母親が会話
	SetMotion_(npc_boy000, "WAIT", BLEND_L);									// 子供は待機
	
	//===============================================
	// *母親
	// 「その方は……？
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BOYS_MOTHER");
	ShowMsg_("DEMO_403_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(npc_boy000, talk_b, BLEND_L);									// 子供が会話
	SetMotion_(npc_mother000, "WAIT", BLEND_L);									// 母親は待機

	// 子供が母親の方を向きながら話す
	local task_kaiwa = Task_RotateToPos_(npc_boy000, GetPos_(npc_mother000), 5);
	SetMotion_(npc_boy000, MOT_WALK, BLEND_L);								// 主人公に歩み寄る母親
	Wait_(30);
	SetMotion_(npc_boy000, talk_b, BLEND_XL);									// 子供が会話	
	//===============================================
	// *少年
	// 「このお兄さん　ルキヤに
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MONSTER_BOY");
	ShowMsg_("DEMO_403_MSG_060");
	WaitTask(task_kaiwa);
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	task_mother = Task_AnimeMove_(npc_mother000, "anm_mother002");				// カメラを動かす
	SetMotion_(npc_mother000, MOT_WALK, BLEND_L);								// 主人公に歩み寄る母親
	
	local task_kaiwa = Task_RotateToPos_(npc_boy000, GetPos_(player), 5);	// 主人公の方を向く子供
	SetMotion_(npc_boy000, MOT_WALK, BLEND_L);								
	
	//===============================================
	// *母親
	// 「ルキヤさんに……？
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BOYS_MOTHER");
	ShowMsg_("DEMO_403_MSG_070");

	WaitTask(task_kaiwa);
	SetMotion_(npc_boy000, MOT_WAIT, BLEND_L);								
	WaitTask(task_mother);														// 歩み寄りきるまで待つ
	DeleteTask_(task_mother);													// タスクを消す
	SetMotion_(npc_mother000, talk_m, BLEND_L);									// 母親が会話	
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(player, nod_p, BLEND_L);											// うなづく主人公
	WaitMotion(player);															// うなづき待ち

	SetPointCameraEye_("cameye001");											// カメラ切り替え
	SetPointCameraTarget_("camtgt001");											// カメラ切り替え
	SetVisible(player, false);													// 主人公が映り込むので非表示にする
	InitSilhouetteWidth_(npc_boy000, 0.9);

	//===============================================
	// *母親
	// 「ああ……やはり　そうですね。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BOYS_MOTHER");
	ShowMsg_("DEMO_403_MSG_080");
	KeyInputWait_();
	//===============================================

	SetMotion_(npc_mother000, nod_m, BLEND_L);									// 頭を下げる母親
	
	//===============================================
	// *母親
	// 「あなたの　チカラになってほしいと
	//-----------------------------------------------
	ShowMsg_("DEMO_403_MSG_090");

	WaitMotion(npc_mother000);													// モーション終了待ち
	SetMotion_(npc_mother000, "WAIT", BLEND_L);									// 待機モーション

	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	local task = Task_RotateToDir_(npc_boy000, 85, 15);							// 母親の方へ向く少年
	SetMotion_(npc_boy000, MOT_WALK, BLEND_L);									// 少年会話モーション
	WaitTask(task);
	SetMotion_(npc_boy000, talk_b, BLEND_XL);									// 少年会話モーション

	//===============================================
	// *少年
	// 「だから……ボクが　イケニエになるって
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MONSTER_BOY");
	ShowMsg_("DEMO_403_MSG_100");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetPointCameraEye_("cameye002");											// カメラ切り替え
	SetPointCameraTarget_("camtgt002");											// カメラ切り替え
	InitSilhouetteWidth_(npc_boy000, 0.8);
	SetVisible(npc_mother000, false);											// 母親を非表示に
	SetMotion_(npc_boy000, feel_down_b, BLEND_XL);								// 少年落ち込む

	//===============================================
	// *少年
	// 「ルキヤみたいに　みがわりを　やるなんて
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MONSTER_BOY");
	ShowMsg_("DEMO_403_MSG_110");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetDir_(npc_mother000, -100);												// 母親の向きを変更
	SetPointCameraEye_("cameye003");											// カメラ切り替え
	SetPointCameraTarget_("camtgt003");											// カメラ切り替え

	SetVisible(npc_mother000, true);											// 母親を再表示
	SetMotion_(npc_mother000, feel_down_m, 20);									// 落ち込む母親
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");					// カメラがゆっくりと引く
	InitSilhouetteWidth_(npc_boy000, 1.2);
	
	//===============================================
	// *母親
	// 「それは　わかっています……。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BOYS_MOTHER");
	ShowMsg_("DEMO_403_MSG_120");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	//===============================================
	// *少年
	// 「お母さん……それでも　誰かが
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MONSTER_BOY");
	ShowMsg_("DEMO_403_MSG_130");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(30);

	EndDemo(FADE_COLOR_BLACK);
	SetVisible(player, true);													// 消していた主人公を戻す
}
