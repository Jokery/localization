//=============================================
//
//		demo022[Cランク試験_1(入口)]
//
//=============================================
function Update()
{

// ▼変数定義
	local task_cam;
	local efc_player;

// ▼リソース読込
	local player = GetPlayerId_();

	local model_monolith = ReadGimmick_("o_com_02");		// モノリス
	local model_door = ReadGimmick_("o_O01_04");			// 扉（ランクＣ）

	LoadEffect_("ef732_07_teleport_monolith");				// モノリス転送エフェクト
	LoadEffect_("ef712_10_emo_surprise01");
	LoadEffect_("ef732_08_light_scan"); 					// スキャンの光エフェクト

// ▼配置
	SetPointPos_(player, "player000");
	SetDir_(player, 180);

	// モノリス
	local monolith = ArrangePointGimmick_("o_com_02", model_monolith, "obj_monolith000");
	// 扉（ランクＣ）
	local door = ArrangePointGimmick_("o_O01_04", model_door, "obj_door000");

// ▼非常駐モーション読込
	local player_look_up_L = ReadMotion_(player, "Player_look_up_L");					// 上向き待機L
	local player_caution01_L = ReadMotion_(player, "Player_caution01_L");				// 警戒L
	local player_guard_L = ReadMotion_(player, "Player_guard_L");						// 身構えるL
	local player_caution = ReadMotion_(player, "Player_caution");						// 身構える→警戒

// ▼初期のモーション
	SetMotion_(monolith, MOT_GIMMICK_2, BLEND_N);
	SetMotion_(player, MOT_WAIT, BLEND_N);									// ◆うつむき待機モーションがないのでWAITで代用しています。

	SetManualCalcAlpha_(player, true);
	SetAlpha_(player, ALPHA_CLEAR);

// ▼カメラ設定
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット1 Cランクフロア 背景表示
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	StartDemo(FADE_COLOR_BLACK);

	//=====================================
	//	「こちらは　モンスターマスター専用施設
	OpenMsgWnd_();
	ShowMsg_("DEMO_022_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//=====================================

	WaitTask(task_cam);
	Wait_(40);

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット2 スキャンされる主人公
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");

	Wait_(15);

	PlaySE_("SE_DEM_017");
	efc_player = SetSelectBoneEffect_("ef732_07_teleport_monolith", player, ATTACH_GLOBAL);					//主人公転送

	Wait_(1);
	SetAlpha_(player, 0.1);
	Wait_(1);
	SetAlpha_(player, 0.2);
	Wait_(1);
	SetAlpha_(player, 0.3);
	Wait_(1);
	SetAlpha_(player, 0.4);
	Wait_(1);
	SetAlpha_(player, 0.5);
	Wait_(1);
	SetAlpha_(player, 0.6);
	Wait_(1);
	SetAlpha_(player, 0.7);
	Wait_(1);
	SetAlpha_(player, 0.8);
	Wait_(1);
	SetAlpha_(player, 0.9);
	Wait_(1);
	SetAlpha_(player, 1.0);

	Wait_(40);
	//=====================================
	//	「音声だけで　失礼いたします。
	OpenMsgWnd_();
	ShowMsg_("DEMO_022_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//=====================================

	SetMotion_(player, player_look_up_L, BLEND_M);							// 主　上待機
	local pos = Vec3(0.0, 1.5, 0);
	efc_player = SurpriseDispSetOffset(player, pos, 0.65);

	Wait_(45);
	//=====================================
	//	「私は　当施設を管理するための　人工知能。
	OpenMsgWnd_();
	ShowMsg_("DEMO_022_MSG_030");
	KeyInputWait_();

	//	「私はテレジア。ライセンス試験を　受験される
	ShowMsg_("DEMO_022_MSG_040");
	KeyInputWait_();

	//	「これより　あなたが　施設利用権を　お持ちか　確認をさせていただきます。
	SetTalkName_("NAME_TAG_TEREZIA");
	ShowMsg_("DEMO_022_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	//=====================================
	Wait_(15);
	SetMotion_(player, MOT_WAIT, BLEND_XL);							// 主　待機
	Wait_(10);
	PlaySE_("SE_FLD_235");		//スキャン音
	efc_player = SetSelectBoneEffect_("ef732_08_light_scan", player, ATTACH_GLOBAL);		//マスタースキャン
	Wait_(50);
	
	SetExchangeRegistrationNumber_();		// DEMO_022_MSG_060に含まれる<exchange/>タグをプレイヤー登録番号に置き換える
	//=====================================
	//	「モンスターマスターの　因子を感知。
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TEREZIA");	
	ShowMsg_("DEMO_022_MSG_060");
	KeyInputWait_();

	//	「ようこそ　<name_player/>さま。
	ShowMsg_("DEMO_022_MSG_070");
	SetFace_(player, "Face_default");
	KeyInputWait_();
	//=====================================

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット3 回転カメラ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");

	//=====================================
	//テレジア「当施設では　モンスターマスターに対する　ライセンス試験を　実施しております。
	ShowMsg_("DEMO_022_MSG_080");
	KeyInputWait_();

	//テレジア「試験に合格された　モンスターマスターが　獲得できるチカラは　陸上ライド。
	ShowMsg_("DEMO_022_MSG_090");
	KeyInputWait_();
	CloseMsgWnd_();
	//=====================================
	WaitTask(task_cam);
	Wait_(20);

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット4 高台映す
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓	
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");

	//=====================================
	//テレジア「これは　モンスターに乗って　大地を駆け抜けるための　チカラです。
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TEREZIA");
	ShowMsg_("DEMO_022_MSG_100");
	KeyInputWait_();

	//テレジア「行動範囲を広げて　冒険の足がかりとなる　このチカラのために　ぜひ　ご参加ください。
	ShowMsg_("DEMO_022_MSG_110");
	KeyInputWait_();
	CloseMsgWnd_();
	//=====================================
	WaitTask(task_cam);
	Wait_(20);

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット5 扉ズームアップ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓	
	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004")

	//=====================================
	//テレジア「今回の　<name_player/>さまには　Ｃランクを　ご案内させていただきます。
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TEREZIA");
	ShowMsg_("DEMO_022_MSG_120");
	KeyInputWait_();

	//テレジア「奥の扉へと　お進みください。
	ShowMsg_("DEMO_022_MSG_130");
	KeyInputWait_();
	CloseMsgWnd_();

	WaitTask(task_cam);
	//=====================================

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■デモ終了
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	EndDemo(FADE_COLOR_BLACK);
}