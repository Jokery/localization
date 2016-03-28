//=============================================
//
//		demo018[ボーショック登場]
//
//=============================================

function Update()
{
// ▼変数定義
	local task_cam, task_player;
	local efc_cam, efc_nocho000, efc_nocho100, efc_nocho200, efc_nocho300, efc_king, efc_bor000, efc_bor001;

// ▼フラグ設定
	local bit_ruler = GetEventFlg_("BFG_RULER_ADD_001");			// Bit_201 ルーラ追加フラグ

// ▼リソース読込
	local player = GetPlayerId_();
	local model_bor = ReadNpc_("m207_00");			// ボーショック
	local model_big = ReadNpc_("m048_00");			// ビッグハット
	local model_king = ReadNpc_("n003");			// キング
	local model_nochoman = ReadNpc_("n000");		// ノチョーラ♂
	local model_nochogirl = ReadNpc_("n004");		// ノチョーラ♀
	
	local model_ruler = ReadGimmick_("o_com_08");	// ルーラポイント
	local model_cage = ReadGimmick_("o_H00_03");
	
	LoadEffect_("ef712_04_emo_joy01");
	LoadEffect_("ef730_01_oth_dark_aura01");
	LoadEffect_("ef712_10_emo_surprise01");
	LoadEffect_("ef721_01_nat_smoke_n01");
	LoadEffect_("ef733_01_sym_shuchusen01");
	
// ▼配置
	//ギミック
	local cage = ArrangePointGimmick_("o_H00_03", model_cage, "obj_cage000");
	// ルーラポイント
	local ruler = ArrangePointGimmick_("o_com_08", model_ruler, "obj_ruler000");
	// ▽ルーラポイントが既に起動していた場合
	if (bit_ruler) { SetMotion_(ruler, MOT_GIMMICK_2, BLEND_N); }

	//プレイヤー
	SetPointPos_(player, "player000");									//主人公
	SetDir_(player, 320);
	SetFace_(player, "Face_eyes_close");
	SetStepSe_(player, SILENT_STEP_SE);					// 足音を無音にする

	//敵キャラクター
	local bor = ArrangePointNpc_(model_bor, "npc_bor000");				// ボーショック
	SetScaleSilhouette(bor, SCALE.M, SILHOUETTE_WIDTH.M);
	SetDir_(bor, 115);
	
	local big000 = ArrangePointNpc_(model_big, "npc_big000");			// ビッグハットA
	SetScaleSilhouette(big000, SCALE.S, SILHOUETTE_WIDTH.S);
	SetDir_(big000, 125);
	
	local big100 = ArrangePointNpc_(model_big, "npc_big100");			// ビッグハットB
	SetScaleSilhouette(big100, SCALE.S, SILHOUETTE_WIDTH.S);
	SetDir_(big100, 110);
	
	//ノチョーラ
	local king = ArrangePointNpc_(model_king, "npc_king000");			// キング
	SetDir_(king, 280);
	
	local nocho000 = ArrangePointNpc_(model_nochoman, "npc_nocho000");	// ノチョーラ♂
	SetDir_(nocho000, 260);
	
	local nocho100 = ArrangePointNpc_(model_nochoman, "npc_nocho100");	// ノチョーラ♂
	SetDir_(nocho100, 290);
	
	local nocho200 = ArrangePointNpc_(model_nochogirl, "npc_nocho200");	// ノチョーラ♀
	SetDir_(nocho200, 260);
	
	local nocho300 = ArrangePointNpc_(model_nochogirl, "npc_nocho300");	// ノチョーラ♀
	SetDir_(nocho300, 290);
	
// ▼非常駐モーション読込
	local player_cage_look_L = ReadMotion_(player, "Player_cage_look_L");	// 主人公上を向く
	local player_cage_turn = ReadMotion_(player, "Player_cage_turn");		// 主人公上を向く→振り向き
	local player_cage_turn_L = ReadMotion_(player, "Player_cage_turn_L");	// 主人公振り向き
	local player_run_battle = ReadMotion_(player, "Player_run_battle");		// 戦闘待機
	local player_battle01_L = ReadMotion_(player, "Player_battle01_L");		// 主人公戦闘待機（顔上向き）

	local nocho000_rejoice_L = ReadMotion_(nocho000, "n000_rejoice_L");		// ノチョーラ喜び
	local nocho100_rejoice_L = ReadMotion_(nocho100, "n000_rejoice_L");		// ノチョーラ喜び
	local nocho200_rejoice_L = ReadMotion_(nocho200, "n000_rejoice_L");		// ノチョーラ喜び
	local nocho300_rejoice_L = ReadMotion_(nocho300, "n000_rejoice_L");		// ノチョーラ喜び
	local king_rejoice_L = ReadMotion_(king, "n003_rejoice_L");				// キング喜び
	local nocho000_shock = ReadMotion_(nocho000, "n000_shock");				// ノチョーラ喜び→怯え
	local nocho100_shock = ReadMotion_(nocho100, "n000_shock");				// ノチョーラ喜び→怯え
	local nocho200_shock = ReadMotion_(nocho200, "n000_shock");				// ノチョーラ喜び→怯え
	local nocho300_shock = ReadMotion_(nocho300, "n000_shock");				// ノチョーラ喜び→怯え
	local king_shock = ReadMotion_(king, "n003_shock");						// キング喜び→怯え
	local nocho000_shock_L = ReadMotion_(nocho000, "n000_shock_L");			// ノチョーラ怯え
	local nocho100_shock_L = ReadMotion_(nocho100, "n000_shock_L");			// ノチョーラ怯え
	local nocho200_shock_L = ReadMotion_(nocho200, "n000_shock_L");			// ノチョーラ怯え
	local nocho300_shock_L = ReadMotion_(nocho300, "n000_shock_L");			// ノチョーラ怯え
	local king_shock_L = ReadMotion_(king, "n003_shock_L");					// キング怯え
	
	local bor_talk_L = ReadMotion_(bor, "m202_00_talk_L");					// ボーショック会話
	local bor_attack = ReadMotion_(bor, "m202_00_attack");					// ボーショック会話→襲い掛かる
	local bor_one_step = ReadMotion_(bor, "m202_00_one_step");				// ボーショック一歩前に出る
	
// ▼初期モーション
	SetMotion_(player, player_cage_look_L, BLEND_N);
	SetMotion_(bor, MOT_WAIT, BLEND_N);
	SetMotion_(king, king_rejoice_L, BLEND_N);
	SetMotion_(nocho000, nocho000_rejoice_L, BLEND_N);
	Wait_(8);
	SetMotion_(nocho100, nocho100_rejoice_L, BLEND_N);
	Wait_(3);
	SetMotion_(nocho200, nocho200_rejoice_L, BLEND_N);
	Wait_(2);
	SetMotion_(nocho300, nocho300_rejoice_L, BLEND_N);
	
	efc_nocho000 = SetSelectBoneEffect_("ef712_04_emo_joy01", nocho000, ATTACH_EFFECT2);
	efc_nocho100 = SetSelectBoneEffect_("ef712_04_emo_joy01", nocho100, ATTACH_EFFECT2);
	efc_nocho200 = SetSelectBoneEffect_("ef712_04_emo_joy01", nocho200, ATTACH_EFFECT2);
	efc_nocho300 = SetSelectBoneEffect_("ef712_04_emo_joy01", nocho300, ATTACH_EFFECT2);
	efc_king = SetSelectBoneEffect_("ef712_04_emo_joy01", king, ATTACH_EFFECT1);
	SetEffectScale_(efc_king, 2.0);
	
	efc_bor000 = SetBoneEffect_("ef730_01_oth_dark_aura01", bor);
	
// ▼カメラ設定
	ReadWaitingLod("cameye000", "camtgt000");								//Lod読み込み
	
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

//-------------------------------------------------------------------------
//		はじまりはじまり
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	OpenMsgWnd_();
	//ノチョーラ「助けが来たちょー！
	ShowMsg_("DEMO_018_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	
	DeleteEffect_(efc_king);
	DeleteEffect_(efc_nocho000);
	DeleteEffect_(efc_nocho100);
	DeleteEffect_(efc_nocho200);
	DeleteEffect_(efc_nocho300);
	
	PlaySE_("SE_DEM_014");
	StopBgm_(BGM_STOP_DEF);
	StartDecayEarthQuake_(20, 3, 1)

	Wait_(25);	
	
	efc_nocho000 = SetSelectBoneEffect_("ef712_10_emo_surprise01", nocho000, ATTACH_EFFECT1);		// 「！」
	efc_nocho100 = SetSelectBoneEffect_("ef712_10_emo_surprise01", nocho100, ATTACH_EFFECT1);		// 「！」
	efc_nocho200 = SetSelectBoneEffect_("ef712_10_emo_surprise01", nocho200, ATTACH_EFFECT1);		// 「！」
	efc_nocho300 = SetSelectBoneEffect_("ef712_10_emo_surprise01", nocho300, ATTACH_EFFECT1);		// 「！」
	PlaySE_("SE_DEM_053");		// 「ピンッ！」
	
	SetMotion_(king, king_shock, BLEND_M);
	SetMotion_(nocho000, nocho000_shock, BLEND_M);
	SetMotion_(nocho100, nocho100_shock, BLEND_M);
	SetMotion_(nocho200, nocho200_shock, BLEND_M);
	SetMotion_(nocho300, nocho300_shock, BLEND_M);
	Wait_(20);
	
	SetMotion_(king, king_shock_L, BLEND_M);
	SetMotion_(nocho000, nocho000_shock_L, BLEND_M);
	SetMotion_(nocho100, nocho100_shock_L, BLEND_M);
	SetMotion_(nocho200, nocho200_shock_L, BLEND_M);
	SetMotion_(nocho300, nocho300_shock_L, BLEND_M);
	
	OpenMsgWnd_();
	//ノチョーラ「ひっ・・・・！
	ShowMsg_("DEMO_018_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	
	PlaySE_("SE_DEM_014");
	
	StartDecayEarthQuake_(25, 3, 1)
	
	Wait_(30);
	
	SetDir_(player, 270);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット2
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	
	SetMotion_(player, player_cage_turn, BLEND_M);
	WaitMotion(player);
	SetMotion_(player, player_cage_turn_L, BLEND_M);
	
	Wait_(20);
	
	OpenMsgWnd_();
	//ボーショック「何してるだ　おめぇたち！
	ShowMsg_("DEMO_018_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット3
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
//	PlaySE_("SE_DEM_001");		// BGMと同時に再生されると、すぎやま先生に怒られるためC.O
	PlayBgm_("BGM_007");
//	PlaySE_("SE_DEM_026");										// ■SE:集中線(BGMと同時に再生されると、すぎやま先生に怒られるためC.O)
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", 100);
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	
	Wait_(10);
	
	OpenMsgWnd_();
	//「ボ……ボーショック！
	ShowMsg_("DEMO_018_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	
	DeleteEffectEmitter_(efc_cam);	
	SetMotion_(bor, bor_talk_L, BLEND_M);
	
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BORSHOCK");
	//「何やら　カゴが　騒がしいと思えば……
	ShowMsg_("DEMO_018_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	
	SetMotion_(bor, MOT_WAIT, BLEND_M);
	
	DeleteTask_(task_cam);

	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット4
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	local task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	local task_step = Task_ChangeStepSe(player, "SE_FLD_017", 7);		//■SE:PC移動　木材
	
	Wait_(10);
	SetDir_(player, 289);
	SetMotion_(player, MOT_RUN, 15);
	task_player = Task_MoveForward_(player, 1.0, true);					//主　走ってカメライン
	Wait_(20);
	
	SetMotion_(player, player_run_battle, 15);
	Wait_(17);
	DeleteTask_(task_player);
	SetMotion_(player, player_battle01_L, 15);
	SetDir_(player, 285);
	DeleteTaskStepSe(player, task_step);
	Wait_(5);
	PlaySE_("SE_FLD_017");												//■SE:PC移動　木材
	
	SetMotion_(bor, bor_talk_L, BLEND_M);
	
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BORSHOCK");
	//「そのリアクター……おめぇ　レジスタンスだな？
	ShowMsg_("DEMO_018_MSG_060");
	KeyInputWait_();
	//「すっかり　片付けたと　思ってたんだがよ。
	ShowMsg_("DEMO_018_MSG_070");
	KeyInputWait_();
	CloseMsgWnd_();
	
	DeleteTask_(task_cam);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット5
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");
	
	SetPos_(player, Vec3(473.731, 346.381, 958.876+1.0));
	
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BORSHOCK");
	//「困ったもんだべ。歯に　引っかかった
	ShowMsg_("DEMO_018_MSG_080");
	KeyInputWait_();
	//「それに　オラの目を盗んで　そいつらを
	ShowMsg_("DEMO_018_MSG_090");
	KeyInputWait_();
	CloseMsgWnd_();

	DeleteTask_(task_cam);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット6
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetAlpha_(player, ALPHA_CLEAR);			// 主人公非表示
	
	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");
	
	SetPointPos_(big000, "npc_big001");
	SetPointPos_(big100, "npc_big101");
	SetDir_(big000, 125);
	SetDir_(big100, 110);
	
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BORSHOCK");
	//「しかーし！　調子に乗るのは　ここまでだべ！
	ShowMsg_("DEMO_018_MSG_100");
	KeyInputWait_();
	//「レジスタンスどもは　この　ボーショックが
	ShowMsg_("DEMO_018_MSG_110");
	KeyInputWait_();
	CloseMsgWnd_();
	
	Wait_(10);
	
	WaitTask(task_cam);
	
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", 100);
	
	SetDir_(bor, 116);
	
	StopBgm_(BGM_STOP_DEF);
	SetMotion_(bor, bor_attack, BLEND_M);	// 戦闘開始モーション候補１
	PlaySE_("SE_DEM_025");					// ■SE:ボーショックのモーションSE
	Wait_(13);
	
	StartEarthQuake_(20, 5, 2);
	
	DeleteTask_(task_cam);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■デモ終了
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	
	EncountEndDemo(ENCOUNT_BOSS);
	
}