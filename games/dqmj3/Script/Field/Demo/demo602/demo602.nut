//=============================================
//
//		demo602[楽園ふたたび]
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
	local task_cam, task_player, task_santyo;
	local efc_player;

// ▼リソース読込
	// キャラクター
	local ansesu = GetPlayerId_();										// アンセス
	local model_player = ReadNpc_("n010");								// 幼少期主人公
	local model_santyo = ReadNpc_("n011");								// サンチョ
	
	// エフェクト
	LoadEffect_("EF712_10_EMO_SURPRISE01");								// 「！」
	LoadEffect_("ef720_01_nat_oth_birds");								// 鳥

// ▼配置
	SetPointPos_(ansesu, "ansesu000");									// アンセス非表示
	SetVisible(ansesu, false);
	
	local player = ArrangePointNpc_(model_player, "player000");			// 幼少期主人公
	
	local santyo = ArrangePointNpc_(model_santyo, "npc_santyo000");		// サンチョ
	SetScaleSilhouette(santyo, SCALE.SANCHO, SILHOUETTE_WIDTH.SANCHO);
	
// ▼非常駐モーション読込
	// 子供主人公
	local pl_surprise = ReadMotion_(player, "n010_surprise_L");			// 驚き
	local pl_caution = ReadMotion_(player, "n010_caution_L");			// 警戒
	
	// サンチョ
	local santyo_bow = ReadMotion_(santyo, "n011_bow");					// おじぎ

// ▼フェード色設定
	SetFade_(FADE_OUT, FADE_COLOR_WHITE, FADE_DEF);
	WaitFade_();

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット１ 家→主警戒
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	StartBlurEffect_();
	SetMotion_(player, MOT_WAIT, BLEND_N);							//主　初期モーション　警戒
	SetFace_(player, "Face_surprise");									//主　驚き顔

	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");			//最初のカットでアニメが停止するよう設定
	DeleteTask_(task_cam);

	Wait_(70);
	
	local efc_birds = SetPointWorldEffect_("ef720_01_nat_oth_birds", "efc_birds000");		//鳥エフェクト
	SetEffectScale_(efc_birds, 1.2);
	
	StartDemo(FADE_COLOR_WHITE);
	PlayBgm_("BG_AMBI_005");
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");			//フェード開け30F後にアニメ開始
	WaitTask(task_cam);
	Wait_(50);
	SetMotion_(player, MOT_WAIT, BLEND_N);
	EndBlurEffect_();
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット２ 主「目が覚めると体が縮んでいた！」
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	SetMotion_(player, pl_surprise, BLEND_XL);
	
	WaitTask(task_cam);
	Wait_(50);
	SetMotion_(player, MOT_WAIT, BLEND_N);

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット３ サンチョカメライン
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_santyo = Task_AnimeMove_(santyo, "anm_santyo000");
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");			//サンチョinまでカメラ停止
	DeleteTask_(task_cam);
	Wait_(30);
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");
	Wait_(20);
	PlaySE_("SE_FLD_040");												//■SE:サンチョ足音（浮遊モンスターの足音）
	Wait_(20);
	PlaySE_("SE_FLD_040");												//■SE:サンチョ足音（浮遊モンスターの足音）
	
	WaitTask(task_cam);
	WaitTask(task_santyo);
	
	SetMotion_(santyo, santyo_bow, BLEND_L);
	WaitMotion(santyo);
	SetMotion_(santyo, MOT_TALK, BLEND_XL);
	WaitMotion(santyo);
	SetMotion_(santyo, MOT_TALKLOOP, BLEND_M);
	//===============================================
	// ■サンチョ
	// 「おはようございマス　○主人公の名前○さま。
	// 　今日も　お元気そうで　何よりデス。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_SANCHO");
	ShowMsg_("DEMO_602_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_()
	//===============================================
//	local pos = Vec3(0.2, -0.6, 0);
//	efc_player = SurpriseDispSetOffset(player, pos, 0.6);

	Wait_(10);
	SetMotion_(player, MOT_WAIT, BLEND_N);

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット４ サンチョアップ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	
	//===============================================
	// ■サンチョ
	// 「どうされマシた？　そんなに　おどろいて。
	// 　えっ！　何が　どうなってるのかデスか？
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_SANCHO");
	ShowMsg_("DEMO_602_MSG_020");
	KeyInputWait_();
	//===============================================
	//===============================================
	// ■サンチョ
	// 「ここは○主人公の名前○さまと　お兄さまである
	// 　アンセスさまが住む　本当の楽園デス。
	//-----------------------------------------------
	ShowMsg_("DEMO_602_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_()
	//===============================================
	SetMotion_(santyo, MOT_WAIT, BLEND_XL);
	Wait_(20);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット５ 主「！」
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");
	Wait_(5);
	local pos = Vec3(0, -0.24, 0.5);
	efc_player = SurpriseDispSetOffset(player, pos, 0.45);
	SetMotion_(player, pl_caution, BLEND_M);							//主　警戒

	Wait_(40);
	DeleteTask_(task_cam);	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット６ サンチョ　主
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");
	SetMotion_(santyo, MOT_TALK, BLEND_XL);
	//===============================================
	// ■サンチョ
	// 「アンセスさまは　戦いから　戻られたあと
	// 　あなたと　一緒に　この地に住んでおられマス。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_SANCHO");
	ShowMsg_("DEMO_602_MSG_040");
	WaitMotion(santyo);
	SetMotion_(santyo, MOT_TALKLOOP, BLEND_M);
	KeyInputWait_();
	//===============================================
	//===============================================
	// ■サンチョ
	// 「そのアンセスさまは　ここから　西にある
	// 　森の奥へ　行くと　言っておられまシタ。
	//-----------------------------------------------
	ShowMsg_("DEMO_602_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_()
	//===============================================
	Wait_(10);
	DeleteTask_(task_cam);

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット７ サンチョ再アップ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	//===============================================
	// ■サンチョ
	// 「もし　アンセスさまに　用事があるのでシタら
	// 　○主人公の名前○さまも　行かれテハ？
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_SANCHO");
	ShowMsg_("DEMO_602_MSG_060");
	KeyInputWait_();
	CloseMsgWnd_()
	//===============================================
	SetMotion_(santyo, MOT_WAIT, BLEND_XL);
	Wait_(30);
	
	EndDemo(FADE_COLOR_BLACK);
}
