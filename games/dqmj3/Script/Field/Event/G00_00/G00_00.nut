//===================== G00_00���y�̗쓹 ====================
//---------------------------------
// ����Ԃ̗V�тŎg�p����萔
//---------------------------------
// �M�~�b�N�̋N���ƃN���A�t���O
const GIMMICK_FLG			 = "BFG_SPACE_GIMMICK_GRAVE";
const GIMMICK_CLEAR_FLG		 = "BFG_SPACE_GIMMICK_GRAVE_1ST_CLEAR";

// ��l���̕��A�ʒu�ƌ���
const XPOS_1				 = -133.978;	// ��ՃX�C�b�`�t��
const YPOS_1				 = 1002.629;
const ZPOS_1				 = -886.804;
const DIR_1					 = 65;

const XPOS_2				 = 1919.0;		// �S�[���{�X�̎�O
const YPOS_2				 = 1171.0;
const ZPOS_2				 = 213.0;
const DIR_2					 = 145;

// �[���f���Ŏg�p����J�����̃m�[�h��
const CAMERA_EYE			 = "cameye_004";
const CAMERA_TGT			 = "camtgt_004";

// ��ՃX�C�b�`���N��������ׂ̌�ID
const GIMMICK_KEY_ID		 = 903;

// ��ՃX�C�b�`���N�����������̃��b�Z�[�WID
const GIMMICK_MSG_ID		 = "MASTERS_LOAD_REACTOR_MSG_015";

// ��ՃX�C�b�`�N����̍Đ��f���i���o�[
const DEMO_NUM				 = 222;

// �{�X�����X�^�[��ID (1=����, 2=2��ڈȍ~)
const BOSS_ID_1				 = "m181_00";	// ���W�}����
const BOSS_ID_2				 = "m181_00";	// ���W�}����

// �{�X�����X�^�[��Exchange�pID
const BOSS_EXCHANGE_ID		 = 486;			// ���W�}����

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
const BOSS_PARTY_TABLE_1	 = 157;
const BOSS_PARTY_TABLE_2	 = 157;

// �{�X�𒇊Ԃɂ���ۂ̃����X�^�[�p�����[�^ (1=����, 2=2��ڈȍ~)
const BOSS_PARAMETER_1		 = 1805;
const BOSS_PARAMETER_2		 = 1805;

// �{�X���Ԍ�̃}�b�v�`�F���WID
const MAP_ID				 = "G00_00";


//------------------------------------------------
//		�퓬�I����
//------------------------------------------------
function AfterBattle()
{
	// �t���O�̏�Ԃ��擾
	local main_num  = GetNumFlg_("NUM_SCENARIO_MAIN");
	local grave_num = GetNumFlg_("NUM_SCENARIO_SUB_GRAVE");
	//�u���h���h�̎艺�Ɛ������
	local bit_figth_key_npc_a = GetEventFlg_("BFG_BATTLE_BUNDORUDO_RETAINER_A");
	local bit_figth_key_npc_b = GetEventFlg_("BFG_BATTLE_BUNDORUDO_RETAINER_B");
	local bit_figth_key_npc_c = GetEventFlg_("BFG_BATTLE_BUNDORUDO_RETAINER_C");

	// �u���h���h�̎艺�ɕ��������Ƀt���O��ύX���鏈���i�v���Ӂj
	// �C�x���g�u���b�N��EventStartOperate()�ł͔s�k�𔻒�ł��Ȃ��̂�
	// �����Ŕs�k�̔���ƃt���O�ύX���s���B
	if(main_num == GetFlagID_("CONST_SM_CEMETERY")){				// Num0 = 3
		if(grave_num == GetFlagID_("CONST_SS_CC_FIND_THE_GHOST")){	// Num4 = 2
			if(bit_figth_key_npc_a == true){
				// ���u���h���h�̎艺A�ɔs�k
				if(GetBattleEndType_() == END_TYPE_LOSE){
					//�u���h���h�̎艺A�Ɛ키�O�̃t���O�ɖ߂�
					SetEventFlg_("BFG_BATTLE_BUNDORUDO_RETAINER_A", false);
					// �S�ł�����v���C���[�̔�\��������
					local player = GetPlayerId_();
					SetVisible(player, true);
				}
			}
			if(bit_figth_key_npc_b == true){
				// ���u���h���h�̎艺B�ɔs�k
				if(GetBattleEndType_() == END_TYPE_LOSE){
					//�u���h���h�̎艺B�Ɛ키�O�̃t���O�ɖ߂�
					SetEventFlg_("BFG_BATTLE_BUNDORUDO_RETAINER_B", false);
					// �S�ł�����v���C���[�̔�\��������
					local player = GetPlayerId_();
					SetVisible(player, true);
				}
			}
			if(bit_figth_key_npc_c == true){
				// ���u���h���h�̎艺C�ɔs�k
				if(GetBattleEndType_() == END_TYPE_LOSE){
					//�u���h���h�̎艺C�Ɛ키�O�̃t���O�ɖ߂�
					SetEventFlg_("BFG_BATTLE_BUNDORUDO_RETAINER_C", false);
					// �S�ł�����v���C���[�̔�\��������
					local player = GetPlayerId_();
					SetVisible(player, true);
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
	local grave_num  = GetNumFlg_("NUM_SCENARIO_SUB_GRAVE");					// Num4
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
//		�t�F�[�h�C��
//------------------------------------------------
function FadeIn()
{
	// �}�b�v���B�t���O
	SetEventFlg_("BFG_ARRIVE_AT_G00", true);
	// �Z�[�u�֎~������(�Z�[�u�֎~�}�b�v����A���Ă������p)
	SetEventFlg_("BFG_SAVE_PROHIBIT", false);		// �Z�[�u�֎~(Bit451)

	// �t���O�̏�Ԃ��擾
	local main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");				// Num0
	local grave_num	 = GetNumFlg_("NUM_SCENARIO_SUB_GRAVE");		// Num4
	local ice_num	 = GetNumFlg_("NUM_SCENARIO_SUB_ICE");			// Num5
	local check_dead = GetEventFlg_("BFG_DEAD_RETURN");
	local mantan_flg = GetEventFlg_("BFG_EXAMINE_FULLTANK_STELE");
	local first_demo = GetEventFlg_("BFG_PLAYED_GRAVE_SCENE_DEMO");	//�S�i�f�����������ǂ���
	
	// �J�M����t���O
	local bit_key1 = GetEventFlg_("BFG_GET_GATE_KEY_1ST");
	local bit_key2 = GetEventFlg_("BFG_GET_GATE_KEY_2ND");
	local bit_key3 = GetEventFlg_("BFG_GET_GATE_KEY_3RD");
	
	// �傪�J�����t���O
	local bit_door_open1 = GetEventFlg_("BFG_OPEN_GATE_1ST");
	local bit_door_open2 = GetEventFlg_("BFG_OPEN_GATE_2ND");
	local bit_door_open3 = GetEventFlg_("BFG_OPEN_GATE_3RD");
	
	// �Ïؔԍ��̔����J�����t���O
	local bit_lock_door_open = GetEventFlg_("BFG_OPEN_PASSWORD_DOOR");
	
	// ���Ԃ̐ݒ�
	if(main_num == GetFlagID_("CONST_SM_CEMETERY")){					// Num0 = 3
		if(grave_num <= GetFlagID_("CONST_SS_CC_GET_RACE_PROGRAM")){	// Num4 = 17
			// �V�i���I�i�s���͖�iᏋC�j�ɐݒ�
			SetTime_(8700);
		}
	}
	
	// �����̍Đ�
	if(main_num == GetFlagID_("CONST_SM_CEMETERY")){				// Num0 = 3
		if(first_demo == false){									// �S�i�f�����܂����Ă��Ȃ��ꍇ
			SetEventFlg_("BFG_G00_00_ENVIRONMENT_BGM_PLAY", true);	// �������Đ�����
		}
	}
	// �X���V�i���I�ȍ~
	else if(main_num >= GetFlagID_("CONST_SM_ICE_FIELD")){			// Num0 = 4
		// �����ƃ}�b�vBGM�̍Đ��t���O��OFF�ɂ���
		SetEventFlg_("BFG_G00_00_ENVIRONMENT_BGM_PLAY", false);
		SetEventFlg_("BFG_G00_00_EVENT_BGM012_PLAY", false);
	}
	
	DebugPrint(" ");
	DebugPrint("NUM_SCENARIO_MAIN �̒l�� " + main_num + " �ɂȂ�܂����B");

	//---------------
	// ���M�~�b�N�z�u
	//---------------
	// ID������
	g_lock_door		 <- C_NONE_ID;
	g_key_door_01	 <- C_NONE_ID;
	g_key_door_02	 <- C_NONE_ID;
	g_key_door_03	 <- C_NONE_ID;
	g_transfer01	 <- C_NONE_ID;
	g_transfer02	 <- C_NONE_ID;
	g_rulerpoint01	 <- C_NONE_ID;
	g_rulerpoint02	 <- C_NONE_ID;
	g_keyhole		 <- C_NONE_ID;
	
	// ���\�[�X�ǂݍ���
	local id_transfer		 = ReadGimmick_("o_com_01");	// �]�����u
	local id_rulerpoint01	 = ReadGimmick_("o_com_08");	// ���[���|�C���g
	
	// ���A���f�b�h�K�[�f���̖�@
	if(bit_door_open1 == false){
		local id_door_red = ReadGimmick_("o_G00_00");		// �A���f�b�h�K�[�f���̔�(��)
		g_key_door_01 = ArrangePointGimmick_("o_G00_00", id_door_red, "g_key_door01");
	}

	// ���A���f�b�h�K�[�f���̖�A
	if(bit_door_open2 == false){
		local id_door_green = ReadGimmick_("o_G00_01");		// �A���f�b�h�K�[�f���̔�(��)
		g_key_door_02 = ArrangePointGimmick_("o_G00_01", id_door_green, "g_key_door02");
	}

	// ���A���f�b�h�K�[�f���̖�B
	if(bit_door_open3 == false){
		local id_door_brue = ReadGimmick_("o_G00_02");		// �A���f�b�h�K�[�f���̔�(��)
		g_key_door_03 = ArrangePointGimmick_("o_G00_02", id_door_brue, "g_key_door03");
	}

	// ���Ïؔԍ��̔�
	if(bit_lock_door_open == false){
		local id_door_pass = ReadGimmick_("o_G00_03");		// �Ïؔԍ��̔�
		g_lock_door = ArrangePointGimmick_("o_G00_03", id_door_pass, "g_door");
	}

	// ���]�����u(�����s�s�s)
	g_transfer01 = ArrangePointGimmick_("o_com_01", id_transfer, "g_transfer01");

	// ���]�����u(�����̕X���s)
	g_transfer02 = ArrangePointGimmick_("o_com_01", id_transfer, "g_transfer02");

	// �����[���|�C���g(�A���f�b�h�K�[�f������)
	g_rulerpoint01 = ArrangePointGimmick_("o_com_08", id_rulerpoint01, "g_rulerpoint01");
	SetMotion_(g_rulerpoint01, "GIMMICK_0", 0);
	if(GetEventFlg_("BFG_RULER_ADD_009") == true){
		SetMotion_(g_rulerpoint01, "GIMMICK_2", 0);
	}

	// �����[���|�C���g(�����L��)
	g_rulerpoint02 = ArrangePointGimmick_("o_com_08", id_rulerpoint01, "g_rulerpoint02");
	SetMotion_(g_rulerpoint02, "GIMMICK_0", 0);
	if(GetEventFlg_("BFG_RULER_ADD_031") == true){
		SetMotion_(g_rulerpoint02, "GIMMICK_2", 0);
	}
	
	
	//----------
	// ��NPC�z�u
	//----------
	// ID������
	g_gost_npc_a	 <- C_NONE_ID;
	g_gost_npc_b	 <- C_NONE_ID;
	g_gost_npc_c	 <- C_NONE_ID;
	g_gost_npc_h	 <- C_NONE_ID;
	g_key_npc_a		 <- C_NONE_ID;
	g_key_npc_a_sub	 <- C_NONE_ID;
	g_key_npc_b_sub	 <- C_NONE_ID;
	g_key_npc_c_sub	 <- C_NONE_ID;
	g_key_npc_b		 <- C_NONE_ID;
	g_key_npc_c		 <- C_NONE_ID;
	g_keyhole_npc	 <- C_NONE_ID;

	// NPC�̔z�u
	// �������X�^�[�̗H��`
	if(main_num == GetFlagID_("CONST_SM_CEMETERY")){						// Num0 = 3
		if(grave_num == GetFlagID_("CONST_SS_CC_GET_RACE_PROGRAM")){		// Num4 = 17
			local id_npc_gost  = ReadNpc_("m100_01");						// ���\�[�X�ǂݍ���
			g_gost_npc_a  = ArrangePointNpc_(id_npc_gost,  "NPC_06");		// �����X�^�[�̗H��A
			SetTalkEnable_(g_gost_npc_a, false);							// ��b�A�C�R����\��
			SetScaleSilhouette(g_gost_npc_a, SCALE.S, SILHOUETTE_WIDTH.S);
			SetReactorMsg_(g_gost_npc_a, "GRAVE_NPC_GOST_REC");
		}
		if(grave_num == GetFlagID_("CONST_SS_CC_CLEAR_CEMETERY")){			// Num4 = 18
			local id_npc_gost  = ReadNpc_("m100_01");						// ���\�[�X�ǂݍ���
			g_gost_npc_a  = ArrangePointNpc_(id_npc_gost,  "NPC_06");		// �����X�^�[�̗H��A
			SetScaleSilhouette(g_gost_npc_a, SCALE.S, SILHOUETTE_WIDTH.S);
			SetReactorMsg_(g_gost_npc_a, "GRAVE_NPC_GOST_REC");
		}
	}
	// �X���V�i���I�ȍ~
	else if(main_num >= GetFlagID_("CONST_SM_ICE_FIELD")){					// Num0 = 4 �ȏ�
		local id_npc_gost  = ReadNpc_("m100_01");							// ���\�[�X�ǂݍ���
		g_gost_npc_a  = ArrangePointNpc_(id_npc_gost,  "NPC_06");			// �����X�^�[�̗H��A
		SetScaleSilhouette(g_gost_npc_a, SCALE.S, SILHOUETTE_WIDTH.S);
		SetReactorMsg_(g_gost_npc_a, "GRAVE_NPC_GOST_REC");
	}
	
	// �������X�^�[�̗H��a�|�b�|�g
	if(main_num == GetFlagID_("CONST_SM_CEMETERY")){						// Num0 = 3
		if(grave_num >= GetFlagID_("CONST_SS_CC_FIND_THE_GHOST")){			// Num4 = 2
			local id_npc_gost  = ReadNpc_("m100_01");						// ���\�[�X�ǂݍ���
			g_gost_npc_b  = ArrangePointNpc_(id_npc_gost,  "NPC_04");		// �����X�^�[�̗H��a
			SetSearchableAngle_(g_gost_npc_b, SEARCHABLE_ANGLE_WIDE);		// ��b�\�p�x��ݒ�
			SetScaleSilhouette(g_gost_npc_b, SCALE.S, SILHOUETTE_WIDTH.S);
			SetReactorMsg_(g_gost_npc_b, "GRAVE_NPC_GOST_REC");
			
			g_gost_npc_c  = ArrangePointNpc_(id_npc_gost,  "NPC_05");		// �����X�^�[�̗H��b
			SetScaleSilhouette(g_gost_npc_c, SCALE.S, SILHOUETTE_WIDTH.S);
			SetReactorMsg_(g_gost_npc_c, "GRAVE_NPC_GOST_REC");
			
			g_gost_npc_h  = ArrangePointNpc_(id_npc_gost,  "NPC_07");		// �����X�^�[�̗H��g
			SetScaleSilhouette(g_gost_npc_h, SCALE.S, SILHOUETTE_WIDTH.S);
			SetReactorMsg_(g_gost_npc_h, "GRAVE_NPC_GOST_REC");
		}
	}
	else if(main_num >= 4){
		local id_npc_gost  = ReadNpc_("m100_01");							// ���\�[�X�ǂݍ���
		g_gost_npc_b  = ArrangePointNpc_(id_npc_gost,  "NPC_04");			// �����X�^�[�̗H��a
		SetSearchableAngle_(g_gost_npc_b, SEARCHABLE_ANGLE_WIDE);			// ��b�\�p�x��ݒ�
		SetScaleSilhouette(g_gost_npc_b, SCALE.S, SILHOUETTE_WIDTH.S);
		SetReactorMsg_(g_gost_npc_b, "GRAVE_NPC_GOST_REC");
		
		g_gost_npc_c  = ArrangePointNpc_(id_npc_gost,  "NPC_05");			// �����X�^�[�̗H��b
		SetScaleSilhouette(g_gost_npc_c, SCALE.S, SILHOUETTE_WIDTH.S);
		SetReactorMsg_(g_gost_npc_c, "GRAVE_NPC_GOST_REC");
			
		g_gost_npc_h  = ArrangePointNpc_(id_npc_gost,  "NPC_07");			// �����X�^�[�̗H��g
		SetScaleSilhouette(g_gost_npc_h, SCALE.S, SILHOUETTE_WIDTH.S);
		SetReactorMsg_(g_gost_npc_h, "GRAVE_NPC_GOST_REC");
	}

	// ���u���h���h�̎艺�`�|�b
	if(main_num == GetFlagID_("CONST_SM_CEMETERY")){						// Num0 = 3
		if(grave_num == GetFlagID_("CONST_SS_CC_FIND_THE_GHOST")){			// Num4 = 2
			// �艺�`(�ق˃R�E����)
			if(bit_key1 == false){
				local id_key_npc_a = ReadNpc_("m097_02");					// ���\�[�X�ǂݍ���
				g_key_npc_a  = ArrangePointNpc_(id_key_npc_a,  "NPC_01");	// �u���h���h�̎艺A
				SetTalkTurn_(g_key_npc_a, false);							// �b�������Ă��U������Ȃ�
				SetSearchableAngle_(g_key_npc_a, SEARCHABLE_ANGLE_WIDE);	// ��b�\�p�x��ݒ�
				SetScaleSilhouette(g_key_npc_a, SCALE.N, SILHOUETTE_WIDTH.N);
				SetReactorMsg_(g_key_npc_a, "GRAVE_NPC_A_REC");
				
				g_key_npc_a_sub  = ArrangePointNpc_(id_key_npc_a,  "NPC_01");// �u���h���h�̎艺A(�T�u)
				SetScaleSilhouette(g_key_npc_a_sub, SCALE.N, SILHOUETTE_WIDTH.N);
				SetVisible(g_key_npc_a_sub, false);
				
				// �}�b�v�i�r�Ɂu!�v�\��
				g_map_navi_enemy_01 <- ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "NPC_01");
			}
			// �艺�a(�`���[���o�b�g)
			if(bit_key2 == false){
				local id_key_npc_b = ReadNpc_("m097_01");					// ���\�[�X�ǂݍ���
				g_key_npc_b  = ArrangePointNpc_(id_key_npc_b,  "NPC_02");	// �u���h���h�̎艺B
				SetTalkTurn_(g_key_npc_b, false);							// �b�������Ă��U������Ȃ�
				SetSearchableAngle_(g_key_npc_b, SEARCHABLE_ANGLE_WIDE);	// ��b�\�p�x��ݒ�
				SetScaleSilhouette(g_key_npc_b, SCALE.N, SILHOUETTE_WIDTH.N);
				SetReactorMsg_(g_key_npc_b, "GRAVE_NPC_B_REC");
				
				g_key_npc_b_sub  = ArrangePointNpc_(id_key_npc_b,  "NPC_02");// �u���h���h�̎艺B(�T�u)
				SetScaleSilhouette(g_key_npc_b_sub, SCALE.N, SILHOUETTE_WIDTH.N);
				SetVisible(g_key_npc_b_sub, false);
				
				// �}�b�v�i�r�Ɂu!�v�\��
				g_map_navi_enemy_02 <- ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "NPC_02");
			}
			// �艺�b(�R�[�v�X�t���C)
			if(bit_key3 == false){
				local id_key_npc_c = ReadNpc_("m097_03");					// ���\�[�X�ǂݍ���
				g_key_npc_c  = ArrangePointNpc_(id_key_npc_c,  "NPC_03");	// �u���h���h�̎艺C
				SetTalkTurn_(g_key_npc_c, false);							// �b�������Ă��U������Ȃ�
				SetSearchableAngle_(g_key_npc_c, SEARCHABLE_ANGLE_WIDE);	// ��b�\�p�x��ݒ�
				SetScaleSilhouette(g_key_npc_c, SCALE.N, SILHOUETTE_WIDTH.N);
				SetReactorMsg_(g_key_npc_c, "GRAVE_NPC_C_REC");
				
				g_key_npc_c_sub  = ArrangePointNpc_(id_key_npc_c,  "NPC_03");// �u���h���h�̎艺B(�T�u)
				SetScaleSilhouette(g_key_npc_c_sub, SCALE.N, SILHOUETTE_WIDTH.N);
				SetVisible(g_key_npc_c_sub, false);
				
				// �}�b�v�i�r�Ɂu!�v�\��
				g_map_navi_enemy_03 <- ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "NPC_03");
			}
		}
	}
	
	//-----------
	// ���n���z�u
	//-----------
	// ID������
	g_mine_transfer01	<- C_NONE_ID;
	g_mine_transfer02	<- C_NONE_ID;
	g_mine_key_door_01	<- C_NONE_ID;
	g_mine_key_door_02	<- C_NONE_ID;
	g_mine_key_door_03	<- C_NONE_ID;
	g_mine_01			<- C_NONE_ID;
	g_mine_01_b			<- C_NONE_ID;
	g_mine_01_c			<- C_NONE_ID;
	g_mine_lock_door	<- C_NONE_ID;
	g_mine_ruler_01		<- C_NONE_ID;
	g_mine_ruler_02		<- C_NONE_ID;
	g_mine_mantan		<- C_NONE_ID;
	g_mine_keyhole		<- C_NONE_ID;
	g_mine_keyhole_npc 	<- C_NONE_ID;
	
	// ���嗤�ړ����u(�����s�s�s)
	g_mine_transfer01 = SetPointCircleEventMine_("mine_transfer01", true);

	// ���嗤�ړ����u(�����̕X���s)
	g_mine_transfer02 = SetPointCircleEventMine_("mine_transfer02", true);

	// �����[���|�C���g(�A���f�b�h�K�[�f������)
	g_mine_ruler_01 = SetPointCircleEventMine_("mine_ruler_01", true);

	// �����[���|�C���g(�����L��)
	g_mine_ruler_02 = SetPointCircleEventMine_("mine_ruler_02", true);

	// ���u�܂񂽂�v�̐Δ�
	if(mantan_flg == false){
		g_mine_mantan = SetPointCircleEventMine_("mine_mantan", true);
	}

	if(main_num == GetFlagID_("CONST_SM_CEMETERY")){						// Num0 = 3
		// ���A���f�b�h�K�[�f���̖�@
		if(bit_door_open1 == false){
			g_mine_key_door_01 = SetPointCircleEventMine_("mine_key_door01", true);
		}
		// ���A���f�b�h�K�[�f���̖�A
		else if(bit_door_open2 == false){
			g_mine_key_door_02 = SetPointCircleEventMine_("mine_key_door02", true);
		}
		// ���A���f�b�h�K�[�f���̖�B
		else if(bit_door_open3 == false){
			g_mine_key_door_03 = SetPointCircleEventMine_("mine_key_door03", true);
		}
		// ���ړ����u�t�߂ő҂��Ă��郂���X�^�[�̗H��`
		if(grave_num == GetFlagID_("CONST_SS_CC_GET_RACE_PROGRAM")){		// Num4 = 17
			g_mine_01   = SetPointBoxEventMine_("mine01", false);
			g_mine_01_b = SetPointBoxEventMine_("mine01_b", false);
			g_mine_01_c = SetPointBoxEventMine_("mine01_c", false);
		}
		// ���Ïؔԍ��̔�
		if(bit_lock_door_open == false){
			if(grave_num <= GetFlagID_("CONST_SS_CC_GET_RACE_PROGRAM")){	// Num4 = 17
				g_mine_lock_door = SetPointCircleEventMine_("mine_lock_door", true);
			}
		}
	}
	
	
	//-------------------------
	// �����A�N�^�[�|�C���g�z�u
	//-------------------------
	// ID������
	g_reactorPoint14	<- C_NONE_ID;
	g_reactorPoint16	<- C_NONE_ID;
	g_reactorPoint17	<- C_NONE_ID;
	g_reactorPoint18	<- C_NONE_ID;

	// ���ړ����u�i�����s�s�s�j
	local reactorPoint01 = ArrangeMsgReactorPoint("recpoint_transfer01", GetFlagID_("BFG_REACTER_POINT_015")// Bit_1514 �ړ����u
		, SHORT_DIST, "REC_POINT_TRANSFER_01", "REC_POINT_TRANSFER_02");
	
	// ���ړ����u�i�����̕X���s�j
	local reactorPoint02 = ArrangeMsgReactorPoint("recpoint_transfer02", GetFlagID_("BFG_REACTER_POINT_015")// Bit_1514 �ړ����u
		, SHORT_DIST, "REC_POINT_TRANSFER_01", "REC_POINT_TRANSFER_03");
	
	// ���l�I���p�[�N�i����j
	local reactorPoint04 = ArrangeMsgReactorPoint("recpoint_park_south", GetFlagID_("BFG_REACTER_POINT_177")// Bit_1676 �l�I���p�[�N���
		, SHORT_DIST, "REC_POINT_PARK_01", "REC_POINT_PARK_02");
	
	// ���l�I���p�[�N�i�k���j
	local reactorPoint03 = ArrangeMsgReactorPoint("recpoint_park_north", GetFlagID_("BFG_REACTER_POINT_178")// Bit_1677 �l�I���p�[�N�k��
		, SHORT_DIST, "REC_POINT_PARK_03", "REC_POINT_PARK_04");
	
	// ���h��ȕ�P
	local reactorPoint05 = ArrangeMsgReactorPoint("recpoint_grave01", GetFlagID_("BFG_REACTER_POINT_096")// Bit_1595 �h��ȕ�
		, SHORT_DIST, "REC_POINT_GRAVE_01", "REC_POINT_GRAVE_02");
	
	// ���h��ȕ�Q
	local reactorPoint06 = ArrangeMsgReactorPoint("recpoint_grave02", GetFlagID_("BFG_REACTER_POINT_096")// Bit_1595 �h��ȕ�
		, SHORT_DIST, "REC_POINT_GRAVE_01", "REC_POINT_GRAVE_02");
	
	// ���h��ȕ�R
	local reactorPoint07 = ArrangeMsgReactorPoint("recpoint_grave03", GetFlagID_("BFG_REACTER_POINT_096")// Bit_1595 �h��ȕ�
		, SHORT_DIST, "REC_POINT_GRAVE_01", "REC_POINT_GRAVE_02");
	
	// ���ł̎��n�тP
	local reactorPoint08 = ArrangeMsgReactorPoint("recpoint_doku_numa01", GetFlagID_("BFG_REACTER_POINT_097")// Bit_1596 �ł̎��n��
		, SHORT_DIST, "REC_POINT_DOKU_NUMA_01", "REC_POINT_DOKU_NUMA_02");
	
	// ���ł̎��n�тQ
	local reactorPoint09 = ArrangeMsgReactorPoint("recpoint_doku_numa02", GetFlagID_("BFG_REACTER_POINT_097")// Bit_1596 �ł̎��n��
		, SHORT_DIST, "REC_POINT_DOKU_NUMA_01", "REC_POINT_DOKU_NUMA_02");
	
	// ���ł̎��n�тR
	local reactorPoint10 = ArrangeMsgReactorPoint("recpoint_doku_numa03", GetFlagID_("BFG_REACTER_POINT_097")// Bit_1596 �ł̎��n��
		, SHORT_DIST, "REC_POINT_DOKU_NUMA_01", "REC_POINT_DOKU_NUMA_02");
	
	// ���ł̐[��
	local reactorPoint11 = ArrangeMsgReactorPoint("recpoint_doku_ike", GetFlagID_("BFG_REACTER_POINT_098")// Bit_1597 �ł̐[��
		, SHORT_DIST, "REC_POINT_DOKU_IKE_01", "REC_POINT_DOKU_IKE_02");
	
	// ���C��g���l��
	local reactorPoint12 = ArrangeMsgReactorPoint("recpoint_tunnel", GetFlagID_("BFG_REACTER_POINT_099")// Bit_1598 �C��g���l��
		, SHORT_DIST, "REC_POINT_TUNNEL_01", "REC_POINT_TUNNEL_02");
	
	// ���A���f�b�h�K�[�f��
	local reactorPoint13 = ArrangeMsgReactorPoint("recpoint_undead_garden", GetFlagID_("BFG_REACTER_POINT_151")// Bit_1650 �A���f�b�h�K�[�f��
		, SHORT_DIST, "REC_POINT_UNDEAD_GARDEN_01", "REC_POINT_UNDEAD_GARDEN_02");
	
	// ���閧�̈Ïؔ�
	if(bit_lock_door_open == false){
		g_reactorPoint14 = ArrangeMsgReactorPoint("recpoint_door", GetFlagID_("BFG_REACTER_POINT_152")// Bit_1651 �閧�̈Ïؔ�
			, SHORT_DIST, "REC_POINT_DOOR_01", "REC_POINT_DOOR_02");
	}
	
	// ���R�A
	local reactorPoint15 = ArrangeMsgReactorPoint("recpoint_core", GetFlagID_("BFG_REACTER_POINT_001")// Bit_1500 �R�A
		, ENDLESS_DIST, "REC_POINT_CORE_01", "REC_POINT_CORE_02");
	
	// ���o���P�[�h�`
	if(bit_door_open1 == false){
		g_reactorPoint16 = ArrangeMsgReactorPoint("recpoint_barikedo01", GetFlagID_("BFG_REACTER_POINT_153")// Bit_1652 �o���P�[�h�`
			, SHORT_DIST, "REC_POINT_BARIKEDO_A_01", "REC_POINT_BARIKEDO_A_02");
	}
	
	// ���o���P�[�h�a
	if(bit_door_open2 == false){
		g_reactorPoint17 = ArrangeMsgReactorPoint("recpoint_barikedo02", GetFlagID_("BFG_REACTER_POINT_154")// Bit_1653 �o���P�[�h�a
			, SHORT_DIST, "REC_POINT_BARIKEDO_B_01", "REC_POINT_BARIKEDO_B_02");
	}
	
	// ���o���P�[�h�b
	if(bit_door_open3 == false){
		g_reactorPoint18 = ArrangeMsgReactorPoint("recpoint_barikedo03", GetFlagID_("BFG_REACTER_POINT_155")// Bit_1654 �o���P�[�h�b
			, SHORT_DIST, "REC_POINT_BARIKEDO_C_01", "REC_POINT_BARIKEDO_C_02");
	}
	
	// �����[���|�C���g(�A���f�b�h�K�[�f������)
	local reactorPoint19 = ArrangeMsgReactorPoint("recpoint_ruler_01", GetFlagID_("BFG_REACTER_POINT_010")// Bit_1509 ���[���|�C���g
		, SHORT_DIST, "REC_POINT_RULER_01", "REC_POINT_RULER_02");
	
	// �����[���|�C���g(�����L��)
	local reactorPoint20 = ArrangeMsgReactorPoint("recpoint_ruler_02", GetFlagID_("BFG_REACTER_POINT_010")// Bit_1509 ���[���|�C���g
		, SHORT_DIST, "REC_POINT_RULER_01", "REC_POINT_RULER_02");
	
	// ���V���̒�
	local reactorPoint21 = ArrangeMsgReactorPoint("recpoint_keyhole", GetFlagID_("BFG_REACTER_POINT_176")
		, SHORT_DIST, "REC_POINT_HASHIRA_01", "REC_POINT_HASHIRA_02");
	
	//-----------------
	// ���}�b�v�i�r�z�u
	//-----------------
	// ���ړI�n
	// ���[�J���錾
	local navi_neon		 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.DESTINATION, "map_navi_neon");		// �l�I���p�[�N
	local navi_garden	 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.DESTINATION, "map_navi_garden");	// �A���f�b�h�K�[�f��
	// �O���[�o���錾
	g_navi_lock		 <- ArrangePointNaviMapIcon_(NAVIMAP_ICON.DESTINATION, "map_navi_lock");		// �Ïؔԍ��̔�
	g_navi_transfer	 <- ArrangePointNaviMapIcon_(NAVIMAP_ICON.DESTINATION, "map_navi_transfer");	// �X���s�̈ړ����u
	SetNaviMapIconVisible_(navi_neon, false);
	SetNaviMapIconVisible_(navi_garden, false);
	SetNaviMapIconVisible_(g_navi_lock, false);
	SetNaviMapIconVisible_(g_navi_transfer, false);
	
	if(main_num == GetFlagID_("CONST_SM_CEMETERY")){							// Num0 = 3
		if(grave_num <= GetFlagID_("CONST_SS_CC_GO_TO_THE_NEON_PARK")){			// Num4 = 1 �ȉ�
			SetNaviMapIconVisible_(navi_neon, true);
		}
		else if(grave_num <= GetFlagID_("CONST_SS_CC_TAKE_OVER_VOLITION_2")){	// Num4 = 15 �ȉ�
			SetNaviMapIconVisible_(navi_garden, true);
		}
		else if(grave_num <= GetFlagID_("CONST_SS_CC_GET_RACE_PROGRAM")){		// Num4 = 17 �ȉ�
			// �Ïؔԍ��̔����J�����ꍇ
			if(bit_lock_door_open == true){										// Bit1114
				SetNaviMapIconVisible_(g_navi_lock, false);
				SetNaviMapIconVisible_(g_navi_transfer, true);
			}else{
				SetNaviMapIconVisible_(g_navi_lock, true);
				SetNaviMapIconVisible_(g_navi_transfer, false);
			}
		}
		else{
			SetNaviMapIconVisible_(g_navi_transfer, true);
		}
	}
	
	// �����[���|�C���g�A�C�R��(�A���f�b�h�K�[�f������)
	if(GetEventFlg_("BFG_RULER_ADD_009") == true){	// Bit_209 ���[���ǉ� �A���f�b�h�K�[�f��
		local icon_ruler_01 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.RULER_POINT , "g_rulerpoint01");
		SetNaviMapIconVisible_(icon_ruler_01, true);
	}
	
	// �����[���|�C���g�A�C�R��(�����L��)
	if(GetEventFlg_("BFG_RULER_ADD_031") == true){	// Bit_209 ���[���ǉ� �A���f�b�h�K�[�f��
		local icon_ruler_02 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.RULER_POINT , "g_rulerpoint02");
		SetNaviMapIconVisible_(icon_ruler_02, true);
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
//		�C�x���g�X�^�[�g
//------------------------------------------------
function EventStartOperate()
{
// �t���O�̏�Ԃ��擾
	local main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");
	local grave_num	 = GetNumFlg_("NUM_SCENARIO_SUB_GRAVE");
	local first_demo = GetEventFlg_("BFG_PLAYED_GRAVE_SCENE_DEMO");	//�S�i�f�����������ǂ���
	//�u���h���h�̎艺�Ɛ������
	local bit_figth_key_npc_a = GetEventFlg_("BFG_BATTLE_BUNDORUDO_RETAINER_A");
	local bit_figth_key_npc_b = GetEventFlg_("BFG_BATTLE_BUNDORUDO_RETAINER_B");
	local bit_figth_key_npc_c = GetEventFlg_("BFG_BATTLE_BUNDORUDO_RETAINER_C");
	
	local player = GetPlayerId_();	// �v���C���[ID�擾
	local efc_death;				// �u���h���h�̎艺���ŃG�t�F�N�g�p
	// �K�[�f���̃J�M��ID
	local garden_key_id = 951;
	
	// �������X�^�[�̗H��`�𔼓����ɂ���
	if(main_num == GetFlagID_("CONST_SM_CEMETERY")){				// Num0 = 3
		if(grave_num >= GetFlagID_("CONST_SS_CC_GET_RACE_PROGRAM")){// Num4 = 17 �ȏ�
			SetManualCalcAlpha_(g_gost_npc_a, true);
			SetAlpha_(g_gost_npc_a, 0.3);
		}
	}
	else if(main_num >= GetFlagID_("CONST_SM_ICE_FIELD")){			// Num0 = 4 �ȏ�
		SetManualCalcAlpha_(g_gost_npc_a, true);
		SetAlpha_(g_gost_npc_a, 0.3);
	}
	// �������X�^�[�̗H��a�|�b�|�g�𔼓����ɂ���
	if(main_num == GetFlagID_("CONST_SM_CEMETERY")){				// Num0 = 3
		if(grave_num >= GetFlagID_("CONST_SS_CC_FIND_THE_GHOST")){	// Num4 = 2
			SetManualCalcAlpha_(g_gost_npc_b, true);
			SetAlpha_(g_gost_npc_b, 0.3);
			
			SetManualCalcAlpha_(g_gost_npc_c, true);
			SetAlpha_(g_gost_npc_c, 0.3);
			
			SetManualCalcAlpha_(g_gost_npc_h, true);
			SetAlpha_(g_gost_npc_h, 0.3);
		}
	}
	else if(main_num >= GetFlagID_("CONST_SM_ICE_FIELD")){			// Num0 = 4
		SetManualCalcAlpha_(g_gost_npc_b, true);
		SetAlpha_(g_gost_npc_b, 0.3);
		
		SetManualCalcAlpha_(g_gost_npc_c, true);
		SetAlpha_(g_gost_npc_c, 0.3);
		
		SetManualCalcAlpha_(g_gost_npc_h, true);
		SetAlpha_(g_gost_npc_h, 0.3);
	}

//---------------------------------------------------------------------------------------
// �f���̍Đ�
	if(main_num == GetFlagID_("CONST_SM_CEMETERY")){					// Num0 = 3
		// ���͂��߂Ċ��y�̗쓹�ɓ��������̃f��
		if(first_demo == false){										// �܂��f������x�����Ă��Ȃ��ꍇ
			local route = GetEnteredMapChangeNullName_();				// �ǂ���������ė����̂����擾����
			DebugPrint(" ���[�g�̒l�� "+ route +" �ł� ");
			if(route == "w_G01_00BLdr_005"){							// �o�����k�傾�����ꍇ
				SetEventFlg_("BFG_PLAYED_GRAVE_SCENE_DEMO", true);		// �S�i�f�����������ǂ���
				SetEventFlg_("BFG_RULER_ADD_008", true);				// �l�I���p�[�N�k���̃��[���|�C���g���
				SetEventFlg_("BFG_G00_00_ENVIRONMENT_BGM_PLAY", false);	// �������~�߂�
				SetEventFlg_("BFG_G00_00_EVENT_BGM012_PLAY", true);		// BGM012[���m�̐��E���s��] ���Đ�����
				EventStartChangeDemo(200, FADE_COLOR_BLACK);			// Demo200[���y�̗쓹�E�S�i]
			}
		}
	}
//---------------------------------------------------------------------------------------
// �퓬����
	if(main_num == GetFlagID_("CONST_SM_CEMETERY")){					// Num0 = 3
		if(grave_num == GetFlagID_("CONST_SS_CC_FIND_THE_GHOST")){		// Num4 = 2
			if(bit_figth_key_npc_a == true){
				// ���u���h���h�̎艺A�ɏ���
				if (GetBattleEndType_() == BATTLE_END_TYPE_WIN){
					LoadEffect_("ef741_01_div_nor_death");				// �G���ŃG�t�F�N�g
					// ����ʂ�1�t���ňÓ]
					SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
					// �t�B�[���hBGM�𓪑ł�
					SetEventFlg_("BFG_RETURN_BATTLE_FIRLD_BGM_HEAD", true);
					//�u���h���h�̎艺A�Ɛ키�O�̃t���O�ɖ߂�
					SetEventFlg_("BFG_BATTLE_BUNDORUDO_RETAINER_A", false);
					//�u���h���h�̎艺A�Ƃ̐퓬�ɏ���������z�u�����X�^�[�����ւ���t���O
					SetEventFlg_("BFG_LIMIT_BUNDORUDO_RETAINER_A", true);
					//�}�b�v�i�r�Ɂu!�v��\��
					SetNaviMapIconVisible_(g_map_navi_enemy_01, false);
					
					//�J������ݒu
					SetPointCameraEye_("cameye_001");
					SetPointCameraTarget_("camtgt_001");
					
					//�퓬��̃Z���t
					uMessage("NPC_UNDERLING_A_002");
					
					//�u���h���h�̎艺A�̏��ŏ���
					efc_death = SetSelectBoneEffect_("ef741_01_div_nor_death", g_key_npc_a_sub, ATTACH_GLOBAL);
					SetEffectScale_(efc_death, 1.0);
					PlaySE_("SE_DEM_010");
					uAlphaFadeOut(g_key_npc_a_sub);			//���X�ɃA���t�@�l������������
					SetVisible(g_key_npc_a_sub, false);		//NPC��\�������Ȃ�
					SetTalkEnable_(g_key_npc_a_sub, false);	//��b�A�C�R����\��
					
					//�J�M����t���O
					SetEventFlg_("BFG_GET_GATE_KEY_1ST", true);
					Wait_(20);
					
					// �A�C�e�����菈��
					AddItemAndMsg(garden_key_id, 1, true);
					
					//�v���C�A�u���ɕ��A������
					uPlayableReset(-800.0, -3.6, 786.0, -152);
				}else{
					// ���s�k������AfterBattle()�ɋL�q
				}
			}
			if(bit_figth_key_npc_b == true){
				// ���u���h���h�̎艺B�ɏ���
				if (GetBattleEndType_() == BATTLE_END_TYPE_WIN){
					LoadEffect_("ef741_01_div_nor_death");				// �G���ŃG�t�F�N�g
					// ����ʂ�1�t���ňÓ]
					SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
					// �t�B�[���hBGM�𓪑ł�
					SetEventFlg_("BFG_RETURN_BATTLE_FIRLD_BGM_HEAD", true);
					//�u���h���h�̎艺B�Ɛ키�O�̃t���O�ɖ߂�
					SetEventFlg_("BFG_BATTLE_BUNDORUDO_RETAINER_B", false);
					//�u���h���h�̎艺B�Ƃ̐퓬�ɏ���������z�u�����X�^�[�����ւ���t���O
					SetEventFlg_("BFG_LIMIT_BUNDORUDO_RETAINER_B", true);
					//�}�b�v�i�r�Ɂu!�v��\��
					SetNaviMapIconVisible_(g_map_navi_enemy_02, false);
					
					//�J������ݒu
					SetPointCameraEye_("cameye_002");
					SetPointCameraTarget_("camtgt_002");
					
					//�퓬��̃Z���t
					uMessage("NPC_UNDERLING_B_002");
					
					//�u���h���h�̎艺B�̏��ŏ���
					efc_death = SetSelectBoneEffect_("ef741_01_div_nor_death", g_key_npc_b, ATTACH_GLOBAL);
					SetEffectScale_(efc_death, 1.0);
					PlaySE_("SE_DEM_010");
					uAlphaFadeOut(g_key_npc_b_sub);			//���X�ɃA���t�@�l������������
					SetVisible(g_key_npc_b_sub, false);		//NPC��\�������Ȃ�
					SetTalkEnable_(g_key_npc_b_sub, false);	//��b�A�C�R����\��
					
					//�J�M����t���O
					SetEventFlg_("BFG_GET_GATE_KEY_2ND", true);
					Wait_(20);
					
					// �A�C�e�����菈��
					AddItemAndMsg(garden_key_id, 1, true);
					
					//�v���C�A�u���ɕ��A������
					uPlayableReset(1454.3, 172.7, 390.6, 174);
				}else{
					// ���s�k������AfterBattle()�ɋL�q
				}
			}
			if(bit_figth_key_npc_c == true){
				// ���u���h���h�̎艺C�ɏ���
				if (GetBattleEndType_() == BATTLE_END_TYPE_WIN){
					LoadEffect_("ef741_01_div_nor_death");				// �G���ŃG�t�F�N�g
					// ����ʂ�1�t���ňÓ]
					SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
					// �t�B�[���hBGM�𓪑ł�
					SetEventFlg_("BFG_RETURN_BATTLE_FIRLD_BGM_HEAD", true);
					//�u���h���h�̎艺C�Ɛ키�O�̃t���O�ɖ߂�
					SetEventFlg_("BFG_BATTLE_BUNDORUDO_RETAINER_C", false);
					//�u���h���h�̎艺C�Ƃ̐퓬�ɏ���������z�u�����X�^�[�����ւ���t���O
					SetEventFlg_("BFG_LIMIT_BUNDORUDO_RETAINER_C", true);
					//�}�b�v�i�r�Ɂu!�v��\��
					SetNaviMapIconVisible_(g_map_navi_enemy_03, false);
					
					//�J������ݒu
					SetPointCameraEye_("cameye_003");
					SetPointCameraTarget_("camtgt_003");
					
					//�퓬��̃Z���t
					uMessage("NPC_UNDERLING_C_002");
					
					//�u���h���h�̎艺A�̏��ŏ���
					efc_death = SetSelectBoneEffect_("ef741_01_div_nor_death", g_key_npc_c, ATTACH_GLOBAL);
					SetEffectScale_(efc_death, 1.0);
					PlaySE_("SE_DEM_010");
					uAlphaFadeOut(g_key_npc_c_sub);			//���X�ɃA���t�@�l������������
					SetVisible(g_key_npc_c_sub, false);		//NPC��\�������Ȃ�
					SetTalkEnable_(g_key_npc_c_sub, false);	//��b�A�C�R����\��
					
					//�J�M����t���O
					SetEventFlg_("BFG_GET_GATE_KEY_3RD", true);
					Wait_(20);
					
					// �A�C�e�����菈��
					AddItemAndMsg(garden_key_id, 1, true);
					
					//�v���C�A�u���ɕ��A������
					uPlayableReset(960.7, 296.5, -177.6, 175);
				}else{
					// ���s�k������AfterBattle()�ɋL�q
				}
			}
		}
	}

	//-----------------------
	// ���ړ����u���g�p������
	//-----------------------
	if(GetEventFlg_("BFG_RIDE_OFF_USED_TRANSFER") == true){
		UsingTransfer();
		
		// ���y�̗쓹�ɗ��čŏ��̃^�C�~���O
		if(main_num == GetFlagID_("CONST_SM_CEMETERY")){
			if(grave_num == 0){
				// ���̐S���̍��ډ��
				SetEventFlg_("BFG_TRAVEL_INFO_SHOW_067", true); // ���̐S���̍��ډ���t���O �y�t�B�[���h�z�퓬���炢����
				CommSavedAfterTransferDemo("BFG_SCENARIO_CLEAR_CITY");
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
	// �t���O�̏�Ԃ��擾
	local main_num  = GetNumFlg_("NUM_SCENARIO_MAIN");
	local grave_num = GetNumFlg_("NUM_SCENARIO_SUB_GRAVE");
	// �J�M����t���O
	local bit_key1 = GetEventFlg_("BFG_GET_GATE_KEY_1ST");
	local bit_key2 = GetEventFlg_("BFG_GET_GATE_KEY_2ND");
	local bit_key3 = GetEventFlg_("BFG_GET_GATE_KEY_3RD");
	// �u���h���h�̎艺�Ɛ������
	local bit_figth_key_npc_a = GetEventFlg_("BFG_BATTLE_BUNDORUDO_RETAINER_A");
	local bit_figth_key_npc_b = GetEventFlg_("BFG_BATTLE_BUNDORUDO_RETAINER_B");
	local bit_figth_key_npc_c = GetEventFlg_("BFG_BATTLE_BUNDORUDO_RETAINER_C");
	// NPC�̎�ނ��擾
	local player = GetPlayerId_();
	local target = GetTargetId_();

	switch(target){
	case g_gost_npc_a:		// �����X�^�[�̗H��A
		uTalkGostNpcA();
		break;
	case g_gost_npc_b:		// �����X�^�[�̗H��B
		uTalkGostNpcB();
		break;
	case g_gost_npc_c:		// �����X�^�[�̗H��C
		uTalkGostNpcC();
		break;
	case g_gost_npc_h:		// �����X�^�[�̗H��H
		uTalkGostNpcH();
		break;
	case g_key_npc_a:		// �u���h���h�̎艺A
		uTalkKeyNpcA();
		break;
	case g_key_npc_b:		// �u���h���h�̎艺B
		uTalkKeyNpcB();
		break;
	case g_key_npc_c:		// �u���h���h�̎艺C
		uTalkKeyNpcC();
		break;
	default:
		DebugPrint("WARNING : NPC_ID���s���ł� [TouchNpc]");
		break;
	}
	
	EventEnd_();
}


//------------------------------------------------
//		�n���ڐG��
//------------------------------------------------
function TouchEventMine(){
	// �t���O�̏�Ԃ��擾
	local main_num		 = GetNumFlg_("NUM_SCENARIO_MAIN");
	local grave_num		 = GetNumFlg_("NUM_SCENARIO_SUB_GRAVE");
	local ice_event_num	 = GetNumFlg_("NUM_SCENARIO_SUB_ICE");
	// �傪�J�����t���O
	local bit_door_open1 = GetEventFlg_("BFG_OPEN_GATE_1ST");
	local bit_door_open2 = GetEventFlg_("BFG_OPEN_GATE_2ND");
	local bit_door_open3 = GetEventFlg_("BFG_OPEN_GATE_3RD");
	// �Ïؔԍ��̔����J�����t���O
	local bit_lock_door_open = GetEventFlg_("BFG_OPEN_PASSWORD_DOOR");
	
	local target		 = GetTouchEventMineId_();
	local player		 = GetPlayerId_();
	// �K�[�f���̃J�M���������L���Ă��邩
	local key_num = GetItemNum_(951);
	// �K�[�f���̃J�M��ID
	local garden_key_id  = 951;
	
	switch (target) {
	case g_mine_transfer01:		// ���嗤�ړ����u(�����s�s�s)
		uMineTransferToCity();
		break;
	case g_mine_transfer02:		// ���嗤�ړ����u(�����̕X���s)
		uMineTransferToIce();
		break;
	case g_mine_01:				// �������X�^�[�̗H��A�ɋ߂Â�����(�f��214[�H��̂���]�Đ�)
	case g_mine_01_b:
	case g_mine_01_c:
		uMineGostA();
		break;
	case g_mine_ruler_01:		// �����[���|�C���g(�A���f�b�h�K�[�f������)
		uMineRulerPoint01();
		break;
	case g_mine_ruler_02:		// �����[���|�C���g(�����L��)
		uMineRulerPoint02();
		break;
	case g_mine_lock_door:		// ���Ïؔԍ��̔�
		uMineLockDoor();
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
	
	// �����A���^�C���Ŕ��̏o�������Ɣ�����s���̂Ŋ֐������Ȃ������ǂ�
	// ���A���f�b�h�K�[�f���̖�@
	if(target == g_mine_key_door_01){
		if(bit_door_open1 == false){
			// �J�M����ȏ㎝���Ă����ꍇ
			if(key_num > 0){
				AddItem_(garden_key_id, -1);					// �u�K�[�f���̃J�M�v�����炷
				SetEventFlg_("BFG_OPEN_GATE_1ST", true);		// 1�ڂ̖傪�J�����t���O
				DeleteEventMine_(g_mine_key_door_01);			// �n��������
				CommPlayerTurnAroundObj(g_key_door_01);			// ���̕���PC����������
				
				PlaySE_("SE_FLD_008");	// �A���f�b�h�K�[�f��������ւ̔�
				// ���̃A�j���[�V�����J�n
				SetMotion_(g_key_door_01, MOT_GIMMICK_1, 0);
				SetGimmickMapHitEnable_(g_key_door_01, false);	// gimmick �̃A�^���𖳌���
				Wait_(50);
				
				// �n�k���N����
				StartEarthQuake_(15, 3, 0.3)
				Wait_(40);
				
				uMessage("DOOR_OPEN_MSG_001");					// �V�X�e�����b�Z�[�W
				SetActive_(g_key_door_01, false);				// ���\�������Ȃ�
				SetActive_(g_reactorPoint16, false);			// ���A�N�^�[�|�C���g������
				g_mine_key_door_02 = SetPointCircleEventMine_("mine_key_door02", true);// ��ڂ̖�̒n����u��
			}
			// �J�M�������Ă��Ȃ��ꍇ
			else{
				CommPlayerTurnAroundObj(g_key_door_01);
				uMessage("DOOR_NOTOPEN_MSG_001");				// �V�X�e�����b�Z�[�W
			}
		}
	}
	// ���A���f�b�h�K�[�f���̖�A
	if(target == g_mine_key_door_02){
		if(bit_door_open1 == true){
			if(bit_door_open2 == false){
				// �J�M����ȏ㎝���Ă����ꍇ
				if(key_num > 0){
					AddItem_(garden_key_id, -1);				// �u�K�[�f���̃J�M�v�����炷
					SetEventFlg_("BFG_OPEN_GATE_2ND", true);	// 2�ڂ̖傪�J�����t���O
					DeleteEventMine_(g_mine_key_door_02);		// �n��������
					CommPlayerTurnAroundObj(g_key_door_02);		// ���̕���PC����������
					
					PlaySE_("SE_FLD_008");	// �A���f�b�h�K�[�f��������ւ̔�
					// ���̃A�j���[�V�����J�n
					SetMotion_(g_key_door_02, MOT_GIMMICK_1, 0);
					SetGimmickMapHitEnable_(g_key_door_02, false);	// gimmick �̃A�^���𖳌���
					Wait_(50);
					
					// �n�k���N����
					StartEarthQuake_(15, 3, 0.3)
					Wait_(40);
					
					uMessage("DOOR_OPEN_MSG_002");				// �V�X�e�����b�Z�[�W
					SetActive_(g_key_door_02, false);			// ���\�������Ȃ�
					SetActive_(g_reactorPoint17, false);		// ���A�N�^�[�|�C���g������
					g_mine_key_door_03 = SetPointCircleEventMine_("mine_key_door03", true);// �O�ڂ̖�̒n����u��
				}
				// �J�M�������Ă��Ȃ��ꍇ
				else{
					CommPlayerTurnAroundObj(g_key_door_02);
					uMessage("DOOR_NOTOPEN_MSG_001");			// �V�X�e�����b�Z�[�W
				}
			}
		}
	}
	// ���A���f�b�h�K�[�f���̖�B
	if(target == g_mine_key_door_03){
		if(bit_door_open2 == true){
			if(bit_door_open3 == false){
				// �J�M����ȏ㎝���Ă����ꍇ
				if(key_num > 0){
					AddItem_(garden_key_id, -1);				// �u�K�[�f���̃J�M�v�����炷
					SetEventFlg_("BFG_OPEN_GATE_3RD", true);	// 3�ڂ̖傪�J�����t���O
					DeleteEventMine_(g_mine_key_door_03);		// �n��������
					CommPlayerTurnAroundObj(g_key_door_03);		// ���̕���PC����������
					
					PlaySE_("SE_FLD_008");	// �A���f�b�h�K�[�f��������ւ̔�
					// ���̃A�j���[�V�����J�n
					SetMotion_(g_key_door_03, MOT_GIMMICK_1, 0);
					SetGimmickMapHitEnable_(g_key_door_03, false);	// gimmick �̃A�^���𖳌���
					Wait_(50);
					
					// �n�k���N����
					StartEarthQuake_(15, 3, 0.3)
					Wait_(40);
					
					uMessage("DOOR_OPEN_MSG_003");				// �V�X�e�����b�Z�[�W
					SetActive_(g_key_door_03, false);			// ���\�������Ȃ�
					SetActive_(g_reactorPoint18, false);		// ���A�N�^�[�|�C���g������
				}
				// �J�M�������Ă��Ȃ��ꍇ
				else{
					CommPlayerTurnAroundObj(g_key_door_03);
					uMessage("DOOR_NOTOPEN_MSG_001");			// �V�X�e�����b�Z�[�W
				}
			}
		}
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
	local main_num  = GetNumFlg_("NUM_SCENARIO_MAIN");
	local grave_num = GetNumFlg_("NUM_SCENARIO_SUB_GRAVE");

	// NPC�̎�ނ��擾
	local target = GetTargetId_();
	
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
//		�����X�^�[�̗H��`  ��b����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkGostNpcA()
{
	// �t���O�̏�Ԃ��擾
	local main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");				//Num0
	local grave_num	 = GetNumFlg_("NUM_SCENARIO_SUB_GRAVE");		//Num4
	local sky_num	 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");			//Num9
	
	
	// �쓹�V�i���I�N���A����܂�
	if(main_num == GetFlagID_("CONST_SM_CEMETERY")){						// Num0 = 3
		if(grave_num == GetFlagID_("CONST_SS_CC_CLEAR_CEMETERY")){			// Num4 = 18
			uMessage("NPC_GOST_A_010");			//�u�ړ����u�Ł@�����̕X���ɒ�������
		}
	}
	// �X���V�i���I�J�n�`�K���r���X���j�܂�
	else if(main_num <= GetFlagID_("CONST_SM_CORE")){						// Num0 = 7 �ȉ�
		uMessage("NPC_GOST_A_020");				//�u�₠�@����l���̖��O������Ȃ����B
	}
	// �K���r���X���j��`����u���h���h���j�O�܂�
	else if(main_num == GetFlagID_("CONST_SM_SKY")){						// Num0 = 8
		if(sky_num <= GetFlagID_("CONST_SS_SK_JDG_REMATCH_G_BUNDORUDO")){	// Num9 = 23 �ȉ�
			uMessage("NPC_GOST_A_030");			//�u�܂�Ł@������݂����ȋ󂾂ˁB
		}
		// ����u���h���h���j��`�\�V�i���I�N���A�܂�
		else if(sky_num <= GetFlagID_("CONST_SS_SK_DATA_SAVED")){			// Num9 = 58 �ȉ�
			uMessage("NPC_GOST_A_040");			//�u�����ԕ����Ȃ��Ȃ�����@���ӂ͉����������ȁB
		}
	}
	// �\�V�i���I�N���A��
	else if(main_num >= GetFlagID_("CONST_SM_INSIDE_CLEAR")){				// Num0 = 9 �ȏ�
		uMessage("NPC_GOST_A_050");				//�u�����X�^�[�́@���Ȃ��Ȃ�Ȃ�����
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�����X�^�[�̗H��a  ��b����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkGostNpcB()
{
	// �t���O�̏�Ԃ��擾
	local main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");				//Num0
	local grave_num	 = GetNumFlg_("NUM_SCENARIO_SUB_GRAVE");		//Num4
	local sky_num	 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");			//Num9
	
	// �쓹�V�i���I�J�n�`�u���h���h���j�܂�
	if(main_num == GetFlagID_("CONST_SM_CEMETERY")){						// Num0 = 3
		if(grave_num <= GetFlagID_("CONST_SS_CC_GO_TO_THE_NEXT_TRANSFER")){	// Num4 = 16 �ȉ�
			uMessage("NPC_GOST_B_010");			//�u�A���f�b�h�K�[�f���̃J�M�����@������
		// �u���h���h���j��
		}else if(grave_num <= GetFlagID_("CONST_SS_CC_CLEAR_CEMETERY")){	// Num4 = 18 �ȉ�
			uMessage("NPC_GOST_B_020");			//�u�u���h���h���@���Ȃ��Ȃ�����
		}
	}
	// �쓹�V�i���I�N���A��`�K���r���X���j�O�܂�
	else if(main_num <= GetFlagID_("CONST_SM_CORE")){						// Num0 = 7 �ȉ�
		uMessage("NPC_GOST_B_020");				//�u�u���h���h���@���Ȃ��Ȃ�����
	}
	// �K���r���X���j��`����u���h���h���j�O�܂�
	else if(main_num == GetFlagID_("CONST_SM_SKY")){						// Num0 = 8
		if(sky_num <= GetFlagID_("CONST_SS_SK_JDG_REMATCH_G_BUNDORUDO")){	// Num9 = 23 �ȉ�
			uMessage("NPC_GOST_B_030");			//�u�܂�Ł@������݂����ȋ󂾂ˁB
		}
		// ����u���h���h���j��`�\�V�i���I�N���A�܂�
		else if(sky_num <= GetFlagID_("CONST_SS_SK_DATA_SAVED")){			// Num9 = 58 �ȉ�
			uMessage("NPC_GOST_B_040");			//�u�����ԕ����Ȃ��Ȃ�����@���ӂ͉����������ȁB
		}
	}
	// �\�V�i���I�N���A��
	else if(main_num >= GetFlagID_("CONST_SM_INSIDE_CLEAR")){				// Num0 = 9 �ȏ�
		uMessage("NPC_GOST_B_050");				//�u�����X�^�[�́@���Ȃ��Ȃ�Ȃ�����
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�����X�^�[�̗H��b  ��b����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkGostNpcC()
{
	// �t���O�̏�Ԃ��擾
	local main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");				//Num0
	local grave_num	 = GetNumFlg_("NUM_SCENARIO_SUB_GRAVE");		//Num4
	local sky_num	 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");			//Num9
	
	// �쓹�V�i���I�J�n�`�u���h���h���j�܂�
	if(main_num == GetFlagID_("CONST_SM_CEMETERY")){						// Num0 = 3
		if(grave_num <= GetFlagID_("CONST_SS_CC_GO_TO_THE_NEXT_TRANSFER")){	// Num4 = 16 �ȉ�
			uMessage("NPC_GOST_C_010");			//�u�A���f�b�h�K�[�f���̎��́@���d��B
		// �u���h���h���j��
		}else if(grave_num <= GetFlagID_("CONST_SS_CC_CLEAR_CEMETERY")){	// Num4 = 18 �ȉ�
			uMessage("NPC_GOST_C_020");			//�u�A���f�b�h�K�[�f���̖�́@�J����������B
		}
	}
	// �쓹�V�i���I�N���A��`�K���r���X���j�O�܂�
	else if(main_num <= GetFlagID_("CONST_SM_CORE")){						// Num0 = 7 �ȉ�
		uMessage("NPC_GOST_C_020");				//�u�A���f�b�h�K�[�f���̖�́@�J����������B
	}
	// �K���r���X���j��`����u���h���h���j�O�܂�
	else if(main_num == GetFlagID_("CONST_SM_SKY")){						// Num0 = 8
		if(sky_num <= GetFlagID_("CONST_SS_SK_JDG_REMATCH_G_BUNDORUDO")){	// Num9 = 23 �ȉ�
			uMessage("NPC_GOST_C_030");			//�u�����ԕ��ŕ���ꂽ�@������Ă����
		}
		// ����u���h���h���j��`�\�V�i���I�N���A�܂�
		else if(sky_num <= GetFlagID_("CONST_SS_SK_DATA_SAVED")){			// Num9 = 58 �ȉ�
			uMessage("NPC_GOST_C_040");			//�u�����@�󂪍L�X�Ƃ��Ă��B
		}
	}
	// �\�V�i���I�N���A��
	else if(main_num >= GetFlagID_("CONST_SM_INSIDE_CLEAR")){				// Num0 = 9 �ȏ�
		uMessage("NPC_GOST_C_050");				//�u�������H��ɂƂ��ā@�����V�C���Ă����̂�
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�����X�^�[�̗H��g  ��b����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkGostNpcH()
{
	// �t���O�̏�Ԃ��擾
	local main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");				//Num0
	local grave_num	 = GetNumFlg_("NUM_SCENARIO_SUB_GRAVE");		//Num4
	local sky_num	 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");			//Num9
	local bit_door_open3 = GetEventFlg_("BFG_OPEN_GATE_3RD");		//Bit_1113  �R�ڂ̖���J��
	
	// �쓹�V�i���I�J�n�`�u���h���h���j�܂�
	if(main_num == GetFlagID_("CONST_SM_CEMETERY")){						// Num0 = 3
		if(grave_num <= GetFlagID_("CONST_SS_CC_GO_TO_THE_NEXT_TRANSFER")){	// Num4 = 16 �ȉ�
			// ����3�S�ĊJ���Ă��Ȃ����̃Z���t
			if(bit_door_open3 == false){
				uMessage("NPC_GOST_H_010");		// �u���h���h�́@�A���f�b�h�K�[�f���̓�����
			}
			// ����3�S�ĊJ�������̃Z���t
			else{
				uMessage("NPC_GOST_H_020");		//�u�������ȁc�c�R�̃J�M���W�߂�
			}
		// �u���h���h���j��
		}else if(grave_num <= GetFlagID_("CONST_SS_CC_CLEAR_CEMETERY")){	// Num4 = 18 �ȉ�
			uMessage("NPC_GOST_H_030");			//�u�܂����@�u���h���h�̓z��
		}
	}
	// �쓹�V�i���I�N���A��`�K���r���X���j�O�܂�
	else if(main_num <= GetFlagID_("CONST_SM_CORE")){						// Num0 = 7 �ȉ�
		uMessage("NPC_GOST_H_030");				//�u�܂����@�u���h���h�̓z��
	}
	// �K���r���X���j��`����u���h���h���j�O�܂�
	else if(main_num == GetFlagID_("CONST_SM_SKY")){						// Num0 = 8
		if(sky_num <= GetFlagID_("CONST_SS_SK_JDG_REMATCH_G_BUNDORUDO")){	// Num9 = 23 �ȉ�
			uMessage("NPC_GOST_H_040");			//�u���̈Â���̌�������
		}
		// ����u���h���h���j��`�\�V�i���I�N���A�܂�
		else if(sky_num <= GetFlagID_("CONST_SS_SK_DATA_SAVED")){			// Num9 = 58 �ȉ�
			uMessage("NPC_GOST_H_050");			//�u�����c�c�悤�₭�����������B
		}
	}
	// �\�V�i���I�N���A��
	else if(main_num >= GetFlagID_("CONST_SM_INSIDE_CLEAR")){				// Num0 = 9 �ȏ�
		uMessage("NPC_GOST_H_060");				//�u���񂽂��@�����Ă���Ă��Ƃ́c�c
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�u���h���h�̎艺�`  ��b����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkKeyNpcA()
{
	// �t���O�̏�Ԃ��擾
	local main_num  = GetNumFlg_("NUM_SCENARIO_MAIN");
	local grave_num = GetNumFlg_("NUM_SCENARIO_SUB_GRAVE");

	// NPC�̎�ނ��擾
	local player = GetPlayerId_();

	// �J�M����t���O
	local bit_key1 = GetEventFlg_("BFG_GET_GATE_KEY_1ST");
	local bit_key2 = GetEventFlg_("BFG_GET_GATE_KEY_2ND");
	local bit_key3 = GetEventFlg_("BFG_GET_GATE_KEY_3RD");
	
	// �u���h���h�̎艺�Ɛ�������i���t���O�j
	local bit_figth_key_npc_a = GetEventFlg_("BFG_BATTLE_BUNDORUDO_RETAINER_A");
	local bit_figth_key_npc_b = GetEventFlg_("BFG_BATTLE_BUNDORUDO_RETAINER_B");
	local bit_figth_key_npc_c = GetEventFlg_("BFG_BATTLE_BUNDORUDO_RETAINER_C");
	
	if(main_num == GetFlagID_("CONST_SM_CEMETERY")){					// Num0 = 3
		if(grave_num == GetFlagID_("CONST_SS_CC_FIND_THE_GHOST")){		// Num4 = 2
			if(bit_key1 == false){
				//�t�F�[�h�A�E�g
				SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
				SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
				WaitFade_();
				Wait_(10);
				
				//��l���Ǝ艺A�������Ȃ�����
				SetVisible(player, false);			// ��l��������
				SetVisible(g_key_npc_a, false);		// �艺A������
				SetVisible(g_key_npc_a_sub, true);	// �艺A�̃T�u��\��������
				
				//�J������ݒu
				SetPointCameraEye_("cameye_001");
				SetPointCameraTarget_("camtgt_001");
				Wait_(10);
				
				//�t�F�[�h�C��
				SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
				WaitFade_();
				Wait_(10);
				
				//�u���h���h�̎艺A�̃��b�Z�[�W
				OpenMsgWnd_();
				ShowMsg_("DEMO_202_AFT_NPC_A");
				KeyInputWait_();
				// �u�͂��v
				if(GetQueryResult_() == QUERY2_0){
					ShowMsg_("DEMO_202_AFT_NPC_A_YES");
					KeyInputWait_();
					CloseMsgWnd_();
					//�v���C�A�u���ɕ��A������
					uPlayableReset(-800.0, -3.6, 786.0, -152);
					SetVisible(g_key_npc_a, true);		// �艺A��\��������
					SetVisible(g_key_npc_a_sub, false);	// �艺A�̃T�u������
				}
				// �u�������v
				else{
					ShowMsg_("DEMO_202_AFT_NPC_A_NO");
					KeyInputWait_();
					CloseMsgWnd_();
					//�u���h���h�̎艺A�Ɛ�������t���O
					SetEventFlg_("BFG_BATTLE_BUNDORUDO_RETAINER_A", true);
					//���̜͂p�j�����X�^�[���폜
					InhibitMonsterGenerate_( 10000.0 );
					//�u���h���h�̎艺A�Ɛ퓬
					ChangeBattleParty_(13);
				}
			}
		}
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�u���h���h�̎艺�a  ��b����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkKeyNpcB()
{
	// �t���O�̏�Ԃ��擾
	local main_num  = GetNumFlg_("NUM_SCENARIO_MAIN");
	local grave_num = GetNumFlg_("NUM_SCENARIO_SUB_GRAVE");

	// NPC�̎�ނ��擾
	local player = GetPlayerId_();

	// �J�M����t���O
	local bit_key1 = GetEventFlg_("BFG_GET_GATE_KEY_1ST");
	local bit_key2 = GetEventFlg_("BFG_GET_GATE_KEY_2ND");
	local bit_key3 = GetEventFlg_("BFG_GET_GATE_KEY_3RD");
	
	// �u���h���h�̎艺�Ɛ�������i���t���O�j
	local bit_figth_key_npc_a = GetEventFlg_("BFG_BATTLE_BUNDORUDO_RETAINER_A");
	local bit_figth_key_npc_b = GetEventFlg_("BFG_BATTLE_BUNDORUDO_RETAINER_B");
	local bit_figth_key_npc_c = GetEventFlg_("BFG_BATTLE_BUNDORUDO_RETAINER_C");
	
	if(main_num == GetFlagID_("CONST_SM_CEMETERY")){					// Num0 = 3
		if(grave_num == GetFlagID_("CONST_SS_CC_FIND_THE_GHOST")){		// Num4 = 2
			if(bit_key2 == false){
				//�t�F�[�h�A�E�g
				SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
				SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
				WaitFade_();
				Wait_(10);
				
				//��l���Ǝ艺B�������Ȃ�����
				SetVisible(player, false);			// ��l��������
				SetVisible(g_key_npc_b, false);		// �艺B������
				SetVisible(g_key_npc_b_sub, true);	// �艺B�̃T�u��\��������
				
				//�J������ݒu
				SetPointCameraEye_("cameye_002");
				SetPointCameraTarget_("camtgt_002");
				Wait_(10);
				
				//�t�F�[�h�C��
				SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
				WaitFade_();
				Wait_(10);
				
				//�u���h���h�̎艺B�̃��b�Z�[�W
				OpenMsgWnd_();
				ShowMsg_("DEMO_202_AFT_NPC_B");
				KeyInputWait_();
				// �u�͂��v
				if(GetQueryResult_() == QUERY2_0){
					ShowMsg_("DEMO_202_AFT_NPC_B_YES");
					KeyInputWait_();
					CloseMsgWnd_();
					//�u���h���h�̎艺B�Ɛ�������t���O
					SetEventFlg_("BFG_BATTLE_BUNDORUDO_RETAINER_B", true);
					//���̜͂p�j�����X�^�[���폜
					InhibitMonsterGenerate_( 10000.0 );
					//�u���h���h�̎艺B�Ɛ퓬
					ChangeBattleParty_(12);
				}
				// �u�������v
				else{
					ShowMsg_("DEMO_202_AFT_NPC_B_NO");
					KeyInputWait_();
					CloseMsgWnd_();
					//�v���C�A�u���ɕ��A������
					uPlayableReset(1454.3, 172.7, 390.6, 174);
					SetVisible(g_key_npc_b, true);		// �艺B��\��������
					SetVisible(g_key_npc_b_sub, false);	// �艺B�̃T�u������
				}
			}
		}
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�u���h���h�̎艺�b  ��b����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkKeyNpcC()
{
	// �t���O�̏�Ԃ��擾
	local main_num  = GetNumFlg_("NUM_SCENARIO_MAIN");
	local grave_num = GetNumFlg_("NUM_SCENARIO_SUB_GRAVE");

	// NPC�̎�ނ��擾
	local player = GetPlayerId_();

	// �J�M����t���O
	local bit_key1 = GetEventFlg_("BFG_GET_GATE_KEY_1ST");
	local bit_key2 = GetEventFlg_("BFG_GET_GATE_KEY_2ND");
	local bit_key3 = GetEventFlg_("BFG_GET_GATE_KEY_3RD");
	
	// �u���h���h�̎艺�Ɛ�������i���t���O�j
	local bit_figth_key_npc_a = GetEventFlg_("BFG_BATTLE_BUNDORUDO_RETAINER_A");
	local bit_figth_key_npc_b = GetEventFlg_("BFG_BATTLE_BUNDORUDO_RETAINER_B");
	local bit_figth_key_npc_c = GetEventFlg_("BFG_BATTLE_BUNDORUDO_RETAINER_C");
	
	if(main_num == GetFlagID_("CONST_SM_CEMETERY")){					// Num0 = 3
		if(grave_num == GetFlagID_("CONST_SS_CC_FIND_THE_GHOST")){		// Num4 = 2
			if(bit_key3 == false){
				//�t�F�[�h�A�E�g
				SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
				SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
				WaitFade_();
				Wait_(10);
				
				//��l���Ǝ艺B�������Ȃ�����
				SetVisible(player, false);			// ��l��������
				SetVisible(g_key_npc_c, false);		// �艺B������
				SetVisible(g_key_npc_c_sub, true);	// �艺B�̃T�u��\��������
				
				//�J������ݒu
				SetPointCameraEye_("cameye_003");
				SetPointCameraTarget_("camtgt_003");
				Wait_(10);
				
				//�t�F�[�h�C��
				SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
				WaitFade_();
				Wait_(10);
				
				//�u���h���h�̎艺C�̃��b�Z�[�W
				OpenMsgWnd_();
				ShowMsg_("DEMO_202_AFT_NPC_C");
				KeyInputWait_();
				// �u�͂��v
				if(GetQueryResult_() == QUERY2_0){
					ShowMsg_("DEMO_202_AFT_NPC_C_YES");
					KeyInputWait_();
					CloseMsgWnd_();
					//�v���C�A�u���ɕ��A������
					uPlayableReset(960.7, 296.5, -177.6, 175);
					SetVisible(g_key_npc_c, true);		// �艺C��\��������
					SetVisible(g_key_npc_c_sub, false);	// �艺C�̃T�u������
				}
				// �u�������v
				else{
					ShowMsg_("DEMO_202_AFT_NPC_C_NO");
					KeyInputWait_();
					CloseMsgWnd_();
					//�u���h���h�̎艺C�Ɛ�������t���O
					SetEventFlg_("BFG_BATTLE_BUNDORUDO_RETAINER_C", true);
					//���̜͂p�j�����X�^�[���폜
					InhibitMonsterGenerate_( 10000.0 );
					//�u���h���h�̎艺C�Ɛ퓬
					ChangeBattleParty_(14);
				}
			}
		}
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�嗤�ړ����u(�����s�s�s)�𒲂ׂ���
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineTransferToCity()
{
	local dont_use_transfer = GetEventFlg_("BFG_DONT_TRANSFER_CITY_TO_GRAVE");// ����-�쓹�Ԃ̑嗤�ړ����u�̎g�p���֎~����t���O
	
	if(dont_use_transfer == false){
		// �I�������b�Z�[�W
		OpenMsgWnd_();
		ShowMsg_("MINE_TRANSFER_MSG_001");
		KeyInputWait_();
		//�͂�
		if(GetQueryResult_() == QUERY_YES){
			CloseMsgWnd_();
			// ���C�h��Ԃő嗤�ړ������ꍇ�A���C�h����������t���O
			SetEventFlg_("BFG_RIDE_OFF_USED_TRANSFER", true);
			// �����s�s��
			ChangeMapPosDir_("A00_00", Vec3(-2399.243, 235.961,-1390. 153), 62);
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
//		�嗤�ړ����u(�����̕X���s)�𒲂ׂ���
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineTransferToIce()
{
	// �t���O�̏�Ԃ��擾
	local main_num			 = GetNumFlg_("NUM_SCENARIO_MAIN");
	local grave_num			 = GetNumFlg_("NUM_SCENARIO_SUB_GRAVE");
	local dont_use_transfer	 = GetEventFlg_("BFG_DONT_TRANSFER_GRAVE_TO_ICE");// �쓹-�X���Ԃ̑嗤�ړ����u�̎g�p���֎~����t���O
	
	if(dont_use_transfer == false){
		//�N���A��
		if(main_num >= GetFlagID_("CONST_SM_ICE_FIELD")){					// Num0 = 4
			// �I�������b�Z�[�W
			OpenMsgWnd_();
			ShowMsg_("MINE_TRANSFER_MSG_002");
			KeyInputWait_();
			//�͂�
			if(GetQueryResult_() == QUERY_YES){
				CloseMsgWnd_();
				// ���C�h��Ԃő嗤�ړ������ꍇ�A���C�h����������t���O
				SetEventFlg_("BFG_RIDE_OFF_USED_TRANSFER", true);
				// �����̕X����
				ChangeMapPosDir_("I00_00", Vec3(-1440.1, 1100.0, -1855.7), 35);
			}
			//������
			else{
				CloseMsgWnd_();
			}
		}
		if(main_num == GetFlagID_("CONST_SM_CEMETERY")){					// Num0 = 3
			//�N����
			if(grave_num == GetFlagID_("CONST_SS_CC_CLEAR_CEMETERY")){		// Num4 = 18
				DeleteEventMine_(g_mine_transfer02);
				// �쓹�̃V�i���I�t���O
				SetNumFlg_("NUM_SCENARIO_SUB_GRAVE", 0);
				// �嗤�ړ��̃f�����ɃZ�[�u�|�C���g�����ލۂɎg�p����t���O
				SetEventFlg_("BFG_SAVE_POINT_FLAG", true);
				// ���C�h��Ԃő嗤�ړ������ꍇ�A���C�h����������t���O
				SetEventFlg_("BFG_RIDE_OFF_USED_TRANSFER", true);
				// �X�̃V�i���I�̃t���O
				SetNumFlg_("NUM_SCENARIO_MAIN", 4);
				SetNumFlg_("NUM_SCENARIO_SUB_ICE", GetFlagID_("CONST_SS_IF_ARRIVE_ICE_FIELD"));
				// �����̕X����
				SetReturnDemoMap_("I00_00"); 
				SetReturnDemoPosDir_(Vec3(-1440.1, 1100.0, -1855.7), 35);
				//demo221[�]�����u�g�p]
				TouchNpcChangeDemo(221);
			}
			//�N���O
			if(grave_num <= GetFlagID_("CONST_SS_CC_GET_RACE_PROGRAM")){	// Num4 = 17
				//�V�X�e�����b�Z�[�W
				uMessage("MINE_04_MSG");
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


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�����X�^�[�̗H��A�ɋ߂Â�����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineGostA()
{
	// �t���O�̏�Ԃ��擾
	local main_num		 = GetNumFlg_("NUM_SCENARIO_MAIN");
	local grave_num		 = GetNumFlg_("NUM_SCENARIO_SUB_GRAVE");
	
	if(main_num == GetFlagID_("CONST_SM_CEMETERY")){					// Num0 = 3
		//�����X�^�[�̗H��A�ɋ߂Â�����(�f��214[�H��̂���]�Đ�)
		if(grave_num == GetFlagID_("CONST_SS_CC_GET_RACE_PROGRAM")){	// Num4 = 17
			DeleteEventMine_(g_mine_01);
			DeleteEventMine_(g_mine_01_b);
			DeleteEventMine_(g_mine_01_c);
			SetNumFlg_("NUM_SCENARIO_SUB_GRAVE",GetFlagID_("CONST_SS_CC_CLEAR_CEMETERY"));// Num4 = 18
			AddItem_(902, 1);	//�����̓V���΂��f�����ł��炦��̂ŉ��Z
			// �f���̕��A�ʒu���f���̊�����ɐݒ肵�܂�
			SetReturnDemoPosDir_(Vec3(-457.299, 315.610, -1668.393), -125);
			TouchNpcChangeDemo(214);//Demo214[�H��̂���]
		}
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		���[���|�C���g(�A���f�b�h�K�[�f������)�𒲂ׂ���
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineRulerPoint01()
{
	CommPlayerTurnAroundObj(g_rulerpoint01);
	CommRulerPointEvent(g_rulerpoint01, "BFG_RULER_ADD_009", "g_rulerpoint01"); 
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		���[���|�C���g(�����L��)�𒲂ׂ���
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineRulerPoint02()
{
	CommPlayerTurnAroundObj(g_rulerpoint02);
	CommRulerPointEvent(g_rulerpoint02, "BFG_RULER_ADD_031", "g_rulerpoint02"); 
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�Ïؔԍ��̔��𒲂ׂ���
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineLockDoor()
{
	// �t���O�̏�Ԃ��擾
	local main_num		 = GetNumFlg_("NUM_SCENARIO_MAIN");
	local grave_num		 = GetNumFlg_("NUM_SCENARIO_SUB_GRAVE");
	// �Ïؔԍ��̔����J�����t���O
	local bit_lock_door_open = GetEventFlg_("BFG_OPEN_PASSWORD_DOOR");
	
	// ��l������̕����Ɍ�����
	CommPlayerTurnAroundObj(g_lock_door);
	
	if(main_num == GetFlagID_("CONST_SM_CEMETERY")){									// Num0 = 3
		if(bit_lock_door_open == false){
			// �Ïؔԍ�����O
			if(grave_num <= GetFlagID_("CONST_SS_CC_TAKE_OVER_VOLITION_2")){			// Num4 = 15
				// �V�X�e�����b�Z�[�W
				uMessage("LOCK_DOOR_MSG_00");							// �J�x�Ɍ����������@�B���h�A���B
				//�h�A���b�N���b�Z�[�W
				uMessageTag("NAME_TAG_DOORLOCK", "LOCK_DOOR_MSG_01");	//�u�Ïؔԍ���  ���͂��Ă��������B
				//�i��Ő������͂̏�����ǉ�
				// �V�X�e�����b�Z�[�W
				uMessage("LOCK_DOOR_MSG_02");							// ���̔����@�J�����߂ɂ�
			}
			// �Ïؔԍ������
			if(grave_num == GetFlagID_("CONST_SS_CC_GET_RACE_PROGRAM")){				// Num4 = 17
				// �V�X�e�����b�Z�[�W
				uMessage("LOCK_DOOR_MSG_00");							// �J�x�Ɍ����������@�B���h�A���B
				// �h�A���b�N���b�Z�[�W
				uMessageTag("NAME_TAG_DOORLOCK", "LOCK_DOOR_MSG_01");	//�u�Ïؔԍ���  ���͂��Ă��������B
				Wait_(60); 
				// �V�X�e�����b�Z�[�W
				uMessage("LOCK_DOOR_MSG_03");							// <name_player/>��  �Ïؔԍ���  ���͂����I
				Wait_(5); 
				// �h�A���b�N���b�Z�[�W
				uMessageTag("NAME_TAG_DOORLOCK", "LOCK_DOOR_MSG_04");	//�u�Ïؔԍ���  �m�F���܂����B
				PlaySE_("SE_FLD_009");	// �A���f�b�h�K�[�f�����̕ǂ��J��
				// ���̃A�j���[�V�����J�n
				SetMotion_(g_lock_door, MOT_GIMMICK_1, 0);
				SetGimmickMapHitEnable_(g_lock_door, false);			// gimmick �̃A�^���𖳌���
				Wait_(40);
				// �n�k���N����
				StartEarthQuake_(15, 3, 0.3)
				Wait_(40);
				// �i�r�}�b�v�̔z�u��ς���
				SetNaviMapIconVisible_(g_navi_lock, false);
				SetNaviMapIconVisible_(g_navi_transfer, true);
				// �Ï��ԍ��̔�������
				SetActive_(g_lock_door, false);//���\�������Ȃ�
				SetActive_(g_reactorPoint14, false);			// ���A�N�^�[�|�C���g������
				DeleteEventMine_(g_mine_lock_door);
				SetEventFlg_("BFG_OPEN_PASSWORD_DOOR", true);	// �Ïؔԍ��̔����J�����t���O
				//�V�X�e�����b�Z�[�W
				uMessage("LOCK_DOOR_MSG_05");					// �h�A���b�N��  �J�����悤���B
			}
		}
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		NPC���t�F�[�h�A�E�g����
//------------------------------------------------
//	����	: id	NPCID
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uAlphaFadeOut(id)
{
	local alpha = 0.0;				// ���l�̐ݒ�
	SetManualCalcAlpha_(id, true);	// �蓮�v�Z�o����悤�ɂ���
	for(alpha = 1.0; alpha >= 0.0; alpha = alpha - 0.1){
		SetAlpha_(id, alpha);
		Wait_(2);
	}
	SetAlpha_(id, 0.0);				// �m���ɏ���
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
	SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);// ����ʂ��t�F�[�h�C��
	WaitFade_();
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�ėp���b�Z�[�W�֐�(�l�[���^�O����)
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


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�ėp���b�Z�[�W�֐�(�l�[���^�O�L��)
//------------------------------------------------
//	����	: msg	���b�Z�[�WID
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMessageTag(tag, msg)
{
	OpenMsgWnd_();
	SetTalkName_(tag);
	ShowMsg_(msg);
	KeyInputWait_();
	CloseMsgWnd_();
}


