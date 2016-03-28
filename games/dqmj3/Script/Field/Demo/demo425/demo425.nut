//=============================================
//
//		demo425[アンセスの最後_3]
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

// ▼配置
	// 主人公
	SetPointPos_(player, "player000");
	
	//ディスプレイ
	local model_o_S02_23 = ReadGimmick_("o_S02_23");
	local gmc_o_S02_23 = ArrangePointGimmick_("o_S02_23", model_o_S02_23, "obj_display000");
	SetVisible(gmc_o_S02_23, false);

// ▼非常駐モーション読込
	

// ▼カメラ設定
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");	
	
	LoadEffect_("ef732_09_light_reactor_c");

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	SetMotion_(gmc_o_S02_23, MOT_GIMMICK_0, BLEND_N);
	SetAlpha_(gmc_o_S02_23, 1);
	SetVisible(gmc_o_S02_23, true);
	Wait_(10);
	StartDemo(FADE_COLOR_WHITE);

	Wait_(30);

	SetMotion_(gmc_o_S02_23, MOT_GIMMICK_0, BLEND_N);
	PlaySE_("SE_FLD_135");																			// リアクター反応音
	local light = SetSelectBoneEffect_("ef732_09_light_reactor_c", player, ATTACH_EFFECT1);			//リアクター発光		
	Wait_(30);

	//===============================================
	// ■リアクター
	// 「停止した移動装置の存在を　確認しました。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_REACTOR");
	ShowMsg_("DEMO_425_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	Wait_(30);
	StartEarthQuake_(60, 3.5, 0.3)
	PlayLoopSE_("SE_DEM_013");
	Wait_(30);
	StopLoopSE_(30);
	//...........................................................................
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);					//フェードアウト
	WaitFade_();
	Wait_(10);
	LoadLayout_("w_map");
	SetLayoutAnime_("move_04", false);
	Wait_(30);
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);					//フェードイン
	//...........................................................................
	Wait_(50);
	PlaySE_("SE_DEM_181");
	Wait_(100);
	PlaySE_("SE_DEM_178");
	WaitLayoutAnime();
	
	SetAlpha_(gmc_o_S02_23, 0.8);
	Wait_(3);
	SetAlpha_(gmc_o_S02_23, 0.6);
	Wait_(3);
	SetAlpha_(gmc_o_S02_23, 0.4);
	Wait_(3);
	SetAlpha_(gmc_o_S02_23, 0.2);
	Wait_(3);
	SetVisible(gmc_o_S02_23, false);
	
	Wait_(30);
	
	EndDemo(FADE_COLOR_BLACK);
}
