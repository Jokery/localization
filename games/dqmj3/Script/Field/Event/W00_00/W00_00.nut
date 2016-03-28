//===================== W00_00 ���� ====================

// �萔��`
const EFC_SIZE	= 10.0;						// ����{�X�̃G�t�F�N�g�T�C�Y


// �ϐ���`
main_num	 <- C_NONE_ID;					// ���C���t���O
sky_num		 <- C_NONE_ID;					// �V�i���I�T�u�t���O

str_num_sub	 <- "NUM_SCENARIO_SUB_SKY";		// �V�i���I�T�u�t���O�̒萔�� : Num9

// ���̊Ԃɍ���p�j�����X�^�[���Ԍ�̃}�b�v�`�F���WID
const MAP_ID				 = "W00_00";
//------------------------------------------------
//		�퓬�I����
//------------------------------------------------
function AfterBattle()
{
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");			// Num0
	sky_num		 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");		// Num9
	
	local battle_result = GetBattleEndType_();
	
	if (main_num == GetFlagID_("CONST_SM_SKY")) {			// Num0 = 8
		// ������{�[�V���b�N�� �s�k��
		if (sky_num == GetFlagID_("CONST_SS_SK_JDG_BATTLE_G_BOWSHOCK")					// Num9 = 14 or
		 || sky_num == GetFlagID_("CONST_SS_SK_JDG_REMATCH_G_BOWSHOCK")) {				// Num9 = 17
			if(battle_result == END_TYPE_LOSE){
				SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_SK_CONTACT_G_BOWSHOCK"));	// Num9 = 15
			}
		}
		// ������u���h���h�� �s�k��
		else if (sky_num == GetFlagID_("CONST_SS_SK_JDG_BATTLE_G_BUNDORUDO")			// Num9 = 20 or
		 || sky_num == GetFlagID_("CONST_SS_SK_JDG_REMATCH_G_BUNDORUDO")) {				// Num9 = 23
			if(battle_result == END_TYPE_LOSE){
				SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_SK_CONTACT_G_BUNDORUDO"));	// Num9 = 21
			}
		}
		// ������A�[�U���[�N�� �s�k��
		else if (sky_num == GetFlagID_("CONST_SS_SK_JDG_BATTLE_G_AZAMUKU")				// Num9 = 26 or
		 || sky_num == GetFlagID_("CONST_SS_SK_JDG_REMATCH_G_AZAMUKU")) {				// Num9 = 29
			if(battle_result == END_TYPE_LOSE){
				SetNumFlg_(str_num_sub,  GetFlagID_("CONST_SS_SK_CONTACT_G_AZAMUKU"));	// Num9 = 27
			}
		}
		// ������C�b�^�u���� �s�k��
		else if (sky_num ==  GetFlagID_("CONST_SS_SK_JDG_BATTLE_G_ITTABURU")			// Num9 = 32 or
		 || sky_num ==  GetFlagID_("CONST_SS_SK_JDG_REMATCH_G_ITTABURU")) {				// Num9 = 35
			if(battle_result == END_TYPE_LOSE){
				SetNumFlg_(str_num_sub,  GetFlagID_("CONST_SS_SK_CONTACT_G_ITTABURU"));	// Num9 = 33
			}
		}
		// ������f�X�o�[���� �s�k��
		else if (sky_num ==  GetFlagID_("CONST_SS_SK_JDG_BATTLE_DEATH_PRO")				// Num9 = 38 or
		 || sky_num ==  GetFlagID_("CONST_SS_SK_JDG_REMATCH_DEATH_PRO")) {				// Num9 = 41
			if(battle_result == END_TYPE_LOSE){
				SetNumFlg_(str_num_sub,  GetFlagID_("CONST_SS_SK_CONTACT_DEATH_PRO"));	// Num9 = 39
			}
		}
		// ������K���}�U�[�h�� �s�k��
		else if (sky_num ==  GetFlagID_("CONST_SS_SK_JDG_BATTLE_GARUMAZARD")			// Num9 = 44 or
		 || sky_num ==  GetFlagID_("CONST_SS_SK_JDG_REMATCH_GARUMAZARD")) {				// Num9 = 47
			if(battle_result == END_TYPE_LOSE){
				SetNumFlg_(str_num_sub,  GetFlagID_("CONST_SS_SK_CONTACT_GARUMAZARD"));	// Num9 = 45
			}
		}
	}
	
	//-----------------------
	// �����̊Ԃɍ���p�j�p
	//-----------------------
	if(battle_result == END_TYPE_LOSE){
		if(GetEventFlg_("BFG_BOSS_MONSTER_BATTLE_START")){
			// �퓬�������ǂ����̃t���O���~�낷
			SetEventFlg_("BFG_BOSS_MONSTER_BATTLE_START", false);							// Bit_2020
		}
	}
	
	
	EventEnd_();
}

//------------------------------------------------
//		�}�b�v�ɓ���O
//------------------------------------------------
function BeforeInitMap()
{
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");			// Num0
	sky_num		 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");		// Num9
	
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
	// �}�b�v���B�t���O
	SetEventFlg_("BFG_ARRIVE_AT_W00", true);
	// �Z�[�u�֎~������(�Z�[�u�֎~�}�b�v����A���Ă������p)
	SetEventFlg_("BFG_SAVE_PROHIBIT", false);		// �Z�[�u�֎~(Bit451)

	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");			// Num0
	sky_num		 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");		// Num9
	
	
	// �����X�^�[�z�u������ׂ̃t���O������s��
	if (main_num >= GetFlagID_("CONST_SM_SKY")) {										// Num0 = 8 �ȏ�
		if (sky_num >=  GetFlagID_("CONST_SS_SK_GO_GRAVE_SKY")) {						// Num9 = 18 �ȏ�
			// ����{�[�V���b�N�폟����ɔz�u�����ւ���t���O
			SetEventFlg_("BFG_SET_MONSTER_G_BOWSHOCK_WINS", true);						// Bit1260
		}
		if (sky_num >=  GetFlagID_("CONST_SS_SK_GO_ICE_FIELD_SKY")) {					// Num9 = 24 �ȏ�
			// ����u���h���h�폟����ɔz�u�����ւ���t���O
			SetEventFlg_("BFG_SET_MONSTER_G_BUNDORUDO_WINS", true);						// Bit1261
		}
		if (sky_num >=  GetFlagID_("CONST_SS_SK_GO_PRISON_SKY")) {						// Num9 = 30 �ȏ�
			// ����A�[�U���[�N�폟����ɔz�u�����ւ���t���O
			SetEventFlg_("BFG_SET_MONSTER_G_AZAMUKU_WINS", true);						// Bit1262
		}
		if (sky_num >=  GetFlagID_("CONST_SS_SK_GO_VOLCANO_SKY")) {						// Num9 = 36 �ȏ�
			// ����C�b�^�u���폟����ɔz�u�����ւ���t���O
			SetEventFlg_("BFG_SET_MONSTER_G_ITTABURU_WINS", true);						// Bit1263
		}
		if (sky_num >=  GetFlagID_("CONST_SS_SK_GO_CORE_SKY")) {						// Num9 = 42 �ȏ�
			// ����f�X�o�[�����v�����e�E�X�폟����ɔz�u�����ւ���t���O
			SetEventFlg_("BFG_SET_MONSTER_G_DEATH_PRO_WINS", true);						// Bit1264
		}
	}
	
	
	//----------
	// ��NPC�z�u
	//----------
	// ID������
	g_npc_boshoku			 <- C_NONE_ID;
	g_npc_bunndorudo		 <- C_NONE_ID;
	g_npc_azamuku			 <- C_NONE_ID;
	g_npc_ittaburu			 <- C_NONE_ID;
	g_npc_purometeusu		 <- C_NONE_ID;
	g_npc_desuban			 <- C_NONE_ID;
	g_npc_garumazado		 <- C_NONE_ID;
	g_sky_monster_npc		 <- C_NONE_ID;
	
	//------------------
	//	�G�t�F�N�g�̐ݒu
	//------------------
	local efc_dark;
	
	// �G�t�F�N�g�̓ǂݍ���
	LoadEffect_("ef731_02_mag_dark_pollen_field");		//�����ԕ�
	LoadEffect_("ef731_11_mag_dark_pollen_field_gm");	//�����ԕ�(�K���}�U�[�h�p)
	
	if (main_num == GetFlagID_("CONST_SM_SKY")) {									// Num0 = 8
		// ������{�[�V���b�N
		if (sky_num == GetFlagID_("CONST_SS_SK_GO_CITY_SKY")						// Num9 = 12 or
		||  sky_num == GetFlagID_("CONST_SS_SK_CONTACT_G_BOWSHOCK")) {				// Num9 = 15
			local id_boshoku = ReadNpc_("m207_00");
			g_npc_boshoku = ArrangePointNpc_(id_boshoku, "npc_1_boshoku");
			SetPointPosNoFit_(g_npc_boshoku, "npc_1_boshoku");			//�󒆂ɔz�u
			SetHideIfFar_(g_npc_boshoku, false);						//�������t�F�[�h
			SetScaleSilhouette(g_npc_boshoku, SCALE.NEO_BOSS, SILHOUETTE_WIDTH.NEO_BOSS);	//�T�C�Y�̐ݒ�
			SetReactorMsg_(g_npc_boshoku, "NPC_BIG_BOWSHOCK_REC");
			SetMotion_(g_npc_boshoku, MOT_SPECIAL_WAIT, BLEND_N);
			//�É_�G�t�F�N�g�̐ݒ�
			efc_dark = SetPointWorldEffect_("ef731_02_mag_dark_pollen_field", "npc_1_boshoku");
			SetEffectScale_(efc_dark, EFC_SIZE);
		}
		// ������u���h���h
		else if (sky_num == GetFlagID_("CONST_SS_SK_GO_GRAVE_SKY")					// Num9 = 18 or
			 ||  sky_num == GetFlagID_("CONST_SS_SK_CONTACT_G_BUNDORUDO")) {		// Num9 = 21
			local id_bunndorudo = ReadNpc_("m203_00");
			g_npc_bunndorudo = ArrangePointNpc_(id_bunndorudo, "npc_2_bunndorudo");
			SetPointPosNoFit_(g_npc_bunndorudo, "npc_2_bunndorudo");	//�󒆂ɔz�u
			SetHideIfFar_(g_npc_bunndorudo, false);						//�������t�F�[�h
			SetScaleSilhouette(g_npc_bunndorudo, SCALE.NEO_BOSS, SILHOUETTE_WIDTH.NEO_BOSS);	//�T�C�Y�̐ݒ�
			SetReactorMsg_(g_npc_bunndorudo, "NPC_BIG_BUNDORUDO_REC");
			SetMotion_(g_npc_bunndorudo, MOT_SPECIAL_WAIT, BLEND_N);
			//�É_�G�t�F�N�g�̐ݒ�
			efc_dark = SetPointWorldEffect_("ef731_02_mag_dark_pollen_field", "npc_2_bunndorudo");
			SetEffectScale_(efc_dark, EFC_SIZE);
		}
		// ������A�[�U���[�N
		else if (sky_num == GetFlagID_("CONST_SS_SK_GO_ICE_FIELD_SKY")				// Num9 = 24 or
			 || sky_num == GetFlagID_("CONST_SS_SK_CONTACT_G_AZAMUKU")) {			// Num9 = 27
			local id_azamuku = ReadNpc_("m204_00");
			g_npc_azamuku = ArrangePointNpc_(id_azamuku, "npc_3_azamuku");
			SetPointPosNoFit_(g_npc_azamuku, "npc_3_azamuku");			//�󒆂ɔz�u
			SetHideIfFar_(g_npc_azamuku, false);						//�������t�F�[�h
			SetScaleSilhouette(g_npc_azamuku, SCALE.NEO_BOSS, SILHOUETTE_WIDTH.NEO_BOSS);	//�T�C�Y�̐ݒ�
			SetReactorMsg_(g_npc_azamuku, "NPC_BIG_AZAMUKU_REC");
			SetMotion_(g_npc_azamuku, MOT_SPECIAL_WAIT, BLEND_N);
			//�É_�G�t�F�N�g�̐ݒ�
			efc_dark = SetPointWorldEffect_("ef731_02_mag_dark_pollen_field", "npc_3_azamuku");
			SetEffectScale_(efc_dark, EFC_SIZE);
		}
		// ������C�b�^�u��
		else if (sky_num == GetFlagID_("CONST_SS_SK_GO_PRISON_SKY")					// Num9 = 30 or
			 || sky_num == GetFlagID_("CONST_SS_SK_CONTACT_G_ITTABURU")) {			// Num9 = 33
			local id_ittaburu = ReadNpc_("m205_00");
			g_npc_ittaburu = ArrangePointNpc_(id_ittaburu, "npc_4_ittaburu");
			SetPointPosNoFit_(g_npc_ittaburu, "npc_4_ittaburu");		//�󒆂ɔz�u
			SetHideIfFar_(g_npc_ittaburu, false);						//�������t�F�[�h
			SetScaleSilhouette(g_npc_ittaburu, SCALE.NEO_BOSS, SILHOUETTE_WIDTH.NEO_BOSS);	//�T�C�Y�̐ݒ�
			SetReactorMsg_(g_npc_ittaburu, "NPC_BIG_ITTABURU_REC");
			SetMotion_(g_npc_ittaburu, MOT_WAIT, BLEND_N);
			//�É_�G�t�F�N�g�̐ݒ�
			efc_dark = SetPointWorldEffect_("ef731_02_mag_dark_pollen_field", "npc_4_ittaburu");
			SetEffectScale_(efc_dark, EFC_SIZE);
		}
		// ������f�X�o�[��
		else if (sky_num == GetFlagID_("CONST_SS_SK_GO_VOLCANO_SKY")				// Num9 = 36 or
			 || sky_num == GetFlagID_("CONST_SS_SK_CONTACT_DEATH_PRO")) {			// Num9 = 39
			local id_desuban = ReadNpc_("m206_00");
			g_npc_desuban = ArrangePointNpc_(id_desuban, "npc_5_desuban");
			SetPointPosNoFit_(g_npc_desuban, "npc_5_desuban");			//�󒆂ɔz�u
			SetHideIfFar_(g_npc_desuban, false);						//�������t�F�[�h
			SetScaleSilhouette(g_npc_desuban, SCALE.NEO_BOSS, SILHOUETTE_WIDTH.NEO_BOSS);	//�T�C�Y�̐ݒ�
			SetReactorMsg_(g_npc_desuban, "NPC_BIG_DEATH_REC");
			 //���[�V�����ǂݍ���
			local hovering = ReadMotion_(g_npc_desuban, "m206_00_flight_Hovering_L");		// �z�o�����OL
			SetMotion_(g_npc_desuban, hovering, BLEND_N);
			//�É_�G�t�F�N�g�̐ݒ�
			efc_dark = SetPointWorldEffect_("ef731_02_mag_dark_pollen_field", "npc_5_desuban");
			SetEffectScale_(efc_dark, EFC_SIZE);
			
			// ������v�����e�E�X
			local id_purometeusu = ReadNpc_("n026");
			g_npc_purometeusu = ArrangePointNpc_(id_purometeusu, "npc_5_purometeusu");
			SetPointPosNoFit_(g_npc_purometeusu, "npc_5_purometeusu");	//�󒆂ɔz�u
			SetHideIfFar_(g_npc_purometeusu, false);					//�������t�F�[�h
			SetScaleSilhouette(g_npc_purometeusu, SCALE.T, SILHOUETTE_WIDTH.T);				//�T�C�Y�̐ݒ�
			SetReactorMsg_(g_npc_purometeusu, "NPC_BIG_PRO_REC");
			RideOn_(g_npc_purometeusu, g_npc_desuban, 606, SIZE_T);		//���C�h������
			
		}
		// ������K���}�U�[�h(���펞)
		else if (sky_num ==  GetFlagID_("CONST_SS_SK_GO_CORE_SKY")){					// Num9 = 42
			local id_garumazado = ReadNpc_("m185_00");
			g_npc_garumazado = ArrangePointNpc_(id_garumazado, "npc_6_garumazado");
			SetPointPosNoFit_(g_npc_garumazado, "npc_6_garumazado");	//�󒆂ɔz�u
			SetHideIfFar_(g_npc_garumazado, false);						//�������t�F�[�h
			SetScaleSilhouette(g_npc_garumazado, SCALE.NEO_BOSS, SILHOUETTE_WIDTH.NEO_BOSS);//�T�C�Y�̐ݒ�
			//�É_�G�t�F�N�g�̐ݒ�
			efc_dark = SetPointWorldEffect_("ef731_11_mag_dark_pollen_field_gm", "npc_6_garumazado");
			SetEffectScale_(efc_dark, 1.0);	// ��p�̃G�t�F�N�g���g�p���Ă���̂Ŕ{���͑��ƈقȂ�
		}
		// ������K���}�U�[�h(�Đ펞)
		else if (sky_num ==  GetFlagID_("CONST_SS_SK_CONTACT_GARUMAZARD")) {		// Num9 = 45
			local id_garumazado = ReadNpc_("m185_00");
			g_npc_garumazado = ArrangePointNpc_(id_garumazado, "npc_6_garumazado");
			SetPointPosNoFit_(g_npc_garumazado, "npc_6_garumazado");	//�󒆂ɔz�u
			SetHideIfFar_(g_npc_garumazado, false);						//�������t�F�[�h
			SetScaleSilhouette(g_npc_garumazado, SCALE.NEO_BOSS, SILHOUETTE_WIDTH.NEO_BOSS);//�T�C�Y�̐ݒ�
			SetReactorMsg_(g_npc_garumazado, "NPC_BIG_GARUMAZARD_REC");
			//�É_�G�t�F�N�g�̐ݒ�
			efc_dark = SetPointWorldEffect_("ef731_02_mag_dark_pollen_field", "npc_6_garumazado");
			SetEffectScale_(efc_dark, EFC_SIZE);
		}
	}

	//-----------
	// ���n���z�u
	//-----------
	// ID������
	g_mine_boshoku			 <- C_NONE_ID;
	g_mine_bunndorudo		 <- C_NONE_ID;
	g_mine_azamuku			 <- C_NONE_ID;
	g_mine_ittaburu			 <- C_NONE_ID;
	g_mine_purometeusu		 <- C_NONE_ID;
	g_mine_garumazado		 <- C_NONE_ID;
	g_sky_monster_talk_mine	 <- C_NONE_ID;
	
	if (main_num == GetFlagID_("CONST_SM_SKY")) {									// Num0 = 8
		// ���{�[�V���b�Ndemo �N���n��
		if (sky_num ==  GetFlagID_("CONST_SS_SK_GO_CITY_SKY")						// Num9 = 12 or
		|| sky_num ==  GetFlagID_("CONST_SS_SK_CONTACT_G_BOWSHOCK")) {				// Num9 = 15
			g_mine_boshoku = SetPointBoxEventMine_("mine_1_boshoku", false);
		}
		// ���u���h���hdemo �N���n��
		else if (sky_num ==  GetFlagID_("CONST_SS_SK_GO_GRAVE_SKY")					// Num9 = 18 or
			 || sky_num ==  GetFlagID_("CONST_SS_SK_CONTACT_G_BUNDORUDO")) {		// Num9 = 21
			g_mine_bunndorudo = SetPointBoxEventMine_("mine_2_bunndorudo", false);
		}
		// ���A�[�U���[�Ndemo �N���n��
		else if (sky_num ==  GetFlagID_("CONST_SS_SK_GO_ICE_FIELD_SKY")				// Num9 = 24 or
			 || sky_num ==  GetFlagID_("CONST_SS_SK_CONTACT_G_AZAMUKU")) {			// Num9 = 27
			g_mine_azamuku = SetPointBoxEventMine_("mine_3_azamuku", false);
		}
		// ���C�b�^�u��demo �N���n��
		else if (sky_num ==  GetFlagID_("CONST_SS_SK_GO_PRISON_SKY")				// Num9 = 30 or
			 || sky_num ==  GetFlagID_("CONST_SS_SK_CONTACT_G_ITTABURU")) {			// Num9 = 33
			g_mine_ittaburu = SetPointBoxEventMine_("mine_4_ittaburu", false);
		}
		// ���f�X�o�[��demo �N���n��
		else if (sky_num ==  GetFlagID_("CONST_SS_SK_GO_VOLCANO_SKY")				// Num9 = 36 or
			 || sky_num ==  GetFlagID_("CONST_SS_SK_CONTACT_DEATH_PRO")) {			// Num9 = 39
			g_mine_purometeusu = SetPointBoxEventMine_("mine_5_purometeusu", false);
		}
		// ���K���}�U�[�hdemo �N���n��
		else if (sky_num ==  GetFlagID_("CONST_SS_SK_GO_CORE_SKY")					// Num9 = 42 or
			 || sky_num ==  GetFlagID_("CONST_SS_SK_CONTACT_GARUMAZARD")) {			// Num9 = 45
			g_mine_garumazado = SetPointBoxEventMine_("mine_6_garumazado", false);
		}
	}
	
	//---------------------------
	// �����̊Ԃɍ���p�j�p�ϐ�
	//---------------------------
	g_map_navi01 <- C_NONE_ID;	// �z�u�����X�^�[�̏ꏊ�ɏo���u�I�v�A�C�R��

	if (GetEventFlg_("BFG_BOSS_ENABLE") == true ){
		if(GetEventFlg_("BFG_SCENARIO_CLEAR_ALL") == true){	// Bit_46 �\�V�i���I�N���A
			uReadSetSkyMapMonster();
		}
	}else{
		SetEventFlg_("BFG_W00_00_EVENT_BG_AMBI_012_PLAY", false);
	}

	
	EventEnd_();
}

//------------------------------------------------
//		�t�B�[���h����J�n
//------------------------------------------------
function EventStartOperate()
{
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");			// Num0
	sky_num		 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");		// Num9

	if (main_num == GetFlagID_("CONST_SM_SKY")) {										// Num0 = 8
		// ���߂č���}�b�v�ɗ������Ƀ��i�[�e�̃��b�Z�[�W��\������
		if(GetEventFlg_("BFG_W00_1ST_MSG") == false){
			SetEventFlg_("BFG_W00_1ST_MSG", true);
			Wait_(20);
			// ���b�Z�[�W�\��
			OpenMsgWnd_();
			SetTalkName_("NAME_TAG_RENERTE");
			ShowMsg_("NPC_RENERTE_010");		// �u���c�c���E�̑啔���́@�K���r���X�̕�����
			KeyInputWait_();
			CloseMsgWnd_();
		}
		// ������{�[�V���b�N �퓬�J�n
		if (sky_num ==  GetFlagID_("CONST_SS_SK_PRE_BATTLE_G_BOWSHOCK")) {				// Num9 =  13
			SetNumFlg_(str_num_sub,  GetFlagID_("CONST_SS_SK_JDG_BATTLE_G_BOWSHOCK"));	// Num9 <- 14
			// VS.����{�[�V���b�N
			ChangeBattleParty_(22);
		}
		// �퓬����
		else if (sky_num ==  GetFlagID_("CONST_SS_SK_JDG_BATTLE_G_BOWSHOCK")			// Num9 =  14 or
			 || sky_num ==  GetFlagID_("CONST_SS_SK_JDG_REMATCH_G_BOWSHOCK")) {			// Num9 =  17
			SetNumFlg_(str_num_sub,  GetFlagID_("CONST_SS_SK_GO_GRAVE_SKY"));			// Num9 <- 18
			// �����ԕ��ɕ�����t���O��OFF�ɂ���
			SetEventFlg_("BFG_WEATHER_BLACK_POLLEN_CITY", false);
			// �ړ����u���g����悤�ɂ���
			SetEventFlg_("BFG_DONT_TRANSFER_GREEN_TO_CITY", false);	// ����-�����Ԃ̑嗤�ړ����u�̎g�p���֎~����t���O
			// �f���Đ���̕��A�ʒu
			SetReturnDemoMap_("W00_00");
			SetReturnDemoPosDir_(Vec3(-1269, 0, 45465), 155);
			// Demo626[����{�[�V���b�N�����F�{�[�V���b�N���S�i����MAP�j]�Đ�
			EventStartChangeDemo(626, FADE_COLOR_BLACK);
		}
		// ������u���h���h �퓬�J�n
		else if (sky_num ==  GetFlagID_("CONST_SS_SK_PRE_BATTLE_G_BUNDORUDO")) {		// Num9 = 19
			SetNumFlg_(str_num_sub,  GetFlagID_("CONST_SS_SK_JDG_BATTLE_G_BUNDORUDO"));	// Num9 <- 20
			
			// VS.����u���h���h
			ChangeBattleParty_(23);
		}
		// �퓬����
		else if (sky_num ==  GetFlagID_("CONST_SS_SK_JDG_BATTLE_G_BUNDORUDO")			// Num9 = 20 or
			 || sky_num ==  GetFlagID_("CONST_SS_SK_JDG_REMATCH_G_BUNDORUDO")) {		// Num9 = 23
			SetNumFlg_(str_num_sub,  GetFlagID_("CONST_SS_SK_GO_ICE_FIELD_SKY"));		// Num9 <- 24
			// �����ԕ��ɕ�����t���O��OFF�ɂ���
			SetEventFlg_("BFG_WEATHER_BLACK_POLLEN_GRAVE", false);
			// �ړ����u���g����悤�ɂ���
			SetEventFlg_("BFG_DONT_TRANSFER_CITY_TO_GRAVE", false);	// ����-�쓹�Ԃ̑嗤�ړ����u�̎g�p���֎~����t���O
			// �f���Đ���̕��A�ʒu
			SetReturnDemoMap_("W00_00");
			SetReturnDemoPosDir_(Vec3(1399, 0, 22933), -153);
			// Demo629[����u���h���h�����F�u���h���h���S�i����MAP�j]�Đ�
			EventStartChangeDemo(629, FADE_COLOR_BLACK);
		}
		// ������A�[�U���[�N �퓬�J�n
		else if (sky_num ==  GetFlagID_("CONST_SS_SK_PRE_BATTLE_G_AZAMUKU")) {			// Num9 = 25
			SetNumFlg_(str_num_sub,  GetFlagID_("CONST_SS_SK_JDG_BATTLE_G_AZAMUKU"));	// Num9 <- 26
			
			// VS.����A�[�U���[�N
			ChangeBattleParty_(24);
		}
		// �퓬����
		else if (sky_num ==  GetFlagID_("CONST_SS_SK_JDG_BATTLE_G_AZAMUKU")				// Num9 = 26 or
			 || sky_num ==  GetFlagID_("CONST_SS_SK_JDG_REMATCH_G_AZAMUKU")) {			// Num9 = 29
			SetNumFlg_(str_num_sub,  GetFlagID_("CONST_SS_SK_GO_PRISON_SKY"));			// Num9 <- 30
			// �����ԕ��ɕ�����t���O��OFF�ɂ���
			SetEventFlg_("BFG_WEATHER_BLACK_POLLEN_ICE", false);
			// �ړ����u���g����悤�ɂ���
			SetEventFlg_("BFG_DONT_TRANSFER_GRAVE_TO_ICE", false);	// �쓹-�X���Ԃ̑嗤�ړ����u�̎g�p���֎~����t���O
			// �f���Đ���̕��A�ʒu
			SetReturnDemoMap_("W00_00");
			SetReturnDemoPosDir_(Vec3(-1229, 0, 1553), -171);
			// Demo632[����A�[�U���[�N�����F�A�[�U���[�N���S�i����MAP�j]�Đ�
			EventStartChangeDemo(632, FADE_COLOR_BLACK);
		}
		// ������C�b�^�u�� �퓬�J�n
		else if (sky_num ==  GetFlagID_("CONST_SS_SK_PRE_BATTLE_G_ITTABURU")) {			// Num9 = 31
			SetNumFlg_(str_num_sub,  GetFlagID_("CONST_SS_SK_JDG_BATTLE_G_ITTABURU"));	// Num9 <- 32
			
			// VS.����C�b�^�u��
			ChangeBattleParty_(25);
		}
		// �퓬����
		else if (sky_num ==  GetFlagID_("CONST_SS_SK_JDG_BATTLE_G_ITTABURU")			// Num9 = 32 or
			 || sky_num ==  GetFlagID_("CONST_SS_SK_JDG_REMATCH_G_ITTABURU")) {			// Num9 = 35
			SetNumFlg_(str_num_sub,  GetFlagID_("CONST_SS_SK_GO_VOLCANO_SKY"));			// Num9 <- 36
			// �����ԕ��ɕ�����t���O��OFF�ɂ���
			SetEventFlg_("BFG_WEATHER_BLACK_POLLEN_SAND", false);
			// �ړ����u���g����悤�ɂ���
			SetEventFlg_("BFG_DONT_TRANSFER_ICE_TO_SAND", false);	// �X��-�����Ԃ̑嗤�ړ����u�̎g�p���֎~����t���O
			// �f���Đ���̕��A�ʒu
			SetReturnDemoMap_("W00_00");
			SetReturnDemoPosDir_(Vec3(1124, 0, -21007), 165);
			// Demo636[����C�b�^�u�������F�C�b�^�u�����S�i����MAP�j]�Đ�
			EventStartChangeDemo(635, FADE_COLOR_BLACK);
		}
		// ������f�X�o�[�� �퓬�J�n
		else if (sky_num ==  GetFlagID_("CONST_SS_SK_PRE_BATTLE_DEATH_PRO")) {			// Num9 = 37
			SetNumFlg_(str_num_sub,  GetFlagID_("CONST_SS_SK_JDG_BATTLE_DEATH_PRO"));	// Num9 <- 38
			
			// VS.����f�X�o�[��
			ChangeBattleParty_(26);
		}
		// �퓬����
		else if (sky_num ==  GetFlagID_("CONST_SS_SK_JDG_BATTLE_DEATH_PRO")				// Num9 = 38 or
			 || sky_num ==  GetFlagID_("CONST_SS_SK_JDG_REMATCH_DEATH_PRO")) {			// Num9 = 41
			SetNumFlg_(str_num_sub,  GetFlagID_("CONST_SS_SK_GO_CORE_SKY"));			// Num9 <- 42
			// �����ԕ��ɕ�����t���O��OFF�ɂ���
			SetEventFlg_("BFG_WEATHER_BLACK_POLLEN_VOLCANO", false);
			// �ړ����u���g����悤�ɂ���
			SetEventFlg_("BFG_DONT_TRANSFER_SAND_TO_VOLCANO", false);	// ����-�ΎR�Ԃ̑嗤�ړ����u�̎g�p���֎~����t���O
			// �f���Đ���̕��A�ʒu
			SetReturnDemoMap_("W00_00");
			SetReturnDemoPosDir_(Vec3(-1192, 0, -42768), 169);
			// Demo639[����f�X�o�[�������F�f�X�o�[�����S�i����MAP�j]�Đ�
			EventStartChangeDemo(639, FADE_COLOR_BLACK);
		}
		// ���K���}�U�[�h �퓬�J�n
		else if (sky_num ==  GetFlagID_("CONST_SS_SK_PRE_BATTLE_GARUMAZARD")) {			// Num9 = 43
			SetNumFlg_(str_num_sub,  GetFlagID_("CONST_SS_SK_JDG_BATTLE_GARUMAZARD"));	// Num9 <- 44
			
			// VS.�K���}�U�[�h
			ChangeBattleParty_(27);
		}
		// ���K���}�U�[�h �Đ�J�n
		else if (sky_num ==  GetFlagID_("CONST_SS_SK_PRE_REMATCH_GARUMAZARD")) {		// Num9 = 46
			SetNumFlg_(str_num_sub,  GetFlagID_("CONST_SS_SK_JDG_REMATCH_GARUMAZARD"));	// Num9 <- 47
			
			// VS.�K���}�U�[�h
			ChangeBattleParty_(27);
		}
		// �퓬����
		// ��Demo642[�K���}�U�[�h�����F�R�A����MAP]�Đ�
		else if (sky_num ==  GetFlagID_("CONST_SS_SK_JDG_BATTLE_GARUMAZARD")			// Num9 = 44 or
			 || sky_num ==  GetFlagID_("CONST_SS_SK_JDG_REMATCH_GARUMAZARD")) {			// Num9 = 47
			SetNumFlg_(str_num_sub,  GetFlagID_("CONST_SS_SK_WIN_GARUMAZARD_1"));		// Num9 <- 48
			// �R�A�}�b�v�ł̃t���C�g�V�O�i���g�p�֎~������
			SetEventFlg_("BFG_FLIGHT_PROHIBIT", false);
			// �ړ����u���g����悤�ɂ���
			SetEventFlg_("BFG_DONT_TRANSFER_VOLCANO_TO_CORE", false);	// �ΎR-�R�A�Ԃ̑嗤�ړ����u�̎g�p���֎~����t���O
			// �S�񕜏���
			RecoverAll_();
			EventStartChangeDemo(642, FADE_COLOR_BLACK);//�� demo642
		}
		// ��Demo643[�K���}�U�[�h�폟���F�V�ϒn�ه@]�Đ�
		else if (sky_num ==  GetFlagID_("CONST_SS_SK_WIN_GARUMAZARD_1")) {				// Num9 = 48
			SetNumFlg_(str_num_sub,  GetFlagID_("CONST_SS_SK_WIN_GARUMAZARD_2"));		// Num9 <- 49
			EventStartChangeDemo(643, FADE_COLOR_BLACK);
		}
		// ��Demo644[�K���}�U�[�h�폟���F�V�ϒn�هA]�Đ�
		else if (sky_num ==  GetFlagID_("CONST_SS_SK_WIN_GARUMAZARD_2")) {				// Num9 = 49
			SetNumFlg_(str_num_sub,  GetFlagID_("CONST_SS_SK_WIN_GARUMAZARD_3"));		// Num9 <- 50
			EventStartChangeDemo(644, FADE_COLOR_BLACK);
		}
		// ��Demo645[�K���}�U�[�h�폟���F�V�ϒn�هB]�Đ�
		else if (sky_num ==  GetFlagID_("CONST_SS_SK_WIN_GARUMAZARD_3")) {				// Num9 = 50
			SetNumFlg_(str_num_sub,  GetFlagID_("CONST_SS_SK_WIN_GARUMAZARD_4"));		// Num9 <- 51
			EventStartChangeDemo(645, FADE_COLOR_BLACK);
		}
		// ��Demo646[�K���}�U�[�h�폟���F�R�AMap]�Đ�
		else if (sky_num ==  GetFlagID_("CONST_SS_SK_WIN_GARUMAZARD_4")) {				// Num9 = 51
			SetNumFlg_(str_num_sub,  GetFlagID_("CONST_SS_SK_WIN_GARUMAZARD_5"));		// Num9 <- 52
			EventStartChangeDemo(646, FADE_COLOR_BLACK);
		}
		// ��Demo647[�K���}�U�[�h�폟���F�V�ϒn�ى񕜇@]�Đ�
		else if (sky_num ==  GetFlagID_("CONST_SS_SK_WIN_GARUMAZARD_5")) {				// Num9 = 52
			SetNumFlg_(str_num_sub,  GetFlagID_("CONST_SS_SK_WIN_GARUMAZARD_6"));		// Num9 <- 53
			EventStartChangeDemo(647, FADE_COLOR_BLACK);
		}
		// ��Demo648[�K���}�U�[�h�폟���F�V�ϒn�ى񕜇A]�Đ�
		else if (sky_num ==  GetFlagID_("CONST_SS_SK_WIN_GARUMAZARD_6")) {				// Num9 = 53
			SetNumFlg_(str_num_sub,  GetFlagID_("CONST_SS_SK_WIN_GARUMAZARD_7"));		// Num9 <- 54
			SetFade_(FADE_OUT, FADE_COLOR_WHITE, FADE_SHORT);
			SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
			WaitFade_();
			ChangeDemo_(648);
		}
		// ��Demo649[�K���}�U�[�h�폟���F�V�ϒn�ى񕜇B]�Đ�
		else if (sky_num ==  GetFlagID_("CONST_SS_SK_WIN_GARUMAZARD_7")) {				// Num9 = 54
			SetNumFlg_(str_num_sub,  GetFlagID_("CONST_SS_SK_WIN_GARUMAZARD_8"));		// Num9 <- 55
			SetFade_(FADE_OUT, FADE_COLOR_WHITE, FADE_SHORT);
			SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
			WaitFade_();
			ChangeDemo_(649);
		}
		// ��Demo650[�K���}�U�[�h�폟���F�R�AMap]�i��l�������ɕ�܂�Ă�j�Đ�
		else if (sky_num ==  GetFlagID_("CONST_SS_SK_WIN_GARUMAZARD_8")) {				// Num9 = 55
			SetNumFlg_(str_num_sub,  GetFlagID_("CONST_SS_SK_PLAY_STAFFROLL"));			// Num9 <- 56
			EventStartChangeDemo(650, FADE_COLOR_BLACK);
		}
		// ��Demo651[�X�^�b�t���[��]�Đ�
		else if (sky_num ==  GetFlagID_("CONST_SS_SK_PLAY_STAFFROLL")) {				// Num9 = 56
			// �t�F�[�h�A�E�g
			SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
			SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
			SetNumFlg_(str_num_sub,  GetFlagID_("CONST_SS_SK_PLAY_HERALD_DEMO"));		// Num9 <- 57
			ChangeEndRoll_();
		}
		// ��Demo652[�\��]�Đ�
		else if (sky_num ==  GetFlagID_("CONST_SS_SK_PLAY_HERALD_DEMO")) {				// Num9 = 57
			SetNumFlg_(str_num_sub,  GetFlagID_("CONST_SS_SK_DATA_SAVED"));				// Num9 <- 58

			//����̗􂯖ڃ��x�����グ��i���^���G���A���܂ނ��߃R�R�j
			SetNumFlg_( "NUM_FLG_CRACK_LEVEL", 3 );

			// �Z�[�u�|�C���g�����ނ��߂̃t���O
			SetEventFlg_("BFG_SAVE_POINT_FLAG", true);
			// �f���Đ���̕��A�ʒu
			SetReturnDemoMap_("H00_00");
			SetReturnDemoPosDir_(Vec3(-80.0, 197.0, 260.0), -154);
			// Demo[�\��]�Đ�
			EventStartChangeDemo(652, FADE_COLOR_BLACK);
		}
	}
	
	// ���̊Ԃɍ���p�j�p
	if(GetEventFlg_("BFG_BOSS_MONSTER_BATTLE_START")){
		uBossSkyMonsterAfterBattleTalk();
	} else {
		// �퓬��ł͂Ȃ��A����p�j���ݒ肳��Ă��鎞�ɁA����@�m���b�Z�[�W���o��
		if(g_sky_monster_npc != C_NONE_ID){
			if(GetEventFlg_("BFG_ITSUNOMANI_FIRST_MSG") == true){
				uBossSkyMonsterInitTalk();
			}
		}
	}

	EventEnd_()
}

//------------------------------------------------
//		�m�o�b�ڐG��
//------------------------------------------------
function TouchNpc()
{
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");			// Num0
	sky_num		 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");		// Num9
	
	local target = GetTargetId_();

	EventEnd_();
}

//------------------------------------------------
//		�n���ڐG��
//------------------------------------------------
function TouchEventMine()
{
	main_num	 = GetNumFlg_("NUM_SCENARIO_MAIN");			// Num0
	sky_num		 = GetNumFlg_("NUM_SCENARIO_SUB_SKY");		// Num9

	local target = GetTouchEventMineId_();
	
	switch (target) {
	case g_mine_boshoku :
		uMineBoshoku();
		break;
	case g_mine_bunndorudo :
		uMineBunndorudo();
		break;
	case g_mine_azamuku :
		uMineAzamuku();
		break;
	case g_mine_ittaburu :
		uMineIttaburu();
		break;
	case g_mine_purometeusu :
		uMinePurometeusu();
		break;
	case g_mine_garumazado :
		uMineGarumazado();
		break;
	case g_sky_monster_talk_mine:
		uMineBossSkyMonster();
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
//		�{�[�V���b�Ndemo �N���n���ɐG�ꂽ��
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineBoshoku()
{
	if (main_num == GetFlagID_("CONST_SM_SKY")) {										// Num0 = 8
		if (sky_num == GetFlagID_("CONST_SS_SK_GO_CITY_SKY")) {							// Num9 = 12
			DeleteEventMine_(g_mine_boshoku);
			SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_SK_PRE_BATTLE_G_BOWSHOCK"));	// Num9 = 13
			
			// Demo625�u����{�[�V���b�N�v�Đ�
			StopBgmChangeDemo(625);
		}
		else if (sky_num ==  GetFlagID_("CONST_SS_SK_CONTACT_G_BOWSHOCK")){				// Num9 = 15
			DeleteEventMine_(g_mine_boshoku);
			SetNumFlg_(str_num_sub, GetFlagID_("CONST_SS_SK_JDG_REMATCH_G_BOWSHOCK"));	// Num9 = 17

			// VS.����{�[�V���b�N
			ChangeBattleParty_(145);
		}
	}

}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		�u���h���hdemo �N���n���ɐG�ꂽ��
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineBunndorudo()
{
	if (main_num == GetFlagID_("CONST_SM_SKY")) {										// Num0 = 8
		if (sky_num ==  GetFlagID_("CONST_SS_SK_GO_GRAVE_SKY")) {						// Num9 = 18
			DeleteEventMine_(g_mine_bunndorudo);
			SetNumFlg_(str_num_sub,  GetFlagID_("CONST_SS_SK_PRE_BATTLE_G_BUNDORUDO"));	// Num9 <- 19
			
			// Demo628�u����u���h���h�v�Đ�
			StopBgmChangeDemo(628);
		}
		else if (sky_num ==  GetFlagID_("CONST_SS_SK_CONTACT_G_BUNDORUDO")){			// Num9 <- 21
			DeleteEventMine_(g_mine_bunndorudo);
			SetNumFlg_(str_num_sub,  GetFlagID_("CONST_SS_SK_JDG_REMATCH_G_BUNDORUDO"));// Num9 <- 23

			// VS.����u���h���h
			ChangeBattleParty_(146);
		}
	}

}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�A�[�U���[�Ndemo �N���n���ɐG�ꂽ��
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineAzamuku()
{
	if (main_num == GetFlagID_("CONST_SM_SKY")) {										// Num0 = 8
		if (sky_num ==  GetFlagID_("CONST_SS_SK_GO_ICE_FIELD_SKY")) {					// Num9 = 24
			DeleteEventMine_(g_mine_azamuku);
			SetNumFlg_(str_num_sub,  GetFlagID_("CONST_SS_SK_PRE_BATTLE_G_AZAMUKU"));	// Num9 <- 25
			
			// Demo631�u����A�[�U���[�N�v�Đ�
			StopBgmChangeDemo(631);
		}
		else if (sky_num ==  GetFlagID_("CONST_SS_SK_CONTACT_G_AZAMUKU")){				// Num9 <- 27
			DeleteEventMine_(g_mine_azamuku);
			SetNumFlg_(str_num_sub,  GetFlagID_("CONST_SS_SK_JDG_REMATCH_G_AZAMUKU"));	// Num9 <- 29

			// VS.����A�[�U���[�N
			ChangeBattleParty_(147);
		}
	}

}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�C�b�^�u��demo �N���n���ɐG�ꂽ��
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineIttaburu()
{
	if (main_num == GetFlagID_("CONST_SM_SKY")) {										// Num0 = 8
		if (sky_num ==  GetFlagID_("CONST_SS_SK_GO_PRISON_SKY")) {						// Num9 = 30
			DeleteEventMine_(g_mine_ittaburu);
			SetNumFlg_(str_num_sub,  GetFlagID_("CONST_SS_SK_PRE_BATTLE_G_ITTABURU"));	// Num9 <- 31
			
			// Demo634�u����C�b�^�u���v�Đ�
			StopBgmChangeDemo(634);
		}
		else if (sky_num ==  GetFlagID_("CONST_SS_SK_CONTACT_G_ITTABURU")){				// Num9 <- 33
			DeleteEventMine_(g_mine_ittaburu);
			SetNumFlg_(str_num_sub,  GetFlagID_("CONST_SS_SK_JDG_REMATCH_G_ITTABURU"));	// Num9 <- 35

			// VS.����C�b�^�u��
			ChangeBattleParty_(148);
		}
	}

}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�f�X�o�[��demo �N���n���ɐG�ꂽ��
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMinePurometeusu()
{
	if (main_num == GetFlagID_("CONST_SM_SKY")) {										// Num0 = 8
		if (sky_num ==  GetFlagID_("CONST_SS_SK_GO_VOLCANO_SKY")) {						// Num9 = 36
			DeleteEventMine_(g_mine_purometeusu);
			SetNumFlg_(str_num_sub,  GetFlagID_("CONST_SS_SK_PRE_BATTLE_DEATH_PRO"));	// Num9 <- 37
			
			// Demo638�u����f�X�o�[���v�Đ�
			StopBgmChangeDemo(638);
		}
		else if (sky_num ==  GetFlagID_("CONST_SS_SK_CONTACT_DEATH_PRO")){				// Num9 <- 39
			DeleteEventMine_(g_mine_purometeusu);
			SetNumFlg_(str_num_sub,  GetFlagID_("CONST_SS_SK_JDG_REMATCH_DEATH_PRO"));	// Num9 <- 41

			// VS.����f�X�o�[��
			ChangeBattleParty_(149);
		}
	}

}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		�K���}�U�[�hdemo �N���n���ɐG�ꂽ��
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineGarumazado()
{
	if (main_num == GetFlagID_("CONST_SM_SKY")) {										// Num0 = 8
		if (sky_num ==  GetFlagID_("CONST_SS_SK_GO_CORE_SKY")) {						// Num9 = 42
			DeleteEventMine_(g_mine_garumazado);
			SetNumFlg_(str_num_sub,  GetFlagID_("CONST_SS_SK_PRE_BATTLE_GARUMAZARD"));	// Num9 <- 43
			
			// Demo641�u�K���}�U�[�h�v�Đ�
			StopBgmChangeDemo(641);
		}
		else if (sky_num ==  GetFlagID_("CONST_SS_SK_CONTACT_GARUMAZARD")){				// Num9 <- 45
			DeleteEventMine_(g_mine_garumazado);
			SetNumFlg_(str_num_sub,  GetFlagID_("CONST_SS_SK_PRE_REMATCH_GARUMAZARD"));	// Num9 <- 46

			// Demo651�u�K���}�U�[�h�Đ�v�Đ�
			StopBgmChangeDemo(651);
		}
	}
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		���̊Ԃɍ���p�j�pNPC�E�n���ݒu
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uReadSetSkyMapMonster()
{
	// �G�t�F�N�g�������鋗��
	local effectDelDist = [
		1500,
		2000,
		2500,
		3000,
		3500,
	];

	// �����_���z�u�p�m�[�h��
	local fbxName = [
		"mine_boss_0",
		"mine_boss_1",
		"mine_boss_2",
		"mine_boss_3",
		"mine_boss_4",
		"mine_boss_5",
	];

	// ���̊ԂɃf�[�^��ǂ݂��߂��Ƃ�
	if (BossLoadNewSkyMapMonsterData_())
	{
		// ���񃁃b�Z�[�W�t���O�𗧂Ă�
		SetEventFlg_("BFG_ITSUNOMANI_FIRST_MSG", true);
		
		g_random <- GetRandom_(6);	// �O���[�o���ϐ��ň���
//		g_random = 0;				// �f�o�b�O�p
		DebugPrint("���̊Ԃɍ���p�jNPC�� [" + (g_random + 1) + "] �ɐݒu����܂���");
		
		local skyMonsterResId = ReadNpc_(BossGetSkyMapMonsterResName_());
		g_sky_monster_npc = ArrangePointNpc_(skyMonsterResId, fbxName[g_random]);
		SetScaleSilhouette(g_sky_monster_npc, SCALE.BOSS_SKY, SILHOUETTE_WIDTH.T);
		SetVisible(g_sky_monster_npc, true);
		SetPointPosNoFit_(g_sky_monster_npc, fbxName[g_random]);	// �n�ʂ�艺�ɒu�������̂ŁASetPointPosNoFit_�Œu���Ȃ���
		
		// �����X�^�[���ݒ�i���A�N�^�[�Œ��ׂ��������X�^�[��񂪏o��悤�Ɂj
		BossSetupSkyMapMonsterNPC_(g_sky_monster_npc);
		// �n���ݒu
		g_sky_monster_talk_mine = SetPointCircleEventMine_(fbxName[g_random], false);
		
		// ���񂾂�G�t�F�N�g�����Ȃ��Ȃ�悤�ɏ����鋗����ς��������G�t�F�N�g��ݒ�
		for(local i = 0; i < 5; i++){
			AddNearPlayerStopEffect_(g_sky_monster_npc, effectDelDist[i], "ef300_50_thundercloud01", ATTACH_EFFECT2);
		}
		// �Ō�܂�NPC�Ɏc���Ă���G�t�F�N�g
		LoadEffect_("ef300_56_thundercloud02");
		SetSelectBoneEffect_("ef300_56_thundercloud02", g_sky_monster_npc, ATTACH_EFFECT2);
		
		// �i�r�}�b�v�A�C�R���ݒu
		g_map_navi01 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.MONSTER, fbxName[g_random]);
		SetNaviMapIconVisible_(g_map_navi01, false);
		
		// �i�r�}�b�v������p�ɕύX
		SetDispFlightMap_(true);
		
		// BGM��ύX
		SetEventFlg_("BFG_W00_00_EVENT_BG_AMBI_012_PLAY", true);
		
	// ���̊ԂɃf�[�^��������
	} else {
		SetEventFlg_("BFG_W00_00_EVENT_BG_AMBI_012_PLAY", false);
	}
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		���̊Ԃɍ���p�j �n���N������b
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uMineBossSkyMonster()
{
	local player = GetPlayerId_();
	local mons_num = GetFreeMonsterNum_();
	if(mons_num >= 1){	// �󂫂���������퓬
		SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
		SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
		WaitFade_();
		
		SetVisible(player, false);
		SetCameraEye_(BossGetTalkCameraEye_(g_sky_monster_npc));
		SetCameraTarget_(BossGetTalkCameraTarget_(g_sky_monster_npc));
		
		SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
		WaitFade_();

		OpenMsgWnd_();
			local kindId = BossGetSkyMapMonsterKindId_();
			SetExchangeMonsterKindName_(kindId);
			ShowMsg_("BOSS_EVENT_MSG_01");
			KeyInputWait_();
		CloseMsgWnd_();
		
		// �u�͂��v
		if(GetQueryResult_() == QUERY2_0){
			// �퓬���[�V����
			SetMotion_(g_sky_monster_npc, MOT_ATTACK, BLEND_N);
			Wait_(30);
			SetEventFlg_("BFG_BOSS_MONSTER_BATTLE_START", true);
			BossSetupSkyMapMonsterParty_();
			ChangeBattlePartyUseHitMap_(BossGetSkyMapMonsterPartyID_());
			DeleteEventMine_(g_sky_monster_talk_mine);
			g_sky_monster_talk_mine = C_NONE_ID;
		}
		// �u�������v
		else{
			// �����̒l�����ĕ��A�ꏊ��ς���
			switch (g_random) {
			case 0 :
				uPlayableReset(250.0, 0.0, 60000.0, 180);
				break;
			case 1 :
				uPlayableReset(250.0, 0.0, 38000.0, 180);
				break;
			case 2 :
				uPlayableReset(250.0, 0.0, 15000.0, 180);
				break;
			case 3 :
				uPlayableReset(250.0, 0.0, -7000.0, 180);
				break;
			case 4 :
				uPlayableReset(250.0, 0.0, -30000.0, 180);
				break;
			case 5 :
				uPlayableReset(250.0, 0.0, -51000.0, 180);
				break;
			default :
				DebugPrint("WARNING : g_random�̒l���s���ł�");
				break;
			}
		}
	}
	else{
		OpenMsgWnd_();
		ShowMsg_("BOSS_EVENT_MSG_00");
		KeyInputWait_();
		CloseMsgWnd_();
		CommPlayerTurnMoveDirWalk(-30);	// ���Ό����ɖ߂�
	}
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		���̊Ԃɍ���p�j ����@�m���b�Z�[�W
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uBossSkyMonsterInitTalk()
{
	// ���񃁃b�Z�[�W�t���O���~�낷
	SetEventFlg_("BFG_ITSUNOMANI_FIRST_MSG", false);
	// ���b�Z�[�W�\��
	OpenMsgWnd_();
		SetTalkName_("NAME_TAG_REACTOR");
		SetNaviMapIconVisible_(g_map_navi01, true);
		ShowMsg_("BOSS_RECEIVE_MSG_00");	// ����G���A���Ɂ@�ٗl�ȃ����X�^�[���@�m���܂����B
		KeyInputWait_();
	CloseMsgWnd_();
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		���̊Ԃɍ���p�j �퓬�I���㏈��
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uBossSkyMonsterAfterBattleTalk()
{
	SetMotion_(g_sky_monster_npc, MOT_WAIT, BLEND_N);
	local player = GetPlayerId_();
	
	if(GetBattleEndType_() == END_TYPE_WIN){
		// �t�F�[�h�C��
		SetCameraEye_(BossGetTalkCameraEye_(g_sky_monster_npc));
		SetCameraTarget_(BossGetTalkCameraTarget_(g_sky_monster_npc));
		
		SetFade_(FADE_IN, FADE_COLOR_BLACK, FADE_DEF);
		WaitFade_();
		
		// ���Ԃɂ��邩�ǂ������b�Z�[�W
		OpenMsgWnd_();
			uBossAddFellow();
		CloseMsgWnd_();
		
		// �����X�^�[���t�F�[�h�A�E�g
		SetManualCalcAlpha_(g_sky_monster_npc, true);
		local task_fade = Task_ObjectFadeOut_(g_sky_monster_npc, FADE_DEF);
		WaitTask(task_fade);
		
		BossSetReadFlagToSkyMapMonster_();	// ���̊Ԃɍ���p�j�����X�^�[�̃f�[�^�����ǂɂ���
		
		// �t�F�[�h�A�E�g
		// �}�b�v�`�F���W���BGM�ݒ�̃t���O��ύX���邽��
		// ������BGM���t�F�[�h���Ȃ�
		// ���̂��߁A�X�N���v�g�ŉ�ʃt�F�[�h�ɍ��킹��BGM���t�F�[�h������
		FieldBgmStop_(FADE_MAPCHANGE);
		SetFade_(FADE_OUT, FADE_COLOR_BLACK, FADE_DEF);
		WaitFade_();
		
		// �v���C���[���f��
		SetVisible(player, true);
		// �z�u���������X�^�[�m�o�b���폜���邽�߂Ƀ}�b�v�`�F���W
		ChangeMapPosDir_(MAP_ID, GetPos_(player), GetDir_(player));
	}
	SetEventFlg_("BFG_BOSS_MONSTER_BATTLE_START", false);
}


//++++++++++++++++++++++++++++++++++++++++++++++++
//		���̊Ԃɍ���p�j ���ԉ����t���[
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �I���������ǂ���
//++++++++++++++++++++++++++++++++++++++++++++++++
function uBossAddFellow()
{
	local kindId = BossGetSkyMapMonsterKindId_();
	SetExchangeMonsterKindName_(kindId);
	SetExchangeMonsterKindName_(kindId);
	ShowMsg_("BOSS_ADDFELLOW_MSG_00");			// �Ȃ�Ɓ@<exchange/>���@����������
	KeyInputWait_();
	
	// �u�͂��v
	if(GetQueryResult_() == QUERY2_0){
		CloseMsgWnd_();
		
		// ���b�Z�[�W
		OpenMsgWnd_();
			local kindId = BossGetSkyMapMonsterKindId_();
			SetExchangeMonsterKindName_(kindId);
			ShowMsg_("BOSS_ADDFELLOW_MSG_01");	// <exchange/>���@���ԂɂȂ����I
			// ����ME(�d�v�A�C�e���擾�Ɠ���)
			PlayMe_("ME_010");
			WaitMe_();
			KeyInputWait_();
		CloseMsgWnd_();
		
		// �����X�^�[��������
		local task_fellow = Task_BossSkyMapMonsterAddFellow_();	//�����X�^�[��������
		WaitTask(task_fellow);
		// �����X�^�[���t�F�[�h�A�E�g
		SetManualCalcAlpha_(g_sky_monster_npc, true);
		local task_fade = Task_ObjectFadeOut_(g_sky_monster_npc, FADE_DEF);
		WaitTask(task_fade);
	}
	// �u�������v
	else{
		uBossNoAddFellow();
	}
}

//++++++++++++++++++++++++++++++++++++++++++++++++
//		���̊Ԃɍ���p�j ���ԉ��������ۂ����ۂ̏���
//------------------------------------------------
//	����	: �Ȃ�
//	�߂�l	: �Ȃ�
//++++++++++++++++++++++++++++++++++++++++++++++++
function uBossNoAddFellow()
{
	local kindId = BossGetSkyMapMonsterKindId_();
	SetExchangeMonsterKindName_(kindId);
	ShowMsg_("BOSS_NOTFELLOW_MSG_00");		// �u���Ԃɂ��Ȃ��ā@�{���ɂ�낵���ł��傤���H
	KeyInputWait_();
	// �u�͂��v
	if(GetQueryResult_() == QUERY2_0){
		SetExchangeMonsterKindName_(kindId);
		ShowMsg_("BOSS_NOTFELLOW_MSG_01");	// �u<exchange/>�́@���݂������ɋA���čs���܂����B
		KeyInputWait_();
	}
	// �u�������v
	else{
		uBossAddFellow()
	}
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

