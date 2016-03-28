//=============================================
//
//		demo311[Bランクライセンス獲得]
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
	local efc_player,efc_licence;
	
// ▼リソース読込
	// キャラクター
	local player = GetPlayerId_();										// 主人公
	
	//エフェクトの読み込み
	LoadEffect_("ef732_06_get_license");								//ライセンス獲得エフェクト
	LoadEffect_("ef712_10_emo_surprise01");								// 「！」

// ▼配置
	// 主人公
	SetPointPos_(player, "player000");

// ▼非常駐モーション読込
	local pl_lookup = ReadMotion_(player, "Player_look_up_L");			//上を向いて待機
	
	local pl_grip1 = ReadMotion_(player, "Player_r_hand_hold01L");		//右手を握る 上
	local pl_grip2 = ReadMotion_(player, "Player_r_hand_hold02L");		//右手を握る 下

	//初期のモーション
	SetMotion_(player, pl_lookup, BLEND_M);								//上を向いて待機
	
// ▼カメラ設定
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");	

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット1
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓	
	WaitTask(task_cam);
	//===============================================
	//■テレジア
	//「おつかれさまでした。
	//　試験は　以上で　終了となります。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TEREZIA");
	ShowMsg_("DEMO_311_MSG_010");
	KeyInputWait_();
	//===============================================
		
	//===============================================
	//■テレジア
	//「おめでとうございます。
	//　あなたは　Ｂランク試験に　合格されました。
	//-----------------------------------------------
	ShowMsg_("DEMO_311_MSG_020");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	//■テレジア
	//「当施設の規約に　基づき
	//　Ｂ級ライセンスを　発行いたします。
	//-----------------------------------------------
	ShowMsg_("DEMO_311_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	Wait_(30);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット2 主人公ズーム
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓	
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	PlaySE_("SE_DEM_028");
	efc_licence = SetSelectBoneEffect_("ef732_06_get_license", player, ATTACH_GLOBAL);		//ライセンス獲得エフェクト
	
	SetMotion_(player, MOT_WAIT, BLEND_N);													//待機
	Wait_(10);
	SetMotion_(player, pl_grip1, BLEND_XL);													//右手を握る
	Wait_(10);
	
	Wait_(80);
	
	PlayMe_("ME_010");		//ファンファーレ

	//===============================================
	//*システムメッセージ
	//<name_player/>は
	//Ｂ級ライセンスを　手に入れた！
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_311_MSG_040");
	WaitMe_();
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================

	//===============================================
	//■テレジア
	//「これより　水に潜れるモンスターに　乗って
	//　水中を進む　水中ライドが　使用可能です。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TEREZIA");
	ShowMsg_("DEMO_311_MSG_050");
	Wait_(10);
	SetMotion_(player, pl_grip2, BLEND_XL);													//右手を握る
	
	KeyInputWait_();
	//=================================================
	//■テレジア
	//「体験式の　チュートリアルを　ご用意しました。
	//　コロシアムを出て　ご参加ください。
	//-----------------------------------------------
	
	ShowMsg_("DEMO_311_MSG_060");
	KeyInputWait_();
	CloseMsgWnd_();	

	WaitTask(task_cam);
	
	Wait_(10);
	
	EndDemo(FADE_COLOR_BLACK);
}
