//=============================================
//
//		demo110[J[hL[AðT¹_1]
//
//=============================================
function Update()
{
	//=====================================
	//[JÏÌÝè
	//=====================================
	local task_cam, task_player, task_ace;
	local task_ace_step;
	
	//=====================================
	//M~bNÝu
	//=====================================
	local model_eledoor = ReadGimmick_("o_A03_01");																// Gx[^[à
	local model_door03 = ReadGimmick_("o_A03_00");																// dqhA
	local eledoor = ArrangePointGimmick_("o_A03_01", model_eledoor, "obj_elevator001");							// Gx[^[à
	local door03 = ArrangePointGimmick_("o_A03_00", model_door03, "obj_door000");								// dqhA
	
	//=====================================
	//vC[Ýu
	//=====================================
	
	//IDÌæ¾
	local player = GetPlayerId_();
	
	//Ýu
	SetPointPos_(player, "player000");
	
	//úÌü«
	SetDir_(player, 90);
	
	//[VÌÇÝÝ
	local battlewait = ReadMotion_(player, "Player_battle_L");					//í¬Ò@
	local look_walk = ReadMotion_(player, "Player_look_walk_L");				//Là«
	local pl_look_around_L = ReadMotion_(player, "Player_look_around_L");		// ålö@LLL
	local pl_cage_turn_L = ReadMotion_(player, "Player_cage_turn_L");			// ålö@Uèü­
	local pl_look_left_L = ReadMotion_(player, "Player_look_left_L");			// ålö@çð­µ¶ü¯éL
	
	//úÌ[V
	SetMotion_(player, MOT_WAIT, 15);
	
	//¿lÌè®Ýè
	SetManualCalcAlpha_(player, true);
	
	//úÌ¿l
	SetAlpha_(player, 1.0);
	
	//=====================================
	//NPCÝu
	//=====================================
	
	//\[XÌÇÝÝ
	local npc_kil = ReadNpc_("m120_00");										// ^n^[
	local npc_ace = ReadNpc_("n002");											// G[X
	
	//Ýu
	local res_kil = ArrangePointNpc_(npc_kil, "npc_hunter000");
	local res_ace = ArrangePointNpc_(npc_ace, "npc_ace000");
	
	//úÌü«
	SetDir_(res_kil, 270);
	SetDir_(res_ace, 90);
	
	//TCYÝè
	SetScaleSilhouette(res_kil, SCALE.N, SILHOUETTE_WIDTH.N);
	
	//¿lÌè®Ýè
	SetManualCalcAlpha_(res_ace, true);
	
	//úÌ¿l
	SetAlpha_(res_ace, 1.0);
	
	//=====================================
	//[VÌÇÝÝ
	//=====================================
	
	local bibiriwalk_ace = ReadMotion_(res_ace, "n002_walk01_L");				//G[X¯¦à«
	local bibirilook_ace = ReadMotion_(res_ace, "n002_look_araund_L");			//G[X¯¦©ñµ
	local shock_ace = ReadMotion_(res_ace, "n002_shock");						//G[XÁ­¨¯¦é
	local shockL_ace = ReadMotion_(res_ace, "n002_shock_L");					//G[X¯¦é
	local ac_talk_joy_L = ReadMotion_(res_ace, "n002_talk_joy_L");				// G[X@ïbiðµ»¤jL
	local ac_look_araund_L = ReadMotion_(res_ace, "n002_look_araund_L");		// G[X@Óèð©ñ·Li¨Ñ¦½´¶j
	local ac_look_araund2_L = ReadMotion_(res_ace, "n002_look_araund02_L");		// G[X@Óèð©ñ·LiÊÉLLj
	local ac_surprise = ReadMotion_(res_ace, "n000_surprise");					// G[X@ÊíÒ@¨Á­
	local ac_surprise_L = ReadMotion_(res_ace, "n000_surprise_L");				// G[X@Á­L
	local ac_look_player = ReadMotion_(res_ace, "n002_look_player");			// G[X@Ò@¨ålöð©é
	local ac_look_player_L = ReadMotion_(res_ace, "n002_look_player_L");		// G[X@ålöð©éL
	local ac_run_L = ReadMotion_(res_ace, "n001_run_L");						// G[X@éL
	local ac_impatience_L = ReadMotion_(res_ace, "n002_impatience_L");			// G[X@ÅéL
	local folde_ace = ReadMotion_(res_ace, "n002_arm_folde");					// G[XrðgÞ
	local foldeL_ace = ReadMotion_(res_ace, "n002_arm_folde_L");				// G[XrðgÞL
	local think_ace = ReadMotion_(res_ace, "n002_think");						// G[Xl¦é
	local thinkL_ace = ReadMotion_(res_ace, "n002_think_L");					// G[Xl¦éL	
	
	local kil_search_L = ReadMotion_(res_kil, "m120_01_search_L");				// ^n^[@LL
	
	//=====================================
	//GtFNgÌÇÝÝ
	//=====================================
	LoadEffect_("ef712_10_emo_surprise01");										//[!]
	LoadEffect_("ef712_13_emo_sweat01");										// ¾GtFNgÇÝÝ
	
	//¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬
	//¡Jbg1
	//¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬
	local task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	
	//=====================================
	//tF[hC
	//=====================================
	StartDemo(FADE_COLOR_BLACK);
	
	//=====================================
	//ïbJn
	//=====================================
	
	SetMotion_(eledoor, MOT_GIMMICK_1, 0);
	PlaySE_("SE_DEM_041");
	WaitMotion(eledoor);
	SetMotion_(eledoor, MOT_GIMMICK_2, 0);
	WaitMotion(eledoor);
	SetMotion_(player, MOT_WALK, BLEND_M);
	SetMotion_(res_ace, MOT_WALK, BLEND_M);
	
	//à­Xs[h
	local task1 = Task_MoveForward_(res_ace, 1.05, false);
	Wait_(1);
	local task2 = Task_MoveForward_(player, 1.0, false);
	Wait_(110);
	
	//G[XXgbv
	DeleteTask_(task1);
	SetDir_(res_ace, 70);
	SetMotion_(res_ace, ac_look_araund2_L, BLEND_L);		//G[XÊÉLL
	
	Wait_(15);
	
	//ålöXgbv
	DeleteTask_(task2);
	SetDir_(player, 90);
	SetMotion_(player, MOT_WAIT, BLEND_L);					//ålö@Ò@

	WaitFade_();

	//G[Xu³ÄAÅãKÉs­½ßÉÍEEE
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_110_MSG_010");
		
	SetMotion_(player, pl_look_around_L, BLEND_L);			//ålöÊÉLL
	KeyInputWait_();
	CloseMsgWnd_();
	
	Wait_(20);
	
	//¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬
	//¡Jbg2
	//¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬
	DeleteTask_(task_cam);
	
	local task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	
	task_player = Task_RotateToPos_(player, GetPos_(door03), 229);
	task_ace = Task_RotateToPos_(res_ace, GetPos_(door03), 229);
	SetMotion_(player, MOT_WAIT, BLEND_M);
	SetMotion_(res_ace, ac_talk_joy_L, BLEND_M);
	
	OpenMsgWnd_();
	
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_110_MSG_020");
	KeyInputWait_();
	
	ShowMsg_("DEMO_110_MSG_030");
	KeyInputWait_();
	
	CloseMsgWnd_();
	
	//¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬
	//¡àÉì¯ñéG[XÌJbg
	//¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬
	SetMotion_(res_ace, ac_run_L, BLEND_M);
	task_ace = Task_AnimeMove_(res_ace, "anm_ace000");
	task_ace_step = Task_PlaySe_("SE_FLD_011", 7);
	WaitTask(task_ace);
	
	task_ace = Task_RotateToPos_(res_ace, GetPos_(door03), 172);
	SetMotion_(res_ace, ac_impatience_L, BLEND_M);
	DeleteTask_(task_ace_step);
	
	//¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬
	//¡Jbg2
	//¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬
	DeleteTask_(task_cam);
	
	SetPointCameraEye_("cameye002");
	SetPointCameraTarget_("camtgt002");
	
	SetMotion_(player, MOT_WALK, BLEND_M);
	task_player = Task_AnimeMove_(player, "anm_player000");
	WaitTask(task_player);
	SetMotion_(player, MOT_WAIT, BLEND_M);
	
	// ¾GtFNg
	local sweat = SetSelectBoneEffect_("ef712_13_emo_sweat01", res_ace, ATTACH_EFFECT1);
	
	//G[XuÊ®®I@J©È¢º[ÁIH
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_110_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	
	Wait_(20);
	DeleteEffect_(sweat);													//¾Á
	SetMotion_(res_ace, think_ace, BLEND_M);								//G[Xl¦é	
	WaitMotion(res_ace);
	SetMotion_(res_ace, thinkL_ace, BLEND_M);								//G[Xl¦é
	
	//¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬
	//¡Jbg3
	//¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬
	DeleteTask_(task_cam);
	SetMotion_(door03, MOT_GIMMICK_2, 0);
	
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	
	SetDir_(res_ace, 165);
	SetDir_(player, 195);
	
	OpenMsgWnd_();
	//G[Xu±¢ÂÍccð·é½ßÉ
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_110_MSG_050");
	KeyInputWait_();
	
	local task_npc00 = Task_AnimeMoveNoFitSetMotion_(res_kil, "anm_hunter000", MOT_WALK, kil_search_L);	//^noê
	SetMotion_(res_kil, MOT_WALK, BLEND_M);
	
	//G[XuÇÁ©Å@J[hL[ðcc
	ShowMsg_("DEMO_110_MSG_060");
	
	SetMotion_(res_ace, ac_look_player_L, BLEND_XL);					//G[Xålöð©é
	
	KeyInputWait_();
	CloseMsgWnd_();
	
	WaitTask(task_npc00);
	
	SurpriseDisp(res_ace);												//ålöG[XuIv
	SurpriseDisp(player);
	SetDir_(player, 30);
	SetDir_(res_ace, 30);
	SetMotion_(player, pl_cage_turn_L, BLEND_M);
	
	// ¾GtFNg
	local sweat = SetSelectBoneEffect_("ef712_13_emo_sweat01", res_ace, ATTACH_EFFECT1);
	
	SetMotion_(res_ace, ac_surprise, BLEND_M);
	Wait_(10);
	SetMotion_(res_ace, ac_surprise_L, BLEND_M);
	Wait_(45);
	
	//¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬
	//¡Jbg4		^nAbv
	//¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬
	local task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");

	//G[Xu¤Ð¢ÁIH	
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_110_MSG_070");
	KeyInputWait_();

	//G[Xu cc  ¢¤¨ª@¢é©ç
	ShowMsg_("DEMO_110_MSG_080");
	KeyInputWait_();
	CloseMsgWnd_();

	//¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬
	//¡Jbg5
	//¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬
	DeleteTask_(task_cam);
	
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	
	SetDir_(res_ace, 53);												//G[XålöÖûü]·
	
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	//G[Xu´Í¨Á©ÈÑÁ­èÂ¢Ä¢­ºI
	ShowMsg_("DEMO_110_MSG_090");
	
	SetMotion_(res_ace, ac_run_L, BLEND_M);								//é
	local task_ace = Task_MoveForward_(res_ace, 1.0, true);				//G[XålöÉßÃ­
	Wait_(3);
	DeleteTask_(task_ace);
	SetDir_(res_ace, 15);
	SetMotion_(res_ace, shockL_ace, 0);									//¯¦\·

	KeyInputWait_();
	CloseMsgWnd_();
	
	//¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬
	//¡fI¹
	//¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬
	
	EndDemo(FADE_COLOR_BLACK);
}