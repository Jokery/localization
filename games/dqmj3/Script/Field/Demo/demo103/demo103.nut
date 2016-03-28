//=============================================
//
//		demo103[電源の復旧_1(制御版)]
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
	local efc00_acc, efc01_srp, efc02, ef0c3, efc04, efc05, efc06, efc07, efc08, efc09, ef810_01;
	local task_cam, task_player, task_npc01, task_npc02, task_npc03;
	
// ▼モデル読込
	// キャラクター
	local player = GetPlayerId_();					// 主人公
	// ギミック
	local model_monitor = ReadGimmick_("o_A02_02");	// モニタ
	local model_storage = ReadGimmick_("o_A02_01");	// 蓄電器
	
	//エフェクト
	LoadEffect_("ef712_10_emo_surprise01");			//驚き
	LoadEffect_("ef810_01_sub_power_in");			//サブ電源の赤丸
	LoadEffect_("ef732_09_light_reactor_c");		// リアクター発光
	
// ▼配置
	// モニタ
	local monitor = ArrangePointGimmick_("o_A02_02", model_monitor, "obj_monitor000");
	SetMotion_(monitor, MOT_GIMMICK_0, BLEND_N);
	
	//サブ電源
	//・左
	local storage00 = ArrangePointGimmick_("o_A02_01", model_storage, "obj_storage000");
	//・右
	local storage01 = ArrangePointGimmick_("o_A02_01", model_storage, "obj_storage100");
	
	// 主人公
	SetPointPos_(player, "player000");
	
// ▼非常駐モーション読込
	// 主人公
	local reacter = ReadMotion_(player, "Player_touch_reactor");			// 主人公顔を少し左向ける→リアクターを触る
	local reacterL = ReadMotion_(player, "Player_touch_reactor_L");			// 主人公リアクターを触るL	
	local player_stand = ReadMotion_(player, "Player_stand01");				// リアクターを触る→待機に戻る
	local panel = ReadMotion_(player, "Player_panel01");					// 主人公パネル操作	
	
	local pl_nod = ReadMotion_(player, "Player_nod");						// 待機→うなづく→待機
	
// ▼初期モーション設定
	SetMotion_(player, MOT_WALK, BLEND_N);
	task_player = Task_MoveForward_(player, 1.0, false);

// ▼カメラ設定
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------
	
	StartDemo(FADE_COLOR_BLACK);

	// ▼カメラ１～～～～～～～～～～～～～～～～～～～～～～～～
	Wait_(95);
	DeleteTask_(task_player);		
	
	SetMotion_(player, MOT_WAIT, BLEND_M);
	

	// 主人公　驚き
	SurpriseDisp(player);
	
	Wait_(20);
	
	local light = SetSelectBoneEffect_("ef732_09_light_reactor_c", player, ATTACH_EFFECT1);	//リアクター発光
	
	// 主人公　リアクターを触る
	OpenConnectiveWithMotion("connective_ace", player, reacter, reacterL);					//リアクターを触る→メッセージ表示

	//===============================================
	// ■エース
	// 「おっと！　そこが送電施設の
	//　制御室みたいだな　<name_player/>！
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_103_MSG_010");
	KeyInputWait_();	
	//===============================================	
	
	//===============================================
	// ■エース
	//「操作パネルのスイッチを　押してくれ。
	//　復旧システムが　起動するはずだ。
	//-----------------------------------------------
	ShowMsg_("DEMO_103_MSG_020");
	KeyInputWait_();	
	
	CloseMsgWnd_();	
	//===============================================
			
	CloseConnective();
	
	Wait_(15);
	SetMotion_(player, player_stand, BLEND_L);
	Wait_(30);		
	SetMotion_(player, panel, BLEND_L);				//主人公パネル操作
	WaitMotion(player);
	PlaySE_("SE_DEM_006");							//スイッチon
	SetMotion_(player, MOT_WAIT, BLEND_L);	
				
	// カメラズームアウト
	DeleteTask_(task_cam);
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
		
	WaitTask(task_cam);

	PlaySE_("SE_DEM_032");								//モニタ起動 SE
	SetMotion_(monitor, MOT_GIMMICK_1, BLEND_M);		// モニタ電源on
	Wait_(60);
	
	OpenConnectiveWithMotion("connective_ace", player, reacter, reacterL);					//リアクターを触る→メッセージ表示
	
	//===============================================
	// ■エース
	//「……おっし！　送電施設を
	//　これで　施設復旧の準備ができたちょ
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_103_MSG_030");
	KeyInputWait_();;	
	//===============================================
	
	// カメラ　モニタに向かってズームイン
	DeleteTask_(task_cam);
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");
	
	WaitTask(task_cam);
	
	//===============================================
	// ■エース
	//「えーと……まずは　サブ電源を起動させるのか。
	//　赤く光るスイッチのついた　機械だな。
	//-----------------------------------------------
	ShowMsg_("DEMO_103_MSG_040");
	KeyInputWait_();	
	CloseMsgWnd_();	
	//===============================================
	
	CloseConnective();//リアクター一度閉じる

	SetMotion_(player, player_stand, BLEND_L);
	
	Wait_(30)	
	SetMotion_(monitor, MOT_GIMMICK_4, BLEND_M);		// サブ電源点滅
	Wait_(20);
	SetMotion_(monitor, MOT_GIMMICK_1, BLEND_M);		
	Wait_(20);
	SetMotion_(monitor, MOT_GIMMICK_4, BLEND_M);		
	Wait_(20);	
	SetMotion_(monitor, MOT_GIMMICK_1, BLEND_M);		
	Wait_(20);
	
	DeleteTask_(task_cam);	
	Wait_(20);
	//===============================================
	// ■エース
	//「<name_player/>！　２ヶ所にある
	//-----------------------------------------------

	task_cam = Task_AnimeMoveCamera_("anmeye005", "anmtgt005");

	SetPointPos_(player, "player001");					//裏で主人公こっそり移動
	
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_103_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();	
	
	Wait_(30);
	//-----------------------------------------------
	DeleteTask_(task_cam);	
	
	// ■エース
	//「そのスイッチを入れると　サブ電源が起動する。
	//-----------------------------------------------	
	task_cam = Task_AnimeMoveCamera_("anmeye006", "anmtgt006");	

	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_103_MSG_060");
	KeyInputWait_();
	CloseMsgWnd_();	
	
	Wait_(30);
	DeleteTask_(task_cam);
	//===============================================	
	//-----------------------------------------------
	// ■エース
	//「次の手順は　オメーが戻ってきたら説明する。
	//-----------------------------------------------
	
	// カメラ　主人公アップ	
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	
	OpenConnectiveWithMotion("connective_ace", player, reacter, reacterL);					//リアクターを触る→メッセージ表示
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_103_MSG_070");
	KeyInputWait_();
	CloseMsgWnd_();	

	CloseConnective();
	//===============================================	
	Wait_(30);

	EndDemo(FADE_COLOR_BLACK);
}
