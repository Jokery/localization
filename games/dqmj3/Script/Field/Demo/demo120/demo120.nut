//=============================================
//
//		demo120[®­ån_4(ðà)]
//
//=============================================
function Update()
{
// ¥Ïè`
	local task_cam, task_player, task_ace;
	local rotate_pos = Vec3( -294.9, 0, -100.9);
	
// ¥\[XÇ
	local model_red_screen = ReadGimmick_("o_A03_05");
	local model_monitor = ReadGimmick_("o_A03_04");
	local model_continent = ReadGimmick_("o_dem_04");
	local model_right_display = ReadGimmick_("o_A03_09");
	local model_left_display = ReadGimmick_("o_A03_10");
	
	local player = GetPlayerId_();
	local model_ace = ReadNpc_("n002");		// G[X
	
// ¥zu
//	//M~bN
	local red_screen = ArrangePointGimmick_("o_A03_05", model_red_screen, "obj_red_screen000");
	SetMotion_(red_screen, MOT_GIMMICK_0, BLEND_N);													// _ÅON
	
	local monitor = ArrangePointGimmick_("o_A03_04", model_monitor, "obj_monitor000");
	SetMotion_(monitor, MOT_GIMMICK_0, BLEND_N);
	
	local continent = ArrangePointGimmick_("o_dem_04", model_continent, "obj_continent000");
	SetMotion_(continent, MOT_GIMMICK_0, BLEND_N);

	local right_display = ArrangeGimmick_("o_A03_09", model_right_display, false);	//fBXvC
	local left_display = ArrangeGimmick_("o_A03_10", model_left_display, false);
	
	//LN^[
	SetPointPos_(player, "player000");
	local ace = ArrangePointNpc_(model_ace, "npc_ace000");

// ¥ñí[VÇ

	//ålö
	local player_look_up_L = ReadMotion_(player, "Player_look_up_L");		// ålöãü«Ò@
	local player_look_down_L = ReadMotion_(player, "Player_look_down_L");	// ålöºü«Ò@
	local player_look_left_L = ReadMotion_(player, "Player_look_left_L");	// ¶ð©é
	local player_nod = ReadMotion_(player, "Player_nod");					// Ò@¨¤ÈÃ­¨Ò@

	//G[X
	local ace_talk_joy = ReadMotion_(ace, "n002_talk_joy_L");				// G[Xðµ»¤
	local ace_arm = ReadMotion_(ace, "n002_arm_folde");						// G[XrgÝ
	local ace_arm_L = ReadMotion_(ace, "n002_arm_folde_L");					// G[XrgÝL
	local ace_feel_down = ReadMotion_(ace, "n000_feel_down");				// ¿Þ
	local ace_feel_down_L = ReadMotion_(ace, "n000_feel_down_L");			// ¿ÞL
	local ace_hand_up = ReadMotion_(ace, "n002_hand_up");					//ïb¨èð °é
	local ace_hand_up_L = ReadMotion_(ace, "n002_hand_up_L");				//èð °éL
	
	SetManualCalcAlpha_(player, true);
	SetAlpha_(player, 1.0);

	SetManualCalcAlpha_(ace, true);
	SetAlpha_(ace, 1.0);
	
// ¥CAEg
	LoadLayout_("w_map");													//}bv
	SetLayoutAnime_("move_01", false);										//}bv

// ¥JÝè
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	
//-------------------------------------------------------------------------
//		Í¶ÜèÍ¶Üè
//-------------------------------------------------------------------------
//	SetBgmVolume_(0, 1);
	Wait_(15);
	
	StartDemo(FADE_COLOR_BLACK);
	PlaySE_("SE_DEM_184");
	Wait_(60);
	PlaySE_("SE_DEM_184");
	Wait_(65);
	PlaySE_("SE_DEM_177");
	Wait_(110);
	PlaySE_("SE_DEM_178");
	
	WaitLayoutAnime();
	//¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬
	//¡JbgP@G[XAbv
	//¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬
	
	Wait_(30);	
	MotionTalk(ace);
	//======================================
	//G[X
	//--------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	//u êÍccÈéÙÇI
	ShowMsg_("DEMO_120_MSG_010");
	KeyInputWait_();	
	
	//uÚ®u¾æ@<name_player/>I
	ShowMsg_("DEMO_120_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	//======================================
	
	WaitTask(task_cam);
	
	//¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬
	//¡JbgQ@G[XÌðà2
	//¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬
	task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	
	task_ace = Task_WalkAroundToPos(ace, GetPos_(player), 5.7);

	SetMotion_(player, player_look_left_L, BLEND_XL)						// ålö¶Ò@

	WaitTask(task_ace);
	MotionTalk(ace);
	
	//======================================
	//G[X
	//--------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	//u¢¢©H@Ú®uÉÍ@ËöÁÄàñª éB
	ShowMsg_("DEMO_120_MSG_030");
	KeyInputWait_();

	//uÅà@±Ì®ðgÁÄ@ånð®©¹Îcc
	SetMotion_(ace, ace_hand_up, BLEND_L)									// G[Xèã°é
	WaitMotion(ace);
	SetMotion_(ace, ace_hand_up_L, BLEND_L)									// G[Xèã°éL
	ShowMsg_("DEMO_120_MSG_040");
	KeyInputWait_();
	
	//uNª@l¦½Ì©@mçË¥ª
	SetMotion_(ace, ace_talk_joy, BLEND_L)									// G[Xðµ»¤
	ShowMsg_("DEMO_120_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	//======================================
	
	DeleteTask_(task_cam);
	
	//¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬
	//¡JbgR@_ÅÌCAEg
	//¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬
	SetLayoutAnime_("map_point_01_in", false);										//}bv_Å
	WaitLayoutAnime();
	SetLayoutAnime_("map_point_01", true);										//}bv_Å
	Wait_(30);	
	//======================================
	//G[X
	//--------------------------------------
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	//u¤ñH@±ÌMÍcc±±Ý½¢È
	ShowMsg_("DEMO_120_MSG_060");
	KeyInputWait_();
	//uàµ©µ½ç@±ÌõÁÄéÆ±ë
	ShowMsg_("DEMO_120_MSG_070");
	KeyInputWait_();
	
	//uI[ª@sÁÄÝé¿lÍ@ è»¤¾ºH
	ShowMsg_("DEMO_120_MSG_080");
	KeyInputWait_();
	CloseMsgWnd_();
	//======================================
	SetPointPos_(ace, "npc_ace001");											// G[XÚ®
	SetPointPos_(player, "player001");											// å Ú®

	SetMotion_(ace, MOT_WAIT, BLEND_N)											// G[XÒ@
	SetMotion_(player, MOT_WAIT, BLEND_N);										// å Ò@
	SetDirToObject_(player, ace);
	
	SetLayoutAnime_("map_point_01_out", false);									//}bv_ÅtF[hAEg
	
	//¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬
	//¡JbgS@åEG[XÌJbgÖÚs
	//¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬
	task_cam = Task_AnimeMoveCamera_("anmeye003", "anmtgt003");
	
	WaitLayoutAnime();
	
	SetMotion_(ace, ace_arm, BLEND_L)											// G[XrgÝ
	WaitMotion(ace);
	SetMotion_(ace, ace_arm_L, BLEND_L)											// G[XrgÝL

	//======================================
	//G[X
	//--------------------------------------
	//uÆà©­ccnkÌ´öÍ@Â©ß½ºB
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("DEMO_120_MSG_090");
	KeyInputWait_();
	
	SetMotion_(ace, ace_feel_down, BLEND_XL);									// ¿Ý
	WaitMotion(ace);
	SetMotion_(ace, ace_feel_down_L, BLEND_M);									// ¿ÝLOOP
	
	//ulª¹È@B¾º
	ShowMsg_("DEMO_120_MSG_100");
	KeyInputWait_();	
	
	SetMotion_(ace, ace_talk_joy, BLEND_L)										// G[Xðµ»¤
	
	//u ÆÍ@±Ì±Æð@LOÉ`¦È¢ÆB
	ShowMsg_("DEMO_120_MSG_110");
	KeyInputWait_();
	CloseMsgWnd_();
	//======================================
	

	SetMotion_(player, player_nod, BLEND_M);									// ålö@Ò@¨¤ÈÃ­¨Ò@
	WaitMotion(player);
	
	//¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬
	//¡fI¹
	//¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬
	
	EndDemo(FADE_COLOR_BLACK);
}