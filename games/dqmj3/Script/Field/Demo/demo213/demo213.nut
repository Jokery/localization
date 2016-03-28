//=============================================
//
//		demo213[大陸移動]
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
	local task_cam;
	local efc_player, efc_holography;

// ▼リソース読込
	// キャラクター
	local player = GetPlayerId_();					// 主人公
	local npc_rena = ReadNpc_("n034");				// レナーテ
	// ギミック
	local model_monitor = ReadGimmick_("o_G02_14");	// モニタ
	local model_meimetu = ReadGimmick_("o_G02_11");	// コンピューターの明滅
	// エフェクト
	LoadEffect_("ef732_09_light_reactor_c");		// リアクター発光
	LoadEffect_("ef732_14_holography01");			// ホログラム表現　常駐
	LoadEffect_("ef732_16_holography01");			// ホログラム表現　消失

// ▼配置
	// 主人公
	SetPointPos_(player, "player000");
	//レナーテ
	local res_rena = ArrangePointNpc_(npc_rena, "npc_renerte000");
	SetManualCalcAlpha_(res_rena, true);
	efc_holography = SetBoneEffect_("ef732_14_holography01", res_rena);	
	// ギミック設置
	local monitor = ArrangePointGimmick_("o_G02_14", model_monitor, "obj_monitor000");	//モニタ
	// 明滅
	local meimetu = ArrangePointGimmick_("o_G02_11", model_meimetu, "obj_meimetu000");
	
// ▼非常駐モーション読込
	local player_touch_reactor_L = ReadMotion_(player, "Player_touch_reactor_L");		// リアクターを触るL
	local player_look_right_L = ReadMotion_(player, "Player_look_right_L");				// 右を見る
	local renerte_look_left_L = ReadMotion_(res_rena, "n007_look_left_L");				//　レナーテ　左を向く
	local renerte_look_down_L = ReadMotion_(res_rena, "n007_look_down_L");				//　レナーテ　下を向く	
	local renerte_look_up_L = ReadMotion_(res_rena, "n007_look_up02_L");				//　レナーテ　上を向く	

// ▼時間設定
	SetTime_(START_TIME_ZONE_NIGHT);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット1　主人公&モニタ⇒レイアウトマップ表示
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

// ▼カメラ設定
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_WHITE);

	//===============================================
	//*システムメッセージ
	//	続いて　凍骨の氷原へとつながる
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_213_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(30);
	StartEarthQuake_(60, 4, 0.4)
	PlayLoopSE_("SE_DEM_013");
	Wait_(30);
	StopLoopSE_(30);

	//...........................................................................
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);					//フェードアウト
	WaitFade_();
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	SetPointPos_(player, "player001");
	Wait_(10);
	LoadLayout_("w_map");										//レイアウト読み込み
	SetLayoutAnime_("move_02", false);							//マップ
	Wait_(30);
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);					//フェードイン
	//...........................................................................

	Wait_(50);
	PlaySE_("SE_DEM_179");
	Wait_(100);
	PlaySE_("SE_DEM_178");
	Wait_(200);


	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット2　二人側面→主人公ズームイン
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	PlaySE_("SE_FLD_135");		// リアクター反応音
	efc_player = SetSelectBoneEffect_("ef732_09_light_reactor_c", player, ATTACH_EFFECT1);	//リアクター発光
	SetEffectScale_(efc_player, 0.5);
	Wait_(10);
	SetFace_(player, "Face_left");
	SetMotion_(player, player_touch_reactor_L, 20);		//リアクターに触るL
	Wait_(50);

	//===============================================
	//*システムメッセージ
	//モンスターマスター　○主人公の名前○を確認。
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_213_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	Wait_(15);
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");		// 120F
	SetMotion_(res_rena, renerte_look_down_L, 20);		////　レナーテ　上を向く
	SetFace_(player, "Face_right");
	//===============================================
	//なぞの少女
	//凍骨の氷原に……ルキヤを　よく知る者がいる。
	//移動装置で　凍骨の氷原に　向かいなさい……。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MYSTERYGIRL");
	ShowMsg_("DEMO_213_MSG_030");
	Wait_(5);
	SetMotion_(player, player_look_right_L, 20);		// 右を見る
	KeyInputWait_();
	CloseMsgWnd_();
	//-----------------------------------------------
	PlaySE_("SE_DEM_048");															//レナーテ消える
	SetVisible(res_rena, false);
	DeleteEffect_(efc_holography);
	efc_holography = SetBoneEffect_("ef732_16_holography01", res_rena);
	SetAlpha_(res_rena, 0);							//レナーテα値

	Wait_(75);

	EndDemo(FADE_COLOR_BLACK);
}
