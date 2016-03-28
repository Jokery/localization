//=====================================================================================
//
//		demo102[センタービルに入れないノチョーラ]
//
//=====================================================================================

//-------------------------------------------------------------------------
//
//		読み込み・配置
//
//-------------------------------------------------------------------------
function Update()
{
// ▼変数定義
	local task_cam, task_player, task_ace, task_jack, task_queen, task_nocho01, task_nocho02, task_nocho03, task_nocho04;
	
// ▼フラグ設定
	local bit_ruler = GetEventFlg_("BFG_RULER_ADD_005");			// Bit_205 ルーラ追加フラグ

// ▼リソース読込
	// ギミック
	local obj_gate = ReadGimmick_("o_A00_03");		// シェルター
	local model_window = ReadGimmick_("o_A00_04");	// センタービルの窓
	local model_throne = ReadGimmick_("o_com_05");	// 玉座
	local model_ruler = ReadGimmick_("o_com_08");	// ルーラポイント
	// キャラクター
	local player = GetPlayerId_();					// 主人公
	local npc_nocho = ReadNpc_("n000");				// ノチョーラ
	local npc_jack = ReadNpc_("n001");				// ジャック
	local npc_ace = ReadNpc_("n002");				// エース
	local npc_king = ReadNpc_("n003");				// キング
	local npc_queen = ReadNpc_("n005");				// クイーン
	// エフェクト
	LoadEffect_("ef712_10_emo_surprise01");

// ▼配置
	// シェルター
	local res_gate = ArrangePointGimmick_("o_A00_03", obj_gate, "obj_shutter000");
	// センタービルの窓
	local window = ArrangePointGimmick_("o_A00_04", model_window, "obj_light000");
	SetMotion_(window, MOT_GIMMICK_0, BLEND_N);
	// 玉座
	local throne = ArrangePointGimmick_("o_com_05", model_throne, "obj_throne000");
	SetDir_(throne, 90);
	// ルーラポイント
	local ruler = ArrangePointGimmick_("o_com_08", model_ruler, "obj_ruler000");
	// ▽ルーラポイントが既に起動していた場合
	if (bit_ruler) { SetMotion_(ruler, MOT_GIMMICK_2, BLEND_N); }
	
	// 主人公
	SetPointPos_(player, "player000");
	// キング
	local res_king = ArrangePointNpc_(npc_king, "npc_king000");
	// エース
	local res_ace = ArrangePointNpc_(npc_ace, "npc_ace000");
	// ジャック
	local res_jack = ArrangePointNpc_(npc_jack, "npc_jack000");
	// クイーン
	local res_queen = ArrangePointNpc_(npc_queen, "npc_queen000");
	// ノチョーラ
	local res_nocho01 = ArrangePointNpc_(npc_nocho, "npc_nocho000");
	local res_nocho02 = ArrangePointNpc_(npc_nocho, "npc_nocho001");
	local res_nocho04 = ArrangePointNpc_(npc_nocho, "npc_nocho003");

// ▼非常駐モーション読込
	local player_right = ReadMotion_(player, "Player_look_right_L");	// プレイヤー右を向く
	
	local bldgL_king = ReadMotion_(res_king, "n003_look_bldg_L");		// キングセンタ－ビルを見るL
	local rightL_king = ReadMotion_(res_king, "n003_look_right_L");		// キングセンタ－ビルを見るL
	local talk_king = ReadMotion_(res_king, "n003_talk");				// キング待機→会話
	local talkL_king = ReadMotion_(res_king, "n003_talk_L");			// キング会話
	local think_king = ReadMotion_(res_king, "n003_think");				// キング待機→考える
	local thinkL_king = ReadMotion_(res_king, "n003_think_L");			// キング考える
	
	local hand_ace = ReadMotion_(res_ace, "n002_hand_up");				// エース会話→手を挙げる
	local handL_ace = ReadMotion_(res_ace, "n002_hand_up_L");			// エース手を挙げるL
	local tlook_upL_ace = ReadMotion_(res_ace, "n002_look_up_L");		// エース上向き待機L

// ▼初期モーション
	SetMotion_(res_king, bldgL_king, BLEND_N);
	SetMotion_(res_ace,  MOT_WAIT, BLEND_N);
	SetMotion_(player, MOT_WALK, BLEND_N);
	task_player = Task_MoveForward_(player, 1.0, false);
	
	SetDirToObject_(res_jack, res_king);
	SetDirToObject_(res_ace, res_king);
	SetDirToObject_(res_queen, res_king);
	SetDirToObject_(res_nocho04, res_king);
	SetDirToObject_(res_nocho01, res_king);
	SetDirToObject_(res_nocho02, res_king);

// ▼カメラ設定
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");		// 105F
	WaitLod_();

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	Wait_(50);
	
	SetMotion_(player, MOT_WAIT, BLEND_M);
	DeleteTask_(task_player);
	
	local sup_king = SurpriseDisp(res_king);
	SetEffectScale_(sup_king, 1.5);
	Wait_(15);
	
	SetMotion_(res_king, rightL_king, 16);		// ゆっくり右を向かせる
	
	task_ace = Task_WalkAroundToPos(res_ace, GetPos_(player), ROTATE_DEMO_DEF);
	Wait_(2);
	task_queen = Task_WalkAroundToPos(res_queen, GetPos_(player), ROTATE_DEMO_DEF);
	Wait_(1);
	task_nocho02 = Task_WalkAroundToPos(res_nocho02, GetPos_(player), ROTATE_DEMO_DEF);
	Wait_(1);
	task_jack = Task_WalkAroundToPos(res_jack, GetPos_(player), ROTATE_DEMO_DEF);
	Wait_(1);
	task_nocho04 = Task_WalkAroundToPos(res_nocho04, GetPos_(player), ROTATE_DEMO_DEF);
	
	WaitTask(task_jack);
	SetMotion_(res_jack, MOT_WAIT, BLEND_M);
	DeleteTask_(task_jack);
	WaitTask(task_ace);
	SetMotion_(res_ace, MOT_WAIT, BLEND_M);
	DeleteTask_(task_ace);
	SetMotion_(res_nocho02, MOT_WAIT, BLEND_M);
	DeleteTask_(task_nocho02);
	WaitTask(task_queen);
	SetMotion_(res_queen, MOT_WAIT, BLEND_M);
	DeleteTask_(task_queen);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット2　キングアップ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓	
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 10);
	WaitFade_();
	
	DeleteTask_(task_cam);
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	
	SetMotion_(res_nocho04, MOT_WAIT, BLEND_N);
	DeleteTask_(task_nocho04);
	
	SetPointPos_(player, "player001");
		
	SetMotion_(res_king, MOT_WAIT, BLEND_N);

	SetDirToPlayer_(res_king);
	SetDirToPlayer_(res_ace);
	SetDirToPlayer_(res_jack);
	SetDirToPlayer_(res_queen);
	SetDirToPlayer_(res_nocho01);
	SetDirToPlayer_(res_nocho02);
	SetDirToPlayer_(res_nocho04);
	SetAlpha_(res_nocho04, ALPHA_CLEAR);
	
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 10);
	WaitFade_();
	
	SetMotion_(res_king, talk_king, BLEND_M);	//話すキング
	WaitMotion(res_king);
	SetMotion_(res_king, talkL_king, BLEND_M);
	
	// ■キング
	// 「<name_player/>！　そちか！
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_102_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	
	SetAlpha_(res_nocho04, ALPHA_EXIST);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット3　シャッターを見上げる
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	
	MotionTalk(res_ace);
	
	// ■エース
	// 「実は　都市全体の電源が　落ちていて
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_102_MSG_020");
	KeyInputWait_();
	
	SetMotion_(res_king, bldgL_king, BLEND_L);	//見上げるキング
	
	// 「中に　人間がいるかもしれねーってのに
	ShowMsg_("DEMO_102_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	
	SetMotion_(res_ace, MOT_WAIT, BLEND_M);
	
	WaitTask(task_cam);	
	
	DeleteTask_(task_cam);

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット4　エース＆ジャック
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetAlpha_(res_queen, ALPHA_CLEAR);										//クイーン非表示
	
	SetDirToObject_(res_jack, player);										//ジャック、エース主人公へ向く
	SetDirToObject_(res_ace, player);
	SetDirToObject_(player, res_ace);										//主人公エースの方を向く
	
	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");
	
	//■エース
	// 「だけど　電源装置のある　送電施設への道には
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");	
	ShowMsg_("DEMO_102_MSG_040");	
	
	SetMotion_(res_ace, MOT_WALK, BLEND_M);									//エースが歩く
	local task_ace = Task_MoveForward_(res_ace, 1.0, false);				//エース移動
	
	Wait_(25);
	DeleteTask_(task_ace);
	
	MotionTalk(res_ace);
	KeyInputWait_();
	CloseMsgWnd_();
	SetMotion_(res_ace, MOT_WAIT, BLEND_M);
	
	// ■ジャック
	// 「<name_player/>どの　どうか送電施設へ行き
	MotionTalk(res_jack);
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_JACK");
	ShowMsg_("DEMO_102_MSG_050");
	
	SetMotion_(player, player_right, BLEND_L);								//主人公ジャックの方（右）を向く
	
	KeyInputWait_();
	CloseMsgWnd_();	
	SetMotion_(res_jack, MOT_WAIT, BLEND_M);
	
	DeleteTask_(task_cam);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット5　送電施設
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 10);	
	WaitFade_();

	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 20);
		
	WaitFade_();
	
	// ■ジャック
	// 「この場所から　西へ道なりに進んだ先に
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_JACK");	
	ShowMsg_("DEMO_102_MSG_060");
	KeyInputWait_();
	CloseMsgWnd_();
	
	// ■エース
	// 「北西のあたりに　石碑があるから
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_102_MSG_070");
	KeyInputWait_();
	
	ShowMsg_("DEMO_102_MSG_080");
	KeyInputWait_();	
	
	CloseMsgWnd_();
	
	Wait_(20);
	
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 10);
	
	SetMotion_(player, MOT_WAIT, BLEND_M);			//主人公待機
	WaitFade_();
	
	DeleteTask_(task_cam);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット6　キングアップ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetMotion_(res_king, talkL_king, BLEND_N);
	
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 10);
	WaitFade_();
	
	// ■キング
	// 「電源復旧の件　よろしく頼むのである。
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEMO_102_MSG_090");
	KeyInputWait_();
	CloseMsgWnd_();
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■デモ終了
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	
	EndDemo(FADE_COLOR_BLACK);
}
