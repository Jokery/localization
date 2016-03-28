//=============================================
//
//		demo210[リアクターの遺言]
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
	local efc_player, efc_reactor;

// ▼リソース読込
	// ギミック
	local model_reactor = ReadGimmick_("o_dem_07");		// リアクター
	// キャラクター
	local player = GetPlayerId_();						// 主人公
	// エフェクト
	LoadEffect_("ef732_09_light_reactor_c");
	LoadEffect_("ef732_13_light_reactor01");

// ▼配置
	// リアクター
	local reactor = ArrangePointGimmick_("o_dem_07", model_reactor, "obj_reactor000");
	SetPointPosNoFit_(reactor, "obj_reactor000");
	SetMotion_(reactor, MOT_GIMMICK_1, BLEND_N);
	
	// 主人公
	SetPointPos_(player, "player000");

// ▼非常駐モーション読込
	local player_hold = ReadMotion_(player, "Player_hold");				// 待機→物を持つ
	local player_hold_L = ReadMotion_(player, "Player_hold_L");			// 物を持つL
	local player_dazzle = ReadMotion_(player, "Player_dazzle");			// 物を持つ→まぶしい
	local player_dazzle_L = ReadMotion_(player, "Player_dazzle_L");		// まぶしいL

// ▼時間設定
	SetTime_(START_TIME_ZONE_NIGHT);
	Wait_(30);

// ▼カメラ設定
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット1
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	
	StartDemo(FADE_COLOR_BLACK);
	Wait_(40);
	
	SetMotion_(player, player_hold, BLEND_XL);
	Wait_(20);
	AttachObject_(player, reactor, ATTACH_EFFECT3);
	Wait_(15);
	DeleteTask_(task_cam);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット2
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	
	WaitMotion(player);
	SetMotion_(player, player_hold_L, BLEND_M);
	Wait_(40);
	
	PlaySE_("SE_FLD_135");		// リアクター反応音
	efc_player = SetSelectBoneEffect_("ef732_09_light_reactor_c", player, ATTACH_EFFECT1);	// リアクター反応
	SetEffectScale_(efc_player, 0.5);
	Wait_(70);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット3
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	
	SetMotion_(reactor, MOT_GIMMICK_2, BLEND_N);
	
	//===============================================
	// ■リアクター
	// 「……ここに潜むのも　限界のようだ。
	// 　ブンドルドは　この秘密基地に気付いている。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_REACTOR");
	ShowMsg_("DEMO_210_MSG_010");
	KeyInputWait_();
	
	//-----------------------------------------------
	// ■リアクター
	// 「先に脱出させた彼女から　頼まれたメッセージも
	// 　部屋の装置の中に　すでに　セットしてある。
	//-----------------------------------------------
	ShowMsg_("DEMO_210_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	DeleteTask_(task_cam);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット4
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");
	
	SetMotion_(reactor, MOT_GIMMICK_1, BLEND_N);
	
	//===============================================
	// ■リアクター
	// 「裏門のパスワードも　一緒に隠した。
	// 　移動装置を封じる扉は　これで開くはず。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_REACTOR");
	ShowMsg_("DEMO_210_MSG_030");
	KeyInputWait_();
	
	//-----------------------------------------------
	// ■リアクター
	// 「あいつが来れば　リアクターを通じて
	// 　手に入るようにしておいた。
	//-----------------------------------------------
	ShowMsg_("DEMO_210_MSG_040");
	KeyInputWait_();
	
	//-----------------------------------------------
	// ■リアクター
	// 「直接　手渡せないのは　残念だが仕方ない。
	// 　なんとか　うまく受け取ってほしい。
	//-----------------------------------------------
	ShowMsg_("DEMO_210_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	DeleteTask_(task_cam);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット5
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");
	
	//===============================================
	// ■リアクター
	// 「生き残った　俺たちの役目は　最期の希望である
	// 　あいつのために　道をひらくこと……
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_REACTOR");
	ShowMsg_("DEMO_210_MSG_060");
	KeyInputWait_();
	
	//-----------------------------------------------
	// ■リアクター
	// 「お前もそのために　凍骨の氷原へと行ったんだ。
	// 　そうだろう……ルキヤ……？
	//-----------------------------------------------
	ShowMsg_("DEMO_210_MSG_070");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	efc_reactor = SetSelectBoneEffectSetOffset_("ef732_13_light_reactor01", player, ATTACH_EFFECT3, Vec3(-0.5, 1.0, 0.0));
	SetEffectScale_(efc_reactor, 0.15);
	PlaySE_("SE_DEM_046");
	
	Wait_(10);
	
	SetMotion_(player, player_dazzle, BLEND_M);
	SetFace_(player, "Face_loop_close");
	WaitMotion(player);
	SetMotion_(player, player_dazzle_L, BLEND_XL);
	
	Wait_(35);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット6
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//白フェードアウト
	SetFadePlane_(FADE_PLANE.PLANE_3D);
	SetFade_(FADE_OUT, FADE_COLOR_WHITE, 70);
	WaitFade_();
	
	Wait_(10);
	
	//===============================================
	// ■リアクター
	// 「セキュリティコードを　受信します。
	// 　室内のシステムに　アクセスが可能です。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_REACTOR");
	ShowMsg_("DEMO_210_MSG_080");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	DeleteEffect_(efc_reactor);
	Wait_(10);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット7
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	// 白フェードイン
	SetFade_(FADE_IN, FADE_COLOR_WHITE, 70);
	WaitFade_();
	
	// 主人公継続してまぶしがる
	Wait_(10);
	
	SetMotion_(player, player_hold_L, 20);
	Wait_(10);
	SetFace_(player, "Face_default");
	Wait_(10);	
	
	DeleteTask_(task_cam);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット8
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");
	DeleteTask_(task_cam);
	Wait_(20);
	
	SetMotion_(reactor, MOT_GIMMICK_7, BLEND_N);
	Wait_(60);
	
	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");
	Wait_(90);
	
	EndDemo(FADE_COLOR_BLACK);
}
