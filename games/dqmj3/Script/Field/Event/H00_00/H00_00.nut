//===================== �嗤�y�Î�̑����z ====================
//---------------------------------
// ����Ԃ̗V�тŎg�p����萔
//---------------------------------
// �M�~�b�N�̋N���ƃN���A�t���O
const GIMMICK_FLG			 = "BFG_SPACE_GIMMICK_GREEN";
const GIMMICK_CLEAR_FLG		 = "BFG_SPACE_GIMMICK_GREEN_1ST_CLEAR";

// ��l���̕��A�ʒu�ƌ���
const XPOS_1				 = 1999.844;	// ��ՃX�C�b�`�t��
const YPOS_1				 = 1300.000;
const ZPOS_1				 = -260.862;
const DIR_1					 = -70;

const XPOS_2				 = -1870.0;		// �S�[���{�X�̎�O
const YPOS_2				 = 1349.0;
const ZPOS_2				 = 648.0;
const DIR_2					 = 150;

// �[���f���Ŏg�p����J�����̃m�[�h��
const CAMERA_EYE			 = "cameye_001";
const CAMERA_TGT			 = "camtgt_001";

// ��ՃX�C�b�`���N��������ׂ̌�ID
const GIMMICK_KEY_ID		 = 901;

// ��ՃX�C�b�`���N�����������̃��b�Z�[�WID
const GIMMICK_MSG_ID		 = "MASTERS_LOAD_REACTOR_MSG_014";

// ��ՃX�C�b�`�N����̍Đ��f���i���o�[
const DEMO_NUM				 = 13;

// �{�X�����X�^�[��ID (1=����, 2=2��ڈȍ~)
const BOSS_ID_1				 = "m175_00";	// ���W�A�N�Z��
const BOSS_ID_2				 = "m175_00";	// ���W�A�N�Z��

// �{�X�����X�^�[��Exchange�pID
const BOSS_EXCHANGE_ID		 = 480;			// ���W�A�N�Z��

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
const BOSS_PARTY_TABLE_1	 = 153;
const BOSS_PARTY_TABLE_2	 = 153;

// �{�X�𒇊Ԃɂ���ۂ̃����X�^�[�p�����[�^ (1=����, 2=2��ڈȍ~)
const BOSS_PARAMETER_1		 = 1801;
const BOSS_PARAMETER_2		 = 1801;

// �{�X���Ԍ�̃}�b�v�`�F���WID
const MAP_ID				 = "H00_00";



//------------------------------------------------
//		�퓬�I����
//------------------------------------------------
function AfterBattle()
{
	// �C�x���g�t���O
	local main_num        = GetNumFlg_("NUM_SCENARIO_MAIN");
	local green_event_num = GetNumFlg_("NUM_SCENARIO_SUB_GREEN");

	// ���΂ꂤ���ǂ�ߊl�`�F�b�N
	local get_abareushidori = GetEventFlg_("BFG_FIRST_TIME_SCOUT_ABAREUSHIDORI");

	if(get_abareushidori == false){
		DebugPrint("���΂ꂤ���ǂ�ߊl�`�F�b�N�J�n");
		if(CheckAllMonsterKind() == true){
			DebugPrint("���̃o�g���ŏ��߂� ���΂ꂤ���ǂ� ��߂܂��܂���");
			SetEventFlg_("BFG_FIRST_TIME_SCOUT_ABAREUSHIDORI", true);
		}
		else{
			DebugPrint("���̃o�g���� ���΂ꂤ���ǂ� �͕߂܂��Ă܂���I");
		}
	}

	// �����Ŕs�k�̔���ƃt���O�ύX���s���B( 16 -> 15 )
	if(main_num == 1){
		if(green_event_num == GetFlagID_("CONST_SS_GR_CHANGE_BOWSHOCK")){
			// �{�[�V���b�N�ɔs�k
			if(GetBattleEndType_() == END_TYPE_LOSE){
				SetNumFlg_("NUM_SCENARIO_SUB_GREEN", GetFlagID_("CONST_SS_GR_REMATCH_BOWSHOCK"));
			}
		}
	}

	//TERGET�A�C�R���̑��d�\���̈ꎞ���
	if(main_num == 1){
		if(green_event_num == GetFlagID_("CONST_SS_GR_INVITE_JUMP_MONSTER")){
			if(get_abareushidori == false){
				if (mapNavi03 != 0) {
					SetNaviMapIconVisible_(mapNavi03, false);
				}
			} else {
				if (mapNavi01 != 0) {
					SetNaviMapIconVisible_(mapNavi01, false);
				}
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
	local main_num   = GetNumFlg_("NUM_SCENARIO_MAIN");							// Num0
	local sky_num	 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");						// Num9
	
	// ���C�h�����܂܈ړ����u���g���ė����烉�C�h��������
	if(GetEventFlg_("BFG_RIDE_OFF_USED_TRANSFER") == true){
		SetRideOffStart_();
	}
	
	// demo652[�\��]�Đ���̃^�C�~���O
	if(main_num == GetFlagID_("CONST_SM_SKY")){
		if(sky_num == GetFlagID_("CONST_SS_SK_DATA_SAVED")){
			//���C�h��������
			SetRideOffStart_();
		}
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
	ORCA_FRONT_POS <- Vec3(-611.01, 191.62, 559.71);	// �I�[�NA�����ʂɌ����Ƃ��̖ڈ���W
	ORCB_FRONT_POS <- Vec3(-544.81, 196.03, 587.13);	// �I�[�NB�����ʂɌ����Ƃ��̖ڈ���W

	// �i�r�}�b�v
	mapNavi01 <- ArrangePointNaviMapIcon_(NAVIMAP_ICON.DESTINATION, "map_navi_01");	// �m�`���[���p�[�N
	mapNavi02 <- ArrangePointNaviMapIcon_(NAVIMAP_ICON.DESTINATION, "map_navi_02");	// �{�[�V���b�N�Z��
	mapNavi03 <- ArrangePointNaviMapIcon_(NAVIMAP_ICON.DESTINATION, "map_navi_03");	// ���΂ꂤ���ǂ�ߊl
	mapNavi04 <- ArrangePointNaviMapIcon_(NAVIMAP_ICON.DESTINATION, "map_navi_04");	// �k�̊R
	mapNavi05 <- ArrangePointNaviMapIcon_(NAVIMAP_ICON.DESTINATION, "map_navi_05");	// �嗤�ړ����u
	mapNavi06 <- ArrangePointNaviMapIcon_(NAVIMAP_ICON.DESTINATION, "map_navi_06");	// ���[���Δ�
	SetNaviMapIconVisible_(mapNavi01, false);
	SetNaviMapIconVisible_(mapNavi02, false);
	SetNaviMapIconVisible_(mapNavi03, false);
	SetNaviMapIconVisible_(mapNavi04, false);
	SetNaviMapIconVisible_(mapNavi05, false);
	SetNaviMapIconVisible_(mapNavi06, false);

	// �}�b�v���B�t���O
	SetEventFlg_("BFG_ARRIVE_AT_H00", true);

	local main_num        = GetNumFlg_("NUM_SCENARIO_MAIN");
	local op_event_num    = GetNumFlg_("NUM_SCENARIO_SUB_OP");
	local green_event_num = GetNumFlg_("NUM_SCENARIO_SUB_GREEN");
	local check_dead = GetEventFlg_("BFG_DEAD_RETURN");
	local check_r_point_rock = GetEventFlg_("BFG_COMPLETE_FOOTHOLD"); // ��M�~�b�N�̃��A�N�^�[�|�C���g�̈ʒu��؂�ւ���ׂ̃t���O
	local inside_num      = GetNumFlg_("NUM_SCENARIO_SUB_INSIDE_CLEAR");

	// �Z�[�u�֎~�̉���(�I�[�v�j���O�`�m�`�������Ƃ̏o��܂ł͒ʂ�Ȃ��悤�ɂ���)
	// �I�[�v�j���O
	if(main_num == GetFlagID_("CONST_SM_OPENING")){
		// �Z�[�u�@�\�͉������Ă��Ȃ��̂ŉ������Ȃ�
	}
	// ����
	else if(main_num == GetFlagID_("CONST_SM_GRASSLAND")){
		if(green_event_num >= GetFlagID_("CONST_SS_GR_ENCOUT_BEFORE")){
			// �R�C�x���g�̂݃Z�[�u�֎~�����������Ȃ�(2��DB #6036)
			if(green_event_num != GetFlagID_("CONST_SS_GR_CLIFF")){
				// �Z�[�u�֎~������(�Z�[�u�֎~�}�b�v����A���Ă������p)
				SetEventFlg_("BFG_SAVE_PROHIBIT", false); // �Z�[�u�֎~(Bit451)
			}
		}
	}
	// �����ȍ~
	else{
		// �Z�[�u�֎~������(�Z�[�u�֎~�}�b�v����A���Ă������p)
		SetEventFlg_("BFG_SAVE_PROHIBIT", false); // �Z�[�u�֎~(Bit451)
	}

	// �E�b�h�p�[�N�̋[���f��[�W���b�N�E�N�C�[������̈˗�]�Đ���ɏ���ʒu�ɂ���t���O��Ԃɂ���
	SetEventFlg_("BFG_RESET_POS_JACK_AND_QUEEN", false);
	SetEventFlg_("BFG_FIXATION_CHARA_WOOD_PARK", false);

	DebugPrint(" ");
	DebugPrint("NUM_SCENARIO_MAIN �̒l�� " + main_num + " �ɂȂ�܂����B");
	DebugPrint("NUM_SCENARIO_SUB_OP �̒l�� " + op_event_num + " �ɂȂ�܂����B");
	DebugPrint("NUM_SCENARIO_SUB_GREEN �̒l�� " + green_event_num + " �ɂȂ�܂����B");
	
	

	//-------------
	// �S�ŕ��A����
	//-------------
	// �S�ŕ��A���̋[���f���ڍs�̏���
	if(check_dead == true){
		if(main_num == GetFlagID_("CONST_SM_GRASSLAND")){
			if(green_event_num == GetFlagID_("CONST_SS_GR_INVITE_MONSTER")){
				// �m�`���������ꎞ�I�ɔz�u
				dead_npc <- C_NONE_ID;
				dead_npc = ReadAndArrangePointNpc("n043", "dead_return_npc_01");
				SetTalkEnable_(dead_npc, false);
				SetEventFlg_("BFG_RETURN_BATTLE_FIRLD_BGM_HEAD", true);	// �^���f����BGM�𓪑ł��ɂ���t���O
			}
			else if(green_event_num == GetFlagID_("CONST_SS_GR_HIDE_AND_SEEK")){
				// �m�`���������ꎞ�I�ɔz�u
				dead_npc <- C_NONE_ID;
				dead_npc = ReadAndArrangePointNpc("n043", "dead_return_npc_01");
				SetTalkEnable_(dead_npc, false);
				SetEventFlg_("BFG_RETURN_BATTLE_FIRLD_BGM_HEAD", true);
			}
			// 
			else if(green_event_num == GetFlagID_("CONST_SS_GR_RETURN_KING")){
				// �m�`���������ꎞ�I�ɔz�u
				dead_npc <- C_NONE_ID;
				dead_npc = ReadAndArrangePointNpc("n043", "dead_return_npc_02");
				SetTalkEnable_(dead_npc, false);
				SetEventFlg_("BFG_RETURN_BATTLE_FIRLD_BGM_HEAD", true);
			}
			else{
				// ��O
			}
		}
	}

	//----------------------------------------------------
	// Demo043[�ӂ����ȐΔ�]�Đ���̃J�����̌������Œ肷��
	//----------------------------------------------------
	// �f���Đ�����̃J�����̌������Œ肷�邽�߂̃t���O
	local check_camera_dir_fix = GetEventFlg_("BFG_CAMERA_DIR_FIX");
	// ���[���Δ�ɐڐG���������`�F�b�N����t���O
	local contact_stele = GetEventFlg_("BFG_CONTACT_RULER_STELE");
	// ���[���Δ�𒲂ׂ������`�F�b�N����t���O
	local examine_stele = GetEventFlg_("BFG_EXAMINE_RULER_STELE");

	// Demo043[�ӂ����ȐΔ�]���Đ���̃J�����̌�����ݒ�
	if(check_camera_dir_fix == true){
		if(contact_stele == true && examine_stele == false){
			SetCameraDir_(-72);
			// �J�����̌�����ύX����t���O���~�낷
			SetEventFlg_("BFG_CAMERA_DIR_FIX", false);
		}
	}

	//---------------
	// ���M�~�b�N�z�u
	//---------------
	// ID������
	switch01 <- C_NONE_ID;
	
	// ���΂�
	local g_brush = ReadGimmick_("o_dem_02");
	local brush_01 = ArrangePointGimmick_("o_dem_02", g_brush, "brush_01");
	
	// ���B(�����V�i���I��)
	if(main_num == GetFlagID_("CONST_SM_GRASSLAND")							// Num0 = 1
	&& green_event_num < GetFlagID_("CONST_SS_GR_CONTROL_DEVICE")){			// Num2 = 13 ���O
		// �N���O
		local g_cage01 = ReadGimmick_("o_H00_02");
		local cage01 = ArrangePointGimmick_("o_H00_02", g_cage01, "cage_01");
	}
	if(green_event_num >= GetFlagID_("CONST_SS_GR_CONTROL_DEVICE")){		// Num2 = 13 �ȏ�
		// �N����
		local g_cage02 = ReadGimmick_("o_H00_03");
		local cage02 = ArrangePointGimmick_("o_H00_03", g_cage02, "cage_02");
	}
	
	// ���B(�����V�i���I�ȍ~)
	if(main_num >= GetFlagID_("CONST_SM_CITY")){							// Num0 = 2 �ȏ�
		// �N����
		local g_cage02 = ReadGimmick_("o_H00_03");
		local cage02 = ArrangePointGimmick_("o_H00_03", g_cage02, "cage_02");
	}
	
	// ����(���Ă͊₾����)
	if(check_r_point_rock == false){
		local g_rock01 = ReadGimmick_("o_H00_04");
		local rock01 = ArrangePointGimmick_("o_H00_04", g_rock01, "rock_01");
	}
	else{
		local g_rock02 = ReadGimmick_("o_H00_05");
		local rock02 = ArrangePointGimmick_("o_H00_05", g_rock02, "rock_02");
	}
	
	// ���X�C�b�`
	local g_switch = ReadGimmick_("o_H00_06");
	switch01 = ArrangePointGimmick_("o_H00_06", g_switch, "switch_01");
	
	// ���ړ����u
	local g_transfer = ReadGimmick_("o_com_01");
	local transfer_device = ArrangePointGimmick_("o_com_01", g_transfer, "transfer");
	
	// �����[���|�C���g
	local g_rulerpoint = ReadGimmick_("o_com_08");
	rulerpoint01 <- ArrangePointGimmick_("o_com_08", g_rulerpoint, "g_rulerpoint");
	SetMotion_(rulerpoint01, "GIMMICK_0", 0);
	if(GetEventFlg_("BFG_RULER_ADD_001") == true){
		SetMotion_(rulerpoint01, "GIMMICK_2", 0);
		//���[���|�C���g���N����Ƀ��[���|�C���g�A�C�R���\��
		icon01 <- ArrangePointNaviMapIcon_(NAVIMAP_ICON.RULER_POINT , "g_rulerpoint");
		SetNaviMapIconVisible_(icon01, true);
	}
	
	//----------
	// ��NPC�z�u
	//----------
	if(main_num == 1){
		if(green_event_num == GetFlagID_("CONST_SS_GR_FIRST_INVITE")){
			// �m�`������
			local ID_NPC_000 = ReadNpc_("n043");	// �m�`���������f��
			Nochora <- ArrangePointNpc_(ID_NPC_000, "npc_m");
			SetDir_(Nochora, -108);
			// ���A�N�^�[���b�Z�[�W���O�w���
			SetReactorMsg_(Nochora, "NPC_NOCHO_MEN_REC");
			// �A�i���C�Y�̃^�[�Q�b�g����؂�ւ���(�m�`���������m�`���[��)
			SetTargetNameKey_(Nochora, "NAME_TAG_NOCHORA");
		}
		// �m�`���[���Ƃ̏o��̃f���I����
		if(green_event_num == GetFlagID_("CONST_SS_GR_ENCOUTER") ||
		   green_event_num == GetFlagID_("CONST_SS_GR_WIN_TUTORIAL") ||
		   green_event_num == GetFlagID_("CONST_SS_GR_NOT_INVITE_MONSTER"))
		{
			// �m�`������
			local ID_NPC_000 = ReadNpc_("n043");	// �m�`���������f��
			nochora <- ArrangePointNpc_(ID_NPC_000, "npc_n");
			SetDir_(nochora, -108);
			// ���b�Z�[�W���O�w���( �m�`�������̖{�� )
			SetReactorMsg_(nochora, "NPC_NOCHO_MEN_REC");
			// �A�i���C�Y�̃^�[�Q�b�g����؂�ւ���(�m�`���������m�`���[��)
			SetTargetNameKey_(nochora, "NAME_TAG_NOCHORA");
		}
		// �i���֎~�̃I�[�N��z�u
		if(green_event_num >= GetFlagID_("CONST_SS_GR_INVITE_MONSTER")
		&& green_event_num <= GetFlagID_("CONST_SS_GR_HIDE_AND_SEEK")){
			local ID_NPC_ORC = ReadNpc_("m039_00"); 					// �I�[�N��ID
			npc_ORC_A  <- ArrangePointNpc_(ID_NPC_ORC, "NPC_ORC_01");	// �I�[�NA
			npc_ORC_B  <- ArrangePointNpc_(ID_NPC_ORC, "NPC_ORC_02");	// �I�[�NA
			// �n���Ō�����������ɁA�������Ă���
			SetDirToPos_(npc_ORC_A, ORCA_FRONT_POS);
			SetDirToPos_(npc_ORC_B, ORCB_FRONT_POS);
			// �\�����郂���X�^�[NPC�̃T�C�Y��ݒ�
			SetScaleSilhouette(npc_ORC_A, SCALE.N, SILHOUETTE_WIDTH.N);
			SetScaleSilhouette(npc_ORC_B, SCALE.N, SILHOUETTE_WIDTH.N);
			// �X�N���v�g�Ăяo���ł̖{���ݒ�
			SetReactorMsg_(npc_ORC_A, "NPC_ORC_REC");
			SetReactorMsg_(npc_ORC_B, "NPC_ORC_REC");
		}
		// �ߗ�( ��b�͂����Ȃ� )
		if(green_event_num <= GetFlagID_("CONST_SS_GR_COMMUNICATE_ACE")){
			// ���\�[�X�ǂݍ���
			local ID_NPC_000 = ReadNpc_("n000");	// �m�`���[���j���f��
			local ID_NPC_001 = ReadNpc_("n004");	// �m�`���[�������f��
			local ID_KING    = ReadNpc_("n003");	// �L���O���f��
			// �B�N���O
			local Prisoner_01   = ArrangePointNpc_(ID_NPC_001, "Prisoner_01");
			local Prisoner_02   = ArrangePointNpc_(ID_NPC_000, "Prisoner_02");
			local Prisoner_03   = ArrangePointNpc_(ID_NPC_001, "Prisoner_03");
			local Prisoner_04   = ArrangePointNpc_(ID_NPC_000, "Prisoner_04");
			local Prisoner_King = ArrangePointNpc_(ID_KING, "Prisoner_King");
			// ��b�����Ȃ�
			SetTalkEnable_(Prisoner_01, false);
			SetTalkEnable_(Prisoner_02, false);
			SetTalkEnable_(Prisoner_03, false);
			SetTalkEnable_(Prisoner_04, false);
			SetTalkEnable_(Prisoner_King, false);
			// �X�N���v�g�Ăяo���ł̖{���ݒ�
			SetReactorMsg_(Prisoner_King, "NPC_KING_REC");
		}
		if(green_event_num == GetFlagID_("CONST_SS_GR_CONTROL_DEVICE")
		|| green_event_num == GetFlagID_("CONST_SS_GR_REMATCH_BOWSHOCK")){
			// ���\�[�X�ǂݍ���
			local ID_NPC_000 = ReadNpc_("n000");	// �m�`���[���j���f��
			local ID_NPC_001 = ReadNpc_("n004");	// �m�`���[�������f��
			local ID_KING    = ReadNpc_("n003");	// �L���O���f��
			// �B�N����
			local Prisoner_01_b = ArrangePointNpc_(ID_NPC_001, "Prisoner_01_b");
			local Prisoner_02_b = ArrangePointNpc_(ID_NPC_000, "Prisoner_02_b");
			local Prisoner_03_b = ArrangePointNpc_(ID_NPC_001, "Prisoner_03_b");
			local Prisoner_04_b = ArrangePointNpc_(ID_NPC_000, "Prisoner_04_b");
			Prisoner_King_b  <- ArrangePointNpc_(ID_KING, "Prisoner_King_b");
			// ��b�����Ȃ�
			SetTalkEnable_(Prisoner_01_b, false);
			SetTalkEnable_(Prisoner_02_b, false);
			SetTalkEnable_(Prisoner_03_b, false);
			SetTalkEnable_(Prisoner_04_b, false);
			// �L���O�̂݉�b������
			if(green_event_num == GetFlagID_("CONST_SS_GR_CONTROL_DEVICE")){
				SetTalkEnable_(Prisoner_King_b, true);
				SetTalkTurn_ (Prisoner_King_b, false);							// ,�U������Ȃ��悤�ɂ���
				SetSearchableAngle_(Prisoner_King_b, SEARCHABLE_ANGLE_NARROW);	// ����45�x���� �b�������\
			}
			else{
				// �������A�{�[�V���b�N�Đ�E�u���C�N�{�[�V���b�N�Đ펞�͉�b�����Ȃ�
				SetTalkEnable_(Prisoner_King_b, false);
			}
			// �X�N���v�g�Ăяo���ł̖{���ݒ�
			SetReactorMsg_(Prisoner_King_b, "NPC_KING_REC");
		}
		// �Đ�p�{�[�V���b�N<����̓I�[����Z�킹�Ȃ�>���d�l�ύX�œZ�킹�邱�ƂɂȂ�܂����B
		if(green_event_num == GetFlagID_("CONST_SS_GR_REMATCH_BOWSHOCK")){
			local boss = ReadNpc_("m207_00");
			// �{�[�V���b�N
			local Bowshock = ArrangePointNpc_(boss, "Boss");
			SetScaleSilhouette(Bowshock, SCALE.M, SILHOUETTE_WIDTH.M);	// �T�C�Y�̐ݒ�
			SetTalkEnable_(Bowshock, false);	// ��b�����Ȃ�
			SetReactorMsg_(Bowshock, "NPC_BOSHOCK_REC");
			// �{�[�V���b�N�̃I�[��
			LoadEffect_("ef730_01_oth_dark_aura01");
			local efect = SetBoneEffect_("ef730_01_oth_dark_aura01", Bowshock);
			// �q��(�r�b�O�n�b�gA�EB)
			local retainer = ReadNpc_("m048_00");
			local Retainer_A = ArrangePointNpc_(retainer, "BossRetainer_01");
			local Retainer_B = ArrangePointNpc_(retainer, "BossRetainer_02");
			SetReactorMsg_(Retainer_A, "NPC_BIGHAT_REC");
			SetReactorMsg_(Retainer_B, "NPC_BIGHAT_REC");
			SetScaleSilhouette(Retainer_A, SCALE.N, SILHOUETTE_WIDTH.N);
			SetScaleSilhouette(Retainer_B, SCALE.N, SILHOUETTE_WIDTH.N);
			SetTalkEnable_(Retainer_A, false);
			SetTalkEnable_(Retainer_B, false);
		}
		// demo037[�������R���z����]�̌�ɔz�u����NPC( ��b�͂����Ȃ� )->2_20��b�����邱�ƂɂȂ�(���b�Z�[�W�͖⍇����)
		if(green_event_num == GetFlagID_("CONST_SS_GR_CLIFF")){
			// �ʍ��M�~�b�N
			local model_throne = ReadGimmick_("o_com_05");
			local throne = ArrangePointGimmick_("o_com_05", model_throne, "NPC_01_THRONE");
			// ���\�[�X�ǂݍ���
			local ID_NPC_000 = ReadNpc_("n000");	// �m�`���[���j���f��
			local ID_JACK    = ReadNpc_("n001");	// �W���b�N���f��
			local ID_ACE     = ReadNpc_("n002");	// �G�[�X���f��
			local ID_KING    = ReadNpc_("n003");	// �L���O���f��
			local ID_QUEEN   = ReadNpc_("n005");	// �N�C�[�����f��
			local ID_NOCHORIN= ReadNpc_("n043");	// �m�`���������f��
			// �m�o�b
			local Cliff_King  = ArrangePointNpc_(ID_KING,  "NPC_01");
			local Cliff_Jack  = ArrangePointNpc_(ID_JACK,  "NPC_08");
			local Cliff_Queen = ArrangePointNpc_(ID_QUEEN, "NPC_02");
			local Cliff_Ace   = ArrangePointNpc_(ID_ACE ,  "NPC_05");
			local Cliff_NPC1  = ArrangePointNpc_(ID_NOCHORIN, "NPC_03");
			local Cliff_NPC2  = ArrangePointNpc_(ID_NPC_000, "NPC_04");
			local Cliff_NPC3  = ArrangePointNpc_(ID_NPC_000, "NPC_06");
			local Cliff_NPC4  = ArrangePointNpc_(ID_NPC_000, "NPC_07");
			// ��b�����Ȃ�
			SetTalkEnable_(Cliff_King, false);
			SetTalkEnable_(Cliff_Jack, false);
			SetTalkEnable_(Cliff_Queen, false);
			SetTalkEnable_(Cliff_Ace, false);
			SetTalkEnable_(Cliff_NPC1, false);
			SetTalkEnable_(Cliff_NPC2, false);
			SetTalkEnable_(Cliff_NPC3, false);
			SetTalkEnable_(Cliff_NPC4, false);
		}
		if(green_event_num == GetFlagID_("CONST_SS_GR_START_UP_TRANSFER")){
			//demo038[���ꊮ��] �̌�ɔz�u����NPC(��b�ł��Ȃ������Ŏ��̃f���ɓ���)
			// �ʍ��M�~�b�N
			local model_throne = ReadGimmick_("o_com_05");
			local throne = ArrangePointGimmick_("o_com_05", model_throne, "NPC_09_THRONE");
			// ���\�[�X�ǂݍ���
			local ID_NPC_000 = ReadNpc_("n000");	// �m�`���[���j���f��
			local ID_JACK    = ReadNpc_("n001");	// �W���b�N���f��
			local ID_ACE     = ReadNpc_("n002");	// �G�[�X���f��
			local ID_KING    = ReadNpc_("n003");	// �L���O���f��
			local ID_QUEEN   = ReadNpc_("n005");	// �N�C�[�����f��
			local ID_NOCHORIN= ReadNpc_("n043");	// �m�`���������f��
			// �m�o�b
			local TRANSFER_King  = ArrangePointNpc_(ID_KING,  "NPC_09");
			local TRANSFER_Jack  = ArrangePointNpc_(ID_JACK,  "NPC_10");
			local TRANSFER_Queen = ArrangePointNpc_(ID_QUEEN, "NPC_11");
			local TRANSFER_Ace   = ArrangePointNpc_(ID_ACE ,  "NPC_12");
			local TRANSFER_NPC1  = ArrangePointNpc_(ID_NOCHORIN, "NPC_13");
			local TRANSFER_NPC2  = ArrangePointNpc_(ID_NPC_000, "NPC_14");
			local TRANSFER_NPC3  = ArrangePointNpc_(ID_NPC_000, "NPC_15");
			local TRANSFER_NPC4  = ArrangePointNpc_(ID_NPC_000, "NPC_16");
			// ��b�����Ȃ�
			SetTalkEnable_(TRANSFER_King, false);
			SetTalkEnable_(TRANSFER_Jack, false);
			SetTalkEnable_(TRANSFER_Queen, false);
			SetTalkEnable_(TRANSFER_Ace, false);
			SetTalkEnable_(TRANSFER_NPC1, false);
			SetTalkEnable_(TRANSFER_NPC2, false);
			SetTalkEnable_(TRANSFER_NPC3, false);
			SetTalkEnable_(TRANSFER_NPC4, false);
		}
	}

	// ���O�t���̎������\������(��l���̕��A�ʒu��ChangeDemo_(9)�̏��ōs���Ă���)
	if(main_num == GetFlagID_("CONST_SM_GRASSLAND")
	&& green_event_num == GetFlagID_("CONST_SS_GR_ENCOUT_BEFORE")){
		// ID������
		MONS_1ST <- C_NONE_ID;
		// �z�u����L������؂�ւ�
		switch(GetNumFlg_("NUM_CHANGE_FIRST_MONSTER"))
		{
		case PURIZUNYAN:
			local ID_PRZN = ReadNpc_("m040_00"); // �v���Y�j����
			MONS_1ST = ArrangePointNpc_(ID_PRZN, "1st_monster");
			SetScaleSilhouette(MONS_1ST, SCALE.N, SILHOUETTE_WIDTH.N);
			break;
		case FONDHU:
			local ID_FOND = ReadNpc_("m125_00"); // �t�H���f��
			MONS_1ST = ArrangePointNpc_(ID_FOND, "1st_monster");
			SetScaleSilhouette(MONS_1ST, SCALE.N, SILHOUETTE_WIDTH.N);
			break;
		case DORAKI:
			local ID_DRKY = ReadNpc_("m052_00"); // �h���L�[
			MONS_1ST = ArrangePointNpc_(ID_DRKY, "1st_monster");
			SetScaleSilhouette(MONS_1ST, SCALE.S, SILHOUETTE_WIDTH.S);
			break;
		case NASUBINARA:
			local ID_NASU = ReadNpc_("m069_00"); // �i�X�r�i�[��
			MONS_1ST = ArrangePointNpc_(ID_NASU, "1st_monster");
			SetScaleSilhouette(MONS_1ST, SCALE.N, SILHOUETTE_WIDTH.N);
			break;
		}
		SetTalkEnable_(MONS_1ST, false);
		SetTalkTurn_(MONS_1ST, false);
	}
	
	
	//-----------
	// ���n���z�u
	//-----------
	// ID������
	g_mineCircle11  <- C_NONE_ID;
	g_mineBoxStele  <- C_NONE_ID;
	g_mineCirStele  <- C_NONE_ID;
	g_mineStopStele <- C_NONE_ID;
	
	
	// ���Ŕ�
	g_mineCircle01 <- SetPointCircleEventMine_("mine_001", true);
	g_mineCircle02 <- SetPointCircleEventMine_("mine_002", true);
	
	
	// �������s�s�ւ̈ړ����u
	local check_transfer_device = GetEventFlg_("BFG_START_UP_TRANSFER_DEVICE"); // �ړ����u���N�����Ă��邩�`�F�b�N
	if(check_transfer_device == true){
		g_mineCircle11 = SetPointCircleEventMine_("mine_011", true);
	}
	
	
	// �����[���Δ�
	local contact_stele = GetEventFlg_("BFG_CONTACT_RULER_STELE");// ���[���Δ�ɐڐG���������`�F�b�N����t���O
	local examine_stele = GetEventFlg_("BFG_EXAMINE_RULER_STELE");// ���[���Δ�𒲂ׂ������`�F�b�N����t���O
	if(main_num == GetFlagID_("CONST_SM_GRASSLAND")){
		if(green_event_num == GetFlagID_("CONST_SS_GR_GO_RULAR_STEEL")
		|| green_event_num == GetFlagID_("CONST_SS_GR_SNEAKING_IN_FORTRESS")){
			g_mineBoxStele = SetPointBoxEventMine_("mine_stele", false);
			if(contact_stele == true){
				DeleteEventMine_(g_mineBoxStele);
			}
			if(contact_stele == true){
				g_mineCirStele = SetPointCircleEventMine_("mine_stele_02", true);
				// �i�s�s�n��
				g_mineStopStele = SetPointBoxEventMine_("mine_stele_03", false);
			}
			if(contact_stele == true && examine_stele == true){
				DeleteEventMine_(g_mineCirStele);
				DeleteEventMine_(g_mineStopStele);
			}
		}
	}

	//-----------------------------
	// �����t�B�[���h�̃C�x���g�n��
	//-----------------------------
	// �m�`�������Ƃ̏o��g���K�[(�����ɓ������ꍇ�̍Ĕz�u�n��)
	g_mineBox03_01 <-  C_NONE_ID;
	if(main_num == GetFlagID_("CONST_SM_GRASSLAND")){
		if(green_event_num == 0){
			g_mineBox03_01 = SetPointBoxEventMine_("mine_003_01", false);
			DebugPrint("g_mineBox03_01 ��Ǎ��݂܂����B");
		}
	}
	
	if(main_num == 1){
		//**�A���t�@�����ǉ�
		if(green_event_num == GetFlagID_("CONST_SS_GR_FIRST_INVITE")){
			g_mineBox03_04  <- SetPointBoxEventMine_("mine_003_04", false);
			g_mineBox03_05  <- SetPointBoxEventMine_("mine_003_05", false);
			DebugPrint("mine_003_04 �� g_mineBox03_05 ��Ǎ��݂܂����B");
		}
		// Demo009[�`���[�g���A���퓬�O�̏o�]�I����̐퓬�`���[�g���A��
		if(green_event_num == GetFlagID_("CONST_SS_GR_ENCOUTER") ||
		   green_event_num == GetFlagID_("CONST_SS_GR_WIN_TUTORIAL") ||
		   green_event_num == GetFlagID_("CONST_SS_GR_NOT_INVITE_MONSTER"))
		{
			// ��ɐi�����Ƃ���Ǝ~�߂���n��
			g_mineBox04_01 <- SetPointBoxEventMine_("mine_004_01", false);
			g_mineBox04_07 <- SetPointBoxEventMine_("mine_004_07", false);
			DebugPrint("g_mineBox04 ��Ǎ��݂܂����B");
		}
		// �m�`���[���p�[�N�ɍs�����Ƀ{�[�V���b�N�̏Z���ɍs�����Ƃ���Ǝ~�߂���n��
		if(green_event_num >= GetFlagID_("CONST_SS_GR_INVITE_MONSTER")
		&& green_event_num <= GetFlagID_("CONST_SS_GR_HIDE_AND_SEEK")){
			g_mineBox04_08 <- SetPointBoxEventMine_("mine_004_08", false);
		}
		
		// �W���b�N�Ƃ̏o��̃f����ɔ�������C�x���g�n��
		if(green_event_num >= GetFlagID_("CONST_SS_GR_SNEAKING_IN_FORTRESS")
		&& green_event_num <= GetFlagID_("CONST_SS_GR_CHANGE_BOWSHOCK")){
			// �m�`���[�������߂܂��Ă���J�S�ɋ߂Â��Ɣ�������C�x���g�n���P
			if(green_event_num == GetFlagID_("CONST_SS_GR_SNEAKING_IN_FORTRESS")){
				g_mineBox05 <- SetPointBoxEventMine_("mine_005", false);
			}
		}
		
		// �{�[�V���b�N�Đ�p�n��
		if(green_event_num == GetFlagID_("CONST_SS_GR_REMATCH_BOWSHOCK")){
			g_mineBox07 <- SetPointBoxEventMine_("mine_007_rematch", false);
		}
		
		// �m�`���[���̈ږ��v��f����ɔ�������C�x���g�n��
		if(green_event_num == GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_3")){
			g_mineCircle08 <- SetPointCircleEventMine_("mine_008", false); // �R�g���K�[
		}
		// �������R���z���ăf����ɔ�������C�x���g�n��
		if(green_event_num == GetFlagID_("CONST_SS_GR_CLIFF")){
			g_mineBox09_b1 <- SetPointBoxEventMine_("mine_009_b1", false); // �R���痣���(�m�`���[���p�[�N��)
			g_mineBox09_b2 <- SetPointBoxEventMine_("mine_009_b2", false); // �R���痣���(�m�`���[���p�[�N��)
			g_mineBox09_b3 <- SetPointBoxEventMine_("mine_009_b3", false); // �R���痣���(�m�`���[���p�[�N��)
			g_mineCircle10 <- SetPointCircleEventMine_("mine_010", true);  // ���𒲂ׂ�(6/19ROM�Ŋ₩��؂ɕύX)
		}
		// �ړ����u�ɂ��ނ���Ă���m�`���[���ɋ߂Â�
		if(green_event_num == GetFlagID_("CONST_SS_GR_START_UP_TRANSFER")){
			g_mineBox12    <- SetPointBoxEventMine_("mine_012", false); //  ���𒲂ׂ�(6/19ROM�Ŋ₩��؂ɕύX)
			g_mineBox12_b  <- SetPointBoxEventMine_("mine_012_2", false); //  ���𒲂ׂ�(6/19ROM�Ŋ₩��؂ɕύX)
			g_mineBox12_c  <- SetPointBoxEventMine_("mine_012_3", false); //  ���𒲂ׂ�(6/19ROM�Ŋ₩��؂ɕύX)
		}
	}

	// �����䑕�u(�E�B���`)
	g_mineCircle06 <- C_NONE_ID;
	g_mineCircle06 = SetPointCircleEventMine_("mine_006", true);

	// �����[���|�C���g(�{�X��O)
	mine_ruler_01 <- SetPointCircleEventMine_("mine_ruler_01", true);

	//-------------------------
	// �����A�N�^�[�|�C���g�z�u
	//-------------------------
	// ���E�b�h�p�[�N
	local reactorPoint01 = ArrangeMsgReactorPoint("reactorPoint_01", GetFlagID_("BFG_REACTER_POINT_002")
		, LONG_DIST, "REC_POINT_GR_01_01", "REC_POINT_GR_01_02");
	// ���Ŕ�
	local reactorPoint02 = ArrangeMsgReactorPoint("reactorPoint_02", GetFlagID_("BFG_REACTER_POINT_003")
		, SHORT_DIST, "REC_POINT_GR_06_01", "REC_POINT_GR_06_02");
	// ���d���̂�������
	local reactorPoint03 = ArrangeMsgReactorPoint("reactorPoint_03", GetFlagID_("BFG_REACTER_POINT_005")
		, LONG_DIST, "REC_POINT_GR_05_01", "REC_POINT_GR_05_02");
	// �����炢�̃A�M�g
	local reactorPoint04 = ArrangeMsgReactorPoint("reactorPoint_04", GetFlagID_("BFG_REACTER_POINT_004")
		, LONG_DIST, "REC_POINT_GR_02_01", "REC_POINT_GR_02_02");
	// ���B(�����V�i���I��)
	if(main_num == GetFlagID_("CONST_SM_GRASSLAND")							// Num0 = 1
	&& green_event_num < GetFlagID_("CONST_SS_GR_CONTROL_DEVICE")){			// Num2 = 13 ���O
		// �N���O
		local reactorPoint05 = ArrangeMsgReactorPoint("reactorPoint_05", GetFlagID_("BFG_REACTER_POINT_011")
			, SHORT_DIST, "REC_POINT_GR_03_01", "REC_POINT_GR_03_02");
	}
	if(green_event_num >= GetFlagID_("CONST_SS_GR_CONTROL_DEVICE")){
		// �N����
		local reactorPoint05_2 = ArrangeMsgReactorPoint("reactorPoint_05_2", GetFlagID_("BFG_REACTER_POINT_011")
			, SHORT_DIST, "REC_POINT_GR_03_01", "REC_POINT_GR_03_02");
	}
	// ���B(�����V�i���I�ȍ~)
	if(main_num >= GetFlagID_("CONST_SM_CITY")){							// Num0 = 2 �ȏ�
		// �N����
		local reactorPoint05_2 = ArrangeMsgReactorPoint("reactorPoint_05_2", GetFlagID_("BFG_REACTER_POINT_011")
			, SHORT_DIST, "REC_POINT_GR_03_01", "REC_POINT_GR_03_02");
	}
	// �����䑕�u(�E�B���`)
	local reactorPoint06 = ArrangeMsgReactorPoint("reactorPoint_06", GetFlagID_("BFG_REACTER_POINT_012")
		, SHORT_DIST, "REC_POINT_GR_04_01", "REC_POINT_GR_04_02");
	// ����(���Ă͊₾����)
	if(check_r_point_rock == false){
		local reactorPoint07 = ArrangeMsgReactorPoint("reactorPoint_07", GetFlagID_("BFG_REACTER_POINT_014")
			, SHORT_DIST, "REC_POINT_GR_07_01", "REC_POINT_GR_07_02");
	}
	else{
		local reactorPoint07_2 = ArrangeMsgReactorPoint("reactorPoint_07_2", GetFlagID_("BFG_REACTER_POINT_014")
			, SHORT_DIST, "REC_POINT_GR_07_01", "REC_POINT_GR_07_02");
	}
	// ���ړ����u
	local reactorPoint08 = ArrangeMsgReactorPoint("reactorPoint_08", GetFlagID_("BFG_REACTER_POINT_015")
		, SHORT_DIST, "REC_POINT_GR_08_01", "REC_POINT_GR_08_02");
	// ���R�A
	local reactorPoint09 = ArrangeMsgReactorPoint("reactorPoint_09", GetFlagID_("BFG_REACTER_POINT_001")
		, ENDLESS_DIST, "REC_POINT_GR_09_01", "REC_POINT_GR_09_02");
	// ���ӂ����ȐΔ�
	local reactorPoint10 = ArrangeMsgReactorPoint("reactorPoint_10", GetFlagID_("BFG_REACTER_POINT_009")
		, SHORT_DIST, "REC_POINT_GR_10_01", "REC_POINT_GR_10_02");
	// �����[���|�C���g
	local reactorPoint11 = ArrangeMsgReactorPoint("reactorPoint_11", GetFlagID_("BFG_REACTER_POINT_010")
		, SHORT_DIST, "REC_POINT_GR_11_01", "REC_POINT_GR_11_02");
	// ���y���Ւn�i�����j
	local reactorPoint12 = ArrangeMsgReactorPoint("reactorPoint_12", GetFlagID_("BFG_REACTER_POINT_044")
		, SHORT_DIST, "REC_POINT_GR_12_01", "REC_POINT_GR_12_02");
	// ���y���Ւn�i�����j
	local reactorPoint13 = ArrangeMsgReactorPoint("reactorPoint_13", GetFlagID_("BFG_REACTER_POINT_044")
		, SHORT_DIST, "REC_POINT_GR_12_01", "REC_POINT_GR_12_02");
	// ���V���̒�
	local reactorPoint14 = ArrangeMsgReactorPoint("reactorPoint_14", GetFlagID_("BFG_REACTER_POINT_176")
		, SHORT_DIST, "REC_POINT_GR_13_01", "REC_POINT_GR_13_02");

	//-----------------
	// ���}�b�v�i�r�z�u
	//-----------------
	// ���B�̐��䑕�u
	if(main_num == GetFlagID_("CONST_SM_GRASSLAND")
	&& green_event_num == GetFlagID_("CONST_SS_GR_COMMUNICATE_ACE")){
		local exclamation01 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "switch_01");
		SetNaviMapIconVisible_(exclamation01, true);
	}
	
	if(main_num == 1){
		if(green_event_num == GetFlagID_("CONST_SS_GR_INVITE_MONSTER")
		|| green_event_num == GetFlagID_("CONST_SS_GR_HIDE_AND_SEEK")){
			SetNaviMapIconVisible_(mapNavi01, true);	// �m�`���[���p�[�N
		}
		if(green_event_num >= GetFlagID_("CONST_SS_GR_MEET_JACK")
		&& green_event_num <= GetFlagID_("CONST_SS_GR_CHANGE_BOWSHOCK")){
			if(contact_stele == true && examine_stele == true){
				SetNaviMapIconVisible_(mapNavi02, true);	// �{�[�V���b�N�Z��
			}
			else{
				SetNaviMapIconVisible_(mapNavi06, true);	// ���[���Δ�
			}
		}
		if(green_event_num >= GetFlagID_("CONST_SS_GR_RETURN_KING")
		&& green_event_num <= GetFlagID_("CONST_SS_GR_GET_RIDE_SKILL_JUMP")){
			SetNaviMapIconVisible_(mapNavi01, true);	// �m�`���[���p�[�N
		}
		if(green_event_num >= GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_1")
		&& green_event_num <= GetFlagID_("CONST_SS_GR_CLIFF")){
			 SetNaviMapIconVisible_(mapNavi04, true);	// �k�̊R
		}
		if(green_event_num > GetFlagID_("CONST_SS_GR_CLIFF")
		&& green_event_num <= GetFlagID_("CONST_SS_GR_CITY_ENTRANCE")){
			 SetNaviMapIconVisible_(mapNavi05, true);	// �嗤�ړ����u
		}
	}
	// ���V�i���I��
	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){				// NUm0  = 9
		if(inside_num == GetFlagID_("CONST_SS_OS_GO_WOOD_PARK")){		// Num10 = 1
			SetNaviMapIconVisible_(mapNavi01, true);		// �m�`���[���p�[�N
		}
	}
	
	// �����[���Δ�
	local g_stele = ReadGimmick_("o_com_07");
	ruler_stele <- ArrangePointGimmick_("o_com_07", g_stele, "stele");
	
	// ���Δ�A�C�R��
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

//------------------------------------------------
//		�t�B�[���h����J�n
//------------------------------------------------
function EventStartOperate()
{
	// �t���O���擾
	local main_num        = GetNumFlg_("NUM_SCENARIO_MAIN");
	local op_event_num    = GetNumFlg_("NUM_SCENARIO_SUB_OP");
	local green_event_num = GetNumFlg_("NUM_SCENARIO_SUB_GREEN");
	local sky_num         = GetNumFlg_("NUM_SCENARIO_SUB_SKY");
	local inside_num      = GetNumFlg_("NUM_SCENARIO_SUB_INSIDE_CLEAR");
	local scout_check     = GetEventFlg_("BFG_FIRST_TIME_SCOUT_ABAREUSHIDORI");
	local contact_stele   = GetEventFlg_("BFG_CONTACT_RULER_STELE");// ���[���Δ�ɐڐG���������`�F�b�N����t���O
	local examine_stele   = GetEventFlg_("BFG_EXAMINE_RULER_STELE");// ���[���Δ�𒲂ׂ������`�F�b�N����t���O

	// ID���擾
	local player          = GetPlayerId_();
	
	DebugPrint(" ");
	DebugPrint("NUM_SCENARIO_MAIN �̒l�� " + main_num + " �ɂȂ�܂����B");
	DebugPrint("NUM_SCENARIO_SUB_OP �̒l�� " + op_event_num + " �ɂȂ�܂����B");
	DebugPrint("NUM_SCENARIO_SUB_GREEN �̒l�� " + green_event_num + " �ɂȂ�܂����B");

	//-----------------------
	// ���ړ����u���g�p������
	//-----------------------
	if(GetEventFlg_("BFG_RIDE_OFF_USED_TRANSFER") == true){
		SetEventFlg_("BFG_RIDE_OFF_USED_TRANSFER", false);
		
		UsingTransfer();
	}

	// �A�N�Z�T���[���̔z�u��ύX
	if(main_num == GetFlagID_("CONST_SM_GRASSLAND")){
		if(green_event_num == GetFlagID_("CONST_SS_GR_INVITE_JUMP_MONSTER")){
			SetEventFlg_("BFG_CHANGE_POS_ACCE_SHOP_NPC", true);
		}
	}

	//-------------
	// �S�ŕ��A����
	//-------------
	// ���A�ʒu�̃`�F�b�N
	local check_dead = GetEventFlg_("BFG_DEAD_RETURN");
	if(check_dead == true){
		if(main_num == GetFlagID_("CONST_SM_GRASSLAND")){
			if(green_event_num == GetFlagID_("CONST_SS_GR_INVITE_MONSTER")){
				// �S�ŒʒmBit�t���O��false�ɖ߂�( �v���O�����ŗ��ĂăX�N���v�g�ō~�낷 )
				SetEventFlg_("BFG_DEAD_RETURN", false);
				// �S�ŕ��A
				uDeadReturnDemo1();
			}
			else if(green_event_num == GetFlagID_("CONST_SS_GR_HIDE_AND_SEEK")){
				// �S�ŒʒmBit�t���O��false�ɖ߂�( �v���O�����ŗ��ĂăX�N���v�g�ō~�낷 )
				SetEventFlg_("BFG_DEAD_RETURN", false);
				// �S�ŕ��A
				uDeadReturnDemo1();
			}
			// 
			else if(green_event_num == GetFlagID_("CONST_SS_GR_RETURN_KING")){
				// �S�ŒʒmBit�t���O��false�ɖ߂�( �v���O�����ŗ��ĂăX�N���v�g�ō~�낷 )
				SetEventFlg_("BFG_DEAD_RETURN", false);
				// �S�ŕ��A
				uDeadReturnDemo2();
			}
			else{
				// ��O
			}
		}
	}

	//---------------
	// ���V�i���I�J�n
	//---------------
	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){
		if(inside_num == 0){
			// Num�t���O����
			SetNumFlg_("NUM_SCENARIO_MAIN", GetFlagID_("CONST_SM_INSIDE_CLEAR"));					// NUM000 = 9
			SetNumFlg_("NUM_SCENARIO_SUB_INSIDE_CLEAR", GetFlagID_("CONST_SS_OS_GO_WOOD_PARK"));	// NUM010 0 �� 1
			// �ꎞ�I�ɑ����N���A�t���O���~�낷(�V��Ǝ��ԑт̌Œ�̈�)
			SetEventFlg_("BFG_SCENARIO_CLEAR_GRASS", false);
			// �f�����l���̈ʒu
			local rtn_pos = Vec3(139.283, 202.756, 121.290);
			local rtn_dir = -137;
			SetReturnDemoPosDir_(rtn_pos, rtn_dir);
			// �V��Ǝ��ԑт��f���ɍ��킹��
			SetWeather_(WEATHER.NORMAL);
			SetTime_(START_TIME_ZONE_NOON);
			// Demo800[���L���H����̒ʐM]
			EventStartChangeDemo(800, FADE_COLOR_BLACK);
		}
	}

	//----------------------------
	// Demo652[�\��]�Đ���ɃZ�[�u
	//----------------------------
	if(main_num == GetFlagID_("CONST_SM_SKY")){
		if(sky_num == GetFlagID_("CONST_SS_SK_DATA_SAVED")){
			// �t���O��\�V�i���I�N���A��ɂ���
			SetNumFlg_("NUM_SCENARIO_SUB_SKY",  0); 		// ����V�i���I�̃t���O�����Z�b�g
			SetNumFlg_("NUM_SCENARIO_MAIN", GetFlagID_("CONST_SM_INSIDE_CLEAR"));
			SetNumFlg_("NUM_SCENARIO_SUB_INSIDE_CLEAR",  0);
			// �\�V�i���I�N���A�t���O[Bit_46]
			SetEventFlg_("BFG_SCENARIO_CLEAR_ALL", true);
			// �����z������
			SetEventFlg_("BFG_CHOUSEI_HAIGOU_UNLOCK", true);
			SetEventFlg_("BFG_TRAVEL_INFO_SHOW_050", true); // ���̐S���̍��ډ���t���O	�y���Ԃ̈琬�z�����z��
			UpdateLibraryMonsterByUnlockChousei_();			// �����z���̃��C�u�������ڍX�V

			// �t�F�[�h�A�E�g
			SetFadePlane_(FADE_PLANE.PLANE_3D);
			SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
			SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
			WaitFade_();

			// �\�V�i���I�̋@�\���֍��m
			OpenMsgWnd_();
			ShowMsg_("SCENARIO_CLEAR_OPENSYSTM_001");
			KeyInputWait_();
			PlaySE_("SE_SYS_011");
			ShowMsg_("SCENARIO_CLEAR_OPENSYSTM_002");
			KeyInputWait_();
			CloseMsgWnd_();

			Wait_(15);

			PlaySE_("SE_SYS_011");
			OpenMsgWnd_();
			ShowMsg_("SCENARIO_CLEAR_OPENSYSTM_003");
			KeyInputWait_();
			CloseMsgWnd_();

			//�t�F�[�h�K�p�ʂ����ɖ߂�
			SetFadePlane_(FADE_PLANE.PLANE_NORMAL);

			// ��l���̈ʒu��demo[�\��]�̍Đ���̈ʒu�ɍ��킹��
			local pl_pos = Vec3(139.283, 202.756, 121.290);
			local pl_dir = -99;
			SetPos_(player, pl_pos);
			SetDir_(player, pl_dir);

			SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, FADE_SHORT);
			// �L�������킳���Z�[�u
			uAutoSaved();
			// �^�C�g����ʂ��Ăт���
			ChangeTitle_();
		}
	}

	//-----------------------------
	// �M�~�b�N�̃A�j���[�V��������
	//-----------------------------
	// �t���O�������Ƃ� true �̎��ɐΔ�̌�������
	if(contact_stele == true){
		if(examine_stele == true){
			// �Δ�͌���Ȃ�
			SetMotion_(ruler_stele, "GIMMICK_2", 0);
			DebugPrint("�Δ�(���[��)�̃A�j����GIMMICK_2�ł�");
			SetNaviMapIconVisible_(icon_stone, false);
		}
		else{
			// �Δ�͌���
			SetMotion_(ruler_stele, "GIMMICK_0", 0);
			DebugPrint("�Δ�(���[��)�̃A�j����GIMMICK_0�ł�");
			SetNaviMapIconVisible_(icon_stone, true);
		}
	}
	else{
		// �Δ�͌���
		SetMotion_(ruler_stele, "GIMMICK_0", 0);
		DebugPrint("�Δ�(���[��)�̃A�j����GIMMICK_0�ł�");
		SetNaviMapIconVisible_(icon_stone, true);
	}

	//---------------------------------------------------------
	// �C�x���g��018[�{�[�V���b�N�o��]�E019[�{�[�V���b�N�Đ펞] 
	//---------------------------------------------------------
	if(main_num == 1){
		if(green_event_num == GetFlagID_("CONST_SS_GR_APPEAR_BOWSHOCK")){
			// �{�[�V���b�N��(�Đ���܂�)���̃t���O
			SetNumFlg_("NUM_SCENARIO_SUB_GREEN", GetFlagID_("CONST_SS_GR_CHANGE_BOWSHOCK"));
			// �{�[�V���b�N��
			ChangeBattleParty_(9);
		}
	}

	//--------------------------------------------
	// Demo014[�m�`���[���p�[�N�֘A��Ă���]���Đ�
	//--------------------------------------------
	if(main_num == 1){
		if(green_event_num == GetFlagID_("CONST_SS_GR_NOT_INVITE_MONSTER")){
			// �f���Đ��O�Ƀt�B�[���h���f��Ȃ����߂̑Ή�
			SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
			SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
			WaitFade_();
			// �T�u�t���O��i�߂�
			SetNumFlg_("NUM_SCENARIO_SUB_GREEN", GetFlagID_("CONST_SS_GR_INVITE_MONSTER"));
			// �����X�^�[�̏o�������������Ă����t���O������
			SetEventFlg_("BFG_LIMIT_TUTORIAL_GREEN", true);

			// �f���I����̈ʒu���C��
			SetReturnDemoMap_("H00_00");
			//2015/2/26 ����̃f���ɍ��킹�Ē������܂����B
			SetReturnDemoPosDir_(Vec3(246.358, 64.276, -705.062), -82);
			// �f���Đ�
			SetEventFlg_("BFG_DEMO_START_BGM_PAUSE_RELEASE", true);
			ChangeDemo_(14);
		}
	}

	//-----------------------------------------------------------------------------
	// Demo009[�`���[�g���A���퓬�O�̏o�]�̍Đ���ɖ��O�̐ݒ肵��Demo012[]���Đ�
	//-----------------------------------------------------------------------------
	if(main_num == 1){
		if(green_event_num == GetFlagID_("CONST_SS_GR_ENCOUT_BEFORE")){
			// �T�u�t���O��i�߂�
			SetNumFlg_("NUM_SCENARIO_SUB_GREEN", GetFlagID_("CONST_SS_GR_FIRST_INVITE"));
			// demo041�Đ��O�ɔz�u����A�i���C�Y�p�̃X���C���Q�̂�ݒu
			SetEventFlg_("BFG_LIMIT_ANALYZE_SLIME", true);
			// �����X�^�[�̖��O�ݒ��ʂɈڍs
			uTaskNamedWindow();
			// ���̐S���̍��ډ���t���O	�y���j���[�z�����X�^�[���Z(2��DB #2463�Ńv���O�������ŉ�����邱�ƂɂȂ�܂����B-> ����ς�X�N���v�g�ŉ�����邱�ƂɂȂ�܂����B)
			SetEventFlg_("BFG_TRAVEL_INFO_SHOW_020", true); // ���Y�^( Redmine#1771�ŐS���̍��ڂ��u�܂񂽂�v����u�����X�^�[���Z�v�ɕύX )
			// ���߂Ẵ����X�^�[����ɓ��ꂽ�t���O(Redmine #2589)
			SetEventFlg_("BFG_FIRST_MONSTER", true);
			// �����X�^�[���Z�̉���
			AddFieldMenu_(FIELD_COMMAND.MONSTERABILITY);
			// �f���I����̕��A�ʒu
			SetReturnDemoPosDir_(Vec3(807.389, 192.581, -489.168), -120);
			// �f���Đ�
			EventStartChangeDemo(12, FADE_COLOR_BLACK);
		}
	}

	//-----------------
	// �퓬�I�����̏���
	//-----------------
	// �퓬�I������̕��A��Ԃ𔻒�
	if (GetBattleEndType_() != BATTLE_END_TYPE_NONE){
		local main_num        = GetNumFlg_("NUM_SCENARIO_MAIN");
		local green_event_num = GetNumFlg_("NUM_SCENARIO_SUB_GREEN");
		if(main_num == 1){
			// �`���[�g���A���퓬
			// (�`���[�g���A���퓬����       green_event_num == 1 )
			// (�`���[�g���A���퓬�Q��ڈȍ~ green_event_num == 2 )
			if(green_event_num == GetFlagID_("CONST_SS_GR_ENCOUTER")
			|| green_event_num == GetFlagID_("CONST_SS_GR_WIN_TUTORIAL")){
				//�퓬�ɏ���
				if (GetBattleEndType_() == BATTLE_END_TYPE_WIN){
					// ���񏟗�( �X�J�E�g���s )
					if(green_event_num == GetFlagID_("CONST_SS_GR_ENCOUTER")){
						// �f���Đ��O�Ƀt�B�[���h���f��Ȃ����߂̑Ή�
						SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
						SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
						WaitFade_();
						// �T�u�t���O��i�߂�
						SetNumFlg_("NUM_SCENARIO_SUB_GREEN", GetFlagID_("CONST_SS_GR_WIN_TUTORIAL"));
						// �S�Ŏ����̏ꕜ�ABit�t���O
						SetEventFlg_("BFG_DEAD_KEEP_MAP", true);
						// �ŏ��̃`���[�g���A���̃X���C���o��O�ɔz�u����Ȃ��悤�ɂ���t���O
						SetEventFlg_("BFG_LIMIT_TUTORIAL_GREEN_BEFORE", true);
						// �`���[�g���A����͋N���オ��Ȃ���t���O
						SetEventFlg_("BFG_BATTLE_GETUP_DISABLE", true);
						// �����X�^�[���o��������ŏ�������ݒ�
						SetMonsterGenPlayerInvasionAreaMin_(100);  // ������10m�ɐݒ�
						DebugPrint("�����X�^�[���o��������ŏ�������ݒ�2");
						// �`���[�g���A���X�J�E�g���s�t���O
						SetEventFlg_("BFG_NOT_SUCCESS_SCOUT", true);
						// �f���I����̕��A�ʒu
						SetReturnDemoPosDir_(Vec3(651.668, 153.869, -688.307), -138); // ��������w�蕜�A�ʒu
						
						SetEventFlg_("BFG_TRAVEL_INFO_SHOW_025", true);	// ���̐S���̍��ډ���t���O	�y�퓬�z�����X�^�[�𒇊Ԃɂ�����@
						SetEventFlg_("BFG_TRAVEL_INFO_SHOW_015", true);	// ���̐S���̍��ډ���t���O	�y���j���[�z���
						
						// �V�i���I�̕ύX�őS�񕜂̖��߂�ǉ�
						RecoverAll_();
						// Demo010[�`���[�g���A���퓬����]���Đ�
						SetEventFlg_("BFG_DEMO_START_BGM_PAUSE_RELEASE", true);
						ChangeDemo_(10);
					}
					// ����( �X�J�E�g���s )
					else{
						SetNumFlg_("NUM_SCENARIO_SUB_GREEN", GetFlagID_("CONST_SS_GR_WIN_TUTORIAL"));
						// �S�Ŏ����̏ꕜ�ABit�t���O
						SetEventFlg_("BFG_DEAD_KEEP_MAP", true);
						// �ŏ��̃`���[�g���A���̃X���C���o��O�ɔz�u����Ȃ��悤�ɂ���t���O
						SetEventFlg_("BFG_LIMIT_TUTORIAL_GREEN_BEFORE", true);
						// �`���[�g���A����͋N���オ��Ȃ���t���O
						SetEventFlg_("BFG_BATTLE_GETUP_DISABLE", true);
						// �����X�^�[���o��������ŏ�������ݒ�
						SetMonsterGenPlayerInvasionAreaMin_(100);  // ������10m�ɐݒ�
						DebugPrint("�����X�^�[���o��������ŏ�������ݒ�3");
					}
					
				// �X�J�E�g����
				}else if(GetBattleEndType_() == END_TYPE_SCOUT){
					// ����X�J�E�g�����f��
					if(green_event_num == GetFlagID_("CONST_SS_GR_ENCOUTER")){
						// �f���Đ��O�Ƀt�B�[���h���f��Ȃ����߂̑Ή�
						SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
						SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
						WaitFade_();
						// �S�Ŏ����̏ꕜ�ABit�t���O��߂�
						SetEventFlg_("BFG_DEAD_KEEP_MAP", false);
						DebugPrint("����X�J�E�g�����f��");
						
						SetNumFlg_("NUM_SCENARIO_SUB_GREEN", GetFlagID_("CONST_SS_GR_INVITE_MONSTER"));
						// �����X�^�[�̏o�������������Ă����t���O������
						SetEventFlg_("BFG_LIMIT_TUTORIAL_GREEN", true);
						// �`���[�g���A����ȍ~�͋N���オ��悤�Ƀt���O
						SetEventFlg_("BFG_BATTLE_GETUP_DISABLE", false);
						// �X�J�E�g���s���ɓ{��𔭓�����悤�ɂ���
						SetEventFlg_("BFG_BATTLE_SCOUT_ANGRY_DISABLE", false);
						// �G�p�[�e�B�̂����̐��𐧌�t���O(�i�s�x1
						SetNumFlg_("NUM_ENEMY_PARTY_STRENGTH", 1);
						// �����X�^�[���o�������鋗�����f�t�H���g�l�ɖ߂�
						SetMonsterGenPlayerInvasionAreaMin_(-1);
						// �`���[�g���A���X�J�E�g���s�t���O
						SetEventFlg_("BFG_NOT_SUCCESS_SCOUT", false);
						SetReturnDemoPosDir_(Vec3(615.893, 150.757, -609.944), -120);
						
						SetEventFlg_("BFG_TRAVEL_INFO_SHOW_025", true);	// ���̐S���̍��ډ���t���O	�y�퓬�z�����X�^�[�𒇊Ԃɂ�����@
						SetEventFlg_("BFG_TRAVEL_INFO_SHOW_015", true);	// ���̐S���̍��ډ���t���O	�y���j���[�z���
						
						// Demo014[�m�`���[���p�[�N�֘A��Ă���(����P)]���Đ�
						SetEventFlg_("BFG_DEMO_START_BGM_PAUSE_RELEASE", true);
						ChangeDemo_(14);
					}
					// �X�J�E�g�����f��
					else{
						// �f���Đ��O�Ƀt�B�[���h���f��Ȃ����߂̑Ή�
						SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
						SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
						WaitFade_();
						// �S�Ŏ����̏ꕜ�ABit�t���O��߂�
						SetEventFlg_("BFG_DEAD_KEEP_MAP", false);
						// �T�u�t���O��i�߂�
						SetNumFlg_("NUM_SCENARIO_SUB_GREEN", GetFlagID_("CONST_SS_GR_INVITE_MONSTER"));
						// �`���[�g���A����ȍ~�͋N���オ��悤�Ƀt���O
						SetEventFlg_("BFG_BATTLE_GETUP_DISABLE", false);
						// �X�J�E�g���s���ɓ{��𔭓�����悤�ɂ���
						SetEventFlg_("BFG_BATTLE_SCOUT_ANGRY_DISABLE", false);
						// �G�p�[�e�B�̂����̐��𐧌�t���O(�i�s�x1
						SetNumFlg_("NUM_ENEMY_PARTY_STRENGTH", 1);
						// �����X�^�[���o�������鋗�����f�t�H���g�l�ɖ߂�
						SetMonsterGenPlayerInvasionAreaMin_(-1);
						// �����X�^�[�̏o�������������Ă����t���O������
						SetEventFlg_("BFG_LIMIT_TUTORIAL_GREEN", true);
						// �f���I����̈ʒu���C��
						SetReturnDemoMap_("H00_00");
						SetReturnDemoPosDir_(Vec3(615.893, 150.757, -609.944), -120);
						// Demo014[�m�`���[���p�[�N�֘A��Ă���(����Q)]���Đ�
						SetEventFlg_("BFG_DEMO_START_BGM_PAUSE_RELEASE", true);
						ChangeDemo_(14);
					}
					
				// �s�k
				}else if(GetBattleEndType_() == END_TYPE_LOSE){
					// �f���Đ��O�Ƀt�B�[���h���f��Ȃ����߂̑Ή�
					SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
					SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
					WaitFade_();
					// �S�Ŏ����̏ꕜ�ABit�t���O
					SetEventFlg_("BFG_DEAD_KEEP_MAP", true);
					// �X�e�[�^�X��
					RecoverAll_();
					DebugPrint(" ");
					DebugPrint("�X�N���v�g:�`���[�g���A���퓬�Ŕs�k�����̂ŉ񕜂��܂���");
					
					// �����X�^�[���o��������ŏ�������ݒ�
					SetMonsterGenPlayerInvasionAreaMin_(100);  // ������10m�ɐݒ�
					
					// 011[�`���[�g���A���퓬�s�k]
					SetReturnDemoPosDir_(Vec3(618.801, 147.278, -644.414), 169); // ��������w�蕜�A�ʒu
					ChangeDemo_(11);
				}
				
			// �{�X(�{�[�V���b�N)��̎�
			}else if(green_event_num == GetFlagID_("CONST_SS_GR_CHANGE_BOWSHOCK")){
				if (GetBattleEndType_() == BATTLE_END_TYPE_WIN){
					// �f���Đ��O�Ƀt�B�[���h���f��Ȃ����߂̑Ή�
					SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
					SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
					WaitFade_();
					// �{�[�V���b�N�ɏ���
					SetNumFlg_("NUM_SCENARIO_SUB_GREEN", GetFlagID_("CONST_SS_GR_RETURN_KING"));
					// �������N���A�����̂Ń{�[�V���b�N�̏Z����
					// �����X�^�[��z�u���Ȃ�����������
					SetEventFlg_("BFG_LIMIT_CLEAR_GREEN", true);
					// �G�p�[�e�B�̂����̐��𐧌�t���O(�i�s�x�R
					SetNumFlg_("NUM_ENEMY_PARTY_STRENGTH", 3);
					// �S�ŕ��A�}�b�v��ύX(Redmine#2261�S�ŕ��A���[���̉���)
					SetNumFlg_("NUM_DEAD_RETURN_MAP", GetFlagID_("CONST_DEAD_RETURN_MAP_H00_00"));
					// �f����ɐݒ肳����l���̈ʒu�ƌ���
					SetReturnDemoPosDir_(Vec3(510.0, 342.65, 973.96), -70);
					// Demo020[�{�[�V���b�N�폟��]���Đ������
					ChangeDemo_(20);
				}
				else{
					// �s�k�����AfterBattle()�ōs��
				}
			}
		}
	}

	//-----------
	// �}�b�v�i�r
	//-----------
	// ���΂ꂤ���ǂ�ߊl�`�F�b�N
	local get_abareushidori = GetEventFlg_("BFG_FIRST_TIME_SCOUT_ABAREUSHIDORI");
	local hide_aba_mapnavi  = GetEventFlg_("BFG_CHECK_DISPLAYED_ABARE_MAP_NAVI");

	if(main_num == 1){
		if(green_event_num == GetFlagID_("CONST_SS_GR_INVITE_JUMP_MONSTER")){
			if(get_abareushidori == false){
				// ���΂ꂤ���ǂ�ߊl�}�b�v�i�r��\��
				SetNaviMapIconVisible_(mapNavi03, true);
				// ���΂ꂤ���ǂ�ߊl�}�b�v�i�r����x�ł��\���������𒲂ׂ�t���O
				SetEventFlg_("BFG_CHECK_DISPLAYED_ABARE_MAP_NAVI", true);
			}
			else{
				// ��x�ł����΂ꂤ���ǂ�}�b�v�i�r��\�����Ă�����폜����
				if(hide_aba_mapnavi == true){
					SetNaviMapIconVisible_(mapNavi04, false);

					// �L���O�̏��ɖ߂낤���b�Z�[�W��\��
					if (GetEventFlg_("BFG_ABA_SCOUT_MSG_ON") == false) {
						// �v���C���[�̃��[�V������ǉ�
						SetMotion_(player, "WAIT", 15);
						// �V�X�e�����b�Z�[�W�\��(��)
						CommonMessageT("DEMO_023_AFT_SYS", "NAME_NONE");
						SetEventFlg_("BFG_ABA_SCOUT_MSG_ON", true);
					}
					SetEventFlg_("BFG_FIRST_TIME_SCOUT_ABAREUSHIDORI", true);
				}
				// �m�`���[���p�[�N�̃i�r��\��
				SetNaviMapIconVisible_(mapNavi01, true);
			}
		}
	}

	//-------------------------------------
	// ���C�h�t�B���^�����̃��b�Z�[�W��\��
	//-------------------------------------
	// �t�B�[���h���C�h(��)���擾�����i�K�ŕ\��
	if(GetEventFlg_("BFG_RIDE_LICENSE_FIELD") == true){
		if(!IsOpenNaviMapRideFilter_(RIDE_FILTER.HIGHJUMP)){
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
			OpenNaviMapRideFilter_(RIDE_FILTER.HIGHJUMP);
			// �v���C���[�̃��[�V������ҋ@��Ԃɖ߂�
			CommResetPlayerMotion();
		}
	}

	//---------------------------
	// ���A�N�^�[�N�����o�C�x���g
	//---------------------------
	if(main_num == GetFlagID_("CONST_SM_OPENING")){
		if(op_event_num == GetFlagID_("CONST_SS_OP_ESCAPE_PARADISE")){
			ReactorOnEvent();
			// �m�`�������Ƃ̏o��g���K�[(���A�N�^�[�N���C�x���g��ɒn����z�u)
			g_mineBox03_01 = SetPointBoxEventMine_("mine_003_01", false);
		}
	}

//---------------------------------------------------------------------
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
	local target = GetTargetId_();
	local bit = GetEventFlg_("BFG_NOT_SUCCESS_SCOUT");

	local main_num  = GetNumFlg_("NUM_SCENARIO_MAIN");
	local green_event_num = GetNumFlg_("NUM_SCENARIO_SUB_GREEN");
	
	// ���B�̒��̃L���O
	if(main_num == 1){
		if(green_event_num == GetFlagID_("CONST_SS_GR_CONTROL_DEVICE")
		|| green_event_num == GetFlagID_("CONST_SS_GR_REMATCH_BOWSHOCK")){
			if(target == Prisoner_King_b){
				// �T�u�t���O���C�x���g��ɕύX
				SetNumFlg_("NUM_SCENARIO_SUB_GREEN", GetFlagID_("CONST_SS_GR_APPEAR_BOWSHOCK"));
				// ���̐S���̍��ډ��
				SetEventFlg_("BFG_TRAVEL_INFO_SHOW_064", true); // ���̐S���̍��ډ���t���O�y���E�ρz�u���C�N�����X�^�[
				// �f�����A��̈ʒu
				SetReturnDemoPosDir_(Vec3(515.0, 342.0, 960.0), 60);
				// Demo018[�{�[�V���b�N�o��]�Đ�
				SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
				SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
				WaitFade_();
				ChangeDemo_(18); 
			}
		}

		// ���i���֎~�̃I�[�N
		if(green_event_num >= GetFlagID_("CONST_SS_GR_INVITE_MONSTER")
		&& green_event_num <= GetFlagID_("CONST_SS_GR_HIDE_AND_SEEK")){
			// �I�[�NA
			if(target == npc_ORC_A){
				CommonMessageT("DEMO_010_AFT_ORC_001", "NAME_NONE");
			}
			// �I�[�NB
			if(target == npc_ORC_B){
				CommonMessageT("DEMO_010_AFT_ORC_002", "NAME_NONE");
			}
		}

		if(green_event_num == GetFlagID_("CONST_SS_GR_ENCOUTER") ||
		   green_event_num == GetFlagID_("CONST_SS_GR_WIN_TUTORIAL") ||
		   green_event_num == GetFlagID_("CONST_SS_GR_NOT_INVITE_MONSTER"))
		{
			if(target == nochora){
				if(green_event_num == GetFlagID_("CONST_SS_GR_ENCOUTER")){
					CommonMessageT("DEMO_009_AFT_NOC_002", "NAME_NONE");
				}
				else{
					CommonMessageT("DEMO_009_AFT_NOC_004", "NAME_NONE");
				}
				RecoveryAndMsg();
				DebugPrint("�X�N���v�g:�m�`���[���ɘb�������ĉ񕜂��܂���");
			}
		}
		
		// �m�`���[��(�`���[�g���A����)
		if(green_event_num == GetFlagID_("CONST_SS_GR_FIRST_INVITE")){
			if(target == Nochora){
				DeleteEventMine_(g_mineBox03_04);
				DeleteEventMine_(g_mineBox03_05);
				// �T�u�t���O��i�߂�
				SetNumFlg_("NUM_SCENARIO_SUB_GREEN", GetFlagID_("CONST_SS_GR_ENCOUTER"));
				// �G�p�[�e�B�̂����̐��𐧌�t���O(�i�s�x�O
				SetNumFlg_("NUM_ENEMY_PARTY_STRENGTH", 0);
				// �S�Ŏ����̏ꕜ�ABit�t���O��ݒ�
				SetEventFlg_("BFG_DEAD_KEEP_MAP", true);
				// �ŏ��̃`���[�g���A���̃X���C���o��O�ɔz�u����Ȃ��悤�ɂ���t���O
				SetEventFlg_("BFG_LIMIT_TUTORIAL_GREEN_BEFORE", true);
				// demo041�Đ��O�ɔz�u����A�i���C�Y�p�̃X���C���Q�̂�����
				SetEventFlg_("BFG_LIMIT_ANALYZE_SLIME", false);
				// �`���[�g���A����͋N���オ��Ȃ���t���O
				SetEventFlg_("BFG_BATTLE_GETUP_DISABLE", true);
				// �X�J�E�g���s���ɓ{��𔭓����Ȃ��悤�ɂ���
				SetEventFlg_("BFG_BATTLE_SCOUT_ANGRY_DISABLE", true);
				// �����X�^�[���o��������ŏ�������ݒ�
				SetMonsterGenPlayerInvasionAreaMin_(100);  // ������10m�ɐݒ�
				DebugPrint("�����X�^�[���o��������ŏ�������ݒ�1");
				// �f���I����̕��A�ʒu
				SetReturnDemoPosDir_(Vec3(651.668, 153.869, -688.307), -138); // ��������w�蕜�A�ʒu
				// �b���������炷���Ƀt�F�[�h �{ Demo041�u�퓬�`���[�g���A�������v���Đ�
				TouchNpcChangeDemo(41);
			}
		}
	}

	EventEnd_();
}

//------------------------------------------------
//		�n���ڐG��
//------------------------------------------------
function TouchEventMine()
{
	// �t���O���擾
	local main_num             = GetNumFlg_("NUM_SCENARIO_MAIN");
	local op_event_num         = GetNumFlg_("NUM_SCENARIO_SUB_OP");
	local green_event_num      = GetNumFlg_("NUM_SCENARIO_SUB_GREEN");
	local bit_control_device   = GetEventFlg_("BFG_CONTROL_DEVICE");
	local rematch_bit          = GetEventFlg_("BFG_REMATCH_BOWSHOCK");
	local check_camera_dir_fix = GetEventFlg_("BFG_CAMERA_DIR_FIX");	 // �f���Đ�����̃J�����̌������Œ肷�邽�߂̃t���O
	local contact_stele        = GetEventFlg_("BFG_CONTACT_RULER_STELE");// ���[���Δ�ɐڐG���������`�F�b�N����t���O
	local examine_stele        = GetEventFlg_("BFG_EXAMINE_RULER_STELE");// ���[���Δ�𒲂ׂ������`�F�b�N����t���O
	
	// ID���擾
	local target = GetTouchEventMineId_();
	local player = GetPlayerId_();

	// ���{�[�V���b�N���ӂ̊Ŕ�
	local board_pos = Vec3(-457.63, 171.68, -302.13);
	if(target == g_mineCircle01){
		CommTurnAroundAndSetPlayableCamera(-95);
		CommonMessageT("MINE_MSG_001", "NAME_NONE");
	}
	if(target == g_mineCircle02){
		CommPlayerTurnAroundDir(95);
		CommonMessageT("MINE_MSG_002", "NAME_NONE");
	}

	// �����[���|�C���g(�{�X��O)
	if(target == mine_ruler_01){
		if(GetEventFlg_("BFG_RULER_ADD_001") == false){
			// ���[���|�C���g�̋��ʏ���
			CommPlayerTurnAroundObj(rulerpoint01);
			CommRulerPointEvent(rulerpoint01, "BFG_RULER_ADD_001", "g_rulerpoint");
		}
		else{
			// �Δ�̕��Ɍ�����
			CommPlayerTurnAroundObj(rulerpoint01);
			//�V�X�e�����b�Z�[�W
			CommonMessageT("RULER_POINT_MSG", "NAME_TAG_REACTOR");
		}
	}

	// �����[���Δ�
	if(contact_stele == false){
		if(target == g_mineBoxStele){
			DeleteEventMine_(g_mineBoxStele);
			// �T�u�t���O�̕ύX
			SetEventFlg_("BFG_CONTACT_RULER_STELE", true);
			SetNumFlg_("NUM_SCENARIO_SUB_GREEN", GetFlagID_("CONST_SS_GR_SNEAKING_IN_FORTRESS"));
			//�f����̍��W�ƌ�����ݒ�
			SetReturnDemoPosDir_(Vec3(-649.015, 201.336, 754.161), -62);
			// �J�����̌�����ύX����t���O�𗧂Ă�
			SetEventFlg_("BFG_CAMERA_DIR_FIX", true);
			ChangeDemo_(43);// �f�����Đ�
		}
	}
	else{
		if(examine_stele == false){
			if(target == g_mineCirStele){
				DeleteEventMine_(g_mineCirStele);	// �Δ�p�n���폜
				DeleteEventMine_(g_mineStopStele);	// �i�s�s�n�����폜
				
				CommPlayerTurnAroundObj(ruler_stele);
				
				//�t�F�[�h�A�E�g
				SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
				SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
				WaitFade_();
				Wait_(10);
				
				//��l���̈ʒu��Δ�̑O�ɒu��
				SetPos_(player, Vec3(-742.714, 216.347, 808.211));
				SetDir_(player, -67);
				//�J������ݒu
				SetPointCameraEye_("cameye_002");
				SetPointCameraTarget_("camtgt_002");
				Wait_(10);
				
				//�X�L���擾���ʏ���
				SkillStelePerformance(ruler_stele, ABILITY_RULER);
				
				// �v���C���[���Z�̉���
				AddFieldMenu_(FIELD_COMMAND.PLAYERABILITY);
				SetEventFlg_("BFG_TRAVEL_INFO_SHOW_018", true); // ���̐S���̍��ډ���t���O	�y���j���[�z�v���C���[���Z
				SetEventFlg_("BFG_TRAVEL_INFO_SHOW_033", true); // ���̐S���̍��ډ���t���O	�y�t�B�[���h�z���[��
				SetEventFlg_("BFG_EXAMINE_RULER_STELE", true);
				
				// �Δ�A�C�R���������Ȃ�����
				SetNaviMapIconVisible_(icon_stone, false);
				// �i�r�A�C�R�������[���Δ肩��v�ǂɕύX
				SetNaviMapIconVisible_(mapNavi06, false);	// ���[���Δ�
				SetNaviMapIconVisible_(mapNavi02, true);	// �{�[�V���b�N�̗v��
				
				// ���[���|�C���g�����ɔz�u�����X�^�[�����ւ���p
				SetEventFlg_("BFG_LIMIT_STELE", true);
				// �v���C���[���Z���j���[�Ƀ��[����ǉ�
				AddPlayerAbility_(PLAYERABILITYID.RULER);
				
				//�t�F�[�h�C��
				SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
				SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
				WaitFade_();
			}
			// �i�s�s��
			if(target == g_mineStopStele){
				CommReactorActionNotice();		// ���A�N�^�[���������������̋��ʏ���
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_REACTOR");
				ShowMsg_("STELE_MSG_005");
				KeyInputWait_();
				CloseMsgWnd_();
				CommResetPlayerMotion();		// ���[�V������ҋ@��Ԃɖ߂����ʏ���
				Wait_(5);
				
				// �o�b�N���Ĉړ�
				SetDirToPos_(player, Vec3(-753.838, 232.069, 815.531));
				CommPlayerTurnMoveDirWalk(-123);
			}
		}
	}

	// �����䑕�u(�E�B���`)
	if(target == g_mineCircle06){
		local ctl_dev_pos = Vec3(772.83, 365.30, 1021.81);
		if(main_num == GetFlagID_("CONST_SM_GRASSLAND")){
			if(green_event_num == GetFlagID_("CONST_SS_GR_COMMUNICATE_ACE")){
				// �n���폜
				DeleteEventMine_(g_mineCircle06);
				SetNumFlg_("NUM_SCENARIO_SUB_GREEN", GetFlagID_("CONST_SS_GR_CONTROL_DEVICE"));
				// ���䑕�u�̃t���O��true�ɂ���
				SetEventFlg_("BFG_CONTROL_DEVICE", true);
				CommPlayerTurnAroundObj(switch01);
				// �f���㕜�A�ʒu
				SetReturnDemoPosDir_(Vec3(720.168, 354.575, 1016.072), 76);
				// demo040[�G�[�X����̒ʐM�E���b�N������]���Đ�
				ChangeDemo_(40);
			}
			else{
				CommPlayerTurnAroundObj(switch01);
				OpenMsgWnd_();
				ShowMsg_("DEVICE_MSG_001");
				KeyInputWait_();
				CloseMsgWnd_();
			}
		}
		else{
			CommPlayerTurnAroundObj(switch01);
			OpenMsgWnd_();
			ShowMsg_("DEVICE_MSG_001");
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}

	// ���ړ����u
	local check_transfer_device = GetEventFlg_("BFG_START_UP_TRANSFER_DEVICE");	// �ړ����u���N�����Ă��邩�`�F�b�N
	local dont_use_transfer = GetEventFlg_("BFG_DONT_TRANSFER_GREEN_TO_CITY");	// ����-�����Ԃ̑嗤�ړ����u�̎g�p���֎~����t���O
	if(target == g_mineCircle11){
		if(check_transfer_device == true){
			if(dont_use_transfer == false){
				// �ړ����u�����߂Ē��ׂ��������ANUM�t���O��i�߂�
				if(green_event_num == GetFlagID_("CONST_SS_GR_COMPLETE_FOOTHOLD")){
					// �n���폜
					DeleteEventMine_(g_mineCircle11);
					// �C�x���g�t���O��i�߂�
					SetNumFlg_("NUM_SCENARIO_MAIN", 2);													// ���C���t���O
					SetNumFlg_("NUM_SCENARIO_SUB_GREEN", 0);											// �Î�̑����t���O(30 -> 0�ɖ߂�)
					SetNumFlg_("NUM_SCENARIO_SUB_CITY",  GetFlagID_("CONST_SS_CI_CLIMB_THE_LADDER"));	// �����s�s�t���O
					DebugPrint("NUM_SCENARIO_MAIN �̒l�� " + main_num + " �ɂȂ�܂����B");
					// ���d�{�ݓ��̃����X�^�[�����t���O���N��
					SetEventFlg_("BFG_MACHINE_POWEROFF", true);
					// �嗤�ړ��̃f�����ɃZ�[�u�|�C���g�����ލۂɎg�p����t���O
					SetEventFlg_("BFG_SAVE_POINT_FLAG", true);
					// �嗤�ړ����u���g���đ嗤�ړ������ꍇ�A���C�h���������邽�߂Ɏg�p����t���O
					SetEventFlg_("BFG_RIDE_OFF_USED_TRANSFER", true);
					// �����̑嗤�ړ����u���ӂ̔z�u�����X�^�[�����̃C�x���g�I����ɉ��ւ���t���O
					SetEventFlg_("BFG_LIMIT_DEVICE_GREEN", true);
					// �S�ŕ��A�}�b�v��ύX(Redmine#2261�S�ŕ��A���[���̉���)
					SetNumFlg_("NUM_DEAD_RETURN_MAP", GetFlagID_("CONST_DEAD_RETURN_MAP_A00_00"));
					// �����s�s��
					SetReturnDemoMap_("A00_00"); 
					// �������R�����Ŕ��ł��������o���Ă݂�B2015/3/19�i���͎b��R���ōs���j
					SetReturnDemoPosDir_(Vec3(-7.588, 120.555, 3307.945), 180);
					// �嗤�Ԉړ���demo039[�V�V�n�ցI]���Đ����鏈��
					ChangeDemo_(39);
				}
				else{
					// �I�������b�Z�[�W
					OpenMsgWnd_();
					ShowMsg_("MINE_MSG_011");
					KeyInputWait_();
					if(GetQueryResult_() == QUERY_YES){
						// �嗤�ړ����u���g���đ嗤�ړ������ꍇ�A���C�h���������邽�߂Ɏg�p����t���O
						SetEventFlg_("BFG_RIDE_OFF_USED_TRANSFER", true);
						CloseMsgWnd_();
						DeleteEventMine_(g_mineCircle11);
						// �����s�s��
						ChangeMapPosDir_("A00_00", Vec3(-4.974, 147.255,3323. 595), 180);
					}
					else{
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
		}
	}

	// ���m�`���[���Ƃ̏o�
	if(target == g_mineBox03_01){
		// �n���폜
		DeleteEventMine_(g_mineBox03_01);
		// ��l�����΂݂ɋ߂Â�����
		SetMotion_(player, "WAIT", 4);
		// �T�u�t���O��i�߂�
		SetNumFlg_("NUM_SCENARIO_SUB_GREEN", GetFlagID_("CONST_SS_GR_ENCOUT_BEFORE"));

		//�ŏ��̒��ԉ����ɍ��킹�ăt�B�[���h�R�}���h����
		SetEventFlg_("BFG_TACTICS_PROHIBIT", false);		//���i�A�N�e�B�u�j
		SetEventFlg_("BFG_SKILLPOINT_PROHIBIT", false);		//�X�L���|�C���g�i�A�N�e�B�u�j
		SetEventFlg_("BFG_SAVE_PROHIBIT", false);			//�Z�[�u�i�A�N�e�B�u�j
		SetEventFlg_("BFG_COMMUNICATION_PROHIBIT", false);	//�ʐM�i�A�N�e�B�u�j
		SetEventFlg_("BFG_LIBRARY_PROHIBIT", false);		//���C�u�����i�A�N�e�B�u�j

		//���̐S������
		SetEventFlg_("BFG_TRAVEL_INFO_SHOW_002", true);	// ���̐S���̍��ډ���t���O�y��{�z�����X�^�[�}�X�^�[
		SetEventFlg_("BFG_TRAVEL_INFO_SHOW_004", true);	// ���̐S���̍��ډ���t���O�y��{�z���ԃ����X�^�[
		SetEventFlg_("BFG_TRAVEL_INFO_SHOW_005", true);	// ���̐S���̍��ډ���t���O�y��{�z�p�[�e�B�ƃX�^���o�C
		SetEventFlg_("BFG_TRAVEL_INFO_SHOW_006", true);	// ���̐S���̍��ډ���t���O�y��{�z�p�[�e�B�����N
		SetEventFlg_("BFG_TRAVEL_INFO_SHOW_017", true);	// ���̐S���̍��ډ���t���O�y���j���[�z�Z�[�u
		SetEventFlg_("BFG_TRAVEL_INFO_SHOW_019", true);	// ���̐S���̍��ډ���t���O�y���j���[�z���C�u����
		SetEventFlg_("BFG_TRAVEL_INFO_SHOW_021", true);	// ���̐S���̍��ډ���t���O�y���j���[�z�ʐM
		SetEventFlg_("BFG_TRAVEL_INFO_SHOW_022", true);	// ���̐S���̍��ډ���t���O�y���j���[�z���ꂿ�����o�g�����͂��߂�
		SetEventFlg_("BFG_TRAVEL_INFO_SHOW_023", true);	// ���̐S���̍��ډ���t���O�y���j���[�z���[�J���ʐM���͂��߂�
		SetEventFlg_("BFG_TRAVEL_INFO_SHOW_024", true);	// ���̐S���̍��ډ���t���O�y���j���[�zWi-Fi�ʐM���r�[�ɍs��
		SetEventFlg_("BFG_TRAVEL_INFO_SHOW_053", true);	// ���̐S���̍��ډ���t���O�y���Ԃ̈琬�z�ʐM�R�C���Ƃ̌���
		SetEventFlg_("BFG_TRAVEL_INFO_SHOW_054", true);	// ���̐S���̍��ډ���t���O�y�ʐM�z�߂����ŋ��I�}�X�^�[�Y�f�o
		SetEventFlg_("BFG_TRAVEL_INFO_SHOW_056", true);	// ���̐S���̍��ډ���t���O�y�ʐM�z�ʐM�R�C�����W�߂悤�I
		SetEventFlg_("BFG_TRAVEL_INFO_SHOW_063", true);	// ���̐S���̍��ډ���t���O�y���E�ρz�u���C�N���[���h
		SetEventFlg_("BFG_TRAVEL_INFO_SHOW_065", true);	// ���̐S���̍��ډ���t���O�y���E�ρz�m�`���[��
		SetEventFlg_("BFG_TRAVEL_INFO_SHOW_068", true);	// ���̐S���̍��ډ���t���O�y�ʐM�z���[������I�`�������W���[�YGP
		
		// �f���I����̕��A�ʒu
		SetReturnDemoPosDir_(Vec3(861.850, 195.959, -574.483), 177);
		// Demo009[�`���[�g���A���퓬�O�̏o�]���Đ�
		ChangeDemo_(9);
	}

	if(main_num == 1){
		if(green_event_num == GetFlagID_("CONST_SS_GR_FIRST_INVITE")){
			if(target == g_mineBox03_04 || target == g_mineBox03_05){
				DeleteEventMine_(g_mineBox03_04);
				DeleteEventMine_(g_mineBox03_05);
				// �T�u�t���O��i�߂�
				SetNumFlg_("NUM_SCENARIO_SUB_GREEN", GetFlagID_("CONST_SS_GR_ENCOUTER"));
				// �G�p�[�e�B�̂����̐��𐧌�t���O(�i�s�x�O
				SetNumFlg_("NUM_ENEMY_PARTY_STRENGTH", 0);
				// �S�Ŏ����̏ꕜ�ABit�t���O��ݒ�
				SetEventFlg_("BFG_DEAD_KEEP_MAP", true);
				// �ŏ��̃`���[�g���A���̃X���C���o��O�ɔz�u����Ȃ��悤�ɂ���t���O
				SetEventFlg_("BFG_LIMIT_TUTORIAL_GREEN_BEFORE", true);
				// demo041�Đ��O�ɔz�u����A�i���C�Y�p�̃X���C���Q�̂�����
				SetEventFlg_("BFG_LIMIT_ANALYZE_SLIME", false);
				// �`���[�g���A����͋N���オ��Ȃ���t���O
				SetEventFlg_("BFG_BATTLE_GETUP_DISABLE", true);
				// �X�J�E�g���s���ɓ{��𔭓����Ȃ��悤�ɂ���
				SetEventFlg_("BFG_BATTLE_SCOUT_ANGRY_DISABLE", true);
				// �����X�^�[���o��������ŏ�������ݒ�
				SetMonsterGenPlayerInvasionAreaMin_(100);  // ������10m�ɐݒ�
				DebugPrint("�����X�^�[���o��������ŏ�������ݒ�1");
				// �f���I����̕��A�ʒu
				SetReturnDemoPosDir_(Vec3(651.668, 153.869, -688.307), -138);
				// �b���������炷���Ƀt�F�[�h �{ Demo041�u�퓬�`���[�g���A�������v���Đ�
				TouchNpcChangeDemo(41);
			}
		}

		// �`���[�g���A���퓬���n�߂��ɐ�ɐi�߂悤�Ƃ����ꍇ
		if(green_event_num == GetFlagID_("CONST_SS_GR_ENCOUTER") ||
		   green_event_num == GetFlagID_("CONST_SS_GR_WIN_TUTORIAL") ||
		   green_event_num == GetFlagID_("CONST_SS_GR_NOT_INVITE_MONSTER"))
		{
			if(target == g_mineBox04_01
			|| target == g_mineBox04_07){
				// �C�x���g�n���̈ړ�����
				local dir;
				switch(target){
				case g_mineBox04_01:
					dir = 100;
					break;
				case g_mineBox04_07:
					dir = -128;
					break;
				}
				if(green_event_num == GetFlagID_("CONST_SS_GR_ENCOUTER")){
					PlayerLeaveMine("NAME_NONE","DEMO_009_AFT_NOC_001", dir);
				}
				else{
					OpenMsgWnd_();
					ShowMsg_("DEMO_009_AFT_NOC_005");
					KeyInputWait_();
					ShowMsg_("DEMO_009_AFT_NOC_006");
					KeyInputWait_();
					CloseMsgWnd_();
					CommPlayerTurnMoveDirWalk(dir);
				}
			}
		}

		// �m�`���[���p�[�N�ɂ�炸�Ƀ{�[�V���b�N�̏Z���ɍs�����Ƃ����ꍇ
		if(green_event_num >= GetFlagID_("CONST_SS_GR_INVITE_MONSTER")
		&& green_event_num <= GetFlagID_("CONST_SS_GR_HIDE_AND_SEEK")){
			if(target == g_mineBox04_08){
				// �߂��ɋ�����̃I�[�N�Ɏ~�߂���
				StopTalkOrc();
			}
		}

		// �m�`���[�������߂܂��Ă���J�S�ɋ߂Â��Ɣ�������C�x���g�n���P
		if(green_event_num == GetFlagID_("CONST_SS_GR_SNEAKING_IN_FORTRESS")){
			if(target == g_mineBox05){
				SetNumFlg_("NUM_SCENARIO_SUB_GREEN", GetFlagID_("CONST_SS_GR_COMMUNICATE_ACE"));
				// �f�����Ăяo�����A��̈ʒu
				SetReturnDemoPosDir_(Vec3(540.0, 345.0, 960.0), 112);
				// Demo017[�G�[�X����̒ʐM�E���b�N�����O]���Đ����鏈������ŋL�q
				ChangeDemo_(17);
			}
		}

		// �{�[�V���b�N�Đ펞
		if(green_event_num == GetFlagID_("CONST_SS_GR_REMATCH_BOWSHOCK")){
			if(target == g_mineBox07){
				// �T�u�t���O���{�[�V���b�N��ɕύX
				SetNumFlg_("NUM_SCENARIO_SUB_GREEN", GetFlagID_("CONST_SS_GR_APPEAR_BOWSHOCK"));
				// Demo019[�{�[�V���b�N�Đ펞]���Đ����鏈������ŋL�q
				ChangeDemo_(19);
			}
		}

		// �R�g���K�[
		if(green_event_num == GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_3")){
			if(target == g_mineCircle08){
				// ���΂ꂤ���ǂ�̏����`�F�b�N( 2��DB #6750 )
				local check_flg = uCheckHighJumpMonsterKind();
				if(check_flg == false){
					// �V�X�e�����b�Z�[�W�\��
					OpenMsgWnd_();
					ShowMsg_("EVENT_IRREGULAR_MSG");	// ���ԂɁ@���΂ꂤ���ǂ肪�@���Ȃ��悤�ł��B
					KeyInputWait_();
					CloseMsgWnd_();
					// �����Ԃ�
					CommPlayerTurnMoveDirWalk(5, 60);
				}
				else{
					// �R�g���K�[�̒n�����폜
					DeleteEventMine_(g_mineCircle08);
					SetNumFlg_("NUM_SCENARIO_SUB_GREEN", GetFlagID_("CONST_SS_GR_CLIFF"));
					// ���[���֎~
					SetEventFlg_("BFG_PLAYERABILITY_RULER_PROHIBIT", true);
					// ���΂ꂤ���ǂ蓦�����Ȃ��t���O
					SetEventFlg_("BFG_ABARE_LET_ESCAPE_PROHIBIT", true);
					// �Z�[�u�֎~
					SetEventFlg_("BFG_SAVE_PROHIBIT", true);
					// �ʐM�֎~
					SetEventFlg_("BFG_COMMUNICATION_PROHIBIT", true);
					// �����X�^�[�z�u�����t���O������
					SetEventFlg_("BFG_LIMIT_CLIFF_GREEN", true);
					// �ږ��J�n�t���O��true�ɂ���
					SetEventFlg_("BFG_START_IMMIGRATION", true);
					// �f���㕜�A�ʒu
					SetReturnDemoPosDir_(Vec3(108.415, 240.0, -1394.394), -169.0);
					// Demo037[�������R���z����]���Đ�
					ChangeDemo_(37);
				}
			}
		}

		if(green_event_num == GetFlagID_("CONST_SS_GR_CLIFF")){
			// �؂��痣���
			if(target == g_mineBox09_b1){
				PlayerLeaveMine("NAME_TAG_KING", "DEMO_025_AFT_KNG", 110);
			}
			if(target == g_mineBox09_b2){
				PlayerLeaveMine("NAME_TAG_KING", "DEMO_025_AFT_KNG", -170);
			}
			if(target == g_mineBox09_b3){
				PlayerLeaveMine("NAME_TAG_KING", "DEMO_025_AFT_KNG", -110);
			}

			// �؂𒲂ׂ�
			if(target == g_mineCircle10){
				SetNumFlg_("NUM_SCENARIO_SUB_GREEN", GetFlagID_("CONST_SS_GR_START_UP_TRANSFER"));
				// ��t�߂̒n�����폜(6/19ROM�Ŋ₩��؂ɕύX)
				DeleteEventMine_(g_mineCircle10);
				// �ړ����u���N�������邽�߂̃C�x���g�n����Ǎ��ނ悤�ɂ���
				SetEventFlg_("BFG_START_UP_TRANSFER_DEVICE", true);
				// �ړ����u���N�������邽�߂̃C�x���g�n����Ǎ��ނ悤�ɂ���
				SetEventFlg_("BFG_COMPLETE_FOOTHOLD", true);
				// ���[���֎~������
				SetEventFlg_("BFG_PLAYERABILITY_RULER_PROHIBIT", false);
				// ���΂ꂤ���ǂ蓦�����Ȃ��t���O�����ɖ߂�
				SetEventFlg_("BFG_ABARE_LET_ESCAPE_PROHIBIT", false);
				// �Z�[�u�֎~������
				SetEventFlg_("BFG_SAVE_PROHIBIT", false);
				// �ʐM�֎~������
				SetEventFlg_("BFG_COMMUNICATION_PROHIBIT", false);
				// �f���㕜�A�ʒu
				SetReturnDemoPosDir_(Vec3(-13.024, 250.200, -1745.892), -118);
				// Demo038[���ꊮ��]���Đ�����
				ChangeDemo_(38);
			}
		}

		// �ړ����u�ɂ��ނ���Ă���m�`���[���ɋ߂Â�
		if(green_event_num == GetFlagID_("CONST_SS_GR_START_UP_TRANSFER")){
			if(target == g_mineBox12
			|| target == g_mineBox12_b
			|| target == g_mineBox12_c){
				SetNumFlg_("NUM_SCENARIO_SUB_GREEN", GetFlagID_("CONST_SS_GR_COMPLETE_FOOTHOLD"));
				// �n�����폜
				DeleteEventMine_(g_mineBox12);
				DeleteEventMine_(g_mineBox12_b);
				DeleteEventMine_(g_mineBox12_c);
				// �f���㕜�A�ʒu(��)
				SetReturnDemoPosDir_(Vec3(-489.778, 383.121, -1783.760), -79.0);
				// Demo047[�ړ����u�̋N��]���Đ�����
				ChangeDemo_(47); // ��
			}
		}
	}

//---------------------------------------------------------------------
	//--------------------------------
	// ����Ԃ̗V�уC�x���g�p�n��
	//--------------------------------
	// ��ՃX�C�b�`�𒲂ׂ����̏���
	if(target == g_keyhole_mine){
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
	}
	
	// �S�[�������X�^�[�ɋ߂Â������̏���
	if(target == g_keyhole_goal_mine){
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


//=========================================================================================================
//									�������������牺�̓��[�J���֐�������
//=========================================================================================================

//=================================================================
// ����֐��F���������X�^�[����A���΂ꂤ���ǂ肪���邩�`�F�b�N  
//-----------------------------------------------------------------
// ����    �F�Ȃ�
// �߂�l  �F�Ȃ�
//=================================================================
function CheckAllMonsterKind(){

	DebugPrint(" ");
	local o_kind = 0;
	local count  = 0;
	local monster_id = 157; // ���΂ꂤ���ǂ��ID��157

	// ���������X�^�[�̒��ɂ��΂ꂤ���ǂ肪���邩���m�F
	for(count = 0; count <= ( GetOwnerMonsterNum_() - 1 ); count++){
		o_kind = GetOwnerMonsterKind_(count);
		DebugPrint("���������X�^�[ " + (count+1) + " �̖ڂ̎푰ID�� " + o_kind + " �ł�");
		if(o_kind == monster_id){
			DebugPrint("���������X�^�[�ɑ�W�����v�����X�^�[�͂��܂�");
			return true;
		}
	}

	DebugPrint("��W�����v�����X�^�[�͂��܂���");
	return false;
}

//=================================================================
// ����֐��F���b�Z�[�W�̕\���֐�(���O�\������)
//-----------------------------------------------------------------
// �������F�\�����郁�b�Z�[�W�i���b�Z�[�W�L�[�j
// �������F�l�[���^�O
// �߂�l  �F�Ȃ�
//=================================================================
function CommonMessageT(message_key, name_tag){
	OpenMsgWnd_();
	SetTalkName_(name_tag);
	ShowMsg_(message_key);
	KeyInputWait_();
	CloseMsgWnd_();
}

//=================================================================
// ����֐��F�v���C���[���C�x���g�n�����痣���
//-----------------------------------------------------------------
// �������F�l�[���^�O
// �������F�\�����郁�b�Z�[�W�i���b�Z�[�W�L�[�j
// ��O�����F�����i�x���j
// �߂�l  �F�Ȃ�
//=================================================================
function PlayerLeaveMine(name_tag, message_key, dir){
	local player = GetPlayerId_();
	OpenMsgWnd_();
	SetTalkName_(name_tag);
	ShowMsg_(message_key);
	KeyInputWait_();
	CloseMsgWnd_();
	CommPlayerTurnMoveDirWalk(dir);
}

//======================================================
// ����֐��F���A�N�^�[�N���C�x���g
//------------------------------------------------------
// ����  �F�Ȃ�
// �߂�l�F�Ȃ�
//======================================================
function ReactorOnEvent()
{
	// NUM�t���O�̕ύX
	SetNumFlg_("NUM_SCENARIO_MAIN", GetFlagID_("CONST_SM_GRASSLAND"));
	SetNumFlg_("NUM_SCENARIO_SUB_OP", 0);
	SetNumFlg_("NUM_SCENARIO_SUB_GREEN", 0);

	// BIT�t���O�̕ύX
	SetEventFlg_("BFG_TRAVEL_INFO_SHOW_037", true);	// ���̐S���̍��ډ���t���O	�y�t�B�[���h�z���A�N�^�[
	SetEventFlg_("BFG_TRAVEL_INFO_SHOW_040", true);	// ���̐S���̍��ډ���t���O	�y�t�B�[���h�z�ړI�n�A�C�R��
	SetEventFlg_("BFG_REACTOR_ON", true);			// ���A�N�^�[�̋N���t���O(�����̓��A�̃}�b�v�\���Ŏg�p)

	// ���o�J�n
	SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);
	SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, 30);
	WaitFade_();
	
	// �萔
	local ZOOM_FRAME = 5;
	
	//=============================================
	// �J���������Y�[��
	//=============================================
	// ���̃J�����̍��W
	local beforeEye = GetCameraEye_();
	local beforeTgt = GetCameraTarget_();
	
	// ��l�̎��_�̍��W
	local personEye = GetFirstPersonCameraEye_();
	local personTgt = GetFirstPersonCameraTarget_();
	SetLinearCameraEye_(personEye, ZOOM_FRAME);
	SetLinearCameraTarget_(personTgt, ZOOM_FRAME);
	// �v���C���[���f��̂ŏ���
	local player = GetPlayerId_();
	SetActive_(player, false);
	Wait_(ZOOM_FRAME);
	
	//=============================================
	// �J���������ʒu�ړ�
	// ���A�N�^�[���C�A�E�g�N��
	//=============================================
	LoadLayout_("reactor_frame");
	SetLayoutAnime_("reactor_on", false);
	PlaySE_("SE_FLD_231");						// ���A�N�^�[�N����
	WaitLayoutAnime();
	
	//=============================================
	// ���A�N�^�[���C�A�E�g �ʏ�ɐݒ�
	// �����A�N�^�[���b�Z�[�W
	//=============================================
	SetLayoutAnime_("reactor_loop", true);
	
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_MYSTERYMACHINE");
	ShowMsg_("REC_ON_SYSTEM_WELCOME");			// �u���Ȃ��̖`���� ���S�m���� �T�|�[�g����
	KeyInputWait_();
	
	SetTalkName_("NAME_TAG_REACTOR");
	ShowMsg_("REC_ON_SYSTEM_INTRO");			// �u�����u�� ���W�X�^���X�x���p�ɍ��ꂽ
	KeyInputWait_();
	CloseMsgWnd_();

	//=============================================
	// ���A�N�^�[�N���{�^���\��
	//=============================================
	Wait_(15);
	SetEventFlg_("BFG_NAVIMAP_REACTOR_CONTROL_UNLOCK", true);
	Wait_(15);

	//=============================================
	// �����A�N�^�[���b�Z�[�W
	// ����ʂ̃i�r�}�b�v�����
	//=============================================
	PlaySE_("SE_FLD_234");							// �X�L�����i���j��
	Wait_(47);
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_REACTOR");
	ShowMsg_("REC_ON_SYSTEM_ACT");					// �u�c�c�t�߂� �W���炵�� ������ �m�F�B
	KeyInputWait_();
	CloseMsgWnd_();
	
	Wait_(30);
	SetEventFlg_("BFG_NAVIMAP_REACTOR_PLAYER_UNLOCK", true);	// �v���C���[�A�C�R���\��
	SetEventFlg_("BFG_NAVIMAP_REACTOR_MAP_UNLOCK", true);		// �i�r�}�b�v�ډB���I�[�v��
	Wait_(30);
	
	//=============================================
	// �E�b�h�p�[�N�փt�H�[�J�X�ړ�
	// �E�b�h�p�[�N�Ƀ^�[�Q�b�g�A�C�R���\��
	//=============================================
	FocusIcon_(NAVIMAP_ICON.DESTINATION);
	WaitIsScrollNaviMap();
	SetNaviMapIconVisible_(mapNavi01, true);
	Wait_(60);
	
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_REACTOR");
	ShowMsg_("REC_ON_SYSTEM_RENEWAL");				// �u�`�����@���ɖ������Ƃ��@��������
	KeyInputWait_();
	CloseMsgWnd_();
	
	FocusCancel_();	// ���̈ʒu�ɖ߂�
	WaitIsScrollNaviMap();
	
	Wait_(30);
	
	//=============================================
	// ���A�N�^�[���C�A�E�g �I���ɐݒ�
	//=============================================
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_REACTOR");
	ShowMsg_("REC_ON_SYSTEM_END");				// �u�܂��@����ʁ@�E�����@�^�b�`�����
	KeyInputWait_();
	ShowMsg_("REC_ON_SYSTEM_EXPLAIN");			// �u�{�@�� �e�@�\�� �g�p����ۂ�
	KeyInputWait_();
	CloseMsgWnd_();
	
	SetLayoutAnime_("reactor_off", false);
	PlaySE_("SE_FLD_232");						// ���A�N�^�[��~��
	WaitLayoutAnime();
	// �v���C���[��\��
	SetActive_(player, true);
	// �J���������̈ʒu�܂ňړ�
	SetLinearCameraEye_(beforeEye, ZOOM_FRAME);
	SetLinearCameraTarget_(beforeTgt, ZOOM_FRAME);
	Wait_(ZOOM_FRAME);
	SetPlayableCamera_();						// �J������ʏ�ɖ߂�
}

//======================================================
// ����֐��F���C�A�E�g�A�j���҂�
//------------------------------------------------------
// ����    �F�Ȃ�
// �߂�l  �F�Ȃ�
//======================================================
function WaitLayoutAnime()
{
	while(!IsLayoutAnimeEnd_()){
		Wait_(1);
	}
}

//======================================================
// ����֐��F�i�r�}�b�v�X�N���[���҂�
//------------------------------------------------------
// ����    �F�Ȃ�
// �߂�l  �F�Ȃ�
//======================================================
function WaitIsScrollNaviMap()
{
	while(IsScrollNaviMap_()){
		Wait_(1);
	}
}

//======================================================
// ����֐��F�n���ŋߏ�̃I�[�N�Ɏ~�߂��鏈��
//------------------------------------------------------
// ����    �F�Ȃ�
// �߂�l  �F�Ȃ�
//======================================================
function StopTalkOrc()
{
	local player = GetPlayerId_();
	local playerPos = GetPos_(player);
	local near = GetPlayerNearObj_();
	
	local PLAYER_BACK_POS = Vec3(-583.15, 190.50, 582.30);
	local ORC_ROT_DIR = 2.9;
	local MOTION_BLEND_FRAME = 4;
	local PLAYER_FRONT_MOVE_SPEED = 1.0;
	local PLAYER_BACK_DIR = 148;
	
	if(near == npc_ORC_A || near == npc_ORC_B){
		// �����G�t�F�N�g���I�[�N�ɕ\��
		LoadEffect_("ef300_20_target_icon");
		SetBoneEffect_("ef300_20_target_icon", near);
		PlaySE_("SE_DEM_053");
		Wait_(15);
		
		// �I�[�N���v���C���[�̕��Ɍ�������< ���Y�^ : Task_RotateToPos_()������,WaitTask()���Ȃ��Ɖ�]���Ȃ��̂Œ��� >
		SetMotion_(near, "WALK", MOTION_BLEND_FRAME);
		local rotateTask = Task_RotateToPos_(near, playerPos, ORC_ROT_DIR);
		WaitTask(rotateTask);
		SetMotion_(near, "WAIT", MOTION_BLEND_FRAME);
		
		// �I�[�N�̃��b�Z�[�W�\��
		OpenMsgWnd_();
		SetTalkName_("NAME_NONE");
		if(near == npc_ORC_A){
			ShowMsg_("DEMO_010_AFT_ORC_001");
		} else {
			ShowMsg_("DEMO_010_AFT_ORC_002");
		}
		KeyInputWait_();
		CloseMsgWnd_();
		
		// �I�[�N�����ʂɌ�������
		SetMotion_(near, "WALK", MOTION_BLEND_FRAME);
		// �I�[�N�ɂ���Č���������W���Ⴄ
		local frondPos = ORCA_FRONT_POS;
		if(near == npc_ORC_B){
			frondPos = ORCB_FRONT_POS;
		}
		local rotateFrontTask = Task_RotateToPos_(near, frondPos, ORC_ROT_DIR);
		
		// �I�[�N��ҋ@���[�V�����ɖ߂�
		WaitTask(rotateFrontTask);
		SetMotion_(near, "WAIT", MOTION_BLEND_FRAME);
		
		// �v���C���[�o�b�N���Ĉړ�
		CommPlayerTurnMoveDirWalk(PLAYER_BACK_DIR);
	}
}

//======================================================
// ����֐��F���O�t����ʂ��Ăяo��
//------------------------------------------------------
// ����    �F�Ȃ�
// �߂�l  �F�Ȃ�
//======================================================
function uTaskNamedWindow()
{
	local mons_param = 0;
	// �������ԃ����X�^�[�̎擾
	switch(GetNumFlg_("NUM_CHANGE_FIRST_MONSTER"))
	{
	case PURIZUNYAN:	
		mons_param = 1203;		// �p�����[�^�h�c:�v���Y�j����
		break;
	case FONDHU:
		mons_param = 1202;		// �p�����[�^�h�c:�t�H���f��
		break;
	case DORAKI:
		mons_param = 1201;		// �p�����[�^�h�c:�h���L�[
		break;
	case NASUBINARA:
		mons_param = 1204;		// �p�����[�^�h�c:�i�X�r�i�[��
		break;
	}

	// �w�i��ݒ�
	// �v���C���[���f��̂ŏ���
	local player = GetPlayerId_();
	SetActive_(player, false);

	// ���O�t����ʂֈڍs
	local tsk_named_wnd = Task_AddFellow_(mons_param, false);
	WaitTask(tsk_named_wnd);

	// ���O�t�����I��������U�t�F�[�h�A�E�g���v���C���[��\�����鏈��
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
	SetActive_(player, true);
}

//======================================================
// ���ʊ֐��F�\�V�i���I�N���A���̃Z�[�u����
//------------------------------------------------------
// �������F�Ȃ�
// �߂�l  �F�Ȃ�
//======================================================
function uAutoSaved()
{
	// �嗤�ړ��̃f�����ɃZ�[�u�|�C���g�����ލۂɎg�p����t���O
	local save_pnt_flg = GetEventFlg_("BFG_SAVE_POINT_FLAG");
	if(save_pnt_flg == true){
		// �嗤�ړ��̃f�����ɃZ�[�u�|�C���g�����ލۂɎg�p����t���O��false��
		SetEventFlg_("BFG_SAVE_POINT_FLAG", false);
		SetNavimapVisible_(false);			// �����(�}�b�v���f��Ȃ�����)
		// �Z�[�u��ʂֈڍs
		local tsk_saved_wnd = Task_Save_();
		WaitTask(tsk_saved_wnd);
		DebugPrint("�Z�[�u����");
		KeyInputWait_();
		Wait_(1);
		// �t�F�[�h�C���O�ɉ���ʂ��t�F�[�h�A�E�g������
		SetNavimapVisible_(true);
		SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
		WaitFadeSub_();
	}
}

//======================================================
// ���ʊ֐��F�S�ŕ��A�̋[���f��1[�퓬�`���[�g���A���I���`�W���b�N��������]
//------------------------------------------------------
// �������F�Ȃ�
// �߂�l  �F�Ȃ�
//======================================================
function uDeadReturnDemo1()
{
// �t�F�[�h�A�E�g
	CommChangeMomentFadeOut(FADE_COLOR_BLACK);
// ����
	// ��l���̈ʒu
	local player_pos = Vec3(501.006, 117.891, -636.878);
	local player_dir = -160;
	// �[���f����̕��A�ʒu
	local player_rtn_pos = Vec3(501.006, 117.891, -636.878);
	local player_rtn_dir = -90;
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
	SetDirToPlayer_(dead_npc);
	Wait_(wait_speed);
	// �m�`������(�ҋ@���[�V��������b���[�V����)
	SetMotion_(dead_npc, "TALKLOOP", BLEND_N);
	// �t�F�[�h�C��
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	Wait_(FADE_DEF);
	// ���b�Z�[�W�\��
	OpenMsgWnd_();
	ShowMsg_("DEAD_RETURN_MSG_01");
	KeyInputWait_();
	CloseMsgWnd_();
	// �m�`������(��b���[�V�������ҋ@���[�V����)
	SetMotion_(dead_npc, "WAIT", BLEND_L);
	Wait_(wait_speed_def);
	// �񕜏����{���ʃ��b�Z�[�W�\��
	RecoveryAndMsg();
	Wait_(wait_speed);
	// �t�F�[�h�A�E�g
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, wait_speed);
	SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, wait_speed);
	Wait_(20);
	WaitFade_();
	// �}�b�v�`�F���W
	ChangeMapPosDir_("H00_00", player_rtn_pos, player_rtn_dir);
}

//======================================================
// ���ʊ֐��F�S�ŕ��A�̋[���f��2[�L���O�~�o�`�E�b�h�p�[�N�ɖ߂�]
//------------------------------------------------------
// �������F�Ȃ�
// �߂�l  �F�Ȃ�
//======================================================
function uDeadReturnDemo2()
{
// �t�F�[�h�A�E�g
	CommChangeMomentFadeOut(FADE_COLOR_BLACK);
// ����
	// ��l���̈ʒu
	local player_pos = Vec3(-355.779, 145.218, -589.044);
	local player_dir = -90;
	// �[���f����̕��A�ʒu
	local player_rtn_pos = Vec3(-355.779, 145.218, -589.044);
	local player_rtn_dir = -108;
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
	SetDirToPlayer_(dead_npc);
	Wait_(wait_speed);
	// �m�`������(�ҋ@���[�V��������b���[�V����)
	SetMotion_(dead_npc, "TALKLOOP", BLEND_N);
	// �t�F�[�h�C��
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	Wait_(FADE_DEF);
	// ���b�Z�[�W�\��
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_NOCHORIN");
	ShowMsg_("DEAD_RETURN_MSG_02");
	KeyInputWait_();
	CloseMsgWnd_();
	// �A���}(��b���[�V�������ҋ@���[�V����)
	SetMotion_(dead_npc, "WAIT", BLEND_L);
	Wait_(wait_speed);
	// �񕜏����{���ʃ��b�Z�[�W�\��
	RecoveryAndMsg();
	// �t�F�[�h�A�E�g
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, wait_speed);
	SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, wait_speed);
	Wait_(20);
	WaitFade_();
	// �}�b�v�`�F���W
	ChangeMapPosDir_("H00_00", player_rtn_pos, player_rtn_dir);
}

//======================================================
// ���ʊ֐��F �莝���ɂ��΂ꂤ���ǂ肪���邩���肷��
//------------------------------------------------------
// �������F�Ȃ�
// �߂�l  �F���� �� true / ���Ȃ� �� false
//======================================================
function uCheckHighJumpMonsterKind()
{
	local o_kind = 0;
	local count  = 0;
	local monster_id = 157; // ���΂ꂤ���ǂ��ID��157

	// ���������X�^�[�̒��ɂ��΂ꂤ���ǂ肪���邩���m�F
	for(count = 0; count <= ( GetOwnerMonsterNum_() - 1 ); count++){
		o_kind = GetOwnerMonsterKind_(count);
		DebugPrint("���������X�^�[ " + (count+1) + " �̖ڂ̎푰ID�� " + o_kind + " �ł�");
		if(o_kind == monster_id){
			DebugPrint("���������X�^�[�ɑ�W�����v�����X�^�[�͂��܂�");
			return true;
		}
	}
	DebugPrint("��W�����v�����X�^�[�͂��܂���");
	return false;
}

