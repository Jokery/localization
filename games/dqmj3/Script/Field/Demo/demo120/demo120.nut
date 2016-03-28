//=============================================
//
//		demo120[動く大地_4(解説)]
//
//=============================================
function Update()
{
// ▼変数定義
	local task_cam, task_player, task_ace;
	local rotate_pos = Vec3( -294.9, 0, -100.9);
	
// ▼リソース読込
	local model_red_screen = ReadGimmick_("o_A03_05");
	local model_monitor = ReadGimmick_("o_A03_04");
	local model_continent = ReadGimmick_("o_dem_04");
	local model_right_display = ReadGimmick_("o_A03_09");
	local model_left_display = ReadGimmick_("o_A03_10");
	
	local player = GetPlayerId_();
	local model_ace = ReadNpc_("n002");		// エース
	
// ▼配置
//	//ギミック
	local red_screen = ArrangePointGimmick_("o_A03_05", model_red_screen, "obj_red_screen000");
	SetMotion_(red_screen, MOT_GIMMICK_0, BLEND_N);													// 点滅ON
	
	local monitor = ArrangePointGimmick_("o_A03_04", model_monitor, "obj_monitor000");
	SetMotion_(monitor, MOT_GIMMICK_0, BLEND_N);
	
	local continent = ArrangePointGimmick_("o_dem_04", model_continent, "obj_continent000");
	SetMotion_(continent, MOT_GIMMICK_0, BLEND_N);

	local right_display = ArrangeGimmick_("o_A03_09", model_right_display, false);	//ディスプレイ
	local left_display = ArrangeGimmick_("o_A03_10", model_left_display, false);
	
	//キャラクター
	SetPointPos_(player, "player000");
	local ace = ArrangePointNpc_(model_ace, "npc_ace000");

// ▼非常駐モーション読込

	//主人公
	local player_look_up_L = ReadMotion_(player, "Player_look_up_L");		// 主人公上向き待機
	local player_look_down_L = ReadMotion_(player, "Player_look_down_L");	// 主人公下向き待機
	local player_look_left_L = ReadMotion_(player, "Player_look_left_L");	// 左を見る
	local player_nod = ReadMotion_(player, "Player_nod");					// 待機→うなづく→待機

	//エース
	local ace_talk_joy = ReadMotion_(ace, "n002_talk_joy_L");				// エース嬉しそう
	local ace_arm = ReadMotion_(ace, "n002_arm_folde");						// エース腕組み
	local ace_arm_L = ReadMotion_(ace, "n002_arm_folde_L");					// エース腕組みL
	local ace_feel_down = ReadMotion_(ace, "n000_feel_down");				// 落ち込む
	local ace_feel_down_L = ReadMotion_(ace, "n000_feel_down_L");			// 落ち込むL
	local ace_hand_up = ReadMotion_(ace, "n002_hand_up");					//会話→手をあげる
	local ace_hand_up_L = ReadMotion_(ace, "n002_hand_up_L");				//手をあげるL
	
	SetManualCalcAlpha_(player, true);
	SetAlpha_(player, 1.0);

	SetManualCalcAlpha_(ace, true);
	SetAlpha_(ace, 1.0);
	
// ▼レイアウト
	LoadLayout_("w_map");													//マップ
	SetLayoutAnime_("move_01", false);										//マップ

// ▼カメラ設定
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	
//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------
//	SetBgmVolume_(0, 1);
	Wait_(15);
	
	StartDemo(FADE_COLOR_BLACK);
	PlaySE_("SE_DEM_184");
	Wait_(60);
	PlaySE_("SE_DEM_184");
	Wait_(65);
	PlaySE_("SE_DEM_177");
	Wait_(110);
	PlaySE_("SE_DEM_178");
	
	WaitLayoutAnime();
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット１　エースアップ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	
	Wait_(30);	
	MotionTalk(ace);
	//======================================
	//◆エース
	//--------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	//「あれは……なるほど！
	ShowMsg_("DEMO_120_MSG_010");
	KeyInputWait_();	
	
	//「移動装置だよ　<name_player/>！
	ShowMsg_("DEMO_120_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//======================================
	
	WaitTask(task_cam);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット２　エースの解説2
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	
	task_ace = Task_WalkAroundToPos(ace, GetPos_(player), 5.7);

	SetMotion_(player, player_look_left_L, BLEND_XL)						// 主人公左待機

	WaitTask(task_ace);
	MotionTalk(ace);
	
	//======================================
	//◆エース
	//--------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	//「いいか？　移動装置には　射程ってもんがある。
	ShowMsg_("DEMO_120_MSG_030");
	KeyInputWait_();

	//「でも　この部屋を使って　大地を動かせば……
	SetMotion_(ace, ace_hand_up, BLEND_L)									// エース手上げる
	WaitMotion(ace);
	SetMotion_(ace, ace_hand_up_L, BLEND_L)									// エース手上げるL
	ShowMsg_("DEMO_120_MSG_040");
	KeyInputWait_();
	
	//「誰が　考えたのか　知らねぇが
	SetMotion_(ace, ace_talk_joy, BLEND_L)									// エース嬉しそう
	ShowMsg_("DEMO_120_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	//======================================
	
	DeleteTask_(task_cam);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット３　点滅のレイアウト
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetLayoutAnime_("map_point_01_in", false);										//マップ点滅
	WaitLayoutAnime();
	SetLayoutAnime_("map_point_01", true);										//マップ点滅
	Wait_(30);	
	//======================================
	//◆エース
	//--------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	//「うん？　この信号は……ここみたいな
	ShowMsg_("DEMO_120_MSG_060");
	KeyInputWait_();
	//「もしかしたら　この光ってるところ
	ShowMsg_("DEMO_120_MSG_070");
	KeyInputWait_();
	
	//「オメーが　行ってみる価値は　ありそうだぜ？
	ShowMsg_("DEMO_120_MSG_080");
	KeyInputWait_();
	CloseMsgWnd_();
	//======================================
	SetPointPos_(ace, "npc_ace001");											// エース移動
	SetPointPos_(player, "player001");											// 主 移動

	SetMotion_(ace, MOT_WAIT, BLEND_N)											// エース待機
	SetMotion_(player, MOT_WAIT, BLEND_N);										// 主 待機
	SetDirToObject_(player, ace);
	
	SetLayoutAnime_("map_point_01_out", false);									//マップ点滅フェードアウト
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット４　主・エースのカットへ移行
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");
	
	WaitLayoutAnime();
	
	SetMotion_(ace, ace_arm, BLEND_L)											// エース腕組み
	WaitMotion(ace);
	SetMotion_(ace, ace_arm_L, BLEND_L)											// エース腕組みL

	//======================================
	//◆エース
	//--------------------------------------
	//「ともかく……地震の原因は　つかめたぜ。
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_120_MSG_090");
	KeyInputWait_();
	
	SetMotion_(ace, ace_feel_down, BLEND_XL);									// 落ち込み
	WaitMotion(ace);
	SetMotion_(ace, ace_feel_down_L, BLEND_M);									// 落ち込みLOOP
	
	//「人騒がせな機械だぜ
	ShowMsg_("DEMO_120_MSG_100");
	KeyInputWait_();	
	
	SetMotion_(ace, ace_talk_joy, BLEND_L)										// エース嬉しそう
	
	//「あとは　このことを　キングに伝えないと。
	ShowMsg_("DEMO_120_MSG_110");
	KeyInputWait_();
	CloseMsgWnd_();
	//======================================
	

	SetMotion_(player, player_nod, BLEND_M);									// 主人公　待機→うなづく→待機
	WaitMotion(player);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■デモ終了
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	
	EndDemo(FADE_COLOR_BLACK);
}