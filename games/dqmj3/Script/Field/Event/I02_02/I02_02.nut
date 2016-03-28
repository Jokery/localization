//===================== I02_02�X�̈�� �|�{�{�� ====================


//------------------------------------------------
//		�퓬�I����
//------------------------------------------------
function AfterBattle()
{
	local main_num			= GetNumFlg_("NUM_SCENARIO_MAIN");							// Num0
	local ice_event_num		= GetNumFlg_("NUM_SCENARIO_SUB_ICE");						// Num5

	// �A�[�U���[�N�ɕ���������NUM�t���O��ύX���鏈���i�v���Ӂj
	// �C�x���g�u���b�N��EventStartOperate()�ł͔s�k�𔻒�ł��Ȃ��̂�
	// �����Ŕs�k�̔���ƃt���O�ύX���s���B
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){									// Num0 = 4
		if(ice_event_num == GetFlagID_("CONST_SS_IF_JDG_BATTLE_AZAMUKU")){				// Num5 = 23
			// �A�[�U���[�N�ɔs�k
			if(GetBattleEndType_() == END_TYPE_LOSE){
				SetNumFlg_("NUM_SCENARIO_SUB_ICE", GetFlagID_("CONST_SS_IF_RE_CONTACT_AZAMUKU"));// Num5 <- 24
			}
		}
		//�Đ펞
		if(ice_event_num == GetFlagID_("CONST_SS_IF_JDG_REMATCH_AZAMUKU")){				// Num5 = 26
			// �A�[�U���[�N�ɔs�k
			if(GetBattleEndType_() == END_TYPE_LOSE){
				SetNumFlg_("NUM_SCENARIO_SUB_ICE", GetFlagID_("CONST_SS_IF_RE_CONTACT_AZAMUKU"));// Num5 <- 24
			}
		}
	}

	EventEnd_();
}
//------------------------------------------------
//		�}�b�v�ɓ���O
//------------------------------------------------
function BeforeInitMap()
{
	local main_num			 = GetNumFlg_("NUM_SCENARIO_MAIN");							// Num0
	local ice_event_num		 = GetNumFlg_("NUM_SCENARIO_SUB_ICE");						// Num5
	
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
	local main_num			 = GetNumFlg_("NUM_SCENARIO_MAIN");							// Num0
	local ice_event_num		 = GetNumFlg_("NUM_SCENARIO_SUB_ICE");						// Num5

	// BGM�Đ��p�t���O
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){									// Num0 = 4
		if(ice_event_num >= GetFlagID_("CONST_SS_IF_CONTACT_AZAMUKU")					// Num5 = 21 �ȏ�
		&& ice_event_num <= GetFlagID_("CONST_SS_IF_JDG_REMATCH_AZAMUKU")){				// Num5 = 26 �ȉ�
			SetEventFlg_("BFG_I02_02_EVENT_BGM007_PLAY",true);
		}else{
			SetEventFlg_("BFG_I02_02_EVENT_BGM007_PLAY",false);
		}
	}
	
	//----------
	// ��NPC�z�u
	//----------
	// ID������
	g_azamuku	 <- C_NONE_ID;
	g_todo		 <- C_NONE_ID;
	g_silver	 <- C_NONE_ID;

	// ���\�[�X�ǂݍ���
	local id_azamuku   = ReadNpc_("m204_00");	// �A�[�U���[�N
	local id_todo	   = ReadNpc_("n039");		// �g�[�h�[
	local id_silver	   = ReadNpc_("m077_00");	// �V���o�[

	// ���A�[�U���[�N
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){									// Num0 = 4
		// [��]�̐���]�̍Đ���
		if(ice_event_num == GetFlagID_("CONST_SS_IF_CONTACT_AZAMUKU")){					// Num5 = 21
			g_azamuku = ArrangePointNpc_(id_azamuku, "Boss");
			local aza_strike = ReadMotion_(g_azamuku, "m204_00_strike_L");			// ���u��������L
			SetMotion_(g_azamuku, aza_strike, BLEND_L)								//�A�U�@���u��������
			LoadEffect_("ef730_01_oth_dark_aura01");
			local efc_azamuku = SetSelectBoneEffectSetOffset_("ef730_01_oth_dark_aura01", g_azamuku, ATTACH_EFFECT2, Vec3(0.0, -10.0, 0.0));
			SetTalkTurn_(g_azamuku, false);	// �b�������Ă��U������Ȃ�
			SetReactorMsg_(g_azamuku, "NPC_AZMK_REC");
		}
		// ���A�[�U���[�N(�Đ�)
		if(ice_event_num == GetFlagID_("CONST_SS_IF_RE_CONTACT_AZAMUKU")){				// Num5 = 24
			g_azamuku = ArrangePointNpc_(id_azamuku, "Boss");
			local aza_strike = ReadMotion_(g_azamuku, "m204_00_strike_L");			// ���u��������L
			SetMotion_(g_azamuku, aza_strike, BLEND_L)								//�A�U�@���u��������
			LoadEffect_("ef730_01_oth_dark_aura01");
			local efc_azamuku = SetSelectBoneEffectSetOffset_("ef730_01_oth_dark_aura01", g_azamuku, ATTACH_EFFECT2, Vec3(0.0, -10.0, 0.0));
			SetReactorMsg_(g_azamuku, "NPC_AZMK_REC");
		}
	}

	// ���g�[�h�[�A�V���o�[
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){									// Num0 = 4
		if(ice_event_num > GetFlagID_("CONST_SS_IF_MOVE_THE_WORLD_4")){					// Num5 > 35
			g_todo = ArrangePointNpc_(id_todo, "npc_todo");
			SetMeshVisible_(g_todo, "Model_2", false);	// �I�T�̏�
			SetReactorMsg_(g_todo, "NPC_TODO_REC");
			SetTalkCameraType_(g_todo,TALK_CAMERA_UP);//�J�����̐ݒ�
			SetScaleSilhouette(g_todo, SCALE.TODO ,SILHOUETTE_WIDTH.TODO);//�T�C�Y�̐ݒ�

			g_silver = ArrangePointNpc_(id_silver, "npc_silver");
			SetReactorMsg_(g_silver, "NPC_SILVER_REC");
			SetTalkCameraType_(g_silver,TALK_CAMERA_UP);//�J�����̐ݒ�
			SetScaleSilhouette(g_silver, SCALE.N ,SILHOUETTE_WIDTH.N);//�T�C�Y�̐ݒ�
		}
	}

	//-----------
	// ���n���z�u
	//-----------
	// ID������
	g_mine01		 <- C_NONE_ID;
	g_mine03		 <- C_NONE_ID;
	g_mine04		 <- C_NONE_ID;
	g_mine05		 <- C_NONE_ID;
	g_mine06		 <- C_NONE_ID;
	g_mine_ruler01	 <- C_NONE_ID;

	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){									// Num0 = 4
		// ���A�[�U���[�N�ɋ߂Â��ƍĐ킷��n��
		if(ice_event_num == GetFlagID_("CONST_SS_IF_RE_CONTACT_AZAMUKU")){				// Num5 = 24
			g_mine06 = SetPointBoxEventMine_("mine06", false);
		}
		// ���������ő���ɏ�������A�N�^�[�𒲂ׂ�n��
		if(ice_event_num == GetFlagID_("CONST_SS_IF_EXAMINE_THE_PEDESTAL")){			// Num5 = 27
			g_mine01 = SetPointBoxEventMine_("mine01", true);
		}
		// ���������ŉ�ꂽ�f�B�X�v���C�𒲂ׂ�n��
		if(ice_event_num > GetFlagID_("CONST_SS_IF_DARK_MASTER_DEMO_3")){				// Num5 > 30
			g_mine03 = SetPointBoxEventMine_("mine03", true);
		}
		// �����L���̃��A�N�^�[�𒲂ׂ�n��
		if(ice_event_num == GetFlagID_("CONST_SS_IF_DARK_MASTER_DEMO_3")){				// Num5 = 30
			g_mine04 = SetPointBoxEventMine_("mine04", true);
		}
		// ���T�u�V�X�e���𒲂ׂ�n��
		if(ice_event_num == GetFlagID_("CONST_SS_IF_EXAMINE_BROKEN_SCREEN")){			// Num5 = 31
			g_mine05 = SetPointBoxEventMine_("mine05", true);
		}
	}
	if(main_num >= GetFlagID_("CONST_SM_PRISON")){										// Num0 = 5
		// ���������ŉ�ꂽ�f�B�X�v���C�𒲂ׂ�n��
		g_mine03 = SetPointBoxEventMine_("mine03", true);
	}
	// �����[���|�C���g(�{�X��O)
	g_mine_ruler01 = SetPointCircleEventMine_("mine_ruler_01", true);

	DebugPrint("�C�x���g�n���̓Ǎ�");
	
	//---------------
	// ���M�~�b�N�z�u
	//---------------
	// ID������
	g_gmk_rukia_rec			<- C_NONE_ID;
	g_gmk_rulerpoint		<- C_NONE_ID;
	
	// �����L�A�̃��A�N�^�[
	local id_rec	= ReadGimmick_("o_dem_15");		// ���A�N�^�[
	g_gmk_rukia_rec = ArrangePointGimmick_("o_dem_15", id_rec, "g_rec");

	// �����A�N�^�[�̓y��
	local id_rec_dodai = ReadGimmick_("o_I02_19");
	local gmk_rec_dodai = ArrangePointGimmick_("o_I02_19", id_rec_dodai, "g_rec_dai");
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){									// Num0 = 4
		if(ice_event_num < GetFlagID_("CONST_SS_IF_DARK_MASTER_DEMO_3")){				// Num5 < 30
			SetMotion_(gmk_rec_dodai, MOT_GIMMICK_2, BLEND_N);
		} else {
			SetMotion_(gmk_rec_dodai, MOT_GIMMICK_0, BLEND_N);
		}
	} else {
		SetMotion_(gmk_rec_dodai, MOT_GIMMICK_0, BLEND_N);
	}

	// �����u�̉��G�t�F�N�g
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){									// Num0 = 4
		if(ice_event_num <= GetFlagID_("CONST_SS_IF_EXAMINE_BROKEN_SCREEN")){			// Num5 <= 31
			local  efc_smoke0, efc_smoke1;
			LoadEffect_("ef721_06_nat_smoke_s02");
			efc_smoke0 = SetPointWorldEffect_("ef721_06_nat_smoke_s02", "efc_smoke000");
			SetEffectScale_(efc_smoke0, 2.0);
			efc_smoke1 = SetPointWorldEffect_("ef721_06_nat_smoke_s02", "efc_smoke001");
			SetEffectScale_(efc_smoke1, 2.0);
		}
	}
	
	// ���f�B�X�v���C���(�ʏ�)
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){									// Num0 = 4
		if(ice_event_num < GetFlagID_("CONST_SS_IF_DARK_MASTER_DEMO_3")){				// Num5 < 30
			local id_screen	 = ReadGimmick_("o_I02_17");		// �f�B�X�v���C���(�ʏ�)
			local gmk_screen = ArrangePointGimmick_("o_I02_17", id_screen, "g_screen");
		}
	}

	// ���T�u�V�X�e��
	local id_sabsystem	 = ReadGimmick_("o_I02_18");		// �T�u�V�X�e��
	local sabsystem		 = ArrangePointGimmick_("o_I02_18", id_sabsystem, "g_sabsystem");
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){									// Num0 = 4
		if(ice_event_num == GetFlagID_("CONST_SS_IF_EXAMINE_BROKEN_SCREEN")){			// Num5 = 31
			SetMotion_(sabsystem, MOT_GIMMICK_1, BLEND_N);
		} else {
			SetMotion_(sabsystem, MOT_GIMMICK_0, BLEND_N);
		}
	} else {
		SetMotion_(sabsystem, MOT_GIMMICK_0, BLEND_N);
	}

	// �����[���|�C���g
	local id_rulerpoint	 = ReadGimmick_("o_com_08");		// ���[���|�C���g
	g_gmk_rulerpoint	 = ArrangePointGimmick_("o_com_08", id_rulerpoint, "g_rulerpoint");
	SetMotion_(g_gmk_rulerpoint, MOT_GIMMICK_0, BLEND_N);
	if(GetEventFlg_("BFG_RULER_ADD_016") == true){										// Bit_216 ���[���ǉ� �|�{�{��
		SetMotion_(g_gmk_rulerpoint, MOT_GIMMICK_2, BLEND_N);
		//���[���|�C���g�A�C�R��
		local icon01 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.RULER_POINT , "g_rulerpoint");
		SetNaviMapIconVisible_(icon01, true);
	}

	//-------------------------
	// �����A�N�^�[�|�C���g�z�u
	//-------------------------
	// ���|�{���䑕�u
	local reactorPoint01 = ArrangeMsgReactorPoint("recpoint_01_monitor", GetFlagID_("BFG_REACTER_POINT_063")// Bit_1562
		, SHORT_DIST, "REC_POINT_ICE_01", "REC_POINT_ICE_01_2");

	// �����E���̕c
	local reactorPoint02 = ArrangeMsgReactorPoint("recpoint_02_nae", GetFlagID_("BFG_REACTER_POINT_064")// Bit_1563
		, SHORT_DIST, "REC_POINT_ICE_02", "REC_POINT_ICE_02_2");

	// �����[���|�C���g
	local reactorPoint_ruler = ArrangeMsgReactorPoint("recpoint_ruler", GetFlagID_("BFG_REACTER_POINT_010")// Bit_1520 ���A�N�^�[ ���[���|�C���g
		, SHORT_DIST, "REC_POINT_ICE_RULER", "REC_POINT_ICE_RULER_2");

	//-------------------------
	// ���i�r�}�b�v�A�C�R���z�u
	//-------------------------
	// ���u�I�v
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){									// Num0 = 4
		if(ice_event_num == GetFlagID_("CONST_SS_IF_EXAMINE_THE_PEDESTAL")){			// Num5 = 27
			local exclamation01 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "g_screen");  // ���j�^�[
		}
	}

	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){									// Num0 = 4
		if(ice_event_num == GetFlagID_("CONST_SS_IF_DARK_MASTER_DEMO_3")){				// Num5 = 30
			local exclamation02 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "g_rec");  // ���L�A�̃��A�N�^�[
		}
	}
	
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){									// Num0 = 4
		if(ice_event_num == GetFlagID_("CONST_SS_IF_EXAMINE_BROKEN_SCREEN")){			// Num5 = 31
			local exclamation03 = ArrangePointNaviMapIcon_(NAVIMAP_ICON.EXCLAMATION, "g_sabsystem");  // �T�u�V�X�e��
		}
	}
	
	EventEnd_();
}


//------------------------------------------------
//		�t�B�[���h����J�n
//------------------------------------------------
function EventStartOperate()
{
	local main_num			= GetNumFlg_("NUM_SCENARIO_MAIN");							// Num0
	local ice_event_num		= GetNumFlg_("NUM_SCENARIO_SUB_ICE");						// Num5

	//-------------
	// ���f���̍Đ�
	//-------------
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){									// Num0 = 4
		// ���͂��߂Ĕ|�{�{�݂ɓ��������̃f��
		if(ice_event_num == GetFlagID_("CONST_SS_IF_GO_TO_THE_ICE_RUINS")){				// Num5 = 20
			SetNumFlg_("NUM_SCENARIO_SUB_ICE", GetFlagID_("CONST_SS_IF_CONTACT_AZAMUKU"));// Num5 <- 21
			// �f���̕��A�ʒu
			//SetReturnDemoPosDir_(Vec3(-716.604, 125.381, -864.738), 90);
			// 318[��]�̐���]
			EventStartChangeDemo(318, FADE_COLOR_BLACK);
		}
		// ���_�[�N�}�X�^�[�̒��� �ߋ��f��
		if(ice_event_num == GetFlagID_("CONST_SS_IF_DARK_MASTER_DEMO_1")){				// Num5 = 28
			SetNumFlg_("NUM_SCENARIO_SUB_ICE", GetFlagID_("CONST_SS_IF_DARK_MASTER_DEMO_2"));// Num5 <- 29
			// 323[�_�[�N�}�X�^�[�̒��� �ߋ��f��]
			SetFade_(FADE_OUT, FADE_COLOR_WHITE, FADE_SHORT);
			SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
			WaitFade_();

			ChangeDemo_(323); 
		}
		// ���_�[�N�}�X�^�[�̒��� ���j�^�[���
		if(ice_event_num == GetFlagID_("CONST_SS_IF_DARK_MASTER_DEMO_2")){				// Num5 = 29
			SetNumFlg_("NUM_SCENARIO_SUB_ICE", GetFlagID_("CONST_SS_IF_DARK_MASTER_DEMO_3"));// Num5 <- 30
			// �f���̕��A�ʒu
			SetReturnDemoPosDir_(Vec3(188.374, 7.829, -0.574), 91);
			// 324[�_�[�N�}�X�^�[�̒��� ���j�^�[���]
			SetFade_(FADE_OUT, FADE_COLOR_WHITE, FADE_SHORT);
			SetFadeSub_(FADE_OUT, FADE_COLOR_BLACK, FADE_SHORT);
			WaitFade_();

			ChangeDemo_(324); 
		}
		// �����̍�����
		if(ice_event_num == GetFlagID_("CONST_SS_IF_MOVE_THE_WORLD_4")){				// Num5 = 35
			SetNumFlg_("NUM_SCENARIO_SUB_ICE",GetFlagID_("CONST_SS_IF_CLEAR_ICE_FIELD"));// Num5 = 36
			// �f���̕��A�ʒu
			SetReturnDemoPosDir_(Vec3(62.385, 0.007, -0.574), -89);
			// 330[���̍�����]
			EventStartChangeDemo(330, FADE_COLOR_BLACK);
		}
	}
	//-------------
	// ���퓬�J�n
	//-------------
	// ��[�A�[�U���[�N��]
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){									// Num0 = 4
		if(ice_event_num == GetFlagID_("CONST_SS_IF_PRE_BATTLE_AZAMUKU")){				// Num5 = 22
			SetNumFlg_("NUM_SCENARIO_SUB_ICE", GetFlagID_("CONST_SS_IF_JDG_BATTLE_AZAMUKU"));// Num5 <- 23
			ChangeBattleParty_(16);	// �A�[�U���[�N��
		}
	}
	// ��[�A�[�U���[�N�Đ�]
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){									// Num0 = 4
		if(ice_event_num == GetFlagID_("CONST_SS_IF_PRE_REMATCH_AZAMUKU")){				// Num5 = 25
			SetNumFlg_("NUM_SCENARIO_SUB_ICE", GetFlagID_("CONST_SS_IF_JDG_REMATCH_AZAMUKU"));// Num5 <- 26
			ChangeBattleParty_(16);	// �A�[�U���[�N��
		}
	}

	//-------------
	// ���퓬����
	//-------------
	if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){									// Num0 = 4
		// ��[�A�[�U���[�N��]
		if(ice_event_num == GetFlagID_("CONST_SS_IF_JDG_BATTLE_AZAMUKU")){				// Num5 = 23
			// �A�[�U���[�N�ɏ���
			if (GetBattleEndType_() == BATTLE_END_TYPE_WIN){
				SetNumFlg_("NUM_SCENARIO_SUB_ICE", GetFlagID_("CONST_SS_IF_EXAMINE_THE_PEDESTAL"));// Num5 <- 27
				// �f����ɐݒ肳����l���̈ʒu�ƌ���
				SetReturnDemoPosDir_(Vec3(143.990, 7.828, -1.906), 86);
				// 321[�A�[�U���[�N�� ����]
				EventStartChangeDemo(321, FADE_COLOR_BLACK);
			// �A�[�U���[�N�ɔs�k
			}else{
				// �����ł̓A�[�U���[�N��̔s�k���肪�ł��Ȃ��̂�
				// �C�x���g�u���b�N��AfterBattle()�Ŕs�k�̔���ƃt���O�ύX���s���B
			}
		}
		// ��[�A�[�U���[�N�Đ�]
		if(ice_event_num == GetFlagID_("CONST_SS_IF_JDG_REMATCH_AZAMUKU")){				// Num5 = 26
			// �A�[�U���[�N�ɏ���
			if (GetBattleEndType_() == BATTLE_END_TYPE_WIN){
				SetNumFlg_("NUM_SCENARIO_SUB_ICE", GetFlagID_("CONST_SS_IF_EXAMINE_THE_PEDESTAL"));// Num5 <- 27
				// �f����ɐݒ肳����l���̈ʒu�ƌ���
				SetReturnDemoPosDir_(Vec3(143.990, 7.828, -1.906), 86);
				// 321[�A�[�U���[�N�� ����]
				EventStartChangeDemo(321, FADE_COLOR_BLACK);
			// �A�[�U���[�N�ɔs�k
			}else{
				// �����ł̓A�[�U���[�N��̔s�k���肪�ł��Ȃ��̂�
				// �C�x���g�u���b�N��AfterBattle()�Ŕs�k�̔���ƃt���O�ύX���s���B
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
	local main_num			= GetNumFlg_("NUM_SCENARIO_MAIN");							// Num0
	local ice_event_num		= GetNumFlg_("NUM_SCENARIO_SUB_ICE");						// Num5

	local target = GetTargetId_();
	
	// ���A�[�U���[�N
	if(target == g_azamuku){
		if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){								// Num0 = 4
			if(ice_event_num == GetFlagID_("CONST_SS_IF_CONTACT_AZAMUKU")){				// Num5 = 21
				SetNumFlg_("NUM_SCENARIO_SUB_ICE",GetFlagID_("CONST_SS_IF_PRE_BATTLE_AZAMUKU"));// Num5 <- 22
				// Demo319[�A�[�U���[�N�퓬�O]�Đ�
				TouchNpcChangeDemo(319);
			}
		}
	}

	// ���g�[�h�[
	if(target == g_todo){
		if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){									// Num0 = 4
			if(ice_event_num > GetFlagID_("CONST_SS_IF_MOVE_THE_WORLD_4")){					// Num5 > 35
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_TODO");
				ShowMsg_("MSG_NPC_TODO");			// �u���S�̊č����ւ� �ړ����u�Ɍ������ɂ�
				KeyInputWait_();
				CloseMsgWnd_();
			}
		}
	}

	// ���V���o�[
	if(target == g_silver){
		if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){									// Num0 = 4
			if(ice_event_num > GetFlagID_("CONST_SS_IF_MOVE_THE_WORLD_4")){					// Num5 > 35
				OpenMsgWnd_();
				SetTalkName_("NAME_TAG_SILVER");
				ShowMsg_("MSG_NPC_SILV");			// �u������ ����Ń��L���Ɖ������
				KeyInputWait_();
				CloseMsgWnd_();
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
	local main_num			= GetNumFlg_("NUM_SCENARIO_MAIN");							// Num0
	local ice_event_num		= GetNumFlg_("NUM_SCENARIO_SUB_ICE");						// Num5

	local target = GetTouchEventMineId_();

	switch ( target ) {
	//�A�[�U���[�N�ɋ߂Â��ƍĐ킷��n��
	case g_mine06:
		if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){								// Num0 = 4
			if(ice_event_num == GetFlagID_("CONST_SS_IF_RE_CONTACT_AZAMUKU")){			// Num5 = 24
				DeleteEventMine_(g_mine06);
				SetNumFlg_("NUM_SCENARIO_SUB_ICE",GetFlagID_("CONST_SS_IF_PRE_REMATCH_AZAMUKU"));// Num5 <- 25
				// 320[�A�[�U���[�N�Đ�]
				TouchNpcChangeDemo(320);
			}
		}
		break;

	//�������ő���ɏ�������A�N�^�[�𒲂ׂ�n��
	case g_mine01:
		if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){								// Num0 = 4
			if(ice_event_num == GetFlagID_("CONST_SS_IF_EXAMINE_THE_PEDESTAL")){		// Num5 = 27
				DeleteEventMine_(g_mine01);
				SetNumFlg_("NUM_SCENARIO_SUB_ICE",GetFlagID_("CONST_SS_IF_DARK_MASTER_DEMO_1"));// Num5 <- 28
				// 322[�_�[�N�}�X�^�[�̒���]
				TouchNpcChangeDemo(322);
			}
		}
		break;

	//���L���̃��A�N�^�[�𒲂ׂ�n��
	case g_mine04:
		if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){								// Num0 = 4
			if(ice_event_num == GetFlagID_("CONST_SS_IF_DARK_MASTER_DEMO_3")){			// Num5 = 30
				DeleteEventMine_(g_mine04);
				SetNumFlg_("NUM_SCENARIO_SUB_ICE",GetFlagID_("CONST_SS_IF_EXAMINE_BROKEN_SCREEN"));// Num5 <- 31
				// �f���̕��A�ʒu
				//SetReturnDemoPosDir_(Vec3(-142.133, 81.652, -284.167), 170);
				// 325[���L���̃��b�Z�[�W]
				TouchNpcChangeDemo(325);
			}
		}
		break;

	//�T�u�V�X�e���𒲂ׂ�n��
	case g_mine05:
		if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){								// Num0 = 4
			if(ice_event_num == GetFlagID_("CONST_SS_IF_EXAMINE_BROKEN_SCREEN")){				// Num5 = 31
				DeleteEventMine_(g_mine05);
				SetNumFlg_("NUM_SCENARIO_SUB_ICE", GetFlagID_("CONST_SS_IF_MOVE_THE_WORLD_4"));// Num5 <- 35
				// 327[���E�ړ����\�ɇA]
				TouchNpcChangeDemo(327);
			}
		}
		break;

	//�������ŉ�ꂽ�f�B�X�v���C�𒲂ׂ�n��
	case g_mine03:
		if(main_num == GetFlagID_("CONST_SM_ICE_FIELD")){								// Num0 = 4
			if(ice_event_num >= GetFlagID_("CONST_SS_IF_DARK_MASTER_DEMO_3")){			// Num5 >= 30
				CommPlayerTurnAroundObj(g_gmk_rukia_rec);
				//�V�X�e�����b�Z�[�W
				OpenMsgWnd_();
				ShowMsg_("MSG_DEMO324_AFTER_SYS");
				KeyInputWait_();
				CloseMsgWnd_();
			}
		}
		else if(main_num >= GetFlagID_("CONST_SM_PRISON")){								// Num0 >= 5
				CommPlayerTurnAroundObj(g_gmk_rukia_rec);
				//�V�X�e�����b�Z�[�W
				OpenMsgWnd_();
				ShowMsg_("MSG_DEMO324_AFTER_SYS");
				KeyInputWait_();
				CloseMsgWnd_();
		}
		break;

	//���[���|�C���g(�{�X��O)
	case g_mine_ruler01:
		CommPlayerTurnAroundObj(g_gmk_rulerpoint);
		CommRulerPointEvent(g_gmk_rulerpoint, "BFG_RULER_ADD_016", "g_rulerpoint"); 
		break;

	default:
		DebugPrint("�ݒu����Ă��Ȃ��n���ɐڐG���肵�Ă��܂��I");
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
	local main_num			= GetNumFlg_("NUM_SCENARIO_MAIN");							// Num0
	local ice_event_num		= GetNumFlg_("NUM_SCENARIO_SUB_ICE");						// Num5

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


