//=============================================
//
//		demo526[アンセスからの伝言]
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
	local player = GetPlayerId_();					// アンセス
	
	LoadLayout_("noise");							//レイアウト ノイズ

// ▼配置
	// 主人公
	SetPointPos_(player, "player000");

// ▼非常駐モーション読込
	local player_wood_look_down_L = ReadMotion_(player, "Player_wood_look_down_L");		//アンセス 気にもたれる(うつむく)
	local Player_wood_look_front_L = ReadMotion_(player, "Player_wood_look_front_L");		//アンセス 気にもたれる(前を向く)
	local Player_look_left_L = ReadMotion_(player, "Player_look_left_L");				//アンセス 顔を左に向ける
	local player_talk = ReadMotion_(player, "Player_talk");								//アンセス 会話
	local player_talk_L = ReadMotion_(player, "Player_talk_L");							//アンセス 会話L
	local player_r_hand_hold01L = ReadMotion_(player, "Player_r_hand_hold01L");			//アンセス 右手を握る1L
	local player_r_hand_hold02L = ReadMotion_(player, "Player_r_hand_hold02L");			//アンセス 右手を握る2L
	
	
// ▼カメラ設定
	
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	DeleteTask_(task_cam);

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------
	
	SetMotion_(player, player_wood_look_down_L, BLEND_L);								//アンセス 木にもたれる(うつむく)
	
	SetFace_(player, "Face_loop_close");												//アンセス 目を閉じる

	StartDemo(FADE_COLOR_WHITE);
	ChangeColorSepia();
	
	PlayBgm_("BG_AMBI_016");
	SetLayoutAnime_("noise_in", false);													//ノイズフェードイン
	WaitLayoutAnime();
	SetLayoutAnime_("noise_out", false);												//ノイズフェードアウト
	WaitLayoutAnime(); 
	
	//===============================================
	//*バーディ
	// 	「ア……アンセス！？
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BIRDY");
	ShowMsg_("DEMO_526_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	//===============================================
	//*レナーテ
	// 	「バーディ　静かに。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RENERTE");
	ShowMsg_("DEMO_526_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	SetMotion_(player, Player_wood_look_front_L, BLEND_XL);	
	SetFace_(player, "Face_eyes_close");													//アンセス 通常の目
	Wait_(30);

	//アンセス 左を向いて待機
	SetMotion_(player, Player_look_left_L, BLEND_XL);
	Wait_(60);
	
	//===============================================
	//*アンセス
	// 	「映像を撮って　あいつに送る？
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ANSESU");
	ShowMsg_("DEMO_526_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	local task_player = Task_RotateToDir_(player, 200, 2);
	SetMotion_(player, MOT_WALK, BLEND_XL);
	Wait_(30);
	StopBgm_(30);
	
	SetMotion_(player, player_talk, BLEND_XL);											//アンセス 会話
	WaitMotion(player);
	SetMotion_(player, player_talk_L, BLEND_XL);											//アンセス 会話L
	
	Wait_(15);
	PlayBgm_("BGM_009");
	//===============================================
	//*アンセス
	// 	「とりあえず……正直言って
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ANSESU");
	ShowMsg_("DEMO_526_MSG_040");
	KeyInputWait_();
	//===============================================	
	
	//===============================================
	//*アンセス
	// 	「状況は悪いと　言わざるを得ない。
	//-----------------------------------------------
	ShowMsg_("DEMO_526_MSG_050");
	KeyInputWait_();
	//===============================================

	SetMotion_(player, player_r_hand_hold01L, BLEND_XL);									//アンセス 握手1	
	Wait_(30);	
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	
	//===============================================
	//*アンセス
	// 	「だが……まだ　あきらめちゃいない。
	//-----------------------------------------------
	ShowMsg_("DEMO_526_MSG_060");
	KeyInputWait_();
	//===============================================
			
	SetMotion_(player, player_r_hand_hold02L, BLEND_XL);									//アンセス 握手2L
	
	//===============================================
	//*アンセス
	// 	「人間もモンスターも　マ素に汚染されて
	//-----------------------------------------------
	ShowMsg_("DEMO_526_MSG_070");
	KeyInputWait_();
	//===============================================

	SetMotion_(player, MOT_WAIT, BLEND_XL);										//アンセス 待機

	//===============================================
	//*アンセス
	// 	「だから　オレたちは　必ず勝って戻るよ。
	//-----------------------------------------------
	ShowMsg_("DEMO_526_MSG_080");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	//*アンセス
	// 	「けど……もしも　オレが戻らなかったら
	//-----------------------------------------------
	ShowMsg_("DEMO_526_MSG_090");
	KeyInputWait_();
	//===============================================	
	SetMotion_(player, player_talk, BLEND_XL);													//アンセス 会話
	WaitMotion(player);
	SetMotion_(player, player_talk_L, BLEND_XL);												//アンセス 会話L

	//===============================================
	//*アンセス
	// 	「お前はお前だ。オレじゃない。
	//-----------------------------------------------
	ShowMsg_("DEMO_526_MSG_100");
	KeyInputWait_();
	//===============================================	
	
	//===============================================
	//*アンセス
	// 	「<name_player/>……自分自身の意志で
	//-----------------------------------------------
	ShowMsg_("DEMO_526_MSG_110");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(player, MOT_WAIT, BLEND_XL);
	Wait_(30);
	PlaySE_("SE_DEM_126");															//■SE:映像がノイズで終わる
	SetLayoutAnime_("noise_in", false);												//ノイズフェードイン
	WaitLayoutAnime();
	SetLayoutAnime_("noise_loop", true);											//ノイズフェードアウト
	
	EndDemo(FADE_COLOR_WHITE);
}
