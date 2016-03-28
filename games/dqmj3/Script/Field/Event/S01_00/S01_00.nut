//===================== S01_00�A���C�p�[�N ====================

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
	
	//���C�h��������
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_INVULNERABILITY_PLAYER")) {		// Num6 = 28
			// �C�b�^�u���������1�񂾂������ʂ�Ȃ��悤�ɂ���
			if(GetEventFlg_("BFG_ITTABURU_WINS_AFTER") == false){					// Bit_1241
				SetEventFlg_("BFG_ITTABURU_WINS_AFTER", true);
				SetRideOffStart_();
			}
		}
	}
	
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
	SetEventFlg_("BFG_ARRIVE_AT_S01", true);				// Bit_94 ���B�t���O �A���C�p�[�N

	// �����[���|�C���g(�A���C�p�[�N)
	SetEventFlg_("BFG_RULER_ADD_017", true);				// Bit_217 ���[���ǉ� �A���C�p�[�N
	
	// ���}�b�v�`�F���WNULL�ݒ�i�A���C�p�[�N�|�č��ԁj
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {						// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_ITTABURU_PRISON_1ST")) {	// Num6 < 6
			SetHitEnableMapChangeNull_("w_S02_00ALdr_001", false);	
		}
	}

	// ���}�b�v�`�F���WNULL�ݒ�i�A���C�p�[�N�|�t�B�[���h�ԁj
	local bit_kigurumi = GetEventFlg_("BFG_PUT_ON_MONSTER_SUIT");	// Bit_24 �L�O���~��ԃt���O
	if (bit_kigurumi == true) {
		SetHitEnableMapChangeNull_("w_S00_00ALdr_001", false);	
	}

	
	// ���f��431�Đ���A�A���C�p�[�N�ɓ�����
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {				// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_MEETING_02")) {	// Num6 = 13
			SetEventFlg_("BFG_PLAYED_DEMO431_AFTER_PARK", true);	// Bit_1232 �f��431�Đ���A�A���C�p�[�N�ɓ�����
			SetEventFlg_("BFG_S02_01_EVENT_BGM007_PLAY", false);	// Bit_663  S02_01 BGM�����ɖ߂�
		}
	}
	
	//---------------
	// ���M�~�b�N�z�u
	//---------------
	// ID������
	g_gmk_itta_box		 <- C_NONE_ID;
	g_gmk_reactor		 <- C_NONE_ID;
	
	// ���C�b�^�u���̔�
	if (prison_num < GetFlagID_("CONST_SS_PR_ITTABURU_BOX")) {					// Num6 < 3
		// �z�u���Ȃ�
	}
	else if (prison_num < GetFlagID_("CONST_SS_PR_ITTABURU_PRISON_1ST")) {		// Num6 < 6
		local id_itta_box	 = ReadGimmick_("o_S01_02");		// �S�̔�
		g_gmk_itta_box = ArrangePointGimmick_("o_S01_02", id_itta_box, "gmk_ittaburu_box");
		SetMotion_(g_gmk_itta_box, MOT_GIMMICK_0, BLEND_N);
	}

	// �����L���̃��A�N�^�[
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_INVULNERABILITY_PLAYER")) {		// Num6 = 28
			local id_reactor	 = ReadGimmick_("o_dem_23");		// ���L���̃��A�N�^�[
			g_gmk_reactor = ArrangePointGimmick_("o_dem_23", id_reactor, "mine_reactor");
			SetScale_(g_gmk_reactor, 1.5);	// �����ɂ����̂ŁA1.5�{�ɂ���
			SetMotion_(g_gmk_reactor, MOT_GIMMICK_2, BLEND_N);
		}
	}

	//----------
	// ��NPC�z�u
	//----------
	// ID������
	g_npc_mother		 <- C_NONE_ID;
	g_npc_boy			 <- C_NONE_ID;
	g_npc_aroi_a		 <- C_NONE_ID;
	g_npc_aroi_b		 <- C_NONE_ID;
	g_npc_aroi_c		 <- C_NONE_ID;
	g_npc_aroi_d		 <- C_NONE_ID;
	g_npc_item			 <- C_NONE_ID;
	g_npc_inn			 <- C_NONE_ID;
	g_npc_prizoner_b	 <- C_NONE_ID;
	g_npc_prizoner_c	 <- C_NONE_ID;
	g_npc_prizoner_d	 <- C_NONE_ID;
	
	// ���\�[�X�ǂݍ���
	local id_togejobo	 = ReadNpc_("m127_01");		// �Ƃ��W���{�[
	local id_saboten	 = ReadNpc_("m064_00");		// �T�{�e���{�[��
	local id_dessert	 = ReadNpc_("m132_01");		// �f�U�[�g�^���N
	local id_samayou	 = ReadNpc_("m111_00");		// ���܂悤��낢
	
	// ����e
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
 		if (prison_num < GetFlagID_("CONST_SS_PR_ITTABURU_BOX")) {				// Num6 < 3
			g_npc_mother = ArrangePointNpc_(id_togejobo, "npc_mother000");
			SetScaleSilhouette(g_npc_mother, SCALE.N ,SILHOUETTE_WIDTH.N);
			SetReactorMsg_(g_npc_mother, "REC_NPC_MOTHER");
		}
		else if (prison_num < GetFlagID_("CONST_SS_PR_BOY_WILL_MOTHER_GRIEF")) {	// Num6 < 4
			g_npc_mother = ArrangePointNpc_(id_togejobo, "npc_mother001");
			SetScaleSilhouette(g_npc_mother, SCALE.N ,SILHOUETTE_WIDTH.N);
			SetReactorMsg_(g_npc_mother, "REC_NPC_MOTHER");
			local feel_down = ReadMotion_(g_npc_mother, "m127_01_feel_down_L");// ��e�@��������L
			SetMotion_(g_npc_mother, feel_down, BLEND_N);			// ��e�@��������L
			SetTalkTurn_(g_npc_mother, false);	// �b�������Ă��U������Ȃ�
		}
		else if (prison_num < GetFlagID_("CONST_SS_PR_ITTABURU_PRISON_1ST")) {		// Num6 < 6
			g_npc_mother = ArrangePointNpc_(id_togejobo, "npc_mother001_b");
			SetScaleSilhouette(g_npc_mother, SCALE.N ,SILHOUETTE_WIDTH.N);
			SetReactorMsg_(g_npc_mother, "REC_NPC_MOTHER");
			if (prison_num == GetFlagID_("CONST_SS_PR_BOY_WILL_MOTHER_GRIEF")) {	// Num6 == 4
				local feel_down = ReadMotion_(g_npc_mother, "m127_01_feel_down_L");// ��e�@��������L
				SetMotion_(g_npc_mother, feel_down, BLEND_N);			// ��e�@��������L
			}
		}
		else {
			g_npc_mother = ArrangePointNpc_(id_togejobo, "npc_mother002");
			SetScaleSilhouette(g_npc_mother, SCALE.N ,SILHOUETTE_WIDTH.N);
			SetReactorMsg_(g_npc_mother, "REC_NPC_MOTHER");
		}
	}
	else {
		g_npc_mother = ArrangePointNpc_(id_togejobo, "npc_mother002");
		SetScaleSilhouette(g_npc_mother, SCALE.N ,SILHOUETTE_WIDTH.N);
		SetReactorMsg_(g_npc_mother, "REC_NPC_MOTHER");
	}
	
	// �����N
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_ITTABURU_BOX")) {					// Num6 < 3
			g_npc_boy = ArrangePointNpc_(id_togejobo, "npc_boy000");
			SetScaleSilhouette(g_npc_boy, SCALE.S ,SILHOUETTE_WIDTH.S);
			SetReactorMsg_(g_npc_boy, "REC_NPC_BOY");
		}
		else if (prison_num < GetFlagID_("CONST_SS_PR_SUBSTITUTE_PLAYER")) {		// Num6 < 5
			g_npc_boy = ArrangePointNpc_(id_togejobo, "npc_boy001");
			SetScaleSilhouette(g_npc_boy, SCALE.S ,SILHOUETTE_WIDTH.S);
			SetReactorMsg_(g_npc_boy, "REC_NPC_BOY");
			local feel_down = ReadMotion_(g_npc_boy, "m127_01_feel_down_L");// ���N�@��������L
			SetMotion_(g_npc_boy, feel_down, BLEND_N);			// ���N�@��������L
			SetTalkTurn_(g_npc_boy, false);	// �b�������Ă��U������Ȃ�
		}
		else if (prison_num < GetFlagID_("CONST_SS_PR_ITTABURU_PRISON_1ST")) {		// Num6 < 6
			g_npc_boy = ArrangePointNpc_(id_togejobo, "npc_boy001_b");
			SetScaleSilhouette(g_npc_boy, SCALE.S ,SILHOUETTE_WIDTH.S);
			SetReactorMsg_(g_npc_boy, "REC_NPC_BOY");
		}
		else {
			g_npc_boy = ArrangePointNpc_(id_togejobo, "npc_boy002");
			SetScaleSilhouette(g_npc_boy, SCALE.S ,SILHOUETTE_WIDTH.S);
			SetReactorMsg_(g_npc_boy, "REC_NPC_BOY");
		}
	}
	else {
		g_npc_boy = ArrangePointNpc_(id_togejobo, "npc_boy002");
		SetScaleSilhouette(g_npc_boy, SCALE.S ,SILHOUETTE_WIDTH.S);
		SetReactorMsg_(g_npc_boy, "REC_NPC_BOY");
	}
	
	// ���A���C�p�[�N�Z�l�`�|�c
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num > GetFlagID_("CONST_SS_PR_ALLOY_PARK_RESIDENT")				// Num6 > 2
		&& prison_num < GetFlagID_("CONST_SS_PR_ITTABURU_PRISON_1ST")) {			// Num6 < 6
			g_npc_aroi_a = ArrangePointNpc_(id_saboten, "npc_aroi_a002");
			SetScaleSilhouette(g_npc_aroi_a, SCALE.SABOTENBOUL,SILHOUETTE_WIDTH.SABOTENBOUL);
			SetReactorMsg_(g_npc_aroi_a, "REC_NPC_SABOTENBOUL");
			
			g_npc_aroi_b = ArrangePointNpc_(id_dessert, "npc_aroi_b002");
			SetScaleSilhouette(g_npc_aroi_b, SCALE.DEZATOTANKU,SILHOUETTE_WIDTH.DEZATOTANKU);
			SetReactorMsg_(g_npc_aroi_b, "REC_NPC_DEZATOTANKU");
			
			g_npc_aroi_c = ArrangePointNpc_(id_saboten, "npc_aroi_c002");
			SetScaleSilhouette(g_npc_aroi_c, SCALE.SABOTENBOUL,SILHOUETTE_WIDTH.SABOTENBOUL);
			SetReactorMsg_(g_npc_aroi_c, "REC_NPC_SABOTENBOUL");
			
			g_npc_aroi_d = ArrangePointNpc_(id_dessert, "npc_aroi_d002");
			SetScaleSilhouette(g_npc_aroi_d, SCALE.DEZATOTANKU,SILHOUETTE_WIDTH.DEZATOTANKU);
			SetReactorMsg_(g_npc_aroi_d, "REC_NPC_DEZATOTANKU");
		}
		else {
			g_npc_aroi_a = ArrangePointNpc_(id_saboten, "npc_aroi_a000");
			SetScaleSilhouette(g_npc_aroi_a, SCALE.SABOTENBOUL,SILHOUETTE_WIDTH.SABOTENBOUL);
			SetReactorMsg_(g_npc_aroi_a, "REC_NPC_SABOTENBOUL");
			
			g_npc_aroi_b = ArrangePointNpc_(id_dessert, "npc_aroi_b000");
			SetScaleSilhouette(g_npc_aroi_b, SCALE.DEZATOTANKU,SILHOUETTE_WIDTH.DEZATOTANKU);
			SetReactorMsg_(g_npc_aroi_b, "REC_NPC_DEZATOTANKU");
			
			g_npc_aroi_c = ArrangePointNpc_(id_saboten, "npc_aroi_c000");
			SetScaleSilhouette(g_npc_aroi_c, SCALE.SABOTENBOUL,SILHOUETTE_WIDTH.SABOTENBOUL);
			SetReactorMsg_(g_npc_aroi_c, "REC_NPC_SABOTENBOUL");
			
			g_npc_aroi_d = ArrangePointNpc_(id_dessert, "npc_aroi_d000");
			SetScaleSilhouette(g_npc_aroi_d, SCALE.DEZATOTANKU,SILHOUETTE_WIDTH.DEZATOTANKU);
			SetReactorMsg_(g_npc_aroi_d, "REC_NPC_DEZATOTANKU");
		}
	}
	else {
		g_npc_aroi_a = ArrangePointNpc_(id_saboten, "npc_aroi_a000");
			SetScaleSilhouette(g_npc_aroi_a, SCALE.SABOTENBOUL,SILHOUETTE_WIDTH.SABOTENBOUL);
		SetReactorMsg_(g_npc_aroi_a, "REC_NPC_SABOTENBOUL");
		
		g_npc_aroi_b = ArrangePointNpc_(id_dessert, "npc_aroi_b000");
			SetScaleSilhouette(g_npc_aroi_b, SCALE.DEZATOTANKU,SILHOUETTE_WIDTH.DEZATOTANKU);
		SetReactorMsg_(g_npc_aroi_b, "REC_NPC_DEZATOTANKU");
		
		g_npc_aroi_c = ArrangePointNpc_(id_saboten, "npc_aroi_c000");
			SetScaleSilhouette(g_npc_aroi_c, SCALE.SABOTENBOUL,SILHOUETTE_WIDTH.SABOTENBOUL);
		SetReactorMsg_(g_npc_aroi_c, "REC_NPC_SABOTENBOUL");
		
		g_npc_aroi_d = ArrangePointNpc_(id_dessert, "npc_aroi_d000");
			SetScaleSilhouette(g_npc_aroi_d, SCALE.DEZATOTANKU,SILHOUETTE_WIDTH.DEZATOTANKU);
		SetReactorMsg_(g_npc_aroi_d, "REC_NPC_DEZATOTANKU");
	}
	
	// �����
	g_npc_item = ArrangePointNpc_(id_dessert, "npc_item000");
	SetSearchableAngle_(g_npc_item, SEARCHABLE_ANGLE_MINIMUM);		// ����30�x���� �b�������\
	SetScaleSilhouette(g_npc_item, SCALE.DEZATOTANKU,SILHOUETTE_WIDTH.DEZATOTANKU);
	SetReactorMsg_(g_npc_item, "REC_NPC_DEZATOTANKU");
	SetTalkCameraType_(g_npc_item, TALK_CAMERA_UP);		//�J�����̐ݒ�
	SetTalkCameraEyeOffset_(g_npc_item, 0.0, -20.0);	//�J�����̈ʒu�̒���
	
	// ���h��
	g_npc_inn = ArrangePointNpc_(id_saboten, "npc_inn000");
	SetSearchableAngle_(g_npc_inn, SEARCHABLE_ANGLE_MINIMUM);		// ����30�x���� �b�������\
	SetScaleSilhouette(g_npc_inn, SCALE.SABOTENBOUL,SILHOUETTE_WIDTH.SABOTENBOUL);
	SetReactorMsg_(g_npc_inn, "REC_NPC_SABOTENBOUL");
	SetTalkCameraType_(g_npc_inn, TALK_CAMERA_UP);		//�J�����̐ݒ�
	SetTalkCameraEyeOffset_(g_npc_inn, -3.0, -5.0);		//�J�����̈ʒu�̒���
//	SetTalkCameraTargetOffset_(g_npc_inn, -5.0, 0.0);	//�J�����̈ʒu�̒���
	
	// �����l�a�|�c
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_ITTABURU_WIN")) {					// Num6 < 27
			// �z�u���Ȃ�
		}
		else {
			g_npc_prizoner_b = ArrangePointNpc_(id_saboten, "npc_prisoner_b000");
			SetScaleSilhouette(g_npc_prizoner_b, SCALE.SABOTENBOUL,SILHOUETTE_WIDTH.SABOTENBOUL);
			SetReactorMsg_(g_npc_prizoner_b, "REC_NPC_SABOTENBOUL");

			g_npc_prizoner_c = ArrangePointNpc_(id_dessert, "npc_prisoner_c000");
			SetScaleSilhouette(g_npc_prizoner_c, SCALE.DEZATOTANKU,SILHOUETTE_WIDTH.DEZATOTANKU);
			SetReactorMsg_(g_npc_prizoner_c, "REC_NPC_DEZATOTANKU");

			g_npc_prizoner_d = ArrangePointNpc_(id_saboten, "npc_prisoner_d000");
			SetScaleSilhouette(g_npc_prizoner_d, SCALE.SABOTENBOUL,SILHOUETTE_WIDTH.SABOTENBOUL);
			SetReactorMsg_(g_npc_prizoner_d, "REC_NPC_SABOTENBOUL");
		}
	}
	else {
		g_npc_prizoner_b = ArrangePointNpc_(id_saboten, "npc_prisoner_b000");
		SetScaleSilhouette(g_npc_prizoner_b, SCALE.SABOTENBOUL,SILHOUETTE_WIDTH.SABOTENBOUL);
		SetReactorMsg_(g_npc_prizoner_b, "REC_NPC_SABOTENBOUL");

		g_npc_prizoner_c = ArrangePointNpc_(id_dessert, "npc_prisoner_c000");
		SetScaleSilhouette(g_npc_prizoner_c, SCALE.DEZATOTANKU,SILHOUETTE_WIDTH.DEZATOTANKU);
		SetReactorMsg_(g_npc_prizoner_c, "REC_NPC_DEZATOTANKU");

		g_npc_prizoner_d = ArrangePointNpc_(id_saboten, "npc_prisoner_d000");
		SetScaleSilhouette(g_npc_prizoner_d, SCALE.SABOTENBOUL,SILHOUETTE_WIDTH.SABOTENBOUL);
		SetReactorMsg_(g_npc_prizoner_d, "REC_NPC_SABOTENBOUL");
	}
	
	//-----------
	// ���n���z�u
	//-----------
	// ID������
	g_mine_itta_box		 <- C_NONE_ID;
	g_mine_reactor		 <- C_NONE_ID;
	g_mine_gate			 <- C_NONE_ID;
	g_mine_gate_exit	 <- C_NONE_ID;
	
	// ���C�b�^�u���̔�
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_ITTABURU_BOX")) {					// Num6 < 3
			// �z�u���Ȃ�
		}
		else if (prison_num < GetFlagID_("CONST_SS_PR_ITTABURU_PRISON_1ST")) {		// Num6 < 6
			g_mine_itta_box = SetPointCircleEventMine_("mine_ittaburu_box", true);
		}
	}
	
	// �����L���̃��A�N�^�[
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_INVULNERABILITY_PLAYER")) {		// Num6 = 28
			g_mine_reactor = SetPointCircleEventMine_("mine_reactor", true);
		}
	}
	
	// ���č����̖�
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_ITTABURU_PRISON_1ST")) {			// Num6 < 6
			g_mine_gate = SetPointBoxEventMine_("mine_gate", true);
		}
	}

	// ���t�B�[���h�ւ̖�
	local bit_kigurumi = GetEventFlg_("BFG_PUT_ON_MONSTER_SUIT");	// Bit_24 �L�O���~��ԃt���O
	if (bit_kigurumi == true) {
		g_mine_gate_exit = SetPointBoxEventMine_("mine_gate_exit", true);
	}

	//-------------------------
	// ���i�r�}�b�v�A�C�R���z�u
	//-------------------------
	// ���u�I�v
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_SUBSTITUTE_PLAYER")) {			// Num6 = 5
			local exclamation01 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "gmk_ittaburu_box");  // �C�b�^�u���̔�
		}
	}

	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_INVULNERABILITY_PLAYER")) {		// Num6 = 28
			local exclamation02 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "mine_reactor");  // ���L���̃��A�N�^�[
		}
	}

	//-------------------------
	// �����A�N�^�[�|�C���g�z�u
	//-------------------------
	// ���S�̔�
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_ITTABURU_BOX")) {					// Num6 < 3
			// �z�u���Ȃ�
		}
		else if (prison_num < GetFlagID_("CONST_SS_PR_ITTABURU_PRISON_1ST")) {		// Num6 < 6
			local reactorPoint01 = ArrangeMsgReactorPoint("recPoint_01_box", GetFlagID_("BFG_REACTER_POINT_072")// Bit_1571 �S�̔�
				, SHORT_DIST, "REC_POINT_01", "REC_POINT_01_2");
		}
	}

	// ���č���
	local reactorPoint02 = ArrangeMsgReactorPoint("recPoint_02_door", GetFlagID_("BFG_REACTER_POINT_073")// Bit_1572 �č���
		, SHORT_DIST, "REC_POINT_02", "REC_POINT_02_2");

	// ���R���^���N �i�Q�ƂR�͍폜���ꂽ�̂ŃR�����g���j
	local reactorPoint03_1 = ArrangeMsgReactorPoint("recPoint_03_tank01", GetFlagID_("BFG_REACTER_POINT_074")// Bit_1573 �R���^���N
		, SHORT_DIST, "REC_POINT_03", "REC_POINT_03_2");

	EventEnd_();
}


//------------------------------------------------
//		�t�B�[���h����J�n
//------------------------------------------------
function EventStartOperate()
{
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");			// Num0
	prison_num	 = GetNumFlg_("NUM_SCENARIO_SUB_PRISON");	// Num6
		
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {									// Num0 = 5
		if (prison_num == GetFlagID_("CONST_SS_PR_GO_TO_THE_PRISON")) {					// Num6 = 1
			SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_PR_ALLOY_PARK_RESIDENT"));		// Num6 <- 2
			
			// Demo401[�A���C�p�[�N�̏Z�l����]�Đ�
			EventStartChangeDemo(401, FADE_COLOR_BLACK);
		}
		else if (prison_num == GetFlagID_("CONST_SS_PR_ITTABURU_WIN")) {				// Num6 = 27
			SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_PR_INVULNERABILITY_PLAYER"));	// Num6 <- 28
			
			SetReturnDemoPosDir_(Vec3(-79.189, 0, 25.519), -33);

			// Demo421[�s���g�̎�l��]�Đ�
			EventStartChangeDemo(421, FADE_COLOR_BLACK);
		}
	}

	// ���L�O���~�̒����ւ�����̕�e�̃��b�Z�[�W
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_MEETING_02")) {				// Num6 < 13
			// BitFlag�擾
			local bit_kigurumi_after = GetEventFlg_("BFG_DISPLAYED_MONSTER_MOTHER_MSG");// Bit_1240 �L�O���~����t���O
			if (bit_kigurumi_after) {
				WaitFade_();
				local bit_kigurumi = GetEventFlg_("BFG_PUT_ON_MONSTER_SUIT");		// Bit_24 �L�O���~��ԃt���O
				if (!bit_kigurumi) {
					SetTalkAction_(g_npc_mother);
					OpenMsgWnd_();
					SetTalkName_("NAME_TAG_BOYS_MOTHER");
					ShowMsg_("NPC_MOTHER_MSG_052");		// �u�ł� �L�O���~�� ���������肵�Ă����܂��B
					KeyInputWait_();
					CloseMsgWnd_();

					SetEventFlg_("BFG_DISPLAYED_MONSTER_MOTHER_MSG", false);	// Bit_1240 �L�O���~����t���O
				}
				else {
					SetTalkAction_(g_npc_mother);
					OpenMsgWnd_();
					SetTalkName_("NAME_TAG_BOYS_MOTHER");
					ShowMsg_("NPC_MOTHER_MSG_056");		// �u�ł́c�c���̊i�D��
					KeyInputWait_();
					CloseMsgWnd_();

					SetEventFlg_("BFG_DISPLAYED_MONSTER_MOTHER_MSG", false);	// Bit_1240 �L�O���~����t���O
				}
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
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");			// Num0
	prison_num	 = GetNumFlg_("NUM_SCENARIO_SUB_PRISON");	// Num6
	
	local target = GetTargetId_();
	
	DebugPrint("ID: " + target + " �ɐڐG [TouchNpc]");
	
	switch (target) {
	case g_npc_mother :
		uTalkMother();
		break;
	case g_npc_boy :
		uTalkBoy();
		break;
	case g_npc_aroi_a :
		uTalkAroiA();
		break;
	case g_npc_aroi_b :
		uTalkAroiB();
		break;
	case g_npc_aroi_c :
		uTalkAroiC();
		break;
	case g_npc_aroi_d :
		uTalkAroiD();
		break;
	case g_npc_item :
		uTalkItem();
		break;
	case g_npc_inn :
		uTalkInn();
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
	case g_mine_itta_box :
		uMineIttaburuBox();
		break;
	case g_mine_gate :
		uMineGate();
		break;
	case g_mine_gate_exit :
		uMineGateExit();
		break;
	case g_mine_reactor :
		uMineReactor();
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
//		��e ��b����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkMother()
{
	local sky_num		 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");					// Num9
	local bit_sinario_clesr	 = GetEventFlg_("BFG_SCENARIO_CLEAR_ALL");				// Bit_46 �V�i���I�N���A
	
	if(bit_sinario_clesr == true){							// Bit_46 �V�i���I�N���A
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_BOYS_MOTHER");
		ShowMsg_("NPC_MOTHER_MSG_180");				// �u�܂��I �悭 ���Ă��������܂����B
		KeyInputWait_();
		CloseMsgWnd_();
	}
	else if (main_num == GetFlagID_("CONST_SM_PRISON")) {							// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_ITTABURU_BOX")) {					// Num6 < 3
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_BOYS_MOTHER");
			ShowMsg_("NPC_MOTHER_MSG_010");			// �u�C�b�^�u���� ����I��
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (prison_num < GetFlagID_("CONST_SS_PR_BOY_WILL_MOTHER_GRIEF")) {	// Num6 < 4
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_BOYS_MOTHER");
			ShowMsg_("NPC_MOTHER_MSG_020");			// �u�ǂ����āc�c�E�`�̎q�΂���c�c�I
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (prison_num < GetFlagID_("CONST_SS_PR_SUBSTITUTE_PLAYER")) {		// Num6 < 5
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_BOYS_MOTHER");
			ShowMsg_("NPC_MOTHER_MSG_030");			// �u�c�c�����H ���Ȃ��� ���q�̑����
			KeyInputWait_();
			
			// �u�͂��v
			if (GetQueryResult_() == QUERY2_0) {
				CloseMsgWnd_();
				
				SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_PR_SUBSTITUTE_PLAYER"));	// Num6 <- 5
				SetEventFlg_("BFG_RIDE_INPUT_PROHIBIT", true);			// BIT_435 ���C�h����֎~�t���O
				SetEventFlg_("BFG_PLAYERABILITY_PROHIBIT", true);		// BIT_456 �v���C���[���Z�֎~�t���O
				
				// BitFlag�擾
				local bit_kigurumi = GetEventFlg_("BFG_PUT_ON_MONSTER_SUIT");		// Bit_24 �L�O���~��ԃt���O

				if (!bit_kigurumi) {
					// ��l�� �L�O���~��� �J�n
					SetEventFlg_("BFG_PUT_ON_MONSTER_SUIT", true);		// Bit_24 �L�O���~��ԃt���O
				}
				SetReturnDemoPosDir_(Vec3(-54.38, 0.0, 230.9), 172);
				// Demo404[�݂����͎�l��]�Đ�
				TouchNpcChangeDemo(404);
			}
			// �u�������v
			else {
				ShowMsg_("NPC_MOTHER_MSG_031");		// �u�c�c�󎨂������悤�ł��ˁB���߂�Ȃ����B
				KeyInputWait_();
				CloseMsgWnd_();
			}
		}
		else if (prison_num < GetFlagID_("CONST_SS_PR_MEETING_02")) {				// Num6 < 13
			// BitFlag�擾
			local bit_kigurumi = GetEventFlg_("BFG_PUT_ON_MONSTER_SUIT");		// Bit_24 �L�O���~��ԃt���O

			if (bit_kigurumi) {
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_BOYS_MOTHER");
				ShowMsg_("NPC_MOTHER_MSG_050");		// �u���Ȃ� �܂� ���Ԃ�����܂��B
				KeyInputWait_();
			
				// �u�͂��v
				if (GetQueryResult_() == QUERY2_0) {
					ShowMsg_("NPC_MOTHER_MSG_051");		// �u�����ł����c�c�킩��܂����B
					KeyInputWait_();
					CloseMsgWnd_();
					
					// �Ó]
					SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
					SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
					WaitFade_();

					// BitFlag�ݒ�
					SetEventFlg_("BFG_RIDE_INPUT_PROHIBIT", false);			// BIT_435 ���C�h����֎~�t���O
					SetEventFlg_("BFG_PLAYERABILITY_PROHIBIT", false);		// BIT_456 �v���C���[���Z�֎~�t���O
					SetEventFlg_("BFG_PUT_ON_MONSTER_SUIT", false);			// Bit_24 �L�O���~��ԃt���O
					SetEventFlg_("BFG_DISPLAYED_MONSTER_MOTHER_MSG", true);	// Bit_1240 �L�O���~����t���O

					PlaySE_("SE_DEM_076");

					ChangeMapPosDir_("S01_00", Vec3(-29.14, 0.0, 233.95), 138);
				}
				// �u�������v
				else {
					ShowMsg_("NPC_MOTHER_MSG_053");		// �u���́c�c����Ȃ��Ƃ� ���������̂�
					KeyInputWait_();
					CloseMsgWnd_();
				}
			}
			else {
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_BOYS_MOTHER");
				ShowMsg_("NPC_MOTHER_MSG_054");		// �u<name_player/>����c�c
				KeyInputWait_();
			
				// �u�͂��v
				if (GetQueryResult_() == QUERY2_0) {
					ShowMsg_("NPC_MOTHER_MSG_055");		// �u�킩��܂����B
					KeyInputWait_();
					CloseMsgWnd_();
					
					// �Ó]
					SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
					SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
					WaitFade_();

					// BitFlag�ݒ�
					SetEventFlg_("BFG_RIDE_INPUT_PROHIBIT", true);			// BIT_435 ���C�h����֎~�t���O
					SetEventFlg_("BFG_PLAYERABILITY_PROHIBIT", true);		// BIT_456 �v���C���[���Z�֎~�t���O
					SetEventFlg_("BFG_PUT_ON_MONSTER_SUIT", true);			// Bit_24 �L�O���~��ԃt���O
					SetEventFlg_("BFG_DISPLAYED_MONSTER_MOTHER_MSG", true);	// Bit_1240 �L�O���~����t���O

					PlaySE_("SE_DEM_076");

					ChangeMapPosDir_("S01_00", Vec3(-29.14, 0.0, 233.95), 138);
				}
				// �u�������v
				else {
					ShowMsg_("NPC_MOTHER_MSG_057");		// �u�����ł����c�c�B
					KeyInputWait_();
					CloseMsgWnd_();
				}
			}
		}
		else if (prison_num < GetFlagID_("CONST_SS_PR_INVULNERABILITY_PLAYER")) {	// Num6 < 28
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_BOYS_MOTHER");
			ShowMsg_("NPC_MOTHER_MSG_080");		// �u���� �ǂ����܂��傤�B
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (prison_num < GetFlagID_("CONST_SS_PR_RUKIYA_SIGNPOST")) {			// Num6 < 29
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_BOYS_MOTHER");
			ShowMsg_("NPC_MOTHER_MSG_130");		// �u���L������́@���A�N�^�[���@�����Ă���H
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else {
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_BOYS_MOTHER");
			ShowMsg_("NPC_MOTHER_MSG_140");		// �u���L������� �{���� ���Ȃ���S�z���c�c
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else if (main_num == GetFlagID_("CONST_SM_SKY")){								// Num0 = 8
		if(sky_num < GetFlagID_("CONST_SS_SK_GO_VOLCANO_SKY")){					// Num9 < 36
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_BOYS_MOTHER");
			ShowMsg_("NPC_MOTHER_MSG_160");			// �u���� <name_player/>����I
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else {
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_BOYS_MOTHER");
			ShowMsg_("NPC_MOTHER_MSG_170");			// �u���̎q�� �����Ă���܂����B
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else {
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_BOYS_MOTHER");
		ShowMsg_("NPC_MOTHER_MSG_140");			// �u���L������� �{���� ���Ȃ���S�z���c�c
		KeyInputWait_();
		CloseMsgWnd_();
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		���N ��b����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkBoy()
{
	local sky_num		 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");					// Num9
	local bit_sinario_clesr	 = GetEventFlg_("BFG_SCENARIO_CLEAR_ALL");				// Bit_46 �V�i���I�N���A
	
	if(bit_sinario_clesr == true){							// Bit_46 �V�i���I�N���A
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_MONSTER_BOY");
		ShowMsg_("NPC_BOY_MSG_180");				// �u���Z���� �����X�^�[�}�X�^�[����
		KeyInputWait_();
		CloseMsgWnd_();
	}
	else if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_ITTABURU_BOX")) {						// Num6 < 3
			SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_PR_ITTABURU_BOX"));			// Num6 <- 3
			
			// �f���Đ���̕��A�ʒu
			SetReturnDemoPosDir_(Vec3(-193.347, 0.114, 208.489), 69);
			
			// Demo402[�C�b�^�u���̃n�R]�Đ�
			TouchNpcChangeDemo(402);
		}
		else if (prison_num < GetFlagID_("CONST_SS_PR_BOY_WILL_MOTHER_GRIEF")) {		// Num6 < 4
			SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_PR_BOY_WILL_MOTHER_GRIEF"));	// Num6 <- 4
			
			SetReturnDemoPosDir_(Vec3(-47.82, 0.0, 249.92), 137);
			// Demo403[���N�̌��ӂƕ�e�̂Ȃ���]�Đ�
			TouchNpcChangeDemo(403);
		}
		else if (prison_num < GetFlagID_("CONST_SS_PR_SUBSTITUTE_PLAYER")) {			// Num6 < 5
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_MONSTER_BOY");
			ShowMsg_("NPC_BOY_MSG_030");		// �u������ �č��� ���L���ɉ������
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (prison_num < GetFlagID_("CONST_SS_PR_MEETING_02")) {					// Num6 < 13
			local bit_kigurumi = GetEventFlg_("BFG_PUT_ON_MONSTER_SUIT");		// Bit_24 �L�O���~��ԃt���O
			if (bit_kigurumi) {
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_MONSTER_BOY");
				ShowMsg_("NPC_BOY_MSG_050");		// �u���Z����c�c���肪�Ƃ��B
				KeyInputWait_();
				CloseMsgWnd_();
			}
			else {
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_MONSTER_BOY");
				ShowMsg_("NPC_BOY_MSG_051");		// �u����H �L�O���~�� �E����������́H
				KeyInputWait_();
				CloseMsgWnd_();
			}
		}
		else if (prison_num < GetFlagID_("CONST_SS_PR_RESISTANCE_RUKIYA")) {		// Num6 < 15
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_MONSTER_BOY");
			ShowMsg_("NPC_BOY_MSG_080");		// �u���Z���� ���L���ɂ� �܂���ĂȂ��́H
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (prison_num < GetFlagID_("CONST_SS_PR_INVULNERABILITY_PLAYER")) {		// Num6 < 28
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_MONSTER_BOY");
			ShowMsg_("NPC_BOY_MSG_100");		// �u�����I�@���L���Ɖ���́I�H
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (prison_num < GetFlagID_("CONST_SS_PR_RUKIYA_SIGNPOST")) {				// Num6 < 29
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_MONSTER_BOY");
			ShowMsg_("NPC_BOY_MSG_130");		// �u���c�c���Z����I
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else {
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_MONSTER_BOY");
			ShowMsg_("NPC_BOY_MSG_140");		// �u�č����́@�ŏ�K�ɂ́@�ړ����u�ւƑ���
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else if (main_num == GetFlagID_("CONST_SM_SKY")){								// Num0 = 8
		if(sky_num < GetFlagID_("CONST_SS_SK_GO_VOLCANO_SKY")){					// Num9 < 36
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_MONSTER_BOY");
			ShowMsg_("NPC_BOY_MSG_160");			// �u���Z����I �悩���� �����������񂾂ˁI
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else {
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_MONSTER_BOY");
			ShowMsg_("NPC_BOY_MSG_170");			// �u����������������� ���Z����I
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else {
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_MONSTER_BOY");
		ShowMsg_("NPC_BOY_MSG_140");			// �u�ŔM�̉ΎR�ɂ��� �G���s�X�R�B
		KeyInputWait_();
		CloseMsgWnd_();
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�A���C�p�[�N�Z�l�` ��b����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkAroiA()
{
	local sky_num		 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");					// Num9
	local bit_sinario_clesr	 = GetEventFlg_("BFG_SCENARIO_CLEAR_ALL");				// Bit_46 �V�i���I�N���A
	
	if(bit_sinario_clesr == true){							// Bit_46 �V�i���I�N���A
		OpenMsgWnd_();
		ShowMsg_("NPC_AROI_A_MSG_180");			// �u���� �č��� �N���s���Ȃ��Ă����� �v����
		KeyInputWait_();
		CloseMsgWnd_();
	}
	else if (main_num == GetFlagID_("CONST_SM_PRISON")) {							// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_ITTABURU_BOX")) {					// Num6 < 3
			OpenMsgWnd_();
			ShowMsg_("NPC_AROI_A_MSG_010");		// �u������ �A���C�p�[�N�B
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (prison_num < GetFlagID_("CONST_SS_PR_SUBSTITUTE_PLAYER")) {		// Num6 < 5
			OpenMsgWnd_();
			ShowMsg_("NPC_AROI_A_MSG_020");		// �u�������낤�H ���ꂪ �C�b�^�u�����B
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (prison_num < GetFlagID_("CONST_SS_PR_MEETING_02")) {				// Num6 < 13
			local bit_kigurumi = GetEventFlg_("BFG_PUT_ON_MONSTER_SUIT");		// Bit_24 �L�O���~��ԃt���O
			if (bit_kigurumi) {
				OpenMsgWnd_();
				ShowMsg_("NPC_AROI_A_MSG_050");		// �u�������Ɓc�c�N�������H
				KeyInputWait_();
				CloseMsgWnd_();
			}
			else {
				OpenMsgWnd_();
				ShowMsg_("NPC_AROI_A_MSG_051");		// �u�Ȃ��c�c���̐l��B
				KeyInputWait_();
				CloseMsgWnd_();
			}
		}
		else if (prison_num < GetFlagID_("CONST_SS_PR_INVULNERABILITY_PLAYER")) {	// Num6 < 28
			OpenMsgWnd_();
			ShowMsg_("NPC_AROI_A_MSG_080");		// �u�č��� �����������񂾁H
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else {
			OpenMsgWnd_();
			ShowMsg_("NPC_AROI_A_MSG_130");		// �u���������B�C�b�^�u���� ���񂾂炵���ȁB
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else if (main_num == GetFlagID_("CONST_SM_SKY")){								// Num0 = 8
		if(sky_num < GetFlagID_("CONST_SS_SK_GO_VOLCANO_SKY")){					// Num9 < 36
			OpenMsgWnd_();
			ShowMsg_("NPC_AROI_A_MSG_160");			// �u�C�b�^�u������ ���R�ɂȂ����Ǝv������
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else {
			OpenMsgWnd_();
			ShowMsg_("NPC_AROI_A_MSG_170");			// �u�����ԕ��� �����Ă邶��Ȃ����I
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else {
		OpenMsgWnd_();
		ShowMsg_("NPC_AROI_A_MSG_130");			// �u���������B�C�b�^�u���� ���񂾂炵���ȁB
		KeyInputWait_();
		CloseMsgWnd_();
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�A���C�p�[�N�Z�l�a ��b����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkAroiB()
{
	local sky_num		 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");					// Num9
	local bit_sinario_clesr	 = GetEventFlg_("BFG_SCENARIO_CLEAR_ALL");				// Bit_46 �V�i���I�N���A
	
	if(bit_sinario_clesr == true){							// Bit_46 �V�i���I�N���A
		OpenMsgWnd_();
		ShowMsg_("NPC_AROI_B_MSG_180");			// �u���O�ɂ� �p�[�N�̑S���� ���b�ɂȂ�������
		KeyInputWait_();
		CloseMsgWnd_();
	}
	else if (main_num == GetFlagID_("CONST_SM_PRISON")) {							// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_ITTABURU_BOX")) {					// Num6 < 3
			OpenMsgWnd_();
			ShowMsg_("NPC_AROI_B_MSG_010");		// �u���O �C�b�^�u���č����������H
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (prison_num < GetFlagID_("CONST_SS_PR_SUBSTITUTE_PLAYER")) {		// Num6 < 5
			OpenMsgWnd_();
			ShowMsg_("NPC_AROI_B_MSG_020");		// �u���̃n�R������ �č��ƃA���C�p�[�N��
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (prison_num < GetFlagID_("CONST_SS_PR_MEETING_02")) {				// Num6 < 13
			local bit_kigurumi = GetEventFlg_("BFG_PUT_ON_MONSTER_SUIT");		// Bit_24 �L�O���~��ԃt���O
			if (bit_kigurumi) {
				OpenMsgWnd_();
				ShowMsg_("NPC_AROI_B_MSG_050");		// �u������� ���������� �L�O���~���H
				KeyInputWait_();
				CloseMsgWnd_();
			}
			else {
				OpenMsgWnd_();
				ShowMsg_("NPC_AROI_B_MSG_051");		// �u���Ԃ� �č��̒��� �ǂ�قǋ��낵���ڂ�
				KeyInputWait_();
				CloseMsgWnd_();
			}
		}
		else if (prison_num < GetFlagID_("CONST_SS_PR_INVULNERABILITY_PLAYER")) {	// Num6 < 28
			OpenMsgWnd_();
			ShowMsg_("NPC_AROI_B_MSG_080");		// �u�č��̖傪 �J�������Ă̂�
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else {
			OpenMsgWnd_();
			ShowMsg_("NPC_AROI_B_MSG_130");		// �u�܂� �č��̒��ɂ� �C�b�^�u���̎艺��
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else if (main_num == GetFlagID_("CONST_SM_SKY")){								// Num0 = 8
		if(sky_num < GetFlagID_("CONST_SS_SK_GO_VOLCANO_SKY")){					// Num9 < 36
			OpenMsgWnd_();
			ShowMsg_("NPC_AROI_B_MSG_160");			// �u�󂪍����ԕ��� �����Ă���
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else {
			OpenMsgWnd_();
			ShowMsg_("NPC_AROI_B_MSG_170");			// �u�I���� �������猩�Ă���B
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else {
		OpenMsgWnd_();
		ShowMsg_("NPC_AROI_B_MSG_130");			// �u�܂� �č��̒��ɂ� �C�b�^�u���̎艺��
		KeyInputWait_();
		CloseMsgWnd_();
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�A���C�p�[�N�Z�l�b ��b����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkAroiC()
{
	local sky_num		 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");					// Num9
	local bit_sinario_clesr	 = GetEventFlg_("BFG_SCENARIO_CLEAR_ALL");				// Bit_46 �V�i���I�N���A
	
	if(bit_sinario_clesr == true){							// Bit_46 �V�i���I�N���A
		OpenMsgWnd_();
		ShowMsg_("NPC_AROI_C_MSG_180");			// �u���� ���̂������ɏo�悤�� �v���Ă�񂾁B
		KeyInputWait_();
		CloseMsgWnd_();
	}
	else if (main_num == GetFlagID_("CONST_SM_PRISON")) {							// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_ITTABURU_BOX")) {					// Num6 < 3
			OpenMsgWnd_();
			ShowMsg_("NPC_AROI_C_MSG_010");		// �u�č����� �Ƃ��ǂ� �ߖ���������񂾁B
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (prison_num < GetFlagID_("CONST_SS_PR_SUBSTITUTE_PLAYER")) {		// Num6 < 5
			OpenMsgWnd_();
			ShowMsg_("NPC_AROI_C_MSG_020");		// �u�C�b�^�u���� �t�炤�Ȃ�ă������B
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (prison_num < GetFlagID_("CONST_SS_PR_MEETING_02")) {				// Num6 < 13
			local bit_kigurumi = GetEventFlg_("BFG_PUT_ON_MONSTER_SUIT");		// Bit_24 �L�O���~��ԃt���O
			if (bit_kigurumi) {
				OpenMsgWnd_();
				ShowMsg_("NPC_AROI_C_MSG_050");		// �u���H �������Ȃ��炾�ȁB
				KeyInputWait_();
				CloseMsgWnd_();
			}
			else {
				OpenMsgWnd_();
				ShowMsg_("NPC_AROI_C_MSG_051");		// �u������������ �Ȃ񂾂��� ���̎q��
				KeyInputWait_();
				CloseMsgWnd_();
			}
		}
		else if (prison_num < GetFlagID_("CONST_SS_PR_INVULNERABILITY_PLAYER")) {	// Num6 < 28
			OpenMsgWnd_();
			ShowMsg_("NPC_AROI_C_MSG_080");		// �u�Ȃ񂾂��m��� �č��̓z�炪
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (prison_num < GetFlagID_("CONST_SS_PR_LAST_ANSESU_1ST")) {			// Num6 < 30
			OpenMsgWnd_();
			ShowMsg_("NPC_AROI_C_MSG_130");		// �u���� �ړ����u�� �g���Ȃ��܂܂Ȃ̂��H
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else {
			OpenMsgWnd_();
			ShowMsg_("NPC_AROI_C_MSG_150");		// �u�ړ����u�� �g����悤�� �Ȃ����̂��B
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else if (main_num == GetFlagID_("CONST_SM_SKY")){								// Num0 = 8
		if(sky_num < GetFlagID_("CONST_SS_SK_GO_VOLCANO_SKY")){					// Num9 < 36
			OpenMsgWnd_();
			ShowMsg_("NPC_AROI_C_MSG_160");			// �u�܂��ړ����u�� �g���Ȃ��Ȃ��Ă�񂾁B
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else {
			OpenMsgWnd_();
			ShowMsg_("NPC_AROI_C_MSG_170");			// �u���܂��܂��������ԕ��� �悤�₭�������ȁB
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else {
		OpenMsgWnd_();
		ShowMsg_("NPC_AROI_C_MSG_150");			// �u�ړ����u�� �g����悤�� �Ȃ����̂��B
		KeyInputWait_();
		CloseMsgWnd_();
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�A���C�p�[�N�Z�l�c ��b����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkAroiD()
{
	local sky_num		 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");					// Num9
	local bit_sinario_clesr	 = GetEventFlg_("BFG_SCENARIO_CLEAR_ALL");				// Bit_46 �V�i���I�N���A
	
	if(bit_sinario_clesr == true){							// Bit_46 �V�i���I�N���A
		OpenMsgWnd_();
		ShowMsg_("NPC_AROI_D_MSG_180");			// �u������ ���C��������� �E�C�����҂�B
		KeyInputWait_();
		CloseMsgWnd_();
	}
	else if (main_num == GetFlagID_("CONST_SM_PRISON")) {							// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_ITTABURU_BOX")) {					// Num6 < 3
			OpenMsgWnd_();
			ShowMsg_("NPC_AROI_D_MSG_010");		// �u���L���̂��Ƃ� �m��Ȃ�������ƁH
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (prison_num < GetFlagID_("CONST_SS_PR_SUBSTITUTE_PLAYER")) {		// Num6 < 5
			OpenMsgWnd_();
			ShowMsg_("NPC_AROI_D_MSG_020");		// �u���L���� �N�`���������� ���b�D���łȁB
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (prison_num < GetFlagID_("CONST_SS_PR_MEETING_02")) {				// Num6 < 13
			local bit_kigurumi = GetEventFlg_("BFG_PUT_ON_MONSTER_SUIT");		// Bit_24 �L�O���~��ԃt���O
			if (bit_kigurumi) {
				OpenMsgWnd_();
				ShowMsg_("NPC_AROI_D_MSG_050");		// �u���O���� ���������āc�c
				KeyInputWait_();
				CloseMsgWnd_();
			}
			else {
				OpenMsgWnd_();
				ShowMsg_("NPC_AROI_D_MSG_051");		// �u�݂�� ���̎q�̂��Ƃ�
				KeyInputWait_();
				CloseMsgWnd_();
			}
		}
		else if (prison_num < GetFlagID_("CONST_SS_PR_INVULNERABILITY_PLAYER")) {	// Num6 < 28
			OpenMsgWnd_();
			ShowMsg_("NPC_AROI_D_MSG_080");		// �u���̑����c�c�N�������̂� ���O���񂩁H
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else {
			OpenMsgWnd_();
			ShowMsg_("NPC_AROI_D_MSG_130");		// �u�������c�c���L���̂�������
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else if (main_num == GetFlagID_("CONST_SM_SKY")){								// Num0 = 8
		if(sky_num < GetFlagID_("CONST_SS_SK_GO_VOLCANO_SKY")){					// Num9 < 36
			OpenMsgWnd_();
			ShowMsg_("NPC_AROI_D_MSG_160");			// �u�A���C�p�[�N�́c�c���� ���E��
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else {
			OpenMsgWnd_();
			ShowMsg_("NPC_AROI_D_MSG_170");			// �u�c�c���E�� �܂��I����悤����ȁB
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else {
		OpenMsgWnd_();
		ShowMsg_("NPC_AROI_D_MSG_130");			// �u�������c�c���L���̂�������
		KeyInputWait_();
		CloseMsgWnd_();
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		��� ��b����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkItem()
{
	local sky_num		 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");					// Num9
	local bit_sinario_clesr	 = GetEventFlg_("BFG_SCENARIO_CLEAR_ALL");				// Bit_46 �V�i���I�N���A
	
	if(bit_sinario_clesr == true){							// Bit_46 �V�i���I�N���A
		OpenMsgWnd_();
		ShowMsg_("NPC_ITEM_MSG_180");			// �u������ �����Ƃ� �����ɐ��I
		KeyInputWait_();
		CloseMsgWnd_();
	}
	else if (main_num == GetFlagID_("CONST_SM_PRISON")) {							// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_INVULNERABILITY_PLAYER")) {		// Num6 < 28
			OpenMsgWnd_();
			ShowMsg_("NPC_ITEM_MSG_010");		// �u������ �������B
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else {
			OpenMsgWnd_();
			ShowMsg_("NPC_ITEM_MSG_130");		// �u�C�b�^�u���� ���Ȃ��Ȃ�����
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else if (main_num == GetFlagID_("CONST_SM_SKY")){								// Num0 = 8
		if(sky_num < GetFlagID_("CONST_SS_SK_GO_VOLCANO_SKY")){					// Num9 < 36
			OpenMsgWnd_();
			ShowMsg_("NPC_ITEM_MSG_160");			// �u����Ȏ������炱�� ����K�v����H
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else {
			OpenMsgWnd_();
			ShowMsg_("NPC_ITEM_MSG_170");			// �u�����l�� �����Ȃ��̂��厖�Ȃ̂��B
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else {
		OpenMsgWnd_();
		ShowMsg_("NPC_ITEM_MSG_130");			// �u�C�b�^�u���� ���Ȃ��Ȃ�����
		KeyInputWait_();
		CloseMsgWnd_();
	}
	GotoMenuFadeOpen(MENU_OPEN.S01_00_ITEM);
	//����t���[�I����
	OpenMsgWnd_();
	ShowMsg_("NPC_ITEM_MSG_190");
	KeyInputWait_();
	CloseMsgWnd_();
	
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�h�� ��b����
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uTalkInn()
{
	local bit_clear = GetEventFlg_("BFG_SCENARIO_CLEAR_SAND");		// Bit_44
	
	local return_pos = Vec3(190.0, 0.0, 8.0);		// ��l���̕��A�ʒu
	local return_dir = 180;							// ��l���̕��A����
	
	if (main_num <= GetFlagID_("CONST_SM_PRISON")) {								// Num0 <= 5
		if (prison_num < GetFlagID_("CONST_SS_PR_INVULNERABILITY_PLAYER")) {		// Num6 < 28
			OpenMsgWnd_();
			ShowMsg_("NPC_INN_MSG_010");		// �u������ ���܂肽���̂����H
			KeyInputWait_();
			
			switch (GetQueryResult_()) {
			// �u���܂�v
			case QUERY2_0 :
				CloseMsgWnd_();
				CommTaskInn(return_pos, return_dir, bit_clear, g_npc_inn);
				
				OpenMsgWnd_();
				ShowMsg_("NPC_INN_MSG_012");	// �u���� �������� �������邱�Ƃ��B
				KeyInputWait_();
				CloseMsgWnd_();
				
				break;
				
			// �u��߂�v
			case QUERY2_1 :
				ShowMsg_("NPC_INN_MSG_011");	// �u�����B���������ق��������B
				KeyInputWait_();
				CloseMsgWnd_();
				
				break;
			default :
				break;
			}
		}
		else {
			OpenMsgWnd_();
			ShowMsg_("NPC_INN_MSG_130");		// �u���q����I ������ �x��ł��������H
			KeyInputWait_();
			
			switch (GetQueryResult_()) {
			// �u���܂�v
			case QUERY2_0 :
				CloseMsgWnd_();
				CommTaskInn(return_pos, return_dir, bit_clear, g_npc_inn);
				
				OpenMsgWnd_();
				ShowMsg_("NPC_INN_MSG_132");	// �u�ǂ������H �悭 ���ꂽ�����H
				KeyInputWait_();
				CloseMsgWnd_();
				
				break;
				
			// �u��߂�v
			case QUERY2_1 :
				ShowMsg_("NPC_INN_MSG_131");	// �u���������B������ ����Ȃ�B
				KeyInputWait_();
				CloseMsgWnd_();
				
				break;
			default :
				break;
			}
		}
	}
	else {
		local message_key_1;
		local message_key_2;
		local message_key_3;
		if(GetEventFlg_("BFG_CHECK_INN_FIRST_MSG_ALL") == false){
			// �č����N���A��̏h���ŕ\�����郁�b�Z�[�W���w��(����)
			message_key_1 = "NPC_INN_MSG_CLEAR_000";
			message_key_2 = "NPC_INN_MSG_CLEAR_001";
			message_key_3 = "NPC_INN_MSG_CLEAR_002";
		}
		else{
			// �č����N���A��̏h���ŕ\�����郁�b�Z�[�W���w��(�Q��ڈȍ~)
			message_key_1 = "NPC_INN_MSG_CLEAR_003";
			message_key_2 = "NPC_INN_MSG_CLEAR_004";
			message_key_3 = "NPC_INN_MSG_CLEAR_005";
		}
		SetEventFlg_("BFG_CHECK_INN_FIRST_MSG_ALL", true);
		OpenMsgWnd_();
		ShowMsg_(message_key_1);		// �u���q����I ������ �x��ł��������H
		KeyInputWait_();
		
		switch (GetQueryResult_())
		{
		// �u���܂�v
		// �u�₷�ށv
		case QUERY3_0 :
		case QUERY3_1 :
			CloseMsgWnd_();
			CommTaskInn(return_pos, return_dir, bit_clear, g_npc_inn);
			
			OpenMsgWnd_();
			ShowMsg_(message_key_3);	// �u�ǂ������H �悭 ���ꂽ�����H
			KeyInputWait_();
			CloseMsgWnd_();
			
			break;
			
		// �u��߂�v
		case QUERY3_2 :
			ShowMsg_(message_key_2);	// �u���������B������ ����Ȃ�B
			KeyInputWait_();
			CloseMsgWnd_();
			
			break;
		default :
			break;
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
	local sky_num		 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");					// Num9
	local bit_sinario_clesr	 = GetEventFlg_("BFG_SCENARIO_CLEAR_ALL");				// Bit_46 �V�i���I�N���A
	
	if(bit_sinario_clesr == true){							// Bit_46 �V�i���I�N���A
		OpenMsgWnd_();
		ShowMsg_("NPC_PRISONER_B_MSG_180");			// �u���̊č� ������ �g���Ȃ����H
		KeyInputWait_();
		CloseMsgWnd_();
	}
	else if (main_num == GetFlagID_("CONST_SM_PRISON")) {							// Num0 = 5
		OpenMsgWnd_();
		ShowMsg_("NPC_PRISONER_B_MSG_130");		// �u�č��́@�ړ����u��T���Ă���̂��H
		KeyInputWait_();
		CloseMsgWnd_();
	}
	else if (main_num == GetFlagID_("CONST_SM_SKY")){								// Num0 = 8
		if(sky_num < GetFlagID_("CONST_SS_SK_GO_VOLCANO_SKY")){					// Num9 < 36
			OpenMsgWnd_();
			ShowMsg_("NPC_PRISONER_B_MSG_160");			// �u���������̐���� ���̍����ԕ��ő䖳�����B
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else {
			OpenMsgWnd_();
			ShowMsg_("NPC_PRISONER_B_MSG_170");			// �u�ł������C�b�^�u���� �|�����̂�
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else {
		OpenMsgWnd_();
		ShowMsg_("NPC_PRISONER_B_MSG_130");		// �u�č��́@�ړ����u��T���Ă���̂��H
		KeyInputWait_();
		CloseMsgWnd_();
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
	local sky_num		 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");					// Num9
	local bit_sinario_clesr	 = GetEventFlg_("BFG_SCENARIO_CLEAR_ALL");				// Bit_46 �V�i���I�N���A
	
	if(bit_sinario_clesr == true){							// Bit_46 �V�i���I�N���A
		OpenMsgWnd_();
		ShowMsg_("NPC_PRISONER_C_MSG_180");			// �u���ꂩ�� ���q�� ��ɍs����ł��B
		KeyInputWait_();
		CloseMsgWnd_();
	}
	else if (main_num == GetFlagID_("CONST_SM_PRISON")) {							// Num0 = 5
		OpenMsgWnd_();
		ShowMsg_("NPC_PRISONER_C_MSG_130");		// �u������ �悩�����I
		KeyInputWait_();
		CloseMsgWnd_();
	}
	else if (main_num == GetFlagID_("CONST_SM_SKY")){								// Num0 = 8
		if(sky_num < GetFlagID_("CONST_SS_SK_GO_VOLCANO_SKY")){					// Num9 < 36
			OpenMsgWnd_();
			ShowMsg_("NPC_PRISONER_C_MSG_160");			// �u���c�c���E�� �����N���Ă��ł��H
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else {
			OpenMsgWnd_();
			ShowMsg_("NPC_PRISONER_C_MSG_170");			// �u���̋���� �C�b�^�u���̎p�����Ă�����
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else {
		OpenMsgWnd_();
		ShowMsg_("NPC_PRISONER_C_MSG_130");		// �u������ �悩�����I
		KeyInputWait_();
		CloseMsgWnd_();
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
	local sky_num		 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");					// Num9
	local bit_sinario_clesr	 = GetEventFlg_("BFG_SCENARIO_CLEAR_ALL");				// Bit_46 �V�i���I�N���A
	
	if(bit_sinario_clesr == true){							// Bit_46 �V�i���I�N���A
		OpenMsgWnd_();
		ShowMsg_("NPC_PRISONER_D_MSG_180");			// �u������ �܂��C�b�^�u���݂����ȓz�� ���ꂽ��
		KeyInputWait_();
		CloseMsgWnd_();
	}
	else if (main_num == GetFlagID_("CONST_SM_PRISON")) {							// Num0 = 5
		OpenMsgWnd_();
		ShowMsg_("NPC_PRISONER_D_MSG_130");		// �u���̃o�P���m�� �C�b�^�u���ɉ������ꂽ
		KeyInputWait_();
		CloseMsgWnd_();
	}
	else if (main_num == GetFlagID_("CONST_SM_SKY")){								// Num0 = 8
		if(sky_num < GetFlagID_("CONST_SS_SK_GO_VOLCANO_SKY")){					// Num9 < 36
			OpenMsgWnd_();
			ShowMsg_("NPC_PRISONER_D_MSG_160");			// �u���̍����ԕ��c�c�u���C�N�����X�^�[��
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else {
			OpenMsgWnd_();
			ShowMsg_("NPC_PRISONER_D_MSG_170");			// �u�C�b�^�u���� �����ԕ��� �ĂяW�߂Ă��̂��H
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
	else {
		OpenMsgWnd_();
		ShowMsg_("NPC_PRISONER_D_MSG_130");		// �u���̃o�P���m�� �C�b�^�u���ɉ������ꂽ
		KeyInputWait_();
		CloseMsgWnd_();
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�C�b�^�u���̔��𒲂ׂ���
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineIttaburuBox()
{
	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_SUBSTITUTE_PLAYER")) {				// Num6 < 5
			CommPlayerTurnAroundObj(g_gmk_itta_box);
			OpenMsgWnd_();
			ShowMsg_("SYSTEM_MSG_000");		// �C�b�^�u���� �u���Ă����� �n�R������B
			KeyInputWait_();
			CloseMsgWnd_();
		}
		else if (prison_num < GetFlagID_("CONST_SS_PR_ITTABURU_PRISON_1ST")) {		// Num6 < 6
			local bit_kigurumi = GetEventFlg_("BFG_PUT_ON_MONSTER_SUIT");		// Bit_24 �L�O���~��ԃt���O
			if (bit_kigurumi) {
				CommPlayerTurnAroundObj(g_gmk_itta_box);
				OpenMsgWnd_();
				ShowMsg_("SYSTEM_MSG_003");		// �C�b�^�u���� �u���Ă����� �n�R������B
				KeyInputWait_();
				// �u�͂��v
				if (GetQueryResult_() == QUERY2_0) {
					CloseMsgWnd_();
					SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_PR_ITTABURU_PRISON_2ND"));	// Num6 <- 7
					
					// �f���Đ���̕��A�ʒu
					SetReturnDemoMap_("S02_00");
					SetReturnDemoPosDir_(Vec3(232, 0, 244), -176);
					
					// Demo405[�C�b�^�u���č��և@]�i�A���C�p�[�N�j�Đ�
					StopBgmChangeDemo(405);
				}
				// �u�������v
				else {
					CloseMsgWnd_();
				}
			}
			else {
				CommPlayerTurnAroundObj(g_gmk_itta_box);
				OpenMsgWnd_();
				ShowMsg_("SYSTEM_MSG_004");		// �C�b�^�u���� �u���Ă����� �n�R������B
				KeyInputWait_();
				CloseMsgWnd_();
			}
		}
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�č����̖� �𒲂ׂ���
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineGate()
{
	local player = GetPlayerId_();

	if (main_num == GetFlagID_("CONST_SM_PRISON")) {								// Num0 = 5
		if (prison_num < GetFlagID_("CONST_SS_PR_ITTABURU_PRISON_1ST")) {			// Num6 < 6
			local pos  = Vec3(-98.3, 0.0, -281.6);
			uPlayerTurnAroundPos(pos);
	
			OpenMsgWnd_();
			ShowMsg_("SYSTEM_MSG_002");		// ���� ������������Ă���c�c�B
			KeyInputWait_();
			CloseMsgWnd_();
		}
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�t�B�[���h�ւ̖� �𒲂ׂ���
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineGateExit()
{
	local player = GetPlayerId_();

	local bit_kigurumi = GetEventFlg_("BFG_PUT_ON_MONSTER_SUIT");	// Bit_24 �L�O���~��ԃt���O
	if (bit_kigurumi == true) {
		local pos  = Vec3(191.0, 0.0, 358.2);
		uPlayerTurnAroundPos(pos);

		PlaySE_("SE_FLD_135");	//�y���A�N�^�[��������z�\��
		Wait_(30);
	
		OpenMsgWnd_();
		SetTalkName_("NAME_TAG_REACTOR");	// ���A�N�^�[
		ShowMsg_("REC_MSG_000");			// ���u���̎p�ł� ���R�ȍs���� �ł��܂���B
		KeyInputWait_();
		CloseMsgWnd_();
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		���L���̃��A�N�^�[�𒲂ׂ���
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineReactor()
{
	local player = GetPlayerId_();

	local pos  = Vec3(-104.6, 0.0, 45.0);
	uPlayerTurnAroundPos(pos);
	
	OpenMsgWnd_();
	ShowMsg_("SYSTEM_MSG_001");			// ���L���̃��A�N�^�[�� �����Ă���B
	KeyInputWait_();
	
	// �u�͂��v
	if (GetQueryResult_() == QUERY2_0) {
		CloseMsgWnd_();
		
		SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_PR_RUKIYA_SIGNPOST"));	// Num6 <- 29
		
		SetReturnDemoPosDir_(Vec3(-85.9, 0, 39.8), -24);
		// Demo422[���L�����₵���������]�Đ�
		TouchNpcChangeDemo(422);
	}
	// �u�������v
	else {
		CloseMsgWnd_();
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


