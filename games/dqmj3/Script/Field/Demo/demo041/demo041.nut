//=============================================
//
//		demo041[戦闘チュートリアル導入_1]
//
//=============================================

function Update()
{

// ▼変数定義
	local task_cam, task_nochoman;

// ▼リソース読込
	// キャラクター
	local player = GetPlayerId_();
	local model_nochoman = ReadNpc_("n043");		// ノチョリン
	local model_slime = ReadNpc_("m000_00");		// スライム
	
// ▼配置
	SetPointPos_(player, "player000");
	SetDir_(player, -90);
	
	local nochoman = ArrangePointNpc_(model_nochoman, "npc_nochoman000");
	SetDir_(nochoman,180);
	
	local slime000 = ArrangePointNpc_(model_slime, "npc_slime000");
	SetDir_(slime000,90);
	SetScaleSilhouette(slime000, SCALE.S, SILHOUETTE_WIDTH.S);
	SetStepSe_(slime000, SILENT_STEP_SE);
	local slime100 = ArrangePointNpc_(model_slime, "npc_slime100");
	SetDir_(slime100,-50);	
	SetScaleSilhouette(slime100, SCALE.S, SILHOUETTE_WIDTH.S);
	SetStepSe_(slime100, SILENT_STEP_SE);
// ▼非常駐モーション読込
	local Player_look_left_L = ReadMotion_(player, "Player_look_left_L");	// 主人公顔を少し左向ける
	local n000_talk_joy_L = ReadMotion_(nochoman, "n000_talk_joy_L");		// ノチョーラ喜び
	
// ▼初期のモーション
	SetMotion_(player, MOT_WAIT, BLEND_N);
	SetMotion_(slime000, MOT_WAIT, BLEND_N);
	SetMotion_(slime100, MOT_WALK, BLEND_N);
	
// ▼カメラ設定
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------
	
	StartDemo(FADE_COLOR_BLACK);
	
//	Wait_(55);
	Wait_(20);

	SetMotion_(player, MOT_WAIT, BLEND_L);
	
	Wait_(20);

	task_nochoman = Task_RotateToPos_(nochoman, GetPos_(player), 11.7);

	SetMotion_(player, Player_look_left_L, BLEND_L);
	
	SetMotion_(nochoman, MOT_TALKLOOP, BLEND_L);
	
	//「あそこに　なん匹か　魔物がいるちょ？
	//　あれを相手に　チカラを　見せてほしいちょ。
	OpenMsgWnd_();
	ShowMsg_("DEMO_041_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット2
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	DeleteTask_(task_cam);
	
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	
	SetMotion_(nochoman, n000_talk_joy_L, BLEND_L);

	//「真の　モンスターマスターなら　
	//　パパっと　やっつけられるはずだちょ。
	OpenMsgWnd_();
	ShowMsg_("DEMO_041_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット3
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	
	OpenMsgWnd_();
	//「まず　ウロウロしてる魔物に　ぶつかるっちょ！
	//　そしたら　戦いになるから　やっつけるちょ！
	ShowMsg_("DEMO_041_MSG_030");
	KeyInputWait_();
	
	//「お前なら　仲間にした魔物と　一緒に
	//　あいつらと　戦えるはずだっちょ！
	ShowMsg_("DEMO_041_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■デモ終了
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	
	EndDemo(FADE_COLOR_BLACK);
}