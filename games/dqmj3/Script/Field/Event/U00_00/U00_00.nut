//===================== ���_�y�|�C���g�[��(U00_00)�z ====================

// ���萔��`
const DEMO_NONE		 = 0;
const DEMO_YATIHOKO	 = 1;
const DEMO_WADATUMI	 = 2;
const DEMO_HOAKARI	 = 3;

//------------------------------------------------
//		�퓬�I����
//------------------------------------------------
function AfterBattle()
{
	EventEnd_();
}

//------------------------------------------------
//		�}�b�v�ɓ���O
//------------------------------------------------
function BeforeInitMap()
{
	// ���C��̃X�^�[�s�[�X�̑g�ݍ��݃f��(Demo819�`821)�̌�ɘA�����ăf���𗬂����ߗp�̃t���O
	if(GetEventFlg_("BFG_CONTINUED_STAR_PIECE_DEMO") == true){
		//���C�h��������
		SetRideOffStart_();
	}
	
	// ���Z�Δ�̋[���f���Đ��O�Ƀ��C�h����������
	if(GetEventFlg_("BFG_RIDE_OFF_FLAG_BEFORE_STELE") == true){
		//���C�h��������
		SetRideOffStart_();
	}
	
	EventEnd_();
}

//------------------------------------------------
//		�t�F�[�h�C��
//------------------------------------------------
function FadeIn()
{
	// �i�s�t���O�̏�Ԃ��擾
	local main_num    = GetNumFlg_("NUM_SCENARIO_MAIN");
	local outside_num = GetNumFlg_("NUM_SCENARIO_SUB_INSIDE_CLEAR");
	DebugPrint(" ");
	DebugPrint("NUM_SCENARIO_MAIN �̒l�� " + main_num + " �ɂȂ�܂����B");
	//DebugPrint("NUM_SCENARIO_SUB_OP �̒l�� " + event_num + " �ɂȂ�܂����B");

	//---------------
	// ���t���O�ݒ�
	//---------------
	SetEventFlg_("BFG_ARRIVE_AT_U00", true);		// Bit101 : ���B�t���O �|�C���g�[��
	SetEventFlg_("BFG_RULER_ADD_027", true);		// Bit227 : ���[���ǉ��t���O �|�C���g�[��
	
	// demo801[���L���Ƃ̍ĉ�]�Đ���Ƀ|�C���g�[���ɓ��B������
	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){ 				// NUM000 = 9
		if(outside_num == GetFlagID_("CONST_SS_OS_GO_POINT_ZERO")){		// NUM010 = 2
			SetEventFlg_("BFG_DEMO801_AFTER_U00_00", true);				// Bit1386
		}
	}

	//---------------
	// ���M�~�b�N�z�u
	//---------------
	// ID������
	g_door_red      <- C_NONE_ID;
	g_door_green    <- C_NONE_ID;
	g_door_blue     <- C_NONE_ID;
	g_room_door_01  <- C_NONE_ID;
	g_room_door_02  <- C_NONE_ID;

	// ���E�o�|�b�h
	if(main_num <= GetFlagID_("CONST_SM_INSIDE_CLEAR")){				// NUM000 <= 9
		local escape_pod_id = ReadGimmick_("o_U00_02");
		local g_escape_pod_01 = ArrangePointGimmick_("o_U00_02", escape_pod_id, "g_escape_pod_01");
		local g_escape_pod_02 = ArrangePointGimmick_("o_U00_02", escape_pod_id, "g_escape_pod_02");
		local g_escape_pod_03 = ArrangePointGimmick_("o_U00_02", escape_pod_id, "g_escape_pod_03");
	}

	// ���Ԕ�
	if(GetEventFlg_("BFG_PLAYED_HOAKARI_SEALED_DEMO") == false){
		local red_door_id = ReadGimmick_("o_U00_05");
		g_door_red = ArrangePointGimmick_("o_U00_05", red_door_id, "g_door_red");
		// �O��(����) -> �J������F���̃S�~�ɂȂ�ݒ�Ȃ̂ŁA�J�ҋ@�̃A�j���͂Ȃ�
		local out_door_c_id = ReadGimmick_("o_U00_06");
		local g_out_door_c  = ArrangePointGimmick_("o_U00_06", out_door_c_id, "g_out_door_01");
	}
	else{
		// �}�b�v�̔��A�C�R�����\���ɂ���
		SetEventFlg_("BFG_MAP_ICON_050", true);
	}
	// ���Δ�
	if(GetEventFlg_("BFG_PLAYED_YATIHOKO_SEALED_DEMO") == false){
		local green_door_id = ReadGimmick_("o_U00_09");
		g_door_green = ArrangePointGimmick_("o_U00_09", green_door_id, "g_door_green");
		// �O��(��) -> �J������F���̃S�~�ɂȂ�ݒ�Ȃ̂ŁA�J�ҋ@�̃A�j���͂Ȃ�
		local out_door_l_id = ReadGimmick_("o_U00_06");
		local g_out_door_l  = ArrangePointGimmick_("o_U00_06", out_door_l_id, "g_out_door_02");
	}
	else{
		// �}�b�v�̔��A�C�R�����\���ɂ���
		SetEventFlg_("BFG_MAP_ICON_048", true);
	}
	// ����
	if(GetEventFlg_("BFG_PLAYED_WADATUMI_SEALED_DEMO") == false){
		local blue_door_id = ReadGimmick_("o_U00_10");
		g_door_blue = ArrangePointGimmick_("o_U00_10", blue_door_id, "g_door_blue");
		// �O��(�E) -> �J������F���̃S�~�ɂȂ�ݒ�Ȃ̂ŁA�J�ҋ@�̃A�j���͂Ȃ�
		local out_door_r_id = ReadGimmick_("o_U00_06");
		local g_out_door_r  = ArrangePointGimmick_("o_U00_06", out_door_r_id, "g_out_door_03");
	}
	else{
		// �}�b�v�̔��A�C�R�����\���ɂ���
		SetEventFlg_("BFG_MAP_ICON_049", true);
	}

	// �����Z�Δ�(���i���[�^)
	local g_stele = ReadGimmick_("o_com_07");
	g_ranaruta_stele <- ArrangePointGimmick_("o_com_07", g_stele, "g_stele_01");
	SetMotion_(g_ranaruta_stele, "GIMMICK_0", 0);
	if(GetEventFlg_("BFG_EXAMINE_RANARUTA_STELE") == true){
		SetMotion_(g_ranaruta_stele, "GIMMICK_2", 0);
	}
	// �����Z�Δ�(���i���I��)
	g_ranarion_stele <- ArrangePointGimmick_("o_com_07", g_stele, "g_stele_02");
	SetMotion_(g_ranarion_stele, "GIMMICK_0", 0);
	if(GetEventFlg_("BFG_EXAMINE_RANARION_STELE") == true){
		SetMotion_(g_ranarion_stele, "GIMMICK_2", 0);
	}
	// �����Z�Δ�(�C���[�W�`�F���W)
	g_makeup_stele <- ArrangePointGimmick_("o_com_07", g_stele, "g_stele_03");
	SetMotion_(g_makeup_stele, "GIMMICK_0", 0);
	if(GetEventFlg_("BFG_EXAMINE_MAKE_UP_STELE") == true){
		SetMotion_(g_makeup_stele, "GIMMICK_2", 0);
	}
	// �������̔�
	local room_door_id = ReadGimmick_("o_U00_14");
	if(GetEventFlg_("BFG_CHECK_ROOM_DOOR_1") == false){
		g_room_door_01 = ArrangePointGimmick_("o_U00_14", room_door_id, "g_room_door_01");
		SetMotion_(g_room_door_01, MOT_GIMMICK_0, BLEND_N);
	}
	if(GetEventFlg_("BFG_CHECK_ROOM_DOOR_2") == false){
		g_room_door_02 = ArrangePointGimmick_("o_U00_14", room_door_id, "g_room_door_02");
		SetMotion_(g_room_door_02, MOT_GIMMICK_0, BLEND_N);
	}

	//---------------
	// ���G�t�F�N�g�z�u
	//---------------
	// �X�^�[�V�[�h
	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){					// NUM0 = 9
		// �X�^�[�V�[�h�x�[�X�̃G�t�F�N�g(�����O)
		if(outside_num <= GetFlagID_("CONST_SS_OS_COLLECT_STAR_PIECE_2")){	// NUM010 <= 11
			LoadEffect_("ef732_25_star_seed_base01");	// �X�^�[�V�[�h�x�[�X
			LoadEffect_("ef340_06_star_seed_case");		// ���̃G�t�F�N�g
			LoadEffect_("ef340_07_star_seed_shaton_u");	// �d�C�G�t�F�N�g(��)
			LoadEffect_("ef340_08_star_seed_shaton_d");	// �d�C�G�t�F�N�g(��)
			// �X�^�[�V�[�h�x�[�X
			local model_base = ReadGimmick_("o_effect_base");
			local seed = ArrangePointGimmick_("o_effect_base", model_base, "ef_seed"); //�X�^�[�V�[�h�i�G�t�F�N�g�x�[�X�j
			SetPointPosNoFit_(seed, "ef_seed");
			local efc_seed = SetSelectBoneEffect_("ef732_25_star_seed_base01", seed, ATTACH_GLOBAL);
			SetEffectScale_(efc_seed, 0.5);
			// ���̃G�t�F�N�g
			local efc_case    = SetPointWorldEffect_("ef340_06_star_seed_case", "ef_seed_case");
			// �d�C�G�t�F�N�g(��)
			local efc_elec_01 = SetPointWorldEffect_("ef340_07_star_seed_shaton_u", "ef_seed_case_shaton_01");
			// �d�C�G�t�F�N�g(��)
			local efc_elec_02 = SetPointWorldEffect_("ef340_08_star_seed_shaton_d", "ef_seed_case_shaton_02");
			// �X�^�[�s�[�X�̃G�t�F�N�g
			if(GetEventFlg_("BFG_STAR_PIECE_EFFECT_ON_GREEN") == true){
				// ���̃X�^�[�s�[�X[�O�� : ��]
				LoadEffect_("ef732_22_star_seed_m_g");
				local ef_green = SetPointWorldEffect_("ef732_22_star_seed_m_g", "ef_seed");
			}
			if(GetEventFlg_("BFG_STAR_PIECE_EFFECT_ON_BLUE") == true){
				// �C�̃X�^�[�s�[�X[�O�� : ��]
				LoadEffect_("ef732_23_star_seed_m_b");
				local ef_blue = SetPointWorldEffect_("ef732_23_star_seed_m_b", "ef_seed");
			}
			if(GetEventFlg_("BFG_STAR_PIECE_EFFECT_ON_RED") == true){
				// ��̃X�^�[�s�[�X[�O�� : ��]
				LoadEffect_("ef732_24_star_seed_m_r");
				local ef_red = SetPointWorldEffect_("ef732_24_star_seed_m_r", "ef_seed");
			}
		}
		// ����ȊO : NUM010 �� 12 �ȍ~�͔z�u���Ȃ�(�R�A�Ɏ����Ă�������)
		else{
		}
	}

	// ����̗􂯖�
	LoadEffect_("ef300_25_wormhole");
	wormhole_01 <- SetPointWorldEffect_("ef300_25_wormhole", "ef_wormhole_01");
	wormhole_02 <- SetPointWorldEffect_("ef300_25_wormhole", "ef_wormhole_02");
	wormhole_03 <- SetPointWorldEffect_("ef300_25_wormhole", "ef_wormhole_03");

	//----------
	// ��NPC�z�u
	//----------
	// ID������
	npc_Rukiya <- C_NONE_ID;
	npc_Aroma <- C_NONE_ID;

	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){							// NUM0  = 9
		if(outside_num == GetFlagID_("CONST_SS_OS_GO_POINT_ZERO")){					// NUM10 = 2
			npc_Rukiya = ReadAndArrangePointNpc("n009", "npc_rukiya");
			SetTalkCameraType_(npc_Rukiya, TALK_CAMERA_UP);
			SetReactorMsg_(npc_Rukiya, "NPC_RUKIYA_REC");
			// ��b�J�������ɓ��߂����̂ŃA���t�@�l��ݒ肷��
			SetManualCalcAlpha_(npc_Rukiya, true);
			SetAlpha_(npc_Rukiya, 1.0);
		}
		else if(outside_num == GetFlagID_("CONST_SS_OS_GO_POINT_ZERO_LAB_1")){		// NUM10 = 3
			npc_Aroma = ReadAndArrangePointNpc("n018", "npc_aroma_01");
			SetTalkCameraType_(npc_Aroma, TALK_CAMERA_UP);
			SetReactorMsg_(npc_Aroma, "NPC_AROMA_REC");
			// ��b�J�������ɓ��߂����̂ŃA���t�@�l��ݒ肷��
			SetManualCalcAlpha_(npc_Aroma, true);
			SetAlpha_(npc_Aroma, 1.0);
		}
		else if(outside_num == GetFlagID_("CONST_SS_OS_GO_CENTER_BILL_1F")){		// NUM10 = 4
			npc_Aroma = ReadAndArrangePointNpc("n018", "npc_aroma_02");
			SetTalkCameraType_(npc_Aroma, TALK_CAMERA_UP);
			SetReactorMsg_(npc_Aroma, "NPC_AROMA_REC");
			// ��b�J�������ɓ��߂����̂ŃA���t�@�l��ݒ肷��
			SetManualCalcAlpha_(npc_Aroma, true);
			SetAlpha_(npc_Aroma, 1.0);
		}
		else if(outside_num >= GetFlagID_("CONST_SS_OS_COLLECT_STAR_PIECE")			// NUM10 >= 10
			&&  outside_num <= GetFlagID_("CONST_SS_OS_GO_TO_CORE") ){				// NUM10 <= 12
			npc_Aroma = ReadAndArrangePointNpc("n018", "npc_aroma_02");
			SetTalkCameraType_(npc_Aroma, TALK_CAMERA_UP);
			SetReactorMsg_(npc_Aroma, "NPC_AROMA_REC");
			// ��b�J�������ɓ��߂����̂ŃA���t�@�l��ݒ肷��
			SetManualCalcAlpha_(npc_Aroma, true);
			SetAlpha_(npc_Aroma, 1.0);
		}
	}

	//-------------------------
	// �����A�N�^�[�|�C���g�z�u
	//-------------------------
	// ���ӂ����ȐΔ�
	local reactorPoint02 = ArrangeMsgReactorPoint("ReactorPoint_02", GetFlagID_("BFG_REACTER_POINT_125")
		, SHORT_DIST, "REC_POINT_NOC_02_01", "REC_POINT_NOC_02_02");
	local reactorPoint03 = ArrangeMsgReactorPoint("ReactorPoint_03", GetFlagID_("BFG_REACTER_POINT_126")
		, SHORT_DIST, "REC_POINT_NOC_03_01", "REC_POINT_NOC_03_02");
	local reactorPoint15 = ArrangeMsgReactorPoint("ReactorPoint_15", GetFlagID_("BFG_REACTER_POINT_171")
		, SHORT_DIST, "REC_POINT_NOC_04_01", "REC_POINT_NOC_04_02");
	// ���G�C���A�X���u
	local reactorPoint04_1 = ArrangeMsgReactorPoint("ReactorPoint_04_1", GetFlagID_("BFG_REACTER_POINT_160")
		, SHORT_DIST, "REC_POINT_04_01", "REC_POINT_04_02");
	local reactorPoint04_2 = ArrangeMsgReactorPoint("ReactorPoint_04_2", GetFlagID_("BFG_REACTER_POINT_160")
		, SHORT_DIST, "REC_POINT_04_01", "REC_POINT_04_02");
	local reactorPoint04_3 = ArrangeMsgReactorPoint("ReactorPoint_04_3", GetFlagID_("BFG_REACTER_POINT_160")
		, SHORT_DIST, "REC_POINT_04_01", "REC_POINT_04_02");
	// ���E�o�|�b�h
	if(main_num <= GetFlagID_("CONST_SM_INSIDE_CLEAR")){				   // NUM000 <= 9
		local reactorPoint05_1 = ArrangeMsgReactorPoint("ReactorPoint_05_1", GetFlagID_("BFG_REACTER_POINT_161")
			, SHORT_DIST, "REC_POINT_05_01", "REC_POINT_05_02");
		local reactorPoint05_2 = ArrangeMsgReactorPoint("ReactorPoint_05_2", GetFlagID_("BFG_REACTER_POINT_161")
			, SHORT_DIST, "REC_POINT_05_01", "REC_POINT_05_02");
		local reactorPoint05_3 = ArrangeMsgReactorPoint("ReactorPoint_05_3", GetFlagID_("BFG_REACTER_POINT_161")
			, SHORT_DIST, "REC_POINT_05_01", "REC_POINT_05_02");
	}
	// ���X�^�[�V�[�h
	local reactorPoint06 = C_NONE_ID;
	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){					// NUM000 == 9
		if(outside_num <= GetFlagID_("CONST_SS_OS_COLLECT_STAR_PIECE_2")){	// NUM010 �� 11 �ȉ�
			reactorPoint06 = ArrangeMsgReactorPoint("ReactorPoint_06", GetFlagID_("BFG_REACTER_POINT_162")
				, SHORT_DIST, "REC_POINT_06_01", "REC_POINT_06_02");
		}
		else{
			// �z�u���Ȃ�(�R�A�Ɏ����Ă�������)
		}
	}
	// ���n�̔��|����s���u
	local reactorPoint07	 = C_NONE_ID;
	local reactorPoint10_2	 = C_NONE_ID;
	if(GetEventFlg_("BFG_PLAYED_YATIHOKO_SEALED_DEMO") == false){
		reactorPoint07 = ArrangeMsgReactorPoint("ReactorPoint_07", GetFlagID_("BFG_REACTER_POINT_163")
			, SHORT_DIST, "REC_POINT_07_01", "REC_POINT_07_02");
	} else {
		reactorPoint10_2 = ArrangeMsgReactorPoint("ReactorPoint_10_2", GetFlagID_("BFG_REACTER_POINT_166")
		, RING_DIST, "REC_POINT_10_01", "REC_POINT_10_02");
	}
	// �����̔��|����s���u
	local reactorPoint08	 = C_NONE_ID;
	local reactorPoint10_3	 = C_NONE_ID;
	if(GetEventFlg_("BFG_PLAYED_WADATUMI_SEALED_DEMO") == false){
		reactorPoint08 = ArrangeMsgReactorPoint("ReactorPoint_08", GetFlagID_("BFG_REACTER_POINT_164")
			, SHORT_DIST, "REC_POINT_08_01", "REC_POINT_08_02");
	} else {
		reactorPoint10_3 = ArrangeMsgReactorPoint("ReactorPoint_10_3", GetFlagID_("BFG_REACTER_POINT_166")
		, RING_DIST, "REC_POINT_10_01", "REC_POINT_10_02");
	}
	// ���V�̔��|����s���u
	local reactorPoint09	 = C_NONE_ID;
	local reactorPoint10_1	 = C_NONE_ID;
	if(GetEventFlg_("BFG_PLAYED_HOAKARI_SEALED_DEMO") == false){
		reactorPoint09 = ArrangeMsgReactorPoint("ReactorPoint_09", GetFlagID_("BFG_REACTER_POINT_165")
			, SHORT_DIST, "REC_POINT_09_01", "REC_POINT_09_02");
	} else {
		reactorPoint10_1 = ArrangeMsgReactorPoint("ReactorPoint_10_1", GetFlagID_("BFG_REACTER_POINT_166")
		, RING_DIST, "REC_POINT_10_01", "REC_POINT_10_02");
	}
	// ������s���u
	local reactorPoint10_4 = ArrangeMsgReactorPoint("ReactorPoint_10_4", GetFlagID_("BFG_REACTER_POINT_166")
		, RING_DIST, "REC_POINT_10_01", "REC_POINT_10_02");
	local reactorPoint10_5 = ArrangeMsgReactorPoint("ReactorPoint_10_5", GetFlagID_("BFG_REACTER_POINT_166")
		, RING_DIST, "REC_POINT_10_01", "REC_POINT_10_02");
	local reactorPoint10_6 = ArrangeMsgReactorPoint("ReactorPoint_10_6", GetFlagID_("BFG_REACTER_POINT_166")
		, RING_DIST, "REC_POINT_10_01", "REC_POINT_10_02");
	// ���Ïʂ̊C
	local reactorPoint11 = ArrangeMsgReactorPoint("ReactorPoint_11", GetFlagID_("BFG_REACTER_POINT_167")
		, ENDLESS_DIST, "REC_POINT_11_01", "REC_POINT_11_02");
	// ���n�̗􂯖�
	local y_status_num = GetNumFlg_("NUM_YATIHOKO_PHASE");
	local reactorPoint12 = C_NONE_ID;
	if(y_status_num <= 6){
		reactorPoint12 = ArrangeMsgReactorPoint("ReactorPoint_12", GetFlagID_("BFG_REACTER_POINT_168")
			, SHORT_DIST, "REC_POINT_12_01", "REC_POINT_12_02");
	}
	// �����̗􂯖�
	local w_status_num = GetNumFlg_("NUM_WADATUMI_PHASE");
	local reactorPoint13 = C_NONE_ID;
	if(w_status_num <= 6){
		reactorPoint13 = ArrangeMsgReactorPoint("ReactorPoint_13", GetFlagID_("BFG_REACTER_POINT_169")
			, SHORT_DIST, "REC_POINT_13_01", "REC_POINT_13_02");
	}
	// ���V�̗􂯖�
	local h_status_num = GetNumFlg_("NUM_HOAKARI_PHASE");
	local reactorPoint14 = C_NONE_ID;
	if(h_status_num <= 6){
		reactorPoint14 = ArrangeMsgReactorPoint("ReactorPoint_14", GetFlagID_("BFG_REACTER_POINT_170")
			, SHORT_DIST, "REC_POINT_14_01", "REC_POINT_14_02");
	}
	// ���R�A
	local reactorPoint16 = ArrangeMsgReactorPoint("ReactorPoint_16", GetFlagID_("BFG_REACTER_POINT_001")
		, ENDLESS_DIST, "REC_POINT_15_01", "REC_POINT_15_02");

	//-----------
	// ���n���z�u
	//-----------
	// ID������
	mine_wormhole_01 <- C_NONE_ID; // ��
	mine_wormhole_02 <- C_NONE_ID; // �C
	mine_wormhole_03 <- C_NONE_ID; // ��
	mine_00 <- C_NONE_ID;
	mine_01 <- C_NONE_ID;
	mine_02 <- C_NONE_ID;
	mine_03 <- C_NONE_ID;
	mine_04 <- C_NONE_ID;
	mine_05 <- C_NONE_ID;
	mine_06 <- C_NONE_ID;
	mine_07 <- C_NONE_ID;
	mine_08 <- C_NONE_ID;
	mine_room_door_01 <- C_NONE_ID;
	mine_room_door_02 <- C_NONE_ID;
	mine_09 <- C_NONE_ID;

// ���j�[�NID�̊֌W�ňȉ��̏��ɒn����ݒu����(Redmine#2395)
// 1.����̗􂯖ڂ̒n��
	mine_wormhole_01 = SetPointCircleEventMine_("mine_wormhole_01", true);
	mine_wormhole_02 = SetPointCircleEventMine_("mine_wormhole_02", true);
	mine_wormhole_03 = SetPointCircleEventMine_("mine_wormhole_03", true);

// 2.�Δ�𒲂ׂ����̒n��
	// �����i���[�^
	if(GetEventFlg_("BFG_EXAMINE_RANARUTA_STELE") == false){
		mine_02 = SetPointCircleEventMine_("mine_02", true);
	}
	// �����i���I��
	if(GetEventFlg_("BFG_EXAMINE_RANARION_STELE") == false){
		mine_03 = SetPointCircleEventMine_("mine_03", true);
	}
	// ���C���[�W�`�F���W
	if(GetEventFlg_("BFG_EXAMINE_MAKE_UP_STELE") == false){
		mine_06 = SetPointCircleEventMine_("mine_06", true);
	}
	// �����[���|�C���g
	//mine_RulerPoint = SetPointCircleEventMine_("mine_RulerPoint", true);

// 3.�Δ�ɋ߂Â������Ƀ��A�N�^�[����������n��
	// �����i���[�^�̐Δ�Ƀ��A�N�^�[�������������ǂ���
	if(GetEventFlg_("BFG_NEAR_RANARUTA_STELE") == false){
		mine_04 = SetPointCircleEventMine_("mine_04", false);
	}
	// �����i���I���̐Δ�Ƀ��A�N�^�[�������������ǂ���
	if(GetEventFlg_("BFG_NEAR_RANARION_STELE") == false){
		mine_05 = SetPointCircleEventMine_("mine_05", false);
	}
	// ���C���[�W�`�F���W�̐Δ�Ƀ��A�N�^�[�������������ǂ���
	if(GetEventFlg_("BFG_NEAR_MAKE_UP_STELE") == false){
		mine_07 = SetPointCircleEventMine_("mine_07", false);
	}

// 4.�f���Đ��p�̒n��
	// ��Demo802[���L���ƃA���}]�̍Đ��n��
	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){
		if(outside_num == GetFlagID_("CONST_SS_OS_GO_POINT_ZERO")){
			mine_00 = SetPointBoxEventMine_("mine_00", false);
		}
	}
	// ��Demo803[���̓X�^�[�V�[�h]�̍Đ��n��
	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){
		if(outside_num == GetFlagID_("CONST_SS_OS_GO_POINT_ZERO_LAB_1")){
			mine_01 = SetPointBoxEventMine_("mine_01", false);
		}
	}
	// ��Demo809[����̉��]�̍Đ��n��
	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){
		if(outside_num == GetFlagID_("CONST_SS_OS_GO_POINT_ZERO_LAB_2")){
			mine_08 = SetPointBoxEventMine_("mine_01", false);
		}
	}

// 5.�����h�A�Đ��p�̒n��
	// �������h�A�P
	if(GetEventFlg_("BFG_CHECK_ROOM_DOOR_1") == false){
		if(main_num >= GetFlagID_("CONST_SM_INSIDE_CLEAR")){
			if(outside_num >= GetFlagID_("CONST_SS_OS_GO_POINT_ZERO")){
				mine_room_door_01 = SetPointCircleEventMine_("mine_room_door_01", true);
			}
		}
	}
	// �������h�A�Q
	if(GetEventFlg_("BFG_CHECK_ROOM_DOOR_2") == false){
		if(main_num >= GetFlagID_("CONST_SM_INSIDE_CLEAR")){
			if(outside_num >= GetFlagID_("CONST_SS_OS_GO_POINT_ZERO")){
				mine_room_door_02 = SetPointCircleEventMine_("mine_room_door_02", true);
			}
		}
	}
// 6.�O�ɏo���Ȃ��n��
	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){
		if(outside_num <= GetFlagID_("CONST_SS_OS_GO_POINT_ZERO_LAB_1")){
			mine_09 = SetPointBoxEventMine_("mine_09", false);
		}
	}

	//-------------------------
	// ���i�r�}�b�v�A�C�R���z�u
	//-------------------------
	// ���Δ�A�C�R��
	icon_stone_01 <- C_NONE_ID;
	icon_stone_02 <- C_NONE_ID;
	icon_stone_03 <- C_NONE_ID;
	
	if(GetEventFlg_("BFG_EXAMINE_RANARUTA_STELE") == false){
		icon_stone_01 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.STONE , "g_stele_01");
	}
	if(GetEventFlg_("BFG_EXAMINE_RANARION_STELE") == false){
		icon_stone_02 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.STONE , "g_stele_02");
	}
	if(GetEventFlg_("BFG_EXAMINE_MAKE_UP_STELE") == false){
		icon_stone_03 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.STONE , "g_stele_03");
	}

	EventEnd_();
}

//------------------------------------------------
//		�C�x���g�X�^�[�g
//------------------------------------------------
function EventStartOperate()
{
	// �i�s�t���O�̏�Ԃ��擾
	local main_num    = GetNumFlg_("NUM_SCENARIO_MAIN");
	local outside_num = GetNumFlg_("NUM_SCENARIO_SUB_INSIDE_CLEAR");

//---------------------------------------------------------------------------------------
// �f���̍Đ�
	// 
	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){
		if(outside_num == GetFlagID_("CONST_SS_OS_COLLECT_STAR_PIECE")){ // NUM010 = 10
			SetNumFlg_("NUM_SCENARIO_SUB_INSIDE_CLEAR", GetFlagID_("CONST_SS_OS_COLLECT_STAR_PIECE_2"));
			// ���C��̃A�N�Z�T�����P�ł������Ă���Ƃ�, Demo810[���_�̕���]/Demo811[�C�_�̕���]/Demo812[��_�̕���]�̂����ꂩ���Đ�����
			if(CommAccessoryCheck() == true){
				if(GetAccessoryNum_(YATIHOKO_ACCE_ID) >= 1){
					CommChangeMomentFadeOut(FADE_COLOR_BLACK);
					uPlayDemo_SealedGod(DEMO_YATIHOKO);
				}
				else{
					if(GetAccessoryNum_(WADATUMI_ACCE_ID) >= 1){
						CommChangeMomentFadeOut(FADE_COLOR_BLACK);
						uPlayDemo_SealedGod(DEMO_WADATUMI);
					}
					else{
						if(GetAccessoryNum_(HOAKARI_ACCE_ID) >= 1){
							CommChangeMomentFadeOut(FADE_COLOR_BLACK);
							uPlayDemo_SealedGod(DEMO_HOAKARI);
						}
					}
				}
			}
			// �A�N�Z�T�����̂Ă���A���������ꍇ(�C���M�����[�Ώ�)
			else{
				// �ǂ̃A�N�Z�T�����̂Ă��蕪�������肵�������`�F�b�N
				local lost_accessory_num = GetNumFlg_("NUM_RELEASE_AND_DECOMPOSE_ACCESSORY");
				if(lost_accessory_num == 1){
					CommChangeMomentFadeOut(FADE_COLOR_BLACK);
					uPlayDemo_SealedGod(DEMO_YATIHOKO);
				}
				else if(lost_accessory_num == 2){
					CommChangeMomentFadeOut(FADE_COLOR_BLACK);
					uPlayDemo_SealedGod(DEMO_WADATUMI);
				}
				else if(lost_accessory_num == 3){
					CommChangeMomentFadeOut(FADE_COLOR_BLACK);
					uPlayDemo_SealedGod(DEMO_HOAKARI);
				}
				else{
					// �����Đ����Ȃ�
					DebugPrint(" ");
					DebugPrint("�i�s�ُ�ł��B[Demo809]�C�x���g�X�N���v�g�ǂɘA�������肢���܂�");
					DebugPrint(" ");
				}
			}
		}
		else if(outside_num == GetFlagID_("CONST_SS_OS_COLLECT_STAR_PIECE_2")){ // NUM010 = 11
			// �X�^�[�s�[�X��g�ݍ��݃t���O�𗧂Ă�(��:�����ł��Ȃ��ƃf���̃G�t�F�N�g�ɖ�����������̂�)
			local demo_num = GetNumFlg_("NUM_CHECK_STAR_PIECE_DEMO_TYPE");
			if(demo_num == 0){
				// �������Ȃ�
			}
			// �Đ����ꂽ�f���t���O���`�F�b�N
			else{
				// Demo819[���̃X�^�[�s�[�X�g�ݍ���]���Đ����ꂽ -> 1
				if(demo_num == 1){
					SetEventFlg_("BFG_STAR_PIECE_EFFECT_ON_GREEN", true);
					SetNumFlg_("NUM_CHECK_STAR_PIECE_DEMO_TYPE", 0); // ���ɖ߂��Ă���
				}
				// Demo820[�C�̃X�^�[�s�[�X�g�ݍ���]���Đ����ꂽ -> 2
				else if(demo_num == 2){
					SetEventFlg_("BFG_STAR_PIECE_EFFECT_ON_BLUE", true);
					SetNumFlg_("NUM_CHECK_STAR_PIECE_DEMO_TYPE", 0); // ���ɖ߂��Ă���
				}
				// Demo821[��̃X�^�[�s�[�X�g�ݍ���]���Đ����ꂽ -> 3
				else if(demo_num == 3){
					SetEventFlg_("BFG_STAR_PIECE_EFFECT_ON_RED", true);
					SetNumFlg_("NUM_CHECK_STAR_PIECE_DEMO_TYPE", 0); // ���ɖ߂��Ă���
				}
				// ��O
				else{
					SetNumFlg_("NUM_CHECK_STAR_PIECE_DEMO_TYPE", 0); // ���ɖ߂��Ă���
				}
			}

			// �X�^�[�s�[�X�̃G�t�F�N�g
			if(GetEventFlg_("BFG_STAR_PIECE_EFFECT_ON_GREEN") == true){
				// ���̃X�^�[�s�[�X[�O�� : ��]
				LoadEffect_("ef732_22_star_seed_m_g");
				local ef_green = SetPointWorldEffect_("ef732_22_star_seed_m_g", "ef_seed");
			}
			if(GetEventFlg_("BFG_STAR_PIECE_EFFECT_ON_BLUE") == true){
				// �C�̃X�^�[�s�[�X[�O�� : ��]
				LoadEffect_("ef732_23_star_seed_m_b");
				local ef_blue = SetPointWorldEffect_("ef732_23_star_seed_m_b", "ef_seed");
			}
			if(GetEventFlg_("BFG_STAR_PIECE_EFFECT_ON_RED") == true){
				// ��̃X�^�[�s�[�X[�O�� : ��]
				LoadEffect_("ef732_24_star_seed_m_r");
				local ef_red = SetPointWorldEffect_("ef732_24_star_seed_m_r", "ef_seed");
			}

			// ���C��̃X�^�[�s�[�X�̑g�ݍ��݃f��(Demo819�`821)�̌�ɘA�����ăf���𗬂����ߗp�̃t���O�����Ă��Ă��邩�`�F�b�N
			if(GetEventFlg_("BFG_CONTINUED_STAR_PIECE_DEMO") == true){
				// �X�^�[�s�[�X�����g�ݍ��񂾂��`�F�b�N
				local num = uCountBuiltInStarPiece();

				DebugPrint(" ");
				DebugPrint("�X�^�[�s�[�X�� " + num + " �g�ݍ���ł��܂�");
				DebugPrint(" ");

				if(num == 3){
					// �V�i���I�̐i�s
					SetNumFlg_("NUM_SCENARIO_SUB_INSIDE_CLEAR", GetFlagID_("CONST_SS_OS_GO_TO_CORE")); // NUM010 = 12
					// �f���̘A���Đ��t���O���~�낷
					SetEventFlg_("BFG_CONTINUED_STAR_PIECE_DEMO", false);
					// ���A�ʒu
					SetReturnDemoPosDir_(Vec3(1.300, 0.000, 22.002), 180);
					EventStartChangeDemo(824, FADE_COLOR_BLACK);
				}
				else{
					if(num == 1){
						// �f���̘A���Đ��t���O���~�낷
						SetEventFlg_("BFG_CONTINUED_STAR_PIECE_DEMO", false);
						// �[���f��[�X�^�[�s�[�X�͎c��Q��]
						uStarPieceDemo1();
					}
					else if(num == 2){
						// �f���̘A���Đ��t���O���~�낷
						SetEventFlg_("BFG_CONTINUED_STAR_PIECE_DEMO", false);
						// �[���f��[�X�^�[�s�[�X�͎c��P��]
						uStarPieceDemo2();
					}
					else{
						// ��O()
					}
				}
			}
		}
	}

//------------------------------
// �[���f���Đ�
	if(GetEventFlg_("BFG_RIDE_OFF_FLAG_BEFORE_STELE") == true){
		// �Đ�����[���f�����`�F�b�N
		local g_check_skill_stele = GetNumFlg_("NUM_CHECK_KIND_BEFORE_STELE");
		switch(g_check_skill_stele)
		{
		// ���i���[�^
		case 1:
			CommChangeMomentFadeOut(FADE_COLOR_BLACK);
			SetEventFlg_("BFG_RIDE_OFF_FLAG_BEFORE_STELE", false);
			uPlayableDemoRanarutaStele();
			SetNumFlg_("NUM_CHECK_KIND_BEFORE_STELE", 0);
			break;
		// ���i���I��
		case 2:
			CommChangeMomentFadeOut(FADE_COLOR_BLACK);
			SetEventFlg_("BFG_RIDE_OFF_FLAG_BEFORE_STELE", false);
			uPlayableDemoRanarionStele();
			SetNumFlg_("NUM_CHECK_KIND_BEFORE_STELE", 0);
			break;
		// �C���[�W�`�F���W
		case 3:
			CommChangeMomentFadeOut(FADE_COLOR_BLACK);
			SetEventFlg_("BFG_RIDE_OFF_FLAG_BEFORE_STELE", false);
			uPlayableDemoColorChangeStele();
			SetNumFlg_("NUM_CHECK_KIND_BEFORE_STELE", 0);
			break;
		// ����ȊO
		default:
			DebugPrint("�Đ�����[���f�����l������܂��� [U00_00 EventStartOperate()]");
			SetNumFlg_("NUM_CHECK_KIND_BEFORE_STELE", 0);
			break;
		}
	}

	EventEnd_();
}

//------------------------------------------------
//		�m�o�b��b���O
//------------------------------------------------
function BeforeTalkNpc()
{
	// �i�s�t���O�̏�Ԃ��擾
	local main_num    = GetNumFlg_("NUM_SCENARIO_MAIN");
	local outside_num = GetNumFlg_("NUM_SCENARIO_SUB_INSIDE_CLEAR");
	
	// �b���������Ă���NPC��ID���擾
	local target = GetTargetId_();
	
	// ���A���}
	if(target == npc_Aroma){
		// �P�ł��X�^�[�s�[�X�������Ă���ꍇ
		if(CommStarPieceCheck() == true){
			// �Q�ڈȍ~�̃X�^�[�s�[�X��������Ƃ�
			if(GetEventFlg_("BFG_GET_STER_PIECE_TALK_AROMA") == true){		// Bit1387
				SetTalkCameraType_(target, TALK_CAMERA_DEF);
				SetTalkTurn_(target, false);
			}
		}
		else{
			SetTalkCameraType_(target, TALK_CAMERA_UP);
		}
	}
	
	// �����L��
	if(target == npc_Rukiya){
		SetRideTalkCamOffset(OFFSET_RUKIYA);
	}
	
	
	EventEnd_();
}


//------------------------------------------------
//		�m�o�b�ڐG��
//------------------------------------------------
function TouchNpc()
{
	// �b��������Ώۂ�NPC��������
	local target    = GetTargetId_();
	switch(target)
	{
	case npc_Rukiya:
		uTalkRukiya();
		break;
	case npc_Aroma:
		uTalkAroma();
		break;
	default:
		DebugPrint("�ݒu���Ă��Ȃ�NPC�ɘb�������Ă��܂��B");
		break;
	}

	EventEnd_();
}

//------------------------------------------------
//		�n���ڐG��
//------------------------------------------------
function TouchEventMine()
{
	local player = GetPlayerId_();
	local target = GetTouchEventMineId_();

	switch(target)
	{
	// ���_
	case mine_wormhole_01:
		// �n�����폜
		DeleteEventMine_(mine_wormhole_01);
		mine_wormhole_01 <- C_NONE_ID;
		OpenMsgWnd_();
		ShowMsg_("SYSTEM_MSG_001");
		KeyInputWait_();
		if(GetQueryResult_() == QUERY_YES){
			CloseMsgWnd_();
			// ���[���ƃt���C�g�V�O�i���̋֎~
			SetEventFlg_("BFG_PLAYERABILITY_RULER_PROHIBIT", true);
			SetEventFlg_("BFG_FLIGHT_PROHIBIT", true);
			// ����̗􂯖ڂ̋��ʏ���
			CommDisplayedWormholeEffect();
			// �w�肵���}�b�v�Ɉړ�
			ChangeMapPosDir_("O00_10", Vec3(0.000, 0.000, -300.000), 0);
		}
		else{
			CloseMsgWnd_();
			// �n�����Đݒu
			mine_wormhole_01 = SetPointCircleEventMine_("mine_wormhole_01", true);
		}

		break;
	// �C�_
	case mine_wormhole_02:
		// �n�����폜
		DeleteEventMine_(mine_wormhole_02);
		mine_wormhole_02 <- C_NONE_ID;
		OpenMsgWnd_();
		ShowMsg_("SYSTEM_MSG_001");
		KeyInputWait_();
		if(GetQueryResult_() == QUERY_YES){
			CloseMsgWnd_();
			// ���[���ƃt���C�g�V�O�i���̋֎~
			SetEventFlg_("BFG_PLAYERABILITY_RULER_PROHIBIT", true);
			SetEventFlg_("BFG_FLIGHT_PROHIBIT", true);
			// ����̗􂯖ڂ̋��ʏ���
			CommDisplayedWormholeEffect();
			// �w�肵���}�b�v�Ɉړ�
			ChangeMapPosDir_("O00_11", Vec3(0.000, 0.000, -300.000), 0);
		}
		else{
			CloseMsgWnd_();
			// �n�����Đݒu
			mine_wormhole_02 = SetPointCircleEventMine_("mine_wormhole_02", true);
		}

		break;
	// ��_
	case mine_wormhole_03:
		// �n�����폜
		DeleteEventMine_(mine_wormhole_03);
		mine_wormhole_03 <- C_NONE_ID;
		OpenMsgWnd_();
		ShowMsg_("SYSTEM_MSG_001");
		KeyInputWait_();
		if(GetQueryResult_() == QUERY_YES){
			CloseMsgWnd_();
			// ���[���ƃt���C�g�V�O�i���̋֎~
			SetEventFlg_("BFG_PLAYERABILITY_RULER_PROHIBIT", true);
			SetEventFlg_("BFG_FLIGHT_PROHIBIT", true);
			// ����̗􂯖ڂ̋��ʏ���
			CommDisplayedWormholeEffect();
			// �w�肵���}�b�v�Ɉړ�
			ChangeMapPosDir_("O00_12", Vec3(0.000, 0.000, -300.000), 0);
		}
		else{
			CloseMsgWnd_();
			// �n�����Đݒu
			mine_wormhole_03 = SetPointCircleEventMine_("mine_wormhole_03", true);
		}

		break;
	// ���i���[�^(���C�h������[���f���Đ� 2��DB #3442)
	case mine_02:
		CommPlayerTurnAroundObj(g_ranaruta_stele);
		SetEventFlg_("BFG_RIDE_OFF_FLAG_BEFORE_STELE", true);
		SetNumFlg_("NUM_CHECK_KIND_BEFORE_STELE", 1); // ���i���[�^�p�ɐݒ�
		ChangeMapPosDir_("U00_00", Vec3(-2378.438, 278.264, -1488.885), -117);
		break;
	// ���i���I��
	case mine_03:
		CommPlayerTurnAroundObj(g_ranarion_stele);
		SetEventFlg_("BFG_RIDE_OFF_FLAG_BEFORE_STELE", true);
		SetNumFlg_("NUM_CHECK_KIND_BEFORE_STELE", 2); // ���i���I���p�ɐݒ�
		ChangeMapPosDir_("U00_00", Vec3(2072.970, 109.526, -2109.259), 148);
		break;
	// �C���[�W�`�F���W
	case mine_06:
		CommPlayerTurnAroundObj(g_makeup_stele);
		SetEventFlg_("BFG_RIDE_OFF_FLAG_BEFORE_STELE", true);
		SetNumFlg_("NUM_CHECK_KIND_BEFORE_STELE", 3); // �C���[�W�`�F���W�p�ɐݒ�
		ChangeMapPosDir_("U00_00", Vec3(-47.072, 43.835, -2608.173), -120);
		break;
	// ���i���[�^�̐Δ�ɋ߂Â�����
	case mine_04:
		DeleteEventMine_(mine_04);
		mine_04 <- C_NONE_ID; // �������^�C�~���O�ŏ�����
		SetEventFlg_("BFG_NEAR_RANARUTA_STELE", true);
		uReactorDemo(g_ranaruta_stele);
		break;
	// ���i���I���̐Δ�ɋ߂Â�����
	case mine_05:
		DeleteEventMine_(mine_05);
		mine_05 <- C_NONE_ID; // �������^�C�~���O�ŏ�����
		SetEventFlg_("BFG_NEAR_RANARION_STELE", true);
		uReactorDemo(g_ranarion_stele);
		break;
	// �C���[�W�`�F���W�̐Δ�ɋ߂Â�����
	case mine_07:
		DeleteEventMine_(mine_07);
		mine_07 <- C_NONE_ID; // �������^�C�~���O�ŏ�����
		SetEventFlg_("BFG_NEAR_MAKE_UP_STELE", true);
		uReactorDemo(g_makeup_stele);
		break;
	// Demo802[���L���ƃA���}]�̍Đ��n��
	case mine_00:
		DeleteEventMine_(mine_00);
		mine_00 <- C_NONE_ID; // �������^�C�~���O�ŏ�����
		// �V�i���I�i�s�t���O��i�߂�
		SetNumFlg_("NUM_SCENARIO_SUB_INSIDE_CLEAR", GetFlagID_("CONST_SS_OS_GO_POINT_ZERO_LAB_1"));
		// �f�B�X�N�̍ő�e�ʂ̑����t���O(���̂P)
		SetEventFlg_("BFG_AROMA_WAKEUP", true);
		// �f����̕��A�ʒu�ƌ����̐ݒ�
		local player_pos = Vec3(-37.646, 0.000, 296.434);
		local player_dir = 168;
		SetReturnDemoPosDir_(player_pos, player_dir);
		// Demo802[���L���ƃA���}]�Đ�
		ChangeDemo_(802);
		break;
	// Demo803[���̓X�^�[�V�[�h]�̍Đ��n��
	case mine_01:
		DeleteEventMine_(mine_01);
		mine_01 <- C_NONE_ID; // �������^�C�~���O�ŏ�����
		// �V�i���I�i�s�t���O��i�߂�
		SetNumFlg_("NUM_SCENARIO_SUB_INSIDE_CLEAR", GetFlagID_("CONST_SS_OS_GO_CENTER_BILL_1F"));
		// �f����̕��A�ʒu�ƌ����̐ݒ�
		local player_pos = Vec3(-7.000, 0.000, 0.000);
		local player_dir = 58;
		SetReturnDemoPosDir_(player_pos, player_dir);
		// Demo803[���̓X�^�[�V�[�h]�̍Đ�
		ChangeDemo_(803);
		break;
	// Demo809[����̉��]�̍Đ��n��
	case mine_08:
		DeleteEventMine_(mine_08);
		mine_08 <- C_NONE_ID; // �������^�C�~���O�ŏ�����
		// �V�i���I�i�s�t���O��i�߂�
		SetNumFlg_("NUM_SCENARIO_SUB_INSIDE_CLEAR", GetFlagID_("CONST_SS_OS_COLLECT_STAR_PIECE"));
		// �f����̕��A�ʒu�ƌ����̐ݒ�
		local player_pos = Vec3(-7.000, 0.000, 0.000);
		local player_dir = 58;
		SetReturnDemoPosDir_(player_pos, player_dir);
		// Demo809[����̉��]�̍Đ�
		ChangeDemo_(809);
		break;
	// �����h�A�P
	case mine_room_door_01:
		DeleteEventMine_(mine_room_door_01);
		mine_room_door_01 <- C_NONE_ID; // �������^�C�~���O�ŏ�����
		CommPlayerTurnAroundDir(180);
		SetMotion_(g_room_door_01, MOT_GIMMICK_1, BLEND_N);
		Wait_(35);
		PlaySE_("SE_FLD_005"); // �����ɖ炳�Ȃ��悤�ɂ���
		Wait_(52);
		SetActive_(g_room_door_01, false);
		SetEventFlg_("BFG_CHECK_ROOM_DOOR_1", true);
		Wait_(5);
		break;
	// �����h�A�Q
	case mine_room_door_02:
		DeleteEventMine_(mine_room_door_02);
		mine_room_door_02 <- C_NONE_ID; // �������^�C�~���O�ŏ�����
		CommPlayerTurnAroundDir(180);
		SetMotion_(g_room_door_02, MOT_GIMMICK_1, BLEND_N);
		Wait_(35);
		PlaySE_("SE_FLD_005"); // �����ɖ炳�Ȃ��悤�ɂ���
		Wait_(52);
		SetActive_(g_room_door_02, false);
		SetEventFlg_("BFG_CHECK_ROOM_DOOR_2", true);
		Wait_(5);
		break;
	// �i�s�s�n��
	case mine_09:
		local outside_num = GetNumFlg_("NUM_SCENARIO_SUB_INSIDE_CLEAR");
		if(outside_num <= GetFlagID_("CONST_SS_OS_GO_WOOD_PARK")){
			// ���L������̒ʐM�ƃ��b�Z�[�W
			OpenConnective("connective_rukiya");
			Wait_(5);
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_RUKIYA");
			ShowMsg_("GO_OUT_ROOM_MSG_CONECTIVE");
			KeyInputWait_();
			CloseMsgWnd_();
			Wait_(5);
			CloseConnective();
		}
		else if(outside_num == GetFlagID_("CONST_SS_OS_GO_POINT_ZERO")){
			// ���L��
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_RUKIYA");
			ShowMsg_("GO_OUT_ROOM_MSG");
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else{
			// �A���}
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_AROMA");
			ShowMsg_("GO_OUT_ROOM_MSG_AROMA");
			KeyInputWait_();
			CloseMsgWnd_();
		}
		Wait_(5);
		CommPlayerTurnMoveDirWalk(180);
		break;
	// �ݒu���Ă��Ȃ��n���ɐڐG
	default:
		DebugPrint("�ݒu���Ă��Ȃ��n���ɐG��Ă��܂��B");
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


//=========================================================================================================
//									�������������牺�̓��[�J���֐�������
//=========================================================================================================

//++++++++++++++++++++++++++++++++++++++++++++++++
//		�X�^�[�s�[�X�g�ݍ��ݐ����`�F�b�N
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �g�ݍ��񂾃X�^�[�s�[�X�̐�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uCountBuiltInStarPiece()
{
	local star_num = 0;
	
	// ���̃X�^�[�s�[�X���g�݂܂�Ă����ꍇ
	if(GetEventFlg_("BFG_STAR_PIECE_EFFECT_ON_GREEN") == true){
		star_num = star_num + 1;
	}
	// �C�̃X�^�[�s�[�X���g�݂܂�Ă����ꍇ
	if(GetEventFlg_("BFG_STAR_PIECE_EFFECT_ON_BLUE") == true){
		star_num = star_num + 1;
	}
	// ��̃X�^�[�s�[�X���g�݂܂�Ă����ꍇ
	if(GetEventFlg_("BFG_STAR_PIECE_EFFECT_ON_RED") == true){
		star_num = star_num + 1;
	}
	return star_num;
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		Demo[���_�̕���]�������Đ����ꂽ��
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Đ����ꂽ��
//++++++++++++++++++++++++++++++++++++++++++++++++
function uCountUnlockDemo()
{
	local played_num = 0;
	
	// Demo810[���_�̕���]�̍Đ�����Ă����ꍇ
	if(GetEventFlg_("BFG_PLAYED_YATIHOKO_SEALED_DEMO") == true){
		played_num = played_num + 1;
	}
	// Demo811[�C�_�̕���]�̍Đ�����Ă����ꍇ
	if(GetEventFlg_("BFG_PLAYED_WADATUMI_SEALED_DEMO") == true){
		played_num = played_num + 1;
	}
	// Demo812[��_�̕���]�̍Đ�����Ă����ꍇ
	if(GetEventFlg_("BFG_PLAYED_HOAKARI_SEALED_DEMO") == true){
		played_num = played_num + 1;
	}
	return played_num;
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		���L���̉�b���e
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkRukiya()
{
	// �i�s�t���O�̏�Ԃ��擾
	local main_num    = GetNumFlg_("NUM_SCENARIO_MAIN");
	local outside_num = GetNumFlg_("NUM_SCENARIO_SUB_INSIDE_CLEAR");

	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){ // NUM000 = 9
		if(outside_num == GetFlagID_("CONST_SS_OS_GO_POINT_ZERO")){ // NUM010 = 2
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_RUKIYA");
			ShowMsg_("RUKIYA_MSG_001");
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		�A���}�̉�b���e
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkAroma()
{
	// �i�s�t���O�̏�Ԃ��擾
	local main_num    = GetNumFlg_("NUM_SCENARIO_MAIN");
	local outside_num = GetNumFlg_("NUM_SCENARIO_SUB_INSIDE_CLEAR");

	if(main_num == GetFlagID_("CONST_SM_INSIDE_CLEAR")){ // NUM000 = 9
		if(outside_num == GetFlagID_("CONST_SS_OS_GO_POINT_ZERO_LAB_1")){ // NUM010 = 3
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_AROMA");
			ShowMsg_("AROMA_MSG_001");
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if(outside_num == GetFlagID_("CONST_SS_OS_GO_CENTER_BILL_1F")){ // NUM010 = 4
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_AROMA");
			ShowMsg_("AROMA_MSG_002");
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if(outside_num == GetFlagID_("CONST_SS_OS_COLLECT_STAR_PIECE")){ // NUM010 = 10
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_AROMA");
			ShowMsg_("MSG_000");
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if(outside_num == GetFlagID_("CONST_SS_OS_COLLECT_STAR_PIECE_2")){ // NUM010 = 11
			// �X�^�[�s�[�X�������Ă���
			if(CommStarPieceCheck() == true){
				// �e�X�^�[�s�[�X�̏��������`�F�b�N
				local land_num = GetItemNum_(LAND_STAR_PIECE_ID); // ��
				local sea_num  = GetItemNum_(SEA_STAR_PIECE_ID);  // �C
				local sky_num  = GetItemNum_(SKY_STAR_PIECE_ID);  // ��
				
				// ���߂Ęb��������Ƃ�
				if(GetEventFlg_("BFG_GET_STER_PIECE_TALK_AROMA") == false){		// Bit1387
					SetEventFlg_("BFG_GET_STER_PIECE_TALK_AROMA", true);
					
					OpenMsgWnd_();
					SetTalkName_("NAME_TAG_AROMA");
					ShowMsg_("AROMA_MSG_007");
					KeyInputWait_();
					CloseMsgWnd_();
				}
				
				if(land_num >= 1){
					// �X�^�[�s�[�X�����炷
					AddItem_(LAND_STAR_PIECE_ID, -1);
					// �X�^�[�s�[�X�̑g�ݍ��݃f���̌�ɘA�����ăf���𗬂����ߗp�̃t���O
					SetEventFlg_("BFG_CONTINUED_STAR_PIECE_DEMO", true);
					// �X�^�[�s�[�X�̑g�ݍ��݃f���̎�ނ�ݒ�
					SetNumFlg_("NUM_CHECK_STAR_PIECE_DEMO_TYPE", 1);
					// Demo819[���̃X�^�[�s�[�X�g�ݍ���]���Đ�
					TouchNpcChangeDemo(819);
				}
				else{
					if(sea_num >= 1){
						// �X�^�[�s�[�X�����炷
						AddItem_(SEA_STAR_PIECE_ID, -1);
						// �X�^�[�s�[�X�̑g�ݍ��݃f���̌�ɘA�����ăf���𗬂����ߗp�̃t���O
						SetEventFlg_("BFG_CONTINUED_STAR_PIECE_DEMO", true);
						// �X�^�[�s�[�X�̑g�ݍ��݃f���̎�ނ�ݒ�
						SetNumFlg_("NUM_CHECK_STAR_PIECE_DEMO_TYPE", 2);
						// Demo820[�C�̃X�^�[�s�[�X�g�ݍ���]���Đ�
						TouchNpcChangeDemo(820);
					}
					else{
						if(sky_num >= 1){
							// �X�^�[�s�[�X�����炷
							AddItem_(SKY_STAR_PIECE_ID, -1);
							// �X�^�[�s�[�X�̑g�ݍ��݃f���̌�ɘA�����ăf���𗬂����ߗp�̃t���O
							SetEventFlg_("BFG_CONTINUED_STAR_PIECE_DEMO", true);
							// �X�^�[�s�[�X�̑g�ݍ��݃f���̎�ނ�ݒ�
							SetNumFlg_("NUM_CHECK_STAR_PIECE_DEMO_TYPE", 3);
							// Demo821[��̃X�^�[�s�[�X�g�ݍ���]���Đ�
							TouchNpcChangeDemo(821);
						}
						else{
							// �t���[�I�ɂ��肦�Ȃ��̂œ��ɉ������Ȃ�
						}
					}
				}
			}
			// �X�^�[�s�[�X�������Ă��Ȃ�
			else{
				local demo_id = uCheckDemo_SealedGod();
				
				// Demo[���_�̕���] ���Đ����Ȃ��ꍇ
				if (demo_id == DEMO_NONE) {
					uCheckNoRingMsg();
				}
				// Demo[���_�̕���] ���Đ�����ꍇ
				else {
					uChangeAromaMsg();
					uFadeOutDefault();
					uPlayDemo_SealedGod(demo_id);
				}
			}
		}
		else if(outside_num == GetFlagID_("CONST_SS_OS_GO_TO_CORE")){ // NUM010 = 12
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_AROMA");
			ShowMsg_("AROMA_MSG_010");
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		�[���f��(���A�N�^�[����)
//------------------------------------------------
//	����	: �Δ�ID
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uReactorDemo(stele_id)
{
	local task_player;
	local efc_player;
	local player = GetPlayerId_();
	local g_stele_pos = GetPos_(stele_id);

	CommReactorActionDiscover();		// ���A�N�^�[���������������̋��ʏ���
	
	// ���Z�Δ�ɋ߂Â������̃��b�Z�[�W�\��
	if(stele_id == g_ranaruta_stele){ CommApproachStatueMsg(ABILITY_RANARUTA); }// ���i���[�^
	if(stele_id == g_ranarion_stele){ CommApproachStatueMsg(ABILITY_RANARION); }// ���i���I��
	if(stele_id == g_makeup_stele)  { CommApproachStatueMsg(ABILITY_MAKE_UP);  }// �C���[�W�`�F���W
	
	CommResetPlayerMotion();		// ���[�V������ҋ@��Ԃɖ߂����ʏ���
	
	// �Δ�̕�������
	if(!IsPlayerRide_()){
		SetMotion_(player, MOT_WALK, BLEND_XL);
	}
	local rotateTask = Task_RotateToPos_(player, g_stele_pos, ROTATE_EVENT_DEF);
	WaitTask(rotateTask);
	// �Ԃ���������
	Wait_(15);
	SetMotion_(player, MOT_WAIT, BLEND_XL);
	Wait_(5);
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		�[���f��[�X�^�[�s�[�X�͎c��Q��]
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uStarPieceDemo1()
{
// �Ó]
	CommChangeMomentFadeOut(FADE_COLOR_BLACK);
// ����
	// ��l���̈ʒu
	local player_pos = Vec3(0.00, 0.00, 5.67);
	local player_dir = 90;
	// �[���f����̕��A�ʒu
	local player_rtn_pos = Vec3(-3.13, 0.00, 24.50);
	local player_rtn_dir = 180;
	// �E�F�C�g
	local wait_speed     = 15;
	local wait_speed_def = 30;
	// �v���C���[ID
	local player = GetPlayerId_();
	// �J�����̊p�x
	local cam_dir = 145;
	local cam_rtn_dir = 180;
	// ��풓���[�V�����Ǎ�(��l�����Ȃ���)
	local nod = ReadMotion_(player, "Player_nod");
	// ��`�������l���Z�b�g
	Wait_(wait_speed);
	SetPos_(player, player_pos);
	SetDir_(player, player_dir);
	SetCameraDir_(cam_dir);
	SetDirToPlayer_(npc_Aroma);
	// �A���}(�ҋ@���[�V��������b���[�V����)
	SetMotion_(npc_Aroma, "TALKLOOP", BLEND_N);
// �Ó]����
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	Wait_(FADE_DEF);
	// ���b�Z�[�W�\��
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("AROMA_MSG_008");
	KeyInputWait_();
	CloseMsgWnd_();
	// �A���}(��b���[�V�������ҋ@���[�V����)
	SetMotion_(npc_Aroma, "WAIT", BLEND_L);
	Wait_(wait_speed);
	// ��l�������Ȃ���
	SetMotion_(player, nod, BLEND_M);
	Wait_(wait_speed_def);
// �Ó]
	uWaitNpcFade();
	SetPos_(player, player_rtn_pos);
	SetDir_(player, player_rtn_dir);
	// �J�������Đݒ�
	SetCameraDir_(cam_rtn_dir);
// �Ó]����
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	Wait_(FADE_DEF);
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		�[���f��[�X�^�[�s�[�X�͎c��P��]
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uStarPieceDemo2()
{
// �Ó]
	CommChangeMomentFadeOut(FADE_COLOR_BLACK);
// ����
	// ��l���̈ʒu
	local player_pos = Vec3(0.00, 0.00, 5.67);
	local player_dir = 90;
	// �[���f����̕��A�ʒu
	local player_rtn_pos = Vec3(-3.13, 0.00, 24.50);
	local player_rtn_dir = 180;
	// �E�F�C�g
	local wait_speed     = 15;
	local wait_speed_def = 30;
	// �v���C���[ID
	local player = GetPlayerId_();
	// �J�����̊p�x
	local cam_dir = 145;
	local cam_rtn_dir = 180;
	// ��풓���[�V�����Ǎ�(��l�����Ȃ���)
	local nod = ReadMotion_(player, "Player_nod");
	// ��`�������l���Z�b�g
	Wait_(wait_speed);
	SetPos_(player, player_pos);
	SetDir_(player, player_dir);
	SetCameraDir_(cam_dir);
	SetDirToPlayer_(npc_Aroma);
	// �A���}(�ҋ@���[�V��������b���[�V����)
	SetMotion_(npc_Aroma, "TALKLOOP", BLEND_N);
// �Ó]����
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	Wait_(FADE_DEF);
	// ���b�Z�[�W�\��
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_("AROMA_MSG_009");
	KeyInputWait_();
	CloseMsgWnd_();
	// �A���}(��b���[�V�������ҋ@���[�V����)
	SetMotion_(npc_Aroma, "WAIT", BLEND_L);
	Wait_(wait_speed);
	// ��l�������Ȃ���
	SetMotion_(player, nod, BLEND_M);
	Wait_(wait_speed_def);
// �Ó]
	uWaitNpcFade();
	SetPos_(player, player_rtn_pos);
	SetDir_(player, player_rtn_dir);
	// �J�������Đݒ�
	SetCameraDir_(cam_rtn_dir);
// �Ó]����
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	Wait_(FADE_DEF);
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�t�F�[�h�A�E�g����(15F)
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uWaitNpcFade()
{
	// �b���������炷���Ƀt�F�[�h���n�܂�悤�ɂ���
	local fade_spd = 15;
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, fade_spd);
	SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, fade_spd);
	WaitFade_();
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�t�F�[�h�A�E�g����(30F)
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uFadeOutDefault()
{
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		Demo[���_�̕���]�Đ����菈��
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �ǂ̃f�����Đ����邩
//++++++++++++++++++++++++++++++++++++++++++++++++
function uCheckDemo_SealedGod()
{
	local ring_y_num = GetAccessoryNum_(YATIHOKO_ACCE_ID);		// ID_216 ���`�z�R�̂�т�
	local ring_w_num = GetAccessoryNum_(WADATUMI_ACCE_ID);		// ID_218 ���_�c�~�̂�т�
	local ring_h_num = GetAccessoryNum_(HOAKARI_ACCE_ID);		// ID_217 �z�A�J���̂�т�

	// �D�揇�ʁi ���`�z�R > ���_�c�~ > �z�A�J�� �j
	if(GetNumFlg_("NUM_YATIHOKO_PHASE") == 0 && ring_y_num >= 1){	return DEMO_YATIHOKO;	}
	if(GetNumFlg_("NUM_WADATUMI_PHASE") == 0 && ring_w_num >= 1){	return DEMO_WADATUMI;	}
	if(GetNumFlg_("NUM_HOAKARI_PHASE") == 0 && ring_h_num >= 1){	return DEMO_HOAKARI;	}
	
	return DEMO_NONE;
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		Demo[���_�̕���]�Đ�����
//------------------------------------------------
//	����	: id	�ǂ̃f�����Đ����邩
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uPlayDemo_SealedGod(id)
{
	switch(id){
	// �u���`�z�R�v
	case DEMO_YATIHOKO :
		SetNumFlg_("NUM_YATIHOKO_PHASE", 1);
		SetEventFlg_("BFG_PLAYED_YATIHOKO_SEALED_DEMO", true);
		SetReturnDemoPosDir_(Vec3(-98.440, 0.000, -199.085), -135);
		
		// Demo810[���_�̕���]���Đ�
		ChangeDemo_(810);
		break;
		
	// �u���_�c�~�v
	case DEMO_WADATUMI :
		SetNumFlg_("NUM_WADATUMI_PHASE", 1);
		SetEventFlg_("BFG_PLAYED_WADATUMI_SEALED_DEMO", true);
		SetReturnDemoPosDir_(Vec3(99.505, 0.000, -196.311), 135);
		
		// Demo811[�C�_�̕���]���Đ�
		ChangeDemo_(811);
		break;
		
	// �u�z�A�J���v
	case DEMO_HOAKARI :
		SetNumFlg_("NUM_HOAKARI_PHASE", 1);
		SetEventFlg_("BFG_PLAYED_HOAKARI_SEALED_DEMO", true);
		SetReturnDemoPosDir_(Vec3(0.000, 0.000, -235.000), 180);
		
		// Demo812[��_�̕���]���Đ�
		ChangeDemo_(812);
		break;
		
	default :
		DebugPrint("WARNING : �z�肵�Ă��Ȃ�id(" + id + ")�ł� [uPlayDemo_SealedGod]");
		break;
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//	Demo[���_�̕���]���Đ�����ꍇ�̃Z���t
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uChangeAromaMsg()
{
	// �������������(���_�̕���̃f����������)�Ń��b�Z�[�W���ω�
	local unlock_num = uCountUnlockDemo();
	switch(unlock_num)
	{
	case 1:
		// ��x�����\�����Ȃ�
		if(GetEventFlg_("BFG_DISPLAY_U00_00_ACCESSORY_MSG_1") == false){
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_AROMA");
			ShowMsg_("AROMA_MSG_004");
			KeyInputWait_();
			CloseMsgWnd_();
			SetEventFlg_("BFG_DISPLAY_U00_00_ACCESSORY_MSG_1", true);
		}
		break;
	case 2:
		// ��x�����\�����Ȃ�
		if(GetEventFlg_("BFG_DISPLAY_U00_00_ACCESSORY_MSG_2") == false){
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_AROMA");
			ShowMsg_("AROMA_MSG_006");
			KeyInputWait_();
			CloseMsgWnd_();
			SetEventFlg_("BFG_DISPLAY_U00_00_ACCESSORY_MSG_2", true);
		}
		break;
	}
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//	�Ή������т�������Ă��Ȃ����̃Z���t
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uCheckNoRingMsg()
{
	local msg_key;
	// �������ꂽ���󂪂P�̎�
	if(uCountUnlockDemo() == 1){
		local check_num = GetNumFlg_("NUM_RELEASE_AND_DECOMPOSE_ACCESSORY"); // �ŏ��ɕ�����������f�����������������`�F�b�N
		// ���`�z�R�̕���������Ă���ꍇ
		if(check_num == 1){
			msg_key = "AROMA_MSG_003_A";
		}
		// ���_�c�~�̕���������Ă���ꍇ
		else if(check_num == 2){
			msg_key = "AROMA_MSG_003_B";
		}
		// �z�A�J���̕���������Ă���ꍇ
		else if(check_num == 3){
			msg_key = "AROMA_MSG_003_C";
		}
		else{
			// ��O
		}
	}
	// �������ꂽ���󂪂Q�̎�
	else if(uCountUnlockDemo() == 2){
		// ���`�z�R�̕���������ĂȂ��ꍇ
		if(GetEventFlg_("BFG_PLAYED_YATIHOKO_SEALED_DEMO") == false){
			msg_key = "AROMA_MSG_005_A";
		}
		else{
			// ���_�c�~�̕���������ĂȂ��ꍇ
			if(GetEventFlg_("BFG_PLAYED_WADATUMI_SEALED_DEMO") == false){
				msg_key = "AROMA_MSG_005_B";
			}
			else{
				// �z�A�J���̕���������ĂȂ��ꍇ
				if(GetEventFlg_("BFG_PLAYED_HOAKARI_SEALED_DEMO") == false){
					msg_key = "AROMA_MSG_005_C";
				}
				else{
					// ��O
				}
			}
		}
	}
	// �������ꂽ���󂪂R�S�Ă̏ꍇ
	else if(uCountUnlockDemo() == 3){
		msg_key = "AROMA_MSG_011";
	}
	else{
		// ��O
	}
	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_AROMA");
	ShowMsg_(msg_key);
	KeyInputWait_();
	CloseMsgWnd_();
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		���Z�擾�f��( ���i���[�^ )
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uPlayableDemoRanarutaStele()
{
	// �v���C���[ID
	local player = GetPlayerId_();
	
	DeleteEventMine_(mine_02);
	mine_02 <- C_NONE_ID; // �������^�C�~���O�ŏ�����
	
	//��l���̈ʒu��Δ�̑O�ɒu��
	SetPos_(player, Vec3(-2378.438, 278.264, -1488.885));
	SetDir_(player, -117);
	//�J������ݒu
	SetPointCameraEye_("cameye_002");
	SetPointCameraTarget_("camtgt_002");
	Wait_(10);
	
	//�X�L���擾���ʏ���
	SkillStelePerformance(g_ranaruta_stele, ABILITY_RANARUTA);
	
	SetEventFlg_("BFG_EXAMINE_RANARUTA_STELE", true);
	// �Δ�A�C�R���������Ȃ�����
	SetNaviMapIconVisible_(icon_stone_01, false);
	// �v���C���[���Z�̉���
	AddPlayerAbility_(PLAYERABILITYID.RANARUTA);
	
	//�t�F�[�h�C��
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		���Z�擾�f��( ���i���I�� )
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uPlayableDemoRanarionStele()
{
	// �v���C���[ID
	local player = GetPlayerId_();
	
	DeleteEventMine_(mine_03);
	mine_03 <- C_NONE_ID; // �������^�C�~���O�ŏ�����
	
	//��l���̈ʒu��Δ�̑O�ɒu��
	SetPos_(player, Vec3(2072.970, 109.526, -2109.259));
	SetDir_(player, 148);
	//�J������ݒu
	SetPointCameraEye_("cameye_003");
	SetPointCameraTarget_("camtgt_003");
	Wait_(10);
	
	//�X�L���擾���ʏ���
	SkillStelePerformance(g_ranarion_stele, ABILITY_RANARION);
	
	SetEventFlg_("BFG_EXAMINE_RANARION_STELE", true);
	// �Δ�A�C�R���������Ȃ�����
	SetNaviMapIconVisible_(icon_stone_02, false);
	// �v���C���[���Z�̉���
	AddPlayerAbility_(PLAYERABILITYID.RANARION);
	
	//�t�F�[�h�C��
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		���Z�擾�f��( �C���[�W�`�F���W )
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uPlayableDemoColorChangeStele()
{
	// �v���C���[ID
	local player = GetPlayerId_();
	
	DeleteEventMine_(mine_06);
	mine_06 <- C_NONE_ID; // �������^�C�~���O�ŏ�����
	
	//��l���̈ʒu��Δ�̑O�ɒu��
	SetPos_(player, Vec3(-34.566, 42.413, -2615.786));
	SetDir_(player, -135);
	//�J������ݒu
	SetPointCameraEye_("cameye_001");
	SetPointCameraTarget_("camtgt_001");
	Wait_(10);
	
	//�X�L���擾���ʏ���
	SkillStelePerformance(g_makeup_stele, ABILITY_MAKE_UP);
	
	SetEventFlg_("BFG_EXAMINE_MAKE_UP_STELE", true);
	// �Δ�A�C�R���������Ȃ�����
	SetNaviMapIconVisible_(icon_stone_03, false);
	// �v���C���[���Z�̉���
	AddPlayerAbility_(PLAYERABILITYID.COLOR_CHANGE);
	
	//�t�F�[�h�C��
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
}

