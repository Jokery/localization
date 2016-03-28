//===================== A00_00�����s�s ====================
//---------------------------------
// ����Ԃ̗V�тŎg�p����萔
//---------------------------------
// �M�~�b�N�̋N���ƃN���A�t���O
const GIMMICK_FLG			 = "BFG_SPACE_GIMMICK_CITY";
const GIMMICK_CLEAR_FLG		 = "BFG_SPACE_GIMMICK_CITY_1ST_CLEAR";

// ��l���̕��A�ʒu�ƌ���
const XPOS_1				 = 1834.650;	// ��ՃX�C�b�`�t��
const YPOS_1				 = -58.867;
const ZPOS_1				 = 25.251;
const DIR_1					 = -53;

const XPOS_2				 = 472.0;		// �S�[���{�X�̎�O
const YPOS_2				 = 213.0;
const ZPOS_2				 = 1038.0;
const DIR_2					 = -60;

// �[���f���Ŏg�p����J�����̃m�[�h��
const CAMERA_EYE			 = "cameye_001";
const CAMERA_TGT			 = "camtgt_001";

// ��ՃX�C�b�`���N��������ׂ̌�ID
const GIMMICK_KEY_ID		 = 902;

// ��ՃX�C�b�`���N�����������̃��b�Z�[�WID
const GIMMICK_MSG_ID		 = "MASTERS_LOAD_REACTOR_MSG_011";

// ��ՃX�C�b�`�N����̍Đ��f���i���o�[
const DEMO_NUM				 = 134;

// �{�X�����X�^�[��ID (1=����, 2=2��ڈȍ~)
const BOSS_ID_1				 = "m110_01";	// �S�[���h�}��
const BOSS_ID_2				 = "m110_01";	// �S�[���h�}��

// �{�X�����X�^�[��Exchange�pID
const BOSS_EXCHANGE_ID		 = 338;			// �S�[���h�}��

// �{�X�����X�^�[�̃X�P�[���Ɨ֊s���̐ݒ� (1=����, 2=2��ڈȍ~)
//�yN�T�C�Y�z�X�P�[��=0.6, �V���G�b�g��=0.8
//�yM�T�C�Y�z�X�P�[��=1.0, �V���G�b�g��=1.0
//�yG�T�C�Y�z�X�P�[��=2.5, �V���G�b�g��=1.0
//�yT�T�C�Y�z�X�P�[��=6.0, �V���G�b�g��=1.0
const BOSS_SCALE_1			 = 0.6;
const BOSS_SILHOUETTE_1		 = 0.8;
const BOSS_SCALE_2			 = 0.6;
const BOSS_SILHOUETTE_2		 = 0.8;

// �{�X��̓G�p�[�e�B�e�[�u�� (1=����, 2=2��ڈȍ~)
const BOSS_PARTY_TABLE_1	 = 155;
const BOSS_PARTY_TABLE_2	 = 155;

// �{�X�𒇊Ԃɂ���ۂ̃����X�^�[�p�����[�^ (1=����, 2=2��ڈȍ~)
const BOSS_PARAMETER_1		 = 1803;
const BOSS_PARAMETER_2		 = 1803;

// �{�X���Ԍ�̃}�b�v�`�F���WID
const MAP_ID				 = "A00_00";


//-------------------- ������ --------------------
// �N�������F�o�g���I����ɌĂ΂�܂�
// (�o�g���̏��s�����C�x���g�t���O�̐ݒ�̓R�R)
//-------------------- ������ --------------------
function AfterBattle()
{
//------------------------------------------------------------------
// �t���O�̏�Ԃ��擾
	local main_num   = GetNumFlg_("NUM_SCENARIO_MAIN");
	local green_num  = GetNumFlg_("NUM_SCENARIO_SUB_GREEN");
	local city_num   = GetNumFlg_("NUM_SCENARIO_SUB_CITY");

	//---------------------------------
	// ����Ԃ̗V�уC�x���g�p�̃t���O
	//---------------------------------
	local info = {
		GIMMICK_FLG			 = GIMMICK_FLG,
	};
	
	MastersLoad_AfterBattle(info);

	EventEnd_();
}

//-------------------- ������ --------------------
// �N�������FFadeIn���O�ɌĂ΂��
// (��O�I�ȃC�x���g�t���O�̐ݒ�̓R�R)
//-------------------- ������ --------------------
function BeforeInitMap()
{
	// �t���O�̏�Ԃ��擾
	local main_num   = GetNumFlg_("NUM_SCENARIO_MAIN");							// Num0
	local sky_num	 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");						// Num9
	
	// ���Z�Δ�̋[���f���Đ��O�Ƀ��C�h����������
	if(GetEventFlg_("BFG_RIDE_OFF_FLAG_BEFORE_STELE") == true){
		//���C�h��������
		SetRideOffStart_();
	}
	
	// �ړ����u���g�p�����ꍇ
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

//-------------------- ������ --------------------
// �N�������F��ʐ؂�ւ��̃t�F�[�h�C����
// (NPC�ƒn���̐ݒu/�}�b�v���B�t���O�̓R�R)
//-------------------- ������ --------------------
function FadeIn()
{
	// �}�b�v���B�t���O
	SetEventFlg_("BFG_ARRIVE_AT_A00", true);
	// �Z�[�u�֎~������(�Z�[�u�֎~�}�b�v����A���Ă������p)
	SetEventFlg_("BFG_SAVE_PROHIBIT", false);		// �Z�[�u�֎~(Bit451)

	// �t���O�̏�Ԃ��擾
	local main_num   = GetNumFlg_("NUM_SCENARIO_MAIN");
	local green_num  = GetNumFlg_("NUM_SCENARIO_SUB_GREEN");
	local city_num   = GetNumFlg_("NUM_SCENARIO_SUB_CITY");
	local sub_num    = GetNumFlg_("NUM_FLG_GO_POWER_PLANT_STATE");
	local inside_num = GetNumFlg_("NUM_SCENARIO_SUB_INSIDE_CLEAR");
	// ���d�{�݂œd�͂̕������s��ꂽ�����`�F�b�N(��ɃM�~�b�N�p)
	local check_restoration = GetEventFlg_("BFG_RESTORATION_POWER_PLANT");

	DebugPrint(" ");
	DebugPrint("NUM_SCENARIO_MAIN �̒l�� " + main_num + " �ɂȂ�܂����B");
	DebugPrint("NUM_SCENARIO_SUB_GREEN �̒l�� " + green_num + " �ɂȂ�܂����B");
	DebugPrint("NUM_SCENARIO_SUB_CITY �̒l�� " + city_num + " �ɂȂ�܂����B");

//--------------------------------------------------------------------------------
// BGM�̕ύX[ �uBG_AMBI_008�v���uBGM_005�v(�����s�s�̒ʏ�BGM)�ɕύX ]
	SetEventFlg_("BFG_A00_00_ENVIRONMENT_BGM_PLAY", false);
	// Demo101[�ړI�n�̓o�g���f�o�{���r��]�Đ���̃^�C�~���O
	if(main_num == GetFlagID_("CONST_SM_CITY")){
		if(city_num == GetFlagID_("CONST_SS_CI_NOT_ENTER_THE_BUILDING")){
			SetEventFlg_("BFG_A00_00_ENVIRONMENT_BGM_PLAY", false);
		}
	}

//--------------------------------------------------------------------------------
// �}�b�v�`�F���Wnull��L���ɂ��邩�ǂ����ݒ肷�閽��(FadeIn()�Őݒ肵�A���̃C�x���g�u���b�N��ON/OFF�ł���)

	// ���d�{�݂̓d�͕����O
	if(check_restoration == false){
		// �}�b�v�`�F���W���Ȃ�
		SetHitEnableMapChangeNull_("w_A01_00ALdr_006", false);
	}
	else{
		// �}�b�v�`�F���W����
		SetHitEnableMapChangeNull_("w_A01_00ALdr_006", true);
	}
//--------------------------------------------------------------------------------
// ���Ԃ̐ݒ�
	if(main_num == 2){
		if(city_num == GetFlagID_("CONST_SS_CI_EVENING_CITY")){
			// �܂񂽂�̐Δ�擾��
			if(GetEventFlg_("BFG_EXAMINE_FULLTANK_STELE") == true){
				// �[���ɐݒ�
				SetTime_(START_TIME_ZONE_EVENING);
				ChangeColorTone_(0.0, 0.0, 0.0, 0);
			}
			// �܂񂽂�̐Δ�擾�O
			else{
				// ���̂܂�
				SetTime_(0);
				ChangeColorTone_(0.0, 0.0, 0.0, 0);
			}
		}
		// demo124[����[��]�Đ���
		if(city_num >= GetFlagID_("CONST_SS_CI_GO_POWER_PLANT")
		&& city_num <= GetFlagID_("CONST_SS_CI_RESTORATION_POWER_PLANT")){
			// ��ɐݒ�
			SetTime_(START_TIME_ZONE_NIGHT);
			// �����O�̈Â����
			ChangeColorTone_(CITY_COLOR_TONE_DARK_R, CITY_COLOR_TONE_DARK_G, CITY_COLOR_TONE_DARK_B, 0);
		}
		// ���d�{�݃N���A��
		if(city_num  > GetFlagID_("CONST_SS_CI_RESTORATION_POWER_PLANT")){
			// ��ɐݒ�
			SetTime_(START_TIME_ZONE_NIGHT);
			// ������̖��邢���
			ChangeColorTone_(CITY_COLOR_TONE_BRIGHT_R, CITY_COLOR_TONE_BRIGHT_G, CITY_COLOR_TONE_BRIGHT_B, 0);
		}
	}

//-----------------------------------------------------------------
// NPC
	// NPC�̏�����
	g_king    <- C_NONE_ID;	// �L���O
	g_jack    <- C_NONE_ID;	// �W���b�N
	g_queen   <- C_NONE_ID;	// �N�C�[��
	g_ace     <- C_NONE_ID;	// �G�[�X
	g_npc1    <- C_NONE_ID;	// NPC_A
	g_npc1_2  <- C_NONE_ID;	// �{��
	g_npc2    <- C_NONE_ID;	// NPC_B
	g_npc2_2  <- C_NONE_ID;	// NPC_B ���
	g_npc4    <- C_NONE_ID;	// ����
	g_npc5    <- C_NONE_ID;	// ��s
	g_npc6    <- C_NONE_ID;	// �{��
	g_npc7    <- C_NONE_ID;	// ����
	g_npc8    <- C_NONE_ID;	// ���A�N�^�[
	g_npc9    <- C_NONE_ID;	// �A�N�Z�T��
	g_inn     <- C_NONE_ID;	// �h��
	dead_npc  <- C_NONE_ID;	// �S�ŕ��A��

	if(main_num == 2){
		if(city_num == GetFlagID_("CONST_SS_CI_CLIMB_THE_LADDER")){
			// ���\�[�X�ǂݍ���
			local g_id_nochorin = ReadNpc_("n043");	// �m�`������
			local g_id_npc_000  = ReadNpc_("n000");	// �m�`���[���j
			// NPC�z�u
			g_npc1  = ArrangePointNpc_(g_id_nochorin, "NPC_37"); // NPC_A�i�m�`�������j
			g_npc5  = ArrangePointNpc_(g_id_npc_000 , "NPC_38"); // ��s
			// ���A�N�^�[���b�Z�[�W�̐ݒ�
			SetReactorMsg_(g_npc1, "NPC_NOCHORIN_REC");
			SetReactorMsg_(g_npc5, "NPC_NOCHO_MEN_REC");
			// ��b���J����(�S�ŕ��A���͉�b�������Ȃ�����)
			if(GetEventFlg_("BFG_DEAD_RETURN") == false){
				SetTalkCameraType_(g_npc1, TALK_CAMERA_UP);		// NPC_A(�m�`������)
			}
			else{
				SetTalkEnable_(g_npc1, false);
			}
		}
		// �Z���^�[�r�����Ƀm�`���[�����ړ�������őS�ŕ��A�����ꍇ(Redmine#2261)
		if(city_num == GetFlagID_("CONST_SS_CI_ESTABLISH_KINGDOM")){
			if(GetEventFlg_("BFG_DEAD_RETURN") == true){
				// ���̑O�Ńm�`��������ݒu
				dead_npc = ReadAndArrangePointNpc("n043", "NPC_39");
				SetTalkEnable_(dead_npc, false);
			}
		}
		// �����O
		if(city_num == GetFlagID_("CONST_SS_CI_GO_BACK_KING"))
		{
			// �ʍ�
			local g_throne_02 = ReadGimmick_("o_com_05");
			local throne_02 = ArrangePointGimmick_("o_com_05", g_throne_02, "g_throne_02");
			// ���\�[�X�ǂݍ���
			local g_id_npc_000  = ReadNpc_("n000");	// �m�`���[���j
			local g_id_npc_001  = ReadNpc_("n004");	// �m�`���[����
			local g_id_jack     = ReadNpc_("n001");	// �W���b�N
			local g_id_ace      = ReadNpc_("n002");	// �G�[�X
			local g_id_king     = ReadNpc_("n003");	// �L���O
			local g_id_queen    = ReadNpc_("n005");	// �N�C�[��
			local g_id_nochorin = ReadNpc_("n043");	// �m�`������
			// NPC�z�u
			g_king  = ArrangePointNpc_(g_id_king,  "NPC_22");
			SetTalkTurn_ (g_king, false);//�L���O�͐U������Ȃ��悤�ɂ���
			// NPC�̉�b�\�p�x��ݒ�
			SetSearchableAngle_(g_king, SEARCHABLE_ANGLE_MINIMUM); // �L���O
			g_jack  = ArrangePointNpc_(g_id_jack,  "NPC_23");
			g_queen = ArrangePointNpc_(g_id_queen, "NPC_24");
			g_ace   = ArrangePointNpc_(g_id_ace,   "NPC_25");
//			g_npc2  = ArrangePointNpc_(g_id_npc_000, "NPC_27"); // NPC_B
//			g_npc4  = ArrangePointNpc_(g_id_npc_000, "NPC_26"); // ����
//			g_npc5  = ArrangePointNpc_(g_id_npc_000, "NPC_30"); // ��s
//			g_npc6  = ArrangePointNpc_(g_id_npc_000, "NPC_31"); // �{��
//			g_npc7  = ArrangePointNpc_(g_id_npc_000, "NPC_32"); // ����
//			g_npc8  = ArrangePointNpc_(g_id_npc_000, "NPC_33"); // ���A�N�^�[
//			g_npc9  = ArrangePointNpc_(g_id_npc_001, "NPC_34"); // �A�N�Z�T��
//			g_inn   = ArrangePointNpc_(g_id_npc_000, "NPC_INN_02"); // �h��
			// ���A�N�^�[���b�Z�[�W�̐ݒ�
			SetReactorMsg_(g_king, "NPC_KING_REC");
			SetReactorMsg_(g_jack, "NPC_JACK_REC");
			SetReactorMsg_(g_queen, "NPC_QUEEN_REC");
			SetReactorMsg_(g_ace, "NPC_ACE_REC");
//			SetReactorMsg_(g_npc2, "NPC_NOCHO_MEN_REC");
//			SetReactorMsg_(g_npc4, "NPC_NOCHO_MEN_REC");
//			SetReactorMsg_(g_npc5, "NPC_NOCHO_MEN_REC");
//			SetReactorMsg_(g_npc6, "NPC_NOCHO_MEN_REC");
//			SetReactorMsg_(g_npc7, "NPC_NOCHO_MEN_REC");
//			SetReactorMsg_(g_npc8, "NPC_NOCHO_MEN_REC");
//			SetReactorMsg_(g_npc9, "NPC_NOCHO_WOMEN_REC");
//			SetReactorMsg_(g_inn, "NPC_NOCHO_MEN_REC");
			// ��b���J����
			SetTalkCameraType_(g_jack, TALK_CAMERA_UP);		// �W���b�N
			SetTalkCameraType_(g_queen, TALK_CAMERA_UP);	// �N�C�[��
			SetTalkCameraType_(g_ace, TALK_CAMERA_UP);		// �G�[�X
			SetTalkCameraType_(g_king, TALK_CAMERA_UP);		// �L���O
			// ��b�A�C�R�����\��&��b�����Ȃ�
			SetTalkEnable_(g_king, false);
			SetTalkEnable_(g_jack, false);
			SetTalkEnable_(g_queen, false);
			SetTalkEnable_(g_ace, false);
//			SetTalkEnable_(g_npc2, false);
//			SetTalkEnable_(g_npc4, false);
//			SetTalkEnable_(g_npc5, false);
//			SetTalkEnable_(g_npc6, false);
//			SetTalkEnable_(g_npc7, false);
//			SetTalkEnable_(g_npc8, false);
//			SetTalkEnable_(g_npc9, false);
//			SetTalkEnable_(g_inn, false);
			// �m�`������
			if(GetEventFlg_("BFG_DEAD_RETURN") == false){
				// ��S�Ŏ�
				g_npc1  = ArrangePointNpc_(g_id_nochorin, "NPC_29"); // NPC_A(�m�`������)
				SetReactorMsg_(g_npc1, "NPC_NOCHORIN_REC");
				SetTalkCameraType_(g_npc1, TALK_CAMERA_UP);
				SetTalkEnable_(g_npc1, false);
			}
			else{
				// �S�Ŏ�
				dead_npc = ReadAndArrangePointNpc("n043", "NPC_39");
				SetTalkEnable_(dead_npc, false);
			}
		}
		// �ǂ̑O
		if(city_num >= GetFlagID_("CONST_SS_CI_NOT_ENTER_THE_BUILDING")
		&& city_num <= GetFlagID_("CONST_SS_CI_RESTORATION_POWER_PLANT"))
		{
			// �ʍ�
			local g_throne_01 = ReadGimmick_("o_com_05");
			local throne_01 = ArrangePointGimmick_("o_com_05", g_throne_01, "g_throne_01");
			// �h���̊Ŕ�
			local g_board = ReadGimmick_("o_com_13");
			local board = ArrangePointGimmick_("o_com_13", g_board, "g_board");
			// ���\�[�X�ǂݍ���
			local g_id_npc_000 = ReadNpc_("n000");	// �m�`���[���j
			local g_id_npc_001 = ReadNpc_("n004");	// �m�`���[����
			local g_id_jack    = ReadNpc_("n001");	// �W���b�N
			local g_id_ace     = ReadNpc_("n002");	// �G�[�X
			local g_id_king    = ReadNpc_("n003");	// �L���O
			local g_id_queen   = ReadNpc_("n005");	// �N�C�[��
			// NPC�z�u
			g_king    = ArrangePointNpc_(g_id_king,  "NPC_09");
			// ��b���J����(�S�ŕ��A���͉�b�������Ȃ�����)
			if(GetEventFlg_("BFG_DEAD_RETURN") == false){
				SetTalkCameraType_(g_king, TALK_CAMERA_UP); // �L���O
				SetTalkTurn_ (g_king, false); //�L���O�͐U������Ȃ��悤�ɂ���
				// NPC�̉�b�\�p�x��ݒ�
				SetSearchableAngle_(g_king, SEARCHABLE_ANGLE_MINIMUM); // �L���O
			}
			else{
				SetTalkEnable_(g_king, false);
			}
			g_jack    = ArrangePointNpc_(g_id_jack,  "NPC_12");
			g_queen   = ArrangePointNpc_(g_id_queen, "NPC_10");
			g_ace     = ArrangePointNpc_(g_id_ace,   "NPC_11");
			g_npc7    = ArrangePointNpc_(g_id_npc_000, "NPC_19"); // ����
			g_npc8    = ArrangePointNpc_(g_id_npc_000, "NPC_20"); // ���A�N�^�[
			g_npc9    = ArrangePointNpc_(g_id_npc_001, "NPC_21"); // �A�N�Z�T��
			g_inn     = ArrangePointNpc_(g_id_npc_000, "NPC_INN_01"); // �h��
			// ���A�N�^�[���b�Z�[�W�̐ݒ�
			SetReactorMsg_(g_king, "NPC_KING_REC");
			SetReactorMsg_(g_jack, "NPC_JACK_REC");
			SetReactorMsg_(g_queen, "NPC_QUEEN_REC");
			SetReactorMsg_(g_ace, "NPC_ACE_REC");
			SetReactorMsg_(g_npc7, "NPC_NOCHO_MEN_REC");
			SetReactorMsg_(g_npc8, "NPC_NOCHO_MEN_REC");
			SetReactorMsg_(g_npc9, "NPC_NOCHO_WOMEN_REC");
			SetReactorMsg_(g_inn, "NPC_NOCHO_MEN_REC");
			// ��b���J����
			SetTalkCameraType_(g_jack, TALK_CAMERA_UP);		// �W���b�N
			SetTalkCameraType_(g_queen, TALK_CAMERA_UP);	// �N�C�[��
			SetTalkCameraType_(g_ace, TALK_CAMERA_UP);		// �G�[�X
			SetTalkCameraType_(g_king, TALK_CAMERA_UP);		// �L���O
		}
		//�o�g���f�o�{���r���ɓ���Ȃ��m�`���[�������Đ���
		if(city_num >= GetFlagID_("CONST_SS_CI_EVENING_CITY")
		&& city_num <= GetFlagID_("CONST_SS_CI_RESTORATION_POWER_PLANT"))
		{
			// ���\�[�X�Ǎ�
			local g_id_nochorin = ReadNpc_("n043"); // �m�`������
			local g_id_npc_000  = ReadNpc_("n000"); // �m�`���[���j
			local g_id_npc_001  = ReadNpc_("n004");	// �m�`���[����
			// NPC�ݒu
			g_npc1    = ArrangePointNpc_(g_id_nochorin, "NPC_13"); // NPC_A(�m�`������)
			SetTalkCameraType_(g_npc1, TALK_CAMERA_UP);
			g_npc2    = ArrangePointNpc_(g_id_npc_000, "NPC_14"); // NPC_B
			g_npc1_2  = ArrangePointNpc_(g_id_npc_001, "NPC_35"); // �{��
			g_npc2_2  = ArrangePointNpc_(g_id_npc_000, "NPC_36"); // ���
			g_npc5    = ArrangePointNpc_(g_id_npc_000, "NPC_17"); // ��s
			// ���A�N�^�[���b�Z�[�W�̐ݒ�
			SetReactorMsg_(g_npc1, "NPC_NOCHORIN_REC");
			SetReactorMsg_(g_npc2, "NPC_NOCHO_MEN_REC");
			SetReactorMsg_(g_npc1_2, "NPC_NOCHO_WOMEN_REC");
			SetReactorMsg_(g_npc2_2, "NPC_NOCHO_MEN_REC");
			SetReactorMsg_(g_npc5, "NPC_NOCHO_MEN_REC");
		}
		//�ړI�n�̓o�g���f�o�{���r���Đ���
		if(city_num == GetFlagID_("CONST_SS_CI_NOT_ENTER_THE_BUILDING"))
		{
			// ���\�[�X�Ǎ�
			local g_id_nochorin = ReadNpc_("n043"); // �m�`������
			local g_id_npc_000  = ReadNpc_("n000"); // �m�`���[���j
			local g_id_npc_001  = ReadNpc_("n004");	// �m�`���[����
			// NPC�ݒ�
			g_npc1    = ArrangePointNpc_(g_id_nochorin, "NPC_37"); // NPC_A(�m�`������)
			// ��b���J����(�S�ŕ��A���͉�b�������Ȃ�����)
			if(GetEventFlg_("BFG_DEAD_RETURN") == false){
				SetTalkCameraType_(g_npc1, TALK_CAMERA_UP);		// NPC_A(�m�`������)
			}
			else{
				SetTalkEnable_(g_npc1, false);
			}
			g_npc2    = ArrangePointNpc_(g_id_npc_000, "NPC_14"); // NPC_B
			g_npc1_2  = ArrangePointNpc_(g_id_npc_001, "NPC_35"); // �{��
			g_npc2_2  = ArrangePointNpc_(g_id_npc_000, "NPC_36"); // ���
			g_npc5    = ArrangePointNpc_(g_id_npc_000, "NPC_38"); // ��s
			// ���A�N�^�[���b�Z�[�W�̐ݒ�
			SetReactorMsg_(g_npc1, "NPC_NOCHORIN_REC");
			SetReactorMsg_(g_npc2, "NPC_NOCHO_MEN_REC");
			SetReactorMsg_(g_npc1_2, "NPC_NOCHO_WOMEN_REC");
			SetReactorMsg_(g_npc2_2, "NPC_NOCHO_MEN_REC");
			SetReactorMsg_(g_npc5, "NPC_NOCHO_MEN_REC");
		}
	}


//-------------------------------------------------------------------------------------
// �C�x���g�n��
	// �C�x���g�n���̏�����
	g_mine_00     <- C_NONE_ID;
	g_mine_02     <- C_NONE_ID;
	g_mine_03     <- C_NONE_ID;
	g_mine_04     <- C_NONE_ID;
	g_mine_05     <- C_NONE_ID;
	g_mine_06     <- C_NONE_ID;
	g_mine_07     <- C_NONE_ID;
	mine_wall00   <- C_NONE_ID;
	mine_wall_01  <- C_NONE_ID;
	mine_wall_02  <- C_NONE_ID;
	mine_wall_03  <- C_NONE_ID;
	mine_wall_04  <- C_NONE_ID;
	mine_ruler_01 <- C_NONE_ID;
	mine_ruler_02 <- C_NONE_ID;
	mine_ruler_03 <- C_NONE_ID;
	mine_full     <- C_NONE_ID;
	mine_stele00  <- C_NONE_ID;	// �Q�[�g�O(���[���|�C���g�i���֎~1)
	mine_stele01  <- C_NONE_ID;	// �Q�[�g�O(���[���|�C���g�i���֎~2)
	mine_stele07  <- C_NONE_ID;	// �Q�[�g�O(���[���|�C���g�i���֎~3)
	mine_stele08  <- C_NONE_ID;	// �Q�[�g�O(���[���|�C���g�i���֎~4)
	mine_stele09  <- C_NONE_ID;	// �Q�[�g�O(���[���|�C���g�i���֎~5)
	mine_stele02  <- C_NONE_ID;	// �Q�[�g�O(�܂񂽂�擾�f���J�n)
	mine_stele03  <- C_NONE_ID;	// �Q�[�g�O(�Δ�𒲂ׂ�܂ŕ���1)
	mine_stele04  <- C_NONE_ID;	// �Q�[�g�O(�Δ�𒲂ׂ�܂ŕ���2)
	mine_stele05  <- C_NONE_ID;	// �Q�[�g�O(�Δ�𒲂ׂ�܂ŕ���3)
	mine_stele06  <- C_NONE_ID;	// �Q�[�g�O(�Δ�𒲂ׂ�܂ŕ���4)
	mine_stele10  <- C_NONE_ID;	// �Q�[�g�O(�Δ�𒲂ׂ�܂ŕ���5)
	g_mine_ladder <- C_NONE_ID;
	// �C�x���g�n���̓Ǎ�
	// �����t�B�[���h�֔��
	g_mine_00 = SetPointCircleEventMine_("00_Mine", true);

	// ���y�̗쓹�֔��
	g_mine_07 = SetPointCircleEventMine_("07_Mine", true);

	// �܂񂽂�Δ�̃C�x���g�i�s�x��
	// �܂񂽂񖢎擾���
	if(sub_num == 0){
		mine_stele02 = SetPointCircleEventMine_("09_Mine02", false);
	}
	// �Δ�ɋ߂Â�( mine_stele02�ɐG�ꂽ�� )
	else if(sub_num == 1){
		mine_stele03 = SetPointBoxEventMine_("09_Mine", false);
		mine_stele04 = SetPointBoxEventMine_("10_Mine", false);
		mine_stele05 = SetPointBoxEventMine_("11_Mine", false);
		mine_stele10 = SetPointBoxEventMine_("11_Mine02", false);
		mine_stele06 = SetPointBoxEventMine_("12_Mine", false);
	}
	// �܂񂽂�擾��
	else{
	}

	// �܂񂽂�Δ�𒲂ׂ����ǂ���
	if(GetEventFlg_("BFG_EXAMINE_FULLTANK_STELE") == false){
		mine_full = SetPointCircleEventMine_("08_Mine", true);
	}

	// �����s�s
	if(main_num == 2){
		if(city_num == GetFlagID_("CONST_SS_CI_GO_BACK_KING")){
			g_mine_05 = SetPointBoxEventMine_("05_Mine", false);
		}
		if(city_num == GetFlagID_("CONST_SS_CI_EVENING_CITY")){
			// ���d�{�ݑO(demo124[����[��])
			g_mine_04 = SetPointCircleEventMine_("04_Mine", false);
		}
		if(city_num == GetFlagID_("CONST_SS_CI_NOT_ENTER_THE_BUILDING")){
			g_mine_03    = SetPointBoxEventMine_("03_Mine", false);
			mine_stele00 = SetPointBoxEventMine_("09_Mine", false);
			mine_stele01 = SetPointBoxEventMine_("10_Mine", false);
			mine_stele07 = SetPointBoxEventMine_("11_Mine", false);
			mine_stele08 = SetPointBoxEventMine_("11_Mine02", false);
			mine_stele09 = SetPointBoxEventMine_("12_Mine", false);
		}
		if(city_num == GetFlagID_("CONST_SS_CI_CLIMB_THE_LADDER")){
			g_mine_02 = SetPointBoxEventMine_("02_Mine", false);
		}
	}
	// ���d�{�ݕ����O�ɃZ���^�[�r���ɓ����̂Ői�s�s�n����ݒu(�ی�)
	if(check_restoration == false){
		g_mine_06 = SetPointCircleEventMine_("06_Mine", true);
		//�����̍ŏ��̔��ɊJ���Ȃ��Ƃ������b�Z�[�W��\��������
		mine_wall00 = SetPointCircleEventMine_("mine_wall_00", true);
		mine_wall_01 = SetPointCircleEventMine_("mine_wall_01", true);
		mine_wall_02 = SetPointCircleEventMine_("mine_wall_02", true);
		mine_wall_03 = SetPointCircleEventMine_("mine_wall_03", true);
		//�k���V���b�^�[���͊J���Ȃ��Ƃ������b�Z�[�W��\��������
		mine_wall_04 = SetPointCircleEventMine_("mine_wall_04", true);
	}

	//�Z���^�[�r���̃V���b�^�[�O�̃��[���|�C���g
	mine_ruler_01 = SetPointCircleEventMine_("mine_ruler_01", true);
	//���d�{�݂̑O�̃��[���|�C���g
	mine_ruler_02 = SetPointCircleEventMine_("mine_ruler_02", true);
	//�k���Q�[�g�O
	mine_ruler_03 = SetPointCircleEventMine_("mine_ruler_03", true);

	// �n�V�S�p�̒n��
	if(GetEventFlg_("BFG_CHECK_USED_FIRST_TIME_LADDER") == false){
		g_mine_ladder = SetPointCircleEventMine_("mine_ladder_01", false);
	}
//------------------------------------------------------
// �M�~�b�N
	// �]�����u(�����t�B�[���h��)
	local g_transfer = ReadGimmick_("o_com_01");
	local transfer_device = ArrangePointGimmick_("o_com_01", g_transfer, "g_transfer");

	// �]�����u(���y�̗쓹��)
	local g_transfer_02 = ReadGimmick_("o_com_01");
	local transfer_device_02 = ArrangePointGimmick_("o_com_01", g_transfer_02, "g_transfer_02");

	// �Δ�(�܂񂽂�)
	local g_stele = ReadGimmick_("o_com_07");
	g_full_stele <- ArrangePointGimmick_("o_com_07", g_stele, "stele");
	SetMotion_(g_full_stele, "GIMMICK_0", 0);
	if(GetEventFlg_("BFG_EXAMINE_FULLTANK_STELE") == true){
		SetMotion_(g_full_stele, "GIMMICK_2", 0);
	}

	// SetTime_()�݂������݂̌o�ߎ��ԃt���[�������擾����bit�t���O��ύX���ē_�������������
	local g_bill = ReadGimmick_("o_A00_04");
	local bill_light = ArrangePointGimmick_("o_A00_04", g_bill, "g_bill");
	if(check_restoration == false){
		// ����
		SetMotion_(bill_light, "GIMMICK_0", 0);
	}else{
		// �_��
		SetMotion_(bill_light, "GIMMICK_1", 0);
	}

	// ���d�{�݂���������܂Ŕz�u
	if(check_restoration == false){
		// ���ʂ̔��M�~�b�N
		local g_wall_00 = ReadGimmick_("o_A00_01");
		wall_00 <- ArrangePointGimmick_("o_A00_01", g_wall_00, "g_wall_00");
		// �r��������O�̕�(1)
		local g_wall_01 = ReadGimmick_("o_A00_03");
		wall_01 <- ArrangePointGimmick_("o_A00_03", g_wall_01, "g_wall_01");
		// �r��������O�̕�(2)
		local g_wall_02 = ReadGimmick_("o_A00_03");
		wall_02 <- ArrangePointGimmick_("o_A00_03", g_wall_02, "g_wall_02");
		// �r��������O�̕�(3)
		local g_wall_03 = ReadGimmick_("o_A00_03");
		wall_03 <- ArrangePointGimmick_("o_A00_03", g_wall_03, "g_wall_03");
		// ���y�̗쓹�̈ړ����u�O�̔�
		local g_wall_04 = ReadGimmick_("o_A00_01");
		wall_04 <- ArrangePointGimmick_("o_A00_01", g_wall_04, "g_wall_04");
	}
	// ���[���|�C���g(�o�g��GP�{�� �����O)
	local g_rulerpoint = ReadGimmick_("o_com_08");
	rulerpoint01 <- ArrangePointGimmick_("o_com_08", g_rulerpoint, "g_rulerpoint01");
	SetMotion_(rulerpoint01, "GIMMICK_0", 0);
	if(GetEventFlg_("BFG_RULER_ADD_002") == true){
		SetMotion_(rulerpoint01, "GIMMICK_2", 0);
	}
	// ���[���|�C���g(���d�{�ݑO)
	rulerpoint02 <- ArrangePointGimmick_("o_com_08", g_rulerpoint, "g_rulerpoint02");
	if(GetEventFlg_("BFG_RULER_ADD_005") == true){
		SetMotion_(rulerpoint02, "GIMMICK_2", 0);
	}
	// ���[���|�C���g(�k���Q�[�g�O)
	rulerpoint03 <- ArrangePointGimmick_("o_com_08", g_rulerpoint, "g_rulerpoint03");
	if(GetEventFlg_("BFG_RULER_ADD_030") == true){
		SetMotion_(rulerpoint03, "GIMMICK_2", 0);
	}
//-------------------------------------------------------------------------------
//���A�N�^�[�|�C���g
	//�嗤�ړ����u
	local reactorPoint01 = ArrangeMsgReactorPoint("reactorPoint_01", GetFlagID_("BFG_REACTER_POINT_015")
		, SHORT_DIST, "REC_POINT_NOC_01_01", "REC_POINT_NOC_01_02");
	if(check_restoration == false){
		//��̖h�ЃV���b�^�[(�k��)
		local reactorPoint02 = ArrangeMsgReactorPoint("reactorPoint_02_N", GetFlagID_("BFG_REACTER_POINT_016")
			, SHORT_DIST, "REC_POINT_NOC_02_01", "REC_POINT_NOC_02_02");
		//��̖h�ЃV���b�^�[(�쑤)
		local reactorPoint02 = ArrangeMsgReactorPoint("reactorPoint_02_S", GetFlagID_("BFG_REACTER_POINT_016")
			, SHORT_DIST, "REC_POINT_NOC_02_01", "REC_POINT_NOC_02_02");
		//�����̃V���b�^�[
		local reactorPoint03 = ArrangeMsgReactorPoint("reactorPoint_03", GetFlagID_("BFG_REACTER_POINT_016")
			, SHORT_DIST, "REC_POINT_NOC_02_01", "REC_POINT_NOC_02_02");
		//�k���̖h�ЃV���b�^�[
		local reactorPoint04 = ArrangeMsgReactorPoint("reactorPoint_04", GetFlagID_("BFG_REACTER_POINT_016")
			, SHORT_DIST, "REC_POINT_NOC_02_01", "REC_POINT_NOC_02_02");
	}
	//���d�{��
	local reactorPoint05 = ArrangeMsgReactorPoint("reactorPoint_05", GetFlagID_("BFG_REACTER_POINT_017")
		, LONG_DIST, "REC_POINT_NOC_03_01", "REC_POINT_NOC_03_02");
	//�o�g��GP�{��
	local reactorPoint06 = ArrangeMsgReactorPoint("reactorPoint_06", GetFlagID_("BFG_REACTER_POINT_020")
		, LONG_DIST, "REC_POINT_NOC_04_01", "REC_POINT_NOC_04_02");
	//�嗤�ړ����u
	local reactorPoint07 = ArrangeMsgReactorPoint("reactorPoint_07", GetFlagID_("BFG_REACTER_POINT_015")
		, SHORT_DIST, "REC_POINT_NOC_07_01", "REC_POINT_NOC_07_02");
	//CORE
	local reactorPoint08 = ArrangeMsgReactorPoint("reactorPoint_08", GetFlagID_("BFG_REACTER_POINT_001")
		, ENDLESS_DIST, "REC_POINT_NOC_05_01", "REC_POINT_NOC_05_02");
	//���[���|�C���g
	local reactorPoint09 = ArrangeMsgReactorPoint("reactorPoint_09", GetFlagID_("BFG_REACTER_POINT_010")
		, SHORT_DIST, "REC_POINT_NOC_06_01", "REC_POINT_NOC_06_02");
	//���[���|�C���g
	local reactorPoint10 = ArrangeMsgReactorPoint("reactorPoint_10", GetFlagID_("BFG_REACTER_POINT_010")
		, SHORT_DIST, "REC_POINT_NOC_06_01", "REC_POINT_NOC_06_02");
	// �Δ�(�܂񂽂�)
	local reactorPoint11 = ArrangeMsgReactorPoint("reactorPoint_11", GetFlagID_("BFG_REACTER_POINT_045")
		, SHORT_DIST, "REC_POINT_NOC_08_01", "REC_POINT_NOC_08_02");
	// ���[���|�C���g(�V�K:�k���Q�[�g)
	local reactorPoint12 = ArrangeMsgReactorPoint("reactorPoint_12", GetFlagID_("BFG_REACTER_POINT_010")
		, SHORT_DIST, "REC_POINT_NOC_06_01", "REC_POINT_NOC_06_02");
	// �V���̒�
	local reactorPoint13 = ArrangeMsgReactorPoint("reactorPoint_13", GetFlagID_("BFG_REACTER_POINT_176")
		, SHORT_DIST, "REC_POINT_NOC_09_01", "REC_POINT_NOC_09_02");

//-------------------------------------------------------------------------------
//�}�b�v�i�r

	// �i�r�}�b�v�A�C�R���i�^�[�Q�b�g�j
	// ���[�J���ϐ��p
	local g_map_navi01 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.DESTINATION, "map_navi_01");  // �n�V�S��o�����Ƃ���
	local g_map_navi02 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.DESTINATION, "map_navi_02");  // �Z���^�[�r����̑O
	local g_map_navi04 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.DESTINATION, "map_navi_04");  // �L���O�_��
	local g_map_navi05 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.DESTINATION, "map_navi_05");  // ���y�̗쓹�s���ړ����u
	// �O���[�o���ϐ��p
	g_map_navi03 <- ArrangePointNaviMapIcon_(NAVIMAP_ICON.DESTINATION, "map_navi_03");  // ���d�{��
	g_map_navi06 <- ArrangePointNaviMapIcon_(NAVIMAP_ICON.DESTINATION, "map_navi_06");  // �܂񂽂�Δ�

	SetNaviMapIconVisible_(g_map_navi01, false);
	SetNaviMapIconVisible_(g_map_navi02, false);
	SetNaviMapIconVisible_(g_map_navi03, false);
	SetNaviMapIconVisible_(g_map_navi04, false);
	SetNaviMapIconVisible_(g_map_navi05, false);
	SetNaviMapIconVisible_(g_map_navi06, false);

	// �����i�s��
	if(main_num == 2){
		if(city_num == 0
		|| city_num == GetFlagID_("CONST_SS_CI_CLIMB_THE_LADDER")){
			SetNaviMapIconVisible_(g_map_navi01, true);	// �n�V�S��o�����Ƃ���
		}
		if(city_num == GetFlagID_("CONST_SS_CI_NOT_ENTER_THE_BUILDING")){
			SetNaviMapIconVisible_(g_map_navi02, true);	// �Z���^�[�r����̑O
		}
		if(city_num >= GetFlagID_("CONST_SS_CI_EVENING_CITY")
		&& city_num <= GetFlagID_("CONST_SS_CI_RESTORATION_POWER_PLANT")){
			// �܂񂽂񖢎擾���,�[���f������
			if(sub_num == 0 || sub_num == 1){
				SetNaviMapIconVisible_(g_map_navi06, true);	// �܂񂽂�Δ�
			}
			// �܂񂽂�擾���
			else{
				SetNaviMapIconVisible_(g_map_navi03, true);	// ���d�{��
			}
		}
		if(city_num >= GetFlagID_("CONST_SS_CI_GO_BACK_KING")
		&& city_num <= GetFlagID_("CONST_SS_CI_TEST_RUN_HAIGOU")){
			SetNaviMapIconVisible_(g_map_navi04, true);	// �L���O�_��
		}
		if(city_num == GetFlagID_("CONST_SS_CI_GO_NEXT_CONTINENT")){
			SetNaviMapIconVisible_(g_map_navi05, true);	// ���y�̗쓹�s���ړ����u
		}
	}
	// ���V�i���I�i�s��
	else if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){				// NUm0  = 9
		// demo803[���̓X�^�[�V�[�h]�̍Đ��� �` �A���}�Ɏw�ւ�������܂�
		if(inside_num >= GetFlagID_("CONST_SS_OS_GO_CENTER_BILL_1F")		// Num10 = 4
		&& inside_num <= GetFlagID_("CONST_SS_OS_GET_DISC_ACCESSORY")){		// NUm10 = 8
			SetNaviMapIconVisible_(g_map_navi04, true);	// �L���O�_��
		}
	}
	
	//���[���|�C���g���N����Ƀ��[���|�C���g�A�C�R���\��
	if(GetEventFlg_("BFG_RULER_ADD_002") == true){
		local icon01 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.RULER_POINT , "g_rulerpoint01");
		SetNaviMapIconVisible_(icon01, true);
	}
	if(GetEventFlg_("BFG_RULER_ADD_005") == true){
		local icon02 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.RULER_POINT , "g_rulerpoint02");
		SetNaviMapIconVisible_(icon02, true);
	}
	if(GetEventFlg_("BFG_RULER_ADD_030") == true){
		local icon03 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.RULER_POINT , "g_rulerpoint03");
		SetNaviMapIconVisible_(icon03, true);
	}

	// �Δ�(�܂񂽂�)�A�C�R��
	icon_stone <- ArrangePointNaviMapIcon_(NAVIMAP_ICON.STONE , "stele");

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

//-------------------- ������ --------------------
// �N�������F�t�B�[���h����J�n��
// �}�b�v�؂�ւ�����̃f���Đ��E�o�g���J�n���߁E
// �ݒu����Wait�����݂Ȃ��瑀�삷��̂̓R�R
//-------------------- ������ --------------------
function EventStartOperate()
{
// �t���O�̏�Ԃ��擾
	local main_num   = GetNumFlg_("NUM_SCENARIO_MAIN");
	local green_num  = GetNumFlg_("NUM_SCENARIO_SUB_GREEN");
	local city_num   = GetNumFlg_("NUM_SCENARIO_SUB_CITY");
	local sky_num    = GetNumFlg_("NUM_SCENARIO_SUB_SKY");
	local sub_num    = GetNumFlg_("NUM_FLG_GO_POWER_PLANT_STATE");

	// ���d�{�݂œd�͂̕������s��ꂽ�����`�F�b�N(��ɃM�~�b�N�p)
	local check_restoration = GetEventFlg_("BFG_RESTORATION_POWER_PLANT");
	// �S�ŕ��A�t���O
	local check_dead = GetEventFlg_("BFG_DEAD_RETURN");

	//---------------
	// ���M�~�b�N�ݒ�
	//---------------
	local examine_stele = GetEventFlg_("BFG_EXAMINE_FULLTANK_STELE");
	if(examine_stele == true){
		// �Δ�͌���Ȃ�
		SetMotion_(g_full_stele, "GIMMICK_2", 0);
		DebugPrint("�Δ�(�܂񂽂�)�̃A�j����GIMMICK_2�ł�");
		SetNaviMapIconVisible_(icon_stone, false);
	}
	else{
		// �Δ�͌���
		SetMotion_(g_full_stele, "GIMMICK_0", 0);
		DebugPrint("�Δ�(�܂񂽂�)�̃A�j����GIMMICK_0�ł�");
		SetNaviMapIconVisible_(icon_stone, true);
	}

	//-----------
	// ���S�ŕ��A
	//-----------
	// ���A�ʒu�̃`�F�b�N
	if(check_dead == true){
		if(main_num == GetFlagID_("CONST_SM_CITY")){
			if(city_num < GetFlagID_("CONST_SS_CI_EVENING_CITY")){
				// �^���f����BGM�𓪑ł��ɂ���t���O
				SetEventFlg_("BFG_RETURN_BATTLE_FIRLD_BGM_HEAD", true);
				// �S�ŒʒmBit�t���O��false�ɖ߂�( �v���O�����ŗ��ĂăX�N���v�g�ō~�낷 )
				SetEventFlg_("BFG_DEAD_RETURN", false);
				// �S�ŕ��A�f��
				uDeadReturnDemo1();
			}
			else if(city_num >= GetFlagID_("CONST_SS_CI_EVENING_CITY")
			&& city_num <= GetFlagID_("CONST_SS_CI_RESTORATION_POWER_PLANT")){
				// �^���f����BGM�𓪑ł��ɂ���t���O
				SetEventFlg_("BFG_RETURN_BATTLE_FIRLD_BGM_HEAD", true);
				// �S�ŒʒmBit�t���O��false�ɖ߂�( �v���O�����ŗ��ĂăX�N���v�g�ō~�낷 )
				SetEventFlg_("BFG_DEAD_RETURN", false);
				// �S�ŕ��A�f��
				uDeadReturnDemo2();
			}
			else if(city_num == GetFlagID_("CONST_SS_CI_GO_BACK_KING")
			|| city_num == GetFlagID_("CONST_SS_CI_ESTABLISH_KINGDOM")){
				// �^���f����BGM�𓪑ł��ɂ���t���O
				SetEventFlg_("BFG_RETURN_BATTLE_FIRLD_BGM_HEAD", true);
				// �S�ŒʒmBit�t���O��false�ɖ߂�( �v���O�����ŗ��ĂăX�N���v�g�ō~�낷 )
				SetEventFlg_("BFG_DEAD_RETURN", false);
				// �S�ŕ��A�f��
				uDeadReturnDemo3();
			}
			else{
				// ��O
			}
		}
	}

	//----------
	// ��BGM�ύX
	//----------
	// �����s�s�ɗ��čŏ��̃^�C�~���O
	if(main_num == GetFlagID_("CONST_SM_CITY")){
		if(city_num == GetFlagID_("CONST_SS_CI_CLIMB_THE_LADDER")){
			StopBgm_(0);
			SetEventFlg_("BFG_A00_00_ENVIRONMENT_BGM_PLAY", true);
		}
	}
	// ����J�n
	else if(main_num == GetFlagID_("CONST_SM_SKY")){				// Num0 = 8
		// ����{�[�V���b�N��|���܂�
		if(sky_num < GetFlagID_("CONST_SS_SK_GO_GRAVE_SKY")){		// Num9 < 18
			StopBgm_(0);
			SetEventFlg_("BFG_A00_00_ENVIRONMENT_BGM_PLAY", true);
		}
	}

	//-----------------------
	// ���ړ����u���g�p������
	//-----------------------
	if(GetEventFlg_("BFG_RIDE_OFF_USED_TRANSFER") == true){
		UsingTransfer();
		
		// �����s�s�ɗ��čŏ��̃^�C�~���O
		if(main_num == GetFlagID_("CONST_SM_CITY")){
			if(city_num == GetFlagID_("CONST_SS_CI_CLIMB_THE_LADDER")){
				CommSavedAfterTransferDemo("BFG_SCENARIO_CLEAR_GRASS");
			}
		}
		
		SetEventFlg_("BFG_RIDE_OFF_USED_TRANSFER", false);
	}

	//-----------------
	// ���[���f���̍Đ�
	//-----------------
	if(GetEventFlg_("BFG_RIDE_OFF_FLAG_BEFORE_STELE") == true){
		CommChangeMomentFadeOut(FADE_COLOR_BLACK);
		SetEventFlg_("BFG_RIDE_OFF_FLAG_BEFORE_STELE", false);
		uPlayableDemoStele();
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

//-------------------- NPC --------------------
//�N�������FNPC�Ɍ�������A�{�^���������ꂽ��
//OpenMsgWnd_() -> ShowMsg_() -> KeyInputWait_() �̏��ɌĂяo������
//-------------------- NPC --------------------
function TouchNpc()
{
// �t���O�̏�Ԃ��擾
	local main_num   = GetNumFlg_("NUM_SCENARIO_MAIN");
	local city_num   = GetNumFlg_("NUM_SCENARIO_SUB_CITY");
	local sub_num    = GetNumFlg_("NUM_FLG_GO_POWER_PLANT_STATE");

	// NPC�̎�ނ��擾
	local target = GetTargetId_();

	switch(target)
	{
	case g_king:
		ContentKing(main_num, city_num);
		break;
	case g_jack:
		ContentJack(main_num, city_num);
		break;
	case g_ace:
		ContentAce(main_num, city_num);
		break;
	case g_queen:
		ContentQueen(main_num, city_num);
		break;
	case g_npc1:
		ContentNPC_A(main_num, city_num);
		break;
	case g_npc2:
		ContentNPC_B(main_num, city_num);
		break;
	case g_npc1_2:
		ContentBOK(main_num, city_num);
		break;
	case g_npc2_2:
		ContentIMP(main_num, city_num);
		break;
	case g_npc5:
		ContentBNK(main_num, city_num);
		break;
	case g_npc7:
		ContentBUT(main_num, city_num);
		break;
	case g_npc8:
		ContentREC(main_num, city_num);
		break;
	case g_npc9:
		ContentACC(main_num, city_num);
		break;
	case g_inn:
		// ��l���̈ʒu�ƌ������C��
		local re_pos = Vec3(33.534, -46.050, 1002.144);	// ���A�ʒu���w��
		local re_dir = 120;								// �������w��
		// �h���ŕ\�����郁�b�Z�[�W���w��
		local message_key_1 = "INN_MSG_CITY_1ST_001";
		local message_key_2 = "INN_MSG_CITY_1ST_002";
		local message_key_3 = "INN_MSG_CITY_1ST_003";
		// ���b�Z�[�W�̕\��
		OpenMsgWnd_();
		ShowMsg_(message_key_1);	// �u�₟ ��������Ⴂ�c
		KeyInputWait_();
		switch(GetQueryResult_())
		{
		case QUERY2_0:
		// ���܂鏈��
			CloseMsgWnd_();
			// �h���̋��ʂ̉񕜏���
			CommTaskInn(re_pos, re_dir, false, g_inn);
			// ���b�Z�[�W�̕\��
			OpenMsgWnd_();
			ShowMsg_(message_key_3);	// �u���͂�[��������c
			KeyInputWait_();
			CloseMsgWnd_();
			break;
		case QUERY2_1:
		// ��߂鏈��
			// ���b�Z�[�W�̕\��
			ShowMsg_(message_key_2);	// �u�킩����������c
			KeyInputWait_();
			CloseMsgWnd_();
			break;
		}
		break;
	default:
		DebugPrint("�b�����肪���܂���");
		break;
	}

	EventEnd_();
}

//-------------------- NPC --------------------
//�N�������F���A�N�^�[���g�p�����{����b
//OpenMsgWnd_() -> ShowMsg_() -> KeyInputWait_() �̏��ɌĂяo������
//-------------------- NPC --------------------
function ReactorAnalyze()
{
// �t���O�̏�Ԃ��擾
	local main_num   = GetNumFlg_("NUM_SCENARIO_MAIN");
	local city_num   = GetNumFlg_("NUM_SCENARIO_SUB_CITY");
	local sub_num    = GetNumFlg_("NUM_FLG_GO_POWER_PLANT_STATE");

	EventEnd_();
}


//-------------------- �C�x���g�n�� --------------------
//�N�������F�}�b�v�ɔz�u�������b�V���ɐG�ꂽ�Ƃ�
//-------------------- �C�x���g�n�� --------------------
function TouchEventMine(){
// �t���O�̏�Ԃ��擾
	local main_num   = GetNumFlg_("NUM_SCENARIO_MAIN");
	local green_num  = GetNumFlg_("NUM_SCENARIO_SUB_GREEN");
	local city_num   = GetNumFlg_("NUM_SCENARIO_SUB_CITY");
	local sub_num    = GetNumFlg_("NUM_FLG_GO_POWER_PLANT_STATE");
	local dont_use_transfer1 = GetEventFlg_("BFG_DONT_TRANSFER_GREEN_TO_CITY");// ����-�����Ԃ̑嗤�ړ����u�̎g�p���֎~����t���O
	local dont_use_transfer2 = GetEventFlg_("BFG_DONT_TRANSFER_CITY_TO_GRAVE");// ����-�쓹�Ԃ̑嗤�ړ����u�̎g�p���֎~����t���O

	local target = GetTouchEventMineId_();
	local player = GetPlayerId_();

	// ���d�{�݂œd�͂̕������s��ꂽ�����`�F�b�N
	local check_restoration = GetEventFlg_("BFG_RESTORATION_POWER_PLANT");

	switch(target)
	{
	// �ړ����u(�����s��)
	case g_mine_00:
		if(dont_use_transfer1 == false){
			// �I�������b�Z�[�W
			OpenMsgWnd_();
			ShowMsg_("MINE_00_MSG");
			KeyInputWait_();
			if(GetQueryResult_() == QUERY_YES){
				CloseMsgWnd_();
				// ���C�h��Ԃő嗤�ړ������ꍇ�A���C�h����������t���O
				SetEventFlg_("BFG_RIDE_OFF_USED_TRANSFER", true);
				DeleteEventMine_(g_mine_00);
				// �����̕��A�ʒu
				ChangeMapPosDir_("H00_00", Vec3(-613.237, 555.044, -1783.254), 100);
			}
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
	// �ړ����u(�쓹�s��)
	case g_mine_07:
		if(dont_use_transfer2 == false){
			// ���y�̗쓹�s���̈ړ����u���փt���O
			if(GetEventFlg_("BFG_ENABLED_GO_TO_GRAVE_TRANSFER") == true){
				if(city_num == GetFlagID_("CONST_SS_CI_GO_NEXT_CONTINENT")){
					// �{�^���A�łŃo�O����������̂Œn�����폜
					DeleteEventMine_(g_mine_07);
					// �����s�s�̑嗤�N���A�t���O��ݒ�
					SetEventFlg_("BFG_SCENARIO_CLEAR_CITY", true);
					// �嗤�ړ��̃f�����ɃZ�[�u�|�C���g�����ލۂɎg�p����t���O
					SetEventFlg_("BFG_SAVE_POINT_FLAG", true);
					// ���C�h��Ԃő嗤�ړ������ꍇ�A���C�h����������t���O
					SetEventFlg_("BFG_RIDE_OFF_USED_TRANSFER", true);
					// �C�x���g�t���O��i�߂�
					SetNumFlg_("NUM_SCENARIO_MAIN", GetFlagID_("CONST_SM_CEMETERY"));			// ���C���t���O
					SetNumFlg_("NUM_SCENARIO_SUB_CITY", 0);		// �����s�s�t���O(29 -> 0�ɖ߂�)
					SetNumFlg_("NUM_SCENARIO_SUB_GRAVE", 0);	// ���y�̗쓹�t���O
					DebugPrint("NUM_SCENARIO_MAIN �̒l�� " + main_num + " �ɂȂ�܂����B");
					// ���y�̗쓹��
					SetReturnDemoMap_("G00_00");
					SetReturnDemoPosDir_(Vec3(-1261.0, 130.000, 1602.0), 100);
					// Demo131[�]�����u�g�p(���y�̗쓹��)]
					ChangeDemo_(131);
				}
				else{
					OpenMsgWnd_();
					ShowMsg_("MINE_07_MSG_02");
					KeyInputWait_();
					if(GetQueryResult_() == QUERY_YES){
						CloseMsgWnd_();
						// ���C�h��Ԃő嗤�ړ������ꍇ�A���C�h����������t���O
						SetEventFlg_("BFG_RIDE_OFF_USED_TRANSFER", true);
						DeleteEventMine_(g_mine_07);
						// ���y�̗쓹��
						ChangeMapPosDir_("G00_00", Vec3(-1261.0, 154.000, 1602.0), 100);
					}
					else{
						CloseMsgWnd_();
					}
				}
			}
			else{
				CommonMessageT("MINE_07_MSG_01", "NAME_NONE");
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
	// �n�V�S�����
	case g_mine_02:
		if(main_num == GetFlagID_("CONST_SM_CITY")){
			if(city_num == GetFlagID_("CONST_SS_CI_CLIMB_THE_LADDER")){
				// �A�T�[�g����������̂ŕK���n�����폜
				DeleteEventMine_(g_mine_02);
				// �T�u�t���O��ύX
				SetNumFlg_("NUM_SCENARIO_SUB_CITY",  GetFlagID_("CONST_SS_CI_NOT_ENTER_THE_BUILDING"));
				// �S�ŕ��A�}�b�v�w��Num�t���O
				SetNumFlg_("NUM_DEAD_RETURN_MAP", GetFlagID_("CONST_DEAD_RETURN_MAP_A00_00"));
				// �f����̎�l���̈ʒu���C���i���j
				SetReturnDemoPosDir_(Vec3(23.616, 289.621, 2133.921), -85);
				// Demo101[�ړI�n�̓o�g���f�o�{���r��]���Đ�
				ChangeDemo_(101);
			}
		}
		break;
	// �V���b�^�[�O�̃L���O�B�ɋ߂Â�
	case g_mine_03:
		if(main_num == GetFlagID_("CONST_SM_CITY")){
			if(city_num == GetFlagID_("CONST_SS_CI_NOT_ENTER_THE_BUILDING")){
				// �A�T�[�g����������̂ŕK���n�����폜
				DeleteEventMine_(g_mine_03);
				// �T�u�t���O��ύX
				SetNumFlg_("NUM_SCENARIO_SUB_CITY",  GetFlagID_("CONST_SS_CI_EVENING_CITY"));
				// �f����̎�l���̈ʒu
				SetReturnDemoPosDir_(Vec3(-0.024, -1.318, 851.988), 180);
				// Demo102[�o�g���f�o�{���r���ɓ���Ȃ��m�`���[������]���Đ�
				ChangeDemo_(102);
			}
		}
		break;
	// ���d�{�݂ɋ߂Â�
	case g_mine_04:
		// �A�T�[�g����������̂ŕK���n�����폜
		DeleteEventMine_(g_mine_04);
		// �T�u�t���O��ύX
		SetNumFlg_("NUM_SCENARIO_SUB_CITY",  GetFlagID_("CONST_SS_CI_GO_POWER_PLANT"));
		// �Z���^�[�r���O�̔����J������z�u�����X�^�[�����ւ���p�t���O
		SetEventFlg_("BFG_LIMIT_DEMO_EVENING_CITY", true);
		// �f����̎�l���̈ʒu���C��
		SetReturnDemoPosDir_(Vec3(1574.280, -271.030, -904.503), 120);
		// Demo124[��������]���Đ�
		ChangeDemo_(124);
		break;
	// �����O�̃L���O�B�ɋ߂Â�
	case g_mine_05:
		if(main_num == GetFlagID_("CONST_SM_CITY")){
			if(city_num == GetFlagID_("CONST_SS_CI_GO_BACK_KING")){
				// �A�T�[�g����������̂ŕK���n�����폜
				DeleteEventMine_(g_mine_05);
				// �T�u�t���O��ύX
				SetNumFlg_("NUM_SCENARIO_SUB_CITY",  GetFlagID_("CONST_SS_CI_ESTABLISH_KINGDOM"));
				// �ږ��J�n�t���O��false�ɂ���
				SetEventFlg_("BFG_START_IMMIGRATION", false);
				// �ږ������t���O��true�ɂ���
				SetEventFlg_("BFG_FINISHED_IMMIGRATION", true);
				// �f����̎�l���̈ʒu���C��
				SetReturnDemoPosDir_(Vec3(0.000, 66.357, 256.822), 180);
				// Demo108[�m�`���[���L���O�_���̐���]
				ChangeDemo_(108);
			}
		}
		break;
	// �Z���^�[�r���ɒn���ǉ�(�ی�)
	case g_mine_06:
		if(check_restoration == false){
			local set_dir = 180;
			CommPlayerTurnAroundDir(set_dir);
			CommonMessageT("NOT_USE_MESSAGE_BILL_ENTRANCE", "NAME_NONE");
		}
		break;
	// �����̍ŏ��̔��ɊJ���Ȃ��Ƃ������b�Z�[�W��\��������
	case mine_wall00:
		if(check_restoration == false){
			CommPlayerTurnAroundObj(wall_00);
			CommonMessageT("NOT_USE_MESSAGE_BILL_ENTRANCE", "NAME_NONE");
		}
		break;
	case mine_wall_01:
		if(check_restoration == false){
			CommPlayerTurnAroundObj(wall_01);
			CommonMessageT("NOT_USE_MESSAGE_BILL_ENTRANCE", "NAME_NONE");
		}
		break;
	case mine_wall_02:
		if(check_restoration == false){
			CommPlayerTurnAroundObj(wall_02);
			CommonMessageT("NOT_USE_MESSAGE_BILL_ENTRANCE", "NAME_NONE");
		}
		break;
	case mine_wall_03:
		if(check_restoration == false){
			CommPlayerTurnAroundObj(wall_03);
			CommonMessageT("NOT_USE_MESSAGE_BILL_ENTRANCE", "NAME_NONE");
		}
		break;
	case mine_wall_04:
		if(check_restoration == false){
			CommPlayerTurnAroundObj(wall_04);
			CommonMessageT("NOT_USE_MESSAGE_BILL_ENTRANCE", "NAME_NONE");
		}
		break;
	// �Z���^�[�r���̃V���b�^�[�O�̃��[���|�C���g
	case mine_ruler_01:
		// ���[���|�C���g�̋��ʏ���
		CommPlayerTurnAroundObj(rulerpoint01);
		CommRulerPointEvent(rulerpoint01, "BFG_RULER_ADD_002", "g_rulerpoint01");
		break;
	// ���d�{�݂̑O�̃��[���|�C���g
	case mine_ruler_02:
		// ���[���|�C���g�̋��ʏ���
		CommPlayerTurnAroundObj(rulerpoint02);
		CommRulerPointEvent(rulerpoint02, "BFG_RULER_ADD_005", "g_rulerpoint02");
		break;
	// �k���Q�[�g�O�̃��[���|�C���g
	case mine_ruler_03:
		// ���[���|�C���g�̋��ʏ���
		CommPlayerTurnAroundObj(rulerpoint03);
		CommRulerPointEvent(rulerpoint03, "BFG_RULER_ADD_030", "g_rulerpoint03");
		break;
	// �܂񂽂�Δ�t�߂̒n��(���C�h������[���f���Đ� 2��DB #3442)
	case mine_full:
		CommPlayerTurnAroundObj(g_full_stele); // �Δ�̕�����������
		SetEventFlg_("BFG_RIDE_OFF_FLAG_BEFORE_STELE", true);
		ChangeMapPosDir_("A00_00", Vec3(-1522.246, 13.681, -795.441), -126);
		break;
	// �Q�[�g�O(���[���|�C���g�i���֎~)
	case mine_stele00:
		StopTalkAcc(0);
		break;
	case mine_stele01:
		StopTalkAcc(1);
		break;
	case mine_stele07:
	case mine_stele08:
		StopTalkAcc(2);
		break;
	case mine_stele09:
		StopTalkAcc(3);
		break;
	// �܂񂽂�擾�f���J�n
	case mine_stele02:
		// �����p�n�����̐ݒu
		mine_stele03 = SetPointBoxEventMine_("09_Mine", false);
		mine_stele04 = SetPointBoxEventMine_("10_Mine", false);
		mine_stele05 = SetPointBoxEventMine_("11_Mine", false);
		mine_stele06 = SetPointBoxEventMine_("12_Mine", false);
		mine_stele10 = SetPointBoxEventMine_("11_Mine02", false);
		// (���Y�^)������DeleteEventMine_(mine_stele02)���O�ɒn�����̐ݒu����
		DeleteEventMine_(mine_stele02);
		SetNumFlg_("NUM_FLG_GO_POWER_PLANT_STATE", 1);			// ���d�{�݂ɍs���܂ł̐i�s�t���O��i�߂�
		// ���[�����֎~����t���O��ݒ�
		SetEventFlg_("BFG_PLAYERABILITY_RULER_PROHIBIT", true);
		// �܂񂽂�擾�f���Đ�
		uFullTankDemo();
		break;
	// �Δ�𒲂ׂ�܂ŕ�������n��
	case mine_stele03:
		uStopTalkRec(3);
		break;
	case mine_stele04:
		uStopTalkRec(4);
		break;
	case mine_stele05:
		uStopTalkRec(5);
		break;
	case mine_stele06:
		uStopTalkRec(6);
		break;
	case mine_stele10:
		uStopTalkRec(5);
		break;
	// �n�V�S
	case g_mine_ladder:
		// �͂����̏�������t���O�𗧂Ă�
		SetEventFlg_("BFG_CHECK_USED_FIRST_TIME_LADDER", true);
		DeleteEventMine_(g_mine_ladder);
		g_mine_ladder <- C_NONE_ID;
		uLadderMsg();
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
		DebugPrint("�Ή�����C�x���g�n���͂���܂���");
		break;
	}
	
	
	EventEnd_();
}

//======================================================
// ����֐��F�n���ŃA�N�Z�T���[���Ɏ~�߂��鏈��
//------------------------------------------------------
// ����    �F0 -> mine_stele00, 1 -> mine_stele01, 2 -> mine_stele07,mine_stele08, 3 -> mine_stele09
// �߂�l  �F�Ȃ�
//======================================================
function StopTalkAcc(num)
{
	local player = GetPlayerId_();
	local playerPos = GetPos_(player);
	local npc = g_npc9;
	
	local PLAYER_BACK_POS = Vec3(-1591.824, 15.000, -522.503);
	local ROT_DIR = 6;
	local MOTION_BLEND_FRAME = 4;
	local PLAYER_BACK_DIR;
	if(num == 0){
		PLAYER_BACK_DIR =  -30;
	}
	else if(num == 1){
		PLAYER_BACK_DIR =   60;
	}
	else if(num == 2){
		PLAYER_BACK_DIR =  140;
	}
	else{
		PLAYER_BACK_DIR =  60;
	}
	
	// �����G�t�F�N�g���A�N�Z�T���[���ɕ\��
	SetBoneEffect_("ef300_20_target_icon", npc);
	PlaySE_("SE_DEM_053");		// �u�s���b�I�v
	Wait_(15);
	// �A�N�Z�T���[�����v���C���[�̕��Ɍ�������< ���Y�^ : Task_RotateToPos_()������,WaitTask()���Ȃ��Ɖ�]���Ȃ��̂Œ��� >
	SetMotion_(npc, "WALK", MOTION_BLEND_FRAME);
	local rotateTask = Task_RotateToPos_(npc, playerPos, ROT_DIR);
	WaitTask(rotateTask);
	SetMotion_(npc, "WAIT", MOTION_BLEND_FRAME);
	// �A�N�Z�T���[���̃��b�Z�[�W�\��
	OpenMsgWnd_();
	SetTalkName_("NAME_NONE");
	ShowMsg_("DEMO_101_AFT_ACC");
	KeyInputWait_();
	CloseMsgWnd_();
	// �A�N�Z�T���[�������ʂɌ�������
	SetMotion_(npc, "WALK", MOTION_BLEND_FRAME);
	// �A�N�Z�T���[������������������W
	local frondPos = Vec3(-1650.000, 18.000, -415.000);
	local rotateFrontTask = Task_RotateToPos_(npc, frondPos, ROT_DIR);
	// �A�N�Z�T���[����ҋ@���[�V�����ɖ߂�
	WaitTask(rotateFrontTask);
	SetMotion_(npc, "WAIT", MOTION_BLEND_FRAME);
	// �v���C���[�o�b�N���Ĉړ�
	CommPlayerTurnMoveDirWalk(PLAYER_BACK_DIR);
}

//======================================================
// ����֐��F�[���f��(���A�N�^�[����)
//------------------------------------------------------
// ����    �F�Ȃ�
// �߂�l  �F�Ȃ�
//======================================================
function uFullTankDemo()
{
	local player = GetPlayerId_();
	local g_stele_pos = Vec3(-1529.718, 14.149, -788.056);
	
	// ���A�N�^�[���������������̋��ʏ���
	CommReactorActionDiscover();
	// ���Z�Δ�ɋ߂Â������̃��b�Z�[�W�\��
	CommApproachStatueMsg(ABILITY_FULLTANK);
	// ���[�V������ҋ@��Ԃɖ߂����ʏ���
	CommResetPlayerMotion();
	
	// �Δ�̕�������
	if(!IsPlayerRide_()){
		SetMotion_(player, MOT_WALK, BLEND_M);
	}
	local rotateTask = Task_RotateToPos_(player, g_stele_pos, ROTATE_EVENT_DEF);
	WaitTask(rotateTask);
	
	// �Ԃ���������
	Wait_(15);
	SetMotion_(player, MOT_WAIT, BLEND_M);
	Wait_(5);
}

//======================================================
// ����֐��F�[���f��(�[���ɂȂ�)���i�s�x�����uCONST_SS_CI_EVENING_CITY�v�̂Ƃ��̂�
//------------------------------------------------------
// ����    �F�Ȃ�
// �߂�l  �F�Ȃ�
//======================================================
function uEveningDemo()
{
	// 60F�ŗ[���ɂ���
	local f = 0;
	for(f = 0; f <= 60; ++f){
		SetTime_(f * 90);
		Wait_(1);
	}
	// �G�[�X����̒ʐM�ƃ��b�Z�[�W
	OpenConnective("connective_ace");
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_ACE");
	ShowMsg_("ACE_SPECIAL_MSG");
	KeyInputWait_();
	CloseMsgWnd_();
	CloseConnective();
}

//======================================================
// ����֐��F�n���Ń��A�N�^�[�Ɏ~�߂��鏈��
//------------------------------------------------------
// ����    �F3 -> mine_stele03, 4 -> mine_stele04, 5 -> mine_stele05
// �߂�l  �F�Ȃ�
//======================================================
function uStopTalkRec(num)
{
	local player = GetPlayerId_();
	local PLAYER_BACK_POS = Vec3(-1516.202, 13.457, -789.543);
	local MOTION_BLEND_FRAME = 4;
	local PLAYER_BACK_DIR = 0;
	if(num == 3){
		PLAYER_BACK_DIR =  148;
	}else if(num == 4){
		PLAYER_BACK_DIR = -135;
	}else if(num == 5){
		PLAYER_BACK_DIR =  -30;
	}else{
		PLAYER_BACK_DIR =   60;
	}
	
	// ���A�N�^�[����̂��m�点
	CommReactorActionNotice();
	// ���Z�Δ�ɋ߂Â������̃��b�Z�[�W�\��
	CommApproachStatueMsg(ABILITY_FULLTANK);
	// ���A�N�^�[���������������A�Ō�Ƀv���C���[�̃��[�V������ҋ@��Ԃɖ߂�
	CommResetPlayerMotion();
	// �����Ԃ���������
	Wait_(15);
	// �v���C���[�o�b�N���Ĉړ�< 2��DB#5981 ��������w���ŕ��������𒷂����� >
	CommPlayerTurnMoveDirWalk(PLAYER_BACK_DIR, 60);
}

//=====================================================
// ����֐��F�n�V�S�n���̏���
//-----------------------------------------------------
// ����    �F�Ȃ�
// �߂�l  �F�Ȃ�
//=====================================================
function uLadderMsg()
{
	// ���A�N�^�[�������𔭌������������s��
	CommReactorActionDiscover();

	// ���A�N�^�[�̃��b�Z�[�W�\��
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_REACTOR");
	ShowMsg_("MINE_LADDER_MSG");
	KeyInputWait_();
	CloseMsgWnd_();

	// �v���C���[���[�V���������ɖ߂�(���C�h���͖�������)
	CommResetPlayerMotion();
}

//--------------------------
//  ���b�Z�[�W�̕\���֐�(���O�\������)
//--------------------------
function CommonMessageT(message_key, name_tag){
	OpenMsgWnd_();
	SetTalkName_(name_tag);
	ShowMsg_(message_key);
	KeyInputWait_();
	CloseMsgWnd_();
}

//-------------------------------------------------------
// �L���O�̘b�����e
//-------------------------------------------------------
function ContentKing(main_num, city_num)
{
	if(main_num = 2){
		switch(city_num)
		{
		case GetFlagID_("CONST_SS_CI_EVENING_CITY"):
		case GetFlagID_("CONST_SS_CI_GO_POWER_PLANT"):
		case GetFlagID_("CONST_SS_CI_START_UP_POWER_PLANT"):
		case GetFlagID_("CONST_SS_CI_RESTORATION_POWER_PLANT"):
			CommonMessageT("DEMO_102_AFT_KNG", "NAME_TAG_KING");
			break;
		}
	}
}

//-------------------------------------------------------
// �W���b�N�̘b�����e
//-------------------------------------------------------
function ContentJack(main_num, city_num)
{
	if(main_num = 2){
		switch(city_num)
		{
		case GetFlagID_("CONST_SS_CI_EVENING_CITY"):
		case GetFlagID_("CONST_SS_CI_GO_POWER_PLANT"):
		case GetFlagID_("CONST_SS_CI_START_UP_POWER_PLANT"):
		case GetFlagID_("CONST_SS_CI_RESTORATION_POWER_PLANT"):
			CommonMessageT("DEMO_102_AFT_JAC", "NAME_TAG_JACK");
			break;
		}
	}
}

//-------------------------------------------------------
// �G�[�X�̘b�����e
//-------------------------------------------------------
function ContentAce(main_num, city_num)
{
	if(main_num = 2){
		switch(city_num)
		{
		case GetFlagID_("CONST_SS_CI_EVENING_CITY"):
		case GetFlagID_("CONST_SS_CI_GO_POWER_PLANT"):
		case GetFlagID_("CONST_SS_CI_START_UP_POWER_PLANT"):
		case GetFlagID_("CONST_SS_CI_RESTORATION_POWER_PLANT"):
			CommonMessageT("DEMO_102_AFT_ACE", "NAME_TAG_ACE");
			break;
		}
	}
}

//-------------------------------------------------------
// �N�C�[���̘b�����e
//-------------------------------------------------------
function ContentQueen(main_num, city_num)
{
	if(main_num = 2){
		switch(city_num)
		{
		case GetFlagID_("CONST_SS_CI_EVENING_CITY"):
		case GetFlagID_("CONST_SS_CI_GO_POWER_PLANT"):
		case GetFlagID_("CONST_SS_CI_START_UP_POWER_PLANT"):
		case GetFlagID_("CONST_SS_CI_RESTORATION_POWER_PLANT"):
			CommonMessageT("DEMO_102_AFT_QEN", "NAME_TAG_QUEEN");
			break;
		}
	}
}

//-------------------------------------------------------
// NPC_A�̘b�����e
//-------------------------------------------------------
function ContentNPC_A(main_num, city_num)
{
	if(main_num = 2){
		switch(city_num)
		{
		case GetFlagID_("CONST_SS_CI_CLIMB_THE_LADDER"):
		case GetFlagID_("CONST_SS_CI_NOT_ENTER_THE_BUILDING"):
			CommonMessageT("DEMO_100_AFT_NPC_A", "NAME_TAG_NOCHORIN");
			break;
		case GetFlagID_("CONST_SS_CI_EVENING_CITY"):
		case GetFlagID_("CONST_SS_CI_GO_POWER_PLANT"):
		case GetFlagID_("CONST_SS_CI_START_UP_POWER_PLANT"):
		case GetFlagID_("CONST_SS_CI_RESTORATION_POWER_PLANT"):
			CommonMessageT("DEMO_101_AFT_NPC_A", "NAME_TAG_NOCHORIN");
			break;
		}
	}
}

//-------------------------------------------------------
// NPC_B�̘b�����e
//-------------------------------------------------------
function ContentNPC_B(main_num, city_num)
{
	if(main_num = 2){
		switch(city_num)
		{
		case GetFlagID_("CONST_SS_CI_NOT_ENTER_THE_BUILDING"):
		case GetFlagID_("CONST_SS_CI_EVENING_CITY"):
		case GetFlagID_("CONST_SS_CI_GO_POWER_PLANT"):
		case GetFlagID_("CONST_SS_CI_START_UP_POWER_PLANT"):
		case GetFlagID_("CONST_SS_CI_RESTORATION_POWER_PLANT"):
			CommonMessageT("DEMO_101_AFT_NPC_B_1", "NAME_NONE");
			break;
		}
	}
}

//-------------------------------------------------------
// ����̘b�����e
//-------------------------------------------------------
function ContentIMP(main_num, city_num)
{
	if(main_num = 2){
		switch(city_num)
		{
		case GetFlagID_("CONST_SS_CI_NOT_ENTER_THE_BUILDING"):
		case GetFlagID_("CONST_SS_CI_EVENING_CITY"):
		case GetFlagID_("CONST_SS_CI_GO_POWER_PLANT"):
		case GetFlagID_("CONST_SS_CI_START_UP_POWER_PLANT"):
		case GetFlagID_("CONST_SS_CI_RESTORATION_POWER_PLANT"):
			CommonMessageT("DEMO_101_AFT_IMP_2", "NAME_NONE");
			break;
		}
	}
}

//-------------------------------------------------------
// ��s�̘b�����e
//-------------------------------------------------------
function ContentBNK(main_num, city_num)
{
	if(main_num = 2){
		switch(city_num)
		{
		case GetFlagID_("CONST_SS_CI_CLIMB_THE_LADDER"):
		case GetFlagID_("CONST_SS_CI_NOT_ENTER_THE_BUILDING"):
			CommonMessageT("DEMO_100_AFT_NPC_NOCHORIN", "NAME_NONE");
			break;
		case GetFlagID_("CONST_SS_CI_EVENING_CITY"):
		case GetFlagID_("CONST_SS_CI_GO_POWER_PLANT"):
		case GetFlagID_("CONST_SS_CI_START_UP_POWER_PLANT"):
		case GetFlagID_("CONST_SS_CI_RESTORATION_POWER_PLANT"):
			CommonMessageT("DEMO_101_AFT_BNK", "NAME_NONE");
			break;
		}
	}
}

//-------------------------------------------------------
// �{���̘b�����e
//-------------------------------------------------------
function ContentBOK(main_num, city_num)
{
	if(main_num = 2){
		switch(city_num)
		{
		case GetFlagID_("CONST_SS_CI_NOT_ENTER_THE_BUILDING"):
			CommonMessageT("DEMO_102_AFT_NPC_A", "NAME_NONE");
			break;
		case GetFlagID_("CONST_SS_CI_EVENING_CITY"):
		case GetFlagID_("CONST_SS_CI_GO_POWER_PLANT"):
		case GetFlagID_("CONST_SS_CI_START_UP_POWER_PLANT"):
		case GetFlagID_("CONST_SS_CI_RESTORATION_POWER_PLANT"):
			CommonMessageT("DEMO_102_AFT_NPC_A_02", "NAME_NONE");
			break;
		}
	}
}

//-------------------------------------------------------
// �����̘b�����e
//-------------------------------------------------------
function ContentBUT(main_num, city_num)
{
	if(main_num = 2){
		switch(city_num)
		{
		case GetFlagID_("CONST_SS_CI_NOT_ENTER_THE_BUILDING"):
		case GetFlagID_("CONST_SS_CI_EVENING_CITY"):
		case GetFlagID_("CONST_SS_CI_GO_POWER_PLANT"):
		case GetFlagID_("CONST_SS_CI_START_UP_POWER_PLANT"):
		case GetFlagID_("CONST_SS_CI_RESTORATION_POWER_PLANT"):
			CommonMessageT("DEMO_101_AFT_BUT", "NAME_NONE");
			break;
		}
	}
}

//-------------------------------------------------------
// ���A�N�^�[���̘b�����e
//-------------------------------------------------------
function ContentREC(main_num, city_num)
{
	if(main_num = 2){
		switch(city_num)
		{
		case GetFlagID_("CONST_SS_CI_NOT_ENTER_THE_BUILDING"):
		case GetFlagID_("CONST_SS_CI_EVENING_CITY"):
		case GetFlagID_("CONST_SS_CI_GO_POWER_PLANT"):
		case GetFlagID_("CONST_SS_CI_START_UP_POWER_PLANT"):
		case GetFlagID_("CONST_SS_CI_RESTORATION_POWER_PLANT"):
			CommonMessageT("DEMO_101_AFT_REC", "NAME_NONE");
			break;
		}
	}
}

//-------------------------------------------------------
// �A�N�Z�T���[���̘b�����e
//-------------------------------------------------------
function ContentACC(main_num, city_num)
{
	if(main_num = 2){
		switch(city_num)
		{
		case GetFlagID_("CONST_SS_CI_NOT_ENTER_THE_BUILDING"):
			CommonMessageT("DEMO_101_AFT_ACC", "NAME_NONE");
			break;
		case GetFlagID_("CONST_SS_CI_EVENING_CITY"):
		case GetFlagID_("CONST_SS_CI_GO_POWER_PLANT"):
		case GetFlagID_("CONST_SS_CI_START_UP_POWER_PLANT"):
		case GetFlagID_("CONST_SS_CI_RESTORATION_POWER_PLANT"):
			local sub_num = GetNumFlg_("NUM_FLG_GO_POWER_PLANT_STATE");
			// �܂񂽂񖢎擾���
			if(sub_num == 0 || sub_num == 1){
				CommonMessageT("DEMO_102_AFT_NPC_ACC_00", "NAME_NONE");
			}
			// �܂񂽂�擾���
			else{
				CommonMessageT("DEMO_102_AFT_NPC_ACC", "NAME_NONE");
			}
			break;
		}
	}
}

//======================================================
// ����֐��F�S�ŕ��A�̋[���f��1[�����s�s�����`�o���P�[�h�ɓ�������܂�]
//------------------------------------------------------
// �������F�Ȃ�
// �߂�l  �F�Ȃ�
//======================================================
function uDeadReturnDemo1()
{
// �Ó]
	CommChangeMomentFadeOut(FADE_COLOR_BLACK);
// ����
	// BGM�Ή�( 2��DB #5189 )
	local main_num   = GetNumFlg_("NUM_SCENARIO_MAIN");
	local city_num   = GetNumFlg_("NUM_SCENARIO_SUB_CITY");
	if(main_num == GetFlagID_("CONST_SM_CITY")){
		if(city_num == GetFlagID_("CONST_SS_CI_CLIMB_THE_LADDER")){
			SetEventFlg_("BFG_A00_00_ENVIRONMENT_BGM_PLAY", true);
		}
	}
	// ��l���̈ʒu
	local player_pos = Vec3(-21.816, -20.000, 3241.817);
	local player_dir = -133;
	// �[���f����̕��A�ʒu
	local player_rtn_pos = Vec3(-21.816, -20.000, 3241.817);
	local player_rtn_dir = 170;
	// �E�F�C�g
	local wait_speed     = 15;
	local wait_speed_def = 30;
	// �v���C���[ID
	local player = GetPlayerId_();
	// �J�����̊p�x
	local cam_dir = -105;
	local cam_rtn_dir = 180;
	// ��`�������l���Z�b�g
	SetPos_(player, player_pos);
	SetDir_(player, player_dir);
	SetCameraDir_(cam_dir);
	SetDirToPlayer_(g_npc1);
	Wait_(wait_speed);
	// �m�`������(�ҋ@���[�V��������b���[�V����)
	SetMotion_(g_npc1, "TALKLOOP", BLEND_N);
// �Ó]����
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	Wait_(FADE_DEF);
	// ���b�Z�[�W�\��
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_NOCHORIN");
	ShowMsg_("DEAD_RETURN_MSG_01");
	KeyInputWait_();
	CloseMsgWnd_();
	// �m�`������(��b���[�V�������ҋ@���[�V����)
	SetMotion_(g_npc1, "WAIT", BLEND_L);
	Wait_(wait_speed_def);
	// �񕜏����{���ʃ��b�Z�[�W�\��
	RecoveryAndMsg();
	Wait_(wait_speed);
// �Ó]
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, wait_speed);
	SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, wait_speed);
	Wait_(20);
	WaitFade_();
// �}�b�v�`�F���W
	ChangeMapPosDir_("A00_00", player_rtn_pos, player_rtn_dir);
}

//======================================================
// ����֐��F�S�ŕ��A�̋[���f��2[�o���P�[�h�ɓ�����`���d�{�݃N���A]
//------------------------------------------------------
// �������F�Ȃ�
// �߂�l  �F�Ȃ�
//======================================================
function uDeadReturnDemo2()
{
// �Ó]
	CommChangeMomentFadeOut(FADE_COLOR_BLACK);
// ����
	// ��l���̈ʒu
	local player_pos = Vec3(3.997, 20.000, 809.251);
	local player_dir = -124;
	// �[���f����̕��A�ʒu
	local player_rtn_pos = Vec3(3.997, 20.000, 809.251);
	local player_rtn_dir = -124;
	// �E�F�C�g
	local wait_speed     = 15;
	local wait_speed_def = 30;
	// �v���C���[ID
	local player = GetPlayerId_();
	// �J�����̊p�x
	local cam_dir = -130;
	local cam_rtn_dir = -90;
	// ��`�������l���Z�b�g
	SetPos_(player, player_pos);
	SetDir_(player, player_dir);
	SetCameraDir_(cam_dir);
	Wait_(wait_speed);
	// �L���O(�ҋ@���[�V��������b���[�V����)
	SetMotion_(g_king, "TALKLOOP", BLEND_N);
// �Ó]����
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	Wait_(FADE_DEF);
	// ���b�Z�[�W�\��
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEAD_RETURN_MSG_02");
	KeyInputWait_();
	CloseMsgWnd_();
	// �L���O(��b���[�V�������ҋ@���[�V����)
	SetMotion_(g_king, "WAIT", BLEND_L);
	Wait_(wait_speed_def);
	// �񕜏����{���ʃ��b�Z�[�W�\��
	RecoveryAndMsg();
	Wait_(wait_speed);
	// ���b�Z�[�W�\��
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_KING");
	ShowMsg_("DEAD_RETURN_MSG_02_2");
	KeyInputWait_();
	CloseMsgWnd_();
// �Ó]
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, wait_speed);
	SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, wait_speed);
	Wait_(20);
	WaitFade_();
// �}�b�v�`�F���W
	ChangeMapPosDir_("A00_00", player_rtn_pos, player_rtn_dir);
}

//======================================================
// ����֐��F�S�ŕ��A�̋[���f��3[���d�{�݃N���A�`�ږ�����]
//------------------------------------------------------
// �������F�Ȃ�
// �߂�l  �F�Ȃ�
//======================================================
function uDeadReturnDemo3()
{
// �Ó]
	CommChangeMomentFadeOut(FADE_COLOR_BLACK);
// ����
	// ��l���̈ʒu
	local player_pos = Vec3(0.000, 20.000, 510.000);
	local player_dir = 125;
	// �[���f����̕��A�ʒu
	local player_rtn_pos = Vec3(0.000, 20.000, 510.000);
	local player_rtn_dir = 180;
	// �E�F�C�g
	local wait_speed     = 15;
	local wait_speed_def = 30;
	// �v���C���[ID
	local player = GetPlayerId_();
	// �J�����̊p�x
	local cam_dir = 180;
	local cam_rtn_dir = 180;
	// ��`�������l���Z�b�g
	SetPos_(player, player_pos);
	SetDir_(player, player_dir);
	SetCameraDir_(cam_dir);
	SetDirToPlayer_(dead_npc);
	Wait_(wait_speed);
	// �m�`������(�ҋ@���[�V��������b���[�V����)
	SetMotion_(dead_npc, "TALKLOOP", BLEND_N);
// �Ó]����
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	Wait_(FADE_DEF);
	// ���b�Z�[�W�\��
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_NOCHORIN");
	ShowMsg_("DEAD_RETURN_MSG_03");
	KeyInputWait_();
	CloseMsgWnd_();
	// �m�`������(��b���[�V�������ҋ@���[�V����)
	SetMotion_(dead_npc, "WAIT", BLEND_L);
	Wait_(wait_speed_def);
	// �񕜏����{���ʃ��b�Z�[�W�\��
	RecoveryAndMsg();
	Wait_(wait_speed);
// �Ó]
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, wait_speed);
	SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, wait_speed);
	Wait_(20);
	WaitFade_();
// �}�b�v�`�F���W
	ChangeMapPosDir_("A00_00", player_rtn_pos, player_rtn_dir);
}

//======================================================
// ����֐��F���Z�擾�f��
//------------------------------------------------------
// �������F�Ȃ�
// �߂�l  �F�Ȃ�
//======================================================
function uPlayableDemoStele()
{
	// �t���O�擾
	local main_num   = GetNumFlg_("NUM_SCENARIO_MAIN");
	local city_num   = GetNumFlg_("NUM_SCENARIO_SUB_CITY");
	
	// �v���C���[ID
	local player = GetPlayerId_();
	
	DeleteEventMine_(mine_full);							//�Δ�p�n���폜
	DeleteEventMine_(mine_stele03);							//�����p�n��1�폜
	DeleteEventMine_(mine_stele04);							//�����p�n��2�폜
	DeleteEventMine_(mine_stele05);							//�����p�n��3�폜
	DeleteEventMine_(mine_stele06);							//�����p�n��4�폜
	DeleteEventMine_(mine_stele10);
	
	//��l���̈ʒu��Δ�̑O�ɒu��
	SetPos_(player, Vec3(-1522.246, 13.681, -795.441));
	SetDir_(player, -126);
	//�J������ݒu
	SetPointCameraEye_("cameye_002");
	SetPointCameraTarget_("camtgt_002");
	Wait_(10);
	
	//�X�L���擾���ʏ���
	SkillStelePerformance(g_full_stele, ABILITY_FULLTANK);	//�X�L���擾���ʏ���
	
	SetEventFlg_("BFG_EXAMINE_FULLTANK_STELE", true);		// �܂񂽂�̐Δ�𒲂ׂ�
// ���Y�^( �S���̍��ڂ��u�܂񂽂�v����u�����X�^�[���Z�v�ɕύX�̈� )
//		SetEventFlg_("BFG_TRAVEL_INFO_SHOW_020", true);			// ���̐S���̍��ډ���t���O	�y���j���[�z�܂񂽂�
	SetEventFlg_("BFG_PLAYERABILITY_RULER_PROHIBIT", false);// ���[���֎~������
	SetEventFlg_("BFG_LIMIT_FULLTANK_STELE", true);			// �܂񂽂�擾��Ɏ��ӂɔz�u���郂���X�^�[������
	SetNumFlg_("NUM_FLG_GO_POWER_PLANT_STATE", 2);			// ���d�{�݂ɍs���܂ł̐i�s�t���O��i�߂�
	// �Δ�A�C�R���������Ȃ�����
	SetNaviMapIconVisible_(icon_stone, false);
	// �v���C���[���Z�̉���
	AddPlayerAbility_(PLAYERABILITYID.MANTAN);
	SetNaviMapIconVisible_(g_map_navi06, false);	// �Δ�(�܂񂽂�)
	SetNaviMapIconVisible_(g_map_navi03, true);		// ���d�{��
	
	//�t�F�[�h�C��
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
	
	if(main_num == GetFlagID_("CONST_SM_CITY")					// Num0 = 2
	&& city_num == GetFlagID_("CONST_SS_CI_EVENING_CITY")){		// Num3 = 3
		// �[���ɂ���
		uEveningDemo();
	}
}
