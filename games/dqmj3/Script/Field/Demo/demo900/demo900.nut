//=============================================
//
//		demo900[広告用デモ]
//
//=============================================

//-------------------------------------------------------------------------
//
//		読み込み・配置
//
//-------------------------------------------------------------------------
function Update()
{
	DummyMsg();
	
// ▼変数定義
	local task_cam, task_player;
	local efc_player;

// ▼リソース読込
	// キャラクター
	local player = GetPlayerId_();									// 主人公
	
	//NPC
	local model_nocho = ReadNpc_("n000");							// ノチョーラ
	local model_nebyurasu = ReadNpc_("m123_02");					// ダークネビュラス
	local model_hikui = ReadNpc_("m053_00")							// ひくいどり

// ▼配置
	// 主人公
	SetPointPos_(player, "player000");
	
	//NPC
	local nocho = ArrangePointNpc_(model_nocho, "npc_nocho000");		// ノチョーラ
	
	local nebyu = ArrangePointNpc_(model_nebyurasu, "player000");
	SetScaleSilhouette(nebyu, SCALE.N, SILHOUETTE_WIDTH.N);			// ネビュ　サイズN

	local hikui = ArrangePointNpc_(model_hikui, "player000");
	SetScaleSilhouette(nebyu, SCALE.N, SILHOUETTE_WIDTH.N);			// ひくい　サイズN
	SetVisible(hikui, false);
	
// ▼ギミック設置	
	local window = ReadGimmick_("o_A00_04");						//センタービルの窓ギミック
	local res_tele = ArrangePointGimmick_("o_A00_04", window, "obj_window000");
	SetMotion_(res_tele, MOT_GIMMICK_1, BLEND_N);	

// ▼非常駐モーション読込
	local ride_L = ReadMotion_(player, "Player_ride00_L");			// ライドL
	SetMotion_(player, ride_L, BLEND_N);							// 主　初期モーション



//	SetMotionSpeed_(player, 0.2);	
//	SetMotionSpeed_(nocho, 0.2);	
//	SetMotionSpeed_(hikui, 0.2);	
//	SetMotionSpeed_(nebyu, 0.2);	
	
//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------
	//===================================
	//カット1-1　ネビュラス
	//===================================
	RideOn_(player, nebyu, 388, 0.6);							//ライドオン　ネビュラス
	
	ReadWaitingLod("cameye000", "camtgt000");
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	
	StartDemo(FADE_COLOR_BLACK);
	
	Wait_(300);
	
	//===================================
	//カット1-2　ひくいどり
	//===================================
	//...........................................................................
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);					//フェードアウト
	WaitFade_();
	
	RideOff_(player, nebyu);									//ライドオフ
	SetVisible(nebyu, false);
	SetVisible(hikui, true);
	RideOn_(player, hikui, 164, 0.6);							//ライドオン　ひくいどり

	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);					//フェードイン
	//...........................................................................
	Wait_(300);
	
	//===================================
	//カット2-1ネビュラス
	//===================================
	//...........................................................................
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);					//フェードアウト
	WaitFade_();
	
	RideOff_(player, hikui);									//ライドオフ
	SetVisible(hikui, false);
	SetVisible(nebyu, true);
	
	SetPointPos_(player, "player001");
	SetPointPos_(nebyu, "player001");
	SetPointPos_(nocho, "npc_nocho001");
	RideOn_(player, nebyu, 164, 0.6);							//ライドオン　ネビュラス
	
	ReadWaitingLod("cameye001", "camtgt001");
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");

	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);					//フェードイン
	//...........................................................................
	Wait_(300);
	
	//===================================
	//カット2-2　ひくいどり
	//===================================
	//...........................................................................
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);					//フェードアウト
	WaitFade_();
	
	RideOff_(player, nebyu);									//ライドオフ
	SetVisible(nebyu, false);
	SetVisible(hikui, true);
	
	RideOn_(player, hikui, 164, 0.6);							//ライドオン　ひくいどり
	SetPointPos_(hikui, "player001");

	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);					//フェードイン
	//...........................................................................
	Wait_(300);
	
	//===================================
	//カット3-1　ネビュラス
	//===================================
	//...........................................................................
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);					//フェードアウト
	WaitFade_();
	
	RideOff_(player, hikui);									//ライドオフ
	SetVisible(hikui, false);
	SetVisible(nebyu, true);
	
	SetPointPos_(player, "player002");
	SetPointPos_(nebyu, "player002");
	SetPointPos_(nocho, "npc_nocho002");
	RideOn_(player, nebyu, 164, 0.6);							//ライドオン　ネビュラス

	ReadWaitingLod("cameye002", "camtgt002");
	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");
	
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);					//フェードイン
	//...........................................................................
	
	Wait_(300);
	
	//===================================
	//カット3-2　ひくいどり
	//===================================
	//...........................................................................
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);					//フェードアウト
	WaitFade_();
	
	RideOff_(player, nebyu);									//ライドオフ
	SetVisible(nebyu, false);
	SetVisible(hikui, true);
	
	RideOn_(player, hikui, 164, 0.6);							//ライドオン　ひくいどり
	SetPointPos_(hikui, "player002");

	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);					//フェードイン
	//...........................................................................
	Wait_(300);
	
	EndDemo(FADE_COLOR_BLACK);
}
