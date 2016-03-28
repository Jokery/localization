//=============================================
//
//		demo113[ガードマスター撃破]
//
//=============================================
function Update()
{
	
	//=====================================
	//プレイヤー設置
	//=====================================
	
	//IDの取得
	local player = GetPlayerId_();
	
	//設置
	SetPointPos_(player, "player000");
	
	//初期の向き
	SetDir_(player, 0);
	
	//表情
	SetFace_(player, "Face_grimace");
	
	//α値の手動設定
	SetManualCalcAlpha_(player, true);
	
	//初期のα値
	SetAlpha_(player, ALPHA_CLEAR);
	
	//=====================================
	//NPC設置
	//=====================================
	
	//リソースの読み込み
	local npc_gur = ReadNpc_("m121_00");									//ガードマスター
	local npc_ace = ReadNpc_("n002");										// エース
	local player_Player_nod = ReadMotion_(player, "Player_nod");			//主人公頷き
	local model_monitor00 = ReadGimmick_("o_A03_04");						//モニター
	
	//設置
	local res_gur = ArrangePointNpc_(npc_gur, "npc_guard000");
	local res_ace = ArrangePointNpc_(npc_ace, "npc_ace000");
	SetStepSe_(res_ace, SILENT_STEP_SE);									// 足音を無音にする
	
	//初期の向き
	SetDir_(res_gur, 180);
	SetDir_(res_ace, 0);
	
	//サイズ設定
	SetScaleSilhouette(res_gur, SCALE.M, SILHOUETTE_WIDTH.M);
	
	//α値の手動設定
	SetManualCalcAlpha_(res_ace, true);
	
	//初期のα値
	SetAlpha_(res_ace, ALPHA_CLEAR);
	
	//=====================================
	//モーションの読み込み
	//=====================================
	
	//ガードマスター
	local gur_death = ReadMotion_(res_gur, "m121_00_death");				//ガードマスター死す！
	
	//主人公
	local guard_player = ReadMotion_(player, "Player_guard_L");				//主人公身構える→振り向く;	//戦闘待機
	local turn_player = ReadMotion_(player, "Player_guard_turn");			//主人公身構える→振り向く
	local turnL_player = ReadMotion_(player, "Player_guard_turn_L");		//主人公身構える→振り向くL
	
	//エース
	local hyoko_ace = ReadMotion_(res_ace, "n002_show_face");				//エースドアから顔を出す
	local hyokoL_ace = ReadMotion_(res_ace, "n002_show_face_L");			//エースドアから顔を出すループ
	local sousa_ace = ReadMotion_(res_ace, "n002_operate_L");				//エース操作中
	local up_ace = ReadMotion_(res_ace, "n002_look_up");					//エース操作中→上向く
	local upL_ace = ReadMotion_(res_ace, "n002_look_up_L");					//エース上向く	
	local folde_ace = ReadMotion_(res_ace, "n002_arm_folde");				// エース腕を組む
	local foldeL_ace = ReadMotion_(res_ace, "n002_arm_folde_L");			// エース腕を組むL
	local think_ace = ReadMotion_(res_ace, "n002_think");					// エース腕を組む
	local thinkL_ace = ReadMotion_(res_ace, "n002_think_L");				// エース腕を組むL
	local ace_runL = ReadMotion_(res_ace, "n001_run_L");					// エース走る
	local handup_ace = ReadMotion_(res_ace, "n002_hand_up");				// エース手を挙げる
	local handupL_ace = ReadMotion_(res_ace, "n002_hand_up_L");				// エース手を挙げるL
	local talk_joy__ace = ReadMotion_(res_ace, "n002_talk_joy_L");			// エース会話(嬉しそう)
	
	//初期のモーション
	SetMotion_(player, guard_player, BLEND_M);								//◆主人公身構える
	SetMotion_(res_gur, gur_death, BLEND_M);								//◆ガードマスター死亡
	
	//=====================================
	//ギミック設置
	//=====================================
	
	local model_red_screen = ReadGimmick_("o_A03_06");
	local model_main_screen = ReadGimmick_("o_A03_04");
	local red_screen = ArrangeGimmick_("o_A03_06", model_red_screen, false);
	local main_screen = ArrangePointGimmick_("o_A03_04", model_main_screen, "obj_screen000");
	SetMotion_(red_screen, MOT_GIMMICK_0, BLEND_N);							// 点滅ON

	local gimmick001 = ReadGimmick_("o_A03_00");
	local res_gimmick001 = ArrangePointGimmick_("o_A03_00", gimmick001, "obj_door001");
	SetMotion_(res_gimmick001, MOT_GIMMICK_2, BLEND_N);						// 電子ドア 主人公が入ってきたところ(開いている状態);
	
	//=====================================
	//エフェクトの読み込み
	//=====================================
	LoadEffect_("ef723_01_nat_explosion_n01");
	LoadEffect_("ef400_15_explosion_s_house");
	LoadEffect_("ef721_03_nat_smoke_n03");
	LoadEffect_("ef900_00_test_smoke");
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット1
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	
	SetAlpha_(res_ace, 0);
	
	local task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");	//ガードマスターを撮影用
	
	//=====================================
	//フェードイン
	//=====================================
	PlaySE_("SE_DEM_044");													//ガードマスター爆発

	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);
	WaitFade_();
	
	Wait_(50);																//◆死亡エフェクトが終わるくらいまでウェイトを調整
	
	local smoke_gur = SetSelectBoneEffect_("ef400_15_explosion_s_house", res_gur, ATTACH_GLOBAL);
	SetEffectScale_(smoke_gur, 1.0);
	Wait_(15);
	StartEarthQuake_(18, 3, 2);
	local death_gur = SetSelectBoneEffect_("ef723_01_nat_explosion_n01", res_gur, ATTACH_GLOBAL);
	SetEffectScale_(death_gur, 2.0);
	
	for(local i = 0; i <= 10; i++)
	{
		SetAlpha_(res_gur, ALPHA_EXIST - (i * 0.1));
		Wait_(1);
	}
	
	Wait_(8);
	
	StartEarthQuake_(10, 3, 1);
	
	Wait_(80);
	
	SetAlpha_(player, ALPHA_EXIST);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット2
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	DeleteTask_(task_cam);
	
	SetPointCameraEye_("cameye001");										//主人公煙ガード
	SetPointCameraTarget_("camtgt001");
	
	local smoke_player = SetSelectBoneEffect_("ef721_03_nat_smoke_n03", player, ATTACH_GLOBAL);
	
	Wait_(30);
	
	//エース　ドアからひょこっ
	SetAlpha_(res_ace, ALPHA_EXIST);
	SetMotion_(res_ace, hyoko_ace, BLEND_N);
	Wait_(5);
	PlaySE_("SE_FLD_011");													//■SE:エース足音
	WaitMotion(res_ace);
	SetMotion_(res_ace, hyokoL_ace, BLEND_M);
	
	//エース「ふうう……ビビらせやがって！
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_113_MSG_010");
	KeyInputWait_();
	CloseMsgWnd_();
	
	SetFace_(player, "Face_eyes_close");
	
	SetMotion_(player, turn_player, BLEND_M);								//主人公身構える→振り向く
	WaitMotion(player);
	SetMotion_(player, turnL_player, BLEND_M);
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット3
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	SetPointCameraEye_("cameye003");										//エースアップ用
	SetPointCameraTarget_("camtgt003");
	
	//エース「でも　これで邪魔をされずに
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_113_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■カット4
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	local task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");	
	
	SetDir_(res_ace, 90);
	SetMotion_(res_ace, ace_runL, BLEND_M);
	PlaySE_("SE_FLD_011");									//■SE:エース足音
	Wait_(3);
	local task_ace = Task_MoveForward_(res_ace, 1.0, true);
	Wait_(4);
	DeleteTask_(task_ace);
	SetDir_(res_ace, 0);
	local task = Task_MoveForward_(res_ace, 1.0, true);
	PlaySE_("SE_FLD_011");									//■SE:エース足音
	Wait_(8);
	PlaySE_("SE_FLD_011");									//■SE:エース足音
	SetMotion_(res_ace, MOT_WAIT, BLEND_XL);				//エース待機	
	Wait_(9);
	
	PosDebug(res_ace);										//エースの走ってきた位置の座標取得

	DeleteTask_(task);
	
	local task = Task_RotateToPlayerSetMotion_(res_ace, 8.0, MOT_WALK, MOT_WAIT);		//エース主人公の方を向く
	PlaySE_("SE_FLD_011");									//■SE:エース足音
	WaitTask(task);

	Wait_(10);

	SetMotion_(res_ace, talk_joy__ace, BLEND_L);			//エース会話(嬉しそう)

	//エース「<name_player/>！　早く
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_113_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	
	SetMotion_(res_ace, MOT_WAIT, BLEND_L);					//エース待機
	
	Wait_(20);

	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	//■デモ終了
	//〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	EndDemo(FADE_COLOR_BLACK);
	
}