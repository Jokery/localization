//=============================================
//
//		demo807 [３つの言葉と3枚のディスク]
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
	local task_cam, task_player, task_aroma;
	local efc_player;

// ▼リソース読込
	// キャラクター
	local player = GetPlayerId_();					// 主人公
	local n_aroma = ReadNpc_("n018");			//アロマ
	local model_o_com_18 = ReadGimmick_("o_com_18");		//ディスク装置
	
	local model_o_A01_05 = ReadGimmick_("o_A01_05");
	local model_o_A01_06 = ReadGimmick_("o_A01_06");
	local model_o_A01_07 = ReadGimmick_("o_A01_07");
	local model_o_A01_08 = ReadGimmick_("o_A01_08");
	local model_o_A01_09 = ReadGimmick_("o_A01_09");
	local model_o_A01_10 = ReadGimmick_("o_A01_10");
	local model_o_A01_16 = ReadGimmick_("o_A01_16");

// ▼配置
	// 主人公
	SetPointPosNoFit_(player, "player000");
	
	//アロマ
	local aroma = ArrangePointNpc_(n_aroma, "aroma000");
	
	//ディスク装置
	local gmc_o_com_18 = ArrangePointGimmick_("o_com_18", model_o_com_18, "diskmachine");
	
	//モニター
	local gmc_o_A01_05 = ArrangePointGimmick_("o_A01_05", model_o_A01_05, "monitor");
	local gmc_o_A01_06 = ArrangePointGimmick_("o_A01_06", model_o_A01_06, "monitor");
	local gmc_o_A01_07 = ArrangePointGimmick_("o_A01_07", model_o_A01_07, "monitor");
	local gmc_o_A01_08 = ArrangePointGimmick_("o_A01_08", model_o_A01_08, "monitor");
	local gmc_o_A01_09 = ArrangePointGimmick_("o_A01_09", model_o_A01_09, "monitor");
	local gmc_o_A01_10 = ArrangePointGimmick_("o_A01_10", model_o_A01_10, "monitor");
	
	//エレベーター扉
	local gmc_o_A01_16 = ArrangePointGimmick_("o_A01_16", model_o_A01_16, "ele");

// ▼非常駐モーション読込
	local p_Player_hold_L = ReadMotion_(player, "Player_hold_L");
	local a_n018_star_seed_L = ReadMotion_(aroma, "n018_star_seed_L");
	local Player_nod = ReadMotion_(player, "Player_nod");					// 待機→うなづく→待機

// ▼カメラ設定
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	
	SetMotion_(gmc_o_A01_05, MOT_GIMMICK_1, BLEND_N);
	SetMotion_(gmc_o_A01_06, MOT_GIMMICK_1, BLEND_N);
	SetMotion_(gmc_o_A01_07, MOT_GIMMICK_1, BLEND_N);
	SetMotion_(gmc_o_A01_08, MOT_GIMMICK_1, BLEND_N);
	SetMotion_(gmc_o_A01_09, MOT_GIMMICK_1, BLEND_N);
	SetMotion_(gmc_o_A01_10, MOT_GIMMICK_1, BLEND_N);
	SetMotion_(gmc_o_A01_16, MOT_GIMMICK_0, BLEND_N);
	SetMotion_(gmc_o_com_18, MOT_GIMMICK_2, BLEND_N);
//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------
//cut01
	StartDemo(FADE_COLOR_BLACK);
	Wait_(15);
	SetMotion_(player, p_Player_hold_L, BLEND_XL);
	Wait_(15);
	SetMotion_(aroma, a_n018_star_seed_L, BLEND_XL);
	Wait_(50);
	SetMotion_(aroma, MOT_WAIT, BLEND_XL);
	SetMotion_(player, MOT_WAIT, BLEND_XL);
	Wait_(30);
	
//cut02
	SetVisible(player, false);
	
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	
	SetMotion_(aroma, MOT_TALK, BLEND_L);
	WaitMotion(aroma);
	SetMotion_(aroma, MOT_TALKLOOP, BLEND_L);
	//===============================================
	//■アロマ
	// 	「うん……このＭＡＰなディスクなら
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_807_MSG_010");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	//■アロマ
	// 	「さっきの　○キーワード１○ってのこそ
	//-----------------------------------------------
	ShowMsg_("DEMO_807_MSG_020");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	//■アロマ
	// 	「同じように　○キーワード２○を使えば
	//-----------------------------------------------
	ShowMsg_("DEMO_807_MSG_030");
	KeyInputWait_();
	//===============================================

	//===============================================
	//■アロマ
	// 	「そして　○キーワード３○で
	//-----------------------------------------------
	ShowMsg_("DEMO_807_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(aroma, MOT_WAIT, BLEND_XL);
	WaitTask(task_cam);
	Wait_(20);

//cut03
	SetVisible(player, true);
	SetMotion_(player, MOT_WAIT, BLEND_N);
	SetVisible(aroma, false);
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	Wait_(10);
	SetMotion_(player, Player_nod, BLEND_L);// 主人公　待機→うなづく→待機
	WaitMotion(player);
	SetMotion_(player, MOT_WAIT, BLEND_L);// 主人公　待機
	Wait_(5);

	//===============================================
	//*システムメッセージ
	// 	キーワード　○キーワード２○と
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_807_MSG_050");
	PlayMe_("ME_010");
	WaitMe_();
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
//cut04
	SetVisible(aroma, true);
	SetPointPos_(player, "player001");
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	
	SetMotion_(aroma, MOT_TALK, BLEND_L);
	WaitMotion(aroma);
	SetMotion_(aroma, MOT_TALKLOOP, BLEND_L);
	
	//===============================================
	//■アロマ
	// 	「さあ　キーワードを使ったディスクを作り
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_807_MSG_060");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	//■アロマ
	// 	「３つの　必要なアクセサリーは
	//-----------------------------------------------
	ShowMsg_("DEMO_807_MSG_070");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	//■アロマ
	// 	「アンタの持ってる　アクセサリーに応じた
	//-----------------------------------------------
	ShowMsg_("DEMO_807_MSG_080");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	SetMotion_(aroma, MOT_WAIT, 20);
	WaitTask(task_cam);
	Wait_(30);

	EndDemo(FADE_COLOR_BLACK);

}
