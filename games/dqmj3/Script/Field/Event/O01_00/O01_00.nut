//===================== ���_�y�o�[�`�����R���V�A��(���r�[)�z ====================

// <����1>
// ���r�[�͍L���}�b�v��S�`C�����N�̕������ʂɗp�ӂ���Ă���
// ���m���X����e�����N�̕����ɂȂ����Ă���C���[�W

// <����2>
// ���̃C�x���g�n���͍폜���Ȃ�
// (�����N��͈�x�N���A�����2�x�ƒ���ł��Ȃ��̂ŃC�x���g�n���ɂ͉��炩�̃��b�Z�[�W��\��)

//-------------------- ������ --------------------
// �N�������F�o�g���I����ɌĂ΂�܂�
// (�o�g���̏��s�����C�x���g�t���O�̐ݒ�̓R�R)
//-------------------- ������ --------------------
function AfterBattle()
{
// ���C���V�i���I�p�̃t���O-----------------------------------------
	// �t���O���擾����
	local main_num 			= GetNumFlg_("NUM_SCENARIO_MAIN");
	local green_event_num 	= GetNumFlg_("NUM_SCENARIO_SUB_GREEN");
	local ice_event_num 	= GetNumFlg_("NUM_SCENARIO_SUB_ICE");
	local volcano_event_num = GetNumFlg_("NUM_SCENARIO_SUB_VOLCANO");
	local sky_num 			= GetNumFlg_("NUM_SCENARIO_SUB_SKY");
	
	DebugPrint(" ");
	DebugPrint("NUM_SCENARIO_MAIN �̒l�� " + main_num + " �ɂȂ�܂����B");
	DebugPrint("NUM_SCENARIO_SUB_GREEN �̒l�� " + green_event_num + " �ɂȂ�܂����B");

	EventEnd_();
}

//+++++++++++++++++++++++++++++++++++++++++++++++++
// �N�������FFadeIn()���O�ɌĂ΂��
//-------------------------------------------------
// ��ȗp�r�F�f����Ƀ��C�h��Ԃ̋���������
//           ��O�I�ȃC�x���g�t���O�̐ݒ�Ȃǂ��s��
//+++++++++++++++++++++++++++++++++++++++++++++++++
function BeforeInitMap()
{
	local main_num          = GetNumFlg_("NUM_SCENARIO_MAIN");
	local ice_event_num     = GetNumFlg_("NUM_SCENARIO_SUB_ICE");
	local volcano_event_num = GetNumFlg_("NUM_SCENARIO_SUB_VOLCANO");
	// Demo311[B�����N���C�Z���X�l��]�̍Đ���Ƀ��C�h�̉������s��
	if(GetEventFlg_("BFG_GET_B_RANK_MONOLITH_KEY") == false){
		if(GetEventFlg_("BFG_DUMMY_AQUA_RIDE_TUTORIAL") == false){
			if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){
				if(ice_event_num == GetFlagID_("CONST_SS_IF_GO_TO_THE_EAST_ICE_PARK")){
					//���C�h��������
					SetRideOffStart_();
				}
			}
		}
	}
	// Demo514[A�����N���C�Z���X�l��]�̍Đ���A��󃉃C�h�`���[�g���A�����b�Z�[�W��\������^�C�~���O�Ń��C�h�̉������s��
	if(GetEventFlg_("BFG_DISPLAY_RIDE_TUTORIAL_MESSAGE") == true){
		if(main_num == GetFlagID_("CONST_SM_VOLCANO")){
			if(volcano_event_num == GetFlagID_("CONST_SS_VC_PRE_SECRET_BASE_DEMO")){
				//���C�h��������
				SetRideOffStart_();
			}
		}
	}
	// �[���f��[�e���W�A�̊܂�]�Đ��O�ɉ���
	if(GetEventFlg_("BFG_PLAYING_TEREZIA_DEMO") == true){
		SetRideOffStart_();
	}
	// Demo515[�e���W�A�̊܂݇@�i�o�[�`�����R���V�A���j]�̍Đ���Ƀ��C�h�̉������s��
	if(main_num == GetFlagID_("CONST_SM_VOLCANO")){
		if(volcano_event_num == GetFlagID_("CONST_SS_VC_PRE_HELP_GIRL_DEMO")){
			//���C�h��������
			SetRideOffStart_();
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
	SetEventFlg_("BFG_ARRIVE_AT_O01", true);

//---------------------------------------------------------------
// �V�i���I�t���O�̎擾
	// �t���O���擾����
	local main_num 			= GetNumFlg_("NUM_SCENARIO_MAIN");
	local green_event_num 	= GetNumFlg_("NUM_SCENARIO_SUB_GREEN");
	local ice_event_num 	= GetNumFlg_("NUM_SCENARIO_SUB_ICE");
	local volcano_event_num = GetNumFlg_("NUM_SCENARIO_SUB_VOLCANO");
	local sky_num 			= GetNumFlg_("NUM_SCENARIO_SUB_SKY");

	DebugPrint(" ");
	DebugPrint("NUM_SCENARIO_MAIN �̒l�� " + main_num + " �ɂȂ�܂����B");
	DebugPrint("NUM_SCENARIO_SUB_GREEN �̒l�� " + green_event_num + " �ɂȂ�܂����B");

	// ���A�ʒu�̃`�F�b�N
	local check_dead = GetEventFlg_("BFG_DEAD_RETURN");
	if(check_dead == true){
		// �S�ŒʒmBit�t���O��false�ɖ߂�( �v���O�����ŗ��ĂăX�N���v�g�ō~�낷 )
		SetEventFlg_("BFG_DEAD_RETURN", false);
	}

//------------------------------------------------------------------
// �M�~�b�N
	//���m���X�̃��f���ǂݍ���
	local l_monolith = ReadGimmick_("o_com_02");
	// ���m���X
	g_monolith_s <- C_NONE_ID;
	g_monolith_a <- C_NONE_ID;
	g_monolith_b <- C_NONE_ID;
	g_monolith_c <- C_NONE_ID;

	// C���m���X
	g_monolith_c = ArrangePointGimmick_("o_com_02", l_monolith, "obj_C_monolith");
	// C���m���X(�u�N���O�ҋ@�v�̃��[�V������ݒ�)
	SetMotion_(g_monolith_c, MOT_GIMMICK_0, 0);
	if(GetEventFlg_("BFG_START_C_MONOLITH") == true){
		// C�����N�擾��̎��������m���X�ċN���C�x���g����������̂Łu�N���O�ҋ@�v�̃A�j����ݒ�
		if(main_num == GetFlagID_("CONST_SM_GRASSLAND")
		&& green_event_num == GetFlagID_("CONST_SS_GR_GET_RIDE_SKILL_JUMP")){
			SetMotion_(g_monolith_c, MOT_GIMMICK_0, 0);
			DebugPrint("���m���X�̃A�j����GIMMICK_0�ł�");
		}
		else{
			// ���m���X�̋N����ҋ@�A�j�����Đ�
			SetMotion_(g_monolith_c, MOT_GIMMICK_2, BLEND_N);
			DebugPrint("���m���X�̃A�j����GIMMICK_2�ł�");
		}
	}
	// B���m���X
	g_monolith_b = ArrangePointGimmick_("o_com_02", l_monolith, "obj_B_monolith");
	// B���m���X(�u�N���O�ҋ@�v�̃��[�V������ݒ�)
	SetMotion_(g_monolith_b, "GIMMICK_0", 0);
	if(GetEventFlg_("BFG_START_B_MONOLITH") == true){
		// B�����N�擾��̎��������m���X�ċN���C�x���g����������̂Łu�N���O�ҋ@�v�̃A�j����ݒ�
		if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")
		&& ice_event_num == GetFlagID_("CONST_SS_IF_GO_TO_THE_EAST_ICE_PARK")){
			if(GetEventFlg_("BFG_DUMMY_AQUA_RIDE_TUTORIAL") == false){
				SetMotion_(g_monolith_b, MOT_GIMMICK_0, 0);
				DebugPrint("���m���X�̃A�j����GIMMICK_0�ł�");
			}
			else{
				SetMotion_(g_monolith_b, MOT_GIMMICK_2, BLEND_N);
				DebugPrint("���m���X�̃A�j����GIMMICK_2�ł�");
			}
		}
		else{
			// ���m���X�̋N����ҋ@�A�j�����Đ�
			SetMotion_(g_monolith_b, MOT_GIMMICK_2, BLEND_N);
			DebugPrint("���m���X�̃A�j����GIMMICK_2�ł�");
		}
	}
	// A���m���X
	g_monolith_a = ArrangePointGimmick_("o_com_02", l_monolith, "obj_A_monolith");
	// A���m���X(�u�N���O�ҋ@�v�̃��[�V������ݒ�)
	SetMotion_(g_monolith_a, "GIMMICK_0", 0);
	if(GetEventFlg_("BFG_START_A_MONOLITH") == true){
		// A�����N�擾��̎��������m���X�ċN���C�x���g����������̂Łu�N���O�ҋ@�v�̃A�j����ݒ�
		if(main_num == GetFlagID_("CONST_SM_VOLCANO")
		&& volcano_event_num == GetFlagID_("CONST_SS_VC_PRE_SECRET_BASE_DEMO")){
			SetMotion_(g_monolith_a, MOT_GIMMICK_0, 0);
			DebugPrint("���m���X�̃A�j����GIMMICK_0�ł�");
		}
		else if(main_num == GetFlagID_("CONST_SM_VOLCANO")
		&& volcano_event_num == GetFlagID_("CONST_SS_VC_PRE_HELP_GIRL_DEMO")){
			SetMotion_(g_monolith_a, MOT_GIMMICK_2, 0);
			DebugPrint("���m���X�̃A�j����GIMMICK_2�ł�");
		}
		else if(main_num == GetFlagID_("CONST_SM_VOLCANO")
		&& volcano_event_num == GetFlagID_("CONST_SS_HV_GO_BACK_THE_VOLCANO")){
			SetMotion_(g_monolith_a, MOT_GIMMICK_2, 0);
			DebugPrint("���m���X�̃A�j����GIMMICK_2�ł�");
		}
		else{
			// ���m���X�̋N����ҋ@�A�j�����Đ�
			SetMotion_(g_monolith_a, MOT_GIMMICK_2, BLEND_N);
			DebugPrint("���m���X�̃A�j����GIMMICK_2�ł�");
		}
	}
	// S���m���X
	g_monolith_s = ArrangePointGimmick_("o_com_02", l_monolith, "obj_S_monolith");
	// S���m���X(�u�N���O�ҋ@�v�̃��[�V������ݒ�)
	SetMotion_(g_monolith_s, "GIMMICK_0", 0);
	if(GetEventFlg_("BFG_START_S_MONOLITH") == true){
		// ���m���X�̋N����ҋ@�A�j�����Đ�
		SetMotion_(g_monolith_s, MOT_GIMMICK_2, BLEND_N);
		DebugPrint("���m���X�̃A�j����GIMMICK_2�ł�");
	}

	// �����N�̔�
	local door_s = ReadGimmick_("o_O01_02");
	local door_a = ReadGimmick_("o_O01_03");
	local door_b = ReadGimmick_("o_O01_05");
	local door_c = ReadGimmick_("o_O01_04");
	local g_door_s = ArrangePointGimmick_("o_O01_02", door_s, "g_door_s");
	local g_door_a = ArrangePointGimmick_("o_O01_03", door_a, "g_door_a");
	local g_door_b = ArrangePointGimmick_("o_O01_05", door_b, "g_door_b");
	local g_door_c = ArrangePointGimmick_("o_O01_04", door_c, "g_door_c");

	// ���m���X�̂���(��)<�d�v�A�C�e���̃G�t�F�N�g>
	g_key   <- C_NONE_ID; // �b�����N
	g_key_b <- C_NONE_ID; // �a�����N
	g_key_a <- C_NONE_ID; // �`�����N
	if(main_num == GetFlagID_("CONST_SM_GRASSLAND")
	&& green_event_num == GetFlagID_("CONST_SS_GR_GET_RIDE_SKILL_JUMP")){
		if(GetEventFlg_("BFG_GET_C_RANK_MONOLITH_KEY") == false){
			LoadEffect_("EF300_40_ITEM_SIGN");
			g_key = SetPointWorldEffect_("EF300_40_ITEM_SIGN", "g_key");
		}
	}
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")
	&& ice_event_num == GetFlagID_("CONST_SS_IF_GO_TO_THE_EAST_ICE_PARK")){
		if(GetEventFlg_("BFG_GET_B_RANK_MONOLITH_KEY") == false){
			LoadEffect_("EF300_40_ITEM_SIGN");
			g_key_b = SetPointWorldEffect_("EF300_40_ITEM_SIGN", "g_key_b");
		}
	}
	if(main_num == GetFlagID_("CONST_SM_VOLCANO")
	&& volcano_event_num == GetFlagID_("CONST_SS_VC_PRE_SECRET_BASE_DEMO")){
		if(GetEventFlg_("BFG_GET_A_RANK_MONOLITH_KEY") == false){
			LoadEffect_("EF300_40_ITEM_SIGN");
			g_key_a = SetPointWorldEffect_("EF300_40_ITEM_SIGN", "g_key_a");
		}
	}

//-------------------------------------------------------------------------------------
// NPC�֘A
	// ���i�[�e
	g_npc_renate <- C_NONE_ID;
	if(main_num == GetFlagID_("CONST_SM_SKY")){										// Num0 = 8
		if(sky_num < GetFlagID_("CONST_SS_SK_FIND_OUT_THE_S_DOOR")){				// Num9 < 4
			//
		}
		else if(sky_num < GetFlagID_("CONST_SS_SK_GO_OUT_THE_COLOSSEUM_1")){				// Num9 < 11
			// ���f���Ǎ�
			local id_renate = ReadNpc_("n007");
			g_npc_renate = ArrangePointNpc_(id_renate, "npc_renate00");
			// NPC�̐ݒ�
			SetTalkCameraType_(g_npc_renate, TALK_CAMERA_UP);
			SetReactorMsg_(g_npc_renate, "REC_NPC_RENATE");
			// ��b�J�������ɓ��߂����̂ŃA���t�@�l��ݒ肷��
			SetManualCalcAlpha_(g_npc_renate, true);
			SetAlpha_(g_npc_renate, 1.0);
		}
	}

//-------------------------------------------------------------------------------------------------
// �C�x���g�n��

	//����
	g_mine_door_c 	<- SetPointCircleEventMine_("mine_C_01", true);// C�̔�
	g_mine_door_b 	<- SetPointCircleEventMine_("mine_B_01", true);// B�̔�
	g_mine_door_a 	<- SetPointCircleEventMine_("mine_A_01", true);// A�̔�
	g_mine_door_s 	<- SetPointCircleEventMine_("mine_S_01", true);// S�̔�
	//�o��
	g_exit_c 		<- SetPointCircleEventMine_("mine_C_02", true);// �m�`���[���p�[�N�֖߂�
	g_exit_b		<- C_NONE_ID;
	if(GetEventFlg_("BFG_PLAYING_TEREZIA_DEMO") == false){
		g_exit_b = SetPointCircleEventMine_("mine_B_02", true);// �����̕X���֖߂�
	}
	g_exit_a 		<- SetPointCircleEventMine_("mine_A_02", true);// �ŔM�̉ΎR�֖߂�
	g_exit_s 		<- SetPointCircleEventMine_("mine_S_02", true);// �m�`���[���p�[�N�֖߂�

	// ���m���X�̂���(��)
	mine_key   <- C_NONE_ID; // �b�����N
	mine_key_b <- C_NONE_ID; // �a�����N
	mine_key_a <- C_NONE_ID; // �`�����N
	if(main_num == GetFlagID_("CONST_SM_GRASSLAND")
	&& green_event_num == GetFlagID_("CONST_SS_GR_GET_RIDE_SKILL_JUMP")){
		if(GetEventFlg_("BFG_GET_C_RANK_MONOLITH_KEY") == false){
			mine_key = SetPointCircleEventMine_("mine_key", false);
		}
	}
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")
	&& ice_event_num == GetFlagID_("CONST_SS_IF_GO_TO_THE_EAST_ICE_PARK")){
		if(GetEventFlg_("BFG_GET_B_RANK_MONOLITH_KEY") == false){
			mine_key_b = SetPointCircleEventMine_("mine_key_b", false);
		}
	}
	if(main_num == GetFlagID_("CONST_SM_VOLCANO")
	&& volcano_event_num == GetFlagID_("CONST_SS_VC_PRE_SECRET_BASE_DEMO")){
		if(GetEventFlg_("BFG_GET_A_RANK_MONOLITH_KEY") == false){
			mine_key_a = SetPointCircleEventMine_("mine_key_a", false);
		}
	}

//----------------------------------------------------------------------
// ���A�N�^�[�|�C���g
	// ���̂R�͑��̃C�x���g�u���b�N�Ŏg�p���邽�߃O���[�o���ϐ�
	reactorPoint09 <- C_NONE_ID;
	reactorPoint10 <- C_NONE_ID;
	reactorPoint11 <- C_NONE_ID;

	local reactorPoint01 = ArrangeMsgReactorPoint("reactor_point_01", GetFlagID_("BFG_REACTER_POINT_030")
		, LONG_DIST, "REC_POINT_01_01", "REC_POINT_01_02");
	local reactorPoint02 = ArrangeMsgReactorPoint("reactor_point_02", GetFlagID_("BFG_REACTER_POINT_031")
		, LONG_DIST, "REC_POINT_02_01", "REC_POINT_02_02");
	local reactorPoint03 = ArrangeMsgReactorPoint("reactor_point_03", GetFlagID_("BFG_REACTER_POINT_032")
		, LONG_DIST, "REC_POINT_03_01", "REC_POINT_03_02");
	local reactorPoint04 = ArrangeMsgReactorPoint("reactor_point_04", GetFlagID_("BFG_REACTER_POINT_033")
		, LONG_DIST, "REC_POINT_04_01", "REC_POINT_02_02");
	local reactorPoint05 = ArrangeMsgReactorPoint("reactor_point_05", GetFlagID_("BFG_REACTER_POINT_034")
		, LONG_DIST, "REC_POINT_05_01", "REC_POINT_05_02");
	local reactorPoint06 = ArrangeMsgReactorPoint("reactor_point_06", GetFlagID_("BFG_REACTER_POINT_035")
		, LONG_DIST, "REC_POINT_06_01", "REC_POINT_02_02");
	local reactorPoint07 = ArrangeMsgReactorPoint("reactor_point_07", GetFlagID_("BFG_REACTER_POINT_036")
		, LONG_DIST, "REC_POINT_07_01", "REC_POINT_07_02");
	local reactorPoint08 = ArrangeMsgReactorPoint("reactor_point_08", GetFlagID_("BFG_REACTER_POINT_037")
		, LONG_DIST, "REC_POINT_08_01", "REC_POINT_02_02");
	if(main_num == GetFlagID_("CONST_SM_GRASSLAND")
	&& green_event_num == GetFlagID_("CONST_SS_GR_GET_RIDE_SKILL_JUMP")){
		if(GetEventFlg_("BFG_GET_C_RANK_MONOLITH_KEY") == false){
			reactorPoint09 = ArrangeMsgReactorPoint("reactor_point_09", GetFlagID_("BFG_REACTER_POINT_046")
				, LONG_DIST, "REC_POINT_09_01", "REC_POINT_09_02");
		}
	}
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")
	&& ice_event_num == GetFlagID_("CONST_SS_IF_GO_TO_THE_EAST_ICE_PARK")){
		if(GetEventFlg_("BFG_GET_B_RANK_MONOLITH_KEY") == false){
			reactorPoint10 = ArrangeMsgReactorPoint("reactor_point_10", GetFlagID_("BFG_REACTER_POINT_046")
				, LONG_DIST, "REC_POINT_09_01", "REC_POINT_09_02");
		}
	}
	if(main_num == GetFlagID_("CONST_SM_VOLCANO")
	&& volcano_event_num == GetFlagID_("CONST_SS_VC_PRE_SECRET_BASE_DEMO")){
		if(GetEventFlg_("BFG_GET_A_RANK_MONOLITH_KEY") == false){
			reactorPoint11 = ArrangeMsgReactorPoint("reactor_point_11", GetFlagID_("BFG_REACTER_POINT_046")
				, LONG_DIST, "REC_POINT_09_01", "REC_POINT_09_02");
		}
	}

//----------------------------------------------------------------------
// ���[���֎~( �e���C�h�̃`���[�g���A���C�x���g���̓��[���o���Ȃ��悤�ɂ��� )

	if(main_num == GetFlagID_("CONST_SM_GRASSLAND")
	&& green_event_num == GetFlagID_("CONST_SS_GR_GET_RIDE_SKILL_JUMP")){
		SetEventFlg_("BFG_PLAYERABILITY_RULER_PROHIBIT", true);
	}
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")
	&& ice_event_num == GetFlagID_("CONST_SS_IF_GO_TO_THE_EAST_ICE_PARK")){
		if(GetEventFlg_("BFG_DUMMY_AQUA_RIDE_TUTORIAL") == false){
			SetEventFlg_("BFG_PLAYERABILITY_RULER_PROHIBIT", true);
		}
	}
	if(main_num == GetFlagID_("CONST_SM_VOLCANO")
	&& volcano_event_num == GetFlagID_("CONST_SS_VC_PRE_SECRET_BASE_DEMO")){
		SetEventFlg_("BFG_PLAYERABILITY_RULER_PROHIBIT", true);
	}
	// S�����N�擾��O�ɏo��܂ł̊�
	if(main_num == GetFlagID_("CONST_SM_SKY")){
		if(sky_num >= GetFlagID_("CONST_SS_SK_GO_OUT_THE_COLOSSEUM_2")){	// Num9 = 99
			SetEventFlg_("BFG_PLAYERABILITY_RULER_PROHIBIT", true);			// ���[�� �֎~
			SetEventFlg_("BFG_FLIGHT_PROHIBIT", true);						// �t���C�g�V�O�i�� �֎~
		}
	}

//----------------------------------------------------------------------
// �i�r�}�b�v
	//�u�I�v�A�C�R��
	// ���m���X(�b�����N�p���m���X)
	local exclamation01 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "obj_C_monolith"); 
	SetNaviMapIconVisible_(exclamation01, true);
	// ���m���X(�a�����N�p���m���X)
	local exclamation03 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "obj_B_monolith"); 
	SetNaviMapIconVisible_(exclamation03, true);
	// ���m���X(�`�����N�p���m���X)
	local exclamation05 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "obj_A_monolith"); 
	SetNaviMapIconVisible_(exclamation05, true);
	// ���m���X(�r�����N�p���m���X)
	local exclamation07 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "obj_S_monolith"); 
	SetNaviMapIconVisible_(exclamation07, true);

	// ���m���X�̂���(��)
	exclamation02 <- C_NONE_ID;
	exclamation04 <- C_NONE_ID;
	exclamation06 <- C_NONE_ID;
	if(main_num == GetFlagID_("CONST_SM_GRASSLAND")
	&& green_event_num == GetFlagID_("CONST_SS_GR_GET_RIDE_SKILL_JUMP")){
		if(GetEventFlg_("BFG_GET_C_RANK_MONOLITH_KEY") == false){
			exclamation02 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "reactor_point_09"); 
			SetNaviMapIconVisible_(exclamation02, true);
		}
	}
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")
	&& ice_event_num == GetFlagID_("CONST_SS_IF_GO_TO_THE_EAST_ICE_PARK")){
		if(GetEventFlg_("BFG_GET_B_RANK_MONOLITH_KEY") == false){
			exclamation04 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "reactor_point_10"); 
			SetNaviMapIconVisible_(exclamation04, true);
		}
	}
	if(main_num == GetFlagID_("CONST_SM_VOLCANO")
	&& volcano_event_num == GetFlagID_("CONST_SS_VC_PRE_SECRET_BASE_DEMO")){
		if(GetEventFlg_("BFG_GET_A_RANK_MONOLITH_KEY") == false){
			exclamation06 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "reactor_point_11"); 
			SetNaviMapIconVisible_(exclamation06, true);
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
// ���C���V�i���I�p�̃t���O-----------------------------------------
	// �t���O���擾����
	local main_num 			= GetNumFlg_("NUM_SCENARIO_MAIN");
	local green_event_num 	= GetNumFlg_("NUM_SCENARIO_SUB_GREEN");
	local ice_event_num 	= GetNumFlg_("NUM_SCENARIO_SUB_ICE");
	local volcano_event_num = GetNumFlg_("NUM_SCENARIO_SUB_VOLCANO");
	local sky_num 			= GetNumFlg_("NUM_SCENARIO_SUB_SKY");

	local player = GetPlayerId_();	// �v���C���[ID�擾
	local p_pos	 = GetPos_(player);	// �v���C���[�̍��W���擾
	
	// ��xDemo022[C�����N����]���Đ����ꂽ���ǂ����`�F�b�N����
	local check_demo1 = GetEventFlg_("BFG_EXAM_RANK_C");
	// ��xDemo304[B�����N����]���Đ����ꂽ���ǂ����`�F�b�N����
	local check_demo2 = GetEventFlg_("BFG_EXAM_RANK_B");
	// ��xDemo507[A�����N����]���Đ����ꂽ���ǂ����`�F�b�N����
	local check_demo3 = GetEventFlg_("BFG_EXAM_RANK_A");
	// ��xDemo618[�Ō�̃p���[]���Đ����ꂽ���ǂ����`�F�b�N����
	local check_demo4 = GetEventFlg_("BFG_EXAM_RANK_S");

//-------------------------------------------------------------------
// �[���f��[�e���W�A�̊܂�]���Đ�
	if(GetEventFlg_("BFG_PLAYING_TEREZIA_DEMO") == true){
		local change_map_name = "I00_00";
		local change_map_pos  = Vec3(-1803.0, 877.8, -1064.2);
		local change_map_dir  = 3;
		SetMotion_(g_monolith_b, MOT_GIMMICK_2, BLEND_N);
		SetEventFlg_("BFG_PLAYING_TEREZIA_DEMO", false);
		uAquaRideTutorialClearDemo();
		SetEventFlg_("BFG_PLAYERABILITY_RULER_PROHIBIT", false); // ���[���֎~������
		ChangeMapPosDir_(change_map_name, change_map_pos, change_map_dir);
	}


// �}�b�v�ؑւ�����̃f���Đ�
	// DEMO022[C�����N����]�Đ�
	if(main_num == GetFlagID_("CONST_SM_GRASSLAND") && green_event_num == GetFlagID_("CONST_SS_VC_TRY_RANK_C")){
		if(check_demo1 == false){
			// �v���C���[���W�����ăf�����Đ����邩�ǂ������߂�
			if(p_pos.z >= 1200.0){
				// �f���Đ��O�Ƀt�B�[���h���f��Ȃ����߂̑Ή�
				SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				WaitFade_();
				SetEventFlg_("BFG_EXAM_RANK_C",true);
				ChangeDemo_(22);
			}
		}
	}
	// �b�����N�����N���A��Ƀ��C�h�`���[�g���A�����b�Z�[�W��\��
	if(main_num == GetFlagID_("CONST_SM_GRASSLAND")
	&& green_event_num == GetFlagID_("CONST_SS_GR_GET_RIDE_SKILL_JUMP")){
		uRideTutorialMessage();
	}
	
	// DEMO304[B�����N����]�Đ�
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD") && ice_event_num == GetFlagID_("CONST_SS_IF_GO_TO_SEE_GATEKEEPER")){
		if(check_demo2 == false){
			// �v���C���[���W�����ăf�����Đ����邩�ǂ������߂�
			if(p_pos.x >= 1200.0){
				// �f���Đ��O�Ƀt�B�[���h���f��Ȃ����߂̑Ή�
				SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				WaitFade_();
				SetNumFlg_("NUM_SCENARIO_SUB_ICE", GetFlagID_("CONST_SS_VC_TRY_RANK_B"));
				ChangeDemo_(304);//304[B�����N����]
			}
		}
	}
	// B�����N�����N���A��Ƀ��C�h�`���[�g���A�����b�Z�[�W��\��
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")
	&& ice_event_num == GetFlagID_("CONST_SS_IF_GO_TO_THE_EAST_ICE_PARK")){
		uRideTutorialMessage();
	}
	
	// DEMO507[A�����N����]�Đ�
	if(main_num == GetFlagID_("CONST_SM_VOLCANO") && volcano_event_num == GetFlagID_("CONST_SS_HV_GO_TO_THE_COLOSSEUM")){
		if(check_demo3 == false){
			// �v���C���[���W�����ăf�����Đ����邩�ǂ������߂�
			if(p_pos.x <= -1200.0){
				// �f���Đ��O�Ƀt�B�[���h���f��Ȃ����߂̑Ή�
				SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				WaitFade_();
				SetNumFlg_("NUM_SCENARIO_SUB_VOLCANO", GetFlagID_("CONST_SS_VC_FIND_OUT_THE_A_DOOR"));
				ChangeDemo_(507);//507[A�����N����]
			}
		}
	}
	// A�����N�����N���A��Ƀ��C�h�`���[�g���A�����b�Z�[�W��\��
	if(main_num == GetFlagID_("CONST_SM_VOLCANO")
	&& volcano_event_num == GetFlagID_("CONST_SS_VC_PRE_SECRET_BASE_DEMO")){
		uRideTutorialMessage();
	}

	// Demo516[�`�����N���C�Z���X�l�� �e���W�A]�Đ�
	if(main_num == GetFlagID_("CONST_SM_VOLCANO")
	&& volcano_event_num == GetFlagID_("CONST_SS_VC_PRE_HELP_GIRL_DEMO")){
		SetNumFlg_("NUM_SCENARIO_SUB_VOLCANO", GetFlagID_("CONST_SS_HV_GO_BACK_THE_VOLCANO"));
		SetReturnDemoPosDir_(Vec3(-1272.979, 10.013, 0.0), -90);
		EventStartChangeDemo(516, FADE_COLOR_BLACK);
	}

	// Demo618[�Ō�̃p���[]�Đ�
	if(main_num == GetFlagID_("CONST_SM_SKY")
	&& sky_num == GetFlagID_("CONST_SS_SK_GO_TO_THE_COLOSSEUM")){				// Num9 = 3
		if(check_demo4 == false){
			// �v���C���[���W�����ăf�����Đ����邩�ǂ������߂�
			if(p_pos.z <= -1200.0){
				// �f���Đ��O�Ƀt�B�[���h���f��Ȃ����߂̑Ή�
				SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				WaitFade_();
				SetReturnDemoPosDir_(Vec3(0.0, 0.0, -1250.0), 0);
				SetNumFlg_("NUM_SCENARIO_SUB_SKY", GetFlagID_("CONST_SS_SK_FIND_OUT_THE_S_DOOR"));	// Num9 = 4
				ChangeDemo_(618);//618[�Ō�̃p���[]
			}
		}
	}

	// ���e�B�X���ԉ�ʂ�Demo637[S�����N���C�Z���X�l���A]�Đ�
	if(main_num == GetFlagID_("CONST_SM_SKY")
	&& sky_num == GetFlagID_("CONST_SS_SK_GO_OUT_THE_COLOSSEUM_1")){			// Num9 = 11
		// �i�r�}�b�v���\��
		SetNavimapVisible_(false);
		// ���b�Z�[�W�{�b�N�X�����̊K�w�ɈÓ]����悤�ɐݒ�
		SetFadePlane_(FADE_PLANE.PLANE_3D);	// ����
		// �t�B�[���h���f��Ȃ����߂̑Ή�
		SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
		WaitFade_();
		// �t���C�g�V�O�i��(���̏�)��ǉ�
		AddItem_(64, 1);
		// �a�菊�̋󂫘g�`�F�b�N
		local residue = GetFreeMonsterNum_();
		if(residue <= 0){
			SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_TEREZIA");
			ShowMsg_("NOT_EMPTY_MSG_001");
			KeyInputWait_();
			CloseMsgWnd_();
			SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, 15);
			// �a�菊���Ăяo��
			GotoMenuFadeOpen(MENU_OPEN.LUGGAGE_OFFICE);
			// �����ɈÓ]
			SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
			// �i�r�}�b�v��\��
			SetNavimapVisible_(true);
			// �󂫘g�����Ȃ��������̏����֔��
			SetNumFlg_("NUM_SCENARIO_SUB_SKY", GetFlagID_("CONST_SS_SK_FELLOW_RETHITH"));
			ChangeMap_("O01_00");
		}
		else{
			// ���e�B�X��ǉ�(Redmine#1137)
			local task_fellow;
			task_fellow = Task_AddFellow_(1603, false);
			WaitTask(task_fellow);
			// �Ó]����K�w�����̏�Ԃɖ߂�
			SetFadePlane_(FADE_PLANE.PLANE_NORMAL);
			SetNumFlg_("NUM_SCENARIO_SUB_SKY", GetFlagID_("CONST_SS_SK_GO_OUT_THE_COLOSSEUM_2"));
			// �߂���W��S�����N���O�ɂ���
			SetReturnDemoPosDir_(Vec3(0.0, 0.0, -850.0), 180);
			// Demo637[S�����N���C�Z���X�l���A]�Đ�
			EventStartChangeDemo(637, FADE_COLOR_BLACK);
		}
	}

	// ���e�B�X�𒇊Ԃɂ���ہA�󂫘g�����Ȃ��������̏���
	if(main_num == GetFlagID_("CONST_SM_SKY")
	&& sky_num == GetFlagID_("CONST_SS_SK_FELLOW_RETHITH")){
		// �i�r�}�b�v���\��
		SetNavimapVisible_(false);
		// ���b�Z�[�W�{�b�N�X�����̊K�w�ɈÓ]����悤�ɐݒ�
		SetFadePlane_(FADE_PLANE.PLANE_3D);	// ����
		// �t�B�[���h���f��Ȃ����߂̑Ή�
		SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
		WaitFade_();
		// �a�菊�̋󂫘g�`�F�b�N
		local residue = GetFreeMonsterNum_();
		if(residue <= 0){
			SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_TEREZIA");
			ShowMsg_("NOT_EMPTY_MSG_001");
			KeyInputWait_();
			CloseMsgWnd_();
			SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, 15);
			// �a�菊���Ăяo��
			GotoMenuFadeOpen(MENU_OPEN.LUGGAGE_OFFICE);
			// �����ɈÓ]
			SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
			// �i�r�}�b�v��\��
			SetNavimapVisible_(true);
			// �󂫘g�����Ȃ��������̏����֔��
			SetNumFlg_("NUM_SCENARIO_SUB_SKY", GetFlagID_("CONST_SS_SK_FELLOW_RETHITH"));
			ChangeMap_("O01_00");
		}
		else{
			// ���e�B�X��ǉ�(Redmine#1137)
			local task_fellow;
			task_fellow = Task_AddFellow_(1603, false);
			WaitTask(task_fellow);
			// �Ó]����K�w�����̏�Ԃɖ߂�
			SetFadePlane_(FADE_PLANE.PLANE_NORMAL);
			SetNumFlg_("NUM_SCENARIO_SUB_SKY", GetFlagID_("CONST_SS_SK_GO_OUT_THE_COLOSSEUM_2"));
			// �߂���W��S�����N���O�ɂ���
			SetReturnDemoPosDir_(Vec3(0.0, 0.0, -850.0), 180);
			// Demo637[S�����N���C�Z���X�l���A]�Đ�
			EventStartChangeDemo(637, FADE_COLOR_BLACK);
		}
	}

// �f���Đ���̃o�g��( �퓬�I���^�C�v�̌�ɋL�� )------------------------------

	//C�����N����
	if(main_num == 1){
		// C�����N�����I����̕��A���W�E������ϐ����i�[
		local return_pos = Vec3(0.0, 0.0, 870.0);	// ���W
		local return_dir = 0;						// �{�Ή��̌���

		switch (green_event_num) {
		// �V�i���I�̕ύX�Ń{�[�V���b�N��Ƀ`���[�g���A�����C�h���g�ݍ��񂾂̂ŃR�����g��( ���Y�^�p )
		case GetFlagID_("CONST_SS_VC_START_RANK_C"):	//C�����N�J�n�f���Đ���
			// �����pNUM�t���O�i�s
			SetNumFlg_("NUM_SCENARIO_SUB_GREEN", GetFlagID_("CONST_SS_VC_FIRST_BATTLE_WIN"));
			//����퓬����
			SetEventFlg_("BFG_DEAD_KEEP_MAP", true);			// �S�Ŏ����̏ꕜ�ABit�t���O
			SetEventFlg_("BFG_BATTLE_GETUP_DISABLE", true);		// �N���オ��Ȃ���t���O
			// �X�e�[�^�X��
			RecoverAll_();
			// C�����N�P���̃o�g����
			ChangeBattleParty_(3);
			break;
		case GetFlagID_("CONST_SS_VC_FIRST_BATTLE_WIN"):	//C�����N�P��폟����
			if(GetBattleEndType_() == BATTLE_END_TYPE_WIN){
				// �f���Đ��O�Ƀt�B�[���h���f��Ȃ����߂̑Ή�
				SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				WaitFade_();
				// �i�s�t���O��i�߂�
				SetNumFlg_("NUM_SCENARIO_SUB_GREEN", GetFlagID_("CONST_SS_VC_SECOND_BATTLE"));
				// Demo026[C�����N�P��폟��]
				ChangeDemo_(26);
			} else {
				// �f���Đ��O�Ƀt�B�[���h���f��Ȃ����߂̑Ή�
				SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				WaitFade_();
				// �b�����N�Đ�t���O
				SetEventFlg_("BFG_REMATCH_RANK_C", true);
				// �t���O��߂�(��ŕύX���邱��)
				SetNumFlg_("NUM_SCENARIO_SUB_GREEN", GetFlagID_("CONST_SS_VC_TRY_RANK_C"));
				// �S�Ŏ����̏ꕜ�ABit�t���O��߂�
				SetEventFlg_("BFG_DEAD_KEEP_MAP", false);
				// �N���オ��Ȃ���t���O
				SetEventFlg_("BFG_BATTLE_GETUP_DISABLE", false);
				// �X�e�[�^�X��
				RecoverAll_();
				// �߂���W��C�����N���O�ɂ���
				SetReturnDemoPosDir_(return_pos, return_dir);
				// Demo027[C�����N�P���s�k] -> �f���ԍ�25�ɕύX
				ChangeDemo_(25);
			}
			break;
		case GetFlagID_("CONST_SS_VC_SECOND_BATTLE"):	//C�����N�Q���J�n
			SetNumFlg_("NUM_SCENARIO_SUB_GREEN", GetFlagID_("CONST_SS_VC_SECOND_BATTLE_WIN"));
			// �S�Ŏ����̏ꕜ�ABit�t���O
			SetEventFlg_("BFG_DEAD_KEEP_MAP", true);
			// �N���オ��Ȃ���t���O
			SetEventFlg_("BFG_BATTLE_GETUP_DISABLE", true);
			ChangeBattleParty_(4);
			break;
		case GetFlagID_("CONST_SS_VC_SECOND_BATTLE_WIN"):	//C�����N�Q��폟����
			if(GetBattleEndType_() == BATTLE_END_TYPE_WIN){
				// �f���Đ��O�Ƀt�B�[���h���f��Ȃ����߂̑Ή�
				SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				WaitFade_();
				// �i�s�t���O��i�߂�
				SetNumFlg_("NUM_SCENARIO_SUB_GREEN", GetFlagID_("CONST_SS_VC_THIRD_BATTLE"));
				// Demo028[C�����N�Q��폟��]
				ChangeDemo_(28);
			} else {
				// �f���Đ��O�Ƀt�B�[���h���f��Ȃ����߂̑Ή�
				SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				WaitFade_();
				// �b�����N�Đ�t���O
				SetEventFlg_("BFG_REMATCH_RANK_C", true);
				// �t���O��߂�(��ŕύX���邱��)
				SetNumFlg_("NUM_SCENARIO_SUB_GREEN", GetFlagID_("CONST_SS_VC_TRY_RANK_C"));
				// �S�Ŏ����̏ꕜ�ABit�t���O��߂�
				SetEventFlg_("BFG_DEAD_KEEP_MAP", false);
				// �N���オ��Ȃ���t���O
				SetEventFlg_("BFG_BATTLE_GETUP_DISABLE", false);
				// �X�e�[�^�X��
				RecoverAll_();
				// �߂���W��C�����N���O�ɂ���
				SetReturnDemoPosDir_(return_pos, return_dir);
				// Demo029[C�����N�Q���s�k] -> �f���ԍ�25�ɕύX
				ChangeDemo_(25);
			}
			break;
		case GetFlagID_("CONST_SS_VC_THIRD_BATTLE"):	//C�����N�R���J�n
			SetNumFlg_("NUM_SCENARIO_SUB_GREEN", GetFlagID_("CONST_SS_VC_GET_LICENSE_RANK_C"));
			// �S�Ŏ����̏ꕜ�ABit�t���O
			SetEventFlg_("BFG_DEAD_KEEP_MAP", true);
			// �N���オ��Ȃ���t���O
			SetEventFlg_("BFG_BATTLE_GETUP_DISABLE", true);
			ChangeBattleParty_(5);
			break;
		case GetFlagID_("CONST_SS_VC_GET_LICENSE_RANK_C"):	//C�����N�R��폟����
			if(GetBattleEndType_() == BATTLE_END_TYPE_WIN){
				// �f���Đ��O�Ƀt�B�[���h���f��Ȃ����߂̑Ή�
				SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				WaitFade_();
				// �i�s�t���O��i�߂�
				SetNumFlg_("NUM_SCENARIO_SUB_GREEN", GetFlagID_("CONST_SS_GR_GET_RIDE_SKILL_JUMP"));
				// �S�Ŏ����̏ꕜ�ABit�t���O��߂�
				SetEventFlg_("BFG_DEAD_KEEP_MAP", false);
				// �N���オ��Ȃ���t���O
				SetEventFlg_("BFG_BATTLE_GETUP_DISABLE", false);
				// ���C�h���C�Z���X�t���O
				SetEventFlg_("BFG_RIDE_LICENSE_FIELD", true);
				// �����N���̃��C�h�̃`���[�g���A�����b�Z�[�W��\������t���O
				SetEventFlg_("BFG_DISPLAY_RIDE_TUTORIAL_MESSAGE", true);
				SetEventFlg_("BFG_DISPLAY_AFTER_RIDE_TUTORIAL_MSG", true);
				// �t�B�[���h���j���[�̃��C�h������
				AddFieldMenu_(FIELD_COMMAND.FIELDRIDE);
				// �퓬�̔{����������
				SetEventFlg_("BFG_BATTLE_SPEED_DOUBLE", true);
				// ���̐S�����
				SetEventFlg_("BFG_TRAVEL_INFO_SHOW_008", true);	// ���̐S���̍��ډ���t���O�y��{�z�t�B�[���h���C�h
				SetEventFlg_("BFG_TRAVEL_INFO_SHOW_014", true);	// ���̐S���̍��ډ���t���O�y���j���[�z�t�B�[���h���C�h�ݒ�
				SetEventFlg_("BFG_TRAVEL_INFO_SHOW_028", true);	// ���̐S���̍��ډ���t���O�y�퓬�z�{���̎d��
				// ���C�h�`���[�g���A�����͒ʐM�ƃZ�[�u���g�p�s��(SQEXRedmine 2��DB #3888)
				uBanSave(true);
				
				// �X�e�[�^�X��
				RecoverAll_();
				
				// �߂���W��C�����N���O�ɂ���
				SetReturnDemoPosDir_(return_pos, return_dir);
				// Demo032[�b�����N���C�Z���X�l��]���Đ����鏈������ŋL�q
				ChangeDemo_(32);
			} else {
				// �f���Đ��O�Ƀt�B�[���h���f��Ȃ����߂̑Ή�
				SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				WaitFade_();
				// �b�����N�Đ�t���O
				SetEventFlg_("BFG_REMATCH_RANK_C", true);
				// �t���O��߂�(��ŕύX���邱��)
				SetNumFlg_("NUM_SCENARIO_SUB_GREEN", GetFlagID_("CONST_SS_VC_TRY_RANK_C"));
				// �S�Ŏ����̏ꕜ�ABit�t���O��߂�
				SetEventFlg_("BFG_DEAD_KEEP_MAP", false);
				// �N���オ��Ȃ���t���O
				SetEventFlg_("BFG_BATTLE_GETUP_DISABLE", false);
				// �X�e�[�^�X��
				RecoverAll_();
				// �߂���W��C�����N���O�ɂ���
				SetReturnDemoPosDir_(return_pos, return_dir);
				// Demo031[C�����N�R���s�k] -> �f���ԍ�25�ɕύX
				ChangeDemo_(25);
			}
			break;
		}
	}
	//B�����N����
	if(main_num == 4){
		switch (ice_event_num){
		case GetFlagID_("CONST_SS_VC_PRE_FIRST_BATTLE_B"):	//B�����N1���J�n
				SetNumFlg_("NUM_SCENARIO_SUB_ICE", GetFlagID_("CONST_SS_VC_JDG_FIRST_BATTLE_B"));
				// �S�Ŏ����̏ꕜ�ABit�t���O
				SetEventFlg_("BFG_DEAD_KEEP_MAP", true);
				// �N���オ��Ȃ���t���O
				SetEventFlg_("BFG_BATTLE_GETUP_DISABLE", true);
				// �X�e�[�^�X��
				RecoverAll_();
				ChangeBattleParty_(28);
			break;
		case GetFlagID_("CONST_SS_VC_JDG_FIRST_BATTLE_B"):	//B�����N�P��폟����
			if(GetBattleEndType_() == BATTLE_END_TYPE_WIN){
				// �f���Đ��O�Ƀt�B�[���h���f��Ȃ����߂̑Ή�
				SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				WaitFade_();
				// �i�s�t���O��i�߂�
				SetNumFlg_("NUM_SCENARIO_SUB_ICE", GetFlagID_("CONST_SS_VC_PRE_SECOND_BATTLE_B"));
				ChangeDemo_(307);//307[B�����N 1��폟��]
			} else {
				// �f���Đ��O�Ƀt�B�[���h���f��Ȃ����߂̑Ή�
				SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				WaitFade_();
				// B�����N�Đ�t���O
				SetEventFlg_("BFG_REMATCH_RANK_B", true);
				// �t���O��߂�(��ŕύX���邱��)
				SetNumFlg_("NUM_SCENARIO_SUB_ICE", GetFlagID_("CONST_SS_VC_TRY_RANK_B"));
				// �S�Ŏ����̏ꕜ�ABit�t���O��߂�
				SetEventFlg_("BFG_DEAD_KEEP_MAP", false);
				// �N���オ��Ȃ���t���O
				SetEventFlg_("BFG_BATTLE_GETUP_DISABLE", false);
				// �X�e�[�^�X��
				RecoverAll_();
				// �߂���W��B�����N���O�ɂ���
				SetReturnDemoPosDir_(Vec3(845.664, 0.0, -2.550), 90);
				// �s�k�f��
				ChangeDemo_(306);
			}
			break;
		case GetFlagID_("CONST_SS_VC_PRE_SECOND_BATTLE_B"):	//B�����N�Q���J�n
			SetNumFlg_("NUM_SCENARIO_SUB_ICE", GetFlagID_("CONST_SS_VC_JDG_SECOND_BATTLE_B"));
			// �S�Ŏ����̏ꕜ�ABit�t���O
			SetEventFlg_("BFG_DEAD_KEEP_MAP", true);
			// �N���オ��Ȃ���t���O
			SetEventFlg_("BFG_BATTLE_GETUP_DISABLE", true);
			ChangeBattleParty_(29);
			break;
		case GetFlagID_("CONST_SS_VC_JDG_SECOND_BATTLE_B"):	//B�����N�Q��폟����
			if(GetBattleEndType_() == BATTLE_END_TYPE_WIN){
				// �f���Đ��O�Ƀt�B�[���h���f��Ȃ����߂̑Ή�
				SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				WaitFade_();
				// �i�s�t���O��i�߂�
				SetNumFlg_("NUM_SCENARIO_SUB_ICE", GetFlagID_("CONST_SS_VC_PRE_THIRD_BATTLE_B"));
				ChangeDemo_(308);//308[B�����N 2��폟��]
			} else {
				// �f���Đ��O�Ƀt�B�[���h���f��Ȃ����߂̑Ή�
				SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				WaitFade_();
				// B�����N�Đ�t���O
				SetEventFlg_("BFG_REMATCH_RANK_B", true);
				// �t���O��߂�(��ŕύX���邱��)
				SetNumFlg_("NUM_SCENARIO_SUB_ICE", GetFlagID_("CONST_SS_VC_TRY_RANK_B"));
				// �S�Ŏ����̏ꕜ�ABit�t���O��߂�
				SetEventFlg_("BFG_DEAD_KEEP_MAP", false);
				// �N���オ��Ȃ���t���O
				SetEventFlg_("BFG_BATTLE_GETUP_DISABLE", false);
				// �X�e�[�^�X��
				RecoverAll_();
				// �߂���W��B�����N���O�ɂ���
				SetReturnDemoPosDir_(Vec3(845.664, 0.0, -2.550), 90);
				// �s�k�f��
				ChangeDemo_(306);
			}
			break;
		case GetFlagID_("CONST_SS_VC_PRE_THIRD_BATTLE_B"):	//B�����N�R���J�n
			SetNumFlg_("NUM_SCENARIO_SUB_ICE", GetFlagID_("CONST_SS_VC_JDG_THIRD_BATTLE_B"));
			// �S�Ŏ����̏ꕜ�ABit�t���O
			SetEventFlg_("BFG_DEAD_KEEP_MAP", true);
			// �N���オ��Ȃ���t���O
			SetEventFlg_("BFG_BATTLE_GETUP_DISABLE", true);
			ChangeBattleParty_(30);
			break;
		case GetFlagID_("CONST_SS_VC_JDG_THIRD_BATTLE_B"):	//B�����N�R��폟����
			if(GetBattleEndType_() == BATTLE_END_TYPE_WIN){
				// �f���Đ��O�Ƀt�B�[���h���f��Ȃ����߂̑Ή�
				SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				WaitFade_();
				// �i�s�t���O��i�߂�
				SetNumFlg_("NUM_SCENARIO_SUB_ICE", GetFlagID_("CONST_SS_IF_GO_TO_THE_EAST_ICE_PARK"));
				// �t�B�[���h�Ő퓬���鎞�̂����T�[�`���x����ύX(2��DB #3701)
				SetNumFlg_("NUM_SEARCH_ATTENDANT_LEVEL", 10);
				// �S�Ŏ����̏ꕜ�ABit�t���O��߂�
				SetEventFlg_("BFG_DEAD_KEEP_MAP", false);
				// �N���オ��Ȃ���t���O
				SetEventFlg_("BFG_BATTLE_GETUP_DISABLE", false);
				// B���C�h���C�Z���X�t���O
				SetEventFlg_("BFG_RIDE_LICENSE_DIVE", true);
				// �����N���̃��C�h�̃`���[�g���A�����b�Z�[�W��\������t���O
				SetEventFlg_("BFG_DISPLAY_RIDE_TUTORIAL_MESSAGE", true);
				SetEventFlg_("BFG_DISPLAY_AFTER_RIDE_TUTORIAL_MSG", true);
				// ���̐S�����
				SetEventFlg_("BFG_TRAVEL_INFO_SHOW_009", true);	// ���̐S���̍��ډ���t���O�y��{�z�C���C�h
				// ���C�h�`���[�g���A�����͒ʐM�ƃZ�[�u���g�p�s��(SQEXRedmine 2��DB #3888)
				uBanSave(true);
				// �X�e�[�^�X�� �����Ή�
				RecoverAll_();
				// �߂���W��B�����N���O�ɂ���
				SetReturnDemoPosDir_(Vec3(845.664, 0.0, -2.550), 90);
				ChangeDemo_(311);//311[B�����N���C�Z���X�l��]
			} else {
				// �f���Đ��O�Ƀt�B�[���h���f��Ȃ����߂̑Ή�
				SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				WaitFade_();
				// B�����N�Đ�t���O
				SetEventFlg_("BFG_REMATCH_RANK_B", true);
				// �t���O��߂�(��ŕύX���邱��)
				SetNumFlg_("NUM_SCENARIO_SUB_ICE", GetFlagID_("CONST_SS_VC_TRY_RANK_B"));
				// �S�Ŏ����̏ꕜ�ABit�t���O��߂�
				SetEventFlg_("BFG_DEAD_KEEP_MAP", false);
				// �N���オ��Ȃ���t���O
				SetEventFlg_("BFG_BATTLE_GETUP_DISABLE", false);
				// �X�e�[�^�X��
				RecoverAll_();
				// �߂���W��B�����N���O�ɂ���
				SetReturnDemoPosDir_(Vec3(845.664, 0.0, -2.550), 90);
				// �s�k�f��
				ChangeDemo_(306);
			}
			break;
		}
	}
	//A�����N����
	if(main_num == 6){
		switch (volcano_event_num){
		case GetFlagID_("CONST_SS_VC_PRE_FIRST_BATTLE_A"):	//A�����N1���J�n
				SetNumFlg_("NUM_SCENARIO_SUB_VOLCANO", GetFlagID_("CONST_SS_VC_JDG_FIRST_BATTLE_A"));
				// �S�Ŏ����̏ꕜ�ABit�t���O
				SetEventFlg_("BFG_DEAD_KEEP_MAP", true);
				// �N���オ��Ȃ���t���O
				SetEventFlg_("BFG_BATTLE_GETUP_DISABLE", true);
				// �X�e�[�^�X��
				RecoverAll_();
				ChangeBattleParty_(31);
			break;
		case GetFlagID_("CONST_SS_VC_JDG_FIRST_BATTLE_A"):	//A�����N�P��폟����
			if(GetBattleEndType_() == BATTLE_END_TYPE_WIN){
				// �f���Đ��O�Ƀt�B�[���h���f��Ȃ����߂̑Ή�
				SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				WaitFade_();
				// �i�s�t���O��i�߂�
				SetNumFlg_("NUM_SCENARIO_SUB_VOLCANO", GetFlagID_("CONST_SS_VC_PRE_SECOND_BATTLE_A"));
				ChangeDemo_(510);//510[A�����N 1��폟��]
			} else {
				// �f���Đ��O�Ƀt�B�[���h���f��Ȃ����߂̑Ή�
				SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				WaitFade_();
				// A�����N�Đ�t���O
				SetEventFlg_("BFG_REMATCH_RANK_A", true);
				// �t���O��߂�(��ŕύX���邱��)
				SetNumFlg_("NUM_SCENARIO_SUB_VOLCANO", GetFlagID_("CONST_SS_VC_FIND_OUT_THE_A_DOOR"));
				// �S�Ŏ����̏ꕜ�ABit�t���O��߂�
				SetEventFlg_("BFG_DEAD_KEEP_MAP", false);
				// �N���オ��Ȃ���t���O
				SetEventFlg_("BFG_BATTLE_GETUP_DISABLE", false);
				// �X�e�[�^�X��
				RecoverAll_();
				// �߂���W��A�����N���O�ɂ���
				SetReturnDemoPosDir_(Vec3(-850.0, 10.0, 0.0), -90);
				// �s�k�f��
				ChangeDemo_(509);
			}
			break;
		case GetFlagID_("CONST_SS_VC_PRE_SECOND_BATTLE_A"):	//A�����N�Q���J�n
			SetNumFlg_("NUM_SCENARIO_SUB_VOLCANO", GetFlagID_("CONST_SS_VC_JDG_SECOND_BATTLE_A"));
			// �S�Ŏ����̏ꕜ�ABit�t���O
			SetEventFlg_("BFG_DEAD_KEEP_MAP", true);
			// �N���オ��Ȃ���t���O
			SetEventFlg_("BFG_BATTLE_GETUP_DISABLE", true);
			ChangeBattleParty_(32);
			break;
		case GetFlagID_("CONST_SS_VC_JDG_SECOND_BATTLE_A"):	//A�����N�Q��폟����
			if(GetBattleEndType_() == BATTLE_END_TYPE_WIN){
				// �f���Đ��O�Ƀt�B�[���h���f��Ȃ����߂̑Ή�
				SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				WaitFade_();
				// �i�s�t���O��i�߂�
				SetNumFlg_("NUM_SCENARIO_SUB_VOLCANO", GetFlagID_("CONST_SS_VC_PRE_THIRD_BATTLE_A"));
				ChangeDemo_(512);//512[A�����N 2��폟��]
			} else {
				// �f���Đ��O�Ƀt�B�[���h���f��Ȃ����߂̑Ή�
				SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				WaitFade_();
				// A�����N�Đ�t���O
				SetEventFlg_("BFG_REMATCH_RANK_A", true);
				// �t���O��߂�(��ŕύX���邱��)
				SetNumFlg_("NUM_SCENARIO_SUB_VOLCANO", GetFlagID_("CONST_SS_VC_FIND_OUT_THE_A_DOOR"));
				// �S�Ŏ����̏ꕜ�ABit�t���O��߂�
				SetEventFlg_("BFG_DEAD_KEEP_MAP", false);
				// �N���オ��Ȃ���t���O
				SetEventFlg_("BFG_BATTLE_GETUP_DISABLE", false);
				// �X�e�[�^�X��
				RecoverAll_();
				// �߂���W��A�����N���O�ɂ���
				SetReturnDemoPosDir_(Vec3(-850.0, 10.0, 0.0), -90);
				// �s�k�f��
				ChangeDemo_(509);
			}
			break;
		case GetFlagID_("CONST_SS_VC_PRE_THIRD_BATTLE_A"):	//A�����N�R���J�n
			SetNumFlg_("NUM_SCENARIO_SUB_VOLCANO", GetFlagID_("CONST_SS_VC_JDG_THIRD_BATTLE_A"));
			// �S�Ŏ����̏ꕜ�ABit�t���O
			SetEventFlg_("BFG_DEAD_KEEP_MAP", true);
			// �N���オ��Ȃ���t���O
			SetEventFlg_("BFG_BATTLE_GETUP_DISABLE", true);
			ChangeBattleParty_(33);
			break;
		case GetFlagID_("CONST_SS_VC_JDG_THIRD_BATTLE_A"):	//A�����N�R��폟����
			if(GetBattleEndType_() == BATTLE_END_TYPE_WIN){
				// �f���Đ��O�Ƀt�B�[���h���f��Ȃ����߂̑Ή�
				SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				WaitFade_();
				// �i�s�t���O��i�߂�
				SetNumFlg_("NUM_SCENARIO_SUB_VOLCANO", GetFlagID_("CONST_SS_VC_PRE_SECRET_BASE_DEMO"));
				// �t�B�[���h�Ő퓬���鎞�̂����T�[�`���x����ύX(2��DB #3701)
				SetNumFlg_("NUM_SEARCH_ATTENDANT_LEVEL", 20);
				// �S�Ŏ����̏ꕜ�ABit�t���O��߂�
				SetEventFlg_("BFG_DEAD_KEEP_MAP", false);
				// �N���オ��Ȃ���t���O
				SetEventFlg_("BFG_BATTLE_GETUP_DISABLE", false);
				// A�����N���C�h���C�Z���X(���)�t���O
				SetEventFlg_("BFG_RIDE_LICENSE_MULTIJUMP", true);
				// �����N���̃��C�h�̃`���[�g���A�����b�Z�[�W��\������t���O
				SetEventFlg_("BFG_DISPLAY_RIDE_TUTORIAL_MESSAGE", true);
				SetEventFlg_("BFG_DISPLAY_AFTER_RIDE_TUTORIAL_MSG", true);
				// ���̐S�����
				SetEventFlg_("BFG_TRAVEL_INFO_SHOW_010", true);	// ���̐S���̍��ډ���t���O	�y��{�z�󃉃C�h
				// ���C�h�`���[�g���A�����͒ʐM�ƃZ�[�u���g�p�s��(SQEXRedmine 2��DB #3888)
				uBanSave(true);
				// �X�e�[�^�X�� �����Ή�
				RecoverAll_();
				// �߂���W��A�����N���O�ɂ���
				SetReturnDemoPosDir_(Vec3(-850.0, 10.0, 0.0), -90);
				ChangeDemo_(514); // Demo514[A�����N���C�Z���X�l��]
			} else {
				// �f���Đ��O�Ƀt�B�[���h���f��Ȃ����߂̑Ή�
				SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				WaitFade_();
				// A�����N�Đ�t���O
				SetEventFlg_("BFG_REMATCH_RANK_A", true);
				// �t���O��߂�(��ŕύX���邱��)
				SetNumFlg_("NUM_SCENARIO_SUB_VOLCANO", GetFlagID_("CONST_SS_VC_FIND_OUT_THE_A_DOOR"));
				// �S�Ŏ����̏ꕜ�ABit�t���O��߂�
				SetEventFlg_("BFG_DEAD_KEEP_MAP", false);
				// �N���オ��Ȃ���t���O
				SetEventFlg_("BFG_BATTLE_GETUP_DISABLE", false);
				// �X�e�[�^�X��
				RecoverAll_();
				// �߂���W��A�����N���O�ɂ���
				SetReturnDemoPosDir_(Vec3(-850.0, 10.0, 0.0), -90);
				// �s�k�f��
				ChangeDemo_(509);
			}
			break;
		}
	}

	//S�����N����
	if(main_num == 8){
		switch (sky_num){
		//S�����N1���J�n
		case GetFlagID_("CONST_SS_VC_PRE_FIRST_BATTLE_S"):										//Num9 = 5
			SetNumFlg_("NUM_SCENARIO_SUB_SKY", GetFlagID_("CONST_SS_VC_JDG_FIRST_BATTLE_S"));		//Num9 = 6
			// �S�Ŏ����̏ꕜ�ABit�t���O
			SetEventFlg_("BFG_DEAD_KEEP_MAP", true);
			// �N���オ��Ȃ���t���O
			SetEventFlg_("BFG_BATTLE_GETUP_DISABLE", true);
			// �X�e�[�^�X��
			RecoverAll_();
			ChangeBattleParty_(34);
			break;
		//S�����N�P��폟����
		case GetFlagID_("CONST_SS_VC_JDG_FIRST_BATTLE_S"):										//Num9 = 6
			if(GetBattleEndType_() == BATTLE_END_TYPE_WIN){
				// �f���Đ��O�Ƀt�B�[���h���f��Ȃ����߂̑Ή�
				SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				WaitFade_();
				// �i�s�t���O��i�߂�
				SetNumFlg_("NUM_SCENARIO_SUB_SKY", GetFlagID_("CONST_SS_VC_PRE_SECOND_BATTLE_S"));	//Num9 = 7
				ChangeDemo_(620);//620[S�����N 1��폟��]
			} else {
				// �f���Đ��O�Ƀt�B�[���h���f��Ȃ����߂̑Ή�
				SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				WaitFade_();
				// S�����N�Đ�t���O
				SetEventFlg_("BFG_REMATCH_RANK_S", true);
				// �t���O��߂�(��ŕύX���邱��)
				SetNumFlg_("NUM_SCENARIO_SUB_SKY", GetFlagID_("CONST_SS_SK_FIND_OUT_THE_S_DOOR"));	//Num9 = 4
				// �S�Ŏ����̏ꕜ�ABit�t���O��߂�
				SetEventFlg_("BFG_DEAD_KEEP_MAP", false);
				// �N���オ��Ȃ���t���O
				SetEventFlg_("BFG_BATTLE_GETUP_DISABLE", false);
				// �X�e�[�^�X��
				RecoverAll_();
				// �߂���W��S�����N���O�ɂ���
				SetReturnDemoPosDir_(Vec3(0.0, 0.0, -850.0), 180);
				// �s�k�f��
				ChangeDemo_(622);
			}
			break;
		//S�����N�Q���J�n
		case GetFlagID_("CONST_SS_VC_PRE_SECOND_BATTLE_S"):										//Num9 = 7
			SetNumFlg_("NUM_SCENARIO_SUB_SKY", GetFlagID_("CONST_SS_VC_JDG_SECOND_BATTLE_S"));		//Num9 = 8
			// �S�Ŏ����̏ꕜ�ABit�t���O
			SetEventFlg_("BFG_DEAD_KEEP_MAP", true);
			// �N���オ��Ȃ���t���O
			SetEventFlg_("BFG_BATTLE_GETUP_DISABLE", true);
			ChangeBattleParty_(35);
			break;
		//S�����N�Q��폟����
		case GetFlagID_("CONST_SS_VC_JDG_SECOND_BATTLE_S"):										//Num9 = 8
			if(GetBattleEndType_() == BATTLE_END_TYPE_WIN){
				// �f���Đ��O�Ƀt�B�[���h���f��Ȃ����߂̑Ή�
				SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				WaitFade_();
				// �i�s�t���O��i�߂�
				SetNumFlg_("NUM_SCENARIO_SUB_SKY", GetFlagID_("CONST_SS_VC_PRE_THIRD_BATTLE_S"));	//Num9 = 9
				ChangeDemo_(621);//621[S�����N 2��폟��]
			} else {
				// �f���Đ��O�Ƀt�B�[���h���f��Ȃ����߂̑Ή�
				SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				WaitFade_();
				// S�����N�Đ�t���O
				SetEventFlg_("BFG_REMATCH_RANK_S", true);
				// �t���O��߂�(��ŕύX���邱��)
				SetNumFlg_("NUM_SCENARIO_SUB_SKY", GetFlagID_("CONST_SS_SK_FIND_OUT_THE_S_DOOR"));	//Num9 = 4
				// �S�Ŏ����̏ꕜ�ABit�t���O��߂�
				SetEventFlg_("BFG_DEAD_KEEP_MAP", false);
				// �N���オ��Ȃ���t���O
				SetEventFlg_("BFG_BATTLE_GETUP_DISABLE", false);
				// �X�e�[�^�X��
				RecoverAll_();
				// �߂���W��S�����N���O�ɂ���
				SetReturnDemoPosDir_(Vec3(0.0, 0.0, -850.0), 180);
				// �s�k�f��
				ChangeDemo_(622);
			}
			break;
		//S�����N�R���J�n
		case GetFlagID_("CONST_SS_VC_PRE_THIRD_BATTLE_S"):										//Num9 = 9
			SetNumFlg_("NUM_SCENARIO_SUB_SKY", GetFlagID_("CONST_SS_VC_JDG_THIRD_BATTLE_S"));		//Num9 = 10
			// �S�Ŏ����̏ꕜ�ABit�t���O
			SetEventFlg_("BFG_DEAD_KEEP_MAP", true);
			// �N���オ��Ȃ���t���O
			SetEventFlg_("BFG_BATTLE_GETUP_DISABLE", true);
			ChangeBattleParty_(36);
			break;
		//S�����N�R��폟����
		case GetFlagID_("CONST_SS_VC_JDG_THIRD_BATTLE_S"):										//Num9 = 10
			if(GetBattleEndType_() == BATTLE_END_TYPE_WIN){
				// �f���Đ��O�Ƀt�B�[���h���f��Ȃ����߂̑Ή�
				SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				WaitFade_();
				// �i�s�t���O��i�߂�
				SetNumFlg_("NUM_SCENARIO_SUB_SKY", GetFlagID_("CONST_SS_SK_GO_OUT_THE_COLOSSEUM_1"));	//Num9 = 11
				// �S�Ŏ����̏ꕜ�ABit�t���O��߂�
				SetEventFlg_("BFG_DEAD_KEEP_MAP", false);
				// �N���オ��Ȃ���t���O
				SetEventFlg_("BFG_BATTLE_GETUP_DISABLE", false);
				// S���C�h���C�Z���X�t���O
				SetEventFlg_("BFG_RIDE_LICENSE_FLIGHT", true);
				// ���̐S�����
				SetEventFlg_("BFG_TRAVEL_INFO_SHOW_011", true); // ���̐S���̍��ډ���t���O�y��{�z���󃉃C�h
				SetEventFlg_("BFG_TRAVEL_INFO_SHOW_066", true); // ���̐S���̍��ډ���t���O�y���j���[�z���C�h�����X�^�[�Q
				// �X�e�[�^�X�� �����Ή�
				RecoverAll_();
				// �߂���W��S�����N���O�ɂ���
				SetReturnDemoPosDir_(Vec3(0.0, 0.0, -850.0), 180);
				// Demo623[S�����N���C�Z���X�l���@]
				ChangeDemo_(623);
			} else {
				// �f���Đ��O�Ƀt�B�[���h���f��Ȃ����߂̑Ή�
				SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
				WaitFade_();
				// S�����N�Đ�t���O
				SetEventFlg_("BFG_REMATCH_RANK_S", true);
				// �t���O��߂�(��ŕύX���邱��)
				SetNumFlg_("NUM_SCENARIO_SUB_SKY", GetFlagID_("CONST_SS_SK_FIND_OUT_THE_S_DOOR"));	//Num9 = 4
				// �S�Ŏ����̏ꕜ�ABit�t���O��߂�
				SetEventFlg_("BFG_DEAD_KEEP_MAP", false);
				// �N���オ��Ȃ���t���O
				SetEventFlg_("BFG_BATTLE_GETUP_DISABLE", false);
				// �X�e�[�^�X��
				RecoverAll_();
				// �߂���W��S�����N���O�ɂ���
				SetReturnDemoPosDir_(Vec3(0.0, 0.0, -850.0), 180);
				// �s�k�f��
				ChangeDemo_(622);
			}
			break;
		}
	}

	EventEnd_();
}

//-------------------- �C�x���g�n�� --------------------
//�N�������F�}�b�v�ɔz�u�������b�V���ɐG�ꂽ�Ƃ�
//-------------------- �C�x���g�n�� --------------------
function TouchEventMine(){
	// �t���O���擾����
	local main_num 			= GetNumFlg_("NUM_SCENARIO_MAIN");
	local green_event_num 	= GetNumFlg_("NUM_SCENARIO_SUB_GREEN");
	local ice_event_num 	= GetNumFlg_("NUM_SCENARIO_SUB_ICE");
	local volcano_event_num = GetNumFlg_("NUM_SCENARIO_SUB_VOLCANO");
	local sky_num 			= GetNumFlg_("NUM_SCENARIO_SUB_SKY");
	local bit_freebattle	= GetEventFlg_("BFG_FREE_BATTLE_UNLOCK");		// Bit_59 �g���[�j���O�o�g���̉��
	local bit_race			= GetEventFlg_("BFG_RACE_UNLOCK");				// Bit_57 ���[�X�̉��
	// �b�����N�Đ�t���O
	local rematch_bit = false;
	rematch_bit = GetEventFlg_("BFG_REMATCH_RANK_C");
	// B�����N�Đ�t���O
	local rematch_bit_02 = false;
	rematch_bit_02 = GetEventFlg_("BFG_REMATCH_RANK_B");
	// A�����N�Đ�t���O
	local rematch_bit_03 = false;
	rematch_bit_03 = GetEventFlg_("BFG_REMATCH_RANK_A");
	// S�����N�Đ�t���O
	local rematch_bit_04 = false;
	rematch_bit_04 = GetEventFlg_("BFG_REMATCH_RANK_S");	//���Ŏg�p

	local target = GetTouchEventMineId_();
	local player = GetPlayerId_();

	// C�R���V�A���o��
	if(target == g_exit_c){
		// ��l�����o���Ɍ�����
		CommPlayerTurnAroundObj(g_monolith_c);
		//C�����N�N���A�̏�Ԃ̎��Ƀ��C�h�ݒ�`�F�b�N�����āA�ݒ肵�Ă��Ȃ��ꍇ�͋��ہB
		if(main_num == GetFlagID_("CONST_SM_GRASSLAND")
		&& green_event_num == GetFlagID_("CONST_SS_GR_GET_RIDE_SKILL_JUMP")){
			//���m���X�̌����擾���Ă��邩�ǂ����H
			if(uCheckAndUseMonolithKey(true) == false){
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_TEREZIA");
				ShowMsg_("RIDE_TUT_EVENT_002_02");
				KeyInputWait_();
				CloseMsgWnd_();
			}
			else{
				//�n���폜
				DeleteEventMine_(g_exit_c);
				// ���C�h�`���[�g���A���I���Ȃ̂ŒʐM�ƃZ�[�u���g�p�\�ɖ߂�(SQEXRedmine 2��DB #3888)
				uBanSave(false);
				// ���m���X�̍ċN���A�j�����Đ�(EventCommon)
				MonolithAnime(g_monolith_c, "BFG_DUMMY_FIELDRIDE_TUTORIAL", "obj_C_monolith", true);
				// �g���[�j���O�o�g������ׂ̈̐ݒ�
				SetEventFlg_("BFG_FREE_BATTLE_C", true);
				// �E�b�h�p�[�N��
				ChangeMapPosDir_("H01_00", Vec3(-85.0, 63.5, 0.0), 90);
			}
		}
		else{
			//�n���폜
			DeleteEventMine_(g_exit_c);
			// ���m���X�̃A�j�����Đ�(EventCommon)
			MonolithAnime(g_monolith_c, "BFG_START_C_MONOLITH", "obj_C_monolith");
			// �E�b�h�p�[�N��
			ChangeMapPosDir_("H01_00", Vec3(-85.0, 63.5, 0.0), 90);
		}
	}
	// B�R���V�A���o��
	if(target == g_exit_b){
		// ��l�����o���Ɍ�����
		CommPlayerTurnAroundObj(g_monolith_b);
		// B�����N�N���A�̏�Ԃ̎��Ƀ��C�h�ݒ�`�F�b�N�����āA�ݒ肵�Ă��Ȃ��ꍇ�͋��ہB
		local change_map_name = "I00_00";
		local change_map_pos  = Vec3(-1803.0, 877.8, -1064.2);
		local change_map_dir  = 3;
		if(GetEventFlg_("BFG_DUMMY_AQUA_RIDE_TUTORIAL") == false){
			if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")
			&& ice_event_num == GetFlagID_("CONST_SS_IF_GO_TO_THE_EAST_ICE_PARK")){
				//���m���X�̌����擾���Ă��邩�ǂ����H
				if(uCheckAndUseMonolithKey(true) == false){
					uCheckMonsterTypeAndAddFellow(main_num);
					OpenMsgWnd_();
					SetTalkName_("NAME_TAG_TEREZIA");
					ShowMsg_("RIDE_TUT_EVENT_102_02");
					KeyInputWait_();
					CloseMsgWnd_();
				}
				else{
					//�n���폜
					DeleteEventMine_(g_exit_b);
					// ���C�h�`���[�g���A���I���Ȃ̂ŒʐM�ƃZ�[�u���g�p�\�ɖ߂�(SQEXRedmine 2��DB #3888)
					uBanSave(false);
					// �g���[�j���O�o�g������ׂ̈̐ݒ�
					SetEventFlg_("BFG_FREE_BATTLE_B", true);
					// ���m���X�̃A�j�����Đ�(�[���f��[�e���W�A�̊܂�])
					uMonolithOn(g_monolith_b, "obj_B_monolith");
					SetEventFlg_("BFG_PLAYING_TEREZIA_DEMO", true);
					ChangeMapPosDir_("O01_00", Vec3(1283.0, 10.0, 0.0), 90);
				}
			}
			else{
				//�n���폜
				DeleteEventMine_(g_exit_b);
				// ���m���X�̃A�j�����Đ�
				MonolithAnime(g_monolith_b, "BFG_START_B_MONOLITH", "obj_B_monolith");
				ChangeMapPosDir_(change_map_name, change_map_pos, change_map_dir);
			}
		}
		else{
			//�n���폜
			DeleteEventMine_(g_exit_b);
			// ���m���X�̃A�j�����Đ�
			MonolithAnime(g_monolith_b, "BFG_START_B_MONOLITH", "obj_B_monolith");
			ChangeMapPosDir_(change_map_name, change_map_pos, change_map_dir);
		}
	}
	// A�R���V�A���o��
	if(target == g_exit_a){
		// ��l�����o���Ɍ�����
		CommPlayerTurnAroundObj(g_monolith_a);
		// �`�����N�̃��m���X�̃J�M�擾�C�x���g��
		if(main_num == GetFlagID_("CONST_SM_VOLCANO")
		&& volcano_event_num == GetFlagID_("CONST_SS_VC_PRE_SECRET_BASE_DEMO")){
			//���m���X�̌����擾���Ă��邩�ǂ����H
			if(uCheckAndUseMonolithKey(true) == false){
				uCheckMonsterTypeAndAddFellow(main_num);
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_TEREZIA");
				ShowMsg_("RIDE_TUT_EVENT_202_02");
				KeyInputWait_();
				CloseMsgWnd_();
			}
			else{
				// �n���폜
				DeleteEventMine_(g_exit_a);
				// ���C�h�`���[�g���A���I���Ȃ̂ŒʐM�ƃZ�[�u���g�p�\�ɖ߂�(SQEXRedmine 2��DB #3888)
				uBanSave(false);
				// �V�i���I�i�s�t���O��i�߂�
				SetNumFlg_("NUM_SCENARIO_SUB_VOLCANO", GetFlagID_("CONST_SS_VC_PRE_HELP_GIRL_DEMO"));
				// ���m���X���N��
				uMonolithOn(g_monolith_a, "obj_A_monolith");
				// �o��������b�Z�[�W
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_TEREZIA");
				ShowMsg_("RIDE_TUT_EVENT_006");
				KeyInputWait_();
				CloseMsgWnd_();
				// Demo515[�`�����N���C�Z���X�l�� �閧��n]�̍Đ�
				ChangeDemo_(515);
			}
		}
		// Demo516[�`�����N���C�Z���X�l���@�e���W�A]�̍Đ���
		else if(main_num == GetFlagID_("CONST_SM_VOLCANO")
		&& volcano_event_num == GetFlagID_("CONST_SS_HV_GO_BACK_THE_VOLCANO")){
			//�n���폜
			DeleteEventMine_(g_exit_a);
			// �g���[�j���O�o�g������ׂ̈̐ݒ�
			SetEventFlg_("BFG_FREE_BATTLE_A", true);
			// ���[���֎~������
			SetEventFlg_("BFG_PLAYERABILITY_RULER_PROHIBIT", false);
			// �V�i���I�i�s�t���O��i�߂�
			SetNumFlg_("NUM_SCENARIO_SUB_VOLCANO", GetFlagID_("CONST_SS_HV_GO_BACK_THE_VOLCANO"));
			// ��l������������
			LoadEffect_("ef732_07_teleport_monolith");	//���m���X�]���G�t�F�N�g
			PlaySE_("SE_DEM_017");						// �r�d�Đ�
			local effectId = SetSelectBoneEffect_("ef732_07_teleport_monolith", player, ATTACH_GLOBAL);
			Wait_(1);
			// ��l���̎p��i�X�Ə����Ă���
			local alpha_def = 1.0; // ���l�̐ݒ�
			SetManualCalcAlpha_(player, true);
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
			// �ŔM�̉ΎR��
			ChangeMap_("V00_00");
		}
		// ��L�̃C�x���g�ȊO�̑Ή�
		else{
			//�n���폜
			DeleteEventMine_(g_exit_a);
			// ���m���X�̃A�j�����Đ�(EventCommon)
			MonolithAnime(g_monolith_a, "BFG_START_A_MONOLITH", "obj_A_monolith");
			ChangeMapPosDir_("V00_00", Vec3(-305.0, 1292.0, -796.0), -20);
		}
	}
	// S�R���V�A���o��
	if(target == g_exit_s){
		// ��l�����o���Ɍ�����
		CommPlayerTurnAroundObj(g_monolith_s);
		// ���m���X�̃A�j�����Đ�(EventCommon)
		MonolithAnime(g_monolith_s, "BFG_START_S_MONOLITH", "obj_S_monolith");
		ChangeMapPosDir_("H02_00", Vec3(20.0, 0.0, -4.5), -50);
		// �r�����N���C�Z���X���擾���ăR���V�A������o��^�C�~���O
		if(main_num == GetFlagID_("CONST_SM_SKY")){
			if(sky_num >= GetFlagID_("CONST_SS_SK_GO_OUT_THE_COLOSSEUM_2")){			// Num9 = 99
				// �g���[�j���O�o�g������ׂ̈̐ݒ�
				SetEventFlg_("BFG_FREE_BATTLE_S", true);
			}
		}
	}

	// DEMO022[C�����N����]�I����
	if(main_num == 1 && green_event_num == GetFlagID_("CONST_SS_VC_TRY_RANK_C")){
		// �b�����N��̔��𒲂ׂ���
		if(target==g_mine_door_c){
			// ��l�����b�����N��̔��Ɍ�����
			CommPlayerTurnAroundDir(180);
			// �����펞(���if�������֐�������)
			if(rematch_bit == false){
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_TEREZIA");
				ShowMsg_("DEMO_019_AFT_TLG_001");
				KeyInputWait_();
				if(GetQueryResult_() == MES_QUERY_YES)
				{
					// ���Ԃ�2�̈ȏ�
					if(GetOwnerMonsterNum_() >= 2){
						// �b�����N�̃��C�Z���X�����J�n���b�Z�[�W
						ShowMsg_("DEMO_019_AFT_TLG_002");
						KeyInputWait_();
						ShowMsg_("DEMO_019_AFT_TLG_002_2");
						KeyInputWait_();
						CloseMsgWnd_();

						// �T�u�t���O��i�s
						SetNumFlg_("NUM_SCENARIO_SUB_GREEN", GetFlagID_("CONST_SS_VC_START_RANK_C"));

						// Demo024[�퓬���C�h�`���[�g���A����]���Đ������
						SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);
						SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, 30);
						WaitFade_();
						DebugPrint("�f��24�Đ�");
						ChangeDemo_(24);
					}
					// ���Ԃ�1�̂̎��̓����N��͊J�n����Ȃ�
					else{
						ShowMsg_("DEMO_019_AFT_TLG_WARNING_001");
						KeyInputWait_();
						CloseMsgWnd_();
					}
				}
				else
				{
					ShowMsg_("DEMO_019_AFT_TLG_003");
					KeyInputWait_();
					CloseMsgWnd_();
				}
			}
			// �Q��ڈȍ~�̍Ē���̎�
			else{
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_TEREZIA");
				ShowMsg_("DEMO_019_AFT_TLG_004");
				KeyInputWait_();
				if(GetQueryResult_() == MES_QUERY_YES)
				{
					// ���Ԃ�2�̈ȏ�
					if(GetOwnerMonsterNum_() >= 2){
						// �b�����N�̃��C�Z���X�Ď����J�n���b�Z�[�W
						ShowMsg_("DEMO_019_AFT_TLG_005");
						KeyInputWait_();
						CloseMsgWnd_();

						// �T�u�t���O��i�s
						SetNumFlg_("NUM_SCENARIO_SUB_GREEN", GetFlagID_("CONST_SS_VC_START_RANK_C"));

						// Demo024[�퓬���C�h�`���[�g���A����]���Đ������
						SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);
						SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, 30);
						WaitFade_();
						DebugPrint("�f��24�Đ�");
						ChangeDemo_(24);
					}
					// ���Ԃ�1�̂̎��̓����N��͊J�n����Ȃ�
					else{
						ShowMsg_("DEMO_019_AFT_TLG_WARNING_001");
						KeyInputWait_();
						CloseMsgWnd_();
					}
				}
				else
				{
					ShowMsg_("DEMO_019_AFT_TLG_006");
					KeyInputWait_();
					CloseMsgWnd_();
				}
			}
		}
	}
	// �b�����N���C�Z���X���i��
	if(main_num == 1 && green_event_num >= GetFlagID_("CONST_SS_VC_GET_LICENSE_RANK_C")
	|| main_num >= 2){
		// �b�����N��̔��𒲂ׂ���
		if(target==g_mine_door_c){
			// ��l�����b�����N��̔��Ɍ�����
			CommPlayerTurnAroundDir(180);
			if(main_num == GetFlagID_("CONST_SM_GRASSLAND")
			&& green_event_num == GetFlagID_("CONST_SS_GR_GET_RIDE_SKILL_JUMP")){
				if(uCheckAndUseMonolithKey() == false){
						CommonMessageT("RIDE_TUT_EVENT_002_01", "NAME_TAG_TEREZIA");
				}
				else{
					CommonMessageT("DEMO_019_AFT_TLG_009", "NAME_TAG_TEREZIA");
				}
			}
			else{
				CommonMessageT("DEMO_019_AFT_TLG_009", "NAME_TAG_TEREZIA");
				//uFreeBattleOn("BFG_FREE_BATTLE_C");
			}
		}
	}

	// B�����N�����iDemo304[B�����N����]�Đ���
	if(main_num == 4 && ice_event_num == GetFlagID_("CONST_SS_VC_TRY_RANK_B")){
		// B�����N��̔��𒲂ׂ���
		if(target==g_mine_door_b){
			// ��l�����a�����N��̔��Ɍ�����
			CommPlayerTurnAroundDir(-90);
			if(rematch_bit_02 == false){
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_TEREZIA");
				ShowMsg_("DEMO_304_AFT_TLG_001");
				KeyInputWait_();
				if(GetQueryResult_() == MES_QUERY_YES)
				{
					// B�����N�̃��C�Z���X�����J�n���b�Z�[�W
					ShowMsg_("DEMO_304_AFT_TLG_002");
					KeyInputWait_();
					CloseMsgWnd_();

					SetNumFlg_("NUM_SCENARIO_SUB_ICE", GetFlagID_("CONST_SS_VC_PRE_FIRST_BATTLE_B"));

					// Demo305[B�����N�� �J�n�O�i1���J�n�j]���Đ������
					SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);
					SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, 30);
					WaitFade_();
					ChangeDemo_(305);
				}
				else
				{
					ShowMsg_("DEMO_304_AFT_TLG_003");
					KeyInputWait_();
					CloseMsgWnd_();
				}
			}
			// �Q��ڈȍ~�̍Ē���̎�
			else{
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_TEREZIA");
				ShowMsg_("DEMO_304_AFT_TLG_004");
				KeyInputWait_();
				if(GetQueryResult_() == MES_QUERY_YES)
				{
					// B�����N�̃��C�Z���X�Ď����J�n���b�Z�[�W
					ShowMsg_("DEMO_304_AFT_TLG_005");
					KeyInputWait_();
					CloseMsgWnd_();

					SetNumFlg_("NUM_SCENARIO_SUB_ICE", GetFlagID_("CONST_SS_VC_PRE_FIRST_BATTLE_B"));

					// Demo305[B�����N�� �J�n�O�i1���J�n�j]���Đ������
					SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);
					SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, 30);
					WaitFade_();
					ChangeDemo_(305);
				}
				else
				{
					ShowMsg_("DEMO_304_AFT_TLG_006");
					KeyInputWait_();
					CloseMsgWnd_();
				}
			}
		}
	}
	// B�����N���C�Z���X���i��
	if(main_num == 4 && ice_event_num >= GetFlagID_("CONST_SS_IF_GO_TO_THE_EAST_ICE_PARK")
	|| main_num >= 5){
		// B�����N��̔��𒲂ׂ���
		if(target==g_mine_door_b){
			// ��l����B�����N��̔��Ɍ�����
			CommPlayerTurnAroundDir(-90);
			// �����N���C�Z���X�擾��ɔ��𒲂ׂ����̃��b�Z�[�W
			if(GetEventFlg_("BFG_DUMMY_AQUA_RIDE_TUTORIAL") == false){
				if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")
				&& ice_event_num == GetFlagID_("CONST_SS_IF_GO_TO_THE_EAST_ICE_PARK")){
					// �a�菊�̋󂫘g�`�F�b�N
					local residue = GetFreeMonsterNum_();
					DebugPrint("�����X�^�[�̏����g�̋󂫐��� " + residue + " �̂ł�");
					if(residue > 0){
						SetEventFlg_("BFG_CHECK_EMPTY_MONSTER", false);
					}
					else{
						SetEventFlg_("BFG_CHECK_EMPTY_MONSTER", true);
					}

					// �`���[�g���A�����C�h���s���Ƃ��ɗa�菊�ɋ󂫘g�����邩�`�F�b�N
					if(GetEventFlg_("BFG_CHECK_EMPTY_MONSTER") == false){
						if(uCheckAndUseMonolithKey() == false){
							uCheckMonsterTypeAndAddFellow(main_num);
							CommonMessageT("RIDE_TUT_EVENT_102_01", "NAME_TAG_TEREZIA");
						}
						else{
							CommonMessageT("DEMO_311_AFT_TLG_001", "NAME_TAG_TEREZIA");
						}
					}
					else{
						uCheckMonsterTypeAndAddFellow(main_num);
					}
				}
				else{
					CommonMessageT("DEMO_311_AFT_TLG_001", "NAME_TAG_TEREZIA");
					//uFreeBattleOn("BFG_FREE_BATTLE_B");
				}
			}
			else{
				CommonMessageT("DEMO_311_AFT_TLG_001", "NAME_TAG_TEREZIA");
				//uFreeBattleOn("BFG_FREE_BATTLE_B");
			}
		}
	}
	
	// A�����N�����iDemo507[A�����N����]�Đ���
	if(main_num == 6 && volcano_event_num == GetFlagID_("CONST_SS_VC_FIND_OUT_THE_A_DOOR")){
		// A�����N��̔��𒲂ׂ���
		if(target==g_mine_door_a){
			// ��l����A�����N��̔��Ɍ�����
			CommPlayerTurnAroundDir(90);
			if(rematch_bit_03 == false){
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_TEREZIA");
				ShowMsg_("DEMO_507_AFT_TLG_001");
				KeyInputWait_();
				if(GetQueryResult_() == MES_QUERY_YES)
				{
					// A�����N�̃��C�Z���X�����J�n���b�Z�[�W
					ShowMsg_("DEMO_507_AFT_TLG_002");
					KeyInputWait_();
					CloseMsgWnd_();
					SetNumFlg_("NUM_SCENARIO_SUB_VOLCANO", GetFlagID_("CONST_SS_VC_PRE_FIRST_BATTLE_A"));

					// Demo507[A�����N�� �J�n�O�i1���J�n�j]���Đ������
					SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);
					SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, 30);
					WaitFade_();
					ChangeDemo_(508);
				}
				else
				{
					ShowMsg_("DEMO_507_AFT_TLG_003");
					KeyInputWait_();
					CloseMsgWnd_();
				}
			}
			// �Q��ڈȍ~�̍Ē���̎�
			else{
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_TEREZIA");
				ShowMsg_("DEMO_507_AFT_TLG_004");
				KeyInputWait_();
				if(GetQueryResult_() == MES_QUERY_YES)
				{
					// A�����N�̃��C�Z���X�Ď����J�n���b�Z�[�W
					ShowMsg_("DEMO_507_AFT_TLG_005");
					KeyInputWait_();
					CloseMsgWnd_();
					SetNumFlg_("NUM_SCENARIO_SUB_VOLCANO", GetFlagID_("CONST_SS_VC_PRE_FIRST_BATTLE_A"));

					// Demo305[A�����N�� �J�n�O�i1���J�n�j]���Đ������
					SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);
					SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, 30);
					WaitFade_();
					ChangeDemo_(508);
				}
				else
				{
					ShowMsg_("DEMO_507_AFT_TLG_006");
					KeyInputWait_();
					CloseMsgWnd_();
				}
			}
		}
	}
	// A�����N���C�Z���X���i��
	if(main_num == 6 && volcano_event_num >= GetFlagID_("CONST_SS_VC_PRE_SECRET_BASE_DEMO")
	|| main_num >= 7){
		// A�����N��̔��𒲂ׂ���
		if(target==g_mine_door_a){
			// ��l����A�����N��̔��Ɍ�����
			CommPlayerTurnAroundDir(90);
			if(main_num == GetFlagID_("CONST_SM_VOLCANO")
			&& volcano_event_num == GetFlagID_("CONST_SS_VC_PRE_SECRET_BASE_DEMO")){
				// �󂫘g�`�F�b�N
				local residue = GetFreeMonsterNum_();
				if(residue > 0){
					SetEventFlg_("BFG_CHECK_EMPTY_MONSTER", false);
				}
				else{
					SetEventFlg_("BFG_CHECK_EMPTY_MONSTER", true);
				}

				// �`���[�g���A�����C�h���s���Ƃ��ɗa�菊�ɋ󂫘g�����邩�C�x���g
				if(GetEventFlg_("BFG_CHECK_EMPTY_MONSTER") == false){
					if(uCheckAndUseMonolithKey() == false){
						uCheckMonsterTypeAndAddFellow(main_num);
						CommonMessageT("RIDE_TUT_EVENT_202_01", "NAME_TAG_TEREZIA");
					}
					else{
						CommonMessageT("DEMO_516_AFT_TLG_001", "NAME_TAG_TEREZIA");
					}
				}
				else{
					uCheckMonsterTypeAndAddFellow(main_num);
				}
			}
			else{
				CommonMessageT("DEMO_516_AFT_TLG_001", "NAME_TAG_TEREZIA");
				//uFreeBattleOn("BFG_FREE_BATTLE_A");
			}
		}
	}

	// S�����N���� Demo618[�Ō�̃p���[]�Đ���
	if(main_num == 8 && sky_num == GetFlagID_("CONST_SS_SK_FIND_OUT_THE_S_DOOR")){						// Num9 = 4
		// S�����N��̔��𒲂ׂ���
		if(target==g_mine_door_s){
			// ��l����S�����N��̔��Ɍ�����
			CommPlayerTurnAroundDir(0);
			if(rematch_bit_04 == false){
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_TEREZIA");
				ShowMsg_("DEMO_619_AFT_TLG_001");
				KeyInputWait_();
				if(GetQueryResult_() == MES_QUERY_YES)
				{
					// S�����N�̃��C�Z���X�����J�n���b�Z�[�W
					ShowMsg_("DEMO_619_AFT_TLG_002");
					KeyInputWait_();
					CloseMsgWnd_();
					SetNumFlg_("NUM_SCENARIO_SUB_SKY", GetFlagID_("CONST_SS_VC_PRE_FIRST_BATTLE_S"));	// Num9 = 5

					// Demo619[S�����N�퓬�O�i1���J�n�j]���Đ������
					SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);
					SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, 30);
					WaitFade_();
					ChangeDemo_(619);
				}
				else
				{
					ShowMsg_("DEMO_619_AFT_TLG_003");
					KeyInputWait_();
					CloseMsgWnd_();
				}
			}
			// �Q��ڈȍ~�̍Ē���̎�
			else{
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_TEREZIA");
				ShowMsg_("DEMO_619_AFT_TLG_004");
				KeyInputWait_();
				if(GetQueryResult_() == MES_QUERY_YES)
				{
					// S�����N�̃��C�Z���X�Ď����J�n���b�Z�[�W
					ShowMsg_("DEMO_619_AFT_TLG_005");
					KeyInputWait_();
					CloseMsgWnd_();
					SetNumFlg_("NUM_SCENARIO_SUB_SKY", GetFlagID_("CONST_SS_VC_PRE_FIRST_BATTLE_S"));	// Num9 = 5

					// Demo619[S�����N�퓬�O�i1���J�n�j]���Đ������
					SetFade_(FADE_OUT, FADE_COLOR_BLACK, 30);
					SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, 30);
					WaitFade_();
					ChangeDemo_(619);
				}
				else
				{
					ShowMsg_("DEMO_619_AFT_TLG_006");
					KeyInputWait_();
					CloseMsgWnd_();
				}
			}
		}
	}
	// S�����N���C�Z���X���i��
	if(main_num == 8 && sky_num >= GetFlagID_("CONST_SS_SK_GO_OUT_THE_COLOSSEUM_1")		// Num9 = 11
	|| main_num >= 9){																	// Num0 = 9 �ȏ�
		// S�����N��̔��𒲂ׂ���
		if(target==g_mine_door_s){
			// ��l����S�����N��̔��Ɍ�����
			CommPlayerTurnAroundDir(0);
			CommonMessageT("DEMO_623_AFT_TLG_001", "NAME_TAG_TEREZIA");
			//uFreeBattleOn("BFG_FREE_BATTLE_S");
		}
	}

	// ���m���X�̂���(��)
	if(target == mine_key){
		CommPlayerTurnAroundObj(reactorPoint09);
		uGetMonolithKeyEvent(mine_key, reactorPoint09, g_key, exclamation02);
		SetEventFlg_("BFG_GET_C_RANK_MONOLITH_KEY", true);
	}
	if(target == mine_key_b){
		CommPlayerTurnAroundObj(reactorPoint10);
		uGetMonolithKeyEvent(mine_key_b, reactorPoint10, g_key_b, exclamation04);
		SetEventFlg_("BFG_GET_B_RANK_MONOLITH_KEY", true);
	}
	if(target == mine_key_a){
		CommPlayerTurnAroundObj(reactorPoint11);
		uGetMonolithKeyEvent(mine_key_a, reactorPoint11, g_key_a, exclamation06);
		SetEventFlg_("BFG_GET_A_RANK_MONOLITH_KEY", true);
	}

	EventEnd_();
}

//--------------------------------------------------
//		�m�o�b�ڐG���钼�O( TouchNpc()�̒��O�ɋN�� )
//--------------------------------------------------
function BeforeTalkNpc()
{
	local target = GetTargetId_();
	
	// ���C�h���Ƀ��i�[�e�ɘb�����������͎��_�̃I�t�Z�b�g�l��Y���݂̂�ύX����
	// �y���Y�^�z�unpc_info.nut�v�Ŏ��_�ƒ����_�̃I�t�Z�b�g�l�����_�̒������Ă��܂��B
	//            �Ȃ̂ŁA�R�R�ōs�����_�̃I�t�Z�b�g�l�ύX�́unpc_info.nut�v�Ō��_���������l����
	//            ����ɒ������邱�ƂɂȂ�̂ŕύX���鎞�͗v���ӁB
	if(target == g_npc_renate){
		SetRideTalkCamOffset(OFFSET_RENATE);
	}

	EventEnd_();
}

//------------------------------------------------
//		�m�o�b�ڐG��
//------------------------------------------------
function TouchNpc()
{
	local main_num 			= GetNumFlg_("NUM_SCENARIO_MAIN");
	local sky_num 			= GetNumFlg_("NUM_SCENARIO_SUB_SKY");
	
	local target = GetTargetId_();
	
	DebugPrint(" ");
	DebugPrint("ID: " + target + " �ɐڐG [TouchNpc]");
	
	switch (target) {
	case g_npc_renate :
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_RENERTE");
			ShowMsg_("DEMO_619_AFT_RENERTE_001");		// �u�i���jS�����N���@�N���A�ł����
			KeyInputWait_();
			CloseMsgWnd_();
		break;
	default :
		DebugPrint("WARNING : NPC_ID���s���ł� [TouchNpc]");
		break;
	}
	
	
	EventEnd_();
}

//-------------------- ������ --------------------
// �N�������F�����X�^�[���C�h��
// (�����X�^�[���C�h���ɍs���ׂ̃C�x���g�u���b�N)
//-------------------- ������ --------------------
function RideOn()
{
// ���C���V�i���I�p�̃t���O-----------------------------------------
	// �t���O���擾����
	local main_num 			= GetNumFlg_("NUM_SCENARIO_MAIN");
	local green_event_num 	= GetNumFlg_("NUM_SCENARIO_SUB_GREEN");
	local ice_event_num 	= GetNumFlg_("NUM_SCENARIO_SUB_ICE");
	local volcano_event_num = GetNumFlg_("NUM_SCENARIO_SUB_VOLCANO");

	// ���C�h���̃����X�^�[�^�C�v���擾
	local ride_type = GetRideMonsterType_();

	// C�����N�����N���A��
	if(main_num == GetFlagID_("CONST_SM_GRASSLAND")
	&& green_event_num == GetFlagID_("CONST_SS_GR_GET_RIDE_SKILL_JUMP")){
		uAfterRideTutorialMessage();
	}
	// B�����N�����N���A��
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")
	&& ice_event_num == GetFlagID_("CONST_SS_IF_GO_TO_THE_EAST_ICE_PARK")){
		if(GetEventFlg_("BFG_DUMMY_AQUA_RIDE_TUTORIAL") == false){
			if(ride_type == MONSTER_TYPE.AQUA){
				uAfterRideTutorialMessage();
			}
		}
	}
	// A�����N�����N���A��
	if(main_num == GetFlagID_("CONST_SM_VOLCANO")
	&& volcano_event_num == GetFlagID_("CONST_SS_VC_PRE_SECRET_BASE_DEMO")){
		if(ride_type == MONSTER_TYPE.AERO){
			uAfterRideTutorialMessage();
		}
	}

	EventEnd_();
}

//++++++++++++++++++++++++++++++++++++++++++++
//  ���b�Z�[�W�̕\���֐�(���O�\���Ȃ�)
//--------------------------------------------
// ������ : �\�����郁�b�Z�[�W
// �߂�l   : �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++
function CommonMessage(message_key)
{
	OpenMsgWnd_();
	ShowMsg_(message_key);
	KeyInputWait_();
	CloseMsgWnd_();
}

//++++++++++++++++++++++++++++++++++++++++++++
//  ���b�Z�[�W�̕\���֐�(���O�\������)
//--------------------------------------------
// ������ : �\�����郁�b�Z�[�W
// ������ : ���O�^�O
// �߂�l   : �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++
function CommonMessageT(message_key, name_tag)
{
	OpenMsgWnd_();
	SetTalkName_(name_tag);
	ShowMsg_(message_key);
	KeyInputWait_();
	CloseMsgWnd_();
}

//++++++++++++++++++++++++++++++++++++++++++++
//  �A�C�e���擾 ���m���X�̂���(��)
//--------------------------------------------
// ����   : �A�C�e���n���A���A�N�^�[�|�C���g, �z�u�����G�t�F�N�g�ANaviMapIcon��ID
// �߂�l : �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++
function uGetMonolithKeyEvent(mine_id, r_point, ef_key, icon_id)
{
	OpenMsgWnd_();
	ShowMsg_("RIDE_TUT_EVENT_003");
	PlayMe_("ME_010");	// �d�v�A�C�e������ME
	WaitMe_();
	KeyInputWait_();
	CloseMsgWnd_();

	AddItem_(99, 1);	// �A�C�e���擾 ���m���X�̂���(��)

	// �A�C�e���n���A���A�N�^�[�|�C���g, �z�u�����G�t�F�N�g�̍폜
	DeleteEventMine_(mine_id);
	SetActive_(r_point, false);
	DeleteEffect_(ef_key);
	SetNaviMapIconVisible_(icon_id, false);

	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TEREZIA");
	ShowMsg_("RIDE_TUT_EVENT_003_02");
	KeyInputWait_();
	CloseMsgWnd_();
}

//++++++++++++++++++++++++++++++++++++++++++++
//  ���C�Z���X�擾��̃��b�Z�[�W
//--------------------------------------------
// ����   : �폜����n���A���A�N�^�[�|�C���g, �z�u�����G�t�F�N�g
// �߂�l : �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++
function uReturnVCMessage()
{
	local main_num = GetNumFlg_("NUM_SCENARIO_MAIN");

	Wait_(15);
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TEREZIA");
	switch(main_num)
	{
	// �����C�h
	case GetFlagID_("CONST_SM_GRASSLAND"):
		ShowMsg_("RIDE_TUT_EVENT_001");
		break;
	// �����C�h
	case GetFlagID_("CONST_SM_ICE_FIELD"):
		ShowMsg_("RIDE_TUT_EVENT_101");
		break;
	// �󃉃C�h
	case GetFlagID_("CONST_SM_VOLCANO"):
		ShowMsg_("RIDE_TUT_EVENT_201");
		break;
	default:
		DebugPrint("�Ή����� main_num �͂���܂���");
		break;
	}
	KeyInputWait_();
	CloseMsgWnd_();
}

//++++++++++++++++++++++++++++++++++++++++++++
//  ���m���X�̂���(��)���擾���Ă��邩�`�F�b�N
//--------------------------------------------
// ����   : true -> ���������炷�Afalse -> ���������炳�Ȃ�
// �߂�l : �A�C�e�����遨true�A�A�C�e���Ȃ���false
//++++++++++++++++++++++++++++++++++++++++++++
function uCheckAndUseMonolithKey(flg = false)
{
	local get_num = GetItemNum_(99);

	if(get_num >= 1){
		if(flg == true){
			AddItem_(99, -1);
		}
		return true;
	}
	else{
		return false;
	}
}

//++++++++++++++++++++++++++++++++++++++++++++
// �����N��I����ɕ\�����郁�b�Z�[�W
//--------------------------------------------
// ����   : �Ȃ�
// �߂�l : �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++
function uRideTutorialMessage()
{
	local main_num = GetNumFlg_("NUM_SCENARIO_MAIN");
	local aqua = IsRideTypeMonster_(MONSTER_TYPE.AQUA);
	local aero = IsRideTypeMonster_(MONSTER_TYPE.AERO);

	// �����N��I����ɕ\�����郁�b�Z�[�W
	if(GetEventFlg_("BFG_DISPLAY_RIDE_TUTORIAL_MESSAGE") == true){
		SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
		WaitFadeSub_();
		// ���C�h�̃`���[�g���A�����b�Z�[�W��\������
		uReturnVCMessage();
		// �`�����N�E�a�����N�ł̂ݎg�p
		uCheckMonsterTypeAndAddFellow(main_num);
		
		// uCheckMonsterTypeAndAddFellow()��ʂ�O�ɑΉ����郂���X�^�[�������
		// �Ó]����������ǉ�(�a�菊�������ς��̎��͒ʂ�Ȃ�)
		if(main_num == GetFlagID_("CONST_SM_GRASSLAND")){
			uNotFellowCaseFade();
		}
		else if(aqua == true && main_num == GetFlagID_("CONST_SM_ICE_FIELD")){
			uNotFellowCaseFade();
		}
		else if(aero == true && main_num == GetFlagID_("CONST_SM_VOLCANO")){
			uNotFellowCaseFade();
		}
		// �Ăѕ\������Ȃ��悤�Ƀt���O��߂�
		SetEventFlg_("BFG_DISPLAY_RIDE_TUTORIAL_MESSAGE", false);
	}
}

//++++++++++++++++++++++++++++++++++++++++++++
// ���C�h������\�����郁�b�Z�[�W
//--------------------------------------------
// ����   : �Ȃ�
// �߂�l : �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++
function uAfterRideTutorialMessage()
{
	local main_num = GetNumFlg_("NUM_SCENARIO_MAIN");

	if(GetEventFlg_("BFG_DISPLAY_AFTER_RIDE_TUTORIAL_MSG") == true){
		// ���C�h���Ƀ��b�Z�[�W���\������Ȃ��悤�ɂ���
		Wait_(15);
		// ���C�h��̃`���[�g���A�����b�Z�[�W��\������
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_TEREZIA");
		switch(main_num)
		{
		// �����C�h
		case GetFlagID_("CONST_SM_GRASSLAND"):
			ShowMsg_("RIDE_TUT_EVENT_001_02");
			break;
		// �����C�h
		case GetFlagID_("CONST_SM_ICE_FIELD"):
			ShowMsg_("RIDE_TUT_EVENT_101_03");
			break;
		// �󃉃C�h
		case GetFlagID_("CONST_SM_VOLCANO"):
			ShowMsg_("RIDE_TUT_EVENT_201_03");
			break;
		default:
			break;
		}
		KeyInputWait_();
		CloseMsgWnd_();
		SetEventFlg_("BFG_DISPLAY_AFTER_RIDE_TUTORIAL_MSG", false);
	}
}

//++++++++++++++++++++++++++++++++++++++++++++
// �C���M�����[���삵�đΉ����郉�C�h�����X�^�[�����Ȃ��Ȃ������̃��b�Z�[�W�\��
//--------------------------------------------
// ����   : �Ȃ�
// �߂�l : �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++
function uRideTutorialErrorMessage()
{
	local main_num = GetNumFlg_("NUM_SCENARIO_MAIN");

	// ���C�h���Ƀ��b�Z�[�W���\������Ȃ��悤�ɂ���
	Wait_(15);
	// �Ή����郉�C�h�����X�^�[�����Ȃ��Ȃ������̃��b�Z�[�W�\������
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TEREZIA");
	switch(main_num)
	{
	// �����C�h
	case GetFlagID_("CONST_SM_GRASSLAND"):
		ShowMsg_("NOT_EMPTY_MSG_002");
		break;
	// �����C�h
	case GetFlagID_("CONST_SM_ICE_FIELD"):
		ShowMsg_("NOT_EMPTY_MSG_002");
		break;
	// �󃉃C�h
	case GetFlagID_("CONST_SM_VOLCANO"):
		ShowMsg_("NOT_EMPTY_MSG_002");
		break;
	default:
		break;
	}
	KeyInputWait_();
	CloseMsgWnd_();
}

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++
// �������Ă���S�����X�^�[����w�肵�������X�^�[�^�C�v��
// ���Ԃ����邩���`�F�b�N���Ă��Ȃ���Ή���������֐�
//-------------------------------------------------------
// ����   : ���C���̃V�i���I�t���O�̐i�s��Ԃ��i�[�����ϐ�
// �߂�l : �Ȃ�
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++
function uCheckMonsterTypeAndAddFellow(main_num)
{
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")
	|| main_num == GetFlagID_("CONST_SM_VOLCANO")){
		// �Ή�����^�C�v�̃����X�^�[������̂��`�F�b�N(Redmine#1154)
		local residue = GetFreeMonsterNum_();
		local aqua = IsRideTypeMonster_(MONSTER_TYPE.AQUA);
		local aero = IsRideTypeMonster_(MONSTER_TYPE.AERO);
		DebugPrint("�����X�^�[�̏����g�̋󂫐��� " + residue + " �̂ł�");

		// �a�����N
		if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){
			// �����^�C�v�����Ȃ��Ƃ�
			if(aqua == false){
				// �����X�^�[�����̋󂫘g���`�F�b�N
				if(residue <= 0){
					// �ϐ��̏���
					local fo_speed = 15;
					local fi_speed = 25;
					local task_fellow;
					// �Ó]
					SetFadePlane_(FADE_PLANE.PLANE_3D);
					SetFade_(FADE_OUT, FADE_COLOR_BLACK, fo_speed);
					SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, fo_speed);
					WaitFade_();
					Wait_(10);
					// �Ó]����
					SetFade_(FADE_IN, FADE_COLOR_BLACK, fi_speed);
					SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, fi_speed);
					SetFadePlane_(FADE_PLANE.PLANE_NORMAL);
					Wait_(30);
					// �󂫘g�����悤�������b�Z�[�W��\��
					OpenMsgWnd_();
					SetTalkName_("NAME_TAG_TEREZIA");
					ShowMsg_("RIDE_TUT_EVENT_101_01");
					KeyInputWait_();
					CloseMsgWnd_();
					Wait_(5);
					OpenMsgWnd_();
					SetTalkName_("NAME_TAG_TEREZIA");
					ShowMsg_("NOT_EMPTY_MSG_001");
					KeyInputWait_();
					CloseMsgWnd_();
					// �a�菊���Ăяo��
					GotoMenuFadeOpen(MENU_OPEN.LUGGAGE_OFFICE);
					// �ă`�F�b�N
					residue = GetFreeMonsterNum_();
					if(residue <= 0){
						while(true){
							// �ꔏ�̊�
							Wait_(15);
							// �󂫘g�����悤�������b�Z�[�W��\��
							OpenMsgWnd_();
							SetTalkName_("NAME_TAG_TEREZIA");
							ShowMsg_("NOT_EMPTY_MSG_001");
							KeyInputWait_();
							CloseMsgWnd_();
							// �a�菊���Ăяo��
							GotoMenuFadeOpen(MENU_OPEN.LUGGAGE_OFFICE);
							// �āX�`�F�b�N
							residue = GetFreeMonsterNum_();
							if(residue > 0){
								// �P�̂ł��󂫂��o�����甲����
								break;
							}
						}
					}
					// �ꔏ�̊�
					Wait_(15);
					// ���ԉ������b�Z�[�W��\��
					OpenMsgWnd_();
					SetTalkName_("NAME_NONE");
					ShowMsg_("RIDE_TUT_EVENT_101_02");
					Wait_(15);
					// ����ME(�d�v�A�C�e���擾�Ɠ���Redmine#2831)
					PlayMe_("ME_010");
					WaitMe_();
					KeyInputWait_();
					CloseMsgWnd_();
					// �C���J���傤����(Redmine#1137)
					task_fellow = Task_AddFellow_(1601, false);
					WaitTask(task_fellow);
					// ����ʂ̈Ó]�𖾂���
					SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, 30);
					WaitFadeSub_();
				}
				else{
					// �ϐ��̏���
					local task_fellow;
					// �Ó]�{�Ó]����
					uFadeOutAndFadeIn();
					// ���b�Z�[�W��\��
					OpenMsgWnd_();
					SetTalkName_("NAME_TAG_TEREZIA");
					ShowMsg_("RIDE_TUT_EVENT_101_01");
					KeyInputWait_();
					CloseMsgWnd_();
					// ���ԉ������b�Z�[�W��\��
					OpenMsgWnd_();
					SetTalkName_("NAME_NONE");
					ShowMsg_("RIDE_TUT_EVENT_101_02");
					Wait_(15);
					// ����ME(�d�v�A�C�e���擾�Ɠ���Redmine#2831)
					PlayMe_("ME_010");
					WaitMe_();
					KeyInputWait_();
					CloseMsgWnd_();
					// �C���J���傤����(Redmine#1137)
					task_fellow = Task_AddFellow_(1601, false);
					WaitTask(task_fellow);
					// ���ʂ̈Ó]�𖾂���
					SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);
					SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, 30);
					WaitFadeSub_();
					// �t�F�[�h��Ԃ����ɖ߂���uFadeOutAndFadeIn()�ŕύX
					SetFadePlane_(FADE_PLANE.PLANE_NORMAL);
				}
			}
		}
		// �`�����N
		else if(main_num == GetFlagID_("CONST_SM_VOLCANO")){
			// ���^�C�v�����Ȃ��Ƃ�
			if(aero == false){
				// �����X�^�[�����̋󂫘g���`�F�b�N
				if(residue <= 0){
					local fo_speed = 15;
					local fi_speed = 25;
					local task_fellow;
					// �Ó]
					SetFadePlane_(FADE_PLANE.PLANE_3D);
					SetFade_(FADE_OUT, FADE_COLOR_BLACK, fo_speed);
					SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, fo_speed);
					WaitFade_();
					Wait_(10);
					// �Ó]����
					SetFade_(FADE_IN, FADE_COLOR_BLACK, fi_speed);
					SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, fi_speed);
					SetFadePlane_(FADE_PLANE.PLANE_NORMAL);
					Wait_(30);
					// �󂫘g�����悤�������b�Z�[�W��\��
					OpenMsgWnd_();
					SetTalkName_("NAME_TAG_TEREZIA");
					ShowMsg_("RIDE_TUT_EVENT_201_01");
					KeyInputWait_();
					CloseMsgWnd_();
					Wait_(5);
					OpenMsgWnd_();
					SetTalkName_("NAME_TAG_TEREZIA");
					ShowMsg_("NOT_EMPTY_MSG_001");
					KeyInputWait_();
					CloseMsgWnd_();
					// �a�菊���Ăяo��
					GotoMenuFadeOpen(MENU_OPEN.LUGGAGE_OFFICE);
					// �ă`�F�b�N
					residue = GetFreeMonsterNum_();
					if(residue <= 0){
						while(true){
							// �ꔏ�̊�
							Wait_(15);
							// �󂫘g�����悤�������b�Z�[�W��\��
							OpenMsgWnd_();
							SetTalkName_("NAME_TAG_TEREZIA");
							ShowMsg_("NOT_EMPTY_MSG_001");
							KeyInputWait_();
							CloseMsgWnd_();
							// �a�菊���Ăяo��
							GotoMenuFadeOpen(MENU_OPEN.LUGGAGE_OFFICE);
							// �āX�`�F�b�N
							residue = GetFreeMonsterNum_();
							if(residue > 0){
								// �P�̂ł��󂫂��o�����甲����
								break;
							}
						}
					}
					// �ꔏ�̊�
					Wait_(15);
					// ���ԉ������b�Z�[�W��\��
					OpenMsgWnd_();
					SetTalkName_("NAME_NONE");
					ShowMsg_("RIDE_TUT_EVENT_201_02");
					Wait_(15);
					// ����ME(�d�v�A�C�e���擾�Ɠ���Redmine#2831)
					PlayMe_("ME_010");
					WaitMe_();
					KeyInputWait_();
					CloseMsgWnd_();
					// �X�^�[�L����(Redmine#1137)
					task_fellow = Task_AddFellow_(1602, false);
					WaitTask(task_fellow);
					// ����ʂ̈Ó]�𖾂���
					SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, 30);
					WaitFadeSub_();
				}
				else{
					// �ϐ��̏���
					local task_fellow;
					// �Ó]�{�Ó]����
					uFadeOutAndFadeIn();
					// ���b�Z�[�W��\��
					OpenMsgWnd_();
					SetTalkName_("NAME_TAG_TEREZIA");
					ShowMsg_("RIDE_TUT_EVENT_201_01");
					KeyInputWait_();
					CloseMsgWnd_();
					// ���ԉ������b�Z�[�W��\��
					OpenMsgWnd_();
					SetTalkName_("NAME_NONE");
					ShowMsg_("RIDE_TUT_EVENT_201_02");
					Wait_(15);
					// ����ME(�d�v�A�C�e���擾�Ɠ���Redmine#2831)
					PlayMe_("ME_010");
					WaitMe_();
					KeyInputWait_();
					CloseMsgWnd_();
					// �X�^�[�L����(Redmine#1137)
					task_fellow = Task_AddFellow_(1602, false);
					WaitTask(task_fellow);
					// ���ʂ̈Ó]�𖾂���
					SetFade_(FADE_IN, FADE_COLOR_BLACK, 30);
					SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, 30);
					WaitFadeSub_();
					// �t�F�[�h��Ԃ����ɖ߂���uFadeOutAndFadeIn()�ŕύX
					SetFadePlane_(FADE_PLANE.PLANE_NORMAL);
				}
			}
		}
	}
}

//++++++++++++++++++++++++++++++++++++++++++++
// �[���f��:�������C�h�N���A�f��
//--------------------------------------------
// ����   : �Ȃ�
// �߂�l : �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++
function uAquaRideTutorialClearDemo()
{
	local player = GetPlayerId_();
	// ���l�̐ݒ�
	local alpha_def = 1.0;
	// ���l��ύX����O�͕K�����̖��߂��L��
	SetManualCalcAlpha_(player, true);

	// �Ó]
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();

	// ��l�������ߏ�ԂɂȂ�Ȃ��悤�Đݒ�(2��DB #4329)
	SetAlpha_(player, 1.0); // ��l�����J���������ȂǂŔC�ӂœ��߂������ꍇ�A���̋[���f���œ��߂��ێ�����Ȃ��悤�ɂ���

	// ��l���̏���
	Wait_(15);
	local p_pos  = Vec3(1283.0, 10.0, 0.0);
	local p_dir  = 90;
	SetPos_(player, p_pos);
	SetDir_(player, p_dir);
	SetPlayableCamera_();
	SetCameraDir_(p_dir);
	// �Ó]����
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();

	// ���b�Z�[�W
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TEREZIA");
	ShowMsg_("DEMO_MSG_100");
	KeyInputWait_();
	CloseMsgWnd_();
	Wait_(15);
	LoadEffect_("EF712_10_EMO_SURPRISE01");
	local id = SetSelectBoneEffect_("ef712_10_emo_surprise01", player, ATTACH_EFFECT1);		// �u�I�v
	PlaySE_("SE_DEM_053");
	SetEffectScale_(id, 1.0);
	Wait_(15);
	CommPlayerTurnAroundDir(270);
	Wait_(30);
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_TEREZIA");
	ShowMsg_("DEMO_MSG_101");
	KeyInputWait_();
	CloseMsgWnd_();
	Wait_(30);
	CommPlayerTurnAroundDir(p_dir);
	Wait_(30);

	// ��l���Ƀe���|�[�g�G�t�F�N�g������
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
	// �Ó]
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
	// �o�[�`�����R���V�A���̃J�M�擾��������t���O
	SetEventFlg_("BFG_DUMMY_AQUA_RIDE_TUTORIAL", true);
	// ��l���̃��l�����ɖ߂�
	SetAlpha_(player, 1.0);
	// ���l���X�N���v�g�Őݒ�ł��Ȃ��悤�ɖ߂��Ă���(2��DB #4329)
	SetManualCalcAlpha_(player, false);
}

//++++++++++++++++++++++++++++++++++++++++++++
// ���m���X�N���G�t�F�N�g
//--------------------------------------------
// ����   : �Ȃ�
// �߂�l : �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++
function uMonolithOn(monolith, node)
{
	// ���m���X�̋N���A�j�����Đ�
	PlaySE_("SE_FLD_101");
	SetMotion_(monolith, MOT_GIMMICK_1, BLEND_N);
	// ���m���X�̋N���G�t�F�N�g
	LoadEffect_("ef732_12_monolith_on");
	SetPointWorldEffect_("ef732_12_monolith_on", node);
	Wait_(30);
	// ���m���X�̋N����ҋ@�A�j�����Đ�
	SetMotion_(monolith, MOT_GIMMICK_2, BLEND_N);
	// �Ԃ���������
	Wait_(40);
}

//++++++++++++++++++++++++++++++++++++++++++++
// �����N�N���A��ɔ��𒲂ׂ�ƃR���V�A�����j���[���Ăяo��
//--------------------------------------------
// ����   : �����N�̔��̃g���[�j���O�o�g������t���O
// �߂�l : �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++
function uFreeBattleOn(flg)
{
	// �ǂ��̔�������
	local rank_flg_id = false;
	local ok_flg = false;
	if(GetEventFlg_(flg) == true){
		ok_flg = true;
	}

	// Redmine#3001�̍��m�F�̖��߂�ǉ�
	local trophy_id = 2;
	if(CheckTrophy_(trophy_id)){
		// �Ԃ���������
		Wait_(15);
		// ���񃁃b�Z�[�W�̔���
		if(GetEventFlg_("BFG_FREE_BATTLE_TUTORIAL_MSG") == false){
			// ���b�Z�[�W�\��
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_TEREZIA");
			ShowMsg_("FREE_BATTLE_MSG_000");
			KeyInputWait_();
			// �g���[�j���O�o�g������̏��񃁃b�Z�[�W�\���t���O
			SetEventFlg_("BFG_FREE_BATTLE_TUTORIAL_MSG", true);
			// �R���V�A�����j���[�̌Ăяo��
			GotoMenuScene_(MENU_SCENE.VIRTUALCOLOSSEUM);
		}
		// �ʏ�
		else{
			if(ok_flg == true){
				if(GetEventFlg_("BFG_FREE_BATTLE_UNLOCK") == true){
					// ���b�Z�[�W�\��
					OpenMsgWnd_();
					SetTalkName_("NAME_TAG_TEREZIA");
					ShowMsg_("FREE_BATTLE_MSG_001_Q");
					KeyInputWait_();
					if(GetQueryResult_() == QUERY2_0){
						CloseMsgWnd_();
						// �R���V�A�����j���[�̌Ăяo��
						GotoMenuScene_(MENU_SCENE.VIRTUALCOLOSSEUM);
					}
					else{
						ShowMsg_("FREE_BATTLE_MSG_001_N");
						CloseMsgWnd_();
					}
				}
			}
		}
	}
}

//++++++++++++++++++++++++++++++++++++++++++++++
// ���ԉ����O�̈Ó]�ƈÓ]��������( 2��DB #2824 )
//----------------------------------------------
// ����   : �Ȃ�
// �߂�l : �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++
function uFadeOutAndFadeIn()
{
	local fo_speed = 15; // �Ó]�X�s�[�h
	local fi_speed = 30; // �Ó]�����X�s�[�h
	
	// �Ó] < ���ԉ������͏��ʂ͈Ó](�������A�e���W�A�̃��b�Z�[�W�͕\�������)����������w�� >
	SetFadePlane_(FADE_PLANE.PLANE_3D);
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, fo_speed);
	SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, fo_speed);
	WaitFade_();
	// �Ԃ���������
	Wait_(30);
	SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
	WaitFadeSub_();
	// �Ԃ���������
	Wait_(15);
}

//++++++++++++++++++++++++++++++++++++++++++++++
// ���ԉ��������Ɉڍs���Ȃ��ꍇ�̈Ó]�����ď�ʂ�؂�ւ��鏈��( 2��DB #2824 )
//----------------------------------------------
// ����   : �Ȃ�
// �߂�l : �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++
function uNotFellowCaseFade()
{
	local fo_speed = 30; // �Ó]�X�s�[�h
	local fi_speed = 30; // �Ó]�����X�s�[�h
	
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, fo_speed);
	WaitFade_();
	SetFade_(FADE_IN, FADE_COLOR_BLACK, fi_speed);
	SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, fi_speed);
	WaitFade_();
	// �Ԃ���������
	Wait_(15);
}

//++++++++++++++++++++++++++++++++++++++++++++++
// �Z�[�u�֎~
//----------------------------------------------
// ����   : flg		�Z�[�u�֎~�ɂ��邩�ǂ���
// �߂�l : �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++
function uBanSave(flg)
{
	SetEventFlg_("BFG_SAVE_PROHIBIT", flg);				// Bit_451
	SetEventFlg_("BFG_LIBRARY_PROHIBIT", flg);			// Bit_455
	SetEventFlg_("BFG_COMMUNICATION_PROHIBIT", flg);	// Bit_460
}
