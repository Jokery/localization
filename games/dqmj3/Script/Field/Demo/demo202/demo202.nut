//=============================================
//
//		demo202[モンスターの幽霊Ａとの出会い]
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

// ▼リソース読込
	// キャラクター
	local player = GetPlayerId_();					// 主人公
	local model_poison = ReadNpc_("m100_01");		// ポイズントリル
	//エフェクト
	LoadEffect_("ef712_04_emo_joy01");										// 喜び

// ▼配置
	// 主人公
	SetPointPos_(player, "player000");
	// ポイズントリル
	local poison = ArrangePointNpc_(model_poison, "npc_poison000");
	SetPointPosNoFit_(poison, "npc_poison000");
	SetScaleSilhouette(poison, SCALE.POISONTRILL, SILHOUETTE_WIDTH.POISONTRILL);
	SetAlpha_(poison, 0.8);

// ▼非常駐モーション読込
	// 主人公
	local pl_nod = ReadMotion_(player, "Player_nod");						// 待機→うなづく→待機
	// ポイズントリル
	local poison_joy = ReadMotion_(poison, "m100_01_joy_L");				// 喜ぶ（飛び跳ねる）
	local poison_sad_L = ReadMotion_(poison, "m100_01_sad_L");				// 落ち込むL
	local poison_talk_L = ReadMotion_(poison, "m100_01_talk_L");			// 会話
	
// ▼初期モーション設定
	SetMotion_(poison, poison_talk_L, BLEND_XL);							// 待機
	
// ▼カメラ設定
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	SetMotion_(poison, poison_joy, BLEND_M);								// 喜ぶ（飛び跳ねる）

	StartDemo(FADE_COLOR_BLACK);
	
	// ▼カット１＠主人公とポイズントリル～～～～～～～～～～～
	efc_poison = SetSelectBoneEffect_("ef712_04_emo_joy01", poison, ATTACH_EFFECT1);	//ポイズントリル喜び
	SetEffectScale_(efc_poison, 4.0);
	//===============================================
	//*モンスターの幽霊Ａ
	//「そのリアクター……キミには　ボクみたいな
	//　モンスターの幽霊の姿が　見えるんだね？
	// ▽
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_202_MSG_010");
	KeyInputWait_();
	//-----------------------------------------------
	
	SetMotion_(poison, poison_talk_L, BLEND_L);								// 毒舌
	//-----------------------------------------------
	//*モンスターの幽霊Ａ
	//「ということは　キミが　ルキヤの言ってた
	//　<name_player/>かな？
	//-----------------------------------------------
	ShowMsg_("DEMO_202_MSG_020");
	DeleteEffectEmitter_(efc_poison);
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	SetMotion_(poison, MOT_WAIT, BLEND_L);									// 毒待機

	SetMotion_(player, pl_nod, BLEND_L);									// 待機→うなづく→待機
	WaitMotion(player);
	SetMotion_(player, MOT_WAIT, BLEND_L);
	
	Wait_(10);
	SetAlpha_(player, ALPHA_CLEAR);
	
	// ▼カット２＠ポイズントリルアップ～～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");					// 120F
	SetMotion_(poison, poison_joy, BLEND_L);								// 毒喜び
	
	//===============================================
	//*モンスターの幽霊Ａ
	//「やっぱり！　前から聞いてたんだ　キミのこと。
	//　ねぇ……ボクの　お願いを　聞いてくれない？
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_202_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//-----------------------------------------------
	
	Wait_(10);
	DeleteTask_(task_cam);
	SetAlpha_(player, 1);
	
	// ▼カット３＠主人公とポイズントリル～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");					// 180F

	SetMotion_(poison, MOT_WAIT, 15);				// 待機
	Wait_(15);
	SetMotion_(poison, poison_sad_L, BLEND_XL);									// 落ち込む

	//-----------------------------------------------
	//「この歓楽の霊道には　ブンドルドっていう
	//　すっごい悪くて　強い魔物が　いるんだ。
	// ▽
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_202_MSG_040");
	KeyInputWait_();
	//-----------------------------------------------

	//-----------------------------------------------
	//「ボクたち　そいつのせいで　ねぐらを
	//　追い出されて……助けを　探してたんだよ。
	//-----------------------------------------------
	ShowMsg_("DEMO_202_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	//-----------------------------------------------

	Wait_(20);
	DeleteTask_(task_cam);
	SetAlpha_(poison, ALPHA_CLEAR);

	// ▼カット４＠主人公ズームイン～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");					// 120F

	//===============================================
	//*モンスターの幽霊Ａ
	//「ルキヤから　聞いたけど　キミって強いんだろ？
	//　お願いだよ！　ブンドルドを　やっつけてよ！
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_202_MSG_060");
	KeyInputWait_();
	CloseMsgWnd_();
	//-----------------------------------------------

	Wait_(15);
	DeleteTask_(task_cam);
	Wait_(15);
	SetAlpha_(poison, 0.8);
	SetAlpha_(player, ALPHA_CLEAR);
	SetMotion_(poison, poison_talk_L, BLEND_N);									// 会話

	// ▼カット６＠ポイズントリルアップ～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");					// 270F

	//-----------------------------------------------
	//「ブンドルドは　歓楽の霊道の北……
	//　アンデッドガーデンって場所に　いるんだ。
	// ▽
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_202_MSG_070");
	KeyInputWait_();
	//-----------------------------------------------

	//-----------------------------------------------
	//「でも　あいつは　アンデッドガーデンに
	//　カギをかけて　閉じこもってしまってね……。
	// ▽
	//-----------------------------------------------
	SetMotion_(poison, MOT_WAIT, 14);				// 待機
	Wait_(8);
	ShowMsg_("DEMO_202_MSG_080");
	Wait_(6);
	SetMotion_(poison, poison_sad_L, BLEND_XL);									// 落ち込む
	Wait_(16);
	KeyInputWait_();
	//-----------------------------------------------
	SetMotion_(poison, poison_talk_L, BLEND_L);									// 会話

	//-----------------------------------------------
	//「アンデッドガーデンのカギは
	//　あいつの　３人の手下が　持ってるはずだよ。
	// ▽
	//-----------------------------------------------
	ShowMsg_("DEMO_202_MSG_090");
	KeyInputWait_();
	//-----------------------------------------------

	//-----------------------------------------------
	//「手下の3人も　かなり　手強い奴らなんだ。
	//　リアクターを使いながら　探してみてよ。
	//-----------------------------------------------
	ShowMsg_("DEMO_202_MSG_100");
	KeyInputWait_();
	CloseMsgWnd_();
	//-----------------------------------------------
	SetMotion_(poison, MOT_WAIT, BLEND_XL);				// 待機

	EndDemo(FADE_COLOR_BLACK);
}
