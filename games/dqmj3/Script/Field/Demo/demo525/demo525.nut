//=============================================
//
//		demo525[レナーテが見せるもの]
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
	local player = GetPlayerId_();								// 主人公
	local npc_rena = ReadNpc_("n007");							//レナーテ

//ギミック読み込み
	local  model_cold = ReadGimmick_("o_V02_10");				//コールドスリープケース
	local  model_couldsleep = ReadGimmick_("o_V02_12");			//コールドスリープ装置
	local  model_couldsleep_monitor = ReadGimmick_("o_V02_13");	//コールドスリープ明滅
	local model_door = ReadGimmick_("o_V02_09");			// 扉

// ▼配置
	// 主人公
	//SetPointPos_(player, "player000");
	local rena = ArrangePointNpc_(npc_rena, "npc_rena000");
	
	//ギミック
	local couldsleep = ArrangePointGimmick_("o_V02_12", model_couldsleep, "obj_couldsleep000");				//コールドスリープ装置
	local monitor000 = ArrangePointGimmick_("o_V02_13", model_couldsleep_monitor, "obj_monitor000");		//コールドスリープ明滅
	// 扉
	local door = ArrangePointGimmick_("o_V02_09", model_door, "obj_door000");

// ▼非常駐モーション読込
	local rena_typing_L = ReadMotion_(rena, "n007_typing_L");			// レナーテ コンソールを操作するL
	local rena_look_left_L = ReadMotion_(rena, "n007_look_left_L");		// レナーテ 左を向く


//足音
	SetStepSe_(rena, "SE_FLD_016");
	
// ▼カメラ設定
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------
	
	SetMotion_(monitor000, MOT_GIMMICK_0, BLEND_N);					//モニターの通常画面
	
	StartDemo(FADE_COLOR_BLACK);	

	SetMotion_(rena, MOT_WAIT, BLEND_L);
	Wait_(7);

	SetMotion_(rena, MOT_WALK, BLEND_XL);
	local tas_renak = Task_RotateToDir_(rena, 218, 2);				//レナーテ角度変更
	Wait_(48);
	SetMotion_(rena, rena_look_left_L, BLEND_XL);					// レナーテ 左を向く
	
	Wait_(20);

	//===============================================
	//*レナーテ
	// 	「聞きたいことは　いろいろあると思う。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_525_MSG_010");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	//*レナーテ
	// 	「すべては……それから。
	//-----------------------------------------------
	ShowMsg_("DEMO_525_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(rena, MOT_WALK, BLEND_L);
	local tas_renak = Task_RotateToDir_(rena, 120, 3);				//レナーテ角度変更
	Wait_(28);

	PlayLoopSE_("SE_DEM_121");
	SetMotion_(rena, rena_typing_L, BLEND_XL);						//レナーテ コンソールを操作
	Wait_(40);

	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	
	//===============================================
	//*レナーテ
	// 	「……これは　あなたにあてた
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_525_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================	
	
	local task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
		
	SetAlpha_(rena, 0);
	StopLoopSE_(15);
	Wait_(60);
	PlaySE_("SE_DEM_049");												//■SE:モニターにノイズが走る
	SetMotion_(monitor000, MOT_GIMMICK_1, BLEND_N);						//モニターのノイズ画面

	Wait_(40);
	
	EndDemo(FADE_COLOR_WHITE);
}
