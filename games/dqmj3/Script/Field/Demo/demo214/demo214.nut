//=============================================
//
//		demo214[幽霊のお礼]
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
	local task_cam, task_player, task_poison;
	local efc_player, efc_poison;
	local alpha_poison;

// ▼リソース読込
	// ギミック
	local model_transfer = ReadGimmick_("o_dem_00");
	// キャラクター
	local player = GetPlayerId_();											// 主人公
	local model_poison = ReadNpc_("m100_01");								// ポイズントリル
	//エフェクト
	LoadEffect_("ef712_04_emo_joy01");										// 喜び

// ▼配置
	// 転送装置
	local transfer = ArrangePointGimmick_("o_dem_00", model_transfer, "obj_transfer000");
	SetMotion_(transfer, MOT_GIMMICK_0, BLEND_N);							//起動前

	// 主人公
	SetPointPos_(player, "player000");

	// ポイズントリル
	local poison = ArrangePointNpc_(model_poison, "npc_poison000");
	SetPointPosNoFit_(poison, "npc_poison000");
	SetScaleSilhouette(poison, SCALE.S, SILHOUETTE_WIDTH.S);				//ポイズン　サイズS
	SetAlpha_(poison, 0.8);
	SetStepSe_(poison, SILENT_STEP_SE);

// ▼非常駐モーション読込
	// 主人公
	local player_look_up_L = ReadMotion_(player, "Player_look_up_L");		// 主人公　上向き待機
	local player_nod = ReadMotion_(player, "Player_nod");					// 主人公　うなづく
	
	// ポイズントリル
	local pt_joy = ReadMotion_(poison, "m100_01_joy_L");					// 会話（喜び）
	local pt_talk_L = ReadMotion_(poison, "m100_01_talk_L");				// 会話L
	local pt_hand = ReadMotion_(poison, "m100_01_shake_hand_L");			// 手を振る
	
// ▼時間設定
	SetTime_(START_TIME_ZONE_NIGHT);

// ▼カメラ設定
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");				// 270F

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);

	// ▼カット１＠主人公とポイズントリル～～～～～～～～～～～

	//===============================================
	//*モンスターの幽霊Ａ
	//「ブンドルドを　やっつけたんだね。
	//　やったじゃないか！
	//▽
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_214_MSG_010");
	efc_poison = SetSelectBoneEffect_("ef712_04_emo_joy01", poison, ATTACH_EFFECT1);	//ポイズントリル喜び
	SetEffectScale_(efc_poison, 4.0);
	SetMotion_(poison, pt_joy, BLEND_L);									// ポイズントリル　会話（喜び）
	KeyInputWait_();
	//===============================================
	//*モンスターの幽霊Ａ
	//「おかげで　今日からは　安眠できるよ。
	//　なつかしの　我が家だ……ありがとう！
	//▽
	//-----------------------------------------------
	ShowMsg_("DEMO_214_MSG_020");
	KeyInputWait_();
	//===============================================
	//*モンスターの幽霊Ａ
	//「何か　お礼をしないと……そうだ！
	//　この石を　もらってくれる？
	//▽
	//-----------------------------------------------
	DeleteEffectEmitter_(efc_poison);
	SetMotion_(poison, pt_talk_L, BLEND_L);									// ポイズントリル　会話L
	ShowMsg_("DEMO_214_MSG_030");
	KeyInputWait_();
	//===============================================
	//*モンスターの幽霊Ａ
	//「ルキヤから　もらった物だけど……
	//　キミが　持ってるほうが　きっといい。
	//▽
	//-----------------------------------------------
	ShowMsg_("DEMO_214_MSG_040");
	KeyInputWait_();
	//===============================================

	SetMotion_(poison, MOT_WAIT, BLEND_XL);
	Wait_(15);

	//===============================================
	// *システムメッセージ
	//<name_player/>は
	//<yellow/>崩落の天導石<white/>を　もらった！
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_214_MSG_050");
	PlayMe_("ME_010");
	WaitMe_();
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	WaitTask(task_cam);
	Wait_(20);
	task_poison = Task_WalkAroundToPos(poison, GetPos_(transfer), ROTATE_DEMO_DEF);					// ポイズントリル　振り向く	

	// ▼カット２＠転送装置へＰＡＮ～～～～～～～～～～～～～～
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");

	//===============================================
	//*モンスターの幽霊Ａ
	//「キミは　ルキヤを　追ってきたんだろう？
	//　だったら　この移動装置を　使いなよ。
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_214_MSG_060");
	KeyInputWait_();
	SetMotion_(player, player_look_up_L, BLEND_XL);							// 主人公　上を向く
	CloseMsgWnd_();
	//===============================================

	Wait_(15);
	WaitTask(task_poison);
	DeleteTask_(task_poison);
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");				// 180F
	WaitTask(task_cam);
	Wait_(70);

	SetMotion_(player, MOT_WAIT, BLEND_N);									//主人公待機
	SetDirToObject_(player, poison);

	// ▼カット３＠主人公　話す～～～～～～～～～～～～

	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

	task_poison = Task_WalkAroundToPos(poison, GetPos_(player), ROTATE_DEMO_DEF);					// ポイズントリル　振り向く
	Wait_(30);
	SetMotion_(poison, pt_talk_L, BLEND_L);									// ポイズントリル　会話L

	//===============================================
	//*モンスターの幽霊Ａ
	//「移動装置の　先にあるのは　凍骨の氷原だ。
	//　着いたら　まずは　ポーラパークへ寄るといい。
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_214_MSG_070");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	WaitTask(task_poison);
	DeleteTask_(task_poison);

	//主人公ズームアップ
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");				// 200F

	//===============================================
	//*モンスターの幽霊Ａ
	//「ポーラパークは　大きな村だからね。
	//　ルキヤを探すには　おあつらえ向きだよ。
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_214_MSG_080");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(player, player_nod, BLEND_L);								// 主人公　うなづく
	WaitMotion(player);
	SetMotion_(player, MOT_WAIT, BLEND_L);									// 主人公　待機
	Wait_(30);
	DeleteTask_(task_cam);
	SetVisible(player, false);												//主人公 非表示

	// ▼カット４＠ポイズントリルアップ～～～～～～～～～～～～

	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");

	//===============================================
	//*モンスターの幽霊Ａ
	//「それじゃあ　行ってらっしゃい。
	//　元気でね　<name_player/>！
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_214_MSG_090");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	SetMotion_(poison, pt_hand, BLEND_XL);									// 手を振る
	Wait_(15);

	//ポイズントリル　ゆっくり消えていく
//	Task_ObjectFadeOut_(poison, 50);
//	PlaySE_("SE_DEM_018");
//	Wait_(70);

	Wait_(30);

	EndDemo(FADE_COLOR_BLACK);
}
