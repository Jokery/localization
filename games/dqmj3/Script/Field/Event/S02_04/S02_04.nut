//===================== S02_04�C�b�^�u���č� 5F ====================

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
	
	// �� ���[���֎~
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_SALVATION_VOICE")) {				// Num6 = 14
			SetEventFlg_("BFG_PLAYERABILITY_RULER_PROHIBIT", true);					// Bit_440 ���[���֎~
		}
	}
	
	// ���ʍ��̊ԂɃ����X�^�[��z�u���Ȃ�
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_BLAST_EXPLANATION_1ST")) {			// Num6 < 16
			SetEventFlg_("BFG_LIMIT_5F_THRONE_ROOM", false);					// Bit_1230 �ʍ��̊ԂɃ����X�^�[��z�u
		} else {
			SetEventFlg_("BFG_LIMIT_5F_THRONE_ROOM", true);				// Bit_1230 �ʍ��̊ԂɃ����X�^�[��z�u
		}
	} else {
		SetEventFlg_("BFG_LIMIT_5F_THRONE_ROOM", true);					// Bit_1230 �ʍ��̊ԂɃ����X�^�[��z�u
	}
	
	// ���_�N�g���甲�����Ƃ���̃��L�����ӂɃ����X�^�[��z�u���Ȃ�
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_RESISTANCE_RUKIYA")) {			// Num6 = 15
			SetEventFlg_("BFG_LIMIT_5F_DUCT", false);						// Bit_1229 ���L�����ӂɃ����X�^�[��z�u
		} else {
			SetEventFlg_("BFG_LIMIT_5F_DUCT", true);						// Bit_1229 ���L�����ӂɃ����X�^�[��z�u
		}
	} else {
		SetEventFlg_("BFG_LIMIT_5F_DUCT", true);							// Bit_1229 ���L�����ӂɃ����X�^�[��z�u
	}
	
	// �����̕ǂ̑O�Ƀ����X�^�[��z�u���Ȃ�
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_RUKIYA_SIGNPOST")) {				// Num6 = 29
			SetEventFlg_("BFG_LIMIT_5F_PHANTOM_WALL", false);				// Bit_1228 ���̕ǂ̑O�Ƀ����X�^�[��z�u
		} else {
			SetEventFlg_("BFG_LIMIT_5F_PHANTOM_WALL", true);				// Bit_1228 ���̕ǂ̑O�Ƀ����X�^�[��z�u
		}
	} else {
		SetEventFlg_("BFG_LIMIT_5F_PHANTOM_WALL", true);					// Bit_1228 ���̕ǂ̑O�Ƀ����X�^�[��z�u
	}
	
	//----------
	// ��NPC�z�u
	//----------
	// ID������
	g_npc_rukiya		 <- C_NONE_ID;
	
	// �����L��
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_RESISTANCE_RUKIYA")) {			// Num6 = 15
			local id_rukiya	 = ReadNpc_("n009");		// ���L��
			g_npc_rukiya	 = ArrangePointNpc_(id_rukiya, "npc_rukiya000");
			SetReactorMsg_(g_npc_rukiya, "REC_NPC_RUKIYA");
		}
	}
	
	//-----------
	// ���n���z�u
	//-----------
	// BitFlag�擾
	local bit_pass_secret	 = GetEventFlg_("BFG_SECRET_PRISON_ROOM");		// Bit_1209 �B�������I�[�v��
	local bit_open_door		 = GetEventFlg_("BFG_OPEN_PRISON_CONTROL_ROOM");// Bit_1221 ���䕔�����I�[�v��
	
	// ID������
	g_mine_demo411		 <- C_NONE_ID;
	g_mine_demo412		 <- C_NONE_ID;
	g_mine_demo423		 <- C_NONE_ID;
	g_mine_duct			 <- C_NONE_ID;
	g_mine_no_entry		 <- C_NONE_ID;
	g_mine_no_entry02	 <- C_NONE_ID;
	g_mine_secret_near	 <- C_NONE_ID;
	g_mine_secret_enter	 <- C_NONE_ID;
	g_mine_control_room	 <- C_NONE_ID;
	g_mine_elevator		 <- C_NONE_ID;
	g_mine_jailer01		 <- C_NONE_ID;
	g_mine_jailer02		 <- C_NONE_ID;
	
	// ��Demo411�N���n��
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_MEETING_02")) {					// Num6 = 13
			g_mine_demo411 = SetPointBoxEventMine_("mine_demo411", false);
		}
	}
	
	// ��Demo412�N���n��
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_SALVATION_VOICE")) {				// Num6 = 14
			g_mine_demo412 = SetPointCircleEventMine_("mine_demo412", true);
		}
	}
	
	// ��Demo423�N���n��
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_RUKIYA_SIGNPOST")) {				// Num6 = 29
			g_mine_demo423 = SetPointCircleEventMine_("mine_demo423", true);
		}
	}
	
	// ���_�N�g
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num > GetFlagID_("CONST_SS_PR_SALVATION_VOICE")) {				// Num6 > 14
			g_mine_duct = SetPointCircleEventMine_("mine_duct", true);
		}
	}
	else if (main_num > GetFlagID_("CONST_SM_PRISON")) {							// Num0 > 5
		g_mine_duct = SetPointCircleEventMine_("mine_duct", true);
	}
	
	// ���ʍ��̊Ԃ̏o���t�߂̐i���֎~
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_SALVATION_VOICE")) {				// Num6 = 14
			g_mine_no_entry = SetPointBoxEventMine_("mine_no_entry", false);
		}
	}
	
	// ���ʍ��̊ԑ��̒ʘH�̐i���֎~
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_RESISTANCE_RUKIYA")) {			// Num6 = 15
			g_mine_no_entry02 = SetPointBoxEventMine_("mine_no_entry02", false);
		}
	}
	
	// ���B�����������t�߂̒n��
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_RUKIYA_SIGNPOST")) {				// Num6 = 29
			if (!bit_pass_secret) {		// Bit_1209 �B�������I�[�v��
				g_mine_secret_near = SetPointBoxEventMine_("mine_secret_near", false);
			}
		}
	}
	
	// ���B������ ����
	if (!bit_pass_secret){
		g_mine_secret_enter = SetPointBoxEventMineNoFallWait_("mine_secret_enter");
	}
	
	// �����䕔�����̒n��
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num <= GetFlagID_("CONST_SS_PR_RUKIYA_SIGNPOST")) {				// Num6 =< 29
			if (!bit_open_door) {		// Bit_���䕔�����I�[�v��
				g_mine_control_room = SetPointCircleEventMine_("mine_control_room", true);
			}
		}
	}
	
	// ���G���x�[�^�[�̃}�b�v�`�F���W�n��
	g_mine_elevator = SetPointBoxEventMine_("mine_elevator", true);

	// �����A�N�^�[�x�����b�Z�[�W1�n��
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_RESISTANCE_RUKIYA")) {			// Num6 = 15
			g_mine_jailer01 = SetPointBoxEventMine_("mine_jailer01", false);
		}
	}

	// �����A�N�^�[�x�����b�Z�[�W�A�n��
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_MEETING_02")) {					// Num6 = 13
			g_mine_jailer02 = SetPointBoxEventMine_("mine_jailer02", false);
		}
	}

	//---------------
	// ���M�~�b�N�z�u
	//---------------
	// ID������
	g_gmk_elevator_door		 <- C_NONE_ID;
	g_gmk_elevator_lift		 <- C_NONE_ID;
	g_gmk_door				 <- C_NONE_ID;
	g_gmk_door02			 <- C_NONE_ID;
	
	// ���\�[�X�ǂݍ���
	local id_elevator_door	 = ReadGimmick_("o_S02_01");		// �G���x�[�^�[�̔�
	local id_elevator_lift	 = ReadGimmick_("o_S02_00");		// �G���x�[�^�[���t�g
	
	// ���G���x�[�^�[�̔�
	g_gmk_elevator_door = ArrangePointGimmick_("o_S02_01", id_elevator_door, "gmk_elevator_door");

	// ���G���x�[�^�[���t�g
	g_gmk_elevator_lift = ArrangePointGimmick_("o_S02_00", id_elevator_lift, "gmk_elevator_lift");

	// �����ʔ�
	if(!bit_open_door){
		local id_door	 = ReadGimmick_("o_S02_11");		// ���ʔ�
		g_gmk_door		 = ArrangePointGimmick_("o_S02_11", id_door, "gmk_door");
	}
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_BLAST_EXPLANATION_1ST")) {		// Num6 < 16
			local id_door	 = ReadGimmick_("o_S02_11");	// ���ʔ�
			g_gmk_door02	 = ArrangePointGimmick_("o_S02_11", id_door, "gmk_door02");
			SetMotion_(g_gmk_door02, MOT_GIMMICK_4, BLEND_N);
		}
	}
	// ���R���g���[���p�l���d���i���Łj
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_RUKIYA_SIGNPOST")) {				// Num6 = 29
			local id_panel = ReadGimmick_("o_S02_24");
			local gmk_panel = ArrangePointGimmick_("o_S02_24", id_panel, "gmk_panel");
		}
	}

	//-------------------------
	// �����A�N�^�[�|�C���g�z�u
	//-------------------------
	// ���^���p�G���x�[�^�[
	local reactorPoint01 = ArrangeMsgReactorPoint("recpoint_01_erevator", GetFlagID_("BFG_REACTER_POINT_075")// Bit_1574 �^���p�G���x�[�^�[
		, SHORT_DIST, "REC_POINT_01", "REC_POINT_01_2");
	
	// ���t�^���O�ꂽ�ʋC���P�|�Q
	local reactorPoint02 = ArrangeMsgReactorPoint("recpoint_02_duct01", GetFlagID_("BFG_REACTER_POINT_079")// Bit_1578 �t�^���O�ꂽ�ʋC��
		, SHORT_DIST, "REC_POINT_02", "REC_POINT_02_2");
	
	local reactorPoint02_2 = ArrangeMsgReactorPoint("recpoint_02_duct02", GetFlagID_("BFG_REACTER_POINT_079")// Bit_1578 �t�^���O�ꂽ�ʋC��
		, SHORT_DIST, "REC_POINT_02", "REC_POINT_02_2");
	
	// ���Ïؔ�
	if (bit_pass_secret) {		// Bit_1209 �B�������I�[�v��
		if(!bit_open_door){
			g_reactorPoint03 <- ArrangeMsgReactorPoint("recpoint_03_door", GetFlagID_("BFG_REACTER_POINT_080")// Bit_1579 �Ïؔ�
				, SHORT_DIST, "REC_POINT_03", "REC_POINT_03_2");
		}
	}
	
	//-------------------------
	// ���i�r�}�b�v�A�C�R���z�u
	//-------------------------
	// ���u�I�v
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_SALVATION_VOICE")) {				// Num6 = 14
			local exclamation01 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "mine_duct");  // �_�N�g
		}
	}

	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_RUKIYA_SIGNPOST")) {				// Num6 = 29
			if (bit_pass_secret) {		// Bit_1209 �B�������I�[�v��
				if (!bit_open_door) {		// Bit_���䕔�����I�[�v��
					g_exclamation03 <- ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "gmk_door");  // ���ʔ�
				}
			}
		}
	}

	// ��Demo423�N���n��
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_RUKIYA_SIGNPOST")) {				// Num6 = 29
			if (bit_pass_secret) {		// Bit_1209 �B�������I�[�v��
				g_exclamation04 <- ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "mine_demo423");  // Demo423�N���n��
			}
		}
	}

	// ���G���x�[�^�[�̃}�b�v�`�F���W���̃t���O�𗧂Ă�
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_INVULNERABILITY_PLAYER")) {		// Num6 < 28
			SetEventFlg_("BFG_LIMIT_3F_CENTER_PATHWAY", false);				// Bit_1226 �C�b�^�u�����j�i�����̒ʘH���ӂɃ����X�^�[��z�u�j
		} else {
			SetEventFlg_("BFG_LIMIT_3F_CENTER_PATHWAY", true);				// Bit_1226 �C�b�^�u�����j�i�����̒ʘH���ӂɃ����X�^�[��z�u�j
		}
	} else {
		SetEventFlg_("BFG_LIMIT_3F_CENTER_PATHWAY", true);					// Bit_1226 �C�b�^�u�����j�i�����̒ʘH���ӂɃ����X�^�[��z�u�j
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
	
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {									// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_LAST_ANSESU_1ST")) {					// Num6 = 30
			SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_PR_LAST_ANSESU_2ND"));			// Num6 <- 31
			
			// Demo424[�A���Z�X�̍Ō�A]�i�ߋ��f���j�Đ�
			SetFade_(FADE_OUT, FADE_COLOR_WHITE, FADE_SHORT);
			SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
			WaitFade_();

			ChangeDemo_(424); 
		}
		else if (prison_num == GetFlagID_("CONST_SS_PR_LAST_ANSESU_2ND")) {				// Num6 = 31
			SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_PR_LAST_ANSESU_6TH"));			// Num6 <- 35
			
			SetReturnDemoPosDir_(Vec3(240.802, 0.0, -430.995), 180);
			// Demo425[�A���Z�X�̍Ō�B]�i���䑕�u�̕����j�Đ�
			SetFade_(FADE_OUT, FADE_COLOR_WHITE, FADE_SHORT);
			SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
			WaitFade_();

			ChangeDemo_(425); 
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
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");
	prison_num	 = GetNumFlg_("NUM_SCENARIO_SUB_PRISON");
	
	local target = GetTouchEventMineId_();
	
	DebugPrint("ID: " + target + " �ɐڐG [TouchEventMine]");
	
	switch (target) {
	case g_mine_demo411 :
		uMineDemo411Start();
		break;
	case g_mine_demo412 :
		uMineDemo412Start();
		break;
	case g_mine_demo423 :
		uMineDemo423Start();
		break;
	case g_mine_duct :
		uMineDuct();
		break;
	case g_mine_no_entry :
		uMineNoEntry();
		break;
	case g_mine_no_entry02 :
		uMineNoEntry02();
		break;
	case g_mine_secret_near :
		uMineSecretNear();
		break;
	case g_mine_secret_enter :
		uMineSecretEntrance();
		break;
	case g_mine_control_room :
		uMineControlRoom();
		break;
	case g_mine_elevator :
		uMineElevator();
		break;
	case g_mine_jailer01 :
		uMineJailer01();
		break;
	case g_mine_jailer02 :
		uMineJailer02();
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
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_RESISTANCE_RUKIYA")) {			// Num6 = 15
			SetTalkCameraType_(g_npc_rukiya, TALK_CAMERA_UP);//�J�����̐ݒ�
			// ��b�J�������ɓ��߂����̂ŃA���t�@�l��ݒ肷��
			SetManualCalcAlpha_(g_npc_rukiya, true);
			SetAlpha_(g_npc_rukiya, 1.0);
			
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_RUKIYA");	//���L��
			ShowMsg_("NPC_RUKIYA_MSG_100");		// �u�S�K�̉E��� �󂫕���������B
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		Demo411�N���n���ɐG�ꂽ��
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineDemo411Start()
{
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_MEETING_02")) {					// Num6 = 13
			SetEventFlg_("BFG_LIMIT_NPC_PERIPHERAL", true);		// Bit_1231 �ʘH����NPC����Ƀ����X�^�[��z�u
			// ���[���֎~
			SetEventFlg_("BFG_PLAYERABILITY_RULER_PROHIBIT", true);			// Bit_440 ���[���֎~
			SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_PR_SALVATION_VOICE"));		// Num6 <- 14
			
			// �f���Đ���̕��A�ʒu
			SetReturnDemoPosDir_(Vec3(-53.56, 60.0,-23.94), -10);
			
			// Demo411[�~���̐�]�Đ�
			TouchNpcChangeDemo(411);
		}
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		Demo412�N���n���ɐG�ꂽ��
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineDemo412Start()
{
	local player = GetPlayerId_();

	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_SALVATION_VOICE")) {				// Num6 = 14
			local pos  = Vec3(-131.0, 60.0, 133.0);
			uPlayerTurnAroundPos(pos);

			OpenMsgWnd_();
			ShowMsg_("SYSTEM_MSG_000");		// �_�N�g�̒��� ����܂����H
			KeyInputWait_();
			CloseMsgWnd_();
			
			// �u�͂��v
			if (GetQueryResult_() == QUERY2_0) {
				// ���[���֎~����������
				SetEventFlg_("BFG_PLAYERABILITY_RULER_PROHIBIT", false);				// Bit_440 ���[���֎~
				SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_PR_RESISTANCE_RUKIYA"));	// Num6 <- 15
				
				SetReturnDemoPosDir_(Vec3(-403.484, 0, -199.605), 0);
				
				// Demo412[���W�X�^���X�̃��L��]�Đ�
				TouchNpcChangeDemo(412);
			}
			// �u�������v
			else{
				// �����Ȃ�
			}
			
		}
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		Demo423�N���n���ɐG�ꂽ��
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineDemo423Start()
{
	SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_PR_LAST_ANSESU_1ST"));	// Num6 <- 28
	
	// Demo423[�A���Z�X�̍Ō�@]�i���̉f���j�Đ�
	TouchNpcChangeDemo(423);
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�_�N�g�𒲂ׂ���
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineDuct()
{
	local player = GetPlayerId_();
	local pos  = Vec3(-131.0, 60.0, 133.0);
	
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num > GetFlagID_("CONST_SS_PR_SALVATION_VOICE")) {				// Num6 > 14
			uPlayerTurnAroundPos(pos);

			OpenMsgWnd_();
			ShowMsg_("SYSTEM_MSG_000");		// �_�N�g�̒��� ����܂����H
			KeyInputWait_();
			CloseMsgWnd_();
			
			// �u�͂��v
			if (GetQueryResult_() == QUERY2_0) {
				SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
				SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
				WaitFade_();
				
				SetPos_(player, Vec3(-242, 0, -197));
				SetDir_(player, -142);
				Wait_(17);
				
				SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
				SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
				WaitFade_();
			}
			// �u�������v
			else {
				// �����Ȃ�
			}
		}
	}
	else if (main_num > GetFlagID_("CONST_SM_PRISON")) {							// Num0 > 5
		uPlayerTurnAroundPos(pos);

		OpenMsgWnd_();
		ShowMsg_("SYSTEM_MSG_000");		// �_�N�g�̒��� ����܂����H
		KeyInputWait_();
		CloseMsgWnd_();
		
		// �u�͂��v
		if (GetQueryResult_() == QUERY2_0) {
			SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
			SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
			WaitFade_();
			
			SetPos_(player, Vec3(-242, 0, -197));
			SetDir_(player, -142);
			Wait_(17);
			
			SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
			SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
			WaitFade_();
		}
		// �u�������v
		else {
			// �����Ȃ�
		}
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�ʍ��̊Ԃ̏o���t�߂̐i���֎~
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineNoEntry()
{
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ITABURU");	//�C�b�^�u��
	ShowMsg_("NPC_ITTABURU_MSG_090");	// �u��΂� �ǂ��l�߂�I
	KeyInputWait_();
	CloseMsgWnd_();
	
	OpenMsgWnd_();
	ShowMsg_("SYSTEM_MSG_001");			// �O�� �o��̂� �댯�̂悤���B
	KeyInputWait_();
	CloseMsgWnd_();

	CommPlayerTurnMoveDirWalk(0);
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�ʍ��̊ԑ��̒ʘH�̐i���֎~
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineNoEntry02()
{
	SetBoneEffect_("ef300_20_target_icon", g_npc_rukiya);	// �����G�t�F�N�g
	PlaySE_("SE_DEM_053");				//�u�s���I�v
	Wait_(15);

	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RUKIYA");	//���L��
	ShowMsg_("NPC_RUKIYA_MSG_101");		// �u�i���j�u�ǂ��s���񂾂��I
	KeyInputWait_();
	CloseMsgWnd_();
	
	CommPlayerTurnMoveDirWalk(-90);
	
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�B�������t�߂̒n���ɐG�ꂽ��
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineSecretNear()
{
	// �n���폜
	DeleteEventMine_(g_mine_secret_near);
	// ���A�N�^�[���������������̋��ʏ���
	CommReactorActionDiscover();
	// �V�X�e�����b�Z�[�W
	OpenMsgWnd_();
	ShowMsg_("SYSTEM_MSG_999");		// ���A�N�^�[���@�������Ă���B
	KeyInputWait_();
	CloseMsgWnd_();
	// ���[�V������ҋ@��Ԃɖ߂����ʏ���
	CommResetPlayerMotion();
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�B������ �����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineSecretEntrance()
{
	local bit_open_door		 = GetEventFlg_("BFG_OPEN_PRISON_CONTROL_ROOM");// Bit_1221 ���䕔�����I�[�v��

	SetEventFlg_("BFG_SECRET_PRISON_ROOM", true);		// Bit_1209 �B�������I�[�v��
	DeleteEventMine_(g_mine_secret_enter);
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_RUKIYA_SIGNPOST")) {				// Num6 = 29
			g_exclamation03 <- ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "gmk_door");  // �u�I�v���ʔ�
			g_exclamation04 <- ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "mine_demo423");  // �u�I�vDemo423�N���n��
		}
	}
	if(!bit_open_door){
		g_reactorPoint03 <- ArrangeMsgReactorPoint("recpoint_03_door", GetFlagID_("BFG_REACTER_POINT_080")// Bit_1579 �Ïؔ�
		, SHORT_DIST, "REC_POINT_03", "REC_POINT_03_2");
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		���䕔���̔��𒲂ׂ���
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineControlRoom()
{
	local player = GetPlayerId_();

	local pos  = Vec3(240.0, 0.0, -338.0);
	uPlayerTurnAroundPos(pos);
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_RUKIYA_SIGNPOST")) {				// Num6 = 29
			OpenMsgWnd_();
			ShowMsg_("SYSTEM_MSG_002");		// �u�}�X�^�[�L�[ �� �m�F�V�}�V�^�B
			KeyInputWait_();
			CloseMsgWnd_();
			
			// �Ó]
			SetFadePlane_(FADE_PLANE.PLANE_3D);//���b�Z�[�W��艺�Ƀt�F�[�h��������
			SetFade_(FADE_OUT , FADE_COLOR_BLACK, 30);
			SetFadeSub_(FADE_OUT , FADE_COLOR_BLACK, 30);
			WaitFade_();
			WaitFadeSub_();

			PlaySE_("SE_FLD_005");	// ���i�����ȓd�q���j
			
			OpenMsgWnd_();
			ShowMsg_("SYSTEM_MSG_003");		// �g�r���̃J�M�� �J�����I
			KeyInputWait_();
			CloseMsgWnd_();
			
			SetEventFlg_("BFG_OPEN_PRISON_CONTROL_ROOM", true);		// Bit_1221 ���䕔�����I�[�v��
			DeleteEventMine_(g_mine_control_room);
			
			SetActive_(g_gmk_door, false);	// �Ó]���ɐ��䕔����������
			SetActive_(g_reactorPoint03, false);	// ���A�N�^�[�|�C���g������
			SetNaviMapIconVisible_(g_exclamation03, false);	// �u�I�v�A�C�R��������
			//�Ó]���J����
			SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);
			SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, 30);
			WaitFade_();
			WaitFadeSub_();
		} else {
			OpenMsgWnd_();
			ShowMsg_("SYSTEM_MSG_996");		// �i���j���ɂ� ���b�N���������Ă���B
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�G���x�[�^�[�̒n���𒲂ׂ���
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineElevator()
{
	local player = GetPlayerId_();

	CommPlayerTurnAroundObj(g_gmk_elevator_lift);
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {							// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_ITTABURU_WIN")) {				// Num6 < 27
			OpenMsgWnd_();
			ShowMsg_("SYSTEM_MSG_998");				// �i���j�{�^���������Ă� �������Ȃ��B
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else {
			OpenMsgWnd_();
			ShowMsg_("SYSTEM_MSG_997");		//�i���j�G���x�[�^�[�� �����Ă���B
			KeyInputWait_();
			if(GetQueryResult_() == QUERY_YES){
				CloseMsgWnd_();

				DeleteEventMine_(g_mine_elevator);
				// �P�K�Ɉړ�
				ChangeMapPosDir_("S02_00", Vec3(0.7, 30.0, -340.0), 2);
				WaitFade_();
				PlaySE_("SE_FLD_061");	// �G���x�[�^�ňړ�
			}else{
				CloseMsgWnd_();
			}
		}
	}
	else if (main_num > GetFlagID_("CONST_SM_PRISON")) {						// Num0 > 5
		OpenMsgWnd_();
		ShowMsg_("SYSTEM_MSG_997");			//�i���j�G���x�[�^�[�� �����Ă���B
		KeyInputWait_();
		if(GetQueryResult_() == QUERY_YES){
			CloseMsgWnd_();

			DeleteEventMine_(g_mine_elevator);
			// �P�K�Ɉړ�
			ChangeMapPosDir_("S02_00", Vec3(0.7, 30.0, -340.0), 2);
			WaitFade_();
			PlaySE_("SE_FLD_061");	// �G���x�[�^�ňړ�
		}else{
			CloseMsgWnd_();
		}
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		���A�N�^�[�x�����b�Z�[�W�n���@�ɐG�ꂽ��
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineJailer01()
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
	CommPlayerTurnMoveDirWalk(-90);
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
	CommPlayerTurnMoveDirWalk(90);
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


