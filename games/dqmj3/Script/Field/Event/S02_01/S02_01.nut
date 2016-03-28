//===================== S02_01�C�b�^�u���č� 2F ====================

// �ϐ���`
main_num	 <- C_NONE_ID;
prison_num	 <- C_NONE_ID;

str_num_sub <- "NUM_SCENARIO_SUB_PRISON";

//------------------------------------------------
//		�퓬�I����
//------------------------------------------------
function AfterBattle()
{
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");
	prison_num	 = GetNumFlg_("NUM_SCENARIO_SUB_PRISON");
	
	EventEnd_();
}


//------------------------------------------------
//		�}�b�v�ɓ���O
//------------------------------------------------
function BeforeInitMap()
{
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");
	prison_num	 = GetNumFlg_("NUM_SCENARIO_SUB_PRISON");
	
	/*
		�����Ȃ�
	*/
	
	EventEnd_();
}


//------------------------------------------------
//		�t�F�[�h�A�E�g��
//------------------------------------------------
function FadeIn()
{
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");			// Num0
	prison_num	 = GetNumFlg_("NUM_SCENARIO_SUB_PRISON");	// Num6
	
	DebugPrint(" ");
	DebugPrint("NUM_SCENARIO_MAIN �̒l�� " + main_num + " �ɂȂ�܂����B");
	DebugPrint("NUM_SCENARIO_SUB_PRISON �̒l�� " + prison_num + " �ɂȂ�܂����B");
	
	// �č��ɂ���|�b�h�̒n���ɐG���ƃ����X�^�[�z�u���s���t���O��S�ď�����
	SetEventFlg_("BFG_SET_MONSTER_TOUCH_POD_01", false);
	SetEventFlg_("BFG_SET_MONSTER_TOUCH_POD_02", false);
	SetEventFlg_("BFG_SET_MONSTER_TOUCH_POD_03", false);
	SetEventFlg_("BFG_SET_MONSTER_TOUCH_POD_04", false);
	SetEventFlg_("BFG_SET_MONSTER_TOUCH_POD_05", false);
	SetEventFlg_("BFG_SET_MONSTER_TOUCH_POD_06", false);
	SetEventFlg_("BFG_SET_MONSTER_TOUCH_POD_07", false);
	SetEventFlg_("BFG_SET_MONSTER_TOUCH_POD_08", false);
	SetEventFlg_("BFG_SET_MONSTER_TOUCH_POD_09", false);
	SetEventFlg_("BFG_SET_MONSTER_TOUCH_POD_10", false);
	SetEventFlg_("BFG_SET_MONSTER_TOUCH_POD_11", false);
	SetEventFlg_("BFG_SET_MONSTER_TOUCH_POD_12", false);
	SetEventFlg_("BFG_SET_MONSTER_TOUCH_POD_13", false);
	SetEventFlg_("BFG_SET_MONSTER_TOUCH_POD_14", false);
	
	//----------
	// ��NPC�z�u
	//----------
	// ID������
	g_npc_gaikotu		 <- C_NONE_ID;
	g_npc_brake_toge	 <- C_NONE_ID;
	
	// �� ��������
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_DEVIL_REMODELING")) {				// Num6 = 11
			local id_gaikotu	 = ReadNpc_("m101_00");		// ��������
			g_npc_gaikotu		 = ArrangePointNpc_(id_gaikotu, "npc_samayou02");
			SetScaleSilhouette(g_npc_gaikotu, SCALE.N ,SILHOUETTE_WIDTH.N);
			SetReactorMsg_(g_npc_gaikotu, "REC_NPC_GAIKOTU");
		}
	}

	// �� �u���C�N�������Ƃ��W���{�[
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_DEVIL_REMODELING")) {				// Num6 = 11
			local id_brake_toge	 = ReadNpc_("m195_00");
			g_npc_brake_toge	 = ArrangePointNpc_(id_brake_toge, "npc_brake");
			SetTalkTurn_(g_npc_brake_toge, false);	// �b�������Ă��U������Ȃ�
			local m_break = ReadMotion_(g_npc_brake_toge, "m195_00_after_break");
			SetMotion_(g_npc_brake_toge, m_break, BLEND_N);
			SetScaleSilhouette(g_npc_brake_toge, SCALE.M ,SILHOUETTE_WIDTH.M);
			SetReactorMsg_(g_npc_brake_toge, "REC_NPC_PRIZONER");
		}
	}


	//-----------
	// ���n���z�u
	//-----------
	// ID������
	g_mine_demo410		 <- C_NONE_ID;
	g_mine_stop			 <- C_NONE_ID;
	g_mine_bgm007		 <- C_NONE_ID;
	g_mine_door01		 <- C_NONE_ID;
	g_mine_door02		 <- C_NONE_ID;
	g_mine_exit			 <- C_NONE_ID;
	g_mine_pot01		 <- C_NONE_ID;
	g_mine_pot02		 <- C_NONE_ID;
	g_mine_pot03		 <- C_NONE_ID;
	g_mine_pot04		 <- C_NONE_ID;
	g_mine_pot05		 <- C_NONE_ID;
	g_mine_pot06		 <- C_NONE_ID;
	g_mine_pot07		 <- C_NONE_ID;
	g_mine_pot08		 <- C_NONE_ID;
	g_mine_pot09		 <- C_NONE_ID;
	g_mine_pot10		 <- C_NONE_ID;
	g_mine_pot11		 <- C_NONE_ID;
	g_mine_pot12		 <- C_NONE_ID;
	g_mine_pot13		 <- C_NONE_ID;
	g_mine_pot14		 <- C_NONE_ID;
	
	// ��Demo410�N���n��
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_RUKIYA_NUKEGARA")) {				// Num6 = 10
			g_mine_demo410 = SetPointBoxEventMine_("mine_demo410", false);
		}
	}

	// ���i���֎~�n��
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_DEVIL_REMODELING")) {				// Num6 = 11
			g_mine_stop = SetPointBoxEventMine_("mine_stop", false);
		}
	}

	// ���P�K����̃C�b�^�u���̐��n��
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_MEETING_02")) {					// Num6 = 13
			local bit_rec_msg = GetEventFlg_("BFG_DISPLAYED_LEADING_5F_MSG_3F");	// Bit_1234 ���A�N�^�[�̗U��MSG���Đ�����
			local bit_in_park = GetEventFlg_("BFG_PLAYED_DEMO431_AFTER_PARK");		// Bit_1232 �f��431�Đ���A�A���C�p�[�N�ɓ�����
			if (!bit_rec_msg && !bit_in_park){
				g_mine_exit = SetPointBoxEventMine_("mine_exit", false);
			}
		}
	}
	
	// ��BGM_007 �ݒ�n��
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_MEETING_02")) {					// Num6 = 13
			g_mine_bgm007 = SetPointBoxEventMineNoFallWait_("mine_bgm007");
			SetMinePlayerStop_(g_mine_bgm007, false);	// �n���ɐG��Ă����[�V�������~�߂Ȃ�
		}
	}
	
	// �����b�N���n��
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_BLAST_STRATEGY")) {				// Num6 < 20
			g_mine_door01 = SetPointCircleEventMine_("mine_door01", true);
			g_mine_door02 = SetPointCircleEventMine_("mine_door02", true);
		}
	}
	
	// �������|�b�g�N���n��
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_MEETING_02")) {					// Num6 < 13
			// �z�u���Ȃ�
		} else {
			g_mine_pot01 = SetPointBoxEventMineNoFallWait_("mine_pot01");
			g_mine_pot02 = SetPointBoxEventMineNoFallWait_("mine_pot02");
			g_mine_pot03 = SetPointBoxEventMineNoFallWait_("mine_pot03");
			g_mine_pot04 = SetPointBoxEventMineNoFallWait_("mine_pot04");
			g_mine_pot05 = SetPointBoxEventMineNoFallWait_("mine_pot05");
			g_mine_pot06 = SetPointBoxEventMineNoFallWait_("mine_pot06");
			g_mine_pot07 = SetPointBoxEventMineNoFallWait_("mine_pot07");
			g_mine_pot08 = SetPointBoxEventMineNoFallWait_("mine_pot08");
			g_mine_pot09 = SetPointBoxEventMineNoFallWait_("mine_pot09");
			g_mine_pot10 = SetPointBoxEventMineNoFallWait_("mine_pot10");
			g_mine_pot11 = SetPointBoxEventMineNoFallWait_("mine_pot11");
			g_mine_pot12 = SetPointBoxEventMineNoFallWait_("mine_pot12");
			g_mine_pot13 = SetPointBoxEventMineNoFallWait_("mine_pot13");
			g_mine_pot14 = SetPointBoxEventMineNoFallWait_("mine_pot14");
		}
	} else {
		g_mine_pot01 = SetPointBoxEventMineNoFallWait_("mine_pot01");
		g_mine_pot02 = SetPointBoxEventMineNoFallWait_("mine_pot02");
		g_mine_pot03 = SetPointBoxEventMineNoFallWait_("mine_pot03");
		g_mine_pot04 = SetPointBoxEventMineNoFallWait_("mine_pot04");
		g_mine_pot05 = SetPointBoxEventMineNoFallWait_("mine_pot05");
		g_mine_pot06 = SetPointBoxEventMineNoFallWait_("mine_pot06");
		g_mine_pot07 = SetPointBoxEventMineNoFallWait_("mine_pot07");
		g_mine_pot08 = SetPointBoxEventMineNoFallWait_("mine_pot08");
		g_mine_pot09 = SetPointBoxEventMineNoFallWait_("mine_pot09");
		g_mine_pot10 = SetPointBoxEventMineNoFallWait_("mine_pot10");
		g_mine_pot11 = SetPointBoxEventMineNoFallWait_("mine_pot11");
		g_mine_pot12 = SetPointBoxEventMineNoFallWait_("mine_pot12");
		g_mine_pot13 = SetPointBoxEventMineNoFallWait_("mine_pot13");
		g_mine_pot14 = SetPointBoxEventMineNoFallWait_("mine_pot14");
	}
	//---------------
	// ���M�~�b�N�z�u
	//---------------
	// ID������
	g_gmk_door01	 <- C_NONE_ID;
	g_gmk_door02	 <- C_NONE_ID;
	g_gmk_pot01		 <- C_NONE_ID;
	g_gmk_pot02		 <- C_NONE_ID;
	g_gmk_pot03		 <- C_NONE_ID;
	g_gmk_pot04		 <- C_NONE_ID;
	g_gmk_pot05		 <- C_NONE_ID;
	g_gmk_pot06		 <- C_NONE_ID;
	g_gmk_pot07		 <- C_NONE_ID;
	g_gmk_pot08		 <- C_NONE_ID;
	g_gmk_pot09		 <- C_NONE_ID;
	g_gmk_pot10		 <- C_NONE_ID;
	g_gmk_pot11		 <- C_NONE_ID;
	g_gmk_pot12		 <- C_NONE_ID;
	g_gmk_pot13		 <- C_NONE_ID;
	g_gmk_pot14		 <- C_NONE_ID;

	// ���\�[�X�ǂݍ���
	local id_pot 	= ReadGimmick_("o_S02_03");		// �����|�b�h�̊W

	// �����b�N��
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_BLAST_STRATEGY")) {				// Num6 < 20
			local id_door	 = ReadGimmick_("o_S02_04");		// ���b�N��
			g_gmk_door01	 = ArrangePointGimmick_("o_S02_04", id_door, "gmk_door01");
			g_gmk_door02	 = ArrangePointGimmick_("o_S02_04", id_door, "gmk_door02");
		}
	}

	// �������|�b�h�̊W
	g_gmk_pot01 = ArrangePointGimmick_("o_S02_03", id_pot, "gmk_pot01");
	SetMotion_(g_gmk_pot01, MOT_GIMMICK_1, BLEND_N);

	g_gmk_pot02 = ArrangePointGimmick_("o_S02_03", id_pot, "gmk_pot02");
	SetMotion_(g_gmk_pot02, MOT_GIMMICK_1, BLEND_N);

	g_gmk_pot03 = ArrangePointGimmick_("o_S02_03", id_pot, "gmk_pot03");
	SetMotion_(g_gmk_pot03, MOT_GIMMICK_1, BLEND_N);

	g_gmk_pot04 = ArrangePointGimmick_("o_S02_03", id_pot, "gmk_pot04");
	SetMotion_(g_gmk_pot04, MOT_GIMMICK_1, BLEND_N);

	g_gmk_pot05 = ArrangePointGimmick_("o_S02_03", id_pot, "gmk_pot05");
	SetMotion_(g_gmk_pot05, MOT_GIMMICK_1, BLEND_N);

	g_gmk_pot06 = ArrangePointGimmick_("o_S02_03", id_pot, "gmk_pot06");
	SetMotion_(g_gmk_pot06, MOT_GIMMICK_1, BLEND_N);

	g_gmk_pot07 = ArrangePointGimmick_("o_S02_03", id_pot, "gmk_pot07");
	SetMotion_(g_gmk_pot07, MOT_GIMMICK_1, BLEND_N);
	
	g_gmk_pot08 = ArrangePointGimmick_("o_S02_03", id_pot, "gmk_pot08");
	SetMotion_(g_gmk_pot08, MOT_GIMMICK_1, BLEND_N);

	g_gmk_pot09 = ArrangePointGimmick_("o_S02_03", id_pot, "gmk_pot09");
	SetMotion_(g_gmk_pot09, MOT_GIMMICK_1, BLEND_N);

	g_gmk_pot10 = ArrangePointGimmick_("o_S02_03", id_pot, "gmk_pot10");
	SetMotion_(g_gmk_pot10, MOT_GIMMICK_1, BLEND_N);

	g_gmk_pot11 = ArrangePointGimmick_("o_S02_03", id_pot, "gmk_pot11");
	SetMotion_(g_gmk_pot11, MOT_GIMMICK_1, BLEND_N);

	g_gmk_pot12 = ArrangePointGimmick_("o_S02_03", id_pot, "gmk_pot12");
	SetMotion_(g_gmk_pot12, MOT_GIMMICK_1, BLEND_N);

	g_gmk_pot13 = ArrangePointGimmick_("o_S02_03", id_pot, "gmk_pot13");
	SetMotion_(g_gmk_pot13, MOT_GIMMICK_1, BLEND_N);

	// ���f���ɍ��킹�ĊJ���Ă���
	g_gmk_pot14 = ArrangePointGimmick_("o_S02_03", id_pot, "gmk_pot14");
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_MEETING_01")) {					// Num6 < 12
			SetMotion_(g_gmk_pot14, MOT_GIMMICK_3, BLEND_N);
		    SetGimmickMapHitEnable_(g_gmk_pot14, false); // gimmick �̃A�^���𖳌���
		} else {
			SetMotion_(g_gmk_pot14, MOT_GIMMICK_1, BLEND_N);
		}
	} else {
		SetMotion_(g_gmk_pot14, MOT_GIMMICK_1, BLEND_N);
	}

	//-------------------------
	// �����A�N�^�[�|�C���g�z�u
	//-------------------------
	// ���u���C�N�����}�V�[��
	local reactorPoint01 = ArrangeMsgReactorPoint("recpoint_01_break", GetFlagID_("BFG_REACTER_POINT_076")// Bit_1575 �u���C�N�����}�V�[��
		, SHORT_DIST, "REC_POINT_01", "REC_POINT_01_2");

	// ���}�f�̌���
	local reactorPoint02 = ArrangeMsgReactorPoint("recpoint_02_maso", GetFlagID_("BFG_REACTER_POINT_077")// Bit_1576 �}�f�̌���
		, SHORT_DIST, "REC_POINT_02", "REC_POINT_02_2");

	//-------------------------
	// ���i�r�}�b�v�A�C�R���z�u
	//-------------------------

	EventEnd_();
}


//------------------------------------------------
//		�t�B�[���h����J�n
//------------------------------------------------
function EventStartOperate()
{
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");			// Num0
	prison_num	 = GetNumFlg_("NUM_SCENARIO_SUB_PRISON");	// Num6
	local player = GetPlayerId_();
	
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {							// Num0 = 5
		// ���T�K�̍L�Ԃ�ڎw���Ă��鎞�̃��A�N�^�[���b�Z�[�W
		if (prison_num == GetFlagID_("CONST_SS_PR_MEETING_02")) {				// Num6 = 13
			local bit_rec_msg = GetEventFlg_("BFG_DISPLAYED_LEADING_5F_MSG");	// Bit_1233 ���A�N�^�[�̗U��MSG���Đ�����
			if (!bit_rec_msg){
				SetEventFlg_("BFG_DISPLAYED_LEADING_5F_MSG", true);				// Bit_1233 ���A�N�^�[�̗U��MSG���Đ�����
				
				Wait_(20);							// �Ó]������҂�
				
				// ���A�N�^�[�����t�����b�Z�[�W
				CommReactorActionNotice();			// ���A�N�^�[���������������̋��ʏ���
				// ���A�N�^�[���b�Z�[�W
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_REACTOR");
				ShowMsg_("REACTER_MSG_000");		// �u�����I�Ɂ@���荞��ł���@�ʐM������܂��I
				KeyInputWait_();
				CloseMsgWnd_();
				
				// ��̒ʐM
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_MYSTERY_COMMUNICATION");
				ShowMsg_("REACTER_MSG_010");		// �u������Ɓ@�������邩���@����l���̖��O���I
				KeyInputWait_();
				CloseMsgWnd_();
				
				PlaySE_("SE_FLD_232");	// ���A�N�^�[�iOFF)
				Wait_(30);
				
				// ���A�N�^�[���b�Z�[�W
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_REACTOR");
				ShowMsg_("REACTER_MSG_020");		// �u�ʐM���؂�܂����B
				KeyInputWait_();
				CloseMsgWnd_();
				CommResetPlayerMotion();			// ���[�V������ҋ@��Ԃɖ߂����ʏ���
			}
		}
	}
		
	EventEnd_();
}


//------------------------------------------------
//		�m�o�b�ڐG��
//------------------------------------------------
function TouchNpc()
{
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");			// Num0
	prison_num	 = GetNumFlg_("NUM_SCENARIO_SUB_PRISON");	// Num6
	
	local target = GetTargetId_();
	
	DebugPrint("ID: " + target + " �ɐڐG [TouchNpc]");
	
	switch (target) {
	case g_npc_gaikotu :
		uTalkSamayou();
		break;
	case g_npc_brake_toge :
		uTalkBrake_Toge();
		break;
	default :
		DebugPrint("WARNING : NPC_ID���s���ł� [TouchNpc]");
		break;
	}
	
	EventEnd_();
}

//------------------------------------------------
//		�n���ڐG��
//------------------------------------------------
function TouchEventMine()
{
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");
	prison_num	 = GetNumFlg_("NUM_SCENARIO_SUB_PRISON");
	
	local target = GetTouchEventMineId_();
	
	DebugPrint("ID: " + target + " �ɐڐG [TouchEventMine]");
	
	switch (target) {
	case g_mine_demo410 :
		uMineDemo410Start();
		break;
	case g_mine_stop :
		uMineStop();
		break;
	case g_mine_bgm007 :
		uMineBgm007();
		break;
	case g_mine_exit :
		uMineExit();
		break;
	case g_mine_door01 :
		uMineDoor01();
		break;
	case g_mine_door02 :
		uMineDoor02();
		break;
	case g_mine_pot01 :
		uMinePot01();
		break;
	case g_mine_pot02 :
		uMinePot02();
		break;
	case g_mine_pot03 :
		uMinePot03();
		break;
	case g_mine_pot04 :
		uMinePot04();
		break;
	case g_mine_pot05 :
		uMinePot05();
		break;
	case g_mine_pot06 :
		uMinePot06();
		break;
	case g_mine_pot07 :
		uMinePot07();
		break;
	case g_mine_pot08 :
		uMinePot08();
		break;
	case g_mine_pot09 :
		uMinePot09();
		break;
	case g_mine_pot10 :
		uMinePot10();
		break;
	case g_mine_pot11 :
		uMinePot11();
		break;
	case g_mine_pot12 :
		uMinePot12();
		break;
	case g_mine_pot13 :
		uMinePot13();
		break;
	case g_mine_pot14 :
		uMinePot14();
		break;
	default :
		DebugPrint("WARNING : MINE_ID���s���ł� [TouchEventMine]");
		break;
	}
	
	EventEnd_();
}


//------------------------------------------------
//		���A�N�^�[�N����
//------------------------------------------------
function ReactorOn()
{
	/*
		�����Ȃ�
	*/
	
	EventEnd_();
}


//------------------------------------------------
//		���A�N�^�[�Œ��ׂ���
//------------------------------------------------
function ReactorAnalyze()
{
	/*
		�����Ȃ�
	*/
	
	EventEnd_();
}


//------------------------------------------------
//		���A�N�^�[�I����
//------------------------------------------------
function ReactorOff()
{
	/*
		�����Ȃ�
	*/
	
	EventEnd_();
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�Ŏ�i���܂悤��낢�j ��b����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkSamayou()
{
	OpenMsgWnd_();
	ShowMsg_("SAMAYOUYOROI_MSG_000");	// �u������ �u���C�N��������
	KeyInputWait_();
	CloseMsgWnd_();

}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		���l�`�i�u���C�N�Ƃ��W���{�[�j ��b����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkBrake_Toge()
{
	OpenMsgWnd_();
	ShowMsg_("NPC_PRISONER_A_MSG_000");	// �u�M�M�c�c�M�M�M�c�c
	KeyInputWait_();
	CloseMsgWnd_();

}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		Demo410�N���n���ɐG�ꂽ��
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineDemo410Start()
{
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_RUKIYA_NUKEGARA")) {				// Num6 = 10
			SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_PR_DEVIL_REMODELING"));	// Num6 <- 11
			SetReturnDemoPosDir_(Vec3(-365, -20, 174.9), 221);
			// Demo410[�����̉������u]�Đ�
			TouchNpcChangeDemo(410);
		}
	}
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		�i���֎~�n���ɐG�ꂽ��
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineStop()
{
	local dir = GetDir_(g_npc_gaikotu);
	
	FaceToFaceNpc(g_npc_gaikotu);
	
	OpenMsgWnd_();
	ShowMsg_("SAMAYOUYOROI_MSG_000");	// �u������ �u���C�N��������
	KeyInputWait_();
	CloseMsgWnd_();
	
	Task_RotateToDirSetMotion_(g_npc_gaikotu, dir, 5.7, MOT_WALK, MOT_WAIT);
	
	CommPlayerTurnMoveDirWalk(180);
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		BGM_007 �ݒ�n���ɐG�ꂽ��
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineBgm007()
{
	SetEventFlg_("BFG_S02_01_EVENT_BGM007_PLAY", false);	// Bit_663 S02_01 BGM�����ɖ߂�
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		�P�K����̃C�b�^�u���̐��n���ɐG�ꂽ��
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineExit()
{
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ITABURU");	// �C�b�^�u��
	ShowMsg_("ITTABURU_MSG_000");		// �u�G�΍s������� �����X�^�[�̔�������I
	KeyInputWait_();
	CloseMsgWnd_();
	
	OpenMsgWnd_();
	ShowMsg_("SYSTEM_MSG_000");		// �P�K�� �~���ׂ��ł� �Ȃ��悤���c�c�B
	KeyInputWait_();
	CloseMsgWnd_();
	
	CommPlayerTurnMoveDirWalk(90);
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		���b�N���n���@�ɐG�ꂽ��
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineDoor01()
{
	CommPlayerTurnAroundObj(g_gmk_door01);
	OpenMsgWnd_();
	ShowMsg_("SYSTEM_MSG_998");		// �i���j���ɂ� ���b�N���������Ă���B
	KeyInputWait_();
	CloseMsgWnd_();
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		���b�N���n���A�ɐG�ꂽ��
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineDoor02()
{
	CommPlayerTurnAroundObj(g_gmk_door02);
	OpenMsgWnd_();
	ShowMsg_("SYSTEM_MSG_998");		// �i���j���ɂ� ���b�N���������Ă���B
	KeyInputWait_();
	CloseMsgWnd_();
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		�����|�b�g�n���@�ɐG�ꂽ��
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMinePot01()
{
	// �����X�^�[�������z�u(�ʓr�z�u����Ȃ��r�b�g�t���O���K�v)
	PlacementMonster_(713);
	// �č��ɂ���|�b�h01�̒n���ɐG���ƃ����X�^�[�z�u���s���t���O��ON
	SetEventFlg_("BFG_SET_MONSTER_TOUCH_POD_01", true);
	uTouchPot(g_mine_pot01 , g_gmk_pot01 );
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		�����|�b�g�n���A�ɐG�ꂽ��
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMinePot02()
{
	// �����X�^�[�������z�u(�ʓr�z�u����Ȃ��r�b�g�t���O���K�v)
	PlacementMonster_(711);
	// �č��ɂ���|�b�h02�̒n���ɐG���ƃ����X�^�[�z�u���s���t���O��ON
	SetEventFlg_("BFG_SET_MONSTER_TOUCH_POD_02", true);
	uTouchPot(g_mine_pot02 , g_gmk_pot02 );
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		�����|�b�g�n���B�ɐG�ꂽ��
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMinePot03()
{
	// �����X�^�[�������z�u(�ʓr�z�u����Ȃ��r�b�g�t���O���K�v)
	PlacementMonster_(709);
	// �č��ɂ���|�b�h03�̒n���ɐG���ƃ����X�^�[�z�u���s���t���O��ON
	SetEventFlg_("BFG_SET_MONSTER_TOUCH_POD_03", true);
	uTouchPot(g_mine_pot03 , g_gmk_pot03 );
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		�����|�b�g�n���C�ɐG�ꂽ��
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMinePot04()
{
	// �����X�^�[�������z�u(�ʓr�z�u����Ȃ��r�b�g�t���O���K�v)
	PlacementMonster_(708);
	// �č��ɂ���|�b�h04�̒n���ɐG���ƃ����X�^�[�z�u���s���t���O��ON
	SetEventFlg_("BFG_SET_MONSTER_TOUCH_POD_04", true);
	uTouchPot(g_mine_pot04 , g_gmk_pot04 );
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		�����|�b�g�n���D�ɐG�ꂽ��
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMinePot05()
{
	// �����X�^�[�������z�u(�ʓr�z�u����Ȃ��r�b�g�t���O���K�v)
	PlacementMonster_(710);
	// �č��ɂ���|�b�h05�̒n���ɐG���ƃ����X�^�[�z�u���s���t���O��ON
	SetEventFlg_("BFG_SET_MONSTER_TOUCH_POD_05", true);
	uTouchPot(g_mine_pot05 , g_gmk_pot05 );
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		�����|�b�g�n���E�ɐG�ꂽ��
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMinePot06()
{
	// �����X�^�[�������z�u(�ʓr�z�u����Ȃ��r�b�g�t���O���K�v)
	PlacementMonster_(712);
	// �č��ɂ���|�b�h06�̒n���ɐG���ƃ����X�^�[�z�u���s���t���O��ON
	SetEventFlg_("BFG_SET_MONSTER_TOUCH_POD_06", true);
	uTouchPot(g_mine_pot06 , g_gmk_pot06 );
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		�����|�b�g�n���F�ɐG�ꂽ��
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMinePot07()
{
	// �č��ɂ���|�b�h07�̒n���ɐG���ƃ����X�^�[�z�u���s���t���O��ON
	SetEventFlg_("BFG_SET_MONSTER_TOUCH_POD_07", true);
	uTouchPot(g_mine_pot07 , g_gmk_pot07 );
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		�����|�b�g�n���G�ɐG�ꂽ��
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMinePot08()
{
	// �����X�^�[�������z�u(�ʓr�z�u����Ȃ��r�b�g�t���O���K�v)
	PlacementMonster_(702);
	// �č��ɂ���|�b�h08�̒n���ɐG���ƃ����X�^�[�z�u���s���t���O��ON
	SetEventFlg_("BFG_SET_MONSTER_TOUCH_POD_08", true);
	uTouchPot(g_mine_pot08 , g_gmk_pot08 );
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		�����|�b�g�n���H�ɐG�ꂽ��
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMinePot09()
{
	// �č��ɂ���|�b�h09�̒n���ɐG���ƃ����X�^�[�z�u���s���t���O��ON
	SetEventFlg_("BFG_SET_MONSTER_TOUCH_POD_09", true);
	uTouchPot(g_mine_pot09 , g_gmk_pot09 );
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		�����|�b�g�n���I�ɐG�ꂽ��
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMinePot10()
{
	// �����X�^�[�������z�u(�ʓr�z�u����Ȃ��r�b�g�t���O���K�v)
	PlacementMonster_(706);
	// �č��ɂ���|�b�h10�̒n���ɐG���ƃ����X�^�[�z�u���s���t���O��ON
	SetEventFlg_("BFG_SET_MONSTER_TOUCH_POD_10", true);
	uTouchPot(g_mine_pot10 , g_gmk_pot10 );
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		�����|�b�g�n���J�ɐG�ꂽ��
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMinePot11()
{
	// �����X�^�[�������z�u(�ʓr�z�u����Ȃ��r�b�g�t���O���K�v)
	PlacementMonster_(707);
	// �č��ɂ���|�b�h11�̒n���ɐG���ƃ����X�^�[�z�u���s���t���O��ON
	SetEventFlg_("BFG_SET_MONSTER_TOUCH_POD_11", true);
	uTouchPot(g_mine_pot11 , g_gmk_pot11 );
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		�����|�b�g�n���K�ɐG�ꂽ��
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMinePot12()
{
	// �����X�^�[�������z�u(�ʓr�z�u����Ȃ��r�b�g�t���O���K�v)
	PlacementMonster_(705);
	// �č��ɂ���|�b�h12�̒n���ɐG���ƃ����X�^�[�z�u���s���t���O��ON
	SetEventFlg_("BFG_SET_MONSTER_TOUCH_POD_12", true);
	uTouchPot(g_mine_pot12 , g_gmk_pot12 );
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		�����|�b�g�n���L�ɐG�ꂽ��
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMinePot13()
{
	// �����X�^�[�������z�u(�ʓr�z�u����Ȃ��r�b�g�t���O���K�v)
	PlacementMonster_(703);
	// �č��ɂ���|�b�h13�̒n���ɐG���ƃ����X�^�[�z�u���s���t���O��ON
	SetEventFlg_("BFG_SET_MONSTER_TOUCH_POD_13", true);
	uTouchPot(g_mine_pot13 , g_gmk_pot13 );
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		�����|�b�g�n���M�ɐG�ꂽ��
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMinePot14()
{
	// �����X�^�[�������z�u(�ʓr�z�u����Ȃ��r�b�g�t���O���K�v)
	PlacementMonster_(701);
	// �č��ɂ���|�b�h14�̒n���ɐG���ƃ����X�^�[�z�u���s���t���O��ON
	SetEventFlg_("BFG_SET_MONSTER_TOUCH_POD_14", true);
	uTouchPot(g_mine_pot14 , g_gmk_pot14 );
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		�����|�b�g�N�����̃��[�V����
//------------------------------------------------
//	����	: �|�b�g�̒n��
//	����	: �|�b�g�̂h�c
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTouchPot(mine , id )
{
	DeleteEventMine_(mine);
	PlaySE_("SE_FLD_013");	// �č��E�u���C�N�����X�^�[�|�b�h���J��
    SetMotion_(id, MOT_GIMMICK_2, BLEND_N);
    SetGimmickMapHitEnable_(id, false); // gimmick �̃A�^���𖳌���
}

