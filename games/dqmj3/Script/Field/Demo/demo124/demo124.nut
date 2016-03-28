//=============================================
//
//		demo124[ふしぎな石碑]
//
//=============================================

//-------------------------------------------------------------------------
//
//		読み込み・配置
//
//-------------------------------------------------------------------------
function Update()
{
// ▼LOD読み込み
	ReadWaitingLod("cameye000", "camtgt000");

// ▼フラグ設定
	local bit_ruler = GetEventFlg_("BFG_RULER_END_005");			// Bit_305  ルーラ追加終了フラグ 送電施設
	local bit_ruler2 = GetEventFlg_("BFG_RULER_ADD_005");			// Bit_205  ルーラ追加フラグ 送電施設
	local bit_mantan = GetEventFlg_("BFG_EXAMINE_FULLTANK_STELE");	// Bit_1104 まんたん取得フラグ

// ▼変数定義
	local task_cam, task_player;
	local efc_player;
	local start_time;		// デモ開始時の時間
	local frame;			// 何フレームで時間経過させるか
	local change_time;		// １フレームで変更する時間
	
	// ▽「まんたん」を取得していた場合
	if (bit_mantan) {
		start_time	 = START_TIME_ZONE_EVENING;
		frame		 = 60;
	}
	// ▽「まんたん」未取得の場合
	else {
		start_time	 = START_TIME_ZONE_NOON;
		frame		 = 150;
	}
	change_time = (START_TIME_ZONE_NIGHT - start_time) / frame;		// (夜の時間 － 開始時間) ÷ フレーム数

// ▼時間設定
	SetTime_(start_time);

// ▼モデル読込
	// ギミック
	local model_window = ReadGimmick_("o_A00_04");		//センタービルの窓ギミック
	local model_ruler = ReadGimmick_("o_com_08");		//ルーラポイント
	// キャラクター
	local player = GetPlayerId_();						// 主人公
	// エフェクト
	LoadEffect_("ef732_09_light_reactor_c");

// ▼配置
	// 窓ギミック
	local window = ArrangePointGimmick_("o_A00_04", model_window, "obj_light000");
	SetMotion_(window, MOT_GIMMICK_1, BLEND_N);
	// ルーラポイント
	local ruler = ArrangePointGimmick_("o_com_08", model_ruler, "obj_ruler000");
	// ▽ルーラポイントが既に起動していた場合
	if (bit_ruler2) { SetMotion_(ruler, MOT_GIMMICK_2, BLEND_N); }
	
	// 主人公
	SetPointPos_(player, "player000");

// ▼非常駐モーション読込
	// 主人公
	local Player_touch_reactor = ReadMotion_(player, "Player_touch_reactor_L");	// リアクターを触る

// ▼カメラ設定
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------
	StartDemo(FADE_COLOR_BLACK);
	Wait_(30);
	
	PlaySE_("SE_DEM_019");		//SE:リアクター反応音
	efc_player = SetSelectBoneEffect_("ef732_09_light_reactor_c", player, ATTACH_EFFECT1);		// 「！」
	Wait_(30);
	
	SetMotion_(player, Player_touch_reactor, BLEND_XL);		// リアクターを触る
	Wait_(30);
	
	OpenConnective("connective_ace");
	
	//===============================================
	// ■エース
	// 「送電施設に　着いたみたいだな。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_124_MSG_010");
	KeyInputWait_();
	
	//-----------------------------------------------
	// ▽
	// 「こうやって　リアクターで指示を出すから
	//-----------------------------------------------
	ShowMsg_("DEMO_124_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	CloseConnective();
	
	SetMotion_(player, MOT_WAIT, BLEND_XL);
	Wait_(18);
	
	// ▼カメラ２～～～～～～～～～～～～～～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	
	task_player = Task_RotateToDirSetMotion_(player, 0, ROTATE_DEMO_DEF, MOT_WALK, MOT_WAIT);
	
	StopBgm_(frame);
	// 朝(夕) → 夜へ
	ChangeColorTone_(CITY_COLOR_TONE_DARK_R, CITY_COLOR_TONE_DARK_G, CITY_COLOR_TONE_DARK_B, frame);
	for (local i=1; i <= frame; i++){
		SetTime_(start_time + (change_time * i));
		Wait_(1);
	}
	
	WaitTask(task_cam);
	Wait_(20);
	
	EndDemo(FADE_COLOR_BLACK);
}
