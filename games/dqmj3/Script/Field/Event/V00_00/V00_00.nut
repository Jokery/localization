//===================== V00_00�ŔM�̉ΎR ====================
//---------------------------------
// ����Ԃ̗V�тŎg�p����萔
//---------------------------------
// �M�~�b�N�̋N���ƃN���A�t���O
const GIMMICK_FLG			 = "BFG_SPACE_GIMMICK_VOLCANO";
const GIMMICK_CLEAR_FLG		 = "BFG_SPACE_GIMMICK_VOLCANO_1ST_CLEAR";

// ��l���̕��A�ʒu�ƌ���
const XPOS_1				 = -90.593;		// ��ՃX�C�b�`�t��
const YPOS_1				 = 1370.699;
const ZPOS_1				 = -1837.342;
const DIR_1					 = 86;

const XPOS_2				 = 2002.0;		// �S�[���{�X�̎�O
const YPOS_2				 = 1300.0;
const ZPOS_2				 = 1445.0;
const DIR_2					 = 148;

// �[���f���Ŏg�p����J�����̃m�[�h��
const CAMERA_EYE			 = "cameye_001";
const CAMERA_TGT			 = "camtgt_001";

// ��ՃX�C�b�`���N��������ׂ̌�ID
const GIMMICK_KEY_ID		 = 906;

// ��ՃX�C�b�`���N�����������̃��b�Z�[�WID
const GIMMICK_MSG_ID		 = "MASTERS_LOAD_REACTOR_MSG_013";

// ��ՃX�C�b�`�N����̍Đ��f���i���o�[
const DEMO_NUM				 = 535;

// �{�X�����X�^�[��ID (1=����, 2=2��ڈȍ~)
const BOSS_ID_1				 = "m079_00";	// ���ɂ���ڂ�
const BOSS_ID_2				 = "m079_00";	// ���ɂ���ڂ�

// �{�X�����X�^�[��Exchange�pID
const BOSS_EXCHANGE_ID		 = 245;			// ���ɂ���ڂ�

// �{�X�����X�^�[�̃X�P�[���Ɨ֊s���̐ݒ� (1=����, 2=2��ڈȍ~)
//�yN�T�C�Y�z�X�P�[��=0.6, �V���G�b�g��=0.8
//�yM�T�C�Y�z�X�P�[��=1.0, �V���G�b�g��=1.0
//�yG�T�C�Y�z�X�P�[��=2.5, �V���G�b�g��=1.0
//�yT�T�C�Y�z�X�P�[��=6.0, �V���G�b�g��=1.0
const BOSS_SCALE_1			 = 2.5;
const BOSS_SILHOUETTE_1		 = 1.0;
const BOSS_SCALE_2			 = 2.5;
const BOSS_SILHOUETTE_2		 = 1.0;

// �{�X��̓G�p�[�e�B�e�[�u�� (1=����, 2=2��ڈȍ~)
const BOSS_PARTY_TABLE_1	 = 163;
const BOSS_PARTY_TABLE_2	 = 163;

// �{�X�𒇊Ԃɂ���ۂ̃����X�^�[�p�����[�^ (1=����, 2=2��ڈȍ~)
const BOSS_PARAMETER_1		 = 1811;
const BOSS_PARAMETER_2		 = 1811;

// �{�X���Ԍ�̃}�b�v�`�F���WID
const MAP_ID				 = "V00_00";



// �ϐ���`
main_num	 <- C_NONE_ID;
volcano_num	 <- C_NONE_ID;

str_num_sub <- "NUM_SCENARIO_SUB_VOLCANO";


//------------------------------------------------
//		�퓬�I����
//------------------------------------------------
function AfterBattle()
{
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");
	volcano_num	 = GetNumFlg_("NUM_SCENARIO_SUB_VOLCANO");
	
	// �f�X�o�[���ɕ���������NUM�t���O��ύX���鏈���i�v���Ӂj
	// �C�x���g�u���b�N��EventStartOperate()�ł͔s�k�𔻒�ł��Ȃ��̂�
	// �����Ŕs�k�̔���ƃt���O�ύX���s���B
	if (main_num == GetFlagID_("CONST_SM_VOLCANO")) {									// Num0 = 6
		if (volcano_num == GetFlagID_("CONST_SS_HV_JDG_BATTLE_DEATHBURN")) {			// Num7 = 20
			// �f�X�o�[���ɔs�k
			if(GetBattleEndType_() == END_TYPE_LOSE){
				SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_HV_CONTACT_DEATHBURN"));	// Num7 <- 21
			}
		}
		//�Đ펞
		if (volcano_num == GetFlagID_("CONST_SS_HV_JDG_REMATCH_DEATHBURN")) {			// Num7 = 23
			// �f�X�o�[���ɔs�k
			if(GetBattleEndType_() == END_TYPE_LOSE){
				SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_HV_CONTACT_DEATHBURN"));	// Num7 <- 21
			}
		}
	}
	
	
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
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");
	volcano_num	 = GetNumFlg_("NUM_SCENARIO_SUB_VOLCANO");
	local sky_num	 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");						// Num9
	
	// Demo505[��ׂȂ��I]�̍Đ����Demo517[�o�[�f�B�̔���]�̍Đ���̓��C�h�̉������s��
	if(main_num == GetFlagID_("CONST_SM_VOLCANO")){
		if(volcano_num == GetFlagID_("CONST_SS_HV_BIRDY_NEAR_THE_MONOLITH")
		|| volcano_num == GetFlagID_("CONST_SS_HV_GO_TO_THE_RED_WALL")){
			//���C�h��������
			SetRideOffStart_();
		}
	}
	
	// ���C�h�����܂܈ړ����u���g���ė����烉�C�h��������
	if(GetEventFlg_("BFG_RIDE_OFF_USED_TRANSFER") == true){
		//���C�h��������
		SetRideOffStart_();
	}
	
	// �[���f��[�閧�̃��m���X]�Đ��O�Ƀ��C�h����
	if(GetEventFlg_("BFG_PLAY_PSEUDO_DEMO_VOLCANO") == true){
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
	// �}�b�v���B�t���O
	SetEventFlg_("BFG_ARRIVE_AT_V00", true);
	// �Z�[�u�֎~������(�Z�[�u�֎~�}�b�v����A���Ă������p)
	SetEventFlg_("BFG_SAVE_PROHIBIT", false);		// �Z�[�u�֎~(Bit451)

	main_num				= GetNumFlg_("NUM_SCENARIO_MAIN");
	volcano_num				= GetNumFlg_("NUM_SCENARIO_SUB_VOLCANO");
	
	DebugPrint(" ");
	DebugPrint("NUM_SCENARIO_MAIN �̒l�� " + main_num + " �ɂȂ�܂����B");
	DebugPrint("NUM_SCENARIO_SUB_VOLCANO �̒l�� " + volcano_num + " �ɂȂ�܂����B");

	//------------------------------------
	//  �ΎR�V�i���I�N���A��ɐݒ肷�����
	//------------------------------------
	if(GetEventFlg_("BFG_SCENARIO_CLEAR_VOLCANO") == true){
		SetEventFlg_("BFG_V00_00_WEATHER_FIX_BAD", false);	// ���V��Œ�t���O���~�낷
		SetEventFlg_("BFG_V00_00_EVENT_BGM006_PLAY", false);// ���V�ł��� BGM006 ������Ȃ��悤�ɂ���
	}
	
	//----------------------------------------------------------------------
	// ��BGM�ύX�t���O�̐ؑ�(1.�V��ω���FadeIn()�́��V��ω��ōs���Ă��܂�)
	//                      (2.�ΎR�̃V�i���I���͈��V��ł�BGM006�������)
	//                      (3.�R�A�̃V�i���I�ɓ˓�������t���O�uBFG_V00_00_EVENT_BGM006_PLAY�v��false�ɂ���)
	//----------------------------------------------------------------------
	if(main_num == GetFlagID_("CONST_SM_VOLCANO")) {					// Num0 == 6
		if(volcano_num == GetFlagID_("CONST_SS_HV_GO_TO_THE_VOLCANO")){ // Num7 == 1
			// Demo500[�ŔM�̉ΎR�E�S�i]�̍Đ����BGM�ύX�i���V��ł� BGM006 ���Đ�����悤�ɂ���j
			SetEventFlg_("BFG_V00_00_EVENT_BGM006_PLAY", true);
		}
	}

	//---------------
	// ���M�~�b�N�z�u
	//---------------
	// ID������
	g_gim_monolith        <- C_NONE_ID;
	g_gim_rulerpoint01    <- C_NONE_ID;
	g_gim_rulerpoint02    <- C_NONE_ID;
	g_gim_rulerpoint03    <- C_NONE_ID;
	g_gim_transfer_device <- C_NONE_ID;
	g_gim_rockdoor        <- C_NONE_ID;
	g_gim_kui01           <- C_NONE_ID;
	g_gim_kui02           <- C_NONE_ID;
	g_gim_door01          <- C_NONE_ID;
	g_gim_door02          <- C_NONE_ID;
	g_gim_lift            <- C_NONE_ID;
	g_gim_opendevice      <- C_NONE_ID;

	// ���\�[�X�ǂݍ���
	local id_monojith	 = ReadGimmick_("o_com_02");		// ���m���X
	local id_ruler		 = ReadGimmick_("o_com_08");		// ���[���|�C���g
	local id_transfer	 = ReadGimmick_("o_com_01");		// �ړ����u
	local id_kui		 = ReadGimmick_("o_V00_04");		// �傫�ȍY
	local id_door		 = ReadGimmick_("o_V00_05");		// ���ˑ�̔�
	local id_lift		 = ReadGimmick_("o_V00_06");		// ���ˑ�̃��t�g
	local id_opendevice	 = ReadGimmick_("o_V00_11");		// �F�ؑ��u

	// �����m���X
	g_gim_monolith = ArrangePointGimmick_("o_com_02", id_monojith, "g_monolith");

	// ���嗤�ړ����u(���S�̊č����s)
	g_gim_transfer_device = ArrangePointGimmick_("o_com_01", id_transfer, "g_transfer01");

	// �����[���|�C���g(�R��)
	g_gim_rulerpoint01 = ArrangePointGimmick_("o_com_08", id_ruler, "g_ruler01");
	SetMotion_(g_gim_rulerpoint01, MOT_GIMMICK_0, BLEND_N);
	if(GetEventFlg_("BFG_RULER_ADD_021") == true){
		SetMotion_(g_gim_rulerpoint01, MOT_GIMMICK_2, BLEND_N);
	}

	// �����[���|�C���g(�閧��n����)
	g_gim_rulerpoint02 = ArrangePointGimmick_("o_com_08", id_ruler, "g_ruler02");
	SetMotion_(g_gim_rulerpoint02, MOT_GIMMICK_0, BLEND_N);
	if(GetEventFlg_("BFG_RULER_ADD_022") == true){
		SetMotion_(g_gim_rulerpoint02, MOT_GIMMICK_2, BLEND_N);
	}

	// �����[���|�C���g(����)
	g_gim_rulerpoint03 = ArrangePointGimmick_("o_com_08", id_ruler, "g_ruler03");
	SetMotion_(g_gim_rulerpoint03, MOT_GIMMICK_0, BLEND_N);
	if(GetEventFlg_("BFG_RULER_ADD_032") == true){
		SetMotion_(g_gim_rulerpoint03, MOT_GIMMICK_2, BLEND_N);
	}

	// �����
	if (main_num == GetFlagID_("CONST_SM_VOLCANO")) {								// Num0 = 6
		if (volcano_num <= GetFlagID_("CONST_SS_HV_JDG_REMATCH_DEATHBURN")) {		// Num7 < 25
			local id_rockdoor = ReadGimmick_("o_V00_03");
			g_gim_rockdoor = ArrangePointGimmick_("o_V00_03", id_rockdoor, "g_rockdoor");
		}
	}

	// ���傫�ȍY
	//g_gim_kui01 = ArrangePointGimmick_("o_V00_04", id_kui, "gmk_kui01");
	//g_gim_kui02 = ArrangePointGimmick_("o_V00_04", id_kui, "gmk_kui02");

	// �����ˑ�̔�
	g_gim_door01 = ArrangePointGimmick_("o_V00_05", id_door, "gmk_door01");
	g_gim_door02 = ArrangePointGimmick_("o_V00_05", id_door, "gmk_door02");

	// �����ˑ�̃��t�g
	g_gim_lift = ArrangePointGimmick_("o_V00_06", id_lift, "gmk_lift");
	SetMotion_(g_gim_lift, MOT_GIMMICK_2, BLEND_N);
	if(main_num == GetFlagID_("CONST_SM_VOLCANO")){
		if(volcano_num <= GetFlagID_("CONST_SS_HV_PRE_LAUNCH_PAD_DEMO_5")){// Num7 39�܂�
			SetMotion_(g_gim_lift, MOT_GIMMICK_0, BLEND_N);
		}
	}

	// ���F�ؑ��u
	g_gim_opendevice = ArrangePointGimmick_("o_V00_11", id_opendevice, "g_opendevice");
	SetMotion_(g_gim_opendevice, MOT_GIMMICK_3, BLEND_N);
	if(main_num == GetFlagID_("CONST_SM_VOLCANO")){
		if(volcano_num <= GetFlagID_("CONST_SS_HV_JDG_REMATCH_DEATHBURN")){// Num7 23�܂�
			SetMotion_(g_gim_opendevice, MOT_GIMMICK_0, BLEND_N);
		}
	}
	
	
	//----------
	// ��NPC�z�u
	//----------
	// ID������
	g_birdy     <- C_NONE_ID;
	g_deathburn <- C_NONE_ID;

	// ���o�[�f�B
	if (main_num == GetFlagID_("CONST_SM_VOLCANO")) {								// Num0 = 6
		if (volcano_num > GetFlagID_("CONST_SS_HV_CLIMBING_THE_VOLCANO")			// Num7 > 5
		&& volcano_num < GetFlagID_("CONST_SS_VC_PRE_HELP_GIRL_DEMO")) {			// Num7 < 16
			// ���\�[�X�ǂݍ��݂Ɣz�u
			local id_birdy ="n019";
			g_birdy = ReadAndArrangePointNpc(id_birdy, "birdy01");
			// NPC�̐ݒ�
			SetReactorMsg_(g_birdy, "VOLCANO_BIRDY_REC");				// ���A�N�^�[���b�Z�[�W
			SetScaleSilhouette(g_birdy, SCALE.N, SILHOUETTE_WIDTH.N);	// �T�C�Y�̐ݒ�
			if(volcano_num == GetFlagID_("CONST_SS_HV_BIRDY_NEAR_THE_MONOLITH")){ // Num7 = 6
				SetTalkEnable_(g_birdy, false); // ��b�ł��Ȃ�
			}
			else{
				SetTalkEnable_(g_birdy, true); // ��b�ł���
				SetTalkCameraType_(g_birdy, TALK_CAMERA_UP); // �J�����̐ݒ�
			}
		}
		else if(volcano_num == GetFlagID_("CONST_SS_HV_GO_TO_THE_RED_WALL")			// Num7 = 18
			 || volcano_num == GetFlagID_("CONST_SS_HV_CONTACT_DEATHBURN")			// Num7 = 21
			 || volcano_num == GetFlagID_("CONST_SS_HV_FIND_OUT_AUTHEN_SYSTEM")		// Num7 = 24
			 || volcano_num == GetFlagID_("CONST_SS_HV_ENTER_THE_ALIAS_ROOM")) {	// Num7 = 25
			// ���\�[�X�ǂݍ��݂Ɣz�u
			local id_birdy ="n019";
			if(volcano_num == GetFlagID_("CONST_SS_HV_FIND_OUT_AUTHEN_SYSTEM")	// Num7 = 24
			|| volcano_num == GetFlagID_("CONST_SS_HV_ENTER_THE_ALIAS_ROOM")){	// Num7 = 25
				g_birdy = ReadAndArrangePointNpc(id_birdy, "birdy03");
			}
			else{
				g_birdy = ReadAndArrangePointNpc(id_birdy, "birdy02");
			}
			// NPC�̐ݒ�
			SetReactorMsg_(g_birdy, "VOLCANO_BIRDY_REC");				// ���A�N�^�[���b�Z�[�W
			SetTalkCameraType_(g_birdy, TALK_CAMERA_UP);				// �J�����̐ݒ�
			SetScaleSilhouette(g_birdy, SCALE.N, SILHOUETTE_WIDTH.N);	// �T�C�Y�̐ݒ�
			if(volcano_num == GetFlagID_("CONST_SS_HV_GO_TO_THE_RED_WALL")){
				SetDirToPlayer_(g_birdy);
			}
			else if(volcano_num == GetFlagID_("CONST_SS_HV_CONTACT_DEATHBURN")){
				SetTalkEnable_(g_birdy, false);
			}
		}
	}
	
	//-----------
	// ���n���z�u
	//-----------
	// ID������
	g_mine_transfer01	 <- C_NONE_ID;
	g_mine_monolith		 <- C_NONE_ID;
	g_mine_ruler_01		 <- C_NONE_ID;
	g_mine_ruler_02		 <- C_NONE_ID;
	g_mine_ruler_03		 <- C_NONE_ID;
	g_mine01_01			 <- C_NONE_ID;
	g_mine01_02			 <- C_NONE_ID;
	g_mine02_01			 <- C_NONE_ID;
	g_mine02_02			 <- C_NONE_ID;
	g_mine03			 <- C_NONE_ID;
	g_mine04			 <- C_NONE_ID;
	g_mine06			 <- C_NONE_ID;
	g_mine07			 <- C_NONE_ID;
	g_mine_lift			 <- C_NONE_ID;
	g_mine_keyhole		 <- C_NONE_ID;
	g_mine_keyhole_np 	 <- C_NONE_ID;
	
	// ���嗤�ړ����u(���S�̊č����s)
	g_mine_transfer01	 = SetPointCircleEventMine_("mine_transfer01", true);

	// �����m���X
	g_mine_monolith		 = SetPointCircleEventMine_("mine_monolith", true);

	// �����[���|�C���g(�R��)
	g_mine_ruler_01		 = SetPointCircleEventMine_("mine_ruler01", true);

	// �����[���|�C���g(�閧��n����)
	g_mine_ruler_02		 = SetPointCircleEventMine_("mine_ruler02", true);

	// �����[���|�C���g(����)
	g_mine_ruler_03		 = SetPointCircleEventMine_("mine_ruler03", true);

	if (main_num == GetFlagID_("CONST_SM_VOLCANO")) {								// Num0 = 6
		if (volcano_num == GetFlagID_("CONST_SS_HV_GO_TO_THE_VOLCANO")) {			// Num7 = 1
			// ���}�O�}�p�[�N������Ńf��501[�n���̃V�F���^�[�̒�]���Đ�����n��(��)
//			g_mine01 = SetPointCircleEventMine_("mine01", false);    // (��)
			g_mine01_01 = SetPointBoxEventMine_("mine01_01", false); // (�V)
			g_mine01_02 = SetPointBoxEventMine_("mine01_02", false); // (�V)
		}
		if (volcano_num == GetFlagID_("CONST_SS_HV_CLIMBING_THE_VOLCANO")) {		// Num7 = 5
			// ���R���t�߂Ńf��505[��ׂȂ��I]���Đ�����n��
			g_mine02_01 = SetPointBoxEventMine_("mine02_01", false);
			g_mine02_02 = SetPointBoxEventMine_("mine02_02", false);
		}
		if (volcano_num == GetFlagID_("CONST_SS_HV_BIRDY_NEAR_THE_MONOLITH")) {		// Num7 = 6
			// ���R���t�߂Ńf��506[�閧�̃��m���X]���Đ�����n��
			g_mine03 = SetPointCircleEventMine_("mine03", false);
		}
		if (volcano_num == GetFlagID_("CONST_SS_HV_GO_TO_THE_RED_WALL")) {			// Num7 = 18
			// ���Ԃ��Ǖt�߂Ńf��518[�Ό��E�f�X�o�[��]���Đ�����n��
			g_mine04 = SetPointCircleEventMine_("mine04", true);
		}
		if (volcano_num == GetFlagID_("CONST_SS_HV_CONTACT_DEATHBURN")) {			// Num7 = 21
			// ���o�[�f�B�t�߂Ńf��519[�f�X�o�[���Đ�]���Đ�����n��
			g_mine07 = SetPointCircleEventMine_("mine07", false);
		}
		if (volcano_num == GetFlagID_("CONST_SS_HV_GO_TO_THE_TOEWR")) {				// Num7 = 40
			// ���ړ����u�ɐG��f��533[�ΎR�̈ړ����u�g�p]���Đ�����n��
			g_mine06 = SetPointCircleEventMine_("mine06", false);
		}
	}
	// �����t�g�N���n��
	if (main_num >= GetFlagID_("CONST_SM_CORE")) {								// Num0 >= 7
		g_mine_lift = SetPointCircleEventMine_("mine_lift", true);
	}
	
	
	
	//--------------------
	//�����A�N�^�[�|�C���g
	//--------------------
	// ����ȋ@�B
	local reactorPoint01 = ArrangeMsgReactorPoint("reactorPoint07", GetFlagID_("BFG_REACTER_POINT_081")
		, SHORT_DIST, "REC_POINT_01_01", "REC_POINT_01_02");
	// ���m���X�Q�[�g
	local reactorPoint02 = ArrangeMsgReactorPoint("reactorPoint03", GetFlagID_("BFG_REACTER_POINT_013")
		, SHORT_DIST, "REC_POINT_02_01", "REC_POINT_02_02");
	// �閧��n
	local reactorPoint03 = ArrangeMsgReactorPoint("reactorPoint08", GetFlagID_("BFG_REACTER_POINT_082")
		, SHORT_DIST, "REC_POINT_03_01", "REC_POINT_03_02");
	// �}�O�}�p�[�N
	local reactorPoint04 = ArrangeMsgReactorPoint("reactorPoint05", GetFlagID_("BFG_REACTER_POINT_083")
		, SHORT_DIST, "REC_POINT_04_01", "REC_POINT_04_02");
	// �ړ����u(���S�̊č����s��)
	local reactorPoint01 = ArrangeMsgReactorPoint("reactorPoint01", GetFlagID_("BFG_REACTER_POINT_015")
		, SHORT_DIST, "REC_POINT_05_01", "REC_POINT_05_02");
	// �R�A
	local reactorPoint06 = ArrangeMsgReactorPoint("reactorPoint06", GetFlagID_("BFG_REACTER_POINT_001")
		, ENDLESS_DIST, "REC_POINT_06_01", "REC_POINT_06_02");
	// ���[���|�C���g(�R��)
	local reactorPoint07 = ArrangeMsgReactorPoint("reactorPoint02", GetFlagID_("BFG_REACTER_POINT_010")
		, SHORT_DIST, "REC_POINT_07_01", "REC_POINT_07_02");
	// ���[���|�C���g(�閧��n�O)
	local reactorPoint08 = ArrangeMsgReactorPoint("reactorPoint09", GetFlagID_("BFG_REACTER_POINT_010")
		, SHORT_DIST, "REC_POINT_07_01", "REC_POINT_07_02");
	// ���[���|�C���g(����)
	local reactorPoint09 = ArrangeMsgReactorPoint("reactorPoint10", GetFlagID_("BFG_REACTER_POINT_010")
		, SHORT_DIST, "REC_POINT_07_01", "REC_POINT_07_02");
	// �V���̒�
	local reactorPoint10 = ArrangeMsgReactorPoint("reactorPoint11", GetFlagID_("BFG_REACTER_POINT_176")
		, SHORT_DIST, "REC_POINT_08_01", "REC_POINT_08_02");
	
	//----------------------------
	//���}�b�v�i�r�A�C�R��(�I�Ȃ�)
	//----------------------------
	// ���ړI�n
	local mapNavi01 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.DESTINATION, "mapNavi01"); // �}�O�}�p�[�N
	SetNaviMapIconVisible_(mapNavi01, false);
	local mapNavi02 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.DESTINATION, "mapNavi02"); // �R��(���m���X)
	SetNaviMapIconVisible_(mapNavi02, false);
	local mapNavi03 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.DESTINATION, "mapNavi03"); // �閧��n����
	SetNaviMapIconVisible_(mapNavi03, false);
	local mapNavi04 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.DESTINATION, "mapNavi04"); // ����ȑ��u(�ړ����u)
	SetNaviMapIconVisible_(mapNavi04, false);
	if(main_num == GetFlagID_("CONST_SM_VOLCANO")){							// Num0 = 6
		// �ŔM�̉ΎR�����`�o�[�f�B�̉ƂŃo�[�f�B�Ƙb���܂�
		if(volcano_num <= GetFlagID_("CONST_SS_HV_GO_TO_THE_BIRDY_HOUSE")){
			SetNaviMapIconVisible_(mapNavi01, true);
		}
		// �o�[�f�B�̉ƂŃo�[�f�B�Ƙb���`��󃉃C�h����܂�
		else if(volcano_num >= GetFlagID_("CONST_SS_HV_CLIMBING_THE_VOLCANO")
		&& volcano_num <= GetFlagID_("CONST_SS_HV_GO_BACK_THE_VOLCANO")){
			SetNaviMapIconVisible_(mapNavi02, true);
		}
		// ��󃉃C�h����`�R�A�˓����������܂�
		else if(volcano_num >= GetFlagID_("CONST_SS_HV_GO_TO_THE_RED_WALL")
		&& volcano_num <= GetFlagID_("CONST_SS_HV_PRE_LAUNCH_PAD_DEMO_5")){
			SetNaviMapIconVisible_(mapNavi03, true);
		}
		// �R�A�˓����������`�R�A�ɍs���܂�
		else{
			SetNaviMapIconVisible_(mapNavi04, true);
		}
	}
	
	// ���u�I�v�A�C�R��
	if(main_num == GetFlagID_("CONST_SM_VOLCANO")){
		if(volcano_num == GetFlagID_("CONST_SS_HV_GO_TO_THE_RED_WALL")){ // Num7 = 18
			local exclamation01 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "g_opendevice"); // �F�ؑ��u
			SetNaviMapIconVisible_(exclamation01, true);
		}
	}
	
	// �����m���X(�}�b�v�`�F���W�A�C�R�����Ȃ��̂ŏ풓�\��)
	if(!(main_num == GetFlagID_("CONST_SM_VOLCANO") 
	&& volcano_num <= GetFlagID_("CONST_SS_HV_CLIMBING_THE_VOLCANO"))){
		local exclamation01 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "g_monolith");
		SetNaviMapIconVisible_(exclamation01, true);
	}
	
	// �����[���|�C���g(�R��)
	if(GetEventFlg_("BFG_RULER_ADD_021") == true){
		local icon_ruler_01 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.RULER_POINT , "g_ruler01");
		SetNaviMapIconVisible_(icon_ruler_01, true);
	}
	
	// �����[���|�C���g(�閧��n�O)
	if(GetEventFlg_("BFG_RULER_ADD_022") == true){
		local icon_ruler_02 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.RULER_POINT , "g_ruler02");
		SetNaviMapIconVisible_(icon_ruler_02, true);
	}
	
	// �����[���|�C���g(����)
	if(GetEventFlg_("BFG_RULER_ADD_032") == true){
		local icon_ruler_03 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.RULER_POINT , "g_ruler03");
		SetNaviMapIconVisible_(icon_ruler_03, true);
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
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");			// Num0
	volcano_num	 = GetNumFlg_("NUM_SCENARIO_SUB_VOLCANO");	// Num7

	//-----------------------
	// ���ړ����u���g�p������
	//-----------------------
	if(GetEventFlg_("BFG_RIDE_OFF_USED_TRANSFER") == true){
		UsingTransfer();
		
		// �͂��߂ďŔM�̉ΎR�ɗ����Ƃ�
		if(main_num == GetFlagID_("CONST_SM_VOLCANO")){
			if(volcano_num == 0){
				local shop_lv = 2;
				CommShopLevelChange(shop_lv);
				CommSavedAfterTransferDemo("BFG_SCENARIO_CLEAR_SAND");
			}
		}
		
		SetEventFlg_("BFG_RIDE_OFF_USED_TRANSFER", false);
	}

	//-----------------
	// ���A�j���[�V����
	//-----------------
	// ���m���X(�u�N���O�ҋ@�v�̃A�j����ݒ�)
	SetMotion_(g_gim_monolith, MOT_GIMMICK_0, 0);
	DebugPrint("���m���X�̃A�j����GIMMICK_0�ł�");
	if(GetEventFlg_("BFG_START_A_MONOLITH") == true){
		// ���m���X�̋N����ҋ@�A�j�����Đ�
		SetMotion_(g_gim_monolith, MOT_GIMMICK_2, BLEND_N);
		DebugPrint("���m���X�̃A�j����GIMMICK_2�ł�");
	}

	//-----------------
	// ���[���f���̍Đ�
	//-----------------
	// �[���f���Đ��t���O�̃`�F�b�N
	if(GetEventFlg_("BFG_PLAY_PSEUDO_DEMO_VOLCANO") == true){
		if(main_num == GetFlagID_("CONST_SM_VOLCANO")) {							// Num0 = 6
			if(volcano_num == GetFlagID_("CONST_SS_HV_BIRDY_NEAR_THE_MONOLITH")){	// Num7 = 6
				SetEventFlg_("BFG_PLAY_PSEUDO_DEMO_VOLCANO", false);
				// �[���f��[�閧�̃��m���X]�̍Đ�
				uMineDemo506();
			}
		}
	}

	//-------------
	// ���f���̍Đ�
	//-------------
	if (main_num == GetFlagID_("CONST_SM_VOLCANO")) {								// Num0 = 6
		//�͂��߂ďŔM�̉ΎR�ɓ��������̃f��
		if (volcano_num == 0) {
			SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_HV_GO_TO_THE_VOLCANO"));	// Num7 <- 1
			// �f���̕��A�ʒu���f���̊�����ɐݒ肵�܂�
			SetReturnDemoPosDir_(Vec3(1607.939, 158.280, 1395.642), -141);
			// Demo500[�ŔM�̉ΎR�E�S�i]�Đ�
			EventStartChangeDemo(500, FADE_COLOR_BLACK);
		}
		//A�����N���C�Z���X�l����A���m���X����߂������̃f��
		if (volcano_num == GetFlagID_("CONST_SS_HV_GO_BACK_THE_VOLCANO")) {			// Num7 = 17
			SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_HV_GO_TO_THE_RED_WALL"));	// Num7 <- 18
			// �R���t�߂̃����X�^�[�Ŕz�u�����ւ���t���O
			SetEventFlg_("BFG_LIMIT_ELPIS_SUMMIT", true);
			// Demo517[�o�[�f�B�̔���]�Đ���̕��A�ʒu
			SetReturnDemoPosDir_(Vec3(-1316.467, 1104.792, -842.097), -80);
			// Demo517[�o�[�f�B�̔���]�Đ�
			EventStartChangeDemo(517, FADE_COLOR_BLACK);
		}

		//-------------------------------------
		// �����C�h�t�B���^�����̃��b�Z�[�W��\��
		//-------------------------------------
		// Demo517[�o�[�f�B�̔���]�Đ���ɕ\��
		if (volcano_num == GetFlagID_("CONST_SS_HV_GO_TO_THE_RED_WALL")) {		// Num7 = 17
			if(GetEventFlg_("BFG_RIDE_LICENSE_MULTIJUMP") == true){
				if(!IsOpenNaviMapRideFilter_(RIDE_FILTER.MULTIJUMP)){
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
					OpenNaviMapRideFilter_(RIDE_FILTER.MULTIJUMP);
					// �v���C���[�̃��[�V������ҋ@��Ԃɖ߂�
					CommResetPlayerMotion();
				}
			}
		}
	}
	//-------------
	// ���퓬�J�n
	//-------------
	// �C�x���g��[�f�X�o�[����]
	if (main_num == GetFlagID_("CONST_SM_VOLCANO")) {										// Num0 = 6
		if (volcano_num == GetFlagID_("CONST_SS_HV_PRE_BATTLE_DEATHBURN")) {				// Num7 = 19
			SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_HV_JDG_BATTLE_DEATHBURN"));		// Num7 <- 20
			// �f�X�o�[����
			ChangeBattleParty_(18);
		}
	}
	// �C�x���g��[�f�X�o�[���Đ�]
	if (main_num == GetFlagID_("CONST_SM_VOLCANO")) {										// Num0 = 6
		if (volcano_num == GetFlagID_("CONST_SS_HV_PRE_REMATCH_DEATHBURN")) {				// Num7 = 22
			SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_HV_JDG_REMATCH_DEATHBURN"));		// Num7 <- 23
			// �f�X�o�[����
			ChangeBattleParty_(18);
		}
	}
	//-------------
	// ���퓬����
	//-------------
	if (main_num == GetFlagID_("CONST_SM_VOLCANO")) {										// Num0 = 6
		if (volcano_num == GetFlagID_("CONST_SS_HV_JDG_BATTLE_DEATHBURN")) {				// Num7 = 20
			if (GetBattleEndType_() == BATTLE_END_TYPE_WIN){
				uWinDeathBurn();
			}else{
				// �f�X�o�[���ɔs�k
				// �����ł̓f�X�o�[����̔s�k���肪�ł��Ȃ��̂�
				// �C�x���g�u���b�N��AfterBattle()�Ŕs�k�̔���ƃt���O�ύX���s���B
			}
		}
		//�Đ펞
		if (volcano_num == GetFlagID_("CONST_SS_HV_JDG_REMATCH_DEATHBURN")) {				// Num7 = 23
			if (GetBattleEndType_() == BATTLE_END_TYPE_WIN){
				uWinDeathBurn();
			}else{
				// �f�X�o�[���ɔs�k
				// �����ł̓f�X�o�[����̔s�k���肪�ł��Ȃ��̂�
				// �C�x���g�u���b�N��AfterBattle()�Ŕs�k�̔���ƃt���O�ύX���s���B
			}
		}
	}
	
	
	//-------------------------------------------
	// ����Ԃ̗V�уC�x���g�p�̃J�E���g�_�E���\��
	//-------------------------------------------
	local info = {
		GIMMICK_FLG			 = GIMMICK_FLG,
	};
	
	MastersLoad_CountDown(info);
	
	//---------------------------------
	// ����Ԃ̗V�уC�x���g�p�̐퓬����
	//---------------------------------
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
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");			// Num0
	volcano_num	 = GetNumFlg_("NUM_SCENARIO_SUB_VOLCANO");	// Num7
	
	local target = GetTargetId_();
	
	DebugPrint(" ");
	DebugPrint("ID: " + target + " �ɐڐG [TouchNpc]");
	
	switch (target) {
	case g_birdy :
		uTalkbirdy();
		break;
	default :
		DebugPrint("WARNING : NPC_ID���s���ł� [TouchNpc]");
		break;
	}
	
	EventEnd_();
}
//------------------------------------------------
//		�C�x���g�n���ڐG��
//------------------------------------------------
function TouchEventMine()
{
	local target = GetTouchEventMineId_();
	local player = GetPlayerId_();

	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");			// Num0
	volcano_num	 = GetNumFlg_("NUM_SCENARIO_SUB_VOLCANO");	// Num7

	DebugPrint(" ");
	DebugPrint("ID: " + target + " �ɐڐG [TouchNpc]");
	
	switch (target) {
	case g_mine_transfer01:
		uMineTransfer01();
		break;
	case g_mine_ruler_01:
		CommPlayerTurnAroundObj(g_gim_rulerpoint01);
		uMineRuler01();
		break;
	case g_mine_ruler_02:
		CommPlayerTurnAroundObj(g_gim_rulerpoint02);
		uMineRuler02();
		break;
	case g_mine_ruler_03:
		CommPlayerTurnAroundObj(g_gim_rulerpoint03);
		uMineRuler03();
		break;
	case g_mine_monolith:
		uMineMonolith();
		break;
// (��)
//	case g_mine01:
//		uMineDemo501();
//		break;
// (�V)
	case g_mine01_01:
	case g_mine01_02:
		uMineDemo501();
		break;
	case g_mine02_01:
	case g_mine02_02:
		uMineDemo505();
		break;
	case g_mine03:
		// �[���f���̓��C�h�����������ł��Ȃ��̂ň�U�}�b�v�`�F���W���ă��C�h����������EventStartOperate���ŋ[���f�����Đ�����
		SetEventFlg_("BFG_PLAY_PSEUDO_DEMO_VOLCANO", true);
		ChangeMap_("V00_00");
		break;
	case g_mine04:
		CommPlayerTurnAroundObj(g_gim_opendevice);
		uMineDemo518();
		break;
	case g_mine06:
		uMineDemo533();
		break;
	case g_mine07:
		CommPlayerTurnAroundObj(g_birdy);
		uMineDemo519();
		break;
	case g_mine_lift:
		uMineLift();
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
	default :
		DebugPrint("WARNING : NPC_ID���s���ł� [TouchNpc]");
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
//		�o�[�f�B ��b����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkbirdy()
{
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");			// Num0
	volcano_num	 = GetNumFlg_("NUM_SCENARIO_SUB_VOLCANO");	// Num7

	if (main_num == GetFlagID_("CONST_SM_VOLCANO")) {						// Num0 = 6
		if(volcano_num <= GetFlagID_("CONST_SS_VC_PRE_SECRET_BASE_DEMO")) { // Num7 15�܂�
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_BIRDY");
			ShowMsg_("DEMO_506_AFT_BIRDY"); //�u�A���Z�X�I ���m���X�� �S�[�I������l�[�I
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if(volcano_num == GetFlagID_("CONST_SS_HV_GO_TO_THE_RED_WALL")) { // Num7 = 18
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_BIRDY");
			ShowMsg_("DEMO_517_AFT_BIRDY"); //�u������ۂ������� ������Ȃ��f�[�X�B
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if(volcano_num == GetFlagID_("CONST_SS_HV_FIND_OUT_AUTHEN_SYSTEM") // Num7 = 24
			 || volcano_num == GetFlagID_("CONST_SS_HV_ENTER_THE_ALIAS_ROOM")){ // Num7 = 25
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_BIRDY");
			ShowMsg_("DEMO_520_AFT_BIRDY"); //�u��ԏ��� �A���Z�X�ɏ���f�[�X�B
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		�嗤�ړ����u(���S�̊č����s)�𒲂ׂ���
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineTransfer01()
{
	local dont_use_transfer = GetEventFlg_("BFG_DONT_TRANSFER_SAND_TO_VOLCANO");// ����-�ΎR�Ԃ̑嗤�ړ����u�̎g�p���֎~����t���O
	
	if(dont_use_transfer == false){
		OpenMsgWnd_();
		ShowMsg_("TRANSFER_01_MSG");
		KeyInputWait_();
		//�͂�
		if(GetQueryResult_() == QUERY_YES){
			CloseMsgWnd_();
			// ���C�h��Ԃő嗤�ړ������ꍇ�A���C�h����������t���O
			SetEventFlg_("BFG_RIDE_OFF_USED_TRANSFER", true);
			// ���S�̊č�����
			ChangeMapPosDir_("S00_00", Vec3(180.000, 1378.8,-700.000), -1);
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
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		���ˑ�̃��t�g�̒n���𒲂ׂ���
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineLift()
{
	local dont_use_transfer = GetEventFlg_("BFG_DONT_TRANSFER_VOLCANO_TO_CORE");// �ΎR-�R�A�Ԃ̑嗤�ړ����u�̎g�p���֎~����t���O
	
	if(dont_use_transfer == false){
		// �I�������b�Z�[�W
		OpenMsgWnd_();
		ShowMsg_("SYSTEM_MSG_000");
		KeyInputWait_();
		if(GetQueryResult_() == QUERY_YES){
			CloseMsgWnd_();
			DeleteEventMine_(g_mine_lift);
			
			// �嗤�ړ����u���g���đ嗤�ړ������ꍇ�A���C�h���������邽�߂Ɏg�p����t���O
			SetEventFlg_("BFG_RIDE_OFF_USED_TRANSFER", true);
			// ��l���Ƀe���|�[�g�G�t�F�N�g������
			//ID�̎擾
			local player = GetPlayerId_();
			// ���l�̐ݒ�
			local alpha_def = 1.0;
			// ���l��ύX����O�͕K�����̖��߂��L��
			SetManualCalcAlpha_(player, true);
			// �G�t�F�N�g�̓ǂݍ���
			LoadEffect_("ef732_07_teleport_monolith");	//���m���X�]���G�t�F�N�g
			PlaySE_("SE_DEM_017");						// �r�d�Đ�
			local effectId = SetSelectBoneEffect_("ef732_07_teleport_monolith", player, ATTACH_GLOBAL);
			Wait_(1);
			// ��l���̎p��i�X�Ə����Ă���
			for(alpha_def = 1.0; alpha_def >= 0.0; alpha_def = alpha_def - 0.1){
				SetAlpha_(player, alpha_def);
				Wait_(1);
			}
			SetAlpha_(player, 0.0);
			// �Ԃ���������
			Wait_(30);
			// �Ó]������(��l�����������܂܂ɂȂ�Ȃ��悤�ɂ����ňÓ]�����ă��l�����ɖ߂�)
			SetFade_(FADE_OUT, FADE_COLOR_BLACK, 15);
			SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, 15);
			WaitFade_();
			// ��l���̃��l�����ɖ߂�
			SetAlpha_(player, 1.0);
			
			// �R�A�̕��A�ʒu
			ChangeMapPosDir_("C00_00", Vec3(-148.641, 0.000, -44.546), 68);
/*
			// ���ˑ�̔����J����
			SetMotion_(g_gim_door01, MOT_GIMMICK_1, BLEND_N);
			SetMotion_(g_gim_door02, MOT_GIMMICK_1, BLEND_N);
			Wait_(30);
			SetMotion_(g_gim_door01, MOT_GIMMICK_2, BLEND_N);
			SetMotion_(g_gim_door02, MOT_GIMMICK_2, BLEND_N);
			// ���ˑ�̃��t�g���オ��
*/
		}
		else{
			CloseMsgWnd_();
		}
	}
	// �]�����u�̎g�p�֎~���������ꍇ
	else{
		// �V�X�e�����b�Z�[�W
		OpenMsgWnd_();
		ShowMsg_("DONT_USE_TELEPORTER_010");		// �]�����u�́@�����Ă��Ȃ��B
		KeyInputWait_();
		CloseMsgWnd_();
	}
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		���[���|�C���g(�R��)�𒲂ׂ���
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineRuler01()
{
	CommRulerPointEvent(g_gim_rulerpoint01, "BFG_RULER_ADD_021", "g_ruler01"); 
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		���[���|�C���g(�閧��n����)�𒲂ׂ���
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineRuler02()
{
	CommRulerPointEvent(g_gim_rulerpoint02, "BFG_RULER_ADD_022", "g_ruler02"); 
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		���[���|�C���g(����)�𒲂ׂ���
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineRuler03()
{
	CommRulerPointEvent(g_gim_rulerpoint03, "BFG_RULER_ADD_032", "g_ruler03"); 
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		���m���X�𒲂ׂ���
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineMonolith()
{
	local player = GetPlayerId_();

	CommPlayerTurnAroundObj(g_gim_monolith);
	MonolithAnime(g_gim_monolith, "BFG_START_A_MONOLITH", "g_monolith");
	ChangeMapPosDir_("O01_00", Vec3(-1260.0, 10.0, 0.0), 90);
}

//++++++++++++++++++++++++++++++++++++++++++++++++
// �f��501[�n���̃V�F���^�[�̒�]���Đ�����n���𒲂ׂ���
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineDemo501()
{
	// �n���̍폜
//	DeleteEventMine_(g_mine01); // (��)
	DeleteEventMine_(g_mine01_01); // (�V)
	DeleteEventMine_(g_mine01_02); // (�V)
	// �V�i���I�̃t���O��i�߂�
	SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_HV_PRE_MAGMA_PARK_DEMO"));	// Num7 <- 2
	// �}�O�}�p�[�N�t�߂̃����X�^�[�Ŕz�u�����ւ���t���O
	SetEventFlg_("BFG_LIMIT_MAGMA_PARK", true);
	// �f���̕��A�ʒu���f���̊�����ɐݒ肵�܂�
	SetReturnDemoMap_("V01_00"); 
	SetReturnDemoPosDir_(Vec3(47.092, 0.000, -300.000), 0); // Demo502[]�Đ���̕��A���W
	// Demo501[�n���̃V�F���^�[�̒�(�ΎR�t�B�[���h)]
	ChangeDemo_(501);
}

//++++++++++++++++++++++++++++++++++++++++++++++++
// �f��505[��ׂȂ��I]���Đ�����n���𒲂ׂ���
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineDemo505()
{
	SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_HV_BIRDY_NEAR_THE_MONOLITH"));	// Num7 <- 6
	DeleteEventMine_(g_mine02_01);
	DeleteEventMine_(g_mine02_02);
	// �f����̕��A�ʒu�ƌ����̐ݒ�
	local player_pos = Vec3(-757.361, 1052.426, -1434.833);
	local player_dir = -42;
	SetReturnDemoPosDir_(player_pos, player_dir);
	// Demo505[��ׂȂ��I]
	ChangeDemo_(505);
}

//++++++++++++++++++++++++++++++++++++++++++++++++
// �[���f��[�閧�̃��m���X]���Đ�����n���𒲂ׂ���
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineDemo506()
{
	SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_HV_GO_TO_THE_COLOSSEUM"));		// Num7 <- 7
	DeleteEventMine_(g_mine03);

	// �v���C���[ID
	local player = GetPlayerId_();
	// �f�����̃v���C���[�̈ʒu
	local player_pos = Vec3(-293.593, 1290.653, -763.338);
	local player_dir = 130;
	// �f����̎�l���̈ʒu
	local rtn_pos = Vec3(-293.593, 1290.653, -763.338); // ���Y�^)�����W �� -286.014, 1291.893, -776.528
	local rtn_dir = 168;
	// �J�����̊p�x
	local cam_dir = -190;
	// �E�F�C�g�t���[��
	local wait_frm = 10;
	// �t�F�[�h�X�s�[�h
	local fade_spd = 15;
	// ��풓���[�V�����Ǎ�(��l�����Ȃ���)
	local nod = ReadMotion_(player, "Player_nod");

	// �u�ԈÓ]
	CommChangeMomentFadeOut(FADE_COLOR_BLACK);
	// ����
	Wait_(wait_frm);
	SetPos_(player, player_pos);
	SetDir_(player, player_dir);
	SetCameraDir_(cam_dir);
	SetDirToPlayer_(g_birdy);
	// �Ó]����(���ʂ̂�)
	SetFade_(FADE_IN, FADE_COLOR_BLACK, fade_spd);
	WaitFade_();
	// �[���f���̏���
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_BIRDY");
	ShowMsg_("PSEUDO_DEMO_BIRDY");		//�u�O�݂����Ɂ@�o�[�`�����R���V�A����
	KeyInputWait_();
	CloseMsgWnd_();
	Wait_(wait_frm);
	SetMotion_(player, nod, BLEND_M); // ��l�������Ȃ���
	Wait_(fade_spd);
	// �Ó]
	uWaitPseudoDemoFade(fade_spd);
	// ����
	SetCameraDir_(175); // ��l���̐^���t��
	// �o�[�f�B
	SetDir_(g_birdy, -50);
	SetTalkEnable_(g_birdy, true); // ��b�ł���
	SetTalkCameraType_(g_birdy, TALK_CAMERA_UP); // �J�����̐ݒ�
	// ��l��
	SetPos_(player, rtn_pos);
	SetDir_(player, rtn_dir);
	Wait_(FADE_DEF);
	// �Ó]����
	SetFade_(FADE_IN, FADE_COLOR_BLACK, fade_spd);
	SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, fade_spd);
	WaitFade_();
	Wait_(wait_frm);
/*
	// �f����̕��A�ʒu�ƌ����̐ݒ�
	local player_pos = Vec3(-281.711, 1292.686, -838.463);
	local player_dir = -166;
	SetReturnDemoPosDir_(player_pos, player_dir);
	// Demo506[�閧�̃��m���X]
	ChangeDemo_(506);
*/
}

//++++++++++++++++++++++++++++++++++++++++++++++++
// �f��518[�Ό��E�f�X�o�[��]���Đ�����n���𒲂ׂ���
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineDemo518()
{
	if (main_num == GetFlagID_("CONST_SM_VOLCANO")) {									// Num0 = 6
		if (volcano_num == GetFlagID_("CONST_SS_HV_GO_TO_THE_RED_WALL")) {				// Num7 = 18
			SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_HV_PRE_BATTLE_DEATHBURN"));	// Num7 <- 19
			DeleteEventMine_(g_mine04);
			// Demo518[�Ό��E�f�X�o�[��]
			ChangeDemo_(518);
		}
	}
}

//++++++++++++++++++++++++++++++++++++++++++++++++
// �f��519[�f�X�o�[���Đ�]���Đ�����n���ɐG�ꂽ��
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineDemo519()
{
	if (main_num == GetFlagID_("CONST_SM_VOLCANO")) {									// Num0 = 6
		if (volcano_num == GetFlagID_("CONST_SS_HV_CONTACT_DEATHBURN")) {				// Num7 = 21
			SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_HV_PRE_REMATCH_DEATHBURN"));	// Num7 <- 22
			DeleteEventMine_(g_mine07);
			// Demo519[�f�X�o�[���Đ�]
			ChangeDemo_(519);
		}
	}
}

//++++++++++++++++++++++++++++++++++++++++++++++++
// �f��533[�ΎR�̈ړ����u�g�p]���Đ�����n���𒲂ׂ���
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineDemo533()
{
	SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_HV_CLEAR_HEAT_VOLCANO"));	// Num7 <- 41
	DeleteEventMine_(g_mine06);
	// �C�x���g�t���O��i�߂�
	SetNumFlg_("NUM_SCENARIO_MAIN", GetFlagID_("CONST_SM_CORE"));	// ���C���t���O NUM000 = 7
	SetNumFlg_("NUM_SCENARIO_SUB_VOLCANO", 0);	// �ΎR�t���O(NUM007 �� 41 �� 0�ɖ߂�)

	// �嗤�ړ��̃f�����ɃZ�[�u�|�C���g�����ލۂɎg�p����t���O
	SetEventFlg_("BFG_SAVE_POINT_FLAG", true);

	// ���C�h��Ԃő嗤�ړ������ꍇ�A���C�h����������t���O
	SetEventFlg_("BFG_RIDE_OFF_USED_TRANSFER", true);

	// �R�A��
	SetReturnDemoMap_("C00_00"); 
	SetReturnDemoPosDir_(Vec3(-87.559, 0.000, -43.226), 83);

	// �嗤�Ԉړ���demo533[�R�A�N��]���Đ����鏈��
	ChangeDemo_(533);
}

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// �[���f���Ȃǂ̈Ó]�����֐�
//----------------------------------------------------------------
// ����    �F�Ȃ�
// �߂�l  �F�Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function uWaitPseudoDemoFade(fade_spd)
{
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, fade_spd);
	SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, fade_spd);
	WaitFade_();
}

//+++++++++++++++++++++++++++++++++
// �f�X�o�[���ɏ�����̋��ʏ����֐�
//---------------------------------
// ����    �F�Ȃ�
// �߂�l  �F�Ȃ�
//+++++++++++++++++++++++++++++++++
function uWinDeathBurn()
{
	// �f�X�o�[���ɏ���
	SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_HV_FIND_OUT_AUTHEN_SYSTEM"));	// Num7 <- 24
	// ���A�C�R��(�D�F��)�ƃ}�b�v�`�F���W�A�C�R��(�Ԑ�)��؂�ւ���
	SetEventFlg_("BFG_MAP_CHANGE_ICON_V00_00", true);
	// �f����ɐݒ肳����l���̈ʒu�ƌ���
	SetReturnDemoPosDir_(Vec3(-1355.154, 1105.822, -892.930), -90);
	// Demo520[�f�X�o�[���폟��]�̍Đ�<EventStartOperate()�̃C�x���g���b�N���Ȃ̂�EventStartChangeDemo()>
	EventStartChangeDemo(520, FADE_COLOR_BLACK);
}

