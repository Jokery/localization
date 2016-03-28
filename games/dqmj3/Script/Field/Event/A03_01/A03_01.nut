//===================== A03_01�Z���^�[�r��3F ====================

// �J�[�h�L�[�̃A�C�e���h�c
const CARDKEY_B_ID = 98; // �J�[�h�L�[��

//-------------------- ������ --------------------
// �N�������F�o�g���I����ɌĂ΂�܂�
// (�o�g���̏��s�����C�x���g�t���O�̐ݒ�̓R�R)
//-------------------- ������ --------------------
function AfterBattle()
{
//------------------------------------------------------------------
// �t���O�̏�Ԃ��擾
	local main_num = GetNumFlg_("NUM_SCENARIO_MAIN");
	local city_num = GetNumFlg_("NUM_SCENARIO_SUB_CITY");

	// �K�[�h�}�X�^�[�ɕ���������NUM�t���O��ύX���鏈���i�v���Ӂj
	// �C�x���g�u���b�N��EventStartOperate()�ł͔s�k�𔻒�ł��Ȃ��̂�
	// �����Ŕs�k�̔���ƃt���O�ύX���s���B( 16 -> 15 )
	if(main_num == GetFlagID_("CONST_SM_CITY")){
		if(city_num == GetFlagID_("CONST_SS_CI_BATTLE_OF_GUARDMASTER")){
			// �K�[�h�}�X�^�[�ɔs�k
			if(GetBattleEndType_() == END_TYPE_LOSE){
				SetNumFlg_("NUM_SCENARIO_SUB_CITY", GetFlagID_("CONST_SS_CI_REMATCH_GUARDMASTER"));
			}
		}
	}

	EventEnd_();
}
//-------------------- ������ --------------------
// �N�������F��ʐ؂�ւ��̃t�F�[�h�C����
// (NPC�ƒn���̐ݒu/�}�b�v���B�t���O�̓R�R)
//-------------------- ������ --------------------
function FadeIn()
{
	// �}�b�v���B�t���O
	SetEventFlg_("BFG_ARRIVE_AT_A03", true);

	// �t���O�̏�Ԃ��擾
	local main_num = GetNumFlg_("NUM_SCENARIO_MAIN");
	local city_num = GetNumFlg_("NUM_SCENARIO_SUB_CITY");

	local check_dead = GetEventFlg_("BFG_DEAD_RETURN");

	local bit_phantom_wall = GetEventFlg_("BFG_OPEN_SECRET_AREA_A03_01");

	// ���A�ʒu�̃`�F�b�N
	if(check_dead == true){
		if(main_num == GetFlagID_("CONST_SM_CITY")){
			if(city_num >= GetFlagID_("CONST_SS_CI_ESTABLISH_KINGDOM")){
				ChangeMap_("A01_00");
			}
		}
	}

	DebugPrint(" ");
	DebugPrint("NUM_SCENARIO_MAIN �̒l�� " + main_num + " �ɂȂ�܂����B");
	DebugPrint("NUM_SCENARIO_SUB_CITY �̒l�� " + city_num + " �ɂȂ�܂����B");

	local door_key_02 = GetEventFlg_("BFG_ELECTRONIC_DOOR_SECOND_GETKEY");
	local door_open_02 = GetEventFlg_("BFG_ELECTRONIC_DOOR_SECOND_OPEN");
	DebugPrint("door_key_02 �̒l�� " + door_key_02 + " �ɂȂ�܂����B");

	// ����̃}�b�v�`�F���WNULL��ݒ�
	if(main_num == GetFlagID_("CONST_SM_CITY")){
		if(city_num == GetFlagID_("CONST_SS_CI_REPORT_TO_KING")
		|| city_num == GetFlagID_("CONST_SS_CI_TEST_RUN_HAIGOU")){
			SetHitEnableMapChangeNull_("w_A00_00ALdr_001", false);
		}
		else{
			SetHitEnableMapChangeNull_("w_A00_00ALdr_001", true);
		}
	}
	else{
		SetHitEnableMapChangeNull_("w_A00_00ALdr_001", true);
	}

//-----------------------------------------------------------------
// NPC
	//������
	guard_master <- C_NONE_ID;
	g_ace        <- C_NONE_ID;

	// �K�[�h�}�X�^�[�����Ȃ��̂ŃL���[�}�V���Q�ŉ��Ή�
	if(main_num == GetFlagID_("CONST_SM_CITY")){
		if(city_num == GetFlagID_("CONST_SS_CI_UNLOCK_THE_DOOR_2")
		|| city_num == GetFlagID_("CONST_SS_CI_REMATCH_GUARDMASTER")){
			local boss = ReadNpc_("m121_00");
			guard_master = ArrangePointNpc_(boss, "Boss");
			// ��풓���[�V����
			if(city_num == GetFlagID_("CONST_SS_CI_UNLOCK_THE_DOOR_2")){
				// ��풓���[�V����(�Î~)
				local gur_stop_L = ReadMotion_(guard_master, "m121_00_stop_L");
				SetMotion_(guard_master , gur_stop_L, 0);
				// ���m�A�C�B��
				LoadEffect_("ef812_01_off_monoeye");
				SetSelectBoneEffect_("ef812_01_off_monoeye", guard_master, ATTACH_GLOBAL);
			}
			// ��b�����Ȃ�
			SetTalkEnable_(guard_master , false);
			//�A�i���C�Y
			SetReactorMsg_(guard_master, "GARD_MASTER_REC");
			//SetMotion_(boss, ReadMotion_(boss, "m121_00_stand"), 4);
		}
		// �{�X���G�[�X���f����z�u
		if(city_num >= GetFlagID_("CONST_SS_CI_EXPLORE_THE_ROOM")
		&& city_num <= GetFlagID_("CONST_SS_CI_REPORT_TO_KING")){
			if(city_num >= GetFlagID_("CONST_SS_CI_EXPLORE_THE_ROOM")
			&& city_num <= GetFlagID_("CONST_SS_CI_REQUEST_ACE")){
				local id_ace = ReadNpc_("n002");
				g_ace = ArrangePointNpc_(id_ace, "Ace");
			}
			else if(city_num >= GetFlagID_("CONST_SS_CI_EXAMINE_MACHINE")
			&& city_num <= GetFlagID_("CONST_SS_CI_TALK_ACE")){
				local id_ace = ReadNpc_("n002");
				g_ace = ArrangePointNpc_(id_ace, "Ace_02");
			}
			else{
				local id_ace = ReadNpc_("n002");
				g_ace = ArrangePointNpc_(id_ace, "Ace_03");
			}
			// ��b���J�����̐ݒ�
			SetTalkCameraType_(g_ace, TALK_CAMERA_UP);
			// �A�i���C�Y
			SetReactorMsg_(g_ace, "NPC_ACE_REC");
		}
	}

//-------------------------------------------------------------------------------------
// �C�x���g�n��
	// ������
	east_elevator     <- C_NONE_ID;
	door_lock         <- C_NONE_ID;
	guard_master_mine <- C_NONE_ID;
	screen            <- C_NONE_ID;
	machine           <- C_NONE_ID;
	mine_escape_room  <- C_NONE_ID;
	mine_start_demo   <- C_NONE_ID;
	mineid_phantom    <- C_NONE_ID;
	mine_ruler_01     <- C_NONE_ID;

	// ���G���x�[�^�[�̃}�b�v�`�F���W�n��
	east_elevator = SetPointBoxEventMine_("Mine_Door_02", true);

	// �K�[�h�}�X�^�[�Ƃ̃o�g���ڍs�p�n��
	if(main_num == GetFlagID_("CONST_SM_CITY")){
		if(city_num == GetFlagID_("CONST_SS_CI_UNLOCK_THE_DOOR_2")
		|| city_num == GetFlagID_("CONST_SS_CI_REMATCH_GUARDMASTER")){
			guard_master_mine = SetPointBoxEventMine_("Mine_Boss", false);
		}
	}

	// �h�A�Q�̒n��
	if(main_num == GetFlagID_("CONST_SM_CITY")){
		// �{�X��ヂ�j�^�[�̃C�x���g�n����z�u
		if(city_num == GetFlagID_("CONST_SS_CI_EXPLORE_THE_ROOM")){
			screen = SetPointCircleEventMine_("Mine_Screen", true);
		}
		// �G�[�X�̕��ɋ@�B������̂Œn����ݒu
		if(city_num == GetFlagID_("CONST_SS_CI_EXAMINE_MACHINE")){
			machine = SetPointCircleEventMine_("Mine_Machine", true);
			mine_escape_room = SetPointBoxEventMine_("Mine_Escape_Room", false);
		}
		// �K�[�h�}�X�^�[�̕����̑O��ʂ�Ɣ�������f��
		if(city_num == GetFlagID_("CONST_SS_CI_UNLOCK_THE_DOOR_1")){
			mine_start_demo = SetPointBoxEventMine_("Mine_Seek_the_key_02", false);
		}
	}

	// �K�[�h�}�X�^�[�̕����̃h�A���b�N�̒n��
	if(door_key_02 == false || door_open_02 == false){
		door_lock = SetPointBoxEventMine_("Mine_Door_01", true);
	}

	//���̕�
	if(bit_phantom_wall == false){
		mineid_phantom = SetPointBoxEventMineNoFallWait_("Mine_Phantom_Wall_01");
	}

	// ���[���|�C���g(�{�X��O)
	mine_ruler_01 = SetPointCircleEventMine_("mine_ruler_01", true);

	DebugPrint("�C�x���g�n���̓Ǎ�");
	
//------------------------------------------------------
// �M�~�b�N
	// �d�q�h�A�Q�̃J�M���J����܂Ŕz�u�i���Ή��̉������j
	if(door_open_02 == false){
		local g_door01 = ReadGimmick_("o_A03_00");
		local door01 = ArrangePointGimmick_("o_A03_00", g_door01, "g_door_01");
	}
	else{
		//�h�A���J����������Ă��܂����ߔz�u���܂���B
	}

	// 7/17�i��ROM�ŃR�����g��
//	//�K�[�h�}�X�^�[������Ă���h�A�i�J�[�h�L�[�͖����A�f���Đ��݂̂ŊJ���j
//	if(main_num == GetFlagID_("CONST_SM_CITY")){
//		if(city_num <= GetFlagID_("CONST_SS_CI_BATTLE_OF_GUARDMASTER")){
//			local g_door02 = ReadGimmick_("o_A03_00");
//			local door02 = ArrangePointGimmick_("o_A03_00", g_door02, "g_door_02");
//		}
//	}

	// �ǐ������C�����j�^�[
	local g_main_screen = ReadGimmick_("o_A03_04");
	local main_screen = ArrangePointGimmick_("o_A03_04", g_main_screen, "g_main_screen");

	// �_�ł���ԃ��j�^�[
	if(main_num == GetFlagID_("CONST_SM_CITY")){
		if(city_num == GetFlagID_("CONST_SS_CI_EXPLORE_THE_ROOM")){
			// �_�ł���ԃ��j�^�[(��)
			local g_flashing_screen_l = ReadGimmick_("o_A03_06");
			local flashing_screen_l = ArrangePointGimmick_("o_A03_06", g_flashing_screen_l, "g_flashing_screen_l");
			//�u�I�v�A�C�R��
			local exclamation02 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "exclamation02");
			SetNaviMapIconVisible_(exclamation02, true);
		}
		else if(city_num == GetFlagID_("CONST_SS_CI_EXAMINE_MACHINE")){
			// �_�ł���ԃ��j�^�[(�E)
			local g_flashing_screen_r = ReadGimmick_("o_A03_05");
			local flashing_screen_r = ArrangePointGimmick_("o_A03_05", g_flashing_screen_r, "g_flashing_screen_r");
			//�u�I�v�A�C�R��
			local exclamation03 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "exclamation03");
			SetNaviMapIconVisible_(exclamation03, true);
		}
	}	

	// ���G���x�[�^�̔�
	local g_e_elevator = ReadGimmick_("o_A03_01");
	local e_elevator = ArrangePointGimmick_("o_A03_01", g_e_elevator, "g_elevator");

	// ���G���x�[�^�̃��t�g
	local g_e_lift = ReadGimmick_("o_A01_01");
	local e_lift = ArrangePointGimmick_("o_A01_01", g_e_lift, "g_elevator_lift");

	// ���[���|�C���g(�{�X��O)
	local g_rulerpoint = ReadGimmick_("o_com_08");
	rulerpoint01 <- ArrangePointGimmick_("o_com_08", g_rulerpoint, "g_rulerpoint");
	SetMotion_(rulerpoint01, "GIMMICK_0", 0);
	if(GetEventFlg_("BFG_RULER_ADD_006") == true){
		SetMotion_(rulerpoint01, "GIMMICK_2", 0);
		//���[���|�C���g���N����Ƀ��[���|�C���g�A�C�R���\��
		icon01 <- ArrangePointNaviMapIcon_(NAVIMAP_ICON.RULER_POINT , "g_rulerpoint");
		SetNaviMapIconVisible_(icon01, true);
	}

//-------------------------------------------------------------------------------
//���A�N�^�[�|�C���g
	// �W����p�G���x�[�^
	reactor_point01 <- ArrangeMsgReactorPoint("reactorPoint_01", GetFlagID_("BFG_REACTER_POINT_023")
		, SHORT_DIST, "REC_POINT_NOC_01_01", "REC_POINT_NOC_01_02");
	// �����
	local reactor_point02 = ArrangeMsgReactorPoint("reactorPoint_02", GetFlagID_("BFG_REACTER_POINT_029")
		, SHORT_DIST, "REC_POINT_NOC_02_01", "REC_POINT_NOC_02_02");
	// �Z�L�����e�B���b�N��
	if(door_open_02 == false){
		local reactor_point03 = ArrangeMsgReactorPoint("reactorPoint_03", GetFlagID_("BFG_REACTER_POINT_026")
			, SHORT_DIST, "REC_POINT_NOC_03_01", "REC_POINT_NOC_03_02");
	}
	// ���j�^�[���䑕�u
	local reactor_point04 = ArrangeMsgReactorPoint("reactorPoint_04", GetFlagID_("BFG_REACTER_POINT_028")
		, SHORT_DIST, "REC_POINT_NOC_04_01", "REC_POINT_NOC_04_02");
	// ���[���|�C���g
	local reactor_point05 = ArrangeMsgReactorPoint("reactorPoint_05", GetFlagID_("BFG_REACTER_POINT_010")
		, SHORT_DIST, "REC_POINT_NOC_05_01", "REC_POINT_NOC_05_02");

//----------------------------------------------------------------------
// ���Z���[�����֎~
//�iDemo116[�G�[�X�̗��ݎ�]�Đ���`Demo123[�z�����u�̎��^�]]�Đ���܂ŋ֎~���邪�����ł͋֎~�ɂ��邾���ŋ֎~����������̂�A00_00.nut�ōs���Ă���j
	if(main_num == GetFlagID_("CONST_SM_CITY")){
		if(city_num == GetFlagID_("CONST_SS_CI_EXAMINE_MACHINE")){
			// ���[�����֎~����t���O��ݒ�
			SetEventFlg_("BFG_PLAYERABILITY_RULER_PROHIBIT", true);
		}
	}

	EventEnd_();
}

//-------------------- ������ --------------------
// �N�������F�t�B�[���h����J�n��
// ( �}�b�v�؂�ւ�����̃f���Đ��E�o�g���J�n���߁E�퓬�I�����̃��b�Z�[�W�̕\��
// ( �ݒu����Wait�����݂Ȃ��瑀�삷��̂̓R�R
//-------------------- ������ --------------------
function EventStartOperate()
{
// �t���O�̏�Ԃ��擾
	local main_num     = GetNumFlg_("NUM_SCENARIO_MAIN");
	local city_num     = GetNumFlg_("NUM_SCENARIO_SUB_CITY");
	local door_key_02  = GetEventFlg_("BFG_ELECTRONIC_DOOR_SECOND_GETKEY");
	local door_open_02 = GetEventFlg_("BFG_ELECTRONIC_DOOR_SECOND_OPEN");

//---------------------------------------------------------------------------------------
// �퓬�J�n( 14 -> 16 )
	// �C�x���g��[�K�[�h�}�X�^�[��]�E[�K�[�h�}�X�^�[�Đ�]
	if(main_num == GetFlagID_("CONST_SM_CITY")){
		if(city_num == GetFlagID_("CONST_SS_CI_PROTECT_THE_ROOM")){
			// �K�[�h�}�X�^�[�풆�̃t���O
			SetNumFlg_("NUM_SCENARIO_SUB_CITY", GetFlagID_("CONST_SS_CI_BATTLE_OF_GUARDMASTER"));
			// �K�[�h�}�X�^�[��
			ChangeBattleParty_(6); // ������
		}
	}

//---------------------------------------------------------------------------------------
// �퓬����( 16 -> 17 )
	if(main_num == GetFlagID_("CONST_SM_CITY")){
		if(city_num == GetFlagID_("CONST_SS_CI_BATTLE_OF_GUARDMASTER")){
			if (GetBattleEndType_() == BATTLE_END_TYPE_WIN){
				// �f���Đ��O�Ƀt�B�[���h���f��Ȃ����߂̑Ή�
				SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				WaitFade_();
				// �K�[�h�}�X�^�[�ɏ���
				SetNumFlg_("NUM_SCENARIO_SUB_CITY", GetFlagID_("CONST_SS_CI_EXPLORE_THE_ROOM"));
				// �K�[�h�}�X�^�[���j�t���O(���A�C�R���\���t���O)
				SetEventFlg_("BFG_MAP_ICON_020", true);
				// �f����ɐݒ肳����l���̈ʒu�ƌ���
				//SetReturnDemoPosDir_(Vec3(510.0, 342.65, 973.96), -70);
				// �f����̕��A���W�ƌ������w��
				SetReturnDemoPosDir_(Vec3(0.0, 0.4, 270.0), 0);
				// Demo113[�K�[�h�}�X�^�[���j]���Đ������
				ChangeDemo_(113);
			}
			else{
				// �K�[�h�}�X�^�[�ɔs�k�i���Y�^�j
				// �����ł̓K�[�h�}�X�^�[��̔s�k���肪�ł��Ȃ��̂�
				// �C�x���g�u���b�N��AfterBattle()�Ŕs�k�̔���ƃt���O�ύX���s���B
			}
		}
	}

//---------------------------------------------------------------------------------------
// �f���Đ�
	if(main_num == GetFlagID_("CONST_SM_CITY")){
		switch(city_num){
		// Demo115[�ߋ��̘^��f��]�̍Đ�����
		case GetFlagID_("CONST_SS_CI_PAST_OF_THE_VIDEO"):
			// �f���Đ��O�Ƀt�B�[���h���f��Ȃ����߂̑Ή�
			SetFade_(FADE_OUT, FADE_COLOR_WHITE, FADE_SHORT);
			SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
			WaitFade_();
			// �T�u�t���O��i�߂�
			SetNumFlg_("NUM_SCENARIO_SUB_CITY", GetFlagID_("CONST_SS_CI_REQUEST_ACE"));
			ChangeDemo_(115);
			break;
		// Demo116[�G�[�X�̗��ݎ�]�̍Đ�����
		case GetFlagID_("CONST_SS_CI_REQUEST_ACE"):
			// �f���Đ��O�Ƀt�B�[���h���f��Ȃ����߂̑Ή�
			SetFade_(FADE_OUT, FADE_COLOR_WHITE, FADE_SHORT);
			SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
			WaitFade_();
			// �T�u�t���O��i�߂�
			SetNumFlg_("NUM_SCENARIO_SUB_CITY", GetFlagID_("CONST_SS_CI_EXAMINE_MACHINE"));
			// �f����̕��A�ʒu�ƌ���
			SetReturnDemoPosDir_(Vec3(-0.812, 0.400, 370.429), -64);
			ChangeDemo_(116);
			break;
		}
	}

	if(main_num == GetFlagID_("CONST_SM_CITY")){
		switch(city_num){
		// Demo118[������n�A �����s�s�ړ�]�Đ�����
		case GetFlagID_("CONST_SS_CI_MOVE_CITY"):
			// �f���Đ��O�Ƀt�B�[���h���f��Ȃ����߂̑Ή�
			SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
			SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
			WaitFade_();
			// �T�u�t���O��i�߂�
			SetNumFlg_("NUM_SCENARIO_SUB_CITY", GetFlagID_("CONST_SS_CI_MOVE_GRAVE"));
			ChangeDemo_(118);
			break;
		// Demo119[������n�B ���y�̗쓹�ړ�]�Đ�����
		case GetFlagID_("CONST_SS_CI_MOVE_GRAVE"):
			// �f���Đ��O�Ƀt�B�[���h���f��Ȃ����߂̑Ή�
			SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
			SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
			WaitFade_();
			// �T�u�t���O��i�߂�
			SetNumFlg_("NUM_SCENARIO_SUB_CITY", GetFlagID_("CONST_SS_CI_COMMENTARY_PANEL"));
			ChangeDemo_(119);
			break;
		// Demo120[������n�C ���j�^���]
		case GetFlagID_("CONST_SS_CI_COMMENTARY_PANEL"):
			// �f���Đ��O�Ƀt�B�[���h���f��Ȃ����߂̑Ή�
			SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
			SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
			WaitFade_();
			// 120��121���������ꂽ�̂Łu"CONST_SS_CI_TALK_ACE"�v���u"CONST_SS_CI_REPORT_TO_KING"�v�֕ύX
			SetNumFlg_("NUM_SCENARIO_SUB_CITY", GetFlagID_("CONST_SS_CI_REPORT_TO_KING"));
			// �f����̕��A�ʒu�ƌ���
			SetReturnDemoPosDir_(Vec3(1.194, 0.400, 374.008), 0);
			ChangeDemo_(120);
			break;
		// 120��121���������ꂽ�̂ŃR�����g��(���Y�^)
		//Demo121[������n�D �G�[�X�Ɖ�b]
		//case GetFlagID_("CONST_SS_CI_TALK_ACE"):
		//	SetNumFlg_("NUM_SCENARIO_SUB_CITY", GetFlagID_("CONST_SS_CI_REPORT_TO_KING"));
		//	ChangeDemo_(121);
		//	break; 
		}
	}

	// �Ђƒʂ�̏������I�������A�G���x�[�^�g�p���ɗ��ĂĂ����t���O���~�낷
	if(GetEventFlg_("BFG_CHECK_USED_ELEVATER_FADE_OFF") == true){
		// �G���x�[�^���g�p�����^�C�~���O�Ńf���𗬂��^�C�~���O�Ɣ�����ꍇ�t�F�[�h�̎�ނ�؂�ւ���ׂ̃t���O���ɖ߂�
		SetEventFlg_("BFG_CHECK_USED_ELEVATER_FADE_OFF", false);
	}

	EventEnd_();
}

//-------------------- NPC --------------------
//�N�������FNPC�Ɍ�������A�{�^���������ꂽ��
//OpenMsgWnd_() -> ShowMsg_() -> KeyInputWait_() �̏��ɌĂяo������
//-------------------- NPC --------------------
function TouchNpc()
{
// �t���O�̏�Ԃ��擾
	local main_num = GetNumFlg_("NUM_SCENARIO_MAIN");
	local city_num = GetNumFlg_("NUM_SCENARIO_SUB_CITY");
	local target = GetTargetId_();
	local player = GetPlayerId_();

	switch(target)
	{
	case g_ace:
		if(main_num == GetFlagID_("CONST_SM_CITY")){
			switch(city_num)
			{
			case GetFlagID_("CONST_SS_CI_EXPLORE_THE_ROOM"):
				CommonMessageT("NAME_TAG_ACE","MSG_ACE_001");
				break;
			case GetFlagID_("CONST_SS_CI_EXAMINE_MACHINE"):
				CommonMessageT("NAME_TAG_ACE","MSG_ACE_002");
				break;
			case GetFlagID_("CONST_SS_CI_REPORT_TO_KING"):
				CommonMessageT("NAME_TAG_ACE","MSG_ACE_003");
				break;
			default:
				DebugPrint("�Ή�����G�[�X�̉�b������܂���");
				break;
			}
		}
		break;
	default:
		DebugPrint("�Ή����Ă���NPC�����܂���");
		break;
	}

	EventEnd_();
}
//-------------------- NPC --------------------
//�N�������F���A�N�^�[�Œ��ׂ�ꂽ�Ƃ��̃A�i���C�Y
//-------------------- NPC --------------------
function ReactorAnalyze()
{
	EventEnd_();
}

//-------------------- �C�x���g�n�� --------------------
//�N�������F�}�b�v�ɔz�u�������b�V���ɐG�ꂽ�Ƃ�
//-------------------- �C�x���g�n�� --------------------
function TouchEventMine()
{
	local target = GetTouchEventMineId_();
	local player = GetPlayerId_();
	local door_key_02 = GetEventFlg_("BFG_ELECTRONIC_DOOR_SECOND_GETKEY");
	local door_open_02 = GetEventFlg_("BFG_ELECTRONIC_DOOR_SECOND_OPEN");
	// ���̕�
	local bit_phantom_wall = GetEventFlg_("BFG_OPEN_SECRET_AREA_A03_01");
	// ���G���x�[�^�[���փt���O
	local unlock_east_elevator = GetEventFlg_("BFG_UNLOCK_EAST_ELEVATOR");
	// �t���O�̏�Ԃ��擾
	local main_num = GetNumFlg_("NUM_SCENARIO_MAIN");
	local city_num = GetNumFlg_("NUM_SCENARIO_SUB_CITY");

	switch(target)
	{
	// ���[���|�C���g(�K�[�h�}�X�^�[�̕����̑O)
	case mine_ruler_01:
		CommPlayerTurnAroundObj(rulerpoint01);
		CommRulerPointEvent(rulerpoint01, "BFG_RULER_ADD_006", "g_rulerpoint");
		break;
	// ���G���x�[�^
	case east_elevator:
		// ��l�������A�N�^�[�|�C���g01�Ɍ�����
		CommPlayerTurnAroundObj(reactor_point01);
		if(unlock_east_elevator == false){
			SetEventFlg_("BFG_UNLOCK_EAST_ELEVATOR", true);
			PlaySE_("SE_FLD_062");
			Wait_(70);
			CommonMessage("UNLOCK_ELEVATOR");
		}
		uChoiceMoveEastEleveter();
		break;
	// �K�[�h�}�X�^�[�̕����̑O��ʂ�Ɣ�������f��
	case mine_start_demo:
		if(main_num == GetFlagID_("CONST_SM_CITY")){
			if(city_num == GetFlagID_("CONST_SS_CI_UNLOCK_THE_DOOR_1")){
				// �n���폜
				DeleteEventMine_(mine_start_demo);
				// �T�u�t���O��i�߂�( 11 -> 12 )
				SetNumFlg_("NUM_SCENARIO_SUB_CITY", GetFlagID_("CONST_SS_CI_SEEK_THE_DOOR_2_KEY"));
				// �f���I����̈ʒu���C��(��)
				//SetReturnDemoPosDir_(Vec3(-8.605, 0.59, 193.467), 0);
				// Demo127[�J�[�h�L�[�a��T��]�Đ�
				ChangeDemo_(127);
			}
		}
		break;
	// �K�[�h�}�X�^�[�̕����̔�
	case door_lock:
		if(main_num == GetFlagID_("CONST_SM_CITY")){
			if(city_num == GetFlagID_("CONST_SS_CI_UNLOCK_THE_DOOR_1")
			|| city_num == GetFlagID_("CONST_SS_CI_SEEK_THE_DOOR_2_KEY")){
				if(door_key_02 == true){
					// �h�A���b�N�̒n�����폜
					DeleteEventMine_(door_lock);
					// ��l������̕��Ɍ�����
					CommPlayerTurnAroundDir(0);
					// �h�A���b�N������SE�i���j
					//PlaySE_("SE_DEM_044");
					// �h�A���b�N�����̃��b�Z�[�W��\��
					OpenMsgWnd_();
					//  ���b�Z�[�W�̒u������
					SetExchangeItemName_(CARDKEY_B_ID);
					ShowMsg_("UNLOCK_DOOR_MESSAGE");
					KeyInputWait_();
					CloseMsgWnd_();
					// �T�u�t���O��i�߂�( 11 -> 12 )
					SetNumFlg_("NUM_SCENARIO_SUB_CITY", GetFlagID_("CONST_SS_CI_UNLOCK_THE_DOOR_2"));
					SetEventFlg_("BFG_ELECTRONIC_DOOR_SECOND_OPEN", true);
					// �f���I����̈ʒu���C��
					SetReturnDemoPosDir_(Vec3(0.0, 0.4, 240.0), 0);
					// Demo(��)126[�d�q�h�A�̉����Q]�Đ�
					ChangeDemo_(126);
				}else{
					if(door_open_02 == false){
						// ��l������̕��Ɍ�����(�A���t�@���Ή�:�ڍׂ�TaskNo.540)
						CommPlayerTurnAroundDir(0);
						//  ���b�Z�[�W�̒u������
						SetExchangeItemName_(CARDKEY_B_ID);
						// ���Ƀ��b�N���������Ă��郁�b�Z�[�W
						CommonMessage("LOCK_MESSAGE");
					}
				}
			}
		}
		break;
	// �K�[�h�}�X�^�[�Ƃ̃o�g���ڍs�p�n��(13 or 15)
	case guard_master_mine:
		if(main_num == GetFlagID_("CONST_SM_CITY")){
			if(city_num == GetFlagID_("CONST_SS_CI_UNLOCK_THE_DOOR_2")){
				// �T�u�t���O��i�߂�( 13 -> 14 )
				SetNumFlg_("NUM_SCENARIO_SUB_CITY", GetFlagID_("CONST_SS_CI_PROTECT_THE_ROOM"));
				// Demo111[���������K�[�h�}�X�^�[]�Đ�
				ChangeDemo_(111); // �C�x���g��[�K�[�h�}�X�^�[��]��
			}else{
				if(city_num == GetFlagID_("CONST_SS_CI_REMATCH_GUARDMASTER")){
					// �T�u�t���O��i�߂�( 15 -> 14 )
					SetNumFlg_("NUM_SCENARIO_SUB_CITY", GetFlagID_("CONST_SS_CI_PROTECT_THE_ROOM"));
					// Demo112[�K�[�h�}�X�^�[�Đ�]�Đ�
					ChangeDemo_(112); // �C�x���g��[�K�[�h�}�X�^�[��]��
				}
			}
		}
		break;
	// �Ǘ����̃��j�^�[
	case screen:
		if(main_num == GetFlagID_("CONST_SM_CITY")){
			if(city_num == GetFlagID_("CONST_SS_CI_EXPLORE_THE_ROOM")){
				// �n���폜
				DeleteEventMine_(screen);
				// �X�N���[�����̐Ԃ������v�̕����Ɏ�l������]������
				CommPlayerTurnAroundDir(0);
				// �T�u�t���O��i�߂�( 16 -> 17 )
				SetNumFlg_("NUM_SCENARIO_SUB_CITY", GetFlagID_("CONST_SS_CI_PAST_OF_THE_VIDEO"));
				// Demo114[�f���̃��i�[�e]�Đ�
				ChangeDemo_(114);
			}
		}
		break;
	// �Ǘ����̋@�B
	case machine:
		if(main_num == GetFlagID_("CONST_SM_CITY")){
			if(city_num == GetFlagID_("CONST_SS_CI_EXAMINE_MACHINE")){
				// �n���폜
				DeleteEventMine_(machine);
				// �T�u�X�N���[�����̐Ԃ������v�̕����Ɏ�l������]������
				CommPlayerTurnAroundDir(-90);
				// �T�u�t���O��i�߂�( 19 -> 20 )
				SetNumFlg_("NUM_SCENARIO_SUB_CITY", GetFlagID_("CONST_SS_CI_MOVE_CITY"));
				// Demo117[������n�@ �p�l������]�Đ�
				ChangeDemo_(117);
			}
		}
		break;
	// �Ǘ�������o��Ȃ��悤�ɂ���
	case mine_escape_room:
		if(main_num == GetFlagID_("CONST_SM_CITY")){
			if(city_num == GetFlagID_("CONST_SS_CI_EXAMINE_MACHINE")){
				// �N���֎~�̃C�x���g�n���ɐG�ꂽ�ۂ̈ړ�����
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_ACE");
				ShowMsg_("CALL");
				KeyInputWait_();
				CloseMsgWnd_();
				CommPlayerTurnMoveDirWalk(0);
			}
		}
		break;
	// ���̕�
	case mineid_phantom:
		if( bit_phantom_wall  == false){
			SetEventFlg_("BFG_OPEN_SECRET_AREA_A03_01", true);
			DeleteEventMine_(mineid_phantom);
		}
		break;
	default:
		DebugPrint("�Ή����Ă���n��������܂���");
		break;
	}

	EventEnd_();
}

//--------------------------
//  ���b�Z�[�W�̕\���֐��i���O�Ȃ��j
//--------------------------
function CommonMessage(message_key){
	OpenMsgWnd_();
	ShowMsg_(message_key);
	KeyInputWait_();
	CloseMsgWnd_();
}
//----------------------------------------
// ���b�Z�[�W�\���֐�
//--------------------------------------
function CommonMessageT(name_tag, message){
	OpenMsgWnd_();
	SetTalkName_(name_tag);
	ShowMsg_(message);
	KeyInputWait_();
	CloseMsgWnd_();
}

//===========================================================================
// ���[�J���֐��F���G���x�[�^�̈ړ�����
//---------------------------------------------------------------------------
// ����    �F�Ȃ�
// �߂�l  �F�Ȃ�
//===========================================================================
function uChoiceMoveEastEleveter()
{
	// �n���P�K���փt���O���`�F�b�N
	if(GetEventFlg_("BFG_UNLOCKED_EAST_ELEVETER_UNDER") == false){
		uMoveUpEastEleveter();
	}
	else{
		uMoveUpDownEastEleveter();
	}
}

//===========================================================================
// ���[�J���֐��F���G���x�[�^�̈ړ�����(����O)
//---------------------------------------------------------------------------
// ����    �F�Ȃ�
// �߂�l  �F�Ȃ�
//===========================================================================
function uMoveUpEastEleveter()
{
	OpenMsgWnd_();
	ShowMsg_("MOVE_EAST_ELEVATOR");
	KeyInputWait_();
	switch(GetQueryResult_()){
	// �Q�X�K
	case QUERY3_0:
		CloseMsgWnd_();
		// �n���폜
		DeleteEventMine_(east_elevator);
		// �G���x�[�^���g�p�����^�C�~���O�Ńf���𗬂��^�C�~���O�Ɣ�����ꍇ�t�F�[�h�̎�ނ�؂�ւ���ׂ̃t���O
		SetEventFlg_("BFG_CHECK_USED_ELEVATER_FADE_OFF", true);
		// �G���x�[�^�ňړ�SE
		PlaySE_("SE_FLD_061");
		// �Q�X�K�Ɉړ�
		ChangeMapPosDir_("A03_00", Vec3(A03_00_RTN_POS_E_X, A03_00_RTN_POS_E_Y, A03_00_RTN_POS_E_Z), RTN_DIR_E);
		break;
	// �P�K(�L���O�_��)
	case QUERY3_1:
		CloseMsgWnd_();
		// �n���폜
		DeleteEventMine_(east_elevator);
		// �G���x�[�^���g�p�����^�C�~���O�Ńf���𗬂��^�C�~���O�Ɣ�����ꍇ�t�F�[�h�̎�ނ�؂�ւ���ׂ̃t���O
		SetEventFlg_("BFG_CHECK_USED_ELEVATER_FADE_OFF", true);
		// �G���x�[�^�ňړ�SE
		PlaySE_("SE_FLD_061");
		// �P�K�Ɉړ�
		ChangeMapPosDir_("A01_00", Vec3(A01_00_RTN_POS_E_X, A01_00_RTN_POS_E_Y, A01_00_RTN_POS_E_Z), RTN_DIR_E);
		break;
	// ���̂܂�(�R�K)
	case QUERY3_2:
		CloseMsgWnd_();
		break;
	}
}

//===========================================================================
// ���[�J���֐��F���G���x�[�^�̈ړ�����(�����)
//---------------------------------------------------------------------------
// ����    �F�Ȃ�
// �߂�l  �F�Ȃ�
//===========================================================================
function uMoveUpDownEastEleveter()
{
	OpenMsgWnd_();
	ShowMsg_("MOVE_EAST_ELEVATOR_02");
	KeyInputWait_();
	switch(GetQueryResult_()){
	// �Q�X�K
	case QUERY_0:
		CloseMsgWnd_();
		// �n���폜
		DeleteEventMine_(east_elevator);
		// �G���x�[�^���g�p�����^�C�~���O�Ńf���𗬂��^�C�~���O�Ɣ�����ꍇ�t�F�[�h�̎�ނ�؂�ւ���ׂ̃t���O
		SetEventFlg_("BFG_CHECK_USED_ELEVATER_FADE_OFF", true);
		// �G���x�[�^�ňړ�SE
		PlaySE_("SE_FLD_061");
		// �Q�X�K�Ɉړ�
		ChangeMapPosDir_("A03_00", Vec3(A03_00_RTN_POS_E_X, A03_00_RTN_POS_E_Y, A03_00_RTN_POS_E_Z), RTN_DIR_E);
		break;
	// �P�K
	case QUERY_1:
		CloseMsgWnd_();
		// �n���폜
		DeleteEventMine_(east_elevator);
		// �G���x�[�^���g�p�����^�C�~���O�Ńf���𗬂��^�C�~���O�Ɣ�����ꍇ�t�F�[�h�̎�ނ�؂�ւ���ׂ̃t���O
		SetEventFlg_("BFG_CHECK_USED_ELEVATER_FADE_OFF", true);
		// �G���x�[�^�ňړ�SE
		PlaySE_("SE_FLD_061");
		// �P�K�Ɉړ�
		ChangeMapPosDir_("A01_00", Vec3(A01_00_RTN_POS_E_X, A01_00_RTN_POS_E_Y, A01_00_RTN_POS_E_Z), RTN_DIR_E);
		break;
	// �n���P�K
	case QUERY_2:
		CloseMsgWnd_();
		// �n���폜
		DeleteEventMine_(east_elevator);
		// �G���x�[�^���g�p�����^�C�~���O�Ńf���𗬂��^�C�~���O�Ɣ�����ꍇ�t�F�[�h�̎�ނ�؂�ւ���ׂ̃t���O
		SetEventFlg_("BFG_CHECK_USED_ELEVATER_FADE_OFF", true);
		// �G���x�[�^�ňړ�SE
		PlaySE_("SE_FLD_061");
		// �n���P�K�Ɉړ�
		ChangeMapPosDir_("A01_01", Vec3(A01_01_RTN_POS_E_X, A01_01_RTN_POS_E_Y, A01_01_RTN_POS_E_Z), RTN_DIR_E);
		break;
	// ��߂�
	case QUERY_3:
		CloseMsgWnd_();
		break;
	}
}

