//=============================================
//
//		demo304[Bランク試験_1(入口)]
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
	local efc_player,efc_mono,efc_scan;

// ▼リソース読込
	// キャラクター
	local player = GetPlayerId_();									// 主人公
	// ギミック
	local mono = ReadGimmick_("o_com_02");							// モノリス
	local model_door = ReadGimmick_("o_O01_05");					// 扉（ランクＢ）

// ▼配置
	// 主人公
	SetPointPos_(player, "player000");

	// モノリス
	local res_mono = ArrangePointGimmick_("o_com_02", mono, "obj_monolith000");
	SetMotion_(res_mono, MOT_GIMMICK_2, BLEND_N);
	// 扉（ランクＢ）
	local door = ArrangePointGimmick_("o_O01_05", model_door, "obj_door000");

// ▼エフェクトの読み込み
	LoadEffect_("ef732_07_teleport_monolith");						//モノリス転送エフェクト
	LoadEffect_("ef732_08_light_scan"); 							//スキャンの光エフェクト

	//初期のモーション
	SetMotion_(player, MOT_WAIT, BLEND_M);							//主人公待機
	SetAlpha_(player, ALPHA_CLEAR);									//α値の初期設定


//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット1 Bランクフロア 背景表示
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

// ▼カメラ設定
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");

	StartDemo(FADE_COLOR_BLACK);

	//===============================================
	//■テレジア
	//「こちらは　モンスターマスター専用施設
	//　バーチャルコロシアムです。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TEREZIA");
	ShowMsg_("DEMO_304_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();

	WaitTask(task_cam);

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット2 スキャンされる主人公
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

	Wait_(10);

	//主人公転送
	PlaySE_("SE_DEM_017");
	efc_mono = SetSelectBoneEffect_("ef732_07_teleport_monolith", player, ATTACH_GLOBAL);

	for (local i=1; i <= 10; i++) {
		SetAlpha_(player, ALPHA_CLEAR + (i * 0.1));
		Wait_(3);
	}
	Wait_(30);
	//===============================================
	//■テレジア
	//「これより　あなたの　施設利用権について
	//　確認を　させていただきます。
	//===============================================
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TEREZIA");
	ShowMsg_("DEMO_304_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	PlaySE_("SE_FLD_235");					//リアクター（アナライズ/次元の狭間発見時）
	efc_player = SetSelectBoneEffect_("ef732_08_light_scan", player, ATTACH_GLOBAL);		//マスタースキャン
	Wait_(45);

	//===============================================
	//■テレジア
	//「<name_player/>さまの情報を　確認……
	//　登録データと　照合を完了しました。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TEREZIA");
	ShowMsg_("DEMO_304_MSG_030");
	KeyInputWait_();
	//===============================================
	//■テレジア
	//登録番号<exchange/>……
	//　ようこそ　<name_player/>さま。
	//-----------------------------------------------
	SetExchangeRegistrationNumber_();		// DEMO_304_MSG_004に含まれる<exchange/>タグをプレイヤー登録番号に置き換える
	ShowMsg_("DEMO_304_MSG_040");
	KeyInputWait_();

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット3 回転カメラ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	//カメラ回転
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	SetMotion_(player, MOT_WAIT, BLEND_XL);			//主人公待機

	//===============================================
	//■テレジア
	//「今回の<name_player/>さまには
	//　Ｂランク試験を　ご案内させていただきます。
	//-----------------------------------------------
	ShowMsg_("DEMO_304_MSG_050");
	KeyInputWait_();
	//===============================================
	//■テレジア
	//「Ｂランクに合格された　モンスターマスターが
	//　獲得できるチカラは　水中ライド。
	//-----------------------------------------------
	ShowMsg_("DEMO_304_MSG_060");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	WaitTask(task_cam);
	Wait_(10);

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット4 プール映す
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");

	//===============================================
	//■テレジア
	//「これは　水に潜れる　モンスターに乗り
	//　水中を進むための　チカラとなります。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TEREZIA");
	ShowMsg_("DEMO_304_MSG_070");
	KeyInputWait_();

	//===============================================
	//■テレジア
	//「行動範囲を広げて　冒険の足がかりとなる
	//　このチカラのために　ぜひ　ご参加ください。
	//-----------------------------------------------
	ShowMsg_("DEMO_304_MSG_080");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	WaitTask(task_cam);
	Wait_(40);

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット5 扉ズームアップ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");

	//===============================================
	//■テレジア
	//「戦闘によって　能力を　測定いたします。
	//　奥の扉へ　お進みください。
	//===============================================
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TEREZIA");
	ShowMsg_("DEMO_304_MSG_090");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	WaitTask(task_cam);

	EndDemo(FADE_COLOR_BLACK);
}
