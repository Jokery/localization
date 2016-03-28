//===================== S02_00�C�b�^�u���č� 1F ====================

// �ϐ���`
main_num	 <- C_NONE_ID;
prison_num	 <- C_NONE_ID;

str_num_sub <- "NUM_SCENARIO_SUB_PRISON";

//------------------------------------------------
//		�퓬�I����
//------------------------------------------------
function AfterBattle()
{
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");
	prison_num	 = GetNumFlg_("NUM_SCENARIO_SUB_PRISON");
	
	/*
		�����Ȃ�
	*/
	
	EventEnd_();
}


//------------------------------------------------
//		�}�b�v�ɓ���O
//------------------------------------------------
function BeforeInitMap()
{
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");
	prison_num	 = GetNumFlg_("NUM_SCENARIO_SUB_PRISON");
	
	/*
		�����Ȃ�
	*/
	
	EventEnd_();
}


//------------------------------------------------
//		�t�F�[�h�A�E�g��
//------------------------------------------------
function FadeIn()
{
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");			// Num0
	prison_num	 = GetNumFlg_("NUM_SCENARIO_SUB_PRISON");	// Num6
	
	DebugPrint("NUM_SCENARIO_MAIN �̒l�� " + main_num + " �ɂȂ�܂����B");
	DebugPrint("NUM_SCENARIO_SUB_PRISON �̒l�� " + prison_num + " �ɂȂ�܂����B");
	
	// ���}�b�v���B�t���O
	SetEventFlg_("BFG_ARRIVE_AT_S02", true);				// Bit_95 ���B�t���O �C�b�^�u���č�

	// �����X�^�[���o��������ŏ�������ݒ�(���P�ʂ�1=10cm)
	SetMonsterGenPlayerInvasionAreaMin_(-1)	// �������f�t�H���g�l�ɖ߂�
	
	//----------
	// ��NPC�z�u
	//----------
	// ID������
	g_npc_prizoner_a	 <- C_NONE_ID;
	g_npc_prizoner_b	 <- C_NONE_ID;
	g_npc_prizoner_c	 <- C_NONE_ID;
	g_npc_prizoner_d	 <- C_NONE_ID;
	g_npc_jailer_a		 <- C_NONE_ID;
	g_npc_jailer_b		 <- C_NONE_ID;
	g_npc_jailer_c		 <- C_NONE_ID;
	g_npc_jailer_d		 <- C_NONE_ID;
	g_npc_rukiya		 <- C_NONE_ID;
	
	// ���\�[�X�ǂݍ���
	local id_togejobo	 = ReadNpc_("m127_02");		// �Ƃ��W���{�[
	local id_saboten	 = ReadNpc_("m064_00");		// �T�{�e���{�[��
	local id_dessert	 = ReadNpc_("m132_01");		// �f�U�[�g�^���N
	local id_samayou	 = ReadNpc_("m111_00");		// ���܂悤��낢
	local id_sli_knight	 = ReadNpc_("m008_00");		// �X���C���i�C�g
	local id_ookizuchi	 = ReadNpc_("m035_00");		// �������Â�
	local id_gaikotu	 = ReadNpc_("m101_00");		// ��������
	local id_rukiya		 = ReadNpc_("n009");		// ���L��
	
	// �����l�`
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_RUKIYA_NEWS")) {					// Num6 < 9
			g_npc_prizoner_a = ArrangePointNpc_(id_togejobo, "npc_prisoner_a000");
			SetScaleSilhouette(g_npc_prizoner_a, SCALE.SABOTENBOUL ,SILHOUETTE_WIDTH.SABOTENBOUL);
			SetReactorMsg_(g_npc_prizoner_a, "REC_NPC_PRIZONER");
			SetTalkTurn_(g_npc_prizoner_a, false);	// �b�������Ă��U������Ȃ�
			local down = ReadMotion_(g_npc_prizoner_a, "m127_01_down_heavy_L");	//��������L
			SetMotion_(g_npc_prizoner_a, down, BLEND_N);
		}
		else if (prison_num < GetFlagID_("CONST_SS_PR_DEVIL_REMODELING")) {			// Num6 < 11
			g_npc_prizoner_a = ArrangePointNpc_(id_togejobo, "npc_prisoner_a001");
			SetScaleSilhouette(g_npc_prizoner_a, SCALE.SABOTENBOUL ,SILHOUETTE_WIDTH.SABOTENBOUL);
			SetReactorMsg_(g_npc_prizoner_a, "REC_NPC_PRIZONER");
		}
	}
	
	// �����l�a
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_BLAST_STRATEGY")) {				// Num6 < 20
			g_npc_prizoner_b = ArrangePointNpc_(id_saboten, "npc_prisoner_b000");
			SetScaleSilhouette(g_npc_prizoner_b, SCALE.SABOTENBOUL ,SILHOUETTE_WIDTH.SABOTENBOUL);
			SetReactorMsg_(g_npc_prizoner_b, "REC_NPC_PRIZONER");
		}
	}
	
	// �����l�b
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_BLAST_STRATEGY")) {				// Num6 < 20
			g_npc_prizoner_c = ArrangePointNpc_(id_dessert, "npc_prisoner_c000");
			SetScaleSilhouette(g_npc_prizoner_c, SCALE.DEZATOTANKU ,SILHOUETTE_WIDTH.DEZATOTANKU);
			SetReactorMsg_(g_npc_prizoner_c, "REC_NPC_PRIZONER");
		}
	}
	
	// �����l�c
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_BLAST_STRATEGY")) {				// Num6 < 20
			g_npc_prizoner_d = ArrangePointNpc_(id_saboten, "npc_prisoner_d000");
			SetScaleSilhouette(g_npc_prizoner_d, SCALE.SABOTENBOUL ,SILHOUETTE_WIDTH.SABOTENBOUL);
			SetReactorMsg_(g_npc_prizoner_d, "REC_NPC_PRIZONER");
		}
	}
	
	// ���Ŏ�`
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_MEETING_01")) {					// Num6 < 12
			g_npc_jailer_a = ArrangePointNpc_(id_samayou, "npc_jailer_a000");
			SetScaleSilhouette(g_npc_jailer_a, SCALE.N ,SILHOUETTE_WIDTH.N);
			SetReactorMsg_(g_npc_jailer_a, "REC_NPC_SAMAYOUYOROI");
		}
	}
	
	// ���Ŏ�a
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_MEETING_01")) {					// Num6 < 12
			g_npc_jailer_b = ArrangePointNpc_(id_sli_knight, "npc_jailer_b000");
			SetScaleSilhouette(g_npc_jailer_b, SCALE.N ,SILHOUETTE_WIDTH.N);
			SetReactorMsg_(g_npc_jailer_b, "REC_NPC_SLYMKNAIGHT");
		}
	}
	
	// ���Ŏ�b
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_MEETING_01")) {					// Num6 < 12
			g_npc_jailer_c = ArrangePointNpc_(id_ookizuchi, "npc_jailer_c000");
			SetScaleSilhouette(g_npc_jailer_c, SCALE.N ,SILHOUETTE_WIDTH.N);
			SetReactorMsg_(g_npc_jailer_c, "REC_NPC_OOKIDUTI");
		}
	}
	
	// ���Ŏ�c
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_MEETING_01")) {					// Num6 < 12
			g_npc_jailer_d = ArrangePointNpc_(id_gaikotu, "npc_jailer_d000");
			SetScaleSilhouette(g_npc_jailer_d, SCALE.N ,SILHOUETTE_WIDTH.N);
			SetReactorMsg_(g_npc_jailer_d, "REC_NPC_GAIKOTU");
		}
	}
	
	// �����L��
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_ITTABURU_INTERFERENCE")) {			// Num6 < 21
			// �z�u���Ȃ�
		}
		else if (prison_num < GetFlagID_("CONST_SS_PR_REMACHI_ITTABURU")) {			// Num6 < 25
			g_npc_rukiya = ArrangePointNpc_(id_rukiya, "npc_rukiya000");
			SetTalkCameraType_(g_npc_rukiya, TALK_CAMERA_UP);//�J�����̐ݒ�
			SetReactorMsg_(g_npc_rukiya, "REC_NPC_RUKIYA");
			// ��b�J�������ɓ��߂����̂ŃA���t�@�l��ݒ肷��
			SetManualCalcAlpha_(g_npc_rukiya, true);
			SetAlpha_(g_npc_rukiya, 1.0);
		}
	}
	
	//-----------
	// ���n���z�u
	//-----------
	// BitFlag�擾
	local bit_get_water			 = GetEventFlg_("BFG_GET_DIRTY_WATER");			// Bit_1201 �����������
	local bit_show_proof		 = GetEventFlg_("BFG_SHOW_PROOF_OF_JAILER");	// Bit_1203 �Ŏ�̂�������������
	local bit_get_jail_key		 = GetEventFlg_("BFG_GET_KEY_OF_JAIL");			// Bit_1204 �낤��̃J�M�����
	local bit_jail_break_west_1	 = GetEventFlg_("BFG_CHECK_WEST_1");
	local bit_jail_break_west_2	 = GetEventFlg_("BFG_RELEASE_PRISONER_B");		// Bit_1206 ���l�a���
	local bit_jail_break_west_3	 = GetEventFlg_("BFG_CHECK_WEST_3");
	local bit_jail_break_west_4	 = GetEventFlg_("BFG_RELEASE_PRISONER_C");		// Bit_1207 ���l�b���
	local bit_jail_break_west_5	 = GetEventFlg_("BFG_CHECK_WEST_5");
	local bit_jail_break_west_6	 = GetEventFlg_("BFG_CHECK_WEST_6");
	local bit_jail_break_est_1	 = GetEventFlg_("BFG_CHECK_EAST_1");
	local bit_jail_break_est_3	 = GetEventFlg_("BFG_CHECK_EAST_3");
	local bit_jail_break_est_4	 = GetEventFlg_("BFG_CHECK_EAST_4");
	local bit_jail_break_est_5	 = GetEventFlg_("BFG_RELEASE_PRISONER_D");		// Bit_1208 ���l�c���
	local bit_jail_break_est_6	 = GetEventFlg_("BFG_CHECK_EAST_6");
	
	// ID������
	g_mine_bed				 <- C_NONE_ID;
	g_mine_ruler_point		 <- C_NONE_ID;
	g_mine_dirty_water		 <- C_NONE_ID;
	g_mine_demo418			 <- C_NONE_ID;
	g_mine_rukiya_doll		 <- C_NONE_ID;
	g_mine_no_entry			 <- C_NONE_ID;
	g_mine_no_entry02		 <- C_NONE_ID;
	g_mine_jail_break_west_1 <- C_NONE_ID;
	g_mine_jail_break_west_2 <- C_NONE_ID;
	g_mine_jail_break_west_3 <- C_NONE_ID;
	g_mine_jail_break_west_4 <- C_NONE_ID;
	g_mine_jail_break_west_5 <- C_NONE_ID;
	g_mine_jail_break_west_6 <- C_NONE_ID;
	g_mine_jail_break_est_1	 <- C_NONE_ID;
	g_mine_jail_break_est_3_0 <- C_NONE_ID;
	g_mine_jail_break_est_3_1 <- C_NONE_ID;
	g_mine_jail_break_est_4	 <- C_NONE_ID;
	g_mine_jail_break_est_5	 <- C_NONE_ID;
	g_mine_jail_break_est_6	 <- C_NONE_ID;
	g_mine_tunnel01			 <- C_NONE_ID;
	g_mine_tunnel02			 <- C_NONE_ID;
	g_mine_elevator			 <- C_NONE_ID;
	g_mine_jail_break_est_2_0 <- C_NONE_ID;
	g_mine_jail_break_est_2_1 <- C_NONE_ID;
	
	// ���x�b�h
	g_mine_bed = SetPointCircleEventMine_("mine_bed", true);
		
	// ��������
	if (!bit_get_water) {
		g_mine_dirty_water = SetPointCircleEventMine_("mine_dirty_water", true);
	}
	
	// ����
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_RUKIYA_NEWS")) {					// Num6 < 9
			// �ݒu���Ȃ�
		} else {
			g_mine_tunnel01 = SetPointBoxEventMine_("mine_tunnel_01", true);
			g_mine_tunnel02 = SetPointBoxEventMine_("mine_tunnel_02", true);
		}
	} else {
		g_mine_tunnel01 = SetPointBoxEventMine_("mine_tunnel_01", true);
		g_mine_tunnel02 = SetPointBoxEventMine_("mine_tunnel_02", true);
	}
	
	// ��Demo418�N���n��
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_BATTLE_ITTABURU_LOSE")) {			// Num6 = 23
			g_mine_demo418 = SetPointBoxEventMine_("mine_demo418", false);
		}
	}
	
	// �����L���l�`
	g_mine_rukiya_doll = SetPointCircleEventMine_("mine_rukiya_doll", true);
		
	// ���Ŏ�`�t�߂̐i���֎~
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_DEVIL_REMODELING")) {				// Num6 < 11
			if (!bit_show_proof) {
				g_mine_no_entry = SetPointBoxEventMine_("mine_no_entry", false);
			}
		}
	}
	
	// ���Ŏ�a�t�߂̐i���֎~
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_MEETING_02")) {					// Num6 < 13
			g_mine_no_entry02 = SetPointBoxEventMine_("mine_no_entry02", false);
		}
	}
	
	// ���S���� ���P
	if (!bit_jail_break_est_1) {
		g_mine_jail_break_est_1 = SetPointCircleEventMine_("mine_jail_break_est_1", true);
	}

	// ���S���� ���Q
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_MEETING_01")) {					// Num6 < 12
			g_mine_jail_break_est_2_0 = SetPointBoxEventMine_("mine_jail_break_est_2_0", true);
			g_mine_jail_break_est_2_1 = SetPointBoxEventMine_("mine_jail_break_est_2_1", true);
		}
	}

	// ���S���� ���R�i���l�`�j
	if (!bit_jail_break_est_3) {
		g_mine_jail_break_est_3_0 = SetPointBoxEventMine_("mine_jail_break_est_3_0", true);
		g_mine_jail_break_est_3_1 = SetPointBoxEventMine_("mine_jail_break_est_3_1", true);
	}

	// ���S���� ���S
	if (!bit_jail_break_est_4) {
		g_mine_jail_break_est_4 = SetPointCircleEventMine_("mine_jail_break_est_4", true);
	}

	// ���S���� ���T�i���l�c�j
	if (!bit_jail_break_est_5) {
		g_mine_jail_break_est_5 = SetPointCircleEventMine_("mine_jail_break_est_5", true);
	}

	// ���S���� ���U
	if (!bit_jail_break_est_6) {
		g_mine_jail_break_est_6 = SetPointCircleEventMine_("mine_jail_break_est_6", true);
	}

	// ���S���� ���P
	if (!bit_jail_break_west_1) {
		g_mine_jail_break_west_1 = SetPointCircleEventMine_("mine_jail_break_west_1", true);
	}
	
	// ���S���� ���Q�i���l�a�j
	if (!bit_jail_break_west_2) {
		g_mine_jail_break_west_2 = SetPointCircleEventMine_("mine_jail_break_west_2", true);
	}
	
	// ���S���� ���R
	if (!bit_jail_break_west_3) {
		g_mine_jail_break_west_3 = SetPointCircleEventMine_("mine_jail_break_west_3", true);
	}
	
	// ���S���� ���S�i���l�b�j
	if (!bit_jail_break_west_4) {
		g_mine_jail_break_west_4 = SetPointCircleEventMine_("mine_jail_break_west_4", true);
	}

	// ���S���� ���T
	if (!bit_jail_break_west_5) {
		g_mine_jail_break_west_5 = SetPointCircleEventMine_("mine_jail_break_west_5", true);
	}
	
	// ���S���� ���U
	if (!bit_jail_break_west_6) {
		g_mine_jail_break_west_6 = SetPointCircleEventMine_("mine_jail_break_west_6", true);
	}
	
	// ���G���x�[�^�[�̃}�b�v�`�F���W�n��
	g_mine_elevator = SetPointBoxEventMine_("mine_elevator", true);
	
	//---------------
	// ���M�~�b�N�z�u
	//---------------
	// ID������
	g_rukiya_nukegara		 <- C_NONE_ID;
	g_gmk_elevator_door		 <- C_NONE_ID;
	g_gmk_elevator_lift		 <- C_NONE_ID;
	g_gmk_jail_door_est_1	 <- C_NONE_ID;
	g_gmk_jail_door_est_2	 <- C_NONE_ID;
	g_gmk_jail_door_est_3	 <- C_NONE_ID;
	g_gmk_jail_door_est_4	 <- C_NONE_ID;
	g_gmk_jail_door_est_5	 <- C_NONE_ID;
	g_gmk_jail_door_est_6	 <- C_NONE_ID;
	g_gmk_jail_door_west_1	 <- C_NONE_ID;
	g_gmk_jail_door_west_2	 <- C_NONE_ID;
	g_gmk_jail_door_west_3	 <- C_NONE_ID;
	g_gmk_jail_door_west_4	 <- C_NONE_ID;
	g_gmk_jail_door_west_5	 <- C_NONE_ID;
	g_gmk_jail_door_west_6	 <- C_NONE_ID;
	
	// ���\�[�X�ǂݍ���
	local id_elevator_door	 = ReadGimmick_("o_S02_01");		// �G���x�[�^�[�̔�
	local id_elevator_lift	 = ReadGimmick_("o_S02_00");		// �G���x�[�^�[���t�g
	local id_jail_door		 = ReadGimmick_("o_S02_02");		// �S����

	// �����L���̔��k(�X�p�C�N�w�b�h)
	local id_rukiya_nukegara = ReadGimmick_("o_dem_16");		// ���L���̔��k(�X�p�C�N�w�b�h)
	g_rukiya_nukegara = ArrangePointGimmick_("o_dem_16", id_rukiya_nukegara, "gmk_rukiya_doll");
	SetScaleSilhouette(g_rukiya_nukegara, SCALE.M, SILHOUETTE_WIDTH.M);
	
	// ���G���x�[�^�[�̔�
	g_gmk_elevator_door = ArrangePointGimmick_("o_S02_01", id_elevator_door, "gmk_elevator_door");

	// ���G���x�[�^�[���t�g
	g_gmk_elevator_lift = ArrangePointGimmick_("o_S02_00", id_elevator_lift, "gmk_elevator_lift");
	
	// ���S���� ���P
	if (!bit_jail_break_est_1) {
		g_gmk_jail_door_est_1 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_est_1");
		SetMotion_(g_gmk_jail_door_est_1, MOT_GIMMICK_0, BLEND_N);
	} else {
		g_gmk_jail_door_est_1 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_est_1");
		SetMotion_(g_gmk_jail_door_est_1, MOT_GIMMICK_2, BLEND_N);
		SetGimmickMapHitEnable_(g_gmk_jail_door_est_1, false); // gimmick �̃A�^���𖳌���
	}

	// ���S���� ���Q
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_MEETING_01")) {					// Num6 < 12
			g_gmk_jail_door_est_2 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_est_2");
			SetMotion_(g_gmk_jail_door_est_2, MOT_GIMMICK_4, BLEND_N);
		} else {
			g_gmk_jail_door_est_2 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_est_2");
			SetMotion_(g_gmk_jail_door_est_2, MOT_GIMMICK_2, BLEND_N);
			SetGimmickMapHitEnable_(g_gmk_jail_door_est_2, false); // gimmick �̃A�^���𖳌���
		}
	} else {
		g_gmk_jail_door_est_2 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_est_2");
		SetMotion_(g_gmk_jail_door_est_2, MOT_GIMMICK_2, BLEND_N);
		SetGimmickMapHitEnable_(g_gmk_jail_door_est_2, false); // gimmick �̃A�^���𖳌���
	}

	// ���S���� ���R�i���l�`�j
	if (!bit_jail_break_est_3) {
		g_gmk_jail_door_est_3 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_est_3");
		SetMotion_(g_gmk_jail_door_est_3, MOT_GIMMICK_0, BLEND_N);
	} else {
		g_gmk_jail_door_est_3 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_est_3");
		SetMotion_(g_gmk_jail_door_est_3, MOT_GIMMICK_2, BLEND_N);
		SetGimmickMapHitEnable_(g_gmk_jail_door_est_3, false); // gimmick �̃A�^���𖳌���
	}

	// ���S���� ���S
	if (!bit_jail_break_est_4) {
		g_gmk_jail_door_est_4 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_est_4");
		SetMotion_(g_gmk_jail_door_est_4, MOT_GIMMICK_0, BLEND_N);
	} else {
		g_gmk_jail_door_est_4 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_est_4");
		SetMotion_(g_gmk_jail_door_est_4, MOT_GIMMICK_2, BLEND_N);
		SetGimmickMapHitEnable_(g_gmk_jail_door_est_4, false); // gimmick �̃A�^���𖳌���
	}

	// ���S���� ���T�i���l�b�j
	if (!bit_jail_break_est_5) {
		g_gmk_jail_door_est_5 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_est_5");
		SetMotion_(g_gmk_jail_door_est_5, MOT_GIMMICK_0, BLEND_N);
	} else {
		g_gmk_jail_door_est_5 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_est_5");
		SetMotion_(g_gmk_jail_door_est_5, MOT_GIMMICK_2, BLEND_N);
		SetGimmickMapHitEnable_(g_gmk_jail_door_est_5, false); // gimmick �̃A�^���𖳌���
	}

	// ���S���� ���U
	if (!bit_jail_break_est_6) {
		g_gmk_jail_door_est_6 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_est_6");
		SetMotion_(g_gmk_jail_door_est_6, MOT_GIMMICK_0, BLEND_N);
	} else {
		g_gmk_jail_door_est_6 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_est_6");
		SetMotion_(g_gmk_jail_door_est_6, MOT_GIMMICK_2, BLEND_N);
		SetGimmickMapHitEnable_(g_gmk_jail_door_est_6, false); // gimmick �̃A�^���𖳌���
	}

	// ���S���� ���P
	if (!bit_jail_break_west_1) {
		g_gmk_jail_door_west_1 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_west_1");
		SetMotion_(g_gmk_jail_door_west_1, MOT_GIMMICK_0, BLEND_N);
	} else {
		g_gmk_jail_door_west_1 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_west_1");
		SetMotion_(g_gmk_jail_door_west_1, MOT_GIMMICK_2, BLEND_N);
		SetGimmickMapHitEnable_(g_gmk_jail_door_west_1, false); // gimmick �̃A�^���𖳌���
	}

	// ���S���� ���Q�i���l�a�j
	if (!bit_jail_break_west_2) {
		g_gmk_jail_door_west_2 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_west_2");
		SetMotion_(g_gmk_jail_door_west_2, MOT_GIMMICK_0, BLEND_N);
	} else {
		g_gmk_jail_door_west_2 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_west_2");
		SetMotion_(g_gmk_jail_door_west_2, MOT_GIMMICK_2, BLEND_N);
		SetGimmickMapHitEnable_(g_gmk_jail_door_west_2, false); // gimmick �̃A�^���𖳌���
	}

	// ���S���� ���R
	if (!bit_jail_break_west_3) {
		g_gmk_jail_door_west_3 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_west_3");
		SetMotion_(g_gmk_jail_door_west_3, MOT_GIMMICK_0, BLEND_N);
	} else {
		g_gmk_jail_door_west_3 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_west_3");
		SetMotion_(g_gmk_jail_door_west_3, MOT_GIMMICK_2, BLEND_N);
		SetGimmickMapHitEnable_(g_gmk_jail_door_west_3, false); // gimmick �̃A�^���𖳌���
	}

	// ���S���� ���S�i���l�c�j
	if (!bit_jail_break_west_4) {
		g_gmk_jail_door_west_4 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_west_4");
		SetMotion_(g_gmk_jail_door_west_4, MOT_GIMMICK_0, BLEND_N);
	} else {
		g_gmk_jail_door_west_4 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_west_4");
		SetMotion_(g_gmk_jail_door_west_4, MOT_GIMMICK_2, BLEND_N);
		SetGimmickMapHitEnable_(g_gmk_jail_door_west_4, false); // gimmick �̃A�^���𖳌���
	}
	
	// ���S���� ���T
	if (!bit_jail_break_west_5) {
		g_gmk_jail_door_west_5 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_west_5");
		SetMotion_(g_gmk_jail_door_west_5, MOT_GIMMICK_0, BLEND_N);
	} else {
		g_gmk_jail_door_west_5 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_west_5");
		SetMotion_(g_gmk_jail_door_west_5, MOT_GIMMICK_2, BLEND_N);
		SetGimmickMapHitEnable_(g_gmk_jail_door_west_5, false); // gimmick �̃A�^���𖳌���
	}

	// ���S���� ���U
	if (!bit_jail_break_west_6) {
		g_gmk_jail_door_west_6 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_west_6");
		SetMotion_(g_gmk_jail_door_west_6, MOT_GIMMICK_0, BLEND_N);
	} else {
		g_gmk_jail_door_west_6 = ArrangePointGimmick_("o_S02_02", id_jail_door, "gmk_jail_door_west_6");
		SetMotion_(g_gmk_jail_door_west_6, MOT_GIMMICK_2, BLEND_N);
		SetGimmickMapHitEnable_(g_gmk_jail_door_west_6, false); // gimmick �̃A�^���𖳌���
	}

	//-------------------------
	// �����A�N�^�[�|�C���g�z�u
	//-------------------------
	// ���^���p�G���x�[�^�[
	local reactorPoint01 = ArrangeMsgReactorPoint("recpoint_01_erevator", GetFlagID_("BFG_REACTER_POINT_075")// Bit_1574 �^���p�G���x�[�^�[
		, SHORT_DIST, "REC_POINT_01", "REC_POINT_01_2");

	//-------------------------
	// ���i�r�}�b�v�A�C�R���z�u
	//-------------------------
	// ID������
	g_exclamation01	 <- C_NONE_ID;
	g_exclamation03	 <- C_NONE_ID;
	g_exclamation04	 <- C_NONE_ID;
	g_exclamation06	 <- C_NONE_ID;
	g_exclamation09	 <- C_NONE_ID;
	g_exclamation11	 <- C_NONE_ID;

	// ���u�I�v
	if (!bit_get_water) {
		g_exclamation03 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "mine_dirty_water");  // ������
	}

	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_RUKIYA_NEWS")) {					// Num6 = 9
			g_exclamation01 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "gmk_rukiya_doll"); // ���L���̔����k
			g_exclamation04 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "navi_icon_ana");  // ��
		}
	}

	if (bit_get_jail_key == true) {
		if (!bit_jail_break_est_5) {
			g_exclamation06 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "navi_icon_est_5");	// �S���� ���T�i���l�b�j
		}
		if (!bit_jail_break_west_2) {
			g_exclamation09 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "navi_icon_west_2");	// �S���� ���Q�i���l�a�j
		}
		if (!bit_jail_break_west_4) {
			g_exclamation11 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "navi_icon_west_4");	// �S���� ���S�i���l�c�j
		}
	}
	
	// ���G���x�[�^�[�̃}�b�v�`�F���W���̃t���O�𗧂Ă�
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_INVULNERABILITY_PLAYER")) {		// Num6 < 28
			SetEventFlg_("BFG_LIMIT_3F_CENTER_PATHWAY", false);				// Bit_1226 �C�b�^�u�����j�i�����̒ʘH���ӂɃ����X�^�[��z�u�j
		} else {
			SetEventFlg_("BFG_LIMIT_3F_CENTER_PATHWAY", true);				// Bit_1226 �C�b�^�u�����j�i�����̒ʘH���ӂɃ����X�^�[��z�u�j
		}
	} else {
		SetEventFlg_("BFG_LIMIT_3F_CENTER_PATHWAY", true);					// Bit_1226 �C�b�^�u�����j�i�����̒ʘH���ӂɃ����X�^�[��z�u�j
	}
	
	EventEnd_();
}


//------------------------------------------------
//		�t�B�[���h����J�n
//------------------------------------------------
function EventStartOperate()
{
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");			// Num0
	prison_num	 = GetNumFlg_("NUM_SCENARIO_SUB_PRISON");	// Num6
	
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_ITTABURU_PRISON_2ND")) {			// Num6 = 7
			SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_PR_ITTABURU_PRISON_3RD"));	// Num6 <- 8
			SetEventFlg_("BFG_S00_00_EVENT_BGM005_PLAY", true);						// Bit659 : BGM_005 �𗬂����ǂ���
			
			//Demo407[�C�b�^�u���č��ևB]�i�S���j�Đ�
			EventStartChangeDemo(407, FADE_COLOR_BLACK);
		}
		else if (prison_num == GetFlagID_("CONST_SS_PR_MEETING_01")) {				// Num6 = 12
			SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_PR_MEETING_02"));			// Num6 <- 13
			SetEventFlg_("BFG_S02_01_EVENT_BGM007_PLAY", true);						// Bit_663 : S02_01 BGM007�𗬂�
			
			// �f���̕��A�ʒu���f���̊�����ɐݒ肵�܂�
			SetReturnDemoMap_("S02_01"); 
			SetReturnDemoPosDir_(Vec3(271.767, 40.0, -333.316), -90);
			// Demo431[�C�b�^�u���̏W��A�i�QF�j]�Đ�
			EventStartChangeDemo(431, FADE_COLOR_BLACK);
		}
	}
	
	EventEnd_();
}


//------------------------------------------------
//		�m�o�b��b���O
//------------------------------------------------
function BeforeTalkNpc()
{
	local target = GetTargetId_();
	
	//------------------------------------
	// ���C�h���̉�b�J�����I�t�Z�b�g�ݒ�
	//------------------------------------
	// �����L��
	if(target == g_npc_rukiya){
		SetRideTalkCamOffset(OFFSET_RUKIYA);
	}
	
	EventEnd_();
}


//------------------------------------------------
//		�m�o�b�ڐG��
//------------------------------------------------
function TouchNpc()
{
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");			// Num0
	prison_num	 = GetNumFlg_("NUM_SCENARIO_SUB_PRISON");	// Num6
	
	local target = GetTargetId_();
	
	DebugPrint("ID: " + target + " �ɐڐG [TouchNpc]");
	
	switch (target) {
	case g_npc_prizoner_a :
		uTalkPrizonerA();
		break;
	case g_npc_prizoner_b :
		uTalkPrizonerB();
		break;
	case g_npc_prizoner_c :
		uTalkPrizonerC();
		break;
	case g_npc_prizoner_d :
		uTalkPrizonerD();
		break;
	case g_npc_jailer_a :
		uTalkJailerA();
		break;
	case g_npc_jailer_b :
		uTalkJailerB();
		break;
	case g_npc_jailer_c :
		uTalkJailerC();
		break;
	case g_npc_jailer_d :
		uTalkJailerD();
		break;
	case g_npc_rukiya :
		uTalkRukiya();
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
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");
	prison_num	 = GetNumFlg_("NUM_SCENARIO_SUB_PRISON");
	
	local target = GetTouchEventMineId_();
	
	DebugPrint("ID: " + target + " �ɐڐG [TouchEventMine]");
	
	switch (target) {
	case g_mine_bed :
		uMineBed();
		break;
	case g_mine_dirty_water :
		uMineDirtyWater();
		break;
	case g_mine_tunnel01 :
		uMineTunnel01();
		break;
	case g_mine_tunnel02 :
		uMineTunnel02();
		break;
	case g_mine_demo418 :
		uMineDemo418Start();
		break;
	case g_mine_rukiya_doll :
		uMineRukiyaDoll();
		break;
	case g_mine_no_entry :
		uMineNoEntry();
		break;
	case g_mine_no_entry02 :
		uMineNoEntry02();
		break;
	case g_mine_jail_break_est_1 :
		uMineJailBreakEst1();
		break;
	case g_mine_jail_break_est_3_0 :
		uMineJailBreakEst3_0();
		break;
	case g_mine_jail_break_est_3_1 :
		uMineJailBreakEst3_1();
		break;
	case g_mine_jail_break_est_4 :
		uMineJailBreakEst4();
		break;
	case g_mine_jail_break_est_5 :
		uMineJailBreakEst5();
		break;
	case g_mine_jail_break_est_6 :
		uMineJailBreakEst6();
		break;
	case g_mine_jail_break_west_1 :
		uMineJailBreakWest1();
		break;
	case g_mine_jail_break_west_2 :
		uMineJailBreakWest2();
		break;
	case g_mine_jail_break_west_3 :
		uMineJailBreakWest3();
		break;
	case g_mine_jail_break_west_4 :
		uMineJailBreakWest4();
		break;
	case g_mine_jail_break_west_5:
		uMineJailBreakWest5();
		break;
	case g_mine_jail_break_west_6 :
		uMineJailBreakWest6();
		break;
	case g_mine_elevator :
		uMineElevator();
		break;
	case g_mine_jail_break_est_2_0 :
		uMineJailBreakEst2_0();
		break;
	case g_mine_jail_break_est_2_1 :
		uMineJailBreakEst2_1();
		break;
	default :
		DebugPrint("WARNING : MINE_ID���s���ł� [TouchEventMine]");
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
//		���l�` ��b����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkPrizonerA()
{
	local bit_get_water = GetEventFlg_("BFG_GET_DIRTY_WATER");		// Bit_1201 �����������
	
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_RUKIYA_NEWS")) {					// Num6 < 9
			// ����������肵�Ă���
			if (bit_get_water) {
				SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_PR_RUKIYA_NEWS"));		// Num6 <- 9
				
				SetReturnDemoPosDir_(Vec3(238.1, 0, 215.5), -188);
				// Demo408[���L���̏���]�Đ�
				TouchNpcChangeDemo(408);
			}
			// �������𖢓���
			else {
				OpenMsgWnd_();
				ShowMsg_("NPC_PRISONER_A_MSG_060");		// �u�݁c�c�݂�������c�c�B
				KeyInputWait_();
				CloseMsgWnd_();
			}
		}
		else {
			OpenMsgWnd_();
			ShowMsg_("NPC_PRISONER_A_MSG_070");		// �u���L���� �ƂȂ�̘S�� ������Ă����B
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		���l�a ��b����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkPrizonerB()
{
	local bit_jail_break_west_2 = GetEventFlg_("BFG_RELEASE_PRISONER_B");	// Bit_1206 ���l�a���
	
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_MEETING_01")) {					// Num6 < 12
			OpenMsgWnd_();
			ShowMsg_("NPC_PRISONER_B_MSG_070");		// �u���� ���񂽁I �����Ă���I
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (prison_num < GetFlagID_("CONST_SS_PR_BLAST_STRATEGY")) {			// Num6 < 20
			// �S�����J����O
			if (!bit_jail_break_west_2) {
				OpenMsgWnd_();
				ShowMsg_("NPC_PRISONER_B_MSG_080");		// �u���O�c�c���W�X�^���X���I
				KeyInputWait_();
				CloseMsgWnd_();
			}
			// �S�����J������
			else {
				OpenMsgWnd_();
				ShowMsg_("NPC_PRISONER_B_MSG_110");		// �u�o���āc�c�����̂��H
				KeyInputWait_();
				CloseMsgWnd_();
			}
		}
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		���l�b ��b����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkPrizonerC()
{
	local bit_jail_break_west_4 = GetEventFlg_("BFG_RELEASE_PRISONER_C");	// Bit_1207 ���l�b���
	
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_MEETING_01")) {					// Num6 < 12
			OpenMsgWnd_();
			ShowMsg_("NPC_PRISONER_C_MSG_070");		// �u���q�� ���C�ɂ��Ă��邾�낤���c�c�B
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (prison_num < GetFlagID_("CONST_SS_PR_BLAST_STRATEGY")) {			// Num6 < 20
			// �S�����J����O
			if (!bit_jail_break_west_4) {
				OpenMsgWnd_();
				ShowMsg_("NPC_PRISONER_C_MSG_080");		// �u�Ȃ�Ȃ� ���̋��\�� �o�P���m�����́c�c�H
				KeyInputWait_();
				CloseMsgWnd_();
			}
			// �S�����J������
			else {
				OpenMsgWnd_();
				ShowMsg_("NPC_PRISONER_C_MSG_110");		// �u���c�c���肪�����I
				KeyInputWait_();
				CloseMsgWnd_();
			}
		}
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		���l�c ��b����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkPrizonerD()
{
	local bit_jail_break_est_5 = GetEventFlg_("BFG_RELEASE_PRISONER_D");	// Bit_1208 ���l�c���
	
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_MEETING_01")) {					// Num6 < 12
			OpenMsgWnd_();
			ShowMsg_("NPC_PRISONER_D_MSG_070");		// �u������ �C�b�^�u���� �A���Ă�����
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (prison_num < GetFlagID_("CONST_SS_PR_BLAST_STRATEGY")) {			// Num6 < 20
			// �S�����J����O
			if (!bit_jail_break_est_5) {
				OpenMsgWnd_();
				ShowMsg_("NPC_PRISONER_D_MSG_080");		// �u���� �ǂ��Ă�݂������ȁH
				KeyInputWait_();
				CloseMsgWnd_();
			}
			// �S�����J������
			else {
				OpenMsgWnd_();
				ShowMsg_("NPC_PRISONER_D_MSG_110");		// �u��������Ȃ� �I�����s���B
				KeyInputWait_();
				CloseMsgWnd_();
			}
		}
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�Ŏ�` ��b����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkJailerA()
{
	local bit_get_jailer = GetEventFlg_("BFG_GET_PROOF_OF_JAILER");			// Bit_1202 �Ŏ�̂����������
	local bit_show_proof = GetEventFlg_("BFG_SHOW_PROOF_OF_JAILER");		// Bit_1203 �Ŏ�̂�������������
	
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_DEVIL_REMODELING")) {				// Num6 < 11
			// �u�Ŏ�̂������v��������O
			if(!bit_show_proof) {
				OpenMsgWnd_();
				ShowMsg_("NPC_JAILER_A_MSG_070");		// �u�Ȃ� ���O�́H ���l�ł� �Ȃ��̂��H
				KeyInputWait_();
				
				// �u�͂��v
				if (GetQueryResult_() == QUERY2_0) {
					// �u�Ŏ�̂������v����O
					if (!bit_get_jailer) {
						ShowMsg_("NPC_JAILER_A_MSG_072");	// �u�E�\�����ȁI �Ŏ�̂�������
						KeyInputWait_();
						CloseMsgWnd_();
						
						uReturnStartPoint();
					}
					// �u�Ŏ�̂������v�����
					else {
						SetEventFlg_("BFG_SHOW_PROOF_OF_JAILER", true);		// Bit_1203 �Ŏ�̂�������������
						DeleteEventMine_(g_mine_no_entry);
						
						OpenMsgWnd_();
						ShowMsg_("NPC_JAILER_A_MSG_073");		// �u�������� �Ŏ�̂������������Ă݂�I
						KeyInputWait_();
						CloseMsgWnd_();
					}
				}
				// �u�������v
				else {
					ShowMsg_("NPC_JAILER_A_MSG_071");	// �u�������� ���l���I
					KeyInputWait_();
					CloseMsgWnd_();
					
					uReturnStartPoint();
				}
			}
			// �u�Ŏ�̂������v����������
			else {
				OpenMsgWnd_();
				ShowMsg_("NPC_JAILER_A_MSG_074");		// �u�������� �C�b�^�u�����܂̖��߂�
				KeyInputWait_();
				CloseMsgWnd_();
			}
		} else {
			OpenMsgWnd_();
			ShowMsg_("NPC_JAILER_A_MSG_080");			// �u�ӂށc�c�S�z�̂��������������B
			KeyInputWait_();
			CloseMsgWnd_();
			
			SetEventFlg_("BFG_RIDE_INPUT_PROHIBIT", false);		// Bit_435 ���C�h����֎~�t���O
			SetEventFlg_("BFG_PLAYERABILITY_PROHIBIT", false);	// Bit_456 �v���C���[���Z�֎~�t���O
			SetEventFlg_("BFG_OPEN_PARK_TO_PRISON", true);		// Bit_1210 �A���C�p�[�N�|�č� ���J�ʃt���O 
			
			// BitFlag�擾
			local bit_kigurumi = GetEventFlg_("BFG_PUT_ON_MONSTER_SUIT");	// Bit_24 �L�O���~��ԃt���O

			if (bit_kigurumi) {
				// ��l�� �L�O���~��� ����
				SetEventFlg_("BFG_PUT_ON_MONSTER_SUIT", false);		// Bit_24 �L�O���~��ԃt���O
				SetEventFlg_("BFG_LIMIT_1F_ALL", true);				// Bit_1242 �č��P�K�Ƀ����X�^�[��z�u
				SetEventFlg_("BFG_LIMIT_PRISON_ALL", true);			// Bit_1225 �č��̑S�Ă̊K�Ƀ����X�^�[��z�u
				SetEventFlg_("BFG_LIMIT_NPC_PERIPHERAL", false);	// Bit_1231 �ʘH����NPC����Ƀ����X�^�[��z�u
			}
			
			SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_PR_MEETING_01"));			// Num6 <- 12
			// Demo430[�C�b�^�u���̏W��@�i�PF�j]�Đ�
			StopBgmChangeDemo(430);

		}
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�Ŏ�a ��b����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkJailerB()
{
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_MEETING_01")) {					// Num6 < 12
			OpenMsgWnd_();
			ShowMsg_("NPC_JAILER_B_MSG_070");		// �u���� �M�l�I ����� ������𗣂��ȁI
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�Ŏ�b ��b����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkJailerC()
{
	local bit_get_jailer = GetEventFlg_("BFG_GET_PROOF_OF_JAILER");		// Bit_1202 �Ŏ�̂����������
	
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_MEETING_01")) {					// Num6 < 12
			// �u�Ŏ�̂������v����O
			if (!bit_get_jailer) {
				OpenMsgWnd_();
				ShowMsg_("NPC_JAILER_C_MSG_070");		// �u���O�c�c�₯�Ɏセ������ �V���肩�H
				KeyInputWait_();
				
				// �u�͂��v
				if (GetQueryResult_() == QUERY2_0) {
					ShowMsg_("NPC_JAILER_C_MSG_072");	// �u������ �Ȃ�΂����B
					KeyInputWait_();
					CloseMsgWnd_();
				}
				// �u�������v
				else {
					ShowMsg_("NPC_JAILER_C_MSG_071");	// �u�d���Ȃ��z���ȁc�c�ق� �󂯎��B
					KeyInputWait_();
					CloseMsgWnd_();
					
					AddItemAndMsg(954, 1, true);		// �Ŏ�̂��������菈��
					SetEventFlg_("BFG_GET_PROOF_OF_JAILER", true);		// Bit_1202 �Ŏ�̂����������
				}
			}
			// �u�Ŏ�̂������v�����
			else {
				OpenMsgWnd_();
				ShowMsg_("NPC_JAILER_C_MSG_073");		// �u������ �t���t�����Ă��� ���O�B
				KeyInputWait_();
				CloseMsgWnd_();
			}
		}
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�Ŏ�c ��b����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkJailerD()
{
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_MEETING_01")) {					// Num6 < 12
			OpenMsgWnd_();
			ShowMsg_("NPC_JAILER_D_MSG_070");		// �u�܂������c�c�c�C�ĂȂ����B
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		���L�� ��b����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkRukiya()
{
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_BLAST_STRATEGY")) {				// Num6 < 20
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_RUKIYA");	//���L��
			ShowMsg_("NPC_RUKIYA_MSG_110");		// �u���l�� �S�� ����ł����݂������ˁB
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else {
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_RUKIYA");	//���L��
			ShowMsg_("NPC_RUKIYA_MSG_122");		// �u�����I�@���Ԃ��@����܂�Ȃ���I
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�x�b�h�𒲂ׂ���
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineBed()
{
	local player = GetPlayerId_();
	// �Ó]�����̎�l���̕��A�ʒu�ƌ�����ݒ肷��
	local re_pos = Vec3(181.7, 0.0, 264.5);	// ���A�ʒu���w��
	local re_dir = 180;					// �������w��
	local clear_flag	= GetEventFlg_("BFG_SCENARIO_CLEAR_SAND");		//Bit_44 �č��N���A

	local pos  = Vec3(185.1, 7.5, 295.7);
	uPlayerTurnAroundPos(pos);
	if(clear_flag == true){
		OpenMsgWnd_();
		ShowMsg_("SYSTEM_MSG_997_2");				// �x�b�h���g���� �x�߂������B<query_3_0/>
		KeyInputWait_();

		switch(GetQueryResult_()){
		case QUERY3_0:
		case QUERY3_1:
		// ���܂鏈��
		// �x�ޏ���
			CloseMsgWnd_();
			// �h���̋��ʂ̉񕜏���
			CommTaskInn(re_pos, re_dir, clear_flag, g_mine_bed);
			OpenMsgWnd_();
			ShowMsg_("SYSTEM_MSG_997_4");			// �x�b�h�ŋx��� ���C�ɂȂ����I
			KeyInputWait_();
			CloseMsgWnd_();
			break;
		case QUERY3_2:
		// ��߂鏈��
			ShowMsg_("SYSTEM_MSG_997_3");			// �x�b�h�� �g�����Ƃ���߂��B
			KeyInputWait_();
			CloseMsgWnd_();
			break;
		}
	}
	else{
		OpenMsgWnd_();
		ShowMsg_("SYSTEM_MSG_997");				// �x�b�h���g���� �x�߂������B<query_2_1/>
		KeyInputWait_();

		switch(GetQueryResult_()){
		case QUERY2_0:
		// ���܂鏈��
			CloseMsgWnd_();
			// �h���̋��ʂ̉񕜏���
			CommTaskInn(re_pos, re_dir, clear_flag, g_mine_bed);
			OpenMsgWnd_();
			ShowMsg_("SYSTEM_MSG_997_4");			// �x�b�h�ŋx��� ���C�ɂȂ����I
			KeyInputWait_();
			CloseMsgWnd_();
			break;
		case QUERY2_1:
		// ��߂鏈��
			ShowMsg_("SYSTEM_MSG_997_3");			// �x�b�h�� �g�����Ƃ���߂��B
			KeyInputWait_();
			CloseMsgWnd_();
			break;
		}
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�������𒲂ׂ���
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineDirtyWater()
{
	local player = GetPlayerId_();

	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_RUKIYA_NEWS")) {					// Num6 < 9
			local pos  = Vec3(296.7, 7.5, 302.1);
			uPlayerTurnAroundPos(pos);
	
			OpenMsgWnd_();
			ShowMsg_("SYSTEM_MSG_000");		// �Ȃ�Ƃ� ���߂����� ���� ���܂��Ă���B
			KeyInputWait_();
			CloseMsgWnd_();
			
			// �u�͂��v
			if (GetQueryResult_() == QUERY2_0) {
				SetEventFlg_("BFG_GET_DIRTY_WATER", true);		// Bit_1201 �����������
				DeleteEventMine_(g_mine_dirty_water);
				
				SetNaviMapIconVisible_(g_exclamation03, false);	// �u�I�v�A�C�R��������
				
				OpenMsgWnd_();
				ShowMsg_("SYSTEM_MSG_001");		// ��̂Ђ�� �����Ȃ����ݐ��� ���������B
				KeyInputWait_();
				CloseMsgWnd_();
			}
			// �u�������v
			else{
				// �����Ȃ�
			}
		}
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		������o��𒲂ׂ���
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineTunnel01()
{
	local player = GetPlayerId_();
	local pos  = Vec3(260.0, 0.0, 160.0);

	uPlayerTurnAroundPos(pos);

	OpenMsgWnd_();
	ShowMsg_("SYSTEM_MSG_006");		// �����蔲����ꂻ���� �����J���Ă���B
	KeyInputWait_();
	CloseMsgWnd_();
	
	// �u�͂��v
	if (GetQueryResult_() == QUERY2_0) {
		SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
		SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
		WaitFade_();
		
		SetPos_(player, Vec3(258, 0, 123));
		SetDir_(player, -178);
		Wait_(10);
		
		SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
		SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
		WaitFade_();
	}
	// �u�������v
	else{
		// �����Ȃ�
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		���������𒲂ׂ���
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineTunnel02()
{
	local player = GetPlayerId_();
	local pos  = Vec3(260.0, 0.0, 160.0);

	uPlayerTurnAroundPos(pos);

	OpenMsgWnd_();
	ShowMsg_("SYSTEM_MSG_006");		// �����蔲����ꂻ���� �����J���Ă���B
	KeyInputWait_();
	CloseMsgWnd_();
	
	// �u�͂��v
	if (GetQueryResult_() == QUERY2_0) {
		SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
		SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
		WaitFade_();
		
		SetPos_(player, Vec3(252, 0, 199));
		SetDir_(player, 1);
		Wait_(10);
		
		SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
		SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
		WaitFade_();
	}
	// �u�������v
	else{
		// �����Ȃ�
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		Demo418�N���n���ɐG�ꂽ��
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineDemo418Start()
{
	// �^���f��[�C�b�^�u���Đ폀��]
	// �Ó]
	DeleteEventMine_(g_mine_demo418);
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
	
	local task = Task_RotateToDir_(g_npc_rukiya, -30, ROTATE_EVENT_DEF);
	Wait_(10);
	
	local player = GetPlayerId_();
	SetVisible(player, false);

	SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_PR_PRE_REMACHI_ITTABURU"));		// Num6 <- 24
	
	// �J������ݒu
	SetPointCameraEye_("cameye001");
	SetPointCameraTarget_("camtgt001");
	Wait_(15);
	
	// ���ʂ̃t�F�[�h�C��
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();

	SetMotion_(g_npc_rukiya, "TALKLOOP", BLEND_XL);

	OpenMsgWnd_();
	SetTalkName_("NAME_TAG_RUKIYA");	//���L��
	ShowMsg_("NPC_RUKIYA_MSG_121");		// �u����� �߂��Ă����ˁI �����ł悩�����B
	KeyInputWait_();
	CloseMsgWnd_();
	
	SetMotion_(g_npc_rukiya, "WAIT", BLEND_XL);
	Wait_(15);
	
	// �����X�^�[�̔z�u���Ăэs��
	SetEventFlg_("BFG_LIMIT_1F_ALL", true);	// Bit_1242 �č��P�K�Ƀ����X�^�[��z�u
	//�v���C�A�u���ɕ��A������
	uPlayableReset(0.76, 0.0, -130.17, -180);
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		���L���l�`�𒲂ׂ���
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineRukiyaDoll()
{
	local bit_demo409 = GetEventFlg_("BFG_PLAYED_DEMO409");		// Bit_1236 Demo409[���L���̃k�P�K��]���݂�
	
	CommPlayerTurnAroundObj(g_rukiya_nukegara);
	
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_RUKIYA_NUKEGARA")) {				// Num6 < 10
			if (!bit_demo409){
				SetEventFlg_("BFG_PLAYED_DEMO409", true);		// Bit_1236 Demo409[���L���̃k�P�K��]���݂�
				SetReturnDemoPosDir_(Vec3(263.9, 0, 72.2), -88);
				
				// Demo409[���L���̃k�P�K��]�Đ�
				TouchNpcChangeDemo(409);
			} else {
				OpenMsgWnd_();
				ShowMsg_("SYSTEM_MSG_002");	// ���g�� ���� �����Ă��Ȃ��B
				KeyInputWait_();
				CloseMsgWnd_();
			}
		} else {
			OpenMsgWnd_();
			ShowMsg_("SYSTEM_MSG_002");		// ���g�� ���� �����Ă��Ȃ��B
			KeyInputWait_();
			CloseMsgWnd_();
		}
	} else {
		OpenMsgWnd_();
		ShowMsg_("SYSTEM_MSG_002");			// ���g�� ���� �����Ă��Ȃ��B
		KeyInputWait_();
		CloseMsgWnd_();
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�Ŏ�`�t�߂̐i���֎~�ɐG�ꂽ��
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineNoEntry()
{
	local player = GetPlayerId_();
	local dir = GetDir_(g_npc_jailer_a);
	
	FaceToFaceNpc(g_npc_jailer_a);
	
	local rotateTask = Task_RotateToPosSetMotion_(player, GetPos_(g_npc_jailer_a), ROTATE_EVENT_DEF, MOT_WALK, MOT_WAIT);
	WaitTask(rotateTask);
	
	uTalkJailerA();
	
	rotateTask = Task_RotateToDirSetMotion_(g_npc_jailer_a, dir, 5.7, MOT_WALK, MOT_WAIT);
	WaitTask(rotateTask);
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�Ŏ�a�t�߂̐i���֎~�ɐG�ꂽ��
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineNoEntry02()
{
	local dir = GetDir_(g_npc_jailer_b);
	
	FaceToFaceNpc(g_npc_jailer_b);
	
	OpenMsgWnd_();
	ShowMsg_("NPC_JAILER_B_MSG_070");		// �u���� �M�l�I ����� ������𗣂��ȁI
	KeyInputWait_();
	CloseMsgWnd_();
	
	Task_RotateToDirSetMotion_(g_npc_jailer_b, dir, 5.7, MOT_WALK, MOT_WAIT);
	
	CommPlayerTurnMoveDirWalk(180);
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�S���� ���P�𒲂ׂ���
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineJailBreakEst1()
{
	local player = GetPlayerId_();
	local task = Task_RotateToDirSetMotion_(player, 90, ROTATE_EVENT_DEF, MOT_WALK, MOT_WAIT);
	WaitTask(task);
	// �Ԃ���������
	Wait_(15);

	uTouchJail("BFG_CHECK_EAST_1" , g_mine_jail_break_est_1 , g_gmk_jail_door_est_1);
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�S���� ���Q(�S����)�𒲂ׂ���
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineJailBreakEst2_0()
{
	local player = GetPlayerId_();
	local task = Task_RotateToDirSetMotion_(player, -90, ROTATE_EVENT_DEF, MOT_WALK, MOT_WAIT);
	WaitTask(task);
	// �Ԃ���������
	Wait_(15);

	OpenMsgWnd_();
	ShowMsg_("SYSTEM_MSG_003");		// �d�q���b�N�� ��������Ă���悤���B
	KeyInputWait_();
	CloseMsgWnd_();

	// �u�͂��v
	if (GetQueryResult_() == QUERY2_0) {
		SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
		SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
		WaitFade_();
		
		if (prison_num < GetFlagID_("CONST_SS_PR_RUKIYA_NUKEGARA")) {				// Num6 < 10
			SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_PR_RUKIYA_NUKEGARA"));		// Num6 <- 10
			SetNaviMapIconVisible_(g_exclamation01, false);	//���L���̔����k�́u�I�v�A�C�R��������
			SetNaviMapIconVisible_(g_exclamation04, false);	//���́u�I�v�A�C�R��������
		}
		SetPos_(player, Vec3(123, 0, 49));
		SetDir_(player, -90);
		Wait_(10);
		
		SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
		SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
		WaitFade_();
	}
	// �u�������v
	else {
		// �����Ȃ�
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�S���� ���Q(�S���O)�𒲂ׂ���
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineJailBreakEst2_1()
{
	local player = GetPlayerId_();
	local task = Task_RotateToDirSetMotion_(player, 90, ROTATE_EVENT_DEF, MOT_WALK, MOT_WAIT);
	WaitTask(task);
	// �Ԃ���������
	Wait_(15);

	OpenMsgWnd_();
	ShowMsg_("SYSTEM_MSG_003_2");		// �d�q���b�N�� ��������Ă���悤���B
	KeyInputWait_();
	CloseMsgWnd_();

	// �u�͂��v
	if (GetQueryResult_() == QUERY2_0) {
		SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
		SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
		WaitFade_();
		
		SetPos_(player, Vec3(181, 0, 53.3));
		SetDir_(player, 90);
		Wait_(10);
		
		SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
		SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
		WaitFade_();
	}
	// �u�������v
	else {
		// �����Ȃ�
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�S���� ���R�i���l�`�j�i�S�����j�𒲂ׂ���
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineJailBreakEst3_0()
{
	local player = GetPlayerId_();
	local task = Task_RotateToDirSetMotion_(player, -90, ROTATE_EVENT_DEF, MOT_WALK, MOT_WAIT);
	WaitTask(task);
	// �Ԃ���������
	Wait_(15);

	uTouchJail("BFG_CHECK_EAST_3" , g_mine_jail_break_est_3_0 , g_gmk_jail_door_est_3);
	local bit_get_jail_key = GetEventFlg_("BFG_GET_KEY_OF_JAIL");	// Bit_1204 �낤��̃J�M�����
	if (bit_get_jail_key) {
		DeleteEventMine_(g_mine_jail_break_est_3_1);
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�S���� ���R�i���l�`�j(�S���O)�𒲂ׂ���
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineJailBreakEst3_1()
{
	local player = GetPlayerId_();
	local task = Task_RotateToDirSetMotion_(player, 90, ROTATE_EVENT_DEF, MOT_WALK, MOT_WAIT);
	WaitTask(task);
	// �Ԃ���������
	Wait_(15);

	uTouchJail("BFG_CHECK_EAST_3" , g_mine_jail_break_est_3_1 , g_gmk_jail_door_est_3);
	local bit_get_jail_key = GetEventFlg_("BFG_GET_KEY_OF_JAIL");	// Bit_1204 �낤��̃J�M�����
	if (bit_get_jail_key) {
		DeleteEventMine_(g_mine_jail_break_est_3_0);
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�S���� ���S�𒲂ׂ���
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineJailBreakEst4()
{
	local player = GetPlayerId_();
	local task = Task_RotateToDirSetMotion_(player, 90, ROTATE_EVENT_DEF, MOT_WALK, MOT_WAIT);
	WaitTask(task);
	// �Ԃ���������
	Wait_(15);

	uTouchJail("BFG_CHECK_EAST_4" , g_mine_jail_break_est_4 , g_gmk_jail_door_est_4);
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�S���� ���T�i���l�c�j�𒲂ׂ���
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineJailBreakEst5()
{
	local player = GetPlayerId_();
	local task = Task_RotateToDirSetMotion_(player, 90, ROTATE_EVENT_DEF, MOT_WALK, MOT_WAIT);
	WaitTask(task);
	// �Ԃ���������
	Wait_(15);

	uTouchJail("BFG_RELEASE_PRISONER_D" , g_mine_jail_break_est_5 , g_gmk_jail_door_est_5);	// Bit_1208 ���l�c���
	SetNaviMapIconVisible_(g_exclamation06, false);	// �u�I�v�A�C�R��������
	uNumSetting();
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�S���� ���U�𒲂ׂ���
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineJailBreakEst6()
{
	local player = GetPlayerId_();
	local task = Task_RotateToDirSetMotion_(player, 90, ROTATE_EVENT_DEF, MOT_WALK, MOT_WAIT);
	WaitTask(task);
	// �Ԃ���������
	Wait_(15);

	uTouchJail("BFG_CHECK_EAST_6" , g_mine_jail_break_est_6 , g_gmk_jail_door_est_6);
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�S���� ���P�𒲂ׂ���
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineJailBreakWest1()
{
	local player = GetPlayerId_();
	local task = Task_RotateToDirSetMotion_(player, -90, ROTATE_EVENT_DEF, MOT_WALK, MOT_WAIT);
	WaitTask(task);
	// �Ԃ���������
	Wait_(15);

	uTouchJail("BFG_CHECK_WEST_1" , g_mine_jail_break_west_1 , g_gmk_jail_door_west_1);
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�S���� ���Q�i���l�a�j�𒲂ׂ���
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineJailBreakWest2()
{
	local player = GetPlayerId_();
	local task = Task_RotateToDirSetMotion_(player, -90, ROTATE_EVENT_DEF, MOT_WALK, MOT_WAIT);
	WaitTask(task);
	// �Ԃ���������
	Wait_(15);

	uTouchJail("BFG_RELEASE_PRISONER_B" , g_mine_jail_break_west_2 , g_gmk_jail_door_west_2);	// Bit_1206 ���l�a���
	SetNaviMapIconVisible_(g_exclamation09, false);	// �u�I�v�A�C�R��������
	uNumSetting();
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�S���� ���R�𒲂ׂ���
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineJailBreakWest3()
{
	local player = GetPlayerId_();
	local task = Task_RotateToDirSetMotion_(player, -90, ROTATE_EVENT_DEF, MOT_WALK, MOT_WAIT);
	WaitTask(task);
	// �Ԃ���������
	Wait_(15);

	uTouchJail("BFG_CHECK_WEST_3" , g_mine_jail_break_west_3 , g_gmk_jail_door_west_3);
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�S���� ���S�i���l�b�j�𒲂ׂ���
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineJailBreakWest4()
{
	local player = GetPlayerId_();
	local task = Task_RotateToDirSetMotion_(player, -90, ROTATE_EVENT_DEF, MOT_WALK, MOT_WAIT);
	WaitTask(task);
	// �Ԃ���������
	Wait_(15);

	uTouchJail("BFG_RELEASE_PRISONER_C" , g_mine_jail_break_west_4 , g_gmk_jail_door_west_4);	// Bit_1207 ���l�b���
	SetNaviMapIconVisible_(g_exclamation11, false);	// �u�I�v�A�C�R��������
	uNumSetting();
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�S���� ���T�𒲂ׂ���
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineJailBreakWest5()
{
	local player = GetPlayerId_();
	local task = Task_RotateToDirSetMotion_(player, -90, ROTATE_EVENT_DEF, MOT_WALK, MOT_WAIT);
	WaitTask(task);
	// �Ԃ���������
	Wait_(15);

	uTouchJail("BFG_CHECK_WEST_5" , g_mine_jail_break_west_5 , g_gmk_jail_door_west_5);
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�S���� ���U�𒲂ׂ���
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineJailBreakWest6()
{
	local player = GetPlayerId_();
	local task = Task_RotateToDirSetMotion_(player, -90, ROTATE_EVENT_DEF, MOT_WALK, MOT_WAIT);
	WaitTask(task);
	// �Ԃ���������
	Wait_(15);

	uTouchJail("BFG_CHECK_WEST_6" , g_mine_jail_break_west_6 , g_gmk_jail_door_west_6);
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�S���� �𒲂ׂ���
//------------------------------------------------
//	������	: �S�����J�����t���O
//	������	: �n���h�c
//	��O����	: �M�~�b�N�h�c
//	�߂�l		: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTouchJail(flg , mine , gmk)
{
	local bit_get_jail_key = GetEventFlg_("BFG_GET_KEY_OF_JAIL");	// Bit_1204 �낤��̃J�M�����
	
	if (!bit_get_jail_key) {
		PlaySE_("SE_FLD_054");				// �u�J���Ȃ��S�i�q�̔��vSE
		OpenMsgWnd_();
		ShowMsg_("SYSTEM_MSG_998");		// �J�M�� �������Ă���B
		KeyInputWait_();
		CloseMsgWnd_();
	}
	else {
		PlaySE_("SE_FLD_067");				// �d�q���b�N������+�S�����J��SE
		SetMotion_(gmk, MOT_GIMMICK_1, BLEND_N);
		Wait_(49);
		SetMotion_(gmk, MOT_GIMMICK_2, BLEND_N);
		SetGimmickMapHitEnable_(gmk, false); // gimmick �̃A�^���𖳌���
		
		SetEventFlg_(flg, true);		// �S�����J�����t���O
		DeleteEventMine_(mine);
		
		OpenMsgWnd_();
		ShowMsg_("SYSTEM_MSG_999");		// �낤��̃J�M���g���� �낤���������B
		KeyInputWait_();
		CloseMsgWnd_();
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�C�b�^�u���č��X�^�[�g�n�_�֖߂�
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uReturnStartPoint()
{
	local player = GetPlayerId_();
	local player_pos = Vec3(232, 0, 244);
	local player_rot = -90;
	
	SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();

	PlaySE_("SE_FLD_053");				// ���u�S�i�q�̔��E�d�i�j�vSE

	SetPos_(player, player_pos);
	SetDir_(player, player_rot);
	SetCameraDir_(player_rot);
	Wait_(30);
	
	SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	SetFadeSub_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
	WaitFade_();
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�S���l�~�o���Num�t���O�ݒ�
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uNumSetting()
{
	local bit_jail_break_west_2 = GetEventFlg_("BFG_RELEASE_PRISONER_B");	// Bit_1206 ���l�a���
	local bit_jail_break_west_4 = GetEventFlg_("BFG_RELEASE_PRISONER_C");	// Bit_1207 ���l�b���
	local bit_jail_break_est_5 = GetEventFlg_("BFG_RELEASE_PRISONER_D");	// Bit_1208 ���l�c���
	
	if (bit_jail_break_west_2 && bit_jail_break_west_4 && bit_jail_break_est_5) {
		SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_PR_JAIL_OPEN"));	// Num6 <- 19
		
		local player = GetPlayerId_();
		local Player_touch_reactor = ReadMotion_(player, "Player_touch_reactor");		// ��l����������������遨���A�N�^�[��G��
		local Player_touch_reactor_L = ReadMotion_(player, "Player_touch_reactor_L");	// ��l�����A�N�^�[��G��L

		LoadEffect_("ef732_09_light_reactor_c");								// ���A�N�^�[����
		local isRide = IsPlayerRide_();
		if (!isRide) {
			local efc_player = SetSelectBoneEffect_("ef732_09_light_reactor_c", player, ATTACH_EFFECT1);	// ���A�N�^�[����	

			PlaySE_("SE_DEM_019");		// ���ėp�E���A�N�^�[�R�l�N�e�B�u��M
			Wait_(10);
			SetMotion_(player, Player_touch_reactor, BLEND_L);
			WaitMotion(player);
			SetMotion_(player, Player_touch_reactor_L, BLEND_L);
			Wait_(20);
		} else {
			local efc_player = SetSelectBoneEffectPlayer_("ef732_09_light_reactor_c", PLAYER_MODEL.NORMAL, ATTACH_EFFECT1);
			PlaySE_("SE_DEM_019");		// ���ėp�E���A�N�^�[�R�l�N�e�B�u��M
			Wait_(30);
		}
		OpenConnective("connective_rukiya");
		
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_RUKIYA");	//���L��
		ShowMsg_("NPC_RUKIYA_MSG_110");		// �u���l�� �S�� ����ł����݂������ˁB
		KeyInputWait_();
		CloseMsgWnd_();
		
		CloseConnective();
		// ���A�N�^�[�I�����̋��ʏ���
		CommResetPlayerMotion();
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�G���x�[�^�[�̒n���𒲂ׂ���
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineElevator()
{
	local player = GetPlayerId_();

	CommPlayerTurnAroundObj(g_gmk_elevator_lift);
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {							// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_ITTABURU_WIN")) {				// Num6 < 27
			OpenMsgWnd_();
			ShowMsg_("SYSTEM_MSG_996");				// �i���j�{�^���������Ă� �������Ȃ��B
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else {
			OpenMsgWnd_();
			ShowMsg_("SYSTEM_MSG_995");				//�i���j�G���x�[�^�[�� �����Ă���B
			KeyInputWait_();
			if(GetQueryResult_() == QUERY_YES){
				CloseMsgWnd_();

				DeleteEventMine_(g_mine_elevator);
				// �T�K�Ɉړ�
				ChangeMapPosDir_("S02_04", Vec3(0.7, 30.0, -340.0), 2);
				WaitFade_();
				PlaySE_("SE_FLD_061");	// �G���x�[�^�ňړ�
			}else{
				CloseMsgWnd_();
			}
		}
	}
	else if (main_num > GetFlagID_("CONST_SM_PRISON")) {						// Num0 > 5
		OpenMsgWnd_();
		ShowMsg_("SYSTEM_MSG_995");					//�i���j�G���x�[�^�[�� �����Ă���B
		KeyInputWait_();
		if(GetQueryResult_() == QUERY_YES){
			CloseMsgWnd_();

			DeleteEventMine_(g_mine_elevator);
			// �T�K�Ɉړ�
			ChangeMapPosDir_("S02_04", Vec3(0.7, 30.0, -340.0), 2);
			WaitFade_();
			PlaySE_("SE_FLD_061");	// �G���x�[�^�ňړ�
		}else{
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


