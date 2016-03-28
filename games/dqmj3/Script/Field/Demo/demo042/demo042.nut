//=============================================
//
//		demo042[エースによるリアクター修理]
//
//=============================================

function Update()
{

// ▼変数定義
	local task_cam, task_player;
	local efc_player;
	local pos_player = Vec3(31.73264, 0.0, -111.72417);
	
// ▼リソース読込
	local player = GetPlayerId_();
	local model_ace = ReadNpc_("n002");			// エース
	
	LoadEffect_("ef712_10_emo_surprise01");		// 「！」
	LoadEffect_("ef732_09_light_reactor_c");	// リアクター発光
	
// ▼配置
	SetPointPos_(player, "player000");
	
	local ace = ArrangePointNpc_(model_ace, "npc_ace000");
	SetDir_(ace, 20);
	
// ▼非常駐モーション読込
	local Player_touch_reactor = ReadMotion_(player, "Player_touch_reactor");		// 主人公顔を少し左向ける→リアクターを触る
	local Player_touch_reactor_L = ReadMotion_(player, "Player_touch_reactor_L");	// 主人公リアクターを触るL
	local Player_nod = ReadMotion_(player, "Player_nod");							// 待機→うなづく→待機
	
	local n000_think = ReadMotion_(ace, "n000_think");
	local n000_think_L = ReadMotion_(ace, "n000_think_L");
	local n002_think_L = ReadMotion_(ace, "n002_think_L");
	local n002_arm_folde = ReadMotion_(ace, "n002_arm_folde");
	local n002_arm_folde_L = ReadMotion_(ace, "n002_arm_folde_L");
	local n002_talk_joy_L = ReadMotion_(ace, "n002_talk_joy_L");
	local n002_hand_up = ReadMotion_(ace, "n002_hand_up");
	local n002_hand_up_L = ReadMotion_(ace, "n002_hand_up_L");

// ▼カメラ設定
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------
	
	StartDemo(FADE_COLOR_BLACK);
	
	SetMotion_(ace, n002_hand_up, BLEND_L);
	WaitMotion(ace);
	SetMotion_(ace, n002_hand_up_L, BLEND_L);
	
	//=====================================
	//会話開始
	//=====================================
	OpenMsgWnd_();
	//「よっ！　待ってたぜ！
	//　オレの名は　エース！　よろしくだぜ！
	ShowMsg_("DEMO_042_MSG_010");
	KeyInputWait_();
	
	SetMotion_(ace, MOT_TALK, BLEND_L);
	
	SetTalkName_("NAME_TAG_ACE");
	//「話は　聞こえてたぜ。キング救出のため
	//　オメーは　大喰らいの要塞へ　行くんだろ？
	ShowMsg_("DEMO_042_MSG_020");
	
	Wait_(18);
	
	SetMotion_(ace, MOT_TALKLOOP, BLEND_L);
	
	KeyInputWait_();
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット2
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	WaitTask(task_cam);
	DeleteTask_(task_cam);
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	
	SetMotion_(ace, n002_hand_up, BLEND_L);
	WaitMotion(ace);
	SetMotion_(ace, n002_hand_up_L, BLEND_L);
	//「そういうことなら　オメーのリアクターを
	//　オレと通信できるように　してやるぜ。
	ShowMsg_("DEMO_042_MSG_030");
	KeyInputWait_();
	//「オレは　ここから　通信で　オメーを
	//　サポートする。さあ　そいつを渡すんだぜ。
	ShowMsg_("DEMO_042_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	
	SetMotion_(ace, MOT_WAIT, BLEND_L);
	
	//=====================================
	//フェードアウト
	//=====================================
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);
	WaitFade_();
	
	PlaySE_("SE_DEM_012");					//■SE：エースのリアクター改造音

	Wait_(100);
	DeleteTask_(task_cam);
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット3
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

	//=====================================
	//フェードイン
	//=====================================
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);
	WaitFade_();

	SetMotion_(player, Player_touch_reactor, BLEND_L);
	SetFace_(player, "Face_left");
	SetMotion_(ace, n002_think_L, BLEND_M);
	
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	//「これで　オメーと　通信できるはず。
	//　ちょっと　テストしてみようぜ！
	ShowMsg_("DEMO_042_MSG_050");
	
	WaitMotion(player);
	SetMotion_(player, Player_touch_reactor_L, BLEND_M);
	
	KeyInputWait_();
	CloseMsgWnd_();

	efc_player = SetSelectBoneEffect_("ef732_09_light_reactor_c", player, ATTACH_EFFECT1);	// リアクター発光
	PlaySE_("SE_DEM_019");																	// ■SE：コネクティブ受信	
	Wait_(45);

	OpenConnective("connective_ace");
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_ACE");
		//「よーしよし。ちゃんと　通信できてるな！
		//　さすがは　オレ！　いい仕事するぜ！
		ShowMsg_("DEMO_042_MSG_060");
		KeyInputWait_();
		CloseMsgWnd_();
	CloseConnective();
	
	Wait_(60);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット4
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	
	Wait_(10);
	
	SetMotion_(ace, n002_arm_folde, BLEND_L);
	WaitMotion(ace);
	SetMotion_(ace, n002_arm_folde_L, BLEND_L);
	
	OpenMsgWnd_();
	//「そういや　ステルスボックスセンサーが
	//　壊れてたんで　一緒に　直しておいたからな。
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_042_MSG_070");
	KeyInputWait_();
	//「見えない宝箱が　近くにあったら
	//　リアクターが　反応するはずだぜ。
	ShowMsg_("DEMO_042_MSG_080");
	KeyInputWait_();
	CloseMsgWnd_();
	Wait_(10);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット5
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");
	Wait_(10);
	
	SetMotion_(player, MOT_WAIT, BLEND_L);
	SetMotion_(ace, n002_talk_joy_L, BLEND_L);
	
	// 「それじゃ　ジャックのところに　行ってくれ。
	//　あいつなら　門の前で　オメーを待ってるぜ！
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_042_MSG_090");
	KeyInputWait_();
	CloseMsgWnd_();
	
	SetMotion_(ace, MOT_WAIT, BLEND_M);
	SetFace_(player, "Face_default");		
	SetMotion_(player, Player_nod, BLEND_L);		// 待機→うなづく→待機
	WaitMotion(player);
	SetMotion_(player, MOT_WAIT, BLEND_L);
	

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■デモ終了
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	
	EndDemo(FADE_COLOR_BLACK);
}