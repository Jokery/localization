//=============================================
//
//		demo516[テレジアの含み_2(基地)]
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
	local player = GetPlayerId_();					// 主人公

	local obj_door = ReadGimmick_("o_V00_03");		//レジスタンスの扉
	local doa = ArrangePointGimmick_("o_V00_03",obj_door, "obj_door000");


	local obj_panel = ReadGimmick_("o_V00_11");		//レジスタンスの扉
	local panel = ArrangePointGimmick_("o_V00_11",obj_panel, "obj_panel000");
	
	local model_ruler = ReadGimmick_("o_com_08");	// ルーラポイント


// ▼配置
	// 主人公
//	SetPointPos_(player, "player000");
	// ルーラポイント
	local ruler = ArrangePointGimmick_("o_com_08", model_ruler, "obj_ruler000");
	if(GetEventFlg_("BFG_RULER_ADD_021") == true){
		SetMotion_(ruler, MOT_GIMMICK_2, BLEND_N);
	}

// ▼非常駐モーション読込
	

// ▼カメラ設定

	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");

// ▼天候設定
	SetWeather_(WEATHER.BAD);

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	//===============================================
	//*テレジア
	// 	「エルピス山の　どこかにある
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TEREZIA");
	ShowMsg_("DEMO_516_MSG_010");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	//*テレジア
	// 	バーディ……彼のチカラを　借りれば
	//-----------------------------------------------
	ShowMsg_("DEMO_516_MSG_020");
	KeyInputWait_();
	
	//===============================================
	//*テレジア
	// 	「レナーテが待ってる
	//-----------------------------------------------
	ShowMsg_("DEMO_516_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	WaitTask(task_cam);
	
	Wait_(50);
	
	EndDemo(FADE_COLOR_BLACK);
}
