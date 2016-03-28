//=============================================
//
//		demo302[大親分トードー]
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
	local task_cam, task_player, task_todo, task_ookizuti;
	local efc_cam, efc_todo, efc_ookizuti;
	
// ▼リソース読込
	// エフェクト
	LoadEffect_("ef712_10_emo_surprise01");		// 「！」
	LoadEffect_("ef733_01_sym_shuchusen01");	// 集中線
	LoadEffect_("ef712_13_emo_sweat01");		// 汗
	// キャラクター
	local player = GetPlayerId_();
	local model_todo = ReadNpc_("n039");		// トードー親分
	local model_ookizuti = ReadNpc_("m035_00")	// トードー子分(おおきづち)
	
// ▼配置
	// キャラクター
	SetPointPos_(player, "player000");
	SetDir_(player, 70);

	local todo = ArrangePointNpc_(model_todo, "npc_todo000");
	SetScaleSilhouette(todo, SCALE.TODO, 0.55);
	SetVisible(todo, false);

	local ookizuti = ArrangePointNpc_(model_ookizuti, "npc_ookizuti000");
	SetScaleSilhouette(ookizuti, SCALE.N, 0.4);
	SetStepSePan_(ookizuti, false);

// ▼非常駐モーション読込
	local player_surprise = ReadMotion_(player, "Player_surprise");			// 主人公驚く
	local player_surprise_L = ReadMotion_(player, "Player_surprise_L");		// 主人公驚くL
	local player_look_up = ReadMotion_(player, "Player_look_up_L");			// 主人公見上げる
	local player_nod = ReadMotion_(player, "Player_nod");					// 主人公うなづく
	local player_nod2 = ReadMotion_(player, "Player_nod02");				// 主人公うなづく(見上げ)
	local player_talk = ReadMotion_(player, "Player_talk");					// 主人公話す
	local player_talk_L = ReadMotion_(player, "Player_talk_L");				// 主人公話すL
	
	local todo_arm_folde = ReadMotion_(todo, "n039_arm_folde01");		// 待機→腕組み
	local todo_arm_folde_L = ReadMotion_(todo, "n039_arm_folde01_L");	// 腕組み1L（目閉じ）
	local todo_talk = ReadMotion_(todo, "n039_talk");					// 腕組み1→怒り会話
	local todo_talk_L = ReadMotion_(todo, "n039_talk_L");				// 怒り会話L
	local todo_arm_folde02_L = ReadMotion_(todo, "n039_arm_folde02_L");	// 腕組み2L（目開け）
	local todo_arm_above_L = ReadMotion_(todo, "n039_arm_above_L");		// 腕組み　見上げる
	local todo_bow = ReadMotion_(todo, "n039_bow");						//トードー 頭を下げる
	local todo_talk2_L = ReadMotion_(todo, "m141_00_talk02_L");				//トードー 会話２

	local ookizuti_talk_L = ReadMotion_(ookizuti, "m035_00_talk_L");		// 会話L
	
	SetMotion_(player, MOT_WALK, BLEND_N);
	
// ▼カメラ設定
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	
//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------
	
	StartDemo(FADE_COLOR_BLACK);
	
	//===============================================
	//*トードーの子分Ａ
	// 「トードー親分すまねえ！　取り逃しちまったべ！
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_302_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetVisible(ookizuti, false);
	SetVisible(todo, true);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット2
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	InitSilhouetteWidth_(todo, 0.9);
	Wait_(10);
	PlaySE_("SE_DEM_026");	// ■SE:集中線
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", CAMERA_DEF);
	
	efc_todo = SetSelectBoneEffectSetOffset_("ef712_13_emo_sweat01", todo, ATTACH_EFFECT2, Vec3(0.6, 9.8, 15.1));
	SetEffectScale_(efc_todo, 2.0);
	SetMotion_(todo, todo_talk2_L, BLEND_M);

	//===============================================
	//*トードー
	// 「かぁーっ！　まったく腹が立つのう！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TODO");
	ShowMsg_("DEMO_302_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();

	DeleteTask_(task_cam);
	DeleteEffect_(efc_cam);
	DeleteEffect_(efc_todo);
	
	SetVisible(ookizuti, true);
	InitSilhouetteWidth_(ookizuti, 1.5);
	
	SetPointPos_(todo, "npc_todo001");
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット3
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");
	SetMotion_(todo, MOT_WAIT, BLEND_N);
	InitSilhouetteWidth_(todo, 1.5);
	
	task_player = Task_AnimeMove_(player, "anm_player000");
	Wait_(5);
	
	SetMotion_(todo, todo_arm_folde, BLEND_L);
	WaitMotion(todo);
	SetMotion_(todo, todo_arm_folde_L, BLEND_XL);					//目閉じ
	
	WaitTask(task_player);
	SetMotion_(player, player_look_up, BLEND_L);

	
	// 主人公に気づく二人
	efc_todo = SetSelectBoneEffectSetOffset_("ef712_10_emo_surprise01", todo, ATTACH_EFFECT1, Vec3(5.0, 1.5, 0.0));
	SetEffectScale_(efc_todo, 3.0);
	efc_ookizuti = SetSelectBoneEffect_("ef712_10_emo_surprise01", ookizuti, ATTACH_EFFECT1);	// 「！」
	SetEffectScale_(efc_ookizuti, 3.0);
	PlaySE_("SE_DEM_053");		// 「ピンッ！」
	SetMotion_(todo, todo_arm_folde02_L, BLEND_L);
	
	Wait_(30);
	
	SetMotion_(ookizuti, MOT_WALK, BLEND_M);
	task_ookizuti = Task_RotateToDir_(ookizuti, 250, ROTATE_DEMO_DEF);
	WaitTask(task_ookizuti);
	task_ookizuti = Task_RotateToDir_(ookizuti, 360, ROTATE_DEMO_DEF);
	WaitTask(task_ookizuti);
	task_ookizuti = Task_AnimeMove_(ookizuti, "anm_ookizuti000");
	
	//===============================================
	//*トードーの子分Ａ
	// 「おう！　お前どこの組のもんだべ？
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_302_MSG_040");
	
	WaitTask(task_ookizuti);
	SetMotion_(ookizuti, MOT_WAIT, BLEND_M);
	
	// 主人公のけぞる
	SetMotion_(player, player_surprise, BLEND_M);
	WaitMotion(player);
	SetMotion_(player, player_surprise_L, BLEND_M);
	
	KeyInputWait_();
	CloseMsgWnd_();

	DeleteTask_(task_cam);
	SetPointPos_(todo, "npc_todo000");

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット4
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	InitSilhouetteWidth_(ookizuti, 1.0);
	SetStepSe_(player, SILENT_STEP_SE);	// 足音を 無音にする
	SetPointPos_(player, "player001");
	SetMotion_(ookizuti, ookizuti_talk_L, BLEND_N);
	Wait_(5);
	ResetStepSe_(player);

	//===============================================
	//*トードーの子分Ａ
	// 「ポーラパークを仕切る　トードー親分の屋敷で
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_302_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(10);
	DeleteEffect_(efc_todo);
	SetVisible(ookizuti, false);

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット5
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye005", "anmtgt005");
	InitSilhouetteWidth_(todo, 0.6);
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", CAMERA_DEF);
	PlaySE_("SE_DEM_001");		// ◆汎用・大声の演出

	SetMotion_(todo, todo_talk_L, BLEND_N);
	
	efc_todo = SetSelectBoneEffectSetOffset_("ef712_13_emo_sweat01", todo, ATTACH_EFFECT2, Vec3(0.6, 9.8, 15.1));
	SetEffectScale_(efc_todo, 2.0);
	
	//===============================================
	//*トードー
	// 「やめんか！　イエタスの手下にゃ見えん。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TODO");
	ShowMsg_("DEMO_302_MSG_060");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	Wait_(7);
	
	task_ookizuti = Task_AnimeMove_(ookizuti, "anm_ookizuti001");
	Wait_(3);
	
	DeleteEffect_(efc_todo);
	
	DeleteTask_(task_cam);
	DeleteEffect_(efc_cam);

	SetMotion_(ookizuti, MOT_WALK, BLEND_N);
	SetVisible(ookizuti, true);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット6
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");
	InitSilhouetteWidth_(todo, 1.45);
	SetMotion_(player, MOT_WAIT, BLEND_N);
	
	SetStepSe_(todo, SILENT_STEP_SE);					// 足音を無音にする
	SetStepSe_(ookizuti, SILENT_STEP_SE);				// 足音を無音にする
	SetMotion_(todo, MOT_WALK, BLEND_L);
	task_todo = Task_AnimeMove_(todo, "anm_todo000");
	SetPointPos_(player, "player002");
	
	WaitTask(task_ookizuti);
	DeleteTask_(task_ookizuti);
	task_ookizuti = Task_RotateToPos_(ookizuti, GetPos_(todo), ROTATE_DEMO_DEF);
	SetMotion_(ookizuti, MOT_WAIT, BLEND_M);
	SetMotion_(player, player_look_up, BLEND_XL);
	
	PlaySE_("SE_FLD_029");		// モンスター移動：生物・4足（重）
	Wait_(30);
	PlaySE_("SE_FLD_029");		// モンスター移動：生物・4足（重）
	WaitTask(task_todo);

	SetMotion_(todo, todo_arm_folde02_L, BLEND_XL);
	
	//===============================================
	//*トードー
	// 「ん？　その姿は　まさか……？
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TODO");
	ShowMsg_("DEMO_302_MSG_070");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	DeleteTask_(task_ookizuti);
	SetMotion_(ookizuti, MOT_WALK, BLEND_M);
	task_ookizuti = Task_MoveForward_(ookizuti, 0.5, false);
	Wait_(20);
	DeleteTask_(task_ookizuti);
	SetMotion_(ookizuti, MOT_WAIT, BLEND_M);
	
	//===============================================
	//*トードーの子分Ａ
	// 「親分……いかがされたべ？
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_302_MSG_080");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	Wait_(20);
	DeleteTask_(task_cam);
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット7　主アップ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetVisible(ookizuti, false);

	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");
	
	//===============================================
	//*トードー
	// 「……おんしは　<name_player/>じゃな。
	// 　ルキヤに　会いに来たんか……？
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TODO");
	ShowMsg_("DEMO_302_MSG_090");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	SetMotion_(player, player_nod2, BLEND_L);						//見上げ頷き
	Wait_(20);
	SetMotion_(player, player_look_up, BLEND_L);
	
	Wait_(30);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット8　トードーアップ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetVisible(ookizuti, true);

	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");
	InitSilhouetteWidth_(todo, 0.6);

	Wait_(30);
	SetMotion_(todo, todo_arm_folde02_L, BLEND_XL);					//目開け

	//===============================================
	//*トードー
	// 「ルキヤは　ワシの古き友にして　恩人。
	//　奴から　おんしのことは　聞いておった。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TODO");
	ShowMsg_("DEMO_302_MSG_100");
	KeyInputWait_();
	//===============================================
	SetMotion_(todo, todo_arm_folde_L, BLEND_L);

	//===============================================
	//*トードー
	// 「ルキヤから　おんしが　黒鉄の監獄塔に行く
	//　手伝いを　頼まれとったが……
	//-----------------------------------------------
	ShowMsg_("DEMO_302_MSG_110");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	Wait_(30);
	DeleteTask_(task_cam);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット9　全体
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetPointPos_(player, "player003");								//主　移動
	SetPointPos_(ookizuti, "npc_ookizuti001");						//おおきづち移動
	SetPointPos_(todo, "npc_todo002");								//トードー移動
	task_cam = Task_AnimeMoveCamera_("anmeye006", "anmtgt006");
	
	//===============================================
	//*トードー
	// 「ルキヤが去ったあと　黒鉄の監獄塔への
	//　移動装置が　使えなくなってのう。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TODO");
	ShowMsg_("DEMO_302_MSG_120");
	KeyInputWait_();
	//===============================================
	
	SetMotion_(todo, todo_arm_folde_L, BLEND_XL);					//目閉じ
	//===============================================
	//*トードー
	// 「なんとか　したかったんじゃが　ワシらも
	//　今　大きな問題を　かかえておるんじゃ。
	//-----------------------------------------------
	ShowMsg_("DEMO_302_MSG_130");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(50);
	
	PlaySE_("SE_DEM_053");																// SE「ピンッ！」
	efc_todo = SetPointWorldEffect_("ef712_10_emo_surprise01", "efc_bikkuri000");		//「！」※カメラの都合によりBlenderで設置
	SetEffectScale_(efc_todo, 1.4);
	
	SetMotion_(todo, todo_talk, BLEND_M);							//怒り会話
	WaitMotion(todo);
	SetMotion_(todo, todo_talk_L, BLEND_XL);						//怒り会話L

	//===============================================
	//*トードー
	// 「……そうじゃ！　おんし　ワシらの問題を
	//　解決するのに　手を貸してくれんか？
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TODO");
	ShowMsg_("DEMO_302_MSG_140");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	Wait_(10);
	DeleteTask_(task_cam);
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット10　トードーアップ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetAlpha_(player, ALPHA_CLEAR);
	task_cam = Task_AnimeMoveCamera_("anmeye008", "anmtgt008");
	//===============================================
	//*トードー
	// 「今　ワシらは　東ポーラパークのイエタスと
	//　はげしく　抗争しておってな。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TODO");
	ShowMsg_("DEMO_302_MSG_150");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	//*トードー
	// 「じゃが　こんな争いは　終わらせたいと
	//　イエタスに　伝えてきてくれんか。
	//-----------------------------------------------
	ShowMsg_("DEMO_302_MSG_160");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	SetMotion_(todo, todo_arm_folde02_L, 20);					//目開け
	Wait_(30);
	DeleteTask_(task_cam);
	SetAlpha_(player, ALPHA_EXIST);
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット11 主「嫌です」
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetVisible(ookizuti, false);	
	SetMotion_(player, player_talk_L, BLEND_N);						//主　「嫌です」
	task_cam = Task_AnimeMoveCamera_("anmeye007", "anmtgt007");
	WaitTask(task_cam);
	SetMotion_(player, player_look_up, BLEND_XL);
	Wait_(50);
	SetVisible(ookizuti, true);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット12 全体
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye006", "anmtgt006");
	SetMotion_(todo, todo_arm_folde_L, BLEND_XL);					//トードー目閉じ
	
	//===============================================
	//■トードー
	// 「イエタスも　ルキヤの世話に　なっとる。
	//　おんしが間に入れば　争いは収まるはずじゃ！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TODO");
	ShowMsg_("DEMO_302_MSG_180");
	SetMotion_(todo, MOT_WAIT, BLEND_XL);						//通常待機	
	KeyInputWait_();
	//===============================================

	//===============================================
	//*トードー
	// 「この通り　頼む！　東ポーラパークに行って
	//　イエタスに　抗争は　しまいじゃと伝えてくれ！
	//-----------------------------------------------
	ShowMsg_("DEMO_302_MSG_190");
	
	SetMotion_(todo, todo_bow, BLEND_XL);						//おじぎ
//	SetMotionSpeed_(todo, 1.5);	
	WaitMotion(todo);
	SetMotion_(todo, MOT_WAIT, BLEND_XL);						//通常待機
//	SetMotionSpeed_(todo, 1.0);	

	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================	
	Wait_(20);
	DeleteTask_(task_cam);
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット13　主アップ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetVisible(ookizuti, false);
	SetPointPos_(player, "player002");								//主　移動
	task_cam = Task_AnimeMoveCamera_("anmeye009", "anmtgt009");
	//===============================================
	//*トードー
	// 「じゃが　東ポーラパークへは　氷原にある
	//　水中トンネルから　大回りせんと　行けんのだ。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TODO");
	ShowMsg_("DEMO_302_MSG_200");
	KeyInputWait_();
	//===============================================
	//===============================================
	//*トードー
	// 「○主人公の名前○よ　まずは
	//　南西にある　モノリスに　寄るんじゃ。
	//-----------------------------------------------
	ShowMsg_("DEMO_302_MSG_210");
	KeyInputWait_();
	//===============================================	
	//===============================================
	//*トードー
	// 「バーチャルコロシアムで　水中を進める
	//　新たなモンスターライドを　手に入れるんじゃ！
	//-----------------------------------------------
	ShowMsg_("DEMO_302_MSG_220");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	Wait_(10);
	SetMotion_(player, player_nod2, BLEND_L);						//主　「しょうがない」見上げ頷き
	Wait_(20);
	SetMotion_(player, player_look_up, BLEND_L);
	Wait_(50);
	DeleteTask_(task_cam);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット14　トドアップ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetPointCameraEye_("cameye004");
	SetPointCameraTarget_("camtgt004");
	
	SetMotion_(todo, todo_arm_folde02_L, BLEND_XL);					//目開け
	//===============================================
	//*トードー
	// 「モノリスを守る　手下に　話は伝えておく。
	//　頼んだけえ　<name_player/>。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TODO");
	ShowMsg_("DEMO_302_MSG_230");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
//	SetMotion_(todo, todo_arm_folde02_L, BLEND_XL);					//目開け
	Wait_(30);
	EndDemo(FADE_COLOR_BLACK);
}
