//=============================================
//
//		demo515[テレジアの含み_1]
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
	local task_cam, task_player;
	local efc_player;

// ▼リソース読込
	// キャラクター
	local player = GetPlayerId_();						// 主人公

	// エフェクト読み込み
	LoadEffect_("EF712_10_EMO_SURPRISE01");				// 「！」

	// ギミック読み込み
	local obj_monorisu = ReadGimmick_("o_com_02");		// モノリス
	local obj_door = ReadGimmick_("o_O01_03");			// Aランクの扉

// ▼配置
	// 主人公
	SetPointPos_(player, "player000");

	// ギミック配置
	local monorisu = ArrangePointGimmick_("o_com_02",obj_monorisu, "obj_monorisu000");
	local door = ArrangePointGimmick_("o_O01_04",obj_door, "obj_door000");

// ▼非常駐モーション読込
	local player_turn_L = ReadMotion_(player, "Player_turn_L");// 主人公振り向き

	SetMotion_(monorisu, MOT_GIMMICK_2, BLEND_N);		// 起動後待機

// ▼カメラ設定
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");


//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);

	//===============================================
	//*テレジア
	// 	「そのカギを使って　ここから出られる前に
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TEREZIA");
	ShowMsg_("DEMO_515_MSG_010");
	KeyInputWait_();
	//===============================================
	//*テレジア
	// 「……実は　○主人公の名前○さまが
	//-----------------------------------------------
	ShowMsg_("DEMO_515_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	efc_player = SurpriseDisp(player);
	SetEffectScale_(efc_player, 1.0);
	Wait_(10);
	SetMotion_(player, player_turn_L, BLEND_L);			//主人公左を向く
	Wait_(40);


	//===============================================
	//カメラシーン切り替え
	//-----------------------------------------------
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");

	Wait_(10);
	task_player = Task_RotateToDir_(player, 89, 7);
	SetMotion_(player, MOT_WALK, BLEND_XL);	
	WaitTask(task_player);
	SetMotion_(player, MOT_WAIT, BLEND_L);

	//===============================================
	//*テレジア
	// 「かつて　あなたは　Ａ級ライセンスを持ち
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TEREZIA");
	ShowMsg_("DEMO_515_MSG_030");
	KeyInputWait_();
	//===============================================
	//*テレジア
	// 「しかし　あなたは敗れ　記憶を奪われて
	//-----------------------------------------------
	ShowMsg_("DEMO_515_MSG_040");
	KeyInputWait_();
	//===============================================
	//*テレジア
	// 「そして……仲間に救出され　あなたは
	//-----------------------------------------------
	ShowMsg_("DEMO_515_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	//==============================================

	Wait_(15);


	//===============================================
	//アニメーションカメラに切り替え
	//-----------------------------------------------
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");

	WaitTask(task_player);

	//===============================================
	//*テレジア
	// 「そう……時は　来ました。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TEREZIA");
	ShowMsg_("DEMO_515_MSG_060");
	KeyInputWait_();
	//==============================================
	//*テレジア
	// 「なぜ　アンセスと呼ばれるのか。
	//-----------------------------------------------
	ShowMsg_("DEMO_515_MSG_070");
	KeyInputWait_();
	//===============================================
	//*テレジア
	// 「レジスタンスの　秘密基地に　行けば
	//-----------------------------------------------
	ShowMsg_("DEMO_515_MSG_080");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	WaitTask(task_cam);

	EndDemo(FADE_COLOR_BLACK);
}
