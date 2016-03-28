//=============================================
//
//		demo122[キングに状況を報告]
//
//=============================================
function Update()
{
	//=====================================
	//ローカル変数の設定
	//=====================================
	local task_cam, task_player, task_ace, task_king;
	local efc_jack;
	
	//=====================================
	//プレイヤー設置
	//=====================================
	
	//IDの取得
	local player = GetPlayerId_();
	
	//設置
	SetPointPos_(player, "player000");
	
	//初期の向き
	SetDir_(player, 180);
	
	//初期のモーション
	SetMotion_(player, MOT_WAIT, 15);
	
	//α値の手動設定
	SetManualCalcAlpha_(player, true);
	
	//初期のα値
	SetAlpha_(player, 1.0);
	
	//=====================================
	//NPC設置
	//=====================================
	
	//リソースの読み込み
	local npc_ace = ReadNpc_("n002");										// エース
	local npc_king = ReadNpc_("n003");										// キング
	local model_jack = ReadNpc_("n001");									// ジャック
	local model_qween = ReadNpc_("n005");									// クイーン
	// ギミック
	local model_mixture = ReadGimmick_("o_A01_02");							// 配合装置
	local model_lift = ReadGimmick_("o_A01_00");			// エレベータ扉
	//設置
	local res_ace = ArrangePointNpc_(npc_ace, "npc_ace000");
	local res_king = ArrangePointNpc_(npc_king, "npc_king000");
	local res_qween = ArrangePointNpc_(model_qween, "npc_queen000");
	local res_jack = ArrangePointNpc_(model_jack, "npc_jack000");
	SetStepSe_(res_jack, SILENT_STEP_SE);									// 足音を無音にする
	
	// 配合装置
	local mixture = ArrangePointGimmick_("o_A01_02", model_mixture, "obj_mixture000");
	
	//エレベータ扉
	local lift01 = ArrangeGimmick_("o_A01_00", model_lift, Vec3(230.0, 2.0, 0.0));
	SetDir_(lift01, -90);
	SetMotion_(lift01, MOT_GIMMICK_0, BLEND_M);	

	local lift02 = ArrangeGimmick_("o_A01_00", model_lift, Vec3(-230.153, 2.0, 0.0));
	SetDir_(lift02, 90);
	SetMotion_(lift02, MOT_GIMMICK_0, BLEND_M);
	
	
	//初期の向き
	SetDir_(res_ace, 180);
	SetDir_(res_king, 0);
	local task_rotate = Task_RotateToPos_(res_qween, GetPos_(res_ace), 172);	
	local task_rotate2 = Task_RotateToPos_(res_jack, GetPos_(res_ace), 172);	
	
	//α値の手動設定
	SetManualCalcAlpha_(res_ace, true);
	
	//初期のα値
	SetAlpha_(res_ace, 1.0);
	
	//=====================================
	//モーションの読み込み
	//=====================================
	
	local look_left = ReadMotion_(player, "Player_look_left_L");			// 主人公顔を少し左向ける
	local think_king = ReadMotion_(res_king, "n003_think");					//キング待機→考える
	local thinkL_king = ReadMotion_(res_king, "n003_think_L");				//キング考える
	local nod_king = ReadMotion_(res_king, "n003_nod");						//キング考える
	local look_jack_king = ReadMotion_(res_king, "n003_look_jack");			//キングジャック見つめる
	local look_jackL_king = ReadMotion_(res_king, "n003_look_jack_L");		//キングジャック見つめる
	
	local joytalk_ace = ReadMotion_(res_ace, "n002_talk_joy_L");			//エース嬉しそうに話す
	local stand_ace = ReadMotion_(res_ace, "n002_stand01");					//エース会話→ジャンプ→待機
	local lookplayer_ace = ReadMotion_(res_ace, "n002_look_player");		//エース待機→主人公を見る
	local lookplayerL_ace = ReadMotion_(res_ace, "n002_look_player_L");		//エース主人公を見る
	local think_ace = ReadMotion_(res_ace, "n002_think");					//エース考える
	local think_aceL = ReadMotion_(res_ace, "n002_think_L");				//エース考えるL
	local nocho_arm_folde_L = ReadMotion_(res_ace, "n000_arm_folde_L");		// 腕組みL
	
	local jack_impatienceL = ReadMotion_(res_jack, "n001_impatience_L");	//ジャック焦る
	local jack_runL = ReadMotion_(res_jack, "n001_run_L");					//ジャック走る
	
	//初期のモーション
	SetMotion_(res_king, MOT_WAIT, BLEND_M);
	
	//=====================================
	//エフェクトの読み込み
	//=====================================
	LoadEffect_("ef712_13_emo_sweat01");			// 汗
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット1 全体描画
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	
	//=====================================
	//フェードイン
	//=====================================
	StartDemo(FADE_COLOR_BLACK);
	
	MotionTalk(res_ace);
	
	//===============================================
	// ■エース
	// 「キング　ただいま戻ったぜ！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_122_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット2　エースアップ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	DeleteTask_(task_cam);
	
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");
	
	SetMotion_(res_ace, joytalk_ace, BLEND_N);
	
	//-----------------------------------------------
	// ▽
	// 「あそこには　大地を動かす装置があってな……
	// 　そいつの誤作動で　地震が起きていたらしい。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_122_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	SetMotion_(res_ace, MOT_WAIT, BLEND_XL);					// エース待機
	Wait_(10);
	DeleteTask_(task_cam);

//	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット3 キングアップ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	
	SetMotion_(res_king, nod_king, BLEND_L);
	WaitMotion(res_king);
	SetMotion_(res_king, MOT_WAIT, BLEND_L);
	
	//===============================================
	// ■キング
	// 「おお……なんと　大きな発想であるか！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_122_MSG_080");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	// ■キング
	// 「しかし　誤作動とは……。
	// 　エースよ　今は　直ったのであるか？
	//-----------------------------------------------
	ShowMsg_("DEMO_122_MSG_090");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(player, look_left, BLEND_L);			//主人公エース見る
	
	//ジャックが移動	
	SetPointPos_(res_jack, "npc_jack001");
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット4　エース、ジャック
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");

	local task_step = Task_ChangeStepSe(res_jack, "SE_FLD_011", 8);						//■SE:ノチョーラ移動
	Wait_(8);
	//===============================================
	// ■ジャック
	// 「そ……そう！　大事なのは　それです！
	// 　また　地震が起こっては　たまりませんぞ！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_JACK");
	ShowMsg_("DEMO_122_MSG_100");	

	SetMotion_(res_jack, jack_runL, BLEND_M);											//ジャック走る
	local task_jack = Task_MoveForward_(res_jack, 1.0, true);							//ジャックカメライン
	efc_jack = SetSelectBoneEffect_("ef712_13_emo_sweat01", res_jack, ATTACH_EFFECT2);	// 汗
	
	local task_ace = Task_WalkAroundToPos(res_ace, GetPos_(res_jack), ROTATE_DEMO_DEF);
	local task_player = Task_WalkAroundToPos(player, GetPos_(res_jack), ROTATE_DEMO_DEF);

	WaitTask(task_ace);
	WaitTask(task_player);
	
	DeleteTask_(task_ace);
	SetMotion_(res_ace, MOT_WAIT, BLEND_M);					// エース待機
	
	DeleteTask_(task_player);	
	SetMotion_(player, MOT_WAIT, BLEND_M);					// 主人公待機
	
	DeleteTask_(task_jack);
	SetMotion_(res_jack, jack_impatienceL, BLEND_M);
	DeleteTaskStepSe(res_jack, task_step);
	
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(res_ace, nocho_arm_folde_L, BLEND_L);						//腕組みL

	//===============================================
	// ■エース
	// 「うーん……機械は　安定してたし
	// 　もう　地震は　起こらないと思うぜ。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_122_MSG_110");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	SetMotion_(res_king, look_jackL_king, BLEND_M);			//キング　ジャックの方を向く
	
	DeleteTask_(task_cam);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット5　キング、ジャック
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓	
	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");
	
	SetDirToObject_(player, res_king);						//主人公 キングの方を向く
	SetDirToObject_(res_ace, res_king);						//エース キングの方を向く	
	SetDirToObject_(res_jack, res_king);					//ジャック キングの方を向く	
	
	SetMotion_(res_jack, MOT_WAIT, BLEND_M);
	DeleteEffect_(efc_jack);
	
	SetMotion_(res_ace, MOT_WAIT, BLEND_M);

	//===============================================
	// ■キング
	// 「ジャックよ……エースが　そう言うならば
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_122_MSG_120");
	KeyInputWait_();
	ShowMsg_("DEMO_122_MSG_130");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetPointPos_(player, "player001");
	SetPointPos_(res_ace, "npc_ace001");
	SetDir_(player, 180);
	SetDir_(res_ace, 180);
	
	SetMotion_(res_king, MOT_WAIT, BLEND_L);
	SetAlpha_(res_king, ALPHA_CLEAR);
	
	DeleteTask_(task_cam);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット6　主人公、エース
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓	
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	
	SetMotion_(res_ace, MOT_TALKLOOP, BLEND_M);
	
	//===============================================
	// ■エース
	// 「キング！　事件が解決したところで……！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_122_MSG_140");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(res_ace, MOT_WAIT, BLEND_M);
	
	//===============================================
	// ■キング
	// 「うむ。許可は　すでに出しておる。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_122_MSG_150");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(res_ace, stand_ace, BLEND_M);	
	
	//===============================================
	// ■エース
	// 「了解だぜ！　すぐにでも　試運転してみる！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_122_MSG_160");
	
	WaitMotion(res_ace);
	
	SetMotion_(res_ace, lookplayer_ace, BLEND_M);	
	WaitMotion(res_ace);
	SetMotion_(res_ace, lookplayerL_ace, BLEND_M);
	
	SetMotion_(player, look_left, BLEND_L);				//主人公エースを見る
	
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■デモ終了
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	
	EndDemo(FADE_COLOR_BLACK);
}