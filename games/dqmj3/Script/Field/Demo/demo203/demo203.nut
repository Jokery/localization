//=============================================
//
//		demo203[聖堂入り口]
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
	local task_cam, task_player, task_hunter, task_foot;
	local efc_player, efc_hunter;
	local flg_select_no = false;			// 「いいえ」を選んだかどうかを判定するフラグ
	local effect_pos00 = Vec3(1.2, 0.8, 0);	// 汗エフェクトを、Effect1より少し高い位置に表示する
	local effect_pos01 = Vec3(0, 2.0, 0);	// 汗エフェクトを、Effect1より少し高い位置に表示する

// ▼リソース読込
	// ギミック
	local model_stone = ReadGimmick_("o_G02_21");	// 石像（左下）
	local model_door = ReadGimmick_("o_G02_01");	//扉
	// キャラクター
	local player = GetPlayerId_();					// 主人公
	local model_hunter = ReadNpc_("n006");			// チョーマッハ
	// エフェクト
	LoadEffect_("ef712_10_emo_surprise01");			// 「！」
	LoadEffect_("ef712_13_emo_sweat01");			// 汗

// ▼配置
	// 石像（左下）
	local stone003 = ArrangePointGimmick_("o_G02_21", model_stone, "obj_statue003");
	// 扉
	local door000 = ArrangePointGimmick_("o_G02_02", model_door, "obj_door000");
	
	// 主人公
	SetPointPos_(player, "player000");
	// チョーマッハ
	local hunter = ArrangePointNpc_(model_hunter, "npc_hunter000");

// ▼非常駐モーション読込
	// 主人公
	local player_look_walk_L = ReadMotion_(player, "Player_look_walk_L");		// 歩き（あたりを見回す）L
	local player_look_left_L = ReadMotion_(player, "Player_look_left_L");		// 左を向くL
	
	// チョーマッハ
	local hunter_show_face = ReadMotion_(hunter, "n002_show_face");				// ドアから顔を出す
	local hunter_show_face_L = ReadMotion_(hunter, "n002_show_face_L");			// ドアから顔を出すL
	local hunter_run_L = ReadMotion_(hunter, "n001_run_L");						// 走るL
	local hunter_hand_up = ReadMotion_(hunter, "n002_hand_up");					// 手をあげる
	local hunter_hand_up_L = ReadMotion_(hunter, "n002_hand_up_L");				// 手をあげるL
	local hunter_talk_joy_L = ReadMotion_(hunter, "n000_talk_joy_L");			// 会話（嬉しそう）L
	local hunter_feel_down = ReadMotion_(hunter, "n000_feel_down");				// 落ち込み
	local hunter_feel_down_L = ReadMotion_(hunter, "n000_feel_down_L");			// 落ち込みL
	local hunter_stand_right_L = ReadMotion_(hunter, "n000_stand_right_L");		// 右を見る
	local hunter_arm_folde_L = ReadMotion_(hunter, "n000_arm_folde_L");			// 腕組みL
	local hunter_impatience_L = ReadMotion_(hunter, "n002_impatience_L");		// 焦るL
	
// ▼モーション設定
	SetMotion_(player, player_look_walk_L, BLEND_N);				// 歩き（あたりを見回す）L
	task_player = Task_MoveToPointSetSpeed_(player, "player001", 0.46);

// ▼カメラ設定
	task_cam = Task_AnimeMoveCamera_("anmeye006", "anmtgt006");		// 120F
	
// ▼時間設定
	SetTime_(START_TIME_ZONE_NIGHT);

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------
	StartDemo(FADE_COLOR_BLACK);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//カット１　主人公カメライン
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	PlaySE_("SE_FLD_018");
	SetStepSe_(player, SILENT_STEP_SE);
	Wait_(9);
	
	SetMotion_(player, MOT_WALK, BLEND_XL);
	Wait_(3);
	ResetStepSe_(player);
	
	WaitTask(task_player);
	SetMotion_(player, MOT_WAIT, BLEND_XL);
	
	DeleteTask_(task_cam);
	SetMotion_(hunter, hunter_show_face_L, BLEND_N);				// ドアから顔を出すL
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//カット２　チョーマッハを見つける
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	Wait_(20);
	
	SetMotion_(player, player_look_left_L, BLEND_XL);		// 左を向くL
	Wait_(15);
	
	// 主人公が右を向いたタイミングで表示
	SurpriseDisp(hunter);
	Wait_(60);
	
	efc_hunter = SetSelectBoneEffectSetOffset_("ef712_13_emo_sweat01", hunter, ATTACH_EFFECT1, effect_pos00);		// 汗
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//カット３　チョーマッハアップ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	
	//===============================================
	// *チョーマッハ
	// 「シュシュっ！？
	// 　見られてしまったッシュ！
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_203_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(hunter, hunter_run_L, BLEND_M);			// 走るL
	task_hunter = Task_MoveToPointSetSpeed_(hunter, "npc_hunter001", 1.0);
	WaitTask(task_hunter);
	
	// ズームイン
	task_cam = Task_AnimeMoveCamera_("anmeye010", "anmtgt010");		// 60F
	WaitTask(task_cam);
	
	DeleteTask_(task_hunter);
	DeleteEffect_(efc_hunter);
	
	SetMotion_(hunter, hunter_show_face, BLEND_N);		// ドアから顔を出す
	Wait_(5);		// ノチョーラチラつき防止
	SetPointPos_(hunter, "npc_hunter000");
	WaitMotion(hunter);
	SetMotion_(hunter, hunter_show_face_L, BLEND_M);
	
	//===============================================
	// *チョーマッハ
	// 「ひょっとして……人間！？
	// 　もしかして　<name_player/>かッシュ！？
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_203_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//カット４　主人公カメライン
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye007", "anmtgt007");		// 70F
	
	SetMotion_(hunter, MOT_WALK, BLEND_M);
	task_hunter = Task_RotateToDir_(hunter, 90, ROTATE_DEMO_DEF/2);
	WaitTask(task_hunter);
	
	task_hunter = Task_MoveToPointSetSpeed_(hunter, "npc_hunter002", 0.5);
	WaitTask(task_hunter);
	SetMotion_(hunter, MOT_WAIT, BLEND_M);
	
	SetPointPos_(player, "player002");
	SetMotion_(player, MOT_WALK, BLEND_N);
	task_player = Task_MoveToPointSetSpeed_(player, "player003", 0.5);
	WaitTask(task_player);
	SetMotion_(player, MOT_WAIT, BLEND_M);
	
	SetMotion_(hunter, hunter_talk_joy_L, BLEND_L);		// 会話（嬉しそう）L
	
	//===============================================
	// *チョーマッハ
	// 「オマエのことは　リアクター通信で
	// 　エースから　聞いてるッシュ！
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_203_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	DeleteTask_(task_cam);
	SetAlpha_(player, ALPHA_CLEAR);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//カット５　チョーマッハズームイン
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye008", "anmtgt008");		// 180F
	
	SetMotion_(hunter, hunter_hand_up, BLEND_N);		// 手をあげる
	WaitMotion(hunter);
	SetMotion_(hunter, hunter_hand_up_L, BLEND_M);		// 手をあげるL
	
	//===============================================
	// *チョーマッハ
	// 「オレはチョーマッハ！　好きな物は　速い物！
	// 　嫌いな物は　おそい物だッシュ！
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_203_MSG_040");
	KeyInputWait_();
	
	SetMotion_(hunter, MOT_TALKLOOP, BLEND_L);
	
	//-----------------------------------------------
	// ■チョーマッハ
	// 「オレは　レジスタンスが　リアクターに残した
	// 　伝説のプログラムを探して　ここに来たッシュ。
	//-----------------------------------------------
	SetTalkName_("NAME_TAG_CHOMACH");
	ShowMsg_("DEMO_203_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	DeleteTask_(task_cam);
	SetAlpha_(player, ALPHA_EXIST);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//カット６　チョーマッハと主人公
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");
	
	SetMotion_(hunter, hunter_feel_down, BLEND_M);		// 落ち込み
	WaitMotion(hunter);
	SetMotion_(hunter, hunter_feel_down_L, BLEND_M);	// 落ち込みL
	
	//===============================================
	// ■チョーマッハ
	// 「でも　リアクターは　ブンドルドがひとりじめ！
	// 　オレとしたことが　出遅れたッシュ……。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_CHOMACH");
	ShowMsg_("DEMO_203_MSG_060");
	KeyInputWait_();
	
	SetMotion_(hunter, MOT_TALKLOOP, BLEND_L);
	
	//-----------------------------------------------
	// ▽
	// 「なあ　<name_player/>。
	// 　ブンドルドを倒しに　来たんだッシュ？
	//-----------------------------------------------
	ShowMsg_("DEMO_203_MSG_070");
	KeyInputWait_();
	
	//2択質問
	//-----------------------------------------------
	// ▽
	// 「もしも　ブンドルドを　倒してくれるなら
	// 　このガーデンの　ヒミツを教えてやるッシュ！
	//-----------------------------------------------
	ShowMsg_("DEMO_203_MSG_080");
	KeyInputWait_();
	
	while(true)
	{
		// 【はいの場合】
		if (GetQueryResult_() == QUERY2_0) {
			SetMotion_(hunter, hunter_talk_joy_L, BLEND_L);		// 会話（嬉しそう）L
			
			//-----------------------------------------------
			// ▽
			// 「うむ！　やってくれるかッシュ！
			// 　会ったばかりだけど　信じてたッシュ！
			//-----------------------------------------------
			ShowMsg_("DEMO_203_MSG_090");
			KeyInputWait_();
			
			break;
		}
		// 【いいえの場合】
		else {
			//-----------------------------------------------
			// ▽
			// 「すばやく　断られたッシュ！
			// 　いや　そんなこと言わずに　頼むッシュ！
			//-----------------------------------------------
			ShowMsg_("DEMO_203_MSG_085");
			KeyInputWait_();
		}
	}
	
	SetMotion_(hunter, MOT_TALKLOOP, BLEND_L);
	
	//-----------------------------------------------
	// ■チョーマッハ
	// 「それじゃ　ます　あの石像を見るッシュ！
	// 　あれが　ガーデンのしかけの　キモだッシュ！
	//-----------------------------------------------
	ShowMsg_("DEMO_203_MSG_100");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(hunter, MOT_WALK, BLEND_L);
	task_hunter = Task_RotateToDir_(hunter, 45, ROTATE_DEMO_DEF/2);
	WaitTask(task_hunter);
	
	SetMotion_(hunter, hunter_stand_right_L, BLEND_XL);		// 右を見るL
	Wait_(10);
	
	SetMotion_(player, player_look_left_L, BLEND_XL);		// 左を見るL
	Wait_(45);
	
	SetAlpha_(player, ALPHA_CLEAR);
	SetMotion_(hunter, MOT_WAIT, BLEND_N);
	SetDir_(hunter, 90);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//カット７　石像（左上）ズーム
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetPointCameraEye_("cameye003");
	SetPointCameraTarget_("camtgt003");
	Wait_(30);
	
	// ズームアウト
	task_cam = Task_AnimeMoveCamera_("anmeye009", "anmtgt009");		// 150F
	
	WaitTask(task_cam);
	Wait_(40);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//カット８　チョーマッハズームイン
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye008", "anmtgt008");		// 180F
	
	SetMotion_(hunter, MOT_TALKLOOP, BLEND_N);
	
	//===============================================
	// ■チョーマッハ
	// 「あの石像……実は　動かせるッシュ。
	// 　魔物たちが　動かしてるのを　見たッシュ！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_CHOMACH");
	ShowMsg_("DEMO_203_MSG_110");
	KeyInputWait_();
	//-----------------------------------------------
	
	SetMotion_(hunter, hunter_arm_folde_L, BLEND_XL);	// 腕組みL
	
	//-----------------------------------------------
	// ▽
	// 「あの石像を　正しい向きへと　動かせば
	// 　どうやら　隠し扉が　開くようなんだッシュ。
	//-----------------------------------------------
	ShowMsg_("DEMO_203_MSG_113");
	KeyInputWait_();
	
	SetMotion_(hunter, hunter_hand_up, BLEND_M);		// 手をあげる
	task_hunter = Task_ChangeMotion_(hunter, hunter_hand_up_L, BLEND_M);
	
	//-----------------------------------------------
	// ▽
	// 「さあ！　ガーデンのしかけを　解いて
	// 　ブンドルドの元に　乗り込むッシュ！
	//-----------------------------------------------
	ShowMsg_("DEMO_203_MSG_120");
	KeyInputWait_();
	
	//-----------------------------------------------
	// ▽
	// 「オレも　謎解きに　協力するから
	// 　がんばってくれシュ！
	//-----------------------------------------------
	ShowMsg_("DEMO_203_MSG_125");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	EndDemo(FADE_COLOR_BLACK);
}
