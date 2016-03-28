//=============================================
//
//		demo018[{[VbNoê]
//
//=============================================

function Update()
{
// ¥Ïè`
	local task_cam, task_player;
	local efc_cam, efc_nocho000, efc_nocho100, efc_nocho200, efc_nocho300, efc_king, efc_bor000, efc_bor001;

// ¥tOÝè
	local bit_ruler = GetEventFlg_("BFG_RULER_ADD_001");			// Bit_201 [ÇÁtO

// ¥\[XÇ
	local player = GetPlayerId_();
	local model_bor = ReadNpc_("m207_00");			// {[VbN
	local model_big = ReadNpc_("m048_00");			// rbOnbg
	local model_king = ReadNpc_("n003");			// LO
	local model_nochoman = ReadNpc_("n000");		// m`[
	local model_nochogirl = ReadNpc_("n004");		// m`[
	
	local model_ruler = ReadGimmick_("o_com_08");	// [|Cg
	local model_cage = ReadGimmick_("o_H00_03");
	
	LoadEffect_("ef712_04_emo_joy01");
	LoadEffect_("ef730_01_oth_dark_aura01");
	LoadEffect_("ef712_10_emo_surprise01");
	LoadEffect_("ef721_01_nat_smoke_n01");
	LoadEffect_("ef733_01_sym_shuchusen01");
	
// ¥zu
	//M~bN
	local cage = ArrangePointGimmick_("o_H00_03", model_cage, "obj_cage000");
	// [|Cg
	local ruler = ArrangePointGimmick_("o_com_08", model_ruler, "obj_ruler000");
	// ¤[|CgªùÉN®µÄ¢½ê
	if (bit_ruler) { SetMotion_(ruler, MOT_GIMMICK_2, BLEND_N); }

	//vC[
	SetPointPos_(player, "player000");									//ålö
	SetDir_(player, 320);
	SetFace_(player, "Face_eyes_close");
	SetStepSe_(player, SILENT_STEP_SE);					// «¹ð³¹É·é

	//GLN^[
	local bor = ArrangePointNpc_(model_bor, "npc_bor000");				// {[VbN
	SetScaleSilhouette(bor, SCALE.M, SILHOUETTE_WIDTH.M);
	SetDir_(bor, 115);
	
	local big000 = ArrangePointNpc_(model_big, "npc_big000");			// rbOnbgA
	SetScaleSilhouette(big000, SCALE.S, SILHOUETTE_WIDTH.S);
	SetDir_(big000, 125);
	
	local big100 = ArrangePointNpc_(model_big, "npc_big100");			// rbOnbgB
	SetScaleSilhouette(big100, SCALE.S, SILHOUETTE_WIDTH.S);
	SetDir_(big100, 110);
	
	//m`[
	local king = ArrangePointNpc_(model_king, "npc_king000");			// LO
	SetDir_(king, 280);
	
	local nocho000 = ArrangePointNpc_(model_nochoman, "npc_nocho000");	// m`[
	SetDir_(nocho000, 260);
	
	local nocho100 = ArrangePointNpc_(model_nochoman, "npc_nocho100");	// m`[
	SetDir_(nocho100, 290);
	
	local nocho200 = ArrangePointNpc_(model_nochogirl, "npc_nocho200");	// m`[
	SetDir_(nocho200, 260);
	
	local nocho300 = ArrangePointNpc_(model_nochogirl, "npc_nocho300");	// m`[
	SetDir_(nocho300, 290);
	
// ¥ñí[VÇ
	local player_cage_look_L = ReadMotion_(player, "Player_cage_look_L");	// ålöãðü­
	local player_cage_turn = ReadMotion_(player, "Player_cage_turn");		// ålöãðü­¨Uèü«
	local player_cage_turn_L = ReadMotion_(player, "Player_cage_turn_L");	// ålöUèü«
	local player_run_battle = ReadMotion_(player, "Player_run_battle");		// í¬Ò@
	local player_battle01_L = ReadMotion_(player, "Player_battle01_L");		// ålöí¬Ò@içãü«j

	local nocho000_rejoice_L = ReadMotion_(nocho000, "n000_rejoice_L");		// m`[ìÑ
	local nocho100_rejoice_L = ReadMotion_(nocho100, "n000_rejoice_L");		// m`[ìÑ
	local nocho200_rejoice_L = ReadMotion_(nocho200, "n000_rejoice_L");		// m`[ìÑ
	local nocho300_rejoice_L = ReadMotion_(nocho300, "n000_rejoice_L");		// m`[ìÑ
	local king_rejoice_L = ReadMotion_(king, "n003_rejoice_L");				// LOìÑ
	local nocho000_shock = ReadMotion_(nocho000, "n000_shock");				// m`[ìÑ¨¯¦
	local nocho100_shock = ReadMotion_(nocho100, "n000_shock");				// m`[ìÑ¨¯¦
	local nocho200_shock = ReadMotion_(nocho200, "n000_shock");				// m`[ìÑ¨¯¦
	local nocho300_shock = ReadMotion_(nocho300, "n000_shock");				// m`[ìÑ¨¯¦
	local king_shock = ReadMotion_(king, "n003_shock");						// LOìÑ¨¯¦
	local nocho000_shock_L = ReadMotion_(nocho000, "n000_shock_L");			// m`[¯¦
	local nocho100_shock_L = ReadMotion_(nocho100, "n000_shock_L");			// m`[¯¦
	local nocho200_shock_L = ReadMotion_(nocho200, "n000_shock_L");			// m`[¯¦
	local nocho300_shock_L = ReadMotion_(nocho300, "n000_shock_L");			// m`[¯¦
	local king_shock_L = ReadMotion_(king, "n003_shock_L");					// LO¯¦
	
	local bor_talk_L = ReadMotion_(bor, "m202_00_talk_L");					// {[VbNïb
	local bor_attack = ReadMotion_(bor, "m202_00_attack");					// {[VbNïb¨P¢|©é
	local bor_one_step = ReadMotion_(bor, "m202_00_one_step");				// {[VbNêàOÉoé
	
// ¥ú[V
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
	
// ¥JÝè
	ReadWaitingLod("cameye000", "camtgt000");								//LodÇÝÝ
	
	SetPointCameraEye_("cameye000");
	SetPointCameraTarget_("camtgt000");

//-------------------------------------------------------------------------
//		Í¶ÜèÍ¶Üè
//-------------------------------------------------------------------------

	StartDemo(FADE_COLOR_BLACK);
	
	OpenMsgWnd_();
	//m`[u¯ª½¿å[I
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
	
	efc_nocho000 = SetSelectBoneEffect_("ef712_10_emo_surprise01", nocho000, ATTACH_EFFECT1);		// uIv
	efc_nocho100 = SetSelectBoneEffect_("ef712_10_emo_surprise01", nocho100, ATTACH_EFFECT1);		// uIv
	efc_nocho200 = SetSelectBoneEffect_("ef712_10_emo_surprise01", nocho200, ATTACH_EFFECT1);		// uIv
	efc_nocho300 = SetSelectBoneEffect_("ef712_10_emo_surprise01", nocho300, ATTACH_EFFECT1);		// uIv
	PlaySE_("SE_DEM_053");		// usbIv
	
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
	//m`[uÐÁEEEEI
	ShowMsg_("DEMO_018_MSG_020");
	KeyInputWait_();
	CloseMsgWnd_();
	
	PlaySE_("SE_DEM_014");
	
	StartDecayEarthQuake_(25, 3, 1)
	
	Wait_(30);
	
	SetDir_(player, 270);
	
	//¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬
	//¡Jbg2
	//¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	
	SetMotion_(player, player_cage_turn, BLEND_M);
	WaitMotion(player);
	SetMotion_(player, player_cage_turn_L, BLEND_M);
	
	Wait_(20);
	
	OpenMsgWnd_();
	//{[VbNu½µÄé¾@¨ß¥½¿I
	ShowMsg_("DEMO_018_MSG_030");
	KeyInputWait_();
	CloseMsgWnd_();
	
	//¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬
	//¡Jbg3
	//¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬
//	PlaySE_("SE_DEM_001");		// BGMÆ¯ÉÄ¶³êéÆA·¬âÜæ¶É{çêé½ßC.O
	PlayBgm_("BGM_007");
//	PlaySE_("SE_DEM_026");										// ¡SE:Wü(BGMÆ¯ÉÄ¶³êéÆA·¬âÜæ¶É{çêé½ßC.O)
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", 100);
	task_cam = Task_AnimeMoveCamera_("anmeye000", "anmtgt000");
	
	Wait_(10);
	
	OpenMsgWnd_();
	//u{cc{[VbNI
	ShowMsg_("DEMO_018_MSG_040");
	KeyInputWait_();
	CloseMsgWnd_();
	
	DeleteEffectEmitter_(efc_cam);	
	SetMotion_(bor, bor_talk_L, BLEND_M);
	
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BORSHOCK");
	//u½âç@JSª@ªµ¢Æv¦Îcc
	ShowMsg_("DEMO_018_MSG_050");
	KeyInputWait_();
	CloseMsgWnd_();
	
	SetMotion_(bor, MOT_WAIT, BLEND_M);
	
	DeleteTask_(task_cam);

	
	//¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬
	//¡Jbg4
	//¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬
	local task_cam = Task_AnimeMoveCamera_("anmeye001", "anmtgt001");
	local task_step = Task_ChangeStepSe(player, "SE_FLD_017", 7);		//¡SE:PCÚ®@ØÞ
	
	Wait_(10);
	SetDir_(player, 289);
	SetMotion_(player, MOT_RUN, 15);
	task_player = Task_MoveForward_(player, 1.0, true);					//å@ÁÄJC
	Wait_(20);
	
	SetMotion_(player, player_run_battle, 15);
	Wait_(17);
	DeleteTask_(task_player);
	SetMotion_(player, player_battle01_L, 15);
	SetDir_(player, 285);
	DeleteTaskStepSe(player, task_step);
	Wait_(5);
	PlaySE_("SE_FLD_017");												//¡SE:PCÚ®@ØÞ
	
	SetMotion_(bor, bor_talk_L, BLEND_M);
	
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BORSHOCK");
	//u»ÌAN^[cc¨ß¥@WX^X¾ÈH
	ShowMsg_("DEMO_018_MSG_060");
	KeyInputWait_();
	//u·Á©è@Ðt¯½Æ@vÁÄ½ñ¾ªæB
	ShowMsg_("DEMO_018_MSG_070");
	KeyInputWait_();
	CloseMsgWnd_();
	
	DeleteTask_(task_cam);
	
	//¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬
	//¡Jbg5
	//¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬
	task_cam = Task_AnimeMoveCamera_("anmeye002", "anmtgt002");
	
	SetPos_(player, Vec3(473.731, 346.381, 958.876+1.0));
	
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BORSHOCK");
	//u¢Á½àñ¾×BÉ@øÁ©©Á½
	ShowMsg_("DEMO_018_MSG_080");
	KeyInputWait_();
	//u»êÉ@IÌÚðñÅ@»¢Âçð
	ShowMsg_("DEMO_018_MSG_090");
	KeyInputWait_();
	CloseMsgWnd_();

	DeleteTask_(task_cam);
	
	//¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬
	//¡Jbg6
	//¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬
	SetAlpha_(player, ALPHA_CLEAR);			// ålöñ\¦
	
	task_cam = Task_AnimeMoveCamera_("anmeye004", "anmtgt004");
	
	SetPointPos_(big000, "npc_big001");
	SetPointPos_(big100, "npc_big101");
	SetDir_(big000, 125);
	SetDir_(big100, 110);
	
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BORSHOCK");
	//uµ©[µI@²qÉæéÌÍ@±±ÜÅ¾×I
	ShowMsg_("DEMO_018_MSG_100");
	KeyInputWait_();
	//uWX^XÇàÍ@±Ì@{[VbNª
	ShowMsg_("DEMO_018_MSG_110");
	KeyInputWait_();
	CloseMsgWnd_();
	
	Wait_(10);
	
	WaitTask(task_cam);
	
	efc_cam = SetCameraEffect_("ef733_01_sym_shuchusen01", 100);
	
	SetDir_(bor, 116);
	
	StopBgm_(BGM_STOP_DEF);
	SetMotion_(bor, bor_attack, BLEND_M);	// í¬Jn[VóâP
	PlaySE_("SE_DEM_025");					// ¡SE:{[VbNÌ[VSE
	Wait_(13);
	
	StartEarthQuake_(20, 5, 2);
	
	DeleteTask_(task_cam);
	
	//¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬
	//¡fI¹
	//¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬
	
	EncountEndDemo(ENCOUNT_BOSS);
	
}