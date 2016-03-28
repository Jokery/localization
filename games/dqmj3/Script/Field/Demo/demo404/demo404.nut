//=============================================
//
//		demo404[みがわりは主人公]
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
	local efc_boy;
	
// ▼リソース読込
	// キャラクター
	local player	 = GetPlayerId_();					// 主人公
	local n_boy		 = ReadNpc_("m127_01");				// スパイクヘッド（子供）
	local n_mother	 = ReadNpc_("m127_01");			// スパイクヘッド（母親）
	local c_tokusyu	 = ReadNpc_("m127_01");			// スパイクヘッド（キグルミ）
	local n_kigurumi = ReadNpc_("n027");			// スパイクヘッド（キグルミ）
	local g_box		 = ReadGimmick_("o_S01_02");			// はこ

	LoadEffect_("ef712_13_emo_sweat01");			// 汗

// ▼配置
	// 主人公
	SetPointPos_(player, "player000");

	// 子供
	local npc_boy = ArrangePointNpc_(n_boy, "npc_boy000");
	SetScaleSilhouette(npc_boy, 0.35, 0.45);

	// 母親
	local npc_mother = ArrangePointNpc_(n_mother, "npc_mother000");
	SetScaleSilhouette(npc_mother, 0.52, 0.4);

	// キグルミ
	local npc_kigurumi = ArrangePointNpc_(n_kigurumi, "player000");
	SetScaleSilhouette(npc_kigurumi, 0.6, 0.4);

	// カメラ向ける用
	local cam_tokusyu = ArrangePointNpc_(c_tokusyu, "cam_tokusyu");

	// はこ
	local gmc_box = ArrangePointGimmick_("o_S01_02", g_box, "npc_box000");

// ▼非常駐モーション読込

	// 子供用モーション
	local feel_down_b	= ReadMotion_(npc_boy,		 "m127_01_feel_down_L");	// 落ち込むL
	local irritated_b	= ReadMotion_(npc_boy,		 "m127_01_irritated_L");	// 焦るL
	local talk_b		= ReadMotion_(npc_boy,		 "m127_01_talk_L");			// 会話L

	// 母親用モーション
	local impressed_m	= ReadMotion_(npc_mother,	 "m127_01_impressed_L");	// 感激L
	local talk_m		= ReadMotion_(npc_mother,	 "m127_01_talk_L");			// 会話L
	local wear		= ReadMotion_(npc_kigurumi,	 "m127_01_wear_check_L");			// キグルミチェック
	local hero_wait_L = ReadMotion_(npc_kigurumi,	 "m127_01_hero_wait_L");			// キグルミ待機	

//	▼初期設定
	SetMotion_(npc_boy,		 feel_down_b, 1);									// 落ち込み状態からスタート
	SetMotion_(npc_kigurumi, hero_wait_L, 1);									// キグルミ待機

	SetStepSe_(npc_boy, SILENT_STEP_SE);										// 歩くと音が合わないので足音OFF

	SetVisible(npc_kigurumi, false);											// キグルミを非表示にする
	SetVisible(cam_tokusyu,	 false);											// カメラ用を非表示にする

// ▼カメラ設定
	SetPointCameraEye_("000_cameye");											// カメラアイを初期座標に設定
	SetPointCameraTarget_("000_camtgt");										// カメラターゲットを初期座標に設定
	local task_kaiwa = Task_RotateToPos_(npc_boy, GetPos_(player), 100);		// 主人公の方を向く
	local task_kaiwa = Task_RotateToPos_(player, GetPos_(npc_mother), 100);		// 母親の方を向く主人公
	SetMotion_(npc_mother,	 impressed_m, BLEND_N);								// 主人公の自己犠牲に感激する母

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);

	//===============================================
	// *母親
	// 「ああ……神さま。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BOYS_MOTHER");
	ShowMsg_("DEMO_404_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	// おいしいところを持って行かれそうになって焦る子供
	efc_boy = SetSelectBoneEffect_("ef712_13_emo_sweat01", npc_boy, ATTACH_EFFECT1);	// 汗
	SetEffectScale_(efc_boy, 3.0);														// 汗スケール

	task_boy = Task_AnimeMove_(npc_boy, "anm_boy000");									// 子供移動
	SetMotion_(npc_boy,	 MOT_WALK, BLEND_M);											// 歩きモーション
	
	//===============================================
	// *少年
	// 「ちょ……ちょっと待って！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MONSTER_BOY");
	ShowMsg_("DEMO_404_MSG_020");

	Wait_(10);																			// 移動待ち
	SetMotion_(npc_boy, talk_b, BLEND_L);												// 会話モーションで待機
	
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetPointCameraEye_("001_cmreye");													// カメラアイを初期座標に設定
	SetPointCameraTarget_("001_cmrtgt");												// カメラターゲットを初期座標に設定
	local task_kaiwa = Task_RotateToPos_(player, GetPos_(cam_tokusyu), 100.0);			// カメラの方を向く主人公
	InitSilhouetteWidth_(npc_boy, 0.7);
	//===============================================
	
	//===============================================
	// *少年
	// 「ルキヤと　会いたいのなら
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MONSTER_BOY");
	ShowMsg_("DEMO_404_MSG_030");
	KeyInputWait_();
	//===============================================

	DeleteEffect_(efc_boy);	

	//===============================================
	// *少年
	// 「でも　その格好じゃ　すぐに
	//-----------------------------------------------
	ShowMsg_("DEMO_404_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	task_cam = Task_AnimeMoveCamera_("000_anmeye", "000_anmtgt");					// カメラが下から上へ
	SetVisible(npc_boy,			 false);											// 主人公を非表示にする
	WaitTask(task_cam);
	
	Wait_(30);
	SetVisible(player,			 false);											// 主人公を非表示にする
	SetVisible(npc_boy,			 true);												// 主人公を非表示にする
	
	local task_kaiwa = Task_RotateToPos_(player, GetPos_(npc_mother), 5);			// 母親の方を向く主人公
	task_cam = Task_AnimeMoveCamera_("001_anmeye", "001_anmtgt");					// カメラがゆっくりとズーム
	InitSilhouetteWidth_(npc_boy, 1.4);

	local task_kaiwa = Task_RotateToPos_(npc_mother, GetPos_(npc_boy), 5);			// 子供の方を向く母親
	SetMotion_(npc_mother, talk_m, BLEND_L);										// 会話
	SetMotion_(npc_boy, MOT_WAIT, BLEND_M);											// 待機
	
	//===============================================
	// *母親
	// 「だったら　あの手を　使いましょう。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BOYS_MOTHER");
	ShowMsg_("DEMO_404_MSG_050");

	WaitTask(task_kaiwa);															// 振り向き待ち

	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(npc_boy, talk_b, BLEND_M);											// 会話
	SetMotion_(npc_mother, MOT_WAIT, BLEND_M);										// 待機
	task_kaiwa = Task_RotateToPos_(npc_boy, GetPos_(npc_mother), 10);				// 母親の方を向く子供
	SetMotion_(npc_boy, MOT_WALK, BLEND_M);
	//===============================================
	// *少年
	// 「もしかして　キグルミを作るの？
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MONSTER_BOY");
	ShowMsg_("DEMO_404_MSG_060");
	WaitTask(task_kaiwa);
	SetMotion_(npc_boy, MOT_WAIT, BLEND_M);
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	DeleteTask_(task_cam);															// 振り向き待ち
	SetMotion_(npc_mother, talk_m, BLEND_M);										// 会話
	SetMotion_(npc_boy, MOT_WAIT, BLEND_M);											// 待機

	SetPointCameraEye_("000_cameye");												// カメラアイを初期座標に設定
	SetPointCameraTarget_("000_camtgt");											// カメラターゲットを初期座標に設定

	SetVisible(player,			 true);												// 主人公を非表示にする
	task_kaiwa = Task_RotateToPos_(npc_mother, GetPos_(player), 6.0);				// 主人公の方を向く
	SetMotion_(npc_mother, MOT_WALK, BLEND_M);

	task_kaiwa = Task_RotateToPos_(npc_boy, GetPos_(player), 5.0);					// 主人公の方を向く
	SetMotion_(npc_boy, MOT_WALK, BLEND_M);

	WaitTask(task_kaiwa);
	SetMotion_(npc_mother, talk_m, BLEND_XL);										// 会話
	SetMotion_(npc_boy, MOT_WAIT, BLEND_M);
	
	//===============================================
	// *母親
	// 「大丈夫ですよ　○主人公の名前○さん。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BOYS_MOTHER");
	ShowMsg_("DEMO_404_MSG_070");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	// *母親
	// 「少しだけ　待っていてくださいね。
	//-----------------------------------------------
	ShowMsg_("DEMO_404_MSG_080");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);
	Wait_(30);
	
	PlaySE_("SE_DEM_076");
	Wait_(30);

	Wait_(30);

	Wait_(30);
	
	SetVisible(player,			 false);											// 主人公を非表示にする
	SetVisible(npc_boy,			 false);											// 子供を非表示にする
	SetVisible(npc_mother,		 false);											// 母親を非表示にする
	SetVisible(npc_kigurumi,	 true);												// キグルミを表示する
	local task_kaiwa = Task_RotateToPos_(npc_kigurumi, GetPos_(cam_tokusyu), 10);	// カメラの方を向くキグルミ

	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);
	task_cam = Task_AnimeMoveCamera_("003_anmeye", "003_anmtgt");					// カメラがゆっくりとズーム
	Wait_(60);

	//===============================================
	// *母親
	// 「……できました！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BOYS_MOTHER");
	ShowMsg_("DEMO_404_MSG_090");

	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	//===============================================
	// *少年
	// 「うん！　すごく自然な格好だよ　お兄さん！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MONSTER_BOY");
	ShowMsg_("DEMO_404_MSG_100");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	WaitTask(task_cam);
	
	SetMotion_(npc_kigurumi, wear, BLEND_XL);									// キグルミチェック	
	Wait_(80);
	SetMotion_(npc_kigurumi, hero_wait_L, BLEND_XL);									// キグルミ待機
	Wait_(60);
	
	task_cam = Task_AnimeMoveCamera_("002_anmeye", "002_anmtgt");					// カメラがゆっくりとズーム

	//===============================================
	// *母親
	// 「それでは……○主人公の名前○さん。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BOYS_MOTHER");
	ShowMsg_("DEMO_404_MSG_110");
	KeyInputWait_();
	
	//===============================================
	// *母親
	// 「中にいれば　イッタブルが　やってきて
	//-----------------------------------------------
	ShowMsg_("DEMO_404_MSG_120");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	WaitTask(task_cam);
	EndDemo(FADE_COLOR_BLACK);
}
