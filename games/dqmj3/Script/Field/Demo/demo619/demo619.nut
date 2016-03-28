//=============================================
//
//		demo619[最後のパワー_2(扉前)]
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

// ▼リソース読込
	// キャラクター
	local player = GetPlayerId_();								// 主人公
	local model_seto = ReadNpc_("m017_03");						// セト
	local model_jenelal = ReadNpc_("m017_04");					// あかつき将軍
	local model_sumaillhtred = ReadNpc_("m019_00");				// スマイルリザード
	local model_mizutamadoragon = ReadNpc_("m019_01");			// みずたまドラゴン
	// エフェクト
	LoadEffect_("ef742_01_div_mag_hoimi");						// 回復

// ▼配置
	// 主人公
	SetPointPos_(player, "player000");
	
	// 敵パーティ
	local seto = ArrangePointNpc_(model_seto, "npc_seto000");
	local jenelal = ArrangePointNpc_(model_jenelal, "npc_jenelal000");
	local sumaillhtred = ArrangePointNpc_(model_sumaillhtred, "npc_sumaillhtred000");
	local mizutamadoragon = ArrangePointNpc_(model_mizutamadoragon, "npc_mizutamadoragon000");
	SetScaleSilhouette(seto, SCALE.N, SILHOUETTE_WIDTH.N);
	SetScaleSilhouette(jenelal, SCALE.N, SILHOUETTE_WIDTH.N);
	SetScaleSilhouette(sumaillhtred, SCALE.S, SILHOUETTE_WIDTH.S);
	SetScaleSilhouette(mizutamadoragon, SCALE.S, SILHOUETTE_WIDTH.S);

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
	ShowMsg_("DEMO_619_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	PlaySE_("SE_SHA_003");		// 回復SE
	regen = SetSelectBoneEffect_("ef742_01_div_mag_hoimi", player, ATTACH_GLOBAL);		// 回復エフェクト
	
	//===============================================
	// *システムメッセージ
	// ＨＰと　ＭＰが　全回復した！
	//-----------------------------------------------
	OpenMsgWnd_();
	ShowMsg_("DEMO_619_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//===============================================
	
	//===============================================
	// ■テレジア
	// 「では　これより　Ｓランクの
	//-----------------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TEREZIA");
	ShowMsg_("DEMO_619_MSG_030");
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