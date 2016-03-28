//=============================================
//
//		demo305[Bランク試験_2(扉前)]
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
	local regen;

// ▼モデル読込
	// キャラクター
	local player = GetPlayerId_();						// 主人公
	local model_yamisbari = ReadNpc_("m129_00");		// やみしばり
	local model_kusattasitai = ReadNpc_("m102_00");		// くさった死体
	local model_skeleton = ReadNpc_("m101_00");			// がいこつ
	local model_ghosti = ReadNpc_("m103_00");			// ゴースト
	// エフェクト
	LoadEffect_("ef742_01_div_mag_hoimi");				// 回復

// ▼配置
	// 主人公
	SetPointPos_(player, "player000");
	SetDir_(player, 270);
	// 敵パーティ
	local yamisbari = ArrangePointNpc_(model_yamisbari, "npc_yamisibari000");
	local kusattasitai = ArrangePointNpc_(model_kusattasitai, "npc_kusattashitai000");
	local skeleton = ArrangePointNpc_(model_skeleton, "npc_skeleton000");
	local ghosti = ArrangePointNpc_(model_ghosti, "npc__ghost000");
	SetScaleSilhouette(yamisbari, SCALE.S, SILHOUETTE_WIDTH.S);
	SetScaleSilhouette(kusattasitai, SCALE.N, SILHOUETTE_WIDTH.S);
	SetScaleSilhouette(skeleton, SCALE.N, SILHOUETTE_WIDTH.S);
	SetScaleSilhouette(ghosti, SCALE.S, SILHOUETTE_WIDTH.S);
	SetDir_(yamisbari, 110);
	SetDir_(kusattasitai, 430);
	SetDir_(skeleton, 445);
	SetDir_(ghosti, 95);

// ▼非常駐モーション読込
	local battlewait = ReadMotion_(player, "Player_battle_L");		// 戦闘待機L

// ▼カメラ設定
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	// ▼カット１＠～～～～～～～～～～～～～～～～～～～～～～
	StartDemo(FADE_COLOR_BLACK);
	
	//===============================================
	// ■テレジア
	// 「試験の前に　仲間モンスターの
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TEREZIA");
	ShowMsg_("DEMO_305_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	PlaySE_("SE_SHA_003");		//回復SE
	regen = SetSelectBoneEffect_("ef742_01_div_mag_hoimi", player, ATTACH_GLOBAL);		// 回復エフェクト
	
	//===============================================
	// ◇システムメッセージ
	// ＨＰと　ＭＰが　全回復した！
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_305_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	//===============================================
	// ■テレジア
	// 「では　これより　Ｂランクの
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TEREZIA");
	ShowMsg_("DEMO_305_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	SetMotion_(player, battlewait, 15);
	Wait_(30);
	
	// ▼カット２＠～～～～～～～～～～～～～～～～～～～～～～
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	WaitTask(task_cam);
	
	EncountEndDemo(ENCOUNT_NORMAL);
}