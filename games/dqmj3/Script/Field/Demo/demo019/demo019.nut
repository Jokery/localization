//=============================================
//
//		demo019[ボーショック再戦]
//
//=============================================

function Update()
{

// ▼変数定義
	local task_cam, task_player;
	local efc_cam, efc_bor;

// ▼リソース読込
	local model_cage = ReadGimmick_("o_H00_03");
	
	local player = GetPlayerId_();
	local model_bor = ReadNpc_("m207_00");			// ボーショック
	local model_big = ReadNpc_("m048_00");			// ビッグハット
	local model_king = ReadNpc_("n003");			// キング
	local model_nochoman = ReadNpc_("n000");		// ノチョーラ♂
	local model_nochogirl = ReadNpc_("n004");		// ノチョーラ♀
	
	LoadEffect_("ef730_01_oth_dark_aura01");
	LoadEffect_("ef733_01_sym_shuchusen01");

// ▼配置
	local cage = ArrangePointGimmick_("o_H00_03", model_cage, "obj_cage000");

	SetPointPos_(player, "player000");
	SetFace_(player, "Face_eyes_close");
	SetDirToPoint_(player, "npc_bor000");
	
	local bor = ArrangePointNpc_(model_bor, "npc_bor000");
	SetScaleSilhouette(bor, SCALE.M, SILHOUETTE_WIDTH.M);
	SetDir_(bor, 291);
	
	local big000 = ArrangePointNpc_(model_big, "npc_big000");			// ビッグハットA
	SetScaleSilhouette(big000, SCALE.S, SILHOUETTE_WIDTH.S);
	SetDir_(big000, 290);
	
	local big100 = ArrangePointNpc_(model_big, "npc_big100");			// ビッグハットB
	SetScaleSilhouette(big100, SCALE.S, SILHOUETTE_WIDTH.S);
	SetDir_(big100, 290);
	
	local king = ArrangePointNpc_(model_king, "npc_king000");
	SetDir_(king, 280);
	
	local nocho000 = ArrangePointNpc_(model_nochoman, "npc_nocho000");
	SetDir_(nocho000, 260);
	
	local nocho100 = ArrangePointNpc_(model_nochoman, "npc_nocho100");
	SetDir_(nocho100, 290);
	
	local nocho200 = ArrangePointNpc_(model_nochogirl, "npc_nocho200");
	SetDir_(nocho200, 260);
	
	local nocho300 = ArrangePointNpc_(model_nochogirl, "npc_nocho300");
	SetDir_(nocho300, 290);

// ▼非常駐モーション読込
	local player_battle_L = ReadMotion_(player, "Player_battle_L");	// 戦闘待機
	local bor_talk_L = ReadMotion_(bor, "m202_00_talk_L");			// ボーショック会話
	local bor_attack = ReadMotion_(bor, "m202_00_attack");			// ボーショック会話→襲い掛かる
	local nocho000_shock_L = ReadMotion_(nocho000, "n000_shock_L");	// ノチョーラ怯え
	local nocho100_shock_L = ReadMotion_(nocho100, "n000_shock_L");	// ノチョーラ怯え
	local nocho200_shock_L = ReadMotion_(nocho200, "n000_shock_L");	// ノチョーラ怯え
	local nocho300_shock_L = ReadMotion_(nocho300, "n000_shock_L");	// ノチョーラ怯え
	local king_shock_L = ReadMotion_(king, "n003_shock_L");			// キング怯え

// ▼初期モーション
	SetMotion_(player, MOT_RUN, 15);
	SetMotion_(bor, bor_talk_L, BLEND_N);
	SetMotion_(king, king_shock_L, BLEND_N);
	SetMotion_(nocho000, nocho000_shock_L, BLEND_N);
	SetMotion_(nocho100, nocho100_shock_L, BLEND_N);
	SetMotion_(nocho200, nocho200_shock_L, BLEND_N);
	SetMotion_(nocho300, nocho300_shock_L, BLEND_N);
	
	efc_bor = SetBoneEffect_("ef730_01_oth_dark_aura01", bor);

// ▼カメラ設定
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	task_player = Task_MoveForward_(player, 1.0, true);
	
	StartDemo(FADE_COLOR_BLACK);
	
	Wait_(7);
	
	DeleteTask_(task_player);
	
	SetMotion_(player, player_battle_L, BLEND_M);
	
	Wait_(60);
	
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BORSHOCK");
	ShowMsg_("DEMO_019_MSG_010");
	KeyInputWait_();
	ShowMsg_("DEMO_019_MSG_020");
	KeyInputWait_();
	ShowMsg_("DEMO_019_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();

	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", 100);
	
	SetDir_(bor, 295.5);
	
	SetMotion_(bor, bor_attack, BLEND_M);		// 戦闘開始モーション候補１
	PlaySE_("SE_DEM_025");						// ■SE:ボーショックのモーションSE
	
	Wait_(10);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■デモ終了
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	
	EncountEndDemo(ENCOUNT_BOSS);
	
}