//===================== S02_03�C�b�^�u���č� 4F ====================

// �ϐ���`
main_num	 <- C_NONE_ID;
prison_num	 <- C_NONE_ID;

str_num_sub <- "NUM_SCENARIO_SUB_PRISON";

//------------------------------------------------
//		�퓬�I����
//------------------------------------------------
function AfterBattle()
{
	/*
		�����Ȃ�
	*/
	
	EventEnd_();
}


//------------------------------------------------
//		�}�b�v�ɓ���O
//------------------------------------------------
function BeforeInitMap()
{
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");						// Num0
	prison_num	 = GetNumFlg_("NUM_SCENARIO_SUB_PRISON");				// Num6
	local bit_demo = GetEventFlg_("BFG_PLAYED_BATTLE_RIDE_DEMO");		// Bit_1223 �^���f��[�퓬���C�h�`���[�g���A���I��]������
	
	//���C�h��������
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {					// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_BLAST_STRATEGY")) {	// Num6 = 20
			// ���^���f��[�퓬���C�h�`���[�g���A���I��]
			if (!bit_demo){
				SetRideOffStart_();
			}
		}
	}
	
	EventEnd_();
}


//------------------------------------------------
//		�t�F�[�h�A�E�g��
//------------------------------------------------
function FadeIn()
{
	// �t���O���擾
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");									// Num0
	prison_num	 = GetNumFlg_("NUM_SCENARIO_SUB_PRISON");							// Num6
	local bit_get_jail_key = GetEventFlg_("BFG_GET_KEY_OF_JAIL");					// Bit_1204 �낤��̃J�M�����
	
	DebugPrint("NUM_SCENARIO_MAIN �̒l�� " + main_num + " �ɂȂ�܂����B");
	DebugPrint("NUM_SCENARIO_SUB_PRISON �̒l�� " + prison_num + " �ɂȂ�܂����B");
	
	// ���}�b�v�`�F���WNULL�ݒ�
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_RESISTANCE_RUKIYA")) {				// Num6 < 15
			SetHitEnableMapChangeNull_("w_S00_00ALdr_001", false);	// �}�b�v���̔�
		}
	}

	// ���C�b�^�u�����j�܂Ń��L���̂��镔���Ƀ����X�^�[��z�u���Ȃ�
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_INVULNERABILITY_PLAYER")) {		// Num6 < 28
			SetEventFlg_("BFG_LIMIT_4F_UPPER_RIGHT_ROOM", false);					// Bit_1227 �E��̕����Ƀ����X�^�[��z�u
		} else {
			SetEventFlg_("BFG_LIMIT_4F_UPPER_RIGHT_ROOM", true);					// Bit_1227 �E��̕����Ƀ����X�^�[��z�u
		}
	} else {
		SetEventFlg_("BFG_LIMIT_4F_UPPER_RIGHT_ROOM", true);						// Bit_1227 �E��̕����Ƀ����X�^�[��z�u
	}
	
	//---------------
	// ���M�~�b�N�z�u
	//---------------
	// ID������
	g_gmk_door01		 <- C_NONE_ID;
	g_gmk_door02		 <- C_NONE_ID;
	g_gmk_door03		 <- C_NONE_ID;
	g_gmk_door04		 <- C_NONE_ID;
	g_gmk_door05		 <- C_NONE_ID;
	
	// �����ʔ�
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_RESISTANCE_RUKIYA")) {				// Num6 < 15
			local id_door	= ReadGimmick_("o_S02_11");				// ���ʔ�
			g_gmk_door01	= ArrangePointGimmick_("o_S02_11", id_door, "gmk_door01");
			g_gmk_door02	= ArrangePointGimmick_("o_S02_11", id_door, "gmk_door02");
			g_gmk_door03	= ArrangePointGimmick_("o_S02_11", id_door, "gmk_door03");
			g_gmk_door04	= ArrangePointGimmick_("o_S02_11", id_door, "gmk_door04");
			g_gmk_door05	= ArrangePointGimmick_("o_S02_11", id_door, "gmk_door05");
		}
	}

	
	//----------
	// ��NPC�z�u
	//----------
	// ID������
	g_npc_rukiya		 <- C_NONE_ID;
	
	// �����L��
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_BLAST_EXPLANATION_2ND")) {			// Num6 < 17
			// �z�u���Ȃ�
		}
		else if (prison_num < GetFlagID_("CONST_SS_PR_JAIL_OPEN")){					// Num6 < 19
			local id_rukiya	 = ReadNpc_("n009");		// ���L��
			g_npc_rukiya	 = ArrangePointNpc_(id_rukiya, "npc_rukiya001");
			SetTalkCameraType_(g_npc_rukiya, TALK_CAMERA_UP);//�J�����̐ݒ�
			SetReactorMsg_(g_npc_rukiya, "REC_NPC_RUKIYA");
			// ��b�J�������ɓ��߂����̂ŃA���t�@�l��ݒ肷��
			SetManualCalcAlpha_(g_npc_rukiya, true);
			SetAlpha_(g_npc_rukiya, 1.0);
		}
		else if (prison_num == GetFlagID_("CONST_SS_PR_JAIL_OPEN")){				// Num6 = 19
			local id_rukiya	 = ReadNpc_("n009");		// ���L��
			g_npc_rukiya	 = ArrangePointNpc_(id_rukiya, "npc_rukiya000");
			SetTalkCameraType_(g_npc_rukiya, TALK_CAMERA_DEF);//�J�����̐ݒ�
			SetTalkTurn_(g_npc_rukiya, false);// �b�������Ă��U������Ȃ�
			SetReactorMsg_(g_npc_rukiya, "REC_NPC_RUKIYA");
		}
		else if (prison_num < GetFlagID_("CONST_SS_PR_ITTABURU_INTERFERENCE")) {	// Num6 < 21
			local id_rukiya	 = ReadNpc_("n009");		// ���L��
			g_npc_rukiya	 = ArrangePointNpc_(id_rukiya, "npc_rukiya000");
			SetTalkCameraType_(g_npc_rukiya, TALK_CAMERA_UP);//�J�����̐ݒ�
			SetReactorMsg_(g_npc_rukiya, "REC_NPC_RUKIYA");
			// ��b�J�������ɓ��߂����̂ŃA���t�@�l��ݒ肷��
			SetManualCalcAlpha_(g_npc_rukiya, true);
			SetAlpha_(g_npc_rukiya, 1.0);
		}
	}
	
	//-----------------
	// ���G�t�F�N�g�z�u
	//-----------------
	// ID������
	g_efc_item_sign	 <- C_NONE_ID;
	
	// ���A�C�e���T�C��(�낤��̃J�M)
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {									// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_BLAST_EXPLANATION_3RD")) {			// Num6 = 18
			if (!bit_get_jail_key) {
				LoadEffect_("EF300_40_ITEM_SIGN");
				g_efc_item_sign = SetPointWorldEffect_("EF300_40_ITEM_SIGN", "mine_jail_key");
			}
		}
	}
	
	//-----------
	// ���n���z�u
	//-----------
	// ID������
	g_mine_demo413		 <- C_NONE_ID;
	g_mine_jail_key		 <- C_NONE_ID;
	g_mine_door01		 <- C_NONE_ID;
	g_mine_door02		 <- C_NONE_ID;
	g_mine_door03		 <- C_NONE_ID;
	g_mine_door04		 <- C_NONE_ID;
	g_mine_door05		 <- C_NONE_ID;
	g_mine_door06		 <- C_NONE_ID;
	g_mine_jailer02		 <- C_NONE_ID;
	g_mine_jailer04		 <- C_NONE_ID;
	g_mine_jailer05		 <- C_NONE_ID;
	g_mine_jailer06		 <- C_NONE_ID;
	g_rec_point_02		 <- C_NONE_ID;
	g_exclamation07		 <- C_NONE_ID;
	
	// ��Demo413�N���n��
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {									// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_RESISTANCE_RUKIYA")) {				// Num6 = 15
			g_mine_demo413 = SetPointBoxEventMine_("mine_demo413", false);
		}
	}
	
	// ���낤��̃J�M
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {									// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_BLAST_EXPLANATION_3RD")) {			// Num6 = 18
			if (!bit_get_jail_key) {
				g_mine_jail_key = SetPointCircleEventMine_("mine_jail_key", false);
			}
		}
	}
	
	// �����ʔ��n��
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {									// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_RESISTANCE_RUKIYA")) {					// Num6 < 15
			g_mine_door01 = SetPointCircleEventMine_("mine_door01", true);
			g_mine_door02 = SetPointCircleEventMine_("mine_door02", true);
			g_mine_door03 = SetPointCircleEventMine_("mine_door03", true);
			g_mine_door04 = SetPointCircleEventMine_("mine_door04", true);
			g_mine_door05 = SetPointCircleEventMine_("mine_door05", true);
			g_mine_door06 = SetPointCircleEventMine_("mine_door06", true);				// �O�֏o���
		}
	}
	
	// �����A�N�^�[�x�����b�Z�[�W�n��
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {									// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_MEETING_02")) {						// Num6 = 13
			g_mine_jailer02 = SetPointBoxEventMine_("mine_jailer02", false);
			g_mine_jailer04 = SetPointBoxEventMine_("mine_jailer04", false);
			g_mine_jailer05 = SetPointBoxEventMine_("mine_jailer05", false);
		}
		if (prison_num == GetFlagID_("CONST_SS_PR_RESISTANCE_RUKIYA")) {				// Num6 = 15
			g_mine_jailer06 = SetPointBoxEventMine_("mine_jailer06", false);
		}
	}
	
	//-------------------------
	// �����A�N�^�[�|�C���g�z�u
	//-------------------------
	// ���낤��̃J�M
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {									// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_BLAST_EXPLANATION_3RD")) {			// Num6 = 18
			if (!bit_get_jail_key) {
				g_rec_point_02 = ArrangeMsgReactorPoint("rec_point_02", GetFlagID_("BFG_REACTER_POINT_179")// Bit_1678 �낤��̃J�M
					, SHORT_DIST, "REC_POINT_01", "REC_POINT_02");
			}
		}
	}
	
	//---------------------
	// ���i�r�}�b�v�A�C�R��
	//---------------------
	// ���S�K ���A�C�R���E�G���A�`�F���W�̕\���ؑ�
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {									// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_RESISTANCE_RUKIYA")) {					// Num6 < 15
			//
		} else {
			SetEventFlg_("BFG_OPEN_PRISON_4F", true);		// Bit_1211 �č��S�K ���J�ʃt���O
		}
	} else {
		SetEventFlg_("BFG_OPEN_PRISON_4F", true);			// Bit_1211 �č��S�K ���J�ʃt���O
	}
	
	
	// ���Q�E�R�K ���A�C�R���̕\���ؑ�
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {									// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_BLAST_STRATEGY")) {					// Num6 < 20
			//
		} else {
			SetEventFlg_("BFG_OPEN_PRISON_2F_TO_3F", true);	// Bit_1220 �č��Q�E�R�K ���J�ʃt���O
		}
	} else {
		SetEventFlg_("BFG_OPEN_PRISON_2F_TO_3F", true);		// Bit_1220 �č��Q�E�R�K ���J�ʃt���O
	}
	
	
	// ���u�I�v
	// ���L���Ƃ̑҂����킹�ꏊ
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {									// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_RESISTANCE_RUKIYA")) {				// Num6 = 15
			g_exclamation07 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "npc_rukiya000");
		}
		else{
			// �u�I�v�A�C�R��������
			SetNaviMapIconVisible_(g_exclamation07, false);
		}
	}
	// �낤��̃J�M
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {									// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_BLAST_EXPLANATION_3RD")) {			// Num6 = 18
			if (!bit_get_jail_key) {
				g_exclamation06 <- ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "mine_jail_key");
			}
		}
	}
	
	
	
	

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
	
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {									// Num0 = 5
		// ���T�K�̍L�Ԃ�ڎw���Ă��鎞�̃��A�N�^�[���b�Z�[�W
		if (prison_num == GetFlagID_("CONST_SS_PR_MEETING_02")) {						// Num6 = 13
			local bit_rec_msg = GetEventFlg_("BFG_DISPLAYED_LEADING_5F_MSG_4F");		// Bit_1235 ���A�N�^�[�̗U��MSG���Đ�����
			if (!bit_rec_msg){
				SetEventFlg_("BFG_DISPLAYED_LEADING_5F_MSG_4F", true);					// Bit_1235 ���A�N�^�[�̗U��MSG���Đ�����
				
				// �K�i��o�肫��܂ő҂�
				Wait_(25);
				SetMotion_(player, MOT_WAIT, BLEND_XL);
				Wait_(BLEND_XL);
				
				// ���A�N�^�[�����t�����b�Z�[�W
				CommReactorActionNotice();	// ���A�N�^�[���������������̋��ʏ���
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_REACTOR");
				ShowMsg_("REACTER_MSG_000");		// �u�T�K�ɂā@�F�D�I�ȁ@���A�N�^�[��������B
				KeyInputWait_();
				CloseMsgWnd_();
				CommResetPlayerMotion();	// ���[�V������ҋ@��Ԃɖ߂����ʏ���
				//WaitFade_();
			}
		}
		// ��Demo414[���j���̐����A]�i�}�U�[���f���j�Đ�
		if (prison_num == GetFlagID_("CONST_SS_PR_BLAST_EXPLANATION_1ST")) {			// Num6 = 16
			SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_PR_BLAST_EXPLANATION_2ND"));	// Num6 <- 17
			EventStartChangeDemo(414, FADE_COLOR_BLACK); // 414[���j���̐����A]�i�}�U�[���f���j
		}
		// ��Demo415[���j���̐����B]�i���L���̕����j�Đ�
		else if (prison_num == GetFlagID_("CONST_SS_PR_BLAST_EXPLANATION_2ND")) {		// Num6 = 17
			SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_PR_BLAST_EXPLANATION_3RD"));	// Num6 <- 18
			// �f���Đ���̕��A�ʒu
			SetReturnDemoPosDir_(Vec3(476.6, 0, -321.2), -88);
			EventStartChangeDemo(415, FADE_COLOR_BLACK);// 415[���j���̐����B]�i���L���̕����j
		}
		
		// ���C�x���g��[�퓬���C�h�`���[�g���A����]
		else if (prison_num == GetFlagID_("CONST_SS_PR_BLAST_STRATEGY")) {				// Num6 = 20
			local bit_tutorial_ride_saw = GetEventFlg_("BFG_WATCHED_BATTLE_RIDE_DEMO");	// Bit_1224 �퓬���C�h�`���[�g���A��������
			if (!bit_tutorial_ride_saw){
				local bit_tutorial_ride = GetEventFlg_("BFG_TUTORIAL_RIDE");			// Bit_50 �퓬���C�h�`���[�g���A����
				if (!bit_tutorial_ride){
					SetEventFlg_("BFG_RIDE_LICENSE_BATTLE", true);						// Bit_60 �퓬���C�h���C�Z���X
					
					SetEventFlg_("BFG_TUTORIAL_RIDE", true);							// Bit_50 �퓬���C�h�`���[�g���A����
					
					SetEventFlg_("BFG_WATCHED_BATTLE_RIDE_DEMO", true);					// Bit_1224 �퓬���C�h�`���[�g���A��������
					
					SetEventFlg_("BFG_TRAVEL_INFO_SHOW_032", true);						// Bit_532 ���̐S��	�y�퓬�z�퓬���C�h
					// ���C�h�`���[�g���A����
					ChangeBattleParty_(2);
				}
			}
			else{
				// ���^���f��[�퓬���C�h�`���[�g���A���I��]
				local bit_demo = GetEventFlg_("BFG_PLAYED_BATTLE_RIDE_DEMO");			// Bit_1223 �^���f��[�퓬���C�h�`���[�g���A���I��]������
				if (!bit_demo){
					// �^���f����BGM�𓪑ł��ɂ���t���O
					SetEventFlg_("BFG_RETURN_BATTLE_FIRLD_BGM_HEAD", true);
					// ��ʂ�1�t���ňÓ]
					CommChangeMomentFadeOut(FADE_COLOR_BLACK)
					// �J������ݒu
					SetPointCameraEye_("cameye_001");
					SetPointCameraTarget_("camtgt_001");
					Wait_(15);
					
					// �Ó]���̎d����
					SetEventFlg_("BFG_PLAYED_BATTLE_RIDE_DEMO", true);					// Bit_1223 �^���f��[�퓬���C�h�`���[�g���A���I��]������
					local player = GetPlayerId_();
					local nod_p = ReadMotion_(player, "Player_nod");					// �ҋ@�����������遨�ҋ@
					SetVisible(player, true);
					
					// ���ʂ̃t�F�[�h�C��
					SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
					WaitFade_();
					
					// ���L����b���[�V����
					SetMotion_(g_npc_rukiya, MOT_TALKLOOP, BLEND_XL);
					// ���b�Z�[�W
					OpenMsgWnd_();
					SetTalkName_("NAME_TAG_RUKIYA");
					ShowMsg_("NPC_RUKIYA_MSG_120");		// �u�`���[�g���A�����@�I����������B
					KeyInputWait_();
					CloseMsgWnd_();
					// ���L���ҋ@���[�V����
					SetMotion_(g_npc_rukiya, MOT_WAIT, BLEND_XL);
					Wait_(10);
					
					// ��l�����Ȃ������[�V�������ҋ@���[�V����
					SetMotion_(player, nod_p, BLEND_L);	// ���ȂÂ���l��
					WaitMotion(player);					// ���ȂÂ��҂�
					SetMotion_(player, MOT_WAIT, BLEND_L);
					Wait_(10);
					
					// ���L����b���[�V����
					SetMotion_(g_npc_rukiya, MOT_TALKLOOP, BLEND_XL);
					// ���b�Z�[�W
					OpenMsgWnd_();
					SetTalkName_("NAME_TAG_RUKIYA");
					ShowMsg_("NPC_RUKIYA_MSG_121");		// �u���񂤂�@����ł����B
					KeyInputWait_();
					CloseMsgWnd_();
					Wait_(5);
					
					// �J������ݒu
					SetPointCameraEye_("cameye_002");
					SetPointCameraTarget_("camtgt_002");
					
					Wait_(5);
					// ���b�Z�[�W
					OpenMsgWnd_();
					SetTalkName_("NAME_TAG_RUKIYA");
					ShowMsg_("NPC_RUKIYA_MSG_122");		// �u�u���C�N���������u���@���j���邽�߂�
					KeyInputWait_();
					CloseMsgWnd_();
					// ���L���ҋ@���[�V����
					SetMotion_(g_npc_rukiya, MOT_WAIT, BLEND_XL);
					//�v���C�A�u���ɕ��A������
					uPlayableReset(451.87, 0.0, -319.5, 75);
				}
			}
		}
	}
	
	// ���C�x���g��[�퓬���C�h�`���[�g���A����]������
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {						// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_BLAST_STRATEGY")) {		// Num6 = 20
			local bit_tutorial_ride = GetEventFlg_("BFG_TUTORIAL_RIDE");	// Bit_50 �퓬���C�h�`���[�g���A����
			if (bit_tutorial_ride){
				if (GetBattleEndType_() == BATTLE_END_TYPE_WIN){
					SetEventFlg_("BFG_TUTORIAL_RIDE", false);				// Bit_50 �퓬���C�h�`���[�g���A����
				}
			}
		}
	}
	
	EventEnd_();
}


//------------------------------------------------
//		�m�o�b��b���O
//------------------------------------------------
function BeforeTalkNpc()
{
	local target = GetTargetId_();
	
	//------------------------------------
	// ���C�h���̉�b�J�����I�t�Z�b�g�ݒ�
	//------------------------------------
	// �����L��
	if(target == g_npc_rukiya){
		SetRideTalkCamOffset(OFFSET_RUKIYA);
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
	
	DebugPrint(" ");
	DebugPrint("ID: " + target + " �ɐڐG [TouchNpc]");
	
	switch (target) {
	case g_npc_rukiya :
		uTalkRukiya();
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
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");			// Num0
	prison_num	 = GetNumFlg_("NUM_SCENARIO_SUB_PRISON");	// Num6
	
	local target = GetTouchEventMineId_();
	
	DebugPrint(" ");
	DebugPrint("ID: " + target + " �ɐڐG [TouchEventMine]");
	
	switch (target) {
	case g_mine_demo413 :
		uMineDemo413Start();
		break;
	case g_mine_jail_key :
		uMineJailKey();
		break;
	case g_mine_door01 :
		uMineDoor01();
		break;
	case g_mine_door02 :
		uMineDoor02();
		break;
	case g_mine_door03 :
		uMineDoor03();
		break;
	case g_mine_door04 :
		uMineDoor04();
		break;
	case g_mine_door05 :
		uMineDoor05();
		break;
	case g_mine_door06 :
		uMineDoor06();
		break;
	case g_mine_jailer02 :
		uMineJailer02();
		break;
	case g_mine_jailer04 :
		uMineJailer04();
		break;
	case g_mine_jailer05 :
		uMineJailer05();
		break;
	case g_mine_jailer06 :
		uMineJailer06();
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
//		���L�� ��b����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkRukiya()
{
	local bit_talk_rukiya = GetEventFlg_("BFG_TALK_RUKIYA_FIRST");				// Bit_1205 ���L���ɘb��������
	
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {							// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_JAIL_OPEN")) {					// Num6 < 19
			local bit_get_jail_key = GetEventFlg_("BFG_GET_KEY_OF_JAIL");		// Bit_1204 �낤��̃J�M�����
			// �낤��̃J�M�������Ă��Ȃ��ꍇ
			if (!bit_get_jail_key) {
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_RUKIYA");
				ShowMsg_("NPC_RUKIYA_MSG_110");			// �u�R���b�I�@�ȁ[�Ƀ`���^������Ă񂾂��I
				KeyInputWait_();
				CloseMsgWnd_();
			}
			// �낤��̃J�M�������Ă���ꍇ
			else {
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_RUKIYA");
				ShowMsg_("NPC_RUKIYA_MSG_110_2");		// �u�������I�@�����@���񂽂��Ďq�́I
				KeyInputWait_();
				CloseMsgWnd_();
			}
		}
		else if (prison_num == GetFlagID_("CONST_SS_PR_JAIL_OPEN")) {			// Num6 = 19
			SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_PR_BLAST_STRATEGY"));	// Num6 <- 20
			// ���[���֎~����
			SetEventFlg_("BFG_PLAYERABILITY_RULER_PROHIBIT", false);			// Bit_440 ���[���֎~
			// �f���Đ���̎�l���̕��A�ʒu
			SetReturnDemoPosDir_(Vec3(471.251, 0.0, -318.693), 90);
			// Demo416[�������u���j���]�Đ�
			TouchNpcChangeDemo(416);
		}
		else if (prison_num == GetFlagID_("CONST_SS_PR_BLAST_STRATEGY")) {		// Num6 = 20
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_RUKIYA");
			ShowMsg_("NPC_RUKIYA_MSG_125");				// �u�u���C�N���������u���@���j���邽�߂�
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		Demo413�N���n���ɐG�ꂽ��
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineDemo413Start()
{
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {									// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_RESISTANCE_RUKIYA")) {				// Num6 = 15
			SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_PR_BLAST_EXPLANATION_1ST"));	// Num6 <- 16
			// �f���Đ���̕��A�ʒu
			SetReturnDemoPosDir_(Vec3(459.6, 0, -313), 83);
			// Demo413[���j���̐����@]�i���L���̕����j�Đ�
			TouchNpcChangeDemo(413);
		}
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�낤��̃J�M�̒n���ɐG�ꂽ��
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineJailKey()
{
	local player = GetPlayerId_();

	local pos  = Vec3(-222.0, 0.0, 402.7);
	uPlayerTurnAroundPos(pos);
	
	SetEventFlg_("BFG_GET_KEY_OF_JAIL", true);		// Bit_1204 �낤��̃J�M�����
	DeleteEventMine_(g_mine_jail_key);				// �n�����폜
	DeleteEffect_(g_efc_item_sign);					// �G�t�F�N�g���폜
	SetVisible(g_rec_point_02, false);				// ���A�N�^�[�|�C���g���\��
	
	SetNaviMapIconVisible_(g_exclamation06, false);	// �u�I�v�A�C�R��������
	
	AddItemAndMsg(955, 1, true);					// �낤��̃J�M
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		���ʔ��n���@�ɐG�ꂽ��
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineDoor01()
{
	uTouchDoorMsg(g_gmk_door01);
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		���ʔ��n���A�ɐG�ꂽ��
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineDoor02()
{
	uTouchDoorMsg(g_gmk_door02);
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		���ʔ��n���B�ɐG�ꂽ��
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineDoor03()
{
	uTouchDoorMsg(g_gmk_door03);
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		���ʔ��n���C�ɐG�ꂽ��
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineDoor04()
{
	uTouchDoorMsg(g_gmk_door04);
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		���ʔ��n���D�ɐG�ꂽ��
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineDoor05()
{
	uTouchDoorMsg(g_gmk_door05);
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		�O�֏o����̒n���ɐG�ꂽ��
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineDoor06()
{
	local pos  = Vec3(-523.3, 5.0, 0.0);
	uPlayerTurnAroundPos(pos);
	OpenMsgWnd_();
	ShowMsg_("SYSTEM_MSG_999");		// ���́@�������@������Ă���B
	KeyInputWait_();
	CloseMsgWnd_();
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//	���[�J���֐� ���ʔ��̃��b�N���̃��b�Z�[�W
//------------------------------------------------
//	����	: �M�~�b�N�h�c
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTouchDoorMsg(gmk_id)
{
	CommPlayerTurnAroundObj(gmk_id);
	OpenMsgWnd_();
	ShowMsg_("SYSTEM_MSG_999");		// ���́@�������@������Ă���B
	KeyInputWait_();
	CloseMsgWnd_();
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		���A�N�^�[�x�����b�Z�[�W�n���A�ɐG�ꂽ��
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineJailer02()
{
	//���A�N�^�[���b�Z�[�W
	CommReactorActionNotice();			// ���A�N�^�[���������������̋��ʏ���
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_REACTOR");	// ���A�N�^�[
	ShowMsg_("REACTER_MSG_001");		// �u�댯�x�̍����@�����X�^�[�̔������@����܂��B
	KeyInputWait_();
	CloseMsgWnd_();
	CommResetPlayerMotion();			// ���[�V������ҋ@��Ԃɖ߂����ʏ���
	Wait_(5);
	
	// �o�b�N���Ĉړ�
	CommPlayerTurnMoveDirWalk(180);
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		���A�N�^�[�x�����b�Z�[�W�n���C�ɐG�ꂽ��
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineJailer04()
{
	//���A�N�^�[���b�Z�[�W
	CommReactorActionNotice();			// ���A�N�^�[���������������̋��ʏ���
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_REACTOR");	// ���A�N�^�[
	ShowMsg_("REACTER_MSG_001");		// �u�댯�x�̍����@�����X�^�[�̔������@����܂��B
	KeyInputWait_();
	CloseMsgWnd_();
	CommResetPlayerMotion();			// ���[�V������ҋ@��Ԃɖ߂����ʏ���
	Wait_(5);
	
	// �o�b�N���Ĉړ�
	CommPlayerTurnMoveDirWalk(180);
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		���A�N�^�[�x�����b�Z�[�W�n���D�ɐG�ꂽ��
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineJailer05()
{
	//���A�N�^�[���b�Z�[�W
	CommReactorActionNotice();			// ���A�N�^�[���������������̋��ʏ���
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_REACTOR");	// ���A�N�^�[
	ShowMsg_("REACTER_MSG_001");		// �u�댯�x�̍����@�����X�^�[�̔������@����܂��B
	KeyInputWait_();
	CloseMsgWnd_();
	CommResetPlayerMotion();			// ���[�V������ҋ@��Ԃɖ߂����ʏ���
	Wait_(5);
	
	// �o�b�N���Ĉړ�
	CommPlayerTurnMoveDirWalk(0);
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		���A�N�^�[�x�����b�Z�[�W�n���E�ɐG�ꂽ��
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineJailer06()
{
	// �R�l�N�e�B�u���[�h�J�n
//	OpenConnective("connective_rukiya");
//	Wait_(30);
	
	//���A�N�^�[���b�Z�[�W
	CommReactorActionNotice();			// ���A�N�^�[���������������̋��ʏ���
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_REACTOR");
	ShowMsg_("REACTER_MSG_004");		// �u�G�΃����X�^�[�́@����������܂��B
	KeyInputWait_();
	CloseMsgWnd_();
	CommResetPlayerMotion();			// ���[�V������ҋ@��Ԃɖ߂����ʏ���
	Wait_(5);
	
	// �R�l�N�e�B�u���[�h�I��
//	CloseConnective();
	
	// �o�b�N���Ĉړ�
	CommPlayerTurnMoveDirWalk(-90);
}

//++++++++++++++++++++++++++++++++++++++++++++++++++++++
// �i���֎~�n���ɐG�ꂽ���A�����Ԃ�����
//------------------------------------------------------
// �������F���ꂽ���z�u���̍��W
// �������F�ړ��t���[����(�f�t�H���g����:30F)
// �߂�l  �F�Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++++++++
function uPlayerTurnMoveDirWalk(npc, move_frame = 30)
{
	local player	 = GetPlayerId_();
	local task_walk	 = Task_MoveForward_(player, 1.0, false);

	SetDirToPos_(player, GetPos_(npc));
	local dir = GetDir_(player);
	SetMotion_(player, MOT_WALK, BLEND_N);
	SetDir_(player, dir+180);
	Wait_(move_frame);
	DeleteTask_(task_walk);
}


//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//		�w�肵�����W�ɕ����Ȃ���U���������
//---------------------------------------------------------------------------
// �������F�w�肵�����W(Vec3)
// �߂�l  �F�Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function uPlayerTurnAroundPos(pos)
{
	local player    = GetPlayerId_();
	// �Ώە��̕����ɉ�](1F��11.4������])
	local rotateTask = Task_RotateToPosSetMotion_(player, Vec3(pos.x, pos.y, pos.z), ROTATE_EVENT_DEF MOT_WALK, MOT_WAIT);
	WaitTask(rotateTask);
	// �Ԃ���������
	Wait_(15);
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�v���C���[���w��̈ʒu�ɕ��A������
//------------------------------------------------
//	����	: xpos	X���W
//			: ypos	Y���W
//			: zpos	Z���W
//			: dir	��]�l
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uPlayableReset(xpos, ypos, zpos, dir)
{
	local player;
	player = GetPlayerId_();	// �v���C���[ID�擾
	
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
	
	SetVisible(player, true);
	SetPos_(player, Vec3(xpos, ypos, zpos));
	SetDir_(player, dir);
	
	SetPlayableCamera_();
	SetCameraDir_(dir);
	Wait_(10);
	
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
}


