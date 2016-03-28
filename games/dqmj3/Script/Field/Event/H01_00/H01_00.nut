//===================== H01_00�y�E�b�h�p�[�N�z ====================

enum HIDE_NPC_KIND{
	JACK,
	QUEEN,
	ACE,
	INN,
	NUM,
};

//�J���[�t�H���f���C�x���g�p�̒萔
const	CF_COLORFONDUE_MONSTER_ID = 395;	//�J���[�t�H���f����ID
const	CF_COLORFONDUE_COUNTMAX = 5;		//�J���[�t�H���f���Z��̏W�߂鐔

const	CF_GREEN_PROBLEM_ITEM_ID = 189;		//�΂̕��
const	CF_GREEN_PROBLEM_ITEM_NUMBER = 4;	//�K�v��
const	CF_GREEN_REWARD_ITEM_ID = 132;		//�h���S���̔�
const	CF_GREEN_REWARD_ITEM_NUMBER = 1;	//���炦���

const	CF_BLUE_PROBLEM_ITEM_ID = 187;		//�����
const	CF_BLUE_PROBLEM_ITEM_NUMBER = 4;	//�K�v��
const	CF_BLUE_REWARD_ITEM_ID = 110;		//�Ђ���̐�
const	CF_BLUE_REWARD_ITEM_NUMBER = 1;		//���炦���

const	CF_YELLOW_PROBLEM_ITEM_ID = 188;	//���F�̕��
const	CF_YELLOW_PROBLEM_ITEM_NUMBER = 4;	//�K�v��
const	CF_YELLOW_REWARD_ITEM_ID = 111;		//����܂���
const	CF_YELLOW_REWARD_ITEM_NUMBER = 1;	//���炦���

const	CF_RED_PROBLEM_ITEM_ID = 186;		//�Ԃ����
const	CF_RED_PROBLEM_ITEM_NUMBER = 4;		//�K�v��
const	CF_RED_REWARD_ITEM_ID = 131;		//�܂��イ�̔�
const	CF_RED_REWARD_ITEM_NUMBER = 1;		//���炦���

//------------------------------------------------
//		�}�b�v�ɓ���O
//------------------------------------------------
function BeforeInitMap()
{
	local main_num  = GetNumFlg_("NUM_SCENARIO_MAIN");
	local event_num = GetNumFlg_("NUM_SCENARIO_SUB_GREEN");
	
	// Demo033[��W�����v���C�h����]�̍Đ��O�Ƀ��C�h�̉������s��
	if(main_num == GetFlagID_("CONST_SM_GRASSLAND")){
		if(event_num == GetFlagID_("CONST_SS_GR_GET_RIDE_SKILL_JUMP")){
			//���C�h��������
			SetRideOffStart_();
		}
	}

	EventEnd_();
}


//------------------------------------------------
//		�t�F�[�h�C��
//------------------------------------------------
function FadeIn()
{
	// ��Num�t���O�擾
	local main_num  = GetNumFlg_("NUM_SCENARIO_MAIN");						// Num0
	local event_num = GetNumFlg_("NUM_SCENARIO_SUB_GREEN");					// Num2
	local event_num2 = GetNumFlg_("NUM_SCENARIO_SUB_CITY");					// Num3
	local outside_num = GetNumFlg_("NUM_SCENARIO_SUB_INSIDE_CLEAR");		// Num10
	
	// ��Bit�t���O�擾
	// �S�ŕ��A�ʒm�t���O
	local check_dead = GetEventFlg_("BFG_DEAD_RETURN");						// Bit21

	// �B��Ă���m�`���[�����������������ǂ������ׂ�t���O
	local appear_jack  = GetEventFlg_("BFG_APPEAR_JACK");					// Bit1060
	local appear_queen = GetEventFlg_("BFG_APPEAR_QUEEN");					// Bit1061
	local appear_ace   = GetEventFlg_("BFG_APPEAR_ACE");					// Bit1062
	local appear_inn   = GetEventFlg_("BFG_APPEAR_INN");					// Bit1063

	// �B��Ă���m�`���[�������ɏ��߂Ęb�����������ǂ������ׂ�t���O
	local first_time_talk_j = GetEventFlg_("BFG_FIRST_TIME_TALK_JACK");		// Bit1065
	local first_time_talk_q = GetEventFlg_("BFG_FIRST_TIME_TALK_QUEEN");	// Bit1066
	local first_time_talk_a = GetEventFlg_("BFG_FIRST_TIME_TALK_ACE");		// Bit1067
	local first_time_talk_i = GetEventFlg_("BFG_FIRST_TIME_TALK_INN");		// Bit1068

	// �ږ��J�n�t���O�ƈږ������t���O
	local start_immg_flg  = GetEventFlg_("BFG_START_IMMIGRATION");			// Bit1057
	local finish_immg_flg = GetEventFlg_("BFG_FINISHED_IMMIGRATION");		// Bit1056

	// ���t���O�ݒ�
	SetEventFlg_("BFG_H00_ITEM_SHOP_ICON", false);							// Bit1058 : ����A�C�R���\���t���O
	SetEventFlg_("BFG_ARRIVE_AT_H01", true);								// Bit82   : ���B�t���O_�E�b�h�p�[�N
	SetEventFlg_("BFG_RULER_ADD_000", true);								// Bit200  : ���[���|�C���g�ǉ�_�E�b�h�p�[�N

	// �[���f��[�W���b�N����̈˗�]�Đ�������
	if(GetEventFlg_("BFG_FIXATION_CHARA_WOOD_PARK") == true){				// Bit1072
		SetEventFlg_("BFG_RESET_POS_JACK_AND_QUEEN", true);					// Bit1022 : �W���b�N�ƃN�C�[���̔z�u�ύX�t���O
	}
	
	
	//-----------------
	// ���}�b�v�`�F���W
	//-----------------
	// Demo015[�B��Ă���m�`���[��]�Đ��� �` Demo042[�G�[�X�ɂ�郊�A�N�^�[�C��]�Đ���܂�
	if(main_num == 1){
		if(event_num == GetFlagID_("CONST_SS_GR_HIDE_AND_SEEK")
		|| event_num == GetFlagID_("CONST_SS_GR_MEET_JACK")
		|| event_num == GetFlagID_("CONST_SS_GR_TALK_QUEEN")){
			// �}�b�v�`�F���W�����Ȃ�
			SetHitEnableMapChangeNull_("w_H00_00ALdr_001", false);
		}
	}
	
	
	//----------
	// ��NPC�z�u
	//----------
	// ID������
	npc_ACC <- C_NONE_ID;		// �A�N�Z�T���[��
	npc_ACE <- C_NONE_ID;		// �G�[�X
	npc_BNK <- C_NONE_ID;		// ��s��
	npc_BOK <- C_NONE_ID;		// �{��
	npc_BUT <- C_NONE_ID;		// ����
	npc_IMP <- C_NONE_ID;		// ���
	npc_INN <- C_NONE_ID;		// �h��
	npc_JAC <- C_NONE_ID;		// �W���b�N
	npc_KNG <- C_NONE_ID;		// �L���O
	npc_A	<- C_NONE_ID;		// �m�`������
	npc_B	<- C_NONE_ID;		// �m�`���[���a
	npc_QEN <- C_NONE_ID;		// �N�C�[��
	npc_REC <- C_NONE_ID;		// ���A�N�^�[��
	
	// �y�����i�s���z
	if(main_num == 1){
		// demo020[�{�[�V���b�N�폟��]�Đ��� �` demo034[�m�`���[���̈ږ��v��]�Đ���
		if(event_num >= GetFlagID_("CONST_SS_GR_RETURN_KING")					// Num2 = 18
		&& event_num <= GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_3")){			// Num2 = 32
			// �t���O�ݒ�
			SetEventFlg_("BFG_H00_ITEM_SHOP_ICON", true);						// Bit1058 : ����A�C�R���\���t���O
			
			// ���\�[�X�̓Ǎ�
			local ID_NPC_000  = ReadNpc_("n000");		// �m�`���[���j
			local ID_NPC_001  = ReadNpc_("n004");		// �m�`���[����
			local ID_JACK     = ReadNpc_("n001");		// �W���b�N
			local ID_ACE      = ReadNpc_("n002");		// �G�[�X
			local ID_KING     = ReadNpc_("n003");		// �L���O
			local ID_QUEEN    = ReadNpc_("n005");		// �N�C�[��
			local ID_NOCHORIN = ReadNpc_("n043");		// �m�`������
			
			// ���A�N�Z�T���[��
			// ���m�`���[���a
			if(event_num == GetFlagID_("CONST_SS_GR_INVITE_JUMP_MONSTER")		// Num2 = 29
			&& GetEventFlg_("BFG_CHANGE_POS_ACCE_SHOP_NPC") == false){			// Bit1075
				// ���C�h���̂`�{�^���U���̐����p
				npc_ACC = ArrangePointNpc_(ID_NPC_001, "B004");
				SetReactorEvent_(npc_ACC);
				
				// �{���퓬�̐����p
				npc_B   = ArrangePointNpc_(ID_NPC_000, "B005");
				SetReactorEvent_(npc_B);
			}
			else{
				npc_ACC = ArrangePointNpc_(ID_NPC_001, "007");
				SetReactorEvent_(npc_ACC);
				SetSearchableAngle_(npc_ACC, SEARCHABLE_ANGLE_MINIMUM);
				
				npc_B   = ArrangePointNpc_(ID_NPC_000, "013");
				SetReactorEvent_(npc_B);
			}
			
			// ���G�[�X
			npc_ACE = ArrangePointNpc_(ID_ACE, "003");
			SetTalkCameraType_(npc_ACE, TALK_CAMERA_UP);
			SetReactorEvent_(npc_ACE);
			
			// ����s��
			npc_BNK = ArrangePointNpc_(ID_NPC_000, "008");
			SetReactorEvent_(npc_BNK);
			
			// ���{��
			npc_BOK = ArrangePointNpc_(ID_NPC_001, "004");
			SetReactorEvent_(npc_BOK);
			
			// ������
			npc_BUT = ArrangePointNpc_(ID_NPC_000, "006");
			SetReactorEvent_(npc_BUT);
			
			// �����
			npc_IMP = ArrangePointNpc_(ID_NPC_000, "010");
			SetSearchableAngle_(npc_IMP, SEARCHABLE_ANGLE_MINIMUM);
			SetTalkCameraType_(npc_IMP, TALK_CAMERA_UP);
			SetReactorEvent_(npc_IMP);
			
			// ���h��
			npc_INN = ArrangePointNpc_(ID_NPC_000, "009");
			SetSearchableAngle_(npc_INN, SEARCHABLE_ANGLE_MINIMUM);
			SetTalkCameraType_(npc_INN, TALK_CAMERA_UP);
			SetReactorEvent_(npc_INN);
			
			// ���W���b�N
			if(event_num >= GetFlagID_("CONST_SS_VC_TRY_RANK_C")				// Num2 = 19
			&& event_num <= GetFlagID_("CONST_SS_VC_THIRD_BATTLE")){			// Num2 = 26
				npc_JAC = ArrangePointNpc_(ID_JACK, "C001");
				SetTalkCameraType_(npc_JAC, TALK_CAMERA_UP);
				SetReactorEvent_(npc_JAC);
			}
			else{
				npc_JAC = ArrangePointNpc_(ID_JACK, "001");
				SetTalkCameraType_(npc_JAC, TALK_CAMERA_UP);
				SetReactorEvent_(npc_JAC);
			}
			
			// ���L���O
			npc_KNG = ArrangePointNpc_(ID_KING, "000");
			SetSearchableAngle_(npc_KNG, SEARCHABLE_ANGLE_MINIMUM);
			SetTalkCameraType_(npc_KNG, TALK_CAMERA_UP);
			SetTalkTurn_ (npc_KNG, false);				// �U�����OFF
			SetReactorEvent_(npc_KNG);
			
			// ���m�`������
			npc_A = ArrangePointNpc_(ID_NOCHORIN, "012");
			SetTalkCameraType_(npc_A, TALK_CAMERA_UP);
			SetReactorEvent_(npc_A);
			
			// ���N�C�[��
			npc_QEN = ArrangePointNpc_(ID_QUEEN , "002");
			SetTalkCameraType_(npc_QEN, TALK_CAMERA_UP);
			SetReactorEvent_(npc_QEN);
			
			// �����A�N�^�[��
			npc_REC = ArrangePointNpc_(ID_NPC_000, "005");
			SetReactorEvent_(npc_REC);
		}
	}
	
	if(main_num == 1){
		// demo015[�B��Ă���m�`���[��]�Đ���
		if(event_num == GetFlagID_("CONST_SS_GR_HIDE_AND_SEEK")){				// Num2 = 7
			// ���N�C�[��
			//���������t���O
			if(appear_queen == true){
				if(first_time_talk_q == false){
					local ID_QUEEN = ReadNpc_("n005");
					npc_QEN = ArrangePointNpc_(ID_QUEEN , "A001");
					SetManualCalcAlpha_(npc_QEN, true);
					SetAlpha_(npc_QEN, 0.0);
				}
			}
			//�b�����������t���O
			if(first_time_talk_q == true){
				local ID_QUEEN   = ReadNpc_("n005");
				npc_QEN = ArrangePointNpc_(ID_QUEEN  , "A001_2");
				SetReactorMsg_(npc_QEN, "NPC_QUEEN_REC");
			}
			
			// ���G�[�X
			//���������t���O
			if(appear_ace == true){
				if(first_time_talk_a == false){
					local ID_ACE     = ReadNpc_("n002");
					npc_ACE = ArrangePointNpc_(ID_ACE, "A002");
					SetManualCalcAlpha_(npc_ACE, true);
					SetAlpha_(npc_ACE, 0.0);
				}
			}
			//�b�����������t���O
			if(first_time_talk_a == true){
				local ID_ACE = ReadNpc_("n002");
				npc_ACE = ArrangePointNpc_(ID_ACE , "A002_2");
				SetReactorMsg_(npc_ACE, "NPC_ACE_REC");
			}
			
			// ���h��
			//���������t���O
			if(appear_inn == true){
				if(first_time_talk_i == false){
					local ID_NPC_000 = ReadNpc_("n000");
					npc_INN = ArrangePointNpc_(ID_NPC_000, "A003");
					SetManualCalcAlpha_(npc_INN, true);
					SetAlpha_(npc_INN, 0.0);
				}
			}
			//�b�����������t���O
			if(first_time_talk_i == true){
				local ID_NPC_000 = ReadNpc_("n000");
				npc_INN = ArrangePointNpc_(ID_NPC_000, "A003_2");
				SetReactorMsg_(npc_INN, "NPC_NOCHO_MEN_REC");
			}
			
			// ���W���b�N
			//���������t���O
			if(appear_jack == true){
				local ID_JACK = ReadNpc_("n001");
				npc_JAC = ArrangePointNpc_(ID_JACK, "A000");
				SetManualCalcAlpha_(npc_JAC, true);
				SetAlpha_(npc_JAC, 0.0);
			}
			
			// ���m�`������
			local ID_NOCHORIN = ReadNpc_("n043");
			npc_A = ArrangePointNpc_(ID_NOCHORIN, "A004");
			SetReactorMsg_(npc_A, "NPC_NOCHO_MEN_REC");
			// �^�[�Q�b�g����ؑ�(�m�`���������m�`���[��)
			SetTargetNameKey_(npc_A, "NAME_TAG_NOCHORA");
		}
		
		// demo016[�W���b�N�Ƃ̏o�]�̍Đ��� �` �{�[�V���b�N��|���܂�
		if(event_num >= GetFlagID_("CONST_SS_GR_MEET_JACK")						// Num2 = 8
		&& event_num <= GetFlagID_("CONST_SS_GR_WIN_BOWSHOCK")){				// Num2 = 17
			// ���W���b�N
			// ���N�C�[��
			//  �[���f��[�W���b�N����̈˗�]�Đ���܂�
			if(event_num >= GetFlagID_("CONST_SS_GR_MEET_JACK")					// Num2 = 8
			&& event_num <= GetFlagID_("CONST_SS_GR_GO_RULAR_STEEL")){			// Num2 = 10
				// ���\�[�X�̓Ǎ�
				local ID_JACK    = ReadNpc_("n001");		// �W���b�N
				local ID_QUEEN   = ReadNpc_("n005");		// �N�C�[��
				
				switch(event_num)
				{
				// Demo016[�W���b�N�Ƃ̏o�]�Đ���
				case GetFlagID_("CONST_SS_GR_MEET_JACK"):
					npc_JAC = ArrangePointNpc_(ID_JACK, "B000");
					npc_QEN = ArrangePointNpc_(ID_QUEEN, "B003_1");
					SetTalkCameraType_(npc_JAC, TALK_CAMERA_UP);
					SetTalkCameraType_(npc_QEN, TALK_CAMERA_UP);
					SetReactorEvent_(npc_JAC);
					SetReactorEvent_(npc_QEN);
					
					// �^�[�Q�b�g����ؑ�(�N�C�[�����m�`���[��)
					SetTargetNameKey_(npc_QEN, "NAME_TAG_NOCHORA");
					break;
					
				// Demo042[�G�[�X�ɂ�郊�A�N�^�[�C��]�Đ���
				case GetFlagID_("CONST_SS_GR_TALK_QUEEN"):
					npc_JAC = ArrangePointNpc_(ID_JACK, "B000_1");
					npc_QEN = ArrangePointNpc_(ID_QUEEN, "B003");
					SetTalkCameraType_(npc_JAC, TALK_CAMERA_UP);
					SetTalkCameraType_(npc_QEN, TALK_CAMERA_UP);
					SetReactorEvent_(npc_JAC);
					SetReactorEvent_(npc_QEN);
					
					// �^�[�Q�b�g����ؑ�(�N�C�[�����m�`���[��)
					SetTargetNameKey_(npc_QEN, "NAME_TAG_NOCHORA");
					
					// ��b�ł��Ȃ��悤�ɂ���
					SetTalkEnable_(npc_JAC, false);
					SetTalkEnable_(npc_QEN, false);
					break;
					
				// �[���f��[�W���b�N�E�N�C�[������̈˗�]�Đ���
				case GetFlagID_("CONST_SS_GR_GO_RULAR_STEEL"):
					// �z�u�ύX���Ȃ�
					if(GetEventFlg_("BFG_RESET_POS_JACK_AND_QUEEN") == false){	// Bit1022
						npc_JAC = ArrangePointNpc_(ID_JACK , "001");
						npc_QEN = ArrangePointNpc_(ID_QUEEN, "002");
						SetTalkCameraType_(npc_JAC, TALK_CAMERA_UP);
						SetTalkCameraType_(npc_QEN, TALK_CAMERA_UP);
						SetReactorEvent_(npc_JAC);
						SetReactorEvent_(npc_QEN);
					}
					// �z�u�ύX����
					else{
						npc_JAC = ArrangePointNpc_(ID_JACK , "B000_2");
						npc_QEN = ArrangePointNpc_(ID_QUEEN, "B002");
						SetTalkCameraType_(npc_JAC, TALK_CAMERA_UP);
						SetTalkCameraType_(npc_QEN, TALK_CAMERA_UP);
						SetReactorEvent_(npc_JAC);
						SetReactorEvent_(npc_QEN);
					}
					break;
					
				default:
					DebugPrint("�L���O���A�҂���܂Ŕz�u���Ă��������ɊY�����Ă��܂���");
					break;
				}
			}
			else{
				local ID_JACK    = ReadNpc_("n001");
				local ID_QUEEN   = ReadNpc_("n005");
				
				npc_JAC = ArrangePointNpc_(ID_JACK , "001");
				npc_QEN = ArrangePointNpc_(ID_QUEEN, "002");
				SetTalkCameraType_(npc_JAC, TALK_CAMERA_UP);
				SetTalkCameraType_(npc_QEN, TALK_CAMERA_UP);
				SetReactorEvent_(npc_JAC);
				SetReactorEvent_(npc_QEN);
			}
			
			// ���\�[�X�̓Ǎ�
			local ID_NPC_000  = ReadNpc_("n000");		// �m�`���[���j
			local ID_ACE      = ReadNpc_("n002");		// �G�[�X
			local ID_NOCHORIN = ReadNpc_("n043");		// �m�`������
			
			// ���h��
			npc_INN = ArrangePointNpc_(ID_NPC_000, "009");
			SetSearchableAngle_(npc_INN, SEARCHABLE_ANGLE_MINIMUM);
			SetTalkCameraType_(npc_INN, TALK_CAMERA_UP);
			SetReactorEvent_(npc_INN);
			
			// ���m�`������
			npc_A = ArrangePointNpc_(ID_NOCHORIN, "B001");
			SetTalkCameraType_(npc_A, TALK_CAMERA_UP);
			SetReactorEvent_(npc_A);
			
			// ���G�[�X
			// demo016[�W���b�N�Ƃ̏o�]�Đ���
			if(event_num == GetFlagID_("CONST_SS_GR_MEET_JACK")){				// NUm2 = 8
				npc_ACE = ArrangePointNpc_(ID_ACE, "003");
				SetTalkCameraType_(npc_ACE, TALK_CAMERA_DEF);
				SetReactorEvent_(npc_ACE);
			}
			else{
				npc_ACE = ArrangePointNpc_(ID_ACE, "003");
				SetTalkCameraType_(npc_ACE, TALK_CAMERA_UP);
				SetReactorEvent_(npc_ACE);
			}
			
			// �����ݒ�
			// demo016[�W���b�N�Ƃ̏o�]�Đ���
			if(event_num == GetFlagID_("CONST_SS_GR_MEET_JACK")){				// Num2 = 8
				// �W���b�N�ƃm�`���������������킹��
				SetDirToPoint_(npc_JAC, "B001");
				SetDirToPoint_(npc_A, "B000");
			}
			else{
				SetDir_(npc_A, 60);
			}
		}
	}
	
	
	//----------
	// ��NPC�z�u
	//----------
	// ID������
	g_npc_cf_white <- C_NONE_ID;
	g_npc_cf_green <- C_NONE_ID;
	g_npc_cf_black <- C_NONE_ID;
	g_npc_cf_blue <- C_NONE_ID;
	g_npc_cf_yellow <- C_NONE_ID;
	g_npc_cf_red <- C_NONE_ID;

	// �y�����N���A��z
	if( GetEventFlg_("BFG_SCENARIO_CLEAR_GRASS") == true ){
		// ���z���C�g
		g_npc_cf_white  = ArrangePointNpc_(ReadNpc_("n044"), "npc_color_white");
		SetScaleSilhouette(g_npc_cf_white, SCALE.N, SILHOUETTE_WIDTH.N);
		SetTalkCameraType_(g_npc_cf_white, TALK_CAMERA_UP);
		SetReactorMsg_(g_npc_cf_white, "NPC_COLORFONDUE_WHITE_REC");

		// ���O���[��
		if( GetEventFlg_("BFG_STEALTHBOX_LARGE_OPEN_01") == true ){
			g_npc_cf_green  = ArrangePointNpc_(ReadNpc_("n049"), "npc_color_green");
			SetScaleSilhouette(g_npc_cf_green, SCALE.N, SILHOUETTE_WIDTH.N);
			SetSearchableAngle_(g_npc_cf_green, SEARCHABLE_ANGLE_MINIMUM);
			SetReactorMsg_(g_npc_cf_green, "NPC_COLORFONDUE_GREEN_REC");
		}

		// ���u���b�N
		if( GetEventFlg_("BFG_STEALTHBOX_LARGE_OPEN_02") == true ){
			g_npc_cf_black  = ArrangePointNpc_(ReadNpc_("n045"), "npc_color_black");
			SetScaleSilhouette(g_npc_cf_black, SCALE.N, SILHOUETTE_WIDTH.N);
			SetTalkCameraType_(g_npc_cf_black, TALK_CAMERA_UP);
			SetSearchableAngle_(g_npc_cf_black, SEARCHABLE_ANGLE_MINIMUM);
			SetReactorMsg_(g_npc_cf_black, "NPC_COLORFONDUE_BLACK_REC");
			SetEventFlg_("BFG_H00_ITEM_SHOP_ICON", true);		// ����A�C�R��
			SetNumFlg_("NUM_FLG_SHOP_H01_00_ITEM_LEVEL", 1);	//�t�H���f���o�c�p�̃��x���ɕύX
		}

		// ���u���[
		if( GetEventFlg_("BFG_STEALTHBOX_LARGE_OPEN_03") == true ){
			g_npc_cf_blue  = ArrangePointNpc_(ReadNpc_("n047"), "npc_color_blue");
			SetScaleSilhouette(g_npc_cf_blue, SCALE.N, SILHOUETTE_WIDTH.N);
			SetReactorMsg_(g_npc_cf_blue, "NPC_COLORFONDUE_BLUE_REC");
		}

		// ���C�G���[
		if( GetEventFlg_("BFG_STEALTHBOX_LARGE_OPEN_04") == true ){
			g_npc_cf_yellow  = ArrangePointNpc_(ReadNpc_("n048"), "npc_color_yellow");
			SetScaleSilhouette(g_npc_cf_yellow, SCALE.N, SILHOUETTE_WIDTH.N);
			SetReactorMsg_(g_npc_cf_yellow, "NPC_COLORFONDUE_YELLOW_REC");
		}

		// �����b�h
		if( GetEventFlg_("BFG_STEALTHBOX_LARGE_OPEN_05") == true ){
			g_npc_cf_red  = ArrangePointNpc_(ReadNpc_("n046"), "npc_color_red");
			SetScaleSilhouette(g_npc_cf_red, SCALE.N, SILHOUETTE_WIDTH.N);
			SetReactorMsg_(g_npc_cf_red, "NPC_COLORFONDUE_RED_REC");
		}
	}
	
	// ������
	npc_Rukiya <- C_NONE_ID;
	
	// �y�\�V�i���I�N���A��z
	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){ // NUM000 = 9
		if(outside_num == GetFlagID_("CONST_SS_OS_GO_POINT_ZERO")){ // NUM010 = 2
			// �|�C���g�E�[���ɓ�������z�u����Ȃ��悤�ɂ���
			if(GetEventFlg_("BFG_DEMO801_AFTER_U00_00") == false){		// Bit1386
				npc_Rukiya = ReadAndArrangePointNpc("n009", "014");
				SetTalkCameraType_(npc_Rukiya, TALK_CAMERA_UP);
				SetReactorMsg_(npc_Rukiya, "NPC_RUKIYA_REC");
				// ��b�J�������ɓ��߂����̂ŃA���t�@�l��ݒ肷��
				SetManualCalcAlpha_(npc_Rukiya, true);
				SetAlpha_(npc_Rukiya, 1.0);
			}
		}
	}

//----------------------------------------------------------
// �S�ŕ��A����
	// �S�ŕ��A���̋[���f���ڍs�̏���(EventStartOperate()����ArrangePointNpc_()���s���Ȃ��̂�)
	if(check_dead == true){
		if(main_num == GetFlagID_("CONST_SM_GRASSLAND")){
			if(event_num >= GetFlagID_("CONST_SS_GR_GO_RULAR_STEEL")
			&& event_num < GetFlagID_("CONST_SS_GR_RETURN_KING")){
				// �m�`���������ꎞ�I�ɉ�b�ł��Ȃ��悤�ɂ���
				SetTalkEnable_(npc_A, false);
			}
			else if(event_num >= GetFlagID_("CONST_SS_GR_RETURN_KING")
			&& event_num < GetFlagID_("CONST_SS_GR_CLIFF")){
				// �L���O���ꎞ�I�ɉ�b�ł��Ȃ��悤�ɂ���
				SetTalkEnable_(npc_KNG, false);
			}
			else if(event_num >= GetFlagID_("CONST_SS_GR_CLIFF")){
				// �m�`���������ꎞ�I�ɔz�u
				dead_npc <- C_NONE_ID;
				dead_npc = ReadAndArrangePointNpc("n043", "B001");
				SetTalkEnable_(dead_npc, false);
			}
		}
	}

//------------------------------------------------------------------
// �M�~�b�N
	// ���m���X
	local g_monolith = ReadGimmick_("o_com_02");
	monolith <- ArrangePointGimmick_("o_com_02", g_monolith, "g_monolith");
	//�u�I�v�A�C�R��
	local exclamation01 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "g_monolith"); 
	//���m���X���֌�A�u�I�v�A�C�R����\��
	if(main_num <= 1 && event_num < GetFlagID_("CONST_SS_VC_TRY_RANK_C")){
		SetNaviMapIconVisible_(exclamation01, false);
	}
	else{
		SetNaviMapIconVisible_(exclamation01, true);
	}

	// �i���֎~�̊�
	if(main_num <= 1 && event_num < GetFlagID_("CONST_SS_VC_TRY_RANK_C")){
		local g_flag = ReadGimmick_("o_H01_01");
		local stop_flag = ArrangePointGimmick_("o_H01_01", g_flag, "g_flag");
	}

	//�m�`���[���������B���M�~�b�N
	local id_barrel = ReadGimmick_("o_H01_03");
	local id_wooden_box = ReadGimmick_("o_H01_04");
	local green01 = ArrangePointGimmick_("o_H01_03", id_barrel, "g_green_01");//�N�C�[��
	local green02 = ArrangePointGimmick_("o_H01_04", id_wooden_box, "g_green_02");//�G�[�X
	local green03 = ArrangePointGimmick_("o_H01_03", id_barrel, "g_green_03");//�h��
	local green04 = ArrangePointGimmick_("o_H01_04", id_wooden_box, "g_green_04");//�W���b�N

//------------------------------------------------------------------
// �C�x���g�n���̐ݒu
	// ���m���X(�C�x���g�n��)
	Monolith    <- C_NONE_ID;
	Mine_Exit_K <- C_NONE_ID;
	Mine_Exit   <- C_NONE_ID;
	Mine_INN    <- C_NONE_ID;
	Mine_Exit_E <- C_NONE_ID;

	Monolith = SetPointCircleEventMine_("Monolith", true);
	// ���A�N�^�[���G�[�X�ɒ����Ă���킸�Ƀp�[�N���o��ƃW���b�N�ɌĂю~�߂���n��
	if(main_num == 1){
		if(event_num == GetFlagID_("CONST_SS_GR_GET_RIDE_SKILL_JUMP")){
			Mine_Exit_K = SetPointCircleEventMine_("Mine_Exit", false);
			// ���̎��������[���֎~�Ȃ̂Ńt���O�𗧂Ă�i�t���O�ݒ��EventEnd_()���O�ōs���܂�
		}
	}
	// ���A�N�^�[�C����W���b�N�ƃN�C�[���ɋ߂Â�
	if(event_num == GetFlagID_("CONST_SS_GR_TALK_QUEEN")){
		Mine_Exit = SetPointCircleEventMine_("Mine_Exit", false);
	}
	// ���l�h���p�C�x���g�n��(�ږ��J�n�`�ږ������܂Ŕz�u)
	if(start_immg_flg == true && finish_immg_flg == false){
		Mine_INN = SetPointCircleEventMine_("Mine_INN", true);
	}
	// 
	// ���l�h���p�C�x���g�n��(�J���[�t�H���f���C�x���g�ׁ̈A����< �ږ������ȍ~ >��ǉ�)
	if(start_immg_flg == false && finish_immg_flg == true){
		Mine_INN = SetPointCircleEventMine_("Mine_INN", true);
	}
	// �m�o�b������������܂ŁA�E�b�h�p�[�N�̓����������n��
	if(main_num == GetFlagID_("CONST_SM_GRASSLAND")){
		if(event_num == GetFlagID_("CONST_SS_GR_HIDE_AND_SEEK")){
			Mine_Exit_E = SetPointCircleEventMine_("Mine_Exit", false);
		}
	}

//-------------------------------------------------------------------------------
//���A�N�^�[�|�C���g
	//���
	local reactorPoint01 = ArrangeMsgReactorPoint("reactorPoint_01", GetFlagID_("BFG_REACTER_POINT_006")
		, LONG_DIST, "REC_POINT_GR_01_01", "REC_POINT_GR_01_02");
	//���m���X
	local reactorPoint02 = ArrangeMsgReactorPoint("reactorPoint_02", GetFlagID_("BFG_REACTER_POINT_013")
		, SHORT_DIST, "REC_POINT_GR_02_01", "REC_POINT_GR_02_02");
	//���Z�������u
	local reactorPoint03 = ArrangeMsgReactorPoint("reactorPoint_03", GetFlagID_("BFG_REACTER_POINT_008")
		, SHORT_DIST, "REC_POINT_GR_03_01", "REC_POINT_GR_03_02");
	//������
	local reactorPoint04 = ArrangeMsgReactorPoint("reactorPoint_04", GetFlagID_("BFG_REACTER_POINT_007")
		, SHORT_DIST, "REC_POINT_GR_04_01", "REC_POINT_GR_04_02");

	//�B��Ă���m�`���[�������ɏ��߂Ęb�����������ǂ������ׂ�t���O
	local first_time_talk_j = GetEventFlg_("BFG_FIRST_TIME_TALK_JACK");
	local first_time_talk_q = GetEventFlg_("BFG_FIRST_TIME_TALK_QUEEN");
	local first_time_talk_a = GetEventFlg_("BFG_FIRST_TIME_TALK_ACE");
	local first_time_talk_i = GetEventFlg_("BFG_FIRST_TIME_TALK_INN");

	//�m�`���[���������B���M�~�b�N�̃��A�N�^�[�|�C���g
	if(main_num == 1){
		// Demo009[�B��Ă���m�`���[��]��ɔz�u����
		if(event_num == GetFlagID_("CONST_SS_GR_HIDE_AND_SEEK")){
			//�M�~�b�N�Ɉ�x�b����������
			if(first_time_talk_q == false){
				reactorPoint_queen <- ArrangeMsgReactorPoint("reactorPoint_queen", GetFlagID_("BFG_REACTER_POINT_174")
					, SHORT_DIST, "REC_POINT_GR_06_01", "REC_POINT_GR_06_02");
				//reactorPoint_queen <- ArrangePointReactorPoint_("reactorPoint_queen", SHORT_DIST); // ��
			}
			if(first_time_talk_a == false){
				reactorPoint_ace <- ArrangeMsgReactorPoint("reactorPoint_ace", GetFlagID_("BFG_REACTER_POINT_172")
					, SHORT_DIST, "REC_POINT_GR_05_01", "REC_POINT_GR_05_02");
				//reactorPoint_ace <- ArrangePointReactorPoint_("reactorPoint_ace", SHORT_DIST); // ��
			}
			if(first_time_talk_i == false){
				reactorPoint_inn <- ArrangeMsgReactorPoint("reactorPoint_inn", GetFlagID_("BFG_REACTER_POINT_175")
					, SHORT_DIST, "REC_POINT_GR_06_01", "REC_POINT_GR_06_02");
				//reactorPoint_inn <- ArrangePointReactorPoint_("reactorPoint_inn", SHORT_DIST); // ��
			}
			reactorPoint_jack <- ArrangeMsgReactorPoint("reactorPoint_jack", GetFlagID_("BFG_REACTER_POINT_173")
				, SHORT_DIST, "REC_POINT_GR_05_01", "REC_POINT_GR_05_02");
			//reactorPoint_jack <- ArrangePointReactorPoint_("reactorPoint_jack", SHORT_DIST); // ��
		}
	}
//----------------------------------------------------------------------
// ���[���֎~
	if(main_num == 1){
		if(event_num == GetFlagID_("CONST_SS_GR_GET_RIDE_SKILL_JUMP")){
			// ���[�����֎~����t���O��ݒ�
			SetEventFlg_("BFG_PLAYERABILITY_RULER_PROHIBIT", true);
		}
	}

// ��b�A�C�R��
	LoadEffect_("EF300_21_TALK_ICON");
	sTalkIconId <- array(HIDE_NPC_KIND.NUM, C_NONE_ID);	// �l�l���̔z�������āAC_NONE_ID �ŏ�����

	EventEnd_();
}

//------------------------------------------------
//		�C�x���g�X�^�[�g
//------------------------------------------------
function EventStartOperate()
{
	local main_num    = GetNumFlg_("NUM_SCENARIO_MAIN");
	local event_num   = GetNumFlg_("NUM_SCENARIO_SUB_GREEN");
	local core_num    = GetNumFlg_("NUM_SCENARIO_SUB_CORE");
	local outside_num = GetNumFlg_("NUM_SCENARIO_SUB_INSIDE_CLEAR");

	DebugPrint(" ");
	DebugPrint("NUM_SCENARIO_MAIN �̒l�� " + main_num + " �ɂȂ�܂����B(�m�`���[���p�[�N)");
	DebugPrint("NUM_SCENARIO_SUB_GREEN �̒l�� " + event_num + " �ɂȂ�܂����B(�m�`���[���p�[�N)");

	local check_dead = GetEventFlg_("BFG_DEAD_RETURN");
//---------------------------------------------------------------------------------------
// �M�~�b�N( �f�������܂��ɃA�j����؂�ւ���I�u�W�F�N�g�̂ݔz�u )
//
	// ���m���X(�u�N���O�ҋ@�v�̃A�j����ݒ�)
	SetMotion_(monolith, "GIMMICK_0", 0);
	DebugPrint("���m���X�̃A�j����GIMMICK_0�ł�");
	if(GetEventFlg_("BFG_START_C_MONOLITH") == true){
		// ���m���X�̋N����ҋ@�A�j�����Đ�
		SetMotion_(monolith, MOT_GIMMICK_2, BLEND_N);
		DebugPrint("���m���X�̃A�j����GIMMICK_2�ł�");
	}

//-----------------------------------------------------------------
// �؂�ւ�����ɔ�������f��

	if(main_num == 1){
		// �m�`���[���̈ږ��v��B�̍Đ�
		if(event_num == GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_2")){
			// �f���Đ��O�Ƀt�B�[���h���f��Ȃ����߂̑Ή�
			SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
			SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
			WaitFade_();
			// �T�u�t���O�� GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_3") �ɕύX
			SetNumFlg_("NUM_SCENARIO_SUB_GREEN", GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_3"));
			// �}�b�v���m�`���[���p�[�N�ɕύX����(������)
			SetReturnDemoMap_("H01_00");
			SetReturnDemoPosDir_(Vec3(-20.0, 0.0, 3.0), 270);
			// Demo036[�m�`���[���̈ږ��v��B]���Đ�����鏈��
			ChangeDemo_(36);
		}
		// �m�`���[���̈ږ��v��A�̍Đ�
		if(event_num == GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_1")){
			// �f���Đ��O�Ƀt�B�[���h���f��Ȃ����߂̑Ή�
			SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
			SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
			WaitFade_();
			// �T�u�t���O�� GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_2") �ɕύX
			SetNumFlg_("NUM_SCENARIO_SUB_GREEN", GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_2"));
			// Demo035[�m�`���[���̈ږ��v��A]���Đ�����鏈��
			ChangeDemo_(35);
		}
		// Demo033[��W�����v���C�h����]���Đ�
		if(event_num == GetFlagID_("CONST_SS_GR_GET_RIDE_SKILL_JUMP")){
			// �f���Đ��O�Ƀt�B�[���h���f��Ȃ����߂̑Ή�
			SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
			SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
			WaitFade_();
			// ���[�����֎~����t���O��ݒ�
			SetEventFlg_("BFG_PLAYERABILITY_RULER_PROHIBIT", false);

			// ���΂ꂤ���ǂ��߂܂��Ă��Ȃ��ꍇ�̃t���O�̕ύX
			SetNumFlg_("NUM_SCENARIO_SUB_GREEN", GetFlagID_("CONST_SS_GR_INVITE_JUMP_MONSTER"));

			SetReturnDemoMap_("H01_00");
			SetReturnDemoPosDir_(Vec3(-18.125, 3.700, -2.875), -89);
			// Demo33���Đ�
			ChangeDemo_(33);
		}
		if(event_num == GetFlagID_("CONST_SS_GR_RETURN_KING")){
			// �f���Đ��O�Ƀt�B�[���h���f��Ȃ����߂̑Ή�
			SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
			SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
			WaitFade_();
			// �T�u�t���O�� GetFlagID_("CONST_SS_GR_RETURN_KING") �ɕύX
			SetNumFlg_("NUM_SCENARIO_SUB_GREEN", GetFlagID_("CONST_SS_VC_TRY_RANK_C"));
			// �S�ŕ��A�}�b�v��ύX(Redmine#2261�S�ŕ��A���[���̉���)
			SetNumFlg_("NUM_DEAD_RETURN_MAP", GetFlagID_("CONST_DEAD_RETURN_MAP_H01_00"));
			// �}�b�v���m�`���[���p�[�N�ɕύX����(������)
			SetReturnDemoMap_("H01_00");
			SetReturnDemoPosDir_(Vec3(-24.33, 3.70, 0.326), -91);
			// Demo21[�L���O�̋A��]���Đ�����鏈��
			ChangeDemo_(21);
		}
		if(event_num == GetFlagID_("CONST_SS_GR_INVITE_MONSTER")){
			// �f���Đ��O�Ƀt�B�[���h���f��Ȃ����߂̑Ή�
			SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
			SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
			WaitFade_();
			// �V�i���I�t���O��i�߂�
			SetNumFlg_("NUM_SCENARIO_SUB_GREEN", GetFlagID_("CONST_SS_GR_HIDE_AND_SEEK"));
			// �G�p�[�e�B�̂����̐��𐧌�t���O(�i�s�x�Q
			SetNumFlg_("NUM_ENEMY_PARTY_STRENGTH", 2);
			// �}�b�v���m�`���[���p�[�N�ɕύX����(������)
			SetReturnDemoMap_("H01_00");
			SetReturnDemoPosDir_(Vec3(251.155, -1.329, -2.057), -102);

			// Demo015[�B��Ă���m�`���[��]���Đ�����鏈��
			ChangeDemo_(15);
		}
	}

	// ���V�i���I
	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){ // NUM000 = 9
		if(outside_num == GetFlagID_("CONST_SS_OS_GO_WOOD_PARK")){ // NUM010 = 1
			// �V��Ǝ��ԑт̌Œ�ׂ̈Ɉꎞ�I�ɃN���A�t���O���~�낵�Ă�������������
			SetEventFlg_("BFG_SCENARIO_CLEAR_GRASS", true);
			// �V�i���I�i�s�t���O( NUM010 �� 1 -> 2 �ɕύX )
			SetNumFlg_("NUM_SCENARIO_SUB_INSIDE_CLEAR", GetFlagID_("CONST_SS_OS_GO_POINT_ZERO"));
			// �f���̕��A�ʒu���f���̊�����ɐݒ肵�܂�
			SetReturnDemoPosDir_(Vec3(15, 0, 0), -90);
			// Demo801[���L���Ƃ̍ĉ�]�Đ�
			EventStartChangeDemo(801, FADE_COLOR_BLACK);
		}
	}

//-----------------------------------------------------------------
// �S�ŕ��A���� : ��������w��(�ꕔ�������قȂ�̂ŋ��ʊ֐��ɒu�������܂���)
	if(check_dead == true){
		if(main_num == GetFlagID_("CONST_SM_GRASSLAND")){
			if(event_num >= GetFlagID_("CONST_SS_GR_GO_RULAR_STEEL")
			&& event_num < GetFlagID_("CONST_SS_GR_RETURN_KING")){
				// �S�ŒʒmBit�t���O��false�ɖ߂�( �v���O�����ŗ��ĂăX�N���v�g�ō~�낷 )
				SetEventFlg_("BFG_DEAD_RETURN", false);
				// �S�ŕ��A�f��
				uDeadReturnDemo1();
			}
			else if(event_num >= GetFlagID_("CONST_SS_GR_RETURN_KING")
			&& event_num < GetFlagID_("CONST_SS_GR_CLIFF")){
				// �S�ŒʒmBit�t���O��false�ɖ߂�( �v���O�����ŗ��ĂăX�N���v�g�ō~�낷 )
				SetEventFlg_("BFG_DEAD_RETURN", false);
				// �S�ŕ��A�f��
				uDeadReturnDemo2();
			}
			else if(event_num >= GetFlagID_("CONST_SS_GR_CLIFF")){
				// �S�ŒʒmBit�t���O��false�ɖ߂�( �v���O�����ŗ��ĂăX�N���v�g�ō~�낷 )
				SetEventFlg_("BFG_DEAD_RETURN", false);
				// �S�ŕ��A�f��
				uDeadReturnDemo3();
			}
		}
	}

//-------------------------------------------------------------
//���A�N�^�[�|�C���g

	//�B��Ă���m�`���[�������ɏ��߂Ęb�����������ǂ������ׂ�t���O
	local first_time_talk_j  = GetEventFlg_("BFG_FIRST_TIME_TALK_JACK");
	local first_time_talk_q  = GetEventFlg_("BFG_FIRST_TIME_TALK_QUEEN");
	local first_time_talk_a  = GetEventFlg_("BFG_FIRST_TIME_TALK_ACE");
	local first_time_talk_i  = GetEventFlg_("BFG_FIRST_TIME_TALK_INN");

	//�m�`���[���������B���M�~�b�N�̃��A�N�^�[�|�C���g
	if(main_num == 1){
		// Demo009[�B��Ă���m�`���[��]��ɔz�u����
		if(event_num == GetFlagID_("CONST_SS_GR_HIDE_AND_SEEK")){
			//�M�~�b�N�Ɉ�x�b����������
			if(first_time_talk_q == false){
				SetReactorEvent_(reactorPoint_queen);
			}
			if(first_time_talk_a == false){
				SetReactorEvent_(reactorPoint_ace);
			}
			if(first_time_talk_i == false){
				SetReactorEvent_(reactorPoint_inn);
			}
			SetReactorEvent_(reactorPoint_jack);
		}
	}

	EventEnd_();
}

//------------------------------------------------
//		�n���ڐG��
//------------------------------------------------
function TouchEventMine()
{
	local target = GetTouchEventMineId_();
	local player = GetPlayerId_();

	// �V�i���I�̃��C���t���O���擾����
	local main_num = GetNumFlg_("NUM_SCENARIO_MAIN");

	// �t���O����C�x���g�ԍ����擾����
	local event_num = GetNumFlg_("NUM_SCENARIO_SUB_GREEN");

	// Demo022[C�����N����]���Đ����ꂽ���ǂ����̃t���O
	local bit_demo022 = GetEventFlg_("BFG_EXAM_RANK_C");

	if(target == Mine_Exit){
	// �[���f��[�W���b�N����̈˗�]
		//�n���폜
		DeleteEventMine_(Mine_Exit);
		// �T�u�t���O�� CONST_SS_GR_GO_RULAR_STEEL �ɕύX
		SetNumFlg_("NUM_SCENARIO_SUB_GREEN", GetFlagID_("CONST_SS_GR_GO_RULAR_STEEL"));
		// �Ó]
		SetFade_(FADE_OUT , FADE_COLOR_BLACK, 30);
		SetFadeSub_(FADE_OUT , FADE_COLOR_BLACK, 30);
		WaitFade_();
		// ��풓���[�V�����Ǎ�(��l�����Ȃ���)
		local nod = ReadMotion_(player, "Player_nod");
		//�J��������ƃW���b�N�N�C�[�����ȂȂ߂ɑ�����悤�ɒ���
		SetCameraDir_(63);
		//�v���C���[�̍��W������ʂɒ����B
		SetPos_(player, Vec3(256.094, -1.236, 1.317));
		SetDir_(player, 86);
		//�W���b�N���炵��ׂ�̂ŁA�N�C�[���͍ŏ��͎�l���̕��������Ȃ��B
		SetDir_(npc_QEN, -90);
		SetMotion_(npc_QEN, "WAIT", BLEND_N);
		//�W���b�N����l���̕�������
		SetDirToPlayer_(npc_JAC);
		Wait_(30);
		// �Ó]����
		SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);
		WaitFade_();
		// �W���b�N�̃��b�Z�[�W
		SetMotion_(npc_JAC, "TALKLOOP", BLEND_M);
		CommonMessageT("DEMO_048_MSG_001", "NAME_TAG_JACK");
		SetMotion_(npc_JAC, "WAIT", BLEND_M);
		// ��l������
		Wait_(15);
		SetMotion_(player, nod, BLEND_M);
		WaitMotion(player);
		SetMotion_(player, MOT_WAIT, BLEND_L);
		// �W���b�N�̃��b�Z�[�W
		SetMotion_(npc_JAC, "TALKLOOP", BLEND_M);
		CommonMessageT("DEMO_048_MSG_002", "NAME_TAG_JACK");
		SetMotion_(npc_JAC, "WAIT", BLEND_M);
		//�N�C�[������l���̕�������
		SetDirToPlayer_(npc_QEN);
		// �N�C�[���̃��b�Z�[�W
		SetMotion_(npc_QEN, "TALKLOOP", BLEND_M);
		CommonMessageT("DEMO_048_MSG_003", "NAME_TAG_QUEEN");
		SetMotion_(npc_QEN, "WAIT", BLEND_M);
		// �A�C�e�����胁�b�Z�[�W�\��
		// SE�Đ�
		PlaySE_("SE_SYS_011");
		CommonMessageT("DEMO_048_MSG_004", "NAME_NONE");
		// �����i�ɒǉ�(������̂�т�)
		CommAddAccessory(200, EQUIP_GRADE.NONE);
		// �t���O�̒ǉ�( 2��DB #3731 )
		//SetEventFlg_("BFG_EQUIPACCESSORY_PROHIBIT", false); //�A�N�Z�T�������i�A�N�e�B�u�j
		//SetEventFlg_("BFG_TRAVEL_INFO_SHOW_013", true); // ���̐S���̍��ډ���t���O	�y���j���[�z�A�N�Z�T���[����
		// �Ó](���ʂ̂�)
		SetFade_(FADE_OUT , FADE_COLOR_BLACK, 30);
		WaitFade_();
		// �Ó]���ɃW���b�N�ƃN�C�[���̈ʒu��ύX
		//�N�C�[���̍Ĕz�u
		SetHideIfFar_(npc_QEN, false);
		SetActive_(npc_QEN, false);
		local ID_QUEEN = ReadNpc_("n005"); // �N�C�[�����f��
		npc_QEN = ArrangePointNpc_(ID_QUEEN  , "B002");
		SetReactorMsg_(npc_QEN, "NPC_QUEEN_REC");
		//�W���b�N�̍Ĕz�u
		SetHideIfFar_(npc_JAC, false);
		SetActive_(npc_JAC, false);
		local ID_JACK = ReadNpc_("n001"); // �W���b�N�̃��f��
		npc_JAC = ArrangePointNpc_(ID_JACK, "B000_2");
		SetReactorMsg_(npc_JAC, "NPC_JACK_REC");
		// �W���b�N�E�N�C�[���̔z�u�ύX�t���O(�����t��:true, ����ʒu:false)
		SetEventFlg_("BFG_RESET_POS_JACK_AND_QUEEN", true);
		SetEventFlg_("BFG_FIXATION_CHARA_WOOD_PARK", true);
		// ��b���J�����̐ݒ�
		SetTalkCameraType_(npc_JAC, TALK_CAMERA_UP);
		SetTalkCameraType_(npc_QEN, TALK_CAMERA_UP);
		Wait_(30);
		//�v���C���[�̍��W������ʂɒ����B
		SetPos_(player, Vec3(256.094, -1.236, 1.317));
		SetDir_(player, 86);
		SetCameraDir_(86);
		// �}�b�v�`�F���W�ł���悤�ɂ���
		SetHitEnableMapChangeNull_("w_H00_00ALdr_001", true);
		// �Ó]����
		SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);
		SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, 30);
		WaitFade_();
		Wait_(15);
	}

	// ���m���X
	if(target == Monolith){
		//�n���폜
		DeleteEventMine_(Monolith);

		// ��l�������m���X�̕����Ɍ�����
		CommPlayerTurnAroundObj(monolith);

		// ���m���X�̃A�j�����Đ�(EventCommon)
		MonolithAnime(monolith, "BFG_START_C_MONOLITH", "g_monolith");

		// �}�b�v�`�F���W��̃}�b�v���E���A���W�E������ϐ����i�[
		local map_name = "O01_00";
		local return_pos = Vec3(0.0, 10.0, 1260.0);	// ���W
		local return_dir = 180;						// �{�Ή��̌���

		// Demo022[C�����N����]���Đ����鏈��
		if(main_num == 1 && event_num == GetFlagID_("CONST_SS_GR_RETURN_KING")){
			if(bit_demo022 == false){
				// �T�u�t���O�� CONST_SM_VC_TRY_RANK_C �ɕύX
				SetNumFlg_("NUM_SCENARIO_SUB_GREEN", GetFlagID_("CONST_SS_VC_TRY_RANK_C"));
				// �}�b�v���o�[�`�����R���V�A���ɕύX����
				SetReturnDemoMap_(map_name);
				SetReturnDemoPosDir_(return_pos, return_dir);
				// Demo022[C�����N����]���Đ����ꂽ��ԂɃt���O���ڍs
				SetEventFlg_("BFG_EXAM_RANK_C", true);
				ChangeDemo_(22);
			}
			else{
			// �ʏ�̃}�b�v�`�F���W
			ChangeMapPosDir_(map_name, return_pos, return_dir);
			}
		}
		else{
			// �ʏ�̃}�b�v�`�F���W
			ChangeMapPosDir_(map_name, return_pos, return_dir);
		}
	}

	if(main_num == 1){
		// �o�[�`�����R���V�A������A���Ă����Ƃ��ɃL���O�ɕ񍐂����Ƀp�[�N����o��Ǝ~�߂���
		if(event_num == GetFlagID_("CONST_SS_GR_GET_RIDE_SKILL_JUMP")){
			if(target == Mine_Exit_K){
				PlayerLeaveMine("NAME_TAG_KING", "DEMO_022_AFT_KING", 256.0, -1.225, -0.64, -90);
			}
		}
	}

	// ���l�̏h��
	if(target == Mine_INN){
		// �w����W�ɉ�]
		local obj_pos = Vec3(213.00, 0.00, -65.00);
		local rotateTask = Task_RotateToPosSetMotion_(player, obj_pos, ROTATE_EVENT_DEF, MOT_WALK, MOT_WAIT);
		WaitTask(rotateTask);
		// �Ԃ���������
		Wait_(15);
		NotInInnMessage();
	}

	// �B��Ă���m�`���[���̃C�x���g���̐i�s�s�n��
	if(target == Mine_Exit_E){
		// ��l���̈ʒu���擾
		local playerPos = GetPos_(player);
		// �����G�t�F�N�g���m�`�������ɕ\��
		LoadEffect_("EF712_10_EMO_SURPRISE01");			// �u�I�v
		SurpriseDisp(npc_A);
		Wait_(15);
		// �m�`���������v���C���[�̕��Ɍ�������< ���Y�^ : Task_RotateToPos_()������,WaitTask()���Ȃ��Ɖ�]���Ȃ��̂Œ��� >
		SetMotion_(npc_A, "WALK", BLEND_M);
		local ROT_DIR = 6; // ��]��
		local rotateTask = Task_RotateToPos_(npc_A, playerPos, ROT_DIR);
		WaitTask(rotateTask);
		SetMotion_(npc_A, "WAIT", BLEND_M);
		OpenMsgWnd_();
		ShowMsg_("DEMO_012_AFT_MINE");
		KeyInputWait_();
		CloseMsgWnd_();
		Wait_(5);
		// �m�`�����������ʂɌ�������
		SetMotion_(npc_A, "WALK", BLEND_M);
		// �m�`����������������������W
		local frondPos = Vec3(-245.000, 0.000, -7.000);
		local rotateFrontTask = Task_RotateToPos_(npc_A, frondPos, ROT_DIR);
		// �m�`��������ҋ@���[�V�����ɖ߂�
		WaitTask(rotateFrontTask);
		SetMotion_(npc_A, "WAIT", BLEND_M);
		// �v���C���[�ړ�
		CommPlayerTurnMoveDirWalk(-90);
	}

	EventEnd_();
}


//------------------------------------------------
//		�m�o�b��b���O
//------------------------------------------------
function BeforeTalkNpc()
{
 	// �t���O���擾����
	local main_num = GetNumFlg_("NUM_SCENARIO_MAIN");
	local event_num = GetNumFlg_("NUM_SCENARIO_SUB_GREEN");

   // �b���������Ă���NPC��ID���擾
    local target = GetTargetId_();
	
	//------------------------------------
	// ���C�h���̉�b�J�����I�t�Z�b�g�ݒ�
	//------------------------------------
	// ���L���O
	if(target == npc_KNG){
		// ���΂ꂤ���ǂ��߂܂������ǂ����ŉ�b�����򂷂�
		if(event_num == GetFlagID_("CONST_SS_GR_INVITE_JUMP_MONSTER")){
			// ��W�����v�ł���푰�̃����X�^�[�Ƀ��C�h���Ă���
			if(CheckHighJumpMonsterRide() == true){
				SetTalkCameraType_(target, TALK_CAMERA_DEF);
			}else{
				SetTalkCameraType_(target, TALK_CAMERA_UP);
			}
		}
	}
	
	// �����L��
	if(target == npc_Rukiya){
		SetRideTalkCamOffset(OFFSET_RUKIYA);
	}
	
	// ���J���[�t�H���f��(�z���C�g)
	if(target == g_npc_cf_white){
		//�Z�킻����Ă��邩�`�F�b�N�J�E���g
		local cf_count = uReturnColorFondueNum();
		//�S�������Ă���
		if ( cf_count == CF_COLORFONDUE_COUNTMAX ) {
			//�y�C���g�z�����ւ��Ă��Ȃ�(�[���f���Đ����̂�)
			if(GetEventFlg_("BFG_COUPLING_UNLOCK_PAINT") == false){
				SetTalkTurn_(target, false);
				SetTalkCameraType_(target, TALK_CAMERA_DEF);
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
	local target = GetTargetId_();
	local player = GetPlayerId_();

	// �V�i���I�̃��C���t���O���擾����
	local main_num = GetNumFlg_("NUM_SCENARIO_MAIN");

	// �t���O����C�x���g�ԍ����擾����
	local event_num = GetNumFlg_("NUM_SCENARIO_SUB_GREEN");

	//�B��Ă���m�`���[�����������������ǂ������ׂ�t���O
	local appear_jack  = GetEventFlg_("BFG_APPEAR_JACK");
	local appear_queen = GetEventFlg_("BFG_APPEAR_QUEEN");
	local appear_ace   = GetEventFlg_("BFG_APPEAR_ACE");
	local appear_inn   = GetEventFlg_("BFG_APPEAR_INN");

	//�B��Ă���m�`���[�������ɏ��߂Ęb�����������ǂ������ׂ�t���O
	local first_time_talk_j  = GetEventFlg_("BFG_FIRST_TIME_TALK_JACK");
	local first_time_talk_q = GetEventFlg_("BFG_FIRST_TIME_TALK_QUEEN");
	local first_time_talk_a   = GetEventFlg_("BFG_FIRST_TIME_TALK_ACE");
	local first_time_talk_i   = GetEventFlg_("BFG_FIRST_TIME_TALK_INN");

// Demo009[�B��Ă���m�`���[��]��ɘb����NPC
	// �G�[�X
	if(target == npc_ACE){
		if(main_num == 1){
			if(event_num >= GetFlagID_("CONST_SS_GR_HIDE_AND_SEEK")){
				if(appear_ace == true){
					if(event_num == GetFlagID_("CONST_SS_GR_HIDE_AND_SEEK")){
						if(first_time_talk_a == false){
							CommHideAndSeek(target, reactorPoint_ace, player);
						}
						else{
							// �ʏ��b( ��S�������u0�v)
							TalkTaget(target, main_num, event_num, 0);
						}
					}
					else if(event_num >= GetFlagID_("CONST_SS_GR_MEET_JACK")
					&& event_num <= GetFlagID_("CONST_SS_GR_GO_RULAR_STEEL")){
						switch(event_num)
						{
						// Demo016[�W���b�N�Ƃ̏o�]�Đ���
						case GetFlagID_("CONST_SS_GR_MEET_JACK"):
							// �T�u�t���O�� GetFlagID_("CONST_SS_GR_TALK_QUEEN") �ɕύX
							SetNumFlg_("NUM_SCENARIO_SUB_GREEN", GetFlagID_("CONST_SS_GR_TALK_QUEEN"));
							// �t���O
							SetEventFlg_("BFG_REACTOR_UNLOCK_STEALTHBOX_SONAR", true);	//�X�e���X�{�b�N�X�̃\�i�[����
							SetEventFlg_("BFG_TRAVEL_INFO_SHOW_039", true);				//���̐S���̍��ډ���t���O�y�t�B�[���h�z�X�e���X�{�b�N�X
							// ��l���̔z�u�ʒu�����킹��
							SetReturnDemoPosDir_(Vec3(39.37, -0.039, -99.184), -175);
							// �b���������炷���Ƀt�F�[�h �{ Demo42[�G�[�X�ɂ�郊�A�N�^�[�C��]���Đ�
							TouchNpcChangeDemo(42);
							break;
						// Demo042[�G�[�X�ɂ�郊�A�N�^�[�C��]�Đ���
						case GetFlagID_("CONST_SS_GR_TALK_QUEEN"):
							OpenMsgWnd_();
							SetTalkName_("NAME_TAG_ACE");
							ShowMsg_("DEMO_013_AFT_ACE_2");
							KeyInputWait_();
							CloseMsgWnd_();
							break;
						// �[���f��[�W���b�N�E�N�C�[������̈˗�]�Đ���
						case GetFlagID_("CONST_SS_GR_GO_RULAR_STEEL"):
							OpenMsgWnd_();
							SetTalkName_("NAME_TAG_ACE");
							ShowMsg_("DEMO_013_AFT_ACE");
							KeyInputWait_();
							CloseMsgWnd_();
							break;
						default:
							DebugPrint("�G�[�X�̉�b��������𖞂����Ă��܂���");
							break;
						}
					}
					else{
						// �ʏ��b( ��S�������u0�v)
						TalkTaget(target, main_num, event_num, 0);
					}
				}
			}
		}
	}
	// �h��
	if(target == npc_INN){
		if(appear_inn == true){
			if(main_num == 1){
				// �ʏ��b
				if(event_num == 0 || event_num == GetFlagID_("CONST_SS_GR_HIDE_AND_SEEK")){
					if(first_time_talk_i == false){
						CommHideAndSeek(target, reactorPoint_inn, player);
					}
					else{
						// �ʏ��b( ��S�������u0�v)
						TalkTaget(target, main_num, event_num, 0);
					}
				}
				// �h����b
				else{
					local player = GetPlayerId_();
					InnMessage(npc_INN, "INN_NOC_MSG_1ST_001","INN_NOC_MSG_1ST_002","INN_NOC_MSG_1ST_003");
				}
			}
			// �h����b
			else{
				local player = GetPlayerId_();
				InnMessage(npc_INN, "INN_NOC_MSG_1ST_001","INN_NOC_MSG_1ST_002","INN_NOC_MSG_1ST_003");
			}
		}
	}
	// �W���b�N
	if(target == npc_JAC){
		if(appear_jack == true){
			if(main_num == 1){
				if(event_num == GetFlagID_("CONST_SS_GR_HIDE_AND_SEEK")){
					// �T�u�t���O�� GetFlagID_("CONST_SS_GR_MEET_JACK") �ɕύX
					SetNumFlg_("NUM_SCENARIO_SUB_GREEN", GetFlagID_("CONST_SS_GR_MEET_JACK"));
					SetEventFlg_("BFG_TRAVEL_INFO_SHOW_007", true);	// ���̐S���̍��ډ���t���O	�y��{�z���ԃ����X�^�[�̉�

					// ��l���̔z�u�ʒu��[�W���b�N�Ƃ̏o�]�f����ɍ��킹��
					SetReturnDemoMap_("H01_00");
					SetReturnDemoPosDir_(Vec3(75.9, -1.26, 7.7), -172);

					SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
					SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
					WaitFade_();

					// ���l�����ɖ߂�
					SetManualCalcAlpha_(npc_JAC, true);
					SetAlpha_(npc_JAC, 1.0);

					//�B��Ă���m�`���[�����������t���O
					SetEventFlg_("BFG_APPEAR_JACK", true);
					SetEventFlg_("BFG_APPEAR_QUEEN", true);
					SetEventFlg_("BFG_APPEAR_ACE", true);
					SetEventFlg_("BFG_APPEAR_INN", true);
					SetEventFlg_("BFG_FIRST_TIME_TALK_JACK", true);
					SetEventFlg_("BFG_FIRST_TIME_TALK_QUEEN", true);
					SetEventFlg_("BFG_FIRST_TIME_TALK_ACE",true);
					SetEventFlg_("BFG_FIRST_TIME_TALK_INN", true);

					// �S�ŕ��A�}�b�v��ύX(Redmine#2261�S�ŕ��A���[���̉���)
					SetNumFlg_("NUM_DEAD_RETURN_MAP", GetFlagID_("CONST_DEAD_RETURN_MAP_H01_00"));

					// Demo016[�W���b�N�Ƃ̏o�]���Đ�
					ChangeDemo_(16); 
				}
				else if(event_num >= GetFlagID_("CONST_SS_GR_MEET_JACK")
				&& event_num <= GetFlagID_("CONST_SS_GR_WIN_BOWSHOCK")){
					// Demo016[�W���b�N�Ƃ̏o�]�Đ���
					if(event_num == GetFlagID_("CONST_SS_GR_MEET_JACK")){
						CommonMessageT("DEMO_013_AFT_JAC_WARNING", "NAME_TAG_JACK");
					}
					// Demo042[�G�[�X�ɂ�郊�A�N�^�[�C��]�Đ���
					else if(event_num == GetFlagID_("CONST_SS_GR_TALK_QUEEN")){
						// �b���������Ȃ��悤�ɂ��Ă���̂ŉ����������Ȃ�
					}
					// �[���f��[�W���b�N�E�N�C�[������̈˗�]�Đ���`�{�[�V���b�N�폟���܂�
					else{
						TalkTaget(target, main_num, event_num, 0);
					}
				}
				// �ʏ��b
				else{
					TalkTaget(target, main_num, event_num, 0);
				}
			}
		}
	}
	// �N�C�[��
	if(target == npc_QEN){
		if(appear_queen == true){
			if(main_num == 1){
				if(event_num == GetFlagID_("CONST_SS_GR_HIDE_AND_SEEK")){
					if(first_time_talk_q == false){
						CommHideAndSeek(target, reactorPoint_queen, player);
					}
					else{
						// �ʏ��b( ��S�������u0�v)
						TalkTaget(target, main_num, event_num, 0);
					}
				}
				else if(event_num >= GetFlagID_("CONST_SS_GR_MEET_JACK")
				&& event_num <= GetFlagID_("CONST_SS_GR_WIN_BOWSHOCK")){
					// Demo016[�W���b�N�Ƃ̏o�]�Đ���
					if(event_num == GetFlagID_("CONST_SS_GR_MEET_JACK")){
						CommonMessageT("DEMO_013_AFT_QEN_WARNING", "NAME_NONE");
					}
					// Demo042[�G�[�X�ɂ�郊�A�N�^�[�C��]�Đ���
					else if(event_num == GetFlagID_("CONST_SS_GR_TALK_QUEEN")){
						// �b���������Ȃ��悤�ɂ��Ă���̂ŉ����������Ȃ�
					}
					// �[���f��[�W���b�N�E�N�C�[������̈˗�]�Đ���`�{�[�V���b�N�폟���܂�
					else{
						TalkTaget(target, main_num, event_num, 0);
					}
				}
				// �ʏ��b
				else{
					TalkTaget(target, main_num, event_num, 0);
				}
			}
		}
	}
	// NPC_A( �m�`������ )
	if(target == npc_A){
		if(main_num == 1){
			if(event_num >= GetFlagID_("CONST_SS_GR_HIDE_AND_SEEK")){
				TalkTaget(target, main_num, event_num, 0);
			}
		}
	}

// Demo015[�L���O�̋A��]��ɘb����������NPC
	// �A�N�Z�T���[��
	if(target == npc_ACC){
		if(main_num == 1){
			if(event_num >= GetFlagID_("CONST_SS_GR_RETURN_KING")){
				TalkTaget(target, main_num, event_num, 0);
			}
		}
	}
	// ��s��
	if(target == npc_BNK){
		if(main_num == 1){
			if(event_num >= GetFlagID_("CONST_SS_GR_RETURN_KING")){
				TalkTaget(target, main_num, event_num, 0);
			}
		}
	}
	// �{��
	if(target == npc_BOK){
		if(main_num == 1){
			if(event_num >= GetFlagID_("CONST_SS_GR_RETURN_KING")){
				TalkTaget(target, main_num, event_num, 0);
			}
		}
	}
	// ����
	if(target == npc_BUT){
		if(main_num == 1){
			if(event_num >= GetFlagID_("CONST_SS_GR_RETURN_KING")){
				TalkTaget(target, main_num, event_num, 0);
			}
		}
	}
	// ���
	if(target == npc_IMP){
		if(main_num == 1){
			if(event_num >= GetFlagID_("CONST_SS_GR_RETURN_KING")){
				TalkTaget(target, main_num, event_num, 0);
			}
		}
	}
	// NPC_B
	if(target == npc_B){
		if(main_num == 1){
			if(event_num >= GetFlagID_("CONST_SS_GR_RETURN_KING")){
				TalkTaget(target, main_num, event_num, 0);
			}
		}
	}
	// ���A�N�^�[��
	if(target == npc_REC){
		if(main_num == 1){
			if(event_num >= GetFlagID_("CONST_SS_GR_RETURN_KING")){
				TalkTaget(target, main_num, event_num, 0);
			}
		}
	}
	// �L���O
	if(target == npc_KNG){
				// ���΂ꂤ���ǂ��߂܂������ǂ����ŉ�b�����򂷂�
				if(event_num == GetFlagID_("CONST_SS_GR_INVITE_JUMP_MONSTER")){
					// ��W�����v�ł���푰�̃����X�^�[�Ƀ��C�h���Ă���
					if(CheckHighJumpMonsterRide() == true){
						//�����ږ��v��̂R�A���f�����P�̂ݍĐ��ɕύX
						//�x�䂳��ROM��o��Ƀt���O���`���܂��B�i20150331�����j
						//// �T�u�t���O�� CONST_SS_GR_IMMIGRATION_PLAN �ɕύX
						SetNumFlg_("NUM_SCENARIO_SUB_GREEN", GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_1"));
						// �T�u�t���O�� GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_3") �ɕύX
						SetNumFlg_("NUM_SCENARIO_SUB_GREEN", GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_3"));
						// �f���Đ���̕��A�ʒu�𒲐�
						SetReturnDemoMap_("H01_00");
						SetReturnDemoPosDir_(Vec3(-18.125, 3.700, -2.875), -89);
						//����

						// ���΂ꂤ���ǂ蓦�����Ȃ��t���O
						SetEventFlg_("BFG_ABARE_LET_ESCAPE_PROHIBIT", true);
						// �b���������炷���Ƀt�F�[�h �{ Demo034[�m�`���[���̈ږ��v��@]���Đ�
						TouchNpcChangeDemo(34);
					}
					else{
						if(CheckHighJumpMonsterKind() == true){
							// ���C�h���Ęb������悤�ɑ���
							OpenMsgWnd_();
							SetTalkName_("NAME_TAG_KING");
							ShowMsg_("DEMO_023_AFT_KNG_RIDE_OFF");
							KeyInputWait_();
							CloseMsgWnd_();
						}
						else{
							TalkTaget(target, main_num, event_num, 0);
						}
					}
				}

				// �ʏ��b
				else{
					TalkTaget(target, main_num, event_num, 0);
				}

	}

// �ږ����NPC�̉�b�i�J���[�t�H���f���j

	//�Z�킻����Ă��邩�`�F�b�N�J�E���g�i�J���[�t�H���f���S���g���̂œ��ŃJ�E���g���Ă�j
	local cf_count = uReturnColorFondueNum();

	//�J���[�t�H���f���@�z���C�g
	if(target == g_npc_cf_white){
		//�S�������Ă���
		if ( cf_count == CF_COLORFONDUE_COUNTMAX ) {
			//�y�C���g�z�����ւ��Ă���
			if(GetEventFlg_("BFG_COUPLING_UNLOCK_PAINT") == true){
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_CF_WHITE");
				ShowMsg_("COLORFONDUE_WHITE_001");
				KeyInputWait_();
				ShowMsg_("COLORFONDUE_WHITE_002");
				KeyInputWait_();
				CloseMsgWnd_();

			//�y�C���g�z�����ւ��Ă��Ȃ�
			} else {
				// �[���f�� �y�C���g�z�����ցI
				uColorFondueDemo(player);
			}
			//���̃^�C�~���O�ł͖{���s�v�����ǁA��������true�ɂ��Ă���
			SetEventFlg_("BFG_COLOREVENT_WHITE_FIRST_TALK", true);

		//�����ĂȂ�
		} else {
			//���߂ăz���C�g�ɘb��������
			if(GetEventFlg_("BFG_COLOREVENT_WHITE_FIRST_TALK") == false){
				SetEventFlg_("BFG_COLOREVENT_WHITE_FIRST_TALK", true);
				//���������� 0 ��
				if( cf_count == 0 ){
					OpenMsgWnd_();
					ShowMsg_("COLORFONDUE_WHITE_201");
					KeyInputWait_();
					CloseMsgWnd_();
					// �����G�t�F�N�g���z���C�g�ɕ\��
					local ef_id = SetBoneEffect_("ef300_20_target_icon", g_npc_cf_white);
					SetEffectScale_(ef_id, 0.5);
					PlaySE_("SE_DEM_053");
					Wait_(20);
					OpenMsgWnd_();
					ShowMsg_("COLORFONDUE_WHITE_202");
					KeyInputWait_();
					ShowMsg_("COLORFONDUE_WHITE_203");
					KeyInputWait_();
					ShowMsg_("COLORFONDUE_WHITE_204");
					KeyInputWait_();
					SetTalkName_("NAME_TAG_CF_WHITE");
					ShowMsg_("COLORFONDUE_WHITE_205");
					KeyInputWait_();
					ShowMsg_("COLORFONDUE_WHITE_206");
					KeyInputWait_();
				//���������� 1 �̈ȏ�T�̖���
				} else {
					OpenMsgWnd_();
					ShowMsg_("COLORFONDUE_WHITE_301");
					KeyInputWait_();
					CloseMsgWnd_();
					// �����G�t�F�N�g���z���C�g�ɕ\��
					local ef_id = SetBoneEffect_("ef300_20_target_icon", g_npc_cf_white);
					SetEffectScale_(ef_id, 0.5);
					PlaySE_("SE_DEM_053");
					Wait_(20);
					OpenMsgWnd_();
					ShowMsg_("COLORFONDUE_WHITE_302");
					KeyInputWait_();
					ShowMsg_("COLORFONDUE_WHITE_303");
					KeyInputWait_();
					ShowMsg_("COLORFONDUE_WHITE_304");
					KeyInputWait_();
					SetTalkName_("NAME_TAG_CF_WHITE");
					ShowMsg_("COLORFONDUE_WHITE_305");
					KeyInputWait_();
					ShowMsg_("COLORFONDUE_WHITE_306");
					KeyInputWait_();
				}
				//�u�͂��v��I�΂Ȃ�������i�܂Ȃ��I����
				while ( true ) {
					//�I�����Łu�͂��v��I��
					if ( GetQueryResult_() == QUERY2_0 ) {
						ShowMsg_("COLORFONDUE_WHITE_208");
						KeyInputWait_();
						ShowMsg_("COLORFONDUE_WHITE_209");
						KeyInputWait_();
						ShowMsg_("COLORFONDUE_WHITE_210");
						KeyInputWait_();
						ShowMsg_("COLORFONDUE_WHITE_211");
						KeyInputWait_();
						SetExchangeNumber_( CF_COLORFONDUE_COUNTMAX - cf_count);
						ShowMsg_("COLORFONDUE_WHITE_212");
						KeyInputWait_();
						ShowMsg_("COLORFONDUE_WHITE_213");
						KeyInputWait_();
						CloseMsgWnd_();
						//���[�v���甲����
						break;

					//�I�����Łu�������v��I��
					} else {
						ShowMsg_("COLORFONDUE_WHITE_207");
						KeyInputWait_();
						//���[�v�Ŗ߂�
					}
				}

			//�Q��ڈȍ~�Ńz���C�g�ɘb��������
			} else {
				//�O���[���������Ă��Ȃ�
				if ( GetEventFlg_("BFG_STEALTHBOX_LARGE_OPEN_01") == false ) {
					OpenMsgWnd_();
					SetTalkName_("NAME_TAG_CF_WHITE");
					ShowMsg_("COLORFONDUE_WHITE_401");
					KeyInputWait_();
					SetExchangeNumber_( CF_COLORFONDUE_COUNTMAX - cf_count);
					ShowMsg_("COLORFONDUE_WHITE_402");
					KeyInputWait_();
					ShowMsg_("COLORFONDUE_WHITE_403");
					KeyInputWait_();
					CloseMsgWnd_();

				//�u���b�N�������Ă��Ȃ�
				} else if ( GetEventFlg_("BFG_STEALTHBOX_LARGE_OPEN_02") == false ) {
					OpenMsgWnd_();
					SetTalkName_("NAME_TAG_CF_WHITE");
					ShowMsg_("COLORFONDUE_WHITE_501");
					KeyInputWait_();
					SetExchangeNumber_( CF_COLORFONDUE_COUNTMAX - cf_count);
					ShowMsg_("COLORFONDUE_WHITE_502");
					KeyInputWait_();
					ShowMsg_("COLORFONDUE_WHITE_503");
					KeyInputWait_();
					CloseMsgWnd_();

				//�u���[�������Ă��Ȃ�
				} else if ( GetEventFlg_("BFG_STEALTHBOX_LARGE_OPEN_03") == false ) {
					OpenMsgWnd_();
					SetTalkName_("NAME_TAG_CF_WHITE");
					ShowMsg_("COLORFONDUE_WHITE_601");
					KeyInputWait_();
					SetExchangeNumber_( CF_COLORFONDUE_COUNTMAX - cf_count);
					ShowMsg_("COLORFONDUE_WHITE_602");
					KeyInputWait_();
					ShowMsg_("COLORFONDUE_WHITE_603");
					KeyInputWait_();
					CloseMsgWnd_();

				//�C�G���[�������Ă��Ȃ�
				} else if ( GetEventFlg_("BFG_STEALTHBOX_LARGE_OPEN_04") == false ) {
					OpenMsgWnd_();
					SetTalkName_("NAME_TAG_CF_WHITE");
					ShowMsg_("COLORFONDUE_WHITE_701");
					KeyInputWait_();
					SetExchangeNumber_( CF_COLORFONDUE_COUNTMAX - cf_count);
					ShowMsg_("COLORFONDUE_WHITE_702");
					KeyInputWait_();
					ShowMsg_("COLORFONDUE_WHITE_703");
					KeyInputWait_();
					CloseMsgWnd_();

				//���b�h�������Ă��Ȃ�
				} else if ( GetEventFlg_("BFG_STEALTHBOX_LARGE_OPEN_05") == false ) {
					OpenMsgWnd_();
					SetTalkName_("NAME_TAG_CF_WHITE");
					ShowMsg_("COLORFONDUE_WHITE_801");
					KeyInputWait_();
					SetExchangeNumber_( CF_COLORFONDUE_COUNTMAX - cf_count);
					ShowMsg_("COLORFONDUE_WHITE_802");
					KeyInputWait_();
					ShowMsg_("COLORFONDUE_WHITE_803");
					KeyInputWait_();
					CloseMsgWnd_();
				}

				local chk = false;
				local monskind = 0;
				local mons_count  = 0;

				// ���������X�^�[�̒��ɃJ���[�t�H���f�������邩���m�F
				for(mons_count = 0; mons_count <= ( GetOwnerMonsterNum_() - 1 ); mons_count++){
					monskind = GetOwnerMonsterKind_(mons_count);
					if(monskind == CF_COLORFONDUE_MONSTER_ID){
						chk = true;
						break;
					}
				}
				//�������Ă���
				if ( chk == true ) {
					// �u�I�v�s�R��
					local ef_id = SetSelectBoneEffectSetOffset_("ef300_20_target_icon", g_npc_cf_white, ATTACH_EFFECT2, Vec3(0.0, 10.0, 0.0));
					SetEffectScale_(ef_id, 0.3);
					PlaySE_("SE_DEM_053");
					Wait_(20);
					
					OpenMsgWnd_();
					SetTalkName_("NAME_TAG_CF_WHITE");
					ShowMsg_("COLORFONDUE_WHITE_901");
					KeyInputWait_();
					ShowMsg_("COLORFONDUE_WHITE_902");
					KeyInputWait_();
					ShowMsg_("COLORFONDUE_WHITE_903");
					KeyInputWait_();
					CloseMsgWnd_();

				//�������Ă��Ȃ�
				} else {
					//�Ȃɂ������ɏI��
				}

			}
		}
	}


	//�O���[��
	if(target == g_npc_cf_green){
		local chk = false;
		//�S�������Ă���
		if(cf_count == CF_COLORFONDUE_COUNTMAX){
			//�y�C���g�z�����ւ��Ă���
			if(GetEventFlg_("BFG_COUPLING_UNLOCK_PAINT") == true){
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_CF_GREEN");
				ShowMsg_("COLORFONDUE_GREEN_001");
				KeyInputWait_();
				ShowMsg_("COLORFONDUE_GREEN_002");
				KeyInputWait_();
				ShowMsg_("COLORFONDUE_GREEN_003");
				KeyInputWait_();
				CloseMsgWnd_();

				chk = true;
			//���ւ��Ă��Ȃ�
			} else {
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_CF_GREEN");
				ShowMsg_("COLORFONDUE_GREEN_401");
				KeyInputWait_();
				ShowMsg_("COLORFONDUE_GREEN_402");
				KeyInputWait_();
				CloseMsgWnd_();
			}
		//�����Ă��Ȃ�
		} else {
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_CF_GREEN");
			ShowMsg_("COLORFONDUE_GREEN_501");
			KeyInputWait_();
			ShowMsg_("COLORFONDUE_GREEN_502");
			KeyInputWait_();
			ShowMsg_("COLORFONDUE_GREEN_503");
			KeyInputWait_();
			CloseMsgWnd_();

			chk = true;
		}

		if ( chk == true ) {
			chk = false;

			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_CF_GREEN");
				SetExchangeItemName_(CF_GREEN_PROBLEM_ITEM_ID);
			ShowMsg_("COLORFONDUE_GREEN_004");
			KeyInputWait_();
				SetExchangeItemName_(CF_GREEN_PROBLEM_ITEM_ID);
			ShowMsg_("COLORFONDUE_GREEN_005");
			KeyInputWait_();
				SetExchangeItemName_(CF_GREEN_PROBLEM_ITEM_ID);
				SetExchangeNumber_(CF_GREEN_PROBLEM_ITEM_NUMBER);
				SetExchangeItemName_(CF_GREEN_REWARD_ITEM_ID);
				SetExchangeNumber_(CF_GREEN_REWARD_ITEM_NUMBER);
			ShowMsg_("COLORFONDUE_GREEN_006");
			KeyInputWait_();
			//�I�����Łu�͂��v��I��
			if ( GetQueryResult_() == QUERY2_0 ) {
				//�w��A�C�e�����w����ȏ㎝���Ă���
				if ( CF_GREEN_PROBLEM_ITEM_NUMBER <= GetItemNum_(CF_GREEN_PROBLEM_ITEM_ID) ) {
					CloseMsgWnd_();

					OpenMsgWnd_();
						SetExchangeItemName_(CF_GREEN_PROBLEM_ITEM_ID);
						SetExchangeNumber_(CF_GREEN_PROBLEM_ITEM_NUMBER);
						SetExchangeItemName_(CF_GREEN_REWARD_ITEM_ID);
						SetExchangeNumber_(CF_GREEN_REWARD_ITEM_NUMBER);
					ShowMsg_("COLORFONDUE_GREEN_101");
					KeyInputWait_();
					CloseMsgWnd_();

					//����
					AddItem_(CF_GREEN_PROBLEM_ITEM_ID, -CF_GREEN_PROBLEM_ITEM_NUMBER);
					AddItem_(CF_GREEN_REWARD_ITEM_ID, CF_GREEN_REWARD_ITEM_NUMBER);

					OpenMsgWnd_();
					SetTalkName_("NAME_TAG_CF_GREEN");
					SetExchangeItemName_(CF_GREEN_PROBLEM_ITEM_ID);
					ShowMsg_("COLORFONDUE_GREEN_102");
					KeyInputWait_();
					CloseMsgWnd_();

				//�w��A�C�e�����w����ȏ㎝���Ă��Ȃ�
				} else {
					ShowMsg_("COLORFONDUE_GREEN_201");
					KeyInputWait_();
						SetExchangeItemName_(CF_GREEN_PROBLEM_ITEM_ID);
						SetExchangeNumber_(CF_GREEN_PROBLEM_ITEM_NUMBER);
					ShowMsg_("COLORFONDUE_GREEN_202");
					KeyInputWait_();
					CloseMsgWnd_();

				}
			//�I�����Łu�������v��I��
			} else {
				ShowMsg_("COLORFONDUE_GREEN_301");
				KeyInputWait_();
				CloseMsgWnd_();
			}
		}
	}

	//�u���b�N
	if(target == g_npc_cf_black){
		local chk = false;
		//�S�������Ă���
		if(cf_count == CF_COLORFONDUE_COUNTMAX){
			//�y�C���g�z�����ւ��Ă���
			if(GetEventFlg_("BFG_COUPLING_UNLOCK_PAINT") == true){
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_CF_BLACK");
				ShowMsg_("COLORFONDUE_BLACK_001");
				KeyInputWait_();
				ShowMsg_("COLORFONDUE_BLACK_002");
				KeyInputWait_();
				ShowMsg_("COLORFONDUE_BLACK_003");
				KeyInputWait_();
				CloseMsgWnd_();

				chk = true;
			//���ւ��Ă��Ȃ�
			} else {
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_CF_BLACK");
				ShowMsg_("COLORFONDUE_BLACK_401");
				KeyInputWait_();
				ShowMsg_("COLORFONDUE_BLACK_402");
				KeyInputWait_();
				CloseMsgWnd_();
			}
		//�����Ă��Ȃ�
		} else {
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_CF_BLACK");
			ShowMsg_("COLORFONDUE_BLACK_501");
			KeyInputWait_();
			ShowMsg_("COLORFONDUE_BLACK_502");
			KeyInputWait_();
			CloseMsgWnd_();

			chk = true;
		}

		if ( chk == true ) {
			chk = false;

			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_CF_BLACK");
			ShowMsg_("COLORFONDUE_BLACK_004");
			KeyInputWait_();
			ShowMsg_("COLORFONDUE_BLACK_005");
			KeyInputWait_();
			//�I�����Łu�͂��v��I��
			if ( GetQueryResult_() == QUERY2_0 ) {
				CloseMsgWnd_();

				GotoMenuFadeOpen(MENU_OPEN.H01_00_ITEM);

				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_CF_BLACK");
				ShowMsg_("COLORFONDUE_BLACK_101");
				KeyInputWait_();
				CloseMsgWnd_();

			//�I�����Łu�������v��I��
			} else {
				ShowMsg_("COLORFONDUE_BLACK_301");
				KeyInputWait_();
				CloseMsgWnd_();
			}
		}
	}

	//�u���[
	if(target == g_npc_cf_blue){
		local chk = false;
		//�S�������Ă���
		if(cf_count == CF_COLORFONDUE_COUNTMAX){
			//�y�C���g�z�����ւ��Ă���
			if(GetEventFlg_("BFG_COUPLING_UNLOCK_PAINT") == true){
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_CF_BLUE");
				ShowMsg_("COLORFONDUE_BLUE_001");
				KeyInputWait_();
				ShowMsg_("COLORFONDUE_BLUE_002");
				KeyInputWait_();
				ShowMsg_("COLORFONDUE_BLUE_003");
				KeyInputWait_();
				CloseMsgWnd_();

				chk = true;
			//���ւ��Ă��Ȃ�
			} else {
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_CF_BLUE");
				ShowMsg_("COLORFONDUE_BLUE_401");
				KeyInputWait_();
				ShowMsg_("COLORFONDUE_BLUE_402");
				KeyInputWait_();
				CloseMsgWnd_();
			}
		//�����Ă��Ȃ�
		} else {
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_CF_BLUE");
			ShowMsg_("COLORFONDUE_BLUE_501");
			KeyInputWait_();
			ShowMsg_("COLORFONDUE_BLUE_502");
			KeyInputWait_();
			CloseMsgWnd_();

			chk = true;
		}

		if ( chk == true ) {
			chk = false;

			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_CF_BLUE");
				SetExchangeItemName_(CF_BLUE_PROBLEM_ITEM_ID);
			ShowMsg_("COLORFONDUE_BLUE_004");
			KeyInputWait_();
				SetExchangeItemName_(CF_BLUE_PROBLEM_ITEM_ID);
				SetExchangeNumber_(CF_BLUE_PROBLEM_ITEM_NUMBER);
				SetExchangeItemName_(CF_BLUE_REWARD_ITEM_ID);
				SetExchangeNumber_(CF_BLUE_REWARD_ITEM_NUMBER);
			ShowMsg_("COLORFONDUE_BLUE_005");
			KeyInputWait_();
			//�I�����Łu�͂��v��I��
			if ( GetQueryResult_() == QUERY2_0 ) {
				//�w��A�C�e�����w����ȏ㎝���Ă���
				if ( CF_BLUE_PROBLEM_ITEM_NUMBER <= GetItemNum_(CF_BLUE_PROBLEM_ITEM_ID) ) {
					CloseMsgWnd_();

					OpenMsgWnd_();
						SetExchangeItemName_(CF_BLUE_PROBLEM_ITEM_ID);
						SetExchangeNumber_(CF_BLUE_PROBLEM_ITEM_NUMBER);
						SetExchangeItemName_(CF_BLUE_REWARD_ITEM_ID);
						SetExchangeNumber_(CF_BLUE_REWARD_ITEM_NUMBER);
					ShowMsg_("COLORFONDUE_BLUE_101");
					KeyInputWait_();
					CloseMsgWnd_();

					//����
					AddItem_(CF_BLUE_PROBLEM_ITEM_ID, -CF_BLUE_PROBLEM_ITEM_NUMBER);
					AddItem_(CF_BLUE_REWARD_ITEM_ID, CF_BLUE_REWARD_ITEM_NUMBER);

					OpenMsgWnd_();
					SetTalkName_("NAME_TAG_CF_BLUE");
					ShowMsg_("COLORFONDUE_BLUE_102");
					KeyInputWait_();
					CloseMsgWnd_();

				//�w��A�C�e�����w����ȏ㎝���Ă��Ȃ�
				} else {
					ShowMsg_("COLORFONDUE_BLUE_201");
					KeyInputWait_();
						SetExchangeItemName_(CF_BLUE_PROBLEM_ITEM_ID);
						SetExchangeNumber_(CF_BLUE_PROBLEM_ITEM_NUMBER);
					ShowMsg_("COLORFONDUE_BLUE_202");
					KeyInputWait_();
					CloseMsgWnd_();

				}
			//�I�����Łu�������v��I��
			} else {
				ShowMsg_("COLORFONDUE_BLUE_301");
				KeyInputWait_();
				CloseMsgWnd_();
			}
		}
	}


	//�C�G���[
	if(target == g_npc_cf_yellow){
		local chk = false;
		//�S�������Ă���
		if(cf_count == CF_COLORFONDUE_COUNTMAX){
			//�y�C���g�z�����ւ��Ă���
			if(GetEventFlg_("BFG_COUPLING_UNLOCK_PAINT") == true){
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_CF_YELLOW");
				ShowMsg_("COLORFONDUE_YELLOW_001");
				KeyInputWait_();
				ShowMsg_("COLORFONDUE_YELLOW_002");
				KeyInputWait_();
				ShowMsg_("COLORFONDUE_YELLOW_003");
				KeyInputWait_();
				CloseMsgWnd_();

				chk = true;
			//���ւ��Ă��Ȃ�
			} else {
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_CF_YELLOW");
				ShowMsg_("COLORFONDUE_YELLOW_401");
				KeyInputWait_();
				ShowMsg_("COLORFONDUE_YELLOW_402");
				KeyInputWait_();
				CloseMsgWnd_();
			}
		//�����Ă��Ȃ�
		} else {
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_CF_YELLOW");
			ShowMsg_("COLORFONDUE_YELLOW_501");
			KeyInputWait_();
			ShowMsg_("COLORFONDUE_YELLOW_502");
			KeyInputWait_();
			CloseMsgWnd_();

			chk = true;
		}

		if ( chk == true ) {
			chk = false;

			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_CF_YELLOW");
				SetExchangeItemName_(CF_YELLOW_PROBLEM_ITEM_ID);
			ShowMsg_("COLORFONDUE_YELLOW_004");
			KeyInputWait_();
				SetExchangeItemName_(CF_YELLOW_PROBLEM_ITEM_ID);
				SetExchangeNumber_(CF_YELLOW_PROBLEM_ITEM_NUMBER);
				SetExchangeItemName_(CF_YELLOW_REWARD_ITEM_ID);
				SetExchangeNumber_(CF_YELLOW_REWARD_ITEM_NUMBER);
			ShowMsg_("COLORFONDUE_YELLOW_005");
			KeyInputWait_();
			//�I�����Łu�͂��v��I��
			if ( GetQueryResult_() == QUERY2_0 ) {
				//�w��A�C�e�����w����ȏ㎝���Ă���
				if ( CF_YELLOW_PROBLEM_ITEM_NUMBER <= GetItemNum_(CF_YELLOW_PROBLEM_ITEM_ID) ) {
					CloseMsgWnd_();

					OpenMsgWnd_();
						SetExchangeItemName_(CF_YELLOW_PROBLEM_ITEM_ID);
						SetExchangeNumber_(CF_YELLOW_PROBLEM_ITEM_NUMBER);
						SetExchangeItemName_(CF_YELLOW_REWARD_ITEM_ID);
						SetExchangeNumber_(CF_YELLOW_REWARD_ITEM_NUMBER);
					ShowMsg_("COLORFONDUE_YELLOW_101");
					KeyInputWait_();
					CloseMsgWnd_();

					//����
					AddItem_(CF_YELLOW_PROBLEM_ITEM_ID, -CF_YELLOW_PROBLEM_ITEM_NUMBER);
					AddItem_(CF_YELLOW_REWARD_ITEM_ID, CF_YELLOW_REWARD_ITEM_NUMBER);

					OpenMsgWnd_();
					SetTalkName_("NAME_TAG_CF_YELLOW");
					ShowMsg_("COLORFONDUE_YELLOW_102");
					KeyInputWait_();
					CloseMsgWnd_();

				//�w��A�C�e�����w����ȏ㎝���Ă��Ȃ�
				} else {
					SetExchangeItemName_(CF_YELLOW_PROBLEM_ITEM_ID);
					ShowMsg_("COLORFONDUE_YELLOW_201");
					KeyInputWait_();
						SetExchangeItemName_(CF_YELLOW_PROBLEM_ITEM_ID);
						SetExchangeNumber_(CF_YELLOW_PROBLEM_ITEM_NUMBER);
					ShowMsg_("COLORFONDUE_YELLOW_202");
					KeyInputWait_();
					CloseMsgWnd_();

				}
			//�I�����Łu�������v��I��
			} else {
				ShowMsg_("COLORFONDUE_YELLOW_301");
				KeyInputWait_();
				CloseMsgWnd_();
			}
		}
	}

	//���b�h
	if(target == g_npc_cf_red){
		local chk = false;
		//�S�������Ă���
		if(cf_count == CF_COLORFONDUE_COUNTMAX){
			//�y�C���g�z�����ւ��Ă���
			if(GetEventFlg_("BFG_COUPLING_UNLOCK_PAINT") == true){
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_CF_RED");
				ShowMsg_("COLORFONDUE_RED_001");
				KeyInputWait_();
				ShowMsg_("COLORFONDUE_RED_002");
				KeyInputWait_();
				ShowMsg_("COLORFONDUE_RED_003");
				KeyInputWait_();
				CloseMsgWnd_();

				chk = true;
			//���ւ��Ă��Ȃ�
			} else {
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_CF_RED");
				ShowMsg_("COLORFONDUE_RED_401");
				KeyInputWait_();
				ShowMsg_("COLORFONDUE_RED_402");
				KeyInputWait_();
				CloseMsgWnd_();
			}
		//�����Ă��Ȃ�
		} else {
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_CF_RED");
			ShowMsg_("COLORFONDUE_RED_501");
			KeyInputWait_();
			ShowMsg_("COLORFONDUE_RED_502");
			KeyInputWait_();
			CloseMsgWnd_();

			chk = true;
		}

		if ( chk == true ) {
			chk = false;

			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_CF_RED");
				SetExchangeItemName_(CF_RED_PROBLEM_ITEM_ID);
			ShowMsg_("COLORFONDUE_RED_004");
			KeyInputWait_();
				SetExchangeItemName_(CF_RED_PROBLEM_ITEM_ID);
				SetExchangeNumber_(CF_RED_PROBLEM_ITEM_NUMBER);
				SetExchangeItemName_(CF_RED_REWARD_ITEM_ID);
				SetExchangeNumber_(CF_RED_REWARD_ITEM_NUMBER);
			ShowMsg_("COLORFONDUE_RED_005");
			KeyInputWait_();
			//�I�����Łu�͂��v��I��
			if ( GetQueryResult_() == QUERY2_0 ) {
				//�w��A�C�e�����w����ȏ㎝���Ă���
				if ( CF_RED_PROBLEM_ITEM_NUMBER <= GetItemNum_(CF_RED_PROBLEM_ITEM_ID) ) {
					CloseMsgWnd_();

					OpenMsgWnd_();
						SetExchangeItemName_(CF_RED_PROBLEM_ITEM_ID);
						SetExchangeNumber_(CF_RED_PROBLEM_ITEM_NUMBER);
						SetExchangeItemName_(CF_RED_REWARD_ITEM_ID);
						SetExchangeNumber_(CF_RED_REWARD_ITEM_NUMBER);
					ShowMsg_("COLORFONDUE_RED_101");
					KeyInputWait_();
					CloseMsgWnd_();

					//����
					AddItem_(CF_RED_PROBLEM_ITEM_ID, -CF_RED_PROBLEM_ITEM_NUMBER);
					AddItem_(CF_RED_REWARD_ITEM_ID, CF_RED_REWARD_ITEM_NUMBER);

					OpenMsgWnd_();
					SetTalkName_("NAME_TAG_CF_RED");
					ShowMsg_("COLORFONDUE_RED_102");
					KeyInputWait_();
					CloseMsgWnd_();

				//�w��A�C�e�����w����ȏ㎝���Ă��Ȃ�
				} else {
					ShowMsg_("COLORFONDUE_RED_201");
					KeyInputWait_();
						SetExchangeItemName_(CF_RED_PROBLEM_ITEM_ID);
						SetExchangeNumber_(CF_RED_PROBLEM_ITEM_NUMBER);
					ShowMsg_("COLORFONDUE_RED_202");
					KeyInputWait_();
					CloseMsgWnd_();

				}
			//�I�����Łu�������v��I��
			} else {
				ShowMsg_("COLORFONDUE_RED_301");
				KeyInputWait_();
				CloseMsgWnd_();
			}
		}
	}

	// �N���A�ニ�L��
	if(target == npc_Rukiya){
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_RUKIYA");
		ShowMsg_("RUKIYA_MSG");
		KeyInputWait_();
		CloseMsgWnd_();
	}

	EventEnd_();
}

//------------------------------------------------
//		���A�N�^�[�Œ��ׂ���
//------------------------------------------------
function ReactorAnalyze()
{
	local target = GetTargetId_();
	// �V�i���I�̃��C���t���O���擾����
	local main_num = GetNumFlg_("NUM_SCENARIO_MAIN");
	// �t���O����C�x���g�ԍ����擾����
	local event_num = GetNumFlg_("NUM_SCENARIO_SUB_GREEN");

	local ID_JACK    = ReadNpc_("n001"); // �W���b�N���f��
	local ID_ACE     = ReadNpc_("n002"); // �G�[�X���f��
	local ID_QUEEN   = ReadNpc_("n005"); // �N�C�[�����f��
	local ID_NPC_000 = ReadNpc_("n000"); // �m�`���[���j���f��

	//�B��Ă���m�`���[�����������������ǂ������ׂ�t���O
	local appear_jack  = GetEventFlg_("BFG_APPEAR_JACK");
	local appear_queen = GetEventFlg_("BFG_APPEAR_QUEEN");
	local appear_ace   = GetEventFlg_("BFG_APPEAR_ACE");
	local appear_inn   = GetEventFlg_("BFG_APPEAR_INN");

	//�B��Ă���m�`���[�������ɏ��߂Ęb�����������ǂ������ׂ�t���O
	local first_time_talk_j  = GetEventFlg_("BFG_FIRST_TIME_TALK_JACK");
	local first_time_talk_q = GetEventFlg_("BFG_FIRST_TIME_TALK_QUEEN");
	local first_time_talk_a   = GetEventFlg_("BFG_FIRST_TIME_TALK_ACE");
	local first_time_talk_i   = GetEventFlg_("BFG_FIRST_TIME_TALK_INN");

	DebugPrint("���A�N�^�[�Œ��ׂ�O");

	// ���ʉ�b(�{���͑�S�������u1�v)
	if(event_num != GetFlagID_("CONST_SS_GR_HIDE_AND_SEEK")){
		TalkTaget(target, main_num, event_num, 1);
	}

	//�B�ꂢ�Ă���m�`���[���̃M�~�b�N���A�i���C�Y������
	if(main_num == 1){
		// Demo009[�B��Ă���m�`���[��]��ɔz�u����NPC
		if(event_num == GetFlagID_("CONST_SS_GR_HIDE_AND_SEEK")){
			DebugPrint("�A�N�^�[�Œ��ׂ�ꂽ�Ƃ�");
			//�M�~�b�N�Ɉ�x�b����������
			if(first_time_talk_q == false){
				if(target == reactorPoint_queen){
					if(appear_queen == false){
						//�N�C�[�����݂����t���O
						SetEventFlg_("BFG_APPEAR_QUEEN", true);
						//�m�`���[���𔠂̒��ɐݒu
						npc_QEN <- ArrangePointNpc_(ID_QUEEN  , "A001");  // �N�C�[��
						SetPointPosNoFit_(npc_QEN  , "A001");  // �N�C�[��
						// ��b�A�C�R�����\������Ă��Ȃ���΁A�\������
						SetTalkIcon(npc_QEN, HIDE_NPC_KIND.QUEEN);
						// ���l�蓮�ݒ�
						SetManualCalcAlpha_(npc_QEN, true);
						SetAlpha_(npc_QEN, 0.0);
						//���A�N�^�[���b�Z�[�W
						OpenMsgWnd_();
						SetTalkName_("NAME_TAG_REACTOR");
						ShowMsg_("gimmick_001_1");			// �u�������@���ɉB��Ă���悤���B
						KeyInputWait_();
						CloseMsgWnd_();
					} else {
						//���A�N�^�[���b�Z�[�W
						OpenMsgWnd_();
						SetTalkName_("NAME_TAG_REACTOR");
						ShowMsg_("REC_POINT_GR_06_02");		// �u�E�b�h�p�[�N�Ɂ@�c����Ă����@�Ȃ��̃^���B
						KeyInputWait_();
						CloseMsgWnd_();
					}
				}
			}
			//�M�~�b�N�Ɉ�x�b����������
			if(first_time_talk_a == false){
				if(target == reactorPoint_ace){
					if(appear_ace == false){
						//�G�[�X���݂����t���O
						SetEventFlg_("BFG_APPEAR_ACE", true);
						npc_ACE <- ArrangePointNpc_(ID_ACE    , "A002");  // �G�[�X
						SetPointPosNoFit_(npc_ACE    , "A002");  // �G�[�X
						DebugPrint("�G�[�X��ǂݍ��݂܂���");
						// ��b�A�C�R�����\������Ă��Ȃ���΁A�\������
						SetTalkIcon(npc_ACE, HIDE_NPC_KIND.ACE);
						// ���l�蓮�ݒ�
						SetManualCalcAlpha_(npc_ACE, true);
						SetAlpha_(npc_ACE, 0.0);
						//���A�N�^�[���b�Z�[�W
						OpenMsgWnd_();
						SetTalkName_("NAME_TAG_REACTOR");
						ShowMsg_("gimmick_001_1");			// �u�������@���ɉB��Ă���悤���B
						KeyInputWait_();
						CloseMsgWnd_();
					} else {
						//���A�N�^�[���b�Z�[�W
						OpenMsgWnd_();
						SetTalkName_("NAME_TAG_REACTOR");
						ShowMsg_("REC_POINT_GR_05_02");		// �u�E�b�h�p�[�N�Ɂ@�c����Ă����@�Ȃ��̔��B
						KeyInputWait_();
						CloseMsgWnd_();
					}
				}
			}
			//�M�~�b�N�Ɉ�x�b����������
			if(first_time_talk_i == false){
				if(target == reactorPoint_inn){
					//�h�����݂����t���O
					if(appear_inn == false){
						SetEventFlg_("BFG_APPEAR_INN", true);
						npc_INN <- ArrangePointNpc_(ID_NPC_000, "A003");  // �h��
						SetPointPosNoFit_(npc_INN, "A003");  // �h��
						// ��b�A�C�R�����\������Ă��Ȃ���΁A�\������
						SetTalkIcon(npc_INN, HIDE_NPC_KIND.INN);
						// ���l�蓮�ݒ�
						SetManualCalcAlpha_(npc_INN, true);
						SetAlpha_(npc_INN, 0.0);
						//���A�N�^�[���b�Z�[�W
						OpenMsgWnd_();
						SetTalkName_("NAME_TAG_REACTOR");
						ShowMsg_("gimmick_001_1");			// �u�������@���ɉB��Ă���悤���B
						KeyInputWait_();
						CloseMsgWnd_();
					} else {
						//���A�N�^�[���b�Z�[�W
						OpenMsgWnd_();
						SetTalkName_("NAME_TAG_REACTOR");
						ShowMsg_("REC_POINT_GR_06_02");		// �u�E�b�h�p�[�N�Ɂ@�c����Ă����@�Ȃ��̃^���B
						KeyInputWait_();
						CloseMsgWnd_();
					}
				}
			}
			if(target == reactorPoint_jack){
				//�W���b�N���݂����t���O
				if(appear_jack == false){
					SetEventFlg_("BFG_APPEAR_JACK", true);
					npc_JAC <- ArrangePointNpc_(ID_JACK   , "A000");  // �W���b�N
					SetPointPosNoFit_(npc_JAC   , "A000");  // �W���b�N
					SetTalkIcon(npc_JAC, HIDE_NPC_KIND.JACK);
					// ���l�蓮�ݒ�
					SetManualCalcAlpha_(npc_JAC, true);
					SetAlpha_(npc_JAC, 0.0);
					//���A�N�^�[���b�Z�[�W
					OpenMsgWnd_();
					SetTalkName_("NAME_TAG_REACTOR");
					ShowMsg_("gimmick_001_1");			// �u�������@���ɉB��Ă���悤���B
					KeyInputWait_();
					CloseMsgWnd_();
				} else {
					//���A�N�^�[���b�Z�[�W
					OpenMsgWnd_();
					SetTalkName_("NAME_TAG_REACTOR");
					ShowMsg_("REC_POINT_GR_05_02");		// �u�E�b�h�p�[�N�Ɂ@�c����Ă����@�Ȃ��̔��B
					KeyInputWait_();
					CloseMsgWnd_();
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
	// ���ɒ��ׂĂ��āA�܂����̒��̃L�����ɁA�b�������A�C�R����\������

	// ��b�A�C�R���L�������́A�b�������t���O
	local chaeckAppearFlag = [
		"BFG_APPEAR_JACK",
		"BFG_APPEAR_QUEEN",
		"BFG_APPEAR_ACE",
		"BFG_APPEAR_INN"
	];
	
	// ����b���������������ǂ����t���O
	local checkFirstTalkFlag = [
		"BFG_FIRST_TIME_TALK_JACK",
		"BFG_FIRST_TIME_TALK_QUEEN",
		"BFG_FIRST_TIME_TALK_ACE",
		"BFG_FIRST_TIME_TALK_INN",
	];
	
	// ��b�A�C�R�����o���Ώ�
	local talkIconTarget = [
		npc_JAC,
		npc_QEN,
		npc_ACE,
		npc_INN,
	];
	
	for(local i = 0; i < HIDE_NPC_KIND.NUM; i++){
		if(GetEventFlg_(chaeckAppearFlag[i]) &&
			!GetEventFlg_(checkFirstTalkFlag[i])){
			if(talkIconTarget[i] != C_NONE_ID){
				SetTalkIcon(talkIconTarget[i], i);
			}
		}
	}
	EventEnd_();
}

//------------------------------------------------
//		���A�N�^�[�I����
//------------------------------------------------
function ReactorOff()
{
	// ���A�N�^�[�Œ��ׂ��ۂ̉�b�A�C�R�����o�Ă�����
	// ���A�N�^�[�I�����ɏ���
	for(local i = 0; i < HIDE_NPC_KIND.NUM; i++){
		if(sTalkIconId[i] != C_NONE_ID){
			DeleteEffect_(sTalkIconId[i]);
			sTalkIconId[i] = C_NONE_ID;
		}
	}
	EventEnd_();
}



//=========================================================================================================
//									�������������牺�̓��[�J���֐�������
//=========================================================================================================

//----------------------------------------------
//  ��W�����v�����X�^�[���擾���Ă��邩���肷��
//----------------------------------------------
function CheckHighJumpMonsterKind()
{
	DebugPrint(" ");
	local p_kind = 0;
	local s_kind = 0;
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
//------------------------------------------------
//  ��W�����v�����X�^�[�Ƀ��C�h���Ă��邩���肷��
//------------------------------------------------
function CheckHighJumpMonsterRide()
{
	//���΂ꂤ���ǂ�Ƀ��C�h���Ă���
	if(CheckFieldRideMonster_(157) == true) {
		return true;
	}
	//���΂ꂤ���ǂ�Ƀ��C�h���Ă��Ȃ�
	else{
		return false;
	}
}

//--------------------------
//  ���b�Z�[�W�̕\���֐�(���O�\���Ȃ�)
//--------------------------
function CommonMessage(message_key){
	OpenMsgWnd_();
	ShowMsg_(message_key);
	KeyInputWait_();
	CloseMsgWnd_();
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

//---------------------------------------
// (�V)�h���̃��b�Z�[�W����( �m�`�� )
//---------------------------------------
function InnMessage(g_inn, msg_key_1, msg_key_2, msg_key_3){

	// �Ó]�����̎�l���̕��A�ʒu�ƌ�����ݒ肷��
	local re_pos = Vec3(218.31, -1.26, -18.56);	// ���A�ʒu���w��
	local re_dir = 180;							// �������w��

	// �����嗤�N���A�t���O
	local clear_flag = GetEventFlg_("BFG_SCENARIO_CLEAR_GRASS");

	// ���b�Z�[�W�̕\���i�u�₟ ��������Ⴂ�c
	OpenMsgWnd_();
	ShowMsg_(msg_key_1);
	KeyInputWait_();

	switch(GetQueryResult_())
	{
	case QUERY2_0:
	// ���܂鏈��
		CloseMsgWnd_();
		// �h���̋��ʂ̉񕜏���
		CommTaskInn(re_pos, re_dir, clear_flag, g_inn);
		// ���b�Z�[�W�̕\��(�u���͂�[��������c
		OpenMsgWnd_();
		ShowMsg_(msg_key_3);
		KeyInputWait_();
		CloseMsgWnd_();
		break;
	case QUERY2_1:
	// ��߂鏈��
		// ���b�Z�[�W�̕\��(�u�킩����������c
		ShowMsg_(msg_key_2);
		KeyInputWait_();
		CloseMsgWnd_();
		break;
	}
}

//---------------------------------------
// (�V)�h���̃��b�Z�[�W����( �h���L�[ )
//---------------------------------------
function InnMessage3(g_inn, msg_key_1, msg_key_2, msg_key_3){

	// �Ó]�����̎�l���̕��A�ʒu�ƌ�����ݒ肷��
	local re_pos = Vec3(218.31, -1.26, -18.56);	// ���A�ʒu���w��
	local re_dir = 180;							// �������w��

	// �����嗤�N���A�t���O
	local clear_flag = GetEventFlg_("BFG_SCENARIO_CLEAR_GRASS");

	// �V�i���I�̃��C���t���O���擾����
	local main_num = GetNumFlg_("NUM_SCENARIO_MAIN");
	// ����p�̃C�x���g�t���O
	local sky_num = GetNumFlg_("NUM_SCENARIO_SUB_SKY");

	// ���b�Z�[�W�̕\��
	OpenMsgWnd_();
	
	// �O�u�����b�Z�[�W�̕\��
	// �u�����s�s�v����u�R�A�v�܂�
	if(main_num <= GetFlagID_("CONST_SM_CORE")){
		// �O�u���Ȃ�
	}
	// �u����v
	else if(main_num == GetFlagID_("CONST_SM_SKY")){
		// �K���r���X��ɏ�����`���󃉃C�h�l���O�܂�
		if(sky_num <= GetFlagID_("CONST_SS_VC_JDG_THIRD_BATTLE_S")){
			ShowMsg_("DORAKI_MSG_002");// �i�u���̋�����Ă��
			KeyInputWait_();
		}
		// ���󃉃C�h�l���ȍ~
		else if(sky_num >= GetFlagID_("CONST_SS_SK_GO_OUT_THE_COLOSSEUM_1")){
			ShowMsg_("DORAKI_MSG_003");// �i�u�f�J�C����
			KeyInputWait_();
		}
	}
	// �\�V�i���I�N���A�ȍ~(���S�N���A�������)
	else if(main_num >= GetFlagID_("CONST_SM_INSIDE_CLEAR")){
		// �O�u���Ȃ�
	}
	
	ShowMsg_(msg_key_1);// �i�u�₟ ��������Ⴂ�c
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
		// ���b�Z�[�W�̕\��(�u���͂�[�c
		OpenMsgWnd_();
		ShowMsg_(msg_key_3);
		KeyInputWait_();
		CloseMsgWnd_();
		break;
	case QUERY3_2:
	// ��߂鏈��
		// ���b�Z�[�W�̕\��(�u�킩�����c
		ShowMsg_(msg_key_2);
		KeyInputWait_();
		CloseMsgWnd_();
		break;
	}

}

//---------------------------------------
// ���l�h���̃��b�Z�[�W����
//---------------------------------------
function NotInInnMessage(){

	// �Ó]�����̎�l���̕��A�ʒu�ƌ�����ݒ肷��
	local re_pos = Vec3(218.31, -1.26, -18.56);	// ���A�ʒu���w��
	local re_dir = 4;							// �������w��

	// �����̑嗤�N���A�t���O
	local grass_clear_flg = GetEventFlg_("BFG_SCENARIO_CLEAR_GRASS");

	// ���b�Z�[�W�L�[�̏�����
	local msg_key_1 = 0;	// ���b�Z�[�W�L�[(�I������\�����郁�b�Z�[�W)
	local msg_key_2 = 0;	// ���b�Z�[�W�L�[(��߂�ꍇ�̃��b�Z�[�W)
	local msg_key_3 = 0;	// ���b�Z�[�W�L�[(���p�����ꍇ�̃��b�Z�[�W)

	if(grass_clear_flg == true){
		if(GetEventFlg_("BFG_CHECK_INN_FIRST_MSG_ALL") == false){
			msg_key_1 = "CAPTURE_CITY_INN_01";
			SetEventFlg_("BFG_CHECK_INN_FIRST_MSG_ALL", true);
		}
		else{
			msg_key_1 = "CAPTURE_CITY_INN_02";
		}
		msg_key_2 = "INN_MSG_NO";
		msg_key_3 = "INN_MSG_YES";

		// ���b�Z�[�W�̕\���i�u�x�b�h������c
		OpenMsgWnd_();
		ShowMsg_(msg_key_1);
		KeyInputWait_();
		
		switch(GetQueryResult_())
		{
		case QUERY3_0:
		case QUERY3_1:
		// ���܂鏈��
		// �x�ޏ���
			CloseMsgWnd_();
			// �h���̋��ʂ̉񕜏���
			CommTaskInn(re_pos, re_dir, grass_clear_flg);
			// ���b�Z�[�W�̕\��(�u���C�ɂȂ����c
			OpenMsgWnd_();
			ShowMsg_(msg_key_3);
			KeyInputWait_();
			CloseMsgWnd_();
			break;
		case QUERY3_2:
		// ��߂鏈��
			// ���b�Z�[�W�̕\��(�u�g���̂���߂��c
			ShowMsg_(msg_key_2);
			KeyInputWait_();
			CloseMsgWnd_();
			break;
		}
	}
	else{
		msg_key_1 = "CAPTURE_GREEN_INN";
		msg_key_2 = "INN_MSG_NO";
		msg_key_3 = "INN_MSG_YES";

		// ���b�Z�[�W�̕\���i�u�x�b�h������c
		OpenMsgWnd_();
		ShowMsg_(msg_key_1);
		KeyInputWait_();

		switch(GetQueryResult_()){
		case QUERY2_0:
		// ���܂鏈��
			CloseMsgWnd_();
			// �h���̋��ʂ̉񕜏���
			CommTaskInn(re_pos, re_dir, grass_clear_flg);
			// ���b�Z�[�W�̕\��(�u���C�ɂȂ����c
			OpenMsgWnd_();
			ShowMsg_(msg_key_3);
			KeyInputWait_();
			CloseMsgWnd_();
			break;
		case QUERY2_1:
		// ��߂鏈��
			// ���b�Z�[�W�̕\��(�u�g���̂���߂��c
			ShowMsg_(msg_key_2);
			KeyInputWait_();
			CloseMsgWnd_();
			break;
		}
	}
}

//------------------------------------------------------
// �b������𒲂ׂ� -> �b�������ăf������������ꍇ�̓R�R�ōs��
// ( ��S�����ɂ��� )
// talk_kind == 0 : �ʏ��b
// talk_kind == 1 : �{����b
//------------------------------------------------------
function TalkTaget(target, main_num, event_num, talk_kind)
{
	//�B��Ă���m�`���[�����������������ǂ������ׂ�t���O
	local appear_jack  = GetEventFlg_("BFG_APPEAR_JACK");
	local appear_queen = GetEventFlg_("BFG_APPEAR_QUEEN");
	local appear_ace   = GetEventFlg_("BFG_APPEAR_ACE");
	local appear_inn   = GetEventFlg_("BFG_APPEAR_INN");

	if(main_num == 1){
		if(event_num >= GetFlagID_("CONST_SS_GR_HIDE_AND_SEEK")
		&& event_num <= GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_3")){
			if(appear_jack == true){
				if(target == npc_JAC){
					OpenMsgWnd_();
					if(talk_kind == 1){
						SetTalkName_("NAME_TAG_REACTOR");
					}
					else{
						SetTalkName_("NAME_TAG_JACK");
					}
					ContentJac(main_num, event_num, talk_kind);
					KeyInputWait_();
					CloseMsgWnd_();
				}
			}
			if(appear_ace == true){
				if(target == npc_ACE){
					OpenMsgWnd_();
					if(talk_kind == 1){
						SetTalkName_("NAME_TAG_REACTOR");
					}
					else{
						if(main_num == GetFlagID_("CONST_SM_GRASSLAND") && event_num == GetFlagID_("CONST_SS_GR_HIDE_AND_SEEK")){
							SetTalkName_("NAME_NONE");
						}
						else{
							SetTalkName_("NAME_TAG_ACE");
						}
					}
					ContentAce(main_num, event_num, talk_kind);
					KeyInputWait_();
					CloseMsgWnd_();
				}
			}
			if(appear_queen == true){
				if(target == npc_QEN){
					OpenMsgWnd_();
					if(talk_kind == 1){
						SetTalkName_("NAME_TAG_REACTOR");
					}
					else{
						if((main_num == GetFlagID_("CONST_SM_GRASSLAND") && event_num == GetFlagID_("CONST_SS_GR_HIDE_AND_SEEK"))
						|| (main_num == GetFlagID_("CONST_SM_GRASSLAND") && event_num == GetFlagID_("CONST_SS_GR_MEET_JACK"))){
							SetTalkName_("NAME_NONE");
						}
						else{
							SetTalkName_("NAME_TAG_QUEEN");
						}
					}
					ContentQen(main_num, event_num, talk_kind);
					KeyInputWait_();
					CloseMsgWnd_();
				}
			}
			if(target == npc_A){
				OpenMsgWnd_();
				if(event_num >= GetFlagID_("CONST_SS_GR_MEET_JACK")){
					if(talk_kind == 1){
						SetTalkName_("NAME_TAG_REACTOR");
					}
					else{
						if(main_num == GetFlagID_("CONST_SM_GRASSLAND") && event_num == GetFlagID_("CONST_SS_GR_HIDE_AND_SEEK")){
							SetTalkName_("NAME_NONE");
						}
						else{
							SetTalkName_("NAME_TAG_NOCHORIN");
						}
					}
				}
				ContentNpcA(main_num, event_num, talk_kind);
				KeyInputWait_();
				CloseMsgWnd_();
			}
			if(appear_inn == true){
				if(target == npc_INN){
					OpenMsgWnd_();
					if(talk_kind == 1){
						SetTalkName_("NAME_TAG_REACTOR");
					}
					ContentInn(main_num, event_num, talk_kind);
					KeyInputWait_();
					CloseMsgWnd_();
				}
			}
		}
		if(event_num >= GetFlagID_("CONST_SS_GR_RETURN_KING")
		&& event_num <= GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_3")){
			if(target == npc_KNG){
				OpenMsgWnd_();
				if(talk_kind == 1){
					SetTalkName_("NAME_TAG_REACTOR");
				}
				else{
					SetTalkName_("NAME_TAG_KING");
				}
				ContentKng(main_num, event_num, talk_kind);
				KeyInputWait_();
				CloseMsgWnd_();
			}
			if(target == npc_B){
				OpenMsgWnd_();
				if(talk_kind == 1){
					SetTalkName_("NAME_TAG_REACTOR");
				}
				ContentNpcB(main_num, event_num, talk_kind);
				KeyInputWait_();
				CloseMsgWnd_();
			}
			if(target == npc_IMP){
				OpenMsgWnd_();
				if(talk_kind == 1){
					SetTalkName_("NAME_TAG_REACTOR");
				}
				ContentImp(main_num, event_num, talk_kind);
				KeyInputWait_();
				CloseMsgWnd_();
			}
			if(target == npc_BNK){
				OpenMsgWnd_();
				if(talk_kind == 1){
					SetTalkName_("NAME_TAG_REACTOR");
				}
				ContentBnk(main_num, event_num, talk_kind);
				KeyInputWait_();
				CloseMsgWnd_();
			}
			if(target == npc_BOK){
				OpenMsgWnd_();
				if(talk_kind == 1){
					SetTalkName_("NAME_TAG_REACTOR");
				}
				ContentBok(main_num, event_num, talk_kind);
				KeyInputWait_();
				CloseMsgWnd_();
			}
			if(target == npc_BUT){
				OpenMsgWnd_();
				if(talk_kind == 1){
					SetTalkName_("NAME_TAG_REACTOR");
				}
				ContentBut(main_num, event_num, talk_kind);
				KeyInputWait_();
				CloseMsgWnd_();
			}
			if(target == npc_REC){
				OpenMsgWnd_();
				if(talk_kind == 1){
					SetTalkName_("NAME_TAG_REACTOR");
				}
				ContentRec(main_num, event_num, talk_kind);
				KeyInputWait_();
				CloseMsgWnd_();
			}
			if(target == npc_ACC){
				OpenMsgWnd_();
				if(talk_kind == 1){
					SetTalkName_("NAME_TAG_REACTOR");
				}
				ContentAcc(main_num, event_num, talk_kind);
				KeyInputWait_();
				CloseMsgWnd_();
			}
		}
	}

}

//-------------------------
//  �A�N�Z�T���[���̘b�����e
//-------------------------
function ContentAcc(main_num, event_num, talk_kind)
{
	// �ʏ��b
	if(talk_kind == 0){
		if(main_num == 1){
			switch(event_num){
			case GetFlagID_("CONST_SS_GR_RETURN_KING"):
			case GetFlagID_("CONST_SS_VC_TRY_RANK_C"):
			case GetFlagID_("CONST_SS_VC_RIDE_TUTORIAL"):
			case GetFlagID_("CONST_SS_VC_START_RANK_C"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE_WIN"):
			case GetFlagID_("CONST_SS_VC_SECOND_BATTLE"):
				ShowMsg_("DEMO_018_AFT_ACC_NOC");
				break;
			case GetFlagID_("CONST_SS_GR_GET_RIDE_SKILL_JUMP"):
				ShowMsg_("DEMO_022_AFT_ACC_NOC");
				break;
			case GetFlagID_("CONST_SS_GR_INVITE_JUMP_MONSTER"):
				ShowMsg_("DEMO_023_AFT_ACC_NOC");
				break;
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_1"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_2"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_3"):
				ShowMsg_("DEMO_024_AFT_ACC_NOC");
				break;
			default:
				ShowMsg_("FlagDefault");
				DebugPrint("�A�N�Z�T���[���̉�b��event_num�l���K�؂ł͂���܂���B");
				break;
			}
		}
	}
	// �{��
	else if(talk_kind == 1){
		if(main_num == 1){
			switch(event_num){
			case GetFlagID_("CONST_SS_GR_RETURN_KING"):
			case GetFlagID_("CONST_SS_VC_TRY_RANK_C"):
			case GetFlagID_("CONST_SS_VC_RIDE_TUTORIAL"):
			case GetFlagID_("CONST_SS_VC_START_RANK_C"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE_WIN"):
			case GetFlagID_("CONST_SS_VC_SECOND_BATTLE"):
			case GetFlagID_("CONST_SS_GR_GET_RIDE_SKILL_JUMP"):
			case GetFlagID_("CONST_SS_GR_INVITE_JUMP_MONSTER"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_1"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_2"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_3"):
				ShowMsg_("NPC_NOCHO_WOMEN_REC");
				break;
			default:
				ShowMsg_("FlagDefault");
				DebugPrint("�A�N�Z�T���[���̖{����event_num�l���K�؂ł͂���܂���B");
				break;
			}
		}
	}
}

//-------------------------
//  �G�[�X�̘b�����e
//-------------------------
function ContentAce(main_num, event_num, talk_kind)
{
	// �ʏ��b
	if(talk_kind == 0){
		if(main_num == 1){
			switch(event_num){
			case GetFlagID_("CONST_SS_GR_HIDE_AND_SEEK"):
				ShowMsg_("DEMO_012_AFT_FIND_ACE");
				break;
			case GetFlagID_("CONST_SS_GR_MEET_JACK"):
			case GetFlagID_("CONST_SS_GR_TALK_QUEEN"):
			case GetFlagID_("CONST_SS_GR_GO_RULAR_STEEL"):
			case GetFlagID_("CONST_SS_GR_SNEAKING_IN_FORTRESS"):
			case GetFlagID_("CONST_SS_GR_COMMUNICATE_ACE"):
			case GetFlagID_("CONST_SS_GR_CONTROL_DEVICE"):
			case GetFlagID_("CONST_SS_GR_APPEAR_BOWSHOCK"):
			case GetFlagID_("CONST_SS_GR_REMATCH_BOWSHOCK"):
			case GetFlagID_("CONST_SS_GR_WIN_BOWSHOCK"):
				ShowMsg_("DEMO_013_AFT_ACE");
				break;
			case GetFlagID_("CONST_SS_GR_RETURN_KING"):
			case GetFlagID_("CONST_SS_VC_TRY_RANK_C"):
			case GetFlagID_("CONST_SS_VC_RIDE_TUTORIAL"):
			case GetFlagID_("CONST_SS_VC_START_RANK_C"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE_WIN"):
			case GetFlagID_("CONST_SS_VC_SECOND_BATTLE"):
				ShowMsg_("DEMO_018_AFT_ACE");
				break;
			case GetFlagID_("CONST_SS_GR_GET_RIDE_SKILL_JUMP"):
				ShowMsg_("DEMO_022_AFT_ACE");
				break;
			case GetFlagID_("CONST_SS_GR_INVITE_JUMP_MONSTER"):
				ShowMsg_("DEMO_023_AFT_ACE");
				break;
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_1"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_2"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_3"):
				ShowMsg_("DEMO_024_AFT_ACE");
				break;
			default:
				ShowMsg_("FlagDefault");
				DebugPrint("�G�[�X�̉�b��event_num�l���K�؂ł͂���܂���B");
				break;
			}
		}
	}
	// �{��
	else if(talk_kind == 1){
		if(main_num == 1){
			switch(event_num){
			case GetFlagID_("CONST_SS_GR_HIDE_AND_SEEK"):
			case GetFlagID_("CONST_SS_GR_MEET_JACK"):
			case GetFlagID_("CONST_SS_GR_TALK_QUEEN"):
			case GetFlagID_("CONST_SS_GR_GO_RULAR_STEEL"):
			case GetFlagID_("CONST_SS_GR_SNEAKING_IN_FORTRESS"):
			case GetFlagID_("CONST_SS_GR_COMMUNICATE_ACE"):
			case GetFlagID_("CONST_SS_GR_CONTROL_DEVICE"):
			case GetFlagID_("CONST_SS_GR_APPEAR_BOWSHOCK"):
			case GetFlagID_("CONST_SS_GR_REMATCH_BOWSHOCK"):
			case GetFlagID_("CONST_SS_GR_WIN_BOWSHOCK"):
			case GetFlagID_("CONST_SS_GR_RETURN_KING"):
			case GetFlagID_("CONST_SS_VC_TRY_RANK_C"):
			case GetFlagID_("CONST_SS_VC_RIDE_TUTORIAL"):
			case GetFlagID_("CONST_SS_VC_START_RANK_C"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE_WIN"):
			case GetFlagID_("CONST_SS_VC_SECOND_BATTLE"):
			case GetFlagID_("CONST_SS_GR_GET_RIDE_SKILL_JUMP"):
			case GetFlagID_("CONST_SS_GR_INVITE_JUMP_MONSTER"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_1"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_2"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_3"):
				ShowMsg_("NPC_ACE_REC");
				break;
			default:
				ShowMsg_("FlagDefault");
				DebugPrint("�G�[�X�̖{����event_num�l���K�؂ł͂���܂���B");
				break;
			}
		}
	}
}

//-------------------------
//  ��s���̘b�����e
//-------------------------
function ContentBnk(main_num, event_num, talk_kind)
{
	// �ʏ��b
	if(talk_kind == 0){
		if(main_num == 1){
			switch(event_num){
			case GetFlagID_("CONST_SS_GR_RETURN_KING"):
			case GetFlagID_("CONST_SS_VC_TRY_RANK_C"):
			case GetFlagID_("CONST_SS_VC_RIDE_TUTORIAL"):
			case GetFlagID_("CONST_SS_VC_START_RANK_C"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE_WIN"):
			case GetFlagID_("CONST_SS_VC_SECOND_BATTLE"):
				ShowMsg_("DEMO_018_AFT_BNK_NOC");
				break;
			case GetFlagID_("CONST_SS_GR_GET_RIDE_SKILL_JUMP"):
				ShowMsg_("DEMO_022_AFT_BNK_NOC");
				break;
			case GetFlagID_("CONST_SS_GR_INVITE_JUMP_MONSTER"):
				ShowMsg_("DEMO_023_AFT_BNK_NOC");
				break;
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_1"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_2"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_3"):
				ShowMsg_("DEMO_024_AFT_BNK_NOC");
				break;
			default:
				ShowMsg_("FlagDefault");
				DebugPrint("��s����event_num�l���K�؂ł͂���܂���B");
				break;
			}
		}
	}
	// �{��
	else if(talk_kind == 1){
		if(main_num == 1){
			switch(event_num){
			case GetFlagID_("CONST_SS_GR_RETURN_KING"):
			case GetFlagID_("CONST_SS_VC_TRY_RANK_C"):
			case GetFlagID_("CONST_SS_VC_RIDE_TUTORIAL"):
			case GetFlagID_("CONST_SS_VC_START_RANK_C"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE_WIN"):
			case GetFlagID_("CONST_SS_VC_SECOND_BATTLE"):
			case GetFlagID_("CONST_SS_GR_GET_RIDE_SKILL_JUMP"):
			case GetFlagID_("CONST_SS_GR_INVITE_JUMP_MONSTER"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_1"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_2"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_3"):
				ShowMsg_("NPC_NOCHO_MEN_REC");
				break;
			default:
				ShowMsg_("FlagDefault");
				DebugPrint("��s����event_num�l���K�؂ł͂���܂���B");
				break;
			}
		}
	}
}

//-------------------------
//  �{���̘b�����e
//-------------------------
function ContentBok(main_num, event_num, talk_kind)
{
	// �ʏ��b
	if(talk_kind == 0){
		if(main_num == 1){
			switch(event_num){
			case GetFlagID_("CONST_SS_GR_RETURN_KING"):
			case GetFlagID_("CONST_SS_VC_TRY_RANK_C"):
			case GetFlagID_("CONST_SS_VC_RIDE_TUTORIAL"):
			case GetFlagID_("CONST_SS_VC_START_RANK_C"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE_WIN"):
			case GetFlagID_("CONST_SS_VC_SECOND_BATTLE"):
				ShowMsg_("DEMO_018_AFT_BOK_NOC");
				break;
			case GetFlagID_("CONST_SS_GR_GET_RIDE_SKILL_JUMP"):
				ShowMsg_("DEMO_022_AFT_BOK_NOC");
				break;
			case GetFlagID_("CONST_SS_GR_INVITE_JUMP_MONSTER"):
				ShowMsg_("DEMO_023_AFT_BOK_NOC");
				break;
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_1"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_2"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_3"):
				ShowMsg_("DEMO_024_AFT_BOK_NOC");
				break;
			default:
				ShowMsg_("FlagDefault");
				DebugPrint("�{����event_num�l���K�؂ł͂���܂���B");
				break;
			}
		}
	}
	// �{��
	else if(talk_kind == 1){
		if(main_num == 1){
			switch(event_num){
			case GetFlagID_("CONST_SS_GR_RETURN_KING"):
			case GetFlagID_("CONST_SS_VC_TRY_RANK_C"):
			case GetFlagID_("CONST_SS_VC_RIDE_TUTORIAL"):
			case GetFlagID_("CONST_SS_VC_START_RANK_C"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE_WIN"):
			case GetFlagID_("CONST_SS_VC_SECOND_BATTLE"):
			case GetFlagID_("CONST_SS_GR_GET_RIDE_SKILL_JUMP"):
			case GetFlagID_("CONST_SS_GR_INVITE_JUMP_MONSTER"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_1"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_2"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_3"):
				ShowMsg_("NPC_NOCHO_WOMEN_REC");
				break;
			default:
				ShowMsg_("FlagDefault");
				DebugPrint("�{����event_num�l���K�؂ł͂���܂���B");
				break;
			}
		}
	}
}

//-------------------------
//  �����̘b�����e
//-------------------------
function ContentBut(main_num, event_num, talk_kind)
{
	// �ʏ��b
	if(talk_kind == 0){
		if(main_num == 1){
			switch(event_num){
			case GetFlagID_("CONST_SS_GR_RETURN_KING"):
			case GetFlagID_("CONST_SS_VC_TRY_RANK_C"):
			case GetFlagID_("CONST_SS_VC_RIDE_TUTORIAL"):
			case GetFlagID_("CONST_SS_VC_START_RANK_C"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE_WIN"):
			case GetFlagID_("CONST_SS_VC_SECOND_BATTLE"):
				ShowMsg_("DEMO_018_AFT_BUT_NOC");
				break;
			case GetFlagID_("CONST_SS_GR_GET_RIDE_SKILL_JUMP"):
				ShowMsg_("DEMO_022_AFT_BUT_NOC");
				break;
			case GetFlagID_("CONST_SS_GR_INVITE_JUMP_MONSTER"):
				ShowMsg_("DEMO_023_AFT_BUT_NOC");
				break;
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_1"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_2"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_3"):
				ShowMsg_("DEMO_024_AFT_BUT_NOC");
				break;
			default:
				ShowMsg_("FlagDefault");
				DebugPrint("������event_num�l���K�؂ł͂���܂���B");
				break;
			}
		}
	}
	// �{��
	else if(talk_kind == 1){
		if(main_num == 1){
			switch(event_num){
			case GetFlagID_("CONST_SS_GR_RETURN_KING"):
			case GetFlagID_("CONST_SS_VC_TRY_RANK_C"):
			case GetFlagID_("CONST_SS_VC_RIDE_TUTORIAL"):
			case GetFlagID_("CONST_SS_VC_START_RANK_C"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE_WIN"):
			case GetFlagID_("CONST_SS_VC_SECOND_BATTLE"):
			case GetFlagID_("CONST_SS_GR_GET_RIDE_SKILL_JUMP"):
			case GetFlagID_("CONST_SS_GR_INVITE_JUMP_MONSTER"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_1"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_2"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_3"):
				ShowMsg_("NPC_NOCHO_MEN_REC");
				break;
			default:
				ShowMsg_("FlagDefault");
				DebugPrint("������event_num�l���K�؂ł͂���܂���B");
				break;
			}
		}
	}
}

//-------------------------
//  ����̘b�����e
//-------------------------
function ContentImp(main_num, event_num, talk_kind)
{
	local item_flg = GetEventFlg_("BFG_TALK_ITEM_WOOD_PARK");

	// �ʏ��b
	if(talk_kind == 0){
		if(main_num == 1){
			switch(event_num){
			case GetFlagID_("CONST_SS_GR_RETURN_KING"):
			case GetFlagID_("CONST_SS_VC_TRY_RANK_C"):
			case GetFlagID_("CONST_SS_VC_RIDE_TUTORIAL"):
			case GetFlagID_("CONST_SS_VC_START_RANK_C"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE_WIN"):
			case GetFlagID_("CONST_SS_VC_SECOND_BATTLE"):
			case GetFlagID_("CONST_SS_GR_GET_RIDE_SKILL_JUMP"):
			case GetFlagID_("CONST_SS_GR_INVITE_JUMP_MONSTER"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_1"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_2"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_3"):
				if(item_flg == false){
					SetEventFlg_("BFG_TALK_ITEM_WOOD_PARK", true);
					ShowMsg_("MSG_SHOP_ITEM_1ST");
					KeyInputWait_();
					CloseMsgWnd_();
					// ����ֈڍs
					GotoMenuFadeOpen(MENU_OPEN.H01_00_ITEM);
				} else {
					if(event_num >= GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_1")
					&& event_num <= GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_3")){
						ShowMsg_("DEMO_024_AFT_IMP_NOC");
					}
					else{
						ShowMsg_("MSG_SHOP_ITEM_2ND");
					}
					KeyInputWait_();
					CloseMsgWnd_();
					// ����ֈڍs
					GotoMenuFadeOpen(MENU_OPEN.H01_00_ITEM);
				}
				//����t���[�I����
				OpenMsgWnd_();
				ShowMsg_("MSG_SHOP_ITEM_3RD");
				KeyInputWait_();
				CloseMsgWnd_();
				break;
			default:
				ShowMsg_("FlagDefault");
				DebugPrint("�����event_num�l���K�؂ł͂���܂���B");
				break;
			}
		}
	}
	// �{��
	else if(talk_kind == 1){
		if(main_num == 1){
			switch(event_num){
			case GetFlagID_("CONST_SS_GR_RETURN_KING"):
			case GetFlagID_("CONST_SS_VC_TRY_RANK_C"):
			case GetFlagID_("CONST_SS_VC_RIDE_TUTORIAL"):
			case GetFlagID_("CONST_SS_VC_START_RANK_C"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE_WIN"):
			case GetFlagID_("CONST_SS_VC_SECOND_BATTLE"):
			case GetFlagID_("CONST_SS_GR_GET_RIDE_SKILL_JUMP"):
			case GetFlagID_("CONST_SS_GR_INVITE_JUMP_MONSTER"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_1"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_2"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_3"):
				ShowMsg_("NPC_NOCHO_MEN_REC");
				break;
			default:
				ShowMsg_("FlagDefault");
				DebugPrint("�����event_num�l���K�؂ł͂���܂���B");
				break;
			}
		}
	}
}

//-------------------------
//  �h���̘b�����e
//-------------------------
function ContentInn(main_num, event_num, talk_kind)
{
	// �ʏ��b
	if(talk_kind == 0){
		if(main_num == 1){
			switch(event_num){
			case GetFlagID_("CONST_SS_GR_HIDE_AND_SEEK"):
				ShowMsg_("DEMO_012_AFT_FIND_INN");
				break;
			default:
				ShowMsg_("FlagDefault");
				DebugPrint("�h����event_num�l���K�؂ł͂���܂���B");
				break;
			}
		}
	}
	// �{��
	else if(talk_kind == 1){
		if(main_num == 1){
			switch(event_num){
			case GetFlagID_("CONST_SS_GR_HIDE_AND_SEEK"):
			case GetFlagID_("CONST_SS_GR_MEET_JACK"):
			case GetFlagID_("CONST_SS_GR_TALK_QUEEN"):
			case GetFlagID_("CONST_SS_GR_GO_RULAR_STEEL"):
			case GetFlagID_("CONST_SS_GR_SNEAKING_IN_FORTRESS"):
			case GetFlagID_("CONST_SS_GR_COMMUNICATE_ACE"):
			case GetFlagID_("CONST_SS_GR_CONTROL_DEVICE"):
			case GetFlagID_("CONST_SS_GR_APPEAR_BOWSHOCK"):
			case GetFlagID_("CONST_SS_GR_REMATCH_BOWSHOCK"):
			case GetFlagID_("CONST_SS_GR_WIN_BOWSHOCK"):
			case GetFlagID_("CONST_SS_GR_RETURN_KING"):
			case GetFlagID_("CONST_SS_VC_TRY_RANK_C"):
			case GetFlagID_("CONST_SS_VC_RIDE_TUTORIAL"):
			case GetFlagID_("CONST_SS_VC_START_RANK_C"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE_WIN"):
			case GetFlagID_("CONST_SS_VC_SECOND_BATTLE"):
			case GetFlagID_("CONST_SS_GR_GET_RIDE_SKILL_JUMP"):
			case GetFlagID_("CONST_SS_GR_INVITE_JUMP_MONSTER"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_1"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_2"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_3"):
				ShowMsg_("NPC_NOCHO_MEN_REC");
				break;
			default:
				ShowMsg_("FlagDefault");
				DebugPrint("�h����event_num�l���K�؂ł͂���܂���B");
				break;
			}
		}
	}
}

//-------------------------
//  �W���b�N�̘b�����e
//-------------------------
function ContentJac(main_num, event_num, talk_kind)
{
	// �ʏ��b
	if(talk_kind == 0){
		if(main_num == 1){
			switch(event_num){
			case GetFlagID_("CONST_SS_GR_HIDE_AND_SEEK"):
				ShowMsg_("StartDemo");
				break;
			case GetFlagID_("CONST_SS_GR_MEET_JACK"):
			case GetFlagID_("CONST_SS_GR_TALK_QUEEN"):
			case GetFlagID_("CONST_SS_GR_GO_RULAR_STEEL"):
			case GetFlagID_("CONST_SS_GR_SNEAKING_IN_FORTRESS"):
			case GetFlagID_("CONST_SS_GR_COMMUNICATE_ACE"):
			case GetFlagID_("CONST_SS_GR_CONTROL_DEVICE"):
			case GetFlagID_("CONST_SS_GR_APPEAR_BOWSHOCK"):
			case GetFlagID_("CONST_SS_GR_REMATCH_BOWSHOCK"):
			case GetFlagID_("CONST_SS_GR_WIN_BOWSHOCK"):
				ShowMsg_("DEMO_013_AFT_JAC");
				break;
			case GetFlagID_("CONST_SS_GR_RETURN_KING"):
			case GetFlagID_("CONST_SS_VC_TRY_RANK_C"):
			case GetFlagID_("CONST_SS_VC_RIDE_TUTORIAL"):
			case GetFlagID_("CONST_SS_VC_START_RANK_C"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE_WIN"):
			case GetFlagID_("CONST_SS_VC_SECOND_BATTLE"):
				ShowMsg_("DEMO_018_AFT_JAC");
				break;
			case GetFlagID_("CONST_SS_GR_GET_RIDE_SKILL_JUMP"):
				ShowMsg_("DEMO_022_AFT_JAC");
				break;
			case GetFlagID_("CONST_SS_GR_INVITE_JUMP_MONSTER"):
				ShowMsg_("DEMO_023_AFT_JAC");
				break;
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_1"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_2"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_3"):
				ShowMsg_("DEMO_024_AFT_JAC");
				break;
			default:
				ShowMsg_("FlagDefault");
				DebugPrint("�W���b�N��event_num�l���K�؂ł͂���܂���B");
				break;
			}
		}
	}
	// �{��
	else if(talk_kind == 1){
		if(main_num == 1){
			switch(event_num){
			case GetFlagID_("CONST_SS_GR_HIDE_AND_SEEK"):
			case GetFlagID_("CONST_SS_GR_MEET_JACK"):
			case GetFlagID_("CONST_SS_GR_TALK_QUEEN"):
			case GetFlagID_("CONST_SS_GR_GO_RULAR_STEEL"):
			case GetFlagID_("CONST_SS_GR_SNEAKING_IN_FORTRESS"):
			case GetFlagID_("CONST_SS_GR_COMMUNICATE_ACE"):
			case GetFlagID_("CONST_SS_GR_CONTROL_DEVICE"):
			case GetFlagID_("CONST_SS_GR_APPEAR_BOWSHOCK"):
			case GetFlagID_("CONST_SS_GR_REMATCH_BOWSHOCK"):
			case GetFlagID_("CONST_SS_GR_WIN_BOWSHOCK"):
			case GetFlagID_("CONST_SS_GR_RETURN_KING"):
			case GetFlagID_("CONST_SS_VC_TRY_RANK_C"):
			case GetFlagID_("CONST_SS_VC_RIDE_TUTORIAL"):
			case GetFlagID_("CONST_SS_VC_START_RANK_C"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE_WIN"):
			case GetFlagID_("CONST_SS_VC_SECOND_BATTLE"):
			case GetFlagID_("CONST_SS_GR_GET_RIDE_SKILL_JUMP"):
			case GetFlagID_("CONST_SS_GR_INVITE_JUMP_MONSTER"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_1"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_2"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_3"):
				ShowMsg_("NPC_JACK_REC");
				break;
			default:
				ShowMsg_("FlagDefault");
				DebugPrint("�W���b�N��event_num�l���K�؂ł͂���܂���B");
				break;
			}
		}
	}
}

//-------------------------
//  �L���O�̘b�����e
//-------------------------
function ContentKng(main_num, event_num, talk_kind)
{
	// �ʏ��b
	if(talk_kind == 0){
		if(main_num == 1){
			switch(event_num){
			case GetFlagID_("CONST_SS_GR_RETURN_KING"):
			case GetFlagID_("CONST_SS_VC_TRY_RANK_C"):
			case GetFlagID_("CONST_SS_VC_RIDE_TUTORIAL"):
			case GetFlagID_("CONST_SS_VC_START_RANK_C"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE_WIN"):
			case GetFlagID_("CONST_SS_VC_SECOND_BATTLE"):
				ShowMsg_("DEMO_018_AFT_KNG");
				break;
			case GetFlagID_("CONST_SS_GR_GET_RIDE_SKILL_JUMP"):
				ShowMsg_("StartDemo");
				break;
			case GetFlagID_("CONST_SS_GR_INVITE_JUMP_MONSTER"):
				ShowMsg_("DEMO_023_AFT_KNG");
				break;
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_1"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_2"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_3"):
				ShowMsg_("DEMO_024_AFT_KNG");
				break;
			default:
				ShowMsg_("FlagDefault");
				DebugPrint("�L���O�̉�b��event_num�l���K�؂ł͂���܂���B");
				break;
			}
		}
	}
	// �{��
	else if(talk_kind == 1){
		if(main_num == 1){
			switch(event_num){
			case GetFlagID_("CONST_SS_GR_RETURN_KING"):
			case GetFlagID_("CONST_SS_VC_TRY_RANK_C"):
			case GetFlagID_("CONST_SS_VC_RIDE_TUTORIAL"):
			case GetFlagID_("CONST_SS_VC_START_RANK_C"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE_WIN"):
			case GetFlagID_("CONST_SS_VC_SECOND_BATTLE"):
			case GetFlagID_("CONST_SS_GR_GET_RIDE_SKILL_JUMP"):
			case GetFlagID_("CONST_SS_GR_INVITE_JUMP_MONSTER"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_1"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_2"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_3"):
				ShowMsg_("NPC_KING_REC");
				break;
			default:
				ShowMsg_("FlagDefault");
				DebugPrint("�L���O�̖{����event_num�l���K�؂ł͂���܂���B");
				break;
			}
		}
	}
}

//-------------------------
//  NPC_A(�m�`������)�̘b�����e
//-------------------------
function ContentNpcA(main_num, event_num, talk_kind)
{
	// �ʏ��b
	if(talk_kind == 0){
		if(main_num == 1){
			switch(event_num){
			case GetFlagID_("CONST_SS_GR_HIDE_AND_SEEK"):
				ShowMsg_("DEMO_012_AFT_NOC_A");
				KeyInputWait_();
				CloseMsgWnd_();
				// ���A�N�^�[����̂��m�点
				CommReactorActionNotice();
				// ���A�N�^�[���b�Z�[�W
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_REACTOR");
				ShowMsg_("DEMO_012_AFT_REACTOR");
				KeyInputWait_();
				CloseMsgWnd_();
				// ��l���̃��[�V������߂�
				CommResetPlayerMotion();
				break;
			case GetFlagID_("CONST_SS_GR_MEET_JACK"):
			case GetFlagID_("CONST_SS_GR_TALK_QUEEN"):
			case GetFlagID_("CONST_SS_GR_GO_RULAR_STEEL"):
			case GetFlagID_("CONST_SS_GR_SNEAKING_IN_FORTRESS"):
			case GetFlagID_("CONST_SS_GR_COMMUNICATE_ACE"):
			case GetFlagID_("CONST_SS_GR_CONTROL_DEVICE"):
			case GetFlagID_("CONST_SS_GR_APPEAR_BOWSHOCK"):
			case GetFlagID_("CONST_SS_GR_REMATCH_BOWSHOCK"):
			case GetFlagID_("CONST_SS_GR_WIN_BOWSHOCK"):
				ShowMsg_("DEMO_013_AFT_NOC_A");
				break;
			case GetFlagID_("CONST_SS_GR_RETURN_KING"):
			case GetFlagID_("CONST_SS_VC_TRY_RANK_C"):
			case GetFlagID_("CONST_SS_VC_RIDE_TUTORIAL"):
			case GetFlagID_("CONST_SS_VC_START_RANK_C"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE_WIN"):
			case GetFlagID_("CONST_SS_VC_SECOND_BATTLE"):
				ShowMsg_("DEMO_018_AFT_NOC_A");
				break;
			case GetFlagID_("CONST_SS_GR_GET_RIDE_SKILL_JUMP"):
				ShowMsg_("DEMO_022_AFT_NOC_A");
				break;
			case GetFlagID_("CONST_SS_GR_INVITE_JUMP_MONSTER"):
				ShowMsg_("DEMO_023_AFT_NOC_A");
				break;
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_1"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_2"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_3"):
				ShowMsg_("DEMO_024_AFT_NOC_A");
				break;
			default:
				ShowMsg_("FlagDefault");
				DebugPrint("NPC_A��event_num�l���K�؂ł͂���܂���B");
				break;
			}
		}
	}
	// �{��
	else if(talk_kind == 1){
		if(main_num == 1){
			switch(event_num){
			case GetFlagID_("CONST_SS_GR_HIDE_AND_SEEK"):
				ShowMsg_("NPC_NOCHO_MEN_REC");
				break;
			case GetFlagID_("CONST_SS_GR_MEET_JACK"):
			case GetFlagID_("CONST_SS_GR_TALK_QUEEN"):
			case GetFlagID_("CONST_SS_GR_GO_RULAR_STEEL"):
			case GetFlagID_("CONST_SS_GR_SNEAKING_IN_FORTRESS"):
			case GetFlagID_("CONST_SS_GR_COMMUNICATE_ACE"):
			case GetFlagID_("CONST_SS_GR_CONTROL_DEVICE"):
			case GetFlagID_("CONST_SS_GR_APPEAR_BOWSHOCK"):
			case GetFlagID_("CONST_SS_GR_REMATCH_BOWSHOCK"):
			case GetFlagID_("CONST_SS_GR_WIN_BOWSHOCK"):
			case GetFlagID_("CONST_SS_GR_RETURN_KING"):
			case GetFlagID_("CONST_SS_VC_TRY_RANK_C"):
			case GetFlagID_("CONST_SS_VC_RIDE_TUTORIAL"):
			case GetFlagID_("CONST_SS_VC_START_RANK_C"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE_WIN"):
			case GetFlagID_("CONST_SS_VC_SECOND_BATTLE"):
			case GetFlagID_("CONST_SS_GR_GET_RIDE_SKILL_JUMP"):
			case GetFlagID_("CONST_SS_GR_INVITE_JUMP_MONSTER"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_1"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_2"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_3"):
				ShowMsg_("NPC_NOCHORIN_REC");
				break;
			default:
				ShowMsg_("FlagDefault");
				DebugPrint("NPC_A��event_num�l���K�؂ł͂���܂���B");
				break;
			}
		}
	}
}

//-------------------------
//  NPC_B�̘b�����e
//-------------------------
function ContentNpcB(main_num, event_num, talk_kind)
{
	// �ʏ��b
	if(talk_kind == 0){
		if(main_num == 1){
			switch(event_num){
			case GetFlagID_("CONST_SS_GR_RETURN_KING"):
			case GetFlagID_("CONST_SS_VC_TRY_RANK_C"):
			case GetFlagID_("CONST_SS_VC_RIDE_TUTORIAL"):
			case GetFlagID_("CONST_SS_VC_START_RANK_C"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE_WIN"):
			case GetFlagID_("CONST_SS_VC_SECOND_BATTLE"):
				ShowMsg_("DEMO_018_AFT_NOC_B");
				break;
			case GetFlagID_("CONST_SS_GR_GET_RIDE_SKILL_JUMP"):
				ShowMsg_("DEMO_022_AFT_NOC_B");
				break;
			case GetFlagID_("CONST_SS_GR_INVITE_JUMP_MONSTER"):
				ShowMsg_("DEMO_023_AFT_NOC_B");
				break;
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_1"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_2"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_3"):
				ShowMsg_("DEMO_024_AFT_NOC_B");
				break;
			default:
				ShowMsg_("FlagDefault");
				DebugPrint(" NPC_B��event_num�l���K�؂ł͂���܂���B");
				break;
			}
		}
	}
	// �{��
	else if(talk_kind == 1){
		if(main_num == 1){
			switch(event_num){
			case GetFlagID_("CONST_SS_GR_RETURN_KING"):
			case GetFlagID_("CONST_SS_VC_TRY_RANK_C"):
			case GetFlagID_("CONST_SS_VC_RIDE_TUTORIAL"):
			case GetFlagID_("CONST_SS_VC_START_RANK_C"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE_WIN"):
			case GetFlagID_("CONST_SS_VC_SECOND_BATTLE"):
			case GetFlagID_("CONST_SS_GR_GET_RIDE_SKILL_JUMP"):
			case GetFlagID_("CONST_SS_GR_INVITE_JUMP_MONSTER"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_1"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_2"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_3"):
				ShowMsg_("NPC_NOCHO_MEN_REC");
				break;
			default:
				ShowMsg_("FlagDefault");
				DebugPrint(" NPC_B��event_num�l���K�؂ł͂���܂���B");
				break;
			}
		}
	}
}

//-------------------------
//  �N�C�[���̘b�����e
//-------------------------
function ContentQen(main_num, event_num, talk_kind)
{
	// �ʏ��b
	if(talk_kind == 0){
		if(main_num == 1){
			switch(event_num){
			case GetFlagID_("CONST_SS_GR_HIDE_AND_SEEK"):
				ShowMsg_("DEMO_012_AFT_FIND_QEN");
				break;
			case GetFlagID_("CONST_SS_GR_MEET_JACK"):
			case GetFlagID_("CONST_SS_GR_TALK_QUEEN"):
			case GetFlagID_("CONST_SS_GR_GO_RULAR_STEEL"):
				ShowMsg_("DEMO_013_AFT_QEN_5");
				break;
			case GetFlagID_("CONST_SS_GR_SNEAKING_IN_FORTRESS"):
			case GetFlagID_("CONST_SS_GR_COMMUNICATE_ACE"):
			case GetFlagID_("CONST_SS_GR_CONTROL_DEVICE"):
			case GetFlagID_("CONST_SS_GR_APPEAR_BOWSHOCK"):
			case GetFlagID_("CONST_SS_GR_REMATCH_BOWSHOCK"):
			case GetFlagID_("CONST_SS_GR_WIN_BOWSHOCK"):
				ShowMsg_("DEMO_013_AFT_QEN");
				break;
			case GetFlagID_("CONST_SS_GR_RETURN_KING"):
			case GetFlagID_("CONST_SS_VC_TRY_RANK_C"):
			case GetFlagID_("CONST_SS_VC_RIDE_TUTORIAL"):
			case GetFlagID_("CONST_SS_VC_START_RANK_C"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE_WIN"):
			case GetFlagID_("CONST_SS_VC_SECOND_BATTLE"):
				ShowMsg_("DEMO_018_AFT_QEN");
				break;
			case GetFlagID_("CONST_SS_GR_GET_RIDE_SKILL_JUMP"):
				ShowMsg_("DEMO_022_AFT_QEN");
				break;
			case GetFlagID_("CONST_SS_GR_INVITE_JUMP_MONSTER"):
				ShowMsg_("DEMO_023_AFT_QEN");
				break;
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_1"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_2"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_3"):
				ShowMsg_("DEMO_024_AFT_QEN");
				break;
			default:
				ShowMsg_("FlagDefault");
				DebugPrint("�N�C�[���̉�b��event_num�l���K�؂ł͂���܂���B");
				break;
			}
		}
	}
	// �{��
	else if(talk_kind == 1){
		if(main_num == 1){
			switch(event_num){
			case GetFlagID_("CONST_SS_GR_HIDE_AND_SEEK"):
			case GetFlagID_("CONST_SS_GR_MEET_JACK"):
			case GetFlagID_("CONST_SS_GR_TALK_QUEEN"):
				ShowMsg_("NPC_NOCHO_WOMEN_REC");
				break;
			case GetFlagID_("CONST_SS_GR_GO_RULAR_STEEL"):
			case GetFlagID_("CONST_SS_GR_SNEAKING_IN_FORTRESS"):
			case GetFlagID_("CONST_SS_GR_COMMUNICATE_ACE"):
			case GetFlagID_("CONST_SS_GR_CONTROL_DEVICE"):
			case GetFlagID_("CONST_SS_GR_APPEAR_BOWSHOCK"):
			case GetFlagID_("CONST_SS_GR_REMATCH_BOWSHOCK"):
			case GetFlagID_("CONST_SS_GR_WIN_BOWSHOCK"):
			case GetFlagID_("CONST_SS_GR_RETURN_KING"):
			case GetFlagID_("CONST_SS_VC_TRY_RANK_C"):
			case GetFlagID_("CONST_SS_VC_RIDE_TUTORIAL"):
			case GetFlagID_("CONST_SS_VC_START_RANK_C"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE_WIN"):
			case GetFlagID_("CONST_SS_VC_SECOND_BATTLE"):
			case GetFlagID_("CONST_SS_GR_GET_RIDE_SKILL_JUMP"):
			case GetFlagID_("CONST_SS_GR_INVITE_JUMP_MONSTER"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_1"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_2"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_3"):
				ShowMsg_("NPC_QUEEN_REC");
				break;
			default:
				ShowMsg_("FlagDefault");
				DebugPrint("�N�C�[���̖{����event_num�l���K�؂ł͂���܂���B");
				break;
			}
		}
	}
}

//-------------------------
//  ���A�N�^�[���̘b�����e
//-------------------------
function ContentRec(main_num, event_num, talk_kind)
{
	// �ʏ��b
	if(talk_kind == 0){
		if(main_num == 1){
			switch(event_num){
			case GetFlagID_("CONST_SS_GR_RETURN_KING"):
			case GetFlagID_("CONST_SS_VC_TRY_RANK_C"):
			case GetFlagID_("CONST_SS_VC_RIDE_TUTORIAL"):
			case GetFlagID_("CONST_SS_VC_START_RANK_C"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE_WIN"):
			case GetFlagID_("CONST_SS_VC_SECOND_BATTLE"):
				ShowMsg_("DEMO_018_AFT_REC_NOC");
				break;
			case GetFlagID_("CONST_SS_GR_GET_RIDE_SKILL_JUMP"):
				ShowMsg_("DEMO_022_AFT_REC_NOC");
				break;
			case GetFlagID_("CONST_SS_GR_INVITE_JUMP_MONSTER"):
				ShowMsg_("DEMO_023_AFT_REC_NOC");
				break;
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_1"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_2"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_3"):
				ShowMsg_("DEMO_024_AFT_REC_NOC");
				break;
			default:
				ShowMsg_("FlagDefault");
				DebugPrint("���A�N�^�[����event_num�l���K�؂ł͂���܂���(�ʏ��b)");
				break;
			}
		}
	}
	// �{��
	else if(talk_kind == 1){
		if(main_num == 1){
			switch(event_num){
			case GetFlagID_("CONST_SS_GR_RETURN_KING"):
			case GetFlagID_("CONST_SS_VC_TRY_RANK_C"):
			case GetFlagID_("CONST_SS_VC_RIDE_TUTORIAL"):
			case GetFlagID_("CONST_SS_VC_START_RANK_C"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE"):
			case GetFlagID_("CONST_SS_VC_FIRST_BATTLE_WIN"):
			case GetFlagID_("CONST_SS_VC_SECOND_BATTLE"):
			case GetFlagID_("CONST_SS_GR_GET_RIDE_SKILL_JUMP"):
			case GetFlagID_("CONST_SS_GR_INVITE_JUMP_MONSTER"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_1"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_2"):
			case GetFlagID_("CONST_SS_GR_IMMIGRATION_PLAN_3"):
				ShowMsg_("NPC_NOCHO_MEN_REC");
				break;
			default:
				ShowMsg_("FlagDefault");
				DebugPrint("���A�N�^�[����event_num�l���K�؂ł͂���܂���B(�{��)");
				break;
			}
		}
	}
}

//--------------------------
//  �v���C���[���C�x���g�n�����痣���
//--------------------------
function PlayerLeaveMine(name_tag, message_key, pos_x, pos_y, pos_z, dir){
	local player = GetPlayerId_();
	OpenMsgWnd_();
	SetTalkName_(name_tag);
	ShowMsg_(message_key);
	KeyInputWait_();
	SetDirToPos_(player, Vec3(pos_x, pos_y, pos_z));
	SetMotion_(player, "RUN", 2);
	local task_walk = Task_MoveForward_(player, 1.0, true);
	SetDir_(player, dir);
	Wait_(5);
	DeleteTask_(task_walk);
	Wait_(10);
	CloseMsgWnd_();
}

//--------------------------
//  �ʓr�\�������b�A�C�R�����Z�b�g
//--------------------------
function SetTalkIcon(target, kind)
{
	if(sTalkIconId[kind] == C_NONE_ID && target != C_NONE_ID){
		sTalkIconId[kind] = SetSelectBoneEffect_("EF300_21_TALK_ICON", target, ATTACH_EFFECT1);
	}
}

//======================================================
// ����֐��F�S�ŕ��A�̋[���f��1[�W���b�N��������`�L���O�~�o]
//------------------------------------------------------
// �������F�Ȃ�
// �߂�l  �F�Ȃ�
//======================================================
function uDeadReturnDemo1()
{
// �Ó]
	CommChangeMomentFadeOut(FADE_COLOR_BLACK);
// ����
	// ��l���̈ʒu
	local player_pos = Vec3(105.157, -1.260, 5.307);
	local player_dir = -140;
	// �[���f����̕��A�ʒu
	local player_rtn_pos = Vec3(105.157, -1.260, 5.307);
	local player_rtn_dir = 90;
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
	SetDirToPlayer_(npc_A);
	Wait_(wait_speed);
	// �m�`������(�ҋ@���[�V��������b���[�V����)
	SetMotion_(npc_A, "TALKLOOP", BLEND_N);
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
	SetMotion_(npc_A, "WAIT", BLEND_L);
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
	ChangeMapPosDir_("H01_00", player_rtn_pos, player_rtn_dir);
}

//======================================================
// ����֐��F�S�ŕ��A�̋[���f��2[�~�o��ɃE�b�h�p�[�N�ɓ���`�R�ɏW���O]
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
	local player_pos = Vec3(-21.885, 3.700, -2.418);
	local player_dir = -90;
	// �[���f����̕��A�ʒu
	local player_rtn_pos = Vec3(-4.200, 3.600, 0.000);
	local player_rtn_dir = -90;
	// �E�F�C�g
	local wait_speed     = 15;
	local wait_speed_def = 30;
	// �v���C���[ID
	local player = GetPlayerId_();
	// �J�����̊p�x
	local cam_dir = -88;
	local cam_rtn_dir = -90;
	// ��`�������l���Z�b�g
	SetPos_(player, player_pos);
	SetDir_(player, player_dir);
	SetCameraDir_(cam_dir);
	Wait_(wait_speed);
	// �L���O(�ҋ@���[�V��������b���[�V����)
	SetMotion_(npc_KNG, "TALKLOOP", BLEND_N);
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
	SetMotion_(npc_KNG, "WAIT", BLEND_L);
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
	ChangeMapPosDir_("H01_00", player_rtn_pos, player_rtn_dir);
}

//======================================================
// ����֐��F�S�ŕ��A�̋[���f��3[�R�ɏW����`�����s�s�����O]
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
	local player_pos = Vec3(105.157, -1.260, 5.307);
	local player_dir = -140;
	// �[���f����̕��A�ʒu
	local player_rtn_pos = Vec3(105.157, -1.260, 5.307);
	local player_rtn_dir = 90;
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
	ChangeMapPosDir_("H01_00", player_rtn_pos, player_rtn_dir);
}

//=========================================================
// ����֐��F�J���[�t�H���f�����p�[�N�ɏ풓���Ă��邩���ׂ�
//---------------------------------------------------------
// �������F�Ȃ�
// �߂�l  �F�p�[�N�ɏ풓���Ă���J���[�t�H���f���̐�(�z���C�g������)
//=========================================================
function uReturnColorFondueNum()
{
	// �Z�킻����Ă��邩�`�F�b�N�J�E���g�i�J���[�t�H���f���S���g���̂œ��ŃJ�E���g���Ă�j
	local cf_count = 0;
	if(GetEventFlg_("BFG_STEALTHBOX_LARGE_OPEN_01") == true){
		cf_count = cf_count + 1;
	}
	if(GetEventFlg_("BFG_STEALTHBOX_LARGE_OPEN_02") == true){
		cf_count = cf_count + 1;
	}
	if(GetEventFlg_("BFG_STEALTHBOX_LARGE_OPEN_03") == true){
		cf_count = cf_count + 1;
	}
	if(GetEventFlg_("BFG_STEALTHBOX_LARGE_OPEN_04") == true){
		cf_count = cf_count + 1;
	}
	if(GetEventFlg_("BFG_STEALTHBOX_LARGE_OPEN_05") == true){
		cf_count = cf_count + 1;
	}
	return cf_count;
}

//=========================================================
// ����֐��F�[���f�� �y�C���g�z������
//---------------------------------------------------------
// �������Fplayer��ID
// �߂�l  �F�Ȃ�
//=========================================================
function uColorFondueDemo(player)
{
	// �Ó]
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
	// �z�u�ύX����
	// �v���C���[
	SetPointPos_(player, "event_color_player01");
	SetDir_(player, 45);
	// ��l��������
	SetManualCalcAlpha_(player, true);
	SetAlpha_(player, 0.0);
	// ���L����z�u���Ă���ꍇ�͏���
	if (npc_Rukiya != C_NONE_ID) {
		SetVisible(npc_Rukiya, false);
	}
	// �z���C�g
	SetDir_(g_npc_cf_white, 90);
	//�ꏊ�ς�炸
	// �u���b�N
	local demo_npc_black = ReadAndArrangePointNpc("n045", "npc_color_black_end");
	SetScaleSilhouette(demo_npc_black, SCALE.N, SILHOUETTE_WIDTH.N);
	// ���b�h
	local demo_npc_red = ReadAndArrangePointNpc("n046", "npc_color_red_end");
	SetScaleSilhouette(demo_npc_red, SCALE.N, SILHOUETTE_WIDTH.N);
	// �u���[
	local demo_npc_blue = ReadAndArrangePointNpc("n047", "npc_color_blue_end");
	SetScaleSilhouette(demo_npc_blue, SCALE.N, SILHOUETTE_WIDTH.N);
	// �C�G���[
	local demo_npc_yellow = ReadAndArrangePointNpc("n048", "npc_color_yellow_end");
	SetScaleSilhouette(demo_npc_yellow, SCALE.N, SILHOUETTE_WIDTH.N);
	// �O���[��
	local demo_npc_green = ReadAndArrangePointNpc("n049", "npc_color_green_end");
	SetScaleSilhouette(demo_npc_green, SCALE.N, SILHOUETTE_WIDTH.N);
	// ���[�V�����ǂݍ���
	local attack_whi = ReadMotion_(g_npc_cf_white, "m125_00_take_L");
	local attack_bla = ReadMotion_(demo_npc_black, "m125_00_take_L");
	local attack_red = ReadMotion_(demo_npc_red, "m125_00_take_L");
	local attack_blu = ReadMotion_(demo_npc_blue, "m125_00_take_L");
	local attack_yel = ReadMotion_(demo_npc_yellow, "m125_00_take_L");
	local attack_gre = ReadMotion_(demo_npc_green, "m125_00_take_L");
	// �J�����ʒu�ύX
	SetPointCameraEye_("event_color_cam_eye");
	SetPointCameraTarget_("event_color_cam_tgt");
	// �Ó]����
	Wait_(15);
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();

	// �[���f���J�n
	// �z���C�g�̃��b�Z�[�W
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_CF_WHITE");
	ShowMsg_("COLORFONDUE_WHITE_101");
	KeyInputWait_();
	ShowMsg_("COLORFONDUE_WHITE_102");
	KeyInputWait_();
	CloseMsgWnd_();
	// �O���[���̃��b�Z�[�W
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_CF_GREEN");
	ShowMsg_("COLORFONDUE_WHITE_103");
	KeyInputWait_();
	CloseMsgWnd_();
	// �퓬���[�V����
	SetMotion_(demo_npc_green, attack_gre, BLEND_XL);
	PlaySE_("SE_DEM_006");
	Wait_(30);
	// �u���b�N�̃��b�Z�[�W
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_CF_BLACK");
	ShowMsg_("COLORFONDUE_WHITE_104");
	KeyInputWait_();
	CloseMsgWnd_();
	// �퓬���[�V����
	SetMotion_(demo_npc_black, attack_bla, BLEND_XL);
	PlaySE_("SE_DEM_006");
	Wait_(30);
	// �u���[�̃��b�Z�[�W
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_CF_BLUE");
	ShowMsg_("COLORFONDUE_WHITE_105");
	KeyInputWait_();
	CloseMsgWnd_();
	// �퓬���[�V����
	SetMotion_(demo_npc_blue, attack_blu, BLEND_XL);
	PlaySE_("SE_DEM_006");
	Wait_(30);
	// �C�G���[�̃��b�Z�[�W
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_CF_YELLOW");
	ShowMsg_("COLORFONDUE_WHITE_106");
	KeyInputWait_();
	CloseMsgWnd_();
	// �퓬���[�V����
	SetMotion_(demo_npc_yellow, attack_yel, BLEND_XL);
	PlaySE_("SE_DEM_006");
	Wait_(30);
	// ���b�h�̃��b�Z�[�W
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_CF_RED");
	ShowMsg_("COLORFONDUE_WHITE_107");
	KeyInputWait_();
	CloseMsgWnd_();
	// �퓬���[�V����
	SetMotion_(demo_npc_red, attack_red, BLEND_XL);
	PlaySE_("SE_DEM_006");
	Wait_(30);
	// �z���C�g�̃��b�Z�[�W
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_CF_WHITE");
	ShowMsg_("COLORFONDUE_WHITE_108");
	KeyInputWait_();
	CloseMsgWnd_();
	// �퓬���[�V����
	SetMotion_(g_npc_cf_white, attack_whi, BLEND_XL);
	PlaySE_("SE_DEM_006");
	Wait_(30);

	// �S�������Ẵ��b�Z�[�W
	OpenMsgWnd_();
	ShowMsg_("COLORFONDUE_WHITE_109");
		Wait_(30);

		// �W�����v�㏸���[�V����
		SetMotion_(g_npc_cf_white, ReadMotion_(g_npc_cf_white, "m125_00_jump"), BLEND_XL);
		SetMotion_(demo_npc_green, ReadMotion_(demo_npc_green, "m125_00_jump"), BLEND_XL);
		SetMotion_(demo_npc_black, ReadMotion_(demo_npc_black, "m125_00_jump"), BLEND_XL);
		SetMotion_(demo_npc_blue, ReadMotion_(demo_npc_blue, "m125_00_jump"), BLEND_XL);
		SetMotion_(demo_npc_yellow, ReadMotion_(demo_npc_yellow, "m125_00_jump"), BLEND_XL);
		SetMotion_(demo_npc_red, ReadMotion_(demo_npc_red, "m125_00_jump"), BLEND_XL);
		PlaySE_("SE_DEM_005");

		//���o�I�ɐ����ŗ��������̂ƁA�Ȃ��̃��[�v���[�V�����͖������߁A�L�[���͑҂��͖���
		//�U�̓����Ȃ̂ŁA����͂P�̂���
		WaitMotion(g_npc_cf_white);

		// �W�����v�㏸���[�V����
		SetMotion_(g_npc_cf_white, ReadMotion_(g_npc_cf_white, "m125_00_jump_end"), BLEND_N);
		SetMotion_(demo_npc_green, ReadMotion_(demo_npc_green, "m125_00_jump_end"), BLEND_N);
		SetMotion_(demo_npc_black, ReadMotion_(demo_npc_black, "m125_00_jump_end"), BLEND_N);
		SetMotion_(demo_npc_blue, ReadMotion_(demo_npc_blue, "m125_00_jump_end"), BLEND_N);
		SetMotion_(demo_npc_yellow, ReadMotion_(demo_npc_yellow, "m125_00_jump_end"), BLEND_N);
		SetMotion_(demo_npc_red, ReadMotion_(demo_npc_red, "m125_00_jump_end"), BLEND_N);
	CloseMsgWnd_();

	//�U�̓����Ȃ̂ŁA����͂P�̂���
	WaitMotion(g_npc_cf_white);

	// �ҋ@�ɖ߂�
	SetMotion_(g_npc_cf_white, MOT_WAIT, BLEND_N);
	SetMotion_(demo_npc_green, MOT_WAIT, BLEND_N);
	SetMotion_(demo_npc_black, MOT_WAIT, BLEND_N);
	SetMotion_(demo_npc_blue, MOT_WAIT, BLEND_N);
	SetMotion_(demo_npc_yellow, MOT_WAIT, BLEND_N);
	SetMotion_(demo_npc_red, MOT_WAIT, BLEND_N);

	Wait_(30);

	// �z���C�g�̃��b�Z�[�W
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_CF_WHITE");
	ShowMsg_("COLORFONDUE_WHITE_110");
	KeyInputWait_();
	CloseMsgWnd_();

	// ���Ó]
	SetFadePlane_(FADE_PLANE.PLANE_3D);	
	SetFade_(FADE_OUT, FADE_COLOR_WHITE, FADE_DEF);
	PlaySE_("SE_FLD_109");
	WaitFade_();
	// ���Ó]�����b�Z�[�W
	OpenMsgWnd_();
	ShowMsg_("COLORFONDUE_WHITE_111");
	KeyInputWait_();
	CloseMsgWnd_();

	// ���Ó]����
	SetFade_(FADE_IN, FADE_COLOR_WHITE, FADE_DEF);
	WaitFade_();
	SetFadePlane_(FADE_PLANE.PLANE_NORMAL);	

	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_CF_WHITE");
	ShowMsg_("COLORFONDUE_WHITE_112");
	KeyInputWait_();
	ShowMsg_("COLORFONDUE_WHITE_113");
	KeyInputWait_();
	ShowMsg_("COLORFONDUE_WHITE_114");
	KeyInputWait_();
	CloseMsgWnd_();

	//�y�C���g�z������
	SetEventFlg_("BFG_COUPLING_UNLOCK_PAINT", true);
	SetEventFlg_("BFG_TRAVEL_INFO_SHOW_052", true);		//���̐S��
	//�[���f���@�y�C���g�z�����ցI
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
	// ���L����z�u���Ă���ꍇ�͕\������
	if (npc_Rukiya != C_NONE_ID) {
		SetVisible(npc_Rukiya, true);
	}
	//�J�����ʒu�ύX
	SetPlayableCamera_();
	//�z�u�ύX���ʓ|�������̂ŁA�}�b�v�`�F���W�Ō��ɖ߂�
	ChangeMapPosDir_("H01_00", Vec3(15.0, 0.0, 0.0), 267);
}
