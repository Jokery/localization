//=============================================
//
//		demo809[封印の解放]
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
	local task_aroma_step;
	local efc_player;

// ▼リソース読込
	// キャラクター
	local player = GetPlayerId_();					// 主人公
	local model_aroma = ReadNpc_("n018");			//アロマ
	
	local model_pod = ReadGimmick_("o_U00_02");				// 脱出ポッド

	local model_red_door = ReadGimmick_("o_U00_05");		// 扉:赤扉
	local model_green_door00 = ReadGimmick_("o_U00_09");	// 扉:緑扉
	local model_green_door01 = ReadGimmick_("o_U00_10");	// 扉:緑扉
	
// ▼配置
	// 主人公
	SetPointPos_(player, "player000");
	
	local aroma = ArrangePointNpc_(model_aroma, "npc_aroma000");
	SetStepSe_(aroma, SILENT_STEP_SE);
	
	local pod00 = ArrangePointGimmick_("o_U00_02", model_pod, "obj_pod000");							//脱出ポッド３基
	local pod01 = ArrangePointGimmick_("o_U00_02", model_pod, "obj_pod001");
	local pod02 = ArrangePointGimmick_("o_U00_02", model_pod, "obj_pod002");
	
	local red_door = ArrangePointGimmick_("o_U00_05", model_red_door, "obj_U00_05");					//扉:赤扉
	local green_door00 = ArrangePointGimmick_("o_U00_09", model_green_door00, "obj_U00_09");			//扉:緑扉
	local green_door01 = ArrangePointGimmick_("o_U00_10", model_green_door01, "obj_U00_10");			//扉:緑扉

// ▼非常駐モーション読込
	

// ▼カメラ設定
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	//アロマ 主人公のところまで歩く
	SetMotion_(aroma, MOT_WALK, BLEND_XL);
	local task_aroma = Task_MoveForward_(aroma, 0.6, false);
	task_aroma_step = Task_PlaySe_("SE_FLD_021", 15);
	Wait_(57);
	DeleteTask_(task_aroma);
	DeleteTask_(task_aroma_step);
	
	SetMotion_(aroma, MOT_WAIT, BLEND_XL);
	Wait_(15);

	//主人公 アロマの方に振り向く
	SetMotion_(player, MOT_WALK, BLEND_M);
	local task_player = Task_RotateToDir_(player, 10, 6);
	Wait_(30);
	
	SetMotion_(player, MOT_WAIT, BLEND_XL);
	Wait_(20);
	
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	
	SetPointPos_(aroma, "npc_aroma001");
	SetMotion_(aroma, MOT_TALKLOOP, BLEND_XL);

	//===============================================
	// ■アロマ
	// 「お待たせ　○主人公の名前○。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_809_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
		
	Wait_(20);

	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");
	SetAlpha_(player, 0);

	//===============================================
	// ■アロマ
	// 「封印が解けたら　そこの時空の裂け目から
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_809_MSG_020");
	KeyInputWait_();

	//===============================================
	
	//===============================================
	// ■アロマ
	// 「でも　くれぐれも　油断はしないこと。
	//-----------------------------------------------
	
	ShowMsg_("DEMO_809_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
		
	SetMotion_(aroma, MOT_WAIT, BLEND_XL);

	Wait_(40);
	
	EndDemo(FADE_COLOR_BLACK);
}
