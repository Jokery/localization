//=============================================
//
//		demo812[空神の封印]
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
	local efc_player, efc_door000;

// ▼リソース読込
	// キャラクター
	local player = GetPlayerId_();							// 主人公
	local model_aroma = ReadNpc_("n018");					// アロマ
	// エフェクト
	LoadEffect_("ef881_06_door_r");		// 扉の光 赤

// ▼配置
	// 主人公
	SetPointPos_(player, "player000");
	local aroma = ArrangePointNpc_(model_aroma, "npc_aroma000");

	//	▼ギミックの読み込み
	local model_red_door = ReadGimmick_("o_U00_05");		// 扉:赤扉
	local model_center_door = ReadGimmick_("o_U00_06");		// 扉:外扉 中央
	local model_left_door = ReadGimmick_("o_U00_06");		// 扉:外扉 左
	local model_right_door = ReadGimmick_("o_U00_06");		// 扉:外扉 右
	local model_green_door00 = ReadGimmick_("o_U00_09");	// 扉:緑扉
	local model_green_door01 = ReadGimmick_("o_U00_10");	// 扉:緑扉

	local model_warp_center = ReadGimmick_("o_com_35");		// 加速リング(赤)
	local model_warp_right = ReadGimmick_("o_com_36");		// 加速リング(青)
	local model_warp_left = ReadGimmick_("o_com_37");		// 加速リング(緑)
	
//	▼ギミックの読み込み
	local center_door = ArrangePointGimmick_("o_U00_06", model_center_door, "obj_center");				//扉:外扉 中央
	local left_door = ArrangePointGimmick_("o_U00_06", model_left_door, "obj_left");					//扉:外扉 左
	local right_door = ArrangePointGimmick_("o_U00_06", model_right_door, "obj_right");				//扉:外扉 右
	
	local red_door = ArrangePointGimmick_("o_U00_05", model_red_door, "obj_U00_05");					//扉:赤扉
	local green_door00 = ArrangePointGimmick_("o_U00_09", model_green_door00, "obj_U00_09");			//扉:緑扉
	local green_door01 = ArrangePointGimmick_("o_U00_10", model_green_door01, "obj_U00_10");			//扉:緑扉

	local warp_center = ArrangePointGimmick_("o_com_35", model_warp_center, "obj_warp_center000");		// 加速リング(赤)
	local warp_right = ArrangePointGimmick_("o_com_36", model_warp_right, "obj_warp_right000");			// 加速リング(青)
	local warp_left = ArrangePointGimmick_("o_com_37", model_warp_left, "obj_warp_left000");			// 加速リング(緑)
	
//	▼カメラ設定
	local density = GetFogDensity_();
	SetFogDensity_(0.5);
	local distmax = GetFogDistMax_();
	SetFogDistMax_(10000.0);
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");					// 地震カメラ込
//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------
	//===============================================
	//カット1
	//===============================================
	StartDemo(FADE_COLOR_BLACK);

	SetMotion_(red_door, MOT_GIMMICK_1, BLEND_XL);								// １つ目扉が開く
	PlaySE_("SE_DEM_196");
	SetMotionSpeed_(red_door, 0.6);
	Wait_(45);
	efc_door000 = SetPointWorldEffect_("ef881_06_door_r", "efc_door000");
	SetMotionSpeed_(red_door, 0.3);
	Wait_(35);
	PlaySE_("SE_DEM_197");
	Wait_(70);
	SetMotionSpeed_(red_door, 0.4);
	WaitMotion(red_door);
	Wait_(15);
	//=====================
	//二つ目の扉が開く
	//=====================
	SetMotion_(center_door, MOT_GIMMICK_1, BLEND_M);							// 2つ目扉が開く
	PlaySE_("SE_DEM_197");
	SetMotionSpeed_(center_door, 0.4);
	WaitMotion(center_door);

	WaitTask(task_cam);
	Wait_(40);
	//===============================================
	//カット2
	//===============================================
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	
	task_aroma = Task_WalkAroundToPos(aroma, GetPos_(player), 5.7)
	task_player = Task_WalkAroundToPos(player, GetPos_(aroma), 5.7)
	WaitTask(task_aroma);

	SetMotion_(aroma, MOT_WAIT, BLEND_L);		//アロマ待機モーション
	SetMotion_(player, MOT_WAIT, BLEND_L);		//主人公待機モーション
	WaitTask(task_aroma);
	WaitTask(task_player);
	Wait_(10);
	
	//===============================================
	// ■アロマ
	// 「時空の裂け目の封印を　解除したわ。　これで空の神ホアカリと　戦えるわよ。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("DEMO_812_MSG_010");
	KeyInputWait_();
	//「アンタの勝利を　祈ってるわ。　がんばんなさいよ　<name_player/>！
	ShowMsg_("DEMO_812_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//-----------------------------------------------
	Wait_(30);
	
//	EndDemo(FADE_COLOR_BLACK);
	EndDemoBgmFade_(FADE_DEF);
	
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
	SetFogDensity_(density);
	SetFogDistMax_(distmax);
	DeleteAllTask_();
	SetSepiaColor_(false);
	End_();
}
