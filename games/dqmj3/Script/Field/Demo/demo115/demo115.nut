//=============================================
//
//		demo115[アンセスの旅立ち]
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
	local task_cam, task_anse, task_rena, task_ruki, task_birdy, task_boy;
	local efc_player,
	efc_rena, efc_ruki, efc_birdy, efc_boy;

// ▼リソース読込
	// キャラクター
	local ansesu = GetPlayerId_();						// 主人公？(アンセス)
	local model_rena = ReadNpc_("n007");				// なぞの少女(レナーテ)
	local model_ruki = ReadNpc_("n009");				// なぞの老婆（ルキヤ）
	local model_boy = ReadNpc_("n010");					// なぞの少年(子供主人公)
	local model_birdy = ReadNpc_("n019");				// なぞの鳥（バーディ）

// ▼配置
	SetPointPos_(ansesu, "npc_ansesu000");								// 主人公？(アンセス)
	local rena = ArrangePointNpc_(model_rena, "npc_renerte000");		// なぞの少女(レナーテ)
	local ruki = ArrangePointNpc_(model_ruki, "npc_rukiya000");			// なぞの老婆（ルキヤ）
	local boy = ArrangePointNpc_(model_boy, "npc_boy000");				// なぞの少年(子供主人公)
	
	local birdy = ArrangePointNpc_(model_birdy, "npc_birdy000");		// なぞの鳥（バーディ）
	SetScaleSilhouette(birdy, SCALE.N, SILHOUETTE_WIDTH.N);				// バーディ　サイズN
	
	SetStepSe_(ansesu, SILENT_STEP_SE);									// 足音を無音にする
	SetStepSe_(rena, SILENT_STEP_SE);
	SetStepSe_(ruki, SILENT_STEP_SE);
	SetStepSe_(boy, SILENT_STEP_SE);
	SetStepSe_(birdy, SILENT_STEP_SE);
	
// ▼非常駐モーション読込
	// ○主人公？(アンセス)
	local anse_nod = ReadMotion_(ansesu, "Player_nod");							// うなづく
	local anse_look_right = ReadMotion_(ansesu, "Player_look_right_L");			// 右を向く
	local anse_talk = ReadMotion_(ansesu, "Player_talk");						// 話す
	local anse_talk_L = ReadMotion_(ansesu, "Player_talk_L");					// 話すL
	local anse_look_left = ReadMotion_(ansesu, "Player_look_left_L");			// 左を向く
	local anse_ride_on = ReadMotion_(ansesu, "Player_ride_on");					// ライドオン
	local anse_ride_L = ReadMotion_(ansesu, "Player_ride00_L");					// ライドL
	
	//○なぞの少女(レナーテ)
	local rena_nod = ReadMotion_(rena, "n007_nod");									// うなづく
	local rena_right = ReadMotion_(rena, "n007_look_right_L");						// 右を向く
	local rena_left = ReadMotion_(rena, "n007_look_left_L");						// 左を向く
	local rena_ride_hover = ReadMotion_(rena, "n007_ride_hovering_L");				// ホバリング時のバーディに乗る(アンセスにアタッチが必要)
	local rena_ride = ReadMotion_(rena, "n007_ride_L");								// 滑空時のバーディに乗る(アンセスにアタッチが必要)

	//○なぞの老婆（ルキヤ）
	local ruki_look_right_L = ReadMotion_(ruki, "n009_look_right_L");				// 右向き待機L
	local ruki_look_left_L = ReadMotion_(ruki, "n009_look_left_L");					// 左向き待機L
	local ruki_look_up_L = ReadMotion_(ruki, "n009_look_up_L");						// 上向き待機L
	local ruki_look_down_L = ReadMotion_(ruki, "n009_look_down_L");					// 下向き待機L
	
	//○なぞの少年(子供主人公)
	local boy_look_down = ReadMotion_(boy, "n010_look_down_L");						// うつむき待機L
	local boy_look_up = ReadMotion_(boy, "n010_look_up_L");							// 上向き待機L
	SetFace_(boy, "Face_sad");
	
	//○なぞの鳥（バーディ）
	local birdy_idol = ReadMotion_(birdy, "n019_idol");								// 待機L
	local birdy_before_flight = ReadMotion_(birdy, "n019_before_flight");			// 待機→飛行前
	local birdy_before_flight_L = ReadMotion_(birdy, "n019_before_flight_L");		// 飛行前L
	local birdy_flight_Hovering = ReadMotion_(birdy, "n019_flight_Hovering");		// 待機→飛行(ホバリング)
	local birdy_flight_Hovering_L = ReadMotion_(birdy, "n019_flight_Hovering_L");	// 飛行(ホバリング)L
	local birdy_glide_L = ReadMotion_(birdy, "n019_flight_glide_L");				// 滑空
	
// ▼色調設定
	ChangeColorSepia();
	
// ▼レイアウト
	LoadLayout_("noise");															//ノイズ
	
// ▼初期モーション
	SetMotion_(ansesu, anse_talk_L, BLEND_N);										//アンセス話す
	SetMotion_(rena, MOT_WAIT, BLEND_N);											//レナーテ待機
	SetMotion_(birdy, birdy_idol, BLEND_N);											//バーディ待機
	SetMotion_(ruki, MOT_WALK, BLEND_N);											//ルキヤ歩き
	SetMotion_(boy, MOT_WALK, BLEND_N);												//少年歩き

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	ReadWaitingLod("lodeye000", "lodtgt000");
	SetPointCameraEye_("lodeye000");
	SetPointCameraTarget_("lodtgt000");
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット1 主人公たちがいる場所　PANDOWN
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	StartDemo(FADE_COLOR_WHITE);
	
	PlayBgm_("BG_AMBI_016");
	SetLayoutAnime_("noise_in", false);												//ノイズ
	WaitLayoutAnime();
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	SetLayoutAnime_("noise_out", false);											//ノイズアウト
	
	WaitTask(task_cam);

	task_ruki = Task_MoveForward_(ruki, 1.0, false);
	task_boy = Task_MoveForward_(boy, 1.0, false);
	
	Wait_(40);

	DeleteTask_(task_ruki);
	DeleteTask_(task_boy);

	SetMotion_(ruki, MOT_WAIT, BLEND_XL);											//ルキヤ待機
	SetMotion_(boy, MOT_WAIT, BLEND_XL);											//少年待機

	SetMotion_(ansesu, anse_look_right, BLEND_XL);									//アンセス右を向く
	SetMotion_(rena, rena_left, BLEND_XL);											//レナーテ左を向く
	
	Wait_(60);

	//カット3に向けて位置・表示調整
	SetMotion_(rena, MOT_WAIT, BLEND_N);											//レナ待機
	SetVisible(boy, false);															//少年非表示
	
	SetPointPos_(boy, "npc_boy001");												// 少年・鳥・レナ移動
	SetPointPos_(birdy, "npc_birdy001");
	SetPointPos_(rena, "npc_renerte001");
	SetVisible(rena, false);														//レナーテ非表示
	
	SetDirToObject_(ansesu, ruki);													//向き変更
	SetDirToObject_(birdy, ruki);
	
	SetMotion_(ansesu, MOT_WAIT, BLEND_N);											//アンセス待機
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット2 ルキヤにズームイン
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	
	SetMotion_(ruki, MOT_TALK, BLEND_L);											//ルキ話す
	WaitMotion(ruki); 
	SetMotion_(ruki, MOT_TALKLOOP, BLEND_M);										//ルキ話すL
	
	//-------------------------------------------------------------------------
	//	▼なぞの老婆
	//	「そろそろ出発かい？
	//-------------------------------------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MYSTERY_OLD_WOMAN");
	ShowMsg_("DEMO_115_MSG_010");
	KeyInputWait_();

	//-------------------------------------------------------------------------
	//	▼なぞの老婆
	//	「すまないね……あんたたちの背中に　すべてを　背負わせちまった。
	//-------------------------------------------------------------------------
	ShowMsg_("DEMO_115_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//-------------------------------------------------------------------------	

	SetMotion_(ruki, ruki_look_down_L, BLEND_XL);									//ルキ下待機
	Wait_(10);
	SetFace_(ruki, "Face_loop_close");
	WaitTask(task_cam);
	Wait_(80);

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット3 アンセス・レナーテ・バーディ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetVisible(rena, true);															//レナーテ表示
	
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	//-------------------------------------------------------------------------
	//	▼アンセス
	//	「あやまらなくていい。　オレたちが　そうすると決めたんだ。
	//-------------------------------------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_115_MSG_030");
	
	SetMotion_(ansesu, anse_talk, BLEND_L);											//アンセス話す
	WaitMotion(ansesu); 
	SetMotion_(ansesu, anse_talk_L, BLEND_M);										//アンセス話すL

	KeyInputWait_();
	CloseMsgWnd_();
	//-------------------------------------------------------------------------
	SetMotion_(ansesu, MOT_WAIT, BLEND_L);											//アンセス待機
	SetMotion_(rena, rena_nod, BLEND_XL);											//レナーテうなづく
	WaitMotion(rena); 
	SetMotion_(rena, MOT_WAIT, BLEND_XL);											//レナ待機

	Wait_(40);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット4 レナーテアップ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetVisible(ansesu, false);														//アンセス非表示
	SetVisible(birdy, false);														//バーディ非表示

	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	
	SetMotion_(rena, MOT_TALK, BLEND_L);											//レナ話す
	WaitMotion(rena); 
	SetMotion_(rena, MOT_TALKLOOP, BLEND_M);										//レナ話すL
	
	//-------------------------------------------------------------------------
	//	▼なぞの少女
	//	「大丈夫　必ず勝って戻るから……。　私と彼となら　きっとやってみせる。
	//-------------------------------------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MYSTERYGIRL");
	ShowMsg_("DEMO_115_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	//-------------------------------------------------------------------------
	SetMotion_(rena, MOT_WAIT, BLEND_XL);											//レナ待機

	Wait_(40);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット5 ルキヤ・少年
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetPointPos_(ruki, "npc_rukiya001");											//ルキ移動

	SetVisible(rena, false);														//レナーテ非表示
	SetVisible(boy, true);															//少年表示
	SetMotion_(boy, boy_look_down, BLEND_N);										//少年落ち込み待機

	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");
	
	SetMotion_(ruki, ruki_look_left_L, BLEND_XL);									//ルキ左待機
	SetFace_(ruki, "Face_default");
	Wait_(60);
	SetMotion_(boy, MOT_WAIT, BLEND_L);											//少年待機
	Wait_(20);
	//-------------------------------------------------------------------------
	//	▼なぞの老婆
	//	「この子のことは　あたしに任せておきな。　敵には　指一本触れさせやしないよ。
	//-------------------------------------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MYSTERY_OLD_WOMAN");
	ShowMsg_("DEMO_115_MSG_050");
	
	SetMotion_(ruki, MOT_TALK, BLEND_L);											//ルキ話す
	WaitMotion(ruki); 
	SetMotion_(ruki, MOT_TALKLOOP, BLEND_M);										//ルキ話すL

	KeyInputWait_();
	CloseMsgWnd_();
	//-------------------------------------------------------------------------
	SetMotion_(ruki, MOT_WAIT, BLEND_L);											//ルキ待機

	Wait_(60);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット6 アン・レナ・バー
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetVisible(ansesu, true);														//アンセス表示
	SetVisible(birdy, true);														//バーディ表示
	SetVisible(rena, true);															//レナーテ表示
	SetVisible(boy, false);															//少年非表示
	SetVisible(ruki, false);														//ルキ非表示

	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");

	SetMotion_(rena, rena_nod, BLEND_XL);											//レナーテうなづく
	WaitMotion(rena); 
	SetMotion_(rena, MOT_WAIT, BLEND_L);											//レナ待機
	Wait_(20);
	//-------------------------------------------------------------------------
	//	▼なぞの少女
	//	「ええ……信じているわ。　それじゃ　そろそろ行きましょう？
	//-------------------------------------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MYSTERYGIRL");
	ShowMsg_("DEMO_115_MSG_060")
	SetMotion_(rena, MOT_TALK, BLEND_L);											//レナ話す
	WaitMotion(rena); 
	SetMotion_(rena, MOT_TALKLOOP, BLEND_M);										//レナ話すL
	Wait_(15);
	SetMotion_(rena, rena_right, BLEND_XL);											//レナ右を向く
	
	task_anse = Task_WalkAroundToPos(ansesu, GetPos_(rena), 5.5);					//アンセス左を向く
	WaitTask(task_anse);
	SetMotion_(ansesu, MOT_WAIT, BLEND_M);											//アンセス待機
	
	KeyInputWait_();
	CloseMsgWnd_();
	//-------------------------------------------------------------------------
	
	SetMotion_(ansesu, anse_nod, BLEND_XL);											//アンセスうなづく
	WaitMotion(ansesu); 
	SetMotion_(ansesu, MOT_WAIT, BLEND_L);											//アンセス待機
	Wait_(60);
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット7 バーディに乗って飛翔
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetAlpha_(rena, ALPHA_CLEAR);
	SetMotion_(birdy, birdy_flight_Hovering_L, BLEND_N);							//バーディホバリングL
	SetMotion_(ansesu, anse_ride_L, BLEND_N);										//アン・レナ　ライドモーション
	SetMotion_(rena, rena_ride_hover, BLEND_N);

	AttachObject_(birdy, ansesu, ATTACH_EFFECT2);									//アン⇒バーディにアタッチ
	AttachObject_(ansesu, rena, ATTACH_GLOBAL);										//レナ⇒アンセスにアタッチ
	
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");
	Wait_(3);
	SetAlpha_(rena, ALPHA_EXIST);

	WaitTask(task_cam);
	Wait_(80);
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット8 方向転換→上空へ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetVisible(ruki, true);															//ルキ表示
	SetMotion_(ruki, MOT_WAIT, BLEND_N);											//ルキ待機
	SetVisible(boy, true);															//少年表示
	SetDir_(boy, 180);
	SetPointPosNoFit_(birdy, "npc_birdy002");										//鳥移動

	SetPointCameraEye_("cameye004");
	SetPointCameraTarget_("camtgt004");
	
	SetMotion_(ruki, ruki_look_up_L, BLEND_XL);											//ルキ上待機
	task_birdy = Task_RotateToDir_(birdy, 205, 5);
	WaitTask(task_birdy);
	
	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");
	task_birdy = Task_AnimeMoveNoFit_(birdy, "anm_birdy001");
	
	SetMotion_(boy, MOT_WALK, BLEND_M);													//少年歩き
	task_boy = Task_MoveForward_(boy, 1.0, false);
	Wait_(15);
	DeleteTask_(task_boy);
	SetMotion_(boy, boy_look_up, BLEND_M);												//少年上待機
	
	WaitTask(task_cam);
	Wait_(80);
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット9 ルキヤアップ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetVisible(boy, false);															//少年非表示
	SetPointCameraEye_("cameye003");
	SetPointCameraTarget_("camtgt003");

	//-------------------------------------------------------------------------
	//	▼なぞの老婆
	//	「まかせたよ　ふたりとも。　このブレイクワールドの　未来を……。
	//-------------------------------------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MYSTERY_OLD_WOMAN");
	ShowMsg_("DEMO_115_MSG_070");
	KeyInputWait_();
	CloseMsgWnd_();
	
	Wait_(40);

	StopBgm_(3);
	PlaySE_("SE_DEM_050");
	local noise = SetLayoutAnime_("noise_in", false);								//ノイズ
	Wait_(30);
	SetSepiaColor_(false);
	EndDemo(FADE_COLOR_WHITE);
}
