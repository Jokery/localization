//=============================================
//
//		demo507[Ａランク試験_1(入口)]
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
	local player = GetPlayerId_();					// 主人公
	// ギミック
	local mono = ReadGimmick_("o_com_02");							// モノリス
	local model_door = ReadGimmick_("o_O01_03");					// 扉（ランクＡ）
	// エフェクト
	LoadEffect_("ef732_07_teleport_monolith");						//モノリス転送エフェクト
	LoadEffect_("ef732_08_light_scan");								//スキャンの光エフェクト

// ▼配置
	// 主人公
	SetPointPos_(player, "player000");
	
	// モノリス
	local res_mono = ArrangePointGimmick_("o_com_02", mono, "obj_monolith000");
	SetMotion_(res_mono, MOT_GIMMICK_2, BLEND_N);
	// 扉（ランクＡ）
	local door = ArrangePointGimmick_("o_O01_03", model_door, "obj_door000");

// ▼非常駐モーション読込

	//初期のモーション
	SetMotion_(player, MOT_WAIT, BLEND_M);							//主人公待機
	SetAlpha_(player, ALPHA_CLEAR);									//α値の初期設定
	
// ▼カメラ設定
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット1 Aランクフロア 背景表示
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	StartDemo(FADE_COLOR_BLACK);
	
	WaitTask(task_cam);
	Wait_(40);
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット2 スキャンされる主人公
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	
	Wait_(15);

	//主人公転送
	PlaySE_("SE_DEM_017");
	efc_mono = SetSelectBoneEffect_("ef732_07_teleport_monolith", player, ATTACH_GLOBAL);
	
	for (local i=1; i <= 10; i++) {
		SetAlpha_(player, ALPHA_CLEAR + (i * 0.1));
		Wait_(3);
	}

	Wait_(40);
	
	//===============================================
	//*テレジア
	// 	「こちらは　モンスターマスター専用施設
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TEREZIA");
	ShowMsg_("DEMO_507_MSG_010");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	//*テレジア
	// 	「これより　あなたが利用権をお持ちかどうか
	//-----------------------------------------------
	ShowMsg_("DEMO_507_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	PlaySE_("SE_FLD_235");
	efc_player = SetSelectBoneEffect_("ef732_08_light_scan", player, ATTACH_GLOBAL);		//マスタースキャン
	Wait_(45);

	//===============================================
	//*テレジア
	// 	「モンスターマスターの　因子を感知。		
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TEREZIA");
	ShowMsg_("DEMO_507_MSG_030");
	KeyInputWait_();
	//===============================================	
	
	//===============================================
	//*テレジア
	// 	「登録番号○○○○○○……
	//-----------------------------------------------
	SetExchangeRegistrationNumber_();		// DEMO_507_MSG_004に含まれる<exchange/>タグをプレイヤー登録番号に置き換える
	ShowMsg_("DEMO_507_MSG_040");
	KeyInputWait_();
	//===============================================
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット3 回転カメラ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	
	//===============================================
	//*テレジア
	// 	「今回の○主人公の名前○さまには
	//-----------------------------------------------
	ShowMsg_("DEMO_507_MSG_050");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	//*テレジア
	// 	「Ａランクに合格された　モンスターマスターが
	//-----------------------------------------------
	ShowMsg_("DEMO_507_MSG_060");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	WaitTask(task_cam);
	Wait_(10);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット4 高台映す
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");

	//===============================================
	//*テレジア
	// 	「これは　空を飛べるモンスターに乗り
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TEREZIA");
	ShowMsg_("DEMO_507_MSG_070");
	KeyInputWait_();
	//===============================================	
	
	//===============================================
	//*テレジア
	// 	「行動範囲を広げて　冒険の足がかりとなる
	//-----------------------------------------------
	ShowMsg_("DEMO_507_MSG_080");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	WaitTask(task_cam);
	Wait_(20);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット5 扉ズームアップ
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");
	//===============================================
	//*テレジア
	// 	「戦闘によって　能力を測定いたします。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TEREZIA");
	ShowMsg_("DEMO_507_MSG_090");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	WaitTask(task_cam);	
	
	EndDemo(FADE_COLOR_BLACK);
}
