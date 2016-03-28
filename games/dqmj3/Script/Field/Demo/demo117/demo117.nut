//=============================================
//
//		demo117[動く大地_1(操作)]
//
//=============================================
function Update()
{
	//=====================================
	//ローカル変数の設定
	//=====================================
	local task_cam;
	
	//=====================================
	//プレイヤー設置
	//=====================================
	
	//IDの取得
	local player = GetPlayerId_();
	
	//設置
	SetPointPos_(player, "player000");
	
	//初期の向き
	SetDir_(player, -70);
	
	//初期のモーション
	SetMotion_(player, MOT_WAIT, 15);
	
	//α値の手動設定
	SetManualCalcAlpha_(player, true);
	
	//初期のα値
	SetAlpha_(player, 1.0);
	
	//=====================================
	//NPC設置
	//=====================================
	
	//リソースの読み込み
	local npc_ace = ReadNpc_("n002");		// エース
	
	//設置
	local res_ace = ArrangePointNpc_(npc_ace, "npc_ace000");
	
	//初期の向き
	SetDir_(res_ace, -90);
	
	//α値の手動設定
	SetManualCalcAlpha_(res_ace, true);
	
	//初期のα値
	SetAlpha_(res_ace, 1.0);
	
	LoadEffect_("ef712_13_emo_sweat01")		;								// 汗エフェクト読み込み
	
	//=====================================
	//モーションの読み込み
	//=====================================
	local pl_caution01_L = ReadMotion_(player, "Player_caution01_L");		// 主人公　警戒L
	local ac_impatience_L = ReadMotion_(res_ace, "n002_impatience_L");		// エース　焦るL
	
	//初期のモーション
	SetMotion_(res_ace, ac_impatience_L, BLEND_M);
	
	//=====================================
	//ギミック設置
	//=====================================
	local model_red_screen = ReadGimmick_("o_A03_05");
	local red_screen = ArrangePointGimmick_("o_A03_05", model_red_screen, "obj_screen000");
	SetMotion_(red_screen, MOT_GIMMICK_0, BLEND_N);							// 点滅ON
		
	//管理室モニター
	local model_monitor = ReadGimmick_("o_A03_04");
	local monitor = ArrangePointGimmick_("o_A03_04", model_monitor, "obj_monitor000");
	SetMotion_(monitor, MOT_GIMMICK_0, BLEND_N);
	
	//ディスプレイ
	local model_monitor = ReadGimmick_("o_A03_09");
	local monitor = ArrangePointGimmick_("o_A03_09", model_monitor, "obj_monitor001");
	SetMotion_(monitor, MOT_GIMMICK_0, BLEND_N);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット1
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");
	
	//=====================================
	//フェードイン
	//=====================================
	StartDemo(FADE_COLOR_BLACK);
	
	//エース焦る
	SetMotion_(player, pl_caution01_L, BLEND_M);
	SetMotion_(res_ace, ac_impatience_L, BLEND_M);
	local effectId = SetSelectBoneEffect_("ef712_13_emo_sweat01", res_ace, ATTACH_EFFECT2);		// 汗エフェクト

	PlayLoopSE_("SE_DEM_013");
	StartEarthQuake_(-1, 3, 1);
	Wait_(6);
	StopEarthQuake_();	
	StartEarthQuake_(-1, 3, 0.8);
	Wait_(15);
	StopEarthQuake_();	
	StartEarthQuake_(-1, 3, 0.4);

	//=====================================
	//エース「おおっ　動き出したぜ！
	//=====================================
	OpenMsgWnd_();
	
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_117_MSG_010");
	KeyInputWait_();
	
	CloseMsgWnd_();
	
	StopEarthQuake_();
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");	
	
	Wait_(120);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■デモ終了
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	StopLoopSE_(30);
	EndDemo(FADE_COLOR_BLACK);
}