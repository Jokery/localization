//===================== I00_00�����̕X�� ====================
//---------------------------------
// ����Ԃ̗V�тŎg�p����萔
//---------------------------------
// �M�~�b�N�̋N���ƃN���A�t���O
const GIMMICK_FLG			 = "BFG_SPACE_GIMMICK_ICE";
const GIMMICK_CLEAR_FLG		 = "BFG_SPACE_GIMMICK_ICE_1ST_CLEAR";

// ��l���̕��A�ʒu�ƌ���
const XPOS_1				 = 2660.576;	// ��ՃX�C�b�`�t��
const YPOS_1				 = 1202.927;
const ZPOS_1				 = 1574.711;
const DIR_1					 = 180;

const XPOS_2				 = 2978.0;		// �S�[���{�X�̎�O
const YPOS_2				 = 1690.0;
const ZPOS_2				 = -1888.0;
const DIR_2					 = 120;

// �[���f���Ŏg�p����J�����̃m�[�h��
const CAMERA_EYE			 = "cameye_001";
const CAMERA_TGT			 = "camtgt_001";

// ��ՃX�C�b�`���N��������ׂ̌�ID
const GIMMICK_KEY_ID		 = 904;

// ��ՃX�C�b�`���N�����������̃��b�Z�[�WID
const GIMMICK_MSG_ID		 = "MASTERS_LOAD_REACTOR_MSG_012";

// ��ՃX�C�b�`�N����̍Đ��f���i���o�[
const DEMO_NUM				 = 333;

// �{�X�����X�^�[��ID (1=����, 2=2��ڈȍ~)
const BOSS_ID_1				 = "m016_00";	// �o�g�����b�N�X
const BOSS_ID_2				 = "m016_00";	// �o�g�����b�N�X

// �{�X�����X�^�[��Exchange�pID
const BOSS_EXCHANGE_ID		 = 55;			// �o�g�����b�N�X

// �{�X�����X�^�[�̃X�P�[���Ɨ֊s���̐ݒ� (1=����, 2=2��ڈȍ~)
//�yN�T�C�Y�z�X�P�[��=0.6, �V���G�b�g��=0.8
//�yM�T�C�Y�z�X�P�[��=1.0, �V���G�b�g��=1.0
//�yG�T�C�Y�z�X�P�[��=2.5, �V���G�b�g��=1.0
//�yT�T�C�Y�z�X�P�[��=6.0, �V���G�b�g��=1.0
const BOSS_SCALE_1			 = 1.0;
const BOSS_SILHOUETTE_1		 = 1.0;
const BOSS_SCALE_2			 = 1.0;
const BOSS_SILHOUETTE_2		 = 1.0;

// �{�X��̓G�p�[�e�B�e�[�u�� (1=����, 2=2��ڈȍ~)
const BOSS_PARTY_TABLE_1	 = 159;
const BOSS_PARTY_TABLE_2	 = 159;

// �{�X�𒇊Ԃɂ���ۂ̃����X�^�[�p�����[�^ (1=����, 2=2��ڈȍ~)
const BOSS_PARAMETER_1		 = 1807;
const BOSS_PARAMETER_2		 = 1807;

// �{�X���Ԍ�̃}�b�v�`�F���WID
const MAP_ID				 = "I00_00";



//------------------------------------------------
//		�퓬�I����
//------------------------------------------------
function AfterBattle()
{
	local main_num			= GetNumFlg_("NUM_SCENARIO_MAIN");						// Num0
	local ice_event_num		= GetNumFlg_("NUM_SCENARIO_SUB_ICE");					// Num5

	//---------------------------------
	// ����Ԃ̗V�уC�x���g�p�̃t���O
	//---------------------------------
	local info = {
		GIMMICK_FLG			 = GIMMICK_FLG,
	};
	
	MastersLoad_AfterBattle(info);


	EventEnd_();
}


//------------------------------------------------
//		�}�b�v�ɓ���O
//------------------------------------------------
function BeforeInitMap()
{
	// �t���O�̏�Ԃ��擾
	local main_num   = GetNumFlg_("NUM_SCENARIO_MAIN");							// Num0
	local ice_event_num		 = GetNumFlg_("NUM_SCENARIO_SUB_ICE");				// Num5
	local sky_num	 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");						// Num9
	
	// ���C�h�����܂܈ړ����u���g���ė����烉�C�h��������
	if(GetEventFlg_("BFG_RIDE_OFF_USED_TRANSFER") == true){
		//���C�h��������
		SetRideOffStart_();
	}
	
	//-----------------------------------
	// ����Ԃ̗V�уC�x���g�p�̃t���O�ݒ�
	//-----------------------------------
	local info = {
		GIMMICK_FLG			 = GIMMICK_FLG,
		GIMMICK_CLEAR_FLG	 = GIMMICK_CLEAR_FLG,
	};
	
	MastersLoad_SetFlag(info);
	
	
	EventEnd_();
}


//------------------------------------------------
//		�t�F�[�h�A�E�g��
//------------------------------------------------
function FadeIn()
{
	local main_num			= GetNumFlg_("NUM_SCENARIO_MAIN");						// Num0
	local ice_event_num		= GetNumFlg_("NUM_SCENARIO_SUB_ICE");					// Num5

	//local bit_ruler_north	= GetNumFlg_("BFG_RULER_ADD_013");						// Bit_213 ���[���ǉ� �k��[ �폜 : 2��DB #4894 ]

	// ���}�b�v���B�t���O
	SetEventFlg_("BFG_ARRIVE_AT_I00", true);										// Bit_90 ���B�t���O �X�t�B�[���h�}�b�v
	// ���Z�[�u�֎~������(�Z�[�u�֎~�}�b�v����A���Ă������p)
	SetEventFlg_("BFG_SAVE_PROHIBIT", false);		// �Z�[�u�֎~(Bit451)

	// �����Ԃ̐ݒ�
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){								// Num0 = 4
		if(GetEventFlg_("BFG_SCENARIO_CLEAR_ICE") == false){		// Bit_43 �N���A �X
			SetTime_(START_TIME_ZONE_NOON);		// ���ɐݒ�
			SetWeather_(WEATHER.NORMAL);		// �V��ʏ�(���V)�ɐݒ�
		}
	}

	// �������̍Đ�
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){								// Num0 = 4
		if (ice_event_num <= GetFlagID_("CONST_SS_IF_ARRIVE_ICE_FIELD")) {			// Num5 <= 1
			// �S�i�f�����܂����Ă��Ȃ��ꍇ�͊������Đ�������
			SetEventFlg_("BFG_I00_00_ENVIRONMENT_BGM_PLAY", true);
		}else{
			// �S�i�f����������͊������Đ������Ȃ�
			SetEventFlg_("BFG_I00_00_ENVIRONMENT_BGM_PLAY", false);
		}
	}
	
	// ���}�b�v�`�F���WNULL�ݒ�
	if (main_num == GetFlagID_("CONST_SM_ICE_FIELD")) {								// Num0 = 4
		if (ice_event_num < GetFlagID_("CONST_SS_IF_GO_TO_THE_ICE_RUINS")) {		// Num5 < 20
			SetHitEnableMapChangeNull_("w_I02_00ALdr_006", false);	// �X�̈��
		} else {
			SetEventFlg_("BFG_CHANGE_ICON_ICE_FIELD", true);				// Bit_1155 ��Ղ̔� �A�C�R���\���ؑ�
		}
	}

	DebugPrint(" ");
	DebugPrint("NUM_SCENARIO_MAIN �̒l�� " + main_num + " �ɂȂ�܂����B");
	DebugPrint("NUM_SCENARIO_SUB_ICE �̒l�� " + ice_event_num + " �ɂȂ�܂����B");

	//---------------
	// ���M�~�b�N�z�u
	//---------------
	// ID������
	g_gmk_monolith			<- C_NONE_ID;
	g_gim_rulerpoint01		<- C_NONE_ID;
	g_gim_rulerpoint02		<- C_NONE_ID;
	
	// ���\�[�X�ǂݍ���
	local id_monolith		= ReadGimmick_("o_com_02");		// ���m���X
	local id_transfer		= ReadGimmick_("o_com_01");		// �]�����u
	local id_rulerpoint		= ReadGimmick_("o_com_08");		// ���[���|�C���g

	// �����m���X
	g_gmk_monolith = ArrangePointGimmick_("o_com_02", id_monolith, "g_monolith");

	// ���ړ����u�i���y�̗쓹�j
	local gmk_enter_transfer = ArrangePointGimmick_("o_com_01", id_transfer, "g_transfer01");

	// ���ړ����u�i���S�̊č����j
	local gmk_exit_transfer = ArrangePointGimmick_("o_com_01", id_transfer, "g_transfer03");

	// �����[���|�C���g(���m���X�O)�����̈ʒu�ɒu���Ă��܂�
	g_gim_rulerpoint01 = ArrangePointGimmick_("o_com_08", id_rulerpoint, "g_rulerpoint01");
	SetMotion_(g_gim_rulerpoint01, MOT_GIMMICK_0, BLEND_N);
	if(GetEventFlg_("BFG_RULER_ADD_014") == true){									// Bit_214 ���[���ǉ� �����̊�
		SetMotion_(g_gim_rulerpoint01, MOT_GIMMICK_2, BLEND_N);
	}

	// �����[���|�C���g(�X�̈�ՑO)�����̈ʒu�ɒu���Ă��܂�
	g_gim_rulerpoint02 = ArrangePointGimmick_("o_com_08", id_rulerpoint, "g_rulerpoint02");
	SetMotion_(g_gim_rulerpoint02, MOT_GIMMICK_0, BLEND_N);
	if(GetEventFlg_("BFG_RULER_ADD_015") == true){									// Bit_215 ���[���ǉ� �X�̈��
		SetMotion_(g_gim_rulerpoint02, MOT_GIMMICK_2, BLEND_N);
	}

	//----------
	// ��NPC�z�u
	//----------
	// ID������
	g_npc_gatekeeper <- C_NONE_ID;
	g_npc_children_d <- C_NONE_ID;

	// ���\�[�X�ǂݍ���
	local id_gatekeeper = ReadNpc_("m035_00");	// ���m���X�O�̖��()

	// �����m���X�O�̖��
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){								// Num0 = 4
		if(ice_event_num < GetFlagID_("CONST_SS_IF_GO_TO_SEE_GATEKEEPER")){		// Num5 < 6
			g_npc_gatekeeper  = ArrangePointNpc_(id_gatekeeper,  "NPC_01");
			SetReactorMsg_(g_npc_gatekeeper, "ICE_NPC_REC");
			SetScaleSilhouette(g_npc_gatekeeper, SCALE.N ,SILHOUETTE_WIDTH.N);//�T�C�Y�̐ݒ�
		}
		else if(ice_event_num > GetFlagID_("CONST_SS_IF_ASKED_TODO")){				// Num5 > 5
			g_npc_gatekeeper  = ArrangePointNpc_(id_gatekeeper,  "NPC_01_2");
			SetReactorMsg_(g_npc_gatekeeper, "ICE_NPC_REC");
			SetScaleSilhouette(g_npc_gatekeeper, SCALE.N ,SILHOUETTE_WIDTH.N);//�T�C�Y�̐ݒ�
		}
	}
	else {
		g_npc_gatekeeper  = ArrangePointNpc_(id_gatekeeper,  "NPC_01_2");
		SetReactorMsg_(g_npc_gatekeeper, "ICE_NPC_REC");
		SetScaleSilhouette(g_npc_gatekeeper, SCALE.N ,SILHOUETTE_WIDTH.N);//�T�C�Y�̐ݒ�
	}

	// ���g�[�h�[�̎q���c(Redmine#3895 �� ���m���X����A���Ă����^�C�~���O�̂ݔz�u)
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){								// Num0 ==  4
		if(ice_event_num == GetFlagID_("CONST_SS_IF_GO_TO_THE_EAST_ICE_PARK")){		// Num5 == 14
			g_npc_children_d = ReadAndArrangePointNpc("m035_00", "NPC_02");
			SetReactorMsg_(g_npc_children_d, "NPC_TODO_CHILD_REC");
			SetScaleSilhouette(g_npc_children_d, SCALE.N ,SILHOUETTE_WIDTH.N);//�T�C�Y�̐ݒ�
		}
	}

	//-----------
	// ���n���z�u
	//-----------
	// ID������
	g_mine_board_01_inside	 <- C_NONE_ID;
	g_mine_board_02_inside	 <- C_NONE_ID;
	g_mine_board_03_inside	 <- C_NONE_ID;
	g_mine_board_04_inside	 <- C_NONE_ID;
	g_mine_board_05_inside	 <- C_NONE_ID;
	g_mine_board_01_outside	 <- C_NONE_ID;
	g_mine_board_02_outside	 <- C_NONE_ID;
	g_mine_board_03_outside	 <- C_NONE_ID;
	g_mine_board_04_outside	 <- C_NONE_ID;
	g_mine_board_05_outside	 <- C_NONE_ID;
	g_mine_enter_transfer	 <- C_NONE_ID;
	g_mine_exit_transfer	 <- C_NONE_ID;
	g_mine_monolith			 <- C_NONE_ID;
	g_mine_exit_01			 <- C_NONE_ID;
	g_mine_exit_02			 <- C_NONE_ID;
	g_mine_exit_03			 <- C_NONE_ID;
	g_mine_ruler_01			 <- C_NONE_ID;
	g_mine_ruler_02			 <- C_NONE_ID;
	g_mine_01				 <- C_NONE_ID;
	g_mine_01_b				 <- C_NONE_ID;
	g_mine_01_c				 <- C_NONE_ID;
	g_mine_01_d				 <- C_NONE_ID;
	g_mine_door				 <- C_NONE_ID;
	//g_mine_north_park		 <- C_NONE_ID; // [ �폜 : 2��DB #4894 ]
	g_mine_change_bgm_0		 <- C_NONE_ID;
	g_mine_change_bgm_1		 <- C_NONE_ID;
	g_mine_change_bgm_2		 <- C_NONE_ID;

	// ���ŔP��(�\)
	g_mine_board_01_inside = SetPointCircleEventMine_("mine_board01_inside", true);
	// ���ŔQ��(�\)
	g_mine_board_02_inside = SetPointCircleEventMine_("mine_board02_inside", true);
	// ���ŔR��(�\)
	g_mine_board_03_inside = SetPointCircleEventMine_("mine_board03_inside", true);
	// ���ŔS��(�\)
	g_mine_board_04_inside = SetPointCircleEventMine_("mine_board04_inside", true);
	// ���ŔT��(�\)
	g_mine_board_05_inside = SetPointCircleEventMine_("mine_board05_inside", true);
	// ���ŔP��(��)
	g_mine_board_01_outside = SetPointCircleEventMine_("mine_board01_outside", true);
	// ���ŔQ��(��)
	g_mine_board_02_outside = SetPointCircleEventMine_("mine_board02_outside", true);
	// ���ŔR��(��)
	g_mine_board_03_outside = SetPointCircleEventMine_("mine_board03_outside", true);
	// ���ŔS��(��)
	g_mine_board_04_outside = SetPointCircleEventMine_("mine_board04_outside", true);
	// ���ŔT��(��)
	g_mine_board_05_outside = SetPointCircleEventMine_("mine_board05_outside", true);

	// ���嗤�ړ����u(���y�̗쓹�s)
	g_mine_enter_transfer = SetPointCircleEventMine_("mine02", true);

	// ���嗤�ړ����u(���S�̊č����s)
	if(main_num >= GetFlagID_("CONST_SM_ICE_FIELD")){								// Num0 >= 4
		g_mine_exit_transfer = SetPointCircleEventMine_("mine04", true);
	}

	// �����m���X
	g_mine_monolith = SetPointCircleEventMine_("mine01", true);

	// ���o�[�`�����R���V�A���̓������ǂ��n��
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){								// Num0 = 4
		if(ice_event_num >= GetFlagID_("CONST_SS_IF_GO_TO_THE_WEST_ICE_PARK")		// Num5 >= 2
		&& ice_event_num < GetFlagID_("CONST_SS_IF_GO_TO_SEE_GATEKEEPER")){		// Num5 < 4
			g_mine_exit_01 = SetPointBoxEventMine_("Mine_Exit_01", false);
			g_mine_exit_02 = SetPointBoxEventMine_("Mine_Exit_02", false);
			g_mine_exit_03 = SetPointBoxEventMine_("Mine_Exit_03", false);
		}
	}

	// ���͂��߂ē����̕X���ɂ��āA�ŏ��̃g���l���𔲂������̃f�����Đ�����n��
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){								// Num0 = 4
		if(ice_event_num == GetFlagID_("CONST_SS_IF_ARRIVE_ICE_FIELD")){			// Num5 = 1
			g_mine_01 = SetPointBoxEventMine_("mine03", false);
			g_mine_01_b = SetPointBoxEventMine_("mine03_b", false);
			g_mine_01_c = SetPointBoxEventMine_("mine03_c", false);
			g_mine_01_d = SetPointBoxEventMine_("mine03_d", false);
		}
	}

	// �����[���|�C���g(���m���X�O)
	g_mine_ruler_01 = SetPointCircleEventMine_("mine_ruler_01", true);

	// �����[���|�C���g(�X�̈�ՑO)
	g_mine_ruler_02 = SetPointCircleEventMine_("mine_ruler_02", true);

	// �� �X�̈�Ղ̔�
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){								// Num0 = 4
		if (ice_event_num < GetFlagID_("CONST_SS_IF_GO_TO_THE_ICE_RUINS")) {		// Num5 < 20
			g_mine_door = SetPointCircleEventMine_("mine_door", true);
		}
	}

	// �� ���[���̂Ƃѐ�ǉ��n���i�k���j [ �폜 : 2��DB #4894 ]
	//if(!bit_ruler_north){					// Bit_213 ���[���ǉ� �k��
	//	g_mine_north_park = SetPointBoxEventMine_("mine_north_park", false);
	//}

	// �� �|�[���p�[�N��BGM��ύX���邽�߂̒n��
	if(GetEventFlg_("BFG_SET_CHANGE_BGM_MINE")){
		g_mine_change_bgm_0 = SetPointBoxEventMineNoFallWait_("mine_change_bgm_00");
		g_mine_change_bgm_1 = SetPointBoxEventMineNoFallWait_("mine_change_bgm_01");
		g_mine_change_bgm_2 = SetPointBoxEventMineNoFallWait_("mine_change_bgm_02");
		SetMinePlayerStop_(g_mine_change_bgm_0, false);
		SetMinePlayerStop_(g_mine_change_bgm_1, false);
		SetMinePlayerStop_(g_mine_change_bgm_2, false);
	}

	//-------------------------
	// �����A�N�^�[�|�C���g�z�u
	//-------------------------
	// ���ړ����u�i���y�̗쓹�j
	local reactorPoint01 = ArrangeMsgReactorPoint("recpoint_01_transfer", GetFlagID_("BFG_REACTER_POINT_015")// Bit_1514 ���A�N�^�[ �ړ����u
		, SHORT_DIST, "REC_POINT_ICE_03", "REC_POINT_ICE_03_2");

	// ���ړ����u�i���S�̊č����j
	local reactorPoint02 = ArrangeMsgReactorPoint("recpoint_02_transfer", GetFlagID_("BFG_REACTER_POINT_015")// Bit_1514 ���A�N�^�[ �ړ����u
		, SHORT_DIST, "REC_POINT_ICE_05", "REC_POINT_ICE_05_2");

	// �����m���X
	local reactorPoint09 = ArrangeMsgReactorPoint("recpoint_09_monolith", GetFlagID_("BFG_REACTER_POINT_013")// Bit_1512 ���A�N�^�[ ���m���X
		, SHORT_DIST, "REC_POINT_ICE_02", "REC_POINT_ICE_02_2");

	// ���X�g�����W���[��
	local reactorPoint03 = ArrangeMsgReactorPoint("recpoint_03_iminsen", GetFlagID_("BFG_REACTER_POINT_047")// Bit_1546
		, ENDLESS_DIST, "REC_POINT_ICE_06", "REC_POINT_ICE_06_2");

	// �������̂ނ���
	local reactorPoint04 = ArrangeMsgReactorPoint("recpoint_04_maou", GetFlagID_("BFG_REACTER_POINT_048")// Bit_1547
		, LONG_DIST, "REC_POINT_ICE_07", "REC_POINT_ICE_07_2");

	// ���|�[���p�[�N�P
	local reactorPoint05_1 = ArrangeMsgReactorPoint("recpoint_05_pora01", GetFlagID_("BFG_REACTER_POINT_049")// Bit1548_
		, SHORT_DIST, "REC_POINT_ICE_08", "REC_POINT_ICE_08_2");

	// ���|�[���p�[�N�Q
	local reactorPoint05_2 = ArrangeMsgReactorPoint("recpoint_05_pora02", GetFlagID_("BFG_REACTER_POINT_049")// Bit_1548
		, SHORT_DIST, "REC_POINT_ICE_08", "REC_POINT_ICE_08_2");

	// ���S�̔��M
	local reactorPoint06 = ArrangeMsgReactorPoint("recpoint_06_iseki", GetFlagID_("BFG_REACTER_POINT_050")// Bit_1549
		, LONG_DIST, "REC_POINT_ICE_09", "REC_POINT_ICE_09_2");

	// �������̖�
	local reactorPoint07 = ArrangeMsgReactorPoint("recpoint_07_misaki", GetFlagID_("BFG_REACTER_POINT_051")// Bit_1550
		, LONG_DIST, "REC_POINT_ICE_10", "REC_POINT_ICE_10_2");

	// ���X�̋x����
	local reactorPoint08 = ArrangeMsgReactorPoint("recpoint_08_kyusoujo", GetFlagID_("BFG_REACTER_POINT_052")// Bit_1551
		, SHORT_DIST, "REC_POINT_ICE_11", "REC_POINT_ICE_11_2");

	// ����X��
	local reactorPoint10 = ArrangeMsgReactorPoint("recpoint_10_hyokai", GetFlagID_("BFG_REACTER_POINT_053")// Bit_1552
		, LONG_DIST, "REC_POINT_ICE_12", "REC_POINT_ICE_12_2");

	// ���R�A
	local reactorPoint11 = ArrangeMsgReactorPoint("recpoint_11_core", GetFlagID_("BFG_REACTER_POINT_001")// Bit_1500 ���A�N�^�[ �R�A
		, ENDLESS_DIST, "REC_POINT_ICE_04", "REC_POINT_ICE_04_2");

	// ���X���̐�
	local reactorPoint12 = ArrangeMsgReactorPoint("recpoint_12_irie", GetFlagID_("BFG_REACTER_POINT_054")// Bit_1553
		, LONG_DIST, "REC_POINT_ICE_13", "REC_POINT_ICE_13_2");

	// ���C���̓��A
	local reactorPoint13 = ArrangeMsgReactorPoint("recpoint_13_doukutu", GetFlagID_("BFG_REACTER_POINT_055")// Bit_1554
		, SHORT_DIST, "REC_POINT_ICE_14", "REC_POINT_ICE_14_2");

	// �����[���|�C���g(���m���X�O)
	local reactorPoint_ruler01 = ArrangeMsgReactorPoint("recpoint_ruler_monolith", GetFlagID_("BFG_REACTER_POINT_010")// Bit_1520 ���A�N�^�[ ���[���|�C���g
		, SHORT_DIST, "REC_POINT_ICE_01", "REC_POINT_ICE_01_2");
	
	// �����[���|�C���g(�X�̈�ՑO)
	local reactorPoint_ruler02 = ArrangeMsgReactorPoint("recpoint_ruler_iseki", GetFlagID_("BFG_REACTER_POINT_010")// Bit_1520 ���A�N�^�[ ���[���|�C���g
		, SHORT_DIST, "REC_POINT_ICE_01", "REC_POINT_ICE_01_2");

	// ���Ŕ�
	local reactorPoint14_1 = ArrangeMsgReactorPoint("recpoint_14_board1", GetFlagID_("BFG_REACTER_POINT_180")// Bit_1679 �Ŕ̃��A�N�^�[�|�C���g
		, SHORT_DIST, "REC_POINT_ICE_15", "REC_POINT_ICE_15_2");
	local reactorPoint14_2 = ArrangeMsgReactorPoint("recpoint_14_board2", GetFlagID_("BFG_REACTER_POINT_180")// Bit_1679 �Ŕ̃��A�N�^�[�|�C���g
		, SHORT_DIST, "REC_POINT_ICE_15", "REC_POINT_ICE_15_2");
	local reactorPoint14_3 = ArrangeMsgReactorPoint("recpoint_14_board3", GetFlagID_("BFG_REACTER_POINT_180")// Bit_1679 �Ŕ̃��A�N�^�[�|�C���g
		, SHORT_DIST, "REC_POINT_ICE_15", "REC_POINT_ICE_15_2");
	local reactorPoint14_4 = ArrangeMsgReactorPoint("recpoint_14_board4", GetFlagID_("BFG_REACTER_POINT_180")// Bit_1679 �Ŕ̃��A�N�^�[�|�C���g
		, SHORT_DIST, "REC_POINT_ICE_15", "REC_POINT_ICE_15_2");
	local reactorPoint14_5 = ArrangeMsgReactorPoint("recpoint_14_board5", GetFlagID_("BFG_REACTER_POINT_180")// Bit_1679 �Ŕ̃��A�N�^�[�|�C���g
		, SHORT_DIST, "REC_POINT_ICE_15", "REC_POINT_ICE_15_2");

	// ���V���̒�
	local reactorPoint15 = ArrangeMsgReactorPoint("recpoint_15_keyhole", GetFlagID_("BFG_REACTER_POINT_176")
		, SHORT_DIST, "REC_POINT_ICE_16", "REC_POINT_ICE_16_2");

	//-----------------
	// ���}�b�v�i�r�z�u
	//-----------------
	// ���ړI�n
	local navi_park_west	= ArrangePointNaviMapIcon_(NAVIMAP_ICON.DESTINATION, "map_navi_park_west");	// ���|�[���p�[�N
	local navi_park_est	 	= ArrangePointNaviMapIcon_(NAVIMAP_ICON.DESTINATION, "map_navi_park_est");		// ���|�[���p�[�N
	local navi_monolith	 	= ArrangePointNaviMapIcon_(NAVIMAP_ICON.DESTINATION, "map_navi_monolith");		// ���m���X
	local navi_transfer	 	= ArrangePointNaviMapIcon_(NAVIMAP_ICON.DESTINATION, "map_navi_transfer");		// �č����s�̈ړ����u
	local navi_iseki		= ArrangePointNaviMapIcon_(NAVIMAP_ICON.DESTINATION, "map_navi_iseki");		// �X�̈��
	SetNaviMapIconVisible_(navi_park_west, false);
	SetNaviMapIconVisible_(navi_park_est, false);
	SetNaviMapIconVisible_(navi_monolith, false);
	SetNaviMapIconVisible_(navi_transfer, false);
	SetNaviMapIconVisible_(navi_iseki, false);

	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){								// Num0 = 4
		if(ice_event_num < GetFlagID_("CONST_SS_IF_GO_TO_SEE_GATEKEEPER")){			// Num5 < 6
			SetNaviMapIconVisible_(navi_park_west, true);
		}
		else if(ice_event_num < GetFlagID_("CONST_SS_IF_GO_TO_THE_EAST_ICE_PARK")){	// Num5 < 14
			SetNaviMapIconVisible_(navi_monolith, true);
		}
		else if(ice_event_num < GetFlagID_("CONST_SS_IF_GO_BACK_WEST_ICE_PARK")){	// Num5 < 15
			SetNaviMapIconVisible_(navi_park_est, true);
		}
		else if(ice_event_num < GetFlagID_("CONST_SS_IF_GO_TO_THE_ICE_CEMETERY")){	// Num5 < 17
			SetNaviMapIconVisible_(navi_park_west, true);
		}
		else if(ice_event_num < GetFlagID_("CONST_SS_IF_SECOND_ATTACK")){			// Num5 < 19
			SetNaviMapIconVisible_(navi_park_est, true);
		}
		else if(ice_event_num < GetFlagID_("CONST_SS_IF_GO_TO_THE_ICE_RUINS")){		// Num5 < 20
			SetNaviMapIconVisible_(navi_park_west, true);
		}
		else if(ice_event_num < GetFlagID_("CONST_SS_IF_CLEAR_ICE_FIELD")){			// Num5 < 36
			SetNaviMapIconVisible_(navi_iseki, true);
		}
		else {
			SetNaviMapIconVisible_(navi_transfer, true);
		}
	}

	// ���u�I�v
	local exclamation01 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "g_monolith");  // ���m���X

	// �����[���|�C���g�A�C�R��
	if(GetEventFlg_("BFG_RULER_ADD_014") == true){									// Bit_214 ���[���ǉ� �����̊�
		local icon01 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.RULER_POINT , "g_rulerpoint01");
		SetNaviMapIconVisible_(icon01, true);
	}

	// �����[���|�C���g�A�C�R��
	if(GetEventFlg_("BFG_RULER_ADD_015") == true){									// Bit_215 ���[���ǉ� �X�̈��
		local icon02 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.RULER_POINT , "g_rulerpoint02");
		SetNaviMapIconVisible_(icon02, true);
	}


	//-----------------------------
	// ����Ԃ̗V�уC�x���g�p�̔z�u
	//-----------------------------
	// ID������
	g_keyhole			 <- C_NONE_ID;
	g_keyhole_goal_point <- C_NONE_ID;
	
	g_keyhole_npc		 <- C_NONE_ID;
	
	g_keyhole_mine		 <- C_NONE_ID;
	g_keyhole_goal_mine	 <- C_NONE_ID;
	
	local info = {
		GIMMICK_FLG			 = GIMMICK_FLG,
		GIMMICK_CLEAR_FLG	 = GIMMICK_CLEAR_FLG,
		BOSS_ID_1			 = BOSS_ID_1,
		BOSS_ID_2			 = BOSS_ID_2,
		BOSS_SCALE_1		 = BOSS_SCALE_1,
		BOSS_SILHOUETTE_1	 = BOSS_SILHOUETTE_1,
		BOSS_SCALE_2		 = BOSS_SCALE_2,
		BOSS_SILHOUETTE_2	 = BOSS_SILHOUETTE_2,
	};
	
	MastersLoad_Setting(info);
	
	
	EventEnd_();
}


//------------------------------------------------
//		�t�B�[���h����J�n
//------------------------------------------------
function EventStartOperate()
{
	local main_num		 = GetNumFlg_("NUM_SCENARIO_MAIN");						// Num0
	local ice_event_num	 = GetNumFlg_("NUM_SCENARIO_SUB_ICE");					// Num5
	
	// �����C�h�t�B���^����
	if(GetEventFlg_("BFG_RIDE_LICENSE_DIVE") == true){		// Bit_62 �a�����N���C�h���C�Z���X ����
		if(!IsOpenNaviMapRideFilter_(RIDE_FILTER.DIVE)){
			local player = GetPlayerId_();
			Wait_(35);
			SetMotion_(player, MOT_WAIT, BLEND_M);
			// ���A�N�^�[����̂��m�点�̋���
			CommReactorActionNotice();
			// ���b�Z�[�W
			OpenMsgWnd_();
		    SetTalkName_("NAME_TAG_REACTOR");
		    ShowMsg_("RIDE_FILTER_MSG_01");
		    KeyInputWait_();
		    CloseMsgWnd_();
			OpenNaviMapRideFilter_(RIDE_FILTER.DIVE);
			// �v���C���[�̃��[�V������ҋ@��Ԃɖ߂�
			CommResetPlayerMotion();
		}
	}
	
	// ���q���c�̋�����b
	if(GetEventFlg_("BFG_DISPLAYED_CHILDREN_D_MSG") == false){
		if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){								// Num0 ==  4
			if(ice_event_num == GetFlagID_("CONST_SS_IF_GO_TO_THE_EAST_ICE_PARK")){		// Num5 == 14
				SetEventFlg_("BFG_DISPLAYED_CHILDREN_D_MSG", true);
				Wait_(15);
				// ���b�Z�[�W
				OpenMsgWnd_();
				ShowMsg_("CHILDREN_D_MSG_001"); // �u�e���Ɍ����� ���񂽂̗l�q�� ���ɗ�����
				KeyInputWait_();
				ShowMsg_("CHILDREN_D_MSG_002"); // �u�J���o���̋߂����� �����g���l����
				KeyInputWait_();
			    CloseMsgWnd_();
			}
		}
	}
	
	//-----------------
	// ���A�j���[�V����
	//-----------------
	// ���m���X(�u�N���O�ҋ@�v�̃A�j����ݒ�)
	SetMotion_(g_gmk_monolith, MOT_GIMMICK_0, BLEND_N);
	if(GetEventFlg_("BFG_START_B_MONOLITH") == true){		// Bit_1014 �a�����N���m���X�N���t���O
		// ���m���X�̋N����ҋ@�A�j�����Đ�
		SetMotion_(g_gmk_monolith, MOT_GIMMICK_2, BLEND_N);
	}

	//-----------------------
	// ���ړ����u���g�p������
	//-----------------------
	if(GetEventFlg_("BFG_RIDE_OFF_USED_TRANSFER") == true){
		UsingTransfer();
		
		// �͂��߂ē����̕X���ɗ����Ƃ�
		if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){
			if(ice_event_num == GetFlagID_("CONST_SS_IF_ARRIVE_ICE_FIELD")){
				local shop_lv = 1;
				CommShopLevelChange(shop_lv);
				CommSavedAfterTransferDemo("BFG_SCENARIO_CLEAR_GRAVE");
			}
		}
		
		SetEventFlg_("BFG_RIDE_OFF_USED_TRANSFER", false);
	}

	//-------------------------------------------
	// ����Ԃ̗V�уC�x���g�p�̃J�E���g�_�E���\��
	//-------------------------------------------
	local info = {
		GIMMICK_FLG			 = GIMMICK_FLG,
	};
	
	MastersLoad_CountDown(info);
	
	//--------------------------------
	// ����Ԃ̗V�уC�x���g�p�̐퓬����
	//--------------------------------
	local info = {
		GIMMICK_FLG			 = GIMMICK_FLG,
		GIMMICK_CLEAR_FLG	 = GIMMICK_CLEAR_FLG,
		XPOS_1				 = XPOS_1,
		YPOS_1				 = YPOS_1,
		ZPOS_1				 = ZPOS_1,
		DIR_1				 = DIR_1,
		CAMERA_EYE			 = CAMERA_EYE,
		CAMERA_TGT			 = CAMERA_TGT,
		BOSS_EXCHANGE_ID	 = BOSS_EXCHANGE_ID,
		BOSS_PARAMETER_1	 = BOSS_PARAMETER_1,
		BOSS_PARAMETER_2	 = BOSS_PARAMETER_2,
		MAP_ID				 = MAP_ID,
	};
	
	MastersLoad_BattleJudgment(info);

	EventEnd_();
}


//------------------------------------------------
//		�m�o�b�ڐG��
//------------------------------------------------
function TouchNpc()
{
	local main_num			= GetNumFlg_("NUM_SCENARIO_MAIN");						// Num0
	local ice_event_num		= GetNumFlg_("NUM_SCENARIO_SUB_ICE");					// Num5

	local target = GetTargetId_();

	DebugPrint("ID: " + target + " �ɐڐG [TouchNpc]");

	switch (target) {
	case g_npc_gatekeeper :
		uTalkGatekeeper();
		break;
	case g_npc_children_d :
		uTalkChildrenD();
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
	local main_num			= GetNumFlg_("NUM_SCENARIO_MAIN");						// Num0
	local ice_event_num		= GetNumFlg_("NUM_SCENARIO_SUB_ICE");					// Num5
	local dont_use_transfer1 = GetEventFlg_("BFG_DONT_TRANSFER_GRAVE_TO_ICE");		// �쓹-�X���Ԃ̑嗤�ړ����u�̎g�p���֎~����t���O
	local dont_use_transfer2 = GetEventFlg_("BFG_DONT_TRANSFER_ICE_TO_SAND");		// �X��-�����Ԃ̑嗤�ړ����u�̎g�p���֎~����t���O

	local target = GetTouchEventMineId_();
	local player = GetPlayerId_();

	switch ( target ) {
	// �ŔP��(�\)
	case g_mine_board_01_inside:
		CommTurnAroundAndSetPlayableCamera(-65);
		OpenMsgWnd_();
		ShowMsg_("INSIDE_GUIDE_MSG_01");
		KeyInputWait_();
		CloseMsgWnd_();
		break;
	// �ŔP��(��)
	case g_mine_board_01_outside:
		CommPlayerTurnAroundDir(115);
		OpenMsgWnd_();
		ShowMsg_("OUTSIDE_GUIDE_MSG_01");
		KeyInputWait_();
		CloseMsgWnd_();
		break;
	// �ŔQ��(�\)
	case g_mine_board_02_inside:
		CommTurnAroundAndSetPlayableCamera(-25);
		OpenMsgWnd_();
		ShowMsg_("INSIDE_GUIDE_MSG_02");
		KeyInputWait_();
		CloseMsgWnd_();
		break;
	// �ŔQ��(��)
	case g_mine_board_02_outside:
		CommPlayerTurnAroundDir(145);
		OpenMsgWnd_();
		ShowMsg_("OUTSIDE_GUIDE_MSG_02");
		KeyInputWait_();
		CloseMsgWnd_();
		break;
	// �ŔR��(�\)
	case g_mine_board_03_inside:
		CommTurnAroundAndSetPlayableCamera(150);
		OpenMsgWnd_();
		ShowMsg_("INSIDE_GUIDE_MSG_03");
		KeyInputWait_();
		CloseMsgWnd_();
		break;
	// �ŔR��(��)
	case g_mine_board_03_outside:
		CommPlayerTurnAroundDir(-10);
		OpenMsgWnd_();
		ShowMsg_("OUTSIDE_GUIDE_MSG_03");
		KeyInputWait_();
		CloseMsgWnd_();
		break;
	// �ŔS��(�\)
	case g_mine_board_04_inside:
		CommTurnAroundAndSetPlayableCamera(75);
		OpenMsgWnd_();
		ShowMsg_("INSIDE_GUIDE_MSG_04");
		KeyInputWait_();
		CloseMsgWnd_();
		break;
	// �ŔS��(��)
	case g_mine_board_04_outside:
		CommPlayerTurnAroundDir(-100);
		OpenMsgWnd_();
		ShowMsg_("OUTSIDE_GUIDE_MSG_04");
		KeyInputWait_();
		CloseMsgWnd_();
		break;
	// �ŔT��(�\)
	case g_mine_board_05_inside:
		CommTurnAroundAndSetPlayableCamera(40);
		OpenMsgWnd_();
		ShowMsg_("INSIDE_GUIDE_MSG_05");
		KeyInputWait_();
		CloseMsgWnd_();
		break;
	// �ŔT��(��)
	case g_mine_board_05_outside:
		CommPlayerTurnAroundDir(-140);
		OpenMsgWnd_();
		ShowMsg_("OUTSIDE_GUIDE_MSG_05");
		KeyInputWait_();
		CloseMsgWnd_();
		break;
	//�嗤�ړ����u(�쓹�s)
	case g_mine_enter_transfer:
		if(dont_use_transfer1 == false){
			// �I�������b�Z�[�W
			OpenMsgWnd_();
			ShowMsg_("MINE_02_MSG");
			KeyInputWait_();
			//�͂�
			if(GetQueryResult_() == QUERY_YES){
				CloseMsgWnd_();
				// ���C�h��Ԃő嗤�ړ������ꍇ�A���C�h����������t���O
				SetEventFlg_("BFG_RIDE_OFF_USED_TRANSFER", true);
				// ���y�̗쓹��
				ChangeMapPosDir_("G00_00", Vec3(-610.881, 455.082,-1766. 084), 46);
			}
			//������
			else{
				CloseMsgWnd_();
			}
		}
		// �ړ����u�̎g�p�֎~���������ꍇ
		else{
			// �V�X�e�����b�Z�[�W
			OpenMsgWnd_();
			ShowMsg_("DONT_USE_TRANSFER_010");		// �ړ����u�́@�����Ă��Ȃ��B
			KeyInputWait_();
			CloseMsgWnd_();
		}
		break;

	//�嗤�ړ����u(���S�̊č����s)
	case g_mine_exit_transfer:
		if(dont_use_transfer2 == false){
			//�N���A��
			if(main_num >= GetFlagID_("CONST_SM_PRISON")){								// Num0 >= 5
				// �I�������b�Z�[�W
				OpenMsgWnd_();
				ShowMsg_("MINE_04_MSG");
				KeyInputWait_();
				//�͂�
				if(GetQueryResult_() == QUERY_YES){
					CloseMsgWnd_();
					// ���C�h��Ԃő嗤�ړ������ꍇ�A���C�h����������t���O
					SetEventFlg_("BFG_RIDE_OFF_USED_TRANSFER", true);
					// ���S�̊č�����
					ChangeMapPosDir_("S00_00", Vec3(-0.944, -357.0, 1362.843), 180);
				}
				//������
				else{
					CloseMsgWnd_();
				}
			}
			if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){							// Num0 = 4
				//�N����
				if(ice_event_num == GetFlagID_("CONST_SS_IF_CLEAR_ICE_FIELD")){			// Num5 = 36
					DeleteEventMine_(g_mine_exit_transfer);
					
					// Num�t���O�ݒ�
					SetNumFlg_("NUM_SCENARIO_MAIN", GetFlagID_("CONST_SM_PRISON"));		// Num0 <- 5
					
					// Bit�t���O�ݒ�
					SetEventFlg_("BFG_SAVE_POINT_FLAG", true);			// Bit_1033 �Z�[�u�|�C���g������
					SetEventFlg_("BFG_RIDE_OFF_USED_TRANSFER", true);	// ���C�h��Ԃő嗤�ړ������ꍇ�A���C�h����������t���O
					
					// �f���Đ���̕��A�ʒu
					SetReturnDemoMap_("S00_00"); 
					SetReturnDemoPosDir_(Vec3(-0.944, -357.0, 1362.843), 180);
					
					TouchNpcChangeDemo(331);	//331[�ړ����u�g�p]
				}
				//�N���O
				if(ice_event_num <= GetFlagID_("CONST_SS_IF_MOVE_THE_WORLD_4")){		// Num5 <= 35
					//�V�X�e�����b�Z�[�W
					OpenMsgWnd_();
					ShowMsg_("MINE_04_MSG_2");
					KeyInputWait_();
					CloseMsgWnd_();
				}
			}
		}
		// �ړ����u�̎g�p�֎~���������ꍇ
		else{
			// �V�X�e�����b�Z�[�W
			OpenMsgWnd_();
			ShowMsg_("DONT_USE_TRANSFER_010");		// �ړ����u�́@�����Ă��Ȃ��B
			KeyInputWait_();
			CloseMsgWnd_();
		}
		break;

	//���m���X
	case g_mine_monolith:
		CommPlayerTurnAroundObj(g_gmk_monolith);
		// ���m���X�̃A�j�����Đ�(EventCommon)
		MonolithAnime(g_gmk_monolith, "BFG_START_B_MONOLITH", "g_monolith");
		// �}�b�v���o�[�`�����R���V�A���ɕύX����
		ChangeMapPosDir_("O01_00", Vec3(1260.0, 10.0, 0.0), -90);
		break;

	//�͂��߂ē����̕X���ɂ��āA�ŏ��̃g���l���𔲂������̃f�����Đ�����n��
	case g_mine_01:
	case g_mine_01_b:
	case g_mine_01_c:
	case g_mine_01_d:
		if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){							// Num0 = 4
			if(ice_event_num == GetFlagID_("CONST_SS_IF_ARRIVE_ICE_FIELD")){		// Num5 = 1
				DeleteEventMine_(g_mine_01);
				DeleteEventMine_(g_mine_01_b);
				DeleteEventMine_(g_mine_01_c);
				DeleteEventMine_(g_mine_01_d);
				SetNumFlg_("NUM_SCENARIO_SUB_ICE", GetFlagID_("CONST_SS_IF_GO_TO_THE_WEST_ICE_PARK"));// Num5 <- 2
				// �f����̕��A�ʒu�̐ݒ�
				SetReturnDemoPosDir_(Vec3(-602.2, 683.0, -1397.9), 87);
				
				//300[�����̕X���E�S�i]
				ChangeDemo_(300);
			}
		}
		break;

	//�o�[�`�����R���V�A���̓������ǂ��n��
	case g_mine_exit_01:
	case g_mine_exit_02:
	case g_mine_exit_03:
		if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){							// Num0 = 4
			//[�����̕X���E�S�i]��
			if(ice_event_num >= GetFlagID_("CONST_SS_IF_GO_TO_THE_WEST_ICE_PARK")	// Num5 >= 2
			&& ice_event_num < GetFlagID_("CONST_SS_IF_GO_TO_SEE_GATEKEEPER")){	// Num5 < 6
				
				local dir = GetDir_(g_npc_gatekeeper);
				
				FaceToFaceNpc(g_npc_gatekeeper);
				
				OpenMsgWnd_();
				ShowMsg_("DEMO_001_AFT_BC");
				KeyInputWait_();
				CloseMsgWnd_();
				
				Task_RotateToDirSetMotion_(g_npc_gatekeeper, dir, 5.7, MOT_WALK, MOT_WAIT);
				
				if(target == g_mine_exit_01){
					CommPlayerTurnMoveDirWalk(0);
				}
				if(target == g_mine_exit_02){
					CommPlayerTurnMoveDirWalk(90);
				}
			}
		}
		break;

	//���[���|�C���g(���m���X�O)
	case g_mine_ruler_01:
		CommPlayerTurnAroundObj(g_gim_rulerpoint01);
		CommRulerPointEvent(g_gim_rulerpoint01, "BFG_RULER_ADD_014", "g_rulerpoint01"); 
		break;

	//���[���|�C���g(�X�̈�ՑO)
	case g_mine_ruler_02:
		CommPlayerTurnAroundObj(g_gim_rulerpoint02);
		CommRulerPointEvent(g_gim_rulerpoint02, "BFG_RULER_ADD_015", "g_rulerpoint02"); 
		break;

	// �X�̈�Ղ̔�
	case g_mine_door:
		if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){								// Num0 = 4
			if (ice_event_num < GetFlagID_("CONST_SS_IF_GO_TO_THE_ICE_RUINS")) {		// Num5 < 20
				local pos  = Vec3(2344.3, 600.0, 1993.0);
				uPlayerTurnAroundPos(pos);
				
				OpenMsgWnd_();
			    SetTalkName_("NAME_TAG_DOORLOCK");	// �h�A���b�N ��
				ShowMsg_("DOOR_MSG_000");		// �u���Ȃ��̃��A�N�^�[�ɂ� ���̃h�A��
				KeyInputWait_();
				CloseMsgWnd_();
				
				OpenMsgWnd_();
				ShowMsg_("SYSTEM_MSG_000");		// ���� �J���Ȃ��悤���c�c�B
				KeyInputWait_();
				CloseMsgWnd_();
			}
		}
		break;

	// ���[���̂Ƃѐ�ǉ��n���i�k���j[ �폜 : 2��DB #4894 ]
	//case g_mine_north_park:
	//		DeleteEventMine_(g_mine_north_park);
	//		SetEventFlg_("BFG_RULER_ADD_013", true);	// Bit_213 ���[���ǉ� �k��
	//	break;

	// �|�[���p�[�N��BGM��ύX���邽�߂̒n��
	case g_mine_change_bgm_0:
		uSetFlagChangeBgm(true);
		break;
	case g_mine_change_bgm_1:
		uSetFlagChangeBgm(false);
		break;
	case g_mine_change_bgm_2:
		uSetFlagChangeBgm(true);
		break;

	// ��Ԃ̗V�� ��ՃX�C�b�`�𒲂ׂ���
	case g_keyhole_mine :
		local info = {
			GIMMICK_FLG			 = GIMMICK_FLG,
			GIMMICK_CLEAR_FLG	 = GIMMICK_CLEAR_FLG,
			GIMMICK_KEY_ID		 = GIMMICK_KEY_ID,
			GIMMICK_MSG_ID		 = GIMMICK_MSG_ID,
			XPOS_1				 = XPOS_1,
			YPOS_1				 = YPOS_1,
			ZPOS_1				 = ZPOS_1,
			DIR_1				 = DIR_1,
			BOSS_ID_1			 = BOSS_ID_1,
			BOSS_ID_2			 = BOSS_ID_2,
			BOSS_SCALE_1		 = BOSS_SCALE_1,
			BOSS_SILHOUETTE_1	 = BOSS_SILHOUETTE_1,
			BOSS_SCALE_1		 = BOSS_SCALE_2,
			BOSS_SILHOUETTE_1	 = BOSS_SILHOUETTE_2,
			DEMO_NUM			 = DEMO_NUM,
			MAP_ID				 = MAP_ID,
		};
		
		MastersLoad_MineStart(info);
		break;
	// ��Ԃ̗V�� �S�[���n��
	case g_keyhole_goal_mine :
		local info = {
			GIMMICK_FLG			 = GIMMICK_FLG,
			GIMMICK_CLEAR_FLG	 = GIMMICK_CLEAR_FLG,
			XPOS_2				 = XPOS_2,
			YPOS_2				 = YPOS_2,
			ZPOS_2				 = ZPOS_2,
			DIR_2				 = DIR_2,
			CAMERA_EYE			 = CAMERA_EYE,
			CAMERA_TGT			 = CAMERA_TGT,
			BOSS_EXCHANGE_ID	 = BOSS_EXCHANGE_ID,
			BOSS_PARTY_TABLE_1	 = BOSS_PARTY_TABLE_1,
			BOSS_PARTY_TABLE_2	 = BOSS_PARTY_TABLE_2,
		};
		
		MastersLoad_MineGoal(info);
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
	local main_num			= GetNumFlg_("NUM_SCENARIO_MAIN");						// Num0
	local ice_event_num		= GetNumFlg_("NUM_SCENARIO_SUB_ICE");					// Num5

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
//		���m���X�O�̖�� ��b����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkGatekeeper()
{
	local main_num			= GetNumFlg_("NUM_SCENARIO_MAIN");						// Num0
	local ice_event_num		= GetNumFlg_("NUM_SCENARIO_SUB_ICE");					// Num5
	
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){								// Num0 = 4
		if (ice_event_num < GetFlagID_("CONST_SS_IF_GO_TO_SEE_GATEKEEPER")) {		// Num5 < 6
			OpenMsgWnd_();
			ShowMsg_("DEMO_001_AFT_BC");	// �u�R���R�� �_�����ׁI ������
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if(ice_event_num >= GetFlagID_("CONST_SS_IF_GO_TO_SEE_GATEKEEPER")		// Num5 >=  6
		&& ice_event_num <= GetFlagID_("CONST_SS_VC_JDG_THIRD_BATTLE_B")){			// Num5 <= 13
			OpenMsgWnd_();
			ShowMsg_("DEMO_004_AFT_BC");	// �u�e������b�͕����Ă�ׁB�Ȃ�ق� ������
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else{
			OpenMsgWnd_();
			ShowMsg_("DEMO_005_AFT_BC");	// �u�X���� �����ɂ� ����΂��u���Ă���񂾂ׁB
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else {
		OpenMsgWnd_();
		ShowMsg_("DEMO_005_AFT_BC");		// �u�X���� �����ɂ� ����΂��u���Ă���񂾂ׁB
		KeyInputWait_();
		CloseMsgWnd_();
	}
}

//++++++++++++++++++++++++++++++++++++++++++++++
// �q���c ��b����
//----------------------------------------------
// ����  : �Ȃ�
// �߂�l: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++
function uTalkChildrenD()
{
	local main_num			= GetNumFlg_("NUM_SCENARIO_MAIN");						// Num0
	local ice_event_num		= GetNumFlg_("NUM_SCENARIO_SUB_ICE");					// Num5

	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){								// Num0 ==  4
		if(ice_event_num == GetFlagID_("CONST_SS_IF_GO_TO_THE_EAST_ICE_PARK")){		// Num5 == 14
			OpenMsgWnd_();
			ShowMsg_("CHILDREN_D_MSG_001"); // �u�e���Ɍ����� ���񂽂̗l�q�� ���ɗ�����
			KeyInputWait_();
			ShowMsg_("CHILDREN_D_MSG_002"); // �u�J���o���̋߂����� �����g���l����
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
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

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//		�|�[���p�[�N��BGM�ύX�p�t���O�̐ݒ�
//---------------------------------------------------------------------------
// ����		�F�Ȃ�
// �߂�l	�F�Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function uSetFlagChangeBgm(isChange)
{
	SetEventFlg_("BFG_I01_00_EVENT_BGM021_PLAY", isChange);
}
