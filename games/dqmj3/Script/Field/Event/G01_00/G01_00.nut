//===================== G01_00�l�I���p�[�N ====================


//------------------------------------------------
//		�퓬�I����
//------------------------------------------------
function AfterBattle()
{
	// �t���O�̏�Ԃ��擾
	local main_num  = GetNumFlg_("NUM_SCENARIO_MAIN");			// Num0
	local grave_num = GetNumFlg_("NUM_SCENARIO_SUB_GRAVE");		// Num4
	
	/*
		�����Ȃ�
	*/
	
	EventEnd_();
}


//------------------------------------------------
//		�t�F�[�h�C��
//------------------------------------------------
function FadeIn()
{
	//�}�b�v���B�t���O
	SetEventFlg_("BFG_ARRIVE_AT_G01", true);
	// ���[���|�C���g
	SetEventFlg_("BFG_RULER_ADD_007", true);//�l�I���p�[�N���

	// �t���O�̏�Ԃ��擾
	local main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");						// Num0
	local grave_num	 = GetNumFlg_("NUM_SCENARIO_SUB_GRAVE");				// Num4
	local gost_a_num = GetNumFlg_("NUM_FLG_TRACKING_GHOST_STATE");			// Num127

	//-------------------------
	// ���}�b�v�`�F���WNULL����
	//-------------------------
	// ���k���̃}�b�v�`�F���WNULL
	if(grave_num == GetFlagID_("CONST_SS_CC_GO_TO_THE_NEON_PARK")){			// Num4 = 1
		SetHitEnableMapChangeNull_("w_G00_00BLdr_005", false);
	}else{
		SetHitEnableMapChangeNull_("w_G00_00BLdr_005", true);
	}
	
	//-------------
	// �����Ԃ̐ݒ�
	//-------------
	if(main_num == GetFlagID_("CONST_SM_CEMETERY")){						// Num0 = 3
		if(grave_num <= GetFlagID_("CONST_SS_CC_GET_RACE_PROGRAM")){		// Num4 = 17 �ȉ�
			// �V�i���I�i�s���͖�iᏋC�j�ɐݒ�
			SetTime_(8700);
		}
	}
	
	DebugPrint(" ");
	DebugPrint("NUM_SCENARIO_MAIN �̒l�� " + main_num + " �ɂȂ�܂����B");


	//----------
	// ��NPC�z�u
	//----------
	// ID������
	g_inn		 <- C_NONE_ID;
	g_item		 <- C_NONE_ID;
	g_neon_a	 <- C_NONE_ID;
	g_neon_b	 <- C_NONE_ID;
	g_neon_c	 <- C_NONE_ID;
	g_neon_d	 <- C_NONE_ID;
	g_gost_a	 <- C_NONE_ID;
	g_gost_g	 <- C_NONE_ID;
	g_ice		 <- C_NONE_ID;

	// ���\�[�X�ǂݍ���
	local id_neon1 = ReadNpc_("m047_01");	// �l�I���p�[�N�Z��1(�C���L���o�X)
	local id_neon2 = ReadNpc_("m013_01");	// �l�I���p�[�N�Z��2(�h���S���o�P�[�W)
	local id_gost  = ReadNpc_("m100_01");	// �����X�^�[�̗H��
	local id_ice   = ReadNpc_("m035_00");	// ���|�[���p�[�N�Z��

	// ���l�I���p�[�N�Z��A(�h���S���o�P�[�W)
	g_neon_a  = ArrangePointNpc_(id_neon2,  "npc_neon_A");
	SetScaleSilhouette(g_neon_a, SCALE.N, SILHOUETTE_WIDTH.N);	// �T�C�Y�̐ݒ�
	SetReactorMsg_(g_neon_a, "GRAVE_NPC_02_REC");
	
	// ���l�I���p�[�N�Z��B(�C���L���o�X)
	g_neon_b  = ArrangePointNpc_(id_neon1,  "npc_neon_B");
	SetSearchableAngle_(g_neon_b, SEARCHABLE_ANGLE_WIDE);		// ��b�\�p�x��ݒ�
	SetReactorMsg_(g_neon_b, "GRAVE_NPC_01_REC");
	SetScaleSilhouette(g_neon_b, SCALE.N, SILHOUETTE_WIDTH.N);
	
	// ���l�I���p�[�N�Z��C(�C���L���o�X)
	g_neon_c  = ArrangePointNpc_(id_neon1,  "npc_neon_C");
	SetSearchableAngle_(g_neon_c, SEARCHABLE_ANGLE_WIDE);		// ��b�\�p�x��ݒ�
	SetReactorMsg_(g_neon_c, "GRAVE_NPC_01_REC");
	SetScaleSilhouette(g_neon_c, SCALE.N, SILHOUETTE_WIDTH.N);
	
	// ���l�I���p�[�N�Z��D(�h���S���o�P�[�W)
	g_neon_d  = ArrangePointNpc_(id_neon2,  "npc_neon_D");
	SetScaleSilhouette(g_neon_d, SCALE.N, SILHOUETTE_WIDTH.N);
	SetReactorMsg_(g_neon_d, "GRAVE_NPC_02_REC");
	
	// ���h��(�C���L���o�X)
	g_inn  = ArrangePointNpc_(id_neon1,  "npc_neon_inn");
	SetSearchableAngle_(g_inn, SEARCHABLE_ANGLE_MINIMUM);		// ����30�x���� �b�������\
	SetScaleSilhouette(g_inn, SCALE.N, SILHOUETTE_WIDTH.N);
	SetReactorMsg_(g_inn, "GRAVE_NPC_01_REC");
	SetTalkCameraType_(g_inn, TALK_CAMERA_UP);					// �J�����̐ݒ�
	
	// �����(�h���S���o�P�[�W)
	g_item  = ArrangePointNpc_(id_neon2,  "npc_neon_item");
	SetSearchableAngle_(g_item, SEARCHABLE_ANGLE_MINIMUM);		// ����30�x���� �b�������\
	SetReactorMsg_(g_item, "GRAVE_NPC_02_REC");
	SetScaleSilhouette(g_item, SCALE.N, SILHOUETTE_WIDTH.N);
	SetTalkCameraType_(g_item, TALK_CAMERA_UP);					// �J�����̐ݒ�
	SetTalkCameraEyeOffset_(g_item, 3.0, 0.0);					// �J�����̈ʒu�̒���
	
	// �����|�[���p�[�N�Z��
	g_ice  = ArrangePointNpc_(id_ice,  "npc_ice_01");				// ���|�[���p�[�N�Z��D
	SetScaleSilhouette(g_ice, SCALE.S, SILHOUETTE_WIDTH.S);			// �T�C�Y�̐ݒ�
	SetReactorMsg_(g_ice, "GRAVE_NPC_ICE_REC");
	
	
	// ���H��(�쓹�V�i���I�N���A�O)
	if(main_num == GetFlagID_("CONST_SM_CEMETERY")){						// Num0 = 3
		if(grave_num == GetFlagID_("CONST_SS_CC_GO_TO_THE_NEON_PARK")){		// Num4 = 1
			if(gost_a_num <= 2){
				g_gost_a  = ArrangePointNpc_(id_gost, "npc_neon_gost_01");	// �����X�^�[�̗H��A
				SetScaleSilhouette(g_gost_a, SCALE.S, SILHOUETTE_WIDTH.S);
				//�����Ȃ��悤�ɒn�ʂɖ��߂�
				SetPosNoFit_(g_gost_a, Vec3(14.0, -50.0, -49.0));
			}
			if(gost_a_num == 3){
				g_gost_a  = ArrangePointNpc_(id_gost, "npc_neon_gost_A");	// �����X�^�[�̗H��A
				SetScaleSilhouette(g_gost_a, SCALE.S, SILHOUETTE_WIDTH.S);
			}
		}
		//�Ïؔԍ���m������A���|�[���p�[�N�Z���͋��Ȃ��Ȃ�
//		if(grave_num <= GetFlagID_("CONST_SS_CC_TAKE_OVER_VOLITION_2")){	// Num4 = 15 �ȉ�
//			g_ice  = ArrangePointNpc_(id_ice,  "npc_ice_01");				// ���|�[���p�[�N�Z��D
//			SetScaleSilhouette(g_ice, SCALE.S, SILHOUETTE_WIDTH.S);			// �T�C�Y�̐ݒ�
//			SetReactorMsg_(g_ice, "GRAVE_NPC_ICE_REC");
//		}
		//�����X�^�[�̗H��A�Ɖ�b������A�Ïؔԍ���m��܂Ń����X�^�[�̗H��A�̔z�u
		if(grave_num >= GetFlagID_("CONST_SS_CC_FIND_THE_GHOST")			// Num4 = 2  �ȏ�
		&& grave_num <= GetFlagID_("CONST_SS_CC_TAKE_OVER_VOLITION_2")){	// Num4 = 15 �ȉ�
			g_gost_a  = ArrangePointNpc_(id_gost,  "npc_neon_gost_A");		// �����X�^�[�̗H��A
			SetScaleSilhouette(g_gost_a, SCALE.S, SILHOUETTE_WIDTH.S);
			SetReactorMsg_(g_gost_a, "GRAVE_NPC_GOST_REC");
		}
		//�Ïؔԍ���m������A�����X�^�[�̗H��G�̔z�u
		if(grave_num >= GetFlagID_("CONST_SS_CC_GET_RACE_PROGRAM")){		// Num4 = 17 �ȏ�
			g_gost_g  = ArrangePointNpc_(id_gost,  "npc_neon_gost_A");		// �����X�^�[�̗H��G
			SetScaleSilhouette(g_gost_g, SCALE.S, SILHOUETTE_WIDTH.S);
			SetReactorMsg_(g_gost_g, "GRAVE_NPC_GOST_REC");
		}
	}
	// �H��(�쓹�V�i���I�N���A��)
	if(main_num >= GetFlagID_("CONST_SM_ICE_FIELD")){						// Num0 = 4 �ȏ�
		g_gost_g  = ArrangePointNpc_(id_gost,  "npc_neon_gost_A");			// �����X�^�[�̗H��G
		SetScaleSilhouette(g_gost_g, SCALE.S, SILHOUETTE_WIDTH.S);
		SetReactorMsg_(g_gost_g, "GRAVE_NPC_GOST_REC");
	}

	//-----------
	// ���n���z�u
	//-----------
	// ID������
	g_mine_gost_event	 <- C_NONE_ID;
	g_mine_dont_exit	 <- C_NONE_ID;
	
	// ���H��C�x���g�J�n�p�n��
	if(main_num == GetFlagID_("CONST_SM_CEMETERY")){						// Num0 = 3
		if(gost_a_num == 0){
			g_mine_gost_event = SetPointBoxEventMine_("mine_gost_event", false);
		}
	}
	
	// ���H��C�x���g�I���܂ŊO�ɏo���Ȃ��n��
	if(main_num == GetFlagID_("CONST_SM_CEMETERY")){						// Num0 = 3
		if(grave_num <= GetFlagID_("CONST_SS_CC_GO_TO_THE_NEON_PARK")){		// Num4 = 1�ȉ�
			g_mine_dont_exit = SetPointBoxEventMine_("mine_dont_exit", false);
		}
	}
	
	DebugPrint("�C�x���g�n���̓Ǎ�");


	//---------------------
	// �����A�N�^�[�|�C���g
	//---------------------
	// ID������
	g_reactor_point_a_1 <- C_NONE_ID;
	g_reactor_point_a_2 <- C_NONE_ID;
	g_reactor_point_a_3 <- C_NONE_ID;
	
	if(main_num == GetFlagID_("CONST_SM_CEMETERY")){						// Num0 = 3
		// �������X�^�[�̗H��A�i1��ځj
		if(gost_a_num == 1){
			g_reactor_point_a_1 = ArrangePointReactorPoint_("reactorPoint_a_1", SHORT_DIST);
			SetReactorMarkerTypeHide_(g_reactor_point_a_1, true);// ���A�N�^�[�̃}�[�J�[�^�C�v��ύX
			SetReactorEvent_(g_reactor_point_a_1);
		}
		// �������X�^�[�̗H��A�i2��ځj
		if(gost_a_num == 2){
			g_reactor_point_a_2 = ArrangePointReactorPoint_("reactorPoint_a_2", SHORT_DIST);
			SetReactorEvent_(g_reactor_point_a_2);
		}
		// �������X�^�[�̗H��A�i3��ځj
		if(gost_a_num == 3){
			g_reactor_point_a_3 = ArrangePointReactorPoint_("reactorPoint_a_3", SHORT_DIST);
			SetReactorEvent_(g_reactor_point_a_3);
		}
	}
	
	// �l�I���A�[�g
	local rec_point_art = ArrangeMsgReactorPoint("rec_point_art", GetFlagID_("BFG_REACTER_POINT_065")// Bit_1564
		, SHORT_DIST, "REC_POINT_NEON_010", "REC_POINT_NEON_011");
	
	// ���
	local rec_point_item = ArrangeMsgReactorPoint("rec_point_item", GetFlagID_("BFG_REACTER_POINT_066")// Bit_1565
		, SHORT_DIST, "REC_POINT_ITEM_010", "REC_POINT_ITEM_011");
	
	// �h��
	local rec_point_inn = ArrangeMsgReactorPoint("rec_point_inn", GetFlagID_("BFG_REACTER_POINT_067")// Bit_1566
		, SHORT_DIST, "REC_POINT_INN_010", "REC_POINT_INN_011");
	
	// �����
	local rec_point_seimon = ArrangeMsgReactorPoint("rec_point_seimon", GetFlagID_("BFG_REACTER_POINT_068")// Bit_1567
		, SHORT_DIST, "REC_POINT_SEIMON_010", "REC_POINT_SEIMON_011");
	
	// �����
	local rec_point_uramon = ArrangeMsgReactorPoint("rec_point_uramon", GetFlagID_("BFG_REACTER_POINT_069")// Bit_1568
		, SHORT_DIST, "REC_POINT_URAMON_010", "REC_POINT_URAMON_011");
	
	
	
	EventEnd_();
}


//------------------------------------------------
//		�C�x���g�X�^�[�g
//------------------------------------------------
function EventStartOperate()
{
	// �t���O�̏�Ԃ��擾
	local main_num  = GetNumFlg_("NUM_SCENARIO_MAIN");				// Num0
	local grave_num = GetNumFlg_("NUM_SCENARIO_SUB_GRAVE");			// Num4
	//�����X�^�[�̗H��A�t���O
	local gost_a_num = GetNumFlg_("NUM_FLG_TRACKING_GHOST_STATE");	// Num127
	
	// �������X�^�[�̗H��A
	if(main_num == GetFlagID_("CONST_SM_CEMETERY")){						// Num0 = 3
		if(grave_num >= GetFlagID_("CONST_SS_CC_GO_TO_THE_NEON_PARK")		// Num4 = 1  �ȏ�
		&& grave_num <= GetFlagID_("CONST_SS_CC_TAKE_OVER_VOLITION_2")){	// Num4 = 15 �ȉ�
			//�����X�^�[�̗H��A�𔼓����ɂ���
			SetManualCalcAlpha_(g_gost_a, true);
			SetAlpha_(g_gost_a, 0.3);
		}
	}
	// �������X�^�[�̗H��G
	// �쓹�V�i���I�N���A�O
	if(main_num >= GetFlagID_("CONST_SM_CEMETERY")){						// Num0 = 3
		if(grave_num >= GetFlagID_("CONST_SS_CC_GET_RACE_PROGRAM")){		// Num4 = 17 �ȏ�
			//�����X�^�[�̗H��G�𔼓����ɂ���
			SetManualCalcAlpha_(g_gost_g, true);
			SetAlpha_(g_gost_g, 0.3);
		}
	}
	// �쓹�V�i���I�N���A��
	if(main_num >= GetFlagID_("CONST_SM_ICE_FIELD")){						// Num0 = 4 �ȏ�
		//�����X�^�[�̗H��G�𔼓����ɂ���
		SetManualCalcAlpha_(g_gost_g, true);
		SetAlpha_(g_gost_g, 0.3);
	}
	//-------------
	// ���f���̍Đ�
	//-------------
	if(main_num == GetFlagID_("CONST_SM_CEMETERY")){						// Num0 = 3
		//�͂��߂ăl�I���p�[�N�ɓ��������̃f��
		if(grave_num == 0){																		// Num4 = 0
			SetNumFlg_("NUM_SCENARIO_SUB_GRAVE", GetFlagID_("CONST_SS_CC_GO_TO_THE_NEON_PARK"));// Num4 = 1
			// �f���̕��A�ʒu���f���̊�����ɐݒ肵�܂�
			SetReturnDemoPosDir_(Vec3(10.091, -1.125, 153.404), -179);
			//201[�l�I���p�[�N�̗��H�n���]
			EventStartChangeDemo(201, FADE_COLOR_BLACK);
		}
	}

	EventEnd_();
}


//------------------------------------------------
//		�m�o�b�ڐG��
//------------------------------------------------
function TouchNpc()
{
// �t���O�̏�Ԃ��擾
	local main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");				//Num0
	local grave_num	 = GetNumFlg_("NUM_SCENARIO_SUB_GRAVE");		//Num4
	local gost_a_num = GetNumFlg_("NUM_FLG_TRACKING_GHOST_STATE");	//Num127
	local target	 = GetTargetId_();

	DebugPrint("ID: " + target + " �ɐڐG [TouchNpc]");
	
	switch(target){
	case g_neon_a :		// �l�I���p�[�N�Z��A(�h���S���o�P�[�W)
		uTalkNeonA();
		break;
	case g_neon_b :		// �l�I���p�[�N�Z��B(�C���L���o�X)
		uTalkNeonB();
		break;
	case g_neon_c :		// �l�I���p�[�N�Z��C(�C���L���o�X)
		uTalkNeonC();
		break;
	case g_neon_d :		// �l�I���p�[�N�Z��D(�h���S���o�P�[�W)
		uTalkNeonD();
		break;
	case g_ice :		// ���|�[���p�[�N�Z��
		uTalkIce();
		break;
	case g_item :		// ���
		uTalkItem();
		break;
	case g_inn :		// �h��
		uTalkInn();
		break;
	case g_gost_a :		// �����X�^�[�̗H��A
		uTalkMonsterA();
		break;
	case g_gost_g :		// �����X�^�[�̗H��G
		uTalkMonsterG();
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
function TouchEventMine(){
	local main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");				//Num0
	local grave_num	 = GetNumFlg_("NUM_SCENARIO_SUB_GRAVE");		//Num4
	local target	 = GetTouchEventMineId_();
	local player	 = GetPlayerId_();
	//�����X�^�[�̗H��A�t���O
	local gost_a_num = GetNumFlg_("NUM_FLG_TRACKING_GHOST_STATE");	//Num127

	switch (target) {
	case g_mine_gost_event :	//���A�N�^�[�ŗH���T�m����n��
		uMineGost();
		break;
	case g_mine_dont_exit :		//�H��T���C�x���g�I���܂ŊX����o���Ȃ��悤�ɂ���n��
		uMineDontExit();
		break;
	default:
		DebugPrint("�ݒu����Ă��Ȃ��n���ɐڐG���肵�Ă��܂��I");
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
// �t���O�̏�Ԃ��擾
	local main_num  = GetNumFlg_("NUM_SCENARIO_MAIN");				//Num0
	local grave_num = GetNumFlg_("NUM_SCENARIO_SUB_GRAVE");			//Num4

	// NPC�̎�ނ��擾
	local target = GetTargetId_();
	//�����X�^�[�̗H��A�t���O
	local gost_a_num = GetNumFlg_("NUM_FLG_TRACKING_GHOST_STATE");	//Num127
	
	// �����X�^�[�̗H��A��ǂ�������C�x���g
	switch (target) {
	case g_reactor_point_a_1 :	// 1���
		uGostEvent(gost_a_num);
		break;
	case g_reactor_point_a_2 :	// 2���
		uGostEvent(gost_a_num);
		break;
	case g_reactor_point_a_3 :	// 3���
		uGostEvent(gost_a_num);
		break;
	default :
		break;
	}
	
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





//=========================================================================================================
//									�������������牺�̓��[�J���֐�������
//=========================================================================================================

//++++++++++++++++++++++++++++++++++++++++++++++++
//		�h���̃��b�Z�[�W����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uInnMessage()
{
	// �Ó]�����̎�l���̕��A�ʒu�ƌ�����ݒ肷��
	local re_pos = Vec3(-15.484, 0.000, -73.408);	// ���A�ʒu���w��
	local re_dir = -90;								// �������w��
	// ���b�Z�[�W�L�[�̏�����
	local message_key_1 = 0;	// ���b�Z�[�W�L�[(�I������\�����郁�b�Z�[�W)
	local message_key_2 = 0;	// ���b�Z�[�W�L�[(��߂�ꍇ�̃��b�Z�[�W)
	local message_key_3 = 0;	// ���b�Z�[�W�L�[(���p�����ꍇ�̃��b�Z�[�W)
	// �쓹�̃N���A�t���O
	local clear_flag	= GetEventFlg_("BFG_SCENARIO_CLEAR_GRAVE");

	if(clear_flag == true){
		if(GetEventFlg_("BFG_CHECK_INN_FIRST_MSG_ALL") == false){
			// �쓹�N���A��̏h���ŕ\�����郁�b�Z�[�W���w��(����)
			message_key_1 = "INN_MSG_001";
			message_key_2 = "INN_MSG_002";
			message_key_3 = "INN_MSG_003";
		}
		else{
			// �쓹�N���A��̏h���ŕ\�����郁�b�Z�[�W���w��(�Q��ڈȍ~)
			message_key_1 = "INN_MSG_004";
			message_key_2 = "INN_MSG_005";
			message_key_3 = "INN_MSG_006";
		}
		SetEventFlg_("BFG_CHECK_INN_FIRST_MSG_ALL", true);
		// ���b�Z�[�W�̕\���u�₟ ��������Ⴂ�c
		OpenMsgWnd_();
		ShowMsg_(message_key_1);
		KeyInputWait_();
		switch(GetQueryResult_())
		{
		case QUERY3_0:
		case QUERY3_1:
		// ���܂鏈��
		// �x�ޏ���
			CloseMsgWnd_();
			// �h���̋��ʂ̉񕜏���
			CommTaskInn(re_pos, re_dir, clear_flag, g_inn);
			// ���b�Z�[�W�̕\���u���͂�[��������c
			OpenMsgWnd_();
			ShowMsg_(message_key_3);
			KeyInputWait_();
			CloseMsgWnd_();
			break;
		case QUERY3_2:
		// ��߂鏈��
			// ���b�Z�[�W�̕\���u�킩����������c
			ShowMsg_(message_key_2);
			KeyInputWait_();
			CloseMsgWnd_();
			break;
		}
	}
	else{
		// �쓹�N���A�O�̏h���ŕ\�����郁�b�Z�[�W���w��
		message_key_1 = "INN_MSG_1ST_001";
		message_key_2 = "INN_MSG_1ST_002";
		message_key_3 = "INN_MSG_1ST_003";

		// ���b�Z�[�W�̕\���u�₟ ��������Ⴂ�c
		OpenMsgWnd_();
		ShowMsg_(message_key_1);
		KeyInputWait_();
		CloseMsgWnd_();

		switch(GetQueryResult_()){
		case QUERY2_0:
		// ���܂鏈��
			// �h���̋��ʂ̉񕜏���
			CommTaskInn(re_pos, re_dir, clear_flag, g_inn);
			// ���b�Z�[�W�̕\���u���͂�[��������c
			OpenMsgWnd_();
			ShowMsg_(message_key_3);
			KeyInputWait_();
			CloseMsgWnd_();
			break;
		case QUERY2_1:
		// ��߂鏈��
			// ���b�Z�[�W�̕\���u�킩����������c
			OpenMsgWnd_();
			ShowMsg_(message_key_2);
			KeyInputWait_();
			CloseMsgWnd_();
			break;
		}
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�l�I���p�[�N�Z��A�ig_neon_a�j�̘b�����e
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkNeonA()
{
	local main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");				//Num0
	local grave_num	 = GetNumFlg_("NUM_SCENARIO_SUB_GRAVE");		//Num4
	local sky_num	 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");			//Num9
	
	// �쓹�V�i���I�J�n�`�u���h���h���j�܂�
	if(main_num == GetFlagID_("CONST_SM_CEMETERY")){								// Num0 = 3
		if(grave_num <= GetFlagID_("CONST_SS_CC_GO_TO_THE_NEON_PARK")){				// Num4 = 1 �ȉ�
			uMessage("DEMO_201_AFT_NPC_A");			//�u���̊i�D�c�c���񂽁@���W�X�^���X���ȁH
		}
		// �H��Əo����Ă���u���h���h���j��܂�
		else if(grave_num <= GetFlagID_("CONST_SS_CC_GO_TO_THE_NEXT_TRANSFER")){	// Num4 = 16 �ȉ�
			uMessage("DEMO_202_AFT_NPC_A");			//�u�k�ɂ���@�A���f�b�h�K�[�f���͂�
		}
		// �u���h���h���j��
		else if(grave_num <= GetFlagID_("CONST_SS_CC_CLEAR_CEMETERY")){				// Num4 = 18 �ȉ�
			uMessage("DEMO_213_AFT_NPC_A");			//�u�~�܂��Ă����ړ����u���@�����������񂾁B
		}
	}
	// �쓹�V�i���I�N���A��`�K���r���X���j�O�܂�
	else if(main_num <= GetFlagID_("CONST_SM_CORE")){								// Num0 = 7 �ȉ�
		uMessage("DEMO_213_AFT_NPC_A");				//�u�~�܂��Ă����ړ����u���@�����������񂾁B
	}
	// �K���r���X���j��`����u���h���h���j�O�܂�
	else if(main_num == GetFlagID_("CONST_SM_SKY")){								// Num0 = 8
		if(sky_num <= GetFlagID_("CONST_SS_SK_JDG_REMATCH_G_BUNDORUDO")){			// Num9 = 23 �ȉ�
			uMessage("NPC_A_GARUBIRUSU_WIN_010");	//�u�܂�Ł@����Ă�݂����ȁ@��̐F���B
		}
		// ����u���h���h���j��`�\�V�i���I�N���A�܂�
		else if(sky_num <= GetFlagID_("CONST_SS_SK_DATA_SAVED")){					// Num9 = 58 �ȉ�
			uMessage("NPC_A_BIG_BUNDORUDO_WIN_010");//�u�ł����u���h���h���@��̏�Ɂ@�����Ƃ͂ˁB
		}
	}
	// �\�V�i���I�N���A��
	else if(main_num >= GetFlagID_("CONST_SM_INSIDE_CLEAR")){						// Num0 = 9 �ȏ�
		uMessage("NPC_A_ALL_CLEAR_010");			//�u�����@�����X�^�[�}�X�^�[�́@�Z����񂩁B
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�l�I���p�[�N�Z��B�ig_neon_b�j�̘b�����e
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkNeonB()
{
	local main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");				//Num0
	local grave_num	 = GetNumFlg_("NUM_SCENARIO_SUB_GRAVE");		//Num4
	local sky_num	 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");			//Num9
	
	// �쓹�V�i���I�J�n�`�u���h���h���j�܂�
	if(main_num == GetFlagID_("CONST_SM_CEMETERY")){								// Num0 = 3
		if(grave_num <= GetFlagID_("CONST_SS_CC_GO_TO_THE_NEXT_TRANSFER")){			// Num4 = 16 �ȉ�
			uMessage("DEMO_201_AFT_NPC_B");			//�u���W�X�^���X�Ɂ@���L�����ċZ�p�҂����Ă�H
		// �u���h���h���j��
		}else if(grave_num <= GetFlagID_("CONST_SS_CC_CLEAR_CEMETERY")){			// Num4 = 18 �ȉ�
			uMessage("DEMO_213_AFT_NPC_B");			//�u�ړ����u���@�����悤�ɂȂ����̂��B
		}
	}
	// �쓹�V�i���I�N���A��`�K���r���X���j�O�܂�
	else if(main_num <= GetFlagID_("CONST_SM_CORE")){								// Num0 = 7 �ȉ�
		uMessage("DEMO_213_AFT_NPC_B");				//�u�ړ����u���@�����悤�ɂȂ����̂��B
	}
	// �K���r���X���j��`����u���h���h���j�O�܂�
	else if(main_num == GetFlagID_("CONST_SM_SKY")){								// Num0 = 8
		if(sky_num <= GetFlagID_("CONST_SS_SK_JDG_REMATCH_G_BUNDORUDO")){			// Num9 = 23 �ȉ�
			uMessage("NPC_B_GARUBIRUSU_WIN_010");	//�u�ړ����u���@�܂��~�܂����܂����񂾁B
		}
		// ����u���h���h���j��`�\�V�i���I�N���A�܂�
		else if(sky_num <= GetFlagID_("CONST_SS_SK_DATA_SAVED")){					// Num9 = 58 �ȉ�
			uMessage("NPC_B_BIG_BUNDORUDO_WIN_010");//�u���y�̗쓹�𕢂��Ă����@�����ԕ��͏��������B
		}
	}
	// �\�V�i���I�N���A��
	else if(main_num >= GetFlagID_("CONST_SM_INSIDE_CLEAR")){						// Num0 = 9 �ȏ�
		uMessage("NPC_B_ALL_CLEAR_010");			//�u���������a�������Ɓ@������Ƒދ����ȁB
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�l�I���p�[�N�Z��C�ig_neon_c�j�̘b�����e
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkNeonC()
{
	local main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");				//Num0
	local grave_num	 = GetNumFlg_("NUM_SCENARIO_SUB_GRAVE");		//Num4
	local sky_num	 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");			//Num9
	
	// �쓹�V�i���I�J�n�`�u���h���h���j�܂�
	if(main_num == GetFlagID_("CONST_SM_CEMETERY")){								// Num0 = 3
		if(grave_num <= GetFlagID_("CONST_SS_CC_GO_TO_THE_NEON_PARK")){				// Num4 = 1 �ȉ�
			uMessage("DEMO_201_AFT_NPC_C");			//�u�����́@�l�I���p�[�N�B
		}
		// �H��Əo����Ă���u���h���h���j��܂�
		else if(grave_num <= GetFlagID_("CONST_SS_CC_GO_TO_THE_NEXT_TRANSFER")){	// Num4 = 16 �ȉ�
			uMessage("DEMO_202_AFT_NPC_C");			//�u�u���h���h�́@�������@���������Ȃ̂�
		}
		// �u���h���h���j��
		else if(grave_num <= GetFlagID_("CONST_SS_CC_CLEAR_CEMETERY")){			// Num4 = 18 �ȉ�
			uMessage("DEMO_213_AFT_NPC_C");			//�u�u���h���h�̓z���@���Ȃ��Ȃ�����������
		}
	}
	// �쓹�V�i���I�N���A��`�K���r���X���j�O�܂�
	else if(main_num <= GetFlagID_("CONST_SM_CORE")){								// Num0 = 7 �ȉ�
		uMessage("DEMO_213_AFT_NPC_C");				//�u�u���h���h�̓z���@���Ȃ��Ȃ�����������
	}
	// �K���r���X���j��`����u���h���h���j�O�܂�
	else if(main_num == GetFlagID_("CONST_SM_SKY")){								// Num0 = 8
		if(sky_num <= GetFlagID_("CONST_SS_SK_JDG_REMATCH_G_BUNDORUDO")){			// Num9 = 23 �ȉ�
			uMessage("NPC_C_GARUBIRUSU_WIN_010");	//�u���������@�u���h���h�����Ȃ��Ȃ���
		}
		// ����u���h���h���j��`�\�V�i���I�N���A�܂�
		else if(sky_num <= GetFlagID_("CONST_SS_SK_DATA_SAVED")){					// Num9 = 58 �ȉ�
			uMessage("NPC_C_BIG_BUNDORUDO_WIN_010");//�u�₠�@���񂽂̂�������
		}
	}
	// �\�V�i���I�N���A��
	else if(main_num >= GetFlagID_("CONST_SM_INSIDE_CLEAR")){						// Num0 = 9 �ȏ�
		uMessage("NPC_C_ALL_CLEAR_010");			//�u��Ɂ@������ł���R�A��
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�l�I���p�[�N�Z��D�ig_neon_d�j�̘b�����e
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkNeonD()
{
	local main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");				//Num0
	local grave_num	 = GetNumFlg_("NUM_SCENARIO_SUB_GRAVE");		//Num4
	local sky_num	 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");			//Num9
	
	// �쓹�V�i���I�J�n�`�u���h���h���j�܂�
	if(main_num == GetFlagID_("CONST_SM_CEMETERY")){								// Num0 = 3
		if(grave_num <= GetFlagID_("CONST_SS_CC_GO_TO_THE_NEXT_TRANSFER")){			// Num4 = 16 �ȉ�
			uMessage("DEMO_201_AFT_NPC_D");			//�u�ŋ߁c�c�ǁ[�����Ȃ��Ƃ��@�N����񂾂�ȁB
		// �u���h���h���j��
		}else if(grave_num <= GetFlagID_("CONST_SS_CC_CLEAR_CEMETERY")){			// Num4 = 18 �ȉ�
			uMessage("DEMO_213_AFT_NPC_D");			//�u�u���h���h���@���Ȃ��Ȃ��Ă���
		}
	}
	// �쓹�V�i���I�N���A��`�K���r���X���j�O�܂�
	else if(main_num <= GetFlagID_("CONST_SM_CORE")){								// Num0 = 7 �ȉ�
		uMessage("DEMO_213_AFT_NPC_D");				//�u�u���h���h���@���Ȃ��Ȃ��Ă���
	}
	// �K���r���X���j��`����u���h���h���j�O�܂�
	else if(main_num == GetFlagID_("CONST_SM_SKY")){								// Num0 = 8
		if(sky_num <= GetFlagID_("CONST_SS_SK_JDG_REMATCH_G_BUNDORUDO")){			// Num9 = 23 �ȉ�
			uMessage("NPC_D_GARUBIRUSU_WIN_010");	//�u�悻�̓y�n���@���̍����ԕ���
		}
		// ����u���h���h���j��`�\�V�i���I�N���A�܂�
		else if(sky_num <= GetFlagID_("CONST_SS_SK_DATA_SAVED")){					// Num9 = 58 �ȉ�
			uMessage("NPC_D_BIG_BUNDORUDO_WIN_010");//�u�����ԕ��́@��������
		}
	}
	// �\�V�i���I�N���A��
	else if(main_num >= GetFlagID_("CONST_SM_INSIDE_CLEAR")){						// Num0 = 9 �ȏ�
		uMessage("NPC_D_ALL_CLEAR_010");			//�u�ŋ߂ɂȂ��ā@�͂��߂ā@�A���f�b�h�K�[�f����
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		���|�[���p�[�N�Z��D�ig_ice�j�̘b�����e
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkIce()
{
	local main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");				//Num0
	local grave_num	 = GetNumFlg_("NUM_SCENARIO_SUB_GRAVE");		//Num4
	local sky_num	 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");			//Num9
	
	// �쓹�V�i���I�J�n�`�u���h���h���j�܂�
	if(main_num == GetFlagID_("CONST_SM_CEMETERY")){								// Num0 = 3
		if(grave_num <= GetFlagID_("CONST_SS_CC_GO_TO_THE_NEXT_TRANSFER")){			// Num4 = 16 �ȉ�
			uMessage("DEMO_201_AFT_NPC_E");			//�u���V�́@�k�̈ړ����u����@�����񂾂ׂ�
		// �u���h���h���j��
		}else if(grave_num <= GetFlagID_("CONST_SS_CC_CLEAR_CEMETERY")){			// Num4 = 18 �ȉ�
			uMessage("DEMO_213_AFT_NPC_E");			//�u�ړ����u�����������ĕ������ׁB
		}
	}
	// �쓹�V�i���I�N���A��`�K���r���X���j�O�܂�
	else if(main_num <= GetFlagID_("CONST_SM_CORE")){								// Num0 = 7 �ȉ�
		uMessage("DEMO_213_AFT_NPC_E");				//�u�ړ����u�����������ĕ������ׁB
	}
	// �K���r���X���j��`����u���h���h���j�O�܂�
	else if(main_num == GetFlagID_("CONST_SM_SKY")){								// Num0 = 8
		if(sky_num <= GetFlagID_("CONST_SS_SK_JDG_REMATCH_G_BUNDORUDO")){			// Num9 = 23 �ȉ�
			uMessage("NPC_E_GARUBIRUSU_WIN_010");	//�u�Ȃ񂾂��@���^���^���Ă���
		}
		// ����u���h���h���j��`�\�V�i���I�N���A�܂�
		else if(sky_num <= GetFlagID_("CONST_SS_SK_DATA_SAVED")){					// Num9 = 58 �ȉ�
			uMessage("NPC_E_BIG_BUNDORUDO_WIN_010");//�u�������I�@�󂪁@���ɖ߂��Ă�ׁI
		}
	}
	// �\�V�i���I�N���A��
	else if(main_num >= GetFlagID_("CONST_SM_INSIDE_CLEAR")){						// Num0 = 9 �ȏ�
		uMessage("NPC_E_ALL_CLEAR_010");			//�u���a�ɂȂ�����@�܂��@�A�肻�тꂿ�܂������B
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		���
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkItem()
{
	//����̃��b�Z�[�W
	OpenMsgWnd_();
	ShowMsg_("ITEM_MSG_01");
	KeyInputWait_();
	CloseMsgWnd_();
	//����t���[�Ɉڍs
	GotoMenuFadeOpen(MENU_OPEN.G01_00_ITEM);
	//����t���[�I����
	OpenMsgWnd_();
	ShowMsg_("ITEM_MSG_02");
	KeyInputWait_();
	CloseMsgWnd_();

}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�h��
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkInn()
{
	uInnMessage();
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�����X�^�[�̗H��A
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkMonsterA()
{
// �t���O�̏�Ԃ��擾
	local main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");				//Num0
	local grave_num	 = GetNumFlg_("NUM_SCENARIO_SUB_GRAVE");		//Num4
	local gost_a_num = GetNumFlg_("NUM_FLG_TRACKING_GHOST_STATE");	//Num127
	
	if(main_num == GetFlagID_("CONST_SM_CEMETERY")){				// Num0 = 3
		//�����X�^�[�̗H��A�ɘb�������ăf��202[�����X�^�[�̗H��`�Ƃ̏o�]�Đ�
		if(grave_num == GetFlagID_("CONST_SS_CC_GO_TO_THE_NEON_PARK")){							//Num4 = 1
			if(gost_a_num == 3){																//Num127 = 3
				//�����X�^�[�̗H��A�t���O
				SetNumFlg_("NUM_FLG_TRACKING_GHOST_STATE", 4);									//Num127 = 4
				SetNumFlg_("NUM_SCENARIO_SUB_GRAVE",GetFlagID_("CONST_SS_CC_FIND_THE_GHOST"));	//Num4 = 2
				
				// �f���̕��A�ʒu���f���̊�����ɐݒ肵�܂�
				SetReturnDemoPosDir_(Vec3(142.068, -1.124, -28.883), 180);
				// �b���������炷���Ƀt�F�[�h �{ Demo202[�����X�^�[�̗H��`�Ƃ̏o�]�Đ�
				TouchNpcChangeDemo(202);
			}
		}
		//�����X�^�[�̗H��A�Ɖ�b�f���̌�
		if(grave_num >= GetFlagID_("CONST_SS_CC_FIND_THE_GHOST")								//Num4 = 2  �ȏ�
		&& grave_num <= GetFlagID_("CONST_SS_CC_TAKE_OVER_VOLITION_2")){						//Num4 = 15 �ȉ�
				//�����X�^�[�̗H��A�̃��b�Z�[�W
				OpenMsgWnd_();
				ShowMsg_("DEMO_202_AFT_NPC_GOST_A");
				KeyInputWait_();
				CloseMsgWnd_();
		}
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�����X�^�[�̗H��G
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkMonsterG()
{
// �t���O�̏�Ԃ��擾
	local main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");						// Num0
	local grave_num	 = GetNumFlg_("NUM_SCENARIO_SUB_GRAVE");				// Num4
	local sky_num	 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");					// Num9

	// �쓹�V�i���I�N���A�O
	if(main_num == GetFlagID_("CONST_SM_CEMETERY")){						// Num0 = 3
		// �u���h���h���j��
		if(grave_num <= GetFlagID_("CONST_SS_CC_CLEAR_CEMETERY")){			// Num4 = 18 �ȉ�
			uMessage("DEMO_213_AFT_NPC_GOST_G");			//�u���񂽂Ɠ���Ⴂ�Ɂ@�����X�^�[�̗H�삪
		}
	}
	// �쓹�V�i���I�N���A��`�K���r���X���j�O�܂�
	else if(main_num <= GetFlagID_("CONST_SM_CORE")){						// Num0 = 7 �ȉ�
		uMessage("DEMO_213_AFT_NPC_GOST_G");				//�u���񂽂Ɠ���Ⴂ�Ɂ@�����X�^�[�̗H�삪
	}
	// �K���r���X���j��`����u���h���h���j�O�܂�
	else if(main_num == GetFlagID_("CONST_SM_SKY")){						// Num0 = 8
		if(sky_num <= GetFlagID_("CONST_SS_SK_JDG_REMATCH_G_BUNDORUDO")){	// Num9 = 23 �ȉ�
			uMessage("NPC_GOST_G_GARUBIRUSU_WIN_010");		//�u�������Ɓ@�H�����Ă邯��
		}
		// ����u���h���h���j��`�\�V�i���I�N���A�܂�
		else if(sky_num <= GetFlagID_("CONST_SS_SK_DATA_SAVED")){			// Num9 = 58 �ȉ�
			uMessage("NPC_GOST_G_BIG_BUNDORUDO_WIN_010");	//�u���񂽂��@���̍����ԕ����@�����Ă��ꂽ�̂��B
		}
	}
	// �\�V�i���I�N���A��
	else if(main_num >= GetFlagID_("CONST_SM_INSIDE_CLEAR")){				// Num0 = 9 �ȏ�
		uMessage("NPC_GOST_G_ALL_CLEAR_010");				//�u�悤�@���C�������ȁB
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		���A�N�^�[�ŗH���T�m����n��
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineGost()
{
	//�����X�^�[�̗H��A�t���O
	local gost_a_num = GetNumFlg_("NUM_FLG_TRACKING_GHOST_STATE");	//Num127
	
	if(gost_a_num == 0){											//Num127 = 0
		DeleteEventMine_(g_mine_gost_event);
		//�����X�^�[�̗H��A�t���O
		SetNumFlg_("NUM_FLG_TRACKING_GHOST_STATE", 1);				//Num127 = 1

		SetReturnDemoPosDir_(Vec3(7.591, -1.125, -157.978), -90);
		//219[�����X�^�[�̗H��`�ɔ������郊�A�N�^�[]
		TouchNpcChangeDemo(219);
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//	�H��T���C�x���g�I���܂ŊX����o���Ȃ�����n��
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineDontExit()
{
	//���A�N�^�[���b�Z�[�W
	CommReactorActionNotice();		// ���A�N�^�[���������������̋��ʏ���
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_REACTOR");
	ShowMsg_("MINE_DONT_EXIT_MSG_01");
	KeyInputWait_();
	CloseMsgWnd_();
	CommResetPlayerMotion();		// ���[�V������ҋ@��Ԃɖ߂����ʏ���
	Wait_(5);
	
	// �o�b�N���Ĉړ�
	CommPlayerTurnMoveDirWalk(0);
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�H��A��ǂ�������C�x���g
//------------------------------------------------
//	����	: gost_a_num	Num127�̐i�s�x
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uGostEvent(gost_a_num)
{
	
	local gost_a_num = GetNumFlg_("NUM_FLG_TRACKING_GHOST_STATE");				//Num127
	
	if(gost_a_num != 3){
		if(gost_a_num == 1){		// 1���
			SetNumFlg_("NUM_FLG_TRACKING_GHOST_STATE", 2);
			SetReactorMarkerTypeHide_(g_reactor_point_a_1, false);	//���A�N�^�[�̃}�[�J�[�^�C�v��߂�
			SetActive_(g_reactor_point_a_1, false);					//���A�N�^�[�|�C���g��\�������Ȃ�
			SetPointPosNoFit_(g_gost_a, "npc_neon_gost_02");		//�����X�^�[�̗H��A��z�u
		}
		else if(gost_a_num == 2){	// 2���
			SetNumFlg_("NUM_FLG_TRACKING_GHOST_STATE", 3);
			SetReactorMarkerTypeHide_(g_reactor_point_a_2, false);
			SetActive_(g_reactor_point_a_2, false);
			SetPointPosNoFit_(g_gost_a, "npc_neon_gost_03");
		}
		
		SetAlpha_(g_gost_a, 0.0);									//�����X�^�[�̗H��A���\���ɂ���
		SetDirToPlayer_(g_gost_a);									//�v���C���[�̕��Ɍ�������
		
		//�����X�^�[�̗H��A�t�F�[�h�C��
		uAlphaFadeIn(g_gost_a);
		
		//�����X�^�[�̗H��A��b�V�[��
		if(gost_a_num == 1){		// 1���
			uMessage("DEMO_201_AFT_NPC_GOST_01");
			Task_AnimeMove_(g_gost_a, "gost_ani2");					//���̕����ֈړ�����^�X�N
		}
		else if(gost_a_num == 2){	// 2���
			uMessage("DEMO_201_AFT_NPC_GOST_02");
			Task_AnimeMove_(g_gost_a, "gost_ani3");
		}	
		
		//�����X�^�[�̗H��A���ړ������Ȃ���t�F�[�h�A�E�g
		uAlphaFadeOut(g_gost_a);
		DeleteAllTask_();											//�^�X�N������
		
		//�V�X�e�����b�Z�[�W
		if(gost_a_num == 1){		// 1���
			uMessage("DEMO_201_AFT_SYS_01");
		}
		else if(gost_a_num == 2){	// 2���
			uMessage("DEMO_201_AFT_SYS_02");
		}
		
		//���A�N�^�[�������I�ɏI��������
		ReactorPowerOff_();
		
		if(gost_a_num == 1){		// 1���
			//�����Ȃ��悤�ɒn�ʂɖ��߂�
			SetPosNoFit_(g_gost_a, Vec3(14.0, -50.0, -49.0));
			//2��ڂ̃��A�N�^�[�|�C���g��ݒu
			g_reactor_point_a_2 = ArrangePointReactorPoint_("reactorPoint_a_2", SHORT_DIST);//�����X�^�[�̗H��A�i2��ځj
			SetReactorMarkerTypeHide_(g_reactor_point_a_2, true);	// ���A�N�^�[�̃}�[�J�[�^�C�v��ύX
			SetReactorEvent_(g_reactor_point_a_2);
		}
		else if(gost_a_num == 2){	// 2���
			//3��ڂ̃����X�^�[�̗H��A�ƃ��A�N�^�[�|�C���g��ݒu
			SetPointPosNoFit_(g_gost_a, "npc_neon_gost_A");			//�����X�^�[�̗H��A��ݒu
			SetDir_(g_gost_a, 0);
			SetAlpha_(g_gost_a, 0.3);
			g_reactor_point_a_3 = ArrangePointReactorPoint_("reactorPoint_a_3", SHORT_DIST);//�����X�^�[�̗H��A�i3��ځj
			SetReactorEvent_(g_reactor_point_a_3);
		}
	}else{
		//3���
		//�V�X�e�����b�Z�[�W
		uMessage("DEMO_201_AFT_NPC_GOST_04");
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�H��A���t�F�[�h�C��������
//------------------------------------------------
//	����	: id	NPCID
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uAlphaFadeIn(id)
{
	local alpha = 0.0;// ���l�̐ݒ�
	for(alpha = 0.0; alpha <= 0.3; alpha = alpha + 0.03){
		SetAlpha_(id, alpha);
		Wait_(2);
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�H��A���t�F�[�h�A�E�g����
//------------------------------------------------
//	����	: id	NPCID
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uAlphaFadeOut(id)
{
	local alpha = 0.0;// ���l�̐ݒ�
	for(alpha = 0.3; alpha >= 0.0; alpha = alpha - 0.03){
		SetAlpha_(id, alpha);
		Wait_(4);
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		���b�Z�[�W�֐�
//------------------------------------------------
//	����	: msg	���b�Z�[�WID
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMessage(msg)
{
	OpenMsgWnd_();
	ShowMsg_(msg);
	KeyInputWait_();
	CloseMsgWnd_();
}





