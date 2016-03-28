//=============================================
//
//		demo308[Bランク試験_5(2回戦勝利)]
//
//=============================================
function Update()
{
	// BGM設定
	StopBgm_(0);
	
	//=====================================
	//ローカル変数の設定
	//=====================================
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット１
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	
	
	//=====================================
	//カメラ設定
	//=====================================
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	
	//=====================================
	//プレイヤー設置
	//=====================================
	
	//IDの取得
	local player = GetPlayerId_();
	
	//設置
	SetPointPos_(player, "player000");
	
	//初期の向き
//	SetDir_(player, -90);
	
	//モーション読込
	local battlewait = ReadMotion_(player, "Player_battle_L");
	
	//初期のモーション
	SetMotion_(player, battlewait, BLEND_N);
	
	//=====================================
	//NPC設置
	//=====================================
	
	//リソースの読み込み
	local model_octreach = ReadNpc_("m136_00");			// オクトリーチ
	local model_bigsquid = ReadNpc_("m138_00");			// 大王イカ
	local model_chargeish = ReadNpc_("m140_00");		// とつげきうお
	
	
	//設置
	local octreach = ArrangePointNpc_(model_octreach, "npc_octreach");
	local bigsquid = ArrangePointNpc_(model_bigsquid, "npc_bigsquid");
	local chargeish = ArrangePointNpc_(model_chargeish, "npc_chargeish");
	
	//サイズ設定
	SetScaleSilhouette(octreach, SCALE.S, SILHOUETTE_WIDTH.S);
	SetScaleSilhouette(bigsquid, SCALE.M, SILHOUETTE_WIDTH.M);
	SetScaleSilhouette(chargeish, SCALE.N, SILHOUETTE_WIDTH.N);
	
	//=====================================
	//モーションの読み込み
	//=====================================
	
	
	//=====================================
	//フェードイン
	//=====================================
	StartDemo(FADE_COLOR_BLACK);
	
	//===============================================
	//■テレジア
	//「２戦目の勝利　おめでとうございます。
	//　いよいよ　次で　最後となります。
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TEREZIA");
	ShowMsg_("DEMO_308_MSG_010");
	KeyInputWait_();
	//===============================================
	
	//===============================================
	//■テレジア
	//「油断されることなく
	//　最後まで　ご健闘くださいませ。
	//-----------------------------------------------
	ShowMsg_("DEMO_308_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット2
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	
	local task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");		//◆戦闘用のカメラが丸コピできていないので、使えるようになったら変更してください。
	
	Wait_(80);
	
	Wait_(2);
	WaitTask(task_cam);
	DeleteTask_(task_cam);
	
	EncountEndDemo(ENCOUNT_NORMAL);
}